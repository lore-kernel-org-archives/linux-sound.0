Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E45C265CBE;
	Thu, 18 Jun 2026 11:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781781762; cv=fail; b=DXBunZ3ByKQTW/UQ8GPEOpqjz9i/vw5JtWN6NHekFd0lA8Rhr1SGF4gAjIsnz+tMoQ2hQtHyWiarHUDJVNZVOKY7q0LdvSsUTsNvGEHS4Wa8IqPpPXFRK6wAqasjCaxh1I2014KePpkId3xWPYm+z1ugYa2Jb2L4+OY8eZfinAs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781781762; c=relaxed/simple;
	bh=OV3y9nLPJ3ZwcQAzs4UtekUtGhda1jBycwNw/mL2xRA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r30ZRbmfj1CvNsuNnQdVnXm2zfKE/3R/P1JGixHJiCZQN6AzOjmYpc/gxLJOL1EBtcCmtpqysrztpzJk2NgdwAkmIIZpoAxF/VguVwwcG5WoekEZdnfENotCiILFqnGXUgYTbUVlZ4S9WwKoYvg30vd1ETc+jaM+AZVASNGS0Og=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Tx1v5/c7; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=dke7VHfZ; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Tx1v5/c7";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="dke7VHfZ"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I4u9NJ1582161;
	Thu, 18 Jun 2026 06:22:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=zwQ4U8ZFiLYHP6N+PktJqOYidAHeMq8Bwx2vuSRytic=; b=
	Tx1v5/c7g6B5LFuXAWrRWnhsTHmToS9/l0P6PrzdBa46WDLlkqU2EvtFXo8pM+si
	2O9dn1plSkPMh+JkHkcZhfnM7JXAIWgDSdBWG9t42TRbqhZkNGz1CWFj3wBq49cG
	chSze0D7kbEgKuQNM0P59RWBpwmqkf2jG4pSToHtRoo/Tq+sjD6MI2875w3ejgno
	FOtdTP8Fq5loC2ThEjjlNcle4QTqBuhy+Yi++9K+1UcaT1wbSfLQYouQyV09A1eW
	iIQhk2zv6X1ozfCo5t0VYFqMj0FeD9dfHb/wwVInjsNuxQNZg7IZEMabCl+Hzl8f
	CEcBtGsd4eDlg8XkMnKFSQ==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022133.outbound.protection.outlook.com [52.101.48.133])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4euee3ajpd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 18 Jun 2026 06:22:30 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ioYBNugpFIjE4uNnIJhUs5KQ1vNxIQGEh620ZopwAunI30P07XfCXxdTQQtH47+68WFGBIqMYDWCFoc4fzFzKearbguVHCUHuDT1g3ikncRbxRahVwVlimjCdBXHYeFy5hQX7Vjt+BffG/AZcAPQK2fqcDi8HLogYgBD56ICBwnHHqPVd6nhyawOLwjdNgdTyw8S1h0aA2RSwDxRF1+DT0CGNgiAV1ubxwDaobv2OkzXltUEdBjGVI74c7Jsyenry0IOEjXQpM48dAZILq2dedzY5FIZMqUPk+aGD9o9mWI3Gvparahnt2i5QGQ1wdzsnmrc9Ucw8/l/GFwbzF0nMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zwQ4U8ZFiLYHP6N+PktJqOYidAHeMq8Bwx2vuSRytic=;
 b=g9hfc1avLAjrNJDShCZDRyM0H9hvEZhmIKcPgVhp//FjOPAwB8ol2gOZZVEWza69TfAMqYnAXC+OQfmNRuVlLgBHO0JPymNV5CDDjM0E73p5sNVsGFnXM4DBBs+A6PLOLSqO0Pz9dWg7EytcEc1yGo9ed2rcjt0B3JTqvFNBNlYadkC/vO0hlTaeVjdmyYviSUXGoHCH75M1UTQ2eZF7Os1VcVVFR34VLL8MkAiVLDfCvGt+CdUkfJHnVtnYE45eEwGDoYXRI7srQ8Hv1LUTpO0V2riiGLW1keeiEnNItfwJNvNa5PfN3Y1usTa1BCYFFpagK75Y6LtOJ1xmpJEK9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=broadcom.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zwQ4U8ZFiLYHP6N+PktJqOYidAHeMq8Bwx2vuSRytic=;
 b=dke7VHfZDovM7O3cXY57p0yiXv7qx+k7SVGyc2eL+9iI4CVsnwZc1wzPXB3GZDRWPpyIZzz/DeqBx5k2+KpOfjuyiZQHacQU5G0zB4Z0rOV4x/K5JHAU2rIz1N1ZFoI8YkneBXpY2KTO74cqouaeiG+F+Wgcs0LW8M9yTgR/bLY=
