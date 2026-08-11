Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010069.outbound.protection.outlook.com [52.101.201.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A3B44838E;
	Tue, 11 Aug 2026 14:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786458395; cv=fail; b=HgTZ4G97HvUbZBJSALGeaRKPkilqHv0oEwOdeE+QBUQsqYeQv+Onom93ya/eI/T2fHeNSTL7uAUvc5bBtoWll9f3TwsHQfXvIwXk1DPTkU3tYgoAmpAqu6CXD9+G8Jxvc6SzzrnXjvEdvmRZeLp54IRWU4OCc82WlxZtkmmaW98=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786458395; c=relaxed/simple;
	bh=xnMTIE7mkhYb8TxN0VRuB/ofJIRHZCYbXKAb3U3j0zQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WV0V1+nkvFUMIgGLXdrIsRnwew1nTH5kHgv5uonMi8PaqMKNTVK1rKwTEeya6Ek/4XeEblbgiRclUQM7wIA2ukK22ZHVE5xJyAzDEuhjo6hxOrz+2Z2yHn1etN9M06+X175qrJApSTySYGEwFQ+8M5KkjXe4KOfEz8KKXfN/v24=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=2dxLqpNn; arc=fail smtp.client-ip=52.101.201.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="2dxLqpNn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tWuzi6IyUvfRXfxTLqruYrS0oDwe+Gi0Bf9JtHBZiG9JBuyhSomR15erxJ8kVPFQzxVVSRdT82ZffxNniaOTQmfpyf0qndQokeLDQhg9qz6LJUBhPaw+COVYr8sjY7SiTBGuTVDU5/0XaiM+2WC3UDPsRMEcDXWXZaZ2/Lj6hsK0ZIBWv+YdzO6frNKroIgia0DhpALFYuObhIwVYl21xU9tUslZVZewMScjqSjanYi8tRu7w9rOyfbaZ3rxebyvQa1bRAt+fHi8pDviMg9Kkw5kXSlcH5XNX0VjYGjxgpktZ+xLGC0Rb/07fcE57EaMLlOEvTMYYhLkldTKs2R5/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fw7D+uiXW7KSSVjV9Qe/HE727OBsSJnh6paikIxHGe8=;
 b=dyWUt2OLxJMCyM8EQXWlQSS3778wTrElOHlKqkB3O6hqcyrJLrgI7xhy+7j7x4M1elXW7mY7gSiEaEZVSYi2xHbR4Tl2CeLOhgPWREIyRdspT/gvrKA+IeYV5aosKnT1bWxwF89Sbu4XHOonvn9VNx5F+wxkY5eGLEokP7y+fEk29V5/LKmUIKg2IgDpj2UznQphwqNdUIXHfQRN/ze0Xcly3ozdSaJWYpka6/GVlyPYHdgyVBEmy9HOC2W1g4ffhG6hE6e19ETkXRnWw2oLA4km4MGFXx+uM+zA1JZi2KgaO1xOeXDufoB03MnGRDts0y8GLMrCNMGO3VpGRyeSaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fw7D+uiXW7KSSVjV9Qe/HE727OBsSJnh6paikIxHGe8=;
 b=2dxLqpNnX6A+/g5ngFuGs29xbSl7BDUCYTAXw4WuuCffbkUB53iQHMVj6gplJogHwYZyUWALdSFU6oYu+DCHqt9gLaeAGuzsMVOFKQwPztbMkUhz4mBFn2LrwqY5mUca5ZqzrE2xiSwYzDIic4ANsl+IKoTdhQRKf/HAoQKKIIA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by PH7PR12MB9202.namprd12.prod.outlook.com (2603:10b6:510:2ef::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Tue, 11 Aug
 2026 14:26:29 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%5]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 14:26:28 +0000
Message-ID: <98ddc5e1-0341-4c5e-9a80-e03c79a9660a@amd.com>
Date: Tue, 11 Aug 2026 16:26:22 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: xilinx: formatter_pcm: pass aud_drv_data to irq
 handlers
To: Rosen Penev <rosenp@gmail.com>, linux-sound@vger.kernel.org
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 "moderated list:ARM/ZYNQ ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 "Dhanunjanrao, Katta" <katta.dhanunjanrao@amd.com>
References: <20260806233231.30631-1-rosenp@gmail.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20260806233231.30631-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0P221CA0026.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:610:11d::6) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|PH7PR12MB9202:EE_
X-MS-Office365-Filtering-Correlation-Id: 55c2626a-f90f-4d01-a705-08def7b48831
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	bEaQ9BRCy3Bwfkh4BVwanPeblTkph0/KFsUoTHkR/GMnxMBp31CCN0KBNyXBvVcpAcl7wNIKZQhqwKSr4VM+FR5sH89v4bqNA0MVXTzlgIy9xm7lyAsqNep4dxqaqpGpW8dZ3VvqCBc5kZR2AZA5gIXB/fJQt7PcRUY8Xh8a0UBa6AxecHgcEV+OOnE5xYUFm6FD7CQfnH6c2gairKYAmCTDI9fUnUc+m3v1CfZliesdXonIcJi+UAt2dSHyCnhV6cf+DTQ1moJlkH5T4nBEudm2fAqBAb8QHrE6MN/3WGaMprkRzvP3vGkP95oV41nrARKYt8+CWBVmSYO+rIS7F58bp2cpF5PB3W5yuP/hLuC/mntNlmYz4luwD9DAg5f+q/QOVMX6syICnj7FD64kcF3BlflFDW4/kvGfa+6bvu2VWnrbZ6QG89/nnEPA7uDoKF9bMyOEPIgFib8tbsMhK1HnbhWo2jZ0mnhIiRX+1cU1HgmACKXdngSH94RqMcJH13qNYV0fCwCRWqB3fFZQQRyMq6fDaQdcRIvaOlvQM6GLUMphgtLdnd3e5MMFTed88qvZ6hDsQeP/eNX8Z4ojzaTukkWNmA+4Az1Zd5/fakrGBqWrygJw2pjqOcXXCKI9VqO6Ds/bOAmDbLfLlvO8DQ3azIha68AYXudcG2AtIzs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MTJ6VURCaXJaWldoOXdCWHJkTjhmZmdZd3FIeGVpRG9iUE5qQUxHazJ5ZGRF?=
 =?utf-8?B?ZW9yTHNlOG82N1ZHcGpSZVV6ZWpvZ3QyWk81ZWlwdElDN1NwZG11Y2QzTXZ3?=
 =?utf-8?B?N0ROK1lhN01TSXI3UC8zTXZLMGlJUFZaWDdxMUFUYTlzUS83elErak5iS2pt?=
 =?utf-8?B?OExJUU5xWUo4VTBFaTA2VkVpNDIxYnRkaGtDTDhjQUE1VkFSeGJVQzhUeER5?=
 =?utf-8?B?VTlKb2F6ZXQ1TVNzYy9FUDFSUStoWFRIY202WVJZaWh4Mzc1QXNLaDFkd2RP?=
 =?utf-8?B?SGVOY21sS25wNEVKNjNkWDZXcFk1Lzlla2ZEWHI0R2ZySGVZSEtvQmFRZVgz?=
 =?utf-8?B?QjJTY0owMnJoWCtPT2p2MzJVcVZET3BzZW0xSDFDbUF4Mm1JMTZPUGIyUFhT?=
 =?utf-8?B?WmFGSEF4Ni9ETFlUYXF0YWY5ZkQrSXF2dmxnVHJoZXcySWxuaFIvRFhPbW42?=
 =?utf-8?B?ODZWRFB4d0dYNVpQbGtaT0JVUkZrM2RmUEN2T0lBcUxFSTJxb2ZWUmQwYVBr?=
 =?utf-8?B?dkFvdVJXdHRaZFk2elVJSEJaL01QVTMzQ2Fxd2p2L1Uvdjcvekp0TEppbWI3?=
 =?utf-8?B?SGM4bDE4TFM4ck5RN0xJcUZDVW5VWURCemRnOVpzQTdPWHREY3RwYW8xWVR5?=
 =?utf-8?B?MDF0NXZIL1pkUmNoMnBKM0ltUlZBMzhCTkFCL3lDOTBLMjBXYXNrbVRTTHY4?=
 =?utf-8?B?SkgxeDFJNnM2S25xRjdDbUJHWEptd1FDYVhtbHczeWZFZm9haXFqdHdDQStB?=
 =?utf-8?B?QXVtKytqSUxWR0xqbzMvdjFoMzJkaWtHaFFmUUVMdnUvUEplemc1SzhDRzVC?=
 =?utf-8?B?MWpuQkJEdXp2V1hZelJYRkNkbnRTaHFkcUl4d09RWjRWTVJBTWlFN01DUVlj?=
 =?utf-8?B?eHlZdSt3Y2hsczIwV2J5M2VYanY0bTZTbUdXc01jSU43UU1Edm05T290UkhV?=
 =?utf-8?B?OW5HQW81dEhOM2ZSUmVjdXV3aWErczBKZUUvY1B5dUFmQnBmaEtndVlTZU5q?=
 =?utf-8?B?MkhKbTdCM0NMeE9qdGdzRHRBQm4vZEhPMWhqMm1VK3NkclNja2pPVFVuTmk3?=
 =?utf-8?B?NWU1ZXFodzM4Z0lnbnZQWk1yWTRkc2ZQU2dJQVdWazZQL3BmZElCcnBIc2VK?=
 =?utf-8?B?TGl2RHFEeHNoM1NVVzVxUDExMVYxWWkzL1FJREo1U1I2QlNOQjR4SU5kT2h4?=
 =?utf-8?B?ZDRmYU1uWXdpZ2NmK0wyY1FVdzRpblo1U1BCZ2F2Y2MxWjhZbEM0ZHNUVEIv?=
 =?utf-8?B?NGx3TTZaQ1Z5K3VxKzNOMmRJdVVaNVVUQkhtc3JuSW5jTmVKT3ZlZ25hODlF?=
 =?utf-8?B?T0Z0cERNSW9YaDFqT1dSK3l5NHVmUHFjSFlHd1l0OWRTN0hiWExCMU5sa1VM?=
 =?utf-8?B?Y2VBeVJIL0lWb3RZWTBXaHNlc1BtWUNLWXhuYlNSTE85WWtyUDkrT2tObVBv?=
 =?utf-8?B?bUZpdkNaU3F4eTFURWdUNkVUV0k1OEtRRmJaaCtSc29ISUYrSzN5bnpVdDNa?=
 =?utf-8?B?VFVLL01aS1F1RTYzZVFHVVdlQktLdmE0TUUyY0pKUDJ6VmRkeVNYU3Nhb1pI?=
 =?utf-8?B?eEw0bUcxcnNIbXRCeUFqdHZ1M1c1VHdhNFB1enFjbzN1MWFNd2wrZjlsNmRM?=
 =?utf-8?B?Lzl5WWxVN3dsVHVsRUVnU0p1RFp5MmR5c1E4enVuOHBNc21PeWFMbVhCWHF4?=
 =?utf-8?B?dGdDMUhrWmQ5dy8vNzJZVGQ1dFJtY2xJQXZ1bW9GU0xCT1NHdzJnWkZsRjRU?=
 =?utf-8?B?Z1kxSmd2bXJiMWtnT0lDQlZBREg4d3JWUi9XV2FHSU84UXJTZStzUFh5akky?=
 =?utf-8?B?MFVsOU9DQWU4bVc2QnV5cTdqdWJMZmZnMmwyYUdrQmxFME1NcjBEZ1J3RjBl?=
 =?utf-8?B?NG0xRDRXSUNzaWhvdkhQQjBTV0FMSmhQZFlwazRFZzZyOUlRWVRKOGtqY3Ax?=
 =?utf-8?B?UmJiZ2tjS2FtSmd4YzQ2TWJmWTgzOUM0c0pna3dGT0wxQWl3TmJva0dQTmYv?=
 =?utf-8?B?dW9hakJINTFzbER1WlZkVEFFeHNDMG52Vnhyais0OHl2dk1vbERkZ09XT1Rh?=
 =?utf-8?B?QjA5NzRJNXR5d1d4c2MvdmNDdmRYMUVjcThLRVphV3Nyc0hiUUd2LzFIZUxJ?=
 =?utf-8?B?R2U2ZStST0U4dzdwc0graTBWd3RnelBuY1k0RzFNSm92dndlQWFKa0hTbDhw?=
 =?utf-8?B?eCtwTUVwV2o1QVlOSHoxeElVb2t2T1RLZXZLNzRKWGZVR3VzS0w3SUdHNnN6?=
 =?utf-8?B?c1VQNVNCQjhRRnZNZ1RlZFN3K0p0eFNsdGRla2w4Q2JsQWl4WU9QZFpzM2tR?=
 =?utf-8?B?WWwxZEZoMVZ2WUl0YmVQYTB3SEpMN2RQbnJmekppRndhbzZLeXhDZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55c2626a-f90f-4d01-a705-08def7b48831
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 14:26:28.5304
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oAHveek90BqsGpC6IDWTX3B7I/G6dqMvPrOxhszYUbhWQr4Uyw1DE9Yj4HzIr+g9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9202



