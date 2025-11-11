Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010004.outbound.protection.outlook.com [52.101.228.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC451C3C11
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820775; cv=fail; b=OqMLhUTUMOh6jJb0RIhaiyasP7CK/HatG1DMLndGL1SAcV5QGt7x8NP7ltvFVbgoZz0kZYS0uWzrxDop/CqrzbMhNtzTJMyHbhnOsLAAUKjLOAst9rwa8X6JgxIJRClfJscapFUl6Kof5ACKcGS7K6lr7WvKaz3Bq2oYqASPD1g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820775; c=relaxed/simple;
	bh=V4tqDBbEx6vX9SyldvM1CW7H5e/+08tANf1QtU21h4c=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=CZCfZbxxACcQVbVacJfJ3GPSqQTEBpbZK6rAUi9AF9JCScDaTGaeQho8QD/Pgc71ClJGcorrL6nqDM1m708f/vaug8Uud20a2jEi5fpA1QthUkJq5Alo2aReAL734Ad3pll5v/o4rhGAgRsej60vhQBJaXfbhU6F5NjebXuE8mo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=FFz7dWAf; arc=fail smtp.client-ip=52.101.228.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="FFz7dWAf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KY/I9oyxLq8fAT03R9eVGwUo0ynUGVulf0YJe5BjHsMquBpcBmjaEfUN4xZqG1SB4JHcr0KjkqnASme6Ckc+teTl3PdIHx0Hoiu7waXGg2T/dTQehaIViQ5huyJ1fP6znkEES4RGXNStUojS+mCoEMT7h6LoSrxPt/d+nBuWDLlmKyOtWbVN+EPNVEtq1c407w9wC4Rvd5IDIJKQZ9rpthuRNeICb2hxuUk4ZJQ2vBOMSo9i7kUY9GzUTh2UCeTpULTr+3c+WFX/+r/QDrLnlLvPX5s89jndqD0UBHeZ5VqfCVJIFg7DJB8f1EHkTGVe3soIAw+m8qa91aUAn8wDtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=59j44YxBe+GS2WoyeelMVqQMiEDxRuVbnvkl+tH+txU=;
 b=AMVEeE9EArK+Txfw0NGfpNg9mCes9lBUAs4nhJZJ3s6IJcEPcc4YM4+i0wSoHc0mKSFid9mqEmP0HLrcJsdbDBnNCFk7OGagx4csRlWcKYsP6ZO+gwDxOm9ZsqZEFZ9/faRrjZyiV+7Ch4dIas97gUB+MwkNbRUphCvTWl24SCc+qG3VOBeOi9fZPhqoi5/yJC6oKKiOuj3FWX+03vSpGtMjz8IVCNuZQNMWlg/eK3v9aSFFBwVLkDFy7uoxZ7J3opAtNUzoERxJ6+sqLfd5UAM6ASeY1+kIHDBs1YjviEx+BPOXwgFP7ZJrwmHi64FxxbPv9f41Dwrs6fxm17k26w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=59j44YxBe+GS2WoyeelMVqQMiEDxRuVbnvkl+tH+txU=;
 b=FFz7dWAfu0LtEv2iVb9REkRXlbgwCmwTHnJX4iioLqUteIyJIiDdtNiGJOkiOlexSYCaBx82zpVa9UXqMZTRcrwYG9uVNxjuIiWM1rQ6IXhp+6YKseLKPn4kzZz2TmerZtFda9K4XhvnJI21nI+1FCsQM+q5Yx5UW9VELVSgt0c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB14439.jpnprd01.prod.outlook.com
 (2603:1096:604:3a6::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:26:10 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:26:10 +0000
Message-ID: <87a50t2z4v.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 126/292] ASoC: codecs: rt721-sdca: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:26:09 +0000
X-ClientProxiedBy: TYCP286CA0031.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB14439:EE_
X-MS-Office365-Filtering-Correlation-Id: 40df057d-eb55-4a4d-1ea3-08de20b8e93d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kPyhuoJQPTiTVBWurrS1TfRNw0k/PqvCGZhrI5ZdMqG+zocHc21/YTVOADyn?=
 =?us-ascii?Q?2cvsZRrF3DvYtJU3/MXcZkMUYSSxJma0+yN3pA/HbTiWbBIds7zSZVLSKOnZ?=
 =?us-ascii?Q?a9QYImX8lDhVthPGX8J8N+Q/W9FBwCgbiEcQOorNBfAcGGEP8xAgCtXw9L81?=
 =?us-ascii?Q?KC8sH6AegT3VbQoN6zvznLGlnNUQbdnIljZGEMkvr+2PFKkwm4w/XXDgFnK9?=
 =?us-ascii?Q?ZnXjVzKk7uvpo9l2KH8Zr3ArPdH43hpuu/NK+Uy7l8RaWyuRZ3z8JRG/S8Ot?=
 =?us-ascii?Q?7016Z20VyICA30AvpG8s6teStE4Q2T58AgXr3Hx0LjEIJWjHzS2N8rV87iFL?=
 =?us-ascii?Q?LmpXh7uZAuhD0jv+xq5+6pogDgxFOYWcTldcyBa527A/DsLIjwlA8+fB2i+V?=
 =?us-ascii?Q?xIss/H+o7/o4e+k/t3NfbunLUr4/fZdn/EZJuMQaVPe5kUZIgwq7cJJvvou1?=
 =?us-ascii?Q?U1N9fYLk/8QSApdF/JfZz5dbNWM2qBK4hk2mdckorrK+tSKw1qdq4MjmUaRo?=
 =?us-ascii?Q?FtVQoG3qVbYuvCc6y99kIqD/OR0gAIZKW56rpcBWcGw95SQuLOzw9XKk67do?=
 =?us-ascii?Q?g0BN/fvPrUSXXJbe2TElhuIxUoZcessLIyeDZDGX9NnM45AwYOlOgJakGTa1?=
 =?us-ascii?Q?lAEZlXm4mx1Pgmci8bo4Z58+8Mi7fgdQqv1lQq2lG29qVjVcSDs68pH7dhcV?=
 =?us-ascii?Q?GNn8saQPtNSRQHRDak9ErsW5uF/QkdUZ9DcjFzQMpL23t+xyF47qgyQ3Hj2h?=
 =?us-ascii?Q?/7X2ft8pRHIzigYr8NO5NDNHVdfLksOcLMgbHEB447QkHq9S/FubdRYDGI9U?=
 =?us-ascii?Q?6OHUJZ56FZ5pBOnZaIHG7HvMsCoPRBXugselGNcY4ZQjcVVWq93N9I0/lq6D?=
 =?us-ascii?Q?JgcGma8E61Irb2nmY9SwPkqF1N4drBDThr1HgHA1kroVjvpa7UY7mphltQ/Y?=
 =?us-ascii?Q?WAfb1fW2Jlrz5KVYdHqlv4Eq+kcavao/Q2IugzvYtrNtK+m69gsRc5tx/GKx?=
 =?us-ascii?Q?YrPsYwAqDeB31w8lU4W6dXQFelnugumPkf32w/hKf6piH5Cj7IcHRGgKpsnA?=
 =?us-ascii?Q?IoNJmdpEiutddDH5ZYRC1fXt2AepkA1xzBR6uzFjbOzb8nSXxLcMUW0Gmixy?=
 =?us-ascii?Q?KdgWCghjfdEDXt6WV3novvS7oXB6VSCgqcn3EsH0swoUT60uEVPsPA9VWWoc?=
 =?us-ascii?Q?W4ilSCB2Tezu/4H1aJKPPsq/ITHecO/ML5LS+uJgcJdupXQNTpmjhgyB0+V2?=
 =?us-ascii?Q?3mCEoJklAwynDlk459lhUcBUL3XRVBpnjFNR1tBvuOxAALLcBIvRP1WVZABN?=
 =?us-ascii?Q?H6HJZLXtUhW4SDOWHagUqS5P+dh4m64Xrrl4ptQLFTsgu382WngC9MGXuAq6?=
 =?us-ascii?Q?doeRug9XeR0erernvzHb15gGYQpQr8ROi6crEIokZ+LTWTsdYYSWdWqtxHIv?=
 =?us-ascii?Q?/5iv4H1J64YOf84r2U5kQeQNqW1GwqrWdXEqiTusUswCn4BU/nqCGYLgh9tR?=
 =?us-ascii?Q?8imUwpvn8NzArDVUk4hIwJ5ndUXQoKj9P6M1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/xCMjdE/u5umKpdbENUXDZFdHTAFfugwePZCUs7s+7EYiILtzNcwq95iNDVF?=
 =?us-ascii?Q?MybYNKWGsCEyp2F4o0ocUHtSbukDCf5rHtiskE2+XP3wNY5geNkwtA/8z8nE?=
 =?us-ascii?Q?BsVsezn1YO6QnnvUlIcBYWOH+Cddz3+ZH4+fMN9Vm5HH4TNd7gTOMgsBmn1M?=
 =?us-ascii?Q?1FM/hObtzBn6zANZzuBqUDJhskXKA01oyyz8w3s7EFBtbF02rOSKekzROdvI?=
 =?us-ascii?Q?xUFSp4RIC1RCdwjycZ6eXdrbF37mddXYq9LWLeEXTr2bcbUHdF58mhFFjLJs?=
 =?us-ascii?Q?b4c8yzUrmjWNvWqMV8rE6mgKXudc/3AiNlu6kbHgV9ndlt8ZpnndpIww55bv?=
 =?us-ascii?Q?onZLcSGx+Fw6UO8WTZByfCpsupW7s0RC7thFATEcPvNdHP7zYHOy87ueYVK/?=
 =?us-ascii?Q?kXUJv0jDRzWdeLAtvy5uLcDsXA6nfzGMnmBhszyNW4yJ+PL+cvPtC5m2Nsfo?=
 =?us-ascii?Q?OxIuabiMOBqRFld2uZ9uk9ypzA9MJivNYnJhwR00Uom6QR43udlDoznyJu7O?=
 =?us-ascii?Q?XJzwB7M4PxVXIA/V97iKW1PYi/TvPrDQe8xJT4tg4F56PhxoAf8AQhcvwY8J?=
 =?us-ascii?Q?fsM/Vtpt4BVXuegEjVimn5ZIWrcqoII0OvGZbK+JJH4gyk6Yv2CoLnPs+F0s?=
 =?us-ascii?Q?XGOozVFqBgcgaJjGiOX7iHo9L12G+cyT4Q8SogV8uydXHMK1h44+NdIAaH1Q?=
 =?us-ascii?Q?uznbET+N2GdaUyrsHnI8hRmDKyA9btsD1KfT+GzZE8RPCwSdqHxG8t05fS2B?=
 =?us-ascii?Q?eEWCev6xQlzR3cuw6PBjZigOR2n6U/4UIBPNhJl1RK2kX6D9g+N8zRMxQ8ol?=
 =?us-ascii?Q?Cge03yLQJHaAIdOIGexioYzRBXcnvPA86mDv6EkZaRcImcSSddOctlDiQhnl?=
 =?us-ascii?Q?aQxKXYhhlF7O5dwzoOWNEoUt23XEsiXmVAlAGobxn0QCdUOPjDS0c7imUS3w?=
 =?us-ascii?Q?6Bms5JK2ku6yPk0iM79GUJIlRlGpuRxoPdXgrA2U7qKdRgtZhrGCbBGbOkzJ?=
 =?us-ascii?Q?VTac7Uykz3TcVoR5R1PdcQYq2Oj81a23gmdX0+FgpbDc4VKAfNzUq33epa/v?=
 =?us-ascii?Q?wl3w8jhRhRqSXUEumAffd55kJq1MPmipbbqSCZanx6CodJoLHBerIqVeu4XG?=
 =?us-ascii?Q?NBO/X2h36PPNWdXUbEkg9o78kevAQOZgCqqkWDv2SQFRGL9QiKlNvwjKvZa2?=
 =?us-ascii?Q?Yrv5dbO/qGGrfhbj4Ej9Y4NKTa0S5FvVOMz8zH7J+x2sDbSCNO+ofpFUB9gN?=
 =?us-ascii?Q?2YCKov4uo+Msud03R2UvYEsDrZN2bEsNkGk/CoiQYqsWHLDBA8oDhaKIXkDS?=
 =?us-ascii?Q?9Snh3FoVzbhHJh/uevz/oWeOUeBuzNnYyJpDqOVdY22LenMapjugRJBr7+vm?=
 =?us-ascii?Q?HbeygxpF89igtwUdU9rOes/Fx6vKsT96Sb4PlXFbcYmEUoo7IXH7kPC6ARtw?=
 =?us-ascii?Q?iaFUhZ/U3UYo08SMBQ88+Ka6XjlZN/sbRu0b9kdYWAoqhtJUSwWDywr3NtBj?=
 =?us-ascii?Q?Tq8LCMmgX0Gam+Kfq1X9Cdr6C7xqxzQARELTYjEgCaz3W0DRDlHmPdtuiig0?=
 =?us-ascii?Q?UAZr8CE3VcXXECrdTQ7kO4CABwXt7Tm3Je4jAd6iQ/cO0s+mTF7b5OOwQvnQ?=
 =?us-ascii?Q?NPjflHOSfJkAO5bsKBQX6n8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40df057d-eb55-4a4d-1ea3-08de20b8e93d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:26:10.0510
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DNmyrsG3oCaXfK8LAs5NeJj5igmqEiuWaI+tYu5bxYBR+C8XPb1mgvPO+QZt2uS9KxW93M1ErAmX5EJHsrs9MKNFfhGh3BIhed7JyOaZrux11nsInfYmh+/wFlp+Kzcg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14439

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
 sound/soc/codecs/rt721-sdca.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/rt721-sdca.c b/sound/soc/codecs/rt721-sdca.c
index 5f7b505d54147..8233532a1752a 100644
--- a/sound/soc/codecs/rt721-sdca.c
+++ b/sound/soc/codecs/rt721-sdca.c
@@ -746,8 +746,7 @@ static const struct snd_kcontrol_new rt721_sdca_controls[] = {
 static int rt721_sdca_adc_mux_get(struct snd_kcontrol *kcontrol,
 			struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_dapm_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_soc_dapm_kcontrol_to_component(kcontrol);
 	struct rt721_sdca_priv *rt721 = snd_soc_component_get_drvdata(component);
 	unsigned int val = 0, mask_sft, mask;
 
@@ -786,10 +785,8 @@ static int rt721_sdca_adc_mux_get(struct snd_kcontrol *kcontrol,
 static int rt721_sdca_adc_mux_put(struct snd_kcontrol *kcontrol,
 			struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_dapm_kcontrol_component(kcontrol);
-	struct snd_soc_dapm_context *dapm =
-		snd_soc_dapm_kcontrol_dapm(kcontrol);
+	struct snd_soc_component *component = snd_soc_dapm_kcontrol_to_component(kcontrol);
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kcontrol);
 	struct rt721_sdca_priv *rt721 = snd_soc_component_get_drvdata(component);
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	unsigned int *item = ucontrol->value.enumerated.item;
-- 
2.43.0

