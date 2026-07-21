Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011043.outbound.protection.outlook.com [52.101.125.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BEF73FC5BE
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 01:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784597416; cv=fail; b=uhyhILdXWsq75+1bm+lIN3pRfCcB2H2CXqeN7e9MHrFuo3Ju578MQAcWDcL3UBl5Y9tt7sDvXptzTRjUb2UbQe8USEKkhSdumO3GDyFxBjeTJ/qidHui1rl7RZPBWxXjaZa4E6p+TfKUZcOfBnLjDG3G/Ih8s2cunrdsxWsjNuw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784597416; c=relaxed/simple;
	bh=i+ocZkID4dDyeHzdhz/8riAiGzzHQ4WmfiFrOgc7pSc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ROihVEqQMylBAxvU/0KbUuWz5uiKgLLbVKvwSqgrywFZhSD1Fjty1dmPQNVAuA1bvqzraoSlyAc/NU9oOZs2ckP5fYbBcXIzFCEPTU8VMKM2RWVoC1ddYqTNzFu6M9cQMtbntooWoXEahcDmTW4A60nqfHjQq+reQ+RmLLlMrko=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=DkoVlaGR; arc=fail smtp.client-ip=52.101.125.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="DkoVlaGR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Inw8QDzOhiqBDV33apF1xZl/D7KBpQzET0fcOOUEwFNAYjiHaKNsdsDI1b01XAerYynTEOF/OYZ1LiAWw/5ogZ1zdvjRp+53JTh3REekUEBiXCPUrED/wl+DJf4jkKh0MZO1sIQqL/wC3ZeyrSYreyBcb8Az67JE8wFk2llmtVnHRLR3xk02Cwc5Rcd9YWGJGizs9yrsFatUiDDdyAk+8dq/Bc9O5uW2dTscF9xlPw5Tcceeyvt5rvJYGM0QvjsUAvpiT1ZTGAz9oto0Ozi2IkwnDgDuOKjtkowiVEY1MByHf0KDz0ENnesTQvqSeL/FdtlDMlepmfnOPDowvjUHUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yUQkdqJwCV5ndJ2Ll9Gi/2qa+rhvHubHFnPIz8sBK68=;
 b=BATEvv/5h/KhCbKTSkapWFP753epA4mKfz3drQJM3BuuoUc9ipJWYd2eMZHzSYFo66rtpHq7pUUtgyq5UzIpFT6mmuDd3KGgXMDrGwS2BYGvkottcKUDy/QhOTtOVAI5KidxMWkSghyyGDfR+d57wMGV+tSom9FkIF3Wvd0XZ2FjqXabnqxkTnbKsrBWUjR4BoVvT7LoUuJ7IT7UvVWf6fdAVM41nsLosiQvOUO6t3scdEKI/TYRtTqvsMmgQflmPWVkRBwup86pc78yQJZKAbjvgMJxXh6AGz2QU6nLWrh/4Uk0u3LDADs286slkn2z/xFvnjKVCUbs0WUBuIdUhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yUQkdqJwCV5ndJ2Ll9Gi/2qa+rhvHubHFnPIz8sBK68=;
 b=DkoVlaGRe02a/BtCiO+AnQjzK/L1TGhl+ZqbjhwBQ6jyc1bR+Nrr/EQdcfAZMZl2I3UKreE7IbR30QFyyRO0XuXqOrSwLVO3bWfAL8tZ9Djz4s3KFEYGuQ4tHG8G6TzcKdi+yX9bq01JICG/A9zJgX4KBrOeJmpIAgtNxW+aXTY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYCPR01MB11070.jpnprd01.prod.outlook.com (2603:1096:400:3a7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 01:30:12 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 01:30:12 +0000
Message-ID: <874ihtjfj0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/2] ASoC: fsl: p1022_rdk: add card_to_mdata() macro
To: Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <877bmpjfjz.wl-kuninori.morimoto.gx@renesas.com>
References: <877bmpjfjz.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 21 Jul 2026 01:30:12 +0000
X-ClientProxiedBy: TYCP286CA0072.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::20) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYCPR01MB11070:EE_
X-MS-Office365-Filtering-Correlation-Id: 165c1c11-5404-41a3-d1ce-08dee6c79be0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|52116014|38350700014|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	wduhLcCcFyi0eOrR0IK0ubUxIbROIlsgf04dtyecxWAUAQXNvXuoaLeWwzxbW/BJLcUI0YcSwRif5sdRt/8RQStbesELviLe//TJJ8a2lEANC5DOVQm06DkaoKSHUkjcPFye9o9L+H331mrrUOMicba01FB1jIDl+FCYK3aRZRITNJQsPuOB62UGLZ+ygEwCln2moXDM4ejW5Xv0tc6ruch9g7cISPPNPJlGqK5KQewzVjS3em5tJqm4n43nxFnhO1B018gK+j4Bry8JRMvxAJ5sEubO/pTGtzC0/6ERLBc9LdsVbB8axRadXME14QeQUvJ+QBy4q9BBN9vBrmNIHIDykH9SHsntgKVbleyCnq+WYkSL+m6qF9H2DYnRz7XRFkQspvWlCF1rRTiQoZTsbZSh3nqn5URPYB0N+fYkqdrxyPYF4bxh4PZsIKDYAA6N6nqLxb/7JpF22Nkrl2hbAoKhhKqoW3N5Rb2wyQnKkqpdc1iLUqBeZTPVDaRiHKuv7Xc5YdjDpxTmBPof+8RP0rfFOiO7lZ7+Auny5Yvz+ERfB6kyN7AbYXlhyYOa6V/UAzyYT0c8mwGm4PHS2KzK0kIPd/CrQiVBnhIpHJWOJhN6i1MIhAKqgkVXDcUbeYjtqM1UydTsaLEJn/pYfjg6hubitMVKdh+2mR8lK4AHp1GAGs0XQYvMOtcgRIo4zY1jyIxOXlKDgPSHi3jW4unN1dcQv1Ne9uiJMlCNXY/WteA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(52116014)(38350700014)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?df4Bj9I50AtQHwByXpwd5V+S7TJuQM9PO313UAiPHOJm/jOukxllhvlgbo3A?=
 =?us-ascii?Q?6Y9GCJb8gbMu4u8dLI4xOXaALj/wXw2WDW/4VteZTp3aGonqSvY22A/qdfiN?=
 =?us-ascii?Q?9B4vN739ScCARAqeyqlrdf3VFHT4NZwbO9gM1RXqF6upUuEP0dnob6rQrMcr?=
 =?us-ascii?Q?dGVOKh7UyQwwlCIdKwrB+rBpCX+GdLSdAerPg/hcl8hvBSeRI6V8cbVOu9j/?=
 =?us-ascii?Q?pmKMFj+G+Xl8AtTlBjuCwROg0s4UhQmBas1xbFClMNC5kn5Ik3Q2DMt30FIM?=
 =?us-ascii?Q?GIZq55bDQ401mvj5hfBWi61ZOP1Y/BaFAvMADPnR5zJy1eV+3fk2BNW+CDnQ?=
 =?us-ascii?Q?iP7HP1x3wwP0hxyvXpeNv1urbkSGZnSpaZFgRe/Vc4qLYRlC1RLeLXE2XAPE?=
 =?us-ascii?Q?bhLezGCZWpVmhmL4zQdtWLcjmN5Y+S31ufqgekVYQsOye453nNvqIuE/BCrb?=
 =?us-ascii?Q?tzhu/Xry/sxRSAgKBmjG0fYsz4Q+caodAN099aX0/+BhWUsXt6A0kWGUEJBD?=
 =?us-ascii?Q?oXu7pvgG461LU3gnUAL/6YBCjGZHc4jNXH/nfzIuoL8hLvtSffp46IxPTHLI?=
 =?us-ascii?Q?DzgtBgP6kgYg87+Bj1c89tEsCLV/+5XHTMjdfdrh2aTcnaS8SstfH6+nn1BL?=
 =?us-ascii?Q?AwQtHjO12nmKR1UIdUv5Dr3cSkYmDOpGtrixF51SkySQB4g0NNdSK4SYTwwo?=
 =?us-ascii?Q?nb/hXFE70zGKrwCCcHEiuwW0xxMLl7sUd+g+QxNZ0d6L+SZLqu3tmzadWdR7?=
 =?us-ascii?Q?ViAVWU3E1KaZkjuHZKa6VvUPvt8WWpwq9Nu5AZs71YGA12UJEw4cZKlC1Mvs?=
 =?us-ascii?Q?6ODfCZIE7n5xNdFIRC5S32aiWIsYoqKW2V2dbdJ5QvSQUd9SyUmorm3jZcr5?=
 =?us-ascii?Q?xJG1ruvHGAp/X3Wo+LhHs41AwHsElDPPWBjI1wftgejo/s9GddXtccI43x2B?=
 =?us-ascii?Q?cD5OFYtsJ4Mo323l3m1UuXLsVLXQBe8X/uDN2nP/I2aSDhkx75twefJYzSvy?=
 =?us-ascii?Q?8AwOJdJFNPcJ2koF436lNek9ugSEWZKc7ydaXrUpCfheEW5InGy9ikm7rCqI?=
 =?us-ascii?Q?/2b5/ZIliTsejSq6T9PtByQK0nVpCEnPTlu/T5MF8SraFCj58Y3mJCeM7EfE?=
 =?us-ascii?Q?etd6dF2YB8DCtgq5/QN+QU3vRWicrnx1L+GtVSIMTxfGaAA5HvxP7joJ5sM5?=
 =?us-ascii?Q?+j8HnFSK8li46fmQlJUj4Wo6vVR/RDcAo4TaqZMntGhpxZgQyQtUDsmthOx5?=
 =?us-ascii?Q?VkNz5syo6zm55P4whIouwzn4QW8HKfsLNkubc/TaJmVDDjYe/tBgc68PZZCR?=
 =?us-ascii?Q?tw38HOkmCP7FMR8Ngb1A0hoGWhNfOEhlpaBn1FzfzG/ZiDR3GTz84gluXQXi?=
 =?us-ascii?Q?wjz7dXr/rFY1KbuBEMgyMoYsiYkJVjbXVU5C8pWOOEe4A7T/aIvD1wmTWYBX?=
 =?us-ascii?Q?W+FhKmFzux75VB2F9FAYJRFmjCIBLPPwf5M+zdLdmqJ6LvZMSW7H9pRm0oBL?=
 =?us-ascii?Q?CTEdv62o5Ruw7GKqI6IOdol9rATYWGwnK9WmaBhaS4grilEex8QmorifzBFx?=
 =?us-ascii?Q?Q2z64pfywRKIev1tDQDLtyBZ2rL5MqKGCj5LcDMNIop9YevQ9TgQiluKFjKf?=
 =?us-ascii?Q?T/bIzm8CFOgIsAzQ69uVeo0t6tbp3wy7M+fJcVv4wVNnZYoWw4HfgCFUACn+?=
 =?us-ascii?Q?BhGk3W52CvuD4+B8SRDhtWTWeO3prnFtcAyPzsyaqp2L2nz7755vip1QicmT?=
 =?us-ascii?Q?fYRye5yaV8iGlwxGmmbW1lfgKDqRT1hjY8PAjef6M1b5V8CaPpwW?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 165c1c11-5404-41a3-d1ce-08dee6c79be0
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 01:30:12.2601
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: otAoVNieF8RfraSaphRdBZ3MHn5KFrPZK0UIzt+JHTAIrMHuWsU+Th7GEpFhcK4fsSXH02RatPAOh5vWiqK+PN7vk0hRpBFsBqMJHWRc6prHAoVSc6UJRfz1jx4xtROl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11070

