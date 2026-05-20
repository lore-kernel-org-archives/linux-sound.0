Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A5A334C1D
	for <linux-sound@vger.kernel.org>; Wed, 20 May 2026 15:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779292213; cv=none; b=YEAzx4iJ53bl2mNgC9yOiZE/vgjVAbEgfbnvWM7Fir7mDqrY5mNgYcx6VPFusp4IU+lXBWhT2eQHEVrnUeKhTh/7vad0xYW4t/hl8AtcyXU6LCIRa8aXtLNCCkDieUInC6stxZEbY4KIyj/FrTu1J7QHbeu9ogCIbmJzBNfVD90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779292213; c=relaxed/simple;
	bh=Uu5uyr3S4DAMsxnmTADNGWT4hBVCfQbf19BrUcKIb60=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=huGjg6eHY7VD7MNHdlXU1brMvaOphvwBjpdmQAdgO7haM3jnixmc0VnKUjVWJt7bhSftvp3PpoZHHUksMFq/Gvfp06M6tBCMXGVOSSoRCRnO99aBSIVQNiC3g3P/QExKBJAqayMrUJEElevtQqSGHsWIVFuA3CLxNKOB+iUzXwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ph0F43BP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IYQXYGAw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ph0F43BP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IYQXYGAw"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KCeEoD317159
	for <linux-sound@vger.kernel.org>; Wed, 20 May 2026 15:50:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7pajX5xu6Zp
	Ncsmp1hBoCRrNWBQ+y3y7lGXM9b2dJyw=; b=ph0F43BPpiJ3LSL7PyxFoDj884Z
	zYdQ6LHVh5DQADqWnvGTquoS5NYVMLmTSlWoOEjvqxzS7r6u9L3S77BsFL4JYdt0
	YqCCbrGLib2lrUqLMyi5rgLviAdrD4XrE4/bGbG99H1uURi7jAx2toiMGlxLkHFi
	Ens/6Sb5B4kKoVS3TGhaHGS91PnxY9OOskTWtsp9CpexXacnZjl3hKSwdwWmiuzE
	keWwzFI8xPvj0r618tNgu6hSsm1awffSgbn5izcpuDcdAcuXRcKU0tMbTRGdE1SB
	jNQ+a+jzDw5sIA5HjOGHG1KB7xSiR2n1VAhK9QEqx3oXy+XgWpfHXZDPfRQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9d5qrs1c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 20 May 2026 15:50:11 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-514b673c8f1so43251521cf.3
        for <linux-sound@vger.kernel.org>; Wed, 20 May 2026 08:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779292211; x=1779897011; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7pajX5xu6ZpNcsmp1hBoCRrNWBQ+y3y7lGXM9b2dJyw=;
        b=IYQXYGAwFy9r64u/bSlx1aPVvEDsbS/m00MXdLkydHr/ESE3ASJy6anM+uxJjU1iRM
         n0SHFLPnZ34i94QpaycYoPf9oOuHtpheoNQi2O64/xN83KkAYxVF+XgWsjtaIiUH94Sg
         5MvLlpZjFB32xddph9dSHwgaqU+CcqSDYooiIecuqCmim1rbjwqZ0WeyeWBSFoDQPgbo
         KbZZxQn7U7jfupSkPEZqJI+jJbhOLlRW5+hiBWiuTF7QUZN+RfmrI4R00QtrijqWqezu
         qtnye27k3t5uR+VBVNG9RNpvoM4M3ZSI/7OrCNmrgW8PbU1eAIMxezcFG6csuIfRC9pI
         JmmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779292211; x=1779897011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7pajX5xu6ZpNcsmp1hBoCRrNWBQ+y3y7lGXM9b2dJyw=;
        b=d7HrPSrArJKVJA6AmPzLlMIy+9Lpyej+3kSuI/+uKRX2VL9M4Z4myF6U0/T0/DhLXl
         Odt1/7E+koqHcNaGKaOdJ4KIoyIQhLgy31Sm6LJBkOf84yYsTBhqVco+M5Esiwn7kGTG
         QGgQm8u4mzsJIOOD35y4rOWbLGZYxT3caN3U3oxCoLpFlMoAmCswrFXWy0JjlICVWD9C
         fHdHz3VobpTKGN7wWf56EXuONst3fLhiXw9+FyEDcmPH/AS9bNnlWxww1GjGbJvCssRS
         r+p2dLTf5pay3ZM/pkA04ZEjSPpTPIkQwbEP+ZZ3THx+dBO+3PDUyHGyLhf/98+AlfJW
         ioDg==
