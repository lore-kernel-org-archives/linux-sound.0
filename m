Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011062.outbound.protection.outlook.com [40.107.74.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B022D1990C3
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533915; cv=fail; b=gIcEzyL3DatUuYAEBlzGAHxK5NtiypVWjJbTI+YG9H1q4bwB05Ztde/+L92Grl1FXXxNaCltQWiR4ESMfN/Nd/3mmK6cP9H3e/9RRc4DUSCO4/YWN8EWh8NZSTuAtUPRQOguQhGYbWgf8tyTUkC6U/sfnEmkzs+Lq8S6G52TWGs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533915; c=relaxed/simple;
	bh=SCRf/mQWgMRt8eEhhnXBOaVluWDO6TZV6Wf7eMFtQrI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=XjUFoRaMS0c6wIi+HdtCU+Zpp2LhxfHK64Tw7dsFv8iVseSywa1GKgIaRIIroJoNMHeKrFGnhMr+/w+7GCwLQH/avXWpTlhqh9n+5nuWypfO7AgRarZnxsJw3zPTu/etBEbsVEzjIs//eEx+XDrccCM0gr7XCkVuEVUZMJNLoY8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=A3D58Pic; arc=fail smtp.client-ip=40.107.74.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="A3D58Pic"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ygh1JvCTGzhi/DRx4B5chSedCSxYTJVP6GQTqi+Z/RAW3MbgEcSOpIjSjMuaBGVDpwAFmUeAzlq27H6LFsrNrtfgBOauqMBYcB5q9+coeF5ErM1zlZ07+qSEF6XOd37G79NhkH2+SiiM3o1kZjcFes/cdqV8RWG5Wiq2HLG3S0sjmmqWmJ2txjWpt91Pd/rg8Bj1LCARYWwz/PBVNroQycAq7ZDuaYKyES/dDfGs0WgHU9EzJYMjbgs3QJcFN1jNr4sLGE/uHxqYE62m4cr7Qa24/UpqYq6jhi5hmQYlzo3f6cotAt/WcQHBk5eCrfeoqIfRwLVhc1J9CP1HASBwYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uBSZQ8Ptrmz+22PYNsnmeveH/VTg2p3QcpR9K1w8ZKU=;
 b=xC4NJgsfEf6QEFNEqdeRN8t1HN8+4AcjPggqwt1UaJdNS0QzROu/bUPoylGjmDZnnT9jsiqvpapbZI5bvj6++7lJu8l/eynkLHSlrUvcjrpBHOD1x4bb+MIpGDNYr4Qkx0vkpxRhEtSqVb8hFDCtql0xTflYAUBY6LCX1Fa+67gW1/WDchgazjpcSHgMFGExHRAP46XGHDpkeLN7d0TDo7bLo6+NbVMF4OmOPXRGLcUaCIgNzfDsR1ZQY00aUF1yPr3Mnh517caLafhLR6L8MxQ197ytV6VdNgPoDxjW+hsr1YpMn8lQOKjB6UqzXlFePLar/rcOuhSh0H+gqKp4Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uBSZQ8Ptrmz+22PYNsnmeveH/VTg2p3QcpR9K1w8ZKU=;
 b=A3D58Pic9TAzY/Tktpee0TytvENKLYq6w3Y++7VPjT78THAwBZSLqFGxTjpzjhfJWn2JiNdziQ1nnBycMBABQZg5yqK5Pb47vsib2EJICd1xS1a10kVogWqQoVL51o0hgDTIEg4tb2CdKB3Bi0W7VRvzv4Xd7A0Q9Cc9l5HWrdQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB8864.jpnprd01.prod.outlook.com
 (2603:1096:604:15d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 01:38:31 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:38:31 +0000
Message-ID: <87zfi98oyx.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 136/157] ASoC: samsung: smdk_wm8994pcm: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:38:31 +0000
X-ClientProxiedBy: TYCP286CA0033.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB8864:EE_
X-MS-Office365-Filtering-Correlation-Id: 7630416a-8b6b-4226-f0d3-08dd560646bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xg+fzB0/ACabvrCFqbOjCzb72ehH1VvUxF37VsoYCg+uQqZqDnZGCts/gkYP?=
 =?us-ascii?Q?czNDsZ++oS6TgtPhbqfo6XGKKgzFmjSKRFMzIjkpyUVFF7dObL6FZO3y5Loj?=
 =?us-ascii?Q?0hEnGObUbhmkkGVwxKkP+poic9IXw2VsjxP7YbU6rTsbv++RFOLP4TGTDA0b?=
 =?us-ascii?Q?RabYDIduzcQi71ZajxSjw4uYIk8oi9Lzq8iTAjGTVfzRoVcMJY15rgteIFEL?=
 =?us-ascii?Q?l12Ssy+IZG6sFwBlzgHzIyXDUNitwE655qyn3D8SOu/5t2y7vob//JSz1IER?=
 =?us-ascii?Q?NxO1OxSSadwkS7JQzx2quWUgY2uS4Nkl+fa8F/9Y/aKWBykx0Q4ptcUe9HVJ?=
 =?us-ascii?Q?2sqF87XIX3hTTz7Kmrvl47499lDuwn8DE32Ubzl31xi+4+wfjSKfddI0vsAs?=
 =?us-ascii?Q?lg6BGw79YyKZOAvJ8FHUvAZnc52GMN8bPgXuU46exTcMKFKPrOpa0KJWjYeF?=
 =?us-ascii?Q?MlkzedXKjeHrufzHAn+3JkGq5ushpe4GdA/WycHr582H2UyBRdqIp/x/GswQ?=
 =?us-ascii?Q?QRCx6SJS5I1+4JIj92ecdlXUU30LMRKBdQHyqsdmUcTGok4iC4N/e65JtpIH?=
 =?us-ascii?Q?A5/Zz6EtaHwFHw+Wkq/PMrQlHqkNuQhnt7eHB1H+U7/FPxC3rhbFOLHqHwC7?=
 =?us-ascii?Q?5HUFIAqhaVyFyirWj9EYAwLD7tOt9Cyfb8OI7dvGayjvyfgOVAT29c9JXdic?=
 =?us-ascii?Q?ZOKqLenSHS2bsxsNcPHh7EqaNMPsqq2G4yiTac22CSM5Qtq8AMM5wQcNojtb?=
 =?us-ascii?Q?RAJ/X0sxld4JvPjZf3ReBSwEXM+s1kM2P0MpKlrQWnR28o+g2VvuMCJJbUzs?=
 =?us-ascii?Q?aP55oRuR3B4JE/s51WNk/K03sKnz0hmIq4w35q7Z0srUjpMgMiBLj8VcT6K+?=
 =?us-ascii?Q?1E49ydCMpUackfk5UGDqdS04TcBE621w8+R+cyYiaECTj5m3XxnFLyzDf+fQ?=
 =?us-ascii?Q?0M8LA0wGBHPU/JvJ+8Aue4L3VV5VhAJST2QK4KhMDS7fs69Tzk5zz8KL/Gb/?=
 =?us-ascii?Q?otBrpcxkJRlwN9bU80tOpdmoB3tCAUxBBPqiEpTtiE36cOjVztlV4RWqiAjl?=
 =?us-ascii?Q?BWYPIxeOk9mu59fenTmU16P9oLqdUdJA+Um1aaP02fRhuSwmbgmcXXsxIJDw?=
 =?us-ascii?Q?Tu03AoQ94pE/kCU7sT7Fe05HARxR5pPIFl+/pevcueF7QuAqhFy6F5fXmz4t?=
 =?us-ascii?Q?KCcvqjLIjQZDIWLZhH6hgznAxAXjDz3DpFvFOgeMqM/Xxg5Om5hD44RviN7V?=
 =?us-ascii?Q?9fHTUtAQaayt+IXrtjnSVo8JH6D+WqWn795kIsqU39zqTh7JxLNS8XgQKr4d?=
 =?us-ascii?Q?rbghbg3JpJiUB3lu/yln0qw+A87sVfoil25GEQdCJbhwu4g9MMz7saYqLN0h?=
 =?us-ascii?Q?gsnxPG1NBn2j2FpO40mQLpFLaNc9VGC6IXkW/zm+zN3YzinXS0bCfUijeue2?=
 =?us-ascii?Q?4Um3wQ0GNhnvFNw7IjbQmyMIaJxQcsdU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1EzXHfacWK6AijWOCms+/kafM0mdubDYtZQSyYCBbiEvXFJH2ilve3yWqDkw?=
 =?us-ascii?Q?Sdtf2oOJVEO2329SlDpfg09N/6M2z0dq2f+Hl7ddxsI0Wq9nsR5Mq98F8H2z?=
 =?us-ascii?Q?r+EG+y6R/7qp2OpXRAErXLLDsuWYiMp/GD5gv8D35rFDCTrjJjlG/eM+4kPa?=
 =?us-ascii?Q?x3RbBYtOlIZ038w+5VejGdfPSP3J17IH7aBEe3q4kSt8HC+uQjslNOglNxTX?=
 =?us-ascii?Q?7DKBUJuAxRJ/ifsMyj/sjHcwX1FBvkbAOxXiLuh8wUHv3XkNPsyx7j5JIIah?=
 =?us-ascii?Q?POLnqGBj/Jv2ifk0xTsG1nD9Je0yTwW1uhldsxaMrQMgxszcOZPFfplvlEIS?=
 =?us-ascii?Q?eBOtkwqKH8ikj/njz+6Y7eY3P2RaMraiay8Wqw9ND1g5OpU+fM9tUJx/DJPg?=
 =?us-ascii?Q?aL8Nv4zWK8+bXv8m8Ag29WU5X16BeWLgrMojK0dWGg+LBAnn+IG6K+WPPazj?=
 =?us-ascii?Q?IWIXprc/sfJ2nCfoHGWiThive2fBILSwy43omjnqbMVE2SgPVoZo+m1EJSJO?=
 =?us-ascii?Q?oEMAgr/jFYVeBLSQo0WG1KDalhwLssTagZZEv9Fiv95iskltbiMvTpzOykCl?=
 =?us-ascii?Q?2nXvnvfFhD7y82Y1WoztQ9eYK4l1YUxQOYGynB1Os/vdyB7A11ZoZDfJZ4Ex?=
 =?us-ascii?Q?hyncOB1rj+CwqwzkQExi7vz2+a2YxCOnnErt/QL7dxIG4a6E2Cg0Jlxexnbc?=
 =?us-ascii?Q?VdXYp81KIwsFRDMUPiI/YLIgk87q9E9GhMNKXX/YEWhdf0JPWjYar8Y7a2yZ?=
 =?us-ascii?Q?NAGLeCYjW2pv2EFRO7LeNk1pbKL1dsHd0Da176SVhXhx/mHVF9e/7DJgF6vJ?=
 =?us-ascii?Q?zR/r6HWC67xUAtf/JNl0ZvWyLYr0/Jv4l9f5Dl+6w2QhFU29Xs6Xw1zl80TK?=
 =?us-ascii?Q?3NIYdT7Eny5hOK+BxtNx/A0YrVlqYnp4y2LAUrz9kDXGoHdZz+6tHr8kiZqj?=
 =?us-ascii?Q?AvHo00s1geCKFwOacgM6P0ImULyPoMf+3CJ5GCngWRDnx+Z24/dm/4E+mzbQ?=
 =?us-ascii?Q?LfJdRY7X5cMOWz/vyaxiEm+F6I8w+/lVkkckCrJQOlbtpfJEfiRYF9Sk7E0M?=
 =?us-ascii?Q?fq1rC+tcw1PM9eguK/1OsAKG25MiFFcIP3djcVM4rQK2QU6kMdVXkQweRaUz?=
 =?us-ascii?Q?8BfzcQnVIWwV/gLAoRRzhu+P5r5Gsel/wKqntRN7mqQSctPfXzC71v6dxSQD?=
 =?us-ascii?Q?ZNbEDnL9AP4AQEA4rX6eny0lIvza7iixrxfdR2hirPZhFOdBP4PGJwZo+eUN?=
 =?us-ascii?Q?6KcyPa7u9T+TTRZulssr3vmpQpkK3nweQ86g4hXGE9r33nP0V2wgFT7pU/Ps?=
 =?us-ascii?Q?Sx2bB9g0FPSchhgYLZ84tYUCIZMhyAdOxAPviU0f5omectMsS0meIll94uT7?=
 =?us-ascii?Q?7FbUmgqvbh/SeJ39BabYBsoHzj7QZ33naU+mEFmIBNarUSLlE/AmD2dFo3Er?=
 =?us-ascii?Q?TFGWZSqFDNCnXhkCcGkkKPp3lgSeHjeXWvHIV+L9q1Bw/KE9aUbHJjk4ftbO?=
 =?us-ascii?Q?x8tyZR1jAlhY1PTo31sI+3Iiy3plr+BW3zyvbyyso5e8w/KfakMtl5RQrGtx?=
 =?us-ascii?Q?lwkTQVhLcUlPsI110EkmrJpIntMYw1J3LiDJluNvgkeKRgomhw8XBXt+n1J4?=
 =?us-ascii?Q?F8Lh6lR/HBcDkkbQQXjG5nk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7630416a-8b6b-4226-f0d3-08dd560646bb
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:38:31.4330
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f3w+sppuTdzES7twRewC30btY/AjY9gj7zT5HRxnP73BDvy4S53UmLjMERbuRDGN8k3yEr9Vy8CODmRr/MHeeEW4iinpBQV+vDPP5sZ30AT0QoKQWqOcjmY5ET9bQogc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8864

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/samsung/smdk_wm8994pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/samsung/smdk_wm8994pcm.c b/sound/soc/samsung/smdk_wm8994pcm.c
index 5802f92ab8ba..a3f539fbde5f 100644
--- a/sound/soc/samsung/smdk_wm8994pcm.c
+++ b/sound/soc/samsung/smdk_wm8994pcm.c
@@ -99,7 +99,7 @@ static struct snd_soc_dai_link smdk_dai[] = {
 		.name = "WM8994 PAIF PCM",
 		.stream_name = "Primary PCM",
 		.dai_fmt = SND_SOC_DAIFMT_DSP_B | SND_SOC_DAIFMT_IB_NF |
-			   SND_SOC_DAIFMT_CBS_CFS,
+			   SND_SOC_DAIFMT_CBC_CFC,
 		.ops = &smdk_wm8994_pcm_ops,
 		SND_SOC_DAILINK_REG(paif_pcm),
 	},
-- 
2.43.0

