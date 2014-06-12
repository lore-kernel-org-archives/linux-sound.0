From: Mark Haidekker <mhaidekker.uga@gmail.com>
Date: Thu, 12 Jun 2014 20:05:40 +0000
Subject: PROBLEM: Audigy front-panel UART fails to initialize (with solution)
Message-Id: <1450983.ggdYK9ybnR@silencio>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: linux-sound@vger.kernel.org

All:

I hope I am doing this right, the instructions for submitting kernel bug=20
reports are a bit confusing. I have been redirected here, because I reporte=
d=20
Bug #1328746 on Launchpad, and the bug was identified as an upstream issue.=
=20
With this e-mail, I am following the instructions here:

https://wiki.ubuntu.com/Bugs/Upstream/kernel



[1.] Soundblaster Audigy front panel MIDI fails to initialize

[2.] The bug concerns the Soundblaster Audigy cards (emu10k1 chip) with fro=
nt=20
panel extension, such as the Audigy ZS Pro. Those cards have two MIDI UARTs=
,=20
the on-board joystick MIDI interface and the optional front-panel module.=20
Under Linux, the front-panel MIDI input does not work. People with dual-boo=
t=20
systems have reported that booting Windows first, then rebooting into Linux=
=20
makes the UART function properly.

The cause for the bug lies in the fact that the front panel MIDI is routed =

through a microcontroller (resides in the front panel module), and this=20
microcontroller needs a defined reset signal once after power-up. Up to thi=
s=20
point, the GPIO _levels_ are initialized correctly, but the reset _pulse_ i=
s=20
never issued. Essentially, the emu10k1 chip's GPIO2 needs to be pulled high=
=20
for a brief interval when the kernle module snd-emu10k1 initializes.

The bug can be reproduced with almost any kernel (I tested this from 2.6.x =
to=20
3.15.0) when the computer is cold-started and booted directly into Linux. I=
=20
also propose a workaround, which is a modified emumpu401.c file that fixes =
the=20
issue.

[3.] (this section empty as per Launchpad instructions)

[4.] $ cat /proc/version
Linux version 3.15.0-031500-lowlatency (apw@gomeisa) (gcc version 4.6.3=20
(Ubuntu/Linaro 4.6.3-1ubuntu5) ) #201406081435 SMP PREEMPT Sun Jun 8 18:44:=
17=20
UTC 2014

[5.] No kernel oops exists

[6.] The problem begins at boot-time, and no script can be used to trigger =
it.

[7.] $ lsb_release -rd=20
Description:    Ubuntu 12.04.4 LTS
Release:        12.04

[7.1.] $ sh ver_linux=20
If some fields are empty or look unusual you may have an old version.
Compare to the current minimal requirements in Documentation/Changes.
=20
Linux cantabile 3.15.0-031500-lowlatency #201406081435 SMP PREEMPT Sun Jun =
8=20
18:44:17 UTC 2014 x86_64 x86_64 x86_64 GNU/Linux
=20
Gnu C                  4.6
Gnu make               3.81
binutils               2.22
util-linux             2.20.1
mount                  support
module-init-tools      3.16
e2fsprogs              1.42
pcmciautils            018
PPP                    2.4.5
Linux C Library        2.15
Dynamic linker (ldd)   2.15
Procps                 3.2.8
Net-tools              1.60
Kbd                    1.15.2
Sh-utils               8.13
wireless-tools         30
Modules Loaded         bnep rfcomm bluetooth rpcsec_gss_krb5 6lowpan_iphc n=
fsd=20
nfsv4 nfs_acl auth_rpcgss nfs fscache lockd sunrpc snd_emu10k1_synth=20
snd_emux_synth snd_seq_virmidi snd_seq_midi_emul snd_emu10k1 snd_ac97_codec=
=20
ac97_bus snd_pcm snd_util_mem snd_hwdep snd_seq_midi snd_rawmidi=20
snd_seq_midi_event snd_seq hid_generic hid_logitech_dj ppdev snd_timer=20
snd_seq_device uas usb_storage parport_pc usbhid snd hid psmouse emu10k1_gp=
=20
serio_raw gameport soundcore edac_core sp5100_tco mac_hid k10temp wmi f7188=
2fg=20
edac_mce_amd i2c_piix4 lp parport pata_acpi firewire_ohci firewire_core r81=
69=20
mii crc_itu_t ahci pata_atiixp libahci pata_jmicron


[7.2.] $ cat /proc/cpuinfo=20
processor       : 0
vendor_id       : AuthenticAMD
cpu family      : 16
model           : 4
model name      : AMD Processor model unknown
stepping        : 2
cpu MHz         : 800.000
cache size      : 512 KB
physical id     : 0
siblings        : 4
core id         : 0
cpu cores       : 4
apicid          : 0
initial apicid  : 0
fpu             : yes
fpu_exception   : yes
cpuid level     : 5
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca =
cmov=20
pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext fxsr_opt pdpe1gb=20
rdtscp lm 3dnowext 3dnow constant_tsc rep_good nopl nonstop_tsc extd_apicid=
=20
pni monitor cx16 popcnt lahf_lm cmp_legacy svm extapic cr8_legacy abm sse4a=
=20
misalignsse 3dnowprefetch osvw ibs skinit wdt hw_pstate npt lbrv svm_lock=20
nrip_save
bogomips        : 5599.89
TLB size        : 1024 4K pages
clflush size    : 64
cache_alignment : 64
address sizes   : 48 bits physical, 48 bits virtual
power management: ts ttp tm stc 100mhzsteps hwpstate

processor       : 1
vendor_id       : AuthenticAMD
cpu family      : 16
model           : 4
model name      : AMD Processor model unknown
stepping        : 2
cpu MHz         : 800.000
cache size      : 512 KB
physical id     : 0
siblings        : 4
core id         : 1
cpu cores       : 4
apicid          : 1
initial apicid  : 1
fpu             : yes
fpu_exception   : yes
cpuid level     : 5
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca =
cmov=20
pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext fxsr_opt pdpe1gb=20
rdtscp lm 3dnowext 3dnow constant_tsc rep_good nopl nonstop_tsc extd_apicid=
=20
pni monitor cx16 popcnt lahf_lm cmp_legacy svm extapic cr8_legacy abm sse4a=
=20
misalignsse 3dnowprefetch osvw ibs skinit wdt hw_pstate npt lbrv svm_lock=20
nrip_save
bogomips        : 5599.89
TLB size        : 1024 4K pages
clflush size    : 64
cache_alignment : 64
address sizes   : 48 bits physical, 48 bits virtual
power management: ts ttp tm stc 100mhzsteps hwpstate

processor       : 2
vendor_id       : AuthenticAMD
cpu family      : 16
model           : 4
model name      : AMD Processor model unknown
stepping        : 2
cpu MHz         : 1600.000
cache size      : 512 KB
physical id     : 0
siblings        : 4
core id         : 2
cpu cores       : 4
apicid          : 2
initial apicid  : 2
fpu             : yes
fpu_exception   : yes
cpuid level     : 5
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca =
cmov=20
pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext fxsr_opt pdpe1gb=20
rdtscp lm 3dnowext 3dnow constant_tsc rep_good nopl nonstop_tsc extd_apicid=
=20
pni monitor cx16 popcnt lahf_lm cmp_legacy svm extapic cr8_legacy abm sse4a=
=20
misalignsse 3dnowprefetch osvw ibs skinit wdt hw_pstate npt lbrv svm_lock=20
nrip_save
bogomips        : 5599.89
TLB size        : 1024 4K pages
clflush size    : 64
cache_alignment : 64
address sizes   : 48 bits physical, 48 bits virtual
power management: ts ttp tm stc 100mhzsteps hwpstate

processor       : 3
vendor_id       : AuthenticAMD
cpu family      : 16
model           : 4
model name      : AMD Processor model unknown
stepping        : 2
cpu MHz         : 800.000
cache size      : 512 KB
physical id     : 0
siblings        : 4
core id         : 3
cpu cores       : 4
apicid          : 3
initial apicid  : 3
fpu             : yes
fpu_exception   : yes
cpuid level     : 5
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca =
cmov=20
pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext fxsr_opt pdpe1gb=20
rdtscp lm 3dnowext 3dnow constant_tsc rep_good nopl nonstop_tsc extd_apicid=
=20
pni monitor cx16 popcnt lahf_lm cmp_legacy svm extapic cr8_legacy abm sse4a=
=20
misalignsse 3dnowprefetch osvw ibs skinit wdt hw_pstate npt lbrv svm_lock=20
nrip_save
bogomips        : 5599.89
TLB size        : 1024 4K pages
clflush size    : 64
cache_alignment : 64
address sizes   : 48 bits physical, 48 bits virtual
power management: ts ttp tm stc 100mhzsteps hwpstate

[7.3.] $ cat /proc/modules=20
bnep 19884 2 - Live 0x0000000000000000
rfcomm 75078 0 - Live 0x0000000000000000
bluetooth 465597 10 bnep,rfcomm, Live 0x0000000000000000
rpcsec_gss_krb5 40513 0 - Live 0x0000000000000000
6lowpan_iphc 18968 1 bluetooth, Live 0x0000000000000000
nfsd 291805 2 - Live 0x0000000000000000
nfsv4 486947 1 - Live 0x0000000000000000
nfs_acl 12883 1 nfsd, Live 0x0000000000000000
auth_rpcgss 60073 2 rpcsec_gss_krb5,nfsd, Live 0x0000000000000000
nfs 252218 2 nfsv4, Live 0x0000000000000000
fscache 64282 2 nfsv4,nfs, Live 0x0000000000000000
lockd 95124 2 nfsd,nfs, Live 0x0000000000000000
sunrpc 305164 17 rpcsec_gss_krb5,nfsd,nfsv4,nfs_acl,auth_rpcgss,nfs,lockd, =

