Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C2A17C6C
	for <linux-sound@vger.kernel.org>; Fri,  4 Oct 2024 03:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728010916; cv=none; b=HJeVGIbPiC54vY4aCrBcufUQiGsKoIs/8lCegmadxGF1y2Z9ol6ierDqhtwp36pcH/rsSXxpn5cr74opObB42YuYS7K0eiMUgVYobTLhoTjVspReBhWYyvVkwoROMx9Yo0REnCDIo6eDC+mVAiD5GOaTQ9WEbunq2pnNQu+gmy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728010916; c=relaxed/simple;
	bh=VQuNAS48TdOqIGuzPwP+0aXcK22dMBg7Br4Kzsn7ozM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WmP3m6Js9f3PslszCrj3o1l70Vw7c1jx5VeNqNSAXiD+TMrMgVi9pGMcdPwjoAe2KR0p3uqUXiOkGXxF6GFMDp7QxsRRLmmCC9PeqGUSAKXzhz+1LgInUFLz5CqYb5qXKTzppU6QED2J7sd7+JXmkdpdg+iNBli//Lv3W1uOrVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bOXrJx9V; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bOXrJx9V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728010915; x=1759546915;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VQuNAS48TdOqIGuzPwP+0aXcK22dMBg7Br4Kzsn7ozM=;
  b=bOXrJx9VaqOY7ONOb8Ay4XmMHc0TkXU0+jSJfW8rNm+NvPxv5Ke6TqBG
   Sv/s2mcA7f0yXfDEUOZ4E1XVOVpecDTQwsSrl3BcVGdusVcd6UYEamgH+
   SxZ+ABmFuM1ia4m0e5jTV155EuefoIajFW50pwyXQTJrbem4JIWd1w8jZ
   nRXXKfdU/djlt+9I0stvKYziKlRxMTZvvD60IxuCJC8HiplGEM6BBkXq8
   9sHCO1eM9wa+N3qoL8W0JNSQEU7pxUOD5jW6a4Vk6Ple4RK43zhZgu8AP
   COjyVWlZIGOoVM8XnJkWSpFz/qN0Xf++zuf5+tqHPjtbaFXTAlR0heqpR
   A==;
X-CSE-ConnectionGUID: X7wn009+S82SN9IrQ9EkDQ==
X-CSE-MsgGUID: /3kLJbhzTRCrCiUtsQ/ryw==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="27376720"
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; 
   d="scan'208";a="27376720"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 20:01:55 -0700
X-CSE-ConnectionGUID: BWjPh1GLSSyfU9KuJzL97Q==
X-CSE-MsgGUID: bRWVahboT/GGsYE9WPtrUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; 
   d="scan'208";a="74400732"
Received: from bvivekan-mobl2.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.118.16])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 20:01:52 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 2/2] ASoC: Intel: sof_rt5682: Add support for ptl_max98360a_rt5682
Date: Fri,  4 Oct 2024 11:01:34 +0800
Message-ID: <20241004030135.67968-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241004030135.67968-1-yung-chuan.liao@linux.intel.com>
References: <20241004030135.67968-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Dharageswari R <dharageswari.r@intel.com>

This patch adds the driver data for rt5682 codec on SSP0 and
max98360a speaker amplifiers on SSP1 for PTL platform.

Signed-off-by: Dharageswari R <dharageswari.r@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c               |  8 ++++++++
 sound/soc/intel/common/soc-acpi-intel-ptl-match.c | 13 +++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 866589fece7a..5ceb376d4924 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -884,6 +884,14 @@ static const struct platform_device_id board_ids[] = {
 					/* SSP 0 and SSP 2 are used for HDMI IN */
 					SOF_SSP_MASK_HDMI_CAPTURE(0x5)),
 	},
+	{
+		.name = "ptl_rt5682_def",
+		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
+					SOF_SSP_PORT_CODEC(0) |
+					SOF_SSP_PORT_AMP(1) |
+					SOF_SSP_PORT_BT_OFFLOAD(2) |
+					SOF_BT_OFFLOAD_PRESENT),
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, board_ids);
diff --git a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
index 90f97a44b607..61b16bc1ba8c 100644
--- a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
@@ -9,8 +9,21 @@
 #include <sound/soc-acpi.h>
 #include <sound/soc-acpi-intel-match.h>
 #include "soc-acpi-intel-sdw-mockup-match.h"
+#include <sound/soc-acpi-intel-ssp-common.h>
+
+static const struct snd_soc_acpi_codecs ptl_rt5682_rt5682s_hp = {
+	.num_codecs = 2,
+	.codecs = {RT5682_ACPI_HID, RT5682S_ACPI_HID},
+};
 
 struct snd_soc_acpi_mach snd_soc_acpi_intel_ptl_machines[] = {
+	{
+		.comp_ids = &ptl_rt5682_rt5682s_hp,
+		.drv_name = "ptl_rt5682_def",
+		.sof_tplg_filename = "sof-ptl", /* the tplg suffix is added at run time */
+		.tplg_quirk_mask = SND_SOC_ACPI_TPLG_INTEL_AMP_NAME |
+					SND_SOC_ACPI_TPLG_INTEL_CODEC_NAME,
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_ptl_machines);
-- 
2.43.0

