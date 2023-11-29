Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R8nTVkHX"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DB0B10E2
	for <linux-sound@vger.kernel.org>; Wed, 29 Nov 2023 04:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701262389; x=1732798389;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Gsoi11OgoW4AAVIkz0NoVKCG5p2h5YJbrCxAOGVMj+8=;
  b=R8nTVkHX66vq+Xzbs3r/kF8DoFQWBPOo/xbdbFF+hdR0OsxrDvkWFyMH
   67Ez5NxJAbrGYlGwFj+EVKZG5Y2hA2ffFfWjW/H6dI1Hf+H7SnAZPhwad
   NK0RYHouDgGqIOAQLeS6Ivuq258tBmWS8IbvBHQIG4ciAf3cug9ouTune
   GbDWHPk10pTQTLGm+ykuW/3ItZgVToq2oipF8t04m7lBtiSmywqKXkQPK
   DQJqpuDdP28TIdBvof5My5BKJUE7r9IMAonY37DTI4DGRNGoyJ3t90vKe
   Vqs1gtnjZZaGSB9ip4J2ayDehA5oYALlZhcyXPZKYraL0YyDKLIQc5638
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="392022935"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="392022935"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 04:53:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="17174638"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.44.16])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 04:53:06 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com
Subject: [PATCH 07/13] ASoC: SOF: core: Implement firmware, topology path setup in core
Date: Wed, 29 Nov 2023 14:53:21 +0200
Message-ID: <20231129125327.23708-8-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129125327.23708-1-peter.ujfalusi@linux.intel.com>
References: <20231129125327.23708-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the information stored in ipc_file_profile_base by platforms to
construct the paths, filenames that are going to be used to load the
firmware and topology files.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/Makefile          |   3 +-
 sound/soc/sof/core.c            |  70 +++++++++++++++--
 sound/soc/sof/fw-file-profile.c | 130 ++++++++++++++++++++++++++++++++
 sound/soc/sof/sof-priv.h        |   7 ++
 4 files changed, 203 insertions(+), 7 deletions(-)
 create mode 100644 sound/soc/sof/fw-file-profile.c

diff --git a/sound/soc/sof/Makefile b/sound/soc/sof/Makefile
index ef6fd43d0b72..3624124575af 100644
--- a/sound/soc/sof/Makefile
+++ b/sound/soc/sof/Makefile
@@ -1,7 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
 
 snd-sof-objs := core.o ops.o loader.o ipc.o pcm.o pm.o debug.o topology.o\
-		control.o trace.o iomem-utils.o sof-audio.o stream-ipc.o
+		control.o trace.o iomem-utils.o sof-audio.o stream-ipc.o\
+		fw-file-profile.o
 
 # IPC implementations
 ifneq ($(CONFIG_SND_SOC_SOF_IPC3),)
diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index a87522ea4301..f1a083de9f9e 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -204,6 +204,67 @@ static int sof_machine_check(struct snd_sof_dev *sdev)
 	return 0;
 }
 
