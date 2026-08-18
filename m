Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBF4448B9D
	for <linux-sound@vger.kernel.org>; Tue, 18 Aug 2026 09:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787045786; cv=pass; b=RNxzceDQ2LugpiK1fwwrWTT0qpvwSAQDeVyJ5E+vYjWPuMfDw5PxiWIH9qrDz0AUckKbj44hMgz5c33fduFc6ScFNRzlr8fvTdG9BBpNJckYfbKOK5wU1kxxWFPfX9Vo8v3EiP+q5fMYCR25wL9UaEbUWOm6lxyD7HuSgVZJHAo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787045786; c=relaxed/simple;
	bh=/53KYjz2OKFvs9h46LAzBMmCxad8Wnqo3pZOWlzgisk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=grWewHaXWHwrP/kjzNNZ7pYbTRF6SypZg2Xf90FQa1iSEa2lFxIibiDACjDtv94cSYyZdjf3sC2KSTC5jx7Ec1mzSASlZLUxnc3OBdSN0ZRtp4+WelyHTHk1W/61AvSZhlwRfys1sIqH2jVJrDs9bfhRTGdE8ggjHI93157vdDA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VJOi2PzV; arc=pass smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VJOi2PzV"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5aeb59d54b1so4466903e87.1
        for <linux-sound@vger.kernel.org>; Tue, 18 Aug 2026 02:36:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787045783; cv=none;
        d=google.com; s=arc-20260327;
        b=RfCOSUxOaaS/sSXOYyLb4qoJiqeAQJQH16XDTiMqUepjt0YhMvD5RLwE5PfwB+4Tz2
         WsA5imtbcU+8CLFJii3g8EoAEDC0E51wkvvvht6VRYap5z/7TToIGIzRwE1Vm2r9gR4N
         52715x4alzxZFibLQlp4v7eHUqU33sLlCy/2SV++MuXw9cilSicjzVQWVOq5ws/d1Ft2
         bLivl8xGWbmCf/5D85VjqbSFIMFxgNG0dZkf28wt/aj7/QMohI20rJWHlfkOz+ZH4y8U
         z2KNeqeF3BMTrgUHkM1e0oD+LHw0IJJ8Ni+o3vz81VI9v5OlkMKzTJaYY4ligx3guFNC
         Y8hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rziI+CdEa3G5H9/StiCkRjIg1kc45ufgyJOnl1wiO/0=;
        fh=yCIcn3Jv5EeYOVRSCmzRl9cACBGuvipthY4MkxcwXak=;
        b=T1dmWd0VZOHSwY06lRXmBBmQ/cVuGNZHL0Uy5CyZVpJ55f/5E9sQNWGVjr4xXTLAKQ
         SX3QsW7C8ppbCEnAymk5UlHN4eUTRNkKdVuw23KEe9HHxGUEVU89J93TVwa76cgkmGBK
         zZzKy7yr8/DGSYJmovgLNwW1VxALwhyBKUqgCIrUeMiQeUqLaIAoMOZLqcoNRAuyf5mo
         y2T9TJo3cBzP3sIGIOdbUNoIGhpTmn5gBZcEUCd/sttZVYqRpbD5NIjjtWHed0oyfJFQ
         uOu0MUS3FjFETPXMCqv2V3JONCy97iENPCtYKB6zn4eJ9DXn0ruaFXN6qalPpXPWitjP
         gHqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787045783; x=1787650583; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rziI+CdEa3G5H9/StiCkRjIg1kc45ufgyJOnl1wiO/0=;
        b=VJOi2PzVM/O2dtntG+35QBEoVlD5fnLlZdmEDs2iJVYjVJJiIJrqtiUTSxfAed4pa3
         HgIbnXJx32BvdCepOPRNzV3MZm/KqHUL/RQamTyoUFRDsmNM9iD/3/a3o97DfRCZAbPU
         oFKzdkmmfnHdnxtdCVmJ3wG7UPwR2xH3wD7XweQKf8nbL+3JdTHn7O9+2TXlE4wXGyx4
         sDku2LjAm2at7tAcs4kAO8KBsdekTxgsk0K3uMZRItQ2MaGr7xSTX/mUjUEEvgdNTqX3
         9nx2vBm4h6t0+T+vziYuOW6QQc+B9oEiNn2UuExFeZRS8rzRluR7Feo/QQr1BoX/xPgx
         me/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787045783; x=1787650583;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rziI+CdEa3G5H9/StiCkRjIg1kc45ufgyJOnl1wiO/0=;
        b=HkSetmhD9Uqw54MXSkfbLUwQ/bmdn4jJnxMkr6LKXDgJSTAU3JldIZipQS67JY68NC
         zhaOiRRJ+s5JOuX6iJo8P2sE5smkeeyIMSG/XI3A+VqMcC/xTWYgJCn0LntnlaDc+XOi
         b1iF884y8tbpCs8oxhyHHskqSmi43IM5vxVPRTVZTQWv/TpQl8pAAIfXrqr9wt6Hmhxw
         AEjzZB/+1cAdPSox2hJlHB5gcpY5Z66oZHST2qh9Skc5djTdw6prJg7WofGkCdEY8bA3
         5lXb9PhyQI9cAlIntLOO16NBSYn6ttIQ9AxQzqYU+8hcPV52Tb2FRXz2JOVHotVH25Lq
         rBaw==
