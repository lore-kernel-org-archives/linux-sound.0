Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011049.outbound.protection.outlook.com [52.101.57.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F303BED06;
	Tue, 11 Aug 2026 15:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786462095; cv=fail; b=oRPnzcIseNATTmyQRuiChBhccztbsiVWppy1MiaOBHzHHaH+wx9FBrlAylrXAI+UVxhMfzZ6KZ6pOwdALTGqeBribXh1MvSLbLo5K4+O+pzcLFDHlROVlsI612marpgAHF/eI97faENBTaQaDUx2HRwyf5O9BI2S//cjWvP8uVA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786462095; c=relaxed/simple;
	bh=s5D3S+llhCPLVgZWBvsQvDhMaNHzxeANk+dSM6vksUg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EAv7712+rKQpn/BqmlglUvMPjWja5cTS6shgkGk5wblYoSYPP8cHXMfm+1CrYjqLy7rvygsSKIpEGnUGjGyxHv20HhYF6Rk80Zk6FcNxCx969mlHbu5Ti5aH9NKiO+B293osNwfyco4U2KFJ0sxdRORPiKK6XD0tuXPMTtzOwEY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=rgITEF1x; arc=fail smtp.client-ip=52.101.57.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="rgITEF1x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SuEo/oNeai5GlMoMF3QaQ3fYA+cuxKJ+Sx6EMWxUYz88/suuYcQ9pDeh4YRxBvgjffHo2AuYvZu7R9IXGzEd1N0FCbgRQAcc2noSsnM0yIIl36jWcZ/LGtiluUtUtF/tmizZt9IsEvIDkI9CMiny2RDgn0eUK5imWirJJ3duUqbYXic3Y7dr/LgLhOeJ3cN7bdfmpIImnQMXs+w5uApsKwXKt8wVS7KXkj1BsG3KaQOiABKJNY2iv+qjfQEqjKEdIX+WyRkT1RgOx0RBi95vew48WNcAXfw2oirqs7E9KIyQ15/b/5qkmDdNR2JqIbpm1qwaHSnBdxx3WNd9gGG+mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gm9IiMhyzh4ibVu5FF0iNv4dflFeYCyeMTdGR5BXOdU=;
 b=vAXiBbDR1SH9mvI7vTGernNq6t8R0FvSm23S1UdtW8z5UBFMLv4xZT14/XoCoxIok8qKexlf3kjnVqmB9Ft08h5AsEuf9zD5ydKKhSVXGCNlXQlY6YYEx8eVZup81g60QsgLHX+r9q06dLQIL6YGNSg+F3uGZ1zB26JuT06uzCFqmH3ZCFoJtvaAgzXAWxuMNGpwrIn3tMoiG1L9jNHXKsiHnwl/pAJq8S6+Smdkmoq8l96RJ0TpK2WTwANpRLQuxi+ke/28WKbHZRTvrUqVRnDtBxx4Nkqge3oFhDxn/5TZldU695GQSB6TYpCqhdYJ3gjeYwt6utrvwMyUBS1FjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gm9IiMhyzh4ibVu5FF0iNv4dflFeYCyeMTdGR5BXOdU=;
 b=rgITEF1xYh4Wtdud5JV8GHJWBI7ErvMHV5KMM6rJUcN7uzoQG4U2SJgeSFy3o5QSf0yliNbukktA5Gt3Dj4xILmAxt40RojtU2SnlozmgObexUZpNPr4MKvmWSSqbyzfJhUoRXbmuZFcTPgXtm+p/OGVfj51o/hRn24/O58t+/Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS2PR12MB9567.namprd12.prod.outlook.com (2603:10b6:8:27c::8) by
 CY5PR12MB6370.namprd12.prod.outlook.com (2603:10b6:930:20::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.11; Tue, 11 Aug 2026 15:28:09 +0000
Received: from DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5]) by DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5%2]) with mapi id 15.21.0315.008; Tue, 11 Aug 2026
 15:28:09 +0000
