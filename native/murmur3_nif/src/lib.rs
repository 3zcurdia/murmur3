use std::io::Cursor;

#[rustler::nif]
fn gen32(input: String, seed: u32) -> u32 {
    murmur3::murmur3_32(&mut Cursor::new(input.into_bytes()), seed).unwrap()
}

#[rustler::nif]
fn gen_x64(input: String, seed: u32) -> String {
    murmur3::murmur3_x64_128(&mut Cursor::new(input.into_bytes()), seed).unwrap().to_string()
}

#[rustler::nif]
fn gen_x86(input: String, seed: u32) -> String {
    murmur3::murmur3_x86_128(&mut Cursor::new(input.into_bytes()), seed).unwrap().to_string()
}

rustler::init!("Elixir.Murmur3.Wrapper", [gen32, gen_x64, gen_x86]);
