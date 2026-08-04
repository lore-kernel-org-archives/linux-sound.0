Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011005.outbound.protection.outlook.com [52.101.125.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB40349CC1
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 00:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785804053; cv=fail; b=ILwPqafU5yhp2Z2KUv6GcPgNebh7t8uRyGYVB+FvB6dGCf2DOMmq4LCo0zNQXo4H88FJ6uWhMY2jDYRmav3v0z5ePAUzpGxme0Nxe+te8zHjPQhtdgNZ5B1Uo/7h9Uiau9kg/0kJPM2K6iHRwqZU5EPnwz07bAGiOowPDiKCNPw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785804053; c=relaxed/simple;
	bh=+K6vdmmaXNP7JlYCyHMJhjyM5G0FiHmfmmsWjoJ8xjc=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=J2M1HBT7l+Q7LNukIbo3FM84iTBaDuZmfq+mR+gVCRC41x0T0M9NEVrTw4PyA3fly0Cz8Sp287QS6VwtCpov1rJArJKtoXcB/v+CTANfhegmsfw2Gdr/zKuZ2n6yTbF3j+cpR4zxCWIAzQAN4myGzv0zAluQFGEoSiHissPpX1s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=PtNs5Iyh; arc=fail smtp.client-ip=52.101.125.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="PtNs5Iyh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iq0TV+ZlqIo34irFzAKNWBNIfd+IBi6Fa+cr+T46/0BKNzhBwu9tYcdj4CKPHD0VYNxf9c7KSFxL3NU//J6NbI4iKZkrf5A2ZMrqi2M/9Ry2TjnRoR+8zPTmq9Tsolqu71SKSqh0OCEcJKb3L1HJfklAW3YQ5chO/mc/XC3q3c3IW0Dlxy4AEprSU5yVL1dseBHdlPBWcnVuApqJE9yvU1mdiqRbd4gJ11xvqWwbPkjoSPwCxDnFEVISS8t3mBPgJUPHqoESf7Bh26oFN5DaS4R3UVoayB3aAvr+65vkLXj4yOmX2ZaAk0F9PB0P2SwjwcFjJ+B7jcrpPEhE2NNrhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H+mSa5E9X6Q1BN29PZNcdNl+dlZfJwWKIFf9nd2l55I=;
 b=XE8Y5+VvSs2+ZEIUXHjYksAbtTHAjGaGEmH4hMGUlNOc1Ii1kVBAApXbUKR3UqOpVL6CsH3ho8bP7RvPpJPc3J8TTrC+7KNajsr7QQS9vsgZNoydNiu5QERi5dQ/38LgKb1/H8F481/auc18PaZ6fWMAairKLK6QyzKpo4SexwNfI75SFCXZ9qXF49MK6Zi0lPgA8UFX9HYRWHRQUr6H95NjvBiN1zL/V1AYSOqeNZorIKEd3ebQo61RN8v1GFtxjaFa2CzEtPniBUMHldADQGnBIxBn+RClFcFkCrZkUtcAQjKiKvHTxErjugmG4bufkE5noRRqN3oHvh1F3oHmew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H+mSa5E9X6Q1BN29PZNcdNl+dlZfJwWKIFf9nd2l55I=;
 b=PtNs5Iyh0yvc315nmUNBrtHmuSoWL6px1cUiK+oG1jSvdxk1jZiBLzp0+cyoOTPQcEI7fKQPAXJOtC/HV3ZJ3wUHCWwlIOhwprE5bQ2mb4ZwHwLT8sk2D1ampBMYIjV/6vBWSLrDOn8oc8rf7KaB6unygP/yxsyiaxZ9ay533Mk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OSOPR01MB12264.jpnprd01.prod.outlook.com (2603:1096:604:2d9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 00:40:49 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 00:40:49 +0000
Message-ID: <877bm6yay6.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Lars-Peter Clausen <lars@metafoo.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 =?ISO-8859-1?Q?=22Nuno_S=E1=22?= <nuno.sa@analog.com>, Takashi Iwai
 <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 04/44] ASoC: codecs: adau*: use .auto_selectable_formats
In-Reply-To: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
References: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 4 Aug 2026 00:40:49 +0000
X-ClientProxiedBy: TY4P286CA0047.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36e::16) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OSOPR01MB12264:EE_
X-MS-Office365-Filtering-Correlation-Id: 6365cf16-6271-4b00-4f98-08def1c107e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|52116014|366016|1800799024|38350700014|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ZA9nbdcy6m2P+xG3FeHN7hwICDsoHd3ZLxSE2RQ+3zqWXFBpaaNiGECRLJwybQABvT/89ubyrwMwLmr6IfbMYSKKJpgfoOjyI6j8WRCnfS0leF2vn22J2rne1YBdHobOMofbtjyrEUthoedua/BZdlcfLok+zhsggEyNp7g8n+S8qho9nj/h0TpZXa4DLvKtsKfnRUCKtZlmHCVgoVpdLtoRxq+JzQRQAUstZTDWK+lNNNeya6M/G5jGszJQdD8l9DQGLC0I3qbw68VnqDzsNhoyqCenZpFo/4BeORTqPK16kjqJtv6iS9YWEX9vA05MJBd7Ia2tnnqRzy2d5dwQJBl4lQG8v474/9vl/fXgF2RiDG/XqyS0fwDEcTUbDL8OGO3mvaMCqymUftVrrNm6gUP5kn4mGxitAFRvvuLoTEub58P/huxaI5ilJElKayVt579JO/nMmqiMzjhweERJJAb/Q2C+HNLU6+jdc5k79Yc6S/29ebemc4zMRXZFLA+GfLfCAPNcBGVcpsl/qUghXe42yBRUYvrmUsr4G0uDR/a0/RAMjYEqKknP73+A9FGJtwa73ZDF/pBCOgFIRo7b7Yjrf51W9JOOW9vQSlUmixNWVo3jZp14fDDNe+yBFByVKuPp5CCP1ht0YIUcl/njJtMVBBSrm2qp4UsCupU0O+bTV+N3jtiBd51+yrK2lJR08LvczVIONXxtT8RiEz5MUvtpC3Yt301UbTj1gjC670U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(52116014)(366016)(1800799024)(38350700014)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oEElX6o9N6FR8E5mFILrc0Q39K6y+gE1NzkNupfJuwFs1CpKYts73jmmTSkj?=
 =?us-ascii?Q?A0XNxWgjBEZLDOwbto1DOC+wThVdt+J1nScrpnnCMwNed+2XzM9lozh0OuSZ?=
 =?us-ascii?Q?dlt1cHGLxi3kJSg7InKecLjzmpFXuf8mdQZACBuPwU7GytY+mBb9+DbXS0CZ?=
 =?us-ascii?Q?fOtOsIHqxT/xO1uHXklBhdY3UKgL4ygVbbZK6s4+BcNw4RHgOWPEmeniO3UY?=
 =?us-ascii?Q?YL26bWvkBM7PbCgtLbtEjv03Se9TJNsoRRkCL9RYgm/7LC8J/lmwBlX9ZyRe?=
 =?us-ascii?Q?5B5DQtHOgc+p6QUKkdzugBbNPiJZM/DxweqwyP7E8VVeyADjWve7ArM52p3A?=
 =?us-ascii?Q?H5i2zInW+9k+SxSfYgkCxBvsIB0cn1dhx1KHFco8xJ8IjtuW6xyglnL60g/V?=
 =?us-ascii?Q?aAkhUrIsPGYx2fzPmyauTCpiCj/3AO4tduonFVi/uwEfZD8FS3mQzhGGvuNE?=
 =?us-ascii?Q?4lLv3jINl15UqtSegvFfAgpplVv8HCd90iWlfO0lDKom+2dgJkjhVhrL928V?=
 =?us-ascii?Q?QAJxIIagfDorMuxEayC98nDvkSIVAyHBakfCGOZ2/f7Tq8x97iZivTlUOe3T?=
 =?us-ascii?Q?l8YdpqKy61fj2kzK2RAKi6I/hLgdIwmE5yW39XhZSclb4WuffvJvmeiFXYd5?=
 =?us-ascii?Q?1IMgGPYARGBtFjwI+zle/TZczd9FjVl+pV1HWmlqABWP5MeEfYzAv/Z51Tv1?=
 =?us-ascii?Q?Hs8XUeNNiPLP65+NXAXGHSUD/qMyGRP5vE7uBHpGPPd1PM3QTqouokeCPqe7?=
 =?us-ascii?Q?JUP/py57q1boU2brwH6cEkx+9TUqTuex0HL7QS1K/EWoLqO58eXLLSGERmuO?=
 =?us-ascii?Q?CWKvR2M8VtWcABP2UgKXHKYm1hGXDWtgdftw8F8PsWErTO3JClclIniTsrxM?=
 =?us-ascii?Q?MChDfXRh1sgtnsI5GllIQp5H+8LezCqct2cq2buADlMsAtFcy25xuGqAW7dY?=
 =?us-ascii?Q?7mJ3nKBwcHw6ymXwXE825zVs2BhG2bI8A5mdxP3mlu30FcqwbrzaT9rDlg+e?=
 =?us-ascii?Q?P6L2rlfFvECwz5ny3IE+9P2WNmFLNm9LuylZRv5U/C6Qmb5da/YyH0e+kHtV?=
 =?us-ascii?Q?1sTwB4waFx4ML+lX4oG6+Pr4B9sLENRtxPRl8X/k0w0aO2h2Ag3rTXH+fY34?=
 =?us-ascii?Q?CvyXnWNYk5nyqOMYgh5ophug94gFeZNpYdEaiZumB9ywvhvBpboLvpepxfG8?=
 =?us-ascii?Q?5MChfB2QOaGF3CD38Thz9kOA2lGeB//m8qO4g3VGSq2hmHV22p9kZvH1yQoE?=
 =?us-ascii?Q?x0KedjAQHjkRV+F46AYk5azfP2hjVcnULvaa5FUg2qR9HK4qhWqJ5IRCEzzd?=
 =?us-ascii?Q?G+nX8yfo7+Q1+Cb+paQBA9CbvVT1yANhskWXTOOAWOr94tBgNPuiHnM3NE+T?=
 =?us-ascii?Q?aqGWUxpYhtE51ODjyc/fNBuxlAxiRazfDRPugVPH1cdE5BpxjW3ey3TgEquP?=
 =?us-ascii?Q?07J5BBiY4pzMz9D9vTkAchy3FUpkKtKIfUdd8S8DUrFXyg+zkxDifyI5n/Rv?=
 =?us-ascii?Q?Jv3TWwJxoXU43y9yJ6HuOP9f2+wquoYjtFw805aYCEl/w8898TQVCBzohAI5?=
 =?us-ascii?Q?IYPzVsImgkekLUoIgkq3tO8VMnnbzg9E7f+gie2G+xtrHLxVgDlFr7JS3cjk?=
 =?us-ascii?Q?8k3IwDHI8oA+9JlyGXGE/7IPYhUZlXCzgT0nywQf9p2FyXKdCW6ZfP42xxJb?=
 =?us-ascii?Q?mVVHM1ac7BMTVJMBHdXVFdYHrmyiWb1HpYhBiQQMw6EeVwG6/Gqo7WO9TXh3?=
 =?us-ascii?Q?R84oL6XD5ZzqQLaxSiI0FXCmrl5qXltUK4vd1F3gNIumd+NCDXeE?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6365cf16-6271-4b00-4f98-08def1c107e0
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 00:40:49.7702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uu1I15SOvJwP+cafiIMiB95VzhUPaYPHzIzNxl+5TghG+yaEouY7Yf5CbgKiLi6MvEVJRKtBNGF4frevD+cFNlwB3D5WxMZ8/CLSU5SpQeaAlYJzefJVKWb6dPOMlGeh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSOPR01MB12264

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/adau1372.c | 12 ++++++++++++
 sound/soc/codecs/adau1373.c | 12 ++++++++++++
 sound/soc/codecs/adau1701.c | 11 +++++++++++
 sound/soc/codecs/adau17x1.c | 13 +++++++++++++
 sound/soc/codecs/adau1977.c | 13 +++++++++++++
 sound/soc/codecs/adau7118.c | 12 ++++++++++++
 6 files changed, 73 insertions(+)

