Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A7523ABB9;
	Sun, 31 May 2026 13:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780235811; cv=pass; b=V1tG0kn3StwSBdmRE30r+jP4L989rcb38y8ON/+/sdkGPWLCuP55vmGqjtqmdJxD4hCTMRnBsr23Yy6tPrkI89nPeUQqCmzwtafocf2/2UZSAY+9GvDfPIcGPsLsDwImXqsAUl5UMiOAxSIryiMaYuq2QBudDk72RtJswclfHrQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780235811; c=relaxed/simple;
	bh=cxN2y8KaLja4zLka667P5bzD5w8vikreB/ITL9GtUt4=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=oIap2LJ/C/to16WORtDGnYJgFpI/ByDBPAxJG6GOmak/U1rmdVlrpaxwe+T7coYawkrJREmI+qw9PLPCBUPC4CrsIQ2jOWXBNIeXcucEW4nnwWcwsppYkJmrB+2xV+K3yfPBF0YfR0Mxbs6YHNDoElmuGH5moVIPjBWrJbJPUP0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=QPG69Mpx; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="QPG69Mpx"
ARC-Seal: i=1; a=rsa-sha256; t=1780235791; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ny9B3wILm+g1bJiivSLCqZ5DY5sY0n1cv4OcalqfuxsLrbrmwcrGOf1toAnLN3zqwGwKNWhMcxr1GqZ4BB9ZTPcjPhNijS7N/mcB7U8UAfC0McnWJ3jIshfWS4OZNUV6lkxOlw0mW6ZisMcQ9r3BUJ0gIp2H2pu9rSNG6METKzs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1780235791; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=wYB0FqqNCB9dsQSUVjQ3WjIA4oqgJ2KphRLSC/SEXIo=; 
	b=Qp7YLdTHq5DkmzKjcpgOzYyhbffxDf+H7+aucweMiiTBLnx/bxzcivfjfaPQkIeFuUF8CeAmD9akn6TwmF8rZvvf4KUSS4GXgUhHjA917B/yVwfxplKl4a6Ypb3OdEeE7hKEtmILKuICQV0OC3U29/BOW5ln+NjQm+TogLqzt5w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1780235791;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=wYB0FqqNCB9dsQSUVjQ3WjIA4oqgJ2KphRLSC/SEXIo=;
	b=QPG69MpxOssEDodA86ITL4NT397V0tZqtYwY45kexMEAkHp9WEJmpo1rAO/CBXWH
	yJphvKbnHUacd7DYfcf65Rt3TjZzG6/sOXk7t7uvEbLPXizulzhAelD04XEKuRSoZae
	9YiOg7TUi7tjoxzVRIntie09Z0yF9RGCeGgLHqxr6ztaHZMkod6vG+PNQzo0gL/OLce
	N8DhHL85WP59/hJgjB6yvb8C7ASmDTSaKCBHl9/CHF7Iwofd4WGQGRUxov8IuwvUIxq
	3WJB1ZvGRsBoFZicE0piUbIpdWYqjc5qhyQ63sxTq+iZYqXOGflltuaYyxEy0KcpEa3
	Md7GWRQtkw==
Received: by mx.zohomail.com with SMTPS id 1780235787309947.7530061527572;
	Sun, 31 May 2026 06:56:27 -0700 (PDT)
Message-ID: <47f764913c6a7ee6e01825f711a30ec44bf2d7bb.camel@rong.moe>
Subject: Re: [PATCH] ALSA: usb-audio: Set the value of potential sticky
 mixers to maximum
From: Rong Zhang <i@rong.moe>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Steve
 Smith <tarkasteve@gmail.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <877bojpvao.wl-tiwai@suse.de>
References: <20260531-uac-sticky-error-path-v1-1-12c2329d17ef@rong.moe>
	 <877bojpvao.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 31 May 2026 21:55:46 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-9 
X-ZohoMailClient: External

Hi Takashi,

