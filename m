Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010051.outbound.protection.outlook.com [52.101.228.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC871A2545
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820740; cv=fail; b=scgYg79ZlAMMXndywKr1cvxPNuJbUCgmFvxwUpS/rVw4LRJloosGnzbjSaeO1C3wgbYrEGfD+Snun16lk38hhZD/fLrFGX27qRNE/laMO7VPdqH1UHrf0PkYkS2xKiwYzqyjbelc/gmqoU+3u+QO1Z+6kAiY03KbkpCF2BeiyKQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820740; c=relaxed/simple;
	bh=JkXwZEYFBmAkrXGJz23O37L1UIJF3RzUj1QVTKta8Zk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=lZOMkZVYxuxBcwaKEpM9/etssgsYY4a+D9NL6cv6isMNLnrF/wbNx4Q9ap9oaQNnSv/SJqWcvkUIVM4qryhig5/l4jE5gTAcn3jsd7v5WFiHaKXk4Y5X7BIs/XBvG4M21o6s+iuutTUCXIw01TRsvYL7okLnlJcWiuvkHeU5En0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=V6k2xeu/; arc=fail smtp.client-ip=52.101.228.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="V6k2xeu/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yVzulZozItRZUrnjsDreAMYon/piIYnlbRHuvBgdpTPavBDJwMczDF5XRWoa6qt4fvuyhNpu87LV2nM4/0U63MjOIjTdTOl+6N+e2J56N6SUU1XwR1Sxre488zkagOZh0xGTpwghMYoCunnbk8DcBo2nSMjNe/HsVH7FTF2bu+dEa2mwvJ87j04HvzDgvAiV5SFZbxsfrKkNG4Yc4+BmYBWDVvItdJ9J8IDNWgIz+dAvVZ8WU8yF76zXHpITnhWsPPZdhIIno1SDSaDsDBwKW0hCkeziDNPV0qpHGZmXVPg0iELXh12LL286W+vGHHeMVy04FAo8qjro0EygAizpAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ldrPoMQCo8iQUZZInWjqv0QTsOuAaxyuTBrHqCpZVv0=;
 b=H9HH4IzED00NNrQ/xJt3DG0FiOBNyIy8bvSlycMcTK8it8+1vfje3r4IH/PD50/3DaYUuwC0HxDMAexsQIAnwI/eJ5U7IrwZyRmC1X8F63N+6uA6DHK4Jfr+i94Xtw8AxHMzJ01RluAIbJSPIxpqwHbR7caB7tuvNqyuUK4DItOwzk/ENzmdVr789w9CZjMZlbM8v+tJQu9r3AN0YPafh1AM3h+SBnJlvwsu/npbNyke0+mbN7CF4QvOvG64TOB2Rx1Te0Xj7G4C/JSQdOCePrHzdmRa5SGHwZjjXfZVuGwOBdfNYvt3YZqQsdh8DLoNOAYYTFkIVvt3Bk6nmve1SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ldrPoMQCo8iQUZZInWjqv0QTsOuAaxyuTBrHqCpZVv0=;
 b=V6k2xeu/H2FQ2qgK3VsLzFuOzri9SmYPDhPKaLdDEGcziXMB5FrfsjoSozfM8pVQGTMukB9GYoomnaR+QPhDpB1MtEB4LmOAQUxrl8EAMw+DyEDT5q/oY2Bsm2GXKsVMdDYWScMAyQYPqk85id5XHaKAm38n12O6y8ZJ29Mz5CY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB14439.jpnprd01.prod.outlook.com
 (2603:1096:604:3a6::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:25:36 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:25:36 +0000
Message-ID: <87ms4t2z5r.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 117/292] ASoC: codecs: rt5682: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:25:36 +0000
X-ClientProxiedBy: TY4PR01CA0053.jpnprd01.prod.outlook.com
 (2603:1096:405:372::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB14439:EE_
X-MS-Office365-Filtering-Correlation-Id: ee21b484-44de-4210-63bd-08de20b8d5d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QHXUfMxrKaWvbskmjo6Bao1xz25qvntnj50GSjUtMIy68xzQmgvHEC7pfbTx?=
 =?us-ascii?Q?+1LHock/zTy1uUNWTgPKc8vi82CR6jtcq9GRggOCHXsGA5/9VxIMa6Bcvbxj?=
 =?us-ascii?Q?RQZ2Pba/6jMu1YcexTAxPep4Dm9gwcm8T7sfowF3Z+CJYqScX2EO2qrSaL4v?=
 =?us-ascii?Q?qIpdPVzc/09Sdz/DcGk3IS/ygTuFRPWMAM+G40Y83swG8EtbA7lUetJzxp7J?=
 =?us-ascii?Q?q6luwyTTzUuHqSGC8YOp8n2SwndLyaKDqNsu41KMkW2m4IubVALbdsErrQk6?=
 =?us-ascii?Q?xMroa0suGlRpES8Xb40mJv6Wja/Jc8Q8vuo/11bq7xQ3AtJH8QmU4gRDjw6/?=
 =?us-ascii?Q?Fp1dIIp/Vbo++/PmIMCu7vhMxmwTTIAHPyr/hm05nOqM/U6oWLoXgn+XA+UR?=
 =?us-ascii?Q?mBLX8+ylCcSG6Uo8Ly82zVWjwVO61ZSc9VauR1qXsYkOqyGs/QcOFC25m4qM?=
 =?us-ascii?Q?p0nwpjv0X8bitMxhAjx/zID235yk9JXB3qYsA2dvga5llz3UqAxOGD+5RQEV?=
 =?us-ascii?Q?CmareJGgoyudbrWmtKZp1AKllx+Eem5+YSnhZBgaeZdg9x//qOsV5Dmv4olZ?=
 =?us-ascii?Q?VXwYLDXUCsLt8KECVjQE3jRnjJgNn1vxhwqxi9pItrQc/USoTL2hxb6ywzbx?=
 =?us-ascii?Q?ggIZlQKszAZv2iRtfXsl2sbKt6dy371YRnSN/PDMhbSTU5TGB5nNQD1PCVHT?=
 =?us-ascii?Q?D7UBIpXJ957YSmETs4FBVxji8g8oYMs5SRY0ewKYqT7aS9eEHMnydJQpySPC?=
 =?us-ascii?Q?hzc1Nfmj/SUYzLABiF/gKAPsJ0byZgU2VyZYF7LLiOLpSFxddrMKA6nQeJ8J?=
 =?us-ascii?Q?94+tf6SY0Ay4UwXjEY+WffRD+pplv/xA47A2pI3G+bhs5MR8aqpT2iWcuB5Z?=
 =?us-ascii?Q?IQR+C1bSWszFv8+UHV1Ems/MtzMaFzTHGJTdIkGCV6YbM/OCDBCmtLfZsN2h?=
 =?us-ascii?Q?ehIUlv+NDweaYNMz2pTLQYpSrcMD2rHQ/5z7NVmici62u1CR+2oidtuOjdw2?=
 =?us-ascii?Q?sXZ7JOncjX6X17vKplh4+gp1TunPYbJ9m+SHWxR0Uftww4rDtJtJAANMYNVE?=
 =?us-ascii?Q?NJ2lwkNKJsMgaq9sLpT0TxOy7rF5sV6xLC3evZ2kiICJe9OR7gDlJsQGPbFI?=
 =?us-ascii?Q?C5bTxHK+2aoKjJMUZIu/nVoXF0O29w92FqJZx7N82p4U7cOMH3KTJC6Z8qX/?=
 =?us-ascii?Q?1jMqtrkXQU1dGMANUpVT3+1zFfX5LjZdL2k1m52lfyOz22TYTQAkgVgYiifC?=
 =?us-ascii?Q?mTyLii65hSdPnjUefI03UcGL9VkMBiXQ56/b3S7+s68CNPm0QrHRKE1qIuoo?=
 =?us-ascii?Q?U48N7E7kAwnfXT/VsWuuOL3E/1uPeVcGIRpk6lmgy00kLDoIW0mGD7nprGpo?=
 =?us-ascii?Q?uXZ+BxEQuHmaaRByKPzflXSr+jaWcpc6FgwsbIMg+k2YpoRkJa0bppxc6ESy?=
 =?us-ascii?Q?sHlw9c2eO5p7L/5TuvU0r39dmKW3l15gUjaEZDF8xO8Cj72ME/K6Smq96MQ6?=
 =?us-ascii?Q?6eVT0D83hbx9z9zYaucgDqdG9im2Zf+PPRJQ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ahBYQxab0Wd1RSui2nAsqjgZzR5SQmYtleUoPxskYEYXExhHt/iyLk/TBlCu?=
 =?us-ascii?Q?kqsJrWByhLfgngiTskry33gecrK0fnUPELm76ii2SpznP4EncMj7B3Rxh3oO?=
 =?us-ascii?Q?bCj/UzA7tEFlIea7B1/qV0/SgGZRPhfrgmBX2aqepvCzi3EVtQ0eaTgoXdMV?=
 =?us-ascii?Q?/QQVb3r+IHb0grwpV9SeMnfDoSFPPAnLESU5X8OJ/THPSqZbeAqaXqsa5pYi?=
 =?us-ascii?Q?nofSdZQ7zk3haQ80Wacj7HAUlzc9lbWduOvQvKwXlvQ1MO+SOH1w/utL79lL?=
 =?us-ascii?Q?iAoTj7rNs9OYb2I2dZDK927zrsT3hEhryqflh472iWY+ogowmSv//Yrgm9ts?=
 =?us-ascii?Q?79TpD7Tlb8g50m3KrGd28DalmA6k+QkeBx1laApQ3/kwiv57yvdFY4RAxfUX?=
 =?us-ascii?Q?3xwYCLgC4/meX9O2bpOl/R4DVWgCgwj3PQKoE5sonNMp79vi74cTcp7KEhYx?=
 =?us-ascii?Q?zFEuPZXR1ZzBtJvWj4kb4YBT32yYSn8kvf1k9Ctm6Ld5OUovUAkJD7yR7zLY?=
 =?us-ascii?Q?kPX0DNDfpgl2hDYvc/m2olnY1DPFqriopY5Of5ck2RQnITFYoIKvquNWxQkB?=
 =?us-ascii?Q?GguWxPAzVu+YHDTt+FgchddnULQ8z+VkdAki6pzT4U91EfjrwyoSbe75LYKu?=
 =?us-ascii?Q?zTGvDGlGh1bVADzP386WFJSgT0Kd8hbbC4D69Xabk9FLTDyaKYLN18ubg8Wx?=
 =?us-ascii?Q?9RPCErB004ZCB7kCdtpPP2b9rTBR3yycC+VDbzPg2TXJecF96LKYxTcUZC7+?=
 =?us-ascii?Q?oXZuy6VfPHD4OZH17iwpkkN7X6NTZC2oV6fbMR6pGVkZ0lX/bC8hTXM2q5oK?=
 =?us-ascii?Q?B7dTH2hxr02R5wKgMMSus3qo2V3mgGY0M/GRD1u9vdXaTwrG64fYGUggquVe?=
 =?us-ascii?Q?+BgBHZhKSPcIrFAMA0Bv12A9jEo5Jocblj+/5BOS7cbw04ZTh+MST5ycckT/?=
 =?us-ascii?Q?LEXAavwV21b5Lp5Zj0zFGc4IKjzOgLgvyJ65tZnfm7VbDQz9R/vVgyPPABL1?=
 =?us-ascii?Q?7qEDkKjV+1x5WnkYPHqiV7GJIKswYvCvuq58+tgfL3ptAOI6IYB0wO0cPiVZ?=
 =?us-ascii?Q?rTakQ0VgieJcQDbItidHe4Xr/NvPSJliF00oVvzNE+9BtmHXmxZd4F/godL7?=
 =?us-ascii?Q?z6kImoglRVcNSPnOtyDS4aBnp77Cu/uRJuM7dv2AQg36IJXojB+O01zWwy9e?=
 =?us-ascii?Q?cXo/0P8aA/EL2qBnzrtN09rIyrLHvb83UCJRsxSPXONJeZQEeIkfLzi1Brz+?=
 =?us-ascii?Q?rlBwxUyn0YPMbi6ZBHDzGD/u33AENwuJVagMjhG8/71lrhkKWPWyY7JSY6gX?=
 =?us-ascii?Q?YgEujrb52Y9WusfeqKniVlouj5ZKt4Y02drTwMpXDBdSZqihLhvCB8cK4XBt?=
 =?us-ascii?Q?WWIBMcylK6p7fOBjh0LkuVUwqZK9uDx567D5jqOxJLLgCMK2mt+E1xPkjEhE?=
 =?us-ascii?Q?bKre49M72DljLQ+2fjcu9DAxjE1zFGeIBErxA8uRyX8mw4sWm3HznHYDF8H9?=
 =?us-ascii?Q?xznH0gtMWRcQpL8MIgNPdwb013GurDy1EaJIf+wpR6olnPhrVAj5Yl9mmDlJ?=
 =?us-ascii?Q?2vzyLcvchHiRXzy4S0vdYbSelZFZ/ladFlFwveV+eqHUUvKz8BrhMaqncnbF?=
 =?us-ascii?Q?lqd+x3bm5iaU1tCvjFnCniE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee21b484-44de-4210-63bd-08de20b8d5d4
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:25:36.7842
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G2l/mp4LVrnNiINAMq3dy451Mf0vyus5kDbCf3aDJeHXq+LvE0OL+TOSIrMryFtrZZrNyS3wDXn8sodCaSAstP/yu/4vwi1xix1I2ohSR1EcKufqUAzEMNbuVu4hdltD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14439

This patch converts below functions.

dapm->dev					-> snd_soc_dapm_to_dev()
dapm->card					-> snd_soc_dapm_to_card()
dapm->component					-> snd_soc_dapm_to_component()

dapm_kcontrol_get_value()			-> snd_soc_dapm_kcontrol_get_value()

snd_soc_component_enable_pin()			-> snd_soc_dapm_enable_pin()
snd_soc_component_enable_pin_unlocked()		-> snd_soc_dapm_enable_pin_unlocked()
snd_soc_component_disable_pin()			-> snd_soc_dapm_disable_pin()
snd_soc_component_disable_pin_unlocked()	-> snd_soc_dapm_disable_pin_unlocked()
snd_soc_component_nc_pin()			-> snd_soc_dapm_nc_pin()
snd_soc_component_nc_pin_unlocked()		-> snd_soc_dapm_nc_pin_unlocked()
snd_soc_component_get_pin_status()		-> snd_soc_dapm_get_pin_status()
snd_soc_component_force_enable_pin()		-> snd_soc_dapm_force_enable_pin()
snd_soc_component_force_enable_pin_unlocked()	-> snd_soc_dapm_force_enable_pin_unlocked()
snd_soc_component_force_bias_level()		-> snd_soc_dapm_force_bias_level()
snd_soc_component_get_bias_level()		-> snd_soc_dapm_get_bias_level()
snd_soc_component_init_bias_level()		-> snd_soc_dapm_init_bias_level()
snd_soc_component_get_dapm()			-> snd_soc_component_to_dapm()

snd_soc_dapm_kcontrol_component()		-> snd_soc_dapm_kcontrol_to_component()
snd_soc_dapm_kcontrol_widget()			-> snd_soc_dapm_kcontrol_to_widget()
snd_soc_dapm_kcontrol_dapm()			-> snd_soc_dapm_kcontrol_to_dapm()
snd_soc_dapm_np_pin()				-> snd_soc_dapm_disable_pin()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/rt5682.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index a0abd2ce0c1e1..d39f8e4f3474c 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -928,7 +928,7 @@ static void rt5682_enable_push_button_irq(struct snd_soc_component *component,
 static int rt5682_headset_detect(struct snd_soc_component *component, int jack_insert)
 {
 	struct rt5682_priv *rt5682 = snd_soc_component_get_drvdata(component);
-	struct snd_soc_dapm_context *dapm = &component->dapm;
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	unsigned int val, count;
 
 	if (jack_insert) {
@@ -1115,7 +1115,7 @@ void rt5682_jack_detect_handler(struct work_struct *work)
 		}
 	}
 
-	dapm = snd_soc_component_get_dapm(rt5682->component);
+	dapm = snd_soc_component_to_dapm(rt5682->component);
 
 	snd_soc_dapm_mutex_lock(dapm);
 	mutex_lock(&rt5682->calibrate_mutex);
@@ -2595,7 +2595,7 @@ static int rt5682_wclk_prepare(struct clk_hw *hw)
 		return -EINVAL;
 
 	component = rt5682->component;
-	dapm = snd_soc_component_get_dapm(component);
+	dapm = snd_soc_component_to_dapm(component);
 
 	snd_soc_dapm_mutex_lock(dapm);
 
@@ -2633,7 +2633,7 @@ static void rt5682_wclk_unprepare(struct clk_hw *hw)
 		return;
 
 	component = rt5682->component;
-	dapm = snd_soc_component_get_dapm(component);
+	dapm = snd_soc_component_to_dapm(component);
 
 	snd_soc_dapm_mutex_lock(dapm);
 
@@ -2928,9 +2928,9 @@ EXPORT_SYMBOL_GPL(rt5682_register_dai_clks);
 static int rt5682_probe(struct snd_soc_component *component)
 {
 	struct rt5682_priv *rt5682 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct sdw_slave *slave;
 	unsigned long time;
-	struct snd_soc_dapm_context *dapm = &component->dapm;
 
 	rt5682->component = component;
 
-- 
2.43.0

