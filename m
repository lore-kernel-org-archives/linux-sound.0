Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792552360;
	b=H3UP0RI6X82mXtzSBW3etAJEq/P5IDOxFHC2Epa7fXmeBYZidjKuSW8z7N3+sgFi+sn7
	 YWwszIX5VmlaCbbOpqSx8M7No8wmmdwfmvIjSoeNQ2HNtrMJJkrwjjr2c2oQRRjIdyCAK
	 2S4t4gwdGMM/RWsMcukIrdmz61wI1J5zTX4XNJD5ymBXzexyxHDOOkIfFqt9mgBURunat
	 OXuRMMyBQhuKYzfm/qTegz5QVF3cFTP6qQjVSvQoOSTsEMlhicaYjPtDW+A4NAqUwhC5U
	 dImcP2jdsOAGvsIhCQB3+lzVaHqZMKwY3dce6x3B+DBqS51vQKwvEpJaANOAQW3+K8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792552360;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MfRkPM22ZaiSo4hToB8MNzjEQGDixsa8Pt0dtjpR+tE=;
	b=IZ3fY1Vd/VOEFb6E+z+bLKpjPJy8a9Av9p6Lf6Pm6cLuBkluiwA9WWTEIea+JXe0n+po
	 97o/rr5B2Ltg4xNIOvSPSmVlvlGhCf8NmeGDeHn9+IJafNRwr/K2p1026LVw/YUPljVoB
	 ZtfSSYiXDGQz9XjoNbgigkzhkmmf1A1eQwGsnC5xWOrXgDBNDv/qfsydzKoavU5cUOXam
	 LUTJfOwfYNddQcGcE8VEm+UVMraWOn62NUpFV48hpBy5+jHCnbszETqzBfXMCxUo3burF
	 ralGajXaR63klztbn2la1zMkcCVgRyzEO3buFcxuZkFIXb8owOjEGsK5SGBdOKNbFww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="TW/c3KC2";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kcRlWfwk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0402606A31C
	for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 03:12:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0402606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TW/c3KC2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kcRlWfwk
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L2F4qL2391334
	for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 03:12:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=MfRkPM22ZaiSo4hToB8MNzjEQGDixsa8Pt0
	dtjpR+tE=; b=TW/c3KC2RXH+WX8/W8l6bonpOlRiIOTiIeM7mZdbTYw82wG+osM
	NdY8A4jMC5DqCrN6ZR9NgDZFyCLKllr4b4u4qs4cD1gW9MDgsFNiungu4EuvJe1w
	yqnVJdYYzjJHOri/Xsqq//dGlfA6aeBx0aLSergksdcHZ9mt3BChahMNGOFmoj2l
	no9vhTEXKyNRVNmNIfWuG4hXDzo5QtmoAgWKs1dj3D0bRD0Z7q7n9pCKl6lvKtaY
	jOnh8uv/8eqZsABuisLVIq8nmIMHHciQj23B7EkjF4OUr1c+Vvis/WLIfSKgFcS3
	K8oxWvSI3Rk6twyakkCZtzTrXgDlE6N0Opg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heeb99gdd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 03:12:38 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-18eb2616974so441335c88.1
        for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 20:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792552358; x=1793157158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MfRkPM22ZaiSo4hToB8MNzjEQGDixsa8Pt0dtjpR+tE=;
        b=kcRlWfwkRAvsCeiNTLIdRIElZBNcg+DbzmW62dUkSwnaUJA27lhrltUO998ZOWvgay
         CV8xg4zvu9c0SKHsy+SsA3kdQw3ty1LPpeGyelgPq+xvDCH9DpgS+XnKfMrXzIgN4K2L
         do9kBEjujwi3HU25pFC+Q/VsGskkqieRdQTopwtDxYmtDJXv7arTqx08aSBkUgu7zzf1
         xH+ubV7ST3T5aGU76bUi2q1Y57ul4t5ShLdnH4lV6Agl3WWhIiVqWhFxuf8jD/bEq+0J
         qsuQqO5ahTDB/h8TRhSC87xTSZOngtuT3mXo0cJUht3m6HoOEPy+TrhfphXz2tdopLEb
         gDlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792552358; x=1793157158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MfRkPM22ZaiSo4hToB8MNzjEQGDixsa8Pt0dtjpR+tE=;
        b=GJu+X5F86EUEFOCHz21ONZyr40OpG9wB61mxnC2z9B3ZolNGwDwdhpRV4xWKsG8PXF
         0Z/qgIVMvQ59vTf8eMs1mp3HxJwblwXof1cufGelPEBjReaxIMxNiniT+hUSNEP3mmt9
         Z6GCy3GmcFpfrL0QBxyYBVieTQEjFcbZh6BlIkoKTmtCoPLFg0qsaFWopOCI7GGsRN0w
         iKziNXC35E/uI7QOgk9OTf8/TGi9C1bHlRDpDG6AIUnPKNP2jIUDSDbZGEFzj40vKk+a
         gLlskhPOU4D3qll9tVKT3N/f/Zl6sTJLFQ0OVWw/hOdS8yxon2CRXSvn4JuKLk4FWn/J
         SbNw==
