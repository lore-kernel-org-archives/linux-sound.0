Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E1612EBEA
	for <linux-sound@vger.kernel.org>; Tue,  6 Feb 2024 11:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707219555; cv=none; b=gX2pjjZglIEwb5A9KuXA38YLtg1NX/Rfxrx8R/qFIoWypPHlx1PP4LbJUzJxUqTXn+wY6+AMRgIFBZpMLlU/InQtHDJCK9SaspkkvcmMadeBPaxnf5iRCTCNLVav0kBQIppq/xFpm2g63sthGb9EJZkqwzFiSjiTTWRMk8jzK74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707219555; c=relaxed/simple;
	bh=VT/+OxIyoOo6H3eZuB5ps/bmedQcEHIv03PdGa9zsOc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LN3mG8jRMcWARePdYmzj46EZcnUUMFcl26IvqzZ5Z7EO3jSBH5r3m5I/kZjlCe8Nf5GpJyNouIFuTEYdFvIRxzujxW0HLbtcwNFf2RLy6perBPbcSoIlg2cYdv9UF7N270bBNDNNX0ntWLgdctudl+uus+mK5nZxlg0GjS9yYrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=l6+/Q2KZ; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="l6+/Q2KZ"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 416AS7om031521;
	Tue, 6 Feb 2024 05:38:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=U
	3jrdINzTbzsq4ZEzk9Ff+i2j8C7e/Bjf0XM9izjTuE=; b=l6+/Q2KZtA7BAUY41
	pBTB19kdyapEFJhsEUz2Y1Q7CRrZJOLHKUDYtxQsrQoZYkC8g9ImnEzQAc+w4qFz
	5x4PyOwfHd21l6GcL2NKlNGU+sFuTrDnl4JFieLpvOHvEACj+D5TQ2KKm+ARUTkb
	ejv1spRZGsBkKLJqWLUxF7zTakCGQ7wJi51zLj3dWjZrZbTbOvlYzk0XchHgNcl9
	nXfAb5dyZN5LciNpap9a/OZGjFKWw16PGLCIPfVUi/8mB3G7jOEpj/kCvbyafz5H
	8iI8s7xRwveH6i7aocFLXGQTbH2WxVwcWpN2R302tH5qhRqQtpG/UlbJ5mfbb0v8
	aZe/g==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3w1ks2bap3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Feb 2024 05:38:52 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 6 Feb
 2024 11:38:50 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Tue, 6 Feb 2024 11:38:50 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 2E016820241;
	Tue,  6 Feb 2024 11:38:50 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>, <linux-sound@vger.kernel.org>
Subject: [PATCH 1/2] ASoC: cs42l43: Handle error from devm_pm_runtime_enable
Date: Tue, 6 Feb 2024 11:38:49 +0000
Message-ID: <20240206113850.719888-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: uCVt0nHFigik6zGnt1jeAwXSiXzMyFIa
X-Proofpoint-ORIG-GUID: uCVt0nHFigik6zGnt1jeAwXSiXzMyFIa
X-Proofpoint-Spam-Reason: safe

As devm_pm_runtime_enable can fail due to memory allocations, it is
best to handle the error.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l43.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index 256767ef4c03..f1e119277622 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -2283,7 +2283,10 @@ static int cs42l43_codec_probe(struct platform_device *pdev)
 	pm_runtime_use_autosuspend(priv->dev);
 	pm_runtime_set_active(priv->dev);
 	pm_runtime_get_noresume(priv->dev);
-	devm_pm_runtime_enable(priv->dev);
+
+	ret = devm_pm_runtime_enable(priv->dev);
+	if (ret)
+		goto err_pm;
 
 	for (i = 0; i < ARRAY_SIZE(cs42l43_irqs); i++) {
 		ret = cs42l43_request_irq(priv, dom, cs42l43_irqs[i].name,
-- 
2.30.2

