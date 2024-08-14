Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA5E13D2A4
	for <linux-sound@vger.kernel.org>; Wed, 14 Aug 2024 08:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723624804; cv=none; b=HAa61bptmxudjJoXg9nx+XSelgD++/aHOwO1Za34o1F49VAmHS1tX53qBfP1yIcgxVLSCI2O7tuy0mRsJkh40TmSqx7CjgjjbhunXuOI8piZy4GjoDIdPK1Gg+7WQY9He1THc1NNWYhs2GcqwT70tiVtom7PJ93asQunXGWsw5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723624804; c=relaxed/simple;
	bh=qlozRJ3xQk/1szgD7uZbvh9GJmSvk2Z3IeOSOhy/+M8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LJWvDUjUj5LFJLy8IT916s20p7skUNO2kJD6kPWH8Nu2cW2D46JJJ/7BmFFXJU69wZQ2wvuWXhTx0VOuWy/A4liHjXBO+WLKxcW557sIR//newU0ZDImSwbtnZsYgq18aDX4ZgxenwHf9XJHu50r3mDcRxpNcvaMqtlnq8JZg3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LacxRxME; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LacxRxME"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723624803; x=1755160803;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qlozRJ3xQk/1szgD7uZbvh9GJmSvk2Z3IeOSOhy/+M8=;
  b=LacxRxMEz8qdM0afrkxWtWtfUi8mn8jnJ7h3QSR1ESXpxG7LEzThA2SS
   vqqEsjfrHXD/vXbL5i/UPYTGd3C/f24X5iRUQotXufrdg6hZ1CCq1LVrP
   jZM+c3lw5s8m4Pdgr8+FXyQXQJX8Cfs0kwhWhIJ+eYlgmV7heeHWWs2lv
   AcGoFCJMgAouam0axBtV7CHpBmIi3qcwt4Uip7S5GbCcgT9FCv507FlNf
   9mTZ8BuVL0bTi0/WAGQPvStmIe1dR6RAi38OSfZqIsgGTKSVXaaHJ8XXV
   RENOZmHJdwDjAru5QeYr2rKLStF2SKv6VTAbx4lBlZLZtErVJ+b8cknv8
   Q==;
X-CSE-ConnectionGUID: 2Q/iZxcQQDa3DnMeqgT41w==
X-CSE-MsgGUID: d0Sm+WXHSSqJejKym/anSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="24735123"
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800"; 
   d="scan'208";a="24735123"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 01:40:03 -0700
X-CSE-ConnectionGUID: G8eThFI9S+CXYZZmjUaVhQ==
X-CSE-MsgGUID: awWq5zn0QmmYmy2QECY+NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800"; 
   d="scan'208";a="63867912"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orviesa004.jf.intel.com with ESMTP; 14 Aug 2024 01:40:00 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	andriy.shevchenko@linux.intel.com,
	cujomalainey@chromium.org,
	lmajczak@google.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 02/14] ASoC: Intel: Drop skl_machine_pdata usage
Date: Wed, 14 Aug 2024 10:39:17 +0200
Message-Id: <20240814083929.1217319-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240814083929.1217319-1-cezary.rojewski@intel.com>
References: <20240814083929.1217319-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Preparation step in the skylake-driver removal process.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/common/soc-acpi-intel-cnl-match.c |  6 ------
 sound/soc/intel/common/soc-acpi-intel-ehl-match.c |  1 -
 sound/soc/intel/common/soc-acpi-intel-hda-match.c |  6 ------
 sound/soc/intel/common/soc-acpi-intel-icl-match.c |  6 ------
 sound/soc/intel/common/soc-acpi-intel-kbl-match.c | 11 -----------
 sound/soc/intel/common/soc-acpi-intel-skl-match.c |  5 -----
 6 files changed, 35 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-cnl-match.c b/sound/soc/intel/common/soc-acpi-intel-cnl-match.c
