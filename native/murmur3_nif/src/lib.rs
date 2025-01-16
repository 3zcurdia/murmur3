use rustler::{Encoder, Env, NifResult, Term};
use std::io::Cursor;

mod atoms {
    rustler::atoms! {
        ok,
        error,
    }
}

#[rustler::nif]
fn gen32(env: Env, input: String, seed: u32) -> NifResult<Term<'_>> {
    let result = murmur3::murmur3_32(&mut Cursor::new(input.into_bytes()), seed);
    match result {
        Ok(hash) => Ok((atoms::ok(), hash).encode(env)),
        Err(err) => Ok((atoms::error(), err.to_string()).encode(env)),
    }
}

#[rustler::nif]
fn gen_x64(env: Env, input: String, seed: u32) -> NifResult<Term<'_>> {
    let result = murmur3::murmur3_x64_128(&mut Cursor::new(input.into_bytes()), seed);
    match result {
        Ok(hash) => Ok((atoms::ok(), hash.to_string()).encode(env)),
        Err(err) => Ok((atoms::error(), err.to_string()).encode(env)),
    }
}

#[rustler::nif]
fn gen_x86(env: Env, input: String, seed: u32) -> NifResult<Term<'_>> {
    let result = murmur3::murmur3_x86_128(&mut Cursor::new(input.into_bytes()), seed);
    match result {
        Ok(hash) => Ok((atoms::ok(), hash.to_string()).encode(env)),
        Err(err) => Ok((atoms::error(), err.to_string()).encode(env)),
    }
}

rustler::init!("Elixir.Murmur3.Wrapper", [gen32, gen_x64, gen_x86]);
