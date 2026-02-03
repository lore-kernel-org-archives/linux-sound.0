Received: from mail78-39.sinamail.sina.com.cn (mail78-39.sinamail.sina.com.cn [219.142.78.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C73367F21
	for <linux-sound@vger.kernel.org>; Tue,  3 Feb 2026 05:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=219.142.78.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770096306; cv=none; b=aI7BtnSqUcC44LZI9O5m2YHUBojw/OSu0xemvsg++Rl5Pw1A1k54J8KocfYDpa5+q6XkKFx90ZIsYuO3C8SZLRmE05fsgQqzYF1srYrVYv2Zfo4byrp8QUEIYGKhu1pqSlyo29L1bGArVWDBi5HoaLwdvTQdzVcnWZDdfvDhtRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770096306; c=relaxed/simple;
	bh=q3v4FX+kni9kx9asxCjKJjFyigtV9odcPDY+3tv6Or8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=SHPTkU6XK5bgfDBMZZYZUieVW49DfSSB6n4Mr/K59RS1aal3ufhyJSl2+XPCV9uZHfH3DdbAPkZ5Q8hRY+DnirztgfTEbHcAJlVLwcg08WEzJZ2EFaxDbq6ZGcaH0p5oorahP4PJdm3il6qiELuTPyXZ3eCItJ3jHlouL4vJ4Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=219.142.78.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([180.154.36.64])
	by sina.net (10.185.250.31) with ESMTP
	id 6981867B00003F3F; Tue, 3 Feb 2026 13:24:25 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: EEDFE5D85D564532B7246DF12F7090CF
X-SMAIL-UIID: EEDFE5D85D564532B7246DF12F7090CF-20260203-132425
From: Zhang Yi <zhangyi@everest-semi.com>
To: broonie@kernel.org,
	tiwai@suse.com,
	linux-sound@vger.kernel.org
Cc: peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH 6/6] ASoC: Intel: sof_sdw: add es9356 support
Date: Tue,  3 Feb 2026 13:24:06 +0800
Message-Id: <20260203052406.28562-7-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260203052406.28562-1-zhangyi@everest-semi.com>
References: <20260203052406.28562-1-zhangyi@everest-semi.com>
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

