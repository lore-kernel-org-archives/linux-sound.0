Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789B83FB3B
	for <linux-sound@vger.kernel.org>; Tue, 16 Jul 2024 08:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721119231; cv=none; b=pt6qeZcSvmSxWlAtHaCGl05xFeFyOuouKrd5Pru3eiO6AM8O+Slp/mRKvishF4YE+WdGeN4ClSGiSotJj9F806mdDyiFVGPMYDoSRYrPtie3Bp0+eduFSRE/L90gj1H/ra6Ta64GVOv0R1xhS1bOTGdrotEwEfHvIzxdEJWV4AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721119231; c=relaxed/simple;
	bh=JsYVBSqNJXb2eN7XVFd49oK43QNpzg06jT/gd82/Sek=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UW8wqGxOcliImRoyWtuY77ZEKE/ECCrRRYqLd0wg6CuotOsOg3MJJPA1QJWDhvy42UXrxeARmEtsY6RWOu71RKLSCqz1QEhHkpuevz9DYjLqROf+XkBQbkvIg2H/7n/t6jKzjWFgzwYlGYJDc1XtrlizLSJX5YV9M2OLTDP3uWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PEkIEPPf; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PEkIEPPf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721119229; x=1752655229;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=JsYVBSqNJXb2eN7XVFd49oK43QNpzg06jT/gd82/Sek=;
  b=PEkIEPPfzHwxi+yRJwDuPZ/jUZe+mhtpRmEk+AardaAzhGyuPu0swN45
   J22W8eoD8GWdpbV/EML1aQqFuIRdL/3AnqFAGCVkl98Sd85JdnpO6qNkg
   E2p4SuoIxYZKCos2vx78rE/eDNuiJKpVq45MZW2rFg3CIeHnyv4KiHBA+
   vL0H++cyiY7sjurfknQXlDC/KoFpngJFIyvsYWuTCJx8Ana0Mj0XMA/bf
   rL+a98F906HF1Dn5DT2TX3u34bDmEe6Ilq9vkIu/DFXvjHo3WDeDpHH5Q
   LiG4tUyNvzgsZkrD82LM9H35ReEQ6EdeuoQHBTmWlAVhDckHbso7tzEqd
   g==;
X-CSE-ConnectionGUID: 4WIJv0+fSfOHw7S14IehQQ==
X-CSE-MsgGUID: 8a1fZarNRuON+RJJ+mI4mA==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="18490422"
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; 
   d="scan'208";a="18490422"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2024 01:40:29 -0700
X-CSE-ConnectionGUID: qbor9/xXTym7nDwLh98bBA==
X-CSE-MsgGUID: q6BdUxXVQWqBwYorVa1H1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; 
   d="scan'208";a="49682065"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.245.246.211])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2024 01:40:26 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Curtis Malainey <cujomalainey@chromium.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH] ASoC: Intel: Fix RT5650 SSP lookup
Date: Tue, 16 Jul 2024 10:40:12 +0200
Message-ID: <20240716084012.299257-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Curtis Malainey <cujomalainey@chromium.org>

