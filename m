Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249DF29BD82
	for <linux-sound@vger.kernel.org>; Thu, 23 Apr 2026 05:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776920738; cv=none; b=QMXRMSOpMEpCE1Rv9snjnkPnm02wjaKKQCCALLsgkFpal/ZjLKe94GAuYsxUQD4/lwT9PsfcGCpP38kVso+PFP7w2qrK+W9JRCgw+rMXMC3j22kAgWpSu4sPH9W/w+ucwroK1VmkebsulPgtOerJX6rbtkxsrGwEYlsl5yTJfPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776920738; c=relaxed/simple;
	bh=XbNo9ez4QCom4Wza0xYVSYZJHZPha+NYGVoo0OJkRvU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=NE04XQYX+i9wpn+cDO3NMGIX990Ktk+5PYYx4wn0Pnrfc+QKPT45Jk6v4H8PNuZie9sYGbp3H3kUExPXitI1+W1+RGoMIXqFjVCbH8ETjgslwYz1mRZbSUHIQj7w2r07vuP4CKJtSgluVtBAm9IcLbrHB26bs00WFB3ons2Ng8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CPgM0Uwp; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CPgM0Uwp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776920737; x=1808456737;
  h=message-id:date:mime-version:subject:from:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=XbNo9ez4QCom4Wza0xYVSYZJHZPha+NYGVoo0OJkRvU=;
  b=CPgM0Uwpol/HSQqyg1WHvY3Ob0s9OfDhJz5/0bw597HN3NLUJPppYZF9
   /TfKAaN3c8buainFjUeoU0RcUhRwYMZ4kK4Bcz8lPcJtGoV6hDfGTfdsa
   bi3G9sm97+PUf1QOgROVWjgfs1yPWRC/NvP3x0bbFoPEnxQikkdV/7N8L
   EXj+qhpKqAiDw3RmmLn69WA34x+DYrYxZsS9kQ942VdqmcfmwMnm51v2e
   i4SR6Tm1NDqH4zXO12/+ZtnVgeaRuEZla22k70iefuTNMucFRKqCui5pT
   wGHjk2tCQ0aSqMDaULGxV3Rsz7M/R9vIi80Y9F8exgySocyk6pqE4BVRL
   g==;
X-CSE-ConnectionGUID: V1qjaXFFTvibeYagf25+Eg==
X-CSE-MsgGUID: yoihYLcfTBOvZi32UA8W7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="81745404"
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; 
   d="scan'208";a="81745404"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 22:05:36 -0700
X-CSE-ConnectionGUID: FXcxBodXRfa426+jizs9gA==
X-CSE-MsgGUID: bLmGRteXRJW8p6tFqPjhVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; 
   d="scan'208";a="256035501"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO [10.245.244.105]) ([10.245.244.105])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 22:05:34 -0700
Message-ID: <463d844b-ef44-471a-8749-6bb068833c4a@linux.intel.com>
Date: Thu, 23 Apr 2026 08:05:30 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (re)use and (re)definition of snd_pcm_hw_params->fifo_size for
 'jumpy DMA'
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, arun@asymptotic.io,
 wim.taymans@gmail.com
References: <a03350b3-5828-4ffe-ade7-b94bb6ec7d64@linux.intel.com>
 <87se9htms4.wl-tiwai@suse.de>
 <67b9f48b-1cc7-4dac-8f6a-c0cba6a84b36@linux.intel.com>
 <87ikadtgpe.wl-tiwai@suse.de>
 <dadef18b-1c2e-4c0d-8ae8-2e4b8ad75d04@linux.intel.com>
 <878qb8tsib.wl-tiwai@suse.de> <88979231-caef-4eaa-b89d-22e6973c92f9@perex.cz>
 <cfb84df3-c2bf-4173-bc45-7df29b6a94a3@linux.intel.com>
 <a1b6b2ed-2e26-48ff-afab-60f90ecc4360@perex.cz>
 <4c73e4cb-298a-411a-97ed-f0eff1b06ac9@linux.intel.com>
 <978bdc67-b91e-437a-bb8a-b609a4fef6d1@perex.cz>
 <b97ae6b9-ef72-4dbf-bf29-9092ec3919d8@linux.intel.com>
 <82d870b3-4ec1-440a-ae8b-87edbf665b99@perex.cz>
 <542a9743-2a47-477a-b457-ae32c3f8dc49@linux.intel.com>
 <39fcca55-77f4-4cd9-8a94-d80e5b94c8ba@perex.cz>
 <401a7777-e83c-4120-9d82-71388bf38397@linux.intel.com>
 <b9308972-1795-44c5-9263-ab9f88013215@perex.cz>
 <8af520bc-cb27-416a-b823-7a21f0784f89@linux.intel.com>
Content-Language: en-US
In-Reply-To: <8af520bc-cb27-416a-b823-7a21f0784f89@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 22/04/2026 17:19, Péter Ujfalusi wrote:

> Hrm, so this is a driver scoped refine, right? Based on the requested
> period size and a flag (SNDRV_PCM_HW_PARAMS_LATENCY_AWARE?) the driver
> refines the period size based on it's jumpyDMA capabilities?
> 
> But in this example the application will have no knowledge still how the
> DMA will move, the DMA will initially move 30ms and after that, every
> 5ms it moves 5ms, so the driver should be refining to 5ms period size, 6
> initial periods and 1 period step, no.
> 
> Or with my favorite examples:
> 4ms initial burst w/ 1ms steps will refine to 1ms periods, 4 init and 1
> step.
> 100ms initial burst w/ 96ms steps will refine to... I'm not sure

4ms period size, 25 init periods, 24 step periods?

and same for
> 40ms initial burst w/ 36ms steps.

4ms period size, 10 init periods, 9 step periods?

-- 
Péter

