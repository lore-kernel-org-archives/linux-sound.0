Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1806C3F9F28;
	Thu, 18 Jun 2026 13:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781788383; cv=fail; b=ZMI+1ob2SYEDKN3Exp2Mh95xICJf+o2ws/pHmby1dYuyl6lKrHtjE8ttpzbe7uiiktCCFcKECAcMLLuteoX3T3SLfyUmehyzkV/NdhJrJwxRifyVNZn6uu/OUXNjNesw1Md/WT3QR/kT4G9ac/jlBm73zjjSJq9idTSJL7OO++M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781788383; c=relaxed/simple;
	bh=J7MKmPM7Uw5KkgGjghGq1dwdNkswGh/g1w05lOBZIPk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E97WSKp3tU+B33z8lWzhrRSxO0ZAq4CyDh0ufdYY49BSL1ZJDZwu8j098RIZieLHPHhgZBR2nTEExUBKN6Qss/0/3wiGbKJizDQdBULFmjHSbETtqTPRG0CLCEtQMrRMDCJ+A5rnqbTsJE5Bglndo658+rD5aqHl8u/OZWUia/8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=LnKn29TE; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Q2Aw+2IB; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="LnKn29TE";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Q2Aw+2IB"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I58kN11604368;
	Thu, 18 Jun 2026 08:12:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=TMUEsYNENPe4OSdhtC4doB7c41A0ul8dMwUsZ/fFGEQ=; b=
	LnKn29TEGHTtvARZr1AS+hfIBBY/NhSJdZTJhcoyH+K0S8g5IrjtzN2TXvPhRPaY
	eVaYVQ58tTVqQ+94uMpBp5fCyeoH8oQB7+fe2p8wc1h8hU8rJyTS1QLpAtgGSFCw
	5acSrW85+XCUBaVWtP3vczL0735ppG3Qmj55wbcNqp1BYPaHNXo9GugV4K8QImOJ
	ug3U6DtK7CbMD0AvhnTpLxtT9L6P5HHJhrM47VVvn6kjoaaMV9FE3JZq8ZGNusKv
	fEFnTnoxV8/gafRHi+xH3Yuwa9O4t5EEoUaw/35Oj2KP88C3REanRzhNwKskRT7j
	WPunOiCa0QXU2h1e0VMUCg==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022106.outbound.protection.outlook.com [52.101.48.106])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4euee3apgu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 18 Jun 2026 08:12:47 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=et+d3BaJhL97dDPsQZyJH3MuPt+rat5kY817beJUIk7SK3/gpq+0fMFHBgkAN+u/aiqI11EH3yU/GxtSqntBT8oyXqCXVzOGybwl4sTOTY94/cMbnM66tMwV00jGqtbQKjrSXFf/XZUeUTDGqbp/0QnpHMhwgaxFQPnYZ9YKicTrfW74fy+ktNMALsMl1l76TT7cc19uROITpc+QE/RD8TetLkuXpJ4oMvAs84oWaYGIlcsni+FSlMSznz3ejHw8aUWpKPpufNW3F6MF33zJ+ljIfErYtqZe2mYHwKdcTGrbxcEukVvVf2VdlxR+PhYonA5UmHDtAPuTOui+AaoO/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TMUEsYNENPe4OSdhtC4doB7c41A0ul8dMwUsZ/fFGEQ=;
 b=Zo2Wb8Osqva+98dZOeqsX2ScWQinx755bByW3MdtFHdH//te6jGLWirZtBgMwNKVr+d6mVR2qOecXyaStfu5etLGuSvtV4ax0VOI1lhRf8crNO1+4GJNj5t1hdm8kPbn49ONKIxf0ANqTbKZE1dBILi63gSUJgg7X17jWaKmh6qZGFKcDGsS0qdWlsgNLLwZSvcfJ4ZiDJu56Ituz9ia0iJyOCIizyFeW91yCGfSmD8gp6F2XV8rpGIHfEwvKmx2uBR9WDjs+hUaFKrBIv3nVB8dwacCOuT2FkfAOzK/kAr4Iz/DO9vbT5yccpqB2UlSQOZnO2Fnptrsiqor3upUUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=broadcom.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TMUEsYNENPe4OSdhtC4doB7c41A0ul8dMwUsZ/fFGEQ=;
 b=Q2Aw+2IB5bGNs14SHrUD3CpDcPHVP+HDNJmWK3zvCRdCwepGN8Uj1ks8HK719c7uC7hMYcweRkTZMYOOxoTIf9IsvQi0yO3bxfDVG1wwN7Q89Phyu5+w9+5CJCuAlstUUrz5mKPkwZSbB9LKOBi4dgH15CugHcG5tb8KweurEq8=
