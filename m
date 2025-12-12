Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4CA2F9DAE
	for <linux-sound@vger.kernel.org>; Fri, 12 Dec 2025 10:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765534435; cv=none; b=PPj6UC8EobnES9uEqgb75Kmy9ZPHDBxBcuA1DPlz6jgUtt8RBfhYL69o/0252f9IybAPmD6OEYorje8BmGAIAjTtxmDLZFIUwGNv3huWXjrEdR96JQxFA4JqOQZ6GISs8iLPrZEmXLDC3R7s2AOLAf6FW8MefRre8gZmavphsq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765534435; c=relaxed/simple;
	bh=vd8fhAiQzkj1nt9IZbUk0UrOYjCbUyO/AVHIUDZ83P0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tFO5K1xtRV54s+ipzToVJyPQtes2Bm6BxBrIFetp6ogckuLYhlJC8fJBcnRss0Terf2BfCIQ4fyAlTcCBwHctGvjjNWKJIdUvVqH2vmyqFefmtKxnNLJS9JoHsdGfRtlGvlyJ3MVaEQgTsYI11P8HEZ4HGwQYYOEhrC1hVmB/j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W7j5NrCI; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W7j5NrCI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765534433; x=1797070433;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vd8fhAiQzkj1nt9IZbUk0UrOYjCbUyO/AVHIUDZ83P0=;
  b=W7j5NrCIPjvnBNkGfAk/O7GwPluPZRFVWAkDd+128+cplImvoYdeWBwx
   AEA37ucWoC5yilQaDSs8ctF8/3tBBDSIRDH9h+Bq5HrlV8UVxuZwZzFXk
   WXvScbqxqSCjXQFu4Eh/NXN+ZsOEnhdhQMTXNoy86UT1RxOtc0B02fRf/
   GbrRbOyaH0CVM7VAlbxEjS3iLR8CQXwlQRkPQNU80AXn+ukUiTxYQ4ccK
   CT9newX3qDTiqGU0c+iA1R2pcNTHHtiZcKeiCVk2X/OzO7BxttLNWLO58
   vHPKrgfd//iy7NhSIxzCtAtjm3s27Altc4KBxUVXeTKYeMZFZOCgM0o+O
   g==;
X-CSE-ConnectionGUID: eokMIbuhSZ2zD8litWJZsQ==
X-CSE-MsgGUID: YKFd4ecuQlyN/u625rLUrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="78891328"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="78891328"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 02:13:52 -0800
X-CSE-ConnectionGUID: 4dfsQhTzQfGtX9kuAqfNYQ==
X-CSE-MsgGUID: Jp4vPqk6RkCDe04bBsc/6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="234444921"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa001.jf.intel.com with ESMTP; 12 Dec 2025 02:13:51 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 1/5] ASoC: Intel: catpt: Move IPC error messages one level down
Date: Fri, 12 Dec 2025 11:38:54 +0100
Message-Id: <20251212103858.110701-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251212103858.110701-1-cezary.rojewski@intel.com>
References: <20251212103858.110701-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Code size can be reduced if catpt_dsp_do_send_msg() takes responsibility
for dumping logs in case of an IPC message failure.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/catpt/core.h     |  4 +-
 sound/soc/intel/catpt/ipc.c      | 12 +++--
 sound/soc/intel/catpt/messages.c | 89 +++++---------------------------
 3 files changed, 21 insertions(+), 84 deletions(-)

diff --git a/sound/soc/intel/catpt/core.h b/sound/soc/intel/catpt/core.h
index c01d27e9fd88..7b7c30a0d2ac 100644
--- a/sound/soc/intel/catpt/core.h
+++ b/sound/soc/intel/catpt/core.h
@@ -133,9 +133,9 @@ irqreturn_t catpt_dsp_irq_thread(int irq, void *dev_id);
 
 int catpt_dsp_send_msg_timeout(struct catpt_dev *cdev,
 			       struct catpt_ipc_msg request,
-			       struct catpt_ipc_msg *reply, int timeout);
+			       struct catpt_ipc_msg *reply, int timeout, const char *name);
 int catpt_dsp_send_msg(struct catpt_dev *cdev, struct catpt_ipc_msg request,
-		       struct catpt_ipc_msg *reply);
+		       struct catpt_ipc_msg *reply, const char *name);
 
 int catpt_first_boot_firmware(struct catpt_dev *cdev);
 int catpt_boot_firmware(struct catpt_dev *cdev, bool restore);
