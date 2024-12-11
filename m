Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010018.outbound.protection.outlook.com [52.101.229.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E337F2451C0
	for <linux-sound@vger.kernel.org>; Wed, 11 Dec 2024 04:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733889801; cv=fail; b=Pi1MwyVbVlKlzzEOWL7F6nNe5CbNN76kYVnf0dHWZAAUAmINVXesTS3RF+jBnbPeQWz0jDuNLwQt1q0PDNTV78SAOiJqEvsqc4jbuY8KcXwIJR7mKs7cfJvudRh2Z44EMknhnPLGU+Wzy27P/b9KeJALYzUJQiAAcML/K05lO2U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733889801; c=relaxed/simple;
	bh=rkz7gWxzoSnB197p+jDAek1y9lAtksgqQunev59w18I=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=hbdJ/E6xyktrkmzNI0E2sUbyXojAUamnYqml2/sYmi4YvYEOXSyZNIqGkRoWMglxuqUuRSr5CztuO19/H8lNee1oBaYxmHzi1yI3Kwf3sHf1vy9lov+TAd/VOO1rZ1Imf1v4YV17Iwu7k/wtikK0VYxFUROLCfLRb6D7fnA+dT8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=GejvZiMG; arc=fail smtp.client-ip=52.101.229.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="GejvZiMG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CUePe2jC0NPnI0ZMgLVPOdPn5/Ug589YDEg/5iQzOOINL124OdOEPaAzNZH3H0AnsVjchBnDDMdeGKoxg/LZz/Yo9yN1TWVfMkQOWGywtXnMEBXD6Cm4ecKBw7xMjFyNCo26oRka5ny/MHrGc8+Tu75SGeXWOMNosVnB6IzJclFyRZ5r7c/usBDPNMDUfHMUzfabgEXOLdsFHOHWbriAsZS5lqjaaBN7BX5oGcKyjEWkci7zv8E1H5U8KBmMZEPebWziIQxlrYq/tyw8857Pvloz/weT2PTUF+lDyjp5EEBVuAVqORNydyjATnDQ5p1C6JGANS1jdRJ/ozrc35mw8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bn9zok1yffFYP+cU0NDp8EhCjSaQfo+H4B0nzgjXcBA=;
 b=YtqakAln6rsbXcCacUd9QqHZu5iCf403BxfTay5nvLskIRRw3x2TYHEcr5dJ7Toa9tNwwV8sUuCviB8iktIaHL6F+hB0/hNI0SbHXrAkuRlsgLVea6ZNHeTC+WvO5+29pTJnPRqDKE3n10a/rZO1B7dSaGRd7aQSYwz783H48HPtiFeDr3PrHdyZqS3EjP1wDUgogHqfMQSHSlRRm9+AevKPEsqT8JzgvOAUmQFL+moLoXLvqX2dnpfEtYhMYOGAvXxV0/kp/p80QrReJxf4NYnTCcN4TiZFrVG/3FxRvuxu2cEsUswri08ZgZ1GViCljWhKD+c2CQpfm2I84zth/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bn9zok1yffFYP+cU0NDp8EhCjSaQfo+H4B0nzgjXcBA=;
 b=GejvZiMG8TjWpi8T1xoLxjB2hjfRyFyOg5iSptyrz4eFDBXga1EFMs7eq0cv3qeGaw41U0Gsh+iPiUqAZFLuj5WOKxyHZf4y1XF2NWgo1oWYDyRur9Y/YQlcqxxlKSctWZeTLfg6DP/xPYLcX/J2uUaDPR1clGYfsCqOuhQg9I8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB13301.jpnprd01.prod.outlook.com
 (2603:1096:405:115::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Wed, 11 Dec
 2024 04:03:14 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8251.008; Wed, 11 Dec 2024
 04:03:14 +0000
Message-ID: <87jzc67tod.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH repost] ASoC: dt-bindings: renesas,rsnd: remove post-init-providers property
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 11 Dec 2024 04:03:14 +0000
X-ClientProxiedBy: TYWPR01CA0020.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB13301:EE_
X-MS-Office365-Filtering-Correlation-Id: d697f126-d292-4498-451d-08dd1998bc94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?u35xT3c5n+sxMiP6MOUAzLbs1t1E91jY0DtzEUjcyS7AT0wrMkIW2yFch2LG?=
 =?us-ascii?Q?vcDee5+EOiqPPaLotuf91ZdEnZMWhPCD+MmhFjMTGU7NT4nISS4RdgidoBs7?=
 =?us-ascii?Q?1n3686QKDjfAvvEomPGGiV2d/tRjNwzZK2zecUE08wfg85dfSVZHzEZ2SQlV?=
 =?us-ascii?Q?d7Ko9AiKUyUqw95Cu+6Tc/FiJEsrwq6GdTogn86ru4EgaxoxQjKeMPSFjcl+?=
 =?us-ascii?Q?Lz3QZgsuQnmZUs4MmBbqDqe4hdREHT848kC3S4ze4hLt37GWPJIZQ/UDCShF?=
 =?us-ascii?Q?rO8fV2p3Cj5nTKytzkO8Oa5wiXQMtmKz6io54xSX2Ls8hYkn/3TBAqQAPN6T?=
 =?us-ascii?Q?eTB2HwncYQ/iWOQGv8IqtWxxZu3quntpwWqhGorTRBpQxU72ag4sEPRwRnPb?=
 =?us-ascii?Q?mkZS/Dq1aSPObRfS/bXUm6RnXgNDJ57xxDPIeqf6q/2yAtHCoL7K3jjPs0AH?=
 =?us-ascii?Q?NU9gUUDFwjHLyEOT+QQF+0n4s05jii/T5xx1Tw0rxh9mVDiyi1IfSpzSTdu1?=
 =?us-ascii?Q?H4HTyEBY997v0KBbkscxB7YtXxwLTN8DmtKC6GalFPq//QRZdpqDPjd2qCpm?=
 =?us-ascii?Q?yEKUdnPndEbPPgktuYOd+erdj0WEqE0kDcMpBRcIWrLmSQ1s7nnkwfN4Rx7p?=
 =?us-ascii?Q?jXbXBvO/ykU54iiHCNbzKRdaViuR2kU5Dpx2rku5/1LG9iLir+FsLLPAfxJx?=
 =?us-ascii?Q?8N1am8wkKbdjK63ZuVrgp63rIQD5t8IdvTjbAAX7xXJ2BOLlFiTFYIkn5nR7?=
 =?us-ascii?Q?Pwozp7Pw3YSdonuGz/sxd0G1NvN4er/WxBNKRP2r/00ExUIIlOpJDTt6C6GJ?=
 =?us-ascii?Q?QdyTZfq2lrOP0TCW7st6orkWaHbQKFydb39NMwp0SCmy8W/l8Tyt9Vx9zKGd?=
 =?us-ascii?Q?RJz0Ud+DJsxRUIAGfgXsaESOQsmj6Ikv5k473t3wximWeHkZIeRvP9yasLgF?=
 =?us-ascii?Q?W7ySOmUGfqIAuso2lyvOXCvhQcQWlyrqxrA1qsDwtM7ZrP/2r40Zq3DjRsWe?=
 =?us-ascii?Q?6dWkqiddpukOkD/Iq9XOCKay097CR2mvhG+0hItV1G5J2l0d1XrziyteynX2?=
 =?us-ascii?Q?3nd0p5OxvbHSbYsa+WyeUJSMYop2sC/CEReqcr+Sw3gy6xqBr4gJnS7JTPvV?=
 =?us-ascii?Q?MWW4r/510RGpkkjCUGHfuG1PXhHO4JNJYUY4H4kTeoMlSFiNcgOfmgHnWEHy?=
 =?us-ascii?Q?wnm0UDGU9pEGh58hR2gpJeVMtC5CGmzeLpZ+feOz/iw0kHziSibGHogHuznU?=
 =?us-ascii?Q?ytPCpkBJrBIzrvKgnp/R7HyIDv40gIUrAMfz8N52pnT5JX+TS5LjJZG3xuKn?=
 =?us-ascii?Q?vmWc2GioUO1v/TVCCa0YFbBXt4mP1VASqMZxd3aN3xFgy5ZWl0TC+yqWfTB0?=
 =?us-ascii?Q?EMe313Chf8D+si2743XBoWKp3ROXPWFAOsSSCLsyoinTUMgOkw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?t9URlTpc0Li+B95eqw4RHeyr5I6+EBHf98sSqopl9WhJjHDf8EqzbWwMAfxy?=
 =?us-ascii?Q?vB9n+eRhYZuf/vHTyn60hlRBFfNcA1bLGwc8CbvL7d/WrFiMK+YQzlwVIbXp?=
 =?us-ascii?Q?K0q3IisrugOTDMs5F4B/6QF9oy1dqUW5vwn7Ph0C6yrEy4MDkxSo18f+t/mD?=
 =?us-ascii?Q?/ZGTubQ8xRzGhUpUzPAFc0aEImnc/4qI+NK73TPVjR8/vAxOCi46SxlPRjAS?=
 =?us-ascii?Q?RPk9+P5Safe9oiOF+g8KCSN6NFCirxPAj7Ph4KGPjgcF5wsIJOdFJDbJTzb+?=
 =?us-ascii?Q?wmwawu+TYrS+cu0rGDZYi7ay9FF4BY5FcLv3FgqrigoGXpT+fzuRpJTgIb6T?=
 =?us-ascii?Q?4xs7Op45s7CQBKVrbuLivPx0RzZWy19ViEYpXSgMRfSu2MRz7juke0YM56Pc?=
 =?us-ascii?Q?GDAe3yDL071mf8t3WAmVVXu5hZ3KQKE2DwCU/9BAJvt9bDt/eUBya6wFA0XB?=
 =?us-ascii?Q?cYYk/6C0m8JCHvDkJ/DrK3UtTp42+L+orlWAYOroZcq3yxQciqa0rqOyEHPj?=
 =?us-ascii?Q?joVdsZxeVZ0i3rWhdHVzHu55cb45lq7BxZG5AqWcufwc9YdgdvWYYqhVXm65?=
 =?us-ascii?Q?VH40Jx6K7AyZDuybPIQMoe/R2F4mhPdqNtUFbM4Wz05iXmBG1lXO+oGuXrKX?=
 =?us-ascii?Q?1Z2Q2oz+QUkqc9dNT2j9sjfxE7WEe6S7Vu5e6gbsRGOicxQ5Y8p5BsmFKxv5?=
 =?us-ascii?Q?1yDjnOr74+PYpWggpLfTIpUy+D6MzEcJb6o5CJxtFmrnHEihsTq0fgtPrvXZ?=
 =?us-ascii?Q?K5b75CXT05ATQJeJrfxych7UW9lwy1wuM0QeSzuLN20pQU4G7QV2IYtL8bFn?=
 =?us-ascii?Q?+6j0JF8UWdzQ95NwIv6M6bXopBZ01xDuPZrl+VYt6YMC502PpZ24tBJH03BY?=
 =?us-ascii?Q?D4YQhC8FxS7YA9ktyfkuhqcDIBQzMfsyV8V3cNQCyR3w6h6DahqE6c0Hy+OX?=
 =?us-ascii?Q?6bjQSaTFP6juK7TJNrmEVYPfb16BG0uDJjJGrZczzoRqgpd1raO/1Yrk8ZCM?=
 =?us-ascii?Q?AdIb95bqOKE741A5F9a3rNnuKCCZEuG/6vFup2+OxrMYtpiyHZ7u8uIIfTfr?=
 =?us-ascii?Q?1hk3uW+p9R+jE5hGSuWRHLEVXZrMdth3JG1B9Dr7uEqDHXRvyv7JMRi7O9o8?=
 =?us-ascii?Q?H9B5WuY/J1FAbzmyvSGp5uwpOWX967808gOQe7EQVSqNpbVl3wcx5ux013Db?=
 =?us-ascii?Q?6cVadiBYfIuQhGSCZB422HtZ6Wl6mUMtOcATChrRNLI/kXitgwbT9zQmEaH3?=
 =?us-ascii?Q?xEngZ/FIn9eSoP6YxempTZu3cZJdPFjRnsCEoFGUKUvdW1IvclJyTlyFeWi+?=
 =?us-ascii?Q?Xh0AsCe5AAR6X3eTJXuy+1nnuau5qmneFLIEoK91qZEqrAKdS5y4Bsrnas52?=
 =?us-ascii?Q?ivXBlLIumFGeCOrjMWq1+JejyIvII04OfZvCVKpjvB5igbFRFcAtFjxfKeBM?=
 =?us-ascii?Q?sWkjpP+MkleU71wjzILAfF0d52auO1Ri5MRel6oBGqY20B+282XuRIzVi3fA?=
 =?us-ascii?Q?jvGDpjWgcasulnjXR6fI9kB7qosAiiRP8Mz38FoJtDfEZRRTGeZTL9f90rAS?=
 =?us-ascii?Q?LpS8saWsgzHjCOssTrQzlE4wXYe3yZDFsZWueFp9+3vTeWOtaAN0V8RuZZTz?=
 =?us-ascii?Q?xdy0plWQfwwOZaOlSdHK5uM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d697f126-d292-4498-451d-08dd1998bc94
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 04:03:14.7389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EgIbMAtH2Q88SgohggLiNd/C0bIri/pfeRuZyLdXx4u7rhLS7WutzKLEUjy1rqubTMtPMBNZ5GhCU1YwqwSaYD86KkSMKsFa6bfdbF4l2JXuddgFG4xhQFbj2RgTQ7/V
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13301

commit f8da001ae7a ("ASoC: audio-graph-card2: Purge absent supplies for
device tree nodes") marks multi/dpcm/c2c nodes as no suppliers. We no
longer need to use post-init-providers property to break fw_devlink cycle.
Let's remove it.

Fixes: a2187d0dadf ("ASoC: dt-bindings: renesas,rsnd: add post-init-providers property")
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 Documentation/devicetree/bindings/sound/renesas,rsnd.yaml | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
index 6d0d1514cd421..e8a2acb926460 100644
--- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
@@ -112,12 +112,6 @@ properties:
     description: List of necessary clock names.
     # details are defined below
 
-  post-init-providers:
-    description: At least if rsnd is using DPCM connection on Audio-Graph-Card2,
-      fw_devlink might doesn't have enough information to break the cycle. rsnd
-      driver will not be probed in such case. Same problem might occur with
-      Multi-CPU/Codec or Codec2Codec.
-
   # ports is below
   port:
     $ref: audio-graph-port.yaml#/definitions/port-base
-- 
2.43.0

