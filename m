Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6E640862F
	for <linux-sound@vger.kernel.org>; Sat, 29 Aug 2026 20:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788035774; cv=pass; b=h2hLeGxtUzC1Dpaq0OfjoHFpU6bOMfpC+GFmpxY/bFo1e3n4omYRQpO9xX+L+NAi0ccVNWv8evymP3GmueRCVQ6yJzpnBN1KdBBLHN4VNT/66ICiD4T5/ewq92PqAnnAz1xisit1B44uM/xOvI0oOak2siAXpfLUAqCwFYhXaUA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788035774; c=relaxed/simple;
	bh=X3bVy3tWFtlIKKTPElf6KXmRrWxJGx8ScIYbrwClHFs=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=JUFznR5i0YDMVs5b3625ZksptlxGNgHLkvCnK/agEr1vqd4YTiADgl9x6iRVSdX7Ni8L/2z+nulBkykGx7ddJPBzZsNnTRtKxNVRxhcP2SXVQJkg1tWawoBKhrcWjnys1pHcD+ga19qwxyaAPriWAwJcc2fJIIgHakodRYBY9jE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ge7qxCuy; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ge7qxCuy"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6a173ad7cf4so3336632a12.3
        for <linux-sound@vger.kernel.org>; Sat, 29 Aug 2026 13:36:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788035769; cv=none;
        d=google.com; s=arc-20260327;
        b=hyG7i84Ux6LUQN7jsuucZUfF12w3qL9dmr7Y/mnwVG6j5X8kpAT9rYckru6GlDG8X9
         T+HWy8Qel4kCrN0I8sfcDnqC3X3dbTQl55gLP8DICkNumLwo5Ghv4VHry7qMnErrci5W
         XweUP871NAug8Ju/nCNVs4dWRcGBf2Ylzup2bmp8R0b93VYlTBqrkIE83JkQJBvpPEWP
         8ebqERcLAed62DhQV5l3fVCiIFj07cMLjguy78Smvn7kMV4L+NE4hdyEl0S/iscGSHol
         i68/lFlOIhmHB2kpYelkyJmjZk+3TPH8DlAy/B/+sw9+U7nxcudzNubb6xQDZaz3BO5q
         7FNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Xovgz39vU9Xpo5fpdpWwYxiEvljk9XUabSW2iYIhSts=;
        fh=RGnJuy/Ycrv4InBWjIdiAKsAIfYtfI+FYs6Ou0adh4s=;
        b=Q04k/sLRhC0QZ1BM0VYVKz0NCKqJRPCj22EdQZsRivZiRefFrXkYIdmcheDpZ1HPnK
         hUYl1l1b4qoil8zGN0weqC2YQ+Nae/RWt4KGLdfPB670m7JdVvtmL5rBPJo6APCg7rNc
         ploxhIpEtoRwjKSOEzy0y8d1TQpECD9j2eJEMZn8SxvO0sPWpc/pyu/y6akWHC+Yh6h6
         /Cs4v9R8SD4tFVo7a3KQtbWbSb6wknSbSMsY8KX78okgEB8KnDNGJTMtMdNYEoWAsfzi
         vNPpiIV4QHl8y3JSDTCiuCO3kEcZXivpf6oIgHRE731rB4kFW0Kehmri62BS8jmhnS2F
         f0sA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788035769; x=1788640569; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xovgz39vU9Xpo5fpdpWwYxiEvljk9XUabSW2iYIhSts=;
        b=ge7qxCuy2TmUqYyZi9m09vG3KBk83C62Xk9cfPldbs3yTnSrarUm2g2K+WsciVaXfS
         Cz07YLlhI5sGOgFIosPS63w80rw0HMXMHHFrdWf92v5+BUAdPF3h4NgDdBX/JoVznKaT
         +xORYUJ9Cr3rXOzPqXTgzrrRIZcQk47OHjmRJQQ2Zz+HLNAuga/uQLzqIIeCxuXtJ6Zs
         6KUzfGlXg0Ywo3/Lu/OE8Rs6TLj6tiWwQ6zTmMxfJ5JdGdGL+pyx99e2ENEgT8UGcn40
         3Tbwhvv0nASJ+lUvirUWJamjEL/rRo0Hayf3ja0YAwJeI65t8Jv5+uo8B9KvTOerEfAy
         s5YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788035769; x=1788640569;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Xovgz39vU9Xpo5fpdpWwYxiEvljk9XUabSW2iYIhSts=;
        b=Lw0vytlSI/8xK6j/rzydBbz0q8S2oMxGt5spynTSEHyzMtCJ6nfzY4Gp54VmyGK9/f
         JhjFZOnUMhRWOdVk06eyYJ7LqiZGFlHVPHqTFoJNtuEoydnNIevNWSNt3FDQnYjd3gTA
         a7f9Q6hwf3ks/WwrY33/B7TP1N9gVNaxm3VXp8bYNBvtW9Q1Gw6qlZhrzKaWAN0C6Myw
         camLUSSk+AvTz9HzIgFyDUbduCGiJnylUofLXN0eBXrsFZdNLLf4+EY4o9/hX/cVTu/N
         u/6cOdhuvkM8Uf4xeI+uKgLq4aazv/mdP/Q6HlCOaqFDoYDdRxD+UWOnNEA6yb51Hmbg
         Ctlg==
