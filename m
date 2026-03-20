Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A221030EF94
	for <linux-sound@vger.kernel.org>; Fri, 20 Mar 2026 01:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773970285; cv=pass; b=gRGxe0iSTzV8aYWzPviHjrew0NmZJ0Yoxx9PiPR7E7yx9cUlkvz71x2K8fmJWOfD+gy8RzADNqB3ewV43m7c64/wmojqot738pae7K/4CYexdzmFGx7euP8czPhByoyTKuVNtpZmopsf3BxGdnA2KhmM+gs87PMRQKw5lAo3v54=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773970285; c=relaxed/simple;
	bh=k57GeHhvfAgv90Djng/naWhu94TTgr9noeZJWKxUzsI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=rfl77StgYaPBnmZA7e6O/L8aSUsoXY7JEtj0rtlNReN2QLNICgh1g+KeEfa48JY0praU7mATbXdmwrRn8FJSHqcV5TQjPvF+UgAb7EB3KyvJjqzWRf19Y3JG5gvS6MWe0HgoawZkH9TX6tQNa/FzXMx0nKOTS4ADHPDvjFNIJOk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gbIcPWi0; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gbIcPWi0"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ad21f437eeso12946395ad.0
        for <linux-sound@vger.kernel.org>; Thu, 19 Mar 2026 18:31:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773970279; cv=none;
        d=google.com; s=arc-20240605;
        b=dHXIobV3D6L7dUYDo9O4WXMW7ApkouDv6WhqE3tvs9//PVBUD8ITIaMmeQpRWO7uTN
         BZ42b62eNbKA083FP9M+c6UIc9nOaOiEQUpJCarp9K0gdt6PWrIPKkipWaZapdQLd3EH
         zTWJDmlw0xtAzii/HWeFZVG6Gl3Zu0C08mlxJxJ4oXkCdX+PCQr83lWbd+hjNgyr3hP5
         9OcxAgh1Gi9tph9gzJkrpIzv/wBRjYxnBm3ENj5cli9tR6PgvbqH58EjK0MRdCyldj8g
         OJT0ImV+iD+rfsRWAjJ1byObein0OmlmlxG9x+ItB2Q9SrT1FLcxuV8X6nKtZH3eRW7n
         5EKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=mfus+Gbe3VU84G01V4DJgupQByB32QKlrugOUEdpaYo=;
        fh=wP1nXfu12ShBUvOX0bJu1+SuyAjfuR86srWqT39/mX4=;
        b=NwzB33qY3n4Jly1rUWwCXb1gi66NpS5bBcgCAFiYfCgZ/TXlQOrgsCI6N3jJbCvEX7
         HfICvMuOSp4p+nkSjUS2hqJJPDjtIgJ6nA3ESBtFxpw06mMyEqJggw5eBfru6wdTsk9w
         GUCkzOwH4bJxovjma8H2fvtp0WMmxmiw6I0XVr6VLPc+V1V6aISSbAF+YZI1qjkdZUgr
         qmVHtPAzzy0A90c36/55yi/GZHo87s+eEZeK0pCPJmDP9jqRw+GX/Rao716GRkZV372B
         k4j0o4sdhxL6hIjqvcuJatAHi1zdz1q9xP/XUFezkleK95djvhsRmgLiADBrOngf847q
         aHjg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773970279; x=1774575079; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mfus+Gbe3VU84G01V4DJgupQByB32QKlrugOUEdpaYo=;
        b=gbIcPWi0B8d5WGcgIkAlpcWQYJpGf/s5toWSZMS9Zwq9QuXpyqm1RdbqK3y//sR9Hz
         fDBz+S/4mHeKL1iq6+Lbs1rmu5RHJjySQ+TzDhzgUW5xSZWYqqbwnFZbZDoAGuA7royN
         4wrZVVCPhb4UoEUyqoTPNb9IfLW/quUjd67j6wUjjCdjMecGX0Vgqh/UdBMA0wSoiGmm
         ta95qFQTfrCoOvVUUSLoF7LzR3YmJfdmT23DDapR8hjRDSbOlTEv6+JUH3AaKQidHcPe
         H+hRTboWXZZ7R/eJ7Vi3wP+1By41VcM70XpDWANjQegBshNrPWsAbKD+82bNzRZN3O4w
         KJ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773970279; x=1774575079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mfus+Gbe3VU84G01V4DJgupQByB32QKlrugOUEdpaYo=;
        b=SGQxtsrph95PrnqfxCJbYke+CZVBEI7cB/fasdCGDwA+X6ai7TeKaz7MpwqzyfZL0E
         X2rrb/+4a+QXtgIDYqsl4p3Y2D/z6cTxt101E8aicTpMdXC/CzSh8+nrkFaUJSgQ0T1t
         cr4jPiXxf62bNYLkBNkSFhwei4HJg8HXGDS+ioMWVWefJ1sSG9t2x4vyBW52Yr/eVMNF
         SytDjRWnG7hV1/x7ZsFLIGsugAlVe980a5EasRn814/05KdMD7XJlvxbRhzv4dU78NUi
         y2UUIhqFSRH5t46aGZPz1J5DDpqGCdI2UjX/VLH3my6lqbrHSLWp6pxzvHlT2xsy0EvO
         M20w==
