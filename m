Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC183F1055
	for <linux-sound@vger.kernel.org>; Sun, 30 Aug 2026 01:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788053595; cv=pass; b=CyMr7DLhbTej/jrf74v3ORiBVOlwWdj26qa6H1HuZkW5YUavKlLELLDxnWP2RztsNuenyetDhbSZ1XPxMcuKy1eQnjVQn7EhtKwJ0oldg3IUAthQvMjaaHYtJeGPRcFMdo95D3JZZm4I4c6sg/racyOwHU96X+dz5wsfY1LoruQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788053595; c=relaxed/simple;
	bh=mAYl480KrVBsMjHlvpqybLi7zu7kDHnHq/FLxDkzgr8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=sH3GaCF7byVlJU/hDfpCTvF7crW2pKUelappGDSOD/upsBhv4VJfgjTw9qP2GBtYXJALSS88vh8AdSUeJyXr3YNH3wnLn+TFPxlxg+IR6j8cXIDGdADzzyW6EEZ2xcTiA/prHT4T0SNGIn5csHhKylCuxCs7d69J2Ca2Vt/MzsQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JFdrlxtT; arc=pass smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JFdrlxtT"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-85b293528a9so36757607b3.1
        for <linux-sound@vger.kernel.org>; Sat, 29 Aug 2026 18:33:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788053593; cv=none;
        d=google.com; s=arc-20260327;
        b=Jg274i/EFROzSw+xg/f9qxGai6CaPYWo1mtIZAuv+V4olXBwBpE6FJpfOPtfVBZVOo
         Oi/w69ghP0Sj2DYV9QWc3s7daXLE+R+fnusLnA3e6sQMz0gKHIjxXOdN7JnEb5wnvYKW
         11efKuSAbj0ugXEXhqr9L6l4zlswTBZvh8ne6Fyo92XxfgVW5Hs2f/93CB/o6mXcjZYS
         7Fo+MNDvUxC8Slw3iToGgVFg2owQQSP/kdGUUPW/KXIGwIHX1I+qticH4kEIo4vcanFJ
         eYSPw52kebIpUDOv0b3W95FTCWq9rtSZP98s905noi7fbMpzbeAxkqoxcz6O20PB4iGF
         cTsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=mAYl480KrVBsMjHlvpqybLi7zu7kDHnHq/FLxDkzgr8=;
        fh=YR7/V6Xs0ughgdki5HmD8LX3umOUz1mesq5mAaEMBAg=;
        b=gPWJ3HbkogNA27JmTJCXGutEyvSfphjsjSIEaLhe9Q2VjqQJSkVIhBc5kBrREPsccz
         VrU3/TrmELWYxp2HxuIUhSW8F2VTCu/QPGJ8Pry/Qfp/aXFaRlpjRVrRlJQdvyXSrqh8
         wUk8ljC3A/cXu1qsAgL9pZMZ56T+x74DJ0iPW8/ZpRqGMWYRgm+tpME6du2dvWTfEPL6
         IRGZUM30Sn7ki5Eik6Sn+Y1nWQOvSkxXNGKlm9++Xl21SRE2vFAnGHUMitTZniWdgmeo
         5WM/Y4qIvgRvxWQFapqDA5mGQ96dg2Iae6gI6S0bCsnFUR1ve4vALwc4z42ZKVUQsgc4
         vLVQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788053593; x=1788658393; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mAYl480KrVBsMjHlvpqybLi7zu7kDHnHq/FLxDkzgr8=;
        b=JFdrlxtTpkwACuBeb1em0qMusYuXl9oqRXKK/WxtpFP4Hu4x3Yi1vv7Mo1priuu8Tt
         57WDxyyuVTxLb8O+owmOg/SXteayNnQMVAdE3D4bxXSpi4IJLxQg9Yb+V2ShC8eHk/fi
         sK6VQUIqE0xmELQrSJ761piyP4oteoEt458zIB1F7qamavMInbgsx30b1lPhc8lEVhJU
         49X2WV/9lrAVUq9t5B45vc0Qztph0K2X1X1UzL31aZ7bbQ4Y69HBHR56+VH7w7iQUxts
         TXNmVjRtZyw+5qO74JFqtcqhzujpft8hQ+Uuuv/p2bEZdVRlnY32rKe+EEf053vD9tae
         VM5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788053593; x=1788658393;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mAYl480KrVBsMjHlvpqybLi7zu7kDHnHq/FLxDkzgr8=;
        b=YEht6TXAw2MbxHW35MebDHk4VooXFn49a1/rrRlSkpW7IUYy9qAvqYDLUwhTcnbmWb
         mTLwxy4fKvXnLAy4kw07LDX0AkpVkJFCLi5drgFN+XEpP0nXyg2uzy/6KFtYgW56xHNY
         X+h6F9/6O6pdAuWYQfj1DFRRaDQxsf7iEYeTqWAgGW5mmt9W5nygv/zeM/napZdELz/d
         BXhQ6fspNgmxlkzRuoq+UdW1agWwo9OyawExU+ic4XgQRBu+855VqEQZjm+3l+5U5o82
         CI3rXvrRdIjWwhHHvJuV/rGMNsVMheNNAG/Yp+DDFBzjQFXRkcmr3zLaO3EdKgdMVpA4
         VIog==
