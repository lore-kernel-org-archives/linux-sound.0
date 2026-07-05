Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED5E29346F
	for <linux-sound@vger.kernel.org>; Sun,  5 Jul 2026 03:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783222728; cv=none; b=N56Djw0wMFaRtd7y6+ozXjzUAZF27Nj/Tcv7ztkbl5bqVyW+NEo/X84fr7OMkuWtjBnuDqixeFV3jJNfGq6X6CYoe+VLzXuMBYWvRrMn71mDKf9sNLcUuD+rwPU9waBw312VtYzxLqkUsEedG2TZny2YigutB29kVXXwiWBbakM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783222728; c=relaxed/simple;
	bh=oCymehX4PYoCnxdkU22aCLFEn0ryk08gKWiIdQAT5K8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fO5tQSBwJMtu+7T5RiFOrAe7LBY1/ktt/sPzMTGo3y/vchJnaYLPTdpEZeTz45BEIWKJCUOFllv9dLeQStdodHHEHtuiKT5hwfJGSpS/tC+QT2pBF1QsFb4e18Z1bQ0HLgT4Z2rMnHNL4c423/kmrQVkd8a3Byduc9ujsVslnXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hDwRV/g+; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hDwRV/g+"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2c7c61b5292so25975925ad.0
        for <linux-sound@vger.kernel.org>; Sat, 04 Jul 2026 20:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783222725; x=1783827525; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zgoA2zxMWc/wzwhxSoF0G4i3461m5fE4PLusQm9o18c=;
        b=hDwRV/g+k7YctugCepyiTkzWmokLpn6zJA4yvBUJ8jaFb1lUodihnCgWr5BqxoF93X
         knsRrAvxbE2r5y0I4+UY7l5MbHCM6XJqzmjv06c86Pq3XEP2PlsVQXuWQ/SP3DDTqFl8
         TnGjF7Gb1dn8lyz1qVR2wzBXNc/gFogSR1YZnuzJhc38auhOAHLJbX/KCRsYzJ/jYqyM
         T0pTZQkuAW+/bPHxVpwQly0wyOJvc+zvFdKWGf+VFX8cdVaw7swZN7hNpx6XFLM7coTT
         zINzAkpi9PrYCvAk1NH5Ccv9l0E84dbGRr2KkONv5whDjEwTgCiSjlayRgWAN+zHjYCG
         TG8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783222725; x=1783827525;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zgoA2zxMWc/wzwhxSoF0G4i3461m5fE4PLusQm9o18c=;
        b=RnS7FB4XQKPe3sgafsMIpWr64klYMw6H7sRFj/xtk4qXUa3R0ECg1zXhgdfxj3m97C
         6pcS78ictI7wcPycvHvdCJ5GTaySpJNRdqRdj5aX2Tg47N28sYSNwDUsLRqd5gaTsvFG
         CPnpxgLckVFY7WZQNaCMgr0J+0V4OXY3qF6nNZRfdMxqbP7tR3P1qimZ+0XBq6+zgLw4
         nx9g/+N6ArfXg5aswdGPH7IRNAdWSer5QF8/NDMHmlQoi6k7u15goZI9iPrRhPzIBNDL
         v2OC/WlmxmtgmxgQjxItcVghbOxVvtrKXk2rEVjew48o31v4UiWVGeXuB6O2ImuEmCVt
         T3/g==
X-Forwarded-Encrypted: i=1; AHgh+RpFggExZh6Mn/FlcoNsMeZohc9b03TGDHhR8njGa5d6cqelCw8RycJ79MbWv5WwCI+atbiKiLxXY8jAoA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywzm4hyTYxaiHdRLG3I9PTyEQ4uq7K35jDkXepX1inG55UaHa85
	kGmhyEw0+2T26eCgJ/dBUlmuuLZpfQ9ByQYKuZx9+QUzJDcHA4EHqwY0uauWYw==