+static int sof_select_ipc_and_paths(struct snd_sof_dev *sdev)
+{
+	struct snd_sof_pdata *plat_data = sdev->pdata;
+	struct sof_loadable_file_profile *base_profile = &plat_data->ipc_file_profile_base;
+	struct sof_loadable_file_profile out_profile;
+	struct device *dev = sdev->dev;
+	int ret;
+
+	/* check IPC support */
+	if (!(BIT(base_profile->ipc_type) & plat_data->desc->ipc_supported_mask)) {
+		dev_err(dev,
+			"ipc_type %d is not supported on this platform, mask is %#x\n",
+			base_profile->ipc_type, plat_data->desc->ipc_supported_mask);
+		return -EINVAL;
+	}
+
+	if (base_profile->ipc_type != plat_data->desc->ipc_default)
+		dev_info(dev,
+			 "Module parameter used, overriding default IPC %d to %d\n",
+			 plat_data->desc->ipc_default, base_profile->ipc_type);
+
+	if (base_profile->fw_path)
+		dev_dbg(dev, "Module parameter used, changed fw path to %s\n",
+			base_profile->fw_path);
+	else if (base_profile->fw_path_postfix)
+		dev_dbg(dev, "Path postfix appended to default fw path: %s\n",
+			base_profile->fw_path_postfix);
+
+	if (base_profile->fw_lib_path)
+		dev_dbg(dev, "Module parameter used, changed fw_lib path to %s\n",
+			base_profile->fw_lib_path);
+	else if (base_profile->fw_lib_path_postfix)
+		dev_dbg(dev, "Path postfix appended to default fw_lib path: %s\n",
+			base_profile->fw_lib_path_postfix);
+
+	if (base_profile->fw_name)
+		dev_dbg(dev, "Module parameter used, changed fw filename to %s\n",
+			base_profile->fw_name);
+
+	if (base_profile->tplg_path)
+		dev_dbg(dev, "Module parameter used, changed tplg path to %s\n",
+			base_profile->tplg_path);
+
+	if (base_profile->tplg_name)
+		dev_dbg(dev, "Module parameter used, changed tplg name to %s\n",
+			base_profile->tplg_name);
+
+	ret = sof_create_ipc_file_profile(sdev, base_profile, &out_profile);
+	if (ret)
+		return ret;
+
+	plat_data->ipc_type = out_profile.ipc_type;
+	plat_data->fw_filename = out_profile.fw_name;
+	plat_data->fw_filename_prefix = out_profile.fw_path;
+	plat_data->fw_lib_prefix = out_profile.fw_lib_path;
+	plat_data->tplg_filename_prefix = out_profile.tplg_path;
+	plat_data->tplg_filename = out_profile.tplg_name;
+
+	return 0;
+}
+
 /*
  *			FW Boot State Transition Diagram
  *
@@ -442,12 +503,9 @@ int snd_sof_device_probe(struct device *dev, struct snd_sof_pdata *plat_data)
 		}
 	}
 
-	/* check IPC support */
-	if (!(BIT(plat_data->ipc_type) & plat_data->desc->ipc_supported_mask)) {
-		dev_err(dev, "ipc_type %d is not supported on this platform, mask is %#x\n",
-			plat_data->ipc_type, plat_data->desc->ipc_supported_mask);
-		return -EINVAL;
-	}
+	ret = sof_select_ipc_and_paths(sdev);
+	if (ret)
+		return ret;
 
 	/* init ops, if necessary */
 	ret = sof_ops_init(sdev);
