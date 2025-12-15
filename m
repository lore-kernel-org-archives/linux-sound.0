Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C23329C65
	for <linux-sound@vger.kernel.org>; Mon, 15 Dec 2025 11:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765797645; cv=none; b=ptVWgucKMQkkXmtTpIV96deGQWl5GT1yDQBHWoAlme58scal1a3LQXx3xMMByIRtYhDN5tH//szy9Zs4/5cQfMOjPQKFgrxND08SCt98duucbMw8SOuTRBh9tY6QJliTLF/3XyNVBpqEgNqAUU+10grtKLxeP19pvSbFRGj11GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765797645; c=relaxed/simple;
	bh=fZ0jl5gYXcULaU4KI+XXEJ6KwMNxd80BbCW+qmWeKv8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jck4c7fB3mfQ6hF3CRhj4mAG5TQcXMWeZxyIpRGEuGMIkQNDV9h9Xj9eCa+SWPjs4AoFecQ1phfJGbpumtYqxeRLsxRR7NDePb1A4zm8Ld7srPhbovePeZU/teJgvnRCSRjLDxD9p85qSpSEnJxW7sO5YqPBtNMQbqxjYbqApzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gze+48qt; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gze+48qt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765797644; x=1797333644;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fZ0jl5gYXcULaU4KI+XXEJ6KwMNxd80BbCW+qmWeKv8=;
  b=Gze+48qtpOZLVgxGeGbWFczwk17ZjrjQIFFsjCstAHapQQ0kWWbDIfL6
   WeQlob5Ts7eTpRvcoMHN6tKZ1lB16p8OCsPaWXVdalJsy7zPwzcJn2Jh7
   JEkm+6gsIFelkW5e2O5psp15mFmiVh7w8twkUWqJuJc5sLSPGMythpjEc
   0ijtfVyYXs03OnBDdYufWfdvlrBsW1XeMIngUUoiJ1Biwz0FHY6CL2fb+
   RyJnYa2AA2GKvy9L0uMA+KQD4i4VHcsZwqIXO4TaZk4Muc7JijF4p25PQ
   YW2Gc7w76CbyO1RgM+PJODxATyG5BYyVfiUNTa+7ftccDksKbGHXUSapB
   w==;
X-CSE-ConnectionGUID: jxtPBVxsSHaTEEQq2/brIg==
X-CSE-MsgGUID: K29p6tk2TUCQFyEs3/PEdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="67731780"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="67731780"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 03:20:44 -0800
X-CSE-ConnectionGUID: OsH3xcdKRdiS2AOweMGSvA==
X-CSE-MsgGUID: mYZmzppyScS1/zwjH2Pu1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="197690225"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.95])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 03:20:41 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	seppo.ingalsuo@linux.intel.com
Subject: [PATCH 6/8] ASoC: SOF: ipc4: Support for sending payload along with LARGE_CONFIG_GET
Date: Mon, 15 Dec 2025 13:20:46 +0200
Message-ID: <20251215112048.16331-7-peter.ujfalusi@linux.intel.com>
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

There are message types when we would need to send a payload along with
the LARGE_CONFIG_GET message to provide information to the firmware on
what data is requested.
Such cases are the ALSA Kcontrol related messages when the high level
param_id tells only the type of the control, but the ID/index of the exact
control is specified in the payload area.

The caller must place the payload for TX before calling the set_get_data()
and this payload will be sent alongside with the message to the firmware.

The data area will be overwritten by the received data from firmware.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/ipc4.c | 44 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 42 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/ipc4.c b/sound/soc/sof/ipc4.c
index a4a090e6724a..20d723f48fff 100644
--- a/sound/soc/sof/ipc4.c
+++ b/sound/soc/sof/ipc4.c
@@ -15,6 +15,7 @@
 #include "sof-audio.h"
 #include "ipc4-fw-reg.h"
 #include "ipc4-priv.h"
+#include "ipc4-topology.h"
 #include "ipc4-telemetry.h"
 #include "ops.h"
 
@@ -433,6 +434,23 @@ static int sof_ipc4_tx_msg(struct snd_sof_dev *sdev, void *msg_data, size_t msg_
 	return ret;
 }
 
+static bool sof_ipc4_tx_payload_for_get_data(struct sof_ipc4_msg *tx)
+{
+	/*
+	 * Messages that require TX payload with LARGE_CONFIG_GET.
+	 * The TX payload is placed into the IPC message data section by caller,
+	 * which needs to be copied to temporary buffer since the received data
+	 * will overwrite it.
+	 */
+	switch (tx->extension & SOF_IPC4_MOD_EXT_MSG_PARAM_ID_MASK) {
+	case SOF_IPC4_MOD_EXT_MSG_PARAM_ID(SOF_IPC4_SWITCH_CONTROL_PARAM_ID):
+	case SOF_IPC4_MOD_EXT_MSG_PARAM_ID(SOF_IPC4_ENUM_CONTROL_PARAM_ID):
+		return true;
+	default:
+		return false;
+	}
+}
+
 static int sof_ipc4_set_get_data(struct snd_sof_dev *sdev, void *data,
 				 size_t payload_bytes, bool set)
 {
@@ -444,6 +462,8 @@ static int sof_ipc4_set_get_data(struct snd_sof_dev *sdev, void *data,
 	struct sof_ipc4_msg tx = {{ 0 }};
 	struct sof_ipc4_msg rx = {{ 0 }};
 	size_t remaining = payload_bytes;
+	void *tx_payload_for_get = NULL;
+	size_t tx_data_size = 0;
 	size_t offset = 0;
 	size_t chunk_size;
 	int ret;
@@ -469,10 +489,20 @@ static int sof_ipc4_set_get_data(struct snd_sof_dev *sdev, void *data,
 
 	tx.extension |= SOF_IPC4_MOD_EXT_MSG_FIRST_BLOCK(1);
 
+	if (sof_ipc4_tx_payload_for_get_data(&tx)) {
+		tx_data_size = min(ipc4_msg->data_size, payload_limit);
+		tx_payload_for_get = kmemdup(ipc4_msg->data_ptr, tx_data_size,
+					     GFP_KERNEL);
+		if (!tx_payload_for_get)
+			return -ENOMEM;
+	}
+
 	/* ensure the DSP is in D0i0 before sending IPC */
 	ret = snd_sof_dsp_set_power_state(sdev, &target_state);
-	if (ret < 0)
+	if (ret < 0) {
+		kfree(tx_payload_for_get);
 		return ret;
+	}
 
 	/* Serialise IPC TX */
 	mutex_lock(&sdev->ipc->tx_mutex);
@@ -506,7 +536,15 @@ static int sof_ipc4_set_get_data(struct snd_sof_dev *sdev, void *data,
 			rx.data_size = chunk_size;
 			rx.data_ptr = ipc4_msg->data_ptr + offset;
 
-			tx_size = 0;
+			if (tx_payload_for_get) {
+				tx_size = tx_data_size;
+				tx.data_size = tx_size;
+				tx.data_ptr = tx_payload_for_get;
+			} else {
+				tx_size = 0;
+				tx.data_size = 0;
+				tx.data_ptr = NULL;
+			}
 			rx_size = chunk_size;
 		}
 
@@ -553,6 +591,8 @@ static int sof_ipc4_set_get_data(struct snd_sof_dev *sdev, void *data,
 
 	mutex_unlock(&sdev->ipc->tx_mutex);
 
+	kfree(tx_payload_for_get);
+
 	return ret;
 }
 
-- 
2.52.0

