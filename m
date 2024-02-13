Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE43364BD
	for <linux-sound@vger.kernel.org>; Tue, 13 Feb 2024 11:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707822423; cv=none; b=Jg1C40fwX+jrkrx7PK505JrarM49ot3U14xhbmj3bFkpcNbWYg7A7gEZvQoezuw0J9WIdfchFFNCYzs9uDzGhjP+kjeOoj25pOl75bxPoIr3VJKwo+ff7CPpvNjCuPnajck78BeanBvYh9+5pEuQbN7Py/qqc3JPJ00Vse5nPWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707822423; c=relaxed/simple;
	bh=jZshnvYzJyENbxKnnWUvg4QIShBinMiOHaz5tAnO8Ns=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IspYzGqn6raXgeKKc829g7F4iCI12hMnZprxaHoFkeMtZUhPgQ4BYjACQJbceaxL/Vyq/M5bvQ4IvZjBZFbQhSCpENow4ITNlfbOV/0nik9ChZeAPgjvdIBHHIFagYJXaBBVCMclBFJd+/L9qUnvxIXkCmuAzpp7fy302F1BnPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T9/mwr1u; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T9/mwr1u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707822422; x=1739358422;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=jZshnvYzJyENbxKnnWUvg4QIShBinMiOHaz5tAnO8Ns=;
  b=T9/mwr1uYAE66p9nWX7pqaWUAokzNYkfctXZhXyrREbhXs+cltXqXxXG
   77BPmBtxOuYNVawotkK32bAka3+cSVWSmXie5zBt6ghj1TCJ5K1VFsV5l
   FEMILcap2ij/448dBZiobrxspZ5GOOT/o/O+1BYyIqPkawULvbww7uU27
   /2ely68hTbWf5dRxDDjIdg9jFM4KevbJayX4N4RvcxqY3wfOSMvDJwuAw
   IS7WUo4al4Hks33isuV/Oty0q+V2n9sVycikO98pEPgJCiDmPzVKq7HJZ
   /eO6mz48R+VMoKmJyBF5tgoMZN0uBuGC5kyQZcAgC05vYd2czxGF1VONW
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="13217362"
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="13217362"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 03:06:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="2828930"
Received: from dcoroian-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.249.42.253])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 03:06:52 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	liam.r.girdwood@intel.com,
	rander.wang@intel.com
Subject: [PATCH] ASoC: SOF: Intel: hda-dsp: Skip IMR boot on ACE platforms in case of S3 suspend
Date: Tue, 13 Feb 2024 13:07:01 +0200
Message-ID: <20240213110701.12818-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SoCs with ACE architecture are tailored to use s2idle instead deep (S3)
suspend state and the IMR content is lost when the system is forced to
enter even to S3.
When waking up from S3 state the IMR boot will fail as the content is lost.
Set the skip_imr_boot flag to make sure that we don't try IMR in this case.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda-dsp.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index 2445ae7f6b2e..1506982a56c3 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -681,17 +681,27 @@ static int hda_suspend(struct snd_sof_dev *sdev, bool runtime_suspend)
 	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
 	const struct sof_intel_dsp_desc *chip = hda->desc;
 	struct hdac_bus *bus = sof_to_bus(sdev);
+	bool imr_lost = false;
 	int ret, j;
 
 	/*
-	 * The memory used for IMR boot loses its content in deeper than S3 state
-	 * We must not try IMR boot on next power up (as it will fail).
-	 *
+	 * The memory used for IMR boot loses its content in deeper than S3
+	 * state on CAVS platforms.
+	 * On ACE platforms due to the system architecture the IMR content is
+	 * lost at S3 state already, they are tailored for s2idle use.
+	 * We must not try IMR boot on next power up in these cases as it will
+	 * fail.
+	 */
+	if (sdev->system_suspend_target > SOF_SUSPEND_S3 ||
+	    (chip->hw_ip_version >= SOF_INTEL_ACE_1_0 &&
+	     sdev->system_suspend_target == SOF_SUSPEND_S3))
+		imr_lost = true;
+
+	/*
 	 * In case of firmware crash or boot failure set the skip_imr_boot to true
 	 * as well in order to try to re-load the firmware to do a 'cold' boot.
 	 */
-	if (sdev->system_suspend_target > SOF_SUSPEND_S3 ||
-	    sdev->fw_state == SOF_FW_CRASHED ||
+	if (imr_lost || sdev->fw_state == SOF_FW_CRASHED ||
 	    sdev->fw_state == SOF_FW_BOOT_FAILED)
 		hda->skip_imr_boot = true;
 
-- 
2.43.0

