###############################################################################
# File         : fwd_idrt_ex.S
# Project      : EE180 Lab 2: MIPS
#
# Standards/Formatting:
#   MIPS gas, soft tab, 80 column
#
# Description:
#   Test the functionality of forwarding from EX to ID.Rt
#
###############################################################################

    .section .boot, "x"
    .balign 4
    .set    noreorder
    .global boot
    .ent    boot
boot:
    lui     $s0, 0x8002         # Load the base address of the status/test registers
    ori     $s1, $0, 1          # Prepare the 'done' status
    ori     $t2, $0, 0x000f	# added to have immediate # in t2
    nop
    nop
    ori     $t0, $0, 0xfff0
    or      $t1, $t2, $t0	# changed to test fwd_idrt_ex
    nop
    nop
    nop
    nop
    nop
    xori    $t2, $t1, 0xfffe
    nop
    nop
    nop
    nop
    nop
    sw      $t2, 4($s0)         # Set the test result
    sw      $s1, 0($s0)         # Set 'done'

$done:
    j       $done
    nop

    .end boot