Live 0x0000000000000000
snd_emu10k1_synth 17414 0 - Live 0x0000000000000000
snd_emux_synth 42830 1 snd_emu10k1_synth, Live 0x0000000000000000
snd_seq_virmidi 13525 1 snd_emux_synth, Live 0x0000000000000000
snd_seq_midi_emul 17975 1 snd_emux_synth, Live 0x0000000000000000
snd_emu10k1 162497 1 snd_emu10k1_synth, Live 0x0000000000000000
snd_ac97_codec 135207 1 snd_emu10k1, Live 0x0000000000000000
ac97_bus 12730 1 snd_ac97_codec, Live 0x0000000000000000
snd_pcm 109717 2 snd_emu10k1,snd_ac97_codec, Live 0x0000000000000000
snd_util_mem 14117 2 snd_emux_synth,snd_emu10k1, Live 0x0000000000000000
snd_hwdep 13613 2 snd_emux_synth,snd_emu10k1, Live 0x0000000000000000
snd_seq_midi 13564 0 - Live 0x0000000000000000
snd_rawmidi 30816 3 snd_seq_virmidi,snd_emu10k1,snd_seq_midi, Live=20
0x0000000000000000
snd_seq_midi_event 14899 2 snd_seq_virmidi,snd_seq_midi, Live=20
0x0000000000000000
snd_seq 67636 5=20
snd_emux_synth,snd_seq_virmidi,snd_seq_midi_emul,snd_seq_midi,snd_seq_midi_=
event,=20
Live 0x0000000000000000
hid_generic 12559 0 - Live 0x0000000000000000
hid_logitech_dj 18647 0 - Live 0x0000000000000000
ppdev 17711 0 - Live 0x0000000000000000
snd_timer 30069 3 snd_emu10k1,snd_pcm,snd_seq, Live 0x0000000000000000
snd_seq_device 14497 5=20
snd_emu10k1_synth,snd_emu10k1,snd_seq_midi,snd_rawmidi,snd_seq, Live=20
0x0000000000000000
uas 27672 0 - Live 0x0000000000000000
usb_storage 66862 1 uas, Live 0x0000000000000000
parport_pc 32906 0 - Live 0x0000000000000000
usbhid 53072 0 - Live 0x0000000000000000
snd 74146 10=20
snd_emux_synth,snd_seq_virmidi,snd_emu10k1,snd_ac97_codec,snd_pcm,snd_hwdep=
,snd_rawmidi,snd_seq,snd_timer,snd_seq_device,=20
Live 0x0000000000000000
hid 106436 3 hid_generic,hid_logitech_dj,usbhid, Live 0x0000000000000000
psmouse 113046 0 - Live 0x0000000000000000
emu10k1_gp 12622 0 - Live 0x0000000000000000
serio_raw 13434 0 - Live 0x0000000000000000
gameport 19986 2 emu10k1_gp, Live 0x0000000000000000
soundcore 12680 1 snd, Live 0x0000000000000000
edac_core 63001 0 - Live 0x0000000000000000
sp5100_tco 14134 0 - Live 0x0000000000000000
mac_hid 13275 0 - Live 0x0000000000000000
k10temp 13191 0 - Live 0x0000000000000000
wmi 19379 0 - Live 0x0000000000000000
f71882fg 36181 0 - Live 0x0000000000000000
edac_mce_amd 22792 0 - Live 0x0000000000000000
i2c_piix4 22310 0 - Live 0x0000000000000000
lp 17799 0 - Live 0x0000000000000000
parport 42432 3 ppdev,parport_pc,lp, Live 0x0000000000000000
pata_acpi 13053 0 - Live 0x0000000000000000
firewire_ohci 45251 0 - Live 0x0000000000000000
firewire_core 65209 1 firewire_ohci, Live 0x0000000000000000
r8169 73316 0 - Live 0x0000000000000000
mii 13981 1 r8169, Live 0x0000000000000000
crc_itu_t 12707 1 firewire_core, Live 0x0000000000000000
ahci 30167 0 - Live 0x0000000000000000
pata_atiixp 13279 4 - Live 0x0000000000000000
libahci 32191 1 ahci, Live 0x0000000000000000
pata_jmicron 12775 0 - Live 0x0000000000000000


[7.4.a.] $ cat /proc/ioports=20
0000-0cf7 : PCI Bus 0000:00
  0000-001f : dma1
  0020-0021 : pic1
  0040-0043 : timer0
  0050-0053 : timer1
  0060-0060 : keyboard
  0064-0064 : keyboard
  0070-0071 : rtc0
  0080-008f : dma page reg
  00a0-00a1 : pic2
  00c0-00df : dma2
  00f0-00ff : fpu
  0170-0177 : 0000:00:14.1
    0170-0177 : pata_atiixp
  01f0-01f7 : 0000:00:14.1
    01f0-01f7 : pata_atiixp
  02f8-02ff : serial
  0376-0376 : 0000:00:14.1
    0376-0376 : pata_atiixp
  03c0-03df : vga+
  03f6-03f6 : 0000:00:14.1
    03f6-03f6 : pata_atiixp
  03f8-03ff : serial
  040b-040b : pnp 00:05
  04d0-04d1 : pnp 00:05
  04d6-04d6 : pnp 00:05
  0800-0803 : ACPI PM1a_EVT_BLK
  0804-0805 : ACPI PM1a_CNT_BLK
  0808-080b : ACPI PM_TMR
  0810-0815 : ACPI CPU throttle
  0820-0827 : ACPI GPE0_BLK
  0900-090f : pnp 00:05
  0910-091f : pnp 00:05
  0b00-0b0f : pnp 00:05
  0b20-0b3f : pnp 00:05
  0c00-0c01 : pnp 00:05
  0c14-0c14 : pnp 00:05
  0c50-0c51 : pnp 00:05
  0c52-0c52 : pnp 00:05
  0c6c-0c6c : pnp 00:05
  0c6f-0c6f : pnp 00:05
  0cd0-0cd1 : pnp 00:05
  0cd2-0cd3 : pnp 00:05
  0cd4-0cd5 : pnp 00:05
  0cd6-0cd7 : pnp 00:05
  0cd8-0cdf : pnp 00:05
0cf8-0cff : PCI conf1
0d00-ffff : PCI Bus 0000:00
  0e80-0f5f : pnp 00:0b
    0e80-0e87 : f71882fg
    0f40-0f4f : pnp 00:0b
  4000-400f : 0000:00:11.0
    4000-400f : ahci
  5000-5003 : 0000:00:11.0
    5000-5003 : ahci
  6000-6007 : 0000:00:11.0
    6000-6007 : ahci
  7000-7003 : 0000:00:11.0
    7000-7003 : ahci
  8000-8007 : 0000:00:11.0
    8000-8007 : ahci
  9000-9fff : PCI Bus 0000:01
    9800-987f : 0000:01:00.0
  a000-bfff : PCI Bus 0000:02
    a400-a40f : 0000:02:00.1
      a400-a40f : pata_jmicron
    a800-a803 : 0000:02:00.1
      a800-a803 : pata_jmicron
    b000-b007 : 0000:02:00.1
      b000-b007 : pata_jmicron
    b400-b403 : 0000:02:00.1
      b400-b403 : pata_jmicron
    b800-b807 : 0000:02:00.1
      b800-b807 : pata_jmicron
  c000-cfff : PCI Bus 0000:03
    c800-c8ff : 0000:03:00.0
      c800-c8ff : r8169
  d000-dfff : PCI Bus 0000:04
    d800-d8ff : 0000:04:00.0
      d800-d8ff : r8169
  e000-efff : PCI Bus 0000:05
    e000-e07f : 0000:05:02.0
    e400-e407 : 0000:05:00.1
      e400-e407 : emu10k1-gp
    e800-e83f : 0000:05:00.0
      e800-e83f : EMU10K1
  fe00-fefe : pnp 00:05
  ff00-ff0f : 0000:00:14.1
    ff00-ff0f : pata_atiixp


[7.4.b.] $ cat /proc/iomem
00000000-00000fff : reserved
00001000-0009fbff : System RAM
0009fc00-0009ffff : reserved
000a0000-000bffff : PCI Bus 0000:00
000c0000-000cddff : Video ROM
000d0000-000dffff : PCI Bus 0000:00
000e6000-000fffff : reserved
  000f0000-000fffff : System ROM
00100000-cffaffff : System RAM
  01000000-017831d8 : Kernel code
  017831d9-01d1e43f : Kernel data
  01e77000-01fdbfff : Kernel bss
  2d000000-34ffffff : Crash kernel
cffb0000-cffbdfff : ACPI Tables
cffbe000-cffdffff : ACPI Non-volatile Storage
cffe0000-cfffffff : reserved
d0000000-dfffffff : PCI Bus 0000:00
  d0000000-dfffffff : PCI Bus 0000:01
    d0000000-dfffffff : 0000:01:00.0
e0000000-efffffff : PCI MMCONFIG 0000 [bus 00-ff]
  e0000000-efffffff : pnp 00:0c
f0000000-febfffff : PCI Bus 0000:00
  fbffa000-fbffafff : 0000:00:14.5
    fbffa000-fbffafff : ohci_hcd
  fbffb000-fbffbfff : 0000:00:13.1
    fbffb000-fbffbfff : ohci_hcd
  fbffc000-fbffcfff : 0000:00:13.0
    fbffc000-fbffcfff : ohci_hcd
  fbffd000-fbffdfff : 0000:00:12.1
    fbffd000-fbffdfff : ohci_hcd
  fbffe000-fbffefff : 0000:00:12.0
    fbffe000-fbffefff : ohci_hcd
  fbfff400-fbfff4ff : 0000:00:13.2
    fbfff400-fbfff4ff : ehci_hcd
  fbfff800-fbfff8ff : 0000:00:12.2
    fbfff800-fbfff8ff : ehci_hcd
  fbfffc00-fbffffff : 0000:00:11.0
    fbfffc00-fbffffff : ahci
  fc000000-fe7fffff : PCI Bus 0000:01
    fc000000-fcffffff : 0000:01:00.0
    fd000000-fdffffff : 0000:01:00.0
    fe7e0000-fe7fffff : 0000:01:00.0
  fe800000-fe8fffff : PCI Bus 0000:02
    fe8fe000-fe8fffff : 0000:02:00.0
      fe8fe000-fe8fffff : ahci
  fe900000-fe9fffff : PCI Bus 0000:03
    fe9c0000-fe9dffff : 0000:03:00.0
    fe9ff000-fe9fffff : 0000:03:00.0
      fe9ff000-fe9fffff : r8169
  fea00000-feafffff : PCI Bus 0000:04
    feac0000-feadffff : 0000:04:00.0
    feaff000-feafffff : 0000:04:00.0
      feaff000-feafffff : r8169
  feb00000-febfffff : PCI Bus 0000:05
    febf8000-febfbfff : 0000:05:00.2
    febff000-febff7ff : 0000:05:02.0
      febff000-febff7ff : firewire_ohci
    febff800-febfffff : 0000:05:00.2
      febff800-febfffff : firewire_ohci
