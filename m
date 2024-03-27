Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582A41311AD
	for <linux-sound@vger.kernel.org>; Wed, 27 Mar 2024 16:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711556672; cv=none; b=Y+sbAhZzmF4JW5uTReQ0e3AcXuk/sQp2NKS3IaeYNf6mqXJ1Bc7PlN3ZA4lfM+/2fg06UIMuaggjLJ5AvMhTjHo8pffE7VEtyuhqQe80djymA0E7pjXwOFIZI31t+GIAUL00gBqGhGJX/2ihJftEv2wLk2hKuNusJgeagQ66sec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711556672; c=relaxed/simple;
	bh=7mKkDHnpjVsMV+avsa/bSTvCScvxOlljZVffn/zZCXo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=s0a8QanAsAup2u53wYncyYBHGTflBePtAva+q7DF9jAjiAPTVT/cnog/Jit3DtF1q3iplm6khFcM/TWx5c68MLlVqV7nnkyByoDkmuW0GqDfEpj5dZ+BTQmRk8wC/rXPp6yIds9/ktDzlpYJnFHmUbljwM63Os3uwHhR6BzOJIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XnIBxqdu; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XnIBxqdu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711556672; x=1743092672;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7mKkDHnpjVsMV+avsa/bSTvCScvxOlljZVffn/zZCXo=;
  b=XnIBxqdu0vH4AaYL+b6M6hTYTdFA0NZuFa/LPIm6S0Rt9gfbqQyFYt1p
   +s7iOiudIVJT2PnaDqLmy4VAmQ4IZBf8G5VvWMaSmXUBVLGj8eGVHbqvR
   4YE5XJ4RaM3XiItGML44MSVtiVjGP4uSI8HIfyTisjK8ks3fC6JMjaZwo
   4qeX601O78aa0PPxXb363IwWa64g6sDBtS73lS2+6dehjgq6mZszO7nja
   o4D9cIwA6v2V3Offd83RjD3Gc9+pCf3XdL3J91/vuGKBDGPSG6qANK2i7
   lu4h+u40mk9maXU90G6ZI2LqsOSP3ck2Kb62dVNVDAcEs1Vg+VlCmEH+H
   g==;
X-CSE-ConnectionGUID: UiWhfmCsTc+blWguKl6fHg==
X-CSE-MsgGUID: eezqqF4JRjO81q8BH6XmPw==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="17221519"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; 
   d="scan'208";a="17221519"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 09:24:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; 
   d="scan'208";a="53821285"
Received: from ssherman-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.117.1])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 09:24:30 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 07/18] ASoC: SOF: Intel: support tplg suffix detection
Date: Wed, 27 Mar 2024 11:23:57 -0500
Message-Id: <20240327162408.63953-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240327162408.63953-1-pierre-louis.bossart@linux.intel.com>
References: <20240327162408.63953-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Brent Lu <brent.lu@intel.com>

Add new flags to tplg_quirk_mask to detect and append codec/amplifier
tplg suffix to topology file name at runtime. With this feature we
could implement an enumeration entry for all boards which implement
same headphone codec regardless the speaker amplifier type.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/soc-acpi.h  | 12 ++++++
 sound/soc/sof/intel/hda.c | 82 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 94 insertions(+)

