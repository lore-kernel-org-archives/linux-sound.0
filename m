Received: from r3-47.sinamail.sina.com.cn (r3-47.sinamail.sina.com.cn [202.108.3.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7480938B7BB
	for <linux-sound@vger.kernel.org>; Thu, 26 Feb 2026 07:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772091499; cv=none; b=JwSqjfWLXczPR+jVmxQ5E6MYoCaIR6psNEQyJb9h+vE9y2Gd+1X9BPunkBFSK1AxhJYXqgajdmRd4VfFcPiEiDl/Pc51KuP5zZtLpqp1pfF4ve7hHhXZlkbYrYWv6blJNK6B0SfdiOOgzIAPG/d9DXPZJ703s8ziGqU3RC/4nD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772091499; c=relaxed/simple;
	bh=q3v4FX+kni9kx9asxCjKJjFyigtV9odcPDY+3tv6Or8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=bLCJOdlteU6iJ6UmcnNXnDLPcGEqo0HGojLo75HpvXPK+SQD484/meOH54eUElian6/8495Io8GhhIRGXoOEg6p4dHD8HpjefU+Oh540DHziP2WBeixPAPDDC4yPtids3C6hZF0xDnAZA3TbKNsOy40xIAA0emT5IMnTJKi1k30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=202.108.3.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([180.154.36.64])
	by sina.net (10.54.253.39) with ESMTP
	id 699FF7CB00003FE6; Thu, 26 Feb 2026 15:35:50 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 3B1101D1F11D4BAA92E5FB8C2FE66890
X-SMAIL-UIID: 3B1101D1F11D4BAA92E5FB8C2FE66890-20260226-153550
From: Zhang Yi <zhangyi@everest-semi.com>
To: broonie@kernel.org,
	tiwai@suse.com,
	linux-sound@vger.kernel.org
Cc: peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH v2 6/6] ASoC: Intel: sof_sdw: add es9356 support
Date: Thu, 26 Feb 2026 15:35:34 +0800
Message-Id: <20260226073534.3347-7-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260226073534.3347-1-zhangyi@everest-semi.com>
References: <20260226073534.3347-1-zhangyi@everest-semi.com>
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

