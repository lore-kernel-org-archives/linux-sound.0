Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010057.outbound.protection.outlook.com [52.101.228.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B8E3603C7
	for <linux-sound@vger.kernel.org>; Wed,  1 Jul 2026 02:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782873370; cv=fail; b=r+OE/oo80W3iReo17/l3VUgrI4qBKEu6lqxoCOrUwHvc0iE6fH6YYQMmqJnbJprVeQ+rZWXNyGx/JxvbtA+nj1t2ZI/WIfkp0irQg0nlJsnAtPe9amqTdF1CBtur/9SFY+RGqeUeHufvvEkenNQqprmlpVLjS4/q3icTy4Vvw/4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782873370; c=relaxed/simple;
	bh=i7A/ZrEHxAPzgn37kQlgG0loKzqUINR/9np+xnkL4Ko=;
	h=Message-ID:To:From:Subject:Content-Type:Date:MIME-Version; b=g0meYDbMQfyrMonSpEumaaeZs3EU5kjJQ3/nLK83le7Q8sB6h4rMiBYpmajJL3r3ClmJDLPTtvmTcNewFnMR+xy2CXHYp8F01Fq1OIMvEhVmn+Uvo63kBmM6/zDpEo6vxUPsKGYxrc+THHiiqW7BxvUWHp4A80dYci9JO6+h49Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=XQ8EqL4b; arc=fail smtp.client-ip=52.101.228.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="XQ8EqL4b"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qntn278kzf+xTMFkBUjZZh1MZzv7CHlxtv69GMrJKu2WhfuBxXYFDj4awIsFKCT3iJSGc4wLSlbO/SYhRluKuxD1qp2/cVcGAIo0THhsrAI7FqEcW7hEw4qP9c/sg+17V2r03gST7kOHZX2ghhgR5KQlzjucVIgKIh9e1eOAW5srp5wMELQehvoV6ydoj1iONGZ/Y9JwTIGs3ji4rJPpuUJgNepp8L/oLL/idaJm3ZHHmN93HGRiHpmN/3QzCA5v/ro25wVEDszcVTRaig1mJZQMmQY/Z2T/B32E2X2WNaigdnCe8CpdAv6EQWwAsPFIgE8bUwPOxuTus0JMXqcetA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tMKa2pHQKviISZTsLvOq+6D0SWt/dJG7ZrzDgujssTk=;
 b=xrTAAHPSC/01TFE4nbq9vMM+lj//ktFWTMQ0iNdEhfDqbLj8/EfmpLmU482MK+Hk0v6aYk32vZngdY5AMFV46qraNw5yC7BkMFwvrHUiWimftGa5Kfp8yLmpv4CnmMF9XG7arNX4b6vYXjlpiDt0qgXmjf4O53RQ2pQCpL83kT5llb8Q+/FjX5DnIdCDvHpXsXAqZRpmk8+fFwNVOE64uXggAAiaE8QZWUCjFmpBSiVcGZjTAD21uyrHf95H+xqvyx/8CSqMwML9j5uczTpVWJOEtIUqIGmY3vhfzlfB6optqf9wFTlNK+fhvzdRi4utLNblIc3RpbPEJgoifRi7ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tMKa2pHQKviISZTsLvOq+6D0SWt/dJG7ZrzDgujssTk=;
 b=XQ8EqL4bvnjGeThghUx9Ah+Alm5l8ehHjxpFOKjrvoJC0jdzJTsfHoX7sWOoRcmmyG4NnIA1Xc2UTHyuXAhV9v+zCQ0aglXq5KIJf43tGRLrfLZrusHuwpbERog36uU5377ITakZ1ytymypa/CQd/2eVDpy1iczQ1GmeSXRsWEo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY4PR01MB14320.jpnprd01.prod.outlook.com (2603:1096:405:23a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Wed, 1 Jul
 2026 02:36:04 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 02:36:04 +0000
Message-ID: <87ik6zcu7g.wl-kuninori.morimoto.gx@renesas.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>, Jaroslav Kysela <perex@perex.cz>, Kai Vehmanen <kai.vehmanen@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, Mark Brown <broonie@kernel.org>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Takashi Iwai <tiwai@suse.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 0/2] ASoC: sof: nocodec: tidyup sof_nocodec_xxx_setup()
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 1 Jul 2026 02:36:04 +0000
X-ClientProxiedBy: TYWPR01CA0011.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::16) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY4PR01MB14320:EE_
X-MS-Office365-Filtering-Correlation-Id: e2ae7045-ce34-4974-acb4-08ded7197f3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|7416014|52116014|1800799024|921020|38350700014|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	3OZp2+OrU1uOEi7s31CK+7rkt6eFpDd6lRTcn9uTpka5XMo8HU4XMYJuuPmT/eI5eiZE/KFHvINPYA0jb06BFVlbYGRmWA0clfTPUOzdtQ6trkWc+PUN/7lXtAe2AVi5L766cvn0SlKtOQISqAPEdea8o3GshXiscjtCbhdAiZNi54bdurIHz1zdZ9tTeAuu7LZLnNpVna2K87rjTMNuElaOM7UOAEB80QnqUajF3sVGHUcOVlfcx3H8C+u191UlmNlwgWot3OW6qoud271ASBjCBk3phY0svrqWawhUwHKoLHGDe5hifDHPcaSuVIHX+U0GQ+3l9Pkd3FY6gw3y1vckjyDg+FA2LhsfE443INDptXHG2g+q764n+b1raIPVpEmIExNd536rsTeuZFaFoIbj75ESSOLjMtnUbn9Fhr29JJtruBl5cBk/ZHHFHKglLZ2y7JERcxZK6/QWuYp7jgwTQPD2ZR+6Kgakf98kziLvxSXSbs9lkzmcaPQ7Rv97v95J/vGJLlRENHteTs9UH6KIjWv3Fyi9KrM3Ak98YU65U8aI5ODVtYWER9jqmMOSt+s0Hi2fyyMBvifU3kSauum7ahrHWc8u5HRWZaWPMA52i3J81PvA+Wxmws8xvc9Nm3v56dPNS+IrG+kOlmFVfKNIeNoESQY+WiA3f/EWF9hZf4gz5haMcUOhWIiVu9i9nVKtMBROrIef5KAu9gBJK61mcNnE1o1U5wJhOaZ63wY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(7416014)(52116014)(1800799024)(921020)(38350700014)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kvxolqHFkkZ/aHsJqjlHanrPe/1y7baT1RUbyMlQo5l3s8N9kgLzAuiNYfRZ?=
 =?us-ascii?Q?EID5M52OIAul/8Iz0h1/fkDmMp9oHth/UBEkXBjdMxZXE/bqnnk9KtEhfiK6?=
 =?us-ascii?Q?NlzSkzAXJcDT93Y638W2HdiqyEaHF+Zup887KOOCa0sOFd8+eWGF+m8wQ1LB?=
 =?us-ascii?Q?6M4Q8n3qy3bgfh/r+8zdmx4fkSWFfnIxsaag1BrjzvVQAi49JXaEbB0cOEw2?=
 =?us-ascii?Q?f/Dv1IJGkfbbZaGAdyHvMmA6eB56AvvfoABE4BNv7dvHgJCf+b7gV5YOyGJj?=
 =?us-ascii?Q?QXb1s63s/Wbjk2PN3ZF1iQ+bVuMj7jG/aXTcPAjYHODQZ6QvZ2xf+KHUQkf6?=
 =?us-ascii?Q?nXpGrrazt4Is+VKHoYxHe2XsKhhsrXIOrLhV+QCFFj6ft9OvUhs/Rw1CEyCH?=
 =?us-ascii?Q?Od+PcdEgiOpyjOprfGT8eafjdXdzx+55aR/6lr9ZSGV7jhD8AQM4H90Pip+n?=
 =?us-ascii?Q?t3TSZAqwE2zLpISpBgvT2NuyhI3/stsFZXGU+c7Fyr0THkYim7MasIXK8+/X?=
 =?us-ascii?Q?EL6DOXsZy9Gvcre9T7u7U2+Kf9UyTG0pO7dGAN6iR6vTRxYmGFPEWkukckSC?=
 =?us-ascii?Q?PSzs9PFZK6ubktc4F9cA8YmzCBRq1TLsHWQe+2lAY/wEFFLmLbdTyaXH/2Wp?=
 =?us-ascii?Q?aN0hUm5/NNCbAYSEhCFUF9NOsQBhNqH5ObkVFUgk2nivd41qfE4yre0sqhsW?=
 =?us-ascii?Q?hCLDgfH3qZn3rTDfasYeENZOcjj/BW1uGy59lPGBCwsT25g7Rt5OqNwTR1qS?=
 =?us-ascii?Q?VY5EOtng3ZRbYMLsg6ct4zvsoY8rWbk2xYiHTjPXl6xPobONBxoyBgZHRpQD?=
 =?us-ascii?Q?aDa8JMXmE1LhqqQEqpSX6yNyiglUcalFUA6KHbQGfBNaKHDv04i0ygdOFVgx?=
 =?us-ascii?Q?GMuKVOt6pLVMQAaLKQII0rdctjuOiFJ8ZUta2drFjuFed8w4iJ9IUq3yoe3q?=
 =?us-ascii?Q?S61oZ7nJVpXxcQWKTKaoiitfDhwm4eUJJ4Clt83hnh3sg8bvQAZ30l4wzvmV?=
 =?us-ascii?Q?pnTbmrsdNbHgNPut3NGQKAGU0ZoMqHCrfDw0mSM2muPl3KqRMS7wTyTDQ4Il?=
 =?us-ascii?Q?SPkK9fj7Y7636JPLCcgbx6CNLzYHwfoNftbAEdMHMrVM2i85e4Fk9gQvxJNV?=
 =?us-ascii?Q?OEF9DNakrEvIoqlZ8LFFXq+ooFs0r6gIP4UKDEujPSzt/TsqiJtM4dpy3crL?=
 =?us-ascii?Q?yn8Ro+zsVuW09DW+1XPAdruFq41HH1wEp5uFGUVSixZ/uD73bbPNStOGsshu?=
 =?us-ascii?Q?WMEKt301WqbNNG4Zfx0GikGQENNLHmHLATq4NNszJAc1jqHiRbnrPrLCMXdZ?=
 =?us-ascii?Q?+jzsDe8DR2X3RJhYjyz+KXIly1mmo3QUJ0fT6Sur6crWffVBLPfeYm5TdzbZ?=
 =?us-ascii?Q?6KdLaSXDZ0wD0UjlV0HQ3UG2+aaceO6m4thDOH0otb2GXZfcY/8t5nJpY/kC?=
 =?us-ascii?Q?KX44d+/XP/rS51YdGRMKL7D/RHcoEJUnCyer5rq+Oj1MyXN3Hb4cJlBqNCpV?=
 =?us-ascii?Q?3s5sBpygV19Svpu90XyhPC2+X3SVYHSXdpxmCWQF/CbZQPFPGwW7ORuj7mII?=
 =?us-ascii?Q?m/ho7bGgsFJmkGxvd3LpBN8RBXkrtvrkoGDww25FNcqibieA41r64XjvIswq?=
 =?us-ascii?Q?ALYO3VBTLCJyxIcAf6OK5znXz8xLfthb8WWPsg2QVFLpTEjAD1JoBDoV3klb?=
 =?us-ascii?Q?PlgJtvpuOAK/SnkodicqAeOyvcQit6F2Ev/Ub74rnQJCVqcHIq84SWXWdBTw?=
 =?us-ascii?Q?cRt1dVAOIMiXPFHbouZC0BGi5CKG2aE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2ae7045-ce34-4974-acb4-08ded7197f3d
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 02:36:04.3874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OYoiIszw4u/0w9Ig+Bml6rnByPpPZae4oINKS2rI5apoOI86uc1Wuuwu2SRWdKFBSKaBsKDAjY1ySdt0Ux/Piy0dnZ15F7Re4wM8+RiMzyL2y6JAQ6w3Y3/hJSqW2BuG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14320


Hi

This is v2 patch-set

I will post DAI/Component/Card capsuling patch, but
current code makes old style / new style conversion difficult.
To make future conversions easier to understand, this patch clean up the
code a little. but no functional change.

v1 -> v2
	- remove redundant pointer check [1/2]

Link: https://lore.kernel.org/r/87pl1deu34.wl-kuninori.morimoto.gx@renesas.com

Kuninori Morimoto (2):
  ASoC: sof: nocodec: tidyup sof_nocodec_bes_setup()
  ASoC: sof: nocodec: tidyup sof_nocodec_setup()

 sound/soc/sof/nocodec.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

-- 
2.53.0

