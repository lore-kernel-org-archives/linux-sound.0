Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C200ECC
	for <linux-sound@vger.kernel.org>; Thu, 13 Jun 2024 14:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718288040; cv=none; b=IBc1SHZ4aYKIjmKJeaZLIaoKd3SqkAszWVClCorpT+Mn0GNSi2JLfKXqeqrF3MqRqlgN6mET5EsCiHxO8WqMHC8tO1dCIwDA1HZDmkVylJi8Z56Lgi3bbX4mgjbd6aiIitj2MMr4/RNZVRvtO5HaGyQkWE01SOWzCWx7q5aY4Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718288040; c=relaxed/simple;
	bh=CInWd528BXasi1+5+au2tfhCmdaxQ8gKYmLl+MQTNa4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cP2/XZYukM9yOSIB0SE3UflHBfIPydvUWHP+U+9084eJ72YnQk/QxjM43PW5DPBZh3rq+ZmMxoWfIBVhs0QNxg8xozkO6zwgRcX8Z2G5gdcbXNJKzsnz2kPQJUh3rqrrVzWGCNY/ntpTOyC5Xe1pdYayZEaZ0gPkFo/Dk4UnR6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WmOPfrfe; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WmOPfrfe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718288038; x=1749824038;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=CInWd528BXasi1+5+au2tfhCmdaxQ8gKYmLl+MQTNa4=;
  b=WmOPfrfeN71YWDImLv/E294DFUiwR6E12cn5CLnBGZZ4CKSh5VbdLrEI
   VeYuS7/R2ds6GgMj+ziZ5cRqIzCRiQQ2gplJ7EVzhGb6ZU8ce0RFIXPxa
   BQyKdUrqoCWwm/Bm2qmqbJ0rrUq4jy06QTMgamKbEEit+yZM4fSqY/Qax
   rRpF1/fPMz5/LDiriN2aMymidzeH1y3QYOMRjIRKOzXUz5QXMPuPTJtJp
   wwQG1wXsxkm9qbH4a8Dxy7NnPlSkn8uItt2LeHk1AQBBXVM744nVTaJss
   UZLlS0YYQTverWzFhxcjHIXbIdHVTjGZYn7Z1tv7ChqnyOzaf3WKzPmoW
   w==;
X-CSE-ConnectionGUID: PoMrssSXQAOgNG1358q/Yg==
X-CSE-MsgGUID: Nyqc8bN3TTKi+Hn/RJrs3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="40520780"
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; 
   d="scan'208";a="40520780"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 07:13:57 -0700
X-CSE-ConnectionGUID: 92SZQ1hBREqie1YlJOFJ5g==
X-CSE-MsgGUID: z7XC62rQQo2U4+p4lRhGpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; 
   d="scan'208";a="40859658"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO [10.245.246.108]) ([10.245.246.108])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 07:13:54 -0700
Message-ID: <27668c46-5a44-4e14-8219-5fba6a5c4610@linux.intel.com>
Date: Thu, 13 Jun 2024 16:13:52 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: topology: Fix route memory corruption
To: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, Takashi Iwai
 <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
References: <20240613090126.841189-1-amadeuszx.slawinski@linux.intel.com>
 <0fdbae0e-e540-4c35-a555-5b2607526115@linux.intel.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <0fdbae0e-e540-4c35-a555-5b2607526115@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 6/13/24 13:11, Péter Ujfalusi wrote:
> 
> 
> On 13/06/2024 12:01, Amadeusz Sławiński wrote:
>> It was reported that recent fix for memory corruption during topology
>> load, causes corruption in other cases. Instead of being overeager with
>> checking topology, assume that it is properly formatted and just
>> duplicate strings.
> 
> Reviewed-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

Test results look much better indeed with
https://github.com/thesofproject/linux/pull/5057


Tested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> 
>> Reported-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> Closes: https://lore.kernel.org/linux-sound/171812236450.201359.3019210915105428447.b4-ty@kernel.org/T/#m8c4bd5abf453960fde6f826c4b7f84881da63e9d
>> Suggested-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
>> Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
>> ---
>>  sound/soc/soc-topology.c | 12 +++---------
>>  1 file changed, 3 insertions(+), 9 deletions(-)
>>
>> diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
>> index 0225bc5fc425a..4b166294602fa 100644
>> --- a/sound/soc/soc-topology.c
>> +++ b/sound/soc/soc-topology.c
>> @@ -1052,21 +1052,15 @@ static int soc_tplg_dapm_graph_elems_load(struct soc_tplg *tplg,
>>  			break;
>>  		}
>>  
>> -		route->source = devm_kmemdup(tplg->dev, elem->source,
>> -					     min(strlen(elem->source), maxlen),
>> -					     GFP_KERNEL);
>> -		route->sink = devm_kmemdup(tplg->dev, elem->sink,
>> -					   min(strlen(elem->sink), maxlen),
>> -					   GFP_KERNEL);
>> +		route->source = devm_kstrdup(tplg->dev, elem->source, GFP_KERNEL);
>> +		route->sink = devm_kstrdup(tplg->dev, elem->sink, GFP_KERNEL);
>>  		if (!route->source || !route->sink) {
>>  			ret = -ENOMEM;
>>  			break;
>>  		}
>>  
>>  		if (strnlen(elem->control, maxlen) != 0) {
>> -			route->control = devm_kmemdup(tplg->dev, elem->control,
>> -						      min(strlen(elem->control), maxlen),
>> -						      GFP_KERNEL);
>> +			route->control = devm_kstrdup(tplg->dev, elem->control, GFP_KERNEL);
>>  			if (!route->control) {
>>  				ret = -ENOMEM;
>>  				break;
> 
