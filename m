Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011063.outbound.protection.outlook.com [40.107.74.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9940978F20
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820311; cv=fail; b=WJhiH3BDoj3IJWJAT863O6JuTAlD9UZneUBClzJIYYNKJ0UCAcEWWH817+4HQULB+ZTA1XHZj7yJbEIA7fnxHpjxbyM8OdstQuuO72oQgP4QbifticAFY8iRoQbl1kTvPS9Ypw5tijwIYkQZhhQ7iG9zahPYpH/Qfcf9/qlWVX4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820311; c=relaxed/simple;
	bh=KJDgya/Gbcs7GTf7M5Jfbq7dMuF0YgvQGl6Awa2qhWA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=MWkjonIKdUPfJ8X1g6QFkwBkSK/9yWqubSPWgOwJbRlwzOkofcHx9H698OdsHA3TjyYtjKgvbpm7rE7r3oyPqQfs9PxV0YI1R5aySJDEEiVvTeUb5K+/SNiRbraWAwZLqEG01LlHe/bDeAZJjT7duM5dnTWsPNqFr9WTxsgVFYE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Y8nci+Pi; arc=fail smtp.client-ip=40.107.74.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Y8nci+Pi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v6yhPzLUzCuAa7L5KKMTY/PYC/3ALXr5ZbyulTI5294+xl0t+Yb/GqFoCCuPsMNy1BroQwLhxJclP8jmSRUrqJLlk6DOXkEz1aiADBzjo1Bsecm7sloZ42Rn7PhYuWAksAHCi/AWJ4CyRISzi0uGogLOBx78/GfoDd2OqavV5V5gZM+n2zHrc6BwNF+6+RIo6FQLpnf/Z54fbkYM+oCnocNCoFS1eEuJWV8nF75o+fYcfFBA1jDzgsoRSY3VowgeLTNeuM/2OWy2VgH1UCUuWMLYibjKqjM4uCduEQr+0YKXAKpqNmMzbLyp7OflClHw2Ell3uC0/16kiePi//2j9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0FKxDTaIY1hlBPexKb1Fc4kbeoEAY0mo0Kt2Tg59Jj4=;
 b=DLshKrzNlXps8URNH4VhRcSvXCo2I939N5IKy7BN0LuUs1IqxBu/+Kn4letLVFcAb3jFQ+sumkPeAb2gxynL7CUYltP8HuWOHys7IPwW87vEtQ6nOveHkCZRsn+LdMEpboExvAJSeZXkhTvdwkBldVp/ZITbNGfULyeoukPslH2aDtbISLmLUq6LgTnbAP7MQd4a0PvOeHK4+3LSbB1LvE8A8ffEUcvWmd59ZG2QsxNdSbPsPVYGmKZ9EpUXH/FBPuw6wlsaQ39PaQa7Lqz7LKMysLAFOTa3AToD0f+geZpR8PxDuSg1beUHrofwolTunP+oB6K6yz1q40DKuVqKdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0FKxDTaIY1hlBPexKb1Fc4kbeoEAY0mo0Kt2Tg59Jj4=;
 b=Y8nci+Pi07HVNj9YkEBMIVQ0p2V4aNgukDXMGbT/ob8wEEFOZ2u/wi3OOkWjEhznQEZQt5T7gK67xze1IxpxkE9S+Eq8lT470cetGFiTdjPokzGri+BZryazKeMTqgO9N9U/etXIOHBTGMIr/kOkEU6dWQi1JKmgLphnIawUgAI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB14299.jpnprd01.prod.outlook.com
 (2603:1096:405:20d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:18:27 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:18:27 +0000
Message-ID: <87o6p98lrg.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 017/292] ASoC: codecs: adau1761: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:18:27 +0000
X-ClientProxiedBy: TYCPR01CA0191.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB14299:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e9dc455-c69b-4d42-4a6c-08de20b7d603
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fgVhgXWuhZr+u/AZDqxyjgxvLlrNYLxJJUiwht55Zwojqx5zc/85pPwTUNdf?=
 =?us-ascii?Q?pNNDgLSsChyvMHbcga1o9RWujM/5nW3vvTEftrgSVtuOAPeOnKa0C54o2qRy?=
 =?us-ascii?Q?y4woZSII06QXeYQXPPzHwDTdfaqgoblh1Q7TnkEXQY4fxyamVRTzWimlVn19?=
 =?us-ascii?Q?tQ4jQoUKLs92esOiDE70LNYwxENhx+Bo7BNnuYmDXq+9mLLOEXpZW0Shj8fu?=
 =?us-ascii?Q?ZvdQqmroU4Z76qAXOR4jPsqv7YnqmdBGA3RalWeu9hbLz/xXJxPlh2VmRYiQ?=
 =?us-ascii?Q?5mlW9PgK6lTvxBhBcdPXC8VFfM8rupNfi9Dw9OXavwiUdobA8cBqqEwIQD4a?=
 =?us-ascii?Q?PzyDGyjchz33QkvSoStXxzybRlnW4i3udLAwz4GPT92uJwIxzF+ipBl6NNBc?=
 =?us-ascii?Q?S6VD0c6qILv3HXo5IO/wS0V3Mv3noZFn1dtMnKjX1s1LHfGWTU5mKeFHMHA3?=
 =?us-ascii?Q?Ee4fIpvi/3Kf3kcpK1mAbFpPp0loM15CMeFMjdB4KDm2XrvQWyW/k9E2kwqW?=
 =?us-ascii?Q?fOdFdvDxaiJLPZntJj9e2PQm1izC/x/m1d+F8X4G03pZbH2fDsAZUUKfHv7+?=
 =?us-ascii?Q?Hm4lkaTXjbBICuN3HpgX4afHZi+ZPidKoIfnAXoQxk21Inv5HQys2ZHHruyv?=
 =?us-ascii?Q?tBgd+TJrHiZRXqlardzZIrXXkZy4Fooa+6yOKrzButW9KS8zF+B/opKEUUPc?=
 =?us-ascii?Q?rYgMItmlzCeFGlkcDWRjw01uXLIJqtk/HBsO2wRa+rn+T3pJUtLEL/lgLdFz?=
 =?us-ascii?Q?8tJ2Vw5ZkbFgchSBa5bkqRs9mGTQCe8wrPBtJdvt7emlIBLhIQ5eA6W5yPEG?=
 =?us-ascii?Q?KH+BnTtkL51w1aSt+swpzLpnL50cZ+LAwiApA7lQ98bmGJ73xpO4A9sqQgtg?=
 =?us-ascii?Q?pvO1mMlVv6622AnRz3kuGq45/joghipm5oRtflFvnnY05QCWRxIxMfcjBziI?=
 =?us-ascii?Q?O1s06UGFjnNIYLYNDLjKm+0OcCziyWvfiwam0HkCn7vMc98CRbPwn/lQ6d2V?=
 =?us-ascii?Q?A8uxaA1hbDs+CmTmPCDWl337yE64cAy3MRXGNTDZn5LIMpJdI8+ogcIoSjwg?=
 =?us-ascii?Q?bjuzLW0i9tAfq0g9gU4nYjDPxOX4mOzNWxeWivX8+68VHwHW56XnKBfaK9Ua?=
 =?us-ascii?Q?z+S4EkjnzwxGmcdb/jP5z8V689JGrtSZq/FOZbuvYwawi5bVf4sveOVys6Vx?=
 =?us-ascii?Q?aIfFNKR9EtYXjw0tX6OmoR1h61bUwIiLA6LNTqyD+dupAqzZRiOE8FVEN7Cn?=
 =?us-ascii?Q?hvTtZDEkyixdHuDx389vy5i3bIDgYak+dqt6r5vEQmta+fY2FgcdgJ5lDsw1?=
 =?us-ascii?Q?DXhWCNBClvNxxqf40OhN0wUBTe4w9HKN24UeC1ANr8vcGSVlDpLvTxfOg4FM?=
 =?us-ascii?Q?9kqNjsK361J5UNTUtQK7mx/vCTRZbKxi4xOZjNQ1rUApbLyrJAdfjONJiUjW?=
 =?us-ascii?Q?g7eOv94BNeG89kBoPSSLnqvHoY+lKPoQ85VGZHjNt4T67izv/f04l9IYZ39o?=
 =?us-ascii?Q?jHA+MvsUIu6gQlt9BNy+5H9zZ1F2cY7OvS3V?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qts9MAvnIvs4yplYA+nkmt81EEXzmpp1aAC1NxkOTzYuL+yE6X0z1Z+1moAk?=
 =?us-ascii?Q?sromelbzRIK521OV8Yga/xPhT8x6LA4BqSuP9W97FYAXXFcoWye66sOHB3ZV?=
 =?us-ascii?Q?bNiovQ9StDl5ai2mn14O1t5YIeWcxPU6W8JuHFEBunAyhU2U6vqRoFMlZ6RK?=
 =?us-ascii?Q?ZA36JBZmtIeXapOeqRUy49U3ulCtWeAhdHaFqXg+hpGEsAzhSWT+bQ5EWHzR?=
 =?us-ascii?Q?/m/VYNa5QSW9Dy+lPvdCU60UBTovju6MKJmNMlyp9ILXE2bLwKN1deUCxPkw?=
 =?us-ascii?Q?sxYtshh0fl2oHg3RcoF2EcjCX2VaRvZM4t4sz9bXNf+/78t8fto+ZoJNLsBJ?=
 =?us-ascii?Q?OF9tL4Q2uEfabcJJvPW4s1EtpqKBDeZ3GLYpzF59bi136E5vrMkUlltwv746?=
 =?us-ascii?Q?DqQ5nY8TaTYRx8TC2x7aKaRMoCMFEZuQ7C3fFScZBdhdTdioBK9MtwyzZNsJ?=
 =?us-ascii?Q?m/Jug9SnKGAnJ0aTkIbbw/ySg2MHNbpJHmah8qjSOG66xezHHnH6MstPq//4?=
 =?us-ascii?Q?0rvymUyV8y7nOgJh+Cdg/481TiQeSB/P6tC0Wu+ngcJ+BUDRGv+Iy64tPnKJ?=
 =?us-ascii?Q?kVSOIoourWUlbKdU/DF7wt6QbalIzGZqebZT+KQS9falJ2P/8tC7tuvU892f?=
 =?us-ascii?Q?ZOUCU5M/GtAOBdBd/loRIOcSmjJWbkM129kieQEIDkr1aee31AA26dPEVvoe?=
 =?us-ascii?Q?eIPPqXoTfMb+qgGb2SkH8nky3RVYGXxBwlF5GJRxoAhSjY5wH9yzwqfnikme?=
 =?us-ascii?Q?szg5gImWCDwvCCIRC4Na+XHmcnrTGrWZsaGlyTcLeQg70kcfnq9T3xsxZl9p?=
 =?us-ascii?Q?xcl4PKqQfXThswhSQ6GKXjkaRoE35IBRtIj5+mzdysYCOWsGv/MIkR+4uNkv?=
 =?us-ascii?Q?UaLZP7CeqKoCQcDwAgTrKf+cnAauswUqzOT12zGM3VaTu5FfRdjIW1e1wryz?=
 =?us-ascii?Q?J7tPV4MK8MIM9i9Ib8dwUHmHehNZRBZmSFcIA5yIwOl5iPeZ6voKdloaQ8GZ?=
 =?us-ascii?Q?WrcGmK11nVM69v3fsYyjErOLHbkqK+u2qguNNiyrqlw3lhs7+cE39e5dZ7Sd?=
 =?us-ascii?Q?p7IBoRUGw+6LfdNzWwAiOByr0smPxc+UGrJQKi9pIWo149nDup1Mdo625TMR?=
 =?us-ascii?Q?9Bks4378Y0SmToaFhAdrz0Ei92MSV2Q7tC1ReWOIYULAoS2lQPzWtyV5UBx+?=
 =?us-ascii?Q?J24QJNiEcb8ZnZzRHx4TsdhWFcpAZurWxtae8KJzcoumWGfusOI9Qc5cU6Vp?=
 =?us-ascii?Q?UN6DVA0NBvgt6vmjrwynRKI1qD4qzuuz3OjU8WJ7gi2MfxcOY6CtL+Cw4aQE?=
 =?us-ascii?Q?RGr0KN3Axr5iNvdrTmUZibWKc3GoEod2I7X4Wne8gtWfuwUbr6CuFlPz6elJ?=
 =?us-ascii?Q?aA7Nkk1d2j7RakOqAgfOxV6ro1aRkED/r/d+WojLQ8k9qf0T4dAE/2SqDsg/?=
 =?us-ascii?Q?glBWkCFgI5652KuEuucnOgtLUOylSl3ZDf86N1TYU6yJqDzwH7UqXE0KYl5a?=
 =?us-ascii?Q?4Iau4e9M/ZeUAd18qNVKOTCGrrgatLGULefacLaR5A9eu3u5SJOjKUnADxte?=
 =?us-ascii?Q?CMbd8vb6MK/7DCAmgq80qkgGeenK/AwKwy5azt+1yqVaC7X88hSsdbwN4BaR?=
 =?us-ascii?Q?K/xAXayM6mNHkAV7TBiDwrw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e9dc455-c69b-4d42-4a6c-08de20b7d603
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:18:27.6525
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lf7AVG0D4mberezqUnFKinpX6GD3M5+BHcE1/ScEKHdK6Rblr4w+c3Q151dQxOgsZbou1MhC+c+nv7MYCwtHPMSYuCZmplnyW5d4JIt3JGnQ00LNLY+hwTeXGWGBAK5X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14299

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
 sound/soc/codecs/adau1761.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/adau1761.c b/sound/soc/codecs/adau1761.c
index 1f09ea385f8af..a70c46dd5d76f 100644
--- a/sound/soc/codecs/adau1761.c
+++ b/sound/soc/codecs/adau1761.c
@@ -621,6 +621,7 @@ static int adau1761_set_bias_level(struct snd_soc_component *component,
 				 enum snd_soc_bias_level level)
 {
 	struct adau *adau = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 
 	switch (level) {
 	case SND_SOC_BIAS_ON:
@@ -632,7 +633,7 @@ static int adau1761_set_bias_level(struct snd_soc_component *component,
 		regmap_update_bits(adau->regmap, ADAU17X1_CLOCK_CONTROL,
 			ADAU17X1_CLOCK_CONTROL_SYSCLK_EN,
 			ADAU17X1_CLOCK_CONTROL_SYSCLK_EN);
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF)
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF)
 			regcache_sync(adau->regmap);
 		break;
 	case SND_SOC_BIAS_OFF:
@@ -658,7 +659,7 @@ static enum adau1761_output_mode adau1761_get_lineout_mode(
 
 static int adau1761_setup_digmic_jackdetect(struct snd_soc_component *component)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct adau1761_platform_data *pdata = component->dev->platform_data;
 	struct adau *adau = snd_soc_component_get_drvdata(component);
 	enum adau1761_digmic_jackdet_pin_mode mode;
@@ -721,7 +722,7 @@ static int adau1761_setup_digmic_jackdetect(struct snd_soc_component *component)
 
 static int adau1761_setup_headphone_mode(struct snd_soc_component *component)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct adau *adau = snd_soc_component_get_drvdata(component);
 	struct adau1761_platform_data *pdata = component->dev->platform_data;
 	enum adau1761_output_mode mode;
@@ -819,7 +820,7 @@ static bool adau1761_readable_register(struct device *dev, unsigned int reg)
 
 static int adau1761_component_probe(struct snd_soc_component *component)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct adau1761_platform_data *pdata = component->dev->platform_data;
 	struct adau *adau = snd_soc_component_get_drvdata(component);
 	int ret;
-- 
2.43.0

