Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1CA495052
	for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 14:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789050348; cv=none; b=BAPv7yVMgrK6+qRSWF8rOEEpm08Bd8+SFZNn9TJ+PRewFOYuf5N3BrIVCuaF8NcXfKYaZaxeSN7wKjlUPzAAgB6arp6IaGbWgVoDvvLM20jh/Wq7QFbjIYSSQJmXlLX7ZnxrFnSPpG+werRrzKpX03LrJ2bItskOI79ewbVc8XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789050348; c=relaxed/simple;
	bh=/WA5wfZn4OWICULNp8VaVEzu6Svdz9lWDw2aaA0Xjhc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=APtNwBKPDVqxEQGFLNSZ0iDee9QpRIFjBU1PF81pxCpF7ytUusJr8H5t+A8xIuMJYcwpsze3ILat6OOgj55HDsloVDJ/JPI6TdXG/4/tq95ntL2Z6uHh2PRNateDfSnRkJF1Dz17LOKbjW0xJ8UmOA84X8YhLiADh2mU8mHKqsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HuN0yAnq; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HuN0yAnq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789050347; x=1820586347;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=/WA5wfZn4OWICULNp8VaVEzu6Svdz9lWDw2aaA0Xjhc=;
  b=HuN0yAnqkmh2zXvzV2Kqa++QT3BByOOcRWJJEZOg8Awx7LvFxz5BfCU/
   6n0gFXavmeBTPtvO3bDTt8uedYXjbUwRMNzUCf9fJ/RojlhOcF0IzVYZL
   HawNtvXTBoG4vzkoD9aQwH8BaaUCAZsteZYR2sSI07KzZ4fwlkUHUUxVM
   trQb7uK2h0cTZf2NyNHCmjF/yIX/i5H2GvLIRoH1TiuW7z01+UinvIn8S
   Cp/Ni0wHZdZmb7u/kDwQDQ57L8E0Td+jMihNCCgbS4o0GbEmeaA/JIKa0
   prtWO4lhtZgjm06axK0U/M6Lz7He9etJhkvsgBGw6FfRZki+Z/s75VJZ5
   w==;
X-CSE-ConnectionGUID: cjUfmzSsRf+vdvON6Yxo3g==
X-CSE-MsgGUID: ykGfm5YhRQ28jx0zzI/XjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89531919"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="89531919"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 07:25:46 -0700
X-CSE-ConnectionGUID: hxo9HwISScmuLADjMwa0gQ==
X-CSE-MsgGUID: Wp6tgLF3Sba7VTYDtHA+sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="275182061"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.173]) ([10.245.245.173])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 07:25:43 -0700
Message-ID: <b13621fc-eb5b-4656-a7eb-07b0040e99bf@linux.intel.com>
Date: Thu, 10 Sep 2026 17:25:53 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/24] ASoC: SOF: ops: Add new platform-specific ops
 for compress
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, vkoul@kernel.org,
 perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com, broonie@kernel.org,
 srinivas.kandagatla@oss.qualcomm.com
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, daniel.baluta@nxp.com
References: <20260909090949.7503-1-peter.ujfalusi@linux.intel.com>
 <20260909090949.7503-14-peter.ujfalusi@linux.intel.com>
 <0522c051-600b-4038-aa7d-77b4121ab966@linux.dev>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Content-Language: en-US
In-Reply-To: <0522c051-600b-4038-aa7d-77b4121ab966@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 09/09/2026 17:23, Pierre-Louis Bossart wrote:
> On 9/9/26 11:09, Peter Ujfalusi wrote:
>> From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
>>
>> Add new ops in the struct snd_sof_ops for platform-specific ops for
>> compresssed streams. Also, define and set them for the HDA platforms.
>>
>> Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
>> Co-developed-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
>> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
>> Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
>> ---
>>  sound/soc/sof/intel/hda-common-ops.c |   8 ++
>>  sound/soc/sof/intel/hda-pcm.c        | 142 +++++++++++++++++++++++++++
>>  sound/soc/sof/intel/hda-stream.c     |  69 +++++++++----
>>  sound/soc/sof/intel/hda.h            |  15 +++
>>  sound/soc/sof/ops.h                  |  74 ++++++++++++++
>>  sound/soc/sof/sof-priv.h             |  12 +++
>>  6 files changed, 301 insertions(+), 19 deletions(-)
> 
> this is added 'too-early', there are additional changes in
> topology/timestamping that could be applied earlier. Maybe move later
> when actual IPC4 compressed support is added?
It depends on the definition of too-early, but sure, I can move it up
just before the ipc4-compress patch.
This actually marked the 'substance' patches in SOF territory to add the
compress support for IPC4.

-- 
Péter

