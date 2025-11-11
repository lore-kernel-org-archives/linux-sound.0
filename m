Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010057.outbound.protection.outlook.com [52.101.229.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34AB883F
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820837; cv=fail; b=I3wSOQgqe6xkuj2kT8GqLVHIgH4Ny1nUn2fn9Pe+dGT6kSDDafRPagr+XBEGB2SQGcldDIVo2prhxijGgsvintJvCQXhKHEL3y22tk80d1LvT9faRLMfsYLBty3+s45IPxA3RNcpb8xHixpaNKqRGI6UN7XRP1biwRV/c9z8FDU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820837; c=relaxed/simple;
	bh=xNJj4yLJqFkMSc5cYDVhNnCc6p/rW4ifq7OK8U3vEI4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=i87s2WYB2S5rhvWuNgPjNzLDnIb6E52MvLhEfktFgCZ0NqbwDNjv2GY1YyHDrXj5wkyet7JpJCCo13X8uBPzASynL6M9wV6SEj+ZFLaUOIL58eFlLwjD/6j/UpwyYujUGuiyArkUhverOFZoXXdLeLY7M7otc/DzmoPWDgkl+w0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=djURSRBz; arc=fail smtp.client-ip=52.101.229.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="djURSRBz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R4gaOMEOmkbr/KPAIm1JTz8EFy5VSXiWBQeWBBClPNcWFNqAOb6bO6ooPvERpZnlQAvooDRox2HWAL5G064OwRiiu/5xWHBIEY9WeMd0CB34goXies9s/xvmkUzdSue92bDCSUoouO/U4qQvBVKXzEM2uV+ReZyzkA0NfTFrUhkZuiWEzlS8OR/1qXCLLD0KSJM7EaCGeuLgZeHBRA1kI8g89umrsXeO/YJ3t9DPmCo98G7QmiWts+/E7TMYlgKSlKJLkrVQcC1Q51hgXlVyIl9hclI5cKAsoA1vARZaNLi+XtUkMLaa8aPjpImnH+jjhj7AsWIAFNTZIt/BpCMXkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=11YmPifV6i0DsIQ118ozRLTD1xnYEtL9INfHqfBxHoo=;
 b=aOhQMMMtXuolDA9Dvb+1q2DtUMhXGSI5M2BTg+qc2/SQjufiRjnzS7xFq6Rx6NmML3mjgyvKTjpA/V9+/L9yd3ZcPyGsITR1ZVGydjmoB0p7YZo5juImYpByhDuTBjicgKnfUgRl9M45LkK8Y5z8gO23bX9hdavDPH6X2jZuDt0bCEIzvMl8FwcPu4vlonc6DhFQbO0HZlNhfQE9byD7a06dVQhJww4IHUbLVV6UANIWfz7D7Dbnx2fzXngfngpzOgrZmUjHjeBckRmQWukpnPqaoTYibg6RJJCuOgnVSG84HGjjGfrImX82A8bYJwT43yvrURuiCfo8EzUI/WvvwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=11YmPifV6i0DsIQ118ozRLTD1xnYEtL9INfHqfBxHoo=;
 b=djURSRBzelic3WHRUsVL2qh0e2QewCptsqs241ChGn1sS+QOWn/0db4CE+IyquSGMqmfYyn4Id2e4wTQE61hKl5LyElvFNahX+tq4muDWlA6mJVoLM70+g3QS8T4hnCVx7zxN17l8/iljC4XGEZbfVGCEzRWxPwqnEFDj9kUSpk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB13460.jpnprd01.prod.outlook.com
 (2603:1096:405:1d7::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:27:13 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:27:13 +0000
Message-ID: <87ms4t1kim.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 142/292] ASoC: codecs: tlv320dac33: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:27:13 +0000
X-ClientProxiedBy: TY4PR01CA0072.jpnprd01.prod.outlook.com
 (2603:1096:405:36c::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB13460:EE_
X-MS-Office365-Filtering-Correlation-Id: e1e2c86d-0176-4bbf-395e-08de20b90f95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?A7sB7gMOCJzgYHR96E3X231SRsuqlRcOTdtzOoGMssNhG6CwHq0pJJq314PI?=
 =?us-ascii?Q?w0cA2oUDpsWw7jtZ/rBGIRnW3y4bwp5hCG8LrV3xYjQ4A35jtbfyW7/v47gl?=
 =?us-ascii?Q?uNzNFucS5xK7QXsnQfdTqcdMf5MVGudcUabNb6WXa+PP9iOhQhMiQ7sFToqM?=
 =?us-ascii?Q?lwTg/hrsSOYizRPClt5bNp9xdKxd5hwOYYaZzYU0lkuJE7ObU7h6C073TWrt?=
 =?us-ascii?Q?TNjdekxR0Ymgf7WGNYSqBfdf6Wue3jFUrLuWGVF9OgiZ5mJwywfumhntRh+a?=
 =?us-ascii?Q?qZ3svUUZE3kFhEvoP3K8dHoReCKY4fneGZQB2imFj9WvA+GUQjbfYtwlrkVm?=
 =?us-ascii?Q?Hvbn4jC2gCAdEqxoS6sf1zYtMLYyHsqd48UuYj86Nv98PYUQRy4fIBEPt5BW?=
 =?us-ascii?Q?ln9eht3uFuNOxWZtkjXqO/tTvZ5YMPpRrgAzJ/n0pwIKG6sVjvYPqcZMGonE?=
 =?us-ascii?Q?7Zq77VnOcwzDdhjnTzuh31kRadfhkmvSrSvk/7Te6vVr8b8KQ58C3GSgsLvG?=
 =?us-ascii?Q?2LjBWyNScMb4h3DjYKpOQ5pIcdU5MU6kgPSHk9c1Ohcj5LQOamtczUf0P8H1?=
 =?us-ascii?Q?QpOWVK3gEHsabwIjZ5UJUrg8fdhZ/0GiU1kjuyl+wcviXdQcPRWohutMOG8W?=
 =?us-ascii?Q?281BISpqnl+hAJGOdOooyeNTq/VkiJqtR+MrDto/1VV/y0dm7/Yyknl8c3X2?=
 =?us-ascii?Q?kojiSAAHovvI3He9mWmK1SOgoH+YdpEjHKTbnWUz7t6TZqreM5THvNsmwkt/?=
 =?us-ascii?Q?lcWVJoVO8Hf8JbEJ9yI/qlJNVDcj3ds+RUVOHfrcFzrEjFx12hQXrJvcMCR/?=
 =?us-ascii?Q?Wwh8wEH3QLXzBJC81bKdPkMde/5/njAGLzFbAWWx5VdJmUQtfVr/lrqLKPu+?=
 =?us-ascii?Q?301cmFl9p/wwoBp+f604pLZ1Y2TujIre2dwD4KMdyerbcPNSSrJQsbPeXHBV?=
 =?us-ascii?Q?oVSPw5/lM39Gnbq1kDvyg8v/AzSnSkq6nB7LIblmXX548I7Tw/AOVQtJ94Gf?=
 =?us-ascii?Q?tFTyib2jlszOmTVqKn5xDWZ+9pSdZU1PElDHckxcTEfd3epLVO8HI9VmXniJ?=
 =?us-ascii?Q?6pm0iUklsuTWCLcy6hOTUIwbx9R1nwWV5xVnxHaDOWY9HKKB1tJ827y4RpEi?=
 =?us-ascii?Q?3R1dKLC7E/CKYIzpTipdLPp6RN05KflL0r0u5k7L+uCN8K1fm2mqNfRCMVcM?=
 =?us-ascii?Q?k73ruNei67VPnZLkXU8qel3eKvL5nvM/d6N8djK5q17nTlDqZS/l/0274Iqk?=
 =?us-ascii?Q?0zwcDY/icdvqTZI42tant0lHzQ/es6m9Kw1prHJZIIEOiVMT4WZcgk3XXZbD?=
 =?us-ascii?Q?s3/1nw4Z0TQz7prg9BTzeJqj3bWbm4mWGdHMsq/Urw5YRuuBQs1iERe9X7Bo?=
 =?us-ascii?Q?iCOAWumrgFabceHpGj8oF7PNZ74ts7ojPgSRqC1bcF3Ugr6LcjqyAWRgWrFz?=
 =?us-ascii?Q?L8P/EzrZW+1e3NI2dVeL731wcdMsb6GOrQSMc7q/41S2cX5o2/bHCwJH8phQ?=
 =?us-ascii?Q?vLfATh4Cz9JXsAkPehoPg2k/nk9c3j+wYQe2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9YCHB6a8fp9XP9lD43efTzwVI+4x6LXXq9iQoWEuvbhP3rZYodPdIU8HR8iS?=
 =?us-ascii?Q?7fFHQqLsAV95XVQno9mtNMkhNuwspmZ3LFDycEC6D7pK8NCY9wl9YHzDFWOZ?=
 =?us-ascii?Q?f2QUPXxY2lZlcrsrYqs60EQm024rqaSHIX+EuTeSPaWdUF5i0I18gO16U8U1?=
 =?us-ascii?Q?/oJPB9czRhjacKEbpUUVrwCHok007NLA5NCaU/VYrFCFzWoQE35SkZmsNBYQ?=
 =?us-ascii?Q?jgb8nFn0kjq4gKdmLOTJqLzqZD4pPdPuWpRAJA9f1euCB3i9kGn8L7GXQvlS?=
 =?us-ascii?Q?cWUk1cmXSbNH9HKwHwL2L2zFso3aNylrSzhVqmLSu32+ojS0/BFF+9p+nd0P?=
 =?us-ascii?Q?XQ7As2WUIH65cHxVPzRtc+zPp0voR4J33pmiWyYKVWiSoOkKGIt3J1P0IZUR?=
 =?us-ascii?Q?UusEiX+y+p7DunT4bDGldLLGfnEczPr/p6WMusQ0SrAPdeA3ZBIXP8lyzFL1?=
 =?us-ascii?Q?wIOezhD/WbMcEYGt8hUxxBdk6GDP4sCvjuJPvl+W7RUIjYjYKi7N5wQF8Pb4?=
 =?us-ascii?Q?h0wqvLmomXzqZVkuyx9kZbuqlcHgjunzCJmkqG0OaMSZaJqg0WnDyjY1j5Kx?=
 =?us-ascii?Q?57rVZxCPwHDvlTcnZV1iukKYi88f+s1lFAS3BjardrP6boLHu3vkbujJKN/P?=
 =?us-ascii?Q?wuxUdATbubr06jVxP9xpRqwebosU8D17+sXHcCyhGpljmUWPPwm+qKOrswFL?=
 =?us-ascii?Q?cbNxZdUCrLBQDsXGvGHQ94+q2gm3SVs4o/El2w9JFY3I24/xc4N24TnWCXYk?=
 =?us-ascii?Q?5WHTbgbWh+uSNaezNg6fCz58k8d3zgwL88ZI5giuk8yvfoqqCioYbU7HHfhT?=
 =?us-ascii?Q?CNNd0vvvzdHFaY2iot+jlUl7LCFMrkE+HeYdbQsZv+gsSf+HQQDBDufcDD1o?=
 =?us-ascii?Q?wa7OnPeFSDrF2MtGZDqeTcCt/eracSSoYIABTDoGIZ7A97vvqB3M5+DcmlfF?=
 =?us-ascii?Q?BWG8FtF7QFhV9+efBpwpt2O1pnFQIGIA57xBGgcPEBclDl5v2C+DKfacbcBj?=
 =?us-ascii?Q?d7RiCpHvGyURGIfUMl53xzzs5HqTP9cE8lEH0hnBgzyaVZut3FQNzCD+qzS6?=
 =?us-ascii?Q?ZGdrSr6CU/ILR91R0ZiM/he89XOAcNh/3gXDOzRcUBsh6/Nqkzz1uZcPt4zl?=
 =?us-ascii?Q?Q4pMAE8mk9cwaw7Mdh8VlrYHhspXYzRrat2sLcz3wJVPsDe6wcaJ7+Zs4vPw?=
 =?us-ascii?Q?CVFJIwItkk2fpjvl2XvuAUjTz6VdgkgF9YhsKOkV3owa8/R84vCUOGYYyrfs?=
 =?us-ascii?Q?vtjV5vtiC7SmZ4wRwhDMAsJK9gE+IwXp4znTpd8p7QcuGw4zQz5cTOFVty/f?=
 =?us-ascii?Q?fzbcSzkqiQkEALDgxOfFXdBuaurK+nYOKzca5pG0KvIJzeVkqsQ2RRG9c8FB?=
 =?us-ascii?Q?T/+I/72hIKsXQgcLSI4tf2KtgvywMS3Xdtm7ZINhZKtWsd/cdBSqMke5qaYg?=
 =?us-ascii?Q?Tn8E9RipQipCv6xhFnpQFsK2L1EtbqaeYf0VoCpAclNkyW8cF8hykPfmLWZq?=
 =?us-ascii?Q?XeUyStFEkMBikLFAnWmT92DRIdXvSEnoo01+gcxTWAg5NeqhpJXkoNZ4XGYZ?=
 =?us-ascii?Q?7Iin4j4t6UBbWVhWAWjcVxz3mKQdCKzH6JhRDaXQZ78ZMczabBxGGEM+xWBa?=
 =?us-ascii?Q?zasy3LrOTMltWOvAFVPqJkM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1e2c86d-0176-4bbf-395e-08de20b90f95
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:27:13.6597
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rHrhdxAKYaLfilxi2Iv1Rz2vBhKj4aYRphL4ZMVTLdEPsia4pYeJRWBYQCATIV/1c1J1wzSyMjFftY4jpiC4DftKQCUoejqtqyJ71xOMXHV36jb+alwZJJNtNYyBZEP5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13460

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
 sound/soc/codecs/tlv320dac33.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/tlv320dac33.c b/sound/soc/codecs/tlv320dac33.c
index 210c11ddd5a81..605da1259fc60 100644
--- a/sound/soc/codecs/tlv320dac33.c
+++ b/sound/soc/codecs/tlv320dac33.c
@@ -623,6 +623,7 @@ static const struct snd_soc_dapm_route audio_map[] = {
 static int dac33_set_bias_level(struct snd_soc_component *component,
 				enum snd_soc_bias_level level)
 {
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	int ret;
 
 	switch (level) {
@@ -631,7 +632,7 @@ static int dac33_set_bias_level(struct snd_soc_component *component,
 	case SND_SOC_BIAS_PREPARE:
 		break;
 	case SND_SOC_BIAS_STANDBY:
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF) {
 			/* Coming from OFF, switch on the component */
 			ret = dac33_hard_power(component, 1);
 			if (ret != 0)
@@ -642,7 +643,7 @@ static int dac33_set_bias_level(struct snd_soc_component *component,
 		break;
 	case SND_SOC_BIAS_OFF:
 		/* Do not power off, when the component is already off */
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF)
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF)
 			return 0;
 		ret = dac33_hard_power(component, 0);
 		if (ret != 0)
-- 
2.43.0

