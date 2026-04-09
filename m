Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD16D3C9453;
	Thu,  9 Apr 2026 14:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775744755; cv=pass; b=mxroj8Ux16kQL+HQoeWR/zqQ6/BwqDAgmxCKJkCkbQCspC55Kw72ZGPTh+2ieoVHi0VhBy+wcHZTME5KIycD0lcuc9ngTNOoLZkpkXOCkYjfAfxXMQXuLz6H0Gbap8ZcHXzcNoALADtq5neysakZR3v+hL2xd4pD/VWcPEgoeIo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775744755; c=relaxed/simple;
	bh=rpmAlLNxRnH4O65csDWQbW0hvasPUwAZ+TnR4zMDgS4=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=jb/nP8JrhhqiqxGWwXf+ZiVQ7TRyLHNlQPHPpt+Tni8EWYwA0Z4N+3vbqgbnstOD2uvjQC+eL66ROwEM2xHXQx3K/INRU/A+O4ZmIqxEOyuqEFl40XHpaSPxKdGbcFGOhXrjsZ1e5ar7hU+sJpFM3oglRsefkIt4QxSMgwLsSXw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=p+kPDf1v; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="p+kPDf1v"
ARC-Seal: i=1; a=rsa-sha256; t=1775744737; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=HHU1oEfhTkrkzJ3e9mvhFEQvhSWn5T5emnWCaof+6oqPHh2CA0yOOLCZSPUZr+phMqCeSzfq28FZ/9x3Ll+8Bflqf92xuz5N39qRDq6YBqkdB61VkenbS1Pvl9Wa9lR66BCU0ns7PiWxJpJxjkUoVe/ICoxm6nsD1LIoOk5C8II=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1775744737; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Y8+yrRdonQ/rBkIwBqlpBxw85UnitEkGQ16OSDkA2Nw=; 
	b=Ln91xI5bEAEWjtwOmJes2hGS8xEOUNCIyzL3C/hSHr2M3dXG+o2Vgk/hLk3nipWA6LcJVUyVKo1yG2eVI5JGotrm2kcItjbX9qIH8djFtYc8b1nWRNhqRpeMr45mqWM6rJ1PVR8SMn8jihcsrsZMRO8zOhIeN6+IngXIB8BNilg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1775744737;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=Y8+yrRdonQ/rBkIwBqlpBxw85UnitEkGQ16OSDkA2Nw=;
	b=p+kPDf1v5I48H4fWdYsXLFDWHL9X+RjbhXUyLLqqPprPODE+852ZFQeXtViY8aTJ
	o0f17qG9xum27AWTBbdy2MlqGq2FAv9dlmss4lf7QmLRdt7fqCQ5IUX0pvbpDnEZfp4
	0bbrGVds+bn1elmdAR32OIYHa2CGQXjGE9AtcKycxcblOisEQNhLC5JrIZ8xTs21pUf
	9wnhncsxQWvZ4awwFSLx1AffJ1Y9gqV41sVS7QxDus9tcl21rfYxGxBKudGtSoR5l0/
	zXdoC/WKjrH9vEJQwfuqeBP5uxmZSxO+EvPlm9JhfY/Z3K5mqPo+Hk5x8azKq0bN+lP
	jCRPgBRuRQ==
Received: by mx.zohomail.com with SMTPS id 1775744735286156.69025575238106;
	Thu, 9 Apr 2026 07:25:35 -0700 (PDT)
Message-ID: <e604ac36567a2ae2fad4d4c4346a71e83eb3da64.camel@rong.moe>
Subject: Re: [PATCH 2/2] ALSA: usb-audio: Do not expose sticky volume
 control mixers
From: Rong Zhang <i@rong.moe>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, Icenowy Zheng
	 <uwu@icenowy.me>
In-Reply-To: <87o6jsk3vs.wl-tiwai@suse.de>
References: <20260409-feaulle-rainbow-v1-0-09179e09000d@rong.moe>
		<20260409-feaulle-rainbow-v1-2-09179e09000d@rong.moe>
	 <87o6jsk3vs.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Apr 2026 22:20:30 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-9 
X-ZohoMailClient: External

Hi Takashi,

Thanks for your review.

