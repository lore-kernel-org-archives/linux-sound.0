Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF11B3C3C0E;
	Thu,  9 Apr 2026 15:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775747592; cv=pass; b=FtHXdWaALKOSBp8McfE3UTkifzc1DhjfXaa+Hw3OBwm03z9iCOrFjgOYbBq3HnFxhXcmkMZgKdim5n0GP3olaRdsRtPoaUt+zmHhfcAFW0o11sQHUn4C9l31AisGHQX++GX2UW5BdkNbRhzs/MJLioWETul8xDc1pMuA2tiaUkk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775747592; c=relaxed/simple;
	bh=dwu4VSWI7GhgYDWgKVc31Qr0hzscMVuG15YTtmC57nI=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=I7cVJHW9tUSDx/+uZsPefhoJzMnnB78I60VNlISEP4TSqBZ/9bq5Fsq2qwOtioqwlsgEpfOOIt+UEdPmfFTIGmvNwTm1ejFy+yBNLKHF6dFfybkcUd9sIrt0AK0aOhS9p61BCmXrqlb6z9Nt+e69TT7jwSCDuG+W1epjmFatgbY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=PGtJoTJi; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="PGtJoTJi"
ARC-Seal: i=1; a=rsa-sha256; t=1775747578; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gTle/5dtWuTyDTDvVaK7i/Zut2Ineh+uQey8pE2QFdAuYmif86MUPG9z+UUaN5oGotNMniXVyAkmUUniu7dt2diKXBLeCm0snhZro7PzOTcE/6FjIvlFEZbq0qkGd56vpGca8wXky02ApfHyemrNp+A/xWGlq/Rmh+y7NArnQxY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1775747578; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=m4eA/8mwcMTPJG/HZuL2ec7Z7XjkMZgXIhDBOjM1Qmw=; 
	b=hFdrVKklpjMj6wHYKJP60B11nusPkMWaPcXrVGb7U/tOLN9xT3wyTfmj21YEQqud5CDB5gw6JnPoWflDwZTdmzNGr5OWqmGV8kY0LyawxTnVmh9fCT4W5TYPhsHaUi56SC/T27GbwLbtdrpYdmAF5eN+Ep5MWQj3WYM6tSwTAPI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1775747578;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=m4eA/8mwcMTPJG/HZuL2ec7Z7XjkMZgXIhDBOjM1Qmw=;
	b=PGtJoTJiC9w95EDQqPT0yHiuaNc5cS76srceslu/jf+eBUXjMDnIlStLAb506PIw
	JZoKs1FMGnlHBzByfes3ux2qbhf1/7IJyWp+EIzgWOtEDn9njropTSLX2sw0qhkr3Ga
	rChVpILVUaxbxOU6gCRKfBR05fMS1iP+g0LOChh+vM1tLufrbDNG0nBg9zP7+1BAZb8
	EU+54s7ASQXYS6qiTCDwj4Ls4wU9gS3GByi4Cx+SkFWjAdgkD3+uRVJuD+aB+6io5xF
	efHICjMfZb1aRlOfbpHgLuQJID8+50sF3bwt9u5Nzok8oGL4sqkiZQrYTAIQ6fQ87z5
	ybhsKrsj4A==
Received: by mx.zohomail.com with SMTPS id 177574757590049.38937833519742;
	Thu, 9 Apr 2026 08:12:55 -0700 (PDT)
Message-ID: <6be4efc167a0269b55090e8c6756dd8e70e269bf.camel@rong.moe>
Subject: Re: [PATCH 2/2] ALSA: usb-audio: Do not expose sticky volume
 control mixers
From: Rong Zhang <i@rong.moe>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, Icenowy Zheng
	 <uwu@icenowy.me>
In-Reply-To: <87ldewi4j8.wl-tiwai@suse.de>
References: <20260409-feaulle-rainbow-v1-0-09179e09000d@rong.moe>
		<20260409-feaulle-rainbow-v1-2-09179e09000d@rong.moe>
		<87o6jsk3vs.wl-tiwai@suse.de>
		<e604ac36567a2ae2fad4d4c4346a71e83eb3da64.camel@rong.moe>
	 <87ldewi4j8.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Apr 2026 23:07:50 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-9 
X-ZohoMailClient: External

Hi Takashi,

On Thu, 2026-04-09 at 16:36 +0200, Takashi Iwai wrote:
> On Thu, 09 Apr 2026 16:20:30 +0200,
> Rong Zhang wrote:
> >=20
> > Hi Takashi,
> >=20
> > Thanks for your review.
> >=20
> > On Thu, 2026-04-09 at 09:08 +0200, Takashi Iwai wrote:
> > > On Wed, 08 Apr 2026 20:33:06 +0200,
> > > Rong Zhang wrote:
> > > >=20
> > > > Some devices expose sticky mixers that accept SET_CUR but do absolu=
tely
> > > > nothing. Registering mixers for them confuses userspace and results=
 in
