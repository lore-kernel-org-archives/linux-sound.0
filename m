Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010066.outbound.protection.outlook.com [52.101.229.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C752198A06
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533854; cv=fail; b=qoLR7ibJ+6gRcy3HGgIelV9ltGFjLGmwKPDX25dajtldRZ4/RIw77dY4hRq4I7Y4pFmq5xfJBky6k8yd2ZY+XZsxzaZD1ONCqGVMCKZxBMhURYsISSa+E6BGQS5Uo0ssRgfujKAWPhrgNpuGqT4Oi6HpAoeGL8O4Lk4WKU9X7C8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533854; c=relaxed/simple;
	bh=BVeGE5OF8OQdKxKvmKs9tSnviE/2JntcQQpOicXn9Y0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=UPzDaRzAMy2jwClGgyOL2Fuk6a3y2841SJccfHs/a098Q7LNh//iBv5MiWU4+CSmuGMioSNeU1lnARKSiePAghw8j0QJquRvdlf++Tn0MLt4cII2L1z9/kfK7pBpVxGAr9p0beZ8awQLMIKjDMzx/IJFrfAvIMPOTWTOkAfZ+2Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=RhFCmsg7; arc=fail smtp.client-ip=52.101.229.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="RhFCmsg7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wzDNmuAGBdGlrWPts+rUNHkc6Mwclr513NqZeQpZQNo219qdZj9X8X1I7usuSAfK7l0iw/L5f2gBgZxRqFHU2cr8x0dfk8dgez1/7xshRJLDt4fyHzmZUrDdtGEdKOQyeIbUVcIbZlp5U34ebal/S5ofv5exEI8cDQGN5L6ADT+hf75PrGVkB4h2UsBBGeDRABY0mpAawKH0Mvbe9D0+vlweQ90afLeG3l0dUVe/DVgm5PGhyTjcfvdSE0GDwVrKMf7IquMGFaaklpKSv5hxKyUnFPLu28cHw6sl+DtJ6k/lm4aBoeGIo+mxRcUyWQeL7qf3rNMvWsLo5V+MXvnM1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gc2QZELNd7yxYRmFJSvVHvCBmZfC5BfqgYgC7VWLcT4=;
 b=pILHxH75SD5YZhdaMDadIB78MELxiTZXt2aRTCPtwG8nLMrRgccL50LdeHemX2B/D0rA5zuxMGtzRRpcuxDDH9HfbUc35V2W5V15va+IFx79SmXWRhxYd25gnHNwEeBLRx8++7aCydLQhRokasWIqGH3DIgAVgh50IFEmp828I3tluQDNT+Pq/HEbXlhPGnZ83AadNHGLMp3asNkl1lV+HEKwHgSU2HlqXcSKNoPdM/ZKwaHeM0VWldEeHcIcbDPd/LOlq5bymAeAq78R231ytwFlSP2Tg56pO3jjbWC5CoH8t+VXtq9aZ8xDXEmXgyF9hKRuo02H9jzmKAZZZPaMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gc2QZELNd7yxYRmFJSvVHvCBmZfC5BfqgYgC7VWLcT4=;
 b=RhFCmsg78tASvtvssbzDVbjaaPvVXbjl0SEH4sI0zeNn27FTTx6IBb+uXvjUwMl6yLINLJkmvUNmrB+EjC3C0u6CrGdXPQ6QR4W1qjks1Nnv+e+L+UoeqCS7fh1FyoZo8DG7B+Zb7g13rW9Ln7XwDgqrKSUH7FAXSp24aqIPD4Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSYPR01MB5511.jpnprd01.prod.outlook.com
 (2603:1096:604:87::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Wed, 26 Feb
 2025 01:37:31 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:37:31 +0000
Message-ID: <87o6ypa3l1.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 119/157] ASoC: intel: da7219: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:37:31 +0000
X-ClientProxiedBy: TYCP286CA0285.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSYPR01MB5511:EE_
X-MS-Office365-Filtering-Correlation-Id: e2fe47af-d2ac-4bd8-aa77-08dd560622e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qSGFli2L6VDYT51NDNAJWSPvz+3StDwbRGU00D2PXn86ms7zF3tNSmEXf78Q?=
 =?us-ascii?Q?dlCJmPRz5uDMw+oC4yIfJNB1/nunUKGkmiBEVHNP0YJT3itvobe+9AU3g8PZ?=
 =?us-ascii?Q?cePOrSIHjyXy5M74m2YJTBHBagmIDvZffW0K6fzEj2qL42gMMqk+c8CkVJEC?=
 =?us-ascii?Q?CbYlBY51uJ+cBCMxMDwkjwUK98jPC6sQ0940McL+v7mCtg+sJ8f3zxYrwzel?=
 =?us-ascii?Q?oJFZqLGDooW74qMq49GmXEBGWzWaXeK7tmwUrzcotfZ6JQfYe4t8MVw5Oi/1?=
 =?us-ascii?Q?0VpQfrvdrfJO+m/ihsKCQjMlE2g4T4ZGiRdcNiynCGzYu5bsjJ8aQYIcvree?=
 =?us-ascii?Q?X7R+ujm52bBZhunrnKdMKgVW52WG5Y659eh34xWPaHM6/NRqYCeOS38n60KB?=
 =?us-ascii?Q?wIBitwltOkm+yP+Av9ZSLDu+3mNriIBHFpVoI4H0PQP2isnxarbkv1OJHmdf?=
 =?us-ascii?Q?4MIPVMt3T5kw3zQZ43HfBAUgAKBdqvyJZqG+7ITX3rsDRU88T2X2m0JuaofG?=
 =?us-ascii?Q?9aRel6P+SkGUvs03/Aazw0pNWt1wYSPTB73uc6pwgN1DVPPmbNaL23mOT/2A?=
 =?us-ascii?Q?auYCQ9TWf6r8XD7WKGKfVCw2vlOB61zz6LvXlbe5ipBpnlqJombmp3E1Icpd?=
 =?us-ascii?Q?FjbrTXspJP+bTHjTym7S4prDlAtQu44bhUH1skOtRlsPfBBdLVWWxNXxO/OO?=
 =?us-ascii?Q?kQA6dXLJ5yKeGujRczqhi8xGEFEmLVP8cq8fgHI5yg/5u0T/Z6ZNIpuDJsJW?=
 =?us-ascii?Q?fKFtuhCFhN6tNbLLUOsRgLVkuV5pXotzehsJGuSShv5GTPzYc4MfspkXww+s?=
 =?us-ascii?Q?J3Xv9416EkhrlTI573UNZ8lWe7/X4worhDShctJqfLQ66jeCUZwtwjiYTBnC?=
 =?us-ascii?Q?KWAs8mynq/MsdRsapgE5meLrhgLHE4puJKPxLdfY6CHK3Bu3IotGuEaqbbd1?=
 =?us-ascii?Q?lkgmFZbAAI1DONKbJeQXR1/Lt7ghDoGcAPL1YjtRH1/AY4dBLdflaMsV0cE3?=
 =?us-ascii?Q?hLLHL6YWzgoS/y6KWIwb9t7MYRyy451NbuYcdmYEtbo6ukvrHfXA9elBugEX?=
 =?us-ascii?Q?1+eTPbDSYE5E+ObuGmJuVWAVC+PtvOAjRrEWPizqfWVf8mo6XjSyDM+v7pGC?=
 =?us-ascii?Q?vecjdVjiES+s7R/X0f/5OwBSs+Td9geedp2u0SJSBqpUADbcP4ww1DS22JhA?=
 =?us-ascii?Q?rUSLZ7vyaDW7Ww4ve4184KIC1x0yNqVticgu2YBZl22Yt47SrpXk3BrvKZZi?=
 =?us-ascii?Q?9TDavNDA4S97Ty19O+qbQDCrNUa1Rie5PyDUaW4W2a44TXwgCMwJiu1tMN29?=
 =?us-ascii?Q?Sj84pitoOQkBQ5pnmCX6DLlgpwkap2uwl9CBEhlLy14uByzvcub7Ee3zdfxA?=
 =?us-ascii?Q?sMbDZWhCwnW9nm5yZFJ02MzyH4c1r0imItsKEs0j5XKNBEHHvLVuYAZhquoS?=
 =?us-ascii?Q?8RS9iBb/9bosv5bILJ7EnLYNcg2VAq8j?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fjWSmeTyhrBNcs9hjDwjgnXx0jm+JdPKYRjSt7chg+eAtCk6ngKZOfCGloWW?=
 =?us-ascii?Q?Q3Z/3Xlzzgo+ajqdOMu+JJy+HxsHuPygMMDHAqOGH+l3jrkFFW2pO5TVQCGn?=
 =?us-ascii?Q?hdWXZhLdBqlpB4j4qLBmcvS2Kmzm4798pf5syFOZU113AtuqkHBo8Y6Rq5S1?=
 =?us-ascii?Q?GlD5p0MUSLzXoMwXsQ+zAxIHW04nGs6UXGW+8Kg0RUMkPr+4f3O0Vxawzm0y?=
 =?us-ascii?Q?qjpbxBckTGTF44FUWuSRVclQzxkvY1/BKoPJ2gbT90FnWa8BCOBQdeItNS92?=
 =?us-ascii?Q?AWZYPn9iCYDG0gYvsMWPJMSuPOgY/GhWCzlPZPjNVU4XgWifteMEgqXA/9Lv?=
 =?us-ascii?Q?s90JCUqIsYkhYUh6cMpVyUTvSwyuYvJDjN6IcqWB1D2S7kKS20nJZpcM2Dux?=
 =?us-ascii?Q?lV3CrvQcLttCm3cC+hYmQ9hnuuelX/8xraNK/sBCvpvkKCBs4bSd036xS5vP?=
 =?us-ascii?Q?h/6+xfvEz2o0dj7by11zXBYEdMbHnrj6Ks0uVp7mpAW/xmR3u2cp+Rm9Z6Lz?=
 =?us-ascii?Q?gJvmrHOVi155pSNeyWYPMDXx28z8Dmtwj06HEn0iq4JXXaE91cJuZzhHvY9o?=
 =?us-ascii?Q?5xNBGT17QoHwDPjR4L4/jEvgsoAqlOnFgzIOrWO6iHX/NOGPJfNQZnNtyV4L?=
 =?us-ascii?Q?W++Bo15oxA3lgv5RFXgZnPsanD+7QG4/2iz+K6g79ttv9rxjBHp02eUAzn1t?=
 =?us-ascii?Q?IINKerp2g79Q+7jjSdE8/giuuawvZM0togAKcwRZ5Xm4S1eeIQq5gZP44we4?=
 =?us-ascii?Q?E4eQfsKMDOHvTMcYuS0a1LFLyvDcCivIPEOJzo3WVScE/g2VOqLLzxeTpxaM?=
 =?us-ascii?Q?G13PG66foaDWADn1yYnuZKcpWBzh5W2niSTA5gOZ7ilFYl/oXNQf2vkpFIEQ?=
 =?us-ascii?Q?gb762snGAYnblTtVpL3vr9F7Ap2AEaO3FQHa+D0FDCdh3JdlYi3tcrY0W+xI?=
 =?us-ascii?Q?EDF2nWvtOvxg1aTsFtKlnRdkRgdK92Z2W/9VQzENAvU65HlLjBU/Z7o5/3jA?=
 =?us-ascii?Q?F1tGkZySQZl1dYgJzWLMh6OlRxIQVrA5rhYg2Ww4ctJ5yr7IbrzqMrjWrD/G?=
 =?us-ascii?Q?yGYQcNhMN8WwerhuENGS/NtCIY8iIBcizO/t+eIKZzWekiA80mFhoGKV6ykD?=
 =?us-ascii?Q?vtI+RbG+sJ0b9jwiUVik5kXZ9eqKTvh6A9KyCOq2C4ODgslB7MVrsDhjhcqn?=
 =?us-ascii?Q?PbieI2FPeP3EKp7zuDnVRHtCeug+tvE90Ze4OfAVD9oFFi7kVTFdmVIQWrTm?=
 =?us-ascii?Q?H4wjK2mm7PUzJsmxS2AYdl7TllVFb3Ubwfkn9yx0d7TY6xZ0K8jMEtIMF3lK?=
 =?us-ascii?Q?/qYvGmTIykUzw9H7/0mjLb9kmmAGmOGVBaU0qPsAwGP0ap5j8AqfHzpiztnW?=
 =?us-ascii?Q?OI6z/Z6A2tmLFDPWs/gfrTZwikXPwC2HIrEFsWP7xvtAfLw2O4k8BMPs4lL7?=
 =?us-ascii?Q?L48Li+mMo6gDs20ISwjdAJoV33yvbGWyYo/8KZLlsz1d+L79RAbp2aq4vWOw?=
 =?us-ascii?Q?I0OypI0HUhpFrIZfcqCm/I1hmlo4+ZUZp7EppscRJvkqXTpkWPJfcPTC/LVE?=
 =?us-ascii?Q?R0AUn/qsTVFmwogz3P0/4RcRMzyk6u84Ae/3CXKJkcZbtdS5VFAWk+LWYtTn?=
 =?us-ascii?Q?r00v72Bx4Ym3WqWl4V7qKz4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2fe47af-d2ac-4bd8-aa77-08dd560622e1
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:37:31.2655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QTX3GPAjC4WxrSV4wMyaYjJKQCOMgi9V/NZ3yDHLFVuRtf07QYdsKVxqEBOgaakZpTdha3BXKsMwVXDtMABoSVL+KOb6Y86IoEfNk92tiaflJa2sNakf+rYlc1636LL3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSYPR01MB5511

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/intel/avs/boards/da7219.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/boards/da7219.c b/sound/soc/intel/avs/boards/da7219.c
index 76078a7005b0..d131007d6c64 100644
--- a/sound/soc/intel/avs/boards/da7219.c
+++ b/sound/soc/intel/avs/boards/da7219.c
@@ -197,7 +197,7 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->platforms = platform;
 	dl->num_platforms = 1;
 	dl->id = 0;
-	dl->dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_CBS_CFS;
+	dl->dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_CBC_CFC;
 	dl->be_hw_params_fixup = avs_da7219_be_fixup;
 	dl->init = avs_da7219_codec_init;
 	dl->exit = avs_da7219_codec_exit;
-- 
2.43.0

