Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B0748EC78
	for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 15:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789052892; cv=none; b=WfSMkH5xxVCs1ACDnv8pUVoQyFB1oboOblVQSPkff9dbMMTZuUX0USiEK0f4h7dC9cMI7wZZ0x7RHC7RnMNSMtwFk95UWsUr5TbDZQKFPoj8OuHCtI81KLEnhs6ilaCANW8yG/evxeR69yfhH9amagmcpZm0NcWblVDcGShiLPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789052892; c=relaxed/simple;
	bh=tTmRfO9B/hix1BlemDCrbHqFzSiIHT7HNRx0weD/zK8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ix9Bi1dZSkk7N489XC3Kt5MqoU94x6pKIguF1nJdtcD3qNEloSep9R9Hb6e1k/1rZsBtQ+UJreftTr3yj1g8fZBuK5KA0XpyXM+04WYgg29rILgvzW6zAPulVva+/nGkTm9X6ekw57R13BNDIKO9hz/pCGRKnY3T5oUtxwO6oLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=czUles/m; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="czUles/m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789052888; x=1820588888;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=tTmRfO9B/hix1BlemDCrbHqFzSiIHT7HNRx0weD/zK8=;
  b=czUles/mFGENFS/FpaeFki+mGTwPOHEIfTUXKXIBUHdC1BIVKA/Pr8Ei
   kreMmd+CaVWfRWtAzNA5HtfYnluM+dTcZYI0Saw6C+hPdCbbP825JyE20
   vZExYaZVT8lHr37wtYiB5bSYWQ5gjJcpzZyHQL2REJaR8G1tA4hIe/kyU
   B31oxnbW+1Y1teTQzDFKe+6FST57fowRn+fk4+YksvTOmaxpEJxzbLpLC
   L/BR94kQFV0TYaq3CqymSp0pA/+zyNp7vCvk2I2DCdChjmBCgrFKUnWU0
   LZSCZwcbXHJkzORqONc18FouqumN6DcJzEOgEGyp2pUDwaDTufZNdgL9K
   Q==;
X-CSE-ConnectionGUID: Qdd2/dhkQgCn5IG2OKq9Eg==
X-CSE-MsgGUID: O3QcxyqbTFacX8vXDCv4UQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="88651624"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="88651624"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 08:08:05 -0700
X-CSE-ConnectionGUID: OFOSyRPCTv+oNScKhaE3dQ==
X-CSE-MsgGUID: GTSFfAzuRxOJZAm8Far92A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="269087734"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.173]) ([10.245.245.173])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 08:08:02 -0700
Message-ID: <dafa21ad-1bea-4867-8957-445584bdbe5c@linux.intel.com>
Date: Thu, 10 Sep 2026 18:08:12 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 21/24] ASoC: SOF: ipc4: Handle compressed drain done
 notification from firmware
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, vkoul@kernel.org,
 perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com, broonie@kernel.org,
 srinivas.kandagatla@oss.qualcomm.com
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, daniel.baluta@nxp.com
References: <20260909090949.7503-1-peter.ujfalusi@linux.intel.com>
 <20260909090949.7503-22-peter.ujfalusi@linux.intel.com>
 <e97fa9fe-4728-4d05-b4fc-e2cc39259183@linux.dev>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Content-Language: en-US
