Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011019.outbound.protection.outlook.com [52.101.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307D220A5E5;
	Thu, 12 Feb 2026 02:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770862642; cv=fail; b=PqfQ9U1mIxRMVx4kaMhz4fm8KJikRpqhuVKHbVM83QAex47Woj9CC8kxlLFP7eq/57RbmM0qm0fpgq4LzZS+szZjk0MSLRs70UNjobXeKqGmwzvmfNm7N9WFvTcxpLMFeRhUOKrkF2wmarA/UDBNRM0/7PDREzMKBrit0olnEOs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770862642; c=relaxed/simple;
	bh=2WLhpjImW+LSfrzgEz28RZswpoJhmE46oVmh8lhDHjU=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=obBvpiOBqjwfCsV70K5Lw6KJRIIhVowSXebZ/XF6yi700AhFCCeV6DTMgQJ/kG3tYUYkRCHjO+zfSaneFReG0MJldPuWAljcn7zQ74sVNOkjFENRChATeCLA/ymSDdPKJ/LkETdWKNgM7xVFYVz7jITFJRBTXiSNd3fTJ3vVK50=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=DWca4KhR; arc=fail smtp.client-ip=52.101.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="DWca4KhR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H7g/KcbsNI7TgD9wtUmzcAD5lZsgVqDvJhmJ4kPEMtd3eSJmHWNeqrAiFaQA6KcB9OHQm7XtlWmRQtiUkRN4V6Y/H7BQh2EC4TyhnrUbFGlze2ETwjPXvC0oA6aX26fSLfzFltVMcROoNUoRUUtWV/ZvJw1xlb/XcawUX9lhrAV5Zk01hD9oKv6vwNhwr9s35Kn8SMWfbKwjZEyorjUZeJfzJzPVxrU0ld9vx6rysSkYWHbd2apMKqqzwgDW+vRs82cn+eftKQFh6qzMrGGUmDbAjfrhZFFNVT6fFl0h/XgO8fwWwBSAj/dcFLVw0sEE4NgATW8FBiSOyh6zXuZZ+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UNHz2DT0ntxn5sc9+21qJ8T41Qd5FtsdYE7NZtOr75k=;
 b=bWFHND3GAyVyFuGSQ1W8IP7flr9seLJ+MjjlvaQaM+Y3MrHyQwlbqiwlMV5Ttfn0+P5f4hXJHRPw+2MDQhXMSuYouAx2QE9nU/kMSQ/oDnD9inU3w7I79vFLKTnV+qZJvEL4yat6O3rMycVCmRScnglNBmUmW2d4dmrpWk2yn1UJKC2c/s77ZmF7OnLqKFvZt8+3RcCC1u70XIhR8U9t7yrrY9rb6S7naInRFx4tzrdx+31fbCS8A31hI9NRkbCh036D8IK70DmQ0j3ppA8mShcSSD/fj3AeWJDT5egAhpAJjkK9cfPTrdu17qsLoHRNDz0h4n5dcVOhdj205CHeNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UNHz2DT0ntxn5sc9+21qJ8T41Qd5FtsdYE7NZtOr75k=;
 b=DWca4KhRq5osWLJI5PvuNofzk80AEOgBEUVF38gSHgZAv95OOj+5WbuRRJd71uefej0fXHy6ZapfMN0NLEIZTTs+f67h0f+NxYzwMXu1VCBxSej8Rrwn4sPmZqVXrK0WeZWn56yHn1AH6PZD87tuzu6HH3ZU648IQS4c5bHFj71g8NN+WLPm/HR0csANUUkL2RoPRRDVuribpBzt2hRJLgEHlDlxD2++oYfCyB505rPOnxnP/UVRFCYZGEW8JaHJVQn5CotXgtEjrTQbMtht7T9OqOV4/C/wOAhhDx0b4RJdHI56FXkv6+sb0Ua2308UcCHYrf8bqEWoQUFxdiADuA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com (2603:10a6:800:123::21)
 by AS8PR04MB7973.eurprd04.prod.outlook.com (2603:10a6:20b:28b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 02:17:18 +0000
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::d6ab:1538:d868:bf8]) by VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::d6ab:1538:d868:bf8%7]) with mapi id 15.20.9564.014; Thu, 12 Feb 2026
 02:17:18 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	ckeepax@opensource.cirrus.com,
	andriy.shevchenko@linux.intel.com,
	nichen@iscas.ac.cn,
	kuninori.morimoto.gx@renesas.com
