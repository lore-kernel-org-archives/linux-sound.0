Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010017.outbound.protection.outlook.com [52.101.228.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0909F309DDB
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415788; cv=fail; b=iEqs8bVg67whg1C663jwMdPYSL1t2OV/x0oHdLHl39ymf+Gs3VK6A1WaBkuBjSjAKAb4uglo08f1kJn7u7f+sFOv6eXsnnNMZ5NrTKEyVXcXMZ+ZrRRE7PcFzHPXTwNch7r7y4dL88sJBlrS3FnpR3Jg6Ji86nPzuTXc4zSeiD0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415788; c=relaxed/simple;
	bh=DOMxvrDw/rP8zOf0HZmRCbxK+IkAA+ZaklNFSJnGoRM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=DmfWyRHaaQ3kBoGeGGVo/JGzMRlxixFfkuCNIsRbXrrtworm7w+Ss/1ZiME4k+SDIx+84MinE7xpRuRcFeIFhviOq/+BdRlIVehy8BELrTiIIePWnpo4R9x50CIfxLc8CQ97MhQ5r0KQdQ2G4Gageur9ng4BnnCOoJoS/I0jeEQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ixOmV8L1; arc=fail smtp.client-ip=52.101.228.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ixOmV8L1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lxp0OFsgWrnO3QVVQxEll4/WYOPDWSCgSSLqC5Jj904qMf3OpVLeD9oVBoc4jSfAF1aIq6d3diWAb1Cu8lXlRTtqDaKCuFHBCQfRc2bfGMz4BcyfW1OSSIWpmQKx799dVkHb1Hp4Z9gnN/LGrP5XfcK96z9au7jz8LkapPoSeo2qf+lHB/X4c7jY4zGunVoQV+sfIDTIrO2bzsC5RCHJe7G3RM45e4vH4i3g7o0c5mJThsUEnh5DuCMFiWrkhFmiC0z7dzFkSHUAMmSoumE8XaBnstBOxw05y1SVQP/IYSA32IVCX+TUwBMvtuqnuhmLUa+ncNRC+igCijXldbgVzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HPMQ+C/jNT8r0Fd0tjfuolLQNRgL4YYY4vAXRf+ZIs4=;
 b=Kxb+hqBEGbtdXWLEWgnqqfVC1LGx1GWvDj6tn0JnfAQo3ED3nZiWSt9nnOi8Oje1gNCzwwg0FD3ysPpj88o1bI+z0KtU3dcCogNV4xe550Glc8X8GGpnKamSlum1rwX5a32OL7G1Fq0BlCGDkIMlGmtcr9T+nmuMWWD5xWgb0N5XwpWqcvsrqPpcQ22xqPHJTDJrgLZ7XgVxznpaLRcwI+JTtWv4PAEatKqGHCQiqlS6t1s5aAaYGjSiQbbeRyj/Hp7M+CBmJTsAAHoOjjC9p1OInQh/jKN1gO7FD5Q6+uuYXDR1UrQK5K7f1ZIaLfdpaxJsIHX+6z/lF4Qt5E72iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HPMQ+C/jNT8r0Fd0tjfuolLQNRgL4YYY4vAXRf+ZIs4=;
 b=ixOmV8L1aq4dBJEPKdV4AZFjzdstU4KXS2JDT1ohHGluQH9evl4y7PzB8KDME6ALTjMZVrrdT8a5UsY/gaZhNwTRXW2ik+qm/q8avQQXV/5x9yMoN0y8FzOHogUGcjAkmFRnF3RDQA6jIN1Vt8WHVwmmbHEvserHR4tR8cdyKFA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9449.jpnprd01.prod.outlook.com
 (2603:1096:400:199::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:23:05 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:23:05 +0000
Message-ID: <87ldleqfh2.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 057/139] ASoC: codecs: nau8810: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:23:05 +0000
X-ClientProxiedBy: TYCPR01CA0174.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9449:EE_
X-MS-Office365-Filtering-Correlation-Id: 74726402-a201-4511-215e-08de0ad95f54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Tvjo0cEpiszpw/LMnx98W3jelflqN8BH1GJVsS0IVA/bwy46+Uvs1uS4VIZx?=
 =?us-ascii?Q?sihNyftWxTgaSpWOakhTLNIOPwq8SQa37M5CsX4noX2pNZKU7CkxNnefKq3y?=
 =?us-ascii?Q?othQulmxxHtCUofVjCeFBtbYmSUOxMJmgJDT7zE1cKbeMGeuqwnRX5jB7ZWl?=
 =?us-ascii?Q?r1xMX0xyEcI1o2r06bHHGCfRiJMXzqCfPmrV1NccnwvbYLNiZqoe1vbvrzo7?=
 =?us-ascii?Q?wwm3sstmcvgrpGbtkt6/s2jgfOXO3M1YJS5CM4eBoPC8dD9O/8S5rhFGkiY0?=
 =?us-ascii?Q?R6qOlEjj8ZPRg1yYn7D1S8jOS/yO0IND59Qo+TCwYgI/6yLAtdiSXx76RJYJ?=
 =?us-ascii?Q?yWLOMCzlCNkS5AuAvGSkqt6mO7HLSNksZ/lgNa2pFwGhK45ESxftMVrNYECT?=
 =?us-ascii?Q?KiBRhhD1+T7kYaohHnWkm/VWKKTxK5kuZ3oy7MazHVWbOWR47nQCnIS95/Nj?=
 =?us-ascii?Q?VAOuINL6sLXcy2ydALyUydgwpY3k6HcHxZouoVbPs8NmSEeLtyDyiARlyWcw?=
 =?us-ascii?Q?PJ0OvJhEpUPKwvl3LGCWTFBTjArf3JyHZcH0JyZ6VAfOEKpt/0KFZRWpUsk7?=
 =?us-ascii?Q?r9I2/gmcI8zYZilx7CpQmSLKUy2vEjOvxubIx2g4Kv+DPXzoT2CKZD0YBpmW?=
 =?us-ascii?Q?2T+hvRF6XcmlSIhtwmgQwTMlL+uwg0ctTPgbTxDQY2u+3Zltj6IlSLu6PF9o?=
 =?us-ascii?Q?0UP4p/p57YLH/iIpRWhh9JZpxoeDKTpkbYoKgBFXnvxWCWIq73fmrX5+jeg8?=
 =?us-ascii?Q?db7dAoTj6eb0EV0XtHCHA0xi9fn2DJpHtDezctTYGRjSElrerxP24eW6DXbR?=
 =?us-ascii?Q?Rvp+3ape1j7dOvF6+4Rw4LZoXPB1ThLVKl14mdy74azZJElvxFE3LiakurpM?=
 =?us-ascii?Q?l9INg+IvJ6T/j3GzQzq7UVWVKZ21fq+Q2nNCBMqWZh9teQvMxov3YhWrqkTx?=
 =?us-ascii?Q?RExlDu5EU72U6TL9guznPPipE6AcLt2mXN9KomW7zlBPDVACbARu+QNfKOja?=
 =?us-ascii?Q?qg6IfWKbZaFx4tfo8dTF36BZROEfT8q2olsR+6ar3dIC9VN8xpmZeMA8TpUI?=
 =?us-ascii?Q?M6Fh3vAQvDg2tmT/RdJQZrgitvF2om5t+cW1hVO3VYLBkZ2Kf/nrfu2LwOvP?=
 =?us-ascii?Q?9XR4q5+LS+dedhehfJBh/b8Tz/SPQjH9aApH2XTBkRwJOi5Y3oWUXFMASreI?=
 =?us-ascii?Q?ZCRPvtKoWTm8sdfU+lOzsT6OFeC2XgyAqTGdLyRps1BPISsu8PgM0tnbl92g?=
 =?us-ascii?Q?y1CgXugPPI0voJB0RI+zYY+/6VXIn/Qc45HvVoP/VN87PZC5Kl6Nh+ejy2tI?=
 =?us-ascii?Q?SoZJoXLfpLhseSy00Kf1gRvrOuNIZynm5cAlG9rwAYJlemF6h96g4dadJ/0A?=
 =?us-ascii?Q?mBdvasf579YRUWNso0yKxbDhUmehIwUvSKS7MUHy1vwkq4Jj80bMbO1KV2i/?=
 =?us-ascii?Q?eTQlL80+ApUtN97SB9hMhy4qp7FAibbqr0WJrcuCOovcSwCVk+4Ps3K/3vzA?=
 =?us-ascii?Q?zx+sgbDFuBya2aUdKbXrvOr3lnnQ26Sa2EXf?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ohQmpuc0TQLcMSlqhxt3ZmTtS+hQLrBoGgiLrM6OtivNM9ssUhtPkiM9S+cU?=
 =?us-ascii?Q?TZbxrnAaWujNczAx2L+IwxcFWI0FJX2IPN+CdQ7d2JIe/8+p2uLHVauKy8c6?=
 =?us-ascii?Q?o+pIiB4ygnyFmlSZAjLGCsWhvp6u7zvX2V3otcmNcmgrYsV3q+6xJWZCu9Oz?=
 =?us-ascii?Q?11F7oUlHoZHmRiZWBGro75ZjXK4RndkjaDuWdIuOmwslxo8xG32Ade51wdJl?=
 =?us-ascii?Q?hyflou+uxE0Qidk1aKjovPLpUywIYyY73OJ8IeJ9525a2YSfghnQLR6jCAbS?=
 =?us-ascii?Q?rm9tObw2NA37u/W5hTBB2qvyQ2NZorHwgjqzBSIgTEjYCsCjp5wP4oHfM5bp?=
 =?us-ascii?Q?sUmfwB2Mp3exNRo3Xs3sjNcF6vpIuS+X8gAMpIYdNqCLWppQP0jmPIwtmnuj?=
 =?us-ascii?Q?gG6PQfOCPcRchPG7cWG+59aJdzfl3xIZT4wY2phe91gH2a9HCR3lts2ItRYt?=
 =?us-ascii?Q?Pr3nUjHJH0wHivPe0bBUh1K9PHipBaSfjcoYigiNFqftYIPicTtP2kSn8Qcw?=
 =?us-ascii?Q?eIyUwKGaZuBqZrLM95cV6+G+43aRhJwNWlgTGy8UVJ0czOQeLMoTFzDMmjuZ?=
 =?us-ascii?Q?+InwPpm3FD+QkC1QZqnnVsmNRCXfyhhClQ2mj5VnXpY0rlSzOic8drV1KI7G?=
 =?us-ascii?Q?OLh8eJSTParO+KRW9xvgnV4JvjgU28omOxhnvcc/XPXaYU1OA5AwWwu8hagI?=
 =?us-ascii?Q?Yq5eyGzY3SrVG2Kv95YfkPFXEv5PuJZd2+R+gIGGf3D7MSTo2+7JWRpG7PLz?=
 =?us-ascii?Q?4im8razead3Vef8GZ5zyuSUPWDN9sfpslmtRZjy7WAXFeO9QbcrR/YBMIC93?=
 =?us-ascii?Q?rr5hta2iDPBD3ujeuh20wppi6GE/VhTKAOdWoU9iz0tz9g6RJP8lYBAmk7Aj?=
 =?us-ascii?Q?P0YZQRYW//TkRrtiAT97XN+05Ovd6OXS8PFDLwSFCITn1bP7xDDrKcZfXoyT?=
 =?us-ascii?Q?pmjVF0mErb5Lke+kc6bYtMGSluwR8vreJyKeT4pUl0TTrKbpfaqJdaVjykGo?=
 =?us-ascii?Q?FWaqhFrijYvljeZxiDqnepfCyd9jqmRVSNlsPrtUjN+adO1UO/wo2RuswQXy?=
 =?us-ascii?Q?5fJSCRlO8/vBplgmtxf0p9JZNfCPxTp0EaXgUJi3NRZ2f5DMTSVdguIAXAd2?=
 =?us-ascii?Q?hklR27doqiigWaLAWCrGKBfvZyJYRj2e5Rg9OBJf+M0VKkTPChqDkz14tVo5?=
 =?us-ascii?Q?Pa6tfZsN8VgSU7uPnNxvjTTS5wkHHQeZqiDGmHcGkkZGmRPzrWK8Na5eNhEE?=
 =?us-ascii?Q?dScqo8UaykZt3pRF4eeYUJ0T/AubfImA38qFFd8tzlFj6M8YjKgrtPGlm8gZ?=
 =?us-ascii?Q?O6+1qgiB9Xsbnfj8LHm/L2AyekOXc+DGzM1ldbdRw44K3z4QzphcG+tc45m5?=
 =?us-ascii?Q?Lk8v7G28Ny+HJH6UUOFUOjvMt5W22LsPJZfqqpApTdwu39oz/7sTz/h3iLEY?=
 =?us-ascii?Q?c9kKFN4FOqMIyrGhWcs0OYO7xL7u+hyetc+AC7ClfFBYVkKyMf0Du0Wl5Ej1?=
 =?us-ascii?Q?faTQulnakYoSGEExLB4zGwcc5J9rrKLgnZuOSemhlURCW1EbeLhZMs07WFlS?=
 =?us-ascii?Q?bet/DF2E4iyrjxBFsX3/xJsEsJ82UmVkLHf6Ifa5C91jVk3UTW8LhV+aqff0?=
 =?us-ascii?Q?il6Pf+Rf+HTXvjGBeqYHPEw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74726402-a201-4511-215e-08de0ad95f54
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:23:05.8131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S3bP2G2zJcm31qPjZs8g6JaDt1M1DxXm57YgHnhq4CRmtwdb9zCi+RTUSnRxRJQAKol3lSy3fgKt1ZyHC6+34ohqHgoKpILc+MBWGEy3+07/3DQ3e5kIWDBk9AlWt0Ko
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9449

We have very similar name functions (A)(B). Both gets component from
snd_kcontrol, but (A) is used in callback functions which is registered
through snd_soc_add_component_controls(), (B) is used through
snd_soc_dapm_new_widgets().

	(A) snd_soc_kcontrol_component()
	(B) snd_soc_dapm_kcontrol_component()

(B) is using very picky way to get component but using it is necessary in
ASoC. But (A) is just wrapper function to snd_kcontrol_chip(), and directly
using it without wrapper is very common way on ALSA.
To reduce confusions of similar function, let's use common way on (A).

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/nau8810.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/nau8810.c b/sound/soc/codecs/nau8810.c
index 6f432b992941b..54ff8dd82f66d 100644
--- a/sound/soc/codecs/nau8810.c
+++ b/sound/soc/codecs/nau8810.c
@@ -164,7 +164,7 @@ static bool nau8810_volatile_reg(struct device *dev, unsigned int reg)
 static int nau8810_eq_get(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct nau8810 *nau8810 = snd_soc_component_get_drvdata(component);
 	struct soc_bytes_ext *params = (void *)kcontrol->private_value;
 	int i, reg, reg_val;
@@ -196,7 +196,7 @@ static int nau8810_eq_get(struct snd_kcontrol *kcontrol,
 static int nau8810_eq_put(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct nau8810 *nau8810 = snd_soc_component_get_drvdata(component);
 	struct soc_bytes_ext *params = (void *)kcontrol->private_value;
 	void *data;
-- 
2.43.0

