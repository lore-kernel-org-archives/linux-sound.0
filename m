Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A02E42E417
	for <linux-sound@vger.kernel.org>; Wed, 23 Sep 2026 05:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790141337; cv=none; b=QqvcTtp0F0FzBW/TK65gOiAC1qi9hTNaoYRb8toX7HvuTj1CLEgwjx8rUMaAjGi0dlS79qI8bWsDLnck3QoqNDxYt6q5WS5qODTnV4GDFsLhjULsKkHxrGykovjhq1NAWm2YRvCHa+9326mvn343AfqkMUwdSn6p55ewl4y2qVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790141337; c=relaxed/simple;
	bh=yCBrT515HhOP0foBqJl3HOxjtCk3TiC3YWaRg56CljA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bZrlqbA51/hRxx55IAFA/lKBBagRTxdBpPgUZ9UmxfpKXnewUDz84M+cqCijcKsLvhCvQGnXCkoSVBggiEDG09RPJSsTF+SWaXPjpkbEhvIGHm4djIacyWtau0ZDl+pgl6c95hP/5cbxk3KTHFPrFuxPnC+YiPUVuEd1iIILMSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nrH3HPbi; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nrH3HPbi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790141337; x=1821677337;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yCBrT515HhOP0foBqJl3HOxjtCk3TiC3YWaRg56CljA=;
  b=nrH3HPbiV4hN60cWvPaGD1ljD3QPeNKPi4ijP9qRYhP6J9tM/NUqHckY
   sN7q3FkQEfFWAqD6vqyRA34Gt5TBaIFn7rycHjhI/OrYJy/AbqM4NK42a
   K64oBVeUE66azXCG8E9edQFzQCT9ImwxWmO7G9fnXX9I0P2bXySSEqldV
   fkvI8DU7F6Pgd4e8aYmXVqF6E3xctY3D7XPtsguTYxLfDZNjb68NgpxkA
   GP/ONyBXfYHBGFfLG5O1suBFolxuJMcG/kddPnjkbyU4IOIb7xmksV6LZ
   PMEFplLYRMPOcDh0Z6N3wR7slyE3VKl211FKgsXCavR9AwUrqr7pntDTD
   A==;
X-CSE-ConnectionGUID: OleZHcP+TmSG5sJN2tyTRg==
X-CSE-MsgGUID: jG+d7U7pSvaie71GT+SVPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="90821733"
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="90821733"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 22:28:56 -0700
X-CSE-ConnectionGUID: BNJQujEDTNaRyl8iWNrz7g==
X-CSE-MsgGUID: 0FUWMdKGQN+yhoeLP5poQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="272938559"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 22:28:54 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH v2 5/7] ASoC: Intel: sof-function-topology-lib: add I2S support for sof_sdw_get_tplg_files
Date: Wed, 23 Sep 2026 13:28:30 +0800
Message-ID: <20260923052832.2392758-6-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923052832.2392758-1-yung-chuan.liao@linux.intel.com>
References: <20260923052832.2392758-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Intel SOF SDW machine drive also supports I2S interface. Add related
supports for the sof_sdw_get_tplg_files() callback.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 .../intel/common/sof-function-topology-lib.c  | 62 ++++++++++++++++++-
 1 file changed, 61 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/common/sof-function-topology-lib.c b/sound/soc/intel/common/sof-function-topology-lib.c
index e1049bb85a13..b53f9037feff 100644
--- a/sound/soc/intel/common/sof-function-topology-lib.c
+++ b/sound/soc/intel/common/sof-function-topology-lib.c
@@ -19,6 +19,10 @@ enum tplg_device_id {
 	TPLG_DEVICE_SDCA_MIC,
 	TPLG_DEVICE_INTEL_PCH_DMIC,
 	TPLG_DEVICE_HDMI,
+	TPLG_DEVICE_SSP_JACK,
+	TPLG_DEVICE_SSP_AMP,
+	TPLG_DEVICE_SSP_BT,
+	TPLG_DEVICE_SSP_HDMI_IN,
 	TPLG_DEVICE_LOOPBACK_VIRTUAL,
 	TPLG_DEVICE_MAX
 };
