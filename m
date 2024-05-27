Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770D6160887
	for <linux-sound@vger.kernel.org>; Mon, 27 May 2024 19:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716838581; cv=none; b=HNWbqLB3LG/m7ECBwTM5ElZUCmOcN3CNk+b53vsAuKMKH1AmVc/xO7Q9B3J3/N/bnCdlAVvNvNBcvMCMoaSSJ/bY8c9Z5utLiobnWeld/sdl2YOgbKRCzB7jct3nzyO1HSRMIJzJdQpWS6Ts4sMRuP4eslebm6DrUo847iL8QVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716838581; c=relaxed/simple;
	bh=pT8b6UcO81biTjXtBIqTvq5DBJ9GY2SYfo6YadyiA1k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kJ8/JiwiEEozPdeKewFVAbuezcT4VXby+Cdk7c6gTvRwv0z7rCu7ouvNKWeJuZB0SvEiurYMIWlJP4BXD7ORsTya/Q0T95dtj7QMKRJ9sUVHRPwcHwcUPikX75n8Z3ydprz+VOMpvTWvNg+RBCjhxtdw8uOKAB9+k81vUDyJiFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z6V1faKX; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z6V1faKX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716838580; x=1748374580;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pT8b6UcO81biTjXtBIqTvq5DBJ9GY2SYfo6YadyiA1k=;
  b=Z6V1faKXSKZVodJAlPWIhtSHqquNrnDYTUhCQBBggAbjEeIOR64gDUkj
   XFPKuHHsD8VjxTBPjMrLA1d1cOunFv+Y1VdAMrZKPpXW4M45ajiUxps3A
   UFGvQ/k2AT36uLKno3J1ohO3pEx0U5tXnhVSCqwWoRNZ7tOj2cC0fZv9I
   lCzPqx1+6CiMSA9SXsXh9cQoSrZAueJtKk7gFH1OffHweqpVnGjqoiq5S
   D2tFFdOcyK0eyF1EseHJBZBAjRWz+7ROHPQEFfnifa528Knvenw377S5i
   OszVMWba+ZGOEm4CaNfZNa3iFZGZJqdNx/KZA14ZDmdwMdXb57Z26BnVz
   g==;
X-CSE-ConnectionGUID: IqmIOzmaT/W/KQ6/SpH8hQ==
X-CSE-MsgGUID: TPjdOv+nRYOa9fDxLaxy7A==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13339385"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="13339385"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 12:36:20 -0700
X-CSE-ConnectionGUID: ybOwgpdeRLafsIn1uiQ2dg==
X-CSE-MsgGUID: ceLCfibgSMaTf2xd0s1rYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="58029785"
Received: from unknown (HELO pbossart-mobl6.lan) ([10.125.110.221])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 12:36:19 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 14/18] ASoC: SOF: ipc3-topology: support tdm slot number query
Date: Mon, 27 May 2024 14:35:48 -0500
Message-ID: <20240527193552.165567-15-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240527193552.165567-1-pierre-louis.bossart@linux.intel.com>
References: <20240527193552.165567-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Brent Lu <brent.lu@intel.com>

Support the new parameter type SOF_DAI_PARAM_INTEL_SSP_TDM_SLOTS in
sof_ipc3_dai_get_param() function to get the tdm slot number of
specific SSP port.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/ipc3-topology.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/sof/ipc3-topology.c b/sound/soc/sof/ipc3-topology.c
index b68dea41cd95..be61e377e59e 100644
--- a/sound/soc/sof/ipc3-topology.c
+++ b/sound/soc/sof/ipc3-topology.c
@@ -2514,6 +2514,8 @@ static int sof_ipc3_dai_get_param(struct snd_sof_dev *sdev, struct snd_sof_dai *
 			return private->dai_config->ssp.mclk_rate;
 		case SOF_DAI_PARAM_INTEL_SSP_BCLK:
 			return private->dai_config->ssp.bclk_rate;
+		case SOF_DAI_PARAM_INTEL_SSP_TDM_SLOTS:
+			return private->dai_config->ssp.tdm_slots;
 		default:
 			dev_err(sdev->dev, "invalid SSP param %d\n", param_type);
 			break;
-- 
2.43.0