X-Gm-Message-State: AFuF++m6mGmgbFLJV7YNKPDBpbeHzqQc/IAarOebM/df77xHbW1+eJ/W
	xfYKIBr1PL5kagqMXSJktMsktUqrNrjUvlwnGjs7jdj7OZ2J3BFf3eWW1+Izc8lMSe5IaG5MMhC
	/UVwhrlzzpWzsTAm1qswumbBwgl1OohPyXaYbZKY=
X-Gm-Gg: AYBFou2wAh1j8P8Opg8Rp0czK0JU3W3IxFtHrNlyh3B5QNNpjXGO0C5R3PJQ//CCSx3
	wtJxLGYIqqFoiTl+KUMV3gLkozmodquLfyRYr2XKm5cOs6UwA1V+X8JBLGtBPgokVtxh0BKnfS9
	nmXpU3H/k+/N6GzO1GloVizpm62O9V3Zf1M4DDTphRjmtgok2F0jptRANFAONPMM9Rbt/F2ZK1D
	d2roh0OuLwqGaqyYMOGApn3Dq+nGnLanq5vFWhVr50tlQVT5j9QoYvIZcztQ/gHVoWMMnuEPuxs
	ClE9VLWzUBg/tN8GAMNlE5uvD3wKeUX3NAUiuaYLlvIYhQ==
X-Received: by 2002:a05:690c:48c3:b0:81e:fdf7:bfbd with SMTP id
 00721157ae682-8648e496844mr494567b3.15.1788053593165; Sat, 29 Aug 2026
 18:33:13 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sat, 29 Aug 2026 18:33:12 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sat, 29 Aug 2026 18:33:12 -0700
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: VR RS <james.vorres@gmail.com>
Date: Sat, 29 Aug 2026 18:33:12 -0700
X-Gm-Features: AcwNN1VOUZlvjZXHPg-GK7pEbJidoYWsFYxCXEo6YkwunFoy686-opFcndt8WX8
Message-ID: <CAA0e5J=fuvTkqUeasaNqgwwooKacgtS7a4unsT-PXH+HoUPp3g@mail.gmail.com>
Subject: [BUG] ASUS TUF A14 FA401EA: RT721-SDCA SoundWire speakers enumerate
 and stream but remain silent
To: linux-sound@vger.kernel.org
Cc: Vijendar.Mukunda@amd.com, venkataprasad.potturu@amd.com, 
	oder_chiou@realtek.com
Content-Type: text/plain; charset="UTF-8"

