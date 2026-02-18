Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A5D31B10F;
	Wed, 18 Feb 2026 12:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771419032; cv=fail; b=Mv1pdeduHjItdA9GzPK3FAmEGjPdjU6ACX1HDylE5YIfShAHob+8s+qKIc7yoWcyMIivtreFThC33UbODR6L4yO1lckBiDTz63oEUZRl8imaaQ/5fNg8a9sWqujDjC7Fgs6twd7JyODJ5k1m2+AqFA+aUasvBHfisMrs8q3A1RY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771419032; c=relaxed/simple;
	bh=dNjx/LqfLoFkmjchlbjSSLHi7O+aU/K7LkRsI6LMkn8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VU2YF5YL/ecJJyuat7nhUCBFBFUGqJKX4XqUFTIPCnUuF9jc0IXVMdygJP1YTJK2hb+3oBrsLyeM6UeX9MRi7ORrd4yMAQtgqkj6L9WXdYMHuUygNVnh1skJ4hZ3CDRpDa9W8FCKzQSTIN7tpgEtA24W83pOR3jYOf+qQc+1794=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=R3WNvPuc; dkim=fail (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=rlhW4qBn reason="signature verification failed"; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="R3WNvPuc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="rlhW4qBn"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61I6ttkO2267276;
	Wed, 18 Feb 2026 06:50:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=IIGCq4qeJJ5+NeyMCuq2HH7g3a8QVbIzOVdQhAYy+TA=; b=
	R3WNvPucW5eriV8f0S/wLSl1YTpdzcHiVRvw2yUELbr9OOogwHEKpvX2y2QfQuZN
	aN5ZBcPSpZ4xA5tBjQ73jj2M1N6fI+DKiZL/wbxFu0KkUBa8errNSu73GITcy4ad
	0wfB2Ug8Sv4bziepsevvfTcyAmObxj2qG56nbnBxECKnPL+34YW2tJwr4OLI1XjT
	6R2C7rQunS04Jzwai1LswDr/HIm2dB6rKerpObgdhhybnWoxmOCP6E+8mjyWP0/G
	HTFBOKzophkZvjnLoXcOn6lPs0kI0COHNG5TOTZIktF8eNGupGvBR36LFZPQVags
	JwB++wTT3z6M3YBgCVP9kQ==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020087.outbound.protection.outlook.com [40.93.198.87])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4caqb1kwkm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 18 Feb 2026 06:50:06 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fnxGanANbuZCHXxuRVUlxAiGDaqCiYTMl+EcTI7FKx6yBCwgMV1MIxMlPGuTea6H3+dni9DS+oXJUPoEIBpImR8JPk4M96qv+GxJDBPwoJgXH0fKV83tEQOVhAmZjaH3UZYVq/2bL8istFmbOsirVMU6bGujDYw+yxKbM/c/glfyF2TlEIQpOgn8fwfkwoEq59CFa01qUQWu2sy3BpTSWZk58DwxuEh7dudCKIKi1VyJk56PrXJLUwwYd0mAXGRYyUt13yVTU3xfTI/lccNiZViCdqdHmWu2yyi7861aEon+awmwQxFICsJiZH0AbmB9yjXtot4XovY94dHLPcFz3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6tVonmG+wKhAAGEcEJhgRL4XiwOw4wJVzVb9RhINUD8=;
 b=P6x5YTRDFAUtRQtmbA2y7kufXLdtcHML7b2NBjKurO0Y1i8iSqJKRuD1YqGWHhBonfGWbeOgaOni+6CgP1V/ucG1D65Wf4qPY0zfANta+4IaymZAvN4wmxHR9lto/IM98JOsq8nm0Py+lgvLw/NI29WdAEXsQ7bgYTgmyLfYsMmYoudYO3g/7Vq++aD35Cuhnk6oKa+yKAH4BN87mD2RJUGLnIh3XuTns62Qbrwqwi0NiRB9vcX+NkbGg/+TqA78U+rmff2CH2UddIoLS7/8YvbbTWlaKvNRafPqB0PIseZ0Nz3Ou1g0CyaV6kZ+jKMYz0Dk6Hc9oxa5h4CJCcgiyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6tVonmG+wKhAAGEcEJhgRL4XiwOw4wJVzVb9RhINUD8=;
 b=rlhW4qBnhy5iHpsjzxeTCfydFZvxgvAIj1D0Jjd29QTNHiMaGdHP38PeuK0w7qjyycuBvpjaZyWCH3glC3B3RO0YOH0pOlFAD2CgEF4bbPqeXXhtTR2kx8hMCU0NntvAV/KmJB9sxiBxEl4MtxSheIX2N3coMlLGLI2hms5xY/o=
