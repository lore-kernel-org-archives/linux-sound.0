Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418EB1EB4BD
	for <linux-sound@vger.kernel.org>; Thu,  1 Aug 2024 10:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722506676; cv=none; b=DryIHPwd3WD3ZaHvenXd18JcR5PEgqN3wTmv60yH9ghBrlhqUdLcIv5vE7OGz552YSC7efhVzRdHFbazAntDFX0hpHHxPENYge50yWwPrkV8V7tRCbKncmUNdylzQoPI7SbnXusKfvwnUyth94wCJJZMae1Y4rZGW06lNfXcQW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722506676; c=relaxed/simple;
	bh=R3f5L/FwBwcqABV/TedChclC/Yh0it+s1YziXSXlVo0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YQi5SJo3n1TDVHElX9mP33snRRNmwrHzifWil4UoCIwABSKe9nfSrBZ14csXC7bc3UgQAF9jim+d1ZObEY7ovkSnNPD76NGoYreAPbPrgnwpFNbNLqP7RWlWD992yIjDRoauwPp9VYXTBavVVV9nZDQRA8M0L1yZaVcJHcSc+jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=HtvRvm2M; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="HtvRvm2M"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46VI6V0S018617;
	Thu, 1 Aug 2024 05:04:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=tcgwggdtoWBAPNGedmXqNjPdVZO8b39UZh+W8UyMLO4=; b=
	HtvRvm2MCCreopMlolVHdZzzHUi/d9hXuo5uZIV9FNNjO8j3/tJls1Y/TJGQzvJu
	O/dDpP4atL9ztCnRISshSBlOHhPpySXuSIhjQVjLgN3JD8Y3SHg7ok/RziAxJCOZ
	7J0W5OaSg1e3GmCnZj8316i6BwCeojmcdjm4Agbj3K/w5YLujRdu8HlxGTNKjgl0
	Jq1nyTOjS2IKbITmjIEt7SUr7yvgz/6AcwXxzQA4oIKrUHG1FutvGiESkGY7lzsH
	4q4q1lTxSdy3ehZLosbC153nJTMjdvwVAHyMThkhL2n03kEVPBSVUFIQBnXzJ6ud
	FAYlwyKd/mP7ZN1xy15IpA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 40qjw9a356-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Aug 2024 05:04:15 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 1 Aug 2024
 11:04:13 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Thu, 1 Aug 2024 11:04:13 +0100
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 427DE82024B;
	Thu,  1 Aug 2024 10:04:13 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>
CC: <lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>,
        <patches@opensource.cirrus.com>
Subject: [PATCH v3 3/4] ASoC: cs35l45: Use new snd_soc_component_get_kcontrol() helper
Date: Thu, 1 Aug 2024 11:04:12 +0100
Message-ID: <20240801100413.1620481-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240801100413.1620481-1-ckeepax@opensource.cirrus.com>
References: <20240801100413.1620481-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: YWKcvRltJdCOlBD_GnZZwKDqZ6RIn2Bi
X-Proofpoint-ORIG-GUID: YWKcvRltJdCOlBD_GnZZwKDqZ6RIn2Bi
X-Proofpoint-Spam-Reason: safe

No longer any need to hard code the addition of the name prefix, use the
new helper.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No change since v2.

Thanks,
Charles

 sound/soc/codecs/cs35l45.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/cs35l45.c b/sound/soc/codecs/cs35l45.c
index 2392c6effed85..1fefdb80d758c 100644
--- a/sound/soc/codecs/cs35l45.c
+++ b/sound/soc/codecs/cs35l45.c
@@ -176,17 +176,10 @@ static int cs35l45_activate_ctl(struct snd_soc_component *component,
 	struct snd_kcontrol *kcontrol;
 	struct snd_kcontrol_volatile *vd;
 	unsigned int index_offset;
-	char name[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
 
-	if (component->name_prefix)
-		snprintf(name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN, "%s %s",
-			 component->name_prefix, ctl_name);
-	else
-		snprintf(name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN, "%s", ctl_name);
-
-	kcontrol = snd_soc_card_get_kcontrol_locked(component->card, name);
+	kcontrol = snd_soc_component_get_kcontrol_locked(component->card, ctl_name);
 	if (!kcontrol) {
-		dev_err(component->dev, "Can't find kcontrol %s\n", name);
+		dev_err(component->dev, "Can't find kcontrol %s\n", ctl_name);
 		return -EINVAL;
 	}
 
-- 
2.39.2

