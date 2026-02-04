Received: from smtp153-183.sina.com.cn (smtp153-183.sina.com.cn [61.135.153.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6FD43B8BCC
	for <linux-sound@vger.kernel.org>; Wed,  4 Feb 2026 09:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770198339; cv=none; b=HEPt972jja50z/MG7T6dKzaNjobmykbWqCoBkJPAR8nuDxSgdJ3Ylsh8dYyk6QGtK+ctrM2dz+gZJvlwxEu3nlVaJc+WCcMUZzXNrgbjonbe+RSExekyF383XHS6LnLUiCQyQI2w5ThuFOumjZ02V5MLP0gzWU8H9kbN5/LxFzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770198339; c=relaxed/simple;
	bh=q3v4FX+kni9kx9asxCjKJjFyigtV9odcPDY+3tv6Or8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=dHNLunlKpLim1I7ORfnDpsHDgJWCtmWl6DIABwUzdUeGm1SOGPx+RJdO4EvDXFSHdUYB/hMmHybz+WCXKnolKDUdURVpTw4k0AKmNBgkAOyP1bX1eJR0KhvIJ0jj3R7TPow3bpsnRavrwmi7iD4AXkmsOgz1+eXfYeWbOPRyRRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=61.135.153.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([180.154.36.64])
	by sina.net (10.54.253.39) with ESMTP
	id 6983151500005B8A; Wed, 4 Feb 2026 17:44:58 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 9F47D87DADC842DF84ABE146ADEC419B
X-SMAIL-UIID: 9F47D87DADC842DF84ABE146ADEC419B-20260204-174458
From: Zhang Yi <zhangyi@everest-semi.com>
To: broonie@kernel.org,
	tiwai@suse.com,
	linux-sound@vger.kernel.org
Cc: peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH v1 6/6] ASoC: Intel: sof_sdw: add es9356 support
Date: Wed,  4 Feb 2026 17:44:52 +0800
Message-Id: <20260204094452.33289-7-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260204094452.33289-1-zhangyi@everest-semi.com>
References: <20260204094452.33289-1-zhangyi@everest-semi.com>
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
index c5942b565..ec327a751 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -534,6 +534,7 @@ config SND_SOC_INTEL_SOUNDWIRE_SOF_MACH
 	select SPI_CS42L43
 	select SND_SOC_CS35L56_SPI
 	select SND_SOC_CS35L56_SDW
+	select SND_SOC_ES9356
 	select SND_SOC_DMIC
 	select SND_SOC_INTEL_HDA_DSP_COMMON
 	imply SND_SOC_SDW_MOCKUP
-- 
2.17.1

