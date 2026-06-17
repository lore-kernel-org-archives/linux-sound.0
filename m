Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB85742EEBB
	for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 10:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692770; cv=none; b=Kb6dmeaFQ5rGvspg9t/DqLo2FO71tm+LfDn+RhFeUg4oXFaDqeXWEuVHhBC8nHKuAMwcc0sPm4lHPNpveyh0EIpLUGfZpY7JGeairEpWyZI3V/2QFN1ORwMmt6WfpiKQHcnwfKvg6ANqXiMEYl63as66Ro6EZT4dvt5cgQ8sCNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692770; c=relaxed/simple;
	bh=glqReXfZPCSQ9DjYZSYbXgYtCkut9TkNRV+nVhsubfM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EMIHx+inMFzN0eQc7rQl12sobo1eSYYn/x2gDeV5S28If1n5APe10PxAiGraR+X/1023GoEZ6x5P9MchOZLHs93D81XG+6BV1/KlaSKuvKTkuuoMDfYraV0DjZPoGIxMiigS2bhmYmgd420COuHIRr0g8ph8ki92W5wUN7//fXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r0jKmD8c; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r0jKmD8c"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-30b6dad2382so6296099eec.0
        for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 03:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692768; x=1782297568; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4V8d0Yg4cyesbpB3rX5XFizQgFDCgrflJrinbH7M1Rc=;
        b=r0jKmD8cRIPodZpZhU3iGM4wck9r9fcNzH0KM/dgii4UGpZ0dBT+Jy5LKcrM6g7HZT
         wJzmUf+dY1GagKoGSd4aznPEXV4NtrCjzFv24ip05CTBZKjPvCFIBfRGXiqGISwyqgIa
         efQqIg6guAh0m4LJTVjEPfZXckjrvhLsVVkY4fIwCI/BbzZn5sLj1z6fxLDS8V9QAn3I
         olLi0DgOa/0pOFeDHLf4ggmf5+zM7EKoMqdqgC+WEi2Gysv9YkdHa+2PYaOcoLCbJ0VG
         47JTUzLOKYahXftWjLp1N93aeNw26zuCsj9c3mjXVHRoybPt2FHgnAaThTa+ykg5e8Ww
         g6bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692768; x=1782297568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4V8d0Yg4cyesbpB3rX5XFizQgFDCgrflJrinbH7M1Rc=;
        b=sVb7D7+n87orlmOGOXvIu4JwOAKBG1JY6UXS7+OQMoAmKQqHr6LGyWTm2P8aAymbMq
         orDMq3ToKkrordEw0H85SwxQPn+z3DuTAK8xCldSIRzs00O+aV/iL4SlcZ2lAXCimig1
         4jyS94n/8S+rQHF/dp4yedT5+C+inJXotPkXgJmljTHaMvPXCSE51UdJ6EwUP0Sgw4A+
         zTJlM48yM7aJx7x+9fF9qZLyJqTT0DuugrXODqC2HB7X+Y89MJjUH16uyd7jR2G7xX5z
         b3scfiw/iE8mOi+RlrBso8rO08VJ4ipH3jenSUqth/ABePkJNFDHVE1+uOXAzFyCBpZz
         y36w==
X-Forwarded-Encrypted: i=1; AFNElJ/pof+Q10cv4QDd2jQr8VvClafYSJrOkNIH0l8eTsKGResmBPIvhYFKU+xHvMNcVdMgiUOY8y0Qx+AHww==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfDxN+kqHQvEud6W291BPSUNUV/U/5LQnmqkncrbF0jr31NZjq
	wUDTcA42wOpzx25JpVusKDNb/mwivQvOsQZyhUEgrZkFIDa4ZYojMbGl
