Received: from r3-175.sinamail.sina.com.cn (r3-175.sinamail.sina.com.cn [202.108.3.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546A138F923
	for <linux-sound@vger.kernel.org>; Mon, 20 Apr 2026 09:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776678281; cv=none; b=skpT4LZGjjO+v2m7RQ7U2kxNTMoHvjswL4ivDBDYYbCt8KMNgam4rBfg4nWjnWAofrc39kyXawLkdl3BSRPvZlf6i7PQC6CVSn2o7CkjsVmIDX/27cizg9WEnvL/GnYmOx3WbhcZjBu5o/SNiq9RcJ5yb4PTxZLA85HUYhN/oFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776678281; c=relaxed/simple;
	bh=Ou+u/9K7bnUYC8P8x50Ah1dx4NID2IYDDEaFgtYdf9U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=Tyirgl1voVw0Sxh3v3ibiJAyhuJgX2c+t7i2MGkWkrOG428uFl05HAuejTFvO7EWghoQVzriLF7TXNzp0K3AIuta8tqDmSRn8HCuleB9NVShcZ+yBc40Zzx+NzIVISABbuncT5f1HUko5OYclAEoNeMW61Fz0B7mW/TxdT46ygg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=202.108.3.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([180.154.36.64])
	by sina.net (10.54.253.38) with ESMTP
	id 69E5F5570000354E; Mon, 20 Apr 2026 17:43:57 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 486ADA5ADD2749F9AC2DDB9AE95C8A97
X-SMAIL-UIID: 486ADA5ADD2749F9AC2DDB9AE95C8A97-20260420-174357
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
Subject: [PATCH v9 5/5] ASoC: Intel: sof_sdw: add es9356 support
Date: Mon, 20 Apr 2026 17:43:49 +0800
Message-Id: <20260420094349.14197-6-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260420094349.14197-1-zhangyi@everest-semi.com>
References: <20260420094349.14197-1-zhangyi@everest-semi.com>
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

