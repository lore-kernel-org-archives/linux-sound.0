Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010015.outbound.protection.outlook.com [52.101.229.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDD622B584
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821311; cv=fail; b=f3P2pZfeeb12CxWY6yJEBdE2P4jO28r8f5tmCrvTIuhSJxN9ciB6+dXtmifjoQ2Qgstz9vlfIj4xLZTZdcQwB47C79ebuetaMwJzqlEMG0Bpqq7mBHQr8k3sA3PhZWnTWMbIps+1uCfh9FfrXBabuMINkDgZF0adIqpEn0JImfc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821311; c=relaxed/simple;
	bh=rQYIUT8ir0TGKKuxyWtMTB+HfE9w3HUEhk9tPYjrIeY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=BJTVE2ODi091jEvrIK7jEdHapxyQJplanJTlMhuG4OtyIctx5qCKhb/0l6hp+yL7xB0Ec3L9OlGnSJUY0Jqev0VxHvOrbmviwCCvJLtBphPfwfTxz6mjyaw/Xyor26ixvMBEJ9gUPmDAhgPyaqhMJmtNs72n0VdoW5fav5fOHsY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=moGiCSUs; arc=fail smtp.client-ip=52.101.229.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="moGiCSUs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gf7s3Bm4+WpDXjH3yBSwePQlUBYVfam/sTL4VPd48bx7S12ZxtrKh9jQTmZ369/wKPy8YUU6XYpsMtpD2Cf+ujlJKurpXO0o+MIoeyswER6HkV9+d8uvoluSX1RJ4S+f9jq3r2AY8C5/p/gmMt/OAIfew3ApMTadQSKrRIaK6bzz6fS7gQShdIxgncptnnn3DrNNSwmLg7A/r4OMHN9Tac2U5ZT8eysfc3/HFcP0shyqZjOuKI0qY3p9POXaYH7U3OTvEK3e2cyagXThk6byjfZV+GPKm47jPc3oromo6H+UdHgtK3YKAyeVEhY1zg8An3uBkDgo+r/zTqM2VBzBEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LhQp3J8qFIcPBu0LlPaf6TJFZS6M3xEuGJjpu1RqzYc=;
 b=Lp6O6IJ6Xk07eUnF9nzxTTB0FV39sD8p0hsbQCx84MNTJlYBIDpF/v+LXXswYtsoPhSqRDOK6sObaIsT3oDbTrhRK/626UtuXY7zKgV6rEJ/biA9ma/UT6llf8NMqIYc5m7IHfpxKk+rQnHsfFxo6URD5CBgTh2q6qo846HxHIvNUvekidymDVh4r3W075kHD0xz9QA/U7XpG/sM3Eey6mdB74mpEdZWcyS/2Bmv7TqBsdN14TLTop2c/dRSLFcj+TqCjjpp3fulIuAQJQ6mitF1+wIpzp/tNJ4MqoTyxAKG9FwWLsfztZDBmvqCYKZwSDRlZEU1ymbwMFPq6LRF9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LhQp3J8qFIcPBu0LlPaf6TJFZS6M3xEuGJjpu1RqzYc=;
 b=moGiCSUsJlM0uAj5uK8nV5VFiO5quXu8vLjPuGkMoqAkO8M0JRac4pLkD0xrd/Pzx0+WMdRpyoF9f/jjRnpZzLFzI71XGWcQV/aBxer6Zxs8cagv7mpE2gKqVKou7GIHaR67Vnowzb6Dy7xJHwq6zkNzXTHXw415q/pV5jV/m04=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB14482.jpnprd01.prod.outlook.com
 (2603:1096:405:238::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:35:05 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:35:05 +0000
Message-ID: <874ir1v22u.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 255/292] ASoC: samsung: tobermory: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:35:05 +0000
X-ClientProxiedBy: TYCP286CA0148.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB14482:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f2da17a-966c-4684-d116-08de20ba28f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?j+OwJFiUr/sVxKtx5m1pMJtKO1l21j3wHkp14Yl4jj9+n1avMbbV/8ie78s/?=
 =?us-ascii?Q?VKpkXz5VSDL/tOV9dt3lA+mwyDauwElZ4uZHigGMpDYcEc/aJFdEJcJ04izW?=
 =?us-ascii?Q?gGaLoT+IAo3SUKijO3p4WAi8xBCUtXKqGHJYVHVml3J4ctKXbPiwkigqoxCg?=
 =?us-ascii?Q?JoKymSV6vy6gyi14BffCWeXyeSVz7FWWT3DALuyIgs5JTtRVBMywerP7evTy?=
 =?us-ascii?Q?0j4twzJA9cC1EU4TO6oy0e7mH8rDKDfYPMKmlWCq2/C3iFySbCLdJsxccQlg?=
 =?us-ascii?Q?ECyphA0onsxj2bz5xkXsszSo1sTXNynY7+NNlnV+KrJdiNXRdHs632qBXB48?=
 =?us-ascii?Q?syqwBf9Ur5Gpb7N5I34UHHNPO77dmvZSFlJhrt6LZySVLsJJEsDDls9BFgLC?=
 =?us-ascii?Q?kLpf9N98u+oQWGRmAjXGr70tQp5y1IBqgO4DlDIi+kkJPUUQVBukSQ4v4YCd?=
 =?us-ascii?Q?U8KsGXR6tY8i27qrGlw/J79zO+uuv/6/sNfJK5tViefvKe9UTFZDagIWV+ed?=
 =?us-ascii?Q?3QCXLiiCtMwZcFdgmwgexs5zdiPyuQeAYii5UJZzgwxlASP7Z5kGqymQAuiG?=
 =?us-ascii?Q?OC7Ck2be433o9hNAxldDpE4sA+yXSJcoisUAn4/hWvF41XM9v98TZd79s1Ti?=
 =?us-ascii?Q?SuevuLsWZ4VsJxvioSdI7pWa9aS9oXgQdoxKbwQGoY/XWX3vRYPQu9cdinxc?=
 =?us-ascii?Q?ZxMfqzM/EDNL5k6NPLlY4cSG0LDo6H/VKUPAY9YzliIL9lnZeEhHZQPcphgf?=
 =?us-ascii?Q?+VnXW/tTR0S92TeTcXMNjJV0mMUcr8ZGS7iVDk7YX1rNKvIOhxqJ2fM7mFKh?=
 =?us-ascii?Q?caZNX691pev+RmbvBiCu5gpJrwaoNb7r77pOrAwI0ITydCwyWhVmjzaHsHC1?=
 =?us-ascii?Q?Zu3gaRZH5F+uHsYgNAplnGi4HVIDzQ47Wys75mP9kXNZxIop+gDwt9RKejB9?=
 =?us-ascii?Q?RI/YjAAb5Lb35zlr6SKokCsThDF2touDHYQYq1taGIP8TSB4JFbqz1TixogC?=
 =?us-ascii?Q?Jmr643330kncq3KCbQo3vE2Qvtfjfwl3iI3OPWe5mif2BBYP9W5KPMJKItID?=
 =?us-ascii?Q?nuQO/SGmT4omtDJVDmC2VZG7rB+BjZCYByTOkRN7/pvsI+iFK7QdVIdGN55z?=
 =?us-ascii?Q?2eLVkpTnCFwGuCLHUciPFK6mCmZMcsB9EvFKbpGDt5Ng06gdAbT4lXlEKKIR?=
 =?us-ascii?Q?XSyBYPeVM6jqOUZBNnUdLpBZnzt7PVxVs4GYzXB+2s0LZUXnl4F1ghjXPYOl?=
 =?us-ascii?Q?gHvXkAs6qvHNhBwrbYDudtqn2AVfFm1EcLs5ztss4DlXxC+vCLtKe68v6hiS?=
 =?us-ascii?Q?84NYT6KY6355+GC5yRKaR2cUu8+jt79bQQOONrIUMN80uvge/jyhivNdlZpx?=
 =?us-ascii?Q?6UFodESXWVR35eSGA20BPf2FccAH6rv9n+SYuPKWLZLOH0NBWb7UUraXRRq0?=
 =?us-ascii?Q?z4ozQEou2a5eBd1d567pAuyh8UfqiHsgxPUmGBEJWVWqyD/bbFcagzTRQrts?=
 =?us-ascii?Q?0CKoYiEHeH4lXZbDeK5Kl732gkhUhx7cju/a?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?F/bAU+kAhkML59PBR1CeGOKsfBCI9zlQnSfCk/FCBilQbzqg5B5aC48Wd73r?=
 =?us-ascii?Q?1MR2RhN2gFSjJBqn19JH4QZeWjsc9gGbm/hcw/RLqyPb2o28ZxrxJ6T+6XrI?=
 =?us-ascii?Q?lTYuUX4LQXJdDm0+BLX7f1XyfxF4JWesNg70g2FTCsU7OKhKKcla/WkVSsHy?=
 =?us-ascii?Q?Rn723ECiqdGb6e6kgcZ3P96weX4BgacVRyq4f6kNxYc1pMfHbKQsYtLuRXxL?=
 =?us-ascii?Q?erFA1e6B3hlShOYEYVEzlj79Lnb1otn+yIqKRgBEQ1bVFylp0BTpXj0+gHfa?=
 =?us-ascii?Q?p/rII7czFv408qxURnxy9Xzt9gq5aCp7AC2+Acba9XfdI+wdfnTmamN24QYZ?=
 =?us-ascii?Q?U4qJL6mg/ktx9bCEaw4mne5LCJq8QRnLTBKtT3RDnRq+k+zho0M8HQ7XbY3W?=
 =?us-ascii?Q?nBT92Ky/WbGZSs0MYulEOz3d0K+atClyAFmLILkge36uKJyOh3nxpzODbHec?=
 =?us-ascii?Q?3YoDJXGrVUJpteYH0muKgZZrtxV7cJ6QkPjYGo5Iwx/75yu0YKimbpanddSx?=
 =?us-ascii?Q?9SDI9jC6GBMC/yiDcoZerMWAdFT8KApshNwZNPHdQG2UGxU8S69frY/H1kbo?=
 =?us-ascii?Q?dNmctO/TjPQBRKPIMFOp0waJmdsu1bitCK018DSrLyTV3/beT5G4vsqfKVAy?=
 =?us-ascii?Q?Qjca0aTIJNJsP/2vXbsxoVbVWT1QbW+ql/WnHVdBfGuwPeeOghCb5R2ohCz7?=
 =?us-ascii?Q?VerIPbYbXlN9aQbAbPgWhcVJIo8WW3hu0i8lD5NYmt25v+kGhqxrzxyA/ZT1?=
 =?us-ascii?Q?Ll9MwGGdZO0cnle2tUh4/lMN7xld6R10cJxqKzr0Ud0b6M9PyPv4+ZMO43dl?=
 =?us-ascii?Q?0MraUpd13G77vLWFP2VYsAZo8kyQ3Hxsp5lxqAnC+jxrpCYqFOzXVpU8Pg4E?=
 =?us-ascii?Q?ZA7nMMTcslnM01yNC5aR+irQTDmvIClm0bcrDcSIEvSJ7NvjofP8lTnDLQUT?=
 =?us-ascii?Q?dUy8Ku4i7+C23h/50Lw6chmn+5lEnF5QyzT+gvY8b0OKdRZLhhrxexEceaP3?=
 =?us-ascii?Q?cSooznVEhTpvsy3fRI1a8rtYewGNVPFvpVYmKB6oZFp06ce98RExVC78Hxp8?=
 =?us-ascii?Q?sPXjXXp9ZvrotBXVD64e9Qh55M1iwYlAeEIUwCCCYwHSQNdbte2rpbE8b+kO?=
 =?us-ascii?Q?Sq1RWonoxNAVUfjCLc7Mdplp2rJ/MfjaiiG/SWrZrKMp2OlzuONP+8OP0CNS?=
 =?us-ascii?Q?j8aqqQ1kRwY17Gc1xf5a48zd0is52GrX49/P7nlTzkmvCgqda1Leqkwq6fmk?=
 =?us-ascii?Q?iXDqWggoq7jcxcqIcezVrR8eXFq90WeR+L0b8sU5h+mxbl6Ioug7ID5sbR9g?=
 =?us-ascii?Q?m098fXaKKY/3qITHrXz5v00ibwokMGGChbXBwzLmtse0FQe5ZwcxlxYJcCnf?=
 =?us-ascii?Q?2c94vhXKaQYFgtNaLTcKmgnXnSN6cnzusYopTrmrt5Ffu1FqUJFL4pKuWu2b?=
 =?us-ascii?Q?ljnTCrErzDMfb47J6P9T9kB6fapzmVqHwulGirgOEDp9pYxdajZ4nRc535cP?=
 =?us-ascii?Q?EXM4IBhzbvM9ZngS5sAapXUKj2MSEiuTeDSHoI5gEn9yqBLs620ocjXHzENx?=
 =?us-ascii?Q?Szs0MXYzKb/rQbA1Uar66MoEUfDlxmqKV9t/SPrq2Qkmcnz6kyV5Q+Wf2fmC?=
 =?us-ascii?Q?yILOSU5/55ZzOnqt0XFKHis=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f2da17a-966c-4684-d116-08de20ba28f0
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:35:05.7276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /sXwJEG3qKzjIvvq0U/KzKuJeDgcTQ7Mx32Gkd0lyyKzc/80MYkmAXYPAqC4GnWCLu6z6itb9cYDe7ZggNLG5cFn/JsaaU+F7szjP9Ox4VNR1vpJvk8xLpBCRJNNfwSw
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
 sound/soc/samsung/tobermory.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/samsung/tobermory.c b/sound/soc/samsung/tobermory.c
index 1d0a782402f03..5448c16199bd2 100644
--- a/sound/soc/samsung/tobermory.c
+++ b/sound/soc/samsung/tobermory.c
@@ -24,12 +24,12 @@ static int tobermory_set_bias_level(struct snd_soc_card *card,
 	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[0]);
 	codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 
-	if (dapm->dev != codec_dai->dev)
+	if (snd_soc_dapm_to_dev(dapm) != codec_dai->dev)
 		return 0;
 
 	switch (level) {
 	case SND_SOC_BIAS_PREPARE:
-		if (dapm->bias_level == SND_SOC_BIAS_STANDBY) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_STANDBY) {
 			ret = snd_soc_dai_set_pll(codec_dai, WM8962_FLL,
 						  WM8962_FLL_MCLK, 32768,
 						  sample_rate * 512);
@@ -67,7 +67,7 @@ static int tobermory_set_bias_level_post(struct snd_soc_card *card,
 	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[0]);
 	codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 
-	if (dapm->dev != codec_dai->dev)
+	if (snd_soc_dapm_to_dev(dapm) != codec_dai->dev)
 		return 0;
 
 	switch (level) {
-- 
2.43.0

