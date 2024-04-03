Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CBAB1353E2
	for <linux-sound@vger.kernel.org>; Wed,  3 Apr 2024 11:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712143092; cv=none; b=PpFvlQDYmqDbLHueUwtoYT5cMwIdJAjv/+PxZDzWZnANwJhwhp8RrFhdomIYqA8MNYlLIjVCdO8HpFfn1cJQ/R7LTpvApk7UxNABrusPcOoj7dQCBZjrVBoq5SbWvr+uS8NYxhaV+aWhGRJm9N15Fn4B41L4xUQJBgUyOUUWB9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712143092; c=relaxed/simple;
	bh=U0YnkyqvKTmiWzp5ZiWHg30Zg5m4JdoP1HVDND8VNgY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PTNcjDWScExs7o2wIfdT38Fi4pbFXeKhj9Dk5jNYwUHXbkOnVF41UtjvLlGo0gp4vr+6R5j7997opBnxtQsBNeDpUlVc5QK+OlcS60tx+kvQ5U1DQqB0MMa2ukTChiehgzHpqX/T1TTgmcGZwO+6UoJxj5i7TbZM7HnZDcD09cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uapp6yGl; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uapp6yGl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712143090; x=1743679090;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=U0YnkyqvKTmiWzp5ZiWHg30Zg5m4JdoP1HVDND8VNgY=;
  b=Uapp6yGlWr0gvJGYfjneOztIIGNdhBcWY52zSfUClylgu6iCOOEu5Nwm
   2lHGChMt8/yXQttDH0tH1p3CyrR+4NhOLZGKNNx3ZS2553d1y5x8Cc8Zk
   sq2BnTiWXpUkuEQT4QhR6vEIr+ITFalpwJr2IQO6M9INq/0lN6pZGLSZZ
   FYG523djgdzjevTBm4pJYjWnZ4rTyUUGUj5fJZro3s2/RvfM6OwoJkao3
   71Z4n8DzLRPYF8WQ074LovQpHBglYj34gJQAcdHBlz3q2JhXq84KuQFNf
   jvhpDeGVVlW299EyYwZ6rm96q+NBadqnkeWnyW+6mQ/gRYYJ4noSa8FHQ
   w==;
X-CSE-ConnectionGUID: 4KoNA4TwS6GzV9LaQwSsAQ==
X-CSE-MsgGUID: FuZLN/XuTX6edrwt3t+FOw==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7237879"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="7237879"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 04:18:09 -0700
X-CSE-ConnectionGUID: vzPbm1TpQ9GmKFX0SPuejQ==
X-CSE-MsgGUID: 8QRUj10uQUKrqp+EcPyTmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="55861689"
Received: from aelgham-mobl2.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.249.35.133])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 04:18:07 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com
Subject: [PATCH] ASoC: SOF: Intel: lnl: Disable DMIC/SSP offload on remove
Date: Wed,  3 Apr 2024 14:18:39 +0300
Message-ID: <20240403111839.27259-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During probe the DMIC/SSP offload is enabled and it is not reversed on
remove.

Add a remove wrapper for LNL to disable the offload for DMIC and SSP
similarly to what is done during probe.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/lnl.c | 32 ++++++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/sound/soc/sof/intel/lnl.c b/sound/soc/sof/intel/lnl.c
index d1c73d407e68..aeb4350cce6b 100644
--- a/sound/soc/sof/intel/lnl.c
+++ b/sound/soc/sof/intel/lnl.c
@@ -29,15 +29,17 @@ static const struct snd_sof_debugfs_map lnl_dsp_debugfs[] = {
 };
 
 /* this helps allows the DSP to setup DMIC/SSP */
-static int hdac_bus_offload_dmic_ssp(struct hdac_bus *bus)
+static int hdac_bus_offload_dmic_ssp(struct hdac_bus *bus, bool enable)
 {
 	int ret;
 
-	ret = hdac_bus_eml_enable_offload(bus, true,  AZX_REG_ML_LEPTR_ID_INTEL_SSP, true);
+	ret = hdac_bus_eml_enable_offload(bus, true,
+					  AZX_REG_ML_LEPTR_ID_INTEL_SSP, enable);
 	if (ret < 0)
 		return ret;
 
-	ret = hdac_bus_eml_enable_offload(bus, true,  AZX_REG_ML_LEPTR_ID_INTEL_DMIC, true);
+	ret = hdac_bus_eml_enable_offload(bus, true,
+					  AZX_REG_ML_LEPTR_ID_INTEL_DMIC, enable);
 	if (ret < 0)
 		return ret;
 
@@ -52,7 +54,19 @@ static int lnl_hda_dsp_probe(struct snd_sof_dev *sdev)
 	if (ret < 0)
 		return ret;
 
-	return hdac_bus_offload_dmic_ssp(sof_to_bus(sdev));
+	return hdac_bus_offload_dmic_ssp(sof_to_bus(sdev), true);
+}
+
+static void lnl_hda_dsp_remove(struct snd_sof_dev *sdev)
+{
+	int ret;
+
+	ret = hdac_bus_offload_dmic_ssp(sof_to_bus(sdev), false);
+	if (ret < 0)
+		dev_warn(sdev->dev,
+			 "Failed to disable offload for DMIC/SSP: %d\n", ret);
+
+	hda_dsp_remove(sdev);
 }
 
 static int lnl_hda_dsp_resume(struct snd_sof_dev *sdev)
@@ -63,7 +77,7 @@ static int lnl_hda_dsp_resume(struct snd_sof_dev *sdev)
 	if (ret < 0)
 		return ret;
 
-	return hdac_bus_offload_dmic_ssp(sof_to_bus(sdev));
+	return hdac_bus_offload_dmic_ssp(sof_to_bus(sdev), true);
 }
 
 static int lnl_hda_dsp_runtime_resume(struct snd_sof_dev *sdev)
@@ -74,7 +88,7 @@ static int lnl_hda_dsp_runtime_resume(struct snd_sof_dev *sdev)
 	if (ret < 0)
 		return ret;
 
-	return hdac_bus_offload_dmic_ssp(sof_to_bus(sdev));
+	return hdac_bus_offload_dmic_ssp(sof_to_bus(sdev), true);
 }
 
 static int lnl_dsp_post_fw_run(struct snd_sof_dev *sdev)
@@ -97,9 +111,11 @@ int sof_lnl_ops_init(struct snd_sof_dev *sdev)
 	/* common defaults */
 	memcpy(&sof_lnl_ops, &sof_hda_common_ops, sizeof(struct snd_sof_dsp_ops));
 
-	/* probe */
-	if (!sdev->dspless_mode_selected)
+	/* probe/remove */
+	if (!sdev->dspless_mode_selected) {
 		sof_lnl_ops.probe = lnl_hda_dsp_probe;
+		sof_lnl_ops.remove = lnl_hda_dsp_remove;
+	}
 
 	/* shutdown */
 	sof_lnl_ops.shutdown = hda_dsp_shutdown;
-- 
2.44.0