diff --git a/sound/soc/sof/fw-file-profile.c b/sound/soc/sof/fw-file-profile.c
new file mode 100644
index 000000000000..58b55516049e
--- /dev/null
+++ b/sound/soc/sof/fw-file-profile.c
@@ -0,0 +1,130 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+//
+// This file is provided under a dual BSD/GPLv2 license.  When using or
+// redistributing this file, you may do so under either license.
+//
+// Copyright(c) 2023 Intel Corporation. All rights reserved.
+//
+
+#include <sound/sof.h>
+#include "sof-priv.h"
+
+static int
+sof_file_profile_for_ipc_type(struct device *dev,
+			      const struct sof_dev_desc *desc,
+			      struct sof_loadable_file_profile *base_profile,
+			      struct sof_loadable_file_profile *out_profile)
+{
+	enum sof_ipc_type ipc_type = base_profile->ipc_type;
+	bool fw_lib_path_allocated = false;
+	bool fw_path_allocated = false;
+	int ret = 0;
+
+	/* firmware path */
+	if (base_profile->fw_path) {
+		out_profile->fw_path = base_profile->fw_path;
+	} else if (base_profile->fw_path_postfix) {
+		out_profile->fw_path = devm_kasprintf(dev, GFP_KERNEL, "%s/%s",
+							desc->default_fw_path[ipc_type],
+							base_profile->fw_path_postfix);
+		if (!out_profile->fw_path)
+			return -ENOMEM;
+
+		fw_path_allocated = true;
+	} else {
+		out_profile->fw_path = desc->default_fw_path[ipc_type];
+	}
+
+	/* firmware filename */
+	if (base_profile->fw_name)
+		out_profile->fw_name = base_profile->fw_name;
+	else
+		out_profile->fw_name = desc->default_fw_filename[ipc_type];
+
+
+	/* firmware library path */
+	if (base_profile->fw_lib_path) {
+		out_profile->fw_lib_path = base_profile->fw_lib_path;
+	} else if (desc->default_lib_path[ipc_type]) {
+		if (base_profile->fw_lib_path_postfix) {
+			out_profile->fw_lib_path = devm_kasprintf(dev,
+							GFP_KERNEL, "%s/%s",
+							desc->default_lib_path[ipc_type],
+							base_profile->fw_lib_path_postfix);
+			if (!out_profile->fw_lib_path) {
+				ret = -ENOMEM;
+				goto out;
+			}
+
+			fw_lib_path_allocated = true;
+		} else {
+			out_profile->fw_lib_path = desc->default_lib_path[ipc_type];
+		}
+	}
+
+	if (base_profile->fw_path_postfix)
+		out_profile->fw_path_postfix = base_profile->fw_path_postfix;
+
+	if (base_profile->fw_lib_path_postfix)
+		out_profile->fw_lib_path_postfix = base_profile->fw_lib_path_postfix;
+
+	/* topology path */
+	if (base_profile->tplg_path)
+		out_profile->tplg_path = base_profile->tplg_path;
+	else
+		out_profile->tplg_path = desc->default_tplg_path[ipc_type];
+
+	/* topology name */
+	if (base_profile->tplg_name)
+		out_profile->tplg_name = base_profile->tplg_name;
+
+	out_profile->ipc_type = ipc_type;
+
+out:
+	if (ret) {
+		/* Free up path strings created with devm_kasprintf */
+		if (fw_path_allocated)
+			devm_kfree(dev, out_profile->fw_path);
+		if (fw_lib_path_allocated)
+			devm_kfree(dev, out_profile->fw_lib_path);
+
+		memset(out_profile, 0, sizeof(*out_profile));
+	}
+
+	return ret;
+}
+
+static void sof_print_profile_info(struct device *dev,
+				   struct sof_loadable_file_profile *profile)
+{
+	dev_info(dev, "Firmware paths/files for ipc type %d:\n", profile->ipc_type);
+
+	dev_info(dev, " Firmware file:     %s/%s\n", profile->fw_path, profile->fw_name);
+	if (profile->fw_lib_path)
+		dev_info(dev, " Firmware lib path: %s\n", profile->fw_lib_path);
+	if (profile->tplg_name)
+		dev_info(dev, " Topology file:     %s/%s\n", profile->tplg_path,
+			profile->tplg_name);
+	else
+		dev_info(dev, " Topology path:     %s\n", profile->tplg_path);
+}
+
+int sof_create_ipc_file_profile(struct snd_sof_dev *sdev,
+				struct sof_loadable_file_profile *base_profile,
+				struct sof_loadable_file_profile *out_profile)
+{
+	const struct sof_dev_desc *desc = sdev->pdata->desc;
+	struct device *dev = sdev->dev;
+	int ret;
+
+	memset(out_profile, 0, sizeof(*out_profile));
+
+	ret = sof_file_profile_for_ipc_type(dev, desc, base_profile, out_profile);
+	if (ret)
+		return ret;
+
+	sof_print_profile_info(dev, out_profile);
+
+	return 0;
+}
+EXPORT_SYMBOL(sof_create_ipc_file_profile);
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index faa8a19ed737..6d7897bf9607 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -695,6 +695,13 @@ void snd_sof_new_platform_drv(struct snd_sof_dev *sdev);
  */
 extern struct snd_compress_ops sof_compressed_ops;
 
+/*
+ * Firmware (firmware, libraries, topologies) file location
+ */
+int sof_create_ipc_file_profile(struct snd_sof_dev *sdev,
+				struct sof_loadable_file_profile *base_profile,
+				struct sof_loadable_file_profile *out_profile);
+
 /*
  * Firmware loading.
  */
-- 
2.43.0

