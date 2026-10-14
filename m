Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE99C563FDC
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 19:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792006615; cv=none; b=GPsvbPOMG4e5t/u3FjELnb47J4LH8T0uyzejMXkwf6XxOfe7IVwfXxdZaNAJLyjG429VcdmE78kDxRiJye1rlrp54+mIHhV0sr4z/3XVF3biq+ydr3Jyg+XSZuqYsT8ltnRgRsk1NQ602b8/Vwy7e+7aBpLb4gPBlVXRhKmeeaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792006615; c=relaxed/simple;
	bh=USkmMPn2m09Xmxz+sO494+k/+nUWOFpUeajtnBtALvE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YHCgAIhKxkdPp3Ea60FME/5KpP6daIDSDyXPEvDxEYTC2zGJ7tJmQVnBnZ5a4uHKB31kYelSXZbGur8wNkiGVwT/zmIGKI3/qT4FjZqmHC3/NEhpvhD3qIU69vTMUjtCC95vMSZj+M1ahKzT92PqKHGP8vHPQQI80KiafFu7/90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=BWywT8FZ; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="BWywT8FZ"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-35d7fa491deso993526eec.1
        for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 12:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1792006611; x=1792611411; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mXryqq8En0eicKl9AiPDfP6M0h2TRJ9mlYrQGAexp7U=;
        b=BWywT8FZesJEgXYXsd6YTzsS5DeysiKSlyRtxbT8vkjrhhYGZvH6rqUynx2nJO+J7c
         8X30uTdvUS2Vaj+i7JW78f+KUkYfG2Xpb9IsqBdhyb+8SIrmgSAfcCSCMc6JJuhon1z/
         sqAnFl61jhQpNf8g3odlMb4JsGjRkfzzl5mKaC8+SPskOVt9BGjJcquHmUAoL2PrjrkD
         QS7XmQKD7WEgPNNOcvvyaPzMd7OhA8BT5vJTF0qd+4dWuHNP1+kFSI55Y8M9lgZyssZE
         iRLe8eP8wM2ERFQjYMROc7FvOZNj8yZ7DnlisN6ysiaKBMjRpOUH0QQHZuS2QU7LW2yt
         HX3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792006611; x=1792611411;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mXryqq8En0eicKl9AiPDfP6M0h2TRJ9mlYrQGAexp7U=;
        b=gkztBRg0QI8itBxUQZrUAE7bzA4U2S6IA0A9PwhWHcffybNP3qHk4GTLzNUz+T9+wW
         QK7aIMQfonbJGccbCP60jAC0UImelqKE0BnGppSA4yDf8Z2TKBSriuStBqRKrDD5fOJp
         vompOFxTrXD/y7JHPuMqZayY5Iy1ZmavE/P6VSxGv/T+JBYTNfNXrODAJoMFKKaZd8+N
         3WbPWrhiBzznvTyQaolznf7I+LZw7/VrTwZ0QnK9yeO8v/Z1ZZ+R1dGidJ9At0WorN61
         WbYMI/80zEUWHrWecWp8sYwCzVaxiwLRMxwy+T5PC2BlpAVD8XIyLSKHlOtK8GrPvh9f
         3Wmg==
X-Forwarded-Encrypted: i=1; AKwUvBxqUGe/cXOxTI+3qJnbwRc9zMG2XHgBs2q8Z0EXwt0x9wf3wuVQathrF1DNbrtSDzp05myA2EGBoGiZfQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJwER9M6Et9pU7fD1x7hby6wUNZeRYUOh6hqpGAyv6YPwCvwk+7
	3xXEbgFwXyislTfVwpcJ/WthpvlVlK/t0RFmn+nVEnGKCM9iZ8j++SuKqQW+dx10428=
