Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75C71FBCAA
	for <linux-sound@vger.kernel.org>; Sun, 27 Jul 2025 08:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753605124; cv=none; b=FOIgKSf8Z/h5oUqBDGESfsqPvQt47v6ymksemT0g0ieswUvJY9s7XJfKoNm2YWoKTbbKkvoNKGXKi3J6qLDByYmNB/a3mxvn2wLCLV2dArN4K9JyJOOFuGc9HKql8L/CwmjXmPTzjjRj9pDzH2+uYsKVmU6qmQjhVPdImUFbzqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753605124; c=relaxed/simple;
	bh=+9bKbsOHOv6HUfFTojTu52PpIyeGZIM2BjFmGx8IJRQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sf/OEGaOpIlOyQfNC5wUXn2sU/dzbLdyH+o4Mf+WEEAS4L44oTTZRaEnOAIwQi9AX6YeGffsz3u+EufJQjPnHDMNXJcJD+hkleioV5EuRpcP7mbxrcnRyvPs+CUvcI6eFbQ/D/xI4xjmf7cP/pyg9g8fxr//hTx9U1FsD/cMAww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HPefPEc/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HPefPEc/"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56R6fWMr026200
	for <linux-sound@vger.kernel.org>; Sun, 27 Jul 2025 08:32:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RZd0XO7FU/P
	/QgQIeS4PXIVz6WnhkQsNSg2RESxcNiY=; b=HPefPEc/95TVL6F6Rrg5jVJV650
	g1MwDGN3Sm/N+vLf0WpA4ttQrZfQ5trD8GZpqnLCsIqidja9jq/oB9bJ4K/SiD7x
	tCxeUwKep3XEZ/tkF9+Mm0tX/KULxpo6xWUkTE4OJucVhJh6HF54arRLkhVSE0V9
	O0fZfGOO4iYv8uTUMFUby1ImZ+XFXYAnSYbeTo1HQxOZN9G4P125guG7YLebzZCz
	0pi7JCfCilCXUI0rHbISq6Rq0A0+7d1iavroPvRYwhlNnNCqQf38roprCUTqdcQP
	4ElAr6B+6BttW2hhAe1OlgDjQ9cojkSiW4yyGetX9FiXVR5GNSq63vMyB4Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484q85sv33-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 27 Jul 2025 08:32:00 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-235c897d378so37941475ad.1
        for <linux-sound@vger.kernel.org>; Sun, 27 Jul 2025 01:32:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753605120; x=1754209920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RZd0XO7FU/P/QgQIeS4PXIVz6WnhkQsNSg2RESxcNiY=;
        b=Vhn3xCwhElMRFkILlmBuyPEqJcH+of8lf+MIe/j1G6gWaC+TtSGYR9Bv+rWNCaedE8
         iu6DdxZikn5NVDLVrEHlISGRcM8sG/2ilNOk+jL2fVLfCdNkw4pY9p8Lj+J35Czyfq4x
         agK86vRaYUZ8tbitUHmfpYQkEy+zO9eHKS0VtTIXA6MvYLd62c8XHUUbrBzl+CbpRtgp
         7CsXeprJMOC2n4DLBcAxMj6bcJu8YqWWyQM3zvW+S+/WSK7kss6N8tGEuCIOKBiXT3bU
         jDS6XLrPA9duWN8dq22xIAJLYpNsBwOm3GdhtuK36+fT43HogxPgMEyjemAcM9KiyG3s
         5dlA==
X-Forwarded-Encrypted: i=1; AJvYcCXwDTIzmPIrdqwhMLqIh/dvkoGQJAyTEhaKHKzwcgK6v6o/hNYWtsvXwqq/D15c3bSTNTC3Tize3hC5og==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxqsTW+dBSK4ugHJ1zWb5wyibkMlLQcq0cm52dkEOLY3IFTv5Y
	SUi5VAxMqZU13nWB7TMroy0U2N1bWQP8VcQQrFO3YUO0LRz+cJ7U+gh0zvE2sbAdxFSe3w1t4S7
	GBf9gMO/EIw9ZHI7WYxtoteqbmeNDK+OAXiCs01WgdT5+slWCZWCcNMYtbRBs2P11aSmIpfBp8A
	==
