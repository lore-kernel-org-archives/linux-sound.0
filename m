Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791DF2C0274;
	Tue, 11 Aug 2026 08:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786437430; cv=fail; b=HdmBVd5Wb2ZpEqS9T2R+InVnn6izCzZV1MvALcCH+l4tznWHa5zGij7rE6E5D9Sf8MSnrFxzUx7D7ABtY8tmOhtVxc2dqPxRmYrXKJF65Urd5igA6g/jD6s4cK8Z5mKCFTyUlS8QtlX9RveGJRtjpuOxCTYLSML0E2N7K9/+sM8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786437430; c=relaxed/simple;
	bh=nlpS0zA8xI80TFvgk8DpshtajzEwulByP1h7BfXr10I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KCPYYP5lKsdVO456IvtCqwLm57/y46ShCe+YB0oGzTyyUmMan5oejKQ1lIZBUPT+cv9EWxyHKvgYrvjWeT8RNC/q3Q6Oq16Rx9wzSKOewmpK8qYPwOSNyIMS2vEh0OQA1U6EwW4TaM2fyLOZIiq/GwYo/45/TpqDjaj0vLhwphY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=C9J6jit/; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=y5ojqebK; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="C9J6jit/";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="y5ojqebK"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67B5SOIb396233;
	Tue, 11 Aug 2026 03:37:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=zw4hnDcg2/DmYojRgSii4z+NqyyjxTiBvjCPOsOb6sk=; b=
	C9J6jit/Kx9/WJ3xJ/HilTbRdwV0gc2MEDP9XST761KAGzKLhw4KDysUq7aUYv8g
	oTWxLPEyH/fbOuW/ffL2w3tjva/TW2BsDz2qVGldPk0+MGsbqLXrWTDkgkmVgn4i
	mROKWLrJvAlHZWSs2+K4wm6kSJSn4NjQW9U2WjfaB/YgTw4+cwJjB41Sg85joycd
	7Pmah/a5b7za/sYz3zp1EUGHNclC/8AIHMfPVVLvRHyKuJU4Q1WH/JKpJXlUX02C
	XBiR5JEGJBHlSgiGYhlH+bM8+BNNh1AF0vR9wkyMjycIcgweFmILMKWFh/H2vqB9
	MVpV1uy5QBzRGTEMDogH+g==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022137.outbound.protection.outlook.com [52.101.48.137])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4fx0vg51ud-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 11 Aug 2026 03:37:06 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SCulVIJKWU6laM2YO2CdpiAUGA3f/A1TP8hYSOXL51s86sLuFF5RWTKTrOUtWbb55yvmS4Ip9bWRCxX8WFU7stHd2f3mLEzwBmpBBUfcimNy9blTuLDUBKyzL6iGy4kD/ZvyNBo7HAPtmy4wj0TSYVnFqe626+58wM9YeTt6unceZRpmZyLEXXUv1NhjPjL9uk0vgKaHzdiotc9Z51mDRugT9EstZT/DnaWPB+P2xvfAGcNjL83pg3hl6DJWZkqWoEUFQiPvpIZiWAsfBl0KqDzcqM7r7ZqHPxzIvy/R1IETlkziDqe+vSymu/IqtVp/AiRYkHs6ZsbruH1PLO9yug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zw4hnDcg2/DmYojRgSii4z+NqyyjxTiBvjCPOsOb6sk=;
 b=Gj5T6OkgVc0JPa4aeDv5CHpZlptdx5dowK26m2/kKCl0isfkpFaRpBTR7sFfrUvvAgPFLgFDdqGqfT3jF51AdMQn4B9DT53khoMFanLQRPRdOW3DY0Besp6W/it1k5PJtIc6MRPKp8kdcF/esh+FuC8YXhTAk1h0Uzbi4MwhYOUFXAzUWqNN5ydCd941FayjMxSVF72V04QPPihKKIsjCdFxpYXFX58A+7X6adcOFF6jO1wu4F+Nv2N17AG8Oh9XCNHwY7bps2BY6k3WfR6+Vec2YnV4xDP11+OnlG5e2/0adqQf5M1VF8p4/cKsZTHG9Eux5xj72CyaX9lgxIRTsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zw4hnDcg2/DmYojRgSii4z+NqyyjxTiBvjCPOsOb6sk=;
 b=y5ojqebK369lE5eLlFnudgdYWE89tOJwEznqav2sptSmih36IIM3r3BTNVGusTKhj3ScYXY3CarYngprqOQsgaoSIZ45LlpuMDgxf7i6LX/aU2jUrfk3LG55lM+N2qAlg19HJWxvvGv9Py5/LC2bZLJ8NK4bfiUNKyqV0T9fZr8=
