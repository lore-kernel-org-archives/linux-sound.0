Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F653E5A2A;
	Mon, 27 Jul 2026 08:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785141258; cv=fail; b=qs4/KkU4l9FDo9msFOQ5vnuGT+46stX3Jt3Y5cwbHXlUoTceMR9FC6K+d4PAMjsEm1FV0CaH1LEv255BcU9h3VBvrzGDrlrF3gXIKs/4YHKG+n2Ff61/Eb1YqRsr2LS43DJBIVDYzIsOA/qEM1QtYe7FcDapo4scLT6QjHlfHf0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785141258; c=relaxed/simple;
	bh=F30ZI2wAvb//B0nHaNit9Xt485b40C/SZIPLOr/1WI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m/Eet3V0zbnG66F/p4c/Gy5ufWiim2EZH/AEtf/2xU/vN4FQ23lCRd8RTkOElULWJUPAIETWefKWXEFUapU/qaOj0GMSJquHquBIlP3FSAW5aNv4JH7AxudbPzit8Vi4zwjOF9ODur1QslH5VU1gJlvk2uUMQxAa7M+cKs/9XH4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=HhXbNQUL; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=kFYvxGWn; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="HhXbNQUL";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="kFYvxGWn"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R4aOZR3251274;
	Mon, 27 Jul 2026 03:33:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=jwjkAjePtavoseeIRa
	g8axu92QyG3XIuAK3AAgKeB1U=; b=HhXbNQUL+vf2DfXFu7LxKp7qxtmlULM/vc
	4rE1UGj5mF9eqbylnzLkb41id9NCq4D6qRZ2Gh/A5bdzkf0Bf+2QwRYzmVY29uYQ
	arekLNMDcdycAItIFOy2CT60X9YG3n39ecLdvwCPkwnwsXnjd5goQkX/WHLr5x1m
	g50DCkoUUVP4FZJwm8L6DXbup3xPv8QHamXUO2aHL/kw63zakzCL6mFwWk1bfSE0
	zxyan02ZZwpxM/EKucmYMNwnxeYCuzcZv0tSQAyLMCepg25vvaGmcUvLeUMY/LO8
	Dmw7CfAahTnlLJAWsa+F657VYu7iOy+vG6NRfoN2K9HeL4OibxeQ==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023075.outbound.protection.outlook.com [40.93.201.75])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4fmthx9su1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 27 Jul 2026 03:33:35 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wzEz5AeCoLEywq1hIitVYDEsUGXZdFM5+Ugojz33Ykk09lQ2lDyn2f7DLMdDg0sZ0BukEiVlohYEqOsV2rPVOSgwCOWeSBd9mXazLErMEMi3ptcu6XFsOKsBpYUVZdhuNv9eTsJ1Ri7owPqiISEk2I8P7lS7G5InocExDnfUXi4Ej800WDhOG66V7S7pgWvM2pwfC5ev2q/fRbWp8PDbhpq8myTXAEiVhQ1Fe7gjmmMqNClAK3kzrC4mvQ/4d8Pcl0zmW/2F8SjGsnTtXJcJuFzs2K/oh7etmcy3OQAD3GtsszE9lqmMf6atwQiydjIJ/nlt8yEG3UMdT/O/Gs/qyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jwjkAjePtavoseeIRag8axu92QyG3XIuAK3AAgKeB1U=;
 b=fdEbHGbPjHzIL6SQmUkJFRgKLQU35x97SQeX/b1EZD/uRaDP1NY7DL9hYyjYbRwVOVPr6INsVn2+Iufj7eogIShYm22tJkv4yT7dKmQm+4nmGPWiK2wAvmUO8nZ9I+2E295UUqbJ8YtAZmwyZ0RmgBlIZL4rHTkmttNmpySRoatP/UfaevBdn9i74Q2s3dhTJGEauMnuVgrVq6spxvj+qDcn+zjh5lvnIRj0HkHSnS5NH3I9m8H5AqIzMp2TmBtsJdd1YJF9/pIhj3qbr7I+RVo5aVTddXKwUHcMIoJXYt3Q5csjNzizKdQAIg1Xl7RHpWxyfya+0/5yBtpEM4ug2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=catcrafts.net
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jwjkAjePtavoseeIRag8axu92QyG3XIuAK3AAgKeB1U=;
 b=kFYvxGWnJ4CxDd7HOcWxBiQS8EEmDPzpezca2bJEV7zSpIhrrel55ZSLtO4g1jlzRwfcWt2qwNyIaTRI51dJcMTt/LlpCUNA2DxtXtfopwn7z4sU7xW/5VrPfI1ZTnayydr+m6F++hHiySlorf8t1Gk4pIfyYLWjPNrJoT2s+AA=
