Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D2622F02
	for <linux-sound@vger.kernel.org>; Tue, 13 Feb 2024 10:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707819195; cv=none; b=ADsgOtj6DwSlQoOf1M3GK9qmVsgbR16xTPzi2kTSdJk2NAZ2C6ulF1iWGGiAvQFUUXfgE/v6wJXojO2lQIIgt2rz6UU4BPgPYCSorgS/WPDQYt5znBjlJnyvqkV6TffInbTdk+NG/8vx/ZRJ+NF6GTfqMdLmojA1QXDknbCzk4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707819195; c=relaxed/simple;
	bh=1d/jqIWSDrJArl0vkhdCYFMFE0IBxGitoQXAXyKATMI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HobTR3zk58hQi8XizQ2a3uu1vhPcoypohQNRk96jsTOt2rf/Kg+SM0IAO723rZ3sK2+YJ4txOptKjgUyroxUi/sfjSVHIonvNLw0pKv460+GACxFgTG87nJKy0UsXKZ7sxnPsF2MshD62cCc1HZsrqMjk1tnhXNlg6JSlfN6ITQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U463Yt/l; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U463Yt/l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707819193; x=1739355193;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1d/jqIWSDrJArl0vkhdCYFMFE0IBxGitoQXAXyKATMI=;
  b=U463Yt/lp3LZ/bOy3f50EBH0wDYSVShEJ+vRp+LcTMQKZBbVYQ3BXWJm
   8t3fJZgEysCWP1GYJakFDjujjtAP59JjybafmvvF8GFUg9O+YZQ+VNdYV
   1aXK6u6WKgiQTZa+ZgJ7l/xwZdV/LiBAxEP2ORytpGinlnpQW0u1wMM0J
   OfW0ht9OxND1fCga3WFf7GoL6URhR8iq/jA4lqHRJd69hIOvHphrlRu6h
   2+OgZzSIP7WhhewlXERUBFFdGUQco6cSGJzbUNEcvMOl+PIO8pu9a4Iln
   CvfTA0THVNQTLF73aiWAEi8ccz/1SsWchv4CvqKLDUgA2cDaJMpuzQGdE
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="27260198"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="27260198"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 02:13:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="7498126"
Received: from dcoroian-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.249.42.253])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 02:13:11 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH 14/15] ASoC: SOF: Intel: lnl: Do not use LNL specific wrappers in DSPless mode
Date: Tue, 13 Feb 2024 12:12:46 +0200
Message-ID: <20240213101247.28887-15-peter.ujfalusi@linux.intel.com>
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

When DSPless mode is selected the DMIC/SSP offload status should not be
changed since the DSP is not in use.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/lnl.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/intel/lnl.c b/sound/soc/sof/intel/lnl.c
index b2ade2741dce..7ae017a00184 100644
--- a/sound/soc/sof/intel/lnl.c
+++ b/sound/soc/sof/intel/lnl.c
@@ -98,7 +98,8 @@ int sof_lnl_ops_init(struct snd_sof_dev *sdev)
 	memcpy(&sof_lnl_ops, &sof_hda_common_ops, sizeof(struct snd_sof_dsp_ops));
 
 	/* probe */
-	sof_lnl_ops.probe = lnl_hda_dsp_probe;
+	if (!sdev->dspless_mode_selected)
+		sof_lnl_ops.probe = lnl_hda_dsp_probe;
 
 	/* shutdown */
 	sof_lnl_ops.shutdown = hda_dsp_shutdown;
@@ -128,8 +129,10 @@ int sof_lnl_ops_init(struct snd_sof_dev *sdev)
 	/* TODO: add core_get and core_put */
 
 	/* PM */
-	sof_lnl_ops.resume			= lnl_hda_dsp_resume;
-	sof_lnl_ops.runtime_resume		= lnl_hda_dsp_runtime_resume;
+	if (!sdev->dspless_mode_selected) {
+		sof_lnl_ops.resume = lnl_hda_dsp_resume;
+		sof_lnl_ops.runtime_resume = lnl_hda_dsp_runtime_resume;
+	}
 
 	sof_lnl_ops.get_stream_position = mtl_dsp_get_stream_hda_link_position;
 
-- 
2.43.0

