Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C558C1DF662
	for <linux-sound@vger.kernel.org>; Fri,  2 Aug 2024 10:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722596286; cv=none; b=RTGPcNCWMZy/91tadpzCuxawKEoj5gHBrwrGugkSXRtkNx8HbV/qR93mVpAtXn0M++a/WkL+ubbTmHNPY8e13+uWLuZEx1CzAJqgFU4lwMXCmZ9QTs96IRdbIbsIS3j8anUpSuHe2tjX4mXgw+92LIvG9MSqup/dBcmRi3zvdJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722596286; c=relaxed/simple;
	bh=kCtPikW5m4HQBCDTt4AdXlzVR2vDHT5BVVjwKwM5bpw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hYsdwnAGAbE5oJZVUNIprjyVkbCDO7cBm2/mdEJl9Q6i4VhAQGBp8ElZgBSJaDYFki2mNSYBHXpiDA7YnHOtD2RES+2Y4EALuczhGmNMpFNyHZB42I7Kaex3SWvFI8FBoOjucGTYdoEBLVzIi19c7rlSG1Favxh1mzpaGrskNaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=gvQAYvPr; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="gvQAYvPr"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4726i5at032551;
	Fri, 2 Aug 2024 05:57:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=Hm7cYHw3IbsWKPdOPufszkieZJVz8McrDxKj16qNbGQ=; b=
	gvQAYvPr/YWwZsBVL5uMLqXs59V8hequWHw8Ct5dWgXgtLiufAiPxeOD7sPEWvYb
	LG9fTMNOuzD9VIDmmNsuVL+Qv7aIj+wI0yEnyzu1uuRh06B8zyFMlVKHQGTmAszJ
	lW+DA79xbvFxGPDVCHu0RKEZ109I2bNaEjdyMdJQibz+Jve5gDvV+HqijIYF5mAQ
	NZ4p+25Y5hV9cguLvkD1TUWxmuIk0ix6b85yPQLMBZwMHXq2vhEdKxaZemFa7LvK
	Uyhk19uIyfttQYsm+p1St6XVsLr3gYcs8S7em/IcHdDhfxakmpWpGz4e1xtWAgak
	7zWLHOGGP705JTVXmNLa+w==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 40rjdxrj1y-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Aug 2024 05:57:42 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 2 Aug 2024
 11:57:34 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Fri, 2 Aug 2024 11:57:34 +0100
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 5332082024B;
	Fri,  2 Aug 2024 10:57:34 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>
CC: <lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>,
        <patches@opensource.cirrus.com>
Subject: [PATCH v4 2/4] ASoC: soc-component: Add new snd_soc_component_get_kcontrol() helpers
Date: Fri, 2 Aug 2024 11:57:32 +0100
Message-ID: <20240802105734.2309788-3-ckeepax@opensource.cirrus.com>
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
X-Proofpoint-GUID: fRUe4Kif1sJLk-Nlgh0ReK1ta3qJI3dU
X-Proofpoint-ORIG-GUID: fRUe4Kif1sJLk-Nlgh0ReK1ta3qJI3dU
X-Proofpoint-Spam-Reason: safe

Add new helper functions snd_soc_component_get_kcontrol() and
snd_soc_component_get_kcontrol_locked() that returns a kcontrol
by name, but will factor in the components name_prefix, to handle
situations where multiple components are present with the same
controls.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v3:
 - Add new _locked version of the helper.
 - Factor out the control name generation to share between the two
   helpers.

Thanks,
Charles

 include/sound/soc-component.h |  5 +++++
 sound/soc/soc-component.c     | 42 ++++++++++++++++++++++++++++-------
 2 files changed, 39 insertions(+), 8 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index ceca69b46a821..bf2e381cd124b 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -462,6 +462,11 @@ int snd_soc_component_force_enable_pin_unlocked(
 	const char *pin);
 
 /* component controls */
+struct snd_kcontrol *snd_soc_component_get_kcontrol(struct snd_soc_component *component,
+						    const char * const ctl);
+struct snd_kcontrol *
+snd_soc_component_get_kcontrol_locked(struct snd_soc_component *component,
+				      const char * const ctl);
 int snd_soc_component_notify_control(struct snd_soc_component *component,
 				     const char * const ctl);
 
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 4d7c2e3c929a9..42f4813219197 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -236,19 +236,45 @@ int snd_soc_component_force_enable_pin_unlocked(
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_force_enable_pin_unlocked);
 
-int snd_soc_component_notify_control(struct snd_soc_component *component,
-				     const char * const ctl)
+static void soc_get_kcontrol_name(struct snd_soc_component *component,
+				  char *buf, int size, const char * const ctl)
 {
-	char name[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
-	struct snd_kcontrol *kctl;
-
 	/* When updating, change also snd_soc_dapm_widget_name_cmp() */
 	if (component->name_prefix)
-		snprintf(name, ARRAY_SIZE(name), "%s %s", component->name_prefix, ctl);
+		snprintf(buf, size, "%s %s", component->name_prefix, ctl);
 	else
-		snprintf(name, ARRAY_SIZE(name), "%s", ctl);
+		snprintf(buf, size, "%s", ctl);
+}
+
+struct snd_kcontrol *snd_soc_component_get_kcontrol(struct snd_soc_component *component,
+						    const char * const ctl)
+{
+	char name[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
+
+	soc_get_kcontrol_name(component, name, ARRAY_SIZE(name), ctl);
+
+	return snd_soc_card_get_kcontrol(component->card, name);
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_get_kcontrol);
+
+struct snd_kcontrol *
+snd_soc_component_get_kcontrol_locked(struct snd_soc_component *component,
+				      const char * const ctl)
+{
+	char name[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
+
+	soc_get_kcontrol_name(component, name, ARRAY_SIZE(name), ctl);
+
+	return snd_soc_card_get_kcontrol_locked(component->card, name);
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_get_kcontrol_locked);
+
+int snd_soc_component_notify_control(struct snd_soc_component *component,
+				     const char * const ctl)
+{
+	struct snd_kcontrol *kctl;
 
-	kctl = snd_soc_card_get_kcontrol(component->card, name);
+	kctl = snd_soc_component_get_kcontrol(component, ctl);
 	if (!kctl)
 		return soc_component_ret(component, -EINVAL);
 
-- 
2.39.2

