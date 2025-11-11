Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011058.outbound.protection.outlook.com [40.107.74.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157FC24466D
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821420; cv=fail; b=pKMS5k4pxke3oVtg+8T853T5escGkmn2JdcBRxyQmWAKki9qs44MckeSEkvUIZ0/T1ah+zKmKISnOJo8u7Ww4iXkm+bK7EfBcHwAx3uysQ+2AViMUS3lBkMf5l5WrBEDw9Qc/mIodmLRJKgxLkaaxf3iUuD61d6/rZCUVFrLMdc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821420; c=relaxed/simple;
	bh=BlK4d7DKY7XkHM2xfTJmq9RQtgPkDssJS2Fgr/5EYVo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Wu7UuoA8nTcb82QvY6+XgvYPrNPD1RuME4f9e3t1lKmd7OrXXGuql3WbwhfMMCISYcSebapIWLOKGvqDS6MloadVgcHnFqmMC0K7iMWTpdfDSfWRbAxsjaojFas7luQtrO5+m6W5JEE2UvXMBnXZ2o7QKk09P3owO+7vDvWOaWw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=cg0vkK83; arc=fail smtp.client-ip=40.107.74.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="cg0vkK83"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SiTO7t+HCfvwagBKGRu8gY5RJokHYUGepvbvHx/XF3egCB29/nJuO8T3Aqvo9n1OuSo+jZLGMaIXCQ3joprE25EdJNGwZhQWaiIWBrhYqapMVRdbxj4scsz9GAdD6+jbKg1B7TKLilOp+hLM/BRQBB7s61DWDFOg0l/YjsECFFRxXniGPOrSdcNsxjzCXsyi6o9/lO6BeLtnJp4vK58/Rf2v+Yhg6KLFDKJj/vZhm5/orrMBiT8ne3OEhF+c2E+nU27N54FiLrG55s1grREeMMTDClG+xzDwV9kbj4pi9OyI9QXpoP771ey2Ew/s/Z0cHfAo3tNnJCRGU+I+z3ZKIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jzu6v+tinugK0m09SuiV78Giqmcmy6c0O1g6kazboVU=;
 b=u5ACDzGct1uExdyd5unvIoi7m2yH6Z6wHn8wZi7tohffdhTf6PcyGw2IPw5MNof2MelTZE4dOanPGZn3iD8xEUmwnUag0R7b69ymMfVzTKF3cgv5nN6wKRjZWqB1VQraXcwD9P7cvl3vpytealUJjXD2q7xrg+dKW8iFhmvMqeDNnT2g2nBsI4YThox45StJ+WfUgvZjewo1NE3ITcwtVFF9o5atrJg7riKVWCFXc6IQJhAUmaqVVye9ck8CorIsbF1dl0m7WVGpwS+6rpJj1Zjjp9jpY4edl/hTRk/DmXSJdVUD5Z4zx1APC/Xzkeip1kkOhoFkk6qzQUMIYQ7lzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jzu6v+tinugK0m09SuiV78Giqmcmy6c0O1g6kazboVU=;
 b=cg0vkK83+Q/Z9slPLGc7bNtMsjqGeRmHX2E2uqtTWguMVmnOXd0uLMYAaU2vrkgJLl8dy2+VE/08BnmsB3fBv0fXQ9QVFDl6NLGd8aIG68BkweBfO1ht78kAQ/8Pg/k9UbUXrC2iKAJ/q2RtTIG0EmUx/FpsqGqvf4XZ1zZf8XM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB16378.jpnprd01.prod.outlook.com
 (2603:1096:604:342::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.10; Tue, 11 Nov
 2025 00:36:51 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:36:51 +0000
Message-ID: <871pm5tnfg.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 282/292] ASoC: tegra: tegra_asoc_machine: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:36:51 +0000
X-ClientProxiedBy: TY4P301CA0034.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2be::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB16378:EE_
X-MS-Office365-Filtering-Correlation-Id: c616462a-01b2-45b6-30fe-08de20ba6824
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FgnVoKvHAg3LljVyig/QIvXqvB4nJw0pyWcvqVl6zsRWghIA9cX7erhdghTe?=
 =?us-ascii?Q?UOmxYxnJKteh+YnFfivD+rAhHivqQ9GIi29+yu6mFDhe3KTCewXn+sqq8xtE?=
 =?us-ascii?Q?G3ZD8mQIxFFG2SPgsx+h7ah/TIf+Eh6Vc0JmEuinQn2o5JhN9HqOCC/XctFj?=
 =?us-ascii?Q?y5ak0UIFWlCgHFdWsSiFZm6kr7Y72Fug5VNQ7oVMiZNWbNf3NlRoW2/jdfqE?=
 =?us-ascii?Q?I0hFypdK9ealBCMWabHHTpXxsf0VN5YE5at04s+aXdOCBr2UscKyJhnXpU3Q?=
 =?us-ascii?Q?YDrcS8y1iMc9oT40qB8qULSW0InZynwd+qkg9Fr3E4zt/v5l+cPtHc/vHOxQ?=
 =?us-ascii?Q?PYQXdnUDkrR2/6+/tQqXpiKM6W+qKpiMvhFkWD08LliPWtBV8BiTTi8JAIOA?=
 =?us-ascii?Q?NNkuzQkNS8YV3y6f5bBeqyZ7rj2IkRXOlqlKPf8NwZif4K1GGxWt4aHUFJDS?=
 =?us-ascii?Q?NoNn5BRYQTv/H65pF28XrMu6v+RCnm7i5uX8eYcrjSKSZWiLo5pJgaeIY1xF?=
 =?us-ascii?Q?Ffo5YCnJeBB81kB6ZbJb3Xv7Q9TJhPkLmaq52WrNdncHRfV1rJX10xR7N5Dl?=
 =?us-ascii?Q?TFD7knl0HAgv8LWOSzgNLi2AxJz7nahwGpUWva2Xj/vA3hNUPqRL/IQrfgTJ?=
 =?us-ascii?Q?cfEmRChKhOwcB3qjklaQxRqvQyEsps/GU0+4JmbHfDOr1cFuKqMqKg7727vs?=
 =?us-ascii?Q?g2XDn+JYei4vK44TEcyz2YKM7wVUXEKpAweUYoK25APGjazYeVMemKScczGQ?=
 =?us-ascii?Q?3nEZixzJAYOWaPi24bOHkby02aDzKvdssaiGWOFGqezcOrwFCKtc9uwqTj3W?=
 =?us-ascii?Q?mWDmw2QReBDqjf/cbEbPnfVvI+Rdfn42MArC0sa06CnRKad1JTATglAz0MjX?=
 =?us-ascii?Q?GBRWmsJef/e+9c+di+1dkOD0VuGsicCoEoEvGD4AcoFaq8i/NLW/oBECavZV?=
 =?us-ascii?Q?FCA+c7OBGEQkeDvatXHHoyPzROKufF35JS0gmPIOfVQZnAlR9w5c2rbXVYkG?=
 =?us-ascii?Q?MNIFN4/5HZddjXcCq5o/v3FwdBxy7l2CbQJ9K2DwF70inQEPoLfct2X0Z7aQ?=
 =?us-ascii?Q?eyldOl+hg+yiuGFuVqtyUWTGcJtOfb0dzXTkUw8hasSyVVxIdyAqVCsF3D1c?=
 =?us-ascii?Q?q5faL5CXNyfIqYBq4GZ/dK+YWM/Q1+9RcN7R4/lAOL2Ro4pKQrmeN6EtT1bz?=
 =?us-ascii?Q?sXob9GgWswwTwFdshefd/EugAhmRvnD3F353WmLFI9caaf/ZnDqa1zxcyIEW?=
 =?us-ascii?Q?9GeqE1Jvy/2GShNCVL0klCiadcYav5OcpjsdRlK7islKJf5eNW5w7gHXcMM2?=
 =?us-ascii?Q?BBxvtsD6a5tiqpi/ebb9lyxDDD2MUIUq3i2Q7XGIJavmR68CXQV074/AabvZ?=
 =?us-ascii?Q?PvDHy4H8gouoG+87/uh4Qr7W06NBAu110tmIJV/EBXPH8eBUKBaEqBiZ2jzr?=
 =?us-ascii?Q?8jjxAjCu75hmu87I097OfKPI6YSqkWzwPyR8NP4lcDqK1bAhUcaOhyYEO6HT?=
 =?us-ascii?Q?6no/G8ZGpgM/VqoPu3l3uw/d/b6wVFHnT3P7?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ngwY9mPiFCOufuEOu5BmGhUSZXJpaqliDOXB7OIkUeceAqlEVkAnw9TZrPEd?=
 =?us-ascii?Q?nsu9w367lKVaQP5cnSdOMsPu58t/Wyl8CIAZY0btsiLZSQIH64+1JKXO0aJP?=
 =?us-ascii?Q?oPl65VG6oKh9nKpCde+E/4da499hTMbTwn68BOc8R0iStgngw1VpRJqo7ov+?=
 =?us-ascii?Q?Zt2SMQcdpcpbF9VG8WppQCrmo9jUZEn1U+otW74DkHT6CJtMtXNrukmE5xX9?=
 =?us-ascii?Q?9GoSZUdTz3SeEIcRGQ5VRVbVJI8viS8Xz99jpiitQ40OWXZ8R01ymXaa7Hfn?=
 =?us-ascii?Q?pcG9dzma8WFAqIAKL9DJlf3j7juoD9lI/o3DZkWurqA0vMYzVmokmbWc9raK?=
 =?us-ascii?Q?fdtqJOrwrPc9/r/RcG5kHIYQbMnMbYq+AfkKPAa4wmPrh6vg9Eryj89VZvef?=
 =?us-ascii?Q?yexUr0YyuhAHd7pc77rJWajE7L287B7hWg6nLcY3TGaKWJTYO5wgBvgCLf55?=
 =?us-ascii?Q?BpXM6Domci34ekDfFqzGbaoSGYdDiXX6yqSzhMxIIbCdD2HKjKcJEfCNmMkJ?=
 =?us-ascii?Q?Ayz8eEekSGSCBMC8skLJdH5sGpnKx5WbovNzX1Hu2+0m9yrmUSUU9cSJapQq?=
 =?us-ascii?Q?U9/k7Zfxyol9EuFws664zVSA7kANtsAOchbFPMvoEun0CS260jBcjmkCHvc9?=
 =?us-ascii?Q?3zFBJDxkjGlz/SNArYlOfAoGXms3JIS/1izrSEo0qE5GgjD9D6agbOjjXV+T?=
 =?us-ascii?Q?kkRUeS0monHL42ggplwQ/G6JY42MgDOm3+zu/OvopgFVvK3Pi24mWHcwmB95?=
 =?us-ascii?Q?ozBzxMdIkQMyiQ35uzl3g+u0MP/naCW0gL2GseYM5Yyp6+0f0vz4WS1LbFqw?=
 =?us-ascii?Q?TmZ4fWFvp80z7R/6XPwfTmPfaf1xbztlx+ALRo7l8oHeWruKro6LxRmKsFDW?=
 =?us-ascii?Q?Q4t1Vt9EZZGeHKJsTzhli0xEfDkIjBAsbztqJZXIidhZO06ghWuULp+FAWVd?=
 =?us-ascii?Q?V9Ly9JnDKhIYefx30E5ZCpyMhXJ0Q1m9RJb6HjLWg76JEsRKeIdinlIsX8J6?=
 =?us-ascii?Q?5MxcMWiIxeqi9OWyj2xOwYGWdlfbV/ClXVGTQx0ZkhyvoG7FJUUoNUDDkcpR?=
 =?us-ascii?Q?YhEerjnzVnUBKLWS5GJ4vjCAy8PwZ4gV3QcZ2RJXeZ8622kpzsSgdjIH8rLd?=
 =?us-ascii?Q?N2N+HnHdSQM9F/5RBY5saoabPkPcaLi2dCuTY0WOXHS0MKxXEC8JDON41G1Q?=
 =?us-ascii?Q?07FZZqrzJSvnlxHpqjt8bUAzwv7TJB6/ggY7y24rcXdufFr2686VCMIx230d?=
 =?us-ascii?Q?eKVc+6fKbm+88AJ7xPQeu22IseuuNBAm6uQDAnU73sp48VlRAnaxW7kGGgio?=
 =?us-ascii?Q?bJjRX3BFDeE3QkinU7zwpjjr8B43zyK3zx6YdXUxay2t0SgXoHtSVOdQ1Vkg?=
 =?us-ascii?Q?+l6pPwls1U949t2kZMf1ix3Oc+DvVU0lWfcvfx8VLhlNqgYdtwkAyVa+EtnU?=
 =?us-ascii?Q?KUbzX7SQyVVSEQ4lQ0Vq2+v1BExWMXqrEpgj80rw8lDRRHXEk6SOwR5Hviy3?=
 =?us-ascii?Q?1WF/6rk4fqsfGk6C1y9QgImPe9Ppaf/3ArCoFN4TqtiqIrzpw8jMYk0GMhWX?=
 =?us-ascii?Q?S7V5Tf12P9LeP2Z9S8JqfV/3oOuNg9sPI6dNKFlmYXo9ZLWG10Y3k2JwWKZs?=
 =?us-ascii?Q?XFilgeOidOcXjiQ6YCwwMG8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c616462a-01b2-45b6-30fe-08de20ba6824
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:36:51.7585
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bur6HGpp26fbAfDnURBujOaOba+qfFV6S2yPI2L77B5McL9HFhaVkC8qgigDb46xGqH4Y9eNAjLqb5sCuEYTm/5Uqst8ObUStAx4pIsqPvapvp3hENzUSCB7rmbcwOAc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB16378

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
 sound/soc/tegra/tegra_asoc_machine.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/sound/soc/tegra/tegra_asoc_machine.c b/sound/soc/tegra/tegra_asoc_machine.c
index 62f8967727319..d48463ac16fc2 100644
--- a/sound/soc/tegra/tegra_asoc_machine.c
+++ b/sound/soc/tegra/tegra_asoc_machine.c
@@ -78,8 +78,8 @@ static struct snd_soc_jack_gpio tegra_machine_mic_jack_gpio = {
 static int tegra_machine_event(struct snd_soc_dapm_widget *w,
 			       struct snd_kcontrol *k, int event)
 {
-	struct snd_soc_dapm_context *dapm = w->dapm;
-	struct tegra_machine *machine = snd_soc_card_get_drvdata(dapm->card);
+	struct snd_soc_card *card = snd_soc_dapm_to_card(w->dapm);
+	struct tegra_machine *machine = snd_soc_card_get_drvdata(card);
 
 	if (!snd_soc_dapm_widget_name_cmp(w, "Int Spk") ||
 	    !snd_soc_dapm_widget_name_cmp(w, "Speakers"))
@@ -659,7 +659,9 @@ static const struct tegra_asoc_data tegra_wm8753_data = {
 
 static int tegra_wm9712_init(struct snd_soc_pcm_runtime *rtd)
 {
-	return snd_soc_dapm_force_enable_pin(&rtd->card->dapm, "Mic Bias");
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(rtd->card);
+
+	return snd_soc_dapm_force_enable_pin(dapm, "Mic Bias");
 }
 
 SND_SOC_DAILINK_DEFS(wm9712_hifi,
@@ -839,13 +841,14 @@ static const struct tegra_asoc_data tegra_trimslice_data = {
 static int tegra_rt5677_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	int err;
 
 	err = tegra_asoc_machine_init(rtd);
 	if (err)
 		return err;
 
-	snd_soc_dapm_force_enable_pin(&card->dapm, "MICBIAS1");
+	snd_soc_dapm_force_enable_pin(dapm, "MICBIAS1");
 
 	return 0;
 }
-- 
2.43.0

