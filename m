Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6EE92D6E44
	for <linux-sound@vger.kernel.org>; Sun,  5 Jul 2026 03:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783222739; cv=none; b=iUlisKf6CG1cBjnVpoGzbRxGJPi5RxkQYEzmG2EF10XCj/QkQRu6OOeh8lT5XqcVYE/8mkBgArtROTdN3UvZeiVRai3eQyW3Vq5gYyqbM4t+2qrRx9nt+4KTIPZr90ONTnzyGKPpsZ0IbdABEv2Y1UnB/bRU2pJyj/2qkvN5rN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783222739; c=relaxed/simple;
	bh=u3feU+XxbkxG//8hCT8B0WoV0SQtpDUBimXlIjrgWBA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YFk4l8Q1yZ4NreqK1iDc4AWF9AXHrPfPHvyQzNF559QKa1pOjT9J1ZUWz5TO5uYse/V4uCYDp1C1b9g4hvcX1VxjqIWw85LnMCiPIo0lk7yLHu4HGhjrr74tyHjuW1rPVaXRlx3ynjxcQ1jQdB5fenE/Qaok754XYZihDsBbLEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=akLbzkaY; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="akLbzkaY"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-84780c95e2eso1337424b3a.3
        for <linux-sound@vger.kernel.org>; Sat, 04 Jul 2026 20:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783222737; x=1783827537; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mN+pJBIMoW7rE9Ren2+zTaJ8YB+31uYcQku98tORliE=;
        b=akLbzkaYMl0amaJ17KtRs8XpQ/L+tkmn9UNDsFl2nNmMDTEbj6Spunr4ul2k0fytdQ
         p0D8O2vydSGrxqElbC4P5iwmoebs+xDYDV7Jt88LR64GovYvkCacYJe8Ikyr4LSB37Nl
         CqPq4v67FJhj2U8FiGQviwrcr2QArZhc7t5nmOx1SuXAbwCOcZUS+BvfUuLwTnHBTDVT
         JNmN1W0lEtlq3D/zyaUxD6uN1TIf6ORzvEPhnYZwwnQ9ID6zLhV5m6wsH9TrIKLAgck8
         QoW2jJvyAmuBHrdnm5ns6+Na7R7OkQmAquAs4KCN1UGnOTkdcgpifRC9elF/cSQ5zDpT
         VPeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783222737; x=1783827537;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mN+pJBIMoW7rE9Ren2+zTaJ8YB+31uYcQku98tORliE=;
        b=Ym0Gr1mhwHppY4XvqjAFjS9ftotvTj0srLoAjZLgxAGoVYoYzI1nukypLYlsnrrM1m
         FuHE9lq4fMcKTjZ2i2renb+NzZvivQhfLkC0+0/PkvMk/74IE4JDOeiXUe0g/rjvLH39
         MGXZU1hLYEkMQ5Icq28smmrWEWtEFxVisBshaen4MKHm/8RJYureFWDcqE9WRlbRozIE
         A4cz7pmoyNB4ziX2ZDEAA/aIehsvQ9ccoo6zg/QFyTIBqa8Pd08/s6N5l8ozMQXt0z/B
         9o5OgNMcTSUrTjB+U9LcAo1/wl77e3nSjMXqYFMaEW8TzyHYvqkzkwtewruSnveH2MjX
         wRyA==
X-Forwarded-Encrypted: i=1; AFNElJ9biPyGfwM+bPcBFxbpQGAvJwUEoT56srnMGYAKgH6VaBkdBBPDr6/hF6yARiPpmduVurwZu7Ca66Xaew==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjmqpZgD/vs5uGZ6cL5628t/JI7vKE6TvQsf+jarxhgrtN232f
	9P1AKYyBCUEwUAxu0Co5I51eN/+k9DPKfXFZ7RiMV2a7++v3LqVqnHgt
X-Gm-Gg: AfdE7cm66n3hO3nHy8fciIhbnwoqpTSb1DwETtzRQRc6dJ+nhBmno1HKs4mOILCY3jO
	r7LDYoFVKPapGh4yzrwSQZ4xI/Iuc0IJZ/fw5pw95g5zHLX9gz1M8Jk8kGgdev9m4X/NH23gBx7
	C3f5QAQvWItT7KE60J2bWZvyY0Lhu6Y1890Rwwo5eu5nJnwMpm9ib64u/Clcui+EC6FWQrVu3RR
	yh81oX7IhQ0ENOeEsAVhl3OFj0R2xiZBUH1oUap4dylHOH0wE4YGI+b+IfFVDHhF1fiIr6VZb+F
	OpaPDazBFOX0YZU6RFkz3vbMh9ukjokRc8Fik1sPjAr+Rl0XS3lLAlsZtqbNcawOP8f+dwYPk/X
	Xe+Bo0b+5FIAr82whjTsV2gD2/24kIcm3qrcNSQqNpVLcTN42IADyg3FDFklXnQuxxwYXIlMCQq
	N5OfF45qIjTV5Xz/8flJrReMmv83kq2uxBa6lDvxzrI8hmq0tuUzpl7W4mtBvxl9wE8GELLxAaW
	4Or611lEdDYDxHd/ZdBlKSffHNy2W0XM8ms1IWXPZqM83bff/ecHM+yQxjvQM/h
