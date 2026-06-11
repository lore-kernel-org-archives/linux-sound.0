Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A183F0750
	for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 12:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781179223; cv=none; b=MadomYjBlwFJ0qm+3lpkBELZcfIQjKeizEcqEIaWgKQvFBZsK0BIoL7lUQ1g6yk3HhVv3M1odvhr5kDnewZm07DIh8eq+VRr9U7VMGUVIGCCfbOYwPWFEQZ7Wp439/p2976wehW8eOocioBuWNRPs7vPmiXACBu19xRP4q9LO6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781179223; c=relaxed/simple;
	bh=ygmh1PgsZbdcb+s7zxopAuJjD2zzsAlhQr9jLdk4Kt4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WLaYRgZqbC9Nk98mo5+EcwFYrWhziLcE+DLSZqthnFfxqO7zKrE5cgKT0otpGYUvCOZCy2v2pbThNSPZ56wKvbh7GLNpg1nX9iu6YpiaybbxWsNaeCGbUBxz59NXfmpf3zhy982WC1DGuSyznhSaICeKxZMdD5ujit+e2zggi0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZLuL/IIR; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZLuL/IIR"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-36b8e1760ccso4965584a91.0
        for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 05:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781179222; x=1781784022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q8vbg19auCbmtJB8KpRbzJOt5fwaGu65erRdObf1qpQ=;
        b=ZLuL/IIREL4VXhjxNiGdWXJI0JF9+dOwPfV0M5ZTpXdME2IjpWszKt29RgxVNDfSdB
         ZrGqMhdipDf5l7Oi4SlZ5o2dX/xjD0eGXukuceFlIdtEl2RBq5Hsld/pO4NeUHTDEWCr
         GBbNcqxgxWzsg8GQ0iUMM6pyz4mU5/UuED6BrIIF1xsMzZ4asijcxcmcDmnJrehOSdEV
         FKFhfYhIpPiEBtot6/7bsV0Zq8ZfBnZx3iVqAjKnmQgwMat90MK0ef1Hp8lqmMgUNuL8
         BbOmwZ0qHZ5hpcpvkzEiUXRSB5sbOJAn4/2t1GXT/s1R5g99PcRV+VSmOqDrei9SCQhB
         As+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781179222; x=1781784022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q8vbg19auCbmtJB8KpRbzJOt5fwaGu65erRdObf1qpQ=;
        b=Y0oE08rCzrpNap4U5liNhQIvWeN8sCHBoz9kCI7uERMjEfHrIWuRDF3dq2RefhMCh8
         A3TXSe+yuU4qzQFlipgQMVGE6yuwQvAhMgihmigia7VD/IDSRtMv5oteJA39rKUssiQf
         sJdIRzXSw/ijfI+Y9lmbN72MbEzGz1uihX7kTOcEcQoEhTk0c/qmT6Y/ZuSslM9RUlwc
         TJV0lGCw5Hb/duDqRoNd+yiUZwQOjDUgf7pei8+rb2zlzL9PRvrCL/k74Q+MAVbHoXuW
         bvAcsmbQKLfJPmBeY7aXN1RRIybSPtOyn8XFjyoCtKFU1x1XNVrAJxw7SJVf/1/PnbDK
         JbwA==
X-Forwarded-Encrypted: i=1; AFNElJ/6KTlhjpn/YSbiRC2Z7GHrgL7eT/VZW99XE3nQR8qUdcyQ6Wd/fX7RL7oxjQNRAIxFVsrmr0PUNYToqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzofUHZIZRloluv8msyrcZhG5lkj68agzGeqB/b9r1uAjyar9H9
	K8HaS74w1AayFR6Tnqq54PUBXidbaI3IFjGomfnq9lBidbJk4KiqZ6Yj
X-Gm-Gg: Acq92OF9CpQwxTtVRhfbk2S6S9uX5k6k1SmpgxCSWcQkMpfpprYSP9x/82NWzTsuDxo
	PJ1KH7iNWca3sDAqF88c9PNX1izXzDgLH3l7QdIxPOPLWE678x8cctfrSnYiQDZG+h4Png1sWUe
	nKiJSPMuS35L1yD4Su5v2RhiNvYr9yEGHBwhuDtgPN8CwL7CbgSwJay8OGRlW+TX5Q65IZe1EUt
	lYwP8bPIb5oivN4RtATRnd30/2fIH7goPU7++B/FEvQjA2E7Xl9hSKM0j/RcLs4Q82nswuzoLc9
	KEiQcj6eMwFJBXg36jpYbcAJorUc6YpxEYRt85iF1Zz2rLGzPKYZb8z3tvsi8o9m9FYFmWDcPU3
	F3H2aXYNW2NFS5NJDPtKpI69R5prd9wB9VERiN32iR6T4+jixnmp9GqptYPhvq/Mm8KVocg9Wwz
	WJfCJxWnqXH/74FDwZO0PonPlaRzh2LOwXqbxKrYD58n9eb/NOhQjyguuFiE8kinIqWSHr
X-Received: by 2002:a17:90b:4a43:b0:36b:b4a1:2939 with SMTP id 98e67ed59e1d1-377a48cc277mr2951922a91.15.1781179220272;
        Thu, 11 Jun 2026 05:00:20 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37753d02ca4sm2499692a91.12.2026.06.11.05.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 05:00:19 -0700 (PDT)
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
Subject: [PATCH 15/20] ASoC: Intel: atom: sst_stream: Use guard() for mutex locks
Date: Thu, 11 Jun 2026 18:58:56 +0700
Message-ID: <20260611115901.80438-16-phucduc.bui@gmail.com>
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

