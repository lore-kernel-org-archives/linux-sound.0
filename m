Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010025.outbound.protection.outlook.com [52.101.228.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F4A4315F
	for <linux-sound@vger.kernel.org>; Thu,  6 Mar 2025 01:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741226382; cv=fail; b=l2bk0uIIAwYhJAds2BQgL7QFYedkXkfNAgzJdR0Tyah5vqz+VHOpFxU/nXN2IvoEXD66ExkvunPjsbF8S/CYJwjpQ2YzGg5S+gHh+GgPzgCxPhQLL4gzPRglKzyMwdvudcRfiYYOkGRltzUe6fBHYoLmKW7a8kSyaU+9ll2quwI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741226382; c=relaxed/simple;
	bh=jIjkXXJx9G+wNUWzWm7o01LZ7Rl1smug9fMreo44iIk=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=anJHnK4KfSvnV7Zb9UFYs3LWYPEILoXhrFqjtOxmik+xc3eOD9C7ky42rtwFKo2FpsdmkmasFnTRgcwPuYVq54aGnYs26/0/6XwOG5KOIA4rYar2xbpUqcMbvL5og3Xg+xkeWt/jST9CfHxNONc8KittHxFrSMQcianD67JP7Dk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=J+ZCvZ07; arc=fail smtp.client-ip=52.101.228.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="J+ZCvZ07"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J3rB/HPLKfgbkgVcPsPzrzlm85IkMuKl6alaKJoSpmwcQcrJH7nphRC3dMI9OcPHuLE8ZRlp50o3cktBtQ95k6jd2K7iEcv2UJJGEf/WBvlRfKswQtThDvZ8wawLGVYBVNg81MMNQMGhdHKccEEZGuewo8QN1FkIH33IkAL1Q8Sk3J4Cl7CpWVMbjeI8X07pY7q7D4K9cEJ1OMguTFmaiyQdVgc+ZgwNsnechJkqdow1CzLjejn1PasaisFJZOYZsWgWvMxI2dreBu1cDDjLBakR6lj8aEZqB+i77/r8+fGcFZgppTIQrHSJcpDHI7ByY9KTEjO9uOdHxH1LbJJODA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tQL7IG+oyeITtYDPzdrkCc9RBRrnaI23Jf4WL6VZTUA=;
 b=kOTrLVjYEYAq96qDucVM8t3+Caq0xp1KFZEvMC2lhk65vsLhiecS70Bj4h4ZjhObbOicr6mbWnCI/oXJI0ey6UXo0qASisrLbibud31HjNu/iOn69s2ZY0UY9QtetyR4SVdeobGvFSYU2JNy3FJZScV8rTWLvffAkjQWTmFxYjq1HF8aFG6XnJVh0jbxEqNER+P/qyz1QyzShYqmdKZ8aKpCy3PFq4EzuVkQzwDb2Nb9yrTt3IDpu33uH7EDTG5GzdopAiQTQat0E+WkO6O+YctCSoELDFtN4gTSHNxlhj7BZ5n0+HKj0fzJcEyskQkjnVdD9sZ8T8KOoI2j6BFzjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tQL7IG+oyeITtYDPzdrkCc9RBRrnaI23Jf4WL6VZTUA=;
 b=J+ZCvZ07syKqT85tFCfUlhzd5M5CpN34g/BERUiQN7rr/PpUeIOi637XUPaNWocb5nPQktmxn5DvvA8a/+M6B31Lm3iwDl4/zap6QJY24jgcFVgWYlx4Uadp4vdXUlVi6Wqi6xVBPsFHcTqbxG0nzx/R85rtq7Il4LvLtCc18EE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB11216.jpnprd01.prod.outlook.com
 (2603:1096:400:3f0::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Thu, 6 Mar
 2025 01:59:37 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 01:59:37 +0000
Message-ID: <87zfhy537a.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: soc-pcm: tidyup function name to snd_soc_dpcm_be_can_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 6 Mar 2025 01:59:37 +0000
X-ClientProxiedBy: TYCP286CA0286.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB11216:EE_
X-MS-Office365-Filtering-Correlation-Id: d874ca3c-afbc-4e02-5448-08dd5c528cbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yz3JtuMhv7bH4UpMHUNvcQZJrtKGfptDH34cmVUsLjfH1MsKX3949pjde7/l?=
 =?us-ascii?Q?3dukpxhgDM2W6x7hO5klYzlgutixBgOmCzNqk7x6jExQWQhOOclOCSN9fn+Q?=
 =?us-ascii?Q?GcMP5KgzCGNDQJzSUrI6+GPmlwYVAh6YWtdtAjcSohnE018BZP1D5b7PL1/w?=
 =?us-ascii?Q?MMxu1b/kUs7x/WHuayOT7AMihH+yvbHqQ92QPeK/JEwRbMXwrUYJZCHmUGs6?=
 =?us-ascii?Q?OczJRnRJkwUCddAcfbdngc58icgCkLzHDVRPnHF57gY7G+LFZVC8cuDoF2xI?=
 =?us-ascii?Q?Atog+jHF3gHUStv88yB+xH7hAWPPDLU+aVISYCiu8OzGl62Gf8Cux4iTHYYe?=
 =?us-ascii?Q?6lz1Xtql/+/43XBC2FfmA0Hfl8xDc4EpCSP3tmACKEJFgf+cHVbsRwvZS5t/?=
 =?us-ascii?Q?LQgJ3kKAoO1wwG/plMZ5vo3cMuGOI0l/CiVg2myS905qQl6BvySbIDFWUC5K?=
 =?us-ascii?Q?Lz52ik/v3orTZOXk0Da67LLslL2JjaSqTRliB6qWH/CXxmnByUpIfqQazV1f?=
 =?us-ascii?Q?QWWT3HmVEqFPa3wljJeK+6PLvNJrBpdhcqt6sbKOTxfJAWGszzuIGpkgGUFO?=
 =?us-ascii?Q?Tu6vgsKxk7MznrouXvkFzWJ3L3DEX1Bp6utIG6GTpslf1AoN/kEZIzL6xH7c?=
 =?us-ascii?Q?vpt8HgoiOIJMUAXovu331aKwuqq1scS4zGT/B7zA9d3gDSHQR6Qrge0ghsq3?=
 =?us-ascii?Q?2OdqNRkG05KnW0QDgUGD0OymZgppFvBleacCoEHMcmoFnDKFpU2fQ3SOi/1d?=
 =?us-ascii?Q?55TpALtGIrZv7AfgCFi3UqG2+Tq7g6hvv+beB2dXC0uJnivSjC0O+JlqtS22?=
 =?us-ascii?Q?7Q4FNkB2My9xFWDxdDVi++BGZo6TOxz47GlpGNkGqHLNNIuUY3sSPcIoiYMF?=
 =?us-ascii?Q?709Y8PWfRavjVUbYAm9ygJhb9xo8mTYLm8p4iIcpvzmP98dda9D1aLQeKHC/?=
 =?us-ascii?Q?f022KkHHDu6HeRAQQfKs/0IUz+E3A4jpz/Yf2fOHD8bBG+mOJXcwoUoG6jmC?=
 =?us-ascii?Q?RVUjatqLpgp/d9Wrrhk0rfK7Lpru3A2aZZ5AGEcclH9zvcG91LltLeMqnKgZ?=
 =?us-ascii?Q?Qc6/CEk82SaXGZBXs1QZo5m8OJasofQfmufDGpeuAgqB8mAmUAJgRjsseZp4?=
 =?us-ascii?Q?5hr8D8uiYk2/vt3qDCzts9aNWYR17jUoBs+l7PT8ZRgYSu1NxJ3yi8ZXxF4M?=
 =?us-ascii?Q?Pvks7eAOMUqc5xx6KIj+dsS+bpfKgGf8l1f4zBnyDkEcptjSHRYMk3aUks2P?=
 =?us-ascii?Q?8P1paFIeH9PP/V3nM3w73mYrsov9arJ5bK9r/iws/kZavHss2I2ja5As3tbE?=
 =?us-ascii?Q?lVxPoKYuwSrpAFJMw96tofqSfHAvqEO8m3BDqw62vDdehISdjkeKKOAdlhwg?=
 =?us-ascii?Q?injGFXygsqcYB+GGCXvtWk8dwFqNjqtpEvcTNiDStHlI0xR6eYx7GjkznN3W?=
 =?us-ascii?Q?D/SUZXPeiH0tssiIX4oWvIWQBgq9velp?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hHjlaWdkIhWA9SeGX/4TgVcTG6p+/TO8qkKylhVsbfEwyY/usbiDTpuULUl2?=
 =?us-ascii?Q?RURxi/4ECqkG8sRVtVcLLsjOLcZy9a6LHANQks95tb3Yq499Oxo7b15pJP0l?=
 =?us-ascii?Q?AopjnB+FvA8CAFcyA864qD8H8fj2xCeZgbVn/u54bnqM6dLTP92D95Qs5a3H?=
 =?us-ascii?Q?SWL8Xa0sbnRRD2NM8ERDyr08CNF288sadNwxv+fS3Qsk9CZkOD915jTxXTiN?=
 =?us-ascii?Q?yw1HJL1o+dYEzDm2PF70b2O3GRiCOZZcr+wZ7ExDLvKyPyYcXeUN3c6BmFVZ?=
 =?us-ascii?Q?Do+Iq6abCWDPRIxaugD55F/Ngm/FWTHM1lvzOk8SopamCTGkwvXQwiIx6Egm?=
 =?us-ascii?Q?YQfdppX6poGRt7UCfp2N/lmSW4t/oIaYOiTu6bK/lnG7tBQg2uV1nxY7hqH5?=
 =?us-ascii?Q?verBielGe32wNkAZL3Jyzg+BmI6xxYsa0LwC9VnSYYprndOmamKPIgdnD4j8?=
 =?us-ascii?Q?hGERJf9bCwunwo3412Muz1aTNOQ18gpoRtNAg8y0KJC2DuT7sTxE6Zl5LX/w?=
 =?us-ascii?Q?FHntgp6CVlnH/ekCgeoTqvSf4bKQumndYrO3Z7317m+/hZ0KFKaxKkQsBMTB?=
 =?us-ascii?Q?jjIM8ec/jEDlB2ut/u5r49SAb5p5RAFn2atyS3fR/76Lg+RtzlbTMCebXGf+?=
 =?us-ascii?Q?kgEWuiu2M5qpdJcnhZI+Ot9Z906JPKRKlStCyR9R/QyxAPuIzG6m66sl/gCn?=
 =?us-ascii?Q?APmh6B980Tdiz0Rn0kwAIuDINvDN4LUtC/xXRRp1ipIy1Lm6S08EsB+ryakl?=
 =?us-ascii?Q?r/tppGlGGsolDu8xf3Fw5kAZOksm7mUevKPFOn+/qOCh6S3Z4JF3FnzF6OhW?=
 =?us-ascii?Q?vSWCywIykEFA4Kg+bt02J90p0rzAu3CFLLrpXbKH09M4qY1B/rKEjvlPDSd6?=
 =?us-ascii?Q?bcUFMiX5PyWFLfhskbIlq0lwQRoUP66RONh26OIYdzcw0sOqY2fGUbfK5ncX?=
 =?us-ascii?Q?O5gmTpr5ytoMJ3dFGFiUWs1n6uxIE+IExcjkdKOfHmqTmEseSZxR3sHzxf0V?=
 =?us-ascii?Q?uAXouSk/7jK+0Xi6q6CxbnQ/YLF3PO14HdaICFnfDWvYlRgs8XHFDjAKYWqh?=
 =?us-ascii?Q?T9m07Rh4apusFyTDxHQKX4Baxczgnyd+JW0vyppdlE0QRz4BwbR6yK/2cBiS?=
 =?us-ascii?Q?OM10eUGZK8udhgD7wP8+D6N6TDpZA/FHAmHWizferF3JCuTAuGewJ1rpWS6S?=
 =?us-ascii?Q?XkIjLL+xZx/ox1R8EpaAN/B9jWk1ZSR9ajv3/ZPIKXFSbVODZDWvnmHsBYJt?=
 =?us-ascii?Q?E+TOfGKs4/LC74lY4O+iG/2mQ5kWA3ARNA6axY1LXt1yIFDlPQ3wqyR9swLV?=
 =?us-ascii?Q?rwuWBpLUuA5SLzoxh5MVtjcS2u+5pgxfKgDGXIjorS/Kw8omfRGhz3e5Z2bW?=
 =?us-ascii?Q?yNFjB+BZFIziUuKxnCrO4NwklVWDDwFgQNGbE3EsyPYERXhTaGJDnzm/jNhR?=
 =?us-ascii?Q?TdjcJK/403+uybmexjKzi39HvCPn5AxtnF2DTuigIdZBTO7mwRwkTIkz2cFO?=
 =?us-ascii?Q?JA5S7zauAf/W7MR+Sj9NIWs2yt8fchZ4U2R3Dn62LrzH/GJZhdqzH68UjedT?=
 =?us-ascii?Q?8UuJdsjJ+FNPA3cgD0fdmbIU5yUcQA1ZvPLy0ghh7gBW9bBFw4tgmNPxcCJy?=
 =?us-ascii?Q?SxBe+lE9i9Sg7J5WPZok+T4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d874ca3c-afbc-4e02-5448-08dd5c528cbd
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 01:59:37.5828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lZ3kYQNvSvdEjHjG/Q3W6GUAYUMvxluwwKhLLWeio9hEPrYfz/eHtcYlp2UmEfc+VYu+EjYIRf91gq8orM2Z5Dsv8NgpzA869Le0tn+DbRiKIxWZLD0FdAKmCQd6mEj/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11216

We have similar but different function names

	snd_soc_dpcm_fe_can_xxx()
	snd_soc_dpcm_be_can_xxx()
	snd_soc_dpcm_can_be_xxx()
	             ~~~~~~
Let's unified these to can_xx

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-pcm.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 8d88971bdea3..73b05b8f5a07 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -36,7 +36,7 @@ static inline int _soc_pcm_ret(struct snd_soc_pcm_runtime *rtd,
 
 /* is the current PCM operation for this FE ? */
 #if 0
-static int snd_soc_dpcm_fe_can_update(struct snd_soc_pcm_runtime *fe, int stream)
+static int snd_soc_dpcm_can_fe_update(struct snd_soc_pcm_runtime *fe, int stream)
 {
 	if (fe->dpcm[stream].runtime_update == SND_SOC_DPCM_UPDATE_FE)
 		return 1;
@@ -1632,7 +1632,7 @@ void dpcm_be_dai_stop(struct snd_soc_pcm_runtime *fe, int stream,
 			return;
 
 		/* is this op for this BE ? */
-		if (!snd_soc_dpcm_be_can_update(fe, be, stream))
+		if (!snd_soc_dpcm_can_be_update(fe, be, stream))
 			continue;
 
 		if (be->dpcm[stream].users == 0) {
@@ -1682,7 +1682,7 @@ int dpcm_be_dai_startup(struct snd_soc_pcm_runtime *fe, int stream)
 		}
 
 		/* is this op for this BE ? */
-		if (!snd_soc_dpcm_be_can_update(fe, be, stream))
+		if (!snd_soc_dpcm_can_be_update(fe, be, stream))
 			continue;
 
 		/* first time the dpcm is open ? */
@@ -2007,7 +2007,7 @@ void dpcm_be_dai_hw_free(struct snd_soc_pcm_runtime *fe, int stream)
 			snd_soc_dpcm_get_substream(be, stream);
 
 		/* is this op for this BE ? */
-		if (!snd_soc_dpcm_be_can_update(fe, be, stream))
+		if (!snd_soc_dpcm_can_be_update(fe, be, stream))
 			continue;
 
 		/* only free hw when no longer used - check all FEs */
@@ -2073,7 +2073,7 @@ int dpcm_be_dai_hw_params(struct snd_soc_pcm_runtime *fe, int stream)
 		be_substream = snd_soc_dpcm_get_substream(be, stream);
 
 		/* is this op for this BE ? */
-		if (!snd_soc_dpcm_be_can_update(fe, be, stream))
+		if (!snd_soc_dpcm_can_be_update(fe, be, stream))
 			continue;
 
 		/* copy params for each dpcm */
@@ -2118,7 +2118,7 @@ int dpcm_be_dai_hw_params(struct snd_soc_pcm_runtime *fe, int stream)
 		be = dpcm->be;
 		be_substream = snd_soc_dpcm_get_substream(be, stream);
 
-		if (!snd_soc_dpcm_be_can_update(fe, be, stream))
+		if (!snd_soc_dpcm_can_be_update(fe, be, stream))
 			continue;
 
 		/* only allow hw_free() if no connected FEs are running */
@@ -2188,7 +2188,7 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 		snd_pcm_stream_lock_irqsave_nested(be_substream, flags);
 
 		/* is this op for this BE ? */
-		if (!snd_soc_dpcm_be_can_update(fe, be, stream))
+		if (!snd_soc_dpcm_can_be_update(fe, be, stream))
 			goto next;
 
 		dev_dbg(be->dev, "ASoC: trigger BE %s cmd %d\n",
@@ -2465,7 +2465,7 @@ int dpcm_be_dai_prepare(struct snd_soc_pcm_runtime *fe, int stream)
 			snd_soc_dpcm_get_substream(be, stream);
 
 		/* is this op for this BE ? */
-		if (!snd_soc_dpcm_be_can_update(fe, be, stream))
+		if (!snd_soc_dpcm_can_be_update(fe, be, stream))
 			continue;
 
 		if (!snd_soc_dpcm_can_be_prepared(fe, be, stream))
@@ -2623,7 +2623,7 @@ static int dpcm_run_update_startup(struct snd_soc_pcm_runtime *fe, int stream)
 		struct snd_soc_pcm_runtime *be = dpcm->be;
 
 		/* is this op for this BE ? */
-		if (!snd_soc_dpcm_be_can_update(fe, be, stream))
+		if (!snd_soc_dpcm_can_be_update(fe, be, stream))
 			continue;
 
 		if (be->dpcm[stream].state == SND_SOC_DPCM_STATE_CLOSE ||
-- 
2.43.0

