Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012066.outbound.protection.outlook.com [40.107.200.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D213E39734D;
	Thu, 14 May 2026 23:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778802040; cv=fail; b=gTHhSJrqrUfw1lcU0S3i/jaglizwTcG2P2r5RVoMsoywsRYlv7ZXw/zBn9P+ELU5v/F0N7WHhB0EuA5JmFQimdttp6Dgy3ocLCWh1CLBN67eaZ6uuc1Z1pRzOScntWoKDyKOSgnUaEVyECcyYBdJ3mtlr8juYCy88h319Kz8kCY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778802040; c=relaxed/simple;
	bh=jyBvBzNEVejuxh+4PQyjCaed+MJE3EFRfNoFgjMsqiQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=dO6JbSxPHR0UmmjWMUTMoEX1MO2JEK1fk5FLJ5dUFf6aYlimh/Jvccmyv6thxAv4+iYjEbPzWzhoALs+Zycux4zuO6XHBVgl3AxoN9aWUWHdrJCkAzKxe1c8R8tZenfs16GYczFOWgtBRnQuqFuhUzUF9NyHOKLM3jGIeUfxBiE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=NWohmdOK; arc=fail smtp.client-ip=40.107.200.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="NWohmdOK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xVk5lQGov4zDkaHAXAoQYiVGG6M8bqRSvItwWY0CQ5EO79TruMCfwMtKoEOEWoUAqWrr04WhVoTbkv1U6FiECoLTiPbFQ/6/iE5he9Tts+3SWkibCN9/qegxvRKxb1g9JF61SU8C96h0yuAYyDA0hvsVR2/7ADtcE1XXGF4f75/D5G+gkBdZ/CayO1k8oDfk+0tQ2Ol9PQhgXGbWIY4r5K2QTX9ClMHw84MlZ3ouPMUcTDuY4BszCWesg5ITCYKFn8M4deEt4Tg2XjxFZHCw0gBy3sFsZLQIm7WOmcme36nFzlOkv5Amko1IMWkRdpDEb04hdYjSx8smgXMP2C20kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AerdpFSCaHSqoFUeqBr1uhl/O4XXQwGX60k9NwsPnEY=;
 b=JlB3bQD1Kwvqg6kbiRvO244yXwMe6Yr0SIaZzgz/T4p0YL7HOe799PkVra0p+CcwJb4KEpUgs80D7wJELEbtrS3w+GIIYw2pFvmeg81NXNMPXhaZqr+oMqCQhy67hQcyOZXgc6ELLi4C4of/s5r91ARKDvqUJu57EBpFsEMSlEK+I5n/bKzafA2Qhs4tL332DlW1hR9hBXPNIv8m517QPyrJqwQ/vCYpywRdGjgSIQj9mSksb0IVblC3bVxrHt45gjSygicyBw8hdo+VQvnUh2yEmvvgEHQKXwBnHqABuG6yt48xs3kIGkz6/CfmfrzqaZ8OUy3RvrWu+FOHTBKtrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AerdpFSCaHSqoFUeqBr1uhl/O4XXQwGX60k9NwsPnEY=;
 b=NWohmdOKSzENUXd75kA3FiByc5g9iLvvBsaWseAXxIMsXMpagXxyvbNIHkOBf+V5IjkxMkI0Ea1JUjw21DS+G4E78zh3s60bv8H/icuH+BvVavUtWXlbiqoVfSbnwgxCyqABSWlX0Eyd7EkI6aUz+OfsgE9hykp2xWtjz1y7bKM=
Received: from PH7P220CA0135.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:327::35)
 by LV8PR10MB7774.namprd10.prod.outlook.com (2603:10b6:408:1e8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 23:40:34 +0000
Received: from SJ1PEPF000023DA.namprd21.prod.outlook.com
 (2603:10b6:510:327:cafe::77) by PH7P220CA0135.outlook.office365.com
 (2603:10b6:510:327::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.19 via Frontend Transport; Thu, 14
 May 2026 23:40:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF000023DA.mail.protection.outlook.com (10.167.244.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.3 via Frontend Transport; Thu, 14 May 2026 23:40:33 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 14 May
 2026 18:40:32 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 14 May
 2026 18:40:31 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 14 May 2026 18:40:31 -0500
Received: from [10.60.31.46] (ltpf5gwk6l.dhcp.ti.com [10.60.31.46])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64ENeVYe3223552;
	Thu, 14 May 2026 18:40:31 -0500
Message-ID: <a430e7f5-232d-4c7d-83c9-c120fe682424@ti.com>
Date: Thu, 14 May 2026 18:40:31 -0500
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] ASoC: simple-card-utils: support system-clock-id DT
 property
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20260514212802.3569643-1-sen@ti.com>
 <87tss9wqhx.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: "Wang, Sen" <sen@ti.com>
In-Reply-To: <87tss9wqhx.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023DA:EE_|LV8PR10MB7774:EE_
X-MS-Office365-Filtering-Correlation-Id: bf71014f-4f7e-4040-7bd8-08deb2123164
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|56012099003|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	EOZLSyf+uEz2ELRzcVLgZu/Xn7CytdJ0FGwN/jV0IbuySBlRosCqFAM59VcfO+ATeZ4PbRzNbAqgZK6gWXqAcxhrjMdbejE/9Zy3/VuRGcSHRqvX1tQI3whdYqDtkt4yRPdVXwNJy71/pyZe6oPykoDb31T/O8QorH0VBvvInP8M5UZ7ud9wnJ45UacorH7OksYgPIETeJaBE3rLsdt+FPm6vH8kMME7knJweQiP0htBbVI7UFbMgFkxCF/29P446LqGL1lO/B8sr+1LQNGzJb9JKcMReBXFHaqCHSLyOLiY0/dDiVkN+c5/xplY5Ej1iv7Q2jyN2SNHaMR0DuAnQtugJQiRPmMY4J01jQnEe9KjIGpu/W9JvkuyB4BkzhybjWUbYgqQ1LzFmYs0o3ad4hSdTumqO7astLsSvlj+QNRDTxdd90Yfbdpl3Ol3srizC44t8mg9u05iUguGAvmLxL/b8i/W2qLdDcISlPVWRzbqCLNqvJkPoLH0sf7H2vTll0x/yTV/5cY+rQPp9/V6ieqD6c7DPCk+wsDTlkEP0Riuk6pcXg6eLVckPfJriYNzSE/zo3WHBdktVF3cXxksXxwJJU6pPijazpEJjledoi+97GHzgcSz6IuLZ7A1Op4zi80h7hFV3BD4SWjDgXoUoJxv1p+Lkk4ZHvmdpZwxGRm+T3Ol+zYSd3XXwZfjYwzi
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(56012099003)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	H0yOyMOCeyYxjUWve/kCp0peNyp0g7Ao/+XqXErjcrnUlk84gi6oFn45zKz857+W4eGTFBaknnckwApxmpY2PL/66+qbtIM08ODsJLqP2XbjXW5WqXd+t+GzeWu7lh8Xhrb6FMYAHCZ+5Z1TEOE8bUw5YtZI9Lji85D+gcrw8kUmIF+o5yo+uqncH+aVL9td6iPcqHoYYWQMm0CJ7qgfQu+yeOiltMvKZDJuqxMTl/W3lrS76xAjrqqQ0XINt0k6m3XCvM0iGdCGrve1I29SCLBc/GAEnss1X1U/+x8W/0yhcbTtszgvJFOM4jw1AkivES9/F8e3qk6QdmGyK/olHqCdxt/cEijb13sILre+Rxb7fNAAmKW8S9jTjHUWiKYi32PTbon5diHFDPJvjtMOSXDCxsZjXVSTEJnEAoC2v2LIHD5RoybZ2fiMuCdcvZj+
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 23:40:33.9698
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf71014f-4f7e-4040-7bd8-08deb2123164
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023DA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7774

On 5/14/2026 5:55 PM, Kuninori Morimoto wrote:
> 
> Hi Sen
> 
>> Looking for feedbacks & on this before I draft a proper series w/
>> dt-binding.
>>
>> The generic machine driver never had a mechanism to adjust for various
>> clk_ids that is tailored for individual codec & cpu peripherial driver.
>> simple_util_dai_init() has hardcoded 0, thus making non-default clock IDs
>> unreachable from DTS. Boards needing a specific clk_id have had no choice
>> but to write dedicated machine drivers.
>>
>> This adds an optional "system-clock-id" u32 property to the cpu/codec
>> sub-node. When absent clk_id stays 0, preserving identical behaviour
>> for all existing boards.
>>
>> Signed-off-by: Sen Wang <sen@ti.com>
>> ---
> 
> Looks good for me (except DT bindings)
> 
> Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> Thank you for your help !!

Hi Morimoto-san,

Thank you for the review, will send out a V2 with dt-bindings.


Best,
Sen Wang