fec00000-fec003ff : IOAPIC 0
fec10000-fec1001f : pnp 00:05
fed00000-fed003ff : HPET 2
fee00000-fee00fff : Local APIC
  fee00000-fee00fff : pnp 00:04
ffb80000-ffbfffff : pnp 00:05
fff00000-ffffffff : reserved
100000000-22fffffff : System RAM

[7.5.] $ sudo lspci -vvv=20
[sudo] password for {user}:=20
00:00.0 Host bridge: Advanced Micro Devices, Inc. [AMD/ATI] RD790 Host Brid=
ge
        Subsystem: Advanced Micro Devices, Inc. [AMD/ATI] RD790 Host Bridge
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-=
=20
Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz+ UDF- FastB2B- ParErr- DEVSEL=3Dmedium >TAbort- =

<TAbort- <MAbort+ >SERR- <PERR- INTx-
        Latency: 0
        Region 3: Memory at <ignored> (64-bit, non-prefetchable)
        Capabilities: [c4] HyperTransport: Slave or Primary Interface
                Command: BaseUnitID=3D0 UnitCnt=12 MastHost- DefDir- DUL-
                Link Control 0: CFlE- CST- CFE- <LkFail- Init+ EOC- TXO-=20
<CRCErr=3D0 IsocEn+ LSEn- ExtCTL- 64b-
                Link Config 0: MLWI=16bit DwFcIn- MLWO=16bit DwFcOut- LWI=
=16bit=20
DwFcInEn- LWO=16bit DwFcOutEn-
                Link Control 1: CFlE- CST- CFE- <LkFail+ Init- EOC+ TXO+=20
<CRCErr=3D0 IsocEn- LSEn- ExtCTL- 64b-
                Link Config 1: MLWI=8Bit DwFcIn- MLWO=8Bit DwFcOut- LWI=8Bi=
t=20
DwFcInEn- LWO=8Bit DwFcOutEn-
                Revision ID: 3.00
                Link Frequency 0: [a]
                Link Error 0: <Prot- <Ovfl- <EOC- CTLTm-
                Link Frequency Capability 0: 200MHz+ 300MHz- 400MHz+ 500MHz=
-=20
600MHz+ 800MHz+ 1.0GHz+ 1.2GHz+ 1.4GHz- 1.6GHz- Vend-
                Feature Capability: IsocFC- LDTSTOP+ CRCTM- ECTLT- 64bA-=20
UIDRD-
                Link Frequency 1: 200MHz
                Link Error 1: <Prot- <Ovfl- <EOC- CTLTm-
                Link Frequency Capability 1: 200MHz- 300MHz- 400MHz- 500MHz=
-=20
600MHz- 800MHz- 1.0GHz- 1.2GHz- 1.4GHz- 1.6GHz- Vend-
                Error Handling: PFlE- OFlE- PFE- OFE- EOCFE- RFE- CRCFE-=20
SERRFE- CF- RE- PNFE- ONFE- EOCNFE- RNFE- CRCNFE- SERRNFE-
                Prefetchable memory behind bridge Upper: 00-00
                Bus Number: 00
        Capabilities: [40] HyperTransport: Retry Mode
        Capabilities: [54] HyperTransport: UnitID Clumping
        Capabilities: [9c] HyperTransport: #1a

00:02.0 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] RX780/RD790 PCI =
to=20
PCI bridge (external gfx0 port A) (prog-if 00 [Normal decode])
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-=
=20
Stepping- SERR+ FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=FAst >TAbort-=20
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Bus: primary=00, secondary=01, subordinate=01, sec-latency=3D0
        I/O behind bridge: 00009000-00009fff
        Memory behind bridge: fc000000-fe7fffff
        Prefetchable memory behind bridge: 00000000d0000000-00000000dfffffff
        Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=FAst >TAbort-=20
<TAbort- <MAbort+ <SERR- <PERR-
        BridgeCtl: Parity+ SERR+ NoISA- VGA+ MAbort- >Reset- FastB2B-
                PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
        Capabilities: [50] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=3D0mA=20
PME(D0+,D1-,D2-,D3hot+,D3cold+)
                Status: D0 NoSoftRst- PME-Enable- DSel=3D0 DScale=3D0 PME-
        Capabilities: [58] Express (v2) Root Port (Slot-), MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0, Latency L0s <64n=
s,=20
L1 <1us
                        ExtTag+ RBE+ FLReset-
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal-=20
Unsupported-
                        RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr-=20
TransPend-
                LnkCap: Port #0, Speed 5GT/s, Width x16, ASPM L0s L1, Laten=
cy=20
L0 <64ns, L1 <1us
                        ClockPM- Surprise- LLActRep+ BwNot+
                LnkCtl: ASPM Disabled; RCB 64 bytes Disabled- Retrain-=20
CommClk+
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 2.5GT/s, Width x16, TrErr- Train- SlotClk+=20
DLActive+ BWMgmt+ ABWMgmt-
                RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna-=
=20
CRSVisible-
                RootCap: CRSVisible-
                RootSta: PME ReqID 0000, PMEStatus- PMEPending-
                DevCap2: Completion Timeout: Not Supported, TimeoutDis-=20
ARIFwd-
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- ARIF=
wd-
                LnkCtl2: Target Link Speed: 5GT/s, EnterCompliance- SpeedDi=
s-,=20
Selectable De-emphasis: -3.5dB
                         Transmit Margin: Normal Operating Range,=20
EnterModifiedCompliance- ComplianceSOS-
                         Compliance De-emphasis: -6dB
                LnkSta2: Current De-emphasis Level: -3.5dB
        Capabilities: [a0] MSI: Enable+ Count=3D1/1 Maskable- 64bit-
                Address: fee0f00c  Data: 4181
        Capabilities: [b0] Subsystem: Advanced Micro Devices, Inc. [AMD/ATI=
]=20
Device 5956
        Capabilities: [b8] HyperTransport: MSI Mapping Enable+ Fixed+
        Capabilities: [100 v1] Vendor Specific Information: ID=0001 Rev=3D1=
=20
Len=010 <?>
        Capabilities: [110 v1] Virtual Channel
                Caps:   LPEVC=3D0 RefClk=100ns PATEntryBits=3D1
                Arb:    Fixed- WRR32- WRR64- WRR128-
                Ctrl:   ArbSelect=3DFixed
                Status: InProgress-
                VC0:    Caps:   PATOffset=00 MaxTimeSlots=3D1 RejSnoopTrans-
                        Arb:    Fixed+ WRR32- WRR64- WRR128- TWRR128- WRR25=
6-
                        Ctrl:   Enable+ ID=3D0 ArbSelect=3DFixed TC/VC=FF
                        Status: NegoPending- InProgress-
        Kernel driver in use: pcieport

00:05.0 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] RX780/RD790 PCI =
to=20
PCI bridge (PCI express gpp port B) (prog-if 00 [Normal decode])
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-=
=20
Stepping- SERR+ FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=FAst >TAbort-=20
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Bus: primary=00, secondary=02, subordinate=02, sec-latency=3D0
        I/O behind bridge: 0000a000-0000bfff
        Memory behind bridge: fe800000-fe8fffff
        Prefetchable memory behind bridge: 00000000fff00000-00000000000fffff
        Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=FAst >TAbort-=20
<TAbort- <MAbort+ <SERR- <PERR-
        BridgeCtl: Parity+ SERR+ NoISA+ VGA- MAbort- >Reset- FastB2B-
                PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
        Capabilities: [50] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=3D0mA=20
PME(D0+,D1-,D2-,D3hot+,D3cold+)
                Status: D0 NoSoftRst- PME-Enable- DSel=3D0 DScale=3D0 PME-
        Capabilities: [58] Express (v2) Root Port (Slot-), MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0, Latency L0s <64n=
s,=20
L1 <1us
                        ExtTag+ RBE+ FLReset-
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal-=20
Unsupported-
                        RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr-=20
TransPend-
                LnkCap: Port #1, Speed 5GT/s, Width x1, ASPM L0s L1, Latenc=
y=20
L0 <64ns, L1 <1us
                        ClockPM- Surprise- LLActRep+ BwNot+
                LnkCtl: ASPM Disabled; RCB 64 bytes Disabled- Retrain-=20
CommClk+
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 2.5GT/s, Width x1, TrErr- Train- SlotClk+=20
DLActive+ BWMgmt+ ABWMgmt-
                RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna-=
=20
CRSVisible-
                RootCap: CRSVisible-
                RootSta: PME ReqID 0000, PMEStatus- PMEPending-
                DevCap2: Completion Timeout: Not Supported, TimeoutDis-=20
ARIFwd-
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- ARIF=
wd-
                LnkCtl2: Target Link Speed: 5GT/s, EnterCompliance- SpeedDi=
s-,=20
Selectable De-emphasis: -3.5dB
                         Transmit Margin: Normal Operating Range,=20
EnterModifiedCompliance- ComplianceSOS-
                         Compliance De-emphasis: -6dB
                LnkSta2: Current De-emphasis Level: -3.5dB
        Capabilities: [a0] MSI: Enable+ Count=3D1/1 Maskable- 64bit-
                Address: fee0f00c  Data: 4191
        Capabilities: [b0] Subsystem: Advanced Micro Devices, Inc. [AMD/ATI=
]=20
Device 5956
        Capabilities: [b8] HyperTransport: MSI Mapping Enable+ Fixed+
        Capabilities: [100 v1] Vendor Specific Information: ID=0001 Rev=3D1=
=20
Len=010 <?>
        Capabilities: [110 v1] Virtual Channel
                Caps:   LPEVC=3D0 RefClk=100ns PATEntryBits=3D1
                Arb:    Fixed- WRR32- WRR64- WRR128-
                Ctrl:   ArbSelect=3DFixed
                Status: InProgress-
                VC0:    Caps:   PATOffset=00 MaxTimeSlots=3D1 RejSnoopTrans-
                        Arb:    Fixed+ WRR32- WRR64- WRR128- TWRR128- WRR25=
