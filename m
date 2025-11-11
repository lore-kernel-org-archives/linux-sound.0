Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011012.outbound.protection.outlook.com [52.101.125.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66FAA1DD889
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820904; cv=fail; b=u8Z3HTsc/OnE7V0ffMt3izy91PUq7xd66X7sr74AqKK4BTxnVKgJUf0LrwUgQKhUpfj45hIWhBxMrvWz85OTGQTxPVeA4IzYavHBC4dTK+KYCJpmXYCuEiSOMpZWj21ejd5rSuSz2WMQqPvD4qCHLlbk+RjympJHVefUKM4YkOM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820904; c=relaxed/simple;
	bh=Qb2sw0YInBSpHUhHx4t4vlzxnJGjsqy/v4/AotfL0FM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=lnLu3AaePU2/oDW/nKyNa0AUa2zE9h/lqDf8RCSM0ORmkRVYPxY2IkRLeLY5WPE1m9GbIZjviBvuvnhhyB6D3NsLYmwJg6Ry+D6aRqRd1xt2G3FWkOcdQNABtxax+MtKJs2xr+2YSgbptNeDfk+1Bx2u/OyGnWxasgtkSJaxEnM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=JxozVj/l; arc=fail smtp.client-ip=52.101.125.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="JxozVj/l"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FKGHQMixK61rGOz3znJfR2EzCJZQAx/xREa6/if6EoE0yRR+rflDDYsBm/SjagVkDXibDilcO9S/HHSBuKyPKABnBD8T6NFJsS5Cu+NyILV0B8TFIP6HLKzNOYZ7ZfZ5zBfjmSs/goF1EZNiqfiKhPytrSYIVS+pAyd2hhZdaNC7ErNd+GiGDfsgga94M8NjSMW4B2uFikQrawlKNQGY3jyNPPG/YKSiNavanYGxa8G2x+5rSOmHLNok5u1WWerO9mMB8ukilU4vOiMMnlttDdcsxqOxFfrxTYnndE5DKQX8Y0Ztkr0VKZYfGIhn9QG+QQVK4iCKaW0kqXjWHrZe7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1nFTBpMlx1FydjefW7Hzpat40NWjkn/ksp5oYmdB5Mw=;
 b=p9sTmmSGIL+Z5LPBzJHAGqFU3BrcTH/UXHXbu7qu7r4pfOtm0zFu9tQhhToK6dwM88N/zal4kgWWvsE2UwALUnGjQuV0vGcUEYhr2aS00fhtv9icoh4nYQnyuCr4w51ksDHpcR93dYVFpSSXnA+Aw074pGhAAfgUELHKVYIPtmHAdEqyMXBDg0SVFNufhQHb0+GUWdp+UDofQXSxrSuNZ95KPG/R1leU09VoV0tmIA2E1TNKFBOUTgC7g9/yhM5tEasag+NcVnP8ebi43dly2sjMRbUAZWPM+e8rW2HN+Pay5o8w5S8M++ZqIveYfIc+FkDrIWEw3uZpV8mhpcMJhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1nFTBpMlx1FydjefW7Hzpat40NWjkn/ksp5oYmdB5Mw=;
 b=JxozVj/lLEScORXNIvdxxdGu8r44GQ2YrLj+Nh3FvYsfVoWUXWOw/XuUEjb8jLfoO46E/cRUTVc1ebOlcuHqGvj9nhdDblGwSSAsR44wngcAU7xYJ1NIblAKt4YKRd31DNKfwHf01tU2+H3gQS49HIF/adGKOdP8K/nDTVDmvHI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB12798.jpnprd01.prod.outlook.com
 (2603:1096:405:1e9::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:28:20 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:28:20 +0000
Message-ID: <87346l1kgr.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 156/292] ASoC: codecs: wm8523: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:28:20 +0000
X-ClientProxiedBy: TYCP286CA0332.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB12798:EE_
X-MS-Office365-Filtering-Correlation-Id: 55dff8e0-56af-4318-2c03-08de20b9377a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?m/oW+nqhsoMBWJJ5714JvqJyexkkH8PUu5DiJ1If2Npin9+qXsf7v1l/RTAd?=
 =?us-ascii?Q?72W6wfpUVE+PtVwrvgloBENw+TY7NCB5Mr5ICyeFwHbrQQreQXEiV0w7FOad?=
 =?us-ascii?Q?+1EuR8H387ZtnFb1O119K3sN0r7diA4ssabVfeoC0pCLQJ3o4y2WAECsHk06?=
 =?us-ascii?Q?NU8leJYfq9nUwO/bwdU44Z44pAHAuw1WdLtnfz6bLwjvaTIE3w2kvq+1TfDu?=
 =?us-ascii?Q?x8hVnC6rO8D+8HCx/bohg+sN3OdYufjXrbKqFmEUOC0d5FkMmFUcufraZpmx?=
 =?us-ascii?Q?1b6YivQAl8mqKrk6H17BYu/Ms4IxZAbeR3/3EcPtVmqkoxmGFyCLHEx8nsjk?=
 =?us-ascii?Q?gnOTG24FzSk/j24nfUcbvinnDW2gwSjWgywd7jnhBm06U8+yRyCRk3oMyg6C?=
 =?us-ascii?Q?OZn16vMu3lOtl6mU418ac+VOx887XJRgHRKaoy05t3Hm9S7c7u48Fs6dGlkS?=
 =?us-ascii?Q?Q6bFbqEBCpD7sy2UoKY4C88iCckPWhAMflXLwaU5Pr41uZ6876iTrF223X5D?=
 =?us-ascii?Q?W/qFbFc6RfW+5EKpIg59+0g5+51THBghDmJtdlgOkCgoTMMc7VAzbNoppe3E?=
 =?us-ascii?Q?tPzypxPoqfq5yO09AqWAOeotmglu83nobykBhwxM86KPKVjVsItBQ1gOqtFf?=
 =?us-ascii?Q?9BQEZ5Dk3pbxXEgpVLASvhutnmxUsj5on6gB2G3wUgbv4Yp4wCcE4BHEomrU?=
 =?us-ascii?Q?1wjTKLgpwm+TXUqEBjjCb7fBf5cISvlkekkNh2/QJ4GvgFEORAxlpv9pOP6/?=
 =?us-ascii?Q?w4yr2HzTE+b4pSEOVYoszcU2/Hdl5rChKfDFIL7lXBRtSh2Jov8bEvmtR9Ts?=
 =?us-ascii?Q?iV2wF/0729V9eTgcBmQCDSPnqZ17gghgTWfbe9VyAto5Y0pDPiKZdWPT/wN6?=
 =?us-ascii?Q?ODYJVvYX7JVC2/MZtOuC9rIriCyBWmHR8YbhoqPXiyO3u4r8aSH0O/C/cxo3?=
 =?us-ascii?Q?fSa0OMeIM/WJ6q3hTVpCTnG/evxV8PmRyKKldD8aEEiEUyA9huIoLAEixk9w?=
 =?us-ascii?Q?aNBMYQ9yxijkmQFsVSdCo3pHg0pmian2Ms4msMgN89XIWteHXHCKlucJvrUF?=
 =?us-ascii?Q?3Kk0MetvLOr08TuaBoRCJQUebNIu9o8G8yk764LRmVFCPbOOLCdDzlJ5GnL+?=
 =?us-ascii?Q?ueuFzku7POiW70Urt3QhlKd4wtZ0xTBmacCue4hvXpt3VYSeqZvkcR7wyoRe?=
 =?us-ascii?Q?zqLWRffrEKWYkmAyxC6+Le1famdOJveEQUFAWulV8tSQSxHlU6iVo2di6iLM?=
 =?us-ascii?Q?21uFZt+omFDlnTUkhit72TUvP2hMfRcIUvPq/6rUsCjP3XDAne1XpabQFQnR?=
 =?us-ascii?Q?rjjrdBnRry778SgMHPjp0XsUkkZkGBuvxK5NFTByjIEwzLAgLAvzmy2OaCd8?=
 =?us-ascii?Q?vgXzClKveZi0kk3/FvCNeiYUJo7XK5KJJlEILsQ4gUnfBDfuzF2w2IVTayte?=
 =?us-ascii?Q?Docy7jvgTwppIjllcICoZLCecfwxi9R5W4XNaHhN9PQYvDNKVDGnNSzNz+7q?=
 =?us-ascii?Q?AL/osg/wMf4z6HQuJhxE5ajzjBcr0s7zIcUH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Is1iaY3+6n8cy47/zP00QsyjZIY1diwq+WUM0h2MT13ge9UG8rU9inoZ/qUI?=
 =?us-ascii?Q?5fM9MZpzSi3Zu4gTGK+7p9MzT8JM1+ZkQLj7cIYwGbYme0DwKxS7s8Les+aR?=
 =?us-ascii?Q?iO1GZxp2ZsJiyYHLhDEYZ4V/5Q0mPsswiPMiRwjPYJQCSgiKe+FEZpfpzdMP?=
 =?us-ascii?Q?njbgQSxHtE/icsKuwqKdMm1kkc7wY4kWcKkRgcYxnnfwjtY4XrIoc8O/XPdo?=
 =?us-ascii?Q?bqrEShRXBar1z5cEFJsTUR5N//CqVJTpl+AAT2WLWew2mBzUaG290XhQMTxL?=
 =?us-ascii?Q?TUrVg1vLoseZDOdAt8a6RkoYSb8bIrtXgvi/sBe9HF1h9S2hlKPfrGSnHkep?=
 =?us-ascii?Q?bxqfd2SGEpcM5Nf47QSW6mkqk6mx22BO0wcBifAC6OAAYQW76QIOXdun2l/G?=
 =?us-ascii?Q?jPfod6txq0zC5/VQNUaTLB+YAMS/0KFYSFVXS5z1SLWNI+bySVbJ1FjuvY0g?=
 =?us-ascii?Q?PibEYluJuqO8tCarrpIpUHPjq87c8yj+t2SJ6QlVP74fDGpXF5pbIb8sbH1B?=
 =?us-ascii?Q?9NnjvxgCmr1LlnM+9YfuPsnL07pUaGE+TWIS3TWiZ/xTKzrM8juoigaPK+1C?=
 =?us-ascii?Q?eYwBz0Bc09MbeoKWU1ERmzSBTwqhLiTlBNIhxF+v+JqnhaMmzi+Ax63cBn9S?=
 =?us-ascii?Q?aVLRGCbyqVj96x1FlfIrfbnFgiWvANVrT4E27MjFvTK5Kd0aEWTo4ODWSiL+?=
 =?us-ascii?Q?1Dmh+Xoj6FdpyaSxCV/ONwNe0Vb5YSyq39DEVE5asbx+O1cnMVIk1lZb5/6f?=
 =?us-ascii?Q?L0bN70+xArqZWzefY7ecFD+nuB1XPAG6qaJhf1wrleqvSSiyTuPLK21gV7Wy?=
 =?us-ascii?Q?5mM8Ft4hO2dBuezgcL748FJeu90ZE8/rrURJm7f9jNH1NIvoQyAGgWJpopC2?=
 =?us-ascii?Q?jhZwssMk7DJ0K0WxAreUiNX5YCTeLCk735+WcE4YxtFQMsMpto5CzE3UFsNJ?=
 =?us-ascii?Q?7ElApT2Ewca1CX4VZDBV/yL9xV7zdHAysoMJQc9CZqlOe4nPC5Ll4ba3QQ2a?=
 =?us-ascii?Q?bIWJ41cL4v9MM0pUFejC54xwHVJn7pT41/jP/vnpmKamPth7WcsQBOSGMdeh?=
 =?us-ascii?Q?mys+sg1yVkC1lt/G5C7RvHxW+iAO+5Sc6R18Ub0m0bkdi0Hs9zMNnNfJ5Dj8?=
 =?us-ascii?Q?Rxji9ZZZQu+XNVg2/3YlFf8y73Jo+ZM+Ot10NOBAPgz9sRyEZDjSniJmb0x0?=
 =?us-ascii?Q?38jBOyxTpXxGq/sv1GY+PefM7AGMmTdMu00KHvuNjqdYHl4WPQk2v8oyir6s?=
 =?us-ascii?Q?dI2r7Imn+rhWJIFCzWzDeW6X/405LJltyhxKn4N+qhEdOsawBSKgAVX4VoaD?=
 =?us-ascii?Q?GpcS/V7UuGEBmDFePLILMJBtYWEEWVzLzr3OoqekVeUKXwCrAAf/eAd4Lfni?=
 =?us-ascii?Q?1GeA0nP2yIvOUvK2Fb8ZBbtGpjkWeetsaRgIDmnCcF4veYYX8Xy3ATydjBFs?=
 =?us-ascii?Q?RAgDIq41lv6w5YVqH521pA+x9YrgQ2IKM0IAj8royuOE0HNJEB4V+OMKIDwL?=
 =?us-ascii?Q?Dp6eiwBSZhdedLj4v2RVl21bNyW50oCxljRE6/e84s/DwEBbTj02GvD0Bjjn?=
 =?us-ascii?Q?t2uiTP2U1prowYkUNGzeVh7WvCMHPZDPFnkw1RQYtPW+uLYZWtuwrGGGgAde?=
 =?us-ascii?Q?QJDkRP5vsCkQ1ZAODsqq6Fo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55dff8e0-56af-4318-2c03-08de20b9377a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:28:20.6168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uByP7ThkTTm5Rg645fU88jbsuH+FEiVOik8JKXCTQycFGgOtBzhm4Lc85mMEKVeGLFuhCAgwVAuAmaFI6RLyvML/UjGu5HQGCgEP5q0esMj8djD5mylWE5ETxau1O9O2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB12798

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
 sound/soc/codecs/wm8523.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8523.c b/sound/soc/codecs/wm8523.c
index 6671e13c320c6..f003f19766e28 100644
--- a/sound/soc/codecs/wm8523.c
+++ b/sound/soc/codecs/wm8523.c
@@ -317,6 +317,7 @@ static int wm8523_set_bias_level(struct snd_soc_component *component,
 				 enum snd_soc_bias_level level)
 {
 	struct wm8523_priv *wm8523 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	int ret;
 
 	switch (level) {
@@ -330,7 +331,7 @@ static int wm8523_set_bias_level(struct snd_soc_component *component,
 		break;
 
 	case SND_SOC_BIAS_STANDBY:
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF) {
 			ret = regulator_bulk_enable(ARRAY_SIZE(wm8523->supplies),
 						    wm8523->supplies);
 			if (ret != 0) {
-- 
2.43.0

