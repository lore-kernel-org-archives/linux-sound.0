Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B7B48EC87
	for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 14:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789049580; cv=none; b=kLc4WolocG6ycIhCXlz9YCSnm2ynBVQNRo3qXM/8mz8MhoRHKcTitDuPWzC9WZBEmLxxLkd3ifK/kkTx0nk7FLNOSGrWiCMwfusUi8K0um1JjMgAmey7fnAE5v+iWk8sOQgd/VrwUMXVKbHGsrktuqeHINZyPvnnBSq3J3xE02A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789049580; c=relaxed/simple;
	bh=jnVWQAdMPo0Yy5rA1gFfJoSbpt7vb+jIIOavDwr0/jM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jQL704VRFoIdU8zjhNicT3SIypQaXybvx/b312NHjdVrUwKWT6SE9JpIe8FrcvL3ToBAyrmh2C1CPsvGk8c5i73I6VpXfVPiZ4oTRDWtApH5T3hQA4Wga43JaNcDRk73dFH30Nq/s/EHEzmSU1b5lihS31K8jM3TDwtnRjDdr7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BXqV3uOf; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BXqV3uOf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789049579; x=1820585579;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=jnVWQAdMPo0Yy5rA1gFfJoSbpt7vb+jIIOavDwr0/jM=;
  b=BXqV3uOfzs0S9X6PMAGK3G2LU/pXYQHzv9OYWfxSErm4PlHGl74hL6AW
   QYRy4zVtVKD4XRli1wXQgO76frKhTK7ZqZmRevSZeBNP7OT1vZhoH7qXV
   n6CY0CTSOXilrA9MVQWCpqOenfrTjyj6tf+QgyUqIuWI5Ai6ax/GS+gre
   3Oej396ljysdmYVEs97Eq9SqwQ7zXbJvY55vB4L9DB2+6lh9sNl3yOCDE
   PKW5lufnjh73OX915A2njLxMSz8Pm3H7EOjKg/9JFdOjZzeYZ0BxeiT1b
   RqqOVt7Nt73GxaV/Jvp+reVThNttQ5Ey6gPVdjHiyVBIa3PvbUcLaTYig
   Q==;
X-CSE-ConnectionGUID: XTaDeySXSl65IetY8IEdig==
X-CSE-MsgGUID: iEiL2VYkQhC2nxC+tB4Aeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89530888"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="89530888"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 07:12:58 -0700
X-CSE-ConnectionGUID: BYF3/mMPQt2N+L8VcOUBtw==
X-CSE-MsgGUID: ZUeeqWeHSOWFn66ULg7XvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="275179691"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.173]) ([10.245.245.173])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 07:12:56 -0700
Message-ID: <759b3091-4af0-4f57-a1b3-9126aa4be086@linux.intel.com>
Date: Thu, 10 Sep 2026 17:13:05 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/24] ASoC: SOF: compress: Rename compress ops with
 ipc3 prefix
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, vkoul@kernel.org,
 perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com, broonie@kernel.org,
 srinivas.kandagatla@oss.qualcomm.com
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, daniel.baluta@nxp.com
References: <20260909090949.7503-1-peter.ujfalusi@linux.intel.com>
 <20260909090949.7503-8-peter.ujfalusi@linux.intel.com>
 <c54a3b84-cf8d-4336-b39d-eddbfd3de181@linux.dev>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Content-Language: en-US
In-Reply-To: <c54a3b84-cf8d-4336-b39d-eddbfd3de181@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 09/09/2026 15:34, Pierre-Louis Bossart wrote:
> On 9/9/26 11:09, Peter Ujfalusi wrote:
>> From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
>>
>> In preparation for adding support for compressed offload support for
>> IPC4, rename the current compress implementation with the IPC3 prefix.
>> Introduce a new field in struct sof_ipc_pcm_ops to save the
>> IPC-specific compressed ops pointer. This should be set when the
>> component driver ops are assigned during SOF device probe. Expose a couple
>> of common functions that will be used by both IPC-specific implementations
>> and rename the compress.c file to ipc3-compress.c
>>
>> Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
>> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
>> Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
>> ---
>>  sound/soc/sof/Makefile                        |   2 +-
>>  sound/soc/sof/core.c                          |  10 +-
>>  sound/soc/sof/{compress.c => ipc3-compress.c} | 145 ++++--------------
>>  sound/soc/sof/ipc3-pcm.c                      |   3 +
>>  sound/soc/sof/ipc3-priv.h                     |   3 +
>>  sound/soc/sof/pcm.c                           |   5 +-
>>  sound/soc/sof/sof-audio.c                     |  81 ++++++++++
>>  sound/soc/sof/sof-audio.h                     |   5 +
>>  8 files changed, 137 insertions(+), 117 deletions(-)
>>  rename sound/soc/sof/{compress.c => ipc3-compress.c} (66%)
>>
> 
> this looks like a trivial code move:

Yes, it is mostly just that.

...>> +int snd_sof_compr_create_page_table(struct snd_soc_component
*component,
>> +				    struct snd_compr_stream *cstream,
>> +				    unsigned char *dma_area, size_t size)
>> +{
>> +	struct snd_dma_buffer *dmab = cstream->runtime->dma_buffer_p;
>> +	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
>> +	int dir = cstream->direction;
>> +	struct snd_sof_pcm *spcm;
>> +
>> +	spcm = snd_sof_find_spcm_dai(component, rtd);
>> +	if (!spcm)
>> +		return -EINVAL;
>> +
>> +	return snd_sof_create_page_table(component->dev, dmab,
>> +					 spcm->stream[dir].page_table.area, size);
>> +}
>> +#endif
> 
> but then there is also the addition of new ops and renames.
> 
> This patch does a lot of things, most of them trivial but overall it's a
> lot to review.
> 
> maybe split this patch in two with the code move in a first patch, then
> the file rename and introduction of new ops?

OK, I will split it up, move these first then rename and the mandatory
changes along in core as second patch.

-- 
Péter

