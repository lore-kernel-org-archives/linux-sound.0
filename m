Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010008.outbound.protection.outlook.com [52.101.228.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6095369D7C
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 01:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784598469; cv=fail; b=Tu0u9oTQnL5xl4IoFMxr2thZfcdqYzpq4FG7t629+/9LUHc4M02lRNdMTH8GZxvGgowYZoa+856jt4buvIVlTxGZ9LqCGIEVPl+ZxSEnhH/zKL1brS8qew8sLIlz5h9uDZmcnL/pwxAdcHx/LaAbUW5JnKtuo57fND0VlJTaou8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784598469; c=relaxed/simple;
	bh=Xi1zfAfQ6a3a75IHAol+hY5B16VZowr3OctMKH2Smco=;
	h=Message-ID:To:Cc:From:Subject:Content-Type:Date:MIME-Version; b=MtrVuwuvMKkd3zFlbnFE6A9bYkPWsHfbCvVfytGd2Gj7ZHCCRqHhoB9vz8GXVQjOB+tIHHOUZW1HCYAmc15TNzfGhaTwOGTe/f6VCsR+5mGN4GISBCjJJJkxPf6EK6QRZE9EGDbmE0zhHnv79f9TDN/nFAhjc+s4BK/Me4j0JTs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=o61bUuUg; arc=fail smtp.client-ip=52.101.228.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="o61bUuUg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tKkm3NkNFApUAeMn0M3zIIDPusze3XlDeXWEPj9uklixjPwwH0wfK8zqhLhvWL13FO89iB2irtAa0mjUK9Xkdg4wgc0b0keqgavOWquITB7+7LKTQA7klyOo4u17sQzl/yl0cO0eyui0tWL0f4yEbhySAwmZfMHvTNgjJq1ZGpt/yBxwLpY1gZRH6hQNWswN679nqBxhY6l8nHnm4UJtl+uAMeV+8pYXpfY1LTYQs1iKtLN0sV5IYMsXL08dhypCfA2rToLbf+evXU4A304KLaWjyY04Rapw1fuXPRaOq7T29R1Zz3Z4RoAvdACcpEXpGNmpg3BhkTO4Gr/wzmWQwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jKjVsKQCcgAwrGMsb2bxpJicpx9UuYT0xwNMFN+0XOQ=;
 b=Zhntz1SC3njScAkt/H+q342D91SFhEYn9hxWsxgkJT1fmVriXoWKClOXiE/blu6gr/JLEn/kdm572pGqLVekNk25Ou6RG/9tcKF8ePB6gGF4LoVelG6ukZ5DuU4pXZhrqhlL4u7091euw1U7D7eADIMW+1kjeRmKC4F7K7GUWjVEXiM2cNFpp5yMlfBfUlp15GtufJRRn6dzG+KUKMlvyFNAUHHTJNbTBy+VR7FhmYuRX+GMaxpARjIqEzKlK1gLzk9PeE+CqMIZYgjEGhkYhZCv+RFLj+5CLkPHooWiMc28XlIXYz4f0TiHvK5jjnZaJ0bGnW8m9lNdhM/9GWvGgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jKjVsKQCcgAwrGMsb2bxpJicpx9UuYT0xwNMFN+0XOQ=;
 b=o61bUuUgX9OMVkoOLO0ZK/Qu5E8dZxDaRylqAfCOINNY/R6Ki0/NeWgxGZhRoYBamihfi93+lTyYESYe3ppcFPcvoBUREXm1QFPanlX/BayqNxXaSR+J5pzBtIs1qOPWXo2cB6O8cX52AuFwEOfEsG/AFeiMl4ULPKE22EFkrEY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS3PR01MB7707.jpnprd01.prod.outlook.com (2603:1096:604:17a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 01:47:45 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 01:47:45 +0000
Message-ID: <87bjc1i05a.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/2] ASoC: amd: preparation for Card capsuling
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 21 Jul 2026 01:47:45 +0000
X-ClientProxiedBy: TYCP286CA0311.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::6) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS3PR01MB7707:EE_
X-MS-Office365-Filtering-Correlation-Id: f6ee8335-0635-4a78-5737-08dee6ca0fc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|52116014|56012099006|11063799006|10067099003|38350700014|18002099003;
X-Microsoft-Antispam-Message-Info:
	1kQHcSpzg0zAlneA6VVNnv1Gv5xYjXGGGSshuUVtaTsoAdDCA9HRSQOB/pkleprM31q56XI//2nMc8VZxgaujb4rqllKFTSVbggVY4mCqL8ZynlniM8L2Hj0s/I6WDcvPNNMUdk7XtQuYVOZzlJPM9gXCAvlEAYpq3RB0/oHNeMRQGrjj5NzrBizXU7l/2AwRiOJ4x6osVSax0rFmN+b6lQSdPU2pafS04fqYBtG6vYcDZEQoNnx1Wr69F6PJAm1nxFKtnsUTSmEphJajKURJICI7XD8xENy1n+dvZ7JabLJ2XJeVVD/VgfPRoxCO/sTRcP/EIGlWKoXeTTgB45Dzkz+D0p7eseYZFLyU/MqKVfyGG2O+vM0QqcTrpMJ/RzOOsHqEEh03RHwJw1RFkt4Pf7XxNJv4xJOOqXJp7tn+8TlukZDftFpsJwnuMf34zQmMot8r8zcu8fzkaXf0GG+kFQmGaxX+MghX5p8Llpe0Qt5gGNmjVDrHt7U2Mx3KkOwD+dlf4/WCP/A5UoBN0WU7/ituoudo0M85cZ1wZG2mzkKccynrnx5v2nymt/IQOENcFuR6e9Xifxx5aM1KMb8INB8/WWL5cKzcc+AB3zswHKQEtF85RF7/Yd00SXO+SdR/XrcIFVD2g/25KAJF1YaoXp1i6VwbniNMysEEU0qK7Wpl1nz06U7vS0LpLxsZ+J2YCdZlZnCcmKmiLWKfY/yDw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(52116014)(56012099006)(11063799006)(10067099003)(38350700014)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2SArCS/cvXuDFyhLcaJGkDyKgr37mWKscRM9kcWVYgd0szYlY9KkzgsYI1NR?=
 =?us-ascii?Q?X3dPXWYCxqseRq5JDT33v+5qN65W2SYeUzLMM6IEFz2KTUvVKMriIAZgigBP?=
 =?us-ascii?Q?5320Sc3bPB8oZqBtVStaBlR2REAkSdnnUG3VpqFnxNurbPap0XYWcrEb+xKx?=
 =?us-ascii?Q?NeiFtIJaNklloSvDKF51ILZeiJfmgGADa3Ko8SfootNyaqvGN3MNU/Ym+CUq?=
 =?us-ascii?Q?hcDJxuYdwSCM48FyWyweMZfJq126IQNAFQfPG1dGdnaCemZNgy5t1fMAX4dT?=
 =?us-ascii?Q?TGZcx2vePk8IaoJZ7yo3So8IIJ9BkfDwb5nun11EzO3Lmx2RA8jxeUX9QSDU?=
 =?us-ascii?Q?f9mbtaQJLy83aHDZC+o82MgwD1aYyq3iaYRV7HOG7urj/aWv6ifYFP5vmCB2?=
 =?us-ascii?Q?8+w3D/CAnTFLurtfu1Ruh9oEZBwt51ZOpD+96MAY/fQuN64J3tiqtBPYXlgM?=
 =?us-ascii?Q?eU3BAeqqceOqvDbn7tYNkFNloIHnZ6Xo/mEn046oCVThTM5ysYha1xDkvefH?=
 =?us-ascii?Q?JzURa3pHy/nQx18sdoXgyYiW2c6fhoEuBcNdqTykaGJ+p7F6H7LoMKxDPMnP?=
 =?us-ascii?Q?U4PZeB9vKyZtgo0HyqbVM6ApaWzTPDweXvG+Jpbqq0hO72hqFbzFcn7MB94H?=
 =?us-ascii?Q?lBZaSr/O8RctTx5XcOoF3ZXFPRWEENCBtQp8skw5Ux6y3QWekwuZjU89Tidi?=
 =?us-ascii?Q?POH7viu+wELgBLnYNgU1HSQAtqn0Y7jC7AL8UyKUdBFtA4mo/wNNtcN1ABUG?=
 =?us-ascii?Q?AFbck3kbNZCX8SD/VeNdtuJAreAYxSEeXBK2j8prWcMKUvl0iDrml3JoRMXz?=
 =?us-ascii?Q?fgcr9jWIzAgjSmV22+rvolxc4cJZCSSoyS2lNB35i5CwPxEZkGqiOpZQl8jC?=
 =?us-ascii?Q?UoTFDjcCcSW4grUQRawUFiNOQNN6q3GRTg49w5kPuk8PZhvwp+DdoZtZKrXx?=
 =?us-ascii?Q?A66X0DU5akpUjL8mEymnoM8Ay1/U3eFLulPKs6hTTYhjk+lDL2IPLt7QNSPd?=
 =?us-ascii?Q?9jbns6s6sJvNUBvv19GJ8Vg7DSt+TqkzP5yYtSA4et/7MnxIuBOFuMSy4fwM?=
 =?us-ascii?Q?hM58IIVO6KUL0sQuMDkPkQLg1IzL7d54jXog5VzRKVYclmvzx+x1XPsEGPCM?=
 =?us-ascii?Q?kxTBUQ+8mPQmtrUIEfrc3SlPI/m3mTUCTeYS30UEmd12ROq4c9S644ACfCQw?=
 =?us-ascii?Q?QcvZ97f7dI35QgVQqFIQWPfhet+AqCQti/DjxEKdSLIZIy7Bf/F4uoLWlACf?=
 =?us-ascii?Q?7Viq+7n1lqFJ4ClegnALhtXX+8VpO5LZWIJJe10AFvv+Btes5KFN8Ush+Adg?=
 =?us-ascii?Q?uPFNdC0DgX58h6aEdkagI+YF1889wMGzFLT8dGnVU+XkB268is3nfYpTp1+s?=
 =?us-ascii?Q?D0mFqpp3wQlsMOC3qSbHgx1C9Mfw/bSNNTkENcHlAhnKd6sG51JwCVQCi2sB?=
 =?us-ascii?Q?2PL/iEOTHf7m+XX4WZiEOGwtwW2YJlLSn5IJ1bLnmo0EH9r/f/1pPwnWvu2H?=
 =?us-ascii?Q?uEaUgiGM9i4zfmd9tVtGD+D+ygsPYv0GAdGQKeR79RfZFNV57+qJyI6At4uj?=
 =?us-ascii?Q?UhNbGq7ijn0R7dpdVbS8uQTrQk2zb7ZJAdgtxwW6mzj92j1Fca1ahh3s6y2b?=
 =?us-ascii?Q?TfJk3+RTa6FzfVY+vDefKVaCBj3GUowon82htYGjQeD8RQr//QC7Zckw2Vyc?=
 =?us-ascii?Q?E3fI002ylZch9PnNcX1fXcf3JR1504rykFyIh+6rVcGuppLin8UnPx51r5p6?=
 =?us-ascii?Q?borxoWRBjPDFqKElYQB26xXZTU+ZDdC35rWv/EAW56bIcl67hOcr?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6ee8335-0635-4a78-5737-08dee6ca0fc4
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 01:47:45.6806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mCxESV5Y56GPGHB/LlFdVi5J3zz7GZoyK3zYOwmlxxeN0gvW7TjlBUQx1IK/xcH3yjG6g6Tz0a0TXNR+n0BbZmuuiU1J/CJtPTj2luVM3IKxmP5gjz1lkjstfTJvW5PB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7707


Hi AMD developers

I will post Card capsuling patch.
To makes its review easy, tidyup its drivers to reduce
un-related diff as preparation.
No functional change, but is preparation for cleanup driver.

Kuninori Morimoto (2):
  ASoC: amd: acp-sdw-legacy-mach: use &pdev->dev instead of card->dev
  ASoC: amd: acp-sdw-sof-mach: use &pdev->dev instead of card->dev

 sound/soc/amd/acp/acp-sdw-legacy-mach.c | 14 +++++++-------
 sound/soc/amd/acp/acp-sdw-sof-mach.c    | 10 +++++-----
 2 files changed, 12 insertions(+), 12 deletions(-)

-- 
2.53.0