6-
                        Ctrl:   Enable+ ID=3D0 ArbSelect=3DFixed TC/VC=FF
                        Status: NegoPending- InProgress-
        Kernel driver in use: pcieport

00:06.0 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] RD790 PCI to PCI=
=20
bridge (PCI express gpp port C) (prog-if 00 [Normal decode])
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-=
=20
Stepping- SERR+ FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=FAst >TAbort-=20
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Bus: primary=00, secondary=03, subordinate=03, sec-latency=3D0
        I/O behind bridge: 0000c000-0000cfff
        Memory behind bridge: fe900000-fe9fffff
        Prefetchable memory behind bridge: 00000000fff00000-00000000000fffff
        Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=FAst >TAbort-=20
<TAbort- <MAbort+ <SERR- <PERR-
        BridgeCtl: Parity+ SERR+ NoISA+ VGA- MAbort- >Reset- FastB2B-
                PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
        Capabilities: [50] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=3D0mA=20
PME(D0+,D1-,D2-,D3hot+,D3cold+)
                Status: D0 NoSoftRst- PME-Enable- DSel=3D0 DScale=3D0 PME-
        Capabilities: [58] Express (v2) Root Port (Slot-), MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0, Latency L0s <64n=
s,=20
L1 <1us
                        ExtTag+ RBE+ FLReset-
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal-=20
Unsupported-
                        RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr-=20
TransPend-
                LnkCap: Port #2, Speed 5GT/s, Width x1, ASPM L0s L1, Latenc=
y=20
L0 <64ns, L1 <1us
                        ClockPM- Surprise- LLActRep+ BwNot+
                LnkCtl: ASPM Disabled; RCB 64 bytes Disabled- Retrain-=20
CommClk+
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 2.5GT/s, Width x1, TrErr- Train- SlotClk+=20
DLActive+ BWMgmt+ ABWMgmt-
                RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna-=
=20
CRSVisible-
                RootCap: CRSVisible-
                RootSta: PME ReqID 0000, PMEStatus- PMEPending-
                DevCap2: Completion Timeout: Not Supported, TimeoutDis-=20
ARIFwd-
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- ARIF=
wd-
                LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance-=20
SpeedDis-, Selectable De-emphasis: -6dB
                         Transmit Margin: Normal Operating Range,=20
EnterModifiedCompliance- ComplianceSOS-
                         Compliance De-emphasis: -6dB
                LnkSta2: Current De-emphasis Level: -6dB
        Capabilities: [a0] MSI: Enable+ Count=3D1/1 Maskable- 64bit-
                Address: fee0f00c  Data: 41a1
        Capabilities: [b0] Subsystem: Advanced Micro Devices, Inc. [AMD/ATI=
]=20
Device 5956
        Capabilities: [b8] HyperTransport: MSI Mapping Enable+ Fixed+
        Capabilities: [100 v1] Vendor Specific Information: ID=0001 Rev=3D1=
=20
Len=010 <?>
        Capabilities: [110 v1] Virtual Channel
                Caps:   LPEVC=3D0 RefClk=100ns PATEntryBits=3D1
                Arb:    Fixed- WRR32- WRR64- WRR128-
                Ctrl:   ArbSelect=3DFixed
                Status: InProgress-
                VC0:    Caps:   PATOffset=00 MaxTimeSlots=3D1 RejSnoopTrans-
                        Arb:    Fixed+ WRR32- WRR64- WRR128- TWRR128- WRR25=
6-
                        Ctrl:   Enable+ ID=3D0 ArbSelect=3DFixed TC/VC=FF
                        Status: NegoPending- InProgress-
        Kernel driver in use: pcieport

00:07.0 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] RX780/RD790 PCI =
to=20
PCI bridge (PCI express gpp port D) (prog-if 00 [Normal decode])
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-=
=20
Stepping- SERR+ FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=FAst >TAbort-=20
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Bus: primary=00, secondary=04, subordinate=04, sec-latency=3D0
        I/O behind bridge: 0000d000-0000dfff
        Memory behind bridge: fea00000-feafffff
        Prefetchable memory behind bridge: 00000000fff00000-00000000000fffff
        Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=FAst >TAbort-=20
<TAbort- <MAbort+ <SERR- <PERR-
        BridgeCtl: Parity+ SERR+ NoISA+ VGA- MAbort- >Reset- FastB2B-
                PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
        Capabilities: [50] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=3D0mA=20
PME(D0+,D1-,D2-,D3hot+,D3cold+)
                Status: D0 NoSoftRst- PME-Enable- DSel=3D0 DScale=3D0 PME-
        Capabilities: [58] Express (v2) Root Port (Slot-), MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0, Latency L0s <64n=
s,=20
L1 <1us
                        ExtTag+ RBE+ FLReset-
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal-=20
Unsupported-
                        RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr-=20
TransPend-
                LnkCap: Port #3, Speed 5GT/s, Width x1, ASPM L0s L1, Latenc=
y=20
L0 <64ns, L1 <1us
                        ClockPM- Surprise- LLActRep+ BwNot+
                LnkCtl: ASPM Disabled; RCB 64 bytes Disabled- Retrain-=20
CommClk+
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 2.5GT/s, Width x1, TrErr- Train- SlotClk+=20
DLActive+ BWMgmt+ ABWMgmt-
                RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna-=
=20
CRSVisible-
                RootCap: CRSVisible-
                RootSta: PME ReqID 0000, PMEStatus- PMEPending-
                DevCap2: Completion Timeout: Not Supported, TimeoutDis-=20
ARIFwd-
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- ARIF=
wd-
                LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance-=20
SpeedDis-, Selectable De-emphasis: -6dB
                         Transmit Margin: Normal Operating Range,=20
EnterModifiedCompliance- ComplianceSOS-
                         Compliance De-emphasis: -6dB
                LnkSta2: Current De-emphasis Level: -6dB
        Capabilities: [a0] MSI: Enable+ Count=3D1/1 Maskable- 64bit-
                Address: fee0f00c  Data: 41b1
        Capabilities: [b0] Subsystem: Advanced Micro Devices, Inc. [AMD/ATI=
]=20
Device 5956
        Capabilities: [b8] HyperTransport: MSI Mapping Enable+ Fixed+
        Capabilities: [100 v1] Vendor Specific Information: ID=0001 Rev=3D1=
=20
Len=010 <?>
        Capabilities: [110 v1] Virtual Channel
                Caps:   LPEVC=3D0 RefClk=100ns PATEntryBits=3D1
                Arb:    Fixed- WRR32- WRR64- WRR128-
                Ctrl:   ArbSelect=3DFixed
                Status: InProgress-
                VC0:    Caps:   PATOffset=00 MaxTimeSlots=3D1 RejSnoopTrans-
                        Arb:    Fixed+ WRR32- WRR64- WRR128- TWRR128- WRR25=
6-
                        Ctrl:   Enable+ ID=3D0 ArbSelect=3DFixed TC/VC=FF
                        Status: NegoPending- InProgress-
        Kernel driver in use: pcieport

00:11.0 SATA controller: Advanced Micro Devices, Inc. [AMD/ATI]=20
SB7x0/SB8x0/SB9x0 SATA Controller [IDE mode] (prog-if 01 [AHCI 1.0])
        Subsystem: Foxconn International, Inc. Device 0e0e
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-=
=20
Stepping- SERR+ FastB2B- DisINTx-
        Status: Cap+ 66MHz+ UDF- FastB2B- ParErr- DEVSEL=3Dmedium >TAbort- =

<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 64, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 22
        Region 0: I/O ports at 8000 [size=3D8]
        Region 1: I/O ports at 7000 [size=3D4]
        Region 2: I/O ports at 6000 [size=3D8]
        Region 3: I/O ports at 5000 [size=3D4]
        Region 4: I/O ports at 4000 [size=16]
        Region 5: Memory at fbfffc00 (32-bit, non-prefetchable) [size=3D1K]
        Capabilities: [60] Power Management version 2
                Flags: PMEClk- DSI+ D1- D2- AuxCurrent=3D0mA=20
PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 NoSoftRst- PME-Enable- DSel=3D0 DScale=3D0 PME-
        Capabilities: [70] SATA HBA v1.0 InCfgSpace
        Kernel driver in use: ahci

00:12.0 USB controller: Advanced Micro Devices, Inc. [AMD/ATI]=20
SB7x0/SB8x0/SB9x0 USB OHCI0 Controller (prog-if 10 [OHCI])
        Subsystem: Foxconn International, Inc. Device 0e0e
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV+ VGASnoop- ParErr-=
=20
Stepping- SERR+ FastB2B- DisINTx-
        Status: Cap- 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=3Dmedium >TAbort- =

<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 64, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 16
        Region 0: Memory at fbffe000 (32-bit, non-prefetchable) [size=3D4K]
        Kernel driver in use: ohci-pci

00:12.1 USB controller: Advanced Micro Devices, Inc. [AMD/ATI] SB7x0 USB OH=
CI1=20
Controller (prog-if 10 [OHCI])
        Subsystem: Foxconn International, Inc. Device 0e0e
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV+ VGASnoop- ParErr-=
=20
Stepping- SERR+ FastB2B- DisINTx-
        Status: Cap- 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=3Dmedium >TAbort- =

<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 64, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 16
        Region 0: Memory at fbffd000 (32-bit, non-prefetchable) [size=3D4K]
        Kernel driver in use: ohci-pci

00:12.2 USB controller: Advanced Micro Devices, Inc. [AMD/ATI]=20
SB7x0/SB8x0/SB9x0 USB EHCI Controller (prog-if 20 [EHCI])
        Subsystem: Foxconn International, Inc. Device 0e0e
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV+ VGASnoop- ParErr-=
=20
Stepping- SERR+ FastB2B- DisINTx-
        Status: Cap+ 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=3Dmedium >TAbort- =

<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 64, Cache Line Size: 64 bytes
        Interrupt: pin B routed to IRQ 17
        Region 0: Memory at fbfff800 (32-bit, non-prefetchable) [size%6]
        Capabilities: [c0] Power Management version 2
                Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=3D0mA=20