Hi,

I am reporting an audio issue on an ASUS TUF Gaming A14 FA401EA using
the AMD ACP70 / RT721-SDCA SoundWire audio path.

Hardware / OS
- ASUS TUF Gaming A14 FA401EA
- AMD Ryzen AI platform / ACP70 SoundWire
- RT721-SDCA acting as jack + internal SmartAmp + DMIC
- Arch Linux / Omarchy
- Windows on the same machine plays through the internal speakers normally

Kernel work tested
- Stock Linux 7.1.9 did not expose the internal audio path correctly.
- A custom 7.1.9-arch1-2-fa401audio build using the existing FA401EA
SoundWire quirk lineage made ALSA/PipeWire enumerate the device
correctly, but produced no audible output.
- A follow-up 7.1.9-arch1-3-fa401audio build tested an
FA401EA-specific non-aggregated endpoint mapping. It still produced no
audible output.

Current ALSA enumeration
- card 1: amdsoundwire
- device 0: SDW1-PIN0-PLAYBACK-SimpleJack rt721-sdca-aif1-0
- device 2: SDW1-PIN1-PLAYBACK-SmartAmp rt721-sdca-aif2-2

PipeWire creates both:
- Audio Coprocessor Speaker
- Audio Coprocessor Headphones

The Speaker sink maps to hw:amdsoundwire,2 and can be selected as the
default sink.

Raw ALSA test
speaker-test -D hw:amdsoundwire,2 -c 2

The PCM opens successfully at 48 kHz / S16_LE / 2 channels, runs
continuously with no xruns or errors, and alternates Front Left /
Front Right, but there is total silence from the internal speakers.

Diagnostics performed during active playback
- PCM/DMA state: RUNNING
- RT721 SoundWire slave/runtime state: active
- ACP SoundWire manager: active
- DP3 SmartAmp sink port: active bank, both stereo channels enabled
- DP3 word length: 16-bit, matching the stream
- DAPM path: DP3RX -> FU21/FU23 -> SPK -> Speaker, with the relevant
widgets powered
- Speaker mixer controls: unmuted / full playback level
- RT721 driver power/mute sequencing: verified against the exact
driver source and appears to execute as intended
- CS31 sample-rate programming: 48 kHz path traced in the driver and
live state checked
- Function-unit input gain on entity 0x23 / control 0x0B: live
readback is 0xFE80 on both channels, matching the ACPI
mipi-sdca-function-initialization-table (approximately -1.5 dB), so
this is not a muted/default-gain issue
- ACPI DSDT/SSDT inspection found no separate GPIO/_DSM/WMI/EC
speaker-enable sequence outside the RT721 SDCA path
- Windows on the same hardware confirms the speakers/amp are
physically functional

Hypotheses already tested and ruled out
- PipeWire routing/default-sink issue
- ALSA mute/volume issue
- missing DAPM route or unpowered speaker widget
- incorrect sample rate
- missing ACPI speaker-enable GPIO/DSM/WMI method
- missing FU input-gain initialization
- FA401EA endpoint aggregation mismatch (tested in a dedicated
rebuild; did not restore output)
- a meaningful behavioural difference in the shared RT721 vs
RT722/RT712 speaker-init path was not found

At this point every Linux-visible layer from PCM through SoundWire
transport and SDCA control-plane state looks consistent during
playback, yet the speakers remain silent. The remaining unverified
area appears to be RT721 vendor-specific analog/index-register
initialization or another board-specific condition not visible through
the standardized SDCA controls.

A detailed local investigation report was generated, including the
live register/DAPM/ACPI findings and the failed endpoint experiment. I
can provide the full report, kernel patch, logs, ACPI tables, or any
targeted register/debug output that would be useful.

Please let me know what additional traces would be most helpful,
particularly around RT721 vendor analog/output initialization on a
self-contained SmartAmp topology.

Thanks,
James
