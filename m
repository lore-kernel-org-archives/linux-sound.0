Received: from r3-82.sinamail.sina.com.cn (r3-82.sinamail.sina.com.cn [202.108.3.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F72A1A6807
	for <linux-sound@vger.kernel.org>; Thu,  9 Apr 2026 02:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775700931; cv=none; b=Xm3VZ7lUhBemRnluH6Fvdtvlkh8y84dXkTEuTLgpjuAXqttTz2BG+QuEhlpqwVAxzj15+gQDFjQROvw7vTSpdBjxTKcvwBkkZyTLIJmEdNlV95yVT+4BnfWGJcyg43Ee1LjpkGmsQQCqzAEyiuB0C8cILq3ZhnVkVCCZXXEj6Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775700931; c=relaxed/simple;
	bh=Ou+u/9K7bnUYC8P8x50Ah1dx4NID2IYDDEaFgtYdf9U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=okH+umsYt/Ya7+v23TdjTCaWMwfJ8C1ri96LTgGACSlC6MlZGWMxi/w9MC00+YUtMCOLFeN0ueaeu75Y9OlbEd20Ke6plzzbXFFZ6bZYP7+oCRhGJQqhjrWbi9kpHDZocIUsAuxyCpo5OoBwiR+KOKeIDbwVoLNHyB2+2K2iSkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=202.108.3.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([180.154.36.64])
	by sina.net (10.54.253.37) with ESMTP
	id 69D70B2A00005E49; Thu, 9 Apr 2026 10:13:03 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 3B76B706A9A94F848876CE0C3CA9C22E
X-SMAIL-UIID: 3B76B706A9A94F848876CE0C3CA9C22E-20260409-101303
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
Subject: [PATCH v6 5/5] ASoC: Intel: sof_sdw: add es9356 support
Date: Thu,  9 Apr 2026 10:12:55 +0800
Message-Id: <20260409021255.1006-6-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260409021255.1006-1-zhangyi@everest-semi.com>
References: <20260409021255.1006-1-zhangyi@everest-semi.com>
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

