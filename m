Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F81A19CC28
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752143474; cv=fail; b=oq/XURnWAigkhLJmX5w77X0N3vwOI1W16Y+lKclyj4kj37kef6ty3xyHr1naZIxENPe8zaoyYLEW7KjZWo+ochTjDeW0z9ed4t7c1uNJY6kPblWKReCRU//nCL59ZUkZgdGylXJlGjCMNmhfY+Hxy36nwhI0gm75VA4ssBsy5iA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752143474; c=relaxed/simple;
	bh=hFuTr54AOSb5UL0jxI5zZf7FxDgibH2yQcM5TpNevhU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aHJBhTTD5hYM19vdL9EbbYtRIy156qxG36F1EG/BI8Kq0hP1zXNzzJkRET386bLqxwevQZSPggV63A504Ftrm0RMr8iFFnwqmRjk7gIoEQxQjkdghoE01bBWD9+D4sWWN8rGA8vE12ySlWRP9peMHm8he0SgFCWfNXlKrLGqCys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=BvNogM2F; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Nbc8ENrt; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="BvNogM2F";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Nbc8ENrt"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A3qd8V000690;
	Thu, 10 Jul 2025 05:30:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=6AdzsQNqw0g6OeU/2LP+2YQKaM5IJpHKuTQUdwacxv8=; b=
	BvNogM2FaUwqQGG5gDOlUy7Rza+zcIqh129hCmimleMfHZkCpjWmnzm4yw17YlFR
	SpXVCIVN38Rq9Nyd+Y2B9IqYO3juidWiAeFj7Uexs6bjlEFNgTIQV8a+dDhLAjl9
	jhvr5JWgUYZ7tVVGMCjB00LMLbHRfo1LEskJBtPMVwjd183pJgvFGKN/s8Arv7ig
	v1RZv5DypiV3mLoa8FN8oy+/vS4Iml8mhYkpjt4yySTGtDV4e0ABIpvhu5b4nKw/
	ZiWHqNtZcwSQFj6XqrT6KevmYXgD15WqjTDTXYQdZI22V8Oqeba1IxsYOUGvyxV9
	illVlMIR+q81rdZK39npYg==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2130.outbound.protection.outlook.com [40.107.237.130])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 47sev6b8dx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jul 2025 05:30:57 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dJx9wM3exeRX7jU2RQLK7z0DQFn68PO+CnGFuLSbSkDMSVpgE51T4xl/ivI3BZtU6isdszRFYng2nhqpeLCHfc5rjwPo+oBcld5ErmFA2VD/VVkIgsQmx1owxGTKAOrJroBIerp5n1ylufbaRD/PQAh2tO8cJLiXPM+NojesAYG34H2IQg89r8rs3iohc8x9DH2tw8Iy/vycQhXWniWn/+BWd1GC+0rLJwdnCztOnOQdsSeVle/0yICDEXkeRh02UtPiWBZHw7fc9ycocqwj6PlEZ9C9FSsDo60ifX3EnRrKh2n7IePEiJ7BrT+Meryt2FNbfGBXeYeyJnrBVTferg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6AdzsQNqw0g6OeU/2LP+2YQKaM5IJpHKuTQUdwacxv8=;
 b=G1gJqRhzlOUfPqW1whbAS5tQRE65PTcy+Rk1A4t8UiV1D0MMSk2kffqAvbMstCGaLA/QVL5jb5rDG1mpMPX4kJ8u+96imXKhtNFUxZkfXpw2EGhZbfxqlwZBEKLQIiiIZaSdH5KodTyL1Sz+iHnhnoQeyyyHYtdnEPK7W3o1IiAGHvvRId3iuP4XBICNKl7FZlXBgMlXcHRhbwYhEjnKnTtn/X8M7dSVY0PF7tBOVQosIm/BgCYXhe41eSMzhNXHj34XDl7U4mpU54Auc+nhXSUIDK+KTM03BBuh6a8NkS3f2S7xTGQuvn5rGDINn8qJHxU2SxCximzALGJQuuuzxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6AdzsQNqw0g6OeU/2LP+2YQKaM5IJpHKuTQUdwacxv8=;
 b=Nbc8ENrtDjG94N7zwDdIJ2jZP1oz5yQQ+wLDVaAn/WLf4g44Hyya0GEuZRBmvlw5cXcfp0Tg7ayx3xAznecuQY6fJIVZH/2UKmej+mzvMwrJrB3hgg8qbyAs2C+QxVbaATRGgQgmoMwzEGCi9k9bSL9366/7kv7G/c4SXqKi93w=
