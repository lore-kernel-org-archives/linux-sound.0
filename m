Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAC84C072A2
	for <linux-sound@archiver.kernel.org>; Fri, 17 Nov 2023 10:30:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230455AbjKQKac (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Fri, 17 Nov 2023 05:30:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230240AbjKQKab (ORCPT
        <rfc822;linux-sound@vger.kernel.org>);
        Fri, 17 Nov 2023 05:30:31 -0500
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 125DED4E
        for <linux-sound@vger.kernel.org>; Fri, 17 Nov 2023 02:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700217028; x=1731753028;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=cOHAaYPRxtyxODavsRav9jwEKw9D9DOZg1yHIgcNARw=;
  b=A7ugnmW2gH6o9T2zV0YHsNAnAtzjeonm3kDvFhHApa7I7rG5rgpQ9M5b
   27GmDrXvmGZFoDHY+BxmRtI9BFWZslJG4f0GBiMPK2zvkwnfJZKnLfVRP
   zI3zANaKfzUVcYyu23DZrwwWBNy3Ip/iRkjSVKScvls+elxPwZcUBkTS7
   +WeyxwS4hZI9qRjikzeZJcjUy8AZ/nRcy56VlOFynwyODACss5Jykoa2j
   vx92ir+cGkVDhcqjR/l+O/RehE8S3nBKPYFSi4VoFX3/6HsQkePpfBTxN
   uP+ksV/aCdsTB0iBCJmiG1BbN9dVGl0yIjDMO1iKVX+zjfQdTDaKadOFi
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="422371397"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="422371397"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 02:30:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="1097062243"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="1097062243"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.53]) ([10.94.0.53])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 02:30:23 -0800
Message-ID: <3ab5e640-03b5-49c5-9ec0-ce23f13212ba@linux.intel.com>
Date:   Fri, 17 Nov 2023 11:30:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: Intel: Skylake: Fix mem leak in few functions
Content-Language: en-US
To:     Kamil Duljas <kamil.duljas@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
        linux-sound@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
        Cezary Rojewski <cezary.rojewski@intel.com>
References: <20231116125150.1436-1-kamil.duljas@gmail.com>
From:   =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?= 
        <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20231116125150.1436-1-kamil.duljas@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-sound.vger.kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org

On 11/16/2023 1:51 PM, Kamil Duljas wrote:
> The resources should be freed when function return error.
> 
> Signed-off-by: Kamil Duljas <kamil.duljas@gmail.com>
> ---
>   sound/soc/intel/skylake/skl-pcm.c     | 4 +++-
>   sound/soc/intel/skylake/skl-sst-ipc.c | 4 +++-
>   2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/intel/skylake/skl-pcm.c b/sound/soc/intel/skylake/skl-pcm.c
> index d0c02e8a6785..18866bc415a5 100644
> --- a/sound/soc/intel/skylake/skl-pcm.c
> +++ b/sound/soc/intel/skylake/skl-pcm.c
> @@ -240,8 +240,10 @@ static int skl_pcm_open(struct snd_pcm_substream *substream,
>   	snd_pcm_set_sync(substream);
>   
>   	mconfig = skl_tplg_fe_get_cpr_module(dai, substream->stream);
> -	if (!mconfig)
> +	if (!mconfig) {
> +		kfree(dma_params);
>   		return -EINVAL;
> +	}
>   
>   	skl_tplg_d0i3_get(skl, mconfig->d0i3_caps);
>   
> diff --git a/sound/soc/intel/skylake/skl-sst-ipc.c b/sound/soc/intel/skylake/skl-sst-ipc.c
> index 7a425271b08b..fd9624ad5f72 100644
> --- a/sound/soc/intel/skylake/skl-sst-ipc.c
> +++ b/sound/soc/intel/skylake/skl-sst-ipc.c
> @@ -1003,8 +1003,10 @@ int skl_ipc_get_large_config(struct sst_generic_ipc *ipc,
>   
>   	reply.size = (reply.header >> 32) & IPC_DATA_OFFSET_SZ_MASK;
>   	buf = krealloc(reply.data, reply.size, GFP_KERNEL);
> -	if (!buf)
> +	if (!buf) {
> +		kfree(reply.data);
>   		return -ENOMEM;
> +	}
>   	*payload = buf;
>   	*bytes = reply.size;
>   

Seems ok,
Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
