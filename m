Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794361214;
	b=Hoy68c1Bue8NdgrpUpqjpAFQaJ/JIjNSiycVGZYpYgwAtwMkbMOOcn0hFJMkQfLCsLio
	 hIXzlFsXoHMMa2adw4lB6HAe6TmULvLnIc0D2sdt3Tjf+z9E/qjo0yLPG0s5hIy0tDqHb
	 AfMDWRiNIM7ubODXguIg3tvk8Rsyx8XuYW8DnMPff1XDiJErKVhRpf2/LSFMrm9ZP1aes
	 OmhKlsfOCDxXHL0T1vsY0aM1QSDGtJDg7F81gqQYT4B7Yl5ft96ojIFD78eR3zpnhZKPf
	 12Hl8hjJSsDuv9QCP9DoIYNJxwquxxfik07raGaLXBrW1IEXs2/s9K8wYh5i55UUi0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794361214;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SEznzYyvdTSxa+BvfqhFvVyZzygD+3ndNPeZO+sVVv8=;
	b=0hoQwGVMm5upzLLRmI5jcXlPnI55xyj6Ov96Zk4+U5dtZRh1jobUky1qUe5jfNmPkzhW
	 VAKjx9WTdR0qGv7jbZHPLFiC9AQU704IO6/sXHamknCPLA8pS68GfXXNUXPtJbx8JUDlw
	 8rIO+yX78YKD+AoxubcuX+ZKkAefTmLCGDdRTj0yvFMJmEz4gegYC4I6EkzPlnnTEis6E
	 VApKhsRdlnjbyJCJG1H85iPwAVA7wz/lVDhZdGxpdpejhG3faHcZ6dkRnOwURdgJAUyCb
	 crMtoyXOrCV5trmldkzpk80cyaRyXQsNl6fkDMsrmaBppVIMImK/xFfabNHbP0ekd7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dankook.ac.kr;
	spf=pass smtp.mailfrom=dankook.ac.kr;
	dkim=pass header.d=dankook-ac-kr.20260707.gappssmtp.com header.i=@dankook-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=JZHn5elB;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148BE606A321
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 01:40:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 148BE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dankook.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dankook.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dankook-ac-kr.20260707.gappssmtp.com header.i=@dankook-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=JZHn5elB
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so1296112a12.0
        for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 17:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dankook-ac-kr.20260707.gappssmtp.com; s=20260707; t=1794361212; x=1794966012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SEznzYyvdTSxa+BvfqhFvVyZzygD+3ndNPeZO+sVVv8=;
        b=JZHn5elB1QDZDqoEdvVi2fRCsEaH6qhO94mesK+Ct7n+eFyliCWuzvghPInb23N3mr
         pHynupKvYSsSuuN2/9SUqIOijrZXb1e9/JvGzDYoOe9HeHcVZaTFtW57vj9aiz3VdeO4
         2rmrto9IYWuP0hndg1XoQTiQdG+PstmcyAldsnuOBMs6kaQucRm0FZq7RS+RPvfP55Hh
         +/8lCqGiqC5G/Ehr2tc82X6Gz47P50rS5i6hH5MBIwLanw/jbHyk992Tbav6Fsho1qnV
         qfo5Lb46vbY/kSnEFOdaB9IXHhbqc3T90VLzjGklW8cfb9tyrjtsnsyShKmiS0EW+tNb
         teIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794361212; x=1794966012;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SEznzYyvdTSxa+BvfqhFvVyZzygD+3ndNPeZO+sVVv8=;
        b=T1UFCGnDd+fFxTgZ3Xk84FBOXaRpcDu+fa6QOqPbIo8mJECEvjY24qUAOkNlneYw6j
         H74Ag0v5Ihoe8ewtg7h+UoaLOLVn1cwqgZql67hyljql8vQE9UbXhO+MAw1fjVIX2Dpx
         pOJOjt7n4Iv0c+Mxir5l6v4NkzbVm50nZCuiLZC1S7zkAhoNYr39FFYrLk7lrJCbZYYU
         yYnL8ErWEut2C4BdmNOBg/VkA2wgP3mbe1ktTqIlNh+M/pU06L5+0Y/4RXGa81Xx2y9m
         bqGZlxewYMwdVoA6UziNT0r56Wda0MJMZA4resmZ1ViSYZCS1n2M7TgGl+KhI3YcWiZg
         9jIQ==
X-Gm-Message-State: APuU4Z9uabnaGeht/+JP6NypjNfJjrlR8tFNyPCEaAbn4A1P4WTZ3o62
	0vSAx/m55+46prA4+N6B1DR9IIq2s68/UjwmwkMMSkEjINzuIfDyW626ZavaldtUu30=