X-Gm-Gg: AYBFou0iK8KyjtykM00uJjk0tluivXoFRnwHyu8hn1yBuR6inGJHg9VWyzbCYa4spjf
	ADqwS6LhC3h8PIv1JIoZjTD7Ssv8lXgDUldnU+CwADsnpueDu+ieJpfC8epus74y+4EjZGkhtgA
	GROaX7KajSlCSEbYLfMHzm34HPXJDucm0PRxP5pKmHuvMVtDBMRV4anbfqPMu91dW+mUnYWQVW8
	NgmP6GBf1TKSCz1ryLWnKdbnjUEcNQI9qadmIGPXs2rh01RbUQRe1/y8nGb5k33FmgPgPDWqHUk
	Ldy+Y1tXkQBic20Y0wpnEp6OOB+PZ93cakAoGuU/r4Gz0opI856chlh5wgefCu7qmfuuJoLplq9
	xRMhtIrMsAl1UFWbvF13/i15o0aTc1Poj3vbqNivaP/vcH6J4oXEn4nHFGsh4Rt19ELQSY+MCFT
	otPRhrwGxyprziVCDUNgtTotm4yMpzGP//UGGstqUH9CFPETj0E8BhkA+0r56TPVVfDMOlik80R
	8ixtTvsAL8srTQLaHNzKExPem77KMv11KovDFxbTHo6FZRXTS+GlCqkDy6fB8mEEwPybgg=
X-Received: by 2002:a05:7300:c87:b0:33e:61ab:8309 with SMTP id 5a478bee46e88-3537b291a93mr31801619eec.23.1792006610878;
        Wed, 14 Oct 2026 12:36:50 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:39d1:d8de:aae7:23dd])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca1b53dsm50852306eec.6.2026.10.14.12.36.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 Oct 2026 12:36:49 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: broonie@kernel.org,
	haoxiang_li2024@163.com,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Subject: [PATCH 6.6.y] ASoC: hdac_hda: Fix hlink refcount leak on component registration failure
Date: Wed, 14 Oct 2026 15:36:47 -0400
Message-ID: <20261014193647.25131-1-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Haoxiang Li <haoxiang_li2024@163.com>

[ Upstream commit 6ad4892c4f5cb437a928a02f5b7d37d496aa9268 ]

hdac_hda_dev_probe() gets the HDA link with snd_hdac_ext_bus_link_get()
before registering the ASoC component. If component registration fails,
the function returns without dropping the link reference.

Always call snd_hdac_ext_bus_link_put() after the registration attempt so
the reference taken during probe is balanced on both success and failure.

Fixes: 6bae5ea94989 ("ASoC: hdac_hda: add asoc extension for legacy HDA codec drivers")
Cc: stable@vger.kernel.org
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
Link: https://patch.msgid.link/20260622145645.1184986-1-haoxiang_li2024@163.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Assisted-by: LLM
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
Hi,

Please consider this backport of the fix for CVE-2026-89944 to 6.6.y.

The code changes are identical to upstream.

The complete fix is already present in 6.12.y, 6.18.y and 7.2.y.

Build-tested only as part of a cumulative 6.6.y series: x86_64 objects
(allmodconfig, CONFIG_WERROR=y); no runtime testing.

Thanks,
Artem Dinaburg

 sound/soc/codecs/hdac_hda.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/codecs/hdac_hda.c b/sound/soc/codecs/hdac_hda.c
index d59d38ce5657be698625fb20235decf6f848e712..c497354251cb2bb4e908d36675166a0b5f8a2032 100644
--- a/sound/soc/codecs/hdac_hda.c
+++ b/sound/soc/codecs/hdac_hda.c
@@ -612,10 +612,8 @@ static int hdac_hda_dev_probe(struct hdac_device *hdev)
 						&hdac_hda_codec, hdac_hda_dais,
 						ARRAY_SIZE(hdac_hda_dais));
 
-	if (ret < 0) {
+	if (ret < 0)
 		dev_err(&hdev->dev, "failed to register HDA codec %d\n", ret);
-		return ret;
-	}
 
 	snd_hdac_ext_bus_link_put(hdev->bus, hlink);
 
