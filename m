Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BCC24CEEA
	for <linux-sound@vger.kernel.org>; Mon,  7 Apr 2025 12:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744029645; cv=none; b=WmhTJYmT71/Vk7D+UR1T6xMOaUBvX3rZoZLa2b1T7ACk8ydr3GgjgmF/qshw1jukWmQwkMP9s7C/EFow7Dubs8C8iLlOalwivXR/1vQtMLqrWwo/oltID6zbzZXdSAa6U4LMpSWfvFBzZ7zSm3DiR3ieCWy7GdoYICSyyQag0R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744029645; c=relaxed/simple;
	bh=WmimfHXe7d659dH469zboqlHgIrj7BnACGd8fTZSfTg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E+HKPY2+5vf4zpax3BrYBOhoPPwXhHhXAjgwIyw4AcuSFfhVAxqYzNN3EEttIfFlio3LOtKoaCu0Emz2jb0mIiDZ0ezbxZrXdVUQhj/pB1MCwLiy7WQGmYROjB5iWfZnKuaH8yjl0Y6ZnWk6QZ5QCNOtA865Kmb0cPExmHAXmIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PDW3FRva; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PDW3FRva"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744029644; x=1775565644;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WmimfHXe7d659dH469zboqlHgIrj7BnACGd8fTZSfTg=;
  b=PDW3FRvaXTpt7PXrJl5kclIpg+h8gjoRHN/v4fU4biUubIa+nlZmjBGm
   +x0vtFgxYI52+x5T966rqYCNhCsSZEcK1UokQhb8P2A3V8DgE4hMJA/Rh
   CoFQwIpDnZ3dCDzr83m4+WSBCqjC8KGWQNip4FUdsL5pX5IkmM1boAOPU
   zcBw8rQgUqUk9q/rFfwQbWUR3NKuWbmnIIHqYEwDxBOqRYgN8SSBRGX+k
   SjjuCHwr24R+56xERMa2QncVpsMeNXyvGgDSRYa4gUwgsdoYQ6wczWuyp
   lIoPd0i2e8yxt6oT8EybKLO+UtWibJJ41ePnG7dv4aZGLvvg1b7npS4O6
   A==;
X-CSE-ConnectionGUID: cAJA9k26RSSDrMOW9YPCCg==
X-CSE-MsgGUID: rEIyTVqjRK+qIVer3kKHeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56778962"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="56778962"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 05:40:44 -0700
X-CSE-ConnectionGUID: +MJoAehSQw+wsYKAIebirw==
X-CSE-MsgGUID: wS52Kd2qRHGiE/T7d50IyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="151134013"
Received: from dev2.igk.intel.com ([10.237.148.94])
  by fmviesa002.fm.intel.com with ESMTP; 07 Apr 2025 05:40:41 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 01/20] ASoC: Intel: avs: boards: Add Kconfig option for obsolete card names
Date: Mon,  7 Apr 2025 14:41:35 +0200
Message-Id: <20250407124154.1713039-2-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250407124154.1713039-1-amadeuszx.slawinski@linux.intel.com>
References: <20250407124154.1713039-1-amadeuszx.slawinski@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add backward compatibility Kconfig option to allow for enabling obsolete
card names.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/board_selection.c | 37 ++++++++++++++++++++++++---
 sound/soc/intel/avs/boards/Kconfig    |  8 ++++++
 sound/soc/intel/avs/pcm.c             |  5 +++-
 sound/soc/intel/avs/utils.h           | 14 ++++++++--
 4 files changed, 57 insertions(+), 7 deletions(-)

diff --git a/sound/soc/intel/avs/board_selection.c b/sound/soc/intel/avs/board_selection.c
index 2d706edcbf924..d00addb24d40a 100644
--- a/sound/soc/intel/avs/board_selection.c
+++ b/sound/soc/intel/avs/board_selection.c
@@ -17,11 +17,16 @@
 #include <sound/soc-acpi.h>
 #include <sound/soc-component.h>
 #include "avs.h"
+#include "utils.h"
 
 static bool i2s_test;
 module_param(i2s_test, bool, 0444);
 MODULE_PARM_DESC(i2s_test, "Probe I2S test-board and skip all other I2S boards");
 