Commit 8efcd4864652 ("ASoC: Intel: sof_rt5682: use common module for
sof_card_private initialization") migrated the pin assignment in the
context struct up to soc-acpi-intel-ssp-common.c. This uses a lookup
table to see if a device has a amp/codec before assigning the pin. The
issue here arises when combination parts that serve both (with 2 ports)
are used.

sysfs: cannot create duplicate filename '/devices/pci0000:00/0000:00:1f.3/adl_rt5682_def/SSP0-Codec'
CPU: 1 PID: 2079 Comm: udevd Tainted: G     U             6.6.36-03391-g744739e00023 #1 3be1a2880a0970f65545a957db7d08ef4b3e2c0d
Hardware name: Google Anraggar/Anraggar, BIOS Google_Anraggar.15217.552.0 05/07/2024
Call Trace:
 <TASK>
 dump_stack_lvl+0x69/0xa0
 sysfs_warn_dup+0x5b/0x70
 sysfs_create_dir_ns+0xb0/0x100
 kobject_add_internal+0x133/0x3c0
 kobject_add+0x66/0xb0
 ? device_add+0x65/0x780
 device_add+0x164/0x780
 snd_soc_add_pcm_runtimes+0x2fa/0x800
 snd_soc_bind_card+0x35e/0xc20
 devm_snd_soc_register_card+0x48/0x90
 platform_probe+0x7b/0xb0
 really_probe+0xf7/0x2a0
 ...
kobject: kobject_add_internal failed for SSP0-Codec with -EEXIST, don't try to register things with the same name in the same directory.

The issue is that the ALC5650 was only defined in the codec table and
not the amp table which left the pin unassigned but the dai link was
still created by the machine driver.

Also patch the suffix filename code for the topology to prevent double
suffix names as a result of this change.

Fixes: 8efcd4864652 ("ASoC: Intel: sof_rt5682: use common module for sof_card_private initialization")
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-ssp-common.c  |  9 ++++
 sound/soc/sof/intel/hda.c                     | 49 ++++++++++---------
 2 files changed, 34 insertions(+), 24 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-ssp-common.c b/sound/soc/intel/common/soc-acpi-intel-ssp-common.c
index 75d0b931d895..de7a3f7f47f1 100644
--- a/sound/soc/intel/common/soc-acpi-intel-ssp-common.c
+++ b/sound/soc/intel/common/soc-acpi-intel-ssp-common.c
@@ -64,6 +64,15 @@ static const struct codec_map amps[] = {
 	CODEC_MAP_ENTRY("RT1015P", "rt1015", RT1015P_ACPI_HID, CODEC_RT1015P),
 	CODEC_MAP_ENTRY("RT1019P", "rt1019", RT1019P_ACPI_HID, CODEC_RT1019P),
 	CODEC_MAP_ENTRY("RT1308", "rt1308", RT1308_ACPI_HID, CODEC_RT1308),
+
+	/*
+	 * Monolithic components
+	 *
+	 * Only put components that can serve as both the amp and the codec below this line.
+	 * This will ensure that if the part is used just as a codec and there is an amp as well
+	 * then the amp will be selected properly.
+	 */
+	CODEC_MAP_ENTRY("RT5650", "rt5650", RT5650_ACPI_HID, CODEC_RT5650),
 };
 
 enum snd_soc_acpi_intel_codec
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index daf364f773dd..5a40b8fbbbd3 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -1307,9 +1307,10 @@ struct snd_soc_acpi_mach *hda_machine_select(struct snd_sof_dev *sdev)
 	const struct sof_dev_desc *desc = sof_pdata->desc;
 	struct hdac_bus *bus = sof_to_bus(sdev);
 	struct snd_soc_acpi_mach *mach = NULL;
-	enum snd_soc_acpi_intel_codec codec_type;
+	enum snd_soc_acpi_intel_codec codec_type, amp_type;
 	const char *tplg_filename;
 	const char *tplg_suffix;
+	bool amp_name_valid;
 
 	/* Try I2S or DMIC if it is supported */
 	if (interface_mask & (BIT(SOF_DAI_INTEL_SSP) | BIT(SOF_DAI_INTEL_DMIC)))
@@ -1413,30 +1414,30 @@ struct snd_soc_acpi_mach *hda_machine_select(struct snd_sof_dev *sdev)
 			}
 		}
 
-		codec_type = snd_soc_acpi_intel_detect_amp_type(sdev->dev);
-
-		if (tplg_fixup &&
-		    mach->tplg_quirk_mask & SND_SOC_ACPI_TPLG_INTEL_AMP_NAME &&
-		    codec_type != CODEC_NONE) {
-			tplg_suffix = snd_soc_acpi_intel_get_amp_tplg_suffix(codec_type);
-			if (!tplg_suffix) {
-				dev_err(sdev->dev, "no tplg suffix found, amp %d\n",
-					codec_type);
-				return NULL;
-			}
-
-			tplg_filename = devm_kasprintf(sdev->dev, GFP_KERNEL,
-						       "%s-%s",
-						       sof_pdata->tplg_filename,
-						       tplg_suffix);
-			if (!tplg_filename)
-				return NULL;
-
-			sof_pdata->tplg_filename = tplg_filename;
-			add_extension = true;
-		}
-
+		amp_type = snd_soc_acpi_intel_detect_amp_type(sdev->dev);
 		codec_type = snd_soc_acpi_intel_detect_codec_type(sdev->dev);
+		amp_name_valid = amp_type != CODEC_NONE && amp_type != codec_type;
+
+		if (tplg_fixup && amp_name_valid &&
+		    mach->tplg_quirk_mask & SND_SOC_ACPI_TPLG_INTEL_AMP_NAME) {
+			tplg_suffix = snd_soc_acpi_intel_get_amp_tplg_suffix(amp_type);
+			if (!tplg_suffix) {
+				dev_err(sdev->dev, "no tplg suffix found, amp %d\n",
+					amp_type);
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
 
 		if (tplg_fixup &&
 		    mach->tplg_quirk_mask & SND_SOC_ACPI_TPLG_INTEL_CODEC_NAME &&
-- 
2.43.0

