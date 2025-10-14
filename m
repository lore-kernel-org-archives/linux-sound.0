Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010046.outbound.protection.outlook.com [52.101.228.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89EC22332E
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415777; cv=fail; b=sqYKD+H6ozPh3BMa1+1rrPHRKyjY+rGLblliy9rEvUO4mCpOPhkk6Yx1x57PHARQrFgSj/US+jWNeuilsKaCHipJVJqs4xozEVyLLt1KA8T8BvfP4nCPNfE94GFkRZ32AoVfDLjHHaw6skl+RM4RLJ2UXWXzWhYqsLy18aEkGcg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415777; c=relaxed/simple;
	bh=V80MuB8fdSdo/TRbyzNTv3iFpmK/f5MYlqHmTSuZ6rE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Z1yvueujXp7kXsLsIQP2I+E39KxrrPWhBaCDuHAeceIcXFPpApndaBz3OJc2k/K1MzIFAO7RJqFz405VRgPGME4JajRuv3r+XYnMFiSvWdnvo+IE6fvCSgEM7tbybNBGnNLhh7FiBCcI0uckuuQoNdYrmbrninqJMgdzhA3DPNY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=HOJKUVWR; arc=fail smtp.client-ip=52.101.228.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="HOJKUVWR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gHyt7ga7FMJt2rJ+KD7GkwRRz2euTfBJQXtjN7gpudPCnmfqOtyVDvpdcNBC+pxzMJnOCmFxuko1/Uvq0T13cVeoNlqilDuFL/r6WE1aW1tZEbA8RbL69ntKCQNtbFWyUHgHyvjuUdj5Wr03ykVhc4lvpTlJfsEmt2U6ZsxFUOdSBvFRpx7oMzgxYBuuK5S9lUiHDXH59+PH6mu1neR9xNPnUU4fOPDDLIcTb+XOYH1Cza9cLEAVC9Lc9nnVpzvT378XaycTpSw8poLCumRtV4ZGg655GrU/xoNMLNEx8Mq6vGQdqw1MhP5+q4hE/ouh8VzwXCCjzWCnjiGFAzJ2Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r3uf1kH6s7OCCk5bkwfBMpOETSFAi35i2WV9P0sgTbQ=;
 b=nHA4XWNRMNxLYY9JSIHH7UKhkM+IO0uxMvETUBVJpPri7unoeqRrQXilz2NRfRuMW2tdgQ0JshtCawCGJv6q4eggss+1JCg7aKS+dxnKwvfdcPtcE1OMNtSRAk0kWU8RU4wVU1ddEg98qchUGEdir2yy9k0zFnVqFKJU/SXa6Y5EPtidQy1Gk6WZBQdUHVLK6Knr5B0x9N5pch9dxICdHADMZaPwXf6HwlVct7lh7FJzgo5ULpjNJXx87KCY0TKwOS5JANYO2BBBgcj6VFkBDXSzsobgWJ/aAu0gALqWc7PlruAnYuezKgd+L6YsxC2+iT+xK7SY5dwY73scmoEw+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r3uf1kH6s7OCCk5bkwfBMpOETSFAi35i2WV9P0sgTbQ=;
 b=HOJKUVWRif1ABQHxiTsS4OyjiIdHch/YRffpGKx2u40R8Qq2cbZs4l5XbfuOfK5aPqZrnfTc581axBTawVDH7V6dRO06M5yVeYyVNGADYcRlCaaDh/AG4zQhgMkyJIUid9qM89UsdeEcw6+shfjUEa26Wx2GrnJOFVx7SY4SQWk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9449.jpnprd01.prod.outlook.com
 (2603:1096:400:199::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:22:52 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:22:51 +0000
Message-ID: <87plaqqfhg.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 054/139] ASoC: codecs: mt6358: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:22:51 +0000
X-ClientProxiedBy: TYCP301CA0073.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9449:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f8f8bfe-358d-4d2a-92f4-08de0ad956c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LTnqsU/Te1siOqnPl8hA0etC3SXo/yDerkbqP4k/JtelKdOqzpdXy7h/J7Al?=
 =?us-ascii?Q?nJZIz4Bidh+wZLnxsYAooGaclpGMeMBNcPudOyPm1TrMUxss20+O2QGHGesW?=
 =?us-ascii?Q?O/uwBftw3GifcLg7fnAEEyroVYCWvdZ4bBaIdX72hyQEq6KqBNNIaoko/MOl?=
 =?us-ascii?Q?zqnO4D0wMdvrjbgVqk5DXaXKQ/1I8GJByPtapsWbF5v/CxEBPIw+eEXxxSx0?=
 =?us-ascii?Q?XHIjNjXD/3E5THpDxon/KBOu1OTC+zXrmNZtN2+so0ClucdbmVcdHQeDpGQa?=
 =?us-ascii?Q?OT0Xf71c8vOv56xsyTEqj4BnYbqLK3qyWXzMTfR/iHAt7gw1aWJeSKEnCCUc?=
 =?us-ascii?Q?B1pB+oLl6087L0tHzkVEzeZhbzCqiT7k4dJ1apXaJ27UPx79xHL6945VDHwk?=
 =?us-ascii?Q?zPPgNHzVnkdoMbVBxZpcjAEt0famaqe/Y+1LRWaYjczPajMsMP1NJRZw3lZL?=
 =?us-ascii?Q?zXmG3W6Cx5FO08ndueIzmQihKEk7+rJL3C2UfQrz6Vifvy+ypxqX9nvLjxWP?=
 =?us-ascii?Q?9rnlQvuBxADJLfbbDjgwg7SmuUOEcBsvgctw3KCmKK6SvyBuAJ9L/zoeMTNN?=
 =?us-ascii?Q?a7g+DRoOL5b4lgOxmPZcEnQBOgpqVFPldP6xYDii62AYV3PoDUi0UBlRUfft?=
 =?us-ascii?Q?2O0bKc61/YI7fAm6h8k61CNK50bCK/m62kTTT/f+G+hMeIBUE5nF1G3M+zjN?=
 =?us-ascii?Q?iSBTOI5MopIhimAZM63p8X06K6fqv9xsoDFt4CfIt/ZNxR4bsDfRLXq5LovZ?=
 =?us-ascii?Q?ms1YCNb5mRadK0PG8yji2tBmaWeiQ6aD7ksraOBTyKFOkEmYMw78kVTDYuGC?=
 =?us-ascii?Q?y7fNcoZMefVVXsXwt+zXN5oH0KEsyuTNYF1og3lqDX9+7bcRYI6q+WQGozHq?=
 =?us-ascii?Q?7sjXKxP/DFbgwfjnn1n6QBAPsP1J4ZEmSwPcrcfMSt/W2Gi2/ocudR4XFfyg?=
 =?us-ascii?Q?WRII9Sd2ISK7suV70x/bKeL5fbNieP4G0J52EixZ1GmW/IpXM4i1XeZXf35n?=
 =?us-ascii?Q?amZjIYJArqxAELj28UNtk+sgmaYWucwRzgNzOL2IjNCNufui7wbZuwJdNkGC?=
 =?us-ascii?Q?uG/IR/LR/S2qMsorz7B7YNH/IW+yfURvMPj88oU/ilPU2rrb30cMu/NiOg8o?=
 =?us-ascii?Q?zY2QdqtB5Rdavo95Mxv6XF8R79u2y307moZCFqBURkeQvhO0oM3jBQw4m7dU?=
 =?us-ascii?Q?xgNc6RJXy4puMR2INr4OugNK3vsYU3Y8Cu7X8I17M65dQZV/gLkF7uTxQiZz?=
 =?us-ascii?Q?DJNAEIaNbY7rqeF3YsQsWo0RVo194GTcfGLkSGlzfdQqDxEGjEMK2f2S4tQl?=
 =?us-ascii?Q?3jVBq+tkl0Gus3IqTybkAKcqcfhAlfh/NOQMiIjr4lzH3t66n5+2cbtow4Ey?=
 =?us-ascii?Q?UEKnltDLyWJOAxMmwyauiC6An7gxvhNOQH4EtbQsWW4P40YsfRNxAIy+dzhU?=
 =?us-ascii?Q?ccti9uyX1gG2oTRSi327oF1uCQnL3w07lXF3uX2sS4YtPhlQjOV7si61/Oqq?=
 =?us-ascii?Q?bfbcKSV0QOWyf2IURJAhdwK/ttTb9jdWxQw/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tZ1gDFLTqEc1e1hYZ6c6E93BxDMqNoDF7g2Osyk68IbHslH5M1/okfEwaDUi?=
 =?us-ascii?Q?FkdM57qnZZQXH0klwG/S9mF3OL0uSFo+kEZlcLFB8Qdt588Xv4eH3ofzkVzb?=
 =?us-ascii?Q?3OIrO73yps1NxoPy9s4YYoq2c0VWEIyUNaiXOX6FHt0OcIrJHkyOkRD9Ppo9?=
 =?us-ascii?Q?6NG9ctzIkdbDvzNV7R8d1rTyfN3mzKzOMN+DIQ6eIoMzvh3lc9yhl0MF7FrO?=
 =?us-ascii?Q?LD8/AlKR/swPZqmm+FzVV8eYIySi2RdBB3dywLPau9pk71ta5SkRYlfS4k0O?=
 =?us-ascii?Q?HcYLZEL4Ch86WN5oTNAoEJzkA0dNZztLLFEwZfoxDuatZKNVIJp9k1XaKoOh?=
 =?us-ascii?Q?/YonKliFa3UicJmmqxl9cjrUBYF99kDQYcoUpuaRDH/t6vvRSI1OaBOdnYdm?=
 =?us-ascii?Q?DKTazpubq9Hqan7UETGFi2hmc2ZF3lzWXzI+GYuujHTo2CE21lu7T3XYnm7o?=
 =?us-ascii?Q?b3m3Z0DXioxlB5VSQpmuybs0e5G+5e1QjrgUiQKA2KStrj6j389J8/wKiDfW?=
 =?us-ascii?Q?eFUuwuNaklpn+jyeLpmm2kx67cvZLNuhLcCUo2vNqgGTEVaGHfllbDmb4wPD?=
 =?us-ascii?Q?R9se3PKq64KvOALjgViVpajSdXmBWxgqUCee/d6ZF4IY7ZeLd3Ob8DI5I1fs?=
 =?us-ascii?Q?YdhKjLnJptVlPqtUrwWBOzYo2cftwnofwiRcniZXhEl4RDH5aCzsCuSwvRcR?=
 =?us-ascii?Q?36fR9vDgY1osflIjencNqOrSsyf6wP+bA2ZC5M3qph3ZcZHplw7A3nbSG7yZ?=
 =?us-ascii?Q?KxlCSKbs603UqBPbQcVgrbCt7e8sGcbK50A/WqEUKpuQoun/WH/q7+clWwMw?=
 =?us-ascii?Q?KGJcQO1bHueRiRx+cF4yApdyOiwjn8uK82S2Zw8T3K2yHX2p84iZKDGjduRZ?=
 =?us-ascii?Q?+xIxb2Q3c4iRdaKJUVfxcNzpMZqRWdeDM4K1iX0iEGlpAnjm4vDaCf7Vs0zH?=
 =?us-ascii?Q?+RGyWmGZx7pJonDR9xmVY40C32cJZotaPgLDg7/dI5OJ8I2nIkBLpOfERpyZ?=
 =?us-ascii?Q?/F2Up9SI9JKuEZxMAljc9+mr6pokpkJTyWzv6wTMSNm6G+a27HfJOJyaDRTb?=
 =?us-ascii?Q?vDxR4MzsBM44qIQ7aKh8cE3OJ4C61FBL5CQfCT4K9oeB1m7Mf6/ZOLY/Anp8?=
 =?us-ascii?Q?Pu9Jp2MAf6NmV8MiSInprX86ze0EpDxPBimFtGk7csIv/Jxoj7WJodZGCVWC?=
 =?us-ascii?Q?oq8RJor02CJuTXvzoDj74KmGQmRfy0Cx+kBTWN49sbIEzwaFEazApQcz1Xax?=
 =?us-ascii?Q?qrxGq90ttYN4GTrCYLNsBkYdLYPl/cIVLcuSuX2L2VZDWxvA9kSESaKgy4H+?=
 =?us-ascii?Q?6XuZiwVdeaVQr9W6yuWout12rXZxYblQ6tUc9ln/MKNdT83cvmIEHniglYwu?=
 =?us-ascii?Q?3vOQcMIejDhVpofHu8qEBK/qEhrfdbbGGkjKkgtjeBHZK7cTCzSB1vLAvyQo?=
 =?us-ascii?Q?wxPjO6Ciw4csN0ISQhk9twYVvbZnnWC/1zMIGDM8rl2zHBB+cG3ZmsoV8Vb1?=
 =?us-ascii?Q?2y6wI7v2ub8xDMdKNi9hun8uHWVrsKqQu/J1bft0FON0vG+KYDcmeZ3oPrIi?=
 =?us-ascii?Q?Aq/tckM3NAhBcgGFhuvWhTdqOcm4EgAFlrZDa5dgj3/27Kj4yHAMbSOBpPDR?=
 =?us-ascii?Q?tpzOaPgGIW2HuSjXMSZ6wcw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f8f8bfe-358d-4d2a-92f4-08de0ad956c9
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:22:51.4638
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DBNGGz/ep7/OSKTxVbQ82fjDttD6s3n4/XFgKAoY8eFgnx6BOy3iktKTXopynm8z2YLBH0IL7qbUJ267L8rZ2V6wLRgLFNNfhJHNUf7P6rtepS/3KlpYipbaT2h/qoAT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9449

We have very similar name functions (A)(B). Both gets component from
snd_kcontrol, but (A) is used in callback functions which is registered
through snd_soc_add_component_controls(), (B) is used through
snd_soc_dapm_new_widgets().

	(A) snd_soc_kcontrol_component()
	(B) snd_soc_dapm_kcontrol_component()

(B) is using very picky way to get component but using it is necessary in
ASoC. But (A) is just wrapper function to snd_kcontrol_chip(), and directly
using it without wrapper is very common way on ALSA.
To reduce confusions of similar function, let's use common way on (A).

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/mt6358.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/mt6358.c b/sound/soc/codecs/mt6358.c
index e033027fd4c72..de611c483e0be 100644
--- a/sound/soc/codecs/mt6358.c
+++ b/sound/soc/codecs/mt6358.c
@@ -320,8 +320,7 @@ static void headset_volume_ramp(struct mt6358_priv *priv, int from, int to)
 static int mt6358_put_volsw(struct snd_kcontrol *kcontrol,
 			    struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-			snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct mt6358_priv *priv = snd_soc_component_get_drvdata(component);
 	struct soc_mixer_control *mc =
 			(struct soc_mixer_control *)kcontrol->private_value;
@@ -442,7 +441,7 @@ static int mt6358_disable_wov_phase2(struct mt6358_priv *priv)
 static int mt6358_get_wov(struct snd_kcontrol *kcontrol,
 			  struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *c = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *c = snd_kcontrol_chip(kcontrol);
 	struct mt6358_priv *priv = snd_soc_component_get_drvdata(c);
 
 	ucontrol->value.integer.value[0] = priv->wov_enabled;
@@ -452,7 +451,7 @@ static int mt6358_get_wov(struct snd_kcontrol *kcontrol,
 static int mt6358_put_wov(struct snd_kcontrol *kcontrol,
 			  struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *c = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *c = snd_kcontrol_chip(kcontrol);
 	struct mt6358_priv *priv = snd_soc_component_get_drvdata(c);
 	int enabled = ucontrol->value.integer.value[0];
 
@@ -476,7 +475,7 @@ static int mt6358_put_wov(struct snd_kcontrol *kcontrol,
 static int mt6358_dmic_mode_get(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *c = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *c = snd_kcontrol_chip(kcontrol);
 	struct mt6358_priv *priv = snd_soc_component_get_drvdata(c);
 
 	ucontrol->value.integer.value[0] = priv->dmic_one_wire_mode;
@@ -488,7 +487,7 @@ static int mt6358_dmic_mode_get(struct snd_kcontrol *kcontrol,
 static int mt6358_dmic_mode_set(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *c = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *c = snd_kcontrol_chip(kcontrol);
 	struct mt6358_priv *priv = snd_soc_component_get_drvdata(c);
 	int enabled = ucontrol->value.integer.value[0];
 
-- 
2.43.0

