Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367B522156B;
	Wed, 18 Feb 2026 10:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771409770; cv=fail; b=YU2YXjXVguVn1xLsKeFfg5OioKPmQ0PGeUTpu3s171VfpzL8gC8ufnp0LXYz1+pam27McBVJIe9ZQvMVAXSco7GEn+6JMf0Et3l+69Amr7OJ+UyS6QeZF+ZWYA6x+ockHJeA3QNR87VItnKCdlPaE5yXM3TtmytcBoDADkjuStc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771409770; c=relaxed/simple;
	bh=JvRHmpT/LuxQhddRe151RyQqatbhXrDOrgi7xT11Oh4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EAK1pWlZmwDjssfcjrVqs80t/Bvra9/Yc1fvKZz5MnxUwX9VQ4K5yI6lJUbeblARXO0G9H2eLmV21idPAE7s7FmMQTCUqEcH5ut3B98QZ3qn5m2gCOd+dTtZRep758uKhpNgWYtLdcfPHC/X6yhoIaRrKLGH+N5dem+pHSX8oog=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=lDSaRzPs; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Y7IAxV6m; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="lDSaRzPs";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Y7IAxV6m"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61I7198F1981812;
	Wed, 18 Feb 2026 04:14:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=Jh4Qek2tppCNT03LnmUJRQbfuxLmC97H7yYbq5IWvts=; b=
	lDSaRzPsNKXj5Ehxn0ddyqqVrmHnB1lIdggSsBi7V69k0DqXOqLA2ph9q8o6N0Qy
	/1sjQhhgOGJ0Rj1CktY9eOYofR/sxuksVKPX9quMGi/A8UGUAXXedHo9GNel7A/M
	t9IAEaa+sX5LJHJ+da9FIO+1Tf64UOVJU3TvLJj0KBevGblmghZfjvkcTBD2xknI
	c802knS79I5RRD1XqOtyE1IPtjQIjcdXNEsY3Um/Ab6acIEcEBf1C9pei3qa7vSs
	2C5Rwy9Hz/6CEVzleY7XAkqqSfzV84NiqhaEratdXPwzwyJqWZ6chR8tyUkMZOTS
	3llCRkdg3MFNzXsMPfMKyA==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11021132.outbound.protection.outlook.com [40.93.194.132])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4capbnkwdc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 18 Feb 2026 04:14:37 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zaq31M8sfWymjKTPDOz9WMi2UtD2NArZnAQkNayZYbZPseEdTTz3OJSqorvUlVEa+4Tqh/MjjASsjfr2H1HdjGFpTZiMtvO8lnp7ODpjFm6qBRWMNjxIfH8KjjeEbYNWsTHLWkDl+kHnGsbaYsz2imOPyjtxdYnzEPWsFzIelY6j58iEFPgUOGFDSyvf5Iy0ABiHS90rFnjIl92uM3T0aXNitZbchGk8syFVyBJJI6XVrDBU3TvNmPQF2jbER5EV2CckYgSsklrvL9SUnRw4LPqmFKaWZHiPj1W1BdDpnnPw7nYfynJ+i9ep5RP2XYURN7xYkf6uIegekXVe8L1e/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jh4Qek2tppCNT03LnmUJRQbfuxLmC97H7yYbq5IWvts=;
 b=OH11LZbhfAc8VME5Kj4iZ7pypFylylBdWQHKbohM5k0AwtsHwNfK3t7QV4m9DS8glL8mh/1R7E3tTJo7wP7paBRRCNky+xZCSWy6KFwVF79ksqXWDLxAUEfh+y6CDv1zp5p48whxxuzxbnbSIsRYV4y3iJhQdnX2HfKnIx6XcHlKNiZ9bfS6WG9ADf/z9/ICqZtd+huQc/liq9X5hz+72P7Yp7IL6lHv4o6vKQt0qupScPrCmhLMc0rg4E+jiMdANZiMUbEl3b/CkRhCo0i9LmdK37chTbWG4kyh9HShVhd6DECyh6HWBGuTRO3WvZnJjEZKw/wiQX7+AIDiuuxu5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jh4Qek2tppCNT03LnmUJRQbfuxLmC97H7yYbq5IWvts=;
 b=Y7IAxV6mBdPwjzkC+lT947JP1doBgyTV75ZL4oyhiFNIHmx7IOBguR+GjjkBeD13zmnOLU7i7aT+lu838dH0IYGqjigpZNWdOCZyxR08efB19MWv2AWl/RPUZIeA8/wK9Yi5eI2tRt6uJxzriAZSu51rBjykSKWTspVFfC+0+sM=
