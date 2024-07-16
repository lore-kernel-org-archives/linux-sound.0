Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3806FBE
	for <linux-sound@vger.kernel.org>; Tue, 16 Jul 2024 08:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721119545; cv=none; b=NQGZQYt6Wqn72mu0ubcs+dgRibMVzGUQ5rVTXl2/0iNTAQ9KjHejP6qim5W50XSwD7KPaG81WEhs8fw/6B4IbPY5TeIOuq5T+HIveuCBgKyX90x7ElfRSKYABG6nue2IcS6cyl5z/e2NHnL8vOCOs+MFZ+pnrEPo5KhDFC7xwMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721119545; c=relaxed/simple;
	bh=E3F8GX9XsVaD+UNETRzSdWDAuCtSV1L6+rhJUkx9X4E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dCRxFl0FJPN/J2zcr7w0t5MZ0pogFfC/f34ip3BGhUsMBmQLtENdWVOIDLvzETJgUmIH9odM5j+KpJpK9HeAnLV82K4W30IlpT0ffWTQwYI9FAWLHrk8jjm0GbYQjbHfkh8qAlvDZLJkDr0klUmbn/hKejxaFyc7jXPrF7tUXm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VYqIfBlP; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VYqIfBlP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721119544; x=1752655544;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=E3F8GX9XsVaD+UNETRzSdWDAuCtSV1L6+rhJUkx9X4E=;
  b=VYqIfBlPMFw/VL8/XOBcygtn9AJgUQ00o4CKynqi0unTwtDo5JV78hC7
   Ny7DjMFIsh/4jIDtda4YhDjrW2XKnaxt2YDBKfIUFlEebPRlKFOrSTm/t
   0k0kj6D4enwiFPau1aJWvVuwFB19ssRNfjdUTSK2XfJll98/USSYY9MnU
   8yoqY3dd4UVya6whzYE0wgZQxeIwrMLPifT2Kl8mVF3n37YbyQK3ngn7y
   Kd6gprRCbWyJZ/NeNcVIYhzv7C4LEw9QjrJsPSwNwm79jeatvZ3mCvhA5
   q4NZfxu3V/kgRxtjVKUyOArRf4YV8WQi1e8msNhJiiQAtL1w1yXYvKelS
   Q==;
X-CSE-ConnectionGUID: Pzze2Y69SL+1kRVvg38maQ==
X-CSE-MsgGUID: 1ml1b3DORW2bZXL4t+YFMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="18679891"
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; 
   d="scan'208";a="18679891"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2024 01:45:43 -0700
X-CSE-ConnectionGUID: OBwj4gdwT9upZ6kFNJfPQg==
X-CSE-MsgGUID: Pxy8EW8vRqGodw27O9SEKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; 
   d="scan'208";a="54768495"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.245.246.211])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2024 01:45:40 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Mike Krinkin <krinkin.m.u@gmail.com>,
	Todd Brandt <todd.e.brandt@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH] ASOC: SOF: Intel: hda-loader: only wait for HDaudio IOC for IPC4 devices
Date: Tue, 16 Jul 2024 10:45:30 +0200
Message-ID: <20240716084530.300829-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Multiple users report a regression bisected to commit d5263dbbd8af
("ASoC: SOF: Intel: don't ignore IOC interrupts for non-audio
transfers"). The firmware version is the likely suspect, as these
users relied on SOF 2.0 while Intel only tested with the 2.2 release.

Rather than completely disable the wait_for_completion(), which can
help us gather timing information on the different stages of the boot
process, the simplest course of action is to just disable it for older
IPC versions which are no longer under active development.

Closes: https://github.com/thesofproject/linux/issues/5072
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218961
Fixes: d5263dbbd8af ("ASoC: SOF: Intel: don't ignore IOC interrupts for non-audio transfers")
Tested-by: Mike Krinkin <krinkin.m.u@gmail.com>
Tested-by: Todd Brandt <todd.e.brandt@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/hda-loader.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index b8b914eaf7e0..75f6240cf3e1 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -310,15 +310,19 @@ int hda_cl_copy_fw(struct snd_sof_dev *sdev, struct hdac_ext_stream *hext_stream
 		return ret;
 	}
 
-	/* Wait for completion of transfer */
-	time_left = wait_for_completion_timeout(&hda_stream->ioc,
-						msecs_to_jiffies(HDA_CL_DMA_IOC_TIMEOUT_MS));
+	if (sdev->pdata->ipc_type == SOF_IPC_TYPE_4) {
+		/* Wait for completion of transfer */
+		time_left = wait_for_completion_timeout(&hda_stream->ioc,
+							msecs_to_jiffies(HDA_CL_DMA_IOC_TIMEOUT_MS));
 
-	if (!time_left) {
-		dev_err(sdev->dev, "Code loader DMA did not complete\n");
-		return -ETIMEDOUT;
+		if (!time_left) {
+			dev_err(sdev->dev, "Code loader DMA did not complete\n");
+			return -ETIMEDOUT;
+		}
+		dev_dbg(sdev->dev, "Code loader DMA done\n");
 	}
-	dev_dbg(sdev->dev, "Code loader DMA done, waiting for FW_ENTERED status\n");
+
+	dev_dbg(sdev->dev, "waiting for FW_ENTERED status\n");
 
 	status = snd_sof_dsp_read_poll_timeout(sdev, HDA_DSP_BAR,
 					chip->rom_status_reg, reg,
-- 
2.43.0

