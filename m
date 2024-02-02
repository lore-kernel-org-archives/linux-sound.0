Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F574779F
	for <linux-sound@vger.kernel.org>; Fri,  2 Feb 2024 14:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706882793; cv=none; b=o0ujBiHAtelTcONr5uMerBECUTh4w8otxYwXQM7FdSKq4S8aNODrlDl6PGgCNjqoxYEM6IzXHPYe2fRYIED7S1aZDJ49L7+5cARnq0REc2vaHSClAzQ8PbMc0+5PxHNNT5Kq/ym/HkFD6U4hUp8q6nWwNPyKKQy6uhJOpwwDEgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706882793; c=relaxed/simple;
	bh=DK96AZtqKXcd7E3ueqD8K0+F1hQ+KVXSY7KqXeQShHQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GYhSVUtOscY1IzxL+VGMZpegG3oMRyR1SpmQlfEOJUuwke1C7zXL93VRt5QuQAmZTTJ7epfqzFl0bXi0qWYEiMO91/fXXVv/aaBD9MnqjLoi4J4NKoYNU3T+cgn7QIiHvT6VsawzkSRhFE91Z9wN908eU23pgqlO7KW8sfnwhcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=H+QWqvzT; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="H+QWqvzT"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 412D1imu023527;
	Fri, 2 Feb 2024 08:06:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=y
	MERiJ6dlvpjH7y1c/au/WKWXcDB1zu+AWyPNqt71iI=; b=H+QWqvzTA/vRbc2vV
	Kim+gIe0k96TphPlHOllmEEvu37dfV/JoFoeQMMxgFkEz5fvN/Ga+7AUEAJmLI0j
	sYLtPOZNw1E4OVXRsTHxeXSU4LJWeN/NGVThAqUxRB/r2Zl2+nU6nRjvK7yGWC0A
	LM4IUi7dKeJemRDOs2FgK9cwT7a520rPPXD1HJjsbGXL5Ajf/wYzfiyYc2n3lPM5
	j4wHt4KlehJRSfOTecZFCAQdhu0ychop04NoRd4dlWAG86w692oIDPh5QoRT32+u
	Bop2QwWpjZzcFn/39gtJ4sCuajosgcBDTCznT41G2+FdCUJwvLYBg5rl6aBBfCXR
	TIJsg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3w0puwgjvy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Feb 2024 08:06:22 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 2 Feb
 2024 14:06:19 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Fri, 2 Feb 2024 14:06:19 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 90F21820241;
	Fri,  2 Feb 2024 14:06:19 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>, <linux-sound@vger.kernel.org>
Subject: [PATCH 1/3] ASoC: cs42l43: Add clear of stashed pointer on component remove
Date: Fri, 2 Feb 2024 14:06:17 +0000
Message-ID: <20240202140619.1068560-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: x26BZXqQrZSalNTgKJr50zjQA-d1uWXv
X-Proofpoint-GUID: x26BZXqQrZSalNTgKJr50zjQA-d1uWXv
X-Proofpoint-Spam-Reason: safe

If the component is removed the stashed component pointer in the
CODECs private struct should also be cleared to prevent use of a stale
pointer.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l43.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index 2c402086924d..9e1deb3242cb 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -2111,10 +2111,18 @@ static int cs42l43_component_probe(struct snd_soc_component *component)
 	return 0;
 }
 
+static void cs42l43_component_remove(struct snd_soc_component *component)
+{
+	struct cs42l43_codec *priv = snd_soc_component_get_drvdata(component);
+
+	priv->component = NULL;
+}
+
 static const struct snd_soc_component_driver cs42l43_component_drv = {
 	.name			= "cs42l43-codec",
 
 	.probe			= cs42l43_component_probe,
+	.remove			= cs42l43_component_remove,
 	.set_sysclk		= cs42l43_set_sysclk,
 	.set_jack		= cs42l43_set_jack,
 
-- 
2.30.2

