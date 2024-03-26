Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1EA53C30
	for <linux-sound@vger.kernel.org>; Tue, 26 Mar 2024 10:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711450486; cv=none; b=CjvMX27E16tRRKQlewM3YUJcPsy3rsgBLUZymBlXK8NwAbWVJHFqaONybfAxG4+HJsxlA9rZbP9I5vjaB4EdhJojt15ApWd+hadEDkIw4/LNRhLJH1Wpc0qpjXBfLM8XwpDy7NUN1YFMpFwsV5gKHV7/aAcDzjx6aDPdcsouxbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711450486; c=relaxed/simple;
	bh=XSnm+C1nDuZv8ACHR6TW5mpdhHiNy+THkei+tTtuni0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uGszrS7oZmBEsVoUYIiqkr5438wzJd+yaMF8mTNSqKmBVgXgRPh7IX91HVKd3CoT4bJacsm0oh2K84g0dxRZHyLdj0BztfsrClTYfXCmWxJ7/9ytJiZrEgGySpixCzOYuiSUxfuT0ER6gQ0AQ8p5ysPMS2auFKR9Mtg7n++ReYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=B3o5c6gQ; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="B3o5c6gQ"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42Q6ktLw006401;
	Tue, 26 Mar 2024 05:54:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=c
	g2ExQSlUl6TK2A9b6Qbr/F6lta6jp4WdUYMfj1xQBE=; b=B3o5c6gQQiVr9kwKH
	inU+XGYIAORQ3dlva+6FnN2DG61EPVHUB+xD8xQpUaH/8RnAkvzHm2ZxXGX0Qeag
	Rh9EBIdy0pCw2lv141xlU4v7wGTpa2P+2TxgR6VQInAc4cz4pdFybnK09zeJmJmQ
	1FojjWP9gYQtJEbhzIrJ9kJGxr9JTYdOvNPfQN5CEOn/YApT5dKYVnEX8XAS3Jtm
	IQ7NIL+p4Mm/CB4uADsRwH3Yg3IifImb+wLT+B1ntKSKFuJGqcHy+SgCrA8uLTkx
	E+1UMIi0jar7oLUBmOBpxq2+MrA/WfCKNdAC8FR/LTnlaoSBuO6wO+ubUnkMNZx2
	f25gw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3x1vfyd13g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Mar 2024 05:54:37 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 26 Mar
 2024 10:54:35 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4
 via Frontend Transport; Tue, 26 Mar 2024 10:54:35 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id ECB0D820241;
	Tue, 26 Mar 2024 10:54:34 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>
Subject: [PATCH] ASoC: cs42l43: Correct extraction of data pointer in suspend/resume
Date: Tue, 26 Mar 2024 10:54:34 +0000
Message-ID: <20240326105434.852907-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: NEaJDqAYYEktuuKwybFOc8vE10B7Ze_U
X-Proofpoint-GUID: NEaJDqAYYEktuuKwybFOc8vE10B7Ze_U
X-Proofpoint-Spam-Reason: safe

The current code is pulling the wrong pointer causing it to disable the
wrong IRQ. Correct the code to pull the correct cs42l43 core data
pointer.

Fixes: 64353af49fec ("ASoC: cs42l43: Add system suspend ops to disable IRQ")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l43.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index 860d5cda67bf..94685449f0f4 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -2364,7 +2364,8 @@ static int cs42l43_codec_runtime_resume(struct device *dev)
 
 static int cs42l43_codec_suspend(struct device *dev)
 {
-	struct cs42l43 *cs42l43 = dev_get_drvdata(dev);
+	struct cs42l43_codec *priv = dev_get_drvdata(dev);
+	struct cs42l43 *cs42l43 = priv->core;
 
 	disable_irq(cs42l43->irq);
 
@@ -2373,7 +2374,8 @@ static int cs42l43_codec_suspend(struct device *dev)
 
 static int cs42l43_codec_suspend_noirq(struct device *dev)
 {
-	struct cs42l43 *cs42l43 = dev_get_drvdata(dev);
+	struct cs42l43_codec *priv = dev_get_drvdata(dev);
+	struct cs42l43 *cs42l43 = priv->core;
 
 	enable_irq(cs42l43->irq);
 
@@ -2382,7 +2384,8 @@ static int cs42l43_codec_suspend_noirq(struct device *dev)
 
 static int cs42l43_codec_resume(struct device *dev)
 {
-	struct cs42l43 *cs42l43 = dev_get_drvdata(dev);
+	struct cs42l43_codec *priv = dev_get_drvdata(dev);
+	struct cs42l43 *cs42l43 = priv->core;
 
 	enable_irq(cs42l43->irq);
 
@@ -2391,7 +2394,8 @@ static int cs42l43_codec_resume(struct device *dev)
 
 static int cs42l43_codec_resume_noirq(struct device *dev)
 {
-	struct cs42l43 *cs42l43 = dev_get_drvdata(dev);
+	struct cs42l43_codec *priv = dev_get_drvdata(dev);
+	struct cs42l43 *cs42l43 = priv->core;
 
 	disable_irq(cs42l43->irq);
 
-- 
2.39.2

