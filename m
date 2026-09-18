Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010027.outbound.protection.outlook.com [52.101.229.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FCF34104E
	for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 01:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789695852; cv=fail; b=pNMK7hg0ey8zR6gTiLov1BomW6n4/H3Qx4bBurXjQu4UbtVmOoGB84mK1MKP5z39nprFveiyQL3Pd559QMpNY4CDK25Grs2z44yo6QRxj0nBS5OR3W/CSqBkYeaJnkZ5O7H92GOVEFC/3Pk72VX+IoiVUbvmA8mAPfGGS7bJCHU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789695852; c=relaxed/simple;
	bh=qQSzQKwozb6SmqIXakPxMzIrx2nVl84ijdFYyJlwGrU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=RyZCjHsdk++CZL5jUbKXqV7iv4hqxFOE2Mf7e+pGDLw7CzDXEhpfX6gjd/3HHvHDC4rybAeJGi8+Cc3u6H1ixsJpnnv6oGcIRb9EwsOID/L5M6yjmxqTQZT5agx8u45IGp9r9c9A/fXE6syHcNyhRAFmYtuoaxPyk7JYeqAOzAM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=QoDWPKSk; arc=fail smtp.client-ip=52.101.229.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="QoDWPKSk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gx9r6TTIxycXGXswc/OyWNhl8Tq8l0KT1hZjdO88Q5dmdWT44dYmDkPLo4U6xt732ln+/EzvPScMt30bUALpy8jHbC9mFHN/3DBUzXLZj0d4RcY/WYROxiDyxJqMKHX3DvvOytRoB39Jy+bvZvjsSSaJ+gHAVAKjtmqMOjDQ9xM60j0pRLZEp2GNIZceR5Yov2tuvHPvyoL/LXfGN9oxGxck6wRtb2VyGDZIulUCAH8qeStkXwEIN56WXHNyWrA8Er1LayXCWzZOaEP6//MAgzo+Llam5wFfLANLFGrnZh1uonfGTmNjmQhiY5E5fnR4cio1vLbRbC59FGaIErE2cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1VdhfGUMVyktFX3774lMhcYj/g7EmiVD7Ap2YOCBGg4=;
 b=Fu2DYMA4oK8ReXvj/XgdUmqSEw7Gx+R9D0Np0uePCkxApM4LsPSfFk2mPgaff1PZwm2FIhS/vQuyE2Vg093flN03Oavdqynqe4k5TB1+JyRx2uercfE8A3bsKqXBhOXt8VKdKKLknTz9ctoNuO0E30t+w8bTbBrgpjcFxs1aF9GOqzGwRuI7A21gxMzx7rUoLiRNTGQY9iPBWQU/UphIE6Ip0xfVCpHQXRGAGjmhW99U8zXr81VJHCxIAni5zPo3Pixu328jfaFM682Nu+f+dBpGL2MPYHR+5Z3zYTaTZf7gaxSNtyiSYLubHIZ4hAVpTK/qdyQmWI/JQR36phhBLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1VdhfGUMVyktFX3774lMhcYj/g7EmiVD7Ap2YOCBGg4=;
 b=QoDWPKSkv166/WJYlvs0kNiAXV+dWdPWD+4ua60j2jzvn0zQuW1Bp8O0w3llMXdlrMCT/Tnt3wyDvlgfzXqEmqqGPwoJo8s7p2iGYxxGnWuJ53+/RS/p2SzIyoskg9UZKyJ23r6D3zdJXWL6B4Jjgtolvr+6l6u2d+6iRLqee1I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12) by TYCPR01MB18388.jpnprd01.prod.outlook.com
 (2603:1096:405:3ee::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 01:44:08 +0000
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45]) by TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45%6]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 01:44:07 +0000
Message-ID: <87h5jnjpug.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 6/9] ASoC: soc-dai: add snd_soc_dai_get_symmetric_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87pkybjq02.wl-kuninori.morimoto.gx@renesas.com>
References: <87pkybjq02.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 18 Sep 2026 01:44:07 +0000
X-ClientProxiedBy: TY4P301CA0126.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37e::7) To TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB14118:EE_|TYCPR01MB18388:EE_
X-MS-Office365-Filtering-Correlation-Id: 5525f454-a919-42f0-0fea-08df15265419
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|52116014|10067099003|11063799006|56012099006|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	rPy6iT4azYKoCYR8Jwx3I28S9FecTE7sR1b3zdb/tEbXhBDqtgiwPXjJPSHK3io1MjYT0FFRxg+WQbSzHdFX1LuDFv4ZyGAwN6O31rTqIF2rzV8E5tTH2pOYe3qPcx+pNJXgfFilLTgAGuYKuNXldaq+vAr4MfTGs9Ada7HvzNj7Zey1PpmxWU7QkFIkM9u2swIJZezO1h9fWE8PwQP0uIdN3a7MJvjYu178SPvJCqlO+oXef/zY9t7CfbghQOJiIaQCoKgFIXrqPww+D35+mHZhFygeJV4quJ8G0HMA3VeBe6GG/BlkHm5yYNesR7Natcul2nCyv+9ghC2ymYg7cqP0j3cbBby1nV2+P49YIA4lY75MZ0q5XCi7gTAwz7eFMatUTWNpf8WxpLSbizSxNMH5cCn//z2vhIlSF2W35tAeKsAqoep8KxF5VWX0R/OY5ccuncDIEbYxiN0j3kxGM4WnEXV9IM1THPHFnYBalScNHykLNU1EMxG7elqfCjLDLt6dXF5dw98gYZmxmArtApncDMgOqK946pUcgwpebtOKFFeLozguAaEkr90YFhXZl9e5LG/wQuthIULZkKUSlpF4vtomCZieHeAxZNwlGhcH3qEgP0R9jq6xCzjx27xKqxf8TK3RGe4oCxmpLGW3NYMOzyvH16QVhdwowviLpM6k2R/JAg0JiKRqUY57/RNY+zx0AJWI1t/zWTu2ue8bNoNmrsz3qFNqbhW9BQtY9d0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB14118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(52116014)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OcUsY6IbvBW32BzP4FhBCIVROdKz2IJsmKpo/2303RDWRNTGD2SqjFTwhnLm?=
 =?us-ascii?Q?i/S1qRKIN1VICOS8W9536C4WJ4FAl8iJSq+smViOFijJy/b+V/v/cL+Ievtp?=
 =?us-ascii?Q?QMfSFS8PRXWQem74mUpVxs0PWBy5BOrxNKuR+Eci9CXbcB46IQw+2efTrPQt?=
 =?us-ascii?Q?AdadFzPAcypNF3qu+H2vRB/P1Oc3g7lO5QazudXT5V/H2pxkesiZCao+EHfS?=
 =?us-ascii?Q?lk6/CsplyEsJZfrHvXI5rMJweB88ywvquf0ZIcQ7ZbJ9mbtVKph0vxBYc+rr?=
 =?us-ascii?Q?vLYzfcDEUypbMetSQlejxNhRG20QClwMWci8G0pk0c+lt7aQl0FvY2de45Co?=
 =?us-ascii?Q?knlkWDRjuh1tkD2T4bw6otRvnHeX848drEoOYu+MRJMZmV4GQQF4Xwsv6Moe?=
 =?us-ascii?Q?OczxP6t1Byo+qw+kHXddNUN0tZapYNMpxZXDssri6L7FPPVA1NcGsIbwdGLq?=
 =?us-ascii?Q?7/H0FHM3eISsr5NQcMMPXpMco8obx29NSd1Z08/ill6t5yufCoU/+uWOwXBd?=
 =?us-ascii?Q?kHH4256pxZE+16PRH5Cp4VWVzlGRlIDFwV0kxUq2d+r6R6TouYgeE3DOKpVT?=
 =?us-ascii?Q?XlB5aYkkuTwXLp4iU5iRxzxFkJa7b7A9zgdkiTtE0Xq/Tjx8mhnMt9c6eRP5?=
 =?us-ascii?Q?nMN38sALBHQ4ECUPUUsotxIbwUjLM6mZjyRNJN82r9ipHEHVq8wi83gJgszB?=
 =?us-ascii?Q?jMJl+HD6Q2yQ6KPC8OJzoUfRYDn4xxsTd/QMc8RDwO8/yj1fJg1z4ltbzHiP?=
 =?us-ascii?Q?kpnjhpCjoTchpAE6VdNOuUTHhPkFyX9wecpjPiZbt60IsSi1f6SMpzgk/ySg?=
 =?us-ascii?Q?YklK3omGAbY47Rjq3h6U+ZUbj+kfFNAkF1H7AF+OC3ncr1YFqnc+NTnO+jy5?=
 =?us-ascii?Q?TET6+DMAdDI7BHovZNP9yPqgdc1AHJuln69RjAFAHv7+NWVrcYb+PNxbGA2k?=
 =?us-ascii?Q?f+j/pRVT5Q0R1b5bQHMgt/7gSddMgc+e0EeC51+rGRl3feGr3/V0v0ONfSYT?=
 =?us-ascii?Q?hefSd5AIepWp1yNIfgjv79nZeVAZay0WrUhy8kO3CRBCcAwStA08my8Yb/mB?=
 =?us-ascii?Q?JaB6kKcfStdz78/pUNjx4hAR4XdY2iLFMPqTTWIiyaoJVk7wgs5LrnoshacV?=
 =?us-ascii?Q?gfB9njhtJM7cmG1EqBB7vP9K4CKtK8kMuCIJELygUt8PSZCL1Tc5NiID2EH0?=
 =?us-ascii?Q?yUl7ogR6FF9bJtectfLOWTopobeI2b81DHsO7HAqCBE75yhzjrFYBLwr7wtS?=
 =?us-ascii?Q?s0ay4QSFzv5HaiuqUREIktu1f3AblIBBfvND5MROFQt4IYjxr8hPq+4HsulA?=
 =?us-ascii?Q?w695B3sBdn051h1nbRkMbQTwFW9D1djsRoV97JgQfm+tlHQ/SGjDrf2Y5mC9?=
 =?us-ascii?Q?zPtdqUDF7bb4pilLZgPpfiJReDVg0MqRKvNNrlULcZIUGPXc+LhwH3SxILoz?=
 =?us-ascii?Q?Ddwoxyo+5RMWPvSRy3gtBFG+nvVGDKQUsk05RmhZ9LKEnRj8Fds6eP1LViEE?=
 =?us-ascii?Q?HR5HY7LmSN8CelMvyyOnEI0QuK2OZWZrIjb0qrt39+j/a0hp2mqSnpj6GiWn?=
 =?us-ascii?Q?uACwU0jElL6rRvJA+GN2xSus6CR3yLWTV35mL8wTruQIJMB2lvQqbUrWrSSh?=
 =?us-ascii?Q?OVAIVtImchpEh1ZuDPyrr+VstTq+txx/RsybrzmVxPMZr0WNwNhr17R6rmgP?=
 =?us-ascii?Q?pqzDRKCJRP+cqCNE8PyUfSMXRMfdEeljzs+VyhSbjlIOSdtBTJOVkMh7Yf8h?=
 =?us-ascii?Q?77P8kUZC2qsqjUwok5oxwO5HAwej4dzu0MPhXBzXHr5xwmTzbc4i?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5525f454-a919-42f0-0fea-08df15265419
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB14118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 01:44:07.5320
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rrICDXsEQK/cOxKGD6aP5I8wPX6zpj9sWm1t7M4HZ8w3igT/eEbgufjI+qwWuldJI3ZCpyKAoNEoJH5c0cpOkFZWBx1YhfdyG6o8QZ/ubRhnwDBOA4VC+m+59ekxJ8LR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB18388

