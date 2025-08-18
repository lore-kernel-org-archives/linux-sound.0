Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92337315783
	for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 10:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755512442; cv=none; b=IJD+ZpC7dGTVSIm0njevgVc17R90RTvUm4QwI3uQO5NEK3d+63+LYkjnRDoWe2JUmazgsr8/E/yb1X3PZ7dVdqT0jcP5K9y4B/evZ7jGFKncbs7gg0uJ53+VzrbiFCFjL3ZCyt8zM91tlLdaBfe272l9fAvBAcqwn6+MvvUwV38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755512442; c=relaxed/simple;
	bh=p9KIdpgw5sFsOOHPCm/P7S/mOiM31ORZU3PZ4+hypn0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Loaxw26fa80E6KYals+UZQdcuxmftZJTdXS/2Q3k/WfNsPi6qSJFLVipsgGjkfZmfA0NLFL2E69JYutZzen59otN37ZBXADbPvHacfebDTHhbwrXT8VOLEjnwIJpsDuIRKdQmfTH+OjwoLzs+zqo2ZW1/11XMO88Ps685JVKZUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kjlIQcSU; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kjlIQcSU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755512441; x=1787048441;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=p9KIdpgw5sFsOOHPCm/P7S/mOiM31ORZU3PZ4+hypn0=;
  b=kjlIQcSUr/WibYgurbi+APz5HOB8V194hspBQslKvbYnMpKaxwADGYUd
   acGhTOmJ2A+rzFRd+pVRQwldEqbL45RVoJ0CXaOpTDIAwnriUKAsVfWUR
   J/M0cAF0q6zSt+orHnyPblAUtLv28y7aia8skftksA2II8945H509lX10
   QieFq0XNvha5Cm4WGkQQcM3a/1hazgWQeb7iNkk2JEeSaFBT9SLNJlLTa
   SoEXJU5azKCRZLudixUFV8l6EgrfiG9vjZU08qc/ZMRQZ4OtW164pFrej
   WUjudH4oyuEqb66c1i3H9Mw90ACXkQ2ipKIdBgTWjVmOrJ1yzvp95AOQt
   A==;
X-CSE-ConnectionGUID: giMhoqaCRp6vyy4rJrxbuQ==
X-CSE-MsgGUID: h7oa8qicRteHw6d0NEBPvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="68825919"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="68825919"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 03:20:40 -0700
X-CSE-ConnectionGUID: 0yWdeYmTRzOZwVaFtuaibA==
X-CSE-MsgGUID: cvXwBBFaS9KsIGecXtZX3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="166717218"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa006.jf.intel.com with ESMTP; 18 Aug 2025 03:20:38 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 4/4] ASoC: Intel: avs: Streamline register-component function names
Date: Mon, 18 Aug 2025 12:41:26 +0200
Message-Id: <20250818104126.526442-5-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250818104126.526442-1-cezary.rojewski@intel.com>
References: <20250818104126.526442-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Word 'component' is commonly used in ASoC when referring to any
component, regardless if it is a platform-type or codec-type component.
Reword all avs_xxx_platform_register() to match the scheme present in
ASoC's core. In case of avs_soc_component_register(), the name is
simplified.

