Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010021.outbound.protection.outlook.com [52.101.229.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55CB155326
	for <linux-sound@vger.kernel.org>; Thu, 25 Sep 2025 05:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758777459; cv=fail; b=Pdn3D+CxWm4wA9W5czog7O0fl9vZVt9bVyRBeM9ZiQBWuTVwF22DzBSAsaVkCZLf/r0BcyXLqTpNXtLn3mmHz2Ejy97vbnZLBvt39Ug+O0bTv2q4YknJ40x9/zwF97BAqZbK7QJVWCp9xDaDXmjwHo4QdHNyr650WJAd0PXuxEg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758777459; c=relaxed/simple;
	bh=hA76e55iIQ6lYAjpeySjyE58C85PFtaxqBweZXeuonE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=B/EB6xo+lhxcyspkb6XIyRdyWHzU5yTmfZigto1KgITY+gOXZqYOhEBvX3I01MeHZEJcQxM5dEarIa0NQsOAXdDhVqOaP0p4vQzeuHivjLbodXHM4Kus6iJWiutL5s1Qvx4rzbc5HL/9iskyht7Fclvalf7g16zZFdml5Av8KgY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=m/gkOqpN; arc=fail smtp.client-ip=52.101.229.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="m/gkOqpN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RGY0jfhC2DC2L9lMjdgidid0cnT/hvn3eAOeQvYghYw4hwrVnXwNznVzIHfnqNCKDljBaEbKCe3olTmea8NgWlKtHvBTnpjbVrtCWIvURO+HUm3+sMmNaJSdJbCv4uwJzgMWKa4MIQR4BMJ0SGX9MymcyzQQZssYAej20xagZUeV0yAFBaolX1koGckDK6NHzlQ8ZVZ7L10MRZks9k2z7Gm0Nr+4V4qHSoeF4E5dQNaivFrqw1AgD+G4kExy9BeKTWbfmpfhP7QbDigCUbEIYMVnl+SuNhnH8q+DHaHYcPsDV6DOREJmckAu2ZYRAOfneUIR9m7r1+k4XnRpRPMCsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Je6SUuHct09QTlCoiw0K/x8W6EbgkiM6uYhK7sQ488=;
 b=t295O12FuHxkHQZyjw+RF/bm0GNjzf9J4M3fk1bjnCymmfTu1p0k+1dtWO/FnNYUsqQHSEkck+tx0+eSrrLfzbL8SfwNcs4eAOgNitS0qfiu3XPvIrXodhQXGqkgQTw2UcjT/0z7+U5XnXFuhgjT7CsJdXamCH0kUd7zJiB0YK+oYD/FX2+exRqLUoXNEFch34ht0ZtJGz8eh7t2GIhNWzqUtBo4UBtvestIgu3iYT6VurO0F6GJ4jTGxteUgKL9FM6xS8N74zKhT++BmO5Yp+bWxJl9jywT2ASmf+y5eQjaBXd+MGJjROHtz/bg8FfiGEZFmntZ1+tuuCNv+NQ9nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Je6SUuHct09QTlCoiw0K/x8W6EbgkiM6uYhK7sQ488=;
 b=m/gkOqpNsT2b2o2181+YBFcRdesZJkWvNPLhsYmw2d3ivgf3Ga3FZoAgyBy7hu4qBHji72XHJ/JPcM6UEMx3hFiOkfhsjS3nbMerw+qh4szUjCL9IEl2oYWzweNpAEd2k4Z/caIYoZL5du354R/em8lF6cVI1mHEV8Ry4J9uQxg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB15474.jpnprd01.prod.outlook.com
 (2603:1096:405:274::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Thu, 25 Sep
 2025 05:17:35 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 05:17:34 +0000
Message-ID: <877bxnyutt.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 6/8] ASoC: renesas: msiof: setup both (Playback/Capture) in the same time
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frcbyuv4.wl-kuninori.morimoto.gx@renesas.com>
References: <87frcbyuv4.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 25 Sep 2025 05:17:34 +0000
X-ClientProxiedBy: TYCP286CA0160.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB15474:EE_
X-MS-Office365-Filtering-Correlation-Id: 84fbadcd-7201-40e6-b037-08ddfbf2d5cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/+cEoUQ6aI+pyeIjbSLw7wYJ4G/bihSd1M9+sfI7gWxQO/8jtl9gR90JHyEg?=
 =?us-ascii?Q?m9JEhwvd6RK9/f0+mzUW9OuhTHo3nWh0jPFlIovcxTTwZn3ixUTx4MUJndqw?=
 =?us-ascii?Q?ih26O/sYEeWeANrTv/uG74apRhInBR1D3VObNbJQU6gSVNad0PcEpDll4yOm?=
 =?us-ascii?Q?sIa2Z5vQeyZC0YlQJAZuuwXp/iBiR68HNuC+7qCmb8d6FhJW7eOHhplSoeBd?=
 =?us-ascii?Q?6rgluvMnGnyD6q75tE+egt3c4YgJdfMB/Srel3eYeDfOyJ28+e0wRBOOkTep?=
 =?us-ascii?Q?0C6Yyp5cRc2x5xDxoKXphzfLGzQVjP6zveTSZfurgWoJVmj1wd+mY8VOvWFN?=
 =?us-ascii?Q?EKAwo0d0rUnecsFmRnpey1F3t13FSqVT2jQF5mFGzHTJMjcn8rbaevSPkoOo?=
 =?us-ascii?Q?usYYRelKi0c/vULgdLlupq/zqw+JKGwAijz/cDdfZvtcWk7j0hRpxDW5ZQBX?=
 =?us-ascii?Q?CI4t4CzEgBoCLxeuhrHr7kdv9AJvVmv//2a2bZCEZ9G+CYKyHz+41/HdW7pO?=
 =?us-ascii?Q?N7oYptPrlkj+4Cgph7kTzFcR0o0D/RPLXTIDi/WLp8vHdaLKcKOxSTSU273I?=
 =?us-ascii?Q?ixeE//jXmww1L8G2ZbfivKjBHFWt8XqsB/72dkvB0ZlSpFQ0nVuooPk+x6gG?=
 =?us-ascii?Q?UKTgcIsxTmEWe8+q17kFjkobhpUP9XpaxHOfxZvrctIFVnTmLHMYjUUuCVq9?=
 =?us-ascii?Q?HAsKta71VJWW7XB6MpefgKOEK15BwSjTfWhZVePYdxG+KNeCQ5Pya1tys6uL?=
 =?us-ascii?Q?O+pk8j8noh78jMlc2ac9issr53iLCqNx8UI84IZ5HHAHDH5gMuFHC53s350b?=
 =?us-ascii?Q?VJqgjCeCwnJMAEveX4Azi+pT8HuqtWNA+9vGkFihGflfhNXmXBW/GOenX8Nk?=
 =?us-ascii?Q?idXDWpeBSt2oQaDQ4sd0C+8/pRUfPDqMZAXu/Vqfifc/QGgaqyYsIAMpc4ra?=
 =?us-ascii?Q?Br97ZRGHC5Y92O3nkEgNwrHg4rEJDrseO2uh74WWnIYue7+VNBZRzdzT/OMj?=
 =?us-ascii?Q?U9WLYdKRxltMdA73gVyqrsQJC/odX4+srG18ZzH31rADZxLkv0nSJr7rj+rZ?=
 =?us-ascii?Q?3u0nh1OV9d3rMas+diXtN/kSTNcZyKChnJ91p65/JuGc2IAiJrBdGisLeCS9?=
 =?us-ascii?Q?FYqRVH1gr/3R6oVbQ2gLkt4L71ZgylLpSO0rskXlqboJBbstBDOmAgAWyEzm?=
 =?us-ascii?Q?ePU+J33UcOC42IHdEOGe+/CKt/llehD0B9m9GpNuXHf7GbsmgcebOEwjr54a?=
 =?us-ascii?Q?xgYWoJC+AO9S7P+NekW5D8BHuu0MftoXYJPS7aU3gUJOIMoUWFMGV2uLboKG?=
 =?us-ascii?Q?HT/feoEMsOR9abELXvsdnXKq6pJB+VpLnISIGCz1DXX20vnoBgyqrU0G6p+2?=
 =?us-ascii?Q?/grsLIdprpnRd+strNa1k++Zeu+xLIyurwMuaK4iW+3U/te+u4sVzf7MW38P?=
 =?us-ascii?Q?nOP7TSiy3g8WYaPyVl7xQOWShFlWNGFXuWohA5/gSHE4tPctGYhiKx1tK/Fe?=
 =?us-ascii?Q?jJd1+mtDEqgrjeI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?t2OXjPGSgdw0PKE6UppD1Y9QggFPI1EgYwQLR082+DhBcq4n3iLTAsouxFFt?=
 =?us-ascii?Q?A/6se9lMywFXwqd/c/+fyObVcw5B3oIyfqus9PS34oRGIqnHS/OPrcJcizgC?=
 =?us-ascii?Q?Gyx2bInVWVmKapb9KAO5OzOpXlNlRrfRCyju7DGklefuyGzlDZ2UFYh0s1sh?=
 =?us-ascii?Q?zngnV/8w4wkCbkvBxCB7UUL7wtd2v1Cbq1PAO4f9j/tbQe/Lv2CT8sVOVGIJ?=
 =?us-ascii?Q?L2oeplJbpnK3UG2XMu1qNj4r1J8B+UQe936OH8+tiGxgIO18HKLYGzAFOUfW?=
 =?us-ascii?Q?Kqm8caXDm6ku428pGQw6XKTLnDaCgHeA0uYabmBLpj68ecEDvIfyukABQGB2?=
 =?us-ascii?Q?NJrzNLnPLRZhwFQ8l0ulVdXzXcU87vsW2v7Nof6Mn1gZBD8yDqPuO97fsoQM?=
 =?us-ascii?Q?u9gEwUduLL9Wrfd07k76bvnFhgcx+U1wfzP8QjE9Llihcc0kAW8glRKetp/a?=
 =?us-ascii?Q?m0wKLcJnlMj6733KApBoY3kri8xbUI3shECJCtXcxoMpLYDRqbOG11dsb5fy?=
 =?us-ascii?Q?tq6PsjpId5yvqM56Y64B+xqKNpjj01UqDvRaISWNydGVIFu71ySlYQX5R7lG?=
 =?us-ascii?Q?NOpUqVsaeI+3ywXXr4DfHCZTCv91lk3xzuMNLXqgtgHM8XY2xir/BS7GMJUG?=
 =?us-ascii?Q?PetmEUUG4Q29GYHbETLTauZXYsUXzi7gdwNMjZdTkrm8KcfcQc1rrQNoLaPO?=
 =?us-ascii?Q?ogvMY6kYdZZgxkwl5cbxYVd90nca7w5bABOx/6EI74dHx9iO+uLbDyGDeXcu?=
 =?us-ascii?Q?QbQB1xWcdce9gFdtkjM3DHGJjB0OKsOChA34Mm8Jhv1OmT0A3pa3satfqMhL?=
 =?us-ascii?Q?Po/gPyJwUkuIbNqV/YIHugFaGfPbYT+VWTYgfMUR9kLdSNuEtg9kAqTl+Kfj?=
 =?us-ascii?Q?q+AbWcOTTdF4sJmMzXxrSVHtKPbf5FTgvOeqsor4x95Z5wcYV9VXHF7cz17L?=
 =?us-ascii?Q?AyzKoLc/v2GKfoZLB7yKHoL+tf66FbrxWYsznL8d58fAG7SyVPtXv9iIddOR?=
 =?us-ascii?Q?K1bsaaYfhcKgK/tdKPAtvfomo8EyHrT6ylhHqVrewEmbWK2J2FNLbRBZ0pYQ?=
 =?us-ascii?Q?6U4KWIuU7l25rgO2cDTM2pU6LQtQAQF20snfS0TZguX8JhO9HqBEq8KoDFeg?=
 =?us-ascii?Q?ait+0Xj+54qsqIO1jW48VI9/v1CPbAsCzfwa0j2kaC3a1fa/XiJr2U9ExxmX?=
 =?us-ascii?Q?uS5FAV0RdMayvU1R1rPWac8hGqOObSVrNVAn4bxdO+gBcHwexauI5U/E1THI?=
 =?us-ascii?Q?yNx3+vnTZLr8gtiDHMMBnRnAMaYZbVEHQQ54tyxmtdNMQpdiXUcmF2tMmqJ/?=
 =?us-ascii?Q?1UwAcl/Gjpvaqv24Xs97l+hSM+JWREEtR9WR9Pcjj80B67dLwvBonLkyvYD4?=
 =?us-ascii?Q?87A9W2erVLOzCfhaMOz4kqC+kqsmksYcDLkkNra9khFsDA945L8vl++N62ow?=
 =?us-ascii?Q?BlmI9QkmJcpAXDl2nfQf1TMOc7cIKZh1M1P+fGdrRDvHDzeeErS3F9qCgCU+?=
 =?us-ascii?Q?wO535dkR4vBRrzr/bmr3QHPvarXm+ePxG9aiU38JvaY0oaLOqKNTsWuGzpfT?=
 =?us-ascii?Q?LNxLb128urvfR3d+jziXPY7Sr8WbtEIg6nXbBR4D03j8mSVsSoQhSEt9npr1?=
 =?us-ascii?Q?ZbOxpn0/iX+fMAeGKOJOJMc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84fbadcd-7201-40e6-b037-08ddfbf2d5cf
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 05:17:34.6046
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WAf2C/WdoSP1Qzfhmid2fSimRpMrqq4VGX25vbEErYs0N3jt8b4g/Y7oWmUcTEuc166RtDYbTWCCyJN6VXYyhC9IfW6kVQnuWK+oVEb+nz1+cXefYu9rZuyEGlgcPUzL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB15474

SITMDRn / SIRMDRn and some other registers should not be updated during
working even though it was not related the target direction (for example,
do TX settings during RX is working), otherwise it cause a FSERR.

Setup both direction (Playback/Capture) in the same time.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Tested-by: Yusuke Goda <yusuke.goda.sx@renesas.com>
---
 sound/soc/renesas/rcar/msiof.c | 70 ++++++++++++++++++++--------------
 1 file changed, 41 insertions(+), 29 deletions(-)

diff --git a/sound/soc/renesas/rcar/msiof.c b/sound/soc/renesas/rcar/msiof.c
index 5b59d4bcd67e..df664800bf60 100644
--- a/sound/soc/renesas/rcar/msiof.c
+++ b/sound/soc/renesas/rcar/msiof.c
@@ -36,6 +36,16 @@
  * We need to use SW reset (= reset_control_xxx()) instead of TXRST/RXRST.
  */
 
+/*
+ * [NOTE-BOTH-SETTING]
+ *
+ * SITMDRn / SIRMDRn and some other registers should not be updated during working even though it
+ * was not related the target direction (for example, do TX settings during RX is working),
+ * otherwise it cause a FSERR.
+ *
+ * Setup both direction (Playback/Capture) in the same time.
+ */
+
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_dma.h>
@@ -165,39 +175,40 @@ static int msiof_hw_start(struct snd_soc_component *component,
 	/* Start DMAC */
 	snd_dmaengine_pcm_trigger(substream, cmd);
 
+	/*
+	 * setup both direction (Playback/Capture) in the same time.
+	 * see
+	 *	above [NOTE-BOTH-SETTING]
+	 */
+
 	/* SITMDRx */
-	if (is_play) {
-		val = SITMDR1_PCON |
-		      FIELD_PREP(SIMDR1_SYNCMD, SIMDR1_SYNCMD_LR) |
-		      SIMDR1_SYNCAC | SIMDR1_XXSTP;
-		if (msiof_flag_has(priv, MSIOF_FLAGS_NEED_DELAY))
-			val |= FIELD_PREP(SIMDR1_DTDL, 1);
-
-		msiof_write(priv, SITMDR1, val);
-
-		val = FIELD_PREP(SIMDR2_BITLEN1, width - 1);
-		msiof_write(priv, SITMDR2, val | FIELD_PREP(SIMDR2_GRP, 1));
-		msiof_write(priv, SITMDR3, val);
-	}
+	val = SITMDR1_PCON | SIMDR1_SYNCAC | SIMDR1_XXSTP |
+		FIELD_PREP(SIMDR1_SYNCMD, SIMDR1_SYNCMD_LR);
+	if (msiof_flag_has(priv, MSIOF_FLAGS_NEED_DELAY))
+		val |= FIELD_PREP(SIMDR1_DTDL, 1);
+
+	msiof_write(priv, SITMDR1, val);
+
+	val = FIELD_PREP(SIMDR2_BITLEN1, width - 1);
+	msiof_write(priv, SITMDR2, val | FIELD_PREP(SIMDR2_GRP, 1));
+	msiof_write(priv, SITMDR3, val);
+
 	/* SIRMDRx */
-	else {
-		val = FIELD_PREP(SIMDR1_SYNCMD, SIMDR1_SYNCMD_LR) |
-		      SIMDR1_SYNCAC;
-		if (msiof_flag_has(priv, MSIOF_FLAGS_NEED_DELAY))
-			val |= FIELD_PREP(SIMDR1_DTDL, 1);
+	val = SIMDR1_SYNCAC |
+		FIELD_PREP(SIMDR1_SYNCMD, SIMDR1_SYNCMD_LR);
+	if (msiof_flag_has(priv, MSIOF_FLAGS_NEED_DELAY))
+		val |= FIELD_PREP(SIMDR1_DTDL, 1);
 
-		msiof_write(priv, SIRMDR1, val);
+	msiof_write(priv, SIRMDR1, val);
 
-		val = FIELD_PREP(SIMDR2_BITLEN1, width - 1);
-		msiof_write(priv, SIRMDR2, val | FIELD_PREP(SIMDR2_GRP, 1));
-		msiof_write(priv, SIRMDR3, val);
-	}
+	val = FIELD_PREP(SIMDR2_BITLEN1, width - 1);
+	msiof_write(priv, SIRMDR2, val | FIELD_PREP(SIMDR2_GRP, 1));
+	msiof_write(priv, SIRMDR3, val);
 
 	/* SIFCTR */
-	if (is_play)
-		msiof_update(priv, SIFCTR, SIFCTR_TFWM, FIELD_PREP(SIFCTR_TFWM, SIFCTR_TFWM_1));
-	else
-		msiof_update(priv, SIFCTR, SIFCTR_RFWM, FIELD_PREP(SIFCTR_RFWM, SIFCTR_RFWM_1));
+	msiof_write(priv, SIFCTR,
+		    FIELD_PREP(SIFCTR_TFWM, SIFCTR_TFWM_1) |
+		    FIELD_PREP(SIFCTR_RFWM, SIFCTR_RFWM_1));
 
 	/* SIIER */
 	if (is_play)
@@ -214,10 +225,11 @@ static int msiof_hw_start(struct snd_soc_component *component,
 	msiof_update(priv, SISTR, val, val);
 
 	/* SICTR */
+	val = SICTR_TEDG | SICTR_REDG;
 	if (is_play)
-		val = SICTR_TXE | SICTR_TEDG;
+		val |= SICTR_TXE;
 	else
-		val = SICTR_RXE | SICTR_REDG;
+		val |= SICTR_RXE;
 	msiof_update_and_wait(priv, SICTR, val, val, val);
 
 	return 0;
-- 
2.43.0

