Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010047.outbound.protection.outlook.com [52.101.229.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852BB1F09A3
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821008; cv=fail; b=Djay7y30BOr2A3rRM3aVBX0YPEQnbMxMIqmySPssRwNSqoSD/LGrhK+ELjfhF/kBdGUsFfUZfaqOLmEHviUKo9HhmozjXfILMKtOmGGHAgFqA4JKcLrmVUZg0wgnhT0Hh4/UjBylOJbeuIkkqb3FDsprRzI2QGirNbiSR2t72k8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821008; c=relaxed/simple;
	bh=oJfW8q7oL0gmwfZgkqAN3/YNKj7WXSU3Z5jC7pv8SGY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=MENUHEzS1hMgUZPHjJZ7pxEhlKAAYq6FdinP0642YVnlV+0LHBRcqZXOYv1oZXkGG8C+h83wd8e1sBJx53FkGwYsPsyZHTt+YkzvxLaO8vvqFvzR5Of/9ewfb5cQwuJr7YXUWKDpt5zA256lyrRvnf0KOgDAzJ6NhTe4VrgO8mY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=kfjo5MjH; arc=fail smtp.client-ip=52.101.229.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="kfjo5MjH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sOl1zGfCoVYuaE0Z2r2dk24V+vbn/iEWF84pkpjBCS6r3E97M4lkCfjW+qLjlKvV5UmMI1PMG4kJBQymSKxG4oDCmwB9n7usJKOw9dv0912Gk9Wmog1ykZmcLmx5HSScivXj9apFWnYPVYMOK9ItMx3FkpXP7lAtD/911ApdJ779joJwRPbkEew/KmbwViwpQfiOIE7Pt8ocYBJ3SbXz9pogzwxI1SpG+Wxl3L091YJh2LuRxWtalYOw92UZsfUjYXE1uzDBJvoc7Xl+3HkJw6s0YPE3twqsBKrMRQiwG48zcQPzVqgDXo9SUSCcm1cTjz2VtaqQbivUXUzMNwdwuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uWHeUtcWfMAw4VPgJXi5OIrb1U4Jrz9viXDUQTRGQbs=;
 b=ccXReoAmuIcS4CMHefxsVAzBcB3oNSaOkEVuL1o4gTGIpLUyinrdRP/PRK0RVnifjLvNtiGOL1UrS+nEt3hXZjb4u1Wn092b+1DWtBLelrtU5LwVtUemWIADrAm9gbqhZ3VYG86GLLyNSvicnRK/c4VZMWcoutyavr+BD/WPnGtcizvHVO/US7JLCi1bg2yxRN8BXBzrEkpRZqqugp8RO3lPr8b0fWsycujcsrGmWfCeNgY7dN1vAg/wPWGucFOl1Lf5a8+3o3ZMGELcXRIMLeGfGJUl1gb+gDdudNdSHESuSx8XSpyI5odlmLrgLSK7KwelKGEA24aCjDwwsEiLiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uWHeUtcWfMAw4VPgJXi5OIrb1U4Jrz9viXDUQTRGQbs=;
 b=kfjo5MjH0GYpjSUc48bBxje7ZAJmObAau48xeHbQeRf2XDAlYMM5+jtVjiEN5l8e1pGhOpIgojWsFhxPaSkHRXINEiZbCz5M2kUdOnBWHVAYoci1tAKlaJyOrFWNYFi1bGwArbVupffuyaad0h5ybdP0WCexKBuDflgn2EWtPJE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB16440.jpnprd01.prod.outlook.com
 (2603:1096:405:147::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.11; Tue, 11 Nov
 2025 00:30:04 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:30:04 +0000
Message-ID: <87wm3xxvg3.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 185/292] ASoC: codecs: wm8995: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:30:04 +0000
X-ClientProxiedBy: TY4P301CA0080.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36f::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB16440:EE_
X-MS-Office365-Filtering-Correlation-Id: ff677794-bc85-4f7d-6871-08de20b97569
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YTdRREFiXUpsWX+IbeYzbfVosDmEataKW1spRbto+shYgHyBMNwL8fMBMIat?=
 =?us-ascii?Q?Dr4qCf/p3dnPWIAm+faETldxTIrBBQJATkBHqvC/Etx44VFp1OMwtpJuY3TG?=
 =?us-ascii?Q?Odv3KEPQTwvwMMYxamN6AULuSVjIP/VACk1+B2PN2vw1Ebfcrl2Y5H93QtUT?=
 =?us-ascii?Q?iOoQmDEEtmAbPg3uI8ytWmjihEWXK2E8DzVM04rrk2Ce1DzoLbGpMrWbJtZ8?=
 =?us-ascii?Q?zYSnQ6bAIFaZ9YIEWpt2Cy0WqwYak5g2yoajtDybfQl5FNGSc+37JOA6hbmO?=
 =?us-ascii?Q?jKoiePYfrr/A5+mzFNj4c5I/LEHjgcrUe5RAlOh/1ORBRIaJe5h4ByA2MsGf?=
 =?us-ascii?Q?fdLyvO4QlLbixQSQxo4WLGgFJxs5KM1Q06ukhaRI76wfgp24J2cxszQErTIa?=
 =?us-ascii?Q?Sffs0TtJaAAPDX9PYnETXya7C4rVSgTPgiuAgpKoYzR3Zm8M9Uo0kQF6w4Id?=
 =?us-ascii?Q?iyz3bPEwbQyBNpBhSEGPVJqqy3Xnv2Csyb7EPXNI9H7x9AfYoUwiktd/QvLB?=
 =?us-ascii?Q?/NfJ3yAcwomEugDRbjjDXvyi7oupjY/zaYuD2do5e7qYEk+Dz217ocVYmS3q?=
 =?us-ascii?Q?JDfG/njM/fLegDKK3pkHQM4YR9kSbwygw6TUxRUrQZ/ZYgA/UmEF5mx9enE+?=
 =?us-ascii?Q?ksXz91BembI8sX8OIcrbUaRoqZtkTJSyVYmlJ3bRxd5z+dgOnPtjfwqT90+Q?=
 =?us-ascii?Q?L9MDGNZIGuQH4w2Bli0VC1qDlh7uMph9DEAy7X8VJ8FIZ+BCpftMDHIXA5ov?=
 =?us-ascii?Q?cKDQpmrdYRQzA0MAG/ET4Tbta1wVE3EYwqTuMxe/9SY5rmw48FAP8/rmj9FB?=
 =?us-ascii?Q?HPUHkk47O1YoZvyAXBQ0So5y9sRVHDP3+h0qEnZc/zLkn0NdO4DBqsGme5VP?=
 =?us-ascii?Q?efr2wGvCgV5QLA0+MYyfVIgNSIFk8QMv6GkuxtxhMjMY6cgOAulgmdfTnCaX?=
 =?us-ascii?Q?JcYmcgOObGq+490IS6taPXRpzeqbGtAdG6laUTxKM5J/blE7T94mY0RIDvmR?=
 =?us-ascii?Q?QlgmJoYvq5x9CGO0YnBGiVZ3DepEzMzXB3d+pAUvDc9U8fSn5wBnYRKf96mE?=
 =?us-ascii?Q?YTb9D2FyAamNMeMFQ9TQ8qeGILJYEy+IiLLwJ4pFbWukRVbMwhOvPORMgH9C?=
 =?us-ascii?Q?X38KUDidW15huqQfuNyZ6aWhbxZHDJc6yUaAZ7fK4lhK2rFDZMkkXCvLy37w?=
 =?us-ascii?Q?7k696Rl27IrE1qVVyMPJlkcYnQV1RhJa3SrGrANqmw89KNxgRWh+gj/OrvTU?=
 =?us-ascii?Q?onEvNGIJ6m1lxyVQF6aJuZOaP3k93JysAOMvhXkcOFlE3TU2+HZlCPOzrMdZ?=
 =?us-ascii?Q?F9NU/m9vIt6zzSL2mwdkL20MAXxQoihtssxpR0pYyJih7F5LoskqsUY2lcJ0?=
 =?us-ascii?Q?awyw0dV+Mqsc9+I2XS8M2bqiCoYFX136o8Y62qPx24MQffE9WnQjvBBcUrNS?=
 =?us-ascii?Q?glOV+FnNtKA7Jfy5qJ1BQhmw1KuQ5y1g+Vsv5H7AJclPb/IZ3YTj4OtDgiGL?=
 =?us-ascii?Q?VvEDKSYlj7pX1uvfRKBJstZ4AUi94KY7tpmW?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?S3a5wJ0NGZycR1yif3HFY8ZVDjjCnTxoSE4UCSYPJUxEL7HznnoPA0DWuQDf?=
 =?us-ascii?Q?GOKUBuGwM5Mx09NC/ktA9CJ/FOtNyuzPAkiBUY9rKdNIoAwin9DJerRT2XUX?=
 =?us-ascii?Q?kDzFgy41GI0BXyt1qkrVI8GfjYSTzvowOKl+N0tg0IJ0WP64geIlQyL8Yew2?=
 =?us-ascii?Q?sKj26jWmD4X0E5EpYCb1o8qMEw+C80Fod1Ye+uPVM0MW4sgTk7e27UhfV3SY?=
 =?us-ascii?Q?Z8+om2sPkAjTSiIAFYRROoeI0iH1LsalNPOJMY9PyXobRrzpe6gYVOzvkOOq?=
 =?us-ascii?Q?pfpAP4X8sq1gapRUco+pmgNfRiCfiFYC57Nvi9bNzMazn5fQ9GS7vTudazLg?=
 =?us-ascii?Q?bA7UU9qR74K2DGvWS4qN+gMWoEz7flY+y0nAh4RaiFQAwV32ZpA2NOSjzWrw?=
 =?us-ascii?Q?tpexmeAXFeim+xZs6dU86tDpQzdA83IRmDwwFykCmM04H6qhtm+lQRqUbO/l?=
 =?us-ascii?Q?yrmWui8hoahCAQd6IwfTCb3PZ+1fARi7ZmSoBZUOLIXPh8G0FxVNlhKVdG0j?=
 =?us-ascii?Q?pgzV2DKKhiPvYlWlKxzgPR3SK2ADDRY/trXL3dyn5PJFIrhBH9WxmGKEZpLU?=
 =?us-ascii?Q?7TwpbZvpn6Ea4JbzmmsrBsKK+a0b8TwL7SmWVDDt2hjz75ABb1NhBm9Wm701?=
 =?us-ascii?Q?XmYrJWfazBDvqRm5w8cQADS3YlpcPOm2vyclMou2CQDSfbFPmH5R8AmCNUty?=
 =?us-ascii?Q?hAsYGrgqjo1jzZ8urwG88/83uh3xceFTQgWaRxYQ+G/zfNdsiuX8xSQbXVEA?=
 =?us-ascii?Q?qQM+tjAi6PWL1fDfOeMvl8n8xrqaKmogTVIapizKbA8OPVXF9AWWuAIrhzmX?=
 =?us-ascii?Q?4LlOR5WspYpqEfSN2bHZLoc6aFFaowQpQGmgG2lKXxCHJYlEU44Nm1//cvs6?=
 =?us-ascii?Q?GizQdE5NWVAlnBdVKH8KG7vFWfkqJ9dzghjboneRREUFLQzV54ItFdxdKUmo?=
 =?us-ascii?Q?+/DwM7ItUAjY1UN92R85VxQLuZhSYKEuMz/+85/Rx5DjU5Tn7Sw8YOKsxhBv?=
 =?us-ascii?Q?ldpojlYT1LYyLDbMIgkL1/3klSEw7lJxtcDnkp45GV7byCwMNEnXF6c0REYR?=
 =?us-ascii?Q?XWmy0hbT5Fe7L1P3spcWbAAkO14nJpMc66Xdxpvmeb7EbtxZ/TLB/Ne53Wuj?=
 =?us-ascii?Q?Em4lyJ4TT4fjKTasCnmwiDbBtW6R21XPH/iySIw6i9CK1b0Gzv9YExG9Be9Z?=
 =?us-ascii?Q?AbYalLfCPU2cDD7CPl8hDoiPgBW3WbUXwto2tIZdR3Og61Qn1dBqWGWPOHTG?=
 =?us-ascii?Q?ETjCeUM9nJXqsim8HMCzZnt/iSh2PvBCKl6ii729IXl21Ab03IE6cascq7+o?=
 =?us-ascii?Q?GXxM9dLIFPA8xKrKfrdMUvpOCoMOStHicG2gjEyl8wpZTGrkHWUrCfNN7ZN5?=
 =?us-ascii?Q?Czc5ivExDaTKX9lWP6KqZsHfnt2nTVzUHvvnntuNv3HiBj84syDPZ7Z1Uay6?=
 =?us-ascii?Q?AoDsqm4LoZOdUUxBtu8ejXoI62iEnw0suZclVrabX9NqwbVF2ev81wdC16gg?=
 =?us-ascii?Q?gTT97YgsLtbAZ+pV1rP5W216z9hAleliuWP4H58HhzfkK+sjxs2IhwBybrql?=
 =?us-ascii?Q?fPlcB5CuwFNOM3mDGJmabsE6kTY41+86d0aAphZMoHDehH3dUT+tDyyCIRnu?=
 =?us-ascii?Q?xwJOzALqXjo3Ddzb1VqwY7I=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff677794-bc85-4f7d-6871-08de20b97569
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:30:04.5332
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6oSxknH1UlAHZYjcvmOZjzf/2ZfBZCSWTdoIW+vBX12tc5a8xp7Prd/+CbV/9WTSxQc8wm/+rNK8uJS1c9lXRE0lUYX2V9wE+BXjeHqBFfb184RDD6buB5mqrHly0d5g
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
 sound/soc/codecs/wm8995.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/wm8995.c b/sound/soc/codecs/wm8995.c
index a88170a3ed914..104ce09c02e05 100644
--- a/sound/soc/codecs/wm8995.c
+++ b/sound/soc/codecs/wm8995.c
@@ -547,7 +547,7 @@ static int check_clk_sys(struct snd_soc_dapm_widget *source,
 static int wm8995_put_class_w(struct snd_kcontrol *kcontrol,
 			      struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_dapm_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_soc_dapm_kcontrol_to_component(kcontrol);
 	int ret;
 
 	ret = snd_soc_dapm_put_volsw(kcontrol, ucontrol);
@@ -718,7 +718,7 @@ static int configure_aif_clock(struct snd_soc_component *component, int aif)
 
 static int configure_clock(struct snd_soc_component *component)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct wm8995_priv *wm8995;
 	int change, new;
 
@@ -1955,6 +1955,7 @@ static int wm8995_set_dai_sysclk(struct snd_soc_dai *dai,
 static int wm8995_set_bias_level(struct snd_soc_component *component,
 				 enum snd_soc_bias_level level)
 {
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct wm8995_priv *wm8995;
 	int ret;
 
@@ -1964,7 +1965,7 @@ static int wm8995_set_bias_level(struct snd_soc_component *component,
 	case SND_SOC_BIAS_PREPARE:
 		break;
 	case SND_SOC_BIAS_STANDBY:
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF) {
 			ret = regulator_bulk_enable(ARRAY_SIZE(wm8995->supplies),
 						    wm8995->supplies);
 			if (ret)
-- 
2.43.0

