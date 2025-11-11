Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010052.outbound.protection.outlook.com [52.101.229.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3A51624DF
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820526; cv=fail; b=c7fcD2uNdT7X/FMC+0mzfGhkWtG6kFBrNFOKUS8+SvzPWC/MIWVHfsoZHFPp0KCrK9C7gEt5vWtXQFvCOsxid+rmdd2x2XS9MyR6z6YweQWPoRHhc5WH1IOX9RK21eRQ4f2vJzlmvNdlXW/iZI6wzakxS9U5ZAG3f/A9T8Ja6fc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820526; c=relaxed/simple;
	bh=SKvwhJeu5ecFr9T2Nmn7lEj2pEPEuxwB52nQmSF73zE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Xryzp4lIIt2bE2LN+wzDmbYMp8PPkQNpwbPHxZAR4cheDvabaWjQbjNL0nAXC39V7DYkV6VxJ0yy0s+LzEBs9MqkuhZEDGHyYYhJJr/75zbWpCfIViRf5gV+/G8cbaYzQUJR6yIZwkHAOBoqhKnrbVf3Of1ao62zuGCsJWkuvSg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Han/00Yz; arc=fail smtp.client-ip=52.101.229.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Han/00Yz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PAi36AVkPwkEoR70f4SQkSnOu0DX6mj92aXr9KLvqXldTChuyWX3YrCzYe7h4O70VoFTELOohyx4CEgfuzxbRm5hnMfo6CijAn/Co8KH0/CupKF9Bm/SLA/ZxJ6Oy5y0DyXXqoNkraMaO8lUvjq9I3chWP8XSstR1Kkxy6YDK2RjhgC30ZiieSu+ElAJ3w9i3d8TEnKHHhoyez4Y6B026J5UNwike4YxUEM7OjZwCjRyDUGoqZWIL8lYC4Kdrgf9etAh3A90jenzuN//3pMyUWS4+5/h8Y/hARlBmY2W2z2R2sYR0LJZWYnFzyhXNz1uIEgmSBBYoetzS55H/1y5Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DMjP1Y6SHTyWHkUDn7o1akHmLtHDlrlfX7Bq+Y3ygjo=;
 b=usPWWdM2qZu4w4fs2sMY+fmQlt14UDuIPcWDYySqm4R1sh2ssr1273SJxVQSvw9FONT7fn8hpO/2EBKndq3a+MdLcuB+T8Lvf7LcDKZSr0lQXcPcqfAMfeiTJ9vWOYe0SfV93b+s1Klp3i1h0IhH5kzkbHystzudGGvCebZTkOzCFSLrBGZ1kYo5Uc8RAm7Ou/1DjeY7fnz1VjtpWUdOAEneCwjF12tGHQcPrp4SfOGludOWTeuEXbSD07umo3LaW8zMzZ/80bmeo5VdhzLgdFQDRMyqjmTTjzCX8BGIKF+luRFCF3fPHwKWS0VEkDlVNgEYzZr3AKLVISqSmNSgMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DMjP1Y6SHTyWHkUDn7o1akHmLtHDlrlfX7Bq+Y3ygjo=;
 b=Han/00Yzla+g9WTPI19Rw8M1/d0GGU7X0OzcnD/2ypz3agU6RkUauQU112O39TAXwCDuBWU5VEQHei5ilzO4H61/+ucHC6ACa6xT557x1/LKPF960IQgLaBFumFP30EqH5iQ9IALNvWuVt4MePZ3MxodXJGRLQO6u1j6mHGRa0E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB12802.jpnprd01.prod.outlook.com
 (2603:1096:604:33d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:22:02 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:22:02 +0000
Message-ID: <87zf8t5sgm.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 058/292] ASoC: codecs: da732x: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:22:02 +0000
X-ClientProxiedBy: TY4P301CA0083.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36f::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB12802:EE_
X-MS-Office365-Filtering-Correlation-Id: ede43496-53ea-4e7a-2bf8-08de20b855e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sj4iOhpOGtz7kGgMjZ5wD5FwoIjFTlXY3TaHF+/BUi+bbhDbF7kcPCFBSECG?=
 =?us-ascii?Q?hCWf4VT2sFN3dcwMjLnUpBRcsrExWE+0WE4OL5YRNYJJUuOCK3U+Nh6sa3fs?=
 =?us-ascii?Q?7tGVStcZ0QL6dKuCNsh8oW3/+Vss1KH9cxSNF+tSr7IJwO6M3zAzT3/IAVCW?=
 =?us-ascii?Q?+qLV954EK/AYNpZ4zdgKfbWVIdA0CWDIzFiSM+zfKcnopaJ6eMGH50B8mwNN?=
 =?us-ascii?Q?KmAY7I2IueaJnuGCFr9dxQyHaXIt6UPVmZUwxZxZSlxHzJ6R5X8sw0f+c+kv?=
 =?us-ascii?Q?unPqq+tE/G+RJcXeOyviGenjp/kgCHlzRuqWXq02zioWBZdqTIg7zx4RvI6W?=
 =?us-ascii?Q?NLA/s1RdkxTafRWoQ7z3SNoscgiNCWuIMiQpxZqf8L7PJ9z5yd8LNSNVTGyv?=
 =?us-ascii?Q?RIIuGESSSP/I5ewQtEidyt2ieAIxhGrtHodKVtdZKOI634QQN6d1lqEken4c?=
 =?us-ascii?Q?vDKwopyYVbyE/yLcKnrtAXrtfohKJkTnwziqJV2Gglt6J73/gVOW8THlWO3n?=
 =?us-ascii?Q?9RuCBQ3aqyKGfgC/kzshWFovl9nD4tN6oFX0dD571yG4YdLRTfuY7HKQFWUq?=
 =?us-ascii?Q?L7a9f8NpGkmPkaPYJJ0dzbFPb9R1yICxQ9aqJedJ5smcYIrKZXcDBLSb9E1i?=
 =?us-ascii?Q?apa/e23pvy1CaBjnciw0B9bxihmKTFHV2zu+2WuOdTGtlGTEaUSizEtJOM8o?=
 =?us-ascii?Q?I5hfCxnNz1b6FKV0JQYoi2trvXS5ESuNBO7KSFgEdZEsKXCK1OzmqH4Md0Oe?=
 =?us-ascii?Q?QgRBGdvdfScie5dgN/ky6DBNM1SWySfEIQMCLvq7LAbbnLTuuh74FGHWbm48?=
 =?us-ascii?Q?u68pNmSy2ynInnQrQ3ycu48ktFchziJbfXa8HHMoxYKFAfAGb9kd0m6AeVPy?=
 =?us-ascii?Q?w2Xfyo0SwP724gmPV+VjOCU0afxv5pKeFl97UHcEZavRd1J82kWVQFNFD+32?=
 =?us-ascii?Q?YxMZ/i2AN4iXbHFQG6LlmmAu5Ymut4Zuf7lnN2iDlon/b/0xL9nk/5t4m2cW?=
 =?us-ascii?Q?YbG4O/D3JJG+pHx1Hf3R05wkPSBXT0IAWfPJhDd+ui2Kx/vjhRzOlIlmApOU?=
 =?us-ascii?Q?mKfUO241Ro66B/gmYlksm0YYxPmFtJFzKy73Sb7yUHy3F7u2Fl/x7bjfNmvj?=
 =?us-ascii?Q?M1qDsiZQvYZmwDvIRZi6arBVG6H9eeyjUhbyQOJdwHgwwxrpceNeBhHosUAz?=
 =?us-ascii?Q?F/qYLOez5/gv6YDBSayPO620WxfA/1oMKKUwm7jCM14SIpJ20YQ4e0DLPp0K?=
 =?us-ascii?Q?FLhNK3wM0F5TVuFn/qKOcbaGEvgrt3ZyM8VldAnlVJBlhD1HUTjtmK7WOyxv?=
 =?us-ascii?Q?YqBJaqtg3NPLfaRX69QxBT7fwQbXP6Zd1sI9KzjHy/LStbsJ1vYF548r4kmd?=
 =?us-ascii?Q?seVEw2znRuqfUArolZiWBkQVqmhd72QFd3F0kKggW42RBamSsgh/vvuNEae+?=
 =?us-ascii?Q?//m1UiXKrnR+pqsly8VCpzWJSAwPpQUKNX8B+a6pXU3k20KdhWBQfO/vHI6w?=
 =?us-ascii?Q?wME1AaV85CvjhXpLcX/iabnmBraIwVpsBRPk?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WCdR037x00urVkc3NGOwSkhwqzkhrb1Aj2cK1e3Tkah55MkuoIsYI01BQvZC?=
 =?us-ascii?Q?IySv97PgYeLF/M9/DPDypUxSaXGQFXDniFYmNWepHJnNmeGAHbZR2GQcSQUW?=
 =?us-ascii?Q?tieknhpbMSxRALNcWkLxzI4r+EDkPbm5fkTwAHuY8nPC947Tel1fYNWVLecL?=
 =?us-ascii?Q?o2fR/YFB5T9L40YAxmWY61mZHCS8nYTaSSgGwNli84OmBbh8y/Iebk9AcMAj?=
 =?us-ascii?Q?Bl33KiknuToM481ZKDHZJxfX1HX/OH9wq9Ml+9xMoKnWY7Fu1rDgZ6AqdgEF?=
 =?us-ascii?Q?pcxek2LFnnmwqs9QW+kGNbaaEIAEQgayN6mDPGt1Pwkh36OZeaMCkaVhP8OF?=
 =?us-ascii?Q?ytoq4bIfO70Y4lYfktNIEyjYC+sJuv99Js1CO8kBdsyRBCjRfJZh/o6aagSF?=
 =?us-ascii?Q?hf7KIAcBH74Hf5tYBP0qQ944oK0/TzvwnBeK2U2hCzQMy3vk4uqY/gjCU5GE?=
 =?us-ascii?Q?xI721rzvPSqB2d8V3ytIUApHRe275urikXp6s1v0b9E6PVFTX6mZw6E83woi?=
 =?us-ascii?Q?ksPgBFO1Z31cretil/bq9iFnQU/WPMshuRSp96e4EEP6F7vgMFBDa82SZpss?=
 =?us-ascii?Q?o1KyblW8mcqi4Ont1txuLaMWFgVQBH+S7Rhoz2Zl/EHr3ecgzk5B2pa1TCH4?=
 =?us-ascii?Q?kwcL5gAJ+GJ90T8fryNMN48xl/2Xdh+DDBqPIpgLIbA4FMia6Dl3ez4Oe0V8?=
 =?us-ascii?Q?cgjR6/0PEG8hGYWzpIkVDYkYN0/KuXJ9WuImRnRam+T9WF+ZVDJWb5YBQmXl?=
 =?us-ascii?Q?YMY85KAe02Au0k/om46JRSld3pIXSCGc26euSxVEzToRYMmH2tbWk2uMhpbi?=
 =?us-ascii?Q?mMHjj9OgTjs5M8n374r+qMoVQaY9iW8kFYrM0sCfIbXeq7OaCd6XKTAaP60u?=
 =?us-ascii?Q?f3Pth9p82O+zJDSI/YL/J5BRPFWkVwqVt5ss2X8weOqgvvjW44uQuNlHuaIT?=
 =?us-ascii?Q?7PTDT/xV8cUeyy3Ebvu8/TlDtKld2icm/FODK8DpoVfLzWntVCl50x6wh61V?=
 =?us-ascii?Q?w//pYKI2m4B1jpmyHq1VbRzHcnCYvB7rPOEkYc1q2J6nQWA47XU+qzi1GH5J?=
 =?us-ascii?Q?Sh6yXA2HHC2j+CuI1NgIzvrLWX6JvERWMMO+6+52H3qdFcn+HXlld3rqX+Be?=
 =?us-ascii?Q?ulvYLHGgYidvInzn3ETpbeCk6h4USrT7nisj0R0Rxphn390qjFgVrWL6mWX4?=
 =?us-ascii?Q?kEYRV6wU0XVioEoDAKOIN20TIrHn/XjrwcM7rtwD16NspoHI0PzJW7sYmyPM?=
 =?us-ascii?Q?1qlUfyDnb87ms2R+wbwUSiNY3+zOlUnLseRqxvIj02kUHaerV6opaFl+JfKH?=
 =?us-ascii?Q?r580Qii4pE59mzfong1snVVi2vgZm7waTxnx/CnGhPC97nPUmoKTD8V/f0Yp?=
 =?us-ascii?Q?8y/1h029Cp8dQjKOgXD2CIb11GNDo5CFzqz7gGaI9AI9v0zU5mb06uZUjHfS?=
 =?us-ascii?Q?HXpA6GYe4Rhtjo0VHUg3OOilOuRBaoEEpFOTP11+o6afi30kS6saIxitGoxd?=
 =?us-ascii?Q?dALATdcG2vyDYr4oATpqBuBliqtUvSTQHw+u4B+QtK9y9/qAj3bBwtB55f03?=
 =?us-ascii?Q?3TmY8vnAL5dWS5OQDYN52tAIeda6dhAxJkmC/LotLTBnKQpTJSPOlQC80d/Y?=
 =?us-ascii?Q?chz31B1iVdltqIMEACzub9Q=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ede43496-53ea-4e7a-2bf8-08de20b855e9
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:22:02.1830
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uT3AfXQPoDGKqbdEawppaYNKBKMCo27dUjdn9PfvVXWXYRvbRzHEumYhA24IppuBz4atn2nclEUMsLG18muAl99KlAS0rD4paErPIqT502ikXr1dgn2Bjz+fUqutoWz2
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
 sound/soc/codecs/da732x.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/da732x.c b/sound/soc/codecs/da732x.c
index 8ff308ba73846..140e449d3ef4d 100644
--- a/sound/soc/codecs/da732x.c
+++ b/sound/soc/codecs/da732x.c
@@ -1408,6 +1408,7 @@ static int da732x_set_bias_level(struct snd_soc_component *component,
 				 enum snd_soc_bias_level level)
 {
 	struct da732x_priv *da732x = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 
 	switch (level) {
 	case SND_SOC_BIAS_ON:
@@ -1418,7 +1419,7 @@ static int da732x_set_bias_level(struct snd_soc_component *component,
 	case SND_SOC_BIAS_PREPARE:
 		break;
 	case SND_SOC_BIAS_STANDBY:
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF) {
 			/* Init Codec */
 			snd_soc_component_write(component, DA732X_REG_REF1,
 				      DA732X_VMID_FASTCHG);
-- 
2.43.0

