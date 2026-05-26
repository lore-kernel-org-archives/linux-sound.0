Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725EE3D4117
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 09:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779787011; cv=none; b=fvp9wYsCaHLwoG/1EMSQ8qvLyKWQEexKSSM2FWqu5XgUKhUCR/hrnWGB9yuk3M+CMyBXhaP/q7JadRQHZX7e7wt+Om5pfr+squ/OWQDdu/G5rBbgp7mCXU7lELRvE7iFJY+S0bpd3UcC8OYYSBKV6tKPc8GnNYH7MvHlhK9DjAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779787011; c=relaxed/simple;
	bh=UmeTpyfX7Yw6vkq03gUaapaVSsgzpXaj8rKSV1xzga0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y0zgXhtzKkhC1/8LcpSRg1fSqhj+pq8Qa6q8MDhQ8lD6LrCtcB8wIopqI3nGmwRL8zliw2O8AqlHvZx+6xK8g1I2rqDQo28F2Bc4QkpgtHUDFrAdTnpjW57+SyKRYLIRFyOwmZViQdqva1ptNfcCUu0ocNqFrsvEtwSYT5AAygg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JBVE8w+f; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JBVE8w+f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779787007; x=1811323007;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=UmeTpyfX7Yw6vkq03gUaapaVSsgzpXaj8rKSV1xzga0=;
  b=JBVE8w+feWNL6DaXRdAuS3FlZn6oxf8Wwutuc6O40LqGOxROoL+U4CdX
   6suvyF3A9h1jLfESgVjEQwQY0UuKfnDC3kl5ZfddelKyMQmegl7igqGBh
   fbI+tPd6EXFXU9NayGe8HOspGUkK3nFy9EpAr5rMGahplwtHn+6+Zm4AD
   cG+Yl6nA4XBmB68UfVZzi4M+nFiE5MiW90708UOgjF4uyMjtWD7d1IJLN
   NiTx9XXqgxTh5a2J8BCeLJ2AWI92ygMZwvdWz2B30nsH3M1AazA8Uzc0V
   +dcM6hFiesZe/j2uZnmPWLIHBdF8zNchk6gvvq+8ZGkGk8cEgZ/AisI4r
   w==;
X-CSE-ConnectionGUID: 9ns+SvKVTgqSgarR0vx0pg==
X-CSE-MsgGUID: Pqgg9KHfS++SRRYTRulZSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80628396"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="80628396"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 02:16:44 -0700
X-CSE-ConnectionGUID: IdNHexm/SYSnOX06KfkiAg==
X-CSE-MsgGUID: v6mhpgc5RFSxsuOHSM630w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="265720983"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO [10.245.244.49]) ([10.245.244.49])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 02:16:42 -0700
Message-ID: <4062f56e-f2f6-4697-849a-06ea0b2e6640@linux.intel.com>
Date: Tue, 26 May 2026 12:16:53 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: SOF: ipc4-topology: Allow the use of multiple
 formats for src output
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org,
 kai.vehmanen@linux.intel.com, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.dev, seppo.ingalsuo@linux.intel.com
References: <20260520150149.18250-1-peter.ujfalusi@linux.intel.com>
 <46d71e73-e491-4d3d-aaf5-e5586852abb7@sirena.org.uk>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <46d71e73-e491-4d3d-aaf5-e5586852abb7@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 25/05/2026 15:44, Mark Brown wrote:
> On Wed, May 20, 2026 at 06:01:49PM +0300, Peter Ujfalusi wrote:
> 
>> +	if (src->data.sink_rate) {
>> +	} else if (dir == SNDRV_PCM_STREAM_CAPTURE) {
>> +	} else {
>> +		/*
>> +		 * Otherwise try to guess what the rate should be:
>> +		 * The output formats must have single rate specified if the
>> +		 * sink rate is not set for an SRC in playback path.
>> +		 */
>> +		int i;
>> +
>> +		out_audio_fmt = &available_fmt->output_pin_fmts[0].audio_fmt;
> 
> Did we validate that there actually are output_pin_fmts[] here? 

I think sof_ipc4_widget_setup_comp_src() should do the sanity check
since src must have at least one input and one output format.
asrc should be doing the same and probably other types as well.

> It's not a sensible topology, but you could trigger it with a suitable
> topology I think.

Probably the tplg file would compile, but I have not tested it.

I'll add another patch to do the validation at setup type and send v2.

-- 
Péter