X-Gm-Message-State: AFuF++nxdkZjqT9YEoglj+s1tGvJVfQ1cwPGXtAJ4idlIUN74v4NjZaD
	aWpl8u97onpwcyNIiSh4ra625PWdYVLA3032cGG1pkxLwCmj8Wb4orSW/TfPs1PCjEKYJeMI28K
	lWYAGZTdfK3fNIAMPikR6vo/AFJNJ0AU=
X-Gm-Gg: AYBFou00BUSiUPwMyNF/DNERmEXA/LJv02Cp0wbZYYNI5mi8Ptlmw7irxYy/zgAFrYW
	hTHQN0m7CXUcdqy9iQb7jVw27xYwJJxl7HTyDVU+RnBW2s61My0Zeln0lwiSkBIqABlNYR8KV2l
	L/MiZ9OGi4gZNMeaWtYdRbAwtovcC35zhBKx7htdzmvXpjVIgo4aInxJC0gPP1nmOjzchvB5JV3
	VRNLEri2eSyX7tABrMNF+ooCspDAZjCH+Wd9Ek6VTE9dxfg9neQOErICDnjaT3INHHdwYqjkR7x
	ieE72f4XN1Sn8JgWUu2pDSm1Pw7c5cW1iJYXgaGjw9YYuACLB+tjBerurK5bCh5xqdi+dSQS7px
	LFWzztJ9P8tjvt6UGmLeBzpQQ
X-Received: by 2002:a05:6402:505c:b0:6a5:def7:b872 with SMTP id
 4fb4d7f45d1cf-6a60d36ffffmr9045015a12.9.1788035768388; Sat, 29 Aug 2026
 13:36:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: hazar sahmeran acikbas <hazaracikbas@gmail.com>
Date: Sat, 29 Aug 2026 23:35:56 +0300
X-Gm-Features: AcwNN1W7uwreZ8qnOYZSTcXbrShQL0cdZc_Hi6Bnt8ENrssLqHFjyL8itOmCaWY
Message-ID: <CACTnKN6KSPjo0xUh=LuVEEwU9bx5CqnK4k1gVyKrEXDfa_tEUQ@mail.gmail.com>
Subject: [BUG] ASoC: amd: acp70: Acer Nitro AN16S-61 falls back to
 acp-pdm-mach, which streams invalid PCM (no working internal mic)
To: Vijendar.Mukunda@amd.com, venkataprasad.potturu@amd.com
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

On an Acer Nitro AN16S-61 (ACP 7.0, 1022:15e2 rev 70) there is no working
internal microphone under Linux. The board has no entry in the ACP70 DMI
config quirk table in snd_acp_config, so it falls through to the generic
acp-pdm-mach machine driver. That driver creates a capture device which
opens and streams without error, but the data is not PCM audio.

