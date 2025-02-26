Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011061.outbound.protection.outlook.com [40.107.74.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9363194AD1
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533826; cv=fail; b=W/wjuzMj+Fk2EX1IXc9sgxXhCUIoPLapogJO0cj+oSqRrcDcXzwD4j1bJiGvhLXYVchgJAY6OI0lQ+YVK58rQKlEb9T/BFLkpc1gnR0VGy2JczxOZFf3CqHuvqPhMasGAZ6bPWMIMl3DDPsc77tot2uV5+kY4R5gwKSWvrSn/JM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533826; c=relaxed/simple;
	bh=p3PaOlClosfYCHi4UQBIr5leCYLCwLKkQV+rwpVbt24=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=rgTW0MYawjUXnCjrv9hZvGqrPgnoVdAYUVfq7JriNeMKgGou64jlDXMenSZKs6LPmAQ9AVpEZg6P1VXnLLeDntF487Vs3EZo5srAa0irAFdW0X9u0FTlKA2/KnZsRhoFngcmnI6PyVaSmtQjXQh9iBJoz1+S9AXMqGYU9rqF7O0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=G0bLoDq2; arc=fail smtp.client-ip=40.107.74.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="G0bLoDq2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=omE8J3u0d9+lBQnIDYVhv31eNQl3zqTLOrmleQk2IBATBDTmGAtaSYKntZVajEWyWJcR6eEHzu4J2blnYSqm15n1nw+qgkEBuWykLYX+3uayk1Lz3ujo7ifE08rgpGC9pFLrRSBIMJrSgy12DkvWn3bZ2mWCAyfG52eJC9dbt7EquBC2saC9Pmy7cai1r/YbXwUIrm1CVO3Dh/fgQnK/Rn70Pl5O8xvjgYmCEIpj9cKV0sXhWyI4g12cRNg9NhDaGXuhoreiEZP56n/jEMbHiRIiKxXwvgB16XjxSfYOVnmlIVmCa2kL/WYyz1xs4oy4xJOTzlbuFWB8pr5BC3FJ+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l9+F2Ar8p9lXIGFHgJuqKp1rbtK7A1eSp0UCuBwshuk=;
 b=lkjq+nD52SASLfAI2R0EJ6UNWqzufp8q/IgFULXTUzHxgpEPddRlkezsuDT/eflIe5pN27N81pEqFi5UkoiHVSt1V9Sm8/S6PTT6ok8MbmgASJ2uuNUqbCDakuqcjquVSyIhSsWhc7+kTJlb6YEFAg2px9OKRR6fR3Ere3SI9K+ah3ScuM+MMEwrOpDP9Vp6pURYwO96jbRhPR/k6yA2K0L4WaJStLd69+z4bvSYFfgfDhUK9VZmwJLJ/N6G3POdKa5e7j11+6HGijxgElaN6XUZj8eJPec6hs8HZ4ZRzHghIvuAhXfSAmMMXWBDFIjGho+opVbG6YEPUVBqFqEIFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l9+F2Ar8p9lXIGFHgJuqKp1rbtK7A1eSp0UCuBwshuk=;
 b=G0bLoDq2MT4Cv/iimpgxUIRFQRJDR33IRklClD43REe0BYYeNlvmx06JbI6AbXHYg2ls6ylp+DlPJ/2cGhDAumZbidCMaXdJE/ig3o8q3LraMpieU4OAsfJdUiElJOZAjlkBiuJ1aZDsSkhxSh7P09RUoAuugXnjW9ofOtc7ktk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS7PR01MB11967.jpnprd01.prod.outlook.com
 (2603:1096:604:23e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 01:37:02 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:37:02 +0000
Message-ID: <87y0xta3lt.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 112/157] ASoC: meson: meson-card-utils: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:37:02 +0000
X-ClientProxiedBy: TYCP286CA0166.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS7PR01MB11967:EE_
X-MS-Office365-Filtering-Correlation-Id: d58bc052-c3ae-4cab-53cc-08dd560611b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RR2EZBmrjSUhClnrK7LSx0CPsNavgziT1U0a1uGfZmKErFBJs8iV07rn3gzn?=
 =?us-ascii?Q?5QADwu7PzhkL5urTFviYFBrL1oMlJjvn8gX5QEekgsls24K49Yqvai5c0tUO?=
 =?us-ascii?Q?47QuuUcPb5P95vAcTu+npC9JxPVU3uF5LHDLa+7Jhzs7Lqp8djZIHVZ1+I2C?=
 =?us-ascii?Q?qCh9K1oPN81dpiNnqm7VkmQL/ZwcpXcGLuSunKiEwcst4UPRXwGczStL0ArR?=
 =?us-ascii?Q?nTxOkVBJcFIe4QqDNe3OOsmL40g5bSNWfPpLrZUt2cI/4XAK+1YcEEJvWowA?=
 =?us-ascii?Q?9tcydbEK4in+tut56PcA8hIbzPYMPvqLf+0bTg7gTA2MUtvmvQTmlnmX/X9c?=
 =?us-ascii?Q?0ugKplqxcDHV9Siudmy3SxG0ETL2NXBAQ5y2V1qFQH2JlC32Wq48bUYXuGCm?=
 =?us-ascii?Q?gsFK4qXRo++U8MUFGFqaxCrWzlGFkrr+aAaK777jG4/sdDt1H+BYTVU3yvJp?=
 =?us-ascii?Q?ER9RSE+2W2ArbSL9hGyUdzNDdTeYMtWPhDr/6T9ffURNgAFE73/4SbB/mz9W?=
 =?us-ascii?Q?qUnA/dBYwqTWl2rS/q4tOkvI4oHQfdmGYhE71dIZWm/XzgbGSS5jy36z/aTN?=
 =?us-ascii?Q?ST+mHQCM9lUGK57wuKA2Jy13mcnaYRvzHSIhE7ukcf5HWLzJOttQkxXKpREf?=
 =?us-ascii?Q?NUprcPDhISsHAEUjkfXs7oBFL1NJ3QexbMMqFdmZEkk+DKzmUzaxnjxVApF5?=
 =?us-ascii?Q?Z+x2fyLJRU+8ZMdfwxT8ZPvwA/oEAx3M5hidvJuW4x+/4x5nn9ND+XrAnbnc?=
 =?us-ascii?Q?NjR3xAGp0ICGGAxepYZNGvVahDiwlw58NGZDSz35+pJQz8sJaSpR2BSXkY7d?=
 =?us-ascii?Q?q8dG9ral1a0zTu8vrm2Ri1ZIvJ15lfoWoyEHxam69Oj1rmGHuP9oa42wh5vm?=
 =?us-ascii?Q?33RD3LJe0Dy34KJIg2xQEQhHPbPMKs0oamwefqEprGsq4gLrxnU89+kPkKB1?=
 =?us-ascii?Q?TLjVJyGMJhm5+PVKEJAbbF9fP50yv7C6aPOTwQJr3BfNOG/FYRhXe4obkl/2?=
 =?us-ascii?Q?R3wbxsRWLauDuDe2Cnhs2KYT1vTMoyXvJY7iy6XnrGYI9CO/Xn8CyqzzPvyB?=
 =?us-ascii?Q?EcSubbn8awMYNC9tfaF14MCiawlcek6NCkMmNV+AyUFOjRrJpaiMnx/7mWmv?=
 =?us-ascii?Q?mZunG5Jld9krLfmzStRRaowhZprEqyOMmqYij9OF8RXtGRBzAbTuwb4wz+0z?=
 =?us-ascii?Q?I/0zMG1/eJftLxudT6l/7hA4AA0yx5Py8PY2wkllJoIeipqNcvS9UEUW8RjX?=
 =?us-ascii?Q?3qiUYbDRH4pabZ8H8VhBOpxwIGYllqILvG02w4HQC6FlOOC5rhaPnSw1GwEO?=
 =?us-ascii?Q?u0zlGRGirqQLkeF3Wftc+3U+DnwCIH9w6MKPG03OkM76UBCG3whszpLbLI+i?=
 =?us-ascii?Q?OSP/e9wxYtA+DGIQ6vSGzQGfJlkNLCugkBe2Xg5TWZsuVx/DfMGBF/TXawTb?=
 =?us-ascii?Q?2LmtGeW8GA8prjtUWGNr+HQu4gF6BU02?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9mf8kFg6pGWr5bVbcmtYgXatoOHMO6zMtBoylnWRXV5tcHgNNsGRgnwSjDiY?=
 =?us-ascii?Q?MMFNKrJ4b4Ts3RYcTv+8djyOpJmrVDn4h7z78eZUaZLnMY6nQ+9hwlZYfDr/?=
 =?us-ascii?Q?irbqLfS8edHF+gXIuRmyHBc+xpF4m4sDnMNKEGZ1Rap77treer1SMHF7Nwws?=
 =?us-ascii?Q?PW+9zRiYZLJGBY/pG7DgmYI1KYYrxuEmdD/B5YaCI9A6+Wg2Srr9+b15CKmy?=
 =?us-ascii?Q?m4Ht31fOpNPCPCYjIWmSh+BQ4tqMWoYfBIDzR/N1adM7Q09Kj6s1pQ+hYmDm?=
 =?us-ascii?Q?yoBHxtzDol+Xq7GPkP5elkCLyfemWFwjCpplrKJICYq3D2I8bw+kcz/czTwQ?=
 =?us-ascii?Q?q9+9TibI7wcLNCoQbkOuMV2tzivA3crpEI0HS6mMWJDDBnNVwUeXqIKeWiAp?=
 =?us-ascii?Q?f5TrO24JEjR0qhqNaQPJyT5bUtZlGWucqaFgZya0AuZxR0567yaCr4WKNQdH?=
 =?us-ascii?Q?xCcRRlEb7lyeM9z0pnsKLve5E0+myzkOyVcy0M0ObDMf+Y4wyLdpsNdOLq7B?=
 =?us-ascii?Q?op84hmh245i0uHTnx9MrSRl4QMKERqPixoR8SIAvQ3EiFynzWplTBAyrw5h9?=
 =?us-ascii?Q?BkmNU7YDID0hcrbgVzq7YaEs8SaFQ3JalaKhjGuRmz2DNGlLCdK1t6oLhD4q?=
 =?us-ascii?Q?SNi60hyd2LsOAQtt7k9UOa/vqSxFUx3aiYvutEs+sEWO4xTorKk/0YQe6R+o?=
 =?us-ascii?Q?9k4AGz8wjXYL5BtXy803hsYkEdSTm18GVsNtsvwuCvQZ+wtOUp/YuRrWqZmO?=
 =?us-ascii?Q?+T/P/hkURTYOHI2+Tk3cZaCBOOG14GPm28gHXlEzyWeSNcZzfx6xn5wMMRrN?=
 =?us-ascii?Q?wk3kG5mrE3aaXhEYtbHIBon0VcQqWDwFUWwF5SzzFHLHFob2eN0ESK5h6tVc?=
 =?us-ascii?Q?OouE3A/nDr+05hTwaoO11oB/VeZtdfDlZNd4F9kHDcMq6khyhBsxmRzSaagW?=
 =?us-ascii?Q?YHrNVPlueqCFMH8EZCJGk+DdHB+bxhagmJHD+1hrMVW5JGZXjY0Yi/+6ms9J?=
 =?us-ascii?Q?+qlPQkMKzho1MIgsnOzI94WId8NIRBEqMWlCk1sphk/YuY+UNrJ8kmCyfrFo?=
 =?us-ascii?Q?EQ4dS1DBH1XAAi0EDQ0GrWiG/lG6LDkbbljeLXvs6neEIk7NxwLE/OjjpraL?=
 =?us-ascii?Q?nh8lnXMxtI3u3Hlt27K9JzUdIrDMsCvlagADcM9siKKfbBMeH9IB0gpcYjMn?=
 =?us-ascii?Q?YfDrKCp83xp6c23SyoyRxdO2jLhoQRg7hharT18AuBx0J2zTIH7cNKcaPQEy?=
 =?us-ascii?Q?N+zQrjwTZiyPZaDr0ScDH0DKEL9IemPXf2Ke3RosQwcMuTr/0XqkTB3N/rcD?=
 =?us-ascii?Q?uQeAxke9xNuv9fqVZPCmG6vmiqPmjMiSyTt2y+2o56ITvDihUk8g4igXn4jV?=
 =?us-ascii?Q?cnBjwIfa7pSaDpfmGJTv5BrqbSqfmZrXUwkKsJ7+vbZ1189aHk4R8nrpY0x9?=
 =?us-ascii?Q?g0oVOwivzUKId+0qIKtDlIshEr5BYecuOECUooJm53Gq3gonBkWsC8ZwnyEz?=
 =?us-ascii?Q?PYRYjMNuGoMwfrw/V4cyzpx1tOMUbTX9dAFnG535f6dmYUOl6lZqhpjTz/3r?=
 =?us-ascii?Q?E23AMbS5zTXZ3L6hImMwFTYj9tLzjxEd2GWDWihkHT7jcEHB0Bu5qNfG3vbd?=
 =?us-ascii?Q?WDotCxfAMaAxS9JrJ6gn6go=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d58bc052-c3ae-4cab-53cc-08dd560611b1
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:37:02.7530
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wf6Zsm31h4ngJJt/JXkD2d/w5O4Z5F0IkVJ9BX7T8sVuqDLemy09m5pwGJ0sa5o/4U9ZKjNKfm5JqGfQgJxwE6+zYN1Dk2xN0akZVBcne7CJ0JOnJTzsbXSzH/nhz/SG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11967

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/meson/meson-card-utils.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
index 1a4ef124e4e2..cfc7f6e41ab5 100644
--- a/sound/soc/meson/meson-card-utils.c
+++ b/sound/soc/meson/meson-card-utils.c
@@ -119,10 +119,10 @@ unsigned int meson_card_parse_daifmt(struct device_node *node,
 	/* If no master is provided, default to cpu master */
 	if (!bitclkmaster || bitclkmaster == cpu_node) {
 		daifmt |= (!framemaster || framemaster == cpu_node) ?
-			SND_SOC_DAIFMT_CBS_CFS : SND_SOC_DAIFMT_CBS_CFM;
+			SND_SOC_DAIFMT_CBC_CFC : SND_SOC_DAIFMT_CBC_CFP;
 	} else {
 		daifmt |= (!framemaster || framemaster == cpu_node) ?
-			SND_SOC_DAIFMT_CBM_CFS : SND_SOC_DAIFMT_CBM_CFM;
+			SND_SOC_DAIFMT_CBP_CFC : SND_SOC_DAIFMT_CBP_CFP;
 	}
 
 	of_node_put(bitclkmaster);
-- 
2.43.0

