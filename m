Received: from smtp153-183.sina.com.cn (smtp153-183.sina.com.cn [61.135.153.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20E11A9F87
	for <linux-sound@vger.kernel.org>; Fri, 10 Apr 2026 07:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775805902; cv=none; b=k6yFVDkPCXiAeRAFzLVe1eM3QkWOzOHPjejesxcLb69DxGaPsX5MNBcydFkTc7NALJPK7XoyChW0PSEEdLyvjcjrSGPtWee7BxVI7M3Y1ZTwte+qlK1ZDScFCFD8GFZPrLBvXdq4G4K90fAbXvKsGY43XoKDM+nH/lYu8GWCPPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775805902; c=relaxed/simple;
	bh=Ou+u/9K7bnUYC8P8x50Ah1dx4NID2IYDDEaFgtYdf9U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=blPZFw0cfh/zVrYNOL4FfmOjGyb2ZLQnOM0v4syku0CQIxDz9bMcCZFE47OHAk4Qi2NI73FZH67AZGmpYKcsIomB8poqIwv3+4kRVr9yUvAjEXVF2Jh9jCntrV29T73OMNJmqEfCevLVxIowItG4qPgK+AGoMmsMO+O6oZsWPXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=61.135.153.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([180.154.36.64])
	by sina.net (10.54.253.39) with ESMTP
	id 69D8A5BB00000BB0; Fri, 10 Apr 2026 15:24:51 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: F632E81FB8974EC3B7E35DCF011DBC73
X-SMAIL-UIID: F632E81FB8974EC3B7E35DCF011DBC73-20260410-152451
From: Zhang Yi <zhangyi@everest-semi.com>
To: broonie@kernel.org,
	tiwai@suse.com,
	linux-sound@vger.kernel.org
Cc: peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ckeepax@opensource.cirrus.com,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH v7 5/5] ASoC: Intel: sof_sdw: add es9356 support
Date: Fri, 10 Apr 2026 15:24:41 +0800
Message-Id: <20260410072441.6111-6-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260410072441.6111-1-zhangyi@everest-semi.com>
References: <20260410072441.6111-1-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

add Everest-semi ES9356 support

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
 sound/soc/intel/boards/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index d53af8f7e..cddbd2aa4 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -532,6 +532,7 @@ config SND_SOC_INTEL_SOUNDWIRE_SOF_MACH
 	select MFD_CS42L43_SDW
 	select SND_SOC_CS35L56_SPI
 	select SND_SOC_CS35L56_SDW
+	select SND_SOC_ES9356
 	select SND_SOC_DMIC
 	select SND_SOC_INTEL_HDA_DSP_COMMON
 	imply SND_SOC_SDW_MOCKUP
-- 
2.17.1