Received: from SJ0PR03CA0289.namprd03.prod.outlook.com (2603:10b6:a03:39e::24)
 by SA3PR19MB9428.namprd19.prod.outlook.com (2603:10b6:806:49b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Thu, 18 Jun
 2026 13:12:44 +0000
Received: from SJ5PEPF000001C9.namprd05.prod.outlook.com
 (2603:10b6:a03:39e:cafe::a4) by SJ0PR03CA0289.outlook.office365.com
 (2603:10b6:a03:39e::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.13 via Frontend Transport; Thu,
 18 Jun 2026 13:12:44 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001C9.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.8
 via Frontend Transport; Thu, 18 Jun 2026 13:12:44 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C48FB406550;
	Thu, 18 Jun 2026 13:12:42 +0000 (UTC)
Received: from [198.61.69.19] (EDIN4L06LR3.ad.cirrus.com [198.61.69.19])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 2BE4D82025A;
	Thu, 18 Jun 2026 13:12:42 +0000 (UTC)
Message-ID: <6af1deff-8d1b-472a-8ef3-04f47321689e@opensource.cirrus.com>
Date: Thu, 18 Jun 2026 14:12:41 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: soc-core: Create device_link to ensure correct
 suspend order
To: Marek Szyprowski <m.szyprowski@samsung.com>, broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com, Maxime Ripard <mripard@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>
References: <20260611110856.1088110-1-rf@opensource.cirrus.com>
 <CGME20260617141046eucas1p2e85629d57bfc17449b135b16f9230d57@eucas1p2.samsung.com>
 <4c9156cb-6508-4fda-8e36-7edc4eb7d6f9@samsung.com>
 <b9e3f7cd-2329-43b0-89ca-0243e4916c16@opensource.cirrus.com>
 <c29c5ef0-cb10-428f-8ccd-8a84195dd504@samsung.com>
Content-Language: en-US
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <c29c5ef0-cb10-428f-8ccd-8a84195dd504@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C9:EE_|SA3PR19MB9428:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ba7f1b5-b5b7-4681-b362-08decd3b48f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|376014|23010399003|36860700016|16102099003|22082099003|18002099003|5023799004|56012099006|11063799006|6133799003|4143699003;
X-Microsoft-Antispam-Message-Info:
	kETNxVICEsFJdWH3lCjVeWVO0cewYVaEYJG5XQzxhOjwnEcL1J+ixQtI4NDpy8v0YBfjTfSsevDvmfwwKCsxIPbnPbI7QaDkGYub+GF+xswRmwCIuQlxWVzD0Vd6KBiyWuymeB1CUaWdg/g/UfLX0CHIDMdxSi3ZQgwB5hP68uskU4q0YdwPh1vLZSRKv5nJTBzDfV9Ygz3lgbarrbpKq+PeEQ5sQtDV0iI8ZWH6tvvvz0D52jXAAULqU2tx2bC8PaUTobqWlzzc7cTw9XQPQmqOx1BrSo4Yxnolo3J3QBDnStkW90NQdmg8Ym/JlbRDTCmhh3kaPPnGoJ7VO1YBUxW9zx6+rxNrTJBmW/w9/T2z4ixk988+XDdrftCzLk3b6zFAuvnty5Ke2x+ExB9wLREbMLbKJzKeo4ujMncJiEm3adR77IhDYTA7e4wpw+eXAoxff5BnrgT5gBUCnPgXctvKmpC+8T0eI5+XZNa7fl82YwLIRS+WD7zBl1GyQ+HmElKVUGlleMMwH0bTXBwDEuQ28UG68UUJRHXIBvKTunA1zAu66TL8RL2DO0pv9i4W+ieDehr1z4WJAtpRtNHjCm4fX/YKidcMvmayM07/HMd7yMyFWT6AHJd77aFk8uj8oiv4avJ7tcWwi9pFxeCcitTbXirwKp3g2aoZtSfLGiZpj9kQgP1qR4ofuXhf1K/mjNDNyoimN/xqlJSkztLjZBvDfl3DlQEEr/TbWKJnVyI=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(376014)(23010399003)(36860700016)(16102099003)(22082099003)(18002099003)(5023799004)(56012099006)(11063799006)(6133799003)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	F/QtD7XJOBoz9zAb9fzl5jbEUSO9x1CILXRU7li58qXKESpLom6Jfg+TWPj7b5kvESp+K2uu0T2tMLNfvAlFNFHyPIJS4255Tj100lP0t2PRVn+uFyMj82K9z8Tw547E01pC383x3x1RiinuHOl1d7votipJ5+9/OwkOhHQ+l8aKVrxRL6ZDHxn9hle2w1NJbvr6naO1M8vPLHk4iJZJI9awzYcZWg7K56NBtRPJphnNlsIVeEziuyyfrjCp/E18I0rJ2cm33Js2X9ts6BMl79ppr7crLdCJOYJ0P8mrFvGYC5q5l4H2W8BTqq9dwtCr9HI8tNgWKM1YCSryrPijIIPE6OZt8GZClfsW/FO9dzIM8GMxpGLH9MWS0h7EWgnASVf2e9+swzyMdFxTF4VeVEfy2EXmY7hnD+Qqk0S2sGvJgs6RLzm5iu/mhzSS9R6n
X-Exchange-RoutingPolicyChecked:
	iXv3FT09pwaN+tLOsZFscxFPfp6VZ0UPZqhtCoJmqt2lqgMYYkZm0Vyh+gUKdQWdkMMx894r+6SxFIn4XQXiQveS9m54F6AoqbcenPLvxDwR3qzddpynAQiIJ6RpumYnfzunDZlaKNlsyg3OI/8Bd++AWt2g5RjKfZr7b1qHHuveEXgWKwDi4cPLD94L4R3PlMRHqi2knpb5y0guuQ3PlQZLx/9YPYZE7U1fwnrYd6PUIvr/I9FFytT4SYSDQkPv9mr6ZHUKVO5SRCP49IveERBPuuFzLEFjm2EERFIw0fojG8K1+8BBMgU8OyxH1RUQgenYOOzaM1Un6FpuCZfrOA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 13:12:44.0457
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ba7f1b5-b5b7-4681-b362-08decd3b48f0
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001C9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR19MB9428
X-Proofpoint-ORIG-GUID: VNY2wxJzr-7P0wjmrUmYWKRG4lJuGgVl
X-Authority-Analysis: v=2.4 cv=UuxT8ewB c=1 sm=1 tr=0 ts=6a33eecf cx=c_pps
 a=8ZeDDwZrcBwoztOOIup3VA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=yAsLBFYEYCm4_GmkgGIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDEyMiBTYWx0ZWRfX/fW1tV0zwrGT
 8XAwTOle+b3CBEA13D7X2M6ywLHSZdSJXqdX9Z4jgWDZ7WYpoiA3q+8rCfrXfv9+ys0eYDB/ezf
 LP4WHvMpmOocriZRv/U6XnncMMWg07Y=
X-Proofpoint-GUID: VNY2wxJzr-7P0wjmrUmYWKRG4lJuGgVl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDEyMiBTYWx0ZWRfX21a0iL5Yzk2t
 WbyIKisV3rMEZAW6z2VQ+wenpvAGObkREZMB6WluHBuh55gqngLgGx3nqnrLs8z8/2E+kurKddk
 spJ49VbCe8tSdu8P/4UFN+tPFKGxk2CTfiIBsFP3qoyV03cIFg30fDoZ/bhoaaEAz+ZTk67hKmS
 4QFoG9W7DJA3Z3lRS4gkOoFQmMKkYNK8YmbABjft5zyM2y9V370XqEeqgZc6kf1vzYPeacP91H0
 oE8b4ajtIvB/m85PaTEKmg2k63ncj7N6u7b6WHco0VCswjCX3vJjkNGio6PyVtTZQZIFv7kDRWd
 RSYvZpBeVnoFW3GyAs28K6k/djTS/bDIRkd8ZLqbSRJHI/DoJFBI1KmrorbccFXQGYzlFg8z0Sk
 iUu6tCKypFR8J6WMtdYVofVPEDqQP5CYKU5JgPOhFmMMOH5vgFB2TzWuuAKj35n0V0bLX6sbbzi
 523/h8/9L9opTlW63LA==
X-Proofpoint-Spam-Reason: safe

On 18/6/26 13:58, Marek Szyprowski wrote:
> On 18.06.2026 13:22, Richard Fitzgerald wrote:
>> On 17/6/26 15:10, Marek Szyprowski wrote:
>>> On 11.06.2026 13:08, Richard Fitzgerald wrote:
>>>> In snd_soc_bind_card() create a device_link from card to all components
>>>> to ensure correct order of system_suspend. The card is the consumer and
>>>> the components are the supplier, so that the card will system_suspend
>>>> before any of the components.
>>>>
>>>> The PM core will normally system_suspend drivers in the opposite order
>>>> that they registered. This ensures children are suspended before their
>>>> parents, for example users of a bus driver should suspend before the bus
>>>> driver suspends.
>>>>
>>>> For ASoC, snd_soc_suspend() shuts down any active audio, which requires
>>>> that the components are still able to communicate with their hardware.
>>>> Previously there was nothing to ensure this ordering, because there is
>>>> (usually) no relationship between a machine driver and component drivers.
>>>> If the machine driver registered before the codec drivers, the codec
>>>> drivers would be suspended before the machine driver snd_soc_suspend()
>>>> runs, so that ASoC is attempting to stop audio on a driver that has
>>>> already suspended.
>>>>
>>>> Creating a device_link is safe if there is already a device_link between
>>>> those devices because of multiple components sharing the same dev.
>>>> device_link_add() kernel doc says:
>>>>
>>>>    "if a device link between the given @consumer and @supplier pair
>>>>     exists already when this function is called for them, the existing link
>>>>     will be returned regardless of its current type and status ...
>>>>     The caller of this function is then expected to treat
>>>>     the link as though it has just been created, so (in particular) if
>>>>     DL_FLAG_STATELESS was passed in @flags, the link needs to be released
>>>>     explicitly when not needed any more"
>>>>
>>>> For the same reason it is safe if the codec driver or machine driver
>>>> later call device_link_add() to create a link between the same two
>>>> devices.
>>>>
>>>> (I have tested creating multiple links between the card->dev and a
>>>> component->dev and did not encounter any problems with suspend/resume or
>>>> module unloading.)
>>>>
>>>> The DL_FLAG_AUTOREMOVE_* flags assume that they are being called from
>>>> the probe() function of that device. This isn't guaranteed in ASoC card
>>>> binding because of deferred binding. The exact behavior and consequences
>>>> of the DL_FLAG_AUTOREMOVE_* are also unclear from the documentation.
>>>> So DL_FLAG_STATELESS is used for safety, and the links are removed
>>>> explicitly when the card unbinds or if the bind fails.
>>>>
>>>> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
>>>> ---
>>>
>>>
>>> This patch landed recently in linux-next as commit 0f54ce994b23 ("ASoC:
>>> soc-core: Create device_link to ensure correct suspend order"). In my
>>> tests I found that it breaks probing of VC4 DRM subsystem on Raspberry Pi
>>> 3 and 4 boards due to an issue with hdmi-audio-codec:
>>>
>>> # dmesg | grep vc4
>>> vc4-drm gpu: bound fe400000.hvs (ops vc4_hvs_ops [vc4])
>>> vc4_hdmi fef00700.hdmi: Failed to create device link to hdmi-audio-codec.1.auto
>>> vc4_hdmi fef00700.hdmi: error -EINVAL: Could not register sound card
>>> vc4-drm gpu: failed to bind fef00700.hdmi (ops vc4_hdmi_ops [vc4]): -22
>>> vc4-drm gpu: adev bind failed: -22
>>> vc4-drm gpu: probe with driver vc4-drm failed with error -22
>>>
>>
>> Where in device_link_add() does it fail?
>>
> 
> It fails the following check at drivers/base/core.c line 766:
> 
>         if (!device_pm_initialized(supplier)
>              || (!(flags & DL_FLAG_SYNC_STATE_ONLY) &&
>                    device_is_dependent(consumer, supplier))) {
>                  link = NULL;
>                  goto out;
>          }
> 
> because device_is_dependent(consumer, supplier) is true for fef00700.hdmi and
> hdmi-audio-codec.1.auto.
> 
> 
> Best regards

Is the machine driver the parent of the codec driver?

