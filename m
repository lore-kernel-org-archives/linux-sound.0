Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010037.outbound.protection.outlook.com [52.101.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB563090F7
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415711; cv=fail; b=LP2/D+8J8y6LrJt/sRkMgyjj1GZtDKFla2+LkFyz1ZOYB4rw+A2iVikc52ieob5Ej8lF5t5806MNi7qazdb5DZF2fdQkb5WmY3rQfFoEeoN1sickIkXgLd4oTNqK3L25tlt7yyKEvdKSfBpmSoNpgdiT96d1mqX/KrlWJlb5/fA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415711; c=relaxed/simple;
	bh=iugM+Z1cwkswPWippOjWpyRGlMCUTe+wS099VnDxmbQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=IZSAbNlvIvTamCEVLb9Oz0d+WF20d/y73uxwSqiWFXqQauW737qlSz7WQZTMkXnYcQtgcyMC0P+QgOQ14MhzizcI1C30XTs8bjKvGDtIPfgCPzSfAx1PcEky27GHTuFIJ2Melh865646iv59qVbHbfC/CS572RjiX6b6ld2i0mk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Jc0HXp79; arc=fail smtp.client-ip=52.101.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Jc0HXp79"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ABCaZ4yTLAP3aPeBsg6DbTD3Sy06rr/jAslyZMjSA/SMMME08O7/chBUsvV70LjishXTOcSESOhghqDarq+ise94sB7ePCg0j86hhFBOdbd2Deq2g8c6S6hPGZmYFbX6Bka7khxJzZrVPvptdxyuZe75mLKupfFDi49gtp98kaGHDsliqOwvnk52xMbxX+4Nw5vaxvqd224psay7mQzNIn3C5Mp5y7Ol8+gFUnlEjeA0l8NnpPKT8/FqMBn/Teq5tD9Dvc7HqxePny69lgpCWCUjVvl3WZoZeZcsEnmRNfaXVcuQ2t9XEZB8vnL/6TO6Pnoz5NkMJRXoUopxcK7w0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ivN0j3Y5aFQfffLgh4xjAmrRkELLIw0ztgVsuv4dkgs=;
 b=nPpFaxi1xodJF6sC1SaWAiw4FTwM7nP91IwzCVpJtaC0U0F+CPAm4Df5aKeqV6UMtiHavD15LJyA8r67BM3PW9N7Rsqre34CUC0biRqDmIfwP6ZcqC/9A/u3480bv1JuCYvZFAre+SbptJXYoFMEJgpLfdT6BW4Xoj1pzhHJGq3zE/T3b8WXxA6Dj0isKZiGnuLo1IHS51PUZYEgnIxjsYXyUC3944Qtv+fG4J03tZrJo7/F2gBAX9nZTQQFeHWUjni2YuFNYGRBdpi1NVZjsgtbaf7FXFl2jVLO17+9jBfaufy4SC7icDuGtGCjQrDmIUK7DZXKPOjnwYuxZXGKPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ivN0j3Y5aFQfffLgh4xjAmrRkELLIw0ztgVsuv4dkgs=;
 b=Jc0HXp79zAc99IyAeuiWL9T67dlvGGOjY4ZnD6Wa9sYWYGUp4syqtXQBs8QKCzg41RnNnhA8AvLbGK8or29chWbBfgIS19L4NsFX9gxLpKPoZuVeHlYIB94rKU0eDFez5oA3AKP6GX6dmvD8XBD9nAexoGysTJBk8agCXCC7ICs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB12366.jpnprd01.prod.outlook.com
 (2603:1096:405:100::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:21:46 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:21:46 +0000
Message-ID: <87ecr6ru3r.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 037/139] ASoC: codecs: es8328: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:21:45 +0000
X-ClientProxiedBy: TYCP286CA0037.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB12366:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fa918e4-7cf7-4479-2bdd-08de0ad92f4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ODCSiiPrAwOEstlvYhzMZVKrj7BE2CL3hzEPtgypdEIyRfbMRJ5LXeIeCTBD?=
 =?us-ascii?Q?TFMWciDQL8LVbspnQ235lRwk/hF8tdNabH+ngIK0KZe5JzV6avzLUPMMMloz?=
 =?us-ascii?Q?cPslNwjnyPFe7246oDlvFgWRq+SanwpBlDhRJCzk/hkgy9jUyHuwYeGN0nGN?=
 =?us-ascii?Q?Ef+BHakzGAgCTU7uZ1JcVzARgX6KY+YWzcgBLUc/KzDFcqExUcF8ZYrWK5f5?=
 =?us-ascii?Q?33J6Ik0iRMGfPBVrFZy0SnqVojT+bXbihZmQsdG1DgGLth+rt4dpZnbkeUEc?=
 =?us-ascii?Q?RPCEokVN0yqbPh+TmZl91aZX6J7FU/N5Qx+UROeCwPAn+fcb0/+y5EK8otcr?=
 =?us-ascii?Q?Gu0ov20UDJZVoh/FdSIegr35esCqt3OyfRcOQ5szRpIAIHBJqHEqrc467t5Y?=
 =?us-ascii?Q?IpysthhntuUhJTjgNDoQn99ewyWx5NUYQSLkHf5Ch6FkoXhdzyNiQqSwMYbM?=
 =?us-ascii?Q?1tLJAK2I7uVxXANy8qsj+/A5RuOSjxuxSpsDhM820xn1Q7r2Vx5ctATD3kvi?=
 =?us-ascii?Q?nL9C6VdxyaOx/pjgHkdj5ZauMK2NrpTH43d73GOr7/0Fkuf2mpIQv0SC2pSi?=
 =?us-ascii?Q?rzQkROcl9DxDsQ5gubOXRJ6EKCMEn4WeRny54vK0vBXsAiDM/Ape4X8Z5k4o?=
 =?us-ascii?Q?xWBeZQ3KlNxKBMQlzoyZNPs3UsFVIptQl7BBd6yywFrnc/nwpOvyzLDqH+tL?=
 =?us-ascii?Q?Y6qMBr8U8AcgDsjOSZ8A2gnEcgcRMJi2+nelgA2vk9vZMJ6bem/gPoXX0xNS?=
 =?us-ascii?Q?U/T32leY8kIixqKqQnmcCPyMciXocqtwpZTTQKo6r87dNEmm5KO+aOFBXS7T?=
 =?us-ascii?Q?CuQCSkNCPaineE70IjksoBlvUQQZKcsjJrLfb5u24CLta3f8mKFBdH2aYYpt?=
 =?us-ascii?Q?ENXTEFGt0vasu5eYeIlTJYsfe0oxpLg1hUL3C+YkvDkD6uAT9C2xUKxsuK8z?=
 =?us-ascii?Q?IEabMQTbEtGGISAyVFqB3pv6z9Q7LQ693rDPIsGnCeUfBjCgibrtmmWshjVr?=
 =?us-ascii?Q?gwH4sakeeR+fB9QO8FgljsN4ODWnClTNouDxiDUzIsvAJ0D/0pbVKr/nK82D?=
 =?us-ascii?Q?ww50VwVi7qk/3ELycz1PFlDYaZLfZiN2JYco1/0J8gqZcKR6s2NQmweLTA2a?=
 =?us-ascii?Q?Z+jDD8zOjbSq+Xjsoi4sm4V2FK9vmr4XnJ+SaTRIkiXJfS1W96C3tfqopjRZ?=
 =?us-ascii?Q?qGkXvx5UvAJqlhJ4ibGdDcEvZjSjTEKrBWdcmTbGW+FZDIfw++wsHBBJ64xf?=
 =?us-ascii?Q?0FvXuDEL3kqvbo3Tkm3rEJYpRH759wd+4ylxPuG5YBHFuhWn31OVKvBMf2m1?=
 =?us-ascii?Q?qDSPHaMw7aHKsKiXRGwx3bmfH/Ejtnl5yAMv0nxHlM2llMvVMlzF3H4mVVc9?=
 =?us-ascii?Q?/gMLgz7K8591sZTdPVg+BH2K2ZwOYG6bus1CLai8EmV1PbP+3DOc3x+tG6t5?=
 =?us-ascii?Q?PyoZBchodr4L6SmUxGH+5gsKTi633CEeoj67t7s3l6VmxhtvwPJhF8CK66IQ?=
 =?us-ascii?Q?+vSJoU4fVrFfHME5q3pWK9HF0mrf282pVgDo?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AiuFIAU3x9sQY9wdOPfDR1Gv3d4ZMtVzTyURD8lD47A6+m35Ze5W4tVMbBka?=
 =?us-ascii?Q?aNPr192brAWQvImsaHiLDLvJyjNX8ZR/FeXkcJLa9A7h6r+AR6aedzevaQW2?=
 =?us-ascii?Q?yUaZcltWDhmhxDovPSLkXrlDjCHZjLLImL7DO53MiCvTYIZCeNLw0L7gA5wg?=
 =?us-ascii?Q?3OHKyodzoOS7gZVZH2scXZ084sO4UJY9so5m1v1z4M9wOyjp5IVxHYXb/1rb?=
 =?us-ascii?Q?NoR9jaJJNCpFcmX063+gDmi+Hqceuc5VTrdeQHb+dTetvbL/t+A6WMhaBfow?=
 =?us-ascii?Q?XEdgyyc/NHpDVeR713AmIpaXV1yBpoJQjPvVDEcc/C7/aZHBUiq7cVxemsXi?=
 =?us-ascii?Q?DeNCa213PwYkqCk8bKR4Xpdljong7GpYoFYnYyTR7sXQ2EK/6xBLFGZRBQiT?=
 =?us-ascii?Q?RhbWzySF2M5KatOslkacZ26cnQEiC7BVI08xTbhazYV+7whcq0R4rVeIb+Eu?=
 =?us-ascii?Q?byzEfqjExkMG0/ooDfOvu9L2+NOFnQzrt3nXGl32ItB6M7jxw68/JWaF91+o?=
 =?us-ascii?Q?mh1jYhQTxMmGrPOMTRVwt9oKPz85B0dmG+4WycJ7yFIwKndsiFtv9CiCwJ0Z?=
 =?us-ascii?Q?fVduoMA4DXlPhy0hvm09ggLrTKTfXD++5C3kiK6jQgy7sJSkz0lT6b25SjqO?=
 =?us-ascii?Q?ijHIzOjXnu/zNeHJVA33VD+qLQHnK7YzStg6Ryzjzx7f5Z568gAGrHiyxv62?=
 =?us-ascii?Q?TTpaRpfXzOeBSmVoTVis+gaFuNb7DfBt/DHp5/2KkYJnNaCUre6YsmcAGGY5?=
 =?us-ascii?Q?UeALeSW7x3l4J0y72POtEHrqPm/qmp6tjrahuMhI7/1mXY1kScyJ3/avu9af?=
 =?us-ascii?Q?w4UArUEU33bTRp0cJclra8Nuofv++pVp0e7I4GDzB/fz5f2GRFSFtTX6DAPy?=
 =?us-ascii?Q?KIp2+YlleZlqZwiROhd3beSodnDs4HfYjO09wW1Bt35EWVRvk8rpYrlxUOV8?=
 =?us-ascii?Q?6LIlxvtkVq2JEr9iiJ1xIT0P3WIkNPs2Vl8aQVimdt7iPzxl/jy1B0C6eKVi?=
 =?us-ascii?Q?hqnzV/ei0NssJ/7h+ktPE6EWXNCvyq8icY367DpWnDBXwd7nP6WXt8s6fmzV?=
 =?us-ascii?Q?LxCSwfGnfmRDx8Y9RXBQZx0KJQI65SL4a4T+tBRnMUr5TkOjE6gcfOJk732C?=
 =?us-ascii?Q?UOBiGk5jVwygj0OfGbIx5Vfp3RSJziJATjFiSWxpwMu7gT6ODa0lOZ3U9OFU?=
 =?us-ascii?Q?/E530WnZRWPEuZLjiipCwCAy0BvrftUdAPs4650e0cZbWgJRgMtLEv7+eM3P?=
 =?us-ascii?Q?dJS8WCP+7q5VIjiOCmpkefdK1Izdgjtw7HU4JG6jq5NBzgw5P9X0AnLnqdWS?=
 =?us-ascii?Q?dZOXbjmJRfdpBaSzUS87P6D5Qf6QvSxQe1q6+GebYbf+A7PmFkvfvp45vLYO?=
 =?us-ascii?Q?QHODWHCyZY5dCu2ErWLPu4xd3yHQbRbz+1Zx2IDdCN8M2ctVPtuSMk4wVRqe?=
 =?us-ascii?Q?jCSOjUQFcHHVGzz1giGu3b5BaW8b0b791LN+N4N9aBuT4tUypxpqBcio167K?=
 =?us-ascii?Q?IvDy5sU9ZeyG1PpoXgeRy7J47bkuDE5fyjb6XsZbEseEiHwXJAAlfoUZnsGG?=
 =?us-ascii?Q?ETNYuefz4Tf0mxNxOpXTDbyaHbEA1tKRNtOEBqQA9Fh4pD9VpU7gNWbCKCNe?=
 =?us-ascii?Q?s3yLZN0OOpPceOfLnpRrnw0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fa918e4-7cf7-4479-2bdd-08de0ad92f4b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:21:46.1632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n5Q8jitQcWb6oHdbvc23ZrdCfLepJcTmxZlHbECIDiXjKGg+KsJ3zROoyYfUByEeulaHRQu4F4G+dR8vPDzY/nlN3mYv397dsx3peJr0jKjh+WR85d96L05SnjUQXqAj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12366

We have very similar name functions (A)(B). Both gets component from
snd_kcontrol, but (A) is used in callback functions which is registered
through snd_soc_add_component_controls(), (B) is used through
snd_soc_dapm_new_widgets().

	(A) snd_soc_kcontrol_component()
	(B) snd_soc_dapm_kcontrol_component()

(B) is using very picky way to get component but using it is necessary in
ASoC. But (A) is just wrapper function to snd_kcontrol_chip(), and directly
using it without wrapper is very common way on ALSA.
To reduce confusions of similar function, let's use common way on (A).

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/es8328.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/es8328.c b/sound/soc/codecs/es8328.c
index 76159c45e6b52..e5762c6e56e66 100644
--- a/sound/soc/codecs/es8328.c
+++ b/sound/soc/codecs/es8328.c
@@ -142,7 +142,7 @@ static int es8328_set_deemph(struct snd_soc_component *component)
 static int es8328_get_deemph(struct snd_kcontrol *kcontrol,
 			     struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct es8328_priv *es8328 = snd_soc_component_get_drvdata(component);
 
 	ucontrol->value.integer.value[0] = es8328->deemph;
@@ -152,7 +152,7 @@ static int es8328_get_deemph(struct snd_kcontrol *kcontrol,
 static int es8328_put_deemph(struct snd_kcontrol *kcontrol,
 			     struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct es8328_priv *es8328 = snd_soc_component_get_drvdata(component);
 	unsigned int deemph = ucontrol->value.integer.value[0];
 	int ret;
-- 
2.43.0

