//
//  CPUSubtype.swift
//  macchiato
//
//  Created by Hossein Monjezi on 18.01.25.
//

import Foundation

/// Possible CPU Subtype values in Mach-O binary, containing the exact value as associate type.
public enum CPUSubtype {
    case multiple(UInt32)

    // VAX subtypes.
    case vax_all(UInt32)
    case vax780(UInt32)
    case vax785(UInt32)
    case vax750(UInt32)
    case uvaxi(UInt32)
    case uvaxii(UInt32)
    case vax8200(UInt32)
    case vax8500(UInt32)
    case vax8650(UInt32)
    case vax8800(UInt32)
    case uxaxiii(UInt32)

    // ROMP subtypes.
    case rt_all(UInt32)
    case rt_pc(UInt32)
    case rt_apc(UInt32)
    case rt_135(UInt32)

    // 32032/32332/32532 subtypes.
    case nmax_all(UInt32)
    case nmax_dpc(UInt32)
    case sqt(UInt32)
    case nmax_apc_fpu(UInt32)
    case nmax_apc_fpa(UInt32)
    case nmax_xpc(UInt32)

    // i386 subtypes.
    case i386_all(UInt32)
    case i386_486(UInt32)
    case i386_486sx(UInt32)
    case i386_586(UInt32)
    case intel(UInt32)
    case pentium(UInt32)
    case pentiumPro(UInt32)
    case pentium2m3(UInt32)
    case pentium2m5(UInt32)
    case pentium4(UInt32)

    // x86_64 subtypes.
    case x86_64_all(UInt32)
    case x86_64_haswell(UInt32)

    // MIPS subtypes.
    case mips_all(UInt32)
    case mips_r2300(UInt32)
    case mips_r2600(UInt32)
    case mips_r2800(UInt32)
    case mips_r2000a(UInt32)

    // MC680x0 subtypes.
    case mc680x0_all(UInt32)
    case mc68030(UInt32)
    case mc68040(UInt32)
    case mc68030_only(UInt32)

    // HPPA subtypes.
    case hppa_7100_all(UInt32)
    case hppa_7100lc(UInt32)

    // ARM subtypes.
    case arm_all(UInt32)
    case arm_a500_arch(UInt32)
    case arm_a500(UInt32)
    case arm_a440(UInt32)
    case arm_m4(UInt32)
    case arm_v4t(UInt32)
    case arm_v6(UInt32)
    case arm_v5tej(UInt32)
    case arm_xscale(UInt32)
    case arm_v7(UInt32)
    case arm_v7f(UInt32)
    case arm_v7s(UInt32)
    case arm_v7k(UInt32)
    case arm_v6m(UInt32)
    case arm_v7m(UInt32)
    case arm_v7em(UInt32)
    case arm_v8(UInt32)

    // ARM64 subtypes.
    case arm64_all(UInt32)
    case arm64_v8(UInt32)

    // MC88000 subtypes.
    case mc88000_all(UInt32)
    case mc88100_mmax_jpc(UInt32)
    case mc88110(UInt32)

    // MC98000/PowerPC subtypes.
    case mc98000_powerpc_all(UInt32)
    case mc98601_powerpc_601(UInt32)
    case powerpc602(UInt32)
    case powerpc603(UInt32)
    case powerpc603e(UInt32)
    case powerpc603ev(UInt32)
    case powerpc604(UInt32)
    case powerpc604e(UInt32)
    case powerpc620(UInt32)
    case powerpc750(UInt32)
    case powerpc7400(UInt32)
    case powerpc7450(UInt32)
    case powerpc_powerpc64_970(UInt32)

    // i860 Big Endian subtypes.
    case i860_bigEndian_all(UInt32)
    case i860_bigEndian_860(UInt32)

    // i860 Little Endian subtypes.
    case i860_littleEndian_all(UInt32)
    case i860_littleEndian(UInt32)

    // RS6000 subtypes.
    case rs6000_all(UInt32)
    case rs6000(UInt32)

    // SPARC subtypes.
    case sparc_all(UInt32)

    // VEO subtypes.
    case veo_1(UInt32)
    case veo_2(UInt32)
    case veo_3(UInt32)
    case veo_4(UInt32)

