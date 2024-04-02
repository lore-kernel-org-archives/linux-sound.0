Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0578612CD82
	for <linux-sound@vger.kernel.org>; Tue,  2 Apr 2024 15:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712071127; cv=none; b=UCqq7NDmtFxd0heAXpXqdxIATFHU0vaeYASnt+c7P/QOqbkZ/jGoPh6wmrsYYqkEcOjrIoErUsKxA7NQdv84PdApksNKxWdthYl/5mKia+nNLFMYeMa9wk8I4Wi/xVw2OcKH5Eg9kF9LVOKOSIyqHbHF2vrXq37Qa42Nlm1mLdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712071127; c=relaxed/simple;
	bh=Pv5VsCRUPEy45V9LDEImBhiwWfDOxWF4sH/Qxur1TJE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VkrgNb2jxgi9kPcNp3dJ20HzpFgafJo/Kf06oDCIZqMRuqjsx0UNQtFpe31+WaFS2/RdIOtP9dBfEPLYCaaas+K6LiCvzyRi01e0I816Z+ZiFKl9pgWUk2OoCbgrJ2b0ASCK66mXCDktOoX6c+2q+jpsuZ9cLbvUGgCOkWo/zrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NnmypJLm; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NnmypJLm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712071126; x=1743607126;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Pv5VsCRUPEy45V9LDEImBhiwWfDOxWF4sH/Qxur1TJE=;
  b=NnmypJLm2xJTbeVqm2B7BjdIUhsgNuVTkdmvc0c5XCgxY1i79/nRHZ2e
   M0dFPyhwxBipN3OFtokVpNflNqEfIO3aq1Yt5fH2Tw+EK9lt5X0qe2F4T
   TFmeYTnySl8VlDKikSzf+bHey9/Sp3ngrlvq0WpXvHIz44W2hTVxF+iCT
   nnftrW9WZRJLnyuWfWWfUsFPP/YuauCT+uQX77Dr7QjtTStKeUp3BwwHH
   3uwsnFgwE7S4/KDlNtOReGFZXpssxXakI4VP17uG7vIsk6gznZdIs0t3/
   TC3hdzbdtMY8lDoGuxAt8RtzIUlvSrWxZLxsGFKjGXZaO76z40zUd0mb+
   A==;
X-CSE-ConnectionGUID: ZOy7sbObTQ+JHnAnPsYbWw==
X-CSE-MsgGUID: 8S5WjO6FSyWRfKe2Bd+r+Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="29730156"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="29730156"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 08:18:45 -0700
X-CSE-ConnectionGUID: 7QEPXCQaRwy0PUDC3eaacA==
X-CSE-MsgGUID: zqpLv5qLSO284Z0Bg9xMKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="22796538"
Received: from skhare-mobl5.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.8.83])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 08:18:44 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Subject: [PATCH 13/17] ASoC: SOF: sof-audio: revisit sof_pcm_stream_free() error handling and logs
Date: Tue,  2 Apr 2024 10:18:24 -0500
Message-Id: <20240402151828.175002-14-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240402151828.175002-1-pierre-louis.bossart@linux.intel.com>
References: <20240402151828.175002-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

For some reason the existing code stops on the first error, which
potentially leaves the DMA and widgets in a weird state.

Change to free-up all resources even in case of errors.

Also add a more consistent error handling and logs, with the first
error code returned to the caller.

Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/sof-audio.c | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index e693dcb475e4..b5ca2861edbd 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -834,17 +834,21 @@ int sof_pcm_stream_free(struct snd_sof_dev *sdev, struct snd_pcm_substream *subs
 {
 	const struct sof_ipc_pcm_ops *pcm_ops = sof_ipc_get_ops(sdev, pcm);
 	int ret;
+	int err = 0;
 
 	if (spcm->prepared[substream->stream]) {
 		/* stop DMA first if needed */
 		if (pcm_ops && pcm_ops->platform_stop_during_hw_free)
 			snd_sof_pcm_platform_trigger(sdev, substream, SNDRV_PCM_TRIGGER_STOP);
 
-		/* Send PCM_FREE IPC to reset pipeline */
+		/* free PCM in the DSP */
 		if (pcm_ops && pcm_ops->hw_free) {
 			ret = pcm_ops->hw_free(sdev->component, substream);
-			if (ret < 0)
-				return ret;
+			if (ret < 0) {
+				dev_err(sdev->dev, "%s: pcm_ops hw_free failed %d\n",
+					__func__, ret);
+				err = ret;
+			}
 		}
 
 		spcm->prepared[substream->stream] = false;
@@ -852,17 +856,25 @@ int sof_pcm_stream_free(struct snd_sof_dev *sdev, struct snd_pcm_substream *subs
 
 	/* reset the DMA */
 	ret = snd_sof_pcm_platform_hw_free(sdev, substream);
-	if (ret < 0)
-		return ret;
+	if (ret < 0) {
+		dev_err(sdev->dev, "%s: platform hw free failed %d\n",
+			__func__, ret);
+		if (!err)
+			err = ret;
+	}
 
 	/* free widget list */
 	if (free_widget_list) {
 		ret = sof_widget_list_free(sdev, spcm, dir);
-		if (ret < 0)
-			dev_err(sdev->dev, "failed to free widgets during suspend\n");
+		if (ret < 0) {
+			dev_err(sdev->dev, "%s: sof_widget_list_free failed %d\n",
+				__func__, ret);
+			if (!err)
+				err = ret;
+		}
 	}
 
-	return ret;
+	return err;
 }
 
 /*
-- 
2.40.1

