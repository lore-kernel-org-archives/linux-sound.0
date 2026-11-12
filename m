Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.17
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794463703;
	b=lweanflgawF1tCQ9NfYfQzfBw3gsUm8SFSsxUA2yHUaB6O9z2NSIWoIQI9ouVFVA7LNy
	 T/pSKKLopZxIZg0LJxBQMrATventyvHRRJ7djYZEM2Yi5sLGiu637bcsQOoY7TcbnY0YN
	 DqNjsq+MLIH5LGoSXtf+3CvsY3EPj7+ulf4fjPso4gBKaqnXp0pxrTwHD5V24Szv8R5x4
	 7tRELlRra80H1UdBBG93FipjjMC/yC0nlVLSSR2Y5aDM/hfQfIB+Gy4JQ+uWAwHSgH2hK
	 UkGCBR8oiPIj85KvXZL8UORXVOlP5RkGhwUv0sflR508/RN3+KLP19DLENYpgd+GvBg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794463703;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Content-Type:Date:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=7vJILFV9GlIpXIb8koI/9C1KlWkQNY8llwvZTgt+B1A=;
	b=IqJJPf+PPtPEDPiJJtEmEIKsHLYsLQ8GkdKKMduiOhEEk7UMCaQVAQflj8NJDz0C9OgZ
	 Fjf7r/TxhYcPlBBTug8xrelMTaTFCH2Fh1fl6LiPdDQ0T0krdFd143BYHDjT2Dgv89QTJ
	 4XqJP7AdI6DHpa3dcGiauIqhgcVHmRnWcjCB7bi2p7Oo80ut8zhYB92wZeVziZPxgyr/o
	 g4Cyyj2cIGFnU9AqwFXS+GOSe9CRPYlQwWRyq7DoGRIxFJEIjo8joVuipai9V0FHv/HPY
	 6BV4nTbDLnhrYbY+W8bGvUPwL5qxzTO3PK9TQ4fokdm1/hxzMGyV0cIUnFaW+YgNNcA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=cgmsUtYG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.17
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010017.outbound.protection.outlook.com [52.101.228.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2F6606A321
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 06:08:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E2F6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=cgmsUtYG
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RRu2V0P9ApPeS6dHNNh5hVKvzdmp72BZm4rqEL3Ey2mJAthMMsNIdvw7rYTHqnLBzcO2mmwci459wHm9GirKW1D0R6bT5FV4p7+KWDLLAwhlwg6/6e+YcrCtFbCT2IxW2hRlzQppCPpZuv27P55imRNTPdkJBdszSDow/mMPunKLxfAjgw3FXa8AkRz53RdbiqN3hJQUlIHYXbA/dBBg33TheRAPR8YoeE1GHPrHxCndAaSEh3yvcqIOXTG+rsjcLNPYTuicWnVjpY+mtTQiAqXFeZIZFkPzSCAoWkYrJPdcfKfCFYXGTGJi9NG1zBM4bH5vje90rxFL0g8uLgX/Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7vJILFV9GlIpXIb8koI/9C1KlWkQNY8llwvZTgt+B1A=;
 b=l2CCT81mq3ocZC33qoQulPB38GB8mjHyWtfZCyLIJ6D4cPVQOdjc+t2fnNjKcXxvJR14mQITHMn+cmnCnv6pjbUDE1XfMWA5cYEtRdu1R8NHTXJFq+dC0xo60w1WjtqjOkh9S0XnScyuBVrvpHDXq6PQ/Y2jXh5H5JzVveCQxMbx+bRiCkQR6oZWn17nZKzBZejhdq028ERmYmipfv9f6AJVWhQWFJZrOLiGBTCVcHN9qGV1xKmhmkDb060j489iERLvtlIw8TmgVvKaJEWLODDvstp8YvRKYO2TLvqXwogGYdJ0SRvUdHU/CMtXLAEn3Eg1V8q3AMAneVpZNkpiUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7vJILFV9GlIpXIb8koI/9C1KlWkQNY8llwvZTgt+B1A=;
 b=cgmsUtYG1k2eUjHxdYgP+XckucM4m8zMQNCtXXAIs5Ax7PtjZLF77C8PMfwSzE2jB/nzreS/kInbq1gxl3bGZeJ85Q6VmwLyIEZ3PqKVVLGw5780gSr9zmMcH5mzxNv/T6sp3TsaDLmZ4ivmPEFlT0QS/aHAL1DVzYuqZRMfrkM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by OSOPR01MB12442.jpnprd01.prod.outlook.com (2603:1096:604:2d8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Thu, 12 Nov
 2026 06:08:20 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%6]) with mapi id 15.21.0615.008; Thu, 12 Nov 2026
 06:08:20 +0000
