Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE28D16C86F
	for <linux-sound@vger.kernel.org>; Wed, 31 Jul 2024 13:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722433164; cv=none; b=M+M2s1b6PJDtyklIe2t2G9B7JDWJ1S4N4/lXQUO8hdU/W4f2hNHjsflfO3Umo+JH+VcW3V3DYmuGtg6bux/10wVnfKWxgHrlpmyqCUIcjc5fgJGol+k7SB8LCj77a4hO3qTvbjzkfDEaUW1Bguc1ULXp9sjKtB5OT3bprRtjy0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722433164; c=relaxed/simple;
	bh=+TVw+TlndHwH7HlLLEFpqEbVDC1A4rLjBFXgr61a4hk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=crCcd1FljPSeBtz3w58K2Sj92aQ8AYZsNI3uzmfdP7Kz9cep5FHq1XjiV9OSJpigSK6a/fiiZQTYYRVfbh2k2fD/QArVyYT9w42zRFQu86IpQ8ndpscckO0GDVcIHB5VT5yTord02BfQcf1QubDSbfJf2RIHpEm1pis+NSWHOxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=XKdu2Kqv; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="XKdu2Kqv"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46V5wooq020807;
	Wed, 31 Jul 2024 08:39:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=o2Oyi+avtfQT/pZF
	m9bAod35ADQ77tXIbJBBdb2HNDY=; b=XKdu2Kqv2KbeUZNl7hF4Wpmu9uDBsDDr
	m+raCfch7steGTfy55P3TqapuI4bg75BgM15I/CzxTDm5JWJjjaJJoXMX2CxY/YJ
	MC/k1Z/m5FHk33JmYAM3JSRzpVt0PQYQtyvFM+kzqoRESh05cDW35AlEQHdZLwkb
	i8KxLl/TdW5LS1rpCcjlajrux+fsjmtpQlAsfUwpdriLNvj0FG+r8bbbUIi6MMW2
	vMBS0mjLhYEXWz9vsh4h+TPp8GAzFYkEmxR35G60Y7USQPyJFmHO78EZM/7EC4NA
	luB00eecNIagvFcym5TPIMjcitpPbysXa+mUYR7qyrmnQ3M60rV8iQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 40mx9ymr5t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jul 2024 08:39:07 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 31 Jul
 2024 14:39:05 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Wed, 31 Jul 2024 14:39:05 +0100
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 29317820244;
	Wed, 31 Jul 2024 13:39:05 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>
CC: <lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>,
        <patches@opensource.cirrus.com>
Subject: [PATCH v2 1/4] ASoC: cs42l43: Remove redundant semi-colon at end of function
Date: Wed, 31 Jul 2024 14:39:02 +0100
Message-ID: <20240731133905.1254796-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: F3wNwgVdls5xMaStIfMzO8tKdwSB0dJ8
X-Proofpoint-ORIG-GUID: F3wNwgVdls5xMaStIfMzO8tKdwSB0dJ8
X-Proofpoint-Spam-Reason: safe

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

New since v1 of the series.

 sound/soc/codecs/cs42l43.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index 92674314227c4..80825777048a6 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -608,7 +608,7 @@ static int cs42l43_sdw_hw_params(struct snd_pcm_substream *substream,
 		return ret;
 
 	return cs42l43_set_sample_rate(substream, params, dai);
-};
+}
 
 static const struct snd_soc_dai_ops cs42l43_sdw_ops = {
 	.startup	= cs42l43_startup,
-- 
2.39.2