PME(D0+,D1+,D2+,D3hot+,D3cold-)
                Status: D0 NoSoftRst- PME-Enable- DSel=3D0 DScale=3D0 PME-
                Bridge: PM- B3+
        Capabilities: [e4] Debug port: BAR=3D1 offset=00e0
        Kernel driver in use: ehci-pci

00:13.0 USB controller: Advanced Micro Devices, Inc. [AMD/ATI]=20
SB7x0/SB8x0/SB9x0 USB OHCI0 Controller (prog-if 10 [OHCI])
        Subsystem: Foxconn International, Inc. Device 0e0e
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV+ VGASnoop- ParErr-=
=20
Stepping- SERR+ FastB2B- DisINTx-
        Status: Cap- 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=3Dmedium >TAbort- =

<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 64, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 18
        Region 0: Memory at fbffc000 (32-bit, non-prefetchable) [size=3D4K]
        Kernel driver in use: ohci-pci

00:13.1 USB controller: Advanced Micro Devices, Inc. [AMD/ATI] SB7x0 USB OH=
CI1=20
Controller (prog-if 10 [OHCI])
        Subsystem: Foxconn International, Inc. Device 0e0e
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV+ VGASnoop- ParErr-=
=20
Stepping- SERR+ FastB2B- DisINTx-
        Status: Cap- 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=3Dmedium >TAbort- =

<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 64, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 18
        Region 0: Memory at fbffb000 (32-bit, non-prefetchable) [size=3D4K]
        Kernel driver in use: ohci-pci

00:13.2 USB controller: Advanced Micro Devices, Inc. [AMD/ATI]=20
SB7x0/SB8x0/SB9x0 USB EHCI Controller (prog-if 20 [EHCI])
        Subsystem: Foxconn International, Inc. Device 0e0e
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV+ VGASnoop- ParErr-=
=20
Stepping- SERR+ FastB2B- DisINTx-
        Status: Cap+ 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=3Dmedium >TAbort- =

<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 64, Cache Line Size: 64 bytes
        Interrupt: pin B routed to IRQ 19
        Region 0: Memory at fbfff400 (32-bit, non-prefetchable) [size%6]
        Capabilities: [c0] Power Management version 2
                Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=3D0mA=20
PME(D0+,D1+,D2+,D3hot+,D3cold-)
                Status: D0 NoSoftRst- PME-Enable- DSel=3D0 DScale=3D0 PME-
                Bridge: PM- B3+
        Capabilities: [e4] Debug port: BAR=3D1 offset=00e0
        Kernel driver in use: ehci-pci

00:14.0 SMBus: Advanced Micro Devices, Inc. [AMD/ATI] SBx00 SMBus Controlle=
r=20
(rev 3a)
        Subsystem: Foxconn International, Inc. Device 0e0e
        Control: I/O+ Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr-=
=20
Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz+ UDF- FastB2B- ParErr- DEVSEL=3Dmedium >TAbort- =

<TAbort+ <MAbort- >SERR- <PERR- INTx-
        Capabilities: [b0] HyperTransport: MSI Mapping Enable- Fixed+

00:14.1 IDE interface: Advanced Micro Devices, Inc. [AMD/ATI]=20
SB7x0/SB8x0/SB9x0 IDE Controller (prog-if 8a [Master SecP PriP])
        Subsystem: Foxconn International, Inc. Device 0e0e
        Control: I/O+ Mem- BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-=
=20
Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz+ UDF- FastB2B- ParErr- DEVSEL=3Dmedium >TAbort- =

<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 64
        Interrupt: pin A routed to IRQ 16
        Region 0: I/O ports at 01f0 [size=3D8]
        Region 1: I/O ports at 03f4 [size=3D1]
        Region 2: I/O ports at 0170 [size=3D8]
        Region 3: I/O ports at 0374 [size=3D1]
        Region 4: I/O ports at ff00 [size=16]
        Capabilities: [70] MSI: Enable- Count=3D1/2 Maskable- 64bit-
                Address: 00000000  Data: 0000
        Kernel driver in use: pata_atiixp

00:14.3 ISA bridge: Advanced Micro Devices, Inc. [AMD/ATI] SB7x0/SB8x0/SB9x=
0=20
LPC host controller
        Subsystem: Foxconn International, Inc. Device 0e0e
        Control: I/O+ Mem+ BusMaster+ SpecCycle+ MemWINV- VGASnoop- ParErr-=
=20
Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz+ UDF- FastB2B- ParErr- DEVSEL=3Dmedium >TAbort- =

<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0

00:14.4 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] SBx00 PCI to PCI=
=20
Bridge (prog-if 01 [Subtractive decode])
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-=
=20
Stepping- SERR+ FastB2B- DisINTx-
        Status: Cap- 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=3Dmedium >TAbort- =

<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 64
        Bus: primary=00, secondary=05, subordinate=05, sec-latencyd
        I/O behind bridge: 0000e000-0000efff
        Memory behind bridge: feb00000-febfffff
        Prefetchable memory behind bridge: fff00000-000fffff
        Secondary status: 66MHz- FastB2B+ ParErr- DEVSEL=3Dmedium >TAbort- =

<TAbort- <MAbort+ <SERR- <PERR-
        BridgeCtl: Parity+ SERR+ NoISA+ VGA- MAbort- >Reset- FastB2B-
                PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-

00:14.5 USB controller: Advanced Micro Devices, Inc. [AMD/ATI]=20
SB7x0/SB8x0/SB9x0 USB OHCI2 Controller (prog-if 10 [OHCI])
        Subsystem: Foxconn International, Inc. Device 0e0e
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV+ VGASnoop- ParErr-=
=20
Stepping- SERR+ FastB2B- DisINTx-
        Status: Cap- 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=3Dmedium >TAbort- =

<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 64, Cache Line Size: 64 bytes
        Interrupt: pin C routed to IRQ 18
        Region 0: Memory at fbffa000 (32-bit, non-prefetchable) [size=3D4K]
        Kernel driver in use: ohci-pci

00:18.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 10h Processo=
r=20
HyperTransport Configuration
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr-=
=20
Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=FAst >TAbort-=20
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Capabilities: [80] HyperTransport: Host or Secondary Interface
                Command: WarmRst+ DblEnd- DevNum=3D0 ChainSide- HostHide+ S=
lave-=20
<EOCErr- DUL-
                Link Control: CFlE- CST- CFE- <LkFail- Init+ EOC- TXO-=20
<CRCErr=3D0 IsocEn+ LSEn- ExtCTL- 64b-
                Link Config: MLWI=16bit DwFcIn- MLWO=16bit DwFcOut- LWI=16b=
it=20
DwFcInEn- LWO=16bit DwFcOutEn-
                Revision ID: 3.00
                Link Frequency: [a]
                Link Error: <Prot- <Ovfl- <EOC- CTLTm-
                Link Frequency Capability: 200MHz+ 300MHz- 400MHz+ 500MHz- =

600MHz+ 800MHz+ 1.0GHz+ 1.2GHz+ 1.4GHz- 1.6GHz- Vend-
                Feature Capability: IsocFC+ LDTSTOP+ CRCTM- ECTLT- 64bA+=20
UIDRD- ExtRS- UCnfE-

00:18.1 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 10h Processo=
r=20
Address Map
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr-=
=20
Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=FAst >TAbort-=20
<TAbort- <MAbort- >SERR- <PERR- INTx-

00:18.2 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 10h Processo=
r=20
DRAM Controller
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr-=
=20
Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=FAst >TAbort-=20
<TAbort- <MAbort- >SERR- <PERR- INTx-

00:18.3 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 10h Processo=
r=20
Miscellaneous Control
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr-=
=20
Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=FAst >TAbort-=20
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Capabilities: [f0] Secure device <?>

00:18.4 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 10h Processo=
r=20
Link Control
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr-=
=20
Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=FAst >TAbort-=20
<TAbort- <MAbort- >SERR- <PERR- INTx-

01:00.0 VGA compatible controller: NVIDIA Corporation G73 [GeForce 7600 GS]=
=20
(rev a1) (prog-if 00 [VGA controller])
        Subsystem: ASUSTeK Computer Inc. Device 822a
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-=
=20
Stepping- SERR+ FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=FAst >TAbort-=20
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 10
        Region 0: Memory at fd000000 (32-bit, non-prefetchable) [size=16M]
        Region 1: Memory at d0000000 (64-bit, prefetchable) [size%6M]
        Region 3: Memory at fc000000 (64-bit, non-prefetchable) [size=16M]
        Region 5: I/O ports at 9800 [size=128]
        Expansion ROM at fe7e0000 [disabled] [size=128K]
        Capabilities: [60] Power Management version 2
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=3D0mA=20
PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 NoSoftRst- PME-Enable- DSel=3D0 DScale=3D0 PME-
        Capabilities: [68] MSI: Enable- Count=3D1/1 Maskable- 64bit+
                Address: 0000000000000000  Data: 0000
        Capabilities: [78] Express (v1) Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0, Latency L0s <256=
ns,=20
L1 <4us
                        ExtTag- AttnBtn- AttnInd- PwrInd- RBE- FLReset-
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal-=20
Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop+
                        MaxPayload 128 bytes, MaxReadReq 512 bytes
                DevSta: CorrErr- UncorrErr+ FatalErr- UnsuppReq+ AuxPwr-=20
TransPend-
                LnkCap: Port #0, Speed 2.5GT/s, Width x16, ASPM L0s L1,=20
Latency L0 <256ns, L1 <4us
                        ClockPM- Surprise- LLActRep- BwNot-
                LnkCtl: ASPM Disabled; RCB 128 bytes Disabled- Retrain-=20
CommClk+
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 2.5GT/s, Width x16, TrErr- Train- SlotClk+=20
DLActive- BWMgmt- ABWMgmt-
        Capabilities: [100 v1] Virtual Channel
                Caps:   LPEVC=3D0 RefClk=100ns PATEntryBits=3D1
                Arb:    Fixed- WRR32- WRR64- WRR128-
                Ctrl:   ArbSelect=3DFixed
                Status: InProgress-
                VC0:    Caps:   PATOffset=00 MaxTimeSlots=3D1 RejSnoopTrans-
                        Arb:    Fixed- WRR32- WRR64- WRR128- TWRR128- WRR25=
