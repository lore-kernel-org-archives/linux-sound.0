Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794762253;
	b=n7G7G/FV+AW5MKW4tz4yPaQO9Yx2/mVX2PYBegRQAmNpnriy/0FU0RUmCLqVsEzrbd3x
	 kHP2ROrUHnsQ90m/pUfaTewau1+0spmtTPkPdSHSNyyMySdOwpiSrsk9VcheHNfKp5CyJ
	 YFDfKyM7iCQzD94RXtuFieihf7fiYQp8zdoT77DbSLdjpa0Z5a91Q1v9Q1dfLKIGVx5/T
	 /QwTDChc/qk7cjiosz99WhA+nO3UVQxryI5IWCJb5GnPE4FLMI/o7pB7EPuNLceYiQTzB
	 okUCi6NYSysMOcB+8zdEtindiKJtmQTNnEfvb38fWYLqjhbWyZeadiv9fSYB2IAgRlw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794762253;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=xs47ZMUnv7qJrf341MTMqq2ia87fUm65gwB0tBN5bf0=;
	b=xessY2iYwN1oo6aJ5Pp+rGAq80rHwfUyDF01kv9m8drBqw7/XKFZ3bSeaBoBTUXlNFsf
	 cX9HoOZK4dcpjJ0MhK3fT13PwCF15sLLqjLbRMB1NaQ8vSsU5ZR9h/KNh3XnRyI6ElsvP
	 bFpVfUewiGoYV9SA426w7od9CCBcc4ZKBIUuXQXtTMmTaNMcFUMhBiFv4TNvx71J3JB53
	 pr09E1uDLmtXCnJDnHvl85OTfBeSWbd3U4/uYtYhbP+cozl2f40mBKG485BqkdKCwvU4v
	 v5PMCgOSDljH2k3tFOb5C8H5GLuKN2qmdC0uVr5sU6e1MEm27h1Lpau8vnzVehXzpoA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MSDobsxg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7398606A31E
	for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 17:04:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7398606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MSDobsxg
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-53639b8903bso46921811cf.0
        for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 09:04:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794762251; cv=none;
        d=google.com; s=arc-20260327;
        b=QzpYqz+B65NASTKr/NeFrwsR0IQKO6OvxD2JADxXfsM1vD/0AKcLcH1FXDRfahXb7i
         ZFGwOVIq31GjiE7Z33eoFRfHv4KghB01VwluRGLd4TN9zZrSxafF76mjNsYNxKCccKsV
         pP9QRDwY0DrbLxsiDi6NAQ3vSYaBHidk7lsuXwAAcx+5wjjW1FXe+ruADXi/O1Kw0+Dm
         IvcNubHdl8y28KJSo1ypbHPpKOJxPNF69zeLHTCdEJhe12WOURfcfVksOQJTIvIUUa0M
         RVIf0I2vxC1rqRndxejOh9bxh0GMOJrZCGXFpndlqxpcnU1lniKwuazRPyU4I6U62Xx0
         qh9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xs47ZMUnv7qJrf341MTMqq2ia87fUm65gwB0tBN5bf0=;
        fh=as0RKDD+fiaXY4YDNdBk6vOP3zUZaQ8btkrhg7iUBLs=;
        b=MNWoz/aDBZvD8mwoQK4QuNFPAooSqeNGttQcWGr+L2/ROpjRtGDfMxhWgzxNtOjbie
         j45k3TfdAwUl0Q9LBhGriJibuXJeTfbVlvPD8YDDeaIFeJ5ismbfCK8QUNbDMrjA34rg
         mAM5Zup17mICr+kOpYh74kiinNzU3ZGqLvSedFCi6JA+jHAZduAnZF8FjP914XHz1J5l
         VIAhS6Akz9ZAH7OgLEcoxzrhyooo3Wz2xgj1mg/7flb9bob5CChSe0yCXJ6tRSFv+UXP
         GrFNaJanHVn74dz0Fhqe3wHywbJ3zPpVL9FTE11JIQzXdfZZpeMGgdJUQer6OSQCt1DQ
         4Prg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794762251; x=1795367051; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xs47ZMUnv7qJrf341MTMqq2ia87fUm65gwB0tBN5bf0=;
        b=MSDobsxg65PyK3+au3CQTh7tCgnqrtVmPT02dXnYOI/V8858elHDNsCxPfRq47z6B5
         SyrL7tJ8yC2k43P877i3sRb+vHoAHLMDoyaBDsdlnZIDPGR7Qoh/3QkDAtR4vr2JZPEO
         FYnGcsfBIltha88vPpzrbldlW52ieFSo6Mr+DkHehQLpPa7HP6WTt6vsnpF/iOJ4JuAW
         FrhhuKWRsGSnDyoEUOXEc/8OIo2iYJp+NISrqFKV/j4F0j9Myi+XkV0GqDTi5ySjcJGE
         VWVMSQaL78TMJpPiPPO1JIBNfsJaPJ4YAs3iSq6AgT7EXF7EK8Ux1DRhqOkFIqDrK4hC
         0Gyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794762251; x=1795367051;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xs47ZMUnv7qJrf341MTMqq2ia87fUm65gwB0tBN5bf0=;
        b=atO5Or8EW3YQGhXoPgOdEUwg31dLnlDqMeob96IA8tiincAmb21xPxZ33TuHOU6fRZ
         /Dxx/ncxKCqb/SlYJXoEhQqqVdPtBOr1UH0i/3QN966yK8k0bFjjrm+OfwaDlYtzCpGY
         BkpaUsvL7GkjyuJRn6qwbBYBzMw0D2eujoD+jJGbeWBGH71biHso1OPzxS5Yrr3MCun2
         ifGJ2a4mQOvkhPmJU9vxw1/qh8ON2u2t11A/xZygah9MYXcv+NjGNmFtnX7nX3YAimqH
         vWaltPap7+n8brfuDcuAzIDz8+AKdo1C/6MgqdNyrV+wV4fLg5gcOgQvoNbonJVZtK1N
         3R1g==
