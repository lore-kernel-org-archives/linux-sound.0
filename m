Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24053C2C2
	for <linux-sound@vger.kernel.org>; Mon, 15 Jan 2024 09:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UBHNHT+O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705310478; x=1736846478;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RKobo0C54zLcYh6pneMlmfz1wXDz9EUe0P7F1h/XJKU=;
  b=UBHNHT+OC4Xyn6zvVtSGp8gb0gJkBNSEaPEsFDQqRUUbw9rkpnqY3klk
   7Du21sms9zcLldEdjSMVZiIayv/a8380MS+x2l0xT7LzKR+cwcolhXoTK
   CFxBRfHP4Gc4f1QHbO6353YTWbQxwYc+ijaatWk5fCduNGqRTFJyyuq47
   SeWu/0bw2pBh462VRZ+o5NjNajDJGk/GpBIJDTpQkm2KU99eoHqn+3bUM
   u4kehi5m2FgGzh3raQNp4QIV0cW2tI1xLqAM4Ev3bipZqWCFd4zq8yhpS
   bO+Wbp4002csRJnofXydJLuG06QguC3gK5sXNDygHXrhcJxNRNBq5gGvo
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="403332395"
X-IronPort-AV: E=Sophos;i="6.04,196,1695711600"; 
   d="scan'208";a="403332395"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2024 01:21:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="733250983"
X-IronPort-AV: E=Sophos;i="6.04,196,1695711600"; 
   d="scan'208";a="733250983"
Received: from jofuegbe-mobl.amr.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.54.217])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2024 01:21:15 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	rander.wang@intel.com
Subject: [PATCH 1/2] ASoC: SOF: ipc4-pcm: remove log message for LLP
Date: Mon, 15 Jan 2024 11:22:08 +0200
Message-ID: <20240115092209.7184-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240115092209.7184-1-peter.ujfalusi@linux.intel.com>
References: <20240115092209.7184-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Rander Wang <rander.wang@intel.com>

LLP is supported by I2S and SDW platforms but not supported by HDA
platforms. This log is used to notify developer current LLP status
for current device. Since above case is known to developers, the log
is unnecessary and should be removed.

Fixes: 7cb19007baba ("ASoC: SOF: ipc4-pcm: add hw_params")
Signed-off-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-pcm.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/sof/ipc4-pcm.c b/sound/soc/sof/ipc4-pcm.c
index 39039a647cca..85d3f390e4b2 100644
--- a/sound/soc/sof/ipc4-pcm.c
+++ b/sound/soc/sof/ipc4-pcm.c
@@ -768,10 +768,8 @@ static void sof_ipc4_build_time_info(struct snd_sof_dev *sdev, struct snd_sof_pc
 	info->llp_offset = offsetof(struct sof_ipc4_fw_registers, llp_evad_reading_slot) +
 					sdev->fw_info_box.offset;
 	sof_mailbox_read(sdev, info->llp_offset, &llp_slot, sizeof(llp_slot));
-	if (llp_slot.node_id != dai_copier->data.gtw_cfg.node_id) {
-		dev_info(sdev->dev, "no llp found, fall back to default HDA path");
+	if (llp_slot.node_id != dai_copier->data.gtw_cfg.node_id)
 		info->llp_offset = 0;
-	}
 }
 
 static int sof_ipc4_pcm_hw_params(struct snd_soc_component *component,
-- 
2.43.0

