Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C7E474255
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 16:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785514849; cv=fail; b=qsi0mTQEzqwQUDM9VSg4Xt9gYQhZB4TyGNoaUUS4so2aKMNvrPjprqAN76ykK0fPxvgn0m7j3OpJnokvr2Pq+9Sexr4ozQDio94hFV6E3SSHyWG+fHMCBxkbqbrNPKXzx84i2/sLw5HSFbk/LJiyxrED8paD0zvIIb+VXHhRpa0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785514849; c=relaxed/simple;
	bh=Cum0qkLGuGKcyJe0KRr50k1cmzg33dPHrTcDOHU9VzM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NbEWOggG1uZdjJzO+KWJuLYAApzm7XM9gnHEDovCGGlnWf6XZBQOoJDVLNUtarh/+2qhWHCkUEDGdGG7wJI+0e+Ia+Z7n/8lWUZfrZ+5guTCO2hnjjONBBkO6tmgr757qObJn7QJcsol38CUK5aMX7wKxnTqbedohEQ2U3oWf9w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Ha2LOali; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=zFLRf9pZ; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Ha2LOali";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="zFLRf9pZ"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VDGqdd928474;
	Fri, 31 Jul 2026 11:20:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=VAkLeM58g8ZxbU4v8dwLRnpYWnnhWrzUGIbhH+V9/L0=; b=
	Ha2LOalis9xl0D1BsB/E566lMw7RDwjpyBqzKuzC6seJbDWda588ypIRXdSOE25M
	WnCGlxEmmj19CS8iuCmuh2mA/UUnpeIU7ShMpcirISjYjX89PZ+7tnUjifiAEacn
	DNwn38fIUbDnfb3IW/vBpCpxstlM+p15SUfDC2e6NZuQ22KkWRD7ujZ8ZZ1CTnLl
	2MdgG40uADvhjh1p/59ghUgwp8oS7DIWmm1xLJRhjmT29bZe5T2jkVY7XVlFl0B/
	6rYb4OTZCLajwoSJwH2k4wYuGOoke2h6WIkqBkvWlhbRuc8th5jF1Irl2dN4N03c
	AQs8wRnJ3rI0YVASNM7JKQ==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020105.outbound.protection.outlook.com [52.101.56.105])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4frtrd8ere-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 31 Jul 2026 11:20:43 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yR/FApY11vsyfuiaP0kcSue9mYB8zrKzD0vxcm0lYioaTsXl0ihjgTM+Ds6hhvwGNO38csPsHhY94Yd6u1ZjQdMzOMyDkAjrRplhB3h+Z/s0LxOWSbnHHkf2d2qyckLxlfn9VMROX8z5uNDoInbWclCmLEEF8c17RKqNEphSqFzuXahk+OG5x0kY5Iy2uSDW5AawVo+5cKM7hbQKF92T9NcbJ7di7ptujVR+z+FMez87E+Yo+10QQByyDi/lp1EQI/0AF6UJo//AhyXf0fp8kNBH7SbL7Ty9FEAc0Lwb6SrzPeon1doFiBWDl1zh3zvTae39TxFoc8ZYz8YXH8DwKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VAkLeM58g8ZxbU4v8dwLRnpYWnnhWrzUGIbhH+V9/L0=;
 b=PwV+KTPO52cUpU4qZ+0mDEp9inbOlVcr6JS+DmyHg9+QOrsMlwumoh+j2S088rnxsKl5IfQu/3f9sDA+xucZ+Zz1i0r4NSzrtiAxzWwZq4/ujVlWvsVfSBYAZzKiNpR2li+zNGqkdwCQvdY44i6fwRYOTxf1zaqnJDCf1s/R3JfnMS0KQVaisJkULv72UDVDRrTorZhXkMfLCoqW50Z+fdNnJ6NqThIQ0tUKwktXImUeQkvI+GdDvtzLxdKunKrDiCH6onO8MhRzZhrZfkblAN41cWuWK72Xafoa560WA+idpP4ADIra7vnKlb4Tkz7EX82pedkU9GXeaJ1OLCqoPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VAkLeM58g8ZxbU4v8dwLRnpYWnnhWrzUGIbhH+V9/L0=;
 b=zFLRf9pZl4d580chIXEWPzxgUrsM8/Ewwag1Uj8O7vIN8cSFpKZMJ4CNFkY2XloY3uvonWkKxyorDDx7ncIXlNq3FiV/8eWR0QeSYd8e7VQG0SnIAhF26wh9Q5xsfGwCUG8IHFnwZ/fJl9lVizDt+35nplc+3Z1X5UyLlK4jcyQ=
