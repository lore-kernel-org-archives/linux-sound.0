Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B05331A5C;
	Wed, 11 Feb 2026 10:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770806520; cv=fail; b=BhOPP+j5NIdCfZFink8Ly+mRkvr96HT7FO3i05QWR28QxRxX/XqtxX40tTFaLca5tI26sE8Nqt0ugPf8IOBziURM/wzBS1LP0yBa0kcpT9XD7gozesR0DVgNs14gqQfBSz8Mff5Ol98xYs9PQm/Lro3iMKducYOUnUJJutWTCe0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770806520; c=relaxed/simple;
	bh=QZDnafhbFwI2Fm06B7gDHTEW5VyirSU3P1DK+7Hp3j0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e1wBAWK8OIQ+fp2VHXmdNPhAIyx4RouGo671eQZLcOKlcO0oR98TPwEBmga1mvwUMZB6/tlC5S/hzVj+Jve5GkLefZKkxn8MkRhmIz9xViRJA0bs41KPhHPPU352WD5DYVvlMUNiEMLXvJEba0bxq57VwKap5vj8QwJWq2/mbOc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=IvZeRyPb; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=REQLXs6j; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="IvZeRyPb";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="REQLXs6j"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61B4upmq1296817;
	Wed, 11 Feb 2026 04:41:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=jZRrF/o+Ow89blH1qRTEvspyV4IWv59+1QXzZ3Bf3R0=; b=
	IvZeRyPbGE3KnQX6S+EeGnRSEsssUReBOrMaxm0/9l+4KFH+qVrzIt/UBLDz4xgt
	DcimFc13UME6IrxfN9WtS11siumPoQfBZ4gdG0MxJ7msXO9lwbApMjDxFJlKkZDY
	HoJygQ/6+NvDJuEGWOVlwT56ALYdByITpP/KsZTTCdC6e9BJriDgGYbuzGusicwa
	CiHVnSO7+yCO10PhpxQdmj7Hzj5w/bJtOXcWtWqoe7JaT9ra+xw1DcEIPkBp/HvR
	wY9x5BiPPTojQBkxsuH0pQWvjQoI7ZiSLrRPqTv11PgjErdW2wcqznstAUIds1mT
	T0MXp2500Xh90f95J5Zghw==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022077.outbound.protection.outlook.com [52.101.53.77])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4c62pk4kby-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Feb 2026 04:41:35 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZqheLw/2BtTaXpy1Y7p9B/bpAcYO7pY1Wibxa/2449dItT0O84OZHtUI1aRuQMFh8gXVp/4GJkQiL17jk5QDeqDvfpxKRH30tNWKGqA5Ocw0ydxFNoRsRdd6gZijqVM1xRAsWkAoqb6kRzCaDViruKCn7Z+I+BEaLWLF2pli4N3mXC7bur/qaqtOD4G1n+GoU0g7yja70+lQov05Eg0hPhptCGpMSvRZmnhhruG9JtXI9Fu5W9vu4mYj4uq6eNA/XaYtGtBhf/uKfoJEmiuhUYaT/6Vi5sPxNIjMVeOxthUsrB2NCyjCWN1Zi5vCGJvMDC9s8FgRfsENmbQvO5KHyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jZRrF/o+Ow89blH1qRTEvspyV4IWv59+1QXzZ3Bf3R0=;
 b=WJyAX95gUesLVKRsFxw5XSr1QBvBAuIV1EKQ0Lhtl5zwFDm5oUFiEykbSq+lU/NRZL3WuLJC6d0N7ifxXaxfGw9KM4m1+KA7ybNTjkLqjMD64q4JuCQCv0JsHxbp056oY2aKLC0FU0tCdDrgtA0Cpxe4Z30kiSV0JuqiYTSdfbUD8kryRZbYKZyg9Vt+SyGdO91t0tlsLmyj6ShfyjyEIEscWMU5qu4TebOsbxp/PWKYfTGsaM6y99CGKvse7jrXog65NN6Gk3GGPXSjUl+UVmjzmUWA5lwKULF5xMzJLsLxyGLAqqrrmj9K2grVhT7r/gYs2aN1fcNdOyp6wvlPgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=gmail.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jZRrF/o+Ow89blH1qRTEvspyV4IWv59+1QXzZ3Bf3R0=;
 b=REQLXs6jgGZpyKhWmCGbxJ4xxKutj1FFBZZWtN+VPVYl+GZ+5EEaSDxUmjd3c680vXqCp8A2pnhAPz3bvYcsubbfQhh7wCbRjfEpSJ8qtI49iHIAjlC3qJK374iKvU/VHNZ/tvRapBj2E9a+o6/ddlwZIfRbZVX93AUUokelND8=
