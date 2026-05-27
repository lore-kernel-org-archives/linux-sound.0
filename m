Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C673EEAEE;
	Wed, 27 May 2026 18:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779905035; cv=pass; b=WgWlju/yLNusWTepejhxOZIBYQUDdho15jDUyO8NLybIYM2C80M+HZ+RbURKEAGh7fy1HZrL/OMoco6NpHdVQl0t3LN1gcylXX0JqnoOS3+bTGpyaQ3oOOcwRoLQE4Bu/eVBKfxczVekH+uuNmOlbV6jnD3kOzjfMruBV692gug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779905035; c=relaxed/simple;
	bh=9NE1U5Y+LU+TJrHg0ZJQodmwW/H3SP7Y9HxyC95AnGE=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=gxww3ibSFySKLBfTKj0WUF2zd+/VOm0jhCcpgqTArqYmsgkLOKfeTw8loIXw/7BRvB5V9eLMtBqGcPFdLLIF2hetPRgxiOktSqvjsunueDRDNWVzOnuDlzS0jlEtdmHQnCcbGsnGEgJplWD91U4aMcQwHwG1vITC2ikf4hRflR8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=pYciJdN/; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="pYciJdN/"
ARC-Seal: i=1; a=rsa-sha256; t=1779905017; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=A2Zuf9c2qYWXtEQkLLvwlKxhjgO2kjFZzVN5K3YVGIQGgsOQld1M+EFmxRQzq0sDl8ZH+SDTqosNmwjNAQlC3bZym5MhR5yHcxxcTUt0XUKODUzj776plJgUQpUVx+XNGsvES+fWub81KbbT3odPqRHMx4+gq2En/HQZz7/5S6U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779905017; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=xTRtxc5my+dZUuILLnX1aDJNMlVpiFAe1vA0Qh3Roxo=; 
	b=BE3xChQxKKtzQyrgmsrKtszp65Igv9Cbgiyb/uk9Llk8SIqC3yTBqRm/4HIN83JSEx3mbIlQaRy2l1ifVJnYk1I9iF/NABIM6zftO0DHBHMCyMQg6V3Zbd5lRV8URQ4mjY0u35q//cU52as4Nd63I3f2EgR1Ng/hf+A9n20AXsc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779905017;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=xTRtxc5my+dZUuILLnX1aDJNMlVpiFAe1vA0Qh3Roxo=;
	b=pYciJdN/H7MzTFgpy8zS71Bq95Pjx21I6dmiCw7uU5mtcACltLq0I8Gtz9h549i8
	BjK/YXC+pr5r0hBq7SGac9ciSiksGtcDkAizAZHIJqlePJFt4VOb2NFtwn12Q9RD7tB
	+aW+iVFSlYho+h1TV9S7LPj5lYybHUcJkpJgbrtzFLgylVL2eAVDvas+9OD7hRXM04m
	m2/FtTxz6jyu19bDRupEIvXBpTwrmIe49avgSE3qLcfJGa6S26RFp2JOYXLMcxqA0lU
	08vblp50uyjSntGzRHtFEb2+y3bwQeQxoQfmU8uS57B71RDiSioTYYyI1UOgVTn731b
	NBtitHLrEA==
Received: by mx.zohomail.com with SMTPS id 1779905014735968.8590115968572;
	Wed, 27 May 2026 11:03:34 -0700 (PDT)
Message-ID: <744f0877b0b8099a7676cca92e820dfb84f8e3fa.camel@rong.moe>
Subject: Re: [PATCH 2/3] ALSA: usb-audio: Add
 QUIRK_FLAG_MIXER_SKIP_GET_CUR_VOL
From: Rong Zhang <i@rong.moe>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Jonathan Corbet
	 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Gordon Chen
	 <chengordon326@gmail.com>, linux-sound@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <87tsrtwgyc.wl-tiwai@suse.de>
References: <20260527-uac-quirk-get-cur-vol-v1-0-e9362b712e5e@rong.moe>
		<20260527-uac-quirk-get-cur-vol-v1-2-e9362b712e5e@rong.moe>
	 <87tsrtwgyc.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 28 May 2026 01:58:29 +0800
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