diff --git a/include/sound/soc-acpi.h b/include/sound/soc-acpi.h
index 23d6d6bfb073..1d8f35ca1d6f 100644
--- a/include/sound/soc-acpi.h
+++ b/include/sound/soc-acpi.h
@@ -151,6 +151,18 @@ struct snd_soc_acpi_link_adr {
  */
 #define SND_SOC_ACPI_TPLG_INTEL_DMIC_NUMBER BIT(2)
 
+/*
+ * when set the speaker amplifier name suffix (i.e. "-max98360a") will be
+ * appended to topology file name
+ */
+#define SND_SOC_ACPI_TPLG_INTEL_AMP_NAME BIT(3)
+
+/*
+ * when set the headphone codec name suffix (i.e. "-rt5682") will be appended to
+ * topology file name
+ */
+#define SND_SOC_ACPI_TPLG_INTEL_CODEC_NAME BIT(4)
+
 /**
  * snd_soc_acpi_mach: ACPI-based machine descriptor. Most of the fields are
  * related to the hardware, except for the firmware and topology file names.
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 7fe72b065451..e26b8fd682e5 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -24,6 +24,7 @@
 #include <linux/soundwire/sdw_intel.h>
 #include <sound/intel-dsp-config.h>
 #include <sound/intel-nhlt.h>
+#include <sound/soc-acpi-intel-ssp-common.h>
 #include <sound/sof.h>
 #include <sound/sof/xtensa.h>
 #include <sound/hda-mlink.h>
@@ -1676,13 +1677,36 @@ void hda_set_mach_params(struct snd_soc_acpi_mach *mach,
 	mach_params->dai_drivers = desc->ops->drv;
 }
 
+static int check_tplg_quirk_mask(struct snd_soc_acpi_mach *mach)
+{
+	u32 dmic_ssp_quirk;
+	u32 codec_amp_name_quirk;
+
+	/*
+	 * In current implementation dmic and ssp quirks are designed for es8336
+	 * machine driver and could not be mixed with codec name and amp name
+	 * quirks.
+	 */
+	dmic_ssp_quirk = mach->tplg_quirk_mask &
+			 (SND_SOC_ACPI_TPLG_INTEL_DMIC_NUMBER | SND_SOC_ACPI_TPLG_INTEL_SSP_NUMBER);
+	codec_amp_name_quirk = mach->tplg_quirk_mask &
+			 (SND_SOC_ACPI_TPLG_INTEL_AMP_NAME | SND_SOC_ACPI_TPLG_INTEL_CODEC_NAME);
+
+	if (dmic_ssp_quirk && codec_amp_name_quirk)
+		return -EINVAL;
+
+	return 0;
+}
+
 struct snd_soc_acpi_mach *hda_machine_select(struct snd_sof_dev *sdev)
 {
 	u32 interface_mask = hda_get_interface_mask(sdev);
 	struct snd_sof_pdata *sof_pdata = sdev->pdata;
 	const struct sof_dev_desc *desc = sof_pdata->desc;
 	struct snd_soc_acpi_mach *mach = NULL;
+	enum snd_soc_acpi_intel_codec codec_type;
 	const char *tplg_filename;
+	const char *tplg_suffix;
 
 	/* Try I2S or DMIC if it is supported */
 	if (interface_mask & (BIT(SOF_DAI_INTEL_SSP) | BIT(SOF_DAI_INTEL_DMIC)))
@@ -1701,6 +1725,17 @@ struct snd_soc_acpi_mach *hda_machine_select(struct snd_sof_dev *sdev)
 			tplg_fixup = true;
 		}
 
+		/*
+		 * Checking quirk mask integrity; some quirk flags could not be
+		 * set concurrently.
+		 */
+		if (tplg_fixup &&
+		    check_tplg_quirk_mask(mach)) {
+			dev_err(sdev->dev, "Invalid tplg quirk mask 0x%x\n",
+				mach->tplg_quirk_mask);
+			return NULL;
+		}
+
 		/* report to machine driver if any DMICs are found */
 		mach->mach_params.dmic_num = check_dmic_num(sdev);
 
@@ -1775,6 +1810,52 @@ struct snd_soc_acpi_mach *hda_machine_select(struct snd_sof_dev *sdev)
 			}
 		}
 
+		codec_type = snd_soc_acpi_intel_detect_amp_type(sdev->dev);
+
+		if (tplg_fixup &&
+		    mach->tplg_quirk_mask & SND_SOC_ACPI_TPLG_INTEL_AMP_NAME &&
+		    codec_type != CODEC_NONE) {
+			tplg_suffix = snd_soc_acpi_intel_get_amp_tplg_suffix(codec_type);
+			if (!tplg_suffix) {
+				dev_err(sdev->dev, "no tplg suffix found, amp %d\n",
+					codec_type);
+				return NULL;
+			}
+
+			tplg_filename = devm_kasprintf(sdev->dev, GFP_KERNEL,
+						       "%s-%s",
+						       sof_pdata->tplg_filename,
+						       tplg_suffix);
+			if (!tplg_filename)
+				return NULL;
+
+			sof_pdata->tplg_filename = tplg_filename;
+			add_extension = true;
+		}
+
+		codec_type = snd_soc_acpi_intel_detect_codec_type(sdev->dev);
+
+		if (tplg_fixup &&
+		    mach->tplg_quirk_mask & SND_SOC_ACPI_TPLG_INTEL_CODEC_NAME &&
+		    codec_type != CODEC_NONE) {
+			tplg_suffix = snd_soc_acpi_intel_get_codec_tplg_suffix(codec_type);
+			if (!tplg_suffix) {
+				dev_err(sdev->dev, "no tplg suffix found, codec %d\n",
+					codec_type);
+				return NULL;
+			}
+
+			tplg_filename = devm_kasprintf(sdev->dev, GFP_KERNEL,
+						       "%s-%s",
+						       sof_pdata->tplg_filename,
+						       tplg_suffix);
+			if (!tplg_filename)
+				return NULL;
+
+			sof_pdata->tplg_filename = tplg_filename;
+			add_extension = true;
+		}
+
 		if (tplg_fixup && add_extension) {
 			tplg_filename = devm_kasprintf(sdev->dev, GFP_KERNEL,
 						       "%s%s",
@@ -1842,3 +1923,4 @@ MODULE_IMPORT_NS(SND_INTEL_SOUNDWIRE_ACPI);
 MODULE_IMPORT_NS(SOUNDWIRE_INTEL_INIT);
 MODULE_IMPORT_NS(SOUNDWIRE_INTEL);
 MODULE_IMPORT_NS(SND_SOC_SOF_HDA_MLINK);
+MODULE_IMPORT_NS(SND_SOC_ACPI_INTEL_MATCH);
-- 
2.40.1

