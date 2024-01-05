Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDCF2E3EC
	for <linux-sound@vger.kernel.org>; Fri,  5 Jan 2024 14:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lfRfRlBz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704466796; x=1736002796;
  h=message-id:date:mime-version:subject:from:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=59sdOAEezpYYlX6VZ1CBkJMWRbg+MYpHnYACm4VZvhM=;
  b=lfRfRlBzDcD3/Ek6cmhhbk0brtvwxCB2+rq9gbQuGdVh0FORfPAs0ief
   gISX/h76l8MZe3r/2L96G2xYNSXYDlkY7zYxJOHb5y7uLQQ5WKW24s55h
   vAjN/TCWbK7oVdVT3LA+ViHhPO6DpxSTBjUCKiW8wD66IZaYcs3e8ovYR
   zoYahqj+aH4PjBnhHMTBGOFPLzm6Sz/1VbIs278O6MBBqavI6dIqY0ixo
   n4e2keJbYiHkjJhxGwDicZ8hJQqZQEXRy4UB+QdnB56VGnqj4zHLJPQZn
   KHcZTt1KwEvCwvFfftT8HfvC6DYSSZ80H0jYNT5wAJZdII0t+HBZe3XiU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10944"; a="4887388"
X-IronPort-AV: E=Sophos;i="6.04,334,1695711600"; 
   d="scan'208";a="4887388"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2024 06:59:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,334,1695711600"; 
   d="scan'208";a="29137834"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO [10.251.211.30]) ([10.251.211.30])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2024 06:59:53 -0800
Message-ID: <d0afac78-c983-44c3-82f1-064033d4c07d@linux.intel.com>
Date: Fri, 5 Jan 2024 17:00:47 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "ASoC: SOF: icp3-dtrace: Fix wrong kfree() usage"
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org, kamil.duljas@gmail.com
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel..com
References: <20231214072954.3963-1-peter.ujfalusi@linux.intel.com>
In-Reply-To: <20231214072954.3963-1-peter.ujfalusi@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Mark,

On 14/12/2023 09:29, Peter Ujfalusi wrote:
> This reverts commit 8c91ca76f44804868d12aed20ebdbc2f89aa7d60.
> 
> The offending patch introduces memory leak when there is no error, the
> memory allocated for the temporary storage is not freed up.
> 
> As I have commented, the original code was correct and cleaner to
> follow but it was not obvious from the patch that it will introduce
> regression.

Sorry to dump this, but can you take a look and pick this up?
We are leaking memory in linux-next because of this.

Thanks,
Péter

> Link: https://lore.kernel.org/all/aec61f67-6b4f-49e6-b458-c332983a0ad6@linux.intel.com/
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> ---
>  sound/soc/sof/ipc3-dtrace.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/sound/soc/sof/ipc3-dtrace.c b/sound/soc/sof/ipc3-dtrace.c
> index 93b189c2d2ee..0dca139322f3 100644
> --- a/sound/soc/sof/ipc3-dtrace.c
> +++ b/sound/soc/sof/ipc3-dtrace.c
> @@ -137,7 +137,6 @@ static int trace_filter_parse(struct snd_sof_dev *sdev, char *string,
>  			dev_err(sdev->dev,
>  				"Parsing filter entry '%s' failed with %d\n",
>  				entry, entry_len);
> -			kfree(*out);
>  			return -EINVAL;
>  		}
>  	}
> @@ -209,13 +208,13 @@ static ssize_t dfsentry_trace_filter_write(struct file *file, const char __user
>  		ret = ipc3_trace_update_filter(sdev, num_elems, elems);
>  		if (ret < 0) {
>  			dev_err(sdev->dev, "Filter update failed: %d\n", ret);
> -			kfree(elems);
>  			goto error;
>  		}
>  	}
>  	ret = count;
>  error:
>  	kfree(string);
> +	kfree(elems);
>  	return ret;
>  }
>  

