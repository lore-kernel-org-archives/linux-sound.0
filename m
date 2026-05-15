Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011012.outbound.protection.outlook.com [40.93.194.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF7E3EFFB5;
	Fri, 15 May 2026 16:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778861699; cv=fail; b=asYD0oQaITeKd1asV/GyO0P4JjfX2jn4ISuaGzTSZYMCC3mhcpZKf+I6Qf2jt0DdakoNSS8Ql/cZTFgE9OJ8UReAsbS3UAkwTQ6IJfKBOxPm+o5kBb6v0z3zOIz7vGQPEh6mudzHBLFiovb3Q7cQ4PcjC2zzYkblVK+zepPMV2s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778861699; c=relaxed/simple;
	bh=kLtEqwqnROmmCpZXx3lk1PUgHW+5ErUswH1Hzi+ZKoo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DxrcwR9Xu/Sfp9YUHiNB5uWDm93nA0EEBZckptPhPLUzOotHXppJOzsZtISo1Ys8hqOmsZQq4nzzW2GgwvjtmHg6MuqSnhHTnMGXY4ps+HHgoJLqH4hWl8pEbyL9uxTyOdK6cNhbPfHkWMMK90mb7PcjaY/JSrCK0xtu5Ohm+CI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=KJjla8pX; arc=fail smtp.client-ip=40.93.194.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="KJjla8pX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SnvrmAA7Q1T827m8tUqAPHo999JdgvNn4FXSXpRyQ7jq8rl+Ak06GiQ2hnUhJojHiyhUPVEaozV26DigpbPlLoO36zFN8+pAQl9IRA1SHeE5g1bFFBekb7iRS9ioXnAR1h2DrV+6MB0Vv1Uxp0+F5jEJMXNAHLBPcbdUiEy/7gR+SklYFCX7u5NyN0oT1M2RrAvluNoG0b1TyUFZlaAXOqptZAEL7bMFPriUe4wlHXnJ1fz3vWmJbSIO72VHF5HXGHv7oUsOAn2TYH/rM7dK6CyNJa8m6GhXwhcoOQMD6wE5ALn7htEFYDk77sJA4Z5KMBpRRkvRvmnLr6uN3sf08A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UKNvEH+YXR4yACpuK/yUYRogPqLW0H+cnhNQAMaDBR8=;
 b=aTdrV3ZBApdo+ioTALwJZEoIe+t4S6TBHfW4UG7wkqaE2NavTj4vInvC/5SU3Y3LgKjgmyhfuk9wya5Ass8z5jakb1A6QGK1coPWra9IHUdu0EgmrH9zPYBy6PpK+3pRbhpTg1Snzheb/a1loFzS4buRqXw4ZLHaBWPXeZ6A0MniYfxyFAvP2aGcBVEhT33yADtr0MRZDd3oHaQeMe3eJJzyvIo99fUPdJL8O+tW+kZbx+d9ZF6gRfSC2NLuZnD6haLy3kzU1SqwKCDUQgKsT2qMvRq6Uxl21mx8Jyf87r7fRgDBrooKDb1reYWTvudbLS9daCqgax+s9kp6n7ROQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UKNvEH+YXR4yACpuK/yUYRogPqLW0H+cnhNQAMaDBR8=;
 b=KJjla8pXNpth3B4iKP40Tpl0pnYQFlkq/4m2CKqLre6Qloe18I7RDjSNWnvIR5jRjuprw4OA9CbDC2ZzkojeerM95AjGKYR2Xie5WvlGgdm0rGRSKgm5k1Z+j6eiFE+741gEppyfkDpNsbiFv6TB/IuiLWYgcTNazHTI44Q5ST8=
Received: from PH7P223CA0026.NAMP223.PROD.OUTLOOK.COM (2603:10b6:510:338::31)
 by LVWPR10MB997839.namprd10.prod.outlook.com (2603:10b6:408:3c2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Fri, 15 May
 2026 16:14:56 +0000
Received: from SN1PEPF000397B1.namprd05.prod.outlook.com
 (2603:10b6:510:338:cafe::23) by PH7P223CA0026.outlook.office365.com
 (2603:10b6:510:338::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.20 via Frontend Transport; Fri, 15
 May 2026 16:14:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SN1PEPF000397B1.mail.protection.outlook.com (10.167.248.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Fri, 15 May 2026 16:14:54 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 15 May
 2026 11:14:53 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 15 May
 2026 11:14:53 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 15 May 2026 11:14:53 -0500
Received: from localhost (mz02jj9v.dhcp.ti.com [128.247.81.246])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64FGErVF573993;
	Fri, 15 May 2026 11:14:53 -0500
From: Sen Wang <sen@ti.com>
To: Mark Brown <broonie@kernel.org>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, Liam Girdwood <lgirdwood@gmail.com>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>
CC: <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Sen Wang <sen@ti.com>
Subject: [PATCH v2 2/2] ASoC: simple-card-utils: support system-clock-id DT property
Date: Fri, 15 May 2026 11:13:58 -0500
Message-ID: <20260515161358.1462453-3-sen@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260515161358.1462453-1-sen@ti.com>
References: <20260515161358.1462453-1-sen@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B1:EE_|LVWPR10MB997839:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c95f3f5-2d71-4c57-9748-08deb29d19f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700016|1800799024|82310400026|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	S8CnKFUz0fOXYROzuHD+L5vpB0Yqn+XB9YxQp5QMi4To9pC56GOzRBp6/XjD2wLgMca/J3jweIIxEMwFSJQT4GEyPZusHbv/x2yJ0IKNaCLq5L4o7AYjEPZfrk3VcNRlyjPUVw4ieWCsteVBPzR5EJpWt1Q++NiUYCaWPErRCHw27156OeA7OEpA5qcjxiRVlkN6rqaimTDnMfbQqsnIXvHV5m1lB7VllGs7/eoEOmWi1rU5YDeUiP8esavbG6AoHAjisfDu3VJZzcHO1Jr4IyUxmmuWhJrfZ0+4w7GtbcChnudN+7XOFtzMZ90KY6zAZL1fEe0JVENtYJsQmg2rqjChwMon7l2Epeyj4xI2t3+Te7Z9rgdkam8c0i9rWfZ/BZT/37zWYZHOLi8NOf4nrqPCq3SNVr+fNRwR6hx9v37wHw0qUdQ6ZuARdiqUNNhpRbiZgqO4LgyH8SkvKW8HCeRjLTYyv6uIHHKcT/iIdcM83OPynT9JAIpQ0sUFpFNMHtwbcexfQD1hIkpWk/CT2s25x8jWv9n0uTabDn8nU4SXp3T34+Eya+bv4YakV1oEEDPKeNESA1YI8g4N4bnWXu7AlXRfJ2ZkMKv23/n0pY6L58ujqyZIMgvbIm6v3PjbvgOJdikJo1Y1YgLlK2M44ExhYmr3Q/JdhbRYaOr78OsWfN6ody2z/T/tGVCkwztcyfIdPzZQh740ozIADxkDOEQTub7xvZ7ZXOiwEGb6eLE=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700016)(1800799024)(82310400026)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8gxrNL1N34ShVxVadnTcDvz7E6fyjnUzajua/xlPHbCTIUJxmPX8V0iNxZtYDhaUywGxSIbeJxv84mogcEeQ9s/MNlN9qeh1MFV5Cuwfwh92uMy2ROSdQZ/rfmGicB4oFRVwzjyOPe6Vrgx5CTyNS6k299bymXRP7OoXrPxm9Tj7OjQNc39W/tL6NQUue0E9tD8xXSLZJ/MZvWdzuMXzezH2i0jksd6iPr32JvRGDLEEjBhm8BEnpQfWPM04kk8rtr1QBcbkqJsr5c0mMaO6IPyeZWxc8PxM1qSTJM3iZtYizV7qBMr79UZdwGNSbztne7L1RjaxQuy7CPLHT6mUc6oqNVGzaiaQWiprRY1vRniq6R8F8sJXE4x89uUEUlb1AIOQLjOEz1n43CYBK90DhmlGa/jPJNPgEqk7hL0Ldb75XXJ4tEcmy6t/elyFcY9V
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 16:14:54.8103
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c95f3f5-2d71-4c57-9748-08deb29d19f8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVWPR10MB997839

The generic machine driver never had a mechanism to adjust for various
clk_ids that is tailored for individual codec & cpu peripheral driver.
simple_util_dai_init() has hardcoded 0, thus making non-default clock IDs
unreachable from DTS. Boards needing a specific clk_id have had no choice
but to write dedicated machine drivers.

Add an optional "system-clock-id" u32 property to the cpu/codec
sub-node and use it in all three set_sysclk() call sites. When absent
clk_id stays 0, preserving identical behavior for all existing boards.

And since simple_util_parse_clk() is invoked once per sub-node, per-DAI
independence can be preserved as cpu and codec sub-nodes carry independent
clk_id values.

E.g., the following dts topology would be supported:

  cpu   { system-clock-id = <6>; }
  codec { system-clock-id = <1>; }

Signed-off-by: Sen Wang <sen@ti.com>
---

Apologies Morimoto-san, when finalizing the patch I realize a few more
places need to be changed, can you kindly re-review and give your
acked-by?

Changes in v2:
- Adopted sysclk func changes for mclk cases
- Links to v1 (RFC):
https://lore.kernel.org/all/20260514212802.3569643-1-sen@ti.com/

diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
index 915e6ae5f68d..f221fba92e5e 100644
--- a/include/sound/simple_card_utils.h
+++ b/include/sound/simple_card_utils.h
@@ -26,6 +26,7 @@ struct simple_util_dai {
 	const char *name;
 	unsigned int sysclk;
 	int clk_direction;
+	int clk_id;
 	int slots;
 	int slot_width;
 	unsigned int tx_slot_mask;
diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index 4cf3a5395763..ce7e960db5e9 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -290,6 +290,9 @@ int simple_util_parse_clk(struct device *dev,
 	if (of_property_read_bool(node, "system-clock-direction-out"))
 		simple_dai->clk_direction = SND_SOC_CLOCK_OUT;
 
+	if (!of_property_read_u32(node, "system-clock-id", &val))
+		simple_dai->clk_id = val;
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(simple_util_parse_clk);
@@ -506,14 +509,16 @@ int simple_util_hw_params(struct snd_pcm_substream *substream,
 			/* CPU first */
 			for_each_rtd_cpu_dais(rtd, i, sdai) {
 				pdai = simple_props_to_dai_cpu(props, i);
-				ret = snd_soc_dai_set_sysclk(sdai, 0, mclk, pdai->clk_direction);
+				ret = snd_soc_dai_set_sysclk(sdai, pdai->clk_id,
+						mclk, pdai->clk_direction);
 				if (ret && ret != -ENOTSUPP)
 					goto end;
 			}
 
 			for_each_rtd_codec_dais(rtd, i, sdai) {
 				pdai = simple_props_to_dai_codec(props, i);
-				ret = snd_soc_dai_set_sysclk(sdai, 0, mclk, pdai->clk_direction);
+				ret = snd_soc_dai_set_sysclk(sdai, pdai->clk_id,
+						mclk, pdai->clk_direction);
 				if (ret && ret != -ENOTSUPP)
 					goto end;
 			}
@@ -521,14 +526,16 @@ int simple_util_hw_params(struct snd_pcm_substream *substream,
 			/* default: codec first */
 			for_each_rtd_codec_dais(rtd, i, sdai) {
 				pdai = simple_props_to_dai_codec(props, i);
-				ret = snd_soc_dai_set_sysclk(sdai, 0, mclk, pdai->clk_direction);
+				ret = snd_soc_dai_set_sysclk(sdai, pdai->clk_id,
+						mclk, pdai->clk_direction);
 				if (ret && ret != -ENOTSUPP)
 					goto end;
 			}
 
 			for_each_rtd_cpu_dais(rtd, i, sdai) {
 				pdai = simple_props_to_dai_cpu(props, i);
-				ret = snd_soc_dai_set_sysclk(sdai, 0, mclk, pdai->clk_direction);
+				ret = snd_soc_dai_set_sysclk(sdai, pdai->clk_id,
+						mclk, pdai->clk_direction);
 				if (ret && ret != -ENOTSUPP)
 					goto end;
 			}
@@ -587,7 +594,8 @@ static int simple_init_dai(struct simple_util_priv *priv,
 		return 0;
 
 	if (simple_dai->sysclk) {
-		ret = snd_soc_dai_set_sysclk(dai, 0, simple_dai->sysclk,
+		ret = snd_soc_dai_set_sysclk(dai, simple_dai->clk_id,
+					     simple_dai->sysclk,
 					     simple_dai->clk_direction);
 		if (ret && ret != -ENOTSUPP) {
 			dev_err(dai->dev, "simple-card: set_sysclk error\n");
