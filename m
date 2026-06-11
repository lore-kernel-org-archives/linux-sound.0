Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9A93E9C1F
	for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 11:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781179192; cv=none; b=uNwCGPcTc5KFJgjg1I70W0zdc6YvqRF6AX3HJq3AZ+mjP0T7bC4qp0j9Jp9cFFGGuHs1n1PCxqdufOa7dL6lD/2HBCTsjMSiKELQetN9UWMHYcWLI8L9Fi6I1Tm2OpKVwTqLTucY+T8GqPo2Rp9MdejLW52u+5bDxS7RJZs7WSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781179192; c=relaxed/simple;
	bh=U+GEnLNMlriojKABWCJwBwGuvtvs2nwbpUuOxuhRKmc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bv6bE9m+PyyJMo2xEbypyaGKzl6SZgft7rdmS5GL/PxWR/AXm1X3fuxbep4SbgPMtm+NWVBXyzLqg04YVU5LMRS4zt7TqPGAZ2qG41MOSpMUOjwfLFzglsWOPblOAHGE0XrZ64jMZhgec3BJsYAmFG/ph9VtpAMz2pEgvBh0o2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=imA+DLAL; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="imA+DLAL"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-36bb3551f6eso6873207a91.1
        for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 04:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781179190; x=1781783990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Shxsr/IFFAQqXJH4bg0NyDR4Sn4AVNCKrkaGqtwnP9c=;
        b=imA+DLALmRKKaaWsb4wm4Qte+VLjhPYwoL6mj8RYnZbKBXG1rFIVgYGCT3XkWBTufe
         PfenL5c85f7UZZeLN51Q6qLR/NHtjXE23D0BWJkOFjVSVicRVyy/zP7idCA6V5HgSHdw
         SWfKwYpeMk2P03qKzqz88D70hmB2QA6Y2FcbnEDn39DpUrcOBkqOgUqqh++xmpjTZYH8
         kjoWjYmbQ0P1OhOsGPhTtu/LnbWfeDK2cMXybK0l9Ba/b7NjpLjsQr4TcunKhNdAXUHp
         Z3Mm8E3RRiqnBNUG93YaB5o8J80cUOLGz/PH7Uh6mlG+E0ldXPkfKm2PYMncYp6mr6f4
         R9Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781179190; x=1781783990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Shxsr/IFFAQqXJH4bg0NyDR4Sn4AVNCKrkaGqtwnP9c=;
        b=Gb2WQORKtotOow4BoWg37tS9o9KK2gaY83pBlnRYy90WiLinzgNkgM+P0mK//R2Nhc
         Za9BU7EzJIH3I7jVf8v8pNmBphL0FlejdE2qIgwT1aEVuKhd3HcU+gcxMGSPz6hpcyeN
         dujkXCKQ2jo5Yorq+AYp9Chz32e0MWqHbPWzcTCBxW8YZTVc+owTVem+Jz6oLL1L0oii
         QYYg1GMHn3ZYp3+YVmc6knUyLUx27cRxipLOy26Cmm2wJQ4p3kAZqgnDk9iNjz+jQMf2
         IlERKiD9zpnMWjUOggMsu8/nemw9RApR9Uu/noubi8n7EmJLDpGnvy5F+ScoHhESddTO
         rRmQ==
X-Forwarded-Encrypted: i=1; AFNElJ/CoFP+Z45Llg/ZDw/wRxLmLINkq+LS4YKTntnM+auj5hBsca2xapks1vy0jPtIdF/nkrF8DDdzc6mYiw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn2yYdh9unQk7s9Ou0+w1ju/4/Kc+/qO9VDHrIoZAhbo7/uAxf
	bac2ziL6mMvo5a3r523z7KRdw1Ar2vWwfBsAwBshRy4lK9qYuxLFuR9l
X-Gm-Gg: Acq92OETkbNzXosgYjWWDxHpkFhJv1/8XZJ5xA0enMmDgJPCuEKyjwkaPCCDNVfR6NF
	V86aHQ2czlTlpmV0ID5s8/0Q48x88ikEc4PtQKZXK++nDdRiFLRzIzCGxxPqMi+GuU4Rjckgrab
	wF48y3RNgnTU4oSQmiRbuThDclWUrwJqIDd/KPo/ulvzWwiDx9+2iSnlCbnCzpCpbIDvwyPNA4A
	lOswLa8Meu6rl6wpnmdzews4DslYpGggjhK4F5zPtTHDM3A2gBv4x5GHWGzVpI/miOCak2Oar0W
	EYoSIUXQwnZ09IOpl5XnFopZvomndY8LVQ3v1r7GDncIC28C3AYUsIhwcfwvQq03/lPDSVHko0V
	H4Sv0dQQjKIR6rs5gLfAIhczoBNf7aG1aoWb0zLd/ODtvgCaPGMVFIfFW7JoxeGLcjHRBx0t0pP
	1igKFY9CBSgWKRrPtTqi36GXfDs/b1eFLXrVHIURYO703DzYc//sljmHO+PfoCZQAJu91l
