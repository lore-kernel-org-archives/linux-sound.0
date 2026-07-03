Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010038.outbound.protection.outlook.com [52.101.85.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA9B1E1C11;
	Fri,  3 Jul 2026 18:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783101908; cv=fail; b=bdHz31ZTTTKcuHjAsvwjGB8UFPAXjG1y/IaCbYYANP9/ukuMO6/anhML6CTOhsNsu/ElobAgfPLr7k6KqQfLhOZ9EqEoG/RSlUReDIKvYqvaoyELLCwsVN4ymLi8UUOrOJ17yb2/eH0WG7q5W034p0A1rXDmAJUAIpVZkKVo5Zw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783101908; c=relaxed/simple;
	bh=Tnic29WaMHaNb0a6dYbUq3xqm7iltQu8C6oK6V1Fsys=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=eCeWcKa/Rg0GvOeR6PIOKaOCpDRlELK0wdaN9051y/+uSobwym6kd+vNat+QQZjCtJH2k2amHb2R4GA5fCA0kHuPkRHD/IdjDonqimLQesHckhe7fi3P7XPk+JPCK1VN0eYSpPyssYFRYw0zvuHWKjlckLzLs5+HSr1/teT+tYI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Y//avTh4; arc=fail smtp.client-ip=52.101.85.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Y//avTh4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I0mqWHFNUQH+O4BM0OY8yo2yMIRxvXE4tW/ukpP5hsyqSAJL6Wt5iFb8fQaOonIZvrCiwH5/VQXBrBBqcHHNVI9IyUGU+guOhCHaQUnhO558G6pEob/G9VZEcvMqkvY+vfecevpQTv9t2LgWin21vSmZ1BC+li7VQulccKdwMWxXJzqe2IJnpm9Yd8eTnJCowe2Lg7aHLZ/S5lK5zPaPvqii3TspdLnkHZsOM5WQrF+O45h1Dh2t/OTC9TO8uNvMBsf4uiBEW6+dYu4orxdbXHBvpfuyZD/8WXqtFohoZcX/8z3QbpLfujHL5QIu0KZBOGYGZTe8576iMa3pncTy2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k80kKPHnuHFSXdsuem+LXI4qQAp3piq6SXosD3N/5CM=;
 b=CAbPYCueR9DWoCUEU7INeTvMB39USh655bBmhXAtjtWN+F0FiArB2cSnZFApjweFbOCCMfa9hxJaCB+kX47Ak5hAngpsL8tsaNPsY3IPIcCwhlkh/J9hqdX2Zo+KTmSo4K7l6pAnMVAkN2EtQTtXG39gMryu12buI+CYVMbnUVVpZFSA9JQid2RKpegV+b6l1GSEyrYWV6s1TshldPIcazUhMr48Qu0KG9BeUK2s29wW6jE4FOiTsSQG7FnNlmgnUor84e05Z2xTxp5D/LYQg9PaDgf8QGy+OZTaImuRPRRIDCuZh4rUDbJaP5jvaQQbpYL+MBXO+K1trzcz/noxHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k80kKPHnuHFSXdsuem+LXI4qQAp3piq6SXosD3N/5CM=;
 b=Y//avTh4jpEXJ2CXXqrHneVtGh52ocGlDt+gt1DcSsL3gJ26NNhiPdJuJ/6WZQlTiVbXmU5SCmOFAQIigYpdFFWn5GlNRh7+gksJ3ziMnA1OsvKBLzXd9fEWxFkvmGR7e44ryNAUY6auaLNT0sB3+YmixjA+Y14BHO9osErhDio=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS2PR12MB9567.namprd12.prod.outlook.com (2603:10b6:8:27c::8) by
 SN7PR12MB7275.namprd12.prod.outlook.com (2603:10b6:806:2ae::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.8; Fri, 3 Jul 2026 18:05:01 +0000
Received: from DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5]) by DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5%2]) with mapi id 15.21.0181.009; Fri, 3 Jul 2026
 18:05:01 +0000
Message-ID: <5a948f03-5912-457b-9240-88c14e0a5077@amd.com>
Date: Fri, 3 Jul 2026 23:34:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/16] ASoC: SOF: amd: add base platform support for
 ACP7.B/7.F
To: Julian Braha <julianbraha@gmail.com>, broonie@kernel.org
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
 perex@perex.cz, tiwai@suse.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com,
 mario.limonciello@amd.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, sound-open-firmware@alsa-project.org