Received: from MW4PR03CA0214.namprd03.prod.outlook.com (2603:10b6:303:b9::9)
 by SA1PR19MB5198.namprd19.prod.outlook.com (2603:10b6:806:1a8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Thu, 18 Jun
 2026 11:22:26 +0000
Received: from MWH0EPF000C6189.namprd02.prod.outlook.com
 (2603:10b6:303:b9:cafe::7) by MW4PR03CA0214.outlook.office365.com
 (2603:10b6:303:b9::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.13 via Frontend Transport; Thu,
 18 Jun 2026 11:22:25 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000C6189.mail.protection.outlook.com (10.167.249.121) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.8
 via Frontend Transport; Thu, 18 Jun 2026 11:22:24 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id CE82C406544;
	Thu, 18 Jun 2026 11:22:22 +0000 (UTC)
Received: from [198.61.69.19] (EDIN4L06LR3.ad.cirrus.com [198.61.69.19])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 2428D82025A;
	Thu, 18 Jun 2026 11:22:22 +0000 (UTC)
Message-ID: <b9e3f7cd-2329-43b0-89ca-0243e4916c16@opensource.cirrus.com>
Date: Thu, 18 Jun 2026 12:22:03 +0100
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
Content-Language: en-US
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <4c9156cb-6508-4fda-8e36-7edc4eb7d6f9@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6189:EE_|SA1PR19MB5198:EE_
X-MS-Office365-Filtering-Correlation-Id: a096def0-8389-4586-9811-08decd2bdf8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|61400799027|23010399003|82310400026|36860700016|18002099003|22082099003|16102099003|5023799004|4143699003|11063799006|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info:
	bZFANn8OBg8ZrDEmqPykHr7zHiv7WV9512VsywZDsfgkJ6y9tCrnj67R0GiggxGXIaW+lc88wiTW03jN+CvWVDop0o+MvdkSwPD309hmt61j8m8BUBfCrc20xdHQjkjUvHCG/m1oQDsq3Wayn+JJmGRY9y/jH5C3Y2NOfCA5pTLvhxXf45RS3PW+tuLoxJJ2dVQ3Sy5dFX6b60gE9fg9SfBMYqK19rfNqlsg/4c6IhDAKbMLjd62jl6oQnDjWrLOqjbs4IAjwxiWC5f3AZtdp3nitejAP4cwXEchdmAm+ZhJ1kTja31MM1qUEZo8fj5mKSNJb5GFIn6hDlEhyuLsQic11YNjixJFuzzZkQnIH9e5/36U9s+SjkUAMFzs1WhAPk2hmK3k7ClhW1bkeU4BvbDWVFOIBV2amOTLYzr0O3xOl56dBlEhRzlPTR+It0K+DwJL/D2Xctcl6ezns9gD0kP77J4U720GcppB4bshOrfOQURWY9VYXbZoSA5YAZJco6YODHrr7zF5yh1R5RqG49M2UYEkicfg/+eXmL2l8vepDQfyHTgOhD2JlNl5l2dPlARzGHKSBpFAz5/Ki+TstHp4Bqe4JIuFs8dJDufgWjO0HQl5HW+u2QDAG/xOJJZSQa8pjTwonWC0G0ldw6gM2F2+ZftZIckg46UltedyQXpUIzAeeT8Dg3O54SX6EGXQup9+5cOczbsY/4K+AVe7L5ZoPmgjBeiaftvNK/4YUxY=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(61400799027)(23010399003)(82310400026)(36860700016)(18002099003)(22082099003)(16102099003)(5023799004)(4143699003)(11063799006)(6133799003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Wvm2qEDC7Op6NwDLlsOFjlrydkNCGQzuS2YT69JW3Z2XqfBZC+qourdtfckdbdMH9x10REZ8HyzBPSX1YBeho0onauWTnjSBS9kJgf2jOpyqe9yO3c0unb/6MiDVqxPOkQ5prBmxJzcwbR+Jy4xf/QjqBZSKZmj4nDQ30wrARXVWLPdmv1i9OvwzbwnVPI89dUooYhTRdX+xCWGrRyfISn5LEOcNqHmsh1CdF6sv/mg4+8nWIHRgWHw1PSqA3zm+Gb48Eu+b9gEZNwlM+9Hjj8w8IObF/bRXHzI+QBLaAVBATZEPN2jfdfOH8a4sssf8oDv68R/2Cm1ZBp9zpPmk/+F6IQEj1hQBsgFJwXtt2g6LEZrsVbXBk6r/QiiPHCVzPESzh2O5uZYz5SGadip12rjqsOtq0rqUGvDtkdJjIX3DjIUTSc0eS7TjK6/7ZPss
X-Exchange-RoutingPolicyChecked:
	q9nneUgLfmDivdc2roONrs/n5ffmh0hjOLmjPLCWXGlJrIo2h5t15xQ0Xdtj9yRxFELOE0IuzGOGaJgIITBdSxXPpvwHStJMnGGtRKjH6Nqi6jFDd+lgzJOZO46y32tSFDfi7ujgtZLy4RD2H+x1GHdLA+fksGud6cR6Uvw3WTfoHkLdmRLazyOU6f7duZJBmj1dnekk+au3u6N5LDdK0MrgEvA6okguvaMWlLTdcG+JjRD8vemX1s91ZEAvEo3+GLUSsLjtA4tF/Uwkl8waYxJncqPEYZwyCaBAksLz6UQxCJRT4vdoicsTz3TCC9WRztDN7jr98p4S100mZfkAhw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 11:22:24.7678
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a096def0-8389-4586-9811-08decd2bdf8a
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000C6189.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB5198
X-Proofpoint-ORIG-GUID: JMKr8Y0t4bWcjof1CTMbTT0uP1DCdObc
X-Authority-Analysis: v=2.4 cv=UuxT8ewB c=1 sm=1 tr=0 ts=6a33d4f6 cx=c_pps
 a=/xE45K41/b7qeiroFAFKVg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=QiYFxa1vBVXuOZ0L6A0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDEwNSBTYWx0ZWRfX1j+PsuI2L0OP
 Xx6BR62azCSdEJHUrNROLRbBssvO8ZNc+REbf5f5e4ER+skz/OJHFvtFp3XfIRLjJzF5GPHKzgC
 ayJLBPnoujSuoKi9oh0Gidj38RL0s1Q=
X-Proofpoint-GUID: JMKr8Y0t4bWcjof1CTMbTT0uP1DCdObc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDEwNSBTYWx0ZWRfX1ovyMYQeDuHm
 fBbwETK9a4+YB8ag7VAKpu9VfaZ9GXL8IoPqiyeZNnzlsNraANNV9nJiQlbxG02VZzr+UXW5ViT
 nskmLZWybs6+J9I6s6RTQVKjf0i4yMo8Ifm536kON6qP4B/QX+wuUW6/5CfeSVsShI85TqOWkxg
 YCKEFbqTnp8alIT29GBVDN1l5yDfLFVGFHXlh447vRyEOO9Y5VcFeDHSGYpJ6paSJX2KNZm36Hf
 YTvYqXNEwiaTMAEsv7jAo8Z67PJudtPgmrhRCKpPJMlDTETcwOntG++PBAhEf6arD1eIrCGcMqJ
 JklbyvE921XAqdjT82wN7glukqx1kgShgD0gRjalUMPmgBTcgIFgixBcOZ5CdEOOeITgYQFJcuf
 WMRxbKuEq1EDTRddaRMITfGrFJo8VWU6QjbqH5hrGQ1zYSJLlHZNKwQi0sY11lvUArsfHNSBtxJ
 cX4FPg86EbE71cFfL6Q==
X-Proofpoint-Spam-Reason: safe

On 17/6/26 15:10, Marek Szyprowski wrote:
> Dear All,
> 
> On 11.06.2026 13:08, Richard Fitzgerald wrote:
>> In snd_soc_bind_card() create a device_link from card to all components
>> to ensure correct order of system_suspend. The card is the consumer and
>> the components are the supplier, so that the card will system_suspend
>> before any of the components.
>>
>> The PM core will normally system_suspend drivers in the opposite order
>> that they registered. This ensures children are suspended before their
>> parents, for example users of a bus driver should suspend before the bus
>> driver suspends.
>>
>> For ASoC, snd_soc_suspend() shuts down any active audio, which requires
>> that the components are still able to communicate with their hardware.
>> Previously there was nothing to ensure this ordering, because there is
>> (usually) no relationship between a machine driver and component drivers.
>> If the machine driver registered before the codec drivers, the codec
>> drivers would be suspended before the machine driver snd_soc_suspend()
>> runs, so that ASoC is attempting to stop audio on a driver that has
>> already suspended.
>>
>> Creating a device_link is safe if there is already a device_link between
>> those devices because of multiple components sharing the same dev.
>> device_link_add() kernel doc says:
>>
>>   "if a device link between the given @consumer and @supplier pair
>>    exists already when this function is called for them, the existing link
>>    will be returned regardless of its current type and status ...
>>    The caller of this function is then expected to treat
>>    the link as though it has just been created, so (in particular) if
>>    DL_FLAG_STATELESS was passed in @flags, the link needs to be released
>>    explicitly when not needed any more"
>>
>> For the same reason it is safe if the codec driver or machine driver
>> later call device_link_add() to create a link between the same two
>> devices.
>>
>> (I have tested creating multiple links between the card->dev and a
>> component->dev and did not encounter any problems with suspend/resume or
>> module unloading.)
>>
>> The DL_FLAG_AUTOREMOVE_* flags assume that they are being called from
>> the probe() function of that device. This isn't guaranteed in ASoC card
>> binding because of deferred binding. The exact behavior and consequences
>> of the DL_FLAG_AUTOREMOVE_* are also unclear from the documentation.
>> So DL_FLAG_STATELESS is used for safety, and the links are removed
>> explicitly when the card unbinds or if the bind fails.
>>
>> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
>> ---
> 
> 
> This patch landed recently in linux-next as commit 0f54ce994b23 ("ASoC:
> soc-core: Create device_link to ensure correct suspend order"). In my
> tests I found that it breaks probing of VC4 DRM subsystem on Raspberry Pi
> 3 and 4 boards due to an issue with hdmi-audio-codec:
> 
> # dmesg | grep vc4
> vc4-drm gpu: bound fe400000.hvs (ops vc4_hvs_ops [vc4])
> vc4_hdmi fef00700.hdmi: Failed to create device link to hdmi-audio-codec.1.auto
> vc4_hdmi fef00700.hdmi: error -EINVAL: Could not register sound card
> vc4-drm gpu: failed to bind fef00700.hdmi (ops vc4_hdmi_ops [vc4]): -22
> vc4-drm gpu: adev bind failed: -22
> vc4-drm gpu: probe with driver vc4-drm failed with error -22
> 

Where in device_link_add() does it fail?

