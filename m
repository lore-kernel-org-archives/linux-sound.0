Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012012.outbound.protection.outlook.com [40.107.75.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616592FD7D3;
	Mon, 14 Sep 2026 01:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789351023; cv=fail; b=ND1DNxlTr8w+D2orztJv52OXj1jAc7Irpe+QVoAPzyW1mADTKjM4TrNS1ktkAuCUyBFf4Qf9qUtfZPRlO0K/5D6bUShpVzKhvkl3UvCsq5zv239LzoP9fMqp3Cv79TWMPk7Yf9sYZjhsVjMzA87/zH1RTJnPjbmLDJzCrB0nC1s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789351023; c=relaxed/simple;
	bh=jTZ8jOHKhP9j/6auOeoUIirQSzam1rVv5zw8ppQ0B6g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sT3YU7IueiB9IoYtRFdZqztn4QSy727RCpkDn75ohMVQIrPkMls9/9eGwVWmi/PHEPoCSh1Rpnn4KmpbUyxXRLoxO2Tc+yiGxZM3uCcBuO8hCs8kOtFuY0lexyn/M6A+6bZJT4B2o/LKNHYf4jpiczQ7aMa72WB78iGzUb7M09s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nuvoton.com; spf=pass smtp.mailfrom=nuvoton.com; dkim=pass (2048-bit key) header.d=nuvoton.com header.i=@nuvoton.com header.b=wk4hWTF2; arc=fail smtp.client-ip=40.107.75.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nuvoton.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nuvoton.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nuvoton.com header.i=@nuvoton.com header.b="wk4hWTF2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rS6xe/LHub7dH52znzh/F/si00wfviHHK+vOOjrogjQAly1rU8UF/ZWQT16IST0cztY4TqkNrugYDaw3ZIUYLtUdSiHb3cpcseS+ZaYi9Ro4lObG91c288JwXulpc50tcbahb/WGjWk6oIUvjJmYYmO4yBhezFz+ZN1q+mGt6c/qNvVyMFm4R0xaOEXM6phwXi+/eBU99haZd4nLuqepAhErGiKDM6ng4KIW/On8Vybe03qY29CF07I/pqQxFOmA9R0ysi1qxUoc/KH7/Xa+hDidAWL1IpgTX5yc5izIgS10pA0sx0YAtkzMBPm2WmQaj+xwxTTpfseXc/MM2kff2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WlBMfMy087QuUGv17VHuRuBSvHLBTsYbh/ie4DeIUQg=;
 b=dIM/qadSvU38tKVjJeRiRJDC92a60wvV6cLwlAeUzn6Ad+72bvXWH/1hNu63fxEY48AMZdM5p4XiaFuVwt1whEstDRs4nB7VrwhhjoJnHHSPBK/uA53corj39zj9CCVUeQLrEjotxHoJZw+iefhMJ3viaaiBp31vdL3y/d36UXCPHDOAkxNg5Dfr8fvZDPkWedxgUnp5Wap5Z/avEccK8+5c4+BPN9bY0m5bW32SmzB+I1wvuHrQm/B8cBQLWMzm7C2/Cgng3DO1YGYVBTOF5pD9sQMcISzh/SjoJWUEGT+UPfHKVi6sStmekmDUle3KJMmqOFccLU84fthOPhjjEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 211.75.126.7) smtp.rcpttodomain=kernel.org smtp.mailfrom=nuvoton.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nuvoton.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WlBMfMy087QuUGv17VHuRuBSvHLBTsYbh/ie4DeIUQg=;
 b=wk4hWTF26L6IXvyaI9W7ter3lq9tgwr1dGa8EL5W4VP/LJUJcIdEmbaP6ctrroTEPYf/SywokNUqvlDKRpaUXTQvGGSNDY4svMjkuSPnhUM436vm0p60Q6RzqBqeUvBKWH5YnX8VI8UC1p+2ra1Fo+wCjeRGwcXuG+zeU78Rq952YRP1esBr9ALGTsBUYcz1inbnsnJV+pkjIDM2yE3Rgy2CH6w4ExCQUkxfcrvJ3AA1N4Lgn7Um1onRBUw8iFp2KyVSkoh/J+xZ9OqHhnCzvOMo1zjIymwD5NhADy86gTX+RBn6CvM6o4iR4yxQwlUeNhczlbaYHXZESZXE8UBADw==
