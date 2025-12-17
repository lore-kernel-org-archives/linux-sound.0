Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0DD2DAFA8
	for <linux-sound@vger.kernel.org>; Wed, 17 Dec 2025 11:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765969494; cv=none; b=cdBLzSLUxhSr/1MPkv65b+c5eQAzc4hXg7CrWwgbmQ1ozyqxUSs8kYjYozTHPU9TavWZf8QtzvcJ/vbIZzBb8xqDEa+h0E0KCJ3FJHG8MysLAWTA5H0kSIbCQZzxnYPDSd06/zQAtoPM93tfvbysP0YUxI0CHSBS2LQr+0EBjzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765969494; c=relaxed/simple;
	bh=TKsNtJ8WOW9NguFWDHZZECRMbCXdG20wPtZCVuNiJmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=abCARQTjFVr/ntWghvEVlZxBY7OUIOpQfY3PgaJX57FHbplJ5lq5GixWvONUHvA7geTnwdOgoJGTY8Ei8klCqbWaTs2S7giUlDEYRoLWsukDMPyQpY9D23iMv5DAGoRZ14vnrtCLnWolXVKg25YSBtb3F7u4yMi8xH5NUwPfJO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=no2dh+r9; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="no2dh+r9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765969493; x=1797505493;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TKsNtJ8WOW9NguFWDHZZECRMbCXdG20wPtZCVuNiJmQ=;
  b=no2dh+r9FVf16uB0LZKoZ0U3lbbPjwOmHt4GOo6y9xmdJlgZqqXvlpz+
   A/OvbQsoFGX7yjtev4LHMC+iuHB53uXVak7c/soi8ljNgKom59tcu8w6R
   nKvvYkijBkcDWPnFaCQej+URgXCb/9s5EpMNVa29A9IY5VOwCtjfQSP74
   XpW+biPXMgq6QPQIboxUjA/tcJE/GGrQymJcPxkGTEECst4JPCOW5J/Mi
   2t4HqtgIERwVGRfAOR6TpwoZ0yujjvP7yr2YMntbBrsaQW3k51ZxS+PZN
   Olu3TfdvUZ2LpxOkVrcnwtd0Fsmr4Ye83Fm0bQu5cVFm4cfq3ZmZz1fho
   w==;
X-CSE-ConnectionGUID: u+6bptg5RxujOVveTGXelQ==
X-CSE-MsgGUID: kT3FoUGfSAOdWdCn63VqOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="55476847"
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="55476847"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 03:04:52 -0800
X-CSE-ConnectionGUID: aToHa6H4RCqNUVChLmSHMw==
X-CSE-MsgGUID: 7f9BZv2oSaav8BOzCYxLLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="198765882"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 03:04:51 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 2/2] ASoC: Intel: sof_rt5682: add tas2563 speaker amp support
Date: Wed, 17 Dec 2025 19:04:32 +0800
Message-ID: <20251217110433.3558136-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251217110433.3558136-1-yung-chuan.liao@linux.intel.com>
References: <20251217110433.3558136-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: David Lin <david.lin@intel.com>

This patch adds tas2563 which supports the RT5682 headset codec
and TAS2563 speaker amplifier combination on PantherLake platform.

Signed-off-by: David Lin <david.lin@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/Kconfig      | 2 ++
 sound/soc/intel/boards/sof_rt5682.c | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 724064149906..c5942b5655d3 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -330,11 +330,13 @@ config SND_SOC_INTEL_SOF_RT5682_MACH
 	select SND_SOC_RT5645
 	select SND_SOC_RT5682_I2C
 	select SND_SOC_RT5682S
+	select SND_SOC_TAS2781_I2C
 	select SND_SOC_DMIC
 	select SND_SOC_INTEL_HDA_DSP_COMMON
 	select SND_SOC_INTEL_SOF_BOARD_HELPERS
 	select SND_SOC_INTEL_SOF_MAXIM_COMMON
 	select SND_SOC_INTEL_SOF_REALTEK_COMMON
+	select SND_SOC_INTEL_SOF_TI_COMMON
 	select SND_SOC_ACPI_INTEL_MATCH
 	help
 	   This adds support for ASoC machine driver for SOF platforms
diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 3d9d8a97d153..649378957b20 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -27,6 +27,7 @@
 #include "sof_board_helpers.h"
 #include "sof_maxim_common.h"
 #include "sof_realtek_common.h"
+#include "sof_ti_common.h"
 
 /* Driver-specific board quirks: from bit 0 to 7 */
 #define SOF_RT5682_MCLK_EN			BIT(0)
@@ -620,6 +621,9 @@ sof_card_dai_links_create(struct device *dev, struct snd_soc_card *card,
 		ctx->amp_link->init = rt5650_spk_init;
 		ctx->amp_link->ops = &sof_rt5682_ops;
 		break;
+	case CODEC_TAS2563:
+		sof_tas2563_dai_link(ctx->amp_link);
+		break;
 	default:
 		dev_err(dev, "invalid amp type %d\n", ctx->amp_type);
 		return -EINVAL;
@@ -767,6 +771,7 @@ static int sof_audio_probe(struct platform_device *pdev)
 	case CODEC_MAX98360A:
 	case CODEC_RT1019P:
 	case CODEC_RT5650:
+	case CODEC_TAS2563:
 	case CODEC_NONE:
 		/* no codec conf required */
 		break;
@@ -934,3 +939,4 @@ MODULE_LICENSE("GPL v2");
 MODULE_IMPORT_NS("SND_SOC_INTEL_SOF_BOARD_HELPERS");
 MODULE_IMPORT_NS("SND_SOC_INTEL_SOF_MAXIM_COMMON");
 MODULE_IMPORT_NS("SND_SOC_INTEL_SOF_REALTEK_COMMON");
+MODULE_IMPORT_NS("SND_SOC_INTEL_SOF_TI_COMMON");
-- 
2.43.0

