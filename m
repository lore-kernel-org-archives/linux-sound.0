Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACF74343F9
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 07:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784619325; cv=none; b=jH2tSUBf5AvF3T8QuC2PartcBzkn2GzXf0zQFLGeg4nUwccZXUKhxahGZ4wE2y7yGrOqsySijCGvCvw/ebfOgKRSQ9Y/d3DADN944WwG8EFobpvDM4YlIcTkqATjePy/Xz109Nc1aapIm8yjVqfh970seyO0GPG8HflVbJP7Nzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784619325; c=relaxed/simple;
	bh=pf/UkWl+fUSwqgeYGkxHbyctltigzfHApcin2wxP1D4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=MebVXcQYVnWTyhQJJgW48WKDhSoDZifqfqGBudQZ/jXuUqIpCfQkwedAx/tk8aeeAHa+n3VxgMVqJ/IZeCli2bLaG/uQR0WlSLWIr8gQbLyj21s8btyl+CAtJn5NSpKU/RiZap8GiNYNbeookZq8nJg+gucB7YY1XcJIxkmSiKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=TrbNk25Y; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="TrbNk25Y"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49548e01d02so17738575e9.0
        for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 00:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784619320; x=1785224120; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pJYszYNZpB6+D7pDZToiKE09TTgTGymFuxDbH25RBnc=;
        b=TrbNk25YIBzMxHAHDIYp6+F+FFaJBzfJ7Co5yqrY4VUy1ILIKCyKycj7P1OjPsHsVA
         K3sRVxUfNKqqOGxVAee8yAUwqu8fJALUP0e3enGdWJ64QTy64bpw7KCsLg83kjwfTNtF
         gzY4krfGLaCRsod/UsWk3TkmlWLh0i0uz0m0SDQbcCtSGmOm774+RGALDe2VoDzE1GbH
         7GJSeh8nubzRK+8IkmtgqIKdsNnxvg1KnfNj9kDsHBb/ThovvDF5J2y5rEDnf0p/ysDM
         J8QtZijOt4TAn+j55nP9vbT8gevooTq4SSYQp8WXQ7STs75sU2GbNOFP+0q/DwtsLBCF
         yeGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784619320; x=1785224120;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pJYszYNZpB6+D7pDZToiKE09TTgTGymFuxDbH25RBnc=;
        b=XESm1MJWrXN4H/X2r+IOyXfruCoNwI8VJW61fBZ9I9rh/NGv3CXqLEG3c0QCgkjuy2
         +fLbbzNpUHBHTobrxliKS7TYAZ0MBIxUnIQJybQb/FoVLoXx5U6WVPRi2G1txzmG2ssF
         hMsru7Ajn88nGbdzIOtFSnYVZUdhIT/nlOY2RtqGCy/q2iAOLcGU3Z3a4ZWco/xKNTQj
         fRpLoca4teBEpqYP2S+LsOVIHjiQ6r5O/zMXzck1Pos7uKbVlCcCwaiRFI9YY9FSea8R
         dfpkwUvaDgInCavsCCceK7lHqCmRpBePOqj7T/W0bt4bTRYKsyrnAXCrLvy5gUpxyMl2
         zzUw==
X-Forwarded-Encrypted: i=1; AHgh+Rp4oX56HgDXbbKJT8bN9rLLy8+G8QjFiYWTa2IuGYCYmluyFoarc9or2BBzT0Zl/vt1Kk5J6ZSMLBEEUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6kukw7jz1NRDY5IGXegwU8TQ8qxdliZLvyhK2pk3sVH2j7Agk
	6mBqndH1QDIT6N+Pj/+sxQVZy+nLNumVCSMlY849s6wBkcoKLx/UPQzSHZrbpRzQnKs=
