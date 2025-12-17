Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E481E382597;
	Wed, 17 Dec 2025 13:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765979623; cv=none; b=K+bEj/XSJL2UAC5K7ho7SjQHa82LR6W0Br08n5CJ/z4icxjyBSMoVoe0CROdsrlvyxmdHJ0WSG3OqSbt3c+moQhDfBeY0Haq6z4Pe9ch/MVi8opYfWDeCLtpr3+jtuAWIa4NDLyfosYomcyKhdDVqTlBYlliE0NJQho8tRhQFME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765979623; c=relaxed/simple;
	bh=NVjf91t4Rs/0yB4NhNZMBhXn2WCMXLHfAaAPu+dqKAk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dAzLJFoxZ5xo8aMemO7SBr1a6aqSlBQ9Do36EKiyE3N1LKPxg86iTd6/Ha767hEzlXM5zWt0WU2glhEbprZG5jwxOGnCz+qiGjXkXt6EY6XsQvEJMREwtL3kaWtjdkG8rwIOvUMuA2VBfiDqDcH4mmrDe17aSk2cVBTN7+6FZUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m8l2GGo6; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m8l2GGo6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765979620; x=1797515620;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=NVjf91t4Rs/0yB4NhNZMBhXn2WCMXLHfAaAPu+dqKAk=;
  b=m8l2GGo6pjjxpx44kI/tnl3GD8njxiq0OED8m1FF4aIK+ptcSII2oSDX
   5krYxiER2n/03DVTYhi9V7DsfrU2vQCZjm8nxzFs/sL7xMcqmUOruvTUy
   PZA2T/cZAsZEMLNYO4PTEJKKbJgvQuuOhtINVWOm0fmuw649zeuL0vYs2
   2COcQ1ZsCA2yaVmn4f3Neo9vfIsCJATKB4vIZhnAnjfKppaUo5nXPm8MV
   R7jZogZZVz2vEXZq2NFhWvXmffwv6K8Du5Ye4JnlPok/RzX5hz8/haUS4
   cf5st8353Vj6B7hxFS/3fo5IahXazIUpZElMGZ7gzbcLJZEx1o3gNKcXz
   g==;
X-CSE-ConnectionGUID: B/30D5lzRi2e1Gt0Wacxhw==
X-CSE-MsgGUID: bIpGhzQ8TICl+qxQsl5PCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="78554452"
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="78554452"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 05:53:37 -0800
X-CSE-ConnectionGUID: zA49VDS6THOFxuXuK0HMoQ==
X-CSE-MsgGUID: +7RcgRq+R+mgL1jgVPZz9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="197927791"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.246.187]) ([10.245.246.187])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 05:53:35 -0800
Message-ID: <a9d2fadb-30a6-4ef6-8a38-7876e51ca629@linux.intel.com>
Date: Wed, 17 Dec 2025 15:54:01 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ASoC: ops: fix snd_soc_get_volsw for sx controls
To: Stefan Binding <sbinding@opensource.cirrus.com>,
 Mark Brown <broonie@kernel.org>
Cc: Niranjan H Y <niranjan.hy@ti.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
 Charles Keepax <ckeepax@opensource.cirrus.com>
References: <20251216134938.788625-1-sbinding@opensource.cirrus.com>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Content-Language: en-US
In-Reply-To: <20251216134938.788625-1-sbinding@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 16/12/2025 15:49, Stefan Binding wrote:
> SX controls are currently broken, since the clamp introduced in
> commit a0ce874cfaaa ("ASoC: ops: improve snd_soc_get_volsw") does not
> handle SX controls, for example where the min value in the clamp is
> greater than the max value in the clamp.
> 
> Add clamp parameter to prevent clamping in SX controls.
> The nature of SX controls mean that it wraps around 0, with a variable
> number of bits, therefore clamping the value becomes complicated and
> prone to error.
> 
> Fixes 35 kunit tests for soc_ops_test_access.
> 
> Fixes: a0ce874cfaaa ("ASoC: ops: improve snd_soc_get_volsw")
> 
> Co-developed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>

Tested-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

