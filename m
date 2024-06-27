Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2051.outbound.protection.outlook.com [40.107.114.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E15917C68;
	Thu, 27 Jun 2024 03:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719460320; cv=fail; b=G7TJ4iAd//R43eXdbCayTSGk8PkFtCSzaAedyU3/hwbMQ9XWrzMYavuD4RA0gRAIjAOZj/+akygRZtbnOkwdriWeZEG6/by+kmZrQHk5MGuUwG5Wg+VIHfNEDYFBWAumb2CDfJLQsjT77T5a3Zc4CWKNx/Mzmv2ioef8OHriM30=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719460320; c=relaxed/simple;
	bh=SLS1CWCqSr1KT0jarvABGJUcajTXzs1N06amFRN6lms=;
	h=Message-ID:To:In-Reply-To:References:From:Subject:Content-Type:
	 Date:MIME-Version; b=g9gJKj9U8B5QO4ImM/vyL9x6IekK7osstL866ODRhvKqfLhTNy9i+Z+kmNVleCWCdveGQG/8zB6ld8F3Bg/mVs8vEauXF1RIA9N0dO79V4sDkPYqvHKAcmUtoYSZnLh0VyQMVWUrFTbgP30uNTiIigUb5PyLoLJrVyeQoIBm2AA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=QR2Ke1PF; arc=fail smtp.client-ip=40.107.114.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="QR2Ke1PF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QFuQBI1E0b6iEVFdEgbdmuYTK7MeqV5e95EdbZcgsKocTp+GVs3Odm2FIVIfa8jkCkbvLmv9/cTWXt7ZRK1x3dCr3X23R6YQ7y3CGCfbw+44PStAuwnFzSNoHV8bX3BdVSXKPOCXDQjmcYuLDt/YOQZ+i9T4EPfZ8C3SjyyTWUUr1drB7ATGfSp2ZvyaIg1zTVX40WHTyDWfObrwldY4ZWRW8UjHhBMmZ2U8ONefQekoGG+hRTdqzyE4grBxx2Sl9dTXgC5Ei3d/Qa0ncqKxMavHZRbPakUXAurkb1R/2Tc8sHu4F+/74FKbajxuZmIeWdFc4N+f11KuOV6jGUtCTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M+ON5YZwxAql9zKiPem8aDn6uZ0654n6tV/b5ssNI6g=;
 b=lOJx6LFaxaVyjzxzHw8bydJBOr81yjZJhnzgBYyIN85H4gFjtU/f4I/nFGvU54Lgl4aVnARns+pgZTNYYYl4dc1CUxZzE6V7yxzHcRHju1L/Rfv15Hqdsk5r69R3AEzNkaB7Q/MJhYNE658tRH3JLc2YWk+lAJkyj+SE1lkbRhw2ENC1yerdBOF0CAPfYRa3A/aZ7WBXJTMyRK9jtL6mmPATIhAEa5+a8o0UKQPqRevNm4dDlXNYv0dUMJceZYjGLbhf6g5HXFw/dEvwnEreCaytTK8A5LvXcKkaStnwjo/SySZQp2otXKm5o6KGZ5mKGoIlgSE4gZ2drqxTtGIYkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M+ON5YZwxAql9zKiPem8aDn6uZ0654n6tV/b5ssNI6g=;
 b=QR2Ke1PFTvxXt1pE3Opy67NwZJP3qMMZQO6afWPjnObotjC51pMF5jHHc/8SuNJA9f7V6RB56F4+qdodcAt7kkgtCPDTdiwqolOYKjv1orvo0wszv/QoIOtKBcIuzT1Ge0Q9PyrLKovGXWkSPBgjka3+nJyFAcY5XgGhfCY+PZk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB5782.jpnprd01.prod.outlook.com
 (2603:1096:604:c7::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.35; Thu, 27 Jun
 2024 03:51:54 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 03:51:54 +0000
Message-ID: <87a5j7qbzd.wl-kuninori.morimoto.gx@renesas.com>
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
In-Reply-To: <87bk3nqc0e.wl-kuninori.morimoto.gx@renesas.com>
References: <87bk3nqc0e.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/2] ASoC: simple-audio-mux: enable to select MUX names
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 27 Jun 2024 03:51:52 +0000
X-ClientProxiedBy: TYCP286CA0347.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB5782:EE_
X-MS-Office365-Filtering-Correlation-Id: f46c7ed7-47b7-4311-3bff-08dc965c7adb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3KOX1HB7YnGu5OPz7I4jCR6vEnPYAsNTcPTu+ACw6oZY4nmVXYaaJXd8IBmr?=
 =?us-ascii?Q?FywgpuylMRzv9o1/3PddOeOwkn8pez0/KxsdaGseBaMqJMMp/j21ztmh9Opb?=
 =?us-ascii?Q?4cW3X9SEh77o0ILSZ7WuCQvHnzClDpVwfi/8s99hN0pKPqGwovlKDzgElN1u?=
 =?us-ascii?Q?BmZWZCcadYiCNbMROAk8DV9DzuBHX9iGhBi8z9Oc8crBFlwX2dDiHf4n3tix?=
 =?us-ascii?Q?DwyUGScbAPbVEXgseN9qMk/HTpjCaQ196kaXeC7D8v7ncuKC33Yhc1riSZFS?=
 =?us-ascii?Q?Il1tIwk+kkjR3+I8fka5FeJrIOBkfcsxq2swnU0uB3DeXcHS6BS3fHjEhEsi?=
 =?us-ascii?Q?3SubvzjeiN7vjFWaK1MOD22a2kTtZV0YJu16bEsK8z0TcTG49ja8ZGYdkHbE?=
 =?us-ascii?Q?+gNWUnn1LDV/+k6sTCK3BGJrS22yQVQ7aEgFtDfaQ9qyuBaUMM7tS3fJSz3G?=
 =?us-ascii?Q?kXdIg6Tm1G6NqVfFsF3U0SDtw2lYDBd+F66RmVc3tCEHyz/7okVTIkpKHR+6?=
 =?us-ascii?Q?B6gfI0sHArHLLPUnzNTor6lbaf2WUF0sb8FEfAoN7kAc+bdKLJBDYq4eX96M?=
 =?us-ascii?Q?jy8SADUYTARSJsro/Z3KH2Q8Y++JC4NVtdC7sjxIRH/jbNhRFFJ2IzLo3Ckv?=
 =?us-ascii?Q?WlNYzVLMzPU0qc2VdqWUFxCGT822eaaMp6tODZgT+eQXBp84+/dcHAbKlllI?=
 =?us-ascii?Q?bjH2SZwyQo7O9I5SGD+FFK5dPALwrDC10CpxR0Jwl24s2XCT/0KtmEe7fjE+?=
 =?us-ascii?Q?OWietPVxY9QZibhUUiH32PxlqVQ0IlBG0GXuEvqyw15OtwtNSNGX6heNy5cZ?=
 =?us-ascii?Q?wtuFwlwBNPSajzfCh8mkNNHFCqoOyPgV+IRkWE4zPA1LVDwMmKSh1V6vGs3p?=
 =?us-ascii?Q?9HNi9jwo0kHlYbJcBs5DGmVxOpNjBUX8L7igX7ICEULW3QghrHywztZAM8dA?=
 =?us-ascii?Q?K4WrgGv7ijS4pykGHbQU/sMPaYlFUaNkh7cU3q+sGHeHLJLQZ4vLIoaQ0Tt+?=
 =?us-ascii?Q?ni5D9TRPcHAXqeI4MaIZocAVkCEOdyw4OxF8kYMaEoByk+PwFm6sRX1DY6Vp?=
 =?us-ascii?Q?LbJ+yXSYHUuduURQ7MAdA42B9mo9Pcm/ngJmfpzSoYbxu40/keEOlUkORzI0?=
 =?us-ascii?Q?ZoXWz5gHiadNptwDkKBziExMo1lzi5E3yBIMOsnmYmdazKAwUnKgWmQE7AGW?=
 =?us-ascii?Q?ZRVe2AbgDhw6MzMDs4roJWdOwwUu1huGSgiljNQv/SN8dKNEMphneDuKZCs2?=
 =?us-ascii?Q?xty/yslpeDgrCCeApEUUbTpZNqzjqhmTkEQrAqVj0JPsEQr4yfX+V6/YAXWr?=
 =?us-ascii?Q?8V53dBHNbZCo1ckEW0XsRGeihJwYriPuJ87Gj7FOrueTtvuwVnSIH37PCdPc?=
 =?us-ascii?Q?wPSJXEiZwmpkgf9xAENnQiDIym/DE9yeWFJ/41omqGi8JNuK65K6gqkcTQ8l?=
 =?us-ascii?Q?vfj1nlt4+F4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oJH5XvuJWC9sPI23gIXuCLlkafr0LWA2yTJGReNT1QflHYJX/xlnXCFl2BcJ?=
 =?us-ascii?Q?axwUKAGuuMr9yIUQG4C02Gvsdzkwt5ObVtrcqkOJv1qtz1Iqr84CByAqnQGu?=
 =?us-ascii?Q?m/y0zz5joU1I6OhRHTAPlB9/VqKYqDKAOdeKJ72KczK6Fklw8TSRKJ9thrxq?=
 =?us-ascii?Q?zB3oPXgazrG5G/NBwA2xJPknyzva04abW3AcPQDFuP1zVcgOr1wRMLTF+C7y?=
 =?us-ascii?Q?vdlr/ZbevEHdmktQcKNAAMFGOELSQO5fISi+Hfs80LcrJaSLftff6w6vhW6r?=
 =?us-ascii?Q?FxewaIcVRiQFBCYb81p4c5RnemqDZ0ffULY3YD6T6/EBFekYJzSNOjMl2Cnu?=
 =?us-ascii?Q?2NiljYzhcSxSe6sWZ4HP1dO8jWMbmzJT6c/kSIDG1kYorapVhvxtPH+EjGQD?=
 =?us-ascii?Q?5pFS0cTJxDIhWsaxL7d1iqJY94wjbXbhbNALlKShTiYCC5aL4I3/CXKxapFT?=
 =?us-ascii?Q?Vch/zmH0WmocNhiXns+5WcD7lKd5SPJO5fmMLEL2BzDvf0HhcpvRHcd/TAJF?=
 =?us-ascii?Q?ymfEoOf2IiEQqw77zgOTyIEYXaz1wGD+7GqHGyojWBNIXMDd3rvyPrI4YC1Z?=
 =?us-ascii?Q?WRIdEjBvj/DKRG0pDryRz6+pSU8GVsz8P+rktPl2RamVyav0/D8ega4iRhw0?=
 =?us-ascii?Q?pk+ytbYV9rHsaFmSSQRKmmvIzSTzAcPusJUK45Zt+rEjrqzon0qyABO5nVIQ?=
 =?us-ascii?Q?Qf3Z+AHJwTybTd9p+YlmnHdWbu9EVgGkpu1vCKY0wit9KQjOmPMZsduGGnn6?=
 =?us-ascii?Q?ByqZvgN8JfhrwwFU0lqDhmUsCIy+5luimy3df+uS8TB2Aq5O4pMqT7FSdjEw?=
 =?us-ascii?Q?b0iwqyMuffE5F/ArtmLJqudoyYjLlT9yAWMdFQccKpDyRaW0UJWfJXNI/7Xr?=
 =?us-ascii?Q?x0JuHGsCNpzW/kY+VqLiP42sX54685Xkp9JqPfS3uWhGH35M1m8JcbaEZl2W?=
 =?us-ascii?Q?UyLLUIe4/Lv/dalnM6FMhbWZG/JefjzQwclSZx1p6v8tuYlkD/ODWMT6+mQk?=
 =?us-ascii?Q?spMW1zk8rgnU7pyiKgbZojXOaBtfKCwYv3Lkm6SiDxZePH4AJPWzg7PRvNIm?=
 =?us-ascii?Q?SlcU/faYRcu3+J+mzZQiDL9OCuoRAP8qQ6btXc0GqBlQQkT//SiPSg2PTHee?=
 =?us-ascii?Q?UY+Qx4MSqo5tHdfDu9T63aPqH3RBg7uM/2McQlniguV8dv4ftscLAW4cY4LS?=
 =?us-ascii?Q?8iuZuKeaKmV2iM/xTVnvt3QAkeVmR0Kkd9q+klKHkxartQmyyGVIaWc/MlcR?=
 =?us-ascii?Q?hMdk42/X8BcY7dLHJ3Rm/+uoCQbi9SGfJS24RvM7AkFcZ1qLcK6vwI5lkSH4?=
 =?us-ascii?Q?wTewouCoILTra/hmO77I9GAlu46aMpcDENX0Y/Mcyo7W0iEn7y4IXVm3XC3Q?=
 =?us-ascii?Q?Bv5a1Kr6Sj1AUeziG0+Tvt1WI3XXt+diPys9zU30xQiItm80gfkcVCBs5HRm?=
 =?us-ascii?Q?mXcvobEFB9FZJ6Zp6+hVoUUesHf1ot2cPPsf6ZrXgtOK9dMnmg17+0YHfdwW?=
 =?us-ascii?Q?1t5N4/sklnMZjimUW6pRgndYkQgglfhbKGuZpoSN86uHr+a8+CyxahRqRLsv?=
 =?us-ascii?Q?ne8O52b4esAJb3tX20VqyFFQ9iP8GaYLKMSWcHjvwCRCBPOVjgCq5DvdQwOz?=
 =?us-ascii?Q?HSgKVf+ZmrGwS9ztJunV1MI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f46c7ed7-47b7-4311-3bff-08dc965c7adb
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 03:51:53.7502
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Psax+BhExUAJTa4TpmhVcJsl+s6kIbU3CpMjY5z5tWRAm/KhYt25kzJPQEVjvGhN6mMtweFelSl44+29AU1zcAHWzFCwWFA7Wh2dmEC0n2SN2CepviQ6sV1PidLY+slX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5782

Current simple-audio-mux selects MUX by "Input 1" or "Input 2",
it is not user friendly. Adds new "mux-names" property and enable to
select MUX by own names.

Original
	> amixer set "MUX" "Input 1"

Use mux-names
	sound_mux: mux {
		compatible = "simple-audio-mux";
		mux-gpios = <...>;
		mux-names = "Device_A", "Device_B";
	};

	> amixer set "MUX" "Device_A"

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/simple-mux.c | 55 +++++++++++++++++++++++++----------
 1 file changed, 40 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/simple-mux.c b/sound/soc/codecs/simple-mux.c
index bf67de12d20b..41f982078043 100644
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
+	of_property_read_string_array(np, "mux-names", priv->mux_texts, MUX_TEXT_SIZE);
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

