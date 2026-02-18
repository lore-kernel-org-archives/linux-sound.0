Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010027.outbound.protection.outlook.com [52.101.46.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E78C33BBD7;
	Wed, 18 Feb 2026 09:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771406831; cv=fail; b=ePsXr6cc6XSpvKgP8obDMOpdq8zhL9zNtBGPkgZEMXDGd1CO3CfPL+DwKuwewKcmMSYHRZGTGdFtAMxUVJmQq+RZ/Yuyw2rHyRoBZSWflHvC37T0ysAatarrsvyE7Ip4Q1BajHRYoyBMdf5K5RTIGVMoSjOPDZCekkQO2lmexMA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771406831; c=relaxed/simple;
	bh=JZqAdGFrLDfcAXhXwvdCTqD+EHdDsJvWLsajnrvHcPo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=NGFoiNdc1ilEKG7MOIo4brFzu6I2RGd+2oI8nrUmVz73CzF2ochyo7c7jLO2UY9AFlvHAiKRuBLsRfTHbG669tR09urCHXwf70SzIKb1eKPR8U6VUrTL5hrMnW3qrDizxDtWQ47DxUJ5abLCjKCoxrByWF2anbMoE+fldkT7bUY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=oAPZMbXN; arc=fail smtp.client-ip=52.101.46.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="oAPZMbXN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YidXzFwXJ1Zuae2H6d0Ul7k/XR+EW8MIcilXIyYRvq/ASn916Cq3w4AOggaqOUvNFhXSM64o5OooVVHZEU7EKsYX++xo8iCj1rNVyVzPxpMUOPfqvvGIghfC6l4iCYkslPEWmzGIjwU2PcXVtTLt7hUSBaQQltu3eKJ5ZC7UqYohQnaBINFR/qkllA6yc6ny+2cURCvb5TjMAG6MmQXzuCYFQCXOc07EuY77mBejbtfnYUe2Kd7Zl3Xrl6XobZdI1M55wiGILOHvqpLKyI6nfp4HXhdbRhDB4NqGFErAhNLptoNvg3J44D8tOxS4psBGYWVwuTg3PMJ+L/So/fN8EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UkEvnL+PZvaAn1UeL0b9A+pUHuOMXo0+UInxz3hrdXs=;
 b=bp7T9UwOrk/aLrTJWhtHnbmuLIek7c2UuYt/NM2FUHw1T1WOK1cFxi+8ifEJ5N/J+Y5vbJ4JL18fsLPpt4Le7NoTn9M6vhAaktl7QlTBgkLnORVd+id/Hqm84YBrKQDj4+5yaqjsCiz9BwYwwe6O5hmbeqPOtoo0UBBoVRc1EYmmmreW7MyzCDrXMkhHPz8f1Q3NQlObpwLjoD/1J5LhhDvpqD6V7LZJWojzPzNYQI5wY0mXmreaavgdUPfwIFZ/yUcSa+x+GC2OZghySVawr5zJTmEtfYGc4qrSCjqaB69qn1A0C1amMbQUHoBG7trZgSdwunjiUIuT2bZJyH20FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UkEvnL+PZvaAn1UeL0b9A+pUHuOMXo0+UInxz3hrdXs=;
 b=oAPZMbXNNMe/fXmzWGXs5+royQrRzugO9yVPiJWjNFTGo4aC0BgUc5XA3GJt0+y71oOexKa1lrWbQ/NOiLiubHu/sye8M5WVBkPd6/u7LhQQSGOFcsYehk+4VMq81QSnCUWFb9kyeaW1clWI1y8ASQDx6BAsL/NruULdRws8kJU=
Received: from SJ0PR05CA0028.namprd05.prod.outlook.com (2603:10b6:a03:33b::33)
 by IA0PR10MB7231.namprd10.prod.outlook.com (2603:10b6:208:409::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Wed, 18 Feb
 2026 09:27:06 +0000
Received: from MWH0EPF000C6191.namprd02.prod.outlook.com
 (2603:10b6:a03:33b:cafe::a8) by SJ0PR05CA0028.outlook.office365.com
 (2603:10b6:a03:33b::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.14 via Frontend Transport; Wed,
 18 Feb 2026 09:27:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MWH0EPF000C6191.mail.protection.outlook.com (10.167.249.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 18 Feb 2026 09:27:06 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Feb
 2026 03:27:05 -0600
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Feb
 2026 03:27:05 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 18 Feb 2026 03:27:05 -0600
Received: from [10.24.50.20] (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61I9R165169650;
	Wed, 18 Feb 2026 03:27:02 -0600
Message-ID: <ce225f6f-153d-44bf-a3f4-55fd9dd42ab1@ti.com>
Date: Wed, 18 Feb 2026 14:57:01 +0530
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
CC: <devarsht@ti.com>, <r-donadkar@ti.com>, <s-jain1@ti.com>
References: <20260211221001.155843-1-sen@ti.com>
Content-Language: en-US
From: Moteen Shah <m-shah@ti.com>
In-Reply-To: <20260211221001.155843-1-sen@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6191:EE_|IA0PR10MB7231:EE_
X-MS-Office365-Filtering-Correlation-Id: c6c35838-e1b9-4d02-4e14-08de6ecfe1f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cDBEcnBneWJ3MlBkTGNZakFTaGhPeXZIZDlncUVsSVRVUUdONlV6RVNXNUNJ?=
 =?utf-8?B?endmWHg5TFcrcy9FeVdZdWg1YjdCNW5rOHl1OEwxRm9wT3VleFo1Y2Q0c3U5?=
 =?utf-8?B?eFE4R3kvRXFYOXcwUktORjBrbzlsb3hIM2VLanJiRVdmSVNBNmVNVytCTUtk?=
 =?utf-8?B?S0hXZ1hiSExXaCtEYVlmTlRBWVlJa1QzNS9kMDJoTnVDR0E4bjJpbXBNMFR6?=
 =?utf-8?B?T3FpTjR6dUxxRjBuMjZ5UGNXMmFKQ3FLdTZ6TzFFN3BaR254QjMrMkNZZ2VS?=
 =?utf-8?B?OEhoTFlUbHQzZVBDdjU5TFg5cElKWjV5T3htWFhJMHlPamNXZmJPU1Rob0pH?=
 =?utf-8?B?TDZsK3VWOWsyb3E5OFVBekNkUzRJYW5ydjkzWnFQUDBaQ3EyeWhxNS9CUVRZ?=
 =?utf-8?B?VWdOZmZqd2did3NyeXRNREQ1dEtobWppcTF6V3V4Qm9WVHBMU29TVUVma08x?=
 =?utf-8?B?MnlLK2tTNG1maXBUenZuNzl4VHdkY0tGZ0hHN1REVGpNNkdWVzZabTlHMk9G?=
 =?utf-8?B?bnZIRkg4VkdMenpoem1OMTkvaDBBbWlVbjNRdUt4Q1k5NUw0ZDdEaWMxK3VG?=
 =?utf-8?B?K0EwOWRNcm9JLy9PNmtraDZodlJvL0NnYnFDazZ5Unhha1FkalpZOW92WUdY?=
 =?utf-8?B?b3ptc0U3VC92dDFkQ3pXMlppWTVlVDhZZHV5dFBwY3NCcFlTWHhCMk5SNG9B?=
 =?utf-8?B?eGk3TnRjRFVDVldtRlBmc1RObDEram13d01mL0hxZ2NHYlM1UUJZSWVWRHB4?=
 =?utf-8?B?S0lmN1RCaEtES3FlNXZTWXF6SUgyemc2ZE5tQnhPQ2VlUENzM2hvWmtCSFpQ?=
 =?utf-8?B?MHZoWnBjTUtMWCtxUGViN3FIOG1iYmpDUkdLNURhME9wNXhjQ2sraUlObUZv?=
 =?utf-8?B?ZC9tcThZZ1JTdUQrV2E4Znk4L1d2OU5tUGQ4aytNSklmSzNjT1NqeFlORW5C?=
 =?utf-8?B?aUVVSnJFSTFHeU1sRjNmdXprcnNqdUd3dHRra0lzeDJ2dW9YMng3eitrWCti?=
 =?utf-8?B?R2lLamRjU0s3SnZTKzVWcWV1M3RJd01PeHF5OElxdDhDR3dpakQ4ekNrb3dn?=
 =?utf-8?B?dXF1cU1sdFB1dGRMNTZGMDFicFVjUGRFaTdBWVlvWmlTK3dRK21qQjI3K1cr?=
 =?utf-8?B?bXA2bWUrTU1qZWxGbFlYUjhBS3VSYXp6alcxYTJhdW1KY1VXN0plUWtaYjF6?=
 =?utf-8?B?bTYyT0RGV3NDNjRRdTNoZ1BVaVlvc2o2OEwwVVlPUzF3YUVIT2EzUkFSYjZq?=
 =?utf-8?B?YXh5S0VLSkVIcU8xTVRCNDRBN0xrNFZpcEg3ZS9ubjIzSG1UZnUzNkJUK1B5?=
 =?utf-8?B?a0gwVXhvSWZneWtLbk1JamVFK2MrNXpWa1dHalRwblBCd213eXNZL1JHR0gz?=
 =?utf-8?B?TFdJL1c0ZEVXbEE1aEk3MHllL2VqdzhobGNFaVplcWJabWxKV2QwWVJtS3N3?=
 =?utf-8?B?NUZLWW5uTm5Uam5DT28rQWMzd2x6eFBTenBjN1NpUmZ1enAvRW5qOUUrRGZs?=
 =?utf-8?B?dEYyN2NDbFlhczlNdFJzNHFITFk5LytsWG5wdFB5UU1iMHNMRjBkeXVYckNo?=
 =?utf-8?B?STRZaXJjSmtJSlZHNjRMb0psdS83VDk1VGZhaThCdENMUkNJL1craHpORmJB?=
 =?utf-8?B?SisyMFBPVFZpZFJiZFU0QklTSVpHTkdnSkkzbzR3YVpUTWRJb2owbzE3RkZ5?=
 =?utf-8?B?MGhiK2FTUXk3UHVOK2xIMEVBcUo3QjlXS1pNSjhUQjdTNGFmVG4rbTJBaTE3?=
 =?utf-8?B?YnU2UEZ6Zzl6bXg5Ykc3SFFOQU5uVnRoRnNIT25ORWE5ZmRraWV3Nzc0a2lI?=
 =?utf-8?B?SDdkcUYxOXlCWnhSSzAxWWxYakxZeHpmRmVYTXplVUliYVZpS3hCRzB3NWcx?=
 =?utf-8?B?ZkRZTG9HSmx2Z2htYmZ6VkRQWE5rL0twQTVxSXJwQ2lCeGdDK0dSN05oNW1E?=
 =?utf-8?B?eFlHeUZoQ3VzQWwzUHRVeVdpdUoxWGF4NE5VZ3diTXQrZVNkS3RuZGpuaTJ0?=
 =?utf-8?B?QXphT29Hc2lyWmtUS1d6azB4U0hzWS9UMFRNbVplazBmdU9aNHBGTFl5VDlk?=
 =?utf-8?B?emg1SDhoTTZpMTBOQW9kTmMvS2JSdUQ3c0dVMzV4aFc4S0pySzczOVM5SXVQ?=
 =?utf-8?B?MG5CYkRCYk5MVEh2QXF0V3Q3MHArdk1ESUFUQk8zOWovUGd0RUZ3aFJqc0l1?=
 =?utf-8?Q?JLgESy0aaG0XlVn26ZYc2xM=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Fv3WBs6mhGXO8SWW4Uq8ZumFTwTqQd/xM81mjn13YyKpQ6wdskAlknDOGmianVHrec8VcVDZLlUEEZrwxAnqKz53Nx2BpqeaszknBzwK2SdnKWo6u6CkWxVmwgfGpVpkonGugTzevd5yoj3H+HoaURL5U1cnHbWWuKh/V1FzQviuQZjsZqTX9EqNZJ3prnYxE8Oq6CM6R4AjqxSv/aYifzzA+ciDVfC90rPeXHQYIlILimAW/FSsvd5wvFiJEhxSKsPZKvMpElOaGbxEIe5uSZTYiAlM+QupW+WtnEl9p6LbRjbcR+eShJD0yDClR0yNave5ne7eol1ifiaESqldu3Z26Z38HJpQGSuYFIm0w1V+sxV1tufK6EeqOd9/Ne6XSGMLf0RfHm0ZOjbJ1z7TME/dD6FQSj9aTi0hIJ6EEaSFDeeKUwhcwlJih/mMf8kG
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 09:27:06.0272
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6c35838-e1b9-4d02-4e14-08de6ecfe1f7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6191.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7231


On 12/02/26 03:40, Sen Wang wrote:
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

Tested on j784s4.
Logs: https://gist.github.com/Jamm02/8ed69ad1c9b3a4f0cda4977cc18e01b8

Tested-by: Moteen Shah <m-shah@ti.com>

Regards,
Moteen

