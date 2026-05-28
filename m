Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7AF2F691F
	for <linux-sound@vger.kernel.org>; Thu, 28 May 2026 07:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779952738; cv=none; b=apJ7YRTnWsdpFZjSIlc0NIe/6eprhgXKMPMMpER52mxIL2AxAc4W5NhDfOAX4ptspuc/AiP+ugdm20J+/siRB8nvp56jV63mxCGBeKiVYwYX+QriwhPUt+lBurz1ZrYme+Ww+8XNRi+o3DX7hc5JtB9Pejd0CzFMKZHGgvy8dMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779952738; c=relaxed/simple;
	bh=ExiRI/IK4e+EYS8oihOPYXzGCoKR9O424u8K93oHFF8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=fl0o1qjBAba1Aq0o0gKCr0AgnLhNustWUlC/gLDHSG89GcCvd3sBSc6odJEJmRppWbpBt/VqtVXnTxXjBHkrXB9wslr9C0Dj44rAwcb4YQBXz3Zg6KGrVWBKU11T5gtR1ESrFTjDV9qQHFel8h3Xx0vmIbFWv9Qo2EPb+X3prrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SpwSBBCG; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SpwSBBCG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779952736; x=1811488736;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=ExiRI/IK4e+EYS8oihOPYXzGCoKR9O424u8K93oHFF8=;
  b=SpwSBBCGSP1Nb8j0EdrzOSDSxYWXfk5edEN6ZKJPEnGmSk/rZlRksxGS
   luENz+SJMAaYafA/uz+G3yVUCzYK0xxctUdu+jiwyOk9nercIjuqmjYK9
   pLKaQpn3kdR1vB7OmJWOcCyK973LGtfP4vBqVl2njhVJ64OfQfXYSL5I8
   6uIokkx1v8Nk4p3JNbJxgQVdOo3uPM96gX/CDJ0u9//vLUGpnhpKOzh05
   /nkF+tXEs7QBkmtez+c+Y8q2vUCLAo8D5w/MKYhKuYpGB/KlEOOWHwHfO
   etrCNwPHs8IaMQG1r5ExlmaMAk6+xT27kJ8LBiE0X/0smOL0sEj8XhFXk
   w==;
X-CSE-ConnectionGUID: NfgtUJNeT8aGw1rOFtRsWQ==
X-CSE-MsgGUID: xPjxDi1ATUCqgC/C3YF8FA==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="80515948"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="80515948"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 00:18:56 -0700
X-CSE-ConnectionGUID: CQUH3NxETnKiaxkGsE55JQ==
X-CSE-MsgGUID: sAUS0hOlR9C6RNSKPRkAJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="246743665"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO [10.245.246.29]) ([10.245.246.29])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 00:18:52 -0700
Message-ID: <5f584713-10fa-4e23-b5ce-a64d9f808665@linux.intel.com>
Date: Thu, 28 May 2026 10:19:00 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: soc-card: add snd_soc_card_set_topology_name()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Daniel Baluta <daniel.baluta@nxp.com>,
 Jaroslav Kysela <perex@perex.cz>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Takashi Iwai <tiwai@suse.com>, linux-arm-kernel@lists.infradead.org,
 linux-sound@vger.kernel.org
References: <878q942wce.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <878q942wce.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 28/05/2026 03:48, Kuninori Morimoto wrote:
> Some drivers want to use topology name, but currently each drivers are
> setting it by own method.
> This patch adds new snd_soc_card_set_topology_name() and do it by
> same method.
> 
> Almost all driver doesn't set topology name, let's remove fixed name
> array, and use devm_kasprintf() instead.

