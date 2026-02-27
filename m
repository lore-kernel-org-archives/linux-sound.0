Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F823D2FE5;
	Fri, 27 Feb 2026 10:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772186483; cv=fail; b=uONwKMXwvAyLxJyXVdDhNp+99k/+OFmpUnT5QNIV0Xd58eUVkkZ0kIxVUGMs/hIedOSzW1rCiEGxYfdStK8yIMU93DJJQDy3tw4qDQamwNiFAfPINC+hSoZBMf/TfxJfuEFWoJVkVXoLSrpt6zUpaPx1LB7HecFhIj01GUAR1Ho=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772186483; c=relaxed/simple;
	bh=UQwQClkmzAFkudFhQTfXA0H/RvLx8h58L5sw9rhtC+A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AV8Vktpb19wu63Uu28wzVwBVplfxkpUjmg5P++TLdc9McA4ELIAp/MDX2VVM10r+361zbCfJlwIo5+tvNwacNm4rmCmK6Bj2rdsiRLi3JCAfF0tyZwDDcQO7iEYJAwKP2iFFjieOW5FGODsF7hs+CRsOiuy/Wg44X8deNahbx68=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=C599VNdj; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=WIqxf185; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="C599VNdj";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="WIqxf185"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R86SsH2680887;
	Fri, 27 Feb 2026 03:58:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=sqvsA+U40j21B3q8Op4OsI6/ybgm8QHhXPQd92gRFF4=; b=
	C599VNdjMlqFrfQpUpjcdpbUlv+DgHySyblzkdxXZM78c1wGO792Ta4ePiGZ3YlN
	C6nsgrXpJY84ZMhTCg2f3ONIygjE5iOu8SZp6WEg/1Zpczhq6/INqJIdjmO85fSI
	pStly6wZnwOyPFZjdFLLjW81ZbRn/0rqEe8UcTJ6XJEcWkGto5oEgvWIkP4v2nl6
	tLuefBUXv7EeUwxPgDNUIrkPNIWKeuH+9x+VyFajnALfmfvv2LRMhuaEWgvioZ9Z
	vy1cnedd7z8f5gG3V2JsRPhkGYP6dxT3W9tCBE4gNDDM6SD1vRe1ancGwEYRTqcH
	q1F/9qJiMnxjvaNhF+2ZxQ==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022111.outbound.protection.outlook.com [40.93.195.111])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4cjmds1b5v-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 27 Feb 2026 03:58:47 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tTrZBxPi06siXbY3b/wnMIApJADjJL/ZJfDQqwZoeGl0GPf333e6bV+mIfchcBjyOZBc8FyukiO2vRpuKBwE5vMxNmbhc7y1nU+KZMdUcqfU65ZHLT4wNvPKC+oRngOQgiHYI4962NDDykwbtKPqx8XWbVfycRPnt1XdBgUKodw/zA5EB7RqgiRng5msw3ttjEwlZdhGo0oz2GIuW+P1+LqZWaMiRe8r7+C6e2Le5j9zhkMTk0MtgvrXP+4iFxYs0DPri0KBdFwDvppYhOdScZQFG/QonSSV13ujJC+cK0Fpfg3fk6IWmSaQfbreICefaHn3H3H/00bTXODT0ZiGcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sqvsA+U40j21B3q8Op4OsI6/ybgm8QHhXPQd92gRFF4=;
 b=oSPX8VvgTXzO9bK5btIaAQPHtYcpfMbpiWJ+E4OCdhnC1AfgnVT3OxV2p1ZmryP75j21+XCgbO0nGSvwmnVCaegaXMqTE7EUQMq7GKd5bMtY1HhSbtQOp10YeBsBnyZGsd2BusBmFOr2h0LVfjcTn+ZMGDRRaeoCuvYzpp3Z+9OZPSvKmjrtDzQj8+jVCWm9qtVxQfwoHDwjUEszdAyllKQET9bKXoFQR0UioAvoJpjtsfWiRF/mql44tLU3JePnLxQe1GBiEsKytqDxXUR2L/rgr+LnKNYhH71z9lFPh4u8ryRpdsv9aqmCZQamiExB0uaRxzFsCzDR1RmfqlYjnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sqvsA+U40j21B3q8Op4OsI6/ybgm8QHhXPQd92gRFF4=;
 b=WIqxf1855F1wJBKG3bZLqUKyXqDT/818Q16W2cdDVfRwDE6QVc+c/N3Ymvkg7j7iCgPk1pfAMTSzDId/NLyrsrDWLjAvgrlPWMaLCNTcyJhMGxl6/UlsDMj0ugZSSEpaLMMReWoCfDui3f6tdlwgLl3sXswcah0bEjwApiBGZ4Y=
