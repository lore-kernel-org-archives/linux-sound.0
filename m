Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012001.outbound.protection.outlook.com [52.101.53.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90A63806CD;
	Fri, 10 Jul 2026 08:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783673329; cv=fail; b=PnJrXd95fngGs78oBGoFW3z/HMOcdu6AwV1QUoOSgwLThkNh72vfoRVNfV663214GUOK7ljJiWh4NVp/fVnruu5VR4QkGRCC7VJWmOtzL3bnny/ovKHXya7tXTFhcWc5lmVXzWwX99HS4gt7HVnUM1IvdIS1k89Zovkf9GEMRGc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783673329; c=relaxed/simple;
	bh=FHUadzr1g/YX0qEMc0dufDIbDVvLEEYNeFBbhTG04gw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=t+V1rEHKw/qTp6x3cvSPYoFbef1K2Vga/u0GXs3DX/VsjZMz0V6H4jG3HG1TKruR13jq8/Kv1xzIeH02qghrTtnVa8Kl6KMFsZsNXxEzL6xrrwXNMxTnPCoQDyoq5FI+2b13cabl7OUKccgtFG/3+XIh8wLSEAMiiOSTn33dojo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=UBwcPYik; arc=fail smtp.client-ip=52.101.53.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="UBwcPYik"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fHOvoGEV+NvSbVt+1l3XPu5hxkedMZ5Sf2rasOeyh3W4Dwuz8gwW/bo/Lwaa5n1p27DJopILhVZNXn1/QlldiWSdRMWeFHS6cSCXRXimpS1uNUKizIedmdGmJ0rcLo6a2FAPhSfPEnSlWutouVRrKANHtaovCDXoB8kN+6n3mRn6vn6fFkJbwOgC5LpexPWQ46SAlynTPbObJDYCOKPvb7euupsiRJ46JLvGreQIHTgjyyKqIZT1oz0dECiZ0XSxZ1rPKH7lAjtfwNZR5XhlveBwuJRKe+H+qA9G3HvDmUbDYX96K9z6R2YUEwv67BpsJBNgDstXuxwaMxitfVktEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iNFtXuIXRR4jJgRfcWtCo9cK6D1rb9YN9sRJJL6dlRQ=;
 b=hwNaQH11iUHEqfGDQcoi0xKkVB5QrAwLgrDlf12ADxr8nTZnOSDJ1A4k00GwEC0yuRFHYaOXoDmPfAHkiq15k8XTHRneboXd5bqhEswxloVz/VRYSrMeu9+cmtffIV/HgMIED6eVgazevSYdDycz9mboY0ZKMKQnAS6dsQ80cuP5Yqz7mSCrjr1rVB9GZN72OfSCTSi7T9Q8XygBpSYatUh2rdT5VBsJKGwd2SxUbmw+/D0dc+pN7OTYt+9FPdE0x3FIxV7D3waJ7doIzVd6+YRJq+DJ+7/vdxvDT0QL7lJjNOMdcItXbgU34z2+6nQgtzI1vsYNmxI13poqSyKCoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iNFtXuIXRR4jJgRfcWtCo9cK6D1rb9YN9sRJJL6dlRQ=;
 b=UBwcPYik4cK3y8GI4syCBmXqEXZ3p6Z2g3lCqj/EQBehsXEu0qSqMBlj/6z3y/O2wmjAMm11FJ8Q0wbD9rWXsXrgMpSv0grtePG/oGhnNbB4cNyTKdXWt5uJT2qOkBMX3J4RRwQxr3eir/ByJ3ynZjco68hJbL3qnE2gHqrhJzw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by IA1PR12MB6409.namprd12.prod.outlook.com (2603:10b6:208:38b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Fri, 10 Jul
 2026 08:48:44 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%3]) with mapi id 15.21.0181.016; Fri, 10 Jul 2026
 08:48:44 +0000
