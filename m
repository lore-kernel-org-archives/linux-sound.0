Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3CC36EAAD;
	Fri, 27 Feb 2026 09:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772186309; cv=fail; b=bpQwEMZw2CmyEwrqg7UR2UABCFq3mH7LTYbtcrgPwAYk0eyBWY+A/LiDitCQBwGZxFWI55HouodCT7BlXA0T46YpFC7tQ3/6kazxcFRBfrM2RS+PjrVT91OSs6G5lzgUDfuc2UmobdVmlOJ1abqvaZNWDOwN+/93L2TzodD1PYY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772186309; c=relaxed/simple;
	bh=Fz+upahHlRzXKi9A/VJIiAdZ4R3TjXgfHhGoGCcjhjU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AHWUEJPLRHmOw8yV4Hr1lXH2476gnM53TM1Kc6OpMTc7u2ieEEcPpMwtcq0/NFEL5+MWXn2s4v6VveZEw8Hot1R7BxJoKrqu5m9P1P5w8NuH6kmdapwuickFasbXq47lEJ2Q3xr9VLJaf9gwlMl7hbuWr2RfU2f5zqtYlSKOBrQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=InWRn+2y; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=O0p1mK/s; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="InWRn+2y";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="O0p1mK/s"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R4fPjC2890955;
	Fri, 27 Feb 2026 03:58:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=8Si3jZXu1dawcAqMNLWC+nz+s07cIZNg+lehnnhxOH4=; b=
	InWRn+2yxIdVcq7KiF2+z7OgjgpFxmXLQufy86/bb6WgtCBTfcaqmaYCwZ+tOuzW
	2CFbPnjk1NWjWVNI1JV3hATE4durySQwz3eosGMWCaaAUdwp87D9+p4oXZnwDlRS
	zOY7uohmCFi+K5bcmWy9YJhU8zhW64axc/6jlgLJ9VLSwx43HsUdJu18QQ6t+oY4
	HGp84gDrYvlJ3jUCRNGPZQKVKz1JhJG+36yvnaQYAyUkvWSf3SFSoQiQEvY/R6md
	+vpMU2c69l08oE3RxSsJl4fSYf5CRH4WRdqVwaazplrluDKmU+AuBTfH/faR74/b
	ukwiQ3pAN2z8G3LHn+yTfQ==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023073.outbound.protection.outlook.com [40.107.201.73])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4cfa0j71wv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 27 Feb 2026 03:58:12 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZGyz5CTCnzQrOqvWFvbKoVpNHzYwnS51prkGv8wh/RxO85E0ClPh80d3pUQ3R55ZBHEWKSU9uFbKy4hI4PztIzBwJESPtO2wJgl95niOSTpDOdED4Qt4BQpOvb+1gH30cHq5f7me3KaUJxnhXZ959FVHxz7laVl4VHn3KNnd58FPn0HEua0kXQuGwuZSVuo6juL+XDviWujhjUybP5Avd71CPCbnYCn5kAb0hsm95fNztB0RZEh9NBFjy7UEzyNaw64ugPwdoKx1g83sK7bbUOtHk4mjSuo/gLH42dhRZl08uEkJkF0RJ40ldqUehNByohWW+Kp0utSSBvzY2znnMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Si3jZXu1dawcAqMNLWC+nz+s07cIZNg+lehnnhxOH4=;
 b=bWfujqKyuZft0eSAR+82072RVvmuaxLtdU9hgvUN4zCzsHLk8/+BfYjOBPNk4l/0ttPr4vu6eHm1st4DIZvboUeO+/fHSx9WqAoQDKMQ3OlV71qDOD1gbngItK6jVrJv3/9MdO8wI79Sfp/coa/pa0bjiepGicZe/HnhcCWa8TDID3htIlMo9JyZuEuAyrah8t/lyNFn/Htk8I99leVYLht21J3G57w8MtgyxOcrYjr7bDlk+svD592uUUczK/QfCMxWnTH9Xtl7W/jxy4QSGCCWIenSR7k7pLgSPXYG0ep8THdiUpAkD+gI1bGxm0RRTwdSwdow4GSyhChx3FSsJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Si3jZXu1dawcAqMNLWC+nz+s07cIZNg+lehnnhxOH4=;
 b=O0p1mK/sA5OwME6riVPOF1dcKYLyPmtft+SKdxEI40lBapjC5mgGZpzDuR3fhFMwRbpI7ZJGmZRV90rAtS+yqdliY3DEUtdhExbKZ7RvJVOJfIHMmNOCdP/bwZB8wVhn24eD+yTbLEvEFjWDbzj/7Cmi6m7tm5KHGrM3CNBg/Ks=