Received: from DM6PR08CA0011.namprd08.prod.outlook.com (2603:10b6:5:80::24) by
 SA3PR19MB9551.namprd19.prod.outlook.com (2603:10b6:806:49b::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.15; Fri, 27 Feb 2026 09:58:43 +0000
Received: from CH3PEPF00000014.namprd21.prod.outlook.com
 (2603:10b6:5:80:cafe::b4) by DM6PR08CA0011.outlook.office365.com
 (2603:10b6:5:80::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.26 via Frontend Transport; Fri,
 27 Feb 2026 09:58:46 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH3PEPF00000014.mail.protection.outlook.com (10.167.244.119) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.0
 via Frontend Transport; Fri, 27 Feb 2026 09:58:43 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id DE2C4406541;
	Fri, 27 Feb 2026 09:58:41 +0000 (UTC)
Received: from [198.90.208.24] (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id C72E182024B;
	Fri, 27 Feb 2026 09:58:41 +0000 (UTC)
Message-ID: <322ccec2-3663-4034-acf8-71732154efba@opensource.cirrus.com>
Date: Fri, 27 Feb 2026 09:58:41 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] ASoC: codecs: wm_adsp: Allow wm_adsp to hibernate
 without stopping DSP
To: Stefan Binding <sbinding@opensource.cirrus.com>,
        Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
References: <20260224161821.93365-1-sbinding@opensource.cirrus.com>
 <20260224161821.93365-3-sbinding@opensource.cirrus.com>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20260224161821.93365-3-sbinding@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000014:EE_|SA3PR19MB9551:EE_
X-MS-Office365-Filtering-Correlation-Id: 21657730-9872-48c5-f175-08de75e6ca76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|61400799027|376014|82310400026|54012099003;
X-Microsoft-Antispam-Message-Info:
	ayUx6AHRD8bd+sPlrhjMBWmmMmxGtPwNHZ2bgSjt95JTpLTYn++K55537AUsZIMHKwRYb2T1J1+7c9peTTfRdM+jpMLgcbkSixE1/L9Rttwu0Cczdx7p85EisjfbVfuCb267o0RdartAtceO13JhP+w4/kRXQXVpvpYYCDKp7qTXYkdCQMfv+9McDiurJkqapoi5tzroYSvJPMObUzdznMOatj2qPxnoff36nJifZfCOifVSsYfZZYjsTX6s0nIYlB5v8Tl5EDiBauvvPi4TMSRnK/NIvM2mpfjIVx1cTcqepqo1Baw0sRQpW26dDw9RFaKlMLJCURgpUx2A3O7I+NJINNO6UqPyzfTrBake3RPcZx09N/3GX/DDHWjvy1tFacKovGv/Liu7JrwNcoSDv38s28sxCkkOb+6vGI8ABJTQBswC0hrmU1U9lPEuOkcjPCTuAbNqZYwV4li4wQbjwdUqkoG/+m2IraTdjn51e3EcPSkQ8GGDO7eEXl4cmunAsNpTptZ3+mX90xKk7MfXgwJFYh8I/MwggymjgZYZqX//lgtErVmrTQQH45LcQ7A7aEoFAnQqWqnnMxShmge/wcfwbEvZkxhNg9CRCuC5Lx9rgdhrykOtN+eOneHTZOw2wxDzUyeY+lWQFF1Sf1W9I5IyB6hSo64+wMNyBljrJSA/mXAbVy+7PME0AytFKUS5HFQ78o2w2g+xqNzk1SzyoND3NeOs1mkZ+pnJVgxAB23dnVy4tqFHuqEms3P3cZ4O/U1rpWoHImzI/GS3BuLPEf/MzNOk+zAdzATfzIiYvCP/X8GOL+WVY/WZUFoE1H9XaRI8RY320LBn6d/tTCv1zA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(61400799027)(376014)(82310400026)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rLBF2HIwn66Ggck1aI4VUjf/O7k6IkGo1BV5u+KAauAg6+fOne3IRm4cbeoFwcu42E8C7dJXiIZ6ab+iZ6qkqWBNCkroNHOud7E3rZq+uFsW8KtrOtuUp9+kSuc5Cy+p48iFp1Y2rta6wdJ7htkpIc+73XsHelXZlYit11fdBY7urNPSafSUqxcRYbwnqGUo7mMFcfwh/W/QUh/CUiaDLuFH6R5T1jbs/cxvz4QKBGDHvUunUDWOPzOlGUi0OTO0P5rwrfp183thNipp/JBaCM0RrGgi9ogk8iqQTddx9RaxPJpFjtWTgI7O9niYwpDS7cSdFZzDmYS0fhvlAfQ5gkuddPUjH2IELDwR9HybROgZ/GbBd4ldgGFsqHlY3EwLP1MjQHDDOAH0+JsWxW37Aq9K5Q7prhcggqjtZbSFrTG8AlFafMVX8cUpGFn23tUQ
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 09:58:43.0598
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21657730-9872-48c5-f175-08de75e6ca76
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH3PEPF00000014.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR19MB9551
X-Authority-Analysis: v=2.4 cv=dO2rWeZb c=1 sm=1 tr=0 ts=69a16ad7 cx=c_pps
 a=50WmdcGmutFPi3Fug3z0cA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=iv1VcKUMefkX4nZKvdQA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
X-Proofpoint-GUID: fCCm2D5o1k-fbfy6T0Zo3EVTwpnOpImS
X-Proofpoint-ORIG-GUID: fCCm2D5o1k-fbfy6T0Zo3EVTwpnOpImS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA4NSBTYWx0ZWRfXxFK9ZUQTmjO2
 Zl4n9RmyqC+JP2n58PpVKAon3Ht3ihrQoeDBvZoJhYbez34jYub+ErycA5utM5s4eNnpsCSN5xW
 waTrCksrbHASCpqm8JxDei3Auqf1ZtpoLldFxta0QOqpZb4pYWQBB412KYSRbTpKfhmstcDpkJK
 VNz4ujEycKfPbcZWEA+A7KmRhKkNUmq005uobzKjR5R207HrYBCpRG81YzfteWJYtcq8b/YEVOb
 Fn7TRk7PNUyJLDeE/X3m0TjplBxCsM1PqZSSjrGWJxVaZQNbKNO7hURoIlun9sUkSkJMF54DyOR
 rhnmggqLsS/BJ9dzSMUVdw72cXw6tOb62RDAtfFn4vZZWooeX0L9zQqcH/PjWYBxA8XWHUFyWWO
 OjS9fVW2zYltU7efUhAeHnwkfkLjJkLGGYvNsp0RBxTBd2bOS3CgWFKqmLro4lvtWdNajl/qcxh
 nueawWTACrxw5c44/eA==
X-Proofpoint-Spam-Reason: safe

On 24/02/2026 4:18 pm, Stefan Binding wrote:
> Some parts do not stop the DSP core before runtime suspend, however,
> this leaves the DSP controls enabled and accessible whilst the part is
> suspended and the regmap is cache_only.
> 
> Add new APIs to allow for the DSP to hibernate when the part is
> suspended, and the DSP is not shut down.
> 
> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
> ---
>   sound/soc/codecs/wm_adsp.c | 6 ++++++
>   sound/soc/codecs/wm_adsp.h | 1 +
>   2 files changed, 7 insertions(+)

Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
