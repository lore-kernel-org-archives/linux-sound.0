Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2574133987F
	for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 10:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779444965; cv=none; b=MsX1Hnx05w/VvsBuJZTNkL7vRHElqTt0+qq+FPVckaSYe9OfgLYnqutw+Q+6yFcety3QqG9S+bBpFVK0ePm++9bHu+WW3jZ8qY5KDA8x+hKT475PTG3RgAxM+69p1bdqSozRKZY81O9+H9iOtJ/gQu7ZmNOBvlcOQm4t7YpOf/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779444965; c=relaxed/simple;
	bh=Pc7JtrHrhBm0P/aAy/PKK6VoavReaeGHu60MjutjSYc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q9E6yVNNNruBitP2YgLQzguXQuy3XoaEHhKc6nH8SwEpSgHlx+YaYEYll0N8Y7Q2AhNDJVrd9XLWSLhbE0knlPqiW7zRI5Y1W+ptbiH4DWaWIxwzYELKMCs6L6xrTiDwVBYEwNnGZakDC6UCJywemhAcaODSJQPvCqOrJduSHcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AceP09NO; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AceP09NO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779444963; x=1810980963;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Pc7JtrHrhBm0P/aAy/PKK6VoavReaeGHu60MjutjSYc=;
  b=AceP09NO/C8NIvV2e5nnBmJv7fZa0Y97Yl0JIBYVNO/5yh0HdbVqxYrR
   yek2KKqPRIUt4Dq2ku2Qy0I3ISjrT1DUffg/6C1Pn/YAVwfeNPpZK7bAa
   QlXI3qYfxk+wTWeKaG/pto8Re9Es8Bl81VF9KFdu4bmufBu8PmcdbXqT2
   7YkbZvJ7rLpSAjlTnSJbP952PmJ9rlhujiKhfW3f+4sI8gx72sGgHlMk3
   jD49wfSpF6pARbgxr1euf72VhaiWCQfFoMI1mXuDXqmOebZQ9zkCNJRgK
   8yQFMPX327TxCHcciuCkSjiQhkokMgdhWuX6xDUPl4Nh6cS4QZu89ZFwN
   A==;
X-CSE-ConnectionGUID: zqF05TnaSzCKk7tfPkBmTQ==
X-CSE-MsgGUID: yflnvBeqQhWgnM+QIaiX6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="80275384"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="80275384"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 03:16:02 -0700
X-CSE-ConnectionGUID: NqMM2EorSBG3JT/2GO6W6Q==
X-CSE-MsgGUID: roKHm5LcQ1igG42YjnuGrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="236651080"
Received: from slindbla-desk.ger.corp.intel.com (HELO [10.245.244.207]) ([10.245.244.207])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 03:16:01 -0700
Message-ID: <01d1d642-bf24-4ef4-a30d-56884300407f@linux.intel.com>
Date: Fri, 22 May 2026 13:16:10 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: core: Move all users to deferrable card binding
To: Cezary Rojewski <cezary.rojewski@intel.com>, broonie@kernel.org
Cc: tiwai@suse.com, perex@perex.cz, amade@asmblr.net,
 kuninori.morimoto.gx@renesas.com, linux-sound@vger.kernel.org,
 "Liao, Bard" <bard.liao@intel.com>, "Vehmanen, Kai" <kai.vehmanen@intel.com>
References: <20260430140752.766130-1-cezary.rojewski@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20260430140752.766130-1-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Cezary,

On 30/04/2026 17:07, Cezary Rojewski wrote:
> Commit a3375522bb5e2 ("ASoC: core: Complete support for card rebinding")
> completed the feature and at the same time divided ASoC users into two
> groups:
> 
> 1) cards that fail to enumerate the moment one of the components is
>    not available
> 2) cards that succeed to enumerate even if some of their components
>    become available late
> 
> Given the component-based nature of ASoC, approach 2) is preferred and
> can be used by all ASoC users.  By dropping 1) the card binding code can
> also be simplified.
> 
> Flatten code that is currently conditional based on ->devres_dev and
> convert snd_soc_rebind_card() to call_soc_bind_card().  The latter is a
> selector between managed and unmanaged card-binding behaviour to keep
> non-devm users happy.
> 
> With rebinding being the default, devm_snd_soc_register_card() takes
> form of its deferrable friend - all the devm job is already done by
> devm_snd_soc_bind_card().

