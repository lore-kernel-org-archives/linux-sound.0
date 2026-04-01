Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFDA47CC8C;
	Wed,  1 Apr 2026 17:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775062846; cv=fail; b=OAnx/C30Up004B2XS68zT26MQrRTaWOZKGvj3VlP+wNY1g/iOoXbQatXozv/FafR2b+JASWd2xUcCqCwuyrMQyudDJ2Q9Ca5C1mlmNEOEP3CEkJRDBhv7b2MEr/zyCdi5Pe70eIq/8SYvMAm3l/7Gi5PP9i/rv5uZ8zRX9qiGX0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775062846; c=relaxed/simple;
	bh=dPNb6ZUSeQImpzFKylBnqd/yxBXqjdCiNUsk6YwM2mE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SriYASFdc7Y6Ap1bNQ2fh0NCKo4N3ggGDY/3Ok1d7qP2qIT6/6KaAJ1V7qMtFRKjFdPw/I4zwUTbVmBzMxTfdQbPWHjkFTSa2YrNhd0tiIy7K7UuvZUA+BjYNzU0oXqTZQisNM1GrfDgLyNQkBbY5f48sIkP/vQlAt0kAdzQOe4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=aAN4yRmF; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=W6NqGoBi; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="aAN4yRmF";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="W6NqGoBi"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VNlxQF3520135;
	Wed, 1 Apr 2026 11:59:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=AuSVTdn8NsBZh4uHVc
	deHGZ/6U9yGy+Dacg4RkCwjYg=; b=aAN4yRmF5tKmXgXO7r7S/Mk5Vu2mjwDNV1
	fVWwtF+OGHvGu/houbRNh9MUHIcZ+XcS/rH70zxlwXyEHXhaqExb0Q4zjXGPxxT4
	lOcSGHywj5M+jQsgGltNXJduVoq++U0+eNJ2HDIFmnfh1BOSl8sWAzIjBfmdyAcq
	bz/PRwKFmBSlCGSe776NHwwkvcbvB91sJOBkW62GmfooZy1yxOWk+RMOpJgfLZ/U
	4s3DBpgAU2lzMWKd+zZzmfjXmn8t3iSvZsyvjMs+kDdWNviejhlvYj2kTQQ9CHt6
	XhZhRUB6eBG6lgIRatbbHK6gCy0J1ej4KLPtzJ1apsW90vkMn8Dg==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021111.outbound.protection.outlook.com [52.101.52.111])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4d6bdh53vd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 01 Apr 2026 11:59:45 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a6fCckRqz/WZik5WW4PsPW1SjFI5yZnINTEjbtFh/M0dFOF7QFNfdjG7bJCwd2PU2Ogyz8N5fGA8tRLvf9P24QBd/AQZs71FZFMcxaPDKS6EoJpdaorLjuwfMKmWw76uil/wlsqT0cEMI7PxYSDg0/6Q5z71aNRj8jO5YoPsmL8PzlzRqjwbtEt/U/a+nwBPtrqIXuItP/6GIvlOsmgXy9MZBFKHNrPFVfq2BozFs6or9APlggL8nrq7UhjmG1WjHKX9uxFlYfN5H/N0IeenQ4hIY8/tVH/Al6hqwhCmkmjt4MKEpn1O0goNjIfxI/HA0IMUE7705uXhhP/zwpW43w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AuSVTdn8NsBZh4uHVcdeHGZ/6U9yGy+Dacg4RkCwjYg=;
 b=i5cbG1vFXxNF5jgPRQZBgAKRzor8uQVFR8Ok8JkhaYbnhzG4dQCnj06kIEaX7emVr+FGdhBRMunaQq1Fwv8KP0V/hZVbpkZ1+f7ujKhW78feKvmxhhsguNpcCKPVzvgF9iQEe/y2Hxt3VLeEndcinUUKXmFX40Z2fj2hEKOGfh+TiBvLLv71oneL2YfzriHZ0B7JtDm+mKpITwF9mrcyGdL4vtU8ZWcKBWZf4AFWo26chLb5rNYMozeEvtM0j179w3N/+a+BcBdHfBa6fOOODklesKBJ2b8iUx0NW/wWQxdx9yMquFcVPXnihakIBEvpKjLFNLezCv8bUEKZXmiVvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=gmail.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AuSVTdn8NsBZh4uHVcdeHGZ/6U9yGy+Dacg4RkCwjYg=;
 b=W6NqGoBiJMdcFoqGfyj4DmL6pRY5xojXLsfY2JEL0UbXO47ADTfWyIwsoQczVmmqj5STextOzw7ny7V1kknBMs67kn9eM5o6svdWUgfAx0SsOqxjwzzJ0xezqaFBKds9TGy92i9sl0goQXpJziZA+pr/SRXQD2gW9+HNap3kVS8=
