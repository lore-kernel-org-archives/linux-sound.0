Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010066.outbound.protection.outlook.com [52.101.84.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB110335BBB;
	Wed, 25 Feb 2026 10:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772014072; cv=fail; b=tEvWsCzBONZFRcgR4jqbk4XF/elklrEKezE18sI+hkgghEYJfksyo3uPh9Et0JoubCvYQc39Ih1t+46IRZ4VrcTCceFSXWN51+v/q6+rBeZ/cVE70H5GS1C+YMGmGi7cMfCoI1PWoUr26avgnDob6gqUChCD+IGq8nJ/3M8hdKo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772014072; c=relaxed/simple;
	bh=uCk/Too0KKxTcHGXH5momEyEJAu+BkB9LbpwWJEzkN4=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=e3Eklg/55mSagYAxLnJbvQMGgIRP16TTJdwrOKdNvJgXfPDxJzawqEKvNl58HKSEF+DMovKnF6t5FXXeb352/1Yds5DyX+s2JLVZCHuSQT+RI493Fy2wd/ozhw67/wRdORIo6MyYJVF35ryBr2WtiVntWlV7LMDwiyd7mBIl3ak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=j2/MxJha; arc=fail smtp.client-ip=52.101.84.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="j2/MxJha"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nHoyAaQXN9XOQIwsDAiTzRVU4WFCyvPYKNCr9x3Y07913HG7JhDepPRI76zhYyiSXpfDFOBPSQ8aD2v2KwAfXmtXjIr1gR8ii2sK0oMOJt2VXibPASFjaGRAU+uE+XYoyIkJTkbgDFOg73YLc5kT6LdJaN6fr5LPA5J3CI3yoJ+KZVfu27HFGU1c97nr6Opunt/JrP3pOmgGfnd1WlCORE8zuvqfISz/G0zGwL8wVqLcOCnngd2YhzMvZk+xyE9hiyt2TPlP0zAW3ya0gnUFsUah57hggJH2eI4wN+uLWbcZdqAS+EzJ75AknxQXGsxP4gok0dSEXlTS5n/FtWjY6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=347KBZqsB21b3hizQP/i/pPsrdjQLA/OlI/q9xC1vgw=;
 b=qPJOqNkdZ3Ym6HmkHvUJQ7dJzESTC7y4zoUYgTow07hSdHc9txCOkWdzOIfWYzXddebo5qD/XTUDJRmoO6QGRSK5QgZt63qjFPkkiKMKzLA/hPs4vnjriHhYVYSwKcc91dDShsVp2MYa4IVfxy2p/RI5EOOQ+SZS3mW/YVkxTKooYFeiKUrnRWg/nN3DOFSsKN7heO3DpwLv5gnh0liSnSrtcoxL/I+/OrKrkYL5tLRatNhsT+PeiZ5AdfyIEhkWHZBf43ikeL4T8rv/gcQcOg9Cd2i1p8rIVumUiXc2nar4/xziqu1iqhSGAj0tTr0oTXuyO0ZArT4LQPZBbpRY3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=347KBZqsB21b3hizQP/i/pPsrdjQLA/OlI/q9xC1vgw=;
 b=j2/MxJhasoLjfmjooeiBqvCEyZnsHco2uv6PiJYqJgenZx1ewKklF3WrHsJWahOW2Y1T8bzAt7RKD4isXwtA9iRgcNB4IktxQWre3bXC947vvESBFi6H+alQfDFXOVB5bq+0lI8vkZnkwlC+hNY8Zuk01MInigJNqqhsF8HGw/oPrHlGdTnlp6d4tsykOWksIWpfAnvLcu2kmlShJaQQFwV+U4F/uxmvCO/oF/8URNM19IcbIyDqxe6ICgKuasHcY9kDmd9cXlw3c5OQqcG0sGDVtQVpe7N1F4xVT0b/LKyTE7w4N5YkVukIB4y0rPHEqAl72sXg2UpGXe0HmzI2dw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by AS5PR04MB9730.eurprd04.prod.outlook.com (2603:10a6:20b:677::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Wed, 25 Feb
 2026 10:07:46 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%3]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 10:07:46 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: david.rhodes@cirrus.com,
	rf@opensource.cirrus.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: cs42xx8: add error checks for constraints in TDM mode
Date: Wed, 25 Feb 2026 18:09:07 +0800
Message-Id: <20260225100907.686470-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0103.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d1::7) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|AS5PR04MB9730:EE_
X-MS-Office365-Filtering-Correlation-Id: f16cbcb1-ba4f-424f-446c-08de7455b966
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|376014|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	RBacPVfVmjXzGgmFAlfaT0/Gj1/+qvkpd170ExJlQUJSx+IHoDSXSibxJ3ddBecKA/m3b79IMc3qCezUIMJ2tobQPqDu05nFrpgh/FPRtQZszttw5TwOfcLrsVWZHA8/9rPBAWt4FvxcqGm72kbKVYRN/SWbXwrlPfaKq8UU/0NiZZGZouZXSqgBHSpB2+ZI6fq6cSvE9Jh0KEQaF/hN/6XV9j/Z+ElCNwxDC/7MFc5TC+3KEtjDocptZRmTKOQRKlDiXabLQ+DNl8wBtDLHzAI73djcif8DFeN/mnGRpxysNoYmpka7l5Z+3AxTGFBnD5CiKX/lMfR5Y+W0ErU3KMJsKMRkJBpB4BHAJf4O1Gepv5mc0tr1phmzr7IWIKRt4gXIf8RaLZn0p+j2+Q7aibFJZjD26Hw97ainTsrpZSUN0Xf91Iiiaktg2SG0yNEZBLFXTw4O+ywL3CtNi/6700m3r1wNAnE8NEoKk1Hf8Me3mHg3JkTU6Z2zMYxSWCwp2+Rc7Iky6mpa8KMZFh2Kob1WiuxPSTOn1ld/DBMW2+f6143efkkVwMKcT1IjD5N6Ws/1H8wx+fh+Larh7WFQZPRyW3XYlCvq3T96Nbiyzx1WdYRREqAZDfQYlcHI/FVSttOUdcDEiwEz4IwaY5a8wfGdUm62PFNWXnvFR81PZA963u45fqeYWPWcQPZZ51hNxWTHNz0Mq4oNalXDnySUQrP2NRxRspKUCxoH5JIOgKpaatkrFTp+OgYe2a5UcJ2xH8OlqVS+QCMsTtpNNjDH13vhPMoUiT5U7Q3zohInGmg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TuoZc+ZBhBQf7254Bsuu8h8X3eYiny4pfaR93vz4DzLxs8CnpTDgn8iFJkjh?=
 =?us-ascii?Q?w9lYO+yMyPhXYA7xFH59q2TzlUumAfRoGzR0UKQN+ZpAoWtvzhXre+c5OnQQ?=
 =?us-ascii?Q?/QZL08a9pQ1YeOj/fIa3l9A0ipfyOswlhmpl2hYx/CybyFwxzbQcV3F36igI?=
 =?us-ascii?Q?/Y3BwjQ2asJVqQjKa+7UsZX2VzdusZEkeyHItWX99Ga9642nvXOlitOsi9IS?=
 =?us-ascii?Q?YUbh22X3rfRmmeSfJLRuCYYylTS7BvjK6UO1+kVr3u3k6bMXx0shPHP9tZ6S?=
 =?us-ascii?Q?lr2oD2pa5GhzxOB0hYo5AwOG/WvZ8ZB1QSeL3BM7mzOzXn+BysXFg+0QI+sb?=
 =?us-ascii?Q?OsxBywTQrE09QG65X9/ULwJt7wSXRdBzmMWASf8m/8CcY4TsoZvFJvlqcyi2?=
 =?us-ascii?Q?TUd89aGz0oK/3ku64WoJvm2tFcW6u1wvPInxPODY5Z6iFCJTdOJq7uVzj9wU?=
 =?us-ascii?Q?LuG1HCzw5M1nNp16zI2RwF1RpfcWC16yElFbA7TgYwO9OL57T7IJpj1DNXbX?=
 =?us-ascii?Q?zmtzUnE6TGaNPNCZESRAtdaUOCroLCKj82dhRUuTHGQZqkXeRj09NQVLG5jB?=
 =?us-ascii?Q?oInfL2bXMbjT5zk22mYmxI30TjXhmH+fyT3t/9/W2W/GvEG8PGKIm0KgwbRI?=
 =?us-ascii?Q?mGu81SJ2qDMkZkCZmYv+KnNOGCRDR7weH1trcP350phJzrVFTvxaQZiYbpQz?=
 =?us-ascii?Q?5RqraeDSDzEEGJbUClllpRkHFjZbgBzO/Q0KXpQURoCu/d7IlpECb36Lwtda?=
 =?us-ascii?Q?NKBO0fj1aWGGrgK0/wUkyfPf3GjcoqzqlHwwD9bO+3Nj3FWcS1TxM74p2x9t?=
 =?us-ascii?Q?qCQSGXtkU2AzIgT83bG0Ioiv1bLwOvgi3D6jskxZiutmHgkCpUygXkdooUBw?=
 =?us-ascii?Q?XbItCxSIPwwoNVOFq6VkyHNG2/qoxYCJICVti3p+kQdNL6AxAHLxmAcn7MAt?=
 =?us-ascii?Q?yqsSSr/v7o7XsdfLkuLTWQ//0qh0/SdOWZKhdmvcMWYA6F6dpbOk8Jy9yzaG?=
 =?us-ascii?Q?dm6hSowHXiu1ypO++2JgjfdyGaFGKyLkhkDCM1nkI4SO706gaYpngdjOo1jP?=
 =?us-ascii?Q?yFZ/OB4R/Yge/vi4Rkohlx2tqEWNl/Hto5W3j8hwMFvLQzDYhZL4P0J3SyyV?=
 =?us-ascii?Q?yKsUY2e5/CcAuPdKfHjo6tPA/92v8sANOvJtOohLxBMzfQkFZ8Z8kgZ5mdFV?=
 =?us-ascii?Q?v5HWb5W0317uoH2CjCTGj6bP32xX7ECupyrobxBLeX3jspmlYR0JYXGD+GvB?=
 =?us-ascii?Q?u1P26idcrDcTVXPc9gnwToprcrUPTX1v1mwu/W4vbQa+YeDAsKaZUmraEXIW?=
 =?us-ascii?Q?ElM6ryAScyD0XiEZ2Z/eH2mLAUg+RQifWfFroEV5+dcYzZPylR1RqpH0fNQb?=
 =?us-ascii?Q?fc+LBtsF6/g/QjVW6uBdOI27yfY48P5BR5Lgn0FlEJZDLwbv1fhPSQIa5TeN?=
 =?us-ascii?Q?+cMkbqTQNg5v9TMT3EAItE7jQUj4Y6Kf27MVGYsv3v1fHVqj+7t3lE7XO0YY?=
 =?us-ascii?Q?RSAx8WrT1UGrhRA09tMrl4K4mn1i8uNVtCMcricy8ankF5o9e/uLpGgQczsy?=
 =?us-ascii?Q?xMfRGF1dr8AMaWX/VQWvpWipq2Rl+TJ7csetH78bflMvY95AxrPnhG14bLDL?=
 =?us-ascii?Q?9AFQLx0/++e8Py/b+BUFITTGG/9hJWZc9e9W1uSJ88el3vINEVgz1uyndhL/?=
 =?us-ascii?Q?FAs6g8tv3UL/ijCuxjEUC5+l2kaYSnw14PZZHJCtISykrCzeGTsb8CZYMi6Y?=
 =?us-ascii?Q?WpFQ1zAyew=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f16cbcb1-ba4f-424f-446c-08de7455b966
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 10:07:46.6019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XcVzIIzoEl8U/hx6pvcS/2ZCpKXvsIzVawOhF1nEqOsI9ieXgw3R3DWjeLbImO7MgDB/54Mf/NYoRZYgS+eDCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9730

In the TDM format the ADC and DAC serial ports will only operate as a
slave, the sysclk should not be less than 256FS and Quad-Speed Mode (100
to 200 kHz sample rates) is not supported by ADC. So add error checks
for these constraints.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/codecs/cs42xx8.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/sound/soc/codecs/cs42xx8.c b/sound/soc/codecs/cs42xx8.c
index d14538c49b97..378995561ab2 100644
--- a/sound/soc/codecs/cs42xx8.c
+++ b/sound/soc/codecs/cs42xx8.c
@@ -43,6 +43,7 @@ struct cs42xx8_priv {
 	struct clk *clk;
 
 	bool slave_mode;
+	bool is_tdm_mode;
 	unsigned long sysclk;
 	u32 tx_channels;
 	struct gpio_desc *gpiod_reset;
@@ -217,6 +218,8 @@ static int cs42xx8_set_dai_fmt(struct snd_soc_dai *codec_dai,
 	struct cs42xx8_priv *cs42xx8 = snd_soc_component_get_drvdata(component);
 	u32 val;
 
+	cs42xx8->is_tdm_mode = false;
+
 	/* Set DAI format */
 	switch (format & SND_SOC_DAIFMT_FORMAT_MASK) {
 	case SND_SOC_DAIFMT_LEFT_J:
@@ -230,6 +233,7 @@ static int cs42xx8_set_dai_fmt(struct snd_soc_dai *codec_dai,
 		break;
 	case SND_SOC_DAIFMT_DSP_A:
 		val = CS42XX8_INTF_DAC_DIF_TDM | CS42XX8_INTF_ADC_DIF_TDM;
+		cs42xx8->is_tdm_mode = true;
 		break;
 	default:
 		dev_err(component->dev, "unsupported dai format\n");
@@ -253,6 +257,11 @@ static int cs42xx8_set_dai_fmt(struct snd_soc_dai *codec_dai,
 		return -EINVAL;
 	}
 
+	if (cs42xx8->is_tdm_mode && !cs42xx8->slave_mode) {
+		dev_err(component->dev, "TDM mode is supported only in slave mode\n");
+		return -EINVAL;
+	}
+
 	return 0;
 }
 
@@ -335,6 +344,19 @@ static int cs42xx8_hw_params(struct snd_pcm_substream *substream,
 
 	cs42xx8->rate[tx] = params_rate(params);
 
+	if (cs42xx8->is_tdm_mode) {
+		if (cs42xx8->sysclk < 256 * cs42xx8->rate[tx]) {
+			dev_err(component->dev, "Unsupported sysclk in TDM mode\n");
+			return -EINVAL;
+		}
+
+		if (!tx && cs42xx8->rate[tx] > 100000) {
+			dev_err(component->dev,
+				"ADC does not support Quad-Speed Mode in TDM mode\n");
+			return -EINVAL;
+		}
+	}
+
 	mask = CS42XX8_FUNCMOD_MFREQ_MASK;
 	val = cs42xx8_ratios[i].mfreq;
 
-- 
2.34.1

