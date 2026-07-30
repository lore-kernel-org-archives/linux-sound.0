Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1202636B93A
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 13:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785416653; cv=none; b=WzimCyC6wIg38XG0Z0NGo4CqQ/IlmJra7V+jSeHI2vtYsZBN0wHjf45gumdbBWBz9LYUIzOvjvS8U5GGZFft/8UwXQmNm+I1+eHMgkGT5nWdo03C2d4OOe+vvag3P1j0sDzHiD1k4E5jeNr1jf+/Cqek32FXQeg4PivVkrWXOts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785416653; c=relaxed/simple;
	bh=6e93yu283vCLr+DYHaaZVzDGsildqQuCremdHgvvQK8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mVZrfp6HLrqcRhcCA7nXy+9Q/yaILmiEDc6JorKAVgD/EJ9NA1UosoRrpQBnG+8laeEDLAKce6uRrWaghdNL8K6mqJduJN0ynPDMMt2V3t+2aWQTdSlXOkLFAQquw9SmdH4IYSzFal2IzWI+eymNNZXhO0v/eGtLB+HwZPfCmtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nmheWKO+; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nmheWKO+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785416653; x=1816952653;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6e93yu283vCLr+DYHaaZVzDGsildqQuCremdHgvvQK8=;
  b=nmheWKO+LjvXbRzZ4RoOc7egVXAlaslZCuw5NRmSOAwXDe7vcgnDswKI
   0uNtENuUxkXS6vAOimZAmdIeYBL/Fg/C0ohBQLkKGaunAnFFrL3l9C6vw
   UdOyyKx9d2tMlxlMKefINowQ/qk/NpS5d3VDZXCYoW3Z38zMepMyTYJM0
   1ymBd2BFs2fANJNcy8lyC4RKdvXE7swzpXLHwiXjQaNLUU0zh9JA8fbq8
   g7tNKCs9eLhTmkbeIZzZp5LLTUxIc9sKWcQZqx3ccwfrx0AIniPuNXNqR
   c2yB7RmGAjBeLEpLFVe5RCdsl31h7iNsYez2cily+puGsOE8tYa8s+Pgh
   Q==;
X-CSE-ConnectionGUID: Yvrm3fcBTHGmS+PXJaKPUw==
X-CSE-MsgGUID: YkWd2hSXTk6j1ZxjM074Yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="86112416"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="86112416"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 06:04:12 -0700
X-CSE-ConnectionGUID: nMnHlhVFSeiBlpoqT6kP+g==
X-CSE-MsgGUID: rKkvECv7RESrzxajBg3lXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="264099736"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.79])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 06:04:09 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	yuhsuan@google.com
Subject: [PATCH] ASoC: SOF: Use high-priority workqueue for PCM period elapsed
Date: Thu, 30 Jul 2026 16:04:45 +0300
Message-ID: <20260730130445.8277-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Yu-Hsuan Hsu <yuhsuan@google.com>

The snd_sof_pcm_period_elapsed function currently schedules work on the
system-wide workqueue. This can lead to potential delays or jitter in
audio processing if the system workqueue is busy with other tasks.

To improve real-time performance and ensure timely processing of PCM
periods, we can use the system_highpri_wq instead of the default work
queue.

In performance testing, this change significantly reduced the observed
scheduling delays. For instance, under load(stressapptest -M 15000 -m
60), the maximum delay dropped from 9ms on the system workqueue to 5ms
on the dedicated high-priority workqueue.

Suggested-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Yu-Hsuan Hsu <yuhsuan@google.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index b2071edeaea6..f748d072109a 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -62,7 +62,7 @@ void snd_sof_pcm_period_elapsed(struct snd_pcm_substream *substream)
 	 * To avoid sending IPC before the previous IPC is handled, we
 	 * schedule delayed work here to call the snd_pcm_period_elapsed().
 	 */
-	schedule_work(&spcm->stream[substream->stream].period_elapsed_work);
+	queue_work(system_highpri_wq, &spcm->stream[substream->stream].period_elapsed_work);
 }
 EXPORT_SYMBOL(snd_sof_pcm_period_elapsed);
 
-- 
2.55.0

