Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JQRuAUlU"
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF0A11FD4
	for <linux-sound@vger.kernel.org>; Wed, 29 Nov 2023 04:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701260388; x=1732796388;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=58dNflj4gktJ609m3w+Zgx50tZFYg2Vm5gW6Jl/OgJI=;
  b=JQRuAUlUtigzQWFmJqLbGIjFsRh/FgJwLDKy0we32gQKrUEsALaInPuE
   sg0Tl2XZyo9NNr2WVA0ulzKRUVd4upgjT4tU2LZkhqSQp7QS9Qhi60UTM
   ZWgf97arismp1Iiq8HfXauZMuxP5FNKy9/Tddx3QkG+s/djlMIzryfTnK
   YY2ZMGNxNKvCAth23x/YEeAsz19pQ+FqyFsH81pDbJC9pqV7duvWpbg/i
   2JpAQ7+Wk/WORPNeFkk+Z5U+8ae85MbaYpoCUkdJWkkWuYTWF3bYarwsu
   TP5Tp/t902Bbi8FAm2ofAb0d61YPW/JY6aaAzRpFCGrAuSkCZZFojI1HL
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="6421110"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="6421110"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 04:19:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="834995169"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="834995169"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.44.16])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 04:19:45 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH] ASoC: SOF: ipc4: check return value of snd_sof_ipc_msg_data
Date: Wed, 29 Nov 2023 14:20:21 +0200
Message-ID: <20231129122021.679-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Bard Liao <yung-chuan.liao@linux.intel.com>

snd_sof_ipc_msg_data could return error.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/ipc4.c b/sound/soc/sof/ipc4.c
index a9d9800d2fcc..145d319e041f 100644
--- a/sound/soc/sof/ipc4.c
+++ b/sound/soc/sof/ipc4.c
@@ -713,7 +713,14 @@ static void sof_ipc4_rx_msg(struct snd_sof_dev *sdev)
 			return;
 
 		ipc4_msg->data_size = data_size;
-		snd_sof_ipc_msg_data(sdev, NULL, ipc4_msg->data_ptr, ipc4_msg->data_size);
+		err = snd_sof_ipc_msg_data(sdev, NULL, ipc4_msg->data_ptr, ipc4_msg->data_size);
+		if (err < 0) {
+			dev_err(sdev->dev, "failed to read IPC notification data: %d\n", err);
+			kfree(ipc4_msg->data_ptr);
+			ipc4_msg->data_ptr = NULL;
+			ipc4_msg->data_size = 0;
+			return;
+		}
 	}
 
 	/* Handle notifications with payload */
-- 
2.43.0

