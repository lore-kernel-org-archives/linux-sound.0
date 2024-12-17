Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011023.outbound.protection.outlook.com [40.107.74.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860B743AB9
	for <linux-sound@vger.kernel.org>; Tue, 17 Dec 2024 01:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734400128; cv=fail; b=n/BAAguV5sFP9Y9pWuqQ7m3kmXZCAj5e68gcPq08Q1dS8bAAy+WkxyNm+ivuXk2gj2iGan87zc7DmFPLFU0km4ClrKMW+gtuQ7Oe3mJVvP1/f4+PgA/zK1vDIitciYbtir99vHz7ZQNmM/OCacBs49LdAfdwgVpcQ2Ht3wL8Tn0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734400128; c=relaxed/simple;
	bh=RWRXr/aUyMR2s3+17Copbv5x3j/ZbDjR7g4ASZF5u68=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=N1V1wnDLB4bNgNJo5SP2B81KkqYTr619hyLoaNiT8Mh8/wbqFdSrtr4TV5uXmoOq5ai/XdlMsHithMQQ8a/EJhpiIjU2fD7vZ2Yxd0jP8C+SUwmG4kr2NKz4lOye52RUvP3yGkHGZ1oE63xbC5Lu+Sr19vCg119zcctjWZGxO9U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=DRGymu7e; arc=fail smtp.client-ip=40.107.74.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="DRGymu7e"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wN9Tk4TO2WxHkSpnqsded8sh1PsBf8IZ7ymWICPTVuKSnpXNkJ26HMEmtZaDODf5vAVgo023kFBvo9IVQ8f4lxlQi38BSq6yYCeAtULrCwqyTErkLKJPw4FLa1nPBh2OnIkBHv4bmD9JPJKZEU+ukRk31SE7WdncZbPzMPiMLLmYSmBxw/D5C8JMs8qaCt2mqt0DrxsSUaLPDA2+HEtgPy6flFudd9SIE+b2ipos88RJS3VkvXwAVLNQ5ePb2dlzvdDdFi4ndvqkAAPDJkoS9RcAW3QaAEhu24qU1CVmqNvF7lE4DbsuriY+iGpPBBnH0pH1QGwclgjbcesK5ex80g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1WYTffNcMlytA6sJF7KR9FwZRGyM3o+Ej9gK5Ukvb7w=;
 b=snOjITEUZ5SSQ4/efetjkiKYRi2eRFlwy6PCZvP4T1bG8gmIjtl2pyzp4KTeb3DXj48q13WvBK6GpUN28UiydGqCjD5MoGz1bzNUJ8M5zrktV6Q92hX+iNFqdpQSm6tZ0Ai8k2VMLM6yER21gUfXY4qXi8TWcTae5Eh13mYDhw9tW+38tBdZyjNNVwJVAMHS8clxmhcl5KrmILO7tQcvFeNBdbmur0BT6YMhI5AqcWXCUTx2lzMb6VCsQ6DckQDhHD5bk96sPee2TX+xIz3oBy0qahVhjNxYvC2H+qBxmJhYMoT4bTSK7hanywiEDu4SfUBTP3PdOqPuq024H+JqdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1WYTffNcMlytA6sJF7KR9FwZRGyM3o+Ej9gK5Ukvb7w=;
 b=DRGymu7eZDnGiQIUKLvuOHrCRUN0vSuDYKhPfBJzrMMfQZhJ09WNLsUNq1Her0qDorA0kRUAz/AR1qyd/EpIxGM/vc+wYkbr2cuHNFxWCNg9RG9WoSszRsGWFkzmP2wUJJvvpwoKwNBQv0VWQeaZBP3WUqsC4Hv6KVBRdW6vELY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB9279.jpnprd01.prod.outlook.com
 (2603:1096:400:1a2::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Tue, 17 Dec
 2024 01:48:44 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 01:48:44 +0000
Message-ID: <87wmfzm64j.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 4/6] ASoC: soc-core: return 0 if np was NULL on snd_soc_daifmt_parse_clock_provider_raw()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Stephen Gordon <gordoste@iinet.net.au>
In-Reply-To: <8734innkpy.wl-kuninori.morimoto.gx@renesas.com>
References: <8734innkpy.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 17 Dec 2024 01:48:44 +0000
X-ClientProxiedBy: TYCPR01CA0106.jpnprd01.prod.outlook.com
 (2603:1096:405:4::22) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB9279:EE_
X-MS-Office365-Filtering-Correlation-Id: 96a6ba63-8ec9-487b-7ad3-08dd1e3cf0dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wO6P8oVCp04amqhKhFsmSwUsbNV4uHPrDDV3bvRgFBnQHuWfDBZ9qufXnXe0?=
 =?us-ascii?Q?cZR+WNncsRFqEHuFor2nCQVwByrDs5yLEceznd/BoAKngOBro+pY3KWxa6Uc?=
 =?us-ascii?Q?1Lp2uIo0mObYyQJXkF64xMz5T/X1Y7XjZ57z5iiHz20kAVV56pdlPrACq95L?=
 =?us-ascii?Q?eRDAWznK2lp8sRTkHt6LkBRJKhrsCqKC1wy+pP35SwBwT1MKGn3cCTKc8Oag?=
 =?us-ascii?Q?7NNb1wTD1nKaKSTtOAw56Zemjnjpqb8J8W11Rz5Ou6UxHZlVzwJ1eazvtCmL?=
 =?us-ascii?Q?BJHtiDLE+fgW+/myWOATp7r2sNVJ0W7IutCSzd4IwHkx8peLjem5517kEU/X?=
 =?us-ascii?Q?Don3HycPtiI6UG31pe8QH0MVIhIoYFbi0fXRYnc6DgNJ37A0VznlzC3fd+Zd?=
 =?us-ascii?Q?ZDkzPVaQxAl5NfCGCmAustv5vFiznbxV7qijLFNM62IsKiGU8SV461OOKaaD?=
 =?us-ascii?Q?eLh8RzMM4ok97M0iGh3mA4v+llwXmu2wwPeLOi6PmtPwhUOAyb+Pw14TNiZk?=
 =?us-ascii?Q?po+gZnK5xTr/QF/x6HHcyC1Yffo/RTdHkOxuH+4TMzExVcESidJjDwCTdEh3?=
 =?us-ascii?Q?JfWOeXCET7tjz6TPeAlI7c6yI/tw9xS7qzh9KdZThCyCfKFtkjP66agPz1pH?=
 =?us-ascii?Q?RpvRorpiJ/JPXJqX2uMU2NY+laGKnxf4qMH9MUJ+qydoXN6JBIF9HcD7T2rT?=
 =?us-ascii?Q?YahalHXRppCBXyQWlztMNnGML5Z6qhmztztpoqbyoPTMdUER5NxaThF87r+2?=
 =?us-ascii?Q?I88PJP0aN0ejeDZUUH2BLdDqzcVG3mp9W/MncQeVLWk7lSJWGKX7uWbe+aJB?=
 =?us-ascii?Q?gkNzag/8Ctf8RUNDwFfvbxfr9eGni6UtApbfslm5KYsyR9iqRzj8G00Jnxy7?=
 =?us-ascii?Q?toqNqYfZ+sX0MtepnJ18Gb+o0b1S+E7pKECSNXJF4Rd4yb61O7a3f96xC+An?=
 =?us-ascii?Q?nT6dQEhcSFHIzeDZuAh6jvCFO3KlmZ68oWrNgWXvCyqVf6p1iAaFbQckkCaW?=
 =?us-ascii?Q?Tfr5MkGGz4JgIHeZ8TzJVrAlmXZvgfdF7rBXelkAM69uaVoT3CLleb+Xo4mh?=
 =?us-ascii?Q?gg9ApSnPWDBVDmfZmw5lej+BMKleJx8TGHlHGlUj/61eKZq/A+jN2g+IY4am?=
 =?us-ascii?Q?aVwSOzJsTvWnpzjp2IFyveGlLXqBAnR2mnZDMmXMdKSfWIXDPcNwYJ2YaJhp?=
 =?us-ascii?Q?xblNHK528S6xoTLM3B6+7LGrX8eGyAT1F+yskp5b0EyLHLXKtxGu4jDdo+fi?=
 =?us-ascii?Q?ytPa09M3auXFuu2vTCRoINYBNcu1iCl394Jfr3/mkeKbDbJBB71YkeevDNhX?=
 =?us-ascii?Q?u1BVDrCtKIO0EbxbJvMx/IS3Q7j2Okkid6oxWuPHHUJRayLfaCtaupcsZIue?=
 =?us-ascii?Q?NckCn4DYb+T2gJgt0+HDNNPx26PzHIJ0HfFFZioX1tKNEri/FwoJVezNgjTt?=
 =?us-ascii?Q?4Ya0Zq2CLDDF93U+W5B8wN5Fq/2MTrIw?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?m1/7ayTNkQ7lhhFaT6ZUCk8ZhswrqPk2gnob8HD89C/kgGxnDb6ERYXjJkpg?=
 =?us-ascii?Q?niQ7iKPgNPFSHjxP7z7Bp0LngdSbk3QB6Cc9MfzOGdcPayiBQJl88MdIHwSQ?=
 =?us-ascii?Q?sRNBzyYPL8rh13ELCsT9Dqs3zqcdRcER+rZrCcNdjucmHFa/p23S92G4ZJx3?=
 =?us-ascii?Q?LcBuDbHmd/XMoZZTqRET6uz7a4qOy07mvEN31UFO0xIH6V0oWQLYWfVOTPT8?=
 =?us-ascii?Q?1DOfXucz6+ASCTi1KLrqUUvc8cFjACN/N8AnwcjcPR1mDEyyH1Glqh6JufUF?=
 =?us-ascii?Q?fg+lA8Mtc0Y1gp5JTkQli685Ehx2N4kBPqgpo4vzTpo0S9/YgHoSO1t4f5s1?=
 =?us-ascii?Q?aUsg92MvkgcQ9gDGz6Dsxr0KwB7/qVidu6ZeAb59NKX09lNKUf5PpVlanCQQ?=
 =?us-ascii?Q?hKbmO4OwQW257PwKYMm0pFR8S2ITsmR4rAJU+j317u6kmFdyNkpRqkZpGdba?=
 =?us-ascii?Q?IIdaOC5SOO0958sxkQWUtTuNPXsxhScx+4cvl/WeKBqC53e66UDThDFHc2a1?=
 =?us-ascii?Q?KUvDPhJFGjFNui5TGZ2tQ69bg1gvlLgaWTmKaMxJeKGXCHFPZWxHlTl472xb?=
 =?us-ascii?Q?8CeDUVv3HirCPIN4avgUbv1USyYQlfKaHZeKKa8XJL68TkHXNeFL7ktXJ86B?=
 =?us-ascii?Q?2WsZg1ilA3r2frlo5eQUUZM6z2UP/jU/FAOMRQUQYCQpl+qwJG8oulYqfCRo?=
 =?us-ascii?Q?xg8OuZJCI5q0iAT2AEIOYCWHLguJZDbbb8z7aG9p3JmxydMN2+CM2VTKs9pG?=
 =?us-ascii?Q?mjTcC5Hakmlr/cgtNKSaeAMHf0GbD7k8bBvtOnihWYvGfN+WKt7Z7OtfpE6q?=
 =?us-ascii?Q?KEyAbBD4Z6O22+o8EEP5aM4JTwjv+T95C/kwZUszkFhd9p6ndgkw8T9khyso?=
 =?us-ascii?Q?70V4o2JmOVBrUx97jWWy/GxcrI+ilwKMjA5R5Am2TckSvqz0OpXnHhCfb0xd?=
 =?us-ascii?Q?Q8WuFlo2D/IZGzOu9mInfC/w2gfpBKgP90TJy2Jgk0mNsIpQ4UsNaBbDDgHD?=
 =?us-ascii?Q?fU/+d/046Tl0lG3Gsi807AHXrtoPUWIS7CZEgz/vxb/IWAsjMGn2Yod/gh5A?=
 =?us-ascii?Q?TC9v9N2akwpNdtOg8D1LfpLBf4PziiAkVsy9ECeYWFdN+xOAROYUOOTkbqRP?=
 =?us-ascii?Q?Fa4IgcAXaStT6t3CCveS954CdYynHOOJbebamIi4Ps6PEIYl9YZt7acICgjc?=
 =?us-ascii?Q?alszdZmDD4pNMFhjo5wXsJHIznalOtFnGm2i9k/bVSjNPUdDKxPaex41ZFgU?=
 =?us-ascii?Q?CCiKL1qCH8eRhft1i5n0NhYGWJxFf+ZNPJU/yprzjRO5gcZWMIBwY3EzvLxM?=
 =?us-ascii?Q?19iLYId63LUz0IGmA6iZF9bsgPhjIt8KqLY1LN6oie4TiIaMvNZmpVMseon1?=
 =?us-ascii?Q?uJecT2tX+ToQ8HDCRdWgwGSNNm/hcXxJe9mXedZokbKrB08J3DU7Ad+n3dRJ?=
 =?us-ascii?Q?98QTxvKchfQJvyu1e3fPfhP8g/tEYlsgQ8t8WSTzRGte2YQYf81hlJGHT9oD?=
 =?us-ascii?Q?IJka/jwqmFGO9JqWa1tZAAHnn+2cUmkwLAODz86UyDspItqchaSA5aNJ1XXN?=
 =?us-ascii?Q?I7mwRniGVPdrPD3XFr8mb4KPMQUU0pA0a4pLdMCfGWsJSoq6YIX7+8gJmU5a?=
 =?us-ascii?Q?1LkbC9ygafthgmQh7y2VxG4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96a6ba63-8ec9-487b-7ad3-08dd1e3cf0dd
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 01:48:44.5526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /yekdKUp9mCFnf5m9OQsXG2j8zH+fvhMfaSRs5BxZZYcmtTqBUEyt+2jmN/Bh6LkTQho4gAwAUAjEwB4DFtvRaFSbhiNO/VQ2KFfX1QxA8oXFj/b8PZR7/p/Fywmi4dZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9279

snd_soc_daifmt_parse_clock_provider_raw() might be called with NULL np.
Return 0 in such case.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index c8b7f78b02f0a..426f8d8baa38b 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -3391,6 +3391,9 @@ unsigned int snd_soc_daifmt_parse_clock_provider_raw(struct device_node *np,
 	char prop[128];
 	unsigned int bit, frame;
 
+	if (!np)
+		return 0;
+
 	if (!prefix)
 		prefix = "";
 
-- 
2.43.0