6-
                        Ctrl:   Enable+ ID=3D0 ArbSelect=3DFixed TC/VC=FF
                        Status: NegoPending- InProgress-
        Capabilities: [128 v1] Power Budgeting <?>

02:00.0 SATA controller: JMicron Technology Corp. JMB363 SATA/IDE Controlle=
r=20
(rev 03) (prog-if 01 [AHCI 1.0])
        Subsystem: Foxconn International, Inc. Device 0e0e
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-=
=20
Stepping- SERR+ FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=FAst >TAbort-=20
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 17
        Region 5: Memory at fe8fe000 (32-bit, non-prefetchable) [size=3D8K]
        Capabilities: [68] Power Management version 2
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=3D0mA=20
PME(D0-,D1-,D2-,D3hot+,D3cold-)
                Status: D0 NoSoftRst- PME-Enable- DSel=3D0 DScale=3D0 PME-
        Capabilities: [50] Express (v1) Legacy Endpoint, MSI 01
                DevCap: MaxPayload 128 bytes, PhantFunc 0, Latency L0s <64n=
s,=20
L1 <1us
                        ExtTag- AttnBtn- AttnInd- PwrInd- RBE- FLReset-
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal-=20
Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 128 bytes, MaxReadReq 512 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq+ AuxPwr-=20
TransPend-
                LnkCap: Port #1, Speed 2.5GT/s, Width x1, ASPM L0s, Latency=
 L0=20
<1us, L1 <16us
                        ClockPM- Surprise- LLActRep- BwNot-
                LnkCtl: ASPM Disabled; RCB 64 bytes Disabled- Retrain-=20
CommClk+
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 2.5GT/s, Width x1, TrErr- Train- SlotClk+=20
DLActive- BWMgmt- ABWMgmt-
        Kernel driver in use: ahci

02:00.1 IDE interface: JMicron Technology Corp. JMB363 SATA/IDE Controller =

(rev 03) (prog-if 85 [Master SecO PriO])
        Subsystem: Foxconn International, Inc. Device 0e0e
        Control: I/O+ Mem- BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-=
=20
Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=FAst >TAbort-=20
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0
        Interrupt: pin B routed to IRQ 18
        Region 0: I/O ports at b800 [size=3D8]
        Region 1: I/O ports at b400 [size=3D4]
        Region 2: I/O ports at b000 [size=3D8]
        Region 3: I/O ports at a800 [size=3D4]
        Region 4: I/O ports at a400 [size=16]
        Capabilities: [68] Power Management version 2
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=3D0mA=20
PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 NoSoftRst- PME-Enable- DSel=3D0 DScale=3D0 PME-
        Kernel driver in use: pata_jmicron

03:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd. RTL8111/8168/8=
411=20
PCI Express Gigabit Ethernet Controller (rev 01)
        Subsystem: Foxconn International, Inc. Device 0e0e
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-=
=20
Stepping- SERR+ FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=FAst >TAbort-=20
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 44
        Region 0: I/O ports at c800 [size%6]
        Region 2: Memory at fe9ff000 (64-bit, non-prefetchable) [size=3D4K]
        Expansion ROM at fe9c0000 [disabled] [size=128K]
        Capabilities: [40] Power Management version 2
                Flags: PMEClk- DSI- D1+ D2+ AuxCurrent75mA=20
PME(D0-,D1+,D2+,D3hot+,D3cold+)
                Status: D0 NoSoftRst- PME-Enable- DSel=3D0 DScale=3D0 PME-
        Capabilities: [48] Vital Product Data
                Unknown small resource type 05, will not decode more.
        Capabilities: [50] MSI: Enable+ Count=3D1/2 Maskable- 64bit+
                Address: 00000000fee0100c  Data: 41c1
        Capabilities: [60] Express (v1) Endpoint, MSI 00
                DevCap: MaxPayload 1024 bytes, PhantFunc 0, Latency L0s <1u=
s,=20
L1 unlimited
                        ExtTag+ AttnBtn+ AttnInd+ PwrInd+ RBE- FLReset-
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal-=20
Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop+
                        MaxPayload 128 bytes, MaxReadReq 4096 bytes
                DevSta: CorrErr- UncorrErr+ FatalErr- UnsuppReq+ AuxPwr+=20
TransPend-
                LnkCap: Port #0, Speed 2.5GT/s, Width x1, ASPM L0s, Latency=
 L0=20
unlimited, L1 unlimited
                        ClockPM- Surprise- LLActRep- BwNot-
                LnkCtl: ASPM Disabled; RCB 64 bytes Disabled- Retrain-=20
CommClk+
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 2.5GT/s, Width x1, TrErr- Train- SlotClk+=20
DLActive- BWMgmt- ABWMgmt-
        Capabilities: [84] Vendor Specific Information: LenL <?>
        Capabilities: [100 v1] Advanced Error Reporting
                UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- =

RxOF- MalfTLP- ECRC- UnsupReq+ ACSViol-
                UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- =

RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                UESvrt: DLP+ SDES- TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- =

RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
                CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-=20
NonFatalErr-
                CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-=20
NonFatalErr-
                AERCap: First Error Pointer: 14, GenCap- CGenEn- ChkCap-=20
ChkEn-
        Capabilities: [12c v1] Virtual Channel
                Caps:   LPEVC=3D0 RefClk=100ns PATEntryBits=3D1
                Arb:    Fixed- WRR32- WRR64- WRR128-
                Ctrl:   ArbSelect=3DFixed
                Status: InProgress-
                VC0:    Caps:   PATOffset=00 MaxTimeSlots=3D1 RejSnoopTrans-
                        Arb:    Fixed- WRR32- WRR64- WRR128- TWRR128- WRR25=
6-
                        Ctrl:   Enable+ ID=3D0 ArbSelect=3DFixed TC/VC=FF
                        Status: NegoPending- InProgress-
        Capabilities: [148 v1] Device Serial Number b8-02-00-00-10-ec-81-68
        Capabilities: [154 v1] Power Budgeting <?>
        Kernel driver in use: r8169

04:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd. RTL8111/8168/8=
411=20
PCI Express Gigabit Ethernet Controller (rev 01)
        Subsystem: Foxconn International, Inc. Device 0e0e
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-=
=20
Stepping- SERR+ FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=FAst >TAbort-=20
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 45
        Region 0: I/O ports at d800 [size%6]
        Region 2: Memory at feaff000 (64-bit, non-prefetchable) [size=3D4K]
        Expansion ROM at feac0000 [disabled] [size=128K]
        Capabilities: [40] Power Management version 2
                Flags: PMEClk- DSI- D1+ D2+ AuxCurrent75mA=20
PME(D0-,D1+,D2+,D3hot+,D3cold+)
                Status: D0 NoSoftRst- PME-Enable- DSel=3D0 DScale=3D0 PME-
        Capabilities: [48] Vital Product Data
                Unknown small resource type 05, will not decode more.
        Capabilities: [50] MSI: Enable+ Count=3D1/2 Maskable- 64bit+
                Address: 00000000fee0f00c  Data: 41d1
        Capabilities: [60] Express (v1) Endpoint, MSI 00
                DevCap: MaxPayload 1024 bytes, PhantFunc 0, Latency L0s <1u=
s,=20
L1 unlimited
                        ExtTag+ AttnBtn+ AttnInd+ PwrInd+ RBE- FLReset-
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal-=20
Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop+
                        MaxPayload 128 bytes, MaxReadReq 4096 bytes
                DevSta: CorrErr- UncorrErr+ FatalErr- UnsuppReq+ AuxPwr+=20
TransPend-
                LnkCap: Port #0, Speed 2.5GT/s, Width x1, ASPM L0s, Latency=
 L0=20
unlimited, L1 unlimited
                        ClockPM- Surprise- LLActRep- BwNot-
                LnkCtl: ASPM Disabled; RCB 64 bytes Disabled- Retrain-=20
CommClk+
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 2.5GT/s, Width x1, TrErr- Train- SlotClk+=20
DLActive- BWMgmt- ABWMgmt-
        Capabilities: [84] Vendor Specific Information: LenL <?>
        Capabilities: [100 v1] Advanced Error Reporting
                UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- =

RxOF- MalfTLP- ECRC- UnsupReq+ ACSViol-
                UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- =

RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                UESvrt: DLP+ SDES- TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- =

RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
                CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-=20
NonFatalErr-
                CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-=20
NonFatalErr-
                AERCap: First Error Pointer: 14, GenCap- CGenEn- ChkCap-=20
ChkEn-
        Capabilities: [12c v1] Virtual Channel
                Caps:   LPEVC=3D0 RefClk=100ns PATEntryBits=3D1
                Arb:    Fixed- WRR32- WRR64- WRR128-
                Ctrl:   ArbSelect=3DFixed
                Status: InProgress-
                VC0:    Caps:   PATOffset=00 MaxTimeSlots=3D1 RejSnoopTrans-
                        Arb:    Fixed- WRR32- WRR64- WRR128- TWRR128- WRR25=
6-
                        Ctrl:   Enable+ ID=3D0 ArbSelect=3DFixed TC/VC=FF
                        Status: NegoPending- InProgress-
        Capabilities: [148 v1] Device Serial Number b9-02-00-00-10-ec-81-68
        Capabilities: [154 v1] Power Budgeting <?>
        Kernel driver in use: r8169

05:00.0 Multimedia audio controller: Creative Labs SB Audigy (rev 04)
        Subsystem: Creative Labs Device 2006
        Control: I/O+ Mem- BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-=
=20
Stepping- SERR+ FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=3Dmedium >TAbort- =

<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 64 (500ns min, 5000ns max)
        Interrupt: pin A routed to IRQ 20
        Region 0: I/O ports at e800 [sized]
        Capabilities: [dc] Power Management version 2
                Flags: PMEClk- DSI+ D1+ D2+ AuxCurrent=3D0mA=20
PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 NoSoftRst- PME-Enable- DSel=3D0 DScale=3D0 PME-
        Kernel driver in use: snd_emu10k1

05:00.1 Input device controller: Creative Labs SB Audigy Game Port (rev 04)
        Subsystem: Creative Labs SB Audigy Game Port
        Control: I/O+ Mem- BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-=
=20
Stepping- SERR+ FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=3Dmedium >TAbort- =

