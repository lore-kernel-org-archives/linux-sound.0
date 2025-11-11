Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010013.outbound.protection.outlook.com [52.101.229.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657161E0DCB
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820925; cv=fail; b=A20LyseE3HqpSnX9r9jlFKR/i/4US1cqIm1YjeuZl9gVZkrXHbR8RXieHeXL9UYpll7AX1vyztFFQJnZOUQ7R8te8IipmsYMNjYvB8/0WPt4m/LUZEdaQ/ddJax3CGZtUZ+YmoXa1p6iUStT6a35p95imIAKJ6bgjz1laKPc2Vk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820925; c=relaxed/simple;
	bh=UcAajy8Bwp2YXt3azMIvT1KoBYzqLhkMVE5pW9WYcv4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=HZWEWa+p11TS17Ql2SgYe//XkHsG/UrBf3vuhDDFrRqGpskUSnM4Le2ND+lpCHhc588hHtrTfXXxpb2IhOTVNKPxWcoBl+Pc95ms7vZKT+emjINODY/xu8QsE5ijHuL5fgZDS4UZGqdCjzxHPgnPCvPpJ121HRfIv3G4hgNXlvk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Qe1YlT+G; arc=fail smtp.client-ip=52.101.229.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Qe1YlT+G"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JdslYMzRIHxkKGhaD8Tv/T+2V8sfoPD36y5+A5Hz/B3NtNvSyRnc18ejWs4jyygkU7caL4JePkuHg1kkGF9g7VXtv9p9klWzzTm48fMQe9brw0OTpceL4b8Jpq3FMkZcUX7GblOv7Zdp5vO5Fgpqh3kQ1dDjQ28d/ndocHbJ97MlY18uB5iE9ochAMzI0We1H4TFJ4mmJPKfRI4afuVo7OPaGbFH0vuXyYwG1tstKpDjxBUnGoqbdFMB1HhXV0nW/WOALiX3JtEjhnLAtEsqFqJ7Gr96oHL8/vuE1OuoBOsrxVvyfBHx4f/yX3qRKCWsA99L99++TrRav1NEE5j6aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ESj4C4+ZAEbRjjwLw1Upg2otCUeMyiAThMgka7Pqi0=;
 b=veGZxMIEz3lobYdGHb3lfV9p/14UbvsBCzsjCAiywwCFhhJCEhbXqbxhpLCzv/9Znb0iCY4T1Z1O97FPAGVlgAXX6HXQAQkwpJt0v5z9ZjYjEJXx96ue5AISA+eqVreLWbO8KSIAHiVOaaw72Dbdz9Oi31WFKo8AvyBOR3y44fxpMfQK0jgYcpo2+z0Ib6Xinrr/pqyVQmeK155X5scfSlqsDN4X5pva0rBIvtdkW2Ere9CL0yUtWBVhQPJYGPrDtVbZZVgHjSodN4I0sSR7Q03uPsb16iwpCUH9e2maIPoCvXfnT9OnDylAcinyVw0IsypmM8AncH+AofSEM1lI3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ESj4C4+ZAEbRjjwLw1Upg2otCUeMyiAThMgka7Pqi0=;
 b=Qe1YlT+GcLEUwLd2FM/IOuFeHjAzTvZrzClSHEW6V4iigfCfKBxQPJ10TvBKaFOpZHu1OabdmPoR+ph3aZDxkRR2ko1I5EuRHb5sIDMyDvhWmdODfQ9iBUIiv53T/aWVwBD3qx4qtKko+vFIvVixFNO+NMvP4KF3QBe5FU5VT/4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB12798.jpnprd01.prod.outlook.com
 (2603:1096:405:1e9::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:28:41 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:28:41 +0000
Message-ID: <87tsz1za2u.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 162/292] ASoC: codecs: wm8750: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:28:41 +0000
X-ClientProxiedBy: TYCP301CA0002.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB12798:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f55b570-14a8-453f-d7d1-08de20b94423
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Y3MS7e4ArH4il2ptwWBhsJL1aELB6MsrVw0W82N+bCHcN+u09hcRDxYNRM6i?=
 =?us-ascii?Q?SoaX/ny9jj5HTMOqBHbNikzY0jV1x3ko10EfVUqJOCamxIDm8rXNJVLeUSv9?=
 =?us-ascii?Q?WbqqecJvDkwwCYJgcrAUabEXaGZDMPFFYf66WWswje76vuAP+aMcRzUIR9aj?=
 =?us-ascii?Q?P3AkCG/Gr/0oT73ot6HcJ0U6Cg7WzSSA1pAZ8J6BnMOOVmQhg1hZW8go1Meu?=
 =?us-ascii?Q?UeTX6r2xLX3ogAw5VQkWCHxkZAiSY6C24nfyiXvoYxLF3tBfYubqEPHMVGe7?=
 =?us-ascii?Q?ec/NcHIOEqRpTlKWTRD5X5FLf+l6Q7B0fg2VSUQgMUAiXC6+TZfXN40i/RWN?=
 =?us-ascii?Q?Y61XbrNcNB3hOGxc8O4EwVd2rQhCXbj7osTTmVh87arcU/NZcAu34ZrZr01v?=
 =?us-ascii?Q?uGD1ZRUFTT/jM9gIzmgpHCSlLzTNfbAyhGIRmo2pr2cfRwwpO0QcK0n+TtIa?=
 =?us-ascii?Q?qJIVpEym1Xes5KvvWh2trxo6UAlB+SYoUTfy5+tJ4y2bqwS61usMjEJQusEG?=
 =?us-ascii?Q?YwhIbPzA7hnQqsHKjcZbWv+Ky2/6Tck66Q0YekHGKZQGKwCi51BC5WzY/uiO?=
 =?us-ascii?Q?ieJJCkmYJz9VbKhRTYxMQEqFFoVF2WEGqvWqLk+vF+c6zPRxA70mAVg7qftC?=
 =?us-ascii?Q?EpIA7TnNnnmuBOoLjAYcpaum3Ads7grPsG0w9wbsqnOYDcryjJu5ZqxRWXqC?=
 =?us-ascii?Q?NI2fLylF6y24TDCqCuiFFD2ABM8WQAQ/IXFa0B26T0DHlrRh6ecuBLRMAGf2?=
 =?us-ascii?Q?TOK+NYsJtd8yA1s1qHrL5U5Qa42FmUYOhlTc7qVP825uuuO5hJr3sF8AfGku?=
 =?us-ascii?Q?5AnmQZQfklucTn49oFc7c99BHmDuRe2b9acdAX6BVPqtqN28n4rNsxmyIBPY?=
 =?us-ascii?Q?I1LGJJfd85cTCF8gQ5TnewCO3pxV7rdsGjiJx8SNHruD5rk1dGUwTf2zdVnt?=
 =?us-ascii?Q?TRcHb0VPEnm36IH2I3d9RYUJS+1o6RrrqjMusirpY1Pa6n3LW/QEHkdAs8m+?=
 =?us-ascii?Q?EUznVHf2kSwnwYa6bSCzFuGfsuDwsO+jtVMRLQ+Nnb4VnJgS/mcZcORiCNNX?=
 =?us-ascii?Q?oz6N7bB+QEfF17m3KnKE7xHIQ2A+EHxgim/PGX8Nav8OdZjGrA6ivcUyrC6m?=
 =?us-ascii?Q?tiErahOwi+0YBziue6BAYoQQEJPIQZI+7DGSnzLiYAaUaLP4Niz/TVDTzN67?=
 =?us-ascii?Q?FknboemJpmx3of96ZNZmjdyngbGjE5IzsQODAg5bofraqbgaxoxcxGP6iuMS?=
 =?us-ascii?Q?hOAO+epcXI13PdpG/wVbHFHe0JB5TcvfGJyJhL31bvQVcNPiTc8brEXTKcZ9?=
 =?us-ascii?Q?9v9efF7FgYhR5YFXa4YwlsAycFs6XjVam1f16mo18+fOqXWE90hYWUiBG3oN?=
 =?us-ascii?Q?ZUUc0VRpbI4N6webuJG96GSk1Pq1GtRfb4NW6P2RwjZcvkvlSSIXy+mzDXpM?=
 =?us-ascii?Q?qK7mrmWAx6lV3gcGTDxIi8a2FrPb2zV7omdehORz+YbPSg2NmF1OAluw2W92?=
 =?us-ascii?Q?vy5w8gaMAL3IirBycbLO2uIP9aYEUdWU6+RK?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Vr+r1mD+2ntI3xIwEYGzxIr+az4C4LQPCJWRbtTX6hz5O5oTohMfuL9EU7hf?=
 =?us-ascii?Q?FyaMcDE6biilvHcleO+1ZNKUaijAEpyU5FJSF4SZOpQAShOv7d0MHMEu3O5a?=
 =?us-ascii?Q?vPi6Xp4aiEWPavZ0xyG3cEnLfrkXwPR1wLUrh+iqihqhJSDaokD95XAkXP+e?=
 =?us-ascii?Q?NQUT9ymHrzlYPDDP4TTRqB4YZt+I49hb/zwKkR9R8epKU6D/SqyU4l+ss7Cj?=
 =?us-ascii?Q?mrHAWUxnuSC65eoryFbu+3+D/fGIC/UVWoiM249TOjKaKeJMbfYhCRopEtOy?=
 =?us-ascii?Q?tL/4+uk4cfDhIPZzJY1cte7lma1grCLR4RMhEjfAot7jpsO3BQ0AUp7scq0k?=
 =?us-ascii?Q?ca3zZbO5k1qaYp9IuM1kmoo0gQPrjyL5kCdjaLK+HfSdBSl9ZmV12VkVQyxd?=
 =?us-ascii?Q?qcgi2pecnysY8+CZsJHOCMIuuCp2Vt0PltORW2powJqrKKLxHMrEozDyK7CB?=
 =?us-ascii?Q?62+/hxq52jZpx4/sE2cKFGquZero0CjlbFFe6K5LhBOzQpRuoSa5R8I0IvG1?=
 =?us-ascii?Q?woVwtf3sqomr2XTuidBpfxcDtum6dKSLs5nHIE+uTgYqgmRMuZpDDnmTZ8rL?=
 =?us-ascii?Q?fBJkD+r7jJXYBljw+5xzsmYX089a+ZiyNpyvkg8SZH80Qf24/Qrm6wuxk9xO?=
 =?us-ascii?Q?0xjmIwqShTCsiPSlab0KXUmwS+ZMyhoAKLkr6Y82SubtcifNm6+8Ef9r6ahI?=
 =?us-ascii?Q?Ugq++LtaJSGO7xeVeGJ4PDA1rML7eoGCnvAM6g5jsLerGJZ80myySU9qlRvQ?=
 =?us-ascii?Q?tX39Co8Icxm7/z4Hz040kFziIZmcr2TyOg2uQf0sNuBcqRH3Bddm5FBOyjWj?=
 =?us-ascii?Q?vd0ISBI91fibS6D+CZYt72NX06v92Oiwb93TTPcufsVQjIOBv0jBHoIlawQL?=
 =?us-ascii?Q?tMikRP5uZ7uHZUS/lU5KV1aXh2BeAHeEdZO0pyMEh1ceO/sJlSLgu7QMafnD?=
 =?us-ascii?Q?o5arEEZtfYlUoF/HYGVCjSRe9KjBWGPz0o1FXc1lTMjgwmzsGL94BJ3xRA7W?=
 =?us-ascii?Q?8Zl4goYdUHugu2TJ2h2VqkWVR6OCe1/sLtRmGKUYEQZE/l6BPlz/ZHgcLnGQ?=
 =?us-ascii?Q?qCK0RqpC0cbPELJxS50NMErUAQnlQlWyv+eGx5EeY3tpD6uaMCXFkPwyMpnc?=
 =?us-ascii?Q?bq7VxXSlA8lTBDUQMy3vBQr1L3v4WurKyXSh1QqiabX7XhMCn1J73DvGuoHd?=
 =?us-ascii?Q?uryFooF9BuraoBs9yVCyA5hy5wZ34dlCYQDcBM86lHIl856pAN9Wa/9hgva0?=
 =?us-ascii?Q?ESF22v8IvylfNhKuNIjTlYjAwDpWhE9NK+wCWUkpOJYXoP6G2d2+5qW6x6nl?=
 =?us-ascii?Q?cOkY92vNT5D6TBQsArAty7y0G/fW8S+jGkycd0RPlt1+TEQWEDnXmoZp6V73?=
 =?us-ascii?Q?FIWe47eMiBpdFFwpwMOCdPQhdT0cQyyjE9yAmaViDDmoS73AWCrlbjcwJu6g?=
 =?us-ascii?Q?a8QHPMKSiTSXMgK2XAn5fYeefR2tFOpDFe7fzyN1WtH9Hg1r10LrHFN5ZcpY?=
 =?us-ascii?Q?Zmb9tAStbOYWw3xuDaFtSMBb2UUoZFw9EDfRHGrq0en8FtVObUpliyGfsjVl?=
 =?us-ascii?Q?xJcttULxCXxcbcMh42uSHYGnAcq6uroT3MCHR/Aj/yP9xv/19HzYcq07wBJW?=
 =?us-ascii?Q?MNGRBgcF5hWY3E873IQ7JjQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f55b570-14a8-453f-d7d1-08de20b94423
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:28:41.8420
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3UNLKCc0144f1saNL35reLi++A6WNv6W5nirKSFqM6fguKZW3QNKRbphGASgqIBjQnchdBpzpeWnuYvMFPtldx8WEQZC7HCyClMtnEGBq5a8d+coRJgM5Vs4B6PotSeL
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
 sound/soc/codecs/wm8750.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8750.c b/sound/soc/codecs/wm8750.c
index 312be0721b5d8..0e1d3ebb15c49 100644
--- a/sound/soc/codecs/wm8750.c
+++ b/sound/soc/codecs/wm8750.c
@@ -621,6 +621,7 @@ static int wm8750_mute(struct snd_soc_dai *dai, int mute, int direction)
 static int wm8750_set_bias_level(struct snd_soc_component *component,
 				 enum snd_soc_bias_level level)
 {
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	u16 pwr_reg = snd_soc_component_read(component, WM8750_PWR1) & 0xfe3e;
 
 	switch (level) {
@@ -631,7 +632,7 @@ static int wm8750_set_bias_level(struct snd_soc_component *component,
 	case SND_SOC_BIAS_PREPARE:
 		break;
 	case SND_SOC_BIAS_STANDBY:
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF) {
 			snd_soc_component_cache_sync(component);
 
 			/* Set VMID to 5k */
-- 
2.43.0