X-Gm-Gg: AfdE7cm98fezQbBQTr8I0D05AB0m3wEjOTeg5rXKgYSEgPe2Nm7y5aNlKKeF3rtbtiE
	DWMF9OHA0SIBugyCNhBobOwY+AH8DDhAq/lW5m0JUpRHh81nY+skOG/G1ZIh7o0FiKVGa/cHBcW
	HLvrfaSFy47PL2zt/1IB7rf5aP5k0jwQOKPWgbbkawtSEYUSN9rBI7mXhihDVgFUEa86DL8NYyr
	aUAjLpzRPOtieGSQSbKX8gN0jGURQ5kp/dN7vCaivGEuig2Bc4UFOHb8YtLiZ0LFo7CYoclBYZn
	g4SHjp1Zsr77uOqtA6vDJi5/qaxGJeg7Zvn2nJtfdRbDwC7QSJy4Tro06p9KchDarZn+jPSNjkX
	L5rbMMEhs9RUMLwCdy6TIPp/0dPgi693fRkr1FbX2LSifuqs2nN4dSanLSdI3E6MzM8ynAnmjEg
	eW/1Ocs5GWfkk=
X-Received: by 2002:a05:600c:1d1e:b0:493:a966:d5b5 with SMTP id 5b1f17b1804b1-4954a3d0cc7mr179740075e9.2.1784619320482;
        Tue, 21 Jul 2026 00:35:20 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:3b11:1fce:47ee:c5bf])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f63e49500sm38917415f8f.2.2026.07.21.00.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 00:35:19 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Jaroslav Kysela <perex@perex.cz>,  Kevin Hilman <khilman@baylibre.com>,
  Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,
  Martin Blumenstingl <martin.blumenstingl@googlemail.com>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Takashi Iwai <tiwai@suse.com>,
  linux-arm-kernel@lists.infradead.org,  linux-sound@vger.kernel.org
Subject: Re: [PATCH 2/2] ASoC: meson: meson-card: use priv instead of card
 on each functions
