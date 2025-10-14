Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010063.outbound.protection.outlook.com [52.101.229.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290C83074A4
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415598; cv=fail; b=DG7nmiMHwqrVJ13jcLBrRoVvZz4RuTXWzhL3q9ukXYMd+wexrzg0NczKj79jXL0pHgWQTB5J+6GBW4k6J3aGSEJr8Ljo0jSeKdbd988TK2GgrM+99tUdqqNG5op+YGtMdSHFe9gRQ4S7EqRF7YrvrPpicRs3EfoAF7+Kt9kMIVo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415598; c=relaxed/simple;
	bh=Qnlv9IbMOcG+oUDap8DWPJ+9VfMtjz9eEuD0hPZutN4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=SPBycpDtjsh1I3Bn0iANUSmu2DoC1lgX6rFMNLR921GxdNYdxZkmGMbKQBKQXTqzh3W0+C8DCohb9+CMNgrUR5emZvfaFb98z09a6/nIQQ1aQGUffKvvtOqZQGGy1fno7uhDo9Gzqa9gQmo21DhbMi9BeVyxa9hL3TkzBKzjW0k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=e2osW5B0; arc=fail smtp.client-ip=52.101.229.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="e2osW5B0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cR+RPSujvom0Szxq/2MCsOMHRQJK7IvjTX9w4Twcb0rEOTjYKfu9plel2gnpIBpcFjY3Fg+ZUG9iSIH34KAIIBHwp36dBTA40wvcMS+ZsR2ACr/vAFMjtgZihlUb7vuBICfA1ptKZ+CyNsqa7J9kzkfGZjVJ1TF+3Py61fbdAu/ojkmymN9b2piay4LgMJFYoicE8ZUZumo6ZNpQDOQjVHfzgSptU7Md2vTC/ZoBRdkzXW1KaOdUcQ3WMAugWoGSxFNRdTdqI/lavM3u6F/YmCG6QkIXLC5O/12mL8GFhehW2LUSIi3ufYSkzOzC514DsSNCNsEX9lqDytiEiOrRQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Mm41/0S7qF+VmZ36IaYuv9qmFNYpHLVttQ9JI8FznY=;
 b=GSd1wIn05WMhk+vYXw64gk/reM8+1rTrKtjOJs4Rk1MeETH5RYEv8KxXaZr2NgRKRlO/5N+YzLYObOpB6YbRSq6oKuHZf8Oi9AUWdvE2H3M2/S6I3f82NeYOHmRm2a28FCk5EmES17t8SLc9KuMWV8OGOxval7eXGWgb2WDzVOxAAtiIJ2dsXMuN15/5vOzlxISbEBdManawO7NskDWViUUeCt8lbRsvwuvbUVsFi8uguuCO9+ltqOCCH0Y/Tq179qEh0qykQ1yd7aBTn8aOp8IHC2YNwbm7Ve/LRWsZB8RmRBmk6zLhkRXkjEa98juyj6nMVfry8J0bvP9x8+UO6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Mm41/0S7qF+VmZ36IaYuv9qmFNYpHLVttQ9JI8FznY=;
 b=e2osW5B0fthL30oF8lMxUnxfxt/U5wWhocK33kOljJkhrDnplFfy1ssYleFKSGF6913J6KT4766Bp/i+hNPJlL5CRrkzpb2bqwt5kkVNbIDZuBAE0FejfIZvXr8s/AVPMT5b36U7GsqdUDnAQBE+o7D5XGNhTkUv7FFb9V+Xkyg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB13923.jpnprd01.prod.outlook.com
 (2603:1096:405:1fb::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:19:52 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:19:52 +0000
Message-ID: <87ldlet8rc.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 007/139] ASoC: codecs: ak4619: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:19:52 +0000
X-ClientProxiedBy: TYCP286CA0258.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB13923:EE_
X-MS-Office365-Filtering-Correlation-Id: 8455b8f5-679e-47a0-6f36-08de0ad8ec10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uj+6r95bOk+QRJI6SSJKYOVf7MlITqcxv1Yjo+eHNQQjNKlQJEN76N7gJ6iJ?=
 =?us-ascii?Q?AKCjYlWN4ECfGEOt39JO8qQJPUEn4meHo/xWD8XMNjIXDNLp62L7tGibeFhR?=
 =?us-ascii?Q?RZQEL2hUQjYzNYPxbeIYgm9e1zHHnTjFvSdWhBXI37CvFt9Xch0ydtwOMpo2?=
 =?us-ascii?Q?EhpSJOPPANO2FbTWlDTkZqQJAiak0ya6c1stHbO0qE3exR54XmxZRzRHHBmP?=
 =?us-ascii?Q?GILX9+GdMYzvBr94hOeYhIP3/HLvrWTypTojm5JRKbf/YOLl9jeqIxMwi/gn?=
 =?us-ascii?Q?C3IA+Gr/L1C6niK8TB/Vw3PPNLGYFNw1X1OJ5WZugSrBGsGsN8UCgEdq/YPm?=
 =?us-ascii?Q?RtX/+UNyL+iz/4YrAxR6krzGZGVmOMWI37LLQJ0gtQN6avcrBP8+ZaoHb4Ub?=
 =?us-ascii?Q?nJd+rFK+tB0cK16eoC5Y4Wo2fhrNk0YyYEYsSEhOQO6qDbbG7PGsWMB46UaH?=
 =?us-ascii?Q?DpP/8+PrjubLyoL1bWeBbqNWWv7xKtua+/vjuXdfuhhBDc6IfyH6ncR6hphc?=
 =?us-ascii?Q?t1sE3JNPzuLNZll2nMhZgLGi540ruGoNekMVRSqZehxivFRkcnM6JagwxWt9?=
 =?us-ascii?Q?eUFUQf7wkncj4ynLfyNB3fujMEIkjWcCzZMRbtee+QarMDXbm2q7YJkeD5SH?=
 =?us-ascii?Q?sfd7e+FQPRW0PmGkgj4BvU0JIAIDjX4jbEfEButJ8QtUXJC4/70P88BVVlUa?=
 =?us-ascii?Q?Vgv1vJsnVNOxmOZ1oH8HZAZvYXRDE27klAM/qNSi2v5uyC90zCnuDSWNB+Ac?=
 =?us-ascii?Q?s+Kjy/4JxB4sf5SwWZJCQCxjbYvQxBWIl9lku/Y24NzUxOame1T0mKark9K0?=
 =?us-ascii?Q?2TmBuQg9nXOaavwGrg8x9LUk1miMYcgjjIHSkri0nhBEEN+WbpQpq8sneh3R?=
 =?us-ascii?Q?Nw/CtAk9QhhlXcKOrG3354sQWAHrE55sru5BZT2LbT5y/bLwuf5YRnszoZmc?=
 =?us-ascii?Q?B7E8kw3+bootWwPKh+yHDh4zdYf1ujbXIgLHAtBQLsi672UsDyCJJk905jR3?=
 =?us-ascii?Q?lyVGi3jFcIvk5dd/QB3HRIPchoTcTzGvysLRgJvyvfdIajrRsWuh54WlF6WY?=
 =?us-ascii?Q?nqk1hId4YrDaYoOUS0X3tF8HfPWvgjRTkwI3ffjhndeboqyIqefhQL/pVU2I?=
 =?us-ascii?Q?Js0GXBKaLFjwyrCul5+HpspMDuy67ntNrf7W4kH/e90rxEu6QdkL+MYNLTrQ?=
 =?us-ascii?Q?pFfmV/ntDQ82NqINhD1Yq1t3Mm4Be3HzyFDmF+6oFPDSSaVKDl2xETXNApag?=
 =?us-ascii?Q?r6MDWhy+C58ix2zdLAHGvdBd10Kz0C0yPRojqa6qscJJDdUglumnOpmOA2si?=
 =?us-ascii?Q?MZu8GiUW+ckjpcriQhzxXZxSxeZ4aKNwGzqai+37bQk+GD6vUTijyY47H8Ma?=
 =?us-ascii?Q?OmL83G/4ZYgSjsIxq7cBhKZmKlTLJ94gFZwWbrOMp85aFZot+q2zhpsDa+TY?=
 =?us-ascii?Q?DvgIe7dzc4dZPBXz+/7zij1V9GcWSoaM6HKtbkv9Qt37tb5rxN039YDGyZRi?=
 =?us-ascii?Q?p5i2PaBoqQYguYVlcZHvsiQxwTruFRbExZzA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mOPRUo91JWkDlf1iQaez6/ip5LOpsUgYDVPqEvrhCrjE4iV/J6+vOnS95iVb?=
 =?us-ascii?Q?qKuRSdMg2DI4QYj2jPYFFi7/OTgf3b2N5Tlbc+hhnb5GclieLmLHFqJoryf/?=
 =?us-ascii?Q?U9/n/9X/JZHRDYvNU2jrsAL9c951dvPzMcBBRI9JygrwxQcw/z09CDhkzt7m?=
 =?us-ascii?Q?atoKfxzbnIvcvOoVUkszToO1fIh55g7hrudJyG9p7LQG7wTDAKw8/CSiNqo2?=
 =?us-ascii?Q?aA4hdVQrChYikVlW7lRkNz14oDQcwb+ewueRGzIm3k1RrmRILbXMi0vpnSIC?=
 =?us-ascii?Q?ZwKZX64+lWNP6pwMICOzbuFJsyJvCKYygYtSUqfl+XOy7PPa/5uI8ilCJusS?=
 =?us-ascii?Q?aaC3yFUNMwfSRa6HtrJhx0omrE4+aCMw530MdGrXMNBkVnPMhr33TYixD+Gh?=
 =?us-ascii?Q?NqXkzhQdRnby4Vr23sttFHcey9x0qU4vOCmn30Z/kQiq08c0e/H5D260iWaz?=
 =?us-ascii?Q?nB5Z5o1SRo+1nOAaRAsRX4NxUGst02LiC9sRV6j7F4kcZbqYHSf3JlcCy/H+?=
 =?us-ascii?Q?Z7QDMgRcEFFRJ8cSo9eupdDMd+ZEfH2hSMU12bvSkEMsUFJxUhL/hc8MKwFx?=
 =?us-ascii?Q?Z2MIg/TdU8xumNnryPRYboydC4obUBrDnqHw28PDaesTaXAQngHDZhiQlSIk?=
 =?us-ascii?Q?ZySwcoDlfbNX0sgeaUtH//DPRnkrMGtZOrpt0/9av4Vab78eLLiRHokJ3XeY?=
 =?us-ascii?Q?cvbZstS9pY0aUqmcFS3OxwJdnZtJXufu2cQtJ889beDdgdamqq3eyu6qZhTs?=
 =?us-ascii?Q?Gkvx0I4eMb+8JMFFKupj5d/5n2p4ebtlH+2vpuDpW4De5B89FfnadkP/2cEP?=
 =?us-ascii?Q?jPP8v+RgYogokop1r0LukBXwWNkfIL5CeXtqo1kGNSCJBzyPT4eJMg/75r2J?=
 =?us-ascii?Q?IbK4PXd/I3CO+kNvo7jGE0cAfrANrsqa8QOmiTP549NjkvwK6UaDVoPRqYxe?=
 =?us-ascii?Q?rv9BkCEg7J8901eUwJzRF6t4/316IoSpvDm/L3lgNYX8uYyt5ZE7DIXPoPqd?=
 =?us-ascii?Q?RJIgFXHr64Zz9SMC/ZfbQfjyb8r1rFsGNxYtxrRlBK5hyG5FznT5/IQf/Kpb?=
 =?us-ascii?Q?cyJz8yoWobnBHu0tiswq8GklOXjl87lWmM3Te9SiL6OJ23HEKJKHy620vTCT?=
 =?us-ascii?Q?pfmh1IwwJ3lMmq/gwaYOfgUqggvmNXIVcOKQC0YenQAvv9x25qDMUhTGbVZn?=
 =?us-ascii?Q?//KvmvoMboQXFMOedUbOT8tbjDPtNN3bvQTSUmB19YsHyPqplK4I8Bsy+OIq?=
 =?us-ascii?Q?aMKN0C4AFGOjtkMi/4DE4SIWFpaIMKTfxaLv6pUPdwYH/thKeLjq5a+Do1+X?=
 =?us-ascii?Q?an08Wd0uBdFR9NzRXKkhU9qhob32Avp56cy0Pk6ozCIWooXTENXyp/yAouME?=
 =?us-ascii?Q?0uSX1AnD3hSFq3VQzoAVjND/b8tKBMRzjnfvvrU5lfZ9kYk7GRjnmc1wNQo0?=
 =?us-ascii?Q?GocvZVtxVuYl5TFUsNki0G7etoRTS2GNRya0Dk0FnDjpdjkrdKUCye9wJ4Ke?=
 =?us-ascii?Q?U07tZ+VtaohJv8Blan1fkNUFdsSEtL3C0VrN7Jae/ChxVaB6rcGRayhB3OGm?=
 =?us-ascii?Q?d56dltHEsy7gDbQt4lu4fIqH7bXrAJpC55pyA8BHShgNTCZMKKT5CcRNuX8D?=
 =?us-ascii?Q?REVeDK6SBjPpPMlkTER71rw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8455b8f5-679e-47a0-6f36-08de0ad8ec10
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:19:52.4105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 77pfw6R7LpPlRc/46kAzoLC3OlcQZ6CL6kXdSm5DigfnD63k5VdmRrqLRgQgoODMoruVhYRXDIlFYFGp2o7UsLXyAGh3hH8CMQt+O95/ropOm+EAMDJZWGS04eu211Cs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13923

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
 sound/soc/codecs/ak4619.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/ak4619.c b/sound/soc/codecs/ak4619.c
index 8f2442482f725..daf6e15b70773 100644
--- a/sound/soc/codecs/ak4619.c
+++ b/sound/soc/codecs/ak4619.c
@@ -257,7 +257,7 @@ static void ak4619_set_deemph(struct snd_soc_component *component)
 static int ak4619_put_deemph(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct ak4619_priv *ak4619 = snd_soc_component_get_drvdata(component);
 	int deemph_en = ucontrol->value.integer.value[0];
 	int ret = 0;
@@ -282,7 +282,7 @@ static int ak4619_put_deemph(struct snd_kcontrol *kcontrol,
 static int ak4619_get_deemph(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct ak4619_priv *ak4619 = snd_soc_component_get_drvdata(component);
 
 	ucontrol->value.integer.value[0] = ak4619->deemph_en;
-- 
2.43.0

