Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2CC371882;
	Wed,  4 Mar 2026 15:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772638542; cv=fail; b=TSnqJYZ6+B5gspjqRDGQZ/gfjed7OaGyYwwqOzupWXIrD8GeFlR4Dh4rmqonAAvJpoO4xTKGfmi5B5spzs1tMYhmP2qJfVDNQOb/IQPJ0eftsBggItoiOdvqw1OjsiPyYXdfaf/Oz1jKsxc+4WfA1Qa5l4m9bR2CoU0VZZ+ljqo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772638542; c=relaxed/simple;
	bh=aDcNWtHt4QQSO5E00DeFjQshGULsW8ep/6+9daAkeFY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZJe8vd3BUECsHYjHOvDUNEPNqxVLuity9wf0rAQOIGk8CaPgDAenCKTQbPd23d0NF0XntB87bnswucRlBMd07U8eWdbZ/sryOBeMkUsZztP5Wu5LMFvE7wmEH+NId6p/MHdNWVBMiR2ZZshokL7Splr+trXrWKm9kl6Cw/arqPY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=SFENujBz; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=ikCFqeAU; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="SFENujBz";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="ikCFqeAU"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245B0QN1794035;
	Wed, 4 Mar 2026 09:35:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=QexP6z5fipNfrrLFXRHe/Dlgl5G7IMwhywc+MirWJTw=; b=
	SFENujBz4PlAW8lc75jnPjhj7/X14wpkd902DN/OZxpnYQgdtTLJL2osCad4eg4A
	j0gVm97kAivAyZk9d9zrF+FRPgMRYWmnKkHVcukhcKRc+ujiH/+jMBbRfz2CIF7Q
	VBBgBzDJ5wknGuw6z06FC7lV2kx7bnxAnP0e8QZYWxUXbSN/j+m/JiYtr1SyYfTp
	oELV6u4nxLEBt0cRw9bDsvyOTCm8kTDxA+mW/YGnut56JE1hYBG1Rs77hVg0Gp4E
	qVGbX/AGSKg34m/WkTI5lndrCqezyGS2BGTI0qY7C2PMbDGOjisSQ3cJ+csbNUJb
	dqyB7urcWDf8VwreKanIsg==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022078.outbound.protection.outlook.com [52.101.53.78])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4ckxn04wym-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Mar 2026 09:35:29 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AADDynaZO0WnmWh+dWGlegXITmwevg3KhQR0Nps3opSqvlEZYPw+oMfvC709BnuT+9JiIBqeO3KWWpLxHafEh3EZqpxKaw49bb+gsd7rwINwWNZ892072SzRCYHe7jYCSsefB0+CNEqVb9ppd9L20HcbgJOapV9WbVIpiuh9B2CfZ8UMb50mBmYLTBTnScPPuGYjxTa0RyPurvaM3j0zsqITC1DHXnc0wWKiXWnKZeD0fhD9lF5Pt9Noiw+QD2ge9qxoi+37HlP7IW+nytcUUzPMuG7vfhyjQm5rwKM8yVw4k9gyPvCn9sYMNRpNhroixXVQ9AipRaAbgyCAqFYNKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QexP6z5fipNfrrLFXRHe/Dlgl5G7IMwhywc+MirWJTw=;
 b=m4Bn6qYxjkg722E5nctncvGQuslIIhd681HuYxVAorA9Oy+qbLFOeVzwoVFc+Q+9Zfz9J2ruiuBR15eKP/9C8KPvEDYS3bYeIlHbtrYLUQL34QsCw5jZm7n1h2PqcQn7oDTRNH3d6+SYZm79uIWmiQEcCrvQs1yUtiIrb3edW08pyLeTJZEAm55ulQVFp9M/s28o6mGlYJe/Ed+tlkJMQqfTvt9GtsCxAlHkd1hyepiCmFfnAFka1AzweuYwcWZp0QWY74x15XYRVjn/I1aXYaSluaMS8hd51feg+dQ3KLyk75XN25Rj8iF5fR0sb8SlCnQId6dH06g0zCMpHHXETw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QexP6z5fipNfrrLFXRHe/Dlgl5G7IMwhywc+MirWJTw=;
 b=ikCFqeAU9N1MQVYkLcOVGy8NZWdzmGlZJc2elL69JktWQ4WtfRQKhZFQgxUcNOq+I2JwZXGjgoRiEFjLX4If1PvWsfPJklth581BRMqZJq4EAHrL7ReYdIKWUY5BWWPZFmUonZ97+OUTTIBVPHSKcuV4f4aaeXznWmMYXChDxrM=
