Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4248113C8F8
	for <linux-sound@vger.kernel.org>; Thu,  9 May 2024 08:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715245113; cv=none; b=auq42E3sESRtE85qCfqkLsdLgYI7zZ61mAPgsc0WaDX931mYsjwDPMZMExNF8b6ndPeatixbb4wivdCWozzgWoqTfLBeLEEUC8ETOLNPkBKDgxTdO2imdwCkpfWvZiyVGPiOEk4RvX2TaxnduSP6RuGouXqoLvDofX/2WGHU53I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715245113; c=relaxed/simple;
	bh=97XaKPKk8jzzUIcm5De7fw/1qqOPyK9C7NjAdmsO8Gw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KUFkNqsTJ7NXptpGvnDqgM/GEQ4yFpdR5UBgD/G5Xn4+pWou9FTvDRu9tW+7ocelKsIvmfVHVw6IHpL0gtAlk4b4GCoSl3BQ4KQ7RgdjLctqcXm6dbgTGQZA882v45FLX8D9JY7WuT+2NezTRJ6uwcRJIxJmb5UP2OrdT5wLbiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IfA2w+S6; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IfA2w+S6"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2e44d32a480so7838401fa.0
        for <linux-sound@vger.kernel.org>; Thu, 09 May 2024 01:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715245110; x=1715849910; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Wiz5MoTmXNXCF7A/NdDpUQr0zJjTgt8byvzglF4DEc=;
        b=IfA2w+S6HCDmvwOLjwXXQBAT1CcGA4UuB/B1r3j8NrX92oeME0u5hIws7qlDYgecde
         JmFAHvoo/Zj+E/iR48ZA3j7XNoI6qaJbWSswvDd7e1rWfunx6UHpe6NQgZMp9Vl4YGRa
         hPFeSplKOsUS2RvIGswPCauFdlPiDuLiyrDWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715245110; x=1715849910;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Wiz5MoTmXNXCF7A/NdDpUQr0zJjTgt8byvzglF4DEc=;
        b=MCHcpdaqG95QM0y0Qne6y7tPxJEodp2PPfYzIz4tPwIuCRPDuFpVshB4BJ3LyahlGE
         ClPfOE0S06QPS5hDsJoY+bUTQ+uTfu0UpO6HhRPsKc+0csjmxRCkfEWwP8STvE40rzKe
         jkgnOnLw4x7XB2SyfpWQWPVPr22rEBrXwvTAWax/VNlveJeqWF5gz1zTOrbwhiYkkDti
         nyv4tIQzlj687y7KFzO6mgFS/cgD0dxHTiflP7kcq1NOODIV3FHr/3AzgFaXNrXM0kj+
         ky1B3FqA4HCWmmQLCtxXY23NcU/lO74EoClXjVtP2elr+f4q5oYBQc7AU0hBWuBy5gxk
         NXJA==
X-Forwarded-Encrypted: i=1; AJvYcCXvf1jvO94K/QL6IjeeOuF1qEyFlENBpxvnDckO8QnNEgcyVl5AcNuMqUmU6tLbuDtZm1MIapuWFxDurLejZWHjGfGtPiEemb4BaqU=
X-Gm-Message-State: AOJu0YxzO74Y6Uhh+LcbvziyIFF678dKSUlFL7TKVEH/MMKWcvHz5AVn
	DjGZFDt8LL8i4ZxFot5kJMXUJ4aQx2VQOS1o6sx3kShdhnfJZBYUtqNrNAIjpiyqTER/rNxL7R4
	v37th9KikjvgzFdcfnyUdtZcIvAhIM5SyrrTZcjCEk+gyqgw=
X-Google-Smtp-Source: AGHT+IH9ObFL6J8WFDRyP8J9A5dWQL9UrJwiJ65mOUZ6bLzWBgApqNI6WPFqJ6HGRFDelg160CI2ttiR8RE+Eg7y928=
X-Received: by 2002:a2e:99d4:0:b0:2de:c6b5:2888 with SMTP id
 38308e7fff4ca-2e447194771mr32704081fa.3.1715245110374; Thu, 09 May 2024
 01:58:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240509-8192-tdm-v1-1-530b54645763@chromium.org>
In-Reply-To: <20240509-8192-tdm-v1-1-530b54645763@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 9 May 2024 16:58:19 +0800
Message-ID: <CAGXv+5HYsKFpHWXE45N+4K1LbKA1Lan8rDHm6=+YvsY0CXKoMg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8192: fix register configuration for tdm
To: Hsin-Te Yuan <yuanhsinte@chromium.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Jiaxin Yu <jiaxin.yu@mediatek.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 9, 2024 at 3:31=E2=80=AFPM Hsin-Te Yuan <yuanhsinte@chromium.or=
g> wrote:
>
> For DSP_A, data is a BCK cycle behind LRCK trigger edge. For DSP_B, this
> delay doesn't exist. Fix the delay configuration to match the standard.
>
> Fixes: 52fcd65414abfc ("ASoC: mediatek: mt8192: support tdm in platform d=
river")
> Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
>  sound/soc/mediatek/mt8192/mt8192-dai-tdm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/sound/soc/mediatek/mt8192/mt8192-dai-tdm.c b/sound/soc/media=
tek/mt8192/mt8192-dai-tdm.c
> index 9ce06821c7d0f..49440db370af0 100644
> --- a/sound/soc/mediatek/mt8192/mt8192-dai-tdm.c
> +++ b/sound/soc/mediatek/mt8192/mt8192-dai-tdm.c
> @@ -566,10 +566,10 @@ static int mtk_dai_tdm_hw_params(struct snd_pcm_sub=
stream *substream,
>                 tdm_con |=3D 1 << DELAY_DATA_SFT;
>                 tdm_con |=3D get_tdm_lrck_width(format) << LRCK_TDM_WIDTH=
_SFT;
>         } else if (tdm_priv->tdm_out_mode =3D=3D TDM_OUT_DSP_A) {
> -               tdm_con |=3D 0 << DELAY_DATA_SFT;
> +               tdm_con |=3D 1 << DELAY_DATA_SFT;
>                 tdm_con |=3D 0 << LRCK_TDM_WIDTH_SFT;
>         } else if (tdm_priv->tdm_out_mode =3D=3D TDM_OUT_DSP_B) {
> -               tdm_con |=3D 1 << DELAY_DATA_SFT;
> +               tdm_con |=3D 0 << DELAY_DATA_SFT;
>                 tdm_con |=3D 0 << LRCK_TDM_WIDTH_SFT;
>         }
>
>
> ---
> base-commit: 45db3ab70092637967967bfd8e6144017638563c
> change-id: 20240509-8192-tdm-cbf2a73c9dd3
>
> Best regards,
> --
> Hsin-Te Yuan <yuanhsinte@chromium.org>
>
>
