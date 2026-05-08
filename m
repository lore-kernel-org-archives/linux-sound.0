Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E993EF676
	for <linux-sound@vger.kernel.org>; Fri,  8 May 2026 14:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778252179; cv=none; b=DHZZDExfKVrC594zDpy1D8xrTbcheb7Gm/FmuljfWebsGcOq+8Ic2cMDwWz+c6cxE0bAjILjDKXak9MVrjWgaFR9llBQD3RebX5yjacIlpjLV6T8aO+Ox6jxT1LWaGrGHHIq7GfAkPYvO28fLOHOtiowBV4gI+Wc1kqc//4Guks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778252179; c=relaxed/simple;
	bh=0ZPf+hJGtI18C9reMvPfG9r757sNRnFOFLBCo0mvQn4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Iv+bj95lXJem5JZgaBr3OIKby4JbuUY7JnNgOeNpWXHIiSXGqI4dhnKzoVxFvNtI3fDbHZFF3nTWBMdL8NwqeZ7ZX5AIhbu11QitelAyRgoaFujJq/MEYV5J0JUqvjV7lQyUUQeiOmThtp9JdPvXSqcjhDgumfOZsPUAjCWHdq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Tt9XjyS6; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Tt9XjyS6"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gBsd44tCkz9sld;
	Fri,  8 May 2026 16:56:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1778252168;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K4YqawVl1675TNSSqsT33Jb7oLv7dSL+HZTJzwW9GWI=;
	b=Tt9XjyS6iBdpwd0y40OXccs1qxbaVLJ629I3YyhrDt3VQtY3FFHbReIdpTErNjYwoqTQ2A
	/v3X+N9mskl0P8HglWUpRbRVc7KpmPIBRKds3iP0YEDFvP83kkwWRVpayoQVUBfz8K7DFF
	y85OVMoJHw4FBAhnD/OAeWGagsOzhMLV4Y74EL8yETv6lL/0y4O7S+wl6ITM1HJ9OV8PC8
	bzTAzvOmcZbXNwY6h0fgdE7DXcK/8aOBodeZKWtd5PYBiZ5qWsQ72sKRVqP0KNbkoA3O/r
	Ffz/b9ohLij0c3zWSa8T3L8gq/aI2MVWz5B7FAx46XE1Pjda6vAwX8MzgH2ORw==
From: Tobias Bachmann <tobac@mailbox.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>, patches@opensource.cirrus.com,
 Mark Brown <broonie@kernel.org>
Subject: Re: ASoC: cs42l43: SDCA reattach timeout on Dell XPS 14 Panther Lake;
 chip stuck across distros and kernels; worked initially;
 still working at hardware level
Date: Fri, 08 May 2026 16:56:03 +0200
Message-ID: <K3WbtGOFTfOCSdq0caVYzA@mailbox.org>
In-Reply-To: <af2hpsMI1N6NDQG5@opensource.cirrus.com>
References:
 <cLVwl4lrR76pLtv8VxMSaA@mailbox.org> <5QsknC2RSUiRut94Zp-HMw@mailbox.org>
 <af2hpsMI1N6NDQG5@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="nextPartXbVB0C_eQPOiQtg5zktbiw"
Content-Transfer-Encoding: 7Bit
X-MBO-RS-META: 5uagybbpnbfxhjrmuxz365gu1tisn51d
X-MBO-RS-ID: 095be18d02150108057

This is a multi-part message in MIME format.

--nextPartXbVB0C_eQPOiQtg5zktbiw
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Fri, May 08, 2026 at 10:41:10AM CEST, Charles Keepax wrote:
> On Thu, May 07, 2026 at 08:53:27PM +0200, Tobias Bachmann wrote:
> > On Thur, May 07, 2026, 05:35:37PM CEST, Charles Keepax wrote:
> > > Yeah I am afraid this looks like a hardware problem, enumerating
> > > on
> > > the SoundWire bus is pretty much only dependant on power rails.
> > > 
> > > As you say there is a tiny hope the device has got into a weird
> > > state
> > > but isn't reset on a reboot. However, given it looks from the log
> > > like the amps were reset:
> > > 
> > > [   14.603448] cs35l56 sdw:0:2:01fa:3557:01:2: Cirrus Logic
> > > CS35L57
> > > Rev B2 OTP1 fw:4.2.1 (patched=0)
> > > 
> > > That patched=0 means the firmware has been wiped and that only
> > > happens on a reset and as far as I know the resets are tied
> > > together on this model. The very very long shot would be to let
> > > the battery run down and leave the device for a bit to try and
> > > super make sure the power rails went down which would also fully
> > > reset the device. But it is definitely a long shot.
> > 
> > I figured as much. I can take this up with Dell as a hardware issue,
> > but before I do, I wanted to ask about something architecturally:
> > 
> > Windows (or the Cirrus driver?) apparently treats the speakers and
> > the headphone jack as independent functional paths and can drive
> > the speakers fine despite the jack being non-responsive. The Linux
> > driver currently appears to bring up the sound hardware  as a
> > whole, which means the headphone subfunction failing to reattach
> > kills the entire card initialization, including the still-healthy
> > amps.
> > 
> > Would it be reasonable to consider a degraded-mode behavior where
> > the
> > driver proceeds with partial initialization when one subfunction
> > fails, as long as others remain reachable? My particular case is
> > likely hardware degradation, but I imagine similar failures could
> > occur from manufacturing defects, physical damage to the jack
> > contact, or other single-subfunction faults that don't render the
> > whole chip unusable. The current behavior makes such a laptop
> > entirely silent in Linux while still usable in Windows, which seems
> > like a worse outcome than necessary.
> > 
> > I realize this might be a significant change and there may be good
> > reasons it's not feasible with the current architecture. Happy to
> > test any patches.
> 
> Yeah mostly this is an artifact of how the two operating systems
> have structure the audio subsystem. Windows has more of a
> collective of drivers, Linux is slightly more monolithic.
> Changing things at that level is a pretty serious endeavour. I
> would agree in this case the windows behaviour is slightly nicer
> but its non-trivial for such a niche case.
> 
> However, that said we (and others) have been trying to get the
> audio system to load more dynamically, the intention here has
> been to not require as much work to support new models. But I
> guess one could perhaps "abuse" this for your situation. The
> current code creates the soundcard based mostly on what is
> present in the ACPI. So if one removed the codec from the ACPI I
> believe the machine driver would create a soundcard with just
> speakers in theory. The simplest way to do this would probably be
> to add an SSDT that adds a _STA method to the codec returning
> zero, this would tell the kernel that the device is disabled and
> it would ignore it.

Tested the SSDT approach, but got the same SDCA reattach timeout 
as before.

Verified the SSDT is present and correctly loaded:
- dmesg shows: ACPI: Table Upgrade: install [SSDT- TOBAC- DISCS42]
- acpidump captured it as ssdt16.dat (107 bytes)
- iasl -d shows the live table contents are exactly the
  intended _STA = Zero method on \_SB.PC00.HDAS.IDA.SNDW.SWD6

From what I can gather, the audio path doesn't appear to gate on _STA 
for this device:
- soundwire sdw-master-0-0 still reports SDW Slave Addr
  3001fa424501
- ACPI still announces the SDCA functions: device:29 SmartMic,
  device:2a UAJ, device:2b HID
- sdca_class still binds and reaches "probe complete"
- sdca_class sdw:0:0:01fa:4245:01: timed out waiting for
  device re-attach (5s after probe complete)
- No soundcard created

Looking at the DSDT, the CS42L45 has only one device entry
(SWD6), and its three SDCA functions are not represented as
separate ACPI devices. So there's no per-function ACPI
lever to pull either.

For reference, DSDT layout under \_SB.PC00.HDAS.IDA.SNDW seems to 
be:
- SWD6 _ADR 0x00003001FA424501  (CS42L45, link 0)
- SWD2 _ADR 0x00033001FA355701  (CS35L57, link 3, uid 0)
- SWD3 _ADR 0x00033101FA355701  (CS35L57, link 3, uid 1)
- SWD4 _ADR 0x00023201FA355701  (CS35L57, link 2, uid 2)
- SWD5 _ADR 0x00023301FA355701  (CS35L57, link 2, uid 3)

It looks like graceful handling of SDCA function-level probe
failures would have to happen at the driver level rather than
through ACPI.

Full dmesg from SSDT-loaded boot attached.

Thanks again for your help!

Tobias


--nextPartXbVB0C_eQPOiQtg5zktbiw
Content-Disposition: attachment; filename="bug_report-acpi_override.txt"
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"; name="bug_report-acpi_override.txt"