index 3df89e4511da..8bbb1052faf2 100644
--- a/sound/soc/intel/common/soc-acpi-intel-cnl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-cnl-match.c
@@ -8,7 +8,6 @@
 
 #include <sound/soc-acpi.h>
 #include <sound/soc-acpi-intel-match.h>
-#include "../skylake/skl.h"
 #include "soc-acpi-intel-sdw-mockup-match.h"
 
 static const struct snd_soc_acpi_codecs essx_83x6 = {
@@ -16,16 +15,11 @@ static const struct snd_soc_acpi_codecs essx_83x6 = {
 	.codecs = { "ESSX8316", "ESSX8326", "ESSX8336"},
 };
 
-static struct skl_machine_pdata cnl_pdata = {
-	.use_tplg_pcm = true,
-};
-
 struct snd_soc_acpi_mach snd_soc_acpi_intel_cnl_machines[] = {
 	{
 		.id = "INT34C2",
 		.drv_name = "cnl_rt274",
 		.fw_filename = "intel/dsp_fw_cnl.bin",
-		.pdata = &cnl_pdata,
 		.sof_tplg_filename = "sof-cnl-rt274.tplg",
 	},
 	{
diff --git a/sound/soc/intel/common/soc-acpi-intel-ehl-match.c b/sound/soc/intel/common/soc-acpi-intel-ehl-match.c
index 84639c41a268..78255d56b08c 100644
--- a/sound/soc/intel/common/soc-acpi-intel-ehl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-ehl-match.c
@@ -8,7 +8,6 @@
 
 #include <sound/soc-acpi.h>
 #include <sound/soc-acpi-intel-match.h>
-#include "../skylake/skl.h"
 
 struct snd_soc_acpi_mach snd_soc_acpi_intel_ehl_machines[] = {
 	{
diff --git a/sound/soc/intel/common/soc-acpi-intel-hda-match.c b/sound/soc/intel/common/soc-acpi-intel-hda-match.c
index 2017fd0d676f..007ccd8a60e5 100644
--- a/sound/soc/intel/common/soc-acpi-intel-hda-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-hda-match.c
@@ -8,11 +8,6 @@
 
 #include <sound/soc-acpi.h>
 #include <sound/soc-acpi-intel-match.h>
-#include "../skylake/skl.h"
-
-static struct skl_machine_pdata hda_pdata = {
-	.use_tplg_pcm = true,
-};
 
 struct snd_soc_acpi_mach snd_soc_acpi_intel_hda_machines[] = {
 	{
@@ -28,7 +23,6 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_hda_machines[] = {
 		 * can be used if we need a more complicated machine driver
 		 * combining HDA+other device (e.g. DMIC).
 		 */
-		.pdata = &hda_pdata,
 	},
 	{},
 };
diff --git a/sound/soc/intel/common/soc-acpi-intel-icl-match.c b/sound/soc/intel/common/soc-acpi-intel-icl-match.c
index 39875d67dcd1..6ce75fbb842e 100644
--- a/sound/soc/intel/common/soc-acpi-intel-icl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-icl-match.c
@@ -8,23 +8,17 @@
 
 #include <sound/soc-acpi.h>
 #include <sound/soc-acpi-intel-match.h>
-#include "../skylake/skl.h"
 
 static const struct snd_soc_acpi_codecs essx_83x6 = {
 	.num_codecs = 3,
 	.codecs = { "ESSX8316", "ESSX8326", "ESSX8336"},
 };
 
-static struct skl_machine_pdata icl_pdata = {
-	.use_tplg_pcm = true,
-};
-
 struct snd_soc_acpi_mach snd_soc_acpi_intel_icl_machines[] = {
 	{
 		.id = "INT34C2",
 		.drv_name = "icl_rt274",
 		.fw_filename = "intel/dsp_fw_icl.bin",
-		.pdata = &icl_pdata,
 		.sof_tplg_filename = "sof-icl-rt274.tplg",
 	},
 	{
diff --git a/sound/soc/intel/common/soc-acpi-intel-kbl-match.c b/sound/soc/intel/common/soc-acpi-intel-kbl-match.c
index 4e817f559d38..d4c158d8441b 100644
--- a/sound/soc/intel/common/soc-acpi-intel-kbl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-kbl-match.c
@@ -8,9 +8,6 @@
 
 #include <sound/soc-acpi.h>
 #include <sound/soc-acpi-intel-match.h>
-#include "../skylake/skl.h"
-
-static struct skl_machine_pdata skl_dmic_data;
 
 static const struct snd_soc_acpi_codecs kbl_codecs = {
 	.num_codecs = 1,
@@ -54,7 +51,6 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_kbl_machines[] = {
 		.fw_filename = "intel/dsp_fw_kbl.bin",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &kbl_codecs,
-		.pdata = &skl_dmic_data,
 	},
 	{
 		.id = "MX98357A",
@@ -62,7 +58,6 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_kbl_machines[] = {
 		.fw_filename = "intel/dsp_fw_kbl.bin",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &kbl_codecs,
-		.pdata = &skl_dmic_data,
 	},
 	{
 		.id = "MX98927",
@@ -70,7 +65,6 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_kbl_machines[] = {
 		.fw_filename = "intel/dsp_fw_kbl.bin",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &kbl_5663_5514_codecs,
-		.pdata = &skl_dmic_data,
 	},
 	{
 		.id = "MX98927",
@@ -78,7 +72,6 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_kbl_machines[] = {
 		.fw_filename = "intel/dsp_fw_kbl.bin",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &kbl_poppy_codecs,
-		.pdata = &skl_dmic_data,
 	},
 	{
 		.id = "10EC5663",
@@ -91,7 +84,6 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_kbl_machines[] = {
 		.fw_filename = "intel/dsp_fw_kbl.bin",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &kbl_7219_98357_codecs,
-		.pdata = &skl_dmic_data,
 	},
 	{
 		.id = "DLGS7219",
@@ -99,7 +91,6 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_kbl_machines[] = {
 		.fw_filename = "intel/dsp_fw_kbl.bin",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &kbl_7219_98927_codecs,
-		.pdata = &skl_dmic_data
 	},
 	{
 		.id = "10EC5660",
@@ -117,13 +108,11 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_kbl_machines[] = {
 		.fw_filename = "intel/dsp_fw_kbl.bin",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &kbl_7219_98373_codecs,
-		.pdata = &skl_dmic_data
 	},
 	{
 		.id = "MX98373",
 		.drv_name = "kbl_max98373",
 		.fw_filename = "intel/dsp_fw_kbl.bin",
-		.pdata = &skl_dmic_data
 	},
 	{},
 };
diff --git a/sound/soc/intel/common/soc-acpi-intel-skl-match.c b/sound/soc/intel/common/soc-acpi-intel-skl-match.c
index 75302e956742..ee6463202918 100644
--- a/sound/soc/intel/common/soc-acpi-intel-skl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-skl-match.c
@@ -8,9 +8,6 @@
 
 #include <sound/soc-acpi.h>
 #include <sound/soc-acpi-intel-match.h>
-#include "../skylake/skl.h"
-
-static struct skl_machine_pdata skl_dmic_data;
 
 static const struct snd_soc_acpi_codecs skl_codecs = {
 	.num_codecs = 1,
@@ -29,7 +26,6 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_skl_machines[] = {
 		.fw_filename = "intel/dsp_fw_release.bin",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &skl_codecs,
-		.pdata = &skl_dmic_data,
 	},
 	{
 		.id = "MX98357A",
@@ -37,7 +33,6 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_skl_machines[] = {
 		.fw_filename = "intel/dsp_fw_release.bin",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &skl_codecs,
-		.pdata = &skl_dmic_data,
 	},
 	{},
 };
-- 
2.25.1

