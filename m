Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011063.outbound.protection.outlook.com [52.101.125.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728573FD94F
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 01:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784598191; cv=fail; b=El28AhiLaUZTobTtJy1E+kBd64pc5haQRTu0arSxG8WJ3eMezKbFg0HsrZAvTQF9erU/QG/GxErbXSOOA4YjDMJCkm8s1Pqw2EjOVPtzKlppIQPeDWaJM0ab9qE+rzrIIht7SXR6mg3RZOkolnKEPxARsDqxYzOHTORYUFKswqw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784598191; c=relaxed/simple;
	bh=BweF1FbgxqIwSOWPdtDW8kK4j24jc+VCNYFjfGR03qc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=gmG72dyVXY1WQS4kLjELgm6Y2pU9mxRWgD8wIOWGdvoUr4dIgdKK7kk8605WXMvVGlo9kmOOdP1srUosn175I+c31kVCSQLsKHshYrlJaSWBDRzEIwgFPo43fLNulmU4zlVCcIjfxJSgocgX1P7keYYosz9j+TTp+HslY5Z2Bu0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=S5MjzZ/t; arc=fail smtp.client-ip=52.101.125.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="S5MjzZ/t"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IvjxxEImv3rNMrtZ222ywOPXAExduWIBNOE+R/MFHb0rG/WQxjz7eKLiexOyHYbAxUOQ9OSYeiRs+KQxF0oIbFhij1KlyevL+Dqd0V31saqM7u8gnaCHqCADqTd+y5n6IIKKXQjtrrvIeL3r63UBkeS8ykbsBxeRf+aGVVybmBXGz24O94Q9HcIXg/FXbGcapc9d4sygyHrzzd6NjGtngI7soEA6nv4q6e2MVRpfbLHTtmG86tgQWE6lB9JFjFGYCrRti1ccBM9Q+ZewK3U9BT6CfIMd3oYFeAt9pBYmDSddFfWBKh3rzmwt0SldaMTsruZrkRD2MBiIDY+Y+VbchA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qr1d5nfR+Oz2yJA5BO5vp9/0O+VpGU7XIT8oDNqoRQA=;
 b=Y1QpQuIMkEJzsPWQmWZq9QYcPSABqxaUSIajFr+eUYsUrW8MVgdGBwe/IdfKxH5gQhLNc/Z4MWUuKuDa6zoQDYE6dhRDobIPy91lNJcjHKXaguS/mfoYTn7bMUQjD/ftfnf1TYM9Qfih1EF8roNF3gH5l3rpwXaGXs438+dBBmE4ngBI/+ZjDELbOeDjeeJhlUaI7Q5Zq1weijfBcSAc5tCcm2S2Yooi7QdkSf7zylgsgsIMjDA11i+cNnjLmSWzx3uxZc+AdVRCWEVUmk1AR2fIWHnfVxXvkBOWPN/scIygt5edyiC5WYsh8aHe4IHbzp3Gwlw5KuIX/0Qc/5+yyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qr1d5nfR+Oz2yJA5BO5vp9/0O+VpGU7XIT8oDNqoRQA=;
 b=S5MjzZ/tgvu4fNWOBRLqE4jYexwhbOfKEdKREnyHmN075wf+JR2/SZEHb3Ng8mX1VzlLx0QgnQN1ZhGqHQm/P/zIbzjDw9xC7H18/lnKe+AQetE3iJ58zMKRO+wusX6CofIPv2lrbmvYFu4jYkZib5CrxjEURmVSfzhzlDOLXiI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYYPR01MB13531.jpnprd01.prod.outlook.com (2603:1096:405:1c4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.15; Tue, 21 Jul
 2026 01:43:08 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 01:43:08 +0000
Message-ID: <87ik69i0d0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/3] ASoC: ti: tidyup not to use *card on rx51_soc_probe()
To: Jarkko Nikula <jarkko.nikula@bitmer.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Sen Wang <sen@ti.com>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87ldb5i0do.wl-kuninori.morimoto.gx@renesas.com>
References: <87ldb5i0do.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 21 Jul 2026 01:43:08 +0000
X-ClientProxiedBy: TYCP286CA0186.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::14) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYYPR01MB13531:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dc8c0a5-c0c9-496f-c328-08dee6c96a64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|23010399003|366016|1800799024|38350700014|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	8+bI+QWGzFz+7HDjy0q/l3F/OVRwXwZB/lcYOBq6y1UNrTfqszFKJURdu+27CJqC4WUVQj4/qRjM+cVFO7jzTr0P4V85qDJLlQ0nOKIxn3u3CST81ypS/1NCbB1KHALOWvNK2it1D8WDnKW6hp4V20vVehTxevohPctlK66J/TD4XWqB/WUdWSCJx2Do8nV3Sx3zlUeEmEL/DSMRGA6LR+XbRf7iwAl0zOGwonY6h5zYAP1RQvoR/bTAQSzphRz3rNI84/TP3OH6jZoxkEn3OFUnLaocjgWCCgC7t1TsAg/C3kiIV+95pDxbewXTl/haTF9rBTEqWfEyjWltfv3FXsyGlib1WoGY49LNnSo91/clyfdXP45JjH1JAY2QBPjX0lG7yya/5y4Hsz9lMipPj3nYSiiw1DIkHMJxkOZp0pE/jseoSxIul8xBgsrfxCB7FsiqkhprO9EIKAbuMPXCuAFEnFjzp4fbDMeSWg7UDD/hI0/jR8hwQr5iMsbJGEmuC/U8uLnd03+xsHore9qIQG/oyp38rFU2e+bwnd+N3y8D8qE3K+k89wpaHvIFUmlY31WEu5XIAQmzAP2zizgxOftKCA3LdRBwFJpUaUGbAC1KWLIKFAzpFrfFFyWPDsOp35ifTvbwRDMMBdEew6AsaDanJGcwuSJypx1rb1JtBv1rC99eXUC3N4NKqGihkRdpYDYyc4W9dfP5RIvmFNoAByhfkT1WDbzP5rQMhHdvvxw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(23010399003)(366016)(1800799024)(38350700014)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?to7QGkE7bi+po0jAAKr6c55uU66Laupi9NsTjS1Rsn1B/qvqbUxUkEd6/TkB?=
 =?us-ascii?Q?LrXLW27QWeb3sotQwkT7VfnJ5n6m00te6qU98e0ZJzzbsH/oQXhFpzRjBwjq?=
 =?us-ascii?Q?5r9ckdpN4AC6ZUBd+AOEuIBme6tWy/5IMZWZO5lsqbGp7mtbOgBgu3n7rpej?=
 =?us-ascii?Q?WVbm4ZL9+LiDgxx4wqV+g/GcnuWauEMfcBLi6UTBuQvz92zI8KhNz5tyi30R?=
 =?us-ascii?Q?Fz1PFElChei100tS4XfVSdZUaOJVlMB1uFnMz81NQ9D26KvsnoMMZ8wq9RWG?=
 =?us-ascii?Q?wFPWEIxpOgjB0utXYCg1asP1a95xIP9Sbb4v5A10uxvjwdW+3v+qgGe/s3zq?=
 =?us-ascii?Q?QEf9+CZmI5skXZejtt+2XC52QsK3c/1zuAcJyD3bHjmsBm6HPiaeUTZEx3w1?=
 =?us-ascii?Q?lVSUp/aPTkmHTu8zE1l+gwK44chVU79EhRdKQDvUq7+aaTjjnA8+9l4BKEgs?=
 =?us-ascii?Q?iQMJAKruPDESUc6eP1hyUJ2sRnAuDshE/iLUZTfjaLVCkBgTee8SY5qPMHSv?=
 =?us-ascii?Q?eRP5EPzW/PnymLdd3smDJrcnP6eeIrpfJwcAK/V27d8G0EHTxfcmVhkOgvXH?=
 =?us-ascii?Q?E/N/VOFaRNE3UIioLNxwte/XVzZ6aCLQgCgkcPC/3WGVxfO2KwXpADvE/XsC?=
 =?us-ascii?Q?/7I38mEsn6CvLI+CoELEhdx0QWUyK98VaLerv4a9p5Po4HLWLm6WrhMzI9aV?=
 =?us-ascii?Q?anXmZb5F+S2iy93EwOdNWtSMbgltuRIAfsWlT4JWOLYSes1nGRAWg+qe1kVk?=
 =?us-ascii?Q?d0a9np//DcAPDaCe5CwBAN1OH7zxzn0vozAPhG+2G6fagDGZUEBro4DqXzEt?=
 =?us-ascii?Q?JGsXEGsq4sCQ70gk8e59cgFWQsL8sFrK+/0nVPIuBMbUAEkIo2PCloELRwWS?=
 =?us-ascii?Q?oXwcaKtIGrlC2rWrZoODgSGWdOKOfeX/e0R7eEL6ujJJGGtGwMMw61l2r0jx?=
 =?us-ascii?Q?/nBv8dUoTAuUxrHOavwKqFaupscqd8fHW7Q/FwmX+73k2Vg5TNVrqaI+i20B?=
 =?us-ascii?Q?ult0UKsaXL51OarqnH8v9ZmAziemG/ctxWabEWElAM1C8V33DxOb3iUQSVVB?=
 =?us-ascii?Q?w2bP/uYX+3VZSWxpED8fW0ohLm5qNb6B1dO2FjLEUHFMUdRT5X5RfT2aJ46F?=
 =?us-ascii?Q?Q+3hKhrAGIqY5eRwn7gXavKxeDzzJXzbRcCIWCzMKaCuXlZdAbshhbV+N6BK?=
 =?us-ascii?Q?UgMxkFitJQeko6T1A3w9Ve2E4Y8ylaKWpO7Ry+LKrG20bxS+MBuQ7yc1mskW?=
 =?us-ascii?Q?LSf7i+j7h9qQE5oTI9flT3AmFliSeJ032RvMhdT8vfW4XB1MojuW+Aykb8re?=
 =?us-ascii?Q?pLnyhlhjDU6CUA8qYp4ByamB7ts6xPH1vHJ+PR77e89QCcnVxSvZQQWduSd9?=
 =?us-ascii?Q?63sSMwI+pevqykDyIBjEahjuG2fIL6WMDiJayhhh0iglJGSJ7AMiEwDw9KbS?=
 =?us-ascii?Q?+3x/CygUpfNmlK3W3TvhHfuBKu2Wh5P1a9RF6t5MPZS9OM5wjxMBvTwwAPpM?=
 =?us-ascii?Q?3eMV0u+tu0hf0RDB+jDqX5PgjtGVo9dHnWWNB4tmePo7vBSCc+Q/ZzrcGqv7?=
 =?us-ascii?Q?BiFUiExC7+1Ftk4InOxBoyIYkxUPSA2zNiVqMjZSkz8i2XY65JO9JyjTcCKR?=
 =?us-ascii?Q?+tbs0OpZ1RrdIH0LWXPxGN+XQDYvJULIEcT/N9fes9IuoWzoY+F5FGj6KuuH?=
 =?us-ascii?Q?i4DSfY6CXkwR4X/HiLcOj0f3xtJNl4FrLUemXgmxzflyWiA/OEClJDbEo9S4?=
 =?us-ascii?Q?j7PchA8noQHU0q6oGx0OpvpQeA4Xj+w/QUl6uYFwO8Dti2Wgy1WJ?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dc8c0a5-c0c9-496f-c328-08dee6c96a64
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 01:43:08.1932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6EjRKxLh8aH4hEji1GykAAuqV/PVsBbJXVIPK9jaNbX5ulGiCInzKD1jTcNfQ5m4auHdgTLsTthSC386TXyf9iVCMghZU//FzU4E/reH3gV5lFDqIzZJTLbEp3tceBLC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB13531

