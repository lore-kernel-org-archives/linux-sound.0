Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EBE6225403;
	Thu,  7 May 2026 16:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778171345; cv=fail; b=i3SDCkAYbjYfNOqd3w6Vp6ydrVRCJzDH+L7bcr2x6Ua+RIepXlZSF6JcWcaf6tP2qax2WQqB2GX6EJ1v01Lvc/2VPhqXeBN5I3IxIHDhwr5L7cNVW5tEW9cVyevw9r7yCYBgpazOlEAYSy+bCron34jcx8e4/7sa4nrAHuvWlOE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778171345; c=relaxed/simple;
	bh=U8VNUytzcIo/317lBeG+tbbrb4C/UZtVOsTxvGsgc6s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JR6vVd+TiikMHuXhNrCskj+kKKH/EgAMJa9yUOEMhJG0ZLKPcT0R9Zf9QTqti8cWmjPI0MncbKHuzQlNOe8xVJr4wCrML8Hx0o6OhwJT/MEIYKEICY6yiKICppoNacpVg2SOva7aBWsiDTDKBN1v5fq3C0eb95s/R78dgUxaIrU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Y8sNh/sO; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=RmwX/Jkk; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Y8sNh/sO";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="RmwX/Jkk"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647DVCVd3392180;
	Thu, 7 May 2026 11:28:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=H5j6DVtAFoUi49u/BJ+qROByluz+7eTMhN+ZaVCC7II=; b=
	Y8sNh/sO7BS7DEVggcji7WysH3U6N8AAhMfAZJA3FEV0DG3SZeAyg1pYroloLjVP
	lv3CUiIyZftSgTX2hQ+pXjUC/TBqWwKd52Mvt0SBFYgsuJX9TsXp5/HV8SbdX2sf
	BNpyoXC/OI1WuXlrA5Ta4NPZUPPyoVemQQ2nTPwoeS7YTLaayJ7TEE6cK9LQcHtG
	gMvx3uXUdBzMReeZvqgsIQwQgpQUxnOyCcj8AagozAMoL25g+BMWsCRFBmyigV6+
	TOXvHdO/irLikKFf4UZNHshAB4i2AoBfcOHYAGTl3Wi+iFIS9VCIAHXQodKFopxA
	m1h01PaGmnV9ZYrcgkbzWw==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020128.outbound.protection.outlook.com [52.101.201.128])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4e0upb8a1k-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 07 May 2026 11:28:51 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lst9J8j7VIpFbMXydENVOijmOfcfaCaTEkC6bwSieUjvVrHhWgnwTh61w06Gei/IfD9F2uQIoZjYINoHEKox6iCF7ZoMveyo0XQ06JK3K283g9g0u0VMWp3VQQ8dqVCCEM46lmod689xpUQ54bQXSgsxIlEmp8TwP6FjLdvQnoK1kXwlNfBMIrN+FH4CYnfFDCH0Mbh1Hillb5lW0aBCxjS9WChN/Wu95Cu5EwlQNJZ0RQD3vTaokW+pv+ovVI8Ki45ChteEa66+2jTB8IP8UTo/fnnhzlhoDzQ/JPUSXSexsSGEePuNq7n38T2FvlQ+lEiPZ1AvXyuR99Kkt+cJ6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H5j6DVtAFoUi49u/BJ+qROByluz+7eTMhN+ZaVCC7II=;
 b=NjLINl6GfYtECGEOfJagyPhLryyB7VthbniNm+82X1kfjt5o409EdoqkK+o5g6sKL4DFGqIGoCdFmTBL/dmq/+kmFM4EQBwm1JIXWGukH60WB27NlTZL/gYPNwxK01/asZTtO+6GY2FSbHp8Fkg18tkWtEEtAIbKdJSeeKvAp+y2bIHBwoNpeQSl6y2lrWBAzF5Fcu5qfWO3Sz7nz+2+ZHCCnzBn6FcbYoEoEAkFLqJAcZDD6l5xw3EcMcFRFXqXa+FhxTAczhZHZ2GW16XjNbKGkrbOp6Hl5qQO+2XCIGPA2HJTtgrPmAimAy2Esbb/oRznL4Rmlowt06nWY1B2Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H5j6DVtAFoUi49u/BJ+qROByluz+7eTMhN+ZaVCC7II=;
 b=RmwX/JkkxHFIb/Bd2qil0sDgRPnwK3dLEe0rn1WJSTh9Chmto7kndoYQ87nR2zXqZc7pZqGuYSMpVIryfGVC6/MNmHey+vlXG9BEUmlxMCeliAt7c+6R28lyH3FqiHYZq6D6Ep+W5PJbMclYuiZndAKp1KtKsFwEHK8phDUi3gE=