References: <20260701095759.1012929-1-Vijendar.Mukunda@amd.com>
 <20260701095759.1012929-3-Vijendar.Mukunda@amd.com>
 <cb450caa-58d6-465b-a694-bbca3949e3be@gmail.com>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <cb450caa-58d6-465b-a694-bbca3949e3be@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4PR01CA0064.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26c::14) To DS2PR12MB9567.namprd12.prod.outlook.com
 (2603:10b6:8:27c::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9567:EE_|SN7PR12MB7275:EE_
X-MS-Office365-Filtering-Correlation-Id: fe5d8bea-11c0-4b96-517b-08ded92d9a13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|18002099003|22082099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	Cj0u+tMv7ZN5UlYqhSCqleW8mEpAswjBgzHEHRz2rdqh8VOCnyTNU/ap3exOGCEe4FTSSm6ozhxO7Bh9iKrXozQZD6LjdoBsgHLyMNVq6arPNfKpB2mPbCibMx7Mjk+6+DCu/sUNzkIMcbv8a9bQLujAiMG2wK2VCelh4QbXxtrR0H1QO8R0S2sqT1iU1hw4goIh43jQSBsFb+P0f/T5+SaKVUATHxXYReNZOSP7PMOMOW2eN3hFZaggPz6xg/gDaP3QkU4XFd8ekvjTTMEWTVc2j5MYNe5yY7tKD/hbvCFO/rVQCX8HHBhZNjsXiT4IZ3i4q3rU1SjdPE6Qv7WAuhz1bytk3qK5IEq7xAlHRNA/MvsIVd+RpZdXgLfJgKEpiisQlM22dCJrv9GX/DY2bSH1nnG2nJHZGd6o78kwkqWSFjBYvVqE3clGnPdOgif2OzqhDnGhF6S1EKUnReqpuAQrL9JvEFUHilszWsLkHUdhAuHb9WjvYQ50VSkSWvM6Yj+RfBvvDZpMwg+uTz27li3VpSEwTfo9DVkR/cs+m5n2RwYXjMhZxyUiTD4pB7tjBSI9iT8KIW6q+b/fHpxkiWk8QGABu6Q+dceA2V/O4xJWDEHBqn9e0Hf1uHwgE0xDhKRwvdNWtBRUCMQhxq3LKE9z8aX03tpTQtbcG2/mrN0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9567.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TjdJWi8xcTB0VjJURHgyTzA1UEkvVVNBR1gza2hRMDAvZDh4amhwb1dLNzVp?=
 =?utf-8?B?V2gzbFAxbWQxUUZLK2wzYlkzMTI4bkRmNDJLK285RE1GeUpJU254Rm5oWEcr?=
 =?utf-8?B?RktINy9tVGFDWXVhTTVjRys4WHVGVnNGOHE4QnA2OEZDa0NxMWxtOEZWR2Vn?=
 =?utf-8?B?VDc3MWQ1YjE3VG9FcTJHak9BcXRmR0NVb3craDU3RE1ISitlNnRKd1pSRkh6?=
 =?utf-8?B?V0N2c2RHRmhGY2s5RzFpK1RveTlFUU9iaXNaeWp4MnlZaHBDemVkbmorK09B?=
 =?utf-8?B?WFcxMlNMTEw1OGdGNm1XOFVrNHNZc3gvUXZaZjZaMTlzb20vY1g4a0N6b1Ay?=
 =?utf-8?B?ZGl2YXBpbGJFUklrblpoWWo3S0pBUGJjSTFaaklNemRseTk0ZHhFV0hMdGNu?=
 =?utf-8?B?NW5mZ0g5VStiU2dGc3dMYU9seWJ3MXA0WUJOc285ZjJCa2RHcDBzZlkyQytJ?=
 =?utf-8?B?WlVGdy9xcS9ja2hYc2FnVytWaVhqdzBNbndKNWV4dllySWhZVS9uZ1JmcDhs?=
 =?utf-8?B?cmRjRWpWbGNGMzNlcVVHRExjVmJ5NFJ4VmYxNG03V1ZZdXQ0VTduMG50UUpK?=
 =?utf-8?B?bVpwV3g1U2JBV1J6dDFBR0ljWUpZTHgxR0pLc2ZOdHZqR1Z1WEYvQXFZRDJi?=
 =?utf-8?B?RzFxTVlhbVhRc3F6Ti9SL3Jja0xrRWhkT1BQOGNBR2JNRDlTbWJTdHlWT291?=
 =?utf-8?B?Y0pNZmloOTQ3dCtWSisrQ3hKREw4SGsyQU5EK0YxZEVyREdHWU1EbWZoSm54?=
 =?utf-8?B?V21VY05ORmQ4UmJxNG1aVmZGeWhzZjJYMjNYZUVNZ0d3c1hZdE0xbFREb254?=
 =?utf-8?B?TmhKamhBRVh4Vkh6L0VNS1FJTnVXd09OMC9oMWRSdGVqS0dFMTlad0VRMjZv?=
 =?utf-8?B?a05KWUdPc2s2cXlkVDRxR0ovOXRBdVlwdHBQTW1XZThpakFiNllueXB1bnly?=
 =?utf-8?B?aVBBQ3J2UWQ5ZmJUaFBwMllvbjFRUGpHRC9jdW5NS252SHRmeDNqcEE0WWpU?=
 =?utf-8?B?b1RzTko5K20rWmRVc0V3UXk1NDlrOHlqYWl4L1NkbTlLZ0phYitRTmVWMExz?=
 =?utf-8?B?MjhIaVZFUG5SRitVSGxRM3RmaENyK1hrVTZIVFhWR0ZOR3Z1WHlLUW9hVHBE?=
 =?utf-8?B?VFVqcTVWeGk4SDNZUW0yNEQ1NjhacksyLzdtK01Dck9jejdMZ2xEbUFtWXZU?=
 =?utf-8?B?WjI2MzcyYzQrVEVMbHQ0bGQxM1VZOGNTZXlyc0loVnpnUTJKcmVUWWlYODRr?=
 =?utf-8?B?MHg5VTJNdXlNa0Z6eEdsY3gwMEZ3MUpZWGMrYkg4RG1ldGtiTjM2NUJUUTFx?=
 =?utf-8?B?VWdyV2xyUnJEMkM2WTNQVnVyOG9IUHRIeVpyaElRR0FYTDhLRTlZSUZBejUy?=
 =?utf-8?B?UG5DSWQ5MEFuQXBzY0M5MTlEdlRTaXZoVTNhT05wT21iVHVUS1U3NSsxNllt?=
 =?utf-8?B?TUh1UHE4WHBOVjRVUHM5eVE0WjRsNFFoMmVMRkUreDdEQ0V5dzU3dzFMZjdH?=
 =?utf-8?B?dlJBKzd0TzRuM1lQakVNM3AzU0paMG1jVE1yMy9XZHd2b0ZkdzRlQnVPVjZH?=
 =?utf-8?B?aG1Zb1JpN0pqNy9qMmxLcFFYS05wT081T1JNaDZ4dEZYaXRBRGlPaHE0Y1R5?=
 =?utf-8?B?cUVzbVJYNnBJNUZRVEhPZENXSGhXa2wvTzVaem5hbkgxSjl6VXJTSU5UVzhT?=
 =?utf-8?B?ZUlXaXpoNUNndUIrSi9nYjZxbTZjSUlrL3oxM1B4VEc4b29wdWJFaVJuMkJS?=
 =?utf-8?B?V0lRbXBoNTR1cEtpTVhxZE9hWklCVkt2cGxYejhkK1hkMzFGRmRLWThZV1N2?=
 =?utf-8?B?SGRGdk5qamU4cEdyM2VXVGlXaFFpV3VBOTFWcEQ0ckJrOWdaTkZueW9ubUEw?=
 =?utf-8?B?L2kvaEFpVjFGSGRzelY5L0NIM1hXMkFYT2hMMUhlcHNXVDQ2a05KNVpRbC94?=
 =?utf-8?B?c2w0UHcvZzYvaDlVNTJBVENnbzRDMVRUV0ZPdG5jbHpESFgwbTJhN1UrQkhR?=
 =?utf-8?B?WVJzVG1NN3pTeGdiQkZBZ1FxcnlNL2RBSXhva3FOa2hXcEF5MGtUUDJVQ3ow?=
 =?utf-8?B?ZitSdkp5WjVmeTkzTXo2ZTYraW9rMytkTHZNdW1GVmgyRFNhaG1sbTlpcUgw?=
 =?utf-8?B?aXZXRHlRYjdmU1Y2YUlvS0hhM0N1a0ptUXdyNVJ4MU52bVhtb0dTSkNqaEw3?=
 =?utf-8?B?bCtSNjRWVlRyRFVoRHFVSndtNnM4TStlSThKaWxHN3JwMjhuWTlQQ1ZmRmw2?=
 =?utf-8?B?anNKaHI5V3Z5dVpNNmlRS3ZROGdOaW1jbjllTEhYZ0VXa0ZmYTM2NWJyaUlj?=
 =?utf-8?B?Q0VnOUVFenU1bk5pWW84Ri84ekp4UHFhSXM1Q0RXSXZWemJqbEdwZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe5d8bea-11c0-4b96-517b-08ded92d9a13
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9567.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 18:05:01.7834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wgWmdaIrYUkNuCwEOBYcqMpFIgE3lojeUmtAJC0iAMEuYMAW7+HJPMw+HP6J/7fyXrXB2ieZ3zZQ/Di5Q4ioSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7275



On 7/3/26 22:53, Julian Braha wrote:
> [You don't often get email from julianbraha@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> Hi Vijendar,
>
> On 7/1/26 10:55, Vijendar Mukunda wrote:
>> +++ b/sound/soc/sof/amd/Kconfig
>> @@ -103,5 +103,15 @@ config SND_SOC_SOF_AMD_ACP70
>>          Select this option for SOF support on
>>          AMD ACP7.0/ACP7.1 version based platforms.
>>          Say Y if you want to enable SOF on ACP7.0/ACP7.1 based platforms.
>> +config SND_SOC_SOF_AMD_ACP7X
>> +     tristate "SOF support for ACP7.B/7.F platforms"
> All of the other config options in this kconfig have a line of
> whitespace between them, could you modify SND_SOC_SOF_AMD_ACP7X to
> match this style?
I'll address this comment in a follow-up incremental patch.
Unless additional review feedback necessitates changes elsewhere in the 
series,
I'd prefer to avoid reposting the entire 16-patch series for this 
standalone fix.
>
> - Julian Braha

