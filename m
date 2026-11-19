Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795114527;
	b=fcBW/PChv1sgMB3ep6jn39ShcryqNPHHYO0pB4LeCIeQIX9P10AgwZuCMK+K/IOF4bH8
	 F/cuaWAqjlPSuwfZdyim8lLbggeanWtKCFW8KTr0+JBu9dYqdiUo/EfKU/RfTVuxf6oqJ
	 GOfFeHQuyQ7OPc5A6Li8G1pv4XLAieQNbSjgEpSAjxoHUZE5qaAYRr9x++JewKA3BjgoU
	 4Ck3Ouy9GYODipheL9z6ofrWwaaHwc+LWY57fS63kJhLNz4SdaxppEqB1NX/OUYbahnwX
	 Y+jfj7S23qLh8/JCocX9JYzNm32f7O45nZMcg59CNfcMypTqIM2uD4lyYvg4Jb48HDw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795114527;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=18dkL9gZCGN5BAKYIieEBPQoeZonkjM1+SkmcFZ5FxE=;
	b=myYbOYUV//PlFyI5gLPuNKpgMTVnQBoc5Og0zsgFZMpzwWjF4mlxp9Rep3Nma9j3WLFA
	 Aw57sUmZCQFZ7v38hDxv5t/KWjUiJY2EVVuFpp/Z/tqNLs/msQZq6sM1sHcxLRWUtLVdF
	 Bc/pSRlHWCD6FvYDu8t842Vxk179/NJwHFX2R7TLhLkbFuGgaFkNw8TWuXMpw6ao2MI/s
	 yakHMi8iYHBvoEh9Bu2j9d1GC+XOxGTumhCfmueMzE8ITktDVIIV8Qe54RRE9ehxuV3gA
	 /qH3UDIVe2uDAycei9YOD+ezuqh52r+F0LlFC5P9vyocidOBCYYzoOsIZzwfHf91MYg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dIWg8E5V;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F96C606A334
	for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 18:55:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F96C606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dIWg8E5V
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b894d9a075so62314a12.2
        for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 10:55:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795114525; cv=none;
        d=google.com; s=arc-20260327;
        b=j1hGaBzyAKvSiJs6bCdyJ3s63NT85fZ3k5Mv9bJqznorlj18hjbeO9EbZ0j0cYrGyq
         f1aeU7ofIrf80MNjt6gEezSwWiE0+S4IbI+YT7KjM9XMXsZlBeNMW9naMCeyzCzzVusl
         qayHs4UDp+XdB0s3gMbN217gbw9e4MR+j4lQfVnzS1FwJ9vdvWE3QjHA8y2P/0w5VgNf
         7TrKfixgugb3M4ptozqXepmE3aA33cEYEmMRXjgwVPfQKCHXxHob18Ve2m1DQnlG6DeE
         O/kbi+8F25QWVSVrnDlMdQJF0pCCaFc8GZKZ8tpCujqyeoNEIziwYDKSbbtQvMZX2dQE
         0RLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=18dkL9gZCGN5BAKYIieEBPQoeZonkjM1+SkmcFZ5FxE=;
        fh=sbpBceD6Tcm5G0dweR//ZhDk/O30R47QgxHg2l51zBQ=;
        b=Td2++cu4Q7yJpGTv7lGqyJnkhcfv+V5dkCWePAUScWsw7uL56FdKgrYBf52dQGOHy9
         UZcBunGWV51OV+efsj/WGBhsGPb4D0E96aKOaZrMPDRnTqK3HSi0TsKjsf1q58MiYr0G
         oOUTOoYztYHhZgIQXqCNDkSW05w88yfS/0yUezp/nKU4aC/xZ1MqG3lk166LeQrF7tCW
         kQwQmUU2MBcLCF2SZLZp6JJOVAiXWMWfmhiz/IXHJlMGqFD41VLzbjGQXwCq4NyTM1bx
         TkjGzmk+gkgAGIi/0tX4455gOWGSC5YodUlI8SdQJANpbQ26+NwPlpiHTjxZwx2OdR+6
         Tq4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795114525; x=1795719325; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=18dkL9gZCGN5BAKYIieEBPQoeZonkjM1+SkmcFZ5FxE=;
        b=dIWg8E5VXIIhtE7RXXYzc73NNiZgGlMOlcpy3MTkPmuUVKcuFsYIWW9xGFCfS2XJ0F
         RIWBufPIAZPMUwO9Rg31DEyZOLKhNPjkDaGPuCbFSlpoNYGIm9fA4FaWImPvkuU0+k9x
         zlH/DbhyxCNuUHpKoOJYYyirbEiMuy4AbaX+zilSOJYT2ElS9AY3oU1I68iQgFh/60LZ
         zXKef4JGo+g7P/TUVSOnC5cDxrOerz/rkniY/yDaU2sYsPwXUb6s68VDqfq1XCRzPHl0
         xjdEwiQYAjMmYF6IMpS+6NW9i5KNU93IpJhBDcTyyf7zzt84pcvqAYzP2Z3YqW0Rey8G
         eWiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795114525; x=1795719325;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=18dkL9gZCGN5BAKYIieEBPQoeZonkjM1+SkmcFZ5FxE=;
        b=ww2rTE/kWCG6M3XDHRb2Ur6T3yprQSts446kdMFTep7501vTuyTTNWoJymDGpTYKBZ
         c/D43GaVbhSfH+kXRhH9AvWN2fhmDFtSQq3tkMcP5Gwdv5udppEfpsn9EoYI+vrT6sPM
         QMZyaCfoJ6p0Xuau1OgcUWV3Cjrnj6s2lpuILoTCjbS+rTsrLR6IWAFWDdtWLW/4GQFT
         nMAZIQppc0RLGQp8hiLL+e+Cmi/LnTFxzO4td/wwKHcLDhTONgvp8TqdX83rvOBwt2xk
         eRVx0A6MEdYaEielRKWqdWsC0F1u4B61zZFsLEqbLzaW8egiUmEZBND7HmHpgzMOAN2i
         6wmg==
