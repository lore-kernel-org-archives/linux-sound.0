Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CB63E63A4
	for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 12:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776170697; cv=none; b=AIDanxI2lil+h5ELpoNRObO1mtFn2EngQZh9K9bVUz7MI5sS9mkImy4rSXaVLkjuMar2QqIi1vcgwf2Dsn2JypzFAiHVZBM18hYUwUqMdZcgj/flfHxjCPwN3q74bpqUYL/KuqyrBW5vmYjyD9PTLms5/tpIMErHZMXqOQe40KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776170697; c=relaxed/simple;
	bh=8w66WaFh6Pz94O6TJ10XzH23FZFep5mPP36OypqWzjY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GPCDzDH6WZwY/ex5iY4HM4y9aO5iR95ohYLMOtiSv+Gi0FlB3q/j59O9FnqF0A2El7fsgc3HAcw6hZ1eh3T8aWpz4CpNzwHcP4ZjWOYm5zzggyiQ5/MUYuWDtJzvi1hWN6owjZy+3thVh1vhFvP4VXlJBLHyWQOnBvZvyMcOJ3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j3HEiIwU; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j3HEiIwU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776170696; x=1807706696;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8w66WaFh6Pz94O6TJ10XzH23FZFep5mPP36OypqWzjY=;
  b=j3HEiIwUI43dzCEqkvIFBU5OVL8/CioJxTL815WFIutAx0Cxgx9Hzf9X
   X4/PSFf6IV+Jpw/1XrSB4ZLPKn7rIly8CXSLdcZdbbB4hSXBUVmOFLg8Y
   7Q1vbfX9XOV7YFfJMPD5jV6jWw0FuX2Qu6BocbW6qylel6bd1HnKp6BXT
   T48d1c4eXQ8PfWcAVKW6RG28wJwr9uhfdv21QrIqlHeeDV0LIbKh7Sa7d
   BUzj32RWkDt4qlyYNpKdraH5/G3Qj37SbB8h5HRYBqthsuhu8mGnE7OUx
   JEwFZpl3JhSP0sCymFFUpasri9hvJl6Gcdb7zHItpgHkZA5mEC289hzlk
   w==;
X-CSE-ConnectionGUID: 0d+cHl8oQeOGscARAai6PQ==
X-CSE-MsgGUID: p/1H1LMbRJSaF37HK1o6Dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="77002737"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="77002737"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 05:44:55 -0700
X-CSE-ConnectionGUID: AammQ+KrSM6dg/MGWn+tTQ==
X-CSE-MsgGUID: 6hJ3aaMTSJaTbRVr9RgsHQ==
X-ExtLoop1: 1
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 05:44:54 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 2/2] ASoC: SOF: topology: allow user to add topologies
Date: Tue, 14 Apr 2026 20:44:43 +0800
Message-ID: <20260414124443.3270016-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260414124443.3270016-1-yung-chuan.liao@linux.intel.com>
References: <20260414124443.3270016-1-yung-chuan.liao@linux.intel.com>
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
 sound/soc/sof/topology.c | 51 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 63d582c65891..36c4ad4283eb 100644
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
+MODULE_PARM_DESC(index, "Topology list for virtual loop DAI link");
+
 #define COMP_ID_UNASSIGNED		0xffffffff
 /*
  * Constants used in the computation of linear volume gain
@@ -2575,6 +2582,50 @@ int snd_sof_load_topology(struct snd_soc_component *scomp, const char *file)
 		}
 	}
 
+	/* Loading user defined topologies */
+	for (i = 0; i < feature_tplg_cnt; i++) {
+		const char *feature_topology = devm_kasprintf(scomp->dev, GFP_KERNEL, "%s/%s",
+							   tplg_filename_prefix,
+							   feature_topologies[i]);
+
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

