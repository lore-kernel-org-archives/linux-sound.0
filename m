Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74CBC136351
	for <linux-sound@vger.kernel.org>; Sat, 13 Jun 2026 13:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781356799; cv=pass; b=lEvnoUrx+uDafPkPNvPUVHj3SYl+dERAiD9V6c3va0/KKWaW3FJ5jDHDCModBvm3ywf0lV27VX5xFudaEf7IolLPnNF5OhvhaG2sn+uc168x+5UezQOaA0rYUanYkJmMW5otQ5dth1mJyjXiLHWP24ZqbXN2spc/tIuMXemhQVs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781356799; c=relaxed/simple;
	bh=o1NLxwqqvjqRciIF0H87AYwGLhYI1xWFleHHAsr2nvc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=T3/7jeHqLyVVIiPrOoHWU4escvnz2eyr+f3/ZdUMq/axAt4mWJo5H8v//G6wEAQ+WGKoMiJZLmTX2GJpmoDywtMbqmoUgxX8j1NtcHLrglPnGEKYMOICCNWdHWMVl/fmF6PYLmfNEczRRipQHSGcq8aqbT/YxTgGJH9r3HQv8RA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OIf2tv/n; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OIf2tv/n"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-304ddfcf72cso2385929eec.0
        for <linux-sound@vger.kernel.org>; Sat, 13 Jun 2026 06:19:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781356797; cv=none;
        d=google.com; s=arc-20240605;
        b=QAT3Wvfe/0l0nR2xUy4bYC7NkIv+B/7CUDz+1LdQ7lBsE0lbVf9SYyinYK2qUMrTT6
         1VwGtKpA5i4EONcsxTVSeHqcTSWMumecOvhnnG8O8IJ9rkr565ASzR5IWr/4+kp9hJtD
         4KQQLaABq+As1Smt0o2rtSy/dJ2/vuq3+SIziwbiT8RXJuaoxOvIicpiIsdUzABj40Zf
         N0PY0U4fP8aP/kSH7/E7w0j3QK6v1BZUCxWOsnow0eihDe/Tc7SXutcKHvzYmsm8xIsS
         u9IwRzdK1Mfr5MIU434ovhi36Ujth91Y3chV+SoAjOFn2rUKiKuaFgYbPXYAHvyCG/hH
         OMYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=BwRF3cdKRqZeNxHxXbhst4kAcuaaMcZWSqrSm07bkns=;
        fh=T7r0+1mn44Lt3iA70f1+eh+INXNMMEbFCLk64ec0+AI=;
        b=d4PaNixX8PqcYJJ3JTE1SMGDCBlHuCTRRIMn8MKPwlZPySkXDmpz4sZewGW3A/IrJV
         r1BJdr3JVG5wsFuIevLJKofesgXCCgTg0j0iEIWbzIm/SWrLtL4imefOmc/iTgy8bd0+
         YYHXirqgHB+nftPkRgmSzWv6u0uKm8SyGictfgNSeMwlhgXBXqasWtjkXtNmFugSON4l
         7ROmV0MXopjoHAqubdTKe6a4k+up5G4cKwxVBsZPxA2Qb1jmLmZ9MDibrP8Fjae4ivz0
         SYCLWbKqAaBZHxDLpo/pRzVJycfALr4p4sI8ZuPHAvDBZrqhoh98doksfaZxHM3CLvpV
         OoSA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781356797; x=1781961597; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BwRF3cdKRqZeNxHxXbhst4kAcuaaMcZWSqrSm07bkns=;
        b=OIf2tv/n6YpIMkuw8/+P5Tn2qSd3JM7ecGfCRZ5ZtSt4KxuStEpsolGRymTsYxAMa8
         2kTsngHJTclaz9IeSIZzH/MQwPob9ofTomfGrcBCy/FwPTKdpb9mhsJPidwBNtgxgbTl
         qkk4JPTi2qUeboRNHmz0Bpgx12zsVLGcDYVUZaVA0sOadrpPyga4kyPVDCzQR3SPDxuI
         IrttUiCnjsWd4yjpFxJ2w605tJrJy9x2UFZ6Z3ZGQlfLTORBPBbyW/Xcu6qJDI3KaJhN
         sI6a66OYPqkb4FwLXbYGYFaeCEkVu3pjYu39im1WIZSfO36kCRhebk8pvSNkshbpaf0a
         G9vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781356797; x=1781961597;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BwRF3cdKRqZeNxHxXbhst4kAcuaaMcZWSqrSm07bkns=;
        b=IVup/0JMCofwg73zKupdmI50DzBVPHphO6eucVizwzvVDde+CtsAjY3bBpMXjpvB+j
         FEc/rZUlE4/cp0Bz66OpPX8b9kD2mwzf9FIcA0J24x0kgO2DXj52ffxBXfal4ANrDXbS
         f78DNtwsiqIDyXFEV944K1DWP1K3SC9T3KmoQXMPyVMbga3zT464i9ANCMyJyz2/rz8w
         jFQwDqCooYOIvKF8/5eGWpg0K3H052F6tTiAW5gxVGKy17JAHK0IVnrGN/rkYo2s7611
         kk1Wxa55ZOBQt6pE/VgGMqTT3hEISd1tZyhuK+Fwhcb6OOQmhJ1H8y67tPPHT9QMfOh+
         5DVQ==
