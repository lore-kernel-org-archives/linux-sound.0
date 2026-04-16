Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7976133BBAD
	for <linux-sound@vger.kernel.org>; Thu, 16 Apr 2026 05:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776317797; cv=none; b=c3oJGuhysvsITeMq5SG5JAoBpC42w8BDiaD7ZYKXPzO07S8fCvDCHlkXHSBdElmBry0GNGfupsPVCiAIp05ZvDgZT68xIb12ARXPSVKdsuBK4ORM6o4aHZ+W4v+jg8amhOwEPxAUJVM1G4C8pR1o85v0pntOuwHEw6d21NGTN0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776317797; c=relaxed/simple;
	bh=/9AWeCl7UoZZ8i2xFSsmH37kvbcv/9JCjmXJ/dk/geU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SDAJ1kB9O5QL7AMFgYJOkwSw2TnN90l0UyOS7aMoQiJU5ZxTNMOERV5cGmse8Zf0OfTNoP9O42lPv8I3dS6w/mozE2Jk/PudaQhLGRIE1SB79Iw3lwnrSmKpe5hNhTgLGqx8/SJA5OpdMIDmajL8CcCUwiWJtTbigZpGep8OxBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j9iMoJ9+; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j9iMoJ9+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776317796; x=1807853796;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/9AWeCl7UoZZ8i2xFSsmH37kvbcv/9JCjmXJ/dk/geU=;
  b=j9iMoJ9+7eNuUaJiEgJbTiUCL0Gp3lrW49RvIJ6G149a58AVbi4TAVC3
   UPaNwqmokU6xYfPgvAFahI1y+Kuhln73tkj18De+MrOW9dqMgCugBGHhf
   p6sRavcB9YvmrRTgAwfppQQKBoeeH4UjwbGSb/3BXuAybjRBD3GYjxvoG
   IfDS/gd8533Rx5BmJGT+scF4G2vG0IHY8tFXTRAljQEk7PfqfG4NTnDza
   fMwm/oM1IyCGMSx8sK3FHcCzUn4/J7U5UdrhIACC4i0jKpbQjM7TkJN4s
   qm7M3PlnHREwzw8s0w0BlLh+GRWB3gww3q3J+tSlUBQzjulqYbLieGgR2
   g==;
X-CSE-ConnectionGUID: /RPQkFeBTQyK140CA0x1EQ==
X-CSE-MsgGUID: a/Aayj71QpSjdCMUa3x/rQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="94712479"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="94712479"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 22:36:36 -0700
X-CSE-ConnectionGUID: /nIhz03YSoapslbemQLhtA==
X-CSE-MsgGUID: YWeHOv8ZSYylZaWJ7xrB7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="230477956"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 22:36:33 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH v2 2/2] ASoC: SOF: topology: allow user to add topologies
Date: Thu, 16 Apr 2026 13:35:52 +0800
Message-ID: <20260416053552.3464661-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260416053552.3464661-1-yung-chuan.liao@linux.intel.com>
References: <20260416053552.3464661-1-yung-chuan.liao@linux.intel.com>
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
index 63d582c65891..2c3b756aebcc 100644
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