    init?(cpuType: CPUType, rawSubtypeValue: UInt32) {
        if rawSubtypeValue == 0xFFFFFFFF {
            self = .multiple(rawSubtypeValue)
        }

        // Removing the high bit as it indicates special requirements on the binary
        let noHighBitRawSubtype = 0x7FFFFFFF & rawSubtypeValue

        switch cpuType {
        case .vax:
            switch noHighBitRawSubtype {
            case 0x0:
                self = .vax_all(rawSubtypeValue)
            case 0x1:
                self = .vax780(rawSubtypeValue)
            case 0x2:
                self = .vax785(rawSubtypeValue)
            case 0x3:
                self = .vax750(rawSubtypeValue)
            case 0x4:
                self = .uvaxi(rawSubtypeValue)
            case 0x5:
                self = .uvaxii(rawSubtypeValue)
            case 0x7:
                self = .vax8200(rawSubtypeValue)
            case 0x8:
                self = .vax8500(rawSubtypeValue)
            case 0xA:
                self = .vax8650(rawSubtypeValue)
            case 0xB:
                self = .vax8800(rawSubtypeValue)
            case 0xC:
                self = .uxaxiii(rawSubtypeValue)
            default:
                return nil
            }

        case .romp:
            switch noHighBitRawSubtype {
            case 0x0:
                self = .rt_all(rawSubtypeValue)
            case 0x1:
                self = .rt_pc(rawSubtypeValue)
            case 0x2:
                self = .rt_apc(rawSubtypeValue)
            case 0x3:
                self = .rt_135(rawSubtypeValue)
            default:
                return nil
            }

        case .ns32032, .ns32332, .ns32532:
            switch noHighBitRawSubtype {
            case 0x0:
                self = .nmax_all(rawSubtypeValue)
            case 0x1:
                self = .nmax_dpc(rawSubtypeValue)
            case 0x2:
                self = .sqt(rawSubtypeValue)
            case 0x3:
                self = .nmax_apc_fpu(rawSubtypeValue)
            case 0x4:
                self = .nmax_apc_fpa(rawSubtypeValue)
            case 0x5:
                self = .nmax_xpc(rawSubtypeValue)
            default:
                return nil
            }

        case .i386:
            switch noHighBitRawSubtype {
            case 0x3:
                self = .i386_all(rawSubtypeValue)
            case 0x5:
                self = .pentium(rawSubtypeValue)
            case 0x16:
                self = .pentiumPro(rawSubtypeValue)
            case 0x36:
                self = .pentium2m3(rawSubtypeValue)
            case 0x56:
                self = .pentium2m5(rawSubtypeValue)
            case 0xA:
                self = .pentium4(rawSubtypeValue)
            default:
                return nil
            }

        case .x86_64:
            switch noHighBitRawSubtype {
            case 0x3:
                self = .x86_64_all(rawSubtypeValue)
            case 0x8:
                self = .x86_64_haswell(rawSubtypeValue)
            default:
                return nil
            }

        case .mips:
            switch noHighBitRawSubtype {
            case 0x0:
                self = .mips_all(rawSubtypeValue)
            case 0x1:
                self = .mips_r2300(rawSubtypeValue)
            case 0x2:
                self = .mips_r2600(rawSubtypeValue)
            case 0x3:
                self = .mips_r2800(rawSubtypeValue)
            case 0x4:
                self = .mips_r2000a(rawSubtypeValue)
            default:
                return nil
            }

        case .mc680x0:
            switch noHighBitRawSubtype {
            case 0x0:
                self = .mc680x0_all(rawSubtypeValue)
            case 0x1:
                self = .mc68030(rawSubtypeValue)
            case 0x2:
                self = .mc68040(rawSubtypeValue)
            case 0x3:
                self = .mc68030_only(rawSubtypeValue)
            default:
                return nil
            }

        case .hppa:
            switch noHighBitRawSubtype {
            case 0x0:
                self = .hppa_7100_all(rawSubtypeValue)
            case 0x1:
                self = .hppa_7100lc(rawSubtypeValue)
            default:
                return nil
            }

        case .arm:
            switch noHighBitRawSubtype {
            case 0x0:
                self = .arm_all(rawSubtypeValue)
            case 0x1:
                self = .arm_a500_arch(rawSubtypeValue)
            case 0x2:
                self = .arm_a500(rawSubtypeValue)
            case 0x3:
                self = .arm_a440(rawSubtypeValue)
            case 0x4:
                self = .arm_m4(rawSubtypeValue)
            case 0x5:
                self = .arm_v4t(rawSubtypeValue)
            case 0x6:
                self = .arm_v6(rawSubtypeValue)
            case 0x7:
                self = .arm_v5tej(rawSubtypeValue)
            case 0x8:
                self = .arm_xscale(rawSubtypeValue)
            case 0x9:
                self = .arm_v7(rawSubtypeValue)
            case 0xA:
                self = .arm_v7f(rawSubtypeValue)
            case 0xB:
                self = .arm_v7s(rawSubtypeValue)
            case 0xC:
                self = .arm_v7k(rawSubtypeValue)
            case 0xE:
                self = .arm_v6m(rawSubtypeValue)
            case 0xF:
                self = .arm_v7m(rawSubtypeValue)
            case 0x10:
                self = .arm_v7em(rawSubtypeValue)
            case 0xD:
                self = .arm_v8(rawSubtypeValue)
            default:
                return nil
            }

        case .arm64:
            switch noHighBitRawSubtype {
            case 0x0:
                self = .arm64_all(rawSubtypeValue)
            case 0x1:
                self = .arm64_v8(rawSubtypeValue)
            default:
                return nil
            }

        case .mc88000:
            switch noHighBitRawSubtype {
            case 0x0:
                self = .mc88000_all(rawSubtypeValue)
            case 0x1:
                self = .mc88100_mmax_jpc(rawSubtypeValue)
            case 0x2:
                self = .mc88110(rawSubtypeValue)
            default:
                return nil
            }

        case .sparc:
            switch noHighBitRawSubtype {
            case 0x0:
                self = .sparc_all(rawSubtypeValue)
            default:
                return nil
            }

        case .i860_bigEndian:
            switch noHighBitRawSubtype {
            case 0x0:
                self = .i860_bigEndian_all(rawSubtypeValue)
            case 0x1:
                self = .i860_bigEndian_860(rawSubtypeValue)
            default:
                return nil
            }

        case .i860_littleEndian:
            switch noHighBitRawSubtype {
            case 0x0:
                self = .i860_littleEndian_all(rawSubtypeValue)
            case 0x1:
                self = .i860_littleEndian(rawSubtypeValue)
            default:
                return nil
            }

        case .rs6000:
            switch noHighBitRawSubtype {
            case 0x0:
                self = .rs6000_all(rawSubtypeValue)
            case 0x1:
                self = .rs6000(rawSubtypeValue)
            default:
                return nil
            }

        case .mc98000_powerpc, .powerpc64:
            switch noHighBitRawSubtype {
            case 0x0:
                self = .mc98000_powerpc_all(rawSubtypeValue)
            case 0x1:
                self = .mc98601_powerpc_601(rawSubtypeValue)
            case 0x2:
                self = .powerpc602(rawSubtypeValue)
            case 0x3:
                self = .powerpc603(rawSubtypeValue)
            case 0x4:
                self = .powerpc603e(rawSubtypeValue)
            case 0x5:
                self = .powerpc603ev(rawSubtypeValue)
            case 0x6:
                self = .powerpc604(rawSubtypeValue)
            case 0x7:
                self = .powerpc604e(rawSubtypeValue)
            case 0x8:
                self = .powerpc620(rawSubtypeValue)
            case 0x9:
                self = .powerpc750(rawSubtypeValue)
            case 0xA:
                self = .powerpc7400(rawSubtypeValue)
            case 0xB:
                self = .powerpc7450(rawSubtypeValue)
            case 0x64:
                self = .powerpc_powerpc64_970(rawSubtypeValue)
            default:
                return nil
            }

        case .veo:
            switch noHighBitRawSubtype {
            case 0x1:
                self = .veo_1(rawSubtypeValue)
            case 0x2:
                self = .veo_2(rawSubtypeValue)
            case 0x3:
                self = .veo_3(rawSubtypeValue)
            case 0x4:
                self = .veo_4(rawSubtypeValue)
            default:
                return nil
            }

        default:
            return nil
        }
    }

