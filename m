Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD3772600
	for <linux-sound@vger.kernel.org>; Tue,  6 May 2025 11:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746531213; cv=none; b=NttPd3ah0Sw2cWhCmX2/OsRd/sQ79WwaqCvIqDNjVbOEVC8TawXyRkM9mKiztqSqGAam5QsPX8AMi7qWzCmvl1Auoa0IzHc5qHB+d6JW7pWoLzFGiL14Tk0g3EHtkX5X7bdAcGgg5htvBwL1Oa7VNOG6ZVqgQvySNlJVOSgEVGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746531213; c=relaxed/simple;
	bh=J4H4XZRAY1HJ2nOSKo5F2EHvb+b8J/IEunzJ1KFu8/c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S8D+d5tlC0O4tyuA5LlhxmCugGW17+SQ2fKiBZ0+wkzwO2GuaXE1Mrmdc306ATUzjvnBf+1PFFcgNnya86DH2Mr+FrDnKoju5XZZr3oilBiFWbSHsZQTTWMrSRMnnF3aXvEm49ss9H/sXTPADgIy9KVxtHPATjVotejANbeWIMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VLwgZQah; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VLwgZQah"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746531213; x=1778067213;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=J4H4XZRAY1HJ2nOSKo5F2EHvb+b8J/IEunzJ1KFu8/c=;
  b=VLwgZQah6yzGoAY8KRFTVsB0U3XsrN0SSgU1gRgQHuZbhBkOmmboSiKs
   mbVbJGxYwlhTr7z2HAMhTFdWlW2qltuX3TSF6srQrTVGK3MDlJIwYFToZ
   xPbyFp8bhkPKy5vnE3nv/ab9GlWKoVxR0uE46xRoDGIvNgssyloSpKJG9
   UF4Bu9vl44f5RSSDQnzWSSgJE0m+uu3WQp5c4uX5yWEmZQdTMApkuXVCx
   aVe5azQKJYLp0sbI3i9ZNUhWN3XdQrntZymSIQI0VadO6GgY0e5qmZkD0
   sz2Uo7brievBKTA0+snBEEBaJou+DM6CbKrUHvtSI4XygXAAW6Xzo07zI
   w==;
X-CSE-ConnectionGUID: R7QLmjXvRtCkhN7cs+uNpQ==
X-CSE-MsgGUID: yB0RHwCETMGsXglXja+lKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="48101912"
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; 
   d="scan'208";a="48101912"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 04:33:33 -0700
X-CSE-ConnectionGUID: hE7pYimdRamN2g8hFuxc0A==
X-CSE-MsgGUID: 6TkpuNaKQIKteDkiy+ipKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; 
   d="scan'208";a="135478513"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.119.31])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 04:33:27 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 2/3] ASoC: SOF: set disable_function_topology if override_tplg_filename is set
Date: Tue,  6 May 2025 19:33:09 +0800
Message-ID: <20250506113311.45487-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250506113311.45487-1-yung-chuan.liao@linux.intel.com>
References: <20250506113311.45487-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

User will expect the specified topology is used when
override_tplg_filename is set. However, the using function topologies
feature may use the function topologies instead of the specified
topology.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/core.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index aed834d03e10..b11f408f1366 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -607,7 +607,8 @@ static void sof_probe_work(struct work_struct *work)
 }
 
 static void
-sof_apply_profile_override(struct sof_loadable_file_profile *path_override)
+sof_apply_profile_override(struct sof_loadable_file_profile *path_override,
+			   struct snd_sof_pdata *plat_data)
 {
 	if (override_ipc_type >= 0 && override_ipc_type < SOF_IPC_TYPE_COUNT)
 		path_override->ipc_type = override_ipc_type;
@@ -619,8 +620,11 @@ sof_apply_profile_override(struct sof_loadable_file_profile *path_override)
 		path_override->fw_lib_path = override_lib_path;
 	if (override_tplg_path)
 		path_override->tplg_path = override_tplg_path;
-	if (override_tplg_filename)
+	if (override_tplg_filename) {
 		path_override->tplg_name = override_tplg_filename;
+		/* User requested a specific topology file and expect it to be loaded */
+		plat_data->disable_function_topology = true;
+	}
 }
 
 int snd_sof_device_probe(struct device *dev, struct snd_sof_pdata *plat_data)
@@ -654,7 +658,7 @@ int snd_sof_device_probe(struct device *dev, struct snd_sof_pdata *plat_data)
 		}
 	}
 
-	sof_apply_profile_override(&plat_data->ipc_file_profile_base);
+	sof_apply_profile_override(&plat_data->ipc_file_profile_base, plat_data);
 
 	/* Initialize sof_ops based on the initial selected IPC version */
 	ret = sof_init_sof_ops(sdev);
-- 
2.43.0

