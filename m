Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011069.outbound.protection.outlook.com [52.101.125.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAA53921E7
	for <linux-sound@vger.kernel.org>; Wed, 22 Apr 2026 03:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776827072; cv=fail; b=GELDYnGpAa3+rjxp67AJviUFO80Uz+MMxC0ANsClijnVHNvd3iKEDdJbO/P8NAv+LSTch6xvuplCKAYxn7uziXgfegYgmQoJvyVwsPcqi2dIiVnOKe03GrOmC9baZBvHckdMoqdUMzBGBFFQPMjDA0fid9oaxv85F9VOFxqbTgc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776827072; c=relaxed/simple;
	bh=c65OoAeW7njykk5tN+HOjSGAYvasfw/tUodbaU5t81A=;
	h=Message-ID:From:To:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ocI+Y5HRmu+iIre0fJJw2tkqvEMCz84eLurCwkOhV0zkqmDMuVxfVgct309EJlYyLI6Lvcp9i+rOD22dPcyoHukA17EZ+6z5yFYUP+o1eDI6y6dldzzqTNUD1bmLch6o2ISW73Axadzzl1/HhFsJWoYy9QRCw4JYPr9kXIncK/E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=dmcHpoIr; arc=fail smtp.client-ip=52.101.125.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="dmcHpoIr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LbD53VOa2y7yUtCbkaWK3F+P6DxyKJod10uZhnN25Z5hKegZ4hGr23tTQqPRp05/w6kwf8vp0z37Qe4emC8+fUz29LduBRb/NwJQB7PVCBjdbxuiWIx7fnSnJ2W/ALdoFAbBTvovNI7VkgoePfeuwGUKsRc5mNx8zNORkal3Y3htmMBdUh9dCS2qZRMrrlhnN6JRg2h3cv3FPjktV4ZnwGVXkx3N4WmvT8+q00kpR4/yGNZtvhlB37YWt5xq1W3p2+NdTWOfVTfzlBGDXC/JFs9IOCNC4FIrrS/LWF3VfHBpY/pweZSoFjHGks4yrbs7D5ZmFodf9nRwt6EkelJBPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=72hrR1HqfX+PG8BBn2/CjEYq+dgS1sYlySb9N9mdGoo=;
 b=KVPkRHPuoL/Nn8wFrcGYAcbVV6pNNf4Qz2rffEnS8zjoVZYdYLX0NstqNmR6LM4Vi4cFMi2l37oGsaQhRL3sZwP02nvUaSihCPKry0JX4NlHYEYIcchiAmipkcZj3FzefSItyhdNeRRtfuXkYOw/xWBqHYKBoyurCuTaahYphOm0vPAwoegNzMABAME54opiUsZWFDybMpNqqOC32F9iiclT62Qs+xhjwk8q/87FMhll040kgo8ZgxdbSWrKCGfqjuRpbHNuV2fE5vK1Py+tfJbWStUjOMB+zqex9UBUAtOrWeuT4KxwRbe1tBAcca3QueDP7gjmellkZ/bvvWJiAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=72hrR1HqfX+PG8BBn2/CjEYq+dgS1sYlySb9N9mdGoo=;
 b=dmcHpoIrWscvHTl/0Lb6kEAkO2n/p1vXR3p0iNzSTwP9oQULxz13b4Kfd5LHk1Hh72ZOVPUXLPbWVtECGHS3clZR+eOUEoIJumAfhTWK1kNPxQpBBX2FSxdLnFc5Ck12ABS+wRPmg5EPYlQlusCQqldX1lFPW1GZJd1eKPAifKw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OSCPR01MB14402.jpnprd01.prod.outlook.com (2603:1096:604:3a4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Wed, 22 Apr
 2026 03:04:22 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9846.016; Wed, 22 Apr 2026
 03:04:22 +0000
Message-ID: <87cxzrk85m.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, Cezary Rojewski <cezary.rojewski@intel.com>, linux-sound@vger.kernel.org
Subject: [RFC][PATCH v4 1/2] ASoC: topology: make sure to call snd_soc_remove_pcm_runtime()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
In-Reply-To: <87eck7k868.wl-kuninori.morimoto.gx@renesas.com>
References: <87eck7k868.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 22 Apr 2026 03:04:22 +0000
X-ClientProxiedBy: TYWP286CA0032.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::16) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OSCPR01MB14402:EE_
X-MS-Office365-Filtering-Correlation-Id: ee26ba88-1134-4f6e-60c2-08dea01bda67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	h7v1znWitjqkF2rWXsSKP/6RxeHMmIz1lTyz7oBiwk23iCHKwlGkFE+NU7eEvC0YcwtS3l/rz4IvuoBv9C6n4P4lw7UC6SDqnD5fdQwD9ZQw0qiyqOZ2PVX3/jBQXdKgSAfGup4Re3TD0iyo5panI6Qf9Q58CbBDR7992WrRXLU9HW9vjI2QO2lcTWmN2m8S8qFNA0JUSUvCHqoKx5De1PGc+BE4lpytlg3MeZngg0ZrFISQsjP6k+3ivngQXvCXYw05JYXy/0drSnd/dAvCKphWLMtFTMY4tPCieMaEJjOmR1YYO/jKOSNkXZTd6upPw4UBmEyeCeT0+K9vIt1N6ArUZGPLW4gooE+EjsgwJSSA0UwluGJoqF27xD2QV3YXk1fTJj9E68tC0RDYQpN0+RnDjbMBkZ0ri+5xqaF9ZBcZ0gB9ZygEP5DKkUIbqNt93W91l3Af0Wuj7uM+VATS545kS69hoEQRC2F3pLg+PAQnxIKu4IoAMX98YPwsaOeqeMnGnEUIEpMzRafXS8GTfjUU9jGKZLnStkonZpgpgryR2UBKNpimi/agtwJl46/1Bmee0/iXdbEAnhRwvgfiG5okqpRJtucms+m5uUSVh4IrUIKZrh9RvZwtxfkJo48Hq1+/LcEDPQHS5iOOPY7w2xT+BsKN2MgTmn0MmTm0Fu/wnnBXumqDcR/fn0/KsVFN56locTXrBzQ66PuUyS+CSMpfV8hjLK4YxYa4dwzimh9yKsZbXwoFmHzzNLeSfo5bWKyh3Cf5tBdMhv76PectBeWYP2+TknG/54l4jP965Yg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Bsk5RSfuQ33QoUXCSLxeNvR0kwCQAattDOYxV9GegdTojfzIpRf6T4QjO5Sh?=
 =?us-ascii?Q?j3UAA+kxRRcdoUvl3zQ1UCoWChblIfuaCdVVu8UV9EB2eDAuVBD3q8ZmQ0Zi?=
 =?us-ascii?Q?hTA2aGdxsc1sfkU3JcaIXNZ8Z6yVE9hpCe1oT7feXaqgk1gUSMHHaQh2tAbJ?=
 =?us-ascii?Q?9sOx80F8ffbHRSp21djAbpyYKUMFnNdV2y0E5Pjddgx/lqRbbl+RZ9x4o2ZC?=
 =?us-ascii?Q?CbL+t/ExmVX/EgWkmUYfbR5BksoSckxkrpd+ywvqqPn/wUSduuE+7f5nbeUw?=
 =?us-ascii?Q?WdMxY+CqM79WbwArtf0FPYnHWjQXMosE5ELRK2+PpIwCgLZp5HvcJl4crGLN?=
 =?us-ascii?Q?xIvnwmeWTJ6PynHTuEfOiknjjhqAbTuFygrK4l4JsuvY0DT2/kGdcxenF9al?=
 =?us-ascii?Q?ZKvmYnjMvDCmMLqEvnSp11RCx3aknYVbWJ2GI8kl+gbX1GFw3SG1i/7rsGpC?=
 =?us-ascii?Q?3KLcvSDogwEQ0hBF916exYdK8yFP52mVoZsr7Hb63VEDih6BbKqwUrf5CVPF?=
 =?us-ascii?Q?shRzXomdGItdHP5LKOmPMS1aZdH+zugIKFZPi1GYMXSXdvXGdDlfkR9VmWQ5?=
 =?us-ascii?Q?kskd1RvHtrX1WYorWpRFdDWHFoOjtV2akNnvpd14gLSfascMrmwkMuUVOHFm?=
 =?us-ascii?Q?3fT2qVfuNVYYx00Rv8EYWWgtOeBWfCkvyNaTOrdbEdgcZedV9AdX6oJN18Nj?=
 =?us-ascii?Q?Lc5CV0yplgawuwApig6I5jiQRt4DMabxxruJXYktOeRNE5fHEqQmt7QU6j0A?=
 =?us-ascii?Q?/SqbLxeMJLXCuoWppd+G2B4oSXq/Wc5Lm35rfKgXgP7AFvlDdEv7jmOZ/XHB?=
 =?us-ascii?Q?a9kIw8Y29BT2i2K9Xpz1I1rvJhCxs0w4l/3N8r5WSkzvrgX/CU/7C1wiztWP?=
 =?us-ascii?Q?ZL/aDDerWSe62iC66YO2/bOihduloLvuh8UVqqo2w+LjVKJMuTBrp8vOSatu?=
 =?us-ascii?Q?2GRXVOnWOJJis/LfEl7m00T5zmx3xD6vgIEcuymTAwpqukuWmTqi5USlehxp?=
 =?us-ascii?Q?Z4AaZLUtGYR9rtl3ocxhIsALovOavZMIdexejYdxH31jpWE31/N05QkW0jpN?=
 =?us-ascii?Q?Q1/S2oeSwTEwfX/aozitlxqnkEb7UrUmWRITE2xCV/cU1NqnX3bW0ht8ejYK?=
 =?us-ascii?Q?wDCPPqqjjDRkuPd6kGKSvPnylm8jcxjYoCq8FSqKoiToRCQEKGEMxH+2W4Mq?=
 =?us-ascii?Q?cG5ISPg25dwcUN0rtlJXbGl1C+cCy3CyHpaPsiVxPL1gR5iFbRYIxLDoylnG?=
 =?us-ascii?Q?3axj2BWxPue9kx1qhzgKnzAZaPjCJ06JRHpmlivlccTUlYA19uXWYtiIGt8w?=
 =?us-ascii?Q?MU++AOw1lhQM8EYFdzT98ogFSg7wPvw6tUUgDgqO+Zb2iOERWxRJo2Ysh4Ch?=
 =?us-ascii?Q?hIUaspwRiaW1FMoYlgJUqaavK8t1bYCbI4xTO98a5nOfkbNEDWiCVCibjL/c?=
 =?us-ascii?Q?Ar3MYd1PnzUD8eFMYHxnFzDKTgxcC4Bg3x4guQT+G8HRCH0wWQli+1wJD+0F?=
 =?us-ascii?Q?Mte2oOFSdaf/oHcWR9JtLenC7HawnyJHIn6tPFBXtatHbwJT4czMhd7uZF/t?=
 =?us-ascii?Q?OwN7p1XVWe3Jn8EjS0pST4kgCj5KG8mhEL6uCDDz8xJ4B2AOg0jBk/t3M1fx?=
 =?us-ascii?Q?1wdKW/HlNAAPKwq4zyR26fjxQ33L7JYBJ1c8ttSTJv+bGBdV6Z5/XnSmNKsy?=
 =?us-ascii?Q?vSUyrKkJcpToblvRrzn1z2cLcnZrrlnXGf1DT7c+oq9JnI1eNBF+xFlIAaRb?=
 =?us-ascii?Q?81DLktzy8chDua7Y1RqoUrjfTzrHzKhGkeYn0TnCoCdg7v1JOCK3?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee26ba88-1134-4f6e-60c2-08dea01bda67
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 03:04:22.3491
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J0qEHB/fmaR68QiEmiG+2lNwCv/3VUIWODK8HHBcQSraEnuoTpLFrX++abR/GJ5PrI2frNiyB+8qqEKadIrAHqvMMqNkv4qshX3uLFMTTXinfoNxipdQOSrK4kH+Vob/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14402

soc-topology will call (A), so it needs to call (B) when link was released.
Otherwise, soc_cleanup_card_resources() will access to devm_kzalloc():ed
link (= rtd->link) which was already lost in that timing.

	(A) snd_soc_add_pcm_runtimes()
	(B) snd_soc_remove_pcm_runtime()

To solve this issue, it uses devres_alloc() and call (B)

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-topology.c | 55 +++++++++++++++++++++++++++++++++++-----
 1 file changed, 49 insertions(+), 6 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 85679c8e02299..4542d6c8c01ac 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -419,6 +419,11 @@ static void soc_tplg_remove_dai(struct snd_soc_component *comp,
 	list_del(&dobj->list);
 }
 
+static void soc_tplg_remove_pcm(struct snd_soc_card *card, struct snd_soc_dai_link *link)
+{
+	snd_soc_remove_pcm_runtime(card, snd_soc_get_pcm_runtime(card, link));
+}
+
 /* remove link configurations */
 static void soc_tplg_remove_link(struct snd_soc_component *comp,
 	struct snd_soc_dobj *dobj, int pass)
@@ -436,8 +441,7 @@ static void soc_tplg_remove_link(struct snd_soc_component *comp,
 
 	/* Ignored links do not need to be removed, they are not added */
 	if (!link->ignore)
-		snd_soc_remove_pcm_runtime(comp->card,
-				snd_soc_get_pcm_runtime(comp->card, link));
+		soc_tplg_remove_pcm(comp->card, link);
 }
 
 /* unload dai link */
@@ -1463,20 +1467,51 @@ static void set_link_flags(struct snd_soc_dai_link *link,
 			1 : 0;
 }
 
+struct tplg_link {
+	struct snd_soc_card *card;			// card pointer which connect link
+	struct snd_soc_dai_link link;
+	struct snd_soc_dai_link_component dlc[3];	// cpu + codec + platform
+};
+
+static void soc_tplg_link_release(struct device *dev, void *res)
+{
+	struct tplg_link *tplg_link = *(struct tplg_link **)res;
+
+	soc_tplg_remove_pcm(tplg_link->card, &tplg_link->link);
+}
+
 /* create the FE DAI link */
 static int soc_tplg_fe_link_create(struct soc_tplg *tplg,
 	struct snd_soc_tplg_pcm *pcm)
 {
+	struct tplg_link *tplg_link;
+	struct tplg_link **ptr;
 	struct snd_soc_dai_link *link;
 	struct snd_soc_dai_link_component *dlc;
 	int ret;
 
-	/* link + cpu + codec + platform */
-	link = devm_kzalloc(tplg->dev, sizeof(*link) + (3 * sizeof(*dlc)), GFP_KERNEL);
-	if (link == NULL)
+	/*
+	 * [NOTE]
+	 *
+	 * It will call (A), so it needs to call (B) when link was released.
+	 * Otherwise, soc_cleanup_card_resources() will access to devm_kzalloc():ed
+	 * link (= rtd->link) which was already lost in that timing.
+	 *
+	 *	(A) snd_soc_add_pcm_runtimes()
+	 *	(B) snd_soc_remove_pcm_runtime()
+	 *
+	 * To solve this issue, it uses devres_alloc() and call soc_tplg_link_release()
+	 * which will call (B)
+	 */
+	tplg_link = devm_kzalloc(tplg->dev, sizeof(*tplg_link), GFP_KERNEL);
+	ptr = devres_alloc(soc_tplg_link_release, sizeof(*ptr), GFP_KERNEL);
+	if (!tplg_link || !ptr)
 		return -ENOMEM;
 
-	dlc = (struct snd_soc_dai_link_component *)(link + 1);
+	tplg_link->card = tplg->comp->card;	// will be used in soc_tplg_link_release()
+
+	link = &tplg_link->link;		// will be used in soc_tplg_link_release()
+	dlc =  tplg_link->dlc;
 
 	link->cpus	= &dlc[0];
 	link->num_cpus	 = 1;
@@ -1539,9 +1574,17 @@ static int soc_tplg_fe_link_create(struct soc_tplg *tplg,
 	if (ret < 0) {
 		if (ret != -EPROBE_DEFER)
 			dev_err(tplg->dev, "ASoC: adding FE link failed\n");
+		devres_free(ptr);
 		goto err;
 	}
 
+	/*
+	 * make sure to call snd_soc_remove_pcm_runtime()
+	 * see above [NOTE]
+	 */
+	*ptr = tplg_link;
+	devres_add(tplg->dev, ptr);
+
 	list_add(&link->dobj.list, &tplg->comp->dobj_list);
 
 	return 0;
-- 
2.43.0

