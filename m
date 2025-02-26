Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011001.outbound.protection.outlook.com [52.101.125.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A80194A53
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533807; cv=fail; b=WTeVcgAv4WufiDmd1573DXXaOviY4xYt0jseRBNuEjKErHqMEZcQ4hztm4SB7TjOo+bOndLeH3TCgBEBOvQHXbBMkHdnEyN+li3vk3n7/qvSkIIICbsdWLCfZjDQIMKC26TuYdj9yWbJs5fqjdD+XtU+HD2PNPebeno/RaWdvCg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533807; c=relaxed/simple;
	bh=IkXttRBcjUueOm5cgfi2Um2jMatcAzD4TqntFuwpDpc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Va1fUl7LTEkaGitfIYr4sQSEj0J0b0F0AmWMRNmx6qurg1zUMrLPQgldddi5Zmq5N6y22A+B4AwUjij5DLGQqckgKQ/q9eQb/WuLoqHSuTuakehcDdwe9Zt9qjZXRj7ZCj9HLNSIwGu4JGnJQQJLkOFjyFKllyhZAdTGqsggMUU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=NjUYNxW9; arc=fail smtp.client-ip=52.101.125.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="NjUYNxW9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=skDFCCWAnpRw0NmunqJsqZTfrcJPPKfApL0kvJiEfQ6bvjd/d//bzRkHlK/ped3438xqlqKrGBV3H4RXdb+pr6R+u7etvsvUDfVO0GV7njIBovD9yG8H/l2CSTIfSVZTsv4NA2Yxl05fiBSNYJIYW7muYmQbiYBV82trzFmIqGXFjJ9ggn0tSggTvsLwFKNdnM0NBhIzXqHqXL1cRDDwis2tbG2u+uimeaPCIUrutI0g2055OniGWP7cGzwWM/gPbsILEPEz2x+dJPD/3MFzocoM16D7pnV+7XWvzGcNwQ7y5HRPsARge54hTogW43Q/edky5RAxbTSe5vjclAh1oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZGd2B0R4aPrX9Ab+QBbYvh0KEUSUS+KOmjrk0u790JM=;
 b=lqAHeDN6ZCfyIu1+pWCKYbuYMluSDI6n6rSjpeyT+DO/5eGjIRdWSgDYvd2aXkVgM4CbOz8BmN/9Uit9plbVmIA8w/cEUcN4SBNfiCXnXjCUme7a+WwXzXvbw2yFytbmeqAaqeQk1cnGIvRG3XTZpHjHlmJP4b6pFXrYAt55BrPuJeCb0SFW0stIu8iltmQ6+kXwiMSDXUfhlEGHGUDpDwJqlmuiKj2bKJAvANkfQa6URDhUlL00LUz1Q+WDZSgUBnIBBOc1/3SWS2t5u0d4+QgGxVx91M+hHaW2sAIzc2PO4OgPZxnje1BFCb3FRgiOOOhlvnuCI4Y0jLn6/Vol0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZGd2B0R4aPrX9Ab+QBbYvh0KEUSUS+KOmjrk0u790JM=;
 b=NjUYNxW9f0cYW0Vz3F7uz+ee5/oQr08nm2aOcmPWB3EUSXLCys68MJTcMjq1ROlcSWzUrUKiNmgYratKFDhEc3HdhG9DGGd/d0RyqcleZ2Xf53w4dJHmqK+w6jp4qk4buNG4kTV54cfmJu7lzNTmUnmsCviB993Uq+7gpwF0jQw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS7PR01MB11967.jpnprd01.prod.outlook.com
 (2603:1096:604:23e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 01:36:44 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:36:44 +0000
Message-ID: <875xkxbi6s.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 107/157] ASoC: codec: src4xxx: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:36:43 +0000
X-ClientProxiedBy: TYCP286CA0333.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS7PR01MB11967:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f8add5e-fed2-4436-b2b5-08dd560606ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YKMBdTZEmumshGDxezkKcO1A13D58swNTCi3yPT1qrm1pT+99J8zh8/M8qvU?=
 =?us-ascii?Q?Dluq5L5NFwp7jEoxS9Kxge6xmVrxF6gA/QTdZWz1mEeK9R75A+3j8rJOl0y8?=
 =?us-ascii?Q?JfrDeZHn/uwosFxZl3gJUfAtDuHOO0f5E0XNmrqyJaoYnhvgB1XuK3rw4IJL?=
 =?us-ascii?Q?21oC+JEZFCqNrqTinFHUHvSaqEQIggmr8H+Om0UM0klhUZM6CAeTG2SM/gLD?=
 =?us-ascii?Q?C517h4jLAQ9GhLu0DFTslCOJQwx+DR3gWpz5ghJn+qIgMcx5efeEyxidfQsJ?=
 =?us-ascii?Q?tSNtKB4dC+t5IQcDLnp7hMnSkhk8G3dP4CA5mfJF+sqlvb6SYlzRhOOTbeud?=
 =?us-ascii?Q?0qJhmYk+320gxBygr9VCsxlE1kEvGSsTDZ9G1dywYZPkMM/+8kf1Ah4ysP4T?=
 =?us-ascii?Q?u0BwHFh3TLcHM8jHlWf+RPmKnG5RcYMMOMIR5RPBhsLhcJmxA1IxDCZT7XeX?=
 =?us-ascii?Q?XINp8zZBA6X7uukeNJKtAp5IeKd3+yVuhVPWBhKtKLsqTUXkLmdEK4DPbWwh?=
 =?us-ascii?Q?i3jMQni/yYHB9tA/Vl6Wc8CwIUBFbqVOGvQkltz6IUlfAEpKuIZai902F2Pi?=
 =?us-ascii?Q?/UhTes0Ht+SPFlGJb6m7PoUlWhxUgw6IeQL3bLr+OkaZC2E4eAg8hCVdr3IL?=
 =?us-ascii?Q?pYaM0GkxQvb6LTlg9lNzc/8bIuj/LvDKvVJjQd+Amw25quCXGWKUloTeZHJK?=
 =?us-ascii?Q?G+3rPeMAV/73aVDZy+gwqmqXEPvXw0sPU7zg++DjDMteJlyOTXKj/68P1xfG?=
 =?us-ascii?Q?QZfNEibyYTQvaozrgUCIHlhLmpMrHa7OK/Eyd4XfyszhCfZ04e9/Pd73G4ct?=
 =?us-ascii?Q?GtKGSFs2u6vyoRpXJFKQDGRX93tVPqjBSLK8cd7MpgKK1gEoksSIFsOvHDMx?=
 =?us-ascii?Q?eOPdQq4/V/MgZp+/R02/StHs/smTvJuDvJ49OlgRLYKakeUVJMctoHAT4ntL?=
 =?us-ascii?Q?n2Qpxn2DPjrs3XLW6HZ1BPpSDici59DWlMaMNHxfMHN+xLqgAr4VmIkWUK9E?=
 =?us-ascii?Q?EUxigDRNJVgZ5SLHF6OhtvWCTR2Hcn4Z7KKg+AN/ws2UjhotMEuKEwApk7lF?=
 =?us-ascii?Q?Krx6n5ngkWMvr7hBhRmum68JkzsHavx7ycBj3pfmCGi2shnunWoxKqs/m/R1?=
 =?us-ascii?Q?gHXJnbmc3pKaKryKABnlKZ78fP5TyI2zDKQANn2eyCo3THyfrNA/LEW8/h7G?=
 =?us-ascii?Q?jyMQ06NYq+2PbIwo7hvZc4/S32lADlFNrz9incIbmJaN1/e2m6W2Ve5chv1O?=
 =?us-ascii?Q?ooj0qa15MBcTZH3gunc/Ni8xNJ/5UlS0Mh7IBrfjdVdOAkp826JVQMza0qqx?=
 =?us-ascii?Q?dem/88U6Q8xHBgzTOo85I8w3cJSnVHLtvgN6dpk3GDUJbliAZzogPdk74dMg?=
 =?us-ascii?Q?4HFIiq0a0HVq9r0WiBwToRDiEEBEiNEbW2ypDLyBJtglalcQNqujFlCyYtxl?=
 =?us-ascii?Q?vLFcF+2pY6susHAhjPGkI64hq8gkEjbs?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dZByoHfsDszFU1DBd7f/jD8LuFW19LaCmAKxqqeR37dggndJXPVxycXQavO7?=
 =?us-ascii?Q?ybOMo/E9a0/BWpK7yOkf5A72GO5oqK1yQ494BpVLZ0nUkOI24AJlF9VT5rso?=
 =?us-ascii?Q?r8HVjQ+eSTxNiegE8oiWp9jljqBBcu9WrMru0pAB992mZHcawhhNFd29SbNw?=
 =?us-ascii?Q?n94UtQyrfIofZu7a05Xy2HM+jX9I9xOcQlWcqiDg4rp/uGGbkg6fkaZbi3eJ?=
 =?us-ascii?Q?Fb38+cdwUJJ1bWiB7anITRDf1K9tPBCrUQDJg/NAippS5d18GxNON7tv5l2z?=
 =?us-ascii?Q?r4rX4onbIsX9hFq9bRCdqLdDaiDOHc3maklEJg7K1pOHA2g/KxtQgaKSz4xT?=
 =?us-ascii?Q?Aeoo5ftwjR9QVrWrgK8p6wPvJnIXg4iDIIZ7aYeirHvzTLcSRAcVsKiP5yYl?=
 =?us-ascii?Q?Pnb0vBkfT5CMJlVh8wE9GyoSOBB2IFLik3EyhP1ndM8iUoFEl+lBR0lhG0t7?=
 =?us-ascii?Q?rfjMrn5tpijqyVylkfU5BCtCQuB7+0GfQp8JzaM5ev5xXEltC7YQ+pRO7dxa?=
 =?us-ascii?Q?7jTG65yzRBsrYV+L9imPoVGncbAD5VrUDOylk0mVEr5y20jH2PG4PaBwBmGq?=
 =?us-ascii?Q?3yMbqToHann5kYU3aYh4X/2Bn0pNRK1+AsvvsEKNi9oqtDfD5GolwAOXgAod?=
 =?us-ascii?Q?M7TzAfUbIUowFr1Qbr74ILg+63rKNSBir6ier4plUWD3rdGYvR3Tj67WKFx7?=
 =?us-ascii?Q?gvq+1wgD5aOkOKOqLe3VQr//Ox65+wDzY8/YVWG83Eim8E1YX/kWrVBNB2sM?=
 =?us-ascii?Q?Zijkp7KfZDhWEgvvFOR4yGB7X5nL0xj1JUHT5vsgNSI1Srn/VCrHGJnQN8Rd?=
 =?us-ascii?Q?1RjoeAFFoFizWtMYEgUMMk+Vi3Dwp2ETwARQcIOoxjpEKOxRaxjXoMn10o6X?=
 =?us-ascii?Q?ulkPlbT+MnXU6gmOE6sHSPN2SAMdFurmAKPrJmqYbRH6FbMW0gih08QiQQ2g?=
 =?us-ascii?Q?llM+ALjkG7iDy7sCUUOZCdVpdCPQFDSW+GssPcCR3FILbwKiYu5Uf5A8bY1U?=
 =?us-ascii?Q?yCqXEOwlE4nSrPwJR27QjeK4GqagU1LNiH1hCrEoCtUkvDRGdwCq7JR6D+ii?=
 =?us-ascii?Q?2NRmR6ZSY0v7Qnw10EtChEFtKQMR1b/iW+z1VR3UD8fbNxHBTs8+kbxAwRtK?=
 =?us-ascii?Q?CtRDfFt9juq2cWD8VfV/QA3SHHclRRzxA/2yfCQB3h9B1ArQwAHhRS2eUZZa?=
 =?us-ascii?Q?psRWX8XP9gu5FRQRF/WVlOnyBAMy0uODp9OclM8t8jvneOF/hSJ+diNIbxiG?=
 =?us-ascii?Q?Bq1nrXzKIBBpWZwGWv8tjbhbjW4+lqRZc8G5o76azpVkR0Wlc3XSpv2oAVmh?=
 =?us-ascii?Q?NDLV63dT3fj1vm9qHgPrzvRpvaerfTCxdZmg+PmMRPpksr8FcTCfNO8v0RLA?=
 =?us-ascii?Q?grtxGQ5RPyBTvgA1w39ZCFDEMVCrNeE7B1Qtys0KNSTRv1WbvcbLt1gWM/En?=
 =?us-ascii?Q?OU1rN3Ud2K+LJhTkTCBtF3jQbCPKkBP657z8xbjhJjeTEZ7XYCvGD4nBinHj?=
 =?us-ascii?Q?OtuQBB/7dBuu7P21gh19paAuIxmWVKdf3d2xS4I26SbauDGHY4BzbcwfLre6?=
 =?us-ascii?Q?F2X7GZUZMHWccW4nlQPAMN/BC+7su63/EgcrNb3XGPzyOM4mZNYQNgNoX5Qu?=
 =?us-ascii?Q?3mAPoBCEJKdI9UvfSMcgznU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f8add5e-fed2-4436-b2b5-08dd560606ae
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:36:43.9587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nTt9YhG7pP6riQWvkLFG87LNMf2QhrbjkPxtoXbs8t5UxU3i5Wg4XmkUEAPqI7WZOYJJWWKBHFwcsqqXB3+vMPjohpJLLB5iEVP9m6vwOhlw+/Ix88coEpBLHp74AXY8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11967

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/src4xxx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/src4xxx.c b/sound/soc/codecs/src4xxx.c
index db4e280dd055..5a3489475225 100644
--- a/sound/soc/codecs/src4xxx.c
+++ b/sound/soc/codecs/src4xxx.c
@@ -158,11 +158,11 @@ static int src4xxx_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	unsigned int ctrl;
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		ctrl = SRC4XXX_BUS_MASTER;
 		src4xxx->master[dai->id] = true;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		ctrl = 0;
 		src4xxx->master[dai->id] = false;
 		break;
-- 
2.43.0

