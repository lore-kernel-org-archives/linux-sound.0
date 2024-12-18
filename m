Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011028.outbound.protection.outlook.com [40.107.74.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0A1155741
	for <linux-sound@vger.kernel.org>; Wed, 18 Dec 2024 06:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734503397; cv=fail; b=hfkwJ5tK0K4K0FDVm3LW6hD/3iNZNW2wvEnam5AeIxusa6/y0YhQXtp5YoENVGzDXGPQRJCM7fJpgMw5ey6bioyL3AbAyybie8MBsk8xOoPfHgRqx2OLzma+MZcxSeuubMy84sFR/47xz0/W2JXbFDoULBimzcEK7lqoYkJimrw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734503397; c=relaxed/simple;
	bh=YAZCF1ZmUCQjgoBHIdV9gp9MfxBKJlxnEz2vHwbYylA=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=cDNaNxVAtpX3/CiBDTqR0Cgs3t7Kvk87+CYmBdhmYCE71QZ+3bX4WWwkjY490AoR2wsJ85lCes37tp5EN9Ldftzr/98ivlOqtOq+YmT/hGJGu6bqZiPVvSToPQhdKf3H+A9xR42Yqg3++akKzpj6mPoOqccQKn/jebHzEwJFPCo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=DwWVgSmI; arc=fail smtp.client-ip=40.107.74.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="DwWVgSmI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DZ8grmK8I1+CGcKxtNEIANIR65AXC6qTg/GlC1+0grwYB5UkbvAnfSpBGCWoddze0ROakmc6sPffihQhuDfylk5UGf9gRHuKrL6MN/rGDQjmmoyynKSF4ImFaTFryyzuPKR2X3IDuvLdRyYTNyDIpbMB/7ERC/yCEyTgPPb9uAbiZa5Yv96fadBHP/ddytZ6LG/OBX3pDNv2wpalaFJKoG7mWwTFbe4YKfJoj33vE1fs19jO9UxoK7TG/5AAqctSYCVGeBFNBCmA/ED9KZ5vL3HyDC9eVUI9iHbaCBisWVIjyx3ePEN0nRVHVHOg50qIvByYSRIZQsxPF/nwebPdrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gcNZmQ7hA7JI89LMLJN2hz3qwnJ6V8JsKypBdRghxIo=;
 b=BHu0+7V2zzKs3o+m2jyUy1kLocxS9132dymKlO023W+M4Esp3uo9aBwQ135OXim+spsxJ8mzPxIK7BYLjHLHbiKaVL7JR/zGd9uh1t9dQpTMnSMpdtqj47l5/RSLdCslJ/ILIRWBDgrrhh79r2EXd99DK6FMOcyXhSTBbpYEwKMrOyO5E7d1n4g95xtmtIReH/q5ml7H0xCCqAfWBKphMXOzzy1Exkpg2/yOP/zIgPLQ80FrUIWmuXOY3Z0mC0vl63gjlLB9Y+d3WpcUMKNzB0tJCEG9xVDqxr2Ih3bReiEAaoEI0Sk+3FAyGQPQEWZeVx/Eh+3Cq00QP0XjxN7FFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gcNZmQ7hA7JI89LMLJN2hz3qwnJ6V8JsKypBdRghxIo=;
 b=DwWVgSmIESWtPjXCIhgiU8a2Jx2/PiN/CI8WVd30jvT9u56swnspQBxfqWMbjAHvI+UnmSCI9cWTEL3Q1MN+2Z5dZwnENe61BkT1yeTJxlY7faGWJwOyZWVuuZAgHeSh4Q7Cwro59g0AFIor+1e2P/3d0qiCoXusxl+KsaF26cw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB10186.jpnprd01.prod.outlook.com
 (2603:1096:604:1e3::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Wed, 18 Dec
 2024 06:29:51 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8272.005; Wed, 18 Dec 2024
 06:29:51 +0000
Message-ID: <87zfktpkpt.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Stephen Gordon <gordoste@iinet.net.au>
Cc: Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 6/6] ASoC: audio-graph-card2: Use extra format on each DAI
In-Reply-To: <20241218000652.197e8b7a@rpi5>
References: <8734innkpy.wl-kuninori.morimoto.gx@renesas.com>
	<87v7vjm639.wl-kuninori.morimoto.gx@renesas.com>
	<20241218000652.197e8b7a@rpi5>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 18 Dec 2024 06:29:51 +0000
X-ClientProxiedBy: TY2PR02CA0018.apcprd02.prod.outlook.com
 (2603:1096:404:56::30) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB10186:EE_
X-MS-Office365-Filtering-Correlation-Id: 633b12cd-56ce-44bd-b204-08dd1f2d60ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pODQes68G0wckoqD+7PbJa2igyIpF59Tqa2pC6N5cIYUrrHctqXpMpKyhuwB?=
 =?us-ascii?Q?BghCUZ0YMseguAlxhm+GLBX3bU6m6jY5w8XCeb+bhl8KfI/ADPsajRmOSNcv?=
 =?us-ascii?Q?BeTtazaXuUlEZ5ItwVh1aTu2h2D50ex3yN8pUdDdnAso8IZQ7PHduOCusW3L?=
 =?us-ascii?Q?1l4ExW9HtwwIFxXMLu/HceY96M2q54e3S4ztlBdBc9509QU77/zlOTcof9cu?=
 =?us-ascii?Q?s3/sfjRQXETc60MTIEUz8/e1QtjbVoEInPUD2CnVkZVIBcoqkzS144nh761Y?=
 =?us-ascii?Q?eMDQ+c1aJLN0xCUuhW+V3GeYGHMffKSj/CA0eYxeoZx4kIZjbRynqyDjhaFl?=
 =?us-ascii?Q?7GCcbbbuo6ebor7UHlKtkejZ4Z273sE6asHFupL7vRjSY45e7FCgRLt+Nqmc?=
 =?us-ascii?Q?0pcO/aaMw3CurtyHwyFBz3UvbVp7LvA1j2Z2QipUQMGb4Tw2MlrZiuo804fD?=
 =?us-ascii?Q?F7VLniBTGqVvrmI+j+05Osqbc+vVkOiAQPqM7GFDDdan5HnfEWN25CldpF3q?=
 =?us-ascii?Q?c9wPBd9XRk2CMzwSCufJtQ4v9Huji4035hHMSAbdqjh2unOGhtewiWFyzaCm?=
 =?us-ascii?Q?tOQ0X8V+mTKJDfws1QiOnJlbHYRApGfJh6q0ST8g+cSqspoMKC1+YNi74D4s?=
 =?us-ascii?Q?ByRojeNLY45tJ8UfUpfwnVfx+8KoejBbZZCdkgg9Grl/B7cPjEnzzc9mLUqc?=
 =?us-ascii?Q?sZX9u9ydDWIZ1NihUpiUk8D8+rhytZ4mUCF5bjjR/S8iFxoxRqKXJ/3SqdFr?=
 =?us-ascii?Q?E6RXazeEk/LdABScMd4ahEiwm6kxakrSPDMgpo+550h0SBiaFMxF1Chj4atD?=
 =?us-ascii?Q?vQ0kvuKDgTu5AIj2D6/wEBcZMEcqJqPARq9/Is1vMFoM4uPjyjxjkO5Ak2Fn?=
 =?us-ascii?Q?ChaJHpDm3KMp/VLYAAJg1OGoiw1AEaZEJcXIM9cp3Bg3IdCIAIvQ4PPCgX1i?=
 =?us-ascii?Q?N0XSNgXeFJSTDwBTjuVRW8GdAn/yUrIHG7wqE9HmqbKx/mL4UlW3w6BJMhTK?=
 =?us-ascii?Q?ii0qOkOeaQv2OjuIMHDl9Nxfgi3kDzDBxZ5JRPFB4+xnUQCsVGVftt5q6M7p?=
 =?us-ascii?Q?w8BRcjCMAeE2vl4HiDevr6vAWiD+C1YUFlW+40b79QqwWnVkd2WFVyTSMS95?=
 =?us-ascii?Q?Uru6ycL20j07gOKGqLrxfqk8EtCFy/pAg9SUwGJHSHriyxCe2RE9WhDr2soE?=
 =?us-ascii?Q?bg9luPTKmZ9A2Fwp/w6mIBoNYQmFlHhxU6Z5SmirOyHfvLPpMV/xmDI/56rw?=
 =?us-ascii?Q?RJ+nePJgNkN5fNzP+DyW0IV4d8YdyR7Vg/h/f+8/V7pUIMJaew9hGS0ZBfsZ?=
 =?us-ascii?Q?nt0eIM7ti4EsoYwOMvP2s0BxmDJWApSQxkG0fJD2ArxvBcblBH3DJ5e0DvJH?=
 =?us-ascii?Q?o+McFww0PKzgHK01xwZzQjyHU/H3qBRZBtIbmmufDe714zTnlhMuO0FdsIki?=
 =?us-ascii?Q?G+iLEneaAAHvIfqDIwSdqzvPW9SHbeP2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HelotBdKdEeT5b3getDusDJBxQ/MnfT5xZgd1Oh6P2ZUm1OV4bvHLjy/JFCo?=
 =?us-ascii?Q?EIUH7YRoyikOSkIm2u3Wo+HxnaIVUscU+aQrG+oTu4SloG9xaCgfPMvFwvnP?=
 =?us-ascii?Q?ta2k192AhnTtBxV3dXEgbYvUzUVdSB/PXOhdzMUfK67TFWJK6eMXTEUpdsj3?=
 =?us-ascii?Q?PkT4QZd84pt0AWCZqMU6wBvd6O5nH3IkNsTp7eI/1vrmXVCmVARIp9GdaGjW?=
 =?us-ascii?Q?SzmNzBFmJY++VtxPMO+7FnpIxRBn036zoZ5WZga3RxbtwGc8JwDPAfX8Uxvt?=
 =?us-ascii?Q?k58Vdlc7GATMmCbavujRBkBuWGcCnZsZlSB2wYi3kU9BkD0BICvoCQVP+8co?=
 =?us-ascii?Q?IXWqQvmK55dbZ1/Bpoinnexh8IrmTZrbQMsLz5QqMdaWqWpaWFyVtJgr0eeY?=
 =?us-ascii?Q?C3UlPvJL7e7Y9TugmUmTkqZfXlnBT2bUeYozY7GsZ2mWug/V4L2FZagobs3/?=
 =?us-ascii?Q?wulAn9Nip2B57ASF5BHPRBUWURc8Smj0M+LD07MhY5DSk4zzwvddx6gdCSy0?=
 =?us-ascii?Q?nhs+0Ipct73KRLMnHBip+GNLqxb4IvtvB6uqc0I6dd1irmyrY4KZiO+O5644?=
 =?us-ascii?Q?g+1v5RJflD1ux8MTWDXzvPyBupLhi0KFS59r6h/c7W14YYyD1DNGdRlmawcY?=
 =?us-ascii?Q?DY1HoKgrqY/qF2VLxh8IHPDhVbQyb/uI/UqwkmPXZkw0U+lzyewK0xYcK5ce?=
 =?us-ascii?Q?CIETQgY9eZYIOH+QR5N7txSSmaipR4EbCCf6MNRrYGO2zBm7ye5EwNOqfT2e?=
 =?us-ascii?Q?ANkSepnORfT9AtsNJi/DyRAam9m+j8JgHa2OV+YhnqU6FSCFrBQgYZeZej2k?=
 =?us-ascii?Q?ahDRkXnm7/2XEffy1J3+FNDjVkAcOhUBJBrpmgiBvmvNgo2Gd02241LP/+ew?=
 =?us-ascii?Q?TOd/nulGOR4d2I7ysCCm5mfBVGK9vc5/uMoZp5FUtVvN+IKoZOwhI3yRB+Xh?=
 =?us-ascii?Q?YNDxGF9iIOHQ8ZZ0t5jDQVkVo4BarprTwIh5Hxp67vbW2Z/UwXxqFiILGWeW?=
 =?us-ascii?Q?niBxfQmC959FjsSBxWwG1000ZIYvOvo9+TzmzFxSxinPQN1M9J7Vk5cpMR2J?=
 =?us-ascii?Q?TFuh5ofa776HbKbt+5dPMoBjFtShr3OxoTZkwC2Yb2cK1TmEcLOF/ym8A9KO?=
 =?us-ascii?Q?TcHDnIlNhE4gJB9fM0AqOOpyawGY+iIGcezedf+jtBybhm3GzQYAKu16wsI3?=
 =?us-ascii?Q?1RXRD8Zi41WJ+b25FUywZa+GbyYvs1A06b+PHWUvPOyJ/gQGcYEZdDVg6Dcp?=
 =?us-ascii?Q?DzCQfIoVY9M9TlNAr7HmqFyWm1YPhufzTAwKPrsRSNRAu5H71ItrB4zY6uN4?=
 =?us-ascii?Q?Z9Zhz8L9YvnHQJP3ryTYHVPodYAj9dUUYvR37s+7OEwURHf8PIKCGiuy5OdH?=
 =?us-ascii?Q?wB7fGfSv54KKDqxUgdXBStb+4BN9Zh8gtx0CUgRJjzedAqjRSN3OhliLpMf4?=
 =?us-ascii?Q?crvvCuFPD8j8FoSykTzNmsmdh3QKAynHIyv8q4Fb6F7K65VDHvXmztTW1ih9?=
 =?us-ascii?Q?rVLtD5ERW1FxjPt11p2fIZ0moL0J+HM5bLKnT34BsuP/nye9zWuWzvO/vh7c?=
 =?us-ascii?Q?oTqxA6epIP0C+/2u8XL7VWh4y3NcotdWRuyBQmOsrSwbnt32icEc1Ff64Y5P?=
 =?us-ascii?Q?N3lvttEFU8eAfI920HNr1wA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 633b12cd-56ce-44bd-b204-08dd1f2d60ee
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 06:29:51.7846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7J5XCbzS/n5n4ymK9kKl43NzLQ2QuL0xQu8JjWPZwZoIUxT/En0djtSPdjxy42zpEtwJaQS9fA4oZF79157/cLmHTYX7huB+yXXzuDXjvqEKbnAFK+JfhQUT7hA3aPE5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10186


Hi Stephen, Mark

> This patch (#6 of the set) was generated against a tree which didn't
> have the port_cpu -> port_codec correction applied
> (687630aa582acf674120c87350beb01d836c837c) and it fails when applied
> against HEAD of
> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/

Ah, it seems above patch is...

	asoc/for-6.13 :     included
	asoc/for-6.14 : not included

Mark, is it possible to merge for-6.13 into for-6.14 ?
It can ignore conflict issue. I can post v2 patch-set on top of it.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
