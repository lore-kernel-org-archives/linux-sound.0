Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DEB12D747
	for <linux-sound@vger.kernel.org>; Fri, 21 Jun 2024 04:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718944134; cv=none; b=Y1Qx0ynjCqH+z4e1dkP0ksKunkMTbqwfgNSW5lTXJw4k6lnsJh09fdF/DlugmU8MMY/5PmLc6wtfjoq0yrGqLazehwcAo7yaJz9LlddESwd1rVW5WrCavYMF8nO2BTK1yDFGp8/QfdExWPTq3HyIX1fjFjf6FVWLxPRoU0wlkCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718944134; c=relaxed/simple;
	bh=r24Mof+yDkcvpkTRAhB62yPXxPblkb1zcabB4O7cMgQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qk6mQjMr+ieg+8j6Io7JBA5eb4fp45oI6L+zjByhxXVXk4Y2OYGDfJCi9SK5vDjvmJlppaZqKdod2mdrpMXf2VbEWTqE4XKVZIGpwVCViEjh4hUXL6Z7b2LvIvHHWorZ0uFiYXQ2IQ9U7kCWTmmUZyYe/mVehfyrwoy5TPx3j6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nRuQQoaY; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nRuQQoaY"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2e724bc466fso17450061fa.3
        for <linux-sound@vger.kernel.org>; Thu, 20 Jun 2024 21:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718944131; x=1719548931; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E0N5ODF55WzW9N7tClV+NF8WnSJ/yPUFLrnRCDn0qcY=;
        b=nRuQQoaYihEaFh5o9FjImqn9hh9wqrgB9lIMAI+KpdM3Qj5Wiq8cKmBkhmBe/nvsew
         PfbwrT4GjdR7PnPkoN8ibyJXES13ALH7u5Z2qzW6pLPkoBgKwcam0WNPP5CykBpXPh//
         FrS0sK1rimhkssGEOQ4ZZl81IIAQr+n6+r9rA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718944131; x=1719548931;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E0N5ODF55WzW9N7tClV+NF8WnSJ/yPUFLrnRCDn0qcY=;
        b=JBsfoiqMserARErTUVl+cCUaRPVvbwYunFdoq2dbGa/WnLr3vIiw2Y3RavsO4p6xnX
         8g2BE1qgn7fEdYvsQ2uR5kqwZ+q2upHtWzGLWZAhWKwuWI7oMVdHUA9NsiYv9nZolfyF
         XRGHaVno7OPlhShcH4ciRPUOTtJwIgdjJrQdnbzceCLzUwZi3F9Vn5pVD86seTTCtPsz
         868D+eeodFPs4LeNTjAe3UxDZ9kp93BvQfePEAHWMT/eIlFSP0anCf/32rFtmYeSPiGY
         xiubVTnSPpVmeGGKN9ZaP99UVs9pK8QFBKkLHs6mimJcZpmPtwLo3D3+qwZP+6Nne+9N
         tvEw==
X-Forwarded-Encrypted: i=1; AJvYcCX1VWSYDFKEx+xn39DKdP/cDWrYZFmUxvz9P20hyd2B6D2oAitoFW8pujOF/oK/hxLWoyhud54vxM8HjtfG/krZDnuQr/pgR3RpnQs=
X-Gm-Message-State: AOJu0YxD+dAXvEZUK/vZgE1PNJMtQC9e03w+Oc6IemzhVeJyhxgfpKa+
	ZmJ/VD3xiNDdIlh0vxp5IS8rDdXpa2bheFeH677oGbJfoqMaWNPeh4HFNu/9tGIHMfgVQRAYPuI
	S5c+yu/BSEb9d+f8kFIxFQiO2BvgLc+9/aUbsc5v8Nk82bQfeMA==
X-Google-Smtp-Source: AGHT+IEf221TRxxyD3Vt2YLv8hui8dqvwFIA+f2DRplnWv7/sZLD6TNo+ipCUSe/K76y0e7FExk9GfCSbD6ljigHWP0=
X-Received: by 2002:a2e:980e:0:b0:2ec:4f41:514 with SMTP id
 38308e7fff4ca-2ec4f410623mr3647731fa.23.1718944130818; Thu, 20 Jun 2024
 21:28:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240620092526.2353537-1-wenst@chromium.org> <35047932-65d0-44ae-98e1-b4c771be0e6b@collabora.com>
