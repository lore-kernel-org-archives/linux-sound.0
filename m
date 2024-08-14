Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4CC13D2A4
	for <linux-sound@vger.kernel.org>; Wed, 14 Aug 2024 08:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723624801; cv=none; b=evBV3hpLUMN2oVRFD5phJaVBTKKFgVnB6Y0vCZ4Q3yts8vlx445qOG/9ZJ4IXK8c+UDqXqepyTvMDPLlJ2zo8CRePQwTtpf7lLAwXbgmymuicjBs6kC1b7vj4V4olwf9qyqwMA1VFrBbAcLy4Vjp/GHWhnfcEqofR13SGkVmAXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723624801; c=relaxed/simple;
	bh=DyZHuMxRbS1WG4IuStBEf62M5sG8sNh4freCORNmw9w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FCiR9ZphzjN1lc1uOKALymHHlJzHSrFZAk5rF2CI9fw11y49G3lQVR+HfmMUQTS4aIfYOd1AGCa+Um5ewgEx8MyRQBBmdbBcoGgXAZhgKf2rByTE0/Tnx9ivqnjJBZqXE9WMpLmjS9QXZoxqQthzqcP8tWLgd2W8KBBBf18x0U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f82NEvZ9; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f82NEvZ9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723624800; x=1755160800;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DyZHuMxRbS1WG4IuStBEf62M5sG8sNh4freCORNmw9w=;
  b=f82NEvZ9aEe3TtOOIx4sfTUMOAUzpwajkrQ+7xuyV8IJ6+CVJlHiBtNy
   kFoML7gEMi+PXgSI4nihwNzFJQWNyxZjy//KEug5O+eiKlBJLCCYa823G
   pfpMSeBBiH6HZIFElhD3mrYRlOYyx08wsZLqwXIFOGXeIykERqwMjz397
   CXGdfBUWY4PrYrm3ZX76GJG9vtRw0FS7ru8Yr87ja+kXsfCI0tlkEah5g
   6NqlrZeTZiWZdR+FoqS6CFqYJK9gNhSt6RcJx99olrPe3TjNJU6j6SWNU
   n/gvJtwAsqFFf0QH6+DYwplHQGza+Cw+OCXjFpnydgJNHTUU72Eha+6Lw
   A==;
X-CSE-ConnectionGUID: dZJ3hxzLTkaJ3Mt0E+5ZQg==
X-CSE-MsgGUID: QE+qMXlZTXaaNNchbzSr/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="24735111"
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800"; 
   d="scan'208";a="24735111"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 01:40:00 -0700
X-CSE-ConnectionGUID: PhWAmF+5ROqGi0Ot9ZNnYg==
X-CSE-MsgGUID: QPVBvanSRt6pT1JvJafZaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800"; 
   d="scan'208";a="63867889"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orviesa004.jf.intel.com with ESMTP; 14 Aug 2024 01:39:56 -0700
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
Subject: [PATCH v2 01/14] ALSA: hda: Move SST device entries to AVS
Date: Wed, 14 Aug 2024 10:39:16 +0200
Message-Id: <20240814083929.1217319-2-cezary.rojewski@intel.com>
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

The avs-driver succeeds the skylake-driver. It suppots all
configurations of its predecessor and more. Reflect that in the existing
selection table.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/hda/intel-dsp-config.c | 111 ++++++++++++++++-------------------
 1 file changed, 50 insertions(+), 61 deletions(-)

diff --git a/sound/hda/intel-dsp-config.c b/sound/hda/intel-dsp-config.c
index 913880b09065..f018bd779862 100644
--- a/sound/hda/intel-dsp-config.c
+++ b/sound/hda/intel-dsp-config.c
@@ -56,10 +56,59 @@ static const struct config_entry config_table[] = {
 	},
 #endif
 /*
- * Apollolake (Broxton-P)
+ * Skylake, Kabylake, Apollolake
  * the legacy HDAudio driver is used except on Up Squared (SOF) and
  * Chromebooks (SST), as well as devices based on the ES8336 codec
  */