    /// Returns the CPU subtype value of the Mach-O binary.
    var rawValue: UInt32 {
        switch self {
        case .multiple(let rawCPUSubtypeValue),

                // VAX subtypes.
                .vax_all(let rawCPUSubtypeValue),
                .vax780(let rawCPUSubtypeValue),
                .vax785(let rawCPUSubtypeValue),
                .vax750(let rawCPUSubtypeValue),
                .uvaxi(let rawCPUSubtypeValue),
                .uvaxii(let rawCPUSubtypeValue),
                .vax8200(let rawCPUSubtypeValue),
                .vax8500(let rawCPUSubtypeValue),
                .vax8650(let rawCPUSubtypeValue),
                .vax8800(let rawCPUSubtypeValue),
                .uxaxiii(let rawCPUSubtypeValue),

                // ROMP subtypes.
                .rt_all(let rawCPUSubtypeValue),
                .rt_pc(let rawCPUSubtypeValue),
                .rt_apc(let rawCPUSubtypeValue),
                .rt_135(let rawCPUSubtypeValue),

                // 32032/32332/32532 subtypes.
                .nmax_all(let rawCPUSubtypeValue),
                .nmax_dpc(let rawCPUSubtypeValue),
                .sqt(let rawCPUSubtypeValue),
                .nmax_apc_fpu(let rawCPUSubtypeValue),
                .nmax_apc_fpa(let rawCPUSubtypeValue),
                .nmax_xpc(let rawCPUSubtypeValue),

                // i386 subtypes.
                .i386_all(let rawCPUSubtypeValue),
                .i386_486(let rawCPUSubtypeValue),
                .i386_486sx(let rawCPUSubtypeValue),
                .i386_586(let rawCPUSubtypeValue),
                .intel(let rawCPUSubtypeValue),
                .pentium(let rawCPUSubtypeValue),
                .pentiumPro(let rawCPUSubtypeValue),
                .pentium2m3(let rawCPUSubtypeValue),
                .pentium2m5(let rawCPUSubtypeValue),
                .pentium4(let rawCPUSubtypeValue),

                // x86_64 subtypes.
                .x86_64_all(let rawCPUSubtypeValue),
                .x86_64_haswell(let rawCPUSubtypeValue),

                // MIPS subtypes.
                .mips_all(let rawCPUSubtypeValue),
                .mips_r2300(let rawCPUSubtypeValue),
                .mips_r2600(let rawCPUSubtypeValue),
                .mips_r2800(let rawCPUSubtypeValue),
                .mips_r2000a(let rawCPUSubtypeValue),

                // MC680x0 subtypes.
                .mc680x0_all(let rawCPUSubtypeValue),
                .mc68030(let rawCPUSubtypeValue),
                .mc68040(let rawCPUSubtypeValue),
                .mc68030_only(let rawCPUSubtypeValue),

                // HPPA subtypes.
                .hppa_7100_all(let rawCPUSubtypeValue),
                .hppa_7100lc(let rawCPUSubtypeValue),

                // ARM subtypes.
                .arm_all(let rawCPUSubtypeValue),
                .arm_a500_arch(let rawCPUSubtypeValue),
                .arm_a500(let rawCPUSubtypeValue),
                .arm_a440(let rawCPUSubtypeValue),
                .arm_m4(let rawCPUSubtypeValue),
                .arm_v4t(let rawCPUSubtypeValue),
                .arm_v6(let rawCPUSubtypeValue),
                .arm_v5tej(let rawCPUSubtypeValue),
                .arm_xscale(let rawCPUSubtypeValue),
                .arm_v7(let rawCPUSubtypeValue),
                .arm_v7f(let rawCPUSubtypeValue),
                .arm_v7s(let rawCPUSubtypeValue),
                .arm_v7k(let rawCPUSubtypeValue),
                .arm_v6m(let rawCPUSubtypeValue),
                .arm_v7m(let rawCPUSubtypeValue),
                .arm_v7em(let rawCPUSubtypeValue),
                .arm_v8(let rawCPUSubtypeValue),

                // ARM64 subtypes.
                .arm64_all(let rawCPUSubtypeValue),
                .arm64_v8(let rawCPUSubtypeValue),

                // MC88000 subtypes.
                .mc88000_all(let rawCPUSubtypeValue),
                .mc88100_mmax_jpc(let rawCPUSubtypeValue),
                .mc88110(let rawCPUSubtypeValue),

                // MC98000/PowerPC subtypes.
                .mc98000_powerpc_all(let rawCPUSubtypeValue),
                .mc98601_powerpc_601(let rawCPUSubtypeValue),
                .powerpc602(let rawCPUSubtypeValue),
                .powerpc603(let rawCPUSubtypeValue),
                .powerpc603e(let rawCPUSubtypeValue),
                .powerpc603ev(let rawCPUSubtypeValue),
                .powerpc604(let rawCPUSubtypeValue),
                .powerpc604e(let rawCPUSubtypeValue),
                .powerpc620(let rawCPUSubtypeValue),
                .powerpc750(let rawCPUSubtypeValue),
                .powerpc7400(let rawCPUSubtypeValue),
                .powerpc7450(let rawCPUSubtypeValue),
                .powerpc_powerpc64_970(let rawCPUSubtypeValue),

                // i860 Big Endian subtypes.
                .i860_bigEndian_all(let rawCPUSubtypeValue),
                .i860_bigEndian_860(let rawCPUSubtypeValue),

                // i860 Little Endian subtypes.
                .i860_littleEndian_all(let rawCPUSubtypeValue),
                .i860_littleEndian(let rawCPUSubtypeValue),

                // RS6000 subtypes.
                .rs6000_all(let rawCPUSubtypeValue),
                .rs6000(let rawCPUSubtypeValue),

                // SPARC subtypes.
                .sparc_all(let rawCPUSubtypeValue),

                // VEO subtypes.
                .veo_1(let rawCPUSubtypeValue),
                .veo_2(let rawCPUSubtypeValue),
                .veo_3(let rawCPUSubtypeValue),
                .veo_4(let rawCPUSubtypeValue):
            return rawCPUSubtypeValue
        }
    }

