// Wrapper for bs58 library
// This file provides a common interface for base58 encoding/decoding
// used by the InvoiceRequest and InvoicePay components

import bs58 from "bs58";

// Export the bs58 library as default
export default bs58;

// Also export individual functions for convenience
export const encode = bs58.encode.bind(bs58);
export const decode = bs58.decode.bind(bs58);