Received: from DS7PR03CA0205.namprd03.prod.outlook.com (2603:10b6:5:3b6::30)
 by DS7PR19MB7628.namprd19.prod.outlook.com (2603:10b6:8:ef::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.17; Thu, 10 Jul 2025 10:30:48 +0000
Received: from DS1PEPF0001708E.namprd03.prod.outlook.com
 (2603:10b6:5:3b6:cafe::a6) by DS7PR03CA0205.outlook.office365.com
 (2603:10b6:5:3b6::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.21 via Frontend Transport; Thu,
 10 Jul 2025 10:30:48 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS1PEPF0001708E.mail.protection.outlook.com (10.167.17.134) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.22
 via Frontend Transport; Thu, 10 Jul 2025 10:30:47 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 354EF406545;
	Thu, 10 Jul 2025 10:30:46 +0000 (UTC)
Received: from [198.90.208.24] (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 1882F82024B;
	Thu, 10 Jul 2025 10:30:46 +0000 (UTC)
Message-ID: <0d231d87-9b50-4ddb-9d31-89224d9da21b@opensource.cirrus.com>
Date: Thu, 10 Jul 2025 11:30:45 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 26/27] MAINTAINERS: Adjust to the new HD-audio driver
 paths
To: Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org
Cc: Kailang <kailang@realtek.com>,
        Kai Vehmanen
 <kai.vehmanen@linux.intel.com>,
        Cezary Rojewski <cezary.rojewski@intel.com>,
        =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
        patches@opensource.cirrus.com, Baojun Xu <baojun.xu@ti.com>,
        bo liu <bo.liu@senarytech.com>
References: <20250709160434.1859-1-tiwai@suse.de>
 <20250709160434.1859-27-tiwai@suse.de>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20250709160434.1859-27-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708E:EE_|DS7PR19MB7628:EE_
X-MS-Office365-Filtering-Correlation-Id: 63ca9f62-1614-4b58-4eb9-08ddbf9cd59a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WTA2M1R5c2Z6a3dVRnA5MXhxSkQ3aFVoWVhjV29uRmlSNXcwM0hmdkF2dWZG?=
 =?utf-8?B?T1JyK012Qk54S3ZoNERzanJTZlFWQWVCaVJuNDZoWHlTTmx0UDBENG1yUVVV?=
 =?utf-8?B?b3Y0RXY5Q004dURjaGQvZ1htOEFoODRocysrblZSQ2Q3dWs2WktnQm9xRU1t?=
 =?utf-8?B?bEhvdUxnNGdQUXpXaHBmZ3ZRdTlCOHVjNWZJL0VQTjBNelpxNjNTWU9KSXpn?=
 =?utf-8?B?bzU1R1YvV2QrbHlBMkdMM0NLeDVNZW13ME85SVk3N0lackkzSy8vdVprMTFp?=
 =?utf-8?B?NGdBdXZBWDlGaE5EZkFSaktPRTRJb2VaTnpxb2lnaER5cUo3TFpvYWRTVzF1?=
 =?utf-8?B?M1V5QnVKRng1emhxQ3krdFI2aXBBYTRpb2FuTEdmalR3ektpL1lVekovQ0Z4?=
 =?utf-8?B?emI2eVVWanBQa0EwYkdwcGdqSnNNNy9qL29Ua2ljUm91N0FwemxtWDh4eXpu?=
 =?utf-8?B?NUNDTVY4WDN2VmQ5aW0wektCUU10Z0tGenFML24rbkQxSW8rdlNpQzRVSzRa?=
 =?utf-8?B?bHJFWnVoV21zYnJJUC9zcGxmWlo4SkJOc0dzVm14MFgwZFhTVmtYSTlKbTJT?=
 =?utf-8?B?eW1jOFEzMjluS2hRMWg5N1oyakQzNnFuUnRSaEFMakJPeG1DemxDTmhFL2d6?=
 =?utf-8?B?MXVXa3Q2UVM3MENIVkRqNHBybm01U1dhdFFoL1dzeURIOTNBek9NeG04RUV6?=
 =?utf-8?B?bys4aTI1VGo1bEZ6LzE0V2F1SWxUbFQrR0xqWE04K1pVRTR5M3EvL3dsMisr?=
 =?utf-8?B?cmFXZXFVMXNoY0tvalNuZDJtMWloRldGR0tidWNnclBqVkh4enpjMW1uK1Zk?=
 =?utf-8?B?eGVQZTJCZHZFVWQ3RDJyWjFVdzh5QUhFZGJMUVVyZWd4UFVUVVh5R1lLVG1Y?=
 =?utf-8?B?TjludjJld3IxUUhqRnlZVUhQeTVSTVdDakZKVkMzUzhYVnFLUVRRSmoxbkwx?=
 =?utf-8?B?TmdJTnN3SmN2cldqcE9WNlVXMWkzdFRlZ2EyVWZPNXV4TDU1RlJzelhNQkpz?=
 =?utf-8?B?YU9aTlJPTS9td1czTTRJWlRiNXVtVXFJbXU5cXUwL2xCVkU2M1g5UVNZaHl4?=
 =?utf-8?B?RXA4YVd2Ynlja2NRV0hkUjBsaXFhcGpoWGoxNHV1QUhiL3VWNW9FMVVBYmRD?=
 =?utf-8?B?c0UzS2gveXpXMUNHVVFZa0ZCdXptRTNNNTJ0SE1aTmhMYUJyVWlFNHk4RktV?=
 =?utf-8?B?MnY0Wi9XanVkRnFFMzJvOWllYmRoNlkvQ2d6S1lWalYzMnZ2QUoyQWRNRXgx?=
 =?utf-8?B?dTh3N3cwZDVhcnlhZkVaa3BIaFZLTEdxVTBiQUJGRFNmd0lFS2RYNFhBd0tW?=
 =?utf-8?B?VUlybSt1MjdET2dvM256VUxqd1Y5Mm8xMzZUYzl4RitQMU5OenExN3UvaGFV?=
 =?utf-8?B?SWFnY1l3Q1dGZ0lvNXhqRTJLQU41bGE5ZFBDMGVXWG40b3V1UkM3STBEYjcy?=
 =?utf-8?B?YjVpaVVPZnBoZStDSXZMSkJINzE2WmdjNjVBam9teDJ2UW9HTHczWldhelBZ?=
 =?utf-8?B?RnlYeWc4eTFRMVMxVkJ0OEdqTU56MUlQVGc0SlVDY1lUZThQeWZNREtXeGtl?=
 =?utf-8?B?SEt4OHM1QUs3ZkthVlZBbUY5azBJVzF5YVZjbTIwQUQwQUQ4MDhKSHVmRkpx?=
 =?utf-8?B?N0Z6SzQ0R2toTVI5ZHkxajNJYllNcGkrYzNGWGZyTExTUVhTM3FYU0FJay9a?=
 =?utf-8?B?V3pRZ1grRXJ4TXN1d045UWs3MjJvT1NjMFk5eWd4cXBBSWxpZGw3Y3BlOHRG?=
 =?utf-8?B?TUUzT1lGT3hxNjVYZVoxVngrTm9URUJtYnNWcVJGU045QVpCWkFjQ1E3UGY4?=
 =?utf-8?B?L2FnN1ArKzYwQXAzWlJwR2lFanR1eXUxd3dSRVJGanE2alBsRlpJM3NGQzd2?=
 =?utf-8?B?NnNiY0ZCbSt1REhrTm1IekhhS3FUUVJZdWdwRXZKTmxTSTU4WHRlUkpBcisz?=
 =?utf-8?B?aThWQUNybWJ6TEJSNGpCL3l5ekVDNWVvWWFEWS9YQ3h2RFZ1WFNnaXZYd0JB?=
 =?utf-8?B?UFd0Q1ExR0M3Q2twTkJjaUk4R2xHaTVFQkxUampabVBDNFVTNmlnckVNcDIv?=
 =?utf-8?Q?Cz/31a?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 10:30:47.3133
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63ca9f62-1614-4b58-4eb9-08ddbf9cd59a
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001708E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR19MB7628
X-Authority-Analysis: v=2.4 cv=Zb8dNtVA c=1 sm=1 tr=0 ts=686f9661 cx=c_pps a=mO23JJOOhg5+WPHX4vEGUQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=RWc_ulEos4gA:10 a=OB8GbAdj7C7TKKS_8AkA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDA5MCBTYWx0ZWRfX2FVGbjZwZ8+e nKolZzTYeKM7T7IS5rMFUtMkxrJBeyzDgScXZOHO7nwM0g64cxIMbsWXduEiST8IAbOZPuPABFX eS3g4R7rLqSeO/XTd3hKmnfxw4XfvSBn1fPwNYgJudgPzd3k6p+Ub65Hr31arARUEGgB8MLx0im
 e7cWupgS3MMo8B/iF8hSXWAMN0TOxzcINwK7NJj6GRjmaft+IapFjNVwsZQ7bE0Xfyc4J4V9+Gp VkpwEA2Ua0haAcZW6q5KjgNKdp4clTipR9gmFwr+Z/m2CwxjvDxT3OaEcZTX3Wc7NaKgB42jbM6 YC5Ws+Z1lQDYjyZNXZLELRUFPnWB2TTN3I29Zlw2jzRED3PbEKWG/wi6Z5AavgTsqzwbYZe0Irc
 j992mRWFa3u/2uDOI0vXJDpPJdoZyC3IZaRVa4Pr1Mo7xV8XJxCEVmeQEZzMzsIpjBlNOFVW
X-Proofpoint-ORIG-GUID: 5Sh8eH0HXBGALzN-iqjBQK-3C8zp3__9
X-Proofpoint-GUID: 5Sh8eH0HXBGALzN-iqjBQK-3C8zp3__9
X-Proofpoint-Spam-Reason: safe

On 09/07/2025 5:04 pm, Takashi Iwai wrote:
> The HD-audio drivers are moved under sound/hda now.
> Correct the locations.
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>   MAINTAINERS | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5bfcaf0732ed..bd86f2ad65b9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5741,9 +5741,9 @@ F:	drivers/spi/spi-cs42l43*
>   F:	include/dt-bindings/sound/cs*
>   F:	include/linux/mfd/cs42l43*
>   F:	include/sound/cs*
> -F:	sound/pci/hda/cirrus*
> -F:	sound/pci/hda/cs*
> -F:	sound/pci/hda/hda_component*
> +F:	sound/hda/codecs/cirrus*
This should be sound/hda/codecs/side-codecs/cirrus*
It's to pick up the cirrus_scodec* files.

> +F:	sound/hda/codecs/side-codecs/cs*
> +F:	sound/hda/codecs/side-codecs/hda_component*
>   F:	sound/soc/codecs/cs*