X-Gm-Gg: AYBFou16iu3rI1DRLNdl8kLRmgh4YlVJ84AwaI8IrJg8mxTn9V8Evzv4kdFJmkJsSx1
	mBMiOcIpvhsJLXGGQAGcq3CgMoIXwbQQqjX4AifqK/3ZFAIInfU6JbhK6rFlkQlTzek6SzCMTKs
	3Sif1DiyOqD6YYSBiR7ANMX6oxvLhKxfGRg0+GNySUPNbZPlLZ8C/t+Th8lWeQTT+rOc/1XdOVA
	OTAV5t3rlN740/yYWMFudgaPfj18bpH4XXBRCUD1dxQJKuiF536FlnrfM6m/1iur/wiA6N8SsoI
	gWrogsHRok2GQdrxJ1e/gyx2lzAbouqcue5DHoXN/IkaExCQPE7xaciRFIJCAbTSiMdfW6LjGvF
	zcbCqI9cDEERn9nmw3ewVHXHsc9j+tJJBaun1dI5Fj8a5E9n3q+MTYK6/mDXZ4pNf53MOMPYeb5
	nUd4pMULE+//byGMO8ULPsREK/dWeEjVOcNuBb6Dfx8l4UI1dczd6YovXWMe+Q0TFhYVXdEJsyh
	gFS6oRfnEmuZH/lbybXqh0Ll1XBC+a5HfD9DYiXRV6VmGohiknfiSJoAQ9I3u/p3jPM2bPlxrxm
	Ars+UfPvTeH7K1LYJIxOAA==
X-Received: by 2002:a17:90b:5483:b0:3ac:8af9:4a77 with SMTP id 98e67ed59e1d1-3b182ec2078mr679895a91.10.1794361212044;
        Tue, 10 Nov 2026 17:40:12 -0800 (PST)
