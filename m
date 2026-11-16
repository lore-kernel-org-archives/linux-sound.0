Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794849333;
	b=uviC1vbVa2HacARTAqN00TsYjcT2tG9hd8HrlRPQUaQsjP1hKjKS8LodySg/iFkeRbtG
	 mGpiumC/Bk4oS3u9doUhdOZGvvTYbMunHg3Ai8+JC5KkUcqDa1rFW2zgyoNI9nNAsYzse
	 z1YJ6QcBUfHdiJNkEzSe+nXzJUWFHHWJR5plzRnmCWEPZOkpfsw3Ob8MqFuc+G4uqUeLj
	 VfmJVyZgo1p70831/2dGemf/WlZaw0P+n8zEgMNGQBcWiEDY4iM0fiU2bHnpUW1jJBQfC
	 XRjvAH7be2+f0Z4mky1kqUX82I2A1ltZbDs8ool1uQDQzWD73wmPJdCTAgv9iJgTiRQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794849333;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=H1+6S+F6b4wcAgS3pKKVlvC61S2QAWOxHx3ukqxh8QU=;
	b=WqkzRq+vPRmAft1ICmRGWxMGLS41KmW/cLdEQZf39sWPjpRnWw3xwWtBlDOS2UsUphBF
	 A0F1u5F1z6za52uClWK8SnIXG1racBBJfkN+MG6B1TcH39rls1Cx5vN6EEHxO3nckWX/z
	 PfgvrM4hjiOXB9Qhi2HxRL3c8h+hLnV8Htbxxx6horT9VEUcYLdCHrGlw7aTrZqY9e/4C
	 Ps1yLdjJGBbzZ5to+qfBbg/oS/6baegkObC7OKseqT5H5MU6R7EiVuLS77T2UdY9BXOh9
	 m0YooFf+gPhk4EJjbMajbaAk7+RfWm+ZlCqxdU8vo4gH5tSIU/iGe1C54WtpsDD5XVg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vooEdU6W;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.173
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11430606A334
	for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 17:15:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11430606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vooEdU6W
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3ab3b29a298so38530791fa.3
        for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 09:15:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794849331; cv=none;
        d=google.com; s=arc-20260327;
        b=PI7m0Yb31YFG9VoyJ8Cq/jz/CEPcQcenCBmxoQQZVEZ2CWPNdZz1CJwQCezy0E3Y+9
         lPWd01ZddSmJX3OQy5mP8cPxAYkLDXmMnvJM4DZPmQMSizz6orwkqKOV+/aKnABg9kf6
         eEDWOwiAwuCRIY5cu+ZKvcagL47GyYYK0ND8b3vP8b7ox977Kqat9F/bYtar8sUVj6ZV
         A7EIEdELL4RtKHr8ptrF9vpWgsXo3VUfKb8DHl58+i/kEZ+SwuLfe+QCWhyAibeNYc5X
         X/e6ZwZGZsJXmDlHn4jqtSFNghjD8TTMxgG3GMiEuU1c9dEeIvmtEc9bQcBbP4mmwzZx
         hiJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=H1+6S+F6b4wcAgS3pKKVlvC61S2QAWOxHx3ukqxh8QU=;
        fh=S+sAPQrdnDGIYx6CZNeo4QUBEoxRz2PqhmE/12SkCy0=;
        b=X+muInIsW/sfIOi89zJf5Usap4WfqDFLxIk16kVzEFBm5Seiq7ZMhriwJtOMP7ty90
         FK19oOsGG4dTew4fVLYT09PjgQxYQDnCXfZcNp0jgDbj/xpuG/qaNrWLhuNIkN92q7u4
         a34h8p50E41RgBhAwq3w5IR/5p8wmRdP1gAshF3EfffzRVTPlMDJOLx2fn1TjRiiGu8y
         hbeQp0y8b1jHxluUuBr8oWnqjvvUtLk0TC/Mzfv3AGJTZXEYcxlc1iJUu+3g05UGh1s+
         /Ju0bFw5fLe2g47yV8bDo2l4wyiMwjhrrvHhylpRWUJgGnT/CNcRK9GN3h0I/6OdVJej
         oPOg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794849331; x=1795454131; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H1+6S+F6b4wcAgS3pKKVlvC61S2QAWOxHx3ukqxh8QU=;
        b=vooEdU6WVUm7FyJggxbL4SCiIdNOsPpJIUvKbnhvLDMgRceFlDTwmP307427zwlMih
         8kkNEjbVLMpzyocCtK3G7mBZVV9Cl18n0xbmonrF8iYXrmdS8yTHAfDF4O0gjRq38FMq
         AM8GVo40TS/c4KLz2q89vXsLpx9MpeSKsrMGH+ryXpLNYoHSyk//9iTGqg4bCX7ZUVRd
         WV67hW+V8yikFdH6oecjwSi8tIZK7+udaVXiuc8sEskOozQwuObbQ0pjhTH+dNruta/m
         +Ms7bU6KHMhOlC4WB+GegLnRijLHNMX9XtVRRKVvPiSnvcrmLnxpqk/Q44R1b+5V5Dh/
         fROA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794849331; x=1795454131;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=H1+6S+F6b4wcAgS3pKKVlvC61S2QAWOxHx3ukqxh8QU=;
        b=jEggRnmpg6h1P5IQS8YJD+eAbmvglhlgl8f1qVZ6QApAx+qFPJiSQj+Vjm4ypkBwup
         DeNBTMIuce5Z0+SQPW5Z/qVu7GkWMo39+AKwkHGN5bS4CqhAnfCU0N7pizHvSpq2byca
         nPjljNZxPMOE898p3/7imf4gcpcsMBr3AAkoRc3Uq8EivPBkv3IGL69MUtoEdLZLHSrY
         mMvAd7S6sLUMWtImrhV9Imjnt10XpGpweCCL83CJaIII7kpmxbCCL4r0fkRBvRU2Iq5j
         A8tWbJjed5FhrtIlLZjZ8lN26t/psR4TXwuPiyzla3pLolJsXl7298fipnZlbdNCjb+/
         7dFA==
