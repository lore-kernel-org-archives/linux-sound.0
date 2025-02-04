Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F181E7C3A
	for <linux-sound@vger.kernel.org>; Tue,  4 Feb 2025 05:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738647595; cv=none; b=FahOXoV50EhJNKiVnNabNQRL9RNCVyV5sValx86hnFXTRkL6RSka3l+pDPERhi/OB3F3tg2Kw+7cJfVxVekd97xiHoRnAIEaSu6hV/fSPDkBSefHDjTzAL87FJ6LeiceN27W/u8Oug+vazW8WRVs4vdLtQX69OonNrD1jZWHcwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738647595; c=relaxed/simple;
	bh=4qffLct1y6h2hVijnjdhzJIXVTTTLpp9zvXadDewTEc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B6NDkPzP0pqxVTnluAsQqFj/Kb/GCcKZxImWJZ1B0B0Qi4g/m+F//aSMnYrtBtemN1meDMdTkflURl2v2IfvBUIeLjF86mtGv95eFgC8V7TGvsRwfHBKI8UffvPfUIeuE4nLJTpP0XsjmRKPOah7eLvVHaVYcpZ9NW8rgL8s1N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W8BwFgat; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W8BwFgat"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738647594; x=1770183594;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4qffLct1y6h2hVijnjdhzJIXVTTTLpp9zvXadDewTEc=;
  b=W8BwFgatnocYVlyw6jV/rpgzhMZNP0d+QTG6PlW4iCLolTrqQzRW2r3k
   Wv+jCAH0u1Yqze5PpzKSX+Ks3ikeDRJOF3TFkSldntacOE2aczzzs1uaJ
   3K6DdYQRIjhSGywACCMA+CWm/pRUyB7nFzFhCUnf4oJKT8Pb7aSLUPA1D
   LjLNntp00ZM+E2zkATQaK9hxpq3UdB3lERnL8FJqp3e0b0i+9S4XIgTM3
   6rwi9j7xL63xsJugo7X/PkoS4aNVpVJ47og6/JX8L0bo04PiWNxGlDzuy
   iA2xU4wgDWjHBtSLQBOLazI/3tg761kJLTZL/FHe76n1UORa/8Rpp53Hj
   Q==;
X-CSE-ConnectionGUID: 0McEtC/xQPGLdBoW/uQw9g==
X-CSE-MsgGUID: VD0tgfyUSfqj8xsaAGSxcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="56590575"
X-IronPort-AV: E=Sophos;i="6.13,257,1732608000"; 
   d="scan'208";a="56590575"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 21:39:53 -0800
X-CSE-ConnectionGUID: ORnkPxk9SKKWjISPp6fOgg==
X-CSE-MsgGUID: //3nRUy5QIKl1tnhTRbAzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="115492007"
Received: from iweiny-desk3.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.223.111])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 21:39:52 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 1/3] ASoC: Intel: sof_sdw: Add lookup of quirk using PCI subsystem ID
Date: Tue,  4 Feb 2025 13:39:41 +0800
Message-ID: <20250204053943.93596-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250204053943.93596-1-yung-chuan.liao@linux.intel.com>
References: <20250204053943.93596-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Fitzgerald <rf@opensource.cirrus.com>

Add lookup of PCI subsystem vendor:device ID to find a quirk.

The subsystem ID (SSID) is part of the PCI specification to uniquely
identify a particular system-specific implementation of a hardware
device.

Unlike DMI information, it identifies the sound hardware itself, rather
than a specific model of PC. SSID can be more reliable and stable than
DMI strings, and is preferred by some vendors as the way to identify
the actual sound hardware.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 30 ++++++++++++++++++++++++------
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index b0d35fda7b17..381fae5943fe 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -13,6 +13,7 @@
 #include <linux/soundwire/sdw.h>
 #include <linux/soundwire/sdw_type.h>
 #include <linux/soundwire/sdw_intel.h>
+#include <sound/core.h>
 #include <sound/soc-acpi.h>
 #include "sof_sdw_common.h"
 #include "../../codecs/rt711.h"
@@ -751,6 +752,22 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 	{}
 };
 
+static const struct snd_pci_quirk sof_sdw_ssid_quirk_table[] = {
+	{}
+};
+
+static void sof_sdw_check_ssid_quirk(const struct snd_soc_acpi_mach *mach)
+{
+	const struct snd_pci_quirk *quirk_entry;
+
+	quirk_entry = snd_pci_quirk_lookup_id(mach->mach_params.subsystem_vendor,
+					      mach->mach_params.subsystem_device,
+					      sof_sdw_ssid_quirk_table);
+
+	if (quirk_entry)
+		sof_sdw_quirk = quirk_entry->value;
+}
+
 static struct snd_soc_dai_link_component platform_component[] = {
 	{
 		/* name might be overridden during probe */
@@ -1278,6 +1295,13 @@ static int mc_probe(struct platform_device *pdev)
 
 	snd_soc_card_set_drvdata(card, ctx);
 
+	if (mach->mach_params.subsystem_id_set) {
+		snd_soc_card_set_pci_ssid(card,
+					  mach->mach_params.subsystem_vendor,
+					  mach->mach_params.subsystem_device);
+		sof_sdw_check_ssid_quirk(mach);
+	}
+
 	dmi_check_system(sof_sdw_quirk_table);
 
 	if (quirk_override != -1) {
@@ -1293,12 +1317,6 @@ static int mc_probe(struct platform_device *pdev)
 	for (i = 0; i < ctx->codec_info_list_count; i++)
 		codec_info_list[i].amp_num = 0;
 
-	if (mach->mach_params.subsystem_id_set) {
-		snd_soc_card_set_pci_ssid(card,
-					  mach->mach_params.subsystem_vendor,
-					  mach->mach_params.subsystem_device);
-	}
-
 	ret = sof_card_dai_links_create(card);
 	if (ret < 0)
 		return ret;
-- 
2.43.0

