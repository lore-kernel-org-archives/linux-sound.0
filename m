Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7BDF31E835;
	Wed, 11 Mar 2026 15:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773242260; cv=fail; b=f7FOZfhgQg7OSAxIvxs98ky59uW4dwNi8T7Y8Dt0w7XWO3XCRLcDUf8dQKVBtQugbaRQvj6gBIcDrK+rYqQ5F42Yr9LHPl1Iy6Tu+MNmRl+1IAz+omD3/O29UqHDCS5dz6lZyCX12YnX+h1WcS68FN+DtaJNPeDdXtB5XBJgdTw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773242260; c=relaxed/simple;
	bh=Ubh2hEPlhRwQ/cuJuXdZmq0kvmb+8SFDdZjHccrttwI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QTsMRpB8JgzdpMZrBNmsSvm7rWZE7nWV+kzGX/v3axeMlWJYa4GzxA4y37DTQL8dtOgpolFlXiJQm2IgVss3PiTAv6ad0YY37xqZSEhfYxUI0IcTeTd03ucKSiRO+6Db1OahmtjJqWRB7CGAbcKS/zvoRrKoFsdgTLbR+A1G/Qs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=OsdlS+kt; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=CV95Yozy; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="OsdlS+kt";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="CV95Yozy"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B5LrLP1668494;
	Wed, 11 Mar 2026 10:17:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=OFTuDZFEhQwhzl0X0MWvHIwybFRpkSAjjgh8Aas+d2c=; b=
	OsdlS+ktkU/J8vGVl64Qg/4ICSGkb10JuTdDBGJF8URodlGUchp9ONTTG/lFQtv+
	qPS4FuIeJEMTTFE2fzvQHvwn14J6fugAGPPCod4ULMxl2gbw9o6JGZKm+cQd5KMB
	E7vECzyZcmZRtdAdrqkmVJg7uQ6Hv2zsXTXgpiOQlVkQcxXGgrnGdhC28w+mkDR9
	gC6iwAjVQUzfelG+Rh+QMKIuILaq9DM0sYzu7DXGZxNNFn0nWLgD5Bev3qpz2X0m
	hUWZOKdOFoAmb+t+UBPtF38bPspRxIRXYnBIYU81MMOk4DIniGwqjQAAr+hTn64M
	T+XuL454xNefiZevFfy8+Q==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020143.outbound.protection.outlook.com [52.101.61.143])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4crja4dddt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Mar 2026 10:17:24 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=phqQSteJ+FhS7rN5icfilMjac+EHeiCuHxkTeXnxxS6CZeU2jK6A4bCRqLO6REv1fTNCWW0rT9w7kEn1GaIbd6ej6voNxl4/OoZPcK4dwyWxvcLP0Qrwt5bjGEGMJOarjlOYDp7OfPyejguW2eptIVVgBBYkPRBbc/b/S20YxyuO/ch39MeqZjjHHhuxM1OkN+BwTy/xncfr0/5rEQ2oUcG/yO8ByxhA1kB997HjkuEHpNXO4jQdJFNyC3AL0hB9aam80uKlhfLWlpYdWZaKLedRJbZpDlkOvw7R4SpaZXvY3zgyOLSrTzbcyC8j6LD5LWFWsA4OZcvLllPKk/96Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OFTuDZFEhQwhzl0X0MWvHIwybFRpkSAjjgh8Aas+d2c=;
 b=ymfpuPsSwzXvxgWotTwv1B1LrrNWK1SEDTb15123eU4VTFVkycqN+v4DnHLsmw4McQbz/YDrQlJeBCJLqNFzrykHZ2m9751L2MiwY1ACBt4dw1yl/t3ugf138NZftRoWhqUtKzpXBBkqG9IU5e2iABN23P5Ypl4CJt1v3qfHluzBPvUpiOStdsqsQJEkPV1qx5JVqIFsAXzD5FJNZbXgwbVk4gXHp3keBfiFtppyVCcfy2OVcp/sj0+BPxkE7qPaW3WYLlIDl7y2KbKuRbsHAS1Pg9hwG3Rj0th9oybOMpPv22TU1ZyCfXhdAsZIHt/+GG46+sN5T4FSjaUjbUpApA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OFTuDZFEhQwhzl0X0MWvHIwybFRpkSAjjgh8Aas+d2c=;
 b=CV95Yozy1KFlK1I3ENaw2U4WMIU5soYBOUMEtEWZC9odbaalGrjEbRdsEsqlFzL8cPDEBx035x70XiSzCY8FOOrtJo43S9KZQ9Fm/YpzpueVWS+jlJuIFuLpEHQYw3gQfCAisErjOBixX76v+BZgbz1280QvNQ1LdJMccF4gbhs=