X-Gm-Message-State: AOJu0YwqPe8vA6C+to7IoID5Ggb9IM6JjxAzfkVxE1SwTf+56Kq3aX0Q
	PNQ07+MwgDACwhRLD1/I00keE7UovDIvDvmewMLAgLl+VUI77WJOhHokdaw5fxtv9WebTUwFy9r
	jv8Czj6bk4N6l8Kt9c7rgudDAbvff6ePWB85NFTo=
X-Gm-Gg: Acq92OE92zrgSYThChwrT8i0xV0DpMSE0qx2omRAe02YRyS3fQ2AM93qxA0gne2mNCe
	oWfo+25e3cFCTNKjnMYNZh74TMYSwaQ8jUK+nyu09d7esE4EC4PiXIbv2sHDRPPJEzmRaLCbHN7
	FzQP8gDvJ5F6mTjM8bO5AO1lHbp3iI2Url8EoVhRzkjqOC89xF1qwGFsYpgzoO2iK+8UGF5P9Yi
	4hSeB0klUGAu6bYFozXlpiaVhgvgmZDmjVSFbS1d49O6pq5R2fNTqgmWj4mP7DM+Qm9c0aZxjeh
	kb5wQ2/H8amGp0VXIRLROuOmC5NgWpex2moFKJPoxRdUNdqFni4G23rHeXBYqTn6CT0Dws5IxHd
	OyeaykKhuGFG0ZgEQlOXnhANP4g==
X-Received: by 2002:a05:7300:f10a:b0:307:91f5:92e2 with SMTP id
 5a478bee46e88-3081ff4b659mr3902673eec.4.1781356797336; Sat, 13 Jun 2026
 06:19:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Hridesh MG <hridesh699@gmail.com>
Date: Sat, 13 Jun 2026 18:49:41 +0530
X-Gm-Features: AVVi8Cc08Ki-GtBqJSO6TCsiAyHiqSMoCCwo47CH0D0JPCXm5KyHC6qgcgJ0Tl8
Message-ID: <CALiyAo=RSmoWFH-zqMQWEWtU-qMeTP8YPkzPFCzNsGtFmtn_xQ@mail.gmail.com>
Subject: ALSA: hda/realtek: headphone jack mic not working on ASUS Zenbook 14
To: linux-sound@vger.kernel.org, Takashi Iwai <tiwai@suse.com>
Content-Type: text/plain; charset="UTF-8"

Hello! I recently bought a new laptop and the headphone jack does not
pick up microphone input on Linux. The following patch seems to fix
it:

#/lib/firmware/alc-sound-patch.fw
[codec]
0x10ec0294 0x10431194 0

[pincfg]
0x19 0x04A11050

Could someone make a kernel patch to load this by default? I currently
lack the setup to create the patch myself. Please let me know if any
additional information is required,