+#if IS_ENABLED(CONFIG_SND_SOC_INTEL_AVS)
+	{
+		.flags = FLAG_SST,
+		.device = PCI_DEVICE_ID_INTEL_HDA_SKL_LP,
+		.dmi_table = (const struct dmi_system_id []) {
+			{
+				.ident = "Google Chromebooks",
+				.matches = {
+					DMI_MATCH(DMI_SYS_VENDOR, "Google"),
+				}
+			},
+			{}
+		}
+	},
+	{
+		.flags = FLAG_SST | FLAG_SST_ONLY_IF_DMIC,
+		.device = PCI_DEVICE_ID_INTEL_HDA_SKL_LP,
+	},
+	{
+		.flags = FLAG_SST,
+		.device = PCI_DEVICE_ID_INTEL_HDA_KBL_LP,
+		.dmi_table = (const struct dmi_system_id []) {
+			{
+				.ident = "Google Chromebooks",
+				.matches = {
+					DMI_MATCH(DMI_SYS_VENDOR, "Google"),
+				}
+			},
+			{}
+		}
+	},
+	{
+		.flags = FLAG_SST | FLAG_SST_ONLY_IF_DMIC,
+		.device = PCI_DEVICE_ID_INTEL_HDA_KBL_LP,
+	},
+	{
+		.flags = FLAG_SST,
+		.device = PCI_DEVICE_ID_INTEL_HDA_APL,
+		.dmi_table = (const struct dmi_system_id []) {
+			{
+				.ident = "Google Chromebooks",
+				.matches = {
+					DMI_MATCH(DMI_SYS_VENDOR, "Google"),
+				}
+			},
+			{}
+		}
+	},
+#endif
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_APOLLOLAKE)
 	{
 		.flags = FLAG_SOF,
@@ -81,66 +130,6 @@ static const struct config_entry config_table[] = {
 		.codec_hid =  &essx_83x6,
 	},
 #endif
-#if IS_ENABLED(CONFIG_SND_SOC_INTEL_APL)
-	{
-		.flags = FLAG_SST,
-		.device = PCI_DEVICE_ID_INTEL_HDA_APL,
-		.dmi_table = (const struct dmi_system_id []) {
-			{
-				.ident = "Google Chromebooks",
-				.matches = {
-					DMI_MATCH(DMI_SYS_VENDOR, "Google"),
-				}
-			},
-			{}
-		}
-	},
-#endif
-/*
- * Skylake and Kabylake use legacy HDAudio driver except for Google
- * Chromebooks (SST)
- */
-
-/* Sunrise Point-LP */
-#if IS_ENABLED(CONFIG_SND_SOC_INTEL_SKL)
-	{
-		.flags = FLAG_SST,
-		.device = PCI_DEVICE_ID_INTEL_HDA_SKL_LP,
-		.dmi_table = (const struct dmi_system_id []) {
-			{
-				.ident = "Google Chromebooks",
-				.matches = {
-					DMI_MATCH(DMI_SYS_VENDOR, "Google"),
-				}
-			},
-			{}
-		}
-	},
-	{
-		.flags = FLAG_SST | FLAG_SST_ONLY_IF_DMIC,
-		.device = PCI_DEVICE_ID_INTEL_HDA_SKL_LP,
-	},
-#endif
-/* Kabylake-LP */
-#if IS_ENABLED(CONFIG_SND_SOC_INTEL_KBL)
-	{
-		.flags = FLAG_SST,
-		.device = PCI_DEVICE_ID_INTEL_HDA_KBL_LP,
-		.dmi_table = (const struct dmi_system_id []) {
-			{
-				.ident = "Google Chromebooks",
-				.matches = {
-					DMI_MATCH(DMI_SYS_VENDOR, "Google"),
-				}
-			},
-			{}
-		}
-	},
-	{
-		.flags = FLAG_SST | FLAG_SST_ONLY_IF_DMIC,
-		.device = PCI_DEVICE_ID_INTEL_HDA_KBL_LP,
-	},
-#endif
 
 /*
  * Geminilake uses legacy HDAudio driver except for Google
-- 
2.25.1

