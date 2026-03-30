Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9475E33344A
	for <linux-sound@vger.kernel.org>; Mon, 30 Mar 2026 16:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774889466; cv=pass; b=dBG8VF+LtBV21b/iGeAhWelVTqt6UPUsUq2OLy7ZDu/yHe6rS/4XXBFRtGLXMSjUTJH+14DTKGlHANfsItSmCb2JzKdBR7XypO0UVOpHpoTbO/hcCBwrKPX1k4Rlsst7BGwYgz0d7ZRgojAlhe/qr5eg7+xBT1AebONYwNpokNk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774889466; c=relaxed/simple;
	bh=J5EilZ1/eFj2BSFF05MZPJf4LL6MdLRT9CtDOJfTQz4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Kmn3oE+WbOI4yHAwzNfGoy7VtciY8Hd7cindFIYCqGvEMjH9OZeWq15dn6+XYh8Gxc3Ed81MavTbii57Re8SNnKU1uNy1gShwe0oMHmV9ecaptyZGiWp+GAWyIMP/sfcM1ODn5Knm/UV1quHF108FrVLwrpRWH91UdH8JTg2hdU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HqWj7wQf; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HqWj7wQf"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-66c05fb27e4so1355997a12.2
        for <linux-sound@vger.kernel.org>; Mon, 30 Mar 2026 09:51:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774889463; cv=none;
        d=google.com; s=arc-20240605;
        b=FayruJ0gxbmUOo+pV3wgPPpVUTCZ3yW2SAaIYiXLqkWsgLHSYRGsAFiRlOBATaHhtU
         RFZmaDYk823DL+VZh50mDwPah58yyKFUz5rcioQNkwV624qzntJ1UEpKNm9SKIzZ4d3Q
         Z0TO6cBcM0tQzRjFzF17cdFQc39Y7Ah76RQHP8Ql2d0is5OgsZH+FcN1EQw+MFy1jqd4
         rfSAifPOGe3fGbdXXoEqL647/ACY3WKuEI0TwQvuELd0TFtyrz6vzCYMT0qXhqICoVCt
         Y68x6el420ABENYRFdNEBJ8m1wF4+rEgHyx0WH3udF923XQ0kKNPZkZJ7VcLg1SYvyRw
         dDSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=LFsloSOq/0KLPPquTt5VMdOtH57sPIJ+cq9WTm+T8yo=;
        fh=rKUy8rb93LKKZ0pa7pjPW+7ipFqiQv4UcQ8XKV1KKQU=;
        b=hUIn0l+C8y67kFpBpWcsoPpe1OANJgJLpMhasWHHMf/6JeTA9NYDQ2x7M6LF98NL5k
         6iJQhwQ1Q8KWQiwfzHr285gVaD+godr1hjdHP0P+dm2xiKSbsYiaD2BAzSlw58qgzvQo
         XQjYwyZymYb1l0On2/BTWvZRgdcWNHNeZCOExurmrfqMWlDXzlf9C40l0fF6XMOXsSPK
         1YrG+8hEJR/N6GJHSCpwaeK0/mp1+zThT6D2Cyq6Wx9mThEh5ejx2qmcWh/Bie3o6nFE
         3ksO81yb5KsSwMATepH2RpDgq+lXwzD19atiAwfE81JnOXNBxqMnaf5D5OKpLMzkLhYu
         8fOA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774889463; x=1775494263; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LFsloSOq/0KLPPquTt5VMdOtH57sPIJ+cq9WTm+T8yo=;
        b=HqWj7wQfRCHMppXCsNcwD/gaSL45rT/8xowcQxjdnuvlGZcbuNSuQO0Wss6jfUQQDp
         yuUUf/luS7WbXgLpCZ8yRVl7ZNsrVDbbpFGYWhKf7f25acxq8PG1Osw2AqvXyOqOH0PA
         h4F1AEH8uXT5LbfE4HSGuAHYa34dMTQNWzWvRE16+YA+Im2MYLs2NigBdpmt2YicGcNT
         yS1ii7wmHUV1UA923om9RHn3rmVr8+yg50gtNaVIzJeufIb7gP30vcimPoGEcOdh5JTP
         qUNU1z3DB+5mdBb/hu023oyQOAuHXOzjVJseks5xNX0AaQQui1i/Nv1x6MkHY6mVt25z
         xl0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774889463; x=1775494263;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LFsloSOq/0KLPPquTt5VMdOtH57sPIJ+cq9WTm+T8yo=;
        b=Gvfsud4KIu74StTckFC9HeJMaZ8shGERuvBZvY2THquAFMtrzDYwTPbaXqkVI4oCF+
         seL+zwINQ4vPkS0bhVhpwKWZ0N188ScqnVFmXFVw/isJYvLduYu1kKtmj7txxO8e08N+
         9wF4ouQwB2TALsydopvSTlBk2XNtnvoDmfAHAdD65sIE+ZQjNF2ft5/9Hf3PqYfU5apa
         V8JMDVXSEr/4nvzGwOUqxwDJs/tNpxNRxsZ27YkYrrakZzI4ats+mKMLBRwiZ6afMwo5
         dIwC1/hSMMa8mdiy5i43syP/1AOiUuHX6JBApET3FRmIoBgiAA4tt85VfYWtbWLkVaW4
         LTsg==
