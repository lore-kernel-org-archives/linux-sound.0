Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B007E782
	for <linux-sound@vger.kernel.org>; Wed, 24 Jan 2024 16:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706115375; cv=none; b=ZGNq8g30FyP/g/QUg8B2grQOkOG4wvrlPCIzYudE58zp29Upd5wFgYqzAtkkRTy2Trp2KhrP0gJ8UYqPju/9z2KqAJL5rxGb4AXZ03klgWQkFqzbALtQD5vcFi347kDgAlDneaQOssonPXPetZJZ7407W7xY3ctFy9cDmzBBccE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706115375; c=relaxed/simple;
	bh=rFXo5D5SioFkDyK6VjhPmdr1bMROSvMpZp+Tvd6jOS0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PwncMbikqYAGxtOe0gSyqkV31lM6QWk0BimFLPtI5GDNmkvK2ptm37RXU8w1dyTOGQJepy7eOUzGRh7mpGAWfgQ8qP459nMl0vhlI2c3tuad7vDRkVOx+3u0NX04SHBFFGjsHephZsTf+bRWaU5bIP0ZMjbJ1ewVkvWRdefMRD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=c291I6d4; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="c291I6d4"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40O7L4kv000450;
	Wed, 24 Jan 2024 10:56:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=/bB0aWLQIcUMUN+oS7zZcyIt9YxzCPVG8bPGBsbkSkE=; b=
	c291I6d4a+NvHKcJuTAtmvHKkXG8bse2IpVDpZ/QOWFV1EEKA5KdH8SZ5vK6OAgA
	MwgA+EFdnaHdOlOt6M8CbalowrFtSHpCSg9yQSSxGQqHpmhH3y1J/f1KASJK0A0Z
	CWKpdEOLOFW6/Hd4fVRKLNYmKD202v3Ew4IiKXKewP/A/z/9Sg7cdm5+BYEkfurj
	gNxMGbiq2bjF484RxotHy+WCvg24v1CZLobjVt0hQfqqixeNUTnyZt/BIzFtuUG2
	UwuZj1bP7KrV570S/sqbUQG+OMB0YHdRAIxeDfdsrL6BMWLxifp9tc8SMoTzbIoF
	Xmpsc+7/MwdSOt8e0n9Y2Q==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3vtmfhh44s-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Jan 2024 10:56:03 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 24 Jan
 2024 16:55:59 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Wed, 24 Jan 2024 16:55:59 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id E52D4820248;
	Wed, 24 Jan 2024 16:55:58 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <andy.shevchenko@gmail.com>, <lgirdwood@gmail.com>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-sound@vger.kernel.org>
Subject: [PATCH 3/7] ASoC: cs42l43: Check error from device_property_read_u32_array
Date: Wed, 24 Jan 2024 16:55:54 +0000
Message-ID: <20240124165558.1876407-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240124165558.1876407-1-ckeepax@opensource.cirrus.com>
References: <20240124165558.1876407-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: o9VnvcpiXupZQOhTmdGd170qep8uftSS
X-Proofpoint-GUID: o9VnvcpiXupZQOhTmdGd170qep8uftSS
X-Proofpoint-Spam-Reason: safe

Whilst reading cirrus,buttons-ohms the error from
device_property_read_u32_array is not checked, whilst there is a
preceding device_property_count_u32 which is checked the property read
can still fail. Add the missing check.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l43-jack.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs42l43-jack.c b/sound/soc/codecs/cs42l43-jack.c
index d0569577a8699..147c7017fd8b6 100644
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

