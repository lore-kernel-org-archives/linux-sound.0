Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4691FBEB3;
	Wed,  8 Jan 2025 13:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736344119; cv=none; b=OmcB4ubnu7fX+4PdLGxUd3IuSW8Caw4+ujOPWmkgp9cERRds8R3PImg9iRjSxABbtDmOwG4CLDUrzWrv4Cf6wbUxoLdK1KriUPFl2jf+g3php+K6eAhrZzQjc6mQd7ZbggDNo4AQNQFy+roh6Q5Z9XIVjP4SJnhCDGPuWbgzA+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736344119; c=relaxed/simple;
	bh=t12BxcRYi67RbHOzgbEuCXAWdlcQ3q1QLqr7BuQ7zUs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jLkRSF7USOPBWWoCo+zA1PcLCVph0+7MXp0KtagObVSTBpg0UUiz7hVDjazgBZdsYzfvH6BX7jfR0kK5vqxkv+ClcdOWS1fBrxCmIqDaQNwv+GGSAhO10GBNEIzS4f9OADKZUbZ98XYujlLxSewvJ1IwLMEsDFP82KNgWAje2aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=FjrMlkyd; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="FjrMlkyd"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5086R9QE032745;
	Wed, 8 Jan 2025 07:48:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=RTcy8wzi1kgY4y8z
	WgC7wny1bynqMA/kruiOt8AOc0U=; b=FjrMlkydDtynzLdTMleioT14gEPqdsZV
	q7PBId4xfesBgo5B5t0wUmdouUusIwAYuYaN7KeiAnzw/e3H7ftJ7+oB/8RjVN15
	tZvHke6LorDUc7KND4dhzMPlHp4ReveXrqUktvYCbG17c0xPSdFtTv6iIBtAtKPK
	wW3k8dD1mxUGg4HEOlgicyyPjNytMDlP/j6ZSvmhpLw5muxXIfW78zkR8BMrH9wx
	kTERlU7+Pxd9tTv2m83QDb/XXR06upArbX7reVRHeGD0f7LJjtJBDXWaOyY6W9NQ
	PnD0CB/2e/chDTRlAHkNK/m2ZWhGJ1ut8+yBZaCcmlkYwbesCcPJoA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 43y29kcqa3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 07:48:30 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Wed, 8 Jan
 2025 13:48:28 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.13 via Frontend Transport; Wed, 8 Jan 2025 13:48:28 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 7BA17820248;
	Wed,  8 Jan 2025 13:48:28 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <s.nawrocki@samsung.com>,
        <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>
Subject: [PATCH] ASoC: samsung: Add missing depends on I2C
Date: Wed, 8 Jan 2025 13:48:28 +0000
Message-ID: <20250108134828.246570-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: SjnUkzy5MUpi8QxOCFAAQdc4rB4rB9Ic
X-Proofpoint-GUID: SjnUkzy5MUpi8QxOCFAAQdc4rB4rB9Ic
X-Proofpoint-Spam-Reason: safe

When switching to selects for MFD_WM8994 a dependency should have also
been added for I2C, as the dependency on MFD_WM8994 will not be
considered by the select.

Fixes: fd55c6065bec ("ASoC: samsung: Add missing selects for MFD_WM8994")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202501082020.2bpGGVTW-lkp@intel.com/
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Phew... this one is the gift that keeps giving hopefully got this nailed
down this time... hopefully.

Thanks,
Charles

 sound/soc/samsung/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/samsung/Kconfig b/sound/soc/samsung/Kconfig
index 1a05f0e7078d3..60b4b7b752155 100644
--- a/sound/soc/samsung/Kconfig
+++ b/sound/soc/samsung/Kconfig
@@ -127,7 +127,7 @@ config SND_SOC_SAMSUNG_TM2_WM5110
 
 config SND_SOC_SAMSUNG_ARIES_WM8994
 	tristate "SoC I2S Audio support for WM8994 on Aries"
-	depends on SND_SOC_SAMSUNG && IIO && EXTCON
+	depends on SND_SOC_SAMSUNG && I2C && IIO && EXTCON
 	select SND_SOC_BT_SCO
 	select MFD_WM8994
 	select SND_SOC_WM8994
@@ -141,7 +141,7 @@ config SND_SOC_SAMSUNG_ARIES_WM8994
 
 config SND_SOC_SAMSUNG_MIDAS_WM1811
 	tristate "SoC I2S Audio support for Midas boards"
-	depends on SND_SOC_SAMSUNG && IIO
+	depends on SND_SOC_SAMSUNG && I2C && IIO
 	select SND_SAMSUNG_I2S
 	select MFD_WM8994
 	select SND_SOC_WM8994
-- 
2.39.5

