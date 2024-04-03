Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FE5136989
	for <linux-sound@vger.kernel.org>; Wed,  3 Apr 2024 10:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712141546; cv=none; b=Ls/bG8dYwi5n0yyRkdYGVJ3Fr9P22ZcnwBXpw+I1hCCKUbTnNutY61NR3hAtvhfIG636NUWoR1fEEp7V/jvRPWqTxqM5600ufB9jHIOINh15M21aQropTjCBuQ9F+J3VTEzDoGjh5cw51qdTawR0EJ8LXkYWLwg8Qj3pru2AbOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712141546; c=relaxed/simple;
	bh=TB3U5DyFLdiTso/zAIU2seZ9xbyOBOvQxIdi0/CSuTA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YDhD7fD1C3I6Fs6R5JzkHNRpJhzDHo3/e68tWrgQx+0l7Kj6yTr7ChdvfJU/J35QoAmxRMQfqwbYtrfd0bbhT5/EpRZNcRwQP9SWcOIXPEgMJvYu3xtRaMD5SM3t0DF2KCGIL9hYUi5D1KAXvs9xdCvEGs0tG9KV3nFRwEHHaEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S2A6g711; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S2A6g711"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712141545; x=1743677545;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TB3U5DyFLdiTso/zAIU2seZ9xbyOBOvQxIdi0/CSuTA=;
  b=S2A6g711d5XzoMWK1zN/juAYd0PkfDugW+nv8r31Ui7qiYx61bURXRa7
   MH92adQhSe+48tFnPdB2uvAXE8IEis6tidTlMQSHQJLGWOLnJ4xHpiIP3
   WCN6unrgiIij/1X8R/L8gYzLBk9EeN3/N4jlMKnOJmEMecJjzru4jLeW2
   ZdmjemXOu6h9jStxMw68VdJwkm6BhISiZwNgQOyVX46aIFjB9mxEbQQOx
   C7g0P2WvchjHd4pmAn3p2Wdy903chfsxhFU8dZos2T/PvHB2G7rOQi5Il
   77GSbW7Yf+bIzUHdYZiNJywGws3h8Ap33O8MgCPbMdIhdQR0gsnNjWVLL
   Q==;
X-CSE-ConnectionGUID: ER2romzKS66BUW/32tZ4nA==
X-CSE-MsgGUID: CqeoZV1KSV2KmDaIEeQ++g==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7212243"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="7212243"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 03:51:55 -0700
X-CSE-ConnectionGUID: Pi3C79MdQyenf2UNoamGHw==
X-CSE-MsgGUID: EwTRR7+wQQ++Otx6d95dZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="49374809"
Received: from aelgham-mobl2.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.249.35.133])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 03:51:53 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	rander.wang@intel.com,
	liam.r.girdwood@intel.com
Subject: [PATCH 5/7] ASoC: SOF: Intel: mtl: Implement firmware boot state check
Date: Wed,  3 Apr 2024 13:52:08 +0300
Message-ID: <20240403105210.17949-6-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240403105210.17949-1-peter.ujfalusi@linux.intel.com>
References: <20240403105210.17949-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With the corrected rom_status_reg values we can now add a check for target
boot status for firmware booting.
With the check now we can identify failed firmware boots (IMR boots) and
we can use the fallback to purge boot the DSP.

Fixes: 064520e8aeaa ("ASoC: SOF: Intel: Add support for MeteorLake (MTL)")
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 sound/soc/sof/intel/mtl.c | 37 ++++++++++++++++++++++++++++++++-----
 1 file changed, 32 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/intel/mtl.c b/sound/soc/sof/intel/mtl.c
index 3bc229957365..5c9d14e5925d 100644
--- a/sound/soc/sof/intel/mtl.c
+++ b/sound/soc/sof/intel/mtl.c
@@ -444,7 +444,7 @@ int mtl_dsp_cl_init(struct snd_sof_dev *sdev, int stream_tag, bool imr_boot)
 {
 	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
 	const struct sof_intel_dsp_desc *chip = hda->desc;
-	unsigned int status;
+	unsigned int status, target_status;
 	u32 ipc_hdr, flags;
 	char *dump_msg;
 	int ret;
@@ -490,13 +490,40 @@ int mtl_dsp_cl_init(struct snd_sof_dev *sdev, int stream_tag, bool imr_boot)
 
 	mtl_enable_ipc_interrupts(sdev);
 
+	if (chip->rom_status_reg == MTL_DSP_ROM_STS) {
+		/*
+		 * Workaround: when the ROM status register is pointing to
+		 * the SRAM window (MTL_DSP_ROM_STS) the platform cannot catch
+		 * ROM_INIT_DONE because of a very short timing window.
+		 * Follow the recommendations and skip target state waiting.
+		 */
+		return 0;
+	}
+
 	/*
-	 * ACE workaround: don't wait for ROM INIT.
-	 * The platform cannot catch ROM_INIT_DONE because of a very short
-	 * timing window. Follow the recommendations and skip this part.
+	 * step 7:
+	 * - Cold/Full boot: wait for ROM init to proceed to download the firmware
+	 * - IMR boot: wait for ROM firmware entered (firmware booted up from IMR)
 	 */
+	if (imr_boot)
+		target_status = FSR_STATE_FW_ENTERED;
+	else
+		target_status = FSR_STATE_INIT_DONE;
 
-	return 0;
+	ret = snd_sof_dsp_read_poll_timeout(sdev, HDA_DSP_BAR,
+					chip->rom_status_reg, status,
+					(FSR_TO_STATE_CODE(status) == target_status),
+					HDA_DSP_REG_POLL_INTERVAL_US,
+					chip->rom_init_timeout *
+					USEC_PER_MSEC);
+
+	if (!ret)
+		return 0;
+
+	if (hda->boot_iteration == HDA_FW_BOOT_ATTEMPTS)
+		dev_err(sdev->dev,
+			"%s: timeout with rom_status_reg (%#x) read\n",
+			__func__, chip->rom_status_reg);
 
 err:
 	flags = SOF_DBG_DUMP_PCI | SOF_DBG_DUMP_MBOX | SOF_DBG_DUMP_OPTIONAL;
-- 
2.44.0