Received: from BN0PR04CA0161.namprd04.prod.outlook.com (2603:10b6:408:eb::16)
 by MN2PR19MB3949.namprd19.prod.outlook.com (2603:10b6:208:1ef::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 15:35:26 +0000
Received: from BN1PEPF0000468C.namprd05.prod.outlook.com
 (2603:10b6:408:eb:cafe::dd) by BN0PR04CA0161.outlook.office365.com
 (2603:10b6:408:eb::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Wed,
 4 Mar 2026 15:35:03 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN1PEPF0000468C.mail.protection.outlook.com (10.167.243.137) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18
 via Frontend Transport; Wed, 4 Mar 2026 15:35:25 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D0179406540;
	Wed,  4 Mar 2026 15:35:24 +0000 (UTC)
Received: from [198.90.208.24] (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id B726B82024B;
	Wed,  4 Mar 2026 15:35:24 +0000 (UTC)
Message-ID: <0a2e0299-600e-4159-be0c-dd641c87e116@opensource.cirrus.com>
Date: Wed, 4 Mar 2026 15:35:24 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: cs_dsp: Fix fragmentation regression in
 firmware download
To: Takashi Iwai <tiwai@suse.de>
Cc: broonie@kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
References: <20260304141250.1578597-1-rf@opensource.cirrus.com>
 <87fr6fvd25.wl-tiwai@suse.de>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <87fr6fvd25.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468C:EE_|MN2PR19MB3949:EE_
X-MS-Office365-Filtering-Correlation-Id: 378d6a03-1c0e-4871-bee0-08de7a03a845
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|61400799027|54012099003;
X-Microsoft-Antispam-Message-Info:
	Y8a8e0VTpAuIUQWNp6NBW0w7/GHzx+NubceGTK4ovQs/F1I14wI5WtB5iaEGPOceg5dMhUI1CeVclwFuyjAt9bEY54hMYSRkhSwj6QG9dTasjigTIxjkmhBqNyyBXBz5So0MKxH7murMKF2RMO8MLhdBd88ck52iazttL4vuXATB+aNqv2k1CWgSjd0ChnK/5IYrxXyh1BxsOgAi5j2NFUsGje4YTp0ssc8Wggln/yXgpXtwqhQy7KjSyL5hghC5zMsYa3kh2o6jvHt/bKsiDwGZ/AVUyfm/MDYeomRZ+Ddd897nugxrgG6eCNTGPYG7yFbKAdodEZUlUrlRB5KgtxHN2MEtGMJoljFj8u8SA6qHtVdMYWE9YbPn2AUPHDcy8sO33cCPloEeU1kKB9kCsw7K/z5o3iKArsRXUOLJTiWhC8spCr2u2P6u2LvSG1wJXBqRA36GmX91Qq5zZ/TuqW3QVCGCXR8w9H9LvJSJ0Dq5KKTXwGUp0k0V0dBxQAHO5sDorAPq19z9iqM7sjF3JRCNjKp81YhGhtzA1iKZZKxnk8I2iljdpGPK++IdpzlP5zKnHX/bq90k7On34Y7Xw0IwTkfYbrnZm2EDD69o5deQmSQM6lc6/x55S20V1eUxMnA3Ev/u+92zHyajTjj5jtbEH1RsCNpDIyna5Ddz/+uNUwO7WaxCgx7tCkjTFiac0UTCCEXBvwIxg5x2T4zp7cvgUPrDiI3Ocdp6xxMnpBXYTlzpISc+bRj8rd46o6AsMZYGlYVtV5dKnMg0Fu3uNg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(61400799027)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xXSAotMHf4FwHjQREFf/MKjWL8oVzSL8Eh+JyaLDgLtcNJFrsx7cm7TsGVFLDeWVr6ggQ45Cy+W1vBHESHOF6gtWKHgMzv8YuB5C+WgiWVciKuOMCysDq/mYR8KQm9nq4EQU4/xKUwGhV+fI0GIiLddPJgkPkhw21hB0odDlwv/Ami+puKQ8NWuX19Z4q+63uDoRL5t8/2Ss/bP2+wXpAJnh4Oya+ZcdOvJN8MWfSAtn9UeYXOGHhVpH+cQhveYorubdivtvcQBKoOlIIzLlOrwQtOQUTHZn+NXNcy5SV8uHmQJHLg1bJhRQhR/1J+yCuomJnTHlnatlI7kmv4nVkCjbOERz9a2nHHKfGdJ/fNtXqrM3QooVyShr0b1p2RLxO+vOrVQtbqCGstESZNz+EZV9AVYrTZjoUtswgGfMAbD9KLkb7bhRQ3sjkN72CyYr
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 15:35:25.7687
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 378d6a03-1c0e-4871-bee0-08de7a03a845
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF0000468C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR19MB3949
X-Proofpoint-GUID: uVI0yFD7Q3dTtWfZYkRE9Ef3_TM-a-Ej
X-Authority-Analysis: v=2.4 cv=VtQuwu2n c=1 sm=1 tr=0 ts=69a85141 cx=c_pps
 a=exbubrTJ8Zn0/ec8zVjoOQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=IA92vpgsWdqyGggxe-kA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDEyNiBTYWx0ZWRfX2RAv5Wo9/kv8
 waJebNdxu+JKB/DjAjgxRS/0GZZQlbrwqzzp+R/TrtSQ0CJ26xLxzvb4+qd8j54rUdZARwhqeE5
 LGzZKVAXdKLNSKujY4WF/i1n8bNydA2xVldWYTiZvAbL4B3YG4IPho8BQALV2Dj7TRQEd44FApm
 AutK8H32azQ7a556I4Axj8EejxTV2z16IcWqC8PpWVbxRNSoqkuR9m75rwC0vkONoLAGVH+ly7H
 DKwkOB5YSJb8HYacjcjNZZQ5nAuYA9aWYV/yylerPLNQzV0M/FShZSrsRQT9IIVunIZ6SPWZDUw
 SqowAhJH60C5O0iNDjTcKQaS1A3bzCHMYmOjkdT43SRup21T6c+lar2JlXcBb3dq3Edkvh5a31I
 9lH2L/vu4Uq5xWCtyTseygBe3yIFljeQXTSoPrbFXSm/EfsX1OkLdsvfucAGOpbeOHDgTNB+BaX
 7tVvdmk+xJAIhTJL5WQ==
X-Proofpoint-ORIG-GUID: uVI0yFD7Q3dTtWfZYkRE9Ef3_TM-a-Ej
X-Proofpoint-Spam-Reason: safe

On 04/03/2026 3:17 pm, Takashi Iwai wrote:
> On Wed, 04 Mar 2026 15:12:50 +0100,
> Richard Fitzgerald wrote:
>>
>> Use vmalloc() instead of kmalloc(..., GFP_DMA) to alloc the temporary
>> buffer for firmware download blobs. This avoids the problem that a
>> heavily fragmented system cannot allocate enough physically-contiguous
>> memory for a large blob.
>>
>> The redundant alloc buffer mechanism was removed in commit 900baa6e7bb0
>> ("firmware: cs_dsp: Remove redundant download buffer allocator").
>> While doing that I was overly focused on the possibility of the
>> underlying bus requiring DMA-safe memory. So I used GFP_DMA kmalloc()s.
>> I failed to notice that the code I was removing used vmalloc().
>> This creates a regression.
>>
>> Way back in 2014 the problem of fragmentation with kmalloc()s was fixed
>> by commit cdcd7f728753 ("ASoC: wm_adsp: Use vmalloc to allocate firmware
>> download buffer").
>>
>> Although we don't need physically-contiguous memory, we don't know if the
>> bus needs some particular alignment of the buffers. Since the change in
>> 2014, the firmware download has always used whatever alignment vmalloc()
>> returns. To avoid introducing a new problem, the temporary buffer is still
>> used, to keep the same alignment of pointers passed to regmap_raw_write().
>>
>> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
>> Fixes: 900baa6e7bb0 ("firmware: cs_dsp: Remove redundant download buffer allocator")
> 
> FYI, if the data isn't always large, kvmalloc() could be a better
> alternative, which is a hybrid for both speed and size, too.
> 
> 
> Takashi

I originally did that, but as this is a bugfix for backporting I decided
not to risk introducing a change inside a bugfix. The original code was
vmalloc() so I have corrected back to what the original code did.

vmalloc() appears to allocate whole pages, on PAGE_SIZE boundary but
kvmalloc() could allocate on a smaller boundary. I know that kmalloc()
memory is claimed to be be DMA-safe. But I don't want to risk fixing one
regression and introducing a new regression into stable kernels.

It's on my to-do list to have a look at using kvmalloc(), and possibly
skipping the buffer if the source data is already aligned on
ARCH_KMALLOC_MINALIGN. But that's for future kernel releases.

