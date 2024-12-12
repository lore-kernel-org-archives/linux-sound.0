Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20D8211471
	for <linux-sound@vger.kernel.org>; Thu, 12 Dec 2024 10:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734001093; cv=none; b=AKm5IHmvgCEdvY+d++zIL5J3ji6WbBSUpFSOQ7S8lBOTFZrh7UcrPujcNiO4STfmA6efe9ZivawjDAYNL/WXojzVvcFfk/CN+sCZ2ZT1VWeyk2YiRc8ERE891P/FTaRH0WKUTZ3Gem6HH+mZvtuqe7kIpxQ3MIsWN16WwaJUT6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734001093; c=relaxed/simple;
	bh=pJZG5b57VUIZ29v8N70t0eK1UWgPiXa/H6k73QqPLqc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Q9rrOv+PDWc1mGpg6gwGUs7NmeMpIi+HC8ciOyPOVx7XSZe+81hfBBXc4EsY6dzuz3Z1XNMA46fsfTDaXQ1xe2xfWN7f/387c565iJ0CQxszH/bjPoA7fPtwf3UQQXnteo2t/r/L1EanpLiUp945Y4ivPyCfEf3fZ+7gaTAyh/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=gI/p69FE; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="gI/p69FE"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC5o3UG029256;
	Thu, 12 Dec 2024 04:57:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=t2U7R+JHsq3jN1Ag
	ThgP/HnwOGwJoNMjDlGqGBohPpE=; b=gI/p69FEWDzKpCr6ToDCck8A1qRoBEkK
	L8Z94psPbX9XEbEVpne0K3Om45+dRcjBqwBWQGHXFCmkHs5gWZemv3wM2q071Oqk
	2ZeklH0gRUrosjJV/Ia0GHPIcGnLU6lCCOHb66GcUGgWidtRyoa46U4h5DNnASSf
	YEQinLKeQuWK6Pr1J15hcKZf9OXvRWh8Q0roYmWbXoyJl9bkGZWB72k3rL+OKXkj
	4mhhBeOYHRXSvljcqzQj+oja63WAS+ZRRon/GEYRDAzrlIEXAfCdlJJJVEL2G4g1
	WSwDb1FYNrdOwYgoA9IGKJNof+cv+L3ubrJmDYihxA+JUHyc3HCiKg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 43cknkep31-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 04:57:44 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Thu, 12 Dec
 2024 10:57:42 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.13 via Frontend Transport; Thu, 12 Dec 2024 10:57:42 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id D5A70822548;
	Thu, 12 Dec 2024 10:57:42 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <cezary.rojewski@intel.com>, <liam.r.girdwood@linux.intel.com>,
        <peter.ujfalusi@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
        <ranjani.sridharan@linux.intel.com>, <kai.vehmanen@linux.intel.com>,
        <pierre-louis.bossart@linux.dev>, <linux-sound@vger.kernel.org>,
        <patches@opensource.cirrus.com>
Subject: [PATCH] ASoC: Intel: sof_sdw: Add space for a terminator into DAIs array
Date: Thu, 12 Dec 2024 10:57:42 +0000
Message-ID: <20241212105742.1508574-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: OdCmvvXaKz1RmAO2e8HlUfr-5N5F-i4o
X-Proofpoint-GUID: OdCmvvXaKz1RmAO2e8HlUfr-5N5F-i4o
X-Proofpoint-Spam-Reason: safe

The code uses the initialised member of the asoc_sdw_dailink struct to
determine if a member of the array is in use. However in the case the
array is completely full this will lead to an access 1 past the end of
the array, expand the array by one entry to include a space for a
terminator.

Fixes: 27fd36aefa00 ("ASoC: Intel: sof-sdw: Add new code for parsing the snd_soc_acpi structs")
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/intel/boards/sof_sdw.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 0652d17a81ddc..53410fb446736 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1072,8 +1072,12 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 		return ret;
 	}
 
-	/* One per DAI link, worst case is a DAI link for every endpoint */
-	sof_dais = kcalloc(num_ends, sizeof(*sof_dais), GFP_KERNEL);
+	/*
+	 * One per DAI link, worst case is a DAI link for every endpoint, also
+	 * add one additional to act as a terminator such that code can iterate
+	 * until it hits an uninitialised DAI.
+	 */
+	sof_dais = kcalloc(num_ends + 1, sizeof(*sof_dais), GFP_KERNEL);
 	if (!sof_dais)
 		return -ENOMEM;
 
-- 
2.39.5

