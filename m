Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6FCF377004;
	Tue, 23 Jun 2026 10:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782210140; cv=fail; b=KTHMHZSPXD5NyEMb+FrEOhsvuEVqmgZ65zDkns3M6wnZNVDv3rCK+dV8fBAPlAKrZs1KIc2UxLmHzbE72TUx9LED9EOGyuJG9OCrvLBVeYN5PDqRxMjpTtSqQwhOPMPTsQOv9giuHfT+C5zeejsPmWucUpYEtH7B65IRycUTi44=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782210140; c=relaxed/simple;
	bh=dqNTVz+EgJmemYb80Qbr1loznU8aGq0JQ5ICjHEo2KQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OfSyif9CXDkTHXFJTkkhy0pHDsb/9H6phMuECE1kSNgb4MXVvtoukYr8oU/Pg1UjdJu4IzP1yQWvQI8vTtDczMGOUwKjJi89QI+u5PsTSdlfVZKIUzeI2mkB5vZyDlSlrlA54r8eNcV0+6W6xwAcVp4S6lhT5K6Z7HyZI9iJjIM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ie2df1dl; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=VQLsGY7s; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ie2df1dl";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="VQLsGY7s"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MICQWe2489691;
	Tue, 23 Jun 2026 05:22:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=5IiJg59vuFUqJT1DrjHHt0Pf9jD5ENKe3yj0+q51Mio=; b=
	ie2df1dlF/xRBO2NalXhA3Itoyjj98kb029BtRvZ+2/zuDTuM1KAudJl/dwzyLx3
	hZD6V/4jeYCJ1no4UTwnNV2Nfk6vrsuGJJbSK+eayR7zUoJGjpYBje3q7ATUkwjX
	pNP0SUNVBDcx8sk2DWz3ha021ZnDqZQnNtAYIzW0Vv86opBvUJBSvTOqNDKhbJ4x
	wtHnzDvnGSvmveZEaa1XZ61SgegdBRyQbwyY18R1bvlSczhZ0Qa7KkvBzVh9u9wG
	jjSUkMN5jXbINSHGlYyEJETg8VJoLKDJ9M61JMTMMMcChin3rDAbntjAOzzbK5Ub
	1RJ2cjmgEvX1jeH8iF8zaQ==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022105.outbound.protection.outlook.com [40.107.209.105])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4ewr8x35fm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 23 Jun 2026 05:22:10 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bro9Z3Wu7yfIjLwiBXKfm7IbJd0h4V9UcTR69E3fWFr5bT4omzPJFUc7Ql+On674sZHHz8Oucv+VxJ+7wBp0XEeMU93u/wOnSxMLVnqBUM0sETgTbl5vWiOy+Vk+vjEq0Vhz8SlCggKy7L5ppYc00vriK7qDY8ecBrvIXyY9VpoNFHhFfJGaHHosd9ry4ub9auz4ocokuzCi/cdwidPHywPd/8oczb2EJe/aAW0tpBPmlCgNW5xN7yslB6Ocayhkq/jw6OErhJwv2GminnxKQViUHtDmPGXVaFTDuh7K7qFd5mOowQzFZRcTHt5fB6I0S/C15XoMtwPlDyBZ7PL72g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5IiJg59vuFUqJT1DrjHHt0Pf9jD5ENKe3yj0+q51Mio=;
 b=U08RappcYdHjVpPblPyLsDEn0gYSSrOVGspmarwJxKxbuXheHTPq9Qn4on+l0mmS7xBuMoW79plrMotj7YjhFSE/9qwWr0bTdfJDn6A2bb/0bG49+GBGy5GPPFuQWFIJQNMxSs+XfZfgxmVz0CxXmOZJFrKO18KXjmnrvJY6K3XKTRzWr1OWPqYwLCVjrX6R4LaYFDElsHby5xJHfpU6oRgcAvqJmNFQeywwameElRZiy6OIpz3YP81Lpy+6gMTjbhP/rHZVS7y9i4LBeM/QKU1V8o42GcZ8O8ezuJxXTMkJJpvRw4O++MAEE6VxxnlnX282Jb5UIqFhjcBWUJXMkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=broadcom.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5IiJg59vuFUqJT1DrjHHt0Pf9jD5ENKe3yj0+q51Mio=;
 b=VQLsGY7sHhpIDKdC8eyIDfwicHyH45rsCCdPUZhQmvG4mbAgx2NdoV4w0qtTGxvahx2oHK/S2nNlDrzTX69ZALDkuD+ANAm8gkUM3IvxGRq8jE5hzVnyWYv0l+eQ5mHIjwwK4ehuW4N8piusOYt88Qfq0nAPDIcSF81mfRVG480=