Received: from SJ0P220CA0016.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::23)
 by SJ2PR19MB8093.namprd19.prod.outlook.com (2603:10b6:a03:53c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 16:20:31 +0000
Received: from CO1PEPF000075F1.namprd03.prod.outlook.com
 (2603:10b6:a03:41b:cafe::4) by SJ0P220CA0016.outlook.office365.com
 (2603:10b6:a03:41b::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.16 via Frontend Transport; Fri,
 31 Jul 2026 16:20:31 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF000075F1.mail.protection.outlook.com (10.167.249.40) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Fri, 31 Jul 2026 16:20:30 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C97CC406541;
	Fri, 31 Jul 2026 16:20:28 +0000 (UTC)
Received: from [198.90.208.11] (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id BD9C982024C;
	Fri, 31 Jul 2026 16:20:28 +0000 (UTC)
Message-ID: <e19e9f71-1312-4588-9de8-ee5b7777fe2c@opensource.cirrus.com>
Date: Fri, 31 Jul 2026 17:20:28 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Missing CS35L57 tuning firmware for Samsung Galaxy Book6 Pro
 (SSID 144dc910)
To: Riccardo Squarcialupi <rikysquarcia@gmail.com>
Cc: patches@opensource.cirrus.com, linux-sound@vger.kernel.org
References: <20260731130239.204280-1-rikysquarcia@gmail.com>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20260731130239.204280-1-rikysquarcia@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F1:EE_|SJ2PR19MB8093:EE_
X-MS-Office365-Filtering-Correlation-Id: 374f7942-7c94-458e-1b78-08deef1fa433
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|30052699003|376014|61400799027|23010399003|82310400026|36860700016|11063799006|56012099006|10067099003|22082099003|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	dyGUiYEchvrQtQpF3KUnCz0gLJHU2si/1atiVp6z1JpiNrsWtTU2xsbxiFDB7tspwTloM4uVGw9Pr9Api8ob7Ooe/EFpEsHWD1u3+YK4NQfbT1wS11OJSYnUo6yPfcG/8XjQHS1onnhqHoVWgXqXMFm9itkDeqQKRUhXpBHm8jC2H7Ar2mfq2rw1hZ6vNYFttKmNTlmRPDcLYhXT5nHD4dF03xQs6I6yrtR1M4dJHoDuCPjryBDRC9GU1MUwZBjiVPI42xKME56Y1tO2KoWSr7nHCskRzxQPZHt9lMJBrVa2sa9RSnDa8CdClpTIss1iR6IIee/K7LQXDXdDUcewQVtbRgWRMmHwPywkQW0aKw+ITSVpMN5taLr9upN95bOhTyaaG1bT99Y+YPd6B6CXPmVRNhdE64bnS/EuYEoSwQ/zUiFh5Al3L1xzBlGFd+5X743TS80TNHe1os8oJt+tThWQOaGTxIkGCX6w3G9WVOJqT8Z+StPYyhY1XmZ9xze0loM9iRMcxOJE5LDFFUA5lQpeWnQnpq9zZU4iiWdiY1vYuu8AW7CBM4c4BnAvFVxkec3/56LFtx7f9VLuS/pYAnhHn0iTMwL6sSH78D00SN4lciOXgGq7iDb/YxpMN89VRSqhFWlwDMK6PsENZjN0e0wspYcTmFNlN8VNi14rbMiKsBzrz+EiZo9gsxorulYS2RF/YUA9jAla/FpCO0SSkQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(30052699003)(376014)(61400799027)(23010399003)(82310400026)(36860700016)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	WCUcslpHgum1DTHWLgU57AzsLjG5+AwMQ8rJTd3OMncFoF5MfxSCrrfku/rLNVbPw59XVzT0BU9JZK1H4bTqkFew7D+cphFcJSAQ/4gq4OMDxDwo4M0oON2kfMUfSsJeC65DmzFMdhlRGCnCYKRqy+gCLiku0v7iDuXAjpDV1JKZA7HD0XrBGIRzh12vn9TuinMxwFIXjUkZiTejOuj3iZwcqZLpxY6fXDQriwb4WjJqjvvJoSe5aEhry3ZS7+fsbaCZAnB0rzmGE/o8eQUJ576YcgefmaNByx4o11LifG5pdKYarwEXgmISOSghAr7pCZVQc73CTXU5aGjU9ybZAJTr4j/L6McWLBNZ3uonzN/P0bflMfBjwkIzecUCBVGRKWgOlp9tqAFSg1lq8mW0McSV4lZ2XwdRlS6VelySJbB0OGPw6G+wGofvkFAGiOZX
X-Exchange-RoutingPolicyChecked:
	mQfelbILClW3lqrCuMnlCQ8kokWIOncazS9fGyJTfccFwj4HEwDjat7QgCSrdPfCAB07LoWI9zLlIYfg4P9DgOGNt/TlJqnJiQ1zqyHcVxq8XuRCA0TR2v+kMvu1dHpcvgcfyg3z4GpWsbTGDeGngQjW5qFxqepcFV72n75eu0ABmg5k0FuxGV7YCBLP6w1opjxovuLrmvDVtLEd2dJBW+zxhhAB86eefH6IQwaqIiEZegS/haJP9gaaKOFYzWR6jBZVAFn2T3LEl5oM7VantwqFlTAmidIRJPS7wLV5ETqcYyRakwU3RwqT+IIAmipvdxktkO56bA7iHZYbM++ARw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 16:20:30.7846
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 374f7942-7c94-458e-1b78-08deef1fa433
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF000075F1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR19MB8093
X-Proofpoint-GUID: LiUrbN9TyM5JEtKseOdGh2kMXea9o9Ym
X-Proofpoint-ORIG-GUID: LiUrbN9TyM5JEtKseOdGh2kMXea9o9Ym
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDEyNCBTYWx0ZWRfX6H7fnijKpfjW
 fjmN/A+mJlK+F11eFkjJglxcnGCkJgK/3JuCYQsAgwL4xFUe4nebwBPT4YXARkjlMANd2E8gtTz
 RjXCnx1Ke8t7mAHvWZY+E6bDijVxL51EG1TRIDfN1Yu4KrR50Yo9CtebmpDAHhJ0fkYShqyXimK
 cjQ8sT6G/yxwy2+Ny7rp58d2wLjalXpYuaKHQfgtHvzWxIJGLpRhlamGKIggDTnQn2j3pxx6zEy
 ISAD6n7KlFLNDwI8xiHDkE3sMmk+Z3M5oOYX4tI6dNrD6wTSIMR6zUNNebmDbpcNTUsrkjAmqLp
 tAC5howPyq8EHlmqttjYoDLWeS9ffTFOcu3qaLUvwGJgaZwEsTtmnUSX1n+aDX8OG6S81lo3K7l
 3y+k8bEXRxGuhNdEd3FrhKrLWqEGveWsaFs2hRxL9btjIhM8DEXqkTq4gvkFkYE4pUhAd5pYp3z
 VCLH4lp6FJfXwMiPqCw==
X-Authority-Analysis: v=2.4 cv=L8gtheT8 c=1 sm=1 tr=0 ts=6a6ccb5b cx=c_pps
 a=aEMvDn7b7fLO9/K+yIGWpA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=VwQbUJbxAAAA:8 a=GNw4gW6I4cuZkhLfVx8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDEyNCBTYWx0ZWRfX+qghvt8J+oPV
 5ouO9AQVaPvDSZugCB4gvyKdnT9FTOVKt4qzC9rJsiI2viRbPUBf1t2m4VqllHVgQDtv9S80RyO
 y202mhzi+zEsnHATACBXZq8XTrVnrV0=
X-Proofpoint-Spam-Reason: safe

On 31/07/2026 2:02 pm, Riccardo Squarcialupi wrote:
> Hello,
> 
> I'm running Linux on a Samsung Galaxy Book6 Pro (model NP944XJG-KG4IT,
> Core Ultra 7 356H / Panther Lake). The two onboard CS35L57 speaker amps
> come up with no tuning firmware, so they run the fallback path with no
> calibration and no excursion protection:
> 
> 	cs35l56 sdw:0:1:01fa:3557:01: Cirrus Logic CS35L57 Rev B2 OTP1 fw:4.2.1 (patched=0)
> 	cs35l56 sdw:0:1:01fa:3557:01: FIRMWARE_MISSING
> 	cs35l56 sdw:0:1:01fa:3557:01: Calibration disabled due to missing firmware controls
> 
> Details:
> - System subsystem ID: 144dc910 (Subsystem: Samsung Electronics Co Ltd
>    Device [144d:c910], from lspci -vnn -s 00:1f.3)
> - Two CS35L57 Rev B2 amps on SoundWire, at sdw:0:1 and sdw:0:2
> - Filenames the driver requests and does not find in linux-firmware:
> 	cirrus/cs35l57-b2-dsp1-misc-144dc910.wmfw
> 	cirrus/cs35l57-b2-dsp1-misc-144dc910-l1u0.bin
> 	cirrus/cs35l57-b2-dsp1-misc-144dc910-l2u1.bin
> 
> I found a matching Windows driver package for this laptop (Samsung's
> audio driver, containing the tuning files for this exact SSID) and
> confirmed locally that installing those files under the above names
> fixes calibration - both amps now report "Calibration applied". So the
> correct tuning data exists and matches this SSID, it's just not in
> linux-firmware.
> 
> Since these files are OEM-specific and I don't hold the licensing
> rights to redistribute them, I understand I can't submit them myself.
> Could Cirrus reach out to Samsung for permission to publish the
> tuning firmware for SSID 144dc910 (Galaxy Book6 Pro NP944XJG) to
> linux-firmware, the way it's been done for other OEM laptops in the
> cirrus/ directory?
> 
> Happy to provide more diagnostics (full dmesg, ACPI tables, etc.) if
> useful.
> 
> Thanks,
> Riccardo Squarcialupi
> 

Hi,

Sorry about the delay in publishing this firmware.
It's done now and merged into upstream linux-firmware:

https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=bb7c02330655a5025a9bf0eb3741d49c6407b9e0