Received: from BY3PR10CA0007.namprd10.prod.outlook.com (2603:10b6:a03:255::12)
 by MW4PR19MB7125.namprd19.prod.outlook.com (2603:10b6:303:223::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Wed, 11 Mar
 2026 15:17:18 +0000
Received: from SJ5PEPF000001EB.namprd05.prod.outlook.com
 (2603:10b6:a03:255:cafe::36) by BY3PR10CA0007.outlook.office365.com
 (2603:10b6:a03:255::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.27 via Frontend Transport; Wed,
 11 Mar 2026 15:17:07 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001EB.mail.protection.outlook.com (10.167.242.199) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18
 via Frontend Transport; Wed, 11 Mar 2026 15:17:18 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id B91E0406542;
	Wed, 11 Mar 2026 15:17:16 +0000 (UTC)
Received: from [198.90.208.24] (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id A6B0982024B;
	Wed, 11 Mar 2026 15:17:16 +0000 (UTC)
Message-ID: <efbbabe3-b42e-4f54-bef4-d27744f4309f@opensource.cirrus.com>
Date: Wed, 11 Mar 2026 15:17:16 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: cs35l56: Support clock stop mode 1 if enabled in
 ACPI
To: Mark Brown <broonie@kernel.org>
Cc: yung-chuan.liao@linux.intel.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
References: <20260311142153.2201761-1-rf@opensource.cirrus.com>
 <80ba7c33-7949-4940-a72c-582ba749b2e7@sirena.org.uk>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <80ba7c33-7949-4940-a72c-582ba749b2e7@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EB:EE_|MW4PR19MB7125:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f34afcf-b4d2-4fd5-68fe-08de7f8148e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|376014|36860700016|18002099003|56012099003|22082099003|54012099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	Nre9c2zZLhKjCoeH2wg5owCObUrtyLl+9P+r6oZLLAySSRjY71AiDcx3X/igqcpLbsoF/d2bwKXvUtoBVSyBs47U+ZMWeRQkhX0gvVy10vuW37uMW6jrnAd4VxKMoxUJgt8trJ9U3OI8lNrCpSFB53sGj5jBMgrMZrQgQhFP/EQMqDBSjDTHqlg/BYWa3JNJ60mbx2gsBV7w27XmDgf0SpPjWBHn2G/zMG1uHwOSLbjUsHVb59zBCuf1Cr3yfKLKUMUVjHrmR9XJkhrYLFe2gTUGXs8R8IsR59cdxlXOjvC5dBbOtfTecAUpQRUN4ImATl0tcB76vpiTHtOcrR9TR/ifc6kTWBazEAg4VwYp5aopyAqtTmkk4Z5fthTXGv5MA6sDXR1h37Lcx2TKB3pWHHaXiE/ZUMfICI5sCg+852G9hdn//zm5a9iI4C0giA5I0HvgPl8H7xBKFRMesULdVCckk324gC4lFOpLmgdF31J/2G2kDs4DMftdfhJl3FMHWpMdyxhGVgth98akxlvnlBzpvqUFsyxALqnfQ8RBBriZk/8frKJCAm/2pfcqxfY4fv6Ky4LEL51YkhGIm5txy+XhdszMcsGVRNsbxMd2yqnZstK9T015oT6L8EHz7A5B/rzfn5zWoQu8sDDbcSiAoi6Ztg4U9oFaLdsw7bb9OVyfCIbBYFeze50PJgN7q8JKj+7wlvK1VCfZO6spzaRqAFRevG84Uu1AvHDNZm3btFwmUtnazEE/W5XGBTzjDKecz2OdremobJAWtCPYr3L6fg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(376014)(36860700016)(18002099003)(56012099003)(22082099003)(54012099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ypUax14R6uG2zNEZ2QNr3gxLzlmJOJ7BMiKoRyc+MCeEo1AdxEiz6aiuTnxN/Va70hj9iHT8o0QLV0QZOaIbGkezWDL6qaMLm66JpsRshZHw18Tsjske1+JduTfX94XMdDeqXNdoZZrQhMVU7cuK44jfHr1YbvhOv6EHiJseaWItHEIZG1jnitMMfeDdjxSvy3+6KlkMpnr87b+85pQEPW1Ff4OpoZuhLjwkgFqFFmET9k7PdMhhwLTv5ahQ53TzL7HtR4D6Lsm9QnKe92EvM7WJVQtLDdffOBlVQIhSSNhwtj369DgHaANKe/q1INshghi7H9fB492Rnxzpvcnxuauso1zhit+4bQFvFhB+fKOBAmCN+Hsi2/7eikmskOyEqNVEOWBFm+DHg1JCXfPIVwCUSA8XuzZ5ud8r47tBOeP7BKbt9ekd8uyXsZU4fbHl
X-Exchange-RoutingPolicyChecked:
	G9HmAM8Y0k0rbbpuFIqyWWjIbhxWj0sVHaaxh1bnmmISd9JmJ2CgGT4TcjXhGVeeeUbtZpID/Qhw7ivlVhGAlxKxa1ME/ohf3RbS+XASkaytu6atSEYp79ZFbfZUi0+7Ku6+0cFLqPF63pIxPapwWgYnSsPezaPzv3JVjCRD2H9BiMseiip81hSudQWvwnwvm0TAH/MPcCjGhKV7GDCf44jGbxn16RTpBNXstyXmS5O/zkLWSJ55I/GN8THPNzJ0Ol69dgijzcRjd0x0bTxdexgOrLJQleuutvZ3BLKwwG6k2midBmkR5k7zYrx2QuakcvIqYx8xGTEMaK+bT1Qtbg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 15:17:18.0742
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f34afcf-b4d2-4fd5-68fe-08de7f8148e9
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR19MB7125
X-Proofpoint-ORIG-GUID: Je7ZeZCEoEwtsuAmGEFUeMT6gBExcTMq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDEyOSBTYWx0ZWRfX0VnP1qOCnrlS
 sQlMT8dJW20yPgDSELj8smzJLlQYo9fjqXix0ZM5JnXDt9APWHevaCZN2y+XV6fJgDVZyDvaAWX
 Y2F2LTwGX2Pm26HEcBnR4JT/37WW3OZoiQVfTZ+DKgEkYNjiXnE1eVDYYZdj44Nk60z26pe8iwj
 Y2lHQNeC7gnsSoZPdYDHt3CEJJGbM1RSSfNFpujTzdLQnXmruwGvCq0r/Zro6xrdemyZDoQy8ze
 tnVFAAQf5onfk5EGIxsRJ9F93hWw7aBFO3aIp3Yrv9lHxtOI/R3EQas6XQBrjJ4rjWBIb7/rntu
 BPRnrntbGch9SBVocmzRJBkvnTXTrLymARNxRbEEYnZHCoTsZ0IEmer1uBpAt3Oat/zFRBaFeEy
 nFDAAG6vTwU5JS4NFHTm6/o66gbyagwpdcyjM2TMw7aZw1RFRe2V+KqlHU2REg4L8M62/l1UlyZ
 HCS+i3yF1MipGeTgTwQ==
X-Proofpoint-GUID: Je7ZeZCEoEwtsuAmGEFUeMT6gBExcTMq
X-Authority-Analysis: v=2.4 cv=WNVyn3sR c=1 sm=1 tr=0 ts=69b18784 cx=c_pps
 a=LFjpZjn29ChKSHKeLyduCQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=rGLLRG1PXodMOWAtMP8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Reason: safe

On 11/03/2026 3:03 pm, Mark Brown wrote:
> On Wed, Mar 11, 2026 at 02:21:53PM +0000, Richard Fitzgerald wrote:
> 
>> +	ret = fwnode_property_read_u8(dev_fwnode(cs35l56->base.dev),
>> +				      "mipi-sdw-clock-stop-mode1-supported",
>> +				      &clock_stop_1);
>> +	if (ret == 0)
>> +		prop->clk_stop_mode1 = !!clock_stop_1;
> 
> Should this be using fwnode_property_read_bool()?

No, that only reports whether the property exists (it calls
acpi_fwnode_property_present()).

The property can (and usually does) exist with value 0 to disable
clock-stop-mode1.

I copied the use of fwnode_property_read_u8() to read this property from
the implementation of sdw_slave_read_prop().