Subject: [PATCH v2 2/3] ASoC: dt-bindings: asahi-kasei,ak4458: Fix the supply names
Date: Thu, 12 Feb 2026 10:18:28 +0800
Message-Id: <20260212021829.3244736-3-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260212021829.3244736-1-shengjiu.wang@nxp.com>
References: <20260212021829.3244736-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0016.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::17) To VI1PR04MB7055.eurprd04.prod.outlook.com
 (2603:10a6:800:123::21)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7055:EE_|AS8PR04MB7973:EE_
X-MS-Office365-Filtering-Correlation-Id: 25f72c31-764b-442c-297a-08de69dcd8ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|19092799006|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yYjBHQDZyVEd9svu5O18AAABInfS6NbG+IZ0RskzuCpS5PqN8V/SsC+FzZlt?=
 =?us-ascii?Q?sCeH8/3IS7B0zdVEhctqTPkB0fTeCW/Dbxhk+h9UYjJ1gOLnKCclsH+H6Q4T?=
 =?us-ascii?Q?3wHD+6Mfpsi6GQ/oj2TDnZHj7yOZJvNnTs1oU8FQDUouHch0NyFhHAqSFZKZ?=
 =?us-ascii?Q?Yid7Lx3i1Gd3WyGWdBkv7ywzmUV0aiZrCWPDVUzTxwO1tT6aF5WXADegUTE9?=
 =?us-ascii?Q?tENOOjeE3yGf+l/kQ1Rgex2Cc+sYcdWGSAIfvHHikcCOKX+N4kYsNXSPuUTp?=
 =?us-ascii?Q?9rO7jy8RMJzWAp1dgGCDbYeY6/qCJ89em4jJ6qtBimmgZ2y0Uk0SNnEr5+il?=
 =?us-ascii?Q?EYt0MX9VKlkNrHGq+vQ8NKinRyHlUzG7+RSM0IailmxPemP9h0EERg89YsQj?=
 =?us-ascii?Q?pPfKtpOwcAILoqxSqKFyRQUwabpsQSU9WUuj77E7aYk8doIZOiSlDlupI6F2?=
 =?us-ascii?Q?Y6UNCfuSXh+xzYRHv/I5drvvmSF2gkm2QKND4xrSz2IhwEchNhHvXrdlTFZA?=
 =?us-ascii?Q?PfttmZeqtSBrD+1iGPPpgD+yY881S3qI0N7z27Q52zTGxRTpBZctG1bAKhUk?=
 =?us-ascii?Q?XtwggAdTiJRnD9TtA3AdszLWaAAQC6l4zPyVxlKjcIsPenlucsPYP5rpegg5?=
 =?us-ascii?Q?X/rEkq83MzLIMu4aKG3sypkBuSS37VNBQU6BSVQZY1lJotwTKJuO5sAxdWqx?=
 =?us-ascii?Q?mGXWuzThBILkrqGjj3xs3yaogRn+H5R88Sn7RAzFhtVwgi8AQYEuivbPXHNP?=
 =?us-ascii?Q?OYtpKE9Sz7D1zLHhUNBgLe4S4rT2ykDbTW4W4fBuurL8IeQIYNWil2UjKYtu?=
 =?us-ascii?Q?J8up3vYMsrrIzbTkb+UwHGcVHTWZwxDrlljjH6IUMAIO5SKhV0+o7QpUpvHV?=
 =?us-ascii?Q?Z5up0io5wDZb6sFowwHTPMYegnbbKZfkhs8OWNxZK41SjVR44w6EiexwBiH1?=
 =?us-ascii?Q?G48a4LveLjw7uJfNVo3NmfezpmkZy3PqrLtuy7sFJEVEKZ+NC+/tCVUGiMWz?=
 =?us-ascii?Q?U6ZppqmFb+11JtcBsx+akUkPx6CTUy26FC+FSIrbG4wtPp7prApxEZyg+7yn?=
 =?us-ascii?Q?FCZPh0MgIgWGhFi09Yp6i849nr7JpJBEfiMjYG7+nAfLoP4nW8jQMgOxt0FS?=
 =?us-ascii?Q?2DWERYL9KugcF+38vzj1bpHXOKAHY2K56sJwdDCz/fsnl/Ad0J5bEF5Kq8mH?=
 =?us-ascii?Q?ju8LArtyZS/Vo5NXOgVcI+PGefId6w6TsV3ofZ4eSP4g7yM4JFn0ez0cVfb2?=
 =?us-ascii?Q?VC5Ykh0I+uZUgZHCHXXijb9AsWmnBquj6IaUeeXzOo9DAJZq6g9qo09fPk9Z?=
 =?us-ascii?Q?tl5wmJ2eNdihH4B+5lopADbJL1Y+H91uhs9fWj4hmXRPeOaKGAr/bVllnRZF?=
 =?us-ascii?Q?MjnDTBk0byhk4un0GV2hACCAOhV7wUF2hpZN+W9jYy8vnXZTCESiRb2mRWBB?=
 =?us-ascii?Q?GsI7Fi1MpUVF+5DbJbXMCmdb6OgKH3HVHaGgA6WNhQ1Aw/GzAfQCXyB8vQej?=
 =?us-ascii?Q?/20kYVCocMfsq1dyoUQe/8oj4VNxo/6s4xvrf6XVAc+snD4FrDpZJrcYl6yg?=
 =?us-ascii?Q?hKtF7gASoP1kpxDJJVRvSefF+8/iAFE2Db4bjaq1w2R5kvACuaOVwnAgTX1E?=
 =?us-ascii?Q?kalF9qDew6AR7E/zvxwiA3m4MGV35mAHBWW7TD21Ex8L?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7055.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(19092799006)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kcCeXBmBJQDpqWixACl29QisnXV1GFOdd8QR35g4Klkf1s3FLFPuJlnLMCjp?=
 =?us-ascii?Q?3X0H3O0Ym2tGzbt3W4Cc8orWGtO50o2npczNbNtBaD2vgSGCRS57CrvRVNmL?=
 =?us-ascii?Q?273VbkuBF8led/ubYanORNIfcEexbQBr4+Ez3FpYA93vf8kZ0X20mup0rIDr?=
 =?us-ascii?Q?8GVfn/96EtYbDVlA5fg5Mz85GoDEf/wA+77JV2kR1K8OPyIct154qgWg0l9X?=
 =?us-ascii?Q?c3+PmTgDn/UQqNPURyB29pl/Bt4EPA02WV6xJf2k3SmYLjAvba/IBhf35IgH?=
 =?us-ascii?Q?IczymfFEJx4S+jvFt6vuhfIL9diyGDFpyPbXoXUQ4l5fCSbW8Rs/NAlyIppM?=
 =?us-ascii?Q?D8yzzvExj+t/AUz6ZSleOUmqRqS7QOZqvrQS1v2ibauQtGHh4r0TVsRxxnwM?=
 =?us-ascii?Q?GI/LACXd+pCv1vOGMVQtUPRXy5efHzwwWkJ5+WxnFOk66LpY/6DKUcR+Y7Sn?=
 =?us-ascii?Q?lhLHHlp5iaerFqoZSIq/VWnRv3S7qprpVMbGq4KViELFMIz8q5tGpOdiEE47?=
 =?us-ascii?Q?juT1hSe4NF4KRui2zCz3+DD0Ko6zctmTPhTnRfE56ihFHQzhWrHWg7qzdphf?=
 =?us-ascii?Q?++6KoWrqeXAZ35XrtaBYygL3REsbzPCxsBIeR5+JhL6vC1DmP3Eysm9c15vg?=
 =?us-ascii?Q?3wShTDUNCof4ikhvnEvxCiY1anF8lIQQCfImSc+1+ok/3UQ2CkymSWO/8Qdk?=
 =?us-ascii?Q?s2sIWSsV7BPN2jZECGCY7FpMD9LJF7V7VFssb917Nd9KA+yNIwNklw3khAM9?=
 =?us-ascii?Q?MD9irzRH0bB8/AHq5YcCt8TLHgrk/V/0sakUtqqEihnlGRQtg9fNk+wOWREZ?=
 =?us-ascii?Q?sxVm6aFMROJHt/UUrRR9w2bYiY1K+K+Wzs3rQm4bxzW5dWFQJF3wQcuSCpBt?=
 =?us-ascii?Q?EYMFS30+vCp5Q/kXlDFVfV1lO3ER6vu4sgG+z9sP6N19LSqd9nnmPT8M9A+j?=
 =?us-ascii?Q?KdgKoqTIgbK5AXkSe6suBPe3oQVF8zmLk5YeFD8cdaQ25SgivCttP2MBRz7j?=
 =?us-ascii?Q?gM/khLyCywEz2EROw1/SiLP+C+cb+A/VoFdqV1+eZmm/ZbVcqWpQJgbVENYb?=
 =?us-ascii?Q?PbgoPsDsTR8N9m9yGFm1PtD6ZFCA0JmI40T1j1evKJW76eerMNo7tRPaIFNM?=
 =?us-ascii?Q?m3sIBgTOGMYuNyeB8h8pv4Jn5E5NDd2vZ86WVKkVG60M/jTjvPfUb/4VhLpC?=
 =?us-ascii?Q?SD58pEPkt7CtEX5XB2IuWAQTl9A9x9SNSw462IunL5LzH+7I7YKjLZeXR8E3?=
 =?us-ascii?Q?wudflx60vp1pywuGR5OYvRDcPzATvcGd1OQoOJrF+B4qN2FO2aU6yOoYr1GN?=
 =?us-ascii?Q?8KumL+fp+OHt02B6oqY7o7Y4X+RMTqrZrkf7MZyXInCq0coPm2j6+Kb5yLb8?=
 =?us-ascii?Q?CZ3R4lFxC+cVTKBridCSmDLcHP3/YS9gvzA9PJBmm5DWrG1rLd0PqBplK8t7?=
 =?us-ascii?Q?TFDP9JWa+3gRdv77y1+Mhvj40J3HDrTzK9DrLESK3G2KrE2X6XlRJK8ILDJW?=
 =?us-ascii?Q?I3LR84ohbsVXQme8CwhTZsVqt8OI+3lZlg+3uiVFymPhgFH3TnHWSxdRX32x?=
 =?us-ascii?Q?AY0tx7yaYWxoALOkoRQjOgfckmOYGDGKvgjiu5WjD08Y2FJ9t/RvkT1REP2W?=
 =?us-ascii?Q?CyPTq2gLPOxtwGBlzu7L5zGrp4mZ11MfG9q7i9mKQcmMahSRRJC3ko1ERvsC?=
 =?us-ascii?Q?3/59whYqJJMDjP8MKS0mjoh1WVxsCcALO57yo3bEhe4MnrU4xkRzwsJii/FK?=
 =?us-ascii?Q?2RJc+7MyKg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25f72c31-764b-442c-297a-08de69dcd8ff
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7055.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 02:17:18.8644
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n9S+YJAWakxumSom2JJlAiZiVknF6elunDB65xMD7icGCDqEjohqNY18X7dt4L976P5BB6QuJhA/5Crklhd61g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7973

