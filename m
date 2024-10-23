Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1C41AE01D
	for <linux-sound@vger.kernel.org>; Wed, 23 Oct 2024 11:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729681549; cv=none; b=jrmfojFOgv94UapbbX+vA4piRITWLBDKHwILmPvZVAeaP4+rzzaVD1E4tEovR9ypBPwGEHYtuhkwg106Dd5d87vGQ7QcKivykFGdzqvxoJq/HWmzNOyStUtYtqrhEM4c/4PEsgqnteIw8u9hu0AGJAwVDNcuL7622od62y9dQYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729681549; c=relaxed/simple;
	bh=XPa+JFUrFAtNfI4s+hJV+TEdEJ3O11LD9CXavA9NUeE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jraBWp/5ruku3agaSzAdZsbjFqikus+mFuW3XUztqYfe/15ZRB5RLcCvJ7ZTtC/T4k0pBu9oznQw+tk5FVxJgeXQndz1y5vKH2e5wajjCbw+wTlM/5IJu5VWQymnGenR7flo0FPOEQhLJVvsm0G6zaU1Xk/2u1bclEf43j0ureI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q2CxDLH6; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q2CxDLH6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729681548; x=1761217548;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XPa+JFUrFAtNfI4s+hJV+TEdEJ3O11LD9CXavA9NUeE=;
  b=Q2CxDLH65mNI7liwqeCEGSMPpwN2plszuobMq9kIdTjrqcH2vuLQGLh8
   RsuGBYO/SFMUxVsrpcdAEM7R0dbAF2Ix3PuzZN4pdL37EvUv0f/KKi1hS
   +byDO1nnjDU+IrvijyUrVAry40nrWgyUbFfNcIYPSg9eZiqGtoxQYd9Dy
   IdOTXLn4a+v2MDSpTb3y0aH/QG7RYGvOF4+eQ7JEJ4UGx1Y0JisSyBQ91
   BDu7J5XAmYSGMMKiKCMEwv33uOD4u1JZFGU4ZCefKZs/9sh7fA1HOUXOl
   L4Y1gMe3AZCU6RJJ5GvDjgBTHVZfZpGhjhzv6kTKjaBWRIF8XFulS4sTZ
   g==;
X-CSE-ConnectionGUID: BCGJ0xW/RO6SKMY9pyHc/g==
X-CSE-MsgGUID: Zxdrf0/kT7uBN6X+nJ6m6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40381197"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="40381197"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 04:05:47 -0700
X-CSE-ConnectionGUID: Pq9R+qVgREuw0zDkEiZ43Q==
X-CSE-MsgGUID: 14aLr0FBTxCOEZ3hDgF2jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; 
   d="scan'208";a="79832694"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.245.23])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 04:05:45 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	daniel.baluta@nxp.com
Subject: [PATCH 2/2] ASoC: SOF: core: Add fw, tplg and ipc type override parameters
Date: Wed, 23 Oct 2024 14:06:10 +0300
Message-ID: <20241023110610.6141-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241023110610.6141-1-peter.ujfalusi@linux.intel.com>
References: <20241023110610.6141-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The different bus type helpers define their own override parameters for
firmware name/path, topology name/path. sof-pci-dev covers all while others
just a subset.
There is no technical reason to do that since these are generic platform
independent parameters.

Add the override module options to core (snd-sof module) and update the
description for the device helper modules as deprecated.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/core.c         | 44 ++++++++++++++++++++++++++++++++++++
 sound/soc/sof/sof-acpi-dev.c |  4 ++--
 sound/soc/sof/sof-of-dev.c   |  8 +++----
 sound/soc/sof/sof-pci-dev.c  | 12 +++++-----
 4 files changed, 56 insertions(+), 12 deletions(-)

diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index 79bbbcca9c60..24e779e8d650 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -19,6 +19,31 @@
 #define CREATE_TRACE_POINTS
 #include <trace/events/sof.h>
 
+/* Module parameters for firmware, topology and IPC type override */
+static char *override_fw_path;
+module_param_named(fw_path, override_fw_path, charp, 0444);
+MODULE_PARM_DESC(fw_path, "alternate path for SOF firmware.");
+
+static char *override_fw_filename;
+module_param_named(fw_filename, override_fw_filename, charp, 0444);
+MODULE_PARM_DESC(fw_filename, "alternate filename for SOF firmware.");
+
+static char *override_lib_path;
+module_param_named(lib_path, override_lib_path, charp, 0444);
+MODULE_PARM_DESC(lib_path, "alternate path for SOF firmware libraries.");
+
+static char *override_tplg_path;
+module_param_named(tplg_path, override_tplg_path, charp, 0444);
+MODULE_PARM_DESC(tplg_path, "alternate path for SOF topology.");
+
+static char *override_tplg_filename;
+module_param_named(tplg_filename, override_tplg_filename, charp, 0444);
+MODULE_PARM_DESC(tplg_filename, "alternate filename for SOF topology.");
+
+static int override_ipc_type = -1;
+module_param_named(ipc_type, override_ipc_type, int, 0444);
+MODULE_PARM_DESC(ipc_type, "Force SOF IPC type. 0 - IPC3, 1 - IPC4");
+
 /* see SOF_DBG_ flags */
 static int sof_core_debug =  IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_ENABLE_FIRMWARE_TRACE);
 module_param_named(sof_debug, sof_core_debug, int, 0444);
@@ -581,6 +606,23 @@ static void sof_probe_work(struct work_struct *work)
 	}
 }
 
