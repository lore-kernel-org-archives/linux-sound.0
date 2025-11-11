Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011060.outbound.protection.outlook.com [40.107.74.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A10233140
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821335; cv=fail; b=EArkaodewfymU1IK1ugy5H2RLGzcAfEFW3ZwLCWTzvHaAPahsoHipNO3iM9cvVMXBVWMW3xfRaIQcLGnXEn2sGJd0A0/RrAhQQLlOMV2ZrmYRrmsF1jXcVLko7sBOHnTYDWSFwsHPDjV/v8iYw9mnMvpbujIWI/CepoAKXyKa7E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821335; c=relaxed/simple;
	bh=pvdQ/FTmpquouWPLKzy0+5Vs0IOK/bGva+O0fOlqscc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Cl303pcHSqSjOF5lqR5P7N3Ofy1DdGMjkOY8PO7stsafsL9fTHy7S81hA7qfloztYg6pc6VXIUQeg/FrOfGRcFK8nMpz96P7KlRM/e/02upPe2CRifMbFQ+TqEicVj/24wukuTd2qkghIEhVfoYXvJl4ubC0HNKoJLr/qep8Zcg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=POdXXkDw; arc=fail smtp.client-ip=40.107.74.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="POdXXkDw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sv2Tusp1Hk7poCRBUKUGdqeW8JpuBLFbhN8mZn38qO3GV7CKqpCzvPrcj5HnXI+g1AOdJ14aYE5niUtfvT84txmo7x8QLlv/HsKb2sAncj0s5KM71+SObawDTAq8qToFV5fsvbjcViGnXZ/QIt3X/sJLTjSZ4HAR+57uJRhBNZUELw7GlOVj6yNXcXmcH5Z9VkFP+YSr8Tcsv7oH5CjbuGCWNmWhhqeWrD2Buh1WSDRASszYC27o8ByutItq3S5kev3U4nY7G6fwlFAnedG9/LGRYUeFbMsfd0dRK/OYne48szz2deaoykQcQIS3QyGYrhdBofWePLtsq58DEhXVxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CzWGhy7QcP6seO9zulOhyheFm22dcQjj2GaK+I4rTwE=;
 b=L3Ek/uaZsJyRS0zeaq4vwqzSS3NCrLzj19zejuGChb/xy2qqU0W7N6H6DCPqRvV9s7Lr/rxuSvQi7A8gCWbAoiVPgQS+grNQJZsJmM226NeZyIRvigUaW3FzxZfWrf68etyRPRCmxtfngW0fK9qwvhgf1DkIBHP5i023jVeVLz/WHwxPkJrp010NigjuyVW5r74ArpQCmlQSSeFoTSFkyMk0ztFxS1vfiBw3sC2AAUp2j3udp5xG9T/a5lwp1mm54J9tKmlDEkrxq7xa8yZ7Ywlk6hH9prVbiX9Bl0GbTfc1N+lkcQGFf0HUqeLbeAOLWiJsRw5e6oZI452xPrfJiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CzWGhy7QcP6seO9zulOhyheFm22dcQjj2GaK+I4rTwE=;
 b=POdXXkDwHK0hbu1hUIhaXYzjipb0cHfz1uBAYxvZjocP6CVD0HS51Z6dX55VV/wBri7mWdjH5gdG5/Ym8l/ZWeYod+/wjGON+7R3cXmP9GKR9tmU5bfB1QcPbaP1rZR6CE7qbNIMBjmSO5jyuZGuTNS1G7ekYLqBemXWk47Us2Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB14482.jpnprd01.prod.outlook.com
 (2603:1096:405:238::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:35:31 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:35:31 +0000
Message-ID: <87tsz1tnhq.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 262/292] ASoC: sdw_utils: soc_sdw_maxim: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:35:30 +0000
X-ClientProxiedBy: TYCP286CA0031.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB14482:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d415055-4580-4f84-5661-08de20ba3811
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?57R/FBiWkrk9N1QIziYXhkub7ZdAHBu8YoYXClwlSzLQntT8eagvW+UgWs2t?=
 =?us-ascii?Q?IaeWS+tCjYDrk9chufLbhBndXf8NRTTrdfqx63oa0rzJVRi8lGQ+sncHoSro?=
 =?us-ascii?Q?JeOuGIaEomSfg5XE7DYf4jnDDTeGwoe+LevBaYhXTRTXK0iSox97+bSRkdLF?=
 =?us-ascii?Q?XTbR/DS2pSooehQUNag4C0ebETMSJOTugGHM9jIhEDX8ZzO2tO1vpaF2uHYq?=
 =?us-ascii?Q?ejQN6eHmnQi7DUQUf3VDo0hmSpthr2uvBtK+892t5MNtFnKvhKWAru+cp19b?=
 =?us-ascii?Q?b5nvJwds0SB810+bkp9AP6Y+oMibQRFWEof9jgXW0Uca0uhnL3JIJDmFLnib?=
 =?us-ascii?Q?jOELHeE1O9dg6kA8B2Fe/LrPjMhV78UicB40n/RJHqu2/xJhOEAQ5Ti0vipv?=
 =?us-ascii?Q?EuDNx3axjpHOOhd7TaCOSts1/P2iYL6CttS9EI6dizYsoIpdZ9ahac4qOF1c?=
 =?us-ascii?Q?8DXVIkVcb7FWz48V+DACLDDJjOmKtxz0h44pnfekDRK+aceg/smsVCLkRyGW?=
 =?us-ascii?Q?VI0EYrfelMmwIsWA5YYl4CuIE8gDnqvOGbdhz6Dj2ocE2VFqzj7dl8hVNpCy?=
 =?us-ascii?Q?/9ORuYNd/ti2tDFbjxZInLCVzpEd5h4Iemj6KJarOYeockCRv4Ij0EcTRwSs?=
 =?us-ascii?Q?MpxFzYE64+Mr/OLlbIkFG2tsmmWHl0aKuV1FmgdpBLS6XZheFUz00tJtS91H?=
 =?us-ascii?Q?YLPzbst+rYeBos8Eb8Q5pUU2jqcEH6LuTfjr5D5GP0/PBqFOzXxiDc6I+GgC?=
 =?us-ascii?Q?isMXalee0CzYPUMRVfru/dJqOUi/bvCOfjsNrKMzeLKhHw7b0raRHjh/SLYK?=
 =?us-ascii?Q?JOcGJCTra8yXeKyudoiJ8aB4nFvGc0ySjFWILYp9+EPH2KKBnPzISOzrZ409?=
 =?us-ascii?Q?fUY1gq8B6WR1YuUHb2evwjI01l5G2XtEyNi1WeYOUdFwwl6Y8yTst7jrAYaU?=
 =?us-ascii?Q?bIv3jdtx8C6fza4LCJWOP2pMGR82tNNJXKn2sGGuCJenDKtpRe6hox9X7TUd?=
 =?us-ascii?Q?87ZV3imBxJg0Zdpv3emn2jmTdTTVcdmczbcftYKDSGWpKGRsQP9FrmMleBL7?=
 =?us-ascii?Q?fHveSjdTYDKvEtly0+5jSSwGNouOgreeCAiDaAFME8fCuhlLY943ylsSlpYr?=
 =?us-ascii?Q?8troWG8G+2LPV3jOB7l4RM8RnINfFib2Mlv6oRKBRN0qDvw0XWNR5e1VH0++?=
 =?us-ascii?Q?DcxP7JCHJ3MsEdx3OQurDygpBkD2ijhWQBP3vMwQ5gjeNcVbIIBhjmlpQmsd?=
 =?us-ascii?Q?b2WqQuCChovwYyVq93XDacl1iGLH840+lsBW0FK4SYWaP91SRQGrMtYgMHiV?=
 =?us-ascii?Q?ppxgufCs3Aw1ZPm60Lz/oFi4FdxHrqLNxz6S5Ub9P4xnzE9H8OL1MOldCBoe?=
 =?us-ascii?Q?8p0A9rNSA2sHY5NLYSOEM4qWSBYxSJv2o+AtmkprVfEgHhMpTGRf5TO6FqHk?=
 =?us-ascii?Q?Mvc2yhi32XqJ9B21pGuSTSlPYxwYFEaKRI7HsVmJfstiFdlf1kel38VmbR7f?=
 =?us-ascii?Q?Lk0MT+//7DkfC2bEpJTML3b/x6SSacbKSzL5?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MSxX/IwXkPsEclSPKFXwIYGFwEGV1e3lbCJpfwd/VOOYnKI0nQer0aXrzRsr?=
 =?us-ascii?Q?8o4QbOntK0u9Cx2St0gqsZEzbPSYEcjoHkwzsGWvb6UZlNAdJVjjVPXgKLdp?=
 =?us-ascii?Q?m9C/xqb4PHwH4Ct+xRTPgCOoLI5ADvuNehcnIk9GSbVu0scTKTeSnELNi9tf?=
 =?us-ascii?Q?WuvozWLoZTcF417hNI66DK2Ryqn4QlSLPqs+t3m3t0AKmp7GxYmtw8H2LmbP?=
 =?us-ascii?Q?5WsrDFiB0PDKpgTn1eY6gxS7bvvER00lU1d+ahixPhNo88xFZ3XSsMlGI2qQ?=
 =?us-ascii?Q?9iLntQZdgc2TYHsOSAftqzeCtfVVA37yTn1eQ8n5BQKxAdq0FsoPg37JCjB2?=
 =?us-ascii?Q?eQVT/KhRof4+W67ua1iLeIieBso4jfePgRy+XBwG9h6DvKiRaNyl8VtyMV18?=
 =?us-ascii?Q?tzCJsukVlvqNl9uHvHF9thf1z8AFyziqp4XhyaESFqgmCpNYv6PsQAbjOlQw?=
 =?us-ascii?Q?sru0uLo0hBAUFjuoJEa9BBQNfRQn6ohxqnC2pzq6fFjTqfyjRiuaRBCmyZjF?=
 =?us-ascii?Q?5bpotNLXeEzlASej3yVWcPlu9JeA3zH+PHXyD8wAeNvDMdtLFJOgQSS2PX0n?=
 =?us-ascii?Q?0e7Km5hYMCyz1IWMk72ZNjJ5yazczg7EwinxPujCpwu0S2YbJMr/exNA5EaW?=
 =?us-ascii?Q?a1w/8KzNulbQzM49QIYIcve4HmuN9awj3+k2BSFFVlAOv1ePCEEqbOIJrt32?=
 =?us-ascii?Q?an+5QQLj1uTxqroTnNkcZcyqTnhjtNsXPUFhdFvGRjlUovkhgR2z51Z2zBnd?=
 =?us-ascii?Q?QyvTAhWf/GvWacFLZ3ogBUuC4yHOtzsdwXHct7R+3Zu6rO8wDwLV3uhwTYNV?=
 =?us-ascii?Q?IIcS91as3tRJPcO0UXTbRq+wBFOqS40tFmo75UV5d3eU81WLSKqc4NAF0mPE?=
 =?us-ascii?Q?19IvSUfOQkOPkZQTW4aqPHp7LYx7/QG5y6lwLepFR8eQ5gdL7aYJy4ZsCSeW?=
 =?us-ascii?Q?s823GTlTKS0FmBGi6L/o5LLQpdpeEGbW3Xxg18Cq26YxFDpUqoBbKS/nEc1i?=
 =?us-ascii?Q?0B52oHKz/tcAOAK1gonZLiTGLmKlnsyYAQbxHIl99mm7IihIqOndMzL/yb3L?=
 =?us-ascii?Q?nj2mp/mG80RCvtTfY6KpIt1Da6a+xheUUv+FmevU355a3DZ0IUALZBB1/vFA?=
 =?us-ascii?Q?9VfGgIVb4cHOoEcbEVjJApyHnC2X2TXeYghOKRqDRLvGJCqBiqlzFCswRbHl?=
 =?us-ascii?Q?O3OipFKKWKWIZf20aYz3xlcKoDb5Cioa3uPRoNoJIfVGLk08DKZVlWLeuWCy?=
 =?us-ascii?Q?nt5OWjDwHBv+014ubm1ViFJYhr7u+lgH/5C/cKcjYx5eR/kEzF4eKTrbtglA?=
 =?us-ascii?Q?whLaYy/UoI3euOIM6Ji+qSy7uHpRtWM3lmO04KWeRDfruvubUL6wIbL+A0JR?=
 =?us-ascii?Q?dIpRk0iiXfYEnllWlsFgfRL/Qq1BE432H0RusnWxMhjWkI8tK4NXqcvDKEEV?=
 =?us-ascii?Q?Qq2LdT+pzGAvtkdcFdNmAT9Kh0p8//uvXWE3H8IjKhYLGbkwlCxwlb7f51EU?=
 =?us-ascii?Q?YCriV3e+AyApAFgXGQi2NE7pkLnXJpiKfuqgqt+4/3BicttvnbFljdWWlM12?=
 =?us-ascii?Q?hUS5Ipn2zC2QR9iYVAiysVvG2/DIwPqY3zvwBQ6DDjvrXY/6nsnJv3BRQPaq?=
 =?us-ascii?Q?FBZfmWfQ5s4eQXq9yg3Bl0U=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d415055-4580-4f84-5661-08de20ba3811
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:35:31.1177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ph0WRclNNjqRe3QiIrbpSc8ntDStcLXGLxMdMCDziftlI2e2XJ9qNqoSmaT12EV7qle1G2XMQSFKEO5k89SyiY3UyXfMMqG++L+Naw0k71e4UdoFFXej3FvjpCqYk6x8
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
 sound/soc/sdw_utils/soc_sdw_maxim.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sdw_utils/soc_sdw_maxim.c b/sound/soc/sdw_utils/soc_sdw_maxim.c
index 8f9d1ed0725bd..14090b032cb65 100644
--- a/sound/soc/sdw_utils/soc_sdw_maxim.c
+++ b/sound/soc/sdw_utils/soc_sdw_maxim.c
@@ -26,9 +26,10 @@ static const struct snd_soc_dapm_route max_98373_dapm_routes[] = {
 int asoc_sdw_maxim_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	int ret;
 
-	ret = snd_soc_dapm_add_routes(&card->dapm, max_98373_dapm_routes, 2);
+	ret = snd_soc_dapm_add_routes(dapm, max_98373_dapm_routes, 2);
 	if (ret)
 		dev_err(rtd->dev, "failed to add first SPK map: %d\n", ret);
 
@@ -50,8 +51,7 @@ static int asoc_sdw_mx8373_enable_spk_pin(struct snd_pcm_substream *substream, b
 
 	cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	for_each_rtd_codec_dais(rtd, j, codec_dai) {
-		struct snd_soc_dapm_context *dapm =
-				snd_soc_component_get_dapm(cpu_dai->component);
+		struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(cpu_dai->component);
 		char pin_name[16];
 
 		snprintf(pin_name, ARRAY_SIZE(pin_name), "%s Spk",
@@ -104,7 +104,7 @@ static const struct snd_soc_ops max_98373_sdw_ops = {
 
 static int asoc_sdw_mx8373_sdw_late_probe(struct snd_soc_card *card)
 {
-	struct snd_soc_dapm_context *dapm = &card->dapm;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 
 	/* Disable Left and Right Spk pin after boot */
 	snd_soc_dapm_disable_pin(dapm, "Left Spk");
-- 
2.43.0

