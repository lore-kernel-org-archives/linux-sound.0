Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990401CA9B
	for <linux-sound@vger.kernel.org>; Thu, 25 Jan 2024 10:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706178688; cv=none; b=f8qdC6HAFvwPUWi+BwxnuRbwF2+HEZ5QqAYCYpbX1I3NezLQCo9aejHiQWNQt1HRCYHA8WoF8g3NtxbIaXM4PQSRBAJ31sw+p60tdGesHOnDfUrPYMtiRFaAo7Agd5au0qbKTHe9fO7pK+4YHuiVm14cr1oZwwb9qWLr/ji/Tro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706178688; c=relaxed/simple;
	bh=3c2WLm7voiPlhOCguvGRmsQTxZnmMPUZId3QqKoMQGs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uoc2BhKTeb4ILSGstGw6h/6/VUen5GU619BwXupdt45GLDc5TVvM16k+iNjHvIK8NotORhu1XA2R75PmyMSQbhHRLf37F6ozUy3cA0vi81RhUQGaxWDSM9mj+kfRRxQdjvvOtU9+dzinb592Xem8TnLIzFFb6TM+nVAhjLXPn5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=MijUqIEH; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="MijUqIEH"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40P6oFQ4010841;
	Thu, 25 Jan 2024 04:31:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=5NE00DJFrknWt0m9ssj1yTdWdZvVXFRtc5Ne25W/FF0=; b=
	MijUqIEH4wH3udgGfSed2JxAvnKmpyeu+sm4pX15RXa7q4WLla39jczzvNcrxp1j
	YK1aACM4xusRXrYrXcXoYRorw2UAOm76xkNAPifj3IwBB9LHbRyhdROcMJ0NpsyF
	Dq5fXHpl3nyIVis1MiAv4PzPxal0Q8yUMgGMFbMi4OGoFAJrG1FbkWpCzEbqRjgY
	dpXxuZFgx084jxpDZotH6otTMrISHFhUdnq9wDOvbLiNYhblcgDUQQ4wGTYYnrR9
	jC6wT2l5UfVoO7LkH4f8MyWs5yw+glxA+tUlI59ZntdIuSpn+IyPD82rzGHR+v4L
	HdGfUw3p3dRYTLCgwOEb3g==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3vtmfhj3jn-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jan 2024 04:31:20 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 25 Jan
 2024 10:31:17 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Thu, 25 Jan 2024 10:31:17 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 77528820248;
	Thu, 25 Jan 2024 10:31:17 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <andy.shevchenko@gmail.com>, <lgirdwood@gmail.com>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-sound@vger.kernel.org>
Subject: [PATCH v2 3/7] ASoC: cs42l43: Check error from device_property_read_u32_array()
Date: Thu, 25 Jan 2024 10:31:13 +0000
Message-ID: <20240125103117.2622095-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240125103117.2622095-1-ckeepax@opensource.cirrus.com>
References: <20240125103117.2622095-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: c3XXlWmtyJYH1UhrPLR1YCkVKEsjBD-A
X-Proofpoint-GUID: c3XXlWmtyJYH1UhrPLR1YCkVKEsjBD-A
X-Proofpoint-Spam-Reason: safe

Whilst reading cirrus,buttons-ohms the error from
device_property_read_u32_array() is not checked, whilst there is a
preceding device_property_count_u32() which is checked the property
read can still fail. Add the missing check.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v1:
 - Add () to funcs in commit message

Thanks,
Charles

 sound/soc/codecs/cs42l43-jack.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs42l43-jack.c b/sound/soc/codecs/cs42l43-jack.c
index 4f7a405b7e06a..67ccdc8bab6f6 100644
--- a/sound/soc/codecs/cs42l43-jack.c
+++ b/sound/soc/codecs/cs42l43-jack.c
@@ -106,8 +106,13 @@ int cs42l43_set_jack(struct snd_soc_component *component,
 			goto error;
 		}
 
-		device_property_read_u32_array(cs42l43->dev, "cirrus,buttons-ohms",
-					       priv->buttons, ret);
+		ret = device_property_read_u32_array(cs42l43->dev, "cirrus,buttons-ohms",
+						     priv->buttons, ret);
+		if (ret < 0) {
+			dev_err(priv->dev, "Property cirrus,button-ohms malformed: %d\n",
+				ret);
+			goto error;
+		}
 	} else {
 		priv->buttons[0] = 70;
 		priv->buttons[1] = 185;
-- 
2.30.2

