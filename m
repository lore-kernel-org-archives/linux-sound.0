Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0575430B514;
	Tue,  3 Mar 2026 07:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772521817; cv=none; b=BupwF+HNZHMjRwE22F5XlzFnEyoxVeyA0GtRCCVd+A8ZxsH+RR5SV+uSjWsmlGzwOWv1F7hwqp2wCpmVk7WWbj+elBCvdhfwcrWEsPzeX0qBclSRfU/p6FbOwJ3X/jU4JS7mLqQuO8+ge6QGQ43VWzY/T5CbzQe6xn7SbiHa9fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772521817; c=relaxed/simple;
	bh=io2t34RM9jMe7nqoiRObcqa9Itk20wXo3QHIa68irm8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LTFwJb7TvHG6i5v053jY88EYFjF4ElquKQrj5WYaA7DDKOMXisjrMyfQpiKmz5I7ShWF7BtUa1usBAWY8D5fw0wzNs0TjsRn2xvAojWJblrmgkzgkfczoJm1OFwNAvz9zNTv7fKKH0/l3bKyrwYdyveufu9nvztfAW1in/T6UdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eUcN1OH5; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eUcN1OH5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772521816; x=1804057816;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=io2t34RM9jMe7nqoiRObcqa9Itk20wXo3QHIa68irm8=;
  b=eUcN1OH5WfzoA+UcPbgD3LIL/T0vrHqcICD2YxB7RhN5atb0LWj0E9p+
   qznyolrLpjGU7Dv84qgU5//F+u9qcRI+ji5wFPSga9N9IIE4hZCyAty6N
   EHXtHLCuKqZqmX52e3uurrotqNTmZCIxBVtBefpyPZ4kWVg3My8yywDwq
   C0D+XHCqOGS/yYMuQoE3gK4wPHz35JSUD4puHiJrkVpshEaEgX26lxW96
   MmhFcrxkLxYn9Vx/a4h4emzUnylioLgXh6S4oGQs4B+5eiDdqPajYSTBK
   bJNoyJ64I+/27/FcqC0q870+r/tj0MmmBx2A3Npdk8YOINsTDQa/dYA4M
   A==;
X-CSE-ConnectionGUID: NRXj54VcQGqRuRgzUBBErQ==
X-CSE-MsgGUID: FIM7ED6aRyCF7b9zxxAVUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="73455465"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="73455465"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 23:10:15 -0800
X-CSE-ConnectionGUID: H12cI5sDQaetGLOVsu+Qpw==
X-CSE-MsgGUID: oU0RVV5STnalnSMsyyjvSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="215457941"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO [10.245.244.202]) ([10.245.244.202])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 23:10:12 -0800
Message-ID: <cb319d2d-295b-4d3d-ba73-f3d28f67c942@linux.intel.com>
Date: Tue, 3 Mar 2026 09:10:20 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] ASoC: Intel: soc-acpi-cht: Unify device quirks
To: Yauhen Kharuzhy <jekhor@gmail.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, Hans de Goede <hansg@kernel.org>
References: <20260301-asoc-yogabook-v2-v2-0-adcc7ed40985@gmail.com>
 <20260301-asoc-yogabook-v2-v2-1-adcc7ed40985@gmail.com>
 <e29bd016-b8f4-46d1-8cfb-ace4b2512082@linux.intel.com>
 <aaYO8_i0f-5s3Nsq@jekhomev>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <aaYO8_i0f-5s3Nsq@jekhomev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 03/03/2026 00:33, Yauhen Kharuzhy wrote:
> On Mon, Mar 02, 2026 at 05:54:05PM +0200, Péter Ujfalusi wrote:
>>
>>
>> On 01/03/2026 23:33, Yauhen Kharuzhy wrote:
>>> This file contains two types of quirks, both checking DMI for
>>> machine-specific strings and returning machine data for a matching entry.
>>>
>>> The first one, `cht_quirk`, is used to override the default entry for an
>>> existing ACPI codec node if the node's info is invalid. It returns either
>>> the matched machine data or the default entry if no match is found.
>>>
>>> The second one, `cht_yt3_quirk_cb`, is used for devices (originally the
>>> Lenovo Yoga Tab 3 Pro) without a valid codec DSDT entry. It is bound to
>>> the SST ACPI node and returns either the matched machine data or NULL if
>>> no match is found.
>>>
>>> To allow adding new machine entries to the second case and to use a single
>>> DMI match entry for both cases (for example, if two variants of one device
>>> exist: one with a valid ACPI entry and one without, like the Lenovo Yoga
>>> Book YB1-X91 and YB1-X90 - Windows and Android versions), reorganize
>>> these quirks functions to use the same approach: machine data is set in
>>> the matched dmi_system_id entry as driver_data field.
>>>
>>> Signed-off-by: Yauhen Kharuzhy <jekhor@gmail.com>
>>> ---
>>>  sound/soc/intel/common/soc-acpi-intel-cht-match.c | 100 +++++++++-------------
>>>  1 file changed, 42 insertions(+), 58 deletions(-)
>>>
>>> diff --git a/sound/soc/intel/common/soc-acpi-intel-cht-match.c b/sound/soc/intel/common/soc-acpi-intel-cht-match.c
>>> index e4c3492a0c28..57097c1d011e 100644
>>> --- a/sound/soc/intel/common/soc-acpi-intel-cht-match.c
>>> +++ b/sound/soc/intel/common/soc-acpi-intel-cht-match.c
>>
>>>  
>>> +static struct snd_soc_acpi_mach *cht_quirk_nocodec(void *arg)
>>
>> This is confusing, why it is _nocodec?
>> cht_quirk_strict() or something might be better?
> 
> Something like "a quirk for machines without of codec definition in the
> ACPI DSDT". But yes, it is confusing because we have separated "nocodec" entry
> in the table. I just couldn't think of anything better. 'strict' doesn't
> seem to reflect the meaning for my opinion also.

I see, the strict came to mind to imply that it will only return with a
match if there is a match, otherwise it will return NULL.
No fallback to default (or self match), only a strict match is allowed.

cht_match_only_quirk(), cht_no_fallback_quirk() ?

I'm extremely bad at naming..

> 
> 
>>
>> -- 
>> Péter
>>
> 

-- 
Péter

