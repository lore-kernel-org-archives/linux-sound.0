Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011053.outbound.protection.outlook.com [52.101.52.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78F4329392;
	Fri, 30 Jan 2026 05:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769749854; cv=fail; b=qwo34on6feXZ7Vz4V9q9zGoKMNeVN7k3nnCBc/Lfws9QugyJO2sYHN9unqsOfQAVxfpEb4gfs8Gvv2+/hvtQmJv7aNoQnGVf2OZIl/OkjBjXN0F9mQ9F948j2Nfg/5qPjXbkEy7KlixT8dKX27xGbuKUY2frOJytoVMJxmxdgIg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769749854; c=relaxed/simple;
	bh=QyIXjefb5CW3H0ywH7TBnPftSYFtsRplzyQcCuQulsk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fl2KxD1OJqoWgCQaRKodNEi7nntySJEODmNlzWjspWzUSS0PHANDMiEGLVSUUN8mhUcuL1PMp7GbChujlsIIWEXCqekMk9HP/2FCDQa6VCf3WiXJ+ra2UZvhs3f7YjkvumYBihc5V36OmiRtT/lyDbMGLT7jrBwJ2aEr+w61d0E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=gSJDyWrz; arc=fail smtp.client-ip=52.101.52.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="gSJDyWrz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vb/d1Hb919K0IsAzrXCksVbquNhl42lWy5WzI4xtUYViFz2AYjLuJckU6tTMIykf8QjQre5YTGY/x1mby3X6DS5tL0NCm81D4bIy4WOcFnZUfZ3XH/5fq4QQxrObKY7SHFMglJljpVRiC4XkRIiHSFNtSAJnYfBfeT8FUVCCTReJ57Ycj8ZAuf+ARvG4xYyRL0yzINiRMdkqvzqy1i0H13DRI7I8mzOuZyWH6lZsk7HmWoKenMRy85kvX5shD15iB6vOgQBiha39WYgGLYE8mEpAzDqpdZVmr8VNY/xej8N9SjxgT44wGNLlUOD/R+uT5BjLAcdX4oYGAWhUWKvEFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hkAy5SZD2O7aRDAlY2U/PevHlCeGS+HC250YkWDjz/8=;
 b=DaG4wvcwmp9+R+jMsHJd9MxI3QWOLrY69lsunTvdfUM2LMFW2xkaRr8/8ZQnvPKP5JOv7oqUGUcKgfKo1hzaITftq/9thsZ2cSv4c6Ot14Fbp/dwvcUhZ6rNRqILBUdrvNj2katcnV8cQzEfKDgBkXmw9GC0JmzGQMagsQglNg+obxxjvBKTN1PwAHYVYcbwU+1A4fuwdklxFDzLmYUkOA+gpZl+LAj9OiXs1vnNwqbvM0dEdax/pkJC+FNeT+xnH9IxtfkBs4BV0rHhTnMrDq4mb5FnG9i9cQAhHpJjAso+vjn0bMahEHQL6H67RXtSf8gkuu2UCTdXYePeruf4ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hkAy5SZD2O7aRDAlY2U/PevHlCeGS+HC250YkWDjz/8=;
 b=gSJDyWrzlCed22Vk/GUgwW2YfgAr8tJ+cANBn8puqTgXMeBKOYhV5MjVlgc+eVxclQy8s5+QPqgIlCUiXjDNLgyMmpGLZM8Tg5rMgGNO+sVkW21AnQivntOLtd0Wz3NF1P4PfigcV/GJKKKdZ6SUS42xMwPWBDryBqHP+d2/k+w=
Received: from BYAPR06CA0026.namprd06.prod.outlook.com (2603:10b6:a03:d4::39)
 by LV3PR10MB7748.namprd10.prod.outlook.com (2603:10b6:408:1b4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 05:10:50 +0000
Received: from CO1PEPF000066EC.namprd05.prod.outlook.com
 (2603:10b6:a03:d4:cafe::ee) by BYAPR06CA0026.outlook.office365.com
 (2603:10b6:a03:d4::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.10 via Frontend Transport; Fri,
 30 Jan 2026 05:10:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CO1PEPF000066EC.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 30 Jan 2026 05:10:49 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 29 Jan
 2026 23:10:46 -0600
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 29 Jan
 2026 23:10:46 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 29 Jan 2026 23:10:46 -0600
Received: from localhost (mz02jj9v.dhcp.ti.com [128.247.81.0])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60U5AkpV748621;
	Thu, 29 Jan 2026 23:10:46 -0600
From: Sen Wang <sen@ti.com>
To: <peter.ujfalusi@gmail.com>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
	<perex@perex.cz>, <tiwai@suse.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Sen Wang <sen@ti.com>
Subject: [PATCH 3/4] ASoC: ti: davinci-mcasp: Streamline pdir behavior across rx & tx streams
Date: Thu, 29 Jan 2026 23:10:43 -0600
Message-ID: <20260130051045.1898892-4-sen@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260130051045.1898892-1-sen@ti.com>
References: <20260130051045.1898892-1-sen@ti.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EC:EE_|LV3PR10MB7748:EE_
X-MS-Office365-Filtering-Correlation-Id: 349c2217-d1a7-469e-be60-08de5fbdef30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QXwhTSs7e21c1gxU0jZeNJuM/H7dWXcUJx3RUzd8APK8BK+DYw7toI2Y6ELJ?=
 =?us-ascii?Q?C58q6FVCQiD+Oksh/Ifmao0yDGfwYohoK2cma9BbilblI2qJvVXjZ5WFqPB1?=
 =?us-ascii?Q?PA5JOi8udWk/x2x84Kma8Ur9nl1AroUbn8vFC3QPzKudyFjSaNbTcWZqbEtd?=
 =?us-ascii?Q?A/hWSZzRuDJ0sfxqdC+S/B3YCOqLvsuK2TVOlPsiezJjRG3OigAlJoY917sw?=
 =?us-ascii?Q?pQvseauwmCJYFq1sYNg1gGdZhoVo+p4iZDSashOk0B/YUoIT1UuZqUwmeAwr?=
 =?us-ascii?Q?fcuXlu4IVgJwX9bWPBfx7T7GEhJitlcEbFCJYO3vMD80uClCdjq8b55eCpQK?=
 =?us-ascii?Q?ZyrONDhDq73KfvivvGrarhYx2sO+CakeSidrMw2oqHFPRuuf8FEAymD9sbRr?=
 =?us-ascii?Q?95p88NDErXdKGBX4tYW0zIBgVeQHkiJx0Z9UvVRymqbhHlLc8lIeKZ6kPoai?=
 =?us-ascii?Q?S2yZ0Yaui53Dk/RW15ckYiEkjddRC2dv5264eS4iQbqMrIZ6dvX2w3dUcxvw?=
 =?us-ascii?Q?V+Pr5p/6hv7B7xSqfIixe/s8mq2tzDamMkxzbETgQytmKu+4cFqeUaT3T5je?=
 =?us-ascii?Q?nFviJCiQRuTMj5nIF4oeI2ApL5TZQoi0RT8QiHyFFaz5IyJRw4OVt0lMmYQN?=
 =?us-ascii?Q?koSGz4Whdn/m0Kbv0nDO4IjCIzgbsJ6Kws9imuVbmKSkLAZZ3FURzPKs3hIi?=
 =?us-ascii?Q?wR3Xd4C5566iKmCdMJ3iGcNAHkaHITUgC5riOD9iPtoy5lEsek6RqW4RWwi7?=
 =?us-ascii?Q?RgIDVHQXjPSRar377OWPFxX7o+n340otbD7Q47i7s4xSad3xqSv7rY4aR96X?=
 =?us-ascii?Q?CZBjQ7q4dN1NnQlidmaxk6bmquWGR2q9RodF2O+Z/MMSO5NjulRxOBLD/zhQ?=
 =?us-ascii?Q?NIGAKPB64gfwveOlLUxBlTiHT3R4Wsivjp3yzlkXrocWHqm/4VtT6V1zFkeZ?=
 =?us-ascii?Q?z8rZB51Hyy16AT5k4b6OVc67579qwFZtXaRATjPT1vKtv+JEFISgWo3gYKqj?=
 =?us-ascii?Q?ZY8ZfYEhEyX8vz8RSa4p7GAnkBtsbZWkbum09nl1/jA4EwLGbNuPnyVMqgZ8?=
 =?us-ascii?Q?qKHCtHaRfY1MnzcneoQBzjYEaCbw7T+yHXJNv8Subos6N3CsrbI6lY85pYpC?=
 =?us-ascii?Q?el0qsLcs1YyW7cwSARf0vDttik1iyxZh6k9kYBQYGmoqB5MojcvdZsy8d03d?=
 =?us-ascii?Q?7eg+KGsqSWT2zh8roDRg/kGoFRU3i1uLTyRfz9e45zyybwRchklBfcdJd7Dc?=
 =?us-ascii?Q?A9NejhM2fgU4/EV+sQrc0pmUvHFKWgb6IimZ/jfkARQV4BU6ha4OAlwwyiCn?=
 =?us-ascii?Q?XvCRhbgptFA41+27CMrhwcW1OAdZehaolXzfQBQa9W0XHyIvhzNXs1Fyo62J?=
 =?us-ascii?Q?ALNGgjkZuHBH9iQbOJE03HTy+kG361G2LZxuANGhyyTBEgVlByHrqBDUAKK2?=
 =?us-ascii?Q?tqtDSNY8x3lxfMsLchtNDHIzRw6lGh0EFE2wvmnNJ+lyk8vLvAw4lRMHQ73x?=
 =?us-ascii?Q?CyBnBn1J5ZHBXs4Eng8ZwrEe5kxMqQ1wAwUKHaA+OsSrspQSKPNXJD9ZE104?=
 =?us-ascii?Q?zdIjeDFvy1R3B5IyKYM4SCos6GhCWznoWSedy4RfMqrtPRUsA7wtUVrXl1Jg?=
 =?us-ascii?Q?bZWGR0WGBRPuSghj8nAEH8VA+qmpFWPjXt6XpgOw1Uq5mKT3qLekiU7O0tmw?=
 =?us-ascii?Q?cN/Plw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hxyDZrMQzdymYVtaVi66FmGoaIuy2Ya9YHJO1TLHbp1ARCnKEfszkbcSPDppyRhFyamX71CqMnrqSOCGRXYSiMe6itdD4rTq5w59G12v2hOSYb+wgDfK9TztgSn1S2vQ1Eb5m9erKdUKTbxQF4ONPmhZvaMHeI4jkLVQnVeCi48VSBPz/CEgwuEQJJy2pTAOdVdGCcUNfIiJPcjUVoavmzuTV9epdeISuggTrfoUg+auv21JmFU3jWfULIPwIsdrA3rnXNKpDilumhbQC2amfF40bef2X89KYPIP+GXrUlzeif0q0pc10SfgigRRJGOwXtE6JqaNwlR/VlAd4qSua65UYSaizDQZ+Wmn3UvbMJKt0Hv/5Tb2qVWzeUjKsrq8XA+rD9rXmm8wJOqN2Yds+XNizIyw6ph/x8XPbQ5+Db4kOt0reHF0i01IZmev2ijK
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 05:10:49.8258
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 349c2217-d1a7-469e-be60-08de5fbdef30
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066EC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7748

Simplify the mcasp_set_clk_pdir caller convention in start/stop stream
function, to make it so that set_clk_pdir gets called regardless when
stream starts and also disables when stream ends.

Functionality-wise, everything remains the same as the previously skipped
calls are now either correctly configured
(when McASP is SND_SOC_DAIFMT_BP_FC - pdir needs to be enabled)
or called with a bitmask of zero (when McASP is SND_SOC_DAIFMT_BC_FC - pdir
gets disabled).

On brief regarding McASP Clock and Frame sync configurations, refer to [0].

[0]:TRM Section 12.1.1.4.2 https://www.ti.com/lit/ug/sprujd4a/sprujd4a.pdf

Signed-off-by: Sen Wang <sen@ti.com>
---
 sound/soc/ti/davinci-mcasp.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
index aa14fc1c8011..4f8a2ce6ce78 100644
--- a/sound/soc/ti/davinci-mcasp.c
+++ b/sound/soc/ti/davinci-mcasp.c
@@ -235,8 +235,8 @@ static void mcasp_start_rx(struct davinci_mcasp *mcasp)
 	if (mcasp_is_frame_producer(mcasp) && mcasp_is_synchronous(mcasp)) {
 		mcasp_set_ctl_reg(mcasp, DAVINCI_MCASP_GBLCTLX_REG, TXHCLKRST);
 		mcasp_set_ctl_reg(mcasp, DAVINCI_MCASP_GBLCTLX_REG, TXCLKRST);
-		mcasp_set_clk_pdir(mcasp, true);
 	}
+	mcasp_set_clk_pdir(mcasp, true);
 
 	/* Activate serializer(s) */
 	mcasp_set_reg(mcasp, DAVINCI_MCASP_RXSTAT_REG, 0xFFFFFFFF);
@@ -311,10 +311,10 @@ static void mcasp_stop_rx(struct davinci_mcasp *mcasp)
 	 * In synchronous mode stop the TX clocks if no other stream is
 	 * running
 	 */
-	if (mcasp_is_frame_producer(mcasp) && mcasp_is_synchronous(mcasp) && !mcasp->streams) {
-		mcasp_set_clk_pdir(mcasp, false);
+	if (mcasp_is_frame_producer(mcasp) && mcasp_is_synchronous(mcasp) && !mcasp->streams)
 		mcasp_set_reg(mcasp, DAVINCI_MCASP_GBLCTLX_REG, 0);
-	}
+	if (!mcasp->streams)
+		mcasp_set_clk_pdir(mcasp, false);
 
 	mcasp_set_reg(mcasp, DAVINCI_MCASP_GBLCTLR_REG, 0);
 	mcasp_set_reg(mcasp, DAVINCI_MCASP_RXSTAT_REG, 0xFFFFFFFF);
@@ -340,7 +340,7 @@ static void mcasp_stop_tx(struct davinci_mcasp *mcasp)
 	 */
 	if (mcasp_is_frame_producer(mcasp) && mcasp_is_synchronous(mcasp) && mcasp->streams)
 		val =  TXHCLKRST | TXCLKRST | TXFSRST;
-	else
+	if (!mcasp->streams)
 		mcasp_set_clk_pdir(mcasp, false);
 
 
-- 
2.43.0

