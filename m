Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010000.outbound.protection.outlook.com [52.101.46.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF2435E92B;
	Thu,  7 May 2026 09:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778147181; cv=fail; b=Z0SifXmogqzK9Udspu4vYtMc9ZOUbm2QBe+7R+EPOhWtPXk+J72sGsai6P9spJQYTLBCAD9Yiv6vgmfrWM5Khy7dU9/QDmuKaU5sGpDnCyNbc/FOmQwvjhn3nw9TILBGzW8FEJgnUWXRKnrMo8jo4RPr3XIYiez3pGryPB/d2EY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778147181; c=relaxed/simple;
	bh=kg4imm1ZEe95Co6S2J+EpnPPBlih40BG992dBrMEpWc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TLEyBdiqPeGu6+UJEBrjFPhProuRZilwB+4yFHdgdMijjy9QoSIZp1Hk5oymo5oCVRZjqXqq49Zt2j+z+aZiWKW9y2fr2TApsmvCcaRPEynHJe7j4Uu6ZgabPQcAbRZ5KWgvhjnqTrihlAsxwK3JOhjEjxFbSyZdlTUNZ4e2KNs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kMitS2nZ; arc=fail smtp.client-ip=52.101.46.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kMitS2nZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fn3/fyRJ5M9H8CjHR6iuhxzkRJkJdxcvwlVk3IOjCH2nwUcghXCNaBZIKIOfp9Tg/G1hBL6+8vOEHiaDpyOhSFg4jDyYbur0Awv9rbom50yjvU6G7eRQZM/LUZE3POqEFVbgaz0JDqzmSdv8eq5VQKbJHb5nWakXJzklo5RIWUsDZS+DseBfieKA1x+cumNGmrYlvIqvGjmOQreFQNi0xbcyTbj/L7X+sL+5AYKdDheszAAvNh1i15ZIuAgya/I/BlJDdm5Qj0aNqzM5ajmwOdgXwAC8g3lmp2bXgilnbsJ+re3vv/wslsvq5lUZLUrGdjEMxxNI9UxGllniQeQWfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/gTyNFOQHpDPuIfHq2FlvQcgD7uOh1Jwh26W9Z2a+7k=;
 b=AWkCbc5gsjRsBd+gjMcen95ytkHjhJVvxtEReJ0j7aVCJpTelyqnXT/9+ffL4Ru/rPG93Wp2ZQiDjXvDn2RFgdc0/Ewu3ae7IglcmgC9wvgAza0sGXPVsL1JgbgDwl+xxXAiHwe+3pTX3IEWx9uMMnLSP4WzCiz2Zl9HZ2Y5iE7svk3YuqP/GZYL3coLlrHizVl2HzgrX1OkTWknanLhM+RFYytcqnEJytYFMtB9VMD6PXfz6iJKS3RvXS4yU8H32NAzkXjEHec+mXl+XC18fcsXclAkgFFCT2w0Vdov01lhTdLaiXmVwbHpAfmhtVpmykyzw2/Btaxft6dp80nV3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=realtek.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/gTyNFOQHpDPuIfHq2FlvQcgD7uOh1Jwh26W9Z2a+7k=;
 b=kMitS2nZwwUVLQ9q/C//fiO3LrEaboqfr6EmMkcfgb3xhtzqvxxpI9qbhuddufb8zSTWKgqlk/bFqAukVZ2fXjLT2lWhNFqHJ35yMBojmuy+x3kLTgjEWbUoD7ix9fFYc7UB8S7AT8sFEd/qpCWblWeaN9psHUFUTA6FJajSmbr9yJcdqb0hFyLyiqtmDYepIVwvarZRNN0yLg8Bkk3pNlgwaJ6tzpqZwy4MWajYXGCDYQ7ndl/KKVOCHE/aYnt0DRjPgO9SKb/jCvHzjyr15LU1hBkLDwhyO0aQK/DfJvEpRKA1i2L4LJK0N/UO6rsuM4DKciv73g7tNvQwLy337Q==
Received: from SA1P222CA0113.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c5::27)
 by SJ5PPF09E5F035B.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::988) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Thu, 7 May
 2026 09:46:13 +0000
