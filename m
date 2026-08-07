Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011054.outbound.protection.outlook.com [40.107.74.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B74825B08B
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 00:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786064253; cv=fail; b=MdnS6sX/08sP/KD7YzKa8I4Uq2yuscLpcVNTURp6duyZkwVaaS689tUcyNHykuZiW3iBl6qKLzWdAL5SQUAUA1IxXkgfbTWjP8JY9GzzACchZp2UEFPozifO3ZZLXXbtGcZr+MTqPAW/Q3VHZmWPyBThp38DEzpVxl091jyxUMo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786064253; c=relaxed/simple;
	bh=k4j8jGJvtZmjMFgvIRpkkd9nycThkdgYmaSMcSXspb4=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Nkl5wTZbKLgzjPxmT419EzP9xjq0pa3q4ky7J7qZFZHua09Y05i+Tyy4Ho65UCkX1clhyksmHkQCDw+qtgiljizK6XSYx8/UQJLqN0pJs95H/Ra6RrB0jPA76vwPFQ7UWg04m7V7s45pUT24VeIo89TxqaddXboRsWxYjnpa3+I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=QEOgIwG4; arc=fail smtp.client-ip=40.107.74.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="QEOgIwG4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J69z+pDscVBJzjqyGU8XXtQSGN098oeOWEBYvcLZSD8TgmdrgC8+iZY4cEgzr9NTkVpvaphLYzfUcmdb0qRWK+K8RtiiLP7hI3zpPvJIAJA9989kehJ7LjsV3KRdxEJ2fgzz9pVSLuOhWyUDjORK4mjHjkcuY01und5C0P4wjGs64xxwE8XgiaucLop9kGwcH+iZ+ZepBqFFU22NFC0i6ipuJ5lSHQs0OhV/dByikT1iwSl8E/jlc6lY25BI5ltR0HiVL2GtkH45stLyF8Qc82OBcMnGWxia54xxHpQEfWoh5nwdxnS+Ee5Qv4AGsLvJPitkBDRNaERs+fZ54NALXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7HEbEaL/NmHfUjNdidDhWz9j9lKStrvJoEMnZY2fYKE=;
 b=WTkW5UadmkUispMT3FTlBIRpJ9jeeY+iAnMqjt+NDF/tBfEeEXUE/f2BvdZ1Oi04kJ9+IT+JaBVirZPSzv7dhS3vaP/8lOZOyz38MPc1rI6L89G6R2ud51S8u9H0BBzJw60sMXc/MWMdeFQzu9CBdr6mT5xdINkyrsFIHxwYcaFcD8FArmXFFkFpi1Ck44BUSk2z7DL+B8TWgHWpiKPgkP7jwwK655mqSjNoJ9zs3tBAqsB2Jc+rO8f2j5LjkMHYRDvtwiCHmSYjXfMPI3aMSmn1IJ0xX0f+Cqy68k39totkJHh09kR21GH8LsAA6eGirgkpz8RZogvyt1+WDJYXmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7HEbEaL/NmHfUjNdidDhWz9j9lKStrvJoEMnZY2fYKE=;
 b=QEOgIwG4BeU9sQQBPd9fSlBgiC+bQAgremZkbIt/MMK3vd5RbcosMXix5/lNA9Xbx0tpPRS6ldXotow4iqemUV7GHGOEQQvTnTJv61cku7N+L+nnW6IGbjjeiwGTUnOwbC1/nbJnstulY/ZkmvG5ojzPfRUS3oaJuXOS5Zo4Js4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OSCPR01MB16243.jpnprd01.prod.outlook.com (2603:1096:604:3e7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 00:57:27 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 00:57:27 +0000
Message-ID: <87fr0qsq6h.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-sound@vger.kernel.org
Subject: [PATCH v2 44/44] ASoC: codecs: zl38060: use .auto_selectable_formats
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
In-Reply-To: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
References: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 7 Aug 2026 00:57:27 +0000
X-ClientProxiedBy: TY4PR01CA0054.jpnprd01.prod.outlook.com
 (2603:1096:405:372::8) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OSCPR01MB16243:EE_
X-MS-Office365-Filtering-Correlation-Id: 7754fdfc-e0a5-4b00-c07b-08def41ed9ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|52116014|376014|38350700014|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	AtKLvg4Rdz8HA92R+x8xT59+2vLxa3xLr9SMs3W8NEDWqvl5Z/FbIrsH9tnPK03U9yg2C982fWM0rzDtkkdPDaa+L6nf+iAp2w3/UTspEIui37CPyw/kxPA9tfL0yqh9VKtaHpQOV0nmbQIRX9eoat+XFVvpSVTPhY3Si1c9Hn/4YjtBHH0U7275gNI/6WqwKi5lqK9U+1WguYO1NpXZ+ncybQk5/tyE62If3QUS0IansNuzXDADMFLC3hDflXceTdLXnkUaDxoEzk7f4P9jNTLMIZ7uhQH04PmVlOmSBr5Dtu2PT6EdAWzehV4RD56RsAyGyR01bEhCukUXkZklnJcBdh6mHugk/icrZz0m8Cp7dNjIwX1ZmjcfNiQIY9Jftd6Rfp5kn/mlZhte5u3tKjWywSsPU1lbc3oXHG/F3cUj9whIVqH4ii5RNL9e0xPhylxjk8sj01oNp8jrZjR3pxlR1ityLJ00534PHMb2hxFQrBNWM7x+97k9WW8Dli3GiIih2QiP9XU0sIfp/TZvIZYVzQIgV2ZfPnwc+mgetPAx+OJGU1gva7Yo2i11e9QTxcSJMAuLiJWu+VGFyXpiBFOLUiIQAajOaAU9F8mkHjwjkFpQt5P7lvdn6b3pWPIb1tb5ABrl8126ZMM9g2zE8gPWa5gCboCBz/blziQ13Gm1X48CmFfhrfTxszssnrg02gn6sXJvqApUR3mT59g2dQgjYLCqkz+nac3z5JrLxsc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(52116014)(376014)(38350700014)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HuYZmF5F3AHqHWvN/Rdit+b+uvNVYA8/MKERFRcBlZ/w+w+8Xwk6c/IQCCwg?=
 =?us-ascii?Q?i6gsX34d20JtEqvWd4+eTlQbJlAn7ZPv5FAu2zcRUBgtYB1qQlFtVj2s7+Yu?=
 =?us-ascii?Q?DhQ6IF7dd4jnKTdfY+ND8bPof731SMM92RalaaZQwyjvU7o8KpkhTHxNfgjN?=
 =?us-ascii?Q?vP66ECKIEd64oRE1XmnkTwy4vtbxJQHYXWEUlY0x3q9OEUeRULOWR+NJNlNp?=
 =?us-ascii?Q?ilYQX+NT7UjhgXB2o9FmHpEVrMtO3oZ87Br2xBK+q1MXcQ+uReEYW/h+vlOZ?=
 =?us-ascii?Q?FVvQXNX1vcunzdT/XMb7IpHwII01Y+NVy3xAuQ4HsDt0WHnv8eCdfAHA+XZG?=
 =?us-ascii?Q?17zYO2XKD4H/S057wek76/c/kMV/5LWqEGuuENWwta1+mN1Ho4lGatw9+Di1?=
 =?us-ascii?Q?5L/DSCcE1/moPg3Wd+S/xZDuI+OsxWP9oYFaVbsyGxBknNpXBMFx2878TCqu?=
 =?us-ascii?Q?KYKTQE+ByRLtKUT9hM3HpBDklN4qHWopuoIPGtnR/fnA2SgNDBljCdwGnIpj?=
 =?us-ascii?Q?LWwm4Tkot/Ysc14Or1oB7PIf74cizkQuaCGKUxI4ioKLhm59gibIEBQB6DqU?=
 =?us-ascii?Q?z9tpiaCSKmkFFq/9RZEOVpbuSF5uqmFd7WbGGJ5tmyUTZXXvdnUvmc4+H8Hg?=
 =?us-ascii?Q?Ro5sXE2XNKgXiOEgS89j0HH1NpnVu5//CTRj68U1wO2gIIDua5+7MHueqZf6?=
 =?us-ascii?Q?YsIF72i/qxQnG6kM0p8tkXL2feJfVznAGg0foBnT8e3kFMeTpZlCJYeRy30O?=
 =?us-ascii?Q?Lh9+5XHlr8bHj5m0vmvFg0C6P5h4aNbhA1oylOQ4UpfDUlgCWRIoVyFU8260?=
 =?us-ascii?Q?Ey2F+xL1XmT4WfY6G1lntaAfRT33TM+4b8zmLuv5cYFFFcQXVUR6ATL40m3l?=
 =?us-ascii?Q?hRqJgQGjffOABJ8Mu/HFOaNHsQsbIPeSOe3LEqVwzqroggVEzaB49jNbw069?=
 =?us-ascii?Q?gAPycdCQsRw6kTHEQT95g+crVhLBfyy3QIZRJ0Auy19Sbk6GA3YZ1sHVlC09?=
 =?us-ascii?Q?XcBOpI2fxa+Hi5Zx9eMXq3PdbnJG3W5BrjtAjCQWXF7+hcCquZwno2H8Kenl?=
 =?us-ascii?Q?T2sEIHu+lTU5k13hH1QZvIo6cQ5CiFvZPChvPqUaMMjp1ttX2s9MRHROixFO?=
 =?us-ascii?Q?cDh27JcGDEneXUxhpbGgHAqEzfTBT56UhIYPCNDOqxKGnz7S8DdnIHyu2sfb?=
 =?us-ascii?Q?Xr7fyRtFn69lsDNMJEvsVpQsacYWjIFMQZSp4MefWS8Zv0oMhDJP2h0kXMP5?=
 =?us-ascii?Q?McAHNWwb0wdL6MBhqYPe1wDPzE9sfLpL8jvxSlwHOKbcD23rdqfE5D7MIYTr?=
 =?us-ascii?Q?Bk/3fZ08y07UT3Ui2HVmTyAd7dnqdkn3twmYb8Mu4QqR5VW1Sfpg7+VkJLlL?=
 =?us-ascii?Q?T2WswRPAZmaoJ2HDNQXNsmYk59dVbPn9t0YKagpfMyim+LdsNwmNHXW2A2rx?=
 =?us-ascii?Q?PPL0SfPZwm4CE6o0QY6iOZw+09gN1aXPRKlY/dvUAxEe62IVg6Ds4oJkmubG?=
 =?us-ascii?Q?Q3ijHk4HLbvtR6k++njrOiKO/C0x9tr/9+e2O+nrBIiS23hvx1rzCmweTOW1?=
 =?us-ascii?Q?DSwpUw6uXIsOK6IZYcmXI5Yiw9sLfvIb7OTMVZtdXy71f2UKyw0EGMsHe2X5?=
 =?us-ascii?Q?FBBhkSyGMwYx6rk4Py9lwmzs+QqVxmjpbjGb6oPsERkfz4S+LkF1ju+YZDDp?=
 =?us-ascii?Q?NVccORd+vY/7reJXLIf2scNlP+/zO0oN4G8O4Y3k1P+BFdJZcC73bGiV0vGM?=
 =?us-ascii?Q?TgQknxgKS/5wDCHblrTVaYeQNXH454c=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7754fdfc-e0a5-4b00-c07b-08def41ed9ad
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 00:57:27.3355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D2ImwViadJcleU73LO7qu+nkkVcslBk4wxtGNFYdZh4ic6uzghTqqI/A+GtYLJApQ1oRnkgHA9sk4pCz3sM996MidEl2AXGi0ukVBUh9M5hmtDAamJRXWk18Xb/1goDX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB16243

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/zl38060.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/codecs/zl38060.c b/sound/soc/codecs/zl38060.c
index 7de4014e626d2..aa563cf6756a8 100644
--- a/sound/soc/codecs/zl38060.c
+++ b/sound/soc/codecs/zl38060.c
@@ -337,10 +337,16 @@ static const struct reg_sequence cp_config_stereo_bypass[] = {
 	{ 0x0202, 0x000F },	/* enable I2S1 + DAC   */
 };
 
+static const u64 zl38_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF;
+
 static const struct snd_soc_dai_ops zl38_dai_ops = {
 	.set_fmt = zl38_set_fmt,
 	.hw_params = zl38_hw_params,
 	.hw_free = zl38_hw_free,
+	.auto_selectable_formats = &zl38_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver zl38_dai = {
-- 
2.53.0

