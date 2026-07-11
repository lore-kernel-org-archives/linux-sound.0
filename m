Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C49239E9B
	for <linux-sound@vger.kernel.org>; Sat, 11 Jul 2026 01:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783732319; cv=none; b=Rsr5XG7kVoHdVoFZaxN23QOOpZiXVad0XL4zfJWDk9BIGkq/nIiiBdPlMEijp5mKpn5rIALowr9SpnV4edjTFMrub4IIAgEsN8jdsnt9HXOyPOUGx8mQ86TB0RAbu8sc0BBb0uQaj5UUpDjViaIrbK22Aj/ZAauhuVVdu1SWjOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783732319; c=relaxed/simple;
	bh=GHpRJg9oxVD6GKahUW6+PTUDA5kAW0ptFe5dE4sEofw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tFBF5L4vfSxwxevg3bo475D3ggwz+tJZnSAPWTjX81TpLXxgSCm+jdr7R9efQlNm1xGvq9bMc1vEiHs4b99MuV4DCFaOaX5tfaDqxrawZz4KErztF1V/jP25peCClrrNMYFbiW0tlRNBlOUYzkW9UVJA+qLoZBwGvFIXoHpSxFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P2cw1H+J; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P2cw1H+J"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-84862b0d5f8so1245162b3a.3
        for <linux-sound@vger.kernel.org>; Fri, 10 Jul 2026 18:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783732318; x=1784337118; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ns9UFkQuF2E3pwYAgWuXOFZxiBt3YnXgvvVMaDlLWEk=;
        b=P2cw1H+J7ljRP/geRxrmIMaAyvWkIzwnxbOpZzHimk8N6vbw0rBCq7jbgEmj5WU4Rv
         hYtUOORZjwVFBSzoyx6QW3tOaMx13YOvb2iVH9UbvbwqajszEEDI0OecoDqIbIr6Oy3N
         FuZ0jjlZIRxW2PCL2TUnEytQjalzXJTsND5keXdyiJWdeDWsBrjcwUsSfAZdxKioFqVf
         LdLtgAlFxqG/X7YUgbV2QNuTq1iC4ZcIDvvrhEaXtkmej1BdoFOCr/ZFXZCE4yMPljW5
         VWT+soaK7nHzk52hOs+5RIcrj2iWRtQSJTIXhmIfb4kHDpN+nX1fae59b7MPUvMJvpvJ
         OSng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783732318; x=1784337118;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ns9UFkQuF2E3pwYAgWuXOFZxiBt3YnXgvvVMaDlLWEk=;
        b=F16zJcsk+/V+y1V2iEe7lX2ZanpQeUIE5xUh6WCZDxRu6fbUOXC99/TELLhNdmV6R/
         6Pf9ZQ8Bw6vENlLS5C0FRZSAPmrIgnXH29F7EzlXWIoAVHm+lXZ38gFB7q97FO1R3ODF
         9tROIFM4V9ULFjakAiScGHiAL2Qn2tMOqYPprQNDHi+1jt0bYGnRKOtSr/rSOpjejH/J
         HX4GbpxT1YkIM0pdSpmnjUJYoTMx88R979vTXXfkXv+ZpVnfwetdhXNV2+wzV2nIuGf6
         p5Oa22/HMhfkEge131cp33Qsa12GikBQ1mnVj/2IUexFlbOJNgoFd9BTXOB/4Cza99Q1
         Jhvg==
X-Forwarded-Encrypted: i=1; AHgh+Ro7g+xXip86r+HDvt3TlKlLmBKJLUH8PV9evfrnKFVB11jMR9n5AL5HUollD9hvJ+KnGGH7Vb7AkOL1Pg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzizKAwnxkQP9JU1vf3KmjrnG9emmf2sAaoVTu+upW5/z3IcKZP
	JVtzO/JR7FN1Ge/YdFraJO7a7f75tHZt5wPYRPbltduFAvodBiWYq9dW
X-Gm-Gg: AfdE7cnjHT8LV9HexwJAJzbXfCrIrPm7z2pA0kVkFUGQlRMixAH46CncHKAwaOr17B8
	pAdkEt3BciR17FraJZWLQ7RldexS+y9IVBn7lDh6pDy8fE19veXcuSFj+ZxEXGm/VzBanHRr9Ab
	/zU+t6JgN6ptblV85a9ke+7ky60iFGxls8E+JPWTka9B6M2+tWlyc/AIZuwHo+WrrSV3nyvZWSK
	i0hyx4pm5gYXM+XycyJyis7Y6011dP+zHtCsIj7LHNtRDNDcXxL72tyIol5R2g1fHRHZZXLFJ8C
	eH4sAWTO8tQhAEzdPKtVsEpJnZuCIJB7q0IXYw9lM7OlurON5gV824Vvpm0HLcQUP9RWR8sjBKU
	Z2Lr32r0x54gOFppx+cJdkmwPfcXT3fkeGrFItNLuB6pCs85l6UZKcBgQyhMh+pQwp+cc5fxeyA
	80Fs922epXlK20V6CuBtQQR7aS+7U6hgmX0t8o6KLKUApi1O9/TAuaRqKLLEIEawpWqfEJuhofb
	TxGLT/9tAagAmmNW5f5qTI5VSDIbhn+1QkWlFTleZCUYxpkHz41cR4dQYIs5OrZNQ==
X-Received: by 2002:a05:6a00:448a:b0:848:2f74:1d5e with SMTP id d2e1a72fcca58-8488972ebb9mr1061334b3a.68.1783732318176;
        Fri, 10 Jul 2026 18:11:58 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-848530c5a12sm3751929b3a.5.2026.07.10.18.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 18:11:57 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 11 Jul 2026 11:11:21 +1000
Subject: [PATCH v4 3/7] ASoC: apple: mca: Factor out mca_be_get_fe
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260711-apple-audio-redux-v4-3-2994d87c2f24@gmail.com>
References: <20260711-apple-audio-redux-v4-0-2994d87c2f24@gmail.com>
In-Reply-To: <20260711-apple-audio-redux-v4-0-2994d87c2f24@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1985;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=gZo+qAecjsjEu2IDUW/qEj1Tcf3OnB55qMCIoJb2Flk=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmBM7yVJ9Zo2iWUT+6+N/80++qjtZbxSdZshU57U+umq
 akEtgV2TGRhEONisBRTZNnQJOQx24jtZr9I5V6YOaxMIEOkRRoYgICFgS83Ma/USMdIz1TbUM/Q
 SMdYx4iBi1MApvpQJiPDhsXiuzZGKS176hOaczYz4oVlp/b8vSsSXxdscaw6EOM0i5Hh0PeNawI
 Wn5bt1+eX2SQUXLPMaFHy162KuY/7bTJnbX7CCAA=
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
index 55cdb4e0f0b4..1e9a5c9cfc54 100644
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