Summary:
- avs_xxx_platform_register() -> avs_register_xxx_component()
- avs_soc_component_register() -> avs_register_component()

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/avs.h             | 14 +++++++-------
 sound/soc/intel/avs/board_selection.c |  9 +++++----
 sound/soc/intel/avs/debug.h           |  4 ++--
 sound/soc/intel/avs/pcm.c             | 23 +++++++++++------------
 sound/soc/intel/avs/probes.c          |  2 +-
 5 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index 2be35c19d6ee..95f9ac2683c0 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -348,13 +348,13 @@ struct avs_soc_component {
 
 extern const struct snd_soc_dai_ops avs_dai_fe_ops;
 
-int avs_soc_component_register(struct device *dev, const char *name,
-			       struct snd_soc_component_driver *drv,
-			       struct snd_soc_dai_driver *cpu_dais, int num_cpu_dais);
-int avs_dmic_platform_register(struct avs_dev *adev, const char *name);
-int avs_i2s_platform_register(struct avs_dev *adev, const char *name, unsigned long port_mask,
-			      unsigned long *tdms);
-int avs_hda_platform_register(struct avs_dev *adev, const char *name);
+int avs_register_dmic_component(struct avs_dev *adev, const char *name);
+int avs_register_i2s_component(struct avs_dev *adev, const char *name, unsigned long port_mask,
+			       unsigned long *tdms);
+int avs_register_hda_component(struct avs_dev *adev, const char *name);
+int avs_register_component(struct device *dev, const char *name,
+			   struct snd_soc_component_driver *drv,
+			   struct snd_soc_dai_driver *cpu_dais, int num_cpu_dais);
 
 int avs_register_all_boards(struct avs_dev *adev);
 void avs_unregister_all_boards(struct avs_dev *adev);
diff --git a/sound/soc/intel/avs/board_selection.c b/sound/soc/intel/avs/board_selection.c
index 9eb59d5a73f7..e1d6fa344aa1 100644
--- a/sound/soc/intel/avs/board_selection.c
+++ b/sound/soc/intel/avs/board_selection.c
@@ -18,6 +18,7 @@
 #include <sound/soc-component.h>
 #include "avs.h"
 #include "debug.h"
+#include "pcm.h"
 #include "utils.h"
 
 static char *i2s_test;
@@ -410,7 +411,7 @@ static int __maybe_unused avs_register_probe_board(struct avs_dev *adev)
 	struct snd_soc_acpi_mach mach = {{0}};
 	int ret;
 
-	ret = avs_probe_platform_register(adev, "probe-platform");
+	ret = avs_register_probe_component(adev, "probe-platform");
 	if (ret < 0)
 		return ret;
 
@@ -455,7 +456,7 @@ static int avs_register_dmic_board(struct avs_dev *adev)
 		return ret;
 	}
 
-	ret = avs_dmic_platform_register(adev, "dmic-platform");
+	ret = avs_register_dmic_component(adev, "dmic-platform");
 	if (ret < 0)
 		return ret;
 
