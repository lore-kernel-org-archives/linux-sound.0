Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D1836DA15;
	Mon,  2 Mar 2026 12:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772455016; cv=pass; b=amw9hkIMaaT8FI1WHawiEWc8T6h3sgQqnuawxsK1JH6CB9foCsJw/fXCDf6Mw1VFsVcAybncQbNsN6Kqji1yljANbmF9cuiNSEZunAOngpeuu/otRZj7ZpzbjOJlFtBsTjKoGJrnRnpg/vclNXs6takzDw8UCqz8mAGVLohBgT8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772455016; c=relaxed/simple;
	bh=i2PaH7mcmgnXSUUp+CWSP+o26LYx16eN4NbzWNUWqOw=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=XwqgnT1tEvYAlPzz+CDWqybOSfpHyYTsMY933VCjQL0zAG+nEkldV5G/cCcht9bPGVXPiW9X7ebl3x36LgaXH2QIlSJPJNa+Op0iDywACDk5GysSPOK/YdKJ1UYchMy6Xy23ydoyLw8+QtQaED1r4Yxf6xCM/THNOzHFVIYwEas=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=RoNcasnd; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="RoNcasnd"
ARC-Seal: i=1; a=rsa-sha256; t=1772454994; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Xz3gk0dsdCfqpF8Z/WT4RzR69rWGSqYBPXy4sv3rlsEj3ENMyOapfKLvSmlqb5DyR3j5vW+E/SMgfNBqDNcoFOrZ1GpgFxb5QXjb2xuF420ggw6C37QR9Wc/ixaYpXFdVEh2XZLDYlYQmMkyjqNdkORAqNr2RYriYWbHzsIqi4c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772454994; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=EsZpR6vMuAbfQSEH07cTsIQT6XkmB9hhhtN7g2YBkjE=; 
	b=GYRhpCvtkqv1pge/qVcT0+OLJNQMmVBbnhqblt2qsew4wPAS9TTyaWgJjMcLxGWWCLeVeHGWDm4TlnUhWqZ7Z8BPuhaM+9QoPKS0n/DgFlCJwF2LixkH0aRoEQxAK1N2ptmYH7KPQDCBJsGjapL2d4zZMloxd8+3bTmRRD3IUtE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772454994;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=EsZpR6vMuAbfQSEH07cTsIQT6XkmB9hhhtN7g2YBkjE=;
	b=RoNcasndp7fp3Gtk/jHIvYo3/CP7yeKAObgWnwBIfAAsqq59EeqOSiJCWcBg3iiZ
	8xBKvgZWPIJ6kd0QQwZeWONSFE3ZgeQCoOsdkftB5p0xoaFo9teJwEA35i3Xt7mHGKz
	uZxa+gnSsqP9CNuydgWy1NKDTk72h+xlDbFfI85+JPmMLVSgUX6m1cO3byu+R16PCQt
	ZYXNaQuLIMNPWxRD+RQodB8YE/woRDqT1Ctt8tbiNY+gj4qYq6V/BHolMcw2hM50s/L
	JuaSpwFHpIcRFg6KwBVHwwLE2+xtiEddChqFe3aHXnnm1axnkuZzwYswpETxplMcayd
	WhZeo3b2uQ==
Received: by mx.zohomail.com with SMTPS id 1772454993200513.7002571997001;
	Mon, 2 Mar 2026 04:36:33 -0800 (PST)
Message-ID: <136445f6a9b01e423b6b380fb87bad059900f2b3.camel@rong.moe>
Subject: Re: [PATCH 4/9] ALSA: usb-audio: Support string-descriptor-based
 quirk table entry
From: Rong Zhang <i@rong.moe>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Jonathan Corbet	 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Cryolitia PukNgae	 <cryolitia@uniontech.com>, Arun Raghavan
 <arunr@valvesoftware.com>, 	linux-sound@vger.kernel.org,
 linux-doc@vger.kernel.org, 	linux-kernel@vger.kernel.org, Icenowy Zheng
 <uwu@icenowy.me>
In-Reply-To: <87ms0qmu8e.wl-tiwai@suse.de>
References: <20260301213726.428505-1-i@rong.moe>
		<20260301213726.428505-5-i@rong.moe> <87ms0qmu8e.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Mar 2026 20:31:27 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-8 
X-ZohoMailClient: External

Hi Takashi,

Thanks for your review.

