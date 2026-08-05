Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0BF29B766;
	Wed,  5 Aug 2026 16:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785949077; cv=pass; b=q+P1BVf81eV8zoloBoyJhgEkwmQj89T6tIzdNXYEM/IQ3OcCs7L7dB2ylIoLAfFC+zuGuwEhQZQnx6k3DluACkiyckkPRV0PiSEeGKQmN2+DsJd6lyaGSdlvTmUFtRAKLFkS9pcQ63s/hn8FHbzQH7a+qxdXUc1Axn6V56coqQI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785949077; c=relaxed/simple;
	bh=8NQ29wjCC9L71j5eKfSqdyu/PkGUF7bOEwzO7a/zp6Y=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=uWbqUAqxXLbSV7m3C1U1vELg/w2nAVEArNqAmKXa4BQjKyZCb+t1Acwce5z2wk3T4Hh8tmcpCGKVwkT9rwRq2QIEAaP5TxRRzC2aNdNA2KRDpqzEGJbjTxnpKCmQwk0fonVGVyu1Ofo9s/h+Q2lBsNrfX0P/iFkBEbaFNGFOUkY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=E6j9Euh3; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="E6j9Euh3"
ARC-Seal: i=1; a=rsa-sha256; t=1785949054; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SJDCn9cNcUAC9lsgUEvzEyJErgt6iYTzgP091hcH5vbZtc8pON/gWw5v6wbgYnYjJaTzxyCw9qKJR5tnqv8ok+vTGq8fZnaLXA60NH7M9t6iw4dOl6mtGbj8Ld492u6XONLREr7IcqYtkSw7B+CjwiY353Deg/qETqMQ8lTDsaQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785949054; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=0uLsWnJu+JcibYSuN75rYXqYmZVDWtpD12S6tsj5Cuk=; 
	b=UgM3NoMgBgZXZo8a5RfO8CAk3dBRs+Wnr6PVXnD2QQppkNMLOxifYDaaYPb6tNCZB81od0K2aKcOrEu/zHJj0nRa9hOs4+52+qM8dcN6u7QDm74tVSgBeESab2vPDGLhABP9N5ExpGuO6kj5aLb4uZ9cHE/iaqLP3nHl5PyM3Eo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785949053;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=0uLsWnJu+JcibYSuN75rYXqYmZVDWtpD12S6tsj5Cuk=;
	b=E6j9Euh3dkx83XPnZvYkR/yoC+CZlfvxMgplp6KjNtb2lFS1uUcHOeyMq3jX+kKy
	krqYUlUw1PElvRhsMcmDsWv07+uDzfFhvquPmfpiCcOrx9maYLpnA/RWIKVpXkXd1VE
	nf+r4t+NlFf5ezpxZwh2eCs8Guz8J1mzohP6rFakUFJnScqjHEN8ZkLqD87McgVK5WD
	isdwWe7PxNoFhwnRZb3+/mjPGX1C4jnQ51USa6JaCvmErL4WU29m8JKrWvz/6Bb8X8h
	D4El30Wnc0fkQlY7uyJUtqpbZtlzGpLOSQbYtJiELiOhDSo2cv9v7J0K5kbNAB4V4WI
	ENR4Ks1qwg==
Received: by mx.zohomail.com with SMTPS id 1785949051023149.6918404629472;
	Wed, 5 Aug 2026 09:57:31 -0700 (PDT)
Message-ID: <e95256d8255802c78f0529faa4ffcf4fe0c4e05a.camel@rong.moe>
Subject: Re: [PATCH 3/3] ALSA: usb-audio: Do not expose sticky mixers
From: Rong Zhang <i@rong.moe>
To: Takashi Iwai <tiwai@suse.de>
Cc: Michal Pecio <michal.pecio@gmail.com>, Jaroslav Kysela
 <perex@perex.cz>,  Takashi Iwai <tiwai@suse.com>, Icenowy Zheng
 <uwu@icenowy.me>, linux-sound@vger.kernel.org, 	linux-kernel@vger.kernel.org
