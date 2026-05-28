Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB152339866
	for <linux-sound@vger.kernel.org>; Thu, 28 May 2026 20:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780000903; cv=pass; b=G8ugjgT4OXLsCGALsibroDyfBjrx+oN7tCuyQC0zEzvsQeuxaIYQlZYtdbiz+r0B2wZ/uYX/AN9YA9xB7TgOih71JDn4Z+dAo9GBcDyY29N/XP00Vf/6owKttDI3gxt0n143Ncie8F90GEq/9PA9zHLmUaQGgaCu1G27vhzhD0c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780000903; c=relaxed/simple;
	bh=/V/2gMqRS5FPFXxg4scfs09vLyHI+onE5AML7ipVNY8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uPb1QGB0JRpmDQ5jBv7DEQu/VUphiYXDT3CqmXTeKWzy/dCguuSCUEdcBK84quWFcpKynYWAlWhKc/bsWH4+/UjFgw4dC8ysK+PfA8IzWIGGLUgMCjd3ay9ZBBlqlnJhAJ3lNantBPkZarA0szHvdIuBXWBcbyBfyZmd4e7Pg9k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EXRSfurR; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EXRSfurR"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a40b2bc96dso8039483e87.3
        for <linux-sound@vger.kernel.org>; Thu, 28 May 2026 13:41:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780000900; cv=none;
        d=google.com; s=arc-20240605;
        b=fqj8zBGu6i0TP5TExcMJnDV0834VjV3mp49jpaHAaEO0+1aYXpoLn2XeMX7bVnG8k5
         l2NM4U8KllpT6UhxMyUb7QLLwGodctdQzyImgkmt/PrnWfSJDruXhWoDvmDPipxTN2W7
         R0yHkjNhs+FfM8X5xAGG1f3iIuKvdUjzoz8ranGhic3zOnyYfsakNg1oaCCnRzeYSQk5
         7jI+KuryFAS7qzhcoLpM+V68TCdF5JCQqFKUGEh3w5+NCxnVcR8XNj7TiFyrPCOlg+j4
         AqpMApP5PUnIYkCFdaeyFrAHRJnTcHWS+g0bZyM75z5GCcewZRgD4oEVZji4wb8VIV0q
         CTzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EEdrrVj8C0nF5RszLAN6fqwwa7Q/sOQqZWYIF1ope3k=;
        fh=WJyjjp1o5DlnmiuDNsguq0UP0ZLzxNhKoMQ4e8+38ug=;
        b=CDTzWNvrSXlOK6buz0RPE0pR22Ill91VnPSPGHqxVnyh+35B5cLBq7YeEmxHCYqOXj
         42Y7V1a5EwM8mwiKX5GC3hIzy2VsfyjMLv7tZDp1gkad37ZCMMDqPTg8sl1c99Q+MvZI
         PI0wYUciinwrDwksljTLcQjpav0BBQXHM6SErZs+fYc10cDbun0OAYVDQ1xlM0dB6omH
         w/oDze3LVOXS44VLLmKk3tEBKnTcN1TA6ffwAhhki0qMvwFFMKK+ddZOZ/0oOKGH6klb
         z5bdq3Bq51f3Q/3VOfuQ0BSWTVi2BHflRPQFWpTMFHh5AknCQ4jFGL4jgTOn0+VzPaLz
         XFIw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780000900; x=1780605700; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EEdrrVj8C0nF5RszLAN6fqwwa7Q/sOQqZWYIF1ope3k=;
        b=EXRSfurR6CaTZnFZi82fHB94SVsVkw2Vkm35mdyGNft8/BNZevRnVi6NJrMc86GdAw
         jgyn4/VG34/joBHw69Yqey1P4gqUG/ipNbr9JA+YNc0vZLYQsk4VHzClWxJuvf5uff7d
         INV8c39Av2qJEDH/yVHBaAKTl696JSz5VWZVAD5zg6pnBoUgmMRJOnqiUig2HgfXY6Z+
         gpy7nC3GIgmtpQUAfV+BJweY6f7s0UihzldbGS+xAc7okMQq6bAJoN7Eq+k3eCqcU0co
         6cSfNHZxfeGubjamNKzOPvjB2DyTX6QeFe0nMc3N4RUYzbh+iWYGWdTFnl2xrGykp5XR
         LAyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780000900; x=1780605700;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EEdrrVj8C0nF5RszLAN6fqwwa7Q/sOQqZWYIF1ope3k=;
        b=oWeiLXnSFNyTZp3ZrDZ38kGHMsE5LCL7WDPqoaOhDAVm2uy1pksu+c4eJ+/ZTTBeyT
         QfD0opx9NkE5oEp7ym6+KBlhM0osUVqNaStpck0dsArAGaxm7WbphBJOzu+mdttIgEGl
         9pRyNsba6kgMKpxiLFbBBvCbkjUBQid0qjgvYSpbxjHcgVvG8rtG6CAFauWPTy7WYS4z
         iynR+6Kdx0jzMBId1+5LfBr++Fw1IIf4m4gcTOtVzkWR3mLsYKF+DR+R4IgwkGOIdseR
         ikYwBeJG9bqVRaAn8f+s3QgB7mEfzx2bbCBtKtxEkoKmJPw+CkU/1b70Nn+UevsTZBwA
         WCeg==
