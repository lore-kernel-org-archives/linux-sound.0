Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D062B2D8388
	for <linux-sound@vger.kernel.org>; Tue,  7 Oct 2025 11:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759836146; cv=none; b=pjQh+l3CqbukbLDBMGiWYiuN6Cl5Q6IIR9ZcWK7DOS9ShHsxZVYh4vwPI2mIBz+0zw4+c+VaM1A4GvvGV23BWu/GS0jikmvI/It+UDO5iv4Fn+yPt7SUptTCik669d8dF+3r9Dzm2Iu5SBdHmPwWBYO54iUIjya+294bAJR+hSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759836146; c=relaxed/simple;
	bh=TP6L6nX6UruJ3pB+cOIOamthEdmmWNRvoKyQ0cJzqW4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OwR5nUFB/FIFrhAM7BDUvykF1SYFVYDorOt1cmFfiJcdiBTzSNNxC95XJT9AW5TJnhCyVL6Lik5qqCbwVB/QhsYoBo6Kr/CnYCaBk3bD5236fusDorJYhg13OYCehWKcoDitrBjH7ITAZxXJu4Ydhgj0YSGm9cxudo9Ts1yBJUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PSgduCEa; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PSgduCEa"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7b6ac55cf86so3776309a34.1
        for <linux-sound@vger.kernel.org>; Tue, 07 Oct 2025 04:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759836143; x=1760440943; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LOKak42BxSjTqNtj6mYpJxlR5q3B9F54/H2laJuu/Ec=;
        b=PSgduCEaOGJtAs0kAMA+m9MfN+63lbfNJo1EtMgpMw+RQ8i87w/R2Ff893KDmJlk5i
         1OCg936wXjcn0ma1nx7F5vgR5E43UNbWcyzZXnVoqpRSOQmGz+OnnqJjJ7PJLRNtkJ7U
         1H8GFhZBfrnOot3TcFgcDIjnPAXl/smLvkuPY0bFNZWMBS+pXy1f4LjmEeFdu9W5kvcT
         2/2sXyMAu1IRk1N0pj1OSihWc6Obe2bV0+4sWHG1ePeT0vzToHugDQN32CWZfqFb3bGv
         HYajYq8nNYAOhvWD4p+vCZc2VwIy9kRDmDOLaXAYCk/bREM7ECBuZooD172ZNt+8ZaRr
         Hy3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759836143; x=1760440943;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LOKak42BxSjTqNtj6mYpJxlR5q3B9F54/H2laJuu/Ec=;
        b=xUBuSvPmBGqlPFvuPVovSl0JtBq75J7kOHHXGJp/vSmJ7qiU/v7/ovGsyzFzB7F3cO
         MspNYPYb1Sa0jDqhpkAgln4K8Hct4FsRzeKXsavWQ3A0k2+a3V+8HxU6kFkRpE6yIqU1
         IXPihcIEtYFFnzfqzk3YdSh3vY5sTY5h7uUF35SCzYKOIYWoNkDq2MLUj2V3BswUT3ww
         pVgSaZboHrYxKwmL6qyfYVKhXQd0QFJ6NR9bzTqtvb+qINXEbPpCIDL5Abac4tn7K660
         tLsbUceg4w6NB5Ky/IjNNtwMqvdMp3g30KUGp4HwfoB7LFmc/K2Gp7dPLpEwmSyiXc5i
         V3NA==
X-Forwarded-Encrypted: i=1; AJvYcCXGiA5gTyUDErgCi6kBn2d3dWnpR8QJmvfjLeWc0AK54AP4L7s4bYh9DFfDn/annvhPdhUpsxroPorJ/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzzoEvR8mUHQUZ/hOLNXns12sKmVLbst9H40vGQo8+SYlcyxJJx
	aq9UfF7AsJZHmNci8KQwDBmN68pbDtJ3a12ymRqvcCbyAZdRm336zvemqKuPFwAx6SoyeOJwDR1
	2iSvlF9BJV5sxMSYZLvt7xTm4jOXI/7A=
X-Gm-Gg: ASbGncsZRnZdMISygxI7UjnmsW07dJUoC2xUoSMeRiKNnbLGEtBH+37odFuC96sQS+W
	n/3eReeq+Cygz9ctohNyNjY/aoDrXUxMCqZVNBEYxGKeC2pfqjsZCPm6oshItReoQ5PFQvALqvg
	B621dtNuOd3QXLYe/cYiNkjAqJg8oy2AkK8FW/pwkfA3qzuKZVHK7NeJDIL4LLvO0LPTinVqxbX
	1X3GFpkLSwZQ+aSZcGNTeLlT+bnlrY=
X-Google-Smtp-Source: AGHT+IGrDawY9ofKGk9/eyTmUOL3jD2x4B6Okgu7pwFdf2migeP2i5Onul05hLHaz6ZGnGeCGy7mHZDRguWDu53W2LY=
X-Received: by 2002:a05:6830:25d1:b0:7aa:abca:b464 with SMTP id
 46e09a7af769-7bf772d468amr6869487a34.2.1759836142707; Tue, 07 Oct 2025
 04:22:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251003091304.3686-1-briansune@gmail.com> <aOTrsYllMst3oR03@opensource.cirrus.com>
