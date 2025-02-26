Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010010.outbound.protection.outlook.com [52.101.229.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02CE518A92D
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533500; cv=fail; b=l3KhdrXSn18VVjVa6fNaFBIkHvwUwyytQ8gHIpk44BsiZs/cHnLX359cjVUfzWr4sQEwxwytPLiP6MEOr8r+3dA/ClGALYND/jT5fTWQAyEPnqvOWLVm7vQ6k0Mu9NQG6xf9h/x2fA9FHCFvq58bYuXIFhXEA2StqTe9inSl7AM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533500; c=relaxed/simple;
	bh=3a5us03XFM78++lTnfERPM2hQVLm39Sz9VlSez1HNk0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=FoKIDCqh/HHyK/uT7PEhDBeaoX8kzohw0dbBIx9YhrnZoZgF9CrCKdgzC9op+pZ59kat+ykcIi1Dcxh4tQUmfeGmyDV4zvm0pr7XlT7/rNBf9GPU55w1hHG6gvUVdvKQdNd2khOGm7IpulsEtT4dP567z1J0wbhYA+p0VgqO7vU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=PkI8Q1Sl; arc=fail smtp.client-ip=52.101.229.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="PkI8Q1Sl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eo13S7rlfN87FKMYMSyaVXPzY/q6CwQH307yedFK6XYjDQ2i4t8/lrFtJzu6cw6Qt3AcKEyOzsqantL7RZLE8JfsxCDy7qwas/EMsPsphM2UNB00yZ4iZqWGfxBRoPrLj0rq58oceUYCJSiDcYyZKh1RnuHckWIXy32f8kZbwWO25q3llhUpFGrOsZrmzqffOT0ZsI21VJ4YuMNANQS11YjtDQdiOV1Q/U4R6ld94CjKTcwNsZbSVcalLdpCK8ako7kv7hACNDKJILmmfu5G9yPYsjWjv7U+qS3HD5TmJDxzWdkmYJ0vQJrU2KM6ABEc1CUAFJlhaOP2PFqhLSi5tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lI0CZCU4mh7WwCH2P/KWzDqhYW4PDxe7H/reGtV3OsY=;
 b=eG52NpEiODOxU+Tkzm8gjWHPwjHURmnRDa2k6mG/zB3ZfOR9HDUTVfUZNLQieSPyDh4VLqLRl0uAbabfM48jRejZG7NxNOfrfm2OYfc6213ExHPffzLcoLJblcEbzbzYnaI5YYXTYPc/v9JW+mS0vjJTYvVfbxkzK0eNM/7/LPWy/reKzDmoxaZxFdAjjXJ8z5mlomTskhP/4v3CLL+Mic1Du3m+kBL/EbFuE9R9mlPKSEBue0lqsktgxEJjAJ3rAXWe3uMe+BLJyG2SO1jBcCT00IM89/z+dMwqyEJavLX+pkYjC/YX0BOME3f8VyRkiN3OPJMy/QVCZcYFh4So0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lI0CZCU4mh7WwCH2P/KWzDqhYW4PDxe7H/reGtV3OsY=;
 b=PkI8Q1SlD0Rr22C0vEfMyrLBiEMSm3o/mSKsSAQpd84+/hztkdmN9oOM5AnxCgpi4Or42691ibt9/mS+39ML/QHrwE1FD0u9sN2mGdmvoUhCeeFG/oOwGHBIZ3tbgRJW6zFdQ86g2YjlGwYGp7c2pxBdOEL67uac0zW6ijGGzjY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB14997.jpnprd01.prod.outlook.com
 (2603:1096:604:3a9::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Wed, 26 Feb
 2025 01:31:37 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:31:37 +0000
Message-ID: <87h64hfq4n.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 024/157] ASoC: codec: cs42l42: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:31:36 +0000
X-ClientProxiedBy: TYCPR01CA0205.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB14997:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c52e525-05a6-4d21-c901-08dd56054fc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ri6DdvYXjhezkjC0HsgHyPu05pauQa2bhbUTfuV9Lqt4qUsUcmVq2oAwcTxo?=
 =?us-ascii?Q?aYkoYcO/yQw0ZcqbR0i6WevFnVlLJ4D44dQ5pKfJ00fsmZlZhQ6mGk73d4Bo?=
 =?us-ascii?Q?a0TtFnV4faIpEjb6FUrU3BcUTTW1vYyUNOhN/iMp5JkYTe9xcVYzHU9pcsjE?=
 =?us-ascii?Q?RDS28pE7wGw3ingcm4xYSRe/HopjtO94kql4rRUq8XnaivSJwD/KFug5bJW4?=
 =?us-ascii?Q?HTbLTDTsjCx1NZ7QT5W/dvqEljz3Af3z7+3yPLarUMwxdZw31VkrCr1bhCeD?=
 =?us-ascii?Q?y0/MeIfWPa5yBv2ZQctc6pTWQTsNDVr9odj4m/FbvsPxHvQ3jenfqoaOT8Jv?=
 =?us-ascii?Q?GbeXlXWwpRKyzFAfeeoJv9qvDQCf1Imf0jD3qODEOn5NvVy0j8sHYJrP/0P4?=
 =?us-ascii?Q?zTCMUKtOWFut7PrsAm+YVe1YjG8gX9KjKKhA9xBFU10Lw67HrK45seC1fg3K?=
 =?us-ascii?Q?eH95KkIgbXeaW1hmYtNrBwsdRhbc34yMgjyQjwPTzrnL2hwmdS+u4zDPNHcZ?=
 =?us-ascii?Q?9Y16kNMdgJ+2w4MovMN/9c16hlACHTXojIRCaho15wf7+n73K0vWwEhQilgs?=
 =?us-ascii?Q?hxDGF1wjWFWYXDvatrdlwG+C+mqqQ/ERS7AXJavbdel7EZAuoK/mFCxq+3PT?=
 =?us-ascii?Q?HLkhK1GTb/esSCY9UqC1Ehd5YMOdkSKddxOQesowrpnknJvlWuoBH6BeoJ6j?=
 =?us-ascii?Q?gFpzBElrfGIIuiO62NsBxfDLnByKL2nzfMYs/DRDxSm8CuDC84xxN5QjqmPo?=
 =?us-ascii?Q?/0QiXDs1TSbvMBoZPRUsm/oicu+EWHAZVvK88DXcRFSAt7eHD1dIhDKDcbQz?=
 =?us-ascii?Q?ZSW7gwKTIwf+P7BlOmDAIatu50oJZ5x4QiQoOYviq2RtcITNKT4moePRa+Rf?=
 =?us-ascii?Q?Q5+b9C1WJFixYrinQ6ZB1dnG+ayM2UcP/uXiaI5kczo06Q0fiLhHtyBFJ70A?=
 =?us-ascii?Q?Rr95EXqoFTBx3wRAnHuk5LvOTumPboaZNw4RoAzvPazGjeFB7NWhYK9nsis5?=
 =?us-ascii?Q?c5ua2X9ghjMb6s/PEGCy6oDDaZ6LgvLAdxj4qT/AvtjaZBa2aG5J7dXOMupP?=
 =?us-ascii?Q?2KkYpNoAm5ntGwjoUxBbkZGd4BAtnC7sbMXEgS8RKRr9HlVo7y+zeIrnVRaC?=
 =?us-ascii?Q?1Bwdmdo+MUlPcy6BZ5T7r3NVACrp5XmaRCyvt613cTHqvhzWvMCgdGatGeIZ?=
 =?us-ascii?Q?BNM3hMjhDQpAbCA4FWh2WYj7AoVjKDckfWsQKAF57g9Zg3Pbo2vFliE1qfpW?=
 =?us-ascii?Q?hIBD7wjHuDY0tyeDPKn0xfE+Swqjx4AgdBRwhHhWbkR+6x7eCZdvGf6JG6f8?=
 =?us-ascii?Q?ZQNzOiyoxshDJuVNW6oWhYECtp3gFi0o2K7ZxXRPE7Gr8onJ5mfTyvikrM5V?=
 =?us-ascii?Q?FIf6MbVLs/Nv3Wiqg7MYbIEM5AztDrg/a31cXWSflH5SqzQwcefRvhnO0hG/?=
 =?us-ascii?Q?WObT0cK0dauvE9Veu+XhWK+wZus3lob5?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vf3pddKBNQHP2O6WJEwwB6M11RjLPxWicBc/5wJ0XhbMIgMAWjbwlCTCIvhp?=
 =?us-ascii?Q?w1nU7t3C/K+4qkbjykUPzQsOIhxOi4kd5D/Mi4hvROotajTXGWaQUfFC3dmX?=
 =?us-ascii?Q?S6LOvblnGxXayYSEB3Leboxa1rgmsa1Zp9WT1WXbni/jllLP/UrK5Nj8QrGx?=
 =?us-ascii?Q?vTIqp/pWga/9t3iQFAikqzBUZyD0fsN42NwdLZcU5KpfiFZtNMkAs+5BgOwM?=
 =?us-ascii?Q?BznS3Huzs8fkDp57ngdVG6lWlBXAhvvZ1gmnwR+9v/wkIF46ky10E0lleST3?=
 =?us-ascii?Q?H4HiLIGJNNwFzvNEuQrNf2vi7QJZY2tUc8E/6QK/+5IeHTPdYtmfILr5kdwq?=
 =?us-ascii?Q?SJi76dQ9LSA07UbpwNcMzkuHBH+gQaftQadsl87btocUpbNT/kV12TamHCZB?=
 =?us-ascii?Q?/OOya4+9ukXrHuNui32VTIqF+VrcNdOOdw9oa1avgyUarCSLDCLakVNGlMKO?=
 =?us-ascii?Q?lo8gVvXlPDDRFpDVsTLDowG5CZFI6aIw87B9BKuwpniz4JhDs7VfbX6qsogQ?=
 =?us-ascii?Q?SFdi7cObdwkflhwTFClEP6mqdmt1M7sY7InjfDZ35MX9vBPfNhLQSOMj72dg?=
 =?us-ascii?Q?njdV6iwWoyoLSl7BqUi883LyA8da/g+rgVsfY60wZ1peKXPmm5Bz5Izd0HHv?=
 =?us-ascii?Q?CP2sQpMaq4QCk3u92toScCwBXjc9X6+gsFFsozc/VIF/aRa6V6Kg6k61JOU/?=
 =?us-ascii?Q?YtekCcvFr3V/Qzw2WilY44nSqwjETgEQZEGnNHSqmduhke3Tsun9L2GeyckX?=
 =?us-ascii?Q?4HBfJuPGamroocanWdDEKQfaryLMebs+dy/43QUkIex034XyGEuLe7ArVllg?=
 =?us-ascii?Q?GCY77UEt7N0BR9314BVON0Ut/eBauFUiBqIBgN9ETXi5odkCzELPx0Jd6Y+k?=
 =?us-ascii?Q?tqlfMzxg/dd4DmhaRXiSrPasB8AAfTEFG/4w0X0JTkQrSjOkeYnYv4gwdkMn?=
 =?us-ascii?Q?R0SMI02UL/JFGFTXPy/bPpvjOZ/vbce3dg7z/Txqg603BBbDkqcc4bE9/6Ed?=
 =?us-ascii?Q?Lf/lqUcEjFFEi3nzBP/UF1drr6X2i8vUqibCwESsMmxfShaa6bLMjqUGfVSt?=
 =?us-ascii?Q?CXrBMJEETxn+IxA9IfTeEaA+kM7dlrotiuWpKIC6s/p9AB0SyhK1DQhUtl36?=
 =?us-ascii?Q?JereXMYH6gW5Aq80TleJL51OVwSaeytUjE/I7npjKN8Gkbl96HfM064emEvv?=
 =?us-ascii?Q?ufOBg/fnTSiUk6URrpI+Hlun5gNf/7vOQAelycDciRa6UhL9/yUl10HsxyEy?=
 =?us-ascii?Q?l1EO2xkya+F98vBYjLmNoVG7p88psyg+cRdDISIDY/Gysf2elKxKKteFjC4f?=
 =?us-ascii?Q?GSGitNT6RYWL+EafYuC/JfrYcEH0ygf6gAw7Z5rpb305lhEdBAl9qd4mcnXV?=
 =?us-ascii?Q?tp2uFFQySV/1peymLhdTzdHzao+hP9lGc/0+r1GiG19wKiMdR3yiYvas+t81?=
 =?us-ascii?Q?6YKOpjbBl03sRcacBjLOBdFOlZ0Mn9DbU9RM5driVyyIlCAK7Q48TPuKv0+m?=
 =?us-ascii?Q?f1FTsugEVJb7cGA1Ie7CjOGqWPc0ibVKeHfQbrz7Zdw6GrGGSiNA2ofgej2I?=
 =?us-ascii?Q?HtJuj5+gHINq1EsbIPGbF/sU5GluBpCUTt2Ar4T+Z8/pfLfrYAgPZGaPJHD2?=
 =?us-ascii?Q?lBdi+tCrMdVWg14HNbF8Y74=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c52e525-05a6-4d21-c901-08dd56054fc2
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:31:37.0616
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2dYECkhXzjVpnVMehRgvw9+TGCj/oacFkfFtOKoMrtJXQ7XSqHCnzKJUbxN4W+c0GSN4Ly7YQVQcvtdyhurHSHJwCGF1BbwZm1hs4x1Lflmb1JK58/s650ZaOEHrQ7cL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14997

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/cs42l42.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index 501c951cc327..56668c392063 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -830,11 +830,11 @@ static int cs42l42_set_dai_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 	u32 asp_cfg_val = 0;
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFM:
+	case SND_SOC_DAIFMT_CBC_CFP:
 		asp_cfg_val |= CS42L42_ASP_MASTER_MODE <<
 				CS42L42_ASP_MODE_SHIFT;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		asp_cfg_val |= CS42L42_ASP_SLAVE_MODE <<
 				CS42L42_ASP_MODE_SHIFT;
 		break;
-- 
2.43.0

