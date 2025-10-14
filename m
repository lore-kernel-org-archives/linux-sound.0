Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011011.outbound.protection.outlook.com [52.101.125.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C21D1D0DEE
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415971; cv=fail; b=A8f6TjZZdnKmFqaEpXyHa1vVVw5MvpkwR6TKvrrpB6Rsm9ebW/yYhgF1dA/duHKvjvyEc2L9U7Bnk6DKyZkDlkZh/CsKMTppp02yl1Mn63dVFv/NRZXrcQci1AsTFrmI+ObUTx3roWa5HIR63FLjbRZ6nK60O+Ej+wOo1WU4UVs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415971; c=relaxed/simple;
	bh=8eOLrHBGg8V1Q94Q4KoSaR7NTZlYOmwEHjXKnMXeDwo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=XgyK8POv1FffuVjrcQB8Zvb33ohz8AxNyhvn3fIubojeMLU8sVMgEbI1wqgQXb0Bk1aJMjnY3qskyu1MzeaQM5eUIYmtzxBpbvhu3Auu38mdzGnlRlte5DtQ0mdvKFbEpcfk514Y2WNMw4QUn8eq5oQtcrPhpFp3ZdwLflbLwfI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=UNRxw28t; arc=fail smtp.client-ip=52.101.125.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="UNRxw28t"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qzLzTvjw/y7Cl9lv0S5soIaQAGij+Ws47Qb7aqtoJsw45NkiDhgaCDNfELIJoJ2JwHWQi+Ro5Mn/Kwb09YgWzUY0T/tbxZVA+F6CpWGp4UqOhKioOKuY63JDgXousky8H1b0C664AEmEqc4oiYLngXokGdD/bZ63Ko//xsdcnvB5zKQI/Ml/1Yuqm7dRj5fEryvKH/Yo9o6XDGhRoHF/OU4dTE5Xa6y8WmolR4MtJxwMzZBUiJMOwTYZVIg726JwpAHafd8RpDaIct4PWDoKzX0ZVzjclkKbFdMx62FLI1c7YxQ2ZxWMx1d0LjKt9JXP2lGlGnyNDCiBnW7q1ocpow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hz4RxPtZvLauccS16AUE7Gn7ScXOlOlSRednthnS3ns=;
 b=O4XXVnaqUOXw8tx1yaAC52ue/ekiOxVxNmk1r+7tFFV4ELmducY4oz+TucKSLlPKPdDryJZATjUVfrk7TbMi1nRuMEofHE9+WAA287mk+ugz4Upa1tT6f+jh/96i/wfc6NiYLELM11s1TNTzDhbYyRin62zQUGZIo2g7bZhpHuljj2LMjLkg44Lhqkt86voDqQdVxG4kfBPQltoQjijQhQ9ajFodNcIbx3Y9qvGOZ/l/DZF5w9hmAoe4dEWrkXfVytDSlS6gVrjT5J20j4s7Kl/MWmAra28yKpk24KKC8fR2e2UUG4vHwQuKX5qtTrBSXKG2SziDBCpiGOGZSH7Pgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hz4RxPtZvLauccS16AUE7Gn7ScXOlOlSRednthnS3ns=;
 b=UNRxw28tNXxtGuqS9tLObAfulqHeweom1g842aGGT4GapzggK0QsEQUds3s8AMxlP+Xga4LnSR8OxhAhQwXOlK9MZ+tAKQlGMu3JOXeiRiTJso+3OqzRZyNiNvLvr+54vVE7Syd+DLrM02KP2n910CghRCbNV7CIoSqTfuaoluI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB9955.jpnprd01.prod.outlook.com
 (2603:1096:400:1e3::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:26:06 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:26:06 +0000
Message-ID: <87ms5unm76.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 106/139] ASoC: codecs: wm8731: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:26:06 +0000
X-ClientProxiedBy: TYCP286CA0013.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB9955:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a01deb6-47d9-41eb-f00a-08de0ad9cae2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MuYB8xWsnSwU4l4LnqxfWy0KsgNHue11+avBx0tCrr0iww1Nodfmxc/PqrgU?=
 =?us-ascii?Q?0QYyS3jBYMcHfa9EWu7ZmcIMOMs89ESVZx91mxUh3bUsyadJ9cfN8oAB60jQ?=
 =?us-ascii?Q?jMMcvecAKQcj7D2s3rW5/lFIqlrs6K1/Nuc7+IH5L3IjTPJZC5b6LLnaIRU7?=
 =?us-ascii?Q?eoBOao8VNlI7jh5/hkMXo/iphFk/ioA9hCy6lDQaweg58NIsd5lF9nF8z77x?=
 =?us-ascii?Q?IRwtc/vzcxU79e3TECfbPbWBOgabgqyg2h6qQdo/UfOns0gJVjMVes1Wqrml?=
 =?us-ascii?Q?ypWukBA6Bmzyc0OhbEiOIWTnI26effy1ag/lAnc7qlhFJF3+vuk+d4jVssD3?=
 =?us-ascii?Q?kl8R3CFvBjbAcZy8F6Au4Mh7+l1MF3y0DJXDT89lt7WmIxWxYHPWbhSouCFS?=
 =?us-ascii?Q?RCwwCsMkLs1da1+FYPp6+u8Q6l9ykc45Gg83il68oRKxXLsQGaCmFeYqc9Hv?=
 =?us-ascii?Q?asmcK8fVpztiLtsJCgIUEl37b1l2wogezSVMTdVYPZUSIYrksjWKcquqWTKF?=
 =?us-ascii?Q?WfHTlq2Qjaeqj5bD40pYQ4PyPbTQxi7p5rruv/OjDBJqDMjdOK/YJUlpKkXZ?=
 =?us-ascii?Q?tSflkFrc/9+VmB8WaR65gf7SYCMs8PrRpzu5LwovQTaZreiTB3nV9zD5rQ/Y?=
 =?us-ascii?Q?+BjFVzKxc6OtI4x/LnnTahhOQITKxVq12y1hWbQdcWxKc8yXUJ/sCVwpKqZW?=
 =?us-ascii?Q?D+2pr5iS3VWyuyqWr6lQab5AlTtDsYaS/vq1RBiP0ptFGUW9wSpEZAawu38T?=
 =?us-ascii?Q?mbN19RxpzFfc389W7gKpdjCtIZcLZ2iSiTkpyr7fR/mqYlewLRwmqQWcK/vg?=
 =?us-ascii?Q?l8/hq23zrmepJ7jgWAAHkmvwJ3k7jEGXcvU2dwDuyRyszUeVGX7mflMWWV6L?=
 =?us-ascii?Q?JZZcQKPAAPUSky5eNwxlejmfCp79NWW4Ur2+/jwGiD1RhNRYygRp8ufF5A/X?=
 =?us-ascii?Q?RbMDbjJJOl9JtIG5Ikf7IdZMVU1hmM+k1sqV6PSrsUEkCDul1pzKtlfXM66X?=
 =?us-ascii?Q?A+syPxO/UGb9JGDMKvcYvTF718oscBNwdUAEOI9Xkvc5fNimDMAP2ZNFJqJ4?=
 =?us-ascii?Q?uiT5qoEgsxmznNEFHEPB1X24KtTnG4m17xGjwyRU3oNwK5cw5IObG/xyi5xe?=
 =?us-ascii?Q?mwptJVh1ZuewdTvrb8i8d5zNFldj6/htY7+UK1/U/wNXNWAw300Mk1PXRsdZ?=
 =?us-ascii?Q?t9CJUyy98mNMsxReToLzWiJvaWnwRJizVJwSsWmKxMpEKVA5mfXZNl5fg0Yz?=
 =?us-ascii?Q?Yb+RQ8UTA0V9fcY1szAb5oCVvxGtz07gsznOFL4L0hyThJ7NvSFOp/7EyXeE?=
 =?us-ascii?Q?GUr+MUQdZaRGtIACwKgcJCzhn+LTashpahoXt2xADkGp23C+eqgUsZOySbYl?=
 =?us-ascii?Q?z0Fp5LOGA9D3ILEMGvqaWxztqNHncmnpdNv9kehCgoNg12k0pNkDrGqu1B9Q?=
 =?us-ascii?Q?Zx5RxDijWcHxftbvsqpqN7aKNaHSxHWDMgEVagS04z3aA0TnyWk7ao6mawkU?=
 =?us-ascii?Q?RK8mQAe0/yQA21N3p11+9ZxiE0zh84NsUA40?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ivbwC6rHcF08/tJfmxThbx/+1nWwWSb+PxSX+8C4WB2hisSrK8DPc48fb6H6?=
 =?us-ascii?Q?xu/QXAwHG6mN+Gxs7mCRrcOMGMs+hL4ZFQQNBTWseqWa+aWyrUeHzHh/83b7?=
 =?us-ascii?Q?fN/2E91cpdCRzKt6Z8P050ibMAugo4MAlQpoHGw1FCsDZ1LPBkCPjleLpRX8?=
 =?us-ascii?Q?Qs5cV9lu57DaelFqlUBF9FW+P4jUvgXK6iP+ffbgjaOglnfy0rWSGc4Y70fx?=
 =?us-ascii?Q?9uC1z9dHMzJD0KmviiaUlntI+a5l4MskvLj5mYB8Bar4ygYsOE+HMIeDSBrM?=
 =?us-ascii?Q?1uxpXMCaSOyCfEIAqhtOJ2tKsXulVPkm8NExCjFiDGndTHECDD/KXo5MSQq/?=
 =?us-ascii?Q?9JSoLHEwkpyo2+CizY/kVfAP3hLMf3HYEMK5BYPTPJnR0ovR9Qs+HqhzVgke?=
 =?us-ascii?Q?rftqOaiYlc83M7NKQybYqp3DX/pJpoQURIkj7O9jbeLjV1L4TaRcXHtG8R90?=
 =?us-ascii?Q?W9XeeAvEni9dDNGvrhtOGi3e4XXWqxnrOPvKm2lfbcaTYkQ/YehPhwY8PMUY?=
 =?us-ascii?Q?OmUXlNNtdzHh6htV9ZhVeieFf4eedAhHKVuwZ/2rkIIeILE6s/JEPsR9X6O7?=
 =?us-ascii?Q?IefQtuG1M+XMTv00KhQ+f0YL6VNPHoPhYXsoNXQClOEBUtfLuiRvbp1To/78?=
 =?us-ascii?Q?9NkIRKybZTl/vGHSLks2nxYfzJ1aBEbMRk4sqpsgA8Qc7Ih4Qaf2O6Ell6Fo?=
 =?us-ascii?Q?c+v1LJ1IHv/3Bt4PCxzw5VsIWfF7JjibQmZ2Icv5OVBuJywfeKaCEKzxBm85?=
 =?us-ascii?Q?/hAFW1o6kRebfmXCc9UAQgj/wagK4YtuBnXeOIyJieaqMkwiE1NIyvAspH3T?=
 =?us-ascii?Q?E/5TMh4TIgm79aiq8Fob5Gc90mk/iYdKbNlCi63MAVgKxQelF/OOWXzyWElE?=
 =?us-ascii?Q?WXfUkPwUfQYDbHB8I+72O+bGRjDuPHFPCLwFA7N4yB4hpt7bhTg0b/qjkQKP?=
 =?us-ascii?Q?a0qLUAP7Eu3IxDNQbFqcs2wjlelMNJ5GYOyX3e5kvOY+zwCSBbelJSy3txUS?=
 =?us-ascii?Q?0Qvr93Vkcw8SXwN6dcONgpAvNKbpVSBPOh3AeSSIQt8FQv1ArbojVcXAMut5?=
 =?us-ascii?Q?Q/Voua9OmU1gIMjYSMmw0UI6f44tvfr+x6rujP0pjDwSv2FQLdek76ktvhiK?=
 =?us-ascii?Q?7ne2DtRYYyn3+XzS8nnE9xdEMvH82x44bfocs22sFB6YtKwcDimLcTnal2g1?=
 =?us-ascii?Q?pbHPF6VDZ67nx6/yQy6aGP/oQMa/Yi6QurDQccLgtGszMwJtWelkqksUuFXS?=
 =?us-ascii?Q?s17fBmnjEZRxB8K+OexyKsH/Zdqh9CB1SX2d4efvbHOSVpbUqKdC2XMvZZgP?=
 =?us-ascii?Q?8Pw9lVhH5skQ1r4kNuEByij4QPHrTpWybYECe+oPHMLb9GSk5H4bkw8gjJQv?=
 =?us-ascii?Q?9tWVJrYq08sZ7eTjKkx8fQjrmJSD5wpvl0Rfdr4Ehj4bc538qNAgMIu8Lf+g?=
 =?us-ascii?Q?kAS9jT+o2WlfGgmpxrdZTBe63haInIlflH82agy5qsGdBg9EHwjm08letu2N?=
 =?us-ascii?Q?uoHsTcb0/+dQ8DAOQPf0oazgXQcKp0MiOkAoAmxiZrqFmUfn1rM5TJ4hXNb1?=
 =?us-ascii?Q?sh3x1SgJtIDo+k3Kz/cc71RuWhtjWbO8dfn6rnuxOLAacl07iSjmVaS2wIQ4?=
 =?us-ascii?Q?yWXm2IjP8WCE+etDAzLdSfs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a01deb6-47d9-41eb-f00a-08de0ad9cae2
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:26:06.2365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jwZzTSc3xgbmrqv5QomukEsOaAyqu811GNZp2dbKEs15IUvlmt3ZotZs0ToAcO5BTT7LUKjM5FSvwXwDv24b1U84JYJOtSihi6MEELn3r5ddQKK+sNBKQxkaGbOvXltH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9955

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
 sound/soc/codecs/wm8731.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8731.c b/sound/soc/codecs/wm8731.c
index efc160c75f404..0318dac1e5048 100644
--- a/sound/soc/codecs/wm8731.c
+++ b/sound/soc/codecs/wm8731.c
@@ -96,7 +96,7 @@ static int wm8731_set_deemph(struct snd_soc_component *component)
 static int wm8731_get_deemph(struct snd_kcontrol *kcontrol,
 			     struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wm8731_priv *wm8731 = snd_soc_component_get_drvdata(component);
 
 	ucontrol->value.integer.value[0] = wm8731->deemph;
@@ -107,7 +107,7 @@ static int wm8731_get_deemph(struct snd_kcontrol *kcontrol,
 static int wm8731_put_deemph(struct snd_kcontrol *kcontrol,
 			     struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wm8731_priv *wm8731 = snd_soc_component_get_drvdata(component);
 	unsigned int deemph = ucontrol->value.integer.value[0];
 	int ret = 0;
-- 
2.43.0

