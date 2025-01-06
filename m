Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2087.outbound.protection.outlook.com [40.107.93.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9848C182C5
	for <linux-sound@vger.kernel.org>; Mon,  6 Jan 2025 04:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736136380; cv=fail; b=TDXyg00oRa6qGKwVzhP0FjkkafLcP7vHxvKSf3+s/dW7RXFGBLUkPo5Js0jMwZ3bOC/+1XCSgu8388bvjywB46oLT79pkAdHLFCgvzzgYxeKLTdu69FtDDSXj9W2nuXE+h6G6xvy8Akcfya8CN7Ka+WM2/1BzejkLfv9XyNHKRo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736136380; c=relaxed/simple;
	bh=QJ4kXjNQwIs5Ef1AJMTyw8/h9r+vsNcxne3CczZpx9E=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Jv3BixorKTNIykrA6CqcM1oSiOZjGz0wr7VzKWDWGeWPuKfHW4MT3cBFks7hJf13KrYDADKuYKswvtOZi1acsuBtWI08LMJIG7XuC56OOYMLG7G+Tv4kXyg+rS93JFhrCwSxMo3k5J/qGjCyuNDbCAN6uSreBvLg1c3ytAH0QnQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=DhZtoDGS; arc=fail smtp.client-ip=40.107.93.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="DhZtoDGS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I37l13LJCs0tz0S6tnn3LoarSjmOlDllxUBq+BMhTru6wlCexLazja7tBHeeAuwBypYsvb1aKS0DVD6O4DJ2VRacSdzM7rnYYoaj9GGJo159wbnPz4slsTl2liYdcx5KPDhMbZsxVeIXM/DSeDRitaMhBCcdQxUqs5Fm/QildiGH4l90dLWH6oNaGMQO40MO5C9X3kKC5eKlgGNVGpLR3gUYds6ooppCoZXqCmJWJR5kivIFTbZjoGKcLIpWMjEF2DIlPBeYZQ2Ds2Jhrc6sq9zi1Ib8BEZ2OaErfIj+kFIZp47x0S0nxW6TGh/pVsHrFGK24aWgZgoR3w5qsRXrSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hiTc43QiuM933dmmiySOnQSe8hAT6tr/XGyGJ5t5qbs=;
 b=XUGz1UlL8JcE36UXPAYOAIl0u1LKIh9mSELGHEJuUBdK6zEvxpqVcTk9JNkyrHbwSMDy5yI80h1QT8w8OOVOdcIFQUiVml/y12LKTjntlBQZ+Z5sCmY6j5LTyFrUFxXJNGOzrmRJsrbuEVbHLEryGSf2fhg8FpmkvmfvJnPjd6vjHHg4HzavLGBSbUJRgks7jg4DnDc71D2HWmbZrL+JcS9Gf1fOq+dUhlVf35K8oGadXUvKiTt6xQsEcn23tUYdLxpfNJScwNqejRdSSqurf1ErZsShGHvHcuYnUM+oDVMVqE5x/tP6FJpjnJerpFbEN7yWvAe9C83tc6VYksiU3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hiTc43QiuM933dmmiySOnQSe8hAT6tr/XGyGJ5t5qbs=;
 b=DhZtoDGSRCx/VvDe7+cMfJRx8NidZ9+BUbQnbCABTFNg9+qo36HCgAd2Q6dWlUYWn8sVKbvljrJJJMEI6fiFcJzFH8yUzi6RuG1/2XmgyzK+8HMgy0HjhWKDvXY6bJI0WaFNVzM+TlXqSMWFYdfXGAm5JYkmzpfQsnsnUj14JQg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS7PR12MB6095.namprd12.prod.outlook.com (2603:10b6:8:9c::19) by
 DS7PR12MB8230.namprd12.prod.outlook.com (2603:10b6:8:ed::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8314.16; Mon, 6 Jan 2025 04:06:11 +0000
Received: from DS7PR12MB6095.namprd12.prod.outlook.com
 ([fe80::c48a:6eaf:96b0:8405]) by DS7PR12MB6095.namprd12.prod.outlook.com
 ([fe80::c48a:6eaf:96b0:8405%5]) with mapi id 15.20.8293.000; Mon, 6 Jan 2025
 04:06:11 +0000
Message-ID: <e5b4c96c-5a5f-46b2-b627-cbb3672afadc@amd.com>
Date: Sun, 5 Jan 2025 22:06:09 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Linux Laptop ACP6x microphone "quirk list" addition
To: louison fourmoy <louison.fourmoy@orange.fr>, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 venkataprasad.potturu@amd.com
Cc: linux-sound@vger.kernel.org
References: <2146099437.3319556.1736118857176.JavaMail.open-xchange@opme11oxm24nd1.op.nd1.pom.fr.intraorange>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <2146099437.3319556.1736118857176.JavaMail.open-xchange@opme11oxm24nd1.op.nd1.pom.fr.intraorange>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1P222CA0008.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:22c::35) To DS7PR12MB6095.namprd12.prod.outlook.com
 (2603:10b6:8:9c::19)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB6095:EE_|DS7PR12MB8230:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c58fd29-aeff-4cee-6dce-08dd2e077496
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WFNRWmFYblZpb1JhRlM5bFJFZEVMYS9WTmxMamZ4Ym5qdzdZUE0wQmxJMXVW?=
 =?utf-8?B?YUZUTVk5YnBVWXN1NlJmZDNHZ3J1dXVzYXI5d21vRjQzb0JGdWlaSGlLL2FJ?=
 =?utf-8?B?c2l6bG4xSFlVSGlxb3R4bEhYMU5CenpYQkZsT0MzVnZ6dzZvNFJqOWJiblUy?=
 =?utf-8?B?MGc0blV5bmV5elNCNTJuUXRkNGI2Nkh6K3dTbjM0L3Nrdm5VWE9QU1NQWWds?=
 =?utf-8?B?ZS9jemxkbTZrMTM1TWQrV1pib0M4dkk5enVDeXI0NEVvck56d3QwZFhvMi91?=
 =?utf-8?B?cDRTamNYVFkxald2TFMwdlhBV3ZGeURjL2dJbVpOdHdXK2htRlJGRUlCdjFo?=
 =?utf-8?B?WTFRdm1OVVl0VDZTc01ZU2hpVlBmQlZxdlZ0YUJpcDZ0S2p1Q1VDaEhSVXcw?=
 =?utf-8?B?Uk5aWG5najhqdlpNVGxtUE1wVDRncW5JaXpIS1NIN2VHWmNYeHN6RnpreFVO?=
 =?utf-8?B?VXI3YVpMQ21paHE1Mk5mcGhITUZLM2tqTW9jSThCR0ZXOVlUSysrSW5xM2w2?=
 =?utf-8?B?Z2pyajNtSitHSWJibGs2UDU1SEVmWjVmWkNaVFBHYjhJbkxMN2ZnbkpkU0lh?=
 =?utf-8?B?VXlVVkUrRVRBbGtwT1U2MGU5cGk2ZTVBbzF0dy9ZY1c0WXJBeFdVTGQrOXNv?=
 =?utf-8?B?eU5HRkZrek9CbWpndW9yT3FEVzhmL2x2ZkRiQzhDVGMyYVllQkZsZThVZW0y?=
 =?utf-8?B?UFptR2czbmxoV3VSd2xKK3pHUlBDR0VJVXBVM24yY1A4TUxnRFZrQU9iVnFV?=
 =?utf-8?B?NlVwMWErc1VrclYzQUlJQXlNbnNpQ3FoanViNG4zdnJYaFpRMHNNVmVWcHpU?=
 =?utf-8?B?NVd5NUh1eEhXOVlLZFc4TVJUSy9TNmd0YzZRd3k1S0RsbmVPN2dLMC9LN3Vw?=
 =?utf-8?B?RmdoUTBPQUR5b1FQcWNKTXV5TFNIVXc1a2lHOEVMb2FENGRWU3JlVFZjbjN2?=
 =?utf-8?B?UktWSW15aW5OYjFZRzl5ZW4zc29JbVlqNlNIOXcwZnJDRWhyaEpXQm15YUlV?=
 =?utf-8?B?MzBiejhKdnJBUTVHejJSVVA1dlljRnJQbjIweE5KUU5IUEQrNG1yQXJuM3p4?=
 =?utf-8?B?czVZM1F5Mk1RUVA5QTB1MmJwY3lROVFGOWFnbWpiVVZLbmhCUWZqZUJtU1Bt?=
 =?utf-8?B?d1JCazJtaHNKZnNGa0ZNeVZPcWc2bnZsQUJCTFBQSTQ3U0pVdDh1QVdkY0Vu?=
 =?utf-8?B?SXhpVVA3Vk5IemcreHBGdWkzREZxb2haVm9laTZWVnYzd0Fqc2ZHaDZhcVE0?=
 =?utf-8?B?V211MG9xaXFOSlRqMDYvN0VzVEQvZUpzWWgvOUVEMVJmS3ZPbjk4c1FOeEQ1?=
 =?utf-8?B?RU9VQWwzRHdRTWVRUGNSaXBjM0ZwRjNSOW92RVRtRmVWWkljVlVmeHNNczlW?=
 =?utf-8?B?bWFHMzRPU0pLT003cGg2UjQ1VzlVTzAzLzRsSzBCNU5ad1hQM2V6ay9hLytF?=
 =?utf-8?B?UkZVTU0wQWhnVFIzOCtCUEdVV1ZDV1JwUUFmSHY2YTVCZkU2b2lZbU96cE5a?=
 =?utf-8?B?ZHNMeGpIT1djTXJ3bTgwY0hId0x3dlJuZ0MyZDJPN1dqRE43dkRCNEViQjg3?=
 =?utf-8?B?Nnl2cmJ2ZzBmYm84V0UvVnFONXFUclo0bTBwN3JPZUlDekZpQTBqajZaVGFs?=
 =?utf-8?B?NmtsNVhUYVNieWlxZWFzL3ZDRGo3NWVGcE11QWVINWMrL1BNUnRlUktiOGlJ?=
 =?utf-8?B?MGxMZUZteDl3eXRUUDFWRWN4bDByTFZmTkxVNzlKUytTMXFLK0puTkxlVURt?=
 =?utf-8?B?U0Y4aWJ0bnZ6TnNqOHZpdzNMOTlBL01MZkRBbjlaZlQwSDdXOHJMOWNLVkkw?=
 =?utf-8?B?ZTB2TDVteVRMNmhQQ09Tdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB6095.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dGc1dVF3SjBCMTJjU0ZVcjB5cDRzNm1QbFZBL1FRRWZXVzlIK1djV3BuRXE5?=
 =?utf-8?B?Qnk3eDJ1dEhLZEVxaVBLb3d0bFNzeDh6ZkVIN3NsNXZqYURSQ09qT2R6SkFa?=
 =?utf-8?B?OXVjRmR3cmhuWVNzS29wSWNWTHRReGlUU3UwclFiV0RPTnFsOEhCMDExeVVy?=
 =?utf-8?B?Sk1xbWhjRFdZcXpPNHRUak1Hai9Vd01ybzZ5Vzk1aThIbVBFRHN6OGROSHFt?=
 =?utf-8?B?bnBtYUdqWmowU3ZkRnQvNnZBT1FxdFllVDhIQkg1MHphaVRtR2ZORUhPaXBT?=
 =?utf-8?B?VzFVZEZ0YkVxQ2kzUUtBVE5XY3BrY2tCUVVNd01SQzVtOU5NS0NoY21LRVVy?=
 =?utf-8?B?TDA1eWRuay9vU1lYcFBZNTQrck90N2Z2VEhkT0k4ZFczNzZDai95WFJlTmRj?=
 =?utf-8?B?M00yaGZhSnBab3pvN0NoZm91V2FyeTk2cWpWc3Z4SVdWZjFhclc2MHF6WmtL?=
 =?utf-8?B?bHBVRTFmbW9SQytnOFc3RENRYzRWK2NwY1hIRHF2REhPWEN0ejRBcThGWmtX?=
 =?utf-8?B?dTgvZThDZkdxQ3cwVVlWV1lybS94UGY2K2d3cXNuWitEeHF4alh5bWJBVGVB?=
 =?utf-8?B?cmVvR2kxcUpGWGJwV08vcmpXc281Yk5RZWZ5WEI0bldJK2xYcVU4NnZaL0JO?=
 =?utf-8?B?N2sxS2JrOVBRaTl3S1lTT1pXakt0TnlPZlhUeXUybWdiSTFZU0VIbCtvb2Qy?=
 =?utf-8?B?SXpjbzMrejFsMXBLRFVSNnNTUFAzWDZoemZLUzR5RkVkMlBuc1loanJpZDZr?=
 =?utf-8?B?MnZBc2xGelZjY04vNW91emh6S0xRZFJJOXFhRFZTMTBOSE16MUIzb2dWMWl4?=
 =?utf-8?B?Nkk3ajJNMG1PZVNsQkFiaUxVQml4aGIyMjZEYndvQ21Pc2czMmxITkdqOFBC?=
 =?utf-8?B?d0RxRWRXdjNRVmNqV3FIaVBsWmtCUUVESzAvYkxIQ1FlakdSeDQ3K3MxMUgx?=
 =?utf-8?B?TjlCa3FyeEpkVU0yV1NTWlhxVC84YlRJT1phQU5Nblg0TlJXcnlpS2I0L1oy?=
 =?utf-8?B?U3phTWhkVHR5eEpwa1lYd1BmeFJqK0FQTW43WFdnYlByV3IvZ2xnUWs5b2or?=
 =?utf-8?B?ZTU0RmRMQlgyRGZsNnJJR1RoOHc0Y29wdElPeWdwR2NMTE9GZmxNRWdTT2Zh?=
 =?utf-8?B?ZkpiRjkwVlo1dWxPMEwvTWJxbjFCME1CakdkWE0yRFRXbzNSNmpWWGkyTURG?=
 =?utf-8?B?dFJLUVQrZDloN29vWjA5Q1FSNmtUMGN6NFY5QW1ScUdMaTdIT1FxNXVzN2Y3?=
 =?utf-8?B?Q253WVZWWDFqV1pYYzdvdFRKaWIrQThzUmdxZFlxQ2pLR2lEYXhBM1hVUmRM?=
 =?utf-8?B?ZGJNcnJIVUZxV2lwWU1OaWI1Vit0ZFQ3MVVNZlpURE9EOHpDcHJTcllmS000?=
 =?utf-8?B?cGdRcmhHSnFNUElnRER1U0FYbTg1OEhiZ0dFUHJPbVNNd2JNa0MyUHEvWUV0?=
 =?utf-8?B?cGMwWGVpU1Rjdzg5SDFLcGcyNWpwV1RqcDR6d1JhZ1dkS3pMZkVCbGpib2Nt?=
 =?utf-8?B?Tm5qUXgvaHpSQTF4YWZ2UHllNmVtdlVRbWpIQ0oxMWpxdjNydWlPL2hKM3JH?=
 =?utf-8?B?ay9lcXZuZm8rQXJFR01sa21FTTd5WEJTcUpHd3I1ZTN5NGtXeURVam5VQnlw?=
 =?utf-8?B?dFJUbi9tRXB3Tk5BNFQwRWxXWktIQkdQVFFTUGtxY0VkTGl2b0FWTkFuTk5S?=
 =?utf-8?B?UzB0ZU1DK2xaZVVkZkxVZkRCdm04TDZidHlnYzJnblJkWEdyRjNZLytIcGJ2?=
 =?utf-8?B?SmQ4UVVxM0NZelgwYnVZZXllS0Y0V1d4c2c2ekRFdllNdnlwWG9tcWFHQ3ZP?=
 =?utf-8?B?ZzBRekdQU0JUSHlGamtKZzgwVGpyaVd6SVN6bEhxZVhtWnI1bndpclh3ZDhn?=
 =?utf-8?B?N01uRVB1TkYzcHhrcjFiTkg1TElJRUpyRDQrYWd4c05VSXRLR2puR0M5OEVV?=
 =?utf-8?B?VWhxWnZjME11b2lXdTdPQVp2MGpTUFBzOUM4YjdZSlVLRVJ4d0FNUmo3OFRK?=
 =?utf-8?B?cTlFS3RXNDdqTmNvUnVPeGN4aWxkdVozTHdhUlBuRVhLZUZJaTcvQ1VjWS9Q?=
 =?utf-8?B?TE1GWWM5RG53ek5YRTJFSHpvVEtUaXhtbXRoTEQrWG9GQ2cwZ3NYd1BqU3Jj?=
 =?utf-8?Q?5jzfoLXd3+Rbs//OLev3DeDLP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c58fd29-aeff-4cee-6dce-08dd2e077496
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6095.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2025 04:06:11.3631
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8NbC01Llv/BaIk5FclLewy/KPdiu1VvNISwFadGJKnOJUekqR/WYYsVCYmQW6252kKmk6Ukl9KhtP/dfjjmEeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8230

On 1/5/2025 17:14, louison fourmoy wrote:
> Hi,
> 
> The following patch aims to enable the use of the built in microphone 
> for the Lenovo Ideapad Slim 5 Gen 10 (AMD). Currently the inbuilt 
> microphone of the laptop is not usable with a “stock” kernel and kernel 
> manipulation is necessary to use it. This patch adds the correct model 
> in the list of models under sound/soc/amd/yc/acp6x-mach.c

In a patch there is no need to say "this patch" or the "following patch".

When a patch is accepted it becomes a commit, and the commit message 
won't read right.

I'd suggest taking a gander at 
https://www.kernel.org/doc/html/v6.13-rc4/process/submitting-patches.html.

> 
> Signed-off-by: Louison Fourmoy <louison.fourmoy@orange.fr>
> 
> Patch :

Specifically over here you don't need to use "Patch: ".

You also need to correct the subject, and don't write the patch like an 
email.

Here is another one of these that you can reference for submitting a 
better patch.

https://github.com/torvalds/linux/commit/b682aa788e5f9f1ddacdfbb453e49fd3f4e83721
> 
> --- linux/sound/soc/amd/yc/acp6x-mach.c.orig 2025-01-05 
> 23:37:36.927778168 +0100
> +++ linux/sound/soc/amd/yc/acp6x-mach.c 2025-01-05 23:38:28.066418534 +0100
> @@ -304,6 +304,13 @@ static const struct dmi_system_id yc_acp
> 
>               DMI_MATCH(DMI_PRODUCT_NAME, “83AS”),
>           }
>       },
> +         {
> +             .driver_data = &acp6x_card,
> +             .matches = {
> +                     DMI_MATCH(DMI_BOARD_VENDOR, “LENOVO”),
> +                     DMI_MATCH(DMI_PRODUCT_NAME, “83J3”),
> +             }
> +         },
>       {
> .driver_data = &acp6x_card,
> .matches = {
> 

