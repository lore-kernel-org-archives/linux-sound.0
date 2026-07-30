Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3875B401A0A;
	Thu, 30 Jul 2026 11:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785410051; cv=none; b=SF2q7pjDS5Cosfl9VkhJWYnU3t+DzpcFXP6ge8/8rZQdVYSGpYau+pwDW3pEXvKBemU2C5/Z3EkesTJn3uNzXS9CDNSmyBSSS/sroQJhWchXr6J0v9rkvuD4G4gMbYsPfPse35Xfw/jgsJNBC0zja73pcwBKKuMfBCs9syk9bco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785410051; c=relaxed/simple;
	bh=aDK+j8XJyQ+NxoaiQj1ynGi5u8hm7rE5yDZJUhXEiHM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SpTp/wJHsNjjtIaLaN2Zhp2ol52lv4acQCzxke+LGizI3cpvGtoiQr9NQh0TVO+VOveJXWP7LvYF5VluTyx9XDuijnhLrNXZjaoQ2q38QaIJfOt29JUtZh3xHPc2JhVQGuQcC2OllzaibyrNqhu/iBIn523jBzbnb/LxY7DRmEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aqwNccvy; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aqwNccvy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785410050; x=1816946050;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=aDK+j8XJyQ+NxoaiQj1ynGi5u8hm7rE5yDZJUhXEiHM=;
  b=aqwNccvy0cRTNkCJTdvQEfvj0qAasjCMpRPXt4HoZ2GDZbOIs+yaxjUI
   A8aI9qw+K8GwtJ+KGfurU2djpakvIzAc95q+bVgpUT3DzbneLD1giVzvH
   x4ZZeLa5gB1GlmXNMKA4mL2xa/C716aZ3+JXgvEpb8sifLgwDGfhMYMMl
   iBAQRSVxgrWjGpLUXoVgQPqb4Eez7DqlZ4boUbdXzqpBIYQprbEpNd2pI
   QTkGfJFtZVTvQnBCki33VQeKjHd1Y+l+sj40cCBoU7tOlHNlo4xvM4M3j
   LDM63miVAIRwJCBq2c4DJqC8QtwLfqqxvdIKbWBYDCXwDm0ysfIT7f16N
   A==;
X-CSE-ConnectionGUID: WjGut+CMRLadnM1MBqW37A==
X-CSE-MsgGUID: D6Bwed4vSreH0aag7BL7Rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="86217412"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="86217412"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 04:14:10 -0700
X-CSE-ConnectionGUID: tbnmdVztQ3C8mNA0tNW9xw==
X-CSE-MsgGUID: gi3GbssISru9tL87yBp+GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="298483030"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO [10.245.246.79]) ([10.245.246.79])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 04:14:04 -0700
Message-ID: <c1ea2842-8c27-4b2c-a0ec-e8d06bd182cd@linux.intel.com>
Date: Thu, 30 Jul 2026 14:14:41 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] ASoC: Use named initializers for
 platform_device_id arrays
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Cc: James Ogletree <jogletre@opensource.cirrus.com>,
 Fred Treven <fred.treven@cirrus.com>, Ben Bright <ben.bright@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Maciej Strozek <mstrozek@opensource.cirrus.com>,
 Mac Chiang <mac.chiang@intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kees Cook <kees@kernel.org>, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1784528081.git.u.kleine-koenig@baylibre.com>
 <a76e26aa4edb901b4bea684919463b2243dd8d9d.1784528081.git.u.kleine-koenig@baylibre.com>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <a76e26aa4edb901b4bea684919463b2243dd8d9d.1784528081.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 20/07/2026 09:23, Uwe Kleine-König (The Capable Hub) wrote:
> Named initializers are better readable and more robust to changes of the
> struct definition. This robustness is relevant for a planned change to
> struct platform_device_id replacing .driver_data by an anonymous union.
> 
> While touching these arrays unify spacing and usage of commas.
> 
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

Reviewed-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

> ---
>  sound/soc/codecs/cs40l50-codec.c | 4 ++--
>  sound/soc/codecs/cs42l43.c       | 4 ++--
>  sound/soc/intel/boards/sof_sdw.c | 4 ++--
>  3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/sound/soc/codecs/cs40l50-codec.c b/sound/soc/codecs/cs40l50-codec.c
> index aa629ef53db4..676367163067 100644
> --- a/sound/soc/codecs/cs40l50-codec.c
> +++ b/sound/soc/codecs/cs40l50-codec.c
> @@ -288,8 +288,8 @@ static int cs40l50_codec_driver_probe(struct platform_device *pdev)
>  }
>  
>  static const struct platform_device_id cs40l50_id[] = {
> -	{ "cs40l50-codec", },
> -	{}
> +	{ .name = "cs40l50-codec" },
> +	{ }
>  };
>  MODULE_DEVICE_TABLE(platform, cs40l50_id);
>  
> diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
> index 47308cd870fb..1b817e1a6ea5 100644
> --- a/sound/soc/codecs/cs42l43.c
> +++ b/sound/soc/codecs/cs42l43.c
> @@ -2935,8 +2935,8 @@ static const struct dev_pm_ops cs42l43_codec_pm_ops = {
>  };
>  
>  static const struct platform_device_id cs42l43_codec_id_table[] = {
> -	{ "cs42l43-codec", },
> -	{}
> +	{ .name = "cs42l43-codec" },
> +	{ }
>  };
>  MODULE_DEVICE_TABLE(platform, cs42l43_codec_id_table);
>  
> diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
> index 1013e07052a3..346a7b59d8e3 100644
> --- a/sound/soc/intel/boards/sof_sdw.c
> +++ b/sound/soc/intel/boards/sof_sdw.c
> @@ -1542,8 +1542,8 @@ static void mc_remove(struct platform_device *pdev)
>  }
>  
>  static const struct platform_device_id mc_id_table[] = {
> -	{ "sof_sdw", },
> -	{}
> +	{ .name = "sof_sdw" },
> +	{ }
>  };
>  MODULE_DEVICE_TABLE(platform, mc_id_table);
>  

-- 
Péter