Received: from MN0P223CA0009.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:52b::7)
 by SA6PR19MB8673.namprd19.prod.outlook.com (2603:10b6:806:417::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 10:14:34 +0000
Received: from BL6PEPF0001AB52.namprd02.prod.outlook.com
 (2603:10b6:208:52b:cafe::8d) by MN0P223CA0009.outlook.office365.com
 (2603:10b6:208:52b::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.15 via Frontend Transport; Wed,
 18 Feb 2026 10:14:33 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF0001AB52.mail.protection.outlook.com (10.167.241.4) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Wed, 18 Feb 2026 10:14:32 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 3F52C406540;
	Wed, 18 Feb 2026 10:14:31 +0000 (UTC)
Received: from [198.61.69.19] (EDIN4L06LR3.ad.cirrus.com [198.61.69.19])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id B10AE820259;
	Wed, 18 Feb 2026 10:14:30 +0000 (UTC)
Message-ID: <10794ce3-a1ec-4286-868c-53abb20c3094@opensource.cirrus.com>
Date: Wed, 18 Feb 2026 10:14:40 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] soundwire: suppress expected unattach warnings during
 codec reset
To: Cole Leavitt <cole@unwrap.rs>, vkoul@kernel.org,
        yung-chuan.liao@linux.intel.com
Cc: pierre-louis.bossart@linux.dev, david.rhodes@cirrus.com,
        lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz,
        tiwai@suse.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
References: <20260217233533.4716-1-cole@unwrap.rs>
Content-Language: en-US
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20260217233533.4716-1-cole@unwrap.rs>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB52:EE_|SA6PR19MB8673:EE_
X-MS-Office365-Filtering-Correlation-Id: a5638632-68af-473e-46bb-08de6ed682a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|7416014|376014|61400799027|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eVhiMncyMVBZQ09NU29Vdmg2TmZSaDZ1UGxHT3hDbHBnOFpBTjRWTE5SRDFr?=
 =?utf-8?B?diswL1YyUzN3VEN0dmFTRXBMSzZ6Ti81QWJyS2x2M2I1Z08vVmtJb0hwRlZq?=
 =?utf-8?B?S0ptWHBxRElGblBWOENQUVZKdUdjRXcvN1ZTOTNyYVJUS2ZWaFNXa2c0VnVa?=
 =?utf-8?B?KzI0YmI1Tng4RWxkcmZmTnlhempUUlBuemtLdGhMUkZNMU4rWS9rZW5UMUox?=
 =?utf-8?B?dlkzUDFwWEhuS0ZMUzFLb1J6Z21FK3hDc1E5c1JjenlQeHZBYjYvUWZTSkZ1?=
 =?utf-8?B?OEtSeHBvQmhWT1NDTmhiUVNramZxWUozMjcxVmtkSXVvU3ZTWTlFOVZXSVVm?=
 =?utf-8?B?YUY3L0JYb2ZFRW9BcUVaeGx4Y2xGNW5tT2NEanJsejJ5OFQ1NDljOWYzVlN6?=
 =?utf-8?B?STJ3TnNXRXA0eXN2T09lTUhheURySUkvOFpidFc2UzNJa2tnYWNPZDRRUk83?=
 =?utf-8?B?Z3FXK1pGWWx1R2tsek5DTjl1VGZ0UlZSVDNHaTZscGxoQ3lxYVlFL3RZRXF1?=
 =?utf-8?B?dXhFODJJME03SDJmVFZhL0ZLVUNaYm9ZaUVBWEluN1JLMU9xSVY2V2lZVDhj?=
 =?utf-8?B?a25VQXN3MFRML214UWFNaFN6U2pEdXdkUVVzZkgvYUFqOGtiNmd4am5LYVpq?=
 =?utf-8?B?b29WOEFuczBjcEVqUkxCbG5UTjV5VTJ1K2tOeEpGdEFrazgrbGRkZjNvU0tq?=
 =?utf-8?B?aXBjZlViZTVvMGduZ2JTSEM5VDhabFZLZnJxR2dVN3JnTUhwODNmQTc3b1A2?=
 =?utf-8?B?aGxCdm43RzNLd3JaV0RzMmR1bkd2VnFzZWF6M3BtUjlFTDdlR056bXhNYTZl?=
 =?utf-8?B?ZldUV0J5MnR2cFpKWGcxZUUxSTM4NWwzRjVIU2ZiRmI1OTFsV3Z3ME1PcllG?=
 =?utf-8?B?d0hGcVA5WG9FQ2pUdldzcm5tWjczTjJSQ2ttTlVjSjFzOHp6azB0V2x3MkVh?=
 =?utf-8?B?bFpqeStWZVhRQTZMMG1FbWhDNm9mSjJvVG1mV085MTJPZFNWU3RsRjNEMVhn?=
 =?utf-8?B?am1uWjg0ZCtMVnFKV2Z5VVI3aGYvUkxBbTUxMDU0d3RENDNTWFRhL3haQ2Zw?=
 =?utf-8?B?RU5DNXVhUERtQzhBRUdVU08yajR6WUtTZUVJdFlrSHlzZDlQayt3cW44cms5?=
 =?utf-8?B?THdxQWFQVkgvOFlKQjZ5WFQ1S3pqd1ZEdThLVEtqbWxjbFlhbUVNWGRtQ2VF?=
 =?utf-8?B?bFQySnhZR2pGb0ZyRG1ZYVJNc2c3Q3p3Y1hCNUtLTnc0R0JEUmFtR2NEMzAr?=
 =?utf-8?B?WER3T3UrU0Q4Rm1ZeHpUVklCd00wS0hwUTk1bmlzYm80QjMrZGRjWWJQZG1H?=
 =?utf-8?B?M1JzUFVhYlNudEdlTXRTZy92TUllRGhMSW1lcXVzY3FmVUR5d3p6dVRLVVls?=
 =?utf-8?B?dDA1dTI4TGRlNkN6YVFsZjQ1RFZ4cC84c0NQSUh2NHN3NVdpelVMWXVNVm5m?=
 =?utf-8?B?SWg5Ukw3bHdjSmtpVVM1cU5tdzZHd3E2aDFxMHZEbHRhUzIvNkM1VWhIalRC?=
 =?utf-8?B?YTdpWUFyUExBbW1CcTNSbGU2OEdEWEVmVThiWlVEYkRxLy9wL0xHR25PRmNI?=
 =?utf-8?B?SXY5bzZkdUNzT1pKSXhtdXpiVVdNdzROUWpCdnp5bnVuNW82Zm1FOTFreExk?=
 =?utf-8?B?SllxSHRvT1piZnRYMFhYLzJBY3VkOWtGeVRMQ21RUmVRU1NXYUJsYllFWjc2?=
 =?utf-8?B?azZoVTBJR2J2Sjcrd3Z2ZkxMa3NqZmlGdks3MkNjeGdES2hVakZicHgzdGEy?=
 =?utf-8?B?cjJEUlpxTWNCb056QWNBSDZHWUVSMmJJOUhuQUE4eUFTSmdrS1U4QW1TdW0y?=
 =?utf-8?B?UmhzamQzc3R1ZW1LRkJJZ1FUMVdNVGhyM1RPVUtUdGNpV0p6S2htbkdnamZD?=
 =?utf-8?B?SlpLNTJhSzRXYW4ySWVmVWZtSmsvUUNjd09qQXZ2KzhNVHFQNWd4U0V1bmdG?=
 =?utf-8?B?UDljYnBManpvOERRc0p1VUVCNSszWE82TWtEQ3N6L29tY0VZK21iaTFtYmYw?=
 =?utf-8?B?c3pNeUZ3T2NQK2tBZGZ5Z2gxS1NkZ0RkUXNmaHM4eFBSNk5raThiQkl2OWFs?=
 =?utf-8?B?TnRsdm1yZ0MyTDViMXdNMEdlaHhVc1R6bFhiZEJjak9JSm9PL0JNQkRQY1h6?=
 =?utf-8?B?UFo3eElPdEtwVnU1YXZuVGhhbEh5RVozZ1NMeXZidTdZYUNjWHZKc0hCOVpR?=
 =?utf-8?B?QlJ5b2RJTkZmNjJBNURNek9xMi9hd2MyZTA4cFNHMTY3UVAwL1gxdzV6eUNy?=
 =?utf-8?B?YmUzaWhZUUIyV2plV1RkZ0tyZTl3PT0=?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(7416014)(376014)(61400799027)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mfHdQNnPeZxmrjCdKQLlax11z2gi9DUPy2AZMBjrD4AGiNyz/WhuUs7NptAqhWcWssvHsy7+/Nod3XzQfnBUp8jH51xitarBtr+oehMxW8oNXFWs9WTBRzwJa65ZV7KBtiT1qRkzydbYDaXnqYFBtqH2Dg8voXaCB0vrFLv+Awy7pR2NIGas87CZ5Mx+RVKyARIRtyzUrijZseoSPD6zzbOIxrvWO0ZbaETtYbMbnxirrHOLezoqA+oIWS1vv0twOmvHB8uO/gJeeKL0t444FTmRwz0ZqxS8O+7j7PiVoRbdApBjK/tEcNCmPEPQhWYUoRh9IfIEIm8lCb0ninzsTm8pYH9CUlfYmDH2RNq6GJyEQ9QTzpr4xNecB8V5hQSgwlKEVQmeYMQH4An23uR32WVdTK7wBMdnfaMsELGknSBSNnMASWWtEOlyh/7EVAVG
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 10:14:32.4797
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5638632-68af-473e-46bb-08de6ed682a1
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF0001AB52.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR19MB8673
X-Authority-Analysis: v=2.4 cv=G+QR0tk5 c=1 sm=1 tr=0 ts=6995910d cx=c_pps
 a=hMPBqNrkZiCD5Zgemr5n7Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=hyfEzSwnMbY3Cd_HcmsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDA5MCBTYWx0ZWRfX7REzPstRXiiY
 evQr8ly6CWuaXSEJfmGz9CsEtH6IV/FMHU4UV68vPgTfchkTBB81MhH/qrjlKY6jWL8izHDAjt2
 F+muc2k4c/CzbfQjlOszKwuNoYsXQ55nT+LYLyU2DRouIWiwgVyPlsuoVA2gdKyrSUBovTrffDg
 aOL7vTu4Oskr+6DPJWVGLFXXrKONxXvJYIJstE49nSybItJOLPzX61X0s9x2JGRHjf5gjtoKof6
 hTJMuuLou2H2MpNMGB0AF9WSx6p9u/QJ3SUmb2L14+o+DN4n2HQ0qwyDUb3aeT3KR/t38pwpOpO
 u4dfdZ78kzl44xPHhBEU8HSKcD0oic+9HhLznAZ5e47E46x3OBriRIJeN4PV8yDfhP2FQeZAkEY
 f/vzYcznxojJvI9hq4sgfydm8IXkzmCNp+xNT7JCtgfxN6G9tcplRbMvMLlaUmhMWojBvWZcwnl
 u2HIoRMDfHmw7IDFvuQ==
X-Proofpoint-GUID: DS6VqFGrz-OFI2cJtXogwlGMjxYx6UHD
X-Proofpoint-ORIG-GUID: DS6VqFGrz-OFI2cJtXogwlGMjxYx6UHD
X-Proofpoint-Spam-Reason: safe

On 17/2/26 23:35, Cole Leavitt wrote:
> On systems with CS35L56 SoundWire codecs (e.g. Lenovo ThinkPad P16
> Gen3), every boot produces misleading dev_warn() messages:
> 
>    cs35l56 sdw:0:2:01fa:3556:01:0: Slave 2 state check1: UNATTACHED, status was 1
>    cs35l56 sdw:0:2:01fa:3556:01:1: Slave 1 state check1: UNATTACHED, status was 1
>

Is this really a problem?
They are warns, not errors. Nothing in that message says that this is
an error, or that it's unexpected. The message is accurate.

> These fire when the CS35L56 driver triggers a system reset after
> firmware download, which physically detaches the codec from the bus.
> This is expected and handled gracefully -- the driver waits for
> re-enumeration and the codec recovers within milliseconds.
> 
> The warnings were added in commit d1b328557058 ("soundwire: bus: add
> dev_warn() messages to track UNATTACHED devices") to debug genuine
> attachment failures. They remain valuable for unexpected detachments,
> but firing on every boot for normal codec operation degrades their
> diagnostic value.
> 
> This series adds a simple boolean flag (unattach_pending) to struct
> sdw_slave that codec drivers can set before triggering an expected
> detach. When set, the bus layer emits dev_dbg() instead of dev_warn()
> and auto-clears the flag.
> 
> Note: There is also a separate set of UNATTACHED warnings during
> initial multi-device enumeration, caused by the known PING frame race
> documented in cadence_master.c. That is a different problem with
> different constraints and is not addressed here.
> 
> Cole Leavitt (2):
>    soundwire: bus: downgrade expected unattach warnings to dev_dbg
>    ASoC: cs35l56: set unattach_pending before SoundWire system reset
> 
>   drivers/soundwire/bus.c       | 9 +++++++--
>   include/linux/soundwire/sdw.h | 1 +
>   sound/soc/codecs/cs35l56.c    | 4 ++++
>   3 files changed, 12 insertions(+), 2 deletions(-)
> 

