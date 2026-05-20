Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B871F3D9DB9
	for <linux-sound@vger.kernel.org>; Wed, 20 May 2026 15:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779289595; cv=none; b=TzmmxRI5pOs18SacVrR5tzQ+4GJJKNZF/Hczh3fZmb81Z4nvoISeKQCo0LIQWLw6xSBLcDsSqMK2uNAZsjVtJ5ZnufEHBFfmiItjygKvN3bHwWy/Rieq/J960dJsJ+ry/PNIp7dimMhAX6gefbWzoRvKU/IsR/cjzHwJxVS0Elk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779289595; c=relaxed/simple;
	bh=SM8KJYoZ/gFxXV9Ge1KwT+vx0CAMMD9uUO5zKKrIyq4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q04+yiFec0QZXL2TsktuPwLZ1XcWbvgvwmVD9Jm2qNYu/0mME52bbnMSZ/313wwoMV4SyLuZ64bDIyAZX9Jce5/igm0FI9jgouH5w7adUbZ4kL4rxhSAPgTqmW5LHk78Z6vKdqHMmWtG+YdtPJymxL2CTBAqimYM2AacIzENNV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X0S6VFMu; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X0S6VFMu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779289594; x=1810825594;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SM8KJYoZ/gFxXV9Ge1KwT+vx0CAMMD9uUO5zKKrIyq4=;
  b=X0S6VFMuKvXDMcJiV2pEwI84a1WTagxmYALXFyHrE73sVxsHTURE79xe
   7NBDgXeJ/YMZFjgCgcqOLPw1P8z329aAI4LFWGVO1KqUGqiBXOIT9BmBY
   jerdVeWi4iQtFr3aS3CQR6xftvayO8IJMdKc0NpEQEWiLY4TvS1rud6vK
   vQ1TkhHJRZGVznHYQS16wMy+lJrO/sPi4ur35MP5QbBERnSKJfOvJGgLc
   3EsXJ6Ni5owpSwzO545K38OGdL15fry9s7flD36y5Ubks4uiIHo+t3ys9
   fpq/KqftP/hgi7nv5+fAlhP8pwxt5vqXREEYGw3queaQTFZywaA5uplf3
   g==;
X-CSE-ConnectionGUID: s+mp2+sRQLSlriB64L9XIA==
X-CSE-MsgGUID: 3UyaYrFoQs2WzSB78BGpqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="91296844"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="91296844"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 08:06:34 -0700
X-CSE-ConnectionGUID: h9D9A3uRS3KDFCaFKuCKZQ==
X-CSE-MsgGUID: 5fmyqq0kRzCNLz/M3Wo/Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="245188260"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.245.85])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 08:06:31 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev
Subject: [PATCH 1/2] ASoC: SOF: Intel: hda-mlink/lnl: Convert offload enable functions to void
Date: Wed, 20 May 2026 18:06:38 +0300
Message-ID: <20260520150639.25301-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260520150639.25301-1-peter.ujfalusi@linux.intel.com>
References: <20260520150639.25301-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hdac_bus_eml_enable_offload() can only fail in case the IP is not enabled
in the platform, which is not really an error as the ACE IP can be
configured differently when integrated into a specific SoC.

While it is unlikely, but it is a valid configuration that for example the
DMIC is disabled.
In this case we will just skip setting the offload for a link that is not
present.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 include/sound/hda-mlink.h       |  5 ++---
 sound/soc/sof/intel/hda-mlink.c | 11 +++-------
 sound/soc/sof/intel/lnl.c       | 39 ++++++++++++---------------------
 3 files changed, 19 insertions(+), 36 deletions(-)

diff --git a/include/sound/hda-mlink.h b/include/sound/hda-mlink.h
index 4327317be6af..fed69998c93f 100644
--- a/include/sound/hda-mlink.h
+++ b/include/sound/hda-mlink.h
@@ -60,7 +60,7 @@ struct hdac_ext_link *hdac_bus_eml_sdw_get_hlink(struct hdac_bus *bus);
 
 struct mutex *hdac_bus_eml_get_mutex(struct hdac_bus *bus, bool alt, int elid);
 
-int hdac_bus_eml_enable_offload(struct hdac_bus *bus, bool alt, int elid, bool enable);
+void hdac_bus_eml_enable_offload(struct hdac_bus *bus, bool alt, int elid, bool enable);
 
 /* microphone privacy specific function supported by ACE3+ architecture */
 void hdac_bus_eml_set_mic_privacy_mask(struct hdac_bus *bus, bool alt, int elid,
@@ -186,10 +186,9 @@ hdac_bus_eml_sdw_get_hlink(struct hdac_bus *bus) { return NULL; }
 static inline struct mutex *
 hdac_bus_eml_get_mutex(struct hdac_bus *bus, bool alt, int elid) { return NULL; }
 
-static inline int
+static inline void
 hdac_bus_eml_enable_offload(struct hdac_bus *bus, bool alt, int elid, bool enable)
 {
-	return 0;
 }
 
 static inline void
diff --git a/sound/soc/sof/intel/hda-mlink.c b/sound/soc/sof/intel/hda-mlink.c
index ce603a2343de..92314e3b568a 100644
--- a/sound/soc/sof/intel/hda-mlink.c
+++ b/sound/soc/sof/intel/hda-mlink.c
@@ -988,24 +988,19 @@ struct hdac_ext_link *hdac_bus_eml_sdw_get_hlink(struct hdac_bus *bus)
 }
 EXPORT_SYMBOL_NS(hdac_bus_eml_sdw_get_hlink, "SND_SOC_SOF_HDA_MLINK");
 
