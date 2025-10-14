Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010066.outbound.protection.outlook.com [52.101.229.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4BF12288C6
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415727; cv=fail; b=TvORE0r1FHx8fx6bq1vsL8YFGaTovifc/CS4hqx9lcrS5wEClXSTVvOcKCQxk/y7ndcjdhZz63XcAO26Byv4K/5RD8njCEz75SnOjmWXTZZRwGto7Cq3Ru1Qb1lU3DeHHKk7e1qI8skoLMl+BjJsE7H8ryA3AOW2GiFdz04q7HA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415727; c=relaxed/simple;
	bh=RrxvlswO+T9QQyPatsA+tidPuoeUBDQhUWwbCGCjIg4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Lad7QNNExwrIjBDxL7aV0BiOwSP6/kjl7qSttnUY4JLUs9HKkNB+3yiG5YKXmxL+ZnHE54tuuFam5bzbIpczEc1v+UBnYFeJbXs9I2GFL2CbhHjiz7XzMp4+PQclmyWLWjx8gdrde1zhZMPb/p6FJNQJMENnGiRTiIPGBKGuLFo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=XS1eGW9t; arc=fail smtp.client-ip=52.101.229.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="XS1eGW9t"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iCgxDsr5hX1e47p3vpyyKna86VmlKUUoCS3BpDCWrvd6EzYx5wUwCnis9qkxkXmit+sSxubnZFfEJxv8vKB2bSjbWiqNV+HkmWS8BlRbexcxB1Z+iPoYpHfJYvoo3wfYU/lI35Ui6A+tb4ctskWzFbYp0w4tWPLSkxlt6Pb9vFFbkQCg9H6eh5YF26/litnap0d1fHPCspyQupHeUAene5dY6gsOYm2aGjNX1+l/8EHeRalQZah7JBnLHwJfyZRthyYbuWLvJpVf9ThGusMVxzmho3LYnSL9YiLpwKn2Dyw+gU9UCpMI2NA7Sc2CQGLw3V9N8vpIs756pCtxAj1Zvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e1dLuhLRpfKg9s0Qw5vyoihWr31ir6MRmtFBZqfYldk=;
 b=O39z8dDH8TeymxGLAQaIMuyaVv14zVOz9hyiO95nvR1JjYn19cdQFop4LI+LQ/WYcLKJ32yCbG3O7QC22GAOEPzQoxFokGSMj1T+4vlRJqOi4o9q8do4vjR1irCF3W6EC1w5yePHEN1UNlstcXFT5RzQo5H04OfmHnkJzl/XKTjukJodrkfMGijRuONFEmNU2Tu1Au7hQluFTXt8Dt9GoRUinb19QyOy2QxBUnIVZUM/gJ0chumUr5kgYXsPLBSZDYxUD2CPA/30Gi0RQREiDizA/Ghh1rOz5etw1VDSlqceUt2NYyf18+fWCjVypAzEU2E0vELG7EamtjmCvXJiNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e1dLuhLRpfKg9s0Qw5vyoihWr31ir6MRmtFBZqfYldk=;
 b=XS1eGW9t6yGlOS7kgzwl/rcTT/aIfaqJJYUCPTdaT7qvkiuRTzBEWL1SeNyYJvDdCYvm5s8Z56qMDoHfSpbMxgabDfiarUkwrKAbT9p7F8nvyYdAy+Jmy+7tS1clAVpsntCUiSURVg1fuufTM/jPKIKuvFfA6TeZmhCqXa0OvI8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB12366.jpnprd01.prod.outlook.com
 (2603:1096:405:100::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:22:03 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:22:02 +0000
Message-ID: <878qheru39.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 041/139] ASoC: codecs: lpass-tx-macro: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:22:02 +0000
X-ClientProxiedBy: TY4P286CA0055.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36e::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB12366:EE_
X-MS-Office365-Filtering-Correlation-Id: c1854342-9c22-4f27-1979-08de0ad939d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8Mlsc/UPATv6xxMdho2z6y7tmLh0xh0BmRWmeKtfDAwm6xGNMDQuqJND5M3g?=
 =?us-ascii?Q?PCHOPQNu5t2zy2RSPqCszQyesDInhKbAQK+htT2f28wfDzG7r1rtaNtK4wg7?=
 =?us-ascii?Q?mEiDZ9KOXtvo/qeKCAKTkKIP9y4anddvpjZPtm8SqKKzAfXZ69j0kiutgFnY?=
 =?us-ascii?Q?mWF667pI+dWS50HxmAWsO8QaAn/oUt43YX+grtQyoxRX7VEiE+oTBQBAN2Ou?=
 =?us-ascii?Q?bSkWleSXpGN+XxW0Xtxvgvo1EwADc+A1V0l0zTTK5+zDm4+byBdFtG6VXs31?=
 =?us-ascii?Q?6GvsfVffebRyvE4HmRl+1vO7dVeKQG5TsX9kkyY8MiP4a+xBWuA7wmmhpqgT?=
 =?us-ascii?Q?asaZMNH4Ni7EC390zrsBbMwAJQiWaniNe40ySF9g/PFw8YL9XqJ5B3vZdLxT?=
 =?us-ascii?Q?+GCZLv701uAKv5zbNvBhoOaLb0m2Ee7cQ1ewpbrF7I5VDleLdm11UHvv5IwN?=
 =?us-ascii?Q?4CPxHEVJOR+7U45mEIt/45VgxpF8J63aKRb8QRA6fREobQf4DNl/RS+WtLAp?=
 =?us-ascii?Q?vqqOSNRY1SB0tHbatSMwJJJco20Xfr6hMsttE4z0ANoYHST1qExPBmN9k5AG?=
 =?us-ascii?Q?Aw/PVfPSoSZmNmE1ijgkdpLVJaKL6gFEFA2m6Wgm/XJmumBwoe70W8oX4SNo?=
 =?us-ascii?Q?AGtLHJcIdzSDjYSwUePfRhgZ0Y0ye3rH/svg9jzqBOqLFbQ0xkm2nyYqvWT3?=
 =?us-ascii?Q?MsgImxc8gFFzSL43OgLlA3TbRO08xIefxAgem1niez90oH7duSQEqP9lSHl0?=
 =?us-ascii?Q?38QhNJ5StMng806kVv5ONNr5KXTMeZ4yfGUBY9/YJzI2a/0NKUz+St3KruCv?=
 =?us-ascii?Q?IFcDIFR3Vmj9VwLeI2POP4cXKG5WDsVYkMpk6QSR4lNuZ5Q+xuPW7DGKorBB?=
 =?us-ascii?Q?sTn6A5KLLG+1xcsiYlz7ceoXRIWX5mC/ze31clITDZc/imx5W9JpzPZF73ye?=
 =?us-ascii?Q?W3Oq7OMA44oHKB1N2rh8SmI1XvOpPEG8K36i80oeFy2aTtV+BiVqftjX4XzS?=
 =?us-ascii?Q?Oi4PD+iDGxI7AO7NhI7pslxC8wCnfd+mYj3cySNEf31TwjeIGihZOq9hOQKa?=
 =?us-ascii?Q?Ssya9jTl89NMB2RHPYeViHhp7uPbkHkY5t3ynvs7u/OiQpAhK9shG2qr18E6?=
 =?us-ascii?Q?gl7lFqWZnvjOxYTf6jlUds3ZK0lC0O1eItgfAEFRilFjG5aPXY02dgWnHaaz?=
 =?us-ascii?Q?Fvsyh2Ta1LpOthumTt8R8DX6se+F97b/maRTat1r2zYXbTfa86CrV4cFLIvf?=
 =?us-ascii?Q?E2MWo1WZMD81rNBbPtEGquFwCJJJ567GyqPBRt7UYii1Nf0QgfCC4EIxA91e?=
 =?us-ascii?Q?cCshMSktlgZONjXDFx2UB7ks+8oLp72GZr5S9ZtLtEgTJz5W1klbG+Xyy2yW?=
 =?us-ascii?Q?e884hLQZEAE25ShF3Gn+AuiNRujBBQk9zkWvdEZM5iLFMEI5fYxZER9UBZga?=
 =?us-ascii?Q?Ye0yDcfRZFqcbpVX0Orl5NRJegVW8WluQnXp6xTueT0Cus8WdQeBf2sd8dWJ?=
 =?us-ascii?Q?9FnAuSgu+CZWHsnZCqJ3N/tzr/2N+5WhaVlz?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2VyvllODMd4lQtQVdxFG5XvPUGGzVCWhbNvAWjS5gZRdJNIPlNHdsVox1J6F?=
 =?us-ascii?Q?/ffTi2BZI5ce5ijqDkJwYV10tUrONFgP0yCZhxn21TQvRmQCmgYZut8V6awL?=
 =?us-ascii?Q?WkpH02e60sJqlXiUA3MWJBo767GS8HJXPtmMrAKuNLb7Xp9v4tJHpUmGFVR1?=
 =?us-ascii?Q?4vHXEJWI4w+6QBPBrWTFM3XylqjT7BKrf6FF1z0EVBluo4ZhYnhtavdoeSEn?=
 =?us-ascii?Q?fn7HquGd0gnHp3jIMZR4WV7qQPTAP7GTMzDCxpM4Rj2G1OLUPD5Yil3eVLsw?=
 =?us-ascii?Q?zBlrq0PhRxaBVzQZyEfyszobBVqO/ipyI/vxiSeA9v+jPl/e3WUxVRADtYya?=
 =?us-ascii?Q?ux9LqKq28XN0XU70Zjkk7MXMI2OZWiFFI+TKw73h7/uGr3Pcv8tuj5I2xaU6?=
 =?us-ascii?Q?tfNIxEFY440JRF9hjaHsJjHIvJ0bq3xEFBkbJgf8VtvHgbo7nf/sdhnyhCmO?=
 =?us-ascii?Q?xpudXngCrI5MQcEc/fBwVTv0QLF3lghM3dhGOFY92rk1LksYA4tiXLeFDSdR?=
 =?us-ascii?Q?sgb+3jxnqM1gGX1SNoWd5FpTraBG2ISq+X8N8wvgCKVFEFQtOPZelIm9MeFB?=
 =?us-ascii?Q?f+Yh4GlNZmVVdgoJ1Wap3mdav9SE9kliVfxvZmjOMbuH3Q8ZWs17b0C5ovx7?=
 =?us-ascii?Q?RGcfP9WBBO/0DbcMjf8CKn1EJWkM5PegzzEEdNRCIFp3g3hivdKqAtZ91DoL?=
 =?us-ascii?Q?CDn6h6dcZ4Qwhounqe9p077MMTWK3ZKbxnaxv9kHHe5E8OE2c2noYNB8OWyw?=
 =?us-ascii?Q?mUyuB//tSp0WduGuAFzekRfZ4W1HCH0J95DhQt7T0hdLVeLEZVkoZHQR6s70?=
 =?us-ascii?Q?wyzDJx6cCdTeasbfyfpjqhQMFNX83ZfXqrzEgBkfmgQIRDQW2xPSzPrJkA7E?=
 =?us-ascii?Q?NFcCkjYQTvVLLOzqbPTr0rE7L5TSTndrIKZ4pnUl7JtQN9hl6T1hIc4+gELU?=
 =?us-ascii?Q?KK49IpaSK3Cbhu2M/R7tjppWXlU8amGC1XrgMXwQVRGMKOtiCJRD7IyaShgs?=
 =?us-ascii?Q?+0uIk5g1hHJtnRV9VtpyESXu/PKVwVSOSMO85DVLWSwAql4DKcC1vN1oT/GL?=
 =?us-ascii?Q?kxAom4F1BQVuqfnun/HE3rilzIKx+wkTL2zNAmMlcAyoDyRxrXaOARb2sOIs?=
 =?us-ascii?Q?lRHH/HjBOW8n6cylL6Gd2ufHIIQorAW3a07UT3YnROcZHF3EJ9AD67tgGcJu?=
 =?us-ascii?Q?dYs+wKP7lxpFOWoHOzNJGszD6f8MTDSN0uSDpXHe+YjlPLdAN96cq4+64PXU?=
 =?us-ascii?Q?y4IToWgTbinBLMqB8LOO3JUfSjAV6tOQdWxjZfnNlXdCVISIK3p/xAKZkER8?=
 =?us-ascii?Q?XsAZV6qtyikRvZgSE4LPaVM8hDa57WDnfQoLN9mAt/wswFF+AXKmNeyTgMfo?=
 =?us-ascii?Q?H0jKKAJ/C90TUf2rhyHZTRaUqP7/GP9fLCEG97Pho5ooINoRZ0/dajQVgO+l?=
 =?us-ascii?Q?tqIQccTArvmQEPkj1bm9d7uG9Nbbd1QYnhjh+UUN8Vi+pFJ3idzjNjYijWtO?=
 =?us-ascii?Q?dQer+P6HxiNs5kLut/IqJqyR9FLW+1U+EenJs55+6NTNrhtD7shzCBG4UfB4?=
 =?us-ascii?Q?4oPstku6iod5T59suom4ZGhP6WOz3UXXVSw/j32HqPWrrEiHIMJrc9eYxzTt?=
 =?us-ascii?Q?NJLwcxByE96q91CMsiGAi08=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1854342-9c22-4f27-1979-08de0ad939d1
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:22:02.9096
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RouXOZ7EWPmvNodF2Cedl4fyLOUVsg10PQyoUfWpZgd8Ie/xhM2M2KHBYE1ahtxL2XrAa4Y3097SjfRuWHYPFaL4zGLBicpsieiaAonlADdNL3P5xJEATBdtbF8vntjY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12366

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
 sound/soc/codecs/lpass-tx-macro.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index 1da34cb3505f3..1aefd3bde8183 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -1070,7 +1070,7 @@ static int tx_macro_enable_dec(struct snd_soc_dapm_widget *w,
 static int tx_macro_dec_mode_get(struct snd_kcontrol *kcontrol,
 				 struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct tx_macro *tx = snd_soc_component_get_drvdata(component);
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	int path = e->shift_l;
@@ -1083,7 +1083,7 @@ static int tx_macro_dec_mode_get(struct snd_kcontrol *kcontrol,
 static int tx_macro_dec_mode_put(struct snd_kcontrol *kcontrol,
 				 struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	int value = ucontrol->value.integer.value[0];
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	int path = e->shift_l;
@@ -1100,7 +1100,7 @@ static int tx_macro_dec_mode_put(struct snd_kcontrol *kcontrol,
 static int tx_macro_get_bcs(struct snd_kcontrol *kcontrol,
 			    struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct tx_macro *tx = snd_soc_component_get_drvdata(component);
 
 	ucontrol->value.integer.value[0] = tx->bcs_enable;
@@ -1111,7 +1111,7 @@ static int tx_macro_get_bcs(struct snd_kcontrol *kcontrol,
 static int tx_macro_set_bcs(struct snd_kcontrol *kcontrol,
 			    struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	int value = ucontrol->value.integer.value[0];
 	struct tx_macro *tx = snd_soc_component_get_drvdata(component);
 
-- 
2.43.0

