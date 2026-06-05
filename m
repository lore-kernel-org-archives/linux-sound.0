Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42D84A3419;
	Fri,  5 Jun 2026 08:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780649735; cv=fail; b=KzZ9d95p/Za1JXNOjNvxNpAPNNX2iVWpozC9ruSlbKdFfpan9DVm7xKW3N31RfvHDMllKdWJzzDlbY7FyvU4Uecmp676+bcVsop7t3J9DQgnGmCvtJ+XP1j7+yVYbCzodC+Qw4pVshuGUB1H/GvfOt7GmcLSfi1RSPw9p9QRmUg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780649735; c=relaxed/simple;
	bh=br92/sCukDpCu3/whN9kdl6FmgOspIQrphKlk1tY+AY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=cxiD6uBhR0dpT4ds7VXlRaqsZRq96vB+RhK4ELHrzwpKjbtXQlakfKBg9b/4R//EDx8kcMPPxT/ps9MlQ0uQtuY5YMEZ78+h++VScFiu+rpE9Gv04zMF0huSV1VW8fIIcQmoWvvraeNuCkO+9zFnvczlK2sZbMMruvciQX7Y0bY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=SCxgIRfY; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=PdRR+Ekr; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="SCxgIRfY";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="PdRR+Ekr"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6554SvMk835239;
	Fri, 5 Jun 2026 03:55:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=DAyHNxpNy/ELXVnN46moSjY4jA1OwuVBvA+cZhEuRuE=; b=
	SCxgIRfY7EK4RE32EAV/YosfnsAoPUAFGTfF4STSfWQOeauMIW/e8TY8Lxwlc3ak
	qC4TejwhuJwt0s2xZRFpsunFSjPud5wrtw+Co6/yAHUIueB6JhE0/Eg7VKpex5zq
	nne3noSRQC+bELx/Cjz7ROx4bTle3a+LHYF5eeAsd7wKRVSuv/3cbq8NeZ9lGbA3
	cY1scUh6xmEcTsX7w4tuH2mF30oAEDLggdzLtLrPMS0FXfal1L5XNgIdo0lNYSLr
	uDRuVC5kLGI065GRAenmL8Nyb9PbKhLqLax7kiNkz/GZ1PBsByn5BoDzYPuQya2Q
	1Sm6rShbtMgQzQdSQG4hpg==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020102.outbound.protection.outlook.com [52.101.201.102])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4efwa192s7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 05 Jun 2026 03:55:30 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZO67yWtqaSH765tsFq/YLhgPqKeoDYnCPk79BNm3NfflWbCwSgXqCGvf/ppGYXRCWPkATmpTpcDHIDzLOqiPXEkrNhyv8CuN0BWzu4p+6GHxkoZ0ofvK+b949i75WsI87xacWfQVXBGX9BAZAZBLkS69CA9lgpFtmANb/etZjqQAvqfIjV69qwmlBb+aWOXXjgVdESx6mscF6VKcNYOpRgZuj1suJJ/2IK9taWpHxvM+THbj+UuqPBhMvzxR/u0O42sWnl8EhV8ZXLsoJ/+144DR7fJozxdWThTZS11jhbHBopK6U8z5Ji0Z4oixkLHGjFVFl5J/5FfWBvC0eLyLdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DAyHNxpNy/ELXVnN46moSjY4jA1OwuVBvA+cZhEuRuE=;
 b=br4d4cZCPnDeaIUB2KQidSq34e2BiRCOrbKkMLUxOloSMnLZJi9+IovWultRXCi7gGdcYLPNFbhPjUUeozTvPRQst57SNz1G7XAszgFRTwqO0F+a0JCwgy0kYwXEsE6F0rPMc9lROiZv4jT9d2+NbEoSN9zzn6mXH9aUJpqygyr5sqSPbzvH5eKYkZK18wkOL5A5CAVVUGPp0WYmJtw+cLnbsQZesCjR8bcZ9EM2RbWKg9dbDpGwsvB3ztoQ/UHdoOaD5vs4rpYOi79738M8FLuX17uuEN5+/LSfeNPf0FNVpaahCurFZYf0eVQ8uUxfc6XLB8lA2FLWvfyQ2zO7CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DAyHNxpNy/ELXVnN46moSjY4jA1OwuVBvA+cZhEuRuE=;
 b=PdRR+Ekrvwm79oa6MgZu7Ztg2SNRWc6GFGYM6WKSLuXJ2h/hi2vcODU2kk0tAUrwSUz8QcarTfZDEGgCqbgtxCpr+A8siIWgEfbpikqZKBerPRFIm/NOVX5uWGEzGbWCqCCeyUuve5pqEl2oK6msdWJGUmkQ/N6WY1FWv+uNxgA=
