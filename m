Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD763DD522
	for <linux-sound@vger.kernel.org>; Tue,  6 Oct 2026 09:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791280204; cv=none; b=IsQJYMU+uRhSstseMEEw8nU9ZSnh9ZYQNgCCwvoy2t8TyPVkaEZS6LjaV71TYraV5uLE6OoDdJwiq0tpG4Es5TVv6dH23501PBmUKL5I+82EwGV3xXOJ3fu3RDPVbJzWAzOd4flyEYjGfvirmfPZoCvRaioVlmrt4zqrQcNmzrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791280204; c=relaxed/simple;
	bh=UwJJWbLk0r29B8ij3Goxzqm9bDLgyHJZdkCDIFdjbxE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qqvhrh2sTt5fhKER6RxfBY9qO87vvgTYO5J4SEUxsud/vUs4FqzMf87mqUmQIBVXTZq7+KD1Ao4172JpNhPxM0T9uY52fEUFlsrKeiF40FERip2bRpFzuyTpfGq+a2w61G+QfmtGkPXkk2iejdghY0lp+COa3ZUPPnJ8rylxayY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LvmMuFeF; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LvmMuFeF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791280203; x=1822816203;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=UwJJWbLk0r29B8ij3Goxzqm9bDLgyHJZdkCDIFdjbxE=;
  b=LvmMuFeFw6bQpAfJgYb1PO2fJTbvf6ANQ7IHFyt/lHYon9vmsAlDKiEB
   xZPeNdTMgW/ZtdnI7mGhPIm5PTurw66Ypk6QK2LqLcvZla+5BDjzAHbW2
   GxV6oAzKvi0ZcK0CdFRdovPejBEeAxDNBLTEunQKehm1xDn05pnfUkFw7
   iRhKpmhF3FjnF8NWkwGDDHm9EsOTyAqKTK4OZiVot5/b9qPIqd7zriByo
   n2xERttYEz4cNruQEiVTgrdppKQ8QWwFu0zKI2KVc/YHwl3jnEboyh5qK
   qntcPsE3N07jkJd4dAyy+b9uKOIYu8abwZTjN/E88soCDZuajwHtTgWNS
   w==;
X-CSE-ConnectionGUID: oSYAU0ZMTouJo+8IfM5ATA==
X-CSE-MsgGUID: P9tnBOY/QYueH1j6PAQe1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="102542302"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="102542302"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 02:50:02 -0700
X-CSE-ConnectionGUID: 9Q0WY466Q1Wt+Cl2OZRpug==
X-CSE-MsgGUID: FRwoMy9iQTyvmjWFx+0quw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="277215743"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO [10.245.244.21]) ([10.245.244.21])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 02:49:59 -0700
Message-ID: <1104d890-a79f-40a1-adde-818fb1365e87@linux.intel.com>
Date: Tue, 6 Oct 2026 12:50:20 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/26] ASoC: soc-compress: Implement trigger FE-BE
 sequencing as with normal PCMs
To: Mark Brown <broonie@kernel.org>
Cc: vkoul@kernel.org, perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
 srinivas.kandagatla@oss.qualcomm.com, linux-sound@vger.kernel.org,
 kai.vehmanen@linux.intel.com, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.dev, daniel.baluta@nxp.com
References: <20260916120320.18318-1-peter.ujfalusi@linux.intel.com>
 <20260916120320.18318-6-peter.ujfalusi@linux.intel.com>
 <asS7ktuZo6z68chF@sirena.co.uk>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <asS7ktuZo6z68chF@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 06/10/2026 12:12, Mark Brown wrote:
> On Wed, Sep 16, 2026 at 03:02:59PM +0300, Peter Ujfalusi wrote:
>> The FE-BE trigger sequence should be dynamic, similarly how soc-pcm.c
>> dpcm_fe_dai_do_trigger() does it.
> 
>> -static int soc_compr_trigger_fe(struct snd_compr_stream *cstream, int cmd)
>> +static int soc_compr_trigger_fe_be(struct snd_compr_stream *cstream, int cmd,
>> +				   bool fe_first)
>>  {
> 
>> +	} else {
>> +		dev_dbg(fe->dev, "ASoC: post trigger FE %s cmd %d\n",
>> +			fe->dai_link->name, cmd);
>> +
>> +		ret = dpcm_be_dai_trigger(fe, cstream->direction, cmd);
>> +		if (ret < 0)
>> +			goto out;
>> +
>> +		ret = snd_soc_dai_compr_trigger(cpu_dai, cstream, cmd);
>> +		if (ret < 0)
>> +			goto out;
>> +
>> +		ret = snd_soc_component_compr_trigger(cstream, cmd);
>> +	}
> 
> Shouldn't we unwind the triggered front/back ends if a later one fails?

This mirrors dpcm_dai_trigger_fe_be() in soc-pcm.c, which does not
unwind either: it bails out on the first error and returns it. One level
down, dpcm_be_dai_trigger() only drops the be_start count of the BE that
failed and carries on with the remaining BEs, so already triggered BEs
are left as they are there as well.

The missing unwind on the FE side is not new, the code before this patch
had the same sequence (DAI trigger, then component trigger) with the
same early return.

What is new is the order: STOP/SUSPEND/PAUSE_PUSH now trigger the BEs
before the FE, so 'BEs triggered, FE trigger failed' is a case which did
not exist before this patch.

I can add the unwind, but I would rather do it for soc-pcm.c and
soc-compress.c in a separate patch so that the compressed path does not
diverge from the PCM one. It is not quite mechanical either: the command
needed to unwind depends on the failing command (STOP for a failed
START, PAUSE_PUSH for a failed PAUSE_RELEASE) and it has to deal with
the BE refcounts and the pause/stop transition handling.

Would it be OK if I send a followup series to cover both at the same time?

-- 
Péter

