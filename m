Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318783C4577
	for <linux-sound@vger.kernel.org>; Tue, 11 Aug 2026 18:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786474304; cv=none; b=dMe9vjnUsL2qdgvmL3iWHMz3FF0wXYJfSKMuA59EDmm/Lw2AUumATK0fT/RaPmrR5V8y/VzH+qeA7Rw8lVCjOYOXILc5bsre6S6raAdjn4bZYqKA5FBAAWHvvnESxORFwIGQyVADQo6hAA5+uWV6W6wjeTYHUM0/KQu0P3Ta1gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786474304; c=relaxed/simple;
	bh=iQM5jxEbj1y+rxlWisR36UpYdjTiHC5/w8Q0BeATQX8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TLFUcRyPDGspfH+wqiF7Ha9s1tXQqiN9asfnBw7Nyv62ke+pPucB5CHx1Q8VhJYv44eL7/TibAGBMVRTIaG9uAlXpT2pkA0WnTtfgvlgmPueElmt/M/OjezmhHKWFtzabas21jHuRni45xVc7rX55LEz3u+ebWiUTrLbpNL2WPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ME4ffaK+; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ME4ffaK+"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8486672f03cso262173b3a.0
        for <linux-sound@vger.kernel.org>; Tue, 11 Aug 2026 11:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786474302; x=1787079102; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r9QJl8pGujt3A7a5K1GMQ/gHvTRUESsI7iAe0ElAFJs=;
        b=ME4ffaK+obKitTL5uWaIbRWGQ5VMuY9yOdyNUPw6wU7mFm/Ykq/aH1d4MM2boAAtBw
         GWXEvY0vlJfUufEo+jd2pAT18aFVsMkATYM4hwv4yOPzuK8DJMKQH+BaRwQT22Em0RzJ
         wLzGmHUAlhf01Ht6+hdHLdBhxqZZN9C+tnKP+t9xCRo60i0QMMsa/R0b17BuqSy87I+w
         qcW7XM/Cl1rNki+FNcnyMByUZV3hCRl7ehtWNVolVp/2Ym5EXUhxwrdDqRhTJ3yXgc6v
         SzLQ8+ioP+MnAVyHXxL9ZocBhxsdeX5pKP/uhoREMWk+rfk83/BLtazYAP2ihCRZ2jQZ
         gU0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786474302; x=1787079102;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r9QJl8pGujt3A7a5K1GMQ/gHvTRUESsI7iAe0ElAFJs=;
        b=lnzgtuhX4FIudMNgcJokk8tsjWNJFDkGFkAckL02CfcDS10g5Mcts55CSffe5glgGP
         bmFkE7Zl8w3fsekt5BmvxZlXxxuvs9jqgjnz0v1R6gv4oZSf0OJWK/T2apMbONzi7yhm
         LAJRqncNhRodlNg8/YxRNHxPwk+EtqSiFM2pookML/XRYoOuU0pjI1/heqgU6lR3H8Bn
         vM/61LRm9nYH7RCIYJ65X2q1t69X7yBA9fFC3ayLnJCEqmOAH86fBYyGiOHOcFUEVxSn
         Mr7/6dkOCz3ZE/wTf0feA7Fl2nQhKCwslQQ10zpWhsZ8AEVKf8bPZfZrSAQrpQVqN4dK
         lQbQ==
X-Gm-Message-State: AOJu0YzeskpRojpayYJV2/qXpnHDlPln9sbgPhYfciwad4xP4pG8GX3h
	chi3x03evdbiRJf3lTK/U2evctDqQW2kR0MTgQWQvrXeopGCGQhgtF97jC9/dg==
