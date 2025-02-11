Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55FC126BD8C
	for <linux-sound@vger.kernel.org>; Tue, 11 Feb 2025 15:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739286737; cv=none; b=NRmLqBTN02H/Llp7fSw9UY/HKHTHVCACrH4ktfVPhT+CZ6R5WA3KBO2t8NhMdlX4UejstXMGdzAK3iKVCMGiFgdBnDWmx28r+qyFTQBdGZFKuAEjs2V7VfGML4p8N/o1L1mLzYK0dh+9qXvrPYRyqYh5XWNWcwVRK+GWdXrykVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739286737; c=relaxed/simple;
	bh=rzRSzlMUAXq5a+SmtZ7AEkSLANvUgfmuply959Kz/3o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qkvCMFJJ2+nekGIjPiq+HxytdxXtCXuLtNgUDqEhctJkIw1saJ/xLyCTEGztoNBXAZeBN1B27J/e/mQJonq7JqBlyi1XnHqYpUnaAX5X17ok6NhLlZfT8Ev0To2XJ1Te55vFa/L0buL11DFu7we/DRBG4TTGKo+FQbFxOHj6bFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j4p4S0ev; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j4p4S0ev"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739286735; x=1770822735;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=rzRSzlMUAXq5a+SmtZ7AEkSLANvUgfmuply959Kz/3o=;
  b=j4p4S0evAe3/BJj9onamivEGScwBMn+vm9bZClxNSyHhoy0+qbURszCB
   MtzBlsDtG0EatCMPTLo1yOambZ7PUnqpsrgPq66AIeFeENop34ddXFkuI
   1jbWDOKxlP9CNnmaj5a8Apqu/BixOQTNAfn4VboPSPWI9WWfDdv/fKztj
   f2qtISuzf5EoYTo6xCaDB6KosGsJ5UNYoP0mN4SQo9I4iqmkVDeakF4zz
   G4xdNNOCW2uJ/3/tIcR0Te7YYyxS3rReccuXjw4lh1TQslX9n2ONE47qY
   N+t+RbDGRbDqTiotr2StxzNbSsHHBReGmyySX3+7zKPOWpiNLryJNCFoR
   w==;
X-CSE-ConnectionGUID: ht1OUKldRDSDyz18Kbotnw==
X-CSE-MsgGUID: nVRuGXPoS5+apUxziuzQ+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="27511146"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="27511146"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 07:12:15 -0800
X-CSE-ConnectionGUID: hlc5f9tdT4WL2YnT2Ktepw==
X-CSE-MsgGUID: vcG4SKRvTrSZivGmfmSkVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="117554389"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.8.107]) ([10.94.8.107])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 07:12:13 -0800
Message-ID: <b0b30196-f985-433f-a3ce-0e7b4f9981fb@linux.intel.com>
Date: Tue, 11 Feb 2025 16:12:10 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: core: Change device numbering
To: Jaroslav Kysela <perex@perex.cz>,
 Cezary Rojewski <cezary.rojewski@intel.com>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
References: <20250127144445.2739017-1-amadeuszx.slawinski@linux.intel.com>
 <f8f2b8f9-527e-486d-ae83-34abd13ef968@linux.intel.com>
 <6fcbc9d3-93d4-4485-9f9f-5bef61476ef3@perex.cz>
 <811c03ef-03a2-44a3-969b-5a2d55f2f876@intel.com>
 <2a772972-3011-4083-9d5d-e1bfe297998b@linux.intel.com>
 <50f5fa11-55f2-4928-97a6-b4758e8d9d52@perex.cz>
 <fabca478-69cc-436e-b0c4-2ffec183e66a@linux.intel.com>
 <675dba40-e559-45bf-b9ec-65f4d4c60923@perex.cz>
 <4c46ebfa-2892-462f-9f6f-98bec8620e5a@linux.intel.com>
 <d895d47a-7705-4cc5-aefc-5ea87fb79c84@perex.cz>
 <5ff3e844-884b-4fca-b0fd-17bbe6e43801@linux.intel.com>
 <1fb3d3d9-00f7-4833-afff-7c5c66999752@perex.cz>
Content-Language: en-US
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <1fb3d3d9-00f7-4833-afff-7c5c66999752@perex.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


>>
>> Well, those can be set to something better, it's just that ASoC defaults
>> to DMI if there is no longname provided. So if you have any suggestions,
>> we can do it while also changing card names.
>> But do note that it allows for differentiating between different
>> machines using same card in case we need to do something custom for UCM
>> on one of them:
>> 2680
>> access("/usr/share/alsa/ucm2/conf.d/avs_hdaudio/LENOVO-20KH006LPB- 
>> ThinkPadX1Carbon6th.conf",
>> R_OK) = -1 ENOENT (No such file or directory)
>> 2680  access("/usr/share/alsa/ucm2/conf.d/avs_hdaudio/avs_hdaudio.conf",
>> R_OK) = -1 ENOENT (No such file or directory)
>> so while not pretty I'm not sure if we can do any better, without
>> breaking above possibility. And in most cases UCM based on driver name
>> should be enough, which looks pretty enough.
> 
> UCM can do DMI matching itself now like (copied from acp5x.conf):
> 
> ....
> If.jupiter {
>      Condition {
>          Type String
>          String1 "Jupiter"
>          String2 "${sys:devices/virtual/dmi/id/product_name}"
>      }
>      True {
>                  ...
> ....
> 
> The long name path lookup is a relict from the past. ASoC core just 
> duplicates information which can be already obtained in the user space. 
> I'm going to rewrite the machine specific links and use the UCM like 
> matching here. With this, we can turn long name lookups in /usr/share/ 
> alsa/ucm2/ucm.conf off.

Oh, that's nice, should I then also set longname = shortname for our 
cards? I would like to avoid a need to change things again in this area 
in the future ;)
