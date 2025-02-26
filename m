Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010061.outbound.protection.outlook.com [52.101.229.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9EB719ABC2
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533863; cv=fail; b=Sa+hdXtTrSs84MN0SqTYPe6HWVOOZKvMnpjppdPzxxQU2nzV/gdOoKlhVpxrH3o7D6ofS8BaF+OZW1R81kfYu0efPKA1KFxx+BRzYyrcsUKOzpM8aW4DR8OPtoV3CQE+qyJDaiRZAGbN6j7ZKrNWGGhn8pzAl3lRpyVLyOwPUMQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533863; c=relaxed/simple;
	bh=LZg3mBbsjia2B/hxuEMaR7GsX2zWmzcucSBGJBWM2wQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=WyTxfOT4pCEOy63kqrr6KzLUH7j1qebaM+2AJhePB4nd40sHzIt8xcQzU8e7K3vzusNKZ/z/t8YIKiCnJS1KTb9SJW1wKtrY8hOy5TCg1a+UwBtl4kvVWDyhe8C0uGgxhnamJk8npNjjqcUJM4vh7kL+Ikhx5vFBtph1CEJKi8w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=a7koYwEC; arc=fail smtp.client-ip=52.101.229.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="a7koYwEC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q65jQ8qlDWVf6B1ZjUBhheZpiJZ9oFLFI0N+kPpBBdVKyb9IUWSNKZjZyU3GOkDHO/nWmF+0NMH/HIOYNO/yTqWWNrPaiKs5xOQIC64p3bASZa1gKNH4FQuZEP4Tp0zWEhSWdDFSK1Hf/oTZc68GJ6XaTtP6PQ5K/qIIVgEejolKKEdyMdk+BCncprwN9xd23SKuyvKFMwMvS3ZlTlN/G+o5hgq9boZNZkklxLchdsSMUpk3Em9bI6ylaE/Xr7Z2m+8+wpGZN8m5dcHv5s307cm+TV0U7phTQZ5S3hCVXVYK0++pcOqu8iKcJ3sIJ8TK83YRzecoQDv/7PjfMLVtGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TO0e4MHRGqjw2UiQOaB6H4QTKsbYDANa2H2rl39QUEA=;
 b=SmwfQ3nlcZRtK7ujC9Q1rlyK3OTaLO/L13u8R2SEkK3C1f63fjsO2eUow3+N0heYrEt10pfzMtUShsqqIHK3+mdGEzVSiJ/QPWifXQPlfy8909Vr/zvVHm3piS12iQmd7j8iBTnvEO5xBGB8jMvfZteJbYhnaLn0CX23ZDqwt7jATsRuAN9rgZ9Pyb0xQQli0vumMUvD6PM4bvldJnqlzy3iLvDaxgxf4hDAs25AQtEGNRhO9QL+2KPtH7H7AhxmVFjj0sLaZCE3JyIQi+HrbuCFP665HGscBy3xXfQZapFRVm6V8B0QmdgiEbF36OFv+yc4RWfdeH3irb5kxUaAqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TO0e4MHRGqjw2UiQOaB6H4QTKsbYDANa2H2rl39QUEA=;
 b=a7koYwEC9dZFV5eBxl5U8cA6FKIyIDNL0fhII3UAtKVNn3+riQbVjqoARcVCeOm2FbKDO6ZrgxpKNjyM3MjltX/JwLTWGtwC5ZffF05hP4pqosPBwVFWHyexW6fUCFFDc6f91aqfCBtc2vELleElN1M45RqT30FkNn0xHTfswIE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSYPR01MB5511.jpnprd01.prod.outlook.com
 (2603:1096:604:87::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Wed, 26 Feb
 2025 01:37:39 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:37:38 +0000
Message-ID: <87ldtta3kt.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 121/157] ASoC: intel: nau8825: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:37:38 +0000
X-ClientProxiedBy: TYCP286CA0126.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSYPR01MB5511:EE_
X-MS-Office365-Filtering-Correlation-Id: 353aca01-acc5-49ed-128b-08dd56062764
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5LR2RwXrD+Gi86PA53j87lgAZQLwl3spZ+mbssbpSn4n1nbedXPVQ/FmfmmC?=
 =?us-ascii?Q?S/yRC1Do67wKU+LWYbU5578pTfpdeJaeD4Lc0CQ+WLjPM5D8djW0gIHQW5xf?=
 =?us-ascii?Q?jJqUK/kykhkt02zF2Q1+MlKdXTtBWZFG8dKXveGy4YnNPHihvwJ7p3Oxzla+?=
 =?us-ascii?Q?ErV+EQsLLeTb+DEOQ6LZalVTDEWGdK3kMtMTBUOfF/8rFjwolxvJ6lh5bHEd?=
 =?us-ascii?Q?/DphJfZnCXQ/4nEu9USxq5uHBvNO/R0q1oyeq46oxXOrkhIz857Rwnm3nXNR?=
 =?us-ascii?Q?XLns9LPir+l+GJDRkCxdNgwIodFr/mxMMhUwkcNLC+bfeAIp9bc5ZXer17mw?=
 =?us-ascii?Q?rfHe00WPy4CWxAuqoTfEUBpdouDHlSfm9lGEhXjoo/gID6WzKRmdXK0cUl9+?=
 =?us-ascii?Q?bYUxzsNgfIRtZ9QJ3zz9anFVYYdxP1aCA833Y2ORDgLGJOI/E8pP1mm4FlAA?=
 =?us-ascii?Q?uSRLtoB0zx1s2nB6uLuS9SwUrrc5Ve0gZ7/yVgAJ2kHbAzul1sNQtavKu5PF?=
 =?us-ascii?Q?BS88e/noUaOyfmS4O6qdbbBH1zczJSCgNZKwVAauGRXUDTs1i6BZopYdTrJ+?=
 =?us-ascii?Q?tOiVLLlV0seJ/2HcCkcjXgRRYEzZF1vf0h9R2Yymgz4FpM+DW4DVbErFeqvg?=
 =?us-ascii?Q?t1eZr3KxXG3PXzn6w2H7TMpHFU/0jdziCQzspySVLUprUtZuaN814/7C/vH+?=
 =?us-ascii?Q?Hwf7u4FxF4Akl1n5wjSSOFiGJFJrXpX+mr7ct9Zt7k2H4sq3i7az73XmPadK?=
 =?us-ascii?Q?XSmM/g32qFL5wHXTQwaKFOA0MLbRabITKBjr4wDNtWvOu/OH/jPO3dlBcYaT?=
 =?us-ascii?Q?i/XKtLH0DuNQMzDNN99M2PzP06xLaQBUvSGl/isfrjfBAFn58p5fk27RWrxr?=
 =?us-ascii?Q?8lRHXM/jNp+k0Adk2rw1KUuu1GW/IuKfZPazVNinEFp43TGPhoIzKXPGKxoS?=
 =?us-ascii?Q?LQvx6YcpC0B3QqoYiOOdrmE64kvQN5BVk7z6o9Vf/QAAoDaaCwILHU6CVvLk?=
 =?us-ascii?Q?ln37vKt7oYSS7kjb7uz2UbqjXeEer6Wz/GSQvSClXFs+Ukxt5wdUEnJK1GPM?=
 =?us-ascii?Q?AsRzpR0X+zjW3dewBeTVIAcT2ZFwbRKe6uNydDJ6JT8b3h/qKy+6/jvDOx/1?=
 =?us-ascii?Q?C1u76KQogyD3BBbp7tQSRFignXkETtmqfp3bMzHX9bMlul43T09WwM4TfqJM?=
 =?us-ascii?Q?+16a/KWDOF3jDaHTlQ3iQ37Mc3ZhNEqTh7i9BhG3SC0zbsT77srHrzexEWsQ?=
 =?us-ascii?Q?OKyDXDIPBnYGDmuswtFH+tBZl9476Nu1PNCx0YBTXdjH0LoAs1V57krmVodN?=
 =?us-ascii?Q?+Kq9IFQlnkW+eoycCCBgQRXpyipZIadwJw2mxGEfVZGsUrTJG7eAbG/SwAsu?=
 =?us-ascii?Q?tHsozmI80EtMQmfOYeiKouwqp1AmRh7caSKcX7S/XLGXOdHDxz2fcIbA7Dyc?=
 =?us-ascii?Q?0aq/LlmIAqk2NBCDvvXvdnCxpFAQbFTg?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NpEOLC2/jCXwtx8SKoO04tw6RZOjqYhUP21wkIIgysSC2BoUo806sWN4vNBG?=
 =?us-ascii?Q?JrCm2Sjd7r134eXq3Q8iS+AIEKoOEMuG/ZBlDelyT2EUbIZhYAxj+mTpSGmX?=
 =?us-ascii?Q?OPWMxMW+Rd4PUsprVVXLK7OCJAZSOdjgruG653oq59KEstc6JQuLgaggYWFT?=
 =?us-ascii?Q?WibTzfs6F+E4mkm662mcC9OblclJVKLECNWjiOOkqlgllnq4BfF9JaGrLtUv?=
 =?us-ascii?Q?Q4pqrn4XcswUbyEDfQ7uBjui0SIiFB+xLFK9hE7vIbCC5v+FcMBVXmVQOjEp?=
 =?us-ascii?Q?TOLRLS5THVsfsUaHjrOQgniruxT8/RCKWUQhtiir+kUDt4BOwidZ6T9VMY95?=
 =?us-ascii?Q?Uq2GDo5zlKh9vWN00yUg6Oe78K+SVivH8Wl5y50hmsxQVsqjr+gDoK2/Qlk2?=
 =?us-ascii?Q?mnwt9aS4KDtBenRm5lgA7HWsMrcla4wO3plchT/f/qwjecjpr9FxoS/Y+pKF?=
 =?us-ascii?Q?jZe18c21WSkKK3Hbrv6F3fwv5bgiOxXCLR6xbAA8nBH4Dsm8+/FNzP/n5v5z?=
 =?us-ascii?Q?s8A+LfAPrPAdLzjxo4X9c4/KW5VHR+a4n6LXbELSOqGcg+EgEUax14r1tJaL?=
 =?us-ascii?Q?cT2A2hAb0i4XQgYV7i1NHeJPXZ0V1lmhDzEpaF1nW4dbVd9oPgnW73Gh+Dl+?=
 =?us-ascii?Q?TQN7CocL9dKmntthNPTj44jLZ9f37ntE8CL948cJ4BTbf+eTRtMHnBpslWLg?=
 =?us-ascii?Q?yNV8Mk9Lfm0e0+0GuoQ2Sd3o9tz24Ex2GMPbuS1uDuOhqgVW7lwWxTtCzA54?=
 =?us-ascii?Q?I4QmOE6HiZPJvm2ElRkpkWthzmm+EqoGJEQEe8X7cCa9UpRjZTKFeo8skQ5x?=
 =?us-ascii?Q?oEE9awj7TGkIgPwHrL66l5i47RX9TnDfyB1dPU4XB+NKPCpuD/G9wp9KVjke?=
 =?us-ascii?Q?2txj4wcRnRtTcvEFXZat69kPK26XttRqV2eU/66fInkExeTr5tiZ0dmbFPT1?=
 =?us-ascii?Q?oBp729WBCGWviSe5N0GEIYOuk/YedFX6fXzHbwNjXjHzGpmmFCNXtDdcAbUQ?=
 =?us-ascii?Q?DJmenAtyUFUPau9+uldnFeX1ikQDJocQq+t0QOQZW2YNQtLdAEeEeeo81+Rg?=
 =?us-ascii?Q?yTsWTNNtAGV0unasoIxLYaiFwIbn7JFQnkw9rOqwjhINqLtzkB7fe8MhvGDv?=
 =?us-ascii?Q?Hu/wW6IZBS2zt+q1GNvGmSem/uuqpHwDeG+QzJelPlVJH5sjrsow+choqwPY?=
 =?us-ascii?Q?XQHxlCWSn4Z4lbR58YD6NXSJbESY1yBNEqD2/707GPp3gt+AX51H7fyPF0cb?=
 =?us-ascii?Q?LKX/7NVUOOhAMVvj0keI1C1HAqaq0pDzO2cNLoU/KA+Thq9ez3wjCt3Gmv+U?=
 =?us-ascii?Q?SpixZiavWLBoXReZAa23jc1wcqE2+Frz1Yurqq+pxEa6NwjWGU+Azp4imAKn?=
 =?us-ascii?Q?CVhna33UjeVmaQ91GA6WO+pCjB8Wj36uLfjRGJfuKkq89bTX7ipR0S4CbLQQ?=
 =?us-ascii?Q?nWDJgt3yB9/1KVUVmLbMpPiTLJZrxB7hUwq8pJeeWpj6jJyKri+ZJowskdga?=
 =?us-ascii?Q?UoqtNzYmUkUvypxCrASHXNbnp23pkfS8ePA9RA9ppMkG4EMClXADN15FwlWZ?=
 =?us-ascii?Q?HqZD/HOQhHQnaiMaOqPtf5oBXXwBAF2I9RNnp6CmH9XSGwfy0j9YY/RZqnQz?=
 =?us-ascii?Q?rei4sj4wnc677tY17rxPVI0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 353aca01-acc5-49ed-128b-08dd56062764
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:37:38.8537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PISOmMjnFoVmruzBcuZp9EtpEaBlQSP5FBCM1m3EdYP+Tl8kgIUHNMFlER4NS2xxAiIhepVTTVbIArCPA7NL1wurFehaqdf1QZIWBcMsc2Al0rEHcoVS1ecreVUl/Ya6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSYPR01MB5511

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/intel/avs/boards/nau8825.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/boards/nau8825.c b/sound/soc/intel/avs/boards/nau8825.c
index bf902540744c..eb3287b765f4 100644
--- a/sound/soc/intel/avs/boards/nau8825.c
+++ b/sound/soc/intel/avs/boards/nau8825.c
@@ -203,7 +203,7 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->platforms = platform;
 	dl->num_platforms = 1;
 	dl->id = 0;
-	dl->dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_CBS_CFS;
+	dl->dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_CBC_CFC;
 	dl->init = avs_nau8825_codec_init;
 	dl->exit = avs_nau8825_codec_exit;
 	dl->be_hw_params_fixup = avs_nau8825_be_fixup;
-- 
2.43.0

