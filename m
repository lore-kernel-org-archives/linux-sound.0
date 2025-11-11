Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010019.outbound.protection.outlook.com [52.101.229.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D419113959D
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820451; cv=fail; b=EDNZ02rxF1eYm3KpqAdxP5Sn6+3aDg8NdH53+M7151Bj3/pIjnq2O9eYNlgFoPXCpyQW4Eyn+Idj/KQLGtRK0gaWdyoOYlxHf1qaosqJ7oIQuSBCyaU2Pem0YV21dhNOiK/5D1XUxm09iLWaXNjTC6yEH0d+bHWx8ZWZ2qCyLOQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820451; c=relaxed/simple;
	bh=tuNmD5cW2V2YvDRg7uxUnrQkfh+h5tuLt2ANu3cbLxw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=eeALaXqxQ6m4NoG+ZeFFyPBde67r057Ssf2IAitmPQF3fvodQVtCroAUB7ZbhwG1YnlXCCRFnAbTeMDcCqWEsHy3et/NFqWJito0eEr574EJjeI5VsQ2wtlKyzLfCvdajbz0kn9xWW2ilYV1CiuKsSbJ/pPq8LqGztyujLNwRb0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Bh9y95CN; arc=fail smtp.client-ip=52.101.229.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Bh9y95CN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GzPTd3CJ83Rbf7N7KSa5EhQrad8rsO1keVszQgDbRGL74Clg8K4zMlfaz1b5KiU51NTFRVdZLPZDChiVsn5JGf0gku8eHhwdwX30U0HoTWD3OY2QtOOt4GYEcK2adHTh+HbqlfM1CX+4pG11qrkvBDTfzp0Aeyni6JjZjJlKZMwPDygE4Gh6bl6dAai6NDPkjUvH3+mnbGlaX5V3qoyR/mSIvIDC4B0NguzxyFRUgHhXv6BfESyX/36zcCuIG6U6//NtfrcvSbzKCGjFoBRBed7r5+MpBCrPo9+vsSFkyTdd/RNSIZeCrjja+XUgwWFVKLHkJeHTfxKUL5ZCu45Ghw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iYbOEVrrjW3TkGHZfGsjkgyJy1Q9xxuPggLRSVdtb2o=;
 b=imnsT4YMYQWYeFim8AJJGp9rQTGnQR1I0H8rmkfzx8RspcNpOGPoSAwJYxSO91UO/sfrozMNlCot+5Cv3ZtPwRpUVojV4HbyXwLC4hFjFYqT7HDPFpuOO2Lth/D2TI+ell09MwM3q1FC8cJLxAS2UKu/fvTuDEn2iX29NGsa1fOGlwwMy07CcNUVwtKLsiKyiACKHdVISec9g/NZh8adhOvLOK2z2XWTYaMSYZKR18VqeEk41Y2k3BKbDUK4KXkq4tpRyGddK4ubh87KVTtusIJWSq7EASiYcwGhHtnzxLWa/6bRFRLPGYDFJTgFstrnWjwHOXdMZZR4h8oVPEDslA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iYbOEVrrjW3TkGHZfGsjkgyJy1Q9xxuPggLRSVdtb2o=;
 b=Bh9y95CNA1UDITOzBxW/U++PtqXLofBRjPkgnu00zD3/ObIpUy3bKUN7JXeTDcBK1YeItVnZTtJrlDKv0qXHMmYkY5Y46ddpuHjyMjTvUjYu2mXGBVuLNF4QxFbYzPjb4WE/oXMQUTLztytsgMZ5pfqNopGKcRyTRPZnrfz+oeM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB6994.jpnprd01.prod.outlook.com
 (2603:1096:400:bd::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:20:48 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:20:48 +0000
Message-ID: <87qzu57734.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 039/292] ASoC: codecs: cs42l52: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:20:47 +0000
X-ClientProxiedBy: TYCP286CA0058.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB6994:EE_
X-MS-Office365-Filtering-Correlation-Id: f3f49d27-85a8-49a1-a6d1-08de20b829c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?G46i6EcRveQa/SkHGeMKHZbo3HFOEKwHC4PwQwCtCQ/nyyQyjamgL8McjQux?=
 =?us-ascii?Q?AFAMuMhSPAMn+zDq+LBtI0PTNJBIHtN9ACkd5tigJ9ZyaMph6+wcLKqlCtzY?=
 =?us-ascii?Q?P5EAOfG9Qdu9WINdaS04iJEhe+CAIc5+SfC+xJGKBaEmy6QM5Wu+ScwgBuAb?=
 =?us-ascii?Q?vnh+uqlIS3vkszvT+eQ6boFF2Dj4yc9YI9dNgQlQOEM/Pgw8kCcumaxK0N0v?=
 =?us-ascii?Q?KypKgkXYY2/walSERO0osYLc3vYP5z/O1IoDNob8uGEUZ3GX/WlzxElI9WDK?=
 =?us-ascii?Q?CnjM8B2tedy/3F/FMLavzoKvdIEUo/SBW4hTLlWFY97N1cbwgeUEd0mGU+G2?=
 =?us-ascii?Q?cyTNSieeg72kg6+/L1Btr0MYRoej92VZq4YWkVZmZ4x6UGKhVGvYNSG+4tsJ?=
 =?us-ascii?Q?DaV0FiP96Ntn8i18mC+5+C/KkUBVYbyEV7FLrvE9vjWNCHi83zQtwv7Fljwh?=
 =?us-ascii?Q?g1gljVa+i+Ex6HRZQV7QJB+uI9Fp2jSt9tmOTopwCGEXucoSPPa7M02E7gh9?=
 =?us-ascii?Q?pKNImO7Pyxn6KO3QYSD07FeAfAJ9ja1jgMOJwgZ/0cT4aVDgvGmBz/QqMYmF?=
 =?us-ascii?Q?QEpH17t0cqdCR+MzkAq4e0vePwvRkBtsluow8Iz2W9V5zOQosv0RU3bkKYop?=
 =?us-ascii?Q?sDGfWyFoquwGh8MEDDnevDc4CcW0hHooAkweAbu5/SRvkGWvwpRl8cKAPg4s?=
 =?us-ascii?Q?A5xStAMMANqpoCgpq17jF7KwLXXAtQhVadKwtVeAIecBwigHWemY3/xLobSm?=
 =?us-ascii?Q?s6RrNZN54soVVJKnR5erCr+I+Tcue4FOngZWSJDGkcYESBj4BmKyTtRwLIER?=
 =?us-ascii?Q?USS1F69MBtgENfJhYbhiY8zpKAt2iX5HtSOUrgFnsgJE7pE/o1zoK0SQMtac?=
 =?us-ascii?Q?rkRg+BRf/gBMx0tF4QsYxuk9unXkWCDJIWBXt2fnVgcyYQzcCrr8x9XtrX9E?=
 =?us-ascii?Q?ThdYe6goLFk0MLFyqv6mr1nl8jKMWYtP6O5TOLtpPZc/mi8ao0eDrCRRAxzr?=
 =?us-ascii?Q?IH2iRoCMGvfZtfq6Es0bnbCb7AEcPRqsyl5pW0rB8DNPrGKhnKZAXTS4P67p?=
 =?us-ascii?Q?AMQvtbuOF5fz/LLzqBoG7aFxCk8JtXx/IGRve3lU5wF2t3Ff24PZlExqowm4?=
 =?us-ascii?Q?Ztu62pK0ujpoN5OLBlZ3eeP1Rp0beJ/9Zw1usbH1oCOKlpwavBfP+2EgXciG?=
 =?us-ascii?Q?WMp+pS6IjKquqYqD3u8bS84vRV3IqdlnBYniiLzcRMhxNom5E5DGmlnHU8Wt?=
 =?us-ascii?Q?0ibo/pzzApJe4dnYCFcNX5hMKi98C3WsH5ghqkXsD+d5Qc0x/+qa49aBD7sA?=
 =?us-ascii?Q?6JhRAPcSFaaQmiutkTNlwB/+9UkdrcgZg8Lin6gpf9q2hbrJz1u6mWLOUeSA?=
 =?us-ascii?Q?vEt6FrMp4i8s7Z0K728M5Gx71RFrQph5YynySigMop1fwScTnebkQpMYBozs?=
 =?us-ascii?Q?Du24NcooiVdg/RIpEvyez8LqU4biVBAB31dNwSLwaSVqepaHpfiuSkx4XwmU?=
 =?us-ascii?Q?83NIlMTOoQ9uQySOE6xPp+9YZlKrcJ8ZLgZl?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yOs+oyN3WeqzLQ+qFSXie6mZODFyF6bp4tbfCTH75iQKPzcqmA7fgHUxhOMM?=
 =?us-ascii?Q?IFs95eVJkb1Qsd3oe11SfLNjiFzespK98jZgN+c+KVeRPPXRPm6v9BmFHoRF?=
 =?us-ascii?Q?Ejaz/Z1Ofn5QZ2n5yloc0wn7bV+i/154qotTAhF+63KROKwrdTEU20y1eZkW?=
 =?us-ascii?Q?t6EmPskA6Fjs8xO+DaEf+Jm3bXNy1GuGE35kMCLJd+UNB71ejkiH55GwaHQN?=
 =?us-ascii?Q?5/TQ7VnngYmE3cg9eARR2s+LMmtJS2JNpaEElc5uyUUnmTH2LXJMXTNY2a8r?=
 =?us-ascii?Q?HWmwn5G8d31RPrt+Lv9W3H4orxMhWAijRNu21saSACYkjYJRTiRlfbMCuT/t?=
 =?us-ascii?Q?2Hh0CdfI0l7oLthGR5lj5/3E7WsiVYDAaE82DQC9SklkitAW7QwFkFDOiwFP?=
 =?us-ascii?Q?uqnAtc5xgRLDJmgeyRquvtaEw4zG3eJlxkOWGmm0Pd+EfefTPB7XC4UJT8TD?=
 =?us-ascii?Q?gmSZSPGdJwgTg21r8HpoOapPSwNq4l//0Knj1qVZW3A3FidbXkPOdAO+QqI0?=
 =?us-ascii?Q?5lwVj5elXwLoqgZdRkZOJe339rqIW3uKA+SkvrfugHD6KTxkenPNIfBVpCNE?=
 =?us-ascii?Q?3e/+FPq9hmN/fuRmMZgtrXGepJO5btQOAMmP+k3sxQUKy+xr46ELBfsEBmoz?=
 =?us-ascii?Q?eDvhK7ejH8nL1RD5Oy9HC2Hw9Wayxv25sUrZSNmaMH0RyBAr6eIq2oxu02Ao?=
 =?us-ascii?Q?V+gGfuPSp7ZGafqJPJxZc53ZVJQ307x1G29p+ylA3OvxbO6vOcDqSwBWWMVs?=
 =?us-ascii?Q?9zO+2csjHiG1S1MVwhVhthA8QRr+Wa3GGH2aOh/wxB8Ba3WB/JospqiQEKIp?=
 =?us-ascii?Q?kg499vKfK8GnZzWkBMsFO/xRueiBFI/a3xRfSPyK1IKGoLlWC5GFw2/Nf9up?=
 =?us-ascii?Q?91bl6qXr7XHrr/3ei4W28pOkdL+ZRNkuR2ndoFaL9sxGTJNiNWM/3BpmJIh8?=
 =?us-ascii?Q?wfurbEjoc3Wwf66oZo+2MPIZIF14UGzqQze1xWtgHql57KCDHb9ihFm0NGZ+?=
 =?us-ascii?Q?KnlDCilQLc2syb1CL0h5k58YJNepDuJsrqnUW08EmQZUQx3cxpuYJVDBcR9B?=
 =?us-ascii?Q?KFAqTTPqtUXwF2M2ZGheaqPuOBn8LP/zpb0eOWUtBbmFWeMPRZlWy0sT4VYm?=
 =?us-ascii?Q?blFi6SmjpoXOo4TAIDPTo7wqZKQRO9E/11T2wl7x5Hi+6Vkw0Y0NRWgeUe8d?=
 =?us-ascii?Q?YC7msuzTvUmgR9wOLA0P0a7aL1rbxVV1Jq6fs932bIrMNS8RyhpRwEqmfLHz?=
 =?us-ascii?Q?xBncIRS3M+HbNEr2Ik6ZOkbG16NxC1RDeg4gIwXW1vfXM+26FiNoy1RxmtTM?=
 =?us-ascii?Q?aeyC4NkAMh2wZmX5pGmfBKtUvbFyum4hcX/IOn/6XrWdiOmDjyNKswOKShCI?=
 =?us-ascii?Q?60uxFP7FXY0YXa5xvlPxltsmRBvOSJgtHh61EPPQAta3+Vbj+v1YG87tzAUX?=
 =?us-ascii?Q?KNWHhikr6nlfUhNrSH69Ro7wE7ovVDuwOFyMx/9CmhBWEpaAM+vyCyFozatM?=
 =?us-ascii?Q?7EcFJ+iIYoQ7feHSiLowbI6GGk+p2lW3ujIm0taXNV6liffam0imliS2bSma?=
 =?us-ascii?Q?CNBhjHePc7oLTDQrD9RARFrrUpeLoPBL4Clp2dJhawR1G54uUfa8uDQCl/B9?=
 =?us-ascii?Q?kr12Cqm8hjXxici0CjwFIoY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3f49d27-85a8-49a1-a6d1-08de20b829c6
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:20:48.1361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AAa56b6xi/ojXZ5eBmKPHjt5QRVtdmZ7UTAYzPrvXRATOVw5SnYNef8mau0C0s01bN+h+gv4AVKLjdX7jDOuconz6Q+DjARhdqqmbo4OB6axOeK/xZW2qHsYMhvU4wq3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6994

This patch converts below functions.

dapm->dev					-> snd_soc_dapm_to_dev()
dapm->card					-> snd_soc_dapm_to_card()
dapm->component					-> snd_soc_dapm_to_component()

dapm_kcontrol_get_value()			-> snd_soc_dapm_kcontrol_get_value()

snd_soc_component_enable_pin()			-> snd_soc_dapm_enable_pin()
snd_soc_component_enable_pin_unlocked()		-> snd_soc_dapm_enable_pin_unlocked()
snd_soc_component_disable_pin()			-> snd_soc_dapm_disable_pin()
snd_soc_component_disable_pin_unlocked()	-> snd_soc_dapm_disable_pin_unlocked()
snd_soc_component_nc_pin()			-> snd_soc_dapm_nc_pin()
snd_soc_component_nc_pin_unlocked()		-> snd_soc_dapm_nc_pin_unlocked()
snd_soc_component_get_pin_status()		-> snd_soc_dapm_get_pin_status()
snd_soc_component_force_enable_pin()		-> snd_soc_dapm_force_enable_pin()
snd_soc_component_force_enable_pin_unlocked()	-> snd_soc_dapm_force_enable_pin_unlocked()
snd_soc_component_force_bias_level()		-> snd_soc_dapm_force_bias_level()
snd_soc_component_get_bias_level()		-> snd_soc_dapm_get_bias_level()
snd_soc_component_init_bias_level()		-> snd_soc_dapm_init_bias_level()
snd_soc_component_get_dapm()			-> snd_soc_component_to_dapm()

snd_soc_dapm_kcontrol_component()		-> snd_soc_dapm_kcontrol_to_component()
snd_soc_dapm_kcontrol_widget()			-> snd_soc_dapm_kcontrol_to_widget()
snd_soc_dapm_kcontrol_dapm()			-> snd_soc_dapm_kcontrol_to_dapm()
snd_soc_dapm_np_pin()				-> snd_soc_dapm_disable_pin()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/cs42l52.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs42l52.c b/sound/soc/codecs/cs42l52.c
index a9ffba62aaf88..662dc1a4835bd 100644
--- a/sound/soc/codecs/cs42l52.c
+++ b/sound/soc/codecs/cs42l52.c
@@ -851,6 +851,7 @@ static int cs42l52_set_bias_level(struct snd_soc_component *component,
 					enum snd_soc_bias_level level)
 {
 	struct cs42l52_private *cs42l52 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 
 	switch (level) {
 	case SND_SOC_BIAS_ON:
@@ -860,7 +861,7 @@ static int cs42l52_set_bias_level(struct snd_soc_component *component,
 				    CS42L52_PWRCTL1_PDN_CODEC, 0);
 		break;
 	case SND_SOC_BIAS_STANDBY:
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF) {
 			regcache_cache_only(cs42l52->regmap, false);
 			regcache_sync(cs42l52->regmap);
 		}
@@ -919,7 +920,7 @@ static void cs42l52_beep_work(struct work_struct *work)
 	struct cs42l52_private *cs42l52 =
 		container_of(work, struct cs42l52_private, beep_work);
 	struct snd_soc_component *component = cs42l52->component;
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	int i;
 	int val = 0;
 	int best = 0;
-- 
2.43.0

