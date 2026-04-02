Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74DD37FF65
	for <linux-sound@vger.kernel.org>; Thu,  2 Apr 2026 09:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775121537; cv=fail; b=twU4LmfuPlXumdjigG0S5mH7LQXcHmbYzhENBXl3lb+RCskxskNJsUzBLmX3p0Rhia7HxUggTU5JItvrbxE7o0xpcN+neu76edSgkMi6eyhIrNoHRt9elqUG1eL/Vem9QE2hW+tRNMiuLcCqpgYGUAbEQS83ofZt8L6Wb7G6JL4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775121537; c=relaxed/simple;
	bh=vZu36ojv4l7asAhsrUuOyGw2c77qaGx2faMyPV7IiL0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LHZJ4X78huAdNhD028WpYsJc7TdOTn8fEsbQbBqSCqV3OnQdkXxroavjxOhQPHqp7klSMCIGYi+HObYXSaSN59AZRzwgvq/x8NmZ8fUYl5i217s6O/jIQRCa4UimKnHqxiFbDh1vUfcy2/r8uTkn8upZ9QxF+aHr45U96TPIUOQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=MaSrpHkf; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=g2cT1E4R; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="MaSrpHkf";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="g2cT1E4R"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6322FJ0m2963751;
	Thu, 2 Apr 2026 04:18:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=FDI29FHnAaCtsFcGJRJuG8IeJfvR+Uqh98Vx/J8crPs=; b=
	MaSrpHkf8PZk7m9attmD0ADcJD2wY5oHTxNWHkxBlUI3eXOH+b1w++r3Alv3imju
	pD3SXP3Ti6sWEf4R19xk3byr48GatzbC29y4wBrc0tmAwofGiidovA2/KlmsP343
	gDnktLT3GJTIa6eUIyUS2oQ1cXKncVixNWh0JGspnNM18I/mbJDCnFsoLTdtg8/o
	jkwnfEbiwPzAzHU5rJkV8+hbhT/Tf8XA5f4dgaWd0f7zBPKuIFrYVXVXEG80Ylbn
	s07BGK8ak67ycej0hmB8T9wR7a0vzy9CUbErzwCfSSVKLC/Dx9W9F7HDuqVD3OIo
	Uz2o6I67XItHHcF0ea2/Fw==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022129.outbound.protection.outlook.com [52.101.43.129])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4d6ccxx3mc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 02 Apr 2026 04:18:44 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F7u57RkYz2LRUVG11O70AYUu2azwT2OD4gSd5+mMGxhE/aMlj4BeOHoYKokocOfDtswuioaCgyJPvgkTHyNZLvknrulSoj4IZQljpx/GEYO0iZ7HJbVr5C11vKiz+yFtEaHtpVNaWCXyZJGow7i5zniKoaXneSq9UqtXiyDyirJTUgzP24rRpluW6Zk3shwvUS1ELYmVCmguTG0ip5oQDZBEEXKlL/TLMDh5CQWTX0F2kZ//E4hxRdYgCMmh5OQKpDcB5GNYNR+YT8nh4NYauxgKYMLF4mifOJEJL5cywOeSBG7s3ewmqZGzMEDjh9kgk5WnGKOLH++KvXk/+fHVHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FDI29FHnAaCtsFcGJRJuG8IeJfvR+Uqh98Vx/J8crPs=;
 b=SvYyM1wqO3atwHmB+nQuTfEWFp/UeQiX2aoy3KhqUft1Z0fM9Vxu5mB93fZm+bjB+CPOxmVnZ1t3Gcg0I4plLtpbJyQBTuTXIOWoX2vHw5R3AJK0ArQ79fRk1fIQKUbeZCYxjMaoiS4bjTquO4AEppBkRabFveXfBkzI+dEAni7ZO1QrhJ6z40LL0H9wO+6QH51pWs2yo/HkYfn7GMDe7MTF4wadomxyQ715k0XsmnQIVrprbtMpuXd5AecZuuzLM811+vNWFAiGYsJoRb5QNeji+qXNzlZ6aqfruuf5YkrQvRqBhTix7vPw2MELbL1Em4UPtlQjD501abE47lUNTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=fdma.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FDI29FHnAaCtsFcGJRJuG8IeJfvR+Uqh98Vx/J8crPs=;
 b=g2cT1E4RKtTWe4rX7O6GMKxzXeFM3DYS7Peu6lQixQnWTS5K+xkfYlXf+CwzGLfavUFxJMs0AJSo0DKHW1Anw3+xa/vDg5KHnTSlQPCPRqqhJUSOTxzvN2lsts4pXKD+cZ+YSlrlxyCICZun9IjFlBequ2vHmnEQUBDv0jn6l5U=
