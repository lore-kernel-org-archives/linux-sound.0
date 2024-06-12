Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2FB8168C3A
	for <linux-sound@vger.kernel.org>; Wed, 12 Jun 2024 12:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718194298; cv=none; b=ro9r6cxOtxZlpNOFrwVURliOT/8F7xSk3C9nl5izGn6jQx00orSYv+OMtpTa+NV+cjo28Tf/tOwZfWr25TfIO3qc2eIJwNuhvihSJ1R/gNpQ8BP1ATKGSMNYyawY1CQOe1JyRDJEUYWM+dB4eiKbHT2V8vS2ll9yDkXfEdGZ1mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718194298; c=relaxed/simple;
	bh=HKF+cmvbrRUa/EuLNzsDOqJsAzDGm4oECwC2QorLzGo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UBJQ3dBXuyJN3KjWLK7QqJNbwx2najIH7/ew+PDvJmB5d3WdsFHyBG35dkvQHsotV5OgNLuv8F565I5qIuxdo8L7cTt/gdmDHNcutImKhTMMy2CkXufYM581fJ7SObcwbNwGEwbTVkXaOgL77gWIo1wkimHloOZ/6GAy0DLyySk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jjBtgv/6; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jjBtgv/6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718194297; x=1749730297;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=HKF+cmvbrRUa/EuLNzsDOqJsAzDGm4oECwC2QorLzGo=;
  b=jjBtgv/6SmWwEcLMk/XHgxhsuIqK4G5+w/DJSBEsmh3UdKVO86YPm1Rj
   +TRNqcH1BM1wLyiFFGRANk6aUNDZh72TZ6al35pvzpXyTjZLSRXy5veFY
   w1E6delDh6cfx7NlFOmfinnXnHbccsDgGoCJtOLfT9fm8NiCZnfqEqF3z
   +8D/DrLMd6H4409g+meRkwuR0iIIwRMvcdR4UH0GJpaqNCIUfYOb76ty9
   OZAR/QH94YbKuoZRuPMm5b3PxiuTGkrFIs2RzbrQF/j9eX7o0EsF7NyhO
   xshmihNmZw81sKWSjK99mVxTQU5dITJi0nT6QQoi7pofzeZwhvmND/yGF
   A==;
X-CSE-ConnectionGUID: 094IUTs1T+yzXkhpRQGeLw==
X-CSE-MsgGUID: hbdDOa+6TuCUvOSY+fCO/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11100"; a="40360115"
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; 
   d="scan'208";a="40360115"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 05:11:36 -0700
X-CSE-ConnectionGUID: DGh1h6abR7Kikp6O3bICcw==
X-CSE-MsgGUID: MVvztAuDTD+KxN3voTPlWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; 
   d="scan'208";a="44336927"
Received: from fpallare-mobl3.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.245.211])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 05:11:34 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com
Subject: [PATCH] ASoC: SOF: sof-audio: Skip unprepare for in-use widgets on error rollback
Date: Wed, 12 Jun 2024 15:12:03 +0300
Message-ID: <20240612121203.15468-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.45.2
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
index 881eec38c2e2..9a52781bf8d8 100644
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
2.45.2

