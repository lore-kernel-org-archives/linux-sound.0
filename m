Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309C03AE19F;
	Wed, 10 Jun 2026 08:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781080709; cv=fail; b=oDWdOGUpDbUYkaTguneFashzWVA/KAZaACuPzAwlp3EOl1KBe3Puy0RAsN3rQrYP9sDhIzw8pUInIBQXIEXtQ19SS9GluZC8ixUWXvwb0yQAoRhKhUrLd1I2HmHePImjjSI1M98Ulwkea50pE11U8lzmOhH+KfoUaR6eO++584Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781080709; c=relaxed/simple;
	bh=Qc1QO4+ZV0CuTDvciZBImQd5lXCURgwqpuauxkDD7EM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eJzXOd6SoFbC4dO5P3ZJpi8EQSlBAEWWa0LnDl+axIuEzKLvPk7/sCtgsxesODMH+9lHL8+ZmqQxZ89heP+Yuca7WG06sLmo4Wvr7/T4pyEa5vUdqE+VnjI49nQfx+zuxJ712Nxln0Wi+gCwxd0MYEVTgN7rBgfkTATXgTwBIws=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=LNakMrl9; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=I+Vtdypk; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="LNakMrl9";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="I+Vtdypk"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A4dhA6347391;
	Wed, 10 Jun 2026 03:38:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=iU3WkoO0HiJeofpSxbJVWA5jHOLS8p5nAXhlG5cs6/Y=; b=
	LNakMrl9Y2918obqnrB82VaDrMrrZ8FONOAFavG73unLVHcrvA/wxUJlcf9X4KIu
	/5bm3jrer/4ffX3FeN2qt8EL4K8UzOK12FasXt8c2pJHAcvHwCZewFM7wiXulQy5
	e7rJY2QoNMBgISSCWWo/al4Zt2YFJh1PtzXL1xxHfpVKAEx9/hVk65zfwlkGE2oq
	JdzmUxXIwDBkT9qikHa633gfpkxxzeCMwXcRbEQUUxtg6K/5KDjzhouFM5Sw01X+
	GOR/YExww4apBX/D5Mqw9YEvLsJDwwcVAfpGVNorz1M61r9VtFV+xeeCLaqDchpN
	W1oVeIdtUl80gpijhFVObA==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023102.outbound.protection.outlook.com [40.107.201.102])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4emgy0ds3a-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 10 Jun 2026 03:38:25 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t9S5aqVarnpPyaqq42qJjGyezcW3IvIK94y/mVwrTq2sPdb/hoJ3T2fQtlLmZFeAoQaH83bddK+fQxkFTaYnBjHKWB02iNpB5fYCaKc8JgMmRJ11oGrPiPpZpXFpJcbt4k+2lL8w9cd9ViwUtS6EFo4bQW5jDWXIP1tmJFF1KMVuIGvTDC/T80TGEBbh7y4E1y/4h1TgTQyw7Xvu4EDwv1dufY+eGLD4OAhTz92VYTMjQa3ivBN4oxU56Szf6WeQKpXFzqQqbGxM8LNrshD/ev/JDkCVfuXqreT1xtL68EWM0ePKPFsESr/97N+9zpQdb6IyYhR3cqLOLDhKxReK2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iU3WkoO0HiJeofpSxbJVWA5jHOLS8p5nAXhlG5cs6/Y=;
 b=PFis4qi4JPBETwYuFVAevScbDptuzbMRVkyDOSqF+WeVfwGLoq64x+IuwCwguE3YL32jNw4hWZ6StMh1MfbWSfkJNFJHt/AH21FQHUVyais+QSorb8K/Azb4oSswZRW7zhgdxdCODu4zTtWEbXcPK3fuc/oKDQO7IO7sEqOevULAOkg5482O5LKt4N6fi3WSRCR0/brLFPT052hTc7XtR07jGIopY0tf2TrrY3OC+GKHXuSOcW4L5uOVazLgnBZp9DJF2ueD4YzQ++Q2fXHBpzi/9u4h7/8uwrsB0kehIYjldWdmehlcWZgaz2vRtH4VOxa2sJbWn0OmonYbaFav6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iU3WkoO0HiJeofpSxbJVWA5jHOLS8p5nAXhlG5cs6/Y=;
 b=I+Vtdypk7dwmVbDj7Y2rlT3S8NtcdTS+rs1risUR+XLZERv8RWcLHXKXZoAbIztxU6DYCsn0NDA7Ah5sZ8JjmsS5PCswsOH4fR02TKw+pQDJFQkNylpHUXHn49iUPdEkxv8OcFm9vX5oWUlXpuH0belLNWtvVbG8qWKF8knQqrU=
