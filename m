Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C864A43AA2
	for <linux-sound@vger.kernel.org>; Mon,  3 Jun 2024 07:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717399586; cv=none; b=EsT+q9s9fc7qgJ1MfaYKgH8x7qGkbt+rxfubqC6ogeRg4EJo4Cqb6hwpsEsMIWUVNi+vj/5d0J2wEYWjyPPUcqwB40TdVfZRKv6+TUeDT2zbZ1Jcw4YKOpGql3PAw+rXyq7mxqFqvzhAaBodv4Og77cFbjjhO9Te1Mt/aBNHb0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717399586; c=relaxed/simple;
	bh=sUEfLvcpsfFBsQpCU3OdvUvxMb5DahoZWa/PhwuDR0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=igG4kQk+2Nna2aoDG85OgErwKNkKh3bTB45kQSEpdOohD0ictyC4RRc41uViserl7fWfxRNjBAT0WejfKbrNXU22Vamws3rbhQdLjTAvBhpeOC8oeGxIsBsCVY0aPnajBH0QhKnZxQFmZzCHW6b3QaLYt2cDCTLadmMahUguU+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IGtIjvtD; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IGtIjvtD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717399585; x=1748935585;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=sUEfLvcpsfFBsQpCU3OdvUvxMb5DahoZWa/PhwuDR0Q=;
  b=IGtIjvtDjh5eHtb9/h0aYUJMcsDqIhE+BWY4qokTdynKPU+E/G/tEKfq
   goeklIXUAwtqI/i+BYfzFOZcqI3o/M2Dx6DC1Qhiu9AWEfsZllx7rxIFd
   6V4+exueTHVzOuhhexLYQD6B2hM2CMWe27OepjimERntR5phZogq2Ccb2
   ADrB4TrSYggbPuncYA3pVaUzpjEf/zqEWvf0FavylwVbydcCi+j0GUVZV
   xZjB3XobyVAjWe5/q8b1z1DlI7BCnczlYouKUKpLNjro1x8okTa9n0mfF
   iAHIRX/pm9LYlEsZ3LfmCc2KkRRCWZpJnJj2B3XiMdB/iWsmU5hsF4REf
   A==;
X-CSE-ConnectionGUID: ZVskRCeJSzWrPBGAt05ufQ==
X-CSE-MsgGUID: e+2mCL6xRTmOuYtoBSS8dQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="24506513"
X-IronPort-AV: E=Sophos;i="6.08,210,1712646000"; 
   d="scan'208";a="24506513"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 00:26:24 -0700
X-CSE-ConnectionGUID: cFQYJDIZTSyVzMFKxEeutA==
X-CSE-MsgGUID: eE8JNxZ3Q4KaUrlKxgDr+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,210,1712646000"; 
   d="scan'208";a="67631300"
Received: from fpallare-mobl3.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.245.158])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 00:26:22 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com
Subject: [PATCH] ASoC: SOF: sof-audio: Skip unprepare for in-use widgets on error rollback
Date: Mon,  3 Jun 2024 10:26:47 +0300
Message-ID: <20240603072647.8261-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the ipc_prepare() callback fails for a module instance, on error rewind
we must skip the ipc_unprepare() call for ones that has positive use count.

The positive use count means that the module instance is in active use, it
cannot be unprepared.

The issue affects capture direction paths with branches (single dai with
multiple PCMs), the affected widgets are in the shared part of the paths.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/sof-audio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index b3ac040811e7..ef9318947d74 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -485,7 +485,7 @@ sof_prepare_widgets_in_path(struct snd_sof_dev *sdev, struct snd_soc_dapm_widget
 			if (ret < 0) {
 				/* unprepare the source widget */
 				if (widget_ops[widget->id].ipc_unprepare &&
-				    swidget && swidget->prepared) {
+				    swidget && swidget->prepared && swidget->use_count == 0) {
 					widget_ops[widget->id].ipc_unprepare(swidget);
 					swidget->prepared = false;
 				}
-- 
2.45.1