X-Gm-Message-State: APuU4Z+KCiLHr3SkKV3oDxlV3stYYWYa+I3cOlrpA+RSAjbLfA5PPaYY
	q9puJnq9a+BkMuYwWZYu4xnoSSbD+LyJgl+71ki+IxlGoVJVctRicj3X3WhRv1gl9XR0F77iyhx
	OcDW25EiYywFY1q0s24cObAZSabNUBPC4mJlg
X-Gm-Gg: AYBFou3uOQHwLrLWf62RrqcW6lrLlVqnIp4gEX+h4pefjLLc8Gp5TKuodtYcS197p+i
	V9JoLwf9VBRPrb0WntPCNpxIgDn5TDtweyjoKmidwnOi4qwbLDVn0vAmvnx7zmAPNBo4ue9P7Gb
	rgBIHA2ZzJzzbuhKeLSDEvvDFqPs00ReBUOlCK0QjrWidtrGUGeMjYXipEggV3B2DM3aALhaod9
	QFj4v84KApry/PUKml1pzobPt18q0RXIr4XAVKklXZnpSB4SzZLgbm8/LfF4yl4T50ayIyUWp3E
	g73HVbYkCeGnuoy7uFGwzQhCcGBrpoNiWL6JU7jbzR1VtzGUwXfpniXpRC3B4wR2rwT8qfECSEP
	q2Brb0MRbXX6ArCXpGJDUs9tllJeYJIt1jC5dFjpSzBymOF0U65FgH9bVl4j2bcvqxd3rtAG0tv
	hSxKiTTwS8WpqNT3VcXZ57X41P36QokaLZf5EkppTiij8Xib4cuxpXuUywz5AlBziPnYRpbiW/J
	RPWdwC9JzmpS8G31iUNOYfjgXq7cVE6tMXg
X-Received: by 2002:a05:622a:4b0a:b0:51c:b98c:f772 with SMTP id
 d75a77b69052e-55ac7064dcemr116895271cf.15.1794762251218; Sun, 15 Nov 2026
 09:04:11 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CACqGD_ebj5hUU2uFJO-aHjeftG_3-dEH1beQj0B7=qqdpWKnSw@mail.gmail.com>
