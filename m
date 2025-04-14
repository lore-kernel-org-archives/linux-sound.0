Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260EC2CCC1
	for <linux-sound@vger.kernel.org>; Mon, 14 Apr 2025 06:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744612406; cv=none; b=Ef51Qtg5WXQ35Hl53W50BW4SMA4rYksUs1KdlAIDuSLVGeMzj2GXOaupZoxlu9bZh+Ch0lsBTZp5t1zZBfcY0eZ7fgkXG+XWlV3miJJVFApeeuPXwB/wFNldrE7kKPFju/JBZn3OSZTqTSvWiJ0yzM+tiKdo7vnqiQqmNfde+zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744612406; c=relaxed/simple;
	bh=jgYhblBIAv42DeHHVoOcJkpLQ3MyQPZeuy8BMTkgCv0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FcAUDEHKerY/p/4mzlTu/qtARR32yEpNVOPW3bGB1gM9848zDF4vruD1u3wzFo77rb0voa6BV/tkrDN2RCE1/KyYNuimsPJhuJqyPhgQDszm7FUqH18FCjZISBFf4M5zl9yd/GrQEvVJA6BrTs1vviK/b5bW99qoz9T9Ud4ocy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AEzxOsc9; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AEzxOsc9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744612405; x=1776148405;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jgYhblBIAv42DeHHVoOcJkpLQ3MyQPZeuy8BMTkgCv0=;
  b=AEzxOsc97g9zpSowGybBjs3RXLZLccjnM1aOe2yQhsoS7P2kHHdKrSVL
   x6qfIvGwNwJzEymu8TOGvqIrG+C5tz7kM066xDr2gyyaDAgThKgfOA4MY
   SjQpa9GR1q37rB3y0euLPqPE5njUSsp/1tXID9dwhYpH7BqPhu1lBAiVy
   XxOX33FF49aj9b8xHzH10AtDsyNAQim94uzzsrBvIIZrpChmxHQeqJZ2y
   8qyir/pB8Pzgy3gmIB3B3OLmqjwvV0sHc3jwUsWs3K/V1OO1D7ddRnNMa
   mw6r9tX2edeKQmxxvkljnA+gzKunK0lseIpmf0+Kgr+YiFLbqUWRbs28c
   g==;
