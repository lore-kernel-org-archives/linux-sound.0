Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6562773D3
	for <linux-sound@vger.kernel.org>; Fri, 19 Dec 2025 01:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766109509; cv=none; b=IbBCRoQO8s/KicLFq3LzkNDR4OOvni2y2f5lT2dkTtd479YdMfwHqy7phKtquX9r1BLVYxptH4Gm5SW7PwyRNK0PdNfXvF+FwDkYGCNY9YgWA5NFlwMx/zl8vOazIpN0byey9kZ4x+V2iX0tJdgIficP7tKPMta8K5dPWjeWdVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766109509; c=relaxed/simple;
	bh=7Iag5fk86ATm/ZFesHFU5D7xq+SppfoojKcWnyFlfuA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RZ84gCONotPgRTY41X99QyHDgjnlCDRd1Y/9Ccn9k2cRkgmTKCoSVtTJZoolE4nP2O9KIk+Fn37AyL5kZSsvTtHokCTnbykVDHK5QaIzXu9r8yb/cc+GXhbhZoKJN8NLmV6UHKosdsmI291W9FexUANL7Noxz5Nx6W9alystff8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DY0Bgew2; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DY0Bgew2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766109507; x=1797645507;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=7Iag5fk86ATm/ZFesHFU5D7xq+SppfoojKcWnyFlfuA=;
  b=DY0Bgew2h3ANe40zxkG9nn2HpJjuMWyDOtRWBfGOsMU9irBEzSjYpDZZ
   wDSSJQmZQS/eHvYgpaLfxIH19VeZEBPSK0YSqdqZUYWFDOPw+QrhtDNGI
   wbYt3aQE3BqRca50TbgAM8ZvnBVG+myRdnc+nYkC6AQXKjwBlEQJ8MIqa
   jy2YNUSJx6hewshwia+NVryIh4bUaQmcprI96X/j6IgpblXPgbV7mWIoL
   4qdg3XncGM0E/HbU0Oe80nTW4kD0WKRRWEk2g2w20+OJOgnnd69EZea6O
   4EOjAEg5Xi+FKnox8ZL2QSkgELO1ZOtwGyw0dcsE9w3/IiVzVHD5+gZ3b
   Q==;
X-CSE-ConnectionGUID: 4hp2FDZKT3qACoVY3PCMew==
X-CSE-MsgGUID: 9pyMibcRQ5+zwwgOM3vAnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="85658136"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="85658136"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 17:58:27 -0800
X-CSE-ConnectionGUID: gnKbiUinTrmlc2ox517xLQ==
X-CSE-MsgGUID: Lfy3ni4bSCODvooYff/wWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="229780360"
Received: from unknown (HELO [10.227.10.59]) ([10.227.10.59])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 17:58:23 -0800
Message-ID: <b2483cc9-d549-4c59-baa1-8dba8ebd6804@linux.intel.com>
Date: Fri, 19 Dec 2025 09:58:13 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] SDCA Jack Fixups
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
Cc: lgirdwood@gmail.com, vkoul@kernel.org, pierre-louis.bossart@linux.dev,
 peter.ujfalusi@linux.intel.com, shumingf@realtek.com,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com
References: <20251215153650.3913117-1-ckeepax@opensource.cirrus.com>
Content-Language: en-US
From: "Liao, Bard" <yung-chuan.liao@linux.intel.com>
In-Reply-To: <20251215153650.3913117-1-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/15/2025 11:36 PM, Charles Keepax wrote:
> Some fixups to the jack handling, adding some necessary hooks to connect
> things with the machine driver. I have split these out from the system
> suspend chain as that has been generating a fair amount of discussion
> and getting these 3 merged is far more important to get basic
> functionality working smoothly. I will do a spin of the system suspend
> stuff soon, if either no new comments pop up, or we reach some consensus
> on how to proceed.
> 
> Thanks,
> Charles

Looks good to me.
For the series:

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>

> 
> Charles Keepax (3):
>   ASoC: SDCA: Factor out jack handling into new c file
>   ASoC: SDCA: Add ability to connect SDCA jacks to ASoC jacks
>   ASoC: SDCA: Add ASoC jack hookup in class driver
> 
>  include/sound/sdca_jack.h            |  32 ++++
>  sound/soc/sdca/Makefile              |   2 +-
>  sound/soc/sdca/sdca_class_function.c |  13 ++
>  sound/soc/sdca/sdca_interrupts.c     |  83 +--------
>  sound/soc/sdca/sdca_jack.c           | 244 +++++++++++++++++++++++++++
>  5 files changed, 297 insertions(+), 77 deletions(-)
>  create mode 100644 include/sound/sdca_jack.h
>  create mode 100644 sound/soc/sdca/sdca_jack.c
> 

