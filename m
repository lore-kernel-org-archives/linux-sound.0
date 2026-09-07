Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C6F51D50D
	for <linux-sound@vger.kernel.org>; Mon,  7 Sep 2026 18:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788804632; cv=none; b=oFb4GM3D8tMCpwzJ6F43DIujymtvxgQW10KrF1lwRECptRBYCfnnnwtnYjc3MsxETqyhPQbvtZyOMS10obWqQsCSr2j3VdscyAQZIxlbExCwK8O+8EOvQUuCniVlOEQfc8vDalrxi20PkXU6gt8FQ1E9A3QlFS3264+/Y8CKO6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788804632; c=relaxed/simple;
	bh=ibq5TperpF7A9jrT8/0vCPjzNrL4H059nqE3swlslIw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pDP3Rbo8SU1/dXtk50G4l4pcJLAwQsPOFNhbUh2t4TzFS02yAwThDcI4JtsNC4E+0+I1H13h76g/eIl8KHfYycU/SwOC/2nZeXRIH23a5jceVdQ315Ck4kDxrVxMrvpy4OsiyToi5SEjcd9Wug41g2Px+zpgBq5lXhDjjgZ4zfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q64BUtBx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CzRrZ1tg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q64BUtBx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CzRrZ1tg"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687H7r9k3484720
	for <linux-sound@vger.kernel.org>; Mon, 7 Sep 2026 18:10:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0YpDB9hlyWgs62i2uJGwtVGX3LyAfFTiTM9rdLVkwGQ=; b=Q64BUtBxTRFwPL8P
	plsoZg2S515PfXEVHzJVpgHJsCXxE7Q1miZRG2CdcDvPYbsSQD4PLLFTjI93KcMz
	4ROHwm3fzRHqCkkT2xbHuIj4fpxizv1TCEXOi5zRq1pNN3drVYcvsOqYPrgN6o8y
	4904kfTO0yNPDpNyb9t8Xz8TU/UfQ9j626I3tfVXzL3cuygXIGaDf26jwtTEX8fW
	bicRzUi/6i3YlEQqPdCq1eN/tlbhJSE2AzNhIjBwXiN1FjuFWx93RyN4+n71Ok1B
	H3oXCEQy56fK3p01oKoJ4gjAbpf4h6xMnqRjpQMD2rC0a6vkXZvoT9zluQju/4CF
	uXcNtg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtty1tqc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 07 Sep 2026 18:10:28 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c89704da8c7so4712481a12.0
        for <linux-sound@vger.kernel.org>; Mon, 07 Sep 2026 11:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788804628; x=1789409428; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0YpDB9hlyWgs62i2uJGwtVGX3LyAfFTiTM9rdLVkwGQ=;
        b=CzRrZ1tgVG8VZbg0Rt6nyuNzFeLqkg56ZVHTr7Ck1Y44XwAU14TK31xQsbviFjvQ3q
         dGEWx02sDmYkLntgqxLsAoYnf36y0hB4aivO5MSUNqQmWj0W/7ZCbEhyCQReBvNYH0Bv
         TxzZJ+GOY1vEJxYREabMWT66SFjWtQZ+bXc2jHNpzwIE9RG3WVSpcMEIgSomUFoNRKXS
         Ap1qyVJwYvA7+VAhU3+3S6LoiTDeqDgk0jTtGrOQ/NOP2rd9iK8tCApTPljPHnJWeHZ9
         qn7J0BeJNHatwl+2UQNDxlFaU2X3HQjRP0qA50uTK3r7Xt7fvobtcz1Fc2JgV7oRJQt1
         aUBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788804628; x=1789409428;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0YpDB9hlyWgs62i2uJGwtVGX3LyAfFTiTM9rdLVkwGQ=;
        b=VxMpEVRBMm7tW74OrfXolhtA0nigpDEV/EH/PLP2r7oljybzLcOm4FDAjjcP5jdB4O
         4UkxCrvge2icvB0IhEqhMCGHmh1ZZ1pb/B+Dp6qLyL8OZkrrk8ofb6SY8c6nRlf7BiyV
         ywECKgjBBKSYE9oCaArslVrz7BWhIXNYGKuEFgVV7wGB/z8Spa2XOLqzBZqY3kUIJCgV
         zY0YTji65BTA23K/4QZlEAeggL8fqLF3OXJgZBryfsBytWKfdcF50bmY7j8LnoZk7CC2
         DTKPHJs5g2UJfPkiSzrClDuCn3nT2qmvVRLJpgnaBNWSAxft9iuvEc2Ty78YOg7m5ZMK
         wTgw==
