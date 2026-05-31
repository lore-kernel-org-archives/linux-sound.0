Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18EB2331202;
	Sun, 31 May 2026 14:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780237256; cv=pass; b=qupc+LaolsA6DYkoMH+kUEDKSdfJa+DzmWdfj+EgjxlNDz9YBJAYAZK8x8KjNVwysNqjDEmmLYyScxzQZ5+61ffAWrJZIFgEfmimOqu5+bipj21j3WhEIIXmRwqx1t6GcX7F6eiUJX9GZ5k4YteGS8JhOT6LwS615UUBhXFY4gs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780237256; c=relaxed/simple;
	bh=DQA0WYqWUhbFdOSOPPJXCu9hbkXpABkKkbKfO70VSOo=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=OksqEGkt9ASZ3bDwp6Bur5YfDZDr/TE1vRNPm4K1BHNoDf7g5VpCdl2ycYERzRw89Vc9ICo2MI8IyLNoE+7Vi19Dq15KKf9uY2aVLwYB/JGA0JCbolJLw0u131f5Q4Tzeu027i/bCYb6SSBO9poFcCbagaaUUTpUC/lZhp9wNsc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=a1okUqrf; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="a1okUqrf"
ARC-Seal: i=1; a=rsa-sha256; t=1780237243; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FvPeV66XTKhIS7h9NpkJIo3sgxcI/oBmkGQaCN/M6Bhj6aFGwk0mMbuzYIllLmAyDKMhUz18lW4fKcChYdfu1wssPOQAje05VgtsclrnldWjP2XI5HWdYdjczOCt7uL2DizQKkjXkwdgklpLx9hnRe8aNbhhj8QRXc1g38ir1xQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1780237243; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=uvNuP5S12Q0I67p6xMJvIKiyQGAMQKP3awIlU90h00g=; 
	b=D4hDIQQj7d1mIxUP7pwORle3cji7rbYmdTQv6szo99Z3icWfl+0g+6iHrqpfS4jBcBUVh317/WNOIiONTw1VWsOFNAIBYzpynA4nQKugxAVej5eTvbW+T9DW1KzOuDDjM4XloAGVahYAAkWHUEmEdDrriyY2D94kcwbJTyq/FEU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1780237243;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=uvNuP5S12Q0I67p6xMJvIKiyQGAMQKP3awIlU90h00g=;
	b=a1okUqrfITg2SKA0MbasOcE112VLVxukPGNzlLA8VbQWKBQAOxNHIpmUi7P9NPu+
	nSKxnDZnDhRKxl9FDu2FlUWYPSp1GbZ/lLJMBfNz1R7/XOBVkIRgC4Y8YBKEA7qaIBc
	ARcz/Uch1XiwauAsNkBt7Gr/V8FlMN/ylpQTqOvnuSqRqCuCxVWWQghtGajW7U0x5E/
	V8GyxALH5JxyOVlcnvVgnOMiNx6zxnkOX37mOCVLAFPusWTVgyB4pPpQ5sqPOmhksUj
	vGQOVG64MDJJaHMMH1oKdfdaGnAyk6QS68Tf1RslfGTD3byCkMJWM6TsvFmmbNSTAZu
	+cpDC+IMyw==
Received: by mx.zohomail.com with SMTPS id 17802372401771005.1699999394822;
	Sun, 31 May 2026 07:20:40 -0700 (PDT)
Message-ID: <d8b3d9f07f78cb386449e1620bb99707b76453e2.camel@rong.moe>
Subject: Re: [PATCH] ALSA: usb-audio: Set the value of potential sticky
 mixers to maximum
From: Rong Zhang <i@rong.moe>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Steve
 Smith <tarkasteve@gmail.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <87y0gzoepb.wl-tiwai@suse.de>
References: <20260531-uac-sticky-error-path-v1-1-12c2329d17ef@rong.moe>
		<877bojpvao.wl-tiwai@suse.de>
		<47f764913c6a7ee6e01825f711a30ec44bf2d7bb.camel@rong.moe>
	 <87y0gzoepb.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 31 May 2026 22:19:42 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-9 
X-ZohoMailClient: External

Hi Takashi,

