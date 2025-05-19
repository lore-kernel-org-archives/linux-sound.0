Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2072.outbound.protection.outlook.com [40.107.212.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E2D35961
	for <linux-sound@vger.kernel.org>; Mon, 19 May 2025 11:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747653115; cv=fail; b=Hl/if677E0KPg7csh+PrsH2wCkNJwALDbzBR/K8rgiHBxmM9evqivTiIZhNdA8OlTfgLQ5QkERnKfnsSa4q+Fs78ill2shtzoEEWycy4zgjzkAYlUH07RkFssujrQsMoPlT69m0TKFlPeF0yIEREemjNQsYZohfkqzfAGmNtQrw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747653115; c=relaxed/simple;
	bh=RMWKg7fhqStPMPAvugaJn+LjCxhMByoXlYLg6gqUtJ4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=p5f4knwjCq5PbFlyJBFHdi68Pq67YuZ5QohlY4U7e1ZMp8gmIOmyyPEB/zc2cmULkKpvxzRayjatchwATAXohKI7H1j4Y64OzQ56JWJ89uFNmYsSBtx/rvLtqynZRJpwEd/BTQZ9N0OCP1ZoYR0lBjvgSqm7lqFYxb2f1bmQNGU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Sw7G+t5x; arc=fail smtp.client-ip=40.107.212.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Sw7G+t5x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BsIlDd4D84SOILTenBq0hj4RWDpHaiYcKLQhPOg09paSjtz/6j84wBYMkpyQuDBDtE7nXGg94QZO2xQrtbI6GsANjx7GBsdfHcPcqGZ7RyAkjmGPgmkXQyILbUkc67a6oPtAL66yCvCUjdxDN+nyiuF9wOsHsMJQu29TggLsWVYpMLdLJtCS0hSF1SP0jvt+1gi6S+tzDpTpNbTfxO2uAewbN9xj2QZwq/FTf8y6GMEVaZspM4/e7E/MULVpV7OWBpBv30eJ1Td0wz0dkfXX/zGnJq2Juk9T93ZZp8FiMmdDGnn1saATTEBj+IGCdIUoDsgmrPDAjlXBOj1O77DnkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BOQz0cOc0HwPhb69xx32U91QBLLW+EyIe3rvSRazdGs=;
 b=ESG+E9fyNoJq5fKp5Cgyv42uRTEdxUKllj5xG6ZwwMHDZaMiz/hGoJBOTgOdL6S1k+UEqCuMmQS/ZE6ly4yye/Z6ed1lFsvYgqSCDE07KYWrpjoLfScQsa4EKRJFYFPPkeSwZ6rZ/v8+svUOVlveduU9MqIbeMrdd23/0qvI95gIVlFD6boO8GxkIQmvSLwg4VIPsfMTlcVUj2jbgnJ46G3QhmfxUqXmB3ABZzcMBEbyl9At3g02tfKfZsk4O6Bq6XN90XQXCkN349bZtfVHcOZpC8ibMGN+SVnqNUEDHJ7Rh1Ff6YHlYUIQbiurVemzRBR0G6b26y4gT6rVZEnIOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BOQz0cOc0HwPhb69xx32U91QBLLW+EyIe3rvSRazdGs=;
 b=Sw7G+t5xYHaZO6GlSQXSGmDTgsJbVUUNiF8ExTjU68t76fKGKiuhI2kzZhEwQ60/6evEawGPzbv3mL5xhLD+wUF7UVJbqsJolFmiZbC/teNxgxu9/oBuoWT29k4bow5Yp5ezIN/LlMhBBpqjNxb28dASnN+GwDgVakKt9s/88Q4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by SA1PR12MB6749.namprd12.prod.outlook.com (2603:10b6:806:255::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Mon, 19 May
 2025 11:11:49 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::512d:6caa:552a:7ebf]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::512d:6caa:552a:7ebf%5]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 11:11:49 +0000
