Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74FD32FE04B
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 09:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756459796; cv=none; b=V4d8NFRqmZ0NOoONJFAlEpSBYP/Qj+W4Si5vCmp/lizjT/acm+PaN6sxPIGKdat4KxHz7Z73KofJ0AoZXqcbgl88NX4ZGT5uHqxGTEclVPlmG0pkvsRsA1soCVHXr5O7RwAhBpFQW8cz+NkmveRgUBxhAerLTAUPpI/uida5Tf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756459796; c=relaxed/simple;
	bh=HEMUEyfIodyE7xuQc+xJL5nkg1PpqaZM7Jn4MT+HaMw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iiw4bxeys2LlV0x21JYPP+sIjTBHfKgqOWF8gO1u61+IqPA6L336tDBmMurlqcIezZsxgyPkR1WpJHFE6JwlUHLwfJgOarrWA3d8XHNqeU3SI7K+Blxjv+lrJDl8VXm5E+4qkpaF0kjYiKHgGGVI1yQI5mZK6jFJQ1lY/D4XRhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DyQsKLEE; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DyQsKLEE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756459794; x=1787995794;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HEMUEyfIodyE7xuQc+xJL5nkg1PpqaZM7Jn4MT+HaMw=;
  b=DyQsKLEEcAz9b7xttjISgRBqHSoeE5+9EDm83epl1FHAn7bk15YWhj5G
   j2Z9z8krdbKpkU8TcoUDwI9J1hfS8U3S2KeABAbP8zUzxaakzQvBJfqV0
   rmnq6l6ZpIVC9JYRm/B5Z/BTrD+wHVVWa9vsQtPw0IT1DKacKDpHoMLLu
   LCePt6mzPWBVNBOM5A9MRUiJ2FMuuHnhjPi2f5h89qF0zoC+1DmT3QIQY
   SFJiRK2wJ9hZ1j1vAlsu52CbLT9aUU/Zc4iKRc5JpfudzjV9rmOFnXU1l
   r5YqVv2n3w5PhZmzQ7Z3YMXZiGLs7bGuSW9q6qpJVQDHf4jpDrZTXXZRx
   g==;
X-CSE-ConnectionGUID: yqCDMDgyR+ie99+s4dDePg==
X-CSE-MsgGUID: waYGo3XrTBK8OLi8GqIXLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="84147901"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="84147901"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 02:29:54 -0700
X-CSE-ConnectionGUID: E1kU8jwkQKyYaUvcqBq6/Q==
X-CSE-MsgGUID: 4LLq3eX2T7ecX0miDdBnPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="170245423"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.56])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 02:29:51 -0700
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
Subject: [PATCH 4/5] ASoC: SOF: sof-client-probes-ipc4: Human readable debugfs "probe_points"
Date: Fri, 29 Aug 2025 12:30:21 +0300
Message-ID: <20250829093022.32094-5-peter.ujfalusi@linux.intel.com>
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

The current output of three integers is not very human readable. Use
ipc4 functions to describe in more detail what the struct
sof_probe_point_desc buffer_id is actually referring to in an ipc4 SOF
system.

Before this commit the "probe_points" debugfs file could read as:

Id: 0x01000004  Purpose: 0  Node id: 0x100
Id: 0x00000006  Purpose: 0  Node id: 0x100

And after in the same situation in an ipc4 system it reads:

0x7,0x0,0x100   gain.1.1 input buf idx 0 (connected)
0x1000005,0x0,0x100     host-copier.0.playback output buf idx 0 (connected)

The triplet in the beginning of the line can be used to reinserted the
probe point again by writing it into "probe_points" debugfs file, if
its first removed by writing the fist number in "probe_points_remove".
The last number is ignored when creating a probe point.

Signed-off-by: Jyri Sarha <jyri.sarha@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/sof-client-probes-ipc4.c | 57 ++++++++++++++++++++++++++
 sound/soc/sof/sof-client-probes.c      | 16 ++++++--
 sound/soc/sof/sof-client-probes.h      |  2 +
 3 files changed, 72 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/sof-client-probes-ipc4.c b/sound/soc/sof/sof-client-probes-ipc4.c
index b719ffa8051b..0b974e6268bb 100644
--- a/sound/soc/sof/sof-client-probes-ipc4.c
+++ b/sound/soc/sof/sof-client-probes-ipc4.c
@@ -8,6 +8,7 @@
 #include <sound/soc.h>
 #include <sound/sof/ipc4/header.h>
 #include <uapi/sound/sof/header.h>
+#include "sof-audio.h"
 #include "ipc4-priv.h"
 #include "sof-client.h"
 #include "sof-client-probes.h"
@@ -48,6 +49,15 @@ enum sof_ipc4_probe_type {
 	SOF_IPC4_PROBE_TYPE_INTERNAL
 };
 
