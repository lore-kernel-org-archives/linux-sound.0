Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179F51714CF
	for <linux-sound@vger.kernel.org>; Thu,  6 Mar 2025 15:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741275607; cv=none; b=gc1glz+GzYqUKeZsUKRtIT2HhkcOfWsxcr1HiKa/5eQtOdnyCl3DvCsXINqc0xuF6d1WwLQI/YmA7bgBJY24QUjBL7zW1VexEXADAQmECW3L2xuIr24+bbUGzjiyBB/ktAtZU9SjONoVcegNCAPP3i98/h34cI5t1vC5rzFwFA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741275607; c=relaxed/simple;
	bh=cxUGqGlUAvX/Jn2IRjMk4QGNwGfJkHRHJhAy5WdSYGY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FvuJ2AydNRDZlN68EPUjT18oYncYsz59enDxBb7yB52V3yH/5gkJpsp7rfcjUwmV1uIe5iv7V7ET2HIxE++J266F6MZn4jyEd1cegZMZ3BAs8YIKpnU9BppDIvUhHaXj+JqyM4LWY9lwVvoAUWL/whk/WUIfimLzbmcY/eEsOt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KVLoAb28; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KVLoAb28"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741275606; x=1772811606;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=cxUGqGlUAvX/Jn2IRjMk4QGNwGfJkHRHJhAy5WdSYGY=;
  b=KVLoAb28JFNEMI3PmLlUuTbMaoe0w9LNBRJb78/DvFc5rnPuLMiKkfnX
   Y10Uk/7JFfZQbWXlClQRchQc6xrN0+TB8EajpPGobWLjjJuU/Y9rNIhdU
   sK+9v8mZe1Fw0+fhXIjub3L1kYTg9tj5z/bctYWbTrlB1mk17kWv2LXLU
   5ZvZj8i6oEaKh/nf0Qn4ot7PwZXZw62bw7FhV6VIfaX9WAqc9/7tY2uDB
   2HhtGr52gcOYvw40ncxRIuPuiS0c0j4rmeJt3nT5Hy+GyL6NPO03AxW5t
   XCmEVUISLcZ95i+CLtjrpWEJNV+DyNf64vTY2TTsM8GE2zUePUsMLkLQu
   w==;
X-CSE-ConnectionGUID: 76/0CU0STDGFei/oHi1MRw==
X-CSE-MsgGUID: 8mJZrRdWTZSohllRgCXjfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="46218045"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; 
   d="scan'208";a="46218045"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 07:40:05 -0800
X-CSE-ConnectionGUID: adfp+GZpQ8Szr6wqpnDQ7g==
X-CSE-MsgGUID: NgrsYmRmQrasSLiconR6pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="123231322"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.249.86]) ([10.245.249.86])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 07:40:02 -0800
Message-ID: <b52afb54-9f43-4006-9e12-b8d752dc38b0@linux.intel.com>
Date: Thu, 6 Mar 2025 17:40:38 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] ASoC: SOF: Intel: ptl: Add support for mic privacy
To: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, lgirdwood@gmail.com,
 broonie@kernel.org
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.dev, liam.r.girdwood@intel.com
References: <20250306133527.16722-1-peter.ujfalusi@linux.intel.com>
 <20250306133527.16722-9-peter.ujfalusi@linux.intel.com>
 <2eabbadd-e433-456f-a744-4dc9c843c051@linux.intel.com>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Content-Language: en-US
In-Reply-To: <2eabbadd-e433-456f-a744-4dc9c843c051@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 06/03/2025 16:05, Amadeusz Sławiński wrote:
> On 3/6/2025 2:35 PM, Peter Ujfalusi wrote:
>> Implement the three callbacks that is needed to enable support for
>> reporting the mic privacy change via soundwire.
>>
>> In PTL the mic privacy reporting is supported via soundwire and DMIC and
>> the soundwire is owned by the host, it's interrupt is routed there.
>>
>> To enable the interrupt, the sublink mask needs to be passed to the
>> multilink layer, the check_mic_privacy_irq/process_mic_privacy callbacks
>> needs to be implemented to check and report the mic privacy change.
>>
>> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
>> Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
>> Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
>> Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
>> ---
>>   sound/soc/sof/intel/ptl.c | 58 +++++++++++++++++++++++++++++++++++++--
>>   sound/soc/sof/intel/ptl.h |  5 ++++
>>   2 files changed, 61 insertions(+), 2 deletions(-)
>>
>> diff --git a/sound/soc/sof/intel/ptl.c b/sound/soc/sof/intel/ptl.c
>> index ae8e9e08ad2a..eeb86c228b2a 100644
>> --- a/sound/soc/sof/intel/ptl.c
>> +++ b/sound/soc/sof/intel/ptl.c
>> @@ -18,10 +18,62 @@
>>   #include "lnl.h"
>>   #include "ptl.h"
>>   -int sof_ptl_set_ops(struct snd_sof_dev *sdev, struct
>> snd_sof_dsp_ops *dsp_ops)
>> +static bool sof_ptl_check_mic_privacy_irq(struct snd_sof_dev *sdev,
>> bool alt,
>> +                      int elid)
>> +{
>> +    if (alt != 1 || elid != AZX_REG_ML_LEPTR_ID_SDW)
> 
> alt is bool, so let's be type aware and either "alt != true" or just "!
> alt"?

Sure, I can't explain why it ended up like this.

> 
>> +        return false;
>> +
>> +    return hdac_bus_eml_is_mic_privacy_changed(sof_to_bus(sdev), alt,
>> elid);
>> +}
>> +
>> +static void sof_ptl_process_mic_privacy(struct snd_sof_dev *sdev,
>> bool alt,
>> +                    int elid)
>> +{
>> +    bool state;
>> +
>> +    if (alt != 1 || elid != AZX_REG_ML_LEPTR_ID_SDW)
> 
> same here
> 

-- 
Péter

