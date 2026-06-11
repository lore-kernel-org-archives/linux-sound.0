Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E013E63B7
	for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 11:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781179163; cv=none; b=PYiaJmrcl26igFTeB5fKzxKtMh3Xu6nMWptMZNyHpJyUDUzZDAgX3W/8GMWihpVcIWLsqQSfJCsQAeKN+Ts7817rGbR033pPDGysggVzS6c3KckrgrJ5OQAn+F1ibl1r6ElRlsTiSm9UpUU3WKbt9vUj/kYSBE5xyScus5c9N/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781179163; c=relaxed/simple;
	bh=PXAusL+DclVAg8x0oBCUm8fbcxS7nZUqKkKhNR8/Y5g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BbFRelPwJYTwikeRNYrgVnRBO9f6NWlIHZ0+imDwwOQlTT2bQt2vV+2NdHeazUKVx5nfse2GrfkcCGuxWh5QCgXjuWl6m1286CI1/vLlB/eFC8HMur1B1BpIlpzrHIMtWDqwqirnANYIFA48LpZsLceTCBvRMxU0X2os1G0zw2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pOjdje2M; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pOjdje2M"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-36ba3ea5c46so4747901a91.1
        for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 04:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781179161; x=1781783961; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m+ETQjeJNbV6o1GvFN+Uz7BRG9UWVtcW96Zlan5VQCM=;
        b=pOjdje2MGin09FJhwdkG5yq7+KvK9YGy5xLIzGJxNKUzRgVMMPIzpwpEB/timyJ8b0
         KZDpSg4qnwQYatzp7nDf5CL9TUGtLunatgD7yrZGfx6VCdi50sIvyTrDH9I5DV4SGBks
         kxWiH6KSVINMjGbBCLhUra/ut8MBUOgevhxyIrkF4UwSzrZ0Quph0+rw/ZZiT6j3k2O0
         Vj04BjY88oXW/neFB89TqvqDerSh3AjUMVvoFhUxDsGJ5aDLcqBY42Y7u55u5o/WAoXf
         tnxDU5R+QDSBrflSG542sA+8mc6+4MHMN/7Z9kiE4opuM2lIwgZ326zNE1RRRJWtqqEQ
         4ezw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781179161; x=1781783961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m+ETQjeJNbV6o1GvFN+Uz7BRG9UWVtcW96Zlan5VQCM=;
        b=lCh8sDKEoFXOylwOW9qUU7GubDMdlqe6HWaKzw7eaIasADnxiTAnw8tkifevVJNyHt
         xK5AKWFJU1NPqLUVZNashnOwsYQLuwwWRqm3sx2sDDYIA2Y3+13q1G2Sf90IgXOrOG5f
         oFAH5vsNIIScMlKx+Cw1IgK1bt2qlndaq1uBZx6lnZRX8y5J9JWHfp8FQ10+8XBKrpr3
         ahcSWaCn2Nysa3DgSNPqMM8Mk+g6mZcFusXettjeZ4ZO/EFeyGfl5PJtAJjQc0wmmULt
         FsQrfh0er0iehIP5/SSn3thDpOzyIWwtIubPC7j0CmplZCbz9o14e9iZoO1h6bsD/ksu
         qtIQ==
X-Forwarded-Encrypted: i=1; AFNElJ/nPdMnAtzVktGvwbl0xnp33p2JtucRTOkKGgmT9WAwQCfqHJB/zEH6cKhQVeKEjJN+GnmqH1nrQBrdFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YznWsHOB7BktlMq4E3EklekkF3w2Ke5nt/KroWWcyz+PSDg3JRf
	QyRkOfC2TXsWPo02waIG8WVgSJeEnY63sL3QkiKCOluhMkIAydHeXLa1
X-Gm-Gg: Acq92OGa8WTwYQ1vHDuo5QIG1eAT8pNOv6MJxRHLMMHwZrkdc4dLzDBiclKKaggpMCl
	ziWMNEGaV1xAO/S8GamU55YR7LdMCMwv4dPjB4ZB5pPFACNaEQtTuDbgC9YaKKP5Nu4jpwQPYx+
	9lebWCNoq4mC82ZKoFSSnQw+gtuE0xJAlwC7h5Pk/fzskkLFnSL2IQI/ehqJeUGENBVbsnViOJ/
	1+yHVENrCePG7V59GzVK1e/VY/RBfl48ynPEQ3oFi6yr7fulmfWp5zG5kCvPUmtAytLILh4XoDK
	QMLGIAXr/qVjz40kpRiF0GzQOIVexwbSlmnKNgi5U7JZANoYomV1sJT8RhqPjVVugqOR2TosdzM
	5WZ31vql79OWWZvzB4KNpFkpnQHg2s9ozUqKlVAh/iNcFv+rkd1ynXsAya5xtE55XV4al/xhtr0
	QYCWaOukFSBEMPyAqZBopU5REWe8zSVUGkkS7wJjtYE5Qq4LCgkRxOSDj/jVcTogzQjprE
X-Received: by 2002:a17:90b:5708:b0:362:e826:cefe with SMTP id 98e67ed59e1d1-377a9194d84mr2588353a91.23.1781179161285;
        Thu, 11 Jun 2026 04:59:21 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37753d02ca4sm2499692a91.12.2026.06.11.04.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 04:59:20 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 01/20] ASoC: Intel: catpt: ipc: Use guard() for mutex & spin locks
Date: Thu, 11 Jun 2026 18:58:42 +0700
Message-ID: <20260611115901.80438-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260611115901.80438-1-phucduc.bui@gmail.com>
References: <20260611115901.80438-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex & spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/intel/catpt/ipc.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/sound/soc/intel/catpt/ipc.c b/sound/soc/intel/catpt/ipc.c
index 2e3b7a5cbb9b..9614ade5d31a 100644
--- a/sound/soc/intel/catpt/ipc.c
+++ b/sound/soc/intel/catpt/ipc.c
@@ -88,7 +88,6 @@ static int catpt_dsp_do_send_msg(struct catpt_dev *cdev,
 				 struct catpt_ipc_msg *reply, int timeout, const char *name)
 {
 	struct catpt_ipc *ipc = &cdev->ipc;
-	unsigned long flags;
 	int ret;
 
 	if (!ipc->ready)
@@ -97,10 +96,10 @@ static int catpt_dsp_do_send_msg(struct catpt_dev *cdev,
 	    (reply && reply->size > ipc->config.outbox_size))
 		return -EINVAL;
 
-	spin_lock_irqsave(&ipc->lock, flags);
-	catpt_ipc_msg_init(ipc, reply);
-	catpt_dsp_send_tx(cdev, &request);
-	spin_unlock_irqrestore(&ipc->lock, flags);
+	scoped_guard(spinlock_irqsave, &ipc->lock) {
+		catpt_ipc_msg_init(ipc, reply);
+		catpt_dsp_send_tx(cdev, &request);
+	}
 
 	ret = catpt_wait_msg_completion(cdev, timeout);
 	if (ret) {
@@ -131,9 +130,8 @@ int catpt_dsp_send_msg_timeout(struct catpt_dev *cdev,
 	struct catpt_ipc *ipc = &cdev->ipc;
 	int ret;
 
-	mutex_lock(&ipc->mutex);
+	guard(mutex)(&ipc->mutex);
 	ret = catpt_dsp_do_send_msg(cdev, request, reply, timeout, name);
-	mutex_unlock(&ipc->mutex);
 
 	return ret;
 }
-- 
2.43.0