X-CSE-ConnectionGUID: B0Jy0cU5S56eyOnYpMmqVw==
X-CSE-MsgGUID: HKd7uJDpSO6aFP3AuyOOow==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="49872621"
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="49872621"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2025 23:33:25 -0700
X-CSE-ConnectionGUID: xyjvc4V3T16dI/l8ygORaw==
X-CSE-MsgGUID: /KNK8YO2TX2MlqLCE0GWBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="130275287"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.118.73])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2025 23:33:24 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 04/11] ASoC: SOF: topology: load multiple topologies
Date: Mon, 14 Apr 2025 14:32:32 +0800
Message-ID: <20250414063239.85200-5-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250414063239.85200-1-yung-chuan.liao@linux.intel.com>
References: <20250414063239.85200-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Currently, we always use single topology file to describe the widgets.
However, with SDCA, we want to be able to load sub-topologies based on
the supported device functions.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/topology.c | 86 +++++++++++++++++++++++++++++++---------
 1 file changed, 68 insertions(+), 18 deletions(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index fc4a9cddd162..e19ba94f2c80 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -2310,8 +2310,10 @@ static const struct snd_soc_tplg_ops sof_tplg_ops = {
 	.link_load	= sof_link_load,
 	.link_unload	= sof_link_unload,
 
-	/* completion - called at completion of firmware loading */
-	.complete	= sof_complete,
+	/*
+	 * No need to set the complete callback. sof_complete will be called explicitly after
+	 * topology loading is complete.
+	 */
 
 	/* manifest - optional to inform component of manifest */
 	.manifest	= sof_manifest,
@@ -2467,34 +2469,82 @@ static const struct snd_soc_tplg_ops sof_dspless_tplg_ops = {
 int snd_sof_load_topology(struct snd_soc_component *scomp, const char *file)
 {
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
+	struct snd_sof_pdata *sof_pdata = sdev->pdata;
+	const char *tplg_filename_prefix = sof_pdata->tplg_filename_prefix;
 	const struct firmware *fw;
+	const char **tplg_files;
+	int tplg_cnt = 0;
 	int ret;
+	int i;
 
-	dev_dbg(scomp->dev, "loading topology:%s\n", file);
+	tplg_files = kcalloc(scomp->card->num_links, sizeof(char *), GFP_KERNEL);
+	if (!tplg_files)
+		return -ENOMEM;
 
-	ret = request_firmware(&fw, file, scomp->dev);
-	if (ret < 0) {
-		dev_err(scomp->dev, "error: tplg request firmware %s failed err: %d\n",
-			file, ret);
-		dev_err(scomp->dev,
-			"you may need to download the firmware from https://github.com/thesofproject/sof-bin/\n");
-		return ret;
+	if (sof_pdata->machine->get_function_tplg_files) {
+		tplg_cnt = sof_pdata->machine->get_function_tplg_files(scomp->card,
+								       sof_pdata->machine,
+								       tplg_filename_prefix,
+								       &tplg_files);
+		if (tplg_cnt < 0) {
+			kfree(tplg_files);
+			return tplg_cnt;
+		}
 	}
 
-	if (sdev->dspless_mode_selected)
-		ret = snd_soc_tplg_component_load(scomp, &sof_dspless_tplg_ops, fw);
-	else
-		ret = snd_soc_tplg_component_load(scomp, &sof_tplg_ops, fw);
+	/*
+	 * The monolithic topology will be used if there is no get_function_tplg_files
+	 * callback or the callback returns 0.
+	 */
+	if (!tplg_cnt) {
+		tplg_files[0] = file;
+		tplg_cnt = 1;
+		dev_dbg(scomp->dev, "loading topology: %s\n", file);
+	} else {
+		dev_info(scomp->dev, "Using function topologies instead %s\n", file);
+	}
+
+	for (i = 0; i < tplg_cnt; i++) {
+		/* Only print the file names if the function topologies are used */
+		if (tplg_files[0] != file)
+			dev_info(scomp->dev, "loading topology %d: %s\n", i, tplg_files[i]);
+
+		ret = request_firmware(&fw, tplg_files[i], scomp->dev);
+		if (ret < 0) {
+			/*
+			 * snd_soc_tplg_component_remove(scomp) will be called
+			 * if snd_soc_tplg_component_load(scomp) failed and all
+			 * objects in the scomp will be removed. No need to call
+			 * snd_soc_tplg_component_remove(scomp) here.
+			 */
+			dev_err(scomp->dev, "tplg request firmware %s failed err: %d\n",
+				tplg_files[i], ret);
+			goto out;
+		}
 
-	if (ret < 0)
-		dev_err(scomp->dev, "error: tplg component load failed %d\n",
-			ret);
+		if (sdev->dspless_mode_selected)
+			ret = snd_soc_tplg_component_load(scomp, &sof_dspless_tplg_ops, fw);
+		else
+			ret = snd_soc_tplg_component_load(scomp, &sof_tplg_ops, fw);
+
+		release_firmware(fw);
+
+		if (ret < 0) {
+			dev_err(scomp->dev, "tplg %s component load failed %d\n",
+				tplg_files[i], ret);
+			goto out;
+		}
+	}
 
-	release_firmware(fw);
+	/* call sof_complete when topologies are loaded successfully */
+	ret = sof_complete(scomp);
 
+out:
 	if (ret >= 0 && sdev->led_present)
 		ret = snd_ctl_led_request();
 
+	kfree(tplg_files);
+
 	return ret;
 }
 EXPORT_SYMBOL(snd_sof_load_topology);
-- 
2.43.0

