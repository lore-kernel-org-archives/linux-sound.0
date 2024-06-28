Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2052.outbound.protection.outlook.com [40.107.114.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746FC17C2;
	Fri, 28 Jun 2024 00:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719534061; cv=fail; b=dE5ifhAcMSXw4B7Hf4t1NS/cgY1eVDfp0cN42EOVAQxrBqx8EuN81f2WQVgTxm01Ig/ShiFEa3NxrHJalUvbPdvixUOXjHR9W5LmP8SbDMent6GofgeKELWCkORRlXuVrjjic4GvB+MdHvDbCHsnIUw1TK3gKzU3YvZbbieqJEQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719534061; c=relaxed/simple;
	bh=+hjR11XznCOjPHzERS9nZUE2jboRa3QAprv5B/TldLk=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ap24/8PNH6kD+LdWa6roI2xsmS+QyS+WGdO+V7QMip6WUMYsmfbsnd9q7AlzKTVw230uKD6tE/rhDMlEzf3XMHruwk/sijdwcPvPPkxM0/r78f9QyPPaz5Azli8DI4XM64XcUAP8fRRCnzf+dnOEgG/kAcEuRFF5sP+LSCZW4p4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=d6GAsMz4; arc=fail smtp.client-ip=40.107.114.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="d6GAsMz4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WvoRojrPYWosO5zhpnPcaM5wu1NCMcQP/CxI39UfSmFT6O1HNElneniNhfdIzIypW/ujD9JcfpBxd+Bet0XBedDF8RdULb8QGILFspmTI4IO/eYFjsGNtpk3z1TSnLTIxdSHZTHnmGYkJCJyhsl/9NNlKiMBx7SgMDPOLTUm9hTrpk5yqFlQjsejGDxhRYAysgbnIk4RtWutoGZsza4F/+7xginX6P0vmKFO5+NMrVZ1XHOAEuIG7k1SkTkWmi8a4di796xfTEZtg0u2nAmD5eL1p2FtmzwF0uzvJDKJYRcLItMcHIpEw9j7uIH6Y5AeKSgR9A+m+CbD6wmkdecjpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CURthmbpQbgfw1QKvT2PorDn2dRtAKDwK+hFDEAuw/M=;
 b=WKe224xI+k7PRO1SzNkXyR0vIXBDj8yAY/FbbyVeGbXX+ixR0eFUtAk3rdM2e6jBuXMFDonf8o37c08smRGawFLklVd4zN6eXjdMMWrBGbXkjaoS4g9oGvLamRCaLPqWMwLrd0J3jRzHc6GIhxswegBWFaGNFk1DW3UFtd0VgTmLMLpFXCuSlAUwjJ8qfCRkQ2lZPYuuEEr/2kdoVl6IxrbhV+hswLnTneI6PC2TcU+XdfYJjhvS+gwAM7LGQ9Us7TGr2eCLt9rV3ZJABm6Llu0nobkqqmwNgRu40JWM/6McqWjhbUjNo0PnaIekvUOdgaLtoQXRiQhbdbVKuH6e8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CURthmbpQbgfw1QKvT2PorDn2dRtAKDwK+hFDEAuw/M=;
 b=d6GAsMz4ImO9HdKjenALXWgnNx0jEGkUrKgk+4We2OWCEa2xCJdZNU1gk7xs85zfOsvVBJj3uYpZxLsK2OcItY6ZE3aAZzOD74mkaumwZ4WGaqKv+79VvjnDVYLGKPwZ4fO25cbv4/4p/JleWA03ydYDUo+OLT99XVVFdMudOCI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB5718.jpnprd01.prod.outlook.com
 (2603:1096:604:c6::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.35; Fri, 28 Jun
 2024 00:20:56 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7719.022; Fri, 28 Jun 2024
 00:20:56 +0000
Message-ID: <87le2papef.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 1/2] ASoC: simple-audio-mux: enable to select MUX names
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
In-Reply-To: <87msn5apey.wl-kuninori.morimoto.gx@renesas.com>
References: <87msn5apey.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 28 Jun 2024 00:20:56 +0000
X-ClientProxiedBy: TYAPR01CA0045.jpnprd01.prod.outlook.com
 (2603:1096:404:28::33) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB5718:EE_
X-MS-Office365-Filtering-Correlation-Id: 83967c70-8fce-4bfc-9b89-08dc97082dff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KPA+nEc1nmra2lLaccEMuBr9NNEEZvssKFX1xQyltXMJZJzzRinJb306wgkg?=
 =?us-ascii?Q?y5givMOK8cwPJ3SG7HlbwKNt/1+HmtGllkYUjwf/IjeAcyNV1SceNzp7Rf/t?=
 =?us-ascii?Q?OIa9Y0a1xbcjwQHRO2Z92WQt4MqayP2+yubb0h0m95bMkKbcNA1zzgQnoEDF?=
 =?us-ascii?Q?xJoHJRp5gEXR0hEtURYq0vYleDQIPW7Ppn6QbS6lgQv/urZvsNdTXQZ1sZyT?=
 =?us-ascii?Q?gQLJkrBKxHCjnifn0yZWihUDZoOqLFnDDRY5NGTEycQQMan9WwAfedsBQ64p?=
 =?us-ascii?Q?iDudUcmj09dR+cd7banHsyPcd9LLx9/Vdx/EJi25/SB4xpxYajGff0Utv9Br?=
 =?us-ascii?Q?qe318vnQQu6O1Mc9waMXKOD8s/tBNTu4CHVErX5UNjJxFGkezfkmcwW2R/jy?=
 =?us-ascii?Q?BR66Ej2UKEJSlcouwk779WG8FFefXcRtZ61dYFxbSsQbvBMPjIEz0x+Nb7Pb?=
 =?us-ascii?Q?MgSJdEkSWDasQ+gQ1XRHz6kyZ4xgnoU6hgyEgL0Xn07aVnGh5VegeqJJCe9b?=
 =?us-ascii?Q?1JW1ednn9ratv5/VFnczKE0uSJGuKdN/v+J31OWO6nhCWus/PA7cxaUIWG3z?=
 =?us-ascii?Q?K0JxK0LCRZ2YUBjxHHVHuB0+L3AOE7BTp+bgbkUJjUeLYPyZJ0WrTVvtjgT0?=
 =?us-ascii?Q?ZKDFDVZNBm7/gU+JTqbuDyi0Bfet04s0roGeAPoOQvbCFf6JZalhyAPvY6yQ?=
 =?us-ascii?Q?QxppykfPslg18qvzXIJKvBHjWFRb+klqfqs9iD74Ig4xUowPjOwoZhK519+m?=
 =?us-ascii?Q?ku+vZ3OzhBZdA8AE75TNmzyCF0s7qlGW/37Etn8xKz6f3xyBf8BMqlLWKfZT?=
 =?us-ascii?Q?ajSA0cNuaepB2MashaUoICKbp7NsyO1eHeDoqjC9md9ciDzPpFhqg1RA0Krh?=
 =?us-ascii?Q?jsinoWJDBMgR4kaj4+7HwzSHqVt14nvJEfEKE91CDo5yt80Ohj8fhO8qlNvH?=
 =?us-ascii?Q?wvUJWd/WDp2s51C2vmwvbf2YOzeL5YLctOMkeeCUC/XnRkJUXJp/Z7et/Jdw?=
 =?us-ascii?Q?AB5syQJ3M4ar18RmJS3HCImJn3uA00U8YR20Q+tyLrrO0UUEwOSP16CpRmNp?=
 =?us-ascii?Q?dgRNUOOl0+og+lzAMGr1/ovQWoS1LJ2BszSgKpk6XsSZr/YN9H+lfe4MCyd2?=
 =?us-ascii?Q?bhsaFqiTa/72XC4PJn9Dl14UVbXcpsJWy5/FIHDPxawxDl44AXfYh3kGsSj1?=
 =?us-ascii?Q?PIiRohdLQjmKdtWQMFnPuB/rPWEx/3FTh+vt9ZFV9silhutBPRV5C7/qlDTv?=
 =?us-ascii?Q?0KVvTcG7ysMybiA31RNiqQC6++sJee9ywphOCTbuwC1+5vwisPGTLs6e9bgg?=
 =?us-ascii?Q?t9lTVB72BGN80c0Ow4cHnqodO1NIRgXcpausZQIES3kHoByf8oEsSrPiEMrA?=
 =?us-ascii?Q?MMbHFEbEwc2d5Cmt5XOb2I8i+UKUNBT5AnJ/xaKlnFEF3XlThORW0Sn968b6?=
 =?us-ascii?Q?dYEUMBwg3dQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?c/R1QO/Rc9sFrsxQhYkiOt6U9Ik1edfadSwwPG5S5Y6Ng2xoGJp0bJcc0G2T?=
 =?us-ascii?Q?48rZkbpD9El17ZAaRBZWkg+8NFQ4ShSy6oQ48c20kn6kEKaNKfxzmtkXaxu+?=
 =?us-ascii?Q?Z+0V+hWJX6pxsF4L8wt/TEAHpte5vaJgnB/EcftZ7EScnvukuH7VTL50TP2A?=
 =?us-ascii?Q?M+ezIxkENm/OEHRoAzRv8go70FkI6PLo/9z+6GM0+C8ml1aYiKRkQVE3o2XW?=
 =?us-ascii?Q?rpmnTu0N3HF/wYUO65DSb7wpisGEXLOiQAI4fWC3atmuc6EDAMnHE1lAPIUS?=
 =?us-ascii?Q?u4j3Ksg8UsTDY+Sftj2qzZkpSriYT3IiJAZWoUwrZ/7el4nbkWlMy64+9K32?=
 =?us-ascii?Q?A6pRt8JH/NafpzbxHi+KnQI5JxVrJiJq9D5sDspMtB2qjx9QaHxSyyzd25UQ?=
 =?us-ascii?Q?QhqJqtjxMvcy1gpcxPdMJUZ182GSsHG6vli9WjL+yEto2VhWfpBcwBCXNf1P?=
 =?us-ascii?Q?TZpX3SJ2scj2t+l3XJEWNVl4fA6T6JTw+cEfBBq53LkjxA6NBN7u5J0xAQmB?=
 =?us-ascii?Q?DyMZ5jmzdwZHv1AY/T2lIzC/nnQ2prlb8mcI9E9Q5xhc+f5yWOlul6QSWVCW?=
 =?us-ascii?Q?hnNp0xneuyfk65OGv3m5GGFLeBkVZZaK20b/rJUGaYMjM0YoTGIq1ehREwo6?=
 =?us-ascii?Q?84fApK6TNzGgIP1OR+iZkKGb0FMPkyu4aECv810G4Cy6IG/2eJN7hPjoCOM/?=
 =?us-ascii?Q?CFevC0aRsvqLHAQXIpP6CGY5w0SXMPTUISaTB2eH747slWKgr36IF1kO0lIo?=
 =?us-ascii?Q?fH/2gY52ZqGNQH6CvNVh7DPjQv5UxwfsJDcw65ODJhY1uPePfZVRZhjBd9sZ?=
 =?us-ascii?Q?qkH9nfIZI98po/8icoW4CTjTKDNB9erKvgrnVHaP0pptTqRTnlCX6KQqommt?=
 =?us-ascii?Q?/SUAu0PuuqRG47/s9tzT7DR5B3HTQYfUyu/e+NdHOZdEdr1lacmdPCPi8lMM?=
 =?us-ascii?Q?ZdTOgHEdh2p7gzjsQU9malLKApKOsNPAAW8wKbxgAuUgGp5bF81679C8YPMY?=
 =?us-ascii?Q?l12YOpx3F6RcYkFtc9DPeJPEV2kkx1hVWsJvoNZnAu5VY1BIeBoNkbjpK97V?=
 =?us-ascii?Q?hGhjeZ4Or0+3KqjCH/WE9GJ0S6dfCKmcDoMSZ10+v7kQlGMojBWMQ4uWGzx6?=
 =?us-ascii?Q?rQKuyG0GzUcvA/9XTSM6B+UNdZeC4F6ZSImZP7Kcsb7QOo9Mvl3OLwTWDxqJ?=
 =?us-ascii?Q?mgkQtEBTtftcFjq+N4YrTzkoXeTZitLOMD6cED2ITv9bypX/s/9t/xpZuHwH?=
 =?us-ascii?Q?hzGNR7h05aNkvANkyY2MPCTEBOrOewL+XNyqf1ZfQ8cCDQ4cCDvoQFZjF+In?=
 =?us-ascii?Q?1KOwdq7WKHxx4EtficNcXTd19kJLM32NNlmq8LD2cpY34YIz0rLdG0oi5JJ1?=
 =?us-ascii?Q?0q0mMlrgAmQ7Y+tHEzcHra/D2kPVE4+Xtuqb4NH/BCWT2cLQOtPatJMsx/Fe?=
 =?us-ascii?Q?O+bR/0qWBywt7hdgbawbRc2WquDD+IMeoV12UxOHWje4UzQoywlbp6ZWCU+/?=
 =?us-ascii?Q?KpL5AW0qbOueUtgaelrbGIiVgJ1dPFG1fmuG3O3eCVpoKZLYG3qOEHivv3eW?=
 =?us-ascii?Q?677Mshj5iJhh+7BDdrBIK1P1JgnXeFoSogB6ckX31bl0YWsrVChEprRoQWqw?=
 =?us-ascii?Q?IkCKNDHy5vcK4louP7wegRg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83967c70-8fce-4bfc-9b89-08dc97082dff
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 00:20:56.8084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qP8FzD0D8wbAuJ/L+POJGWb7JCop4WZCyGh2Cwm9Yib9cBN+y6D02ycGam8Fa1HpvmCJ7bySCfujLkxCDrv7qC/qtV52gk9Ejh6BK9WyxtvlI6Qg962WzMnAicZlUT32
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5718

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

