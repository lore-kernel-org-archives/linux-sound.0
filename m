Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010065.outbound.protection.outlook.com [52.101.46.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7CA29E0EE
	for <linux-sound@vger.kernel.org>; Tue, 28 Oct 2025 06:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761632055; cv=fail; b=ZNNAQ9SsBP8Y1BoLdYPwKfJOX1D7/qfAUuacQ+VFC/ubiRRTL+kT9h+EiMx3Bv9ROxQkAMWUG4Kv7I/yPiyHXSqEphBbH4ajVdvFbRCG7yvgkCBK8OuKqVtxnLg91wPpKilt7alyh1RmJUzQY1NLL2hK6xkKYsv5LYwDKuJtCfM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761632055; c=relaxed/simple;
	bh=vPFoawEo3bcMXffsqnYmsIStSpb5UI+EP1iR3LA8FWA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VR6rcOJdu1zjNtdfio8IN4KNhqra5Ng8R8VCp7CHhNKBzVwHtcUlYeXSLdrxD7UEI3V+rhi+KI4ZRD5gS9F4u/OjLjRHWlgqzh172TAscfItC/FiBToz0tyyBWVAT92g0iy9iSnG73+nR6niCU7s6bvCFv80A6rFrigDmkbeJpc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=OlSUtNLd; arc=fail smtp.client-ip=52.101.46.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="OlSUtNLd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vqeO5q+YRqKJPnvutetp0Sk92rY/slbjm0Xm8K9h8cPgp1vn/yNmCcO34Jq5S3uKpEwR/X81CVxi7Q46++DmDgqFkKaG7B5AX9ho4S5JdUkcapDxoCIEVMrigGUZQMQGxybfcTdZB339wPpGtW1cY0FmC/BBGgO7jq4WKIVi8DeyM5W21GUJliaV94Q6R7XOb3S1fDbFhIaaDFYlelpADSxncDwhH6GUXhlA7yaaf81KgxfIIROGKmwUBDiBcNShISlJlb/cYaKeMho72Qk6ZlfJz8FN3e2NCfr9MruUZwePgoTD+WR1S/eozAgS2tG3gUrF8ZylUkb/MubwKZ0WAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gaSAShDk0H2LmkBkg2Tb9GdZvI/vjECRyKKNBLn4GPg=;
 b=mRaGeEkbTFlSaa+zFt5KOUbHhE1X83WZbs7NeKuewTSs142i7G+ZnREfD9JQ7LOV0Exet9eScw0b80Y+kO9xOGdv1n99A2gnXfof1L1Jdh/Bb5FJm4VYv079JKg8h3mJ52GbY0K4tSFp2OM/oq/8VVeEiJtPtRYErnHIMvxDc2ml1jtaarrPYiwmg1006nEU/vuSDZaedmEYJm//a7PVJ2ElAmVYGAM6wTuali2nI2IBMSDACeWGA+VgL8PLOe4DDk5WYDBJdDBAUo+ZUNFbru5zfG50S0G/63eQTmw8wAU5U18b6QGM59mFPNe5SAzPlDIAllTxLMBm0WXW8Fq7Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gaSAShDk0H2LmkBkg2Tb9GdZvI/vjECRyKKNBLn4GPg=;
 b=OlSUtNLdxyJR397ZeN6XZpsac3Zeij3Wg8y/CNCJrDVICgVmfJw5nqU7NkMt9vKncSxf7FbswMdXfjWFZPYFiMhWc8xFPhd0uQajrrWNj2cR9iDkmDaKKj0Ky0NUZCaCgmJq5UdDA29tTZWRUgw/9uj7c+O+QyFuE2nHvMZaKTA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS2PR12MB9567.namprd12.prod.outlook.com (2603:10b6:8:27c::8) by
 CH0PR12MB8552.namprd12.prod.outlook.com (2603:10b6:610:18e::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.19; Tue, 28 Oct 2025 06:14:11 +0000
Received: from DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::5c31:b454:e529:99f]) by DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::5c31:b454:e529:99f%6]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 06:14:11 +0000
Message-ID: <c275a66a-66eb-4812-a59a-d84db9312c16@amd.com>
Date: Tue, 28 Oct 2025 11:44:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: rt721: fix prepare clock stop failed
To: shumingf@realtek.com, broonie@kernel.org, lgirdwood@gmail.com
Cc: linux-sound@vger.kernel.org, lars@metafoo.de, flove@realtek.com,
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com
References: <20251027103333.38353-1-shumingf@realtek.com>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <20251027103333.38353-1-shumingf@realtek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0143.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::28) To DS2PR12MB9567.namprd12.prod.outlook.com
 (2603:10b6:8:27c::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9567:EE_|CH0PR12MB8552:EE_
X-MS-Office365-Filtering-Correlation-Id: 98971bde-01b7-4f74-1fc9-08de15e935d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L1BZb0gwR2VyVXc4d2JHUUhrMTMycjk4b1JJVFdlNlR1WGJTNXdDK3hVemIw?=
 =?utf-8?B?N0NFaXRoN25mQUwyaDdMRlNOZ0E4UWtRQTA3VmE1UWxsRmlFeW5YSXBseFFa?=
 =?utf-8?B?M0VQR2FTbndSZDJFUzdjcDZ5TTRWaWJ3SEEySExyNjUwbzBWaXM2T1FHbk4x?=
 =?utf-8?B?UkNLeUs0WGVYbnJ6Qm5SWi9oc2ZxN2NCYlBRYlVTVGVKOElBOXQ1b2NyRUt3?=
 =?utf-8?B?OU5UV2pic05mdStFU01ZVXl0L1UyS3dtOU1wM200TllKMnQ4ZXI5QXc3elJN?=
 =?utf-8?B?ck03QTV3bjNORmtxaDNPbmJOZndSK1owUnYzVDBTUG1wbEdiTDBqZCtEYVdT?=
 =?utf-8?B?UUZSWDMzVHRtMFNNS3NabnVJd01JUUF4bnczSXA2dUVQbGhlSnVHWGh4TGRo?=
 =?utf-8?B?TlZ3aXROUUp6Y1hGOHNaUWFhZFVzVjBkMFBmMUtsZ1JmSStjRnhzbUU0OEJv?=
 =?utf-8?B?ZXplM21TK1pDOStNeHFUcTFlVWQvZ2E0cWI5T3hndzRUbkxVaHpmYmZFekZa?=
 =?utf-8?B?UG9xOUZVdVVMTDNjUVAzdExhb2JEUmpnTEJRUWlOQXE1Z3ZJTU1Ta0FsZThH?=
 =?utf-8?B?UEFqUVUyY1ZRUm9mTzVwN09tTUV1emQwYTUxb1RKK0Mrd2hEUnBsZEdxZkQz?=
 =?utf-8?B?TzloQStJbHpjUldEV2I3YmtkSnZxRW5iN0RoSUg5eGIxc1pPT1JrZWJITmRW?=
 =?utf-8?B?QzV0OTRvTWY2aG83WDVxd0V3K1hRNUM5TDZ5N2lhSVFqMzdXZS9HSGk0VVU4?=
 =?utf-8?B?Y3orUk1mSkxZbDdDb1pOT0QvY0xMdXl0eGp1aDU5eUFwMlJvS0NqZ2JRWk9V?=
 =?utf-8?B?ZitsbDBrVloyUVIzY3RZTnAzaU1YdHB1cElzZW5TNkhUR3U1WWZyNDI2SlFD?=
 =?utf-8?B?T2pUaTRBNTA1bXA3bFdDQVU0WDlrL3FudEdDbFpIZTBHUEFCMVd3WFJZcUlq?=
 =?utf-8?B?TEdQaFlndVl1a2lkSzZQN3htN0dSUW9Yekx6OTJLYjRFR0gyOFRtU0JlU21t?=
 =?utf-8?B?WG55dWgxUWhsNWZrUGxXb21yTnFUTFdnUkllejdHTzlENHptaTNrSHZVQkpF?=
 =?utf-8?B?VkNQZjVhZmEyUmg0NHNGSG1tZFVyUFNFRlc1eUtuYUIzZGRiS1dyMmZzWm5U?=
 =?utf-8?B?d3VkcGZtQWpHWktaRFlFK1lhMS9OVHF1aU5xRFp5NUNqR0JjekovZ1lQa0JF?=
 =?utf-8?B?cUZ4YmpmOE1zTHhFTDNSbDNFY0RwNnFEVURQdFRyTWJRZ1lHb1NlaFY1ek1U?=
 =?utf-8?B?TmJrbllkbXFJaVJxUHF1a3NwZTVGUU13UEl0MjZqU0tRSVdGdmE1NmhBL1RM?=
 =?utf-8?B?M20zejdYeUY1VnQxREhTWHV1UDJDNWpDanJtd0dmVmVxZzRjRENBTEtLeWZa?=
 =?utf-8?B?NEFGd3hyT2Z1UzdGUHpLaE1wcGFHN2dCR25ZZWZYOHpzcHlaZHBhU1doOW9h?=
 =?utf-8?B?ckxKYXFiRjVQa2hQSkpRTEp0OWhGZGVvZndGMWpNM0NYQzkyQlNkdHR6MzRw?=
 =?utf-8?B?SkF4ZWpYaWRDeGYzd0VDYnltQlpFL3BFR3hNaDZWNXNWVXI5RWVOcGNUOG1Z?=
 =?utf-8?B?ZUt4OUw4aDdLa1lYTG1FM3dvYWNGWGg0K2VxSDVVMUFWU000UFp2dFZXL0JX?=
 =?utf-8?B?bGJtb1NiUXpsL3gyYVdValdJOEwrQ1Eva2NIWjQ5UmJ0LzdoU254aXpLS1B1?=
 =?utf-8?B?WDBNM3N1TURSN0lwVzNVWWhRZVlIclVsU1VjdWkwUVFaV0I2RGs5RElBZGNS?=
 =?utf-8?B?enlSbkpnQjBNajQ3OVFwbFBvRVJoM09CTnl4WlQrWTlEdUk5ZjBpejRPV3BM?=
 =?utf-8?B?ekhCa1BtKzZKK0MyUmRxMjkvTjJKcEpKR0dHUVY1bmU1anFCalhaSzRmU1ps?=
 =?utf-8?B?ZU5VT3RyODVnQjIzNGxuTCtucTZ2NnFVRXJ0Mzd5amtFdW02Uit0NlMvUzg1?=
 =?utf-8?Q?6QQMetJe+zO1e/jl/WFdJLEZ/zJHrinP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9567.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OStpVDQ3ajhNNmVZbWZOTWZkUUlldjV0RjVIU1k1NTRobzczS2cxTkVLcnBm?=
 =?utf-8?B?QjhPK1NIcGtmcnhncHpJWHNZNGxmdzZjeXZOWGRlMElWM1pCTWpzOVBHblFt?=
 =?utf-8?B?ZEtISG9BdVhVYnNwZ0liU2U3eCtiVGhLcVRFa3U3V3FUTUYvWjUyNkxBcHFm?=
 =?utf-8?B?NlFpL2o0ckdrZjE3TndBbDFXVkpTTDZnT2h2ZjdZTDJkcGZWNXRqTVUvR2hB?=
 =?utf-8?B?cXZsSWJCa0dZTTFpMEZ5eXpLd1lJdlpFQTl0eVlEVFN3dzM3aGtoazBwUksz?=
 =?utf-8?B?eUxpWTl4bWoyM0Jnd2dkUW0wV1ZhYms5aW01RXZJVnl3QkhUMlJIWW4xaXky?=
 =?utf-8?B?QlBsNGhhd25Ubis1akMyS1h3dzZPWTdtVWxIVmdubWN4TnE2TXBPUDVPOVl2?=
 =?utf-8?B?STJyalQ3bHE2TCszU1VtMDNJbnRZRnZvUk1hRzRnR0kzb3k1OVRJTHpWZXhx?=
 =?utf-8?B?QmZLUjM3aUNHaVlMV3hySmhWUXlvWVYyRCtrN2pDREdURTVhSlZRVU1taGcv?=
 =?utf-8?B?T0hDVlNObWRxRHpySHdhZUVsREZzUHFtdElCSHp4d0Y2VGZmN2h1c3ZHN1RX?=
 =?utf-8?B?U3VINmpVK1BGQTNnZUVQdjFvRDk2LzdJcTNSTnhMNjdYWlVqSVdMcHBUQ3Rt?=
 =?utf-8?B?VVhtUHJXRkFhRHlObzhEK2dwdHBoUXdpSjZLUHQrYXAydFJGMDRpVkk3TnE1?=
 =?utf-8?B?ems2MnQvMlB1QkxuZFRlSFRhQlZ5N0M5WnJvOWFRdmhXNHpZM0NDazM4b3o5?=
 =?utf-8?B?WGo5YUR5Nys3bjgxdCs4VEt4SjB6Rk10ODRpR0VUTnhKYVJjNUp4elBQNXor?=
 =?utf-8?B?UVorTG5EMnA4S3daOUxVczEzdmtDc1dZVEpyRVFodkVZbllSajVjbVYrV3BM?=
 =?utf-8?B?WTFTQWNaaGJHRjRaNC9JWmxBd1ZnU0ptZlJNNmd3dWdJeHBnSUErd28yQ0JY?=
 =?utf-8?B?U0huejA5eUV1eVp1SnRQRitTVFpLbkVObDZuc1M1am1XRVllcE90MElvV1NE?=
 =?utf-8?B?MGV1L3ZGNjR5NDN0STRaTTBDN2lsMEdyczFwdFllUU9QU003eXV0V1VoR3J1?=
 =?utf-8?B?VHNXaDgyWEc0WDJIUGRRaERsWm1peSt6MGtmK0FQdlhwSWFyOGpha2F4d3VB?=
 =?utf-8?B?M3ZURXUyTGQvclQ3cWhHOTUyNGdOSzk4V3pmSVBzK2kvR1o2SzAzWFdBYWc3?=
 =?utf-8?B?UGxXOWVWbE41a2JuaE9oVzVmQjI0UE5PUkZESjQrdmROMUdKdUR0ek8xcHQ2?=
 =?utf-8?B?UUE4YnZ5OHUvZmUyTld1eWgyaVA0dGsydDVEc3ptREwxR0QzOEI2SWp4K0pS?=
 =?utf-8?B?RGhjKzVadE5jWTVKdUJvTFQyam1iZEwyclQ4Uk9RekZFWXo3ckRTekJQZHdl?=
 =?utf-8?B?UU8xcVUwbkZHcnpVaWszeldEWXVaNkdpOGVYaXBtVVFEZVZ4NGp5VlpXalBY?=
 =?utf-8?B?dkRZaGNDakZsMDdUY1BoOFJhYXdyOXF1Nmg2a25vREU3ajBHTjRBQjc0WlJG?=
 =?utf-8?B?S0xndlQyMkVTVGZpNDNlQWc3T1pXY3lIbUUxdC9Gait1M3B3MEhFYUdaQmRu?=
 =?utf-8?B?OTJnN1pvMkVLNlJGeFU3cDFVd0ttOEpBVFhWcDQ4TFpPNmRjNWRqRmZ3VWxH?=
 =?utf-8?B?UVcvU1EwNmpmc05Gd3B0WW1mcEU3OHcxNVo5T0RmSitxNVpTQU96RTFheFJN?=
 =?utf-8?B?Y2lKRUdNVVFqNjVnbUJhbTYwK01IalNlb0U1RUwxNEFmKzJWRldacllIRHlV?=
 =?utf-8?B?eUYwV2hWVDAvTDlWVVpra0lVVGxGSWs4RnNDOXBuS3ZsK04yTzUyeGVuZ09x?=
 =?utf-8?B?TFJFWWlDYThVa21SRmlqV1ZwRDZlYWlqaUJSYVU5N09Cd1pXQWc2RkFoSldE?=
 =?utf-8?B?c05UcTRFTlZlZUdvWGk3cnVEL0JYcUpzMUZnQ3ZUR1ROK0NqRTU4dDJlYkJx?=
 =?utf-8?B?dE1Fb09HdGdiN2QxaGN5VjZOL212dzNkRDZ4b0dkTzE5RHR5UDhrbENtdUdD?=
 =?utf-8?B?aXZNa2pISUdOc2lpSVkxNTNBS1hIYWw2VVZTeUtGZnBzeDRTV1doMGhQOUZV?=
 =?utf-8?B?RzRMZG9YazZCcmdxOS9acVZyNGd4SEg4ekZFcmFGNWs5aW8xRVlCeGIyNmNR?=
 =?utf-8?Q?/+22GMwXCtnwr1CUEPCMXrSUA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98971bde-01b7-4f74-1fc9-08de15e935d4
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9567.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 06:14:11.1522
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ck7jEMIk8Gnv0D2jjek8M55BGpgPVUiP5FfqBoKhJDYhP0dMmAfG90LUvHtXe3yW4M3quZ2kiYz7pimL3K61CQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8552



On 10/27/25 16:03, shumingf@realtek.com wrote:
> From: Shuming Fan <shumingf@realtek.com>
>
> This patch adds settings to prevent the 'prepare clock stop failed' error.
>
> Signed-off-by: Shuming Fan <shumingf@realtek.com>
Tested-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> ---
>   sound/soc/codecs/rt721-sdca.c | 4 ++++
>   sound/soc/codecs/rt721-sdca.h | 1 +
>   2 files changed, 5 insertions(+)
>
> diff --git a/sound/soc/codecs/rt721-sdca.c b/sound/soc/codecs/rt721-sdca.c
> index a4bd29d7220b..5f7b505d5414 100644
> --- a/sound/soc/codecs/rt721-sdca.c
> +++ b/sound/soc/codecs/rt721-sdca.c
> @@ -281,6 +281,10 @@ static void rt721_sdca_jack_preset(struct rt721_sdca_priv *rt721)
>   	rt_sdca_index_write(rt721->mbq_regmap, RT721_BOOST_CTRL,
>   		RT721_BST_4CH_TOP_GATING_CTRL1, 0x002a);
>   	regmap_write(rt721->regmap, 0x2f58, 0x07);
> +
> +	regmap_write(rt721->regmap, 0x2f51, 0x00);
> +	rt_sdca_index_write(rt721->mbq_regmap, RT721_HDA_SDCA_FLOAT,
> +		RT721_MISC_CTL, 0x0004);
>   }
>   
>   static void rt721_sdca_jack_init(struct rt721_sdca_priv *rt721)
> diff --git a/sound/soc/codecs/rt721-sdca.h b/sound/soc/codecs/rt721-sdca.h
> index 71fac9cd8739..24ce188562ba 100644
> --- a/sound/soc/codecs/rt721-sdca.h
> +++ b/sound/soc/codecs/rt721-sdca.h
> @@ -137,6 +137,7 @@ struct rt721_sdca_dmic_kctrl_priv {
>   #define RT721_HDA_LEGACY_UAJ_CTL		0x02
>   #define RT721_HDA_LEGACY_CTL1			0x05
>   #define RT721_HDA_LEGACY_RESET_CTL		0x06
> +#define RT721_MISC_CTL				0x07
>   #define RT721_XU_REL_CTRL			0x0c
>   #define RT721_GE_REL_CTRL1			0x0d
>   #define RT721_HDA_LEGACY_GPIO_WAKE_EN_CTL	0x0e

