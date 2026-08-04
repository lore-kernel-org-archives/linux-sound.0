Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011034.outbound.protection.outlook.com [52.101.125.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8595137F735
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 00:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785804058; cv=fail; b=H7sZOhTdduBiyuyaY0the13gQ+zUVA3uYkro9cFfSe9G4dvRIAoA1kFozvrRCi6q0lF6msvT5gf/wT5AL5cCJwcHLZzMW/VKpkRgkcJVQyvEcQWnmixzrpNOXlBb4OKj0/OBPSTBYMtxoGJIgqNZODUVNmPPBu1TznocQF6C9oE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785804058; c=relaxed/simple;
	bh=qcAyn5t9KA9uwnPZFUIXF52NrofNT9agSm3BF8xU2kg=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Jhbl8uXat7Vyvi2pLtHwy0Oyd65Evp+VkbQdkVgHowDgICkSlAs5HJKGE77cM5FD4qkxl+0yY/9GTQmRn7fG0pSkibb2GtCmCvSZvT9SdJsahhDoOEJH/d6GRZ/u8ND1aoJ3PkrZnWyaAYHo3P336Qraat9k50BjDTp7PLPZ8rQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=gmNwYGav; arc=fail smtp.client-ip=52.101.125.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="gmNwYGav"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JEhL+YgQ2fF98VyUF7IPANC4J5UPHHo+QLRu+nA1TzsPBhqXSGdBewZpKpshyGuJeYUpQulPszxZ07oi8NgcmaHHmUT/HN8dJTXgh/tyaMxMsruXPiIp2YeWpyLKJHtNAHv9DEqTh88VYHGm/x+718QQ/tpCGYKSueTeWOg+bTndiJ+z4ArwJffCUEhDj2+8u43tI54lQ2e+G1k6Zo2vlU3MnpHc1RF5j0BAhUeMgDQ1fNJGbrpyZ8jPwYJ1G6AXgi/Osqhq8PRZJiFadd5wVluyMjRaq+rxjBKkKTKAuxW0nesiJYY7qzJOjFnK1Jgg82RwCFkoijs37xfoqlD/mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FCkqyL0S5s4Bc2B/2TyIPtmUfil0DOVJA5UCNK4xYNE=;
 b=Ws5XkjZpjfT/ja2djcI/uZpGxzbRZ1O9pIvxt13TNAMvkqha9+cbh4Wk6PUzisOc0wApLLUfdQfFta2f5D3tL+Y+XN9ngfoLKZJIffvepG/UgUqPdArKa7owaaA27tO9YnXUAYc5FkrrBpwSkJFMmXFdhkhDqzVLoCtpIvPHdhk6FCTAjRtMO8+RWLzbGTxUrj223CpPk+jInQ7ekmnQXm+jatCSpdQW6LL0uexdEpqNrPZ9W5yApety318ASOZnD6xzJPzx1v546TTQ4iYE/ijepCTAk5hDxzuVTXBKfafHs8tH3VFl0tKWWdzthiI62CFAc7jTCdFbphSYLHHU6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FCkqyL0S5s4Bc2B/2TyIPtmUfil0DOVJA5UCNK4xYNE=;
 b=gmNwYGavDI9lQrMYtbPyZREDKrN7Ap+APG8kCQewzwM9iwfIrAPm0Xxv7ng7WGs+VlM1h6ozKcgXYItu5CGAQCVe5n5zyh7um5BYOKeHeDAhmh0gkFs/qoTAMDazSswA4mnqxfm4w9IlwSNomU5ZkoiCsUHlOaPEpuq5onni+lQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OSOPR01MB12264.jpnprd01.prod.outlook.com (2603:1096:604:2d9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 00:40:54 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 00:40:54 +0000
Message-ID: <875x1qyay1.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Lars-Peter Clausen <lars@metafoo.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 =?ISO-8859-1?Q?=22Nuno_S=E1=22?= <nuno.sa@analog.com>, Takashi Iwai
 <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 05/44] ASoC: codecs: adav80x: use .auto_selectable_formats
In-Reply-To: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
References: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 4 Aug 2026 00:40:54 +0000
X-ClientProxiedBy: TY4P301CA0016.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2b1::19) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OSOPR01MB12264:EE_
X-MS-Office365-Filtering-Correlation-Id: e5a61230-468b-4784-3006-08def1c10aba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|52116014|366016|1800799024|38350700014|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Y2K7D84ACcM+sSAfiEsQgaphDzrYL4zKwZEsXmmFqAswiCgKW57UgWNUofSst9rPWcqrGEiHYELQ4b6PBwlWu4FLsWa2V1QBoc5iTbaYd8IIi6QCbuA3gdL3IipfigHI8A5iOa5pYAyayQs82WhER3E0mczmndjc3udChIcZ3CbHxntfwUr1cCDK1nN5IHg7Ula0Q8guHoUsEjUX0zSieLaAfmBtQ0nahNqWMF5CNJr2QoGmd9q/mnE0dd653F1HvhS0+po/zI89TJFozKGk1F3afI9TLjyQ4Tik5wk8KKJkFNuyUkaGVijLV3Felnh14ov9D62WWqMZh7pe1bF28aB20rAvBhVMhPyLMIXUwCLT0/hKrx1mA5V5ps2UcDxUktq1WfLlfJ1/BEAVRIN8HTMYBuNRDm1oaNxM6C5zm02Exz6U2IsFXvPC77VNbAlF0A/7g5KaqV/XkR4Ao5X98d1GLv5gp3/j8T2q7N+KtP5HcJprICihA84rJRnkanNMP+qOXmgTBycdein6GJMSoDuwHLMfxR5VOh3zCMIZncXKI7WNDIBq+4kYTrCy/54Yh93VBmFQBmGblQ6mYVZfyOY9IeD/7DQCh+RcINtzdJlGLoj1yKHyFAjPn+nXssjcEwrDcwwg0bQylb0uGofE0Vo3Sb8MzMTqXPsfe4EHO1u89P5i6C5hSZlLTkJVim0BVeXHbKt3d6995XvUCnZo++8w/xk06yfNWTixke3oVQw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(52116014)(366016)(1800799024)(38350700014)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FC2QG9Ot8UYviT9VXY2bA0j6yMtJ8m7LvGsfZmBlKd0BTamumh2zLLK+2/d2?=
 =?us-ascii?Q?6cya0irUsb7LiUtj8O7lWThdrB0xZaFtuvndENOexCRsTXJV3EAWVoSZZY7Z?=
 =?us-ascii?Q?gVsbfnQkqH9ulT7ZQRmboNOtRhEwv6TJ0KVy4cUFmtimyzFByd56U5XbK744?=
 =?us-ascii?Q?PsRKXCpg03uI8QzzQJOfiwttzXVNBOkFKnLZVQl7mG3apeOmTXIIvWMC9QnL?=
 =?us-ascii?Q?pGy4rSTrULAqNdbHShSK9G55ur1Zoxb/wlin5Ehqu6Bju09LNnsrKgin079C?=
 =?us-ascii?Q?6iKlkH78LXtp+EPOW3/7wHOjN1mOiO20NIq+C3hbYx+3qscupVJAX/95WEP2?=
 =?us-ascii?Q?rTjmZfez7tovjSJhwiRvkYKbBtPMFQeUekzlddXX7FYu9dAY9gk1tOaneVRl?=
 =?us-ascii?Q?oSVopI2dTePG90ktISfLUP82/UZlodkYaW/frVXN5/rHaollYzjcz8MyBL0s?=
 =?us-ascii?Q?WzBnlf+RLPecugfpjNncUl1Z0zzp4iZ9NdBMt4M0guRiLLPuLI+2RPdLj7qc?=
 =?us-ascii?Q?tMPZSMlJF46/OaLn60+oPlnp+oG3XPMC7BQID4GSnNpxRCbC4x6tsAUNK8Gc?=
 =?us-ascii?Q?Luf8t1XRt5FzwlXRvH1IO8EwZa0MdWiDCOG7WKMPE2okNFxT5PaCZzaZZ7vP?=
 =?us-ascii?Q?9csfJnA+VAhdFoNsZaO5t3VvnPe0bUJ7N5A4q0KIDMkG33p7nYQVveQuj5un?=
 =?us-ascii?Q?0blo6c/pEFDE1OhPMJVbhihFdm5ziguVghUPzz3rld6bYfnR5MXaCZmGM5zO?=
 =?us-ascii?Q?bl1ljBmJLRXb4utACFUaO2dUmN0CSW/B7c6+lDA/AnkQTt4cuniLTZXXiCxe?=
 =?us-ascii?Q?HxV2sEaVktnv0jymqaBvSx879A3V4/D0DVVcQ1TGXoGwTz6c1OzdITx35UVI?=
 =?us-ascii?Q?8o93CabuMrZt2ZnXTAnED8r5/udzDWmcZ8fe0dtpHFuY7VXmI8H8gt9eTbbY?=
 =?us-ascii?Q?ttLUY2wogek85HGFCyONM4cKYgoMqTbsBdP+ycoNgOQogmoY56+SKCHhVNG0?=
 =?us-ascii?Q?ir1152mbcvJJX+SrKJ9CW5CWnDNHtR+nl4cU+FgCL0XFwI5w5bjlPCoNYonU?=
 =?us-ascii?Q?XFUzUtXvaqDFndZmoLC+3qMNPNhfMERXN3fUwnh5DIYoEF2k6O97DkfgDLDR?=
 =?us-ascii?Q?4lxD9bj3xb2CokwDitcNRXbw2wv8VVURTQhkNx3O4/F6hUwuQ8oTTlvtCQqu?=
 =?us-ascii?Q?7zYFey8Ht40smyAti+CuwY4fsxJLsWLTd0V+66snB0QOamAdw8nXxdgvDQpz?=
 =?us-ascii?Q?RoLCET/86UUIFTITo0Mr988rlh29FMcG07WU0gxzJ99eIwadX/kwJ9w3KBiP?=
 =?us-ascii?Q?nc4bC9G9BHjgJYpFiQDnitd8uQUB+6iW5PVM0ImxGK0AXsyTUJBTQxwEEWev?=
 =?us-ascii?Q?296Y1wRONG5K7Hu2FAlURKTpDvDly0ikj4QZS2tc9toibNjcS7DRbTA8QpW9?=
 =?us-ascii?Q?NFyI+jdw96HIWlPah/6XSo3lg6dqrbX2LLIVb/34BckgVMQDpiemCVC3MO+T?=
 =?us-ascii?Q?/Xk3DIFFAyx3SWSgssLhlCNhae71qK5SJ75i+gh72FZUG8R6Va3On0zqD94a?=
 =?us-ascii?Q?cjj/WYiLIURyP8ISLEbetY62tXmtepL03m9cBJy/V4AAdJ/r5C9xfulwiLZb?=
 =?us-ascii?Q?LHBOFopV0a3lAhxP/DRuVQVJUEX8VfYbFKiRinzODLlpQidqxRDNLFc2ZZxB?=
 =?us-ascii?Q?BAcQtiF0+kOHXf2UkB1wbp89C804/l7bs2Qh5EzRya9ovBoZtwL3lkAcLHJL?=
 =?us-ascii?Q?Gwg5+FXhWUZPDm/CQ8XfOmMucMd2x8gzqLl/kKbGuDtMPPdYdcpf?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5a61230-468b-4784-3006-08def1c10aba
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 00:40:54.5698
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yte/rtajsEQY2oNE5wDOXQQeZlesg6lKsab0ELORC6f00QIKV+cd5FU5BiArhs9r08XAlwYIBrfTBxDSUfKZwDJU7qLDWvGZytgJvsCtTGpCMgRQlzNP9Xn+DfMBPox3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSOPR01MB12264

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/adav80x.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/codecs/adav80x.c b/sound/soc/codecs/adav80x.c
index 8a89187f9c782..e97c72ac9b2b2 100644
--- a/sound/soc/codecs/adav80x.c
+++ b/sound/soc/codecs/adav80x.c
@@ -743,11 +743,19 @@ static void adav80x_dai_shutdown(struct snd_pcm_substream *substream,
 		adav80x->rate = 0;
 }
 
+static const u64 adav80x_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF;
+
 static const struct snd_soc_dai_ops adav80x_dai_ops = {
 	.set_fmt = adav80x_set_dai_fmt,
 	.hw_params = adav80x_hw_params,
 	.startup = adav80x_dai_startup,
 	.shutdown = adav80x_dai_shutdown,
+	.auto_selectable_formats = &adav80x_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 #define ADAV80X_PLAYBACK_RATES (SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_44100 | \
-- 
2.53.0

