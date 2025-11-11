Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010038.outbound.protection.outlook.com [52.101.228.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708CE185955
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820542; cv=fail; b=qy+wDlhbaYpmtqGl+3KBzHR6V+4L+ya6cQzvp1UkA+20Xir3vruSj8Mb/I/ZyhOBIcnoNBF60HmFN7unIvyZSQ1GZsU1k4KOaLG8PKXKSL6jvn6Iq/sD0xyCPjUS6TX+is9s9y9xefXASxYw1aMlkLtUDjZzqhwxga1lF4P0UPE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820542; c=relaxed/simple;
	bh=Znnc1DcZFPU25lfh1wGQq4nH9Zcso6JqCUva3mdmFAg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=GQcN5zYAs1LVzdbll8BJEIDYaj4kfi4fNry5zQN3iniUXMN55KX7S5M6pEnL73xSVl7JV+1VS5Fs6hCMC9RdIUUdJdYcZX1xKPhoyP18chEtlNH062ZRbKGIkqShkQ14ARp1b9ksuYTd24p9u7TDonVdOXSrvOcWifgLLkjbNMQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=MqKKB9Et; arc=fail smtp.client-ip=52.101.228.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="MqKKB9Et"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s53FAKecBfQbp8mxtVlq10rznSOTL8mpLKEKBdX2MhpMnO5ygiHG7yXZYpgDcEpNyvTDZk4RfuuYFbXGBKzh2CIi0S0AsoG00c86L1kS7bTV+PyEQZuciWqWa/Dc8f01PlCHH/xjiBqkAOMdzUBW7IneJ11mAgKCxtjnct2h7CW62LQs94W0AnZcPDaVhjzn5J+d2hBUct7Bi0YX00qTfdeDpDQSKhflX7YBJy6EAveICFmOrjqyvXV+bJkDK6ikbERKS2EWOe0sgES6jh2S9hKYjhg29Wf0cfyW6TJO0cUyundOdhXcOjr9ndo7mLm47zguqYp1h5HhmSAFW12ZWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7x+g7iU8s3MCgPQom1czOyKwIfa7iA+TcQTj4+kOEAQ=;
 b=J8cPa1hLj5cxcFA+N6oGmB/wjWf83a+T8mVpDOr1Tg8EvMEvLqb2c3DiTwSPwYJzy4w4Z2+skTJSiuPREAUwXnHAnCnvZKzcclzFwp9J0RhUC2/QDx3eIgNFcG+H1894d3D9fZ+VuP5UYzXPIiWNVs/nLJH+gwYXWRNPcd37fdNuaGfrbfgEpt4N92ZnXjZPrMmY3WAa7m1BpzL3dabqnsK/9er0hUM0HNzc7zVbGZ9/qUoU5ppzkmjQg4zuDvLc3MGob+sZxmaNdPdahoKMO7QxvKGl5zXdeSSN3tnTdcueE2+9hoMe9XSYQnDFPpo4FQIxr03hOAgOHME3QUkMIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7x+g7iU8s3MCgPQom1czOyKwIfa7iA+TcQTj4+kOEAQ=;
 b=MqKKB9Eti71+XEknUmscfF5tvTyu0oEKHdVwYMe29Ca0lR7+gAAhCWONQqdLiKY22vfq0dWVtO0pCeNVYjh6KDFULB7LRzxP2+rXXM121LEyC26SDD/720+vSxnLaiLvyCPt3YSRjqgKFmvpbqUBasuNrBjwOLG03k0IavHy80o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB12802.jpnprd01.prod.outlook.com
 (2603:1096:604:33d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:22:19 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:22:19 +0000
Message-ID: <87seel5sg4.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 063/292] ASoC: codecs: es8326: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:22:19 +0000
X-ClientProxiedBy: TYCP286CA0043.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB12802:EE_
X-MS-Office365-Filtering-Correlation-Id: 9533e699-3347-4448-88aa-08de20b86040
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?J4xSD6SkAyipvvWfrR3uPHMGSoqlkuBLneORIIWvkSQF2yf/a4cLr3UrhOTq?=
 =?us-ascii?Q?KTPa4b88I4uxJz/AHEZhecXSVF8ijkuE+Wif21vH/bqICZJfbEsCZmoNam84?=
 =?us-ascii?Q?c/WHY9WG0+dJfdP73zV9w2QDQmIZulXjCHvDTXYA/6ESGdy6Ca6y+OYhDVxz?=
 =?us-ascii?Q?BksGdOFkVtZucg+8gloZGjplSd3AJ1DBTAzO3r8oPHL9crRRIyuB3XaNMJcK?=
 =?us-ascii?Q?i+UZb1vQolJwovn1Ha/9ebXwxUc+xHfIre/WFlaIiIWOuHkUCrzCxHvx30Fe?=
 =?us-ascii?Q?rzhaThys7dt+44pwIsV6ifBO/E7aVhHgqCgLc1cUH3y77oUXlXQxTOTr5DJL?=
 =?us-ascii?Q?v2d4u8N9h/YB8Rb5ER4zRZd4IueZ/Ez6/fM3g8Je0Eusy66s0EYx7aTA+2YO?=
 =?us-ascii?Q?aucLosRjiTFydGpBmfn5OkzhV23p4WVPIb8Qzo5a9IgOYkZIHQGvjqYY7aqE?=
 =?us-ascii?Q?x3EtjeiwNFOQWQBQ+ycg7hLMfeCUG+/ewy9CXjW0tP/yTedSxBT7kni3+rEP?=
 =?us-ascii?Q?DZ9rFWmnqj26v69wkvK1D3FMXyqZ7LEYx/e/R69GsfBlhm8vi0mcU6gxcINd?=
 =?us-ascii?Q?BTeTLt5s/6l69+Jg6GO0o+Bd0g3OC8lTVYK5p4UbAIfaY2Vz0B48sRvJwdw3?=
 =?us-ascii?Q?gJQJe34gI+tMpeGipTu+GJSuuo3Lo0HC32lLEg1jTtvPPHqB9dkKjELZ5avq?=
 =?us-ascii?Q?Whe+yFB1w4YjSYdvOaLNRrHQFQJYdfEnG95Z5Crwhc3JVL9FnFCEqkjlMMB8?=
 =?us-ascii?Q?MytFzG5bcwHyy0Ht60Uo0k2EFHjIJjihprGMqWzgmvFTc+AnFD2eQStA9mDO?=
 =?us-ascii?Q?Oo3o/pmlESx2hZVtCQYijuKLCvcfM6SJLDAdctit9Nd5QP4c86uzb2xpfJAT?=
 =?us-ascii?Q?tVbncWOgaq/bYbSKYBDIzuUq8Ql8paiX3lqhvy0M2VVjQr0ugkNN94+sPyaK?=
 =?us-ascii?Q?x/9DejVTUDJyUYNX5bcuTeYz8lDzKlch92B99jzzDB3ZtAIMp4ktuhZJcEG5?=
 =?us-ascii?Q?HSI68P8KFmwy9UVkZTDYvdAbRJTd5laKyVAVxyYneoOQ/6FLA9fLC0Z/Da0k?=
 =?us-ascii?Q?T6cp98xQZsP5+5XVZqUTXl95zjk1Tfc58Z9KY3oM06JoXfMZHDuiOC7FvwDJ?=
 =?us-ascii?Q?S8xIux12/57N1a9GCBPHW0/Djj9AqcWA51EKZ169KbYLyhst4Icgm3XQcri/?=
 =?us-ascii?Q?LvWd4ZoxcljTw3eZ6df08CFlclcmUediEOexPAxqt6vcY0tX+upMat20HDTI?=
 =?us-ascii?Q?JlHBzgaqhGXVpEUsRTAKyjPdNNfudEihl3FI0kw7kk4YWP/NJEpLTooUwHTp?=
 =?us-ascii?Q?/oetp6EYXLvto5FWWXxM/xtSDFYcjqJ9d6pCqDpa6kvmjNbSm3OLNmzFkh0Z?=
 =?us-ascii?Q?IOsvKbv/qE/rsDA3h9uT+em0F4F6xf904V5JmIX2FAr35kbiLTC9cfFd0vfR?=
 =?us-ascii?Q?w8AM/qohGI86IAgVOf+sHjaLxjgoa4UZgZ6iri2MOqJ3ql+ypk5ErNosmM8S?=
 =?us-ascii?Q?0egNS9E9sqstqUrm78HyKimZL31HKPmoDzD4?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rlHbcJMBMpocLnT/ov4lK9rHbpc7JHZArqauMOpVviPAjw34E773zBaZGUb4?=
 =?us-ascii?Q?d7iAAPypDCBNCbKPYApcBpYnZ5DXMYnfIgnKCA+KTFgK8ELcjtfxE9e6OZSu?=
 =?us-ascii?Q?hHUKYhP1VzYDTadhb+o7Bk7xsPk1eroYuBRjHFtZFFim+DD7TxuyGTpnqeox?=
 =?us-ascii?Q?DFBznxqrDS+w9W2zELJ0ydZARCJamHLFoDZbLHeCzE3/LuoroxCwyvHxo12d?=
 =?us-ascii?Q?Y9j+BmHOIbSjIi9Sb9Dxp+BSBiIoeaWhdwLc6itnVyZfi8jbakvCVhbaHGVc?=
 =?us-ascii?Q?Iz2cCqkTZcxZTynoZchSft/WSgK/COqOxQKWwwwQ7zd2VcYtNKkFgorSVFJ2?=
 =?us-ascii?Q?UM/bRKadYIYkKzagVR780GZHGwpVMSC/htSfy60Nl8fe2ovpcQGaZnkRMmL0?=
 =?us-ascii?Q?8nc81qmd3kwKYwfXZiywYT+STPnKgYLZ7gShNxhPrKzCt0TKvCSFUfu7uN6u?=
 =?us-ascii?Q?MV764HUvKSw15+GwO9E14tJ10OiElQQYmE+XJCvm/ASwd8yL9eYa7HTH67+0?=
 =?us-ascii?Q?rHriCRLUgwQTDESTCjzZIxS48GQI9u9s7HO/gvf2GDq3m5EDdREAdvK+JLHU?=
 =?us-ascii?Q?PlYk6Bal9ibhSXol6QoaNGoOIti1qc3CmGgHecIpyKHo3Rsq1z8BMYTez6wE?=
 =?us-ascii?Q?KyuduOx+Cf4sMjr5N3Vyr9LM5f9okVzPailus/HbSjHT+TFi/pFDw/v0SrFS?=
 =?us-ascii?Q?0l1AIfjp6sy1AOXS807K2b0+FcRZAjHkhvJ2NF/zqg2AbyAyF5om6nFQTEuA?=
 =?us-ascii?Q?9mcDWkmhe17R81CYB6xPnSqb0c6/8ms8o77RjFm6ymUqHa38AyCJWyFxSfMc?=
 =?us-ascii?Q?XHnKRTUsD/qUNgfRv1pl++AmXUmgqwVVd8toK79//fnDZjzmBfU+mnU34lEq?=
 =?us-ascii?Q?FdwV6CrTZ/Clbu7wSdWDN/kBhOZlG1hPMUL3y+07Z4FckEHQXnbhMRBudY8u?=
 =?us-ascii?Q?tPbo2QKKH4lrfRKBN8VBjm01uI1x7PG9y9aepUwvqqOJlzWsSy/LrUia71mx?=
 =?us-ascii?Q?TAnUCd6B/HUEoYOU3SrWVgXrFYJ7QmBDmY9nHjjS//NxhpF4NpP/rlGTpNid?=
 =?us-ascii?Q?dcToJCXmiREDMIh8wf6GqqnVNqyj7eRYUunWIao9+YRGQgJnubJhTvXbJ4fy?=
 =?us-ascii?Q?5dRFftN3DLo7IVtL94mlhrfHMxllxA3qw/r2twUuFfuu6LY61ZWjdEHBW0FD?=
 =?us-ascii?Q?ZvAIYsnhINuxK2lF4nJa+cy/Khb9zbbHk0109iPSIXhObQrkssG8/7pIfa0z?=
 =?us-ascii?Q?SWtHbhUrp2Bh7z//38QEPoCLznOTPxvE7E9Qfr+Vvx/1JZsgN02wkeY86hD+?=
 =?us-ascii?Q?DgcGygB359AvRUEBeAbmB1SJPSj5tU1a2gFtkXzThsOf3bj9ZMhDTGKl6Ktr?=
 =?us-ascii?Q?AO20urgJrrSbhMh+0jCUXuSeM2uvzR2FhuR03kENDbORCcMKH1yshbdM5YBr?=
 =?us-ascii?Q?vv0uAZ1MsaOCdO5PtnEagc1rSNzvaaf7xTbvPQCWf3PK54vC5Gjw8ZD8wTeq?=
 =?us-ascii?Q?L2ped5/iQXT//qQ34lq2MXKENQ+0GfWEhVx0LUHoGjqC9GNGtkI2IdA7LmZs?=
 =?us-ascii?Q?p1ze0T31/pVu7E/JbXTTe4TDyOEEI1pLhdB87f/Hb+Ub3ASIT/lzFpgkJO3k?=
 =?us-ascii?Q?KMq3Wj6LEkdiZLkAinV+k44=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9533e699-3347-4448-88aa-08de20b86040
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:22:19.5464
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NwuyONkrpkS2PbT9zAAAocfk8kRAtpSp6J6rnin72PoFEYodY9Pd7BI4iEbU7c6QDODPpwrUlJFi58kk1yAHrKnU1R5a0/YH2kNOvn/HBT3UYDi4oOHJ28xGn2tItalC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB12802

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
 sound/soc/codecs/es8326.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index f3b25220141b5..05b13661c38cd 100644
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -737,7 +737,7 @@ static struct snd_soc_dai_driver es8326_dai = {
 
 static void es8326_enable_micbias(struct snd_soc_component *component)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 
 	snd_soc_dapm_mutex_lock(dapm);
 	snd_soc_dapm_force_enable_pin_unlocked(dapm, "MICBIAS1");
@@ -748,7 +748,7 @@ static void es8326_enable_micbias(struct snd_soc_component *component)
 
 static void es8326_disable_micbias(struct snd_soc_component *component)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 
 	snd_soc_dapm_mutex_lock(dapm);
 	snd_soc_dapm_disable_pin_unlocked(dapm, "MICBIAS1");
-- 
2.43.0

