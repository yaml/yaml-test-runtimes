use std::io::{self, Read};

use yaml_rust::{
    parser::{Event, EventReceiver, Parser},
    scanner::TScalarStyle,
};

fn main() -> Result<(), Box<dyn std::error::Error>> {
    let mut data = String::new();
    io::stdin().read_to_string(&mut data)?;
    Parser::new(data.chars())
        .load(&mut Reporter::new(), true)?;
    Ok(())
}

struct Reporter;

impl Reporter {
    fn new() -> Self {
        Self
    }
}

impl EventReceiver for Reporter {
    fn on_event(&mut self, ev: Event) {
        let line: String = match ev {
            Event::StreamStart => "+STR".into(),
            Event::StreamEnd => "-STR".into(),

            Event::DocumentStart => "+DOC".into(),
            Event::DocumentEnd => "-DOC".into(),

            Event::SequenceStart(idx) => format!("+SEQ{}", format_index(idx)),
            Event::SequenceEnd => "-SEQ".into(),

            Event::MappingStart(idx) => format!("+MAP{}", format_index(idx)),
            Event::MappingEnd => "-MAP".into(),

            Event::Scalar(ref text, style, idx, ref tag) => {
                let kind = match style {
                    TScalarStyle::Plain => ":",
                    TScalarStyle::SingleQuoted => "'",
                    TScalarStyle::DoubleQuoted => r#"""#,
                    TScalarStyle::Literal => "|",
                    TScalarStyle::Foled => ">",
                    TScalarStyle::Any => unreachable!(),
                };
                let tag = if let Some(tag) = tag {
                    format!(" <{:?}>", tag)
                } else {
                    "".into()
                };
                format!("=VAL{}{} {}{}", format_index(idx), tag, kind, text)
            }
            Event::Alias(idx) => format!("=ALI *{}", idx),
            _ => return,
        };
        println!("{}", line);
    }
}

fn format_index(idx: usize) -> String {
    if idx > 0 {
        format!(" &{}", idx)
    } else {
        "".into()
    }
}