X-Forwarded-Encrypted: i=1; AKwUvBzM5exrNc8DwYPma1mQKMWGEDSnlNAx8AxcoeZw/v3muhdHTHfxJXf0nXDnVvSpwCRT4H+9z0foVQUETA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJkYWNCuomdp3Ho3ZTqrXxgRbFS3Fw9xhg9+DUakPv0urUAmkZ9
	psUWCaChxzYdu+n2NQ73guY5l2CKP1XJFPuSEEQgqFkzH7M/82tjFLAqldjhMp8qdU92dufk/50
	lfZbVgWEbXZRpUQLLW3ZuzeYre1Vz/PcCcPh97MMx+HhBRRIv77js86AIgPNNAGA2OA==
X-Gm-Gg: AYBFou1JOSkNlX1CjSt6tTMHXNO7TXpb+wk5n93A34at2qMipOi6BIs1qkjW412VJ7W
	/doYQvkyhm40d0Cl48xdXpdztI7NWL/b/opYfbzvHJVivl/82hIVwq6pcwDE50QkLpt8Y8EpUUc
	ilTS9LCvyBQH0Z5AEmRj80ncEXy2oTh4UZq1j7TMtLG6MqF4A8hHw5dP/CW+vreK3L+mS4vvrd8
	qZqVFMRKtYF4bz17L+Qj/DXxlYs/0HwB+COYj6hQlx9dj42XUtNO4zEB37oFoRd5qNQlw8CFt4B
	3Q2Jhf5VuzMjl40SONCX2u5d+yei+00HWfJXwqm3reKaUxYCwiR95aq4iXjD1PlkkbDRHRFWz+s
	cdx6+sKvprlY+vbgJZt/369jIIRAXUQuO/Uz/o1sRI4nVVvgO/Trvtd/XVS0=
X-Received: by 2002:a05:7022:698c:b0:17b:fed6:7449 with SMTP id a92af1059eb24-190a7c21166mr1390119c88.47.1792552357379;
        Tue, 20 Oct 2026 20:12:37 -0700 (PDT)
X-Received: by 2002:a05:7022:698c:b0:17b:fed6:7449 with SMTP id a92af1059eb24-190a7c21166mr1390070c88.47.1792552356642;
        Tue, 20 Oct 2026 20:12:36 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903a180adasm2517518c88.8.2026.10.20.20.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 20:12:36 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Shenghao Ding <shenghao-ding@ti.com>,
        Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>,
        Sen Wang <sen@ti.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] ASoC: codec: pcm1681: Acquire sck when bound to a card
Date: Wed, 21 Oct 2026 11:12:28 +0800
Message-ID: <20261021031228.2074402-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfXykt9ZxkAShyx
 GttwmPKUr4Rr0Fp/5H8qPeoM0BXUM7ktQ7M9xWu+nITiXStANCy8eYHEhr+05ci9sZ0QvzROk+F
 rghtJsfXiYmmomTeaTlr7Sq+AyyeeYg=
X-Proofpoint-GUID: FOg0UOYWH0XPe9Pism7IZmdeGtXEMcbG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfX06j09eQi5CyK
 qQVB/IIpuEe+Lo3YHb9W/r64UmgwZ69zs8wiN6Rbii+cWA3ZaAfKy4T0C72KrbYMuf24jtMfFsF
 UK9JerpfvzrNer0JX6dak8TW8UYHI59PIVEdXGtIgIvpMAxziHKR0fG/j0KiybKnXBH+EqyDB46
 tspWFhxbet438TFZls7i3YwaScQtraZQvjUyskZ15LcDaPMXDkIsqkYKUIKzd9p5IAF0h1STLDT
 KZuJEmI87IP2der/rjDI11ObEQt/wDFhQ5F9QQ7DzyiuTwxPcPUpptRbkkGGy2VgdAXy0mAG9R3
 wuqH+05U9lxBI1hfavf3nm76EO7nBniAdPLrhXJFi51nKc+KIYOu8GjybGRauYZ3EuH5ZcvyVku
 sR1ToaRvi/x1wWEIALXUFZN1zXzuNUZog1RW+L4YNySM9klKY1gZbaJGJJS4DR4Vz5vSKWZs6OT
 edtjjujC22CH5NbEr0A==
