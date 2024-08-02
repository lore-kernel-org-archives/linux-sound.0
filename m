Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9C01DE876
	for <linux-sound@vger.kernel.org>; Fri,  2 Aug 2024 10:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722596285; cv=none; b=lBxBHYnXtvRlVrtTrCHCkOhPAe2sMlmA3jWi8x5liHQlRj80KzJKHcE5KHN/viX+u9Dr4G5+VXwKyTfXOdU7kPTYQMKS6o3TJ9e7CBQIFuVdX7rhG6JfxwZpcIvBZPt1IStuAvgCw6zdCUq8P7EaUxoupxb9WEQZ0jnXbmxp6hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722596285; c=relaxed/simple;
	bh=XMdyBW1QYng94NZup6ViMD07z+zyRmXeu1ReRiu03+s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X1KwJ7lezlunxeDnKNQtl7uQHQmUbfnvuxLRqIRDI0AL7GOzxEyBASgkG/Ea62j+7aKVT+FMIjcLcmbsFxThB2asz1cJfdibceXcrmuqmfiR63NEu82lMD6r6QB16jE6eKxC0tva6+uA2gYSPPvZYd2Pte5XnDbthfMTwaNKxF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=pB3YfN2f; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="pB3YfN2f"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4726i5ar032551;
	Fri, 2 Aug 2024 05:57:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=IzfIuA3VilkZVVufLKz8qPusdmBnyiJGA9ylU8aAMjo=; b=
	pB3YfN2fvfMOY1PFifrhIMXFP8YJ1OF8xrlkmta0iyJX9JvAEtkQ9RuPTmRZbEbh
	0dFUbA+zdH1GqcmdAf0zdd9lmsLhi2gBLDs61T0d6fVhUr2ESSYfGbSqGh2udnlL
	Vq2mnsKSVaN3RVFfRBTfe1WKra57I+50paOGUyO6/zJKDokfstT0zw1fAxaNTSi1
	Ofx6Xuozb7s81hqqE+yRNCN7bU2uVsgorjMA3yQlAmGZgRNbSSF4xZrEyvGd/P+X
	nnpaKjOZVfJEdIsD0WczY93oLauT58KD5Vjg4uuMSo9wuTbsf/vANn6eok4Z7nZ5
	E8KPgjxT51s/4KB7WQ4y+w==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 40rjdxrj1y-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Aug 2024 05:57:37 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 2 Aug 2024
 11:57:34 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Fri, 2 Aug 2024 11:57:34 +0100
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 60839820258;
	Fri,  2 Aug 2024 10:57:34 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>
CC: <lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>,
        <patches@opensource.cirrus.com>
Subject: [PATCH v4 3/4] ASoC: cs35l45: Use new snd_soc_component_get_kcontrol_locked() helper
Date: Fri, 2 Aug 2024 11:57:33 +0100
Message-ID: <20240802105734.2309788-4-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240802105734.2309788-1-ckeepax@opensource.cirrus.com>
References: <20240802105734.2309788-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: _1NziNXN_5jn7xcjZX1bImW2jeAwX_zZ
X-Proofpoint-ORIG-GUID: _1NziNXN_5jn7xcjZX1bImW2jeAwX_zZ
X-Proofpoint-Spam-Reason: safe

No longer any need to hard code the addition of the name prefix, use the
new helper function.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No change since v3, unless one counts adding the missing helper in the
previous patch.

Thanks,
Charles

 sound/soc/codecs/cs35l45.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/cs35l45.c b/sound/soc/codecs/cs35l45.c
index 2392c6effed85..1e9d73bee3b4e 100644
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
+	kcontrol = snd_soc_component_get_kcontrol_locked(component, ctl_name);
 	if (!kcontrol) {
-		dev_err(component->dev, "Can't find kcontrol %s\n", name);
+		dev_err(component->dev, "Can't find kcontrol %s\n", ctl_name);
 		return -EINVAL;
 	}
 
-- 
2.39.2