[    0.000000] Linux version 7.0.5-1-cachyos (linux-cachyos@cachyos) (clang version 22.1.3, LLD 22.1.3) #1 SMP PREEMPT_DYNAMIC Fri, 08 May 2026 11:18:45 +0000
[    0.000000] Command line: initrd=\initramfs-linux-cachyos.img root=/dev/mapper/root rw net.ifnames=0 xe.enable_panel_replay=0 snd_soc_sdca.dyndbg=+p soundwire_bus.dyndbg=+p soundwire_intel.dyndbg=+p drm.debug=0
[    0.000000] x86/CPU: Model not found in latest microcode list
[    0.000000] x86/split lock detection: #AC: crashing the kernel on kernel split_locks and warning on user-space split_locks
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009efff]  System RAM
[    0.000000] BIOS-e820: [mem 0x000000000009f000-0x00000000000fffff]  device reserved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x0000000066718fff]  System RAM
[    0.000000] BIOS-e820: [mem 0x0000000066719000-0x0000000066719fff]  device reserved
[    0.000000] BIOS-e820: [mem 0x000000006671a000-0x00000000667cefff]  System RAM
[    0.000000] BIOS-e820: [mem 0x00000000667cf000-0x00000000667d2fff]  device reserved
[    0.000000] BIOS-e820: [mem 0x00000000667d3000-0x00000000667d4fff]  ACPI NVS
[    0.000000] BIOS-e820: [mem 0x00000000667d5000-0x0000000067cc9fff]  System RAM
[    0.000000] BIOS-e820: [mem 0x0000000067cca000-0x0000000067ccafff]  ACPI NVS
[    0.000000] BIOS-e820: [mem 0x0000000067ccb000-0x0000000067d49fff]  device reserved
[    0.000000] BIOS-e820: [mem 0x0000000067d4a000-0x0000000069514fff]  System RAM
[    0.000000] BIOS-e820: [mem 0x0000000069515000-0x000000006d510fff]  device reserved
[    0.000000] BIOS-e820: [mem 0x000000006d511000-0x000000006dd71fff]  ACPI NVS
[    0.000000] BIOS-e820: [mem 0x000000006dd72000-0x000000006dffefff]  ACPI data
[    0.000000] BIOS-e820: [mem 0x000000006dfff000-0x000000006dffffff]  System RAM
[    0.000000] BIOS-e820: [mem 0x000000006e000000-0x00000000807fffff]  device reserved
[    0.000000] BIOS-e820: [gap 0x0000000080800000-0x00000000dfffffff]
[    0.000000] BIOS-e820: [mem 0x00000000e0000000-0x00000000efffffff]  device reserved
[    0.000000] BIOS-e820: [gap 0x00000000f0000000-0x00000000f7ffffff]
[    0.000000] BIOS-e820: [mem 0x00000000f8000000-0x00000000f9ffffff]  device reserved
[    0.000000] BIOS-e820: [gap 0x00000000fa000000-0x00000000fed1ffff]
[    0.000000] BIOS-e820: [mem 0x00000000fed20000-0x00000000fed8ffff]  device reserved
[    0.000000] BIOS-e820: [gap 0x00000000fed90000-0x00000000feffffff]
[    0.000000] BIOS-e820: [mem 0x00000000ff000000-0x00000001043fffff]  device reserved
[    0.000000] BIOS-e820: [mem 0x0000000104400000-0x000000087f7fffff]  System RAM
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] APIC: Static calls initialized
[    0.000000] efi: EFI v2.7 by Dell
[    0.000000] efi: ACPI=0x6dffe000 ACPI 2.0=0x6dffe014 SMBIOS=0x69e06000 TPMFinalLog=0x6dca5000 ESRT=0x69db6518 MEMATTR=0x5f16c018 RNG=0x6df11f18 INITRD=0x61278c98 TPMEventLog=0x6df05018 
[    0.000000] random: crng init done
[    0.000000] efi: Remove mem241: MMIO range=[0xe0000000-0xefffffff] (256MB) from e820 map
[    0.000000] e820: remove [mem 0xe0000000-0xefffffff] device reserved
[    0.000000] efi: Remove mem242: MMIO range=[0xf8000000-0xf9ffffff] (32MB) from e820 map
[    0.000000] e820: remove [mem 0xf8000000-0xf9ffffff] device reserved
[    0.000000] efi: Remove mem244: MMIO range=[0xff000000-0xffffffff] (16MB) from e820 map
[    0.000000] e820: remove [mem 0xff000000-0xffffffff] device reserved
[    0.000000] SMBIOS 3.9 present.
[    0.000000] DMI: Dell Inc. XPS 14 DA14260/0VRKYR, BIOS 1.5.1 04/01/2026
[    0.000000] DMI: Memory slots populated: 8/8
[    0.000000] tsc: Detected 3700.000 MHz processor
[    0.000000] tsc: Detected 3686.400 MHz TSC
[    0.000004] e820: update [mem 0x00000000-0x00000fff] System RAM ==> device reserved
[    0.000005] e820: remove [mem 0x000a0000-0x000fffff] System RAM
[    0.000009] last_pfn = 0x87f800 max_arch_pfn = 0x400000000
[    0.000012] MTRR map: 9 entries (3 fixed + 6 variable; max 23), built from 10 variable MTRRs
[    0.000013] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT  
[    0.000230] x2apic: enabled by BIOS, switching to x2apic ops
[    0.000231] last_pfn = 0x6e000 max_arch_pfn = 0x400000000
[    0.004322] esrt: Reserving ESRT space from 0x0000000069db6518 to 0x0000000069db6578.
[    0.004342] Using GB pages for direct mapping
[    0.004569] Initialize FRED on CPU0
[    0.004571] Secure boot disabled
[    0.004571] RAMDISK: [mem 0x567fb000-0x58230fff]
[    0.004572] File kernel/firmware/acpi/cs42l45-disable.aml exceeding MAX_CPIO_FILE_NAME [18]
[    0.004573] ACPI: SSDT ACPI table found in initrd [kernel/firmware/acpi/cs42l45-disable.a][0x6b]
[    0.004598] modified physical RAM map:
[    0.004598] modified: [mem 0x0000000000000000-0x0000000000000fff]  device reserved
[    0.004599] modified: [mem 0x0000000000001000-0x000000000009efff]  System RAM
[    0.004600] modified: [mem 0x000000000009f000-0x00000000000fffff]  device reserved
[    0.004600] modified: [mem 0x0000000000100000-0x0000000061277fff]  System RAM
[    0.004600] modified: [mem 0x0000000061278000-0x000000006127806a]  ACPI NVS
[    0.004601] modified: [mem 0x000000006127806b-0x0000000066718fff]  System RAM
[    0.004601] modified: [mem 0x0000000066719000-0x0000000066719fff]  device reserved
[    0.004602] modified: [mem 0x000000006671a000-0x00000000667cefff]  System RAM
[    0.004602] modified: [mem 0x00000000667cf000-0x00000000667d2fff]  device reserved
[    0.004602] modified: [mem 0x00000000667d3000-0x00000000667d4fff]  ACPI NVS
[    0.004602] modified: [mem 0x00000000667d5000-0x0000000067cc9fff]  System RAM
[    0.004603] modified: [mem 0x0000000067cca000-0x0000000067ccafff]  ACPI NVS
[    0.004603] modified: [mem 0x0000000067ccb000-0x0000000067d49fff]  device reserved
[    0.004603] modified: [mem 0x0000000067d4a000-0x0000000069514fff]  System RAM
[    0.004604] modified: [mem 0x0000000069515000-0x000000006d510fff]  device reserved
[    0.004604] modified: [mem 0x000000006d511000-0x000000006dd71fff]  ACPI NVS
[    0.004604] modified: [mem 0x000000006dd72000-0x000000006dffefff]  ACPI data
[    0.004605] modified: [mem 0x000000006dfff000-0x000000006dffffff]  System RAM
[    0.004605] modified: [mem 0x000000006e000000-0x00000000807fffff]  device reserved
[    0.004605] modified: [gap 0x0000000080800000-0x00000000fed1ffff]
[    0.004605] modified: [mem 0x00000000fed20000-0x00000000fed8ffff]  device reserved
[    0.004606] modified: [gap 0x00000000fed90000-0x00000000ffffffff]
[    0.004606] modified: [mem 0x0000000100000000-0x00000001043fffff]  device reserved
[    0.004606] modified: [mem 0x0000000104400000-0x000000087f7fffff]  System RAM
[    0.004607] ACPI: Early table checksum verification disabled
[    0.004609] ACPI: RSDP 0x000000006DFFE014 000024 (v02 DELL  )
[    0.004611] ACPI: XSDT 0x000000006DF1F228 0001AC (v01 DELL   INTEL ID 00000002      01000013)
[    0.004615] ACPI: FACP 0x000000006DF6D000 000114 (v06 DELL   INTEL ID 00000002      01000013)
[    0.004617] ACPI: DSDT 0x000000006DF6F000 07D46B (v02 DELL   INTEL ID 00000002      01000013)
[    0.004618] ACPI: FACS 0x000000006DCD5000 000040
[    0.004619] ACPI: SSDT 0x000000006DFFC000 000388 (v02 PmaxDv Pmax_Dev 00000001 INTL 20210930)
[    0.004620] ACPI: HEST 0x000000006DFFB000 000054 (v02 DELL   INTEL ID 00000002      01000013)
[    0.004621] ACPI: DTPR 0x000000006DFFA000 000090 (v01 DELL   INTEL ID 00000002      01000013)
[    0.004622] ACPI: SSDT 0x000000006DFF9000 000024 (v02 INTEL  TxtSsdt  00001000 INTL 20210930)
[    0.004624] ACPI: SSDT 0x000000006DFF8000 00087C (v02 INTEL  IgfxSsdt 00003000 INTL 20210930)
[    0.004625] ACPI: SSDT 0x000000006DFF7000 0000AD (v02 INTEL  TseSsdt  00001000 INTL 20210930)
[    0.004626] ACPI: SSDT 0x000000006DFEE000 008859 (v02 INTEL  TcssSsdt 00001000 INTL 20210930)
[    0.004627] ACPI: SSDT 0x000000006DFED000 0000E0 (v02 INTEL  IpuSsdt  00001000 INTL 20210930)
[    0.004627] ACPI: SSDT 0x000000006DF6E000 000D12 (v02 DELL   DellRtd3 00001000 INTL 20210930)
[    0.004629] ACPI: HPET 0x000000006DF6C000 000038 (v01 DELL   INTEL ID 00000002      01000013)
[    0.004629] ACPI: WSMT 0x000000006DF6B000 000028 (v01 DELL   INTEL ID 00000002      01000013)
[    0.004631] ACPI: APIC 0x000000006DF6A000 000158 (v06 DELL   INTEL ID 00000000      01000013)
[    0.004632] ACPI: SSDT 0x000000006DF61000 0076C8 (v02 INTEL  PepoSsdt 00001000 INTL 20210930)
[    0.004632] ACPI: SSDT 0x000000006DF56000 00A993 (v02 MiCaTb MiCaTabl 00001000 INTL 20210930)
[    0.004633] ACPI: SSDT 0x000000006DF53000 00227E (v02 INTEL  PDatTabl 00001000 INTL 20210930)
[    0.004634] ACPI: SSDT 0x000000006DF50000 002D55 (v02 DptfTb DptfTabl 00001000 INTL 20210930)
[    0.004635] ACPI: SSDT 0x000000006DF4F000 000770 (v02 PmRef  Cpu0Ist  00003000 INTL 20210930)
[    0.004636] ACPI: SSDT 0x000000006DF4E000 0005F5 (v02 PmRef  Cpu0Hwp  00003000 INTL 20210930)
[    0.004637] ACPI: SSDT 0x000000006DF4D000 000196 (v02 PmRef  Cpu0Psd  00003000 INTL 20210930)
[    0.004638] ACPI: SSDT 0x000000006DFFD000 00030E (v02 PmRef  Cpu0Cst  00003001 INTL 20210930)
[    0.004639] ACPI: SSDT 0x000000006DF4A000 001BAF (v02 PmRef  ApIst    00003000 INTL 20210930)
[    0.004640] ACPI: SSDT 0x000000006DF48000 001620 (v02 PmRef  ApHwp    00003000 INTL 20210930)
[    0.004641] ACPI: SSDT 0x000000006DF46000 00163D (v02 PmRef  ApPsd    00003000 INTL 20210930)
[    0.004642] ACPI: SSDT 0x000000006DF45000 000FBB (v02 PmRef  ApCst    00003000 INTL 20210930)
[    0.004643] ACPI: SSDT 0x000000006DF41000 003CC4 (v02 CpuRef CpuSsdt  00003000 INTL 20210930)
[    0.004644] ACPI: SSDT 0x000000006DF3F000 001052 (v02 Intel_ UcsiTabl 00001000 INTL 20210930)
[    0.004645] ACPI: SSDT 0x000000006DF3E000 000BA1 (v02 INTEL  UpmpSsdt 00000000 INTL 20210930)
[    0.004646] ACPI: NHLT 0x000000006DF3C000 00053B (v00 DELL   INTEL ID 00000002      01000013)
[    0.004647] ACPI: LPIT 0x000000006DF3B000 0000CC (v01 DELL   INTEL ID 00000002      01000013)
[    0.004648] ACPI: SSDT 0x000000006DF3A000 000D5C (v02 DELL   PtidDevc 00001000 INTL 20210930)
[    0.004649] ACPI: DBGP 0x000000006DF39000 000034 (v01 DELL   INTEL ID 00000002      01000013)
[    0.004650] ACPI: DBG2 0x000000006DF38000 000054 (v00 DELL   INTEL ID 00000002      01000013)
[    0.004651] ACPI: MSDM 0x000000006DF37000 000055 (v03 DELL   CBX3     06222004 AMI  00010013)
[    0.004652] ACPI: BOOT 0x000000006DF36000 000028 (v01 DELL   CBX3     00000002      01000013)
[    0.004653] ACPI: SSDT 0x000000006DF35000 000574 (v02 DELL   Tpm2Tabl 00001000 INTL 20210930)
[    0.004654] ACPI: TPM2 0x000000006DF34000 00004C (v04 DELL   INTEL ID 00000002      01000013)
[    0.004655] ACPI: DMAR 0x000000006DF33000 0000D8 (v01 DELL   INTEL ID 00000002      01000013)
[    0.004656] ACPI: SSDT 0x000000006DF20000 0120A1 (v02 INTEL  Cnv_Ssdt 00001000 INTL 20210930)
[    0.004657] ACPI: FPDT 0x000000006DF4C000 000034 (v01 DELL   INTEL ID 00000002      01000013)
[    0.004658] ACPI: SSDT 0x000000006DF1E000 000024 (v02 INTEL  TxtSsdt  00001000 INTL 20210930)
[    0.004659] ACPI: SSDT 0x000000006DF1C000 001EC7 (v02 SocGpe SocGpe   00003000 INTL 20210930)
[    0.004660] ACPI: SSDT 0x000000006DF1A000 001DA3 (v02 SocCmn SocCmn   00003000 INTL 20210930)
[    0.004661] ACPI: MCFG 0x000000006DF69000 00003C (v01 DELL   INTEL ID 00000002      01000013)
[    0.004662] ACPI: SSDT 0x000000006DF15000 004D07 (v02 Rtd3   I2C_DEVT 00001000 INTL 20210930)
[    0.004663] ACPI: SDEV 0x000000006DF14000 000046 (v01 DELL   INTEL ID 00000002      01000013)
[    0.004664] ACPI: PHAT 0x000000006DF3D000 000A48 (v01 DELL   INTEL ID 00000002      01000013)
[    0.004665] ACPI: OEMD 0x000000006DF13000 000160 (v01 DELL   Dell Inc 00000000 DELL 00000000)
[    0.004666] ACPI: BGRT 0x000000006DF12000 000038 (v01 DELL   INTEL ID 00000002      01000013)
[    0.004667] ACPI: Reserving FACP table memory at [mem 0x6df6d000-0x6df6d113]
[    0.004667] ACPI: Reserving DSDT table memory at [mem 0x6df6f000-0x6dfec46a]
[    0.004668] ACPI: Reserving FACS table memory at [mem 0x6dcd5000-0x6dcd503f]
[    0.004668] ACPI: Reserving SSDT table memory at [mem 0x6dffc000-0x6dffc387]
[    0.004668] ACPI: Reserving HEST table memory at [mem 0x6dffb000-0x6dffb053]
[    0.004669] ACPI: Reserving DTPR table memory at [mem 0x6dffa000-0x6dffa08f]
[    0.004669] ACPI: Reserving SSDT table memory at [mem 0x6dff9000-0x6dff9023]
[    0.004669] ACPI: Reserving SSDT table memory at [mem 0x6dff8000-0x6dff887b]
[    0.004670] ACPI: Reserving SSDT table memory at [mem 0x6dff7000-0x6dff70ac]
[    0.004670] ACPI: Reserving SSDT table memory at [mem 0x6dfee000-0x6dff6858]
[    0.004670] ACPI: Reserving SSDT table memory at [mem 0x6dfed000-0x6dfed0df]
[    0.004670] ACPI: Reserving SSDT table memory at [mem 0x6df6e000-0x6df6ed11]
[    0.004671] ACPI: Reserving HPET table memory at [mem 0x6df6c000-0x6df6c037]
[    0.004671] ACPI: Reserving WSMT table memory at [mem 0x6df6b000-0x6df6b027]
[    0.004671] ACPI: Reserving APIC table memory at [mem 0x6df6a000-0x6df6a157]
[    0.004672] ACPI: Reserving SSDT table memory at [mem 0x6df61000-0x6df686c7]
[    0.004672] ACPI: Reserving SSDT table memory at [mem 0x6df56000-0x6df60992]
[    0.004672] ACPI: Reserving SSDT table memory at [mem 0x6df53000-0x6df5527d]
[    0.004673] ACPI: Reserving SSDT table memory at [mem 0x6df50000-0x6df52d54]
[    0.004673] ACPI: Reserving SSDT table memory at [mem 0x6df4f000-0x6df4f76f]
[    0.004673] ACPI: Reserving SSDT table memory at [mem 0x6df4e000-0x6df4e5f4]
[    0.004673] ACPI: Reserving SSDT table memory at [mem 0x6df4d000-0x6df4d195]
[    0.004674] ACPI: Reserving SSDT table memory at [mem 0x6dffd000-0x6dffd30d]
[    0.004674] ACPI: Reserving SSDT table memory at [mem 0x6df4a000-0x6df4bbae]
[    0.004674] ACPI: Reserving SSDT table memory at [mem 0x6df48000-0x6df4961f]
[    0.004675] ACPI: Reserving SSDT table memory at [mem 0x6df46000-0x6df4763c]
[    0.004675] ACPI: Reserving SSDT table memory at [mem 0x6df45000-0x6df45fba]
[    0.004675] ACPI: Reserving SSDT table memory at [mem 0x6df41000-0x6df44cc3]
[    0.004675] ACPI: Reserving SSDT table memory at [mem 0x6df3f000-0x6df40051]
[    0.004676] ACPI: Reserving SSDT table memory at [mem 0x6df3e000-0x6df3eba0]
[    0.004676] ACPI: Reserving NHLT table memory at [mem 0x6df3c000-0x6df3c53a]
[    0.004676] ACPI: Reserving LPIT table memory at [mem 0x6df3b000-0x6df3b0cb]
[    0.004677] ACPI: Reserving SSDT table memory at [mem 0x6df3a000-0x6df3ad5b]
[    0.004678] ACPI: Reserving DBGP table memory at [mem 0x6df39000-0x6df39033]
[    0.004678] ACPI: Reserving DBG2 table memory at [mem 0x6df38000-0x6df38053]
[    0.004678] ACPI: Reserving MSDM table memory at [mem 0x6df37000-0x6df37054]
[    0.004678] ACPI: Reserving BOOT table memory at [mem 0x6df36000-0x6df36027]
[    0.004679] ACPI: Reserving SSDT table memory at [mem 0x6df35000-0x6df35573]
[    0.004679] ACPI: Reserving TPM2 table memory at [mem 0x6df34000-0x6df3404b]
[    0.004679] ACPI: Reserving DMAR table memory at [mem 0x6df33000-0x6df330d7]
[    0.004680] ACPI: Reserving SSDT table memory at [mem 0x6df20000-0x6df320a0]
[    0.004680] ACPI: Reserving FPDT table memory at [mem 0x6df4c000-0x6df4c033]
[    0.004680] ACPI: Reserving SSDT table memory at [mem 0x6df1e000-0x6df1e023]
[    0.004681] ACPI: Reserving SSDT table memory at [mem 0x6df1c000-0x6df1dec6]
[    0.004681] ACPI: Reserving SSDT table memory at [mem 0x6df1a000-0x6df1bda2]
[    0.004681] ACPI: Reserving MCFG table memory at [mem 0x6df69000-0x6df6903b]
[    0.004682] ACPI: Reserving SSDT table memory at [mem 0x6df15000-0x6df19d06]
[    0.004682] ACPI: Reserving SDEV table memory at [mem 0x6df14000-0x6df14045]
[    0.004682] ACPI: Reserving PHAT table memory at [mem 0x6df3d000-0x6df3da47]
[    0.004683] ACPI: Reserving OEMD table memory at [mem 0x6df13000-0x6df1315f]
[    0.004683] ACPI: Reserving BGRT table memory at [mem 0x6df12000-0x6df12037]
[    0.004723] ACPI: Table Upgrade: install [SSDT- TOBAC- DISCS42]
[    0.004724] ACPI: SSDT 0x0000000061278000 00006B (v02 TOBAC  DISCS42  00001000 INTL 20251212)
[    0.004748] APIC: Switched APIC routing to: cluster x2apic
[    0.005019] No NUMA configuration found
[    0.005020] Faking a node at [mem 0x0000000000000000-0x000000087f7fffff]
[    0.005024] NODE_DATA(0) allocated [mem 0x87f7d2280-0x87f7fcfff]
[    0.005908] ACPI: PM-Timer IO Port: 0x1808
[    0.005912] ACPI: X2APIC_NMI (uid[0xffffffff] high level lint[0x1])
[    0.005946] IOAPIC[0]: apic_id 2, version 32, address 0xfec00000, GSI 0-119
[    0.005948] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.005949] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
[    0.005950] ACPI: Using ACPI (MADT) for SMP configuration information
[    0.005951] ACPI: HPET id: 0x8086a701 base: 0xfed00000
[    0.005956] e820: update [mem 0x611e5000-0x61275fff] System RAM ==> device reserved
[    0.005962] TSC deadline timer available
[    0.005962] CPU topo: Max. logical packages:   1
[    0.005963] CPU topo: Max. logical nodes:      1
[    0.005963] CPU topo: Num. nodes per package:  1
[    0.005964] CPU topo: Max. logical dies:       1
[    0.005964] CPU topo: Max. dies per package:   1
[    0.005965] CPU topo: Max. threads per core:   1
[    0.005966] CPU topo: Num. cores per package:    16
[    0.005966] CPU topo: Num. threads per package:  16
[    0.005966] CPU topo: Allowing 16 present CPUs plus 0 hotplug CPUs
[    0.005976] PM: hibernation: Registered nosave memory: [mem 0x00000000-0x00000fff]
[    0.005977] PM: hibernation: Registered nosave memory: [mem 0x0009f000-0x000fffff]
[    0.005978] PM: hibernation: Registered nosave memory: [mem 0x611e5000-0x61275fff]
[    0.005978] PM: hibernation: Registered nosave memory: [mem 0x61278000-0x61278fff]
[    0.005979] PM: hibernation: Registered nosave memory: [mem 0x66719000-0x66719fff]
[    0.005979] PM: hibernation: Registered nosave memory: [mem 0x667cf000-0x667d4fff]
[    0.005980] PM: hibernation: Registered nosave memory: [mem 0x67cca000-0x67d49fff]
[    0.005980] PM: hibernation: Registered nosave memory: [mem 0x69515000-0x6dffefff]
[    0.005981] PM: hibernation: Registered nosave memory: [mem 0x6e000000-0x1043fffff]
[    0.005982] [gap 0x80800000-0xfed1ffff] available for PCI devices
[    0.005982] Booting paravirtualized kernel on bare hardware
[    0.005983] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1910969940391419 ns
[    0.010162] Zone ranges:
[    0.010162]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.010163]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[    0.010164]   Normal   [mem 0x0000000100000000-0x000000087f7fffff]
[    0.010164]   Device   empty
[    0.010165] Movable zone start for each node
[    0.010165] Early memory node ranges
[    0.010165]   node   0: [mem 0x0000000000001000-0x000000000009efff]
[    0.010166]   node   0: [mem 0x0000000000100000-0x0000000066718fff]
[    0.010167]   node   0: [mem 0x000000006671a000-0x00000000667cefff]
[    0.010167]   node   0: [mem 0x00000000667d5000-0x0000000067cc9fff]
[    0.010167]   node   0: [mem 0x0000000067d4a000-0x0000000069514fff]
[    0.010167]   node   0: [mem 0x000000006dfff000-0x000000006dffffff]
[    0.010168]   node   0: [mem 0x0000000104400000-0x000000087f7fffff]
[    0.010169] Initmem setup node 0 [mem 0x0000000000001000-0x000000087f7fffff]
[    0.010172] On node 0, zone DMA: 1 pages in unavailable ranges
[    0.010185] On node 0, zone DMA: 97 pages in unavailable ranges
[    0.011585] On node 0, zone DMA32: 1 pages in unavailable ranges
[    0.011607] On node 0, zone DMA32: 6 pages in unavailable ranges
[    0.011629] On node 0, zone DMA32: 128 pages in unavailable ranges
[    0.011683] On node 0, zone DMA32: 19178 pages in unavailable ranges
[    0.038820] On node 0, zone Normal: 25600 pages in unavailable ranges
[    0.038827] On node 0, zone Normal: 2048 pages in unavailable ranges
[    0.038832] setup_percpu: NR_CPUS:8192 nr_cpumask_bits:16 nr_cpu_ids:16 nr_node_ids:1
[    0.039205] percpu: Embedded 63 pages/cpu s221184 r8192 d28672 u262144
[    0.039208] pcpu-alloc: s221184 r8192 d28672 u262144 alloc=1*2097152
[    0.039209] pcpu-alloc: [0] 00 01 02 03 04 05 06 07 [0] 08 09 10 11 12 13 14 15 
[    0.039219] Kernel command line: initrd=\initramfs-linux-cachyos.img root=/dev/mapper/root rw net.ifnames=0 xe.enable_panel_replay=0 snd_soc_sdca.dyndbg=+p soundwire_bus.dyndbg=+p soundwire_intel.dyndbg=+p drm.debug=0
[    0.039267] printk: log buffer data + meta data: 131072 + 557056 = 688128 bytes
[    0.040993] Dentry cache hash table entries: 4194304 (order: 13, 33554432 bytes, linear)
[    0.041858] Inode-cache hash table entries: 2097152 (order: 12, 16777216 bytes, linear)
[    0.041999] software IO TLB: area num 16.
[    0.049000] Fallback order for Node 0: 0 
[    0.049002] Built 1 zonelists, mobility grouping on.  Total pages: 8276013
[    0.049003] Policy zone: Normal
[    0.049127] mem auto-init: stack:all(zero), heap alloc:on, heap free:off
[    0.081558] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=16, Nodes=1
[    0.081701] ftrace: allocating 56544 entries in 221 pages
[    0.081702] ftrace: allocated 221 pages with 6 groups
[    0.081753] Dynamic Preempt: full
[    0.081791] rcu: Preemptible hierarchical RCU implementation.
[    0.081792] rcu: 	RCU restricting CPUs from NR_CPUS=8192 to nr_cpu_ids=16.
[    0.081792] rcu: 	RCU priority boosting: priority 1 delay 500 ms.
[    0.081793] 	Trampoline variant of Tasks RCU enabled.
[    0.081793] 	Rude variant of Tasks RCU enabled.
[    0.081793] 	Tracing variant of Tasks RCU enabled.
[    0.081793] rcu: RCU calculated value of scheduler-enlistment delay is 100 jiffies.
[    0.081794] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=16
[    0.081799] RCU Tasks: Setting shift to 4 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=16.
[    0.081801] RCU Tasks Rude: Setting shift to 4 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=16.
[    0.083542] NR_IRQS: 524544, nr_irqs: 2184, preallocated irqs: 16
[    0.083875] rcu: srcu_init: Setting srcu_struct sizes based on contention.
[    0.084094] kfence: initialized - using 2097152 bytes for 255 objects at 0x(____ptrval____)-0x(____ptrval____)
[    0.084121] Console: colour dummy device 80x25
[    0.084123] printk: legacy console [tty0] enabled
[    0.084155] ACPI: Core revision 20251212
[    0.084431] hpet: HPET dysfunctional in PC10. Force disabled.
[    0.084560] APIC: Switch to symmetric I/O mode setup
[    0.084561] DMAR: Host address width 42
[    0.084562] DMAR: DRHD base: 0x000000fc800000 flags: 0x0
[    0.084566] DMAR: dmar0: reg_base_addr fc800000 ver 7:1 cap e9de008cee690402 ecap 1aca9a00f0ef5e
[    0.084570] DMAR: DRHD base: 0x000000fc810000 flags: 0x0
[    0.084572] DMAR: dmar1: reg_base_addr fc810000 ver 7:1 cap e9de008cee690402 ecap 1aca9a00f0ef5e
[    0.084575] DMAR: DRHD base: 0x000000fc820000 flags: 0x1
[    0.084613] DMAR: dmar2: reg_base_addr fc820000 ver 7:1 cap e9de008cee690402 ecap 12c89804f0efda
[    0.084625] DMAR: SATC flags: 0x1
[    0.084627] DMAR-IR: IOAPIC id 2 under DRHD base  0xfc820000 IOMMU 2
[    0.084627] DMAR-IR: HPET id 0 under DRHD base 0xfc820000
[    0.084628] DMAR-IR: Queued invalidation will be enabled to support x2apic and Intr-remapping.
[    0.086336] DMAR-IR: Enabled IRQ remapping in x2apic mode
[    0.090267] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x6a464ae9873, max_idle_ns: 881590529744 ns
[    0.090272] Calibrating delay loop (skipped), value calculated using timer frequency.. 7372.80 BogoMIPS (lpj=3686400)
[    0.090352] CPU0: Thermal monitoring enabled (TM1)
[    0.090353] x86/cpu: User Mode Instruction Prevention (UMIP) activated
[    0.090513] CET detected: Indirect Branch Tracking enabled
[    0.090514] Last level iTLB entries: 4KB 0, 2MB 0, 4MB 0
[    0.090514] Last level dTLB entries: 4KB 0, 2MB 0, 4MB 0, 1GB 0
[    0.090519] process: using mwait in idle threads
[    0.090520] mitigations: Enabled attack vectors: user_kernel, user_user, guest_host, guest_guest, SMT mitigations: auto
[    0.090522] Speculative Store Bypass: Mitigation: Speculative Store Bypass disabled via prctl
[    0.090523] Spectre V2 : Mitigation: Enhanced / Automatic IBRS
[    0.090524] Spectre V1 : Mitigation: usercopy/swapgs barriers and __user pointer sanitization
[    0.090525] Spectre V2 : mitigation: Enabling conditional Indirect Branch Prediction Barrier
[    0.090532] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
[    0.090532] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    0.090533] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    0.090533] x86/fpu: Supporting XSAVE feature 0x200: 'Protection Keys User registers'
[    0.090534] x86/fpu: Supporting XSAVE feature 0x800: 'Control-flow User registers'
[    0.090534] x86/fpu: Supporting XSAVE feature 0x1000: 'Control-flow Kernel registers (KVM only)'
[    0.090535] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.090535] x86/fpu: xstate_offset[9]:  832, xstate_sizes[9]:    8
[    0.090536] x86/fpu: xstate_offset[11]:  840, xstate_sizes[11]:   16
[    0.090536] x86/fpu: xstate_offset[12]:  856, xstate_sizes[12]:   24
[    0.090537] x86/fpu: Enabled xstate features 0x1a07, context size is 880 bytes, using 'compacted' format.
[    0.091270] Freeing SMP alternatives memory: 60K
[    0.091270] pid_max: default: 32768 minimum: 301
[    0.091270] landlock: Up and running.
[    0.091270] Yama: becoming mindful.
[    0.091270] LSM support for eBPF active
[    0.091270] Mount-cache hash table entries: 65536 (order: 7, 524288 bytes, linear)
[    0.091270] Mountpoint-cache hash table entries: 65536 (order: 7, 524288 bytes, linear)
[    0.091270] VFS: Finished mounting rootfs on nullfs
[    0.091270] smpboot: CPU0: Intel(R) Core(TM) Ultra X7 358H (family: 0x6, model: 0xcc, stepping: 0x2)
[    0.091270] Performance Events: XSAVE Architectural LBR,  AnyThread deprecated, Pantherlake Hybrid events, Architectural PEBS, 32-deep LBR, full-width counters, Intel PMU driver.
[    0.091270] core: The two events 0xc0 and 0x3c may not be fully scheduled under some circumstances as a PEBS event.
[    0.091270] core: The two events 0xc0 and 0x13c may not be fully scheduled under some circumstances as a PEBS event.
[    0.091270] core: The two events 0x3c and 0x13c may not be fully scheduled under some circumstances as a PEBS event.
[    0.091270] core: The event 0x148 is not supported as a PEBS PDIST event.
[    0.091270] core: The event 0x175 is not supported as a PEBS PDIST event.
[    0.091270] core: The event 0x8a3 is not supported as a PEBS PDIST event.
[    0.091270] core: The event 0xca3 is not supported as a PEBS PDIST event.
[    0.091270] core: The event 0x1b1 is not supported as a PEBS PDIST event.
[    0.091270] core: The event 0x1cd is not supported as a PEBS PDIST event.
[    0.091270] core: The event 0x1cd is not supported as a PEBS PDIST event.
[    0.091270] core: cpu_core PMU driver: 
[    0.091270] ... version:                   6
[    0.091270] ... bit width:                 48
[    0.091270] ... generic counters:          10
[    0.091270] ... generic bitmap:            00000000000003ff
[    0.091270] ... fixed-purpose counters:    4
[    0.091270] ... fixed-purpose bitmap:      000000000000000f
[    0.091270] ... value mask:                0000ffffffffffff
[    0.091270] ... max period:                00007fffffffffff
[    0.091270] ... global_ctrl mask:          0001000f000003ff
[    0.091270] signal: max sigframe size: 3632
[    0.091270] Estimated ratio of average max frequency by base frequency (times 1024): 1245
[    0.091270] rcu: Hierarchical SRCU implementation.
[    0.091270] rcu: 	Max phase no-delay instances is 400.
[    0.091270] Timer migration: 2 hierarchy levels; 8 children per group; 2 crossnode level
[    0.091270] NMI watchdog: Enabled. Permanently consumes one hw-PMU counter.
[    0.091270] smp: Bringing up secondary CPUs ...
[    0.091270] smpboot: x86: Booting SMP configuration:
[    0.091270] .... node  #0, CPUs:        #1  #2  #3  #4  #5  #6  #7  #8  #9 #10 #11 #12 #13 #14 #15
[    0.007254] Initialize FRED on CPU12
[    0.007254] Initialize FRED on CPU13
[    0.007254] Initialize FRED on CPU14
[    0.007254] Initialize FRED on CPU15
[    0.007254] Initialize FRED on CPU5
[    0.007254] Initialize FRED on CPU2
[    0.007254] Initialize FRED on CPU11
[    0.007254] Initialize FRED on CPU3
[    0.007254] Initialize FRED on CPU7
[    0.007254] Initialize FRED on CPU8
[    0.007254] Initialize FRED on CPU6
[    0.007254] Initialize FRED on CPU10
[    0.007254] Initialize FRED on CPU4
[    0.007254] Initialize FRED on CPU1
[    0.007254] Initialize FRED on CPU9
[    0.007254] core: The two events 0xc0 and 0x3c may not be fully scheduled under some circumstances as a PEBS event.
[    0.007254] core: The two events 0xc0 and 0x13c may not be fully scheduled under some circumstances as a PEBS event.
[    0.007254] core: The two events 0xc0 and 0x73 may not be fully scheduled under some circumstances as a PEBS event.
[    0.007254] core: The two events 0xc0 and 0x19c may not be fully scheduled under some circumstances as a PEBS event.
[    0.007254] core: The two events 0xc0 and 0x2c2 may not be fully scheduled under some circumstances as a PEBS event.
[    0.007254] core: The two events 0x3c and 0x13c may not be fully scheduled under some circumstances as a PEBS event.
[    0.007254] core: The two events 0x3c and 0x73 may not be fully scheduled under some circumstances as a PEBS event.
[    0.007254] core: The two events 0x3c and 0x19c may not be fully scheduled under some circumstances as a PEBS event.
[    0.007254] core: The two events 0x3c and 0x2c2 may not be fully scheduled under some circumstances as a PEBS event.
[    0.007254] core: The two events 0x13c and 0x73 may not be fully scheduled under some circumstances as a PEBS event.
[    0.007254] core: The two events 0x13c and 0x19c may not be fully scheduled under some circumstances as a PEBS event.
[    0.007254] core: The two events 0x13c and 0x2c2 may not be fully scheduled under some circumstances as a PEBS event.
[    0.007254] core: The two events 0x73 and 0x19c may not be fully scheduled under some circumstances as a PEBS event.
[    0.007254] core: The two events 0x73 and 0x2c2 may not be fully scheduled under some circumstances as a PEBS event.
[    0.007254] core: The two events 0x19c and 0x2c2 may not be fully scheduled under some circumstances as a PEBS event.
[    0.007254] core: The event 0x5d0 is not supported as an auto-counter reload event.
[    0.007254] core: cpu_atom PMU driver: 
[    0.007254] ... version:                   6
[    0.007254] ... bit width:                 48
[    0.007254] ... generic counters:          8
[    0.007254] ... generic bitmap:            00000000000000ff
[    0.007254] ... fixed-purpose counters:    6
[    0.007254] ... fixed-purpose bitmap:      0000000000000077
[    0.007254] ... value mask:                0000ffffffffffff
[    0.007254] ... max period:                00007fffffffffff
[    0.007254] ... global_ctrl mask:          00000077000000ff
[    0.101349] smp: Brought up 1 node, 16 CPUs
[    0.102314] smpboot: Total of 16 processors activated (117964.80 BogoMIPS)
[    0.103423] Memory: 32179560K/33104052K available (22219K kernel code, 2964K rwdata, 16416K rodata, 4700K init, 4480K bss, 894412K reserved, 0K cma-reserved)
[    0.103423] devtmpfs: initialized
[    0.103423] x86/mm: Memory block size: 128MB
[    0.104827] ACPI: PM: Registering ACPI NVS region [mem 0x61278000-0x6127806a] (107 bytes)
[    0.104827] ACPI: PM: Registering ACPI NVS region [mem 0x667d3000-0x667d4fff] (8192 bytes)
[    0.104827] ACPI: PM: Registering ACPI NVS region [mem 0x67cca000-0x67ccafff] (4096 bytes)
[    0.104827] ACPI: PM: Registering ACPI NVS region [mem 0x6d511000-0x6dd71fff] (8785920 bytes)
[    0.104827] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1911260446275000 ns
[    0.104827] posixtimers hash table entries: 8192 (order: 5, 131072 bytes, linear)
[    0.104827] futex hash table entries: 4096 (262144 bytes on 1 NUMA nodes, total 256 KiB, linear).
[    0.104827] PM: RTC time: 13:53:21, date: 2026-05-08
[    0.105414] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.105713] DMA: preallocated 4096 KiB GFP_KERNEL pool for atomic allocations
[    0.105954] DMA: preallocated 4096 KiB GFP_KERNEL|GFP_DMA pool for atomic allocations
[    0.106213] DMA: preallocated 4096 KiB GFP_KERNEL|GFP_DMA32 pool for atomic allocations
[    0.106216] audit: initializing netlink subsys (disabled)
[    0.106219] audit: type=2000 audit(1778248401.015:1): state=initialized audit_enabled=0 res=1
[    0.106278] thermal_sys: Registered thermal governor 'fair_share'
[    0.106279] thermal_sys: Registered thermal governor 'bang_bang'
[    0.106280] thermal_sys: Registered thermal governor 'step_wise'
[    0.106280] thermal_sys: Registered thermal governor 'user_space'
[    0.106281] thermal_sys: Registered thermal governor 'power_allocator'
[    0.106284] cpuidle: using governor ladder
[    0.106284] cpuidle: using governor menu
[    0.106294] Simple Boot Flag at 0x47 set to 0x80
[    0.109017] efi: Freeing EFI boot services memory: 164528K
[    0.109019] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    0.109122] PCI: ECAM [mem 0xe0000000-0xea9fffff] (base 0xe0000000) for domain 0000 [bus 00-a9]
[    0.109133] PCI: Using configuration type 1 for base access
[    0.109161] kprobes: kprobe jump-optimization is enabled. All kprobes are optimized if possible.
[    0.109434] HugeTLB: registered 1.00 GiB page size, pre-allocated 0 pages
[    0.109434] HugeTLB: 16380 KiB vmemmap can be freed for a 1.00 GiB page
[    0.109434] HugeTLB: registered 2.00 MiB page size, pre-allocated 0 pages
[    0.109434] HugeTLB: 28 KiB vmemmap can be freed for a 2.00 MiB page
[    0.111450] raid6: skipped pq benchmark and selected avx2x4
[    0.111454] raid6: using avx2x2 recovery algorithm
[    0.111580] ACPI: Added _OSI(Module Device)
[    0.111583] ACPI: Added _OSI(Processor Device)
[    0.111584] ACPI: Added _OSI(Processor Aggregator Device)
[    0.203179] ACPI BIOS Error (bug): Failure creating named object [\TDPH], AE_ALREADY_EXISTS (20251212/dswload2-327)
[    0.203189] fbcon: Taking over console
[    0.203197] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20251212/psobject-220)
[    0.203227] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.HIDG], AE_ALREADY_EXISTS (20251212/dswload2-327)
[    0.203233] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20251212/psobject-220)
[    0.203239] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.TP7G], AE_ALREADY_EXISTS (20251212/dswload2-327)
[    0.203243] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20251212/psobject-220)
[    0.203250] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.TP7D], AE_ALREADY_EXISTS (20251212/dswload2-327)
[    0.203254] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20251212/psobject-220)
[    0.203257] ACPI: Skipping parse of AML opcode: Method (0x0014)
[    0.203260] ACPI BIOS Error (bug): Failure creating named object [\_SB.PC00.I2CM], AE_ALREADY_EXISTS (20251212/dswload2-327)
[    0.203265] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog (20251212/psobject-220)
[    0.203267] ACPI: Skipping parse of AML opcode: Method (0x0014)
[    0.210998] ACPI: 30 ACPI AML tables successfully acquired and loaded
[    0.237448] ACPI: \_SB_: platform _OSC: OS support mask [006e7eff]
[    0.239084] ACPI: \_SB_: platform _OSC: OS control mask [006e7eff]
[    0.239541] ACPI: USB4 _OSC: OS supports USB3+ DisplayPort+ PCIe+ XDomain+
[    0.239543] ACPI: USB4 _OSC: OS controls USB3+ DisplayPort+ PCIe+ XDomain+
[    0.244270] ACPI: EC: EC started
[    0.244270] ACPI: EC: interrupt blocked
[    0.255201] ACPI: EC: EC_CMD/EC_SC=0x934, EC_DATA=0x930
[    0.255204] ACPI: \_SB_.PC00.LPCB.ECDV: Boot DSDT EC used to handle transactions
[    0.255206] ACPI: Interpreter enabled
[    0.255278] ACPI: PM: (supports S0 S4 S5)
[    0.255279] ACPI: Using IOAPIC for interrupt routing
[    0.257805] HEST: Table parsing has been initialized.
[    0.257847] GHES: APEI firmware first mode is enabled by APEI bit.
[    0.257851] PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
[    0.257853] PCI: Ignoring E820 reservations for host bridge windows
[    0.260682] ACPI: Enabled 9 GPEs in block 00 to 7F
[    0.260733] ACPI: Enabled 15 GPEs in block 80 to DF
[    0.291182] ACPI: \_SB_.PC00.I2C4.PXTC: New power resource
[    0.292706] ACPI: \_SB_.PC00.I2C5.PTPL: New power resource
[    0.293846] ACPI: \_SB_.PC00.CNVW.WRST: New power resource
[    0.294048] ACPI: \_SB_.PC00.BTPC.WRST: New power resource
[    0.298617] ACPI: \_SB_.PC00.RP04.PXSX.WRST: New power resource
[    0.305359] ACPI: \_SB_.PC00.TBT0: New power resource
[    0.305382] ACPI: \_SB_.PC00.TBT1: New power resource
[    0.305404] ACPI: \_SB_.PC00.D3C_: New power resource
[    0.334893] ACPI: \PIN_: New power resource
[    0.336381] ACPI: PCI Root Bridge [PC00] (domain 0000 [bus 00-a9])
[    0.336389] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI EDR HPX-Type3]
[    0.338932] acpi PNP0A08:00: _OSC: OS now controls [PCIeHotplug SHPCHotplug PME AER PCIeCapability LTR DPC]
[    0.343375] PCI host bridge to bus 0000:00
[    0.343379] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window]
[    0.343382] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
[    0.343384] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bffff window]
[    0.343385] pci_bus 0000:00: root bus resource [mem 0x80800000-0xdfffffff window]
[    0.343387] pci_bus 0000:00: root bus resource [mem 0x8000000000-0x3ffffffffff window]
[    0.343389] pci_bus 0000:00: root bus resource [bus 00-a9]
[    0.343418] pci 0000:00:00.0: [8086:b001] type 00 class 0x060000 conventional PCI endpoint
[    0.343703] pci 0000:00:02.0: [8086:b080] type 00 class 0x030000 PCIe Root Complex Integrated Endpoint
[    0.343998] pci 0000:00:02.0: BAR 0 [mem 0xc814000000-0xc814ffffff 64bit pref]
[    0.344004] pci 0000:00:02.0: BAR 2 [mem 0x8000000000-0x800fffffff 64bit pref]
[    0.344011] pci 0000:00:02.0: ROM [mem 0xffe00000-0xffffffff pref]
[    0.344083] pci 0000:00:02.0: Video device with shadowed ROM at [mem 0x000c0000-0x000dffff]
[    0.344329] pci 0000:00:02.0: VF BAR 0 [mem 0x00000000-0x00ffffff 64bit pref]
[    0.344331] pci 0000:00:02.0: VF BAR 0 [mem 0x00000000-0x06ffffff 64bit pref]: contains BAR 0 for 7 VFs
[    0.344834] pci 0000:00:04.0: [8086:b01d] type 00 class 0x118000 conventional PCI endpoint
[    0.344877] pci 0000:00:04.0: BAR 0 [mem 0xc815300000-0xc81531ffff 64bit]
[    0.345220] pci 0000:00:05.0: [8086:b05d] type 00 class 0x048000 PCIe Root Complex Integrated Endpoint
[    0.345262] pci 0000:00:05.0: BAR 0 [mem 0xc812000000-0xc813ffffff 64bit]
[    0.345268] pci 0000:00:05.0: BAR 4 [mem 0xc81537a000-0xc81537afff 64bit]
[    0.345691] pci 0000:00:06.0: [8086:e461] type 01 class 0x060400 PCIe Root Port
[    0.345779] pci 0000:00:06.0: PCI bridge to [bus 01]
[    0.345799] pci 0000:00:06.0:   bridge window [mem 0x9c200000-0x9c2fffff]
[    0.346101] pci 0000:00:06.0: PME# supported from D0 D3hot D3cold
[    0.346256] pci 0000:00:06.0: PTM enabled (root), 4ns granularity
[    0.347708] pci 0000:00:07.0: [8086:e44e] type 01 class 0x060400 PCIe Root Port
[    0.347761] pci 0000:00:07.0: PCI bridge to [bus 02-39]
[    0.347772] pci 0000:00:07.0:   bridge window [mem 0x94000000-0x9bffffff]
[    0.347792] pci 0000:00:07.0:   bridge window [mem 0x8010000000-0x980fffffff 64bit pref]
[    0.347982] pci 0000:00:07.0: PME# supported from D0 D3hot D3cold
[    0.348040] pci 0000:00:07.0: PTM enabled (root), 4ns granularity
[    0.349283] pci 0000:00:07.1: [8086:e44f] type 01 class 0x060400 PCIe Root Port
[    0.349336] pci 0000:00:07.1: PCI bridge to [bus 3a-71]
[    0.349347] pci 0000:00:07.1:   bridge window [mem 0x8c000000-0x93ffffff]
[    0.349367] pci 0000:00:07.1:   bridge window [mem 0x9810000000-0xb00fffffff 64bit pref]
[    0.349552] pci 0000:00:07.1: PME# supported from D0 D3hot D3cold
[    0.349607] pci 0000:00:07.1: PTM enabled (root), 4ns granularity
[    0.350868] pci 0000:00:07.2: [8086:e460] type 01 class 0x060400 PCIe Root Port
[    0.350921] pci 0000:00:07.2: PCI bridge to [bus 72-a9]
[    0.350932] pci 0000:00:07.2:   bridge window [mem 0x84000000-0x8bffffff]
[    0.350952] pci 0000:00:07.2:   bridge window [mem 0xb010000000-0xc80fffffff 64bit pref]
[    0.351136] pci 0000:00:07.2: PME# supported from D0 D3hot D3cold
[    0.351191] pci 0000:00:07.2: PTM enabled (root), 4ns granularity
[    0.353347] pci 0000:00:0a.0: [8086:b07d] type 00 class 0x118000 PCIe Root Complex Integrated Endpoint
[    0.353403] pci 0000:00:0a.0: BAR 0 [mem 0xc815350000-0xc81535ffff 64bit]
[    0.353420] pci 0000:00:0a.0: enabling Extended Tags
[    0.353585] pci 0000:00:0b.0: [8086:b03e] type 00 class 0x120000 PCIe Root Complex Integrated Endpoint
[    0.353627] pci 0000:00:0b.0: BAR 0 [mem 0xc810000000-0xc811ffffff 64bit]
[    0.353632] pci 0000:00:0b.0: BAR 4 [mem 0xc815379000-0xc815379fff 64bit]
[    0.353844] pci 0000:00:0d.0: [8086:e431] type 00 class 0x0c0330 conventional PCI endpoint
[    0.353920] pci 0000:00:0d.0: BAR 0 [mem 0xc815340000-0xc81534ffff 64bit]
[    0.354005] pci 0000:00:0d.0: PME# supported from D3hot D3cold
[    0.354270] pci 0000:00:0d.2: [8086:e433] type 00 class 0x0c0340 conventional PCI endpoint
[    0.354270] pci 0000:00:0d.2: BAR 0 [mem 0xc8152c0000-0xc8152fffff 64bit]
[    0.354270] pci 0000:00:0d.2: BAR 2 [mem 0xc815378000-0xc815378fff 64bit]
[    0.354270] pci 0000:00:0d.2: supports D1 D2
[    0.354270] pci 0000:00:0d.2: PME# supported from D0 D1 D2 D3hot D3cold
[    0.354270] pci 0000:00:0d.3: [8086:e434] type 00 class 0x0c0340 conventional PCI endpoint
[    0.354270] pci 0000:00:0d.3: BAR 0 [mem 0xc815280000-0xc8152bffff 64bit]
[    0.354270] pci 0000:00:0d.3: BAR 2 [mem 0xc815377000-0xc815377fff 64bit]
[    0.354270] pci 0000:00:0d.3: supports D1 D2
[    0.354270] pci 0000:00:0d.3: PME# supported from D0 D1 D2 D3hot D3cold
[    0.354270] pci 0000:00:12.0: [8086:e445] type 00 class 0x070000 conventional PCI endpoint
[    0.354270] pci 0000:00:12.0: BAR 0 [mem 0xc815330000-0xc81533ffff 64bit]
[    0.354270] pci 0000:00:12.0: PME# supported from D0 D3hot
[    0.354270] pci 0000:00:13.0: [8086:e462] type 00 class 0x078000 conventional PCI endpoint
[    0.354270] pci 0000:00:13.0: BAR 0 [mem 0xc815376000-0xc815376fff 64bit]
[    0.355335] pci 0000:00:13.0: PME# supported from D3hot
[    0.355551] pci 0000:00:14.0: [8086:e47d] type 00 class 0x0c0330 conventional PCI endpoint
[    0.355624] pci 0000:00:14.0: BAR 0 [mem 0xc815320000-0xc81532ffff 64bit]
[    0.355706] pci 0000:00:14.0: PME# supported from D3hot D3cold
[    0.356296] pci 0000:00:14.2: [8086:e47f] type 00 class 0x050000 conventional PCI endpoint
[    0.356375] pci 0000:00:14.2: BAR 0 [mem 0xc815360000-0xc815367fff 64bit]
[    0.356381] pci 0000:00:14.2: BAR 2 [mem 0xc815375000-0xc815375fff 64bit]
[    0.356696] pci 0000:00:14.3: [8086:e440] type 00 class 0x028000 PCIe Root Complex Integrated Endpoint
[    0.356765] pci 0000:00:14.3: BAR 0 [mem 0xc81536c000-0xc81536ffff 64bit]
[    0.356786] pci 0000:00:14.3: enabling Extended Tags
[    0.356868] pci 0000:00:14.3: PME# supported from D0 D3hot D3cold
[    0.358461] pci 0000:00:14.7: [8086:e476] type 00 class 0x0d1100 PCIe Root Complex Integrated Endpoint
[    0.358531] pci 0000:00:14.7: BAR 0 [mem 0xc815368000-0xc81536bfff 64bit]
[    0.358553] pci 0000:00:14.7: enabling Extended Tags
[    0.358637] pci 0000:00:14.7: PME# supported from D0 D3hot D3cold
[    0.359069] pci 0000:00:16.0: [8086:e470] type 00 class 0x078000 conventional PCI endpoint
[    0.359154] pci 0000:00:16.0: BAR 0 [mem 0xc815374000-0xc815374fff 64bit]
[    0.359238] pci 0000:00:16.0: PME# supported from D3hot
[    0.359270] pci 0000:00:18.0: [8086:e45d] type 00 class 0x078000 conventional PCI endpoint
[    0.359270] pci 0000:00:18.0: BAR 0 [mem 0xc815373000-0xc815373fff 64bit]
[    0.359270] pci 0000:00:18.0: PME# supported from D3hot
[    0.359396] pci 0000:00:19.0: [8086:e450] type 00 class 0x0c8000 conventional PCI endpoint
[    0.359649] pci 0000:00:19.0: BAR 0 [mem 0x00000000-0x00000fff 64bit]
[    0.371567] pci 0000:00:19.1: [8086:e451] type 00 class 0x0c8000 conventional PCI endpoint
[    0.371796] pci 0000:00:19.1: BAR 0 [mem 0x00000000-0x00000fff 64bit]
[    0.383732] pci 0000:00:1f.0: [8086:e402] type 00 class 0x060100 conventional PCI endpoint
[    0.384483] pci 0000:00:1f.3: [8086:e428] type 00 class 0x040380 conventional PCI endpoint
[    0.384700] pci 0000:00:1f.3: BAR 0 [mem 0xc815200000-0xc81527ffff 64bit]
[    0.384723] pci 0000:00:1f.3: BAR 4 [mem 0xc815000000-0xc8151fffff 64bit]
[    0.384923] pci 0000:00:1f.3: PME# supported from D3hot D3cold
[    0.385272] pci 0000:00:1f.4: [8086:e422] type 00 class 0x0c0500 conventional PCI endpoint
[    0.385403] pci 0000:00:1f.4: BAR 0 [mem 0xc815370000-0xc8153700ff 64bit]
[    0.385414] pci 0000:00:1f.4: BAR 4 [io  0xefa0-0xefbf]
[    0.385837] pci 0000:00:1f.5: [8086:e423] type 00 class 0x0c8000 conventional PCI endpoint
[    0.386017] pci 0000:00:1f.5: BAR 0 [mem 0xfe010000-0xfe010fff]
[    0.386721] pci 0000:01:00.0: [1e0f:002f] type 00 class 0x010802 PCIe Endpoint
[    0.386810] pci 0000:01:00.0: BAR 0 [mem 0x9c200000-0x9c203fff 64bit]
[    0.387262] pci 0000:00:06.0: ASPM: current common clock configuration is inconsistent, reconfiguring
[    0.387340] pci 0000:00:06.0: PCI bridge to [bus 01]
[    0.387448] pci 0000:00:07.0: PCI bridge to [bus 02-39]
[    0.387545] pci 0000:00:07.1: PCI bridge to [bus 3a-71]
[    0.387641] pci 0000:00:07.2: PCI bridge to [bus 72-a9]
[    0.396696] ACPI: \_SB_.PEPD: Duplicate LPS0 _DSM functions (mask: 0x1)
[    0.396699] Low-power S0 idle used by default for system suspend
[    0.409140] ACPI: EC: interrupt unblocked
[    0.409141] ACPI: EC: event unblocked
[    0.409153] ACPI: EC: EC_CMD/EC_SC=0x934, EC_DATA=0x930
[    0.409154] ACPI: EC: GPE=0x6e
[    0.409156] ACPI: \_SB_.PC00.LPCB.ECDV: Boot DSDT EC initialization complete
[    0.409158] ACPI: \_SB_.PC00.LPCB.ECDV: EC: Used to handle transactions and events
[    0.409317] iommu: Default domain type: Translated
[    0.409317] iommu: DMA domain TLB invalidation policy: lazy mode
[    0.410832] SCSI subsystem initialized
[    0.411308] libata version 3.00 loaded.
[    0.411318] ACPI: bus type USB registered
[    0.411375] usbcore: registered new interface driver usbfs
[    0.411404] usbcore: registered new interface driver hub
[    0.411430] usbcore: registered new device driver usb
[    0.411614] EDAC MC: Ver: 3.0.0
[    0.413296] efivars: Registered efivars operations
[    0.413923] NetLabel: Initializing
[    0.413923] NetLabel:  domain hash size = 128
[    0.413923] NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
[    0.413923] NetLabel:  unlabeled traffic allowed by default
[    0.413923] mctp: management component transport protocol core
[    0.413923] NET: Registered PF_MCTP protocol family
[    0.413923] PCI: Using ACPI for IRQ routing
[    0.428113] PCI: pci_cache_line_size set to 64 bytes
[    0.429441] pci 0000:00:1f.5: BAR 0 [mem 0xfe010000-0xfe010fff]: can't claim; no compatible bridge window
[    0.429952] e820: register RAM buffer resource [mem 0x0009f000-0x0009ffff]
[    0.429955] e820: register RAM buffer resource [mem 0x611e5000-0x63ffffff]
[    0.429957] e820: register RAM buffer resource [mem 0x61278000-0x63ffffff]
[    0.429958] e820: register RAM buffer resource [mem 0x66719000-0x67ffffff]
[    0.429960] e820: register RAM buffer resource [mem 0x667cf000-0x67ffffff]
[    0.429961] e820: register RAM buffer resource [mem 0x67cca000-0x67ffffff]
[    0.429962] e820: register RAM buffer resource [mem 0x69515000-0x6bffffff]
[    0.429963] e820: register RAM buffer resource [mem 0x6e000000-0x6fffffff]
[    0.429965] e820: register RAM buffer resource [mem 0x87f800000-0x87fffffff]
[    0.430012] pci 0000:00:02.0: vgaarb: setting as boot VGA device
[    0.430012] pci 0000:00:02.0: vgaarb: bridge control possible
[    0.430012] pci 0000:00:02.0: vgaarb: VGA device added: decodes=io+mem,owns=io+mem,locks=none
[    0.430012] vgaarb: loaded
[    0.432496] clocksource: Switched to clocksource tsc-early
[    0.432662] VFS: Disk quotas dquot_6.6.0
[    0.432679] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    0.432760] acpi PNP0C02:00: Skipped [io  0x0061]
[    0.432764] acpi PNP0C02:00: Skipped [io  0x0063]
[    0.432765] acpi PNP0C02:00: Skipped [io  0x0065]
[    0.432766] acpi PNP0C02:00: Skipped [io  0x0067]
[    0.432767] acpi PNP0C02:00: Skipped [io  0x0070]
[    0.432768] acpi PNP0C02:00: Skipped [io  0x0080]
[    0.432769] acpi PNP0C02:00: Skipped [io  0x0092]
[    0.432770] acpi PNP0C02:00: Skipped [io  0x00b2-0x00b3]
[    0.432772] acpi PNP0C02:00: Reserved [io  0x0680-0x069f]
[    0.432774] acpi PNP0C02:00: Reserved [io  0x164e-0x164f]
[    0.433089] acpi PNP0C02:03: Reserved [mem 0xfedc0000-0xfedc7fff]
[    0.433091] acpi PNP0C02:03: Reserved [mem 0xfa000000-0xfa000fff]
[    0.433093] acpi PNP0C02:03: Could not reserve [mem 0x00000000-0x00000fff]
[    0.433095] acpi PNP0C02:03: Reserved [mem 0xe0000000-0xefffffff]
[    0.433097] acpi PNP0C02:03: Could not reserve [mem 0xfed20000-0xfed7ffff]
[    0.433098] acpi PNP0C02:03: Could not reserve [mem 0xfc800000-0xfc81ffff]
[    0.433100] acpi PNP0C02:03: Reserved [mem 0xfed45000-0xfed8ffff]
[    0.433102] acpi PNP0C02:03: Reserved [mem 0xfee00000-0xfeefffff]
[    0.433367] acpi PNP0C02:04: Reserved [mem 0xfe000000-0xfe01ffff]
[    0.433369] acpi PNP0C02:04: Reserved [mem 0xfe04c000-0xfe04ffff]
[    0.433371] acpi PNP0C02:04: Reserved [mem 0xfe050000-0xfe0affff]
[    0.433373] acpi PNP0C02:04: Reserved [mem 0xfe0d0000-0xfe0fffff]
[    0.433374] acpi PNP0C02:04: Reserved [mem 0xfe200000-0xfe7fffff]
[    0.433376] acpi PNP0C02:04: Reserved [mem 0xff000000-0xffffffff]
[    0.433378] acpi PNP0C02:04: Could not reserve [io  0x1800-0x18fe]
[    0.433380] acpi PNP0C02:04: Reserved [mem 0x4000000000-0x400058ffff]
[    0.433595] acpi PNP0C02:05: Reserved [io  0x2000-0x20fe]
[    0.434120] pnp: PnP ACPI init
[    0.442297] pnp: PnP ACPI: found 3 devices
[    0.449711] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
[    0.449822] NET: Registered PF_INET protocol family
[    0.450077] IP idents hash table entries: 262144 (order: 9, 2097152 bytes, linear)
[    0.474249] tcp_listen_portaddr_hash hash table entries: 16384 (order: 6, 262144 bytes, linear)
[    0.474302] Table-perturb hash table entries: 65536 (order: 6, 262144 bytes, linear)
[    0.474486] TCP established hash table entries: 262144 (order: 9, 2097152 bytes, linear)
[    0.474929] TCP bind hash table entries: 65536 (order: 9, 2097152 bytes, linear)
[    0.475122] TCP: Hash tables configured (established 262144 bind 65536)
[    0.475274] MPTCP token hash table entries: 32768 (order: 8, 786432 bytes, linear)
[    0.475424] UDP hash table entries: 16384 (order: 8, 1048576 bytes, linear)
[    0.475617] UDP-Lite hash table entries: 16384 (order: 8, 1048576 bytes, linear)
[    0.475764] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.475771] NET: Registered PF_XDP protocol family
[    0.475780] pci 0000:00:07.0: bridge window [io  0x1000-0x0fff] to [bus 02-39] add_size 1000
[    0.475785] pci 0000:00:07.1: bridge window [io  0x1000-0x0fff] to [bus 3a-71] add_size 1000
[    0.475787] pci 0000:00:07.2: bridge window [io  0x1000-0x0fff] to [bus 72-a9] add_size 1000
[    0.475801] pci 0000:00:02.0: VF BAR 0 [mem 0xc816000000-0xc81cffffff 64bit pref]: assigned
[    0.475850] pci 0000:00:07.0: bridge window [io  0x3000-0x3fff]: assigned
[    0.475852] pci 0000:00:07.1: bridge window [io  0x4000-0x4fff]: assigned
[    0.475854] pci 0000:00:07.2: bridge window [io  0x5000-0x5fff]: assigned
[    0.475857] pci 0000:00:19.0: BAR 0 [mem 0xc815371000-0xc815371fff 64bit]: assigned
[    0.475916] pci 0000:00:19.1: BAR 0 [mem 0xc815372000-0xc815372fff 64bit]: assigned
[    0.475937] pci 0000:00:1f.5: BAR 0 [mem 0x80800000-0x80800fff]: assigned
[    0.475953] pci 0000:00:06.0: PCI bridge to [bus 01]
[    0.476028] pci 0000:00:06.0:   bridge window [mem 0x9c200000-0x9c2fffff]
[    0.476051] pci 0000:00:07.0: PCI bridge to [bus 02-39]
[    0.476057] pci 0000:00:07.0:   bridge window [io  0x3000-0x3fff]
[    0.476065] pci 0000:00:07.0:   bridge window [mem 0x94000000-0x9bffffff]
[    0.476070] pci 0000:00:07.0:   bridge window [mem 0x8010000000-0x980fffffff 64bit pref]
[    0.476080] pci 0000:00:07.1: PCI bridge to [bus 3a-71]
[    0.476083] pci 0000:00:07.1:   bridge window [io  0x4000-0x4fff]
[    0.476090] pci 0000:00:07.1:   bridge window [mem 0x8c000000-0x93ffffff]
[    0.476095] pci 0000:00:07.1:   bridge window [mem 0x9810000000-0xb00fffffff 64bit pref]
[    0.476110] pci 0000:00:07.2: PCI bridge to [bus 72-a9]
[    0.476113] pci 0000:00:07.2:   bridge window [io  0x5000-0x5fff]
[    0.476121] pci 0000:00:07.2:   bridge window [mem 0x84000000-0x8bffffff]
[    0.476126] pci 0000:00:07.2:   bridge window [mem 0xb010000000-0xc80fffffff 64bit pref]
[    0.476136] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
[    0.476139] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
[    0.476140] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff window]
[    0.476142] pci_bus 0000:00: resource 7 [mem 0x80800000-0xdfffffff window]
[    0.476143] pci_bus 0000:00: resource 8 [mem 0x8000000000-0x3ffffffffff window]
[    0.476145] pci_bus 0000:01: resource 1 [mem 0x9c200000-0x9c2fffff]
[    0.476146] pci_bus 0000:02: resource 0 [io  0x3000-0x3fff]
[    0.476147] pci_bus 0000:02: resource 1 [mem 0x94000000-0x9bffffff]
[    0.476148] pci_bus 0000:02: resource 2 [mem 0x8010000000-0x980fffffff 64bit pref]
[    0.476150] pci_bus 0000:3a: resource 0 [io  0x4000-0x4fff]
[    0.476151] pci_bus 0000:3a: resource 1 [mem 0x8c000000-0x93ffffff]
[    0.476152] pci_bus 0000:3a: resource 2 [mem 0x9810000000-0xb00fffffff 64bit pref]
[    0.476153] pci_bus 0000:72: resource 0 [io  0x5000-0x5fff]
[    0.476154] pci_bus 0000:72: resource 1 [mem 0x84000000-0x8bffffff]
[    0.476155] pci_bus 0000:72: resource 2 [mem 0xb010000000-0xc80fffffff 64bit pref]
[    0.477324] PCI: CLS 0 bytes, default 64
[    0.477378] DMAR: Intel-IOMMU force enabled due to platform opt in
[    0.477392] DMAR: No RMRR found
[    0.477392] DMAR: No ATSR found
[    0.477394] DMAR: dmar1: Using Queued invalidation
[    0.477397] DMAR: dmar0: Using Queued invalidation
[    0.477400] DMAR: dmar2: Using Queued invalidation
[    0.477514] Trying to unpack rootfs image as initramfs...
[    0.477546] pci 0000:00:04.0: Adding to iommu group 0
[    0.477565] pci 0000:00:05.0: Adding to iommu group 1
[    0.477688] pci 0000:00:0a.0: Adding to iommu group 2
[    0.477703] pci 0000:00:0b.0: Adding to iommu group 3
[    0.477903] pci 0000:00:02.0: Adding to iommu group 4
[    0.478511] pci 0000:00:00.0: Adding to iommu group 5
[    0.478683] pci 0000:00:06.0: Adding to iommu group 6
[    0.478708] pci 0000:00:07.0: Adding to iommu group 7
[    0.478731] pci 0000:00:07.1: Adding to iommu group 8
[    0.478755] pci 0000:00:07.2: Adding to iommu group 9
[    0.478792] pci 0000:00:0d.0: Adding to iommu group 10
[    0.478809] pci 0000:00:0d.2: Adding to iommu group 10
[    0.478826] pci 0000:00:0d.3: Adding to iommu group 10
[    0.478852] pci 0000:00:12.0: Adding to iommu group 11
[    0.478876] pci 0000:00:13.0: Adding to iommu group 12
[    0.478907] pci 0000:00:14.0: Adding to iommu group 13
[    0.478921] pci 0000:00:14.2: Adding to iommu group 13
[    0.478935] pci 0000:00:14.3: Adding to iommu group 14
[    0.478949] pci 0000:00:14.7: Adding to iommu group 15
[    0.478969] pci 0000:00:16.0: Adding to iommu group 16
[    0.478988] pci 0000:00:18.0: Adding to iommu group 17
[    0.479013] pci 0000:00:19.0: Adding to iommu group 18
[    0.479030] pci 0000:00:19.1: Adding to iommu group 18
[    0.479068] pci 0000:00:1f.0: Adding to iommu group 19
[    0.479084] pci 0000:00:1f.3: Adding to iommu group 19
[    0.479104] pci 0000:00:1f.4: Adding to iommu group 19
[    0.479120] pci 0000:00:1f.5: Adding to iommu group 19
[    0.479209] pci 0000:01:00.0: Adding to iommu group 20
[    0.479314] DMAR: Intel(R) Virtualization Technology for Directed I/O
[    0.479315] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
[    0.479316] software IO TLB: mapped [mem 0x00000000527fb000-0x00000000567fb000] (64MB)
[    0.479344] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x6a464ae9873, max_idle_ns: 881590529744 ns
[    0.479476] clocksource: Switched to clocksource tsc
[    0.487679] Initialise system trusted keyrings
[    0.487689] Key type blacklist registered
[    0.487803] workingset: timestamp_bits=36 max_order=23 bucket_order=0
[    0.488138] fuse: init (API version 7.45)
[    0.488243] integrity: Platform Keyring initialized
[    0.488246] integrity: Machine keyring initialized
[    0.499047] xor: automatically using best checksumming function   avx       
[    0.499049] Key type asymmetric registered
[    0.499050] Asymmetric key parser 'x509' registered
[    0.499070] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 245)
[    0.499158] io scheduler mq-deadline registered
[    0.499159] io scheduler kyber registered
[    0.499160] Adaptive Deadline I/O Scheduler 3.2.0 by Masahito Suzuki
[    0.499162] io scheduler adios registered
[    0.499174] io scheduler bfq registered
[    0.500318] ledtrig-cpu: registered to indicate activity on CPUs
[    0.501025] pcieport 0000:00:06.0: PME: Signaling with IRQ 125
[    0.501343] pcieport 0000:00:06.0: AER: enabled with IRQ 125
[    0.501882] pcieport 0000:00:07.0: PME: Signaling with IRQ 126
[    0.501996] pcieport 0000:00:07.0: AER: enabled with IRQ 126
[    0.502021] pcieport 0000:00:07.0: pciehp: Slot #10 AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLActRep+
[    0.502480] pcieport 0000:00:07.1: PME: Signaling with IRQ 127
[    0.502601] pcieport 0000:00:07.1: AER: enabled with IRQ 127
[    0.502622] pcieport 0000:00:07.1: pciehp: Slot #10 AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLActRep+
[    0.503117] pcieport 0000:00:07.2: PME: Signaling with IRQ 128
[    0.503221] pcieport 0000:00:07.2: AER: enabled with IRQ 128
[    0.503243] pcieport 0000:00:07.2: pciehp: Slot #10 AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLActRep+
[    0.504483] ACPI: AC: AC Adapter [AC] (off-line)
[    0.504543] input: Lid Switch as /devices/platform/PNP0C0D:00/input/input0
[    0.504556] ACPI: button: Lid Switch [LID0]
[    0.504593] input: Power Button as /devices/platform/PNP0C0C:00/input/input1
[    0.504605] ACPI: button: Power Button [PBTN]
[    0.504637] input: Sleep Button as /devices/platform/PNP0C0E:00/input/input2
[    0.504655] ACPI: button: Sleep Button [SBTN]
[    0.504989] Monitor-Mwait will be used to enter C-1 state
[    0.505001] Monitor-Mwait will be used to enter C-2 state
[    0.505010] Monitor-Mwait will be used to enter C-3 state
[    0.530140] Freeing initrd memory: 26840K
[    0.532637] Serial: 8250/16550 driver, 32 ports, IRQ sharing enabled
[    0.538229] serial 0000:00:12.0: enabling device (0000 -> 0002)
[    0.542131] hpet_acpi_add: no address or irqs in _CRS
[    0.542305] Non-volatile memory driver v1.3
[    0.542308] Linux agpgart interface v0.103
[    0.549537] tpm_tis STM0925:00: 2.0 TPM (device-id 0x3, rev-id 1)
[    0.583426] ACPI: battery: Slot [BAT0] (battery present)
[    0.650045] ACPI: bus type drm_connector registered
[    0.650874] xhci_hcd 0000:00:0d.0: xHCI Host Controller
[    0.650904] xhci_hcd 0000:00:0d.0: new USB bus registered, assigned bus number 1
[    0.652072] xhci_hcd 0000:00:0d.0: hcc params 0x20007fc1 hci version 0x120 quirks 0x0000000200009810
[    0.652519] xhci_hcd 0000:00:0d.0: xHCI Host Controller
[    0.652522] xhci_hcd 0000:00:0d.0: new USB bus registered, assigned bus number 2
[    0.652524] xhci_hcd 0000:00:0d.0: Host supports USB 3.2 Enhanced SuperSpeed
[    0.652568] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 7.00
[    0.652571] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    0.652573] usb usb1: Product: xHCI Host Controller
[    0.652574] usb usb1: Manufacturer: Linux 7.0.5-1-cachyos xhci-hcd
[    0.652575] usb usb1: SerialNumber: 0000:00:0d.0
[    0.652702] hub 1-0:1.0: USB hub found
[    0.652742] hub 1-0:1.0: 1 port detected
[    0.652981] usb usb2: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 7.00
[    0.652983] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    0.652984] usb usb2: Product: xHCI Host Controller
[    0.652986] usb usb2: Manufacturer: Linux 7.0.5-1-cachyos xhci-hcd
[    0.652987] usb usb2: SerialNumber: 0000:00:0d.0
[    0.653093] hub 2-0:1.0: USB hub found
[    0.653102] hub 2-0:1.0: 3 ports detected
[    0.654917] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    0.654921] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 3
[    0.656011] xhci_hcd 0000:00:14.0: hcc params 0x20007fc1 hci version 0x120 quirks 0x0000000200009810
[    0.656539] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    0.656541] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 4
[    0.656543] xhci_hcd 0000:00:14.0: Host supports USB 3.2 Enhanced SuperSpeed
[    0.656573] usb usb3: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 7.00
[    0.656575] usb usb3: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    0.656577] usb usb3: Product: xHCI Host Controller
[    0.656578] usb usb3: Manufacturer: Linux 7.0.5-1-cachyos xhci-hcd
[    0.656579] usb usb3: SerialNumber: 0000:00:14.0
[    0.656697] hub 3-0:1.0: USB hub found
[    0.656744] hub 3-0:1.0: 10 ports detected
[    0.661152] usb usb4: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 7.00
[    0.661154] usb usb4: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    0.661155] usb usb4: Product: xHCI Host Controller
[    0.661156] usb usb4: Manufacturer: Linux 7.0.5-1-cachyos xhci-hcd
[    0.661157] usb usb4: SerialNumber: 0000:00:14.0
[    0.661251] hub 4-0:1.0: USB hub found
[    0.661295] hub 4-0:1.0: 2 ports detected
[    0.662212] usbcore: registered new interface driver usbserial_generic
[    0.662217] usbserial: USB Serial support registered for generic
[    0.662248] i8042: PNP: PS/2 Controller [PNP0303:PS2K,PNP0f13:PS2M] at 0x60,0x64 irq 1,12
[    0.662842] i8042: Warning: Keylock active
[    0.665835] serio: i8042 KBD port at 0x60,0x64 irq 1
[    0.665877] serio: i8042 AUX port at 0x60,0x64 irq 12
[    0.666117] rtc_cmos 00:00: RTC can wake from S4
[    0.667445] rtc_cmos 00:00: registered as rtc0
[    0.667703] rtc_cmos 00:00: setting system clock to 2026-05-08T13:53:21 UTC (1778248401)
[    0.667782] rtc_cmos 00:00: alarms up to one month, y3k, 242 bytes nvram
[    0.669068] intel_pstate: Intel P-state driver initializing
[    0.670503] input: AT Translated Set 2 keyboard as /devices/platform/i8042/serio0/input/input3
[    0.671343] Hybrid CPU capacity scaling enabled
[    0.671364] processor cpu0: EM: created perf domain
[    0.671387] processor cpu1: EM: created perf domain
[    0.671399] processor cpu2: EM: created perf domain
[    0.671410] processor cpu3: EM: created perf domain
[    0.671421] processor cpu4: EM: created perf domain
[    0.671433] processor cpu5: EM: created perf domain
[    0.671445] processor cpu6: EM: created perf domain
[    0.671457] processor cpu7: EM: created perf domain
[    0.671467] processor cpu8: EM: created perf domain
[    0.671477] processor cpu9: EM: created perf domain
[    0.671490] processor cpu10: EM: created perf domain
[    0.671500] processor cpu11: EM: created perf domain
[    0.671511] processor cpu12: EM: created perf domain
[    0.671521] processor cpu13: EM: created perf domain
[    0.671533] processor cpu14: EM: created perf domain
[    0.671542] processor cpu15: EM: created perf domain
[    0.671725] intel_pstate: HWP enabled
[    0.671881] Relocating firmware framebuffer to offset 0x0000000000800000[d] within [mem 0x8000000000-0x800fffffff flags 0x14220c]
[    0.671969] simple-framebuffer simple-framebuffer.0: [drm] Registered 1 planes with drm panic
[    0.671973] [drm] Initialized simpledrm 1.0.0 for simple-framebuffer.0 on minor 0
[    0.677692] Console: switching to colour frame buffer device 180x56
[    0.684194] simple-framebuffer simple-framebuffer.0: [drm] fb0: simpledrmdrmfb frame buffer device
[    0.684224] hid: raw HID events driver (C) Jiri Kosina
[    0.684240] usbcore: registered new interface driver usbhid
[    0.684241] usbhid: USB HID core driver
[    0.684308] drop_monitor: Initializing network drop monitor service
[    0.684374] NET: Registered PF_INET6 protocol family
[    0.684896] Segment Routing with IPv6
[    0.684898] RPL Segment Routing with IPv6
[    0.684904] In-situ OAM (IOAM) with IPv6
[    0.684922] NET: Registered PF_PACKET protocol family
[    0.688161] ENERGY_PERF_BIAS: Set to 'normal', was 'performance'
[    0.688590] microcode: Current revision: 0x00000119
[    0.688977] IPI shorthand broadcast: enabled
[    0.689995] Piece-Of-Cake (POC) CPU Selector 2.6.1 by Masahito Suzuki [CTZ: HW (TZCNT), PTSelect: HW (PDEP)]
[    0.690007] sched_clock: Marking stable (683000747, 6254658)->(712166030, -22910625)
[    0.690208] registered taskstats version 1
[    0.690507] Loading compiled-in X.509 certificates
[    0.693705] Loaded X.509 cert 'Build time autogenerated kernel key: b82172ca557589457b36c2cb1b20dd19c82a02d0'
[    0.694957] zswap: loaded using pool zstd
[    0.694987] Demotion targets for Node 0: null
[    0.695104] Key type .fscrypt registered
[    0.695104] Key type fscrypt-provisioning registered
[    0.695233] Btrfs loaded, zoned=yes, fsverity=yes
[    0.695249] Key type big_key registered
[    0.695422] integrity: Loading X.509 certificate: UEFI:db
[    0.695430] integrity: Loaded X.509 cert 'Dell Inc.: Dell Bios DB Key: 637fa7a9f74471b406de0511557071fd41dd5487'
[    0.695431] integrity: Loading X.509 certificate: UEFI:db
[    0.695436] integrity: Loaded X.509 cert 'Dell Inc.: Dell Bios FW Aux Authority 2018: dd4df7c3f5ce7e5a77847915abc37b031f6b10bd'
[    0.695436] integrity: Loading X.509 certificate: UEFI:db
[    0.695442] integrity: Loaded X.509 cert 'Microsoft Windows Production PCA 2011: a92902398e16c49778cd90f99e4f9ae17c55af53'
[    0.695443] integrity: Loading X.509 certificate: UEFI:db
[    0.695448] integrity: Loaded X.509 cert 'Microsoft Corporation UEFI CA 2011: 13adbf4309bd82709c8cd54f316ed522988a1bd4'
[    0.695449] integrity: Loading X.509 certificate: UEFI:db
[    0.695454] integrity: Loaded X.509 cert 'Microsoft Corporation: Windows UEFI CA 2023: aefc5fbbbe055d8f8daa585473499417ab5a5272'
[    0.695454] integrity: Loading X.509 certificate: UEFI:db
[    0.695459] integrity: Loaded X.509 cert 'Microsoft UEFI CA 2023: 81aa6b3244c935bce0d6628af39827421e32497d'
[    0.695460] integrity: Loading X.509 certificate: UEFI:db
[    0.695464] integrity: Loaded X.509 cert 'Microsoft Option ROM UEFI CA 2023: 514fbf937fa46fb57bf07af8bed84b3b864b1711'
[    0.696179] PM:   Magic number: 10:312:887
[    0.696182] graphics fb0: hash matches
[    0.696219] pci 0000:00:1f.0: hash matches
[    0.696307] RAS: Correctable Errors collector initialized.
[    0.696404] clk: Disabling unused clocks
[    0.696405] PM: genpd: Disabling unused power domains
[    0.702530] Freeing unused decrypted memory: 2028K
[    0.703316] Freeing unused kernel image (initmem) memory: 4700K
[    0.703338] Write protecting the kernel read-only data: 40960k
[    0.703597] Freeing unused kernel image (text/rodata gap) memory: 308K
[    0.703923] Freeing unused kernel image (rodata/data gap) memory: 2016K
[    0.704205] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    0.704207] rodata_test: all tests were successful
[    0.704210] Run /init as init process
[    0.704211]   with arguments:
[    0.704212]     /init
[    0.704212]   with environment:
[    0.704213]     HOME=/
[    0.704213]     TERM=linux
[    0.723637] systemd[1]: Successfully made /usr/ read-only.
[    0.898394] usb 3-3: new full-speed USB device number 2 using xhci_hcd
[    1.023435] usb 3-3: New USB device found, idVendor=06cb, idProduct=0701, bcdDevice= 1.14
[    1.023450] usb 3-3: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[    1.023453] usb 3-3: Product: SVP7500
[    1.023457] usb 3-3: Manufacturer: Synaptics , Inc
[    1.023459] usb 3-3: SerialNumber: 01.00.00.00
[    1.060528] systemd[1]: systemd 260.1-2-arch running in system mode (+PAM +AUDIT -SELINUX +APPARMOR -IMA +IPE +SMACK +SECCOMP +GCRYPT +GNUTLS +OPENSSL +ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 +KMOD +LIBCRYPTSETUP +LIBCRYPTSETUP_PLUGINS +LIBFDISK +PCRE2 +PWQUALITY +P11KIT +QRENCODE +TPM2 +BZIP2 +LZ4 +XZ +ZLIB +ZSTD +BPF_FRAMEWORK +BTF +XKBCOMMON +UTMP +LIBARCHIVE)
[    1.060545] systemd[1]: Detected architecture x86-64.
[    1.060550] systemd[1]: Running in initrd.
[    1.061223] systemd[1]: Initializing machine ID from random generator.
[    1.108533] systemd[1]: Queued start job for default target Initrd Default Target.
[    1.177501] systemd[1]: Created slice Slice /system/systemd-cryptsetup.
[    1.177808] systemd[1]: Started Dispatch Password Requests to Console Directory Watch.
[    1.177881] systemd[1]: Expecting device /dev/disk/by-uuid/a20bebe1-33d2-4745-af1e-53b896713292...
[    1.177935] systemd[1]: Expecting device /dev/mapper/root...
[    1.177990] systemd[1]: Reached target Path Units.
[    1.178033] systemd[1]: Reached target Slice Units.
[    1.178080] systemd[1]: Reached target Swaps.
[    1.178127] systemd[1]: Reached target Timer Units.
[    1.178254] systemd[1]: Listening on Journal Socket (/dev/log).
[    1.178378] systemd[1]: Listening on Journal Sockets.
[    1.178479] systemd[1]: Listening on udev Control Socket.
[    1.178560] systemd[1]: Listening on udev Kernel Socket.
[    1.178609] systemd[1]: Reached target Socket Units.
[    1.181119] systemd[1]: Starting Create List of Static Device Nodes...
[    1.183864] systemd[1]: Starting Early Battery Level Check...
[    1.188101] systemd[1]: Starting Journal Service...
[    1.191187] systemd[1]: Starting Load Kernel Modules...
[    1.191615] systemd[1]: TPM PCR Barrier (initrd) skipped, unmet condition check ConditionSecurity=measured-uki
[    1.194326] systemd[1]: Starting Create Static Device Nodes in /dev...
[    1.197266] systemd[1]: Starting Coldplug All udev Devices...
[    1.204107] systemd[1]: Finished Create List of Static Device Nodes.
[    1.206955] systemd[1]: Finished Early Battery Level Check.
[    1.209507] systemd[1]: Finished Load Kernel Modules.
[    1.212061] systemd[1]: Finished Create Static Device Nodes in /dev.
[    1.212079] systemd-journald[224]: Collecting audit messages is disabled.
[    1.212576] systemd[1]: Reached target Preparation for Local File Systems.
[    1.212647] systemd[1]: Reached target Local File Systems.
[    1.215534] systemd[1]: Started Display Boot-Time Emergency Messages In Full Screen.
[    1.218579] systemd[1]: Starting Rule-based Manager for Device Events and Files...
[    1.245871] systemd[1]: Started Rule-based Manager for Device Events and Files.
[    1.253316] systemd[1]: Started Journal Service.
[    1.368641] intel_vsec 0000:00:0a.0: enabling device (0000 -> 0002)
[    1.370693] wmi_bus wmi_bus-PNP0C14:00: [Firmware Bug]: WQBC data block query control method not found
[    1.375866] intel-lpss 0000:00:19.0: enabling device (0000 -> 0002)
[    1.383153] Key type psk registered
[    1.387615] intel-lpss 0000:00:19.1: enabling device (0000 -> 0002)
[    1.398293] nvme 0000:01:00.0: platform quirk: setting simple suspend
[    1.398353] nvme nvme0: pci function 0000:01:00.0
[    1.418853] nvme nvme0: allocated 64 MiB host memory buffer (16 segments).
[    1.438071] nvme nvme0: 16/0/0 default/read/poll queues
[    1.456573]  nvme0n1: p1 p2
[    1.515928] device-mapper: uevent: version 1.0.3
[    1.515995] device-mapper: ioctl: 4.50.0-ioctl (2025-04-28) initialised: dm-devel@lists.linux.dev
[    1.691343] Setting dangerous option enable_panel_replay - tainting kernel
[    1.708759] Console: switching to colour dummy device 80x25
[    1.709152] xe 0000:00:02.0: vgaarb: deactivate vga console
[    1.709661] xe 0000:00:02.0: [drm] Running in SR-IOV PF mode
[    1.709826] xe 0000:00:02.0: [drm] Found pantherlake (device ID b080) integrated display version 30.00 stepping B0
[    1.711521] xe 0000:00:02.0: vgaarb: VGA decodes changed: olddecodes=io+mem,decodes=io+mem:owns=io+mem
[    1.720619] xe 0000:00:02.0: [drm] Finished loading DMC firmware i915/xe3lpd_dmc.bin (v2.33)
[    2.445276] xe 0000:00:02.0: [drm] [CONNECTOR:511:eDP-1] Panel is missing HDR static metadata. Possible support for Intel HDR backlight interface is not used. If your backlight controls don't work try booting with i915.enable_dpcd_backlight=3.
[    2.479357] xe 0000:00:02.0: [drm] Tile0: GT0: Using GuC firmware from xe/ptl_guc_70.bin version 70.58.0
[    2.687907] xe 0000:00:02.0: [drm] Tile0: GT0: ccs1 fused off
[    2.687909] xe 0000:00:02.0: [drm] Tile0: GT0: ccs2 fused off
[    2.687910] xe 0000:00:02.0: [drm] Tile0: GT0: ccs3 fused off
[    2.709495] xe 0000:00:02.0: [drm] Tile0: GT1: Using GuC firmware from xe/ptl_guc_70.bin version 70.58.0
[    2.712212] xe 0000:00:02.0: [drm] Tile0: GT1: Using HuC firmware from xe/ptl_huc.bin version 10.3.3
[    2.713251] xe 0000:00:02.0: [drm] Tile0: GT1: Using GSC firmware from xe/ptl_gsc_1.bin version 105.0.2.1301
[    2.734595] xe 0000:00:02.0: [drm] Tile0: GT1: vcs1 fused off
[    2.734598] xe 0000:00:02.0: [drm] Tile0: GT1: vcs2 fused off
[    2.734600] xe 0000:00:02.0: [drm] Tile0: GT1: vcs3 fused off
[    2.734601] xe 0000:00:02.0: [drm] Tile0: GT1: vcs4 fused off
[    2.734603] xe 0000:00:02.0: [drm] Tile0: GT1: vcs5 fused off
[    2.734604] xe 0000:00:02.0: [drm] Tile0: GT1: vcs6 fused off
[    2.734606] xe 0000:00:02.0: [drm] Tile0: GT1: vcs7 fused off
[    2.734607] xe 0000:00:02.0: [drm] Tile0: GT1: vecs1 fused off
[    2.734609] xe 0000:00:02.0: [drm] Tile0: GT1: vecs2 fused off
[    2.734610] xe 0000:00:02.0: [drm] Tile0: GT1: vecs3 fused off
[    2.789137] xe 0000:00:02.0: [drm] Selective fetch area calculation failed in pipe A
[    2.905837] xe 0000:00:02.0: [drm] Tile0: GT1: found GSC cv105.1.0
[    3.939168] xe 0000:00:02.0: [drm] PXP requires PTL GSC build 1396 or newer
[    3.942270] xe 0000:00:02.0: [drm] Registered 4 planes with drm panic
[    3.949522] [drm] Initialized xe 1.1.0 for 0000:00:02.0 on minor 0
[    3.952893] ACPI: video: Video Device [GFX0] (multi-head: yes  rom: no  post: no)
[    3.954078] input: Video Bus as /devices/pci0000:00/acpi.video_bus.0/input/input5
[    3.957230] xe 0000:00:02.0: [drm] Allocated fbdev into stolen
[    3.958864] fbcon: xedrmfb (fb0) is primary device
[    3.964690] Console: switching to colour frame buffer device 180x56
[    3.982966] xe 0000:00:02.0: [drm] fb0: xedrmfb frame buffer device
[   10.897729] Key type trusted registered
[   10.900776] Key type encrypted registered
[   10.970984] BTRFS: device label btrroot devid 1 transid 13104 /dev/mapper/root (253:0) scanned by mount (555)
[   10.971693] BTRFS info (device dm-0): first mount of filesystem 3efe9699-fe1a-4b66-96f5-6d9cb1f68308
[   10.971702] BTRFS info (device dm-0): using crc32c checksum algorithm
[   10.976302] BTRFS info (device dm-0): enabling ssd optimizations
[   10.976311] BTRFS info (device dm-0): turning on async discard
[   10.976314] BTRFS info (device dm-0): enabling free space tree
[   11.364780] systemd-journald[224]: Received SIGTERM from PID 1 (systemd).
[   11.740024] systemd[1]: systemd 260.1-2-arch running in system mode (+PAM +AUDIT -SELINUX +APPARMOR -IMA +IPE +SMACK +SECCOMP +GCRYPT +GNUTLS +OPENSSL +ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 +KMOD +LIBCRYPTSETUP +LIBCRYPTSETUP_PLUGINS +LIBFDISK +PCRE2 +PWQUALITY +P11KIT +QRENCODE +TPM2 +BZIP2 +LZ4 +XZ +ZLIB +ZSTD +BPF_FRAMEWORK +BTF +XKBCOMMON +UTMP +LIBARCHIVE)
[   11.740043] systemd[1]: Detected architecture x86-64.
[   11.755023] systemd[1]: Hostname set to <t14>.
[   11.827610] systemd[1]: bpf-restrict-fs: LSM BPF program attached
[   12.011051] systemd[1]: initrd-switch-root.service: Deactivated successfully.
[   12.011113] systemd[1]: Stopped Switch Root.
[   12.011756] systemd[1]: systemd-journald.service: Scheduled restart job, restart counter is at 1.
[   12.011885] systemd[1]: Created slice Virtual Machine and Container Slice.
[   12.012320] systemd[1]: Created slice Slice /system/dirmngr.
[   12.012730] systemd[1]: Created slice Slice /system/getty.
[   12.013136] systemd[1]: Created slice Slice /system/gpg-agent.
[   12.013554] systemd[1]: Created slice Slice /system/gpg-agent-browser.
[   12.013944] systemd[1]: Created slice Slice /system/gpg-agent-extra.
[   12.014332] systemd[1]: Created slice Slice /system/gpg-agent-ssh.
[   12.014729] systemd[1]: Created slice Slice /system/keyboxd.
[   12.015117] systemd[1]: Created slice Slice /system/modprobe.
[   12.015496] systemd[1]: Created slice Slice /system/systemd-fsck.
[   12.015865] systemd[1]: Created slice Slice /system/wg-quick.
[   12.016186] systemd[1]: Created slice User and Session Slice.
[   12.016453] systemd[1]: Started Dispatch Password Requests to Console Directory Watch.
[   12.016720] systemd[1]: Started Forward Password Requests to Wall Directory Watch.
[   12.017040] systemd[1]: Set up automount Arbitrary Executable File Formats File System Automount Point.
[   12.017298] systemd[1]: Expecting device /dev/disk/by-uuid/C603-8929...
[   12.017557] systemd[1]: Reached target Image Downloads.
[   12.017817] systemd[1]: Stopped target Switch Root.
[   12.018100] systemd[1]: Stopped target Initrd File Systems.
[   12.018360] systemd[1]: Stopped target Initrd Root File System.
[   12.018613] systemd[1]: Reached target Local Integrity Protected Volumes.
[   12.018872] systemd[1]: Reached target Host and Network Name Lookups.
[   12.019126] systemd[1]: Reached target Path Units.
[   12.019383] systemd[1]: Reached target Remote File Systems.
[   12.019637] systemd[1]: Reached target Slice Units.
[   12.019900] systemd[1]: Reached target Local Verity Protected Volumes.
[   12.020183] systemd[1]: Listening on Device-mapper event daemon FIFOs.
[   12.020964] systemd[1]: Listening on Query the User Interactively for a Password.
[   12.022199] systemd[1]: Listening on Process Core Dump Socket.
[   12.022695] systemd[1]: Listening on Credential Encryption/Decryption.
[   12.023295] systemd[1]: Listening on Factory Reset Management.
[   12.023895] systemd[1]: Listening on Console Output Muting Service Socket.
[   12.024315] systemd[1]: TPM PCR Measurements skipped, unmet condition check ConditionSecurity=measured-uki
[   12.024321] systemd[1]: Make TPM PCR Policy skipped, unmet condition check ConditionSecurity=measured-uki
[   12.024556] systemd[1]: Listening on Disk Repartitioning Service Socket.
[   12.024833] systemd[1]: Listening on udev Control Socket.
[   12.025108] systemd[1]: Listening on udev Varlink Socket.
[   12.025382] systemd[1]: Listening on User Database Manager Socket.
[   12.026928] systemd[1]: Mounting Huge Pages File System...
[   12.027575] systemd[1]: Mounting POSIX Message Queue File System...
[   12.028071] systemd[1]: Mounting Kernel Debug File System...
[   12.028561] systemd[1]: Mounting Kernel Trace File System...
[   12.029123] systemd[1]: Starting Create List of Static Device Nodes...
[   12.029394] systemd[1]: Load Kernel Module configfs skipped, unmet condition check ConditionKernelModuleLoaded=!configfs
[   12.029644] systemd[1]: Mounting Kernel Configuration File System...
[   12.029895] systemd[1]: Load Kernel Module drm skipped, unmet condition check ConditionKernelModuleLoaded=!drm
[   12.029906] systemd[1]: Load Kernel Module fuse skipped, unmet condition check ConditionKernelModuleLoaded=!fuse
[   12.042780] systemd[1]: Mounting FUSE Control File System...
[   12.043167] systemd[1]: systemd-cryptsetup@root.service: Deactivated successfully.
[   12.043178] systemd[1]: Stopped systemd-cryptsetup@root.service.
[   12.043466] systemd[1]: systemd-cryptsetup@root.service: Consumed 6.989s CPU time over 10.550s wall clock time, 1G memory peak.
[   12.043698] systemd[1]: systemd-fsck-root.service: Deactivated successfully.
[   12.043733] systemd[1]: Stopped File System Check on Root Device.
[   12.044201] systemd[1]: Clear Stale Hibernate Storage Info skipped, unmet condition check ConditionPathExists=/sys/firmware/efi/efivars/HibernateLocation-8cf2644b-4b0b-428f-9387-6d876050dc67
[   12.045600] systemd[1]: Starting Journal Service...
[   12.046766] systemd[1]: Starting Load Kernel Modules...
[   12.047191] systemd[1]: TPM PCR Machine ID Measurement skipped, unmet condition check ConditionSecurity=measured-uki
[   12.048019] systemd[1]: Starting Remount Root and Kernel File Systems...
[   12.048950] systemd[1]: Early TPM SRK Setup skipped, unmet condition check ConditionSecurity=measured-uki
[   12.050105] systemd[1]: Starting Load udev Rules from Credentials...
[   12.051136] systemd[1]: Starting Coldplug All udev Devices...
[   12.054015] systemd[1]: Mounted Huge Pages File System.
[   12.054704] systemd[1]: Mounted POSIX Message Queue File System.
[   12.055379] systemd[1]: Mounted Kernel Debug File System.
[   12.056057] systemd[1]: Mounted Kernel Trace File System.
[   12.056890] systemd[1]: Finished Create List of Static Device Nodes.
[   12.057635] systemd[1]: Mounted Kernel Configuration File System.
[   12.058371] systemd[1]: Mounted FUSE Control File System.
[   12.060670] Asymmetric key parser 'pkcs8' registered
[   12.063343] i2c_dev: i2c /dev entries driver
[   12.079687] systemd[1]: Starting Create Static Device Nodes in /dev gracefully...
[   12.080301] systemd[1]: Finished Load Kernel Modules.
[   12.080893] systemd[1]: Finished Load udev Rules from Credentials.
[   12.081995] systemd[1]: Starting Apply Kernel Variables...
[   12.083547] systemd-journald[768]: Collecting audit messages is disabled.
[   12.089439] systemd[1]: Finished Remount Root and Kernel File Systems.
[   12.090022] systemd[1]: Started Journal Service.
[   12.100038] systemd-journald[768]: Received client request to flush runtime journal.
[   13.401166] intel_ipu7: module is from the staging directory, the quality is unknown, you have been warned.
[   13.402012] intel_pmc_ssram_telemetry 0000:00:14.2: enabling device (0000 -> 0002)
[   13.408436] resource: resource sanity check: requesting [mem 0x00000000fedc0000-0x00000000fedcffff], which spans more than PNP0C02:03 [mem 0xfedc0000-0xfedc7fff]
[   13.408457] caller igen6_probe+0x1cb/0xe20 [igen6_edac] mapping multiple BARs
[   13.415005] EDAC MC0: Giving out device to module igen6_edac controller Intel_client_SoC MC#0: DEV 0000:00:00.0 (INTERRUPT)
[   13.415130] intel-ipu7 0000:00:05.0: enabling device (0000 -> 0002)
[   13.415135] intel-ipu7 0000:00:05.0: Device 0xb05d (rev: 0x4)
[   13.415136] intel-ipu7 0000:00:05.0: IPU7 PCI BAR0 base 0x000000c812000000 BAR2 base 0x000000c81537a000
[   13.415151] intel-ipu7 0000:00:05.0: IPU7 PCI BAR0 mapped at 000000000737cb16
                BAR2 mapped at 00000000b9e25610
