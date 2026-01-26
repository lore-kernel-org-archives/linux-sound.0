Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E31232A3E5;
	Mon, 26 Jan 2026 09:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769420112; cv=fail; b=fQPgtbaGvF89IGCqnAkmdyIxVQxTzZJxCrudEEi1upvRxFXwnzs7pBwuzt5yUVPHMvSxpXLTMzvWl/M1s9AbTeCKgo7pNnWlymQvT8HB1kA0f2YlskYJlzhMPoeGYbSdMD+uxBUSKAYUgdmsbkwJ22LZBa7+JM2mFU2F3cNB43E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769420112; c=relaxed/simple;
	bh=AT+J+V6mHYpF+JdGz4NipsF/2FWKLrulkRY1XxY4n9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HVgj7QrKD+1WludNPPgiDbvq98jMTlg+qnoXGxEcoWge0oW+IkN9+MBkZ+BjH9yVUWrKjw1/TK8wbhjci9XnXkI2VHAljcVF9u5Az+Xmbf3KsQD6TuMEQjSQzziDhgD0MYQzI4O1YeHipE7RUtTg1IV3AMh65B6nMtdey5Jngfs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=LheHXTZS; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=FdQOHPNK; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="LheHXTZS";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="FdQOHPNK"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60Q7WRS52020265;
	Mon, 26 Jan 2026 03:34:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=dFi+Obd7qT2Wr5PJ7B
	B0oJzVQgBNBBjjX2BiDSolkCA=; b=LheHXTZScJQ5idXCO0xRRz2Ql5UWbMfOWL
	dElSaMqSvigK8n9Fgbim3wfdQzhD2Q3J3dD5GvfD+RQbsEs2aWTY8/Oq3oNm/qS5
	o1ffJV5ZgS4edRr3sHohmDK4ep3mOf/LBVY2nFSy/jzniaOTvOLE2VTN3i46WgGO
	gGmSnIaTI+ErrOXWjSqaoaFz6S9l6WPyc7ewFtnEzsAKL9hhg/5PRhNAzqQT7m7T
	p8XoM1tMmgwjIv73sx9Dv8JdAkqGXjsatQbKmmty0gJmIBgk6ORoJFA5+wqP7fc3
	wdpa+Tj9NaNBzLIP8el8ohGrL4xXwAK8sf4FUDS5d0n/weWJAwEQ==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020095.outbound.protection.outlook.com [52.101.201.95])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4bvvc01asc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 26 Jan 2026 03:34:39 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VKISEi1RtnNbbe8U2xvlFE/iFBOBpwm+g9uVWrtkNXBYasjb+yI2GRLXaRCdYFDovE5U0h/l2sJdN9TG2Xvec4rua1bGd2oPUbg8phJKg0auMMdSsESCSvuLDLJFTdZnsxwh6FFNWrzr39Seq1xLi8z6/WxF0NtuGRyBV+R2wiL9AeOWQ5WC7U2b4PKEi73DVOogO9vPgrhlhGqpHNCr/Izuo94p3VMUUIvpGc4thwwhA12SCglPBN8aL0sUuzwb2acR6B3dHhQIAAmOtj9fJYo1Ggwh9KWdZqhjl+XBJXpK7guic7pkRSFL8iBMmLc5XfNDOvbT4crmiKXtKblofA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dFi+Obd7qT2Wr5PJ7BB0oJzVQgBNBBjjX2BiDSolkCA=;
 b=FoPUlM5nK1HuyhuYercO+9gG5JaAUsZ+lMqOAJTnEAB1WBtElKPetNS54DLkf2mCDfyoMuRBn5guTCqn/6SpIOkoj2FHB4l+dEh8FveLVH0v9FuAj75F7nPP98H9EVReiudM88Bh3B1qP7xIxejk3+Ge/VgetcYnAU2hRYkHUOhnUz6IPDa0cLOjkw9Q1KdkY9HDl3z76KvmE+RAt1MOYk9MD4D4DhOq8tMOitiYIHawpdUuKQI7uRmyWLvvClPTV1tRInLeuIW2bJzOx20hmE6j7tfhUGBuSOK3/GCsyqDTuYQL4YzsgHet96LpSiCXH2I+i+NIpQdbtc8a4F1NZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dFi+Obd7qT2Wr5PJ7BB0oJzVQgBNBBjjX2BiDSolkCA=;
 b=FdQOHPNKTWStKGSoXiTvT3+6pdYTSO/NAqe/PZwmtjFVA830Kq94YkCsyVWx7vD1WrzH8jioovby7Jw6P60XocynMub2z+D/DCzt+YaCC2vRSxO81HtPw3pleNtQgc1+9vVQUZPVw1Wn3ZQlo1avoMSlpF1coFj+vb8mrpe93mY=