X-Forwarded-Encrypted: i=1; AFNElJ84UBhzhLBWunwZKzvkWjRHMcPcmBMGjfc6CkFbHp+urd6IkVKhUvYEltAIU2j2uZwiQL0EpqJCdU+jiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKnC9tf5G+HEpN2+0OJlFS7ECHoYX3rIegekPu4YLvl1FMjgxf
	+h3tlhHUP5DUNP9/p6qHoT3LCQyfiJqc48s3bXv/Hl+/FpIJJgjz/1UZfNbW7XJKPYQBxfQYtxW
	0zK6BgUJ/A8hWbFvfTFB3lIokh6S55TfFYrHMc4ZIXPWZ8kS9MyLs8MfBCtOBvbbpsA==
X-Gm-Gg: Acq92OGBmMAt0vQZvg+GzDbgfr9VmYzY9nHRkd8ZkIhNZzOsf9Qtrd+h0meWYT8ma2y
	+QKmZhEtPj6ImaDsZDKjHW1FjqKEUB61G3fnD2Hul1cQrytoN7HD8KEiUJK/zzRykUezSCrzo4W
	aL/gK+2SW1O0J++PAXtHsXTIowi4f7hBjKGqCkc6MIO6WW6f/fY/n4QKkppaYA50W9k6G4UL8aB
	7vI9CWDfOF7D21M5Ujlg7gxB4tYd8xLz0Z92dKRzOqeIHuSgSa121j0Zjy8Jgub3zu2/KArp5QF
	BqAFSLgtqjTkim6ZNS6BFe3HfWM0qg5ChRFDXag5ROC/QOQPwDB7m7b63KWFJA60Vn4sX8rV2Lo
	MUwTBm05rOEIUYBgPDh/wM7mwHC6eF0iel5oZlzCYKs02t58/1bsz4nmc28xwbxiL2Q==
X-Received: by 2002:ac8:7f8e:0:b0:50f:b9e7:3031 with SMTP id d75a77b69052e-51659fde5fcmr353912991cf.7.1779292209963;
        Wed, 20 May 2026 08:50:09 -0700 (PDT)
X-Received: by 2002:ac8:7f8e:0:b0:50f:b9e7:3031 with SMTP id d75a77b69052e-51659fde5fcmr353910841cf.7.1779292208033;
        Wed, 20 May 2026 08:50:08 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe585absm136746445e9.19.2026.05.20.08.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 08:50:07 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
        sharq0406@gmail.com, kuninori.morimoto.gx@renesas.com,
        ckeepax@opensource.cirrus.com, srinivas.kandagatla@oss.qualcomm.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH v2 2/2] ASoC: codecs: max98090: use component set_jack callback
