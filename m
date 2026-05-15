Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8763AA1AE
	for <linux-sound@vger.kernel.org>; Fri, 15 May 2026 08:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778833856; cv=none; b=j9ZBiWcFt3TJX5cKpANE3EOo/mAlEDdxxrP8qGnwJNzer65HOv1at8697LyLXfQkM/lrn2IBKprEh39tv89DQRWFqlzMAVeB1/7gPwbkv4jkjDTNSVkNLb74sSWPiu7Fd6Nx56vbs2mOO7YNywraqXeYU2hG1SO5KCVzB0KnvIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778833856; c=relaxed/simple;
	bh=pB57aRtitwDSWpWZ/93h/exberHdIMJluzqF5V1KBPM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qcjCqs2qeuely3g7FBv6OI1HY6prYSS8gl+MYUnUzojgrphC0gQ1uWmnjHxygvMBBGZxexuP0FzWpMgAUcAUzolN8RpXLUo4rgyyG1/5Nfu32OiGRwsrvizJi3HwfJ7h6rTnRLm8SZJ3wrE/nSCL4fODgLIiy/469dGvWhB5qJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aOlB9nVA; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aOlB9nVA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778833854; x=1810369854;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=pB57aRtitwDSWpWZ/93h/exberHdIMJluzqF5V1KBPM=;
  b=aOlB9nVAqlD5ZbFFMLJGMp9S6N0bQMnFDbKqdUT+I/w+4fKkhLDPK34s
   shmFXUoEYZIF2UVeKFaE3rLyeMvZydQ/eaCaqRQnEcOc+vD6ArGfEyEbQ
   7EkOni/JtTvNtZamkLhQi6AImKRrdPmPox1eGBpU9UEFLgLuuO0MGDOep
   5x+Y2GSgKJlkG7c+NqMdbfxJQmb2KyMiBGSkmgTNRuiDUcJdGrFJLr5OK
   7UYUcBZ/AG5L4Z8g3cAkr5vZmq2u86NyxPKfRBSRwPkKafIvKm3B8p8Mg
   PEdJpn5+OCtTXrmJFhZpiFjdf0W4459jTbEGXBIUtF3uC0VRHFtnsI7Kf
   Q==;
X-CSE-ConnectionGUID: R9Gg+GjYRvqGC68ZJd1FBg==
X-CSE-MsgGUID: c+jrh+e7RYKdRk+mG0awuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="79644864"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="79644864"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 01:30:52 -0700
X-CSE-ConnectionGUID: 8/jUAZWeTD+3CyuoCqriqw==
X-CSE-MsgGUID: lKo2brFJQQ6fPFaeNfABTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="243610366"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 01:30:51 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com,
	Deep.Harsora@Dell.com
Subject: [PATCH] ASoC: Intel: sof_sdw: append dai type to dai link name unconditionally
Date: Fri, 15 May 2026 16:30:43 +0800
Message-ID: <20260515083043.1864426-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The dai_type is used to select function topologies. Since the topology
stream name and DAI link name use partial matching, unconditionally
appending the dai_type provides necessary selection metadata
without breaking existing topologies.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index c18ec607e029..5c4682f9f7c9 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -901,10 +901,16 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 		}
 	}
 
+	/*
+	 * The dai_type is used to select function topologies. Since the topology stream name
+	 * and DAI link name use partial matching, unconditionally appending the dai_type provides
+	 * necessary selection metadata without breaking existing topologies. Although
+	 * ctx->append_dai_type is not checked here, we overwrite it to ensure consistency in case
+	 * it is referenced elsewhere.
+	 */
+	ctx->append_dai_type = true;
 	for_each_pcm_streams(stream) {
 		static const char * const sdw_stream_name[] = {
-			"SDW%d-Playback",
-			"SDW%d-Capture",
 			"SDW%d-Playback-%s",
 			"SDW%d-Capture-%s",
 		};
@@ -932,15 +938,10 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 		}
 
 		/* create stream name according to first link id */
-		if (ctx->append_dai_type)
-			name = devm_kasprintf(dev, GFP_KERNEL,
-					      sdw_stream_name[stream + 2],
-					      ffs(sof_end->link_mask) - 1,
-					      type_strings[sof_end->dai_info->dai_type]);
-		else
-			name = devm_kasprintf(dev, GFP_KERNEL,
-					      sdw_stream_name[stream],
-					      ffs(sof_end->link_mask) - 1);
+		name = devm_kasprintf(dev, GFP_KERNEL,
+				      sdw_stream_name[stream],
+				      ffs(sof_end->link_mask) - 1,
+				      type_strings[sof_end->dai_info->dai_type]);
 		if (!name)
 			return -ENOMEM;
 
-- 
2.43.0

