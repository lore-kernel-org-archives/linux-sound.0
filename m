Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B462261A
	for <linux-sound@vger.kernel.org>; Tue, 13 Feb 2024 10:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707819166; cv=none; b=t3TfR+FQaJUem+TrXlVvjgZucIVVCmEJEP1g2WyQufF2yRkchW7fpy8Tl1dT0T7Jvbqg5bWpVBsDl0waU5VI0iObYJSd+1iysQawoGBMC0tulEXykJZ6CBrZzG5TQrdOS+FKwdvEmNsFWVPqZIBfLV2II0beVGmAm1h0U8Hm2eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707819166; c=relaxed/simple;
	bh=4oN+GMXmNF6JO/Mm79LF2II8GNHenABBjkT7XRLnOK4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qgt/f2z4UCdw8oF0WZeua2ho0HIMWwluEgpblGo2gfoazcUfwi3k9Mb7yMq8+oR7sjCz0aVwDgRZTixsV0LvXiHJH950vZX8RL5flFHDyqyOIZeyx2Bf4Ynh97SpYBzB15xUosYGwzsPjRSFl8ck8kyZH8v9ud/bcQcnLEzpYXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MPbuwXgJ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MPbuwXgJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707819164; x=1739355164;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4oN+GMXmNF6JO/Mm79LF2II8GNHenABBjkT7XRLnOK4=;
  b=MPbuwXgJ0/wPQElIvWMj3HRJM35D5zf+lC9ISKMxm5aVUMr3TEkdZ1D/
   /2/al15uqLnlm9yk5mez94N3y44qyEoN+mCCnZAqbJoG+rUhrnlfQwtXp
   LwKrua1IUcyK4y0WWgP5bnV+JnzoigWbjNvuv+OTyGpI/6AXUPyhaCQvz
   JGFKG8JRESLmFL4UpkF9mx8+foTtNBvhpqiCq7m0ANorvU1oR3MGPpJGu
   +YBthf0mioc9JjXzLleYFDlw1CRSMVP+uvWJ+dC246MUtz1aj4/tMpcVQ
   RCxyAHi8Vl35nWO+8FJfxQkLcvJ175X0J2o171kDvavB0KdfXrqxAT2Zg
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="27260152"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="27260152"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 02:12:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="7498015"
Received: from dcoroian-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.249.42.253])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 02:12:42 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH 02/15] ASoC: SOF: ops: add new 'is_chain_dma_supported' callback
Date: Tue, 13 Feb 2024 12:12:34 +0200
Message-ID: <20240213101247.28887-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213101247.28887-1-peter.ujfalusi@linux.intel.com>
References: <20240213101247.28887-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

IPC4 introduced a 'chain-dma' mode when host and link DMA are
connected by firmware without using a regular pipeline or the ability
to add intermediate connections. This mode is not available on all
platforms and all links, so add a platform-specific callback to help
the SOF ipc4-topology core handle different hardware+firmware
configurations.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ops.h      | 9 +++++++++
 sound/soc/sof/sof-priv.h | 2 ++
 2 files changed, 11 insertions(+)

diff --git a/sound/soc/sof/ops.h b/sound/soc/sof/ops.h
index 6538d9f4fe96..6cf21e829e07 100644
--- a/sound/soc/sof/ops.h
+++ b/sound/soc/sof/ops.h
@@ -567,6 +567,15 @@ snd_sof_set_mach_params(struct snd_soc_acpi_mach *mach,
 		sof_ops(sdev)->set_mach_params(mach, sdev);
 }
 
+static inline bool
+snd_sof_is_chain_dma_supported(struct snd_sof_dev *sdev, u32 dai_type)
+{
+	if (sof_ops(sdev) && sof_ops(sdev)->is_chain_dma_supported)
+		return sof_ops(sdev)->is_chain_dma_supported(sdev, dai_type);
+
+	return false;
+}
+
 /**
  * snd_sof_dsp_register_poll_timeout - Periodically poll an address
  * until a condition is met or a timeout occurs
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 6d7897bf9607..6c163c008607 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -338,6 +338,8 @@ struct snd_sof_dsp_ops {
 	struct snd_soc_dai_driver *drv;
 	int num_drv;
 
+	bool (*is_chain_dma_supported)(struct snd_sof_dev *sdev, u32 dai_type); /* optional */
+
 	/* ALSA HW info flags, will be stored in snd_pcm_runtime.hw.info */
 	u32 hw_info;
 
-- 
2.43.0

