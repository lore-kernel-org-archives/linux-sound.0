Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011017.outbound.protection.outlook.com [52.101.125.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED64220F3E
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821184; cv=fail; b=VoWiTsSPIgP7m7HU0i7kv3KgWadiuFh3SQTAdgJYdRLJZR9I2C/W5Ohv4VQWhwFP/P2TYcqEVKv4bqXqU7LduLiOUSHY73X6lTWZH6+K+1VZ9PjRVTMU9XH9PWVimPlu80aJauPSuq00izPh60Lvl4lB/QIqNFtTZ4okx+95EUs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821184; c=relaxed/simple;
	bh=Txzt8Whc6JrAA6jvYyPuf6ep2VTAZadQG6ULNi7G54A=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=NMpoKHbjzLv8a/jXQBgFGuWBYF1vl2smSi3KVvQPh6GevpL1mJrqaEh5qnWwXBQ3pLQSQTGPBidFpZcFYZJ38VX5XVtAEVbrXvLbIaYHlnxcrC9/5iDjjBwv/tubvZ+wPZ315n7p6lxOvKhg1xov8lzYjQyf/8YpY/BL6+ZfSVs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=n4K5xXTb; arc=fail smtp.client-ip=52.101.125.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="n4K5xXTb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iGyrqpcxLm1oMC1DahF3o6mBv4V7sOk2ZWlWsoJ/gMgStYdqybmW4ag/kk4j9sXZ69vpDlh/cX/Pb65eKcBkLT2GSew56R+vPtbM5xo9ogwAiXyDeHPNRpFZdSHGGGaJloFJGfi4bO9NW57F0dQZXMiBi6eZhpz+p5q+yjmkS8+RYyyPjyoKeATHyfg/EUFmGxVn/fCG1xYmXg2POgTfwoWdGvFpLD1JUM9NJP7bB7Ij6mkJ+6TS/SEC3IpRX4/aVA0IwJpByv32YK58hXS1Bb1tG0hVEf3O/12S+pM1uqevQ6ikpeoFPwxYVpGIIweirkYob6+FAQ4CfRJn6O8brw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=deIOSkafiqsyz75tkKuy8JjAqvbSl54GYlLzJ2Ar10I=;
 b=UjCLDYttjXXQ96CE7CNAFMkdAsMZ6tDOqRPftGy6NJozm+ZizM+cR2+Up9IzUpjbeqwzNGmcnPgp9RmfKseGSR2FcZZ496F+bVpFhOaz6MFuXno7EodFOUp1Pklu6kiP03S2ea13NGRw+qj6dIxJzTr0nvlx97jcsCO5M8KkX19xa7QKI/TZXmoVqR36Wm6mpxgPDk0/At22fA56Dia4RneSVnNispNowLoSfpkpycocei8cmkBw7oldD3e4NaYUpKUtWaLfPyrTQQZrx7Rn1LZg1GPjn0LCmt8l6oDRNNW+rYxFtEs70LbkbkdySh5gAvIBBMW9MWk/eOGZnBWE6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=deIOSkafiqsyz75tkKuy8JjAqvbSl54GYlLzJ2Ar10I=;
 b=n4K5xXTbWnPYfmIUW/e5y4LkmkC7dcNALx7JsBf/CXUC8TM5KxWftMMIJQ0kmMyN23Y7KaI1/Naohow7oETxcRSmnZpcowh54r0VAJVo3umevuE9m3YGdYGzScHh/dJI5l4a6foTJgqsgzDDxPAhWv6MU1q4qs1+FAz6Q1RshGc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB7149.jpnprd01.prod.outlook.com
 (2603:1096:604:137::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:32:58 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:32:58 +0000
Message-ID: <87jyzxwgqt.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 219/292] ASoC: intel: boards: sof_es8336: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:32:58 +0000
X-ClientProxiedBy: TYCP286CA0357.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB7149:EE_
X-MS-Office365-Filtering-Correlation-Id: c1a30b32-db76-4fd5-139b-08de20b9dd2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ospc1KbmZChC9JF19LhNeJYxJOivh16FXC3j/a1Uyiidbq75TWroHeq+ufG7?=
 =?us-ascii?Q?j9RNmYlF0/1Eo/f6qa6AR9sk3iKOV1Jkl3GiYLy5Lt7oZEdUXAArzQD4tPYw?=
 =?us-ascii?Q?W1OMDYgcCfuJmvjSvhm4Y9gKck4C15GwyzABhN5QWrkU/BUr4jqlUZrcFTbx?=
 =?us-ascii?Q?7AwMO0w6xGL6dx7qjV+FCNdIIVcDoNuZ7mfp5TzU1wBDwdl/NNvSa/iLusJI?=
 =?us-ascii?Q?yqDGIgtzDXm4RZpKLVlBj/i1IxHXlefX1UtjGr6Q577ZkmMZZXDfzX6Gt5Qg?=
 =?us-ascii?Q?BZW7G41CXIf+utW3xQQxh+xHBvMZOPdzLlYUPEhhU2JaE5HKw0nzYqFZ+0rD?=
 =?us-ascii?Q?KjyG6rAmc5D4a/NIjcG7sPWb06bx0S8jj2YefoiSFmapTXvDcvLsZL4KXLhm?=
 =?us-ascii?Q?1bLTw83irVUlgwjxXNij15JZoxVLrFAUSDyDuMG1KJYutFW1342J0fyhMAxh?=
 =?us-ascii?Q?CUUX9hFp+1863QaP0MKZQ3faug4DPOCjPWlXB7/Lg9D5fLnjmjR5UZosIBWp?=
 =?us-ascii?Q?PttrP7bAz7WIth1b6b/WCPmqehGhCY6IIWXlQm0gmCv5XHA3RkiJI0dtWwTi?=
 =?us-ascii?Q?PV59ucJjDCvZyO3LXTyQ7GQmJTsSLE3dFfevJWwFsQnzGdM9wyvtzBGHOsca?=
 =?us-ascii?Q?ngLTEHuRuuolUdRvhpYlGxREykwtaObRNVeb3nTJyn9Lc2SanMjvY867OPND?=
 =?us-ascii?Q?qu7IwJslt0GhGuHA66Xblotwypc80y2kOc9/IfACuxrnQAX1VLUo8zCaHPDS?=
 =?us-ascii?Q?0ShOC5h2rwgtFo5hjMxeZlTP9wvMNLgbWShvx+5sXXjJ50qyMNyTK44xsNwv?=
 =?us-ascii?Q?IqYgTbTJvUxDxFf6KJ0MKf4xS22RVdoJMnfz62l3s41o7fwOmCwtMKszKZZ5?=
 =?us-ascii?Q?S+eMkyf3ycczc5l+jm1DsiWrHrRQJtW53v/W/M+V8LocP+vp1MHDgQY3+goW?=
 =?us-ascii?Q?N+eTO8M3C2J0j3tCvEhl4qqrebLbft6ofYL/4JLACurSSzMfHcfT8qTmYLNE?=
 =?us-ascii?Q?k2YI4wFdkcN/O3HMA6QEBFC7f/3TqooUjcS0P+oaRQFn38rvj6iOBmLqobxE?=
 =?us-ascii?Q?S6LHSIY2TfxkaAzxf9mh4Emqz8HtsQAJ3Nb2aQ8Se+hAv9KK013JiPk9Brsn?=
 =?us-ascii?Q?IgrOuPKL7f9ID3lUuiaZvUJZKgXcm28Q6fUmp3xU/2kaVnO5LEx+oDMODYNB?=
 =?us-ascii?Q?IrSq1A3N1p5fRJCnSm44N6R2XvPTjQ74xqhDu9pwlinXU1OuTkitTP17hFoo?=
 =?us-ascii?Q?dzJ65E2td1d6K2Ya6rRdNdzZmMGgSD6h1HrLpyUim6sPLEqnB56pI046Ao0i?=
 =?us-ascii?Q?nZHDUwaZwRrpNthFRKM30XMwyRyYY2LhateLT2BuUdY9y123ld8GZ6k42e8V?=
 =?us-ascii?Q?JemUb9JSKhvkaGWLdcoQyhNUk+2cdjJcO/VC5meGBZkdjqAExHHNOYRDeAmX?=
 =?us-ascii?Q?NMuMnPRR0Hhgjrr3nms6Mk1CINrdUtCq++bgRnwCe1Y+rUhDJ+kOaKqtt5Sa?=
 =?us-ascii?Q?Ckii5/cOxYjZka9BTVIK6xdYz6FH506MV5qZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UE7/CNq/8cKTXDhfEn3yABobP42ooqotudS6DYJksmmkbGmzvrjw3fgUE3tX?=
 =?us-ascii?Q?Na2SbCQufJ9vkHw8GSJ7qpuA348nOCKtvQ7YAG5Rk1KlYvLuXE8hCInRboTU?=
 =?us-ascii?Q?l1uU4PnTwMRhqymJ/ygXdJDUzvwjItpQstjl4k+r+lMB08x9QxdgLKt3kHhJ?=
 =?us-ascii?Q?cRgjLCHEt94B2fUKRx16wkNlVVtmzW2hDPLN36dBNvs/sL+np1GcllDXOPOD?=
 =?us-ascii?Q?akHDj0tQQqnTPzIeMPjIcI3ZSpJPdoJ1fxUMBxDEgBpe5Sm1lNIwws2SpV6U?=
 =?us-ascii?Q?w5wCDDn0i4z3tUj7Tw7CAR6cmZDH5rirPehgWkH20CYKeq7W+M7JJZFnObRf?=
 =?us-ascii?Q?QoJsnOk0XXmx9BWYAmSYwHTP0Nz0sMLsx77wan25xPYe6jG7cvZ7r5s0pkZD?=
 =?us-ascii?Q?2PY0U+yj/AE5Ha1KYuEJ/0lQMneCNfOwhVh2M1stLj6UI4Qd/uZbHJySH/8q?=
 =?us-ascii?Q?ACTj/tClNKM3xkglmdJF4cy3pkUwS9BAabXPGqnZ0qaIspwq1SCqHQMgB6Aa?=
 =?us-ascii?Q?FjpDybsmMCZ+UTq1BamVRYvAtnpWCLukzWo9/AO+bE1UimEPkHt+6NPeyZjc?=
 =?us-ascii?Q?CXg+Noq3LAkuluv7FpP50zTUzOOaOTqqDi75CKPmshspxwOPSarl7dxgNbSj?=
 =?us-ascii?Q?TMQUR9lgh2F3DTUrQv6cZ8ke5dIQxho1eoVbFP/RLTZPjUBoEH4XhJG7Jf9t?=
 =?us-ascii?Q?ZJSkdoQF0sbk8qdgnVY1iLTuWtHSZS/vvav6Dva1uA5Cfk8fWOXmtqwmzOWP?=
 =?us-ascii?Q?Ni35/viBiIqUL571j8SeFWkkZ2zbOknQXKslnXtBKREQPwGLdkYCBPMpDmW4?=
 =?us-ascii?Q?GcEAvb2viuar9BHsFJ+hazYRnOvmAt3KVmRQRZcNQplaDKo3OB2o64JJJWNx?=
 =?us-ascii?Q?pWQ152D7coBT3mruv1DRszrB+xopFvxNl+/D2u3unfQcaqPv2WDdoJ5WJbLo?=
 =?us-ascii?Q?1m/FdjMUCpTaHKioTvaaEHkC1+hiC1uDVHnf7ZXLOp70orCOOwIxPul0VdRu?=
 =?us-ascii?Q?w4wooMOfWcVlCfOsrBFBg5b32ZHlF2K+oIcHF18HG3aGbHIP3+DP1fxbI1Tz?=
 =?us-ascii?Q?4qqWaDM4Cjs1qiojc9ka2TnnQcp10VFbWSYUFWHdPiMEQwSB/ZTtBG6hYLmK?=
 =?us-ascii?Q?nwaXpp8sTpasOHCyr583exArJ8K3cVG6cZEwQk13pz/eAtBu9G9QqY5M+Go6?=
 =?us-ascii?Q?WWHu80Nuvn1yWjtDFGjX4Th6eC4Y3yZyHvdd5O+F0ibo4XmYW/VoNSaVORm/?=
 =?us-ascii?Q?1xybOAr9D5p6Ay2n9fkk3tBWVXytH1AfQBfHRBDPX6AEDSwR806ikJXSixlG?=
 =?us-ascii?Q?m2e15h1h8bCxKsyjrLjiB42Bgwyz1KltjqgL8Dpg49EwiUv2YUCaxiPVyms/?=
 =?us-ascii?Q?UMkrNoqRr3vO6Y47+UhdT/txjoOSiXsBFONbheu0GXZJMLza0dY5USB4pNmX?=
 =?us-ascii?Q?O46FoNCpl10xDwG6QhUhaqA7DEa68f5W+h6VsZF2Gy+uZyhToiNEoD7ztyIB?=
 =?us-ascii?Q?OoqNrUF4Ve8vt0kA0SZ5Hzprc/FY0a3+UsokFE2d+sonN6/dm4FkWwTiak7B?=
 =?us-ascii?Q?3kAfISqyHnzjgQ0dbFsopwTMjVL8wXcCNsb7u5FkAeU2dFJMFo/8Hqo7WSrF?=
 =?us-ascii?Q?/u6gIWeNA6BEiFJ2JRjoMJU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1a30b32-db76-4fd5-139b-08de20b9dd2e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:32:58.6591
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iSrsfy3Mt8Os+ljNKJPVKC78VNa1gjcW1YYNuzTfBE7sY+y96tYFwkWFx95YdbICU3hSMXY0tdtOshpX8tsKH4lQeQcdqSZd0H3ceKUaEcaFX0HhM1lTX6YDOzaPLxBw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7149

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
 sound/soc/intel/boards/sof_es8336.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/sound/soc/intel/boards/sof_es8336.c b/sound/soc/intel/boards/sof_es8336.c
index 41b7545581e02..774fff58d51b9 100644
--- a/sound/soc/intel/boards/sof_es8336.c
+++ b/sound/soc/intel/boards/sof_es8336.c
@@ -155,7 +155,7 @@ static int sof_8336_trigger(struct snd_pcm_substream *substream, int cmd)
 static int sof_es8316_speaker_power_event(struct snd_soc_dapm_widget *w,
 					  struct snd_kcontrol *kcontrol, int event)
 {
-	struct snd_soc_card *card = w->dapm->card;
+	struct snd_soc_card *card = snd_soc_dapm_to_card(w->dapm);
 	struct sof_es8336_private *priv = snd_soc_card_get_drvdata(card);
 
 	if (priv->speaker_en == !SND_SOC_DAPM_EVENT_ON(event))
@@ -231,16 +231,17 @@ static struct snd_soc_jack_pin sof_es8316_jack_pins[] = {
 static int dmic_init(struct snd_soc_pcm_runtime *runtime)
 {
 	struct snd_soc_card *card = runtime->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	int ret;
 
-	ret = snd_soc_dapm_new_controls(&card->dapm, dmic_widgets,
+	ret = snd_soc_dapm_new_controls(dapm, dmic_widgets,
 					ARRAY_SIZE(dmic_widgets));
 	if (ret) {
 		dev_err(card->dev, "DMic widget addition failed: %d\n", ret);
 		return ret;
 	}
 
-	ret = snd_soc_dapm_add_routes(&card->dapm, dmic_map,
+	ret = snd_soc_dapm_add_routes(dapm, dmic_map,
 				      ARRAY_SIZE(dmic_map));
 	if (ret)
 		dev_err(card->dev, "DMic map addition failed: %d\n", ret);
@@ -271,12 +272,13 @@ static int sof_es8316_init(struct snd_soc_pcm_runtime *runtime)
 {
 	struct snd_soc_component *codec = snd_soc_rtd_to_codec(runtime, 0)->component;
 	struct snd_soc_card *card = runtime->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	struct sof_es8336_private *priv = snd_soc_card_get_drvdata(card);
 	const struct snd_soc_dapm_route *custom_map;
 	int num_routes;
 	int ret;
 
-	card->dapm.idle_bias = false;
+	snd_soc_dapm_set_idle_bias(dapm, false);
 
 	if (quirk & SOC_ES8336_HEADSET_MIC1) {
 		custom_map = sof_es8316_headset_mic1_map;
@@ -286,7 +288,7 @@ static int sof_es8316_init(struct snd_soc_pcm_runtime *runtime)
 		num_routes = ARRAY_SIZE(sof_es8316_headset_mic2_map);
 	}
 
-	ret = snd_soc_dapm_add_routes(&card->dapm, custom_map, num_routes);
+	ret = snd_soc_dapm_add_routes(dapm, custom_map, num_routes);
 	if (ret)
 		return ret;
 
-- 
2.43.0

