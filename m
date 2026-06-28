Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6303A48C2
	for <linux-sound@vger.kernel.org>; Sun, 28 Jun 2026 11:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782646990; cv=none; b=rP40q8oJpUut09WP3psJQO9uW61bJvfP2tu3Jdb/hQ4y9i5bV3jh23kZu26ChRtTuDqI1ZF8rVLdc26Jj87LKxfX/GdsqrLHIssZOpE++7sJ46d5wadyiq8X0++V679d0PM/72vOItsOsi5cnAfGMJHtMEnc412YSo9af8yz4rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782646990; c=relaxed/simple;
	bh=GiSsKExbKqxd7eWz0dslj1vSQHyylK6xqmdzWWMlFIw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HvjJR4tSJzfYEmWaUYa5/YmyyQWGMbYjmG1nVsOe7ix5cSVIAc0ZD4sqbGR7KPjzX5iLtZ8Bmq5wlhSSqIIV68i1RA6ZOMct2DaiJx0D+HUtcZ9tdcCThTYzWL1GGtlp8HeBNTUNZ7Bc/19lKUwdPlyEPp/JPsSqiXV4IjMgPXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tFT/tw0w; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tFT/tw0w"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3078e0dcd67so4139479eec.0
        for <linux-sound@vger.kernel.org>; Sun, 28 Jun 2026 04:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782646989; x=1783251789; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WA10xwBE0JDkkE7byDijzRVTDLYQ5oi64bJJmTshQIA=;
        b=tFT/tw0wReJ5LmhfUU1xdiVeGfshWwn/tn59j4bwCg4HZzyVFdlEvJ4DU4Tk6rnbWc
         bGBwp4lnduOJ4J2KreitDEzeHqPW3Cakq/R5bQIv2Mn3UP7gkVElY3VTcJCNtOjMIR3a
         bNe1Oj3seRbaB4vg7QPJ38Sv2WIP0uuKdiVrskQW8pAu0lGnLeh5K7SZcTjIdkMjO6UC
         yKNfmtvqSyh7n9rC9R9ZtKSY4Y6UpnArh8cgd0P4QDZKMqxvLuQyNnGgmYhVa3iNjkHu
         p2yz5oRm9qvvaeH5GHx2l/OJ8If0ng9QiblIL/4y6OxfCBTxDbGjnfu8oxO2QClTmvg3
         oGAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782646989; x=1783251789;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WA10xwBE0JDkkE7byDijzRVTDLYQ5oi64bJJmTshQIA=;
        b=dIePpSBxOfvvZ96D7BYQWWhvFl6SlHn6q2JVzqb/IgJDQprBlDLPTafsCqI4JsNDjY
         fOlJdk7E0zDvSlgFfl91RMToJBIXfNU0Scr5DBPZTn8YjFJuEDO82z10MNkO+uFh7P4Q
         SM7OaYCkSnf1t888F6FHmGuhRuYVQlNSrN6aWHk3nrpmb9erY74RcFp/sYcijdHClw+w
         UifE9xNcKRgLmVozM+QeUcwpOPSukUIKTg7P2qjvnlkMX6Y3u1wwdJvoZqGPKRHQWigj
         IZzLfNar7OGOf3jZzYm+tDHory1EdKul0Sm2UxfPVomwGZX7anrAVAyk2pvFsTOionnl
         bE6Q==
X-Forwarded-Encrypted: i=1; AHgh+Rqg2BNZjbWbSmcmwr7SdYK0wHBI8xui696ft0JQFW7mxyoLnA/SOqjFuOLiX+E/unkG5y6t0IAWYsmbyg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDCyUWc1HuiIarChThgUkWW9f8n4rs2Ymhryy+NNLyvBrKGnPQ
	R9VncLuVjOjTvYc4eN5tVWud+qE6N+n5zFvuZXJ0+8jR5IpoI1KOIjTG
X-Gm-Gg: AfdE7ckeR4aZKcXCRZrIy+RjjG1IHR+kP5i13shXPPIoqvtwjLD4cfiJx4ymM2LnIUl
	s+jdvXrQ5ClGNNdhXFf8EFmn4FNK4Uqjm4ovSwM4/lWBFlve7S4T2cdjnqMnNNZUrabtpZcI+xr
	G+SRTzp9cJiSAdC2WIQx+RcxMC/n+GzmOdaaXw5mTcRKUzu/QKufaXsw1AodUS+zVlwLvN8YaBm
	G4kIe350+NSFqamYsu/WPZnLe/YZNOLWm/+EbPGXcoy1mKIK0zjivJsWp1pRMpNPNMoh/SDy4NV
	deoRmbSxewpGhSYDhn8DeJEn2Yoi1YzLmKymD8TeCG4B2OhxzKA8IsO+7QmZDg4mHNonXnYx3TP
	olXGAOyZ33lDvf9anNjmeQN/td4fiPIU5LOHp5+gFY2h5PPawXbvi2fto2eqfQDyk6t069JDBMN
	owNh+8pjPPlzyPn2/yEq2j9CrDFaDe6APSeFqZbDHuyUnV0WrS5r3/6vYSaMx4mBZdiOJyrF9zS
	QS6Q7tF8d//YK9rXyZCOeKM6fJ6u1tkC4cOGZY7z1s7B8g0pV2jyMeGX4SNeWFvNQ==
X-Received: by 2002:a05:7300:4312:b0:304:df8b:71ee with SMTP id 5a478bee46e88-30c84b1dbbcmr12292872eec.7.1782646988746;
        Sun, 28 Jun 2026 04:43:08 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c8b1a80sm34520756eec.18.2026.06.28.04.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 04:43:08 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 28 Jun 2026 21:42:01 +1000
Subject: [PATCH v2 3/7] ASoC: apple: mca: Factor out mca_be_get_fe
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260628-apple-audio-redux-v2-3-6328269c9652@gmail.com>
References: <20260628-apple-audio-redux-v2-0-6328269c9652@gmail.com>
In-Reply-To: <20260628-apple-audio-redux-v2-0-6328269c9652@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1985;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=REpmn+M8Rvg8rCc/PyDy1GQ+HmZDWk2NZCuZF0g/gWU=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmOHLu3iM1S3lZr7xHo42+pUz716bXMPUuecYs08d9mm
 DFFZuPfjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFS/nMXw34/1OM+S6kXzI44nrH1wzS5Wv3+NVF9WSFMEAzcnU8aBBwz/s+P/pJb
 t/Rv30+DV9sWT51f8CH34Mu7wXz7D+AcusSdTGQE=
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
2.54.0