Received: from myarch ([61.254.29.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db9d1fbsm1912111a91.15.2026.11.10.17.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 17:40:11 -0800 (PST)
From: fixca <jaehoon1744@dankook.ac.kr>
X-Google-Original-From: fixca <jaehoon1744@gmail.com>
To: broonie@kernel.org,
	Vijendar.Mukunda@amd.com,
	shumingf@realtek.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC v2 0/2] ASoC: amd: SoundWire audio for LG gram 16Z95U (rt713 + rt1320), speaker still silent
Date: Wed, 11 Nov 2026 10:39:08 +0900
Message-ID: <20261111013953.4011-1-jaehoon1744@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 2026 LG gram 16 with AMD Ryzen AI 400 (16Z95U, ACP rev 0x72,
PCI SSID 1854:056c) has no internal audio on mainline: no sound card is
created. The same generation 15Z95U has been reported with identical
symptoms (https://github.com/CachyOS/distribution/issues/516).

These two patches create the card. With them, headphone playback and
internal microphone capture work. Speaker playback through the RT1320
is still silent, and I would appreciate advice on that part (details
below). I am sending the series as RFC for that reason.

Changes in v2:
 - Rebased onto broonie/sound for-next; v1 was against v7.2.14 and did
   not apply. No functional change.
 - Patch 2: use a dedicated rt713 jack + DMIC endpoint array; the new
   jack_dmic_endpoints maps the DMIC to endpoint #2 (rt721), whereas
   the rt713 SmartMic DAI is endpoint #1.
 - Cover letter: added what the Windows driver loads for the RT1320.

Hardware, from the ACPI tables (ACP node \_SB.PCI0.GPPA.ACP):

  acp-audio-config-flag = 0x10 (FLAG_AMD_LEGACY_ONLY_DMIC)
  SDWC (_ADR 5): mipi-sdw-manager-list = 0x3
    link 0: SW36 _ADR 0x000030025D071301  RT713
            SDCA functions: UAJ (type 6) at 0x1, SmartMic (type 3) at 0x2
    link 1: SW23 _ADR 0x000131025D132001  RT1320
            SDCA function: SmartAmp (type 1) at 0x4

Patch 1 adds the machine to acp70_acpi_flag_override_table. Without it
snd_pci_ps returns -ENODEV because of the BIOS flag, snd_acp_pci binds
and reports "No matching ASoC machine driver found".

Patch 2 adds rt713 (link 0) + rt1320 (link 1, unique ID 1) entries to
snd_soc_acpi_amd_acp70_sdw_machines[].

Result with both patches (tested on 7.2.14, Arch Linux,
alsa-ucm-conf 1.2.16.1):

  card: amd-soundwire, components " cfg-amp:1 hs:rt713-sdca mic:rt713 spk:rt1320"
  SDW0-PIN0-PLAYBACK-SimpleJack  rt712-sdca-aif1   works
  SDW0-PIN3-CAPTURE-SimpleJack   rt712-sdca-aif1   not tested
  SDW0-PIN5-CAPTURE-SmartMic     rt712-sdca-aif3   works
  SDW1-PIN1-PLAYBACK-SmartAmp    rt1320-aif1       silent

Open problem: RT1320 speaker output is silent

The playback stream starts and runs without any error:

  rt1320-sdca sdw:0:1:025d:1320:01: rt1320_io_init amp func_status=0x41
  rt1320-sdca sdw:0:1:025d:1320:01: rt1320_vc_preset, RT1320_KR0_INT_READY=0x1f
  rt1320-sdca sdw:0:1:025d:1320:01: rt1320_io_init version_id=2, dev_id=0x6981
  rt1320-sdca sdw:0:1:025d:1320:01: rt1320_io_init hw_init complete
  ...
  soundwire sdw-master-0-1: Port=1 hstart=1 hstop=9 port_bo=65 slots=32 max_ports=6
  rt1320-sdca sdw:0:1:025d:1320:01: rt1320_sdw_hw_params rt1320-aif1

What I checked:

 - Mixer: "Speaker Switch" on, "rt1320-1 OT23 L/R Switch" on,
   "rt1320-1 FU21 Playback Volume" 87 (0 dB), "RX Channel Select" L,R.
 - Direct ALSA playback (speaker-test -D plughw:amdsoundwire,2) and
   playback through PipeWire both run to completion with no sound.
 - Runtime PM: forcing power/control=on for the RT1320, so io_init runs
   only once at boot, does not change the result.
 - rt1320-patch-code-vc.bin is installed and loads without error.
 - No DSP firmware is loaded: there is no "realtek,dspfw-name" property,
   and linux-firmware has no realtek/rt1320/rt1320_<vendor>_<product>_<sku>.dat
   or rt1320_RAE_<vendor>_<product>_<sku>.dat for this machine.

On Windows, Realtek's SDCA XU extension driver (RtkSdcaXuLG.inf,
10.0.297.1) binds to this amplifier:

  SOUNDWIRE\SDCA_10&MAN_025D&FUNC_1320&TYPE_01&VER_01&ADR_04&LID_01&UID_01&SUBSYS_056C1854

It ships RTKDAT_1854.dat and RTKDAT_GENERAL.dat and references per-SSID
ALC1320 DSP firmware / preset files (ALC1320\FWFiles.txt,
FWFiles_LG_1854_*.txt, alc1320fw_preset_*\alc1320_afx1_*.dat.bin,
RAE_XU). So on Windows a DSP firmware and RAE preset are loaded for this
amplifier, while on Linux none is.

In addition, the ACPI SmartAmp function carries a 5627-entry
"mipi-sdca-function-initialization-table" that differs from
rt1320_vc_blind_write[] in a number of registers (full list was attached
to v1), for example:

  register   ACPI   driver
  0xc900     0xd0   0x73
  0xc901     0x09   0x04
  0xd471     0xba   0x3a
  0xd479     0x40   0x20
  0xdb08     0xe7   0x7a

Questions:

 1. Shuming: is the missing DSP firmware / RAE preset the reason the
    amplifier stays silent on this design? If so, could Realtek provide
    RT1320 DSP and RAE files for the LG gram 16Z95U (SSID 1854:056c) to
    linux-firmware? I can test them.
 2. Vijendar: is SDW1 / ACP70_SW_AUDIO1_TX the right pin for an
    amplifier on link 1 with ACP rev 0x72, as used by the existing
    rt722 (link 0) + rt1320 (link 1) entry?

I can provide the full acpidump, dmesg and alsa-info output.

Disclosure: the analysis and both patches were prepared with the help of
an AI assistant (Claude); I built and tested them on the hardware.

Thanks,
Jaehoon Kim

body content if you don't wish to send a summary.
From: fixca <jaehoon1744@gmail.com>
To: broonie@kernel.org,Vijendar.Mukunda@amd.com,shumingf@realtek.com
Cc: linux-sound@vger.kernel.org,linux-kernel@vger.kernel.org
Bcc: 
Reply-To: 
Subject: [PATCH RFC v2 0/2] ASoC: amd: SoundWire audio for LG gram 16Z95U (rt713 + rt1320), speaker still silent
In-Reply-To: 