@@ -516,7 +517,7 @@ static int avs_register_i2s_board(struct avs_dev *adev, struct snd_soc_acpi_mach
 	if (!name)
 		return -ENOMEM;
 
-	ret = avs_i2s_platform_register(adev, name, mach->mach_params.i2s_link_mask, pdata->tdms);
+	ret = avs_register_i2s_component(adev, name, mach->mach_params.i2s_link_mask, pdata->tdms);
 	if (ret < 0)
 		return ret;
 
@@ -655,7 +656,7 @@ static int avs_register_hda_board(struct avs_dev *adev, struct hda_codec *codec)
 	pdata->obsolete_card_names = obsolete_card_names;
 	pdata->codec = codec;
 
-	ret = avs_hda_platform_register(adev, pname);
+	ret = avs_register_hda_component(adev, pname);
 	if (ret < 0)
 		return ret;
 
diff --git a/sound/soc/intel/avs/debug.h b/sound/soc/intel/avs/debug.h
index 9f0f6f3b2bde..94fe8729a5c1 100644
--- a/sound/soc/intel/avs/debug.h
+++ b/sound/soc/intel/avs/debug.h
@@ -50,7 +50,7 @@ static_assert(sizeof(struct avs_apl_log_buffer_layout) == 8);
 	(addr + sizeof(struct avs_apl_log_buffer_layout))
 
 #ifdef CONFIG_DEBUG_FS
-int avs_probe_platform_register(struct avs_dev *adev, const char *name);
+int avs_register_probe_component(struct avs_dev *adev, const char *name);
 
 #define AVS_SET_ENABLE_LOGS_OP(name) \
 	.enable_logs = avs_##name##_enable_logs
@@ -63,7 +63,7 @@ void avs_debugfs_init(struct avs_dev *adev);
 void avs_debugfs_exit(struct avs_dev *adev);
 
 #else
-static inline int avs_probe_platform_register(struct avs_dev *adev, const char *name)
+static inline int avs_register_probe_component(struct avs_dev *adev, const char *name)
 {
 	return -EOPNOTSUPP;
 }
diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index e738deb2d314..d31058e2de5b 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -1379,9 +1379,9 @@ static struct snd_soc_component_driver avs_component_driver = {
 	.topology_name_prefix	= "intel/avs",
 };
 
-int avs_soc_component_register(struct device *dev, const char *name,
-			       struct snd_soc_component_driver *drv,
-			       struct snd_soc_dai_driver *cpu_dais, int num_cpu_dais)
+int avs_register_component(struct device *dev, const char *name,
+			   struct snd_soc_component_driver *drv,
+			   struct snd_soc_dai_driver *cpu_dais, int num_cpu_dais)
 {
 	struct avs_soc_component *acomp;
 	int ret;
@@ -1428,7 +1428,7 @@ static struct snd_soc_dai_driver dmic_cpu_dais[] = {
 },
 };
 
-int avs_dmic_platform_register(struct avs_dev *adev, const char *name)
+int avs_register_dmic_component(struct avs_dev *adev, const char *name)
 {
 	const struct snd_soc_dai_ops *ops;
 
@@ -1439,8 +1439,8 @@ int avs_dmic_platform_register(struct avs_dev *adev, const char *name)
 
 	dmic_cpu_dais[0].ops = ops;
 	dmic_cpu_dais[1].ops = ops;
-	return avs_soc_component_register(adev->dev, name, &avs_component_driver, dmic_cpu_dais,
-					  ARRAY_SIZE(dmic_cpu_dais));
+	return avs_register_component(adev->dev, name, &avs_component_driver, dmic_cpu_dais,
+				      ARRAY_SIZE(dmic_cpu_dais));
 }
 
 static const struct snd_soc_dai_driver i2s_dai_template = {
@@ -1472,8 +1472,8 @@ static const struct snd_soc_dai_driver i2s_dai_template = {
 	},
 };
 
-int avs_i2s_platform_register(struct avs_dev *adev, const char *name, unsigned long port_mask,
-			      unsigned long *tdms)
+int avs_register_i2s_component(struct avs_dev *adev, const char *name, unsigned long port_mask,
+			       unsigned long *tdms)
 {
 	struct snd_soc_dai_driver *cpus, *dai;
 	const struct snd_soc_dai_ops *ops;
@@ -1539,7 +1539,7 @@ int avs_i2s_platform_register(struct avs_dev *adev, const char *name, unsigned l
 	}
 
 plat_register:
-	return avs_soc_component_register(adev->dev, name, &avs_component_driver, cpus, cpu_count);
+	return avs_register_component(adev->dev, name, &avs_component_driver, cpus, cpu_count);
 }
 
 /* HD-Audio CPU DAI template */
@@ -1764,8 +1764,7 @@ static struct snd_soc_component_driver avs_hda_component_driver = {
 	.topology_name_prefix	= "intel/avs",
 };
 
-int avs_hda_platform_register(struct avs_dev *adev, const char *name)
+int avs_register_hda_component(struct avs_dev *adev, const char *name)
 {
-	return avs_soc_component_register(adev->dev, name,
-					  &avs_hda_component_driver, NULL, 0);
+	return avs_register_component(adev->dev, name, &avs_hda_component_driver, NULL, 0);
 }
diff --git a/sound/soc/intel/avs/probes.c b/sound/soc/intel/avs/probes.c
index 88c6d385c73c..c7b70006354a 100644
--- a/sound/soc/intel/avs/probes.c
+++ b/sound/soc/intel/avs/probes.c
@@ -291,7 +291,7 @@ static const struct snd_soc_component_driver avs_probe_component_driver = {
 	.module_get_upon_open	= 1, /* increment refcount when a stream is opened */
 };
 
-int avs_probe_platform_register(struct avs_dev *adev, const char *name)
+int avs_register_probe_component(struct avs_dev *adev, const char *name)
 {
 	struct snd_soc_component *component;
 	int ret;
-- 
2.25.1