X-Gm-Message-State: AOJu0YyDz4JplnVt8CaWAbWsTNhfAaEHbYPgBtPCgPt2l1uOB1oXnbtd
	rEnhjnnzjOMDk6P2pr/Gs92Uk8X9UFkn8U3q9W7GxA3VZmpnNKm6J0sD6dFg9WEW/EKRZvn7xVQ
	EwwhQs9JMB6aWOb1Mmb6VC3LP6w/J2rQjnlduSUw=
X-Gm-Gg: ATEYQzwf4axTnxM6T4LFhLo9MKARj8WBvTpIe0jfLpxUjpuZrP1uQO6A+VNUvlY1+cy
	Fu3KJjforEa26bmWZfa7UHW7jyjR/ciRC4yESrKldvrekXHmC4QDTi6YuPGBFKGJYtM32fz7wPh
	vB5yQPo+JCEDnRxQx4wDeBXwTwwUjG+jYiCFd2qjISZTlJX2estUCk4RjDzEtxVokbWwHTdM8R4
	lMB901xDW6t4dZVPV8jSV0RC7fQK1Y5zaUfL+vFl1RblVx/kxXaGfzKzh4ws7QzCmQaxm2c+e0V
	PziaiGr6wkbgLkesWHv3M9kNuCVjdYJGW/oeTSFrSB2H/GzD2Kz/DtCbERkDm3KwYcDVS2tIwjf
	hD7gy
X-Received: by 2002:a17:906:ee84:b0:b98:32c1:249b with SMTP id
 a640c23a62f3a-b9b502bd39amr839198566b.8.1774889462676; Mon, 30 Mar 2026
 09:51:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Alessandro Mele <alessandro.mele.0808@gmail.com>
Date: Mon, 30 Mar 2026 18:50:51 +0200
X-Gm-Features: AQROBzCpDgc1kQ7ykRlmv_U2DQBdMdgNbYdWciEpetUaCcNQ38KUlhyPBIiVIPE
Message-ID: <CAFNA5ZtfPCxLEhmaAxnvuV+ZsCR9GN-QDw8NsMekA1Nr4Kz0iw@mail.gmail.com>
Subject: HP ENVY Laptop 15-ep0xxx top speakers (B&O soundbar) are silent under Linux.
To: tiwai@suse.de
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

[1.] One line summary of the problem:
HP ENVY Laptop 15-ep0xxx top speakers (B&O soundbar) are silent under Linux.

[2.] Full description of the problem/report:
I am a regular Linux user without kernel development experience or
much technical knowledge at all.

My laptop has 4 speakers: 2 on the bottom corners and 2
on either side of the keyboard (two B&O soundbar strips). The bottom
speakers work fine
but the top speakers produce no sound at all under Linux.

I noticed in the system log (dmesg) this line which was pointed out to
me as potentially relevant by someone helping me troubleshoot, but I do
not fully understand it myself:

  snd_hda_codec_alc269 ehdaudio0D0: ALC245: picked fixup for PCI SSID 103c:0000