X-Gm-Message-State: AOJu0Yyj0JHiECqFss/H3Be9rEW5WADn17V2fqzMCg+1FARjpFMZ1Mu+
	1H+06Ab35jsbCOz/MXwUVrO6cj84VASBmetBQBxGsSudTkplVzSv/N2PoqRYIcvksCLiPkI9GmC
	7x4WgIaVEWj3O+96DD6c4HgRSmOI/n/s=
X-Gm-Gg: Acq92OE7QcrZUzh4bNjpm0TN7zidOGwYUIqisQfywuKcDh0fcaHN1C2EeOom1C51mzc
	ItHctUBzaGPwx/QN3l8nR7Bht3cWl/Isotp1MBl/x/dBbA9Gd+UJpKV9svQYlj6dmiuEcj7QMcw
	AySkBnTrTE1BiD5ZOUMg/kwFpDhFFvrL4CM8GAiFUz9IuqKgjHqfzOsgv5S5OjI7Ni9XFwu8fWu
	BSeBbkPs5mATcfgCONlQZiEhvxvZNhnhwxMcea9sKiOIaarDtjcu1tEJoBRWKPVwqCimg1xKJl+
	lzRe5Eb6SS8em7oH9GDSG5fnXdNJAcxjbtBCWFm/TwMIzF6hAGtpuDj+Yiir8s2lsf6Rx8Wstfh
	YGhUcARfEsH/AMXQC9mJmM/qcW4LIRiJ6hHeyDIhS11i9iuyGobHix178avprqeKENdwp
X-Received: by 2002:a05:6512:64ea:b0:5aa:100a:8315 with SMTP id
 2adb3069b0e04-5aa57e5f1e4mr131153e87.45.1780000899756; Thu, 28 May 2026
 13:41:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522015856.741656-1-rosenp@gmail.com> <ahimtheMu3fjdTf6@orome>
In-Reply-To: <ahimtheMu3fjdTf6@orome>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 28 May 2026 13:41:27 -0700
X-Gm-Features: AVHnY4I0Sa39bxDLuht7mH9rJl6M7jPB17sD3ve3oU0X8lJo2v4KmfzovqXgKns
Message-ID: <CAKxU2N-CboLr3X4_5eZSMeEEyvA8i=OT5=YJ71A_zzc7TK9aFQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: tegra: ADX: use of_device_get_match_data
To: Thierry Reding <thierry.reding@kernel.org>
Cc: linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2026 at 1:35=E2=80=AFPM Thierry Reding
<thierry.reding@kernel.org> wrote:
>
> On Thu, May 21, 2026 at 06:58:56PM -0700, Rosen Penev wrote:
> > Remove open coding of the function to simplify the code.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  sound/soc/tegra/tegra210_adx.c | 7 +++----
> >  1 file changed, 3 insertions(+), 4 deletions(-)
> >
> > diff --git a/sound/soc/tegra/tegra210_adx.c b/sound/soc/tegra/tegra210_=
adx.c
> > index 12371f895234..a2c28369fbc8 100644
> > --- a/sound/soc/tegra/tegra210_adx.c
> > +++ b/sound/soc/tegra/tegra210_adx.c
> > @@ -677,17 +677,16 @@ static int tegra210_adx_platform_probe(struct pla=
tform_device *pdev)
> >  {
> >       struct device *dev =3D &pdev->dev;
> >       struct tegra210_adx *adx;
> > -     const struct of_device_id *match;
> > -     struct tegra210_adx_soc_data *soc_data;
> > +     const struct tegra210_adx_soc_data *soc_data;
> >       void __iomem *regs;
> >       int err, i;
> >
> > +     soc_data =3D of_device_get_match_data(dev);
> > +
> >       adx =3D devm_kzalloc(dev, sizeof(*adx), GFP_KERNEL);
> >       if (!adx)
> >               return -ENOMEM;
> >
> > -     match =3D of_match_device(tegra210_adx_of_match, dev);
> > -     soc_data =3D (struct tegra210_adx_soc_data *)match->data;
> >       adx->soc_data =3D soc_data;
>
> Why not just:
>
>         adx->soc_data =3D of_device_get_match_data(dev);
>
> ? That saves you a few temporary variables and since you're not moving
> around the assignment needlessly, you get a much simpler diff, too.
Because soc_data is used later on in this function. I'd have to add
adx-> everywhere.
>
> Thierry