On Thu, 2026-04-09 at 09:08 +0200, Takashi Iwai wrote:
> On Wed, 08 Apr 2026 20:33:06 +0200,
> Rong Zhang wrote:
> >=20
> > Some devices expose sticky mixers that accept SET_CUR but do absolutely
> > nothing. Registering mixers for them confuses userspace and results in
> > ineffective volume control.
> >=20
> > Check if the volume control is sticky by setting the volume to the
> > maximum or minimum value, and prevent the mixer from being registered
> > accordingly.
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
> > ---
> >  sound/usb/mixer.c | 37 +++++++++++++++++++++++++++++++++++--
> >  1 file changed, 35 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
> > index a25e8145af67..9f0aed36e27d 100644
> > --- a/sound/usb/mixer.c
> > +++ b/sound/usb/mixer.c
> > @@ -27,6 +27,7 @@
> >   *  	- parse available sample rates again when clock sources changed
> >   */
> > =20
> > +#include <linux/array_size.h>
>=20
> It's only for ARRAY_SIZE()?  Then no need for extra inclusion.  It's
> already included by others.
>=20
> >  #include <linux/bitops.h>
> >  #include <linux/init.h>
> >  #include <linux/list.h>
> > @@ -1287,17 +1288,49 @@ static int get_min_max_with_quirks(struct usb_m=
ixer_elem_info *cval,
> >  		if (cval->res =3D=3D 0)
> >  			cval->res =3D 1;
> > =20
> > -		/* Additional checks for the proper resolution
> > +		/* Additional checks
> > +		 *
> > +		 * Some devices expose sticky mixers that accept SET_CUR
> > +		 * but do absolutely nothing.
> >  		 *
> >  		 * Some devices report smaller resolutions than actually
> >  		 * reacting.  They don't return errors but simply clip
> >  		 * to the lower aligned value.
> >  		 */
> > -		if (cval->min + cval->res < cval->max) {
> > +		if (cval->min < cval->max) {
> > +			int sticky_test_values[] =3D { cval->min, cval->max };
> >  			int last_valid_res =3D cval->res;
> >  			int saved, test, check;
> > +			bool effective =3D false;
> > +
> >  			if (get_cur_mix_raw(cval, minchn, &saved) < 0)
> >  				goto no_res_check;
> > +
> > +			for (i =3D 0; i < ARRAY_SIZE(sticky_test_values); i++) {
> > +				test =3D sticky_test_values[i];
> > +				if (test =3D=3D saved)
> > +					continue;
> > +				/* Assume non-sticky on failure. */
> > +				if (snd_usb_set_cur_mix_value(cval, minchn, 0, test) ||
> > +				    get_cur_mix_raw(cval, minchn, &check) ||
> > +				    check !=3D saved) { /* SET_CUR effective, non-sticky. */
> > +					effective =3D true;
> > +					break;
> > +				}
> > +			}
> > +			if (!effective) {
> > +				usb_audio_warn(cval->head.mixer->chip,
> > +					"%d:%d: sticky mixer values (%d/%d/%d =3D> %d), disabling\n",
> > +					cval->head.id, mixer_ctrl_intf(cval->head.mixer),
> > +					cval->min, cval->max, cval->res, saved);
> > +
> > +				cval->initialized =3D 1;
> > +				cval->min =3D cval->max =3D cval->res =3D 0;
> > +				return -ENODEV;
> > +			}
> > +
> > +			if (cval->min + cval->res >=3D cval->max)
> > +				goto no_res_check;
>=20
> Hm, it's quite lots of changes, and I'd like this to be factored out
> as a function instead.  Maybe the resolution check code could be moved
> into a function, too; get_min_max_with_quirks() is too lengthy.

Sure, I will refactor the current code path beforehand when I resubmit
this.

Hmm, does patch 1 make sense to you? If so, I would be grateful if you
could you apply it separately so that I can send a new series solely
focusing on refactoring and adding the sticky mixer check.

>=20
> Also, note that currently there is no error check for get_min_max*().
> Your code works just because you set cval->min =3D cval->max, and there
> is an additional check at a later point of this.
>=20
> Ideally speaking, we should have an error check to explicitly handle a
> case like this.  But the current code allows the error at init, at
> least, we tolerate the errors at reading UAC_GET_MIN and _MAX.  So, if
> any, the error check would need to evaluate the error number and
> ignore -EINVAL or such...

Makes sense, I will address it beforehand when I resubmit this.

BTW, how about checking against -ENODEV instead? It can be considered to
be an indication that the caller should not register the mixer and is
much more readable. I don't have a strong preference for this though,
and ignoring -EINVAL also makes sense to me.

Thanks,
Rong

>=20
>=20
> thanks,
>=20
> Takashi