I am reporting it in case it is useful to a developer. I am happy to
run any commands and provide any additional output that might help
diagnose the issue.
[3.] Keywords:
ALSA, HDA, ALC245, Realtek, HP ENVY, SOF, sof-hda-dsp, speaker, quirk

[4.1.] Kernel version (from /proc/version):
6.19.10-202.nobara.fc43.x86_64

[4.2.] Kernel .config file:
Not available.

[5.] Most recent kernel version which did not have the bug:
Unknown - this laptop has always had this issue under Linux.

[6.] Output of Oops.. message (if applicable):
N/A

[7.] A small shell script or example program which triggers the problem:
N/A - bug is present on every boot. Top speakers produce no sound.

[8.1.] Software:
Distro: Nobara Linux 43 (Fedora 43 based)
BIOS:   Insyde F.18

[8.2.] Processor information:
Intel Comet Lake (from PCI: sof-audio-pci-intel-cnl)

[8.5.] PCI information (relevant entries):
00:1f.3 Multimedia audio controller: Intel Corporation Comet Lake PCH cAVS
01:00.1 Audio device: NVIDIA Corporation TU106 High Definition Audio Controller

[8.7.] Other information:

Codec: Realtek ALC245
Vendor Id: 0x10ec0245
Subsystem Id: 0x103c878e
Revision Id: 0x100001

dmesg output (audio-related):
[6.034094] snd_hda_codec_alc269 ehdaudio0D0: ALC245: picked fixup for
PCI SSID 103c:0000
[6.034486] snd_hda_codec_alc269 ehdaudio0D0: autoconfig for ALC245:
line_outs=1 (0x17/0x0/0x0/0x0/0x0) type:speaker
[6.034489] snd_hda_codec_alc269 ehdaudio0D0:    speaker_outs=0
(0x0/0x0/0x0/0x0/0x0)
[6.034490] snd_hda_codec_alc269 ehdaudio0D0:    hp_outs=1 (0x21/0x0/0x0/0x0/0x0)

