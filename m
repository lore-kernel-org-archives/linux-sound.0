Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FF932C303
	for <linux-sound@vger.kernel.org>; Mon, 15 Dec 2025 11:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765797648; cv=none; b=Otm+G1Dl8Svv9ZCoVCjvmVVq7erwb0Dw+PFMJfyeiBwBVCfb14cCJpQEFeqEnXQQnEyyZJt44GuQXxJHp5R5VDbgPpOw3J+MVy1jDtwWUapBLk+GCJ2BHBnTkN/il95gio0rhemP+WYkuDcb9+i2hQJuIk57KX5Qimc6Fun9w4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765797648; c=relaxed/simple;
	bh=1Ua+Er1bQjQlLZtsb6Fc0xd2WdDFGcd6pWBBQjpxee0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n1kwH+8gj3ngUajNWe4FPCrVfHvrRMUjZHSKgIac54upbHK9DDr81Yc+n6I/ourrbGfhJmm+/DDkysxmQjqBYIDBCPmmMKJFWbIuOgg6lHjWyWyj64Sv+WRF6ACaq14QkkDKe2ty0GMrn8eIeXeOdTQAnUzHjHh6Z2tRm3fnliM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j3yugusp; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j3yugusp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765797647; x=1797333647;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1Ua+Er1bQjQlLZtsb6Fc0xd2WdDFGcd6pWBBQjpxee0=;
  b=j3yugusplJuyt2UBQ72zQIrWSgnzSoWAp5XAzxFoScT1RZSL0Uzin5HO
   M+kjML8O/VCZbaganlM6xCydNa3XnWaxreRRr0yzYbX08xC7w76uo6lga
   BB96MsZJOLZpyICCMewqaxPW8LapvMjiOJCihkNijcL0DcEqCsPCdk9No
   1KecAvNo7GSmCkue4EdCvkw4zMBDAk9RMliNL/Jh9pyQ/kBOmZt7Hm0/b
   +u1g9EWyq7ze/MkAVY9ZeBQduF01KfwlrWcr/tI+1MCJU32dfaMqAUZec
   GKoqrw52zlpJCOstzhIoKk4eWplX0SltMs6pWQ/H6lbiI4q6oxUug4yj9
   w==;
X-CSE-ConnectionGUID: GBcqx+DDSf+4nr08bveRGg==
X-CSE-MsgGUID: Mu7SN1FVTxK8jHza30pwyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="67731785"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="67731785"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 03:20:46 -0800
X-CSE-ConnectionGUID: EBhb1404Rhu0mE66LxPUWw==
X-CSE-MsgGUID: QQhi7Q8ST3qX6NOBbQn70A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="197690227"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.95])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 03:20:44 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	seppo.ingalsuo@linux.intel.com
Subject: [PATCH 7/8] ASoC: SOF: ipc4: Add definition for generic bytes control
Date: Mon, 15 Dec 2025 13:20:47 +0200
Message-ID: <20251215112048.16331-8-peter.ujfalusi@linux.intel.com>
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

Currently IPC4 only supports module specific custom bytes controls, where
each control's param_id is module specific.
These bytes controls cannot be handled in a generic way, there is no clean
way to support for example notifications from firmware when their data
has been changed.

Add definition for generic bytes control which should be handled in a
similar way as the enum/switch controls.

The generic param id for BYTES is selected to be 202

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.h | 9 +++++++--
 sound/soc/sof/ipc4.c          | 1 +
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.h b/sound/soc/sof/ipc4-topology.h
index 191b51d97993..9a028a59c553 100644
--- a/sound/soc/sof/ipc4-topology.h
+++ b/sound/soc/sof/ipc4-topology.h
@@ -368,19 +368,24 @@ struct sof_ipc4_control_data {
 
 #define SOF_IPC4_SWITCH_CONTROL_PARAM_ID	200
 #define SOF_IPC4_ENUM_CONTROL_PARAM_ID		201
+#define SOF_IPC4_BYTES_CONTROL_PARAM_ID		202
 
 /**
  * struct sof_ipc4_control_msg_payload - IPC payload for kcontrol parameters
  * @id: unique id of the control
- * @num_elems: Number of elements in the chanv array
+ * @num_elems: Number of elements in the chanv array or number of bytes in data
  * @reserved: reserved for future use, must be set to 0
  * @chanv: channel ID and value array
+ * @data: binary payload
  */
 struct sof_ipc4_control_msg_payload {
 	uint16_t id;
 	uint16_t num_elems;
 	uint32_t reserved[4];
-	DECLARE_FLEX_ARRAY(struct sof_ipc4_ctrl_value_chan, chanv);
+	union {
+		DECLARE_FLEX_ARRAY(struct sof_ipc4_ctrl_value_chan, chanv);
+		DECLARE_FLEX_ARRAY(uint8_t, data);
+	};
 } __packed;
 
 /**
diff --git a/sound/soc/sof/ipc4.c b/sound/soc/sof/ipc4.c
index 20d723f48fff..2be8d8ce487a 100644
--- a/sound/soc/sof/ipc4.c
+++ b/sound/soc/sof/ipc4.c
@@ -445,6 +445,7 @@ static bool sof_ipc4_tx_payload_for_get_data(struct sof_ipc4_msg *tx)
 	switch (tx->extension & SOF_IPC4_MOD_EXT_MSG_PARAM_ID_MASK) {
 	case SOF_IPC4_MOD_EXT_MSG_PARAM_ID(SOF_IPC4_SWITCH_CONTROL_PARAM_ID):
 	case SOF_IPC4_MOD_EXT_MSG_PARAM_ID(SOF_IPC4_ENUM_CONTROL_PARAM_ID):
+	case SOF_IPC4_MOD_EXT_MSG_PARAM_ID(SOF_IPC4_BYTES_CONTROL_PARAM_ID):
 		return true;
 	default:
 		return false;
-- 
2.52.0