X-Received: by 2002:a05:6a21:e58d:b0:39b:dea7:5626 with SMTP id adf61e73a8af0-3c03e4aa5c8mr5520256637.35.1783222737181;
        Sat, 04 Jul 2026 20:38:57 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b41c364d5sm35463845c88.14.2026.07.04.20.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 20:38:56 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 05 Jul 2026 13:37:55 +1000
Subject: [PATCH v3 6/7] ASoC: apple: mca: Do not mark clocks in use for
 non-providers
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-apple-audio-redux-v3-6-ff7a7afe2b6b@gmail.com>
References: <20260705-apple-audio-redux-v3-0-ff7a7afe2b6b@gmail.com>
In-Reply-To: <20260705-apple-audio-redux-v3-0-ff7a7afe2b6b@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Hector Martin <marcan@marcan.st>, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3278;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=oPUxYsS4dAnn3g0MJvrYuVUHiPTpgN/zgb3R1tQjvLc=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmeF7eaF73WU3vsxbJ5q/Z6pSdF7sxMpWlpFb82+/87t
 ZOzintSx0QWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXSMdYwYuDgFYKo1DRj+Z53We/RA6fCMyMUOGRzf12QUS09dkJYn4XRvYeNhh7reSwx/hfPe+M3
 vPpa85d6ULzym7yal786u3pFSq5TH/VpQcTsLKwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Hector Martin <marcan@marcan.st>

On the speakers PCM, this sequence:

1. Open playback
2. Open sense
3. Close playback
4. Close sense

would result in the sense FE being marked as clocks in use at (2), since
there is a clock provider (playback FE). Then at (4) this would WARN since
there is no driver any more when closing the in use clocks.

If (1) and (2) are reversed this does not happen, since the sense PCM is
not marked as using the clocks when there is no provider yet. So, check
explicitly whether the substream FE is a clock provider in be_prepare,
and skip everything if it isn't.

Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/apple/mca.c | 67 ++++++++++++++-----------
 1 file changed, 37 insertions(+), 30 deletions(-)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index d8973e5611dd..322dd8771111 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -346,36 +346,6 @@ static bool mca_fe_clocks_in_use(struct mca_cluster *cl)
 	return false;
 }
 
-static int mca_be_prepare(struct snd_pcm_substream *substream,
-			  struct snd_soc_dai *dai)
-{
-	struct mca_cluster *cl = mca_dai_to_cluster(dai);
-	struct mca_data *mca = cl->host;
-	struct mca_cluster *fe_cl;
-	int ret;
-
-	if (cl->port_clk_driver < 0)
-		return 0;
-
-	fe_cl = &mca->clusters[cl->port_clk_driver];
-
-	/*
-	 * Typically the CODECs we are paired with will require clocks
-	 * to be present at time of unmute with the 'mute_stream' op
-	 * or at time of DAPM widget power-up. We need to enable clocks
-	 * here at the latest (frontend prepare would be too late).
-	 */
-	if (!mca_fe_clocks_in_use(fe_cl)) {
-		ret = mca_fe_enable_clocks(fe_cl);
-		if (ret < 0)
-			return ret;
-	}
-
-	cl->clocks_in_use[substream->stream] = true;
-
-	return 0;
-}
-
 static int mca_be_hw_free(struct snd_pcm_substream *substream,
 			  struct snd_soc_dai *dai)
 {
@@ -805,6 +775,43 @@ static struct snd_soc_pcm_runtime *mca_be_get_fe(struct snd_soc_pcm_runtime *be,
 	return fe;
 }
 
+static int mca_be_prepare(struct snd_pcm_substream *substream,
+			  struct snd_soc_dai *dai)
+{
+	struct snd_soc_pcm_runtime *be = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *fe = mca_be_get_fe(be, substream->stream);
+	struct mca_cluster *cl = mca_dai_to_cluster(dai);
+	struct mca_data *mca = cl->host;
+	struct mca_cluster *fe_cl, *fe_clk_cl;
+	int ret;
+
+	fe_cl = mca_dai_to_cluster(snd_soc_rtd_to_cpu(fe, 0));
+
+	if (!fe_cl->clk_provider)
+		return 0;
+
+	if (cl->port_clk_driver < 0)
+		return 0;
+
+	fe_clk_cl = &mca->clusters[cl->port_clk_driver];
+
+	/*
+	 * Typically the CODECs we are paired with will require clocks
+	 * to be present at time of unmute with the 'mute_stream' op
+	 * or at time of DAPM widget power-up. We need to enable clocks
+	 * here at the latest (frontend prepare would be too late).
+	 */
+	if (!mca_fe_clocks_in_use(fe_clk_cl)) {
+		ret = mca_fe_enable_clocks(fe_clk_cl);
+		if (ret < 0)
+			return ret;
+	}
+
+	cl->clocks_in_use[substream->stream] = true;
+
+	return 0;
+}
+
 static int mca_be_startup(struct snd_pcm_substream *substream,
 			  struct snd_soc_dai *dai)
 {

-- 
2.55.0