struct snd_soc_card will be capsuled soon, its member will not be
able to access from non soc-card.c.

To reduce the difference during conversion, replace dev.

	- card->dev, ...
	+ dev, ...

No functional change, but is preparation for Card capsuling.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/ti/rx51.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/sound/soc/ti/rx51.c b/sound/soc/ti/rx51.c
index cfc23e0838c25..09de571c898c2 100644
--- a/sound/soc/ti/rx51.c
+++ b/sound/soc/ti/rx51.c
@@ -358,21 +358,22 @@ static struct snd_soc_card rx51_sound_card = {
 static int rx51_soc_probe(struct platform_device *pdev)
 {
 	struct rx51_audio_pdata *pdata;
-	struct device_node *np = pdev->dev.of_node;
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
 	struct snd_soc_card *card = &rx51_sound_card;
 	int err;
 
 	if (!of_machine_is_compatible("nokia,omap3-n900"))
 		return -ENODEV;
 
-	card->dev = &pdev->dev;
+	card->dev = dev;
 
 	if (np) {
 		struct device_node *dai_node;
 
 		dai_node = of_parse_phandle(np, "nokia,cpu-dai", 0);
 		if (!dai_node) {
-			dev_err(card->dev, "McBSP node is not provided\n");
+			dev_err(dev, "McBSP node is not provided\n");
 			return -EINVAL;
 		}
 		rx51_dai[0].cpus->dai_name = NULL;
@@ -382,7 +383,7 @@ static int rx51_soc_probe(struct platform_device *pdev)
 
 		dai_node = of_parse_phandle(np, "nokia,audio-codec", 0);
 		if (!dai_node) {
-			dev_err(card->dev, "Codec node is not provided\n");
+			dev_err(dev, "Codec node is not provided\n");
 			return -EINVAL;
 		}
 		rx51_dai[0].codecs->name = NULL;
@@ -390,7 +391,7 @@ static int rx51_soc_probe(struct platform_device *pdev)
 
 		dai_node = of_parse_phandle(np, "nokia,audio-codec", 1);
 		if (!dai_node) {
-			dev_err(card->dev, "Auxiliary Codec node is not provided\n");
+			dev_err(dev, "Auxiliary Codec node is not provided\n");
 			return -EINVAL;
 		}
 		rx51_aux_dev[0].dlc.name = NULL;
@@ -400,7 +401,7 @@ static int rx51_soc_probe(struct platform_device *pdev)
 
 		dai_node = of_parse_phandle(np, "nokia,headphone-amplifier", 0);
 		if (!dai_node) {
-			dev_err(card->dev, "Headphone amplifier node is not provided\n");
+			dev_err(dev, "Headphone amplifier node is not provided\n");
 			return -EINVAL;
 		}
 		rx51_aux_dev[1].dlc.name = NULL;
@@ -409,38 +410,38 @@ static int rx51_soc_probe(struct platform_device *pdev)
 		rx51_codec_conf[1].dlc.of_node = dai_node;
 	}
 
-	pdata = devm_kzalloc(card->dev, sizeof(*pdata), GFP_KERNEL);
+	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
 	if (pdata == NULL)
 		return -ENOMEM;
 
 	snd_soc_card_set_drvdata(card, pdata);
 
-	pdata->tvout_selection_gpio = devm_gpiod_get(card->dev,
+	pdata->tvout_selection_gpio = devm_gpiod_get(dev,
 						     "tvout-selection",
 						     GPIOD_OUT_LOW);
 	if (IS_ERR(pdata->tvout_selection_gpio)) {
-		dev_err(card->dev, "could not get tvout selection gpio\n");
+		dev_err(dev, "could not get tvout selection gpio\n");
 		return PTR_ERR(pdata->tvout_selection_gpio);
 	}
 
-	pdata->eci_sw_gpio = devm_gpiod_get(card->dev, "eci-switch",
+	pdata->eci_sw_gpio = devm_gpiod_get(dev, "eci-switch",
 					    GPIOD_OUT_HIGH);
 	if (IS_ERR(pdata->eci_sw_gpio)) {
-		dev_err(card->dev, "could not get eci switch gpio\n");
+		dev_err(dev, "could not get eci switch gpio\n");
 		return PTR_ERR(pdata->eci_sw_gpio);
 	}
 
-	pdata->speaker_amp_gpio = devm_gpiod_get(card->dev,
+	pdata->speaker_amp_gpio = devm_gpiod_get(dev,
 						 "speaker-amplifier",
 						 GPIOD_OUT_LOW);
 	if (IS_ERR(pdata->speaker_amp_gpio)) {
-		dev_err(card->dev, "could not get speaker enable gpio\n");
+		dev_err(dev, "could not get speaker enable gpio\n");
 		return PTR_ERR(pdata->speaker_amp_gpio);
 	}
 
-	err = devm_snd_soc_register_card(card->dev, card);
+	err = devm_snd_soc_register_card(dev, card);
 	if (err) {
-		dev_err(card->dev, "snd_soc_register_card failed (%d)\n", err);
+		dev_err(dev, "snd_soc_register_card failed (%d)\n", err);
 		return err;
 	}
 
-- 
2.53.0