X-Gm-Message-State: AOJu0YwnO4y0vW20+8bY/EExH993t96X4e7MwzaA8FAbUlrLHtww3ODB
	1PTvzxQ9J2mIqHvTgD0LpZi3gHiyMTSnA/w3ovTeTXHx8yVrXuMIEHl6Q4rXz+tFXBTOguvm335
	Pn7ibBWs9Q7WCyY6aKdUVjVJtdZ0022p4DeKiZz0=
X-Gm-Gg: ATEYQzzb4TVPPC8iWy0zdyIKsH8hq7yaEwavitsgQU9prv8re4/7Cnfh3sorqD9sh4t
	VjEQGl0OrYs5wYVbaLGjOLqvlLx8BNRSw3qzTqdjqtdzOCF+UNo+zxSJJVcRzV+Ducm5aVN0Cpd
	lfCp6qXW1Xk/aT9jBRzRDSrd1mnNQVCRurC3x+0XiGAorjat7XWqjGkec75j+lEHGFj0+bhvvQd
	PL8Z8mCnaVTipfOe3FAAzRR0HwqFW2+vBkCx7f6Vgn42Usw9L0oCvH53dObShrs5xubl96Qhmd5
	iFI0Hf7sroTfl9AyXy/fF+ctcXggNtsy99QTzAL18oVtiHjnMBA2I6anqYK+D9UddBAu9qyHssk
	19vc=
X-Received: by 2002:a17:903:1a67:b0:2b0:51f6:d469 with SMTP id
 d9443c01a7336-2b0828264afmr10070465ad.23.1773970278633; Thu, 19 Mar 2026
 18:31:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Enrique Orozco <kikeoropad@gmail.com>
Date: Thu, 19 Mar 2026 19:31:07 -0600
X-Gm-Features: AaiRm53r-ou_vLeZVDdmdFYskpzILioWyaiSsoo66re6sE-VYVaCwb9uyUmbLWM
Message-ID: <CA+Q1o_9CgNNmRiF044ZPSVGnbDUHh-VhTKtc5pBDLYXJGw2GHA@mail.gmail.com>
Subject: [BUG] Dell Inspiron 3501 (Tiger Lake) - No analog audio output, only
 HDMI detected
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear sound/ALSA maintainers,

I am reporting an issue with audio on a Dell Inspiron 3501 laptop. The
system detects the Intel HDA controller but only HDMI outputs appear;
the internal speakers and headphone jack are not detected at all.

System Information:
- Laptop: Dell Inspiron 3501
- Audio Controller: Intel Corporation Tiger Lake-LP Smart Sound Technology
  Audio Controller [8086:a0c8] (rev 20)
- Subsystem: Dell Device [1028:0a25]
- Kernel: 6.18.12-1-MANJARO (also tested with 6.18.12)
- Distribution: Manjaro (Arch-based)

Problem Description:
After boot, only HDMI audio outputs are available. The internal speakers
and headphone jack do not appear in ALSA or PulseAudio/PipeWire. The
kernel detects the audio hardware but fails to initialize the analog
codec.

Observations:
1. `aplay -l` shows only HDMI devices (devices 3,7,8,9)
2. No analog output device (device 0) appears
3. The codec detected is only "Intel Tigerlake HDMI" - no analog codec
4. The following error appears in dmesg:
   `snd_soc_avs 0000:00:1f.3: core_mask 1 power off failed: -110`
5. Attempted various snd_hda_intel model parameters (dell-headset-multi,
   dell-headset-dock, generic) with no success
6. Forcing legacy driver with `snd-intel-dspcfg dsp_driver=3D1` also
   didn't help

Reproduction Steps:
1. Boot any recent Linux kernel (tested with 5.15.x and 6.18.x)
2. Check audio outputs with `aplay -l`
3. Observe only HDMI outputs are present
4. No sound from internal speakers or headphone jack