diff --git a/sound/soc/intel/catpt/ipc.c b/sound/soc/intel/catpt/ipc.c
index d26863249097..5a01a9afb26e 100644
--- a/sound/soc/intel/catpt/ipc.c
+++ b/sound/soc/intel/catpt/ipc.c
@@ -84,7 +84,7 @@ static int catpt_wait_msg_completion(struct catpt_dev *cdev, int timeout)
 
 static int catpt_dsp_do_send_msg(struct catpt_dev *cdev,
 				 struct catpt_ipc_msg request,
-				 struct catpt_ipc_msg *reply, int timeout)
+				 struct catpt_ipc_msg *reply, int timeout, const char *name)
 {
 	struct catpt_ipc *ipc = &cdev->ipc;
 	unsigned long flags;
@@ -111,6 +111,8 @@ static int catpt_dsp_do_send_msg(struct catpt_dev *cdev,
 	}
 
 	ret = ipc->rx.rsp.status;
+	if (ret)
+		dev_err(cdev->dev, "%s (0x%08x) failed: %d\n", name, request.header, ret);
 	if (reply) {
 		reply->header = ipc->rx.header;
 
@@ -123,23 +125,23 @@ static int catpt_dsp_do_send_msg(struct catpt_dev *cdev,
 
 int catpt_dsp_send_msg_timeout(struct catpt_dev *cdev,
 			       struct catpt_ipc_msg request,
-			       struct catpt_ipc_msg *reply, int timeout)
+			       struct catpt_ipc_msg *reply, int timeout, const char *name)
 {
 	struct catpt_ipc *ipc = &cdev->ipc;
 	int ret;
 
 	mutex_lock(&ipc->mutex);
-	ret = catpt_dsp_do_send_msg(cdev, request, reply, timeout);
+	ret = catpt_dsp_do_send_msg(cdev, request, reply, timeout, name);
 	mutex_unlock(&ipc->mutex);
 
 	return ret;
 }
 
 int catpt_dsp_send_msg(struct catpt_dev *cdev, struct catpt_ipc_msg request,
-		       struct catpt_ipc_msg *reply)
+		       struct catpt_ipc_msg *reply, const char *name)
 {
 	return catpt_dsp_send_msg_timeout(cdev, request, reply,
-					  cdev->ipc.default_timeout);
+					  cdev->ipc.default_timeout, name);
 }
 
 static void