In the original txt format binding document ak4458.txt, the supply names
are 'AVDD-supply', 'DVDD-supply', and they are also used in driver. But in
the commit converting to yaml format, they are changed to 'avdd-supply',
'dvdd-supply'. After search all the dts file, these names 'AVDD-supply',
'DVDD-supply', 'avdd-supply', 'dvdd-supply' are not used in any dts
file. So it is safe to fix this yaml binding document.

Fixes: 009e83b591dd ("ASoC: dt-bindings: ak4458: Convert to dtschema")
Cc: stable@vger.kernel.org
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 .../devicetree/bindings/sound/asahi-kasei,ak4458.yaml         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/asahi-kasei,ak4458.yaml b/Documentation/devicetree/bindings/sound/asahi-kasei,ak4458.yaml
index 259e97b7a3c0..3a3313ea0890 100644
--- a/Documentation/devicetree/bindings/sound/asahi-kasei,ak4458.yaml
+++ b/Documentation/devicetree/bindings/sound/asahi-kasei,ak4458.yaml
@@ -21,10 +21,10 @@ properties:
   reg:
     maxItems: 1
 
-  avdd-supply:
+  AVDD-supply:
     description: Analog power supply
 
-  dvdd-supply:
+  DVDD-supply:
     description: Digital power supply
 
   reset-gpios:
-- 
2.34.1

