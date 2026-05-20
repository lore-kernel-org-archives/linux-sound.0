Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CCD3E6385
	for <linux-sound@vger.kernel.org>; Wed, 20 May 2026 14:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779286423; cv=none; b=DmhgR5ZlqDu0oREgpSgMmxI+iRhSe7ZgEroNWbAYhP4ZsvYZF5ZetpZ4ZBe2raSkNSdWjcMhROIpyzjoRZpvW+FiLzcdCRzlIEB5hkbb2uShFQLci5ggUbzmHujQR5j2/7EiQy7gUuwa344Q0XxlLxHnITMCzXatq+n6xHN37XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779286423; c=relaxed/simple;
	bh=Zd9I8HH5J0AGcNALU9XEtIdg02v9TfqS9rU/B9sNb8Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D/RzJHLPNNHhGv4FGFIm23JSeMSJIiA5+xOdncGMIJLIpWEHTzatgbBqTJqLQNBKP5zuwMSeGDWhckHm3HSWyy4vUv2pIfNgiwqRoEnQy0AygYbX+eXmTwHSJ3jkynKjZBnYr3odLcF0ILoq6DUe9QDT9i5pilGCs4QSIMKNVmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MEvODh1n; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MEvODh1n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779286421; x=1810822421;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Zd9I8HH5J0AGcNALU9XEtIdg02v9TfqS9rU/B9sNb8Q=;
  b=MEvODh1nGtdnPFUGBBFiIIgGHjSKrCR7a53htSBoZewmFdZMnzALvTma
   QjFrUAR7oG75scDZjk9LqDrp8fVjbdCBJpSRPg4KzJtXkXtSHT/HbOlXe
   7fkaC0vdG77Qn86b3Not4g2oDIxcibfcKpJprXPO1GbGBQ001Fe8XZWWw
   7qxpNNt/zHXOa+ye4IkmXRQvGpk1TQManvJ1gYm/WER6hTHncvzuy2qJf
   JEJFX4LD4NNcr4pOJtv+uEgMlwR2rmTaqFOY2gyzXW2LD5QVFW/ZxdPny
   eTufmpKAKVfbpZpxcQbDeMVUF1n/0WBrvsXFF+TBWfoUeP9vcYkmcuHb5
   A==;
X-CSE-ConnectionGUID: J8B/bAzLRu60vXxk//FUvw==
X-CSE-MsgGUID: wjZ1GJDVQyW5R52IUGbqtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="80167431"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="80167431"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 07:13:40 -0700
X-CSE-ConnectionGUID: d6RAprr6RvCv94z+TR9VKg==
X-CSE-MsgGUID: thFfMKofS8eLztOhWAWWPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="235765384"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.245.85])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 07:13:38 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev
Subject: [PATCH] ASoC: SOF: ipc4-control: Use local copy of IPC message for sending
Date: Wed, 20 May 2026 17:13:49 +0300
Message-ID: <20260520141349.9625-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If a kcontrol update comes to a control right at the same time when the
PCM containing the control is started up then there is a small window when
a race can happen:
while the widget is set up the swidget->setup_mutex is taken in topology
level and if the control update comes at this point, it will be stopped
within sof_ipc4_set_get_kcontrol_data() with the mutex and it will be
blocked until the swidget setup is done, which will clear the control's
IPC message payload.

To avoid such race, use local copy of the template IPC message instead of
the template directly. This will ensure data integrity in case of
concurrent updates during initialization.

Link: https://github.com/thesofproject/linux/issues/5734
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/ipc4-control.c | 90 ++++++++++++++++--------------------
 1 file changed, 41 insertions(+), 49 deletions(-)

