Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C5D13BC1E
	for <linux-sound@vger.kernel.org>; Thu, 13 Jun 2024 07:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718263909; cv=none; b=VJef7DegVdWtOoZAdu5WiWUYXCN8To6ufRBk0e1uIjahu0xtqRY1xkphxYAs9rwn9vTKs6HYfJb99+wbEAZX44D34W/1xBE04PH+QOvfGg+O4j6gPNB/N76r4oFc8MIv1NmgyrTaQw1Snugj2pkDU7XGK5NxTy8k+CKCUhq2EZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718263909; c=relaxed/simple;
	bh=+uieUl4T0AiiG6OOna2b86fDGRMjAkpZ5je8upHdYZ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vByNqimAtTw5fFtGuwlksUIN6hY6MY0O9Esur3X/c6ml2Sg1jrIKn3ikEE762GlUdJdEii0clU/92lgqm/q9cC+bDvPCN1wzzGyCqB9Rre2FBcYceB3QRFlhA0AF7dERFqWX+BUth+OgGQa5iDwmUWUeuj2KMvy4IBM7Wb4hdYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NTOKvA5l; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NTOKvA5l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718263908; x=1749799908;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=+uieUl4T0AiiG6OOna2b86fDGRMjAkpZ5je8upHdYZ0=;
  b=NTOKvA5lS5M3hERsCS+8JHfrnrpzUlCpDjVUQp5rSQ1vUFe10RxDgU6I
   ZhlT62jhGKCNeMGUtlOiYvKYVpXLMmXKQQTSYv7/IuNLijdmR5yX3E1+2
   6Ag1K37mF45XuJu422FZS8R3jRgN0hZbta0Toes8xY1EWGIMgqrmnYT73
   4TLnJydatsjaJNFFkd+gO4hlpiqbPwdP73yAErWj2AtTHTKPRQTsMIXUH
   aEhgOSclaIK602HCXSGARO3Ov17GiMQecpVw7V5LRASeXweBZaVRyh1gr
   Rcx2NEb3V+eQRgyj6JCPoEDgs5fDJylpTWcigZTJJxDUncdqfxVZNpou7
   Q==;
X-CSE-ConnectionGUID: wdVo1pgdQOGjfAsZL3d6lQ==
X-CSE-MsgGUID: CS7joeo/SsujM/WmTxJhig==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="14940913"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="14940913"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 00:31:47 -0700
X-CSE-ConnectionGUID: rJkVczvGSpirDlIgiNYQaw==
X-CSE-MsgGUID: 532QuY2GSfufheKRKw+d9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="44436167"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.8.107]) ([10.94.8.107])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 00:31:44 -0700
Message-ID: <be6d9c07-1b26-408a-93ec-64fcbec73e80@linux.intel.com>
Date: Thu, 13 Jun 2024 09:31:42 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] ASoC: topology: Fix references to freed memory
Content-Language: en-US
To: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 Jason Montleon <jmontleo@redhat.com>
References: <20240603102818.36165-1-amadeuszx.slawinski@linux.intel.com>
 <20240603102818.36165-2-amadeuszx.slawinski@linux.intel.com>
 <507e9f6a-7113-4781-8a6d-27e4b87dbe24@linux.intel.com>
 <5bdae438-a976-44c0-b6d3-1aab5167a68e@linux.intel.com>
 <38d7b3e2-33cb-4a81-bad8-73c22679f49f@linux.intel.com>
 <750f8ab4-f283-44e0-9b6c-57176bdbf59e@linux.intel.com>
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <750f8ab4-f283-44e0-9b6c-57176bdbf59e@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/13/2024 8:44 AM, Péter Ujfalusi wrote:
> 
> On 13/06/2024 09:29, Péter Ujfalusi wrote:
>>>>> +		route->sink = devm_kmemdup(tplg->dev, elem->sink,
>>>>> +					   min(strlen(elem->sink), SNDRV_CTL_ELEM_ID_NAME_MAXLEN),
>>>
>>> Initially I did not see why this breaks, but then:
>>>
>>> The strlen() function calculates the length of the string pointed to by
>>> s, excluding the terminating null byte ('\0').
>>>
>>> Likely the fix is as simple as:
>>> min(strlen(elem->sink) + 1, SNDRV_CTL_ELEM_ID_NAME_MAXLEN)
>>
>> or better yet:
>> route->sink = devm_kasprintf(tplg->dev, GFP_KERNEL, "%s", elem->sink);
> 
> or even better:
> route->sink = devm_kstrdup(tplg->dev, elem->sink, GFP_KERNEL);
> 

I guess I might have overdid it a bit, let's go with devm_kstrdup for 
all of them, as it should just work unless someone tries to corrupt 
topology file.