-int hdac_bus_eml_enable_offload(struct hdac_bus *bus, bool alt, int elid, bool enable)
+void hdac_bus_eml_enable_offload(struct hdac_bus *bus, bool alt, int elid, bool enable)
 {
 	struct hdac_ext2_link *h2link;
 	struct hdac_ext_link *hlink;
 
 	h2link = find_ext2_link(bus, alt, elid);
-	if (!h2link)
-		return -ENODEV;
-
-	if (!h2link->ofls)
-		return 0;
+	if (!h2link || !h2link->ofls)
+		return;
 
 	hlink = &h2link->hext_link;
 
 	scoped_guard(mutex, &h2link->eml_lock)
 		hdaml_lctl_offload_enable(hlink->ml_addr + AZX_REG_ML_LCTL, enable);
-
-	return 0;
 }
 EXPORT_SYMBOL_NS(hdac_bus_eml_enable_offload, "SND_SOC_SOF_HDA_MLINK");
 
diff --git a/sound/soc/sof/intel/lnl.c b/sound/soc/sof/intel/lnl.c
index c01ea7e731aa..19f753dca30b 100644
--- a/sound/soc/sof/intel/lnl.c
+++ b/sound/soc/sof/intel/lnl.c
@@ -20,22 +20,11 @@
 #include "lnl.h"
 #include <sound/hda-mlink.h>
 
-/* this helps allows the DSP to setup DMIC/SSP */
-static int hdac_bus_offload_dmic_ssp(struct hdac_bus *bus, bool enable)
+/* Configure DSP offload for DMIC/SSP */
+static void hdac_bus_set_dsp_offload(struct hdac_bus *bus, bool enable)
 {
-	int ret;
-
-	ret = hdac_bus_eml_enable_offload(bus, true,
-					  AZX_REG_ML_LEPTR_ID_INTEL_SSP, enable);
-	if (ret < 0)
-		return ret;
-
-	ret = hdac_bus_eml_enable_offload(bus, true,
-					  AZX_REG_ML_LEPTR_ID_INTEL_DMIC, enable);
-	if (ret < 0)
-		return ret;
-
-	return 0;
+	hdac_bus_eml_enable_offload(bus, true, AZX_REG_ML_LEPTR_ID_INTEL_SSP, enable);
+	hdac_bus_eml_enable_offload(bus, true, AZX_REG_ML_LEPTR_ID_INTEL_DMIC, enable);
 }
 
 static int lnl_hda_dsp_probe(struct snd_sof_dev *sdev)
@@ -46,18 +35,14 @@ static int lnl_hda_dsp_probe(struct snd_sof_dev *sdev)
 	if (ret < 0)
 		return ret;
 
-	return hdac_bus_offload_dmic_ssp(sof_to_bus(sdev), true);
+	hdac_bus_set_dsp_offload(sof_to_bus(sdev), true);
+
+	return 0;
 }
 
 static void lnl_hda_dsp_remove(struct snd_sof_dev *sdev)
 {
-	int ret;
-
-	ret = hdac_bus_offload_dmic_ssp(sof_to_bus(sdev), false);
-	if (ret < 0)
-		dev_warn(sdev->dev,
-			 "Failed to disable offload for DMIC/SSP: %d\n", ret);
-
+	hdac_bus_set_dsp_offload(sof_to_bus(sdev), false);
 	hda_dsp_remove(sdev);
 }
 
@@ -69,7 +54,9 @@ static int lnl_hda_dsp_resume(struct snd_sof_dev *sdev)
 	if (ret < 0)
 		return ret;
 
-	return hdac_bus_offload_dmic_ssp(sof_to_bus(sdev), true);
+	hdac_bus_set_dsp_offload(sof_to_bus(sdev), true);
+
+	return 0;
 }
 
 static int lnl_hda_dsp_runtime_resume(struct snd_sof_dev *sdev)
@@ -80,7 +67,9 @@ static int lnl_hda_dsp_runtime_resume(struct snd_sof_dev *sdev)
 	if (ret < 0)
 		return ret;
 
-	return hdac_bus_offload_dmic_ssp(sof_to_bus(sdev), true);
+	hdac_bus_set_dsp_offload(sof_to_bus(sdev), true);
+
+	return 0;
 }
 
 static int lnl_dsp_post_fw_run(struct snd_sof_dev *sdev)
-- 
2.54.0