X-Forwarded-Encrypted: i=1; AL+hErHro6CghRWuFeo3p5HpcAqKo04y/SwJl0/buVvQSekoE+fzIyO+KCEnXnuhe7DI0ohsHMn55hdpQMADJA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+Rl7dn1g2lpCWsCebz09PcJthjubFD/VWlgSA6GSflCqrt2J8H
	RVx5gK911swVtuhVduyIIRQ2NGpe9d54g6wCDx2bkB2PyING9AH528lE1xAuynFAmBsWoG+5YCF
	KIq2G4TRfratYea2r5xW/79j3HRCGucE=
X-Gm-Gg: AYBFou0SxzQxIdkTsVik6zRpFuoUMBXzfRh1QD33EYAN5rnt9I9bcrCuUI+JDEIcygd
	ZR0hJOkwcH41xL7u1W11OBLG1KmQLLuNI/IDh50Dlr6v9EQCzg3ICUmWP3GcpSwHTIJE8xyNuuN
	YAAVeaWUx9hhT1iCm4IOzNuHfcCcAfeNh0/K4nSS3nxDOMqVrZJkUhQwhV+S1B5onch3P2CV3Tm
	+fV/VshI6dtOxL7ghZSVp7YZwpsFA6t253eJFa4FmPYq95ODBoGYLoAmiCFMbjDquESs7npp3L3
	c0aXxo5C5uhtLXFDD/f61Bmc/5owDno1HRpOsMvKIxZ2hxJ0vtavrLlJ0T0rsaLlHiyLc752+S0
	TjBrAt3awM7vzcGvJQLsu0+KanR/APAE8DjVSs9HHAUtVUOnrEddkKuFNv4oB6n/Hi0NS+/xLdD
	gr3/K0zBpaNEXLxpKaZf/B9eXHxnvVIaKbq4q1dK971/s3ey8wrhfvAHZe2bQ+STnqaiRl5XyxU
	+o=
X-Received: by 2002:a05:651c:a18c:b0:3a9:7f37:9bbc with SMTP id
 38308e7fff4ca-3ae2b5584efmr33988531fa.11.1794849330985; Mon, 16 Nov 2026
 09:15:30 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Moulishwar Subramaniyane <moulishwarvs@gmail.com>
Date: Mon, 16 Nov 2026 22:45:19 +0530
X-Gm-Features: AclHuK_1n1pIKlVU0HwlTnu0O8UpW4hFFDaT1H_8N0C9G9bthk6Y3WxQ-3Rxy9M
Message-ID: <CAC8q6gFYePnThsMEBRamt=ae-g_hTD5iNUopjup5_5goR-G8Mg@mail.gmail.com>
Subject: ASoC: amd: ASUS Zenbook S16 UM5606WA (ACP 7.0): internal DMIC not
 enumerated (_WOV=0), and PDM capture returns constant 0x80000000 when forced
