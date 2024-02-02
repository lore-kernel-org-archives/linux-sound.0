Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87FEF5A4C2
	for <linux-sound@vger.kernel.org>; Fri,  2 Feb 2024 14:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706882794; cv=none; b=tzAieB6EIiVrtEpLVAlv7WldyedShVPvnBQIcec7IP7Cqz1KsxABeMA2SZ6ekxzNCMxTsqtWTG8ZrKLEDLTDcjly6zVwoUy0iZz/pNY/RjHtXxvYoagsYStPnP3VktiTegzdAq5SBlqaTC6E++4en6eRfgU9BpWmF+HzbIQLuQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706882794; c=relaxed/simple;
	bh=gtdmlXQY3OLn5YmXJ11GgVRKkjOWqdeb/x02vSADoYY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wqp5z0rEveFzt+1loNxTpGru3tdtfPCQx6FBAet9vHdrJKFM+A9INbxC5+oRIqPCsNAOI8m2qS/Wpsk8zZ+sN6RqB1LakBMrY3cqcKFqtJz3xiSxq3qnuJ9hiDrRPlYMBorCsF1HmQ2GZltTa4u2k7vkjWdhpn5KN0sQDBdNiik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=NPXOCb/x; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="NPXOCb/x"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 412D1imt023527;
	Fri, 2 Feb 2024 08:06:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=D94M7wag6rI2JZlZhW5IHQRabF0OTS5ObHPiw2v4ju4=; b=
	NPXOCb/xRC1lanpkD+czraqI6eIyNOqfHR19LDQ5hHlgbecTH0KLQHJGkElqTBYZ
	n9AAX72OIt1JJYX32YpVNEnRBH7yWytv3ntv/XMx5Ah05dP/DnDPJgJDXZEndevE
	OFrYurBg7MFTsgpl4D8q4HQXyRyVwwwZhtvjwwGnO5XrkdcYk5BtT76VoRJ2YcIN
	FWwuLYeMsDBDTm45xL/3aTC77Y7B5WfAdBNkTtdgkjpDDVNRkJxzXBfQ4wH3yFyB
	qclsdobd7YUX7nXz3h8DRzpPdG0KaR1mp8SkhDbTjVsa0bqVQP/OrfdMnB2vfSGT
	2ry8fDayJzEQ01VwPWXdlg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3w0puwgjw0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Feb 2024 08:06:22 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 2 Feb
 2024 14:06:19 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Fri, 2 Feb 2024 14:06:19 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id AB959820249;
	Fri,  2 Feb 2024 14:06:19 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>, <linux-sound@vger.kernel.org>
Subject: [PATCH 3/3] ASoC: cs42l43: Shut down jack detection on component remove
Date: Fri, 2 Feb 2024 14:06:19 +0000
Message-ID: <20240202140619.1068560-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240202140619.1068560-1-ckeepax@opensource.cirrus.com>
References: <20240202140619.1068560-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 7RmGXc7_beYLZp-WSCk9XowgP4aY3W_5
X-Proofpoint-GUID: 7RmGXc7_beYLZp-WSCk9XowgP4aY3W_5
X-Proofpoint-Spam-Reason: safe

Disable the jack detection and sync in any currently running work when
the component is removed.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l43.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index c84d5952cdb5..256767ef4c03 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -2115,6 +2115,13 @@ static void cs42l43_component_remove(struct snd_soc_component *component)
 {
 	struct cs42l43_codec *priv = snd_soc_component_get_drvdata(component);
 
+	cs42l43_set_jack(priv->component, NULL, NULL);
+
+	cancel_delayed_work_sync(&priv->bias_sense_timeout);
+	cancel_delayed_work_sync(&priv->tip_sense_work);
+	cancel_delayed_work_sync(&priv->button_press_work);
+	cancel_work_sync(&priv->button_release_work);
+
 	cancel_work_sync(&priv->hp_ilimit_work);
 	cancel_delayed_work_sync(&priv->hp_ilimit_clear_work);
 
-- 
2.30.2

