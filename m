Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5279123BCF7
	for <linux-sound@vger.kernel.org>; Wed, 27 May 2026 05:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779859338; cv=none; b=RqaGwVpBiGMNUcylDQAB0YNV0WzWViZpVAd8jaicBCSy46upM2LsmEWQ6kA+8eOBlFK5pLUBxffS5g4R+G1xoji6C0xBuzSbBzK2dwrDSp34lkXSA9JH9zrNnlFfTfe4GLb+YFJG/YoMLvjONZTYqqEu8yS3rULZ1OhocAruv/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779859338; c=relaxed/simple;
	bh=cpfhREpSscSON1wP8rHFfXbu44DGxMPKCE88W1yMQRI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kyMR9IvQAhR6UeKTDeg2AWtTnKwj9oljnSuwKOMvLrZqY6apyltbcQSCg/QXA+bpkzGdGlcyy53ouu0JBPA9mQ2kkRjF68JcYnYvm/fYT4bJ6jheuIK91UA9ESLXg/sMCiniK1qj29FiUb3gqJNoDV0QvbE/urbUHc9jMYin16Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VMnVY/Rl; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VMnVY/Rl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779859337; x=1811395337;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=cpfhREpSscSON1wP8rHFfXbu44DGxMPKCE88W1yMQRI=;
  b=VMnVY/RlG8VrU5kYeUEK3Noe8oSrgXkY5DLETKegbNaa5etVqf/Ai0/R
   caxHkhZeiYL4AetJtl3+K9s/r1kDN5Ebf8DGLmxup3Npyh8zYu2QqyCnq
   he1W5XwtKyvL9KzEKIj/LlGF+0oC74PnEMqoP7lMEhiWNrZLm2lRCfaQH
   iQZmpbt23QWF9H0QYl4gJDsOtFeByxdcPIgaF0ATFj+Tt12mE17HcCUAg
   JfxtPAMVg+1/IX5PqwnN0Au4iQbw7AN9tgxlXDZfDQGxEq31iZ3FTwT6r
   okNcnAhMFeJa7cBbO3v5cAghdZqhp6gHRDaPvJAJAmQo5KvDcKFdi0xOt
   A==;
X-CSE-ConnectionGUID: Gq7SAeniQ4G8ivNShQS1Mw==
X-CSE-MsgGUID: UjWFiVKKRteddOav6wgJ2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="80665441"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="80665441"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 22:22:16 -0700
X-CSE-ConnectionGUID: qSY9UYiHSba/U05Fi5gGDw==
X-CSE-MsgGUID: /P5fK3DOTuyftczKEYSmTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="280252066"
Received: from zzombora-mobl1 (HELO [10.245.244.223]) ([10.245.244.223])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 22:22:14 -0700
Message-ID: <582f02ae-2171-4f21-b637-5fd8eeae4279@linux.intel.com>
Date: Wed, 27 May 2026 08:22:23 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: core: Move all users to deferrable card binding
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.com,
 perex@perex.cz, amade@asmblr.net, kuninori.morimoto.gx@renesas.com,
 linux-sound@vger.kernel.org, "Liao, Bard" <bard.liao@intel.com>,
 "Vehmanen, Kai" <kai.vehmanen@intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Simon Trimmer <simont@opensource.cirrus.com>
References: <20260430140752.766130-1-cezary.rojewski@intel.com>
 <01d1d642-bf24-4ef4-a30d-56884300407f@linux.intel.com>
 <5d8cbbfb-3884-4c6b-aea8-0c9a76964b3b@intel.com>
 <85045e51-e09b-44c2-9266-3e7ee72c4eb0@sirena.org.uk>
 <b5e82c43-9da1-4a12-af0e-90d4b9feef49@linux.intel.com>
 <d82fa24d-18f9-461d-8535-3266cc92fbb9@sirena.org.uk>
 <1daaad8d-8aee-4911-a24b-26db8b694cfd@linux.intel.com>
 <2497f30d-a14b-47d1-9b87-c892d21afdf3@sirena.org.uk>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Content-Language: en-US
In-Reply-To: <2497f30d-a14b-47d1-9b87-c892d21afdf3@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 26/05/2026 19:02, Mark Brown wrote:
>> I also think that detaching from driver defer and use internal card
>> defer is a much better approach, but when majority of new PTL designs
>> will be broken with no patch in sight to prepare the SDCA class stack is
>> a regression.
> 
> OK, sounds like a revert is needed for the time being.  Can you send a
> patch with a changelog explaining the issue please?

Bard iterated on my idea with a proper patch which works so far in our
testing:
https://github.com/thesofproject/linux/pull/5788/commits/415b0daa4dc2ae30f54d51abc841a97defe97c42

Basically the sof_sdw machine driver will defer if a component is
missing, which was done by the soc card before the deferable card move.
The sof_sdw needs to know the final name of the components, they don't
have fixed names due to how SDCA stack probes things based ont he ACPI
information.

We do think that this will work for now until we can figure out a leaner
way.
I was thinking of adding an optional card callback to be called from
snd_soc_bind_card() , probably called as .prepare_bind and sof_sdw could
at this point count and prepare the names of the known components.
Since the snd_soc_bind_card() is called for all component registration,
it could work similarly as the driver defer, but in the machine driver
we need to do much bigger changes to properly manage the devm_
allocations since the driver will never defer.

If you and Cezary are OK with the linked patch for now and the proposed
.prepare_bind callback to cards, then I think we can keep this patch
without fear of regressing users.

-- 
Péter