Received: from MW4PR04CA0225.namprd04.prod.outlook.com (2603:10b6:303:87::20)
 by IA4PR19MB9185.namprd19.prod.outlook.com (2603:10b6:208:557::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Wed, 18 Feb
 2026 12:50:03 +0000
Received: from CO1PEPF00012E81.namprd03.prod.outlook.com
 (2603:10b6:303:87:cafe::16) by MW4PR04CA0225.outlook.office365.com
 (2603:10b6:303:87::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend Transport; Wed,
 18 Feb 2026 12:50:02 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF00012E81.mail.protection.outlook.com (10.167.249.56) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Wed, 18 Feb 2026 12:50:01 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 7785F406540;
	Wed, 18 Feb 2026 12:49:59 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 51CBD820259;
	Wed, 18 Feb 2026 12:49:59 +0000 (UTC)
Date: Wed, 18 Feb 2026 12:49:58 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>,
        Cole Leavitt <cole@unwrap.rs>, vkoul@kernel.org,
        yung-chuan.liao@linux.intel.com, david.rhodes@cirrus.com,
        lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz,
        tiwai@suse.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] soundwire: suppress expected unattach warnings
 during codec reset
Message-ID: <aZW1dl/dzcjc8xhk@opensource.cirrus.com>
References: <20260217233533.4716-1-cole@unwrap.rs>
 <10794ce3-a1ec-4286-868c-53abb20c3094@opensource.cirrus.com>
 <1c8e8c15-97f0-4da9-ab9d-e84aef9d58e4@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1c8e8c15-97f0-4da9-ab9d-e84aef9d58e4@linux.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E81:EE_|IA4PR19MB9185:EE_
X-MS-Office365-Filtering-Correlation-Id: 681420e0-efc4-439e-d6e7-08de6eec3b41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|36860700013|376014|7416014|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?2c3X6Ii//iW35pSMAnDnaHQlvMUt+gAt5aSG/EC+Hz5i9cF5N727q46lfL?=
 =?iso-8859-1?Q?roDiyGdP100CjACm/OFS+CBOi3MU2KddWAOPIsJwdWCjhFxZNy+PECQwbJ?=
 =?iso-8859-1?Q?QLopxXAIzePdKrvim8bNTJOuGJpuHBEMHSNky8tbq3ucAHx2AbxA1aU7ne?=
 =?iso-8859-1?Q?OMfXXCdcY5Y2luuENfSvjr2UDI0IEDiPjQbpJ8/9/Y2E1jZNeeus8lom4i?=
 =?iso-8859-1?Q?yDY7chqHn0f691TH9jaSDStYzF7dgXg6fLIj5jkQK7c74zUxacdtGf8Cc6?=
 =?iso-8859-1?Q?oAQpGe4sGkfB80id5KATPBESU+CGC8w9c3obHoxn25/S5+tj4kW2zegQGo?=
 =?iso-8859-1?Q?j1DUyJDKKWOk+bO1YFVuWUx9RlKuiw5ICXPEhQl2qPrPoKsPq7/3Rm3fhB?=
 =?iso-8859-1?Q?syfpYNq5fI8Dz4S0Q8x1Ym0zwHFUAdna1LMJpoGusFbOMnOcNJb3j2VzXI?=
 =?iso-8859-1?Q?9nPadUr24VsXxc9JvbtF1JUzSUXhPW23PIaOZKw3Evpg23gbew5/Xym5AV?=
 =?iso-8859-1?Q?XD+qdnkYg8Lim5IRaJr1Hp5sgSTdmw4cJsGxkNPTlgfQl/FgaylhwH1lAO?=
 =?iso-8859-1?Q?J1y2+7R8SKTm+SrC9azc5a51y+QpfWcR4hbzMTVRidai3b6zMGbLI+UQgy?=
 =?iso-8859-1?Q?i7SGkDM9nfeXXomhLi6lNKGz3ooRqdVX5Cah7woYx+s4qmIpIoLlshq4pi?=
 =?iso-8859-1?Q?cAM30tbuKJ5cIiQ2StRIhU8/iHpdtOGnMTOQKn0v0RjsHoaCLDgJwDyoha?=
 =?iso-8859-1?Q?Q8U2RMvkQPqqLOT5iM2fJtdxR0GwsBzfuua7Ron04xMqFg/JXVlg1SYbad?=
 =?iso-8859-1?Q?CFEQ5V8ofZF5XCpzBkDC8HctEQJvK/de28PsI+wuOSMoMg4O+OgrzBB8I7?=
 =?iso-8859-1?Q?JWUzHxc364MzlnR9qhn6k9bfj5A84CISW+20jqPlMbS66GiLzrRqzVI3fw?=
 =?iso-8859-1?Q?MMrXcEraqE1HTY8nak+2InuHFEujZeAsxQMIgTci+I3YuUb8yjuKl7oZR6?=
 =?iso-8859-1?Q?tOWBQ20gcEez25ehkaLFgsEZp8lZSPsbFNfiSvPrFf0eCzxO6IG5h9bZ//?=
 =?iso-8859-1?Q?ljq+Yruz0PkkYkYtywWjwpCB8N/rFeF1pUJxbv3/r3vaE/NHYdV4DLdA3K?=
 =?iso-8859-1?Q?PobOhUSI5HMiF8s8uMC7XtRXMSJ68wlzPgFWWR/qCqghBj37k7dVtgYdAO?=
 =?iso-8859-1?Q?oi2O+HZ3e0lItLJOjxcYV3MUD4Cn6OE3a9I9IbTvS9G+pnX3LBKxXyvl3M?=
 =?iso-8859-1?Q?fBm5rROyPv+HpT+GH4CbxsQlL3k+YSX3wr5mUJH8eJUbjDF7fmBlMuZJFr?=
 =?iso-8859-1?Q?TyCl3HSAuhLzi7z4WkSIg/bT7mBTMmw9QwlVyW2amftotsy0lsylBl8Z4h?=
 =?iso-8859-1?Q?DV3pk2Oq/8NLXJnVWsaIM7GMzcYLlUn3eMYvpwoj6HmxYGjoYd96UDmFFm?=
 =?iso-8859-1?Q?EU82hg20T+40jfjCq1FP+FbbNUgBxOOvuxvf5Tp0wqDEkkmEq1I25IlPfp?=
 =?iso-8859-1?Q?pdB3m9rz0cII6I+g/E5xs2Pe3GNNBF9h6C4IccdgDjZW9IhLyVpEh9KnDp?=
 =?iso-8859-1?Q?QYiOP9WM7SmEhsCTxz0fSXmg8fNgBADLv+xcxXkrApdtv00cebnEvJX0h/?=
 =?iso-8859-1?Q?t0ChlDExs0xPyjM30ofYBKgveZukQhCOoY6i/gEVTxhilOSLfM1Z8KyXcj?=
 =?iso-8859-1?Q?hga4cKHA4uVVvVxrjMY4ZRQuysMRJsRSOdWoorlGtudWHUNtdI6nL1QFfU?=
 =?iso-8859-1?Q?gYCg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(36860700013)(376014)(7416014)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zmV4n6DfAlvXTQ+EB3MD6wrVK/5cloPjgC1sINqz7/JwPe6vDiEjwQNEmNocrA7A0/QXX20XNRTVqDrP0Wgcz0KO+tG2MSS3F3qgY73FSywVewzhcIYbYpEPeeExfKj56YLKXtEyHK3M3VRS5lbt9byD0H6Ujom2mwNvRbfAG0Uo99ArUEcBiYw4FphMlTXJOGOvsUP6okblIYonpAeGDiW+rHDquSz8qMR3RfNIEp9QMFEwQf937j6tg9Nnf0vpW306CUK436/XrNzGJmwRARGq4x3xWBPfVHwOhUKxfhvnUyHd+GtQx0MP9MVtbuNQCc2ULx2rRk3l+4F6aaxFDvJki2D/eXeMAUFjEp/WNwdSTiZBLbugUQXe2+vxCTy+cgNcRe4qsx8g6Ogl2hMcA5D0WOpPa+4+xKREoAgCRCJt0ACxEqNCQEhR+ywd+lMb
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 12:50:01.5278
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 681420e0-efc4-439e-d6e7-08de6eec3b41
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF00012E81.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR19MB9185
X-Proofpoint-GUID: 9c5Yv8Q35dbLWsU7uhty_Qan-VY4r46V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDExMiBTYWx0ZWRfX4/N63GteoU0u
 lP9SWrJCUgtBoLJfdZsfgRjD8xNzEzzZkZCw3TYcDr0lDSWJt/5ZdN7+yofnHSDR+hIA9oDFa8E
 0+Ls0680szW9piLpN1ovmna8PDySzZZv8R8M9Rkh9VO72vuBMZW2VPIh2ox5dkVMOZX5dzwVvVM
 +JUtyf75hiAL15417aw3EaBJpcr152NuZPLo2F6IEwEHAdFhwO/GBfhN2qYXDCgoYUajQ/dTBhr
 mX6CYi8j9OR9GeHMDblyCh8itfnTO1GkhUdxY5uqQys4HO50HUwfXVsLZ+AmFfLWJmrshmurv+g
 srVneKSauLkpss1AIHlLY7cwDjJHtGNHKRVfTNG4a5fsUmJoR9uy00Smq1yrhLrkhYcg+1Tzk7D
 HzMg2SxpEUz2aXGZasjhjdAsmi3oSy2A1Ly2NJDHatKERCUy/8ESKyvlh1VWLbjkz5aeJHrDSNZ
 FSBJqvmTwNv3eMgfsFA==
X-Authority-Analysis: v=2.4 cv=SOlPlevH c=1 sm=1 tr=0 ts=6995b57e cx=c_pps
 a=Gy9E0H4ZmoUkNlDDtfVv6g==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=8nJEP1OIZ-IA:10 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=3sHoDRcCNmhTJNJLGMoA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
X-Proofpoint-ORIG-GUID: 9c5Yv8Q35dbLWsU7uhty_Qan-VY4r46V
X-Proofpoint-Spam-Reason: safe

On Wed, Feb 18, 2026 at 11:50:55AM +0100, Pierre-Louis Bossart wrote:
> On 2/18/26 11:14, Richard Fitzgerald wrote:
> > On 17/2/26 23:35, Cole Leavitt wrote:
> >> On systems with CS35L56 SoundWire codecs (e.g. Lenovo ThinkPad P16
> >> Gen3), every boot produces misleading dev_warn() messages:
> >>
> >>    cs35l56 sdw:0:2:01fa:3556:01:0: Slave 2 state check1: UNATTACHED, status was 1
> >>    cs35l56 sdw:0:2:01fa:3556:01:1: Slave 1 state check1: UNATTACHED, status was 1
> >>
> > 
> > Is this really a problem?
> > They are warns, not errors. Nothing in that message says that this is
> > an error, or that it's unexpected. The message is accurate.
> 
> I would just demote the dev_warn() to dev_dbg(). 
> If you look at the original commit, we were chasing weird cases where we have dyndng enabled anyways.
> Also IIRC the problem with 2 devices on the same link was fixed by Richard, wasn't it?
> That would make the dev_warn() even less useful.

I would vote for either this or just leave it as is, doesn't seem
worth the additional complexity to avoid it dynamically.

Thanks,
Charles