Message-ID: <87f8cd1e-c268-475b-bae8-19e227bfcf87@amd.com>
Date: Tue, 11 Aug 2026 20:57:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: ASoC: amd: acp-pdm: full-scale burst on every DMIC capture start
To: Robin Everaars <robineveraars@pm.me>, linux-sound@vger.kernel.org
Cc: venkataprasad.potturu@amd.com, lgirdwood@gmail.com, broonie@kernel.org,
 linux-kernel@vger.kernel.org, Mario Limonciello <Mario.Limonciello@amd.com>,
 "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>
References: <20260805181130.75314-1-robineveraars@pm.me>
 <9a5937cc-f4b2-42d7-8564-da81f6cf4e9e@amd.com>
 <20260811123336.197402-1-robineveraars@pm.me>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <20260811123336.197402-1-robineveraars@pm.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4PR01CA0086.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2ae::9) To DS2PR12MB9567.namprd12.prod.outlook.com
 (2603:10b6:8:27c::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9567:EE_|CY5PR12MB6370:EE_
X-MS-Office365-Filtering-Correlation-Id: 208af84c-15d5-47eb-e717-08def7bd2600
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|56012099006|10067099003|11063799006|4143699003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	fMfx5vDW+Qt5kS3QnR0DVgMLrG9kBZWQwWu06+n0QttDqhPi/egiHZuY2Rn5DXKT+CYJZWXMVTrndDR0eiRYcv+T5PmFOYuPqydZzc72uRpNCnKqIWjGWIFzloMYgndHd0OUGEwZO2SHJWlW1KfOEg0G6/WVhvbg4BQ1c03HQyuTzClpl8vB3d4QmPAqzyW/+hM/fzl/tFNID0sr8Gp+BaCuynX8EmMfyOBhmIwT96oCGz2ayYAT2fwtUyFgz8VNFLf688SesnzgkwvrOjV6KYfAjTudjYjT3nsjwJbFKbkLtsDXImbcB7fkbX1InGT+5Us7wLmbp5z2fvQzHYYlYjIzvMZa+Qfap7B2frij2dEhkd6FLmrP80Ee9FZyoOZ3aybTMlyJBmP9myQOlVKX9xPJR8C4WyBzoWRz9TIMyUN8j6E7VyiFKrmCCg7tLjKUCAxVelvWvkSoeyFLGrRngC0KFcr0A6i3mZJ5EYT7nZmqWZc0cLxjF9RTZeBWQFgIn+fPrdcG6e7sAboJcl4exgQUbi+ZYEsaBKgtj+DVqlm4Kg22xoPvfwajCHJ+ZCtEhnWcwWFbTBBE1+hdAFuSWb4F149Zot/IUSkxCS12bR13oQfjWt4hSfSXyVn9+I56MI9QZxg3182S3Id3wdAD+Q8GmYHvHXOxqHe4e9cPAy0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9567.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(56012099006)(10067099003)(11063799006)(4143699003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MkllVHlkZzcwbjJjVnR1K1Eva0FOdnhkYnVwU2xMd0hzcktMbkVaM3hwcDhM?=
 =?utf-8?B?NW1ENzB2UHhudGxUZUxvbUtUbWliRXd1Tk56Skc0U3ZrUGZRSWFvVy9Oby9J?=
 =?utf-8?B?RUpDY0Q3VWpTdjN5emltRlJPVkVNaXpVQUJmSzBmVTBjL3ZTZ3RoZTJSWEo5?=
 =?utf-8?B?NjBvRjRVQnVCZlZyd1BaVFBkdm9XRW9ZbFpwOWM5Q2h1bHJlcElSNG1mTDBa?=
 =?utf-8?B?OEZhdDlnUjVLMWdDeTZQekxlSmMzQzRkd1U2NnVDZTNxejFpUm1FZnAvQ2Nm?=
 =?utf-8?B?VzFMOXlwYWl4RnJnbHJtTmV2WWhRRmJyUXNEcU94aE5XUWFlaDFmR293WmVC?=
 =?utf-8?B?cGhuVzBRTUtweGIrTDV1VW56NUMyQll4ckE3c3U4N25vUXJ3K0t5M0o4MUpU?=
 =?utf-8?B?N2xqVm9oRUJTREM4V1lBdlBaa095b0o4MHFxTG5VR0FkQWh4QVpUeWx4S0pl?=
 =?utf-8?B?Snl6ZGNTaVdxL25CTkM2ZUdtS3pSaTQwQk5rOW5tOVpJSHQybEtvS0tYdzcw?=
 =?utf-8?B?SndaZlo2WStHRTdsb3JTQ0paK2Nlb2liSnU0YisyZjZOcGZEUXRydElNaW9C?=
 =?utf-8?B?NkJLeERYUjJ6b2lxa2hGVm9jcjF4cnVLdEJxUnJnTE5WaTVnMGJKRWEwT016?=
 =?utf-8?B?YnJacnphWjF5eTdlOUVuZ3RIdTJ3dndwOHVhR0FMTW5QaGhPK0Y3TVNISTc1?=
 =?utf-8?B?U3NiQmN3T2krZHUwSzVqYWVkU2dHUnJ3czhMMjRpSmdidHI4a1RTNFo2Yjg5?=
 =?utf-8?B?K1ExZ0dkTVNjYmFDTDJ6ejRGSy9SOGNERkxtYmFkblZWc2wxWTAzKzJnb1NN?=
 =?utf-8?B?TEpLYko4RUFmNjFROThudFpWbjJMZ25zeTNRVCs3cnpRUnlDVHFMWDZQM0Fs?=
 =?utf-8?B?YnJ3SjZBeWVEUGtpRDJyZy9ROERBdXNxdHFHejhSeDRLY0MzR1NINS91NDFi?=
 =?utf-8?B?MENQZ2tYZFpkejBUOGtSdnhaYTN5L1I5Slc0eTNtUjBRYVAvRjQxTXdCTVRB?=
 =?utf-8?B?bWFhSUJlOXdDakx2OGRZWkd0a1B5UXExWGFtWVVqSkN6TCtBY29qVkh5YzJF?=
 =?utf-8?B?SFQ0N3JEalplREh2bFVJRzdMMWhVeXZqN2diSVp6bE9pR0w0SEVkaGJwQ1dM?=
 =?utf-8?B?T0VWeDk2d2RnSmpScXZLdVN2L1dUZUU4UlRXZGkrU3Vqa0szSFZaaS9ZS012?=
 =?utf-8?B?b0FZS0V2bVVOOEpISkY0a3ZaSm1oNXc3Y1c2Y2JVM3FZSkRadStqTGNRYU44?=
 =?utf-8?B?eE9KUzJscUNnYVZvN2xYZk1TeWdjeitVYTRQNjVFVjVCTTNaZUh5R2tXd0ZG?=
 =?utf-8?B?TDE4M0o0SERYWXU4UjBHRUJIT2x5ZWh4TENVMjFxWVhoemh1a3F6MkJKQVB3?=
 =?utf-8?B?anowanp1ZndtaEpYcnVpeUpYd3BlK1FocFRZVUtlZWFKcmdpYXRidUQrVkJh?=
 =?utf-8?B?eVVBUTNjTE9nN0w3dWNOdklQY0RwcGZXMnhHSnJYY2hzVWMzQUJGbEYzQjhS?=
 =?utf-8?B?RmNXVkMvakVKTDhIdUNHQ2c2Tmw3d0d5WmhTc05HeW1TRm8rVGQ0Q1VKa0Nl?=
 =?utf-8?B?Wmd2N1lENjBSZllHV3hKTWZKVk03MW1tU2FQNm15OUtKREQ4dVVuV2tyVVkw?=
 =?utf-8?B?TkI4WC95c2lBdkpOMk00ZDZrVVdmbzVySlpHMzVpM3cxSlZ6aVVwVjBjSTBu?=
 =?utf-8?B?ZGIxb3pibkRwYUZiTW5RWkpNQUh3SnBQMkg3TW9wdFcxdVpYSUwyemg3QTVw?=
 =?utf-8?B?Z2xBZHpER2lpUlA4MHZFdE5DUXJhdUgvcURDeGJZdU9aMGtMVHVmNDErVm1Z?=
 =?utf-8?B?MDM3SEttTHliVmxBNTFXazFQOFUvejV4YlJVaTZUcVZEV2pDN0FrV01MYUtt?=
 =?utf-8?B?Qzg5TWROWjV1c0xBdE9kblVLLyt6ZUEwK0FQT3NvcjhtNWFqTHZETEY2bE1X?=
 =?utf-8?B?MmhSWVRaVFA0MWpRTUFteFk1Y1QxOWhwWnlLbHdUaDI0WlhuVWZCNFdXZ2pH?=
 =?utf-8?B?K25YanNtYjJwaHJXOGxFanlvTWdtbXN2UFhaQlVpaU9LV0NBZ0FSS1RqTjhC?=
 =?utf-8?B?cUFyMWRndkVOQnZ2S1NsUzJMYnZ2MjhjdWVmcnFTZW9ZelliUlp0VW5RSkNi?=
 =?utf-8?B?Zk9GOGJBSG9pZ04vbUpjWmhuNk1QcVZtRjJRRUp3ZTVJaWdjWklIV2k1Ymxn?=
 =?utf-8?B?UCt3RWRhUk91WmFhdmZGQ2c3cWlOZUdEMlpFYkdOWXR6Znh4bFg4WEpSMFhM?=
 =?utf-8?B?ck1renZVS2lRaTRHOFhIb3ByQmQ5TktJRkl6cmY3eHBMWDFXa0JzWkVvN2gw?=
 =?utf-8?B?TEgwKzVTVFJHTkVRam4yTmtrRS9PVzU0MnRQRUsrc3BYendNaFRUdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 208af84c-15d5-47eb-e717-08def7bd2600
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9567.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 15:28:09.5968
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PXiYU1uhb1ew9YgnB1eUz5clDeLMv43b1WycywAeGWSUIxHdfDCIILJAEZrXtq98wyPP2EAD9/YL0upCNtUtMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6370



On 8/11/26 18:03, Robin Everaars wrote:
>> Could you please try attached patch?
> Thanks. I checked the bound driver before building it and found an error in my
> original report: I named acp-pdm.c, but that is not the path used by this
> machine.
>
> The PX13 is bound as follows:
>
>    /sys/bus/platform/devices/acp_ps_pdm_dma.0/driver/module
>      -> /sys/module/snd_ps_pdm_dma
>
>    snd_ps_pdm_dma:
>      sound/soc/amd/ps/snd-ps-pdm-dma.ko.xz
>      platform alias acp_ps_pdm_dma
>
> The attached patch changes sound/soc/amd/acp/acp-pdm.c, which builds
> snd-acp-pdm. That module is installed but does not own this PCM, so applying the
> patch as-is would not exercise the reported hardware.
>
> The corresponding start sequence is acp63_start_pdm_dma() in
> sound/soc/amd/ps/ps-pdm-dma.c. It also enables the PDM clock, decimator and DMA
> without a settling interval. I can port the 300 ms delay and FIFO flush there
> and test it, but I would prefer to test the exact shape you want upstream. Would
> you send an equivalent patch for snd-ps-pdm-dma,
> or would you like me to prepare
> the test diff?
Will share the patch.
> One detail may also need handling in both versions. PAUSE_PUSH currently takes
> the stop path and disables PDM. After moving PDM_ENABLE to prepare(),
> PAUSE_RELEASE arms only the DMA, and ALSA does not necessarily call prepare()
> between those commands. Should PAUSE_PUSH leave the decimator running, or
> should PAUSE_RELEASE use a separate non-sleeping re-enable path?
>
> Sorry for pointing the original report at the wrong driver. The measurements
> and PCM are unchanged; only my source attribution was wrong.