This patch showed up in sof-dev kernel after a recent upstream merge and
broke audio card probing on some devices.

There are no errors in kernel log, the card just does not form.
Reverting only this patch fixes the card binding.

The affected device have 2x sndw speaker amps, 	1x headset codec and 3x
HDMI PCMs.

It is likely that one of the codec's probe happens after the card
probed, the card is not created for some reason and nothing happens.

rmmod snd_soc_sof_sdw
modprobe snd_soc_sof_sdw

will create the card, so it is likely that going ahead without waiting
for all components can and might break audio on system boot.
> Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
> 
> This is a direct continuation of subject [1] begun by Kuninori with goal
> of simplifying the code related to card rebinding.
> 
> [1]: https://lore.kernel.org/linux-sound/87eck7k868.wl-kuninori.morimoto.gx@renesas.com/
> 
>  include/sound/soc.h    |  2 +-
>  sound/soc/soc-core.c   | 44 ++++++++++++++----------------------------
>  sound/soc/soc-devres.c | 28 +--------------------------
>  3 files changed, 17 insertions(+), 57 deletions(-)
> 
> diff --git a/include/sound/soc.h b/include/sound/soc.h
> index a30f95ff7d86..f0935523c8df 100644
> --- a/include/sound/soc.h
> +++ b/include/sound/soc.h
> @@ -425,7 +425,7 @@ struct snd_soc_jack_pin;
>  int snd_soc_register_card(struct snd_soc_card *card);
>  void snd_soc_unregister_card(struct snd_soc_card *card);
>  int devm_snd_soc_register_card(struct device *dev, struct snd_soc_card *card);
> -int devm_snd_soc_register_deferrable_card(struct device *dev, struct snd_soc_card *card);
> +#define devm_snd_soc_register_deferrable_card(d, c) devm_snd_soc_register_card(d, c)
>  #ifdef CONFIG_PM_SLEEP
>  int snd_soc_suspend(struct device *dev);
>  int snd_soc_resume(struct device *dev);
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index e70bf22db5c9..ec141b810b50 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -2165,6 +2165,7 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
>  	snd_soc_fill_dummy_dai(card);
>  
>  	snd_soc_dapm_init(dapm, card, NULL);
> +	list_del_init(&card->list);
>  
>  	/* check whether any platform is ignore machine FE and using topology */
>  	soc_check_tplg_fes(card);
> @@ -2308,6 +2309,10 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
>  probe_end:
>  	if (ret < 0)
>  		soc_cleanup_card_resources(card);
> +	if (ret == -EPROBE_DEFER) {
> +		list_add(&card->list, &unbind_card_list);
> +		ret = 0;
> +	}
>  	snd_soc_card_mutex_unlock(card);
>  
>  	return ret;
> @@ -2323,12 +2328,15 @@ static int devm_snd_soc_bind_card(struct device *dev, struct snd_soc_card *card)
>  	struct snd_soc_card **ptr;
>  	int ret;
>  
> +	/* The procedure may be called many times during the lifetime of the card. */
> +	devres_destroy(dev, devm_card_bind_release, NULL, NULL);
> +
>  	ptr = devres_alloc(devm_card_bind_release, sizeof(*ptr), GFP_KERNEL);
>  	if (!ptr)
>  		return -ENOMEM;
>  
>  	ret = snd_soc_bind_card(card);
> -	if (ret == 0 || ret == -EPROBE_DEFER) {
> +	if (ret == 0) {
>  		*ptr = card;
>  		devres_add(dev, ptr);
>  	} else {
> @@ -2338,21 +2346,11 @@ static int devm_snd_soc_bind_card(struct device *dev, struct snd_soc_card *card)
>  	return ret;
>  }
>  
> -static int snd_soc_rebind_card(struct snd_soc_card *card)
> +static int call_soc_bind_card(struct snd_soc_card *card)
>  {
> -	int ret;
> -
> -	if (card->devres_dev) {
> -		devres_destroy(card->devres_dev, devm_card_bind_release, NULL, NULL);
> -		ret = devm_snd_soc_bind_card(card->devres_dev, card);
> -	} else {
> -		ret = snd_soc_bind_card(card);
> -	}
> -
> -	if (ret != -EPROBE_DEFER)
> -		list_del_init(&card->list);
> -
> -	return ret;
> +	if (card->devres_dev)
> +		return devm_snd_soc_bind_card(card->devres_dev, card);
> +	return snd_soc_bind_card(card);
>  }
>  
>  /* probes a new socdev */
> @@ -2550,8 +2548,6 @@ EXPORT_SYMBOL_GPL(snd_soc_add_dai_controls);
>   */
>  int snd_soc_register_card(struct snd_soc_card *card)
>  {
> -	int ret;
> -
>  	if (!card->name || !card->dev)
>  		return -EINVAL;
>  
> @@ -2578,17 +2574,7 @@ int snd_soc_register_card(struct snd_soc_card *card)
>  
>  	guard(mutex)(&client_mutex);
>  
> -	if (card->devres_dev) {
> -		ret = devm_snd_soc_bind_card(card->devres_dev, card);
> -		if (ret == -EPROBE_DEFER) {
> -			list_add(&card->list, &unbind_card_list);
> -			ret = 0;
> -		}
> -	} else {
> -		ret = snd_soc_bind_card(card);
> -	}
> -
> -	return ret;
> +	return call_soc_bind_card(card);
>  }
>  EXPORT_SYMBOL_GPL(snd_soc_register_card);
>  
> @@ -2909,7 +2895,7 @@ int snd_soc_add_component(struct snd_soc_component *component,
>  	list_add(&component->list, &component_list);
>  
>  	list_for_each_entry_safe(card, c, &unbind_card_list, list)
> -		snd_soc_rebind_card(card);
> +		call_soc_bind_card(card);
>  
>  err_cleanup:
>  	if (ret < 0)
> diff --git a/sound/soc/soc-devres.c b/sound/soc/soc-devres.c
> index d33f83ec24f2..718165ba84ac 100644
> --- a/sound/soc/soc-devres.c
> +++ b/sound/soc/soc-devres.c
> @@ -49,11 +49,6 @@ int devm_snd_soc_register_component(struct device *dev,
>  }
>  EXPORT_SYMBOL_GPL(devm_snd_soc_register_component);
>  
> -static void devm_card_release(struct device *dev, void *res)
> -{
> -	snd_soc_unregister_card(*(struct snd_soc_card **)res);
> -}
> -
>  /**
>   * devm_snd_soc_register_card - resource managed card registration
>   * @dev: Device used to manage card
> @@ -63,32 +58,11 @@ static void devm_card_release(struct device *dev, void *res)
>   * unregistered.
>   */
>  int devm_snd_soc_register_card(struct device *dev, struct snd_soc_card *card)
> -{
> -	struct snd_soc_card **ptr;
> -	int ret;
> -
> -	ptr = devres_alloc(devm_card_release, sizeof(*ptr), GFP_KERNEL);
> -	if (!ptr)
> -		return -ENOMEM;
> -
> -	ret = snd_soc_register_card(card);
> -	if (ret == 0) {
> -		*ptr = card;
> -		devres_add(dev, ptr);
> -	} else {
> -		devres_free(ptr);
> -	}
> -
> -	return ret;
> -}
> -EXPORT_SYMBOL_GPL(devm_snd_soc_register_card);
> -
> -int devm_snd_soc_register_deferrable_card(struct device *dev, struct snd_soc_card *card)
>  {
>  	card->devres_dev = dev;
>  	return snd_soc_register_card(card);
>  }
> -EXPORT_SYMBOL_GPL(devm_snd_soc_register_deferrable_card);
> +EXPORT_SYMBOL_GPL(devm_snd_soc_register_card);
>  
>  #ifdef CONFIG_SND_SOC_GENERIC_DMAENGINE_PCM
>  

-- 
Péter

