Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803A0214231
	for <linux-sound@vger.kernel.org>; Thu,  6 Feb 2025 08:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738831924; cv=none; b=Uy81J3FSUYHx5+LV6v0sfB5OgdY+A82KdmwX4IcEjPIcrCuEm/412lKbsbXMbUhAj1xbUPS24aFu3lklnHBiHBkmTkvRf07SNDwc+d3Bh7ND8I7WiZ4ofEYq2I1bVt6vSBAqFLV0FPpz4vB2Jpta0+mMYAxoziKhJww5TjbzOKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738831924; c=relaxed/simple;
	bh=KSzCqDEzNMMAQyijPfpbiN6F9gEavulb1bh9JMGYS0w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n0aa6zKXJ4+eq+lN+6AESGL9sVJnDZSqM9S9HpN7a9xct2z+F/SIIXx4m/5n0ug4q/YB2pGEfiICy+rOObJX6t+QJ42pJCZ/aPBlWG1G4mX0gtXyv6Sq+znbCEJzG4Fp7tx/bj4Qwv6aAxVWfTbZ9CbwZmMNCkKvoQL6njLOLEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M6iZPtx4; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M6iZPtx4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738831922; x=1770367922;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=KSzCqDEzNMMAQyijPfpbiN6F9gEavulb1bh9JMGYS0w=;
  b=M6iZPtx4J0BFDnfeI0ZIa/wD9vF/e2LLroh2AWL5WNIJs9yS3O/ELToU
   376BpyM79zgPt8+w3cR9fot00cn1i6c5ztcoHbvQEh6u9Hhbi1bxekalq
   a8D9gAkl5a9EDMRckWK+BWtlQWe3UOb49tD7ZzLzbbOZHuLz9ITq/qVmY
   VdOpzWhvKkNHz31qUJ0XZR/BnAfIu2Ec6seO+LR2fNu61JLs6fYTVwyBW
   gsXN/caVZjc178fgKu6ANp6hGy+GU/kPBVzx4mGyUNdLmo7luiLBfSi8J
   fBKGJj4HJYCxQV7REms/kOw8VHx08fAOSH0vYdkeVcFia79bHRLECn7JW
   g==;
X-CSE-ConnectionGUID: GT7xulvASYuGo2p9npyJkw==
X-CSE-MsgGUID: UYInERG2RlWSM7Kr1iEyYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="50818099"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="50818099"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 00:52:01 -0800
X-CSE-ConnectionGUID: Ek5uc+Q2RqG0m/LIw8b6Gw==
X-CSE-MsgGUID: QA9QN7L6QkexvC9V8bzLDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111604638"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.33])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 00:51:59 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	guennadi.liakhovetski@linux.intel.com
Subject: [PATCH] ASoC: SOF: ipc4: Add support for split firmware releases
Date: Thu,  6 Feb 2025 10:52:37 +0200
Message-ID: <20250206085237.19214-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A split SOF release consists of a base firmware and two libraries:
<fw_filename>-openmodules.ri for processing (audio) modules
<fw_filename>-debug.ri for debug and developer modules

To handle this new release model add infrastructure to try to load the two
library after boot optionally.

This approach will allow flexibility on handling platforms in sof-bin with
single or split configuration:
single release: base firmware only
split release: base firmware + openmodules + debug

The files for the split firmware are located at the firmware directory.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc4-loader.c | 143 +++++++++++++++++++++++++++++-------
 sound/soc/sof/ipc4-priv.h   |   1 +
 sound/soc/sof/ipc4.c        |   8 +-
 3 files changed, 126 insertions(+), 26 deletions(-)

diff --git a/sound/soc/sof/ipc4-loader.c b/sound/soc/sof/ipc4-loader.c
index bcdb33d03682..6ad1ef0e53e8 100644
--- a/sound/soc/sof/ipc4-loader.c
+++ b/sound/soc/sof/ipc4-loader.c
@@ -169,21 +169,14 @@ static size_t sof_ipc4_fw_parse_basefw_ext_man(struct snd_sof_dev *sdev)
 	return payload_offset;
 }
 
