Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011028.outbound.protection.outlook.com [40.107.74.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25EE41D6DB5
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821100; cv=fail; b=oRaayMN+ilaOLLh29KNj/o5zLQNlDhYDY3KqPg4NOUdlh5SFCW3BT7QCKmkWkfnJmps/EGD6BJ3xCkCHXs9BgFIGzMjyL31amccn2BPcPK17QC2z/75mDKuhcOFYqOg7TEiWwK5xcHi4VrvWsU03d9UsGVf2B40HroNGEsdXyWw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821100; c=relaxed/simple;
	bh=NKzy2FcIZ5KSBwuiMyq239IA2euWoxQTxoj88Va67fQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=N0E6FfpugzIzCtWBZUSxqfwDY675pwcOGf47N+hTpxMupNmcaBvml96oHzBlrS0S0w4KLYUPw5nvHs+E/iXpC2ryLwlUyesadA1gOQcvW0VyEkfC6zGwkXKfeNW6vLAvB1SA/cMBwvPtltfPss+sEagmWJGZu6Sr9mdFVZOs/cQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=IItsfu6t; arc=fail smtp.client-ip=40.107.74.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="IItsfu6t"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BlAKGtlHOITvou6lt4Jhqzg7v2gZ1/JbCXj9tzUxvNuysVwdsMlBbce+ob1QDIEJI5LnFT/8+9H0WREwfbI5J6Yq8/QN42MNHjUH1r+O9czzHvfW0U4+Qh6z2VoHmS24olbkx8uLXyJLFPpE9cE8bC7hNlBH56SBcIbP2sGLI01A0Lm5hLZly8YqzRefebycgqWS5NTCgw2PyBgb7daNSoqeb2eFogSsb2s+ZHMZX2lpPOUsy8n4UMa0VfUSbU6Wu8Mt1DUjHMft7hW89g+oJS8i3zOGACoG2tfFZ6UNylTVIqrleXX7Rh6j0+ADgQ/o6PMzuBk3FDsLFW62ZtytHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yeZUm2zoWJeFc9ozmPl6KjkoXReHjyxdyt4B75qygqI=;
 b=PiLgFaa8heorZVwLmco5KbTrN7mDJyqE31+lOe6TUuUqQNodaV76a1l50Nyem5xC9R1JXvjrQMek8bYO0/h9o+NlNR794kjHmWZ891sOgVTtrN5bB7wMgWyT4sjgis486bhX1fhVAUf7mxiHMir4j2bahF/rvOZwxiG0MDTYgqNZeH5Yyh8YVcWXWmekv23ZbXtiumZR/wrUY4Sf3oYH8HWW3i+hZdzWGxSZaorotzIq6PyfpWqfBA3CIwDgz09AnUDyhFzkMJ9+HULwlUVISFcVKjvgI/+VXTgg6oQv4jxN7f/qhS1EdedKMK0bqQIDx4uHz/kNUh7gkmYcfYv/PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yeZUm2zoWJeFc9ozmPl6KjkoXReHjyxdyt4B75qygqI=;
 b=IItsfu6tQf2/+XOYxSxYDSwsMQQNHRuMfka6ZPV0OXwCLWi+omko7mAAi/9Qp2r7FusLVTUHls9CD+xrzxdPotcZwQGkJR+D69S0yfloUjT2dKSXnRaZj3065rn2jYmQKbEbg9EuzV5rBH/kA4NiZ9ZrF19rsdgTpfQUr6N7lko=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB9810.jpnprd01.prod.outlook.com
 (2603:1096:400:222::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:31:35 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:31:35 +0000
Message-ID: <875xbhxvdl.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 204/292] ASoC: intel: avs: rt5640: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:31:34 +0000
X-ClientProxiedBy: TYCP301CA0016.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB9810:EE_
X-MS-Office365-Filtering-Correlation-Id: 3846647c-6f7a-4820-4167-08de20b9ab5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kiIbUjxRQo3h3aXYsivRm4slRJYqdS7t29T3hWkEo2bNHJR4lTo42nt00Ums?=
 =?us-ascii?Q?TVghhBFmCJfsjmG+ple53F+E8wXQXvcFAPdVJmVlnz7Tid0tYe64pfggn3Ib?=
 =?us-ascii?Q?1IsSrSVVanisL7Ms6LoccjB8Q4OYlpmetVGbuSeWrn8MJhh5OZm8wPIf5J4H?=
 =?us-ascii?Q?9abGQmpch+8U2R2EmJBguTJks/xiRVswWr+tYihyD/SevLJ3I7AtwWrIIWRh?=
 =?us-ascii?Q?3a97ziZTxcp8yd4Yvc0YUjizmfpSVUq0zTA8b2j5AwT+4waqLhJJ5tEeFahW?=
 =?us-ascii?Q?ZPi/KAbFTo7iENR2bbA8nd43zzd0uall46MNM0jkUSZ3wvt7UMf+jJByoeRx?=
 =?us-ascii?Q?XW+Ics6cTvcethueCkjOLsag0LxazFT3Smg3YTkyb3xlhxzlg5XGSvyJqUGp?=
 =?us-ascii?Q?a30mOEnfKn9qZX1ssYESdtQebZ008hG7RXHwrYLijxioWezwi6sub/R8kNro?=
 =?us-ascii?Q?bqoyjhXLF7kIXJU0Gs+oUAIzXv4Q47wtjYVAl1yAWNzF/OzWBKjvhk5WTtXG?=
 =?us-ascii?Q?jrHbDXepmqZPCJgcI/jFiFZo75Lr+mljves6WF8YlPv1Up9xv74KtU3p4J1y?=
 =?us-ascii?Q?VVwvNhJAEVK1dlzU87AGHC6e6ma+ZI9Iv1HpcNahglrpfgPgbTsiB64cYBoa?=
 =?us-ascii?Q?bUAv6Zf8aVrAl+7h3YOW2MOH/62R2Z8ygN2s48eR6iHcTtvUEPhILgINoly2?=
 =?us-ascii?Q?0m9JnSMBFDtwa1Qob2Pm41vKi4uVeztgNjJQuQOXnlIPpqi80huUE3OyAu31?=
 =?us-ascii?Q?qRBnJLi6aVTQx/mzW9dSge9X06LR5PV2NIMMpu5UWVLa3QVmtYDhb42TpdbC?=
 =?us-ascii?Q?zm4Zh5FAJ40XomNovz7zRIKxOPpfhTeEeoPRRyhIukCP2yTgqDHFo+o0pSgU?=
 =?us-ascii?Q?2wewQF8su50FENYPWlfg2Rsrq+z0YB5XVAtL/ASElpwiMtcFLrqE71IeN6zw?=
 =?us-ascii?Q?3NerdliKMgDKVY4r1fD4SAVIHQoY3t/doplfpEY+j/jCJC2XI1CpBYZ7lBg8?=
 =?us-ascii?Q?0PyzzEaVQdayGxA//m/D9aRnA/vtx4Z2CsT3Z4lMoqFZzkj++my+DvfxweD1?=
 =?us-ascii?Q?17scMdAX6ddqUwEEDGeiN0tSsEmhEL4JaMPRptE7t9Qi/t3BpsclGC8I53Wl?=
 =?us-ascii?Q?BA8Foe7LhUqdEChCnZsLpnLA6vpI02bFbBP7LZNLHxoLUXlrO1jU4nBMiQQ8?=
 =?us-ascii?Q?dqcVnH5nL/JrV2KJsYEAxrMKoAkWWScxWan+IdtZAphD06940yEU1UWtAuX+?=
 =?us-ascii?Q?3sOpM4Qy2zxgRSDjH4kmjlWhnkLitLGK4lbXNRPJT+gN4pP/hSaXLm//thDM?=
 =?us-ascii?Q?kjx4X/9xCGMaT9m4fmlwpJ8xcmEa3tuagysjaIPatIV9I1iDRqDtr5bmsOx4?=
 =?us-ascii?Q?X4IG61+g69doIr0vbFgJ/WG+dJljNe7nKarJQIwfUzIfVXB4nQ+x9+31IbFP?=
 =?us-ascii?Q?CskSJ0ohP3Niv5cwhfIQTh9ave4jfMfzHBxLggWjmBea+gO7fDqrwbRbGGhz?=
 =?us-ascii?Q?wMJxnTVIFMQrlpWhK53BSC54UKsVGpgZXJ/G?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bPqGSC5mYPP37B0Gkc7aFwbagMvN4Sd5o5efkz0xe8ZNzK0casUkq3agRj3/?=
 =?us-ascii?Q?uwHsUcuMXjUMDKJiI1dHfQ4tWWId+vdUCAaY2ouIDxc68p731PDkZVz2ZLjw?=
 =?us-ascii?Q?APqu6nH9uh+xj9JqBD5EppKfsc+TXUKzUzUs6sA4rjVSlKEP51YYof9Qdobf?=
 =?us-ascii?Q?Yko8BRfFH+SQXW1dfsnqUTfrK1xO9Tnsxs5ZX78rMlyLwX4smyCYs459kMxi?=
 =?us-ascii?Q?OXL8496cpKMZdTtibK/4W992uIpGqEuTwPskxZRcm5mTBcTb/5UcgX27lDua?=
 =?us-ascii?Q?iOKUkjrSbwaWVeT8DmkcueMyDkNTRrcUxO6aNuzmSlQ6QT0Ea5szk9ZoFg/s?=
 =?us-ascii?Q?V5DQpDgY/aEQM7KZCXwE93UhCbcAybbJB0pZ2suAYuLUqJnDmadyBqxnJ8pn?=
 =?us-ascii?Q?z94b1M17ozIDKRlgeZ5VKnPX8ipafXMXfAH+iQDBivMDHHf9/Qft8dmbWT5H?=
 =?us-ascii?Q?6nyNz4a7Opd1/Wh2dlgMuQygdpi+dPAKqxTs+DQPxz/5IiahnEFOHbdEoEOS?=
 =?us-ascii?Q?dxOjil8GWCinjXpAkCBvLBCOrTQDL1HbWy97ristB2AKdHqYo4fzOvscuGWq?=
 =?us-ascii?Q?/5Qc5DgnMz1qRJ2+Mu6mCQ9dn+oYZtjf9QL3xsIg+wJHgVWFYu93Ir9fdXbp?=
 =?us-ascii?Q?Vi1HkYRWPr2K0tRTwFcDIJeoOLE1WVIsQo1RU0qrY6feKAd1+W+LRCMnNjhI?=
 =?us-ascii?Q?5gmz2jSkoubNBBC/dsd1adjvxMYjqJVVg56hK+7141PxC5GzrMdPWqf9xNZ7?=
 =?us-ascii?Q?aAWESx4Ib2m8gWbsGG1SptJ9PhKCDqbz6OP/6+Hd8QNCBaOHoJvKU5adCuT7?=
 =?us-ascii?Q?ApK8mRgcSNwWvJmfldKOcaHBdbVJvKjIz65h8h4tNuxktrpO0sSK4RhjpOz6?=
 =?us-ascii?Q?9uGHPm5Fk4xHs7zPyzOKxDH+fL6ek+eFTwotlb/wyVKL5zwLl0SNbG/SgQhR?=
 =?us-ascii?Q?GPcx4dsw6MrikwZ1Cq+U2LHXd1SmrpFWAjyWw/C28EpGQcjQZJINylaYKm39?=
 =?us-ascii?Q?7KOb9gyM3GIfgX+Heu0KuV1gCuhCn1dXgu4i8eQCuSKPGq3l4nTRfOJv9yKU?=
 =?us-ascii?Q?Pins33qVsLWeM0h9BPL5Pr1Zjm8if1HgA4H08YYlNYZgB7T8YwUAiDtiZAsW?=
 =?us-ascii?Q?fiErD3ZjCYVScQ3u3Zs0P0/iDmoxKyFI19GM/gktFtZqimz/eKDVMKwkcKYV?=
 =?us-ascii?Q?eYEGEquOyyQ+IkdEi/kOJR0FWHSfL0g+YqHS33wnnuaGv45NTeOLD2mloGrS?=
 =?us-ascii?Q?MlTP1C0qNX3XDH1cF9PyBKY0wzoAkioZSot0mmvCMHCZ7+ZSp2ay1vyzQelq?=
 =?us-ascii?Q?KoLf9IMhAWrkpMB1u9iaNnHDVLvLpnlm0SNzKqK1q8EkyRTkqYRlfQQQWAF2?=
 =?us-ascii?Q?3LWjGX3uQgVOdslzbQalJ8xLgNPhPptJICpAwy8L6rb/4gGkt4kZXHsja3zi?=
 =?us-ascii?Q?ENaxoO7HISm5pNpv3khwZh8o5K7NbGCC0lrefAkSfoufFlj+nVjaI2l64Hn1?=
 =?us-ascii?Q?jtUy9E42d7RLTOIjWNx62dKt7SOWGko/oTcG0GvnaSENfGBrV+BjKRMxZccA?=
 =?us-ascii?Q?p6apMJ1RzsHmIgRWQK7jyYzc5F7I7cFB0QinINmBS4/3hxDvxtXT5rdz9nFA?=
 =?us-ascii?Q?V/AXfpyJ8/1bA/5OVSZJjuk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3846647c-6f7a-4820-4167-08de20b9ab5c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:31:35.0309
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jTTsgvDLwx2YT0BJgMc3ac7nCgwp3RfLVrzDHKTEwr8ehZIBMt1L4JPTlcoZ38Ze3pleadv1AbG29VcdN5rQ/Vglw41uNbCCEL+BgWbxZSXJhGIDE3N8H7Qv7+YAM9dZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9810

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
 sound/soc/intel/avs/boards/rt5640.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/boards/rt5640.c b/sound/soc/intel/avs/boards/rt5640.c
index 97d1fa944188f..2990d32f23017 100644
--- a/sound/soc/intel/avs/boards/rt5640.c
+++ b/sound/soc/intel/avs/boards/rt5640.c
@@ -50,6 +50,7 @@ static int avs_rt5640_codec_init(struct snd_soc_pcm_runtime *runtime)
 {
 	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(runtime, 0);
 	struct snd_soc_card *card = runtime->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	struct snd_soc_jack_pin *pins;
 	struct snd_soc_jack *jack;
 	int num_pins, ret;
@@ -67,7 +68,7 @@ static int avs_rt5640_codec_init(struct snd_soc_pcm_runtime *runtime)
 		return ret;
 
 	snd_soc_component_set_jack(codec_dai->component, jack, NULL);
-	card->dapm.idle_bias = false;
+	snd_soc_dapm_set_idle_bias(dapm, false);
 
 	return 0;
 }
-- 
2.43.0

