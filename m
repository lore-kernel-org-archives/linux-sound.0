Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013011.outbound.protection.outlook.com [52.101.72.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9832A3C3BE5;
	Mon, 30 Mar 2026 11:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774869889; cv=fail; b=eJUD5oln9HhOMKpkHsY/oSDsOI9AZzZOKBGItz1PWQ6hQJvGzerV6gNPh+52gOPMHiNlyxwXnqcc/PIwa894jJLPAorYV5E7QganelnBkUQ9E2sOadPo2G8dfNqRxhlQ3PYwPyqbt46ONH63btlPVKBjUWNJFAnwRubArDB7F2Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774869889; c=relaxed/simple;
	bh=eYMFVQaCAmuTgSX97pLRtA+GQy7mr0h63BXRTT9qpqM=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QcKOvBojFlBcC7wQMXGFOi5d8bcSujohZYY7H93j13A23r6JjazS9QRwD7LXHE3CU54o1RnV8+b+kZiVpEWJcr0Y5uUIc3Xucm7G0zkFRi+4ecKDaCmBPTrWj0Ko2I4DSCR35+6marXMYIo/tBetkQpO2NProHuZmHkN5VbL7/g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hZdDHnb5; arc=fail smtp.client-ip=52.101.72.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hZdDHnb5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TrOTJWEfTJHalj+1qjn5FTMJ9JGbkut/OxzmEsjHNB8eL5gwqtMGWGIaUTDtzoK5IhuQ7hzj8zIpka5F3nKY/+pbAyS6iOamMKlAcSEaZr9/wkNfO8Yi0pdBGynLWXrGCUiAIzqL7JsX/YGaJzV5Gq5MFNSwmQs3yyW+z8CsF07gmpTcMjjixbw3a70NQJioBDTYYGzCxVUYTR6sn6hH5J14uNm1zDO5XxEb7TtrFW0qK/MBI304NX1S7Iq4UVPZj4wSNsOAvxH8cOHynxB6CpZEUM/f7C4N+2ovvai37hDgkbB91qQREviibC1Zkt1VwuRIB+7tuJljOSNxeX9EBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FmrTItx47rJ0HdJvNf6wHuSfObpE19m86nMqe1jrQsE=;
 b=pQitCvdpQYLl79NE7KdnEcLYIfIvZoBXyHH5SG6xNQthPiZvySG4c0hHGEapNIcIxt/ezEU0JF2rz0NOAJdO12nzB9R5xKKrLYqsEfh+W2mFgTRMv1uTrCmSMtoz8LnPq70DHhQLgn0cqkfYSDX4PBOWN1XDxk8ancwW9gDYAuvETgdIedKDRUsWoRYmGAP35re9cDTB5gRgdNg158nNQbR+cR8RD3skTSs6vMS0YkTYa6tCwx/S64RR6LYVRBWa/q6A9z+rCpK0Ivsl/etCEqGfdH3DUTlVzuuikgbxt3XNyzS1QlzILUrgBeBdvzZoHSYUBa1yISGsngy2hE5oaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FmrTItx47rJ0HdJvNf6wHuSfObpE19m86nMqe1jrQsE=;
 b=hZdDHnb5tUDbFKZigHAsRtJZ+Z7W/AXhh09Hb0LcPIQ9mluNymyxX9KrLmR/Z2QCRj/HF1hpvpdF8G/JK/u11Amry7vrnl1Bz/7jlhEzvAX6a1PP4FT/PCijwugZQ5rzIByFnJTOXCsZdzjp9T1HmvIIB/1rTmE9JnMf+Acn2nfRll0irdvIg1PW2aP+B7m+4SwyKgR5kaHcM5FnczzduQvoLiwG78A4fB/fYyO1G+9lQwLWO2epwDQ0oPeCrFMaMAiWWPT8K5i6a7jLwmeEbvYZVXW6Ov0D8Elgu7ZWMfzIcAAGTvwGXrcrp35TXKkDsAgdVCvemFr2GUlzjyb/Xg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by PA1PR04MB11036.eurprd04.prod.outlook.com (2603:10a6:102:48b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 30 Mar
 2026 11:24:45 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%4]) with mapi id 15.20.9745.027; Mon, 30 Mar 2026
 11:24:44 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 04/11] ASoC: fsl_micfil: Fix event generation in micfil_range_set()