On Sun, 2026-05-31 at 15:23 +0200, Takashi Iwai wrote:
> On Sat, 30 May 2026 21:52:49 +0200,
> Rong Zhang wrote:
> >=20
> > It makes no sense to restore the saved value for a sticky mixer, since
> > setting any value is a no-op.
> >=20
> > However, in some rare cases, SET_CUR is effective despite GET_CUR alway=
s
> > returns a constant value. These mixers are not sticky, but there's no
> > way to distinguish them. Without any additional information, the best
> > thing we can do is to set the mixer value to the maximum before bailing
> > out, so that a soft mixer can still reach the maximum hardware volume i=
f
> > the mixer turns out to be non-sticky. Meanwhile, all channels must be
> > synchronized to prevent imbalance volume.
> >=20
> > Fixes: 86aa1ea1f15c ("ALSA: usb-audio: Do not expose sticky mixers")
> > Signed-off-by: Rong Zhang <i@rong.moe>
> > ---
> >  sound/usb/mixer.c | 33 +++++++++++++++++++++++++++++----
> >  1 file changed, 29 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
> > index 5fba456eb4a9..fb37bb8ad9a9 100644
> > --- a/sound/usb/mixer.c
> > +++ b/sound/usb/mixer.c
> > @@ -1371,10 +1371,8 @@ static int get_min_max_with_quirks(struct usb_mi=
xer_elem_info *cval,
> >  				goto no_checks;
> > =20
> >  			ret =3D check_sticky_volume_control(cval, minchn, saved);
> > -			if (ret < 0) {
> > -				snd_usb_set_cur_mix_value(cval, minchn, 0, saved);
> > -				return ret;
> > -			}
> > +			if (ret < 0)
> > +				goto sticky;
> > =20
> >  			if (cval->min + cval->res < cval->max)
> >  				check_volume_control_res(cval, minchn, saved);
> > @@ -1431,6 +1429,33 @@ static int get_min_max_with_quirks(struct usb_mi=
xer_elem_info *cval,
> >  	}
> > =20
> >  	return 0;
> > +
> > +sticky:
> > +	/*
> > +	 * It makes no sense to restore the saved value for a sticky mixer,
> > +	 * since setting any value is a no-op.
> > +	 *
> > +	 * However, in some rare cases, SET_CUR is effective despite GET_CUR
> > +	 * always returns a constant value. These mixers are not sticky, but
> > +	 * there's no way to distinguish them. Without any additional
> > +	 * information, the best thing we can do is to set the mixer value to
> > +	 * the maximum before bailing out, so that a soft mixer can still rea=
ch
> > +	 * the maximum hardware volume if the mixer turns out to be non-stick=
y.
> > +	 * Meanwhile, all channels must be synchronized to prevent imbalance
> > +	 * volume.
> > +	 */
> > +	if (!cval->cmask) {
> > +		snd_usb_set_cur_mix_value(cval, 0, 0, cval->max);
> > +	} else {
> > +		for (i =3D 0; i < MAX_CHANNELS; i++) {
> > +			idx =3D 0;
> > +			if (cval->cmask & BIT(i)) {
> > +				snd_usb_set_cur_mix_value(cval, i + 1, idx, cval->max);
> > +				idx++;
> > +			}
> > +		}
> > +	}
> > +	return ret;
>=20
> This change is supposed to be applied only to 7.1,=C2=A0
>=20

This patch is meant for both 7.1 and 7.2.

> and 7.2 should take
> another your series ("ALSA: usb-audio: MIXER_GET_CUR_BROKEN related
> changes for 7.2") instead, right?
>=20

Right.

>   If so, at merging the latter, I'll
> revert this one as a preliminary.

Please don't revert this one in 7.2.

It is needed to make any future devices like that to at least have
audible volume out-of-box. Without it, users will have to wait for an
quirk table entry for their devices (or add one themselves). Since
setting the mixer value to maximum should be safe on both categories of
devices (sticky, effective SET_CUR but broken GET_CUR), I'd prefer to
retain this patch in 7.2 too.

Another reason of retaining it is that the current error path only
"restores" the garbage GET_CUR value for minchn, so it could lead to
imbalance volume if the mixer has multiple channels. In the effective
SET_CUR but broken GET_CUR case, we would still have to fix the error
path anyway to synchronize all channels. Since this patch does the job
and synchronize all channels using a non-garbage value, it should be
fine to retain it in 7.2.

That being said, this patch has a trivial single-line conflict in 7.2
because my series adding QUIRK_FLAG_MIXER_GET_CUR_BROKEN narrowed the
sticky path down to `ret =3D=3D -ENODEV'. I can resubmit the series for 7.2
to include a rebased version of this patch, should you prefer.

Thanks,
Rong

>=20
>=20
> thanks,
>=20
> Takashi