X-Gm-Message-State: APuU4Z84HcP9hgGMaiiJUuw4W1hnBlAxB98FbJ4BsuZXlLBKGPdUTzoi
	ZwqvMZl2HoCHFzs5ijOvXMlFMaupaCeqSBjrltwAvv1X0Z5eKCTwVRxHnh2/s3VnzOCLlopb/Rt
	8L8gL2JsOCHAsuSyaXSqECDfczHPKOlHJx2pLQXI=
X-Gm-Gg: AYBFou3HvA1gbuefQ4jER8K58YJwpfNV3j0LJpWyagu1nMa8nEfV7TC533tZNKrR1kb
	1IANONnCs5u9eXG08ylkuGpxUe8xBMYH6x37pIRu0KD0I551FKRHIqMYACCGwq3FpbpMp9KPlZR
	kI+dxvXcybp9Mm4OCH1IJn/rbp7Lobd8Y+VtyrSBlFw6dCmglaIcpnvlRT8nfE0pazQgFwbEJcC
	NxMMsVqkEStxjsUT04GD8IOTgbWLSSZ4eqJIn29Tegk+/+1vJhuqTVd+grvNtyUOi50J//RuTdT
	e6+kolaA2+0z9Vh3T79pWx0GPY//yOsyiJzSO4TrLN5uOLQIVTlukaWX2m0+EfVdI6nr/+W4tDw
	urU4VuIW0k/ID7UqYXoFPaPB7MZJ4sVwZQ903hqFsct6zIYRYqaqjwHaDwpG7Rjecd5OFMDaPf0
	S248QWfqIX7Iy/9Gt1tN2ycDGYsOG5/fmrfhKI4mHs0m+RZLtwFt20+0rgIf0nEUMMRo+4g/ogv
	x7KxA==
X-Received: by 2002:a05:6402:1e90:b0:6b6:8ed8:765a with SMTP id
 4fb4d7f45d1cf-6ba37eb79cdmr295437a12.38.1795114525326; Thu, 19 Nov 2026
 10:55:25 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Asim Moideen <asimmoideenkm7@gmail.com>