X-Authority-Analysis: v=2.4 cv=R42WitRX c=1 sm=1 tr=0 ts=6ad82da6 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=7YZ_7jEC5wYdKgbzYxcA:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: FOg0UOYWH0XPe9Pism7IZmdeGtXEMcbG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210012

The sck clock is taken once at i2c probe and held for the lifetime of
the device. On Qualcomm boards it is an LPASS clock exported by the
q6prm clock controller, which lives on the DSP and is unregistered and
registered anew whenever the ADSP is stopped and restarted. fw_devlink
cannot tie pcm1681 to that provider, since the provider node only gets
a device once the DSP is up, so it falls back to the remoteproc device,
which stays bound across a DSP restart. pcm1681 is therefore never
unbound and keeps a clk handle to the dead provider.

After an ADSP restart the first runtime resume fails with:

  pcm1681 0-004c: Failed to enable sck: -6

and there is no playback through the DAC. Even with a fresh handle the
DAC stays silent: the new provider registers its clocks at their
default rate (19.2 MHz), while assigned-clock-rates (12.288 MHz) was
only applied by the i2c core at probe time.

The sound card, however, is torn down and re-created on a DSP restart.
Move sck handling into the component probe/remove callbacks: get the
clock, re-apply the assigned clock rates and enable it each time the
component is bound, and release it on removal. The i2c probe now only
sets up supplies and the regmap, keeping the cache in cache-only mode
until the clock is running, and the cache is synced once sck is up.
Runtime PM is enabled and disabled together with the clock.

Fixes: 8987e9a24f45 ("ASoC: codec: pcm1681: Add optional SCK clock and runtime PM support")
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 sound/soc/codecs/pcm1681.c | 122 ++++++++++++++++++++++++++-----------
 1 file changed, 88 insertions(+), 34 deletions(-)

diff --git a/sound/soc/codecs/pcm1681.c b/sound/soc/codecs/pcm1681.c
index 6002da3a5666..2cc34561aa83 100644
--- a/sound/soc/codecs/pcm1681.c
+++ b/sound/soc/codecs/pcm1681.c
@@ -13,6 +13,7 @@
 #include <linux/regmap.h>
 #include <linux/of.h>
 #include <linux/clk.h>
+#include <linux/clk/clk-conf.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 #include <sound/pcm.h>
@@ -321,7 +322,87 @@ static const struct regmap_config pcm1681_regmap = {
 	.cache_type		= REGCACHE_MAPLE,
 };
 
