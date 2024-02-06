Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2C812B14E
	for <linux-sound@vger.kernel.org>; Tue,  6 Feb 2024 11:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707219549; cv=none; b=DTWF++CW3eN9azEj/ksCJmrpw3FYD4dv+oIEw60kEFFLhDVECARbHZxytgiWucVMR/S7aNpSkZLuf0JNzKkewOsXaH7vN2Bv0N77PmOPST+IG4ZgzzfsJprTl1U5Ur/6hEnST8b2oQrSEC62NLD68FZ7yf2fck2fNhqINhT52QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707219549; c=relaxed/simple;
	bh=ZNJPTIPAK8/V1RPK0l1VKA3oYC1jOJG0SNejQn09bpk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N1Ac51k+81hZ4ltmJ9AyVpBYT5tqsstZvCqexY2TXDIKTOjwqtKYZSzZ+LL1KKv2xAZCuzNpwwxX85vG+PNcMsSoPNAT4+ZyrqOaCKtA5MwUOGKN+746s8g69+U0JBwqxpkyxXoM9CwwiAZGo+wxa+AlAiYPyKOLYVeXSa+kqwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=a7DcBj9a; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="a7DcBj9a"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4169iwBg025133;
	Tue, 6 Feb 2024 05:38:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=269NzVQgDVeR3rcbff3E/lSbplkfYeX91pPkIS0tryE=; b=
	a7DcBj9aKE/QVCo4IRLUoyZXzK26nJjifSrkgAM8RbWA5bc4WJP+SVTrwS9oZf6r
	EFCaF1hg4UM+AAD2B6k2wqkU2Y9EFoEpTvEW5WZNnq6m5w0FOzALgzB8CVM0DtqB
	/k41LC2dMlAVSPBZkX0g9S0IX2P/NylMmJtmjjuiG/MDa2nSxaDq7CEzu/YY/Zy/
	TjdkAFQN5s2VxK4lKonX24QVot11frbaFtqrApB2gB3W5tLVqQJp+jgpXuLtCsh3
	IuzO/bMEMhBSu2tJgp0LYsYHYLw8EmXT7uiq60XtvfwQRPxH3jht3ZVVMV1b3+8z
	5Ae4SfFdrQbHa5RVi2LPEA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3w1jsnk8w0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Feb 2024 05:38:57 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 6 Feb
 2024 11:38:50 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Tue, 6 Feb 2024 11:38:50 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 3BDF9820247;
	Tue,  6 Feb 2024 11:38:50 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>, <linux-sound@vger.kernel.org>
Subject: [PATCH 2/2] ASoC: cs42l43: Add system suspend ops to disable IRQ
Date: Tue, 6 Feb 2024 11:38:50 +0000
Message-ID: <20240206113850.719888-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240206113850.719888-1-ckeepax@opensource.cirrus.com>
References: <20240206113850.719888-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: rAeNZ1QXncETRBkhkBbFjd6sP5pX4lx5
X-Proofpoint-ORIG-GUID: rAeNZ1QXncETRBkhkBbFjd6sP5pX4lx5
X-Proofpoint-Spam-Reason: safe

The IRQ should be disabled whilst entering and exiting system suspend to
avoid the IRQ handler being called whilst the PM runtime is disabled.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Apologies for the churn on this.

It seems there is no new style macro that provides all the required
callbacks, and I am a little nervous to add one. It looks like
there are quite a few drivers in a similar situation, so for now
I have just swapped things back to the old style PM macros, and if a
conversion is planned this can be caught in that.

Thanks,
Charles

 sound/soc/codecs/cs42l43.c | 45 +++++++++++++++++++++++++++++++++++---
 1 file changed, 42 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index f1e119277622..e734b21849a0 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -2362,8 +2362,47 @@ static int cs42l43_codec_runtime_resume(struct device *dev)
 	return 0;
 }
 
-static DEFINE_RUNTIME_DEV_PM_OPS(cs42l43_codec_pm_ops, NULL,
-				 cs42l43_codec_runtime_resume, NULL);
+static int cs42l43_codec_suspend(struct device *dev)
+{
+	struct cs42l43 *cs42l43 = dev_get_drvdata(dev);
+
+	disable_irq(cs42l43->irq);
+
+	return 0;
+}
+
+static int cs42l43_codec_suspend_noirq(struct device *dev)
+{
+	struct cs42l43 *cs42l43 = dev_get_drvdata(dev);
+
+	enable_irq(cs42l43->irq);
+
+	return 0;
+}
+
+static int cs42l43_codec_resume(struct device *dev)
+{
+	struct cs42l43 *cs42l43 = dev_get_drvdata(dev);
+
+	enable_irq(cs42l43->irq);
+
+	return 0;
+}
+
+static int cs42l43_codec_resume_noirq(struct device *dev)
+{
+	struct cs42l43 *cs42l43 = dev_get_drvdata(dev);
+
+	disable_irq(cs42l43->irq);
+
+	return 0;
+}
+
+static const struct dev_pm_ops cs42l43_codec_pm_ops = {
+	SYSTEM_SLEEP_PM_OPS(cs42l43_codec_suspend, cs42l43_codec_resume)
+	NOIRQ_SYSTEM_SLEEP_PM_OPS(cs42l43_codec_suspend_noirq, cs42l43_codec_resume_noirq)
+	RUNTIME_PM_OPS(NULL, cs42l43_codec_runtime_resume, NULL)
+};
 
 static const struct platform_device_id cs42l43_codec_id_table[] = {
 	{ "cs42l43-codec", },
@@ -2374,7 +2413,7 @@ MODULE_DEVICE_TABLE(platform, cs42l43_codec_id_table);
 static struct platform_driver cs42l43_codec_driver = {
 	.driver = {
 		.name	= "cs42l43-codec",
-		.pm	= pm_ptr(&cs42l43_codec_pm_ops),
+		.pm	= &cs42l43_codec_pm_ops,
 	},
 
 	.probe		= cs42l43_codec_probe,
-- 
2.30.2

