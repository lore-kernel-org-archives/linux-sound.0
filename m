Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010028.outbound.protection.outlook.com [52.101.228.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BC218FDBD
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820553; cv=fail; b=phzDKT6geQQZyHFI//LWBy+Wzhbw3xiJ1y/BY1ZTU4Ctm8Ar39JkOwseRb7KLdld6XSmcUlsRkDyRXGli7ezFrswsHomiN7LHvZlkzMA7ZrqgnIppSFiHYm4Q5y5PgGM+QruxqHJl0ztBfjoYQQf4UtKsPmcBGfNvbzjhTCMGkg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820553; c=relaxed/simple;
	bh=gEo086w6p070M64mhEYoiZvxojoOV3NQuX0cmFfSvxk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=fWQYYRpbydoDmMqDqviWujR+gyc3BmqL1AsuquCrMTrJeNTCuh7pSL1XS/anA+gCzw5u9PIkozBnCTb5ewgGPbYFrx39ZF4DPZ/vISJS4W9f1ZDMloRICOAacEVXEoqRh2gekwCqOllvO7JzG6s24jGQBIJ4pYnxCWJ0riufhGo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=nMq8vCg4; arc=fail smtp.client-ip=52.101.228.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="nMq8vCg4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QHYVWo+z8RIX6rVDpTQ7Cu4Su9IwILPQBOGUm9gwzQRGH0mdyGxBE8lZBtWZjD7+OZ0JekgwDOjzS9ev9r83KoklaBkzPtaEjokPuiNrOoHFOSXROhOic813pt30pO62DoCPaLXfIf1FJlWnqbMUVLEsGybeqEVCpVcMumsvop5JaQyNFJR1DTvJOlzsjk0ZERaR5cdzy7a428Buth/SKnxZfHeapwoLQ3ELh8AEA1gQFtb+247Ihyl/kVtbdn+ll5HIEhCOvmesQ2pW2VdXIcXIkczVXZazQiu4xk/h+pbL4etQA5c1FfYskhXsmIBW6JE/Jq2tgu91a8zFWdmcXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pF/DlHzoYFHx35SBr6/8XX6Ay8awvHy0Dz0nc2938Vk=;
 b=R8cKNwMmovyjpDfkAdbX4YyBej9mcAcyPSLlBnNuDaZxAltMAcESguKhIqe49+p79AvgH4zMazwKbdZr/a49qBRhkvOxJ0Q8jQn3KlpohO4ULE9BbgA7yptIZPZB5EUls0ETaG2T3iH/bT8w0bo9YNFCkl/cV1Me1RJ+o+KGr1K1CRinnyUhdzvEs3fQlbMZM3ZsFmhfKMnz5/Yn+/CE4XxK4DoQ12KeobzahfUMNIKRJ8PZHd2LqDb0y7joub/Xkxo3ZLy9XDPPmokwIDjeV3yO5cEw4Mj+300YKRJdWxTHWTFSP1UftPPNc1YfCyaF+2AB/OJZXT9WIEl7YMetSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pF/DlHzoYFHx35SBr6/8XX6Ay8awvHy0Dz0nc2938Vk=;
 b=nMq8vCg4hjPp7vzn77yu4Z5i4Wnqix3s4XZm0csPPki9X2h083j64GEEJWjxHDjCWwDUH6nuQIvBb5O4mpJgu06NwSOIx2LaLv7AIrOg+21gUcc6I0as3AaQI8aUvtUmU+ekCfHBPdMBdYVNES7tSE2DrHF6qyI9TwL3+3bZ9MU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB12802.jpnprd01.prod.outlook.com
 (2603:1096:604:33d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:22:30 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:22:29 +0000
Message-ID: <87o6p95sfu.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 066/292] ASoC: codecs: hda: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:22:29 +0000
X-ClientProxiedBy: TY4P301CA0089.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37a::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB12802:EE_
X-MS-Office365-Filtering-Correlation-Id: f43cdc66-2d8e-4aa5-96d0-08de20b8666b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zSOXQvlyMooUhLO5yp1tNDIBl5r5YxVus3T7qTOXWQ4T+581jYdQIHOiJvSp?=
 =?us-ascii?Q?Zujaia59R347bbF6jIN1vspiqWcXm8PcBjmk9EGtne+izTLtDK97qGx9wkup?=
 =?us-ascii?Q?55VIVgWYvJwUPt9Bsm9b7sCUrWR3jI1sGu1xTl1MeEGGJhfNz5UbK7CAd7BZ?=
 =?us-ascii?Q?9vpltXSoXowewG97y1oRUUwNpJlAtG7qylLZ4Yb2RrZIweqjBxYSiZW6+gli?=
 =?us-ascii?Q?C6ZjlbWcsRPqpaW8i86WckvF0Goe6ICTvr64bOLqtdgJP69VIqSjR6UhL7SP?=
 =?us-ascii?Q?pFGW9RFKYYqIoFpHkigWlZLSTZ9kHMGJ39ffo4pjS8rK0/DyHcsQooPgnTHw?=
 =?us-ascii?Q?0FAvQO9wiK2ebB0lOoSVq4/ac9Tq7odXqJupr3uk5yXEK8oaRskr3y0V1kwf?=
 =?us-ascii?Q?bBV2LLmEyz1MXEwMTCkhG3aFDzSQuriytr1Pcr4aKdX0JrhLBhW3pS65/xsJ?=
 =?us-ascii?Q?MWo3oeYbycl7gA1S1wFzi6w1Wm5f1MK6lHPPnMqs1e2mVV+1WC+P81SrVK/R?=
 =?us-ascii?Q?84Z4pds/Sj/w6sjehgKSO/D0wfVlxagU73KyqtSzekJUWodH8gT/js+Vwm8z?=
 =?us-ascii?Q?BDC/IrQRmhpHovuQ0GnckZndVeFwt0PEvGX/i7fifqYKWh1V/VY7tg5XMBZA?=
 =?us-ascii?Q?USg1nLD86xNrtSPSHg+N/toWNWqY2tirobljWJuwdU8YhscujxqKr+bcCI6Z?=
 =?us-ascii?Q?w+nWceufoNCGhpGzj+gGhUtByK11FmB1ZAKQnwsshi/19rEEealuaOenDmXX?=
 =?us-ascii?Q?WN53qaPCAqNP/3dEzNIHt2XKAO9qVjO7WlrS5EsbP6Fz7jfa9b38W7GfGlgw?=
 =?us-ascii?Q?tANgJGmY5vqja2Ts0QWZdX1RuO7rJuALxsDtSGpu5NAqiOZql7nCTtRH6kx1?=
 =?us-ascii?Q?pl8IuClQHbCDx7I5SABgIpsB0CAAs9+3FhePa/RXbXNSKN25PDEkErINAkgI?=
 =?us-ascii?Q?z/lX4tTan0imDQ574cupaCPf+a0zrqb7sUtp0MrIRT6HzKJoyJJKrOqZqvsH?=
 =?us-ascii?Q?WMjHM/yM1P3WMuRMX+0VnuWn2LILleFpllBfsl4egmdFbM12pTB+C9+3LQB0?=
 =?us-ascii?Q?FExaKOi7XRcW/+/8gA/+0BmCEqr6arVmuv0cCp40TF83odORkrn1qzhRFvN3?=
 =?us-ascii?Q?+RHEJOa5NKyLXBSXofvLeVjQWuovvK2IEmbgTzBzM7YzU2v3xhfwKU6JWTCa?=
 =?us-ascii?Q?O63OJeyi3hxFitx7IMoiBkpmIe2wuMWvWtrUHtjHMhB8pqiKCth1hpY4zLPE?=
 =?us-ascii?Q?VpUzQioRgnlg2ooeX5VcXoqo0M2/j4hExezsm3F/muFWkduqPL0d89qr93xe?=
 =?us-ascii?Q?If7zFjuUJj+ENyM6Z0cRMaTxnym8COgiOU61few3KdNH4UL9iWx6JNU9TZXO?=
 =?us-ascii?Q?ZVAVN35e0XEDh6K47A4iVP+IdNw2WsrA57xd1/oziQy34rg+Kk//AAWsMZUr?=
 =?us-ascii?Q?8zvlHASRu2GiI4vGbBkMnfuDNxywqEPbiSE0kiLDP7Z969j2BBxrOn4V/RjV?=
 =?us-ascii?Q?5MeNEiO0m/knbflYXZsqK0nUh10PC5WaED+i?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+WfijenR6YCSg9jMLuuyVxndnK93bai8Pw8UEUxwmj9ZWabMJwDxTKPCHSDZ?=
 =?us-ascii?Q?U2NvxLgMxyQzIhPmOxZe8oHWe8OvgPBWXO/GnR+SG+ZANordu10k0FnDw6mJ?=
 =?us-ascii?Q?VIRnmOz+A6pA1XN2qQihgzwqb+qINhME9e1h3M1b4dG6aSoD+Q13+p5DU4Vc?=
 =?us-ascii?Q?MNCNQuZzusm4XvETd/7jnRIJ7QckG38AE82q9g6mXglpsQW7pcWlnlfbSvh2?=
 =?us-ascii?Q?3SOhYbIqotNX95JmDI3XboZGitlf56n2Pc7qr1M2gNzHboWiyrjRTXs5ya6E?=
 =?us-ascii?Q?C+jKRYkfOZbGHw6OGnG4g+05MYjpI9/g+IcZmthWAQsHu8CaWF8rIsg5EIQr?=
 =?us-ascii?Q?GG980oxCl+1N9I7Vp1WPtpZx9RBR9eOUpcr3C2633xsYjy5rm593PXPtW1DC?=
 =?us-ascii?Q?AfuCMLldTlwz62TCRI7TaJgHD0LPh5ixHSb3n5lgjygSqbqK0phOG8fwYeNj?=
 =?us-ascii?Q?1fX9HCtft08nhwGHZL/0xWbdj6kG7gXVwknDSvd5rLehp4JR2E3nPtL4ClWD?=
 =?us-ascii?Q?MJAeIqc+KefQA0M3zYB5jDuDVo/pc6Vaqm/dTpykwqLy8MDCZpVWiAtTMzEo?=
 =?us-ascii?Q?a5E+AYmgyX5/3mFKjhyAfJNmp94ZzcVgparW9fQYej37vxG5+tYumUeJkpP3?=
 =?us-ascii?Q?JSAjRSUvJhY4yxzB4Vv7qVog9o0W5utfmquhRewBeSZnbghVQEA12ZujrgSL?=
 =?us-ascii?Q?fGvq/GT3jOJ2NYn9THnqdPidV2UNnnktcK/4eskpdIFvT81RG7cLMqxOa3sD?=
 =?us-ascii?Q?1NCckal207hiotzMAXVTQfoTlPVPl26ciD72F2FbXbBnYf6DgwvClynUmKbq?=
 =?us-ascii?Q?VqiJr3ZvCSVzxFu7ybQxFKXQQMQ52qTzy/moq0TxT9Hmy4baBsaIbOWC/LyT?=
 =?us-ascii?Q?iJ1Cfg3Eh+UuWyYCYOvawhCHD/rB8iaON3fKRORsrtVLXK96zn2D2RSPvXkR?=
 =?us-ascii?Q?w+WQB0ZnrIu4ghNwcb9Hga8fTvXTb6lg2I86xUZ9qmt90nOKbDHcOi46jO6m?=
 =?us-ascii?Q?Hzq68h3bIQEHZHKo+XLQBiA2tzzL/h02MprRDOOwnHEPM16UK3NGJOBFoD3M?=
 =?us-ascii?Q?+/3ffEtne1h9yPk3UuKHsCxviicvNY6eR3qBYKJ7fFfdnT9d8EYkl+QeONQm?=
 =?us-ascii?Q?qhc3NYTqLmE3CDRYwIc2tKO5/Xg//HVV7a/Xm5xH3y1RhjW+zd23cmAXg+kY?=
 =?us-ascii?Q?WBVzLTflTVI1eNSVOcseCrJVw7DWffxrophbhXYY4RaCQOPV4jxzfXH/hVsJ?=
 =?us-ascii?Q?/nhDwpGTAmRGKPTenDGa0FvZFG1vwT5tDGZsmZZGi9ACEYhAQ5XzQ76OUtuW?=
 =?us-ascii?Q?m/l/q5UzNdnf15WUHi8zrv2KK9F9hih/O3cAkxVWWy94VNHDDFEU0shk2oGx?=
 =?us-ascii?Q?w11tyVppJyI3clxCqukrqytvxcQPt/jN7IJftFkZLNlqw6s8qnWGsMu20u0s?=
 =?us-ascii?Q?V/9WzulzMc0o3pdMV/MlYzLosTL5kFp3XBic5cqKk1G9n5hXkEKJdejV0bR1?=
 =?us-ascii?Q?NZq26EsvktXzTUFK/LInyljEHRKl18cAFanofe02UAniBXnbfcK9BGIUKUqi?=
 =?us-ascii?Q?7jqa8wvTLhUMD6K00VAkPm0kUJsRNAGjeyMSwuAgxzfIJBe/WQUafRBWTJZ6?=
 =?us-ascii?Q?oEQl5xHisigz9hz+YsHaU88=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f43cdc66-2d8e-4aa5-96d0-08de20b8666b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:22:29.9161
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KbhiVAobJ/VPPugFbM/B2TCPoXR6qzwooJDcn6gvvNCmdVDT46xwdy20Sq29bjHz0pnzC9kmqq52WU4W2sefLuZbpXwIovMz164YwXlYHAXAaXnxAUp1GzcEuNTamL73
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
 sound/soc/codecs/hda.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/hda.c b/sound/soc/codecs/hda.c
index ede980cc60501..237b0b060457e 100644
--- a/sound/soc/codecs/hda.c
+++ b/sound/soc/codecs/hda.c
@@ -96,7 +96,7 @@ static int hda_codec_register_dais(struct hda_codec *codec, struct snd_soc_compo
 	if (ret < 0)
 		return ret;
 
-	dapm = snd_soc_component_get_dapm(component);
+	dapm = snd_soc_component_to_dapm(component);
 
 	list_for_each_entry(pcm, &codec->pcm_list_head, list) {
 		struct snd_soc_dai *dai;
-- 
2.43.0

