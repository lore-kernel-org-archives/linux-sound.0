Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010016.outbound.protection.outlook.com [40.93.198.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5882DA76A
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 03:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784605912; cv=fail; b=chjLXpfuhfvoVRXVN779kXXEua17v31aw59Q5qI9myINWiC9BBKBTfVvBFDitBtlGkGpNFMRiCA2k0If2EllrgunDhNBgTJEofXQTk3r6fVH4LiqEf5b4mw2UuSmymlGX4RqWd1i1dsUOULPRjXCZSaaB0Pqyx+4G7gnkd+nRf8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784605912; c=relaxed/simple;
	bh=UKkCMnUuQvsJani2+6J68Mm8BTNWx19AhD/nVAildLM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VE42OIDhCJVJU5s8JOBEDu5BLw3sX8btOYWdI/L99d77zkZoLPwXNkpjaGA+CrInIAOak636qwgiJMMXnBcHeuXcaF7X1cPUDFYxqnaPYZzK6zg0HSqYHUHvcvGjkk1bsclZkDcDur0x2r22H+qUZPQxXdBDxcCw4sCjx8hbylw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=djs6W9gt; arc=fail smtp.client-ip=40.93.198.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="djs6W9gt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vDQSUJB/qUWFyGxryi+X6c7rXt5TC02xgvn6OTxlvPfGFytn0lW//toemle4zj5CfIVtJMFA7MhUldwbrurw3FC2fvjVbWhzUdcC/GO4nCWJHIj6Hu69mhBlqH2DCiF7chlyp+bSkVrfBeAtwtG7y8qNV6g9Y/ObihdGOtThstyHupBfAQw8JhlpJzBk/iaakqRvB0Ca/tPHBVpaDwDNpzdTYDMo+Wc40WJ7K8UOfI/YVZa5e4IWFkKy0dpIRCQu/vII6IfCHSXyKTIvbdb9gVTZLz+D/Fbu3pSEFwUU2XsZ5id+JnSlY9YCOxGADucuvpTljo7l27F89klDBEpNHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ahSRiYHqRHksfyev0k5KofBf8bBm/GCTwvNj8eAZWlQ=;
 b=JdgwLkmM6CXOebrRPMGB6wpL+IOWcuGZikYKB2uqVYhNJdJXgciov38rc0f2t+8to4MP7OGbiSzvYKklAupZK/fVAHrIyJ0xWcIcUnc8XUa0olIL/NgOKzTKcu7Q8aCDATNpI5/6yXm/iH7UPq9oHKnDgu8sACEdGx82+f40xkgOVLobaRUt15vPrrx9xKR6zB7Ty6ga4+AirDt/hbCt+EhKdNGFzfg9FP/N38uAKwikrTkRPRDEvRikSxnAVXXHb7bVIKD8DjkxVwn61P2Oyk53fPsmzmSa46YCSYEISr8eTnRBkP+Zj/DH8UZm/yacP4jWnVQE46z75gmo5Hr6gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ahSRiYHqRHksfyev0k5KofBf8bBm/GCTwvNj8eAZWlQ=;
 b=djs6W9gtiLJdujNXM6hKajbJEt1R9aixfdRoG3Zb2LxZmDFiH/vI4NqC+9CyTNghGh1ZGlc4al/cPCh6TWixm+HuvMGk56dyb1EJMPod5jiKM1UXX5BhdYDj0sGiiPw4dZparcfeJzQbE4CJisO7u8GwuwYSEPutUf2xRYFf5/g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS2PR12MB9567.namprd12.prod.outlook.com (2603:10b6:8:27c::8) by
 CH3PR12MB7644.namprd12.prod.outlook.com (2603:10b6:610:14f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 03:51:49 +0000
Received: from DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5]) by DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5%2]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 03:51:49 +0000
Message-ID: <095c3e8b-28d1-40b3-a789-4dc900a51b4d@amd.com>
Date: Tue, 21 Jul 2026 09:21:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] ASoC: amd: preparation for Card capsuling
Content-Language: en-US
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
Cc: linux-sound@vger.kernel.org
References: <87bjc1i05a.wl-kuninori.morimoto.gx@renesas.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <87bjc1i05a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0339.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21f::11) To DS2PR12MB9567.namprd12.prod.outlook.com
 (2603:10b6:8:27c::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9567:EE_|CH3PR12MB7644:EE_
X-MS-Office365-Filtering-Correlation-Id: fe9cb97a-65a2-4dd4-a07b-08dee6db6433
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	KdXi+6uk01iyvtStQoiMncokcrcIeWSaWtLhO/xys8Q6NRgqdnjQ5aM3esUyQJkcWthAsuK+Oy30rmc2B6gg+WAPUG4T55rg2yvLho/eFGr4t8Eskgx+iV2asEImcSvIM/67T/8KmrTdooqCLrEKv5vVD2IFjRdBCuEUfDZfTTDrIrAA8FaqDHz4uQPnoa2Z4xPz+JLyKEnX0QcXoE+qHzlpa9ye72YjmH7kyzxTdhrOu2J+Lo7ps1q3T6MmAwZQMSTXgKmyXS3v+j2uKZdyF4/zpzOfb50a+UUkQskB4VKjrviw42iz45xISgs4pES3SkYXvvqivVrwso4Kj/jQQqGY3RhPdnfAisgHM3elZ3Sd+DafYFZw59TaVXCOGz17zRHegVq206UU5wQzi2SMc3/fEypcEqiHzIDKSUI2ztx67WEtef2XSr/yJt7O/to/8w6d0Gt0ETIEC6Vx46M1IEsVwe3WxdkyiXNfGs8n+mys6peybglPAHPmdM5nC8/gxEycWtzXg4cNbq2oUVNsqKohqkAyf1kQ5j35V3/nwctMlCTNXwNfmb8GQOWuw6J84YG0DMdCiYqQWQ7R+f5OwjIesTozh7TIx4BvhoSHTg1HugJA5BIrzvHjB4c7ndnnv29wn82wfS2STeGgr54ENl+xIbIxhgmCAdxUjSP4j+8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9567.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZlUwcTIxcjBYNEZraWNud0dpU2lCTE9wYytMOUczQThFOFdRblBoaWFmbjJW?=
 =?utf-8?B?M3FvbTgyS1VxWGorVGFld1ZITnVRQjdOTmF3YnBtYzJxSm5zbU9FMVdMYUt5?=
 =?utf-8?B?ellmU0tSNmhSZzFURkVlL0FQQWxHa2FaOUNIOHkvWDhDUi9pMTBxUW9zLzNS?=
 =?utf-8?B?NDdtNDNseHJtT3VKd1F1QjU4WkFrQVlRd2FjdzZoVWVNMWJSQmozVXdrZnBx?=
 =?utf-8?B?bHBSbHJoalJYOS8xY1JoSXJmNTdPYW1TZkIxaEtlTktHODRpbnFoSzQ1ekps?=
 =?utf-8?B?NnFneVIzSlRxUmFuQXVIUmVvcVlmTndHQllxOUZoYVhPdjc0enZmVlNWVkhC?=
 =?utf-8?B?TTVVQzhTOSt3NjBPMUFqcFBzU2k1ZFdQMEwycURwYktLVE1mWVNlR2NDV0Fw?=
 =?utf-8?B?Y0hjSmtxZFg1ZGlXYXhZRC8zbTdZSDZwUGlXVUtNaDNvSTk0cHNnL1B5ZTls?=
 =?utf-8?B?RzNkai94T1NIZzczL0krYXJxN0M3eFhzaHYzbzBvaWZDbVBSZCt2aU5oZ2d0?=
 =?utf-8?B?NXZMZ09KcDRQY0pUdU5FZ0cwYjA1Nkk2Q0ZsdCswQlJHeEtKZncxMzhtLzVE?=
 =?utf-8?B?WHdQemNkd3NpUUVReWl1MDZqbkRaYmltWjE4cEFIMFQzWC9LazcwYTNjY3l3?=
 =?utf-8?B?eS9aNHFnRW5Ub0U5Yjc5aGtDR3gvRzViN0Y5a2N1VGtSY0xEOXJIQWFWOEJu?=
 =?utf-8?B?LzFLWXl6V0RSVEtPYnhlelY3U2tTNzhZNEpXdGlhMUhkQWtOOE15SjdNbUpZ?=
 =?utf-8?B?bWtUcHByQnVTLzFLZVUxTEdNd3BraG9QY1FyYUpvTlhjeHcwaEZVTUJLZU04?=
 =?utf-8?B?OEpndnhOa3djYzVDTnAydE5ld3U4Y0duYTN4L0UvZzkvQjlKY2YyVWFJcGNK?=
 =?utf-8?B?WmRMMGtvVmxnaDlpYjA2alZ0SEF6L2lCU3oxMElUb2xEeTNoN2Y3UVpnNFpS?=
 =?utf-8?B?WkNVUVVSei9xVm1UODVQdTF6cjYyYkpPWWVOQ3E2NGVBTVI1SEhCekhXbHUw?=
 =?utf-8?B?bGlOdkI2WVp0ckhxRUtJZFRSSjN6NkVQWU9pUFg2UkE1akFoak5ROGIyVDNM?=
 =?utf-8?B?QUpNQm9tMHNrSnNwcEUxeFFHcllzV2h2MXZEeE13Nk11c1lyOW42Z0U1SjZG?=
 =?utf-8?B?YmlvOWNRbHVSZmt3Z05Fd0U5bFBrd2wrT2o3Z21nZElDeXRsWnpVSW1CZ0Z2?=
 =?utf-8?B?M0FOdmNhK3NwdjdpYlozZmRGZUNhWU4wZFlkN3FsSURwUEZVWG16R0dlT3pE?=
 =?utf-8?B?ZnZIWHZ3djh6aC9xT3pIemZtL2N2Y3VuSHZVM1B3QmxNa3BBVitpNXgvSTVp?=
 =?utf-8?B?TlpjVkQ5NDkyakQrQ1VSYWp1a0xiR255UlZveEtER2swUzRkSDdUT3VYcDdv?=
 =?utf-8?B?d3U0cWt2NG9LcHF1Z0JKRE83WldERitVSWVZSjY5eFNvRE1KQ2tJbEl5Q0ZH?=
 =?utf-8?B?VnIxNi9IVUQ4V1NkMkk2QWlPdXNadFJwRDB4WW43MXM3Z2VFT1VRbWh1ZVlX?=
 =?utf-8?B?N3JPVXlTLzBGakJ1aDMvTEFCRWhvMER3MHZpSzJEbFY5TEVQVDBzU3V3V1BO?=
 =?utf-8?B?SE1uTHdTVFNUSlcrYncwSmU3RE5ycEpqVSt6WWZSdE53RUNsVUhTTWtoYVIy?=
 =?utf-8?B?QnNMSHg2QWRxVzRIaEd5UFhSc0FTZ0ZFeWVSOGFKS01nd1Z3TXR6YWZvT0Fn?=
 =?utf-8?B?d1BFdHBlbk9RRU9JQit1L0VvUTg1MnRpSTdDUm10N1ZsSUthcy8rbmU0dU9R?=
 =?utf-8?B?WjBab292UU12cTVMUkRIOGdzOG1QT3NKbnR3N1B5aXBEMDFTbHRnTU5CdE9x?=
 =?utf-8?B?b1c1d2NkdkxMN2VnV25XbzhPSmI0VERaZW9BRjYxelptbEdOZ1oyUHkzckNF?=
 =?utf-8?B?REF1RHZveXN1WHZKTHZpWmM5RmV4KzVQeVM3a2pEQ2dNUmhXNDZEaHEzZFdz?=
 =?utf-8?B?SlQvczZCQkJVbDFwUm5LSlVZRDFjMWJjSElUK1dReHBsc1JLa0N2ZzRpTHRj?=
 =?utf-8?B?M1A5VWE5Q0VPbTFYckNJUFZjYWpnYjlPODJmb3ZMeE80eDVjZ1ZNTDFuOHMr?=
 =?utf-8?B?U2xLZkJRTzAwNC82N2pDWkpHZlRId1U2VnFiL04yWEdzT1Q3WHlwWEIwQU9W?=
 =?utf-8?B?VDMxM1dHaThZMkhsdTdYM29jK1V5OXVjMUNpUW9VQW9NS21pRTI1Z0IwWUZp?=
 =?utf-8?B?MmVJYlEwV05KTnFVVlV1bU5oTW96VlFCSE5HRUtxK1ArL0V4elRkeXpEd05J?=
 =?utf-8?B?blJ1Z0J1dnFyeGxXTHh4VGZMQWs2RytUdTBJZk9CenN5TXE3SlI0MjE0Wldj?=
 =?utf-8?B?aE9FeEV0ZXo2YnpJSXFzZE5zNFp6ekNQQ0d5dmZORmJPUWVqRy9KUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe9cb97a-65a2-4dd4-a07b-08dee6db6433
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9567.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 03:51:48.9819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8CB9cR/v7wvRS7GtwihdptgB9SoGjmqlT3vvtISKWor43oO89fcYVQtnkH4yJCd1Z9yN03KMeHN3WC0os1ukTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7644

On 21/07/26 07:17, Kuninori Morimoto wrote:
> Hi AMD developers
>
> I will post Card capsuling patch.
> To makes its review easy, tidyup its drivers to reduce
> un-related diff as preparation.
> No functional change, but is preparation for cleanup driver.
Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
>
> Kuninori Morimoto (2):
>   ASoC: amd: acp-sdw-legacy-mach: use &pdev->dev instead of card->dev
>   ASoC: amd: acp-sdw-sof-mach: use &pdev->dev instead of card->dev
>
>  sound/soc/amd/acp/acp-sdw-legacy-mach.c | 14 +++++++-------
>  sound/soc/amd/acp/acp-sdw-sof-mach.c    | 10 +++++-----
>  2 files changed, 12 insertions(+), 12 deletions(-)
>