Received: from SA9PR13CA0140.namprd13.prod.outlook.com (2603:10b6:806:27::25)
 by DM6PR19MB3818.namprd19.prod.outlook.com (2603:10b6:5:229::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Tue, 23 Jun
 2026 10:22:06 +0000
Received: from SN1PEPF0002636B.namprd02.prod.outlook.com
 (2603:10b6:806:27:cafe::a1) by SA9PR13CA0140.outlook.office365.com
 (2603:10b6:806:27::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.12 via Frontend Transport; Tue,
 23 Jun 2026 10:22:06 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF0002636B.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.10
 via Frontend Transport; Tue, 23 Jun 2026 10:22:05 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id F21FD406544;
	Tue, 23 Jun 2026 10:22:03 +0000 (UTC)
Received: from [198.90.194.91] (EDIN4L06LR3.ad.cirrus.com [198.90.194.91])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id D7C3D82025A;
	Tue, 23 Jun 2026 10:22:02 +0000 (UTC)
Message-ID: <61bd38e7-5eb9-4448-a93f-afa2ccbd1c9d@opensource.cirrus.com>
Date: Tue, 23 Jun 2026 11:22:02 +0100
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
 <274c6e32-4571-4e74-8e70-53c780cc7e24@opensource.cirrus.com>
 <9298fa2f-a635-4055-a5ba-8b4971ecd5b1@samsung.com>
Content-Language: en-US
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <9298fa2f-a635-4055-a5ba-8b4971ecd5b1@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636B:EE_|DM6PR19MB3818:EE_
X-MS-Office365-Filtering-Correlation-Id: f5729cbb-6082-468b-c82e-08ded1114667
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|61400799027|23010399003|8126099003|11063799006|56012099006|4143699003|16102099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	gY+vt6KaveIeM/flMo/Qe70TezfsGxXWJOh4evpepEZfRxlerUXEZaGcLcM1sFUuFoRnxZGrZ2aUtDKS5bEHNUSsWStmMZ0+39ti+8MocbdznU6gD/r3qrUAINoeAGDgPbMvzCXdCnfKZXvu5Dw5mvxj8L7Gvf8jopRLdlt+An4t05mO7dbgI4G6M0cRfNGBotKEs4bdcmxkNE39cJA7G+LnZPOY1WGq6x/4XV8nZeLMYSxu8kGA+jLuZhMVUJ5bHrZIfQlpaZQ7Ew1Pa7tXvVZ9H4zemxbNZidoOoX/rKutXyEsLxtlXfFmNx135ESTcJTak2YOfJnArtNeWAWERReuQUEdy+noL6sB2hxU7p17BV2lGZi0iGDB+llZQfJDHSG4VdRRX/jrkR56UP4F36SDqLk708Hw0g3lEWW60ylCrDJ7rPnmF+PeJy8Q9NTEEjpV9e3z/clXx02k6zhoiaQsVzhsbZTGBHu/aNPwUET4K16mCSJYvd0k9y0nemQ8Ve5mFuP46HAnVUKopJmpj0Y1IcMR/96W0nKhvbGygmIgKlxtexGx9wvU1TZcUACeQ9USC+0QnsfsZkWIDk6O9xz1W1zPlcFTEPqts0SgI9ECbo8yPsPOLXUK98h4okSSXaynipRMozDMt4k4F3fiiq0qizWLFs1Dn+yr4WnUeX1ciY8ORNzDmg4jcx3SDMAFOR7S31QRcEq1F7fQXOMSGg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(61400799027)(23010399003)(8126099003)(11063799006)(56012099006)(4143699003)(16102099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MaJvvQdjn3q1kT1SRsPQWlAakm07iUb13Q/fIRp1xw2ky5oGrSdYQbrBiSXf95RjAbhjs8kbIstBYaAF1n4CXFAsfi+A4ehu68AkISQcE0tJCuq3W4KLmy5R7C4fbp36YrYGpxsno7LfFt4+zoQUk/z6iAmHHwWvZJLMU5lMcVrVO69JaUPcHSHq9McPOlaozt45bBYcXA9yMFrz91byZ1E2fgqc3nzAk5nA62dflGTvXOPQ+3WiUM7nwok13eDCC6ue1pdh0cTyGSti3HSlcS2oVmi5g/TnjLP6jK53TYvpM7Tl6atHUtBINzbKWCbgsMvT/O3VZaxliJuD4visYlWGWcn6GAQhkrR1WTId7JgpSxp/VKg7yvukfWQs370jpqo+0E7gr01C05Bf8Ze4GPxVlBboUcE9Fy3nj3oEYANCv22EMz9K8cCLS0mH2DM5
X-Exchange-RoutingPolicyChecked:
	T0cVuco7NcRJ1hrnu8Ec0LoEGyK4SpAOIQteQGpQ8Jyb+/Dnne4HtBbFVodaRM5nvZaSibYTk1WxPBLsp7RAp09RdU3OxrLj0fT1LFRzuVnygkH87aeBMo79AMt+G5+Ghms5PNSEf36leJoCohrkcZqcAm82oec4vFVIammKNqkmaLDB6R0CcJtyAAqXjVxDEGqohRM41R1L6daZRabGl3EXHCD2Ys9xNJRUBTKxXxmq4u7Fqhzhw8XrhCwL3HZpseGpkfHF7GJ79vEkGiFyqQGEtKfSlBlaHe6oXzPzmL/lpj5hlntxWO8P58MK8PY1It7Yh95G+eK0psG1wU54wg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 10:22:05.6157
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5729cbb-6082-468b-c82e-08ded1114667
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF0002636B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB3818
X-Authority-Analysis: v=2.4 cv=UJ3t2ify c=1 sm=1 tr=0 ts=6a3a5e52 cx=c_pps
 a=5fNYnt3/gC+uMcP5UkWVcQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=j-5s-pUBHiCuwOoN6lEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA4MyBTYWx0ZWRfX/+tWgBisgjJk
 YQCV3iNOtqDup3TbpvWyfw6cYqe5F9yAP61/UIigaGNLgscqL9FNuLaih28M+PQgRRjnTuRe/P5
 D/fWkc/vVXW1XTqDrhv4Co378Tz4qVdxaIB/PMFgOKtZTRHq2PV6gUqdD7Ytb1rGe3+Tr7WeMMH
 9fijoNZExQFMWXO66lBdcSpUWwogE0T8fQkA7TKDaEP5O4v5VHrsz5sfrB/LyKSao9jem2CJzVk
 13F+7UIh6xLV7XQTvdicE0FN11BvRd50M55X33wSAwFuK25u2RKWck5l4GT/ryxKCRwRurfcFCd
 CNkNY6kRD929XDrpKc8zbWaViHC+Ou2kEQ0qn2UbWM8KlAitSiMdP4ee15Qlckf38qWDkdTKTIX
 kbJR+L7AOXki9gCCRo4CzULorL3LHlhl6Oa6BPoAhBQOxJ1kIUHe0ZbnyYLvWSIF10fI/df0E9v
 fIMvu0cK3hZcvWnbZMg==
X-Proofpoint-ORIG-GUID: dATw_aWT83SINPWBy6Y5EiVT95PJrdxK
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA4MyBTYWx0ZWRfX0+RftTOAp1vz
 Cwp0m/Fa/ijG3XxPRiSQX7W2lbC/iXlKDwuFvprOytl1QcCqJzHmx0fQCEujaHtXehlJyCVIbNm
 CoRSVzIVmlrH/Xre03lKPseG7sIRJZo=
X-Proofpoint-GUID: dATw_aWT83SINPWBy6Y5EiVT95PJrdxK
X-Proofpoint-Spam-Reason: safe

On 22/6/26 08:07, Marek Szyprowski wrote:
> On 20.06.2026 17:57, Richard Fitzgerald wrote:
>> On 17/6/26 15:10, Marek Szyprowski wrote:
>>> On 11.06.2026 13:08, Richard Fitzgerald wrote:
>>>> In snd_soc_bind_card() create a device_link from card to all components
>>>> to ensure correct order of system_suspend. The card is the consumer and
>>>> the components are the supplier, so that the card will system_suspend
>>>> before any of the components.
>>>>
>>
>> <SNIP>
>>
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
>> Marek,
>>
>> Can you try the patch below?
>>
>> If this works for you, and passes our tests, and nobody has any
>> objections, I can send it as a proper patch submission.
> 
> 
> The patch was completely malformed (broken lines, tabs vs. spaces), I had to apply
> it manually line by line, but it fixed the issue I've observed:

Sorry. I forgot that copy-pasting it into an email would do line
wrapping

