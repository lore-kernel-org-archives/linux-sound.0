Received: from smtp153-175.sina.com.cn (smtp153-175.sina.com.cn [61.135.153.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102DF29B8CF
	for <linux-sound@vger.kernel.org>; Thu, 19 Mar 2026 05:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773898851; cv=none; b=XsJuOgrf1tcxZ3Xg36enNTyZFSpLLmJzXV36BXozcd2sCGxwqHfDSb1/4tPXEGDcnLf5Jp2DGfggzLIrChdNOVsyYRbUJxrtEXmYk1JprZ6gg4L9WkMxdZEYiO7LWp3OMw9cqLZl1nN+gtKgmUNqOx+cN0gDVb1mUJ0Aam/o8u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773898851; c=relaxed/simple;
	bh=q3v4FX+kni9kx9asxCjKJjFyigtV9odcPDY+3tv6Or8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=B1h4Q21UsqNMCtCOur2CyCRkHGbG2b0AbxK4hILYPu8yytmo/zOv0/PV7GLGZxFN5j4kLjnnQrwOOr2O4ol5JpiGFqOyDDw+tV966pNr+9nxmp3HCcOOETOnTfri+vDhPUPpizsbuLa0KaYGIgOwTeDjKOVuI+vRlOH3Uux0Bq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=61.135.153.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([180.154.36.64])
	by sina.net (10.54.253.37) with ESMTP
	id 69BB8C3100002EA9; Thu, 19 Mar 2026 13:40:06 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 98AFA05966784585B9CC3246961873CD
X-SMAIL-UIID: 98AFA05966784585B9CC3246961873CD-20260319-134006
From: Zhang Yi <zhangyi@everest-semi.com>
To: broonie@kernel.org,
	tiwai@suse.com,
	linux-sound@vger.kernel.org
Cc: peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH v3 6/6] ASoC: Intel: sof_sdw: add es9356 support
Date: Thu, 19 Mar 2026 13:39:59 +0800
Message-Id: <20260319053959.9151-7-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260319053959.9151-1-zhangyi@everest-semi.com>
References: <20260319053959.9151-1-zhangyi@everest-semi.com>
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