X-Gm-Message-State: AFuF++ngPE0pVwB4YiXFUa2qbrYe1HmvDF0b22J4EqmvPryD+hIa8zJM
	NiUQvIpLXVmyCsOiS2YTHURJAaTBQbXmj50+bL2SD5p6/NYO/WkHCo1YauGQe/PpYprRvOACcbr
	nf9J5ucgKku0q7DioTbWq5RCmNNIrzUkVSmi3G5d2osyUTCIqOBi9CahyLWq4h6Jgtg==
X-Gm-Gg: AYBFou1aQNwTIooGzHNb7O8sAPr0cCwUkKikUnvYJ248Fa2MErQnLDem9/r408B1row
	lrO8FMIVyEqMOiEA5NAhjTsrtO6vVztYn2440H9ajn3xWZcbJjxzyM9kQ7uXyaf8tn/T5xvWvp/
	yZlI6Oe9usOhQ+sZbTZgJgQXXUrUzK1L62/Ec2u32oizULAJM+obsoMeeOXmjsTks4UxstGVfU/
	4h5x9UtJXyExfSTnJo+4ML4aUEuK5VSwy4d/KO0Fw9s8lo2eMUY+D+3Ci1tJ0SfhXZTo6SZCoyX
	5Hx16wB1YldgK4302aLqeOAR9PEwvDiFAsiGi6Ak2OP8HkB+uwq2DelsnROjzhtgGLRvGRYINS4
	PksMs9SKe+DpAyQ9E5wdt0xNrXgH8MVJkS0ke
X-Received: by 2002:a05:6a20:6a1f:b0:3c3:b57b:627d with SMTP id adf61e73a8af0-3da39ec3154mr37307957637.12.1788804628227;
        Mon, 07 Sep 2026 11:10:28 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a1f:b0:3c3:b57b:627d with SMTP id adf61e73a8af0-3da39ec3154mr37307902637.12.1788804627806;
        Mon, 07 Sep 2026 11:10:27 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b608409sm33961954eec.21.2026.09.07.11.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 11:10:27 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 23:39:44 +0530
Subject: [PATCH v1 3/5] ASoC: codec: pcm1681: Enable system clock before
 regmap access
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-nord-asoc-driver-support-v1-3-997d3b20cf43@oss.qualcomm.com>
References: <20260907-nord-asoc-driver-support-v1-0-997d3b20cf43@oss.qualcomm.com>
In-Reply-To: <20260907-nord-asoc-driver-support-v1-0-997d3b20cf43@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788804602; l=2155;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=ibq5TperpF7A9jrT8/0vCPjzNrL4H059nqE3swlslIw=;
 b=tXG6U5aLLaHjGg1mY3KIPnmf1ncikfJ7KkwbNwcX5EkVTX9x8A/tFB1OgeDoA9wlPWRIgmICk
 EyqlVwHN3DyB7vFzQFWXBWRqx6mtRYhgi2Ytm/Lv2QERLaGNKQX+Rxe
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Authority-Analysis: v=2.4 cv=QNBYgALL c=1 sm=1 tr=0 ts=6a9efe14 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=cGfOUKfoVt3f02dCv40A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: VJiNRXbajT39Wq7rlUWzFRNQoxglbRQc
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDIwMSBTYWx0ZWRfX75hsbTJbhFXp
 AByqj5cAojhVjPm5E5yChrRxhURcLTQh4isZYP2E8KCmp17MRDffybGsvTvXuHeeTkjMRIKamXR
 OEMWu7TQ52ovx9YTFJV2nJot2LzOU6E=