> > > > ineffective volume control.
> > > >=20
> > > > Check if the volume control is sticky by setting the volume to the
> > > > maximum or minimum value, and prevent the mixer from being register=
ed
> > > > accordingly.
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
> > > > ---
> > > >  sound/usb/mixer.c | 37 +++++++++++++++++++++++++++++++++++--
> > > >  1 file changed, 35 insertions(+), 2 deletions(-)
> > > >=20
> > > > diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
> > > > index a25e8145af67..9f0aed36e27d 100644
> > > > --- a/sound/usb/mixer.c
> > > > +++ b/sound/usb/mixer.c
> > > > @@ -27,6 +27,7 @@
> > > >   *  	- parse available sample rates again when clock sources chang=
ed
> > > >   */
> > > > =20
> > > > +#include <linux/array_size.h>
> > >=20
> > > It's only for ARRAY_SIZE()?  Then no need for extra inclusion.  It's
> > > already included by others.
> > >=20
> > > >  #include <linux/bitops.h>
> > > >  #include <linux/init.h>
> > > >  #include <linux/list.h>
> > > > @@ -1287,17 +1288,49 @@ static int get_min_max_with_quirks(struct u=
sb_mixer_elem_info *cval,
> > > >  		if (cval->res =3D=3D 0)
> > > >  			cval->res =3D 1;
> > > > =20
> > > > -		/* Additional checks for the proper resolution
> > > > +		/* Additional checks
> > > > +		 *
> > > > +		 * Some devices expose sticky mixers that accept SET_CUR
> > > > +		 * but do absolutely nothing.
> > > >  		 *
> > > >  		 * Some devices report smaller resolutions than actually
> > > >  		 * reacting.  They don't return errors but simply clip
> > > >  		 * to the lower aligned value.
> > > >  		 */
> > > > -		if (cval->min + cval->res < cval->max) {
> > > > +		if (cval->min < cval->max) {
> > > > +			int sticky_test_values[] =3D { cval->min, cval->max };
> > > >  			int last_valid_res =3D cval->res;
> > > >  			int saved, test, check;
> > > > +			bool effective =3D false;
> > > > +
> > > >  			if (get_cur_mix_raw(cval, minchn, &saved) < 0)
> > > >  				goto no_res_check;
> > > > +
> > > > +			for (i =3D 0; i < ARRAY_SIZE(sticky_test_values); i++) {
> > > > +				test =3D sticky_test_values[i];
> > > > +				if (test =3D=3D saved)
> > > > +					continue;
> > > > +				/* Assume non-sticky on failure. */
> > > > +				if (snd_usb_set_cur_mix_value(cval, minchn, 0, test) ||
> > > > +				    get_cur_mix_raw(cval, minchn, &check) ||
> > > > +				    check !=3D saved) { /* SET_CUR effective, non-sticky. */
> > > > +					effective =3D true;
> > > > +					break;
> > > > +				}
> > > > +			}
> > > > +			if (!effective) {
> > > > +				usb_audio_warn(cval->head.mixer->chip,
> > > > +					"%d:%d: sticky mixer values (%d/%d/%d =3D> %d), disabling\n",
> > > > +					cval->head.id, mixer_ctrl_intf(cval->head.mixer),
> > > > +					cval->min, cval->max, cval->res, saved);
> > > > +
> > > > +				cval->initialized =3D 1;
> > > > +				cval->min =3D cval->max =3D cval->res =3D 0;
> > > > +				return -ENODEV;
> > > > +			}
> > > > +
> > > > +			if (cval->min + cval->res >=3D cval->max)
> > > > +				goto no_res_check;
> > >=20
> > > Hm, it's quite lots of changes, and I'd like this to be factored out
> > > as a function instead.  Maybe the resolution check code could be move=
d
> > > into a function, too; get_min_max_with_quirks() is too lengthy.
> >=20
> > Sure, I will refactor the current code path beforehand when I resubmit
> > this.
> >=20
> > Hmm, does patch 1 make sense to you? If so, I would be grateful if you
> > could you apply it separately so that I can send a new series solely
> > focusing on refactoring and adding the sticky mixer check.
>=20
> OK, I'm going to apply only the first patch now.

Thanks a lot!

>=20
> > >=20
> > > Also, note that currently there is no error check for get_min_max*().
> > > Your code works just because you set cval->min =3D cval->max, and the=
re
> > > is an additional check at a later point of this.
> > >=20
> > > Ideally speaking, we should have an error check to explicitly handle =
a
> > > case like this.  But the current code allows the error at init, at
> > > least, we tolerate the errors at reading UAC_GET_MIN and _MAX.  So, i=
f
> > > any, the error check would need to evaluate the error number and
> > > ignore -EINVAL or such...
> >=20
> > Makes sense, I will address it beforehand when I resubmit this.
> >=20
> > BTW, how about checking against -ENODEV instead? It can be considered t=
o
> > be an indication that the caller should not register the mixer and is
> > much more readable. I don't have a strong preference for this though,
> > and ignoring -EINVAL also makes sense to me.
>=20
> The -EINVAL could be a temporary error at the probe time, and there
> were cases where the later read works.  I meant the code:
>=20
> 		if (get_ctl_value(cval, UAC_GET_MAX, (cval->control << 8) | minchn, &cv=
al->max) < 0 ||
> 		    get_ctl_value(cval, UAC_GET_MIN, (cval->control << 8) | minchn, &cv=
al->min) < 0) {
> 			usb_audio_err(cval->head.mixer->chip,
> 				      "%d:%d: cannot get min/max values for control %d (id %d)\n",
> 				   cval->head.id, mixer_ctrl_intf(cval->head.mixer),
> 							       cval->control, cval->head.id);
> 			return -EINVAL;
> 		}
>=20
> ... and maybe -EINVAL isn't really a good sign, but better to replace
> with -EAGAIN.  Then continuing after -EAGAIN in the caller side would
> become more logical.

Thanks for your detailed explanation. It makes sense. I will refactor
the code path to return -EAGAIN and make callers ignore it when I
resubmit this.

Thanks,
Rong

>=20
>=20
> thanks,
>=20
> Takashi
