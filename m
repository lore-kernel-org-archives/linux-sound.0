Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795678735;
	b=4/WO6F8aJwbRJsLwa+riKTIbb77dm1ukZAcGujTn7K/p3mcg4NSoUXivd6noflA7W+5i
	 Hk/+ZxTBWTZhHCIqsxDP3pdyvCOekPXN3QS+EyvjaYPgZeU7YEeGPpWuF5kLihQJKRZdG
	 mGgalyy0mVNgyvdbsQjun8A0MJj4r4dn9eKJSoKDorYRKSkp+yUbXhg1S8VeDTVHJOe93
	 OsALuTImIwtLxytHtoCeFmkDQyJFtCf+1NSU1UGm0AdZkOtnqLKZJ8lniQf+LtxIL9kEs
	 vfqH0+9pDgCsr8jVDF3bm01cZyV1JGvvQLXLHoRmhg/QNM7lLzKvaZH8QcI9Kueno7g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795678735;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Content-Type:Content-Transfer-Encoding;
	bh=weIG7gj6LW/JNMRsx8MpzybnF6HLQu5qJLDoyOk7TzQ=;
	b=IIFGkKrJ82juVKJ6eYFvPo/QuczHDY/D+vGTdj8pFyQSJ/jWGU/hCAg1sIl9L03gdoy7
	 pv7zRudMt945/9oNixtx8OO2RaSBgEQkqYV6z8qUv9Ye4r/7LgKLllh70fAj1MlM1iWzo
	 R7/Y64/lQ8/KoFpFFIu8SHd7IAr3WMYlFk5fjIG81ZMoaComxJ40rByM3IS63DvouCLVn
	 aVpOr2F50bcLUxyklEQz+54DzrAekHaJAgBiiWQKhPDEgJSzccVnBLm0PTBcM+Rfk6/SX
	 FNpLQnRp0M87/oma1Y5fem1mUpnaI3vQz4gwP5Lwl1uHfqBJiQZXABK5jf4WMrQSLbA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cPDDSZPb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE92606A31C
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 07:38:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AE92606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cPDDSZPb
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2f03f3631b2so36176945ad.2
        for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 23:38:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795678734; cv=none;
        d=google.com; s=arc-20260327;
        b=FeM4QArsL25i3Reug9eyxgyJSwHrP5rQo8+ar4g1VDYDvwaxm45LZJ/Iq08zYzyWCa
         YprJvHnmUJX6BrBrj8mDWoCSFxOg/tJviEII6IKAQY52oEpVvpf5Hd8DMZp1hvJ6X1QI
         a+3YpKgrIvZ0IMmcB1yEocdt/W8YCqkptbBVdxDVVMNaupVWgmxRZEbaKyLjTXPfuUW3
         se2azs+EUZS1BzcRniIGFSqfLwmC7b7mspUVm6E46A5QEAD6FyEQFhAUHPVZdUxZpSwD
         deECS7mSDMMb6ipgUObuJSUsqc6BFvUpC1s4kWX6m3Ws9MAnl4Q720nMhUr9VNyeSSWi
         4uVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=weIG7gj6LW/JNMRsx8MpzybnF6HLQu5qJLDoyOk7TzQ=;
        fh=7xL33lZ3DZeA6adqGVHVFCb+oWnTbg0PgQbJ47YnPsI=;
        b=sLi/exDX4zoihTyktKYEPEZIj7pjBlGqcOGqvWnAvsokkI4qpExluyOmw0TsGo2VBu
         6ZpSfHzDhdWIcATkAiAeEafGroQmdmKxVmtznf+oNi0mL1hjhNmgbIyYmH0X6N7vjyUK
         AzGEL1bbNvPXMoM4Qbx56EH18XV6HcqqO9h4evSIvLdVgKNfQTiyKT21ZbjxW+SndUc3
         mFe7X8SmIJ1oPWQ8jHM9gKUF5tpYsOmy6BiE1yeXtp9Pec/iGpo1FA0nume11jeIyjFU
         LiSM0lbFHcRFCfb0UuE2JX6/C27AAwJnAtSbHzUtY2OFWhHC2XqbSfKliG2Ve/UX4a2/
         Jllw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795678734; x=1796283534; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=weIG7gj6LW/JNMRsx8MpzybnF6HLQu5qJLDoyOk7TzQ=;
        b=cPDDSZPbRSTMZDTfkSWiHDngt46OzwmHG5WTuU/9oHWsU5fvb+9H8k73RSu5aO7xO7
         WEsv64xHbzRNb5o6hSFiOcMSSe3mrAwrjcW63bbbj9qtekNJ6mEvN772kiFmBEAtu8OU
         z+Qbldj2mbASiC1FRSiTIs+0qLoz2OrsaUQfu/8FehmqGCG2IHJjBoPAhqbpDffQXPBV
         Bs9FsxMa4udeE47cdlyBBtcad2yI/H8GoV3GEVhvCGJt0QlaEsAXSN8VuZ1CTkp6BiTf
         hpOVbMhKQhdzcMi99vUksSUD5kvhMm3xDNYATjNWGZcDGAuTJj4XsxSgmZKHNJ+6+lXF
         udJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795678734; x=1796283534;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=weIG7gj6LW/JNMRsx8MpzybnF6HLQu5qJLDoyOk7TzQ=;
        b=pcrDpw1BU2bLJMtfT6S+Vl8DqA3srf5dG+rOHH3gsZuOuAC/M9+TcXzOcta2YrMjPD
         +7KMg5QgrIe8OeRQx9Xdc/2dIQEkoQlJ4uVftfqn1zGLzE6NCRfxH1CaLeS8no0NY2rn
         FsdzQyHfqKVOhQqlPEOe5CVG7M+8GBGO7/BxUawTvbh19N/yzY4nyoh09ivZEu9UWc10
         hdavyscAKXwrHmx2WQhDhUsx89IHhCthRq+eJnQB6HD4yCGdYY4GkRBq3CH1EKr/xRRJ
         XG7nC/D9yWwJ9Vk3V5wLb53V7O4yzWTw/MGcKMS4n4CIN1pK9/WsNzDaCBsvlob7eMqT
         eeyA==