Message-ID: <da6e74cd-05d7-4ba8-aa75-e186ed8a49cf@amd.com>
Date: Fri, 10 Jul 2026 10:48:38 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ASoC: xilinx: xlnx_spdif: Use dev_err_probe() and
 drop redundant error handling
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260710050223.14266-1-phucduc.bui@gmail.com>
 <20260710050223.14266-3-phucduc.bui@gmail.com>
 <a84c3eb1-7ac5-44a8-95cb-e33175e78ee9@amd.com>
 <CAABR9nFFMMk6i_sjKGjt4t-_QZF_hu2gBPRNK8c-GfhyKdVP8A@mail.gmail.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <CAABR9nFFMMk6i_sjKGjt4t-_QZF_hu2gBPRNK8c-GfhyKdVP8A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0013.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::18) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|IA1PR12MB6409:EE_
X-MS-Office365-Filtering-Correlation-Id: 05cc558c-db15-4e88-1fae-08dede600cb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	T8uVjiLl4DWzxkqYzf4DG/k1M0myIqfTDDDSyAA3GAN3+T1mw5M99AHYg36pEkBomGbID+rBm9SvznirHHdnfv0wNtndPpqRJBYWU8zZKtUzgv4IjP1rqzd7ibG+zjnIQTzUQr98betodRyzXtYH0prQCEd86rl+uc4lB9vPIhMaNzixMYAGna2Clkh/y+QlCazS9ZY80bkoyrgRBfShhRRWoGZEF3tXTxsjswv5k+TFxLBKCndg+o5vRANlT5Fuj722luLPwH46Mf3d9wXTYm5aoAUvU1Ol7BHeQVbdnH1RVM7ndRoe0QnKksCoZdVDH07Bqn60yFLGAxbBqbl3wRpJL52eowYxE1IWnudx9mCsPdFlzJa6OvbOXTXebQ6v9GW+xEYle7PHbPkLUxPyvnTahswwazGWl0X6JRWdqvyqgELyXI2aflPsDKcINREOSYYZnQ0HvBt8D1jMVfgEccgK2vA09TtiXdFtytmRTCVsvt5f8OXxa6LZT7NiDepnSFP/c1KVnH6mIEFLsSl7Xu3SQg1g6fNhvzMSWG1kYl4j+Srz8Sllz8h50qV7+ac5hifHD91cQedE/GCKoCecyE+u/brB9h8s66YcVaPYO8LWYxblHQklU+YGP4cKLVuF+626ipbNZn1zU4HbcCCyXN4EqqVhFCEPWh7mQHctrsA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?em4rOGlXeGtHeUlMeXBDWTdKaTNPeUduTVYwblh3WVNxa0RmUk1YRWl1TjZJ?=
 =?utf-8?B?UVFGVU1xbEIwNmpjT05ERUtvTG5EZU1kc2hIcU5jVHc5MGMxMkRxVzhQckVl?=
 =?utf-8?B?SlU2M0RySTdxVWltVzNVb2NPWis4TldIcVV2OW5YbE5iR1BPbFplb1RQR0JI?=
 =?utf-8?B?bEUxZkZZYjIwYWVDOVE0RWpTZHBpNFJFR2hudndEZlVGQmJabzdnTGNOaGlp?=
 =?utf-8?B?YTVYSXo0UE5HRVM1ZVNrT0hBRmpiTXI2ZEZ6SkJKcVkwb09QdUhMK1JTcG5j?=
 =?utf-8?B?RlhOYjAyR0tueUtBbDIzUWhqLzQ2bHBxdEFIZ0tTYWt3cjBLMHNZandSRTRj?=
 =?utf-8?B?SE5WVmRmOWFYa002dWNBbFpVK3JmcWxPTnRyazRzQzNkbjBISXBBdExtcFJl?=
 =?utf-8?B?bTIwM2V3S1BKMDFuM28za2V6eXZIbG9rK05IcHM1NGJFWmluc1JMSjRmMm1y?=
 =?utf-8?B?Q2xTbFhSWGtpMEFNUG5tdWpYZG9URjZ6T0wwZzV4clZnbTVvQzk4anI4QS9l?=
 =?utf-8?B?eUNXNHJ2cVBEK0E3WWllR29EazFKVkc3NVoyMzJxeFFzUzAzSWZFTE9SY2lV?=
 =?utf-8?B?bGNINmc4RDdyYUhuUWpyN2NOWkh1a0lzYmlLNUpZVG9DRDJ2VUhHQVhnQVZh?=
 =?utf-8?B?aG9EcVMrbzZWUWF3VUdCNHFtaWp5aHM3Qzk3T3c4UnIrQ2U4VG1qOGFVY1dK?=
 =?utf-8?B?S1QrbkVQdlBwTlNPWkdrdTFhTnNoaUl6SVROUnU0T1B4MXFmaEFVRXQ2SVhy?=
 =?utf-8?B?TjEySHlGNlJsUHI5UUpPZGFveHRYOEU2TWgrdUlCY0dMbTE4V2NzaFFoQjZn?=
 =?utf-8?B?Snlnd3pBMUxiL2UwMGpCUC9EemdEUmlCQlFsWUs5M3ZsTVRYYWZhamZCdjlH?=
 =?utf-8?B?OVQwRlpBcGZrekl3OCtnMTNFMHNWdVFJeDJsZzFqQi9NdnB5dTNvU0YzUzc5?=
 =?utf-8?B?YitUUW9aTHVuZURTenlHdEs0dDE0VjZnUGh2YWllaEtKQTR1WEhWOFl4M2pB?=
 =?utf-8?B?UHU1dWdMMVZyMDlrZHVLZ2hyMjNWOVFrcjlPZ000a0prZlVDcFBhOG5ZazA3?=
 =?utf-8?B?OE1wMDZYWDhiWlN2bTZMTVp6cThNc1hoaEVLMm9Ubyt0WmppRVQwcHhKU1J2?=
 =?utf-8?B?bXl5NTQ2OXJRM2NnQmZQdjhuU0xlWVU0NGY1dUFnU0dtZVR1ZFd0dldJT2kx?=
 =?utf-8?B?UXlWZmxrempwaGJ3N1hXc3RRMldBTkdjbTZ1ZDVyL3Fub0ZvRHJHTENMZkw1?=
 =?utf-8?B?blNLVDREVlVDTUUvekk1eHltNHlCcGtacFpYQnFiTFZKc3Z0RTZNYzdyVmda?=
 =?utf-8?B?K1ZvcnhkWUhIM0lqSnFOOEtSbVc1WDg1Q3l2Z2RMaGFMckhPRDdqb2U1YW5x?=
 =?utf-8?B?Q2FSUFRsVkpUT1RhRTBRUWg5cjhKUTBRbUgweEVPZHpaNGFucVVTL0JMUXhw?=
 =?utf-8?B?dyswMzhTdlhZWml3OEt6clBrSnU5bUVLYlJUT3BKeUNqZ1hOaDJjWXhDTitm?=
 =?utf-8?B?NThGaVhLMjdVRjhOQW9lcWh5ckh0bUd2RVJkTkF3SUQvTGNIa2NMaTUwS3Yw?=
 =?utf-8?B?N2tVZDd4OVZrYTJPaG1wRVBQNnRBaHhQbzlmT1ZWdDhJTzJFdzcyTENpK3Jn?=
 =?utf-8?B?NnlWeXVaR1pUNnJBTEY4TDgwR1diQVIvbWRRdFhwL1ZLV3A0aFV6MDg0WkJH?=
 =?utf-8?B?OXZGYXliSi92VmhzZ1lzS2ZPd1pNWkxMc3ljZnBmZHpmS0crWTFMWUtiK201?=
 =?utf-8?B?MGZWNFFRa0JrOTFwbmtwNXViakRZZHNsWnI0MW1tTk43UGN0Qm1mZVVaSWtZ?=
 =?utf-8?B?YUxuTW95enYwdFhKS3RwKzVXenpDdVNCeG1IQjlJQjRzSUd6WVVPMURXd2FG?=
 =?utf-8?B?S01SMDhmaS9OYTlZTnpiajE3eU4wYkRpVEYrTjRtaFdTSURoa3pkKzFJQVVL?=
 =?utf-8?B?aVFZZG5XN1BXM21oeEFaSy85NTZHK2xQNWVHSzZTazNoSldtY05mTzc2SVoy?=
 =?utf-8?B?MHJIK1BIdUJDN0NiVW1uNzNwZ1FpeDhtTmk2ZGVmOGhEZGl0bG5VeDBGak41?=
 =?utf-8?B?TEFvSDErWTQ3eGdwNVRLeXpzdVZmQ0FSZVBDSG9ZUVM5MndlbVRUMmNuOHc1?=
 =?utf-8?B?QUo1YVJLeVlwQVZxUERyajBBcjIyYkdiR25ObDdwMkt2dHo5eXhrSFNJViti?=
 =?utf-8?B?dG1aazYvU1dBUzBKRE9PcTFzU2N0RGZBQmsxczZpckszdUIyTHlKcmN1Z0VU?=
 =?utf-8?B?Q2FxK0hsVkYxV01yL0licXFTZ3YxbWJIQkJIb1dQNzNBRStYcnBpNEFUbmxi?=
 =?utf-8?B?cWRhMkJDeFJnQ0dldVZqSDl4YzNramR2R0swNWZUTGF6TTFPbEM4dz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05cc558c-db15-4e88-1fae-08dede600cb7
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 08:48:44.5936
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: daB/o90p9JpQZuPZ5Z2r4m3ZmnetPVzviypm9AZFi+1g+ibSngewCTjN1KXRzFvf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6409