Received: from DS7PR05CA0060.namprd05.prod.outlook.com (2603:10b6:8:2f::13) by
 IA4PR19MB9116.namprd19.prod.outlook.com (2603:10b6:208:557::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 08:37:02 +0000
Received: from DS2PEPF000061C8.namprd02.prod.outlook.com
 (2603:10b6:8:2f:cafe::3e) by DS7PR05CA0060.outlook.office365.com
 (2603:10b6:8:2f::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.11 via Frontend Transport; Tue,
 11 Aug 2026 08:37:02 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS2PEPF000061C8.mail.protection.outlook.com (10.167.23.75) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.6
 via Frontend Transport; Tue, 11 Aug 2026 08:37:01 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 34E00406544;
	Tue, 11 Aug 2026 08:37:00 +0000 (UTC)
Received: from [198.61.69.19] (EDIN4L06LR3.ad.cirrus.com [198.61.69.19])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id BCCCE82025A;
	Tue, 11 Aug 2026 08:36:59 +0000 (UTC)
Message-ID: <271cedf9-9fb0-443c-ae26-fa3276e3c6ab@opensource.cirrus.com>
Date: Tue, 11 Aug 2026 09:37:07 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] soundwire: bus_type: Create IRQ mapping before
 calling driver probe()
To: Vinod Koul <vkoul@kernel.org>
Cc: broonie@kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
References: <20260810104045.60701-1-rf@opensource.cirrus.com>
 <20260810104045.60701-4-rf@opensource.cirrus.com> <anqwMUVn4VnbaI6S@vaman>
Content-Language: en-US
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <anqwMUVn4VnbaI6S@vaman>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C8:EE_|IA4PR19MB9116:EE_
X-MS-Office365-Filtering-Correlation-Id: d6860c21-085b-442a-773c-08def783b703
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|61400799027|82310400026|36860700016|16102099003|22082099003|18002099003|56012099006|4143699003|5023799004|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	OCs/35zQAOmmNchshJ/DPhHQr7Ne+kT5dhUTHCvYcyCsKiyEsbVUqF0BhvZDIJ31pUOmyYjiheX0CLX7V38Fki0e87qzbh2pwAjw1p0IWRLZTHuxL71OPMkAGeEjHWjpViDBNU+sjdfc0FQ4k1bm9Yf3sUvVFGeKVrN+my2xsAKKkYbPl2ZDufwOYzH9nhEJy+AtWjJuwLt8ypXd0+HhhznfuYP4EjiEvgVrZIT7oTEF3uxoZWSXjAiQMznKt0s7xtGQONz35rkj4oW0dhiMzJpuZUatnUjVhaGsX0L3GSih87wDJ5W37zsVkeBU35ClCjR8xQESg4jtCyBlninNbqerdsxrxT8WEN18A5TflUu9vez1QAmgMn5cHbzr5kTkq6KwvMxjl2vazN4YAOoMnL08+wO+kDoXSUVGjhtUY/XFGKFzaCS8UErFaLZxk3ayedKj/8RecvpmYlS/wZZWubIdxMmwEkYG329hfeBawqU/IrvW8pjQFTNuU4JWEUrluJsrSVp/bQChy1Q5UhyJm3ok2YjJc8kzujsm1wEbUOcSnwleKdibQXLqZaAW4NyT+5VOw7voc4V5iUAEvvCZ/VSjLbQ0dG9jHQqYypBpsdN20dSu0pPRj3gzb37J7SnVHtQRSi0KllTX6jUz0TBVNqfU1UXhaV0o5z5Khl+1ZEBTMVSmnwbtcSOVQLxSEUuKM2TW6HF9GsaOlBZEApV/bQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(61400799027)(82310400026)(36860700016)(16102099003)(22082099003)(18002099003)(56012099006)(4143699003)(5023799004)(11063799006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PX+Wd63aGuJtpz05Gzp8ulmxm7c4rKoZshx4FIPGhMgaTssd9lKMqTpYE9Pl7FfkW9BDt84sVMBatyXuuHmhontXd8RK3NxFRYoLtP28j2xHwSc5+o5NirIVEXrgBfugbku0bR0PrzPtX2mtClMGbc4kexGqcSdozY91Na+R9WUf69oKgBxF9TNASo9EZvfPY98rk3PJaIU6T7yIbbBzR5jscOCznsN+8QfnKncqIA8exsavW6lT4R0rLco10VXZM7uPvdUdMlzWihsFy56DU7Sv4TWLzukz8taRChBoOZdqzUxcuGHkhWiWMoZ5Y6DyMuCF8QnGaw1L/9iR04Cc7STtVkup8Xv62IIhVnXpEE22DYDlGfRrzzZNjFJEoypQOJlFkj/7dZYLK0sU/ibB2a00Sthqv22OUsQpiwGpt713+msbOkyUFVf3T4ZeFT/+
X-Exchange-RoutingPolicyChecked:
	e7OnBzSZOkj56I/uZ4T+GnvsXq6B94osS0niDAypTKX/qIErVsZGlzxzlvctavhpvfzXO/JKH0snVZrGtS4EKicDYDhYp8eI+zvabbMdpQTN/XAV7vz+Fa5ZoMu6QUXgQr5dEQfQjRi2093lQdLSEzknEa+0N7YS62xDzow8CASwfl/huFiZBx9l8ZDUHhmPWnAxj+HofapnLXEiAVaipeMHM1uA+oAm+w9iJwXuYn0IR7ril1tCFHY00pGeHNoFAMMHVwVtdJSg5+OBMy+e4SsEQk+fPRtr5BVk0S/zETEYQRpGBPZLAg2Tg89YvLnxZzxtO8lY/5O/a6TuesQXYw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 08:37:01.3804
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6860c21-085b-442a-773c-08def783b703
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS2PEPF000061C8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR19MB9116
X-Proofpoint-GUID: y3TV-0C30KQeIWKZ1epPAuN0ZcRLSouF
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDA3MSBTYWx0ZWRfX0ke2Dq3Cq0oq
 hiA7z0MK8VOG4U6VeA5fSr25zwc8mPpHUIEHVVN3e7+QQKw9KFJt1Wbgp+u9JX65UKWUF8lFlIt
 LrA3nWbXshiQZdte0Ulp+W0QvO0FX54=
X-Authority-Analysis: v=2.4 cv=KaLidwYD c=1 sm=1 tr=0 ts=6a7adf32 cx=c_pps
 a=ak3JExykxIme5/dqt+iX0w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=1U4z221CR65X79YKU2EA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: y3TV-0C30KQeIWKZ1epPAuN0ZcRLSouF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDA3MSBTYWx0ZWRfXzv8Dj8wGGA1q
 LJsi3Vg/rPe3z+qt5DKiBQ6Y5+2ybtXyd3DBj50bxjB8eB2mFjPDgDUolsRfdXpT3bzFfedJ95g
 JUoSHlr6329RhK5A6NKXIwZJVew4AZ84G/pdteZcIxs1nZj+uxYLMbXi5rpUlwWFQr5nKGUpha3
 syUnYVB88YgughX+HIVVIC69ZbYu/mFcJPlvEifbxtv6OwWtt+sX8opHGX3nm/K8e8UGFcEVd+/
 OwqfrfzZLiIy8fYl/jEu8wD0iTyHu89CXkg+hrVWbOcdyiFBLcqDxfPf2qwIebQWzX/8JyjrGsu
 wOilg+p/H/ii59EXqxEZemlbOXoE+YWh3+2thJMiU254R6ZzRAJndQooysWBoTI3PriP5lKhyE/
 +DfwIypPnhRBhoQOz2j1adgO14EPL9+XxdFoK2HGuPiPAbi1XDPfrJeUIRx+gjShfQKYb2/bd6x
 /ybJgh9nbBTt69aT+UA==
X-Proofpoint-Spam-Reason: safe

On 11/8/26 06:16, Vinod Koul wrote:
> On 10-08-26, 11:40, Richard Fitzgerald wrote:
>> Call sdw_irq_create_mapping() before calling the peripheral driver
>> probe() so that it is possible to request the IRQ during probe().
>>
>> Previously creation of the mapping was conditional on the use_domain_irq
>> flag in the driver properties. But these are filled in after probe(),
>> which meant it wasn't possible to request the IRQ during probe(). This
>> was ok for MFD drivers where only children requested the IRQ. But for
>> normal drivers it led to the non-standard behavior of having to defer
>> requesting the IRQ until after probe().
> 
> Shouldnt that still be the case (conditionally creating mapping). Does
> every need this mapping?

Other interrupt providers create all their IRQs even if nothing uses
them, so why worry about one IRQ mapping per SoundWire peripheral?

Currently it's just another way that the SoundWire subsystem doesn't
follow normal Linux conventions and requires the codec drivers to
work around the strangeness.

We could unmap it after ops->read_prop() if we see use_domain_irq is
false.

If we want to skip ever creating it, we'd need to move use_domain_irq
to somewhere that is valid _before_ calling the codec driver probe().

Or call ops->read_prop() before calling probe(). There's no explanation
why read_prop() was placed after probe() so I'm reluctant to move it.
But I assume it's expected that probe() will always be the first
function called in a driver.

