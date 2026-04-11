Received: from r3-70.sinamail.sina.com.cn (r3-70.sinamail.sina.com.cn [202.108.3.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1FA24E4A1
	for <linux-sound@vger.kernel.org>; Sat, 11 Apr 2026 13:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775914086; cv=none; b=Lfedbji8KANdEHb0zeAT5gmAjX0eH+4nuZ6SyEBiTj621ZM7ExTS3zrKvP269ZEetx7XSFqSwoIH+tyATf2lhxu+zCU9KEkfcuGGWcUwT4jW63oYAqhsULdiDwtrtTtR0N5K4b057yGoY/AOm1uomX1Dg6Y/FA5E6IYzYZDejAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775914086; c=relaxed/simple;
	bh=Ou+u/9K7bnUYC8P8x50Ah1dx4NID2IYDDEaFgtYdf9U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=GGDoXgvK2UqQXsuazMwJ8X9eyCsrJ0+CaqfgcnO36MX6SqDVvCQYS5K6mz2cNXNSQlPrQPZSglOFLGC7xf5sUPUAq5aKzn8gAaNPlvF/iT3jqYScGS0jhW825E0BDcfp0htKuEx8aaVlZGpaxKuf94ZYY1elPOGu2EqV0CQFSps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=202.108.3.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([180.154.36.64])
	by sina.net (10.54.253.39) with ESMTP
	id 69DA4C5400006148; Sat, 11 Apr 2026 21:27:54 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 885C461F7B884FC08235E341E2F37A3B
X-SMAIL-UIID: 885C461F7B884FC08235E341E2F37A3B-20260411-212754
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
Subject: [PATCH v8 5/5] ASoC: Intel: sof_sdw: add es9356 support
Date: Sat, 11 Apr 2026 21:27:46 +0800
Message-Id: <20260411132746.8103-6-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260411132746.8103-1-zhangyi@everest-semi.com>
References: <20260411132746.8103-1-zhangyi@everest-semi.com>
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