On 8/7/26 01:32, Rosen Penev wrote:
> The irq handlers take a struct device pointer and call
> dev_get_drvdata() to obtain the driver data.  However, the driver
> data is only set at the end of probe, after devm_request_irq(),
> so an interrupt taken in between causes the handlers to pass a
> NULL pointer to readl() and crash.
> 
> Pass the private data directly as the devm_request_irq() argument
> instead of the device pointer, matching what the handlers expect.
> 
> Fixes: 6f6c3c36f091 ("ASoC: xlnx: add pcm formatter platform driver")
> Assisted-by: opencode:deepseek-v4-flash-free
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>   sound/soc/xilinx/xlnx_formatter_pcm.c | 10 ++++------
>   1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/sound/soc/xilinx/xlnx_formatter_pcm.c b/sound/soc/xilinx/xlnx_formatter_pcm.c
> index 7eba3a0205f1..b50306b0fc06 100644
> --- a/sound/soc/xilinx/xlnx_formatter_pcm.c
> +++ b/sound/soc/xilinx/xlnx_formatter_pcm.c
> @@ -280,8 +280,7 @@ static irqreturn_t xlnx_mm2s_irq_handler(int irq, void *arg)
>   {
>   	u32 val;
>   	void __iomem *reg;
> -	struct device *dev = arg;
> -	struct xlnx_pcm_drv_data *adata = dev_get_drvdata(dev);
> +	struct xlnx_pcm_drv_data *adata = arg;
>   
>   	reg = adata->mmio + XLNX_MM2S_OFFSET + XLNX_AUD_STS;
>   	val = readl(reg);
> @@ -299,8 +298,7 @@ static irqreturn_t xlnx_s2mm_irq_handler(int irq, void *arg)
>   {
>   	u32 val;
>   	void __iomem *reg;
> -	struct device *dev = arg;
> -	struct xlnx_pcm_drv_data *adata = dev_get_drvdata(dev);
> +	struct xlnx_pcm_drv_data *adata = arg;
>   
>   	reg = adata->mmio + XLNX_S2MM_OFFSET + XLNX_AUD_STS;
>   	val = readl(reg);
> @@ -636,7 +634,7 @@ static int xlnx_formatter_pcm_probe(struct platform_device *pdev)
>   		}
>   		ret = devm_request_irq(dev, aud_drv_data->mm2s_irq,
>   				       xlnx_mm2s_irq_handler, 0,
> -				       "xlnx_formatter_pcm_mm2s_irq", dev);
> +				       "xlnx_formatter_pcm_mm2s_irq", aud_drv_data);
>   		if (ret) {
>   			dev_err(dev, "xlnx audio mm2s irq request failed\n");
>   			goto clk_err;
> @@ -663,7 +661,7 @@ static int xlnx_formatter_pcm_probe(struct platform_device *pdev)
>   		ret = devm_request_irq(dev, aud_drv_data->s2mm_irq,
>   				       xlnx_s2mm_irq_handler, 0,
>   				       "xlnx_formatter_pcm_s2mm_irq",
> -				       dev);
> +				       aud_drv_data);
>   		if (ret) {
>   			dev_err(dev, "xlnx audio s2mm irq request failed\n");
>   			goto clk_err;

Reviewed-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal
