Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C1B1AF0AD
	for <linux-sound@vger.kernel.org>; Thu, 24 Oct 2024 08:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729757181; cv=none; b=GQ4owHhm2XwodCVwce1NNXjrwu3+CzFM5rAOlk95AxsgPnYTI5/e7U+klbLZqcMBeo7ezRlydtXW19Nf8g//yFqAxh4dpVFSANExuraqGvjvP1rqd3DX3dj5IenWaB1eNrPN9sdjB3YTVnIGyKUtvwKv+15LdNCW6pSzU52RMuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729757181; c=relaxed/simple;
	bh=oPU8wiykirsXlfsK3FEHZM1SuFheE2lq9GeofLJroZY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=CwuZdJg0FBQwN3YZ0GnhlleTNWhSYcB1AW12ivGqbwmVIZm+jf1Qkfll+karbluG7RL5jrbayJRa1+gb+VjElAc2EPoRK7CUaPLzHH0P0/6Vzia3b4QiamXawyJ1nihKCxsdLXLRyV//pdSmlO82tyvBABCygx//6KcIZZkmn6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=tul2PD27; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="tul2PD27"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-431695fa98bso5965785e9.3
        for <linux-sound@vger.kernel.org>; Thu, 24 Oct 2024 01:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729757177; x=1730361977; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=zMW6I0sTEYqubA9v2uS/l/YanQ/0kwQs3KpAh7vOnLI=;
        b=tul2PD27Eg7pri87MSDYD/U1flfjxrFdxiLyLgQ6etoXLVbIbFonYGd2R5QzZE4uHw
         OVgeVbW3AEDFD0b/Bl3GwuUqIdhdHxfiCyisVKJsapEtOdKxusImvwaQ6aK+X52Brjg0
         V5ic/2W+AL0OAQVSvmKiASOXWDX2LUqvdkDvkQE1mAeHY6I3dZ1f+qZo2zC0fy2SIBXx
         O6k0mCv4nK9qEHHVuz+GIaCia+QBhJEQJdsF75mR+YTLsDTHKBM9cG5UgJztXIbCQzct
         KlgLLh9wn/qPqUpZwOZAqTEKnpjrlJqlRUb/NsNxB4Ht68tWCc500aj1zd2GOzXctqHE
         02Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729757177; x=1730361977;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zMW6I0sTEYqubA9v2uS/l/YanQ/0kwQs3KpAh7vOnLI=;
        b=i4/pIVYmnGj1Lq3XTFHSPHAEk906bbkAcBkEkbO30W2rLsFDYx8CJ5/5ROawoAwIcR
         VxWXmM41umdeV9lAb68Aco+jgjzOlCPbWg3Gf9d148ra8/reIq0QPlE2EOJMDH9LL8kY
         WqDnlkWFz2B8QrZuvrkO/m7FfpCprZlCQxNVa2hQI4QVBsQnyx2s7DsykborJm0dEiFD
         9ZHXO8OMPGxTkyou4lTbyRn07cwA8fwM++qF1ERiL46j2OLTBrpFwHD7W3qW2L/AJxsR
         4Kz5MLOj1oOhkx+Q2EGDMlW0g38jAHN/4/AOZg5b5B+aAZgpF78WDqxJfbEW4WlCkxqJ
         xYNw==
X-Forwarded-Encrypted: i=1; AJvYcCW+BQs5FwqwEeNQlm7zjh9oGgFhkmi2keU7G46UNN5TgPiV09egxaU5NpNB8izMyzK05vaS7UUkjlz0NQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHKBhSizXQZs/zdAe5cyZQ4XI9TR+HAujqzJkppdrE+ECcjSau
	6Xo+oZ++If4s5pUk+RaIfB6wQZJJhnpZG2LLr66Nh2Dbrw8zxKuWsCQsCtx3oLo=
X-Google-Smtp-Source: AGHT+IEoZMVKgD69poA0dFC1qIUTHJdJvAa3Cg9Ax/TeZWkK7ol7nwHmrhD5d8D+xQZ2BLd9/bn72g==
X-Received: by 2002:adf:e903:0:b0:37c:d001:856f with SMTP id ffacd0b85a97d-380458ee3fbmr839512f8f.56.1729757177038;
        Thu, 24 Oct 2024 01:06:17 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:c04c:f30a:b45c:dbb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a64daasm10701229f8f.64.2024.10.24.01.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 01:06:16 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Jaroslav Kysela <perex@perex.cz>,  Kevin Hilman <khilman@baylibre.com>,
  Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,  Liam Girdwood
 <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Sascha Hauer <s.hauer@pengutronix.de>,
  Shawn Guo <shawnguo@kernel.org>,  Shengjiu Wang
 <shengjiu.wang@gmail.com>,  Takashi Iwai <tiwai@suse.com>,  Vinod Koul
 <vkoul@kernel.org>,  Xiubo Li <Xiubo.Lee@gmail.com>,
  alsa-devel@alsa-project.org,  imx@lists.linux.dev,
  linux-rpi-kernel@lists.infradead.org,  linux-sound@vger.kernel.org,
  linux-stm32@st-md-mailman.stormreply.com,  patches@opensource.cirrus.com
Subject: Re: [PATCH 3/8] ASoC: meson: switch to use rtd->id from rtd->num
In-Reply-To: <87wmhyb85l.wl-kuninori.morimoto.gx@renesas.com> (Kuninori
	Morimoto's message of "Thu, 24 Oct 2024 01:29:27 +0000")
References: <871q06cmsl.wl-kuninori.morimoto.gx@renesas.com>
	<87wmhyb85l.wl-kuninori.morimoto.gx@renesas.com>
Date: Thu, 24 Oct 2024 10:06:15 +0200
Message-ID: <1ja5eudix4.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu 24 Oct 2024 at 01:29, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:

> Now rtd->num is renamed to rtd->id. Let's switch.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Acked-by: Jerome Brunet <jbrunet@baylibre.com>

Just one comment: I understand why you have split this into multiple
patches, I suppose it will help with the review but I wonder if it
wouldn't be better to squash it all into a single change before
applying ? To avoid exposing the intermediate state. It might be
confusing too. The change would not be that big actually.

Just a suggestion ;)

> ---
>  sound/soc/meson/axg-card.c | 6 +++---
>  sound/soc/meson/gx-card.c  | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
> index 5ebf287fe7004..a2dfccb7990f3 100644
> --- a/sound/soc/meson/axg-card.c
> +++ b/sound/soc/meson/axg-card.c
> @@ -43,7 +43,7 @@ static int axg_card_tdm_be_hw_params(struct snd_pcm_substream *substream,
>  	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
>  	struct meson_card *priv = snd_soc_card_get_drvdata(rtd->card);
>  	struct axg_dai_link_tdm_data *be =
> -		(struct axg_dai_link_tdm_data *)priv->link_data[rtd->num];
> +		(struct axg_dai_link_tdm_data *)priv->link_data[rtd->id];
>  
>  	return meson_card_i2s_set_sysclk(substream, params, be->mclk_fs);
>  }
> @@ -56,7 +56,7 @@ static int axg_card_tdm_dai_init(struct snd_soc_pcm_runtime *rtd)
>  {
>  	struct meson_card *priv = snd_soc_card_get_drvdata(rtd->card);
>  	struct axg_dai_link_tdm_data *be =
> -		(struct axg_dai_link_tdm_data *)priv->link_data[rtd->num];
> +		(struct axg_dai_link_tdm_data *)priv->link_data[rtd->id];
>  	struct snd_soc_dai *codec_dai;
>  	int ret, i;
>  
> @@ -86,7 +86,7 @@ static int axg_card_tdm_dai_lb_init(struct snd_soc_pcm_runtime *rtd)
>  {
>  	struct meson_card *priv = snd_soc_card_get_drvdata(rtd->card);
>  	struct axg_dai_link_tdm_data *be =
> -		(struct axg_dai_link_tdm_data *)priv->link_data[rtd->num];
> +		(struct axg_dai_link_tdm_data *)priv->link_data[rtd->id];
>  	int ret;
>  
>  	/* The loopback rx_mask is the pad tx_mask */
> diff --git a/sound/soc/meson/gx-card.c b/sound/soc/meson/gx-card.c
> index 455f6bfc9f8fa..b408cc2bbc919 100644
> --- a/sound/soc/meson/gx-card.c
> +++ b/sound/soc/meson/gx-card.c
> @@ -32,7 +32,7 @@ static int gx_card_i2s_be_hw_params(struct snd_pcm_substream *substream,
>  	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
>  	struct meson_card *priv = snd_soc_card_get_drvdata(rtd->card);
>  	struct gx_dai_link_i2s_data *be =
> -		(struct gx_dai_link_i2s_data *)priv->link_data[rtd->num];
> +		(struct gx_dai_link_i2s_data *)priv->link_data[rtd->id];
>  
>  	return meson_card_i2s_set_sysclk(substream, params, be->mclk_fs);
>  }

-- 
Jerome