> ---
>  sound/soc/soc-ops.c | 32 ++++++++++++++++++++------------
>  1 file changed, 20 insertions(+), 12 deletions(-)
> 
> diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
> index ce86978c158d..624e9269fc25 100644
> --- a/sound/soc/soc-ops.c
> +++ b/sound/soc/soc-ops.c
> @@ -111,7 +111,8 @@ int snd_soc_put_enum_double(struct snd_kcontrol *kcontrol,
>  EXPORT_SYMBOL_GPL(snd_soc_put_enum_double);
>  
>  static int sdca_soc_q78_reg_to_ctl(struct soc_mixer_control *mc, unsigned int reg_val,
> -				unsigned int mask, unsigned int shift, int max)
> +				   unsigned int mask, unsigned int shift, int max,
> +				   bool sx)
>  {
>  	int val = reg_val;
>  
> @@ -141,20 +142,26 @@ static unsigned int sdca_soc_q78_ctl_to_reg(struct soc_mixer_control *mc, int va
>  }
>  
>  static int soc_mixer_reg_to_ctl(struct soc_mixer_control *mc, unsigned int reg_val,
> -				unsigned int mask, unsigned int shift, int max)
> +				unsigned int mask, unsigned int shift, int max,
> +				bool sx)
>  {
>  	int val = (reg_val >> shift) & mask;
>  
>  	if (mc->sign_bit)
>  		val = sign_extend32(val, mc->sign_bit);
>  
> -	val = clamp(val, mc->min, mc->max);
> -	val -= mc->min;
> +	if (sx) {
> +		val -= mc->min; // SX controls intentionally can overflow here
> +		val = min_t(unsigned int, val & mask, max);
> +	} else {
> +		val = clamp(val, mc->min, mc->max);
> +		val -= mc->min;
> +	}
>  
>  	if (mc->invert)
>  		val = max - val;
>  
> -	return val & mask;
> +	return val;
>  }
>  
>  static unsigned int soc_mixer_ctl_to_reg(struct soc_mixer_control *mc, int val,
> @@ -280,9 +287,10 @@ static int soc_put_volsw(struct snd_kcontrol *kcontrol,
>  
>  static int soc_get_volsw(struct snd_kcontrol *kcontrol,
>  			 struct snd_ctl_elem_value *ucontrol,
> -			 struct soc_mixer_control *mc, int mask, int max)
> +			 struct soc_mixer_control *mc, int mask, int max, bool sx)
>  {
> -	int (*reg_to_ctl)(struct soc_mixer_control *, unsigned int, unsigned int, unsigned int, int);
> +	int (*reg_to_ctl)(struct soc_mixer_control *, unsigned int, unsigned int,
> +			  unsigned int, int, bool);
>  	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
>  	unsigned int reg_val;
>  	int val;
> @@ -293,16 +301,16 @@ static int soc_get_volsw(struct snd_kcontrol *kcontrol,
>  		reg_to_ctl = soc_mixer_reg_to_ctl;
>  
>  	reg_val = snd_soc_component_read(component, mc->reg);
> -	val = reg_to_ctl(mc, reg_val, mask, mc->shift, max);
> +	val = reg_to_ctl(mc, reg_val, mask, mc->shift, max, sx);
>  
>  	ucontrol->value.integer.value[0] = val;
>  
>  	if (snd_soc_volsw_is_stereo(mc)) {
>  		if (mc->reg == mc->rreg) {
> -			val = reg_to_ctl(mc, reg_val, mask, mc->rshift, max);
> +			val = reg_to_ctl(mc, reg_val, mask, mc->rshift, max, sx);
>  		} else {
>  			reg_val = snd_soc_component_read(component, mc->rreg);
> -			val = reg_to_ctl(mc, reg_val, mask, mc->shift, max);
> +			val = reg_to_ctl(mc, reg_val, mask, mc->shift, max, sx);
>  		}
>  
>  		ucontrol->value.integer.value[1] = val;
> @@ -371,7 +379,7 @@ int snd_soc_get_volsw(struct snd_kcontrol *kcontrol,
>  		(struct soc_mixer_control *)kcontrol->private_value;
>  	unsigned int mask = soc_mixer_mask(mc);
>  
> -	return soc_get_volsw(kcontrol, ucontrol, mc, mask, mc->max - mc->min);
> +	return soc_get_volsw(kcontrol, ucontrol, mc, mask, mc->max - mc->min, false);
>  }
>  EXPORT_SYMBOL_GPL(snd_soc_get_volsw);
>  
> @@ -413,7 +421,7 @@ int snd_soc_get_volsw_sx(struct snd_kcontrol *kcontrol,
>  		(struct soc_mixer_control *)kcontrol->private_value;
>  	unsigned int mask = soc_mixer_sx_mask(mc);
>  
> -	return soc_get_volsw(kcontrol, ucontrol, mc, mask, mc->max);
> +	return soc_get_volsw(kcontrol, ucontrol, mc, mask, mc->max, true);
>  }
>  EXPORT_SYMBOL_GPL(snd_soc_get_volsw_sx);
>  

-- 
Péter

