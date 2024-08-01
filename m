Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3EB170A30
	for <linux-sound@vger.kernel.org>; Thu,  1 Aug 2024 10:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722506684; cv=none; b=evy3v2jX2MNGVrOda7oGjmeNJM1VFUDAuu2ll+GsTZh2Fto1nUHkOiaXseWR6KKajyb+3mkpwS63LzNLKxu4sDDjukHtbBjAWaL2Cla5soIYrn43GrhKYiQtw9h2pkLKvxUB4A661MSXVQR0SbgkuQYwLlVzipy0VI1M0/qUR2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722506684; c=relaxed/simple;
	bh=cH5eDuobalJxLJ/mr3WuJttYJjRw1YMPr7S0eAcCCa0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=a3u0Go+CjU+s2/VhMv1CY214f4hKEb+Wlh1F5Y8825mo3hyfkSs7+4gASzoYZ5KFeCdBpkbXzHuWBKKcG5dkoX+IgvoT2VUlRHcv24hqymtmbwplZrHKSj6YmGZyuG5pw+Ng12HnFUE+oa56gM8KahL8ifuo6JzV0uHW9JxqX5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Ilf7xjJg; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Ilf7xjJg"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4714lo5e015269;
	Thu, 1 Aug 2024 05:04:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=2WX+1YjFQVoWULtA
	y6k0/ProlB4jPdKOFcK9Azt/TVo=; b=Ilf7xjJgSu3C1CAS/e+jToTKAU6izFhh
	JToPoYl+5kRt7qwS08x6wdV1NWBTi9hGH1iPGAamZSXxwRNuQTcVSLgN06vaffqu
	UAcKYyiA+wr3kjCA12jT0uOCNVi9xdFNoee3L3QQg6XgjFaKeWmrKeBWcjNm9fq2
	j3e4ubJu6ALRHLYrawahh4IWzTmFsFbI8GlbF+f4JYXa6eMipU36mOF7u5YLbd9n
	VnfaHGBrZS5QMGX5RgzDkBuPz0sdEoe84XWHC/hyUqpV4pT6OyS8hULADb2i1rJV
	HIQvTq7Y8kSET1NqWQr1z+zZF3XSGZ5o1UcK0aoWW/L4xajCgJQxCA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 40mx9ypeqe-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Aug 2024 05:04:16 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 1 Aug 2024
 11:04:13 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Thu, 1 Aug 2024 11:04:13 +0100
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 32207820244;
	Thu,  1 Aug 2024 10:04:13 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>
CC: <lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>,
        <patches@opensource.cirrus.com>
Subject: [PATCH v3 1/4] ASoC: cs42l43: Remove redundant semi-colon at end of function
Date: Thu, 1 Aug 2024 11:04:10 +0100
Message-ID: <20240801100413.1620481-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: uy1aMvcDqTVUrPM2i5ii0102UqFK56Qw
X-Proofpoint-ORIG-GUID: uy1aMvcDqTVUrPM2i5ii0102UqFK56Qw
X-Proofpoint-Spam-Reason: safe

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No change since v2.

Thanks,
Charles

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