diff --git a/sound/soc/sof/ipc4-control.c b/sound/soc/sof/ipc4-control.c
index 596c3d77a34e..4ce821f96a91 100644
--- a/sound/soc/sof/ipc4-control.c
+++ b/sound/soc/sof/ipc4-control.c
@@ -13,13 +13,12 @@
 #include "ipc4-topology.h"
 
 static int sof_ipc4_set_get_kcontrol_data(struct snd_sof_control *scontrol,
+					  struct sof_ipc4_msg *msg,
 					  bool set, bool lock)
 {
-	struct sof_ipc4_control_data *cdata = scontrol->ipc_control_data;
 	struct snd_soc_component *scomp = scontrol->scomp;
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	const struct sof_ipc_ops *iops = sdev->ipc->ops;
-	struct sof_ipc4_msg *msg = &cdata->msg;
 	struct snd_sof_widget *swidget;
 	bool widget_found = false;
 	int ret = 0;
@@ -88,9 +87,9 @@ sof_ipc4_set_volume_data(struct snd_sof_dev *sdev, struct snd_sof_widget *swidge
 {
 	struct sof_ipc4_control_data *cdata = scontrol->ipc_control_data;
 	struct sof_ipc4_gain *gain = swidget->private;
-	struct sof_ipc4_msg *msg = &cdata->msg;
 	struct sof_ipc4_gain_params params;
 	bool all_channels_equal = true;
+	struct sof_ipc4_msg msg;
 	u32 value;
 	int ret, i;
 
@@ -107,6 +106,7 @@ sof_ipc4_set_volume_data(struct snd_sof_dev *sdev, struct snd_sof_widget *swidge
 	 * notify DSP with a single IPC message if all channel values are equal. Otherwise send
 	 * a separate IPC for each channel.
 	 */
+	memcpy(&msg, &cdata->msg, sizeof(msg));
 	for (i = 0; i < scontrol->num_channels; i++) {
 		if (all_channels_equal) {
 			params.channels = SOF_IPC4_GAIN_ALL_CHANNELS_MASK;
@@ -121,12 +121,10 @@ sof_ipc4_set_volume_data(struct snd_sof_dev *sdev, struct snd_sof_widget *swidge
 		params.curve_duration_h = gain->data.params.curve_duration_h;
 		params.curve_type = gain->data.params.curve_type;
 
-		msg->data_ptr = &params;
-		msg->data_size = sizeof(params);
+		msg.data_ptr = &params;
+		msg.data_size = sizeof(params);
 
-		ret = sof_ipc4_set_get_kcontrol_data(scontrol, true, lock);
-		msg->data_ptr = NULL;
-		msg->data_size = 0;
+		ret = sof_ipc4_set_get_kcontrol_data(scontrol, &msg, true, lock);
 		if (ret < 0) {
 			dev_err(sdev->dev, "Failed to set volume update for %s\n",
 				scontrol->name);
@@ -208,7 +206,7 @@ sof_ipc4_set_generic_control_data(struct snd_sof_dev *sdev,
 {
 	struct sof_ipc4_control_data *cdata = scontrol->ipc_control_data;
 	struct sof_ipc4_control_msg_payload *data;
-	struct sof_ipc4_msg *msg = &cdata->msg;
+	struct sof_ipc4_msg msg;
 	size_t data_size;
 	unsigned int i;
 	int ret;
@@ -225,12 +223,11 @@ sof_ipc4_set_generic_control_data(struct snd_sof_dev *sdev,
 		data->chanv[i].value = cdata->chanv[i].value;
 	}
 
-	msg->data_ptr = data;
-	msg->data_size = data_size;
+	memcpy(&msg, &cdata->msg, sizeof(msg));
+	msg.data_ptr = data;
+	msg.data_size = data_size;
 
-	ret = sof_ipc4_set_get_kcontrol_data(scontrol, true, lock);
-	msg->data_ptr = NULL;
-	msg->data_size = 0;
+	ret = sof_ipc4_set_get_kcontrol_data(scontrol, &msg, true, lock);
 	if (ret < 0)
 		dev_err(sdev->dev, "Failed to set control update for %s\n",
 			scontrol->name);
@@ -245,7 +242,7 @@ static void sof_ipc4_refresh_generic_control(struct snd_sof_control *scontrol)
 	struct sof_ipc4_control_data *cdata = scontrol->ipc_control_data;
 	struct snd_soc_component *scomp = scontrol->scomp;
 	struct sof_ipc4_control_msg_payload *data;
-	struct sof_ipc4_msg *msg = &cdata->msg;
+	struct sof_ipc4_msg msg;
 	size_t data_size;
 	unsigned int i;
 	int ret;
@@ -263,13 +260,13 @@ static void sof_ipc4_refresh_generic_control(struct snd_sof_control *scontrol)
 
 	data->id = cdata->index;
 	data->num_elems = scontrol->num_channels;
-	msg->data_ptr = data;
-	msg->data_size = data_size;
+
+	memcpy(&msg, &cdata->msg, sizeof(msg));
+	msg.data_ptr = data;
+	msg.data_size = data_size;
 
 	scontrol->comp_data_dirty = false;
-	ret = sof_ipc4_set_get_kcontrol_data(scontrol, false, true);
-	msg->data_ptr = NULL;
-	msg->data_size = 0;
+	ret = sof_ipc4_set_get_kcontrol_data(scontrol, &msg, false, true);
 	if (!ret) {
 		for (i = 0; i < scontrol->num_channels; i++) {
 			cdata->chanv[i].channel = data->chanv[i].channel;
@@ -291,7 +288,7 @@ sof_ipc4_set_bytes_control_data(struct snd_sof_control *scontrol, bool lock)
 	struct snd_soc_component *scomp = scontrol->scomp;
 	struct sof_ipc4_control_msg_payload *msg_data;
 	struct sof_abi_hdr *data = cdata->data;
-	struct sof_ipc4_msg *msg = &cdata->msg;
+	struct sof_ipc4_msg msg;
 	size_t data_size;
 	int ret;
 
@@ -304,14 +301,13 @@ sof_ipc4_set_bytes_control_data(struct snd_sof_control *scontrol, bool lock)
 	msg_data->num_elems = data->size;
 	memcpy(msg_data->data, data->data, data->size);
 
-	msg->extension = SOF_IPC4_MOD_EXT_MSG_PARAM_ID(data->type);
+	memcpy(&msg, &cdata->msg, sizeof(msg));
+	msg.extension = SOF_IPC4_MOD_EXT_MSG_PARAM_ID(data->type);
 
-	msg->data_ptr = msg_data;
-	msg->data_size = data_size;
+	msg.data_ptr = msg_data;
+	msg.data_size = data_size;
 
-	ret = sof_ipc4_set_get_kcontrol_data(scontrol, true, lock);
-	msg->data_ptr = NULL;
-	msg->data_size = 0;
+	ret = sof_ipc4_set_get_kcontrol_data(scontrol, &msg, true, lock);
 	if (ret < 0)
 		dev_err(scomp->dev, "%s: Failed to set control update for %s\n",
 			__func__, scontrol->name);
@@ -328,7 +324,7 @@ sof_ipc4_refresh_bytes_control(struct snd_sof_control *scontrol, bool lock)
 	struct snd_soc_component *scomp = scontrol->scomp;
 	struct sof_ipc4_control_msg_payload *msg_data;
 	struct sof_abi_hdr *data = cdata->data;
-	struct sof_ipc4_msg *msg = &cdata->msg;
+	struct sof_ipc4_msg msg;
 	size_t data_size;
 	int ret = 0;
 
@@ -346,29 +342,30 @@ sof_ipc4_refresh_bytes_control(struct snd_sof_control *scontrol, bool lock)
 	if (!msg_data)
 		return -ENOMEM;
 
-	msg->extension = SOF_IPC4_MOD_EXT_MSG_PARAM_ID(data->type);
+	memcpy(&msg, &cdata->msg, sizeof(msg));
+	msg.extension = SOF_IPC4_MOD_EXT_MSG_PARAM_ID(data->type);
 
 	msg_data->id = cdata->index;
 	msg_data->num_elems = 0; /* ignored for bytes */
 
-	msg->data_ptr = msg_data;
-	msg->data_size = data_size;
+	msg.data_ptr = msg_data;
+	msg.data_size = data_size;
 
 	scontrol->comp_data_dirty = false;
-	ret = sof_ipc4_set_get_kcontrol_data(scontrol, false, lock);
+	ret = sof_ipc4_set_get_kcontrol_data(scontrol, &msg, false, lock);
 	if (!ret) {
-		if (msg->data_size > scontrol->max_size - sizeof(*data)) {
+		if (msg.data_size > scontrol->max_size - sizeof(*data)) {
 			dev_err(scomp->dev,
 				"%s: no space for data in %s (%zu, %zu)\n",
-				__func__, scontrol->name, msg->data_size,
+				__func__, scontrol->name, msg.data_size,
 				scontrol->max_size - sizeof(*data));
 			ret = -EINVAL;
 			goto out;
 		}
 
-		data->size = msg->data_size;
+		data->size = msg.data_size;
 		scontrol->size = sizeof(*cdata) + sizeof(*data) + data->size;
-		memcpy(data->data, msg->data_ptr, data->size);
+		memcpy(data->data, msg.data_ptr, data->size);
 	} else {
 		dev_err(scomp->dev, "Failed to read control data for %s\n",
 			scontrol->name);
@@ -376,9 +373,6 @@ sof_ipc4_refresh_bytes_control(struct snd_sof_control *scontrol, bool lock)
 	}
 
 out:
-	msg->data_ptr = NULL;
-	msg->data_size = 0;
-
 	kfree(msg_data);
 
 	return ret;
@@ -508,7 +502,7 @@ static int sof_ipc4_set_get_bytes_data(struct snd_sof_dev *sdev,
 {
 	struct sof_ipc4_control_data *cdata = scontrol->ipc_control_data;
 	struct sof_abi_hdr *data = cdata->data;
-	struct sof_ipc4_msg *msg = &cdata->msg;
+	struct sof_ipc4_msg msg;
 	int ret = 0;
 
 	/* Send the new data to the firmware only if it is powered up */
@@ -530,28 +524,26 @@ static int sof_ipc4_set_get_bytes_data(struct snd_sof_dev *sdev,
 			return sof_ipc4_refresh_bytes_control(scontrol, lock);
 	}
 
-	msg->extension = SOF_IPC4_MOD_EXT_MSG_PARAM_ID(data->type);
+	memcpy(&msg, &cdata->msg, sizeof(msg));
+	msg.extension = SOF_IPC4_MOD_EXT_MSG_PARAM_ID(data->type);
 
-	msg->data_ptr = data->data;
+	msg.data_ptr = data->data;
 	if (set)
-		msg->data_size = data->size;
+		msg.data_size = data->size;
 	else
-		msg->data_size = scontrol->max_size - sizeof(*data);
+		msg.data_size = scontrol->max_size - sizeof(*data);
 
-	ret = sof_ipc4_set_get_kcontrol_data(scontrol, set, lock);
+	ret = sof_ipc4_set_get_kcontrol_data(scontrol, &msg, set, lock);
 	if (ret < 0) {
 		dev_err(sdev->dev, "Failed to %s for %s\n",
 			set ? "set bytes update" : "get bytes",
 			scontrol->name);
 	} else if (!set) {
 		/* Update the sizes according to the received payload data */
-		data->size = msg->data_size;
+		data->size = msg.data_size;
 		scontrol->size = sizeof(*cdata) + sizeof(*data) + data->size;
 	}
 
-	msg->data_ptr = NULL;
-	msg->data_size = 0;
-
 	return ret;
 }
 
-- 
2.54.0