diff --git a/sound/soc/codecs/adau1372.c b/sound/soc/codecs/adau1372.c
index cc174ec3a1f82..0830d7d2dd7c5 100644
--- a/sound/soc/codecs/adau1372.c
+++ b/sound/soc/codecs/adau1372.c
@@ -881,12 +881,24 @@ static const struct snd_soc_component_driver adau1372_driver = {
 	.endianness = 1,
 };
 
+static const u64 adau1372_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops adau1372_dai_ops = {
 	.set_fmt = adau1372_set_dai_fmt,
 	.set_tdm_slot = adau1372_set_tdm_slot,
 	.set_tristate = adau1372_set_tristate,
 	.hw_params = adau1372_hw_params,
 	.startup = adau1372_startup,
+	.auto_selectable_formats = &adau1372_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 #define ADAU1372_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | \
diff --git a/sound/soc/codecs/adau1373.c b/sound/soc/codecs/adau1373.c
index 5dd961b233ce9..aa7d3a4b9f588 100644
--- a/sound/soc/codecs/adau1373.c
+++ b/sound/soc/codecs/adau1373.c
@@ -1196,10 +1196,22 @@ static int adau1373_set_dai_sysclk(struct snd_soc_dai *dai,
 	return 0;
 }
 
+static const u64 adau1373_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops adau1373_dai_ops = {
 	.hw_params	= adau1373_hw_params,
 	.set_sysclk	= adau1373_set_dai_sysclk,
 	.set_fmt	= adau1373_set_dai_fmt,
+	.auto_selectable_formats	= &adau1373_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 #define ADAU1373_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
diff --git a/sound/soc/codecs/adau1701.c b/sound/soc/codecs/adau1701.c
index 329ab01b62c00..505d52c636278 100644
--- a/sound/soc/codecs/adau1701.c
+++ b/sound/soc/codecs/adau1701.c
@@ -627,11 +627,22 @@ static int adau1701_startup(struct snd_pcm_substream *substream,
 #define ADAU1701_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 	SNDRV_PCM_FMTBIT_S24_LE)
 
+static const u64 adau1701_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops adau1701_dai_ops = {
 	.set_fmt	= adau1701_set_dai_fmt,
 	.hw_params	= adau1701_hw_params,
 	.mute_stream	= adau1701_mute_stream,
 	.startup	= adau1701_startup,
+	.auto_selectable_formats	= &adau1701_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/adau17x1.c b/sound/soc/codecs/adau17x1.c
index 26d7eb437ad18..45ac226b2f1bc 100644
--- a/sound/soc/codecs/adau17x1.c
+++ b/sound/soc/codecs/adau17x1.c
@@ -776,6 +776,17 @@ static int adau17x1_startup(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static const u64 adau17x1_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 const struct snd_soc_dai_ops adau17x1_dai_ops = {
 	.hw_params	= adau17x1_hw_params,
 	.set_sysclk	= adau17x1_set_dai_sysclk,
@@ -783,6 +794,8 @@ const struct snd_soc_dai_ops adau17x1_dai_ops = {
 	.set_pll	= adau17x1_set_dai_pll,
 	.set_tdm_slot	= adau17x1_set_dai_tdm_slot,
 	.startup	= adau17x1_startup,
+	.auto_selectable_formats	= &adau17x1_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 EXPORT_SYMBOL_GPL(adau17x1_dai_ops);
 
diff --git a/sound/soc/codecs/adau1977.c b/sound/soc/codecs/adau1977.c
index b42f35b1a6036..b9d9853934216 100644
--- a/sound/soc/codecs/adau1977.c
+++ b/sound/soc/codecs/adau1977.c
@@ -741,6 +741,17 @@ static int adau1977_set_tristate(struct snd_soc_dai *dai, int tristate)
 		ADAU1977_SAI_OVERTEMP_DRV_HIZ, val);
 }
 
+static const u64 adau1977_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops adau1977_dai_ops = {
 	.startup	= adau1977_startup,
 	.hw_params	= adau1977_hw_params,
@@ -748,6 +759,8 @@ static const struct snd_soc_dai_ops adau1977_dai_ops = {
 	.set_fmt	= adau1977_set_dai_fmt,
 	.set_tdm_slot	= adau1977_set_tdm_slot,
 	.set_tristate	= adau1977_set_tristate,
+	.auto_selectable_formats	= &adau1977_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver adau1977_dai = {
diff --git a/sound/soc/codecs/adau7118.c b/sound/soc/codecs/adau7118.c
index 5ddea63a6612c..9749299bc7f2a 100644
--- a/sound/soc/codecs/adau7118.c
+++ b/sound/soc/codecs/adau7118.c
@@ -418,12 +418,24 @@ static int adau7118_component_probe(struct snd_soc_component *component)
 	return ret;
 }
 
+static const u64 adau7118_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops adau7118_ops = {
 	.hw_params = adau7118_hw_params,
 	.set_channel_map = adau7118_set_channel_map,
 	.set_fmt = adau7118_set_fmt,
 	.set_tdm_slot = adau7118_set_tdm_slot,
 	.set_tristate = adau7118_set_tristate,
+	.auto_selectable_formats = &adau7118_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver adau7118_dai = {
-- 
2.53.0

