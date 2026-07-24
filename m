Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A49403E97;
	Fri, 24 Jul 2026 12:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784894575; cv=pass; b=p2d8g+vdt3P5X417YkoWIzuMgHKo8Uztd5vNU0d7Kko+pcTOcrtkNC7/CkQqu9aWDkwO1RLAGfppwQV/MnS4ln4J5FfYJ5OjtT7sLYGH58roMQU6Tqwhln1Gb8yqrmYqaIeN3CMK7YJbT7qN0SQJta+QEvH3aYh3nYbuFPIDfhg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784894575; c=relaxed/simple;
	bh=uAFIFbPktDnWEjnqkPVbPuCJdntunjNOlK5lFGV2Wes=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=rdxfbRXqYQuxBkySRwppWB+EaIhiNdsjKxC7D2KGkoDzHQCXirLnyKHyvKNvVL1yjKFdRSBjzNaj6tsjLmoBU5OFy6CZmDOrVks0feFM7X4SVbUbFvyZXhWJ2yMpZq5PRGlMJmAnlNiL9pRWlSycITwi07XGep6r9Aaswz+uqLQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=CpCayhZR; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="CpCayhZR"
ARC-Seal: i=1; a=rsa-sha256; t=1784894559; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eg2SNe0BlifAdr5Qf6XLiuJRnMNBPgBCoWA5mo2QboufXZ848P8H6xKj6d9IL6sxHVY/fRMAxppaQCf2DJm4WzUlJsfIHethzaU8QLszBi2n04VXlwKqmMkrYCvu0VrgR1H962MLiTqzugamnOCMp6lOdOFcsQYp4h+4BSX4jxo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784894559; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=HLSWpW4LYX/Yb7wfkhbUYvnSlNGs0HKDe7/E2A5LAlg=; 
	b=k50BgKtCn2YxPH1eWp1EPweyhCnwj8kof2aQRXrCqj3Uu8jyTGUvDja15zSYIYp1Ko2jQJsUig7PKCxg5X4P+zmUeXVLa9cfaeBwc1xzeRc7sEF9ckImGmBVjuNBGkrVybh3LTD9FugqFSs5mMWj8ERXYnjeqWFzU7E1W1QmfEg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784894559;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=HLSWpW4LYX/Yb7wfkhbUYvnSlNGs0HKDe7/E2A5LAlg=;
	b=CpCayhZRn+J9abyBwHkZV55KYDG6C7F9KWWkR4e10L/zMSRKd1dkZ2AVFcYPEku8
	r28Ap4WRWmlsQh+vvlzLef2xDwH7LRL9QTKZw4wgS66UoRtBOMCGUNxpYHZni+r2Bzh
	PJtRMI14JxmvzbBxJN769kRyC//5CJWCy7fq2jL+QKPWedVpzwndfRW43TWSMgpfYSa
	JmlSS35eV6Bj2vTJ440iWWNkelgKhDD9nLAX5WLmAV/nmquWlpc9PSL5psP46YrMWtZ
	VNDe8bXZHN/HdI1nIDAdzZmn7Y9Fr76UjD8tlZ8aKtF9ljpudQfMqL5U4wQf+kIA4lS
	C7mnPbMNoA==
Received: by mx.zohomail.com with SMTPS id 1784894557091495.0243486991484;
	Fri, 24 Jul 2026 05:02:37 -0700 (PDT)
Message-ID: <0e84fcceb30e1af49f2450cdfa8f4c5aa552607c.camel@rong.moe>
Subject: Re: =?gb2312?Q?=B4=F0=B8=B4=3A?= [PATCH] ALSA: usb-audio: Add
 iface reset and delay quirk for JKY Technology Q2A
From: Rong Zhang <i@rong.moe>
To: =?gb2312?Q?=BA=FA=C1=AC=C7=DA?= <hulianqin@vivo.com>, "perex@perex.cz"
	 <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>
Cc: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>
In-Reply-To: <TYUPR06MB621767F631B7932FD6F3B079D2CF2@TYUPR06MB6217.apcprd06.prod.outlook.com>
References: 
	<TYUPR06MB6217BD7BF1AE9B308295FFFCD2CF2@TYUPR06MB6217.apcprd06.prod.outlook.com>
	 <2cb27fb80f6fbdbd3b72138ce2d33c878e4e8049.camel@rong.moe>
	 <TYUPR06MB621767F631B7932FD6F3B079D2CF2@TYUPR06MB6217.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 20:02:07 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-10 
X-ZohoMailClient: External

Hi Lianqin,

