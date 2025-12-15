Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079811DED63
	for <linux-sound@vger.kernel.org>; Mon, 15 Dec 2025 11:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765797639; cv=none; b=GvmozMV3y7Uq+76mK/Ie8jjDR2RD95B30krVijWvp3pkRz6P2bIjANrqSm2PPqZ1+utjH5/OEwq9zziyV7i1omxqhfj5S5pyhiVScuJIeT8Vym+nEahKwqD48MkjtuzsNzRIoOkKTnHOxkq9bcjqJ4Sx+CE0nOP86V0EhaIu4Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765797639; c=relaxed/simple;
	bh=8BO54e1Au9K9QULZ8swKNc8o0Rf6/SrKpkixzuXKytw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hLTM/QhxB91cNIl1fyBhxTMnrju7ymnUYV/67V1WUerG9UL7REZxLgBn2PjI42NrWjGA8wKwjKL2YDSoP4ivZcw6Twmht1Ea5i/C+ji9TxHELixIqVMeZZMK/XM1px6S1LrWBQoC5/BnijhVDqNd1S3YTguYDQshRA2Nhkq8VcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N/Es4rfM; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N/Es4rfM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765797638; x=1797333638;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8BO54e1Au9K9QULZ8swKNc8o0Rf6/SrKpkixzuXKytw=;
  b=N/Es4rfMstGkseq79SciILLPymIhbWwTfK47+a13w2yoMlIuJBFoZgJ9
   iieytqjOmlfVqgGu9c48kg+M3t66tSoZIAauUdfakXox2Yv7z12lIx6dE
   1Q7Nl3zAWMddehm7shpDF68VESTMXjDzWZuUkWMIn2H9U4U8NBayjv79+
   G+5b3V0Q9MemSNsa7zm0gfy5ch5wq5eHTLoUP7P6w3AXisf/OZzYxHWHH
   kVTs7dcDW1UWRJYEL/GI8JNdVsipF+q4XHhDELBqgnZiJUZ+8FMDGMnB2
   gwztLfop2MBrLcirnSQ1xoO4/dpwVljE+2ZCLpBun6mXa7cWrvRC5jIeM
   g==;
X-CSE-ConnectionGUID: O7iXkMTTQW2vJRSO37+o9Q==
X-CSE-MsgGUID: Z+XaNeUWQeqGMccE4EQKfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="67731767"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="67731767"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 03:20:38 -0800
X-CSE-ConnectionGUID: VjGXjj6KTLKJueiBR8PdoA==
X-CSE-MsgGUID: s2A4N82aS8CkJwozYpUHzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="197690220"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.95])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 03:20:36 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	seppo.ingalsuo@linux.intel.com
Subject: [PATCH 4/8] ASoC: SOF: ipc4-control: Keep the payload size up to date
Date: Mon, 15 Dec 2025 13:20:44 +0200
Message-ID: <20251215112048.16331-5-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215112048.16331-1-peter.ujfalusi@linux.intel.com>
References: <20251215112048.16331-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the bytes data is read from the firmware, the size of the payload
can be different than what it was previously.
For example when the topology did not contained payload data at all for the
control, the data size was 0.
For get operation allow maximum size of payload to be read and then update
the sizes according to the completed message.

Similarly, keep the size in sync when updating the data in firmware.

With the change we will be able to read data from firmware for bytes
controls which did not had initial payload defined in topology.

Fixes: a062c8899fed ("ASoC: SOF: ipc4-control: Add support for bytes control get and put")
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/ipc4-control.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/ipc4-control.c b/sound/soc/sof/ipc4-control.c
index 80111672c179..453ed1643b89 100644
--- a/sound/soc/sof/ipc4-control.c
+++ b/sound/soc/sof/ipc4-control.c
@@ -426,13 +426,21 @@ static int sof_ipc4_set_get_bytes_data(struct snd_sof_dev *sdev,
 	msg->extension = SOF_IPC4_MOD_EXT_MSG_PARAM_ID(data->type);
 
 	msg->data_ptr = data->data;
-	msg->data_size = data->size;
+	if (set)
+		msg->data_size = data->size;
+	else
+		msg->data_size = scontrol->max_size - sizeof(*data);
 
 	ret = sof_ipc4_set_get_kcontrol_data(scontrol, set, lock);
-	if (ret < 0)
+	if (ret < 0) {
 		dev_err(sdev->dev, "Failed to %s for %s\n",
 			set ? "set bytes update" : "get bytes",
 			scontrol->name);
+	} else if (!set) {
+		/* Update the sizes according to the received payload data */
+		data->size = msg->data_size;
+		scontrol->size = sizeof(*cdata) + sizeof(*data) + data->size;
+	}
 
 	msg->data_ptr = NULL;
 	msg->data_size = 0;
@@ -448,6 +456,7 @@ static int sof_ipc4_bytes_put(struct snd_sof_control *scontrol,
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	struct sof_abi_hdr *data = cdata->data;
 	size_t size;
+	int ret;
 
 	if (scontrol->max_size > sizeof(ucontrol->value.bytes.data)) {
 		dev_err_ratelimited(scomp->dev,
@@ -469,9 +478,12 @@ static int sof_ipc4_bytes_put(struct snd_sof_control *scontrol,
 	/* copy from kcontrol */
 	memcpy(data, ucontrol->value.bytes.data, size);
 
-	sof_ipc4_set_get_bytes_data(sdev, scontrol, true, true);
+	ret = sof_ipc4_set_get_bytes_data(sdev, scontrol, true, true);
+	if (!ret)
+		/* Update the cdata size */
+		scontrol->size = sizeof(*cdata) + size;
 
-	return 0;
+	return ret;
 }
 
 static int sof_ipc4_bytes_get(struct snd_sof_control *scontrol,
@@ -581,6 +593,9 @@ static int sof_ipc4_bytes_ext_put(struct snd_sof_control *scontrol,
 		return -EFAULT;
 	}
 
+	/* Update the cdata size */
+	scontrol->size = sizeof(*cdata) + header.length;
+
 	return sof_ipc4_set_get_bytes_data(sdev, scontrol, true, true);
 }
 
-- 
2.52.0

