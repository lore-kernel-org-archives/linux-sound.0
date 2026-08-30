Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB3D3B47DC
	for <linux-sound@vger.kernel.org>; Sun, 30 Aug 2026 13:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788095595; cv=pass; b=GQi0x4a3uqtYBHPNv4kX23J3s6D0CeHck3F9JmTXl8+o2qgO4ewGlKwXjzMhJ9pEsO/OqpDkoBPI2dsDnS2uoULmG+4p9A/FjBaqpkBeS7BkRvwiwgvQ5wAzLaq0uNbFBuv1pPLP1SFDNm00dSapcmXYA6W1L4vA1/xIq24V02w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788095595; c=relaxed/simple;
	bh=uilLXdkJ8wODChmj5sY2drp9AawrmQosNvNEW28kMx4=;
	h=In-Reply-To:References:MIME-Version:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IYxflMKEhs2SFg+0J+5CD0DBraz7K6l0h/uepuc5F5Te3yNeqIYjwiMEm3W3DKphmbHYbMOifYcAuRlL1Xk2XOIzBWnCpzjkIuUFg4DhTyNhtZvQJWRj7nAEvbsoVVokcV8hD2fzinJ4RXxmITCfe7L4S8cDfarEH0vqD7yTfBM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YZ8bOwB0; arc=pass smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YZ8bOwB0"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-86162c086f8so9690157b3.1
        for <linux-sound@vger.kernel.org>; Sun, 30 Aug 2026 06:13:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788095593; cv=none;
        d=google.com; s=arc-20260327;
        b=jnN9TGLHHdSovWoqqRLCPBFgZqUUQzz3sUFjuBcgiLc6rH2c4DIS+i++rUzxkZgdzA
         WrxEl5WilPmciLVdMHoRCQq9G28LagEqtujlev4URD6aRaGMrpxH9Y6Hb6PO/lliRqN5
         T2GjmH9pM7/f0JEzMxID0Vau6PNKgxoksUHCErf0SRsGxKpLjxg4DuGmC8ZPac9Cv/DJ
         ypeUtRyNhmIm3nWga346425d1RKmZROCRlPpVzubdTgYjvCRTz4lDdUSKm3nVGh22vcJ
         eK9Xvk99bKOEvDOdMcvah7CPhbQBuUhzqxH4Bn25McIAypa4ZD+TNshrUa8xWG4Le447
         lV3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:references:in-reply-to:dkim-signature;
        bh=JAn/z/g+2vumcttfzvSU34hs/qIp+pJqoykFUuZG0pM=;
        fh=YR7/V6Xs0ughgdki5HmD8LX3umOUz1mesq5mAaEMBAg=;
        b=QZlJE/62FMJExUFOOpug5Zs76aBoXDr7ZIHoFqpa8pxqQuHUtguBIHEPsqEnGNjsm8
         IVs+3ypsM0PeTwiloOEJ6WPlIx4EBMNXlYkPaeZ7/WKUXRfiNbC7XMf+JscmezAo+R0T
         srMl4OpeiY/6d+eUJY2RSBV7VpBeMxIAljt0lCFPRIidX68DaM8ucgmjF87NSJfxJ5kQ
         97aKqjyVFs7FjKk6bKq3VFx0YoVJzxf0YdGudL7b+T3QPsr/ozgfDnaic7GCnDgskuvt
         bg+I/533AtsVhAB5HN5yZsVbhmJ8J4qeSYdbCWDZ8OjtDOD+CLtal6Jlqo2hYhQ0aqNk
         CGAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788095593; x=1788700393; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:references:in-reply-to:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JAn/z/g+2vumcttfzvSU34hs/qIp+pJqoykFUuZG0pM=;
        b=YZ8bOwB0UN6tYj2xD6NoiNqThkL4PiPwJoYea/+PuEwnJOEXH46RURKcGNDYUVw1fz
         dVceDT+rq6KBy1km0395gxBA7itvNtK0njb+MLMGBRtP49n0PHgq17MQZOIlt+oTi0wX
         YGMfjqvkffRq9YYAvalEQ5Tq7X/lPqeK9WumBU5dDeqQYwUZZtptOxg34h95H/ZBKHnz
         Mgy6PW5hGVM4LSv98ywko1uv9zPzQxPBxmTNrb/IAPmvT+Yf4HaeyVZU5AQWX53DpTOM
         XeU5N7ctEujyPwx15FAaWkSC0n7sfqeL+aungfjpuCWDBIlRxYSaprBmD0GUBrhLD7p1
         Zmdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788095593; x=1788700393;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:references:in-reply-to:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JAn/z/g+2vumcttfzvSU34hs/qIp+pJqoykFUuZG0pM=;
        b=o6FxAPsZn2qDMbBXDlueMdXdJ904Ge3w3Nwv7UJiEHvpQCVyNeaCvwb/o2Ym9eimUO
         farvc68WOyKGwarWgijv4TQNelk0TW3aVevRF6yrkN51K3JNwM8YyKVG5fhohUDCYfv5
         A4XRYq1aGgr/pa0ETknKv/b3aERfegMc8tM2IzmCp6XjQeGuvNrMEvbIXyZeWb6cunnB
         xI7L1059zfHgqG/bZFDj0DIYfGPMCJiGZ+WTdvDSP2MHuzEdnJgv0QIproVLV1G7vTWY
         Dfi8HVPZUfXag5AwlCpuxFpj3vN2pvr5oDrxSnpC+6eYLv4HsZdF9zCfTrllK+V4ggj8
         XSRw==
