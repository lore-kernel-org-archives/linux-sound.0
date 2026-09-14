Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010057.outbound.protection.outlook.com [52.101.228.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E44F2D5408
	for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 01:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789350203; cv=fail; b=sECVykNC7ygB7k5TOoeEeSes8n8Y9vXeV1dERx7bNKZDw9Ci4OeqvCIh/8vrztAm9UuNLURjiXJReHYyEQzPRpVsskta+v4hDNvDpand4x5N/pemqx8xDLRvLH+DtmtdiBipbaly5KAbwS7HanN85S/7At9YAsQkaCkP3RlGku8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789350203; c=relaxed/simple;
	bh=lrZs7M6edSneeSkDveaqWsvYE4i583KJltZgDXfVljI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=HysHerKdGUMNIcGrxZD6N94jSaFNbeSbdtXNiqW9Yolfzu16cNPg0C0jkzKwy0NtLklGr2lydfKr2dE1piiRRM8VNE2V0zwxCXP90DuR7J/kjU1vbFMAJxQ6b9ZieN15blgNzh+SxYMqlcmwij0kGIs4uYxcK5ZJkDiP79BgiDA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=I0xMSmOk; arc=fail smtp.client-ip=52.101.228.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="I0xMSmOk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mbo4oSY9FLQi1ACqIeDMijQEVYT6gnlT6ZFD2bMP1jl4oUoGHSOMIiwLRIwETcykWUbwIcGY+J3e+L1T93JLYoFfaG6T7Jx2IslMTq6+jlpLugPuLJ7K3IuKNkICp74C+85/RfuEjOxSX/XfyWIKR3T1yZHORNfvZOgcvENzYysw7jsAqG+hHDtFrxjjX/KlEFvuGICMPQXvPZoACvfEF7sgQ0qhxjP2ApDVtIPbCR1EmRnH40TaJvypY8ZBypBQeFsofsw+N1f8yVn+W1wIiI/7yhdZOTHdLijFk2rHg2VcOMuGfgTPL/i14AqloDJm/yRk79rpFgdVQZk7CcORow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JQJ8ZEQ6vn74YKdVjQUQdCX2VURMT41gJOE1q+pVEbc=;
 b=b0fXuYwN75G6E6fdAVv5JTjkHev4WhHLi5uHz1tLGXs8sJgJdUvSXPijITJkOmrGgomDPCh2LC3qTvA5qiPCyIZ3is84uavBk4tpogVPqQGUq9+iIObnB72LrYaOcsSzJmIyjU1pKi/bBcrL+GI4Ez4M19/+Vmtm97x/vEzvT1V6dk8Zo1xGqwA9uzN5CjQjUrB/3JEAFY2Xh4LHxd2VGzFg75SXJBSTALAVKZFjnVKm6nJeouXx3kpqIqYP85l84e8xyV1zp2zSRDDTPsWoFB9lFk21KGSvfMhaflowZcGrkmZpePw39xF8pJd0ly8gY9a6IYWzHQ5KezWkx40RbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JQJ8ZEQ6vn74YKdVjQUQdCX2VURMT41gJOE1q+pVEbc=;
 b=I0xMSmOkbV1lXgwKw3SXgEc/znRhFy5is6uVbUJgKAwCbVubUpCyP+gcwA9czsWtS4QMAAe+5y/FQTRapEFRwfNjVFKyhvoYOj1kug5zox/GRimJJJt99af28dK2FEoPYgEt70StR8UVJWzuLFvxHSP0kckprSAGGAtMk8CvRxA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12) by TYWPR01MB7202.jpnprd01.prod.outlook.com
 (2603:1096:400:ec::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 01:43:19 +0000
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45]) by TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45%6]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 01:43:19 +0000
Message-ID: <87pkyglia1.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 01/10] ASoC: soc-dai: add snd_soc_dai_id()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87qziwliaj.wl-kuninori.morimoto.gx@renesas.com>
References: <87qziwliaj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 14 Sep 2026 01:43:18 +0000
X-ClientProxiedBy: TYCP286CA0103.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::16) To TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB14118:EE_|TYWPR01MB7202:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a8fced1-e03d-41fb-9a37-08df12018d97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|52116014|10067099003|22082099003|18002099003|56012099006|11063799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	vYeNpXmXGDR9/XGRwIQYWmZyu7xgXSuwMDSeolGvKtwJFwIFIRBOwsS3aOsLyoZTA5dje7g8cDV6HDB6QIeD3ZeqqHpl7FK4sn1adSEEePTfLqZx6ZtRqDKKGNDIaUckG08wKGHe2FNfANfe8Kcz/Kh6OD+9jHvsdhIqfb11U6BUUG3w3Jc7ILIhpgIrCIxm9mUib/H592qraiL+ErEcNPsWgDiQNZ2vJyNa7jE2I0Gh7m4JgWeQQQvYZYDlpppRZVR6fuNlliFfCgusM+L1UgOi3l6U5s4jvLjsnPgcji2wPWoiwnZalLsdT8BMIphVrR6bWrDhNyswsEDNtXkzyY8ivY1CWrFE+1IK+OPloTJFLZb/TcRZRQ+KHkSDb+980CGjW3d3y6sGDyAimo0VB8A1T+MgFPUN8C9RSyesofqGuFVxGWv+qi0qpzMLVdjUD22HN8mrv3hhiyZhc0da2+KDWmHaGNtWxzH2iBrU5H7mRzcrlo1E+SCLEbBAg66TZTCyxbIYpHueCx13hWIv8K4Cxv+KxAj7Y0zzm0ZuktjjSeN5mvvHfs/DY3VSkgk0Yv89qOuFjwgp6zGRRLERw5Kfq2OVpdEt2tf/2T0zVgNUyHKIMY96QofUijpOdvhv5qytmhQqAx1m9L58j+xfn6a82iKlhzFWO5evAcmo+7q0DNKsGynH/3KCiBr8xLENPkBuZAUeG0Ew0H+bBJa6hw9mt7nMUhUKxmVpfD6aSU4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB14118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(52116014)(10067099003)(22082099003)(18002099003)(56012099006)(11063799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VcTy8Pp3qub90pzUgpMYehwJzZ9aLmpgIFOF4JK79Cemr1qiee+01ZX6Ti09?=
 =?us-ascii?Q?fyxB8OHZc/uaLbMQWspA+74gJoVWCDAahLggV7zihsdcwTH7f2wRzPOCzfLD?=
 =?us-ascii?Q?Hd5Rd819AKSyZgyzZc6NZWh5gXKtm4DRT8B807GtduXiJFmFC17EU5ifR5Z8?=
 =?us-ascii?Q?ShEPm3zGarENjrjuvgBct+UdUZ2L+MtLbPG+1Ns1b6Qowle+nysAhNUkKnsa?=
 =?us-ascii?Q?FOJLmcAKkI2mku8MtithhRVw6DWTNVSNJQ48m3MfbZBjnRjrx+TBf1fbj2O2?=
 =?us-ascii?Q?UWnmLx4Vs458eVpwnDEHD0LMj2/sSS+0/x+B8C3caDepMpFDzNuTUcyRxob+?=
 =?us-ascii?Q?VIlYf5JbtLGZ9J70Fyd9a8Uzy4utCP2q8jWTSqYHUyizDf8l4ast6Edtq5h0?=
 =?us-ascii?Q?ZZ8k8otpzmIQI5V71lgKnqKEHsQNzIlHtI9+OXsZY8/NaHDjqwli27BYu9Jn?=
 =?us-ascii?Q?ARNNtQywkbbnOmJtearKM3erdsLHh0Ub/jj54Vn69tDYfHbYjNcSE7PPW96P?=
 =?us-ascii?Q?I+Mbpa8pZLAGM5BTE/FwqSW/Mlq0k/kr0oeV2lVrTZ6Hc/sh9pYCecCkYSqA?=
 =?us-ascii?Q?KJYmrch+sMVkqRqSqWxe59SUSPvnHhDJIY+IPUlY0vyKh2YqbX+qBEreL3xf?=
 =?us-ascii?Q?pS8u1+zTPUvY4E+OgxllclyTyHBrgopaEJOppFQ1c0cxoXIxDhXQIU0DMJ8O?=
 =?us-ascii?Q?CDJwRRiDhIFFwlrU9gK76Cb+GavCE9DApLVabQDkY72WdmZcH5XRW6G3RACc?=
 =?us-ascii?Q?PKPLYi19xMy0Xg+RwRdbayPM5s0tpTPPn0XRujagYNdVM0lHbnhs3jqRMURD?=
 =?us-ascii?Q?lyb8RxON0Ohl1ezNN9yrCiq8wbWciWcsKaYltAgzV/HVoD7cay5/VfxJKgt5?=
 =?us-ascii?Q?HLeGlRmAQ4aFoUVwIlaTnbew+9QM86MDxdxl644pn6PPglfko+uWekWEkQ1k?=
 =?us-ascii?Q?0zmhtv3I7bVYmpfb+9kBmpfbACcE+1zsJ5Wh+mEMs8HJA5VjEcjUpbr9JT38?=
 =?us-ascii?Q?NibOvEz0RnMAL+kX2EVZbmMxRK8Egxe9fKLLoZ5XRPVbs/HtbrTU96lIdQBV?=
 =?us-ascii?Q?cUpLxXdUdYddJBrbMvKyGer+G2C/RB86b/fCXF/EoZzGu23cDS+Xakiqlxyx?=
 =?us-ascii?Q?u73bDYfmmIOT9RKpTWhArdQYS79q9+QOGDFS8LTxobZt/rNxkhIFJ/tqLaj1?=
 =?us-ascii?Q?xUyIQUn3iXGA7BIppbBYEIzzHF5IlZozX7bnidzxuL29/gIyhs7jQlJDb9Jx?=
 =?us-ascii?Q?4pLF28amYzGr0KYppIlDUiDgFsJcBdIBO6KGsoQE+xoleDQPT2S+WWriaMTd?=
 =?us-ascii?Q?WGMDTYJvi2PCfa/GJYnV9VJJI9jLCbx24vGwcNzzfdbbDv+UkDcAAWgT/g4i?=
 =?us-ascii?Q?WRWQa+wzZCAqRHvwGQ4cvyyU58vVqWXuehfI+U3DSH1zZoxJodzAZn9rkOZh?=
 =?us-ascii?Q?nAsu7l3sAb+SWKTUY8VKsjQu4hZW3cMkm5GQFGFYRIEMWJzz7dA2GLGMywhK?=
 =?us-ascii?Q?fAck5zWKiXU+3ztB9XIvinj+mRZEATiOae73eclS8kzexZliBTzseAvb7oQR?=
 =?us-ascii?Q?CwYAMCwh8UGKSftb0SvBtN0z/XmeTOcyCP0S09x3GA+ypguc9Hc8iaQF/cxk?=
 =?us-ascii?Q?/0FzD9MN90CSjuiKtqZIf3XzwCf+OpZjgtbfztSvYJiXaVTDBbox35ZkhCGj?=
 =?us-ascii?Q?U1ZSLPPH5/54aaV7tL04RP3Gz1YGnlWxahCN+AAoM8RyXfOGMneIh4eNqAbW?=
 =?us-ascii?Q?t8Uad7I+Jnj3+7nP5wf0OMot3/u8iiAGO2E8g9SgG/6sOQRl/u1V?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a8fced1-e03d-41fb-9a37-08df12018d97
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB14118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 01:43:19.1317
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /bN4UGQDgsarC7LE9ANMGS/Vubkv4pMUK/oHmn75ZUkagU6FhccveVNntBs7yw+VqZujQzO5FI2tnUmmsnX2G66KBbJ2L7xGot4ZfYGfEGyUGcsVAoOJtFkw4DgsUU/z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB7202

DAI parameter will be capsuled soon, will be not enable to access from
each drivers. add snd_soc_dai_id() to get ID from DAI.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dai.h | 1 +
 sound/soc/soc-dai.c     | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index 7e64e049d71d5..02b52fed97c9e 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -283,6 +283,7 @@ int snd_soc_dai_matches_args(const struct snd_soc_dai *dai,
 int snd_soc_dai_matches_dlc(struct snd_soc_dai *dai,
 			    const struct snd_soc_dai_link_component *dlc);
 const char *snd_soc_dai_name(const struct snd_soc_dai *dai);
+int snd_soc_dai_id(const struct snd_soc_dai *dai);
 
 struct snd_soc_dai_ops {
 	/* DAI driver callbacks */
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 83d030e14bb0b..d4c47da75fd27 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -1073,6 +1073,12 @@ const char *snd_soc_dai_name(const struct snd_soc_dai *dai)
 }
 EXPORT_SYMBOL_GPL(snd_soc_dai_name);
 
+int snd_soc_dai_id(const struct snd_soc_dai *dai)
+{
+	return dai->id;
+}
+EXPORT_SYMBOL_GPL(snd_soc_dai_id);
+
 const struct snd_soc_pcm_stream *
 snd_soc_dai_pcm_stream_get_i(const struct snd_soc_dai *dai, int stream)
 {
-- 
2.53.0

