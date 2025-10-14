Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010004.outbound.protection.outlook.com [52.101.229.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BED262D14
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415571; cv=fail; b=kU8cnD52YG/ghhwOe8MNXgQrZdRjqZiWygrbxN7vYr1qtP8RirwXyLnn80Tspt97JRG4nYC0dTXMdOaeiMNuPmig/xkN+d3ze82Dn9C6jh08ulQw2W9ZGwCLbQmk0hDRshW3axGaFYCaSL8WB9Dtp2ZGayChBaeCPCFpf/zvY0E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415571; c=relaxed/simple;
	bh=C23uEDR2sjHyfdbmUDPb6Z8ihrW4KOKVwt9UEZ4NnEs=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Kq1ikd/jEc+37JrzREw1WMsB3hHGJX3UWPMAKCbl3DArYCrSw0BVg0RT7IawIXkZfMMY+QeaH+KXbMeFmahplW0gaj5/lUqfRVSz/lA50HIwhs0Lm5BJlFYquXewKj6lyaArunWSbBzn7ECHQnthw4WeRV9PKhqxszPgM8XqKKU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=PuCVZBqI; arc=fail smtp.client-ip=52.101.229.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="PuCVZBqI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bycUygKh9N2AuMHWlr4E7pJo7jrKfL/5G4gkjxjEqJK53P1L15OrZSgNRJJ0OzO9lU6DzrE8rCBYLFMxPBv54o5dqqX64N/MNv0Mw6YxdjF2v1MOcm6nZFiWmXknoTOPIc7ki/f8DO06LOPJ8+7eqPybiEA3z5925cn77CYwHDr8MnZEqUkk6UlJlUsJ1GgHnmudsFm1YwzIyeoEgXTZ4GybBogPL86UPAff0o8JWdp/kjBpnRLWShZ6dH2h3a+kpgiXt/ifqWPlQApgHSywnBrK5r9EKxA6Wcua5KXCfjCDGWt5lH8znUKY7SHX/ja0csVl23HkCfOoQmRUnMRAlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q9AKRweYcmRaIZM08qwmpq2dtlfBJCgWlmx9+dG7QlE=;
 b=iwZ04noa90heHR03XyINBHxp4ssMw0mGuO9Hr832YCWi8k+Ir/suhb5zWY8xtFUHPwpMpCD7Net0u18hIkUqvqfWA/sGMFjAqM7kcNlZDJf9i2UsbLLX5GWTBRph/lo2w3pw1zY4rwcRzgNi2nu9Z6kf/fgUz/EVXy1Qdwd9KzUnZpX9D0Jwxmlr45J/fnKiOKLhD4wClgQ2LXlksqfwktW/NL+eNtsAJL6Ih8uSL3R+tToizHF5dbdYYr4iWSC2VrgR9o9DDFL4lN4D5Ey3c3JxiMfQDCnRBxjOruTFYV2xB9tPJ8o+UUXEubRMlPsjteoiDTy1/e41AP3R/30DcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q9AKRweYcmRaIZM08qwmpq2dtlfBJCgWlmx9+dG7QlE=;
 b=PuCVZBqIEAgUevtuOXTftXRs8NjTKqB5cmUNtXJtgogd2vmTsX9AHtRhQWyA2m8xKnxLbL3w8X+uAKcnT5ZJvcpOH32qgKldaE3gwCPYQVnI48RDJG47hiuP7wSM9knhya4Ag6zTeQp+E/QjsviY4oR0lT5ys90vex9ZcpPxgeA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB13923.jpnprd01.prod.outlook.com
 (2603:1096:405:1fb::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:19:27 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:19:27 +0000
Message-ID: <87tt02t8s1.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 001/139] ASoC: greybus: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:19:27 +0000
X-ClientProxiedBy: TYCP301CA0049.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB13923:EE_
X-MS-Office365-Filtering-Correlation-Id: f0a8b6ac-acba-43b1-5486-08de0ad8dd18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?o2Cm5N9htMX3Vdeqy5WQAhPU/7gJnLhB5lULcvp37uDhP8W/J7vwG2jTyUdE?=
 =?us-ascii?Q?i+xA8/qh6khGl/wWMZEiGy0bSY9yKS0+l2GDtYdwbQNWUQoPVY8tSf9bpcAl?=
 =?us-ascii?Q?4Vq5Zwmfsko+qFw9Rw5fCFIF2AIs5YcYkuBSUo5peVewoxFQ6tXCIRxQIdtN?=
 =?us-ascii?Q?haL+4RMBGPMO6KnxyXicbWzLd27zLUWe/RL/8C9RV/53vClpwWVS5dsedOTw?=
 =?us-ascii?Q?T50TvgpleBeQ/sOnf1n05fxC2bvQCHBJLMVt1gvCVoc8mTsNzaTW8lgjqxvX?=
 =?us-ascii?Q?491YCbQz08mt9uqJSAMRdVOjuJsKCSkgbsawYwglICBQVftzzFG0NaNbk2OH?=
 =?us-ascii?Q?DUPss1FnIdlnAhmqKbDQDovhkzOu870oQPjQglw/RC33DRngJ6dgd4YSPnPU?=
 =?us-ascii?Q?pTrmJoH8VpcsxkwIKrHBOa08tJ9wWImrI7UgQz658rsshh8aCZt+Wt3NhPGA?=
 =?us-ascii?Q?UlTo1eREryIEMBWm6nzee58PF5x9fnXD14n1gvMw/DZ4EAqw/rc1MjBto20N?=
 =?us-ascii?Q?5RDhPss9Qzr72cACPNWvKjhoHXNTZ1mvJkMGYU1oM4sayBcXa1vnE/HI5b63?=
 =?us-ascii?Q?SJ71Az8uTPIb6yGbdzcZC5VTbl7qc2A3XEf4sGGrBY2dL3WqiSDg4vgb+g7d?=
 =?us-ascii?Q?7HhBMzU1Ahvzi93M26xooDuQVM/Fl9R/9p0fKWNZgaMuvG+tB1UVyJYZxu6+?=
 =?us-ascii?Q?cr/g4/a3gC6ZhiIczBRtz0XqzOu7nenTW0963peXrlW32ISIARPDwvdPcOYq?=
 =?us-ascii?Q?JANchZBNSFYP66xAMlBpY//FzjO+YSTEiS3JXhgtM03KQXHOcbHgaoEKKaoK?=
 =?us-ascii?Q?t/PbnsnMQ0psrlSx1/Jygjq9o3fDPimsMBboewGIFGsjf+0iLxiH3kKvxiNh?=
 =?us-ascii?Q?A+FhNpstw8xZHNQo3EKEYpDCrQgEwUU/AaH3rs4Htcuytks4ZyU9sdrzxa0T?=
 =?us-ascii?Q?KHldzoyYLPPpD1jULvIcSRe37CXteJf8FgAtgijnWCHvAyATAwgThFn0Sm0T?=
 =?us-ascii?Q?NnYzamgwtoc99YY7E9hC+G8uI29t5lsFi8ZPl/SwEazX2OQznwJOB2zF6ukf?=
 =?us-ascii?Q?F+qe8AHHP/QOzepwEmMwiS/oGusLqpkwcJpAj0oaqUPLOx59WCOLmgpfR27H?=
 =?us-ascii?Q?oD/Insp0RYilvhXGoDLN/ago/zrjfvp40Gk13Ou0t52Fr7UdQMUCFyfeuDNo?=
 =?us-ascii?Q?U0nyVB3kmd7POmri4tS5CQfNj76GL3g38Om//FHihaD5dYtCRVq2ku7hDRbG?=
 =?us-ascii?Q?CGRr6JnW5WyJTTOH/1mWk5zpf6VNcvoX9cs7V7HQTgrgT9nAoOkTUJqrYJA7?=
 =?us-ascii?Q?boHLSwJqduxNqORWutNu0GW/35RzWEvQvFeXYIukbRwzQPkedcI5fbLJCLje?=
 =?us-ascii?Q?17jkyB7WMHVMJ+1qn7/ua+rJcPkfgbrfRB9lln2icQSA38iABWW61hfYe2Nt?=
 =?us-ascii?Q?dl4HVHYmPo8d5n+W4xCb0/nh6MJAIDJuO7JxR2GPAc5+quVRI2HByVaKZ4OD?=
 =?us-ascii?Q?1V/mPVI93YaKs5+eIm2vAfYCtntchBkyX3mr?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hSX++HDnacjS8VE81QIKneGHH4ig3sjXPHfSd9oOHDgFN1QF3+n6VIDiJPDm?=
 =?us-ascii?Q?8etEhutGk8PvjVCqV27KonXyiUcShtGx3IVfAc+UmPwKErJ0ijV9/eUCa+gf?=
 =?us-ascii?Q?cNYTNJQ2cVRKHpA6BLDhsPmvIYMHWqtZif9vvZkI5fQ9ACKzrbWiN/aJd+2s?=
 =?us-ascii?Q?bqq03ZvPeeeIUX0rC2gueAxU5iAPUoy53a7udr4YJAPskJCWPQ+rMjZFjmH3?=
 =?us-ascii?Q?ihRUGcDlqzlSWOays6wtANr9ieDregDFNxtKp7FPte3q5g5H6f7Mo3Um90wF?=
 =?us-ascii?Q?aU/ap2GaAPzkKM7ZfAUfAm++p22T3qdiT83d4HR67ouQHVcrlAnxC7nuisOY?=
 =?us-ascii?Q?fXfyVracsvNKZ3GHni0dEQlZeZr1REz9iOLWeBozc0U/+I1/iIMvEOnF2mBV?=
 =?us-ascii?Q?s+VKsQX4+3IXJwWAocZIKMmxyfnJRFQoXWbfwDzc8NaCQGqrbRrp7l16Qw38?=
 =?us-ascii?Q?9qjrO0VZPsFes253GzabDm2TjSG7pXnL1vIBvGPNc+3XKnUiSND0bHBUJ4Fc?=
 =?us-ascii?Q?rvozaM7OwWfPG2Z2QwjSF58Dl0b74McoJz0TzB7t/2qWXM6ufC1lWtX6m0oD?=
 =?us-ascii?Q?UeHlwyC+LCgqENPXJRjugsiFxVHq5GiGjEr+Rka0J296lraqYfCJol3JYBRT?=
 =?us-ascii?Q?chaAsKuVbbvFE5RIhNxz1FydBY1QG3f/oLJZXkfoxUwkjAvgZMFnit3fykMr?=
 =?us-ascii?Q?+Ke/zG28VDFMsh/D9kivPvrwEio6g5V2W30jkpqXpadeEGRU2bO//N15/nSo?=
 =?us-ascii?Q?o6mEQLyshIAAM7O1vg9fpji7TAJQk70EBBpFUbslsQT40rhtG+iAs057v+yr?=
 =?us-ascii?Q?P2kOIEtW2+EDu/UBssqhdSo5B7uTKBdnR+KPz4A/RtPJR9+CI6epoI79wkku?=
 =?us-ascii?Q?WpN3tCLwQIeFvnMWnmcozcY/TPIhySRUMnUPyx9aXDfSAEkA4tvIponUzkcS?=
 =?us-ascii?Q?c61WiAKd1+EASaYjEWK/3bc0zuh7A7gFCRUWhCvcqwSMYDnn/c9bU/i6Vngs?=
 =?us-ascii?Q?1Vr0rzm5oVSSYnzXusEAz7GbFOTqwJRw6SlqfQ/ynlcLpj9bBdpc3/A1bYtM?=
 =?us-ascii?Q?TfhtpZn9/WcVqzvkxhgCfO7IG53zutwdRGoEFgBd2oktZ6TiTltumsrSu9PM?=
 =?us-ascii?Q?PRk4Qv3JrSHLLoCClgNhxAuclxlMMkHRFS2MhOOioLTrheFYgUFS0bgCkpJN?=
 =?us-ascii?Q?lVY1yzdd36Q4gtJ+5+U7qetfbSMKm4+sJziHeBDh6I5fC38v/CBrX5AvXn+A?=
 =?us-ascii?Q?SNNDMhY8arvuzknLLtAXs3WsA+bC8MGtdfeEUMOauPCGWzkYOxVTqThMb/vN?=
 =?us-ascii?Q?AJp+XCtVVONNAIaNWHhWKGSrqcuYfhQBxGdDbbGmrDHK7jfbKGE9sA1zm+3f?=
 =?us-ascii?Q?RZmNO1Dc0MpDTfH38i7f/UtoqZTjWM+htMAM0fwypqETDejD/Sbd1JeQpOZV?=
 =?us-ascii?Q?kGDYP7PiRLPr2/PobFuvOP+8edUX4wSQGRLsudvpAgLetnVjTa63T/LAHZsj?=
 =?us-ascii?Q?tsJ77t9VGShY8MiunGsR6E7EIRgngajtu3BWJB1UC2GAG9SsmKw7CXq4CgRd?=
 =?us-ascii?Q?TIDkxflGFFjYqJzF+6QQ13/Yutq7K5INeiI/ga7m3Fn1hOwz457PH0aVI7aH?=
 =?us-ascii?Q?z/AceU3j71mLdA5RUzYSrIQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0a8b6ac-acba-43b1-5486-08de0ad8dd18
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:19:27.2950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PJnGldMoaSiyuFqjzQ/x6k51PZGwwfLDYFZPKutzIrZZwpAhWh+31YrPfyg5IinaL2TTZEpVI5BYn+UUhCVbnw9cGAAPBU+CYMAao/1QJsQz/BBP6iHUdmKhvbLNKO3Q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13923

We have very similar name functions (A)(B). Both gets component from
snd_kcontrol, but (A) is used in callback functions which is registered
through snd_soc_add_component_controls(), (B) is used through
snd_soc_dapm_new_widgets().

	(A) snd_soc_kcontrol_component()
	(B) snd_soc_dapm_kcontrol_component()

(B) is using very picky way to get component but using it is necessary in
ASoC. But (A) is just wrapper function to snd_kcontrol_chip(), and directly
using it without wrapper is very common way on ALSA.
To reduce confusions of similar function, let's use common way on (A).

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/staging/greybus/audio_topology.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/greybus/audio_topology.c b/drivers/staging/greybus/audio_topology.c
index 6ca938dca4fd1..13b790f81d442 100644
--- a/drivers/staging/greybus/audio_topology.c
+++ b/drivers/staging/greybus/audio_topology.c
@@ -163,7 +163,7 @@ static int gbcodec_mixer_ctl_info(struct snd_kcontrol *kcontrol,
 	struct gbaudio_ctl_pvt *data;
 	struct gb_audio_ctl_elem_info *info;
 	struct gbaudio_module_info *module;
-	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
 	struct gbaudio_codec_info *gbcodec = snd_soc_component_get_drvdata(comp);
 
 	dev_dbg(comp->dev, "Entered %s:%s\n", __func__, kcontrol->id.name);
@@ -214,7 +214,7 @@ static int gbcodec_mixer_ctl_get(struct snd_kcontrol *kcontrol,
 	struct gbaudio_ctl_pvt *data;
 	struct gb_audio_ctl_elem_value gbvalue;
 	struct gbaudio_module_info *module;
-	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
 	struct gbaudio_codec_info *gb = snd_soc_component_get_drvdata(comp);
 	struct gb_bundle *bundle;
 
@@ -276,7 +276,7 @@ static int gbcodec_mixer_ctl_put(struct snd_kcontrol *kcontrol,
 	struct gbaudio_ctl_pvt *data;
 	struct gb_audio_ctl_elem_value gbvalue;
 	struct gbaudio_module_info *module;
-	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
 	struct gbaudio_codec_info *gb = snd_soc_component_get_drvdata(comp);
 	struct gb_bundle *bundle;
 
@@ -543,7 +543,7 @@ static int gbcodec_enum_ctl_get(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
 	int ret, ctl_id;
-	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
 	struct gbaudio_codec_info *gb = snd_soc_component_get_drvdata(comp);
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	struct gb_audio_ctl_elem_value gbvalue;
@@ -588,7 +588,7 @@ static int gbcodec_enum_ctl_put(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
 	int ret, ctl_id;
-	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
 	struct gbaudio_codec_info *gb = snd_soc_component_get_drvdata(comp);
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	struct gb_audio_ctl_elem_value gbvalue;
-- 
2.43.0

