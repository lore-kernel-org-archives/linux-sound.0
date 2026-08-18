Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6815541685C
	for <linux-sound@vger.kernel.org>; Tue, 18 Aug 2026 12:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787055186; cv=none; b=F/0+e1Ir29KadEXaVfxWzfDVwUWcOUSanhlDfLxp7J6Uey+p6rtPiH9NJjogEz1S35ybCOu/sD8Ky8OyI6UjtruBOJILnR3Jlb970qIqbN5wbqUTy+Ru/gGhp5Z1PmfBQxebx2MY1I/JKVVMzqcRBrqxxGZfVfmF3sV+VkOKPAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787055186; c=relaxed/simple;
	bh=UZf0QWj6lJ9sOOK+KIm94+ySRJFKorIpTFt4ZN6LbxY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RukEp9pSTH0JiR+0TKBCRC/aq1rc6YW6weHf/ZvNEKx2YP/uWcSSgK9hE4hYjDMoF7G8mVZ9dZnvMnTchlRaT62Id6lGfD5lkZlGVKaqk3yJOormO+1iiA3hxQBtnYZcbGpU9PhEb7e5WLW+KzrQklcDDGzqaAeLhWRSSQsI2dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eXa8dS3Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eXa8dS3Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BCBD1F00A3F
	for <linux-sound@vger.kernel.org>; Tue, 18 Aug 2026 12:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787055185;
	bh=7JKOO5hiiFN7nG6g7Ea19kbAZntFIe0vDP9lzo7fdhU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=eXa8dS3ZI/woQ8qJj2JfLEVARNNR18iaP8Fyr8FMjUqGOvQs4YsutTLRFwSn4MTsW
	 phVXKoE90AmNxW2AgaolDiNIqNDadmck5OapIHPVjC7lEf9duJsN/eK1hSNIuDrA2o
	 KTHERj8518a/2dYJRYYlmIvs0ZG+Jpy8d5Kta8HtgylJVSld3aeGCHhP2kv9eZxGvJ
	 il3dmUWGak9gvwaUyo0lXw88baQshJN8hyf7h/uODi0jACDZuts8oFolWrH9ecn0VN
	 MdFuUexfWkrL8md4tGD89MmHZd6k0TqC2X8Lha0T3I0P3d9LzajzHYsQIgtzJP6ylO
	 JVbYBff4Dta0Q==
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6a1542cdb53so5096727a12.2
        for <linux-sound@vger.kernel.org>; Tue, 18 Aug 2026 05:13:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqZFsegs49N/eRMLCg8thlomHPe1Q6izM94wZp8dYcFKPg1jYr7kWY3L0pjtUWEvkPV9Hn6AlVGiETxGw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSokJF3pFwYRP7FX3dhoMQeYC8DO1nWXRVW0pkXeWMiOwuBzDC
	0T2QofreMBrQYbkXMPtPeSvsegZ21OApwoc9Cp5qCurQbX20wor6pUEK0QuZ/MHNtUb2G5LJsfw
	ZZbGTFX0ytvWJz6WUvrRx3v+3NrPbWYQ=
X-Received: by 2002:a17:907:608b:b0:c16:73a0:c4ec with SMTP id
 a640c23a62f3a-c212a26d672mr1501268466b.18.1787055183630; Tue, 18 Aug 2026
 05:13:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260818092052.3596347-1-zhoubinbin@loongson.cn>
In-Reply-To: <20260818092052.3596347-1-zhoubinbin@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 18 Aug 2026 20:13:30 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6AucBDjmvzPnCBtNpR=ZA1daYz6vfVXsdAh-sZQM_2dQ@mail.gmail.com>
X-Gm-Features: AcwNN1VWfgxJSIrjP4V-XuJuGnRooiliR-CB0GYeR6ELvp8gnJ-uApbvwDrtdH4
Message-ID: <CAAhV-H6AucBDjmvzPnCBtNpR=ZA1daYz6vfVXsdAh-sZQM_2dQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: loongson: Fix naming of machine event and DAPM widgets
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Keguang Zhang <keguang.zhang@gmail.com>, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2026 at 5:21=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.cn=
> wrote:
>
> Rename `tegra_machine_event` to `loongson_asoc_machine_event` and
> `loongson_aosc_dapm_widgets` to `loongson_asoc_dapm_widgets` to
> accurately reflect the hardware platform. Update all references
> accordingly.
>
> No functional change is introduced.
>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>

> ---
>  sound/soc/loongson/loongson_card.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/sound/soc/loongson/loongson_card.c b/sound/soc/loongson/loon=
gson_card.c
> index 25cd12eab4b1..6422cc1703b6 100644
> --- a/sound/soc/loongson/loongson_card.c
> +++ b/sound/soc/loongson/loongson_card.c
> @@ -55,8 +55,8 @@ static const struct loongson_card_config ls2k0300_dl2k0=
300b_card_config =3D {
>         .add_dapm_routes =3D true,
>  };
>
> -static int tegra_machine_event(struct snd_soc_dapm_widget *w,
> -                              struct snd_kcontrol *k, int event)
> +static int loongson_asoc_machine_event(struct snd_soc_dapm_widget *w,
> +                                      struct snd_kcontrol *k, int event)
>  {
>         struct snd_soc_card *card =3D snd_soc_dapm_to_card(w->dapm);
>         struct loongson_card_data *priv =3D snd_soc_card_get_drvdata(card=
);
> @@ -72,9 +72,9 @@ static int tegra_machine_event(struct snd_soc_dapm_widg=
et *w,
>         return 0;
>  }
>
> -static const struct snd_soc_dapm_widget loongson_aosc_dapm_widgets[] =3D=
 {
> -       SND_SOC_DAPM_HP("Headphone", tegra_machine_event),
> -       SND_SOC_DAPM_SPK("Speaker", tegra_machine_event),
> +static const struct snd_soc_dapm_widget loongson_asoc_dapm_widgets[] =3D=
 {
> +       SND_SOC_DAPM_HP("Headphone", loongson_asoc_machine_event),
> +       SND_SOC_DAPM_SPK("Speaker", loongson_asoc_machine_event),
>  };
>
>  /* Headphones Jack */
> @@ -314,8 +314,8 @@ static int loongson_asoc_card_probe(struct platform_d=
evice *pdev)
>         card->num_links =3D ARRAY_SIZE(loongson_dai_links);
>
>         if (ls_priv->cfg->add_dapm_widgets) {
> -               card->dapm_widgets =3D loongson_aosc_dapm_widgets;
> -               card->num_dapm_widgets =3D ARRAY_SIZE(loongson_aosc_dapm_=
widgets);
> +               card->dapm_widgets =3D loongson_asoc_dapm_widgets;
> +               card->num_dapm_widgets =3D ARRAY_SIZE(loongson_asoc_dapm_=
widgets);
>         }
>
>         snd_soc_card_set_drvdata(card, ls_priv);
>
> base-commit: 2792cc1b80b7674cc0751b34a964aad76630c1fa
> --
> 2.52.0
>