In-Reply-To: <87se5di0n8.wl-kuninori.morimoto.gx@renesas.com> (Kuninori
	Morimoto's message of "Tue, 21 Jul 2026 01:36:59 +0000")
References: <87v7a9i0o8.wl-kuninori.morimoto.gx@renesas.com>
	<87se5di0n8.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 21 Jul 2026 09:35:18 +0200
Message-ID: <1jfr1ceqx5.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On mar. 21 juil. 2026 at 01:36, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:

> We can get card via priv->card, use priv for function param.
> No functional change, but is preparation for Card capsuling.

The change is simple but it will make more complex to backport fix an
older kernel once this fix is applied. So again, getting more context to
understand what you are trying to accomplish and why it needs a standard
card variable name would help.

>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/meson/axg-card.c         | 63 ++++++++++++++++--------------
>  sound/soc/meson/gx-card.c          | 23 +++++------
>  sound/soc/meson/meson-card-utils.c | 58 ++++++++++++++-------------
>  sound/soc/meson/meson-card.h       | 11 +++---
>  4 files changed, 82 insertions(+), 73 deletions(-)
>
> diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
> index b4dca80e15e40..3d345dc33cb6f 100644
> --- a/sound/soc/meson/axg-card.c
> +++ b/sound/soc/meson/axg-card.c
> @@ -100,28 +100,28 @@ static int axg_card_tdm_dai_lb_init(struct snd_soc_pcm_runtime *rtd)
>  	return 0;
>  }
>  
> -static int axg_card_add_tdm_loopback(struct snd_soc_card *card,
> +static int axg_card_add_tdm_loopback(struct meson_card *priv,
>  				     int *index)
>  {
> -	struct meson_card *priv = snd_soc_card_get_drvdata(card);
>  	struct snd_soc_dai_link *pad;
>  	struct snd_soc_dai_link *lb;
>  	struct snd_soc_dai_link_component *dlc;
> +	struct device *dev = priv->card.dev;
>  	int ret;
>  
>  	/* extend links */
> -	ret = meson_card_reallocate_links(card, card->num_links + 1);
> +	ret = meson_card_reallocate_links(priv, priv->card.num_links + 1);
>  	if (ret)
>  		return ret;
>  
> -	pad = &card->dai_link[*index];
> -	lb = &card->dai_link[*index + 1];
> +	pad = &priv->card.dai_link[*index];
> +	lb = &priv->card.dai_link[*index + 1];
>  
> -	lb->name = devm_kasprintf(card->dev, GFP_KERNEL, "%s-lb", pad->name);
> +	lb->name = devm_kasprintf(dev, GFP_KERNEL, "%s-lb", pad->name);
>  	if (!lb->name)
>  		return -ENOMEM;
>  
> -	dlc = devm_kzalloc(card->dev, sizeof(*dlc), GFP_KERNEL);
> +	dlc = devm_kzalloc(dev, sizeof(*dlc), GFP_KERNEL);
>  	if (!dlc)
>  		return -ENOMEM;
>  
> @@ -153,18 +153,19 @@ static int axg_card_add_tdm_loopback(struct snd_soc_card *card,
>  	return 0;
>  }
>  
> -static int axg_card_parse_cpu_tdm_slots(struct snd_soc_card *card,
> +static int axg_card_parse_cpu_tdm_slots(struct meson_card *priv,
>  					struct snd_soc_dai_link *link,
>  					struct device_node *node,
>  					struct axg_dai_link_tdm_data *be)
>  {
> +	struct device *dev = priv->card.dev;
>  	char propname[32];
>  	u32 tx, rx;
>  	int i;
>  
> -	be->tx_mask = devm_kcalloc(card->dev, AXG_TDM_NUM_LANES,
> +	be->tx_mask = devm_kcalloc(dev, AXG_TDM_NUM_LANES,
>  				   sizeof(*be->tx_mask), GFP_KERNEL);
> -	be->rx_mask = devm_kcalloc(card->dev, AXG_TDM_NUM_LANES,
> +	be->rx_mask = devm_kcalloc(dev, AXG_TDM_NUM_LANES,
>  				   sizeof(*be->rx_mask), GFP_KERNEL);
>  	if (!be->tx_mask || !be->rx_mask)
>  		return -ENOMEM;
> @@ -191,7 +192,7 @@ static int axg_card_parse_cpu_tdm_slots(struct snd_soc_card *card,
>  
>  	/* ... but the interface should at least have one direction */
>  	if (!tx && !rx) {
> -		dev_err(card->dev, "tdm link has no cpu slots\n");
> +		dev_err(dev, "tdm link has no cpu slots\n");
>  		return -EINVAL;
>  	}
>  
> @@ -207,7 +208,7 @@ static int axg_card_parse_cpu_tdm_slots(struct snd_soc_card *card,
>  		 * Error if the slots can't accommodate the largest mask or
>  		 * if it is just too big
>  		 */
> -		dev_err(card->dev, "bad slot number\n");
> +		dev_err(dev, "bad slot number\n");
>  		return -EINVAL;
>  	}
>  
> @@ -216,14 +217,15 @@ static int axg_card_parse_cpu_tdm_slots(struct snd_soc_card *card,
>  	return 0;
>  }
>  
> -static int axg_card_parse_codecs_masks(struct snd_soc_card *card,
> +static int axg_card_parse_codecs_masks(struct meson_card *priv,
>  				       struct snd_soc_dai_link *link,
>  				       struct device_node *node,
>  				       struct axg_dai_link_tdm_data *be)
>  {
>  	struct axg_dai_link_tdm_mask *codec_mask;
> +	struct device *dev = priv->card.dev;
>  
> -	codec_mask = devm_kcalloc(card->dev, link->num_codecs,
> +	codec_mask = devm_kcalloc(dev, link->num_codecs,
>  				  sizeof(*codec_mask), GFP_KERNEL);
>  	if (!codec_mask)
>  		return -ENOMEM;
> @@ -242,17 +244,17 @@ static int axg_card_parse_codecs_masks(struct snd_soc_card *card,
>  	return 0;
>  }
>  
> -static int axg_card_parse_tdm(struct snd_soc_card *card,
> +static int axg_card_parse_tdm(struct meson_card *priv,
>  			      struct device_node *node,
>  			      int *index)
>  {
> -	struct meson_card *priv = snd_soc_card_get_drvdata(card);
> -	struct snd_soc_dai_link *link = &card->dai_link[*index];
> +	struct snd_soc_dai_link *link = &priv->card.dai_link[*index];
>  	struct axg_dai_link_tdm_data *be;
> +	struct device *dev = priv->card.dev;
>  	int ret;
>  
>  	/* Allocate tdm link parameters */
> -	be = devm_kzalloc(card->dev, sizeof(*be), GFP_KERNEL);
> +	be = devm_kzalloc(dev, sizeof(*be), GFP_KERNEL);
>  	if (!be)
>  		return -ENOMEM;
>  	priv->link_data[*index] = be;
> @@ -264,19 +266,19 @@ static int axg_card_parse_tdm(struct snd_soc_card *card,
>  
>  	of_property_read_u32(node, "mclk-fs", &be->mclk_fs);
>  
> -	ret = axg_card_parse_cpu_tdm_slots(card, link, node, be);
> +	ret = axg_card_parse_cpu_tdm_slots(priv, link, node, be);
>  	if (ret) {
> -		dev_err(card->dev, "error parsing tdm link slots\n");
> +		dev_err(dev, "error parsing tdm link slots\n");
>  		return ret;
>  	}
>  
> -	ret = axg_card_parse_codecs_masks(card, link, node, be);
> +	ret = axg_card_parse_codecs_masks(priv, link, node, be);
>  	if (ret)
>  		return ret;
>  
>  	/* Add loopback if the pad dai has playback */
>  	if (!link->capture_only) {
> -		ret = axg_card_add_tdm_loopback(card, index);
> +		ret = axg_card_add_tdm_loopback(priv, index);
>  		if (ret)
>  			return ret;
>  	}
> @@ -305,14 +307,15 @@ static int axg_card_cpu_is_codec(struct device_node *np)
>  		of_device_is_compatible(np, DT_PREFIX "g12a-toacodec");
>  }
>  
> -static int axg_card_add_link(struct snd_soc_card *card, struct device_node *np,
> +static int axg_card_add_link(struct meson_card *priv, struct device_node *np,
>  			     int *index)
>  {
> -	struct snd_soc_dai_link *dai_link = &card->dai_link[*index];
> +	struct snd_soc_dai_link *dai_link = &priv->card.dai_link[*index];
>  	struct snd_soc_dai_link_component *cpu;
> +	struct device *dev = priv->card.dev;
>  	int ret;
>  
> -	cpu = devm_kzalloc(card->dev, sizeof(*cpu), GFP_KERNEL);
> +	cpu = devm_kzalloc(dev, sizeof(*cpu), GFP_KERNEL);
>  	if (!cpu)
>  		return -ENOMEM;
>  
> @@ -320,17 +323,17 @@ static int axg_card_add_link(struct snd_soc_card *card, struct device_node *np,
>  	dai_link->num_cpus = 1;
>  	dai_link->nonatomic = true;
>  
> -	ret = meson_card_parse_dai(card, np, dai_link->cpus);
> +	ret = meson_card_parse_dai(priv, np, dai_link->cpus);
>  	if (ret)
>  		return ret;
>  
>  	if (axg_card_cpu_is_playback_fe(dai_link->cpus->of_node))
> -		return meson_card_set_fe_link(card, dai_link, np, true);
> +		return meson_card_set_fe_link(priv, dai_link, np, true);
>  	else if (axg_card_cpu_is_capture_fe(dai_link->cpus->of_node))
> -		return meson_card_set_fe_link(card, dai_link, np, false);
> +		return meson_card_set_fe_link(priv, dai_link, np, false);
>  
>  
> -	ret = meson_card_set_be_link(card, dai_link, np);
> +	ret = meson_card_set_be_link(priv, dai_link, np);
>  	if (ret)
>  		return ret;
>  
> @@ -340,7 +343,7 @@ static int axg_card_add_link(struct snd_soc_card *card, struct device_node *np,
>  	} else {
>  		dai_link->no_pcm = 1;
>  		if (axg_card_cpu_is_tdm_iface(dai_link->cpus->of_node))
> -			ret = axg_card_parse_tdm(card, np, index);
> +			ret = axg_card_parse_tdm(priv, np, index);
>  	}
>  
>  	return ret;
> diff --git a/sound/soc/meson/gx-card.c b/sound/soc/meson/gx-card.c
> index b408cc2bbc919..c0cbf31f28db5 100644
> --- a/sound/soc/meson/gx-card.c
> +++ b/sound/soc/meson/gx-card.c
> @@ -41,16 +41,16 @@ static const struct snd_soc_ops gx_card_i2s_be_ops = {
>  	.hw_params = gx_card_i2s_be_hw_params,
>  };
>  
> -static int gx_card_parse_i2s(struct snd_soc_card *card,
> +static int gx_card_parse_i2s(struct meson_card *priv,
>  			     struct device_node *node,
>  			     int *index)
>  {
> -	struct meson_card *priv = snd_soc_card_get_drvdata(card);
> -	struct snd_soc_dai_link *link = &card->dai_link[*index];
> +	struct snd_soc_dai_link *link = &priv->card.dai_link[*index];
>  	struct gx_dai_link_i2s_data *be;
> +	struct device *dev = priv->card.dev;
>  
>  	/* Allocate i2s link parameters */
> -	be = devm_kzalloc(card->dev, sizeof(*be), GFP_KERNEL);
> +	be = devm_kzalloc(dev, sizeof(*be), GFP_KERNEL);
>  	if (!be)
>  		return -ENOMEM;
>  	priv->link_data[*index] = be;
> @@ -76,28 +76,29 @@ static int gx_card_cpu_identify(struct snd_soc_dai_link_component *c,
>  	return 0;
>  }
>  
> -static int gx_card_add_link(struct snd_soc_card *card, struct device_node *np,
> +static int gx_card_add_link(struct meson_card *priv, struct device_node *np,
>  			    int *index)
>  {
> -	struct snd_soc_dai_link *dai_link = &card->dai_link[*index];
> +	struct snd_soc_dai_link *dai_link = &priv->card.dai_link[*index];
>  	struct snd_soc_dai_link_component *cpu;
> +	struct device *dev = priv->card.dev;
>  	int ret;
>  
> -	cpu = devm_kzalloc(card->dev, sizeof(*cpu), GFP_KERNEL);
> +	cpu = devm_kzalloc(dev, sizeof(*cpu), GFP_KERNEL);
>  	if (!cpu)
>  		return -ENOMEM;
>  
>  	dai_link->cpus = cpu;
>  	dai_link->num_cpus = 1;
>  
> -	ret = meson_card_parse_dai(card, np, dai_link->cpus);
> +	ret = meson_card_parse_dai(priv, np, dai_link->cpus);
>  	if (ret)
>  		return ret;
>  
>  	if (gx_card_cpu_identify(dai_link->cpus, "FIFO"))
> -		return  meson_card_set_fe_link(card, dai_link, np, true);
> +		return  meson_card_set_fe_link(priv, dai_link, np, true);
>  
> -	ret = meson_card_set_be_link(card, dai_link, np);
> +	ret = meson_card_set_be_link(priv, dai_link, np);
>  	if (ret)
>  		return ret;
>  
> @@ -109,7 +110,7 @@ static int gx_card_add_link(struct snd_soc_card *card, struct device_node *np,
>  		dai_link->no_pcm = 1;
>  		/* Check if the cpu is the i2s encoder and parse i2s data */
>  		if (gx_card_cpu_identify(dai_link->cpus, "I2S Encoder"))
> -			ret = gx_card_parse_i2s(card, np, index);
> +			ret = gx_card_parse_i2s(priv, np, index);
>  	}
>  
>  	return ret;
> diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
> index d144ab79b645b..7329711aefa56 100644
> --- a/sound/soc/meson/meson-card-utils.c
> +++ b/sound/soc/meson/meson-card-utils.c
> @@ -39,10 +39,9 @@ int meson_card_i2s_set_sysclk(struct snd_pcm_substream *substream,
>  }
>  EXPORT_SYMBOL_GPL(meson_card_i2s_set_sysclk);
>  
> -int meson_card_reallocate_links(struct snd_soc_card *card,
> +int meson_card_reallocate_links(struct meson_card *priv,
>  				unsigned int num_links)
>  {
> -	struct meson_card *priv = snd_soc_card_get_drvdata(card);
>  	struct snd_soc_dai_link *links;
>  	void **ldata;
>  
> @@ -67,10 +66,11 @@ int meson_card_reallocate_links(struct snd_soc_card *card,
>  }
>  EXPORT_SYMBOL_GPL(meson_card_reallocate_links);
>  
> -int meson_card_parse_dai(struct snd_soc_card *card,
> +int meson_card_parse_dai(struct meson_card *priv,
>  			 struct device_node *node,
>  			 struct snd_soc_dai_link_component *dlc)
>  {
> +	struct device *dev = priv->card.dev;
>  	int ret;
>  
>  	if (!dlc || !node)
> @@ -78,18 +78,19 @@ int meson_card_parse_dai(struct snd_soc_card *card,
>  
>  	ret = snd_soc_of_get_dlc(node, NULL, dlc, 0);
>  	if (ret)
> -		return dev_err_probe(card->dev, ret, "can't parse dai\n");
> +		return dev_err_probe(dev, ret, "can't parse dai\n");
>  
>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(meson_card_parse_dai);
>  
> -static int meson_card_set_link_name(struct snd_soc_card *card,
> +static int meson_card_set_link_name(struct meson_card *priv,
>  				    struct snd_soc_dai_link *link,
>  				    struct device_node *node,
>  				    const char *prefix)
>  {
> -	char *name = devm_kasprintf(card->dev, GFP_KERNEL, "%s.%s",
> +	struct device *dev = priv->card.dev;
> +	char *name = devm_kasprintf(dev, GFP_KERNEL, "%s.%s",
>  				    prefix, node->full_name);
>  	if (!name)
>  		return -ENOMEM;
> @@ -127,21 +128,22 @@ unsigned int meson_card_parse_daifmt(struct device_node *node,
>  }
>  EXPORT_SYMBOL_GPL(meson_card_parse_daifmt);
>  
> -int meson_card_set_be_link(struct snd_soc_card *card,
> +int meson_card_set_be_link(struct meson_card *priv,
>  			   struct snd_soc_dai_link *link,
>  			   struct device_node *node)
>  {
>  	struct snd_soc_dai_link_component *codec;
> +	struct device *dev = priv->card.dev;
>  	int ret, num_codecs;
>  
>  	num_codecs = of_get_child_count(node);
>  	if (!num_codecs) {
> -		dev_err(card->dev, "be link %s has no codec\n",
> +		dev_err(dev, "be link %s has no codec\n",
>  			node->full_name);
>  		return -EINVAL;
>  	}
>  
> -	codec = devm_kcalloc(card->dev, num_codecs, sizeof(*codec), GFP_KERNEL);
> +	codec = devm_kcalloc(dev, num_codecs, sizeof(*codec), GFP_KERNEL);
>  	if (!codec)
>  		return -ENOMEM;
>  
> @@ -149,22 +151,22 @@ int meson_card_set_be_link(struct snd_soc_card *card,
>  	link->num_codecs = num_codecs;
>  
>  	for_each_child_of_node_scoped(node, np) {
> -		ret = meson_card_parse_dai(card, np, codec);
> +		ret = meson_card_parse_dai(priv, np, codec);
>  		if (ret)
>  			return ret;
>  
>  		codec++;
>  	}
>  
> -	ret = meson_card_set_link_name(card, link, node, "be");
> +	ret = meson_card_set_link_name(priv, link, node, "be");
>  	if (ret)
> -		dev_err(card->dev, "error setting %pOFn link name\n", node);
> +		dev_err(dev, "error setting %pOFn link name\n", node);
>  
>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(meson_card_set_be_link);
>  
> -int meson_card_set_fe_link(struct snd_soc_card *card,
> +int meson_card_set_fe_link(struct meson_card *priv,
>  			   struct snd_soc_dai_link *link,
>  			   struct device_node *node,
>  			   bool is_playback)
> @@ -182,29 +184,29 @@ int meson_card_set_fe_link(struct snd_soc_card *card,
>  	else
>  		link->capture_only = 1;
>  
> -	return meson_card_set_link_name(card, link, node, "fe");
> +	return meson_card_set_link_name(priv, link, node, "fe");
>  }
>  EXPORT_SYMBOL_GPL(meson_card_set_fe_link);
>  
> -static int meson_card_add_links(struct snd_soc_card *card)
> +static int meson_card_add_links(struct meson_card *priv)
>  {
> -	struct meson_card *priv = snd_soc_card_get_drvdata(card);
> -	struct device_node *node = card->dev->of_node;
> +	struct device *dev = priv->card.dev;
> +	struct device_node *node = dev->of_node;
>  	int num, i, ret;
>  
>  	num = of_get_child_count(node);
>  	if (!num) {
> -		dev_err(card->dev, "card has no links\n");
> +		dev_err(dev, "card has no links\n");
>  		return -EINVAL;
>  	}
>  
> -	ret = meson_card_reallocate_links(card, num);
> +	ret = meson_card_reallocate_links(priv, num);
>  	if (ret)
>  		return ret;
>  
>  	i = 0;
>  	for_each_child_of_node_scoped(node, np) {
> -		ret = priv->match_data->add_link(card, np, &i);
> +		ret = priv->match_data->add_link(priv, np, &i);
>  		if (ret)
>  			return ret;
>  
> @@ -214,17 +216,19 @@ static int meson_card_add_links(struct snd_soc_card *card)
>  	return 0;
>  }
>  
> -static int meson_card_parse_of_optional(struct snd_soc_card *card,
> +static int meson_card_parse_of_optional(struct meson_card *priv,
>  					const char *propname,
>  					int (*func)(struct snd_soc_card *c,
>  						    const char *p))
>  {
> +	struct device *dev = priv->card.dev;
> +
>  	/* If property is not provided, don't fail ... */
> -	if (!of_property_present(card->dev->of_node, propname))
> +	if (!of_property_present(dev->of_node, propname))
>  		return 0;
>  
>  	/* ... but do fail if it is provided and the parsing fails */
> -	return func(card, propname);
> +	return func(&priv->card, propname);
>  }
>  
>  static void meson_card_clean_references(struct meson_card *priv)
> @@ -282,25 +286,25 @@ int meson_card_probe(struct platform_device *pdev)
>  	if (ret < 0)
>  		return ret;
>  
> -	ret = meson_card_parse_of_optional(&priv->card, "audio-routing",
> +	ret = meson_card_parse_of_optional(priv, "audio-routing",
>  					   snd_soc_of_parse_audio_routing);
>  	if (ret) {
>  		dev_err(dev, "error while parsing routing\n");
>  		return ret;
>  	}
>  
> -	ret = meson_card_parse_of_optional(&priv->card, "audio-widgets",
> +	ret = meson_card_parse_of_optional(priv, "audio-widgets",
>  					   snd_soc_of_parse_audio_simple_widgets);
>  	if (ret) {
>  		dev_err(dev, "error while parsing widgets\n");
>  		return ret;
>  	}
>  
> -	ret = meson_card_add_links(&priv->card);
> +	ret = meson_card_add_links(priv);
>  	if (ret)
>  		goto out_err;
>  
> -	ret = meson_card_parse_of_optional(&priv->card, "audio-aux-devs",
> +	ret = meson_card_parse_of_optional(priv, "audio-aux-devs",
>  					   snd_soc_of_parse_aux_devs);
>  	if (ret)
>  		goto out_err;
> diff --git a/sound/soc/meson/meson-card.h b/sound/soc/meson/meson-card.h
> index a0d693e4f4608..ce8d9042793bb 100644
> --- a/sound/soc/meson/meson-card.h
> +++ b/sound/soc/meson/meson-card.h
> @@ -16,8 +16,9 @@ struct snd_pcm_hw_params;
>  
>  #define DT_PREFIX "amlogic,"
>  
> +struct meson_card;
>  struct meson_card_match_data {
> -	int (*add_link)(struct snd_soc_card *card,
> +	int (*add_link)(struct meson_card *priv,
>  			struct device_node *node,
>  			int *index);
>  };
> @@ -35,15 +36,15 @@ int meson_card_i2s_set_sysclk(struct snd_pcm_substream *substream,
>  			      struct snd_pcm_hw_params *params,
>  			      unsigned int mclk_fs);
>  
> -int meson_card_reallocate_links(struct snd_soc_card *card,
> +int meson_card_reallocate_links(struct meson_card *priv,
>  				unsigned int num_links);
> -int meson_card_parse_dai(struct snd_soc_card *card,
> +int meson_card_parse_dai(struct meson_card *priv,
>  			 struct device_node *node,
>  			 struct snd_soc_dai_link_component *dlc);
> -int meson_card_set_be_link(struct snd_soc_card *card,
> +int meson_card_set_be_link(struct meson_card *priv,
>  			   struct snd_soc_dai_link *link,
>  			   struct device_node *node);
> -int meson_card_set_fe_link(struct snd_soc_card *card,
> +int meson_card_set_fe_link(struct meson_card *priv,
>  			   struct snd_soc_dai_link *link,
>  			   struct device_node *node,
>  			   bool is_playback);

-- 
Jerome
