Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010042.outbound.protection.outlook.com [40.93.198.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447F342FCB5;
	Tue, 11 Aug 2026 14:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786457092; cv=fail; b=t4WVoVr2mwiyn4WHfkNFpnqKlNiSNaX9dGwwFpCaD/AZ0q5aokxHOk/jhQIWjX/isAkpJ63sTroZC+L6XwqicbRVC3iibnIje3EfnFoyB6g0r1S7vtnbQ342H/pBnJ80BW8HA/y7IJqRo+pWOJDjQQvx1gUwcUVVJFos79w4Q6w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786457092; c=relaxed/simple;
	bh=NQqzuxE3A39EtzLdcD5Jva790edXutF7TIA2B/elPQI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=X3Dh3mYxgOuiGaAPwVzOmqtj40SGmxapAun6UcSr1XMzT4W7OW5J6YqdlOEA57f5+59S+vShXFyRJ7SX56jxPuCXPAtuODUfkWCZ5+PQqly7RDm3bNPzS6mu/To5ooPB5/NIBlFUwvqE36DYk//kGDIwtl4B4Sdc3i5rJRr7Vf0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Tq8VuPY3; arc=fail smtp.client-ip=40.93.198.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Tq8VuPY3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TzETC2ThJblV7HdyMCNbFp85POitLprBzvmGRaCWFWo30tC8ZnWLn4tFW4EefniTKXf+Ua30V2ceVyThikRzUdoR6mRa+PLxmwhEelPnzzfIe9eAkQuMWajqqK9UK32rrf6pVJXYd/G3DA23XCjSDeEhvTtS4Swa9zfFkWQPATvb4nqVJzSKaTAadRlIbTBUYpmYx+mmwOXxYDcYRWFp2AtF2j9V5Y/dsdBHv2D+LWPUDqsVLYAS+88aIAUfj8NyR3ets+t6BK5v+dUNK96nH7LRnsGOfCVYb2XZVzQzxL7kxUdp9LiwyV/PEt0NFjqPgBXr6fIFqMyAE2oL7A5l/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L4l/ftM57jCu0Rga3evCq3prygOFHZsJb871NlLARmw=;
 b=TEd/KvXLM8BO2YmYRap5MsZnrjD4sIr/6R9fdGP0QTb1N4CDsce5rkCV8YGE8+PxrcPn0L1TYwU4sCdxYRTPCYEa9ymsHKr9KH/Vl2xhKh1avM/37QGdfuF1+XjcQazp/L/03Mgl9MpTjmNKGvxyoJnzO+iYRqGHhvtC/flCp2Xvvisalpx3pKjimn1iJlvXTOYzeppucgVJRonQbmiv708S94ljDCL1jJFj+fdMEJaYc8f+dX8asiTgghEDJ36+UZwhVAPxOTtxK4X8+2mye2HhXLSfLCTpN85rmW6yh3pLAp108Fk2qPGI13tsXuWhjiboW/j3YlIpvmTEpOjAng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L4l/ftM57jCu0Rga3evCq3prygOFHZsJb871NlLARmw=;
 b=Tq8VuPY3FGES5UKzsTQOTsVhopSW6FBkonM4rfpEw7ajVKgxyKlB43r4oFxmJ3R/xSD3Kc9Dp3KaleOTV7ymzzh9dotlBnAvRjpwluzPKftYqPY1i2Dv6K0jXFOpqg4pc9LvVAuLywwUtWx5+Yau0pM7jbWlnDQVourcxVv+TQI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by PH7PR12MB7986.namprd12.prod.outlook.com (2603:10b6:510:27d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Tue, 11 Aug
 2026 14:04:41 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%5]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 14:04:41 +0000
Message-ID: <23036150-4cd3-4b7e-bbfa-dc1a370a24e4@amd.com>
Date: Tue, 11 Aug 2026 16:04:34 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: xilinx: formatter_pcm: fix stream_data leak on open
 error
To: Rosen Penev <rosenp@gmail.com>, linux-sound@vger.kernel.org
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Maruthi Srinivas Bayyavarapu <maruthi.srinivas.bayyavarapu@xilinx.com>,
 "moderated list:ARM/ZYNQ ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260807004031.47455-1-rosenp@gmail.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20260807004031.47455-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH5PR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:610:1f0::23) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|PH7PR12MB7986:EE_
X-MS-Office365-Filtering-Correlation-Id: 834a4998-6d44-46f3-c1e8-08def7b17d4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	0oUJtRQrwDUn/AkMGXaFPWqSzmsGXcmsYUpvkgp6qn3UIcm3+lCYEDgLVkPBdr3C72sbmjE3PTPS/ZmehiObYvG7MZmHIlvBW7HOwn/q9kYYdpeZoTBSkS3EpEN5td6SH4ScPwoT7OMqyzz2yECKZDmxxVCmSk/9XRKIf4S6erkZEhyWQAq03nvIDlC7B04sXKSceGWNkHzODD0yXCzNOYITdq6zY/wtOa6mgXaYSIH1E2QBUIn5TLi3iTmTREQfxLUauITGBN54XpgIRHWKm7ZHB5kKU99Ax12GXslJ1NS1FWkcbLt1ExQLm2THOsLzf81lMdZjcyvMkNTVPukxY/HAIYGZlkulgD6QFj+jYgJ7/kjaNjV58SoMz+qFcq+KXDXzfww02rTk+ZVwvPAJ3TwtriGujUtYJrxktYYBhEU7akZLZt9GOpbpUmNdDt08nSwPl+blD9psbzxT1+WJ1SZHRtESwM2kN63+XLvqNDrgTx95K1YTyFo636leoH8Fd8kJqLOXwBlLDESLXKEXxhxucH7mUou0xIzTnUW6s1O9Mn8nLx1xeE+clXp4rkhGciKuMfGziIqfJdYBAUsYm9w4tQUh9J67Dpe7NPY6ku6TOLkJ4ve7hZSWQPytZvkDWeicAVFNjWZtVFnWHMhW+ZDVbU5hhS0jHuf5qy1SuNI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dituNktaTVM2UEp6OE4wdFRGSjJBQjJYOVpPcDVFaXRPajRER2hmMHJOQU85?=
 =?utf-8?B?SFlhdXY1TzQyU2hHcHM4T1lEak5JRzdqYjdSUmJFQmxtbWRpbHkwbnpKTWxE?=
 =?utf-8?B?Z1lZcTRnUUFRYWxSd3pwSEM2cWJPSHdsczJFbStqUGdwUlhxWGVUOFNqSVIv?=
 =?utf-8?B?Wm9JSUEzZ3JJNVlPVTh0NjNYbENLYTVhZmlMOVMxVVdDVmdkc3UySkJyZjZZ?=
 =?utf-8?B?WnZwcUVKYkFHeU91enRnVVY5Wko1b2c4NGU3eTdUbW9xZjdrTkVoaWVxOVY5?=
 =?utf-8?B?MitMZ2ZZeC9LL1JDeUtBWUkzTWRVUTZYYmZtQ3RyZHRaRHVBUDlYbkFHYlI2?=
 =?utf-8?B?UUtLd0dLS2E1Tm9BdTRMdC9vTlA1Z21vVFZURWtNTEUrdGdUaU4xZDluOHND?=
 =?utf-8?B?a1Bjck01TURqc3hEK3E1dUQwMnFNY0hoZER5L0U3YmNXYkxWdFpwcm9KaUdT?=
 =?utf-8?B?bzgxLzBMZzB4eEQxOGpmTkVaMHJyNXRMOFN6bFJxeW5DZ1Uzc2FDZEJORmNq?=
 =?utf-8?B?WFZTeldVdVp2UjlxYmRlN29FVmo4SlFGaXpMclRHRGh6YkJ1alhUakwrL0M2?=
 =?utf-8?B?QnkwQzl1cnl1NlRSeEUxMWNMckNUSzdENVNhYmtHTWxyVXhKaXA3emJXRmFi?=
 =?utf-8?B?N1hCVUhhUDY1b2pQWFozZmIwY1MrVGRVOEJHWU9oYXk5WUdkSm9oUFNxR1RL?=
 =?utf-8?B?SUZFWVlreVFkdmxnSERESTJWMVZnNEl6d28rT2xUelhtbHp1ZTdRQnZ1UUl1?=
 =?utf-8?B?Uk5KY1A5MGoyQXRmNm9CSCs2eDBSNmJpTG9sZGtQYmxXUWpndWgrbm9aZ1ls?=
 =?utf-8?B?b3Vhc0NqUHRydE8zUENkc210N0lCelIyRHhCeDQvVUpQY0RTanhiTllSYWow?=
 =?utf-8?B?LzJIYjNsVWhJQzM3dUt0L1N4WVRObXVwSkNIakN6c1JGcmdsdXUwZHpZRmN5?=
 =?utf-8?B?VDliUHNqemtPVXN0alhyTVNmVGZwbDdyQy9XcVZ3OE5rUnNuaDYwQks1RVVx?=
 =?utf-8?B?VEZEUmJYME9zaFRlS2dKbWFaZkdnYi9YSk1FT1h4ZW1ZTnRrakdwekJ6T3lp?=
 =?utf-8?B?RUJSM3JWdDZCL0pZMktNbFd1NlBKcnlFTGlGNmNxMVRYdmF3RFNlb0xDV3Jp?=
 =?utf-8?B?NXkxektZR2lwRFVqNlRjU2V0dWJzdVdaR3orOFgrSERwZGxSMjBvemovZ0c0?=
 =?utf-8?B?UDc2VnF3eDA4VVV4NzIwZ3FMWkVhakhOZWl2d2JJNkpoNEJrNmE2QnkzMkJK?=
 =?utf-8?B?M2xZMm9nTUwyb3Q1UXVoY2lvWDkrZ1BTV2pFWkRpeCtMeWVWQkU4WXNLaFBN?=
 =?utf-8?B?LzgwdjBZOW8vMG5xRDRFcS9qOFdoNWx4M1J6TzM5SmY1TnZRL0JYVHEwMVJV?=
 =?utf-8?B?NzZnYUNEcFBEVGcyZk05Qko3K2l4cXNxWkwvNUFLbGRDSFVpdzNNbGhqeDlz?=
 =?utf-8?B?VEczR0FQT1AvWXhIcG9adXl3eXdSUkY3bEJDOGR6ZFpmT2JvVytwaGxvQVhu?=
 =?utf-8?B?MStNNFN4c1FJUDZ4VmRia3RyUVVRMkQ5aUhTQ1QrbFRFSFFwdVdmYWNta0tJ?=
 =?utf-8?B?ZEN4aDZOVU9JUHAxVEpZR2xNUTJVNzBENm0zRVVUQkFxOG9FYTlIM0F1bW1O?=
 =?utf-8?B?WGlIK1E4aVhMeE4xajJwU2I5Qlc2SzJCalFJTVFwNmdDVnZWOGJraDBVTlhG?=
 =?utf-8?B?cVZOVGI4d2ZIRU5xa2lvUEdFdFBHS2NzZ0hDK295QmVVMFBkNnJ5b1FvY3V2?=
 =?utf-8?B?YjJPZDFacEhFcnZ1elBWRDdlclArRlI3bzNzcXZwcUkraW9paUZKNVdSbnVV?=
 =?utf-8?B?WFQ3L2NuMVgzQTlPaXJrelg2MHlTOFQ1dXE0WW1pWFprcE9sOFFzT1lDanYr?=
 =?utf-8?B?YWdwanRFS2JQZ0FrZ2lVYjN6SUJpcHFPVC9hK3FpQVBmeFJyUmVrQlJNWUJR?=
 =?utf-8?B?MjdoWG84VE5xa3gvT29FUlh5T0tJRUlIQUlKaWp2RmQxZEJZMVZSSmRhUkIx?=
 =?utf-8?B?MHJLN1Z4QUhpbmtoL25raWRZVHZDaldieDVkMDk1enpXNE14RFlza3lkOUVK?=
 =?utf-8?B?bFBtV3FYUjlMaWJCNDRUTlFMYUxBNTZ1aFh3bjA5RUQ1dkVzTHRHRG50a0hH?=
 =?utf-8?B?TWJxSk9qRi9yZmhqN2dRWE82RkhWRUJkWThWTlNITklMYlhGSEpXbE9rTjA1?=
 =?utf-8?B?cVZaTlRUNGMwaG56MUdrVXJid2ZPM1Z2Z2srTmRFR0dQNXNHZ2hsRkR5enZH?=
 =?utf-8?B?cmJBbE94dkFuUit5bkVPaUtWVk5uKzhnWnhWNlRKOWRlYjFLaHYrbm0wOHZC?=
 =?utf-8?B?SmtKR3JMcExNMWRXTkhOQytsUFRocnZhdC8yVFN2Q29GbWNKdnV0QT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 834a4998-6d44-46f3-c1e8-08def7b17d4e
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 14:04:41.8195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BDDgkzCbNHJ5Fe9ujseMabD0HlB7xJv/r3CnwH6b7XlhWuSNvH8NdERvYT+Dv67U
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7986



On 8/7/26 02:40, Rosen Penev wrote:
> In xlnx_formatter_pcm_open(), stream_data is allocated and
> adata->play_stream or adata->capture_stream is assigned early.  If a
> later step, such as snd_pcm_hw_constraint_step() or
> snd_pcm_hw_constraint_integer(), fails, the function returns the error
> immediately.  ALSA does not call the close callback when open fails, so
> stream_data is leaked and the stream pointer is left dangling, pointing
> to a substream that ALSA frees.  A later interrupt would then call
> snd_pcm_period_elapsed() on the freed substream.
> 
> Free stream_data and clear the stream pointer on the error paths.
> 
> Fixes: 6f6c3c36f091 ("ASoC: xlnx: add pcm formatter platform driver")
> Assisted-by: opencode:deepseek-v4-flash-free
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>   sound/soc/xilinx/xlnx_formatter_pcm.c | 14 +++++++++++---
>   1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/xilinx/xlnx_formatter_pcm.c b/sound/soc/xilinx/xlnx_formatter_pcm.c
> index 7eba3a0205f1..4f4c1e650aaf 100644
> --- a/sound/soc/xilinx/xlnx_formatter_pcm.c
> +++ b/sound/soc/xilinx/xlnx_formatter_pcm.c
> @@ -385,7 +385,7 @@ static int xlnx_formatter_pcm_open(struct snd_soc_component *component,
>   	if (err) {
>   		dev_err(component->dev,
>   			"Unable to set constraint on period bytes\n");
> -		return err;
> +		goto err;
>   	}
>   
>   	/* Resize the buffer bytes as divisible by 64 */
> @@ -395,7 +395,7 @@ static int xlnx_formatter_pcm_open(struct snd_soc_component *component,
>   	if (err) {
>   		dev_err(component->dev,
>   			"Unable to set constraint on buffer bytes\n");
> -		return err;
> +		goto err;
>   	}
>   
>   	/* Set periods as integer multiple */
> @@ -404,7 +404,7 @@ static int xlnx_formatter_pcm_open(struct snd_soc_component *component,
>   	if (err < 0) {
>   		dev_err(component->dev,
>   			"Unable to set constraint on periods to be integer\n");
> -		return err;
> +		goto err;
>   	}
>   
>   	/* enable DMA IOC irq */
> @@ -413,6 +413,14 @@ static int xlnx_formatter_pcm_open(struct snd_soc_component *component,
>   	writel(val, stream_data->mmio + XLNX_AUD_CTRL);
>   
>   	return 0;
> +
> +err:

err is also variable in this code that's why I suggest you to rename this label.

> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> +		adata->play_stream = NULL;
> +	else
> +		adata->capture_stream = NULL;
> +	kfree(stream_data);
> +	return err;
>   }
>   
>   static int xlnx_formatter_pcm_close(struct snd_soc_component *component,

With that fixed fell free to add

Reviewed-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal

