Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8ECB2D3EFC
	for <linux-sound@vger.kernel.org>; Fri, 27 Jun 2025 13:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751030552; cv=fail; b=RX5feRF1Ca84LLtR20ifh7Ns4u5cee8lrFGMzgftgf82oPFVRtp2fVTKPC62oqMRK3RjC4RTVfaVQ1OjsNTBOQjhK9KFoWpRS+3MJ4wgW/4zsAXNOEw9oWsgPbw5OvP/0S+pB1xwZkBHHHoFnqCO9GT6u3/DTTw4/C7noxeEdtY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751030552; c=relaxed/simple;
	bh=Nc/TRGzbx5yaxxLl7ofrQXhdSSZXP4MJy5W637wRg2U=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=fq7pm6Rd/6o4q3ceSbXehLTTiP6wv7nY9+k3V8nRNFx9Wc5AXrCzUuKQqittI6eS3Nc/VhYgOXWz+XAxNqqz+Vv13ePHOeSwSwQe96Gr1qkbuGK2ZhJeAFAc+hDXCYDVm/u18EJknCaejSf2aySPxFKl0R17i+UAY83HjQFkha0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=i/dohF3F; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=AM8gName; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="i/dohF3F";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="AM8gName"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55R5p0N2029720;
	Fri, 27 Jun 2025 08:22:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=hE/YWnnBJ6j1maQ9jVRyAdEXOfjfgs3N9ez+YL9qq1A=; b=
	i/dohF3FVcJaRtd6N1KJhsOrbTpq7lYLQ6qWldDj7SldJEVGTm9TSs2qaHovtt2k
	llMig1shf4y8Q1MwTeO5DUeUeMzXfG0FP8puk7Wn9LUsgPuEG/ulTm0jhy7SjZCI
	ttKFbCGbdBiNsYE2iZ5CPdAoj8RMKjdyeHCrEWJdc85iz+hvJDVZSWZMToGU0+7r
	YetvDy23N/Fj9QWnuhYJXxwc0WP+p6l1Lq4sR44s9Jm0hKsZuGpkJboffNGePBqC
	Q0vMx113sks+NxupydOOQeZFivMtivPQTjHZ7zwv4vFHNH0lxp0rlDxIsSwe6px9
	m8buhZS8T1AmDgMM/pMZSQ==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2105.outbound.protection.outlook.com [40.107.94.105])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 47e5tyyw1d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 08:22:27 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jmH8UGM1F43waTS9Bfm6DniloiHXyABl2SIGTSiRKqEZNWXcO0zswkLq0pc8o46X1Fgh2d4OLZYVqkU+58pFY+nsyUiRksiuKKP4r4c39Dut77SiFsa61x1n2np8JPSCULCg4npL8wyutrSCevcma+ypWSLdWS7phSvyf4h+2C+ygdEldbBikXrmR8lQPunQCTscho8CchdwFVxVk9jhmCla/APz7ZmmCV7AGKIm1sdhGHuoNBDGrd/D6pqHK3IUikXFrBYbl7+MrgopczRcaBtFiVJNmW0639P4pvOMz5mTwgIO08tsRkJy936SCH4AqWhD1qUcdB/vtq84+EI+lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hE/YWnnBJ6j1maQ9jVRyAdEXOfjfgs3N9ez+YL9qq1A=;
 b=xhGjimS+JVgpImYhcR8aLCSdZC5rFfPLTWjCDgCriYpnjPmEkq3C54a54oI2BA1EcPYKZm1fy7PmHYxeH20DEcJqYzG9qcSspEf7FdzmolAIyKO30Gc9Pv8C7pgP2gJmntV694b4ckyqqifS72DYhL1bxWU/sOME/NjFik6NVbM/ka6h8kCi5VyHsCIGDFJ+8H72L7YoUtq/ekbmeCT5JtrM36WFqIwdLdK0d8u36tTV5pIXjWOpmZuM7iGGaKx2bcyCvApYvo/IuT4LwpLOZL91YC/3ImB8FqNeSW+Ya0rUKxsIctIcD3jlJD4vNrNkAG5+usQBQh/gV3Ho6yR0ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=suse.de smtp.mailfrom=opensource.cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hE/YWnnBJ6j1maQ9jVRyAdEXOfjfgs3N9ez+YL9qq1A=;
 b=AM8gNameZwHbqqAVKDZAjQziJ/yRDgyKXOrP+jRj4/LbPBS3sEjlmhYozzAX0gkrkFO25BWHlUhr1SEWDyg+3KRokmMfJLMzCKysK80PMAdRebl/OwAv5fXyNCS2gyYyEtq9TUuCEJtQCgewScWd4mp48fTZloSukPwNJE4v1iM=