In-Reply-To: <e97fa9fe-4728-4d05-b4fc-e2cc39259183@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 09/09/2026 16:28, Pierre-Louis Bossart wrote:
> On 9/9/26 11:09, Peter Ujfalusi wrote:
>> The decoder module sends a drain done notification when the last chunk of
>> the stream after the EOS from host has been decoded.
>>
>> The notification is a module notification with 0xc0c0 as magic number in
>> event_id upper 16 bit.
>>
>> Call sof_ipc4_compr_drain_done() when the notification arrives to handle
>> it.
>>
>> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
>> Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
>> ---
>>  include/sound/sof/ipc4/header.h |  3 ++-
>>  sound/soc/sof/ipc4.c            | 13 +++++++++++--
>>  2 files changed, 13 insertions(+), 3 deletions(-)
>>
>> diff --git a/include/sound/sof/ipc4/header.h b/include/sound/sof/ipc4/header.h
>> index dd1e0d1cf0d8..c0216f4b14c2 100644
>> --- a/include/sound/sof/ipc4/header.h
>> +++ b/include/sound/sof/ipc4/header.h
>> @@ -647,9 +647,10 @@ struct sof_ipc4_notify_module_data {
>>   * The event_data contains the struct sof_ipc4_control_msg_payload of the control
>>   * which sent the notification.
>>   */
>> -#define SOF_IPC4_NOTIFY_MODULE_EVENTID_ALSA_MAGIC_MASK		GENMASK(31, 16)
>> +#define SOF_IPC4_NOTIFY_MODULE_EVENTID_SOF_MAGIC_MASK		GENMASK(31, 16)
> 
> not clear why you have to rename the MASK but not the VAL?

I only had the ALSA notification, but now the same mechanism can carry
different notification, We still have the ALSA (volume, switch,enum,
bytes change) notification - ALSA 0xA15A, and the COMPR notification -
0xC0C0

>>  #define SOF_IPC4_NOTIFY_MODULE_EVENTID_ALSA_MAGIC_VAL		0xA15A0000
>>  #define SOF_IPC4_NOTIFY_MODULE_EVENTID_ALSA_PARAMID_MASK	GENMASK(15, 0)
> 
> <dad joke> always stay away from paramid schemes </dad joke>

I think it is illegal in most countries, we are in the gray area ;)

>> +#define SOF_IPC4_NOTIFY_MODULE_EVENTID_COMPR_MAGIC_VAL		0xC0C00000
> 
> maybe just add this one and avoid the confusing rename above?

But then when checking the magic it is not quite right..

data->event_id & ALSA_MAGIC_MASK == ALSA_MAGIC_VAL
data->event_id & ALSA_MAGIC_MASK == COMPR_MAGIC_VAL

These are SOF notifications, and should not be tied to ALSA.

> 
>>  
>>  /*
>>   * Macros for creating struct sof_ipc4_module_init_ext_init payload
>> diff --git a/sound/soc/sof/ipc4.c b/sound/soc/sof/ipc4.c
>> index e77f73390bd8..b9dd798e59bc 100644
>> --- a/sound/soc/sof/ipc4.c
>> +++ b/sound/soc/sof/ipc4.c
>> @@ -776,12 +776,21 @@ static void sof_ipc4_module_notification_handler(struct snd_sof_dev *sdev,
>>  	}
>>  
>>  	/* Handle ALSA kcontrol notification */
>> -	if ((data->event_id & SOF_IPC4_NOTIFY_MODULE_EVENTID_ALSA_MAGIC_MASK) ==
>> -	    SOF_IPC4_NOTIFY_MODULE_EVENTID_ALSA_MAGIC_VAL) {
>> +	switch (data->event_id & SOF_IPC4_NOTIFY_MODULE_EVENTID_SOF_MAGIC_MASK) {
>> +	case SOF_IPC4_NOTIFY_MODULE_EVENTID_ALSA_MAGIC_VAL:
>> +	{
>>  		const struct sof_ipc_tplg_ops *tplg_ops = sdev->ipc->ops->tplg;
>>  
>>  		if (tplg_ops->control->update)
>>  			tplg_ops->control->update(sdev, ipc4_msg);
>> +
>> +		break;
>> +	}
>> +	case SOF_IPC4_NOTIFY_MODULE_EVENTID_COMPR_MAGIC_VAL:
>> +		sof_ipc4_compr_drain_done(sdev, ipc4_msg);
>> +		break;
>> +	default:
>> +		break;
>>  	}
>>  }
>>  
> 

-- 
Péter