This differs from other reported ACP 7.0 machines (ASUS ROG Flow Z13, HP
Omen 16-ap0xxx) where no PDM capture device is created at all. Here
enumeration, board match and PCM open all succeed; only the data is wrong.

Hardware
--------
DMI  sys_vendor      Acer
     product_name    Nitro AN16S-61
     product_family  Acer Nitro 16S AI
     board_vendor    SXP
     board_name      EV3_SKF
     bios_version    V1.53  (03/06/2026)

ACP (Audio Coprocessor)  1022:15e2 rev 70, subsystem 1025:1874
HD Audio Controller      1022:15e3, subsystem 1025:1874
Analog codec             Realtek ALC245 (10ec:0245), codec SSID 0x10251874

There is no SoundWire codec on this board.

Environment
-----------
Kernel          7.2.0-1-cachyos (x86_64)
sof-firmware    2025.12.2
linux-firmware  20260622
alsa-ucm-conf   1.2.16.1
Userspace       PipeWire/WirePlumber, default config

Legacy ACP path is active; SOF is not bound (no /sys/kernel/debug/sof).
snd_sof_amd_acp70 is loaded but users=0.

Binding chain (all of this succeeds)
------------------------------------
  snd_acp_pci  ->  PCI 0000:64:00.5
  ACPI-based match via snd_amd_acpi_mach
  ->  platform devices acp_asoc_acp70.0 and acp-pdm-mach

Card longname is correctly derived from DMI:

  SXP-NitroAN16S_61-V1.53-EV3_SKF

The kernel log is silent on ACP apart from one line:

  snd_acp_pci 0000:64:00.5: enabling device (0000 -> 0002)

No probe errors or warnings. Card 3 registers zero ALSA controls --
"amixer -c 3 controls" and "amixer -c 3 scontrols" both return nothing,
so there is no PDM gain or enable control of any kind.

Reproduce
---------
  $ arecord -l
  card 3: acppdmmach [acp-pdm-mach], device 0: DMIC capture dmic-hifi-0 []

  $ arecord -D plughw:3,0 -f S32_LE -c 2 -r 48000 -d 3 /tmp/dmic.wav

Then inspect the samples:

  $ python3 -c "
  import struct, collections
  d = open('/tmp/dmic.wav','rb').read()[44:]
  n = len(d)//4
  s = struct.unpack('<%di' % n, d[:n*4])
  c = collections.Counter(s)
  print('samples', n, 'min', min(s), 'max', max(s), 'distinct', len(c))
  print('first 16', s[:16])
  "

Actual result
-------------
A 3-second capture (288000 stereo S32_LE samples) contains only FOUR
distinct sample values:

  min = -2147483648, max = +2147483647, distinct = 4
  287956 of 288000 samples (99.98%) are exactly INT_MIN

The opening frames are a regular alternating pattern:

  -2147483648, -2147483648, +2147483647, +2147483647, -2147483648, ...

i.e. a full-scale square wave at Fs/2, which then collapses to a constant
INT_MIN rail for the remainder of the capture. This looks like an
undecimated/unconverted bitstream or DMA'd garbage rather than a
microphone that is present but silent.

hw:3,0 rejects S16_LE ("Sample format non available"); only S32_LE opens.

Expected: real microphone audio.

The HDA/ALC245 path does not provide the internal mic either
------------------------------------------------------------
The ALC245 pin configuration declares two internal digital mic pins:

  Node 0x12  Pin Default 0x90a60130  [Fixed] Mic at Int, Conn = Digital
  Node 0x13  Pin Default 0x90a60140  [Fixed] Mic at Int, Conn = Digital

Both are exposed as mutually-exclusive capture sources on the HDA card
("Internal Mic" and "Internal Mic 1"), and both default to off with the
external jack "Mic" selected. Selecting each in turn and capturing:

  Internal Mic   (0x12): all zeros, 1 distinct value
  Internal Mic 1 (0x13): an opening full-scale transient that decays
                         exponentially to zero and stays there