Message-ID: <87bj7uzing.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH 0/3] ASoC: use snd_soc_register_component()
In-Reply-To: <87h5hmzizi.wl-kuninori.morimoto.gx@renesas.com>
References: <87h5hmzizi.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 12 Nov 2026 06:08:20 +0000
X-ClientProxiedBy: OSTP286CA0086.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:227::10) To TYYPR01MB15175.jpnprd01.prod.outlook.com
 (2603:1096:405:27d::8)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB15175:EE_|OSOPR01MB12442:EE_
X-MS-Office365-Filtering-Correlation-Id: c9665b2d-c3a2-49e6-89dc-08df408359f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|52116014|366016|1800799024|11063799006|261028144727099003|38350700014|10067099003|56012099006|261021123027099003|261021121427099003|261026140227099003|261022105027099003|261102123227099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	OzGrp2IzofrzfXQPVQ0HJemf2srs+td4k+2h3GZ+KzWQ1tROld52+WQ17yQby4jTFryzsAftd+x2ZWrr4iNjNUue8MbBEE3tSYJ1+PyAiXb0OSx65NSJBBes3onkfYXFzUd8GPuzfM2UwmqoEpdUN7Q0CyKSoCYH9hqfAn70WoR797Tne8QuNOutbdJEgIeHvoDZLiMdEgrLIHaIKpqeuKD0zi5P92D+p5loRO8Pi63AfpV6Sp0obkKImgyQ1kdq/O9FGABF3aumlrI3ndPtka0Ujt8YXbAmm3OjMCmWrfY4SHibWnYh1PhigxCqbBAdrGs7A2NOIk+x5O3zJrvxNncJ5X/T75v5nGgGN223yxQo7+XGhC14x8aPm9WzP0wNsGkKhqDRfi7quHGbE3aUd325gYHfqOqcB4mKsZXpXzW7sI+D3b26BHJtAfMGnzYnngEi58gF6VJAsGtVSxolon0gODo/yCumQ9KTveZzlc4+jIfNNuzO3fSK7wU8mZ0uOrAzKL2GQ9GqhMsTmQfV/7WYN4MNj1rr4jRzmS7Zkn2NEMYZX7Z6UJyaSyB8cfEYjQGey8IUWfwZxLx9MxBk7wg3y7vgJSOFELnzDrtXf1BHKGHkBqc3qSSCu07ARjaO/mVghdPB3ar8niW56k09N5xWiZJ2Gv1S01SotsEQ5yIVoGd0W7NM7SoqPwpVpLmcyXSMSS5Wb5TZA9I7qqFas+BZcjyJsRs0mof1rlPug7Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(52116014)(366016)(1800799024)(11063799006)(261028144727099003)(38350700014)(10067099003)(56012099006)(261021123027099003)(261021121427099003)(261026140227099003)(261022105027099003)(261102123227099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ea55uxuw40AL7n3szRMq+S3wTiwjSFH5QQBCtMyIKNoKQ1xHn59Q0hOICQEH?=
 =?us-ascii?Q?FP2ZDVxDV5gJw/njVvCgEivo1CBxr9y0r1rPTJJEVHG0Y387JMvQcOZI12GK?=
 =?us-ascii?Q?1FEcYdj96Tt9dwT2VVK3rDYYvN1OAhbYHIKLdEOAYTsfHVu2lRYXyxK+g+EI?=
 =?us-ascii?Q?4wGA3aj0P3stelYTHYRtB3H1cAz4M+o2fZz2wKuLlVia4CsSF3heb9i5zZx0?=
 =?us-ascii?Q?CKb91vJMUKz/zUYXPpfDOp3hK3PHQX/cEJvo36VYLaG5lLe9PSdeLWNPi00W?=
 =?us-ascii?Q?iATpjw4f70hXYea6W+RcKGPbjO/6+5aIMzwg3BiP3SSgtPQiyUHcLbqRgx2p?=
 =?us-ascii?Q?90eXUCZNdaRjpc1swo7Eod590zEwLG/wFeBejDF+WzvcsmnHoHRSbpgK5c8R?=
 =?us-ascii?Q?ESglRBFOdQJGZbOLbHFuhmkBR0C/phrBRi0kiyk563V5U8BF5mwh3m9WXWdJ?=
 =?us-ascii?Q?GEpRCm7T/ceyUNV+hKUqRCxuS+1Kd34FFCYW3/Szbenn8fyEAzTXGohXvnUq?=
 =?us-ascii?Q?Eghcuh9osb+lC+iz20doXpEwm5p7l3X4J5HXeXxzmv7zgZkl1pxLE3+Z468/?=
 =?us-ascii?Q?dQl/r1rv7m3nfMzQiOuPt2GZEBVjCGh7WFg8qJ/NFAStjT26naNIgAS2LNrZ?=
 =?us-ascii?Q?ifSSKBVdVAICqAE6mFxbwIpH+Mgm/hhuRE3EN3ZGDgbX1pR2I4c4mL/KE5K9?=
 =?us-ascii?Q?ctWfrP+IAtXbWXNrtUcsub9NDKw2ko7bTQzxnIzvcmwRmfFcUm99cIpdloyH?=
 =?us-ascii?Q?ODutjUc8LijHN1heU3oe3iucwMnKD5/00NFcZPl+WcpXNpZVa1h3f8cMyCZX?=
 =?us-ascii?Q?Oo6w7FR93seGTPPUIu3LpFnWRwNIumAWsjoKeNXAxQlNZW/5YhsSZdHQpmsC?=
 =?us-ascii?Q?gScMS+U8ASUyyVSZnTxD4l6uvuZIFdO+pMjQ9URF/TuY+bP8pj6yuOl6rBqa?=
 =?us-ascii?Q?huHpfrNnbew3ulMUgNfUJ47EmBYldvIxzcr/gXPT86AYtaeuw/vB29K0aYOc?=
 =?us-ascii?Q?OdhfOO92y3+P7d63I8tBC36qK/h3jHXB16cZMwlKEtJAdhclO+cKYR8Hai/z?=
 =?us-ascii?Q?q5oE44BSB5Ir7ghos1jX+O5DIPO99ff4G1apvzKED+2YZPBjwKSodE7XJ5aB?=
 =?us-ascii?Q?7GDIF5nQCrQnw2DOI7g3+ytSG80t8l0LsS+cU5yAqp8u8p0pQNyVxB99pEna?=
 =?us-ascii?Q?Zz5LfcloZshulLOT0DfI/d2KrlVRdJm8jXt1r0ahNoMkBUYkCc/UkJY0II6J?=
 =?us-ascii?Q?PzRlxOm1KxAdFfuhok+WDl/rahiByVeI54KseigJY/yAMERbrYoJ+mUaMMxt?=
 =?us-ascii?Q?iYsmiEh4O+0c9QheOtGUmRrSmC474eG+SzE2/SQHuvBz0mODBTg7RT4IERY4?=
 =?us-ascii?Q?mlv779HcAF168tRAqfhYRiEGg1JZU40xwHKZ0w9NiXDBxmNntdFwm8UzMm5S?=
 =?us-ascii?Q?oo8MYRW2QtHcAp+UPxXLpnhTOmpj6ipNd3bgLQ2dIrnwagAF4K2Fjx8Zo1O0?=
 =?us-ascii?Q?ot76xHhgu9zYva2AGxG5COsHX01W9BU7wRCj7VIyYl1edba1+75GjATvF1aG?=
 =?us-ascii?Q?/hpHUXr9DmiJa5YJppwEIKcrZtHwRx/HD9bMh9qHZlAY2vcrsNz8XYfMWiE6?=
 =?us-ascii?Q?+0UYsj1KPkSUSsiYrf0QL7q7scpXO4Jw/Jhu1/MQnRXmREewu16L5nfaQAB4?=
 =?us-ascii?Q?MLq2pX/cTkopuGa4P2CJwETyuOtBrxDQXtEpz4LzaOgCtc25ibRg0yNunfz4?=
 =?us-ascii?Q?fsZf6ClIf9BnrG+ibgk89gmYMMv3YOB6HU2LhbKcg9K413Bth2D2?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9665b2d-c3a2-49e6-89dc-08df408359f4
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 06:08:20.5070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LhY/fVws6SWg3qG3p8gxrH2NHtHNmzshTqsDaS3Sx16XluhGmaJc8K90r5aM74/ZM2qRM1LPCV3WRRUEJhsEy3vg9l+cxtQuGjIBtjdN1nOmFTCl2efpq/AFvqkvf5Fl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSOPR01MB12442


Hi Mark, again

> I now posting v2 of "ASoC: add new Component functions"   [1]
> and Sashiko reviewed it [2] and pointed that some driver is using
> devm_ version register(), but is calling unregister() which can be
> issue.

I didn't explain my understanding. In my understanding, Sashiko indicates
that multiple list_del() will be issue, and it is correct. But main problem
is not unregister() function itself which can't handle multiple call, but
multiple unregsiter () caller side. list_del() works as multi unregister()
finder.
So, this patch-set fixup caller side.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
