Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7DFB156F5D
	for <linux-sound@vger.kernel.org>; Thu,  6 Mar 2025 14:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741269933; cv=none; b=AVM1drLsyeSg6MaPP+zAPegfY8x5pPRnh1NXzQDYnM45nox1hpMs0rcQnkkUhw1M5JrdFDD2a4rgHFWFIWygNCkMzmEecxrpLQjezk78Paogl7gcPrW/2c/6ewcTYmYGwp7tndoV4EKUQ8gI9VcBGp8fNUiUnjHyWzz1SzL2saQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741269933; c=relaxed/simple;
	bh=eSV3PtozHSAlgJ2C00YYOwr6H8hG/iqpvkJLlDwGZhs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=laEmYCG06m/Ksom84GdL8qfvzV8mtLqdKYptbkP4/iyDRJtzddRJkI0XC8NdXd5OJ8h6aAiUNxM/TNWJ6PRvnoAvQNqJPRrTOwIs08V721SUQyYW/mR8hneINoDnAdEtPvv1eeDhWe3s5U6scQjnAfaCNgg3G6wkviAwmVykuHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bq6cajvG; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bq6cajvG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741269932; x=1772805932;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=eSV3PtozHSAlgJ2C00YYOwr6H8hG/iqpvkJLlDwGZhs=;
  b=Bq6cajvG9Bde2ARXC/CGEvkfVGMExz9R1iT7h79hRbqe7A9UrZY2tM5T
   ATF1Z/kQsuKfW0KeaBMizuV3iNDKv7c9Z21zcZ5PaPtMeCNheO9Kf7u/M
   H6F3aw1ubJEjiNRnou61DE02xg9z++GbJN3OyumSivvqLrOmkmLur/4WP
   EkUzY+bkr5nWu/aMM7eLxqaK6+ifQZkU/1qsLBxvSK/cV5GQ09uX0Xm2u
   rvQC6DMeap3SHFFnb+8qqW55bZ/95ct0RvicE3ijvMc1HFlagmLkT2NDO
   Al60HE/oj9//aTTEdJ9eej57NoGM2mLmAx5LTZCKMAD9IoGY+Pgfo0fHo
   A==;
X-CSE-ConnectionGUID: SVpSswHJSx+t53Wsv04uwQ==
X-CSE-MsgGUID: 16V7kdVRS4afyb0YMbEjxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="46048699"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; 
   d="scan'208";a="46048699"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 06:05:31 -0800
X-CSE-ConnectionGUID: xRv7Wfp1R6emY8Sksdtv5Q==
X-CSE-MsgGUID: OFRGuB2HRfulMpzsgSzuIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; 
   d="scan'208";a="124044405"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.8.107]) ([10.94.8.107])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 06:05:28 -0800
Message-ID: <2eabbadd-e433-456f-a744-4dc9c843c051@linux.intel.com>
Date: Thu, 6 Mar 2025 15:05:25 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] ASoC: SOF: Intel: ptl: Add support for mic privacy
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, lgirdwood@gmail.com,
 broonie@kernel.org
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.dev, liam.r.girdwood@intel.com
References: <20250306133527.16722-1-peter.ujfalusi@linux.intel.com>
 <20250306133527.16722-9-peter.ujfalusi@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20250306133527.16722-9-peter.ujfalusi@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/6/2025 2:35 PM, Peter Ujfalusi wrote:
> Implement the three callbacks that is needed to enable support for
> reporting the mic privacy change via soundwire.
> 
> In PTL the mic privacy reporting is supported via soundwire and DMIC and
> the soundwire is owned by the host, it's interrupt is routed there.
> 
> To enable the interrupt, the sublink mask needs to be passed to the
> multilink layer, the check_mic_privacy_irq/process_mic_privacy callbacks
> needs to be implemented to check and report the mic privacy change.
> 
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
> Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> ---
>   sound/soc/sof/intel/ptl.c | 58 +++++++++++++++++++++++++++++++++++++--
>   sound/soc/sof/intel/ptl.h |  5 ++++
>   2 files changed, 61 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/sof/intel/ptl.c b/sound/soc/sof/intel/ptl.c
> index ae8e9e08ad2a..eeb86c228b2a 100644
> --- a/sound/soc/sof/intel/ptl.c
> +++ b/sound/soc/sof/intel/ptl.c
> @@ -18,10 +18,62 @@
>   #include "lnl.h"
>   #include "ptl.h"
>   
> -int sof_ptl_set_ops(struct snd_sof_dev *sdev, struct snd_sof_dsp_ops *dsp_ops)
> +static bool sof_ptl_check_mic_privacy_irq(struct snd_sof_dev *sdev, bool alt,
> +					  int elid)
> +{
> +	if (alt != 1 || elid != AZX_REG_ML_LEPTR_ID_SDW)

alt is bool, so let's be type aware and either "alt != true" or just "!alt"?

> +		return false;
> +
> +	return hdac_bus_eml_is_mic_privacy_changed(sof_to_bus(sdev), alt, elid);
> +}
> +
> +static void sof_ptl_process_mic_privacy(struct snd_sof_dev *sdev, bool alt,
> +					int elid)
> +{
> +	bool state;
> +
> +	if (alt != 1 || elid != AZX_REG_ML_LEPTR_ID_SDW)

same here