X-Gm-Gg: AR+sD10MPBFWV9DBSihC7a46RMf7T6OacRbWEfUSQ7ggXDTRDQZap8IGHzu035Z9cA/
	nc/Zzwgz4sQYByLG2CYnHRckW4wg6vRpblXICYP+aonvBnoD627EokQZE8SN3/scEIR8raTX2Ib
	tvrFQOgh6BPQJCWbV+RdJl/dYbbZR5i/Cdfy7vhCtiwioKSdR9X6EKIP+odB6HidPpvdB+/CTCi
	1Jx75sKjavFPVx9hxECJP48gqNV8tCmfBWx3kFXxjgBw4sWu0J4BCbdmBt1T+88jqWULgOYRqOY
	ziCXyaqOJBmL1SFxWhACHLwJ/b5/ZX8bso0H0SYW+VN92bBEnxPjzRLSzYrBvTaLyR/iPGwhoFS
	33gMMGYbz4Kezb29WAX4rsaK5++xMInFtVVfTtQ7DOKBsmbZT8kItAJRcIf0OVAcrvL8A2Paxop
	OSW1rVhomM3J+yF+OBAMvJpD00RQgpBzESs1reClJwLuhGPEsTcjnUgI8D4PK+T9RznVxO5NvGi
	WmkCEOCKoI5m1F+kaFct51Mn3lxynU+Zs9IfGdurdVzLwICXeCa+T1BMDAp8pYAPdp7r6KGmqxM
	JY7Q6JMkI44KAa9EKr6VAR8uIL34E5S4/u6nSg==
X-Received: by 2002:a05:6a00:3e02:b0:84f:5cd7:e3c6 with SMTP id d2e1a72fcca58-84fa866eae2mr5759834b3a.5.1786474302498;
        Tue, 11 Aug 2026 11:51:42 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fb1f1edefsm155521b3a.45.2026.08.11.11.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 11:51:41 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Michal Simek <michal.simek@amd.com>,
	Maruthi Srinivas Bayyavarapu <maruthi.srinivas.bayyavarapu@xilinx.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/ZYNQ ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] ASoC: xilinx: formatter_pcm: fix stream_data leak on open error
Date: Tue, 11 Aug 2026 11:51:40 -0700
Message-ID: <20260811185140.27149-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In xlnx_formatter_pcm_open(), stream_data is allocated and
adata->play_stream or adata->capture_stream is assigned early.  If a
later step, such as snd_pcm_hw_constraint_step() or
snd_pcm_hw_constraint_integer(), fails, the function returns the error
immediately.  ALSA does not call the close callback when open fails, so
stream_data is leaked and the stream pointer is left dangling, pointing
to a substream that ALSA frees.  A later interrupt would then call
snd_pcm_period_elapsed() on the freed substream.

Free stream_data and clear the stream pointer on the error paths.

Fixes: 6f6c3c36f091 ("ASoC: xlnx: add pcm formatter platform driver")
Assisted-by: opencode:deepseek-v4-flash-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
Reviewed-by: Michal Simek <michal.simek@amd.com>
---
 v2: change goto label from err to error.
 sound/soc/xilinx/xlnx_formatter_pcm.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/sound/soc/xilinx/xlnx_formatter_pcm.c b/sound/soc/xilinx/xlnx_formatter_pcm.c
index b50306b0fc06..3d6f1e4046d8 100644
--- a/sound/soc/xilinx/xlnx_formatter_pcm.c
+++ b/sound/soc/xilinx/xlnx_formatter_pcm.c
@@ -383,7 +383,7 @@ static int xlnx_formatter_pcm_open(struct snd_soc_component *component,
 	if (err) {
 		dev_err(component->dev,
 			"Unable to set constraint on period bytes\n");
-		return err;
+		goto error;
 	}
 
 	/* Resize the buffer bytes as divisible by 64 */
@@ -393,7 +393,7 @@ static int xlnx_formatter_pcm_open(struct snd_soc_component *component,
 	if (err) {
 		dev_err(component->dev,
 			"Unable to set constraint on buffer bytes\n");
-		return err;
+		goto error;
 	}
 
 	/* Set periods as integer multiple */
@@ -402,7 +402,7 @@ static int xlnx_formatter_pcm_open(struct snd_soc_component *component,
 	if (err < 0) {
 		dev_err(component->dev,
 			"Unable to set constraint on periods to be integer\n");
-		return err;
+		goto error;
 	}
 
 	/* enable DMA IOC irq */
@@ -411,6 +411,14 @@ static int xlnx_formatter_pcm_open(struct snd_soc_component *component,
 	writel(val, stream_data->mmio + XLNX_AUD_CTRL);
 
 	return 0;
+
+error:
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		adata->play_stream = NULL;
+	else
+		adata->capture_stream = NULL;
+	kfree(stream_data);
+	return err;
 }
 
 static int xlnx_formatter_pcm_close(struct snd_soc_component *component,
-- 
2.55.0