X-Gm-Message-State: AFuF++lgPj8+XaHOZ7IWsz/k5xugHDCru1300TxQ0APFVbAzyMBxu4ok
	xaw/82QstWN6p7lCuF5bwvTCA8taMB3ArgZ+hdqx2tEWwDJH+c6yIuvNaYBwywjvwoZURwRDtRH
	6dSWGjcTaNUqEZ0UHcnalDD6I6STwzS5qCj22
X-Gm-Gg: AYBFou3kXs9XuDUYuvwiHLTE6XPJg2LwUTkLP1mlWs1APnBAqIZJoFzpH8tkXMEGphv
	0nbOqwcmqnb3tGpkfJnoYxi7SPMtqK/NTKwRcul+wZv7W8YYV3JzwnySRfNLOHSq5IKSiuv80dJ
	Y9KJT8l43uR+Rv8wyA5fk4437s6fQsw8vfjJkTL59VJI2/TOkSm8UKeROql9vjXW4GVOpm2Galu
	mY6ykS0QPvDygeHXJOUg3erVX3tqbIw8cQtRied/cdK6QHcir4z5AIscuUl1OCTM0zIrz/K2fkK
	B44/lp0dAHHueItHlz1gfgOFFsXe94AhVjJRXN7VKtgz
X-Received: by 2002:a05:690c:88:b0:832:7fbe:7f88 with SMTP id
 00721157ae682-864f3b63802mr6148167b3.10.1788095593072; Sun, 30 Aug 2026
 06:13:13 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sun, 30 Aug 2026 06:13:12 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sun, 30 Aug 2026 06:13:12 -0700
In-Reply-To: <CAA0e5J=fuvTkqUeasaNqgwwooKacgtS7a4unsT-PXH+HoUPp3g@mail.gmail.com>
References: <CAA0e5J=fuvTkqUeasaNqgwwooKacgtS7a4unsT-PXH+HoUPp3g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: VR RS <james.vorres@gmail.com>
Date: Sun, 30 Aug 2026 06:13:12 -0700
X-Gm-Features: AcwNN1VjgGAYf-Zyr__vcxmTdnFGkmKZPOaMTcKDdFcI4Ysg4rTgE4inxma2M7o
Message-ID: <CAA0e5Jn-hrgROfTPJqRTnUA7Y5rxho_6TToAQ+WVM-Aij6YEcA@mail.gmail.com>
Subject: Re: [BUG] ASUS TUF A14 FA401EA: RT721-SDCA SoundWire speakers
 enumerate and stream but remain silent
To: linux-sound@vger.kernel.org
Cc: Vijendar.Mukunda@amd.com, venkataprasad.potturu@amd.com, 
	oder_chiou@realtek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Follow-up with a confirmed working fix on the ASUS TUF Gaming A14 FA401EA.

After the FA401EA ACP70/SoundWire machine quirk was in place, the
RT721-SDCA card enumerated correctly and ALSA/PipeWire exposed the
internal Speaker and Headphone paths, but the speakers remained
silent.

I decoded the board's ACPI mipi-sdca-function-initialization-table for
the RT721 SmartAmp path and compared it against the writes currently
performed by the Linux rt721-sdca driver.

Of the 20 ACPI-supplied SmartAmp initialization records, 19 were
already reproduced by the existing driver sequence. The one missing
board-supplied write was:

    regmap address 0x2f5d =3D 0x01

This is adjacent to the existing per-function raw preset writes
already used by rt721_sdca_dmic_preset() and rt721_sdca_jack_preset(),
but there was no corresponding write in rt721_sdca_amp_preset().

Live test:
- before write: 0x2f5d read back as 0x07
- wrote 0x2f5d =3D 0x01 via the SoundWire debugfs register interface
- readback confirmed 0x01
- internal speakers immediately began producing audio

A minimal source change was then tested by adding:

    regmap_write(rt721->regmap, 0x2f5d, 0x01);

to rt721_sdca_amp_preset().

The kernel was rebuilt and installed, then cold-booted with no manual
debugfs write. The speakers now work automatically from boot.