X-Received: by 2002:a17:90b:584e:b0:36b:8824:d7cc with SMTP id 98e67ed59e1d1-377aa0e499cmr2978319a91.20.1781179190073;
        Thu, 11 Jun 2026 04:59:50 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37753d02ca4sm2499692a91.12.2026.06.11.04.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 04:59:49 -0700 (PDT)
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
Subject: [PATCH 08/20] ASoC: Intel: avs: ipc: Use guard() for mutex & spin locks
Date: Thu, 11 Jun 2026 18:58:49 +0700
Message-ID: <20260611115901.80438-9-phucduc.bui@gmail.com>
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
Additionally, simplify avs_ipc_wait_busy_completion()
while converting the locking code.
No functional change intended.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/intel/avs/ipc.c | 105 ++++++++++++++++++--------------------
 1 file changed, 49 insertions(+), 56 deletions(-)

diff --git a/sound/soc/intel/avs/ipc.c b/sound/soc/intel/avs/ipc.c
index c0feb9edd7f6..0dae36c83678 100644
--- a/sound/soc/intel/avs/ipc.c
+++ b/sound/soc/intel/avs/ipc.c
@@ -99,39 +99,39 @@ static void avs_dsp_recovery(struct avs_dev *adev)
 	unsigned int core_mask;
 	int ret;
 