X-Proofpoint-GUID: VJiNRXbajT39Wq7rlUWzFRNQoxglbRQc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDIwMSBTYWx0ZWRfX3e6SGXzAbvTo
 EdQs+JJGo7sh2AuegqM7ke8mHPU+IPLwWbbxbPsxWsvplvGJ9KUU6m2VEqXbhA9E0ihN7eQNLlL
 N1NaJx8hMjC4z1XqoXl2S/M6IXz/e+yqB+5Bczc9e/8REMFgwnObs3lMXMqTokf4UuQaIDkdvP2
 lKI/3oz/ixICDBcQuCPCoun2myMvLw+n2S3Zimql6bO0qWSE5HMpr+gJOaaE1G+j8Ve67I6F7i6
 D2MHCT+3U2wVf8npO7BqFYOYry7g5AHbqH6J+IiHAYvoOTB9/w5oKCEcyJ+HBckTS3wztrfl7rb
 SXFKPW5X5gk1TrDuIkFFOHPdIFv+a2/TUBkNhHBYske1xuBueKKt3LclxRAnMW1Mcw1ABhVVkHs
 reujVyokPGe+0uBNf+ijwK6+70q29nZk08FaRUi21dpyNfrTPK+Nmy1TzQs+quRLINkZpIRwovR
 ntc37J0sCTuy+NDySKw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_05,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070201

The PCM1681 DAC requires the SCK (system clock) input to be
present for proper device operation. On platforms where SCK
is provided by a controllable clock source, register accesses
over I2C may fail when the clock is not enabled.

Add optional clock support to the PCM1681 driver by acquiring
the "sck" clock, enabling it during probe, and registering a
managed cleanup action to disable it during device removal or
probe failure.

This allows platforms to model the PCM1681 system clock through
the common clock framework and ensures the device is operational
before regmap initialization and register accesses occur.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/codecs/pcm1681.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/sound/soc/codecs/pcm1681.c b/sound/soc/codecs/pcm1681.c
index 60fdbe5c4e05..cfe549176d14 100644
--- a/sound/soc/codecs/pcm1681.c
+++ b/sound/soc/codecs/pcm1681.c
@@ -12,6 +12,7 @@
 #include <linux/i2c.h>
 #include <linux/regmap.h>
 #include <linux/of.h>
+#include <linux/clk.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
@@ -74,6 +75,7 @@ struct pcm1681_private {
 	unsigned int deemph;
 	/* Current rate for deemphasis control */
 	unsigned int rate;
+	struct clk *sclk;
 };
 
 static const int pcm1681_deemph[] = { 44100, 48000, 32000 };
@@ -311,6 +313,22 @@ static int pcm1681_i2c_probe(struct i2c_client *client)
 	if (!priv)
 		return -ENOMEM;
 
+	priv->sclk = devm_clk_get_optional(&client->dev, "sck");
+	if (IS_ERR(priv->sclk))
+		return dev_err_probe(&client->dev, PTR_ERR(priv->sclk),
+				     "Failed to get sck\n");
+
+	ret = clk_prepare_enable(priv->sclk);
+	if (ret)
+		return dev_err_probe(&client->dev, ret,
+				     "Failed to enable sck\n");
+
+	ret = devm_add_action_or_reset(&client->dev,
+				       (void (*)(void *))clk_disable_unprepare,
+				       priv->sclk);
+	if (ret)
+		return ret;
+
 	priv->regmap = devm_regmap_init_i2c(client, &pcm1681_regmap);
 	if (IS_ERR(priv->regmap)) {
 		ret = PTR_ERR(priv->regmap);

-- 
2.34.1