On Fri, 2026-07-24 at 11:41 +0000, =E8=83=A1=E8=BF=9E=E5=8B=A4 wrote:
> Hi Rong:
>=20
> >=20
> > On Fri, 2026-07-24 at 08:29 +0000, =E8=83=A1=E8=BF=9E=E5=8B=A4 wrote:
> > > Setting up the interface when suspended/resuming fails on this card.
> > > Adding a reset and delay quirk will eliminate this problem.
> > >=20
> > > Note: This device misuses the Apple VID (0x05ac) & PID (0x110b).
> >=20
> > The device's VID conflicts with Apple's, but there is no PID conflict,
> > right?
> The VID & PID are the same as those of Apple's official digital headphone=
s.=20
> This is the VID & PID information of digital headphones purchased from Ap=
ple:
>=20
> [20946.829805] usb 1-1: New USB device found, idVendor=3D05ac, idProduct=
=3D110b, bcdDevice=3D26.81
> [20946.829811] usb 1-1: New USB device strings: Mfr=3D1, Product=3D2, Ser=
ialNumber=3D3
> [20946.829813] usb 1-1: Product: EarPods
> [20946.829815] usb 1-1: Manufacturer: Apple, Inc.
> [20946.829816] usb 1-1: SerialNumber: JCRF0XQQH1
> [20946.830111] usb 1-1: usb_probe_device
>=20
> >=20
> > If a manufacturer uses other's VID, it's a VID conflict. The device
> > falls into this category.
> >=20
> > If the manufacturer uses the same PID among different products, it's a
> > PID conflict. I don't think it's the case of the device, unless JKY
> > Technology reuses PID 0x110b for products other than Q2A.
>=20
> The device's VID & PID information are exactly the same as Apple's offici=
al information.
> Misusing Apple digital headphones' VID and PID information

It doesn't matter at all whether the PID is the same as one of Apple
products.

Between two different manufacturers there is only a VID conflict, but no
PID conflict. It is a PID conflict *only if* two different products from
*JKY Technology* share the same PID, but you haven't seen another JKY
Technology product with the same PID, right?

>=20
> >=20
> > >=20
> > > usb 1-1: New USB device found, idVendor=3D05ac, idProduct=3D110b
> > > usb 1-1: New USB device strings: Mfr=3D1, Product=3D2, SerialNumber=
=3D3
> > > usb 1-1: Product: Q2A
> > > usb 1-1: Manufacturer: JKY Technology
> > > usb 1-1: SerialNumber: 330270D2251225
> > >=20
> > > Signed-off-by: Lianqin Hu <hulianqin@vivo.com>
> > > ---
> > >  sound/usb/quirks.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >=20
> > > diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
> > > index 0de7c9d94259..ad2ce384e32d 100644
> > > --- a/sound/usb/quirks.c
> > > +++ b/sound/usb/quirks.c
> > > @@ -2200,6 +2200,8 @@ struct usb_audio_quirk_flags_table {
> > >=20
> > >  static const struct usb_audio_quirk_flags_table quirk_flags_table[] =
=3D {
> > >  	/* Device and string descriptor matches */
> > > +	DEVICE_STRING_FLG(0x05ac, 0x110b, "JKY Technology", "Q2A", /* JKY T=
echnology Q2A */
> >=20
> > Hence, I don't think it's necessary to match "Q2A" here.
> >=20
> > Meanwhile, in any case, the comment should describe the VID/PID conflic=
t
> > instead of repeating the string descriptor(s) being matched, and the
> > strings should break into another line.
>=20
> OK, The comments should include information about any conflicting vid and=
 pid information.
>=20
> >=20
> > See how commit b13031ca112a ("ALSA: usb-audio: Deconflict VID between
> > Focusrite Novation & MV-SILICON") describe the conflict and arrange
> > lines.
> >=20
> > > +		   QUIRK_FLAG_FORCE_IFACE_RESET | QUIRK_FLAG_IFACE_DELAY),
> >=20
> > Bad indent.
> After careful inspection, the indentation in quirk.c appears to be consis=
tent with previous indentation practices.
>=20
> 	DEVICE_FLG(0x413c, 0xa506, /* Dell AE515 sound bar */
> 		   QUIRK_FLAG_GET_SAMPLE_RATE),
> 	DEVICE_FLG(0x534d, 0x0021, /* MacroSilicon MS2100/MS2106 */
> 		   QUIRK_FLAG_ALIGN_TRANSFER),
> 	DEVICE_FLG(0x534d, 0x2109, /* MacroSilicon MS2109 */
> 		   QUIRK_FLAG_ALIGN_TRANSFER),
> 	DEVICE_FLG(0x84ef, 0x0082, /* Hotone Audio Pulze Mini */
> 		   QUIRK_FLAG_MIXER_PLAYBACK_LINEAR_VOL | QUIRK_FLAG_MIXER_CAPTURE_LINE=
AR_VOL),
>=20
> >=20
> > This is the first DEVICE_STRING_FLG() item, so please don't set a bad
> > example. I would prefer:
> >=20
> > 	DEVICE_STRING_FLG(0x05ac, 0x110b, /* VID conflicts with Apple */
> > 			  "JKY Technology", NULL /* Q2A */,
> > 			  QUIRK_FLAG_FORCE_IFACE_RESET | QUIRK_FLAG_IFACE_DELAY),
> >=20
> OK=EF=BC=8CThis way of writing is better, but the indentation is slightly=
 different from that of the predecessors.
>  I personally hope to keep it consistent with the predecessors.

Alignment should match the open parenthesis. See PARENTHESIS_ALIGNMENT in
scripts/checkpatch.pl. It's not a strict requirement but it makes the
code more readable. See also the indentation of VENDOR_STRING_FLG().

Thanks,
Rong

>=20
> > Thanks,
> > Rong
> >=20
> > >=20
> > >  	/* Device matches */
> > >  	DEVICE_FLG(0x001f, 0x0b21, /* AB13X USB Audio */
> > > --
> > > 2.39.0
>=20
> Thanks
> Lianqin
