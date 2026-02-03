Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BCE33066E
	for <linux-sound@vger.kernel.org>; Tue,  3 Feb 2026 11:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770118861; cv=none; b=Gann0I5qubTZbKmHw/I5Jgh9JndEiYocVgoltuKiwOjuLrbRCIyznhkhvxGZuqPx/5LKfOG3B09BG1gMhEOA+1ykM8pM1eQqeppu/O3jMyTthVAPTdveyAOQxCcL+tJYcr9Sf/Lco6BURaSTRIDQLVhdXTUS4mKZdQYmjb6eblI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770118861; c=relaxed/simple;
	bh=xa6Z4Ccfi4zVn3La/UCqQyFGPfGBkjXMJeAROCXEIrU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qa8kCk0Ag9DmYOKhnW/Pp5ds9dPoTjvki8IJzuHjxHvGBFyviP9cFT5rcbIOgyWvJsDj2zTQVYzGQvn/lkGH8OOerJAhA+uj98RmhhCYQrDMh4pPkm7JARtLW9PgGsJELwOyKsnIemEyw5sZTOVVzNMrb+B8T2qrNx/MbxMiU6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BY5Q0ukY; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BY5Q0ukY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770118859; x=1801654859;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xa6Z4Ccfi4zVn3La/UCqQyFGPfGBkjXMJeAROCXEIrU=;
  b=BY5Q0ukYqw7SQD6v+JPdybcxO3cDSUDlRUoLohpn9ZIwLlZr8unwbiWv
   CjtsaD5w86ws7wDyP5i04vZoedU01IlN0Uh03bqUG3jVMXCcE1n9jSAdi
   z54nwA9E2lPcV7wmhUpaw9AHnDsOdPsmRixrgzLXzSMoKhXrvlQjUDT9Z
   Y5mkvqCnC2DdRqurHLVtaUYtGu34lmgJ470GapxvdIzxWaXUjGDYOsDqt
   gQ6S/y3rahIp9XsJ+pE68IhWupkI0KSkHbaon17r5smmnBg13x4c/aaHu
   NW+bpnZo7ALsOa7/MVpc6gESsAYw49jVe7+QZcUxGlei02sdEQNMZ0hlE
   A==;
X-CSE-ConnectionGUID: bISVVYSzQ4mUSyyarPy5eA==
X-CSE-MsgGUID: ApVuIcqyQa2ZMha6/n4Ocw==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="82023864"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="82023864"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 03:40:59 -0800
X-CSE-ConnectionGUID: h050B0FtR5yKt1JzzdlauA==
X-CSE-MsgGUID: pNueyCrkS3igbm1sqb2k9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="209547606"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 03:40:57 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com,
	ranjani.sridharan@linux.intel.com
Subject: [PATCH 3/3] ASoC: SOF: Intel: hda-sdw-bpt: support simultaneous audio and BPT streams
Date: Tue,  3 Feb 2026 19:40:27 +0800
Message-ID: <20260203114027.3742558-4-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203114027.3742558-1-yung-chuan.liao@linux.intel.com>
References: <20260203114027.3742558-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Currently the SoundWire BPT stream uses the paired link DMA but not
reserve it. It works without any issue because we assume the SoundWire
BPT will not run with audio streams simultaneously.
To support simultaneous audio and BPT streams, we need to use the
hda_dma_prepare/cleanup helpers to reserve the pair link host DMA.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda-sdw-bpt.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/hda-sdw-bpt.c b/sound/soc/sof/intel/hda-sdw-bpt.c
index ae2f8d55dbd0..728ffe7ae54d 100644
--- a/sound/soc/sof/intel/hda-sdw-bpt.c
+++ b/sound/soc/sof/intel/hda-sdw-bpt.c
@@ -118,7 +118,8 @@ static int hda_sdw_bpt_dma_prepare(struct device *dev, struct hdac_ext_stream **
 
 	dev_dbg(dev, "direction %d format_val %#x\n", direction, format);
 
-	bpt_stream = hda_cl_prepare(dev, format, bpt_num_bytes, dmab_bdl, false, direction, false);
+	bpt_stream = hda_data_stream_prepare(dev, format, bpt_num_bytes, dmab_bdl,
+					     false, direction, false, true);
 	if (IS_ERR(bpt_stream)) {
 		dev_err(sdev->dev, "%s: SDW BPT DMA prepare failed: dir %d\n",
 			__func__, direction);
@@ -162,7 +163,7 @@ static int hda_sdw_bpt_dma_deprepare(struct device *dev, struct hdac_ext_stream
 	u32 mask;
 	int ret;
 
-	ret = hda_cl_cleanup(sdev->dev, dmab_bdl, false, sdw_bpt_stream);
+	ret = hda_data_stream_cleanup(sdev->dev, dmab_bdl, false, sdw_bpt_stream, true);
 	if (ret < 0) {
 		dev_err(sdev->dev, "%s: SDW BPT DMA cleanup failed\n",
 			__func__);
-- 
2.43.0