In-Reply-To: <CACqGD_ebj5hUU2uFJO-aHjeftG_3-dEH1beQj0B7=qqdpWKnSw@mail.gmail.com>
From: Kresimir Pendic <kresimir.pendic@gmail.com>
Date: Sun, 15 Nov 2026 18:03:59 +0100
X-Gm-Features: AclHuK_Yk_aJE7TQV7fcB1hJtna-tEGLPUDcNaAPpxE-Bw61yt6GJduZmBV7WBc
Message-ID: <CACqGD_d5BCpzLPtnPPkraW+_WBVZbt9+1fiDrcJhCcqaQ5b6aw@mail.gmail.com>
Subject: Re: [RESEND][BUG] ALSA: hda/conexant: SN6140 internal speakers silent
 on ThinkPad E14 Gen 8 (17aa:513e), codec beep also silent
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com, perex@perex.cz
Content-Type: text/plain; charset="UTF-8"

Hi,

Follow-up: this is fixed by the Lenovo firmware update, no kernel change
needed. Sorry for the noise.

After flashing System Firmware 1.11 (BIOS R3AET32W, EC R3AHT32W,
Lenovo package r35uj32wd, released 2026-07-16) the internal speakers
work on the same kernel (Pop!_OS 7.2.15, snd_hda_intel, generic
17aa:0000 fixup as before).

The thinkpad_acpi ECRD / AE_TYPE errors are gone with the new firmware
as well; the driver now reads the EC normally ("mute: off", secondary
fan control detected).

Lenovo's changelog for 1.11 only mentions a WLAN fix, so for anyone
else with an E14 Gen 8 / E16 Gen 4 (BIOS R3AET28W / R35ET28W 1.02) and
silent SN6140 speakers: update to 1.11 first.

Thanks,
Kresimir


