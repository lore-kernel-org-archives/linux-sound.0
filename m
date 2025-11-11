Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010051.outbound.protection.outlook.com [52.101.228.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B650B23B607
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821430; cv=fail; b=HQ0Cl/jTgWNeZDW/+0s4yOfXDqQg4AWjuPhonqIdRxFdZC2ZTU6zs3q92TzlE97zzsPd867eqJrKz7foEhIfk7M85B5jkOH0nlzrjlvBqG5o8JaOfdHn6oMAF+jI0pbJPkcnHu5yHWqKSE0heCZp43954V5e1kRZGIZe70Nck7U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821430; c=relaxed/simple;
	bh=ZJIhsH/nNuzGTlO5QsCtTTA3L6VzkQTmeHr3Ef3tbVk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=i4qxi7zbseyGkTQB1rdzrK4HsCg2aT/G6eiYecCsXTcs/y6u1wfjo5cz0Vekk/kmCsC95flmFCytCCKd8sVTiD4aCzYNZdAa7hnY579dYH1UgykrDIA7zlKy54PCVwka4oca2ChcZf0VqsDVeZ2ZfbKAxK30BGcyKjviHL7DhvY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ppkxV/o5; arc=fail smtp.client-ip=52.101.228.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ppkxV/o5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SbWqN8DhNRLhknGCMYXxFrG449Du/We2Hzq9cCjbX0NDg3gXXnr+H9v7n+HJhnLjdBaLxc3PYOf/jQ38ms+JZZRVSntRA9BqLj7DnjK4w6uqJe3e/SkQDG76pCWcRkq2mLs+maK/zLaUAUCuWQ1UawgmnFII9EpFerh/7zRDkpXY2IBWjVhDjkvGzPvK1Kd2LvjVynyvAeRg+YuhGY4UvCioZETaDPAc87vvtAD218oD+eh6KWSfTAfzISqVNn1yoQubfeUtpS3tkuEXwQ2qEa8c9TPWmcsh4vhlkTJMenpGzvVmwgTv1rQFkN6NfW+fuB3VgEih7W/bF2wli2MVFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r8UpIJGz78GQjcnz8DqwMZRj3giRppVRqFB/vT8oz5k=;
 b=UkKIuJwiLZKPoAVER4ez6UT535HDQ/dX2AXtJRGMvWvMIrfBxm0SiyfL6l+1Dy4RECQjd0nm3PnPa7Su6U0JkEqZApzpAcSWprftJ88QX/vp3+1RFV5BPOmFXYSr7TZEoW2fUAOyn9hqGIlRxEKDL0vRPC8FbBQcFfjboyr5KrLklQAik+7UVSWSnFrIAHo78NRx0Y8dbigXHIR/kV9ZJtgIadgGyaYYP03lOmj2eS7Z/AsAyc/nu1ulKTXMf7/e00lEIrzjdJuTz7SrsxkZmpei9SdRgBmi88LsDNNwYMxZfxFt1PUfoiNg2cva4J2ICCgMo+GncbmZl6rEuxzsRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r8UpIJGz78GQjcnz8DqwMZRj3giRppVRqFB/vT8oz5k=;
 b=ppkxV/o5avN2Xbxuhury2echrR4qkNsf/9acPK6r+SZ6O+zFUrE6rqU3pFA7CNY87FGR7EkurNqBN3NifX6D1eSm3wIOuqHocO5bezsgtNpIXwiwxHTGZGLK0F1AXlaQpTx1G4jchi1zgpwB7hDxMFBHY22Fe6oUL9yQXwaNHBQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB16378.jpnprd01.prod.outlook.com
 (2603:1096:604:342::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.10; Tue, 11 Nov
 2025 00:37:01 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:37:01 +0000
Message-ID: <87wm3xs8ur.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 285/292] ASoC: ti: davinci-evm: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:37:01 +0000
X-ClientProxiedBy: TY4P286CA0137.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37f::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB16378:EE_
X-MS-Office365-Filtering-Correlation-Id: b3842590-ab64-4b28-738b-08de20ba6dc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?en9mIYgcCKsSznNQbD2ER3XmMBk6kAS8XCgS+ev3r6kTwscR2vJ+TNbOLOx1?=
 =?us-ascii?Q?qlUV18GDhIQ0ppbVy2bXzlXBPsScRzqIeFujJrxBnEOxfZC7dF4HxNUCoh+r?=
 =?us-ascii?Q?JvYeXicaR1BUn7LJutWiIr0rx8dxNzE3aUAPZcrrisOtiQ5BGoxwmDmZPhMi?=
 =?us-ascii?Q?UXgGkTnh/G/ULm7bvpgmV7LpdU8o9DacxOJbKEQk1BnIfmx1Npm8QzoNao/W?=
 =?us-ascii?Q?prG4EbUa8ShwscYEXo/nlwpVN0s1ztdCnCwpQ4zYIXNbBnKZnK/tbLvR3uL/?=
 =?us-ascii?Q?oUvT0nQpA9qs2ZXEro2b7n98CYGKTGvAxelce4xJF3PExGsUkzL7USyDynZ3?=
 =?us-ascii?Q?s7Gn7/0pjfoa2gbW/sv4vIlFK5Qe6NdkDKoBaeKhTBOBIaF+SS3Iz2R/nEQp?=
 =?us-ascii?Q?u+icDQziS+gmYDhulVOm5SjLAMS8AogqYwEW6AIoOKqy+9J/zDZoOzaS3CZS?=
 =?us-ascii?Q?ffoJBb6iILssCyQwDpJXVEnSwneLlcKdB1XOHa1KnRGtloEgptXonRNmXRw+?=
 =?us-ascii?Q?3S4+dH46yWS76AsnEJU1xizH+wNGtbKitlXJ5ofG9VkcHFR8Mv2TOsb0+fdI?=
 =?us-ascii?Q?Wau3LMjVRKimdx0tTpYtDeXwlBlIJSVjrRO2Wi3cFoI3w5dsYF7X9xiU93uj?=
 =?us-ascii?Q?I3Be3ZMs1MxPe+XD9PK8YppkKUQtBd6g5PP7e2jrozeIXKwxsGonViw3t0Gu?=
 =?us-ascii?Q?+9Pqk104AtB4dli2gHFKZoUbgb68P3K5hSnH1c7VRWt3oEaaSzB5c82x0ZBY?=
 =?us-ascii?Q?AZ2n7cqu9ysgDHz5i+jG6Ip/wNosxm8ORIgdcUj0bmd5LdMFoLRZYfAOtpc2?=
 =?us-ascii?Q?0/Dibw1jW1h7jOZgB4b3M6H65yGn5jTwOtBYY5D4f725xHwfNybj+Bs4519A?=
 =?us-ascii?Q?E2zQS0slkPb/HtNQDtso5AfsJLxebDRZBTb/p+9vU3SZdiY5sxzgCLBlhe+G?=
 =?us-ascii?Q?3Jq/dyGFcmSCTCLAxYOpQ0hWc5PoEiIJzjoKRtvCXBhRDZuSMS9JPxQYdPO9?=
 =?us-ascii?Q?i9AsOBR0cs0+VlwW9qL//QIHPuRHJf2S2ay1cZhq7np8puBuVJy+JLIf6UAj?=
 =?us-ascii?Q?32brolyREOd71+pw4XpTO9p7xSeul+CSoHhtvdCwmfEeDL5xU0WwrgsPxXcM?=
 =?us-ascii?Q?sfMnFXIyqk5icZ0vTUpPtFNZ5DDz3kKVl8JaCWQ0TCXtNWD9Yu5STxa5kcoR?=
 =?us-ascii?Q?hw+7tQUV0mKUaxv3eoF+0te8dHiJfpJW8bH34FviwLDHCXHrtkBn3ooXCDUD?=
 =?us-ascii?Q?gOfGyarllbiCahM3zneaUX4WhTnnLDSgh5L//R/zOIpowN153qA3nFsYZNRY?=
 =?us-ascii?Q?OKKjZotRyeaDknaFR0n5/aiDw35EinsmOANxecxuLKJkSTg9/zl9ISyizU5e?=
 =?us-ascii?Q?ZYjBonSqjuY+bzhiK5djpl5o4ryTnI9y7SVWhwlmO+MT0dZ1OE51Ld5IJCLj?=
 =?us-ascii?Q?SrF56PU7aZqKMGenLXfwN3X9HJvkdBttyM96b9OX+Wi4oseJM+rAS6gvfrao?=
 =?us-ascii?Q?OVwi8xwJLh1RmBlb7xzGNKe7WrTVXUIeUa6J?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LhnHbyOIYe6PVcvEsa8CPnLXIvOnGwmhqO9WCBlWlfoggUMcvryzbuDFo5JB?=
 =?us-ascii?Q?iZV4j2XKUdtlrhD9VtoGP4C4+SzX/TBG3aq5sW9oSPlWkqyhUbyAICCb7oeX?=
 =?us-ascii?Q?eYEdq/K4LRhUZ86vrtgGOeBI+tbZwjhxnPS8/mC2osiyqAfZoP1iCtaEOhKC?=
 =?us-ascii?Q?oOtAIt/hOkA+QvxUBQFMblEzIxJGwcO0R90L+71u3kOz3RbHzSO+8IFIgEuK?=
 =?us-ascii?Q?KRDiW28IgMNacu/kTeGzt7Cb8k6sLuVxhDoq+NEsl59uoVRhmwrOB7e59279?=
 =?us-ascii?Q?xoOh9J/Qz/poJ16/imdyV80NrfOF4c1juQAR1cMJTpY+12c2RRI9qnzW/tr/?=
 =?us-ascii?Q?iDprQM6JHzDfADx2r8lUIapWJiEdAmEPhRiPFhyejH4TMI//uN4BgF/oKFSm?=
 =?us-ascii?Q?QxrS+2uTGLUnV6WecG6OB/vNdCdUsLit2025IU3sou0YN6N9XY3zSc1dxe91?=
 =?us-ascii?Q?3NzaoIKOxpAqwArU/IDTOJhizPUH3jllDZhgzzWKVNfK8wRNyZYRq0Uutonz?=
 =?us-ascii?Q?t3A40RMnuQEp02jl126TK67NJ8D2e70lurUeyL+6YDcsknLuSTkHP/46Wvza?=
 =?us-ascii?Q?EFJX48Yyms/GluifGjxhlrIC7x3MoUqYMwhUX1rUQrSsiC7b4/O5G84p4UVL?=
 =?us-ascii?Q?u7HAuz+/njugcLPyfo7Tx1NbtpyokhlyHtAaTwM4EXAbHbr1fpbL5YhwrH/e?=
 =?us-ascii?Q?XXwr/caWa5R4Z7LBg3pFEqzlIh8Zl2rrov0y8jMaqzM91QZZpAPVHPgB1KnQ?=
 =?us-ascii?Q?RDjNvEEZdtxqRwvzyyoZg1YyXlrphOmezgPoHUzHdYIi6MKIlZk6nWgHN3SO?=
 =?us-ascii?Q?iLrhKZfyJlAD26nXAiz3GTjfPLiMHmsUhNPt4+VPyiYoS1zQ+NRTlexXHxss?=
 =?us-ascii?Q?WepMZ1kmSURXP+aHJu13Ic2lD+K4Ty9Lyk5yTwAHZfA/G6JXF3CqNcqCQmfS?=
 =?us-ascii?Q?l6E3ExeWdv/Os+bKkZ/IyhavGsCXvKIacys49jmecXy/UJqVpwYnh4chcK+D?=
 =?us-ascii?Q?xeXupOi9w880vXFl/SWVJRINlKxhIQzLuJVRakVH6VPqrI6rkEs9D+qClXbx?=
 =?us-ascii?Q?BZxQPMncgeSoj7PgP1bfPbBdcoYRHjtE+8+lOYUH4ht78e+uN/98paeL6Yue?=
 =?us-ascii?Q?zaGUB6zP1PUUhphHkBkiGU1VGqLL/4ZoSTyiy46yIDaXqLUzSoCf0IeX4ez/?=
 =?us-ascii?Q?C2tThqY5jhcHQQLav1mJ5dvkhox0a9r52vAMM//n+sCMukBnRl9Vs76oNJON?=
 =?us-ascii?Q?c5vZVZ3tLfMu6w6ZXZfyCsC90xeFKSC9NqO6YOmOalwFL4tm/teT5a/+Hne/?=
 =?us-ascii?Q?gfER7pubkmQ7xFQC3ENPBdsI/t0ziDrJkoWCwQohrV5by36ft/ko1c2zVtaV?=
 =?us-ascii?Q?dx+lScVzGDFcgCcyr3XwS8IqLYF1hZQNNu6Z2x7bPYElkk0rlQyNdC7gt5nj?=
 =?us-ascii?Q?qFuC2JJmFcuhnAm8vgnC7BttOKOm9zPWYWTp+1AscqIHzIGbQntMJzMC4Axk?=
 =?us-ascii?Q?q8o9q0ZoxZQQk5sH2ePCtVUWqN2JUp/EpgZcMx869GljeKtZLiiSSz8iRqQz?=
 =?us-ascii?Q?Eti6VRsFYRKZGVQuyZY0HYmecxNqWZtoRB3IYUVTGpOK36pPzfYIgpreUeRI?=
 =?us-ascii?Q?2qEfr7ffARfDS/yHjPxuQvE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3842590-ab64-4b28-738b-08de20ba6dc5
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:37:01.1745
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7CFTP2hGRyB3QE4pirqJicjVT6UwHPMUdWO0CIS3MhR8QVFaQSF7xOM1U14j38pdWco1Sm+yfY/WOlFY6vP4mL4QFDcM1IyqwO71OS6xnotTGHVyDNKa9HaOsCUlX+So
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB16378

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
 sound/soc/ti/davinci-evm.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/sound/soc/ti/davinci-evm.c b/sound/soc/ti/davinci-evm.c
index 2a2f5bc95576e..3848766d96c3e 100644
--- a/sound/soc/ti/davinci-evm.c
+++ b/sound/soc/ti/davinci-evm.c
@@ -113,11 +113,12 @@ static const struct snd_soc_dapm_route audio_map[] = {
 static int evm_aic3x_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(rtd->card);
 	struct device_node *np = card->dev->of_node;
 	int ret;
 
 	/* Add davinci-evm specific widgets */
-	snd_soc_dapm_new_controls(&card->dapm, aic3x_dapm_widgets,
+	snd_soc_dapm_new_controls(dapm, aic3x_dapm_widgets,
 				  ARRAY_SIZE(aic3x_dapm_widgets));
 
 	if (np) {
@@ -126,14 +127,14 @@ static int evm_aic3x_init(struct snd_soc_pcm_runtime *rtd)
 			return ret;
 	} else {
 		/* Set up davinci-evm specific audio path audio_map */
-		snd_soc_dapm_add_routes(&card->dapm, audio_map,
+		snd_soc_dapm_add_routes(dapm, audio_map,
 					ARRAY_SIZE(audio_map));
 	}
 
 	/* not connected */
-	snd_soc_dapm_nc_pin(&card->dapm, "MONO_LOUT");
-	snd_soc_dapm_nc_pin(&card->dapm, "HPLCOM");
-	snd_soc_dapm_nc_pin(&card->dapm, "HPRCOM");
+	snd_soc_dapm_disable_pin(dapm, "MONO_LOUT");
+	snd_soc_dapm_disable_pin(dapm, "HPLCOM");
+	snd_soc_dapm_disable_pin(dapm, "HPRCOM");
 
 	return 0;
 }
-- 
2.43.0