X-Gm-Message-State: APuU4Z/P5My1Rvh5yM+jqwoKznSTXV9R4sGD79Ctia8weK7oc/XQJ2Ql
	QNWaDkU2R+TBzB0P7FQc4XluIZ6TbZR+3rBO5evhxco7oR1BY+Ik+isGUAMkwfQgPX+7hDtNaDP
	tpXvOLouI6S02wUFVwFqSstjbJutm6o8dFaO8
X-Gm-Gg: AZFdTZev5GcFY00vbu+f9w29Mh4PITcwdiJA19X4HWTj8Z3Wud5NhsnawrXEbYpm4Xs
	1VFkqeLA/EKCdNGUJPBkRKkWxoU0EJ2CBxFrZsg8hd/ND3y5E76Sl2xmmllgrikTVmx1JHg90xl
	Qw63oCuSTTX7Xavc592LiRrjSeCz5BaLDtwUeu0/g/heXWLPXLDnS6HF8aguVVMBSEczDNEXEFZ
	vUh74KoyxW99vGQ4XgvVAmnW4d97yYbQ5pLHevEckOWo1cdxnlEeetZAAllq2KtybjRB+WMTDlA
	bfPIdm9CnnjkKqQdYX0CqwEukNjPiGOFr3+e1LHrIhhLg9DR0VDfMOMN5H7fkdM8j/WpUcKrI5r
	jIxe6ncgH1T7UENXdwtxv7eDdMh6T1zwnSVaVJV/IBboCloiJyGHUVdTrBtAAaHsD5kty/AAJhr
	ZQEP1c2jLfnfhM+qo/TNmKT4FCrso2/tPZqEaTk6N6s1uFabV2RhbeakXHvdBjcmGOiWMaD1Sv7
	de9A+iZCgB9jRLwFQOQPOg15We7s8Ua6ApxUB9Oqg==
