Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010061.outbound.protection.outlook.com [52.101.85.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C83318B95;
	Tue, 17 Feb 2026 22:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771367232; cv=fail; b=MqSpkdVFEcKDptkKnl0E0GbyMyPrcTEpqOEPRRwIIVUhTA5veesPS5Xaag9KXJQnyPRfKvJVmriczSDQvAGYnvSQW7uW7Y17H2MkckDpuOQo+p4paLaO2Zlr631z3eZXA7yKdzLLGmuyN4Vc62t7q57tZ2M2qnKavISq1zQU+FE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771367232; c=relaxed/simple;
	bh=eG2rVPv4wYkFiKBSF9wXt2UIaBLt6eR3GdPL73NW7dE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=DoN8Z9wl4+d553dlYCU5pOxcv6b8mFtWid8NlvW2cap9mDs4cW8C5i96GJgWBQ1ODwXf0BmW9eCuMpdEzbArOaq9dAMV211XUz3CsWnv8CI1CFyf/bWH+nWgh0rarOKSU3hr6fc7lXbxT754spQkgZuBs/CkMF2GPmXxqely+nA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=f/alUl+9; arc=fail smtp.client-ip=52.101.85.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="f/alUl+9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oyLcg2JH1xYD7AgpY2s9eu7jGwnJhyMTX1qs4LZ/3nRN+jl612IQC4tyu4+xOKv/dERzpIlSGuRIEbHDWdMYu0DtTYA6ukGwzZ/wgOIaJ1GyEA92wDZ8DTAF0if6unD2ATmXZL5S6cT67Ppq6PTSau5tnrnXemQ/LqLIM0vnxTpCb1RmlM+c3/mXVAOlngPq0sZYjRsR6AVrARZEpVF8HpG1WQqdg+PEOWAv62NGthzIiRwHxr4PTExA8fuC/g1F5hL/WAJqvJbeJAOMZU1gESCwMelju2qzhual7RnCa9mE2QbtIeR6g5pKw+P9e6bYr8W6I2OsA6s647qK4yrQZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P3wOSy1tIc/smxZgZIInzR6HIyUOMtM/v1OMu9XLGUw=;
 b=ALr9ZB33jkpbicNniB87B2rNsKOSGrvzCqHweY6Hbb9db+qkWvA6NLo+AgwMgCZ+vaycyfTDyqlEiQxwZfbVHDSdmny1AJg2BJtNTgCpEkL0UJ1hvfuLWBPX1UeOAXyWifh71XBWpdGWGMT5+I6nriitnE1hvV918vD6AXGxdKL0M82AAjrqcGfqm+Fe8bUc6aoqXS8QvOgACw9gnJtv0xK12XZPLu+7nb274SgfH4I8cGwu4eJRydW18ec+Jas035Wy+GIsFs5/7fYtaYlzDFw5gwO/g0QxLWq76cUal6HPfq97d9NIs6OIFsqCEyhDdvd9z6LaM3psJELo4NAbuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P3wOSy1tIc/smxZgZIInzR6HIyUOMtM/v1OMu9XLGUw=;
 b=f/alUl+9bTnimd1AFluVvlClMnDGGsGFHUDI9ynJsYr3GS7KdDcZWziLyo4BvV0FO2pfsUPhdotZHwVhJ9ofE/biGAk1/7yrcze2voMcb6pwW3766/VPlJxCa/lJvW1bYR3MxEH+cv6Z+Z8LM4FV97dELOaUaCvSAHYGaqD586k=
Received: from BYAPR21CA0019.namprd21.prod.outlook.com (2603:10b6:a03:114::29)
 by LVUPR10MB997810.namprd10.prod.outlook.com (2603:10b6:408:39e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Tue, 17 Feb
 2026 22:27:08 +0000
Received: from BY1PEPF0001AE16.namprd04.prod.outlook.com
 (2603:10b6:a03:114:cafe::d3) by BYAPR21CA0019.outlook.office365.com
 (2603:10b6:a03:114::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.9 via Frontend Transport; Tue,
 17 Feb 2026 22:27:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BY1PEPF0001AE16.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 17 Feb 2026 22:27:06 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Feb
 2026 16:26:45 -0600
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Feb
 2026 16:26:45 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Feb 2026 16:26:45 -0600
Received: from [128.247.81.19] (uda0506412.dhcp.ti.com [128.247.81.19])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61HMQi8F3573069;
	Tue, 17 Feb 2026 16:26:45 -0600
Message-ID: <52ff9d7c-7a62-46d0-a432-d51b29edc0d6@ti.com>
Date: Tue, 17 Feb 2026 16:26:44 -0600
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: ti: davinci-mcasp: Add system suspend/resume
 support
To: Sen Wang <sen@ti.com>, <peter.ujfalusi@gmail.com>, <broonie@kernel.org>,
	<lgirdwood@gmail.com>, <perex@perex.cz>, <tiwai@suse.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <devarsht@ti.com>, <r-donadkar@ti.com>, <s-jain1@ti.com>, <m-shah@ti.com>
References: <20260211221001.155843-1-sen@ti.com>
Content-Language: en-US
From: Kendall Willis <k-willis@ti.com>
In-Reply-To: <20260211221001.155843-1-sen@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE16:EE_|LVUPR10MB997810:EE_
X-MS-Office365-Filtering-Correlation-Id: 0619457f-acec-4ce9-46fe-08de6e73af11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bGNTaXV6elA5N0JSMGo0dDMvc0h0am1wd3BoUmI3RU5mdUZxcVplMlo1N3Nu?=
 =?utf-8?B?enYyMENCZEhNZnhXUXFId0RRckRiM1RiUzNzRmxpdTlvMzB3WXQyeDR3VERV?=
 =?utf-8?B?VE43cnFLUytiVTZydDFrVERLaEtoakZ4Wk9PT0Z5TXlTMEdrcTZ3TEhhZzkx?=
 =?utf-8?B?dk5KWUpWb1EyRG84RUpmWlBMVHJvVkVpTytVaUx4WHY2emxuZjcrZm1vNEJ1?=
 =?utf-8?B?WnhzZENYMzJkbUFlclFjUkF3SXBOWUlmZG9ybE05R0hlM1FsWXVhOXNyYjhW?=
 =?utf-8?B?YjhGcHVkNHEvRHUyT0s4TThzQk1WRWMwK2NzS2RwbkVWUTRXM0tPekVpZTEz?=
 =?utf-8?B?d1RRdlZ0MGxuUlVpNlB0SDZ3NVpQcjE0dkhYQUkyejQreStnQTRYaHo4cmZ1?=
 =?utf-8?B?WEthTnFPT2dZQ1BRUDgyRjg0Q0E2K0NKb0lWcDhYK3YrUWZleldiSGxpUW1K?=
 =?utf-8?B?ZlFvUFV2TU0vZlF1MHFaclhBWit3aHpkWncrSXk5bElQSFRWcUVDUDIvQ0xw?=
 =?utf-8?B?b2x0RWFHcGpOSnVzTVpmanFwSnZOWWthbVBPekhZSWNaeTl1Z0FLZTB1R2Vl?=
 =?utf-8?B?NFRHbDI3OFBndWpsT0JaUzFOR29YeDc1VHN4dUhJcUkyeW40cm9uNjduU0JR?=
 =?utf-8?B?d0wvMzNLa3RRTEhzMG4rbmZuZjQ5MERZTC84ZkdVendPUEYvdG5XN1hnRVdD?=
 =?utf-8?B?akVzNnRqZE9JdGM2dkJhVzdjMUZzTUx0bXVGK0x2Yi9kSjl4ejA0L2JCeUVZ?=
 =?utf-8?B?OFFDRklOYVFaa0RWc1NXdEh3MWJ2WlVYcHFRQkptRENFNzErYTk2U2x2a3Rk?=
 =?utf-8?B?TjlsbFBUMlUxekNhSFgxSjJSWnFraW45MjJZYTNGYTh4MFVHUWVDdGd3Nk1n?=
 =?utf-8?B?Sks3OWRpVTJVWjhLT1gyMGlKd1NkSnIyQmMvT0paM3ErM3VOZlJoY0RuVUNn?=
 =?utf-8?B?VUFRdk9uTk8wV2NiM1BzbmptajVpZE5ka3JJSXFGRkxnOXZCWDhreHlUbkxp?=
 =?utf-8?B?eWZONi9PaC9aSmNRUm5hM3pJVzZDeDFUOFRhVUhPSGRMcmh1ZkNrbkhpeGhO?=
 =?utf-8?B?eHd4Q0drdlpTMDlBbU5lUm93NjRibWJTdUxBSFhZZHlGR1FyNXQxSXQrbm9N?=
 =?utf-8?B?dG03elFsbjRtS0IveGZka0grMmN5TnpZdk1MTnFSN0h5NDIwOThxNXFQQldt?=
 =?utf-8?B?L3puYUVMVjk2K1B4YWFMQ1NRYnE1a0llOGd0aUxXNHRNeUtIQXgxc0hvdThH?=
 =?utf-8?B?S2NnanFneURHR2pUYVNaMHp0Uld1VWhuTmg5ZU5Hc0FtN0hqaW5vVk9UUTRI?=
 =?utf-8?B?MWhESXJhc0kyK0hWdGVFZTBkOWJVVDhaOGJtRE1JRXMrRmdLNHNCb1gwaW5N?=
 =?utf-8?B?YnlpQVYzZkx5MVFFcmdQSjd0NFJ5Um0rZkFSck5jdE9aTlE4TFY4bzNOTlZp?=
 =?utf-8?B?YUNUdmdrSGk3ZkFjNDZCemIvRTlQWUpDYlJJdm1jalJvbWFmRGlHV1JSZ09W?=
 =?utf-8?B?SHlwZ3dHS1F5eEpTWjZHRzN0VFRhV1lMQm1QUW1YS2EwZEMzNkNScHU4NzJC?=
 =?utf-8?B?L0FYMTBzV1BUU0hrZjRpbG1HRnpLdWphZENLMEV3VThQbTJNNTdrNUZjUXdm?=
 =?utf-8?B?N1g2QUFIWXZFazdXUXQ2Tk5xNGpvaE8xemlOWmo2NmsyTFFXVUY5L2RkMkM2?=
 =?utf-8?B?Nm5mU2d0VDhmQjBYSzNxU2Z0TUJOYitkN3dPdnVkNlRlWEpYUDZTUVQ2aENT?=
 =?utf-8?B?eTlidWdIVGNIbGJnMEI1by9Ia1ZKSnA2VkFuZ3lrZlYxYVkxbmRJZWRwbHRX?=
 =?utf-8?B?VjlxTkU0RjN0RS83Wk1INXhHV1RDd1BESXN2QmpqczlHVWVYaHJRT3RDclQ3?=
 =?utf-8?B?VHAzU01Vd2FFVlRQVDhEWkxNRytmdW1lMHUwZW9ER2ptVE00RUlpNTQxUTRF?=
 =?utf-8?B?OHg5U1greXhYNkh3YUptb0pONkRmMmRSZHk1bFNTVDlwVDF1Y3JiZ0FqUjJl?=
 =?utf-8?B?Qk0raDJGaXpVQXl1eFk2YjZ0TzRMTTc0bkRRNXBuS1JiQmZkZ0pHbHhzRjB3?=
 =?utf-8?B?U2hjd05HVy9QM0M3SktjYU5uWHVhd3hibXhYdjhpamZqeXhTN3pySGNOUjky?=
 =?utf-8?B?d0dIeWZaSThHZVlJbnh4ZHUzZjZwR2N1SldwNysvUnZkQXV3eDV0dzkvRlZ3?=
 =?utf-8?B?Mmc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+OW6vVPIdXpLSw6DmQGTu4fAyD5PNYByhPs4Z64spmag/UtSdgnh+RHhL1ZIdzZGsvWd54xtx/M+a82VHJpvA23TDqw6XdHN+Sz2FgPH50YhaVH2VpQGPWwaF5HY5gGeR6ErJgOwr6x2dXocwZhbOLbLmEulhSMTgALcJ2VS7sA3DAuv5WNbzaBMqzVZxyS9O+5gKLSS4t2+qSG13aedCQRqmLSnU8TeXb1gFbKSW0OYdueVrdYhEMsBWy62fZzOQJvwX/Q3mW9KBPcamvHJo5yPJSRM54jjz67FhvqsdpJedDADhbXwmdfXXkD8aaiEsTJ9zOWEXnbie8wKGAVCUfXSjP0eWvV7yY/p2kw/PBkND/Ivogns7+o7KrL1vHHaXhoV+LkJRbiHOoaggOa/9bXGkBBUHvaMBoq46O5beYWj4GOY6SZBsGtAc6qMMiRW
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 22:27:06.9275
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0619457f-acec-4ce9-46fe-08de6e73af11
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE16.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR10MB997810

On 2/11/26 16:10, Sen Wang wrote:
> The McASP driver supports runtime PM callbacks for register save/restore
> during device idle, but doesn't provide system suspend/resume callbacks.
> This causes audio to fail to resume after system suspend.
> 
> Since the driver already handles runtime suspend & resume, we can reuse
> existing runtime PM logics.
> 
> Signed-off-by: Sen Wang <sen@ti.com>
> ---
> Tested on SK-AM62Px with audio playback during system suspend/resume cycles
> 
> Testlog:
>    https://gist.github.com/SenWang125/065c2840071f2569a79db9e99010603f
> 
>   sound/soc/ti/davinci-mcasp.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
> index 8a2977093df1..643661ebee83 100644
> --- a/sound/soc/ti/davinci-mcasp.c
> +++ b/sound/soc/ti/davinci-mcasp.c
> @@ -2811,6 +2811,8 @@ static int davinci_mcasp_runtime_resume(struct device *dev)
>   #endif
>   
>   static const struct dev_pm_ops davinci_mcasp_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +				pm_runtime_force_resume)
>   	SET_RUNTIME_PM_OPS(davinci_mcasp_runtime_suspend,
>   			   davinci_mcasp_runtime_resume,
>   			   NULL)

Reviewed-by: Kendall Willis <k-willis@ti.com>
