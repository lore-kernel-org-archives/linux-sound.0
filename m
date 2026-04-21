Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00BB0282F39
	for <linux-sound@vger.kernel.org>; Tue, 21 Apr 2026 09:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776762857; cv=none; b=CpggNc9W+AFlfWC5eq//PGI3Fexdbv9+W7YpW6+P94spUiSqeMinaqCIWFFzh+vhRfiKannYB3rUJ8NTjVBlnjZLM4QiWUcx7iqUPyj+PcH/fvcaPxFDB1giQywNNSGpXIhXMmahSMJqN1FGw+/Bhifm2tU5f3z1VbFMzK/04/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776762857; c=relaxed/simple;
	bh=/L2CWcS28iS9+XHWpTq2BWsXv84Up8+xw8bBcpe3uHs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EJae79OMKwbvTNFuV19VFQsu35dTc+agCf1GxYb7FgEXAL1iBpg5g1Sl2B5IDoeEuTxzrdOf252vsR50SxMCNeqULbBiMHJEduP7x7lZ7ZjPdMygvz7pm4JhZ6DHmWMh70MfwyGTGytoXfYH7f+Z60u4UbsI1oA8UP/FEIy4GFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=csfEwp1V; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="csfEwp1V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776762856; x=1808298856;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/L2CWcS28iS9+XHWpTq2BWsXv84Up8+xw8bBcpe3uHs=;
  b=csfEwp1Vtlmx2CMYv7XftwXx4XQO7b3rilfIHLfF0EASFVLO05aCtlVI
   MZlpQqIqn6F4j1Thsgy/iDXvuL5Dw7v8RVMUP/vdKET9catBxqE6vBWb1
   TpRvKOu8Dzo9Q65S/Y8Nt4pc/Gv193YyUDC4sNAntsODpdD/9st6qgrtk
   mxvczQPC7Ks6TSoFI3q3SN2t4YBMtd2r6TIbavQJ9h4O4Oegnx2YiXt9k
   crAtT+jqCvpi4aGIA/leksKRdd9SaBMGptGpnPepYBe5FjFq06PEbClyX
   oumFYQRSFne0CSmdh3B26vIqBxDeZGk6LqYJUnug+z1cy/5VXLbLYR2yh
   g==;
X-CSE-ConnectionGUID: 8yaVlmNKQPKuyGGQwsFdFg==
X-CSE-MsgGUID: jgq9GYCsRSGN/NdlAoUuEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="88308984"
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; 
   d="scan'208";a="88308984"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 02:14:16 -0700
X-CSE-ConnectionGUID: Ubte1QZcTlK1lvZnuoPqHQ==
X-CSE-MsgGUID: qzQpjfE1RiqDtT/ratHLmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; 
   d="scan'208";a="255254636"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 02:14:14 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH v3 2/2] ASoC: SOF: topology: allow user to add topologies
Date: Tue, 21 Apr 2026 17:13:51 +0800
Message-ID: <20260421091351.4056377-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260421091351.4056377-1-yung-chuan.liao@linux.intel.com>
References: <20260421091351.4056377-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Currently, the function topology provides the basic audio function. The
commit allow the users add their topologies to the topology list. So
they can add their own features.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/topology.c | 55 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 63d582c65891..87b539916b4a 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -23,6 +23,13 @@ static bool disable_function_topology;
 module_param(disable_function_topology, bool, 0444);
 MODULE_PARM_DESC(disable_function_topology, "Disable function topology loading");
 
+#define MAX_FEATURE_TPLG_COUNT 16
+
+static char *feature_topologies[MAX_FEATURE_TPLG_COUNT];
+static int feature_tplg_cnt;
+module_param_array(feature_topologies, charp, &feature_tplg_cnt, 0444);
+MODULE_PARM_DESC(feature_topologies, "Topology list for virtual loop DAI link");
+
 #define COMP_ID_UNASSIGNED		0xffffffff
 /*
  * Constants used in the computation of linear volume gain
@@ -2575,6 +2582,54 @@ int snd_sof_load_topology(struct snd_soc_component *scomp, const char *file)
 		}
 	}
 
+	/* Loading user defined topologies */
+	for (i = 0; i < feature_tplg_cnt; i++) {
+		const char *feature_topology = devm_kasprintf(scomp->dev, GFP_KERNEL, "%s/%s",
+							   tplg_filename_prefix,
+							   feature_topologies[i]);
+
+		if (!feature_topology) {
+			ret = -ENOMEM;
+			goto out;
+		}
+		dev_info(scomp->dev, "loading feature topology %d: %s\n", i, feature_topology);
+		ret = request_firmware(&fw, feature_topology, scomp->dev);
+		if (ret < 0) {
+			/*
+			 * snd_soc_tplg_component_remove(scomp) will be called
+			 * if snd_soc_tplg_component_load(scomp) failed and all
+			 * objects in the scomp will be removed. No need to call
+			 * snd_soc_tplg_component_remove(scomp) here.
+			 */
+			dev_warn(scomp->dev, "feature tplg request firmware %s failed err: %d\n",
+				 feature_topologies[i], ret);
+			/*
+			 * We don't return error here because we can still have the basic
+			 * audio feature when the function topology load complete. No need
+			 * to convert the error code because we will get new 'ret' out of the
+			 * loop.
+			 */
+			continue;
+		}
+
+		if (sdev->dspless_mode_selected)
+			ret = snd_soc_tplg_component_load(scomp, &sof_dspless_tplg_ops, fw);
+		else
+			ret = snd_soc_tplg_component_load(scomp, &sof_tplg_ops, fw);
+
+		release_firmware(fw);
+
+		if (ret < 0) {
+			dev_err(scomp->dev, "feature tplg %s component load failed %d\n",
+				feature_topologies[i], ret);
+			/*
+			 * We need to return error here because it may lead to kernel NULL pointer
+			 * dereference if we continue the remaining tasks.
+			 */
+			goto out;
+		}
+	}
+
 	/* call sof_complete when topologies are loaded successfully */
 	ret = sof_complete(scomp);
 
-- 
2.43.0

