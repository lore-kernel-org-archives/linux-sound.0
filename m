Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD9B3B1006;
	Wed,  5 Aug 2026 14:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785940654; cv=pass; b=UMyywbL9Pc4CP82oaCKPPlURqYOkhiHG4afm15C+B33Vpa4iEz66qwKTRGbdhiVvCXXQVKDSFKojxvkOC/KXPYlVtXAF5ymIg5qz6P0Yda1taoZ5iWLV+VmcntLZdraglzftf/kP/PZ53+GybqReKo7mzvo0UIgPPAdpRuwwmPM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785940654; c=relaxed/simple;
	bh=wXDye97CpKNj+NxC33DqlLnOpNmI43S+PdkcE7McKCA=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Wj2w59aL/a9W8NdHRJAlHUmHt726XE6ZyG2wQ4mlOmglq5gIcO7EDMGZ6Qw5dMvP2dx03XfE3aGM5/sh6144jvD+XPkmMNZrgWAtnbOxOtJGyFKaXytt3qBVTfyNu2b+CdFPyZ7icjiX1Sm+/vTUQttK79xzs9jRy1CxzyvLwHg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=KLuqZqdK; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="KLuqZqdK"
ARC-Seal: i=1; a=rsa-sha256; t=1785940634; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FXDIj83hO/mU2SrU3JQSzlGNc9m7+HIPUG2HBRQI1mcd9kjBcYsmZIsu8O+VQsfZsYFowLOsJHyWcFDmc/3W8r2tjcdr076IACLQX3KAQttsgsDwONyaXpfLzvdaGeDIiyIpTmqOHN86PpypCwhGiVuJrG5GCMu1FiiCcQUwuLg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785940634; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=3ChLDdG2dB4U7lklq8aaTz0RimbnxY1ELJAqc4FhEzc=; 
	b=dmjQN9vbDRZ/ig/cJwrcCHVDFRP71Cy3/NtQUoVbP6MnK2D2g29lne9bgrTdhi5qETkx8ZM1CIwmSeTQuamolsU5WojibhvHnM/D48mb1MFX16nm2IOgbisktGffqu1hKUD9mcnH8BSuA7pMeJojo3H94RJg1qV9YqODoJThgsU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785940634;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=3ChLDdG2dB4U7lklq8aaTz0RimbnxY1ELJAqc4FhEzc=;
	b=KLuqZqdK41UgJB7S6AMgG59pbMXQSYeHlofQCRYh+vH8gSYjTHCgyK5taJRl6DNL
	rNfHL2kK3mmzoNR2NTos6fBO8uUF6K9jkEiLmbj871OWBl1r6gM+LirD3R8XSYuJ8ba
	pDYdk6TSsIxhy04rXSa1e/VW+TILHL0S+9S/nMhj+pFez5xjUXhhHq+mkeNeMSNAmQa
	/nlWMtr7psUSPh7Bji5ohCeARkUHZJ9HG6qURO72le68m3fNx5usTp2QLTYRn3y8x0g
	DvgHodf6ItB4LP/tnVVAQp4LMqY/alYrtnEYRwe6L6Kz8HbQXb8vNlGfvQzVWd5bi8t
	B0C+KUE/vA==
Received: by mx.zohomail.com with SMTPS id 1785940630998215.5655323254408;
	Wed, 5 Aug 2026 07:37:10 -0700 (PDT)
Message-ID: <a0bef09ac7160721f0826c16107082b5f5d12e74.camel@rong.moe>
Subject: Re: [PATCH 3/3] ALSA: usb-audio: Do not expose sticky mixers
From: Rong Zhang <i@rong.moe>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Icenowy Zheng <uwu@icenowy.me>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260804235515.7346606e.michal.pecio@gmail.com>
References: <20260411-uac-sticky-mixer-v1-0-29d62717befd@rong.moe>
			<20260411-uac-sticky-mixer-v1-3-29d62717befd@rong.moe>
		 <20260804235515.7346606e.michal.pecio@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 22:32:00 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-10 
X-ZohoMailClient: External

Hi Michal,

Thanks for the report.