X-Gm-Gg: ASbGncvtVqx2WioOq9Wa9uzan8NdMa69eF0ty07HjNFNwCvAGsHKZVhwgi6RHI8m4gn
	Ptr79HnXJfS2YYR5KBcc383Nw129R1ubzfS4XOviyEmcqwhowkWvVKyxOINWkUoJ8qEEixyfvGq
	5wggxuMU5haC4NlQLODN+UTfZmF2XmGrKOW/zIu0TaJkxLu6E//3xWnI1CcYrJqWdYOCucm0yrf
	Q58eHaPe06kTOZrwAwVqI/zYWKlGG6Gl9EwaRoXuSQ1jV65UEScY4koV5+wf8s+gOqrQprs2Z3D
	junqydtWvfJVuwhR8biFKoidCKlVy04bRxs2pQdLX+jCQ6MR2yuJ+mceObkLyiz47oHfCx9r/nb
	9
X-Received: by 2002:a17:902:fc8d:b0:23f:fa7c:7129 with SMTP id d9443c01a7336-23ffa7c7345mr26119235ad.25.1753605119929;
        Sun, 27 Jul 2025 01:31:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYL40jaLo95RgGHJ+Xssx0AAZaURi7P8YVF5vPE2C+sA20mi+8Arqz6EQswYNjlnFFzFdgKg==
X-Received: by 2002:a17:902:fc8d:b0:23f:fa7c:7129 with SMTP id d9443c01a7336-23ffa7c7345mr26118815ad.25.1753605119458;
        Sun, 27 Jul 2025 01:31:59 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2401866c2c3sm2848645ad.30.2025.07.27.01.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 01:31:59 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, quic_pkumpatl@quicinc.com,
        kernel@oss.qualcomm.com
Subject: [PATCH v3 3/3] ASoC: codecs: wsa883x: Handle shared reset GPIO for WSA883x speakers
Date: Sun, 27 Jul 2025 14:01:17 +0530
Message-Id: <20250727083117.2415725-4-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250727083117.2415725-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20250727083117.2415725-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI3MDA3MyBTYWx0ZWRfX3XJ+LXjbZMTC
 9ldYnXOBWW8JfA7vuAN8qiuL1D/GJVHzyKVR48iEmEnYhpDd9yCPSqIs0D1fw1d1fTLG7MJkdZC
 DI0NWFH66N+hIX3/EVv/WbcqovOS9AA1i7YlcN389P4o8/VboPIg5ynFaK9Kz/FyEevQME0+lAO
 tWK7cVziUy24HhrcxIZUvmiouEb1SEV0VvHInmuTcrdQLeIzuofhhLJE1RxgGmSloJmsscB2Mz2
 qQu/Fd6PoQdZ+Q2VQUPMbdE972E+ItxApc9SJd/6pa1VaN0vjW+fivQtQphvS1iN2aiZRviQPOS
 DtBqVAD5OHTcOOiy4v0qInreuL0/+DTrrOO1mmJoxsW//rDIuCn5eqfN8mppU8xxlq90KrujLok
 regMffF+TJE0Mg6U3al7NprvZE0WD4eYisV/xCj2js6wBmIJjtBA/u2GDvA+sQVZKUPWoFEO
X-Authority-Analysis: v=2.4 cv=TqLmhCXh c=1 sm=1 tr=0 ts=6885e401 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=pGReym1pqKqKmaA-xlUA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 3eZmJrpU44b6WYV4BnceiztnqnHKacuN
X-Proofpoint-GUID: 3eZmJrpU44b6WYV4BnceiztnqnHKacuN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-27_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507270073

