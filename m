Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011064.outbound.protection.outlook.com [52.101.125.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D00319ABD1
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533920; cv=fail; b=PPmrHX9p0A8IVDxtneWj93nIgZ2Y/FFyACWvY/+br8AW8HBvhUOokGfj6BW6nmBwELa5TZ8A0/AUEfIMVcG/dJuzxB0mCfDRGS2qWh9TZhLP31mO+KkBiWxGlNkmBCi8vg2sDR/818D5sja5yZRImECd2FI4cAmfvBnrswF43qE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533920; c=relaxed/simple;
	bh=7w8GJ7cKm/fcPQuFPbuIJOPjalpvZVYYSgykprP4q14=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=t3myQljmIfv0yX/lrBp8KjWMhzGormdVpoT5yTNBTcTo6TdLnp7LgZfSRSG1z44RRp6KUIvIkPObGb9j31ixpkQ4/crGLeTxqWVTzLN9hmM3N0BNeon78iLdmSmXfq7IpQYzGEYm8wnbs27C4yz5wfQKPkhVdNYRx9mUfd462a4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=IrDBeb9k; arc=fail smtp.client-ip=52.101.125.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="IrDBeb9k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dELEZnwTcMRoJHsA16DBODf4VpfZ+CcKMwDSNLW5qSqcSXC0h6T/u8zFQ3RdBTgsDJfMcaKHq1L4QWx6rE9nirr0F2Ou8pPwC/c8Dyik4w9QA6STsusm5HOCz/PSDuLQvdl5SlARkY5ZMBktN6IspF8rjEEHfxaVrjVhQ1tQKibnB64NMWQx/32c5ZDW/wMq5diusVV4yNIofMMQQzpsq7lzzYgPs81zIM4rMUMKnlviqopvlUMrq2kTwUbG61rn0YNyh0ox6XiTGzfc+KrMoCB0HsdeMYwtFMz0OS0vNAxuu6flrDn2Ilcy8/9tdh1/KroVF8xrMTgyb3o/NM5vuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9hM+/aIee4WU0PzDz9WCkvAH/+TSCkveE2EmFpyTzkQ=;
 b=dmAwY0vbAq5cOitx5Qw+HjCd+z1uPlTj5fepip7HwjK4sf9b5YAtBg2uf2vXjpfcu6soA1EQQf/LGVhFEy60oFAlzA7F6b4pomMvtoZPpo/z5LPkbOWMMG4ibBCeSvszKTdITl54X1bS0XlCfIQjtEFkfMPm1W0LRVkGRBuyvvvbIgzrllcqNFX+xquWWsKZrfq1tK1Ai32fQ5jeFLvdVGn6W2XYL929MRXCdgi3J/E9thAAX+f/078nXOov4mgZ/1AT+GqnC/BOTW7JV4rJWuTQcK282hp6ZDqITw8PIyktMambBEPyqFKXNvao4w9gVdaPnk1tyshEUf/nvxIoAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9hM+/aIee4WU0PzDz9WCkvAH/+TSCkveE2EmFpyTzkQ=;
 b=IrDBeb9kV484THLj4XWVM1aPuYsLWErQYZPllV8Q8iLA+8vL1mWD+Xu2Jt2uffDlAuk6hnMooErvCTXXFloBEmnGJ3jLXXv8Q05+kRgFXAQ6WssXTA0E2KBgz2IUSBnxO3fjT7dSWa7BhkDTYGesUjJK38dOLEp+GlFFAizOgF4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB8864.jpnprd01.prod.outlook.com
 (2603:1096:604:15d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 01:38:35 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:38:35 +0000
Message-ID: <87y0xt8oyt.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 137/157] ASoC: mediatek: mt2701-wm8960: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:38:34 +0000
X-ClientProxiedBy: TYWP286CA0010.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB8864:EE_
X-MS-Office365-Filtering-Correlation-Id: 207a7d15-17de-40b2-f18e-08dd560648f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xR75aNkQRAZn0lpqbwdAMBUbp8mHyDjgsH1GMFbG/Y3UWKfpuS4PUGiunjn1?=
 =?us-ascii?Q?19B7IYgS2qtxaXQcxIC4EJS7YGFaqvDNAJnQj3iy6isuo5IUP4FVqYlNBjXU?=
 =?us-ascii?Q?gMzYihyoe7wUaEeS8V3Wf+dXYYBrBVT7gb+j/iNPcig9e9PmL+L8hrOeeqtN?=
 =?us-ascii?Q?oTmVbefJVU0A1Z6L2IRdawQO5Ecl9LiXeUIdwzfRg8F4geXBXUscWQkkLk7d?=
 =?us-ascii?Q?eynNUnnZnhQVdHPZrZEbuX+RMstdypgSpRif/ynUNnNM4GhoU3A0XQnN6Azf?=
 =?us-ascii?Q?VBsUEa/VVC//7JKWpz5INpIWoue/Y3ynnSKWEmbmoA+bFCfGlrc0f+whblGN?=
 =?us-ascii?Q?vu72cSZ6NSYHrt4ADMJhWjL77HqjxeyRziKuVqoh9sbFZI1qLv0yYcbX2EfC?=
 =?us-ascii?Q?enq+js+iLWt0kATh5zkqK4qUGnvTKrNtdsDZ5NO+0wB0jDryC+OyQSwunWYS?=
 =?us-ascii?Q?kppQrzUDU7maerLITORysnXK79QDXkohZVh04Wvt1qijFRYl36FBob00wzCR?=
 =?us-ascii?Q?E9Lns787RKcrOMXPvgPS5gxVGOYmTyX8ALx0TBZwCfdr3AOUqR4FZJl/bfLB?=
 =?us-ascii?Q?qU2k3G5O7hgsyemtjFLQRCZPxXCKl5lffp2/GZHdjyfo9P2fsStolPgVQ8YK?=
 =?us-ascii?Q?aFUgmiY+aG9vYH5lTKtjTxPCyNA6ov+1DvoiLJ6Ad6SonRnIz72hBTN1jY/A?=
 =?us-ascii?Q?e6GBf81PBQixOPERuBHqGh+atlq0O8ZvKg83VqSK/s0VM3d+NIw0SEnQ+rKM?=
 =?us-ascii?Q?6Byk7KwsYrxOPwBNwK4NgtHIn+HVj/NsTKrJpVfVGFBEu35PckbIRl4LO4K8?=
 =?us-ascii?Q?kliPnaHCiOqRtfGDGjBGUfgFNIfU5/2yHG+CjOBH7sGoKzgpFQqlPePMXpzE?=
 =?us-ascii?Q?WufX2peb2pYAdarxwLosShxh2faedr4yPfsVENOA2MEVpBfYehnOyD+S5JpB?=
 =?us-ascii?Q?uzPDEhUIUU7Cb7fofyLrJPHNggBvgy5OvPaDVzZRR1iqVsi6pq4ac+VOrfgP?=
 =?us-ascii?Q?cqtRP1HIEctdiOViV+NtdnWy5yxovYrmVTm20qQBT3sHnsdSDVLsV65ilSo/?=
 =?us-ascii?Q?1H4m+6ZFxa31AYtvSTaulDd/qUgwh1HEoJirXg9BpPXQlM7eKflZAmP7INae?=
 =?us-ascii?Q?0dKFxqrCLaeOcTcY2HHZt6K39JD/F+CQjc+ETeD6w7IALJNq8OC7Fk692Gz/?=
 =?us-ascii?Q?REyKno1zZnGrnVHXtGrQYh+lkYXD3fUaicf02tj14VD2zv3Zikk9jdjlV4WC?=
 =?us-ascii?Q?lEwq3CJcflVJVa6x+E6L94plJ4cSJHboBrqENPOCcmMlSNRNWX8s0tu2Cie3?=
 =?us-ascii?Q?bFlLdS4MBPDOKmheKFz6WGNazkeK/xSwfSuyrJs9LdnWLgt377Mmte0sJU/q?=
 =?us-ascii?Q?1/Kp06JopuPd5QF6lGhHl344V+iTazqDbDWjPkWJ3RR+nyA8teX6oCgc2FTX?=
 =?us-ascii?Q?SxbfsVEzsDANI9rN15fzXqYC4+KqRsi6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zW90ZoQu0HFZLx+rDAPFTVeH0Rk421XxXsszUleTBulG2zvEYj+stHH97b4z?=
 =?us-ascii?Q?1PuQU3VqmvtM+h7IeMG6fgWhH7lM7QyrZ4DodWEA+f0l1kQSXiVQ2NKATc5l?=
 =?us-ascii?Q?wCtfsQSaqvGwEnkSULbZE4sH3Cihac1MtjP5NmkCFYgoSdTV2iN9nBABde0W?=
 =?us-ascii?Q?4dpJxszjLLJ2+VQGI0jFa2Xzk3qAB9chDpgC/oQXfCgofkq4pCxcglMqkVdP?=
 =?us-ascii?Q?O66gW69RAt1oGVRkwCrtUcK6BBbF4t7S/oouqx5M8hAJ5abHdc7quusSm7QJ?=
 =?us-ascii?Q?WO/mf9kK63tCkB/5wfPsMNvDuJ3ni1GwYa8zyi0OpuV7i1dghDSeMhHh7AM6?=
 =?us-ascii?Q?5iQMUsajgRK0XezuFSsUn4pitl7FbJwZMyhyUub0Hk0fGENS9pTrT35/2O/t?=
 =?us-ascii?Q?TAmTuAoe9cql7yTIA6zmESHLd9u3VKPiF7oJhYLvNx6enxagh3G8f5X6jKlp?=
 =?us-ascii?Q?b30s84T02ws2qA9KEteEQVVCNX3EewqDYaIa587BjeF9Z0unIErL7n0szEkX?=
 =?us-ascii?Q?R7vs/69DMVihkqGZYgf4ckwi3obJvAKNoxkVcNKpqmK+XKu7wPhZ9u4+4b+e?=
 =?us-ascii?Q?ELwpWlbuZVlnwE1rdpva+/skS+h6PFbO0TmaD6LNozCOiCLQTs0DvIoPvGPx?=
 =?us-ascii?Q?ky6y/0JCrCEjc6JxT0VSOZAcFUUrc/K6dXFWo4Yg5Kf8VcIz7GVeUg5j732o?=
 =?us-ascii?Q?uNedv2HG01h1cIkEC0nhoGJVn8fdoR0qugajtLQKB+xz903H65sqlSZ7nTP9?=
 =?us-ascii?Q?u0K4ciEEqqKPhs6tbii3PBRF+bo0lUL+J1JpYsvrndt6WfAuSGBiqvFqArMi?=
 =?us-ascii?Q?AYwy9yl7YGuDzweI299MW/6Msgbuu/Mj4k0tt1mBFLFkAEaiLnt11l/I/Ofb?=
 =?us-ascii?Q?sAC3jExgEpikdEmg+Z/q8vSbJKbev9CuzWyOXh03Srk6D8o3gdDs3YqsSwal?=
 =?us-ascii?Q?D/ysEZwuYF100rySKmIcSA+16nNlGKG3k89g96f5xyGxph6hj36yVuRE/UV8?=
 =?us-ascii?Q?w1iU9iI6R2V/8ldevRbiSRa/U496s6+DZfeAMPBeb3UIijyxIXJKhAk4La45?=
 =?us-ascii?Q?+BAdnALehzmqA+w9Uw6G884+wmyovum05nZhd2ElwbaqVvXhhtfOwYOqaHRN?=
 =?us-ascii?Q?3rg6LfJ45t9oHLZyc9Zo2Wv62MStZnwhz9RCIEu0QjiJ19+erpNdgWi7eM3/?=
 =?us-ascii?Q?8n12e4Pv8Y6Hk6j85Q72pudcKfOWsXv21HAeTFK/NrYQdgHHoZIGnvrdqKix?=
 =?us-ascii?Q?GhtyRDimDDZu+Il1s5VtvvqEX2t4x0ZEODEDxeu80I8XgfVTelnz9Fk/NVj9?=
 =?us-ascii?Q?lelKAg8GmFUgT229tOvrOu5ptatUdJPtxE0eiRgKknRR052EW163e+AcMtSG?=
 =?us-ascii?Q?8X9u2eTteRPrU94EePs8ooWDXFRIY4oMvaAWb/fgU8RmitFjvXBgj7/Y/z79?=
 =?us-ascii?Q?R05OCpdtxEUmKFT0c7VMSN1Zxfhgi/YPTnHgrSzhzmj+lLFdDX+oKMx7km1d?=
 =?us-ascii?Q?GEWPksrbgaNlLM4iIlkiRWyDYgIZKlJQIU6SpIGJIZeIRXmIRv0GoYM3vLoj?=
 =?us-ascii?Q?T7DbYNHHEVg5DNdfFqRt9uMJDnqJ8C68QS5gjp3T2tVC36FpPQ3KoHSkErSj?=
 =?us-ascii?Q?4nCsIZO9BEZu6uEydLMS8iY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 207a7d15-17de-40b2-f18e-08dd560648f0
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:38:35.1183
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ttNkdHkwZiEwyplGqG7s31IA0zgTikSZlYeQ/ks2wm4Wza3OcXkSnh2CxHUGW6IpkOb3uAhfULwSSW+hucZ0fIJ9jigKJde84MlDT2mWwMLCEXladAVDZvT2Mvh3Z73a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8864

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/mediatek/mt2701/mt2701-wm8960.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt2701/mt2701-wm8960.c b/sound/soc/mediatek/mt2701/mt2701-wm8960.c
index 2814f0570928..84b3d6cd77a5 100644
--- a/sound/soc/mediatek/mt2701/mt2701-wm8960.c
+++ b/sound/soc/mediatek/mt2701/mt2701-wm8960.c
@@ -83,7 +83,7 @@ static struct snd_soc_dai_link mt2701_wm8960_dai_links[] = {
 	{
 		.name = "wm8960-codec",
 		.no_pcm = 1,
-		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_CBS_CFS
+		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_CBC_CFC
 			| SND_SOC_DAIFMT_GATED,
 		.ops = &mt2701_wm8960_be_ops,
 		SND_SOC_DAILINK_REG(codec),
-- 
2.43.0

