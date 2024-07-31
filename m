Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2055B1B1503
	for <linux-sound@vger.kernel.org>; Wed, 31 Jul 2024 13:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722433163; cv=none; b=g8pfi+GHpo+CCmP9dJVY/0kCG8kQ+Si3u9twoHH9NYNb81KaJr/Tougimf6KDQM2tuQJBnepJLsa/4l+YCcnTc0CAEK/kgDX7mS8C1Ixgjgt6bqCdczBieUAcivrsxXVDauDxzlNaumXSpap/wkl2h+HYA1AlqZEnHs0hHgMO3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722433163; c=relaxed/simple;
	bh=lDiGNW+wpzqSfH3yDNtxZMX4vL2klH7bgyAQczyjYeE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BXP+SvbTUPkJTYbkR0pbmgkdcSrxftDSJLPpiaYuLzvhHiLqTZkYIUqddNQ7pqA0xt2cbFxhByrFKVW30sYDDYp0GP+2y9udiR2VAwbwY+UyLKfLdT3lTti0gcMZSwpPvX4OeMzkJTDpRmucG90A+WuGFSesfTodXMPF5suYlNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Ctv9Enfx; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Ctv9Enfx"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46V4lq21024935;
	Wed, 31 Jul 2024 08:39:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=Rh5jgZggqSRQKQ0ZFrEVWOjTyeku5L57e7FLHq8p/cU=; b=
	Ctv9EnfxP5NX+G4Wq7SvkRjSvw0QBg65m6KT921yIeXi4mXpYNLy0mT478O4G37N
	F26RRx3I+YheBZ1WVMeybho/UoG2rBQkhk02o5ybk6qhtmJb6esfmA1DxUAU/83L
	bRfPWak6cKfNKUjdHhFS/+qwfq89IlW+zWWfJZUfVikGEK7RCC27mQTpgPQL9TRe
	CEZnz+juHP1IiLXoQ37M2h1iMKruxNMgqWDO98nfdy6VQdVStSYnnlwyVa6mdTFE
	TCZNS0B37QWQiRdyPoGFeyTHYSl81GybkGImqnjMiOR7Gj0GobrzQoRr3ro3VH1P
	g4Pa2GiHYB6PJsAEJaVzNA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 40mx9ymr5u-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jul 2024 08:39:08 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 31 Jul
 2024 14:39:05 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Wed, 31 Jul 2024 14:39:05 +0100
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 3C7AC82024B;
	Wed, 31 Jul 2024 13:39:05 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>
CC: <lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>,
        <patches@opensource.cirrus.com>
Subject: [PATCH v2 3/4] ASoC: cs35l45: Use new snd_soc_component_get_kcontrol() helper
Date: Wed, 31 Jul 2024 14:39:04 +0100
Message-ID: <20240731133905.1254796-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240731133905.1254796-1-ckeepax@opensource.cirrus.com>
References: <20240731133905.1254796-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: JUKKl37_-MbMH4ROteYz0vRO8HR7oeh-
X-Proofpoint-ORIG-GUID: JUKKl37_-MbMH4ROteYz0vRO8HR7oeh-
X-Proofpoint-Spam-Reason: safe

No longer any need to hard code the addition of the name prefix, use the
new helper.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

New since v1 of the series.

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