Some debug logs:
~ -> lspci -nn | grep -i audio
63:00.1 Audio device [0403]: Advanced Micro Devices, Inc. [AMD/ATI]
Radeon High Definition Audio Controller [Rembrandt/Strix] [1002:1640]
63:00.5 Multimedia controller [0480]: Advanced Micro Devices, Inc.
[AMD] Audio Coprocessor [1022:15e2] (rev 71)
63:00.6 Audio device [0403]: Advanced Micro Devices, Inc. [AMD] Family
17h/19h/1ah HD Audio Controller [1022:15e3]
~ -> sudo dmesg | grep snd
[sudo] password for hridesh:
[    1.739094] snd_acp_pci 0000:63:00.5: enabling device (0000 -> 0002)
[    1.742696] snd_hda_intel 0000:63:00.1: enabling device (0000 -> 0002)
[    1.742737] snd_hda_intel 0000:63:00.1: Handle vga_switcheroo audio client
[    1.743028] snd_hda_intel 0000:63:00.6: enabling device (0000 -> 0002)
[    1.743084] snd_hda_intel 0000:63:00.6: Applying patch firmware
'alc-sound-patch.fw'
[    2.386282] snd_hda_codec_realtek hdaudioC1D0: bound
i2c-CSC3551:00-cs35l41-hda.0 (ops cs35l41_hda_comp_ops
[snd_hda_scodec_cs35l41])
[    2.938270] snd_hda_codec_realtek hdaudioC1D0: bound
i2c-CSC3551:00-cs35l41-hda.1 (ops cs35l41_hda_comp_ops
[snd_hda_scodec_cs35l41])
[    2.938700] snd_hda_codec_realtek hdaudioC1D0: autoconfig for
ALC294: line_outs=1 (0x17/0x0/0x0/0x0/0x0) type:speaker
[    2.938704] snd_hda_codec_realtek hdaudioC1D0:    speaker_outs=0
(0x0/0x0/0x0/0x0/0x0)
[    2.938706] snd_hda_codec_realtek hdaudioC1D0:    hp_outs=1
(0x21/0x0/0x0/0x0/0x0)
[    2.938707] snd_hda_codec_realtek hdaudioC1D0:    mono: mono_out=0x0
[    2.938709] snd_hda_codec_realtek hdaudioC1D0:    inputs:
[    2.938710] snd_hda_codec_realtek hdaudioC1D0:      Internal Mic=0x12
[    2.938711] snd_hda_codec_realtek hdaudioC1D0:      Mic=0x19
[    3.097688] snd_hda_intel 0000:63:00.1: bound 0000:63:00.0 (ops
amdgpu_dm_audio_component_bind_ops [amdgpu])
[    4.599302] snd_hda_codec_hdmi hdaudioC0D0: HDMI: Unknown ELD version 0

RtHD Dump (with headphones plugged in):
PCI ID ==> PCI\VEN_1022&DEV_15E3&SUBSYS_11941043&REV_00\4&3247FA0A&0&0641
HDA ID ==> HDAUDIO\FUNC_01&VEN_10EC&DEV_0294&SUBSYS_10431194&REV_1000
<Realtek High Definition Audio>

< RtHDDump.exe file version V2.3.0.6 >
File version => 6.0.9761.1
File internal name=> RTKVHD64.sys 9761
<9761> <RTKVHD64.sys 9761>
Model index = 83

Wid=12  Codec=90A60130  Drv=90A60130  Loc=00000000
Wid=13  Codec=40000000  Drv=40000000  Loc=00000000
Wid=14  Codec=411111F0  Drv=411111F0  Loc=00000000
Wid=15  Codec=411111F0  Drv=411111F0  Loc=00000000
Wid=16  Codec=411111F0  Drv=411111F0  Loc=00000000
Wid=17  Codec=90170110  Drv=90170110  Loc=00000000
Wid=18  Codec=411111F0  Drv=411111F0  Loc=00020000
Wid=19  Codec=411111F0  Drv=04A11050  Loc=00080000
Wid=1A  Codec=411111F0  Drv=04A11C30  Loc=00080000
Wid=1B  Codec=411111F0  Drv=411111F0  Loc=00000000
Wid=1D  Codec=40663B05  Drv=40663B05  Loc=00000000
Wid=1E  Codec=411111F0  Drv=411111F0  Loc=00000700
Wid=1F  Codec=411111F0  Drv=411111F0  Loc=00000800
Wid=21  Codec=04211020  Drv=04211420  Loc=00000000

Codec Address = 0
Subsystem ID = 10431194
Revision ID = 00100004