    /// Returns `true` if the CPU subtype value has the most significant bit set to `1`, otherwise returns `false`.
    var hasMSBSet: Bool {
        switch self {
        case .multiple(let rawCPUSubtypeValue),

                // VAX subtypes.
                .vax_all(let rawCPUSubtypeValue),
                .vax780(let rawCPUSubtypeValue),
                .vax785(let rawCPUSubtypeValue),
                .vax750(let rawCPUSubtypeValue),
                .uvaxi(let rawCPUSubtypeValue),
                .uvaxii(let rawCPUSubtypeValue),
                .vax8200(let rawCPUSubtypeValue),
                .vax8500(let rawCPUSubtypeValue),
                .vax8650(let rawCPUSubtypeValue),
                .vax8800(let rawCPUSubtypeValue),
                .uxaxiii(let rawCPUSubtypeValue),

                // ROMP subtypes.
                .rt_all(let rawCPUSubtypeValue),
                .rt_pc(let rawCPUSubtypeValue),
                .rt_apc(let rawCPUSubtypeValue),
                .rt_135(let rawCPUSubtypeValue),

                // 32032/32332/32532 subtypes.
                .nmax_all(let rawCPUSubtypeValue),
                .nmax_dpc(let rawCPUSubtypeValue),
                .sqt(let rawCPUSubtypeValue),
                .nmax_apc_fpu(let rawCPUSubtypeValue),
                .nmax_apc_fpa(let rawCPUSubtypeValue),
                .nmax_xpc(let rawCPUSubtypeValue),

                // i386 subtypes.
                .i386_all(let rawCPUSubtypeValue),
                .i386_486(let rawCPUSubtypeValue),
                .i386_486sx(let rawCPUSubtypeValue),
                .i386_586(let rawCPUSubtypeValue),
                .intel(let rawCPUSubtypeValue),
                .pentium(let rawCPUSubtypeValue),
                .pentiumPro(let rawCPUSubtypeValue),
                .pentium2m3(let rawCPUSubtypeValue),
                .pentium2m5(let rawCPUSubtypeValue),
                .pentium4(let rawCPUSubtypeValue),

                // x86_64 subtypes.
                .x86_64_all(let rawCPUSubtypeValue),
                .x86_64_haswell(let rawCPUSubtypeValue),

                // MIPS subtypes.
                .mips_all(let rawCPUSubtypeValue),
                .mips_r2300(let rawCPUSubtypeValue),
                .mips_r2600(let rawCPUSubtypeValue),
                .mips_r2800(let rawCPUSubtypeValue),
                .mips_r2000a(let rawCPUSubtypeValue),

                // MC680x0 subtypes.
                .mc680x0_all(let rawCPUSubtypeValue),
                .mc68030(let rawCPUSubtypeValue),
                .mc68040(let rawCPUSubtypeValue),
                .mc68030_only(let rawCPUSubtypeValue),

                // HPPA subtypes.
                .hppa_7100_all(let rawCPUSubtypeValue),
                .hppa_7100lc(let rawCPUSubtypeValue),

                // ARM subtypes.
                .arm_all(let rawCPUSubtypeValue),
                .arm_a500_arch(let rawCPUSubtypeValue),
                .arm_a500(let rawCPUSubtypeValue),
                .arm_a440(let rawCPUSubtypeValue),
                .arm_m4(let rawCPUSubtypeValue),
                .arm_v4t(let rawCPUSubtypeValue),
                .arm_v6(let rawCPUSubtypeValue),
                .arm_v5tej(let rawCPUSubtypeValue),
                .arm_xscale(let rawCPUSubtypeValue),
                .arm_v7(let rawCPUSubtypeValue),
                .arm_v7f(let rawCPUSubtypeValue),
                .arm_v7s(let rawCPUSubtypeValue),
                .arm_v7k(let rawCPUSubtypeValue),
                .arm_v6m(let rawCPUSubtypeValue),
                .arm_v7m(let rawCPUSubtypeValue),
                .arm_v7em(let rawCPUSubtypeValue),
                .arm_v8(let rawCPUSubtypeValue),

                // ARM64 subtypes.
                .arm64_all(let rawCPUSubtypeValue),
                .arm64_v8(let rawCPUSubtypeValue),

                // MC88000 subtypes.
                .mc88000_all(let rawCPUSubtypeValue),
                .mc88100_mmax_jpc(let rawCPUSubtypeValue),
                .mc88110(let rawCPUSubtypeValue),

                // MC98000/PowerPC subtypes.
                .mc98000_powerpc_all(let rawCPUSubtypeValue),
                .mc98601_powerpc_601(let rawCPUSubtypeValue),
                .powerpc602(let rawCPUSubtypeValue),
                .powerpc603(let rawCPUSubtypeValue),
                .powerpc603e(let rawCPUSubtypeValue),
                .powerpc603ev(let rawCPUSubtypeValue),
                .powerpc604(let rawCPUSubtypeValue),
                .powerpc604e(let rawCPUSubtypeValue),
                .powerpc620(let rawCPUSubtypeValue),
                .powerpc750(let rawCPUSubtypeValue),
                .powerpc7400(let rawCPUSubtypeValue),
                .powerpc7450(let rawCPUSubtypeValue),
                .powerpc_powerpc64_970(let rawCPUSubtypeValue),

                // i860 Big Endian subtypes.
                .i860_bigEndian_all(let rawCPUSubtypeValue),
                .i860_bigEndian_860(let rawCPUSubtypeValue),

                // i860 Little Endian subtypes.
                .i860_littleEndian_all(let rawCPUSubtypeValue),
                .i860_littleEndian(let rawCPUSubtypeValue),

                // RS6000 subtypes.
                .rs6000_all(let rawCPUSubtypeValue),
                .rs6000(let rawCPUSubtypeValue),

                // SPARC subtypes.
                .sparc_all(let rawCPUSubtypeValue),

                // VEO subtypes.
                .veo_1(let rawCPUSubtypeValue),
                .veo_2(let rawCPUSubtypeValue),
                .veo_3(let rawCPUSubtypeValue),
                .veo_4(let rawCPUSubtypeValue):
            return (rawCPUSubtypeValue & 0x7FFFFFFF) != 0
        }
    }
}
