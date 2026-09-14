Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012009.outbound.protection.outlook.com [40.107.75.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B43930DD10;
	Mon, 14 Sep 2026 01:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789351028; cv=fail; b=ZzVG1BluXvku20+2O1AfJgMEGxsgdD+1X1SOWDibGsQWivVq0J2cXt+VQdsJe60VoXrhQ1J7u6sCbYK+cviyiSInUKnkSrvPbB35P48EiA9/bARB5XmVILfzXsuH/zymhxYIRUO5rmFEAIuUE2Nsct4t5WotNZVFCBdCGM7wzrI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789351028; c=relaxed/simple;
	bh=kDlMbxzbfpUkEg5KF6YuM5b1sNPU98Tyb41guAP4tRg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RwO0B0shM8duDr/HlliNM2QhqloBJMjRjRz+rbkvVq4Pv9tKfJ85Q8E8ifzv2Jy9I2emXPgQHwpuc4Ar5zyaVOFp6X4mXF3Mb/lwFS5ITsCtnv0b/eZp0XKXDuyRxm+vkgZNLk9ih7+1KMNgIMchVBr6Efs5yK/X4bMOYpOnxtU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nuvoton.com; spf=pass smtp.mailfrom=nuvoton.com; dkim=pass (2048-bit key) header.d=nuvoton.com header.i=@nuvoton.com header.b=KaP3Q89B; arc=fail smtp.client-ip=40.107.75.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nuvoton.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nuvoton.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nuvoton.com header.i=@nuvoton.com header.b="KaP3Q89B"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rZ7dDqZTednqqmkx10BWVlVFdzjebXInVX0WrzfAiau7tR1IFqDSgfiFwRknzhhPSdYFcK/jGQeGwYQEVtdGax1OgSzzaO+ar0/+cVTa5hAGQCVikdbYOFj1R1voAFhKtKSO/TnNIlwld0rPDrZRZeqB2DpIP7tIWzKv+G8tvMjTtX7MRpTZf342g6Cp4CnFQh4C2gGjS8CeH+7AXtU7Zo418AdclTVsPn8q/QZnmT9oERpHFas4s3akIjMxoD3IjiJen5pRL0ivvSXTxyWQiVF+XHBd797EsAr0Hq7C7I+xmBqN4+1XwN+gSn8duwjf5FaN6P/l84Gg9ENvzNwlrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ijuNyx63mv5Vtx9n3EuW3O6VvF79aFEO4k2v+o3fJE=;
 b=aKnzMkjrMN65Gp01Vr5Owp84UTAuPGPWHs7OoRE2pYvANC09PFY7N1TyJCRa+rA0cirMr8mv9RWNP5CQfOdCLHBbvjX+fttvVCZjCEvz8r6Sa5CILcC+BQ7QeoG9wP406BQAX3gvUYWVxjxI+k1pV9k6TQ9Uq1VMkZXZ5V6fvwlb6kZ3FH0BbS0tmplS4BB5DPMDnd1wtnfrH+Zaeb8XLO2/ULJdsIq90l6cQTs9jKFND91gzLuU/UPzCXbwSQqWi83IK3gv6xH8VlB1zaV3GT/G8jIjcrr0W1kJGeBI/UjPzHtHeCw82/+Sqe4d3R8OLBlMU5bpo0OwdTY+9cOfyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 175.98.123.7) smtp.rcpttodomain=kernel.org smtp.mailfrom=nuvoton.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nuvoton.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ijuNyx63mv5Vtx9n3EuW3O6VvF79aFEO4k2v+o3fJE=;
 b=KaP3Q89BWQVUQnHvhEQzbPKuOyG+O+cee3Y0FGf9VorW0Oz8fLV/ddf5Bogehcr19z2m2sqZwKLP4fMiWpvt6rHjwlAlfWLQ0T5XiIw1NOik/wztR1AtVsbaQp++H2QNnSBKtsH5hBwtz2ECGiufLQDaDrYKmHGdz514wzhHbMFECNldJIoik8yQGGnMweUgWnEEBKpDwu5LvcK0y8n/1aIoRUPNCcU3j/Ab2YH25DixeWwXrbL6HruvbXrAW3yGwgQ60EucuReLnBaZZeXkyPWRwCpolFKzL+RrQDFYghk9uy6kOr67u9ZB6QGT/sQ7AOhHPmmxBoKUcjA+/lmAZQ==