Reviewed-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
> v1 -> v2
> 	- snd_soc_card_set_topology_name() checks prefix, too
> 
>  include/sound/soc-card.h                        |  2 ++
>  include/sound/soc.h                             |  3 +--
>  .../soc/mediatek/common/mtk-soundcard-driver.c  |  7 ++-----
>  sound/soc/soc-card.c                            | 13 +++++++++++++
>  sound/soc/soc-core.c                            | 17 +----------------
>  sound/soc/sof/nocodec.c                         |  4 ++--
>  6 files changed, 21 insertions(+), 25 deletions(-)
> 
> diff --git a/include/sound/soc-card.h b/include/sound/soc-card.h
> index ecc02e955279f..1f1e7d45f5533 100644
> --- a/include/sound/soc-card.h
> +++ b/include/sound/soc-card.h
> @@ -47,6 +47,8 @@ int snd_soc_card_late_probe(struct snd_soc_card *card);
>  void snd_soc_card_fixup_controls(struct snd_soc_card *card);
>  int snd_soc_card_remove(struct snd_soc_card *card);
>  
> +void snd_soc_card_set_topology_name(struct snd_soc_card *card, const char *preifx);
> +
>  int snd_soc_card_set_bias_level(struct snd_soc_card *card,
>  				struct snd_soc_dapm_context *dapm,
>  				enum snd_soc_bias_level level);
> diff --git a/include/sound/soc.h b/include/sound/soc.h
> index 8681dd3f4252f..10ad80f930c2e 100644
> --- a/include/sound/soc.h
> +++ b/include/sound/soc.h
> @@ -987,7 +987,7 @@ struct snd_soc_card {
>  	bool pci_subsystem_set;
>  #endif /* CONFIG_PCI */
>  
> -	char topology_shortname[32];
> +	char *topology_shortname;
>  
>  	struct device *dev;
>  	struct snd_card *snd_card;
> @@ -1084,7 +1084,6 @@ struct snd_soc_card {
>  #endif
>  	/* bit field */
>  	unsigned int instantiated:1;
> -	unsigned int topology_shortname_created:1;
>  	unsigned int fully_routed:1;
>  	unsigned int probed:1;
>  	unsigned int component_chaining:1;
> diff --git a/sound/soc/mediatek/common/mtk-soundcard-driver.c b/sound/soc/mediatek/common/mtk-soundcard-driver.c
> index a2a30a87a359f..cdff7322426a9 100644
> --- a/sound/soc/mediatek/common/mtk-soundcard-driver.c
> +++ b/sound/soc/mediatek/common/mtk-soundcard-driver.c
> @@ -289,11 +289,8 @@ int mtk_soundcard_common_probe(struct platform_device *pdev)
>  		soc_card_data->sof_priv = pdata->sof_priv;
>  		card->probe = mtk_sof_card_probe;
>  		card->late_probe = mtk_sof_card_late_probe;
> -		if (!card->topology_shortname_created) {
> -			snprintf(card->topology_shortname, 32, "sof-%s", card->name);
> -			card->topology_shortname_created = true;
> -		}
> -		card->name = card->topology_shortname;
> +
> +		snd_soc_card_set_topology_name(card, "sof");
>  	}
>  
>  	/*
> diff --git a/sound/soc/soc-card.c b/sound/soc/soc-card.c
> index 235427d690617..282d666dae9ec 100644
> --- a/sound/soc/soc-card.c
> +++ b/sound/soc/soc-card.c
> @@ -246,3 +246,16 @@ void snd_soc_card_remove_dai_link(struct snd_soc_card *card,
>  		card->remove_dai_link(card, dai_link);
>  }
>  EXPORT_SYMBOL_GPL(snd_soc_card_remove_dai_link);
> +
> +void snd_soc_card_set_topology_name(struct snd_soc_card *card, const char *prefix)
> +{
> +	if (!prefix || !card->name)
> +		return;
> +
> +	if (!card->topology_shortname)
> +		card->topology_shortname = devm_kasprintf(card->dev, GFP_KERNEL,
> +							  "%s-%s", prefix, card->name);
> +
> +	card->name = card->topology_shortname;
> +}
> +EXPORT_SYMBOL_GPL(snd_soc_card_set_topology_name);
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index 55130eea04544..e96dd4a3f46c7 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -1990,7 +1990,6 @@ static inline int snd_soc_set_dmi_name(struct snd_soc_card *card)
>  static void soc_check_tplg_fes(struct snd_soc_card *card)
>  {
>  	struct snd_soc_component *component;
> -	const struct snd_soc_component_driver *comp_drv;
>  	struct snd_soc_dai_link *dai_link;
>  	int i;
>  
> @@ -2051,21 +2050,7 @@ static void soc_check_tplg_fes(struct snd_soc_card *card)
>  		}
>  
>  		/* Inform userspace we are using alternate topology */
> -		if (component->driver->topology_name_prefix) {
> -
> -			/* topology shortname created? */
> -			if (!card->topology_shortname_created) {
> -				comp_drv = component->driver;
> -
> -				snprintf(card->topology_shortname, 32, "%s-%s",
> -					 comp_drv->topology_name_prefix,
> -					 card->name);
> -				card->topology_shortname_created = true;
> -			}
> -
> -			/* use topology shortname */
> -			card->name = card->topology_shortname;
> -		}
> +		snd_soc_card_set_topology_name(card, component->driver->topology_name_prefix);
>  	}
>  }
>  
> diff --git a/sound/soc/sof/nocodec.c b/sound/soc/sof/nocodec.c
> index c0c906a78ebae..11a95dba3c9cf 100644
> --- a/sound/soc/sof/nocodec.c
> +++ b/sound/soc/sof/nocodec.c
> @@ -15,7 +15,6 @@
>  
>  static struct snd_soc_card sof_nocodec_card = {
>  	.name = "nocodec", /* the sof- prefix is added by the core */
> -	.topology_shortname = "sof-nocodec",
>  	.owner = THIS_MODULE
>  };
>  
> @@ -89,9 +88,10 @@ static int sof_nocodec_probe(struct platform_device *pdev)
>  	int ret;
>  
>  	card->dev = &pdev->dev;
> -	card->topology_shortname_created = true;
>  	mach = pdev->dev.platform_data;
>  
> +	snd_soc_card_set_topology_name(card, "sof");
> +
>  	ret = sof_nocodec_setup(card->dev, mach->mach_params.num_dai_drivers,
>  				mach->mach_params.dai_drivers);
>  	if (ret < 0)

-- 
Péter

