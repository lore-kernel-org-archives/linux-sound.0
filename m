Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011003.outbound.protection.outlook.com [40.107.74.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BB63B05BF
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 05:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788152871; cv=fail; b=Zu6rkpLQ2/CN4cPqsGT9XmuNmSvGBDIqK5EtuoCa1P82qYkVXwOCz1QLtHZ84CtVMUQvn63er+txiQLGjMnjTOXNQLp6dyBh5cBxO34B4R4r7otlzAAhKrJvZePOlc+wvxhjF/fOA22uXcMEuMnSM8Bqwxka6GOX7T/vp5p6o5M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788152871; c=relaxed/simple;
	bh=PC7gD6B+hNj5aNE+ChszDLqrruEpkYmFMVmkNinmWQQ=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=qnl/eqOFKTT42PK2GGG5g0HcBhHVg63EDRTdGqbNJl2LbNmTBJ11dQluUuTYrNdZCg2EETc+DE1yBdCXbA/yqyxx50dWl+CXAakklP8UYW6ULmnGGrvgPyjfUur2rH86+JI4wCMJDxp14CuGmaN6VxqeH++XFWXLAILTiZUWplE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=cMwD6y4i; arc=fail smtp.client-ip=40.107.74.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="cMwD6y4i"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PjeXKa87cNqtWteY+DJ312UepyqyFnGPb7+pgfNzwj/RhB5uVj7BFYbw08urkU9Ag9p0BjZmtGAN4fmgDi12hkBXZXTkmK9CE8tdbmxf4UyZ+pPxJ0EKgbhhmcZXj8o+aK4QpnH/cy5zMATYuFeEH814C0SVsthWBP4RlUtYinO6ggGsLRb1+b7ZYN6bunfeiRJWU6ln7HUIqewc8DT6eogCGNUxOAyF+MtM4tnK3bwMEjnbhePN0nnNP8EabgMW8fq4Dk4MdHlQu5gDiCeg9d+ms5T21W/1cJ0BbIEsjGAA51hgtxBnM+XmpQVWGIV/1GfA3sLyeBvuLFNOgAhOOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RI+TJW+RKgxCX0UqIU/060030H9niyEU17BgmnxYb2s=;
 b=ifrLZ1DRYY9HTemfjpnGZpHa1DTz9Q+FJvvPB6q9E9FMKnCTXPuSMwJ/EapV09VtzNlbXFJT0MDApw8UcxG1rR0cRyGqHHzGfDDLRlYI7ccYhRagFW926Ld/prPeg8A1xhB7M1wamQNVSTzlTDWeMk44Tkk3oqnGPKw261BkGx9xYIlB44csioJC6X/TKIPbDhc3ewJPsRXosRVYM+Zzdv3UOwWcFcK+eGwOxUZ+yrX8zqgRLUvGf7V6vcd/RdFQ1mH3D2TMDYI/vZoIVj1uqRvXRmvV/w4iIHmzFmSQv/yJZ+pMytO0RHJoDqASF3WuJ35LbESZn2/cFTr2SHEkaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RI+TJW+RKgxCX0UqIU/060030H9niyEU17BgmnxYb2s=;
 b=cMwD6y4iiZm7YkcOOsbk30y6VJa9HH+KIpTFjbrIsQ5aNeIHzCb/7RFTFJZrZoGpBMtVsWxaprNn/MumplDq297NbyISDTGy0QUK5UdTS8YmpUfSzVLJh8yqlmSYmfC2/+baMqW+uXCApzndRrT6/AZP0lv8eZ+u8VJlHJF7iuk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by TYRPR01MB13019.jpnprd01.prod.outlook.com
 (2603:1096:405:1c7::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 05:07:47 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 05:07:44 +0000
Message-ID: <877bl6vpwg.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 12/39] ASoC: codecs: cx2072x: use .auto_selectable_formats
In-Reply-To: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
References: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 31 Aug 2026 05:07:43 +0000
X-ClientProxiedBy: TYCPR01CA0175.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::15) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|TYRPR01MB13019:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c748ec0-7247-4b0b-1727-08df071dca32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|1800799024|376014|23010399003|18002099003|22082099003|56012099006|11063799006|10067099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	QIUB91EbruizLS5YlJyGSgjBImUXLSjy5EQMWlsFmMk8TZsyo/iJ5SXaIPBQf99uqW5hxJqPhdlKLDnwsUt5zjusFIvvII5432ykykcrpJKqrbZDOBSmSCSkuFJ/HGB0ZwWkt82CnqrsJpgVuFdwAAsaorseQ8Gy01jG5Sx4PI0jwcLwhOChgDM1pgRbtq+VMoEaKXXLmq1EdfOMp+JXyRS2i0+fg9TJEOXq07igU+QjIBM5Sf2UZBfnQQmkEZ2UyK5O4ybhBTwyEPrSXFazpZJuFYBz4voeb9srtmVdYxzASRsFWXnWKcOB5Q+SkyV/pPzV1RbkB6Rv4iuszOXJlnoqX36PREFUqXOb0oaJ5FsGajXEkiLBpmf4nOLV1FDdb/vmPEcZHJ7/hqRqM041jmppGVq2Q1nQcV9hNc81KS/UeUAC98HRGvOjfevgMVEuAaBUmC6UObUKyExAIchLcCxdpC3imCpBknYL6dG2VGp7HUDc4nZRf4YezSnRKaifc+0raPikgIkvnXjK6uJCyMz4KKBbYzDVQX02BFDEHP19/ILWV+DxP3h5tZ3PvtAyC+N1F7h36ZE/7GE0oOVgk5GLs2OWtsIqrIMsS+wSSwIs3RlaITkB7rwoYUKF4JWHHpwXAI61cJhzfmPccuPNcycvY1zklji0OOBBh/h3owRZRMmaE1bwMjVsS9oapOeDCSMup5C6AOaVhcrvk6tFWR2BROuRwW2XW+WnQs6rNCU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KioVObCUIbPPHgOWG86J/Z9ATThCJ0OniVYnkoTs6F7yclWQP6aNUpS1mWCL?=
 =?us-ascii?Q?e+nZllI1s+f9/1HkbCskf5Obu6W76FnBcVXk4sp8paQWmFoQnzBvFX+p8KrF?=
 =?us-ascii?Q?Uz9jB3udM5GLLQd6Y2WInxzpwNDyULHEaqFyo3esA3j8enlTNML1/eurM1l4?=
 =?us-ascii?Q?fUCeSk1wZHMLhbpCWaTjNsp+VI8l2WEebBFcDjA4t3ybtug5V9/ovXljhFdd?=
 =?us-ascii?Q?z+pexnUhCaa7BD+n0PZ/mLOgMfEauh/tZfHdhNiutqGb2Z8bucdkIC/xnn2/?=
 =?us-ascii?Q?QCYUI8MvqJQ/oL7RiTXdilTQ5VJAWPlkqdFX82ENWrS6r0TvLrqztgby2j9a?=
 =?us-ascii?Q?sX8wMVnprSon6Kuuyt91yr54tPTgXbu+sLkeGULk+nF3doF+1DPK2eHIDvrZ?=
 =?us-ascii?Q?s68IUqcPxNQLlq5j/jx4itIsGsUuQV+GDSyIrk+iZlq9Lpp0iQzL1Q8g1VR9?=
 =?us-ascii?Q?ZhuRnj0HXPb9LT1QyX4GqaRV/X3kJPjZ9JnJZH578U3AnYSx0tieuCKaival?=
 =?us-ascii?Q?46FTqVO2TaBPUd0nZwarU3zajodoYcTp3gcBJQ+fAT757M/iM3nuDm7tSkr1?=
 =?us-ascii?Q?n4K6Q9/u3C8keH6PEYsZmjBfWP02FRf6Xk0hGj3IhHik7j03GeKQLLHaZytq?=
 =?us-ascii?Q?ZT3e9yjT+deZY3WbQZ2bZT8b/9f+1JFESmkMwy6/QfGoRAgsWXZIn4CxMJO2?=
 =?us-ascii?Q?9zyZl1WjmG3t5GcVgJ1pA6VSvSR7KwdvX44O/hak5qexouXGdrM3490BPH1+?=
 =?us-ascii?Q?GDGzcTTziczMge8z44W2Ge9AyYgb1US7WJ01XxRueDwiNJ8ksD1sqMOgq5+H?=
 =?us-ascii?Q?BeU4KSFZrWZ3/TGW4x63svhTYuCJi/XAcd0jqSNYuCphrQ4odhOBIaX3ni4g?=
 =?us-ascii?Q?aVPm9oULqi1gMzI2TNy7IAzKdy2bWVT2rJ+dvYEqmnnWWNWsy5MgPYP+j4bg?=
 =?us-ascii?Q?ywMSTKG67p27s4tpDrcZL2V0BDtjsodPV/42FSERvfQV/Tx2aAYhetuspAut?=
 =?us-ascii?Q?oJnxDarsUu/1agrD3l/HcQp412JzkkBOHNyIQ/w+AFBVlupUKbjwhAZfltrc?=
 =?us-ascii?Q?iwVskIK4Wbr0d0gCaaLv+Uy++9hjsoTDoiiNVQMV/Fc3lDDkqAPzjLB77lkw?=
 =?us-ascii?Q?f66JgXjFR1Th/ikJ4+7e88Z4/ZMeenPJGW10Bis9o8p6OHcK2eezezqrlRjY?=
 =?us-ascii?Q?c0IdzTXQLH6nQ31JvsbcCOjaVQwVzpGdXOct4rXrjZZcf8qE+Tyz51NP+939?=
 =?us-ascii?Q?3ggrERQuhIVkQEK7TmrqutkYNpZoQzQdT6EEZQ8JDHuvRoMe74NPXMt6lcRG?=
 =?us-ascii?Q?cdsnYU38C0OB64e4DK1PHTAlGTDX6Hk61qN3KrK4UI0Sqokzx4glI08tamGY?=
 =?us-ascii?Q?gNnf5fHji0ruPt6MH6QizBskJzsdiKFdzRcjSKaUkVb7oB0RMZDxn01/oC/k?=
 =?us-ascii?Q?XDEw1HBUC4Mt6/e5Vd1lIQt3i5AEdRVdNaeV1BEmKfiIGFtqY+NvOskynyvt?=
 =?us-ascii?Q?TkYiMBUbPUPCnIjl1Cmgzs+jJnHfelPGkCseKW0+xXPNkU6oZdamKvj6Wrya?=
 =?us-ascii?Q?KN3Dqgmm1ZtOL88V5O+bk6j/yMTUyrvsgZFkXBVAQOCMHlHt4cjfYGSkYOpl?=
 =?us-ascii?Q?gOkG2NhpotET6qgSoBYjife4yRcO3Awy8T96eubWKQlzSD8mglZmHcPfvmyh?=
 =?us-ascii?Q?V+fWNYbqlRLcXeEKFFiJ3AJYB+JQjp3p/SFypw/MruxcZWriSt9dI3euxy4R?=
 =?us-ascii?Q?fvPoY9FcQIUeCgbilLhSZz+KJjop/fpGkcNHSDzhtftOG/Idv+Vl?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c748ec0-7247-4b0b-1727-08df071dca32
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 05:07:43.9666
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aGufcCuJGtQIj6g8qAUY9vUXecfN6TlDY7VLvAqZFp2/BSWrv65rrVMJMS+1fn7/RK/W49iOnQwwI3wrNSD6aaW+7MLAUjY3fhS87h+GMQbFAbjBdgTxKYx56LMrQPP9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13019

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/cx2072x.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/codecs/cx2072x.c b/sound/soc/codecs/cx2072x.c
index d02ab74e549bc..5b9e9520ae010 100644
--- a/sound/soc/codecs/cx2072x.c
+++ b/sound/soc/codecs/cx2072x.c
@@ -1521,6 +1521,16 @@ static const struct snd_soc_component_driver soc_codec_driver_cx2072x = {
 	.endianness = 1,
 };
 
+
+static const u64 cx2072x_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 /*
  * DAI ops
  */
@@ -1529,6 +1539,8 @@ static const struct snd_soc_dai_ops cx2072x_dai_ops = {
 	.set_fmt = cx2072x_set_dai_fmt,
 	.hw_params = cx2072x_hw_params,
 	.set_bclk_ratio = cx2072x_set_dai_bclk_ratio,
+	.auto_selectable_formats        = &cx2072x_selectable_formats,
+	.num_auto_selectable_formats    = 1,
 };
 
 static int cx2072x_dsp_dai_probe(struct snd_soc_dai *dai)
-- 
2.53.0