Per-0.125s AC-RMS for 0x13 with Internal Mic Boost at maximum (+30 dB):

  1884 906 435 209 100 48 23 11 5 2 1 2 0 0 0 0 0 0 0

That is a filter/DC settling artifact at stream open, not audio. Capture
volume was at maximum in both cases. So the internal mics are not merely
deselected on the HDA codec; neither pin carries a working signal.

For reference, the codec picks only a vendor-level fixup, not a
board-specific one (this kernel is built without CONFIG_SND_DEBUG_VERBOSE,
so the quirk name is stripped from the message):

  snd_hda_codec_alc269 hdaudioC2D0: ALC245: picked fixup  for PCI SSID
  1025:0000

Already ruled out
-----------------
- Reproduces at raw ALSA (arecord), independent of PipeWire/WirePlumber.
  No custom PipeWire/WirePlumber configuration is present.

- Not a machine-match problem: the ACPI match succeeds, both platform
  devices are created, and the DMI-derived card longname is correct.

- Not UCM: alsa-ucm-conf ships a matching profile for this machine driver
  (conf.d/acp-pdm-mach/acp-pdm-mach.conf), and the failure reproduces with
  arecord on plughw directly, which does not go through UCM.

- Not a muted or deselected input: capture gain was at maximum on both
  cards, and both ALC245 internal-mic sources were explicitly selected
  and tested.

- Not a stale local override: the machine previously had an invalid
  "options snd-hda-intel model=alc245-acer" in /etc/modprobe.d. That file
  was removed and the machine rebooted; all results above are from a
  stock configuration, and nothing changed.

- Mic-mute hardware is inert under Linux here: KEY_MICMUTE (248) and
  KEY_F20 (190) are both absent from the "Acer WMI hotkeys" capability
  bitmap, and no micmute LED class device exists. The device does report
  KEY_WLAN, KEY_PROG1 and KEY_TOUCHPAD_TOGGLE, so the hotkey path itself
  works. (This missing keymap entry looks like a separate acer-wmi gap
  worth fixing independently.) The EC's own power-on state is not visible
  from the OS, so this is not a formal proof -- but a muted DMIC would
  give clean zeros, not a full-scale Nyquist square.

Suggested fix
-------------
The mechanism needed appears to exist in-tree already. The ASUS ProArt
PX13 series ("ASoC: amd: acp: PX13 ACP70 config and machine quirks",
March 2026, merged via for-7.0) added a DMI-keyed override in
snd_acp_config that redirects ACP70 boards away from the generic PDM
machine-driver fallback onto the correct path for that board. That table
is present in the running kernel -- the ASUS board string is visible in
the module:

  zstdcat /lib/modules/7.2.0-1-cachyos/kernel/sound/soc/amd/snd-acp-config.ko.zst
| strings | grep HN7306EA

There is simply no entry for this Acer board, so it falls through to
acp-pdm-mach, which is evidently not how its DMICs are wired.

Request: add an ACP70 config quirk entry for the Acer Nitro AN16S-61
(DMI product "Nitro AN16S-61", board "EV3_SKF", ACP subsystem 1025:1874).

What that entry should select is the open question, and I do not have
enough information to answer it. Unlike the PX13, this board has no
SoundWire codec, and the two internal DMIC pins declared on the ALC245
are both silent. So the DMICs appear to be on neither a working PDM
instance nor the HDA codec as currently configured. Possibilities:

  - a different PDM controller instance than the fallback selects;
  - missing PDM clock / decimation-ratio / gain init for ACP 7.0 on this
    board (card 3 registering zero ALSA controls may be a symptom);
  - an ACPI/_DSD-declared endpoint configuration the current code does
    not honour.

I am happy to test patches, apply debug printks, dump ACP registers, or
provide any further logs on request. alsa-info.sh output can be supplied
or uploaded on request -- I did not upload it pre-emptively.

Thanks for looking at this.
