Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011067.outbound.protection.outlook.com [52.101.52.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485A42E03F1;
	Wed, 12 Aug 2026 05:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786514322; cv=fail; b=oHvvfMYvN6tmOqI+Hvi2HLXbNunCWFK+Os9FftvlY8X1OFkyqJBfzKsWFVuJDHPdb/bi5f+nODTLh7Fa6E7J2aZ1b/1w0qPouih4OliyGVH0eux+199rL31zI7vbxZTK4y8On5CQtgke16e/TlagFgJlh2iP16yEdg8YqKvjE3Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786514322; c=relaxed/simple;
	bh=6F7Sj7yJdDC6rfEhBXxvKmiOfcpkUF7IeQrJ0SHLcrY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NxUnyZ2kkGoQf7dq3NJrMlNkBOQnT9cQjfY5Djvh9WuYW4xj6O3j+OZSkneJVHAD4QQx7tIsOuWO5oJMz9HJ947O7ybCvuZ1agRAQmav+KOOC8wneSfFOKBDZ4CoHz5VLXMBjQwAjF5N1GZ0XIhrBM3bwuYkUEKxrxJRbcjmcCk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=I5jK+POD; arc=fail smtp.client-ip=52.101.52.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="I5jK+POD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=twZs21NgdkyKT3q9/pTeBGNXdpL86hqqSTm0j2NEhFIUQug4N51422fj3tAk7eGx7aICKxhru31wYD9Hrbtb1/S9qmThksDv+FG5MISXyZ4VubmAU1o/mjhPOOjCkbGbx7AbRdpEAuhZwr5tdzvqyyW8sJWEWftu8rSwsbiQqnYYi6Hg01Yj7qrNn4kx+KK6fH76J3yRAVtT1sOt8k2lxiOp2wIGg3I88pPygeGwGbU8jSFuxxVdP5DvktYccZGIx2rE6S8RXFFeTH8C8ofO3gqUWQPF1RkklCYvFdoY0T9/z9Md62/aFfnDURv6iv3HJ88K1120iFvz43wrclsB5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J8dnI9DfemgzfDz4ohky/ymnaHKWfTkL1bF6txVN92Q=;
 b=JnXI+u7eT3L1ppPKn4dCUjwTdXz0i/W+aCW8b/LtjhSgxm4xu1z5v4pvMvOax5itvwBeJCa/Hrqkrf5LoenZIDchNJq1F5OvUtKeyYTlZnfSciE29cqcHf/lf3OuztHCgFMgP8PmPKXWl4Oes07BEF3GEesktooej8epcgkG577avxPveBm8UoW2RDMSMvq1bUF2dGXcy91BW7kwGybQhQ+Kr86hCuw/iPLRTIG3uPCp+CJtR6weElxzdmm6KASpMLXPQpfWTIvt1mMDJImtlnW3TJB5uNgeJJnOC/XFmXT+xQFzIpP3KKuh/+WERQ5pFMDv7shG7Isb9fmN3jvzIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J8dnI9DfemgzfDz4ohky/ymnaHKWfTkL1bF6txVN92Q=;
 b=I5jK+PODT3xYFZHKx6h79Y+JVWcGPOBhoj9tbhxwUHyijTB9ddaPWDpuGZJplz6hV3Cfi5We5E5fBUiq731BjJpaU8duR+5omtz5rdayPVS06EgIowRmMMa3m88omewXoFej7MDLe6/FUPlSngyNbY9pCjBZv1bZYZbeX44sDC0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by PH7PR12MB7968.namprd12.prod.outlook.com (2603:10b6:510:272::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Wed, 12 Aug
 2026 05:58:35 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%5]) with mapi id 15.21.0292.024; Wed, 12 Aug 2026
 05:58:34 +0000
