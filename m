Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5924573167
	for <linux-sound@vger.kernel.org>; Mon, 25 Mar 2024 22:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711404689; cv=none; b=jOmyFpZBa/qnOsfHnXLfh/If5REBIuLMMaKihU41BKmymFZ73/bL+0NFG2IstnBbIH9383GjUNO5ib7rzR5FXDghUZsKXoeT+xjyiRKtLpIIoPOHQkVa2+iWjuVcOyV2b9s+epoTD+Ada5K+5U9RqhpOt+++x8gOFkNlmMIgxZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711404689; c=relaxed/simple;
	bh=CQxyQOnKTfxFQMBIS3WgbGjfsWUDX6sFBeEw72agqH4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NJsfUTNjfBTUa2dMrvPWqYBmiYLnKxNYxNjvXOvQqTJs4UJql7pfpwf16zSdyBYiIjI1wtU5ByY6SVNfdN1dX9AUYXU6omXrn67bF1JcEUvnK/iQxf6g9BFKNkRzGyjKfAiFh2vGFVLPMmlZHk/681akXNkMKaQVkYtIJDUTiZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MMw8xsZ9; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MMw8xsZ9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711404689; x=1742940689;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CQxyQOnKTfxFQMBIS3WgbGjfsWUDX6sFBeEw72agqH4=;
  b=MMw8xsZ9POaU4bOzyzCp/yezir33k9MYmdMSKxXt0RcUYRHamkx1vAX3
   Wped1BET2Nx6NvPEYRWOQMUjRUNl2DsSPEHnifHaMOJ9am+QQT2DN0UU5
   NtCfge0nFlNjpX35yD0pkFFpjWudB/Ufwp2bOE7HGpEyieV+JaMJreSKp
   5XWB5PUKjcFHPWZ5pei1/rIsBhR0eItd3Cv2kbNSadPX70DDZbKEFW3Ix
   nlTCXzSdiJEOM66yxAJlMgVj2necMv8le+WTmo2ax6uRLt4NRwJuzo/gZ
   ZKzaU12jhoYm3JfDA/cTO7bNs3/FraZ71wStzhVEEmsQm6pQGJNTFV9/G
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6643683"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; 
   d="scan'208";a="6643683"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 15:11:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; 
   d="scan'208";a="15722174"
Received: from jaimbres-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.lan) ([10.212.98.109])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 15:11:26 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 18/21] ASoC: Intel: sof_rt5682: remove unnecessary idisp HDMI quirk
Date: Mon, 25 Mar 2024 17:10:56 -0500
Message-Id: <20240325221059.206042-19-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240325221059.206042-1-pierre-louis.bossart@linux.intel.com>
References: <20240325221059.206042-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Brent Lu <brent.lu@intel.com>

Remove SOF_NUM_IDISP_HDMI(3) from board quirks since the value is 3 if
not defined.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 672636f07456..f80fdbd8fdac 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -139,7 +139,6 @@ static const struct dmi_system_id sof_rt5682_quirk_table[] = {
 		.driver_data = (void *)(SOF_RT5682_MCLK_EN |
 					SOF_SSP_PORT_CODEC(2) |
 					SOF_SSP_PORT_AMP(0) |
-					SOF_NUM_IDISP_HDMI(3) |
 					SOF_SSP_PORT_BT_OFFLOAD(1) |
 					SOF_BT_OFFLOAD_PRESENT
 					),
@@ -692,11 +691,11 @@ static int sof_audio_probe(struct platform_device *pdev)
 	case CODEC_RT1015P:
 		sof_rt1015p_codec_conf(&sof_audio_card_rt5682);
 		break;
+	case CODEC_MAX98357A:
+	case CODEC_MAX98360A:
+	case CODEC_RT1019P:
+	case CODEC_RT5650:
 	case CODEC_NONE:
-	case CODEC_MAX98357A:
-	case CODEC_MAX98360A:
-	case CODEC_RT1019P:
-	case CODEC_RT5650:
 		/* no codec conf required */
 		break;
 	default:
@@ -763,7 +762,6 @@ static const struct platform_device_id board_ids[] = {
 		.name = "adl_rt5682_c1_h02",
 		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
 					SOF_SSP_PORT_CODEC(1) |
-					SOF_NUM_IDISP_HDMI(3) |
 					/* SSP 0 and SSP 2 are used for HDMI IN */
 					SOF_SSP_MASK_HDMI_CAPTURE(0x5)),
 	},
@@ -787,7 +785,6 @@ static const struct platform_device_id board_ids[] = {
 		.name = "rpl_rt5682_c1_h02",
 		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
 					SOF_SSP_PORT_CODEC(1) |
-					SOF_NUM_IDISP_HDMI(3) |
 					/* SSP 0 and SSP 2 are used for HDMI IN */
 					SOF_SSP_MASK_HDMI_CAPTURE(0x5)),
 	},
@@ -796,7 +793,6 @@ static const struct platform_device_id board_ids[] = {
 		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
 					SOF_SSP_PORT_CODEC(0) |
 					SOF_SSP_PORT_AMP(1) |
-					SOF_NUM_IDISP_HDMI(3) |
 					SOF_SSP_PORT_BT_OFFLOAD(2) |
 					SOF_BT_OFFLOAD_PRESENT),
 	},
@@ -804,15 +800,13 @@ static const struct platform_device_id board_ids[] = {
 		.name = "mtl_mx98360_rt5682",
 		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
 					SOF_SSP_PORT_CODEC(0) |
-					SOF_SSP_PORT_AMP(1) |
-					SOF_NUM_IDISP_HDMI(3)),
+					SOF_SSP_PORT_AMP(1)),
 	},
 	{
 		.name = "mtl_rt5682_def",
 		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
 					SOF_SSP_PORT_CODEC(2) |
 					SOF_SSP_PORT_AMP(0) |
-					SOF_NUM_IDISP_HDMI(3) |
 					SOF_SSP_PORT_BT_OFFLOAD(1) |
 					SOF_BT_OFFLOAD_PRESENT),
 	},
-- 
2.40.1