X-Forwarded-Encrypted: i=1; AHgh+RpFYIXLopD6Aijc9eUQHb3h+8tm7ZL1nDh1Lz1hsvNHtE+YGwQOIJ4PROA1UAKIb9282YGxJtPjWJJ1Kg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxrTQNzkZJfaWe8/lSfEfVmLnMQxByYyACe7VxpjotsOdcRS6s0
	dKUZjv1ACtYY6b5QC+IqaSOJihpg+mgD5esWuCWcZJMb3xg/aKxvZb/JRySU2oxmtTILDLGuO6k
	tQNe0dxi4OPzU2II32wvW4nh4azPpPnU=
X-Gm-Gg: AR+sD11jlBLEzbC2tacbMD+JLDeO+EXNpgGRJlFv3XU8BCBidxC+2uznMtV9RSvkU1G
	dqLJkjBxOkqhKvFGr0g1G6h6/xoAB5iGKBJWS6BPZme5Dn+sJ09zR8eEFDaT9UgW9xJE+yya08i
	jx/yIdiX3TyJdfZt5P1T8JSzzwe4yHpVTNizk7AVQARmLuu+R4A8tPFpgIe4U6beuK9AKGILetE
	/344UnFz9/W9t8YpVuy4gNQDbiECZ1pAzTIt1hSDwBFSa+YB+M6Bx9NOY7wF7ypnDu4MgvkudO+
	XSM9SIHyARz0JycGy+u4Qh7VlyIN1U3Ob9DSPn3uhlJFNUbdv1BXcth2bsOTJHHggfBmUt3ePyN
	AOmh50OcohLHDXMcEblVCZcqE6kSXj/UIghqa1ofviQ==
X-Received: by 2002:ac2:51d3:0:b0:5b0:1eed:f700 with SMTP id
 2adb3069b0e04-5b4591171fdmr5479874e87.13.1787045782379; Tue, 18 Aug 2026
 02:36:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260818092052.3596347-1-zhoubinbin@loongson.cn>
In-Reply-To: <20260818092052.3596347-1-zhoubinbin@loongson.cn>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Tue, 18 Aug 2026 17:35:44 +0800
X-Gm-Features: AcwNN1U3LON0IHJsmX10hiM239cmNCtAU1fYWQCud4o51mmzdCcsr3t_pGmG1wc
Message-ID: <CAJhJPsU=2CPB=LzRf_-=waVQvAajXQwzGO4ANP0spSvNyGEmPA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: loongson: Fix naming of machine event and DAPM widgets
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Huacai Chen <chenhuacai@kernel.org>, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Keguang Zhang <keguang.zhang@gmail.com>

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


--=20
Best regards,

Keguang Zhang