<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 64
        Region 0: I/O ports at e400 [size=3D8]
        Capabilities: [dc] Power Management version 2
                Flags: PMEClk- DSI+ D1+ D2+ AuxCurrent=3D0mA=20
PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 NoSoftRst- PME-Enable- DSel=3D0 DScale=3D0 PME-
        Kernel driver in use: Emu10k1_gameport

05:00.2 FireWire (IEEE 1394): Creative Labs SB Audigy FireWire Port (rev 04=
)=20
(prog-if 10 [OHCI])
        Subsystem: Creative Labs SB Audigy FireWire Port
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV+ VGASnoop- ParErr-=
=20
Stepping- SERR+ FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dmedium >TAbort- =

<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 64 (500ns min, 1000ns max), Cache Line Size: 64 bytes
        Interrupt: pin B routed to IRQ 21
        Region 0: Memory at febff800 (32-bit, non-prefetchable) [size=3D2K]
        Region 1: Memory at febf8000 (32-bit, non-prefetchable) [size=16K]
        Capabilities: [44] Power Management version 2
                Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=3D0mA=20
PME(D0+,D1+,D2+,D3hot+,D3cold-)
                Status: D0 NoSoftRst- PME-Enable- DSel=3D0 DScale=3D0 PME+
        Kernel driver in use: firewire_ohci

05:02.0 FireWire (IEEE 1394): VIA Technologies, Inc. VT6306/7/8 [Fire II(M)=
]=20
IEEE 1394 OHCI Controller (rev c0) (prog-if 10 [OHCI])
        Subsystem: Foxconn International, Inc. Device 0e0e
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV+ VGASnoop- ParErr-=
=20
Stepping- SERR+ FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dmedium >TAbort- =

<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 64 (8000ns max), Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 21
        Region 0: Memory at febff000 (32-bit, non-prefetchable) [size=3D2K]
        Region 1: I/O ports at e000 [size=128]
        Capabilities: [50] Power Management version 2
                Flags: PMEClk- DSI- D1- D2+ AuxCurrent=3D0mA=20
PME(D0-,D1-,D2+,D3hot+,D3cold+)
                Status: D0 NoSoftRst- PME-Enable- DSel=3D0 DScale=3D0 PME-
        Kernel driver in use: firewire_ohci


[7.6.] $ cat /proc/scsi/scsi=20
Attached devices:
Host: scsi0 Channel: 00 Id: 00 Lun: 00
  Vendor: ATA      Model: MKNSSDCR120GB    Rev: 502A
  Type:   Direct-Access                    ANSI  SCSI revision: 05
Host: scsi3 Channel: 00 Id: 00 Lun: 00
  Vendor: SONY     Model: DVD RW DW-D22A   Rev: BYS2
  Type:   CD-ROM                           ANSI  SCSI revision: 05
Host: scsi10 Channel: 00 Id: 00 Lun: 00
  Vendor: Generic- Model: Compact Flash    Rev: 1.00
  Type:   Direct-Access                    ANSI  SCSI revision: 00
Host: scsi10 Channel: 00 Id: 00 Lun: 01
  Vendor: Generic- Model: SM/xD-Picture    Rev: 1.00
  Type:   Direct-Access                    ANSI  SCSI revision: 00
Host: scsi10 Channel: 00 Id: 00 Lun: 02
  Vendor: Generic- Model: SD/MMC           Rev: 1.00
  Type:   Direct-Access                    ANSI  SCSI revision: 00
Host: scsi10 Channel: 00 Id: 00 Lun: 03
  Vendor: Generic- Model: MS/MS-Pro        Rev: 1.00
  Type:   Direct-Access                    ANSI  SCSI revision: 00


[7.7.] Not applicable

[X.]Other notes, patches, fixes, workarounds:

a) Launchpad bug report:

https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1328746

b) Workaround: Fixed file emumpu401.c pasted below. Note: The code below ca=
n be=20
used to compile the module snd-emu10k1, and the bug does not occur with the=
=20
module when compiled with the code below.=20

/*
 *  Copyright (c) by Jaroslav Kysela <perex@perex.cz>
 *  Routines for control of EMU10K1 MPU-401 in UART mode
 *
 *
 *   This program is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License as published by
 *   the Free Software Foundation; either version 2 of the License, or
 *   (at your option) any later version.
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details.
 *
 *   You should have received a copy of the GNU General Public License
 *   along with this program; if not, write to the Free Software
 *   Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307 U=
SA
 *
 */

#include <linux/time.h>
#include <linux/init.h>
#include <linux/delay.h>
#include <sound/core.h>
#include <sound/emu10k1.h>

#define EMU10K1_MIDI_MODE_INPUT		(1<<0)
#define EMU10K1_MIDI_MODE_OUTPUT	(1<<1)

static inline unsigned char mpu401_read(struct snd_emu10k1 *emu,
					struct snd_emu10k1_midi *mpu, int idx)
{
	if (emu->audigy)
		return (unsigned char)snd_emu10k1_ptr_read(emu, mpu->port + idx, 0);
	else
		return inb(emu->port + mpu->port + idx);
}

static inline void mpu401_write(struct snd_emu10k1 *emu,
				struct snd_emu10k1_midi *mpu, int data, int idx)
{
	if (emu->audigy)
		snd_emu10k1_ptr_write(emu, mpu->port + idx, 0, data);
	else
		outb(data, emu->port + mpu->port + idx);
}

#define mpu401_write_data(emu, mpu, data)	mpu401_write(emu, mpu, data, 0)
#define mpu401_write_cmd(emu, mpu, data)	mpu401_write(emu, mpu, data, 1)
#define mpu401_read_data(emu, mpu)		mpu401_read(emu, mpu, 0)
#define mpu401_read_stat(emu, mpu)		mpu401_read(emu, mpu, 1)

#define mpu401_input_avail(emu,mpu)	(!(mpu401_read_stat(emu,mpu) & 0x80))
#define mpu401_output_ready(emu,mpu)	(!(mpu401_read_stat(emu,mpu) & 0x40))

#define MPU401_RESET		0xff
#define MPU401_ENTER_UART	0x3f
#define MPU401_ACK		0xfe

static void mpu401_clear_rx(struct snd_emu10k1 *emu, struct snd_emu10k1_mid=
i=20
*mpu)
{
	int timeout =3D 100000;
	for (; timeout > 0 && mpu401_input_avail(emu, mpu); timeout--)
		mpu401_read_data(emu, mpu);
#ifdef CONFIG_SND_DEBUG
	if (timeout <=3D 0)
		dev_err(emu->card->dev,
			"cmd: clear rx timeout (status =3D 0x%x)\n",
			mpu401_read_stat(emu, mpu));
#endif
}

/*

 */

static void do_emu10k1_midi_interrupt(struct snd_emu10k1 *emu, struct=20
snd_emu10k1_midi *midi, unsigned int status)
{
	unsigned char byte;

	if (midi->rmidi =3D NULL) {
		snd_emu10k1_intr_disable(emu, midi->tx_enable | midi->rx_enable);
		return;
	}

	spin_lock(&midi->input_lock);
	if ((status & midi->ipr_rx) && mpu401_input_avail(emu, midi)) {
		if (!(midi->midi_mode & EMU10K1_MIDI_MODE_INPUT)) {
			mpu401_clear_rx(emu, midi);
		} else {
			byte =3D mpu401_read_data(emu, midi);
			if (midi->substream_input)
				snd_rawmidi_receive(midi->substream_input, &byte, 1);
		}
	}
	spin_unlock(&midi->input_lock);

	spin_lock(&midi->output_lock);
	if ((status & midi->ipr_tx) && mpu401_output_ready(emu, midi)) {
		if (midi->substream_output &&
		    snd_rawmidi_transmit(midi->substream_output, &byte, 1) =3D 1) {
			mpu401_write_data(emu, midi, byte);
		} else {
			snd_emu10k1_intr_disable(emu, midi->tx_enable);
		}
	}
	spin_unlock(&midi->output_lock);
}

static void snd_emu10k1_midi_interrupt(struct snd_emu10k1 *emu, unsigned in=
t=20
status)
{
	do_emu10k1_midi_interrupt(emu, &emu->midi, status);
}

static void snd_emu10k1_midi_interrupt2(struct snd_emu10k1 *emu, unsigned i=
nt=20
status)
{
	do_emu10k1_midi_interrupt(emu, &emu->midi2, status);
}

static int snd_emu10k1_midi_cmd(struct snd_emu10k1 * emu, struct=20
snd_emu10k1_midi *midi, unsigned char cmd, int ack)
{
	unsigned long flags;
	int timeout, ok;

	spin_lock_irqsave(&midi->input_lock, flags);
	mpu401_write_data(emu, midi, 0x00);
	/* mpu401_clear_rx(emu, midi); */

	mpu401_write_cmd(emu, midi, cmd);
	if (ack) {
		ok =3D 0;
		timeout =3D 10000;
		while (!ok && timeout-- > 0) {
			if (mpu401_input_avail(emu, midi)) {
				if (mpu401_read_data(emu, midi) =3D MPU401_ACK)
					ok =3D 1;
			}
		}
		if (!ok && mpu401_read_data(emu, midi) =3D MPU401_ACK)
			ok =3D 1;
	} else {
		ok =3D 1;
	}
	spin_unlock_irqrestore(&midi->input_lock, flags);
	if (!ok) {
		dev_err(emu->card->dev,
			"midi_cmd: 0x%x failed at 0x%lx (status =3D 0x%x, data =3D 0x%x)!!!\n",
			   cmd, emu->port,
			   mpu401_read_stat(emu, midi),
			   mpu401_read_data(emu, midi));
		return 1;
	}
	return 0;
}

static int snd_emu10k1_midi_input_open(struct snd_rawmidi_substream=20
*substream)
{
	struct snd_emu10k1 *emu;
	struct snd_emu10k1_midi *midi =3D (struct snd_emu10k1_midi *)substream-
>rmidi->private_data;
	unsigned long flags;

	emu =3D midi->emu;
	if (snd_BUG_ON(!emu))
		return -ENXIO;
	spin_lock_irqsave(&midi->open_lock, flags);
	midi->midi_mode |=3D EMU10K1_MIDI_MODE_INPUT;
	midi->substream_input =3D substream;
	if (!(midi->midi_mode & EMU10K1_MIDI_MODE_OUTPUT)) {
		spin_unlock_irqrestore(&midi->open_lock, flags);
		if (snd_emu10k1_midi_cmd(emu, midi, MPU401_RESET, 1))
			goto error_out;
		if (snd_emu10k1_midi_cmd(emu, midi, MPU401_ENTER_UART, 1))
			goto error_out;
	} else {
		spin_unlock_irqrestore(&midi->open_lock, flags);
	}
	return 0;

error_out:
	return -EIO;
}