In-Reply-To: <aOTrsYllMst3oR03@opensource.cirrus.com>
From: Sune Brian <briansune@gmail.com>
Date: Tue, 7 Oct 2025 19:22:10 +0800
X-Gm-Features: AS18NWDeJ5CTjgoTVdMOiXo-PridYXAlKWUdewUGLzoadrVfqQMt6DgBwSY5GEs
Message-ID: <CAN7C2SB5Re35yGYsqr14hGXde3nTKLX2Aa3ZbuJ9xuT0m07uxg@mail.gmail.com>
Subject: Re: [PATCH] sound/soc/codecs/wm8978: add missing BCLK divider setup
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Charles Keepax <ckeepax@opensource.cirrus.com> =E6=96=BC 2025=E5=B9=B410=E6=
=9C=887=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=886:30=E5=AF=AB=E9=81=
=93=EF=BC=9A
>
> On Fri, Oct 03, 2025 at 05:13:04PM +0800, Brian Sune wrote:
>
> Patch title should be tweaked to match the other patches to this
> driver:
>
> ASoC: wm8978: ...

Will submit update patch, thank you.

>
> > The original WM8978 codec driver did not set the BCLK (bit clock)
> > divider, which can cause audio clocks to be incorrect or unstable
> > depending on the sample rate and word length.
>
> This isn't totally accurate, the driver expects it will be set
> through the set_clkdiv callback. Which one could probably argue
> is a bit of a more legacy approach, but probably worth calling
> that out here.
>

According to actual hardware tests and the WM8978 driver study.
There are no bclk register setup in the entire driver. So I am not sure
How could this even set through the callback? The IC itself requires
2-wires register load and this can't be done via software level.

> > This patch adds proper calculation and configuration of the BCLK
> > divider based on the sample rate and word width, ensuring the
> > codec generates the correct bit clock for all supported rates.
> >
> > Signed-off-by: Brian Sune <briansune@gmail.com>
> > ---
> >  sound/soc/codecs/wm8978.c | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >
> > diff --git a/sound/soc/codecs/wm8978.c b/sound/soc/codecs/wm8978.c
> > index 8c45ba6fc4c3..2109c84f33df 100644
> > --- a/sound/soc/codecs/wm8978.c
> > +++ b/sound/soc/codecs/wm8978.c
> > @@ -717,6 +717,11 @@ static int wm8978_hw_params(struct snd_pcm_substre=
am *substream,
> >                           struct snd_pcm_hw_params *params,
> >                           struct snd_soc_dai *dai)
> >  {
> > +     unsigned int bclk, bclkdiv =3D 0, min_diff =3D UINT_MAX;
> > +     unsigned int target_bclk =3D params_rate(params) * params_width(p=
arams) * 2;
>
> Probably better to use snd_soc_params_to_bclk or similar helper.
>
> > +     /* WM8978 supports divisors */
> > +     static const int bclk_divs[] =3D {1, 2, 4, 8, 16, 32};
> > +
> >       struct snd_soc_component *component =3D dai->component;
> >       struct wm8978_priv *wm8978 =3D snd_soc_component_get_drvdata(comp=
onent);
> >       /* Word length mask =3D 0x60 */
> > @@ -820,6 +825,21 @@ static int wm8978_hw_params(struct snd_pcm_substre=
am *substream,
> >       /* MCLK divisor mask =3D 0xe0 */
> >       snd_soc_component_update_bits(component, WM8978_CLOCKING, 0xe0, b=
est << 5);
> >
> > +     for (i =3D 0; i < ARRAY_SIZE(bclk_divs); i++) {
> > +             bclk =3D wm8978->f_256fs / bclk_divs[i];
> > +             if (abs(bclk - target_bclk) < min_diff) {
> > +                     min_diff =3D abs(bclk - target_bclk);
> > +                     bclkdiv =3D i;
> > +             }
> > +     }
> > +
> > +     dev_dbg(component->dev, "%s: fs=3D%u width=3D%u -> target BCLK=3D=
%u, using div #%u\n",
> > +             __func__, params_rate(params), params_width(params), targ=
et_bclk,
> > +             bclk_divs[bclkdiv]);
> > +
> > +     /* BCLKDIV divisor mask =3D 0x1c */
> > +     snd_soc_component_update_bits(component, WM8978_CLOCKING, 0x1c, b=
clkdiv << 2);
>
> We should probably add something to handle the interaction with
> set_clkdiv and skip this if a fixed divider has been set. Well
> either that or remove the set_clkdiv option, although that is a
> little braver.

Not too understand this idea but the current problem or bug is just
the bclk is missing.
Which had tested via this patch and provide good result. Meanwhile,
the mclk divider
is restricted to actual IC clock design so this is why it is a fixed table.

>
> Thanks,
> Charles