@@ -70,11 +74,15 @@ static char *get_tplg_filename(struct device *dev, const char *prefix,
 
 	/*
 	 * The tplg file naming rule is sof-<platform>-<function>-id<BE id number>.tplg
-	 * where <platform> is only required for the devices that need NHLT blob like DMIC
+	 * where <platform> is required for functions that depend on NHLT blobs (e.g. DMIC/SSP)
 	 * as the nhlt blob is platform dependent.
 	 */
 	switch (tplg_dev) {
 	case TPLG_DEVICE_INTEL_PCH_DMIC:
+	case TPLG_DEVICE_SSP_JACK:
+	case TPLG_DEVICE_SSP_AMP:
+	case TPLG_DEVICE_SSP_BT:
+	case TPLG_DEVICE_SSP_HDMI_IN:
 		filename = devm_kasprintf(dev, GFP_KERNEL, "%s/sof-%s-%s-id%d.tplg",
 					  prefix, platform, tplg_dev_name, dai_link_id);
 		break;
@@ -108,6 +116,53 @@ static int get_dmic_tplg_dev(struct device *dev, int dmic_num,
 	return 0;
 }
 
+static int get_ssp_tplg_dev(struct device *dev, struct snd_soc_dai_link *dai_link,
+			    u16 *hdmi_in_mask, int *tplg_dev, char **tplg_dev_name)
+{
+	unsigned int ssp_port;
+
+	if (sscanf(dai_link->name, "SSP%u", &ssp_port) != 1) {
+		dev_err(dev, "Can't get SSP port from dai_link->name %s\n", dai_link->name);
+		return -EINVAL;
+	}
+	if (strstr(dai_link->name, "Codec")) {
+		/*
+		 * Assume DAI link 0 is jack which is true in all existing
+		 * machine drivers
+		 */
+		if (dai_link->id == 0) {
+			*tplg_dev = TPLG_DEVICE_SSP_JACK;
+			*tplg_dev_name = devm_kasprintf(dev, GFP_KERNEL,
+							"ssp%d-jack", ssp_port);
+		} else {
+			*tplg_dev = TPLG_DEVICE_SSP_AMP;
+			*tplg_dev_name = devm_kasprintf(dev, GFP_KERNEL,
+							"ssp%d-amp", ssp_port);
+		}
+	} else if (strstr(dai_link->name, "BT")) {
+		*tplg_dev = TPLG_DEVICE_SSP_BT;
+		*tplg_dev_name = devm_kasprintf(dev, GFP_KERNEL,
+						"ssp%d-bt", ssp_port);
+	} else if (strstr(dai_link->name, "HDMI")) {
+		*hdmi_in_mask |= BIT(ssp_port);
+		/* The number of HDMI in dai link is always 2 right now */
+		if (hweight16(*hdmi_in_mask) != 2)
+			return -EINVAL;
+
+		*tplg_dev = TPLG_DEVICE_SSP_HDMI_IN;
+		*tplg_dev_name = devm_kasprintf(dev, GFP_KERNEL,
+						"ssp%x-hdmiin", *hdmi_in_mask);
+	} else {
+		dev_warn(dev,
+			 "unsupported SSP link %s\n", dai_link->name);
+		return -EINVAL;
+	}
+	if (!*tplg_dev_name)
+		return -ENOMEM;
+
+	return 0;
+}
+
 int sof_sdw_get_tplg_files(struct snd_soc_card *card, const struct snd_soc_acpi_mach *mach,
 			   const char *prefix, const char ***tplg_files, bool best_effort)
 {
@@ -120,6 +175,7 @@ int sof_sdw_get_tplg_files(struct snd_soc_card *card, const struct snd_soc_acpi_
 	struct snd_soc_dai_link *dai_link;
 	char platform[SOF_INTEL_PLATFORM_NAME_MAX];
 	unsigned long tplg_mask = 0;
+	u16 hdmi_in_mask = 0;
 	int tplg_num = 0;
 	char *tplg_file;
 	int tplg_dev;
@@ -153,6 +209,10 @@ int sof_sdw_get_tplg_files(struct snd_soc_card *card, const struct snd_soc_acpi_
 		} else if (strstr(dai_link->name, "iDisp")) {
 			tplg_dev = TPLG_DEVICE_HDMI;
 			tplg_dev_name = "hdmi-pcm5";
+		} else if (strstr(dai_link->name, "SSP")) {
+			if (get_ssp_tplg_dev(card->dev, dai_link, &hdmi_in_mask,
+					     &tplg_dev, &tplg_dev_name) < 0)
+				continue;
 		} else if (strstr(dai_link->name, "Loopback_Virtual")) {
 			tplg_dev = TPLG_DEVICE_LOOPBACK_VIRTUAL;
 			/*
-- 
2.43.0

