Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3601F12EBD6
	for <linux-sound@vger.kernel.org>; Thu, 13 Jun 2024 05:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718258302; cv=none; b=bAZ6HJEE6kA5pkbzpyGlKnaEVAcKXUSPqaYNfU6WdXYUXq7jKL1lb3PY17kBiv3JcD/1myTJmECVXua6u9Vc/VcFak86pWWU11X9KSYyvk948I13BC+v6PkUnBT28FZeIiC5+Wpr8bWHtH6OwP7tYk9mC2++cktSMcT31qqIgxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718258302; c=relaxed/simple;
	bh=jA+p+c2oxMuJwrkeiL5Elamxl7w5DxZPj3FunEj/30I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BXL2gXvYcflv8Q+5DeTzeCkXqsZcwda9sh6efsAZRmvGkF0QZvWo0K31j1ZkuqiH+FIxcvsuRIWaWFdO+Wg6aeOk70xpjay4i4ZUTUlf++mCTvEJY4JR/DDbMhrxpX6QZbtsFcgyda66eXMTwjTHR16QVVfSEEbgAXYb5PO3bUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UazqrjMd; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UazqrjMd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718258301; x=1749794301;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=jA+p+c2oxMuJwrkeiL5Elamxl7w5DxZPj3FunEj/30I=;
  b=UazqrjMdhzGeboNamrpaSUvJ1NwNmhZ9Vecp91aimATK8OktbA83gWwB
   qgUA5pIC9Dn7804x9bhn1/zv1b9geinAd+yWncNOwJy9SP6Ldu3AqljcJ
   kpgMzl7n6VE7SPgDFok9wAmMAsfb1h2EveH444rkCTSSrSCZbHuf7PkPQ
   t70+mZnh95PuShISLU6Eo4JZvh3wOLbGWBeYdcxG5SN4BOJQ37VTcwuH6
   ppoXIhqElSG9uWATejx80auCmTe59mzh8qNe2yHTYseFWasY5OsufP8u8
   vlLePEd5hTZFHHSZYKj07DQXbsYI2SnUii2JarBPtHQgZVht8M0RfghA4
   g==;
X-CSE-ConnectionGUID: cGyKe3IfTZ6aeKjnsgcHig==
X-CSE-MsgGUID: xNjwdtTCRkC28URm9VZqTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="15209747"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="15209747"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 22:58:21 -0700
X-CSE-ConnectionGUID: Zcd9rqi0SdK20b0RSg7x4w==
X-CSE-MsgGUID: nYuz97NVQGavObsJQDCE8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="77480061"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO [10.245.246.108]) ([10.245.246.108])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 22:58:18 -0700
Message-ID: <507e9f6a-7113-4781-8a6d-27e4b87dbe24@linux.intel.com>
Date: Thu, 13 Jun 2024 07:58:15 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] ASoC: topology: Fix references to freed memory
To: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 Jason Montleon <jmontleo@redhat.com>
References: <20240603102818.36165-1-amadeuszx.slawinski@linux.intel.com>
 <20240603102818.36165-2-amadeuszx.slawinski@linux.intel.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240603102818.36165-2-amadeuszx.slawinski@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 6/3/24 12:28, Amadeusz Sławiński wrote:
> Most users after parsing a topology file, release memory used by it, so
> having pointer references directly into topology file contents is wrong.
> Use devm_kmemdup(), to allocate memory as needed.
> 
> Reported-by: Jason Montleon <jmontleo@redhat.com>
> Link: https://github.com/thesofproject/avs-topology-xml/issues/22#issuecomment-2127892605
> Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
> Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
> ---

This patch breaks the Intel SOF CI in spectacular ways, with the widgets
names completely garbled with noise such as

host-copier.5.playbackpid.socket
host-copier.5.playbackrt@linux.intel.com>
dai-copier.HDA.iDisp3.playbackrun_t:s0
host-copier.31.playback\xff`\x86\xba\x034\x89\xff\xff@N\x83\xb83\x89\xff\xff\x10\x84\xe9\x8b\xff\xff\xff\xffS\x81ی\xff\xff\xff\xff\x0f

https://github.com/thesofproject/linux/pull/5057#issuecomment-2164470192

I am going to revert this patchset in the SOF tree.

>  sound/soc/soc-topology.c | 27 ++++++++++++++++++++++-----
>  1 file changed, 22 insertions(+), 5 deletions(-)
> 
> diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
> index 90ca37e008b32..75d9395a18ed4 100644
> --- a/sound/soc/soc-topology.c
> +++ b/sound/soc/soc-topology.c
> @@ -1060,15 +1060,32 @@ static int soc_tplg_dapm_graph_elems_load(struct soc_tplg *tplg,
>  			break;
>  		}
>  
> -		route->source = elem->source;
> -		route->sink = elem->sink;
> +		route->source = devm_kmemdup(tplg->dev, elem->source,
> +					     min(strlen(elem->source),
> +						 SNDRV_CTL_ELEM_ID_NAME_MAXLEN),
> +					     GFP_KERNEL);
> +		route->sink = devm_kmemdup(tplg->dev, elem->sink,
> +					   min(strlen(elem->sink), SNDRV_CTL_ELEM_ID_NAME_MAXLEN),
> +					   GFP_KERNEL);
> +		if (!route->source || !route->sink) {
> +			ret = -ENOMEM;
> +			break;
> +		}
>  
>  		/* set to NULL atm for tplg users */
>  		route->connected = NULL;
> -		if (strnlen(elem->control, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) == 0)
> +		if (strnlen(elem->control, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) == 0) {
>  			route->control = NULL;
> -		else
> -			route->control = elem->control;
> +		} else {
> +			route->control = devm_kmemdup(tplg->dev, elem->control,
> +						      min(strlen(elem->control),
> +							  SNDRV_CTL_ELEM_ID_NAME_MAXLEN),
> +						      GFP_KERNEL);
> +			if (!route->control) {
> +				ret = -ENOMEM;
> +				break;
> +			}
> +		}
>  
>  		/* add route dobj to dobj_list */
>  		route->dobj.type = SND_SOC_DOBJ_GRAPH;

97ab304ecd95c0b1703ff8c8c3956dc6e2afe8e1 is the first bad commit
commit 97ab304ecd95c0b1703ff8c8c3956dc6e2afe8e1
Author: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Date:   Mon Jun 3 12:28:15 2024 +0200

    ASoC: topology: Fix references to freed memory

    Most users after parsing a topology file, release memory used by it, so
    having pointer references directly into topology file contents is wrong.
    Use devm_kmemdup(), to allocate memory as needed.

    Reported-by: Jason Montleon <jmontleo@redhat.com>
    Link:
https://github.com/thesofproject/avs-topology-xml/issues/22#issuecomment-2127892605
    Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
    Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
    Link:
https://lore.kernel.org/r/20240603102818.36165-2-amadeuszx.slawinski@linux.intel.com
    Signed-off-by: Mark Brown <broonie@kernel.org>

 sound/soc/soc-topology.c | 27 ++++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