Received: from OSTP286CA0104.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:219::18)
 by SEYPR03MB7681.apcprd03.prod.outlook.com (2603:1096:101:13d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 01:56:56 +0000
Received: from OSA0EPF000000C9.apcprd02.prod.outlook.com
 (2603:1096:604:219:cafe::2e) by OSTP286CA0104.outlook.office365.com
 (2603:1096:604:219::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Mon,
 14 Sep 2026 01:56:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 175.98.123.7)
 smtp.mailfrom=nuvoton.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nuvoton.com;
Received-SPF: Pass (protection.outlook.com: domain of nuvoton.com designates
 175.98.123.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=175.98.123.7; helo=NTHCCAS02.nuvoton.com; pr=C
Received: from NTHCCAS02.nuvoton.com (175.98.123.7) by
 OSA0EPF000000C9.mail.protection.outlook.com (10.167.240.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Mon, 14 Sep 2026 01:56:54 +0000
Received: from NTHCML01A.nuvoton.com (10.1.8.177) by NTHCCAS02.nuvoton.com
 (10.1.9.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.61; Mon, 14 Sep
 2026 09:56:52 +0800
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCML01A.nuvoton.com
 (10.1.8.177) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.61; Mon, 14 Sep
 2026 09:56:51 +0800
Received: from localhost.localdomain (10.11.36.27) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2507.61 via Frontend
 Transport; Mon, 14 Sep 2026 09:56:51 +0800
From: Neo Chang <YLCHANG2@nuvoton.com>
To: <broonie@kernel.org>
CC: <error27@gmail.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <linux-sound@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <alsa-devel@alsa-project.org>,
	<neo.chang70@gmail.com>, <kchsu0@nuvoton.com>, <sjlin0@nuvoton.com>, "Neo
 Chang" <YLCHANG2@nuvoton.com>, Sashiko AI <sashiko-bot@kernel.org>
Subject: [PATCH v5 2/2] ASoC: codecs: nau8360: Fix AB-BA deadlock in mux update
Date: Mon, 14 Sep 2026 09:56:48 +0800
Message-ID: <20260914015648.311986-3-YLCHANG2@nuvoton.com>
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
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C9:EE_|SEYPR03MB7681:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f18ab0b-f820-4a56-9950-08df120373bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|82310400026|36860700016|22082099003|18002099003|3023799007|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	RYJc7Mk494Sz8aAti94ZAFNf0++euf6yCQjJeLp0OfHnbi9kmLroEPZXS8W2Zhh/wkdVq2wZHQtCC0q+MTENVRIgsGN+kwVtG8oD+i0lN/ehjL0+9DDiDBSX7856L2j7ksHRTRIlMbHRgKHf9p9fkursB0hM36xBMkqIUEBCUJ8xa1Dy/YmoVbADpZ6f5V2MyR7To7h2lZSxV+omhKV4QRrI3qDwKHuhpVtezAOV+oe2oUxid/OogUM8qIvvuJ43KcxhJaouj0Gqqm5cKRftqOtKZYoaGzXYTQ0hmeoh76g1c2pNelBJYRJwqTc4VEzD4DfqUfxA9u3l3lQ3jR5IKDUVXB5YGRniW/N7XIin2vhyK1kgoX4PbzRfOn9HTQA5XrY0tZJgtuVJ/63Bh6SooW6YNo7LP75V1TnGKDdYew2T1q5dwhZQv2mP1ejBsB8YeLdLKc7JFQE4DYGsVrOH7iP0dUNgMLBS/SU/krWuW0S8a8EJaSzQpD7tAvBMEf2Vwh4adFNKasHoqkhgy+mDY5E03BuqIhIT2zLG/Xgqjsgy7x554fwlY3v1Nr8z6YpS24fmdjfQpyZwKR59VfGlkOQEDhDIxehbTlyliTDA8Qly+OSY1+Br5XyWq6hiprBdLmwjeZUoxk7Rgk8h+MCiFw==
X-Forefront-Antispam-Report:
	CIP:175.98.123.7;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:NTHCCAS02.nuvoton.com;PTR:175-98-123-7.static.tfn.net.tw;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(82310400026)(36860700016)(22082099003)(18002099003)(3023799007)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	a1M5y28RhkRSe3thHOAfh2hl4RMPErs7roA7PtrAm6r3ZKb0sWLXXDRvPKr7kY2C1YUamjafh+D4e07Kej2svirmZJ4UvSVMOHBSI11T+UFhrQ/9rNApTljMGseUGLiu3BPMx1nMnnMyn2w7xBZMorgQv2XgHf7dYMA2JykXwI9pJHQ/se99Wui3jxASz3xdLwa8ifTqyRT6yYiPdPML/dHNJXCsSNap2O46Kk2vp9l8NWckwle4bU76tAlLq60CAmziEQcI37NrE6TFpdN6i3DuyGzsfmR43uicyfqfjitLDVo1ff7+FPfwqXJRWJuZnyyCFea4DPq0QUqYoiAj/uC5v51qD6StnKsMJriA7+s+nYDP/XuDOaDXGYDAOdNLjvtXaSCKt73RdlIwAfktenGnEpJlRpaPS4Lte+/ashOs9ny8M2+LdIv8f3w4cRhR
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 01:56:54.5102
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f18ab0b-f820-4a56-9950-08df120373bf
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07;Ip=[175.98.123.7];Helo=[NTHCCAS02.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000C9.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7681

nau8360_dac_mux_put_enum() acquires nau8360->lock before the DAPM mutex,
causing an AB-BA lock inversion. This deadlocks with concurrent stream
startups or mixer updates, which acquire locks in the reverse order.

Fix this by replacing nau8360->lock with the DAPM mutex to protect
pre-checks, releasing it before calling snd_soc_dapm_put_enum_double().

Reported-by: Sashiko AI <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/patchset/20260908030342.222655-1-YLCHANG2@nuvoton.com?part=1
Signed-off-by: Neo Chang <YLCHANG2@nuvoton.com>
---
 sound/soc/codecs/nau8360.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/nau8360.c b/sound/soc/codecs/nau8360.c
index f5dee12127cd..f0942739d7ab 100644
--- a/sound/soc/codecs/nau8360.c
+++ b/sound/soc/codecs/nau8360.c
@@ -689,6 +689,8 @@ static void nau8360_dsp_switch(struct snd_soc_component *component, bool enable)
 	struct regmap *regmap = nau8360->regmap;
 	int value = NAU8360_PEQ_BAND_8;
 
+	mutex_lock(&nau8360->lock);
+
 	/* If DSP is enabled, unstall HW3 engine and DSP, loading DSP firmware,
 	 * and configure PEQ after dsp reset.
 	 */
@@ -702,6 +704,7 @@ static void nau8360_dsp_switch(struct snd_soc_component *component, bool enable)
 	regmap_update_bits(regmap, NAU8360_R9D_PEQ_CTL, NAU8360_PEQ_BAND_MASK,
 		value << NAU8360_PEQ_BAND_SFT);
 
+	mutex_unlock(&nau8360->lock);
 }
 
 static int nau8360_dac_mux_put_enum(struct snd_kcontrol *kcontrol,
@@ -714,27 +717,26 @@ static int nau8360_dac_mux_put_enum(struct snd_kcontrol *kcontrol,
 	unsigned int *item = ucontrol->value.enumerated.item;
 	int ret = 0;
 
+	snd_soc_dapm_mutex_lock(dapm);
 	if (snd_soc_dapm_get_bias_level(dapm) > SND_SOC_BIAS_STANDBY) {
 		dev_warn_ratelimited(nau8360->dev, "changing path is not allowed during playback");
+		snd_soc_dapm_mutex_unlock(dapm);
 		return -EBUSY;
 	}
 
 	if (item[0] == NAU8360_DAC_SRC_DSP && !nau8360->load_fw_done) {
 		dev_warn_ratelimited(nau8360->dev, "Cannot enable DSP: Firmware not ready or disabled\n");
+		snd_soc_dapm_mutex_unlock(dapm);
 		return -EBUSY;
 	}
-
-	mutex_lock(&nau8360->lock);
+	snd_soc_dapm_mutex_unlock(dapm);
 
 	ret = snd_soc_dapm_put_enum_double(kcontrol, ucontrol);
 	if (ret <= 0)
-		goto unlock;
+		return ret;
 
 	nau8360_dsp_switch(component, snd_soc_enum_item_to_val(e, item[0]));
 
-unlock:
-	mutex_unlock(&nau8360->lock);
-
 	return ret;
 }
 
-- 
2.25.1