Received: from SA2PEPF00003AEB.namprd02.prod.outlook.com
 (2603:10b6:806:3c5:cafe::fe) by SA1P222CA0113.outlook.office365.com
 (2603:10b6:806:3c5::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.18 via Frontend Transport; Thu,
 7 May 2026 09:46:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SA2PEPF00003AEB.mail.protection.outlook.com (10.167.248.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Thu, 7 May 2026 09:46:13 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 7 May
 2026 02:46:03 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Thu, 7 May 2026 02:46:02 -0700
Received: from build-sheetal-bionic-20251202.nvidia.com (10.127.8.14) by
 mail.nvidia.com (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Thu, 7 May 2026 02:46:02 -0700
From: Sheetal <sheetal@nvidia.com>
To: Oder Chiou <oder_chiou@realtek.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Jon Hunter
	<jonathanh@nvidia.com>, Thierry Reding <thierry.reding@kernel.org>, "Mohan
 Kumar" <mkumard@nvidia.com>, Sameer Pujar <spujar@nvidia.com>, "Anupama
 Kunkulagunta" <akunkulagunt@nvidia.com>, Sheetal <sheetal@nvidia.com>
Subject: [PATCH] ASoC: rt5640: Handle nested IRQs
Date: Thu, 7 May 2026 09:44:31 +0000
Message-ID: <20260507094431.3316763-1-sheetal@nvidia.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AEB:EE_|SJ5PPF09E5F035B:EE_
X-MS-Office365-Filtering-Correlation-Id: 008e2a22-d44b-461f-f005-08deac1d7a0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	bqYhm/uVVghyfRvqj7Nx3aqjxx78sPhGGlSAZcTsLpLzk+lvkvPpfsY9O2Ok6pRLe/1JDmmcUm6VFQziWsr57dTHcgDO5NNBDo5VTJTS3FuVVMRFRr82Gcz5pJpBJDMBNzCbTWt4BYoYBrOzGeAiVp2fu3BBFew3AQuq7Mwdto8NHt8rA3Fv0QfbZkqIoOazvqXr5dP8xp/g935pmu1EN8NGnDrD/gswn16tv1GIysSjdYQuPxDOqnYsHEol2+ETaQ36ZgkK9HHaF4Pq1K/hPUIlE1Z/fd+dmXh61fOx7Jb6At7/TlmKQ9ztGuK2XocRADVyMkpsvW0wep+x49QpARw4Jy1mfrMTFZetGgtzrve7IENRa1GV1+IWSZZl7pLVRAwdMvL1fDP0NnRtUWVaxQaZL9vWmvK+25K5u/kfK3nYclDhwk0CTDumltd6UJtmu02Az8nLSycrWV3FV78/mmvj084p1DltfII49hWFFuvO5rR8PPw4CXyRLLUeTMDmkK9d9IESL2TWSE2nF5SUlwWz3tBPAqJv2SFaF6DSgRqbHs3IirlzIROJnRGCsC9BzDb9B/qL36yxDzN4xUDxR4hQhl7+Lv/BTlWXDt+Orvg0jLNsFzERjMRYjwox6Qq9lCdI2xT65WwSXn0j1oS9KW0cn19ecNteyDcfSNHVWgEmA3bB8gQMQ8hNfFCIeEexd7b+Zu9v1rCy1G/2gh7nkaTacq9hQUMtMFheFUOBiPE=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gn8K5PVXb++wGaGPXo49SiG8KMrkyu6yEzWSgwb4Sc0UU1FR1CSjQv7kXS77szPrxCJ1YVJv4BO/oAlqLoR0KUE8xYfNtPqMi671oKb7QM7NlO4yiXMMEeDKWSF5gbTTEcZJb3W5TOr9Fqa08FDnT/IzlQwit6Bp8IP5hhy8m5WMHwAbacpojexoRk51wKEBi+5RlFKrX/deldMMGBENqcSUeEp89ZQW1NoxQLp5PzOCLLXZRoLkpXOCMjvWNpHhk8EpEQRuIxfBjIAyJm1SPKojNuPTgmOmByd8c+WT+0tc2ZLAwcBdKWk7NXQdzYgpzinmQ77XhQ5/QdH/XdLbFlrDp/LeG3PfeX56vyxtB7CM72saJtbOjn9svkRmApPKoKpwG/t64UxjXL05E/Ktw9aGLfSDQQq43MPUn3cvPh73d8uTy31ptGTH66WiRl4C
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 09:46:13.3574
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 008e2a22-d44b-461f-f005-08deac1d7a0e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AEB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF09E5F035B

From: Anupama Kunkulagunta <akunkulagunt@nvidia.com>

On some Tegra platforms, the RT5640 codec interrupt line
is connected via a GPIO controller that operates as a
nested IRQ domain. Since nested IRQ controllers only
support threaded handlers, request_irq() returns -EINVAL:

 rt5640 3-001c: Failed to request IRQ 186: -22

Switch to request_any_context_irq() to let the kernel
pick the appropriate handler type based on the parent
IRQ controller.

Signed-off-by: Anupama Kunkulagunta <akunkulagunt@nvidia.com>
Signed-off-by: Sheetal <sheetal@nvidia.com>
---
 sound/soc/codecs/rt5640.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/sound/soc/codecs/rt5640.c b/sound/soc/codecs/rt5640.c
index f6c6294e1588..f4bee5a68db7 100644
--- a/sound/soc/codecs/rt5640.c
+++ b/sound/soc/codecs/rt5640.c
@@ -2553,10 +2553,12 @@ static void rt5640_enable_jack_detect(struct snd_soc_component *component,
 		rt5640->jd_gpio = jack_data->jd_gpio;
 		rt5640->jd_gpio_irq = gpiod_to_irq(rt5640->jd_gpio);
 
-		ret = request_irq(rt5640->jd_gpio_irq, rt5640_jd_gpio_irq,
-				  IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING,
-				  "rt5640-jd-gpio", rt5640);
-		if (ret) {
+		ret = request_any_context_irq(rt5640->jd_gpio_irq,
+					      rt5640_jd_gpio_irq,
+					      IRQF_TRIGGER_RISING |
+					      IRQF_TRIGGER_FALLING,
+					      "rt5640-jd-gpio", rt5640);
+		if (ret < 0) {
 			dev_warn(component->dev, "Failed to request jd GPIO IRQ %d: %d\n",
 				 rt5640->jd_gpio_irq, ret);
 			rt5640_disable_jack_detect(component);
@@ -2568,10 +2570,10 @@ static void rt5640_enable_jack_detect(struct snd_soc_component *component,
 	if (jack_data && jack_data->use_platform_clock)
 		rt5640->use_platform_clock = jack_data->use_platform_clock;
 
-	ret = request_irq(rt5640->irq, rt5640_irq,
-			  IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING,
-			  "rt5640", rt5640);
-	if (ret) {
+	ret = request_any_context_irq(rt5640->irq, rt5640_irq,
+				      IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING,
+				      "rt5640", rt5640);
+	if (ret < 0) {
 		dev_warn(component->dev, "Failed to request IRQ %d: %d\n", rt5640->irq, ret);
 		rt5640_disable_jack_detect(component);
 		return;
@@ -2622,9 +2624,9 @@ static void rt5640_enable_hda_jack_detect(
 
 	rt5640->jack = jack;
 
-	ret = request_irq(rt5640->irq, rt5640_irq,
-			  IRQF_TRIGGER_RISING, "rt5640", rt5640);
-	if (ret) {
+	ret = request_any_context_irq(rt5640->irq, rt5640_irq,
+				      IRQF_TRIGGER_RISING, "rt5640", rt5640);
+	if (ret < 0) {
 		dev_warn(component->dev, "Failed to request IRQ %d: %d\n", rt5640->irq, ret);
 		rt5640->jack = NULL;
 		return;
-- 
2.17.1

