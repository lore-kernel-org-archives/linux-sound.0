Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0359337160
	for <linux-sound@vger.kernel.org>; Mon, 27 Oct 2025 07:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761548829; cv=none; b=JRCviHkziLj4FFfNmMySk4Dh8z2lw0ZoHOVSSvwF5hrTfDuBaYV0fbxffrYrCynavjzMHpNMgu+vUsoQi1TRqRtswWTC1q5pwfD7XTN41En2VzACDfIW8IZ2wnLYRsTwmcl7L4ZjAgab0OYq/e5ExKk05qfgfRNV+FFvksfPALc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761548829; c=relaxed/simple;
	bh=SWB5tO2YDbM2goWLfoYgINAxF38OGbIWuJYObTWU3w8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lkeruke6HYlgloYp/Ow4rsQWnPEZPtvJAoBm7C4NFw4625Riem7GumIq1cJeMLLxnVqy7UxK373hfvkenXAzAdzTXuxIZzTV8YBFuuIcHDP/KM2v25dmIpw0rApJ4TFgVb7lYkO17JNZ/jgXGv/W41+8EYm7s+uoY104Cat3HfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n+Ee4Jtu; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n+Ee4Jtu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761548827; x=1793084827;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=SWB5tO2YDbM2goWLfoYgINAxF38OGbIWuJYObTWU3w8=;
  b=n+Ee4Jtujwzaoc1wOf+9XhrkXkRbc9Lsmjb/9n96Ys8vyjsdo9M8NjLa
   rZS6Z1Kr/zWT3oBKbUYOU6IpAZWQWP+SJ0tKXj+DA3RgyVNVQ5YbDFICJ
   DFO8RhotHMS72rRARVEFmlU+Zap5mlv/jpNgnpp6rhsPTldKDHBiohczg
   jMguAm7wEyHeNd9w4QhsDLIFQhHkKrqNadG/vk1m3/L/4HGXLUlAtLNBT
   wvJ+LZKH/qL6gLML6iltcSMY8aZlbbf48zR4m/ZASbAxPJX2s54B3IR5q
   JOM1dBrWUZYf7B2HifRX975wOZ08gI/EC/z/p5ikcVr1Po5nGeCicrWNl
   g==;
X-CSE-ConnectionGUID: 1ZvmmVqiRzSfUs//T6EBsg==
X-CSE-MsgGUID: bPLoF8qMT2qFnTtkb0V8pQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67488133"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="67488133"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 00:07:05 -0700
X-CSE-ConnectionGUID: bvJnUVZpQQSghQ9r12K4Fw==
X-CSE-MsgGUID: RXKAb3ZnR12/oq85anUmIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="184868544"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO [10.245.246.27]) ([10.245.246.27])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 00:07:03 -0700
Message-ID: <198b0f78-da46-4895-8f38-dc1aa398bfc2@linux.intel.com>
Date: Mon, 27 Oct 2025 09:07:11 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: soc-pcm: Preserve hw parameters from components in
 dpcm_runtime_setup_fe
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, linux-sound@vger.kernel.org,
 kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com,
 yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
 shengjiu.wang@nxp.com
References: <20251023081404.3740-1-peter.ujfalusi@linux.intel.com>
 <87pla8oowa.wl-kuninori.morimoto.gx@renesas.com>
 <25cbc999-bb13-453f-8210-c0fd38866d2d@linux.intel.com>
 <87ms5comw9.wl-kuninori.morimoto.gx@renesas.com>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Content-Language: en-US
In-Reply-To: <87ms5comw9.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Morimoto-san,

On 27/10/2025 08:54, Kuninori Morimoto wrote:
> 
> Hi Péter
> 
> Thank you for your feedback
> 
>> This is how the RFC was done, but decided to not modify
>> soc_pcm_hw_init() with an added bool.
>> Other option would be to add a new function which would do only
>> conditional initialization.
> 
> Yes, I have noticed about this RFC, and you used other metod
> 083a25b18d6a.

I,m not sure what 083a25b18d6a is.

>> This way we would loose the rate_min, channel_min from components, see
>> my RFC which covers this, but it is using reverse condition (preserve vs
>> force).
>> The force boolean might be better than the preserve_config as parameter
>> if the preference is to modify the soc_pcm_hw_init()
> 
> I guess you can ignore setup xx_min if "force" was set ?

Yes, in a same way as it was done in RFC under the preserve_config case.

> Thank you for your help !!
> 
> Best regards
> ---
> Kuninori Morimoto
> 

-- 
Péter

