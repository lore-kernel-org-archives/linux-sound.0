Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011035.outbound.protection.outlook.com [52.101.70.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6410228312D;
	Wed, 18 Mar 2026 10:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773829662; cv=fail; b=shHogCMBSQ7EqLkd6KaXHiMhkxfX/v07OhiZXf0oNC79saZ7ltt62qtkO45qS40bxwzJ4E+jidYamRJzC9LNPE432FaXZG2CifAp4BUYKt6MM8KWVWuRJyG+iAYoVfIHdBjRUYIhTtEUzZCq+NHZTqrc0atxz5DRhxTJsX4iWzY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773829662; c=relaxed/simple;
	bh=tThh5AfHahj42OdjdEZIxUe2MQw9dLar9wfG0Q+ybHA=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=BtlFL+NLikaYNgTDs22zjyT2QlE6ToHPRQkPDfIl79dBi/2fSUoyG1scg4D+91NBFEDeF/E3jlBByFSXoEyEgeeS18f3dDLLlwwFyd2xwFEPeSriIp3kDi8LsyeLjd0A9fz4CY5qjoRzJDwQ6L3UuUJ+4B+8gE+PKLra07sC5gg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kq6S/S/c; arc=fail smtp.client-ip=52.101.70.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kq6S/S/c"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ABBMnv3IXPCcrfZEYf7mJJYU5SQFEdBgyoaaA7WqXwG5TUT4vpn7ZEV5m4eVYAhyuyh6n1k/455omeNSQGp/1A5+umoWuGTEy/BcWusPqoKQUVprCQ3aUV97fcmj1Dz8lr/+BwEviK47GxVScFpo5Wafm7wdcJm3z86C2CcZmnQH0+hAZImjuNgtICxcRwHzzKtiXrrYcI75XqNz0jxNzNiUrtcFADeE0Y/QL8vJQ2aMzreIeOPZbyp2G9hd7Bds6dg57UY+7rzGmbJf+1qqfux6wSE2xJ7suetY1a4ooDok9N2v81COyg67lYyYIk/MkBdru5IGm7t/t6UoAWlVdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OLP7TiO4qqbhawC6JcBLTH2XMSIlbeqkPEXcnaLDLCc=;
 b=sEx901ghEhfNorl2UwP1vGD2ZkFyXKVUYfbJRYWnBHwwPYlladT3v1OyyyddDHIJdwGQ+p05sbxEnSvWwFosPeT2HoOKrFGhAoMZfkDokYSTVqyRMqw0ZV3L8V4OuRNGhLna4JzJHNuf/GkyBleKSktXrc5gn2tSMB371X1w6cWo62bm6/chaf8mRmv/qzf0IpzY+vxou+EFXks9Ra/S1EleahR4f+eRr1PAO6PjhAiMIqRwUM9vidYqTvNcG7LvfDYadYv8A2pdwB69eixKNJm73rl5+TI9akCqkl+cJnnCBToolbA3opMWHcwCZE2/cgQ57Jq00fZdHThEFE4ZBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OLP7TiO4qqbhawC6JcBLTH2XMSIlbeqkPEXcnaLDLCc=;
 b=kq6S/S/cftBDYClPv+mXojJEZ1PdH6Y6xbwBO5gpp7KA7JVgSZvC8JjXVh8q3Bx6WlNdFgNthksbhKSiog8q4FR+8gOQ8o3TLjcmq7s0Vfex4bNXYuGxz0uQBmiS65QRCknnPF1NLodC9I+B8q2XNlOKW08FZVFv9wdQnMDNgSuAWVy0a11e6RFeUQ96QRkokyyiyC4U25UKfnCZdmogv1IHC54TxVJnzEXp7e19nzAgoCQkq0IFLuyQqH7BqrG2P4Kgcgiopchgpkv5kfZ7IU0pgJTr2xm+3tSMXqfE7VSp881UFXBg2HXNqVaVYlsmWcBnJFvyhsDrkkauzclEew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by GV1PR04MB9514.eurprd04.prod.outlook.com (2603:10a6:150:20::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.21; Wed, 18 Mar
 2026 10:27:37 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%4]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 10:27:36 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: broonie@kernel.org,
	kuninori.morimoto.gx@renesas.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	shengjiu.wang@nxp.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alexander.stein@ew.tq-group.com
Subject: [PATCH v3 0/2] ASoC: fix usage of playback_only and capture_only
Date: Wed, 18 Mar 2026 18:28:48 +0800
Message-Id: <20260318102850.2794029-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0160.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1cf::11) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|GV1PR04MB9514:EE_
X-MS-Office365-Filtering-Correlation-Id: 8eb9bf77-1ab7-4411-9437-08de84d8f92b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|19092799006|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	Fu19AYcgw8BMCojyNqM25B2SQZhv79WirOP+4lwfejxGAnnyVVJiJlESop0wpXmw0rulvCHKm0XbLY8H/Rk9QrXdD9qVNM7/farzbESJBlCtq784XsGz1vWLEbzXuHUR/W9NcYBN7Li4wti6Hx9Pz1LscU+igvrxhSrVXOGW0SK+Pw59obJF7ayLZShPByolTTFu2KgKIqQNMQC1XwHG3jFyK6+kqTHylnPwFxgxFxUkpiJZtTKb6j5mgMrt3dAynLCFoArJwylBzq9L/kknmIeuPXpX3J67tQgBEjhRFlGu1Q3GE5Dbd4oFAurY0mm9gj97XdugaO1hwdczengaeA3niJV4AHuviK8JTn9ZcY++yBRd77HtAFytXNRQE8fms6u3KjBnHU30jp52d/BzrQfEthauFYeWtvBIJFJ2lpHc1cLvYd7S4dZ40dc0iloctLpvrHhfM7r+pka8mYRPkJ5LNuHpE2WYFte43ShqulkhDiDla7by/okbJDiUYIGySmMfzsTNUUKjyfz5Rcs+ed0XTCy9wsT67+7B+SjB39aoYbcIZSWS/EEOoFPDHnWo1kpndh2Qf4z6puMDSlHUlAF/gjiJdXoTJAnNQU2xVi4DYwK2sks+4xAqbWOM4a5qjh9Zy15g9CeNbobMZiUlHO0Iqk39nDHDLPB7oR03NRcnQqp+sENe+jFqI3Era6ZJiTMpsYwtaIW8A3yd9uF+J4ZP/qDpAYUAX3Wbhov+7TxEyD+j/lXttrYf3PYbKCT2HK3rOsfGxvQthIGqAu/MRgZaCQ1QVFBML3Pdd9Td2mY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(19092799006)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yUhibfLj0jfltvkfhnZjMqI6RstAjA0vlJw0oUo0huQMcjEgj4kHuwxQCIEb?=
 =?us-ascii?Q?NjNLZA7z2pK3DVHbIku52By61mE5+DdZplqwgb7k37GHb6+I6pbSvDJ4Uvbw?=
 =?us-ascii?Q?CzVE/EoVLF2ySJfMv5m+dA/Jd45c7KPBFlXf35C4FVV1xy0ZZqlpkV6vCbGC?=
 =?us-ascii?Q?ZpWb855/qcZBDi2o1XR4lVA7qgKmiYiyAXBipB64fd+gYZ6BbeFsW0vLBJYt?=
 =?us-ascii?Q?Z4CLGvARPbyMBd+nATwC7GJw+qVf7jIgoh0VI9+e24tmGrW5kEdaek0/cVod?=
 =?us-ascii?Q?WJE6BFY3bIRw6I/FgI3lHYFjeoSd6hzhBD0SX2pPEzcuLAmMK/YZ3wPNx1EX?=
 =?us-ascii?Q?OGYMrxXQlGYz5V3aHN7gSpRowqJW5EgR+rfXA4O5P/sSnQETZFvNpN3pdJ2S?=
 =?us-ascii?Q?gL+5792vYVSI6WeiPfVJ2uln+tenKxJAPfxXSUbbQme1pt+dLBDC7iDyV9hc?=
 =?us-ascii?Q?Zl7OFnYmlfdr60GL678EGsosSvjGynrXNh7f8bgQSIx8JuWXMXKZB1+/hH0+?=
 =?us-ascii?Q?CgkM1qP+pzGzjMean7Z+yfcbEI4MrJ/E/csVXeUn9DBJMDmek8rD7+eLEibN?=
 =?us-ascii?Q?bwq0h/yg2LYe9pxwpfksaZH/3rm41of9HilCm27PvT/WVzOfv3ohgOTw6joO?=
 =?us-ascii?Q?m0KrGk6zpNqjUZq9AG0NG9KxPvQNmLD6/nQol+B0ceonf97KimdmoGi/SDG2?=
 =?us-ascii?Q?rnvX7w4RXu6Or6iNC02S4DtnWpQrvdCkObKWr8PGVqMW9/aqvuLcQX2V7K8A?=
 =?us-ascii?Q?aYwgTkRl3ue7kBDNJR0l5J9HDjl625+NfC4R/TZXrYEpIxnaZlkLDe9AryeP?=
 =?us-ascii?Q?y6dVg6qxLigIDU2yjhO6ouhuLN6Qcc8CJuLDOFWFWxgaDL5K3sw36vWa0NZk?=
 =?us-ascii?Q?pup5xOS2eYgP+FL/r2UGyEHsWKzf+7c5YcUF30pnspDCpeZ6r5F6m2XwTgil?=
 =?us-ascii?Q?A07e6pAZ1WLwv+Sz18KytrPBnyROh5ipasgbPeuI3TQxJk4vliDhyjsYj/5M?=
 =?us-ascii?Q?xNO5eXAFI3WRayfJnmsoCean1pXGEBpw/jr8eeiGr/HfRt8h7poLEJJsRyJ9?=
 =?us-ascii?Q?w6xQZmDP2dD9DhMFQBdb3fNlPu9y1QzoZsZlSvprfA1q9lgB03gzE6Nv5bm4?=
 =?us-ascii?Q?i0BIitA3O6ybncJ7IWLn3H0ek9ZhQfN0opLYRAhhYSICygROjiB+9rdnW3mI?=
 =?us-ascii?Q?TKOu2MTEnCzSNRMIOcWTcaHuveHdygbH2Dj2ogHua2f73fzayZFXrnFitHdw?=
 =?us-ascii?Q?SePq3cZyBQCMSQ0sICSGFOsTafYblCGHiF/+64cPAsXwTjvzN9A2ViT4rLBQ?=
 =?us-ascii?Q?E0dtLK++V3I0bAnnw3CMDicLoWYp//DwRCPMR4rwYaKuLykL43ULyJFvmAMD?=
 =?us-ascii?Q?Z/jv8maNpC+iTJ+RVKwKDwR1l1f9JQMAP95cnlg+zVB0yvdi3b8LTR66pQnT?=
 =?us-ascii?Q?MnuzpGMUxpXnT9dldP/KId6idk4HYZBjqzz5GvoExosvtQyAV2TU/zwakd9q?=
 =?us-ascii?Q?zZWdGOfzZO8HWNzu3Stv6P9PM2Y1mu/dDHQ2JBjqILTY/3HUhZdh6WVUwHz3?=
 =?us-ascii?Q?i7GXb3kgkih9UHKtii9lIosiNv21urWUJMC3ev5z4VyNsKoI7H6a1NrmeZU4?=
 =?us-ascii?Q?xmeNvslSZE9mAlydkyrjM2/L/pB4siSapViuCKfE9XKPZC3cYgX5MJSuBHHR?=
 =?us-ascii?Q?fTw0uaHTkQaJ/01UNSZEgYvZ92OyK/mnrGmmIZ3s4MISHYNY5q02ncQ4A2g6?=
 =?us-ascii?Q?jdYG2m2pww=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eb9bf77-1ab7-4411-9437-08de84d8f92b
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 10:27:36.4742
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QZMVzhfc8LaEG1dteY24UBBrlvFX3EpuDm5pe2kDTld4WEvvbHo8w1pJX7yla71lG9mgozdnKTwEXeJzQI+1fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9514

Check value of is_playback_only and is_capture_only in
graph_util_parse_link_direction() and initialize playback_only and
capture_only in imx-card.c

changes in v3:
- initialize playback_only and capture_only for each loop in patch 2/2

changes in v2:
- check value of is_playback_only and is_capture_only
- add patch 2/2 to initialize playback_only and capture_only

Shengjiu Wang (2):
  ASoC: simple-card-utils: Check value of is_playback_only and
    is_capture_only
  ASoC: fsl: imx-card: initialize playback_only and capture_only

 sound/soc/fsl/imx-card.c              | 2 ++
 sound/soc/generic/simple-card-utils.c | 4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)

-- 
2.34.1