On Mon, 2026-03-02 at 10:54 +0100, Takashi Iwai wrote:
> On Sun, 01 Mar 2026 22:37:20 +0100,
> Rong Zhang wrote:
> > @@ -2558,14 +2585,69 @@ void snd_usb_apply_flag_dbg(const char *reason,
> >  	}
> >  }
> > =20
> > +#define USB_STRING_SIZE 128
> > +
> > +static inline int snd_usb_get_strings(struct snd_usb_audio *chip,
> > +				      char *manufacturer, char *product)
> > +{
> > +	int ret;
> > +
> > +	if (manufacturer) {
> > +		ret =3D usb_string(chip->dev, chip->dev->descriptor.iManufacturer,
> > +				 manufacturer, USB_STRING_SIZE);
> > +		if (ret < 0) {
> > +			usb_audio_warn(chip, "failed to get manufacturer string: %d\n", ret=
);
> > +			return ret;
> > +		}
> > +	}
> > +
> > +	if (product) {
> > +		ret =3D usb_string(chip->dev, chip->dev->descriptor.iProduct,
> > +				 product, USB_STRING_SIZE);
> > +		if (ret < 0) {
> > +			usb_audio_warn(chip, "failed to get product string: %d\n", ret);
> > +			return ret;
> > +		}
> > +	}
> > +
> > +	return 1; /* ok */
> > +}
> > +
> >  void snd_usb_init_quirk_flags_table(struct snd_usb_audio *chip)
> >  {
> >  	const struct usb_audio_quirk_flags_table *p;
> > +	char manufacturer[USB_STRING_SIZE];
> > +	char product[USB_STRING_SIZE];
>=20
> Keeping those a bit largish strings on the stack doesn't look good.
> Maybe better to do kalloc with __free(kfree).

Makes sense.

> > +	int got_usb_strings =3D 0; /* <0: error, 0: pending, >0: ok */
>=20
> I think this global flag could go wrong since...
>=20
> >  	for (p =3D quirk_flags_table; p->id; p++) {
> >  		if (chip->usb_id =3D=3D p->id ||
> >  		    (!USB_ID_PRODUCT(p->id) &&
> >  		     USB_ID_VENDOR(chip->usb_id) =3D=3D USB_ID_VENDOR(p->id))) {
> > +			if (!p->usb_string_match)
> > +				goto apply; /* DEVICE_FLG or VENDOR_FLG */
> > +
> > +			/* DEVICE_STRING_FLG or VENDOR_STRING_FLG */
> > +			if (!got_usb_strings) {
> > +				got_usb_strings =3D snd_usb_get_strings(chip,
> > +					p->usb_string_match->manufacturer ? manufacturer : NULL,
> > +					p->usb_string_match->product ? product : NULL);
>=20
> ... here you try to extract strings only once, but this retrieval
> depends on the current entry.  If the current entry has only
> manufacturer and the next entry has only product, it won't work.

Nice catch! Thanks. Will fix it in v2.

> IMO, a simpler way would be something like:
>=20
> #define USB_STRING_SIZE 128
>=20
> static char *snd_usb_get_string(struct snd_usb_audio *chip, int id)
> {
> 	char *buf =3D kmalloc(USB_STRING_SIZE, GFP_KERNEL);
> 	int ret;
>=20
> 	if (!buf)
> 		return ERR_PTR(-ENOMEM);
> 	ret =3D usb_string(chip->dev, id, buf, USB_STRING_SIZE);
> 	if (ret < 0) {
> 		usb_audio_warn(chip, "failed to get string for id%d: %d\n", ret);
> 		kfree(buf);
> 		return ERR_PTR(ret);
> 	}
> 	return buf;
> }

I guess we may use usb_cache_string() so that we don't need to
kmalloc() the buffer ourselves and can get rid of USB_STRING_SIZE.

> void snd_usb_init_quirk_flags_table(struct snd_usb_audio *chip)
> {
> 	....
> 	char *manufacturer __free(kfree) =3D NULL;
> 	char *product __free(kfree) =3D NULL;
>=20
>   	for (p =3D quirk_flags_table; p->id; p++) {
> 		....
> 		if (p->usb_string_match->manufacturer) {
> 			if (!manufacturer)
> 				manufaturer =3D
> 					snd_usb_get_string(chip,
> 						chip->dev->descriptor.iManufacturer);
> 			if (!IS_ERR_OR_NULL(manufacturer) &&
> 			    strcmp(p->usb_string_match->manufacturer, manufacturer))
> 				continue;		=09
> 		}
> 		if (p->usb_string_match->product) {
> 			if (!product)
> 				product =3D
> 					snd_usb_get_string(chip,
> 						chip->dev->descriptor.iProduct);
> 			if (!IS_ERR_OR_NULL(product) &&
> 			    strcmp(p->usb_string_match->product, product))
> 				continue;		=09
> 		}
>=20
>=20

Sounds neat. Will do in v2. I will also skip the warning if id =3D=3D 0
since string-descriptor-based quirk table entries has nothing to do
with devices without corresponding descriptors.

Thanks,
Rong

> thanks,
>=20
> Takashi