X-Gm-Gg: AfdE7clemvsPh95rvEq+RopafBskMThKh9Z6oniZujDCJRvZrbDRnQOq6SjOMnynFVw
	6EuJm0P1aY3NeeSerFBKJdIlzUmsdVWHTLqnQQlumh1X2UahagKHgC9A2W9ioBpIYtUwSniY8ww
	h4IwOGuzBAOx8dSceiMuWBYlYNRvFDfZ7pixS2/9+gW9cqd3ttyvIaXxhOnLDbEpQp104/Saczu
	QKtT7t5ZwZNyqrSaCwMO3OiIoMZgUQ+7AB44fRXumVpPU6Gg6xVY/1/LoWtUCp3Xs8qpCHqmThd
	GGpkey5gsX4SV2fiIF8K/eSJtdQp9LOiJ4H2rCjIDczUUrxVlerqFWz7J83OFnJuTNm3jIrbpXj
	vSHatOUEa6AOCjcrv58Yh7h49INUb5aFRI24dX5o+3fv90T6prp3VG9KcA7J47OEhD3ZvKiT/L+
	rbK7l6nhTO7NbAc1VLI7OMRRIgCUuvI/6WCy80/ajvl1Fc4tE=
X-Received: by 2002:a05:7300:2d20:b0:304:d835:274 with SMTP id 5a478bee46e88-30bcae227f9mr1625563eec.24.1781692768114;
        Wed, 17 Jun 2026 03:39:28 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:39:27 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 41/78] ASoC: codecs: rt5514-spi: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:58 +0700
Message-ID: <20260617103235.449609-42-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/rt5514-spi.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/rt5514-spi.c b/sound/soc/codecs/rt5514-spi.c
index 199507d12841..be4f5f7da22e 100644
--- a/sound/soc/codecs/rt5514-spi.c
+++ b/sound/soc/codecs/rt5514-spi.c
@@ -79,17 +79,17 @@ static void rt5514_spi_copy_work(struct work_struct *work)
 	unsigned int cur_wp, remain_data;
 	u8 buf[8];
 
-	mutex_lock(&rt5514_dsp->dma_lock);
+	guard(mutex)(&rt5514_dsp->dma_lock);
 	if (!rt5514_dsp->substream) {
 		dev_err(rt5514_dsp->dev, "No pcm substream\n");
-		goto done;
+		return;
 	}
 
 	runtime = rt5514_dsp->substream->runtime;
 	period_bytes = snd_pcm_lib_period_bytes(rt5514_dsp->substream);
 	if (!period_bytes) {
 		schedule_delayed_work(&rt5514_dsp->copy_work, 5);
-		goto done;
+		return;
 	}
 
 	if (rt5514_dsp->buf_size % period_bytes)
@@ -111,7 +111,7 @@ static void rt5514_spi_copy_work(struct work_struct *work)
 
 		if (remain_data < period_bytes) {
 			schedule_delayed_work(&rt5514_dsp->copy_work, 5);
-			goto done;
+			return;
 		}
 	}
 
@@ -146,9 +146,6 @@ static void rt5514_spi_copy_work(struct work_struct *work)
 	snd_pcm_period_elapsed(rt5514_dsp->substream);
 
 	schedule_delayed_work(&rt5514_dsp->copy_work, 5);
-
-done:
-	mutex_unlock(&rt5514_dsp->dma_lock);
 }
 
 static void rt5514_schedule_copy(struct rt5514_dsp *rt5514_dsp)
@@ -216,7 +213,7 @@ static int rt5514_spi_hw_params(struct snd_soc_component *component,
 		snd_soc_component_get_drvdata(component);
 	u8 buf[8];
 
-	mutex_lock(&rt5514_dsp->dma_lock);
+	guard(mutex)(&rt5514_dsp->dma_lock);
 	rt5514_dsp->substream = substream;
 	rt5514_dsp->dma_offset = 0;
 
@@ -225,8 +222,6 @@ static int rt5514_spi_hw_params(struct snd_soc_component *component,
 	if (buf[0] & RT5514_IRQ_STATUS_BIT)
 		rt5514_schedule_copy(rt5514_dsp);
 
-	mutex_unlock(&rt5514_dsp->dma_lock);
-
 	return 0;
 }
 
@@ -236,9 +231,8 @@ static int rt5514_spi_hw_free(struct snd_soc_component *component,
 	struct rt5514_dsp *rt5514_dsp =
 		snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&rt5514_dsp->dma_lock);
-	rt5514_dsp->substream = NULL;
-	mutex_unlock(&rt5514_dsp->dma_lock);
+	scoped_guard(mutex, &rt5514_dsp->dma_lock)
+		rt5514_dsp->substream = NULL;
 
 	cancel_delayed_work_sync(&rt5514_dsp->copy_work);
 
-- 
2.43.0

