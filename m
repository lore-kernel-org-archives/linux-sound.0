Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.0
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795129828;
	b=l6iVzN0SluF5CU51k0e76NSuWPk7VrxSBDLqj2tSQ5koyRF+CH7r9nbDpQQJbLSJc0Zh
	 4Wd5tQbiGciruY4GnSdBLiKXfIVJB9cI08Jp8HVuQF8X5hUB2maMSlJKBRxmrWXAkomMu
	 6HCtY+2UGItaZKKMKJB0gcd8WGOu5yG0RG4w18dGaN9bK0msU07OUwdkkjK1FChuGoJ8M
	 syz+Y/a4nGDoNQCCfj43rb47gT1k7r41qVOtd2qvGpByV78gP6Ryq8os2uj7Ay24uHyzw
	 tmwfVJ78js4EjQh0rCCqrbNfNE2D3ivWS4XNbAnoPAJc6DPiLaByAxQg4kqbyEgyBoA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795129828;
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
	bh=9eUJwFWDTvMy1WO2D9aL5rF/X56YGk+8BpOadSzjWwE=;
	b=p0hrtDbt2OiAa+Wgnq3HNGFwg6V5zJkvd7rXSeV0hjeehvPBuXv2dxdhBA1UyGk9YSSn
	 KedaoS9YDf6FlQ3yPAihVkZ98pVNdlhUKb83KTFsojmjyqXsy1epS5NqBzW3IgbbLnJCx
	 RCMO/30cw9L/wqbQ0YoKHJDwSJxJhHma6g9DAZ9E6bOYRHSrJeBGxYaRTrlSFzOb2ItS3
	 y5mN+9/Yf/IVa63GIaQCyMCK2qM3tDGvnCEyvqzGgOglfy9UrYhj35z7fEgjqeF2e77R5
	 Vo8/TYY5OO4Q0EA+Eg9L8iHWdrOsLdh7AnQusBtffsLlts4qd5M/giBQZgqbWsbBpWA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=LfqsH8vB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.0
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011000.outbound.protection.outlook.com [52.101.125.0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9EC606A325;
	Thu, 19 Nov 2026 23:10:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA9EC606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=LfqsH8vB
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rsJt2vB7OXSyoPsot6e/Gaf8yCLXo5XK4ak+aw6+kCunz6yFMw3zkt8e1aD16yYu+6jXEE2qVlXKElQUQXLWF0jtuWp1Q2f+BrclNt8pn866buU3+f0REgbNwogN4N8wLwyR4alR8tqA7M9+CnkuMpAEmL8dOmpD39dtjhLYFVQPiHg9oMGnfVRZBwHbitkPVqIgNcStErhLYD2h+dLml7x/HVQf4MstVyci98pRsVTFlY3GEA/pgusF48OOuPMo8okPHXRwYyE7iu09nK1pHUTo2kjy3xG3l/aYXAp23kysadbq7vRXBX9F9JZeRbMBEIzktDRW6DEFaHVcPtAYww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9eUJwFWDTvMy1WO2D9aL5rF/X56YGk+8BpOadSzjWwE=;
 b=qH4pUxZsggsTHZIISO6e6UBqgcd+VfyietlqQRRa7ri0UFfk9LyqNpNbb61Hcbr1EMGFimZrc4JLPSGG7kWAuzCeFlqIL7iVKBSs9J9k8KIEpo1NzMo0CDwUz0u1oJ6d194ScHm2HathMSpA2pL/uWgWAFjNqmE9D+6g7UvFO6BvRGtvQVdsasdcbmr4UMtupnfoaivSVQ03tiPvnPzgluGGxMyzqPth41UGsXSxG0MgzF2EjIJVcO5bWax53LG62hSW6DVhjpn7qgv9JKEuv7CeYalQ1imwnkUn6erUSRJ9WLaAL0CqqRrLpUAX6vpXpAyxzt3oKm+Vp99UjOFu+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9eUJwFWDTvMy1WO2D9aL5rF/X56YGk+8BpOadSzjWwE=;
 b=LfqsH8vBjd7WEPG9rG62Bi4LTYod2O2daPGbv9/YUZEir2FLHrpg5wPXOVbctMxOPvfxhcaKBElu/WyeRqypc58IAp/37TwsFLZQKAOUUR3jL9TgpZyUFbl7I7mI1MH7ki/miXYH2RWEc9wgtC+JMe/hbhkvnLXk96nKnhyXyOU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 (2603:1096:604:4ba::14) by TYVPR01MB11098.jpnprd01.prod.outlook.com
 (2603:1096:400:36d::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Thu, 19 Nov
 2026 23:10:20 +0000
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180]) by OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180%3]) with mapi id 15.21.0639.011; Thu, 19 Nov 2026
 23:10:20 +0000