Received: from SJ0PR03CA0280.namprd03.prod.outlook.com (2603:10b6:a03:39e::15)
 by DS4PPF32332D897.namprd19.prod.outlook.com (2603:10b6:f:fc00::a16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.15; Fri, 27 Jun
 2025 13:22:24 +0000
Received: from SJ1PEPF000023CF.namprd02.prod.outlook.com
 (2603:10b6:a03:39e:cafe::bc) by SJ0PR03CA0280.outlook.office365.com
 (2603:10b6:a03:39e::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.21 via Frontend Transport; Fri,
 27 Jun 2025 13:22:24 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000023CF.mail.protection.outlook.com (10.167.244.11) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.14
 via Frontend Transport; Fri, 27 Jun 2025 13:22:22 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 33621406541;
	Fri, 27 Jun 2025 13:22:20 +0000 (UTC)
Received: from [198.90.208.24] (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 28BD182024A;
	Fri, 27 Jun 2025 13:22:20 +0000 (UTC)
Message-ID: <e6451c29-2ade-4b73-bfd7-f48bafccfa98@opensource.cirrus.com>
Date: Fri, 27 Jun 2025 14:22:20 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] Reorganizing HD-audio driver code?
To: Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org
References: <87ldpdgzle.wl-tiwai@suse.de>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <87ldpdgzle.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CF:EE_|DS4PPF32332D897:EE_
X-MS-Office365-Filtering-Correlation-Id: c24c30e4-3ac6-4583-ad77-08ddb57da684
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aGkvQjYwbkxsVUxyYmxOaUYxMTA2TzhzNVRsNGZSUThoUXFpWW9OSUNZVGxx?=
 =?utf-8?B?c0xuTFlPTUxCdXNzeE5uRlM4QTAvMEwyVWhSRXlVQjlWYUJhUnJKS2xpUFpW?=
 =?utf-8?B?KzRHNk9TdTJ1Q2VIaFppVHEvdlBBQk9VQVh5ZFdKbEhTd1hhcXNFd2w4Q0JY?=
 =?utf-8?B?M1hSZFVibzllR0h3QkdCL3N2NXd4QVIybEJOL21jQkRrSkVCR1ZXZkc2WVd3?=
 =?utf-8?B?dWV1WTBVNjZhc0hWdVkwcHp2VEgvM2tSaDlnODNtNUxKMThjd0VXTzVHQVhl?=
 =?utf-8?B?bExaK3JJclZsL3VHcWpaR3lMdFI5SnFKd3NGemxCSEdyLzNTMFQweWVxcEdk?=
 =?utf-8?B?RHBDZUFXZFY3RkhrQUVZeHo3VHc4dm1ocHFQcFRWU0pwcG1pM0JiWWNnYmoz?=
 =?utf-8?B?ZWVNSE9tQ0lOanYzdkdOTWUvNHMwM1VacjdwazRNUmhPQjBqOXVWVk5aem5D?=
 =?utf-8?B?YTlrbnRWTVR5ZnNvUW1JRDVCN3FZL0FYTExHR3pQRmE0ME1OWERWTEtBTVll?=
 =?utf-8?B?cStoNjNmdm8vaXlPOVBWZ0hEbTd4b1VPTGVjbHVLMCt3Q0YxaVhCY1RGUmRO?=
 =?utf-8?B?M3Zvd3hqaDVrRUFCNHcrbDRDd09NRFlXYXZRcWdvREZmOEthbVk1SXJQeTA4?=
 =?utf-8?B?S3locHlSSTJwOW9EcWxLekFVSEFZeUljQUpIUFo4c2NyOEpZT2RmQUFxOVM0?=
 =?utf-8?B?c2FKNVZ3QWFLOGxheDB0ZkYvRTlkVklFNkN6c1p6YnNVRHA1NnY0ZU9reHFQ?=
 =?utf-8?B?b2NCUktBc3VBcVorbXVIdXV2by9acWc5b201eWkxbFJIM09OQ2o2L3lLY2lS?=
 =?utf-8?B?WFhHdENTUW04YS90aS85RkRvalVlWnVGdDlNSXBHTE9kYld0STBUYWpqbTlT?=
 =?utf-8?B?YXgrTlNsV3EycEVhSWJXeWVPVmEyL3NxK1dwZTJqMTg4K2NuOXc4ZUplNWdL?=
 =?utf-8?B?UThtSi9VK0xxUXk0WExyWWZnbHVRZnhod1JKYzM5OXVaOVI5b1dNTVVoNmpQ?=
 =?utf-8?B?alBtd010UHdPdWR5NklpNUtXQUl6am5LV0V5N09ldGsxWURBQ2NCSXFWMExP?=
 =?utf-8?B?ci9lMTdtTlF1bHhBNlpTK09hSmlHV3dnU1JlVDR5QVZKai9PZmlrbUFFRlVv?=
 =?utf-8?B?eDlFTC9YK0ozZFRVRnU1TGhaSURiQ3RsdUFOcXcwZWdLTzZiWm12RHJKcWdL?=
 =?utf-8?B?OWpqc0lSSVdsOTJNWml2OTJZcGRFVWttcUczc0JGQzJ1OE03aTJDOUZCQVBk?=
 =?utf-8?B?ZDU1QXlEcGNIMEVndDhISTdHZHlJR2FTZlZmclQzTzlrREkydWhPbkNCZ0M3?=
 =?utf-8?B?eGI3RW9Jdm45SnlJVmw4QUpmY3d1VkZSMTlwNHJ2S3UyTi9yWEJqWk5ydlIr?=
 =?utf-8?B?SmgzOWdNd3JPOEg2U0FCQWNWblRBOUdPOTdLMGhrTXdzSFdYRURYTkFROVRn?=
 =?utf-8?B?OCtuTVRycFBNcS9rdVZUVlV4K1lvaVlxOUtSUzgxSzdSWUR2d0dUc1pOdnBI?=
 =?utf-8?B?WUxoSnR6UWVEMzJjOS8ybFpaQ1RZMlJJVHBhNUZlUy9May9MOFAxcG9vZlBV?=
 =?utf-8?B?STlHdEpzRXg3UVlxQzNJSk5rYmxnTFEyR3U0ZkZ6NCsrVEg4U3NWRjdaSGpx?=
 =?utf-8?B?K3BBRjdxMGlFK2M2SENIOXdMZ2sxbmI2WEk0T0cyVEt1TzdGK0JnQkIrZEp3?=
 =?utf-8?B?RXV4c0pPOXZXNkdNdGl3dUtsYmJvRXZTYmI4L2pKWHRGRVQwSzJ3NWdKK2tG?=
 =?utf-8?B?bzlmNUdKNzZNbVFUU3NjdXNucUF1NXArUXIzNkE2QWRmdXdQMVNienR6ZWpV?=
 =?utf-8?B?L29ZWExXdXQyNGtjbWllYmVCbS9jSFJybnZFSGVtaERFeDAzK283bU16SENV?=
 =?utf-8?B?NWVlVHpuMXE3VG03djZQUmlOTXR6U1A2SzlPZVJzVXFDTEMySUxOUlRjejJz?=
 =?utf-8?B?dUIrWVhIWUZhbThCNDJ3TWx5K3hmQ1ZkTFFSejNwM3k1MnBUWGRvSDRySWxh?=
 =?utf-8?B?U29uVmFxeUswUlVGV3JDZ1ZJQlNobElNQ2Q2VjZrclBodjdVNHVlek9odTRT?=
 =?utf-8?B?UmlGVnhUM1QyT0V0QjhubGo0Ymxra28yNFpOQT09?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 13:22:22.2333
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c24c30e4-3ac6-4583-ad77-08ddb57da684
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CF.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF32332D897
X-Proofpoint-GUID: suHJsaeteKxRDeB9aYrAAaAKCsd58_q6
X-Proofpoint-ORIG-GUID: suHJsaeteKxRDeB9aYrAAaAKCsd58_q6
X-Authority-Analysis: v=2.4 cv=P9E6hjAu c=1 sm=1 tr=0 ts=685e9b13 cx=c_pps a=DgGpGtaONXtiYPP+4HxLvA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=RWc_ulEos4gA:10 a=VwQbUJbxAAAA:8 a=Pc1rOqsZVEGyR4IWAOMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDExMCBTYWx0ZWRfX1flStruF624O LHSjWVe2Lx6TTsZGVHt5hxoDMQqIOZfXKV6BCzXE+nsDN0DUlYzUBWOaWhmbMlsNDPmnUVJDRvS hxSaIEMc1F0jOj25WJ53sVZzByTas23MvyqFjr7dB8OcowngwbLoO5ukvfeAxExWC7yivI1HF31
 On2xQJeV7NirZLR2Bc5poufrmZdq+2Jpha9ddsw9Cp8MThyqfrJxlXCp8B5aBpwA27leSTAyy7f ihBxzxDOKCYIYQ/RV/DGLubfBASIa1XQ9EBBbZ5H9ihi6CF+XUkvfcFe33zQu1re2yZiv5rfDkt RmRBLYvsNxgEMMyrmVAW+Lj80v+8ZMR8DFY1NLi/vJ9rMQOtyrLa7OwA1wShno7GfI5LOu1u3QP
 QQQa1Hrly001N56V9O+4+QsGyCJKCLS+06brRUswpI9KKlDeb3JLK0DyByRE7SNshDUfQiTw
X-Proofpoint-Spam-Reason: safe

On 27/06/2025 1:04 pm, Takashi Iwai wrote:
> Hi,
> 
> HD-audio driver is known to be quite messy in both file structures and
> its design, but until now I haven't touched its files paths so much
> because I set a higher priority for the easiness of backport to stable
> kernels.  But, you can't leave garbages forever, it's been already
> high time for a large clean up.
> 
> So I tried a quick code reorganization, and put the result in
> test/hda-reorg branch of sound.git tree.
>    https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/log/?h=test/hda-reorg
> 
> The basic idea is to move the code from sound/pci/hda/* into different
> subdirectories in sound/hda/ per functionality, as most of the stuff
> are independent from PCI, but rather HD-audio bus specific.
> 

This all seems reasonable to me. I always thought it strange that there
is a sound/hda directory but most of the HDA support isn't in that
directory.

> The Realtek codec is split further to smaller pieces (which was really
> huge).

Yes, that file was very confusing having support and quirks for so many
Realtek parts all in one file.

> The Cirrus and TI sub-codec drivers are moved to codecs/side-codecs
> subdirectory:

That's ok

> They can be put to each own directory and drop the file name prefix,
> if we want, too.  Let me know if Cirrus and TI people would like to
> split to more subdirectories.

I don't mind either way.
The hda_component* files are common to the amps and the realtek driver
so I wonder whether they belong in helpers. They are only utility
wrappers around the kernel component-binding APIs.

> *HOWEVER* the biggest question is: whether it's worth?
> 
> Essentially, this makes almost impossible to make a patch for stable
> trees from the original commit as is; one has to translate the file
> paths and adjust manually in each patch.

Depends which file you are patching and how much it has changed.
Git can figure out file renames (and changing directory is a rename).

> Also, of course, if anyone is working on HD-audio stuff right now, the
> work had to be adjusted to the new file path.  It'd be one-off action,
> though.

Speaking only for Cirrus, I don't think this makes much extra effort
for us. Our amp drivers have only changed location, so that should be
trivial. The other file we change is patch_realtek.c but that typically
is only 1-line quirk entries.