Received: from BN9PR03CA0626.namprd03.prod.outlook.com (2603:10b6:408:106::31)
 by MW4PR19MB6845.namprd19.prod.outlook.com (2603:10b6:303:20a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.9; Fri, 5 Jun 2026
 08:55:26 +0000
Received: from BN2PEPF00004FC1.namprd04.prod.outlook.com
 (2603:10b6:408:106:cafe::aa) by BN9PR03CA0626.outlook.office365.com
 (2603:10b6:408:106::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.8 via Frontend Transport; Fri, 5
 Jun 2026 08:55:25 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF00004FC1.mail.protection.outlook.com (10.167.243.187) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Fri, 5 Jun 2026 08:55:25 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 5ECDF406540;
	Fri,  5 Jun 2026 08:55:24 +0000 (UTC)
Received: from [198.90.208.13] (ediswws06.ad.cirrus.com [198.90.208.13])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 4F93882024A;
	Fri,  5 Jun 2026 08:55:24 +0000 (UTC)
Message-ID: <84d162fc-2b0a-4aac-ad40-2203a277d82f@opensource.cirrus.com>
Date: Fri, 5 Jun 2026 09:55:07 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: soc-core: Create device_link to ensure correct
 suspend order
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
References: <20260601142835.282301-1-rf@opensource.cirrus.com>
Content-Language: en-GB
In-Reply-To: <20260601142835.282301-1-rf@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC1:EE_|MW4PR19MB6845:EE_
X-MS-Office365-Filtering-Correlation-Id: c0458739-e569-43ec-d954-08dec2e02f32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700016|376014|82310400026|5023799004|11063799006|56012099006|16102099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	tfqCV/j6x6lQJ6jzZbRYF7Oy30hiQjz3DdWPQP113NvIoObZbBiGQNvpsQTJDmFlVqcQqDPZCnTuN/SqA3wNNW4q+k3Lrpc9o9MoSfzc1YWJWPnLytrgMHBJn5mH4ayVJck8vbXxxBg1rQm+kyIStc/dILDY2ujsQBNuqow/Lzskue8su/yVmiPg8c0wEMx5KmeXWvQPtTBUNRf9ON/QJ4+A3LTVJ9sqi6j/j7A2tWMX43vykKxWa56BwgIvVSY0FPGpLYHKBWQ8N8nx85bYQGnk0lGaBuKZixioqO4t0/WFPi4N7sHFDW4xyYn2wbkU5+cUYURR+UIen+Gagkcg0pIW+rfNIDOG/yNuuDhS9xWOzUZOSsRX/H53RlNi6P2wmrYoUvxpk1wJmWTKsSVzMO8r6pfB7hl+R9h4sO2J3OHJ7MxiT+aiJWinu5Js/DS0f7QfgR/u0ChRBvKlJD2xoOWEcfBnPyIFUsjc1T1D1rKacIY9i7VDzSFiBe1tGhcM7nD2liFDLG9rb++owxQEU8AeNxiNJiNe3/3Mq2vw+KX7zHmCPSs/pTQCy7R6vyg8xThJvXCl1e6U06u2jA5n/XRFO7Hx1VlKd2sqDgDwD3lejCy61Xl7cbdN7VfzLv2jrqhBRqdgR2wZKVUA6h5pLUQPimwrawvnoto2E9wjvvG4QJ56J5ToSbOvtvn2g56cbWQJJOqJl3AwGfn781Nrl0WFRMD9Ay7wq3+GuocO3fg=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700016)(376014)(82310400026)(5023799004)(11063799006)(56012099006)(16102099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	J4vYFoCzp9UeX+2beSQWgfLo36r+5ynyfWz/eZDFA5gjYuPjI2V0ftyc1b4pQBFkkaoI8HTQyzGMvnQYb8Gm0wjOX5SAZy0fnHlLyjOaYqLnQ6sWbhzc653KULAS6SZAhWP3uy9J63qc0b4+kcXDYivqODAp87KRxXQ0YyRR1XyyS3kde9Fp9H/0rTDPftuog4ukqLSVk8ZjnJrUURmzdzlvTX5t9vUMVEYu2yZMBIhpUfHTFOCcReaLtxobUojYFZjfVn/eXjiMFFjFyItjGWi3+NleYyPwoUYaN0TMAMOrWzNMXq47AswFTGbf7tTqBJov/yhD3323R9Pka4rDUy5n0aIUFQtwPDYM9cmtSt5Va54RUCTOtc/Zx3P5K7e7N+c2hBSQ0U+TotAXuAkGNvch2hc7FV/1ZesiTsPoAzXCJKsUQlzoV+0VU0gOridJ
X-Exchange-RoutingPolicyChecked:
	k7vipSllb9xCjLyD2r6NWhHB/7NytirrFqjAF43Cj3/RBZbcV6L3jXyP+P/HQ2kh/TcpCMRlB7QBuSsyvnubLZl/uZ0Jt5RvVeaCIEhQbVyBcssXkpUxl1peQahp8InO0ytxFabHCSGvsQCkBhm4uqlR6qln6igP2dI7K259SPn7sFNidz5nQ6tJ7GYSTaxD1Q0Bc+bPyDiZKoIctw9OfvqsfnnFAzNWlauq4hcrlg9JWxLUNFH666g8u61VlXTQ1bD3RL8m+CZPjjjKTKkr2+ND9zt3bKurB/V+KaDpEmwVz9DQWfNRWVCiehy1CnPKRNiUj1SwxwRYVI8FchxmOA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 08:55:25.1393
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0458739-e569-43ec-d954-08dec2e02f32
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF00004FC1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR19MB6845
X-Authority-Analysis: v=2.4 cv=WZ48rUhX c=1 sm=1 tr=0 ts=6a228f02 cx=c_pps
 a=5886/XAhn54D+t2DuUGJPw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=_Ub56Bnj7Gru3Aic07MA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: IxZt05sxffrWeqvbB_PuNvEY3ADNH8w_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDA4NSBTYWx0ZWRfXzH3BotObKcsL
 q0w6gW2IbkgBOKTozCC9HrzcTFLZyY9UNrFdqSLdTolbqqfbJdk0Fv/PCw/VFcmUAiYzYBMeyUq
 S8HZNeld6PjqDHqTULmhbcQz77SV6+R3ZXYJDkoyZWXx89e85JhoNftqjMLL5EDU/WcV/NqJY7B
 J3QAfGrGbb0n95QXMnpDdhKSOhq/p9CQUUgBmwXhoJu2Hb6mjwk55w4bAoO9omWXmXRPznbHuBV
 /ZsISJYTcSHBnmc6IQd1LnAluNIvFOVxcBDM0oGCd+ONh2alJapyg1j+rzuWWs77vGu3dTUFOTn
 a41iPV1rl9RqS8RanJ0J1bebc8qeKtj1QfSXQByDqDgt3CqtLMuY1oWbciTOAuplPcmgSJJyPyV
 IO3OEwDFwq6IfCNnDLFoXZc91lt0bSFIKpWa2WoP+csNW2av2gpcslBHnHC8STLSWtNfAX6+6gV
 nG7BU/ivXXijhRawPzA==
X-Proofpoint-ORIG-GUID: IxZt05sxffrWeqvbB_PuNvEY3ADNH8w_
X-Proofpoint-Spam-Reason: safe

On 01/06/2026 3:28 pm, Richard Fitzgerald wrote:
> In snd_soc_bind_card() create a device_link from card to all components
> to ensure correct order of system_suspend. The card is the consumer and
> the components are the supplier, so that the card will system_suspend
> before any of the components.
> 
> The PM core will normally system_suspend drivers in the opposite order
> that they registered. This ensures children are suspended before their
> parents, for example users of a bus driver should suspend before the bus
> driver suspends.
> 
> For ASoC, snd_soc_suspend() shuts down any active audio, which requires
> that the components are still able to communicate with their hardware.
> Previously there was nothing to ensure this ordering, because there is
> (usually) no relationship between a machine driver and component drivers.
> If the machine driver registered before the codec drivers, the codec
> drivers would be suspended before the machine driver snd_soc_suspend()
> runs, so that ASoC is attempting to stop audio on a driver that has
> already suspended.
> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> ---
> Mark,
> I think it would be ok to put this into -next and let it get some wider
> testing before it goes into 7.1 or older.

I was looking at the Sashiko review for this patch.
If Sashiko can be trusted, device_links seems to be thoroughly
booby-trapped.

Short summary seems to be: only safe way to use them is with the
STATELESS flag and do manual cleanup.