DAI parameter will be capsuled soon, will be not enable to access from
each drivers. Add snd_soc_dai_get_symmetric_xxx() to get symmetric
param from DAI.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dai.h |  3 +++
 sound/soc/soc-dai.c     | 18 ++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index bd714c3bbf3df..fc23221766b63 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -563,6 +563,9 @@ struct snd_soc_dai *snd_soc_dai_register(struct snd_soc_component *component,
 void snd_soc_dai_unregister(struct snd_soc_dai *dai);
 struct snd_soc_dai *snd_soc_dai_from_list(struct list_head *list);
 struct list_head *snd_soc_dai_to_list(struct snd_soc_dai *dai);
+unsigned int snd_soc_dai_get_symmetric_rate(struct snd_soc_dai *dai);
+unsigned int snd_soc_dai_get_symmetric_channels(struct snd_soc_dai *dai);
+unsigned int snd_soc_dai_get_symmetric_sample_bits(struct snd_soc_dai *dai);
 
 /* REMOVE ME */
 #define snd_soc_dai_get_pcm_stream			snd_soc_dai_pcm_stream_get
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 69a3df3c56a80..9787d7913c308 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -1263,6 +1263,24 @@ struct snd_soc_dai *snd_soc_dai_register(struct snd_soc_component *component,
 }
 EXPORT_SYMBOL_GPL(snd_soc_dai_register);
 
+unsigned int snd_soc_dai_get_symmetric_rate(struct snd_soc_dai *dai)
+{
+	return dai->symmetric_rate;
+}
+EXPORT_SYMBOL_GPL(snd_soc_dai_get_symmetric_rate);
+
+unsigned int snd_soc_dai_get_symmetric_channels(struct snd_soc_dai *dai)
+{
+	return dai->symmetric_channels;
+}
+EXPORT_SYMBOL_GPL(snd_soc_dai_get_symmetric_channels);
+
+unsigned int snd_soc_dai_get_symmetric_sample_bits(struct snd_soc_dai *dai)
+{
+	return dai->symmetric_sample_bits;
+}
+EXPORT_SYMBOL_GPL(snd_soc_dai_get_symmetric_sample_bits);
+
 void snd_soc_dai_symmetric_set_params(struct snd_soc_dai *dai,
 				      struct snd_pcm_hw_params *params)
 {
-- 
2.53.0

