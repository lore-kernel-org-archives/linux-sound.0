Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F3A2040BF
	for <linux-sound@vger.kernel.org>; Mon, 16 Dec 2024 14:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734358115; cv=none; b=O/tW/ZL+/EkTJbdpGPlQ9N+grki02UVjJz4xjpZnWoB4+pLWCbm+TdZXeWnAPhOHWyx0+wsm5bZP0MxmeQ127DQzQ/LcDeYIZuwf39RtuutDTw3LyekH6gOQfHcHSFdxJaWVKFxH6N8OotcASdHDqC35M+W727VTCfaTSLIbIM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734358115; c=relaxed/simple;
	bh=FK1wX3mNul3AUjKOaVGcQ2RrtHxGcHQ3IXLF3NxxHa8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mv9/rK79Wze3u5tQyZbrxhmC/C38xcGf+NsEu7fdpFXcNI1neAj4fvNfKS6KKk/G7xdliVFpLahdYh66UKm/j5xH6xMVE+vvt9yJv+m2bHIpJYkxfdmtKt4sO2laUBU67aVvatpNgTORTdTGp+wa4z9haat8WNAroPlS3avRl1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TscMi/tX; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TscMi/tX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734358114; x=1765894114;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FK1wX3mNul3AUjKOaVGcQ2RrtHxGcHQ3IXLF3NxxHa8=;
  b=TscMi/tXoVN+EUsiNvJj03zO2GY6hs04rShSDKze3ARqhXe/6bXwYLeJ
   4wdj8ZiXOilDz23ITyzfR4DVe/+r0RAWrhylVCwWXviPFSfwv0pFfrzUx
   qqmlomUC3cG3xl8aMSTwsdpMnHa0UGg1dKWUx+fvA3CYTHEXGfZAoWNln
   jHut9DxzRJQfiDlPoGOM7TyIOes3bgnWgSDdN9qTZWRmKepgZrUehO5up
   zjbCuoQbWBJjSaZOcfmFThpRZqZIGVlfR+BhStjJaYsyv6c+pwy29eHkT
   UqRzG89WxyNwX9jYoFMdQp9eMQ4pjdRkVh5GmkFGyn+3eXm8ZoAan7uJ1
   Q==;
X-CSE-ConnectionGUID: GupeG3u2Qu+Llkmlg9ZHcw==
X-CSE-MsgGUID: CaSGYhSMT+OKJHJ+N5VlAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="34063287"
X-IronPort-AV: E=Sophos;i="6.12,238,1728975600"; 
   d="scan'208";a="34063287"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 06:08:34 -0800
X-CSE-ConnectionGUID: eQA01NvgQGq+VUxivF9OjQ==
X-CSE-MsgGUID: I/RHoTfrSeGjft8SKRJnAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,238,1728975600"; 
   d="scan'208";a="97446896"
Received: from spandruv-mobl4.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.223.238])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 06:08:32 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH v2 1/2] ASoC: Intel: sof_sdw: Fix DMI match for Lenovo 21Q6 and 21Q7
Date: Mon, 16 Dec 2024 22:08:20 +0800
Message-ID: <20241216140821.153670-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241216140821.153670-1-yung-chuan.liao@linux.intel.com>
References: <20241216140821.153670-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Fitzgerald <rf@opensource.cirrus.com>

Update the DMI match for a Lenovo laptop to the new DMI identifier.

This laptop ships with a different DMI identifier to what was expected,
and now has two identifiers.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Fixes: 83c062ae81e8 ("ASoC: Intel: sof_sdw: Add quirks for some new Lenovo laptops")
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 53410fb44673..139f4306dc87 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -646,9 +646,17 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 		.callback = sof_sdw_quirk_cb,
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
-			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "233B")
+			DMI_MATCH(DMI_PRODUCT_NAME, "21Q6")
 		},
-		.driver_data = (void *)(SOC_SDW_SIDECAR_AMPS),
+		.driver_data = (void *)(SOC_SDW_SIDECAR_AMPS | SOC_SDW_CODEC_MIC),
+	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "21Q7")
+		},
+		.driver_data = (void *)(SOC_SDW_SIDECAR_AMPS | SOC_SDW_CODEC_MIC),
 	},
 
 	/* ArrowLake devices */
-- 
2.43.0