Message-ID: <647a44e4-babe-4858-84de-ad26b6711ba2@amd.com>
Date: Wed, 12 Aug 2026 07:58:23 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2] ASoC: xilinx: formatter_pcm: use more devm in probe
To: Rosen Penev <rosenp@gmail.com>, linux-sound@vger.kernel.org
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 "moderated list:ARM/ZYNQ ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260811185013.26960-1-rosenp@gmail.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20260811185013.26960-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0102CA0031.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::44) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|PH7PR12MB7968:EE_
X-MS-Office365-Filtering-Correlation-Id: ea0e5b79-9246-45c5-0413-08def836be7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	4wvZSFaYOqg2XkYfr81nL5gXkJyH12f++Vewijv6aPniDrOVakyS87fWZq8Oxf48meLwlUjRwLjg+ssY8tsDCj3hyseKU6Jf5AezntKqnPR9bCSXEhhegcGq0RELTX/vKNddhBXmT+vDHFrrQ5q1kltcReq30RhHPJJTFVG8407Uba2PVJbQuFR1k+gtOiw+GoB0nI9zG6/KkBluo+xe1ZKfz+39hduLOZVs4l3twMD4S1ZxwqslnKRvi4xXxhZYbMm2BBcHF5W1x5k/in7oz/3uwof369F2Ya9ITt7Cnq/+mW9NVV/o/fLfWsjpQPuMdeV9JPLBt+OYZQf/i5ItUWKuvBs1EDMTUPAw4DikNYzD7+4O0LYW0P2esbtxmB1nytE7pTsboxQFH0DFrO+HyYmSCPNIhrpISZuXUbnTndYq9mw3Vi3hdxVo2bZ4xOQY7XLtkvLS4BRoEbc24m6LtNpcfPceJkWkeEwJRAucmG+x1tzpX1RE8f1u2IrJJf3bmgg2zLIeordBAn3zNCjIEnKiMsRh23YudwNZ+mIQ9RTL9hg6kq82dC+55ae09jNUXotGynM3gaEAft+GBqy6Gv7ZTnF+FJlchPdlAbth26crklfQbFHeqCE6+rQuwMJGfbChQEirH95vbWF6l4g0AqOK/hL1+oKtPI4/udh6CL0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QXdpOW9id0c3UlRQOFVxTE9aV2pFUk12MFBZdTRwV0Y1RkNNWXR6ZjNiRmRS?=
 =?utf-8?B?RTltem1yOFhaeC9tZExGYk5PVnRpRjNINEZjNnhTOFRGa3YvL3NFVHRtQ0VQ?=
 =?utf-8?B?L2U4OVQ5S0MxenptcnFUdHVQN0tMdjVUWnJ6eE0vVDB2YmFZWlA3VUdNaFVv?=
 =?utf-8?B?NUZwTEhxUzFoUmZSQjc4cERVRnNCUlBBSEYvTTFRdHBWOXFlQTFid0pvVkRH?=
 =?utf-8?B?ZjFvRWZsdVdDQVkwR1VEdHdjNGJhZDFsZnFicnhHcjdJaWpWZnByNXM2SFB2?=
 =?utf-8?B?dlRmdkRMVFp3dUJSYzRaWXhaekkvZUw2RlJMeUJCcUdaQmpvYWhLNlpkQnRE?=
 =?utf-8?B?azRCSWhuZm5ucHpuYVNPS2VzQXd3Y2c3YUZWOFdKcmswTlpaK2pzSDJqWXJC?=
 =?utf-8?B?Tzd1cWJpdTcrY3l6RitBa0FyQlo0Wm42WFJsQm54d0NsUFd3YXVnakVPd2xz?=
 =?utf-8?B?SE5LY2Mza1pWMVhWUmlIalIxdkt4RlAvTkR2bDM5VjhIbkNKUDhoY25LNU1y?=
 =?utf-8?B?NUNwUG1NTUROTm1ZdmRFamUxcURzU0pyaloydmd2NVhyazhFTVdQV0lESnVC?=
 =?utf-8?B?emJCNkRNWWw0SURKYlBKNFpvSE13a3MweTNIRDZsaXZtbFVsKzFsS3BYVWJy?=
 =?utf-8?B?SmErNmdRL1R0Z3ZCMjUrdzVDYVZyY3lhU0Y5MU5GOWtGQ2lndEJEcytJQW5C?=
 =?utf-8?B?bm16YVExSWl3cVJjWW9mdm1LeDFtZVJvSi9KSnR6UjB0VmtPVllqazdYN1Vs?=
 =?utf-8?B?bUxhR09EUVZWZEJZNkNjSExUSE4xZmlJVDhkYkR2RytWNDhjL1poeGxDa01m?=
 =?utf-8?B?UzFmMWUxcG0yZWVYMkl1NUx6VHpzOUwwa3Q0cG5VZFc1bmpETHlVMXVJQklv?=
 =?utf-8?B?alI1RXBwc2RBZ2pUc3h3NWFWUnNGVzgxVDZwNS9UT1c1d1RXV3dDQXc3SU1Q?=
 =?utf-8?B?eUtPU2RwM0lUK0ZWNFA2OUp2QWxFSDg1L0VvdWhSRVRsTG9ZdVk4K0wrb1RU?=
 =?utf-8?B?RWlTM0g0WXVtd2c4dnBpNDVoL0RQYk16WWh1OEs0MEd2eGtOTjhXMTJoa2l4?=
 =?utf-8?B?RU9yTmJuczVOcU5PK1J2ZlVpb2RYemU2SThzWGJJeExTVjh5MVRhWWY0bW90?=
 =?utf-8?B?RnZYdEZKWjlMNTgxRHNOV0F6RmNoK1BVd2JpSUdxamJSa2RaVnY4cUZ3REpD?=
 =?utf-8?B?NmxkQkVWYTRzdFJwK3YzWXhTenE4ck56SjhDNno2aGkyWnJFREFvKzlFRnU4?=
 =?utf-8?B?Z21OWDUwcVgxMkp3Wi8ycFVlNy81d2t0VnJyb2F2U2hIUHQ1RlhuNnhWV3Yy?=
 =?utf-8?B?OEI0WUttKzZISXNUL3k0dlY1V2FCTm93Vk9RMGU1TWx3aG10S2M1bVB5Wmsy?=
 =?utf-8?B?QUdBR2RmdlJrNUg5WEpoNTZwYTJFUFYvdUpQSWRDbWgwdnVKNHdacG9DVk5n?=
 =?utf-8?B?MGcyTmxHY3hjaHN1QzNrNFNvbHNRcU1qb05vcDg3eTJWaFYrK2grWjhNa0ZX?=
 =?utf-8?B?aElCYWFtWG0vWEI4dFBpbnpnZkhidUNmaG9DemlzaXlmUWxyU0Qyd0RnRHZu?=
 =?utf-8?B?OVNMeGZLZjVRU3BMYjlNeFlGbXZzZjl3OVo3RThrRnJWN1plZTlTUUxBbDRW?=
 =?utf-8?B?cmtJV2M2T2U5OXE5a0l0QWVaREdOclF2U0JOSCtuWHdCMlpVTDdXMG5MQjlV?=
 =?utf-8?B?SFNhRWs5SFQ0bERvSDVnNnZlZmhGQ1M1RS9vL0F1OGtIZGg0KzByYm5QTEtU?=
 =?utf-8?B?UzdCMU9JYUxhRk1QbmFTbHkyR1doMTRZSEs1eGsyaVhkaTBMYWJiY0R4R1kr?=
 =?utf-8?B?ZWcxZmE2U295Z3pFMHVXQjhzeTBHaVF1OHEvSDI5RFFUb2pmTzE1bEY1U29B?=
 =?utf-8?B?dStSR0J1RUFwTlRVVVdQTlAzdFJLTjhpN0hXNGhqaDNWN0gwM1UvQXEyREJn?=
 =?utf-8?B?OWRjMVVlNGZsYkx3L2lkWVNyd01SYWlxeHcxVFVxTFRBOGY1Y3dWRy8xbjU1?=
 =?utf-8?B?S0RINTl1U3RZVDJjM0N3cTlxWXI2aUh5bHJ2MWhXQkRmQ3E3bVNiTnFMUkln?=
 =?utf-8?B?ZFBqdDdLUUwweEg2TGV5NzF0WXdCemplZEVMNDk2VkdrS0VWdnVSa1FlVTF1?=
 =?utf-8?B?SFJjR2hXUGlkdVNlYlVaS2NCWUJKeURWMy9jYkZ3THFtNk5VSjBKcTNMZy96?=
 =?utf-8?B?Vno5SncrOGlCTlNkVVQzNmhlY01TcUcyT2Z0MUs1WDMrWXB1UG1KUzQ0Vmhm?=
 =?utf-8?B?eit1NENOeGo3TEQxV3ZMRGhNTTFVL3F6UUpFd25hdEt4NDJON2pzWENIQ1Z1?=
 =?utf-8?B?cEM4ODlqYVQ5eEFpYzJHdkxWZUN3UEVlWU8rTWJTU2RaK3RNLzJTZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea0e5b79-9246-45c5-0413-08def836be7d
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 05:58:34.2535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SfXbwLKjuJJNvn6+SIQQe3wBBDT5AHqFmrtr7kYEUArDJLtdSsSelxDiZ232Osk3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7968