To: Vijendar.Mukunda@amd.com
Cc: venkataprasad.potturu@amd.com, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

(Resending: my first attempt had broken formatting and was rejected by
the list. Sorry to Vijendar and Venkata for the duplicate.)

The internal microphone on the ASUS Zenbook S 16 UM5606WA does not
work on Linux. It works on Windows on the same machine, so the
hardware is fine.
Below is what I found and what I tried.

System
------
- DMI: ASUSTeK COMPUTER INC. ASUS Zenbook S 16
UM5606WA_UM5606WA/UM5606WA, BIOS UM5606WA.321 10/14/2025
- ACP: PCI c4:00.5 [1022:15e2] rev 0x70, subsystem 1043:1df3
- HDA: c4:00.6 [1022:15e3], Realtek ALC294 (SSID 1043:1df3, fixup
ALC294_FIXUP_BASS_SPEAKER_15), 4x CS35L56 on I2C. Speakers and
headphone playback work.
- Kernel 7.2.8 (Arch-based distro), alsa-ucm-conf 1.2.16.1, pipewire 1.6.9

1. Stock behaviour
------------------
The BIOS SSDT "OEMACP" (rev 1) under \_SB.PCI0.GPPA.ACP has:

    Name (WOVS, 0x00)
    Method (_WOV, 0, NotSerialized) { Return (WOVS) }
    _DSD: "acp-audio-zsc-enable" = 1, "acp-audio-config-flag" = 0x10
    Device (HDA0) { _ADR 1, device-type 1, two render endpoints
                    (speaker, headphone) }
    Device (PDMC) { Name (_ADR, 0x02) }      <- no _DSD at all
    Device (I2SC) { _ADR 3 }
    Device (BTSC) { _ADR 4, device-type 4, BT endpoints }

flag 0x10 = FLAG_AMD_LEGACY_ONLY_DMIC, so snd_acp_pci binds. Because
_WOV returns 0, check_acp_config() sets is_pdm_dev = false, so
acp_machine_select() skips "acp-pdm-mach" and falls back to the acp70
ACPI machine table (AMDI0029 only), which gives:

platform acp_asoc_acp70.0: warning: No matching ASoC machine driver found

No DMIC card is created. The ALC294 "Internal Mic" pins 0x12/0x13
(BIOS pin default 0x90a60150 / 0x90a60140, Fixed, Int, Digital) are
exposed instead. Capture on them (ADC 0x07 -> sel 0x24 -> pin 0x12,
unmuted, max gain) is all zeros.

This looks like the same _WOV=0 firmware pattern as the ThinkPad P14s
Gen 6 AMD patch ("ASoC: amd: fix DMIC detection on Lenovo ThinkPad
P14s Gen 6 AMD", Sep 2026).

2. With an ACPI table override (initrd), WOVS = 1
-------------------------------------------------
snd_acp_pci now registers acp-pdm-mach, and card "acp-pdm-mach" /
"DMIC capture dmic-hifi-0" appears. But capture from hw:acppdmmach
(S32_LE, 2ch, 48 kHz) returns 0x80000000 for ~99.98% of samples (a few
0x7fffffff and random values), whatever the room sound. That looks
like an all-zero PDM bitstream.

3. With override WOVS = 1, config-flag = 0, PDMC _DSD device-type = 2
---------------------------------------------------------------------
snd_pci_ps binds instead (as with the ThinkPad quirk). Card "acp63" /
"DMIC capture dmic-hifi-0" is created, and PipeWire/UCM show it as
"Digital Microphone". Capture result is identical: a constant -32768
(S16) / 0x80000000 (S32).

So both the legacy and the PS driver set up the PDM path, but no data
comes from the DMIC. Possibly the DMIC needs a power/enable GPIO or a
different PDM clock/pin setup on this board. I found nothing related
in the DSDT/SSDTs (only standard _PS0/_PS3 and power resources under
ACP). ACP_PIN_CONFIG passed is_pdm_config in both drivers, but I could
not read its exact value.

Questions
---------
- Is the UM5606WA internal mic expected to be on ACP PDM, or on the
ALC294 DMIC pins?
- Is there board-specific DMIC power or clock setup (GPIO,
ACP_WOV_CLK_CTRL, PDM controller selection) that Windows does and
Linux doesn't?

I can test patches and provide acpidump, alsa-info, register dumps or
anything else that helps.

Best Regards,
Moulishwar VS
