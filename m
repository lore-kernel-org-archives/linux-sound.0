Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D93815FD04
	for <linux-sound@vger.kernel.org>; Mon, 27 May 2024 19:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716838578; cv=none; b=ZrqgIiJGU/UXxMkSR6AZBh4VkVMSuoal9aPQiMmXn+YnJUH7NI6t2t/vCHUVQpnnDZF4p124WR+WRpfrmKGeBvlE3n+WsYL3sJx2ZIYZSMXOOPS8kYL7lE3VN8jhUP5ZPGsnmguLq2rlBiRPYsCAnn6FlOa0aYa72QleRfaTH+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716838578; c=relaxed/simple;
	bh=Mbv5Pp+x3KBmrpNjxUEHHJN4Ju5oASOGYV2/ps+Ec/k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XaMpbWV4xlexndDh+YQ4KEPob1mAWpBrHMyf1JstdjVYWEGBlcp/fdQJqTwC/gSBEmRIA45BD8Cf8bLj7fA85Yj1eYjNOodlLF9DI9ip5PhViAc31SyU9aZD4+UHfT9O6OeNA2x/s9c8SVrbOhr5KbvLwPCLR1INCWu4fq+7GLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ApGa4ky7; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ApGa4ky7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716838577; x=1748374577;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Mbv5Pp+x3KBmrpNjxUEHHJN4Ju5oASOGYV2/ps+Ec/k=;
  b=ApGa4ky7rrTGnTm/plnofKmkmDDSYCEYpt1P2iOx9s1Br72c5WeAnHEH
   zKnALKVPJok7Z2F9IG37YpwrflMrGEIXkRzoVF1/xGO4pUBa0HL2uG13C
   aWqvRWCV43ksYLHSwXg/rITIJdTMTwFBtSB1ru9IrHoydHwB9WGrc68VI
   vkyuBot9y6FzJx1mV4VZRbxghgWUco+hHvzqjzZbKTDWGoQQWTEXQIQZF
   3GfFwDvjqNMWshsDSRK7p25/5BqqAmoxIX1MFpX3vtIJ3LRq46Hw3UJl5
   Tx7eBKWSs+/ADWQ0yUWZ6My6RtZD/MKJ2+Vt0hsr1lULiXL+lyp0MKNe5
   w==;
X-CSE-ConnectionGUID: weJ/dW+7SsenPnhITHpawA==
X-CSE-MsgGUID: vYq4IWsDRe2lWxRNYcMvUQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13339357"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="13339357"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 12:36:17 -0700
X-CSE-ConnectionGUID: 1xgFQ/loQvaF+L9zuifpMQ==
X-CSE-MsgGUID: i7UE2F61SVyfigCaYlDlzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="58029772"
Received: from unknown (HELO pbossart-mobl6.lan) ([10.125.110.221])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 12:36:16 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 10/18] ASoC: Intel: sof_sdw: Add quirks for some new Dell laptops
Date: Mon, 27 May 2024 14:35:44 -0500
Message-ID: <20240527193552.165567-11-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240527193552.165567-1-pierre-louis.bossart@linux.intel.com>
References: <20240527193552.165567-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Charles Keepax <ckeepax@opensource.cirrus.com>

Add quirks for some new Dell laptops using Cirrus amplifiers in a bridge
configuration.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 0516ae660824..b646b32dd311 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -505,6 +505,22 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 		},
 		.driver_data = (void *)(RT711_JD2),
 	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0CE3")
+		},
+		.driver_data = (void *)(SOF_SIDECAR_AMPS),
+	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0CE4")
+		},
+		.driver_data = (void *)(SOF_SIDECAR_AMPS),
+	},
 	{}
 };
 
-- 
2.43.0