[   13.415467] intel_vpu 0000:00:0b.0: enabling device (0000 -> 0002)
[   13.415911] intel-ipu7 0000:00:05.0: IPU7 SKU 1 in secure mode mask 0x0
[   13.416255] EDAC MC1: Giving out device to module igen6_edac controller Intel_client_SoC MC#1: DEV 0000:00:00.0 (INTERRUPT)
[   13.418706] EDAC igen6: v2.5.1
[   13.419292] intel_vpu 0000:00:0b.0: [drm] Firmware: intel/vpu/vpu_50xx_v1.bin, version: Nov 13 2025*NPU50xx*ci_tag_ud202548_vpu_rc_20251112_1901-1-g72f907ffc78*72f907ffc780df5579a2fed65afc4944da8b0e44
[   13.419295] intel_vpu 0000:00:0b.0: [drm] Scheduler mode: HW
[   13.420635] ACPI: bus type thunderbolt registered
[   13.420918] mc: Linux media interface: v0.10
[   13.421696] input: Intel HID events as /devices/platform/INTC10CC:00/input/input6
[   13.422038] intel-hid INTC10CC:00: platform supports 5 button array
[   13.422057] input: Intel HID 5 button array as /devices/platform/INTC10CC:00/input/input7
[   13.422167] int3472-discrete INT3472:00: cannot find GPIO chip INTC10E2:00, deferring
[   13.430250] int3472-discrete INT3472:00: cannot find GPIO chip INTC10E2:00, deferring
[   13.430259] intel-ipu7 0000:00:05.0: firmware cpd file: intel/ipu/ipu7ptl_fw.bin
[   13.430290] int3472-discrete INT3472:01: cannot find GPIO chip INTC10E2:00, deferring
[   13.431769] videodev: Linux video capture interface: v2.00
[   13.431994] intel-ipu7 0000:00:05.0: FW binary0 info:
[   13.431997] intel-ipu7 0000:00:05.0: Name:  psys
[   13.431998] intel-ipu7 0000:00:05.0: Version:  1.2.1.251215214352
[   13.431999] intel-ipu7 0000:00:05.0: Timestamp:  build_id:2923306609
[   13.432000] intel-ipu7 0000:00:05.0: Commit:  commit_id:ee59e1e0
[   13.432001] intel-ipu7 0000:00:05.0: FW binary1 info:
[   13.432001] intel-ipu7 0000:00:05.0: Name:  isys
[   13.432002] intel-ipu7 0000:00:05.0: Version:  1.2.1.251215214331
[   13.432002] intel-ipu7 0000:00:05.0: Timestamp:  build_id:2439351977
[   13.432003] intel-ipu7 0000:00:05.0: Commit:  commit_id:ee59e1e0
[   13.432867] intel-ipu7 0000:00:05.0: Found supported sensor OVTI08F4:00
[   13.432912] intel-ipu7 0000:00:05.0: Connected 1 cameras
[   13.433093] int3472-discrete INT3472:00: cannot find GPIO chip INTC10E2:00, deferring
[   13.436702] intel_pmc_core INT33A1:00:  initialized
[   13.436942] int3472-discrete INT3472:01: cannot find GPIO chip INTC10E2:00, deferring
[   13.437183] intel-ipu7 0000:00:05.0: Sending BOOT_LOAD to CSE
[   13.437421] int3472-discrete INT3472:00: cannot find GPIO chip INTC10E2:00, deferring
[   13.442822] int3472-discrete INT3472:01: cannot find GPIO chip INTC10E2:00, deferring
[   13.459101] int3472-discrete INT3472:00: cannot find GPIO chip INTC10E2:00, deferring
[   13.462045] int3472-discrete INT3472:01: cannot find GPIO chip INTC10E2:00, deferring
[   13.464550] int3472-discrete INT3472:00: cannot find GPIO chip INTC10E2:00, deferring
[   13.465633] usbcore: registered new interface driver usbio-bridge
[   13.471882] int3472-discrete INT3472:01: cannot find GPIO chip INTC10E2:00, deferring
[   13.475175] int3472-discrete INT3472:00: cannot find GPIO chip INTC10E2:00, deferring
[   13.478787] int3472-discrete INT3472:01: cannot find GPIO chip INTC10E2:00, deferring
[   13.480864] int3472-discrete INT3472:00: cannot find GPIO chip INTC10E2:00, deferring
[   13.482286] int3472-discrete INT3472:01: cannot find GPIO chip INTC10E2:00, deferring
[   13.483020] int3472-discrete INT3472:00: cannot find GPIO chip INTC10E2:00, deferring
[   13.484751] [drm] Initialized intel_vpu 1.0.0 for 0000:00:0b.0 on minor 0
[   13.485754] int3472-discrete INT3472:01: cannot find GPIO chip INTC10E2:00, deferring
[   13.486434] int3472-discrete INT3472:00: cannot find GPIO chip INTC10E2:00, deferring
[   13.496672] ACPI: battery: new hook: Dell DDV Battery Extension
[   13.506716] intel-ipu7 0000:00:05.0: Sending AUTHENTICATE_RUN to CSE
[   13.537292] intel-ipu7 0000:00:05.0: CSE authenticate_run done
[   13.539514] int3472-discrete INT3472:01: cannot find GPIO chip INTC10E2:00, deferring
[   13.547756] int3472-discrete INT3472:00: cannot find GPIO chip INTC10E2:00, deferring
[   13.555496] int3472-discrete INT3472:01: cannot find GPIO chip INTC10E2:00, deferring
[   13.563380] int3472-discrete INT3472:00: cannot find GPIO chip INTC10E2:00, deferring
[   13.568104] int3472-discrete INT3472:01: cannot find GPIO chip INTC10E2:00, deferring
[   13.622227] int3472-discrete INT3472:00: cannot find GPIO chip INTC10E2:00, deferring
[   13.622811] input: VEN_06CB:00 06CB:D01D Mouse as /devices/pci0000:00/0000:00:19.0/i2c_designware.0/i2c-0/i2c-VEN_06CB:00/0018:06CB:D01D.0001/input/input8
[   13.622883] input: VEN_06CB:00 06CB:D01D Touchpad as /devices/pci0000:00/0000:00:19.0/i2c_designware.0/i2c-0/i2c-VEN_06CB:00/0018:06CB:D01D.0001/input/input9
[   13.622909] input: VEN_06CB:00 06CB:D01D as /devices/pci0000:00/0000:00:19.0/i2c_designware.0/i2c-0/i2c-VEN_06CB:00/0018:06CB:D01D.0001/input/input11
[   13.622954] hid-generic 0018:06CB:D01D.0001: input,hidraw0: I2C HID v1.00 Mouse [VEN_06CB:00 06CB:D01D] on i2c-VEN_06CB:00
[   13.623013] int3472-discrete INT3472:01: cannot find GPIO chip INTC10E2:00, deferring
[   13.623800] int3472-discrete INT3472:00: cannot find GPIO chip INTC10E2:00, deferring
[   13.625631] int3472-discrete INT3472:01: cannot find GPIO chip INTC10E2:00, deferring
[   13.632300] int3472-discrete INT3472:00: cannot find GPIO chip INTC10E2:00, deferring
[   13.632746] int3472-discrete INT3472:01: cannot find GPIO chip INTC10E2:00, deferring
[   13.703543] input: CUST0000:00 3558:2002 Touchscreen as /devices/pci0000:00/0000:00:19.1/i2c_designware.1/i2c-1/i2c-CUST0000:00/0018:3558:2002.0002/input/input12
[   13.704033] hid-generic 0018:3558:2002.0002: input,hidraw1: I2C HID v1.00 Device [CUST0000:00 3558:2002] on i2c-CUST0000:00
[   13.706746] int3472-discrete INT3472:00: cannot find GPIO chip INTC10E2:00, deferring
[   13.710481] int3472-discrete INT3472:01: cannot find GPIO chip INTC10E2:00, deferring
[   13.734032] i801_smbus 0000:00:1f.4: SPD Write Disable is set
[   13.734095] i801_smbus 0000:00:1f.4: SMBus using PCI interrupt
[   13.737596] input: PC Speaker as /devices/platform/pcspkr/input/input14
[   13.738232] spi-nor spi0.0: supply vcc not found, using dummy regulator
[   13.740594] int3472-discrete INT3472:00: cannot find GPIO chip INTC10E2:00, deferring
[   13.744514] int3472-discrete INT3472:01: cannot find GPIO chip INTC10E2:00, deferring
[   13.747575] Creating 1 MTD partitions on "0000:00:1f.5":
[   13.747587] 0x000000000000-0x000004000000 : "BIOS"
[   13.754357] int3472-discrete INT3472:00: cannot find GPIO chip INTC10E2:00, deferring
[   13.756528] int3472-discrete INT3472:01: cannot find GPIO chip INTC10E2:00, deferring
[   13.765696] int3472-discrete INT3472:00: cannot find GPIO chip INTC10E2:00, deferring
[   13.774674] int3472-discrete INT3472:01: cannot find GPIO chip INTC10E2:00, deferring
[   13.812904] Bluetooth: Core ver 2.22
[   13.813676] NET: Registered PF_BLUETOOTH protocol family
[   13.813681] Bluetooth: HCI device and connection manager initialized
[   13.813689] Bluetooth: HCI socket layer initialized
[   13.813694] Bluetooth: L2CAP socket layer initialized
[   13.813701] Bluetooth: SCO socket layer initialized
[   13.830532] int3472-discrete INT3472:00: cannot find GPIO chip INTC10E2:00, deferring
[   13.834608] int3472-discrete INT3472:01: cannot find GPIO chip INTC10E2:00, deferring
[   13.835206] intel_ish_ipc 0000:00:12.0: ISH loader: load firmware: intel/ish/ish_ptl_39ceeaf8.bin
[   13.852621] intel_ish_ipc 0000:00:12.0: ISH loader: firmware loaded. size:768512
[   13.852629] intel_ish_ipc 0000:00:12.0: ISH loader: FW base version: 5.8.1.7779
[   13.852632] intel_ish_ipc 0000:00:12.0: ISH loader: FW project version: 581.7779.0.13177
[   13.878145] gpio_usbio.usbio-gpio usbio.usbio-gpio.0: [Firmware Bug]: GPIO 11 is not in FW pins bitmap
[   13.878651] intel_rapl_msr: PL4 support detected.
[   13.878653] intel_rapl_msr: MSR-based RAPL PMU support enabled
[   13.878848] intel_rapl_common: Found RAPL domain package
[   13.878851] intel_rapl_common: Found RAPL domain core
[   13.878852] intel_rapl_common: Found RAPL domain uncore
[   13.878853] intel_rapl_common: Found RAPL domain dram
[   13.878855] intel_rapl_common: Found RAPL domain psys
[   13.879466] cfg80211: Loading compiled-in X.509 certificates for regulatory database
[   13.881295] input: Dell Privacy Driver as /devices/platform/PNP0C14:00/wmi_bus/wmi_bus-PNP0C14:00/6932965F-1671-4CEB-B988-D3AB0A901919-1/input/input16
[   13.881789] Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[   13.881889] Loaded X.509 cert 'wens: 61c038651aabdcf94bd0ac7ff06c7248db18c600'
[   13.881913] faux_driver regulatory: Direct firmware load for regulatory.db failed with error -2
[   13.881915] cfg80211: failed to load regulatory.db
[   13.884959] int3472-discrete INT3472:00: GPIO type 0x02 unknown; the sensor may not work
[   13.887497] input: Dell WMI hotkeys as /devices/platform/PNP0C14:00/wmi_bus/wmi_bus-PNP0C14:00/9DBB5994-A997-11DA-B012-B622A1EF5492-3/input/input17
[   13.922522] input: VEN_06CB:00 06CB:D01D Mouse as /devices/pci0000:00/0000:00:19.0/i2c_designware.0/i2c-0/i2c-VEN_06CB:00/0018:06CB:D01D.0001/input/input18
[   13.922555] input: VEN_06CB:00 06CB:D01D Touchpad as /devices/pci0000:00/0000:00:19.0/i2c_designware.0/i2c-0/i2c-VEN_06CB:00/0018:06CB:D01D.0001/input/input19
[   13.922587] input: VEN_06CB:00 06CB:D01D UNKNOWN as /devices/pci0000:00/0000:00:19.0/i2c_designware.0/i2c-0/i2c-VEN_06CB:00/0018:06CB:D01D.0001/input/input21
[   13.922638] hid-multitouch 0018:06CB:D01D.0001: input,hidraw0: I2C HID v1.00 Mouse [VEN_06CB:00 06CB:D01D] on i2c-VEN_06CB:00
[   13.930122] input: CUST0000:00 3558:2002 as /devices/pci0000:00/0000:00:19.1/i2c_designware.1/i2c-1/i2c-CUST0000:00/0018:3558:2002.0002/input/input22
[   13.930179] hid-multitouch 0018:3558:2002.0002: input,hidraw1: I2C HID v1.00 Device [CUST0000:00 3558:2002] on i2c-CUST0000:00
[   13.954650] i2c_usbio.usbio-i2c usbio.usbio-i2c.1: Invalid speed 400000 adjusting to bus max 100000
[   14.043054] Adding 16777212k swap on /swap/swapfile.  Priority:-1 extents:1 across:16777212k SS
[   14.171520] i801_smbus 0000:00:1f.4: SMBus is busy, can't use it!
[   14.171917] i801_smbus 0000:00:1f.4: SMBus is busy, can't use it!
[   14.172264] i801_smbus 0000:00:1f.4: SMBus is busy, can't use it!
[   14.173026] i801_smbus 0000:00:1f.4: SMBus is busy, can't use it!
[   14.173420] i801_smbus 0000:00:1f.4: SMBus is busy, can't use it!
[   14.173778] i801_smbus 0000:00:1f.4: SMBus is busy, can't use it!
[   14.175174] i801_smbus 0000:00:1f.4: SMBus is busy, can't use it!
[   14.195049] mei_gsc_proxy 0000:00:16.0-0f73db04-97ab-4125-b893-e904ad0d5464: bound 0000:00:02.0 (ops xe_gsc_proxy_component_ops [xe])
[   14.198198] mousedev: PS/2 mouse device common for all mice
[   14.198455] btintel_pcie 0000:00:14.7: enabling device (0000 -> 0002)
[   14.198947] iTCO_wdt iTCO_wdt: Found a Intel PCH TCO device (Version=6, TCOBASE=0x0400)
[   14.199025] iTCO_wdt iTCO_wdt: initialized. heartbeat=30 sec (nowayout=0)
[   14.209447] proc_thermal_pci 0000:00:04.0: enabling device (0400 -> 0402)
[   14.209509] intel_rapl_common: Found RAPL domain package
[   14.209511] intel_rapl_common: Found RAPL domain dram
[   14.210412] iwlwifi 0000:00:14.3: enabling device (0000 -> 0002)
[   14.214569] intel_ipu7_isys: module is from the staging directory, the quality is unknown, you have been warned.
[   14.214766] proc_thermal_pci 0000:00:04.0: msi enabled:1 msix enabled:0
[   14.220187] iwlwifi 0000:00:14.3: Detected crf-id 0x1002a10, cnv-id 0x80a00 wfpm id 0x80005b20
[   14.220196] iwlwifi 0000:00:14.3: PCI dev e440/4110, rev=0x480, rfid=0x20113100
[   14.220198] iwlwifi 0000:00:14.3: Detected Intel(R) Wi-Fi 7 BE211 320MHz
[   14.227483] Bluetooth: hci0: Device revision is 0
[   14.227489] Bluetooth: hci0: Secure boot is enabled
[   14.227490] Bluetooth: hci0: OTP lock is disabled
[   14.227490] Bluetooth: hci0: API lock is enabled
[   14.227491] Bluetooth: hci0: Debug lock is disabled
[   14.227491] Bluetooth: hci0: Minimum firmware build 1 week 10 2014
[   14.227493] Bluetooth: hci0: Bootloader timestamp 2023.43 buildtype 1 build 11631
[   14.227797] iwlwifi 0000:00:14.3: loaded firmware version 101.6e695a70.0 sc-a0-wh-b0-c101.ucode op_mode iwlmld
[   14.228193] Bluetooth: hci0: Found device firmware: intel/ibt-00a0-01a1-iml.sfi
[   14.228197] Bluetooth: hci0: Boot Address: 0xb02ff000
[   14.228198] Bluetooth: hci0: Firmware Version: 248-3.26
[   14.259685] ACPI: battery: new hook: Dell Primary Battery Extension
[   14.271537] pps_core: LinuxPPS API ver. 1 registered
[   14.271539] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[   14.275733] PTP clock support registered
[   14.277372] Bluetooth: hci0: Waiting for firmware download to complete
[   14.277374] Bluetooth: hci0: Firmware loaded in 48024 usecs
[   14.278862] Bluetooth: hci0: Waiting for device to boot
[   14.278868] Bluetooth: hci0: Device booted in 1455 usecs
[   14.278869] Bluetooth: hci0: Waiting for device transition to d0
[   14.278870] Bluetooth: hci0: Device moved to D0 in 0 usecs
[   14.279029] Bluetooth: hci0: dsbr: enable: 0x01 value: 0x0f
[   14.282337] Bluetooth: hci0: Found device firmware: intel/ibt-00a0-01a1-pci.sfi
[   14.282357] Bluetooth: hci0: Boot Address: 0x10000800
[   14.282359] Bluetooth: hci0: Firmware Version: 248-3.26
[   14.366884] intel_tcc_cooling: TCC Offset locked
[   14.415547] input: PS/2 Generic Mouse as /devices/platform/i8042/serio1/input/input15
[   14.455617] sof-audio-pci-intel-ptl 0000:00:1f.3: SoundWire enabled on CannonLake+ platform, using SOF driver
[   14.455626] sof-audio-pci-intel-ptl 0000:00:1f.3: enabling device (0000 -> 0002)
[   14.456197] sof-audio-pci-intel-ptl 0000:00:1f.3: DSP detected with PCI class/subclass/prog-if 0x040380
[   14.456230] sof-audio-pci-intel-ptl 0000:00:1f.3: bound 0000:00:02.0 (ops intel_audio_component_bind_ops [xe])
[   14.463283] sof-audio-pci-intel-ptl 0000:00:1f.3: use msi interrupt mode
[   14.472127] acpi PRP00001:00: Creating 5 SDW Link devices
[   14.472170] soundwire sdw-master-0-0: doaise 0x1 doais 0x3 dodse 0x1 dods 0x0
[   14.472181] soundwire sdw-master-0-0: SDW Slave Addr: 3001fa424501
[   14.472181] soundwire sdw-master-0-0: SDW Slave class_id 0x01, mfg_id 0x01fa, part_id 0x4245, unique_id 0x0, version 0x3
[   14.472189] acpi device:29: SDCA function SmartMic (type 3) at 0x2
[   14.472192] acpi device:2a: SDCA function UAJ (type 6) at 0x3
[   14.472194] acpi device:2b: SDCA function HID (type 10) at 0x4
[   14.472326] soundwire sdw-master-0-2: doaise 0x1 doais 0x3 dodse 0x1 dods 0x0
[   14.472330] soundwire sdw-master-0-2: SDW Slave Addr: 23201fa355701
[   14.472331] soundwire sdw-master-0-2: SDW Slave class_id 0x01, mfg_id 0x01fa, part_id 0x3557, unique_id 0x2, version 0x3
[   14.472333] soundwire sdw-master-0-2: SDW Slave Addr: 23301fa355701
[   14.472334] soundwire sdw-master-0-2: SDW Slave class_id 0x01, mfg_id 0x01fa, part_id 0x3557, unique_id 0x3, version 0x3
[   14.472335] soundwire sdw-master-0-2: Valid unique IDs 0x2 0x3 for Slave mfg_id 0x01fa, part_id 0x3557
[   14.472339] acpi device:25: SDCA function SmartAmp (type 1) at 0x1
[   14.472377] soundwire sdw-master-0-2: SDW Slave Addr: 23301fa355701
[   14.472378] soundwire sdw-master-0-2: SDW Slave class_id 0x01, mfg_id 0x01fa, part_id 0x3557, unique_id 0x3, version 0x3
[   14.472380] soundwire sdw-master-0-2: SDW Slave Addr: 23201fa355701
[   14.472381] soundwire sdw-master-0-2: SDW Slave class_id 0x01, mfg_id 0x01fa, part_id 0x3557, unique_id 0x2, version 0x3
[   14.472381] soundwire sdw-master-0-2: Valid unique IDs 0x3 0x2 for Slave mfg_id 0x01fa, part_id 0x3557
[   14.472385] acpi device:27: SDCA function SmartAmp (type 1) at 0x1
[   14.472445] soundwire sdw-master-0-3: doaise 0x1 doais 0x3 dodse 0x1 dods 0x0
[   14.472448] soundwire sdw-master-0-3: SDW Slave Addr: 33001fa355701
[   14.472448] soundwire sdw-master-0-3: SDW Slave class_id 0x01, mfg_id 0x01fa, part_id 0x3557, unique_id 0x0, version 0x3
[   14.472449] soundwire sdw-master-0-3: SDW Slave Addr: 33101fa355701
[   14.472450] soundwire sdw-master-0-3: SDW Slave class_id 0x01, mfg_id 0x01fa, part_id 0x3557, unique_id 0x1, version 0x3
[   14.472450] soundwire sdw-master-0-3: Valid unique IDs 0x0 0x1 for Slave mfg_id 0x01fa, part_id 0x3557
[   14.472454] acpi device:21: SDCA function SmartAmp (type 1) at 0x1
[   14.472486] soundwire sdw-master-0-3: SDW Slave Addr: 33101fa355701
[   14.472487] soundwire sdw-master-0-3: SDW Slave class_id 0x01, mfg_id 0x01fa, part_id 0x3557, unique_id 0x1, version 0x3
[   14.472488] soundwire sdw-master-0-3: SDW Slave Addr: 33001fa355701
[   14.472489] soundwire sdw-master-0-3: SDW Slave class_id 0x01, mfg_id 0x01fa, part_id 0x3557, unique_id 0x0, version 0x3
[   14.472489] soundwire sdw-master-0-3: Valid unique IDs 0x1 0x0 for Slave mfg_id 0x01fa, part_id 0x3557
[   14.472494] acpi device:23: SDCA function SmartAmp (type 1) at 0x1
[   14.480014] sdca_class sdw:0:0:01fa:4245:01: SWFT not available
[   14.480102] sdca_class sdw:0:0:01fa:4245:01: probe complete
[   14.483006] soundwire_intel soundwire_intel.link.0: clock source 0 LVSCTL 0x0
[   14.483008] soundwire_intel soundwire_intel.link.0: first link up, programming SYNCPRD
[   14.483048] soundwire_intel soundwire_intel.link.0: PCM cap bd:15 in:0 out:0
[   14.486111] soundwire_intel soundwire_intel.link.2: clock source 0 LVSCTL 0x0
[   14.486148] soundwire_intel soundwire_intel.link.2: PCM cap bd:15 in:0 out:0
[   14.488292] soundwire_intel soundwire_intel.link.3: clock source 0 LVSCTL 0x0
[   14.488330] soundwire_intel soundwire_intel.link.3: PCM cap bd:15 in:0 out:0
[   14.489023] soundwire sdw-master-0-2: Slave attached, programming device number
[   14.489205] soundwire sdw-master-0-2: SDW Slave Addr: 3201fa355701
[   14.489207] soundwire sdw-master-0-2: SDW Slave class_id 0x01, mfg_id 0x01fa, part_id 0x3557, unique_id 0x2, version 0x3
[   14.489476] soundwire sdw-master-0-2: SDW Slave Addr: 3301fa355701
[   14.489478] soundwire sdw-master-0-2: SDW Slave class_id 0x01, mfg_id 0x01fa, part_id 0x3557, unique_id 0x3, version 0x3
[   14.489761] soundwire sdw-master-0-2: No more devices to enumerate
[   14.489813] soundwire sdw:0:2:01fa:3557:01:2: signaling enumeration completion for Slave 1
[   14.489815] soundwire sdw:0:2:01fa:3557:01:2: Configured bus base 1, scale 2, mclk 19200000, curr_freq 9600000
[   14.490401] soundwire sdw:0:2:01fa:3557:01:2: signaling initialization completion for Slave 1
[   14.490403] soundwire sdw:0:2:01fa:3557:01:3: signaling enumeration completion for Slave 2
[   14.490404] soundwire sdw:0:2:01fa:3557:01:3: Configured bus base 1, scale 2, mclk 19200000, curr_freq 9600000
[   14.490536] sof-audio-pci-intel-ptl 0000:00:1f.3: No SoundWire machine driver found for the ACPI-reported configuration:
[   14.490537] sof-audio-pci-intel-ptl 0000:00:1f.3: link 0 mfg_id 0x01fa part_id 0x4245 version 0x3
[   14.490539] sof-audio-pci-intel-ptl 0000:00:1f.3: link 2 mfg_id 0x01fa part_id 0x3557 version 0x3
[   14.490540] sof-audio-pci-intel-ptl 0000:00:1f.3: link 2 mfg_id 0x01fa part_id 0x3557 version 0x3
[   14.490540] sof-audio-pci-intel-ptl 0000:00:1f.3: link 3 mfg_id 0x01fa part_id 0x3557 version 0x3
[   14.490541] sof-audio-pci-intel-ptl 0000:00:1f.3: link 3 mfg_id 0x01fa part_id 0x3557 version 0x3
[   14.490547] sof-audio-pci-intel-ptl 0000:00:1f.3: Use SoundWire default machine driver with function topologies
[   14.490548] sof-audio-pci-intel-ptl 0000:00:1f.3: hda codecs found, mask 4
[   14.490549] sof-audio-pci-intel-ptl 0000:00:1f.3: NHLT device BT(0) detected, ssp_mask 0x4
[   14.490550] sof-audio-pci-intel-ptl 0000:00:1f.3: BT link detected in NHLT tables: 0x4
[   14.490551] sof-audio-pci-intel-ptl 0000:00:1f.3: DMICs detected in NHLT tables: 0
[   14.490968] soundwire sdw:0:2:01fa:3557:01:3: signaling initialization completion for Slave 2
[   14.491530] soundwire sdw-master-0-3: Slave attached, programming device number
[   14.491729] soundwire sdw-master-0-3: SDW Slave Addr: 3101fa355701
[   14.491730] soundwire sdw-master-0-3: SDW Slave class_id 0x01, mfg_id 0x01fa, part_id 0x3557, unique_id 0x1, version 0x3
[   14.491766] sof-audio-pci-intel-ptl 0000:00:1f.3: Firmware paths/files for ipc type 1:
[   14.491767] sof-audio-pci-intel-ptl 0000:00:1f.3:  Firmware file:     intel/sof-ipc4/ptl/sof-ptl.ri
[   14.491768] sof-audio-pci-intel-ptl 0000:00:1f.3:  Firmware lib path: intel/sof-ipc4-lib/ptl
[   14.491769] sof-audio-pci-intel-ptl 0000:00:1f.3:  Topology file:     function topologies
[   14.491953] sof-audio-pci-intel-ptl 0000:00:1f.3: Loaded firmware library: ADSPFW, version: 2.14.1.1
[   14.491978] soundwire sdw-master-0-3: SDW Slave Addr: 3001fa355701
[   14.491980] soundwire sdw-master-0-3: SDW Slave class_id 0x01, mfg_id 0x01fa, part_id 0x3557, unique_id 0x0, version 0x3
[   14.492246] soundwire sdw-master-0-3: No more devices to enumerate
[   14.492316] soundwire sdw:0:3:01fa:3557:01:1: signaling enumeration completion for Slave 1
[   14.492317] soundwire sdw:0:3:01fa:3557:01:1: Configured bus base 1, scale 2, mclk 19200000, curr_freq 9600000
[   14.492865] soundwire sdw:0:3:01fa:3557:01:1: signaling initialization completion for Slave 1
[   14.492867] soundwire sdw:0:3:01fa:3557:01:0: signaling enumeration completion for Slave 2
[   14.492868] soundwire sdw:0:3:01fa:3557:01:0: Configured bus base 1, scale 2, mclk 19200000, curr_freq 9600000
[   14.493449] soundwire sdw:0:3:01fa:3557:01:0: signaling initialization completion for Slave 2
[   14.497331] cs35l56 sdw:0:2:01fa:3557:01:2: supply VDD_P not found, using dummy regulator
[   14.497357] cs35l56 sdw:0:2:01fa:3557:01:2: supply VDD_IO not found, using dummy regulator
[   14.497363] cs35l56 sdw:0:2:01fa:3557:01:2: supply VDD_A not found, using dummy regulator
[   14.504831] cs35l56 sdw:0:2:01fa:3557:01:2: Cirrus Logic CS35L57 Rev B2 OTP1 fw:4.2.1 (patched=0)
[   14.508913] cs35l56 sdw:0:2:01fa:3557:01:2: probe complete
[   14.509012] cs35l56 sdw:0:2:01fa:3557:01:2: Slave 1 state check1: UNATTACHED, status was 1
[   14.509014] cs35l56 sdw:0:2:01fa:3557:01:2: initializing enumeration and init completion for Slave 1
[   14.509122] cs35l56 sdw:0:2:01fa:3557:01:3: supply VDD_P not found, using dummy regulator
[   14.509195] cs35l56 sdw:0:2:01fa:3557:01:3: supply VDD_IO not found, using dummy regulator
[   14.509202] cs35l56 sdw:0:2:01fa:3557:01:3: supply VDD_A not found, using dummy regulator
[   14.511199] soundwire sdw-master-0-2: Slave attached, programming device number
[   14.511359] soundwire sdw-master-0-2: SDW Slave Addr: 3201fa355701
[   14.511361] soundwire sdw-master-0-2: SDW Slave class_id 0x01, mfg_id 0x01fa, part_id 0x3557, unique_id 0x2, version 0x3
[   14.511774] soundwire sdw-master-0-2: No more devices to enumerate
[   14.511822] cs35l56 sdw:0:2:01fa:3557:01:2: signaling enumeration completion for Slave 1
[   14.511823] cs35l56 sdw:0:2:01fa:3557:01:2: Configured bus base 1, scale 2, mclk 19200000, curr_freq 9600000
[   14.516229] cs35l56 sdw:0:2:01fa:3557:01:2: signaling initialization completion for Slave 1
[   14.517081] cs35l56 sdw:0:2:01fa:3557:01:3: Cirrus Logic CS35L57 Rev B2 OTP1 fw:4.2.1 (patched=0)
[   14.521184] cs35l56 sdw:0:2:01fa:3557:01:3: probe complete
[   14.521280] cs35l56 sdw:0:2:01fa:3557:01:3: Slave 2 state check1: UNATTACHED, status was 1
[   14.521282] cs35l56 sdw:0:2:01fa:3557:01:3: initializing enumeration and init completion for Slave 2
[   14.521314] cs35l56 sdw:0:3:01fa:3557:01:0: supply VDD_P not found, using dummy regulator
[   14.521346] cs35l56 sdw:0:3:01fa:3557:01:0: supply VDD_IO not found, using dummy regulator
[   14.521352] cs35l56 sdw:0:3:01fa:3557:01:0: supply VDD_A not found, using dummy regulator
[   14.523591] soundwire sdw-master-0-2: Slave attached, programming device number
[   14.523751] soundwire sdw-master-0-2: SDW Slave Addr: 3301fa355701
[   14.523752] soundwire sdw-master-0-2: SDW Slave class_id 0x01, mfg_id 0x01fa, part_id 0x3557, unique_id 0x3, version 0x3
[   14.523959] soundwire sdw-master-0-2: No more devices to enumerate
[   14.523990] cs35l56 sdw:0:2:01fa:3557:01:3: signaling enumeration completion for Slave 2
[   14.523990] cs35l56 sdw:0:2:01fa:3557:01:3: Configured bus base 1, scale 2, mclk 19200000, curr_freq 9600000
[   14.527441] cs35l56 sdw:0:2:01fa:3557:01:3: signaling initialization completion for Slave 2
[   14.528453] cs35l56 sdw:0:3:01fa:3557:01:0: Cirrus Logic CS35L57 Rev B2 OTP1 fw:4.2.1 (patched=0)
[   14.531538] cs35l56 sdw:0:3:01fa:3557:01:0: probe complete
[   14.531882] cs35l56 sdw:0:3:01fa:3557:01:0: Slave 2 state check1: UNATTACHED, status was 1
[   14.531884] cs35l56 sdw:0:3:01fa:3557:01:0: initializing enumeration and init completion for Slave 2
[   14.531985] cs35l56 sdw:0:3:01fa:3557:01:1: supply VDD_P not found, using dummy regulator
[   14.532008] cs35l56 sdw:0:3:01fa:3557:01:1: supply VDD_IO not found, using dummy regulator
[   14.532019] cs35l56 sdw:0:3:01fa:3557:01:1: supply VDD_A not found, using dummy regulator
[   14.533928] soundwire sdw-master-0-3: Slave attached, programming device number
[   14.534087] soundwire sdw-master-0-3: SDW Slave Addr: 3001fa355701
[   14.534088] soundwire sdw-master-0-3: SDW Slave class_id 0x01, mfg_id 0x01fa, part_id 0x3557, unique_id 0x0, version 0x3
[   14.534297] soundwire sdw-master-0-3: No more devices to enumerate
[   14.539433] cs35l56 sdw:0:3:01fa:3557:01:1: Cirrus Logic CS35L57 Rev B2 OTP1 fw:4.2.1 (patched=0)
[   14.542559] cs35l56 sdw:0:3:01fa:3557:01:1: probe complete
[   14.542561] cs35l56 sdw:0:3:01fa:3557:01:0: signaling enumeration completion for Slave 2
[   14.542562] cs35l56 sdw:0:3:01fa:3557:01:0: Configured bus base 1, scale 2, mclk 19200000, curr_freq 9600000
[   14.546058] cs35l56 sdw:0:3:01fa:3557:01:0: signaling initialization completion for Slave 2
[   14.546070] cs35l56 sdw:0:3:01fa:3557:01:1: Slave 1 state check1: UNATTACHED, status was 1
[   14.546071] cs35l56 sdw:0:3:01fa:3557:01:1: initializing enumeration and init completion for Slave 1
[   14.546072] soundwire sdw-master-0-3: Slave attached, programming device number
[   14.546231] soundwire sdw-master-0-3: SDW Slave Addr: 3101fa355701
[   14.546232] soundwire sdw-master-0-3: SDW Slave class_id 0x01, mfg_id 0x01fa, part_id 0x3557, unique_id 0x1, version 0x3
[   14.546438] soundwire sdw-master-0-3: No more devices to enumerate
[   14.546471] cs35l56 sdw:0:3:01fa:3557:01:1: signaling enumeration completion for Slave 1
[   14.546472] cs35l56 sdw:0:3:01fa:3557:01:1: Configured bus base 1, scale 2, mclk 19200000, curr_freq 9600000
[   14.549829] cs35l56 sdw:0:3:01fa:3557:01:1: signaling initialization completion for Slave 1
[   14.596697] typec port0: bound usb3-port2 (ops connector_ops)
[   14.596707] typec port0: bound usb2-port1 (ops connector_ops)
[   14.596710] typec port0: bound usb4_port1 (ops connector_ops.llvm.4707064817163985317 [thunderbolt])
[   14.631511] sof-audio-pci-intel-ptl 0000:00:1f.3: Loaded firmware library: ADSPFW, version: 2.14.1.1
[   14.645008] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[   14.645012] Bluetooth: BNEP filters: protocol multicast
[   14.645014] Bluetooth: BNEP socket layer initialized
[   14.712245] sof-audio-pci-intel-ptl 0000:00:1f.3: Booted firmware version: 2.14.1.1
[   14.728140] Bluetooth: hci0: Waiting for firmware download to complete
[   14.728160] Bluetooth: hci0: Firmware loaded in 435369 usecs
[   14.750161] iwlwifi 0000:00:14.3: Detected RF WH, rfid=0x20113100
[   14.774135] Bluetooth: hci0: Received gp1 mailbox interrupt
[   14.774980] Bluetooth: hci0: Waiting for device to boot
[   14.774982] Bluetooth: hci0: Device booted in 45710 usecs
[   14.774983] Bluetooth: hci0: Waiting for device transition to d0
[   14.775107] Bluetooth: hci0: Device moved to D0 in 120 usecs
[   14.775862] Bluetooth: hci0: Found Intel DDC parameters: intel/ibt-00a0-01a1-pci.ddc
[   14.776000] Bluetooth: hci0: Applying Intel DDC parameters completed
[   14.776225] Bluetooth: hci0: Firmware timestamp 2026.3 buildtype 1 build 75512
[   14.776227] Bluetooth: hci0: Firmware SHA1: 0xd68504ef
[   14.776425] Bluetooth: hci0: Fseq status: Success (0x00)
[   14.776427] Bluetooth: hci0: Fseq executed: 00.101.00.03
[   14.776428] Bluetooth: hci0: Fseq BT Top: 00.102.00.01
[   14.816310] Bluetooth: MGMT ver 1.23
[   14.823128] NET: Registered PF_ALG protocol family
[   14.854803] iwlwifi 0000:00:14.3: base HW address: 84:d1:c1:79:ea:2d
[   15.061561] ish-hid {33AECD58-B679-4E54-9BD9-A04D34F0C226}: [hid-ish]: enum_devices_done OK, num_hid_devices=3
[   15.068462] hid-generic 001F:8087:0AC2.0003: hidraw2: SENSOR HUB HID v2.00 Device [hid-ishtp 8087:0AC2] on 
[   15.075303] hid-generic 001F:8087:0AC2.0004: hidraw3: SENSOR HUB HID v2.00 Device [hid-ishtp 8087:0AC2] on 
[   15.080819] hid-generic 001F:8087:0AC2.0005: hidraw4: SENSOR HUB HID v2.00 Device [hid-ishtp 8087:0AC2] on 
[   15.087166] hid-sensor-hub 001F:8087:0AC2.0003: hidraw2: SENSOR HUB HID v2.00 Device [hid-ishtp 8087:0AC2] on 
[   15.088081] hid-sensor-hub 001F:8087:0AC2.0004: hidraw3: SENSOR HUB HID v2.00 Device [hid-ishtp 8087:0AC2] on 
[   15.088877] hid-sensor-hub 001F:8087:0AC2.0005: hidraw4: SENSOR HUB HID v2.00 Device [hid-ishtp 8087:0AC2] on 
[   15.209320] typec port1: bound usb3-port1 (ops connector_ops)
[   15.209330] typec port1: bound usb2-port2 (ops connector_ops)
[   15.209334] typec port1: bound usb4_port3 (ops connector_ops.llvm.4707064817163985317 [thunderbolt])
[   18.223277] soundwire sdw-master-0-2: clock stop prepare done slave:15
[   18.223291] soundwire sdw-master-0-3: clock stop prepare done slave:15
[   19.514456] sdca_class sdw:0:0:01fa:4245:01: timed out waiting for device re-attach
[   25.658933] platform sof_sdw: deferred probe pending: sof_sdw: snd_soc_register_card failed -517

--nextPartXbVB0C_eQPOiQtg5zktbiw--



