Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011058.outbound.protection.outlook.com [52.101.125.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03F51CD2C
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 00:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786064036; cv=fail; b=DWrI0cLqXBTXpcHV6b1fAY4gUrT7nh/z87fuucY+NVI25C69KGMpjlC6MT10BLJqdYcz6CPWWCKeH6Qnd9FPjoXdjnuwUxO/6IoS7mlVFChc9sCfauTXHk5nTwsD1ugskyCNo6oUTggU8pc+bvv23iEG3WiJUOYZlBdJYTfCv6c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786064036; c=relaxed/simple;
	bh=6n5+PzABtyWQVdkPWWfhsVVUzxsnOEFSpBPMfO855tw=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=VgDz7ZPwM7/ldcfVGcRCudHAUJPxyhJarkM7p74Az/vTTl5YSQaF+0jM+fKuH/7mzeGCPW3TkZVB+W41s3W+/4wfVZGQngEy6h4b0DOi/i4wpoFwSimS4Hfm6v6c5q62v7qjDvxup3waKLqYF63u86AMc+OBeVXNedlHGWj3/eI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=TmFqS+1t; arc=fail smtp.client-ip=52.101.125.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="TmFqS+1t"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wdS0fSW+ogoyFilukkUrQ+4x54kfsmbLg3Dj9/dzeYmB2O2qXpHYjLDsJ/0Hub8uKLPFwmjeLO4F1/NOpX+Mk5387+goX+w+H7U52U7aa/Vexs4XV/DnsWhYA80PA73UsrTngOfTSl9tBkK8Btp7f7w/tCYrR3HcKYbIgabiRJu+jFP6Yk7Yq8LQp0igw2BineefJepEMZ/Hvy8i5pkK3ziLasYoBUPV5Zr5y3Fk/iy/TFQ2HN0N9engp3VAODm0bClbjnAucjggiVOeiGBuDoTCgYjRiCuN9ze14R/hcsWwBfoFGvqn7aQBGVOtvIHQvG9aXpvGYsKxIhyjZ9xu3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qEhwF83NzxaOaRzy3JMd+sCLRwSR1+yyJYQl8g1IKpQ=;
 b=L9Exc2enwOqcruv+pOZ5gLYncKD8LebMKHpHsoq4lIBAxdJe73ZUokgltF2IGiD9Knx96F+fodduwgn6gs+DmlErEVYLEtk6FLdL0tJiVjx6e/d7KOes/OjaBLAhhGL+IYcnJNuJnPzQ5FWBKCJt5wFSU+61GjDg+Cof41sqQibfhQMEYpvcOge2y4Hgqd9Ulwg2gILCZVgInZ5KnSv6ZcSrj0AjBOrYtFGblcSjHp9DrO7SITl8F0HMMIzcTH3ECkqI/IOvV0WX78kpjlPrz2DRD9QcBweljJNnhp8oWCDkaEGRZxX1/w/N+pQ9aGMv/qABuDuENvoXlOzaNYoGRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qEhwF83NzxaOaRzy3JMd+sCLRwSR1+yyJYQl8g1IKpQ=;
 b=TmFqS+1tyBMcFcKVdOkycqpEXPH6yy2Qq1/hluBo4UV3CvmjPbnvxDRd1U/Oo0wbt2nV4Q2PuDBcilvvi+rp3Q4Xy9aaBAfm5RMT+g6G41DXzMwbOqk2ZgF27yNSMOPVK2omdxC7QAcrEChwauPSgGRHMDaTUddA5XeH8Nz8bXs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYTPR01MB11044.jpnprd01.prod.outlook.com (2603:1096:400:3a1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 00:53:52 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 00:53:52 +0000
Message-ID: <87se4qu4wv.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH v2 10/44] ASoC: codecs: cpcap: use .auto_selectable_formats
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
In-Reply-To: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
References: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 7 Aug 2026 00:53:52 +0000
X-ClientProxiedBy: TY4P286CA0023.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b0::17) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYTPR01MB11044:EE_
X-MS-Office365-Filtering-Correlation-Id: 83562512-65dc-4fe5-5f72-08def41e59c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|23010399003|376014|1800799024|366016|38350700014|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	POO97ygxxavpLFEe6tE5ZN6rMqbN1hmP5ijhkCI1eyehkrE3wi2lyZf1mRGRrmLp7rNBfCYESgeP9fccPe2vkhRM/THLc9mAsS9UWe11gjyOVJD6wIGrOugauZ5PoSjnf1cf+F+b7IaVdzxkVoom5mVBi4qCza+GcuWdT2TUJQJ2bgbYEOIHmSmSPTOfd4KXk9AdrdbObRUqzF2eCLZ2hgjsaqyZJCeBZJm3kj8fUyu3fkcFjKstxUMmOp0TpPsygOo+Ka1cYz+L0enjyWlZmUMMlI5I0mk+8Z591oGB54gGlGmWlORFjUoQBYWRLslKzITppFGDEGmbUZeVdV/95p2giK4OpJLSfQgHs8lOwZr0g+6wMSLrTk+XPJt7WVdoUNN4s5cb0sc3+bxCGV2q0dIk2Psyip4rl173gwZ0Wj9xx8uSVmD2Q7VjzF8Shud9/a1jT3LeQpchOQHNsOZGNzJop3JlGj8e0/ZsfM1uxu96Wx3sjdYXn/8ZrXQD+vzyGHNKN1DVvscb8Xb0nqza5n6/Z3kxjtohmwINLq/AqOhgoFThFHeMOsDpzPAz30LKKBaDq0MFRwLn/ovpfSCyVQJ6k7tFbWIZwR4z4dYrn6utsCfIcU9nNpibWzno25isbyR5ARCsTUPmr+upjCaFnX8repNPJzcZPAHaLiTDdfE/qun0is0bFUg5afH+uz6Ca2QZU738nFwmfmmufEa0Vw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(23010399003)(376014)(1800799024)(366016)(38350700014)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?n3EvAq8NKB3+KhpyN7ePF/JIzzBo6+cVZF+8CZ0UDpalCdvD76LKGc0td+lw?=
 =?us-ascii?Q?CLLZc1xChUfBk5g9XpZxexjVXLtswfvqd7z34NOLT3WsFJOAqpPaqpitAYWs?=
 =?us-ascii?Q?AK47VOzUeG1QR6oe2eA6CkbAGnQaxOikajMznxOquGfDCAqPLcMn/a2yI31c?=
 =?us-ascii?Q?gNBaAKUYnQ3Y7FMKzOGjO3LdvoIN/CfzUj+6CfO4zXKNes6uj/pqan1Y8+/d?=
 =?us-ascii?Q?YP4ZCNTS6DM5MoWd4tg0KpSWpKqaii04yv15y5RM9CTrTJwaQ/XcKrfel2GD?=
 =?us-ascii?Q?Ryf5g333ND/gL0NyEB5AN4dye7PcL3P/My+dw9mvtol+WMnNAuw3qGA7mQYf?=
 =?us-ascii?Q?I3NkRSn3BbqVPmRSPpyQGn75wQ56lc4BlH6UhhqXsMC9U7y4O3z5cHVupsRF?=
 =?us-ascii?Q?ibB0yWTu6hspIf4IYs8+NW6TADb383sbbhS9lZGbWsTWkym5Rqdb7IPWxF/1?=
 =?us-ascii?Q?sRQTKcPWrMeg8ylM1UJFO0Qt+KJ3zqoploxPSsO0/OZrwes/MK9HR3kcrX4Q?=
 =?us-ascii?Q?Fnjz4nCka7h+zpbprZmeh2iV3twu5fC846/ea9kIOo02L2SP5oac80qda5Tu?=
 =?us-ascii?Q?Z872MouBiMpne82ZScnr8QXLQ+Rh00QYDnVjbAEJlJWoaXRFISxnx/O9XdtK?=
 =?us-ascii?Q?qKB+jIE/N0QPlI4V9O5dsrEFCV9OdCBlPAnEzxNzbXjJ1mcQsOqbVjC2ngxV?=
 =?us-ascii?Q?5SmkAjXrHgOWhtm1Zp3Hf79DejYLyAghUPHaomKTsPOw/X47A8tdvO2Sgph3?=
 =?us-ascii?Q?8NlkutvA79mLwHfDaV0v2CvGsPiHEvKGfzCOgc+PyNC8UovbbaU6B704yiw8?=
 =?us-ascii?Q?3cutBdHqxyzd3Q3f8uyA8djsxK7uBz6TbCB4AcjgSG4GH1ifYuhfsNIStfcU?=
 =?us-ascii?Q?GSNsfNls68CTGj+vnF3h1Ktv8rG08zizFjz4nCZh9paB9TJ31Te6OZHTngQB?=
 =?us-ascii?Q?7f3+e55ePnwbmM9ju4OHARCisS7NBRlw4fXHsAGmmogTWnSOQ3q0x5HCbeMR?=
 =?us-ascii?Q?KOrhBDcvulZyU52x7npS3Ue0vEQ+1h3kbVg2hM44EPLs6hHbL/XL8lfpm6ro?=
 =?us-ascii?Q?qfejdUiEV2C0Lx4ajbAUHs1yMbrKeJjwhRX8sQ6TVu2YxoQtI7lXAzr0O9fG?=
 =?us-ascii?Q?+BNgdonYamGYn/7dv8bjmUEmoH9HjCVbLnqXjJg/bY/CwnZiZ+vMT5DE2NFw?=
 =?us-ascii?Q?9+ab7dgJnaJG5SdMzRp590pdWdUguLPH3lK7rfzDAGjwxyp6vxMj0e1OCqed?=
 =?us-ascii?Q?RtN59l4jKO0sTegPHCszX7j6zYI5C3ohTxfpHSkPJd6tVSSBdt/cq9Bx60yJ?=
 =?us-ascii?Q?mmviQMBGQhG37lDuYw8WMKse1Ml/qD2r3Z2dOOQC2kUrG8arIa/iuyzOLFbK?=
 =?us-ascii?Q?M72+CnjovUxHc8ipfO6rjDINauMoedDEASn2nLpo/6r3Qcv76cpOdesTgs+i?=
 =?us-ascii?Q?dGdr5P1KiwiGRgZ21W7Wo8PfJHj10zihryTDOIMT3XgKzxWEuiz1aHk2w+93?=
 =?us-ascii?Q?jWwpFF5+KpOA+A5dELe1BhCLv4EsNa5k17uRzkwuHTJckOKDSA6oQXOdUYSn?=
 =?us-ascii?Q?G8iyAslLQd+QNpsJ27AtzVmVx2459dDnH9q/ZIWV4KAx4L2NbzgU7K8af74M?=
 =?us-ascii?Q?SdHq8qZ6B65BxS37Y7zxGXyaXRylw9j34XplGVVpTgR20n27Kx04LfrWOKA1?=
 =?us-ascii?Q?hyQo2JecE0dJSxK/x52vjTSoQHfyb6IQcnCKBeqShD1G5/Y/pIT2kpxFStWc?=
 =?us-ascii?Q?Rxb2OEANUOWZirjC1oOnNEus0T/wL7KCeYzVKQQjReO7ewHzujCg?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83562512-65dc-4fe5-5f72-08def41e59c4
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 00:53:52.6636
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MwAYtUzA9R5HbK5qLkPNaIfixSXo9HhkxAh1s6oM09NBS4K8vzcurlpxCb/ZDGShcxnZ6sZ0/F4eEvRlgXjbYcfeiXaK8exqFQjWuvPJBJuhTDXfOb/PmqjsN3WbYXj5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYTPR01MB11044

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/cpcap.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/sound/soc/codecs/cpcap.c b/sound/soc/codecs/cpcap.c
index 6b80c455b0747..b8bccf2df859f 100644
--- a/sound/soc/codecs/cpcap.c
+++ b/sound/soc/codecs/cpcap.c
@@ -1253,11 +1253,24 @@ static int cpcap_hifi_set_mute(struct snd_soc_dai *dai, int mute, int direction)
 	return regmap_update_bits(cpcap->regmap, reg, mask, val);
 }
 
+static const u64 cpcap_selectable_formats =
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
 static const struct snd_soc_dai_ops cpcap_dai_hifi_ops = {
 	.hw_params	= cpcap_hifi_hw_params,
 	.set_sysclk	= cpcap_hifi_set_dai_sysclk,
 	.set_fmt	= cpcap_hifi_set_dai_fmt,
 	.mute_stream	= cpcap_hifi_set_mute,
+	.auto_selectable_formats	= &cpcap_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
@@ -1528,6 +1541,8 @@ static const struct snd_soc_dai_ops cpcap_dai_voice_ops = {
 	.set_fmt	= cpcap_voice_set_dai_fmt,
 	.set_tdm_slot	= cpcap_voice_set_tdm_slot,
 	.mute_stream	= cpcap_voice_set_mute,
+	.auto_selectable_formats	= &cpcap_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
-- 
2.53.0

