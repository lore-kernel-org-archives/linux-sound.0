Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C138C387590
	for <linux-sound@vger.kernel.org>; Fri,  4 Sep 2026 07:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788507130; cv=none; b=tm5GIJGnXrX7LyZSYdv+6kH0SjrdMNz59iR4uwMBAa26LZL60RgfJb8JvLoZ8sNfqY4niLPEMf9B5X70gP3SNEBb+3MdqB8ji/UU3O3kscyd/wr+U7+pAZlkoXOQlUXD4mIU+e/ifTyHSwHSD+5wFkgf0/i1A5dszAHh81+veHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788507130; c=relaxed/simple;
	bh=21OSVs/XAzQ7uwFxTgoCG2fHzzbEB7F5tME5tLZdIMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xvs0plVW9Nh8Z2f1mgGmEW4EsvBE02ZTBnIjnijiZ+Y+WZtCuBcs2DyztL4yTVje6BF4lNovmH0YDaWdMRApN21o0PtP7YIPgbfh1qIuISBGTMEokIWI9n+0tGL0efvTv2xvzcrxaizh8i4uJFDSGddXELNAenmCoCgjYXL0g4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TCISEPX5; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TCISEPX5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788507129; x=1820043129;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=21OSVs/XAzQ7uwFxTgoCG2fHzzbEB7F5tME5tLZdIMQ=;
  b=TCISEPX5j7ZmgzoecMxQMXGjDlAGsG3wOwTf+jPSm5DyutCisMoYFAIh
   qosWEnSzNWPsStv8LV+mjcjYzS3gngzc2JwoprRldiHwZp2qBMQ2qjKPq
   TR2JbU1gNpD3A5RmsLdRBrvTrthF+99Pm57egJfESXqZXKUV1dHzks4CP
   XLVdtddXh4tM0wHDYMNenrTfZJ+cXxQUzNBx6UcY27mr2hSpR1MCld8Zi
   ym7i2yYinWljWENgb8Ly1cbUa/anoQbJYKMTqtKfcl4crUn6cJwSrvU4N
   8yD+DA9xkX6eMx/buOVLOujd4Lrx1yKbpdaIHzfzCSy1y829uiJxsdpyV
   g==;
X-CSE-ConnectionGUID: 1V/sd+nsQtyvvghloeEsPQ==
X-CSE-MsgGUID: pgIYmqpkQLaqaWPwlJqgZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="111777951"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="111777951"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 00:32:08 -0700
X-CSE-ConnectionGUID: 5T2fdYnNTCOL+YVOPjx96Q==
X-CSE-MsgGUID: okoLDx7QR72zrUXDgpuUcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="293480626"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.213])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 00:32:05 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: vkoul@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	srinivas.kandagatla@oss.qualcomm.com
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	daniel.baluta@nxp.com,
	Vijendar.Mukunda@amd.com
Subject: [PATCH 13/23] ASoC: SOF: ipc4: Add definition of module data in init_ext object type
Date: Fri,  4 Sep 2026 10:31:24 +0300
Message-ID: <20260904073134.29648-14-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260904073134.29648-1-peter.ujfalusi@linux.intel.com>
References: <20260904073134.29648-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SOF_IPC4_MOD_INIT_DATA_ID_MODULE_DATA type within the module_init_ext
area is module specific init data.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 include/sound/sof/ipc4/header.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/sound/sof/ipc4/header.h b/include/sound/sof/ipc4/header.h
index cea3d9453b84..e5161f0a37e8 100644
--- a/include/sound/sof/ipc4/header.h
+++ b/include/sound/sof/ipc4/header.h
@@ -706,7 +706,8 @@ struct sof_ipc4_module_init_ext_object {
 enum sof_ipc4_mod_init_ext_obj_id {
 	SOF_IPC4_MOD_INIT_DATA_ID_INVALID = 0,
 	SOF_IPC4_MOD_INIT_DATA_ID_DP_DATA,
-	SOF_IPC4_MOD_INIT_DATA_ID_MAX = SOF_IPC4_MOD_INIT_DATA_ID_DP_DATA,
+	SOF_IPC4_MOD_INIT_DATA_ID_MODULE_DATA,
+	SOF_IPC4_MOD_INIT_DATA_ID_MAX = SOF_IPC4_MOD_INIT_DATA_ID_MODULE_DATA,
 };
 
 /* DP module memory configuration data object for object array */
-- 
2.55.0

