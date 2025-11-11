Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011010.outbound.protection.outlook.com [40.107.74.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BFA522F77E
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821257; cv=fail; b=iOstqJVFlq0maub4SuE9acWNeTkoHCSkp6yO6ScY1lN+Gd1gFIIIOeJz/meKuyFB74XT48zDr7Y2hSlosTs3b5Rm1g8lyDzQbWNX205Ov2e/HUQYDExKFIiQxC6HxMh6XQ9SfGBnEa7Gy/JbT+qpfDHONyscaTmrsiIA9A5td1E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821257; c=relaxed/simple;
	bh=Bk1omv47O2tt9Xj1QXxe/5HSqYyU/YUJHlrCNapLiqo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=SRS9vEB0x36ARDg8kbRAf3b2CZc3T51tdbWsHi9gFIUjvHE74KzzKEzkNap2ddb+L/wDnA65/Gs+UOhqW8mxtesQWackyGZtYeldnVqpechFD7t8Q568zskebxobJZdrE1DCe7O4mmEqSsQRusAAQmiixIauX7uMpNOpT2gfyjI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=NNR1jUQh; arc=fail smtp.client-ip=40.107.74.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="NNR1jUQh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z+l07+ViShrjhYjmVa7G+RKLl7vj5qfpCe0hif9gJ4q0oCO7Bx1Kfd67Wlc46vtMEoFmAQS1dH0DmZgQ4CJZi+/SePaRiQn7NRzXRSfo6mJySwJyTV30SbYdWSTi/AwB+6cjVb4/hIhd/1NRuscnpALo3mz5PrJ8xYop+qbWBsgaPtLqtlf6STjnL+IevM+ht7k930jHyGxg/Fq+WZi71QEIV3LZbwuPFXwPazb+1x7zfihKZQeTj1/wZSEzTDxggg+2X30e462RC2ePqQ7OeLj82SQYsLNyq9mV6D8KiLTH8ZDiVW3elmhAVywF+9IsKQh9j5xgXkEX9oEuM8y38g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uSwXjmFXcZ1klYmhKL0DiqMtkCPKeCjZwbldimpxG6c=;
 b=HmWvf7JkeNPMXcU/C1aNQXiDSXYoz2eseBoqi9HjtQZJlkZ6sAHRhO/MYEiQHj/Qi40sSDXXZv85xBc3deMmrRTVhKaHLBMdQvzKQWvqd78LzcyCb7qxTrbolRY4W1iNOx92ZLFkfA8XMTK9dGSmJL+lUYn9TI7s98gTZZy7L9VdK8zyRPasgTjjCTEGGVohCHT8rC4xqp1u2oOLj7SIMAhptpNf6XGbLZaF72DGuylQL/VqWJM4qrmXVia+B76cGxpe1ptgxx0zXlFRar1848PbFDNBXlx986AJb4j64hC5BNAvlAqYGKdYn2Bi3UF9Au07C7FNDUyWZRapaxq33Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uSwXjmFXcZ1klYmhKL0DiqMtkCPKeCjZwbldimpxG6c=;
 b=NNR1jUQhm6UXxYD9InNXGHQ+oFHro4bYT58XS1xQcG35WbakeIg60W/AIccU8ltDIP+WUjzHi8FesO7+x+mG9qx8vofl2q++QuisNkBqqtecUxXO2lx2K1KzZxMgZY1N4neJiN2faDcoM2VmFNhIpWKHdGHckiDzoA+XHoVE0/I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB12531.jpnprd01.prod.outlook.com
 (2603:1096:405:19c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Tue, 11 Nov
 2025 00:34:11 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:34:11 +0000
Message-ID: <87qzu5v24d.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 239/292] ASoC: meson: t9015: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:34:10 +0000
X-ClientProxiedBy: TY4P286CA0065.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:371::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB12531:EE_
X-MS-Office365-Filtering-Correlation-Id: fd27eba1-6350-4849-a424-08de20ba0858
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NBsNawn658UTQunxQ9P7QDLcUf5kDOikyqeFKM9ZrXSEAcVnnQRxP/b8EDF6?=
 =?us-ascii?Q?im8QJehOqM/lC9twH/14am+PWNDm9jBn8x5r1X6OGHytgdr87jBRRnoj/3K+?=
 =?us-ascii?Q?cSnrpCmQrCoU2+QCWdSN3TJNSzZtz0MVx3IFMaMuRoU3oF/99spKnmgujQnE?=
 =?us-ascii?Q?5WqA6Eqo0AFBI/CoVysD+/bT3O1tkzN03+Tidi76SUK7FbKCjojHuStGbTBb?=
 =?us-ascii?Q?b3dO8hOE0pvuoapuH7M/z0LYdTeOtCbrXpvuJd3Xrga95j1Rj5DAiZosfa6O?=
 =?us-ascii?Q?SNwXo3kr29MojkLEShfW9+EVZNbGlvWOsWRd8SGih/mQ9Qtrz1ZKYq1LVD1h?=
 =?us-ascii?Q?P5vMCLIRwH5bXNdkPyCwbgnktIbNNCaVZlZM1pMrdcl93at0fGxGRU/Sq9Dh?=
 =?us-ascii?Q?dZIAismknh2h8cAq5NTcDdBi7O3IxmdfugaKgC2mg2JOiP53PRGmjqMN1r+h?=
 =?us-ascii?Q?6ubnSBKTx8/PNnOKqSH68Wk8sTuvhM1WS0GsO6iuo4FLPGqgV2AF4zYKeFbA?=
 =?us-ascii?Q?ZV+SXIV/ZNWiWxPf4hgTCnX5umRAt8bXnXn+YRuepn7BQ6LYtv3OwzQGFifM?=
 =?us-ascii?Q?9ZGfDOWrQxDtuHZNq69EYYb9jEeGMDsIitCtfaP7dIROKeAMIL43H6n2HelW?=
 =?us-ascii?Q?SnrDZhmGHmeDVvpOIzOBlNhBM29utPnNBn/tos/4l2xy7AbtzvoiAt7tH967?=
 =?us-ascii?Q?btcpniELLkqIv4ubtKtWwimrSFRvO68Y8gzw5ZyZ5SM7vRUNa7PwBa7GCM/1?=
 =?us-ascii?Q?2U5eWZdizOxw4ZptpS1fwWPsfWNVIwdyr7ejXeCCHJpGsb9f1t7rIQ2544PZ?=
 =?us-ascii?Q?WAcdb1dyshyrQefzT/V3aPMcQpcw2clvMlmbgwRuQCtsJ9bXl9cyiwfVFdr0?=
 =?us-ascii?Q?qJt5BczTdHaTLLhCjxpJszRZDOYxNvo6TBzu4t2S7MyYxZs9Z47gyINW2LMo?=
 =?us-ascii?Q?HyXBQPQJ6PKFjnzYcnIW8EYxlyzxeaJNR3bD5MOcDC2tJmtjL6BB8kDk9nh3?=
 =?us-ascii?Q?tuo4MGTAFgFOhs23wEMDMCRcFXXiWknwuZiwaH+pdRoz6Ac86suiJbbycbIL?=
 =?us-ascii?Q?ZSWP9wuTRqAJ1kAGchK/Q8FAsGqQ+xdp2rm6lsPohdGq+DdwDNHREcDNqVI3?=
 =?us-ascii?Q?iPtRrh9vcYuRVsjsnvqYTzd4R+J4BU4RnzCVOX2WvrqVfzcF9LIUmI3wUJFN?=
 =?us-ascii?Q?2nBiTN1EjxtBv0zfOqLfwHREuG4WedREm8Rm6jH8rcJzxkzFmz5lC99U84ky?=
 =?us-ascii?Q?T7FDodhDL3pcnzmggImi+DG9Sn6TwYjtO7vwV47xoPC371mvoqSWpCOqZ4Jd?=
 =?us-ascii?Q?ico2CcT94xHMLQFyQtMZXBFLYopYRUF0BectBv14SMRGZ5zvKmitoNn9PLrF?=
 =?us-ascii?Q?+SI2fXC3SRLIQXSJSGLmE3pv7mj0bRbXfSI4K8L6PbUjz6AEPwnO5B/C8TxO?=
 =?us-ascii?Q?oHfIpoJmW3OPEOfPxSstTVytTxEYgvjmnpRDLJdzORx7SuwFdlEuhU2ToJQb?=
 =?us-ascii?Q?9+aX9yntiuvvJ2ZGbi1OtVk8GsZAnQuvTRqF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AvIH2J8oYaon7lmLVHq7ec0A1M6cx7FhHZGGx4b/2yH82rPriM+LNaM/lL0q?=
 =?us-ascii?Q?J6VUD6JAWCHI0/e/Fbkpy/vgqrjMp3gGzClwcVa0YYqXjjeIz6ywhPkUl0jk?=
 =?us-ascii?Q?kWsj68CPd/Yxs+lPW+8rX8Wsx2DJSY86FQ36P5spSwNEOpmJejktC3GmBRhZ?=
 =?us-ascii?Q?y31GwCgpFuvtmDRHqjBVnIRwbCuJF2q8Yo4cZB73WB133C5OiZXPQ7gRRL1w?=
 =?us-ascii?Q?X8wWFz+o3PLKGpUt9x9Y9gee8OO5YfGpLDC/53IEgosIquCRMSLwsh3av/re?=
 =?us-ascii?Q?hK0N5PewI1yw1tjMUpI3ZsD02ppmpw8OorB5afIrXABpy0XGI0cPz/8WC2uO?=
 =?us-ascii?Q?hTtqutQA3FsQXCnHJyZrodK9Z1aqWRx8m0t7FcvzO/Yjw/Bec/x5fCpWWH3D?=
 =?us-ascii?Q?Y8DBOV/JtLGzpr7yAte9gMeU7nZ7bpTEunsIEfGxONMt2kZ0P45auPZwIQV2?=
 =?us-ascii?Q?SPPNbGAZjNotDElNAahlV9yumriGc+mlNAkca87E8NpCl6ZV0Sr5V2ZOsfYW?=
 =?us-ascii?Q?xeK26XAQNas81WU8yBu9pm/BWplv+e1pSREY8QlSaZ6Zp7CSpTaie+pHqkRL?=
 =?us-ascii?Q?79QE7IzEkL2HYwJxgXPVh+AKmbWS2cFNofY0XnqTYtO4E1jxD+SIuNnh8yvc?=
 =?us-ascii?Q?y8SCIRnvuBjOtF66b3NS9wR4MdTxDPmv7dfAyevQhe7VDPNO/7Lb/zfvm2ku?=
 =?us-ascii?Q?zKhW+mY3uTG++vBHQXD4/DDDtgRmzkk7b9F6W41M4+3mXI9SBpLuMS7+5wQF?=
 =?us-ascii?Q?5o+VnIiiTgLcVfaO66HtRG1mHJXhW2UBpTEUoIUn+U8H/ZNONLt2EC3+CYO7?=
 =?us-ascii?Q?/fe97Kk/DN6ow/VaDT8vkxwYRYoGhvaznWcQ83TPL6aulu3Q6/hUYU+qZIOC?=
 =?us-ascii?Q?RH0dJx+gLB9D2YHOJFw2JKnjoW/u9xtV2ikdEuh/xt08L4M433liELJdkh5s?=
 =?us-ascii?Q?2Diy6Yxd2ofUmus67zCwl6H48pV+tHdQD5JctxVtymUFOi30gRw8TviHGteI?=
 =?us-ascii?Q?blEGPudRANJt5CSSdIcWjRtUzTh9rQ/EIStCcaEAH+e5jpzw9J4tWl5rmD+8?=
 =?us-ascii?Q?MZTJKmykenh1rreh/MzlR0MXHOH5cBCjzNFdVbK3sJZHopX11hM9Z3wa+w/5?=
 =?us-ascii?Q?F5JeRQHTiu32w//SGRKkPM2mQYg98T2umT4R8A83GGmuWfIdRIqv5u8rJNPk?=
 =?us-ascii?Q?m4B2XTMoujioGYxrWzmC5lD3+e53/dTD4DBAxBAatvXTNWiJuhxrM+l3vkq+?=
 =?us-ascii?Q?5EViZOp1PUb8kItsvcnciJSAV3+Abul3wHYMPsjXZjIZx3f0Rx3mRsXN8cfW?=
 =?us-ascii?Q?m9cD7h+VMeVAvIf+vAvcLiN3QSHwvoQYl7eAJdt4YppgaP1EOvx2tDuZTr5M?=
 =?us-ascii?Q?Iru1K8Sry3NORF8U1UaJsRJSKj3zJINYt5qyhpCjTLcyj50yHoUKExPZV7Nx?=
 =?us-ascii?Q?aMNE8npBNGRNNUaEXEPaRkmRPj9hkQGyiz/fJurHf/QjAUtg3EmGcoVZ/POO?=
 =?us-ascii?Q?BZe068MqkuRqEX5URw9nzBrdx+FiNgVzk7Qryckq800/eruXA/NG1xRbCXQj?=
 =?us-ascii?Q?NF6tFb8maoDcKlVQRrzgIyxynwyyBOSLvduUDeOnMKGAZllDKaOYuzWx5ZSA?=
 =?us-ascii?Q?mHnHmixeC594iGvaJLoMJqU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd27eba1-6350-4849-a424-08de20ba0858
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:34:11.0887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w4GkI460AUVf1viJljwHxwkLIeVZlppTn0JaHzTASpmMEJWwVzMJJkItiROhsb0YwTFd40OvomGJbk2nizFfHKjuEdJvEjxiFR0Ytd/yw3i+dHgevZxvwZkNWx1BR47F
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12531

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
 sound/soc/meson/t9015.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/meson/t9015.c b/sound/soc/meson/t9015.c
index a80e9c9d6288b..da1a93946d679 100644
--- a/sound/soc/meson/t9015.c
+++ b/sound/soc/meson/t9015.c
@@ -177,8 +177,8 @@ static int t9015_set_bias_level(struct snd_soc_component *component,
 				enum snd_soc_bias_level level)
 {
 	struct t9015 *priv = snd_soc_component_get_drvdata(component);
-	enum snd_soc_bias_level now =
-		snd_soc_component_get_bias_level(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
+	enum snd_soc_bias_level now = snd_soc_dapm_get_bias_level(dapm);
 	int ret;
 
 	switch (level) {
-- 
2.43.0

