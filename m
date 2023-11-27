Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cn2v2fBD"
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1295BEA
	for <linux-sound@vger.kernel.org>; Mon, 27 Nov 2023 02:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701082324; x=1732618324;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NMSe3c8+Xo+G3eS2Zqx/vyUseR9hOOuVhhGMZHfayJU=;
  b=cn2v2fBDYI2dz90tptGdntUpWi59HpvNvRLRK9KeORC+5PqcGrq+KyIJ
   w+zMX43tCa2PrBbbb8aRhdiBJTXDLkhfPRbHyvDCo15ey/pZnmrzJ/ADv
   6Sv2Kf4pf6AeVpEZnLpAXOq/UDWf/i0Ix84EyLjh86Tzu9jpvUvfNhG2K
   Vh5JoRQORuhSi9Vb76g/VpqKziKHJkFiDrrZIXJ6sVbVI7r6ASH63+Cgp
   Dc4ui2/UoJCf0Gd/TawEewJM0QReaQFsa5RmE0n2OeqtCZy+cTkWN5iaZ
   D8/+ei5uSm4xUXwgjwCxT8StRW7HareLdLH0HRbL38YRIGMM5a0b/apdj
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="377713056"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="scan'208";a="377713056"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 02:52:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="797206526"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="scan'208";a="797206526"
Received: from acornagl-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.58.144])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 02:52:01 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yong.zhi@intel.com
Subject: [PATCH] ASoC: SOF: Intel: mtl: call dsp dump when boot retry fails
Date: Mon, 27 Nov 2023 12:52:35 +0200
Message-ID: <20231127105235.30071-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Yong Zhi <yong.zhi@intel.com>

Call snd_sof_dsp_dbg_dump() with the same flags/dump_msg
as used in function hda_loader.c/cl_dsp_init().

Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Yong Zhi <yong.zhi@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/mtl.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/mtl.c b/sound/soc/sof/intel/mtl.c
index 254dbbeac1d0..3ef9e5c37028 100644
--- a/sound/soc/sof/intel/mtl.c
+++ b/sound/soc/sof/intel/mtl.c
@@ -440,7 +440,8 @@ int mtl_dsp_cl_init(struct snd_sof_dev *sdev, int stream_tag, bool imr_boot)
 	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
 	const struct sof_intel_dsp_desc *chip = hda->desc;
 	unsigned int status;
-	u32 ipc_hdr;
+	u32 ipc_hdr, flags;
+	char *dump_msg;
 	int ret;
 
 	/* step 1: purge FW request */
@@ -493,8 +494,18 @@ int mtl_dsp_cl_init(struct snd_sof_dev *sdev, int stream_tag, bool imr_boot)
 	return 0;
 
 err:
-	snd_sof_dsp_dbg_dump(sdev, "MTL DSP init fail", 0);
+	flags = SOF_DBG_DUMP_PCI | SOF_DBG_DUMP_MBOX | SOF_DBG_DUMP_OPTIONAL;
+
+	/* after max boot attempts make sure that the dump is printed */
+	if (hda->boot_iteration == HDA_FW_BOOT_ATTEMPTS)
+		flags &= ~SOF_DBG_DUMP_OPTIONAL;
+
+	dump_msg = kasprintf(GFP_KERNEL, "Boot iteration failed: %d/%d",
+			     hda->boot_iteration, HDA_FW_BOOT_ATTEMPTS);
+	snd_sof_dsp_dbg_dump(sdev, dump_msg, flags);
 	mtl_dsp_core_power_down(sdev, SOF_DSP_PRIMARY_CORE);
+
+	kfree(dump_msg);
 	return ret;
 }
 
-- 
2.43.0

