Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010041.outbound.protection.outlook.com [52.101.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABCA37F8BC
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 00:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785804083; cv=fail; b=RiLn2RjW07hqOr+eDQpdZ1J7Kksh0OgzjHWGDbgJJEnBzBlgJKi5YkAGUtU8pdKlf3aNC65QSA/aLD3HGWRlMH81XdMpE/i3MuXIDFGkzDp0Y8TW/a8zs2pmeIjpRJuUXTDaraAlROoW9F+Avz2I2AFDtmst0y9lK45Dzm0BO04=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785804083; c=relaxed/simple;
	bh=6n5+PzABtyWQVdkPWWfhsVVUzxsnOEFSpBPMfO855tw=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=lIZpwTuGlZODS04iz05WLSOxuxd5zoDqwdtkV0BB1JmtLVx9y1bzytj+kr1LAQNrgvphu1G75SrZi9Jkq4tc9ZCdlw5ZN3j6C6daoEFi9Mq2FQJWr1OGjAgGJl1NzQSIs4P6S3zVdlJO9B/7WLz9ggsEyaw5i896MxyBuNIELRw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=MpLVeVh9; arc=fail smtp.client-ip=52.101.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="MpLVeVh9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QcNKlUpWyHAo74Z7UC9DbbQk7CJh+PYshp4CbQWjUWqvI9KcgvQjVVWZSYRsS9NVdIu1VsPDFTn3C0tLYX8mUjYlBhSCU2zD15X+jIA6/f5fzNec2XvXwjH2AIZwSOTLd5XNOT8N31KaRZKDeg7uuL2eteb94upwM2oQoSqUfhlBNq0w3AZnTCN2D5oMA4kbidkVjHPWC/fWTE55pr4CZRXMkFIzMcKwbRyI3zscjG2ew+I6UQYgqNDYPGmpSIC75ntU3eDGb7Cc1auR0ZEeMddSeiCBLn48nWABr/v/dtEOpxop9ed+k/2idd3lOH40pEAwdLZd5WHhcQIPgbl3gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qEhwF83NzxaOaRzy3JMd+sCLRwSR1+yyJYQl8g1IKpQ=;
 b=jr6vvpOAYgIO5SkZVUaGyV7cuVkjQ0Ck8bD31vPALgg/YTXwb6KGJK+M5N0bow6VZH/iFjjc4a/iF+jXGOnChCHuIX9dYE+lXFhetb5mAQRIrvhF+v9igae3M/Qoa4cxdHlDl5g6Skc7yojSHLWjsd3il3LHQt0gG6gJlOi2/erHTQH1XwGVjhoR1wusY5jXdD4DZ3RMUhruGiKVuWgJw99olaqHkmfhpUDaeuNRZVqC4rE3QYTdAoqtdrKA/dYapam3P0Zzsqnbk0KKi2bVplyH35sO1svrbrod/EQJdSrwAUbfwW/nL3SR0qxrBpDyaE2YJQdfbibgdjl77iUppQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qEhwF83NzxaOaRzy3JMd+sCLRwSR1+yyJYQl8g1IKpQ=;
 b=MpLVeVh9VnHBrpVu3w98zk4QbvPd9sim/tUn+pfc7cVegToTtUEbmp0eY4bijhKxuW/sIVgzjgYXmo1o5O5csph+gK0FqqdwGW9i4ac4QnwyWcUpzEwA1KmESXVJcvBPmug0dcTrP0RRCQv568cPxoU3Z55s65fYC2vRlszh1Qs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYRPR01MB15651.jpnprd01.prod.outlook.com (2603:1096:405:285::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 00:41:19 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 00:41:19 +0000
Message-ID: <87y0emwwcw.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 10/44] ASoC: codecs: cpcap: use .auto_selectable_formats
In-Reply-To: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
References: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 4 Aug 2026 00:41:19 +0000
X-ClientProxiedBy: TYCP286CA0183.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::12) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYRPR01MB15651:EE_
X-MS-Office365-Filtering-Correlation-Id: ad4b2b3b-af4f-43e1-130c-08def1c11994
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|23010399003|38350700014|18002099003|22082099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	TjzAyPj2fMGXnGdjW3uICpaXq7sftQCdq7xCSrd7Eh+akcwgsvhCjaUPjHZ3QaxYKwITrqTqpS2D9Jvmy1b7iM7mqMb8MHNNWIz0uZSoXDvSy6zzteDl/0i++xdWjG8N8Tcoh2VjnvF444tRjhd3xhtOYlbMBGB9k9nE6WrT91UI0YAD3bGIqFupYT3oSHBxR/aZyNGwxahuIPr+TSP9T74pqhntWArPUdrESgGSdxPYaftUJIIFNMu5e0lOiTb0iHspgzv65a2GcCSm6IBnh97LWo7gSkkcUFxYYMm/NuoGm++fo9F71jmKZTDd9z/tyI0Egg6NTxiR2YyUmwpcyvqwJ2kbwD+cTx4X4+f55yyc4BqUwIaCSGq+B0P1ctXx7QxkvcLUL0MwZOzprmh0Llnl0zEOy5kAs32nz5dAGe+QDyo1s4kqF6FwjiPiah3Q6KLfiAtaIkRaJTmxNxV1sDQvTdBaR59C5utkXGZY8F+8DLIvL0QQObwzXJxwB0x0yvnYs2TXyRNvMHinxi6gOCvtJsJ6cCOg/kFJ3M1KhbGBY8AxcwDLdfK72RqdZV5Wsk5XQMcT6Mh+ymori1c7BRGns7BwSkQElmQtFZSxM4cVSmg7RTz7tU5+bX9D0B6Oegn5reffA7WA5xD/9dMK+OU97caEDJ+05GOgH9i9zE0AAK0U7QEnOohFgwAAAgD4P0FQT0FYyq2uOPL7LAFoDA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(23010399003)(38350700014)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RD1rebCpYmtxe5mRj7yaQdcYu0ClnW2S84uVjwrvUpHsm38yGMoSbXFSjhJT?=
 =?us-ascii?Q?BkJ/ks0H8uqG6yzihZ1zhgtTlPO/ISheWLOLhXY/tjGqtz7rSQHadFnPCdZB?=
 =?us-ascii?Q?8EMRv4428QmC6o9+w8M0cFVvNRs2WFti3dKm8MPeifpXtuTRkt5niHz+YEPd?=
 =?us-ascii?Q?M90MkC4ATsuEJnTChuHHsMsmHJHHmqn16+1C0JgCPITVlsHdQEu1t+wbsMP/?=
 =?us-ascii?Q?Trlpnim88FbTGb5Ob5FEbh4uU8uvyqC7o3FTETxqsvri9ia8HT6fU2SvQCau?=
 =?us-ascii?Q?Eyu2VF7U7bMlh6Dj/DW6khlTEszazikeyjNXI49tBhgvCl7Xj/jgNSTeyAwu?=
 =?us-ascii?Q?MoJAlJ4Z+G1oMpxVVqPQPCRxkzs68JIHYD4aeedwV1wmRNiiPgksgn0jxGe2?=
 =?us-ascii?Q?mCI35460DL+zyrPydmOa7i6BZOyIgyNPlx9PtMEeMGnzsAxXFi+Qu1iMWHc1?=
 =?us-ascii?Q?w3fjyJHi+fNqtolDh6NmsBjG12HE65FD7OjLrXB363ksrQRxPWgDCrErJL59?=
 =?us-ascii?Q?w2/kTDrQukIEB7LJdrdLj4QUwqL2zMtJ1rzwQNoiXuOpN1U1p6o1Y8KxcOtb?=
 =?us-ascii?Q?rslg7KNMaH9H4+/HCSxdN6+lWw7dfo+CxwNNkynrhKwTxTMOQ5+IyNp4+2eu?=
 =?us-ascii?Q?Ym3Ou32j//G0I1CNjLWM7UKdGESidS1lmfGHb9pfEx+IWz3intpZqicEzYDd?=
 =?us-ascii?Q?BLWReybBe2MFVsNJvQ06WJexWBPMNaIbeyZTdSN39hg0ouO7Z6pnj/rLNCNE?=
 =?us-ascii?Q?uympXPMeUYtvCXjNlFCt8ePWXL5UH2ry6LBWqj97VYO7AQQtmbAevoqnzsDh?=
 =?us-ascii?Q?nmUimCXZbRNbsS0vkMxbKn/IBEf7MXclDqVnDEOfq8utuff5fiORvDvFOx+V?=
 =?us-ascii?Q?75fpZ34CuJKYUlaelb9qdjshPVj+TfCitDQXHEBoQjx3L3qyAy4KkRCjTx0U?=
 =?us-ascii?Q?O/FmIN3IfswjfAOwICC7bh7z7EZKG/BPZJ0XKxjOfLx2z222GotCBCqhfJIV?=
 =?us-ascii?Q?lPOUUbj8tpGXnWWfF6KQC2OwZUtVwYW7Vm1WSIJ3IIbA6aVKufJIx9+Jg5X0?=
 =?us-ascii?Q?v/2/1BI6rekqoNWvC4kHfyNO9dEj3DYcMMojLzeEsSpOp687YUdLNkG+LSdV?=
 =?us-ascii?Q?98AdPeoElAFvbR3/iqCGA8fjYEgLryBQIBtGdPnlAjUQ3rEFClhaCSWZ0Lcn?=
 =?us-ascii?Q?mOPPls43s9qXOgA8g+5qJeN9S7EMrNXZ31T6YW5BMZrgWjz1G3bnD1M0T/82?=
 =?us-ascii?Q?u5zpiOi5ueXKJ3+8TxHB7oFyQXCjmliBgpVhdwQiiPmqx2KT3uInZX2KPbkq?=
 =?us-ascii?Q?h8R3IwUca1f17c0MDGBXeR233I4+R7Adkcy6rOQO43YmZ1cRiRR/MQ5UD/jF?=
 =?us-ascii?Q?yzFTz24rNE+JK+T3E1PYN70zqFR2S63R81f4kSWzH5FXEPAqInRbMaxnpn0+?=
 =?us-ascii?Q?GL8E108xnOpjUIcxvVAP8nXllBaFF44ANn4tP7+cyMDHTO7sD+5PvpD7r4j/?=
 =?us-ascii?Q?9+lZJ3HPt54qdWwhGNcVc4WwNpMgnurZ5rOb41NwjMW8Np7neyh8MuPhAgP3?=
 =?us-ascii?Q?I1t5KU7a/6Hd2BrgTRruWZNiLJQAvtBkG83UiIVnrepQukbEfAn5uIcWSXVn?=
 =?us-ascii?Q?tg29mi82/bctz22D8RVgJ4fC6zQuvYMHpTetgaYvdiOo2RQg3KhSrzfMtRnm?=
 =?us-ascii?Q?SwBhm2KFWjo7YgCAGTnIs5bjEptxXefWhJUkeWKqbpx79KC/fDyCAY526/W9?=
 =?us-ascii?Q?LzV45VZ+Z305EPq9zd2V+DfNwqzR+IiP0fNlQ2VzuDWMUgj8Z61b?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad4b2b3b-af4f-43e1-130c-08def1c11994
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 00:41:19.5160
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bq/vomW8g+T8xenM56S+hlyAQl0AOMzMDWBkWgLiVlg3pstnqzQPLQPOpWBWOHV5NUCtJfcfKwtwjcKfjPNBnq6NSBR5vpurSvAFSPQ/jTc+hgNtmEyhmtJwkQBxm7m7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15651

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/cpcap.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/sound/soc/codecs/cpcap.c b/sound/soc/codecs/cpcap.c
index 6b80c455b0747..b8bccf2df859f 100644
--- a/sound/soc/codecs/cpcap.c
+++ b/sound/soc/codecs/cpcap.c
@@ -1253,11 +1253,24 @@ static int cpcap_hifi_set_mute(struct snd_soc_dai *dai, int mute, int direction)
 	return regmap_update_bits(cpcap->regmap, reg, mask, val);
 }
 
+static const u64 cpcap_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops cpcap_dai_hifi_ops = {
 	.hw_params	= cpcap_hifi_hw_params,
 	.set_sysclk	= cpcap_hifi_set_dai_sysclk,
 	.set_fmt	= cpcap_hifi_set_dai_fmt,
 	.mute_stream	= cpcap_hifi_set_mute,
+	.auto_selectable_formats	= &cpcap_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
@@ -1528,6 +1541,8 @@ static const struct snd_soc_dai_ops cpcap_dai_voice_ops = {
 	.set_fmt	= cpcap_voice_set_dai_fmt,
 	.set_tdm_slot	= cpcap_voice_set_tdm_slot,
 	.mute_stream	= cpcap_voice_set_mute,
+	.auto_selectable_formats	= &cpcap_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
-- 
2.53.0