-	mutex_lock(&adev->comp_list_mutex);
-	/* disconnect all running streams */
-	list_for_each_entry(acomp, &adev->comp_list, node) {
-		struct snd_soc_pcm_runtime *rtd;
-		struct snd_soc_card *card;
-
-		card = acomp->base.card;
-		if (!card)
-			continue;
-
-		for_each_card_rtds(card, rtd) {
-			struct snd_pcm *pcm;
-			int dir;
-
-			pcm = rtd->pcm;
-			if (!pcm || rtd->dai_link->no_pcm)
+	scoped_guard(mutex, &adev->comp_list_mutex) {
+		/* disconnect all running streams */
+		list_for_each_entry(acomp, &adev->comp_list, node) {
+			struct snd_soc_pcm_runtime *rtd;
+			struct snd_soc_card *card;
+
+			card = acomp->base.card;
+			if (!card)
 				continue;
 
-			for_each_pcm_streams(dir) {
-				struct snd_pcm_substream *substream;
+			for_each_card_rtds(card, rtd) {
+				struct snd_pcm *pcm;
+				int dir;
 
-				substream = pcm->streams[dir].substream;
-				if (!substream || !substream->runtime)
+				pcm = rtd->pcm;
+				if (!pcm || rtd->dai_link->no_pcm)
 					continue;
 
-				/* No need for _irq() as we are in nonatomic context. */
-				snd_pcm_stream_lock(substream);
-				snd_pcm_stop(substream, SNDRV_PCM_STATE_DISCONNECTED);
-				snd_pcm_stream_unlock(substream);
+				for_each_pcm_streams(dir) {
+					struct snd_pcm_substream *substream;
+
+					substream = pcm->streams[dir].substream;
+					if (!substream || !substream->runtime)
+						continue;
+
+					/* No need for _irq() as we are in nonatomic context. */
+					snd_pcm_stream_lock(substream);
+					snd_pcm_stop(substream, SNDRV_PCM_STATE_DISCONNECTED);
+					snd_pcm_stream_unlock(substream);
+				}
 			}
 		}
 	}
-	mutex_unlock(&adev->comp_list_mutex);
 
 	/* forcibly shutdown all cores */
 	core_mask = GENMASK(adev->hw_cfg.dsp_cores - 1, 0);
@@ -294,10 +294,10 @@ void avs_dsp_process_response(struct avs_dev *adev, u64 header)
 	 */
 	if (avs_msg_is_reply(header)) {
 		/* Response processing is invoked from IRQ thread. */
-		spin_lock_irq(&ipc->rx_lock);
-		avs_dsp_receive_rx(adev, header);
-		ipc->rx_completed = true;
-		spin_unlock_irq(&ipc->rx_lock);
+		scoped_guard(spinlock_irq, &ipc->rx_lock) {
+			avs_dsp_receive_rx(adev, header);
+			ipc->rx_completed = true;
+		}
 	} else {
 		avs_dsp_process_notification(adev, header);
 	}
@@ -338,21 +338,18 @@ static int avs_ipc_wait_busy_completion(struct avs_ipc *ipc, int timeout)
 	}
 
 	/* Ongoing notification's bottom-half may cause early wakeup */
-	spin_lock(&ipc->rx_lock);
-	if (!ipc->rx_completed) {
-		if (repeats_left) {
+	scoped_guard(spinlock, &ipc->rx_lock) {
+		if (!ipc->rx_completed) {
+			if (!repeats_left)
+				return -ETIMEDOUT;
+
 			/* Reply delayed due to notification. */
 			repeats_left--;
 			reinit_completion(&ipc->busy_completion);
-			spin_unlock(&ipc->rx_lock);
 			goto again;
 		}
-
-		spin_unlock(&ipc->rx_lock);
-		return -ETIMEDOUT;
 	}
 
-	spin_unlock(&ipc->rx_lock);
 	return 0;
 }
 
@@ -397,12 +394,12 @@ static int avs_dsp_do_send_msg(struct avs_dev *adev, struct avs_ipc_msg *request
 	if (!ipc->ready)
 		return -EPERM;
 
-	mutex_lock(&ipc->msg_mutex);
+	guard(mutex)(&ipc->msg_mutex);
 
-	spin_lock(&ipc->rx_lock);
-	avs_ipc_msg_init(ipc, reply);
-	avs_dsp_send_tx(adev, request, true);
-	spin_unlock(&ipc->rx_lock);
+	scoped_guard(spinlock, &ipc->rx_lock) {
+		avs_ipc_msg_init(ipc, reply);
+		avs_dsp_send_tx(adev, request, true);
+	}
 
 	ret = avs_ipc_wait_busy_completion(ipc, timeout);
 	if (ret) {
@@ -412,7 +409,7 @@ static int avs_dsp_do_send_msg(struct avs_dev *adev, struct avs_ipc_msg *request
 			/* Same treatment as on exception, just stack_dump=0. */
 			avs_dsp_exception_caught(adev, &msg);
 		}
-		goto exit;
+		return ret;
 	}
 
 	ret = ipc->rx.rsp.status;
@@ -436,8 +433,6 @@ static int avs_dsp_do_send_msg(struct avs_dev *adev, struct avs_ipc_msg *request
 			memcpy(reply->data, ipc->rx.data, reply->size);
 	}
 
-exit:
-	mutex_unlock(&ipc->msg_mutex);
 	return ret;
 }
 
@@ -501,16 +496,16 @@ static int avs_dsp_do_send_rom_msg(struct avs_dev *adev, struct avs_ipc_msg *req
 	struct avs_ipc *ipc = adev->ipc;
 	int ret;
 
-	mutex_lock(&ipc->msg_mutex);
+	guard(mutex)(&ipc->msg_mutex);
 
-	spin_lock(&ipc->rx_lock);
-	avs_ipc_msg_init(ipc, NULL);
-	/*
-	 * with hw still stalled, memory windows may not be
-	 * configured properly so avoid accessing SRAM
-	 */
-	avs_dsp_send_tx(adev, request, false);
-	spin_unlock(&ipc->rx_lock);
+	scoped_guard(spinlock, &ipc->rx_lock) {
+		avs_ipc_msg_init(ipc, NULL);
+		/*
+		 * with hw still stalled, memory windows may not be
+		 * configured properly so avoid accessing SRAM
+		 */
+		avs_dsp_send_tx(adev, request, false);
+	}
 
 	/* ROM messages must be sent before main core is unstalled */
 	ret = avs_dsp_op(adev, stall, AVS_MAIN_CORE_MASK, false);
@@ -522,8 +517,6 @@ static int avs_dsp_do_send_rom_msg(struct avs_dev *adev, struct avs_ipc_msg *req
 		dev_err(adev->dev, "%s (0x%08x 0x%08x) failed: %d\n",
 			name, request->glb.primary, request->glb.ext.val, ret);
 
-	mutex_unlock(&ipc->msg_mutex);
-
 	return ret;
 }
 
-- 
2.43.0

