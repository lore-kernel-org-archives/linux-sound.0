Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49624281503
	for <linux-sound@vger.kernel.org>; Mon, 15 Dec 2025 11:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765797634; cv=none; b=o/dX9IgkDKaNIcNGpF7P5ayfQmUvnG4CfvqK6Eikoq80PgOIZ/DQcgqy/Q/S7N3NsyizEW4BJhNV0+Q11ubLjWMtVXA5F2Fa70eTDDDL/O0prPrA6MOMF1KTxb8OhV8GYRoW8rakz0WnNLUUqcR3kA37BBiR1GfXLNiaKDQr8vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765797634; c=relaxed/simple;
	bh=vEwPyQPRXlTNVQq1eW5GjLCY7W8nBAQ2OCxfR/hTbgg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FYEY8S8n9vCs9mGGYxo6UFSPJv5vHV3mJTqBpSJ4AJ87MxHyNOdEvNVSZJaiBW1BSgsnbY/c2i9TENOkJJcmK39RnVLKPL5vkBDJaP2m1qUohkcv93OiR8fvaeZDJ0jM+eMKvQfilJAd4Tk0e2OCxXTGEAifi3ebPAfFnpe1oMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NaVDQcak; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NaVDQcak"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765797632; x=1797333632;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vEwPyQPRXlTNVQq1eW5GjLCY7W8nBAQ2OCxfR/hTbgg=;
  b=NaVDQcakRKT9PmTENHMO0dcHF6nuGpuqSuWjFM1lu65UXIYnbOkflxsN
   1fdS/ZonzcfgwciY0nY29PHOlwEURLFjrqKGbm37CLkM1b8pFTsP8EROg
   FUBgAkWUL6LT646kQk0rmMBEtiYui1E18v02dNIult9OmKAEg+2hAvZKN
   9a5Sd+BAzPxJKTraOhU5khs3Uioq4bSU51VMJBlKmD0wSMf8Q9QxcA7Ui
   IgZ6QVhv6Iysx1mP0cwXagT/SrKjQQde/d/4IzylQU22ogAVQzy5HJjdM
   P0VOm/AiC2rEG2xcSjg7ZN0vLonPcnkmTfLkRYKcaMv7F0/1+jIfQnAeh
   w==;
X-CSE-ConnectionGUID: +q7fBBikT0apQ8NFNRPDXg==
X-CSE-MsgGUID: 8Ymvr/4tSuCgoTWojOBfgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="67731752"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="67731752"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 03:20:32 -0800
X-CSE-ConnectionGUID: dJcDUf4ZTe24viJAOnS+9A==
X-CSE-MsgGUID: tl7ej9rvTKeIO9WJySfSkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="197690211"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.95])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 03:20:30 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	seppo.ingalsuo@linux.intel.com
Subject: [PATCH 2/8] ASoC: SOF: ipc4-topology: Correct the allocation size for bytes controls
Date: Mon, 15 Dec 2025 13:20:42 +0200
Message-ID: <20251215112048.16331-3-peter.ujfalusi@linux.intel.com>
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

The size of the data behind of scontrol->ipc_control_data for bytes
controls is:
[1] sizeof(struct sof_ipc4_control_data) + // kernel only struct
[2] sizeof(struct sof_abi_hdr)) + payload

The max_size specifies the size of [2] and it is coming from topology.

Change the function to take this into account and allocate adequate amount
of memory behind scontrol->ipc_control_data.

With the change we will allocate [1] amount more memory to be able to hold
the full size of data.

Fixes: 1bfde5818266 ("ASoC: SOF: ipc4-topology: add byte kcontrol support")
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 35 +++++++++++++++++++++++++++--------
 1 file changed, 27 insertions(+), 8 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 221e9d4052b8..4272d84679ac 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -2855,22 +2855,41 @@ static int sof_ipc4_control_load_bytes(struct snd_sof_dev *sdev, struct snd_sof_
 	struct sof_ipc4_msg *msg;
 	int ret;
 
-	if (scontrol->max_size < (sizeof(*control_data) + sizeof(struct sof_abi_hdr))) {
-		dev_err(sdev->dev, "insufficient size for a bytes control %s: %zu.\n",
+	/*
+	 * The max_size is coming from topology and indicates the maximum size
+	 * of sof_abi_hdr plus the payload, which excludes the local only
+	 * 'struct sof_ipc4_control_data'
+	 */
+	if (scontrol->max_size < sizeof(struct sof_abi_hdr)) {
+		dev_err(sdev->dev,
+			"insufficient maximum size for a bytes control %s: %zu.\n",
 			scontrol->name, scontrol->max_size);
 		return -EINVAL;
 	}
 
-	if (scontrol->priv_size > scontrol->max_size - sizeof(*control_data)) {
-		dev_err(sdev->dev, "scontrol %s bytes data size %zu exceeds max %zu.\n",
-			scontrol->name, scontrol->priv_size,
-			scontrol->max_size - sizeof(*control_data));
+	if (scontrol->priv_size > scontrol->max_size) {
+		dev_err(sdev->dev,
+			"bytes control %s initial data size %zu exceeds max %zu.\n",
+			scontrol->name, scontrol->priv_size, scontrol->max_size);
+		return -EINVAL;
+	}
+
+	if (scontrol->priv_size < sizeof(struct sof_abi_hdr)) {
+		dev_err(sdev->dev,
+			"bytes control %s initial data size %zu is insufficient.\n",
+			scontrol->name, scontrol->priv_size);
 		return -EINVAL;
 	}
 
-	scontrol->size = sizeof(struct sof_ipc4_control_data) + scontrol->priv_size;
+	/*
+	 * The used size behind the cdata pointer, which can be smaller than
+	 * the maximum size
+	 */
+	scontrol->size = sizeof(*control_data) + scontrol->priv_size;
 
-	scontrol->ipc_control_data = kzalloc(scontrol->max_size, GFP_KERNEL);
+	/* Allocate the cdata: local struct size + maximum payload size */
+	scontrol->ipc_control_data = kzalloc(sizeof(*control_data) + scontrol->max_size,
+					     GFP_KERNEL);
 	if (!scontrol->ipc_control_data)
 		return -ENOMEM;
 
-- 
2.52.0