Expected Behavior:
The system should detect and provide both analog output (internal
speakers/headphone) and HDMI output.

Additional Information:
- ALSA diagnostics:
http://alsa-project.org/db/?f=3D8eb23206a6d8aa76d24136f224b1ad93dab53651

- lspci -vvv output:
lspci -vvv -s 00:1f.3
00:1f.3 Audio device: Intel Corporation Tiger Lake-LP Smart Sound
Technology Audio Controller (rev 20) (prog-if 00 [HDA compatible])
Subsystem: Dell Device 0a25
Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
Latency: 64
Interrupt: pin A routed to IRQ 153
Region 0: Memory at 6001138000 (64-bit, non-prefetchable) [size=3D16K]
Region 4: Memory at 6001000000 (64-bit, non-prefetchable) [size=3D1M]
Capabilities: <access denied>
Kernel driver in use: snd_hda_intel
Kernel modules: snd_soc_avs, snd_sof_pci_intel_tgl, snd_hda_intel


- dmesg audio-related messages:
sudo dmesg | grep -i -E "snd|hda|sof|audio|alsa"            =EE=82=B2 1|1 =
=E2=9C=98
[sudo] password for enriqueop:
[    0.033006] software IO TLB: area num 8.
[    0.305063] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
[    0.305064] software IO TLB: mapped [mem
0x000000004f173000-0x0000000053173000] (64MB)
[    0.364632] integrity: Loaded X.509 cert 'Microsoft Windows
Production PCA 2011: a92902398e16c49778cd90f99e4f9ae17c55af53'
[    0.364639] integrity: Loaded X.509 cert 'Microsoft Corporation
UEFI CA 2011: 13adbf4309bd82709c8cd54f316ed522988a1bd4'
[    2.989645] pps_core: Software ver. 5.3.6 - Copyright 2005-2007
Rodolfo Giometti <giometti@linux.it>
[    3.235754] snd_hda_intel 0000:00:1f.3: enabling device (0000 -> 0002)
[    3.235948] snd_hda_intel 0000:00:1f.3: bound 0000:00:02.0 (ops
intel_audio_component_bind_ops [i915])
[    3.279312] input: HDA Intel PCH HDMI/DP,pcm=3D3 as
/devices/pci0000:00/0000:00:1f.3/sound/card0/input16
[    3.279365] input: HDA Intel PCH HDMI/DP,pcm=3D7 as
/devices/pci0000:00/0000:00:1f.3/sound/card0/input17
[    3.279404] input: HDA Intel PCH HDMI/DP,pcm=3D8 as
/devices/pci0000:00/0000:00:1f.3/sound/card0/input18
[    3.279443] input: HDA Intel PCH HDMI/DP,pcm=3D9 as
/devices/pci0000:00/0000:00:1f.3/sound/card0/input19