Received: from SI2PR01CA0025.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::10) by TYZPR03MB8190.apcprd03.prod.outlook.com
 (2603:1096:405:25::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 01:56:54 +0000
Received: from SG1PEPF000082E1.apcprd02.prod.outlook.com
 (2603:1096:4:192:cafe::11) by SI2PR01CA0025.outlook.office365.com
 (2603:1096:4:192::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.11 via Frontend Transport; Mon,
 14 Sep 2026 01:56:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 211.75.126.7)
 smtp.mailfrom=nuvoton.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nuvoton.com;
Received-SPF: Pass (protection.outlook.com: domain of nuvoton.com designates
 211.75.126.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.75.126.7; helo=NTHCCAS01.nuvoton.com; pr=C
Received: from NTHCCAS01.nuvoton.com (211.75.126.7) by
 SG1PEPF000082E1.mail.protection.outlook.com (10.167.240.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Mon, 14 Sep 2026 01:56:54 +0000
Received: from NTHCML01A.nuvoton.com (10.1.8.177) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.61; Mon, 14 Sep
 2026 09:56:51 +0800
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCML01A.nuvoton.com
 (10.1.8.177) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.61; Mon, 14 Sep
 2026 09:56:50 +0800
Received: from localhost.localdomain (10.11.36.27) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2507.61 via Frontend
 Transport; Mon, 14 Sep 2026 09:56:50 +0800
From: Neo Chang <YLCHANG2@nuvoton.com>
To: <broonie@kernel.org>
CC: <error27@gmail.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <linux-sound@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <alsa-devel@alsa-project.org>,
	<neo.chang70@gmail.com>, <kchsu0@nuvoton.com>, <sjlin0@nuvoton.com>, "Neo
 Chang" <YLCHANG2@nuvoton.com>
Subject: [PATCH v5 1/2] ASoC: codecs: nau8360: Block DSP path selection when firmware load fails
Date: Mon, 14 Sep 2026 09:56:47 +0800
Message-ID: <20260914015648.311986-2-YLCHANG2@nuvoton.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260914015648.311986-1-YLCHANG2@nuvoton.com>
References: <20260914015648.311986-1-YLCHANG2@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotSetDelaration: True
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E1:EE_|TYZPR03MB8190:EE_
X-MS-Office365-Filtering-Correlation-Id: 55be663e-609d-4209-6b75-08df120373b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|7416014|376014|23010399003|1800799024|82310400026|11063799006|56012099006|10067099003|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	e6Jq0NVzo1deoYxGNiXq2wKonJ1oTWhQXx3nujGLaJOKO0TnTybZ7r/Srhj1imx9mpHUQu0GaGRrT9XLNLtI9HGf82fNFnjJc05uh+U366VtRNmvwjfE3slzQfSuiKHPPFC6//EYjgTdao1WOOUvhmhddTIWBD1Y7UHKe4tZQ5E/nccu1UdNFBJ0bBOFFE3AaX0Iofq7Xbrx7BhYl6HjK6ZCbdTqfaUqf0u9Cht7b9QORfBdiwljpyhQXtuobTHUnkyFnfbYF4Wk5zCCqBuZHf6q0c3SJQuU6GWiwalOYlKx6MORoCJ+9MN2AD5L/6bH9Ah7I3+LTG1D91kbuEk/uigC9VOMtpqe/kH9yE1fMofaIARTRhtKXjOpTt4tSs+4a4e/t5rXEsLlJmaIniQ8Ma26MedgCT168UL3OFSLdvc85xsFRwwOIfoWefJ2xSUM6rc3Fw9/MAARVWHXqj4C6aKiRT7OELhw5yHHTsW9cgACeKKiAEwDwIrEJq140kuTf/eE4TiVQxUAVGXfvMKePWE4KD2FvBzdsRJRVImYDiJZtiBH2h12QxY7KrGYprjMkHyr45npD7MlkdGw5N1AHaVVIcmmhqvRBjculxxqE7QhH73Rw9PyOi+C4QT2mI6Sk2DKUhL90IOKY1qUdHnMUhrdAq66QyJDC6wfaLGavYV6RxoRsrrQpmvwFhZIoeXjnA5oWac2OIEi/9RBKHVwzw==
X-Forefront-Antispam-Report:
	CIP:211.75.126.7;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:NTHCCAS01.nuvoton.com;PTR:211-75-126-7.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(23010399003)(1800799024)(82310400026)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	srY2UlYyuXcL7F8+X4ncDxMLgoDZtAqVt27vqCK67LHbzR4/0qrLQgPDgTFpILQIr+AKYbB+8mc1QDkPxRl0ms53aFXH2BUqObdJ3oYz90yxOkxDqi2vpwOgSBoeqETEyLEkgByOPQ3Zz1l6YqH/fsvm5vaUnqEm/3TWIZeOVPbkLBi+3iG4po5O0czUznfGouBMEIHfgQyweO6PzFZm6aZ2ILNYTLsiXGp1izrtFLo9DSxKN3PufQEJKYUg4WBm4IkgtNfVRmSXkL0O/NHea9M6v4J+nvJc/U4hT2dpcU6X6+mb1mLUAxqw1B8cbuSeHsu3nlq5nhZAKoi+hSvnrZKhp/So+azV81BP9jZegZFPkkz9f/gQId9jlY994YUKrA+9kyWWwhjhoJ5yrWS2GlwwAHtjuGkR8aV/dfC8Unj4DdpgjCR0D5zVrpG4b+2Z
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 01:56:54.4468
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55be663e-609d-4209-6b75-08df120373b9
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07;Ip=[211.75.126.7];Helo=[NTHCCAS01.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG1PEPF000082E1.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8190

Block the DSP path selection if the firmware fails to load to prevent
invalid routing states.

If the firmware is not ready, nau8360_dac_mux_put_enum() will print
a rate-limited warning and return -EBUSY. This rejects the invalid
userspace request and maintains the original hardware state without
causing audio wrong status.

Reported-by: Dan Carpenter <error27@gmail.com>
Closes: https://lore.kernel.org/linux-sound/aqK_oOpMAXVhxkHJ@stanley.mountain/
Suggested-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Neo Chang <YLCHANG2@nuvoton.com>
---
 sound/soc/codecs/nau8360.c | 9 +++++++--
 sound/soc/codecs/nau8360.h | 6 ++++++
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/nau8360.c b/sound/soc/codecs/nau8360.c
index 89b8ee80d6c8..f5dee12127cd 100644
--- a/sound/soc/codecs/nau8360.c
+++ b/sound/soc/codecs/nau8360.c
@@ -715,8 +715,13 @@ static int nau8360_dac_mux_put_enum(struct snd_kcontrol *kcontrol,
 	int ret = 0;
 
 	if (snd_soc_dapm_get_bias_level(dapm) > SND_SOC_BIAS_STANDBY) {
-		dev_warn(nau8360->dev, "changing path is not allowed during playback");
-		return ret;
+		dev_warn_ratelimited(nau8360->dev, "changing path is not allowed during playback");
+		return -EBUSY;
+	}
+
+	if (item[0] == NAU8360_DAC_SRC_DSP && !nau8360->load_fw_done) {
+		dev_warn_ratelimited(nau8360->dev, "Cannot enable DSP: Firmware not ready or disabled\n");
+		return -EBUSY;
 	}
 
 	mutex_lock(&nau8360->lock);
diff --git a/sound/soc/codecs/nau8360.h b/sound/soc/codecs/nau8360.h
index cc640ba8c838..71396747c0fa 100644
--- a/sound/soc/codecs/nau8360.h
+++ b/sound/soc/codecs/nau8360.h
@@ -870,6 +870,12 @@ enum {
 	NAU8360_TDM_TXN,
 };
 
+/* DAC Source Path*/
+enum {
+	NAU8360_DAC_SRC_HW1 = 0,
+	NAU8360_DAC_SRC_DSP,
+};
+
 /* PLL Source */
 enum {
 	NAU8360_PLL_MCLK,
-- 
2.25.1