On 8/11/26 20:50, Rosen Penev wrote:
> Use devm_clk_get_enabled() to let the clock be enabled automatically
> and cleaned up on unbind, dropping the manual clk_prepare_enable() and
> clk_disable_unprepare() calls in probe and remove. As a result, move the
> clk struct member into probe, which is the only place it's used.
> 
> Simplify the probe error paths by returning directly instead of
> jumping to clk_err, and use devm_snd_soc_register_component() return
> value directly. Also remove error message from ioremap as it throws one
> itself. Same with devm_request_irq().
> 
> Assisted-by: opencode:deepseek-v4-flash-free
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>   v2: add signed-off-by. Further clean up some stuff.
>   sound/soc/xilinx/xlnx_formatter_pcm.c | 70 ++++++++-------------------
>   1 file changed, 20 insertions(+), 50 deletions(-)
> 
> diff --git a/sound/soc/xilinx/xlnx_formatter_pcm.c b/sound/soc/xilinx/xlnx_formatter_pcm.c
> index 3d6f1e4046d8..eb878c75e293 100644
> --- a/sound/soc/xilinx/xlnx_formatter_pcm.c
> +++ b/sound/soc/xilinx/xlnx_formatter_pcm.c
> @@ -82,7 +82,6 @@ struct xlnx_pcm_drv_data {
>   	int mm2s_irq;
>   	struct snd_pcm_substream *play_stream;
>   	struct snd_pcm_substream *capture_stream;
> -	struct clk *axi_clk;
>   	unsigned int sysclk;
>   };
>   
> @@ -596,30 +595,19 @@ static int xlnx_formatter_pcm_probe(struct platform_device *pdev)
>   	u32 val;
>   	struct xlnx_pcm_drv_data *aud_drv_data;
>   	struct device *dev = &pdev->dev;
> +	struct clk *axi_clk;
> +
> +	axi_clk = devm_clk_get_enabled(dev, "s_axi_lite_aclk");
> +	if (IS_ERR(axi_clk))
> +		return dev_err_probe(dev, PTR_ERR(axi_clk), "failed to get s_axi_lite_aclk");
>   
>   	aud_drv_data = devm_kzalloc(dev, sizeof(*aud_drv_data), GFP_KERNEL);
>   	if (!aud_drv_data)
>   		return -ENOMEM;
>   
> -	aud_drv_data->axi_clk = devm_clk_get(dev, "s_axi_lite_aclk");
> -	if (IS_ERR(aud_drv_data->axi_clk)) {
> -		ret = PTR_ERR(aud_drv_data->axi_clk);
> -		dev_err(dev, "failed to get s_axi_lite_aclk(%d)\n", ret);
> -		return ret;
> -	}
> -	ret = clk_prepare_enable(aud_drv_data->axi_clk);
> -	if (ret) {
> -		dev_err(dev,
> -			"failed to enable s_axi_lite_aclk(%d)\n", ret);
> -		return ret;
> -	}
> -
>   	aud_drv_data->mmio = devm_platform_ioremap_resource(pdev, 0);
> -	if (IS_ERR(aud_drv_data->mmio)) {
> -		dev_err(dev, "audio formatter ioremap failed\n");
> -		ret = PTR_ERR(aud_drv_data->mmio);
> -		goto clk_err;
> -	}
> +	if (IS_ERR(aud_drv_data->mmio))
> +		return PTR_ERR(aud_drv_data->mmio);
>   
>   	val = readl(aud_drv_data->mmio + XLNX_AUD_CORE_CONFIG);
>   	if (val & AUD_CFG_MM2S_MASK) {
> @@ -628,7 +616,7 @@ static int xlnx_formatter_pcm_probe(struct platform_device *pdev)
>   					       XLNX_MM2S_OFFSET);
>   		if (ret) {
>   			dev_err(dev, "audio formatter reset failed\n");
> -			goto clk_err;
> +			return ret;
>   		}
>   		xlnx_formatter_disable_irqs(aud_drv_data->mmio +
>   					    XLNX_MM2S_OFFSET,
> @@ -636,17 +624,14 @@ static int xlnx_formatter_pcm_probe(struct platform_device *pdev)
>   
>   		aud_drv_data->mm2s_irq = platform_get_irq_byname(pdev,
>   								 "irq_mm2s");
> -		if (aud_drv_data->mm2s_irq < 0) {
> -			ret = aud_drv_data->mm2s_irq;
> -			goto clk_err;
> -		}
> +		if (aud_drv_data->mm2s_irq < 0)
> +			return aud_drv_data->mm2s_irq;
> +
>   		ret = devm_request_irq(dev, aud_drv_data->mm2s_irq,
>   				       xlnx_mm2s_irq_handler, 0,
>   				       "xlnx_formatter_pcm_mm2s_irq", aud_drv_data);
> -		if (ret) {
> -			dev_err(dev, "xlnx audio mm2s irq request failed\n");
> -			goto clk_err;
> -		}
> +		if (ret)
> +			return ret;
>   	}
>   	if (val & AUD_CFG_S2MM_MASK) {
>   		aud_drv_data->s2mm_presence = true;
> @@ -654,7 +639,7 @@ static int xlnx_formatter_pcm_probe(struct platform_device *pdev)
>   					       XLNX_S2MM_OFFSET);
>   		if (ret) {
>   			dev_err(dev, "audio formatter reset failed\n");
> -			goto clk_err;
> +			return ret;
>   		}
>   		xlnx_formatter_disable_irqs(aud_drv_data->mmio +
>   					    XLNX_S2MM_OFFSET,
> @@ -662,34 +647,21 @@ static int xlnx_formatter_pcm_probe(struct platform_device *pdev)
>   
>   		aud_drv_data->s2mm_irq = platform_get_irq_byname(pdev,
>   								 "irq_s2mm");
> -		if (aud_drv_data->s2mm_irq < 0) {
> -			ret = aud_drv_data->s2mm_irq;
> -			goto clk_err;
> -		}
> +		if (aud_drv_data->s2mm_irq < 0)
> +			return aud_drv_data->s2mm_irq;
> +
>   		ret = devm_request_irq(dev, aud_drv_data->s2mm_irq,
>   				       xlnx_s2mm_irq_handler, 0,
>   				       "xlnx_formatter_pcm_s2mm_irq",
>   				       aud_drv_data);
> -		if (ret) {
> -			dev_err(dev, "xlnx audio s2mm irq request failed\n");
> -			goto clk_err;
> -		}
> +		if (ret)
> +			return ret;
>   	}
>   
>   	dev_set_drvdata(dev, aud_drv_data);
>   
> -	ret = devm_snd_soc_register_component(dev, &xlnx_asoc_component,
> +	return devm_snd_soc_register_component(dev, &xlnx_asoc_component,
>   					      NULL, 0);
> -	if (ret) {
> -		dev_err(dev, "pcm platform device register failed\n");
> -		goto clk_err;
> -	}
> -
> -	return 0;
> -
> -clk_err:
> -	clk_disable_unprepare(aud_drv_data->axi_clk);
> -	return ret;
>   }
>   
>   static void xlnx_formatter_pcm_remove(struct platform_device *pdev)
> @@ -706,8 +678,6 @@ static void xlnx_formatter_pcm_remove(struct platform_device *pdev)
>   
>   	if (ret)
>   		dev_err(&pdev->dev, "audio formatter reset failed\n");
> -
> -	clk_disable_unprepare(adata->axi_clk);
>   }
>   
>   static const struct of_device_id xlnx_formatter_pcm_of_match[] = {

Reviewed-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal
