Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75413C1088
	for <linux-sound@vger.kernel.org>; Tue,  6 Oct 2026 11:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791286319; cv=none; b=YZYOBfhZd1t4jpL3q62/PtWsKDEggmQM09CJgIfA922S2EAHgmR4gBSjw0MFj6Wo+hwcBmqR4xthG3hkkorPD8PEkyVRsFhGTJjxo7eHMLY6dYCetcqX4vV0KjFdpgAxI4iUNZ+ZifXLF63TPaVjyDAI6ZY8Zp2qXiAHsLgIXVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791286319; c=relaxed/simple;
	bh=QIgCb951pTGPbbZpeb10voFh1I9v57YjxAPRVj4t2Tw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jo+2+gqe1cHJo5vck/uKqG3sia0/ud2VxtymU2BuWOx8b4Qro6PfD6x5fBt36rWgHIL6v79AjAP0DrGB0ZfvLOiLYghD+cIcCycxuHGPR9fGc+SF/1DE5MRPjhPy4ohyEEngCqFiZHiwhirP1NUy/izK+ubTieIRfSsu11XTssQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W4/Zr9LV; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W4/Zr9LV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791286318; x=1822822318;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=QIgCb951pTGPbbZpeb10voFh1I9v57YjxAPRVj4t2Tw=;
  b=W4/Zr9LVsfdcxf4WUyZGbgyDK5zKQp40GE8YkqlNGkNLOGZuu66rd8Lv
   zAeDXcmRyd+0DBdVXqlVHmn9tSPTwgUbtHukiaf8iVB5XrPYFZbDau6CY
   TvXIF+eq/wNc/i6vpxiQmbdX8xS5I8uRPyY/P+xiMMsg6pE7Jkr2axf9w
   c9QVLIcLdHzZbeuzJK5VW/IkQE49rJEWRLlCAWriVIlaCJsUHGFllHSw8
   QiIfdo/jrxmsx6E2l093LLdjkY64Wnp3laYCLOHYA61/Iooqrnl0T7920
   GEjU1GFEOXwEaOHOonA7wl1j59L7Ku2X3jgJPi4qD2uTAiOlX20lTEzBo
   g==;
X-CSE-ConnectionGUID: ruOnWcHbSKKdL+t5uEiaHQ==
X-CSE-MsgGUID: 0tjX03dzR6y6UEtefGSluA==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="95789656"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="95789656"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 04:31:57 -0700
X-CSE-ConnectionGUID: uuf2/A81THGuFRFUneoDTA==
X-CSE-MsgGUID: NjTyg5cBRRuPNC0fI9pA/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="276243082"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO [10.245.244.21]) ([10.245.244.21])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 04:31:50 -0700
Message-ID: <9724b0b1-80dc-4e73-a02c-363354de0035@linux.intel.com>
Date: Tue, 6 Oct 2026 14:32:11 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 22/26] ASoC: SOF: Add support for IPC4 compressed
To: Mark Brown <broonie@kernel.org>
Cc: vkoul@kernel.org, perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
 srinivas.kandagatla@oss.qualcomm.com, linux-sound@vger.kernel.org,
 kai.vehmanen@linux.intel.com, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.dev, daniel.baluta@nxp.com
References: <20260916120320.18318-1-peter.ujfalusi@linux.intel.com>
 <20260916120320.18318-23-peter.ujfalusi@linux.intel.com>
 <asTBaMNMC2UlWaKC@sirena.co.uk>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <asTBaMNMC2UlWaKC@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 06/10/2026 12:37, Mark Brown wrote:
> On Wed, Sep 16, 2026 at 03:03:16PM +0300, Peter Ujfalusi wrote:
>> Set and define the compressed ops for IPC4.
>> The initial implementation supports basic features: PAUSE PUSH/RELEASE,
>> DRAIN and progress reporting.
>> Tested with PCM, MP3, AAC and VORBIS codec.
> 
>> +static int sof_ipc4_compr_alloc_pages(struct device *dev,
>> +				      struct snd_sof_pcm_stream *sps,
>> +				      struct snd_soc_component *component,
>> +				      struct snd_compr_stream *cstream)
>> +{
> 
>> +	ret = snd_compr_malloc_pages(cstream, crtd->buffer_size);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	ret = snd_sof_compr_create_page_table(component, cstream, crtd->dma_area,
>> +					      crtd->dma_bytes);
>> +	if (ret < 0)
>> +		snd_compr_free_pages(cstream);
> 
> sof_dai_load() allocates 4k for page tables, the limits we have here
> allow for say 64 128k fragments which gives an 8M buffer that on a
> system with 4k pages is going to make more than 4k of PFNs.

True, and this affects the existing IPC3 as well, which does not even
have get_caps callback defined.
I will add a check in snd_sof_create_page_table() and update the ipc4's
get_caps.

> 
>> +static int sof_ipc4_compr_trigger(struct snd_soc_component *component,
>> +				  struct snd_compr_stream *cstream, int cmd)
>> +{
> 
>> +	switch (cmd) {
>> +	case SNDRV_PCM_TRIGGER_START:
>> +	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
>> +		trigger_platform = true;
>> +		break;
>> +	case SNDRV_PCM_TRIGGER_STOP:
>> +	case SNDRV_PCM_TRIGGER_SUSPEND:
>> +	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
>> +		break;
> 
> Do we not need to do something to clean up/reset DMA on STOP?

For IPC4 we need to keep DMA running and stop it later if needed.
Let me see if I'm missing something, but this should (and by tests) be OK.

>> +void sof_ipc4_compr_drain_done(struct snd_sof_dev *sdev, void *ipc_message)
>> +{
> 
>> +	spcm_dbg(spcm, dir, "Entry: EOS done\n");
>> +
>> +	if (spcm->stream[dir].cstream)
>> +		snd_compr_drain_notify(spcm->stream[dir].cstream);
>> +}
> 
> More of an issue further up the stack but snd_compr_drain() triggers the
> drain, then DRAINING is set later in snd_compress_wait_for_drain() and
> there's therefore a window where the DSP could reply to us that the
> drain finished before that happens.

Right, that is true as well. It affects all compress drivers, the core
should set the state for draining before it calls the trigger to be
safe. And roll back in case the trigger fails.

-- 
Péter