On Wed, 2026-05-27 at 07:37 +0200, Takashi Iwai wrote:
> On Tue, 26 May 2026 19:49:24 +0200,
> Rong Zhang wrote:
> >=20
> > Since commit 86aa1ea1f15c ("ALSA: usb-audio: Do not expose sticky
> > mixers"), the UAC mixer core utilizes volume SET_CUR and GET_CUR to
> > identify devices with sticky mixers. Unfortunately, even though most
> > devices with sticky GET_CUR also have corresponding sticky SET_CUR,
> > which I actually met more since the commit had been merged, there is
> > also a rare case that some devices may have volume mixers that responds
> > to SET_CUR properly but with its GET_CUR stubbed. This cause the sticky
> > check to consider the mixer to be sticky and unnecessarily disable it.
> >=20
> > Add QUIRK_FLAG_MIXER_SKIP_GET_CUR_VOL to prevent sending GET_CUR to
> > mixers by returning -ENXIO early. The error effectively skips the stick=
y
> > check as it's only meaningful when the mixer has some sort of self-
> > awareness. Similar to QUIRK_FLAG_GET_SAMPLE_RATE, this should also help
> > if some unmet devices can't tolerate volume GET_CUR in other ways.
> >=20
> > Signed-off-by: Rong Zhang <i@rong.moe>
> > ---
> >  Documentation/sound/alsa-configuration.rst | 4 ++++
> >  sound/usb/mixer.c                          | 5 +++++
> >  sound/usb/quirks.c                         | 1 +
> >  sound/usb/usbaudio.h                       | 6 ++++++
> >  4 files changed, 16 insertions(+)
> >=20
> > diff --git a/Documentation/sound/alsa-configuration.rst b/Documentation=
/sound/alsa-configuration.rst
> > index 4b30cd63c5a5..bc3bc65c379a 100644
> > --- a/Documentation/sound/alsa-configuration.rst
> > +++ b/Documentation/sound/alsa-configuration.rst
> > @@ -2389,6 +2389,10 @@ quirk_flags
> >            from snd_usb_handle_sync_urb. Instead fall through and enque=
ue a
> >            packet_info containing only size-0 packets, so the OUT ring =
keeps
> >            moving (emits silence). Needed by Behringer Flow 8 (1397:050=
c).
> > +        * bit 30: ``mixer_skip_get_cur_vol``
> > +          Skip reading current volume for mixers, as some devices retu=
rn
> > +          constant values or errors but otherwise works fine, i.e., se=
tting
> > +          volume takes desired effect.
> > =20
> >  This module supports multiple devices, autoprobe and hotplugging.
> > =20
> > diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
> > index d61bde654219..3b745aebb181 100644
> > --- a/sound/usb/mixer.c
> > +++ b/sound/usb/mixer.c
> > @@ -420,6 +420,11 @@ static int get_cur_ctl_value(struct usb_mixer_elem=
_info *cval,
> >  static inline int get_cur_mix_raw(struct usb_mixer_elem_info *cval,
> >  				  int channel, int *value)
> >  {
> > +	struct snd_usb_audio *chip =3D cval->head.mixer->chip;
> > +
> > +	if (chip->quirk_flags & QUIRK_FLAG_MIXER_SKIP_GET_CUR_VOL)
> > +		return -ENXIO;
>=20
> So this workaround is applied to all mixer controls?

Hmm, it is indeed not very optimal. My initial idea was to prevent
returning bogus values at all, so I gated GET_CUR here. But as you've
said this could have a wide impact on other mixers...

>=20
> We can put it as a common quirk as you've done, but the question is
> how many devices need this, too...

While I am not sure if more devices need this (my intuition says yes),
how about a less radical approach that still relies on the sticky check?

- Rename the quirk flag to QUIRK_FLAG_MIXER_GET_CUR_BROKEN.
- Add a flag to struct usb_mixer_elem_info to gate GET_CUR.
- When the sticky check fails, check quirk flags. Gate further GET_CUR
if the quirk flag is set, otherwise disable the mixer as usual.
- A mixer with GET_CUR gated will solely relies on the internal cache of
last set volume.

The quirk flag still applies to all mixers, but as long as a mixer makes
the sticky check happy, it won't be affected at all. Only those mixers
with constant GET_CUR values will have their GET_CUR gated. I assume the
impact is minimal, since it's very unlikely a device would have sticky
mixers (broken SET_CUR) along with mixers with working SET_CUR but
broken GET_CUR at the same time.

Thanks,
Rong

>=20
>=20
> thanks,
>=20
> Takashi