On some Qualcomm platforms such as QCS6490-RB3Gen2, the multiple
WSA8830/WSA8835 speakers share a common reset (shutdown) GPIO.
To handle such cases, use the reset controller framework along
with the "reset-gpio" driver.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/codecs/wsa883x.c | 55 +++++++++++++++++++++++++++++++++-----
 1 file changed, 49 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index d5bc71b28a3a..0acf111f9583 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -469,6 +469,7 @@ struct wsa883x_priv {
 	struct sdw_stream_runtime *sruntime;
 	struct sdw_port_config port_config[WSA883X_MAX_SWR_PORTS];
 	struct gpio_desc *sd_n;
+	struct reset_control *sd_reset;
 	bool port_prepared[WSA883X_MAX_SWR_PORTS];
 	bool port_enable[WSA883X_MAX_SWR_PORTS];
 	int active_ports;
@@ -1547,6 +1548,24 @@ static const struct hwmon_chip_info wsa883x_hwmon_chip_info = {
 	.info	= wsa883x_hwmon_info,
 };
 
+static void wsa883x_reset_assert(void *data)
+{
+	struct wsa883x_priv *wsa883x = data;
+
+	if (wsa883x->sd_reset)
+		reset_control_assert(wsa883x->sd_reset);
+	else
+		gpiod_direction_output(wsa883x->sd_n, 1);
+}
+
+static void wsa883x_reset_deassert(struct wsa883x_priv *wsa883x)
+{
+	if (wsa883x->sd_reset)
+		reset_control_deassert(wsa883x->sd_reset);
+	else
+		gpiod_direction_output(wsa883x->sd_n, 0);
+}
+
 static void wsa883x_regulator_disable(void *data)
 {
 	struct wsa883x_priv *wsa883x = data;
@@ -1554,6 +1573,28 @@ static void wsa883x_regulator_disable(void *data)
 	regulator_disable(wsa883x->vdd);
 }
 
+static int wsa883x_get_reset(struct device *dev, struct wsa883x_priv *wsa883x)
+{
+	wsa883x->sd_reset = devm_reset_control_get_optional_shared_deasserted(dev, NULL);
+	if (IS_ERR(wsa883x->sd_reset))
+		return dev_err_probe(dev, PTR_ERR(wsa883x->sd_reset),
+				     "Failed to get reset\n");
+	/*
+	 * if sd_reset: NULL, so use the backwards compatible way for powerdown-gpios,
+	 * which does not handle sharing GPIO properly.
+	 */
+	if (!wsa883x->sd_reset) {
+		wsa883x->sd_n = devm_gpiod_get_optional(dev, "powerdown",
+							GPIOD_FLAGS_BIT_NONEXCLUSIVE |
+							GPIOD_OUT_HIGH);
+		if (IS_ERR(wsa883x->sd_n))
+			return dev_err_probe(dev, PTR_ERR(wsa883x->sd_n),
+					     "Shutdown Control GPIO not found\n");
+	}
+
+	return 0;
+}
+
 static int wsa883x_probe(struct sdw_slave *pdev,
 			 const struct sdw_device_id *id)
 {
@@ -1583,11 +1624,9 @@ static int wsa883x_probe(struct sdw_slave *pdev,
 	if (ret)
 		return ret;
 
-	wsa883x->sd_n = devm_gpiod_get_optional(dev, "powerdown",
-						GPIOD_FLAGS_BIT_NONEXCLUSIVE | GPIOD_OUT_HIGH);
-	if (IS_ERR(wsa883x->sd_n))
-		return dev_err_probe(dev, PTR_ERR(wsa883x->sd_n),
-				     "Shutdown Control GPIO not found\n");
+	ret = wsa883x_get_reset(dev, wsa883x);
+	if (ret)
+		return ret;
 
 	dev_set_drvdata(dev, wsa883x);
 	wsa883x->slave = pdev;
@@ -1610,7 +1649,11 @@ static int wsa883x_probe(struct sdw_slave *pdev,
 	pdev->prop.simple_clk_stop_capable = true;
 	pdev->prop.sink_dpn_prop = wsa_sink_dpn_prop;
 	pdev->prop.scp_int1_mask = SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY;
-	gpiod_direction_output(wsa883x->sd_n, 0);
+
+	wsa883x_reset_deassert(wsa883x);
+	ret = devm_add_action_or_reset(dev, wsa883x_reset_assert, wsa883x);
+	if (ret)
+		return ret;
 
 	wsa883x->regmap = devm_regmap_init_sdw(pdev, &wsa883x_regmap_config);
 	if (IS_ERR(wsa883x->regmap))
-- 
2.34.1