X-Received: by 2002:a17:903:2f90:b0:2e8:422e:19c5 with SMTP id
 d9443c01a7336-2f03f249c41mr198634445ad.55.1795678734313; Wed, 25 Nov 2026
 23:38:54 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAM8-Xq_80fp-Tv4R5aoyKtVhH8On=TMOxZY66goYtQDP9o1XDA@mail.gmail.com>
In-Reply-To: <CAM8-Xq_80fp-Tv4R5aoyKtVhH8On=TMOxZY66goYtQDP9o1XDA@mail.gmail.com>
From: dahmane dahim <dahmanedahim04@gmail.com>
Date: Thu, 26 Nov 2026 08:38:17 +0100
X-Gm-Features: Aa3M54qqC_WR1anPiXFE8tbE6_7xuBTwofFpv3BrCHENInq8Aejx-fedawoJCkY
Message-ID: <CAM8-Xq8EiNkdpcv=qeYHLfkf8Uzxzm8rYQc2z=D8gPDqk5f8BQ@mail.gmail.com>
Subject: Re: ALSA: hda/conexant: HUAWEI HKD-WXX (152d:1350) speakers driven by
 headphone amp
To: linux-sound@vger.kernel.org, tiwai@suse.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Follow-up on my earlier report (HUAWEI HKD-WXX, subsystem 152d:1350).

Codec: Conexant CX11880
Address: 0
AFG Function Id: 0x1 (unsol 1)
Vendor Id: 0x14f11f86
Subsystem Id: 0x152d1350
Revision Id: 0x100100
No Modem Function Group found
Default PCM:
    rates [0x540]: 48000 96000 192000
    bits [0xa]: 16 24
    formats [0x1]: PCM
Default Amp-In caps: N/A
Default Amp-Out caps: N/A
State of AFG node 0x01:
  Power states:  D0 D1 D2 D3 D3cold S3D3cold CLKSTOP EPSS
  Power: setting=3DD0, actual=3DD0
GPIO: io=3D5, o=3D0, i=3D0, unsolicited=3D1, wake=3D1
  IO[0]: enable=3D0, dir=3D0, wake=3D0, sticky=3D0, data=3D0, unsol=3D0
  IO[1]: enable=3D0, dir=3D0, wake=3D0, sticky=3D0, data=3D0, unsol=3D0
  IO[2]: enable=3D0, dir=3D0, wake=3D0, sticky=3D0, data=3D0, unsol=3D0
  IO[3]: enable=3D0, dir=3D0, wake=3D0, sticky=3D0, data=3D0, unsol=3D0
  IO[4]: enable=3D0, dir=3D0, wake=3D0, sticky=3D0, data=3D0, unsol=3D0
Node 0x10 [Audio Output] wcaps 0xc1d: Stereo Amp-Out R/L
  Control: name=3D"Master Playback Volume", index=3D0, device=3D0
    ControlAmp: chs=3D3, dir=3DOut, idx=3D0, ofs=3D0
  Control: name=3D"Master Playback Switch", index=3D0, device=3D0
    ControlAmp: chs=3D3, dir=3DOut, idx=3D0, ofs=3D0
  Amp-Out caps: ofs=3D0x4a, nsteps=3D0x4a, stepsize=3D0x03, mute=3D1
  Amp-Out vals:  [0x3a 0x3a]
  Converter: stream=3D0, channel=3D0
  PCM:
    rates [0x540]: 48000 96000 192000
    bits [0xa]: 16 24
    formats [0x1]: PCM
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=3DD0, actual=3DD0
Node 0x11 [Audio Output] wcaps 0xc1d: Stereo Amp-Out R/L
  Amp-Out caps: ofs=3D0x4a, nsteps=3D0x4a, stepsize=3D0x03, mute=3D1
  Amp-Out vals:  [0x0e 0x0e]
  Converter: stream=3D0, channel=3D0
  PCM:
    rates [0x540]: 48000 96000 192000
    bits [0xa]: 16 24
    formats [0x1]: PCM
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=3DD0, actual=3DD0
Node 0x12 [Beep Generator Widget] wcaps 0x70000c: Mono Amp-Out
  Control: name=3D"Beep Playback Volume", index=3D0, device=3D0
    ControlAmp: chs=3D1, dir=3DOut, idx=3D0, ofs=3D0
  Control: name=3D"Beep Playback Switch", index=3D0, device=3D0
    ControlAmp: chs=3D1, dir=3DOut, idx=3D0, ofs=3D0
  Amp-Out caps: ofs=3D0x07, nsteps=3D0x07, stepsize=3D0x0f, mute=3D0
  Amp-Out vals:  [0x03]