On Sun, 15 Nov 2026 at 17:10, Kresimir Pendic <kresimir.pendic@gmail.com> wrote:
>
> (Resending as plain text - the first copy was rejected by the list because
> it contained an HTML part. Sorry for the duplicate, Takashi and Jaroslav.)
>
> Hi,
>
> The internal speakers on a Lenovo ThinkPad E14 Gen 8 (Intel, Panther Lake)
> are completely silent under Linux. The whole ALSA/HDA path to the speaker
> pin looks correct and the PCM runs, but nothing comes out of the speakers.
> Even the codec's internal beep generator is inaudible. The UEFI/BIOS setup
> beep IS audible through the speakers, so the hardware works.
>
> This looks like the same problem Adrien D reported for the ThinkPad E16 Gen 4
> ("ThinkPad E16 Gen 4 21YC: internal speakers silent with Conexant SN6140",
> linux-sound, 2026-08-23). Both machines use the same BIOS family
> (R3AET28W 1.02) and the same PCI SSID 17aa:513e. I suspect a missing
> board-specific SN6140 init (amp enable / vendor COEF) that the BIOS performs
> at POST but that is lost once the Linux driver resets the codec.
>
> Hardware
> --------
> Machine: Lenovo ThinkPad E14 Gen 8, type 21Y6 (21Y6000SGE)
> BIOS / EC: R3AET28W (1.02), 2026-03-13 / EC R3AHT28W
> (BIOS 1.11 exists; its changelog only lists a WLAN fix, not tested yet)
> Controller: Intel 8086:e428 (Panther Lake), subsystem 17aa:513e
> Codec: Conexant/Senary SN6140, Vendor Id 0x14f11f87,
> Subsystem Id 0x17aa513e, Revision Id 0x100100
> HDMI codec: Intel Panther Lake HDMI
> NHLT: no DMICs, BT on SSP2
>
> Software tested
> ---------------
> 1) Pop!_OS 24.04, kernel 7.2.15 (System76 build), SOF driver
> (sof-audio-pci-intel-ptl, FW 2.14.1.1, topology sof-hda-generic.tplg),
> PipeWire 1.6.8 / WirePlumber 0.5.12 -> speakers silent
> 2) Fedora 45 Workstation Live, kernel 7.2.11-300.fc45, legacy snd_hda_intel
> (no SOF) -> speakers silent
>
> So the problem does not depend on the SOF vs. legacy HDA path or on the
> distribution.
>
> Relevant kernel log (identical on both systems)
> -----------------------------------------------
> snd_hda_codec_conexant ...: SN6140: BIOS auto-probing.
> snd_hda_codec_conexant ...: SN6140: picked fixup for PCI SSID 17aa:0000
> snd_hda_codec_conexant ...: autoconfig for SN6140: line_outs=1
> (0x17/0x0/0x0/0x0/0x0) type:speaker
> snd_hda_codec_conexant ...: hp_outs=1 (0x16/0x0/0x0/0x0/0x0)
> snd_hda_codec_conexant ...: inputs: Mic=0x19 Internal Mic=0x1a
>
> i.e. only the generic Lenovo vendor fixup (17aa:0000) is applied; there is
> no model-specific entry for 17aa:513e.
>
> What I verified during playback (speaker-test / pw-play)
> --------------------------------------------------------
> - PCM status RUNNING, hw_ptr advancing; no xruns or errors.
> - Pin 0x17: Pin Default 0x91170110 [Fixed] Speaker at Int Rear,
> Pin-ctls 0x40 (OUT), EAPD 0x2, power D0, connected to DAC 0x11.
> - DAC 0x11: Amp-Out vals [0x40 0x40] (unmuted), Converter stream=1, power D0.
> - ALSA mixer: Master/Speaker on and near max; Auto-Mute disabled.
> - Codec pins: the only analog output pins are 0x16 (HP) and 0x17 (Speaker),
> so a wrong BIOS pin config pointing at another pin can be ruled out.
>
> Experiments (all with hda-verb on hwC0D0)
> -----------------------------------------
> 1) Codec beep generator, bypassing the HDA link / DSP:
> hda-verb /dev/snd/hwC0D0 0x12 SET_AMP_GAIN_MUTE 0xb007
> hda-verb /dev/snd/hwC0D0 0x12 0x70a 0x20|0x40|0x80
> -> silent.
> 2) Codec GPIOs (io=5) with a continuous 440 Hz tone playing:
> SET_GPIO_MASK 0x1f, SET_GPIO_DIRECTION 0x1f,
> SET_GPIO_DATA 0x00..0x1f (3 s each)
> -> silent for every combination.
> 3) EAPD / pin-ctl re-writes on 0x16/0x17, power_save=0,
> model=thinkpad (snd-hda-intel) -> no change.
> 4) ThinkPad EC hardware mute: the EC register space is memory mapped
> (ECOR, SystemMemory 0xFE0B0A00). Byte 0x30 (MMUT bit0 / HMUT bit6)
> reads 0x00, so the EC audio mute is NOT engaged.
> 5) No external smart amp: no TIAS/CSC/AWDZ/etc. ACPI devices, no audio
> I2C/SPI devices; the ACPI tables have nothing amp-related under HDAS.
>
> Since the codec's own beep is silent too, but the BIOS beep works, the
> speaker amp inside the SN6140 seems to stay disabled after the driver
> initialises the codec.
>
> Side issue (thinkpad_acpi, probably for platform-driver-x86)
> ------------------------------------------------------------
> On this BIOS, thinkpad_acpi fails every EC access:
>
> ACPI Error: Aborting method \_SB.PC00.LPCB.EC.ECRD due to previous
> error (AE_TYPE)
> thinkpad_acpi: acpi_evalf((null), dd, ...) failed: AE_TYPE
> thinkpad_acpi: Thinkpad ACPI EC unable to access EC version
> thinkpad_acpi: Failed to unmute the HW mute switch
> thinkpad_acpi: ThinkPad ACPI EC access misbehaving, fan status and
> control unavailable
>
> In the DSDT, \_SB.PC00.LPCB.EC.ECRD takes a field reference (the firmware
> itself calls it as ECRD (RefOf (OHDL))), but thinkpad_acpi passes an integer
> EC offset. Because the HMUT bit reads 0, this does not cause the silent
> speakers, but it does break fan/thermal/mute access on this machine.
>
> Attachments
> -----------
> alsa-info-pop.txt alsa-info.sh output (Pop!_OS, SOF)
> codec0-pop.txt /proc/asound/card0/codec#0 (Pop!_OS)
> dmesg-audio-pop.txt audio/thinkpad_acpi kernel messages (Pop!_OS)
> fedora-audio.txt kernel log, amixer, wpctl and codec dump (Fedora 45 live)
>
> I'm happy to test patches, dump more registers or run any hda-verb or COEF
> sequence you suggest.
>
> Thanks,
> Kresimir



-- 
mk#design, web-crafting agency - Naljeskoviceva 5, 10000 Zagreb, Croatia
Web MK: mk-dizajn.hr | e: hi@mk-dizajn.hr
Web: udahni.com | e: hi@udahni.com
in: https://www.linkedin.com/in/mkdizajn/
secure your email
*****
Please consider your environmental responsibility: Before printing
this e-mail or any other document, ask yourself whether you need a
hard copy.
