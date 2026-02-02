Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013039.outbound.protection.outlook.com [40.93.201.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D525726FDAC;
	Mon,  2 Feb 2026 21:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770067365; cv=fail; b=NaraTuYsHa6I9VT61+vK+qDKz/L/cRP4dH9/s1lTDSWdLyn4L0KE6zIqkJIpbd4xjSNs3MP9NRkA+6KpEY14BUuFyzj+e+32COwJghc6LMo4I4PbtPowRd8F2t4sdD5JxlFk9vDM0a+cXjHJvhBlWU/Wj/dRyDSBHk7E+YsFUMs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770067365; c=relaxed/simple;
	bh=vonlrrqYrWOY+HO/cavIc/sNhzBx4DcGPw1yrQsNBmI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qNKwaCUkgrTMCBbXTUKNYEH7FHx7/WNOGHJj6X1aW61dgOyQyd6sCIc4znCIEhm8QtBJwGyLBH2r6RX5eeWB45WdtxrBmRqGIYmr0/UK5WbPhC33cpgbIsdT72dxDMmSADU/qNt3YIhES3hGuKaEioKd4bDOGlPNrbWMUHYT1nI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=JSWoK9we; arc=fail smtp.client-ip=40.93.201.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="JSWoK9we"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l2nN1yAjJTPk9OMBpHa9l2DPFW0jmVCHGFBqWELP12x1QRRywxSPNRn9+D5+KMPjMaC4ygP6kKnj8AUhdHE4D0n/dPDb1JlRPpsVh/pNZCjN51lgJNH7NRqofFSo7Mq79lQXzmtkneAthqCC3yydlDN2FDZOHGgFrWJEzYnc1+YBA57NAcQfEP8JZowooHDqjs4eO5ALFUjRB50f8Md8awvZ7yHzgNzVJr3bsWRj7bJz7dzHXGu0i+wEbf3YNXVHjsQfB7Irj57xqM95WJbpBlwjgJ4AS8U6m+6bD1v04ceCjZ2C3lnNpCyW1nH9XYo+CGf4frIDVrCbYKB//5jTgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qTE07ZtsAavyLKByv762mUG9k+No/MCsIzeZ9FzALMw=;
 b=NhvrBS2sgFbbmQcZ67BQu6jpcTTGqLJlB/eA8qppKoU/kJb60F6VhKwv0EnU1QysCypCTTsubqHXO0VgJRLjprS2sAo4MpX9cbzpbS+e4FAy/ypW6CaAP0z1gFiMKURCngpzXNQL1+EJvQ/Fy9Bw4QdLLvA1zXi3KZ02+HrO/b/JvBntiCZpkJaJ4PK4gx4LFv9NKuA3MAA/7zAmXnI/+v1eoFJMgW/9h/hDpQQfRqJJGCMZRk9vKwQIftFT0GIPxH6mcvZpiRrh6hW+JguiEFSMK70zAuHnX0NBJYV3ZAuLt4xsTJ+Unid/XMkek+J1TXiEqUJt96dX35IJYWAqow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qTE07ZtsAavyLKByv762mUG9k+No/MCsIzeZ9FzALMw=;
 b=JSWoK9we0JbUtydKN9orm/FPXLLeKR/Tmt70dwAVkn4Itgvq4I4+KOVLouGJJeCd+4qBtIV3FXGVKeAz5A6etNXuYVgKNAAQx/K+FoxedVAAHd9D9D9Nrg2GiSxjtZSZhRstBiAZIq5xfl96tqWCLqNzrPKLJeNsH3wtBYHz4NU=
Received: from SJ0PR03CA0052.namprd03.prod.outlook.com (2603:10b6:a03:33e::27)
 by MW6PR10MB7615.namprd10.prod.outlook.com (2603:10b6:303:23f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 21:22:42 +0000
Received: from SJ1PEPF000023D7.namprd21.prod.outlook.com
 (2603:10b6:a03:33e:cafe::f6) by SJ0PR03CA0052.outlook.office365.com
 (2603:10b6:a03:33e::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.15 via Frontend Transport; Mon,
 2 Feb 2026 21:22:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF000023D7.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.0 via Frontend Transport; Mon, 2 Feb 2026 21:22:40 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Feb
 2026 15:22:02 -0600
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Feb
 2026 15:22:02 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 2 Feb 2026 15:22:02 -0600
Received: from [128.247.81.0] (mz02jj9v.dhcp.ti.com [128.247.81.0])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 612LM2nn2393588;
	Mon, 2 Feb 2026 15:22:02 -0600
Message-ID: <b4f20380-4e86-480f-b23e-eb4384d6f14a@ti.com>
Date: Mon, 2 Feb 2026 15:22:02 -0600
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] ASoC: ti: davinci-mcasp: Streamline pdir behavior
 across rx & tx streams
To: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>,
	<broonie@kernel.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20260130051045.1898892-1-sen@ti.com>
 <20260130051045.1898892-4-sen@ti.com>
 <ffcbbe3b-3a1b-4986-8b4c-b0f7e309ccbb@gmail.com>
Content-Language: en-US
From: Sen Wang <sen@ti.com>
In-Reply-To: <ffcbbe3b-3a1b-4986-8b4c-b0f7e309ccbb@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D7:EE_|MW6PR10MB7615:EE_
X-MS-Office365-Filtering-Correlation-Id: 61573776-7555-460c-ab1c-08de62a1320b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dFlDYU1RK0JRUTk2K21aZGEvU2lYSlNaRXRGOVhaSnRRR0hPYXVqd0NQc094?=
 =?utf-8?B?Q3JpVGVpVXRuN0JlSUdyazFkaDVZbUVCTDhlY1dqREVabWxKZ25DcGRQNXNQ?=
 =?utf-8?B?U05yNS9FM2t2SEJJM2pQTVZSRDhpMUZaN3VCUnd0dlVIR3JzeUl6OUYvWlJo?=
 =?utf-8?B?TURzZW9GOFBSL0dDVlNtcXZGb2IxbUhWeFRiNE9YS3ZlUWhvUUZKNkdVcHN3?=
 =?utf-8?B?OEdGajFEdnJxNFFIeXRENGtEODhvZ0xjOVVlOGtGM2luMmNZZit6eThOTGE4?=
 =?utf-8?B?a1REZXIrdGJPWUUzTVA0cGVyZEFwNkFFUVdmUUt4OWhPOVZTNm95NXNhTy8x?=
 =?utf-8?B?eUxaeFRYSDBGMlpSWTNiOXFWWEcyZU1pZUV6ckxvUi9WSWViRVJ6UGFyOVU4?=
 =?utf-8?B?VnJkT09GNHVwZC9ySzRxRVdoWTQrRFpOQjJGN29wZ2lJUnBRazdhR2V6NnJ0?=
 =?utf-8?B?R0dMVVorRGVEOGRTRjFyVmtKYjFXWjVpYjBSSDdjeUtJTGNUbkhqSzBmYWd3?=
 =?utf-8?B?akRXOENSZnpmQkxPNzlGeWtxaEZWYkw1RHpYS2MwbnF0c1d5REQ4OENaak5Q?=
 =?utf-8?B?MjgvRzlyNW9ad0N3QlVSZGpaRnl1bE1CMmJRRmJRcjluclRZMUpNSG50U3ND?=
 =?utf-8?B?Z2tkdnJIeDJkMU1yWGNkNzBSZXRMcThhaFJKRUR2ZkJ6UGdSbytvZU1sY1U1?=
 =?utf-8?B?bmhBUVBvSEljTS9iZ3hMVmJZVWJBUWdERCtZNUEyTFBnc3lCN2xNSzM3L09Q?=
 =?utf-8?B?QXZ0RXpHR3dNc21pVzJCYVlsTVVFd2Z2NnovTlVYeGtUWm9CR2VnZnhaKzNF?=
 =?utf-8?B?SlpsUDluR2IwTE5GUlBaaGpQejRPNHJLMUc1UmIrN1lPQUNtSFg1aUV2OExz?=
 =?utf-8?B?RFVQRXRlUVFneTQwN0RlRWQ0OVFUcHNzYVg3N2Q0dng5ZGJid3hTSGpCdVRD?=
 =?utf-8?B?NWlZVlRsa29kMUJUNTAvUGNza3RYelZlRmIweTJnUVhZMXlQOEpwNlYwUVRF?=
 =?utf-8?B?aUQ4WjJsSG5FamxUV1FUZnR5emdxeUptWXlYVDBFWnoyeFRsM2ZnVUpPNU5L?=
 =?utf-8?B?dVpkWHFMTHVrYUFUeGhkSitmN2c4OTNUQko3aG9HMWM0WUFMeDlBNVhta1NE?=
 =?utf-8?B?M1JERVNJTWRVMURpK2k5UmRhNk5Mc2NxSmo2V2pXODN1OWdzMDlNaHV6UVRn?=
 =?utf-8?B?K0tmbGpsOWRYdnpQditBK2ZweU9Md0lua1o0Mk5PNjJjTnVNaGlCYUVQTXVs?=
 =?utf-8?B?aDYzdlpHMG1IazBuOHdwNDhnZnM1d3ExL2hkT3pRby9aODBYQkY2eWZFQ0N3?=
 =?utf-8?B?bVVDTW5qUlNMZ29SV1hKMjVGQVdCRExSTFgwamNuVTdlVVZVRTh0N0JScHhZ?=
 =?utf-8?B?UXZKZzVkQWhua295U2tNVmVrQUp4NjhXdE9ubFlkM21hdmVhYU11cVVEYldo?=
 =?utf-8?B?TEJKTkthZHpSYVltRlJPTU9nL1MxMW5sVGFlbnAxY00vTHBPQ08yajR4YWp0?=
 =?utf-8?B?WEgwWm1ya05PakV5MUpIOUN1Y2NKZTdjTU9YWnMwTHFkaUhZM0ZuNE9TVjRY?=
 =?utf-8?B?YUFvajZ4SnN5VnFKUEdTL0d2MTNISlZUU2FIcWwrZkxGUTRCaDBoZEcvVFJw?=
 =?utf-8?B?YVBkOE1oMzdDM0NNZ0s2cVlHd0JGZ3N1SXZqdVhKSHpYL0VVYkNBZ1hTbXk1?=
 =?utf-8?B?Y2FkZlFGQm1SQWJaT0U5NnU2NHNsRmkzeUEzOFYzQ1NBZk5LcGs3UEE5bUc5?=
 =?utf-8?B?RjJmL3dxdmVwUWtSQTE4VXhPZlZaMkRsMmFuamRyNlVqS0ozdzVRTEpMY3dV?=
 =?utf-8?B?MnFvWktPUW9EYWxUb0IvS0gxMVFMVThab2JjTVVPczd5c04yU0gxY1JFdkFP?=
 =?utf-8?B?YW5XUFpvTUJVKzRSVVdrWnZpZE44d1BTbmhCV2ZPbXNYNHliL3FhMkU1azhh?=
 =?utf-8?B?WlFYaXIwSFNPWmpUVGJWMjlITURoN2l4cnpxRytUZHpqb1AzSTlsUVB1eGNI?=
 =?utf-8?B?RVJad1VhNlJRWXY3aWhOZVZDY0dzM1VjVTZQQko0Sy85WkFWc2FrNmd6ZnZj?=
 =?utf-8?B?S2c0UVBvV3FOSXlpVFdEODU0SEVWRGlvZDZ5V0FVR29DM2xHRDYzR0JTZG84?=
 =?utf-8?B?TnFLWG40bE9iL3QzME1vVllMUWJ0N0NYZi83QUlsUGxZR1Z5WUM5VGZvMU83?=
 =?utf-8?B?dW5GeDhEL0JxaDVyUHkyT0pxMVkyYlVCdWRGSUgxSFArRkhuSEF6eVBlaXpJ?=
 =?utf-8?B?a0dLNENLa00veUdMbzBlS0VQVmNBPT0=?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(7416014)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	D4VCdmHYKnMmG0pxhL3uJAhXTRevgGwqWxI5kyinWOwyDBVJoRDYPm5JY7P1ebmLzu6JOu0EzTlOWjYUe3w1eZO5Z5AZYqcDMwHqNVrmfRyxFMP28k7OOwr97S8CF8EBUKweEhX65699wAa56UmiMjDs9EbWLrcGorcnXYCr1/mG1XxOykAE0VaDyoqvP/n1bSfZCOkuPUJKdj39Yy5393EFlyXNKzGUkQj5CVZ8Vkg4AacwYfw+TvnP9dnOlnoM6ky7Omdsm44nVWlTjGhyuGGxgJlLoI58nphiT/oHK4EG1jeO6l+HblL2N1ijgScLqRD4tkklZ8fk/k0L+DYWQAKOoiYrpHp5YxanZASN4/7Z5UIQnT0kZPLmvGN5hllXwvDAWxkrnz1Orrnh6k3JHrZR9dDqUgx+vDLHbC5FRU60GK8UsvX1c7oWU2kiNUiO
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 21:22:40.0831
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61573776-7555-460c-ab1c-08de62a1320b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D7.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR10MB7615

On 2/2/26 10:49, Péter Ujfalusi wrote:
> 
> 
> On 30/01/2026 07:10, Sen Wang wrote:
>> Simplify the mcasp_set_clk_pdir caller convention in start/stop stream
>> function, to make it so that set_clk_pdir gets called regardless when
>> stream starts and also disables when stream ends.
>>
>> Functionality-wise, everything remains the same as the previously skipped
>> calls are now either correctly configured
>> (when McASP is SND_SOC_DAIFMT_BP_FC - pdir needs to be enabled)
>> or called with a bitmask of zero (when McASP is SND_SOC_DAIFMT_BC_FC - pdir
>> gets disabled).
>>
>> On brief regarding McASP Clock and Frame sync configurations, refer to [0].
>>
>> [0]:TRM Section 12.1.1.4.2 https://www.ti.com/lit/ug/sprujd4a/sprujd4a.pdf
>>
>> Signed-off-by: Sen Wang <sen@ti.com>
>> ---
>>   sound/soc/ti/davinci-mcasp.c | 10 +++++-----
>>   1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
>> index aa14fc1c8011..4f8a2ce6ce78 100644
>> --- a/sound/soc/ti/davinci-mcasp.c
>> +++ b/sound/soc/ti/davinci-mcasp.c
>> @@ -235,8 +235,8 @@ static void mcasp_start_rx(struct davinci_mcasp *mcasp)
>>   	if (mcasp_is_frame_producer(mcasp) && mcasp_is_synchronous(mcasp)) {
>>   		mcasp_set_ctl_reg(mcasp, DAVINCI_MCASP_GBLCTLX_REG, TXHCLKRST);
>>   		mcasp_set_ctl_reg(mcasp, DAVINCI_MCASP_GBLCTLX_REG, TXCLKRST);
>> -		mcasp_set_clk_pdir(mcasp, true);
>>   	}
>> +	mcasp_set_clk_pdir(mcasp, true);
>>   
>>   	/* Activate serializer(s) */
>>   	mcasp_set_reg(mcasp, DAVINCI_MCASP_RXSTAT_REG, 0xFFFFFFFF);
>> @@ -311,10 +311,10 @@ static void mcasp_stop_rx(struct davinci_mcasp *mcasp)
>>   	 * In synchronous mode stop the TX clocks if no other stream is
>>   	 * running
>>   	 */
>> -	if (mcasp_is_frame_producer(mcasp) && mcasp_is_synchronous(mcasp) && !mcasp->streams) {
>> -		mcasp_set_clk_pdir(mcasp, false);
>> +	if (mcasp_is_frame_producer(mcasp) && mcasp_is_synchronous(mcasp) && !mcasp->streams)
>>   		mcasp_set_reg(mcasp, DAVINCI_MCASP_GBLCTLX_REG, 0);
>> -	}
>> +	if (!mcasp->streams)
>> +		mcasp_set_clk_pdir(mcasp, false);
> 
> I'm not sure about this, but the sequence should be preserved, PDIR
> change first.
> 

Sounds good, I'll enforce the original order of operation in the new patch.

>>   
>>   	mcasp_set_reg(mcasp, DAVINCI_MCASP_GBLCTLR_REG, 0);
>>   	mcasp_set_reg(mcasp, DAVINCI_MCASP_RXSTAT_REG, 0xFFFFFFFF);
>> @@ -340,7 +340,7 @@ static void mcasp_stop_tx(struct davinci_mcasp *mcasp)
>>   	 */
>>   	if (mcasp_is_frame_producer(mcasp) && mcasp_is_synchronous(mcasp) && mcasp->streams)
>>   		val =  TXHCLKRST | TXCLKRST | TXFSRST;
>> -	else
>> +	if (!mcasp->streams)
>>   		mcasp_set_clk_pdir(mcasp, false);
>>   
>>   
> 

Best,
Sen Wang
