Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8A21E3DCC;
	Tue,  7 Jan 2025 10:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736246507; cv=none; b=b95dqgII2jvAFKN54ISi0tGGXAzA9LvJNC2+VZyFG7LKrftS8gOWc+9RyLogE0Ayi6F7xMCuTDPpR2meU8xyRLQySIzTZMYfJWcPPmlJaqI9RB5TbL/NS43LxGJy93JJKz2dQ+0a/grF7lztxJxZgzg6ns6oGuBU4JKrwnG1rf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736246507; c=relaxed/simple;
	bh=gKkQHtIEISZIK0b1f1t6+AA+BtbO/bPWgD1c3S0jlNA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eGDddONh0pOI6Yeazg5Qq05XNb8LFejdGRO0B14FTSalUP+FTMgaJzuZorQmh1fhYH14NAT8dIE13a1A0wnIvEuHvrGJv7COPwaYtbIOjpg79G6R2gvE7iEyjL1dD+06OO+MGUuqWeWHRkiiybkrd/3/fnAq9Jb67hya1VB85ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=KuI8iEpt; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="KuI8iEpt"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5076q5HE001990;
	Tue, 7 Jan 2025 04:41:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=4sIKNCZWr77RDiH1
	mUAqlr0h5ohwmAWffDu5gzzBKiA=; b=KuI8iEptD5e5fX+09u1yOhzkI6Vl5KJG
	5Z0GOy+5KvkREd/Kt7D1dROZRm4rQN2BjdXyTQIdoHqqvhuSSTyPv+/L3PquM5Ap
	47Lcr8mEXxZZQrwQ6ZqKJc3IYfWME1eyiMVmd7m2OFXFP5KStr7hVfunGKBQesO9
	xVfQMcqc/95m0GOxHQPfUMq7qqapTVjXO9cbDKav9FQuG30nBIT0lhj/zzLmlFYU
	zLoX9EVLjNgMdA/NPym16xNtBb0fBiRR87pdBV9xFrp2ZCeHiae+SpMoc55j+4iw
	Idj9Iq5TCvQly0dLMoNmp/nzX6WO4buJNzgjSRtFo4wOazZD/Zeolw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 43y392b2xb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jan 2025 04:41:36 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Tue, 7 Jan
 2025 10:41:34 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.13 via Frontend Transport; Tue, 7 Jan 2025 10:41:34 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 52660820248;
	Tue,  7 Jan 2025 10:41:34 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <s.nawrocki@samsung.com>,
        <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>
Subject: [PATCH] ASoC: samsung: Add missing selects for MFD_WM8994
Date: Tue, 7 Jan 2025 10:41:34 +0000
Message-ID: <20250107104134.12147-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 5gtIVis96BoB1nCAE8HzlVGfz1uMVRpU
X-Proofpoint-ORIG-GUID: 5gtIVis96BoB1nCAE8HzlVGfz1uMVRpU
X-Proofpoint-Spam-Reason: safe

Anything selecting SND_SOC_WM8994 should also select MFD_WM8994, as
SND_SOC_WM8994 does not automatically do so. Add the missing selects.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202501071530.UwIXs7OL-lkp@intel.com/
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/samsung/Kconfig | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/samsung/Kconfig b/sound/soc/samsung/Kconfig
index 4b1ea7b2c7961..1a05f0e7078d3 100644
--- a/sound/soc/samsung/Kconfig
+++ b/sound/soc/samsung/Kconfig
@@ -127,8 +127,9 @@ config SND_SOC_SAMSUNG_TM2_WM5110
 
 config SND_SOC_SAMSUNG_ARIES_WM8994
 	tristate "SoC I2S Audio support for WM8994 on Aries"
-	depends on SND_SOC_SAMSUNG && MFD_WM8994 && IIO && EXTCON
+	depends on SND_SOC_SAMSUNG && IIO && EXTCON
 	select SND_SOC_BT_SCO
+	select MFD_WM8994
 	select SND_SOC_WM8994
 	select SND_SAMSUNG_I2S
 	help
@@ -142,6 +143,7 @@ config SND_SOC_SAMSUNG_MIDAS_WM1811
 	tristate "SoC I2S Audio support for Midas boards"
 	depends on SND_SOC_SAMSUNG && IIO
 	select SND_SAMSUNG_I2S
+	select MFD_WM8994
 	select SND_SOC_WM8994
 	help
 	  Say Y if you want to add support for SoC audio on the Midas boards.
-- 
2.39.5