static int snd_emu10k1_midi_output_open(struct snd_rawmidi_substream=20
*substream)
{
	struct snd_emu10k1 *emu;
	struct snd_emu10k1_midi *midi =3D (struct snd_emu10k1_midi *)substream-
>rmidi->private_data;
	unsigned long flags;

	emu =3D midi->emu;
	if (snd_BUG_ON(!emu))
		return -ENXIO;
	spin_lock_irqsave(&midi->open_lock, flags);
	midi->midi_mode |=3D EMU10K1_MIDI_MODE_OUTPUT;
	midi->substream_output =3D substream;
	if (!(midi->midi_mode & EMU10K1_MIDI_MODE_INPUT)) {
		spin_unlock_irqrestore(&midi->open_lock, flags);
		if (snd_emu10k1_midi_cmd(emu, midi, MPU401_RESET, 1))
			goto error_out;
		if (snd_emu10k1_midi_cmd(emu, midi, MPU401_ENTER_UART, 1))
			goto error_out;
	} else {
		spin_unlock_irqrestore(&midi->open_lock, flags);
	}
	return 0;

error_out:
	return -EIO;
}

static int snd_emu10k1_midi_input_close(struct snd_rawmidi_substream=20
*substream)
{
	struct snd_emu10k1 *emu;
	struct snd_emu10k1_midi *midi =3D (struct snd_emu10k1_midi *)substream-
>rmidi->private_data;
	unsigned long flags;
	int err =3D 0;

	emu =3D midi->emu;
	if (snd_BUG_ON(!emu))
		return -ENXIO;
	spin_lock_irqsave(&midi->open_lock, flags);
	snd_emu10k1_intr_disable(emu, midi->rx_enable);
	midi->midi_mode &=3D ~EMU10K1_MIDI_MODE_INPUT;
	midi->substream_input =3D NULL;
	if (!(midi->midi_mode & EMU10K1_MIDI_MODE_OUTPUT)) {
		spin_unlock_irqrestore(&midi->open_lock, flags);
		err =3D snd_emu10k1_midi_cmd(emu, midi, MPU401_RESET, 0);
	} else {
		spin_unlock_irqrestore(&midi->open_lock, flags);
	}
	return err;
}

static int snd_emu10k1_midi_output_close(struct snd_rawmidi_substream=20
*substream)
{
	struct snd_emu10k1 *emu;
	struct snd_emu10k1_midi *midi =3D (struct snd_emu10k1_midi *)substream-
>rmidi->private_data;
	unsigned long flags;
	int err =3D 0;

	emu =3D midi->emu;
	if (snd_BUG_ON(!emu))
		return -ENXIO;
	spin_lock_irqsave(&midi->open_lock, flags);
	snd_emu10k1_intr_disable(emu, midi->tx_enable);
	midi->midi_mode &=3D ~EMU10K1_MIDI_MODE_OUTPUT;
	midi->substream_output =3D NULL;
	if (!(midi->midi_mode & EMU10K1_MIDI_MODE_INPUT)) {
		spin_unlock_irqrestore(&midi->open_lock, flags);
		err =3D snd_emu10k1_midi_cmd(emu, midi, MPU401_RESET, 0);
	} else {
		spin_unlock_irqrestore(&midi->open_lock, flags);
	}
	return err;
}

static void snd_emu10k1_midi_input_trigger(struct snd_rawmidi_substream=20
*substream, int up)
{
	struct snd_emu10k1 *emu;
	struct snd_emu10k1_midi *midi =3D (struct snd_emu10k1_midi *)substream-
>rmidi->private_data;
	emu =3D midi->emu;
	if (snd_BUG_ON(!emu))
		return;

	if (up)
		snd_emu10k1_intr_enable(emu, midi->rx_enable);
	else
		snd_emu10k1_intr_disable(emu, midi->rx_enable);
}

static void snd_emu10k1_midi_output_trigger(struct snd_rawmidi_substream=20
*substream, int up)
{
	struct snd_emu10k1 *emu;
	struct snd_emu10k1_midi *midi =3D (struct snd_emu10k1_midi *)substream-
>rmidi->private_data;
	unsigned long flags;

	emu =3D midi->emu;
	if (snd_BUG_ON(!emu))
		return;

	if (up) {
		int max =3D 4;
		unsigned char byte;
=09
		/* try to send some amount of bytes here before interrupts */
		spin_lock_irqsave(&midi->output_lock, flags);
		while (max > 0) {
			if (mpu401_output_ready(emu, midi)) {
				if (!(midi->midi_mode & EMU10K1_MIDI_MODE_OUTPUT) ||
				    snd_rawmidi_transmit(substream, &byte, 1) !=3D 1) {
					/* no more data */
					spin_unlock_irqrestore(&midi->output_lock, flags);
					return;
				}
				mpu401_write_data(emu, midi, byte);
				max--;
			} else {
				break;
			}
		}
		spin_unlock_irqrestore(&midi->output_lock, flags);
		snd_emu10k1_intr_enable(emu, midi->tx_enable);
	} else {
		snd_emu10k1_intr_disable(emu, midi->tx_enable);
	}
}

/*

 */

static struct snd_rawmidi_ops snd_emu10k1_midi_output {
	.open =3D		snd_emu10k1_midi_output_open,
	.close =3D	snd_emu10k1_midi_output_close,
	.trigger =3D	snd_emu10k1_midi_output_trigger,
};

static struct snd_rawmidi_ops snd_emu10k1_midi_input {
	.open =3D		snd_emu10k1_midi_input_open,
	.close =3D	snd_emu10k1_midi_input_close,
	.trigger =3D	snd_emu10k1_midi_input_trigger,
};

static void snd_emu10k1_midi_free(struct snd_rawmidi *rmidi)
{
	struct snd_emu10k1_midi *midi =3D rmidi->private_data;
	midi->interrupt =3D NULL;
	midi->rmidi =3D NULL;
}

static int emu10k1_midi_init(struct snd_emu10k1 *emu, struct snd_emu10k1_mi=
di=20
*midi, int device, char *name)
{
	struct snd_rawmidi *rmidi;
	int err;

	if ((err =3D snd_rawmidi_new(emu->card, name, device, 1, 1, &rmidi)) < 0)
		return err;
	midi->emu =3D emu;
	spin_lock_init(&midi->open_lock);
	spin_lock_init(&midi->input_lock);
	spin_lock_init(&midi->output_lock);
	strcpy(rmidi->name, name);
	snd_rawmidi_set_ops(rmidi, SNDRV_RAWMIDI_STREAM_OUTPUT,=20
&snd_emu10k1_midi_output);
	snd_rawmidi_set_ops(rmidi, SNDRV_RAWMIDI_STREAM_INPUT,=20
&snd_emu10k1_midi_input);
	rmidi->info_flags |=3D SNDRV_RAWMIDI_INFO_OUTPUT |
	                     SNDRV_RAWMIDI_INFO_INPUT |
	                     SNDRV_RAWMIDI_INFO_DUPLEX;
	rmidi->private_data =3D midi;
	rmidi->private_free =3D snd_emu10k1_midi_free;
	midi->rmidi =3D rmidi;
	return 0;
}

int snd_emu10k1_midi(struct snd_emu10k1 *emu)
{
	struct snd_emu10k1_midi *midi =3D &emu->midi;
	int err;

	if ((err =3D emu10k1_midi_init(emu, midi, 0, "EMU10K1 MPU-401 (UART)")) < =
0)
		return err;

	midi->tx_enable =3D INTE_MIDITXENABLE;
	midi->rx_enable =3D INTE_MIDIRXENABLE;
	midi->port =3D MUDATA;
	midi->ipr_tx =3D IPR_MIDITRANSBUFEMPTY;
	midi->ipr_rx =3D IPR_MIDIRECVBUFEMPTY;
	midi->interrupt =3D snd_emu10k1_midi_interrupt;
	return 0;
}

int snd_emu10k1_audigy_midi(struct snd_emu10k1 *emu)
{
	struct snd_emu10k1_midi *midi;
	int err;=09
	unsigned int val;		/* Needed in GPOUT2 pulse initialization */


	midi =3D &emu->midi;
	if ((err =3D emu10k1_midi_init(emu, midi, 0, "Audigy MPU-401 (UART)")) < 0)
		return err;

	midi->tx_enable =3D INTE_MIDITXENABLE;
	midi->rx_enable =3D INTE_MIDIRXENABLE;
	midi->port =3D A_MUDATA1;
	midi->ipr_tx =3D IPR_MIDITRANSBUFEMPTY;
	midi->ipr_rx =3D IPR_MIDIRECVBUFEMPTY;
	midi->interrupt =3D snd_emu10k1_midi_interrupt;

	midi =3D &emu->midi2;
	if ((err =3D emu10k1_midi_init(emu, midi, 1, "Audigy MPU-401 #2")) < 0)
		return err;

	midi->tx_enable =3D INTE_A_MIDITXENABLE2;
	midi->rx_enable =3D INTE_A_MIDIRXENABLE2;
	midi->port =3D A_MUDATA2;
	midi->ipr_tx =3D IPR_A_MIDITRANSBUFEMPTY2;
	midi->ipr_rx =3D IPR_A_MIDIRECVBUFEMPTY2;
	midi->interrupt =3D snd_emu10k1_midi_interrupt2;


	snd_printk(KERN_ERR "Both Audigy MPU-401 UARTs now intialized\n");

	val =3D inl(emu->port + A_IOCFG);
	outl (val | A_IOCFG_GPOUT2, emu->port + A_IOCFG);
	udelay(10);		/* udelay is a bad kludge, but remember that this is called=20
only once on startup */
	outl (val, emu->port + A_IOCFG);
	snd_printk(KERN_ERR "Audigy MPU-401: Haidekker's Hack - UART enabled\n");


	return 0;
}