X-Gm-Gg: AfdE7cm4IXXfoOF6JN8STHeqBOJJmbop0DZogKS3SyZ1TKOFhCuS1e6UxGp+lwoAsky
	H0Y1KUZ0rJZcBlWI0I+mPhZCtrjjYp8F0Yc78UXtQlONNEsyBieLCcy0q96sNCNgd+6Kef5dKCp
	JCqSvmGSIpi0h+XOyVvhQsXIH+Nm+cU65pzKtCIkY4RzmZZH/RXuVvKA0G9rzASvAq8NkdniA73
	ELoSQPnWdb624n3qagPh3ABRLlZWpizQqw5Eh2oO1z3jBt2bS1bkJ/+mTWpkqxnHnrDHTnA1XMr
	mLFCCuPhRQRLxTWu1D5ZWW14gz6xmsLU4RR7jVGzzKmOyLUPXRbWlzim+m0oFFaASDVzeTQzAxu
	i+HbZZY63NQIl0CK0uhHdo1cfWugUK0sk+Ux7e00yyJyhHMWYCT5EAcZZ5wFSjga8AKzsZDGbXi
	9rKO+TxMNw59wd+1c9oAD/n3WAu7sEO9U88vvrscsLjtAI1NJ2VLoCXWaSI1XKu4FZHxRB2Yt8q
	yxggbn8FSG88dAAEhsULsIQRjB3t2YdPbuNWdvaKqRVcGaUYuES67iMUQXH6Jq5
X-Received: by 2002:a17:902:c40f:b0:2c9:b2c1:13ec with SMTP id d9443c01a7336-2cbb1e32638mr59387335ad.11.1783222725413;
        Sat, 04 Jul 2026 20:38:45 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b41c364d5sm35463845c88.14.2026.07.04.20.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 20:38:45 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 05 Jul 2026 13:37:52 +1000
Subject: [PATCH v3 3/7] ASoC: apple: mca: Factor out mca_be_get_fe
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260705-apple-audio-redux-v3-3-ff7a7afe2b6b@gmail.com>
References: <20260705-apple-audio-redux-v3-0-ff7a7afe2b6b@gmail.com>
In-Reply-To: <20260705-apple-audio-redux-v3-0-ff7a7afe2b6b@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1985;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=J1CccrHUSdWoBn2gfykZB3L0vQDV93VPqcrkOqBmUGc=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmeF7eUP+AuZF1d+77tRYqd1P5rq+Yf+fef2+R205EdA
 Zk1Dp31HRNZGMS4GCzFFFk2NAl5zDZiu9kvUrkXZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKle6MHIMP/bSuHpPlr3Tz7uSO77bffhxVf1n/efCex3v/ggWu/RPgdGhlcTZ+z
 Wir4f5cmcmfpss+6LI4U8/lvTUsw2zuq+Hfr2HTcA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Martin Povišer <povik+lin@cutebit.org>

This is a function that we also want to use from within mca_be_shutdown,
so factor it out.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/apple/mca.c | 31 ++++++++++++++-----------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index feaf60a4912f..730ffe0805e1 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -721,30 +721,35 @@ static bool mca_be_clk_started(struct mca_cluster *cl)
 	return false;
 }
 
-static int mca_be_startup(struct snd_pcm_substream *substream,
-			  struct snd_soc_dai *dai)
+static struct snd_soc_pcm_runtime *mca_be_get_fe(struct snd_soc_pcm_runtime *be,
+						 int stream)
 {
-	struct snd_soc_pcm_runtime *be = snd_soc_substream_to_rtd(substream);
-	struct snd_soc_pcm_runtime *fe;
-	struct mca_cluster *cl = mca_dai_to_cluster(dai);
-	struct mca_cluster *fe_cl;
-	struct mca_data *mca = cl->host;
+	struct snd_soc_pcm_runtime *fe = NULL;
 	struct snd_soc_dpcm *dpcm;
 
-	fe = NULL;
-
-	for_each_dpcm_fe(be, substream->stream, dpcm) {
+	for_each_dpcm_fe(be, stream, dpcm) {
 		if (fe && dpcm->fe != fe) {
-			dev_err(mca->dev, "many FE per one BE unsupported\n");
-			return -EINVAL;
+			dev_err(be->dev, "many FE per one BE unsupported\n");
+			return NULL;
 		}
 
 		fe = dpcm->fe;
 	}
 
+	return fe;
+}
+
+static int mca_be_startup(struct snd_pcm_substream *substream,
+			  struct snd_soc_dai *dai)
+{
+	struct snd_soc_pcm_runtime *be = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *fe = mca_be_get_fe(be, substream->stream);
+	struct mca_cluster *cl = mca_dai_to_cluster(dai);
+	struct mca_cluster *fe_cl;
+	struct mca_data *mca = cl->host;
+
 	if (!fe)
 		return -EINVAL;
-
 	fe_cl = mca_dai_to_cluster(snd_soc_rtd_to_cpu(fe, 0));
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {

-- 
2.55.0

