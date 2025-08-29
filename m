Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B41277003
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 09:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756459787; cv=none; b=VScQANEFafwF4iFoEbGKBuqy3EsLkgQMCnRBs3w3N6HvewZ32EWhUQOwzqWQxQ5TQQEEN2+AMXA0cjQ6eKKM2IGDDBXWkoOz2J8HGv5vmod8ogY05apv5lYDlRbeq+0t/Vc8om3CTyKroFzZRaYEeDOdUKKMBmXFaNd0gtUCb48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756459787; c=relaxed/simple;
	bh=vMQ6HYMFs6GfU765k0+XaCurj7/tybA7rmMBew1oxAk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ppOZWV9CoO+nqZGvh+fawXqvr+fA8h4kr5ybbKLIYq5EhGwxobD03fwopk9vBTBN9SjOyIwsClc+KAPw7MHCsrRs74R01TwOzfOJgh05Q4bmvAYnYsqgW8jY41ineuL3Rm6NSL2yn5lAoUgDXB308bI+IONQQHbPzibEIxJacvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jzg0m/Jh; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jzg0m/Jh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756459786; x=1787995786;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vMQ6HYMFs6GfU765k0+XaCurj7/tybA7rmMBew1oxAk=;
  b=Jzg0m/JhwVoJneB4rF7eKG8bq+rmUuPsnvO7w236lAB0iDHz20+3wx2q
   g4CEq3rWB5X7ezYMSU1NGm0kVZgUyUh84EbBzDfvibHW9axGdvGGgxfd/
   lvVsjCfDvcvk5nOzSjXaXW9OxcqBbLl3d1cjJ55HybreVKQkkjwCZwi4t
   nI3/l8172eW/WH6jIJlDWHu0ex/j3bX62gYGKdhzf5syutdEUjYd5Bh2J
   ddOqlNwrvwdNuX8cja+Ih1wPT45+grijWn4KtCQqEPF9Etk9Tav+L6rzr
   APNq7/MpDK43F3Uq/jShOGaY1A+NlZ96nfaYmy22pUFp4Ea7MpxzVPlUy
   g==;
X-CSE-ConnectionGUID: UOLdHKdXR6uu6nIZqZ0XKg==
X-CSE-MsgGUID: PhitanPvSJCROFSP/ihZZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="84147882"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="84147882"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 02:29:45 -0700
X-CSE-ConnectionGUID: SJ2RAwTuR/aXj1cTezYzKA==
X-CSE-MsgGUID: uwYJU+sAR4ik6vbr53cUHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="170245407"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.56])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 02:29:43 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	liam.r.girdwood@intel.com,
	jyri.sarha@linux.intel.com
Subject: [PATCH 1/5] ASoC: SOF: sof-client-probes-ipc4: Implement ipc4_probes_points_info
Date: Fri, 29 Aug 2025 12:30:18 +0300
Message-ID: <20250829093022.32094-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829093022.32094-1-peter.ujfalusi@linux.intel.com>
References: <20250829093022.32094-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jyri Sarha <jyri.sarha@linux.intel.com>

Upgrade the struct sof_probes_ipc_ops points_info() method from dummy
implementation to a working implementation. The actual functionality
requires that the DSP FW supports the IPC request. The support was
just recently added. If its not there an IPC failure is reported in
the logs.

Signed-off-by: Jyri Sarha <jyri.sarha@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/sof-client-probes-ipc4.c | 53 +++++++++++++++++++++++---
 1 file changed, 47 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sof/sof-client-probes-ipc4.c b/sound/soc/sof/sof-client-probes-ipc4.c
index 603aed222480..b719ffa8051b 100644
--- a/sound/soc/sof/sof-client-probes-ipc4.c
+++ b/sound/soc/sof/sof-client-probes-ipc4.c
@@ -8,7 +8,6 @@
 #include <sound/soc.h>
 #include <sound/sof/ipc4/header.h>
 #include <uapi/sound/sof/header.h>
-#include "sof-priv.h"
 #include "ipc4-priv.h"
 #include "sof-client.h"
 #include "sof-client-probes.h"
@@ -55,6 +54,11 @@ struct sof_ipc4_probe_point {
 	u32 stream_tag;
 } __packed __aligned(4);
 
+struct sof_ipc4_probe_info {
+	unsigned int num_elems;
+	DECLARE_FLEX_ARRAY(struct sof_ipc4_probe_point, points);
+} __packed;
+
 #define INVALID_PIPELINE_ID      0xFF
 
 /**
@@ -169,16 +173,53 @@ static int ipc4_probes_deinit(struct sof_client_dev *cdev)
  * @desc:	Returned list of active probes
  * @num_desc:	Returned count of active probes
  * @return:	0 on success, negative error code on error
- *
- * Dummy implementation returning empty list of probes.
  */
 static int ipc4_probes_points_info(struct sof_client_dev *cdev,
 				   struct sof_probe_point_desc **desc,
 				   size_t *num_desc)
 {
-	/* TODO: Firmware side implementation needed first */
-	*desc = NULL;
-	*num_desc = 0;
+	struct sof_man4_module *mentry = sof_ipc4_probe_get_module_info(cdev);
+	struct device *dev = &cdev->auxdev.dev;
+	struct sof_ipc4_probe_info *info;
+	struct sof_ipc4_msg msg;
+	int i, ret;
+
+	if (!mentry)
+		return -ENODEV;
+
+	msg.primary = mentry->id;
+	msg.primary |= SOF_IPC4_MSG_DIR(SOF_IPC4_MSG_REQUEST);
+	msg.primary |= SOF_IPC4_MSG_TARGET(SOF_IPC4_MODULE_MSG);
+
+	msg.extension = SOF_IPC4_MOD_EXT_MSG_PARAM_ID(SOF_IPC4_PROBE_POINTS);
+
+	msg.data_size = sof_client_get_ipc_max_payload_size(cdev);
+	msg.data_ptr = kzalloc(msg.data_size, GFP_KERNEL);
+	if (!msg.data_ptr)
+		return -ENOMEM;
+
+	ret = sof_client_ipc_set_get_data(cdev, &msg, false);
+	if (ret) {
+		kfree(msg.data_ptr);
+		return ret;
+	}
+	info = msg.data_ptr;
+	*num_desc = info->num_elems;
+	dev_dbg(dev, "%s: got %zu probe points", __func__, *num_desc);
+
+	*desc = kzalloc(*num_desc * sizeof(**desc), GFP_KERNEL);
+	if (!*desc) {
+		kfree(msg.data_ptr);
+		return -ENOMEM;
+	}
+
+	for (i = 0; i < *num_desc; i++) {
+		(*desc)[i].buffer_id = info->points[i].point_id;
+		(*desc)[i].purpose = info->points[i].purpose;
+		(*desc)[i].stream_tag = info->points[i].stream_tag;
+	}
+	kfree(msg.data_ptr);
+
 	return 0;
 }
 
-- 
2.50.1