Full codec dump (/proc/asound/card1/codec#0):
Codec: Realtek ALC245
Address: 0
AFG Function Id: 0x1 (unsol 1)
Vendor Id: 0x10ec0245
Subsystem Id: 0x103c878e
Revision Id: 0x100001
No Modem Function Group found
Default PCM:
   rates [0x560]: 44100 48000 96000 192000
   bits [0xe]: 16 20 24
   formats [0x1]: PCM
Default Amp-In caps: N/A
Default Amp-Out caps: N/A
State of AFG node 0x01:
 Power states:  D0 D1 D2 D3 D3cold CLKSTOP EPSS
 Power: setting=D0, actual=D0
GPIO: io=3, o=0, i=0, unsolicited=1, wake=0
 IO[0]: enable=0, dir=0, wake=0, sticky=0, data=0, unsol=0
 IO[1]: enable=0, dir=0, wake=0, sticky=0, data=0, unsol=0
 IO[2]: enable=0, dir=0, wake=0, sticky=0, data=0, unsol=0
Node 0x02 [Audio Output] wcaps 0x41d: Stereo Amp-Out
 Control: name="Headphone Playback Volume", index=0, device=0
   ControlAmp: chs=3, dir=Out, idx=0, ofs=0
 Amp-Out caps: ofs=0x57, nsteps=0x57, stepsize=0x02, mute=0
 Amp-Out vals:  [0x34 0x34]
 Converter: stream=0, channel=0
 PCM:
   rates [0x40]: 48000
   bits [0xe]: 16 20 24
   formats [0x1]: PCM
 Power states:  D0 D1 D2 D3 EPSS
 Power: setting=D0, actual=D0
Node 0x03 [Audio Output] wcaps 0x41d: Stereo Amp-Out
 Control: name="Speaker Playback Volume", index=0, device=0
   ControlAmp: chs=3, dir=Out, idx=0, ofs=0
 Amp-Out caps: ofs=0x57, nsteps=0x57, stepsize=0x02, mute=0
 Amp-Out vals:  [0x51 0x51]
 Converter: stream=0, channel=0
 PCM:
   rates [0x40]: 48000
   bits [0xe]: 16 20 24
   formats [0x1]: PCM
 Power states:  D0 D1 D2 D3 EPSS
 Power: setting=D0, actual=D0
Node 0x04 [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x05 [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x06 [Audio Output] wcaps 0x411: Stereo
 Converter: stream=0, channel=0
 PCM:
   rates [0x40]: 48000
   bits [0xe]: 16 20 24
   formats [0x1]: PCM
 Power states:  D0 D1 D2 D3 EPSS
 Power: setting=D0, actual=D0
Node 0x07 [Audio Input] wcaps 0x10051b: Stereo Amp-In
 Amp-In caps: ofs=0x17, nsteps=0x3f, stepsize=0x02, mute=1
 Amp-In vals:  [0x97 0x97]
 Converter: stream=0, channel=0
 SDI-Select: 0
 PCM:
   rates [0x40]: 48000
   bits [0xe]: 16 20 24
   formats [0x1]: PCM
 Power states:  D0 D1 D2 D3 EPSS
 Power: setting=D0, actual=D0
 Connection: 1
    0x24
Node 0x08 [Audio Input] wcaps 0x10051b: Stereo Amp-In
 Control: name="Capture Volume", index=0, device=0
   ControlAmp: chs=3, dir=In, idx=0, ofs=0
 Control: name="Capture Switch", index=0, device=0
   ControlAmp: chs=3, dir=In, idx=0, ofs=0
 Amp-In caps: ofs=0x17, nsteps=0x3f, stepsize=0x02, mute=1
 Amp-In vals:  [0x26 0x26]
 Converter: stream=0, channel=0
 SDI-Select: 0
 PCM:
   rates [0x560]: 44100 48000 96000 192000
   bits [0xe]: 16 20 24
   formats [0x1]: PCM
 Power states:  D0 D1 D2 D3 EPSS
 Power: setting=D0, actual=D0
 Connection: 1
    0x23
Node 0x09 [Audio Input] wcaps 0x10051b: Stereo Amp-In
 Amp-In caps: ofs=0x17, nsteps=0x3f, stepsize=0x02, mute=1
 Amp-In vals:  [0x97 0x97]
 Converter: stream=0, channel=0
 SDI-Select: 0
 PCM:
   rates [0x560]: 44100 48000 96000 192000
   bits [0xe]: 16 20 24
   formats [0x1]: PCM
 Power states:  D0 D1 D2 D3 EPSS
 Power: setting=D0, actual=D0
 Connection: 1
    0x22
Node 0x0a [Audio Input] wcaps 0x10051b: Stereo Amp-In
 Amp-In caps: ofs=0x17, nsteps=0x3f, stepsize=0x02, mute=1
 Amp-In vals:  [0x97 0x97]
 Converter: stream=0, channel=0
 SDI-Select: 0
 PCM:
   rates [0x40]: 48000
   bits [0xe]: 16 20 24
   formats [0x1]: PCM
 Power states:  D0 D1 D2 D3 EPSS
 Power: setting=D0, actual=D0
 Connection: 1
    0x25
Node 0x0b [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x0c [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x0d [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x0e [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x0f [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x10 [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x11 [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x12 [Pin Complex] wcaps 0x40040b: Stereo Amp-In
 Amp-In caps: ofs=0x00, nsteps=0x03, stepsize=0x27, mute=0
 Amp-In vals:  [0x00 0x00]
 Pincap 0x00000020: IN
 Pin Default 0x411111f0: [N/A] Speaker at Ext Rear
   Conn = 1/8, Color = Black
   DefAssociation = 0xf, Sequence = 0x0
   Misc = NO_PRESENCE
 Pin-ctls: 0x00:
 Power states:  D0 D1 D2 D3 EPSS
 Power: setting=D0, actual=D0
Node 0x13 [Pin Complex] wcaps 0x40040b: Stereo Amp-In
 Amp-In caps: ofs=0x00, nsteps=0x03, stepsize=0x27, mute=0
 Amp-In vals:  [0x00 0x00]
 Pincap 0x00000020: IN
 Pin Default 0x40000000: [N/A] Line Out at Ext N/A
   Conn = Unknown, Color = Unknown
   DefAssociation = 0x0, Sequence = 0x0
 Pin-ctls: 0x00:
 Power states:  D0 D1 D2 D3 EPSS
 Power: setting=D0, actual=D0
Node 0x14 [Pin Complex] wcaps 0x40058d: Stereo Amp-Out
 Amp-Out caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
 Amp-Out vals:  [0x80 0x80]
 Pincap 0x00010014: OUT EAPD Detect
 EAPD 0x2: EAPD
 Pin Default 0x411111f0: [N/A] Speaker at Ext Rear
   Conn = 1/8, Color = Black
   DefAssociation = 0xf, Sequence = 0x0
   Misc = NO_PRESENCE
 Pin-ctls: 0x00:
 Unsolicited: tag=00, enabled=0
 Power states:  D0 D1 D2 D3 EPSS
 Power: setting=D0, actual=D0
 Connection: 1
    0x02
Node 0x15 [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x16 [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x17 [Pin Complex] wcaps 0x40058d: Stereo Amp-Out
 Control: name="Speaker Playback Switch", index=0, device=0
   ControlAmp: chs=3, dir=Out, idx=0, ofs=0
 Amp-Out caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
 Amp-Out vals:  [0x00 0x00]
 Pincap 0x0000001c: OUT HP Detect
 Pin Default 0x90170180: [Fixed] Speaker at Int N/A
   Conn = Analog, Color = Unknown
   DefAssociation = 0x8, Sequence = 0x0
   Misc = NO_PRESENCE
 Pin-ctls: 0x40: OUT
 Unsolicited: tag=00, enabled=0
 Power states:  D0 D1 D2 D3 EPSS
 Power: setting=D0, actual=D0
 Connection: 4
    0x02 0x03* 0x06 0x08
Node 0x18 [Pin Complex] wcaps 0x40048b: Stereo Amp-In
 Amp-In caps: ofs=0x00, nsteps=0x03, stepsize=0x27, mute=0
 Amp-In vals:  [0x00 0x00]
 Pincap 0x00000024: IN Detect
 Pin Default 0x411111f0: [N/A] Speaker at Ext Rear
   Conn = 1/8, Color = Black
   DefAssociation = 0xf, Sequence = 0x0
   Misc = NO_PRESENCE
 Pin-ctls: 0x00:
 Unsolicited: tag=00, enabled=0
 Power states:  D0 D1 D2 D3 EPSS
 Power: setting=D0, actual=D0
Node 0x19 [Pin Complex] wcaps 0x40048b: Stereo Amp-In
 Control: name="Mic Boost Volume", index=0, device=0
   ControlAmp: chs=3, dir=In, idx=0, ofs=0
 Amp-In caps: ofs=0x00, nsteps=0x03, stepsize=0x27, mute=0
 Amp-In vals:  [0x00 0x00]
 Pincap 0x00003724: IN Detect
   Vref caps: HIZ 50 GRD 80 100
 Pin Default 0x04a11040: [Jack] Mic at Ext Right
   Conn = 1/8, Color = Black
   DefAssociation = 0x4, Sequence = 0x0
 Pin-ctls: 0x24: IN VREF_80
 Unsolicited: tag=02, enabled=1
 Power states:  D0 D1 D2 D3 EPSS
 Power: setting=D0, actual=D0
Node 0x1a [Pin Complex] wcaps 0x40048b: Stereo Amp-In
 Amp-In caps: ofs=0x00, nsteps=0x03, stepsize=0x27, mute=0
 Amp-In vals:  [0x00 0x00]
 Pincap 0x00003724: IN Detect
   Vref caps: HIZ 50 GRD 80 100
 Pin Default 0x411111f0: [N/A] Speaker at Ext Rear
   Conn = 1/8, Color = Black
   DefAssociation = 0xf, Sequence = 0x0
   Misc = NO_PRESENCE
 Pin-ctls: 0x00: VREF_HIZ
 Unsolicited: tag=00, enabled=0
 Power states:  D0 D1 D2 D3 EPSS
 Power: setting=D0, actual=D0
Node 0x1b [Pin Complex] wcaps 0x40058f: Stereo Amp-In Amp-Out
 Amp-In caps: ofs=0x00, nsteps=0x03, stepsize=0x27, mute=0
 Amp-In vals:  [0x00 0x00]
 Amp-Out caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
 Amp-Out vals:  [0x80 0x80]
 Pincap 0x00013734: IN OUT EAPD Detect
   Vref caps: HIZ 50 GRD 80 100
 EAPD 0x2: EAPD
 Pin Default 0x411111f0: [N/A] Speaker at Ext Rear
   Conn = 1/8, Color = Black
   DefAssociation = 0xf, Sequence = 0x0
   Misc = NO_PRESENCE
 Pin-ctls: 0x00: VREF_HIZ
 Unsolicited: tag=00, enabled=0
 Power states:  D0 D1 D2 D3 EPSS
 Power: setting=D0, actual=D0
 Connection: 2
    0x02* 0x03
Node 0x1c [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x1d [Pin Complex] wcaps 0x400400: Mono
 Pincap 0x00000020: IN
 Pin Default 0x40600001: [N/A] Modem Line at Ext N/A
   Conn = Unknown, Color = Unknown
   DefAssociation = 0x0, Sequence = 0x1
 Pin-ctls: 0x20: IN
 Power states:  D0 D1 D2 D3 EPSS
 Power: setting=D0, actual=D0
Node 0x1e [Pin Complex] wcaps 0x400501: Stereo
 Pincap 0x00000010: OUT
 Pin Default 0x411111f0: [N/A] Speaker at Ext Rear
   Conn = 1/8, Color = Black
   DefAssociation = 0xf, Sequence = 0x0
   Misc = NO_PRESENCE
 Pin-ctls: 0x40: OUT
 Power states:  D0 D1 D2 D3 EPSS
 Power: setting=D0, actual=D0
 Connection: 1
    0x06
Node 0x1f [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x20 [Vendor Defined Widget] wcaps 0xf00040: Mono
 Processing caps: benign=0, ncoeff=142
Node 0x21 [Pin Complex] wcaps 0x40058d: Stereo Amp-Out
 Control: name="Headphone Playback Switch", index=0, device=0
   ControlAmp: chs=3, dir=Out, idx=0, ofs=0
 Amp-Out caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
 Amp-Out vals:  [0x80 0x80]
 Pincap 0x0001001c: OUT HP EAPD Detect
 EAPD 0x2: EAPD
 Pin Default 0x04211020: [Jack] HP Out at Ext Right
   Conn = 1/8, Color = Black
   DefAssociation = 0x2, Sequence = 0x0
 Pin-ctls: 0xc0: OUT HP
 Unsolicited: tag=01, enabled=1
 Power states:  D0 D1 D2 D3 EPSS
 Power: setting=D0, actual=D0
 Connection: 2
    0x02* 0x03
Node 0x22 [Audio Mixer] wcaps 0x20010b: Stereo Amp-In
 Amp-In caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
 Amp-In vals:  [0x80 0x80] [0x80 0x80] [0x80 0x80] [0x80 0x80] [0x80 0x80]
 Connection: 5
    0x19 0x1a 0x1b 0x1d 0x13
Node 0x23 [Audio Mixer] wcaps 0x20010b: Stereo Amp-In
 Amp-In caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
 Amp-In vals:  [0x00 0x00] [0x80 0x80] [0x80 0x80] [0x80 0x80] [0x80 0x80]
 Connection: 5
    0x19 0x1a 0x1b 0x1d 0x12
Node 0x24 [Audio Selector] wcaps 0x300101: Stereo
 Connection: 3
    0x12* 0x13 0x18
Node 0x25 [Audio Selector] wcaps 0x300101: Stereo
 Connection: 2
    0x12* 0x13


[X.] Other notes:
A similar issue was fixed for HP Envy x360 13-ar0xxx (103c:85de, ALC285)
via commit c062166995c9. That fix activated B&O soundbar speakers between
the lid and keyboard - the same symptom as this report.

Thank you for your time and attention.
Kind regards,
Alessandro Mele
