Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844CE75817
	for <linux-sound@vger.kernel.org>; Mon, 25 Mar 2024 22:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711404689; cv=none; b=DzNN3jluIi8TalOQo8TjZf3YCwOWRBw15hiQ7JyCEvHqN8sXvUh9hHkxTr3kMpTOl9T7JXPJCVxyplQQvE5jMRKdtzJBvjg3YPBYy/2plwn6f2nWC5oBzI2VQD1ZeG+pX7t4GISQLussFIaYAvZE89WC+8EqlF5YnYK0XkPvBVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711404689; c=relaxed/simple;
	bh=Ui4/pc3t6yv4LKYzMgDyXcmrAS0utPOVaM6bIzs2a80=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tEiR0z3ANUdIZTh9aq6QQ8FGCnZEr8T9T4PD/biHfWB1ounVl4w0ocfFgA0pEV1CSDLCtfhl+vq/bsvYj5wY3zJjt7q6xrPZUtpfzRX0AwJAO0bXIPFduIdEuxlxWU5ezwVjcHpehiIweVYiufuHgLzgxUcWSCNE+Wfq5DHFFjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d2esipM7; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d2esipM7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711404689; x=1742940689;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ui4/pc3t6yv4LKYzMgDyXcmrAS0utPOVaM6bIzs2a80=;
  b=d2esipM7oerF4gF5oNfXQmz3eLkB7rHhz4ksBNlrWVS8lW0bzNO9zWjR
   aCwXob9DvraoL9zKpRH5EaPw6lJIBylHfLDw07YfvyY+aGgcge88Hfq1v
   GXBqiokcI4t7DiWbRuFSl+oz8rG4AiDJrv088lVCsT3ofLC4iCP6+Hjpy
   g0WOFdcn+qBkJY0UwRtNeE05p5PbMo64/9CBvtGcKIQLYvdkNPlJsdE6F
   PHRZROb3lWyaLvRksaEdNwLHLottaRovudqNe64t/VFQMhjPibI39ppea
   KhTtF3henXx4+B+VRrtZ7Vg32V6JDMh/zJcW0s+KcD+5YIpsmaS/YgIVW
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6643688"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; 
   d="scan'208";a="6643688"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 15:11:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; 
   d="scan'208";a="15722178"
Received: from jaimbres-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.lan) ([10.212.98.109])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 15:11:26 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 19/21] ASoC: Intel: sof_ssp_amp: remove unnecessary idisp HDMI quirk
Date: Mon, 25 Mar 2024 17:10:57 -0500
Message-Id: <20240325221059.206042-20-pierre-louis.bossart@linux.intel.com>
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

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_ssp_amp.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/sound/soc/intel/boards/sof_ssp_amp.c b/sound/soc/intel/boards/sof_ssp_amp.c
index b99af8bc4ccc..206c9b723805 100644
--- a/sound/soc/intel/boards/sof_ssp_amp.c
+++ b/sound/soc/intel/boards/sof_ssp_amp.c
@@ -152,8 +152,8 @@ static int sof_ssp_amp_probe(struct platform_device *pdev)
 	case CODEC_CS35L41:
 		cs35l41_set_codec_conf(&sof_ssp_amp_card);
 		break;
+	case CODEC_RT1308:
 	case CODEC_NONE:
-	case CODEC_RT1308:
 		/* no codec conf required */
 		break;
 	default:
@@ -196,21 +196,18 @@ static const struct platform_device_id board_ids[] = {
 		.name = "adl_lt6911_hdmi_ssp",
 		.driver_data = (kernel_ulong_t)(SOF_SSP_MASK_HDMI_CAPTURE(0x5) |
 					/* SSP 0 and SSP 2 are used for HDMI IN */
-					SOF_NUM_IDISP_HDMI(3) |
 					SOF_HDMI_PLAYBACK_PRESENT),
 	},
 	{
 		.name = "rpl_lt6911_hdmi_ssp",
 		.driver_data = (kernel_ulong_t)(SOF_SSP_MASK_HDMI_CAPTURE(0x5) |
 					/* SSP 0 and SSP 2 are used for HDMI IN */
-					SOF_NUM_IDISP_HDMI(3) |
 					SOF_HDMI_PLAYBACK_PRESENT),
 	},
 	{
 		.name = "mtl_lt6911_hdmi_ssp",
 		.driver_data = (kernel_ulong_t)(SOF_SSP_MASK_HDMI_CAPTURE(0x5) |
 					/* SSP 0 and SSP 2 are used for HDMI IN */
-					SOF_NUM_IDISP_HDMI(3) |
 					SOF_HDMI_PLAYBACK_PRESENT),
 	},
 	{ }
-- 
2.40.1