Message-ID: <dc3ce823-8415-4ba6-b0f2-69fbf75999c9@amd.com>
Date: Mon, 19 May 2025 16:41:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: rt722: make regmap cache-only in probe
To: shumingf@realtek.com, broonie@kernel.org, lgirdwood@gmail.com
Cc: linux-sound@vger.kernel.org, lars@metafoo.de, flove@realtek.com,
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com
References: <20250519090645.2620292-1-shumingf@realtek.com>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <20250519090645.2620292-1-shumingf@realtek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4P287CA0109.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2ad::10) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4123:EE_|SA1PR12MB6749:EE_
X-MS-Office365-Filtering-Correlation-Id: a55082d8-178a-49a6-a0dc-08dd96c5f347
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RXJzdERhaEQ5Nk5QM2NEQjVRaHREZ0ViS0N3SjJuemxzWWhvelJRMU8zWWFz?=
 =?utf-8?B?NW9md29odmNjWlA0YWFKMTFkNll5RXNzRFMySy9RRzFpeitzYW1NWkh4M1Mw?=
 =?utf-8?B?dFh0STUrS0RYK0dya1lEM1dSSCticGhhS1k3TldqMlkzME1MclNnRE4wb0d6?=
 =?utf-8?B?emNycnlmZERpbXRSQWhib0VjS0RBOGU4dld0RVJvNi9FTiswbkJjandjYkdz?=
 =?utf-8?B?SEo1UHIwa3hNUTNsa2xOdm5PeUxaR2g1RCtvTW1IZWlSTHhqbFE2Wkt1bWp3?=
 =?utf-8?B?N0JOTXRwcWZLKy9xbTU4TE90b3VQK2tmcHI3dlgwWTluamtnc29GL0tzZ0Ri?=
 =?utf-8?B?NytReS85WEVpenY0LzJPeVlRZWtVRm9qMjUzMmFnUjcxKy84N0QzZWR2Um9I?=
 =?utf-8?B?b0ErSWtxZUlDVGdHQXdpNEZJc2RBWGlqYXNXWkd4SWdSREZBS0F4VVBlVUJ0?=
 =?utf-8?B?T3h6NVQzQTh3VThoNXdYbUc4cjVxOHVJVXFBM1hKb213b3FxTlhnTDNZUDBo?=
 =?utf-8?B?ZUZlTWFFS1owTEczTkdLNWczMkNRcW02YldyZDY2b1ZZc29jNzRTa3pRKzFt?=
 =?utf-8?B?VllFQ1VwdUVBOGpsL2VGMG1WWWtaamJhWlJXdG90bzlOUjZoa3pFL1hCVlVN?=
 =?utf-8?B?RGY1UDhaMHBOUHB4UVNOV09vQnVsbjZtdmNlYy9BSnhKeCtHKytXRWR2N21s?=
 =?utf-8?B?RHNxMXNCRnlOMkhkV09rVmFVWHdVMW5vbXNHb1JFQTJ3QzloakZLOG5adlhP?=
 =?utf-8?B?c2VYNE1PSW9zM1RMeGRpbUxFakFhaTVBbXp0WldpdE1jd1dyU3dvZi9CejFx?=
 =?utf-8?B?c3cvbEYyTDQrWmdWNktCTmtudjhFTHFkTldFVmdxSE53elp5VFI5TGNmR1A0?=
 =?utf-8?B?QW51ZDdER2xPMjdWQmFEejVhVHkyVko3UHhhYXU5dEVUU2c5QTVlVncxVTlN?=
 =?utf-8?B?MzFaNUZ0WmlRMjJiWGZRM29ndS8zK2FRenpWWTljSWVsOTV6M0J5QVBvYnpF?=
 =?utf-8?B?dWRub1lYUG13ZWRaS3lCUmFlMWwycWNMZ05pMFdzaldmU2ZNUHI4a0ZiVzc1?=
 =?utf-8?B?QmNsRFRkV3U3WXpKeHVmVlhpR0tianZpZnNzaCtNU3p1c3poRkl3QWs2SjBZ?=
 =?utf-8?B?M3VELzVEeWVLSk5NY1dobE9tTlJ1U3FwcFhqRGZSYWg0VFBJZHhTTUI3VHcw?=
 =?utf-8?B?RmRNWlJKQnJHNGJjcUVLdGNHZUpnNXJqNW93VHhYWUxXZnYzeUZTRGxQdS9J?=
 =?utf-8?B?NVZYRXphbzVLWmhYN3pyUEVQV0M2N2ZnR3I4OGNsdk01SmFOL2Y0U0hjY1ZJ?=
 =?utf-8?B?U0k2R2o3RUVITGtoTTFrSmVWbW5kQUpDS1NodUltSWJsSXdZUFU3Szd2UnhN?=
 =?utf-8?B?OHFtQWFxUWFXb2hhTStKeDFrMExDdnBDUDM1bVFSWWtYNHljQnJqVkdhSW50?=
 =?utf-8?B?R0ZhenJIMnZCQnlkQzBRL3NhSGxpTGhwcFpBdzVBZGszKzRqSlo1djAwcDJi?=
 =?utf-8?B?L0hhNW1USENZbkpFNGhQZGtIVm5RSklqZ0ZxLzZvQWxHaTFQdS9Cc3NKTDNj?=
 =?utf-8?B?RUZuUnVtYmNwRlo3d1p6YmJkOXptOEcvYTVqM3Q4VndyVVIvZG5Cek5zSXNK?=
 =?utf-8?B?QlVBL3ROaHhJdTlkc3NibkZlZTdQTFJmWjNHbGs0d1VFdkF3Nnl5cFBLM3BX?=
 =?utf-8?B?bWRDZU5rSDhXb2dGK0pyM1AwdG5rUk1TY0hDTmR0M1JjbHpZTnJsQVpucmdy?=
 =?utf-8?B?M25GODJ5djBlaS9KR05vWDM3aC9jaHJCLytXTlVMbjZ0d3poVlhYSVVSTUJv?=
 =?utf-8?B?YyswbWZlOG9VVCtheU1hMUZMQlFNUnE0YldRRFRUbG52eHFjaHV5NG1lNEtT?=
 =?utf-8?B?eXY5OTBDTkwxbTNZYldyalduM2Y5WWVpOFNOV0d3dUVtWlpNeTh3Qy9Fei9o?=
 =?utf-8?Q?tSzUW04dZEk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4123.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c1Qya3RUQ1NSQnd6c1RreXdBbUtYMUYwelRjUEpYcXJZRk1MeEtRZCtiQlhi?=
 =?utf-8?B?YTJKQWJRUUU4N1VCVUJjZitHZHZEOThucXZ3a01GV0NSeUNRNlpaYlRwUGhm?=
 =?utf-8?B?dnp1SmlSd0tTR0hJSFgydVJIbzEvamJjU09uL1JPcDU3SmxIYWIzQjF1K1Ay?=
 =?utf-8?B?YlRDbDJKelpqVm1rWEZBcmtFVFV3YXRESWZkM01ualRLdXlObFEvajFJNERt?=
 =?utf-8?B?anhrbWp2aEEwbmxQMmNJRnp4Wm5iSTEvWUc5b1ZEbVB4NW0zWjhNWGZTSm02?=
 =?utf-8?B?cjdRckRyUDNWWXRtdHlIc3UxYWVxL093bys5c0F4bFFTakJiL25PdnlJeUo2?=
 =?utf-8?B?dGZ6ZEJPc2hOSGViR05CdDQ2Z3dBaEx0aTBXMk5rNE9GV3IxbXZKaWcrQVJr?=
 =?utf-8?B?NnZnQkZDd1J6SVRGRXgvQUJmZ05ncXlPeG9TcFFsUXRXRlQxVFlEUnlkWWho?=
 =?utf-8?B?OVlpZ3cyTHQvSGZUMmx0dCtsWVplYnRFTEEyTHU0d0RWNWNYTVptSWtZcTNr?=
 =?utf-8?B?UDYvZ21Wb2xwdDNDc0NNdHZMMUluVWpQYzFBK2xNWXRmQ0ZQN3dodXA2bXM5?=
 =?utf-8?B?SHN4bDBQQUtXRWFrby84N0loME9nYlNHbTRaUElDTGlTSjRJaTRYeW9uSlJl?=
 =?utf-8?B?Qk9Fc050ditUVlYvUFg5REZpM3F2UjFJbnlaR0xUQmw5K2Z0akhuOE5FV3li?=
 =?utf-8?B?VWZ0SkQ4VGZENC81eE5KaVJDVURBcHRIUUhhajBZZlAveWYyWm5Ba3FSQXBu?=
 =?utf-8?B?ZEVxSUhIL0tWZXkycnd6VUd0K1E3cnROd2tYVWZNR0hlSGF5c1VvWWxSR2pB?=
 =?utf-8?B?aXRoMzFRcit5ZmpFNmtrZFNFNmVRMjc3VjRTOEZPNUczSk40TnNEZ2UzYkN3?=
 =?utf-8?B?RHRadm5OM3Y3UWlkVTA3MlFmNUNJZCtYcmYwemlLYkh5VS9SaDFIV1lVS0to?=
 =?utf-8?B?NXdNWTdxaTh1YXl3SVZOWFp1S1R0bDhVUjUzK25nVmRCUjREWlYxcDR3VFZC?=
 =?utf-8?B?dHBzN244blU3WHlmMXhzR0ZIMlkrYm1YZDI0ZityV2IrVHdBRTNOTXU0ZmU0?=
 =?utf-8?B?a3FuTlVvdHBhVHhlTmNpY1UrZzJSK0dKTG9GdU15WHZiclVTZ3VmdVQvTWNs?=
 =?utf-8?B?dEtaNDBNenJiZW5qWlhkT2FpYjU1alRMYlFKM3VJUE9ZMnRzT2dBR0JKYVZF?=
 =?utf-8?B?Q2h5YXZjUGtWa3pCRmozaFF1QlZLQnpzdzdNaWFpc0p0ZkswMzRuYkRZTkRk?=
 =?utf-8?B?Q2dIRzk3YUM1Q3VNRGtVbE52amVvNUlISzZOUWhtKzhjQVBTWEx0KzNMQ0d3?=
 =?utf-8?B?azI2ZjhaSnhncC9wVW5JS3ZHSW1nK3Iyd2g0THBDdlVTQWI1aVpxU25oditK?=
 =?utf-8?B?bGg0WFZEOXJleG1SRXVHdW9sSHlTN1BxS0c3SGg0NHJlUHBiM1hrZ1dzRzND?=
 =?utf-8?B?R2lFaDNhYm9uMnpZSk5HOFlZV1o1K3pRazI0RVdVU0MrVEdtYnRmNkxlNXU3?=
 =?utf-8?B?YjVyOHl2cVpGa1plUHpUNVpuSm93SExrVHhaVVhnMVVCeDdpSEZ5ODBVS01o?=
 =?utf-8?B?NHRxSC9DelUxaUNMQXp1WFN4VVUzV0VVVjNZYjFFU3lrdWN0V3dEUmN5ZVZl?=
 =?utf-8?B?K2o3bCsvZHRZNEZPU2M4U3BOdXpSTEM1UGpVREQyNmJ6U3huSG1jYmZpMkgw?=
 =?utf-8?B?TUwvSHJ3OUVpc2o4NUxwb2NubDNwM01ESHVRQ2dxSVJ2aTVnYUh5M0xxNGhT?=
 =?utf-8?B?aklVbmJSTHdnTWZJRWw5MGdCeDlZOUw2d0J6eUN2OEEyWGlFRTRaOEdzVSti?=
 =?utf-8?B?emFrWW9kYWcyU1VKTHMxenM5cHJqUlRWOUg0Nm96T09PcWcxR1hmVURyYmZO?=
 =?utf-8?B?aTh3elB6QWJjbloyTWZTL2dzZFRsbkdTWnA3VFZVRmFXMUR5OUprWVB2alNm?=
 =?utf-8?B?QmRGTHFldjd1ZHl3OHY3N08vdU1OL3ZJMUNiWFRqL1dQZ3ErNytlajhzYjB1?=
 =?utf-8?B?bHZaaHhOY0J1dnJVUmg1VE14MmRNa0hlcWNaWFhVYW5mOUpNWHFHMW4vejM2?=
 =?utf-8?B?THZaWG9VTzVQMWhxa1V0T1hkSGkyQ3JiY2ZJdkc0NmtOK3FSb0FHODMxUjZI?=
 =?utf-8?Q?926wzWtlYRS/w/BV5F0iptaFf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a55082d8-178a-49a6-a0dc-08dd96c5f347
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 11:11:49.6263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CaGHFf8ezFvXkrXMeIJhOozMHEB7JlUAgTBfsyrvE1j/9GgTSLcsgEHMUSIGn5FB0ZZOoIu9Bqm6Iq7QNYGvJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6749

