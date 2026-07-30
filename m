Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBACD42BEA3
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 12:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785414506; cv=none; b=O3drEuS4T32WJvBER9FK5fOkWkJ4c5tXqlKTOgl7DQGpIFQU9UNihLvE12jY3PMvzVeTQg3jh0eaWlQTvxwTWZn3u7Gu/kxlRRZdj8RNOLqD89d23B11IIu27TXCpt/Q8wXuHfeNXAFiV7b3mliJYWIi7HC1VHmgPKCcpS6ZlEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785414506; c=relaxed/simple;
	bh=2VmWP2YvG4ZJHChYqbx9+qV5K749W6MdOkhfInzcTzY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OaRkSu5JUyBeLilpGNUnell1jDBRee0qhkbXTJiNX3+naRKds5sXPGE9r62nb3Gbp52jPLOiGRnSSH8j19KQ30+nFAVcmUUhxgP8eCgzlT7UqromkBGqI/rv7glwuD8H96deVv3R/weuGrjOiBLMWAlMdRC33/yvBCfDTciSFcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CRboUMJ2; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CRboUMJ2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785414505; x=1816950505;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2VmWP2YvG4ZJHChYqbx9+qV5K749W6MdOkhfInzcTzY=;
  b=CRboUMJ2irVBTxPmDkmvKItKn1VtJcTJYchTP/der77S5oGopNX9+/6M
   +vb7VAYbnuILB77ek+gIdc23BkHcgvdjnsGM5fB4/K8mGrcuUnMHdcpw3
   GPO1tc8a8PHhkYDeYYxgdO9d3crYkh17NNq1UcwTEqnY+I9ZUmy/LjxdA
   HmBVGs20MkCVy0h3nDszGROo9Ji+QIzDitUSHdFfVljl1CQgccTmXd7bw
   7zBhqSrAsEyeKrd0n/KCxjanUney2RSdEhfHphTSDHhY7CktVeS3Jhuiq
   OgruuF9HU1DHgWCbWu7oH943rJ/SkWw6+Ch42Cy/zT3VD0QktBlH0rWdV
   Q==;
X-CSE-ConnectionGUID: 6M1vsLnATCKfkLMH1BX71g==
X-CSE-MsgGUID: p+RVn+pkQ5qDfXJdGSLYIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85158393"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="85158393"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 05:28:25 -0700
X-CSE-ConnectionGUID: t3XUfFSgTWyu1UIwu4Q1xw==
X-CSE-MsgGUID: /PbimPnbQ3C3r/0BSMp0QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="265340639"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.79])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 05:28:22 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	liam.r.girdwood@intel.com
Subject: [PATCH 1/2] ASoC: SOF: Intel: hda: Power down DSP if it is left enabled in pre_fw_run()
Date: Thu, 30 Jul 2026 15:28:56 +0300
Message-ID: <20260730122857.5294-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260730122857.5294-1-peter.ujfalusi@linux.intel.com>
References: <20260730122857.5294-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is expected that the DSP is in power down state when the firmware boot
is attempted.
If the DSP for any reason was left powered up then the DSP boot will
fail since the ROM boot sequence might not be able to run.

Make sure that the DSP is off before proceeding to boot it up.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 sound/soc/sof/intel/hda.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index dc85903b8d46..007a8e4a2f3d 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -421,6 +421,20 @@ static inline void hda_dsp_sdw_process_mic_privacy(struct snd_sof_dev *sdev) { }
 /* pre fw run operations */
 int hda_dsp_pre_fw_run(struct snd_sof_dev *sdev)
 {
+	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
+	const struct sof_intel_dsp_desc *chip = hda->desc;
+	int ret;
+
+	/* Power down DSP if left enabled to ensure a clean boot state. */
+	if (hda_dsp_core_is_enabled(sdev, chip->host_managed_cores_mask)) {
+		dev_dbg(sdev->dev, "DSP core enabled, power down DSP first\n");
+
+		ret = chip->power_down_dsp(sdev);
+		if (ret < 0)
+			dev_warn(sdev->dev,
+				 "%s: failed to power down already-enabled DSP\n", __func__);
+	}
+
 	/* disable clock gating and power gating */
 	return hda_dsp_ctrl_clock_power_gating(sdev, false);
 }
-- 
2.55.0

