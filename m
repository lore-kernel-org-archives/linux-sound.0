Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010008.outbound.protection.outlook.com [52.101.228.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FFA71A2545
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820737; cv=fail; b=iPdg2n1LIohlZEgxc2DAN5N3GmcKXRqvkvoCnp7o4KPTr5+TFYABrpJhaJtfzOL/pcvBlqv4SoGcUMdcFMZIurQSEq+t1uBDaGpHC5CgsaBSjTWydME0PQF96f0lH30CX6CJCzPNliwZ3dXsHAax3CAvZSW+Ik85RGVpn2nYVQE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820737; c=relaxed/simple;
	bh=+FwSAMtziVrQuvBn35j9+edvoXSVDCDWngyYycJfQQI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=qDK37CMYxZzuWrnBhAD1PzRPlqRW/PspStadgZwxOYDE4sZDH194cq/v5Xd9EToGsvQhOyL3giAiUe/d60xVuY/gQkL5p5EQNcmwoRAtVNfvnheWx4i01XbtLxUOlXIL9ZpDn+IposgI0tGiBDS4EFPYgfQnt3UyRShQNOsVL3k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=XANqSTB+; arc=fail smtp.client-ip=52.101.228.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="XANqSTB+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eKBdtievdQBZD8zFEHGn4EBm0CMsgG11kOdFK1+vYAzfP2VfE4R/68WEhw1l5jwtss8lNw42yFGgKHT4fWbEORoovaXhqvxSCFJOxizZIUgeZo94Mk2/BFy+Guhrt4q6uz95v7hxYj+amExtD3x6gDlb+sF89ckhbIqRN4muwX2kdt/WQXPh6PLBrZgUuEdjFaPCo8ozeEvIsrTuB8plrDZWiv/8jNyPfi/W/dpUtbohF6JyXBmE6JY6xwtkzoT3BbGILDe8+/m3gCo4nOXGTH8LGVaj51kt4A8YzwELLbCoLHKEXi//MzlxNeBpcAR2yzUZDjFOeNvYyS3zExMpPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kQY8FZZXXaHHd7w7h+2nxrqFz2/WF4Il2Oq2QHbn1bY=;
 b=vtdAlNdOmpdae4nriOWpMkbHIpT0FUhk7s7b3G6/aZcKFspzvIfgBqncN/oZ29SuhikKV0eA0r7oySy8alOi2JOiLx+g0N2umUxOYl5damgZdkKn14MDqzP9M8U/L8RL7371KTxFOje1ORju6LpL0eAGstYNXnMtoSpSxlXkyheCvKlKD9reSlg9qeQ2KUJFGhyyMAkbCXOUnVMlQturONOrSMz/QwZvVWa/wsloWIKl/Ge27jZ9w6AO0j62tUrL47EI94tZ9vTNhpPyFmoTC8vK89mbho2rFsLJUa+DkesrLrIfrCp9vpJlR8OJR25hEIn1fCzCIKj3SyysFAR+iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kQY8FZZXXaHHd7w7h+2nxrqFz2/WF4Il2Oq2QHbn1bY=;
 b=XANqSTB+QVdfu4fWCcxUPnVqfiQFj6IfQ+GsbUF+7AMqVVfsv9oPkGgkqb6XS6XyrbzBwHJJ9gd/DTbSiEFG8WxSCL9CzG7iEr9ijI2evuIrp8YZ+Z+6BGmpRwUid1ZYCCArbKVcYC7dAhnVOjAwimZMcU95K7MT8dKO8BZRfpI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB14439.jpnprd01.prod.outlook.com
 (2603:1096:604:3a6::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:25:33 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:25:33 +0000
Message-ID: <87o6p92z5v.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 116/292] ASoC: codecs: rt5677: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:25:33 +0000
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
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB14439:EE_
X-MS-Office365-Filtering-Correlation-Id: 54f560b1-5015-4119-5845-08de20b8d3b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GRBnkbTZX82T64Svt5Ht23wdWHj1yIoEykGxJf+0079ze2y0AjlxL0pFYCYj?=
 =?us-ascii?Q?43/aP/aglg+zJ58dCUOxw0yNzIVuBAB/c43pb52cwSlua0MXZq+V9q0LFUCe?=
 =?us-ascii?Q?WOdyjBdGOa+D/bL63gqN/UYcyzQw+okoE8uIxPUFV8cOkh7uDkAmVWTdrfCT?=
 =?us-ascii?Q?ufFXm8o/HVM7aamHRElgrauMu9QrosGk8enKiL5QJGlxXuBpdbXbOekQPrNc?=
 =?us-ascii?Q?q47Qwluvum2yxoIkej2SVe81vnkq5DbI9VfcjCddpOiM8f3PTGTA2w1FKAF0?=
 =?us-ascii?Q?sAypbOHgNupxQyvIrsZ5lC0GqqL7XWMn6DhJCkrZkgelIzL09nTe504RWjPn?=
 =?us-ascii?Q?ntPVMgAu22MyMAdPoOVoytQQxxyPJskp+TlIiwZHMIiKo7JadoNtCw8KYo2F?=
 =?us-ascii?Q?+NL3BqA7gwUAh+aoDITWtYBBQmadua+cszbYjZdQrudv1fveTNVqsImo7GpP?=
 =?us-ascii?Q?QAe7uLXDTpQdCXzgnLsgRP1m618l7S64LmjDTZDrOq7MvUrILp0VVEpXBX5k?=
 =?us-ascii?Q?0yGdaaumZclFkCSc+JEgNkY86ox0hezaJzwYEHD85fl8mumTEpLyxoio/8ts?=
 =?us-ascii?Q?DJWX5gdb9Kg2N8OhXlJzHYHlUT3w9pQqAERKHsyYIFS+O9OlVR3UzwRu2iJ+?=
 =?us-ascii?Q?NrIPTAVAkyOGn1A+O1zeyUqRuP2rSbumuG7OiUp3a6S32fak3KpcTw/dfQ/l?=
 =?us-ascii?Q?jntRr8150n+cOhKfE/faU1KE8TQuLCaiF/g+Ww0HpZBGXOCAkdKksmsdEFf0?=
 =?us-ascii?Q?8k0HDJM/6T7lPgfjvrpH0eKKBELOANsprcRiuQsl0tyVcO7o0su+W2bZxEHz?=
 =?us-ascii?Q?BHWNEasUx2sCzYxnFDwFq2zzMVxlLRMzp6YzHhn/0woFc7sQJTVZp1qXky+z?=
 =?us-ascii?Q?6rm8sbp+1AconGZIBvvuC4PPxWqmI/S9k2VcDHfo0RzJ9oheUMQd0TDPD3dr?=
 =?us-ascii?Q?Sm1FlqlCBbxs2Yt64wgBwJTHDh/gDXC/4JteKqTqYN0lqqLIFz+R/uqThfLr?=
 =?us-ascii?Q?fZnX4kMaXtGRcB+4GeGINBXnWKQkdW7CwEugHoF7P8jbwb+AKFKIVy6KefIk?=
 =?us-ascii?Q?QDcMul7PaIz6FVD39HgeypWbyPwQJm9WkamLVnHPzzJ07XN6gYnJXFQ8gWMa?=
 =?us-ascii?Q?iURZf01qHTeFod64ffUbGEnC3dbYLMChK5Ai6RUhWihVp4KZInYyDp+2dTEK?=
 =?us-ascii?Q?NyPHMHASPa8VwQqxM85u8VlBlnj7xqErIBIeqBHzfWZVtRfUTy/ivlkGXiVh?=
 =?us-ascii?Q?JXhhMXKINAS0eea4HXQu1WmpS69KLmjZb1h20S5wKyggi6y3pV9pX2ISGqxH?=
 =?us-ascii?Q?3WZmwto2Y+uOw56KjUviaCzF2SRXzheFLCvCSk1FxB2JoaG66wF+m1qYHZzj?=
 =?us-ascii?Q?l7Y44yScESYYp+j+HNrJy4LI62x1uVUIDMYM6UkwF4pK02QOebf3kG+WiU2F?=
 =?us-ascii?Q?gzWvFQVsDm5/AhZXCQ9Sldfj+5qK6GQX0KAqP+NBgiY5U2VjSKLbNWihwsda?=
 =?us-ascii?Q?BN5Yh6c7z83LEm1u003Ts9OrQrH+KON6CE/0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Y0BEnc0u+s+pHsLSKRrbEsUjPwXniQYFWiTgHSyoBsOuYmPghnqZ7O3IdhfY?=
 =?us-ascii?Q?Kvb7PeH5c4Q+AHqeKZbcU/1YgXhJmX5RdOK+Sz2ym7/slyRh2ZfbMDe43wB8?=
 =?us-ascii?Q?yyXomNPDxm4h0Gz1PqJqm3YDe1GsY8xRjucJ/yXhmLU4XgI+RULsN6ybg/0T?=
 =?us-ascii?Q?5RrOwByIkwuN1ben908sYcBbEPUV/MYIwUi2LSsB2kWzZ8v0yKsXTTm11L0d?=
 =?us-ascii?Q?yFy9/xFgzvwR8Ntr918kBS8Htcx65fl71FZIjoxzzG75UmvERU0nD+DKCwjt?=
 =?us-ascii?Q?lOgeFdk+ginBa4a+QDn8EkeawZ8TiYta4MLlATeJN8+gH4b1fDCESAgqL1T6?=
 =?us-ascii?Q?mj6wk1rv9dXT7GLEnET9rvf5xBRBr47sca6tF4px9LLAB2+d2dEMkbL4SYjU?=
 =?us-ascii?Q?UYS5MtkrKEzypfvL5VBUP4WaeZXckz85zb0KAADIO4fmtaF8Zip1KFKqAe87?=
 =?us-ascii?Q?vygDcEWnLKcnjG5uD9Ke9Hvmq3pF9s70Jx7IkVvAA3k61FZG7o6YyMILLck5?=
 =?us-ascii?Q?/PNDZT4HUpPFyVzp+tL9XHuZO3QIpNga+eCJ8MR2mgQbU2CLUyeYjK1ma0N2?=
 =?us-ascii?Q?gq+J3hzzfNRU4d/+p4P/NSvKd7/KEFWfmhBrvthfzbXoMA8abzgORL+dqp0W?=
 =?us-ascii?Q?0eVjJX7R5yZYO8KO/UfoolEJTokqhXsIl/FzaBeQk7pSBJSArdP+p3am733j?=
 =?us-ascii?Q?Fdw3v1iJ6EP7RSorPEHlSKogE86JfZVnYdKsMObgtD3Cw4y7axMOXYoZEmj8?=
 =?us-ascii?Q?QQ3HE9pwxdI3k0A0hjvlALrEkK54xfmVkoXF24FwEDdk7U+6Gyd9t3GTr561?=
 =?us-ascii?Q?liZ7YKou0sRlnuuseqlfxafyY03FxmCJ+e9B/lhmVrGM9MXVUROeY+LmsB2o?=
 =?us-ascii?Q?mHXGUS4HuP6bMjNfo/Q++M/Aus87ojP+/gJE3rDPLgGmLfQN+KPqCBziI6ry?=
 =?us-ascii?Q?oCCT9uq7bBxCI+aeRNOqDKXBCiNQ34FGfBZZekqUkyW2A/3sEZx7Y5h8WQOI?=
 =?us-ascii?Q?AEHpJM/LtE5+fPYcXcO+X+Z7FuUdWq3NrWQyLV5LydJSKhw5hKpLgau8JAVN?=
 =?us-ascii?Q?Xh1oEAP5WTJhgtS1ju9jfVL+S2V+EV5Ric+haPm94Ud5ZoHN5YY1JSbQQb7b?=
 =?us-ascii?Q?V1N6j9YLa43xrt5DMjmxxzQjs2Xmg1p8ALKbmlDg0B8ZTzbJgjB1ZiUDxP7e?=
 =?us-ascii?Q?yYOv8M0IS/eBdcfUKCM7SyQxJrC+vLdVKnLgVAiEdnFB2/rXG7nNHuMeSpgD?=
 =?us-ascii?Q?23cEYbCiE4P5dm/UbytA6+8DCUl06oMg1nTZX0EXlfnAgnFO6Ch+nSW65Ij6?=
 =?us-ascii?Q?92m5y/9cpH/r3tbDS1Tue1nfPV03LclvaFYqX1CAsQr5U4c/u8e90ER2qsjk?=
 =?us-ascii?Q?1aq/9eyzreDf35ijzlIVQBG2mP7qNUQFZXSVfeUGlSP4mnv9ZcyqYnYsCNqv?=
 =?us-ascii?Q?9fEs2x95vUgHO7I1GxUfEsZ2wGaGISrAfFgEXPqzCyk3ZtRLFOvYNPaW7EeJ?=
 =?us-ascii?Q?p5Kzoq0nxT3AUq6XTeQlmZuLa6rNdK8YictiKKf6c1wRIm1HZ/vQsoQPWrAW?=
 =?us-ascii?Q?0KkHYSeP8XLi0M0XfM1H2ZxYa8UoCiuYUvn/b/X9BdMKPJBEfl1fZ+bcP5gM?=
 =?us-ascii?Q?+igjaiBO7ru0DwnrLylLXk0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54f560b1-5015-4119-5845-08de20b8d3b1
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:25:33.2674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +HuTVwYoSNbDYZJ/cupmdLhL9qZcNUKXgYzcq4KKNfqHZadqQe62Gv3Yk8jkfzHHr9GP+RimLtY4MQFofLbEkvjwJ7fldm484fZW0Yp49jnsGfs48zrBkraU8tLDHgXF
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
 sound/soc/codecs/rt5677.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
index 6b6c690a9e455..d46385249867b 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -706,8 +706,7 @@ static void rt5677_set_dsp_mode(struct rt5677_priv *rt5677, bool on)
 
 static unsigned int rt5677_set_vad_source(struct rt5677_priv *rt5677)
 {
-	struct snd_soc_dapm_context *dapm =
-			snd_soc_component_get_dapm(rt5677->component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(rt5677->component);
 	/* Force dapm to sync before we enable the
 	 * DSP to prevent write corruption
 	 */
@@ -2733,11 +2732,12 @@ static int rt5677_vref_event(struct snd_soc_dapm_widget *w,
 	struct snd_kcontrol *kcontrol, int event)
 {
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct rt5677_priv *rt5677 = snd_soc_component_get_drvdata(component);
 
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
-		if (snd_soc_component_get_bias_level(component) != SND_SOC_BIAS_ON &&
+		if (snd_soc_dapm_get_bias_level(dapm) != SND_SOC_BIAS_ON &&
 			!rt5677->is_vref_slow) {
 			mdelay(20);
 			regmap_update_bits(rt5677->regmap, RT5677_PWR_ANLG1,
@@ -4643,8 +4643,8 @@ static int rt5677_set_bias_level(struct snd_soc_component *component,
 			enum snd_soc_bias_level level)
 {
 	struct rt5677_priv *rt5677 = snd_soc_component_get_drvdata(component);
-	enum snd_soc_bias_level prev_bias =
-		snd_soc_component_get_bias_level(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
+	enum snd_soc_bias_level prev_bias = snd_soc_dapm_get_bias_level(dapm);
 
 	switch (level) {
 	case SND_SOC_BIAS_ON:
@@ -4880,7 +4880,7 @@ static void rt5677_free_gpio(struct i2c_client *i2c)
 
 static int rt5677_probe(struct snd_soc_component *component)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct rt5677_priv *rt5677 = snd_soc_component_get_drvdata(component);
 	int i;
 
@@ -4896,7 +4896,7 @@ static int rt5677_probe(struct snd_soc_component *component)
 			ARRAY_SIZE(rt5677_dmic2_clk_1));
 	}
 
-	snd_soc_component_force_bias_level(component, SND_SOC_BIAS_OFF);
+	snd_soc_dapm_force_bias_level(dapm, SND_SOC_BIAS_OFF);
 
 	regmap_update_bits(rt5677->regmap, RT5677_DIG_MISC,
 			~RT5677_IRQ_DEBOUNCE_SEL_MASK, 0x0020);
-- 
2.43.0

