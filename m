Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CzTfzJYZ"
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82DB618E
	for <linux-sound@vger.kernel.org>; Mon, 27 Nov 2023 02:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701081761; x=1732617761;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QeE+iwgmw3Sq38zAMShCiOEs8yjCxoRZ9RY/QNtRo1U=;
  b=CzTfzJYZT36ivJjs7E44VO8uLe2qzDKh2dV9cIlUZDg9CLYQJIaVffGs
   JF+1+Y1HryzeUfS/5Db+PWSi0aaL0o7ZmsXzrgeEGf3LD5Ddpp9sofzGr
   KZYOdWqV5X+5PWfpzmR95oL3DKE09/0JGyrzlBbkK7k1haaFsq5rYojED
   xgtQrru7JmHKtj0xw3Kv0iIwAHLrF3OgJ6OWyl8Jn6B//OxHg3DOSt+l1
   1wfBqBjVgw2ERvsK24dNOKBxm/keCPaxQZhIsl5Bpsq0L/1tAy+z7Qsgn
   tg4dEg3oP6HNk9r0RxAIoP1pElcDnjlSenoreUp/m8LOARhgHN81P9+xP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="383068337"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="scan'208";a="383068337"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 02:42:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="1015514043"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="scan'208";a="1015514043"
Received: from acornagl-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.58.144])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 02:42:38 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com
Subject: [PATCH] ASoC: SOF: Intel: Use existing helpers to change GPROCEN and PIE bits
Date: Mon, 27 Nov 2023 12:43:13 +0200
Message-ID: <20231127104313.16661-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of directly changing the GPROCEN/PIE bits in PPCTL we should use
the existing helper hda_dsp_ctrl_ppcap_enable() and
hda_dsp_ctrl_ppcap_int_enable() helpers for clarity.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-loader.c | 5 ++---
 sound/soc/sof/intel/hda.c        | 6 ++----
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index 46fb2d1425e9..1805cf754beb 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -510,9 +510,8 @@ int hda_dsp_cl_boot_firmware(struct snd_sof_dev *sdev)
 		return chip_info->init_core_mask;
 
 	/* disable DSP */
-	snd_sof_dsp_update_bits(sdev, HDA_DSP_PP_BAR,
-				SOF_HDA_REG_PP_PPCTL,
-				SOF_HDA_PPCTL_GPROCEN, 0);
+	hda_dsp_ctrl_ppcap_enable(sdev, false);
+
 	return ret;
 }
 
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 744c0dd5766d..fe4ae349dad5 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -1350,8 +1350,7 @@ void hda_dsp_remove(struct snd_sof_dev *sdev)
 
 	if (!sdev->dspless_mode_selected) {
 		/* disable DSP IRQ */
-		snd_sof_dsp_update_bits(sdev, HDA_DSP_PP_BAR, SOF_HDA_REG_PP_PPCTL,
-					SOF_HDA_PPCTL_PIE, 0);
+		hda_dsp_ctrl_ppcap_int_enable(sdev, false);
 	}
 
 	/* disable CIE and GIE interrupts */
@@ -1366,8 +1365,7 @@ void hda_dsp_remove(struct snd_sof_dev *sdev)
 		chip->power_down_dsp(sdev);
 
 	/* disable DSP */
-	snd_sof_dsp_update_bits(sdev, HDA_DSP_PP_BAR, SOF_HDA_REG_PP_PPCTL,
-				SOF_HDA_PPCTL_GPROCEN, 0);
+	hda_dsp_ctrl_ppcap_enable(sdev, false);
 
 skip_disable_dsp:
 	free_irq(sdev->ipc_irq, sdev);
-- 
2.43.0

