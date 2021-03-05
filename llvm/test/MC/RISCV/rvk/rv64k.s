# RUN: llvm-mc -triple=riscv64 -show-encoding --mattr=+experimental-k %s \
# RUN:      | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INST

# RUN: not llvm-mc -triple=riscv64 -show-encoding %s 2>&1 \
# RUN:      | FileCheck %s --check-prefix=CHECK-ERROR

# RUN: llvm-mc -triple=riscv64 -filetype=obj --mattr=+experimental-k %s \
# RUN:      | llvm-objdump -d --mattr=+experimental-k - \
# RUN:      | FileCheck %s --check-prefix=CHECK-INST

# RUN: llvm-mc -triple=riscv64 -filetype=obj --mattr=+experimental-k %s \
# RUN:      | llvm-objdump -d - | FileCheck %s --check-prefix=CHECK-UNKNOWN

sha256sum0 a0, a1
# CHECK-INST: sha256sum0 a0, a1
# CHECK-ENCODING: [0x13,0x95,0x05,0x10]
# CHECK-ERROR: instruction requires the following: 'K' (Scalar Cryptography Instructions)
# CHECK-UNKNOWN: 13 95 05 10 <unknown>

sha256sum1 a0, a1
# CHECK-INST: sha256sum1 a0, a1
# CHECK-ENCODING: [0x13,0x95,0x15,0x10]
# CHECK-ERROR: instruction requires the following: 'K' (Scalar Cryptography Instructions)
# CHECK-UNKNOWN: 13 95 15 10 <unknown>

sha256sig0 a0, a1
# CHECK-INST: sha256sig0 a0, a1
# CHECK-ENCODING: [0x13,0x95,0x25,0x10]
# CHECK-ERROR: instruction requires the following: 'K' (Scalar Cryptography Instructions)
# CHECK-UNKNOWN: 13 95 25 10 <unknown>

sha256sig1 a0, a1
# CHECK-INST: sha256sig1 a0, a1
# CHECK-ENCODING: [0x13,0x95,0x35,0x10]
# CHECK-ERROR: instruction requires the following: 'K' (Scalar Cryptography Instructions)
# CHECK-UNKNOWN: 13 95 35 10 <unknown>

sm3p0 a0, a1
# CHECK-INST: sm3p0 a0, a1
# CHECK-ENCODING: [0x13,0x95,0x85,0x10]
# CHECK-ERROR: instruction requires the following: 'K' (Scalar Cryptography Instructions)
# CHECK-UNKNOWN: 13 95 85 10 <unknown>

sm3p1 a0, a1
# CHECK-INST: sm3p1 a0, a1
# CHECK-ENCODING: [0x13,0x95,0x95,0x10]
# CHECK-ERROR: instruction requires the following: 'K' (Scalar Cryptography Instructions)
# CHECK-UNKNOWN: 13 95 95 10 <unknown>

getnoise a0
# CHECK-INST: csrr a0, mnoise 
# CHECK-ENCODING: [0x73,0x25,0x90,0x7a]
# CHECK-ERROR: instruction requires the following: 'K' (Scalar Cryptography Instructions)
# CHECK-UNKNOWN: 73 25 90 7a

pollentropy a0
# CHECK-INST: csrr a0, mentropy
# CHECK-ENCODING: [0x73,0x25,0x50,0xf1]
# CHECK-ERROR: instruction requires the following: 'K' (Scalar Cryptography Instructions)
# CHECK-UNKNOWN: 73 25 50 f1

# RV64 only

sha512sum0 a0, a1
# CHECK-INST: sha512sum0 a0, a1
# CHECK-ENCODING: [0x13,0x95,0x45,0x10]
# CHECK-ERROR: instruction requires the following: 'K' (Scalar Cryptography Instructions)
# CHECK-UNKNOWN: 13 95 45 10 <unknown>

sha512sum1 a0, a1
# CHECK-INST: sha512sum1 a0, a1
# CHECK-ENCODING: [0x13,0x95,0x55,0x10]
# CHECK-ERROR: instruction requires the following: 'K' (Scalar Cryptography Instructions)
# CHECK-UNKNOWN: 13 95 55 10 <unknown>

sha512sig0 a0, a1
# CHECK-INST: sha512sig0 a0, a1
# CHECK-ENCODING: [0x13,0x95,0x65,0x10]
# CHECK-ERROR: instruction requires the following: 'K' (Scalar Cryptography Instructions)
# CHECK-UNKNOWN: 13 95 65 10 <unknown>

sha512sig1 a0, a1
# CHECK-INST: sha512sig1 a0, a1
# CHECK-ENCODING: [0x13,0x95,0x75,0x10]
# CHECK-ERROR: instruction requires the following: 'K' (Scalar Cryptography Instructions)
# CHECK-UNKNOWN: 13 95 75 10 <unknown>

aes64im a0, a1
# CHECK-INST: aes64im a0, a1
# CHECK-ENCODING: [0x13,0x95,0x05,0x30]
# CHECK-ERROR: instruction requires the following: 'K' (Scalar Cryptography Instructions)
# CHECK-UNKNOWN: 13 95 05 30 <unknown>

aes64ks2 a0, a1, a2
# CHECK-INST: aes64ks2 a0, a1, a2
# CHECK-ENCODING: [0x33,0x85,0xc5,0x7e]
# CHECK-ERROR: instruction requires the following: 'K' (Scalar Cryptography Instructions)
# CHECK-UNKNOWN: 33 85 c5 7e <unknown>

aes64esm a0, a1, a2
# CHECK-INST: aes64esm a0, a1, a2
# CHECK-ENCODING: [0x33,0x85,0xc5,0x36]
# CHECK-ERROR: instruction requires the following: 'K' (Scalar Cryptography Instructions)
# CHECK-UNKNOWN: 33 85 c5 36 <unknown>

aes64es a0, a1, a2
# CHECK-INST: aes64es a0, a1, a2
# CHECK-ENCODING: [0x33,0x85,0xc5,0x32]
# CHECK-ERROR: instruction requires the following: 'K' (Scalar Cryptography Instructions)
# CHECK-UNKNOWN: 33 85 c5 32 <unknown>

aes64dsm a0, a1, a2
# CHECK-INST: aes64dsm a0, a1, a2
# CHECK-ENCODING: [0x33,0x85,0xc5,0x3e]
# CHECK-ERROR: instruction requires the following: 'K' (Scalar Cryptography Instructions)
# CHECK-UNKNOWN: 33 85 c5 3e <unknown>

aes64es a0, a1, a2
# CHECK-INST: aes64es a0, a1, a2
# CHECK-ENCODING: [0x33,0x85,0xc5,0x32]
# CHECK-ERROR: instruction requires the following: 'K' (Scalar Cryptography Instructions)
# CHECK-UNKNOWN: 33 85 c5 32 <unknown>

aes64ks1i a0, a1, 5
# CHECK-INST: aes64ks1i a0, a1, 5
# CHECK-ENCODING: [0x13,0x95,0x55,0x31]
# CHECK-ERROR: instruction requires the following: 'K' (Scalar Cryptography Instructions)
# CHECK-UNKNOWN: 13 95 55 31 <unknown>
