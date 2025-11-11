Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011020.outbound.protection.outlook.com [52.101.125.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D111E3DDB
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820965; cv=fail; b=akVJp8NYA8M5+rGITXb31vKuhNrnTyog4dnvxYKlaj2DBdjiIZ0Sy3vZINti4xokonJE6K7j0JwOQrufJ5YNOqR75/0kImH511kGDkPYouZ4oyTTgztnQ5pWhimyVWW/6oCbMdmRKzNLZMVPPflik3U08W0TKtFFtC//FVio1uM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820965; c=relaxed/simple;
	bh=detsHV3S7ARJe5+rRVjYQup3h01ZCqqjyEsGcvRSVRw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=XP5NL5mtc5C1GqVzchzVVbIDb9Nqt3OLX1SfU5sc/AnUDxr9zHkPRBJMxHjNHi+4xV9KUP9ivsoI27wOyxMqyo5QryTKq3REB0c4vL4KpR1Q+VaZ56da16bEKZ7RVAn4zPS/KenXuJrrdkxOrIM2s7mKnHfJ0AWWCcyyQVwGo+U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=FEoTnlCq; arc=fail smtp.client-ip=52.101.125.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="FEoTnlCq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k3ociK2LVRDisrknogtNwZdPTiSOVb6pQ/o3rkIzImIT9gfaKmbP854iRMP0Mgj36tNvBzvgmPPlT++2Ia5CO68KPMFEbUuyeKdkaOp0/gq0ajLOziFcACRjSUEZl2rA5rDSecYhg9f3Zb2L3TJrvhpcW4dP9K1K8qPJfe16yCAwUOiwqpak3PjnnzDItDWsOK5FXbteRsFWsnsr+AqGTJtsfe6xWFX8zNgN8X+bH22KK6h8CPlxkDy8PstDYr2wirY+W5vgihRXALR86EFCjQlpWvrfwCMMOARvwy8C38V/gAFZoLFO3v9RA/B91Amf5ctl4ikOKTPh+Tp3v4I9Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yh3GBRsHdXiUS+dbEer5EExzeSHKHjDKD1+Pc5HDjVI=;
 b=i1bNfypKIEn3GuziN80KipviConL7Y6KnDvaHQ+0yzPA3uV7qjojazYcGS4gn0rgK642kSjlIHX0Pzx/VsTJdF61Y6aChn762bqK70oAH/nVvP4ONrc1K1orQpt/DCNkx4CeocB7GvUP2ekXzg5tWQ6E6ApS+F0yALVfyhkpK8JRVPCzKkrBXm9DL1OdukLB2sMRG0voDNrHRGpHOHb1ska4j9zSFbvLFRKwoXfH9aIeu3z24GftFl5X0PK6KwS+sPNrRYhXubFHEsqPjvpAUlD8stWSfQRr9XZFzLh9w/njOmZuHMlgAcflH+ORWylrz2VR094GwtJ/AejgfYRfRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yh3GBRsHdXiUS+dbEer5EExzeSHKHjDKD1+Pc5HDjVI=;
 b=FEoTnlCqwn6ss6Y793eaak4IpETzD1YkFUEB8/AUfZ/LTgS+DE1QQCny4Je2GiSQqG5W832uF7lHysjLLt13krgA6XVRe/D5O2LSFDHCYdTLmfz5UM3V0Eehg+Ka6EN67Y7+0nt94rUBoQ9+LN8WyOl+2u7NXPl2HGbsGtUUwD4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB11220.jpnprd01.prod.outlook.com
 (2603:1096:400:3d2::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:29:21 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:29:21 +0000
Message-ID: <87ecq5za1q.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 173/292] ASoC: codecs: wm8961: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:29:21 +0000
X-ClientProxiedBy: TYCP286CA0008.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB11220:EE_
X-MS-Office365-Filtering-Correlation-Id: 79e138b9-7ced-4b4e-638d-08de20b95bc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?F+G6hjVo+YTzVyokx+UToGJgYtextYfHezsPllMbqf/Y6bHNzdg/zM5A2ZH4?=
 =?us-ascii?Q?jyuP1s1rMSuDz/wQv7o6G44VVVzqxBBmbTMXUzRXmvHjxiosevS1z13ZGbno?=
 =?us-ascii?Q?vdZ7foCLwyHGBr3RSr0NukavKxb/VBk9LBNBCxY/OAjXTsg12hGtyuE+scdS?=
 =?us-ascii?Q?FhNNMxWhKdtGxn3wduQIz6dLair6FtYoS9TcJIi7ZozveUMJD5Pxxr4qaCvU?=
 =?us-ascii?Q?wlC2xZ6qh49tk87pnbojzu/59cfTu/IBtK6w3+KgloFNDvtxgpOiTP/49R95?=
 =?us-ascii?Q?VgFkB7AfSDkhWLrbqx8M8RZ7ikmdCS6JN+UXNGDM0bal+bs+tH9zfmeCsrQT?=
 =?us-ascii?Q?YVFd4ok7xS2zkpO24ByGBXw3bEd1KzNGydNDgxqizL/kf4KFCIBHPLEVGfvK?=
 =?us-ascii?Q?C2r2xkyI68S4zzZUzBo4Qo/VA1dSNr+pa2eUh+PlvPHo4YKN1kPbrN+QUaRh?=
 =?us-ascii?Q?138zD3UOm4XfT3v4Q8OGDtgwp/44sDSP4IKujmGTS1/yd084chEJliMrmg9k?=
 =?us-ascii?Q?hq383W0MXcM9L4yYkR/562bYc6hej9dJZn/4/pxr55T3+R19mVPPvrwSOkaT?=
 =?us-ascii?Q?1kAxX7NVglmzO/3g8d3Q502pVoZ4TKw+mUWuzEIJJut9UzQ/y8xFBL8IIlxJ?=
 =?us-ascii?Q?NEwxu57liw0ebov0vgwIMhPQ4j1gd6F5ca2wlhkkSKmT1qqybWlPlCuOpXmx?=
 =?us-ascii?Q?kcU2AtThE9oSJPMHlO8oEbOSoH7JwZUyaXiQU76WwcETVMNKJAX1A8YSTJuB?=
 =?us-ascii?Q?EyWboBSbnP6fd6rnS1r5Qmtfg58VtEQXae4MduoyFcF/xUIgxF+TNmrTYJmy?=
 =?us-ascii?Q?dAPXWBoJkd/rGt5EWanjCdosRyP3knBU4mxBOV524hGG8C1y7qR8di54LP5e?=
 =?us-ascii?Q?1qOasZWyJ4dM7Q1ZfPC9BergQlS6jH+Fn+KmQR7N+IKKoUrcyjYnyLY7GBxF?=
 =?us-ascii?Q?sEtIkMptRicjhUE0pfK6NYpoUFp80c/zdIFQWbiEuuL+lDmCRRu/ry4ZEs8N?=
 =?us-ascii?Q?v4q7WYu8og5TatvUmNycwMSKRYK245hgvuyLwhC4W+Mg1no1irLDxAEb1LIL?=
 =?us-ascii?Q?neLCD6eCNLeYSU5+unT2ro3p5ViF6/VklGrjAkxiJtqAi42XErQ1zPZccSRo?=
 =?us-ascii?Q?4crZgvhUzVn317ZmW1+X9kLNn/482Ph2d84BecCSVd3aVtmyjNN88Ty90XAw?=
 =?us-ascii?Q?+lkWy8NpvjyvC3rN2xgM36FcWAA96ZycQ3orMu+IcRKFjr4OrOdoaSEUCvbY?=
 =?us-ascii?Q?gb/LIdx+fvom9vtwX43jPHwqOhpdaxjIiQLo+dn88MXexTNEAOGEk++hN7Zy?=
 =?us-ascii?Q?6KtufvO2+vGvSAkm1PY4NvyCbE46Qk6aKsAlSvYKy+oW7oa4zuowVNASb8Qf?=
 =?us-ascii?Q?Dpjk+KsrVEXracc4w454VljiRBxcIhtWGNW9tWRGubUONACtdRKDblfTnB2+?=
 =?us-ascii?Q?+SdBz2HZVvbZPs/Rl7CtYVSSNPUgfitPHy4p8oFp0Iu7lQcI/8jCsdU/3WaH?=
 =?us-ascii?Q?j76RHO57+7fqH8x8Lf11Tn7fQtM2VyjzaoCD?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DvbzC+dZ4moDQXROomRQiAv78ZGz4ztbKqc0kTYbnxBbDY8r7WbCdDe0v55g?=
 =?us-ascii?Q?K0t+h/EyM/M7FX/TXpi/PhpRrwspjnd/6vsn6WuI6aBzyaJ4Ea6Gp0DlAB4y?=
 =?us-ascii?Q?PRKUq2x5AZKLqKynTSaOVuHSla9IP+EvfhUXPLnY1tf/Rw8f4N5JplrNha6x?=
 =?us-ascii?Q?TwakD+mLaMmWNUVLEfVMalLcfhIjsUIIhMdXM5O0Cy9+6BUzf0EKR1v2n7bv?=
 =?us-ascii?Q?L+K/ap+0D843geu5j98UVI48lzIjUEosO8+cN2Z8ddmuKrmPFjl4CjWwAlBR?=
 =?us-ascii?Q?ZY6RQ4NQewBXOWJ9QY2J0B/mFu9B5cOeoasMY9Kl/XG+hXSnrP5xyu+UPLKl?=
 =?us-ascii?Q?7BKQqwK1v6CdMsYp+IR2Q9vqrDnXc1gRqEdfp9fVWT5AJObPuCF1YGAeV7+P?=
 =?us-ascii?Q?UqGRoYNpsdKs//FFBMDBt8FfwXEHa5v5eLCGlPI2BI+EOZEFi7ziDKJPD4Tm?=
 =?us-ascii?Q?nqfDIg+EemZTUpZaGCR/auGRRUwG+t9HvPIbw61umMakrXYfJoMZGxWLdQzV?=
 =?us-ascii?Q?rL7OQrBu3pZ0QNwyNFBqtYO/xV/xLpsS8d1Q5hq4AimPGqXVI+iQYar1HLqg?=
 =?us-ascii?Q?bC5+VyqZ/0AM7DexCnY/b+Ok5fLe8wDzDntecs2kbubjFLXviuwrJv+JJQiY?=
 =?us-ascii?Q?cvGfo60VZjPpbtaQPsgxebr8wtxzW5vQb6h4jCczryOyXFnzFz5S2PHsKWwr?=
 =?us-ascii?Q?EPU+sOJ9PtevG96nEeSYk48lpnKJ9uTpMetIq2mewEqiJ5DyFBFZa17+cso6?=
 =?us-ascii?Q?b+48oTmLBmx7atPqyWCzM/ZwO6ZXWw51KyDoEJgk3WmAlLfFApOcWdqiNQ0f?=
 =?us-ascii?Q?b6XFMHezBhDrblEHdK91P95n7AFg05MNELt0ESY/COmpfJDovSubzne8zQtF?=
 =?us-ascii?Q?JKpurxm2vkiPsHb+2M384FC8Vj6tiZr5O5j3RHMQUGJQ8+hnBHv22d6JyQzz?=
 =?us-ascii?Q?R6lzb3Gr7BEBGRsi5o4X45kvQ/m5mcRzewCK9IOvEg8VLgES1Iw4Mew66PNO?=
 =?us-ascii?Q?94K0oRovkDmkWH5KRIGLMQyH+wBh9JlcWD0gHW5R63g1BufCUlZCT/hqzDUl?=
 =?us-ascii?Q?Qvtaxl+bkaZvZspXNpmR+2r9vricprARmivNHq/Tvz6q6KhhvZBZRRVjtI5i?=
 =?us-ascii?Q?ojf2CCsVaQU/sLEU84JGZVYFa3UeL3jreVnnnIjfsnoTdClieJ7sPkunTQjh?=
 =?us-ascii?Q?qOMKMwbJ1rmhxmBOmSElG7Sv4usFn3WUrstKr2nrQXGOH0TnUYyaJwKjZKZW?=
 =?us-ascii?Q?Cwd+y+Het+L3uc+rv+nwleqYmUyAPPtQb64xnPa0d1RnxEzCYnTjOKLcznks?=
 =?us-ascii?Q?R1etZ2r1KtCueyHRkYUJkRd/CqGvJh2FgIoNATJDiqUGL9DkUtQp4uUGQjp2?=
 =?us-ascii?Q?7JiYc19NXMJ1YJRo5m27APScjkXWIEVGvmAVCx/1nNDRpAaZVxvD6e1CQgIG?=
 =?us-ascii?Q?5+dSWL+cWTwWum0jSsTbI6ULagNq1+6DIQIMYqzsikbgxvCmUUNez9Yq/zQ3?=
 =?us-ascii?Q?lmL+XkX/95Nkx3nB8O5QJiR3ypgUhHsrbJXoj5tYeLBZkGhjCRGySWjiTbY3?=
 =?us-ascii?Q?htmKD3+mwg06ZvLgcO9IorqFpYcOcgA+sIb2gS8K7B0EfevmpSkCmXxHuBj/?=
 =?us-ascii?Q?E5kc26OmPSDisGqhZSvQavw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79e138b9-7ced-4b4e-638d-08de20b95bc1
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:29:21.4903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nWYNcxxH9PLXMUwwUOmbra9Pa48gX0c7CoFD8A5HA3towqsC2xAdV7lMe8R8JEMtntAC0kQXWJYkQKpi1MR8r7q8YBmY5yAMGNKd/tcFs/F2qfjAM2Ns1zaB/mysnegE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11220

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
 sound/soc/codecs/wm8961.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8961.c b/sound/soc/codecs/wm8961.c
index 1ec7c5e8fd690..cfb8cfc918732 100644
--- a/sound/soc/codecs/wm8961.c
+++ b/sound/soc/codecs/wm8961.c
@@ -743,6 +743,7 @@ static int wm8961_set_clkdiv(struct snd_soc_dai *dai, int div_id, int div)
 static int wm8961_set_bias_level(struct snd_soc_component *component,
 				 enum snd_soc_bias_level level)
 {
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	u16 reg;
 
 	/* This is all slightly unusual since we have no bypass paths
@@ -755,7 +756,7 @@ static int wm8961_set_bias_level(struct snd_soc_component *component,
 		break;
 
 	case SND_SOC_BIAS_PREPARE:
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_STANDBY) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_STANDBY) {
 			/* Enable bias generation */
 			reg = snd_soc_component_read(component, WM8961_ANTI_POP);
 			reg |= WM8961_BUFIOEN | WM8961_BUFDCOPEN;
@@ -770,7 +771,7 @@ static int wm8961_set_bias_level(struct snd_soc_component *component,
 		break;
 
 	case SND_SOC_BIAS_STANDBY:
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_PREPARE) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_PREPARE) {
 			/* VREF off */
 			reg = snd_soc_component_read(component, WM8961_PWR_MGMT_1);
 			reg &= ~WM8961_VREF;
-- 
2.43.0