Date: Mon, 30 Mar 2026 19:25:48 +0800
Message-Id: <20260330112555.3637002-5-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260330112555.3637002-1-shengjiu.wang@nxp.com>
References: <20260330112555.3637002-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0009.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::10) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|PA1PR04MB11036:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e4e95f7-179c-4613-9a56-08de8e4ef1c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|7416014|52116014|376014|366016|56012099003|22082099003|18002099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	mbDsMCYUwLex/h0F0ial4DS4ticLgysOQhUON2/RpNX64waCgrD/jTE1jKRJOCiBu9GGuYlsvU0iyH6oRq3PcgO2sJPYqAznxkTWWsRNvTB7JlRtrHY2oPhx8XSn19iYfLbQTOFo/9vvl7YfsS4tuAyifD+WId9iJT7Bt4OUKmoSyL9npzdYWrrjP++oCY6WlK+D2q6e3/pmapg8oHg74FEKPlTBKRy38Cp+eD7sBkRvPusXGDZWE5CGeFbAk2EdLYLfpT3vgsqV4z5dg40Ok+SP1iAalOX0fh+6MPxX4cJ/iukev0RuinMEUEc6d4xdQPlahqNSVI5qur/W3XBTyly/sDd8RpKCheoOhKMlHfWrCoepqcNyPRtfH6tOKX8uiEoUL7JpNNQTjhjOJ1NYawlOkLOlvfDEphL5ikYKg8eD81VAz5T0278c3KNnigYsz6nHLuigZGuoQVxQkd5j6fVBeu1cI1jnHdShhB28dMOFSvPpgSz2r+8SUb5kjjFL9NURcTEGKNjY6/euKzPnD7qHuPTmZSEcUqjQUW8O2bhDYvkekcJQIv30s06yESx51vRTq2jyIXNC2pneMlrMRCC+NgeDofOLI1OJh8zcx2GA2sJj6xM3jSa/Tf56jYPkjhuqiA1mGwztrd4nGScG+84KVq+UvdoCJ0Rq8ZiJKE0XDxaiUIFa3m+TdpqC5xzDKmf8Nz+RRMfhYFmjNxNv7vsJDniENQ9zr5Ym3qd77X4tPJmnWBWgkTT6ovoCWnROjWGJHCjkj1DOm1vkckKyENy7LSh/v2schSxpcE06bE/gixqnK6977gM06vJmRtPW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(7416014)(52116014)(376014)(366016)(56012099003)(22082099003)(18002099003)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?050cTbG6Cm/jlDFQEfbC8czzUDHj46MGCyrQKYZppT6yxaZ5y93CBWRhzwOw?=
 =?us-ascii?Q?AV2j31GEd0DRZWwbijL35bj2j9zYn0TrEOmVKTdnOd+iCwP5cq2Gspda5jSe?=
 =?us-ascii?Q?bIIsRej4/EytGCAA8aF371qEHgHE8Nsex2vdo/rZnu3GnEEvjELhl7BKWXkK?=
 =?us-ascii?Q?NO1GQ5RmiPueG8kEXYU2Mf9aMPWz1epJcOcdklhEo+pmJoVS4/Jl7vthRFBm?=
 =?us-ascii?Q?/LYwZj9NX0pBuJDfAuY1JJY+bI7vUw5rLBU16U2TJP5wL0j9rolv7b+g5ZS7?=
 =?us-ascii?Q?LlHPlsYgIsAQ77nlEiYLQ9YSTzr7aPBOwbI0j2lrt7Hs3tYzvVP1rBviDy6u?=
 =?us-ascii?Q?yMj5V9ympLsjwJzR1fUriqQz58eVFQXl9ty0M6gyANhyYKFg07vN8rBGuWUe?=
 =?us-ascii?Q?1lu4n9aGNbaEmiJB1O4/GjaonWEDJLdrB0z3MnfgQBi/09ozBXCsMTs3O2vC?=
 =?us-ascii?Q?ZM8Va55Ls1w9OAxmOnRQZwhNe3/BZPYXiWo8s0OwokB4m/mQTxVUegIAkGG3?=
 =?us-ascii?Q?wcueh7m9Cts702eS53Ia2UVIgjsCsU8JKAdMvFeAhUES9a34giGV3TafmwIs?=
 =?us-ascii?Q?gPJxm53clrK+qurFuw/7S38e7irQKgI2GwyNa8QiPRMH6sZu3sLdvuI8seSu?=
 =?us-ascii?Q?7h/nQt2slI9kJs4/IaR2olmNcRqeVyIOSpwa74jB8/+FYAENjAmD1/kgGdWt?=
 =?us-ascii?Q?Ewv0XNzLZjjxApLH2p/mWCi4NzhjX/Uc4rf6t4UmxaFAL7JGtjusy084bc0v?=
 =?us-ascii?Q?TUv0LWCR/j6ZBOOymh4TjAAa2rSbDSuI9wuoreZlBdHSJCpAgeJbQfYWzueR?=
 =?us-ascii?Q?hy0JLZOVMaYI7D9Z9Ez80Ay2kOLW8iz8YdjLwdeNl0lw6XjtSFtMQNz7TsRr?=
 =?us-ascii?Q?J4E7yP8NCCeUSh3UzqGZ9CwSpU4m2CDUFKqJiYhc5f9+rmJPlgrkqnPyim9c?=
 =?us-ascii?Q?Rpsb3WGYZ0b5+DL0IUWG4XeQ2n4e60umFHD5DoE2ZiM9XuQ52F5EK0NmExz7?=
 =?us-ascii?Q?Wld2DpUzRSUoRu7QXCy/WLwXJIxv4/as/oEWWNukYzrLtGNmbXndAR1TMcxO?=
 =?us-ascii?Q?Ft/0cgptSEahJh2g50ZnYi9EkbC+ht7Yp7oJlWGLZAfwtXyIXOGGXpK7LgcF?=
 =?us-ascii?Q?W4PHdin09jfLqeTj/YKM7jqtHPPsHbGaBZK2vyG1Ia7ESEVVWYPBuW4cju+d?=
 =?us-ascii?Q?sr4PkbMJP5ZIviV1wkqEAgWqy5KYxdXgXwHYDcaXWE94ltYO2jmUEXiIhyEh?=
 =?us-ascii?Q?AJGwTTzt38CvMNZkppsYz6zmzsHHHdZgC89otuZK5VEWj+Vob1+NxV76aUCs?=
 =?us-ascii?Q?EPUWmAofH9xCgI+aVqH3iZ2+svb88/4dTq2XVfCr+xajoeb8OrIDysu86f8+?=
 =?us-ascii?Q?ZBc2eVwKagRU+q8A6wsw0fwBHLPMbVg9enXIWKDhEBZdNwpk27t7vPWKmbu+?=
 =?us-ascii?Q?x2mlZde10JO5rDm99L/qlZZlxq5gvN7slKkljmOHzbNNTojvRQrNlctkTrxn?=
 =?us-ascii?Q?2UsxKBbXlJ6a3eMMUbp0QRYyxhPzPbNAIWjl5jeabUrhWZkcT91HanVR9ziq?=
 =?us-ascii?Q?d2zpDN/4W22sMYqwMHL0WhhpdHAj/iDdsfLMjd4we6CQdbD1tNYcojbqY8Ta?=
 =?us-ascii?Q?/uNbIl11BtzammD8YFBGoK9GgOF11EBITxp84tB0UwHn9OEgWs9PVsSGr6M7?=
 =?us-ascii?Q?CaBJSjVVDiUCATxGPH2KN0g6bDDRyUz6i2QwvttEBZDIWj0d0gSOmJ8ctrSN?=
 =?us-ascii?Q?ETMRAD77TA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e4e95f7-179c-4613-9a56-08de8e4ef1c3
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 11:24:44.9015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yyn3h8Gvc5m+5Zb1qy9bYF9bjR3ij9/IkTGWywfUwRgG+LorjTxlzdcZoh9JiEjSY2pBaQRwGn47mG5BsDc+qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11036