On Tue, 2026-08-04 at 23:55 +0200, Michal Pecio wrote:
> On Sat, 11 Apr 2026 01:49:04 +0800, Rong Zhang wrote:
> > Some devices' mixers are sticky, which accept SET_CUR but do absolutely
> > nothing. Registering these mixers confuses userspace and results in
> > ineffective volume control.
> >=20
> > Check if a mixer is sticky by setting the volume to the maximum or
> > minimum value and checking for effectiveness afterward. Prevent the
> > mixer from being registered if it turns out to be sticky.
> >=20
> > Quirky device sample:
> >=20
> >   usb 7-1: New USB device found, idVendor=3D0e0b, idProduct=3Dfa01, bcd=
Device=3D 1.00
> >   usb 7-1: New USB device strings: Mfr=3D1, Product=3D2, SerialNumber=
=3D3
> >   usb 7-1: Product: Feaulle Rainbow
> >   usb 7-1: Manufacturer: Generic
> >   usb 7-1: SerialNumber: 20210726905926
> >   (Mic Capture Volume)
> >=20
> > Signed-off-by: Rong Zhang <i@rong.moe>
>=20
> This appears to break (yet another) device, as reported below.
> Not 100% sure because both affected users ran away to -lts and
> appear to be of the "won't compile kernel patches" variety.
>=20
> https://bbs.archlinux.org/viewtopic.php?id=3D314220

Let me quote some words below:

> After updating, my headset output was halved (or so) despite the same mix=
er levels and sounds weird/bassy/distorted during fading audio. Previously =
my volume was set to 25%, but now i need 40-50% for the same volume, and th=
e quality seems worse.
>=20

The new 100% still maps to the original 100% as the sticky check sets the
mixer value to max before bailing out. IOW, it won't result in always-
halved physical volume.

If the dB reporting is correct, both a hardware mixer and a soft mixer
should map to similar physical volume on the same device. That is, volume
other than 100% behaving differently usually implies broken dB reporting.
So the difference in volume mapping isn't really an issue caused by soft
mixer. Instead, it exposes yet another device quirk.

Distortion at low volume is a side effect of soft mixers on some devices.
Usually it's hardly audible. I guess the SteelSeries Arctis Nova 5 uses a
poorly-performed lossy 2.4GHz codec, making the distortion worse.

>=20
> [...]
>=20
> Broken kernel output:
>=20
> Jul 09 17:06:05 <HOSTNAME> kernel: usb 3-1: Product: SteelSeries Arctis N=
ova 5
> Jul 09 17:06:05 <HOSTNAME> kernel: usb 3-1: Manufacturer: SteelSeries
> Jul 09 17:06:05 <HOSTNAME> kernel: hid-generic 0003:1038:2232.0008: hidde=
v99,hidraw7: USB HID v1.11 Device [SteelSeries SteelSeries Arctis Nova 5] o=
n usb-0000:13:00.3-1/input3
> Jul 09 17:06:05 <HOSTNAME> kernel: input: SteelSeries SteelSeries Arctis =
Nova 5 as /devices/pci0000:00/0000:00:08.1/0000:13:00.3/usb3/3-1/3-1:1.4/00=
03:1038:2232.0009/input/input12
> Jul 09 17:06:06 <HOSTNAME> kernel: hid-generic 0003:1038:2232.0009: input=
,hidraw8: USB HID v1.11 Device [SteelSeries SteelSeries Arctis Nova 5] on u=
sb-0000:13:00.3-1/input4
> Jul 09 17:06:06 <HOSTNAME> kernel: hid-generic 0003:1038:2232.000A: hidde=
v100,hidraw9: USB HID v1.11 Device [SteelSeries SteelSeries Arctis Nova 5] =
on usb-0000:13:00.3-1/input5
> Jul 09 17:06:07 <HOSTNAME> kernel: usb 3-1: 9:0: sticky mixer values (-19=
712/0/256 =3D> 0), disabling
> Jul 09 17:06:07 <HOSTNAME> kernel: usb 3-1: 10:0: sticky mixer values (-2=
1248/0/256 =3D> 0), disabling

With the kmsg dump, as well as the user confirming that the UAC mixer
responds to SET_CUR, I can confirm the device has broken GET_CUR mixers
instead of sticky ones.

I will submit a patch to add QUIRK_FLAG_MIXER_GET_CUR_BROKEN for the
device, so that the UAC mixer can be reenabled.

>=20
> My $.02 - was there no way to deal with this in userspace,
> or to make it opt-in rather than opt-out?

While userspace can ignore hardware mixers via some configurations, the
current opt-out model is really about:

   When we can't distinguish between both, will the extra advantages of
   exposing a broken GET_CUR mixer outweigh the disadvantages of exposing
   a sticky one?

My answer is no.

A sticky hardware mixer breaks volume control completely. If a user
doesn't know how to tell the audio stack to ignore it, it will be a
terrible out-of-box experience.

In contrast, exposing a broken GET_CUR mixer is more like an optimization
for slightly better volume control quality (if the mixer is otherwise
implemented properly) compared to a soft mixer.

Other than the unfortunate combination with lossy codecs, usually the
distortion caused by a soft mixer is only audible on a device with high
gain, but such a device should also come with a gain control knob anyway
-- the user really should use the knob to tune the volume.

Thanks,
Rong

>=20
> Regards,
> Michal
