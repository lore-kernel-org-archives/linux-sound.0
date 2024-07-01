Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2086.outbound.protection.outlook.com [40.107.114.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABB81C32;
	Mon,  1 Jul 2024 00:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719794336; cv=fail; b=Qt0hA842gC8GTLBWtIw6pbg77wJIV8AmJ+EfB2hWtdERFD+Fh8sWpz5gHnmmhdsOLxp4Z33l34jwp9TnRigdelOy87mqiWMJl950+2BYLha8UGKCE5mPYBal/2wLU/A7Ea74gdVdTEpxN8gW77qbAo5pP8O5RNCoDXMQTc/xhNY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719794336; c=relaxed/simple;
	bh=yMfUyPemph3YCtQ34l1j3nsKMwJ0uxckd0wbarJJEmE=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=IH6M847C3bbrNwR9NTInfKTXh2GyRkySZ1+fUG/mKckGu5SMzB3CzZ8o8yfQOG9JSGnOsM1RuC8+GWRTiCtenohJ5ZymI+3PWLwjvUzNo/8usT1iI1yFtLyTq4lFywCE/vGWZFfWXFICxd4ouGneEIk126oJeaYQF6H3VXAV0Lg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=M+p2ldzc; arc=fail smtp.client-ip=40.107.114.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="M+p2ldzc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B1bRaG9CMcWZcqReeOYAECvT4Y/lWDU66Aq9jrn08zWTYfOvjiMZiOtnMcI2OC06VoCXxCMZvYP2tQtKJIql9lDqmrpI7dRqob1FqWsHNZ086P8MpXPpjpUPST++gU3kqkrYSeBeHbJgW1Eb8oiMiHKy1o1o7Uv0/qWE79L7IKepCsBiFgaOPBAjhIdpUv4f2RLqvQfsoIY0umRtuHtu3AjTD4inBvWac73Tbkv4Y3ZRYuUVgnOW2K6SOuw6dK7YwBfGNmFsZCDD/c181+YLW+i2iNuefV4ZQxkI4S1YYstQgtQopghhQimTPoAFCwpidnEq/mj5JMG37UgoLaDgfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Tf8UpneksWrbhhJrPGvFmEtI/HKBn9yRONK+Ery9l4=;
 b=gUqGtXdGb5RB/RJoXfAhIaaW80W98Mf/xFAxCsHXuHtiECJibleJVj50uRG6eeM8QDIgemRdzZnww6tsQGVB453xWiJdVWv7/vgzQi6MzmvJKn8Mkl7qgv9x+E6OfzESoyT7hoXs2MBCYVYUAs+iiKPVbBiaQZcKmosJaUZ4XqGAIKZkhfKKccQ1SBUlHAmUa1owPIn6VVA9aeiFc8icxtdhvj3+RNjiFsRxb7LLq5JAIkyRxwZbIzy7DCCQ3JRymbswOawLL6BDmXRCh4r9SH0ystQocyUP76o2CPZe4fPmPSzyE7Z5g3LJ7uC5TxHHnOyT2C5RObal9Mo301rgBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Tf8UpneksWrbhhJrPGvFmEtI/HKBn9yRONK+Ery9l4=;
 b=M+p2ldzcg8p42lu4+w6hKAwlPNw/rLK3I2+UgijseBMCCfgedgnfZDqfRzPRgTF8SrbP0liZSjZWlkx+KGCyc/BF5LGF8vpRG+/UR8xnm2WGRh0/7LWvibDTz1qEG4JCdWGh4VpCc/s4Lk0IXuLL91ROV9/FfqcH9N7dXbrihX8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10788.jpnprd01.prod.outlook.com
 (2603:1096:400:2a4::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32; Mon, 1 Jul
 2024 00:38:51 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7719.029; Mon, 1 Jul 2024
 00:38:51 +0000
Message-ID: <87msn27xpg.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v5 1/2] ASoC: simple-audio-mux: enable to select MUX names
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
In-Reply-To: <87o77i7xq6.wl-kuninori.morimoto.gx@renesas.com>
References: <87o77i7xq6.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 1 Jul 2024 00:38:51 +0000
X-ClientProxiedBy: TY1PR01CA0205.jpnprd01.prod.outlook.com (2603:1096:403::35)
 To TYCPR01MB10914.jpnprd01.prod.outlook.com (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10788:EE_
X-MS-Office365-Filtering-Correlation-Id: b2801b78-0e95-49f8-3a05-08dc99662de4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?T9fg0ygnY3zQPS6rJcmZbw0yHNoC6nJ1UiLKlqtdw2TCPN2gZ8JkKE5oFTkO?=
 =?us-ascii?Q?6ZJi+CN+1Y/ifnuqXsp6vxhJnvPXvZVMoQU7vSoTbtuoYmrDmvjpd2+2MoUM?=
 =?us-ascii?Q?f6jjboN7LDjLt5fuiRts6zTKbSsCJz20WN9TePX3W1R2rons9xe1f6FDz2R7?=
 =?us-ascii?Q?YiPMUS5T+LiSIzqE0/T4SFY+VCvbOdGNYlxD74AlYJjmWQSV9Kzoybq/S7TZ?=
 =?us-ascii?Q?+34sPPlSjFEC1U/v7LNTM7cPOZKDcy+nm+sEFjrdbYsKJzXGXUDYBw7ms909?=
 =?us-ascii?Q?bfFidmJ6RYELAYi34GeKizSJ+te9V7Llz/ezQWAQoU367MWJUGoGV1gB84D9?=
 =?us-ascii?Q?nQnsZixzIecIoVxqiUt9qRDXhpiDbd9ZrGr0bcQ1LNiQPoOL+eKEJ4UQUF4u?=
 =?us-ascii?Q?wzTZnq/MV5W2dA3gRLfhjgDxsfAibj3C8EFtFsQztchDVCjthODuxJR2q4+N?=
 =?us-ascii?Q?tgup5Nu4tL97C1TscYivsJTYAa5+GJbVKDptZxaSS9Pe8LW+epBRxJEJyLUA?=
 =?us-ascii?Q?bdbnLvNMB/a8O9zsSAgCctwlv3Zr+qNm2RIVGScSljqKVlHTnuZ+z4aAao+x?=
 =?us-ascii?Q?8mKnnlc6wEo11s8tiJOj/qj3O4db/KGIzB3LwS+rw/s2PCtbmIQv8pXHqGtV?=
 =?us-ascii?Q?Sp6oX7lgzZDTvZE5yhfJXKcDwhKnK1rozVYYOsYfJp4UlYcJMoUcbpD1JdYD?=
 =?us-ascii?Q?lf48CoLqQAMdV6Pse6zJVz5z4oem3y37WNhlmAiRBMEn6lIzlNBhqdxU6dJa?=
 =?us-ascii?Q?KSMVeH0VbQgI3bD7kLjokBXkUCvL7PK4c+vt7sR1aJlj6iVA6g3RS0s+2RH9?=
 =?us-ascii?Q?iD27Pmn08ibH4eq4ylyy7J9IhWXRZzQ9PANeQ2UBxQ7UvFd1HwIILKV7zKGB?=
 =?us-ascii?Q?cWaCV8mykSvyqWhv37LJfFJoK9r46r2CRcyJ7v+5NEArGMoBjpCzD6rOfzk7?=
 =?us-ascii?Q?q3Eov4b1+4G4XLDG5KsIT7cHgVySYju9ycH796FVyJUvG3HjmQLVLU8++eMQ?=
 =?us-ascii?Q?II7AJYuIZK6Qxqfwv9DeVg+KtkYJVpfcPrGfg/PVcKXRU0/iDwSRpUp+htxO?=
 =?us-ascii?Q?cVaQl0H1kqHN20ZueT5NFXkp0fsSD8mbJYFCtQ1MN+xBNPKlygGhhXQIBH1z?=
 =?us-ascii?Q?HcmB8LMEmaFflxFr76u8TFEn4258D1p+F3J7DyTi/f7CS1M/KemTpZiHFkx1?=
 =?us-ascii?Q?ADhsH+CNQn8TYUFKc4cvRVY3h4JSGhOWa02ExcAQvlvwg+AMnGEz+UNt3Z17?=
 =?us-ascii?Q?xl3eSoR1xPYBvGLFLxDNVq4nQQSE/ycAiOvhhfom1JU/wy4wEURJC1wKF0SK?=
 =?us-ascii?Q?uk/RMhLhTdAJdOOd2zaXwyWU0cdPPMHxT1of6jAwjX1NaZyPoXOIEDOVE7IA?=
 =?us-ascii?Q?BMIs+ikqDCQhP2hnqnIixJCL+LObOuQEmpd3HKpjBWUXFyMZZTZneBbdVV0y?=
 =?us-ascii?Q?RtdWnJ+QBuY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?F8Jz2dl+N82KlmgT3R588/dD/TZWD3dnZ3Oi8Pfcp1nDZhkoGkTYJE+q0pjR?=
 =?us-ascii?Q?Iv30PowcFeWps2b2q5fot5QeGQK/fzXULdAvenkIvDtXgKAFbk2m/pNThLP8?=
 =?us-ascii?Q?Zi6l7r50/OpCzzpoZ5GEE0HGDeDKzqqbJ0fEa1WnP1v/6IFaQy0y3YKRCArh?=
 =?us-ascii?Q?MAAFRzrwjqMpaHT1oqOwB0/v9OHy928K0CmVuADzYJhiZDMIwQR4VofxFDfl?=
 =?us-ascii?Q?1zvfaBqkeSWPxBCgWe66VvkjlHzP6biNhhnplNRt3wtWro9cJ24iIV+9F1Sk?=
 =?us-ascii?Q?d0Y+nx9pQFySAdOWXSb9wn3laukmKmheespIUED0qU+NW4JIgGM1nI0ADUcK?=
 =?us-ascii?Q?bpvRTGoi4qdLXk83CBS1MIizMGabWJWUdT/qAwSJaCNdagRHl26hDxwVQTYl?=
 =?us-ascii?Q?NQUX1IcneHQ+o9iAwjfzrxXU+I6hCFYDU1Fob5us0FqgZAG+/ATlHSJyq9lb?=
 =?us-ascii?Q?kDDplp6/6pn3vRbl3CnGZw6/3154ptgVmmps7ah2lh2DeP93Oo3DLkW4FDH+?=
 =?us-ascii?Q?kueRtAtFj4XNFKcmFGxLaFWKF98SdZtyGGM5GSHAaE67V9odXoax72NMgJC1?=
 =?us-ascii?Q?127e5EYjJSZI3WxBGweOJbPZLAWfIxqE5t58G+3C+fbByZf8pDjIHWAbRMFc?=
 =?us-ascii?Q?bC139i7Nk5RTxZLTBVaxhnC8yELOyKWz6sZX/nlbXE5bii+jbqatBpCy9YUZ?=
 =?us-ascii?Q?s9Hu/baCzvlfk0iNJVbplakZAkA4dHWxyhNST/v4zTl2h43ZrGndnB0mfnUL?=
 =?us-ascii?Q?t/IhODO5OeovmGOl2h4QyIH7xvimbALdKYsOLFY1U7MKnDyVbn0ywD0SxxdG?=
 =?us-ascii?Q?Xi3gI6qZ8kRVt4ASXZPcehjQ02cUTeu03330NWL1swpoUNI9JGKS/weQ+3Vr?=
 =?us-ascii?Q?/u/WDrxG25b2cbVUhcx/ERHc1J6mCY5kS6RlbiLioAwLxwcgPSyJDiVVwe2t?=
 =?us-ascii?Q?OoE1Xd4eQxs/bzQy6f1859Vhr9EFeWB4X+lGwOngJqx4p/qCtwKbrASNo8iZ?=
 =?us-ascii?Q?CxAHG9f134CQauzFzghBF4SS6mLzvc4VAwEHh2eH77FpgEimqE6O2Nb+jfZe?=
 =?us-ascii?Q?te6VeJCKZNNCqOO2E+VLH2SGPuZmrrETDVOpu26pUxU9EFJG/qRVoveATH1v?=
 =?us-ascii?Q?7WUbOLLsWJwQ5vfoliv81kwHPkhGLJUBmmnxuZeC3WuLcGJzLJUdcG2yepL7?=
 =?us-ascii?Q?7UwUJEKsvcXgtLjp6ZqZq2gRqD/tfNOnxqbeJFlsFb+TiBnQQ+d75r/SZOch?=
 =?us-ascii?Q?D9dnrZy2VMJppwQbC27DLq2+cQlmSWaXGuG71czPiAkgzsgGEEIOYB0bDMvO?=
 =?us-ascii?Q?JqPBFeG444paIs3M8r4jf9RryZlmjwA3A78s8j4k2DVumwGCAnToo3pQcVx+?=
 =?us-ascii?Q?JhcbmdazZKokzalncEZOGqvbL5rFoFKgKSDPifOnjLq01FZZZdUDOmreZuwO?=
 =?us-ascii?Q?wPp0jUnewcI2xDvuGSIcoEPEB566+jr6w+zFosW7rLVpc343SipZnEaZJMBx?=
 =?us-ascii?Q?42xytGqdTQHCjWxUwFhCPwQLB39wTXOukTI3aGpq6EcdurqvaHK+LmQgT1xE?=
 =?us-ascii?Q?6+2NflFcEKsfE9Pwf/bdzHBKkYIsWF5cjDaRNguyT5rmEJSwefE4soM3Cb7d?=
 =?us-ascii?Q?Th0vqgCmEILmY9w9Ffolvuo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2801b78-0e95-49f8-3a05-08dc99662de4
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2024 00:38:51.6923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UrP9tijH1RP4OyBxf1efl1V8r6FxIc3pAJ9XXwIUctO9S4fTX85eIdrk2sg6E5zBQn1QWhCt/RF0yXHSvXM6+zHkNFFVCp/DQfTym0ov4xLGmFwMcWfX2DFam+gNcYfT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10788

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
index bf67de12d20b..240af0563283 100644
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

