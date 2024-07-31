Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205C51B1505
	for <linux-sound@vger.kernel.org>; Wed, 31 Jul 2024 13:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722433164; cv=none; b=n/IWOGKysn84hzpSk62rmrbWzl0OzdMDveJ4E2AEZf2dL3ymPGdJVlvWO0JKCjxLDAKcKI4/p0r/2LU31d6E64UzC+s9lcWOsjEqMYz1NjFEnuIHik8BNBqBlBBVAGMNIsetp38PVWRI0c6ywHF8xemSKwxHO3gqOY3fZ4wdNok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722433164; c=relaxed/simple;
	bh=peox8ipt1x98YyJnnqRypBM3sWyJIytax119sPS2OHk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K7VR73wEBEWFqYAABS9OdpJxDlarjvacpJ77l4nxIcl+tKHHFMPkziiUyf30e4YApOvtVkBx8ZUAwoNXRyPK5hmMd7FeznI25SRgEy362oMeUXuw8TEEAEdyDoMS6WSg3ebOwrqWC1Uu/GM7RHCJo72WPczsu0Bp7zcF53WZ0bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Z07NpMsu; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Z07NpMsu"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46V4lq20024935;
	Wed, 31 Jul 2024 08:39:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=Klyu//OpdFTJnJxf8+HRlP6ywB2NW5PJUxIZ/7SrSv8=; b=
	Z07NpMsuTrd0gsaDNjQRVdns3KxQgiDTxQz3YQvi5PXIOyAXVkXNUgH9ohoDao7A
	iEWtrNP7gTqCvzY26f/D9jsKEvtYRyMdcJ2ObY7PTfcie2F5iFUrxWp/B0bl0eoY
	CY59WCqQtoXqnu8wQ0wOLGcnnMtgqg3+/AUXrCSxydq9OTNOjT5X/aBWPul0gfEA
	hflkTB8+TuBCmE4rlwtvWtn62xkZyYnwby+rZUgNFmFti20QsPTj6AE5ItnqmJQZ
	F0aQNeSXDNQKfwbSm99kCENu9cFP6/oA8VlNIyKM+hbs1ni+hoOVrzDv16xIlGOB
	GmkvaoyEQP5v/bZW193MlQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 40mx9ymr5u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jul 2024 08:39:07 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 31 Jul
 2024 14:39:05 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Wed, 31 Jul 2024 14:39:05 +0100
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 381CC820247;
	Wed, 31 Jul 2024 13:39:05 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>
CC: <lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>,
        <patches@opensource.cirrus.com>
Subject: [PATCH v2 2/4] ASoC: soc-component: Add new snd_soc_component_get_kcontrol() helper
Date: Wed, 31 Jul 2024 14:39:03 +0100
Message-ID: <20240731133905.1254796-2-ckeepax@opensource.cirrus.com>
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
X-Proofpoint-GUID: PSUL5OdijzUFNtJdPN3EMHbb8OQWmQOJ
X-Proofpoint-ORIG-GUID: PSUL5OdijzUFNtJdPN3EMHbb8OQWmQOJ
X-Proofpoint-Spam-Reason: safe

Add a new helper function that returns a kcontrol by name, but will
factor in the components name_prefix, to handle situations where
multiple components are present with the same controls.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

New since v1 of the series.

 include/sound/soc-component.h |  2 ++
 sound/soc/soc-component.c     | 16 ++++++++++++----
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index ceca69b46a821..61534ac0edd1d 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -462,6 +462,8 @@ int snd_soc_component_force_enable_pin_unlocked(
 	const char *pin);
 
 /* component controls */
+struct snd_kcontrol *snd_soc_component_get_kcontrol(struct snd_soc_component *component,
+						    const char * const ctl);
 int snd_soc_component_notify_control(struct snd_soc_component *component,
 				     const char * const ctl);
 
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 4d7c2e3c929a9..1c0971823fb4d 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -236,11 +236,10 @@ int snd_soc_component_force_enable_pin_unlocked(
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_force_enable_pin_unlocked);
 
-int snd_soc_component_notify_control(struct snd_soc_component *component,
-				     const char * const ctl)
+struct snd_kcontrol *snd_soc_component_get_kcontrol(struct snd_soc_component *component,
+						    const char * const ctl)
 {
 	char name[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
-	struct snd_kcontrol *kctl;
 
 	/* When updating, change also snd_soc_dapm_widget_name_cmp() */
 	if (component->name_prefix)
@@ -248,7 +247,16 @@ int snd_soc_component_notify_control(struct snd_soc_component *component,
 	else
 		snprintf(name, ARRAY_SIZE(name), "%s", ctl);
 
-	kctl = snd_soc_card_get_kcontrol(component->card, name);
+	return snd_soc_card_get_kcontrol(component->card, name);
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_get_kcontrol);
+
+int snd_soc_component_notify_control(struct snd_soc_component *component,
+				     const char * const ctl)
+{
+	struct snd_kcontrol *kctl;
+
+	kctl = snd_soc_component_get_kcontrol(component, ctl);
 	if (!kctl)
 		return soc_component_ret(component, -EINVAL);
 
-- 
2.39.2