Received: from BL1PR13CA0316.namprd13.prod.outlook.com (2603:10b6:208:2c1::21)
 by SJ1PR19MB6259.namprd19.prod.outlook.com (2603:10b6:a03:45a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 08:33:32 +0000
Received: from BL02EPF00021F6E.namprd02.prod.outlook.com
 (2603:10b6:208:2c1:cafe::31) by BL1PR13CA0316.outlook.office365.com
 (2603:10b6:208:2c1::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.9 via Frontend Transport; Mon, 27
 Jul 2026 08:33:31 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL02EPF00021F6E.mail.protection.outlook.com (10.167.249.10) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.5
 via Frontend Transport; Mon, 27 Jul 2026 08:33:31 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id EE5E4406541;
	Mon, 27 Jul 2026 08:33:29 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id D4AA382025A;
	Mon, 27 Jul 2026 08:33:29 +0000 (UTC)
Date: Mon, 27 Jul 2026 09:33:28 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/8] ASoC: SDCA: hw_params: program upstream Input
 Terminals for OT DAI
Message-ID: <amcX2FWcpFFTsUVe@opensource.cirrus.com>
References: <20260722234221.884765-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260722234221.884765-2-srinivas.kandagatla@oss.qualcomm.com>
 <amNlSu3mcwKOmqvf@opensource.cirrus.com>
 <e37d8a26-0e06-4e9a-98b1-9fef43745b25@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e37d8a26-0e06-4e9a-98b1-9fef43745b25@oss.qualcomm.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6E:EE_|SJ1PR19MB6259:EE_
X-MS-Office365-Filtering-Correlation-Id: ac008802-5258-4355-3cb0-08deebb9bd8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|61400799027|23010399003|36860700016|82310400026|22082099003|10067099003|18002099003|16102099003|56012099006|4143699003|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info:
	tN0ZBMbGqfH2c2bdOQJDfXrJY6P4naH5BzeEGgJeJ86p2urP7TVHd63TDLtD/DKLZycvkvR6TQEUfzGTH+U3RZaeeCnhwsh1yfttKfv1f+z5W7mrduRRZlt2otr0NDsJpRM3FkaABGLE1T5XyyzliBcCcftadXQUuXPr1/2r3JGbyBelAZUTiX0KYxgAuiJdkUS0fJ1ONDR5VDGnNKBOjN8GqVgWLaHPdefVyAN/NDhzvwX0twubEnfPktK9UAnF1Ma0aPIF0zzuOKF8HzoSU05aYwRxJYxpHmcm7/LUCOAkqhRxm6Y5dqSqXojzo2558poJ0T19p36IxOThyDU2xc97QQm02iLgGL5UTD4k2NVJ4QL7HoTR0Eyxmfppsg2b+5QW3B/KdnTSMSTG/YyJaUOlbb6FSaDOm+RvKUib0wZ721zD9S9Lr/zX9HiyCUBsfcz/Dxa2KaCNRIuCBrOKgdJJIxzligXQ0Gr8uZdyJUag0bGulsO7pSqDiDqFUOsE/VuXu8kwA2nduq4HQz4ZP2o+7HJseXwGvZO1IO5D8zN5cl3qg73bHac3AffU/3e+kUoh9tfxflNLaDPS+DNjQrvlu2+29iNmGuvO9JxPeoKFuOxyjgzoXFLFMrSMhl1TGj0wfj/WlUz+Qt8b1d0rMLewGYpSfTejsSD6V9geb5fRHSpn+hGyjkLxH2LzSeEQPrU93PLwpiDuCnLuvXwygw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(61400799027)(23010399003)(36860700016)(82310400026)(22082099003)(10067099003)(18002099003)(16102099003)(56012099006)(4143699003)(11063799006)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hFE59vDTI5IFN3iN4gPbuAQAaL0vlVt1GrVbM8V69oyix4Ci8ymyYiuvishd8VtLo6bwO9rGq7f1aZBW2LyOqfFX5Lam1oQRxQSHPmiqdnvc+gWRp1Knoas2jev8LF2az9juScxMqpM5gIFaIxaZ7wd2lBPZ3Am560rSt/Asjx523DIDLafNQWRUznjuMXGy60eOFDGcRMyiIxss6Bp5P1q8KSGb8McjRqrsxlF07rcJDT/7OMDnkDMq+D5JhXjH5f8hlhHvSOzKaD3Et6sY0SQSUEJJAZt1HokN1wekGZezAWvUoG7m+ViFRfF6Jp7Jmi1493z5U+Sk9FbSA7P6YFBJAfYaZbIYnOCuNVEHb/sn0iDmhQdvnfYi7vG+MDJJKFCUB+pKMxjvrp55oCGNmrhe4wIfd+Nr559xSq/1YSJDf4W/Ibql0H5WgYxdpCjR
X-Exchange-RoutingPolicyChecked:
	j+HnqYR0mwuTuyoe0HVE44aqjuLy9YcL97X+Jd/m/VKdM9d+g+7Tus9uTAiAgH468Os8XXT0VVAtaCwBEAiaLEypvQMlGwz9Wq6tFJlTjXY78Zu/X4m3U35WcfMLc7Ertn+sSa4YvFEul9vT2qeeos2/97tF6i9orRDf2DK7h4NcMILt/rfjJ0aApbzzxu5cjwW+qfRF1ZqgdraPGBvP5PYGSJewzAkDfeQ0TW1g7gC06QVyCZ9LxOxF+Q4bOYXpCgsCBesfNhiq6HFxdI7JxBU06VJwseaSn5h48yrpufyavcYv+csaGb54WEDG/gnRgmj0+l1m51EHG+agLzIf0g==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 08:33:31.2813
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac008802-5258-4355-3cb0-08deebb9bd8e
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL02EPF00021F6E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR19MB6259
X-Authority-Analysis: v=2.4 cv=Js7Bas4C c=1 sm=1 tr=0 ts=6a6717df cx=c_pps
 a=bqsrm7XTco20ezpTcXdHqQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=OXZotQN3eSwF9qsUnxYA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA4NCBTYWx0ZWRfX0rxevK6ejc3+
 dl3IPRhg0XZs5qCBV9Mfl38WbN45cPC9363W9XzZ+EUL1pQ6KsKxe2y1QjwndhhrMCySEqrUeyJ
 ncwlqQHpywhBHl1hHV/k5J0wH0Xjjw1dUqSEtx81B+gUISyE9P8k9kLTkIgqw3kJhB8i0MCSi0x
 OXFbnkgYCN5nsZeopbg9Oc3a2FnLJlqNQ6KDSR/EOriV7QtdH6Xh+AlzloMFR4PhfmfUW2Ll6S6
 BrZGOucUk0jM2QIW4HIXztmizrehFEqf5TdSZDUvegvKiFaPNIRQRGrPay88ctWEPuyb93S6/D3
 UIab6B3eRLjdbhLvsjHMOgEp9EVh0AxxP9HEmuv5c3jSU4nIETqCGzC36Os9mF+FOjFWaNEts/q
 iGdiqkH9bwecyghUt7hIksYRi5706mesMleQ4TleZSr1jKhp0JpRr60d6wv7FJbdvwGxHZ6YoHq
 2SgZ7XaL6NylJ3QZeSA==
X-Proofpoint-ORIG-GUID: ymu0t17I2cJmy8hpsnrmvQi8he-bwIbH
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA4NCBTYWx0ZWRfX5ASv7aUKXhtN
 XT6sGBY5GnCGdEo1iIZm21TrIlEcp/wzFatRdtX6GZktvRTKOm1TH6nbNBpW1ACI/2/r1hXS6lV
 zq2sd96xPsZ0coeMqy+kcF7zM5BDL4Y=
X-Proofpoint-GUID: ymu0t17I2cJmy8hpsnrmvQi8he-bwIbH
X-Proofpoint-Spam-Reason: safe

On Fri, Jul 24, 2026 at 05:35:36PM +0100, Srinivas Kandagatla wrote:
> On 7/24/26 2:14 PM, Charles Keepax wrote:
> > On Thu, Jul 23, 2026 at 12:42:11AM +0100, Srinivas Kandagatla wrote:
> >> For a capture stream the DAI is the Output Terminal so
> >> sdca_asoc_hw_params() only programs the OT itself: cluster, clock
> >> and Usage.  The upstream Input Terminals that actually source the
> >> audio never get their Usage, ClusterIndex or clock programmed, so
> >> the power domain comes up but no samples are produced.
> >>
> >> Walk the source graph from the OT and program every Input Terminal
> >> reachable through it.
> > 
> > What was the thinking with respect to the units in the middle?
> 
> As per $6.3.2.1 and 6.3.2.2
> FUs does not modify the cluster, its transparent to cluster, Output Pin
> uses same cluster as input pin

But that section is specific to FUs, all the other units I
listed below do appear to allow cluster changes:

> > entities in the middle could change the cluster, such as CRUs,
> > MPFUs, UDMPUs. Also possibly SUs to consider too, since they

Thanks,
Charles
