Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010047.outbound.protection.outlook.com [52.101.228.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5062B3630B9
	for <linux-sound@vger.kernel.org>; Tue,  2 Jun 2026 02:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780368945; cv=fail; b=i7VP77bgv5HVTCzpsvyEsdzFoA9HBns0Pwz21O3ujsZqV8r9lV08Hz1dBf7LcqMkSTpVIjEwFfpGoQXbymS/Px0OGZBDj+5TrREYT9RbLQ5ODk9R3PVdlBmmoCAeh/uVu4dTpiAd6NnQpECR7T4Z9KWahx05zviFvg+jT6xIPA8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780368945; c=relaxed/simple;
	bh=rW+0xhEn18U1VOglLoUmyc/r93CcrGTelZ+1RLH99jc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=HWkHs4EZVN+ZA5mo8nUVnzejq1wbSD/fXirSw+rfxBPz2U8w8AzxGijArP8Z4zD24EDF9lMxIwgS89KI98l999LX+PfLdXhczg3gDczNDPHaE8Jb4gJB/4dTIjq6Gb9+dRFwWlECtw965JFKDR956DE6OsDwoE6MwaOfhGBtFbs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=QF660s0h; arc=fail smtp.client-ip=52.101.228.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="QF660s0h"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A7KJK0g+CFzsvHpRp38ImQAdAKgjaNmqGQbQXdOj5HBmv7oHb3obDxJJ3J47pEGfxc0NvoNlTCZYh0UnZU4qiRGE+NfuUXztWeZNvaWMninp5eOWYKI8r+yfBJ8o+sq2VMxflz6DOuxTkKyC0xRUJLK82u+RLjvuutLVoEWAZF5KonkHTC3vzuBerF9YtlNDItIi81y464btUpgMj6CIilPhyanpLayNKvXyS1RRyoF66mVh/sDVExUsUFrBc8nmhxNyec+oOjKd+VEI31yeL55RbxcbiWVJR+6Xrr59HPGns6F9LR/W0bJUp9NkjL042HQjLYdbKxbRWRQtlLhQGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ID9na8J0eoVGEveWj2CR6ZDeu7zauR9w0JbNLMO3T2w=;
 b=P5VO4s6JSqYiFjXK16VqTMG6cnBolVg28sTVQZdPPhDueX7zzCWZXkO7vxSbgbIhfxunxRgqFgepp3W60O/hmOL6DuOc9v70A25tLp4heit3enKrnuoIHAWJO5f+jAKrSQ3Hu6vEXzjJy63GkxRn6z2ELJak9+XRZZM5sKyzwRrxjqpwAA/X29buPseZ5dQ0Vwryf9/jcgym5eutkjk3SCKcMAJIzvE2eGswliEc5GtNV4/lIiAB60KSoe8izaqnPTDDxQhcajJCcvFxoenE71hvKKRKL49agXJzUMey81HZp5bW1ermg39SFWFW0NCHo9UvAEprV2DgNpuPN75dAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ID9na8J0eoVGEveWj2CR6ZDeu7zauR9w0JbNLMO3T2w=;
 b=QF660s0hCoO9CTaMKmzC4JgPmPXbNVj6vQhY3UKhiuv99ysBjm7WXXLh0ydYlGZ3aXFPCMWKpK/AJWhATuyHy4HIBSfacP5JL7qfKkSds5RZFYEjJEB5R9amgwM3toaVX/Sr3u9ljsI8BUYKeobCbLPp+M6bP2yvWP9pZVi1w/8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYRPR01MB13216.jpnprd01.prod.outlook.com (2603:1096:405:113::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.17; Tue, 2 Jun 2026
 02:55:42 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 02:55:41 +0000
Message-ID: <87ik81k5w2.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/6] ASoC: fsl: imx-pcm-rpmsg: set debugfs_prefix via Component driver
To: Mark Brown <broonie@kernel.org>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	linux-sound@vger.kernel.org
In-Reply-To: <87ldcxk5wz.wl-kuninori.morimoto.gx@renesas.com>
References: <87ldcxk5wz.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 2 Jun 2026 02:55:41 +0000
X-ClientProxiedBy: TYCP286CA0101.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::14) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYRPR01MB13216:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b4040ae-6020-46fb-ed04-08dec0526f25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|22082099003|18002099003|11063799006|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info:
	K0DDPwntpipQwUjhZ+E6vnIiZWyTAqcbiVW7tbuQytmNH0TT2o3lmPlwidjE7+wy90vPJC4CJtBZFPSaES+0gqNpfQ9EucszoNATmFrhNJaAlPFRi92tQa6c3u2PCijUMZWeBKB5rqly5Aaat8diUrD+RSH4Bp8Fsnjm1ri2WIFlfFggzowUxFpgZvQO4WGXwFIpSAgdCV+pXZkmomYOJhmeo8cmtoXAuvyRw0/vbiGv7E5NokDs9LulmJ6ftq5bTHPdsF7nygKea0arJwdON6MiyXStNcqxnuFNkUIsWUfOSqVE1XZFP8GEYl+BxLOWELakGtYtEBpxFAMz+MeZtvu5YB9qtCk68Vr8o15rr8rfC2ovpYlt5z3ZJoLxpe3Lj3kpJqW0GRUHkaYIRM2olMnPNoBE4HEoFx7JUokkdUUWVeHoTtf/RzpAEWuF0n9/B6SV9i/rT/UOjJC+zExOEdDZgUh9Q4tqQOxUJB/OEscsuZ/PhGubcFvBMohl64Njf2RXLeQYBAieuYOH1oJWe82Y8BOvtj2VjnGkaxphYlMcoojObTMJ+cEBsfq7LoV/uznWzSEgSAc53l7hA0wbHtAYrN/EOtw9MX0U3sy7DOtfVppeWSj99M1D/NjM7/6pEQh/Uu13omUhm0KqCoOSlWyzQ2JRK70/5jGNZYKHCOtpFbOHcAsaZI9ItA8Z+nKpjMljtPMj7ntcStXXF7UGnqu1MiUXDOZNdeLmdISSCqVffZBWJyEogY1K15N/CGiP
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(22082099003)(18002099003)(11063799006)(56012099006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Vj7vEc8TCsAMsaDNBezcFc+NgJ6rikPZnx3ZLoMasSFIrHUTYoEwZvYl+saF?=
 =?us-ascii?Q?RfKFsf6V7/279Dh2a04xu/kAQtZJJzZx8qGcoaEFYzQpxP7w1OlORobCjR5H?=
 =?us-ascii?Q?77mU82lwroyqzODBsU9GKuwzYy8FbmE+UBXqGLamEkp9gZUG/WcKOe6C8K10?=
 =?us-ascii?Q?d8+WVv1/PGevX+kqSk6J96psTSWeOQps9LxKN52FXPzdg/0+vpEjPRGRmW5g?=
 =?us-ascii?Q?D3wtGbaq8JJ2DcS8TTk8b8xzZM5UQeJDIPecPYU4/8y/KGxNpGa12pF46qfW?=
 =?us-ascii?Q?DoRUNPaxPqV5fxnzg2eGP750ia2FJ+/y9d9i1mb0gfoRzZ7Kno+vTZaH4p6z?=
 =?us-ascii?Q?lhSPPVolAVd9dNxJdse1z7Y2zOaULknzRWEzyPvKrKy33XNJSlQJWBa1kUzv?=
 =?us-ascii?Q?Z15OkbJTa7/xtorBhGWBUCLbtk005OW9+1k6hUDCJEInISdbdLgu2NUNyqRH?=
 =?us-ascii?Q?+LYkhlNLglEvr8dVq0/ePq5wD64fUXVfOPuywQxYMoWh+KCn1WBVOqoK+qJ9?=
 =?us-ascii?Q?4jVeAndhgqEix/QMy61DvW6ScvnmtH2KZzB5dwyaHwEg8wGFfikfK2MprF9U?=
 =?us-ascii?Q?qWeNmg3cVqkuFGsyVJevnt2xiNTxOycoK7biiaMQ/88XWhFLK/bPUVpYYzcs?=
 =?us-ascii?Q?myV+/AGDJQsP6vww5G/Z/dIkoQUjrmsSG40kOigQZSQaEuTsFa+5Zgcb6iId?=
 =?us-ascii?Q?1MQsITCWcp8VCfBheaTICV868dpv4r/7HDj1UGQy4KRXdTzOrleu4pTlQAIF?=
 =?us-ascii?Q?yU2KTHVHtHIuwEKmrLQ3/kPE617RJyLhOcx7cB90F77O4/xUjsQYGcIfep5X?=
 =?us-ascii?Q?XrpS0VGOfyneT4H9KPBmbccfW+WPqbaKut1bYBbfmNi31e17ZTbEfg8RUm/+?=
 =?us-ascii?Q?96PHVQZCJG0weYgk7bN7A52orZ+Gh39lxKNu6xbfZevF313642Kxh+6ix6Rw?=
 =?us-ascii?Q?Ky2pmcHaNqXfLtyWwjQmzZ0oDPHhem9LT8m19on3qun0NfPcDZ4K9wOiJr1y?=
 =?us-ascii?Q?YmLK4sasNWrS6uUob87oKfUSh3s3YkuHx3xpkgskle0U6mnExccpzApEQomx?=
 =?us-ascii?Q?+eAT+MqDsOw7+0810zZBpOhx609w6jDY5+nq0irJvMXZ49CAPEU4i3GSs6de?=
 =?us-ascii?Q?Qeix1cPkHAvK3z/YESlOw8L0R9VR9gNJcZQclVJVRZ2BYE5fqN6x7CEEtGtY?=
 =?us-ascii?Q?cqLmZCtll8cO1MnqrTUUCRR9iKX0YtvluJfT57riQFSwq2gE4kaOpq3jj4Ue?=
 =?us-ascii?Q?tFxHtTE/Hkrq1q8cUV7UsTcRqxXNiQSlJ0eL45MbV3b/qr9sTIIcwvb/kFq+?=
 =?us-ascii?Q?o5XoRwi+kF8Hln22bQ4tIJFbVw+BRYaM10tjyujKwT300enzfkONLvzJWiWU?=
 =?us-ascii?Q?N7PBVjRaJ6RO44mHVZQlfuULSVtgZBGtMtBny/kNcJtK31ZYxPJ2UDHCDOTq?=
 =?us-ascii?Q?WERCehFc3Nwko9oF1ySsUywMT4A70FwcTeIXgaFtJ/v6jChZr2CQQWpnWqaq?=
 =?us-ascii?Q?E3vHzXbIxuBWFdZrTtiBsIIem6n50A+9b7EPqSlf8OS2NnzVRfLO1CRSaAZe?=
 =?us-ascii?Q?3gc1QdcPJCmgoX6CAvf7yKPiseaiqmpxmYz1nhUPSBfDRhsYWTAVez2nS2z3?=
 =?us-ascii?Q?VwkbcANFGjDzomysK2sqThg74/rXKDb/NNA6HjPTznCDVRHoaM0taSdEczuQ?=
 =?us-ascii?Q?HN83vA4k3+VMHPEXBW+15PmO9DaHYMkZ8W7qjyTNIP4giHC7HKw2N5fj70cP?=
 =?us-ascii?Q?Vp8L1H0HZt5lQSybUBOLDCOG+rhhH2ZB047xoMd3eqSZi/KJfMXs?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b4040ae-6020-46fb-ed04-08dec0526f25
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 02:55:41.9383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 814FMG4x8ijbP62YzVeBzLhrvkwSVYFb43iWetppEKJphMv3G2kOH6GPq5EoYYlhuF1Ozt0+EC3UH0okQ6SM/Sk9BK0ZTZ3yU7pnyUr1KjbVwFmZ7ZTQDyuy1Th1P12T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13216

We can set component->debugfs_prefix via component_driver->debugfs_prefix.
Use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/fsl/imx-pcm-rpmsg.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/sound/soc/fsl/imx-pcm-rpmsg.c b/sound/soc/fsl/imx-pcm-rpmsg.c
index 031e5272215d4..2a4813c6cda96 100644
--- a/sound/soc/fsl/imx-pcm-rpmsg.c
+++ b/sound/soc/fsl/imx-pcm-rpmsg.c
@@ -632,6 +632,7 @@ static const struct snd_soc_component_driver imx_rpmsg_soc_component = {
 	.pointer	= imx_rpmsg_pcm_pointer,
 	.ack		= imx_rpmsg_pcm_ack,
 	.prepare	= imx_rpmsg_pcm_prepare,
+	.debugfs_prefix	= "rpmsg",
 };
 
 static void imx_rpmsg_pcm_work(struct work_struct *work)
@@ -689,7 +690,6 @@ static void imx_rpmsg_pcm_work(struct work_struct *work)
 
 static int imx_rpmsg_pcm_probe(struct platform_device *pdev)
 {
-	struct snd_soc_component *component;
 	struct rpmsg_info *info;
 	int ret, i;
 
@@ -741,16 +741,6 @@ static int imx_rpmsg_pcm_probe(struct platform_device *pdev)
 	if (ret)
 		goto fail;
 
-	component = snd_soc_lookup_component(&pdev->dev, NULL);
-	if (!component) {
-		ret = -EINVAL;
-		goto fail;
-	}
-
-#ifdef CONFIG_DEBUG_FS
-	component->debugfs_prefix = "rpmsg";
-#endif
-
 	return 0;
 
 fail:
-- 
2.43.0

