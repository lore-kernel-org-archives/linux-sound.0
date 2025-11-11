Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010069.outbound.protection.outlook.com [52.101.229.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00D323D7D7
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821436; cv=fail; b=W8X7dE8z0V5lytLL3EtVf9Wv73QOlW4rbHeXa3L4aXaMnbA5YlKxnX61H7UiDldOg+meGUnFzTqDuQ9rDpk6Lb13pAI+FFA6BKqx0RgQED3VfygU8w+OMXSP3Az1V4yik0zFJGiYDxfzA44RsY2niX6XLthoJeAp0bM1GBi+biY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821436; c=relaxed/simple;
	bh=uVmVe7XUzDGbt09L8yLFLddyIUoeiKEkjjgp2i23N7s=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ZsOMU/OmlHNHYRYjGNoFskQ3PNEMHwRWETKnHebZPupY7w/7qHhCQxx/9nBPmiqjBV7ojK75UBkgY0E4NFx7ytioBQGH+v83AQV7W7gzbdC5NRsjzKLqL2Lvw3tRHanGOn++anJ+/ohJMmAmX3QEuSXJ5/pNMd6YZ+htrnqukzo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=PM23fzy7; arc=fail smtp.client-ip=52.101.229.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="PM23fzy7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XaVqu/TO1+YfmzY7DZ1+O7gWGBAwQZmqRdyVHbMotPQ3zaTCYtZcTb4pgUE0zUdK8l0fIBg4/bNubNSJkf74x3Vdpn3lCqt99SOUSoqSJ634/wiYu8aKj7Hw+4R1G4Ku0H4MQxI9KJ9vyMNXty+WgaqB5cFJiXlodq0nSVrlfiXVGWARtDzr32X2NdsiuBb/uveptgTjUGJiI6jp+wWqIn0z9OQmdP/yi2Z9Neb6Cic6VUPf9nJGMV620jBHZelMEcd1AffDAXIKj22Z4OH7jizQBspzw+F7oMMN6tzhcygYPsB6FrFQZ+UQtB67aMrSS+UlkXk9r4bAGJJlGgeO1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yxlkCSkko7lCS0ChWfu4kXeOWBgtusp35S9SvmRy5mU=;
 b=JCqmPZ8GE/uRGg+yJFMctjkwJ7UWmZoWrWURdef4AIUMHl42DFIz0AsMcBy/DdQasx6EzhJKx1LYlqdS1fjc4hCUzHGNbKIzIe6rTvn1nliOXEx52nGH4YoXzXM+cv/gBDXm2LUzXanyZx6JhUICT388BlrJcKyXS0ikaW6HvmP2ChVgiFNy4WzgvzUIDrwKwNZo5nC5PzCuu+3XoBFaMUzM3lZCMhC5EowqFrORrADiBdctq//WUqs/meBwjYozK8Ut0g75SfbfOauw4hGhI9U4Vuvl9C2+7aCDBMOfa/9uW0sWNsyQRzzs0VcVCLBFdKixVjJ80ZLexrsSzV64HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yxlkCSkko7lCS0ChWfu4kXeOWBgtusp35S9SvmRy5mU=;
 b=PM23fzy7Yzxu2dXcZOlA/EHFLRKKVKkECYAV7M8Niyab3FXMWW7u2ZlwrCC29qG2aBhGAV22Ux9hSUKoeo50Aa4PV0HyiNlHyYYuBubpWIT355ZuTS9DJZVpilUuTkxX0zTwo404H5tOeYskXOBCYy39E4Cl+KwMEx65PF6ryfc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB15789.jpnprd01.prod.outlook.com
 (2603:1096:405:2c6::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:37:13 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:37:13 +0000
Message-ID: <87qzu5s8uf.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 289/292] ASoC: ti: omap-twl4030: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:37:13 +0000
X-ClientProxiedBy: TYCP286CA0222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB15789:EE_
X-MS-Office365-Filtering-Correlation-Id: cebd6a2c-5510-441f-36ec-08de20ba74f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gydXFZCMhMX8klLWc6gyuWMirNMlmflujR4BHtjmQR3/DMR2WjS+1c1VvMfz?=
 =?us-ascii?Q?k7eZsUOm6FN9jCIvwrEMS4IXBDlmJkP4QURVmu/IYr3S8OV9gZv0Fve+YXBn?=
 =?us-ascii?Q?DVf91AaLbc5BR0xibSlDczHB7heCI9fd4uclpzSAazbWrKDJNsTR8nj41Tfk?=
 =?us-ascii?Q?wU26Hpk2jRi+LWBNV5AibeWD/TOoLyA1fIizurb0rXQtIjpgnt3ViEgeJPsh?=
 =?us-ascii?Q?gSySimrOHRMgKZTlkbvkcjlynNQ3WXGqobQZVxyS9ZUek13RYfvEgsMmY0Gn?=
 =?us-ascii?Q?0hiUkr6kQnRb7ABlMwcEh5G+E0bJCTGXYyRo5O9Q5YTaskPC9u5h7IzI5eX0?=
 =?us-ascii?Q?46geowV8FhesrgmCzHzQWUzFUlEd6u/6XX4mIWiQ6fxkK+EjXUXLjBNOXjSw?=
 =?us-ascii?Q?LMJyBro4q7gApGgbygsLiUYu1Hw0aOkDTxCokOlwdFbHLqF+rfaItYnjkpUw?=
 =?us-ascii?Q?ujHHZB3MYft0wbjDdB6YnjH2D7VDSDPSoCwoPNUaXAqgzx6X3uPb9EVO7SvN?=
 =?us-ascii?Q?RNzkFYJk2uVdscVycRwtRTvFMFrRedYSuMqsTs2LYW4vcqW1xKF09K7km525?=
 =?us-ascii?Q?z7PydkBCGbLDhi6QM8AovabBLabsJgofOZU9QVaYOGCpKu3Pe6j9ZGAUY8+7?=
 =?us-ascii?Q?4wzGS97jFH0d3m3QZ1VlZcxgi0pr/YFP9RUmfQAg/RlqskG/U8Qv2JpYIbgI?=
 =?us-ascii?Q?xwKDzTaLi2w1oDtsG5Ipxh2Epib49ecj2dQPaLvF0CmOd/KBlxHA0ZVZOuyx?=
 =?us-ascii?Q?XOYoJIEeZNnNo4x+b8LH9SmI/hv3XghRFBvVFAq1nsmye4gk7aomoVnvZj31?=
 =?us-ascii?Q?iUt0mCcQRF0pM9fTYF6paZuYwc4kEEdXoFXYrSzw7dUj+BXXlLFwalQuqBOj?=
 =?us-ascii?Q?VNWsB/IHMYzAAiM1pl8z5YpuWE+5m5zmE+AOet8c0sSSJL8lzN14wPEazXoF?=
 =?us-ascii?Q?nFQYyXwLurNOLvPMvDIamkVUKGSWFmhAho3xfKE4NdE5Xl/GzLjQgXHH9r9O?=
 =?us-ascii?Q?xJDYasR7zRWiKffw+GrYLKIdRyvX9WhUiUuOmcCROTvBfsxOUj//KxQJW239?=
 =?us-ascii?Q?pIsKEyvqjpAhBlb/3vVILvgcIOrPMxs1B6dzcJ8H+k9Mgk59xLGzdeW8AIhF?=
 =?us-ascii?Q?YUTan8/A28hmVZEPpKJEHPPViX09xDXjLdH4TLPggLRmd5LpLvYaAIaLf0Xx?=
 =?us-ascii?Q?VZN6RMnq4HSmZXfbUzRIf6e9608z0TcWcV/t9cy2XXyhK62LoxCUlWvyOtom?=
 =?us-ascii?Q?GKZwDXvRWMwnUjGUtDDUu6qRNcc0J8dfwHnhYVoi3ZHi2IcaCNs5YbDR7Jgx?=
 =?us-ascii?Q?5cvF3tmUz6ZxzIsMHwD2wOQieSDwOJBHRAdB0tpZEZjVYmMkZmDr2JU0NJ1N?=
 =?us-ascii?Q?AMpc1+gV2JMyLhdP2e/kIG/SEHR9RyPDeNZnindAMCLBI/cV4bnmcGYO+oeC?=
 =?us-ascii?Q?mBcezK9PnFlj/U2GDvl40v6n/LC4Q1ZH22djTgB4tevB0De/fOCfCP2ZgIb4?=
 =?us-ascii?Q?yj2rfoGkRLv/AQgBZVrNDHJ3Pj/x1W3CVJFK?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6gIGK2FGlSdWMpPXs/P5nCK0h4uosCvlP30Bt2JmGhwyvG0Nu9LCGojJo08x?=
 =?us-ascii?Q?RnvJUKpyu8uFdFWcrh2ZhyxZVg8PiD7DiI9hfWymvrXIAbew/iu2pJ9P4dCR?=
 =?us-ascii?Q?xchhwlF53NjL6/fqHbgDjqFmMNrLm/NAiashCe3XDDgI2Z3TT1rgL//aHVSJ?=
 =?us-ascii?Q?oPp+oFwPcuAgszL8G+1ngUtewoV/MB61VY6H7xOifbi64am1g/DsOhOcPV7X?=
 =?us-ascii?Q?D8sZPj0UhmMz+VCFQKrVrqwUm8Xu+j0vD+RpWNghhOTUdgtcI0XedKZucL3e?=
 =?us-ascii?Q?4spx23TnShPTzP72ot29Aj2vZJ+s1iD4vLgqnAud2Ool3wkSbOenS9PIbERu?=
 =?us-ascii?Q?OJQvnslFugVEGCHNfI3pOuie1dlnkurMx4qQh3p7UnTMjjS8K7mMD12EkkzT?=
 =?us-ascii?Q?FzweFBse1ajMYPXPPgNIzP/T6dGF1LichyTgGM7vWMJhisbca9PyFQRwSP+X?=
 =?us-ascii?Q?FYTyu/KC5RzecNmIKHH743//jNb8F+f80sg/Kb8MQDQXtHTdP28m9wmd1Fsi?=
 =?us-ascii?Q?kwR6rrBf3XZ010ijvHqDlABHksRUkhiu2gTdWruXdhLIVbjn3L+RPYbhKMJB?=
 =?us-ascii?Q?A2B9Mjl1cNcMvh0AGLQC1/OkLO3f8K6tnEO3b9fUPaL0ePGEJfQpQee9+v+z?=
 =?us-ascii?Q?LjLHFWjzgGXy3mqX+sWeps3uOYFoxz+OJzHjEYvRdGDzcRufYZntH+ValDRN?=
 =?us-ascii?Q?jQL+6frNX//63zy99/8NcZKbmu2TR+YgXPDU94ccbjW9aMhbsDYIsczKN1Qx?=
 =?us-ascii?Q?inE/A2n2ictk8L7W1s8StDMQs1i1RxgKX91JSEQv5JK5zAVgYeAFSBnLQMBB?=
 =?us-ascii?Q?rNTGhM/oeFlJojcmEam0Jf19NJEUwZpopQ6LgM4RfTYU0pqmglPFzOw3LN19?=
 =?us-ascii?Q?GvhhiTgooQ1yT1T54OAeTmTrXJM82x/9W/1c3x/z4GcL+aa5yfW/i0/J/uV3?=
 =?us-ascii?Q?Jgs65qPiYNUBWr8ADTfiLrlPZQ6AcIcQztPwy5yxGz8hA+z7NQMLdtwygAuO?=
 =?us-ascii?Q?uMvnWsDWYAvK+EOpQTTENKUly7/y5xh/m/c5MsPgRm2qNgQrPX8FMATjFEgT?=
 =?us-ascii?Q?LfgigQTGqkTW2PDGiMAR0BG3EXKYaO882rvy8fxcE1DrKZ0pvnzzL2hrf5iJ?=
 =?us-ascii?Q?ANYf9GfSkQq9/ylMkekAd9gDOWv6G5idKeGWnofaS7ToJrtAWxx9jijB1tZa?=
 =?us-ascii?Q?akbfyWrTjHBf3frEcld5vjcA5EnnsdrCT+jV27VdmCqBVyp0vekIwSZdTXwl?=
 =?us-ascii?Q?VR5KRSrSSXO7kU+5WbitDs6fCPl+osxy+wlVU8bEx5Yjy0NZGZY6jhyF8ako?=
 =?us-ascii?Q?Y1T2qu9fCN85de44Y5ZebJwxEl+b+pA8FajzMAR8mBn+CoCZ4AhqqEE41+JY?=
 =?us-ascii?Q?90t94/GMwLxgf7H3RFaasZtr4GZrAGAtuBlhCKEZvcFBB2fkwjcr/OBTQOeN?=
 =?us-ascii?Q?E7s8x6U4I+ql/tiH5CVubGcfrzoKQDd66p7IlPlnK35PgV141ATP9oFQ3i+F?=
 =?us-ascii?Q?uy87q192+Jv0dSOx3zGPK0fFMjghnx711GxOdpWAmGk7cVhRpt7Qm1ARULuG?=
 =?us-ascii?Q?zmoPYQvfrMmsg/lvHCIhxGX7awoI01JRSIdJhZVV148bbkzmoFqm2sE0LEgr?=
 =?us-ascii?Q?w+tQWY+9JAm53PFMb1YkkZc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cebd6a2c-5510-441f-36ec-08de20ba74f9
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:37:13.2793
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RW2w04RzF9Gz6RCjzRNuy2VWicVJ7wvJb2mGRWODX6J5aPn0Zu+M+cHSuGsD04bVzuI2KJxJAbZzvPhn8Sw7EJg/VVKa4pMeIC1tq/S6Wy14kV54JlF2WhECXZ2teS1c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15789

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
 sound/soc/ti/omap-twl4030.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/ti/omap-twl4030.c b/sound/soc/ti/omap-twl4030.c
index 3548b58002c46..4d80f8a7a9477 100644
--- a/sound/soc/ti/omap-twl4030.c
+++ b/sound/soc/ti/omap-twl4030.c
@@ -143,7 +143,7 @@ static inline void twl4030_disconnect_pin(struct snd_soc_dapm_context *dapm,
 static int omap_twl4030_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
-	struct snd_soc_dapm_context *dapm = &card->dapm;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	struct omap_tw4030_pdata *pdata = dev_get_platdata(card->dev);
 	struct omap_twl4030 *priv = snd_soc_card_get_drvdata(card);
 	int ret = 0;
-- 
2.43.0