+static bool obsolete_card_names = IS_ENABLED(CONFIG_SND_SOC_INTEL_AVS_CARDNAME_OBSOLETE);
+module_param_named(obsolete_card_names, obsolete_card_names, bool, 0444);
+MODULE_PARM_DESC(obsolete_card_names, "Use obsolete card names 0=no, 1=yes");
+
 static const struct dmi_system_id kbl_dmi_table[] = {
 	{
 		.matches = {
@@ -141,7 +146,7 @@ static struct snd_soc_acpi_mach avs_kbl_i2s_machines[] = {
 		.mach_params = {
 			.i2s_link_mask = AVS_SSP(0),
 		},
-		.pdata = (unsigned long[]){ 0x2, 0, 0, 0, 0, 0 }, /* SSP0 TDMs */
+		.pdata = (struct avs_mach_pdata[]){ { .tdms = (unsigned long[]){ 0x2 } } },
 		.tplg_filename = "rt5514-tplg.bin",
 	},
 	{
@@ -202,7 +207,9 @@ static struct snd_soc_acpi_mach avs_apl_i2s_machines[] = {
 		.mach_params = {
 			.i2s_link_mask = AVS_SSP_RANGE(0, 5),
 		},
-		.pdata = (unsigned long[]){ 0x1, 0x1, 0x14, 0x1, 0x1, 0x1 }, /* SSP2 TDMs */
+		.pdata = (struct avs_mach_pdata[]){ {
+			.tdms = (unsigned long[]){ 0x1, 0x1, 0x14, 0x1, 0x1, 0x1 }
+		} },
 		.tplg_filename = "tdf8532-tplg.bin",
 	},
 	{
@@ -445,6 +452,7 @@ static int avs_register_dmic_board(struct avs_dev *adev)
 {
 	struct platform_device *codec, *board;
 	struct snd_soc_acpi_mach mach = {{0}};
+	struct avs_mach_pdata *pdata;
 	int ret;
 
 	if (!acpi_nhlt_find_endpoint(ACPI_NHLT_LINKTYPE_PDM, -1, -1, -1)) {
@@ -468,6 +476,11 @@ static int avs_register_dmic_board(struct avs_dev *adev)
 	if (ret < 0)
 		return ret;
 
+	pdata = devm_kzalloc(adev->dev, sizeof(*pdata), GFP_KERNEL);
+	if (!pdata)
+		return -ENOMEM;
+	pdata->obsolete_card_names = obsolete_card_names;
+	mach.pdata = pdata;
 	mach.tplg_filename = "dmic-tplg.bin";
 	mach.mach_params.platform = "dmic-platform";
 
@@ -490,6 +503,7 @@ static int avs_register_dmic_board(struct avs_dev *adev)
 static int avs_register_i2s_board(struct avs_dev *adev, struct snd_soc_acpi_mach *mach)
 {
 	struct platform_device *board;
+	struct avs_mach_pdata *pdata;
 	int num_ssps;
 	char *name;
 	int ret;
@@ -507,7 +521,15 @@ static int avs_register_i2s_board(struct avs_dev *adev, struct snd_soc_acpi_mach
 	if (!name)
 		return -ENOMEM;
 
-	ret = avs_i2s_platform_register(adev, name, mach->mach_params.i2s_link_mask, mach->pdata);
+	pdata = mach->pdata;
+	if (!pdata)
+		pdata = devm_kzalloc(adev->dev, sizeof(*pdata), GFP_KERNEL);
+	if (!pdata)
+		return -ENOMEM;
+	pdata->obsolete_card_names = obsolete_card_names;
+	mach->pdata = pdata;
+
+	ret = avs_i2s_platform_register(adev, name, mach->mach_params.i2s_link_mask, pdata->tdms);
 	if (ret < 0)
 		return ret;
 
@@ -584,6 +606,7 @@ static int avs_register_hda_board(struct avs_dev *adev, struct hda_codec *codec)
 {
 	struct snd_soc_acpi_mach mach = {{0}};
 	struct platform_device *board;
+	struct avs_mach_pdata *pdata;
 	struct hdac_device *hdev = &codec->core;
 	char *pname;
 	int ret, id;
@@ -592,11 +615,17 @@ static int avs_register_hda_board(struct avs_dev *adev, struct hda_codec *codec)
 	if (!pname)
 		return -ENOMEM;
 
+	pdata = devm_kzalloc(adev->dev, sizeof(*pdata), GFP_KERNEL);
+	if (!pdata)
+		return -ENOMEM;
+	pdata->obsolete_card_names = obsolete_card_names;
+	pdata->codec = codec;
+
 	ret = avs_hda_platform_register(adev, pname);
 	if (ret < 0)
 		return ret;
 
-	mach.pdata = codec;
+	mach.pdata = pdata;
 	mach.mach_params.platform = pname;
 	mach.tplg_filename = devm_kasprintf(adev->dev, GFP_KERNEL, "hda-%08x-tplg.bin",
 					    hdev->vendor_id);
diff --git a/sound/soc/intel/avs/boards/Kconfig b/sound/soc/intel/avs/boards/Kconfig
index ba4bee42124cc..8b654181004e7 100644
--- a/sound/soc/intel/avs/boards/Kconfig
+++ b/sound/soc/intel/avs/boards/Kconfig
@@ -4,6 +4,14 @@ menu "Intel AVS Machine drivers"
 
 comment "Available DSP configurations"
 
+config SND_SOC_INTEL_AVS_CARDNAME_OBSOLETE
+	bool "Use obsolete card names"
+	default n
+	help
+	  Use obsolete names for some of avs cards. This option should be
+	  used if your system depends on old card names, for example having
+	  not up to date UCM files.
+
 config SND_SOC_INTEL_AVS_MACH_DA7219
 	tristate "da7219 I2S board"
 	depends on I2C
diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index dac463390da13..7e077c97123bb 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -18,6 +18,7 @@
 #include "path.h"
 #include "pcm.h"
 #include "topology.h"
+#include "utils.h"
 #include "../../codecs/hda.h"
 
 struct avs_dma_data {
@@ -1480,6 +1481,7 @@ static int avs_component_hda_probe(struct snd_soc_component *component)
 	struct snd_soc_dapm_context *dapm;
 	struct snd_soc_dai_driver *dais;
 	struct snd_soc_acpi_mach *mach;
+	struct avs_mach_pdata *pdata;
 	struct hda_codec *codec;
 	struct hda_pcm *pcm;
 	const char *cname;
@@ -1489,7 +1491,8 @@ static int avs_component_hda_probe(struct snd_soc_component *component)
 	if (!mach)
 		return -EINVAL;
 
-	codec = mach->pdata;
+	pdata = mach->pdata;
+	codec = pdata->codec;
 	if (list_empty(&codec->pcm_list_head))
 		return -EINVAL;
 	list_for_each_entry(pcm, &codec->pcm_list_head, list)
diff --git a/sound/soc/intel/avs/utils.h b/sound/soc/intel/avs/utils.h
index 5ee569c39380a..a7aa13a48cf3d 100644
--- a/sound/soc/intel/avs/utils.h
+++ b/sound/soc/intel/avs/utils.h
@@ -11,6 +11,14 @@
 
 #include <sound/soc-acpi.h>
 
+struct avs_mach_pdata {
+	struct hda_codec *codec;
+	unsigned long *tdms;
+	char *codec_name; /* DMIC only */
+
+	bool obsolete_card_names;
+};
+
 static inline bool avs_mach_singular_ssp(struct snd_soc_acpi_mach *mach)
 {
 	return hweight_long(mach->mach_params.i2s_link_mask) == 1;
@@ -23,14 +31,16 @@ static inline u32 avs_mach_ssp_port(struct snd_soc_acpi_mach *mach)
 
 static inline bool avs_mach_singular_tdm(struct snd_soc_acpi_mach *mach, u32 port)
 {
-	unsigned long *tdms = mach->pdata;
+	struct avs_mach_pdata *pdata = mach->pdata;
+	unsigned long *tdms = pdata->tdms;
 
 	return !tdms || (hweight_long(tdms[port]) == 1);
 }
 
 static inline u32 avs_mach_ssp_tdm(struct snd_soc_acpi_mach *mach, u32 port)
 {
-	unsigned long *tdms = mach->pdata;
+	struct avs_mach_pdata *pdata = mach->pdata;
+	unsigned long *tdms = pdata->tdms;
 
 	return tdms ? __ffs(tdms[port]) : 0;
 }

base-commit: 3a0f0a4355df0240485ed62b6bd6afa5b3e689c5
-- 
2.34.1

