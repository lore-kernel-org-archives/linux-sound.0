Received: from r3-57.sinamail.sina.com.cn (r3-57.sinamail.sina.com.cn [202.108.3.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A76632E743
	for <linux-sound@vger.kernel.org>; Sat,  9 May 2026 10:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778321623; cv=none; b=iWKMyuLot6RCjxQp61FxDNpSF3FVfBxWdqYFY4OyNDa6vYF8ipS97y6qiIetV0YSPx+Z0WIgmM/8YaLQ2lfFIvOJ8nMvrTdeQtYQ4dzc9c8h4VdGOqErDEVBeQUfb4DO4O/ZvFcnMYiWT84AH91uMALjstL96WdHbPtb6tvJfrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778321623; c=relaxed/simple;
	bh=Ou+u/9K7bnUYC8P8x50Ah1dx4NID2IYDDEaFgtYdf9U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=bJoBqLKgM1KVSspf6FmaVy9KQAVYyeU52ZDv/yMuCKGkwnq974HVBOYjQ320LTOw7LE4A0VrTfNAcIS71oKzSJpUBKWIcNoyDmz1BUGtaqXwdJKLf2xRj4atBVjDNGVerai01UBD1GDfxYtJn41pxIDyQrqDQLGbpMQZNwKw+00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=202.108.3.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.36) with ESMTP
	id 69FF08380000082F; Sat, 9 May 2026 18:11:11 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 1EA94AC5ABDB44D7B04BB15B94D2225A
X-SMAIL-UIID: 1EA94AC5ABDB44D7B04BB15B94D2225A-20260509-181111
From: Zhang Yi <zhangyi@everest-semi.com>
To: broonie@kernel.org,
	tiwai@suse.com,
	linux-sound@vger.kernel.org
Cc: peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ckeepax@opensource.cirrus.com,
	vkoul@kernel.org,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH v12 5/6] ASoC: Intel: sof_sdw: add es9356 support
Date: Sat,  9 May 2026 18:11:01 +0800
Message-Id: <20260509101102.10286-6-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260509101102.10286-1-zhangyi@everest-semi.com>
References: <20260509101102.10286-1-zhangyi@everest-semi.com>
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

