Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010057.outbound.protection.outlook.com [52.101.228.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846451A2545
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820712; cv=fail; b=bFic+/gcwuy0rPpsbQGpp5AxblJva2badaS2J0lmJIjtzWAcebnLEeYvRC20g3auIo1zZQg8s0RKFWsni+13SBFkxK0lyBid359JRgAHLm/2/nnj56oLaj7pHhPmdF8Cr0E+6llYgn7FUO6OYgubc5XeXHxik98CLTyolQSjM1g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820712; c=relaxed/simple;
	bh=BhV0JwPaB+EQSUhFGsQzN14tymM7TgjA9YSHGBq521A=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=JvlX1gBBhanGvCZSKrQ3NsDFpQdXaUkDbBAK5JqVhLR2uQRbtdvGdqjB5//ir9RBqOW1ksoFRMyfkvl8Kb4T58N+fgq4W9yqdNQPrhOsWJBJfjC2ODXRmv8xF3hdI8ha+I35hNLdN4zvFD+OF1ptWHg70C0rnZ8keZwILq+El6g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=IKGwnylE; arc=fail smtp.client-ip=52.101.228.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="IKGwnylE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k5FWBpIggbJUW0hDTHM8TTbs1rukdllhfFMwhl+OoDqNtFyJCHleVemo3gaBeglmoJo23bqTIkhRFyT2MlnmjEgei5MJdg9Vc7bNy+3GDYY7Jj0jF/yMelXSRTgRDWTlyoHcKtuDnapA5Yua2/azLGdouAhOnCqSpcK6/A1YZZR2g/Uq4jvKW7+KINs+Xseiz2bDF32MScxGD+X7kocMSIMyD+AVHR+17veCa6s8Ocp6A8l9W3XZt2YyHss15ZFq0jyR2frpxwfW9C8F/RkZKrXEbD0WRGHOoLbYKjYindBxXpIy7MQuc4zALVrhIS0jLGnW4+sGOzJCzm/560IP6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qiV9JAzyE7ru5EF6RxuI8ig6D2jzUXQeDn2HWjXjVog=;
 b=jj2nF2V3RXfrshkAv7uZzJS2fKTmmyi5tGwYv+bmcbYZjcrMfceXPTOHhas6UMCRAmPNTgsuONrnFJAsTYyLLfJHZg/eCLkVvryKhPK5Ek+mfHkglHnxgbsQ5bwoMgUGSvEnRl8qj6su0/HGdrndA+RxmX7cb+gO4+/KAcyac8g3knlvqyH0NatwYw34rLrEDM0xRjwdlPNLD22373t+DkPBOLZyDwqdB0Fnhez3ew+dHCTA4/T3J9H22JQcrBuGQL7cpiZMLGDTiv7bjBbcSLgXA/nS9vIIEmWBLinkf3yuWUyL4siqTcolx7PcDlregdFBx7tOFOmRDkqVli4SkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qiV9JAzyE7ru5EF6RxuI8ig6D2jzUXQeDn2HWjXjVog=;
 b=IKGwnylEfWJqh9TK/bmKPBnik9hIj5+0A9k7cDVuwN0K8uVE4uW8LOBLyh56Tz7RsppRo8PT974oS8caXqLMtVEw1s/VJC6y4jzIPf83dfoLS+Lo24NB//88HXwdG4Z07f0ClqKtbYNCtYB6MZBzgnhzBHMGFuse2f25vu+GilE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB16440.jpnprd01.prod.outlook.com
 (2603:1096:405:147::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.11; Tue, 11 Nov
 2025 00:25:07 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:25:06 +0000
Message-ID: <87y0od2z6l.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 109/292] ASoC: codecs: rt5651: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:25:06 +0000
X-ClientProxiedBy: TYCP286CA0142.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB16440:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e5e91c6-1af1-49ff-52bd-08de20b8c40d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6ssgi+rI7m3u1jkl5Anrhoi12SsOMEiic/bSkn2p+BsvWbXXF5bXaBjdhL3b?=
 =?us-ascii?Q?SnKrFwwf/oiYLqenWlu9J3JezK/daPmh8y5jyQgRNAJB0BSIqmhJBdy/EVE2?=
 =?us-ascii?Q?f1TpamrBOhrRIwMn+h3HlObyNTYl2z/5aaiXHO2eJR+N2u6n7xaSxPFS/3kQ?=
 =?us-ascii?Q?FVP692QOgwPPbcBbS9FmUPk9Qfd+VuaVGlS4O5KBE5+bU0woD/eYvaLcv/AD?=
 =?us-ascii?Q?5Ca+mqkNT72JLIe0yNzOUkJueRSpCZffhhcBqqX7H5cXJJU5tYFjwZD5NNJu?=
 =?us-ascii?Q?SN/qcOF2e7qAOlSeYA8pllEJCv01Wgv48bC/B6d38jOjtmPdWy0PnzVke9EA?=
 =?us-ascii?Q?2fLC4PIkR2It3Vh4Wiqm+15G0Wn+sbMqPc7lMUlDhUMzRLpT0E3a4K/aif5z?=
 =?us-ascii?Q?EXiYR9soQDdT6lnzZvZgw8MS6i4WhPpLj18s93giWEE3gQelYJxzWimDh7P4?=
 =?us-ascii?Q?bONGlajKhVdgesAj8rZNzrcJ3ijTVQc+/87CTaIDXt3RP8gAlx5jrE39Ey5j?=
 =?us-ascii?Q?RbSEgDpcyEhiYt2APZH1THmbdzq4oJsuan2DsFsw4cvVBT9RhTeUxC9DxmQH?=
 =?us-ascii?Q?Msbj+fwxYufD3C5NtAnzylg/kvr4vU4bdd3MGCMDaWqKSc7F7c5UVqLHo8kE?=
 =?us-ascii?Q?2nqF3PkAXUWPjBSauUWX1IkXYJir9PY9rAI4/0m7zxarx/H9DfC45agKACsN?=
 =?us-ascii?Q?axVQc0vzqiKj8TZup05Z6sfBUnc/MCJLZ5eN/mEQhA+k/+Z3ie6itzP04jea?=
 =?us-ascii?Q?oWrZ7EQnNged7SW/mTCJbfTwDmXk6PxPQXGQvoMqRXy6ukxAESLFhEKkB79d?=
 =?us-ascii?Q?o7NTV75oT54R95tctMzU8P7kgQWBKIyD7zHcibJFbxCmEiLZQOHED7dB2vIX?=
 =?us-ascii?Q?IBrR1kDINtsiFmxxjhqxmtsMXTHi4FiK60RS/dqM9M1zVVfj4jZ2VR0z7YuQ?=
 =?us-ascii?Q?Skt5sK9tcW316iCLz6MBTRH/7WbKPWgypL76QtiyXS78llxdaDaF2oc8EI7j?=
 =?us-ascii?Q?eOhU5RCh3TKtIv2IyTE21tRu9iBT5Gmpnc2VEmz6vG5fCEOQLKW4dRpfoAPu?=
 =?us-ascii?Q?HK2c5d6uWRqo8MID5I88L3JeS9GwL1SlKguzdEXGVv8fPdhufy7elwAubiak?=
 =?us-ascii?Q?+b7wv0SbSXgbGWv38eZ7r7Wmk4TKGo52mrCXgsKTC7c76kRTUuE+L76Y+V6z?=
 =?us-ascii?Q?l8mBoUGKwPVHMRccEqZVeSOpKPUHMe41k0hvDZ+cnaUANl9pt5mlmYNbAD5V?=
 =?us-ascii?Q?m8vNbrmKehiBXv0OLcWx/MB2v4Cz0/D+BkXARPJW0IYLzZ9zYx13CNiN7vFK?=
 =?us-ascii?Q?gOLxhx0b/iU8AoSE6PrFlfXETFOTeTpkBu2meEJy4cWuTT6lzS50tlaeVzS5?=
 =?us-ascii?Q?oxgQD1oSuEtA5krZyj0fTO2KUYvoBdiup82FpTZc/BJbkcEoUsGBGv5EAgef?=
 =?us-ascii?Q?1wf0Yohi4B+PBJQ10Sh9Mi3BmaAPsBScilMY+4DaoI28OzitkH27VW02APVA?=
 =?us-ascii?Q?FVPnEU9jq/c0UN/Ihk0ocZbeSMpBb/j7EIvR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KmbC/lDPHZxD8uwmUeYdC2o1Lyf8g4HN3JIKBo+8aHR1/h3mpWXXHJrgbdX3?=
 =?us-ascii?Q?xwVl6hxUEtwrrJMmrpjqG7wRe68LaXOWJ3nI2vbvJXDsW3VcoYefJ3W4uLhJ?=
 =?us-ascii?Q?gFmGTYlaEIg3CdrUc4LnPJ/d2dvbJNvOW4kgZH/SabcEzYyKbtu3kGjGufZ2?=
 =?us-ascii?Q?3rQcsHWYINC//U4xIT3/S5aOURO+a2FufrJ/vBf7up3gAvLobVkKUQfJgJ5y?=
 =?us-ascii?Q?QgzO5wIcpSAbHH6PHD3f4BCI3t44RtYvoaVmk0gK52nuHsLWbhD1XHm7HjXh?=
 =?us-ascii?Q?LasPFppGqBxw17D9Rq5aUMyIDbv7RPSAv8TAJ9vFaOa5VtlcmQEQu1p1W+qR?=
 =?us-ascii?Q?16+q9579DSjv+mKKO4r0w7HCMdIaWnfwilp7McnNugl+PYMI5uZeLiwkV8GC?=
 =?us-ascii?Q?0heGWWl7ARd0Hv8RpzvD8hKE3P6RJVLN8MzZ0qDCm/3hWvKBZSrz3Io0b8gk?=
 =?us-ascii?Q?aWhSZ3ww1xq2NFASF5UosppTREj8mLNmmUi9O/rhohbZdsZf5h2yZAwa1jGU?=
 =?us-ascii?Q?B/ZrFUZ0wV/SLKFA2u3YjirwvEIAM+DPgb13AIb8a+mdTEzYXscEKjhk1Ncb?=
 =?us-ascii?Q?36UsZDPzRBrvbY4VWc7siM1/q/60cC5D0wQ9NvN2rdbZjPmo31vNFltX7qiL?=
 =?us-ascii?Q?tGRuwxx+zjkQZGpZvwb86q32IXGJ41VZWKIEv+Pu4UCgsnRKJGyGAMdWWxjs?=
 =?us-ascii?Q?ena04doeMoQySfCrpzny28S1Wef/pGafpzkSbpkM8i32IGPBFhQA1KoAzFNM?=
 =?us-ascii?Q?MghN0ZhtPwcs2LOcz4ESzTQpm3iaZmStb5bFLZMj2PzRtarQId1Ma/u0xxiu?=
 =?us-ascii?Q?jFrHSDAJJC4UD8PwZMEpLqg9on+oCVgo6tcE9KvI6jKPCWuPYGSKxNUOdiRt?=
 =?us-ascii?Q?O2JJ5hDyvj101NNKwOqXlT+nZULHaiQE629f6Me9m1Vfgv+H/veobGPr2Eba?=
 =?us-ascii?Q?4rASjZKYP4dXUdO2vvlree+yX35fbPoclDzgmVHsLvXU7QAf5TrMHUpIiJY1?=
 =?us-ascii?Q?3qBshU+IF5mYb0PEq1snG5rhVYB7pwNhi8W8qqgBPkZC182IQANAdBTVtgkW?=
 =?us-ascii?Q?cuRrFFmY5x1ynG9qAJshJATRdIJy2nsXHcVuwpx8XV4nP48debDaPozFQh+8?=
 =?us-ascii?Q?e5drbeV5PHSeGvj67QHfYn4IWziu4359NTnZtzcXl7+QMzI4CHlc7CKYmsCZ?=
 =?us-ascii?Q?RmPM/6iWHwidEUmLd/vp/Uk+KS4KjTzQ09NFKHSITLzlaBIp7215FN/aLKmL?=
 =?us-ascii?Q?Zrvr1j1QxLQF/P/zMLpAerVjz3TlWxsVh0DiJsKZinbIZQ9VPjiAMGlt7uCw?=
 =?us-ascii?Q?00ET9X4iTVX/z2AFZAGVtKJkt5clVWyk10BEPVEheUEykPNLHpe+N1Ehj7Rk?=
 =?us-ascii?Q?fkIwGeY70f2owG5iwQRGHL1jo0uKfBbJ8oz8lI5vXn7yMsYWOzAHhnlBG5+x?=
 =?us-ascii?Q?5iBUJzRSO+NocAsDzzYbmhR55/TYZubKkBuom0aWZJ1fUaGNPWVpB2CSnZlY?=
 =?us-ascii?Q?pOwAh1c3zK9Ds+a3KPA1DiuIy4RM9PHlWt4MdfR7VuMzngfoDDcwUxef466j?=
 =?us-ascii?Q?aII4U01B0kjPayVFUWfSglhHkBNfUBxLmpN9KizaPxHMMjzNwiLzh/RW468z?=
 =?us-ascii?Q?CSmupHHxJ/2l2bS7/q4Byr0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e5e91c6-1af1-49ff-52bd-08de20b8c40d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:25:06.9387
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yFyObNoyVqFbLj1rovK70vLbtZVhDqs2V6xE7I2YL56obbnNaeRKRuCwo3RB3Du69i2r0iU+/b412EyWDj+UMdolTtBtzafB8vZ839+i2Jl+eIbyHw1FzD3TSz2B5Jg1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB16440

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
 sound/soc/codecs/rt5651.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/rt5651.c b/sound/soc/codecs/rt5651.c
index 9eeeba8cd6ffc..9af65a38f0ee6 100644
--- a/sound/soc/codecs/rt5651.c
+++ b/sound/soc/codecs/rt5651.c
@@ -1511,16 +1511,18 @@ static int rt5651_set_dai_pll(struct snd_soc_dai *dai, int pll_id, int source,
 static int rt5651_set_bias_level(struct snd_soc_component *component,
 			enum snd_soc_bias_level level)
 {
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
+
 	switch (level) {
 	case SND_SOC_BIAS_PREPARE:
-		if (SND_SOC_BIAS_STANDBY == snd_soc_component_get_bias_level(component)) {
+		if (SND_SOC_BIAS_STANDBY == snd_soc_dapm_get_bias_level(dapm)) {
 			if (snd_soc_component_read(component, RT5651_PLL_MODE_1) & 0x9200)
 				snd_soc_component_update_bits(component, RT5651_D_MISC,
 						    0xc00, 0xc00);
 		}
 		break;
 	case SND_SOC_BIAS_STANDBY:
-		if (SND_SOC_BIAS_OFF == snd_soc_component_get_bias_level(component)) {
+		if (SND_SOC_BIAS_OFF == snd_soc_dapm_get_bias_level(dapm)) {
 			snd_soc_component_update_bits(component, RT5651_PWR_ANLG1,
 				RT5651_PWR_VREF1 | RT5651_PWR_MB |
 				RT5651_PWR_BG | RT5651_PWR_VREF2,
@@ -1557,7 +1559,7 @@ static int rt5651_set_bias_level(struct snd_soc_component *component,
 
 static void rt5651_enable_micbias1_for_ovcd(struct snd_soc_component *component)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 
 	snd_soc_dapm_mutex_lock(dapm);
 	snd_soc_dapm_force_enable_pin_unlocked(dapm, "LDO");
@@ -1570,7 +1572,7 @@ static void rt5651_enable_micbias1_for_ovcd(struct snd_soc_component *component)
 
 static void rt5651_disable_micbias1_for_ovcd(struct snd_soc_component *component)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 
 	snd_soc_dapm_mutex_lock(dapm);
 	snd_soc_dapm_disable_pin_unlocked(dapm, "Platform Clock");
@@ -2058,13 +2060,14 @@ static void rt5651_apply_properties(struct snd_soc_component *component)
 static int rt5651_probe(struct snd_soc_component *component)
 {
 	struct rt5651_priv *rt5651 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 
 	rt5651->component = component;
 
 	snd_soc_component_update_bits(component, RT5651_PWR_ANLG1,
 		RT5651_PWR_LDO_DVO_MASK, RT5651_PWR_LDO_DVO_1_2V);
 
-	snd_soc_component_force_bias_level(component, SND_SOC_BIAS_OFF);
+	snd_soc_dapm_force_bias_level(dapm, SND_SOC_BIAS_OFF);
 
 	rt5651_apply_properties(component);
 
-- 
2.43.0

