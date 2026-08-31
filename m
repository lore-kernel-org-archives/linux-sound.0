Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010028.outbound.protection.outlook.com [52.101.229.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8E23C3F62
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 05:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788152840; cv=fail; b=MLUliaapSSLz3Nu5JRkivPXUfGId/ODgoi4cma76CU+q114L9xEposKsVcfWQRH5Szydr7xRidpXBFjgWqBb9kSRUD7sCtE12IKIUxGOjZ7W1QzBjei4i9ACEdf/H0WUU3oaCxyseDxsc4iHWiyfcQcWoja+SyIhyN9JrHahNto=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788152840; c=relaxed/simple;
	bh=kyl7uOwmLP/3Cbz7Idi9xs+RWDrd/VioPttcsiugSvg=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=c8GZDBppVsgMdNwtXH4vRLRLudBESl22gixrbjVtx+d6459EakRaiaZXVnRrjBFyAeWGZZ87sNItmKe72In3QQEqF6mGO1ngNek4luIRYR70AthleeXBUS/bChsbE7UFr7DaijlNu7tnPUaU6/9sLD01JRoYewyNaLqeZbUfIp0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=QhRiyWnY; arc=fail smtp.client-ip=52.101.229.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="QhRiyWnY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ALUpv+ZQxfz5ozuPSVB88xECBE7AJqaKcNudjNHwIIsIX/40Q1SztzBg25icqWWDEqSnYddKwik+ynRshXlOL6NnMGi+UHGNIpceqAtawqfCgDIjNciq9DMKj/YGDbszpUQC11EiyAZbeS4r015iYdSUp1SNVOjB8NSsFSE0g4VkU2x2U08Fl/TZJKPai3VC9p+uce7m1BggU9+dB8ToWwykjyjlG8oGzmlS+Ce+jpxslMVxzdY78UNZzyfsXH4Baat7HVrZqCWtT3azm15vHtcpgKMrqdM8oaAn1MLOKWQeh6FdzHe036N0mggnZz9lZEAetKVeUHmJJILv+A7SqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7j96MsbXus0W7bv++jiYUULNCamE3+BEMMils21qblk=;
 b=ll64ze/ZqLZOCGnlW2goT76+/L7OwoeptRcAFPj4ekzwETDhIYfrLcbJNYy6RFsjqUyKiK5iAXde5cRW+DQs4G8D4UB6t3J5DgoF4EZJFmD0/JO3q6neHK8oMXp7s4PKKEc7l8rGBFIvtnkx10A2JFlXHYuUBnvnofFcrzFGjKpodGDzez4Ch9gXFqPBm2st6Bm4b7oU66zEdZ+d/92NqrRPM9VQa2kSZO1j4Ij73pI+F9KJWvKqEpkpG/nvYqnmvM7h1NrkbkRUNd700bZFaL/N1JVD1pUZYxTzZlEVIVO3ORDmCvTQaIfo2CK7YPXSwG6nFW8qHb4ttLI91pF77A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7j96MsbXus0W7bv++jiYUULNCamE3+BEMMils21qblk=;
 b=QhRiyWnYDIt0YmrXg+MHl184h38QQDamrHNPXIb8bbdqK5QxKVJF3gxiK3AfLxNXzRlzG0lqgTd2o2t4sdV7EMeVz/R0xmfI3JIumS8U4iweFr15ydQOxx95ifJVSiQrB7bIXa71en0fcpIdOtIznhgEQpexLPrDMN1eCmXKER0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by TYRPR01MB13019.jpnprd01.prod.outlook.com
 (2603:1096:405:1c7::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 05:07:17 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 05:07:16 +0000
Message-ID: <87ecfevpx7.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 07/39] ASoC: codecs: arizona: use .auto_selectable_formats
In-Reply-To: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
References: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 31 Aug 2026 05:07:16 +0000
X-ClientProxiedBy: TYCP286CA0183.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::12) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|TYRPR01MB13019:EE_
X-MS-Office365-Filtering-Correlation-Id: 007bd75c-7d8f-45f4-8ebf-08df071db9f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|1800799024|376014|23010399003|18002099003|22082099003|56012099006|11063799006|10067099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	rHDwJ29+BvM1OxVJc69ss2gXfOB9RTZlUbTxC/muZQH1kYKLp+Mp9EgvxRocrYZ2HhycJkDG430bvQemqTVqnknIgpxIXNq0Mdx5cI1lhytpMHXbE6s/N8faE+/tv6eLs/D1I7jyDxFemdeL+/CiC2hyaMqcSf+naPXUgQ3RT1XTFdhbPVME2RE9cGYBcAxKbfX4reaHTAE/kLkMDM8E3Co7D9QQgk8VYhow+fWy6mGwSorj3zEE9TehKcJE9Y1BfBzO+VDI4kSk9PZEKHUUD1dpYpezP1K6mlrkncsHbneTPVOnG4Ig9ykQWjoC3qc/DaDZNziPsTjaLuaIIEmcNRr2FhmmTWHTCREuQ5m1lTIl8+qkoMh5fM4EASrGBYbXZfptKIZ4St23XlqQvhIYcS/Mb+2LO/NSSpsLH32jQPqyLoRbDvjmac/KHaezh6azfsua7c/WjruP/6hCymaEDkiurNlQs7oE/ugI98I3cg1hZUle9XK+SdJZtbYsK0whF7f1eWSRwTe2Hss90+ZSqrKXHMTxSLdFg50B7u5uQl/ToCtl12XKz99KuxKXe3CNIy1RMa3Ue/eulmkzD5NiA8pRvkKr26yjkMUqKGWMahkxJK+UJC5ZkUt7N1UBaqkEh+d6N6TczX5fY4LupYRzDwRxRebjEp4Gh8SCs1WI5AWaa+W6kL9C51Q2MUBPa+AEaKkGRdTKl622ZQCXoz/Er8vt7HE0ghMIHb2FUEt/1II=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PB5NofNniCYv44QJOCedB/FIju8SH1tVd7T12i0HuK5CzYiKf6Jfd+wIbX6x?=
 =?us-ascii?Q?0uCSkmhRxD4Gpp2oARSMUFutcIajJLSJsCOdPvYIEMqj8O0uJsykymyX/sVB?=
 =?us-ascii?Q?GfWq8dRHKErBnN9osblS5ctQHNIXbzhoejHMqpjR/WxO3a7xSbzwYlymRdxk?=
 =?us-ascii?Q?FeDPjQeAg9ISoKJCP1rsMtELAeRA32CjJtD8btjoHsAwYCQTNZ+CkibHAxVF?=
 =?us-ascii?Q?Xmuu1iLXQuU4aM/7pXz19wL7aUI5pPoaHh6aABCiG41QOYl4H8Ebr+KZXIs8?=
 =?us-ascii?Q?kyVoLUh31SIA+jIu0YdW3KRb1GEzDgqugGZFzK1srW6iymiEjkWyBg7mu3pq?=
 =?us-ascii?Q?h3MGudfJU5A0PAPypBNXh1HetRVGKgOzvtMnNjysYzG0xjLOYKtgDR8kFhbO?=
 =?us-ascii?Q?5OGpWKyrMkAg74Bl2+IVbqspWAiz3qqmDtVCVDhGAG1oPTLha0OuI/Ts+c5t?=
 =?us-ascii?Q?dENXhzNJgjDOw9vxeuqdbWuLrunI6fmQ05JgD3gJS9HZ9USTi1ks6NaDeix7?=
 =?us-ascii?Q?IU+XArxeQVCK9yIRBdCr5e1ztw/mWCNCqDGtZxU2P46swe40GJEDbtsz88nY?=
 =?us-ascii?Q?E81TIyIh/9a7PyoLL0L9gocKXXuedMJVpTOpwrkPn9dprKZi7WEfZAvNNPDD?=
 =?us-ascii?Q?ySpXoo1taxaIsNNehKqXl+Tp3LhM5Eb3/r2U5pIXB7if1BzhFHy1UiDYsujX?=
 =?us-ascii?Q?tQd+atEvwgTnh4TUfkG9oUWVZQLoa3/sjtvNncj7abc78Upcgob6Qgkf2MYJ?=
 =?us-ascii?Q?HyE7Jkw9lI7z9OIduJsFDcqeVBhRP8vhxiFk/N9VJ20/YqXqR9geWNedqMCQ?=
 =?us-ascii?Q?LjM8h1AoSqqeAHpxJk58upEZGcwrikiZUzmtoe/49WiQkg34SsfO5D6tut/c?=
 =?us-ascii?Q?PX1vV8WcVWcTFPfeW4GPyLK4YGYZ5iCfWUHdKWZTIQos8BqbklCyb4jqV+1A?=
 =?us-ascii?Q?XzBjPsOTCnPMZtRRXBGryaVADDAKzlpSclZ/5XHS0qcJDYOYhWxvK4MP+QK9?=
 =?us-ascii?Q?WGpDLfL4XJDs6LOK5UdVvBoEJBcnF14JMfB9HOSBRP6LhkUiuGcU0EDV8E2s?=
 =?us-ascii?Q?GHp5HIGTIz5UIwZis0DrcTq0hyCVVZjxKYya2CM0rdMQ4EhmOYDVvOYBtd8Z?=
 =?us-ascii?Q?ipUlW9GYQlvcK10GakyPhyRdIygrBB9j7cp6dj1usAs/RKrAG7aOkHRQerVv?=
 =?us-ascii?Q?TaoF9CNhPXUnd2WHScv6UORWbAX+VSm5On2MCep/h4CcKA8u7Pymd6zsNKLx?=
 =?us-ascii?Q?/nHhtx8haVWH/y6SDfllXvge4sdvEuH89AdkG/yp7ad34ijzO59ODenSlcmU?=
 =?us-ascii?Q?263MfGUi5/EXjEjeb6SKSXCzsaOsC8YX7B/jKuzuAl5vQBmPptxM2A9VRba/?=
 =?us-ascii?Q?EK1iK+LvApQ6lg75Q3oLj5+24rvgvr3NFOS2reRt+L3aJ9MPKBPgfsS2IvTv?=
 =?us-ascii?Q?v0v3O4xL0z5Jm65hdYgFf6pCMJEO2OOSLsufSRqjfogNL0swuTd9Lo/4Ua86?=
 =?us-ascii?Q?Y4Drjp4y5McHGU3KZvgGREGP9uIx9u75Ezb6CQzcOxEvBsmO4oj5n0xcLabC?=
 =?us-ascii?Q?3eKvzVnd3k15uK3a8BOD3cF4/x7+CgEkdDMiT5wMfPlA/4yj/gcYkrt3e9IL?=
 =?us-ascii?Q?IKIhVkGc3nOcemvr+1Po3x4vt+RJLdbaO58f2UUXCGNLLczxEv3dhQzAmy/1?=
 =?us-ascii?Q?CCDZQw5euH7aKjBgB+Yh2p+k7lkDNDQtru2bV2fQiXteCgRySvz2E99qvgIE?=
 =?us-ascii?Q?Rg3QFy3m23WOas6OH56taXGqo4K02AcD5J2VJjKB5LfYEaK1LhTL?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 007bd75c-7d8f-45f4-8ebf-08df071db9f4
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 05:07:16.7196
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VYMc3a+BAkchf1D4tVl6durob+Qhd0ExvGMivPTytoW/03FvI9xCgaH6vjmrh8uId6EyDT3DT9H/fVetZANMu5d6sLhujqCxaUkEq3K0MQCDityX+lIh1A0eO2I4E1Sc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13019

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/arizona.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/sound/soc/codecs/arizona.c b/sound/soc/codecs/arizona.c
index 4411165c37345..7c296c5b24f72 100644
--- a/sound/soc/codecs/arizona.c
+++ b/sound/soc/codecs/arizona.c
@@ -2016,6 +2016,27 @@ static int arizona_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
 	return 0;
 }
 
+static const u64 arizona_selectable_formats[] = {
+	/* 1st priority */
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF,
+	/*
+	 * 2nd priority
+	 *
+	 * _DSP_B / _LEFT_J can't be clock consumer (= arizona_set_fmt()).
+	 */
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF,
+};
+
 const struct snd_soc_dai_ops arizona_dai_ops = {
 	.startup = arizona_startup,
 	.set_fmt = arizona_set_fmt,
@@ -2023,6 +2044,8 @@ const struct snd_soc_dai_ops arizona_dai_ops = {
 	.hw_params = arizona_hw_params,
 	.set_sysclk = arizona_dai_set_sysclk,
 	.set_tristate = arizona_set_tristate,
+	.auto_selectable_formats = arizona_selectable_formats,
+	.num_auto_selectable_formats = ARRAY_SIZE(arizona_selectable_formats),
 };
 EXPORT_SYMBOL_GPL(arizona_dai_ops);
 
-- 
2.53.0

