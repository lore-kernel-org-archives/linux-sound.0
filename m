Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAA8AC54FB9
	for <linux-sound@archiver.kernel.org>; Fri, 17 Nov 2023 10:31:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345927AbjKQKbv (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Fri, 17 Nov 2023 05:31:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345931AbjKQKbp (ORCPT
        <rfc822;linux-sound@vger.kernel.org>);
        Fri, 17 Nov 2023 05:31:45 -0500
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 635FF194
        for <linux-sound@vger.kernel.org>; Fri, 17 Nov 2023 02:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700217098; x=1731753098;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=YwmxsuemiunoPvodGlowGg9rVKe7oncRfoDdH88wc/c=;
  b=hoSkmdDORhzQddX/TzZrTquc2IZ0kiBh6vBKy4zO/WnHH8GT+FdjWc02
   ahBYKqZ9czr+uyvTPtvHHZFKs9kfrVAdBAn0sLve2pTuCf/R3oiNQ4h6s
   4WdlVZMTuZGWBTrGvtLOu/Rqegb9L5VQDmc/6lOKpNUXb8HRS4DGvijJ4
   u1SLPTZozb4ks9g4nprzY/mD4wU7FeLuQTBPtO0eEgGNNO3yVQY3tCMEB
   a01Dzf+518K9fUn8oONy5l9DbvrPOd3QEjfqT4rjiyukY/e3Ry92QMhDT
   t4GJhsEy40TlJQ4HMgW4VUSkyJDgsRZPlk3ERkd+jI6TvK/5vMsJXg4nT
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="422371487"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="422371487"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 02:31:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="1097062556"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="1097062556"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.53]) ([10.94.0.53])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 02:31:36 -0800
Message-ID: <398a66f5-444a-4865-9ba6-68b85fd74058@linux.intel.com>
Date:   Fri, 17 Nov 2023 11:31:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: Intel: Skylake: mem leak in skl register function
Content-Language: en-US
To:     Kamil Duljas <kamil.duljas@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        Jaroslav Kysela <perex@perex.cz>,
        Cezary Rojewski <cezary.rojewski@intel.com>
References: <20231116224112.2209-2-kamil.duljas@gmail.com>
From:   =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?= 
        <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20231116224112.2209-2-kamil.duljas@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-sound.vger.kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org

On 11/16/2023 11:41 PM, Kamil Duljas wrote:
> skl_platform_register() uses krealloc. When krealloc is fail,
> then previous memory is not freed. The leak is also when soc
> component registration failed.
> 
> Signed-off-by: Kamil Duljas <kamil.duljas@gmail.com>
> ---
>   sound/soc/intel/skylake/skl-pcm.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/intel/skylake/skl-pcm.c b/sound/soc/intel/skylake/skl-pcm.c
> index d0c02e8a6785..e2578ee001ff 100644
> --- a/sound/soc/intel/skylake/skl-pcm.c
> +++ b/sound/soc/intel/skylake/skl-pcm.c
> @@ -1462,6 +1462,7 @@ int skl_platform_register(struct device *dev)
>   		dais = krealloc(skl->dais, sizeof(skl_fe_dai) +
>   				sizeof(skl_platform_dai), GFP_KERNEL);
>   		if (!dais) {
> +			kfree(skl->dais);
>   			ret = -ENOMEM;
>   			goto err;
>   		}
> @@ -1474,8 +1475,10 @@ int skl_platform_register(struct device *dev)
>   
>   	ret = devm_snd_soc_register_component(dev, &skl_component,
>   					 skl->dais, num_dais);
> -	if (ret)
> +	if (ret) {
> +		kfree(skl->dais);
>   		dev_err(dev, "soc component registration failed %d\n", ret);
> +	}
>   err:
>   	return ret;
>   }

Seems ok,
Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