On 7/10/26 10:17, Bui Duc Phuc wrote:
> Hi Michal,
> 
> Thank you for your review !
> 
>>> +     if (IS_ERR(ctx->axi_clk))
>>> +             return dev_err_probe(dev, PTR_ERR(ctx->axi_clk), "failed to get s_axi_aclk\n");
>>
>> This is pretty long line. Message should go on the next line.
>>
> 
> The line is still within the 100-character limit.
> I'll split the message onto the next line in the next version.
> 
>>> @@ -274,29 +270,23 @@ static int xlnx_spdif_probe(struct platform_device *pdev)
>>>                ret = devm_request_irq(dev, ret,
>>>                                       xlnx_spdifrx_irq_handler,
>>>                                       0, "XLNX_SPDIF_RX", ctx);
>>> -             if (ret) {
>>> -                     dev_err(dev, "spdif rx irq request failed\n");
>>> -                     return -ENODEV;
>>> -             }
>>> +             if (ret)
>>> +                     return ret;
>>
>> Here you are changing error value and commit message is not saying anything
>> about it.
>>
> 
> Oh, sorry. I should have explained this in the commit message.
> devm_request_irq() can return various error codes, such as -EINVAL, -ENOTCONN,
> -ENOMEM, -ENOSYS, and -EBUSY. The existing code overwrites all of them with
> -ENODEV, which does not reflect the actual failure.
> I'll update the commit message to explain this change, and add a
> Fixes: tag if appropriate.

