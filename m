Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1DA214A79;
	Thu,  9 Jan 2025 09:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736415524; cv=none; b=tfIVDY1IN/TRsUEVP5QZgdNB+2fXo7Pcl2Di+aIj/WpIrk2Q66XdFf7By2ps4kBwdXtnLZoc6Ol/OXI29lFk1jn2w03sVC2SJWv6KaO9iqdT5e4cLp73A1uGLxeuw/8U3OZp4v/JasmOkXbtDrul2J9PLFAku0LQqVUpeVzYBak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736415524; c=relaxed/simple;
	bh=nvtTUjhYwsvw6VufUMzsFtmf4nz8QYalL/fsyLqxOsM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ESaxSwnP7kje1DJj1CqiU7wVPho+RgIuQIlVimDl5PLROZlP7VNbIwde9mSm5MQw8v+qm9NQPRVBRzfBYqODVIey6AMsoJEysN4zODyzbuh2H1GL4YdPRbTnJjzMstXl7P+rZ1G8e0SoboSoza1P6VgrL8EnBN0NR8pUXTi68UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=fa1mynxX; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="fa1mynxX"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5096M6H9013757;
	Thu, 9 Jan 2025 03:38:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=9jW4bGzbK9zB86Mi
	hyXnLJlyzRyTjPj/L+4J4tC3GnE=; b=fa1mynxXOFIFfrzQsZ3pYHMqkHRZwgwW
	HtTBjlF7kOkFsqCGo6iuv0LuxKDJONdhBPaL2FS5yng3/uu5Qy3nUU3VDiY9k/kv
	6YIcJiSm+8kxNdWeRLXjCuqZK2IqZmeDsrul/+ETsVb2GfANL8VM1kmOR0McVydN
	OcTCBgEl3GZSHEhZbdJ8+wpr2F7GICdbMLPSHIbzZmDj3jjXQauNEOCO50vte3eH
	eeetYRLjhE/qBoMzhg5LlwTbf78uxZaiBnlDheipZSeligGz6mbF1Voh3T80Nbmb
	7aiXqg9FCS0Zp5hCaAHoLQwiQs36RaeOAJnxOGOxeP01Fd9Ei+Ej4g==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 43y392dr26-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 03:38:27 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Thu, 9 Jan
 2025 09:38:25 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.13 via Frontend Transport; Thu, 9 Jan 2025 09:38:25 +0000
Received: from ediswws03.ad.cirrus.com (ediswws03.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 3CB65820248;
	Thu,  9 Jan 2025 09:38:25 +0000 (UTC)
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>,
        <patches@opensource.cirrus.com>, <linux-kernel@vger.kernel.org>,
        "Maciej
 Strozek" <mstrozek@opensource.cirrus.com>
Subject: [PATCH] ASoC: cs42l43: Add codec force suspend/resume ops
Date: Thu, 9 Jan 2025 09:38:22 +0000
Message-ID: <20250109093822.5745-1-mstrozek@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: wEiWDrUeQBt3IaNMxlKWqbveL6jGTZ0u
X-Proofpoint-ORIG-GUID: wEiWDrUeQBt3IaNMxlKWqbveL6jGTZ0u
X-Proofpoint-Spam-Reason: safe

This ensures codec will resume after suspending during playback.

Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l43.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index bee032c3ebbe..d2a2daefc2ec 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -2404,6 +2404,7 @@ static int cs42l43_codec_runtime_resume(struct device *dev)

 static const struct dev_pm_ops cs42l43_codec_pm_ops = {
 	RUNTIME_PM_OPS(NULL, cs42l43_codec_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 };

 static const struct platform_device_id cs42l43_codec_id_table[] = {
--
2.39.5

