Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBEBFC072A2
	for <linux-sound@archiver.kernel.org>; Fri, 17 Nov 2023 11:56:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345851AbjKQL42 (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Fri, 17 Nov 2023 06:56:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343584AbjKQL41 (ORCPT
        <rfc822;linux-sound@vger.kernel.org>);
        Fri, 17 Nov 2023 06:56:27 -0500
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DF8B98
        for <linux-sound@vger.kernel.org>; Fri, 17 Nov 2023 03:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700222184; x=1731758184;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=EhCA4GJwxiNKWqsuH7RYsQMFdgVadlUGf41PRxfDlzs=;
  b=IyeyJYMBLKCJf7ceeF27tgAS6kWM7Fo++uYRkwRsr2HBnoBImRCrh6/j
   way4EEOu1y7v+/aiaLXDhDR2QUSuNUa+GUa4LGZ2KjzD6R+q4hynnZc9G
   Bus3L1XXoCFuKQoRzjn1F/gpBz5R3yDny0MyQbj4UAS/mz8O74j/RJIvF
   NG9g7t1pmT7awbtQhznAwkdKvrGIVmKCklYXIyrgmDil7TZWE5yswrOL3
   RBv/l7DClK00pvZ7rAGgidJH5jKbH3iQ8Hl2fDBjaodCSm363/MBqn2HB
   WFytBHyD2TYtoIG+3v/c28LFCxRVlSY9Ek3yaLgR/vPv/bWZULfXadTB8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="376334760"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="376334760"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 03:56:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="831597672"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="831597672"
Received: from mwevers-mobl1.ger.corp.intel.com (HELO [10.249.44.74]) ([10.249.44.74])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 03:56:21 -0800
Message-ID: <ad838263-dd08-461f-87cd-36e95f9e433c@linux.intel.com>
Date:   Fri, 17 Nov 2023 13:56:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: SOF: topology: Fix mem leak in sof_dai_load()
To:     Kamil Duljas <kamil.duljas@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
        linux-sound@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
        Cezary Rojewski <cezary.rojewski@intel.com>,
        =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?= 
        <amadeuszx.slawinski@linux.intel.com>
References: <20231116213926.2034-2-kamil.duljas@gmail.com>
Content-Language: en-US
From:   =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20231116213926.2034-2-kamil.duljas@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-sound.vger.kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org

On 16/11/2023 23:39, Kamil Duljas wrote:
> The function has multiple return points at which it is not released
> previously allocated memory.

Acked-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

> Signed-off-by: Kamil Duljas <kamil.duljas@gmail.com>
> ---
> Changes in v2: removed wrong usages of kfree
> ---
>  sound/soc/sof/topology.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
> index a3a3af252259..37ec671a2d76 100644
> --- a/sound/soc/sof/topology.c
> +++ b/sound/soc/sof/topology.c
> @@ -1736,8 +1736,10 @@ static int sof_dai_load(struct snd_soc_component *scomp, int index,
>  	/* perform pcm set op */
>  	if (ipc_pcm_ops && ipc_pcm_ops->pcm_setup) {
>  		ret = ipc_pcm_ops->pcm_setup(sdev, spcm);
> -		if (ret < 0)
> +		if (ret < 0) {
> +			kfree(spcm);
>  			return ret;
> +		}
>  	}
>  
>  	dai_drv->dobj.private = spcm;

-- 
Péter
