Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26F31F76C1;
	Mon, 21 Oct 2024 13:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729518206; cv=none; b=UOW8lW9CVYQS1AJ8i627YkRnUrEZtJvpiSizg6v4d1aXrexUhsdQY0uyv+VKh1UmLKU63TEZKd4t3c770xr1CAeuegszuxgEc+BBlYoKd+LFdZqzYVy3wa5LwjELy/KT1BuIDGgu6/cGGeVwiawQIhGGQ7Iv+h5MYUJMZgkqn6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729518206; c=relaxed/simple;
	bh=ji4xpsdauq4eL2UowXQVPh9V4Omji2HPbuJqCuXO3Lw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=GrtwIpmdEZaO0G41en7E4mQNhOSzoIFw3yNWug1fhfs1YAN69VJ3PERbV26a/gJWI2haw/SOsffUjJqnm0AB4QdUaZIyI4gQBJIPJoAkMiUwVn3RevBCNWk89voZIho68XLuIBr3vGnR91/4OPy8OY9n6QUg/547ssnObUa/nJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=YoQrJlMf; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="YoQrJlMf"
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49LDYWoT019790;
	Mon, 21 Oct 2024 09:42:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=xTTLu
	/OlHYE+6sDiudTP9ZXXxgkxjScBGiy6SuAyF/Q=; b=YoQrJlMfWOT9NNAVgLj0H
	p/oZ8WorUmSyBQECRyQdRNl9hgaPdRLPPQH/YsjpyWaIsiKzrG+3uUg7TplKYB3/
	T8tUklUegImJppC0nRCtbRt6tr2N4x/zfB3dyQER1jkywpvDEcQ5UVgjx0aCzTcL
	k9dhNwNj1ML8CnSrUOgBUHL5SWDTqoRtQE4VBltqcE7TLGET5jjPtijfYBKoVMI5
	UY30ulISrDHLttzuLPW9gtU53O4L7GajrrCrlDV5f0/MAXGMhKayZ62Bs9psQ66o
	Vdp5gp4R8/n2FyFFnQPfgLBwBMMhgFRrnpDt5BjZ/uXEpxzdptUcoByrX+V2ZudC
	g==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 42dk5dh6qb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Oct 2024 09:42:51 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 49LDgnQu038540
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 21 Oct 2024 09:42:49 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Mon, 21 Oct
 2024 09:42:49 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Mon, 21 Oct 2024 09:42:49 -0400
Received: from [127.0.0.1] ([10.44.3.60])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 49LDgU7a017079;
	Mon, 21 Oct 2024 09:42:44 -0400
From: Nuno Sa <nuno.sa@analog.com>
Date: Mon, 21 Oct 2024 15:46:48 +0200
Subject: [PATCH 4/4] ASoC: codecs: adau1373: add powerdown gpio
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241021-adau1373-shutdown-v1-4-bec4ff9dfa16@analog.com>
References: <20241021-adau1373-shutdown-v1-0-bec4ff9dfa16@analog.com>
In-Reply-To: <20241021-adau1373-shutdown-v1-0-bec4ff9dfa16@analog.com>
To: <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Lars-Peter
 Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729518408; l=1685;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=ji4xpsdauq4eL2UowXQVPh9V4Omji2HPbuJqCuXO3Lw=;
 b=JhxM6BIKcF/Mgy6Mj+vuyqltUcWqSun7Zep47ulNiBeY3w6OqtCWfgPVc12ohEyVtUbDVAC3C
 QM6n/vj+cUcCuqdXzGXANRvpzN/ig0ZTFdF1WW1zPPypm4bXSFKUZ71
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: pz9StNY-R34H6gsmw7V007FdOlc-zhiX
X-Proofpoint-GUID: pz9StNY-R34H6gsmw7V007FdOlc-zhiX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=778 adultscore=0
 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410210097

If the powerdown GPIO is specified, we use it for reset. Otherwise,
fallback to a software reset.

Signed-off-by: Nuno Sa <nuno.sa@analog.com>
---
 sound/soc/codecs/adau1373.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/adau1373.c b/sound/soc/codecs/adau1373.c
index 9568ff933e12ba939134a696c8d9c16a2ef04795..d5566b4c444f3a8be07cc17fbdbb5fee1b6442e9 100644
--- a/sound/soc/codecs/adau1373.c
+++ b/sound/soc/codecs/adau1373.c
@@ -8,6 +8,7 @@
 
 #include <linux/module.h>
 #include <linux/init.h>
+#include <linux/gpio/consumer.h>
 #include <linux/delay.h>
 #include <linux/pm.h>
 #include <linux/property.h>
@@ -1547,6 +1548,7 @@ static int adau1373_parse_fw(struct device *dev, struct adau1373 *adau1373)
 static int adau1373_i2c_probe(struct i2c_client *client)
 {
 	struct adau1373 *adau1373;
+	struct gpio_desc *gpiod;
 	int ret;
 
 	adau1373 = devm_kzalloc(&client->dev, sizeof(*adau1373), GFP_KERNEL);
@@ -1558,7 +1560,21 @@ static int adau1373_i2c_probe(struct i2c_client *client)
 	if (IS_ERR(adau1373->regmap))
 		return PTR_ERR(adau1373->regmap);
 
-	regmap_write(adau1373->regmap, ADAU1373_SOFT_RESET, 0x00);
+	/*
+	 * If the powerdown GPIO is specified, we use it for reset. Otherwise
+	 * a software reset is done.
+	 */
+	gpiod = devm_gpiod_get_optional(&client->dev, "powerdown",
+					GPIOD_OUT_HIGH);
+	if (IS_ERR(gpiod))
+		return PTR_ERR(gpiod);
+
+	if (gpiod) {
+		gpiod_set_value_cansleep(gpiod, 0);
+		fsleep(10);
+	} else {
+		regmap_write(adau1373->regmap, ADAU1373_SOFT_RESET, 0x00);
+	}
 
 	dev_set_drvdata(&client->dev, adau1373);
 

-- 
2.47.0