Clean up the code using guard() for mutex locks.
Additionally, simplify sst_free_stream() while
converting the locking code.
No functional change intended.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/intel/atom/sst/sst_stream.c | 52 ++++++++++++---------------
 1 file changed, 23 insertions(+), 29 deletions(-)

diff --git a/sound/soc/intel/atom/sst/sst_stream.c b/sound/soc/intel/atom/sst/sst_stream.c
index 288221db7323..d2d6ed6df661 100644
--- a/sound/soc/intel/atom/sst/sst_stream.c
+++ b/sound/soc/intel/atom/sst/sst_stream.c
@@ -265,9 +265,8 @@ int sst_pause_stream(struct intel_sst_drv *sst_drv_ctx, int str_id)
 			str_info->status = STREAM_PAUSED;
 		} else if (retval == -SST_ERR_INVALID_STREAM_ID) {
 			retval = -EINVAL;
-			mutex_lock(&sst_drv_ctx->sst_lock);
-			sst_clean_stream(str_info);
-			mutex_unlock(&sst_drv_ctx->sst_lock);
+			scoped_guard(mutex, &sst_drv_ctx->sst_lock)
+				sst_clean_stream(str_info);
 		}
 	} else {
 		retval = -EBADRQC;
@@ -332,9 +331,8 @@ int sst_resume_stream(struct intel_sst_drv *sst_drv_ctx, int str_id)
 			str_info->prev = STREAM_PAUSED;
 		} else if (retval == -SST_ERR_INVALID_STREAM_ID) {
 			retval = -EINVAL;
-			mutex_lock(&sst_drv_ctx->sst_lock);
-			sst_clean_stream(str_info);
-			mutex_unlock(&sst_drv_ctx->sst_lock);
+			scoped_guard(mutex, &sst_drv_ctx->sst_lock)
+				sst_clean_stream(str_info);
 		}
 	} else {
 		retval = -EBADRQC;
@@ -433,39 +431,35 @@ int sst_free_stream(struct intel_sst_drv *sst_drv_ctx, int str_id)
 
 	dev_dbg(sst_drv_ctx->dev, "SST DBG:sst_free_stream for %d\n", str_id);
 
-	mutex_lock(&sst_drv_ctx->sst_lock);
-	if (sst_drv_ctx->sst_state == SST_RESET) {
-		mutex_unlock(&sst_drv_ctx->sst_lock);
-		return -ENODEV;
+	scoped_guard(mutex, &sst_drv_ctx->sst_lock) {
+		if (sst_drv_ctx->sst_state == SST_RESET)
+			return -ENODEV;
 	}
-	mutex_unlock(&sst_drv_ctx->sst_lock);
 	str_info = get_stream_info(sst_drv_ctx, str_id);
 	if (!str_info)
 		return -EINVAL;
 
-	mutex_lock(&str_info->lock);
-	if (str_info->status != STREAM_UN_INIT) {
+	scoped_guard(mutex, &str_info->lock) {
+		if (str_info->status == STREAM_UN_INIT) {
+			dev_dbg(sst_drv_ctx->dev, "SST DBG:BADQRC for stream\n");
+			return -EBADRQC;
+		}
 		str_info->prev =  str_info->status;
 		str_info->status = STREAM_UN_INIT;
-		mutex_unlock(&str_info->lock);
+	}
 
-		dev_dbg(sst_drv_ctx->dev, "Free for str %d pipe %#x\n",
-				str_id, str_info->pipe_id);
-		retval = sst_prepare_and_post_msg(sst_drv_ctx, str_info->task_id, IPC_CMD,
-				IPC_IA_FREE_STREAM_MRFLD, str_info->pipe_id, 0,
-				NULL, NULL, true, true, false, true);
+	dev_dbg(sst_drv_ctx->dev, "Free for str %d pipe %#x\n", str_id, str_info->pipe_id);
+
+	retval = sst_prepare_and_post_msg(sst_drv_ctx, str_info->task_id, IPC_CMD,
+			IPC_IA_FREE_STREAM_MRFLD, str_info->pipe_id, 0,
+			NULL, NULL, true, true, false, true);
+
+	dev_dbg(sst_drv_ctx->dev, "sst: wait for free returned %d\n", retval);
 
-		dev_dbg(sst_drv_ctx->dev, "sst: wait for free returned %d\n",
-				retval);
-		mutex_lock(&sst_drv_ctx->sst_lock);
+	scoped_guard(mutex, &sst_drv_ctx->sst_lock)
 		sst_clean_stream(str_info);
-		mutex_unlock(&sst_drv_ctx->sst_lock);
-		dev_dbg(sst_drv_ctx->dev, "SST DBG:Stream freed\n");
-	} else {
-		mutex_unlock(&str_info->lock);
-		retval = -EBADRQC;
-		dev_dbg(sst_drv_ctx->dev, "SST DBG:BADQRC for stream\n");
-	}
+
+	dev_dbg(sst_drv_ctx->dev, "SST DBG:Stream freed\n");
 
 	return retval;
 }
-- 
2.43.0