I am not saying it is wrong. I am just saying that it should be likely handled 
as separate change/patch to address this issue.

> 
>>>        ret = devm_snd_soc_register_component(dev, &xlnx_spdif_component,
>>>                                              dai_drv, 1);
>>> -     if (ret) {
>>> -             dev_err(dev, "SPDIF component registration failed\n");
>>> +     if (ret)
>>>                return ret;
>>> -     }
>>
>> And this is another case. Where origin code didn't return any error which was
>> wrong. That's also not described in commit message and likely this should have
>> Fixed tag.
>>
> 
> Sorry, I don't think I fully understand your point.
> The original code already returns the error from
> devm_snd_soc_register_component():
> 
> ret = devm_snd_soc_register_component(dev, &xlnx_spdif_component,
>                                                                      dai_drv, 1);
> if (ret) {
> dev_err(dev, "SPDIF component registration failed\n");
> return ret;
> }
> 
> writel(XSPDIF_SOFT_RESET_VALUE, ctx->base + XSPDIF_SOFT_RESET_REG);
> dev_info(dev, "%s DAI registered\n", dai_drv->name);
> 
> return 0;
> 
> As I understand it, this patch only removes the redundant dev_err()
> call and still returns
> the same error code.
> Could you please clarify what you mean by "the original code didn't
> return any error"?

Sorry I misread this part. Please ignore my comment.

M
