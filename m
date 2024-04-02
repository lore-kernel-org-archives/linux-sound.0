Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07AD131183
	for <linux-sound@vger.kernel.org>; Tue,  2 Apr 2024 15:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712071124; cv=none; b=eJqIO093FLmgEpg++/1/pL0Qml6oxzDBjjtzkp1y1bMomlOBUK2QkZeQhsbNupPeQgmGD+nqir99PiCyx0w8lV+RZzV+d7UTApFDjFDaVr8h04TeWBu01jWp6C7mMJtvs+zq4guIN0sl/G5ix9Na194jxEKXF3w5AyYPnEdaTgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712071124; c=relaxed/simple;
	bh=V7rz5s63A9o8cJPhHkQWErgH/uueldBVlqNFBEWk8+I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=j8QAJmdd6jNCmjxuSbnsOVLjn4wK0AUZ3o26KEJKV+OHPfNqgLLkNUo+m2F3sN8FY1p4uHUOJVbYoxqX41hlABBjV/jB3wN1tRGsimdLwxJsqHbf0Jw4+4GliJ01fwQ9QlQsKPZx6WE9dxeFO4lDVEPADwVoMZDHase3I55BSxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nJ6txlYH; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nJ6txlYH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712071123; x=1743607123;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=V7rz5s63A9o8cJPhHkQWErgH/uueldBVlqNFBEWk8+I=;
  b=nJ6txlYH+uIXBS+JhciyK6H1j35MQS4BKlIc32krvYqartRLCal00X2P
   eIRF/aPpenrlaFm05wUyfc89dnKkEdzkUoUC9Psvzw3/lhkUEq1Ed5Dwy
   +vz/xT99WpWQCzyI760x5hfwLbcr503i/0Fu8vMfXUidls/MzXHv08feC
   J0hwQuh5YUJSTWhielGJdFITepYSwgEFbo7kqVZqCjSTlSutmpeQr07H+
   DfQiuraA6llWVXCLDo4Eo6CluJii0pLmdSkg2c+XTenUW6SswspzXx8nf
   qU+9mjpUFPBDAr9amjUcSxee4EMZXhOlhpzWE00z7o8rKW8QohnpKnOsw
   g==;
X-CSE-ConnectionGUID: e3yR/UxFSE6hjWeaAA4wLA==
X-CSE-MsgGUID: 8OsjZUMpShCRNuzKDtVGYg==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="29730046"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="29730046"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 08:18:42 -0700
X-CSE-ConnectionGUID: ir/0q//HQZa8KfInUCQdQA==
X-CSE-MsgGUID: kCNxZRv6RT2JRNar7bx2hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="22796513"
Received: from skhare-mobl5.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.8.83])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 08:18:41 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH 09/17] ASoC: SOF: Intel: hda: extend signature of sdw_hda_dai_hw_params()
Date: Tue,  2 Apr 2024 10:18:20 -0500
Message-Id: <20240402151828.175002-10-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240402151828.175002-1-pierre-louis.bossart@linux.intel.com>
References: <20240402151828.175002-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add intel_alh_id to set the expected gateway node_id in a follow-up
patch.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai.c | 3 ++-
 sound/soc/sof/intel/hda.c     | 3 ++-
 sound/soc/sof/intel/hda.h     | 3 ++-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 86efcbe8f0d8..5e3229c8fe13 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -470,7 +470,8 @@ static const struct snd_soc_dai_ops dmic_dai_ops = {
 int sdw_hda_dai_hw_params(struct snd_pcm_substream *substream,
 			  struct snd_pcm_hw_params *params,
 			  struct snd_soc_dai *cpu_dai,
-			  int link_id)
+			  int link_id,
+			  int intel_alh_id)
 {
 	struct snd_soc_dapm_widget *w = snd_soc_dai_get_widget(cpu_dai, substream->stream);
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index e26b8fd682e5..63f1cf3b915f 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -159,7 +159,8 @@ static int sdw_ace2x_params_stream(struct device *dev,
 	return sdw_hda_dai_hw_params(params_data->substream,
 				     params_data->hw_params,
 				     params_data->dai,
-				     params_data->link_id);
+				     params_data->link_id,
+				     params_data->alh_stream_id);
 }
 
 static int sdw_ace2x_free_stream(struct device *dev,
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 81a1d4606d3c..eedd03020889 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -850,7 +850,8 @@ static inline bool hda_common_check_sdw_irq(struct snd_sof_dev *sdev)
 int sdw_hda_dai_hw_params(struct snd_pcm_substream *substream,
 			  struct snd_pcm_hw_params *params,
 			  struct snd_soc_dai *cpu_dai,
-			  int link_id);
+			  int link_id,
+			  int intel_alh_id);
 
 int sdw_hda_dai_hw_free(struct snd_pcm_substream *substream,
 			struct snd_soc_dai *cpu_dai,
-- 
2.40.1