Node 0x13 [Audio Input] wcaps 0x100d1b: Stereo Amp-In R/L
  Control: name=3D"Capture Volume", index=3D0, device=3D0
    ControlAmp: chs=3D3, dir=3DIn, idx=3D1, ofs=3D0
  Control: name=3D"Capture Switch", index=3D0, device=3D0
    ControlAmp: chs=3D3, dir=3DIn, idx=3D1, ofs=3D0
  Amp-In caps: ofs=3D0x4a, nsteps=3D0x50, stepsize=3D0x03, mute=3D1
  Amp-In vals:  [0x80 0x80] [0x50 0x50] [0x80 0x80] [0x80 0x80]
  Converter: stream=3D0, channel=3D0
  SDI-Select: 0
  PCM:
    rates [0x540]: 48000 96000 192000
    bits [0xa]: 16 24
    formats [0x1]: PCM
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=3DD0, actual=3DD0
  Connection: 4
     0x18 0x19* 0x1a 0x15
Node 0x14 [Audio Input] wcaps 0x100d1b: Stereo Amp-In R/L
  Amp-In caps: ofs=3D0x4a, nsteps=3D0x50, stepsize=3D0x03, mute=3D1
  Amp-In vals:  [0x4a 0x4a] [0x4a 0x4a]
  Converter: stream=3D0, channel=3D0
  SDI-Select: 0
  PCM:
    rates [0x540]: 48000 96000 192000
    bits [0xa]: 16 24
    formats [0x1]: PCM
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=3DD0, actual=3DD0
  Connection: 2
     0x1a* 0x15
Node 0x15 [Vendor Defined Widget] wcaps 0xf0050b: Stereo Amp-In
  Amp-In caps: ofs=3D0x4a, nsteps=3D0x4a, stepsize=3D0x03, mute=3D1
  Amp-In vals:  [0x4a 0x4a] [0x4a 0x4a]
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=3DD0, actual=3DD0
  Connection: 2
     0x10* 0x11
Node 0x16 [Pin Complex] wcaps 0x400581: Stereo
  Pincap 0x0001001c: OUT HP EAPD Detect
  EAPD 0x2: EAPD
  Pin Default 0x03211040: [Jack] HP Out at Ext Left
    Conn =3D 1/8, Color =3D Black
    DefAssociation =3D 0x4, Sequence =3D 0x0
  Pin-ctls: 0x40: OUT
  Unsolicited: tag=3D02, enabled=3D1
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=3DD0, actual=3DD0
  Connection: 2
     0x10* 0x11
Node 0x17 [Pin Complex] wcaps 0x400501: Stereo
  Pincap 0x00010010: OUT EAPD
  EAPD 0x2: EAPD
  Pin Default 0x91170110: [Fixed] Speaker at Int Rear
    Conn =3D Analog, Color =3D Unknown
    DefAssociation =3D 0x1, Sequence =3D 0x0
    Misc =3D NO_PRESENCE
  Pin-ctls: 0x40: OUT
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=3DD0, actual=3DD0
  Connection: 2
     0x10 0x11*