lsmod | grep -E "snd|hda|sof|audio"                      =EE=82=B2 =E2=9C=
=94 =EE=82=B2 7s =EF=89=92
snd_seq_dummy          12288  0
snd_hrtimer            12288  1
snd_seq               135168  7 snd_seq_dummy
snd_seq_device         16384  1 snd_seq
snd_hda_codec_intelhdmi    28672  1
snd_hda_intel          69632  1
snd_sof_pci_intel_tgl    12288  0
snd_sof_pci_intel_cnl    20480  1 snd_sof_pci_intel_tgl
snd_sof_intel_hda_generic    40960  2
snd_sof_pci_intel_tgl,snd_sof_pci_intel_cnl
soundwire_intel        94208  1 snd_sof_intel_hda_generic
snd_sof_intel_hda_sdw_bpt    24576  1 soundwire_intel
snd_sof_intel_hda_common   204800  4
snd_sof_intel_hda_sdw_bpt,snd_sof_intel_hda_generic,snd_sof_pci_intel_tgl,s=
nd_sof_pci_intel_cnl
snd_soc_hdac_hda       24576  1 snd_sof_intel_hda_common
snd_sof_intel_hda_mlink    36864  4
snd_sof_intel_hda_sdw_bpt,soundwire_intel,snd_sof_intel_hda_common,snd_sof_=
intel_hda_generic
snd_sof_intel_hda      20480  2
snd_sof_intel_hda_common,snd_sof_intel_hda_generic
snd_hda_codec_hdmi     61440  1 snd_hda_codec_intelhdmi
snd_sof_pci            24576  3
snd_sof_intel_hda_generic,snd_sof_pci_intel_tgl,snd_sof_pci_intel_cnl
snd_sof_xtensa_dsp     16384  1 snd_sof_intel_hda_generic
snd_sof               479232  6
snd_sof_intel_hda_sdw_bpt,snd_sof_pci,snd_sof_intel_hda_common,snd_sof_inte=
l_hda_generic,snd_sof_intel_hda,snd_sof_pci_intel_cnl
snd_sof_utils          16384  1 snd_sof
snd_soc_acpi_intel_match   143360  3
snd_sof_intel_hda_generic,snd_sof_pci_intel_tgl,snd_sof_pci_intel_cnl
snd_soc_acpi_intel_sdca_quirks    12288  1 snd_soc_acpi_intel_match
snd_soc_acpi           16384  2
snd_soc_acpi_intel_match,snd_sof_intel_hda_generic
snd_soc_sdca           98304  2 snd_soc_acpi_intel_sdca_quirks,soundwire_bu=
s
snd_soc_avs           262144  0
snd_soc_hda_codec      28672  1 snd_soc_avs
snd_hda_ext_core       36864  7
snd_sof_intel_hda_sdw_bpt,snd_soc_avs,snd_soc_hda_codec,snd_sof_intel_hda_c=
ommon,snd_soc_hdac_hda,snd_sof_intel_hda_mlink,snd_sof_intel_hda
snd_hda_codec         217088  7
snd_soc_avs,snd_hda_codec_hdmi,snd_soc_hda_codec,snd_hda_intel,snd_soc_hdac=
_hda,snd_sof_intel_hda,snd_hda_codec_intelhdmi
snd_hda_core          147456  10
snd_soc_avs,snd_hda_codec_hdmi,snd_soc_hda_codec,snd_hda_intel,snd_hda_ext_=
core,snd_hda_codec,snd_sof_intel_hda_common,snd_soc_hdac_hda,snd_sof_intel_=
hda,snd_hda_codec_intelhdmi
snd_intel_dspcfg       45056  5
snd_soc_avs,snd_hda_intel,snd_sof,snd_sof_intel_hda_common,snd_sof_intel_hd=
a_generic
snd_intel_sdw_acpi     16384  2 snd_intel_dspcfg,snd_sof_intel_hda_generic
snd_hwdep              24576  1 snd_hda_codec
snd_soc_core          434176  7
snd_soc_avs,snd_soc_hda_codec,soundwire_intel,snd_sof,snd_soc_sdca,snd_sof_=
intel_hda_common,snd_soc_hdac_hda
snd_compress           32768  2 snd_soc_avs,snd_soc_core
ac97_bus               12288  1 snd_soc_core
snd_pcm_dmaengine      20480  1 snd_soc_core
snd_pcm               212992  14
snd_soc_avs,snd_hda_codec_hdmi,snd_hda_intel,snd_hda_codec,soundwire_intel,=
snd_sof,snd_soc_sdca,snd_sof_intel_hda_common,snd_compress,snd_sof_intel_hd=
a_generic,snd_soc_core,snd_sof_utils,snd_hda_core,snd_pcm_dmaengine
snd_timer              57344  3 snd_seq,snd_hrtimer,snd_pcm
snd                   159744  16
snd_seq,snd_seq_device,snd_hda_codec_hdmi,snd_hwdep,snd_hda_intel,snd_hda_c=
odec,snd_sof,snd_soc_sdca,snd_timer,snd_compress,snd_soc_core,snd_pcm
soundcore              16384  1 snd

lspci | grep -i audio                                           =EE=82=B2 =
=E2=9C=94
00:1f.3 Audio device: Intel Corporation Tiger Lake-LP Smart Sound
Technology Audio Controller (rev 20)

cat /proc/asound/card0/codec#* | grep -i "Codec" 2>/dev/null
Codec: Intel Tigerlake HDMI

- Current modprobe configuration: options snd_hda_intel model=3Ddell-headse=
t-multi
cat /etc/modprobe.d/*.conf | grep -i snd                        =EE=82=B2 =
=E2=9C=94
options snd_hda_intel model=3Ddell-headset-multi

What I've tried:
- Various model parameters (dell-headset-multi, 1, 2, 3, 4)
- Forcing legacy driver with dsp_driver=3D1
- Different kernel versions (5.15, 6.18)
- Checking alsamixer (only HDMI controls appear)
- Updating the BIOS to the latest from Dell

This appears to be a codec detection/initialization issue. The hardware
exists but the analog codec is not being properly detected or initialized.

Please let me know if you need any additional information or if I can
provide any further debugging data.

Thank you for your time and effort maintaining ALSA.

Best regards,

Enrique Orozco
