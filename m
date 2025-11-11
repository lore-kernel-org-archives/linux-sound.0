Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010014.outbound.protection.outlook.com [52.101.228.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFFC923B615
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821398; cv=fail; b=rok4oWdQDG+haK1/Pt4GlK5K0fMFOoThEEhy0rpGHAzQhWVG0QdVPF6B1JUm2khym2Uhg0y0jEKVBeuJVNPpDW1gVSQgBYh5eCxmnVcUZuYJXQ8btpXTB3Mt+MOShLg2KoM49gAgRZOIfMqY2GtKLpuIZdbcL7L0vAU5N6PauLQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821398; c=relaxed/simple;
	bh=KgBRG8eHXI/3q4+pXlxRqWma763n/k2d3sBGmfPHE7Q=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=uMgQ4BlKUOjUf+MpKTNEGBm99pLB7tpq9PIo/9IbrRuQJbfyWMFgkjB89JCa8nolFOCGhiTMLQkWo5pjpliNUkW/CkRUqnIGEjxGht65k8o3RnByjwEtw2ExIUeguyYRdPNFId3mGpqePpC7te41eEXM0E9Ylri02kiqNcb8huo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=XhwYt47L; arc=fail smtp.client-ip=52.101.228.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="XhwYt47L"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J5LWmeYvd00XNLeoTjZek6pUkpY4YpBKxhopIC3O1CnmdeAj3U61mV80oIFvQhyGJnUrMF9lFOSXam8+wyQ3TWYM29yr9z1JeGBJaDwkhreMRKknALaajYCxW+6Aw94ECVK49WvvwOKSpRpHLBE5ldKnKc3Ev4RVE6jbnn4mkj/+syNVGGD/a1T4XdpqIk8mcMiN5Ffx8ibC4MxEh2Atxemkzjsw46Ow6FJyd3un2awdG2Km3WyrktksY438XPklzEaWuRZPql4nzUXbu88cmiBZn4uBs9mhvFw0Oj8gj0rH5f5g0i0T3dboIlCuVBrx82EiOcB0MmSpPLUuwpcgxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4MIX+4Lve3xaHqIx2hp5eWEidCEfZwn6eB0l0F30mQs=;
 b=cbHMZ/cMjEFJbhX2BmR7TYhoeBtDI7P4qATuU4kvMyiv/tsQiNhGjfz7wkeO7jIHZnds1yqyEnGqUeMFEYG7SSE/pDsh5QBLDBYY/ZXFACER3/g6YyomL/IOfWn58mfJ7bxAhRzRYPrtUpYpHilTJaWSi4ilZAOF4vGMhn+oRk/oir60Kk/JrpQyNWJTTr4I27GjUdg9ETtWKRhjNm6nHnUAp9dT8hHSwveOEvLN+dFdh85LwehlKfOf8ohSpOpQyrWUNSKTaVwb579aPALvZHVPMPEkNR4qgCWnWlV/ZkkuA9EYbtTZqRFi/jrFrfNt6CQSorPmSDYtGfw2vLrSOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4MIX+4Lve3xaHqIx2hp5eWEidCEfZwn6eB0l0F30mQs=;
 b=XhwYt47LllphF4yckdvXubd0tLcpH1ECpgxjMHMjrdA0S4PyQUgnmgckIO+BDoRVvJoX/w88Mig3YQqWKobVAtUdSId3qCZyCHqMeW5KJTus9hPm4+TVrWHN9fN5H8pB7qyBbT7+YBqChCnLZIXkeuLjGE/ERFrE4Ll0fCj+ppg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB16378.jpnprd01.prod.outlook.com
 (2603:1096:604:342::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.10; Tue, 11 Nov
 2025 00:36:35 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:36:35 +0000
Message-ID: <877bvxtnfx.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 278/292] ASoC: sunxi: sun50i-codec-analog: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:36:35 +0000
X-ClientProxiedBy: TYCP286CA0301.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB16378:EE_
X-MS-Office365-Filtering-Correlation-Id: c055b12c-7b90-485a-c1d5-08de20ba5e57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SWPAeGfepwenmbK7x4rmaQDBq94MgnxXu8IBFfCPvqQYSGINSb+SjgUR3nwZ?=
 =?us-ascii?Q?RnyHhgD87ATQXa2Dbt/EnA5JE5IF8NOKoB2efqnzaXMRr8Pd+leus69TXekO?=
 =?us-ascii?Q?qc4+cFHTfDl9dwg5s+EibceYsuZsOuxuayPa1l+RCO83H7TQu9H6c1QWsWEX?=
 =?us-ascii?Q?UhdgT/uDbI7yh6ic58H9RannpzmFCEglE36vJA8DYkxOb/zFb5nRBygYuz3U?=
 =?us-ascii?Q?7VBNf1J9iBnGNmw5wYidDuGF+H/BDSqrqAoLoZZQ32KwUZEA4tTPCy5pkOD2?=
 =?us-ascii?Q?cwB9o5dYmnYqzAppuQtlh9tad4+gzzSHuqKEKJgag3DN3a41/Z6atgEBWhYG?=
 =?us-ascii?Q?ymyz4xf6iP1EDP+8um8Mc2gxvs2tEvNzClF2YIh6nPIptlsbC0gSAvRrS69i?=
 =?us-ascii?Q?pKU+F1r0He4D70XGUTEvW6yNzJ2SSG0eMMTrwgJoKw7zmOF3AcCIHuew2/kE?=
 =?us-ascii?Q?OvngvwflTGPF13f9CgeHyD5IkPZzshj8D70/FCyMMbwZl/N6eZnNK8tnBTIb?=
 =?us-ascii?Q?gVJRpGTrv+RbbCOsu4ppDflzBT0dv82EIJWK/ukfhwf1yyABlPWQPe8/CiRi?=
 =?us-ascii?Q?ObGd0xRTnDV4T3KAB/zPtrUaWYLH3svI/e1RD5Ovf/HOSPUp+3YEEAiEjVpW?=
 =?us-ascii?Q?gde2JF4AedMo6oAZ7Amfftm7OQ1iE8w3puhgzGdN4SH7PuvCcYyPGMJDuFFr?=
 =?us-ascii?Q?YdUGsTBqi3+nAiw1zFr0O+RSyzQVH3HhAxk8JRId0uvGe8nMNMCMpqTg8XCn?=
 =?us-ascii?Q?aCsCJghj/aflMDU1Q6yP7EEhVrLxWJgRH9J7s9qaTiOe7bBAb0ecFgZwIBcf?=
 =?us-ascii?Q?tfCxh41m8awKhTqsn8heDgluTQgWCIXo1vRmgE/SplSdqylOvakd0t7jh/4N?=
 =?us-ascii?Q?BuQkxeW8BpgUS12zWVHgjX5TQFWwjQ1rNeLKbzv+bQLDT9OpaRWzMTrPSyVc?=
 =?us-ascii?Q?CEWWvm7s/0Ahn3Fx4wWavUc8mUlOPHLREKPNyNrpuNnKuwUichw93Myl4ss8?=
 =?us-ascii?Q?e7Ba4m9tyE2YZeoR7TILmwgtKrhGYoQuKKmCz3cTJnN8GCGkUrQsN1N/nrTe?=
 =?us-ascii?Q?fnb8Jn8XQvgKT4XSgtFte+8wCmg5uZwDYC5JHgBVwEddmHbTVHdVK/byKODS?=
 =?us-ascii?Q?IA5UbbQFnkiSCkK+/u2L6CIx88uO0g6Uh2m0dulI+QeSnGqV7nZuyFsZT9HH?=
 =?us-ascii?Q?rFVgEDy6ICA3HYZb+naTgPjHMmf+kantHNNmaUN/XjLU/3mbrPO0+H3035s/?=
 =?us-ascii?Q?murYaNiHBZcMZPZk+Op0hhHx3Xhv4dvCb9n36DlhUi8+QtVxJUIsrzY3cfqb?=
 =?us-ascii?Q?ac6m/5V2JjmWbl38zeALp6wDSJ1t2fIABPYs/ApP6qsvfUeaL5J27KSIsRuX?=
 =?us-ascii?Q?mr3Eej1quqD/PSoFxmvow6pPAKy50xlcZuM/cBD56OtrCNxawygZek1LhF6X?=
 =?us-ascii?Q?dgUzGLsO0gMuDMyfk7QzBYMW4MdjH2bcmRb8aaAciSsFGEhd20CFA2HJAk/U?=
 =?us-ascii?Q?UsjJoru2c/4r1qFdgpG/9HUo+xfGtDqjDDBy?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9geRkeOfCNuLYrWKyCrzCng5nrLQQPvzf/aER3t4li+G0jLWfLeFCKWHwJVE?=
 =?us-ascii?Q?IHDVUY7vrFnsWGuyMidlUybxBxHUQL6wGA8nPLicymVWVlws3sCnTVe57lsj?=
 =?us-ascii?Q?ei1fmQosIRxw83ISgry+BhVH7DIHtGcZECYRVEialfdMP0KCF++BnUBmtMPK?=
 =?us-ascii?Q?Abjc/VX2IVYshyMwLdq614UXIMfPYmxeevymMK8fXUd8udr3RITcr9qwDQDU?=
 =?us-ascii?Q?3qMsNrUGkc8tuA80XD3Rxvyb4A9ROH6FkSIaJYtUBrkDi+2NBnamxA2vfPvz?=
 =?us-ascii?Q?c3RVFfyS+TRuDsu2lQHK0oCOTRhU1FqBJqBwA1plBrJVd6Xki+VD5UmuJtjy?=
 =?us-ascii?Q?IRhsW5zwnWwk4LeuORFs0uSwFhLpwlzTiMalOpCWzWKkYE3tOy16jJEybtE7?=
 =?us-ascii?Q?MuwKKPpyJ/HbHXksGW4AXZ7A/4XRRrdoz520nH/om/Z2CFh1slap2B7OcAYv?=
 =?us-ascii?Q?y3y42ZiZu0EOaTa+XUJxbctFc3k9nrI0jTHCjc+Wq6Uayu1QhFvt5h2BgFUX?=
 =?us-ascii?Q?3UNtch05qqh2Fcawcq7NTnyXprnuLstmBuJqZg9Z/y4ayBOGUaeVVQJzHdZd?=
 =?us-ascii?Q?MgBNi3J+gP/lfZjyBv7QNlKkgKs6/sbvuwYZxwAIV82WHLADLMhJRRK0eerI?=
 =?us-ascii?Q?QZn0RJoxCNl+YmkKeDfXNQbqqkafTH/SbFhMsjJtP/nzlY1llix2jITpytPF?=
 =?us-ascii?Q?cuL0zVKTs0I3c36r/VzfxzJNFI9c35srzW9vV55RwAa5Jbq06w8Q27JwqdfO?=
 =?us-ascii?Q?/thBG+YoxXZ8a7ViA7e9W2nvpYPTP5w0nDdfwBEM+NTSi72VhqGmcNOKPm+v?=
 =?us-ascii?Q?Ly13aD9ei3qQ0FxC/duh1p7kI6gkQ7RteOQU6wuMbz7aOgOIPUsDxp6F75jl?=
 =?us-ascii?Q?9LpKogN2OXP82n6TulWTkD5u3BX7n3Umyh8P1RkWJwGA55hL8po2vn0vTKs3?=
 =?us-ascii?Q?7Uhi4wFK4NJOiLNtOMXsDlr/8+2r62hDfUwm0epRKLsmRk5P9PvHyIA6B/nl?=
 =?us-ascii?Q?ytwHzySdzxJMlwt/XSMDRcpQbcdFSQw6kbRQA3+sCeK86f5GCvKR1MiGfmH5?=
 =?us-ascii?Q?loI1XYtiQbZ5u95trE320mPaEy0h80voEZx/zNhn2oZYPbHPHfb04x13KiPY?=
 =?us-ascii?Q?932V3nm/L+jmXTq0dotwVhImGkFrdMD8D9r35xsXG5VX85gD54nkiuR7v2cZ?=
 =?us-ascii?Q?i16yjZgw7bhCiI+Fg0wVzJI4csc94yxSKAVX+SVksVeDSIpAz+hB8gBdynVI?=
 =?us-ascii?Q?nrQHqOAWXoEYOJ2kXCA1bUEFFXXe++8DzapwPvIkNEAAxzdXh8EfEbArp5JA?=
 =?us-ascii?Q?zGbHusFp9opCl+D/T4R5eamQ5fdW+IQNZ/Qec+qUMDbU13fKiWRng+gSN0aw?=
 =?us-ascii?Q?0r52a3C+1puy6P4bd4dHLgOEtRgzIgVMCqx/q5xWHHLHL0pEuD2CFPTUnGgQ?=
 =?us-ascii?Q?hQLkDS7pNU6Q/F5SmtdxNx8auGLoSB1aAvEirXKmlzby5irQZQTdYmFE5HVW?=
 =?us-ascii?Q?q7M63mTsV76T8ynyyffAgxXa/SK6Ghv1o4cIgW1oAIirjd0KPaR6SPJli6Az?=
 =?us-ascii?Q?sRnw1rmOJ7QkmhsV7UvJe0EBqy4ktI2XVMf9//FqUr8dKGXnQQi4ma7ZysT/?=
 =?us-ascii?Q?shh5Bq3JJtn5GbsFFLymj84=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c055b12c-7b90-485a-c1d5-08de20ba5e57
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:36:35.3448
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Btf3f4sHu3a99MsliOeFxCZRrUMib6LrLUECPsdf3bFEUNmHWBMNY31+2uHnuUYSmGETfoH/2slbUKQFurqFuCjV50YNgnMacpEK/uaifqpOsgm7psrDTi1LJbPAQUu0
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
 sound/soc/sunxi/sun50i-codec-analog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sunxi/sun50i-codec-analog.c b/sound/soc/sunxi/sun50i-codec-analog.c
index 2dcdf113b66e5..a19f8aaaf1c40 100644
--- a/sound/soc/sunxi/sun50i-codec-analog.c
+++ b/sound/soc/sunxi/sun50i-codec-analog.c
@@ -495,7 +495,7 @@ static const struct snd_soc_dapm_route sun50i_a64_codec_routes[] = {
 static int sun50i_a64_codec_set_bias_level(struct snd_soc_component *component,
 					   enum snd_soc_bias_level level)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	int hbias;
 
 	switch (level) {
-- 
2.43.0

