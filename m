Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011048.outbound.protection.outlook.com [52.101.70.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C53F28314E;
	Tue, 17 Mar 2026 03:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773718721; cv=fail; b=NdPBUnUIRNXSZFyc1bi5YQmddeQzCwFvHC0WLBpPTGjZnlG+TtJj2wCjXSaMdz67hFhQ6yfyJObpIBY9GMOZbwsK0LSzLKzNKm8GRldBggNjQMotOEY1Km5wmrmjF3PBk1SpS+o5Y5gv3HYlHheOQJ3pC9h2sPJS4+e3PgRzv7U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773718721; c=relaxed/simple;
	bh=gRMbR8u4bBoJuhcKg3LTi3RB/A4TEQMiuTTRwMyfaWQ=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=gXKXL2OvOxJxqXebwXxenET8lg9vyBRSdZY9zRu5eEg1x3dSiivbtUtHXbN0tnKNsBYCjyEGfTtFxpGjo9+4DikGUoYVnpOMErDyfE+LkNCa9ZTJw5gAoqEIsNu7s7ou4D6Ilc23CG09Zwo6WJi2pF4YJ/Wv1UI0tX06PRFRHOs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PWBO6L75; arc=fail smtp.client-ip=52.101.70.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PWBO6L75"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z2X0FQ7BwtGtl1F/1EWW6W+m85XSaMLNjrrKxddgneeInVvwxXiSMqgAilZk1QhuD6Hhp7ppNg3HLLj7hO8LHWU3qDv++eVdJiQmNk24HBVcXpF95eVU3SEEMRZVvrlEeN9Tu5TTtC+fhc871mTLT5B1YNrQt1Edttd0Pqbliapox7b5DcSYjnITe0YaY8D4r0MNDUjm0YZ0szzRn2HVsu20Qj1uV/Q6wZdYcoMzmjpn6vq7uFBc1CN2zNkQJN+rNCe7SCFijq1mPChN6hLny6awFRKOetOscLzuMQgCX463JXPRHo2S2dtxPl3SE5cdIRc3BBtVEl4GGyt97j90+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8DSHpGHAIW1xC6LocMQSAcpQZ1OUOG8Jp4RzSP/nH/M=;
 b=eqIsD/i6wIxzL/eXvAxdk+EoO/oA72yoIYPBgCXeODkX6oXuVN2IZbsn8TChMI8e9qBJOzY/Sv/1UhTdY0m3PtgzOg1ux4YeCLPT/rfNrtOQMyhVbEP4rthj387gnJa6XQaXadSrdacRnmrXBA1dLu2dkLYiKa9lSCaTttXrM8EMrtgctH/Qzq0DeZJ/IsgbkjeqS/pkG0m2+u1rXCPTXk99ce5FYd0ksiFnNXOm3Q0oHEt3UMWILpdCbT8oTRZsY2JS7isnZMS+/TVwOcoNCeIO6ax+e4j0ZFyKD+Ua2Hk8QD8XkBcG4i6/W/3tJFB4RhlofxI9U/f4MuSna0ALfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8DSHpGHAIW1xC6LocMQSAcpQZ1OUOG8Jp4RzSP/nH/M=;
 b=PWBO6L75ZRxUV28/4DcoZ2/8tbMPdVL3yTMNgD/b/fcylvsIO+oOWNUNWmIUOX2dm/OlJ20P68moc23F5NkbhVcSTx5UsrW5rVxNpj/UBoFYzNSQqJGDh/qLdaM+GRsZM1fToQU17PkOSPFlP0E8xo7/Bsu9Z+gs7njFjuh/aVy0j/ABd3HJxPaAQ4/0seI/kQjLBaWnP4eL3E2OVK/slvzx52hoSZ59CcXPFZj231cFoUepowgV47Wu7v8IzlikdRUSbbAB2Gd9eUkKWQgBg5DV/6HPreiMlTuDqH9b7t1yKK4u0QS5NER7KNFFEXiW0pr5cgIbjNrygXhMELtGqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by PA4PR04MB9565.eurprd04.prod.outlook.com (2603:10a6:102:26b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Tue, 17 Mar
 2026 03:38:29 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%4]) with mapi id 15.20.9700.025; Tue, 17 Mar 2026
 03:38:36 +0000
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
Subject: [PATCH v2 0/2] ASoC: fix usage of playback_only and capture_only
Date: Tue, 17 Mar 2026 11:39:50 +0800
Message-Id: <20260317033952.462209-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0016.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::20) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|PA4PR04MB9565:EE_
X-MS-Office365-Filtering-Correlation-Id: 60d4bd36-b911-425b-3d83-08de83d6ab8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|19092799006|1800799024|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	4kJyPzrCkIXSR/kbmwAxS0iry8zyEujiQ0fMQZ9AkQDWSw037N4eaTSRxED9DUrLJwEOwhPYNal6keFnpX035puWxIeIEEThim0OEMFRa++6QTJNxlYgoTRoh59XAOsvD1iZoUKce6eptTnJbaTqkRT5Efe2+1dQLVnc6LGucQPky9XmU8VKXJfWyc4x6yVg6/V9OyzCDQsTVAK5mU+0doFge3R1bzfC4Y41vWg50UnlJX3IGlgT4PNfWsfWc0mlXjwWyIOuPJkGb0yeJso5ppveTFqf6vhFnwUEzIFucxltLbHmGrgp96fIm9DMiVTYYIbsFfRaI2cX+uWIZ4scSbWpR9nh39+jVHga0FQNPSFxh/iYBT0kSuEcchQNmbRayYNXeDZqfatcS4aI+0lMJH3ossTVjwv933is61SueAiI4YqDozHeWgmDfplRTTJzrR83D9ka9QK9+vo5WG0frrGBorBARATIVW4dLlOnPGLkSmsgJkxfBjUL9rKCXbnzC+Tuqc4/FOpwSmc6myMwA2K3rkvnPJo64LVxtVgX7uBABSTcG2sh9X+oUWqJWMUMYfz+1qNxGwOWw05DiHGG+RwXa/3yHd4FzL+scx3z2iIxbrgIDH2lhiJNKlMwkmXDFW0ShJ7J64gVdtczcRVUyCdpESheh1IQUFzh4m98VUUdZ7glSHKT7oiLdJx6ufSLvn+vLq0rOOI9TwvxB71VEWCyQAetJlBBujl9HdFJ75qYHTt1N5j3ODkuPRmpbdKjxYm3VgwpTUj29I0HZiKwZAPRQePLMltjKjRMTQeZCcs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(19092799006)(1800799024)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pMEZCgaQX97fXU35s0xf65tpQLdodCpCEA66ep16nn+aBswLCgqCVv2zAyq9?=
 =?us-ascii?Q?t40c/QUM629CVeJJkm48wsj3+CvO2SMqxAjzZqtYdox5xeckaQobjMOHluWQ?=
 =?us-ascii?Q?RqhSI80g31WadQiycz5W3O0im4jZNCHHDupTBepx/ZKyFaF4Ye0Dw9Qe0YEt?=
 =?us-ascii?Q?WXqrXmXPMq7hLIe34DKhOnsl5+zq30+566avL3fGUAMPZdiocEF/+RBfcd0N?=
 =?us-ascii?Q?R+A2xeRiVdgO2J/pwYbTqyqHfT7WlU1aDqIsR9FaIbJKlgipPHF2cmEAZXq6?=
 =?us-ascii?Q?yG3aOZrWdaI+NCD2T/15qNSG+FJzOrCyydPhAZR3O+UYtQJBKJydmXKwZ7ac?=
 =?us-ascii?Q?er0EL2wc+eZ92WsarH26j/Rz3a63ccCL6b9tCex4lu8zOc9QcgoZ6WR3Zls2?=
 =?us-ascii?Q?x0ZOq4tA0C7a5qsdjm7lTjyO9auXMtqk7L+1FuSndN1QPN7YpBguZOKRN3Fr?=
 =?us-ascii?Q?kEW+++kl7cHjYHLGLrtak/F7fc6EyuJrLGcmb/ZgDwcyyy73PWuO2Ae1xEWC?=
 =?us-ascii?Q?SPNAVJATIXvnfWIszVdOJ2AzIMv+RsoOAVK6FrRuaCi3uozdlM06+1AGXYsl?=
 =?us-ascii?Q?85HZxj5ReGYdg5hKUwrOts75W0DZZ9U+tmEKp+8G00mgAGpbZx5vEWbs+bW+?=
 =?us-ascii?Q?lJhMEkFSwqC9IfXj0zSy6ItL4FofIZDVaEjFjTCGCCS9nAhi6xY92Ya0WQrA?=
 =?us-ascii?Q?e8EkQmoZYOGPuobTiOOSscQ2zSY5YHfr1J/9gL/IKJE+zaIi5Op+KQtQQMYG?=
 =?us-ascii?Q?LxaBBT5HGH9xoPw608i5kG/TPgzKoG5mfHtzd/5RQNIcLS4EBZnDLEMoYfz4?=
 =?us-ascii?Q?qAK/5J9+4dpA+TF7Nhj4XX/0z2lJTBRxwpYbogDNpn6+m1WhAmWRg1RKLm2+?=
 =?us-ascii?Q?uSdgCIT8iuGUTPjCmNtrbx2gYZBR3+v4HvguIJ+LilgI5GF2EPYNjq27Fdky?=
 =?us-ascii?Q?/lMrDVQwWF5YKKMbkuHOdLK1dDcPAX0Da8bI7GkoFhfCPoDV4V8IedSEA3LF?=
 =?us-ascii?Q?yjK8TzySMVfUos2ElXXNdYsXKemOhUbIw+/Dbs7LYD59ZyBDU9buNd0tGL7N?=
 =?us-ascii?Q?T5U3mjZfMyIytd/CCC89WWTA8KUrq+kLt7AdvSGK4JED4N7erTbz3Y8vGG0k?=
 =?us-ascii?Q?bffroROP8p9Wl3jzjNrx3DKAbtlDmhRwmziSj45A8f7Bwm7La1apXVEX7Em2?=
 =?us-ascii?Q?N3N8Fm0l3aH0xQyMRg6xH5gJmJV60/KDxgsA28SZ3O+D0Q5tKQytnasomp0X?=
 =?us-ascii?Q?0bgs58YXi4CnXnhfhB8cfX2ZeklAVNXH0glUZ/J/5JRWJonk57OseXFpskuc?=
 =?us-ascii?Q?dLY5DGiwaHLiqrJu6hy8MPzUunKTHotTIvNgI3j0kO11Qj1AyO1NA4B9uuZS?=
 =?us-ascii?Q?Bi6vjmP5B7KNYrOnMa5dTqJy/qgAjyjz0ywxBq0JPerkRA2RUBHEqPfAN8YK?=
 =?us-ascii?Q?joUHceClPBMBnLUGaVBaqkj+K5YdfCD5ADQzQIPKvmRf2kbErRWBXn622/4/?=
 =?us-ascii?Q?oZaQtGI+f1PexblbUtAYuEF14vbDjtGNDesrVtpik+MI/8mM7FiAo+D8ijya?=
 =?us-ascii?Q?2kHtKczY70GQT3A0gPyENiQ+wHKDwx3BYli+PQc1ArivQ6odwwSTxdJFqtCz?=
 =?us-ascii?Q?HgXe/6IAgNJZj+qERRg3ug5gjOQlx5Qzj0OykW1MQeiEnP72kggpoWi0qdyk?=
 =?us-ascii?Q?Tkv1yugeHG3pmmlGnD6zmY7/bIAGX7yt+oud9BVBCcBh89xi2GeKyoTp2a94?=
 =?us-ascii?Q?qSew4DyWKQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60d4bd36-b911-425b-3d83-08de83d6ab8d
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 03:38:36.1811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lh9a4SlSZLdZpTRvCXndmYktDFrkm+iy5qQEq3VoHIVswiZT5qPYDWf6D+1jICiurXFiDS0cl7C2y2SzudLDBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9565

Check value of is_playback_only and is_capture_only in
graph_util_parse_link_direction() and initialize playback_only and
capture_only in imx-card.c

changes in v2:
- check value of is_playback_only and is_capture_only
- add patch 2/2 to initialize playback_only and capture_only

Shengjiu Wang (2):
  ASoC: simple-card-utils: Check value of is_playback_only and
    is_capture_only
  ASoC: fsl: imx-card: initialize playback_only and capture_only

 sound/soc/fsl/imx-card.c              | 2 +-
 sound/soc/generic/simple-card-utils.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.34.1

