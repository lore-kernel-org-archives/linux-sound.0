Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E43D171066
	for <linux-sound@vger.kernel.org>; Thu,  1 Aug 2024 10:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722506685; cv=none; b=Tn0EMqjt9mRpQ4JnWtGuE9wi1NXNouW9uZyIOsSN8f94ZHOOpDOKmB3p64C14SpEzSc2d7fWpC0dJR1+OD1G3ZXtEUuJMt4KKxaqNjdCSXO7qstzDVfFjEgfyzGqIK9gy47CW9kCb1Jd7rJWwdecSFogf+3QLJ2iz/+NOWjE/y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722506685; c=relaxed/simple;
	bh=YPEOuCX/tLruFZngidu2lJ0zqPL/bKr/3UJVVn/JDNY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VwtclJaikQ9dE3ATwE5vIvkwjGgoWlaoHTtp6zM8YW0PxKgDqTAqV+xB0Z60goHAgtPFPzTqVOapDo2jxmeub4oDQ+W0muX6XrIvW/yggGVoJ2sV34LmEH+rHev5liIYYp0Q0ySNFtZLO25/jVzdB+03dB7nfZ1jc8W2C+9rM/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=kW+XtKus; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="kW+XtKus"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4714lo5d015269;
	Thu, 1 Aug 2024 05:04:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=1llHGiab/7Xp80F4DpTdMVyvazaB9lx1EQcCzeeNHWI=; b=
	kW+XtKusq4M+AWWfx+QSZ9p2Q+Zv3/p7slHv3Aw3eUVTAsioiH0Fzmzrm4KoGDfN
	6mbNZR0r4qvw8rSiFiSpCSTGffJp8PbRjWC5UjQRXhCwL1liyDWViUcur+LA9/bf
	PA3KivsgoK8Kmdmn92Z2umxTgoHZMEWjnVEYxoLLkjUvxbOu6JXcli/MKPuHo2/2
	Q0D8jQbbK/mKyiBR2V2A3H7RmYJFZi8oza7nLVyuVaHt/daZdSW5siq2dMq1nugf
	sF0bGP3H0I3y6T9akrN7ZAG4+P30TCkPrCusadAmjq60Xo8S/WS89g/uXCye+DTg
	yBA8UvYf9Ys6hXEiyEW85A==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 40mx9ypeqe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Aug 2024 05:04:15 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 1 Aug 2024
 11:04:13 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Thu, 1 Aug 2024 11:04:13 +0100
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 3F71F820247;
	Thu,  1 Aug 2024 10:04:13 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>
CC: <lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>,
        <patches@opensource.cirrus.com>
Subject: [PATCH v3 2/4] ASoC: soc-component: Add new snd_soc_component_get_kcontrol() helper
Date: Thu, 1 Aug 2024 11:04:11 +0100
Message-ID: <20240801100413.1620481-2-ckeepax@opensource.cirrus.com>
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
X-Proofpoint-GUID: _x36C4D2QSHIO9iQBfPxrDwdK7CzZZmq
X-Proofpoint-ORIG-GUID: _x36C4D2QSHIO9iQBfPxrDwdK7CzZZmq
X-Proofpoint-Spam-Reason: safe

Add a new helper function that returns a kcontrol by name, but will
factor in the components name_prefix, to handle situations where
multiple components are present with the same controls.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No change since v2.

Thanks,
Charles

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

