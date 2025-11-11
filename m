Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011023.outbound.protection.outlook.com [40.107.74.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5124F1D86DC
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820790; cv=fail; b=TH3llHb3CWpHkxMkIpBbv/KySqOE07cJs0FFT8YX/llMWh1zDAVkdW5Ep/6NtI+0XspJola/SkcY5Qm/i4zLd8R9dkTrz7p5E7QMclMhcd80ErGYASTWyJcJj5tgOzXhy/6bAqmY5f1U/g37TmluqbMJRbhrPXNkbTks/jakFZ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820790; c=relaxed/simple;
	bh=JDV6YnNRbwfXUhCx6sMCmxvPlbCPVFh75r6ckvkxIC8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Pe8oFzSctNfGioI0PjVO9d0M6PtUqNMogvzMwSXSzR8Rl3JEQitDCngu96EGvXT+JeMOhFqxGKD9gIXJkX/GHNN5QhnEq3AKMuYNViKaJ5Jy9SEjfARvUafuNfqMfRbUsqxGB1BkJ7tdxaSQFMML9rzI4PNALamPKox3akmMv/A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Tb14pCuP; arc=fail smtp.client-ip=40.107.74.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Tb14pCuP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cOJakxDVyaW8uwuxt45g47paksv7XLW93/h8t9aJBGWSlv3uO5WtEgxYHEjRu6f+p/iLCxYWG1vqyOSzM/+fiTOgS5AIl4jvL/kkpBomEtmJTv3kqcLPoOQ+6LSImhEZc39S9BN8RYmUjWx+KN8c0lxYXn4K/1yy89WQZRD4q2B4DcZRp2ayOxOOrBqCn1N2bnjltI+lg4w+ykV06zNUcAJtuUeyPYNPHbaAz/UqD7O2ZpxkbOdTDcDZW0dMCNVTsA8u7HNFfr0JKFxH+iYb1iGZfntXTWRL6ZG7i3q2ophEzK28dmcDpVeQ+d4z7MTnn3M4c38EuDliC9zWnZVHtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UY7b44WtIsTd2039cnsOkIzn/fgQ1b8EW0yyZCgHC4M=;
 b=Y4O7t6x+ieXyHyJu41bbdqOb8xXN/6YdO5IplFYT6FG0VYcyv7CuURf/XPJMQAWy6+m957MNtyOqqR8Xw65ym9AfqkNKlery/Mr4Id7iba8bpWQxPK3+gFMi+3adwl1oL61ZuwttXFysoBa3K9oleRujVeL0F2MksGWCfkcNmVsGMIbH06IdsErkuFsuotHeDW+bdCKwsgiDa3bnRNzJve2t/L3fspoAoqhCfqYsWiF8HEyLjJsAIj0IcyQBDDWd7b1pn/nxCnQ/mfiq1a+nBMcE+AbU85SRzFLUZ7toQCyn+B3cyjBXUKyg/LjgcTTfyyMJrscw3itOwtcQO21n0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UY7b44WtIsTd2039cnsOkIzn/fgQ1b8EW0yyZCgHC4M=;
 b=Tb14pCuP52369t/oKT+2U549ci0CSM0Lcf+xyP0tce2eyqu+4R/cb3t53FroNJqyvfLNFy6Vx8P354Ja60tdxaYTdqryCawcoyN5ba+sVbQ9UugEhzFJ34Zflot5WjuzCbpXiRqBuGkxKjkPq/0RJGYru8JODaZJikU+WQ1WZSA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB13460.jpnprd01.prod.outlook.com
 (2603:1096:405:1d7::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:26:27 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:26:27 +0000
Message-ID: <87346l2z4c.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 131/292] ASoC: codecs: ssm2602: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:26:27 +0000
X-ClientProxiedBy: TYCP286CA0324.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB13460:EE_
X-MS-Office365-Filtering-Correlation-Id: ecec6c5b-d53c-41ec-ecb7-08de20b8f404
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?X53BItiuxYse4ElilNm37SEFFNWPQ/YVVac/4Nbavsm+4bJWvZqxoYMFHHHY?=
 =?us-ascii?Q?fWXqxfJVBl6DlADZXy2LYiBu3Bo1sWeucBWQYQV835kJxZ0TZzfE+zZ2enf/?=
 =?us-ascii?Q?n/m8WrETYkalAIv3oxJMiq7O6MlSZ6YgOLMwEq5k8idHENMMAc4Aww8fgZtZ?=
 =?us-ascii?Q?lyBi4vfRhLMu75bxRoSok0Zr0dr92VcV1GvsY11gW3P9yov5rrnLNRQDSyhF?=
 =?us-ascii?Q?o2yWTQxAOEFmr0YaaTqrnF9lJ7ChPr/cLyvLWY3AJCxzH6f+QfEDU066hixA?=
 =?us-ascii?Q?FJdKYccCswT8WtePjHuHpo/KlgZzNvw4DV3sajcCJKOWzPI8K/nHCT5cECuo?=
 =?us-ascii?Q?hNfBZSNtolxA7qjYcQzct42sWJ9r3HKkYfY1FwU7j/nxoED7xM1SBzmLu+Nr?=
 =?us-ascii?Q?AP1lbqQLBvcW+HAvAdn1xAwEe1D6JxpQc5k770vvKkbCGPcgsMm+PAn8vCg3?=
 =?us-ascii?Q?z9JCcvfaRYZfgHLOdGpzK6zRA35KFAEZY6ySuyCgPsphV51SPOgZOoJwa25G?=
 =?us-ascii?Q?bLN/1Gh4CzYeJ3zrG2+AY2jYGx5Yu3xOsZL/YTbf6DomOeREofyN70GjZLmP?=
 =?us-ascii?Q?1q3InCXWEuTs29qi3W4Gu97w/3e0i2sPw+2EwAqmQEdT8zesoHu7oKoIiuZf?=
 =?us-ascii?Q?VbZXfgIjyKDxUR1HPH2IMnsgLG3OiUBzFOY80KW/xsbq2IoAOqHolt/y0xIW?=
 =?us-ascii?Q?HOwjavmVuqrPeqJYOUE9cdrtP+eDwIOMQ3QxCIQR/gJx0FoVJZWzMNtISiJ2?=
 =?us-ascii?Q?JNr5YZq0weLV4toz87vXk9SXfNMfVQwnU/HFvmz7w0d64UB7CK6Ug+XbobwM?=
 =?us-ascii?Q?QpPzgbY+XF56Aw+P5nQ4SkC+DTV43vvprKFQmfzd8KlW0zeHt3MgVwdpRWyn?=
 =?us-ascii?Q?tE61BksQr/D7c3Qzo6XPq+0aHxyECfePvIEsgbcetGh/LWTFmDTiVEBeIsrC?=
 =?us-ascii?Q?hCmDH5HuJT5XEMx5mqXy8y2vZKZRA9viOxVECTSFmq26Fds2orcXhCTG6dOU?=
 =?us-ascii?Q?q9wEmjxALj5E8MsnKPpSdTJi45bCr+7+CWERJL0sHUUf/UIfo51eqZq6kGDy?=
 =?us-ascii?Q?ZtM7gARKRICbgGdndeI94sUGsk3DHPv4t6VbJoYSxoDXAFkfI4T/2yLqIKrL?=
 =?us-ascii?Q?eN7FgDhLwI2Am7prrNKNW6AOIUs3kpBAgDPKhf3YFVt8yS4ZKjbAvl8kTWuJ?=
 =?us-ascii?Q?f92em3vsvvhbhz7zfAhZ/uHTRKPi70wJePmiP6mmenJRiXMTvKNCqsBtsn2F?=
 =?us-ascii?Q?9H0AGbKxnbCPmMuJazdrhMFE2JkLsJc7oROR6aqY9FXr4UyKlTT0Zjp/N9Zd?=
 =?us-ascii?Q?EEcmBffTmb+yhWrEW3DQUPcV40LD3y9SVmxB0Wn01NBZTNeXXVqWJTjBg5EV?=
 =?us-ascii?Q?bXcc/tcBfOky9faI4qlvk/3BEwdHSHUy44SDk6otmvUZ1ZhZNw5bvJtDfIAS?=
 =?us-ascii?Q?fI9pzNcdcz3jRzD3Ce3/HYuLN4wUAsvJlJvPM602DlijvSA86z67znMJNbJJ?=
 =?us-ascii?Q?AaMqf3BvJAbhsQD4xJYoS3O7mJ5Kv/feIbnM?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZlMPft1WcCcCRxgpWY0MEG5VLq8EuaNG5Al+zFpXXa/c166MpK+t3qvqD1gp?=
 =?us-ascii?Q?xmHjG47uroNk7WMBDHUJzzNpQ6QDRHeW0XyoNDIjXyo68KxKNWqKKC1gE/Cb?=
 =?us-ascii?Q?sv3sw2oKsbWjJHxtH/nwJDKVlDUSe8fBbtJeLG5Dp3L5dYco2uYz5I4mmgRq?=
 =?us-ascii?Q?6+W/c+8020DfahTjJn3TdzwSvSgF2v+/COyI77r6KsbQJDH6+uGfpneR0Y07?=
 =?us-ascii?Q?fESSOCFoCMxpyxWC6OvXIL8DZACGmD44uONFXapSpBKVMkbM+xTcxWsQTBw9?=
 =?us-ascii?Q?ko/E2V84IJWGP+Rz51lSuhOkwF7qN05K2vhcnpWGHLzPetQvomMuQuebJ7jh?=
 =?us-ascii?Q?ZDB7Lt9JPIgNQniNpj1f/VjpRpK2pEDrtCO2Dj7UfADDSIYfd860sWc3d/JO?=
 =?us-ascii?Q?ZpaiV2K8DjDbFfwJAwHOhmukzr4rVh/LEBxVbVxDbfc2fpz26OrFE2xFvIQG?=
 =?us-ascii?Q?qDEKbb0wHrDhMqPXQoSAxdHMeanpERBrRKmc7ZEyVkt2HuJCFk37DWsclfgI?=
 =?us-ascii?Q?uu2jo2N19eH0PbTyausa1y2d/9D2oMB/eqLary7s2neMu2Ukrj1W1Ekvg1/d?=
 =?us-ascii?Q?NgphmL/JUDuQbbbBDOyANKyPQtBGFEPTHI9jRg1EwCw/i7EHClOUgtDM4iKf?=
 =?us-ascii?Q?vIfyryonm+UNEP/YmDwlOQQziROCHY2TyR2XYcs6rXdbpmT7Li2KAx660Ac2?=
 =?us-ascii?Q?gxxDAqgvZCCC53qkzUJkZHnWiXdB9m0Wjy3f0DzhJKymHnHztDi9Ik+I+JqA?=
 =?us-ascii?Q?6f98sgAfL2TDlh7pTrfKJI0BkH3ELfqg492gHPJq8hq7EzvvewfmM4waiAsd?=
 =?us-ascii?Q?U2VQK3E+ORFXVdWH0EX63rH4zpM47rRhXEiAv638kBZrTTLtYtZKgxpq4btm?=
 =?us-ascii?Q?0EeeM18syJB7+wIhTYhGfC00sno6wjwNojIC3+lmZu2AoQxntE4tV2S0ATaz?=
 =?us-ascii?Q?nVs8dbB5EQ2YhuHrTZz1VosJLKfSa6Qrv3QxLDTuaXKKCwEMbqaoYmPz+3I4?=
 =?us-ascii?Q?wP7d3dnAfKRLJHhnuElO7WSR9gSdlP7pjHQyrAaYSVFjOsb2/aho6ErgdfR0?=
 =?us-ascii?Q?E+CkTaOTjWu6FDe/C8JPR/HD0aGHdvHu9bDE3mjpiAIGQWlDkwr0tXQB4bzz?=
 =?us-ascii?Q?E2f+67FE+yu2i/p6tZRnSFQVfxQqC1GUziPDs/LTynTOSKI479sYLSFzdVM4?=
 =?us-ascii?Q?FBUEB9nVmV9PypTgVaY772W0KYrrOc0NTa3WN0D/7LxBRMlel9BqswYFrM0j?=
 =?us-ascii?Q?aFUDsgLRDf+P1z+zv8nslIV80YJ7meNzspwn1kjqAT8bxDZy3/eX37B0ppGV?=
 =?us-ascii?Q?5bqkubgZHWlJbc1FFvXUv76mnNOhVYQTNKjWjpzsvmPpliGdW8Z/dr9L4YBl?=
 =?us-ascii?Q?bP8xKiYobGbUDR6ua1Sz5Tg0JiX2/LNNVyoNVSXlK03thhqvWEil+UdwCnlW?=
 =?us-ascii?Q?aOXvkJb+mt/cBWZsn/dEz4stjMQ4y/YBOY0rVTLBWWB7kiPEOe9nzWCTOSjv?=
 =?us-ascii?Q?b3djpipczc2npN7ai2x2g6jh/SJygNEEUK+oUk0XxIu4IFMX3z4uynKzdoCI?=
 =?us-ascii?Q?VPCzf6fBiZ7lbkavyBbX1hWrmrPGdJ0yX5o66iNynKGoRcpg23WAoXEK2iy3?=
 =?us-ascii?Q?l+NpqX7IcAtWEdUPBGfWxaE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecec6c5b-d53c-41ec-ecb7-08de20b8f404
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:26:27.4251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UXgi+jDE5IXKepdr/zgeNempOCbx0wzEAubMuxl+ThbHiNt72Kvqen7rcbbzz1vgeyO5wuODuHCnjr75gI3alm1Gv+sXXWAQRYNRFKLa2oV9B6E7J/cVo9eXAlcNGBV4
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
 sound/soc/codecs/ssm2602.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/ssm2602.c b/sound/soc/codecs/ssm2602.c
index c29324403e9d5..fccd2eacd7a6a 100644
--- a/sound/soc/codecs/ssm2602.c
+++ b/sound/soc/codecs/ssm2602.c
@@ -562,7 +562,7 @@ static int ssm2602_resume(struct snd_soc_component *component)
 
 static int ssm2602_component_probe(struct snd_soc_component *component)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct ssm2602_priv *ssm2602 = snd_soc_component_get_drvdata(component);
 	int ret;
 
@@ -587,7 +587,7 @@ static int ssm2602_component_probe(struct snd_soc_component *component)
 
 static int ssm2604_component_probe(struct snd_soc_component *component)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	int ret;
 
 	ret = snd_soc_dapm_new_controls(dapm, ssm2604_dapm_widgets,
-- 
2.43.0

