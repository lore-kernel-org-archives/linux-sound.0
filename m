Received: from sender6-op-o15.zoho.com (sender6-op-o15.zoho.com [165.173.180.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4296E4B04B9;
	Sun, 16 Aug 2026 13:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786888581; cv=pass; b=ifKo82pbZ1vSbWgA0J4ivxUIfW5BeTw4ynmmjGJPQevgvFF+jAfw4i92myMAnUDVj5LOsJnjgEwzxrdZ8Bh4uTgiIuaG6wiI/qV8UmE6KMZYfoi3st/dg42nhTG/oUdQmcW+d7pPKT6Xm8hCKdSo/r7VurWxW8XsMPdZNGYNxxk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786888581; c=relaxed/simple;
	bh=9C8gHnzr+GqjcbdFexAhCUCmEXdFjZ6IAagdzMoRwng=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=i/lQ2LbB8KcBKNBn3WTeeh+DydC8Blu9NxRQShcieD+mD6GH81Z0rsPnGytGURPtYyfeZLJVzC2qBGtFQonZk7Zita1PsAP+MptRUF1uG7PTbH9Hu+IU7jl7mmjeZO+kzIJKMAi6sz/nkBcpoZh+j5/qVwXAVn8CiuJhgsBlKjE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=NFCxBZ9R; arc=pass smtp.client-ip=165.173.180.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="NFCxBZ9R"
ARC-Seal: i=1; a=rsa-sha256; t=1786888558; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Z+Grnaur5/U3BIt/8lZdpPrewzuGL7vaDz+fVY2jz8nC2sgHc0XCj6HyAn+mDyom+Sa4KqbPBIXlhzZoWcJo+cvAgvYcbCG6C5kkiHBb/Ny5RHQOuO4dYXABibkIlDehr1bLI4bGaiOu1YwlHv1A9ES+sLfbgkjv+4Ht5T3ZtD0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1786888558; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=WRQk5CPXWexLhEmcPZEORdhTa0lunq5g9M848cSQnLw=; 
	b=iy/oumssT3XuA5U5fslsSA65VXUuIX9Lw4Z4Dro1lReY2MlmE1WwFqsIuD2GqzDdumTYUEkgp3erLHhlOxjCPqOWnXF8Rm1uINNY8kr3T+McHA1PsSQycRYVkItjg3QCJQwLgHzqHWYJGmEyA8ixvyTXy9hmAkroZQSm/DzFzcc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1786888558;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=WRQk5CPXWexLhEmcPZEORdhTa0lunq5g9M848cSQnLw=;
	b=NFCxBZ9Rtk1KysazweLtoPMmjD8grgXso8rfAQpkwpF/am8taC7SPqLG769eyrxU
	lOAe4F761BI6nLda+ar9+QYkY+6BM47GaxVhq3lt9JMGWXp8M8FjPIoNcz6ybjnrrvC
	Qklm6kir7Kfix4dasazembdebzg/8eie7JoCeKKgASkoejuDdBVm5XJsde1fzzXEW51
	MAmNiv28s/gCXSK8KBqMj97sch1jQhfT3Of8CcGq3jdTjUb13SSAAaGwBX7VkPQERR2
	47iiZbWGD2ZeVpohkDTgjx7kd21AQlnzuH4BRcs6dllH7M1MHowf+C1ZFKH0QPBJs9z
	UggcQ8H6Sw==
Received: by mx.zohomail.com with SMTPS id 1786888556440679.1138097994262;
	Sun, 16 Aug 2026 06:55:56 -0700 (PDT)
Message-ID: <1abcec7c1a99e27f7d354ad35a36761099cfa587.camel@rong.moe>
Subject: Re: [PATCH] ALSA: usb-audio: Check sticky mixers precisely
From: Rong Zhang <i@rong.moe>
To: Alexander Niemeyer <adventureFAN@gmx.de>, Jaroslav Kysela
 <perex@perex.cz>,  Takashi Iwai <tiwai@suse.com>
Cc: Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
In-Reply-To: <d62a54f6-c3dc-4502-b61c-6cdc49fe40f0@gmx.de>
References: <20260816-uac-precise-sticky-check-v1-1-00798373dc3c@rong.moe>
	 <d62a54f6-c3dc-4502-b61c-6cdc49fe40f0@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 16 Aug 2026 21:50:40 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-10+b1 
X-ZohoMailClient: External

Hi Alexander,

On Sun, 2026-08-16 at 07:14 +0200, Alexander Niemeyer wrote:
> Hi Rong,
>=20
> I tested the sticky-check part of your patch on the Logitech PRO X=20
> Wireless (046d:0aba) on Fedora 44, kernel 7.1.8-200.fc44.x86_64.
>=20
> Since your patch is based on a newer tree, I used a minimal backport of=
=20
> the new ~16-value / 10 ms sticky-check logic to the 7.1.8 code. The=20
> GET_CUR-broken handling from the newer tree was not included; GET_CUR=20
> itself succeeds on this device.
>=20
> Unfortunately, the playback control is still classified as sticky:
>=20
> 2:0: sticky mixer values (-16384/0/256 =3D> -3840), disabling
>=20
> I then instrumented the check and tried an additional diagnostic: after=
=20
> every successful SET_CUR, wait 100 ms and perform another GET_CUR before=
=20
> issuing the next SET_CUR.
>=20
> For the playback volume, the saved value was -3840 and GET_CUR remained=
=20
> at -3840 for every tested value, even after 100 ms, for example:
>=20
> test=3D-15104 immediate=3D-3840 after100ms=3D-3840
> test=3D-13824 immediate=3D-3840 after100ms=3D-3840
> test=3D-3584 immediate=3D-3840 after100ms=3D-3840
> test=3D-2304 immediate=3D-3840 after100ms=3D-3840
> test=3D-1024 immediate=3D-3840 after100ms=3D-3840
> test=3D0 immediate=3D-3840 after100ms=3D-3840
>=20
> So in this case the issue does not appear to be simply that the=20
> accumulated 10 ms sleeps are too short. During the probe-time sticky=20
> check, SET_CUR succeeds but GET_CUR for the playback control remains=20
> unchanged even when each SET_CUR is given 100 ms before the next one.
>=20
> This differs from my previous direct libusb tests with the AudioControl=
=20
> interface unbound, where valid SET_CUR values became visible through=20
> GET_CUR after roughly 47=E2=80=9381 ms.

Really interesting. Maybe the mixer changes its value only when there is
an opened playback stream.

Could you clarify your "libusb tests"?

Thanks,
Rong

>=20
> The first debug line I saw with |saved=3D0| was from the Mic Capture=20
> Volume control; that control changed immediately and returned as=20
> non-sticky. The sequence above with |saved=3D-3840| is the problematic PC=
M=20
> Playback Volume control.
>=20
> I'd be happy to test another version or run additional diagnostics if=20
> useful.
>=20
> Best regards,
> Alexander
>=20
>=20
> Am 15.08.2026 um 23:47 schrieb Rong Zhang:
> > Some mixers are asynchronous, and some have broken min/max. They are
> > mistakenly considered sticky due to how the check is implemented.
> >=20
> > Check sticky mixers more precisely by checking approximately 16 values
> > and adding a msleep(10) between each check, so that asynchronous mixers
> > have enough time to change the value and mixers with broken min/max are
> > checked properly. Additionally, mark GET_CUR as broken when
> > get_cur_mix_raw() fails, instead of returning successfully.
> >=20
> > Reported-by: Alexander Niemeyer <adventureFAN@gmx.de>
> > Closes: https://lore.kernel.org/r/6262cbbd-d1f2-4c9d-a1c7-9c5d12636f4b@=
gmx.de
> > Signed-off-by: Rong Zhang <i@rong.moe>
> > ---
> >   sound/usb/mixer.c | 51 ++++++++++++++++++++++++++++++++++++++++++++--=
-----
> >   1 file changed, 44 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
> > index 703c118f9d4e..3d0f97730a06 100644
> > --- a/sound/usb/mixer.c
> > +++ b/sound/usb/mixer.c
> > @@ -1256,22 +1256,59 @@ static void init_cur_mix_raw(struct usb_mixer_e=
lem_info *cval, int ch, int idx)
> >   static int check_sticky_volume_control(struct usb_mixer_elem_info *cv=
al,
> >   				       int channel, int saved)
> >   {
> > -	int sticky_test_values[] =3D { cval->min, cval->max };
> > -	int test, check, i;
> > +	int test, check, res;
> > +
> > +	/*
> > +	 * Check approximately 16 values (15 intervals).
> > +	 * If the resolution is not fine enough, check fewer values.
> > +	 */
> > +	res =3D DIV_ROUND_UP(cval->max - cval->min, 15);
> > +	res =3D res ? roundup(res, cval->res) : cval->res;
> > +
> > +	/*
> > +	 * If (cval->max - cval->min) is not a multiple of cval->res, we stil=
l
> > +	 * want to test cval->max anyway.
> > +	 */
> > +	for (test =3D cval->min; test < cval->max + res; test +=3D res) {
> > +		if (test > cval->max)
> > +			test =3D cval->max;
> >  =20
> > -	for (i =3D 0; i < ARRAY_SIZE(sticky_test_values); i++) {
> > -		test =3D sticky_test_values[i];
> >   		if (test =3D=3D saved)
> >   			continue;
> >  =20
> >   		/* Assume non-sticky on failure. */
> > -		if (snd_usb_set_cur_mix_value(cval, channel, 0, test) ||
> > -		    get_cur_mix_raw(cval, channel, &check) ||
> > -		    check !=3D saved) /* SET_CUR effective, non-sticky. */
> > +		if (snd_usb_set_cur_mix_value(cval, channel, 0, test))
> > +			return 0;
> > +
> > +		if (get_cur_mix_raw(cval, channel, &check))
> > +			goto get_cur_broken;
> > +		if (check !=3D saved) /* SET_CUR effective, non-sticky. */
> >   			return 0;
> > +
> > +		/*
> > +		 * Leave some time for asynchronous mixers to change the value.
> > +		 *
> > +		 * Note that there is no need to wait between SET_CUR and
> > +		 * GET_CUR, as we don't care whether the GET_CUR value matches
> > +		 * the SET_CUR one. IOW, what we expect is just a GET_CUR value
> > +		 * differing from the saved one.
> > +		 *
> > +		 * Mixers of most devices are synchronous. The should have
> > +		 * returned early without extra sleep. Asynchronous mixers will
> > +		 * return once the accumulated time is enough for them to change
> > +		 * the value.
> > +		 */
> > +		msleep(10);
> >   	}
> >  =20
> > +	/* Check again after the last msleep(). */
> > +	if (get_cur_mix_raw(cval, channel, &check))
> > +		goto get_cur_broken;
> > +	if (check !=3D saved)
> > +		return 0;
> > +
> >   	if (cval->head.mixer->chip->quirk_flags & QUIRK_FLAG_MIXER_GET_CUR_B=
ROKEN) {
> > +get_cur_broken:
> >   		usb_audio_info(cval->head.mixer->chip,
> >   			       "%d:%d: broken mixer GET_CUR (%d/%d/%d =3D> %d)\n",
> >   			       cval->head.id, mixer_ctrl_intf(cval->head.mixer),
> >=20
> > ---
> > base-commit: 3eb40771c00a8488fa6ed2cc1fe203477908bf38
> > change-id: 74676fce-uac-precise-sticky-check-94474a22b57d
> >=20
> > Thanks,
> > Rong
> >=20