Regression checks completed successfully:
- internal speakers: OK
- headphones: OK
- jack detection/switching: OK
- internal mic: OK
- mute/volume controls: OK
- suspend/resume: OK
- 0x2f5d restores/persists as 0x01 across resume via the existing regcache =
path

So the remaining speaker-silence issue is reproducibly fixed by the
missing RT721 SmartAmp preset write specified by this board's ACPI
initialization data.

I can provide the exact patch, ACPI table decode, debugfs read/write
logs, or the full investigation notes if useful for upstreaming.

Thanks,
James

On Sat, 29 Aug 2026 18:33:12 -0700, VR RS <james.vorres@gmail.com> wrote:
> Hi,
>
> I am reporting an audio issue on an ASUS TUF Gaming A14 FA401EA using the=
 AMD ACP70 / RT721-SDCA SoundWire audio path.
>
> Hardware / OS
> - ASUS TUF Gaming A14 FA401EA
> - AMD Ryzen AI platform / ACP70 SoundWire
> - RT721-SDCA acting as jack + internal SmartAmp + DMIC
> - Arch Linux / Omarchy
> - Windows on the same machine plays through the internal speakers normall=
y
>
> Kernel work tested
> - Stock Linux 7.1.9 did not expose the internal audio path correctly.
> - A custom 7.1.9-arch1-2-fa401audio build using the existing FA401EA Soun=
dWire quirk lineage made ALSA/PipeWire enumerate the device correctly, but =
produced no audible output.
> - A follow-up 7.1.9-arch1-3-fa401audio build tested an FA401EA-specific n=
on-aggregated endpoint mapping. It still produced no audible output.
>
> Current ALSA enumeration
> - card 1: amdsoundwire
> - device 0: SDW1-PIN0-PLAYBACK-SimpleJack rt721-sdca-aif1-0
> - device 2: SDW1-PIN1-PLAYBACK-SmartAmp rt721-sdca-aif2-2
>
> PipeWire creates both:
> - Audio Coprocessor Speaker
> - Audio Coprocessor Headphones
>
> The Speaker sink maps to hw:amdsoundwire,2 and can be selected as the def=
ault sink.
>
> Raw ALSA test
> speaker-test -D hw:amdsoundwire,2 -c 2
>
> The PCM opens successfully at 48 kHz / S16_LE / 2 channels, runs continuo=
usly with no xruns or errors, and alternates Front Left / Front Right, but =
there is total silence from the internal speakers.
>
> Diagnostics performed during active playback
> - PCM/DMA state: RUNNING
> - RT721 SoundWire slave/runtime state: active
> - ACP SoundWire manager: active
> - DP3 SmartAmp sink port: active bank, both stereo channels enabled
> - DP3 word length: 16-bit, matching the stream
> - DAPM path: DP3RX -> FU21/FU23 -> SPK -> Speaker, with the relevant widg=
ets powered
> - Speaker mixer controls: unmuted / full playback level
> - RT721 driver power/mute sequencing: verified against the exact driver s=
ource and appears to execute as intended
> - CS31 sample-rate programming: 48 kHz path traced in the driver and live=
 state checked
> - Function-unit input gain on entity 0x23 / control 0x0B: live readback i=
s 0xFE80 on both channels, matching the ACPI mipi-sdca-function-initializat=
ion-table (approximately -1.5 dB), so this is not a muted/default-gain issu=
e
> - ACPI DSDT/SSDT inspection found no separate GPIO/_DSM/WMI/EC speaker-en=
able sequence outside the RT721 SDCA path
> - Windows on the same hardware confirms the speakers/amp are physically f=
unctional
>
> Hypotheses already tested and ruled out
> - PipeWire routing/default-sink issue
> - ALSA mute/volume issue
> - missing DAPM route or unpowered speaker widget
> - incorrect sample rate
> - missing ACPI speaker-enable GPIO/DSM/WMI method
> - missing FU input-gain initialization
> - FA401EA endpoint aggregation mismatch (tested in a dedicated rebuild; d=
id not restore output)
> - a meaningful behavioural difference in the shared RT721 vs RT722/RT712 =
speaker-init path was not found
>
> At this point every Linux-visible layer from PCM through SoundWire transp=
ort and SDCA control-plane state looks consistent during playback, yet the =
speakers remain silent. The remaining unverified area appears to be RT721 v=
endor-specific analog/index-register initialization or another board-specif=
ic condition not visible through the standardized SDCA controls.
>
> A detailed local investigation report was generated, including the live r=
egister/DAPM/ACPI findings and the failed endpoint experiment. I can provid=
e the full report, kernel patch, logs, ACPI tables, or any targeted registe=
r/debug output that would be useful.
>
> Please let me know what additional traces would be most helpful, particul=
arly around RT721 vendor analog/output initialization on a self-contained S=
martAmp topology.
>
> Thanks,
> James
