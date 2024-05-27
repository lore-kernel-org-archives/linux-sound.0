Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42532161306
	for <linux-sound@vger.kernel.org>; Mon, 27 May 2024 19:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716838582; cv=none; b=VFOe/SDepE0NkXguvDU+hIo+dvUKGknxWRlWfSlVtL1QBLHzF6OCWuVDwURYTB88yWIL8D81FDe4Vr1PUvEms2hBOeAl/1mYYPDYoqY3eFQ2xBoHpx7vPNvx1MHkvJ0VqqGBImfj6CHQ4QXaEru+3cAodR7XG+txQFY5FEjlP4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716838582; c=relaxed/simple;
	bh=TmJuRDSQp2fRkO+qt84U2YXpR8Orn462Xy6kPz0SgRc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lwfhYCuJoB1XCto44Cp4R11kSyhaZBVj55C/4vJ2pGxuFaLcffTdh4QjuLj2Jv4/tJFMRmEpmHtdAlrIUBX97NAe0xqudOpzYM0L1kXHLc52lqLMAg9WDGumTvUT85vqPElzsppeS1TfcIYa0oW1+isM7UMfVpRpYUIvUSsqhKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qn4DKXU1; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qn4DKXU1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716838581; x=1748374581;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TmJuRDSQp2fRkO+qt84U2YXpR8Orn462Xy6kPz0SgRc=;
  b=Qn4DKXU1bUcAQjNmTwkAzTG1yN7sre0mf19BBJNL2x+RYz2xdZ3LtI4C
   qlRmFMaFHaXtS5bAMVJEItIGLgY3HaTp8soqtq4qdS4jcRmNUNhnX9RwK
   Z17UdN/5lnRWTRwUHuxgNBd8D5sb4Xq10KEJShfxdCYjecYGv3fYPiuLS
   siU4VuT496DS+PE5LOcvuowLiM2AJER4slN3YaHOFu5A0XNdEUD7V7q/d
   QENozeoa+ge1zRBTERykV0ENYOBBqRZCK7jKlFPTI0NC8OO9NHMBbqKFF
   YZVQ02meoM22yVfB4yGTw7ckk8UMDq9d01sLwp5n7QUzOhTcP3i6QnAuD
   A==;
X-CSE-ConnectionGUID: grUXqa/QQTG9sG/W+MxXnA==
X-CSE-MsgGUID: GG05/x4pQruXJ0kR2GlwpQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13339391"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="13339391"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 12:36:21 -0700
X-CSE-ConnectionGUID: iZyAspuQS/ya86+gCyQHLA==
X-CSE-MsgGUID: +UoF/mOtQkiChc2Lm36tnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="58029789"
Received: from unknown (HELO pbossart-mobl6.lan) ([10.125.110.221])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 12:36:20 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 15/18] ASoC: SOF: ipc4-topology: support tdm slot number query
Date: Mon, 27 May 2024 14:35:49 -0500
Message-ID: <20240527193552.165567-16-pierre-louis.bossart@linux.intel.com>
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
sof_ipc4_dai_get_param() function to get the tdm slot number of
specific SSP port.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 67e34fd559f2..df4344f7d547 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -3174,6 +3174,8 @@ static int sof_ipc4_dai_get_param(struct snd_sof_dev *sdev, struct snd_sof_dai *
 			return le32_to_cpu(hw_config->mclk_rate);
 		case SOF_DAI_PARAM_INTEL_SSP_BCLK:
 			return le32_to_cpu(hw_config->bclk_rate);
+		case SOF_DAI_PARAM_INTEL_SSP_TDM_SLOTS:
+			return le32_to_cpu(hw_config->tdm_slots);
 		default:
 			dev_err(sdev->dev, "invalid SSP param %d\n", param_type);
 			break;
-- 
2.43.0