In-Reply-To: <877bm4fuqs.wl-tiwai@suse.de>
References: <20260411-uac-sticky-mixer-v1-0-29d62717befd@rong.moe>
		<20260411-uac-sticky-mixer-v1-3-29d62717befd@rong.moe>
		<20260804235515.7346606e.michal.pecio@gmail.com>
		<a0bef09ac7160721f0826c16107082b5f5d12e74.camel@rong.moe>
	 <877bm4fuqs.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 00:52:22 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-10 
X-ZohoMailClient: External

Hi Takashi,

Thanks for your opinion.

On Wed, 2026-08-05 at 17:32 +0200, Takashi Iwai wrote:
> On Wed, 05 Aug 2026 16:32:00 +0200,
> Rong Zhang wrote:
> >=20
> > Hi Michal,
> >=20
> > Thanks for the report.
> >=20
> > On Tue, 2026-08-04 at 23:55 +0200, Michal Pecio wrote:
> > > On Sat, 11 Apr 2026 01:49:04 +0800, Rong Zhang wrote:
> > > > Some devices' mixers are sticky, which accept SET_CUR but do absolu=
tely
> > > > nothing. Registering these mixers confuses userspace and results in
> > > > ineffective volume control.
> > > >=20
> > > > Check if a mixer is sticky by setting the volume to the maximum or
> > > > minimum value and checking for effectiveness afterward. Prevent the
> > > > mixer from being registered if it turns out to be sticky.
> > > >=20
> > > > Quirky device sample:
> > > >=20
> > > >   usb 7-1: New USB device found, idVendor=3D0e0b, idProduct=3Dfa01,=
 bcdDevice=3D 1.00
> > > >   usb 7-1: New USB device strings: Mfr=3D1, Product=3D2, SerialNumb=
er=3D3
> > > >   usb 7-1: Product: Feaulle Rainbow
> > > >   usb 7-1: Manufacturer: Generic
> > > >   usb 7-1: SerialNumber: 20210726905926
> > > >   (Mic Capture Volume)
> > > >=20
> > > > Signed-off-by: Rong Zhang <i@rong.moe>
> > >=20
> > > This appears to break (yet another) device, as reported below.
> > > Not 100% sure because both affected users ran away to -lts and
> > > appear to be of the "won't compile kernel patches" variety.
> > >=20
> > > https://bbs.archlinux.org/viewtopic.php?id=3D314220
> >=20
> > Let me quote some words below:
> >=20
> > > After updating, my headset output was halved (or so) despite the same=
 mixer levels and sounds weird/bassy/distorted during fading audio. Previou=
sly my volume was set to 25%, but now i need 40-50% for the same volume, an=
d the quality seems worse.
> > >=20
> >=20
> > The new 100% still maps to the original 100% as the sticky check sets t=
he
> > mixer value to max before bailing out. IOW, it won't result in always-
> > halved physical volume.
> >=20
> > If the dB reporting is correct, both a hardware mixer and a soft mixer
> > should map to similar physical volume on the same device. That is, volu=
me
> > other than 100% behaving differently usually implies broken dB reportin=
g.
> > So the difference in volume mapping isn't really an issue caused by sof=
t
> > mixer. Instead, it exposes yet another device quirk.
> >=20
> > Distortion at low volume is a side effect of soft mixers on some device=
s.
> > Usually it's hardly audible. I guess the SteelSeries Arctis Nova 5 uses=
 a