+static void
+sof_apply_profile_override(struct sof_loadable_file_profile *path_override)
+{
+	if (override_ipc_type >= 0 && override_ipc_type < SOF_IPC_TYPE_COUNT)
+		path_override->ipc_type = override_ipc_type;
+	if (override_fw_path)
+		path_override->fw_path = override_fw_path;
+	if (override_fw_filename)
+		path_override->fw_name = override_fw_filename;
+	if (override_lib_path)
+		path_override->fw_lib_path = override_lib_path;
+	if (override_tplg_path)
+		path_override->tplg_path = override_tplg_path;
+	if (override_tplg_filename)
+		path_override->tplg_name = override_tplg_filename;
+}
+
 int snd_sof_device_probe(struct device *dev, struct snd_sof_pdata *plat_data)
 {
 	struct snd_sof_dev *sdev;
@@ -612,6 +654,8 @@ int snd_sof_device_probe(struct device *dev, struct snd_sof_pdata *plat_data)
 		}
 	}
 
+	sof_apply_profile_override(&plat_data->ipc_file_profile_base);
+
 	/* Initialize sof_ops based on the initial selected IPC version */
 	ret = sof_init_sof_ops(sdev);
 	if (ret)
diff --git a/sound/soc/sof/sof-acpi-dev.c b/sound/soc/sof/sof-acpi-dev.c
index b196b2b74c26..76ff798a4a1e 100644
--- a/sound/soc/sof/sof-acpi-dev.c
+++ b/sound/soc/sof/sof-acpi-dev.c
@@ -24,11 +24,11 @@
 
 static char *fw_path;
 module_param(fw_path, charp, 0444);
-MODULE_PARM_DESC(fw_path, "alternate path for SOF firmware.");
+MODULE_PARM_DESC(fw_path, "deprecated - moved to snd-sof module.");
 
 static char *tplg_path;
 module_param(tplg_path, charp, 0444);
-MODULE_PARM_DESC(tplg_path, "alternate path for SOF topology.");
+MODULE_PARM_DESC(tplg_path, "deprecated - moved to snd-sof module.");
 
 static int sof_acpi_debug;
 module_param_named(sof_acpi_debug, sof_acpi_debug, int, 0444);
diff --git a/sound/soc/sof/sof-of-dev.c b/sound/soc/sof/sof-of-dev.c
index f245c1b48c47..fb8c8a14d885 100644
--- a/sound/soc/sof/sof-of-dev.c
+++ b/sound/soc/sof/sof-of-dev.c
@@ -16,19 +16,19 @@
 
 static char *fw_path;
 module_param(fw_path, charp, 0444);
-MODULE_PARM_DESC(fw_path, "alternate path for SOF firmware.");
+MODULE_PARM_DESC(fw_path, "deprecated - moved to snd-sof module.");
 
 static char *fw_filename;
 module_param(fw_filename, charp, 0444);
-MODULE_PARM_DESC(fw_filename, "alternate filename for SOF firmware.");
+MODULE_PARM_DESC(fw_filename, "deprecated - moved to snd-sof module.");
 
 static char *tplg_path;
 module_param(tplg_path, charp, 0444);
-MODULE_PARM_DESC(tplg_path, "alternate path for SOF topology.");
+MODULE_PARM_DESC(tplg_path, "deprecated - moved to snd-sof module.");
 
 static char *tplg_filename;
 module_param(tplg_filename, charp, 0444);
-MODULE_PARM_DESC(tplg_filename, "alternate filename for SOF topology.");
+MODULE_PARM_DESC(tplg_filename, "deprecated - moved to snd-sof module.");
 
 const struct dev_pm_ops sof_of_pm = {
 	.prepare = snd_sof_prepare,
diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index 38f2187da5de..fe5650616573 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -22,23 +22,23 @@
 
 static char *fw_path;
 module_param(fw_path, charp, 0444);
-MODULE_PARM_DESC(fw_path, "alternate path for SOF firmware.");
+MODULE_PARM_DESC(fw_path, "deprecated - moved to snd-sof module.");
 
 static char *fw_filename;
 module_param(fw_filename, charp, 0444);
-MODULE_PARM_DESC(fw_filename, "alternate filename for SOF firmware.");
+MODULE_PARM_DESC(fw_filename, "deprecated - moved to snd-sof module.");
 
 static char *lib_path;
 module_param(lib_path, charp, 0444);
-MODULE_PARM_DESC(lib_path, "alternate path for SOF firmware libraries.");
+MODULE_PARM_DESC(lib_path, "deprecated - moved to snd-sof module.");
 
 static char *tplg_path;
 module_param(tplg_path, charp, 0444);
-MODULE_PARM_DESC(tplg_path, "alternate path for SOF topology.");
+MODULE_PARM_DESC(tplg_path, "deprecated - moved to snd-sof module.");
 
 static char *tplg_filename;
 module_param(tplg_filename, charp, 0444);
-MODULE_PARM_DESC(tplg_filename, "alternate filename for SOF topology.");
+MODULE_PARM_DESC(tplg_filename, "deprecated - moved to snd-sof module.");
 
 static int sof_pci_debug;
 module_param_named(sof_pci_debug, sof_pci_debug, int, 0444);
@@ -46,7 +46,7 @@ MODULE_PARM_DESC(sof_pci_debug, "SOF PCI debug options (0x0 all off)");
 
 static int sof_pci_ipc_type = -1;
 module_param_named(ipc_type, sof_pci_ipc_type, int, 0444);
-MODULE_PARM_DESC(ipc_type, "Force SOF IPC type. 0 - IPC3, 1 - IPC4");
+MODULE_PARM_DESC(ipc_type, "deprecated - moved to snd-sof module.");
 
 static const char *sof_dmi_override_tplg_name;
 static bool sof_dmi_use_community_key;
-- 
2.47.0