In-Reply-To: <35047932-65d0-44ae-98e1-b4c771be0e6b@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 21 Jun 2024 12:28:38 +0800
Message-ID: <CAGXv+5EGqGB=Bb-YxY1eCPg216FyVHT7Xs_Zoe2EBMKuRmZMow@mail.gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8195: Re-add codec entry for
 ETDM1_OUT_BE dai link
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Mark Brown <broonie@kernel.org>, Trevor Wu <trevor.wu@mediatek.com>, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2024 at 6:27=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 20/06/24 11:25, Chen-Yu Tsai ha scritto:
> > This partially reverts commit e70b8dd26711704b1ff1f1b4eb3d048ba69e29da.
> >
> > Said commit removes the codec entry for the ETDM1_OUT_BE dai link for
> > some reason. This does not have the intended effect, as the remaining
> > DAILINK_COMP_ARRAY(COMP_EMPTY()) platform entry becomes the codec
> > entry, and the platform entry is completely gone.
> >
> > This causes in a KASAN out-of-bounds warning in mtk_soundcard_common_pr=
obe()
> > in sound/soc/mediatek/common/mtk-soundcard-driver.c:
> >
> >       for_each_card_prelinks(card, i, dai_link) {
> >               if (adsp_node && !strncmp(dai_link->name, "AFE_SOF", strl=
en("AFE_SOF")))
> >                       dai_link->platforms->of_node =3D adsp_node;
> >               else if (!dai_link->platforms->name && !dai_link->platfor=
ms->of_node)
> >                       dai_link->platforms->of_node =3D platform_node;
> >       }
> >
> > where the code expects the platforms array to have space for at least o=
ne entry.
> >
> > Re-add the entry so that dai_link->platforms has space.
> >
>
> Ok, but wait a minute... the commit that you're pointing at in the Fixes =
tag is
> a commit that fixes a problem identified in commit
>
> 13f58267cda3 ("ASoC: soc.h: don't create dummy Component via COMP_DUMMY()=
")
>
> to keep it short, after that one, without removing the COMP_DUMMY(), the =
audio
> was broken in .. some way, I don't currently remember specifically what w=
as
> happening, but I had no sound at all.

Right. But this adds back "COMP_EMPTY()", not COMP_DUMMY().

I guess I shouldn't say this is a partial revert.

After painstakingly messing with the mixer controls, I tested all three
audio paths (speaker, headphone, DP) and they all work correctly.

I'll send a v2 updating the commit message.

ChenYu

> If the problem is not showing up anymore, backporting this commit to the =
kernels
> kernels affected by the issue that I solved... will break sound!
>
> So... well.. that's the "some reason".... :-)
>
> Cheers,
> Angelo
>
> > Fixes: e70b8dd26711 ("ASoC: mediatek: mt8195: Remove afe-dai component =
and rework codec link")
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> >   sound/soc/mediatek/mt8195/mt8195-mt6359.c | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359.c b/sound/soc/medi=
atek/mt8195/mt8195-mt6359.c
> > index ca8751190520..2832ef78eaed 100644
> > --- a/sound/soc/mediatek/mt8195/mt8195-mt6359.c
> > +++ b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
> > @@ -827,6 +827,7 @@ SND_SOC_DAILINK_DEFS(ETDM2_IN_BE,
> >
> >   SND_SOC_DAILINK_DEFS(ETDM1_OUT_BE,
> >                    DAILINK_COMP_ARRAY(COMP_CPU("ETDM1_OUT")),
> > +                  DAILINK_COMP_ARRAY(COMP_EMPTY()),
> >                    DAILINK_COMP_ARRAY(COMP_EMPTY()));
> >
> >   SND_SOC_DAILINK_DEFS(ETDM2_OUT_BE,
>