-static int sof_ipc4_load_library_by_uuid(struct snd_sof_dev *sdev,
-					 unsigned long lib_id, const guid_t *uuid)
+static int sof_ipc4_load_library(struct snd_sof_dev *sdev, unsigned long lib_id,
+				 const char *lib_filename, bool optional)
 {
 	struct sof_ipc4_fw_data *ipc4_data = sdev->private;
 	struct sof_ipc4_fw_library *fw_lib;
-	const char *fw_filename;
 	ssize_t payload_offset;
 	int ret, i, err;
 
-	if (!sdev->pdata->fw_lib_prefix) {
-		dev_err(sdev->dev,
-			"Library loading is not supported due to not set library path\n");
-		return -EINVAL;
-	}
-
 	if (!ipc4_data->load_library) {
 		dev_err(sdev->dev, "Library loading is not supported on this platform\n");
 		return -EOPNOTSUPP;
@@ -193,21 +186,26 @@ static int sof_ipc4_load_library_by_uuid(struct snd_sof_dev *sdev,
 	if (!fw_lib)
 		return -ENOMEM;
 
-	fw_filename = kasprintf(GFP_KERNEL, "%s/%pUL.bin",
-				sdev->pdata->fw_lib_prefix, uuid);
-	if (!fw_filename) {
-		ret = -ENOMEM;
-		goto free_fw_lib;
-	}
-
-	ret = request_firmware(&fw_lib->sof_fw.fw, fw_filename, sdev->dev);
-	if (ret < 0) {
-		dev_err(sdev->dev, "Library file '%s' is missing\n", fw_filename);
-		goto free_filename;
+	if (optional) {
+		ret = firmware_request_nowarn(&fw_lib->sof_fw.fw, lib_filename,
+					      sdev->dev);
+		if (ret < 0) {
+			/* optional library, override the error */
+			ret = 0;
+			goto free_fw_lib;
+		}
 	} else {
-		dev_dbg(sdev->dev, "Library file '%s' loaded\n", fw_filename);
+		ret = request_firmware(&fw_lib->sof_fw.fw, lib_filename,
+				       sdev->dev);
+		if (ret < 0) {
+			dev_err(sdev->dev, "Library file '%s' is missing\n",
+				lib_filename);
+			goto free_fw_lib;
+		}
 	}
 
+	dev_dbg(sdev->dev, "Library file '%s' loaded\n", lib_filename);
+
 	payload_offset = sof_ipc4_fw_parse_ext_man(sdev, fw_lib);
 	if (payload_offset <= 0) {
 		if (!payload_offset)
@@ -251,22 +249,117 @@ static int sof_ipc4_load_library_by_uuid(struct snd_sof_dev *sdev,
 	if (unlikely(ret))
 		goto release;
 
-	kfree(fw_filename);
-
 	return 0;
 
 release:
 	release_firmware(fw_lib->sof_fw.fw);
 	/* Allocated within sof_ipc4_fw_parse_ext_man() */
 	devm_kfree(sdev->dev, fw_lib->modules);
-free_filename:
-	kfree(fw_filename);
 free_fw_lib:
 	devm_kfree(sdev->dev, fw_lib);
 
 	return ret;
 }
 
+/**
+ * sof_ipc4_complete_split_release - loads the library parts of a split firmware
+ * @sdev: SOF device
+ *
+ * With IPC4 the firmware can be a single binary or a split release.
+ * - single binary: only the basefw
+ * - split release: basefw and two libraries (openmodules, debug)
+ *
+ * With split firmware release it is also allowed that for example only the
+ * debug library is present (the openmodules content is built in the basefw).
+ *
+ * To handle the permutations try to load the openmodules then the debug
+ * libraries as optional ones after the basefw boot.
+ *
+ * The libraries for the split release are stored alongside the basefw on the
+ * filesystem.
+ */
+int sof_ipc4_complete_split_release(struct snd_sof_dev *sdev)
+{
+	static const char * const lib_bundle[] = { "openmodules", "debug" };
+	const char *fw_filename = sdev->pdata->fw_filename;
+	const char *lib_filename, *p;
+	size_t lib_name_base_size;
+	unsigned long lib_id = 1;
+	char *lib_name_base;
+	int i;
+
+	p = strstr(fw_filename, ".ri");
+	if (!p || strlen(p) != 3) {
+		dev_info(sdev->dev,
+			 "%s: Firmware name '%s' is missing .ri extension\n",
+			 __func__, fw_filename);
+		return 0;
+	}
+
+	/* Space for the firmware basename + '\0', without the extension */
+	lib_name_base_size = strlen(fw_filename) - 2;
+	lib_name_base = kzalloc(lib_name_base_size, GFP_KERNEL);
+	if (!lib_name_base)
+		return -ENOMEM;
+
+	/*
+	 * strscpy will 0 terminate the copied string, removing the '.ri' from
+	 * the end of the fw_filename, for example:
+	 * fw_filename:		"sof-ptl.ri\0"
+	 * lib_name_base:	"sof-ptl\0"
+	 */
+	strscpy(lib_name_base, fw_filename, lib_name_base_size);
+
+	for (i = 0; i < ARRAY_SIZE(lib_bundle); i++) {
+		int ret;
+
+		lib_filename = kasprintf(GFP_KERNEL, "%s/%s-%s.ri",
+					 sdev->pdata->fw_filename_prefix,
+					 lib_name_base, lib_bundle[i]);
+		if (!lib_filename) {
+			kfree(lib_name_base);
+			return -ENOMEM;
+		}
+
+		ret = sof_ipc4_load_library(sdev, lib_id, lib_filename, true);
+		if (ret)
+			dev_warn(sdev->dev, "%s: Failed to load %s: %d\n",
+				 __func__, lib_filename, ret);
+		else
+			lib_id++;
+
+		kfree(lib_filename);
+	}
+
+	kfree(lib_name_base);
+
+	return 0;
+}
+
+static int sof_ipc4_load_library_by_uuid(struct snd_sof_dev *sdev,
+					 unsigned long lib_id, const guid_t *uuid)
+{
+	const char *lib_filename;
+	int ret;
+
+	if (!sdev->pdata->fw_lib_prefix) {
+		dev_err(sdev->dev,
+			"Library loading is not supported due to not set library path\n");
+		return -EINVAL;
+	}
+
+	lib_filename = kasprintf(GFP_KERNEL, "%s/%pUL.bin",
+				 sdev->pdata->fw_lib_prefix, uuid);
+	if (!lib_filename)
+		return -ENOMEM;
+
+	ret = sof_ipc4_load_library(sdev, lib_id, lib_filename, false);
+
+	kfree(lib_filename);
+
+	return ret;
+}
+
 struct sof_ipc4_fw_module *sof_ipc4_find_module_by_uuid(struct snd_sof_dev *sdev,
 							const guid_t *uuid)
 {
diff --git a/sound/soc/sof/ipc4-priv.h b/sound/soc/sof/ipc4-priv.h
index ea3323b90343..b798810eff91 100644
--- a/sound/soc/sof/ipc4-priv.h
+++ b/sound/soc/sof/ipc4-priv.h
@@ -101,6 +101,7 @@ extern const struct sof_ipc_fw_tracing_ops ipc4_mtrace_ops;
 int sof_ipc4_set_pipeline_state(struct snd_sof_dev *sdev, u32 instance_id, u32 state);
 int sof_ipc4_mtrace_update_pos(struct snd_sof_dev *sdev, int core);
 
+int sof_ipc4_complete_split_release(struct snd_sof_dev *sdev);
 int sof_ipc4_query_fw_configuration(struct snd_sof_dev *sdev);
 int sof_ipc4_reload_fw_libraries(struct snd_sof_dev *sdev);
 struct sof_ipc4_fw_module *sof_ipc4_find_module_by_uuid(struct snd_sof_dev *sdev,
diff --git a/sound/soc/sof/ipc4.c b/sound/soc/sof/ipc4.c
index 4386cbae16d4..2ed0c52fb2f1 100644
--- a/sound/soc/sof/ipc4.c
+++ b/sound/soc/sof/ipc4.c
@@ -825,8 +825,14 @@ static void sof_ipc4_exit(struct snd_sof_dev *sdev)
 
 static int sof_ipc4_post_boot(struct snd_sof_dev *sdev)
 {
-	if (sdev->first_boot)
+	if (sdev->first_boot) {
+		int  ret = sof_ipc4_complete_split_release(sdev);
+
+		if (ret)
+			return ret;
+
 		return sof_ipc4_query_fw_configuration(sdev);
+	}
 
 	return sof_ipc4_reload_fw_libraries(sdev);
 }
-- 
2.48.1