p1022_rdk.c will be updated when Card capsuling.
To makes its review easy, adds card_to_mdata() and useit to reduce
un-related diff.
No functional change, but is preparation for cleanup driver.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/fsl/p1022_rdk.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/sound/soc/fsl/p1022_rdk.c b/sound/soc/fsl/p1022_rdk.c
index f80d6d04e7911..d82fe22ca5c5c 100644
--- a/sound/soc/fsl/p1022_rdk.c
+++ b/sound/soc/fsl/p1022_rdk.c
@@ -79,6 +79,8 @@ struct machine_data {
 	char platform_name[2][DAI_NAME_SIZE]; /* One for each DMA channel */
 };
 
+#define card_to_mdata(_card) container_of(_card, struct machine_data, card)
+
 /**
  * p1022_rdk_machine_probe - initialize the board
  * @card: ASoC card instance
@@ -91,8 +93,7 @@ struct machine_data {
  */
 static int p1022_rdk_machine_probe(struct snd_soc_card *card)
 {
-	struct machine_data *mdata =
-		container_of(card, struct machine_data, card);
+	struct machine_data *mdata = card_to_mdata(card);
 	struct ccsr_guts __iomem *guts;
 
 	guts = ioremap(guts_phys, sizeof(struct ccsr_guts));
@@ -134,8 +135,7 @@ static int p1022_rdk_machine_probe(struct snd_soc_card *card)
 static int p1022_rdk_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-	struct machine_data *mdata =
-		container_of(rtd->card, struct machine_data, card);
+	struct machine_data *mdata = card_to_mdata(rtd->card);
 	struct device *dev = rtd->card->dev;
 	int ret = 0;
 
@@ -169,8 +169,7 @@ static int p1022_rdk_startup(struct snd_pcm_substream *substream)
  */
 static int p1022_rdk_machine_remove(struct snd_soc_card *card)
 {
-	struct machine_data *mdata =
-		container_of(card, struct machine_data, card);
+	struct machine_data *mdata = card_to_mdata(card);
 	struct ccsr_guts __iomem *guts;
 
 	guts = ioremap(guts_phys, sizeof(struct ccsr_guts));
@@ -361,8 +360,7 @@ static int p1022_rdk_probe(struct platform_device *pdev)
 static void p1022_rdk_remove(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = platform_get_drvdata(pdev);
-	struct machine_data *mdata =
-		container_of(card, struct machine_data, card);
+	struct machine_data *mdata = card_to_mdata(card);
 
 	snd_soc_unregister_card(card);
 	kfree(mdata);
-- 
2.53.0