ALSA controls should return 1 if the value in the control changed but the
control put operation micfil_range_set() only returns 0 or a negative
error code, causing ALSA to not generate any change events.

Use snd_soc_component_update_bits() function to replace the
regmap_update_bits(), for snd_soc_component_update_bits() has the
capability of return check status.

Also enable pm runtime before calling the function
snd_soc_component_update_bits() to make the regmap cache data align with
the value in hardware.

Fixes: ef1a7e02fdb7 ("ASoC: fsl_micfil: Set channel range control")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_micfil.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
index 1c826e0cb1d5..0cfdd6343291 100644
--- a/sound/soc/fsl/fsl_micfil.c
+++ b/sound/soc/fsl/fsl_micfil.c
@@ -210,15 +210,23 @@ static int micfil_range_set(struct snd_kcontrol *kcontrol,
 		(struct soc_mixer_control *)kcontrol->private_value;
 	unsigned int shift = mc->shift;
 	int max_range, new_range;
+	int ret;
 
 	new_range = ucontrol->value.integer.value[0];
 	max_range = micfil_get_max_range(micfil);
 	if (new_range > max_range)
 		dev_warn(&micfil->pdev->dev, "range makes channel %d data unreliable\n", shift / 4);
 
-	regmap_update_bits(micfil->regmap, REG_MICFIL_OUT_CTRL, 0xF << shift, new_range << shift);
+	ret = pm_runtime_resume_and_get(cmpnt->dev);
+	if (ret)
+		return ret;
 
-	return 0;
+	ret = snd_soc_component_update_bits(cmpnt, REG_MICFIL_OUT_CTRL, 0xF << shift,
+					    new_range << shift);
+
+	pm_runtime_put_autosuspend(cmpnt->dev);
+
+	return ret;
 }
 
 static int micfil_set_quality(struct fsl_micfil *micfil)
-- 
2.34.1

