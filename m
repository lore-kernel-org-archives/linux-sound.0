Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011045.outbound.protection.outlook.com [52.101.52.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A6A29DB88;
	Mon,  2 Feb 2026 20:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770063508; cv=fail; b=L4u0Sw0cqnQ3LCbGGOP0xh8IFhmjn7Aq9+J/CRMib6wD6UQE2oIh3hB1smH0o9NBYcDL+LThUbGGETlvWL5gUSmHnS2q+26ChBjHHNIlCZxRSzoi5hntwvQ+g5HFWM3GkBpskFW8yeP3mgt6hE0Fae8+CmjOA+2ibqy524KJsoQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770063508; c=relaxed/simple;
	bh=YHJ5tKd5D/n1BKZsvu2kh0TEDBtPupjSo+7lM0VyWZE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=MYFEGxxIkmSAnmEZv7iTuXolXqzwaNC6xw1xV5PuskJtnpKlcT7+M951Fz2fPekvY9OIgd7M+T866XdASV6nMkG1b8UwOUCgAHgRPmVHcG765Ch3KGawqUR5TwHVXahnfxb2b4lVvSMyJxgrayj/C3KxyKYqA7utkzQc3VdHQrI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=NsWqz4yP; arc=fail smtp.client-ip=52.101.52.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="NsWqz4yP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kj9F1+mnGf7m8Ms5TYy4F2scFNdP3ty4+v7D13se00y+KvYTE505yVIn0LtpF061tzj0dvLORUbIO9BlxXr00MP4tR6dZrj8vCJQLHes4IMUk8tmIguaURwkze7tz5y1mjMVQ9ept+B30rzEtkC0dLjKIpz6kW8YfD/xbThjWZt0UoqfIRZrbfG5r1WrEIvK2rrn4CUOOj/nmC3MMsjkJYRDNRfslcUcbOsjMqOgMTGLn46VMb+GM2/oBs3NMqsVx/YlKmtZj1lPYG5AzQThFLNdg5p1N2/S4rqfovO7N2c0DEajsODBgB02tyoily4VUQzTNEPnMIEGGinq+ycxJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ecct6I0HMxrtiRC3/Pd1QlJw9Bms+M4OfHYlyx8Kbxw=;
 b=T9pVtMZoeS1B7pIHQLo2g9Owlq2hqvP04hei85Srsq+dpSE3WnZ0kU54j6qAnjiMPWHScobr6Z0ls5trDsdyyC704pXdC5I7wHA3flnBuNmR88HETgQuzAoa7ek3hfYIvWE1FEebNFyCA+GeT0it1JFNUxbgepFmtWgQH8oR4NTwhq39cJ4SHxxIAeEFYeh5UM59uXd6JiPMqzAb62VdhoAB2fzuPkQWqkv7BRLlryDyeiEOG7rIhRtr1JDz77n/LYH+616v+x7vUcZkyL4WcTQNYutiN8PxdWGol4lYuYLArax4sYPYcAHq7MWHnblWhqPJjFHiZZQaDIN4bKlf2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ecct6I0HMxrtiRC3/Pd1QlJw9Bms+M4OfHYlyx8Kbxw=;
 b=NsWqz4yPDyrEc1IFnqzDe4B3hZd/4UGueXcbRA5OUndmSp1ICxk2Qd25VrZgs+pJwOteTkkh7kOcfbqqX9QedHF1XZNPhb4bElHdngXCu0JgF3nWmQwAIATKAjInIJ+UvjoLD7YgFPNW+/tc3BNjRPEX46v5msIpQTwYjvpo19A=
Received: from PH8P221CA0033.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:346::10)
 by SN7PR10MB7103.namprd10.prod.outlook.com (2603:10b6:806:32b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 20:18:22 +0000
Received: from CY4PEPF0000E9D3.namprd03.prod.outlook.com
 (2603:10b6:510:346:cafe::b5) by PH8P221CA0033.outlook.office365.com
 (2603:10b6:510:346::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.16 via Frontend Transport; Mon,
 2 Feb 2026 20:18:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY4PEPF0000E9D3.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 2 Feb 2026 20:18:21 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Feb
 2026 14:18:21 -0600
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Feb
 2026 14:18:20 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 2 Feb 2026 14:18:21 -0600
Received: from [128.247.81.0] (mz02jj9v.dhcp.ti.com [128.247.81.0])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 612KIKUT2739906;
	Mon, 2 Feb 2026 14:18:20 -0600
Message-ID: <f5baff53-55bb-45dc-8242-864aa2fc9d00@ti.com>
Date: Mon, 2 Feb 2026 14:18:20 -0600
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: sound: davinci-mcasp: Add optional
 properties for asynchronous mode
To: Mark Brown <broonie@kernel.org>
CC: <peter.ujfalusi@gmail.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <linux-sound@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20260130051045.1898892-1-sen@ti.com>
 <20260130051045.1898892-2-sen@ti.com>
 <fb52b67a-0772-4fbe-b720-6bdedcde1a6f@sirena.org.uk>
Content-Language: en-US
From: Sen Wang <sen@ti.com>
In-Reply-To: <fb52b67a-0772-4fbe-b720-6bdedcde1a6f@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D3:EE_|SN7PR10MB7103:EE_
X-MS-Office365-Filtering-Correlation-Id: 252ad47b-a990-4468-bc6c-08de6298362e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|7416014|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SkllaUFpWGN2TlZJeHgxc05qWmlla1h3MEVhNjBwVnZCVXdSRU9RNDdyaGpE?=
 =?utf-8?B?Zkc0V3RmS2JqQXVlWndrNjFWOGJHeFRhSWNHYzJGQ0NRMll6UzVadUtnc0dp?=
 =?utf-8?B?Sy9NZGNkTmZpajJLbk5ybUU0cVpRNUFSS1d5M2k0WWw0YkNVN0tQdU9mMWhG?=
 =?utf-8?B?SVRBNEQ0WlhZdXE5Um52VTVkU2lmY3RrMXl6M3Z5QVVVaGdxaEZvZjM4Q2Ra?=
 =?utf-8?B?T0JaSEVSWmhzMitUUW90RjdLakZFTmZsNGJ0V2Nub1NFMy8wcXlkTyt3dDRm?=
 =?utf-8?B?ckR4TEZVL3NEYlF0UTRXZUNhdUplalFnRVRaUC9wKzNSYStkVGJraVJDbGQ5?=
 =?utf-8?B?L0owVW9LcTVpRGJDa1c5bGptVXlzUy9LdXdyRURLSmxMMmtQZi9JMXNJYzJM?=
 =?utf-8?B?ZzhLazFVRlhqOHFtbWhmdU42SmNXWlVUSVdsSjFqdEh5TGZrSVhvK0VBNXlI?=
 =?utf-8?B?cTRuaU95OWZyTlVBdjdDNDQ5endnYTFQWjh4NWpZZVNSV21PM2pyelFWTUlh?=
 =?utf-8?B?MWc3U3JHNWVsSVo0TVNUUVJRK21vbGM0M0ZwTU5SaGFBZmZmT0Z6VENDSS84?=
 =?utf-8?B?bEtMd2luUGpCd3BKeWVQTFJ2OEJCNWRwOEE4eFZnK25yRXJGS1dYb1BwTzNi?=
 =?utf-8?B?bEMrZ0dkS0RBck5jalBrMmU4SDY5OXFYTjM2QXkvaHZPZ1hHSU5JNHowb0ha?=
 =?utf-8?B?RmFzN2R0NmE2SUJnTjJENnk4Y1dwdkhKQnhnOVhqWnEvYU1XRnRxWUpQZ1kv?=
 =?utf-8?B?QlZtTTlpMmp5ZTBmZzBkTTJ5YmxkdTlGZkJRUlpETk1JVkM5cWxnTUo3aUp4?=
 =?utf-8?B?cUJkSWVYV3hDL0hQK0VjR1NQc2FPbktNeHdnVGtaa1NiczFFRnd5N0NMcWNU?=
 =?utf-8?B?U3o5Q3JVVnp4UHFPRk9jRjNxcFBJa0IveHdkTm5HczZkZWkzNmRRM3JqVGFu?=
 =?utf-8?B?cDYwVXBCZWJ1SGNLekpYZHVVRDdGcmRoZXJhOHhaYUFCd0tpdFVVODFaQ01y?=
 =?utf-8?B?RXNhQ0RIZnN2RlNRYStjRUp0VGtmaFJTOU1kbGp5Z3JaQVJ1Qk1xb0ErYVRH?=
 =?utf-8?B?QU9nTUVKWnZSRktCMVc2aXdXWVdKZ3gzT3pDYmEwOTNRQmNoVmhyZzcvOVNY?=
 =?utf-8?B?VDRQMFFTQTBjc09Pb3VtRXJkditDeG0xV2FVUVdWUTA5UDRzYkhhS0VHcHpw?=
 =?utf-8?B?UFhUc081YndIVXlCeUprQ3l6RzJER2JKV0YyUVNjT3Bqa0YvNnNKdnVGaUlw?=
 =?utf-8?B?QzhENTlFTklsdUhnQzdtQmx0WmFPUWZGQzVYL04xdFRIS3ptTFBRUG8vOWw0?=
 =?utf-8?B?RG5WVUo0TDV2MU9EbE9FeG1pb2FtOGg2N2EyZUczcEZaNmorY0V5b1FFZ2Ir?=
 =?utf-8?B?eVJiZThwMTVTUjM3ZytndUFwK0V5UXdONEhHMzJFb1BGdERna2ZvTzRhOGhp?=
 =?utf-8?B?cWlpVUUza0g4ZVIvZ2hiM05GWU5DYzFOQ0FzYi9CVk9vWkUyK1FYOFVhUVp3?=
 =?utf-8?B?MmRZcU9MUFJnaVZRTzJ3enlmcWVaUTFoY1ArM3d1M09TeGgyaDQ1V2F2NE1i?=
 =?utf-8?B?Qkg4ZlhmRFU3YTRKTzVDVi9oc0xEd3poUFQ4TVl1L2JOTlVwZC9XbE5Bc0hD?=
 =?utf-8?B?ckErVUx0b3FYbVphOW5GK2lhZEtTWFpJY1BrRmpVQ1RhSDdXSmM2K1M1aW9Y?=
 =?utf-8?B?MFhzeWV6WENvV08rN0wweno5anlabjlDK1BnUE11cktwSng0RVFZOFUzeWwv?=
 =?utf-8?B?cnpieDE3aXRocVU3OTV1MDdyOFB5T0ZEcGhyVFFBUXFkRmpBMWNyRWFLMnox?=
 =?utf-8?B?elhaSTBnaGJRWUc2UWUyTGN6TlF0L2xKQ0Jmd09mOGRTMHI5V3UrQ3hreXQ1?=
 =?utf-8?B?UDdsemozd0lZdEc2VkNtYmxTMCtnVEZqaG96RGZnbURPeGk2WDg3bGJTLzJ2?=
 =?utf-8?B?WFpxWllGbnFsRWlncWRjU1hWc3c1d2p3d1BCdzQ2d09GOENOeHlKaDdHU2JP?=
 =?utf-8?B?S0RnbUJ5SEs0Y2tuM2s4WVFqVUJHOHBnMVhCNG9WOTEvNlpwakxEemVmcjJo?=
 =?utf-8?B?ZGtWM1RWSkdSaEx0OTFaVTk5ekxqUnZNS3AyVGN6MlduWVBhL1ZZYVM2RWRs?=
 =?utf-8?B?SlZSMnB5ZDJ0eEZJcmtqZlZaNWwxc0xyMld3VjJ0ckgzamdkeHNZMW1wWm5l?=
 =?utf-8?B?bDd1Y1N6YzVSV0JQOExGNWdGQzZOTkxqOUc3R1FhbU5QaFZXaDlmcFdzdTdq?=
 =?utf-8?B?TDRHTDJ3ejlKMTI4UGcvR3RpcUR3PT0=?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/etaABQlUO9RHWQccTdjuCA4Fq5txPqRFy5uhPrI/iXV52wHX6NeU8OstzKE2Mrl8vex2ywyGOOjHTjXxIKPIADh3c/o63wrkog6yHTju7m7z8AIYUYaOoXY4JRjr7PkhU2xB4Hx3f0ATj8anBoYF0jEluC9dv3ZZQFc1g75SWBhHAJHU/8MKBy7MYTdCW/1VFmi/G1EqBO3Rlzlxbhc1G6GOinBfkUCcKqwlB1OBF8bPrg0GKxyCaRbbzUNcTj1t3YumQd3sS8UvrkUYDTuv6g7UL0Zhit6Zgcgf5sMzKmDuBX6xbu5gUMsJ5/larFn5ya/AMK7MKszdLE67cKdKAqlXPE17yy1kr1Km0xEsVgv3S3GKmFf9JbRBh1IPDSt8ASdoqOLRPPT7Oq92Pg15tcomn23w3ErF6NU4zf/GlNW7bIr/RYu0f1bIcaRnrqb
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 20:18:21.5906
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 252ad47b-a990-4468-bc6c-08de6298362e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB7103

On 2/2/26 06:44, Mark Brown wrote:
> On Thu, Jan 29, 2026 at 11:10:41PM -0600, Sen Wang wrote:
>> McASP supports the independent configuration of TX & RX clk and frame
>> sync registers. By default, the driver is configured in synchronous mode
>> where RX clock generator is disabled and it uses transmit clock signals as
>> bit clock and frame sync. Therefore add optional properties needed for
>> asynchronous mode.
> 
> Please submit patches using subject lines reflecting the style for the
> subsystem, this makes it easier for people to identify relevant patches.
> Look at what existing commits in the area you're changing are doing and
> make sure your subject lines visually resemble what they're doing.
> There's no need to resubmit to fix this alone.


Understood, my apologies for the malformed subject line. I picked a bad 
cherry to follow. Will ensure future patches align with the norm.
Thank you for the catch.

Best,
Sen Wang