diff --git a/sound/soc/intel/catpt/messages.c b/sound/soc/intel/catpt/messages.c
index 30eec2de4dc1..688a2d79500d 100644
--- a/sound/soc/intel/catpt/messages.c
+++ b/sound/soc/intel/catpt/messages.c
@@ -15,17 +15,12 @@ int catpt_ipc_get_fw_version(struct catpt_dev *cdev,
 {
 	union catpt_global_msg msg = CATPT_GLOBAL_MSG(GET_FW_VERSION);
 	struct catpt_ipc_msg request = {{0}}, reply;
-	int ret;
 
 	request.header = msg.val;
 	reply.size = sizeof(*version);
 	reply.data = version;
 
-	ret = catpt_dsp_send_msg(cdev, request, &reply);
-	if (ret)
-		dev_err(cdev->dev, "get fw version failed: %d\n", ret);
-
-	return ret;
+	return catpt_dsp_send_msg(cdev, request, &reply, "get fw version");
 }
 
 struct catpt_alloc_stream_input {
@@ -94,11 +89,7 @@ int catpt_ipc_alloc_stream(struct catpt_dev *cdev,
 	reply.size = sizeof(*sinfo);
 	reply.data = sinfo;
 
-	ret = catpt_dsp_send_msg(cdev, request, &reply);
-	if (ret)
-		dev_err(cdev->dev, "alloc stream type %d failed: %d\n",
-			type, ret);
-
+	ret = catpt_dsp_send_msg(cdev, request, &reply, "alloc stream");
 	kfree(payload);
 	return ret;
 }
@@ -107,18 +98,12 @@ int catpt_ipc_free_stream(struct catpt_dev *cdev, u8 stream_hw_id)
 {
 	union catpt_global_msg msg = CATPT_GLOBAL_MSG(FREE_STREAM);
 	struct catpt_ipc_msg request;
-	int ret;
 
 	request.header = msg.val;
 	request.size = sizeof(stream_hw_id);
 	request.data = &stream_hw_id;
 
-	ret = catpt_dsp_send_msg(cdev, request, NULL);
-	if (ret)
-		dev_err(cdev->dev, "free stream %d failed: %d\n",
-			stream_hw_id, ret);
-
-	return ret;
+	return catpt_dsp_send_msg(cdev, request, NULL, "free stream");
 }
 
 int catpt_ipc_set_device_format(struct catpt_dev *cdev,
@@ -126,17 +111,12 @@ int catpt_ipc_set_device_format(struct catpt_dev *cdev,
 {
 	union catpt_global_msg msg = CATPT_GLOBAL_MSG(SET_DEVICE_FORMATS);
 	struct catpt_ipc_msg request;
-	int ret;
 
 	request.header = msg.val;
 	request.size = sizeof(*devfmt);
 	request.data = devfmt;
 
-	ret = catpt_dsp_send_msg(cdev, request, NULL);
-	if (ret)
-		dev_err(cdev->dev, "set device format failed: %d\n", ret);
-
-	return ret;
+	return catpt_dsp_send_msg(cdev, request, NULL, "set device format");
 }
 
 int catpt_ipc_enter_dxstate(struct catpt_dev *cdev, enum catpt_dx_state state,
@@ -144,7 +124,6 @@ int catpt_ipc_enter_dxstate(struct catpt_dev *cdev, enum catpt_dx_state state,
 {
 	union catpt_global_msg msg = CATPT_GLOBAL_MSG(ENTER_DX_STATE);
 	struct catpt_ipc_msg request, reply;
-	int ret;
 
 	request.header = msg.val;
 	request.size = sizeof(state);
@@ -152,11 +131,7 @@ int catpt_ipc_enter_dxstate(struct catpt_dev *cdev, enum catpt_dx_state state,
 	reply.size = sizeof(*context);
 	reply.data = context;
 
-	ret = catpt_dsp_send_msg(cdev, request, &reply);
-	if (ret)
-		dev_err(cdev->dev, "enter dx state failed: %d\n", ret);
-
-	return ret;
+	return catpt_dsp_send_msg(cdev, request, &reply, "enter dx state");
 }
 
 int catpt_ipc_get_mixer_stream_info(struct catpt_dev *cdev,
@@ -164,68 +139,45 @@ int catpt_ipc_get_mixer_stream_info(struct catpt_dev *cdev,
 {
 	union catpt_global_msg msg = CATPT_GLOBAL_MSG(GET_MIXER_STREAM_INFO);
 	struct catpt_ipc_msg request = {{0}}, reply;
-	int ret;
 
 	request.header = msg.val;
 	reply.size = sizeof(*info);
 	reply.data = info;
 
-	ret = catpt_dsp_send_msg(cdev, request, &reply);
-	if (ret)
-		dev_err(cdev->dev, "get mixer info failed: %d\n", ret);
-
-	return ret;
+	return catpt_dsp_send_msg(cdev, request, &reply, "get mixer info");
 }
 
 int catpt_ipc_reset_stream(struct catpt_dev *cdev, u8 stream_hw_id)
 {
 	union catpt_stream_msg msg = CATPT_STREAM_MSG(RESET_STREAM);
 	struct catpt_ipc_msg request = {{0}};
-	int ret;
 
 	msg.stream_hw_id = stream_hw_id;
 	request.header = msg.val;
 
-	ret = catpt_dsp_send_msg(cdev, request, NULL);
-	if (ret)
-		dev_err(cdev->dev, "reset stream %d failed: %d\n",
-			stream_hw_id, ret);
-
-	return ret;
+	return catpt_dsp_send_msg(cdev, request, NULL, "reset stream");
 }
 
 int catpt_ipc_pause_stream(struct catpt_dev *cdev, u8 stream_hw_id)
 {
 	union catpt_stream_msg msg = CATPT_STREAM_MSG(PAUSE_STREAM);
 	struct catpt_ipc_msg request = {{0}};
-	int ret;
 
 	msg.stream_hw_id = stream_hw_id;
 	request.header = msg.val;
 
-	ret = catpt_dsp_send_msg(cdev, request, NULL);
-	if (ret)
-		dev_err(cdev->dev, "pause stream %d failed: %d\n",
-			stream_hw_id, ret);
-
-	return ret;
+	return catpt_dsp_send_msg(cdev, request, NULL, "pause stream");
 }
 
 int catpt_ipc_resume_stream(struct catpt_dev *cdev, u8 stream_hw_id)
 {
 	union catpt_stream_msg msg = CATPT_STREAM_MSG(RESUME_STREAM);
 	struct catpt_ipc_msg request = {{0}};
-	int ret;
 
 	msg.stream_hw_id = stream_hw_id;
 	request.header = msg.val;
 
-	ret = catpt_dsp_send_msg(cdev, request, NULL);
-	if (ret)
-		dev_err(cdev->dev, "resume stream %d failed: %d\n",
-			stream_hw_id, ret);
-
-	return ret;
+	return catpt_dsp_send_msg(cdev, request, NULL, "resume stream");
 }
 
 struct catpt_set_volume_input {
@@ -243,7 +195,6 @@ int catpt_ipc_set_volume(struct catpt_dev *cdev, u8 stream_hw_id,
 	union catpt_stream_msg msg = CATPT_STAGE_MSG(SET_VOLUME);
 	struct catpt_ipc_msg request;
 	struct catpt_set_volume_input input;
-	int ret;
 
 	msg.stream_hw_id = stream_hw_id;
 	input.channel = channel;
@@ -255,12 +206,7 @@ int catpt_ipc_set_volume(struct catpt_dev *cdev, u8 stream_hw_id,
 	request.size = sizeof(input);
 	request.data = &input;
 
-	ret = catpt_dsp_send_msg(cdev, request, NULL);
-	if (ret)
-		dev_err(cdev->dev, "set stream %d volume failed: %d\n",
-			stream_hw_id, ret);
-
-	return ret;
+	return catpt_dsp_send_msg(cdev, request, NULL, "set stream volume");
 }
 
 struct catpt_set_write_pos_input {
@@ -275,7 +221,6 @@ int catpt_ipc_set_write_pos(struct catpt_dev *cdev, u8 stream_hw_id,
 	union catpt_stream_msg msg = CATPT_STAGE_MSG(SET_WRITE_POSITION);
 	struct catpt_ipc_msg request;
 	struct catpt_set_write_pos_input input;
-	int ret;
 
 	msg.stream_hw_id = stream_hw_id;
 	input.new_write_pos = pos;
@@ -286,28 +231,18 @@ int catpt_ipc_set_write_pos(struct catpt_dev *cdev, u8 stream_hw_id,
 	request.size = sizeof(input);
 	request.data = &input;
 
-	ret = catpt_dsp_send_msg(cdev, request, NULL);
-	if (ret)
-		dev_err(cdev->dev, "set stream %d write pos failed: %d\n",
-			stream_hw_id, ret);
-
-	return ret;
+	return catpt_dsp_send_msg(cdev, request, NULL, "set stream write pos");
 }
 
 int catpt_ipc_mute_loopback(struct catpt_dev *cdev, u8 stream_hw_id, bool mute)
 {
 	union catpt_stream_msg msg = CATPT_STAGE_MSG(MUTE_LOOPBACK);
 	struct catpt_ipc_msg request;
-	int ret;
 
 	msg.stream_hw_id = stream_hw_id;
 	request.header = msg.val;
 	request.size = sizeof(mute);
 	request.data = &mute;
 
-	ret = catpt_dsp_send_msg(cdev, request, NULL);
-	if (ret)
-		dev_err(cdev->dev, "mute loopback failed: %d\n", ret);
-
-	return ret;
+	return catpt_dsp_send_msg(cdev, request, NULL, "mute loopback");
 }
-- 
2.25.1