> > poorly-performed lossy 2.4GHz codec, making the distortion worse.
> >=20
> > >=20
> > > [...]
> > >=20
> > > Broken kernel output:
> > >=20
> > > Jul 09 17:06:05 <HOSTNAME> kernel: usb 3-1: Product: SteelSeries Arct=
is Nova 5
> > > Jul 09 17:06:05 <HOSTNAME> kernel: usb 3-1: Manufacturer: SteelSeries
> > > Jul 09 17:06:05 <HOSTNAME> kernel: hid-generic 0003:1038:2232.0008: h=
iddev99,hidraw7: USB HID v1.11 Device [SteelSeries SteelSeries Arctis Nova =
5] on usb-0000:13:00.3-1/input3
> > > Jul 09 17:06:05 <HOSTNAME> kernel: input: SteelSeries SteelSeries Arc=
tis Nova 5 as /devices/pci0000:00/0000:00:08.1/0000:13:00.3/usb3/3-1/3-1:1.=
4/0003:1038:2232.0009/input/input12
> > > Jul 09 17:06:06 <HOSTNAME> kernel: hid-generic 0003:1038:2232.0009: i=
nput,hidraw8: USB HID v1.11 Device [SteelSeries SteelSeries Arctis Nova 5] =
on usb-0000:13:00.3-1/input4
> > > Jul 09 17:06:06 <HOSTNAME> kernel: hid-generic 0003:1038:2232.000A: h=
iddev100,hidraw9: USB HID v1.11 Device [SteelSeries SteelSeries Arctis Nova=
 5] on usb-0000:13:00.3-1/input5
> > > Jul 09 17:06:07 <HOSTNAME> kernel: usb 3-1: 9:0: sticky mixer values =
(-19712/0/256 =3D> 0), disabling
> > > Jul 09 17:06:07 <HOSTNAME> kernel: usb 3-1: 10:0: sticky mixer values=
 (-21248/0/256 =3D> 0), disabling
> >=20
> > With the kmsg dump, as well as the user confirming that the UAC mixer
> > responds to SET_CUR, I can confirm the device has broken GET_CUR mixers
> > instead of sticky ones.
> >=20
> > I will submit a patch to add QUIRK_FLAG_MIXER_GET_CUR_BROKEN for the
> > device, so that the UAC mixer can be reenabled.
> >=20
> > >=20
> > > My $.02 - was there no way to deal with this in userspace,
> > > or to make it opt-in rather than opt-out?
> >=20
> > While userspace can ignore hardware mixers via some configurations, the
> > current opt-out model is really about:
> >=20
> >    When we can't distinguish between both, will the extra advantages of
> >    exposing a broken GET_CUR mixer outweigh the disadvantages of exposi=
ng
> >    a sticky one?
> >=20
> > My answer is no.
> >=20
> > A sticky hardware mixer breaks volume control completely. If a user
> > doesn't know how to tell the audio stack to ignore it, it will be a
> > terrible out-of-box experience.
> >=20
> > In contrast, exposing a broken GET_CUR mixer is more like an optimizati=
on
> > for slightly better volume control quality (if the mixer is otherwise
> > implemented properly) compared to a soft mixer.
> >=20
> > Other than the unfortunate combination with lossy codecs, usually the
> > distortion caused by a soft mixer is only audible on a device with high
> > gain, but such a device should also come with a gain control knob anywa=
y
> > -- the user really should use the knob to tune the volume.
> >=20
> > Thanks,
> > Rong
>=20
> Well, this is getting more troublesome than expected, as it seems;
> there have been a few more bug reports, too (I forgot places), and I'm
> afraid that the tendency will remain.
>=20
> My impression is that Windows drivers don't care about the GET_CUR, so
> often the device firmware doesn't treat it at all.  If that's the
> case, it'd be also fine just to take the given mixer value as-is.
> OTOH, if we want to be more strict, keeping the high default is also
> logical -- which is our current behavior.  That is, there is no
> perfect answer to this, and it purely depends on our decision.

My decision was based on a frequent phenomenon that many PipeWire users
mistakenly select the "Digital Stereo (IEC958)" profile instead of the
"Analog Stereo" one when the UAC device really produces analog output,
simply because they have a wrong belief that "digital is better than
analog." Selecting the former bypasses hardware mixers in the hardware
and forces the use of soft mixer. If their ears can't tell the difference
between the two profile, keeping the high default and falling back
userspace soft mixer is probably a fair choice for broken GET_CUR mixers
without prior knowledge.

>=20
> At least, for 7.3 kernel, I'll keep the current code and take
> BROKEN_GET_CUR quirks for the reported devices.  But if the reports
> keeping flooding, we'd have to reconsider.  Let's see.

Agreed. If it eventually turns out to be a rabbit hole, converting the
check failure action into a pure warning might be a better choice.

Thanks,
Rong

>=20
>=20
> thanks,
>=20
> Takashi