Received: from BN9PR03CA0969.namprd03.prod.outlook.com (2603:10b6:408:109::14)
 by CH3PR19MB8163.namprd19.prod.outlook.com (2603:10b6:610:1a1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 16:28:46 +0000
Received: from BL02EPF00021F68.namprd02.prod.outlook.com
 (2603:10b6:408:109:cafe::33) by BN9PR03CA0969.outlook.office365.com
 (2603:10b6:408:109::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.16 via Frontend Transport; Thu,
 7 May 2026 16:28:45 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL02EPF00021F68.mail.protection.outlook.com (10.167.249.4) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Thu, 7 May 2026 16:28:45 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 62B3740654F;
	Thu,  7 May 2026 16:28:44 +0000 (UTC)
Received: from [198.90.188.46] (unknown [198.90.188.46])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 2014D82024A;
	Thu,  7 May 2026 16:28:44 +0000 (UTC)
Message-ID: <ee73ae76-4caa-4151-ac87-1a2061cd17a5@opensource.cirrus.com>
Date: Thu, 7 May 2026 17:28:43 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: hda: cs35l41: Support HP OmniBook 7 Laptop
 16-bh0xxx
To: Sven Jans <skbotnl@disroot.org>
Cc: David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org
References: <20260506181807.22547-1-skbotnl@disroot.org>
Content-Language: en-US
From: Stefan Binding <sbinding@opensource.cirrus.com>
In-Reply-To: <20260506181807.22547-1-skbotnl@disroot.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F68:EE_|CH3PR19MB8163:EE_
X-MS-Office365-Filtering-Correlation-Id: 86d551a1-8c33-483d-1243-08deac55b5c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700016|376014|82310400026|13003099007|16102099003|18002099003|22082099003|56012099003|4076005;
X-Microsoft-Antispam-Message-Info:
	5XgJATdaXkrLWwO1CGXcs75/4Gjb7gQhii3D9mb4eqXoQj0fV4P7MIyYWxFnyfcTm0YwjRIQ5OaM45iVoZHkdQOYvOWCul/KM7TtHpfBnkRPKZDxIiVxl0SvU59sWLovYk40zE0RWtge30S9tySxsXzkiJ6Zg0DXy7GJBvdy7SjjcesZLwXL4xTCtdJLB9sUcVOnXpNRHx7sL32ufJLlKSuzv5w65To4heAevny+6ueDbyCJ1S17jUDDZWC5WnUg5gWPMH4oMZT3MYC1BlEsBCtzdgDZmDpgtWEol3fBfSOND0ep+ERkft9YtZZmiQeGKpUHYhmKg9SQo7EuyvoF6S5+gcE5b6GbEvUOpq3wgdX4pHAV5oIYSKwKHh9JpJ5T0dSyLcp3ByhYHwvOtSIy6/ocWyShYuTZO5Qc29zsgrmqXFN9amKD10Y7kksOa9vUO287CMuqGY3xTvkq1pS9gh34HvuSzu94U97j4Y19/BShKnU8q4e60cvrNNDXBfhAF7eNKUwL2YeKvv3SftARcQX4jSTiAMVTERuaBY4HM42eajnQ0pJgJIpLoVLzO6RJHAJpoUE+Yctj2zLxmU/yu0xjmxPZDUIiIgxqskYLxfm4f0ABiOP02g2YJ1kB5pcxkkaZqQId8jyxWU6Dv9RZ3sUh0+yXEubHBgUOq4U55z6CBT2ZvdS13EJpLMQkbg3aC0HPzo14iKrNepNDSeFTGia2bTq6xdpG2P/r3gEnuNM=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700016)(376014)(82310400026)(13003099007)(16102099003)(18002099003)(22082099003)(56012099003)(4076005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zSH9qVTs2wGZYAj+HbI3e1jGCiPE+VBK5ZfdiZ1BEIgs2Mx4MaF5NCZ1Jy6LN2In1cwn8I7AiZXxEBleULj0tAiTBOL8Awr9DvbM51SHKoNWdFAE8Fq3qZsFY+LYb3LdynNbQPF06kqpuRAU3uiOLFumIe194jAL8xahwCpmTY6gS+xe5gcxSUgOJVHKn7H++ms5X5fdh/kUEQljy3sax5cRSR3/xvB967plx1OP0cwL1Vs/kFXhE0igujUus/KstPEOPvl41iAcw8vJLC+kuRUqdu/xWPG7RoxQkfUuBgZlvuwkseywM5igRuk3JsEDN73Ad5xZxmhSOF9WiHloRwpdESjfKQs3+pDcYKB/rcFEYAMbBR50/X9XjdN+2Nkm2EJVRBKagaB3xTRIK6Ne8GcpaHPDJ8+SagYIhClnDHRE7KadC2lSc44ajLvnCedA
X-Exchange-RoutingPolicyChecked:
	MkDbs3egK6YT6Uvc2B+RNi9d5bYhLrD+HUduk3fOXBYhpCkeOQ8Fpo1ZSosp7QBTQnF/yPXgcwTzlY0dTnfN/R8fNVzeRQ8Ib5352HnFZfQXaL/T0oeBqiIoioLpX/juHwfA67+9r24VTmmHqQwcNf6yxT+sioYaoxMbNXxAxnt41qtcuLhT6/v+IhFFj6NAWkVKdndC9BpDAIzTUCQPFQFhTJYz8124+JW8AZodSKHK1iqsoet8uSkv46Xr/DTET0/hpfydsO0OOuU3ZE2KR3xFYIfZhrzoesCT8NTmpjvxDdm/5sYnsgK7+hIlWIHe0rFamzsyxvFMwVOFl1Bh6A==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 16:28:45.2866
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86d551a1-8c33-483d-1243-08deac55b5c4
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL02EPF00021F68.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR19MB8163
X-Authority-Analysis: v=2.4 cv=L9otheT8 c=1 sm=1 tr=0 ts=69fcbdc3 cx=c_pps
 a=4KArvT8Zi35IyF0Kdx8dHw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=VwQbUJbxAAAA:8 a=LpNgXrTXAAAA:8 a=zyZtqAdOOJhQszRt7RoA:9
 a=lqcHg5cX4UMA:10 a=QEXdDO2ut3YA:10 a=LqOpv0_-CX5VL_7kjZO3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE2NSBTYWx0ZWRfX4KsXvIpzva7W
 Rq/ZgWdZgJDX2myU6t6d6LUcESsAstCBP3zPRrcEB1Rl9NTsp0FyWd/BrUxfi4i54Gj3BwxS1fW
 8ZKLFbaaHusvonH5FqbeCCYtSLyqWMAVc2zqSBy4lO8OZHiY8qLxrcyCfg9XRh1D46VgsaYqHAL
 Fv6MfdLfFgLniRpfWCi0NiiJHYEz9rKsbQyIzF9WGsNen6URlHU9grTevU2g36kX3Akw3paoOX9
 MwvE+5qF+fRPtBjS388qp9sr8D5lA1gaYrG7ohNiTL3TW7LaH5IJr+Z6HHTJAgXFXCaU+c/nthO
 P85nBBtyjZaJOaEV31yFr0phF/S4idfgfkrHzMqLSZ/y3kmDTH+QIzorUjzlUxxgYQLD4goJwj+
 TVIO+KSQsEq8E/LLZoxhFKNss3wpZOQbPbOnlZqgQ5oYqiSYDWZQE4U8UrERSccY8vMcTQKYPGC
 fc6qO1qzv+QV8SnwUwg==
X-Proofpoint-GUID: z9cwGaPQXkAHpj5GIcxN6NdO3ikO5ri6
X-Proofpoint-ORIG-GUID: z9cwGaPQXkAHpj5GIcxN6NdO3ikO5ri6
X-Proofpoint-Spam-Reason: safe

Hi,

On 06/05/2026 19:17, Sven Jans wrote:
> The laptop has _DSD but the cirrus,dev-index property fails to
> parse, so it needs to be supported using the configuration table.

This is quite odd. As far as I am aware, this laptop should have valid _DSD.

I don't think some of the values in the table are correct either.

Please create a bugzilla ticket at the below address and CC Cirrus Patches (patches@opensource.cirrus.com <mailto:patches@opensource.cirrus.com>) to it, we will investigate the issue as soon as we can.

https://bugzilla.kernel.org/ <https://bugzilla.kernel.org/>

Please attach an acpi dump and dmesg to the ticket.

Thanks,

Stefan

> Signed-off-by: Sven Jans <skbotnl@disroot.org>
> ---
>  sound/hda/codecs/side-codecs/cs35l41_hda_property.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/sound/hda/codecs/side-codecs/cs35l41_hda_property.c b/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
> index 732ae534db36..a972da0ae4e1 100644
> --- a/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
> +++ b/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
> @@ -85,6 +85,7 @@ static const struct cs35l41_config cs35l41_config_table[] = {
>  	{ "103C8C51", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
>  	{ "103C8CDD", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
>  	{ "103C8CDE", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 3900, 24 },
> +	{ "103C8E60", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4500, 24 },
>  	{ "104312AF", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 1000, 4500, 24 },
>  	{ "10431433", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4500, 24 },
>  	{ "10431463", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4500, 24 },
> @@ -510,6 +511,7 @@ static const struct cs35l41_prop_model cs35l41_prop_model_table[] = {
>  	{ "CSC3551", "103C8C6A", hp_i2c_int_2amp_dual_spkid },
>  	{ "CSC3551", "103C8CDD", generic_dsd_config },
>  	{ "CSC3551", "103C8CDE", generic_dsd_config },
> +	{ "CSC3551", "103C8E60", generic_dsd_config },
>  	{ "CSC3551", "104312AF", generic_dsd_config },
>  	{ "CSC3551", "10431433", generic_dsd_config },
>  	{ "CSC3551", "10431463", generic_dsd_config },