Received: from BN9P220CA0018.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::23)
 by CO6PR19MB4739.namprd19.prod.outlook.com (2603:10b6:5:347::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.9; Wed, 10 Jun 2026
 08:38:19 +0000
Received: from BN3PEPF0000B374.namprd21.prod.outlook.com
 (2603:10b6:408:13e:cafe::28) by BN9P220CA0018.outlook.office365.com
 (2603:10b6:408:13e::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.13 via Frontend Transport; Wed, 10
 Jun 2026 08:38:19 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B374.mail.protection.outlook.com (10.167.243.171) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.1
 via Frontend Transport; Wed, 10 Jun 2026 08:38:18 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D5E1C406544;
	Wed, 10 Jun 2026 08:38:17 +0000 (UTC)
Received: from [198.90.208.13] (ediswws06.ad.cirrus.com [198.90.208.13])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id C581D82024A;
	Wed, 10 Jun 2026 08:38:17 +0000 (UTC)
Message-ID: <50e6b2b8-0945-425b-bdeb-de6ffa1940ad@opensource.cirrus.com>
Date: Wed, 10 Jun 2026 09:38:17 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] ASoC: cs35l56: Fix some cleanup memory leaks
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
References: <20260609120738.284770-1-rf@opensource.cirrus.com>
 <f8866e44-b1a5-4bd5-afbe-5e7615794850@opensource.cirrus.com>
 <aihNbERb1gjlWrtB@sirena.co.uk>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <aihNbERb1gjlWrtB@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B374:EE_|CO6PR19MB4739:EE_
X-MS-Office365-Filtering-Correlation-Id: c6957c26-3d7c-4e92-681e-08dec6cb9f7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|61400799027|376014|36860700016|22082099003|18002099003|16102099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	TU85PoPh0BHKLV0aQnBN/uVi+cFKOw19MMv+H+B9NvoGdfZSBtLwLYTZozUbShz1mA3x4Me+NZqZPjZ0yLgML9O31Bfl7dX1bxG98HL9ICYXmqYzToXkSTNtabfsxNjBbWxhMEfjd9QydgIbKoQHscjl7juXbnGmOAc5dvmZ8lrx03p6GMZbcZeLsUn/9tRXL7y5PDiS74qGZBiYG27/2bYgV9DFxkJZV3y5Zn9mad8ixmr7rNf+bDb09Jx7FE0d9OG2u0psZtlHGqs9Y4uuQLzwDpO1b+CGjUsV7VX4013Tkn4ceMgJKJGq5I+ZuA0lKytM9QJkkeMrr0U/HVfRYrG+cbLMOx8xnOvS5l4SFWEtG7uN9EccNry1Ww+MRU2X8g0gXjifkMn4fhfLGJwN0hdcRrzpj9G9awYFPHyhn+Ku12hUEgOgsosbjFvLDs+W7fuP5llwdZOtx7FMxiz0PSpqGlQhehpWTXBnqiu2rFl8MDgmsb5NXpXxOPJ1rwUkhshhsyVdvuXq+KaxBmFtO6msdM13AIpXPN64fupBZl+zgbBfQmEdw9uMUBSwvowvPrnFKylE33TVyUJOBoW0aQeFULA+gdLs8jEPmu5dqliJF1TgC1lB7OIwgcbjSu2Li7sdTDGU+1lX3OB6dLCkQy33XAfHcMerJIjCxhuF3kVm6wd77A5PZUpqxowIPKZv5o5SCZ3ORGJ2dqmKqHjVEOLNR5BIJ8MFHLRe94l6PR8=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(61400799027)(376014)(36860700016)(22082099003)(18002099003)(16102099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	kqNpoPd4BhyCmNnbhUmBzM3F9fuXtpJKb4e7m7PWhrPHEgNByq6D4dj7oNF47Exq45DwhtvUYoR9BPjR03RVW7z4JM9RS24kEE9YJ8mvTfFMQzBA8pd6Oa/6QRM7nCKXMWuUyWBe9qr4dKUXeeaj2k6G/qBMceexVrbfv9gzdtH5qdGTb4hN4be0ia+BL9dj7c8dICGgJuNkHWLY27S7imay6R1V+HavkaWVBdzJc/GlSOQ0n9wVgtaAiSu/F4W3zfrQ66MTok6XspB1LDtAYbmedLWgFrbowl8jo8a81f3OezUmPNh71tBXrb1SMpVuj4v0i11t8j/z2H/bCvaS4d0EGdol0JAH3MKNNOr4wA7dsvErcw2a+rZUL7qILx03RNLO7fV7Nd5LqvboE+COXPJz0leg2yoLmTKu7c7xBpsRMygiVe3xsVmwZe1pumFh
X-Exchange-RoutingPolicyChecked:
	sI+4W9VBmxsmvXXbcaQ5ZZ3paNayCWH+A/ddSl+kyc2wEbL7Pjr1wYTO0o7OZiJJKkHcO1oJAxVZhMV4EM8fUTsvA3ul8tefrA6ept9JAfhIR0Hr1X+MaP7mBmGTvGJ7lSPKkyrpxpYCsP61y+gxRNllFGtwQsBff1lrRJWqC1JfGUa28JISB9R6lBvxjKgSZOBpOwFfbjmSqJuXyIlUyhKyteIHRTvfmkYU7/5jbM1y50suJ2H/FMUl4WI4Jam8tf37keIlWcPwZeD54QjrFV8e25Cqap7GYn5Ghxeb5rSM8AhHFeyLnitHZIpXynOI+8W6DVwuJ3o6GnMTlD3LkQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 08:38:18.7587
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6957c26-3d7c-4e92-681e-08dec6cb9f7e
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B374.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR19MB4739
X-Authority-Analysis: v=2.4 cv=GP441ONK c=1 sm=1 tr=0 ts=6a292281 cx=c_pps
 a=7YB+2G0If1l7sHkNSTuqNQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=1wlGEa3lTHIFCMDRBH0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA4MSBTYWx0ZWRfXwvXcySQSg14M
 jtNff9ujEuhi5YYQz4DZ1CQ9TOIxsoxeIoJOKuJ5bq7yghCDLtBL9uY5KTJ9Pa+dBrnRWlaaAaK
 LVI3qrepbSmBRDm96YK8pDPRqggu/nqJLNZUejQ+NGDh6WAWWlNgkYklqUDaPgYoTzydOQGOys4
 9qJ8eg8uFRgXEZn0dkhy3nqRPVj5gpdJ92i6GYarC1dVVhMi5TmTbPjTNjwTNNw8MTweyaK0IUw
 k60QQhsihNugtu1wKEMSjor4DHRg5tPOyxV7qq6p7+BeW0C407lODATHH68rTj3y5dPYbpyeMjU
 yH3VCsKvkqSks2spK9f+JUPD6mNXrk4lbSXc5PIaGO0M3OLiz7JUKQ7nyED7SfD2cVt8g72FWy7
 /aRfTm60+mvwff0dVK3Xbhjs5kHW0lVa0EH6Q4oAWu/mKp+hJRhM7ORqhyVxsPj5Krqi2Oz0Zg8
 39lvr0kJSP7SEdXAZvg==
X-Proofpoint-ORIG-GUID: IOn_SsXa1cRqNe_3vaY7r4klt5-36xhJ
X-Proofpoint-GUID: IOn_SsXa1cRqNe_3vaY7r4klt5-36xhJ
X-Proofpoint-Spam-Reason: safe

On 09/06/2026 6:29 pm, Mark Brown wrote:
> On Tue, Jun 09, 2026 at 02:02:51PM +0100, Richard Fitzgerald wrote:
> 
>> Sashiko doesn't like these, so ignore them and I'll look at its
>> complaints and do a V2.
> 
> FWIW it's not gospel, and in particular if it's a preexisting issue
> while it's obviously good to fix them I'm not going to block something
> for it unless there's some really special reason.

I know, and it depends which AI engine Sashiko chooses. But I like to
take the time to be sure there isn't something real hiding in apparently
bogus reports.

