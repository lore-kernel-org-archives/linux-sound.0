Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010041.outbound.protection.outlook.com [52.101.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B85A233140
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821344; cv=fail; b=fp3s+OWQCbwtaIA2kqh1A3Ie58usGzVwCQaFQVoQhFqNmElJNgNnNRzzINZNCyCKgJ3vhqp65am3rPuD9KfDH3icUT7z0lEGXoKUaP+tfe2Jo8+7xA8RAly4Lp7KMzP/ryK9eBCnIfizLJlpcgS57hNY5wqWgNiFBCekKWpHKQs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821344; c=relaxed/simple;
	bh=Wja0KieAol9P09u8RWaP8DUtJ92R8+/3behlqiKhaso=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=JRJxRKmSS3D7Y2R77my5owoDVrQ+X/6K3433xQ0GBTDPF6UNqOuvn2mA5xGkqAgSvoyd3ttvhD+nwzH/hzjNqbdaZdxG5pECGQF78DviewhuvVVpCE1x2uixgK+b2VEPJzycrQ83T8AlefAp0Ntwv0u2dlcOSIcYry73hXfFvxI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=nrTvo4D2; arc=fail smtp.client-ip=52.101.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="nrTvo4D2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NKJikTe8a0T9S2+jel1LLwOMmZzUg6OOMGOEudNm42HWMQMcwdL+RDW4dhmbZbhEgdiEhZ8XcZKuI4mdxUSuHvcvBUc4sxjhSU5Eu4hzCeX8QVFDFGsG82rfNdnWcQsXB3teb/9jCLqpZzgv571P2wzLFK/H+sB7Ht3cUGFdaohxwF2ibpu9a3fQXUIHih1+p9wTa7u86GQRno3QJ/sPnWxjXb+jMlSAJCGHER8Tvq61aQV5RB9ZLy2ipggVIk2273eai6nIu8JMhl4nILu8n3GBwQmEupVNo5JxqQ9EVKsc/Cj0rSpqZzF5HtMEsWAMvkowMwTiTUAW4ny6m4UQRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m6Oi9W3EnQdfOU1SyT3ariGARdgPrLsoD5mmJBqyNws=;
 b=VncJ33IK5Nc+IFnksLJJ6ISHC/R1o5zmfrS1mGbOn67H7NJcRtyyfN3zpKItO9G7GXD1VEYNEvK2kMsWZeYlDE+WiRwGGpUv5bkYu1uHtJBMnnv6l1DsCjFHSw1iMgmeNEt/HoV7UPGHBVP39PdAqq5MuDtgUX8Ob+WOE+KRt9tnEECVn4PopmlI2OGrT7mdyn7zoQp502qikr5ythEoHzUkoY88BdHOufivtrxyaJgAMjrcubvIxYgRfqapglrvWmiCCN/2Nehrn6+/z2idP0wNgJiZ8KbQA0Z7G/vFTO5G6hsGmXU4bdJIdBGff7BsAAsoYMd0cMjuaoJz+01Yag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m6Oi9W3EnQdfOU1SyT3ariGARdgPrLsoD5mmJBqyNws=;
 b=nrTvo4D2JR9Lkm4CMVxVnTn91GdtsIdmGFmkoytoQhCulBhDf1cB32OF3xFtrl7wLWBOBNkbjY8BZAniQP2wCeMp48XtE+nTnigUig4VCpoBIew5fL/SycuzK3arm58+lldTC0bQ5c5uZlJeoERrob1KTIX44MblcM4kTFRtStg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB14482.jpnprd01.prod.outlook.com
 (2603:1096:405:238::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:35:41 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:35:41 +0000
Message-ID: <87qzu5tnhf.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 264/292] ASoC: sdw_utils: soc_sdw_rt700: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:35:41 +0000
X-ClientProxiedBy: TYCP301CA0051.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB14482:EE_
X-MS-Office365-Filtering-Correlation-Id: 8729f073-56e2-4b93-8fa4-08de20ba3e24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tosD9046mkOge+lK2sMRBQ3uYL+xH5lWITbA+XY/E31+fHvfcTDUyfOndjvz?=
 =?us-ascii?Q?1usHjGGncJ4/3ShoSh7sXaPxSY6RKgZplgBcHqf0H0vxbLEVsqZLt7dPM/Uu?=
 =?us-ascii?Q?WlF+Jv+a+EfYs0qzYmF+BvmhlDr78YC14W6RANtze7xYLbJdX2w6oJdwSqOp?=
 =?us-ascii?Q?1zAaw3zU8rS7C1XXhYpq+BCPKtgm1D2NMHwc11ta4DgHHkzKtHSraupIX5PD?=
 =?us-ascii?Q?T6IJfmJY2NVwnGJ1O1LFDtpxd4zetawa1/PGjVnIdSpmCg3YBLdeHJ1gXb8T?=
 =?us-ascii?Q?ewv+euS3a92rWwKj5Xi8TJuB9LQZKqKWoC5UvBwUWatoL38HirL8Q+JKHSpw?=
 =?us-ascii?Q?e16vu2VUifVA+OZ1el4ikxsOx2fYtIbQAXvxHO1+xDg6PIAjnrqUcalQdEac?=
 =?us-ascii?Q?6GYcpbrr1BKGxzj8ZJrJbxfwmoQChxvsbueyEXCSf6oCiABgdPXTADBnhK71?=
 =?us-ascii?Q?nFeivJ6O0Cn17VJc8WvFb25qJ8MYt8EyqT21Iqm3hj/ISlzsKp6IwSRPyOAy?=
 =?us-ascii?Q?CNnFS29OKTcU4GIVTUej9IvIigKzNbtLSSKIiyHWvo2lqSygaeXKZH8L+lF3?=
 =?us-ascii?Q?mMpRN5OKyqtwsltcGF5g1RcjkWrV4nmuEaAqEYpCHmEV/kCtclrR/HZf2CMh?=
 =?us-ascii?Q?ajBCYAF7RbZpnNzbQawmQDgsQjIZb1KWhT3jpkPoI5ZhexwHL+/dYTlZXBdJ?=
 =?us-ascii?Q?D3nX+AJzLRgj33hUe6RtEUz7NCGP6sPcWTVeo8qa4ya1+Qm1z0+CusLhE8De?=
 =?us-ascii?Q?yk4FsYCbdFCI4o7/ekkfHXhhg+Z/sodMEWQAzyHUJnBbGNTkP1TVMm+Uf2u0?=
 =?us-ascii?Q?5GLGYJuqb2JmGgSoVLIRbeTyOm8eHVwwZQl41TmdkWo8lAivXRItm+mEE4M2?=
 =?us-ascii?Q?t8lbzC7jDxL4aixxQ8Kd+Hy5XpYR36pE0CjIH8ZfBRvCb56WzjcBMS4GFg+E?=
 =?us-ascii?Q?VBoRnvYwLJ6trYepMynB/UhkZDhYQV6t12R7ZHyLHXq+phXXOezwiWjXbVBd?=
 =?us-ascii?Q?JwqsfzsaPCFMo5Vfw5XCS30RFhf0VnR4H9emkyrtZ5CyihcdcJZr7xJp847E?=
 =?us-ascii?Q?QBLaM7fYZvHBQpCOthXnNWc6nAsw9YO/UghDfSrbL6lTwesiKmRjJEsAReRr?=
 =?us-ascii?Q?NyShtGnWcHEzwciYLoTRP22MXjLoxp7NadwPixOaTtf/RnLTvWoTC6py/1ti?=
 =?us-ascii?Q?3a/rR22T42+FsCdiAU0uuoK1qaYCHVmKD0VwiFdTwzIUZytC4IMO37v+NjtP?=
 =?us-ascii?Q?ZrmkMS/gYEX1frLlCuc8Y3w2H84npBTwSJdIuKATcE1oONIyFeVSW1gaSAdQ?=
 =?us-ascii?Q?ZsV3MdfOYKYMi5QnNOkj7FuMTbFv0NeqrI1W0ZcXri3F2iQldqpOc7ayIyYA?=
 =?us-ascii?Q?KeOfdZQ7URSSqv+nLLhLe+bgHTBFRqRhr5zxkFsJUCfUkRI17eW0BH6rbg25?=
 =?us-ascii?Q?WwG8Ot9HSdeTP1Km1ixkYS83j6HyUaz8ihqLvslve0A4PeiEXMe81FdSRdlf?=
 =?us-ascii?Q?VAvVIygO0rIk2VGZx7rYmpPDoAMU5sGy9cCx?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qETpoFAAfUNKlF1d/K2tqcIiwxz8AwVlJzHnofD+6skwfCRh+LsxvAmVBjJB?=
 =?us-ascii?Q?uudiHVGjGLlwASJdr4J5qVfU/yAL8cubS5INZ3x/F7sTK+Utz0kJ3szogU5Z?=
 =?us-ascii?Q?o8bM7t0wRwfi7hrS/Pq3pgIIhke30WCM0l7TWc+AJJ7K2s7S6xXTIgs8Up7e?=
 =?us-ascii?Q?hg93y5RIynlWywJuFLBqY7ktvgF7XgI32lL2HoKtaxQBuGczA/x0v4K42Ohk?=
 =?us-ascii?Q?tz8dYGVeTBhVDAOQZb9dDpw2UH8Qpz50p27OlJMm/1i6CpzxREmykiMT5yZ/?=
 =?us-ascii?Q?VQkGIQV0tmU4gRAGERl/ZJ2qWciN90696Mwrw6Z0/DrWjIjQXkAebH6VTWsR?=
 =?us-ascii?Q?z7pf1nbeDEUwIdVje+X7HVj/GTJLh/k3O8kYJr8lYi9cDoBoY9EyE9hwJ6hx?=
 =?us-ascii?Q?22jHjSAyth8CjNnDRx7Jlc37fteJJ4ynyfFQ8pp2/ThsXgkzBB9fxocah8G0?=
 =?us-ascii?Q?5lfVlBBgeqmeaAiCsPlzn9tM9rCYWMxec2c6A1ReHV67JESsor5XDHuW0fVl?=
 =?us-ascii?Q?tWTwKrhESQOz7ubFZLGLQ/bXwsqVM5W/Xa3MOooqnXzBPjBH4v7musifyVLw?=
 =?us-ascii?Q?uLRLezXz5y/gA7qNHuTH0bM06LgjgbfoxbJCWWErMA+fBTWSsEPReGZF5ASx?=
 =?us-ascii?Q?vuz7W0zpR1i+V4pOS2IJyOzDhlsg+7Z+Rdh3DjaoUDLa2vwri5Wyp22PgV0D?=
 =?us-ascii?Q?X7wCsNq2oY+kPWihuerQl2Jr8rvf3VUeLrNN9SVzx8FBptIK5RBYSEY2pgHa?=
 =?us-ascii?Q?GI/Fi57wt6/mH+VOk8fQEKdBM+fcGl6Y/ec+Ooml54jktHnQr5nDH68s0/sS?=
 =?us-ascii?Q?Ys0iLrtXETLkw35B3vgkTpbXwF8N7MV6R1Hlv47qSWlkzfGIDl/77acrolf1?=
 =?us-ascii?Q?A/xwvYzb5FLv/knPhGbiS2RZZZQ1TIphXFdDBLcVBCFVUh/1TPVkYhtXr1bc?=
 =?us-ascii?Q?9UEZFH+lEJuf/+tf5lAUt/9Oh+UruwMFhOqqWeyflwyVbLdlZjx1CNFPWOIe?=
 =?us-ascii?Q?cPPDMb5E7NsKCf1DsraQrl4dRz26nqX/KBbZ26SHAbYhqXSkUtUcSW7oCzmi?=
 =?us-ascii?Q?PXuaB30+IOrUh9TGov2qNBS6kNZSbZ5EVbksqwMBXrhGGkpjYYReEPIp+9Xj?=
 =?us-ascii?Q?mRqGXuH2AU698EGEev4z5T1Ts5QTNuHakzim2TYu76NMTWiQh4zEbJ/yAX0q?=
 =?us-ascii?Q?43OeCml+5fInwGOIZ7tbqFECjlcyj2G/UgAm7IOrvZ1AxGPijVM9797C7qbj?=
 =?us-ascii?Q?yOQJyZzlEGqF+9CBby1k4kp3PTWDXLjgwOrDW8bMSt0zlcNVsA2F3Bt0Er9K?=
 =?us-ascii?Q?XBcdFkC6KKoinVzmm+vtdbLtcsuc5NDkHZQ5Htyy5mOcED3F2vIoSnPbLWTT?=
 =?us-ascii?Q?0G3XUXK9KrV3Ot5jRuDy7jEzo107rGieHJwcylRvn2mQaPE5OHi1/mo6o9i0?=
 =?us-ascii?Q?HroFmefoyi2UKY/MZtUizLgMqwZXNWqqhtHfy583A4qSZ1YMHcY5oI1OJIcU?=
 =?us-ascii?Q?zMk89br7brcrzIZcXXyI5dZrobiD+6uO0F3cLNfwqOsT8TcM/tiHEzRW35RL?=
 =?us-ascii?Q?TD5l2YDN69fDp/9vW8OnF57QQNf0GzhHLW9aIn7wSNLl2/+/b6KU0k7CfOb9?=
 =?us-ascii?Q?raIe7mSU/JJBGJjxN/y5E00=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8729f073-56e2-4b93-8fa4-08de20ba3e24
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:35:41.3027
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HcFjr9ZrcmP1NpCwXeJxxl4PTvJLQY5xu2sLcECGdnzmZIgO6oOmGD65+CidptKt8iAnrCKO3G/l8B9V1UwXXL8vePDzHVspbXXnz6bPXv50kcOu3S36vIYWjOsuVTV/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14482

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
 sound/soc/sdw_utils/soc_sdw_rt700.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sdw_utils/soc_sdw_rt700.c b/sound/soc/sdw_utils/soc_sdw_rt700.c
index e6468e4ac6e72..ffedfde955d03 100644
--- a/sound/soc/sdw_utils/soc_sdw_rt700.c
+++ b/sound/soc/sdw_utils/soc_sdw_rt700.c
@@ -38,6 +38,7 @@ static struct snd_soc_jack_pin rt700_jack_pins[] = {
 int asoc_sdw_rt700_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
 	struct snd_soc_component *component;
 	struct snd_soc_jack *jack;
@@ -50,7 +51,7 @@ int asoc_sdw_rt700_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai
 	if (!card->components)
 		return -ENOMEM;
 
-	ret = snd_soc_dapm_add_routes(&card->dapm, rt700_map,
+	ret = snd_soc_dapm_add_routes(dapm, rt700_map,
 				      ARRAY_SIZE(rt700_map));
 
 	if (ret) {
-- 
2.43.0

