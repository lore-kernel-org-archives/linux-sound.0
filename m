Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95462C197A0
	for <linux-sound@archiver.kernel.org>; Fri, 17 Nov 2023 12:04:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbjKQMEj (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Fri, 17 Nov 2023 07:04:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjKQMEe (ORCPT
        <rfc822;linux-sound@vger.kernel.org>);
        Fri, 17 Nov 2023 07:04:34 -0500
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7CD7A5
        for <linux-sound@vger.kernel.org>; Fri, 17 Nov 2023 04:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700222671; x=1731758671;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=JNdqCpXJsVXxWZqG2ZZwRtS/8lxxiBHyZBSn0pv8dTw=;
  b=Jl8cxe+NuHN+R5c0s+RHLWFoiv4HYACFtHlrZoeVzP0regaA8limNo/a
   ZuHA/WQOVvBkDK315dJKuOF0f8IcNX+pAbx+LH+V80wwW9CkHUre4La70
   BAPwx3lN6FZObzsxOa4lXdqNE8h2NVkGgMqFaL3tQXI+uR67hg5ukfdGO
   WR0xuEL7Rwoau6fvE8BTudbTXCiuvBI1F/zZ7LfKXp4PuvnM/d58DpMNn
   38b/8PA4BwDWpSXKEoZOF4ddwBo2YLJU+Y/RPfCl36+Jh9HxrKT6mbpgk
   9RxiO5TBvudFuvAJ7bJcWDY+TTlm8YTL/Zeu1pTPWCjKm4Ri8vmZh70M5
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="4372333"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="4372333"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 04:04:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="1012918245"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="1012918245"
Received: from mwevers-mobl1.ger.corp.intel.com (HELO [10.249.44.74]) ([10.249.44.74])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 04:04:28 -0800
Message-ID: <aec61f67-6b4f-49e6-b458-c332983a0ad6@linux.intel.com>
Date:   Fri, 17 Nov 2023 14:04:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: SOF: icp3-dtrace: Fix wrong kfree() usage
Content-Language: en-US
To:     Kamil Duljas <kamil.duljas@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        Jaroslav Kysela <perex@perex.cz>,
        Cezary Rojewski <cezary.rojewski@intel.com>,
        =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?= 
        <amadeuszx.slawinski@linux.intel.com>,
        sound-open-firmware@alsa-project.org
References: <20231116220102.2097-2-kamil.duljas@gmail.com>
From:   =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20231116220102.2097-2-kamil.duljas@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-sound.vger.kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org



On 17/11/2023 00:01, Kamil Duljas wrote:
> trace_filter_parse() allocs memory for *out and when
> -ENOMEM is returned, caller function, dfsentry_trace_filter_write()
> trying to freed this memory.
> 
> After this patch, the memory is freed in trace_filter_parse()
> before -EINVAL returned. In caller function removed kfree(elms)
> from error label

I think the original code was cleaner:
the elems is always freed up in dfsentry_trace_filter_write() in one place.
kfree(NULL); is not an error, it is handled correctly

> 
> Signed-off-by: Kamil Duljas <kamil.duljas@gmail.com>
> ---
>  sound/soc/sof/ipc3-dtrace.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/sof/ipc3-dtrace.c b/sound/soc/sof/ipc3-dtrace.c
> index 0dca139322f3..93b189c2d2ee 100644
> --- a/sound/soc/sof/ipc3-dtrace.c
> +++ b/sound/soc/sof/ipc3-dtrace.c
> @@ -137,6 +137,7 @@ static int trace_filter_parse(struct snd_sof_dev *sdev, char *string,
>  			dev_err(sdev->dev,
>  				"Parsing filter entry '%s' failed with %d\n",
>  				entry, entry_len);
> +			kfree(*out);
>  			return -EINVAL;
>  		}
>  	}
> @@ -208,13 +209,13 @@ static ssize_t dfsentry_trace_filter_write(struct file *file, const char __user
>  		ret = ipc3_trace_update_filter(sdev, num_elems, elems);
>  		if (ret < 0) {
>  			dev_err(sdev->dev, "Filter update failed: %d\n", ret);
> +			kfree(elems);
>  			goto error;
>  		}
>  	}
>  	ret = count;
>  error:
>  	kfree(string);
> -	kfree(elems);
>  	return ret;
>  }
>  

-- 
Péter