Message-ID: <87ld6oifj8.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Zhu Jun <zhujun2@cmss.chinamobile.com>
Cc: broonie@kernel.org,
	lgirdwood@gmail.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: audio-graph-card2: Release multi-link ports references
In-Reply-To: <20261119075815.50155-1-zhujun2@cmss.chinamobile.com>
References: <20261119075815.50155-1-zhujun2@cmss.chinamobile.com>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 19 Nov 2026 23:10:19 +0000
X-ClientProxiedBy: TYCP286CA0087.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::18) To OSOPR01MB749128.jpnprd01.prod.outlook.com
 (2603:1096:604:4ba::14)
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
X-MS-TrafficTypeDiagnostic: OSOPR01MB749128:EE_|TYVPR01MB11098:EE_
X-MS-Office365-Filtering-Correlation-Id: f0a6a537-2746-4360-7d9e-08df46924820
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|23010399003|1800799024|18002099003|22082099003|11063799006|56012099006|10067099003|261026140227099003|261028144727099003|261022105027099003|261009223027099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	pcxeMluPuE7wlx/JKdKMzsLRIO2QH3SJhJ7xXXbck7wvn7dlFJNFmuJamoHRhTGWlJSEu9nuqrNL7SrVJ0oCsA4U0Lf+brEFlMLR44xNe30M5tto9HAT7ogyMANSCiKNPIrjej2Cbbx1QkmxgoxMKjduYr48te429VzW44sdbYoL5kc6NWA9+NaB64kaxNPtddr9A9UzkDWir0r6Mcc/tOCeWa5DpTAzdPgVmrwtPKfnL5BKMjWkCxISmWX+27R31CqbmZmK3yAzA//qqfbBpSTXeQX9tQNc1sDfj7S0fr8s11NIpJ7wiEiy8hK78wVicElLekQ6ZBVH2CzZceQJ/+8uwZkbVOuuRSd44d8TglZ3zFYrtykAD7R3BgseYO5JO7qr+oSO1hnHkIJKpyF/8UDJeZ6nGLSi72Qn4ntjHS3hDLq7lGv4g3g8IAbNB8sKJbI1l0SokLtWJftxMw4Tp5KwCSmGLacDUB+2WD+A5eS7tp8G5waLJAlrR0UTca/WBwVXbACa7kzkXqw029rW+ReCBBJq0C+p8gM8bnvFFc+UPWEVlX5TcT7m6H70RtY+H6on7Su/oiF1sHRVQrT/nPtgOBpIEQT1qXZl5e/cZOOPsTnjEANu+/x8sEy1gi5YXZSqxDunEHZrAb9Q/9RUxseCM+Di0hpsyX8OH9ofJNQX0cPBb+Ww/XJkfMAWf6czcA7KwbBfhwmtpruTw21WMA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSOPR01MB749128.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(23010399003)(1800799024)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003)(261026140227099003)(261028144727099003)(261022105027099003)(261009223027099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qg3/NTYsIeWBaoyx/zGXGuUvJBMhldJIA5WlvJKS64ilCYNQiC7Wpjzz54bS?=
 =?us-ascii?Q?Jed5l99dpBX6QPG6xfNzb3VNrAK20FgejWFVic9bKw/hsrBcOQtYlblXXZ2m?=
 =?us-ascii?Q?97+bEFF7Jf03yl4imJmxUc5WQObJnVp0IFcDmwM1ZfpKtMYQYtztdDpgMlyy?=
 =?us-ascii?Q?dXv+wAA8FY7vptctSGb75kayd9WKtg/XuwV2pRBFr1jf5a8PIWELOhbU+1E8?=
 =?us-ascii?Q?eArtuClP7+db9GtI+Bv4oAxl2OdgpmYNmp4N00y6hA86BlKjwZZWxV1Hh3Pp?=
 =?us-ascii?Q?LS1GI74MkJS1d+etUsLuPXNHmnxzJ0Uzr+80gef2a3KZ6iwzouGyku9qJpB7?=
 =?us-ascii?Q?VgajqR0pnWdrmHP387giOtLNOgYoRwiyUHgumai9iX5OshPGom43doEjVQm+?=
 =?us-ascii?Q?++ZDPtC6+xHUZUdaBLUlIosq26cjr3cqk46ouOY3aljhorxn0GRAWtspyygA?=
 =?us-ascii?Q?1iN2xOwLf3z7u4WBCVCJo0XOHJu1r3tixDmVcTFLuvqMU3XdWGYa8xOs6ST0?=
 =?us-ascii?Q?sZ2fe3nztuN0rlpS2hcpMBZbrgWeLBS0pTuuQof1dB6uOxTn7rBiQNkAKEnt?=
 =?us-ascii?Q?60zlnMLdev1JQeViEilToxj5TpDJ1jgYTHLV4Ha4CVtPxFcq80DGiaXcRK2G?=
 =?us-ascii?Q?z21eZ1OK3kcOGFGNnxaLwggcwDfkLmtXQVxV8BNEA1Z14KOUZRC1SDvvtjlO?=
 =?us-ascii?Q?kENlnW8ZpNaFs7cMLy84wrmIEOCf+F6yZRkedzw5Dps2pmmzhQMkdMKAiiZ/?=
 =?us-ascii?Q?ZFNVF7x/T23AStAHUlQaOSCisCe1ZvxrWDTz2w++Fuk3iklYPs4jIi+wWloN?=
 =?us-ascii?Q?R0GymP/t/MhVo3H8C7gzQpK/s4/RB4r9zw2rTnh2IPMQ/kQfZ3rE21fi3AjW?=
 =?us-ascii?Q?OIKzcUjUXNnIqr2WfPAE1nxGqEi8dB2fSjl5XCGDMpatFwF5ClhMDGgMBbuV?=
 =?us-ascii?Q?c7nQU/XjcUj/YlsUnKYDNWR+yuPyzE1DgMe8pU23nzjckKQKAVL8U4skc/VX?=
 =?us-ascii?Q?TP+aV1uhoPldMrmfL1UL4qmxP8aCDMgwxlY+Ya8BZBTQ/UncUHtj3BKb+2C/?=
 =?us-ascii?Q?UyRpBYOgyHmogffhd67UvqRHkFjj9ohlLi/j6ZYVI/6FGr2i8YW5yS+RX3be?=
 =?us-ascii?Q?m5jGaHsewjs1RubC3s3MzIXR1g3SzWQ+R9rRFowU0O+x2zk1j5RqBuUL2ftp?=
 =?us-ascii?Q?tLbjysbylE6SJEXs0QoLrxBLz5nUFa6rGCZUNNWefEQSEbUGZ5GFar4lCpT5?=
 =?us-ascii?Q?6OyCiaYO2tnxdPMhsX+uqvBGn//C2YQ3OceW45dsBj5O4g/tWfMD4qgFc7Cz?=
 =?us-ascii?Q?fdLaS/WFHWffQ+WKLBamkiwhM6kjytNOhJ5Bq0vBqHzMSsugumGgH9fuJiZk?=
 =?us-ascii?Q?0Gm2le+dvQb5lA27J6eP7Md61ERJd5SaklgzRu6wm1Ly0NXOlauu+Xn0uvpH?=
 =?us-ascii?Q?dtO8TePy9IzyqIX5Bfo/eTPG3upe430TUp/qNzE31XVnSIJtCl0bfy5tBySN?=
 =?us-ascii?Q?3p0x9IJo+g59RhM6b9Xy9ttq0hs9cuQSM8+i30C84Ge04LsBQReIcCWIlDno?=
 =?us-ascii?Q?1+HmTZddb0vUK1fA2V1/vur0hzAmoboEfR0xtca8vymPoInrXcYyq/T+vZQw?=
 =?us-ascii?Q?XkoGocNx72KL+b9SMG2tZS9nVOYzziOhI8colNqpKLu+8pOuI1s3Z1TJHcDx?=
 =?us-ascii?Q?aQlAjk0RnuKbPs/uBEq3ACpbL5ROiG+pFKWEBIBNL79ngpF1DibLrQ24knjU?=
 =?us-ascii?Q?GbtLGaxzKKYRvI9ItoaVnPTTz9IlEH8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0a6a537-2746-4360-7d9e-08df46924820
X-MS-Exchange-CrossTenant-AuthSource: OSOPR01MB749128.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 23:10:20.0427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vc0xPq+KqHWk0pnwreLFgxi9rHHqoiwAQ5XgQ6pW6gcnRoA8nTtBle4xB9f/Q9T7rEBp7Vz5oF55e87pqG6YY0Z/xR6msmYDFGhmTgCUH3zcKWzW1TW30ORkSiD8UMsU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB11098


Hi

> port_to_ports() returns a referenced ports node. graph_counter() drops
> the pointer after counting the ports, while graph_parse_node_multi_nm()
> compares it with the expected codec ports node and discards it. The
> references remain held after card parsing, including across reprobes.
> 
> Use the existing device_node cleanup pattern at both call sites, so
> the temporary references are released when their scopes end.
> 
> Fixes: e2de6808df4a ("ASoC: audio-graph-card2: add CPU:Codec = N:M support")
> Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
> ---

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thank you for your help !!

Best regards
---
Kuninori Morimoto