On 19/05/25 14:36, shumingf@realtek.com wrote:
> From: Shuming Fan <shumingf@realtek.com>
>
> This patch makes sure the access to the codecs is cached until the device is enumerated.
>
> Signed-off-by: Shuming Fan <shumingf@realtek.com>
Tested-by:  Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> ---
>  sound/soc/codecs/rt722-sdca-sdw.h | 1 +
>  sound/soc/codecs/rt722-sdca.c     | 4 +++-
>  2 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/sound/soc/codecs/rt722-sdca-sdw.h b/sound/soc/codecs/rt722-sdca-sdw.h
> index 80b014456940..c5dd472a2c00 100644
> --- a/sound/soc/codecs/rt722-sdca-sdw.h
> +++ b/sound/soc/codecs/rt722-sdca-sdw.h
> @@ -34,6 +34,7 @@ static const struct reg_default rt722_sdca_reg_defaults[] = {
>  	{ 0x200003c, 0xc214 },
>  	{ 0x2000046, 0x8004 },
>  	{ 0x5810000, 0x702d },
> +	{ 0x6100000, 0x0201 },
>  	{ 0x6100006, 0x0005 },
>  	{ 0x6100010, 0x2630 },
>  	{ 0x6100011, 0x152f },
> diff --git a/sound/soc/codecs/rt722-sdca.c b/sound/soc/codecs/rt722-sdca.c
> index f0d3fd9b3d95..ac9588284a95 100644
> --- a/sound/soc/codecs/rt722-sdca.c
> +++ b/sound/soc/codecs/rt722-sdca.c
> @@ -1309,6 +1309,8 @@ int rt722_sdca_init(struct device *dev, struct regmap *regmap, struct sdw_slave
>  	rt722->slave = slave;
>  	rt722->regmap = regmap;
>  
> +	regcache_cache_only(rt722->regmap, true);
> +
>  	mutex_init(&rt722->calibrate_mutex);
>  	mutex_init(&rt722->disable_irq_lock);
>  
> @@ -1521,8 +1523,8 @@ int rt722_sdca_io_init(struct device *dev, struct sdw_slave *slave)
>  	if (rt722->hw_init)
>  		return 0;
>  
> +	regcache_cache_only(rt722->regmap, false);
>  	if (rt722->first_hw_init) {
> -		regcache_cache_only(rt722->regmap, false);
>  		regcache_cache_bypass(rt722->regmap, true);
>  	} else {
>  		/*