On Sun, 2026-05-31 at 16:07 +0200, Takashi Iwai wrote:
> On Sun, 31 May 2026 15:55:46 +0200,
> Rong Zhang wrote:
> > >=20
> > Hi Takashi,
> >=20
> > On Sun, 2026-05-31 at 15:23 +0200, Takashi Iwai wrote:
> > > On Sat, 30 May 2026 21:52:49 +0200,
> > > Rong Zhang wrote:
> > > >=20
> > > > It makes no sense to restore the saved value for a sticky mixer, si=
nce
> > > > setting any value is a no-op.
> > > >=20
> > > > However, in some rare cases, SET_CUR is effective despite GET_CUR a=
lways
> > > > returns a constant value. These mixers are not sticky, but there's =
no
> > > > way to distinguish them. Without any additional information, the be=
st
> > > > thing we can do is to set the mixer value to the maximum before bai=
ling
> > > > out, so that a soft mixer can still reach the maximum hardware volu=
me if
> > > > the mixer turns out to be non-sticky. Meanwhile, all channels must =
be
> > > > synchronized to prevent imbalance volume.
> > > >=20
> > > > Fixes: 86aa1ea1f15c ("ALSA: usb-audio: Do not expose sticky mixers"=
)
> > > > Signed-off-by: Rong Zhang <i@rong.moe>
> > > > ---
> > > >  sound/usb/mixer.c | 33 +++++++++++++++++++++++++++++----
> > > >  1 file changed, 29 insertions(+), 4 deletions(-)
> > > >=20
> > > > diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
> > > > index 5fba456eb4a9..fb37bb8ad9a9 100644
> > > > --- a/sound/usb/mixer.c
> > > > +++ b/sound/usb/mixer.c
> > > > @@ -1371,10 +1371,8 @@ static int get_min_max_with_quirks(struct us=
b_mixer_elem_info *cval,
> > > >  				goto no_checks;
> > > > =20
> > > >  			ret =3D check_sticky_volume_control(cval, minchn, saved);
> > > > -			if (ret < 0) {
> > > > -				snd_usb_set_cur_mix_value(cval, minchn, 0, saved);
> > > > -				return ret;
> > > > -			}
> > > > +			if (ret < 0)
> > > > +				goto sticky;
> > > > =20
> > > >  			if (cval->min + cval->res < cval->max)
> > > >  				check_volume_control_res(cval, minchn, saved);
> > > > @@ -1431,6 +1429,33 @@ static int get_min_max_with_quirks(struct us=
b_mixer_elem_info *cval,
> > > >  	}
> > > > =20
> > > >  	return 0;
> > > > +
> > > > +sticky:
> > > > +	/*
> > > > +	 * It makes no sense to restore the saved value for a sticky mixe=
r,
> > > > +	 * since setting any value is a no-op.
> > > > +	 *
> > > > +	 * However, in some rare cases, SET_CUR is effective despite GET_=
CUR
> > > > +	 * always returns a constant value. These mixers are not sticky, =
but
> > > > +	 * there's no way to distinguish them. Without any additional
> > > > +	 * information, the best thing we can do is to set the mixer valu=
e to
> > > > +	 * the maximum before bailing out, so that a soft mixer can still=
 reach
> > > > +	 * the maximum hardware volume if the mixer turns out to be non-s=
ticky.
> > > > +	 * Meanwhile, all channels must be synchronized to prevent imbala=
nce
> > > > +	 * volume.
> > > > +	 */
> > > > +	if (!cval->cmask) {
> > > > +		snd_usb_set_cur_mix_value(cval, 0, 0, cval->max);
> > > > +	} else {
> > > > +		for (i =3D 0; i < MAX_CHANNELS; i++) {
> > > > +			idx =3D 0;
> > > > +			if (cval->cmask & BIT(i)) {
> > > > +				snd_usb_set_cur_mix_value(cval, i + 1, idx, cval->max);
> > > > +				idx++;
> > > > +			}
> > > > +		}
> > > > +	}
> > > > +	return ret;
> > >=20
> > > This change is supposed to be applied only to 7.1,=C2=A0
> > >=20
> >=20
> > This patch is meant for both 7.1 and 7.2.
> >=20
> > > and 7.2 should take
> > > another your series ("ALSA: usb-audio: MIXER_GET_CUR_BROKEN related
> > > changes for 7.2") instead, right?
> > >=20
> >=20
> > Right.
> >=20
> > >   If so, at merging the latter, I'll
> > > revert this one as a preliminary.
> >=20
> > Please don't revert this one in 7.2.
> >=20
> > It is needed to make any future devices like that to at least have
> > audible volume out-of-box. Without it, users will have to wait for an
> > quirk table entry for their devices (or add one themselves). Since
> > setting the mixer value to maximum should be safe on both categories of
> > devices (sticky, effective SET_CUR but broken GET_CUR), I'd prefer to
> > retain this patch in 7.2 too.
> >=20
> > Another reason of retaining it is that the current error path only
> > "restores" the garbage GET_CUR value for minchn, so it could lead to
> > imbalance volume if the mixer has multiple channels. In the effective
> > SET_CUR but broken GET_CUR case, we would still have to fix the error
> > path anyway to synchronize all channels. Since this patch does the job
> > and synchronize all channels using a non-garbage value, it should be
> > fine to retain it in 7.2.
> >=20
> > That being said, this patch has a trivial single-line conflict in 7.2
> > because my series adding QUIRK_FLAG_MIXER_GET_CUR_BROKEN narrowed the
> > sticky path down to `ret =3D=3D -ENODEV'. I can resubmit the series for=
 7.2
> > to include a rebased version of this patch, should you prefer.
>=20
> OK, then let me merge this one to for-linus, and merge to for-next
> branch at first. =C2=A0
>=20

Many thanks.

> Then resubmit the patches that can be applied
> cleanly on for-next branch.  I can merge and resolve conflicts
> locally, but this would become a problem when backporting to older
> stable kernels in future.

Oh, I just noticed that you haven't pushed anything to your for-next
branch after merging my QUIRK_FLAG_MIXER_GET_CUR_BROKEN series, so the
ship hasn't sailed yet. Did you mean that you will drop my "ALSA: usb-
audio: Add QUIRK_FLAG_MIXER_GET_CUR_BROKEN for Sennheiser MOMENTUM 3"
from your local branch so that I can rebase and resubmit the series
then?

It sounds good to me. In this way I can also integrate the "ALSA: usb-
audio: MIXER_GET_CUR_BROKEN related changes for 7.2" series into the
QUIRK_FLAG_MIXER_GET_CUR_BROKEN series so things get tidier.

Thanks,
Rong

>=20
>=20
> thanks,
>=20
> Takashi