Date: Fri, 20 Nov 2026 00:25:11 +0530
X-Gm-Features: Aa3M54qfGE2EUcVP3Zwg3DnFoXf94jiHm25V0PSfWdO9k38sKtrLY-ie95dnGN0
Message-ID: <CACqwDj7EckvxvOEXgmPap0+h5W-muRwa-j=wS3FOFZTuqX=bOw@mail.gmail.com>
Subject: Subject: [HDAudio][ALC295] No internal speaker output on Acer
 TravelMate P614-51-G2 (SSID 1025:141e)
To: linux-sound@vger.kernel.org
Cc: "Cc: Kailang Yang" <kailang@realtek.com>, Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"

Hello,

The internal speakers on an Acer TravelMate P614-51-G2 produce no sound
under Linux. They work in Windows on the same machine (dual boot), so the
hardware is fine. I have not yet tested wired headphones or HDMI audio.

Hardware
  Laptop:      Acer TravelMate P614-51-G2, BIOS V1.23
  Controller:  Intel Comet Lake PCH-LP cAVS [8086:02c8], subsystem 1025:141e
  Codec:       Realtek ALC295, vendor 0x10ec0295, subsystem 0x1025141e
  Kernel:      7.0.0-43-generic (Ubuntu), snd_hda_intel (snd_intel_dspcfg
               dsp_driver=1)
  alsa-info:   attached

BIOS pin configuration
  0x17 = 0x90170110  internal speaker (pin has no EAPD capability)
  0x21 = 0x04211020  headphone
  0x14, 0x16, 0x1b, 0x1e = 0x411111f0  not connected

What I have tried (all silent on the speakers)
  - The default configuration. dmesg shows "ALC295: picked fixup  for
    PCI SSID 1025:0000", and this kernel's ALC269 quirk table has no
    entry for 1025:141e. The Speaker control is unmuted at 0 dB, the
    Headphone Jack control reads "off", and Auto-Mute Mode is Disabled.
  - Retasking pins through user_pin_configs and reconfig, with
    power_save=0, PipeWire stopped and playback to plughw:0,0. One layout
    at a time: 0x14 alone; 0x14 + 0x17; 0x14 + 0x16 + 0x1b (with 0x17
    disabled and with 0x17 left as the BIOS speaker); 0x16 alone; 0x1b
    alone; 0x1e alone. For each layout I also set EAPD on 0x14 and 0x1b
    and drove GPIO0-2 high with hda-verb.
  - The model= fixups below, applied with modelname and reconfig:
    alc295-disable-dac3, alc255-acer, alc255-acer-headphone-and-mic,
    aspire-e1-coef, predator-spk, lenovo-eapd, alc233-eapd, noshutup,
    alc285-hp-amp-init, alc245-hp-x360-amp, alc295-hp-x360,
    alc295-hp-omen, alc287-ideapad-bass-spk-amp, alc285-speaker2-to-dac1,
    alc298-samsung-amp (and the -v2-2-amps / -v2-4-amps variants),
    hp-gpio4, alc225-dell1, and about 20 others.
  - A full cold boot with Windows Fast Startup disabled.

Windows driver details
  - The Acer Realtek driver (HDXSSTACERNB.inf) binds to
    INTELAUDIO\FUNC_01&VEN_10EC&DEV_0295&SUBSYS_1025141E. I found no
    pin or verb settings in the INF itself. The package also ships
    RTAIODAT.DAT, which I cannot read.
  - MaximExtension.inf (a Maxim speaker-processing APO) also binds to
    SUBSYS_1025141E. No Maxim amplifier (MX98*) appears in the ACPI
    device list under Linux.

It looks like the speaker path needs a vendor-specific COEF or
initialisation sequence that Linux does not apply. A similar report for
the P614-51T-G2 from 2020 was closed without a fix being posted
(https://github.com/thesofproject/sof/issues/3058).

I am happy to test patches or hda-verb sequences, and to run RtHDDump
on Windows if you can point me to it.

Thanks,
Asim
