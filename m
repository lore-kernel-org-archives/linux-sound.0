Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010065.outbound.protection.outlook.com [52.101.228.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F55308F3A
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415665; cv=fail; b=PENfyl0z4mNEnHnbWM2YCLyx7vXAL8LdkvWO7yzroB97F2CIUkiVX22RDnBanxctO4I478SZIP5f6UnsNnLjkAZegiP0blIcoNxOP/b50+PzUd0SZ2ZSkZarpVEMsqQ9jYI6SgVYvn/MHwTYvAd+yTw/XzlvsopNOKwkzr6u2Dk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415665; c=relaxed/simple;
	bh=eQiWpKasDZvNimC2BMULJW8worFgzpSV5uWCNna/H48=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=R/B/qGB1z9TeAdyr2idQt2dkxpqo9S14kgz3ZRZEuOGAPH2tk863IKdRQii/QoasEptjKkTaSWU05fuNNXuN2QkLSnflri8eQ7ieQF8zRmrk5pGYADBcaZmoPi3X9Az4tl0heRFiTvrBdxly/H0Pv8yNu7K05F01r+iZZ/H1QnY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=H3i4xX3H; arc=fail smtp.client-ip=52.101.228.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="H3i4xX3H"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EsTNNEMgpGAu6Z0Pum+Gm1IK5wUlX5X7GVR74mBBzLsva9FWGT+lzwH8ukPiKHVTLuWzVTw4n2gi7X0NM88W0knopsi7oF98eV+7LsiijEvKzw/J0OdMh8DYHIA9H9YHzQ62JxxstFnUFw4w/KzkFwVne6iFdAjST+A/HkZ42TH8CgNrOyUvHvMn2a+nO7qyS8U/8TCjCPtfEngRQ0i51Rf2IR5dKbrg1ASdAC5Ui75GLvwLOLBe/5JY0rLZGgteJe6Om/8xQHKDhst6W2nJxTb//df+9OP3ur9d2jts/89/jTEy4ffPdBoeFYoRK+jnmtSd6EPjLoOBgM6id/79xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q1U1k61GKDkgrjeOCosM4AmvSzxkWtGQQpj2CFaR+2U=;
 b=ItWYDvgmj2y9O3wF1lhzJaZiu3wxl1T2H8RKlehygCrAkSVB4qZUAxKjq8+zlKFgnEksk2hGEFxbwsOEt+QP4dipfkQ9KA4etXHuX+VEgnRzATzCjFbKcQ8U63JPq2xtvG1Ejv2efvzLaaiP6KlaUUY7Wb8+UwO9gMZ74GkpXhk1VdlTFnyAkbmI7xgXUB25QhACiyZVS3uSiLqYW1CA/kPNzJio6H+xNmDlhCTgmbFOB/ZdsHIWCmpelvXs/lH9ZEVGxNV1WZhB9/k2fePsi1Vby0G1x4VSz8ymeM+AwU4gU+sPr/M+m7Tn55Yo/b4cv8KMgxIBvU+6NLvdVa889g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q1U1k61GKDkgrjeOCosM4AmvSzxkWtGQQpj2CFaR+2U=;
 b=H3i4xX3H9IzBOzlq5R59sHhdKmwJbhH4hkO3USlDAgLJXNGY6usE+slqHuMq5q6P31yvfRB8oucBKrdJSEoVMjYRrajYgKZKZXRTWJEO/YL4U2q6htjznFOsAd5i+DpG9aft0yYNoyO63sO6uIOCbi3NtD9hUNL9nqPsfjxNHs0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB12366.jpnprd01.prod.outlook.com
 (2603:1096:405:100::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:21:01 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:21:01 +0000
Message-ID: <87v7kiru4z.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 025/139] ASoC: codecs: cs42l51: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:21:01 +0000
X-ClientProxiedBy: TYCP286CA0140.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB12366:EE_
X-MS-Office365-Filtering-Correlation-Id: 5816d279-e93f-4872-884e-08de0ad91517
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?T//Lxrp/lV/EfCbYdni5TQFhysoxsFFBcnfCh9y2r/ujnsCSOFvnva7013wO?=
 =?us-ascii?Q?hvLVSEpBsGrGbhhwC2mSlt7RzhJa6MDzc6GT87JmhlUSlxdb1lN4AeloeVUi?=
 =?us-ascii?Q?XPrnhOxAE1XOHZQqQZ4ynYxvlYunGTw6oBTGPGhTMgep1fkvBPUcyl1yvrkF?=
 =?us-ascii?Q?pFClVgJZIJFV8DJEV7pmPeSIEfUoFIklAc9RYg2IbMKvyB4nqWlZoPrZbh9e?=
 =?us-ascii?Q?iAhFbTOgqMNkzoD0q09Ss7J72HILG/DTDLsM7kiyYIpB7wniWoPu+tf7/1nN?=
 =?us-ascii?Q?xU2Hxe1wpYk1hjE01yckWMiduP/QLusP8VCRTcZb/H1UwD33T1o+YpfYlBY9?=
 =?us-ascii?Q?5cp5DjDSSxtyZUtcTyZZ524uQ1eo5Gv7Go/zVJg7vwohzg/GcovR1QvJH8D6?=
 =?us-ascii?Q?nGlNVghFTzlx8Wxb0pl/T0WD3vcPq5I1ACT/B7AFFc2etQ5t0MgvMHHzHgKA?=
 =?us-ascii?Q?0XuKBGuIl8ghWnsBckMvRWHO8uEL6FycQc3qwYrL8+iNw+tz/GbtOT010eyf?=
 =?us-ascii?Q?3MRpKevydr8nIhRhF6RuRgC+CNXGG+wLZOvFxhCM8AnAjZoEQm3cUB7zp49O?=
 =?us-ascii?Q?PDueghu2/KOWXllId7LxalkIr0u7OJgLh+W6o1NZdWypCxTwVNxlkqARLoNu?=
 =?us-ascii?Q?5wLXHdIhUNCWuoWR3yLG3kevD92rROmPokn5bOsXuXIA0ueYO5yf5ulo00T6?=
 =?us-ascii?Q?zE6+s6sYSNV+6o1+d0Dht31VGkCEj43ZliPcw5jFnEkEnTgSc1KBd9h3IRQX?=
 =?us-ascii?Q?0JYHPDqYwdKInZFKFvaQQEGkIy7jUYLUyvFQuNCXj+vK3hXi2Xd/pgE66Mhg?=
 =?us-ascii?Q?y1hjOEJoGI30CqJVtD7F8ZIEVYIOLvN5Ht5JG9JS01QkoN7XvGYjwXV012ET?=
 =?us-ascii?Q?tCxEVX/v411l64nnfrgHFb1Uy0RSfuwyupYijvWYtBM4tKmmj7ZW2g0aH/V6?=
 =?us-ascii?Q?6DkoGojXSGYwKnYsSjXKiHzEXbRlL2SPpbttfXD7cUjuKIaqoaplHPpKzkLu?=
 =?us-ascii?Q?/nvM/Y76Mxh0/kA6H/uHrQy3VQ7+3spno2yY3a5ToPyPjs9/g+NjHb9chKww?=
 =?us-ascii?Q?xXQBKFtaUXh7UaKwlZT6GnZpH7a8kPO8k/3q3MqqFdvFLIdP9ajylagLlR5c?=
 =?us-ascii?Q?k+7w1F8Hcv9/jYeM/uQOfoXdu01AF+mfLKyhlxtBsKYZ3Krp5R5hbRNBplLM?=
 =?us-ascii?Q?oTseP5iiMIT1KwnZfa5+8iWR06cWOqiNWM7l8CZTosvKLhmz881FhXQPsQ73?=
 =?us-ascii?Q?k5fbtoUoJtIuHi1LPP8yF0BQ5fEMEi+Ng/4nxVAO8DqHP9m28HRQjnSK8LTO?=
 =?us-ascii?Q?ykRhCZ6oKPK9KBsbMJ9VS2n5/xpBHUSkt4i+OVpFkDT9jTtDZZi0N4jJO0sw?=
 =?us-ascii?Q?NPmnsPIXWS2n1vIScNOfoK+/AmLnDIwuvfuG0eu6fRIs1/OCHaFtcDU4Ddcg?=
 =?us-ascii?Q?u4BCN6QrEZ6z0M2CI+YucDCpPUKWnhix/Z0YeoVYD9xNy/st9jQmI5+W13pl?=
 =?us-ascii?Q?4ZmsKCA1sakpHg1q8IZJoBolanwoHBUV2xyH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6TfCyP3YvNkD0fhWfYoY/+ZRQEX9mh27q/QEaTubsNefRJ745rcNp1bt/SoC?=
 =?us-ascii?Q?VF6EZxAZlC0n9fLRpc+azkZRajrSDzHlpuAjoANDh2EDLjZvrZHYA4+5/Hsm?=
 =?us-ascii?Q?xekG92IhzPdKYZSgpkxH6fWiTKKmMhoItakMzO3mBC1Ysw/x3FR9xyeI532Q?=
 =?us-ascii?Q?Kz4GnOAe5kHktDU24gadwFaqm90KzGZYInXcl4bS9n+jMJ0qzsYpRU3y6jv+?=
 =?us-ascii?Q?8Eb7osef4sRmrkzxbEMEOIvgYCpCmlsoRmNHw7J06hJ/kmssMY36IZpa34BJ?=
 =?us-ascii?Q?FNrPE/vJica1UIQUycve5M+o8N+2E/2E6eFflq9qexIRYjSMuD/M3mQgTCOJ?=
 =?us-ascii?Q?2Q8r/fPrhutUVQZpoS9yFTFZCdwbkFbDahIiwjXLQN1bwVUQbn6E0ibka65x?=
 =?us-ascii?Q?b/6fEzhJ5KcPBwnSGNPXd9+RBumrbWB3xHUczF0neFDYqdDX0m9BDMBYo1t6?=
 =?us-ascii?Q?FWO5QhlNRIdkuvh/wf6G8XgUR/Xl8yojohn1SGbWG0H7QSDsN02P0zfHFyLr?=
 =?us-ascii?Q?wMivto4j0boDRwW/ujLd3GgG23Po0pR710yKZvMl77N1X+6q0Nl/9jkpjKI4?=
 =?us-ascii?Q?KtC37pOT9qz+h2Gh6Lsg+x1OwOE1SnMZDtARMIJ8Bt9t4FDve5xQRoa3eSVE?=
 =?us-ascii?Q?Gb3tzCLMFCGmR6jDAlzi9bQnGL7A8biv/lFtfnzUTCMfKrU5izecIJo9oP3l?=
 =?us-ascii?Q?+aSPaQPeBri7rkBw8lMynY1z7teMo877c5z7ISSudThYw/iAIILIdl/IjLEz?=
 =?us-ascii?Q?9VFYa4AMtBvHiC2tn/Jo2hb/tju4DrwmFS2dotmbofC0PoFiXla4xH8MZEoG?=
 =?us-ascii?Q?30XwC5S1wuy7nph9/3KNI1HGT4A7m3AI6h/BAYRquGS8DqOsFvcd/omvLAeJ?=
 =?us-ascii?Q?gtbBjDjPrel3xTCQ/78q8WzyJkO6NPuoBByYSyPMIgVmPPI0EW/4JuOPJou0?=
 =?us-ascii?Q?OcuBvNaScvQvbhYYQIeSnrPySD0bkPeSX6RtaCbY4QN6I/eWSD8rJ424qkEt?=
 =?us-ascii?Q?VjPOSspzAIZrbHW9eY9airXMFuaSpbhWWNNRMzBdBm8QZWLXpIdZsyyu4cpu?=
 =?us-ascii?Q?MHSDpYlkUexRKHx3Z/TTamlvv+jvpAWHWmqPRZvs3UFKsda9jkevV3m577hD?=
 =?us-ascii?Q?pC1G4ITKsTXmpRr9XUbCILnSjYX9alW+ZNg1Yq50xv5TkVM9g/hkatmC4yfY?=
 =?us-ascii?Q?6SiBUl48z+SnfIqtQfsVVXQ5ZdfyZt0n0Xt2QqMERkz0mDwgeuBHegsyaXhV?=
 =?us-ascii?Q?ULIppHBf1izaYyT4nVRnri7kzejnC+UvOKYQiCvubkvU3eIldzstYjQJ8xzQ?=
 =?us-ascii?Q?cu3mlBbp8w1Fql96aA5pUsXZBr4YiQgM8Wo090Ucwn2tmGJymFuYhCFNvQ0V?=
 =?us-ascii?Q?RN0v1A7DJG4vgy1G1FIHWX1UG0IFEaHuPchKj1hSuPv3p0my93uNERUFmU2m?=
 =?us-ascii?Q?aRb74MDxvplDOUQZdRehEIbeYNABQZr4V84k8mDDBryd1/2J39PRftnxjUh8?=
 =?us-ascii?Q?f6vsYXNfDAWaIUYF0POx2xBeVz2pTOdsjueGkjgabPlvsH1FBDkptaKB9N+h?=
 =?us-ascii?Q?s/Yc5rTrthxmjfqVkh2v9w2tb1fbetHdZAbNF5kn6tyb7BjR2aPdLvd7bBXj?=
 =?us-ascii?Q?NC5IoMTepH5dvNLmjMEEuCA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5816d279-e93f-4872-884e-08de0ad91517
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:21:01.2713
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U6bsp4dHjnnROFPoNX2K9UyQPGz1ELT0J6xhNNlkwLS3FzI8wI9rYJ/P7FY6callEWBMOop6TJyqzVEfWzFGUdyywKINRFsHBAR2fAKVweCd17V+fyqXF6HfkssSjUBW
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
 sound/soc/codecs/cs42l51.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs42l51.c b/sound/soc/codecs/cs42l51.c
index 8083a339dc7bc..7b60aee9cf15b 100644
--- a/sound/soc/codecs/cs42l51.c
+++ b/sound/soc/codecs/cs42l51.c
@@ -57,7 +57,7 @@ struct cs42l51_private {
 static int cs42l51_get_chan_mix(struct snd_kcontrol *kcontrol,
 			struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	unsigned long value = snd_soc_component_read(component, CS42L51_PCM_MIXER)&3;
 
 	switch (value) {
@@ -85,7 +85,7 @@ static int cs42l51_get_chan_mix(struct snd_kcontrol *kcontrol,
 static int cs42l51_set_chan_mix(struct snd_kcontrol *kcontrol,
 			struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	unsigned char val;
 
 	switch (ucontrol->value.enumerated.item[0]) {
-- 
2.43.0

