Received: from mail-ed2-f41.google.com (mail-ed2-f41.google.com [74.125.228.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4BD3D4125
	for <linux-sound@vger.kernel.org>; Sat, 19 Sep 2026 09:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789809777; cv=pass; b=AMRv+0H85yCZ4QgDEa52m8qJ9AjAcFRCNTkw7f85bK47ws3ZTcwcq6Xtc1MhTggGVoo1R2BEKp+TiMGnrGWee6ZPsUs+EvsUoBK5jy6pp6o7Ao/xun3I0zz43dLTpj5trtXnA0CK7yro4y1nNv80Ss3ocBzMj8HT0EFA8mhn/LM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789809777; c=relaxed/simple;
	bh=hERJqQ1D23PS8706jmB3ENSoI5hlTm8qOcgvZsAh13k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pHnt/OPVgTWGDTZyRa8xdNDsqG2syhxJdOG2qxaF2+u03MNkHwKKP6W7fxFS0PXcSzgCw0DiWy1Gz1LOr/XDWLDpq8CP8vw7KRi54fExUdOSDhzfEjKzZt1+2qWR7GYQ7x0DCw1LDmGS5Ii3ZE512Kitv7YESHeHDrXpWd3bTpA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IaEpJXIU; arc=pass smtp.client-ip=74.125.228.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IaEpJXIU"
Received: by mail-ed2-f41.google.com with SMTP id 4fb4d7f45d1cf-6a99391ffb2so2550896a12.0
        for <linux-sound@vger.kernel.org>; Sat, 19 Sep 2026 02:22:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789809774; cv=none;
        d=google.com; s=arc-20260327;
        b=lNrSVkSiHRD+6La9GUHR6JnIXHJ3QRIXJc8LZhkZnofFTi4jsJ2qB7ORwCEbo0KmGI
         /i+NzZOxPFOE43aj4yzhgG/dwPP0PrM+Y3kPz/WHWW4G0g+G6vQbdbdOtBIDsLUPJloT
         DHvzq6M3ZvcSHzNOv5KihpyO2epQIZ/TY/f9VyXWauOa/K60sA8ZpkBJlmjAdqv8YX3p
         XCXjstUerzFCctUYV5UpwDW/eUXRJbg6jfbinnrS3lyyGxGvthX6RJ3itk/Cn7s5nNTp
         iqqTiL2yfa/gHY2OOf/Pxj+MPDKSnFUkV6Fez1wXuUg2HFc4aHFO1bW7tqUYoPpFbYra
         JwGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XPSllThwtjZWB5K2xP0+9P6Xa/Swb2W6sg/13ntZORY=;
        fh=RGnJuy/Ycrv4InBWjIdiAKsAIfYtfI+FYs6Ou0adh4s=;
        b=ZonGfkeiMXWVDfgNcSVbM7GVd0PuJ0WK6442B01m8K8fBScGRoUax5wprlgi9O9vc2
         LC4kuw2W/EIhPzyDfx4FUPTa/cOplPMzJIZhuqopfUoI8q6CVhdOH9NKwx39jx5jfZVB
         bQBEiFtXdoocLLPAMzsLDcfAVJkuG6bwAVkD1oqPf0sE3GrpXfJOWfxX9RF7PjIWNWCM
         6ZuWGn+sX+GW8CargpPp1QrZEhO+0cr59DV4pmztKgzglhCKK2UrzRwMCgZMn4UMS/n4
         wE4P1/lOq8xoaNzoe7UytFkStKvo7/a5+QZTMXuVOV0IsnO5xMzLQ44UUrKwQm1Gi4Pb
         Z5xQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789809774; x=1790414574; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XPSllThwtjZWB5K2xP0+9P6Xa/Swb2W6sg/13ntZORY=;
        b=IaEpJXIUxf1Baakq7lqDbD/3/5SlbKEdHOAHcxGtf8W8Xw9J7zmj9hcYcWlONCtfFc
         KensquovLQG/zn2cKqb8EVRXYe0Pb/W8vP9l0LDKx9v7UzOkH5gDRUkGTE+SSVKrHOq4
         PhxgxYJydIDhYOW2FC2htpa5gwcFHJ/o9VHlOhiU6qZHbfGlH5j2tfIupPxgl6pBec8P
         VNa02OgIdRdTDxqL5VcRzlwdXSMC24fFiJ+DDlE3ZOkEQrhGsBxZwIIrJQvepbkLSiKG
         m3Lzbdf6u/AJIsfBNBtgtqtPSX/QmImvEUHFD3ghCbmYFYljM1T0xk8H08OCjqfYD+XB
         vTDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789809774; x=1790414574;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XPSllThwtjZWB5K2xP0+9P6Xa/Swb2W6sg/13ntZORY=;
        b=xDZiAg33A0F3mj4bahr8+qLHI0GpH8I+SiXk7ryPm2ndNWGejEPSnRt1MQsNc/cf53
         Ztgh0XOWVp3R9EzWY00P17UJmtJXihIAVpCl6JkORYJepHhGbwK4aGpKA/qTrYfvV+Jv
         D2wB9Rjdlg14cGWw88PWz2lX//C1HJZjaF4pSKOpFYVH1Xh7BrOz81CpiXplbJ+z9Ywi
         Q+hSQSnGJUGUOJa1Q7UtS1MtTh6G9GLFshpbGvOoDIgTS7L8G1nupdhPgw1Ebz9r3JgL
         sLF8FFmF5z3UFPAdNMBrvXxrT3MTBkeUyvg9ZeJFAmlL8LLuEQDoj6PkUdkdqpZBOooI
         O1tw==
X-Gm-Message-State: AFuF++kaEyh2UOjmk6IDsRJaAOn0OPP8oNOM7NS+21bvN4vEgAOkXyyD
	HwWlftNLILQRcQC3BuOBZ5xp9s9GGQw9Wf1tm2ohBW3r8v9ZYpaZDEgouQ/vmKcStz72IP/kClY
	x61AuxONIy90Jrbvmvu8tv9JZhu1NZm4=
X-Gm-Gg: AYBFou28Vr/wrX0YfGHYh7NPVs8g9EN4+eo1azbLiIaqLptov91A1gKKcngIdcwMsyC
	QM7TEouqB/DyKLLnprGMDj2N69YDDt7oxuNlShBxFK0iuKufgjoBVdpkt2EZ+LX75yYgmgE65Tt
	IbCMZ7YEc9jBd60utgtdTksnlRq6XeKxnMfHVMf791c47AZPKZGuK14UjqOsdXjVwGjSj6dPM9Y
	2kHZ1maZoYHQly7bt0NqcYaLp9wD7Vm3DrpAQgt4kWDD1tlLZX+2fbU5zmDp5YI6JauxX6RXGdP
	JEThywNYkhLKnav+MfAM7hSNOEd35jdcr4OMv3LpEG+QnVliE4PLHa57s1e3yuZUlIKGHDn6gnL
	sXojcKcq4iGCTtRmj6M0AFVaw9UBRXKMuXQ==
X-Received: by 2002:a05:6402:1ec8:b0:6aa:4d8d:a0a9 with SMTP id
 4fb4d7f45d1cf-6aa5744a740mr3226738a12.0.1789809773444; Sat, 19 Sep 2026
 02:22:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CACTnKN6KSPjo0xUh=LuVEEwU9bx5CqnK4k1gVyKrEXDfa_tEUQ@mail.gmail.com>
In-Reply-To: <CACTnKN6KSPjo0xUh=LuVEEwU9bx5CqnK4k1gVyKrEXDfa_tEUQ@mail.gmail.com>
From: hazar sahmeran acikbas <hazaracikbas@gmail.com>
Date: Sat, 19 Sep 2026 12:22:41 +0300
X-Gm-Features: AcwNN1VSzOR8eHd6j-4vjQo_I_mie3iXmvUgg7rcrnPdGLrXfNoez8XVRjYBVaY
Message-ID: <CACTnKN5-36P3B1vjtdzod3qB7eqCD8saNhV-EWUqvg5goGg49A@mail.gmail.com>
Subject: Re: [BUG] ASoC: amd: acp70: Acer Nitro AN16S-61 falls back to
 acp-pdm-mach, which streams invalid PCM (no working internal mic)
To: Vijendar.Mukunda@amd.com, venkataprasad.potturu@amd.com
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Following up with one new data point that narrows this down.

The internal microphone array works correctly under Windows on this same
machine, with stock vendor drivers and no hardware or firmware changes
between the two tests (same BIOS V1.53). So the DMICs are physically
present and functional, and the EC is not holding them in a muted state.

That rules out the two non-software explanations I could not exclude from
Linux alone, and I think confirms this is purely a missing/incorrect
configuration on the Linux side rather than a hardware or firmware fault.

Still reproducing, unchanged, on newer kernels:

  7.2.0-1-cachyos  (original report)
  7.2.4-1-cachyos
  7.2.6-1-cachyos  (current)

with linux-firmware now at 20260916. The ACP70 DMI config quirk table in
snd_acp_config continues to contain only the ASUS HN7306EA entry, and the
capture behaviour is bit-for-bit what I described originally: the
acp-pdm-mach capture device opens and streams a full-scale square wave at
Fs/2 that collapses to an INT_MIN rail, and both internal DMIC pins
declared on the ALC245 are silent at maximum gain.

The open question from my original report stands: what a quirk entry for
this board should actually select, given there is no SoundWire codec here
and the ALC245's declared internal DMIC pins produce nothing.

I am happy to run anything that would help answer that -- debug patches,
printks in the ACP70 config/match path, ACP register dumps, ACPI table
dumps (acpidump/iasl output for the ACP device's _DSD), or alsa-info.sh
output. Just tell me what would be most useful and I will turn it around
quickly.

Thanks,
Hazar

hazar sahmeran acikbas <hazaracikbas@gmail.com>, 29 A=C4=9Fu 2026 Cmt,
23:35 tarihinde =C5=9Funu yazd=C4=B1:
>
> Hello,
>
> On an Acer Nitro AN16S-61 (ACP 7.0, 1022:15e2 rev 70) there is no working
> internal microphone under Linux. The board has no entry in the ACP70 DMI
> config quirk table in snd_acp_config, so it falls through to the generic
> acp-pdm-mach machine driver. That driver creates a capture device which
> opens and streams without error, but the data is not PCM audio.
>
> This differs from other reported ACP 7.0 machines (ASUS ROG Flow Z13, HP
> Omen 16-ap0xxx) where no PDM capture device is created at all. Here
> enumeration, board match and PCM open all succeed; only the data is wrong=
.
>
> Hardware
> --------
> DMI  sys_vendor      Acer
>      product_name    Nitro AN16S-61
>      product_family  Acer Nitro 16S AI
>      board_vendor    SXP
>      board_name      EV3_SKF
>      bios_version    V1.53  (03/06/2026)
>
> ACP (Audio Coprocessor)  1022:15e2 rev 70, subsystem 1025:1874
> HD Audio Controller      1022:15e3, subsystem 1025:1874
> Analog codec             Realtek ALC245 (10ec:0245), codec SSID 0x1025187=
4
>
> There is no SoundWire codec on this board.
>
> Environment
> -----------
> Kernel          7.2.0-1-cachyos (x86_64)
> sof-firmware    2025.12.2
> linux-firmware  20260622
> alsa-ucm-conf   1.2.16.1
> Userspace       PipeWire/WirePlumber, default config
>
> Legacy ACP path is active; SOF is not bound (no /sys/kernel/debug/sof).
> snd_sof_amd_acp70 is loaded but users=3D0.
>
> Binding chain (all of this succeeds)
> ------------------------------------
>   snd_acp_pci  ->  PCI 0000:64:00.5
>   ACPI-based match via snd_amd_acpi_mach
>   ->  platform devices acp_asoc_acp70.0 and acp-pdm-mach
>
> Card longname is correctly derived from DMI:
>
>   SXP-NitroAN16S_61-V1.53-EV3_SKF
>
> The kernel log is silent on ACP apart from one line:
>
>   snd_acp_pci 0000:64:00.5: enabling device (0000 -> 0002)
>
> No probe errors or warnings. Card 3 registers zero ALSA controls --
> "amixer -c 3 controls" and "amixer -c 3 scontrols" both return nothing,
> so there is no PDM gain or enable control of any kind.
>
> Reproduce
> ---------
>   $ arecord -l
>   card 3: acppdmmach [acp-pdm-mach], device 0: DMIC capture dmic-hifi-0 [=
]
>
>   $ arecord -D plughw:3,0 -f S32_LE -c 2 -r 48000 -d 3 /tmp/dmic.wav
>
> Then inspect the samples:
>
>   $ python3 -c "
>   import struct, collections
>   d =3D open('/tmp/dmic.wav','rb').read()[44:]
>   n =3D len(d)//4
>   s =3D struct.unpack('<%di' % n, d[:n*4])
>   c =3D collections.Counter(s)
>   print('samples', n, 'min', min(s), 'max', max(s), 'distinct', len(c))
>   print('first 16', s[:16])
>   "
>
> Actual result
> -------------
> A 3-second capture (288000 stereo S32_LE samples) contains only FOUR
> distinct sample values:
>
>   min =3D -2147483648, max =3D +2147483647, distinct =3D 4
>   287956 of 288000 samples (99.98%) are exactly INT_MIN
>
> The opening frames are a regular alternating pattern:
>
>   -2147483648, -2147483648, +2147483647, +2147483647, -2147483648, ...
>
> i.e. a full-scale square wave at Fs/2, which then collapses to a constant
> INT_MIN rail for the remainder of the capture. This looks like an
> undecimated/unconverted bitstream or DMA'd garbage rather than a
> microphone that is present but silent.
>
> hw:3,0 rejects S16_LE ("Sample format non available"); only S32_LE opens.
>
> Expected: real microphone audio.
>
> The HDA/ALC245 path does not provide the internal mic either
> ------------------------------------------------------------
> The ALC245 pin configuration declares two internal digital mic pins:
>
>   Node 0x12  Pin Default 0x90a60130  [Fixed] Mic at Int, Conn =3D Digital
>   Node 0x13  Pin Default 0x90a60140  [Fixed] Mic at Int, Conn =3D Digital
>
> Both are exposed as mutually-exclusive capture sources on the HDA card
> ("Internal Mic" and "Internal Mic 1"), and both default to off with the
> external jack "Mic" selected. Selecting each in turn and capturing:
>
>   Internal Mic   (0x12): all zeros, 1 distinct value
>   Internal Mic 1 (0x13): an opening full-scale transient that decays
>                          exponentially to zero and stays there
>
> Per-0.125s AC-RMS for 0x13 with Internal Mic Boost at maximum (+30 dB):
>
>   1884 906 435 209 100 48 23 11 5 2 1 2 0 0 0 0 0 0 0
>
> That is a filter/DC settling artifact at stream open, not audio. Capture
> volume was at maximum in both cases. So the internal mics are not merely
> deselected on the HDA codec; neither pin carries a working signal.
>
> For reference, the codec picks only a vendor-level fixup, not a
> board-specific one (this kernel is built without CONFIG_SND_DEBUG_VERBOSE=
,
> so the quirk name is stripped from the message):
>
>   snd_hda_codec_alc269 hdaudioC2D0: ALC245: picked fixup  for PCI SSID
>   1025:0000
>
> Already ruled out
> -----------------
> - Reproduces at raw ALSA (arecord), independent of PipeWire/WirePlumber.
>   No custom PipeWire/WirePlumber configuration is present.
>
> - Not a machine-match problem: the ACPI match succeeds, both platform
>   devices are created, and the DMI-derived card longname is correct.
>
> - Not UCM: alsa-ucm-conf ships a matching profile for this machine driver
>   (conf.d/acp-pdm-mach/acp-pdm-mach.conf), and the failure reproduces wit=
h
>   arecord on plughw directly, which does not go through UCM.
>
> - Not a muted or deselected input: capture gain was at maximum on both
>   cards, and both ALC245 internal-mic sources were explicitly selected
>   and tested.
>
> - Not a stale local override: the machine previously had an invalid
>   "options snd-hda-intel model=3Dalc245-acer" in /etc/modprobe.d. That fi=
le
>   was removed and the machine rebooted; all results above are from a
>   stock configuration, and nothing changed.
>
> - Mic-mute hardware is inert under Linux here: KEY_MICMUTE (248) and
>   KEY_F20 (190) are both absent from the "Acer WMI hotkeys" capability
>   bitmap, and no micmute LED class device exists. The device does report
>   KEY_WLAN, KEY_PROG1 and KEY_TOUCHPAD_TOGGLE, so the hotkey path itself
>   works. (This missing keymap entry looks like a separate acer-wmi gap
>   worth fixing independently.) The EC's own power-on state is not visible
>   from the OS, so this is not a formal proof -- but a muted DMIC would
>   give clean zeros, not a full-scale Nyquist square.
>
> Suggested fix
> -------------
> The mechanism needed appears to exist in-tree already. The ASUS ProArt
> PX13 series ("ASoC: amd: acp: PX13 ACP70 config and machine quirks",
> March 2026, merged via for-7.0) added a DMI-keyed override in
> snd_acp_config that redirects ACP70 boards away from the generic PDM
> machine-driver fallback onto the correct path for that board. That table
> is present in the running kernel -- the ASUS board string is visible in
> the module:
>
>   zstdcat /lib/modules/7.2.0-1-cachyos/kernel/sound/soc/amd/snd-acp-confi=
g.ko.zst
> | strings | grep HN7306EA
>
> There is simply no entry for this Acer board, so it falls through to
> acp-pdm-mach, which is evidently not how its DMICs are wired.
>
> Request: add an ACP70 config quirk entry for the Acer Nitro AN16S-61
> (DMI product "Nitro AN16S-61", board "EV3_SKF", ACP subsystem 1025:1874).
>
> What that entry should select is the open question, and I do not have
> enough information to answer it. Unlike the PX13, this board has no
> SoundWire codec, and the two internal DMIC pins declared on the ALC245
> are both silent. So the DMICs appear to be on neither a working PDM
> instance nor the HDA codec as currently configured. Possibilities:
>
>   - a different PDM controller instance than the fallback selects;
>   - missing PDM clock / decimation-ratio / gain init for ACP 7.0 on this
>     board (card 3 registering zero ALSA controls may be a symptom);
>   - an ACPI/_DSD-declared endpoint configuration the current code does
>     not honour.
>
> I am happy to test patches, apply debug printks, dump ACP registers, or
> provide any further logs on request. alsa-info.sh output can be supplied
> or uploaded on request -- I did not upload it pre-emptively.
>
> Thanks for looking at this.
