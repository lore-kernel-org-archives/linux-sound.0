Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB9B48B381
	for <linux-sound@vger.kernel.org>; Mon, 18 May 2026 14:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779114741; cv=none; b=ZxFBfCp9FIkX2uXbAmj2nAQa19Jk/+NV6uWbEreppVFXZFtLKPBpuz6nyLM9JT7ymSmYTdjUt4sMzJdXR89EkAiW0zgbLz0RnIhfZQTveq2ub7mYNCeSM9yJvJPoABBOyFMGBV7Zy+r1jpj+sNYBHeLSAXbFZeNx89lv/NqHW2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779114741; c=relaxed/simple;
	bh=WU/ixeeXgWodEpKM2ABkeTnuybuFAzfoH2evxyYyYHI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=AhjBh2R1mr00T/Z9lWGz5z1cJPmJ25oXFTCYxw8CsxJfOwDlVJOd/d4E+/wMGf13ACgJRFHATLXWxF04sJFwmnuCAD7aEToVRgwCOTLA5nh/8StafLrQ9uLK9yJW87J6XwTvEtzGk1PIythVzpK/Kj3B4uaic7F03eGfZZYF5XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OoE5t2wW; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OoE5t2wW"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3025d725a05so6776749eec.1
        for <linux-sound@vger.kernel.org>; Mon, 18 May 2026 07:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779114735; x=1779719535; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a7v5fmjNDe5pdh+mZp306lvLb186vTmBdoWrk3fqYYs=;
        b=OoE5t2wWU51JKeUCgKY8ycvwtnOukHUHhZw+2KPrRf51jbJg6gn+v1dBAPpMSVWCTN
         XbpNPv4b7Ha2bhyoUAIKapEaPq5k60ekXENCmlvfh2m4GbJ0uF2jYN42sd4sSi4BEasR
         pxDgggCSupX1jCJ/cGBONG34woW0RUdpf/E5h38f43VXFFuVxIu7CBMsTBU47Qz/YF1k
         E0j4Ei6vqf3P5KXzWbFB10oR6vp8Am955kSDgqf8Uj+kppr4X8hL3eTcKvSzjd1wpnhw
         vA2hBCbLmtD10SE/7E5h7s3uQrY1p+PPO5Dz6LiHdOGcvbeu6ClO95m/Jpn/tFnLgAzl
         lJKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779114735; x=1779719535;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a7v5fmjNDe5pdh+mZp306lvLb186vTmBdoWrk3fqYYs=;
        b=ic0V1guKev1MkITGJNI2z5X5WgRfUrQbEPAtGlhClsWEnpgpR9je1mXMRp04Tp++g9
         pPruIqPoOf3RpNetsNxWi2/f6U2ALqLw96MQcL8RDZceM+IuTyZtXltJg3zg43w0j2DH
         5A7QmAXorapXsCJ3CERTyQKK5KugJR7QvD/0dH40xXOaHW/uPQIcBp01PoFyuaWFOpgS
         qY4L6XPA7jNUnUslm9C7HhhGyttpsptXyL/6oJgmmTD64I197P7Hl1fDJBRfMiWsLToj
         V7/xx2bi8gTyqXvNbDoLrBBb0cY/+BWH86a6ZUlznzJ0RaS/6c/QlIMFsINNUX+q9Tp4
         TVaQ==
X-Gm-Message-State: AOJu0YxCcnrahCGn74KAJxyoFRxhsHPD48chmTRGbeoG4uZ89TIi0dMO
	16n2KHqOs6gwidVOp0aKf5RVbUAC48CKpm34wRUO+qMG7Y0H83jDvTCTO9kIdA==
X-Gm-Gg: Acq92OHNMo932KmzQMjFJ7aMR7BSvJY5vcUtn1EzIuLqIGPnuIpCYC/iSNeYeIZgEM0
	3ow28QcOgPmbJR8BVmhkWhKmCKtl2wr5fm8gSg+ucBvIPOgfnxz4HF/+lUzR3UAy0SYrgZqmKKr
	Kw1fr+VpqJZcjdxi912Qj+z5PvmbirgIWx1CuRTG3ZV0iQ3Xb5SAunR8KZoyn1VZaxqbEFyViLw
	/QYyVuDCXFxaPMCvPZVZKGrJD4TjE1S606q929NPIFzp3AlzobAOcXljuICq/2F1iqoHmixXizC
	OraKs/icTkuoQtVCh6wrSD4T3LJ54AdlA2x0vPRuSmx4cqViGMy+FYKDMf2dbyCCDkaPcSymO+G
	zxLHBoZRWjpE+Z/An36SYZBDz0Tv11NjygkmQSfQH9HQhXMbkvcNm5tsT6LI8I8QrgCK56RiX7Q
	Zlx6/0d6wgXPtYM4ltQ8ETGhXzupHeIn3wfl+BK+4P220tR04OAZ7Zu66lNhJ2n0T5CiHAeRBTk
	Q==