Received: from MW4PR04CA0152.namprd04.prod.outlook.com (2603:10b6:303:85::7)
 by CY8PR19MB7690.namprd19.prod.outlook.com (2603:10b6:930:7b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 09:34:36 +0000
Received: from SJ5PEPF00000205.namprd05.prod.outlook.com
 (2603:10b6:303:85:cafe::e5) by MW4PR04CA0152.outlook.office365.com
 (2603:10b6:303:85::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.16 via Frontend Transport; Mon,
 26 Jan 2026 09:34:39 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF00000205.mail.protection.outlook.com (10.167.244.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.3
 via Frontend Transport; Mon, 26 Jan 2026 09:34:35 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C86FA406540;
	Mon, 26 Jan 2026 09:34:33 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id AFB70820249;
	Mon, 26 Jan 2026 09:34:33 +0000 (UTC)
Date: Mon, 26 Jan 2026 09:34:32 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
        kuninori.morimoto.gx@renesas.com, patches@opensource.cirrus.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: codecs: wm8731: Remove unnecessary NULL check
 before clk_prepare_enable/clk_disable_unprepare
Message-ID: <aXc1KM2O3vnwBhdG@opensource.cirrus.com>
References: <20260126073528.1826406-1-nichen@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126073528.1826406-1-nichen@iscas.ac.cn>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000205:EE_|CY8PR19MB7690:EE_
X-MS-Office365-Filtering-Correlation-Id: d0fbd73c-b229-4d8d-84c3-08de5cbe1e9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|61400799027|82310400026|376014|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1ZgOUWlcuaIejw4sh2FhY4l4yrmYcYeAllXLwalqMlNle2izrP3pqMn0yU/U?=
 =?us-ascii?Q?zNXMS+iNgMfFYx1/VIPpf7ctQ7efDqlDbXBEZHNgGYigMGJCClYnY+KoIfE4?=
 =?us-ascii?Q?UX37TgEEd3RdswxcG4Uay4wXmVkKTtaQINqvKR65QQEFQpw3LUQcjBeJ9eDg?=
 =?us-ascii?Q?OAa0Q+f1Mf46y6DjYD3QKKxdCnsARP9HFXBANPr2/wpG6ZRKl/y7imWGJOGP?=
 =?us-ascii?Q?4EkmXY37pUQXdrq7c6TwGjz+fdQ2IME+/PRwo6UlCplqxSlmJvh25nO/GAUd?=
 =?us-ascii?Q?K4e/E8M+lNDzFDkQfROUBizWomm1YWpS1NSfm1+Lf9V9/9f2dJZgDDPbg4eD?=
 =?us-ascii?Q?/f3oRGJW6oTen0OFxIm+TX5soxTxbaB/TJa9BKMJ9U8N0NOdO23A8QuoPZ8h?=
 =?us-ascii?Q?NwkjzOI3L3JDds/30++bO0z+/qCjJSpUxOYQBLCGF/EA4XmT3DAUu5t7jjRE?=
 =?us-ascii?Q?rEcRxj0dthhA569DGpoHMg6IW33DcOMWxB73eb1hp2frIE3up2FOIAW+/iq0?=
 =?us-ascii?Q?NMtDGweCgdHDEKEHZKfledxYS7TfhxYlMJfylB4u1kkcWYOMCzpGka2mLWZH?=
 =?us-ascii?Q?yTu9mOvoaQK8ppkMQoIXTZcHTX1eTPI9UQ6ehVAig7X6Htk/qk2CwjwC2kTd?=
 =?us-ascii?Q?bys4Phf3aNaVWr8mUZvvhAz8B8ko1+6rn8qdbR9bs6K/L8AnepOkHIQ/cOGU?=
 =?us-ascii?Q?44Meju/lTSXJCtqRyjh53tUfZY/YK5FVSmmArZJM+HmwUjEtCsnG2SpNFlrL?=
 =?us-ascii?Q?9U/lwjalGdGOJSy2mzFSc4fVRx57d7YLoiP2foxCnnB0pMeN1Zw4IGbbqZWi?=
 =?us-ascii?Q?J8HdUpuKipCcK0z5GQ7ozACNrM0bYGp6CPvP7AwdMapHvUjtkPtRyJi5uUCG?=
 =?us-ascii?Q?U//63u+2YK3v7ZvBxvTXf36+7WXT/yUbLF4HR+KwdnuN8v+7b5KDBL7VJpiY?=
 =?us-ascii?Q?ofP8DHtTmajoWdY/YXHcTKvtjONP+xcAX1+mf52yCFxMZd0CsQLpsEG2bzZf?=
 =?us-ascii?Q?rTPWxBGa5Q7T+rDQm8lNKbQTjnwpy+pPmnkLLI5wJZHLe0toEMdPM4qGMcMV?=
 =?us-ascii?Q?DN9W422E0GKy297bGFdLxcDrR+dOm8NLEao7pAv328Ppt1hjb/Z3wAhFyipp?=
 =?us-ascii?Q?gKJqQXrjBSxWv7xPRioumEostU7HFFq+KGSR4eQejQTNx7rCkGs42mPQkisz?=
 =?us-ascii?Q?2c2T5E18gV1NNrwuVYjY6a8GnsCI9YQ+EL7unfkgTDXzDjZulGHyK9Q8Jk2/?=
 =?us-ascii?Q?s7dkU8xPLqdZzVZJTIfbRmMqJCBbADU3K//2QReRbQ8qPVpA4ygpKwpPNG8Q?=
 =?us-ascii?Q?BEMGxG/T4H8OHVg5Q0Kn/RpPZFN3ACQ1cueW7/+QY3Cp0sD1gI1K518Nejjw?=
 =?us-ascii?Q?mftPWTXxEpkiX+KVodmn3+XJChqdVS3IzWvyjz36ouXr1uYGnHa+w4PmDhAg?=
 =?us-ascii?Q?KuRhOoN4Ct+vtjz74HOPx49Iw6a/+cBtvHO3wPXNd7pzSmq3rtB12a2qic7h?=
 =?us-ascii?Q?+QswOmlSvsLy1MMefgKsabm6Aa8gRuGwAlDodOchbKAyP7NpcMlUnXvDrEzQ?=
 =?us-ascii?Q?ToVdLcJIsJ6KiiMqbv0K0/d2qEQX61h5plhF5VJ9HkFWU6u0aHV5135ZQPtl?=
 =?us-ascii?Q?DKsGUa/kanbVC2HOKSYjqqad7LXaDewy+FmvbRVLnlJvejBegnWFs2Cmez0q?=
 =?us-ascii?Q?HFN4RA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(61400799027)(82310400026)(376014)(54012099003);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 09:34:35.6824
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0fbd73c-b229-4d8d-84c3-08de5cbe1e9b
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF00000205.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR19MB7690
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDA4MSBTYWx0ZWRfX2wGoyWjrBjZ5
 iwzWqSzjapNfmM5tT66J014LcRI5eS6yIYt/raG+tJBR5gCdeC0fEhTKlJNr600EkcI/ZatVk+h
 WVgYqJ1GHGOlbbU5Vm/R9HN9H1BdaLLbGiBxBA6+DX74p2dsqCGyj9xC05DwfsTpc99Zhyb52Xv
 8EB379PKxh86/jV0PqW4aj+MwJcQCDwG0fPLCluQr2nuyEDqN4JtHIDgUn0swdXB4Po6+lA64TD
 47cplpIMjL3FYRepkYbGgb7ly4RyVSVWcN/Af57vMJNoGvEUuxyXSSRJq50EI3w5pWqdkcP6U3B
 VYrneIkplFTC5GD+ZxBtFsKjPkWiIfcmE7c0E324OdqUdrTiE4GbbKGkkLbD8oRnY9jb5xcgfJl
 t0PugDUCvqrsayfhdy/e8eeWxAky7R9viBhst99oNrHaMkE7TibjpOQ/guxnkWODQZWT8H6FIga
 UsXM1Fsd3zZfMaUM3Hg==
X-Proofpoint-GUID: Fbyc5-1U6pL1ekvknvrjxaZOTfjapx2o
X-Authority-Analysis: v=2.4 cv=KvBAGGWN c=1 sm=1 tr=0 ts=6977352f cx=c_pps
 a=kIUNUHS17e34GyAlH7lOBA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=vltb2osQzKAi7-XOfgAA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: Fbyc5-1U6pL1ekvknvrjxaZOTfjapx2o
X-Proofpoint-Spam-Reason: safe

On Mon, Jan 26, 2026 at 03:35:28PM +0800, Chen Ni wrote:
> clk_prepare_enable() and clk_disable_unprepare() already checked NULL
> clock parameter.
> Remove unneeded NULL check for wm8731->mclk here.
> 
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
