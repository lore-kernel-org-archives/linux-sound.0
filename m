Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACAE94653A
	for <linux-sound@vger.kernel.org>; Mon,  4 Mar 2024 19:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709580842; cv=none; b=S81s/ngHswtYBwlm5PG42/PtdFr8bG6R18XWHEYYzWuiKgf0tWWWg8b54UxnzUZ31sGBorcGvlJgy7KqIPfn4X7mUt0TW9AXtZ4yTEARuLBsB+EpfXvigEYshnfVePyk/U2kcWx8aSiUQAg+XTOhksNZawBoCN/8qk2jiyqHg8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709580842; c=relaxed/simple;
	bh=TADBIj/jiKk87U5tou9hMcyNKNqVzZSGuG8xZJPtMNQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hhUMRC1ZFBsUcaUIgKhD4FZdHycH3KbxZODI/OYjeYcq4X/pE2WJqIA66DhW0Y67s7mfy5uipcloOgiEkLxxaIui1xMHAd0bAveGdmoKdh8fRYvKx5wq0c+UUItPex1RRrrmfz9xcTi7AFyL8FSBRy3Q65Om6Ufyv/gse53blCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OwrLx/bP; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OwrLx/bP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709580841; x=1741116841;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=TADBIj/jiKk87U5tou9hMcyNKNqVzZSGuG8xZJPtMNQ=;
  b=OwrLx/bPIOIPQRKckOFg0WWduGg6e5jskQov/tEY8dEi19W4i5yURqpD
   sivWgpPer2R646guUVos9JvOKRjl4v6rQzLD+w2C9UTOLs18j6enWU0Yc
   Jn8KhLpwD2bQvehvS7NqtzxgcXnck9f4xFwZRcLLt7hBP6ydK/S43XAuw
   OdZ5xyRDTh278+iF2vKkrOv/+pvnypooq8AVia/Xc2LdpxUtvupbx+Xq2
   t4RZDgKfzwugRivMKIHgYlQn2xwMzjn6Xx8hc0vEZNi/lw/3jQisCy+Vc
   6H1KbcvFxHml2vGFiNKFvF/jn4jE62ypxkvVS/qQ45VC1t7sVmFDOELsy
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="15500699"
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="15500699"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 11:33:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="13599735"
Received: from cryoung-mobl2.amr.corp.intel.com (HELO [10.212.71.160]) ([10.212.71.160])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 11:33:57 -0800
Message-ID: <14a2f9b8-7711-47c4-9f57-bd839c700d4e@linux.intel.com>
Date: Mon, 4 Mar 2024 13:32:36 -0600
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] ASoC: topology: Do not ignore route checks when
 parsing graphs
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, broonie@kernel.org
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, tiwai@suse.com,
 perex@perex.cz, amadeuszx.slawinski@linux.intel.com, hdegoede@redhat.com
References: <20240304190536.1783332-1-cezary.rojewski@intel.com>
 <20240304190536.1783332-3-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240304190536.1783332-3-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/4/24 13:05, Cezary Rojewski wrote:
> One of the framework responsibilities is to ensure that the enumerated
> DPCMs are valid i.e.: a valid BE is connected to a valid FE DAI. While
> the are checks in soc-core.c and soc-pcm.c that verify this, a component
> driver may attempt to workaround this by loading an invalid graph
> through the topology file.
> 
> Be strict and fail topology loading when invalid graph is encountered.

This is very invasive, it's perfectly possible that we have a number of
'broken' topologies where one path is 'invalid' but it doesn't impact
functionality.

This should be an opt-in behavior IMHO, not a blanket change.

> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
>  sound/soc/soc-topology.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
> index d6d368837235..778f539d9ff5 100644
> --- a/sound/soc/soc-topology.c
> +++ b/sound/soc/soc-topology.c
> @@ -1083,8 +1083,9 @@ static int soc_tplg_dapm_graph_elems_load(struct soc_tplg *tplg,
>  			break;
>  		}
>  
> -		/* add route, but keep going if some fail */
> -		snd_soc_dapm_add_routes(dapm, route, 1);
> +		ret = snd_soc_dapm_add_routes(dapm, route, 1);
> +		if (ret && !dapm->card->disable_route_checks)
> +			break;
>  	}
>  
>  	return ret;