+/*
+ * sck may come from a DSP-hosted clock controller that is torn down and
+ * re-registered when the DSP restarts, which also rebinds the card. A clk
+ * handle kept across that would point at the dead provider, so only hold
+ * sck while the component is bound to a card.
+ */
+static int pcm1681_component_probe(struct snd_soc_component *component)
+{
+	struct pcm1681_private *priv = snd_soc_component_get_drvdata(component);
+	struct device *dev = component->dev;
+	int ret;
+
+	priv->sck = clk_get_optional(dev, "sck");
+	if (IS_ERR(priv->sck)) {
+		ret = PTR_ERR(priv->sck);
+		priv->sck = NULL;
+		return dev_err_probe(dev, ret, "Failed to get sck\n");
+	}
+
+	/*
+	 * A re-registered provider comes back at its default rate, and the
+	 * driver core applied assigned-clock-rates only once, at i2c probe.
+	 */
+	ret = of_clk_set_defaults(dev->of_node, false);
+	if (ret) {
+		dev_err(dev, "Failed to set assigned clock rates: %d\n", ret);
+		goto err_put;
+	}
+
+	ret = clk_prepare_enable(priv->sck);
+	if (ret) {
+		dev_err(dev, "Failed to enable sck: %d\n", ret);
+		goto err_put;
+	}
+
+	pcm1681_sck_settle(priv);
+
+	/* The DAC lost its state if sck went away while unbound */
+	regcache_cache_only(priv->regmap, false);
+	regcache_mark_dirty(priv->regmap);
+	ret = regcache_sync(priv->regmap);
+	if (ret) {
+		dev_err(dev, "Failed to sync regcache: %d\n", ret);
+		goto err_disable;
+	}
+
+	/* The clock is on, so hand the now-active device over to runtime PM */
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+	pm_runtime_idle(dev);
+
+	return 0;
+
+err_disable:
+	clk_disable_unprepare(priv->sck);
+err_put:
+	clk_put(priv->sck);
+	priv->sck = NULL;
+	return ret;
+}
+
+static void pcm1681_component_remove(struct snd_soc_component *component)
+{
+	struct pcm1681_private *priv = snd_soc_component_get_drvdata(component);
+	struct device *dev = component->dev;
+
+	pm_runtime_disable(dev);
+	/* Runtime PM may already have gated the clock */
+	if (!pm_runtime_status_suspended(dev)) {
+		regcache_cache_only(priv->regmap, true);
+		clk_disable_unprepare(priv->sck);
+	}
+	pm_runtime_set_suspended(dev);
+
+	clk_put(priv->sck);
+	priv->sck = NULL;
+}
+
 static const struct snd_soc_component_driver soc_component_dev_pcm1681 = {
+	.probe			= pcm1681_component_probe,
+	.remove			= pcm1681_component_remove,
 	.controls		= pcm1681_controls,
 	.num_controls		= ARRAY_SIZE(pcm1681_controls),
 	.dapm_widgets		= pcm1681_dapm_widgets,
@@ -359,11 +440,6 @@ static int pcm1681_i2c_probe(struct i2c_client *client)
 		return dev_err_probe(dev, ret,
 				     "Failed to enable supplies\n");
 
-	priv->sck = devm_clk_get_optional(dev, "sck");
-	if (IS_ERR(priv->sck))
-		return dev_err_probe(dev, PTR_ERR(priv->sck),
-				     "Failed to get sck\n");
-
 	priv->regmap = devm_regmap_init_i2c(client, &pcm1681_regmap);
 	if (IS_ERR(priv->regmap)) {
 		ret = PTR_ERR(priv->regmap);
@@ -371,53 +447,31 @@ static int pcm1681_i2c_probe(struct i2c_client *client)
 		return ret;
 	}
 
+	/* No sck until the component is bound, serve access from the cache */
+	regcache_cache_only(priv->regmap, true);
+
 	/* Must be set before runtime PM is enabled, the callbacks use it */
 	i2c_set_clientdata(client, priv);
 
-	ret = clk_prepare_enable(priv->sck);
-	if (ret)
-		return dev_err_probe(dev, ret, "Failed to enable sck\n");
-
-	pcm1681_sck_settle(priv);
-
-	/* The clock is on, so hand the now-active device over to runtime PM */
+	/* Runtime PM is enabled from component probe, once sck is running */
 	pm_runtime_set_autosuspend_delay(dev, 100);
 	pm_runtime_use_autosuspend(dev);
-	pm_runtime_set_active(dev);
-	pm_runtime_enable(dev);
-	pm_runtime_idle(dev);
 
 	ret = devm_snd_soc_register_component(dev,
 					      &soc_component_dev_pcm1681,
 					      &pcm1681_dai, 1);
 	if (ret) {
 		dev_err(dev, "Failed to register component: %d\n", ret);
-		goto err_pm;
+		pm_runtime_dont_use_autosuspend(dev);
+		return ret;
 	}
 
 	return 0;
-
-err_pm:
-	pm_runtime_dont_use_autosuspend(dev);
-	pm_runtime_disable(dev);
-	if (!pm_runtime_status_suspended(dev))
-		clk_disable_unprepare(priv->sck);
-	pm_runtime_set_suspended(dev);
-
-	return ret;
 }
 
 static void pcm1681_i2c_remove(struct i2c_client *client)
 {
-	struct pcm1681_private *priv = i2c_get_clientdata(client);
-	struct device *dev = &client->dev;
-
-	pm_runtime_dont_use_autosuspend(dev);
-	pm_runtime_disable(dev);
-	/* Runtime PM may already have gated the clock */
-	if (!pm_runtime_status_suspended(dev))
-		clk_disable_unprepare(priv->sck);
-	pm_runtime_set_suspended(dev);
+	pm_runtime_dont_use_autosuspend(&client->dev);
 }
 
 static int pcm1681_runtime_suspend(struct device *dev)
-- 
2.43.0