Node 0x18 [Pin Complex] wcaps 0x40048b: Stereo Amp-In
  Amp-In caps: ofs=3D0x00, nsteps=3D0x03, stepsize=3D0x2f, mute=3D0
  Amp-In vals:  [0x00 0x00]
  Pincap 0x00001324: IN Detect
    Vref caps: HIZ 50 80
  Pin Default 0x40f001f0: [N/A] Other at Ext N/A
    Conn =3D Unknown, Color =3D Unknown
    DefAssociation =3D 0xf, Sequence =3D 0x0
    Misc =3D NO_PRESENCE
  Pin-ctls: 0x00: VREF_HIZ
  Unsolicited: tag=3D00, enabled=3D0
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=3DD0, actual=3DD0
Node 0x19 [Pin Complex] wcaps 0x40048b: Stereo Amp-In
  Control: name=3D"Mic Boost Volume", index=3D0, device=3D0
    ControlAmp: chs=3D3, dir=3DIn, idx=3D0, ofs=3D0
  Amp-In caps: ofs=3D0x00, nsteps=3D0x03, stepsize=3D0x2f, mute=3D0
  Amp-In vals:  [0x03 0x03]
  Pincap 0x00001324: IN Detect
    Vref caps: HIZ 50 80
  Pin Default 0x03a11030: [Jack] Mic at Ext Left
    Conn =3D 1/8, Color =3D Black
    DefAssociation =3D 0x3, Sequence =3D 0x0
  Pin-ctls: 0x20: IN VREF_HIZ
  Unsolicited: tag=3D01, enabled=3D1
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=3DD0, actual=3DD0
Node 0x1a [Pin Complex] wcaps 0x40048b: Stereo Amp-In
  Amp-In caps: ofs=3D0x00, nsteps=3D0x03, stepsize=3D0x2f, mute=3D0
  Amp-In vals:  [0x00 0x00]
  Pincap 0x00000024: IN Detect
  Pin Default 0x40f001f0: [N/A] Other at Ext N/A
    Conn =3D Unknown, Color =3D Unknown
    DefAssociation =3D 0xf, Sequence =3D 0x0
    Misc =3D NO_PRESENCE
  Pin-ctls: 0x00:
  Unsolicited: tag=3D00, enabled=3D0
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=3DD0, actual=3DD0
Node 0x1b [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x1c [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x1d [Vendor Defined Widget] wcaps 0xf0058b: Stereo Amp-In
  Amp-In caps: N/A
  Amp-In vals:
  Unsolicited: tag=3D00, enabled=3D0
  Power states:
  Power: setting=3DD0, actual=3DD0
  Connection: 0
Node 0x1e [Vendor Defined Widget] wcaps 0xf0058b: Stereo Amp-In
  Amp-In caps: N/A
  Amp-In vals:
  Unsolicited: tag=3D00, enabled=3D0
  Power states:
  Power: setting=3DD0, actual=3DD0
  Connection: 0
Node 0x1f [Vendor Defined Widget] wcaps 0xf0058b: Stereo Amp-In
  Amp-In caps: N/A
  Amp-In vals:
  Unsolicited: tag=3D00, enabled=3D0
  Power states:
  Power: setting=3DD0, actual=3DD0
  Connection: 0
Node 0x20 [Audio Output] wcaps 0x611: Stereo Digital
  Converter: stream=3D0, channel=3D0
  Digital:
  Digital category: 0x0
  IEC Coding Type: 0x0
  PCM:
    rates [0x540]: 48000 96000 192000
    bits [0xe]: 16 20 24
    formats [0x5]: PCM AC3
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=3DD0, actual=3DD0
Node 0x21 [Pin Complex] wcaps 0x400701: Stereo Digital
  Pincap 0x00000010: OUT
  Pin Default 0x40f001f0: [N/A] Other at Ext N/A
    Conn =3D Unknown, Color =3D Unknown
    DefAssociation =3D 0xf, Sequence =3D 0x0
    Misc =3D NO_PRESENCE
  Pin-ctls: 0x00:
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=3DD0, actual=3DD0
  Connection: 1
     0x20

A pin override makes the speakers work:
  0x16 0x90170110  (Speaker, Internal)
  0x17 0x411111f0  (Not connected)
The driver then autoconfigures line_outs=3D1 (0x16) type:speaker, and a
single "Master" control drives the speakers correctly.

Note that "reconfig" in sysfs fails on this machine ("Codec reset is
not supported with ASoC"); unbinding and rebinding ehdaudio0D0 from
snd_hda_codec_conexant applies the stored overrides instead.

Limitation: with this override there is no headphone detection.

Since 6.17 the quirk table is in sound/hda/codecs/conexant.c. I can
test patches and run further tests, including GPIO probing for an
amp-mute line if that would help.

Thanks,
Dahmane

=E2=80=AB=D9=81=D9=8A =D8=A7=D9=84=D8=AE=D9=85=D9=8A=D8=B3=D8=8C 26 =D9=86=
=D9=88=D9=81=D9=85=D8=A8=D8=B1 2026 =D9=81=D9=8A 8:03 =D8=B5 =D8=AA=D9=85=
=D8=AA =D9=83=D8=AA=D8=A7=D8=A8=D8=A9 =D9=85=D8=A7 =D9=8A=D9=84=D9=8A =D8=
=A8=D9=88=D8=A7=D8=B3=D8=B7=D8=A9 =E2=80=AAdahmane
dahim=E2=80=AC=E2=80=8F <=E2=80=AAdahmanedahim04@gmail.com=E2=80=AC=E2=80=
=8F>:=E2=80=AC
>
> Hello,
>
> (Resending: my first message was rejected by the list because my mail
> client added an HTML part.)
>
> On my HUAWEI laptop (board HKD-WXX-PCB, BIOS 1.22 of 2023-08-30,
> Conexant CX11880 under sof-hda-dsp, kernel 6.18.65-1-lts) the internal
> speakers are only audible while "Headphone Playback Switch" is on.
> "Speaker Playback Switch" has no audible effect.
>
> This looks like the same wiring reported for a MACHD-WXX9 in
> alsa-ucm-conf issue #863, which was closed there as a kernel driver
> problem. Mine is a second affected model.
>
> IDs:
>   codec vendor 14f1:1f86, subsystem 152d:1350
>   card long name: HUAWEI-HKD_WXX-M1010-HKD_WXX_PCB
>
> Autoconfig:
>   line_outs=3D1 (0x17) type:speaker, speaker_outs=3D0, hp_outs=3D1 (0x16)
>   pin 0x16: 0x03211040 (HP Out, Ext Left)
>   pin 0x17: 0x91170110 (Speaker, Int Rear, NO_PRESENCE)
>   pin 0x17 connection list: 0x10 0x11*  (0x11 selected)
>
> Measurements while playing a tone (speaker-test -D plughw:0,0) with
> Headphone switch off, Speaker switch on:
>   Node 0x10 Amp-Out [0xac 0xac] (muted), Converter stream=3D1
>   Node 0x11 Amp-Out [0x48 0x48] (unmuted), Converter stream=3D1
>   -> no sound
>
> After "amixer -c 0 sset Headphone unmute":
>   Node 0x10 Amp-Out [0x2c 0x2c], Node 0x11 unchanged
>   -> tone audible
>
> With Speaker Playback Switch off and Headphone Playback Switch on, the
> tone is still audible. So the audible path goes through the Node 0x10
> amp, even though pin 0x17 reports Node 0x11 as its selected input.
>
> Volume: Headphone Playback Volume (default 44/74, -30 dB) sets the
> speaker loudness. Speaker Playback Volume only changes the audible
> level in roughly the bottom 6% of its range and has no audible effect
> above that.
>
> Jack: with a headphone plugged in, the jack is detected, but the
> internal speakers keep playing. "Auto-Mute Mode" is Disabled by
> default; I have not yet tested enabling it. This matches the behavior
> in #863 (speakers and headphones share one amplifier).
>
> Userspace sees this as the speakers being silent after boot, because
> the stock UCM Speaker profile does not enable the Headphone switch.
> I believe the codec controls should be fixed in the driver instead.
>
> Would a quirk for subsystem 152d:1350 in patch_conexant.c be the right
> approach? I'm happy to test patches or run further tests, and can
> provide the full /proc/asound/card0/codec#0 and alsa-info output on
> request.
>
> Thanks,
> Dahmane
