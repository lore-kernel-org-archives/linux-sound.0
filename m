Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B8F2DEA89
	for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 14:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789051764; cv=none; b=b2X+aVjCJFSpW4MDmy2Nu6atvEiWeoUbLsaUi0FxWMJdmRqsPr7g6emu0XUXG9fFrySUjYkYNwHW2FNk6WUGa5C1KDUs2Hrm4k86d4aP4y0Jppf8/gf5o89S5eDdC/Od1RLiiGuP/eMMY7QZLioxB9KY46k4err69jcG16p6i6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789051764; c=relaxed/simple;
	bh=evSsSsoQyPmYfdV0T41E6xTxz3ZauE8IUKBn4sOVNkk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J8cdGl97/qvTKt+1XSVDzSaKBIgcmIth48YQC76ODvLlAjKc+e23Tat1eeCc618e2ZeGygFCIr5zQXzElFc9bHmvsPhVF68KCzlfMNhGOpbhobVQN5dgqgfo4EH85bybXUJ8Cb4U23aoPGpNrQBoanQfFNgP41G0RoDCsztjrK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nxdXdPkY; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nxdXdPkY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789051763; x=1820587763;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=evSsSsoQyPmYfdV0T41E6xTxz3ZauE8IUKBn4sOVNkk=;
  b=nxdXdPkYMi0dO72irXHcWMbgOsRBblXGU4KmkNG9mUdM50Vr8Cm9U8zq
   NpX+vgnjoCUCG4e1KEVfCrew2+p/RjPDCkRHM4kclN+494ajIpJ/G8Vh0
   YPqN02E++FLxX36bpVmQtVbSnxwCeAyu40vIj7vUFQpZM2TYrORkYqZHB
   d3tJ5Dq1ya7XV/pbCHHDW+a1AY56+cchkKg411UNUD2ObWj/qFnHVWs+R
   +khur/SOl5ej7gk3P97aoileT7DBqJlMWm2X4iL2To9Czw0UAHpUw0jvt
   DWJNS3l+AhfCZNacLwWH4NNRBySMMJVcwlkWlim0uMg6v+MxUmGEwkY60
   Q==;
X-CSE-ConnectionGUID: PNTvwdn/Qm2+g3BaSKQFsw==
X-CSE-MsgGUID: nAuCGWnnRse16iYmhD3ylg==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="99835076"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="99835076"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 07:49:22 -0700
X-CSE-ConnectionGUID: gpYPWIAuR8qqNDhUfoLUCQ==
X-CSE-MsgGUID: v/6m6+7SQCiLy6SWBxXABA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="295144322"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.173]) ([10.245.245.173])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 07:49:19 -0700
Message-ID: <e210f571-fa14-4994-af7c-ca0302ba35ed@linux.intel.com>
Date: Thu, 10 Sep 2026 17:49:29 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 19/24] ASoC: SOF: ipc4-topology: Set FAST_MODE for host
 copier in compr mode
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, vkoul@kernel.org,
 perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com, broonie@kernel.org,
 srinivas.kandagatla@oss.qualcomm.com
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, daniel.baluta@nxp.com
References: <20260909090949.7503-1-peter.ujfalusi@linux.intel.com>
 <20260909090949.7503-20-peter.ujfalusi@linux.intel.com>
 <0bb3caad-5734-4524-8a9b-75b3c5e058dc@linux.dev>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <0bb3caad-5734-4524-8a9b-75b3c5e058dc@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 09/09/2026 16:21, Pierre-Louis Bossart wrote:
> On 9/9/26 11:09, Peter Ujfalusi wrote:
>> FAST_MODE allows the host DMA to work in opportunistic, free running mode,
>> which matches with the bitstream nature of compressed devices.
> 
> Does it?

Yes, it does.

> My memory of the 'opportunistic' behavior was that the DMA would try to
> use every possible window to send to/from the DSP, so that the bus would
> be idle for longer periods of time overall.

The FAST_MODE detaches the host copier form the sampling rate completely
and will 'allow' prolonged periods w/o new data to be available. The
IPC4 definition of the feature bit says:
/* If FAST_MODE bit is set in CopierModuleCfg::copier_feature_mask then
   copier is able to transfer more than ibs. This bit shall be set only
   if all sinks are connected to data processing queue.
*/
> That would make sense as well for PCM, no?

We have similar mode for PCMs with Deep Bufferr, but that is a different
mechanism: it only makes the DMA move in bigger chunks, expressed in ms
(SOF_TKN_INTEL_COPIER_DEEP_BUFFER_DMA_MS -> dma_buffer_size), so it is
still bound by the sampling rate checks. It is not opportunistic.
> Maybe this is the right thing to do for compressed data, I just wonder
> why it is NOT the right thing to do for PCM...

Basically FAST_MODE is a free run mode of the host copier. A PCM stream
has a sampling rate the host side can and should be paced by, a
compressed stream is a bitstream where the host side has no such reference.

>>
>> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
>> Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
>> ---
>>  sound/soc/sof/ipc4-topology.c | 3 +++
>>  sound/soc/sof/ipc4-topology.h | 5 +++++
>>  2 files changed, 8 insertions(+)
>>
>> diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
>> index 42cf444e847e..566913025cc7 100644
>> --- a/sound/soc/sof/ipc4-topology.c
>> +++ b/sound/soc/sof/ipc4-topology.c
>> @@ -744,6 +744,9 @@ static int sof_ipc4_widget_setup_pcm(struct snd_sof_widget *swidget)
>>  			sps->dsp_max_burst_size_in_ms = 1;
>>  	}
>>  
>> +	if (spcm->pcm.compress)
>> +		ipc4_copier->data.copier_feature_mask |= BIT(SOF_IPC4_COPIER_FAST_MODE);
>> +
>>  skip_gtw_cfg:
>>  	ipc4_copier->gtw_attr = kzalloc_obj(*ipc4_copier->gtw_attr);
>>  	if (!ipc4_copier->gtw_attr) {
>> diff --git a/sound/soc/sof/ipc4-topology.h b/sound/soc/sof/ipc4-topology.h
>> index 5e78f3de092e..c2949ff979a5 100644
>> --- a/sound/soc/sof/ipc4-topology.h
>> +++ b/sound/soc/sof/ipc4-topology.h
>> @@ -222,6 +222,11 @@ struct sof_copier_gateway_cfg {
>>  	uint32_t config_data[];
>>  };
>>  
>> +/* bit definition in copier_feature_mask */
>> +enum sof_ipc4_copier_feature {
>> +	SOF_IPC4_COPIER_FAST_MODE = 0, /* free running mode of host copier */
>> +};
>> +
>>  /**
>>   * struct sof_ipc4_copier_data - IPC data for copier
>>   * @base_config: Base configuration including input audio format
> 

-- 
Péter