Received: from BL0PR05CA0021.namprd05.prod.outlook.com (2603:10b6:208:91::31)
 by IA3PR19MB8664.namprd19.prod.outlook.com (2603:10b6:208:520::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 10:41:32 +0000
Received: from BL6PEPF0001AB76.namprd02.prod.outlook.com
 (2603:10b6:208:91:cafe::85) by BL0PR05CA0021.outlook.office365.com
 (2603:10b6:208:91::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.10 via Frontend Transport; Wed,
 11 Feb 2026 10:41:29 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF0001AB76.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8
 via Frontend Transport; Wed, 11 Feb 2026 10:41:31 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id DDD2D40654A;
	Wed, 11 Feb 2026 10:41:30 +0000 (UTC)
Received: from [198.90.208.24] (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id CA990820259;
	Wed, 11 Feb 2026 10:41:30 +0000 (UTC)
Message-ID: <286c2158-5f53-42a2-a04d-e9bed3e7acf0@opensource.cirrus.com>
Date: Wed, 11 Feb 2026 10:41:30 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 RESEND] SoundWire: Allow Prepare command for
 Simplified_CP_SM
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        "Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>,
        "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>
Cc: "broonie@kernel.org" <broonie@kernel.org>,
        "ckeepax@opensource.cirrus.com" <ckeepax@opensource.cirrus.com>,
        "shumingf@realtek.com" <shumingf@realtek.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "ranjani.sridharan@linux.intel.com" <ranjani.sridharan@linux.intel.com>,
        "cezary.rojewski@intel.com" <cezary.rojewski@intel.com>,
        "peter.ujfalusi@linux.intel.com" <peter.ujfalusi@linux.intel.com>,
        "kai.vehmanen@linux.intel.com" <kai.vehmanen@linux.intel.com>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        "Ding, Shenghao"
 <shenghao-ding@ti.com>,
        "Xu, Baojun" <baojun.xu@ti.com>, "Kasargod, Sandeep" <sandeepk@ti.com>
References: <20260209070905.10749-1-niranjan.hy@ti.com>
 <97872c17-73c9-4484-9f8e-373ed9a59a25@linux.dev>
 <87773927e37c4d70862c5f047431c7b0@ti.com>
 <e9e27355-a3d1-4ae2-aa6a-da47c6bced1f@linux.dev>
 <5066fa12-3ac1-4619-8fbe-62d61f9d446c@opensource.cirrus.com>
 <5c8a4d68-0f43-40d1-971f-7d1f4f55eb5c@linux.dev>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <5c8a4d68-0f43-40d1-971f-7d1f4f55eb5c@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB76:EE_|IA3PR19MB8664:EE_
X-MS-Office365-Filtering-Correlation-Id: 260dafe8-4ea1-4615-f9f0-08de695a1ee3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|376014|36860700013|7416014|54012099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ajhNRkc4Qm9JT2RvN01jb2szSk1MMTNwTzZXZFJVM1ZwVWhaYWMya3Ewcm03?=
 =?utf-8?B?Z1d1cnkxQWdCU2NBVlpUWkJ4M2U1RTFxeCthM2toWnNTMW82WDB0M2wraHZj?=
 =?utf-8?B?Q3pPSzM2cVArNVNTUlFvNWpoMWhEaWt2TXdicjVlTDlYM2hzVGFCWWdtaWo3?=
 =?utf-8?B?M21oMEEwbkVRdDErWG9LVHJaRlAwYVlYWkFoMk5IYUpQdDYxY0UxQ0Zld0RS?=
 =?utf-8?B?VTBUa0daK2hlR1ZtbS9xWEhyOGZJUVZ3bGJPSUQwc0NWdkx1TWhMWjB3MHI5?=
 =?utf-8?B?WGFZRDhLMHFMdWZjZTFYMzFCcXJnWTdSaFFEb25mY3c3bXlhc2Q0YjBxQkhv?=
 =?utf-8?B?SFRGNmFVOHgzV3ozTS9BQzBPS0FJM0hxQ1RoSFlUVjRwajI1OS9IaFNrcWNs?=
 =?utf-8?B?Z2lKQmF6TlNXdG1WeGplbVJUV3Z0WExjTC9Tdmw5VFN3dFFyMENzbkFCeDVa?=
 =?utf-8?B?RVM3QnI2SHdpbWV4MVdlTElQR2w4ZlA0YmtGc3RMek85cjdBQXhudEhNSnhx?=
 =?utf-8?B?TUVjdWlieUxiYk5GbVdURUUzMGJoS0ZUeEpUNmJUMWZ4SUtrclJTem5hbElY?=
 =?utf-8?B?eEZhMDRKODJBSkl3Rk50dWd1b3pqZndyWGZ5eVNvNFBnd3hrdWtjNXNMMDVM?=
 =?utf-8?B?ZlhKTEI3Mk5sS0FnT1hjRGV2NVRwUWNlbGdDdnFWZ2ZsN21La2RZU0tIWkl0?=
 =?utf-8?B?NnRBaWlGUG9odk8yVkxpemNlWFlDQ0N0dzVleENTbTRuNWttL2FEck5vYlFH?=
 =?utf-8?B?Sys0V0pwUVJObzludm1oS0VZdlBTNDhUWTJIT0lqUEszdThwQmJ5NHFGaWR1?=
 =?utf-8?B?cXlRNjZNRExZdWlsTXhBRFVEQmZFYVF4UkpsT1hEcFpvVDVSaWJvL0N1YVo1?=
 =?utf-8?B?Ny9yWU5xMlJGcVk3eGcwS28yZHMvODY3SXN0ekNlMlZZTk00aHg0NGk5eW9E?=
 =?utf-8?B?YW03ZHR1aEpIRi9DZEV6RDN1VmZVL3FuNGpYVDJJVGt6RllOKzNIeUhvRmFT?=
 =?utf-8?B?OG4yRjdpL2VKcFZjWDBqajVqRWU0OEgzTWo4YjltcXhqYTNCcll2c0NpREVw?=
 =?utf-8?B?MXFjZ1EwNm55a3FQdnBTVU45MWUrODJVS0taOEpCZ0NrdlNGQzNGWnNucEFV?=
 =?utf-8?B?ZFJrVk53M1F4QzJHeFJaeVFENTRod1FKWFFFQjRiem9zYzQvK0Nhb1d0WVJR?=
 =?utf-8?B?ZVVlQ0dRMFFmK0VkVnpIUUp2WVJWRGUxS1Q5QWtPYU9Da01SRkxDR3FoUzRT?=
 =?utf-8?B?M055WGlXMklQT0QrUzk3bElNSnlQb2tMVUdxQ2pJcG9pQlZ3bklybHV2ZmNt?=
 =?utf-8?B?dDdSRy9SZ0xSY1lFU1ZWd3ZWOVJRbXNUaWhTck5oK1JJOFdGUTA3ZmEzbGx4?=
 =?utf-8?B?SFFNNXNmVm90Q0JLQUxDcUwrV3ozRTZ6ejcxRGN2b1pwRXZlazZPL1VqcWdr?=
 =?utf-8?B?UXZoQTFnaDl3NFY0ZTRpUWgxT3pFaS9odjArMTFOdE1ueUhhTjkzQnFZbENn?=
 =?utf-8?B?eHFjTHNWWVc5eU5YSkc5Y1AyS01Bd2NRaU9JVUMwaHdOMTZSMHNpTW5teGZC?=
 =?utf-8?B?cUs2S3N3K0F4eVdaUTltNjhJSDBoVDNnakVsbGZCSjdsa1RTdEg5N3BRcHVh?=
 =?utf-8?B?dURTUnR4UURRWjhOZk8yUTlpM2FoVlN5ZjFPU293OEhyUmNoazNIamYrV2Rx?=
 =?utf-8?B?K0ZKZ0twNWpsajloSUlyelR5MXJzRXhmakxkKzB6T3doMHJvQTQ2MU1zNHMr?=
 =?utf-8?B?TE5NQVVKM1EzdEdDVFNhYlVoekhveGc2dmV4bkJzU0lWVHRoeHBVcWxreXln?=
 =?utf-8?B?RnBuZDdLVHF1NEY3cmpnMXRObFhKNW9ZSlFBYWxnL0h6eHpuZ1dPbXM4VUR4?=
 =?utf-8?B?VEpHTWw0Mmp6VnNMNXcxSWlyMFlFQ3MyTjUzTCtxMlRnLzRJNnJVTktNRjRm?=
 =?utf-8?B?Z29YNUc4RXJhYkoySEZBa3BhYk1DWXAxVituUEQ0cnVCd201MHhiYXJIOEt2?=
 =?utf-8?B?c3R5cTNqNG1MQnRwTm9Ja2x5K2k5cWx1cXh2UTZub3BEWnRkcGJsRkxPN1g0?=
 =?utf-8?B?RHc2dUw3UDA2Vzd0SUplMXVmREtBSmJYOVB6bUdmZmNoa0xGMnNzeVNieGp5?=
 =?utf-8?B?TGRhSzdQRFU5UVRuekFQKzVOdGZLSWZGYVMyRFo2aWtPc1RMVUZROThJZGJy?=
 =?utf-8?Q?TRMPwbG6HyhGkcKw9rWcY5Y=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(376014)(36860700013)(7416014)(54012099003)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	GEuzL6RQQyO7a93OQvwFmyJG6nKR6vauRqi4UfmkswPR9nTYYwctIxkedloNzhAudSj0vYOYlswzUI/ZXwrTh9lErtPHwAfrs0Hje4C8/edXBKPLk/bmwfEojopQfLBA0SgT7nxJKNM4hWzM6hm4LlQdAU6wXw55A2Bgc66kzn+1VozOqRsvJFXmKG9Pm74rPh3I6SaUhDd2+pf8s5PQ7EsU5UOFdZgXhv634o8gWFdmWIM1YDckWOzEqXdK0Vg6L9ognwa9DP4WOif1wk7KnUO026IjHV7KvOwCHU7CT6dRwEKjOtqZwOGGBqDdGXxW85/dz1YtalE/spIx14vJlPRL6RQSJIb38ZxlHzzvhy+idSa1AAXoSYPXcm04CN6VSA3oBv9gl2tmt/kSdg8oRRRfk4jV9RF2HL6nuvWNwoMDoALfh2FpWvmMHAWdsNJv
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 10:41:31.7358
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 260dafe8-4ea1-4615-f9f0-08de695a1ee3
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF0001AB76.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR19MB8664
X-Authority-Analysis: v=2.4 cv=YeOwJgRf c=1 sm=1 tr=0 ts=698c5cdf cx=c_pps
 a=xYKeb6kGun7gsC6lRUWGfA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=NEAV23lmAAAA:8 a=yd2tc_xMkHaqBMvAfikA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: hCCI-4_RbJdjfAw0N67wbdygD7pgeELU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDA4NyBTYWx0ZWRfXx1DDuQoZ27is
 BR68VejxlbmOcHHpSS83MTHCnfjufKU72uAk8R6KRhxPF+nAC43ArlHBTQHQ7b/omy3WhBtQMI9
 s3lQOu2qg3vf36OJd++R/5aEdSSVR116tSAzFuBwdRdMkfyGRnbqHXedzMK+WLPhTpp49uXqyDc
 YjqFwfIBma96PopB12EHs52C+f/CqUqGMOn3NlcHupW3JTGSQ3tyVT/41vMgmneQgMSiOzoGS0d
 g2G1SPYJb1RmDAU93b1Wodlq2CXDIiRfvBgfajHDlcJWpw7pPeDg2+3q8kat9Y4L1tC4unnhnOp
 CVs305WzkWN/bWMVWbkc7Ar2LYN8QE4Y4p6nr89tyJGJDNmHsWkUNF8d8rzQzn1Y0P2wO39vRUD
 VL6Msana/QcRS2cPX47j8LYFEDvR235x2LPGnHNy4qGT+Lsk9Gjbw8k5bbOVDbiMO3N69seRUhy
 trXmiU8lNXyN8j87J8g==
X-Proofpoint-GUID: hCCI-4_RbJdjfAw0N67wbdygD7pgeELU
X-Proofpoint-Spam-Reason: safe

On 10/02/2026 8:28 pm, Pierre-Louis Bossart wrote:
> On 2/10/26 18:29, Richard Fitzgerald wrote:
>> On 10/02/2026 5:04 pm, Pierre-Louis Bossart wrote:
>>> On 2/10/26 12:08, Holalu Yogendra, Niranjan wrote:
>>>>> On 2/9/26 20:13, Pierre-Louis Bossart <pierre-louis.bossart@linux.dev> wrote:
>>>>> Subject: Re: [PATCH v1 RESEND] SoundWire: Allow Prepare
>>>>> command for Simplified_CP_SM
>>>>>
>>>>> On 2/9/26 08: 09, Niranjan H Y wrote:
>>>>>> In TI device implementations, we've found that some devices with
>>>>>> Simplified_CP_SM still benefit from receiving the Prepare command.
>>>>> It would also be good to clarify when the device is actually prepared after the
>>>>> bits are set, if the implementation cannot guarantee that the prepared status is
>>>>> reached by the end of the frame where the write occurs, then it's definitively
>>>>> NOT a Simplified_CP_SM.
>>>>>
>>>>> What happens is the simple_ch_prep_sm bit is not set for those devices, and
>>>>> the regular state machine is used instead? Is anything broken?
>>>>
>>>> We need to use the same BIOS between Windows and Linux. The BIOS configures
>>>> the device as Simplified_CP_SM. The device also expects the Prepare bits to be
>>>> set. If the device is configured as generic CP_SM, the status "Port Ready"
>>>> bits will not be updated and we end up with port prepare fail errors.
>>>
>>> Are you referring to the DPN_IntStat::PortReady bit? IOW do the errors during prepare happen because the interrupt is not generated?
>>>
>>> If that is the case, then you should be aware of the thread "soundwire: stream: Prepare ports in parallel to reduce stream start latency", where it was agreed that the use of the PortReady interrupt is broken. We do need to move to a different code where we have a polling loop on the DPN_PrepareStatus::NotFinished bits.
>>
>> I made a patch to poll for DP prepare finished, instead of using the
>> interrupt. I haven't sent that patch because this TI patch changes the
>> same function. I was waiting for this one to be merged and then I would
>> rebase onto that.
>>
>> Draft review of polled DP prepare:
>> https://github.com/thesofproject/linux/pull/5649
> 
> IMHO it makes more sense to fix first a conceptual issue, and then add whatever is needed for a specific vendor.
> The second part could be a quirk to use the regular state machine, or this additional write if that's not enough.
> 

Ok. I'll watch this thread. Let me know if you want me to send my patch
and TI rebase onto it.

If I could get some confirmation on that draft Github pull that it
doesn't break anything, that would be helpful.