X-Received: by 2002:a05:7301:2c8a:b0:2f2:32bc:787d with SMTP id 5a478bee46e88-30398637044mr6248342eec.23.1779114734743;
        Mon, 18 May 2026 07:32:14 -0700 (PDT)
Received: from [192.168.1.18] (177-4-162-74.user3p.v-tal.net.br. [177.4.162.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302973bc9d4sm13570988eec.23.2026.05.18.07.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 07:32:14 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Mon, 18 May 2026 11:32:05 -0300
Subject: [PATCH] ALSA: ice1724: Fix blocking open for independent surround
 PCMs
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260518-ice1724-blocking-open-v1-1-1bfa3e5aa7cf@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBBG4auUWTvQjKWxXkW6MONvHZWkJCpC6
 d2NuvwW7y1UkA2F9s1CGS8rlmKF2zSkl2OcwHaqJmmlbzvZsSmcl47DPenN4sRpRmQXvNehh2x
 loNrOGWd7/76H8e/yDFfo4zujdf0AP9pxyXkAAAA=
X-Change-ID: 20260428-ice1724-blocking-open-1b77c96e2329
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2698;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=WU/ixeeXgWodEpKM2ABkeTnuybuFAzfoH2evxyYyYHI=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFncSi9mbZ3/9+7CyZ79TBK50oqyanc2/a0xql5wo+757
 5nz5WyPdJSyMIhxMciKKbKsTlpkuafrwdX6uBUeMHNYmUCGMHBxCsBE7OoZ/srsnHR1gqtr15mn
 c8JumTFebdB+1uUssmORcMCk5WVb5k5k+KepF2b3dO78p0a3VikunShRra178tObevdTHHHuD49
 7TOACAA==
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

The independent surround playback open path rejects a substream when the
matching PDMA channel is reserved by the multi-channel PDMA0 stream. It
currently returns -EBUSY for that case, although the driver has carried a
FIXME noting that blocking mode is not handled properly.

ALSA PCM open waits and retries only when the low-level open callback
returns -EAGAIN. Returning -EBUSY therefore makes blocking opens fail
immediately, the same as nonblocking opens.

Return -EAGAIN for the temporary PDMA0 reservation conflict. The PCM core
continues to report -EBUSY for O_NONBLOCK callers, while blocking callers
sleep and retry.

Also wake the independent surround PCM wait queue when hw_free releases a
PDMA reservation. The reservation can be released by the pro PCM, while
waiters are sleeping on the independent surround PCM, so waking the current
substream PCM is not sufficient for this cross-PCM reservation.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/pci/ice1712/ice1724.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/sound/pci/ice1712/ice1724.c b/sound/pci/ice1712/ice1724.c
index 2e64f9c020e5..79d57938a1c8 100644
--- a/sound/pci/ice1712/ice1724.c
+++ b/sound/pci/ice1712/ice1724.c
@@ -730,13 +730,22 @@ static int snd_vt1724_pcm_hw_params(struct snd_pcm_substream *substream,
 static int snd_vt1724_pcm_hw_free(struct snd_pcm_substream *substream)
 {
 	struct snd_ice1712 *ice = snd_pcm_substream_chip(substream);
+	bool released = false;
 	int i;
 
-	guard(mutex)(&ice->open_mutex);
-	/* unmark surround channels */
-	for (i = 0; i < 3; i++)
-		if (ice->pcm_reserved[i] == substream)
+	scoped_guard(mutex, &ice->open_mutex) {
+		/* unmark surround channels */
+		for (i = 0; i < 3; i++) {
+			if (ice->pcm_reserved[i] != substream)
+				continue;
 			ice->pcm_reserved[i] = NULL;
+			released = true;
+		}
+	}
+
+	if (released && ice->pcm_ds)
+		wake_up(&ice->pcm_ds->open_wait);
+
 	return 0;
 }
 
@@ -1364,7 +1373,7 @@ static int snd_vt1724_playback_indep_open(struct snd_pcm_substream *substream)
 	scoped_guard(mutex, &ice->open_mutex) {
 		/* already used by PDMA0? */
 		if (ice->pcm_reserved[substream->number])
-			return -EBUSY; /* FIXME: should handle blocking mode properly */
+			return -EAGAIN;
 	}
 	runtime->private_data = (void *)&vt1724_playback_dma_regs[substream->number];
 	ice->playback_con_substream_ds[substream->number] = substream;

---
base-commit: 910e9f1bc3bc96e6d067c405ba30d69c4feff46e
change-id: 20260428-ice1724-blocking-open-1b77c96e2329

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

