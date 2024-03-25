Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5073173509
	for <linux-sound@vger.kernel.org>; Mon, 25 Mar 2024 22:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711404682; cv=none; b=f/hnAp0Hf1GMSOZS+okTMYjjIrBiOsiEXuGEJIwFFiqhwttxVEtQVYgCOmqSbILf3Qiy7y8y+kv++aucEe+rb3i9xQc33rZ5IYhpEhmBTRgQt6fB3LvhWJYJGrQ4OOsR32pKnqw1xuQ5wQ3gh20uYAAoh4wR8Fk9YnRb/4iB88Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711404682; c=relaxed/simple;
	bh=5xGjb3mnu+FiI3TfVRyt07oE/7KWxZ54qwPqhihYzu4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=W0L+rjH3RMvh4BdVVbH5gfjVvwhiIA4not0YQmkxBJsyYyGAR3WHW0+EFWCK5NC1KUPJQsMLsMNR/KTmW+d0chXYOfzSiWSAhIOzED0wglpUPjbqYQQHF0cNckUCF5fbX3ZKe3YakICa8HEBuYIu8fDlY1xYyBf9nZ/a+lgatp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dasPDMP2; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dasPDMP2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711404682; x=1742940682;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5xGjb3mnu+FiI3TfVRyt07oE/7KWxZ54qwPqhihYzu4=;
  b=dasPDMP2i92T5QotaVoynNOTF7Fcpkb80/fyQEKEOHVurscO7CuC5mU3
   vmPRxhExTjr/nVBbEBISclatWoa1xo5dRNbP1gqHj74zOlIZhMnbFi3J0
   k6ZgB2ns/XGN/lUfEvUYRzfZCK4XG/clURv48dPqCQRW6WZwOKCYtmOHS
   fzGbx27LuRu+IwDjqhKFFTrQtYwPdICie1VKm8kUno4eEbx303vmKLM0p
   28qdRtDfQXsMEZ8TxLfTjAOVD0y0acNfb4msNwYwwGdXjrVPWADWZ6KrN
   Kzb9/hx0vvQqHbROc3jfuSaouVkAWJ/aKvOwEJsyUpv4MRhcS2PugFiiz
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6643626"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; 
   d="scan'208";a="6643626"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 15:11:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; 
   d="scan'208";a="15722111"
Received: from jaimbres-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.lan) ([10.212.98.109])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 15:11:18 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 06/21] ASoC: Intel: sof_cs42l42: rename BT offload quirk
Date: Mon, 25 Mar 2024 17:10:44 -0500
Message-Id: <20240325221059.206042-7-pierre-louis.bossart@linux.intel.com>
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

Rename the quirk in preparation for future changes: common quriks will
be defined and handled in board helper module.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_cs42l42.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/boards/sof_cs42l42.c b/sound/soc/intel/boards/sof_cs42l42.c
index 323b86c42ef9..330d596b2eb6 100644
--- a/sound/soc/intel/boards/sof_cs42l42.c
+++ b/sound/soc/intel/boards/sof_cs42l42.c
@@ -34,7 +34,7 @@
 #define SOF_CS42L42_NUM_HDMIDEV_MASK		(GENMASK(9, 7))
 #define SOF_CS42L42_NUM_HDMIDEV(quirk)	\
 	(((quirk) << SOF_CS42L42_NUM_HDMIDEV_SHIFT) & SOF_CS42L42_NUM_HDMIDEV_MASK)
-#define SOF_BT_OFFLOAD_PRESENT			BIT(25)
+#define SOF_CS42L42_BT_OFFLOAD_PRESENT		BIT(25)
 #define SOF_CS42L42_SSP_BT_SHIFT		26
 #define SOF_CS42L42_SSP_BT_MASK			(GENMASK(28, 26))
 #define SOF_CS42L42_SSP_BT(quirk)	\
@@ -268,7 +268,7 @@ static int sof_audio_probe(struct platform_device *pdev)
 
 	ctx->ssp_codec = sof_cs42l42_quirk & SOF_CS42L42_SSP_CODEC_MASK;
 
-	if (sof_cs42l42_quirk & SOF_BT_OFFLOAD_PRESENT)
+	if (sof_cs42l42_quirk & SOF_CS42L42_BT_OFFLOAD_PRESENT)
 		ctx->bt_offload_present = true;
 
 	/* update dai_link */
@@ -306,7 +306,7 @@ static const struct platform_device_id board_ids[] = {
 		.driver_data = (kernel_ulong_t)(SOF_CS42L42_SSP_CODEC(0) |
 				SOF_CS42L42_SSP_AMP(1) |
 				SOF_CS42L42_NUM_HDMIDEV(4) |
-				SOF_BT_OFFLOAD_PRESENT |
+				SOF_CS42L42_BT_OFFLOAD_PRESENT |
 				SOF_CS42L42_SSP_BT(2)),
 	},
 	{ }
-- 
2.40.1

