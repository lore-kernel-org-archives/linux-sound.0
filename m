Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E09533993
	for <linux-sound@vger.kernel.org>; Tue,  7 Jan 2025 11:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736248187; cv=none; b=VAbPckxAUvEbdvBEIIHZvGW5TBWR27JWO6umgO9Xc4vqh3+HZHcUIWvOooA+i/zqmYpKVbLSV7vnF1en9uK6Qy+f+viwLEoA/ilMm7vHumSepOOjjJZjXw292tzo1D/JbY/ieAvCwa4REqLh0kMbWhHeWLZu6mTK3WJ4maS6LJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736248187; c=relaxed/simple;
	bh=sqEbjb89vWAjdb3F55lInvUwtmmq8OUfjJF/BWvS3F4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uoPiby/Gq2wZtSZoovRrdUcho3PdxugTitN1SGyJp8kzY3gHpIukqnLh1GTgUIOAdSbPKXHXnYbSM/OsfCwIs+besNJwk0S68VEG3jOHBn2S+cQgZx5Bqrs/Cm8+wOzABxey/AftJII0k2O05o8etZjsfB0kJ3HBt50p4SCFQXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=VndB/gOM; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="VndB/gOM"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736248182;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4Bt/Tg56N3ejEPxGoyt26WWJWEYLD2p6ANEZv7IrsyM=;
	b=VndB/gOM/yNm1lZL3GwW4NUGVG3kTWwRvvNmhomEoiyImgH7ne5MqHncpt/ZXkkbbDoFev
	LKle6cSxoMT4jgF0Yn6QjmBH64bke2QVwpZMDGvvs9PDLdb8zCjuuNtRacrQJet/on7jGS
	Dwg68ZmmCppmilRhvuLh27mF2FUCkD0=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Thorsten Blum <thorsten.blum@linux.dev>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH] ASoC: SOF: Intel: Use str_yes_no() to improve bdw_dump()
Date: Tue,  7 Jan 2025 12:08:59 +0100
Message-ID: <20250107110900.3716-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Remove hard-coded strings by using the str_yes_no() helper function.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 sound/soc/sof/intel/bdw.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/sof/intel/bdw.c b/sound/soc/sof/intel/bdw.c
index c4d92f3508b6..5282c0071534 100644
--- a/sound/soc/sof/intel/bdw.c
+++ b/sound/soc/sof/intel/bdw.c
@@ -266,20 +266,20 @@ static void bdw_dump(struct snd_sof_dev *sdev, u32 flags)
 	imrd = snd_sof_dsp_read(sdev, BDW_DSP_BAR, SHIM_IMRD);
 	dev_err(sdev->dev,
 		"error: ipc host -> DSP: pending %s complete %s raw 0x%8.8x\n",
-		(panic & SHIM_IPCX_BUSY) ? "yes" : "no",
-		(panic & SHIM_IPCX_DONE) ? "yes" : "no", panic);
+		str_yes_no(panic & SHIM_IPCX_BUSY),
+		str_yes_no(panic & SHIM_IPCX_DONE), panic);
 	dev_err(sdev->dev,
 		"error: mask host: pending %s complete %s raw 0x%8.8x\n",
-		(imrx & SHIM_IMRX_BUSY) ? "yes" : "no",
-		(imrx & SHIM_IMRX_DONE) ? "yes" : "no", imrx);
+		str_yes_no(imrx & SHIM_IMRX_BUSY),
+		str_yes_no(imrx & SHIM_IMRX_DONE), imrx);
 	dev_err(sdev->dev,
 		"error: ipc DSP -> host: pending %s complete %s raw 0x%8.8x\n",
-		(status & SHIM_IPCD_BUSY) ? "yes" : "no",
-		(status & SHIM_IPCD_DONE) ? "yes" : "no", status);
+		str_yes_no(status & SHIM_IPCD_BUSY),
+		str_yes_no(status & SHIM_IPCD_DONE), status);
 	dev_err(sdev->dev,
 		"error: mask DSP: pending %s complete %s raw 0x%8.8x\n",
-		(imrd & SHIM_IMRD_BUSY) ? "yes" : "no",
-		(imrd & SHIM_IMRD_DONE) ? "yes" : "no", imrd);
+		str_yes_no(imrd & SHIM_IMRD_BUSY),
+		str_yes_no(imrd & SHIM_IMRD_DONE), imrd);
 }
 
 /*
-- 
2.47.1