Received: from BN9PR03CA0470.namprd03.prod.outlook.com (2603:10b6:408:139::25)
 by DS7PR19MB8918.namprd19.prod.outlook.com (2603:10b6:8:254::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 16:59:35 +0000
Received: from BN1PEPF00004682.namprd03.prod.outlook.com
 (2603:10b6:408:139:cafe::a8) by BN9PR03CA0470.outlook.office365.com
 (2603:10b6:408:139::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.29 via Frontend Transport; Wed,
 1 Apr 2026 16:59:35 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN1PEPF00004682.mail.protection.outlook.com (10.167.243.88) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Wed, 1 Apr 2026 16:59:34 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 6DD67406540;
	Wed,  1 Apr 2026 16:59:33 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 5943E820247;
	Wed,  1 Apr 2026 16:59:33 +0000 (UTC)
Date: Wed, 1 Apr 2026 17:59:32 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Niranjan H Y <niranjan.hy@ti.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz,
        tiwai@suse.com, cezary.rojewski@intel.com,
        peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
        ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
        pierre-louis.bossart@linux.dev, baojun.xu@ti.com, shenghao-ding@ti.com,
        sandeepk@ti.com, v-hampiholi@ti.com
Subject: Re: [PATCH v4 1/4] ASoC: SDCA: Export Q7.8 volume control helpers
Message-ID: <ac1O9DPn4IqXRe43@opensource.cirrus.com>
References: <20260401132148.2367-1-niranjan.hy@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401132148.2367-1-niranjan.hy@ti.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004682:EE_|DS7PR19MB8918:EE_
X-MS-Office365-Filtering-Correlation-Id: 278d96cd-4d8d-49f8-d65b-08de90100d50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|61400799027|376014|7416014|82310400026|22082099003|16102099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	pheQgdNcN27TfEAeZrG1LOsq3oQ3r5z+IH66JMm6hkRK3O52xMJJQS/31dZ16HhWNrK1SvByCtVg0mj8kZRQ/fKc5YvEzwByC07gsxcYdSLLXVY0LLuD54tpsBv1qqwyEjqDilqq82NGmqcZFbe/NJGO/JPQBkwEXmJO3VD20GPhjZI4ThPOwKbndbaLOOZ0q5M3kzhkRCiWIAsWiUorcVOI0HmGZ7PLiECnwG7B6H0UyuugYiYBtFShiONe/bKhRIXbrM0NqFiTuPWKY1odxJoee8NvxkSeMFBWQrVzC/7JzZMsFIJisN1T6fqCarjSx5ABDzoFadVVBUWp2CgxLF39CB6GDvX8jAS/n0Buz26cgq15UXjt1pzNY7k6Q8CTbw6RVohBXKgvFjAfnDTnzUgCTl5M9dEVsF4SjKuzarriMefokQvhQGXnWO1Ploqy4sC6bL/6bHxfkqmm1aJ8Y0Dwak3VW1yQwoura8OGSTPZBfjXs1yAqHUj0T/SPU/nco7wgcpUeSz5UrXQXjV9TmTN34a7wqM15Agczgy9akzz8N0twrQPRk3xoc+TNyZwEPqmp9hSZQbk45+9eygSXCAcL0huTdS5vVx2Q6fFcQYN8yaMQrJxsuzX4a/60rRlZClHOpAflzmeMbrepWDz5XNjmilz3OEv4bfpMf+hGqFlXsXQSELbWC7ndp1+LSEfcZ2TWLxZbDOSeQAonf8P0Tp5IY2dbUhfijavXFbJJIhWBIoJrR+CXTsoplkvRvLBp1/LP2f6RFQFJSlRVu4Jcg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(61400799027)(376014)(7416014)(82310400026)(22082099003)(16102099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	kl67dXPfykPwmyN3fJR/Jp2Y6qBlrIoA1JSkJDjBGsXeagLz6vCq2fT0juKf4EXbiIZMxX7NjmJ0Yv/LytMWSmBjVeeJHIlSsDUSUblP0oezd72H/oLqybTk0+DQt6++zPkt2ULZgU/+AFMSfcWCdSr0pCekrq0jV6aYoYhaYNHg0Cx9FAi49qe8Iqcm+BCraeyXyPjsEUVKt8u+Ki6XJvLCZvhu5wjiXqwYNqzyIYJj3xRkV8Or5zRp4dV5Sr/asQoe762Hptk8JUnAZUzFNmJkXrYBHixeydq/h+2CuMpRbYwwoRtBClZblxTDhyGYqZQRiqxzXzx9puj2tcvlddrO4BBfe7kXGMn65czPp0YQfAPId/4QW6pqHxWVybHrk4pbPEwi1q40ZYC2OmJ0BpMZOMWh1cnYfFGwz68FFidapwvo339MhwhEHNZYXH8D
X-Exchange-RoutingPolicyChecked:
	jSi45Hhyx16jZoS0tk4pT7tfnVAlg1ykCEU/2W/u2NMTpWB/DlLl1jwm1tRcpqnnXz27ueRrV40AGCvJqp8Tg9mA0r6urDPwHlxK9KvWv6Ag/YJykhDF77AKalBUW+bSSMr0UNX5PODACUvUq3Vol09S6mpFbNl/Slxpt0LLvzN2M3sEHAANqM+QAbzQp6EaN2KlJ+wxRRlo8r/3OwUpdS7tKQoa0RdeLus/a7K5g1JwuFEeMXBCUF0qMfMX3niaFhZhLi9M2NxkwQ1wQspOe1oUpEFRgG5w6KyPUlE4o8Lg13ukWR54pvuHjaumiTP4S1Xg9FBHQ4EmHUOWJ55jAA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 16:59:34.8328
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 278d96cd-4d8d-49f8-d65b-08de90100d50
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF00004682.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR19MB8918
X-Proofpoint-GUID: m1JjksMHjOhiGwd8lruuoattxGRaQhT9
X-Proofpoint-ORIG-GUID: m1JjksMHjOhiGwd8lruuoattxGRaQhT9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDE1OSBTYWx0ZWRfX2MFcBRd350WV
 pAWEAGpZdmqR8yBfh1UeR0E8riZ+8U48HWAvjsT6C0D95G+TrDhy4llGP0HvZ8bsT2JwsUPLl/Z
 5+ft58uS85EeBC8liscni5993ITpt1plSJIdSI7xUXdRANQDdtt60Z9YkSpyqlOoDg76kuritp9
 m8AUlhKPkeS2SXO+H3nxl9exs31NMcQ5LuUUAoyIgEeGvC4YEUqPBuyrxKZv1q/quD3K8GeySdc
 t4EmUivbOoWqJppq6+YqcI/7xFmSjU4O7G+YIX10FQ1LgPuZ3u4N/RXFUgqAShLaGriuqUd+kb/
 hlespHZX4+B3qoCWz3ssS+WSV+F8tm4ijf3TT374SAIEhahBTMxOJKj0Xua2JX9KK1f0NM17fhO
 IZwU2TNRcMeCMKhDbmcx83JqNA6O/IrLi2dfEwg9lZwGx4oKhDR7jsrfappiYF24RUNnFfCshWv
 t1oh+fZn1oeD6pd5pPw==
X-Authority-Analysis: v=2.4 cv=GK0F0+NK c=1 sm=1 tr=0 ts=69cd4f01 cx=c_pps
 a=OyM5tLSvZCi3BtZZ++GVBg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=sozttTNsAAAA:8 a=w1d2syhTAAAA:8 a=88yiRTP3f5kikkP8IK4A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Reason: safe

On Wed, Apr 01, 2026 at 06:51:45PM +0530, Niranjan H Y wrote:
> Export the Q7.8 volume control helpers to allow reuse
> by other ASoC drivers. These functions handle 16-bit
> signed Q7.8 fixed-point format values for volume controls.
> 
> Changes include:
> - Rename q78_get_volsw to sdca_asoc_q78_get_volsw
> - Rename q78_put_volsw to sdca_asoc_q78_put_volsw
> - Add a convenience macro SDCA_SINGLE_Q78_TLV and
>   SDCA_DOUBLE_Q78_TLV for creating mixer controls
> 
> This allows other ASoC drivers to easily implement controls
> using the Q7.8 fixed-point format without duplicating code.
> 
> Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