Received: from MN0P221CA0011.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:52a::8)
 by SJ2PR19MB7486.namprd19.prod.outlook.com (2603:10b6:a03:4c0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Fri, 27 Feb
 2026 09:58:08 +0000
Received: from BL6PEPF00022575.namprd02.prod.outlook.com
 (2603:10b6:208:52a:cafe::ef) by MN0P221CA0011.outlook.office365.com
 (2603:10b6:208:52a::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.27 via Frontend Transport; Fri,
 27 Feb 2026 09:57:57 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF00022575.mail.protection.outlook.com (10.167.249.43) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.16
 via Frontend Transport; Fri, 27 Feb 2026 09:58:07 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D835A406541;
	Fri, 27 Feb 2026 09:58:05 +0000 (UTC)
Received: from [198.90.208.24] (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id B638382024B;
	Fri, 27 Feb 2026 09:58:05 +0000 (UTC)
Message-ID: <0aae071b-0fc5-420b-80a3-b4bf2b36be88@opensource.cirrus.com>
Date: Fri, 27 Feb 2026 09:58:05 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] firmware: cs_dsp: Add API to hibernate the DSP
To: Stefan Binding <sbinding@opensource.cirrus.com>,
        Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
References: <20260224161821.93365-1-sbinding@opensource.cirrus.com>
 <20260224161821.93365-2-sbinding@opensource.cirrus.com>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20260224161821.93365-2-sbinding@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022575:EE_|SJ2PR19MB7486:EE_
X-MS-Office365-Filtering-Correlation-Id: e7aa7d3c-4437-4efe-48fb-08de75e6b514
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|36860700013|82310400026|54012099003;
X-Microsoft-Antispam-Message-Info:
	63gCaguGcu7cBHylI8Ml58jTK94/KI3nsi/sbXh2NzPHvo2oqgZn8YTPLvNnYmcES7diAiuDOrOzO+mBch8zCbi+Ixey59yXZxIiYQPr1ZssEtncvDAKJz4+z7aTurq3+CPYvrQZq1EzXjxLw1I2lawXLR6DVuS3bZsb1eYakAQ9DSvuQ/VSriRkxfUBvpve1tX7GbyBg6VRYbsKT/JtbnCa9DUJcMhYMhK80H4OXcUgSnFrkKN1FJBF1iul6rj9B2R9nNRPD+yRh+ilb2kLW14XEGAr9t7505NqqXYKVUlNZol/6YBlFZPa8U7q2dOcMET7Q1N/0ZhDo+v9W0xRiC90I0XlrhSuy6HBfyuNJd4oCrlHtUsn500Kf4H5x5tqjjA8wi4NqoEHKuWrf0IiNnAHC+3KW2VedRJGgp3HtqBXUEmHSi40eHgqPkdn/jV4bN5wNHBEsOdU25ym1KKiySgiwxGCaGy5+iBLFIKrZvMrmR0V34rEJmSfcUJayZRsu9X05LyFdTJOxjg/0iUMqq9EZMJcikMHw8MCThg5F2QywdwwV7jfWf2iA+JVd4uVl2rs9B2o/AZ0XAPPS2kEugzLKJDdLx2PEjvgQRAnu2r3OHcqo3MxEJgmXXnaggP/yYuHAlV+mkhjZxrqir/GFlUEmcwvyZX+YnuYUhSOkR4wfy0vS1G8MULbqsqbco2RpSz3DOPcxt+e7AbQPW1KvmX9M/TqZWpq7uK3vaS4oCvQDu5jOXm1wBX5S+zCHZTbOopIzxxA177BkmWjeH59i3rR0hJKk+Topd2KqglUbYo9ahoPtONSML6WM9xst2xEVdS65AJJUpX6vtqty01sSg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(36860700013)(82310400026)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xAAXfTKETRkofMkYV04iW5/uspN6735fJexssmyOKmToYzzD/Mt8oEVO4JucH05xhCobR9eJiZ2O2lzPCewK+Xga31rhLOlLd2iiQkKFLNTafMkwt7MTkVlec179uL+ZHm61xUsw+O3NL1NVNi4x1lMpQS1qQh+qiZoYlkv4nROxXsijrThZU1QlT9f6u0qrjsSmn3jcfQvOpX9rm48EHAKofOekFavlSz2VB11ZlJD2oNTsK+LHeZqFVZ0yHEmITFF+YiFXw/GvxO5L/RuUutq7jEdNbveCi91BzEA7DCt4JV9zw/xmgYbEGyn5XCI+SZgJMNYvxOZhGwpO7YHwSRpOWcRAc+/wkq/aywUb0IqXgnBMVaIFnaqRurxOD4A+W6VPc99KQi8LEmK5B+iqqQyzwLx5IQ1Zs5kZLXmjFA74wrBj745/SbGXv5KVtAL3
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 09:58:07.2071
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7aa7d3c-4437-4efe-48fb-08de75e6b514
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF00022575.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR19MB7486
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA4NSBTYWx0ZWRfX0N43VIVj6tJW
 aU6wRTQMPeEmZ3eRHZllTTmqvqpTXXlG5PWizzcdJ8OxzVE0B5CRpMLaT/j/SSdzaRpT9lFVO7I
 UNCYXaNxCcTkuPP7B5XJHbXUswiezjV4dFgOcLdDuIHYalGCFV3r8PX4FvXkh10Tc3AIYxQhWwY
 uq1HTkKUat+hkvSipJwRhnkEQmBUKW+XV0aIdxz6SbRvLAyi1SV56soeuQURZoRoutlp2MI7D/J
 8HIIqLBZu82uFujW7zxqBr+2r+heIVVVemLySmQE1JIeJv9Z3SUdAvydnHnBnmqD3WGfmlnXgfU
 vglI/VrrMgiMzg2kvziJcOMLjbuIyoKHt6+eJY9LqkLtj5tY+zbFj5vIboK/0srp+6NOyNezwzy
 J1vBhjeo4qQgzPZYk1+jtPX9jgBSZAeCz0RkOo75y2SYNGxatD+RX0O3JNu0XHJ0dbBGhZP5Ipk
 TgJQqc3UBs1boGCidXA==
X-Authority-Analysis: v=2.4 cv=Q/7fIo2a c=1 sm=1 tr=0 ts=69a16ab4 cx=c_pps
 a=nTlFlLmRIhD1ZeI5pamuDQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=lkpMduq5xU4BuurvtsEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: Fhx42lDfriCs8w7mueuKeo-u0DWu0L-3
X-Proofpoint-ORIG-GUID: Fhx42lDfriCs8w7mueuKeo-u0DWu0L-3
X-Proofpoint-Spam-Reason: safe

On 24/02/2026 4:18 pm, Stefan Binding wrote:
> For some parts, the DSP is kept running when in low power mode
> (hibernation), leaving the firmware ALSA controls enabled, but the
> registers are inaccessible. Attempts to access volatile firmware
> controls whilst in this state would produce errors in the kernel log
> due to a regmap_raw_read() into DSP registers whilst the regmap is in
> cache_only.
> 
> To remove this error log, add a hibernating flag to indicate that the
> controls are inaccessible, so we no longer try to read or write to the
> registers whilst the regmap is in cache_only.
> 
> This would still produce an error when trying to read or write to these
> controls, but this would be a different error (-EPERM instead of
> -EBUSY), and would not produce a spurious error log in the kernel.
> 
> Upon wake from hibernation, the control caches are re-synced to the
> hardware, if the DSP is running.
> 
> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
> ---
>   drivers/firmware/cirrus/cs_dsp.c       | 49 +++++++++++++++++++++++---
>   include/linux/firmware/cirrus/cs_dsp.h |  3 ++
>   2 files changed, 48 insertions(+), 4 deletions(-)

Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