Date: Wed, 20 May 2026 15:50:02 +0000
Message-ID: <20260520155002.145306-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260520155002.145306-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260520155002.145306-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE1MyBTYWx0ZWRfXyEuxNSH0ko/y
 /NN/3a2EpF8Kb+wC8VekbZ4TMAFIxOJYq8eXGZ1v8EyWx7NSlhOElpRhhxB5JpWdQi8L3rsQKko
 28CDe1TiQqdo7KcEobiuEJww2JiUfO3EcbZnbDPIPa0l8OCp5nfwFd9DDhf6C5DKi/aV3HtcJul
 gPjs77bq569qIAsvroGAD/Z/gavCKY3KdjnU8QhYibMoqv2e1KzBRPG0Hwf6+FlBJAg3mNBDvqA
 vLGCWdsN/rxNLN5J83SzbqPSn8jU6rFgcDeXF+sXcOKp2eIOJF4EPUesDtZXidJ5qbS268Psv1K
 VJmlCmTNn4UCDn1P7crOHaDk7w0mM9oOfMgtWSPvjmjenPDovHVc07ysstzlpcFwq8XTreiKMzo
 T5tvPJje0ZOHzf1Q/gsIHaV7Fk6Y1NJtY4CW6oemTqiVdIvYojHZxKnJXsdtxxntWJnL0FfcwGr
 imSItxVIis1OtkKTABA==
X-Authority-Analysis: v=2.4 cv=QshuG1yd c=1 sm=1 tr=0 ts=6a0dd833 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=yuX1osHPGoIBqVCarmwA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: nfeUO2AyGRYitCR9hxzr6mjJDb98e2kq
X-Proofpoint-ORIG-GUID: nfeUO2AyGRYitCR9hxzr6mjJDb98e2kq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0
 suspectscore=0 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200153

The MAX98090 driver provides a custom max98090_mic_detect() helper for
machine drivers to register a jack.

This can be implemented using the standard component set_jack callback
instead. Doing so allows machine drivers to use
snd_soc_component_set_jack(), which is also the interface used by
machine drivers including Qualcomm ones.

Convert max98090_mic_detect() to a component set_jack callback and remove
the exported helper.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/max98090.c | 10 +++++-----
 sound/soc/codecs/max98090.h |  3 ---
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
index 13a15459040f..bd3bfa1d3402 100644
--- a/sound/soc/codecs/max98090.c
+++ b/sound/soc/codecs/max98090.c
@@ -2337,7 +2337,7 @@ static irqreturn_t max98090_interrupt(int irq, void *data)
 }
 
 /**
- * max98090_mic_detect - Enable microphone detection via the MAX98090 IRQ
+ * max98090_set_jack - Enable microphone detection via the MAX98090 IRQ
  *
  * @component:  MAX98090 component
  * @jack:   jack to report detection events on
@@ -2349,12 +2349,12 @@ static irqreturn_t max98090_interrupt(int irq, void *data)
  *
  * If no jack is supplied detection will be disabled.
  */
-int max98090_mic_detect(struct snd_soc_component *component,
-	struct snd_soc_jack *jack)
+static int max98090_set_jack(struct snd_soc_component *component,
+			     struct snd_soc_jack *jack, void *data)
 {
 	struct max98090_priv *max98090 = snd_soc_component_get_drvdata(component);
 
-	dev_dbg(component->dev, "max98090_mic_detect\n");
+	dev_dbg(component->dev, "%s\n", __func__);
 
 	max98090->jack = jack;
 	if (jack) {
@@ -2377,7 +2377,6 @@ int max98090_mic_detect(struct snd_soc_component *component,
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(max98090_mic_detect);
 
 #define MAX98090_RATES SNDRV_PCM_RATE_8000_96000
 #define MAX98090_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE)
@@ -2554,6 +2553,7 @@ static const struct snd_soc_component_driver soc_component_dev_max98090 = {
 	.remove			= max98090_remove,
 	.seq_notifier		= max98090_seq_notifier,
 	.set_bias_level		= max98090_set_bias_level,
+	.set_jack		= max98090_set_jack,
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
diff --git a/sound/soc/codecs/max98090.h b/sound/soc/codecs/max98090.h
index 6ce8dd176e48..048af4a1376f 100644
--- a/sound/soc/codecs/max98090.h
+++ b/sound/soc/codecs/max98090.h
@@ -1543,7 +1543,4 @@ struct max98090_priv {
 	bool shdn_pending;
 };
 
-int max98090_mic_detect(struct snd_soc_component *component,
-	struct snd_soc_jack *jack);
-
 #endif
-- 
2.47.3

