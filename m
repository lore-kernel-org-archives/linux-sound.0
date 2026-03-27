Received: from smtp153-182.sina.com.cn (smtp153-182.sina.com.cn [61.135.153.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C3823507C
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 10:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774605756; cv=none; b=bwIggV8u71dM/qBRYYFEWC8mHKeMyBsNMgF/AWVRmomt7RCuztTw2ea/+JMqwSje9SFeougsLem4QynpbpwWaOcSSbpOUSwE6kexWbePQCyVfLtw1kFCmItr9wwRzvmzGb+klpE+NECHDzXW1uiO6oD03EqEO1JKJ6BmeimhwSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774605756; c=relaxed/simple;
	bh=q3v4FX+kni9kx9asxCjKJjFyigtV9odcPDY+3tv6Or8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=oQccmb8Fg2UC4PllW0zwPq2evDwmPacWJf8ahEnUVj9sySTW3jqwGNxuW+me6dZJOAMRQNfpRa7kggeWrF8HeZq6RKLRWNA03Etsm0dsj0PJlrUllrr6S01vjRI7EkVOP9OBSkfYr+nmWIjMj+V87nB7OZ+PVBH9FnSSZiD8lwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=61.135.153.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([180.154.36.64])
	by sina.net (10.54.253.38) with ESMTP
	id 69C6551D000030E9; Fri, 27 Mar 2026 18:00:04 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 9B66BADB8CB3473AAD9F397FCE059CC3
X-SMAIL-UIID: 9B66BADB8CB3473AAD9F397FCE059CC3-20260327-180004
From: Zhang Yi <zhangyi@everest-semi.com>
To: broonie@kernel.org,
	tiwai@suse.com,
	linux-sound@vger.kernel.org
Cc: peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH v4 6/6] ASoC: Intel: sof_sdw: add es9356 support
Date: Fri, 27 Mar 2026 17:59:54 +0800
Message-Id: <20260327095954.3465-7-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260327095954.3465-1-zhangyi@everest-semi.com>
References: <20260327095954.3465-1-zhangyi@everest-semi.com>
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

