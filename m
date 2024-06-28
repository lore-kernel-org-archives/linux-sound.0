Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2043.outbound.protection.outlook.com [40.107.114.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D13B7EF;
	Fri, 28 Jun 2024 00:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719533630; cv=fail; b=QHdVaUCLirSeFgQxpU0UEBMMfT80SoUookY8U/gNf5bxDB9IABM/NRiWJSxt79QmmNKHxxGEhlNvyaN0Dgsg6kb9+hmVe6fMej1dSQhNVTM0IAZi3vAM9PodNQ+Fnl1kfOI5op7YhpHcymuf+gKLalWSHxag/AU0Mimrdipms7M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719533630; c=relaxed/simple;
	bh=+hjR11XznCOjPHzERS9nZUE2jboRa3QAprv5B/TldLk=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=HkQjHii+8x9AC+9mavY09uRqktRk6lyplZPAxt3Nl74O8xe3PpFvBsMWrAjfUz/WVC6xiwbY2gOE5Qg89wy/LbOewHPx08NiqtfJJJkv1wmBpgb54dayCnyRSy8WsUNZfM4giVHXl67ylx8U64YxRlBDS1EA742t/tnLiTp3KSQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Cp071Nko; arc=fail smtp.client-ip=40.107.114.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Cp071Nko"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oT/SsGWK5hwQpe2tUuO9Rm+NSGynoM9pvJ7z9I3/RXE55oqncbqq23XCHt8/dqUV1X5v7sIz2UXHB2mfvw8NDoKAm6Pycytu5Fay5qBzGnIAohjZ7r45mhENwgRWjfxS6PQ2kNWAmshNHYapz4t4/siVbvTrPtUvQpndhHFWEB41Ql0cdDgfg7VxCrN4jKzuBP+y7moMBkXy7jKr/z9PvKRN3k9a4JqhEij1c73q8vXhEIe3UWq52ONaLcKj/TWQ3VAS0yHSLxpWpfTEbEwrn80uPsoaQuovuUqZcNoHngP8BOBtz8acrY1aq6MgBQTfKqOgErnPFktkJcmKnC6OEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CURthmbpQbgfw1QKvT2PorDn2dRtAKDwK+hFDEAuw/M=;
 b=gyOm3BekXac7nkzFSLfhpFkNy/d4V2XICMx5UlxCV26Vx5u70MWtWaPStSVkqEMKEY5oYeBt5drTrB6sriQhRDXm/yiufhBq+ckFEAQ3wAvb0DrV5uD4jw5D9Uqnghyewnqe0dCPzFvcnej2gBoUuiAoVrCjvRGW3DtrA3jPbauowK6+1G21Rmd7WvLLcCs+EFjZIg3oYKjxuW/RXHTnjlZh0XJPPLZuaaLO5eEHaHG4MoIrEwL8YlA2NOdLIRtV3J5mffLDIHFoBJ9C/RFEjZB5V+/9eBO0WHXL0fDZJCRyoO/1dpRxD8fkRZB06WHrXtjPbsAmXgA+5ysIJqj2Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CURthmbpQbgfw1QKvT2PorDn2dRtAKDwK+hFDEAuw/M=;
 b=Cp071Nko/pFcoM9YqgY2SbOxB3nXYszEP1We/8LK4KiMBeSlXDKghQEUYiAHYSCUJHM7DhT2GS28/wc4J3L0WPsDvryZpxQf/FgbV7uGyl1xIVKASfvPRxyk0mcYK9ET6XR93xJohaHQ3xGUHyJmazmbfrGWeDz+d1KDCFrR3Yk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB8013.jpnprd01.prod.outlook.com
 (2603:1096:400:186::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Fri, 28 Jun
 2024 00:13:43 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7719.022; Fri, 28 Jun 2024
 00:13:42 +0000
Message-ID: <87r0chapqh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 1/2] ASoC: simple-audio-mux: enable to select MUX names
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Alexandre Belloni <aleandre.belloni@bootlin.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org
In-Reply-To: <87sewxapr5.wl-kuninori.morimoto.gx@renesas.com>
References: <87sewxapr5.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 28 Jun 2024 00:13:42 +0000
X-ClientProxiedBy: TYCP286CA0123.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB8013:EE_
X-MS-Office365-Filtering-Correlation-Id: e3029a49-5218-4ff9-91e8-08dc97072b5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|7416014|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NmU3NEN4z6/Suxml0/4oYu6YatBctKPpBS/lshmmdtkRCLd+THE/iTgTux9h?=
 =?us-ascii?Q?hmUVnwDA76q4OL4eJYe1xVoqXY5aMOdkBApZutcMw2p3ToYi71Y13u4poczJ?=
 =?us-ascii?Q?yaffVEM3h3zbO3KH9p62CSNreQMXn+sjVENX1FgBDOxhu0grWGAjNoKBHazX?=
 =?us-ascii?Q?lk7vuYkkqhuaR2E02PTOp+DXL1lL140VYQ+b5gSGXJH+7sq1KQqNRsJMFVVz?=
 =?us-ascii?Q?ghm+1UOvk9Fogu9oAbdWmqzdZWnfR9vfAvdv9SD4p0HhE13p3MJa+6B21s+9?=
 =?us-ascii?Q?j/IFzXi1GPhRnMPTM/xRAlRjfCM9+QjVRVPb9uJrOYvsOLMGNTepoL+yPjf2?=
 =?us-ascii?Q?esx947/G5Hf7R4lKdRh+qOWxvRtpFIvv2fQ621m5oOyd7NzjgZu6vdn2m/Lo?=
 =?us-ascii?Q?DO7WczoEl2uFohxp7N87dMtW0MfistiuHO1orx6dlVMfLI1PE1PS8XmNQiST?=
 =?us-ascii?Q?3iLHHq3TauphjRX1j1kjx6YT/6zVL1Ey0wlZV1o/9f3/qHwen0q6iuugpgyg?=
 =?us-ascii?Q?Hpuy6j2rcjAhDwBHv2VGjOicTkv2Wd6eYqcUstI+yPdA7KspbtZdxlguhaEK?=
 =?us-ascii?Q?6I54hdjYo/HXt6koBMg0TkLraS2F4h+2oc4CFbQpGm5LWqhWuS81PAseA1jx?=
 =?us-ascii?Q?BsVtm+kachO1ueIypOnPgMAYFTj4usl/7riGp9w8CVwESwTCgCJgwBWN6+H7?=
 =?us-ascii?Q?DNYHTWtcV9NMvU1EjmIgkK9oZFS0ZduaEXDuwuy8N/11crhIHyUYubJ6yuAS?=
 =?us-ascii?Q?K5JPtQZcYM9M2A0EhQTjA8Z+Min7Pjtxs0FvMrRqVnQMGNzcqYevzoZ+s/jP?=
 =?us-ascii?Q?IroomGql1WQthQmavnSCDbNPgJcyeMGyQpS5DJg+jE946uA53Kc6wNhpkna1?=
 =?us-ascii?Q?8eWfMrqJ3X8xLGf4K2CwbSRA62ohLRuYEICqqkzjT2xfo07PTmbPzw6JYJqR?=
 =?us-ascii?Q?CDnOgmLQcmlrxEqh7rT0uVnkwP0SSN6pdL0N6s3a609yYbytCb0HEy4R2Pd2?=
 =?us-ascii?Q?nuGWsf635m1JrpGnln4dwUwmgRUjxVNeJBSgSkchSycntSQkCQgQ4teynzd6?=
 =?us-ascii?Q?NQOeXVBH5ofrbF0YCqawcIManzUrsgL1JG0V5JG/EcDKOkia5CCFxGC9nXvp?=
 =?us-ascii?Q?cumArVtZ6KEDAdH6l29p1utacMi5hxO8oDM7jXni/siWvFWL7+3wI7jg0/BP?=
 =?us-ascii?Q?uckwniQWd1FJV9P50xMo8TTzQWzDFA9Ls/Qs47dp1C1J0bA9ow+Lb1WcPbWu?=
 =?us-ascii?Q?e6yRlLqAPrgafHXZxZpdcNutKvwYLYXKwvE7DabkKvnlWFVHteB0NuK/1Xs/?=
 =?us-ascii?Q?v/6t+QINk03Tfv1zsuOP7FLGWNfFGdgu17snO0wjjn+rv0mrvmCfh0VjqN2z?=
 =?us-ascii?Q?Br51Q/dz1Y+BoGtLo870qmLGt1TQ7Dnd5ReyA1K+tnhyecBXzmF49SQcLQ3I?=
 =?us-ascii?Q?NO9/3OIaUXM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(7416014)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Cg/f/DxzbRJgq92V0IHr4xWD2oyn7sVmrFU/Exgbhi9+iwSZ0ndpbtayo8//?=
 =?us-ascii?Q?qWo/Z2mNYvY58/5aaMYgP0/bGnBLrFCeJ4Pe6Cx2lPg3WUD88OzfBPxvoLKl?=
 =?us-ascii?Q?rWL9Li7atULR0wwL39eMZubIT4KhNlS7U1+uH6x/53Q15VyaDO8YSkxdbzhz?=
 =?us-ascii?Q?xUYbGqAzjaYAIMhxjl6hnFYEQjqBTjic4GqB4SF4LNEy/K6VNo82VWTG1wIp?=
 =?us-ascii?Q?sT7L/puVWgpVz2DRD8NzwgeBs9hMTNCEPTKbXBbDjRVBaDGmVyZ7dyCb+UeO?=
 =?us-ascii?Q?tPjo2lJ06AVKQaQxqf6TAHOB2wG19uYMtaMVSPalXOF+QP8CoatOX0xQXZy8?=
 =?us-ascii?Q?z0j7vnQvo8t3csVxwPY6E7StPJlQi8K7XhjRgj2xJgTOmBt35BIAmfmdUshP?=
 =?us-ascii?Q?frOwL1T68awWX/Io0wRDK3YqP5V2WBHtejDseRjc0iPClA5pRTzFRRM5+f4F?=
 =?us-ascii?Q?wx1o89xNkqMrzyzgHGOp72N1jf1dvTfsBkiwywxf52w92VaZybkWFKwfa7uz?=
 =?us-ascii?Q?+CfgdQOppz2h1HopB0QGzKzdFpIHdRZtTEkDi/6hIN7JPvOnxv5aqGRzJy84?=
 =?us-ascii?Q?gZgZF6sJt1DZeozLk5+eHUdZC63Nm+sHIT4GOt5AV3qZisALdUEWkqe79Mss?=
 =?us-ascii?Q?/anxzZCUpK6ajnELeiLMGJLtm8guMPIDU1t4rZBxiWOxFAMWX/tsECQ8UUSw?=
 =?us-ascii?Q?wGZ30cDozMosGb9NiAGm2fRHx4YaUa9hbf4z8e5TARAhQDA1D648ATydcwY4?=
 =?us-ascii?Q?yMe45PiidZ1avQkkitWJ06zA7IKqxEF2lPT5XEISHnycklzuAEEupt11dZby?=
 =?us-ascii?Q?tXM31QRTU3NMcojUhi2GgjRYUQ9SvKwcE6wMvZbCZTSui+a/xDymlaysGiE8?=
 =?us-ascii?Q?fwLs9TNckwiZk2iTXljIwtvOTmv4lBIn2+EB/paDPUkZx0TQoygTY++wL8Q4?=
 =?us-ascii?Q?ll3zW+1Axf9h6IhgzVlmgD/zvtgs5oxipsAUXSBPezDbM5Ne5W1fFTjlzS6t?=
 =?us-ascii?Q?jwXHDVCdzQIrzZcO4ZJaeo8IxET2KXQSUfPfk1M1Ginr0lH4y9aZOokiK2Lj?=
 =?us-ascii?Q?SE0CejxHpiKbXouGRI1SqjFgPlkuTQd4wUzTJ4QRLfL6X/5wEcArLCLYZJsx?=
 =?us-ascii?Q?my53s6W9c7LWIUl8fWF6ckoKxOGIo78wAY9RMvsQUwT11kLhfQrcT2xTkGAD?=
 =?us-ascii?Q?/7Ecq6FDvtqHuMlxR/Ofe/YET7KZBtbeoEyZupXGlM0RlG1C0vEzs5IrOSBF?=
 =?us-ascii?Q?JcwXTa15cBRpgAJpeIviJsXPpSv6eg4MN4d91uR/XRMC6dIRFj9qSASJCLQC?=
 =?us-ascii?Q?zgC7VzS/8KIcJtagENUv+nnctHvU79OiFyUZVtUpWsXi8FYP6paoQRNOB5Qz?=
 =?us-ascii?Q?hdTXhoYP9x/+A3kX6RdBl6plgb7ElowcpJMnJRVkKkJ2DTA2INA2l+BmUK0r?=
 =?us-ascii?Q?0/hv0onG8rHAW1+p+pqfJFQ6hrBKv0BiuV8tpyxIpXM9At5FAOHWzKmSmP1l?=
 =?us-ascii?Q?VURsvhwj9uk1ITethGBeN+wKmVi0oyA8P4JcK8MthovfB+Y8F5z7HiZJm7qU?=
 =?us-ascii?Q?l7iioyBtiJHPcpETmnVdEeqwzPUXI3oMuUAdRlgKHT4pQ138kjjjFfR7ZKzl?=
 =?us-ascii?Q?/s/CGHEqaDnPv6LVM/8RQJo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3029a49-5218-4ff9-91e8-08dc97072b5d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 00:13:42.9459
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tEY7e/Otz7yRvE9iTUuuYbGBSmN587bkeS5l5o4k3kLG11IXsuxMY9s0nCyKWApp2g5k6UGRA/I2Ydgl9sR/qif9Z0mgId8xjrnzkdRPEvcegC7DJdqBeGwuHdiwrrBm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8013

simple-audio-mux is designed to be used generally, thus "Input 1" or
"Input 2" are used to selecting MUX input. This numbered inputs would
work, but might be not user friendly in some case, for example in case
of system hardware design has some clear labels.
Adds new "state-labels" property and enable to select MUX by own state
names.

Original
	> amixer set "MUX" "Input 1"

Use mux-names
	sound_mux: mux {
		compatible = "simple-audio-mux";
		mux-gpios = <...>;
		state-labels = "Label_A", "Label_B";
	};

	> amixer set "MUX" "Label_A"

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/simple-mux.c | 55 +++++++++++++++++++++++++----------
 1 file changed, 40 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/simple-mux.c b/sound/soc/codecs/simple-mux.c
index bf67de12d20b7..240af0563283e 100644
--- a/sound/soc/codecs/simple-mux.c
+++ b/sound/soc/codecs/simple-mux.c
@@ -9,12 +9,21 @@
 #include <linux/regulator/consumer.h>
 #include <sound/soc.h>
 
+#define MUX_TEXT_SIZE	2
+#define MUX_WIDGET_SIZE	4
+#define MUX_ROUTE_SIZE	3
 struct simple_mux {
 	struct gpio_desc *gpiod_mux;
 	unsigned int mux;
+	const char *mux_texts[MUX_TEXT_SIZE];
+	struct soc_enum mux_enum;
+	struct snd_kcontrol_new mux_mux;
+	struct snd_soc_dapm_widget mux_widgets[MUX_WIDGET_SIZE];
+	struct snd_soc_dapm_route mux_routes[MUX_ROUTE_SIZE];
+	struct snd_soc_component_driver mux_driver;
 };
 
-static const char * const simple_mux_texts[] = {
+static const char * const simple_mux_texts[MUX_TEXT_SIZE] = {
 	"Input 1", "Input 2"
 };
 
@@ -66,30 +75,23 @@ static unsigned int simple_mux_read(struct snd_soc_component *component,
 static const struct snd_kcontrol_new simple_mux_mux =
 	SOC_DAPM_ENUM_EXT("Muxer", simple_mux_enum, simple_mux_control_get, simple_mux_control_put);
 
-static const struct snd_soc_dapm_widget simple_mux_dapm_widgets[] = {
+static const struct snd_soc_dapm_widget simple_mux_dapm_widgets[MUX_WIDGET_SIZE] = {
 	SND_SOC_DAPM_INPUT("IN1"),
 	SND_SOC_DAPM_INPUT("IN2"),
-	SND_SOC_DAPM_MUX("MUX", SND_SOC_NOPM, 0, 0, &simple_mux_mux),
+	SND_SOC_DAPM_MUX("MUX", SND_SOC_NOPM, 0, 0, &simple_mux_mux), // see simple_mux_probe()
 	SND_SOC_DAPM_OUTPUT("OUT"),
 };
 
-static const struct snd_soc_dapm_route simple_mux_dapm_routes[] = {
+static const struct snd_soc_dapm_route simple_mux_dapm_routes[MUX_ROUTE_SIZE] = {
 	{ "OUT", NULL, "MUX" },
-	{ "MUX", "Input 1", "IN1" },
-	{ "MUX", "Input 2", "IN2" },
-};
-
-static const struct snd_soc_component_driver simple_mux_component_driver = {
-	.dapm_widgets		= simple_mux_dapm_widgets,
-	.num_dapm_widgets	= ARRAY_SIZE(simple_mux_dapm_widgets),
-	.dapm_routes		= simple_mux_dapm_routes,
-	.num_dapm_routes	= ARRAY_SIZE(simple_mux_dapm_routes),
-	.read			= simple_mux_read,
+	{ "MUX", "Input 1", "IN1" }, // see simple_mux_probe()
+	{ "MUX", "Input 2", "IN2" }, // see simple_mux_probe()
 };
 
 static int simple_mux_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
 	struct simple_mux *priv;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
@@ -103,7 +105,30 @@ static int simple_mux_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(priv->gpiod_mux),
 				     "Failed to get 'mux' gpio");
 
-	return devm_snd_soc_register_component(dev, &simple_mux_component_driver, NULL, 0);
+	/* Copy default settings */
+	memcpy(&priv->mux_texts,	&simple_mux_texts,		sizeof(priv->mux_texts));
+	memcpy(&priv->mux_enum,		&simple_mux_enum,		sizeof(priv->mux_enum));
+	memcpy(&priv->mux_mux,		&simple_mux_mux,		sizeof(priv->mux_mux));
+	memcpy(&priv->mux_widgets,	&simple_mux_dapm_widgets,	sizeof(priv->mux_widgets));
+	memcpy(&priv->mux_routes,	&simple_mux_dapm_routes,	sizeof(priv->mux_routes));
+
+	priv->mux_driver.dapm_widgets		= priv->mux_widgets;
+	priv->mux_driver.num_dapm_widgets	= MUX_WIDGET_SIZE;
+	priv->mux_driver.dapm_routes		= priv->mux_routes;
+	priv->mux_driver.num_dapm_routes	= MUX_ROUTE_SIZE;
+	priv->mux_driver.read			= simple_mux_read;
+
+	/* Overwrite text ("Input 1", "Input 2") if property exists */
+	of_property_read_string_array(np, "state-labels", priv->mux_texts, MUX_TEXT_SIZE);
+
+	/* switch to use priv data instead of default */
+	priv->mux_enum.texts			= priv->mux_texts;
+	priv->mux_mux.private_value		= (unsigned long)&priv->mux_enum;
+	priv->mux_widgets[2].kcontrol_news	= &priv->mux_mux;
+	priv->mux_routes[1].control		= priv->mux_texts[0]; // "Input 1"
+	priv->mux_routes[2].control		= priv->mux_texts[1]; // "Input 2"
+
+	return devm_snd_soc_register_component(dev, &priv->mux_driver, NULL, 0);
 }
 
 #ifdef CONFIG_OF
-- 
2.43.0

