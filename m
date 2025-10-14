Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010065.outbound.protection.outlook.com [52.101.228.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190DA3090E5
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415667; cv=fail; b=l5BpgIqg4iT7D6o1o/AdPUo6n2CAiovp4qaQL1YLrw9fg3YZmhTgvYN5yUv3tKSw1tBKzySOGxznsO3iWacpB0egFyUa0gvC6PwJCQ41HL6yWzxomgMyfO7m47hR+iGW2ZaABHqthwmNGRlWIczCWNW4x2le2k0Ko+agpv7p29I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415667; c=relaxed/simple;
	bh=iH+rwZSx1niSh14PEIaEDSbUeZJqs5EKqTDNewhk7c4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=DKJgzJNglqZRFSrlR5HRzcyulnhfbI7L0nOipn0N6YWHP8IAGDaGz27ONVL84ILVxl0Vv0U8Eg9/9b3q+IEH/Ktuv9ic0KzbmMiJywTUPLPetZ0mN6iFq3K+VEWKOk8VQlLmDmpZj2QLaE7Iafaorz7ASh62OAjAUuZMMh2cMNc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=EiIOkWYO; arc=fail smtp.client-ip=52.101.228.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="EiIOkWYO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iEFU9hAdu8YIxWJHJCy6TrdfCNKZ0xHZSaXeHiFkIQ5Ueoy0vDuuxJ/LYCsczEC2o5NBUrrwAd2T6pp2fs5GKYvavqb8QPxpRLLFu++wWV7v9qdC3OSVjjrDmlvgwN4aMXQ5VnpNj39T3ZVXUkLw5n0fR+e+GM11vtEZlOM1NESMDhQBVpA00AKCwc1teSFMGqBc9qftpFvAGJylOlz05B1Gc2pMWJEHfxsbyglpYUyEsAEKpO8Q+Ew5o6Hn3Go+97Uy/CM+YlYhYOHrARAK/hLPbkx9/+Jcz0ZSoK1h8b2ddDrg12ySVwb8jclL0Q6xQkngGLd1RkT6MtNi6avQzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nIkSdSVStzaAXLWsy+dx0hlyDQeI28EZ8fMP+9XWXmA=;
 b=HmYsDYQzvB4awHNHrHx16Om8zsfE69YTV4zd/VnOXG/yqG/x/c2oVteUAIxUgI+9IWDdxCyBFpzIjmA1zw/T9jg3DYjhri7ahCtjlHY+CDIL7v/Is8Ul+OmTAhW7loFu2qzmkUGXGaeiB41+kdKlTNqJPPX3c7ZFzyjpk9YFB5TQC9KXJti2ABXmKc/Y08tcqClLKq41qvtU0frJyuZqMHBggLG0pbxPdxhSj6x6FTCevLZ4AumLX4RKXK2LtJCmG1mfrCDQ7iBzqiofW+DA4OHfMagIYXRWaQ2GVDNObdozB4dZiW+HUGHIFjeb3raT5+m1p54vQjH5irXoAzEftw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nIkSdSVStzaAXLWsy+dx0hlyDQeI28EZ8fMP+9XWXmA=;
 b=EiIOkWYOUhKLZN4mpB8v+R22oQg9cMJSRz3QGCsiQqt5ol/fgdAlz3KWL9UEhcBV5S49gyVPI8hiQdrn6Vmnz/3AkSORGtTMdIPSb0gwOPTpoDLUhBSZWV3jMdTlt+KU1vhvyw2GppAJ/mcPPnnki1uxn2vQ61YCGa6Htw4hXU4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB12366.jpnprd01.prod.outlook.com
 (2603:1096:405:100::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:21:04 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:21:04 +0000
Message-ID: <87tt02ru4v.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 026/139] ASoC: codecs: cs42l84: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:21:04 +0000
X-ClientProxiedBy: TYCP286CA0137.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB12366:EE_
X-MS-Office365-Filtering-Correlation-Id: 222ed623-805b-44e3-97ea-08de0ad91731
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2cx0nve1QMjsA3NbGUxajU4t1L1lmeqw4H0SyoaBQnmD2gM299GqJCDDDDXI?=
 =?us-ascii?Q?ipmv/CTDJI0FUotMxKNlcLehghx9kU/mmoNhlhalLheZcOrhJ6JpmlLRhOg6?=
 =?us-ascii?Q?KvIF33mN82KMT7L8TITc5qMdKBN6Q3GZUAf3oxsy8REx0YsaaPm5LVBDDiap?=
 =?us-ascii?Q?a65CJDmLI7oK0iwyDHbPlsyUxSSReKMskTyMKkjPBAgCPC9SKlXadPYYDVt8?=
 =?us-ascii?Q?M/ODIDKaQk+6bbfPTOu5g4VX+fMZIf2fN9RCoaavQ8moAF8IHogMHJ6Rcej3?=
 =?us-ascii?Q?9+UZkRtar0aAYA4C2XBvek61kkv+C69T1dohXreRs1OfD7UkPJAN18ZrDgRz?=
 =?us-ascii?Q?8YfxBXK+XGK3UYylJjdVhzE+EJDlRmjDGVk8Ecn8AyKv38FKfnVg1Ie4+dv5?=
 =?us-ascii?Q?o1cBhKlu5WQwTHiC0AeKsooRIeI4N9VwJwpIRCKKDtbnscnmtlvyriQnO6U5?=
 =?us-ascii?Q?dJtCin1YIsjh6D5kFEoqfShumoyvea0HwVTZ/ruvOjwOPa8Uf3Zdlj5HujiD?=
 =?us-ascii?Q?yz61ti31iJCtmE/oTSLM+NKPWuAhMDBScUfSZo0lhMdrKVNAbPSwr9TVV7XM?=
 =?us-ascii?Q?PLcWrVAt1FOC8kRzq8muXoz4S1ZHpHNL3mT+DZ+9L+cAmHbcCIRvQNX6x+cL?=
 =?us-ascii?Q?OAcjxA5zIvQD3wfmBMeNtppEa/hWYaay7BYiWWarLO/wQBmnq12aoTeqWbE+?=
 =?us-ascii?Q?kylIvcpIM9TGmL2MSXysEhr8oc5dLXl7XHjl3TEq+AAOpPC61YBZ3mcx+se5?=
 =?us-ascii?Q?ou44bezFLqWV6Ibj24ErmwCTspsMmyb6M1ytiqjmdz0P4S6Xh/nYh+0ya9Vh?=
 =?us-ascii?Q?2D9ij235ZL+B9AuL0Dq9nlpGRTLVXygNKeqy/Iz90h8UbCEPLdkvPPo+d5BY?=
 =?us-ascii?Q?K0GoxUoQAzysWPG1uRNglQ1KNJK22vCRmgDgD+SiiNcVpPCdxrXaMLqnQ8eR?=
 =?us-ascii?Q?rG8EH8s27X7YgDgx7PwWAsY9L9lrQduHVk8PGiaLvPmuJZ+UOQ0FiAMoSd1I?=
 =?us-ascii?Q?9xbCoNSXhaMco3PTVy/1eFX2mJoJzdQdgjHLXN3nBedyczPlfXAfWz3q08Ki?=
 =?us-ascii?Q?3Dzf/YZSkzgL0uQLh3HKwy+k+ZZtL3LJ2e4rbGMTyu1aOwnQwQ0f32I0V6/g?=
 =?us-ascii?Q?sAp5imh/AWHDG+M+ENPS7ua8AUj8LDyypR9nD/ljiMHtCk/Z0M2E8BlcPp9Q?=
 =?us-ascii?Q?GA9Xb2s1yuLD+G0ZAaHN9jJ8OQ8YaJ/Ft2gO2o8puX2/3D33PA1ZlxjVwiCQ?=
 =?us-ascii?Q?xpW6GlVO/eGLi1J2HoPV0IMhnWrhREgc1dGDwYaV7pcluutqQuLv/FX+M1+S?=
 =?us-ascii?Q?05gfDKXHCBzilDqJp7ba+C55U8XaW1MMj6KjYSWKePRLHT5T/1/sJ2F3Jtg6?=
 =?us-ascii?Q?kc8yF23Ji6oqNc1l7JoyZYP5du/dt1A9k4OXBu+n7KXMg79BA0RUs56fr1Db?=
 =?us-ascii?Q?d5OqOtHpsMfTS+D93QX2zCc8vMalWpuvAiOVeWsVWKiDWO6LdYNLvaMGamJY?=
 =?us-ascii?Q?Gp/CJYnla+pe/LnNnJSvJJUBxbZnarVehe3o?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4MVFJ+HydUHijZPm3cKCoVbb0jH36V4wPIJqGWBdQisCnWlEuPvmktnF0640?=
 =?us-ascii?Q?p5QobyaEWF/myjQ6eKDtisdqlG4jp71lV5aXQtPuVKbriaT5GO5+HG+Qbcod?=
 =?us-ascii?Q?2mq2LPBMc54UE2mSgvrCG5VgzYZ6bC7zZX8ARKfjNMy6arrOTHcIcViicbce?=
 =?us-ascii?Q?Z8jBavXDTRgsBrAyuyVAPWD9VToG2xuCvVQypSW8M/iW4Xy6MOnd1iYzTvVl?=
 =?us-ascii?Q?rbpKxYGA4pTxZq1ATX4biMGarvGJD6O78X766+fwH7ytWYJoYuiRt7FizLSh?=
 =?us-ascii?Q?S8Z7i0f8loFJwCwKHMG6MH6ZeeMlhxbMBqUc9YBIYQI4DlGd88jGuxf8F0n+?=
 =?us-ascii?Q?jTVxCxYTRomzltQsIBj2qJBFszei7/lPVGtmEkpwyitVYTUKygGh9si7PW2t?=
 =?us-ascii?Q?EiFnpUrMCdHOutOcQTIvH4E1SOcSti+u4SzdrOUAxOCH4yutjXnpKpCp7sOq?=
 =?us-ascii?Q?wrVLAl4UlHnxyZYBq/M7nMp6kYb9svgBZxHKpglDxEZOWUXTvcnAS1mSoMBX?=
 =?us-ascii?Q?jY/jttBEZPl43UQAw/LPnwNEOZB6lqJmkVlqMyGlI9eoQwgiVIUcK+bpYMsj?=
 =?us-ascii?Q?1Uls4S4/xO3cQebJPEosMCx3/wjf68A/7yOdjghJm9bVWx2H0ojyZxJlfrs6?=
 =?us-ascii?Q?Zj+Y4Xz0BAGu9GvBGd3fuufzj7Bg4afgDddSoU2/h/+Co93QX/19+d5b3Q6l?=
 =?us-ascii?Q?42dKnWijrOUolFwom2NPuEfuKM5ZgQSyu/ra0LQ/WN6sFZiMQfwy+8gm7ACf?=
 =?us-ascii?Q?iLUXrdrZ+iDoyFSk2qmoDCvKicR2WWMe7aICHeYXRaZZQmTrhD5L+ZTGqPob?=
 =?us-ascii?Q?a60rtdxEhoBd0L8/bLgbVcgsGJ9UbrdrtOweJPbPU0br+4w7CJLgtXC+Gngr?=
 =?us-ascii?Q?rtUeUF82Wq5110yGiLvIWvgMAoCRhHlNhCTHRTyEvDQnM7gF62pKgvHaN51Q?=
 =?us-ascii?Q?MEjbU5td794vMLkkuy87AivmmgmtxY91ZKdKebNr1vR8Z83h97u4iCh9t2vQ?=
 =?us-ascii?Q?ReX2l8ngdy9LD4lJaLkKnKnJUFY0r27w/8GU3ODPdRc6xBh3Zh/iGPOlebjO?=
 =?us-ascii?Q?sjdtNB75+MBIHrFZGlhzvepCwM859e/IwfMn1QfaJ/2zfU4/rJxwQ06otSoE?=
 =?us-ascii?Q?Jcfl/iYNoVqv3gKGWVZsCl2U8H45CiXA7bgqzAfLQQ/m5C9huIS0KKQNEFG9?=
 =?us-ascii?Q?pGpF8pZk90B2kzTENA/OJJxs2N08Ht/vzpt45pFOij0boYU8G1wGDt8al1RY?=
 =?us-ascii?Q?JN1DxhjOx+JaOyyT4gMSeEnfs+VefHo+7w4Mgxb3wPUAh9+SDpCgpQFdjlPR?=
 =?us-ascii?Q?4iXhQVU8DnKRdG6YeLqfU3tC0/cDfvgWvuwJtbr8I7wwj9h2b1gSTFqX6XbT?=
 =?us-ascii?Q?7d2YsHhf4mkQIG7huFrVSyvPVvXC4ouGloepJoEltqphSct3wGMqXcHa9a7V?=
 =?us-ascii?Q?3eA8cw35m0aSmfS4B46OBDNbhwy42+bKOzVuojKcvRALnt8MPHVPdVGSI87b?=
 =?us-ascii?Q?0NX1vZT0UmukC0Nbw6YoRP/d6escWyJD3lKJXGC9QCtCsyabNp2GLbFF1RhQ?=
 =?us-ascii?Q?9d4RGojggfBI6RDYQWBxDrTCBbG4e6ShaIh+fcLHdK555C2vz9P+VQvKVU0I?=
 =?us-ascii?Q?vUG0sOSwhzzc85Nw2QM2dec=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 222ed623-805b-44e3-97ea-08de0ad91731
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:21:04.7725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rOgCk4BQiCGYt4uLUQZA06RUpcJzIOjw1sZVOnt6irpqSq4gzHHm+dvhx9SN1730XuXdDRhY076J1YnMdUviT9aNcyhD8RoJP0oD+xMhSgEuphZATjolvFrX+8pEmWmV
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
 sound/soc/codecs/cs42l84.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs42l84.c b/sound/soc/codecs/cs42l84.c
index 88cf3c03986e8..1e1307a16f815 100644
--- a/sound/soc/codecs/cs42l84.c
+++ b/sound/soc/codecs/cs42l84.c
@@ -84,7 +84,7 @@ static const struct regmap_config cs42l84_regmap = {
 static int cs42l84_put_dac_vol(struct snd_kcontrol *kctl,
 			struct snd_ctl_elem_value *val)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kctl);
+	struct snd_soc_component *component = snd_kcontrol_chip(kctl);
 	struct soc_mixer_control *mc = (struct soc_mixer_control *) kctl->private_value;
 	int vola, volb;
 	int ret, ret2, updated = 0;
@@ -138,7 +138,7 @@ static int cs42l84_put_dac_vol(struct snd_kcontrol *kctl,
 static int cs42l84_get_dac_vol(struct snd_kcontrol *kctl,
 			struct snd_ctl_elem_value *val)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kctl);
+	struct snd_soc_component *component = snd_kcontrol_chip(kctl);
 	struct soc_mixer_control *mc = (struct soc_mixer_control *) kctl->private_value;
 	int vola, volb;
 	int ret;
-- 
2.43.0