Received: from BL0PR02CA0067.namprd02.prod.outlook.com (2603:10b6:207:3d::44)
 by BY3PR19MB4852.namprd19.prod.outlook.com (2603:10b6:a03:368::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Thu, 2 Apr
 2026 09:18:40 +0000
Received: from BN2PEPF00004FBF.namprd04.prod.outlook.com
 (2603:10b6:207:3d:cafe::4e) by BL0PR02CA0067.outlook.office365.com
 (2603:10b6:207:3d::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.18 via Frontend Transport; Thu,
 2 Apr 2026 09:18:40 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF00004FBF.mail.protection.outlook.com (10.167.243.185) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Thu, 2 Apr 2026 09:18:39 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 12A24406540;
	Thu,  2 Apr 2026 09:18:38 +0000 (UTC)
Received: from [198.90.208.24] (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 07DC482024A;
	Thu,  2 Apr 2026 09:18:38 +0000 (UTC)
Message-ID: <e916d51d-29fc-46f9-bb00-c373073ff4d9@opensource.cirrus.com>
Date: Thu, 2 Apr 2026 10:18:37 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ASoC: sdw_utils: Add CS42L45 and CS35L57 codec table
 entries
To: John Meyer <jmeyer@fdma.com>, linux-sound@vger.kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com,
        peter.ujfalusi@linux.intel.com
References: <20260402001236.17086-1-jmeyer@fdma.com>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20260402001236.17086-1-jmeyer@fdma.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBF:EE_|BY3PR19MB4852:EE_
X-MS-Office365-Filtering-Correlation-Id: dc65e8fe-a202-46f8-c102-08de9098d3be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|36860700016|376014|56012099003|18002099003|16102099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	IMedDucxtTwe4B6hG5RwuFo5NShXJI59Z6A7qOxV3o9MaXHRX6aJ4isLDEQwr+qpwTy+x8ep3KQJzVt6j8LchexTIGhsqK3JrGeltPuTvez/QCqK/Byd4G+RxJcxR8AzUx+vk2CCUfYx9sPjCEMvZSdTq3UAyphF4xR8Hgx1Rt+6w1AaKrcTV8o6BSOr0Aapdbc1/Zg7zVBDiccsg6LoB+LpGxng41GpYjenVPXKqTJFpkIXqtzamul4y1820rv/chriu7Lvs8f+BMx6SYB9QWGPecksjs5p3zN1BNpMR5tiw/Rz9UkmwN/28v/GOutBEf7E4IMhN7c1qW4a+aawSubj+t4mcpG9KfbcZWUYLtqS6DP1UIuH+bdvGTwHP650/4Ab8ZXpbHFToYAU7AAC12DyMSkDeMAR+zsrNB7Z+sceO8Ic3Dr9X2zYon57lWATxfThFztatBKuyXd1H0mWFkh9QChRk0mpxyunxK4FYWpjuPQA5g/rzZxSWCynlDnnMBAn0bkN5q6Q5eF/39imS0gD1u8H/G+3FpptMr0icwwmjKXpyV72ia2S5ksdnXfyj+bGpYCJbcH7t7zIphkRUX1IiuPvLs4a89ruUCLBfA2czXVxTp3b2AUJ9p1lcAST9ICV4HtcF8vS/pb4dMW8XgaDw8r4yTDjNF6hqfykUl5nMFJsCTGI8HiWr3vnGBLVGvIJNdUdfLO8Xd1ZGm/p2WsRHSBmh1ZJc0xlYejKMmAzcZSKSiNEZ0Q4JEIR1lAQYuHR1lOUXPO2Px2ilXHdOQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(36860700016)(376014)(56012099003)(18002099003)(16102099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7mxKZ5PcmaOVKMK0Te7Ur/SroAfxsSyaillIVWIRaeoi4cyqZhXPq45eKMp7OtLfm2ktFhb9QQSDOEdCW4gnePDjMJkC45UfQyf1TLattejZcc3nO6v4jz4wHPGdZqY2rixBXgLIsmKV2yfor8Z/sdyIi8Dxy48cIZ+z37luwWatSp+HoexrpFAo3hilOm5ywvfQMHfSnOp17G302zP59cc7dmvVKUY3ytINIeBta25/AG2OabIeA3+MJ6exVjt02NKxsdXvpflnHT1X5CkWzradA0Bl5crrv2nMsIK82OYlDhtYWa2bCBTCiCarQEYg0Z5RoglYHz3e8Mauii5GNlDAzEpby9RsIVOQeuOzwKAfxLZ6uJIaMZ1ogS1WjpebUaiVFnNK1O1MNs95jSF8Lg+Ftjq0nBuV0r5f69wDmgZu/EeBBhkqVUdx8SEB+KMh
X-Exchange-RoutingPolicyChecked:
	KuhQuKc3LfQ601Q0d+l5u5R75nlw+fIZnD2wEXQYtG+5o1VMAZTjHYGbdK9ECq1XGkThTWxwTZMOUkTfANMpSddjqWghgMLmSUsHt3+33rbyyidctX35GRajaGKGu3/Mi5hK66b2CcD92CpNYxvTQv/zrX0sCjSXngDhW2hKJq9kEHeDEVAK3wooadp5aHocY42N2FFOtznfVdasWSQq8QAqXxnV9I0/L1Cbmjq3rJOK2/W7IbihgMLzPsLCmE2e8yjPdBAn9lKkgpXZU0iz35+ulNmsTlOf5tJ8iIMcKWgVfbFUkze6FAw6QKaZTweiQDSpppI+s9qF3eHU2CeeQQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 09:18:39.2982
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc65e8fe-a202-46f8-c102-08de9098d3be
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF00004FBF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR19MB4852
X-Proofpoint-ORIG-GUID: In2cBoNfEpXvYNPrRB4tsfNdzFDwIccG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA4MyBTYWx0ZWRfX4HY2d7STtnwa
 l8mY0qT7sNPoDnxQKobHgFOw6RqrwvKBW4LxAYVrFgpIoebDuDOcfcJiRkQLv3eiA66K1VBVKjU
 3RTQhHesxnnTBu5ajHJ7sOQwQk1VAu9wKkgZSGTBlBlAx/hNWC+1228PFtu4gBNbchgoZd8g3AF
 BiseU21nYT0droj+8YWdPSDx75uOkg2SE/f6UVzSzfgT9geYSOXwvl3jjFRGxab0NDjQaRfuMPv
 rbecOUeudO7LPr1z9qkAqvoNOOsTBslAQ/nkbhpiyiPrPa/S3/7Yx1yhT3mC+OAIbw1W8tSXIy7
 ++ZZiAzxpoOg6sXEw6sPRclbxdYQ4TIvC4Km31V7VI2cme/L6r47s7O1Cx7tK3P8fFs6AiTTtJi
 rkutRJuPumRvS+4XlsMeoNy+Dcva/DAobQjvRAe8qbRiLWUX8zatqctfwvcjsD0G2+nifAtFYU1
 TZCAT8ncQYhgADSP7EQ==
X-Proofpoint-GUID: In2cBoNfEpXvYNPrRB4tsfNdzFDwIccG
X-Authority-Analysis: v=2.4 cv=Xvb3+FF9 c=1 sm=1 tr=0 ts=69ce3474 cx=c_pps
 a=PUkDgjY5UzxrOFLFu0zltw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=d1xkQCJKum75TfeUFNoA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Reason: safe

On 02/04/2026 1:12 am, John Meyer wrote:
> Add codec info table entries for two Cirrus Logic SoundWire devices
> found on the Dell XPS 14 DA14260 (Panther Lake):
> 
> CS35L57 (part ID 0x3557): A speaker amplifier that uses the same
> cs35l56 Linux driver as the CS35L56 and CS35L63.  Add a matching
> entry identical in structure to the existing 0x3556 and 0x3563
> entries so sof_sdw can look it up by part ID.
> 

These entries already exist. They were added in 6.19.
If you want them backported to an older kernel that your distro
uses you should create a ticket on your distro's bugtracker.

You seem to be sending random patches that
(a) are not necessary, (b) are wrong, (c) will break things


