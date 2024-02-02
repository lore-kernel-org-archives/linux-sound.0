Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F8947A60
	for <linux-sound@vger.kernel.org>; Fri,  2 Feb 2024 14:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706882793; cv=none; b=bz3uCUN8OoUQcRwoMDTkHATpCWNxLpv7BuUkhtNl1QckhaTcp/IiGbr7s62CzZiX7+ti/MUq3/7HQPVlpmzDjSIQFXxi9wVUFH+y1u3tPZXfW8cAedE/vv5553npe3wGraNpx9fvvgTP9bNtcoJSmfBQVc07krlIGEs6AYWcAhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706882793; c=relaxed/simple;
	bh=W5b62LBeS6dp8nBRjHKDhK31OtQSA4Ni7+K5BXOBGk8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CQ9gOpsZ1V+JmiyuU+1lIeCvKPCNReZMp4JC3MxX1nuQoXB+kNOyECtb0i7UAG7yKcxWKGtTXuu0PjqmzkLARGKQ7dDWJ1VnudVsy65CK1rVtiNvzANFdDPlFNzhVsKg2PiLeu5BpuoDLaeKbdEdB3dicCwr/nlugolYk/ZLF/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=lLbNJiwu; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="lLbNJiwu"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 412D1imv023527;
	Fri, 2 Feb 2024 08:06:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=1Fa3BBmlAMFYHyVzM+CIenECxuM4F2GKfdbvgrjNKUM=; b=
	lLbNJiwu8QW8ty8bOAypiymzaFztkxmFG8FY5CJmpR0fyl/WDcfxnBYk1RXt5zGN
	uXPKYSRBBHGO+zNMAMW3zFs4lgvsgfhVbMUe7w+z7yOv8tJIQ1PfqusuMNMj/9aZ
	cQI5HhLVUEl0tIc4Tdg7YYHDyuRPka3WJxavgxW0oLWOsoREMyQUF8BvSiw3+tRo
	H9LPbZKT3Mji1jo//WV6WFgAS5Jj1bg49wFYB8BxXPk9EORpJkCKWEWmR6E+NUyw
	g+ctui2JTIxiALT7+UG2iV/KiDxF2PYrjX5ME5Tdu01Dt427KXL/tAjl0ya41KVd
	pwW+sHo+k5G9CI4cQ/tTDw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3w0puwgjvy-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Feb 2024 08:06:23 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 2 Feb
 2024 14:06:19 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Fri, 2 Feb 2024 14:06:19 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 9F414820248;
	Fri,  2 Feb 2024 14:06:19 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>, <linux-sound@vger.kernel.org>
Subject: [PATCH 2/3] ASoC: cs42l43: Sync the hp ilimit works when removing the component
Date: Fri, 2 Feb 2024 14:06:18 +0000
Message-ID: <20240202140619.1068560-2-ckeepax@opensource.cirrus.com>
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
X-Proofpoint-ORIG-GUID: k-nrnSHwJQ7w3l5vCzelP5fDuYAm5xyg
X-Proofpoint-GUID: k-nrnSHwJQ7w3l5vCzelP5fDuYAm5xyg
X-Proofpoint-Spam-Reason: safe

Synchronise the headphone ilimit work functions when removing the
component. These can only trigger whilst the headphone is enabled which
shouldn't be possible once the component is removed but the works rely
on the stashed component pointer so they should be shut down before the
code moves on from component remove.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l43.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index 9e1deb3242cb..c84d5952cdb5 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -2115,6 +2115,9 @@ static void cs42l43_component_remove(struct snd_soc_component *component)
 {
 	struct cs42l43_codec *priv = snd_soc_component_get_drvdata(component);
 
+	cancel_work_sync(&priv->hp_ilimit_work);
+	cancel_delayed_work_sync(&priv->hp_ilimit_clear_work);
+
 	priv->component = NULL;
 }
 
-- 
2.30.2