+#define SOF_IPC4_PROBE_TYPE_SHIFT		24
+#define SOF_IPC4_PROBE_TYPE_MASK		GENMASK(25, 24)
+#define SOF_IPC4_PROBE_TYPE_GET(x)		(((x) & SOF_IPC4_PROBE_TYPE_MASK) \
+						 >> SOF_IPC4_PROBE_TYPE_SHIFT)
+#define SOF_IPC4_PROBE_IDX_SHIFT		26
+#define SOF_IPC4_PROBE_IDX_MASK			GENMASK(31, 26)
+#define SOF_IPC4_PROBE_IDX_GET(x)		(((x) & SOF_IPC4_PROBE_IDX_MASK) \
+						 >> SOF_IPC4_PROBE_IDX_SHIFT)
+
 struct sof_ipc4_probe_point {
 	u32 point_id;
 	u32 purpose;
@@ -61,6 +71,20 @@ struct sof_ipc4_probe_info {
 
 #define INVALID_PIPELINE_ID      0xFF
 
+static const char *sof_probe_ipc4_type_string(u32 type)
+{
+	switch (type) {
+	case SOF_IPC4_PROBE_TYPE_INPUT:
+		return "input";
+	case SOF_IPC4_PROBE_TYPE_OUTPUT:
+		return "output";
+	case SOF_IPC4_PROBE_TYPE_INTERNAL:
+		return "internal";
+	default:
+		return "UNKNOWN";
+	}
+}
+
 /**
  * sof_ipc4_probe_get_module_info - Get IPC4 module info for probe module
  * @cdev:		SOF client device
@@ -223,6 +247,38 @@ static int ipc4_probes_points_info(struct sof_client_dev *cdev,
 	return 0;
 }
 
+/**
+ * ipc4_probes_point_print - Human readable print of probe point descriptor
+ * @cdev:	SOF client device
+ * @buf:	Buffer to print to
+ * @size:	Available bytes in buffer
+ * @desc:	Describes the probe point to print
+ * @return:	Number of bytes printed or an error code (snprintf return value)
+ */
+static int ipc4_probes_point_print(struct sof_client_dev *cdev, char *buf, size_t size,
+				   struct sof_probe_point_desc *desc)
+{
+	struct device *dev = &cdev->auxdev.dev;
+	struct snd_sof_widget *swidget;
+	int ret;
+
+	swidget = sof_client_ipc4_find_swidget_by_id(cdev, SOF_IPC4_MOD_ID_GET(desc->buffer_id),
+						     SOF_IPC4_MOD_INSTANCE_GET(desc->buffer_id));
+	if (!swidget)
+		dev_err(dev, "%s: Failed to find widget for module %lu.%lu\n",
+			__func__, SOF_IPC4_MOD_ID_GET(desc->buffer_id),
+			SOF_IPC4_MOD_INSTANCE_GET(desc->buffer_id));
+
+	ret = snprintf(buf, size, "%#x,%#x,%#x\t%s %s buf idx %lu %s\n",
+		       desc->buffer_id, desc->purpose, desc->stream_tag,
+		       swidget ? swidget->widget->name : "<unknown>",
+		       sof_probe_ipc4_type_string(SOF_IPC4_PROBE_TYPE_GET(desc->buffer_id)),
+		       SOF_IPC4_PROBE_IDX_GET(desc->buffer_id),
+		       desc->stream_tag ? "(connected)" : "");
+
+	return ret;
+}
+
 /**
  * ipc4_probes_points_add - connect specified probes
  * @cdev:	SOF client device
@@ -327,6 +383,7 @@ const struct sof_probes_ipc_ops ipc4_probe_ops =  {
 	.init = ipc4_probes_init,
 	.deinit = ipc4_probes_deinit,
 	.points_info = ipc4_probes_points_info,
+	.point_print = ipc4_probes_point_print,
 	.points_add = ipc4_probes_points_add,
 	.points_remove = ipc4_probes_points_remove,
 };
diff --git a/sound/soc/sof/sof-client-probes.c b/sound/soc/sof/sof-client-probes.c
index 663c0d3c314c..242fa19a82ec 100644
--- a/sound/soc/sof/sof-client-probes.c
+++ b/sound/soc/sof/sof-client-probes.c
@@ -17,8 +17,14 @@
 
 #include <sound/soc.h>
 #include <sound/sof/header.h>
+#include <sound/sof/ipc4/header.h>
 #include "sof-client.h"
 #include "sof-client-probes.h"
+#include "sof-audio.h"
+
+#ifdef CONFIG_SND_SOC_SOF_IPC4
+#include "ipc4-priv.h"
+#endif
 
 #define SOF_PROBES_SUSPEND_DELAY_MS 3000
 /* only extraction supported for now */
@@ -223,9 +229,13 @@ static ssize_t sof_probes_dfs_points_read(struct file *file, char __user *to,
 	for (i = 0; i < num_desc; i++) {
 		offset = strlen(buf);
 		remaining = PAGE_SIZE - offset;
-		ret = snprintf(buf + offset, remaining,
-			       "Id: %#010x  Purpose: %u  Node id: %#x\n",
-				desc[i].buffer_id, desc[i].purpose, desc[i].stream_tag);
+		if (ipc->point_print)
+			ret = ipc->point_print(cdev, buf + offset, remaining, &desc[i]);
+		else
+			ret = snprintf(buf + offset, remaining,
+				       "Id: %#010x  Purpose: %u  Node id: %#x\n",
+				       desc[i].buffer_id, desc[i].purpose, desc[i].stream_tag);
+
 		if (ret < 0 || ret >= remaining) {
 			/* truncate the output buffer at the last full line */
 			buf[offset] = '\0';
diff --git a/sound/soc/sof/sof-client-probes.h b/sound/soc/sof/sof-client-probes.h
index da04d65b8d99..c445e435aa35 100644
--- a/sound/soc/sof/sof-client-probes.h
+++ b/sound/soc/sof/sof-client-probes.h
@@ -41,6 +41,8 @@ struct sof_probes_ipc_ops {
 	int (*points_info)(struct sof_client_dev *cdev,
 			   struct sof_probe_point_desc **desc,
 			   size_t *num_desc);
+	int (*point_print)(struct sof_client_dev *cdev, char *buf, size_t size,
+			   struct sof_probe_point_desc *desc);
 	int (*points_add)(struct sof_client_dev *cdev,
 			  struct sof_probe_point_desc *desc,
 			  size_t num_desc);
-- 
2.50.1

