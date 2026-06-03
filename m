Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012056.outbound.protection.outlook.com [52.101.43.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4F737BE8B
	for <linux-sound@vger.kernel.org>; Wed,  3 Jun 2026 11:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780487203; cv=fail; b=rDat9WAHVjuscfp0dcRVfJB5DD8ot62LBcuCXNdl6ePEUrm37R8LS8Ad9MMqBuwtdYSB72qhb7TdT54xuUDKT7KBQhLLs6gyjWq51hzjgUC932vDX08DJiO0cpf4OGu8853cQOWd2SU6vvGozyR8u9hvydLiAVzdXNKCa49/h2g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780487203; c=relaxed/simple;
	bh=3g45BPd5ou7fhgb463rWNlSfOPLTeJfiuA0kDBv6EoU=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DaxNAKi2fJHrBWGC3kDhAyEbXDh29sSZ+3hVI7cpIPH9QimSL8ejGfEScExC9/Jr9+Sb1KwJavj7/GzorAgMNQO5XG92D58En9j7HDYV4UZ/KyCzg7l/+4jaAqF8ui3ChRzNd/IxkZUzkDQT7743Do6M1YU5LX/Z/ZETtOsib04=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=yEacK+rN; arc=fail smtp.client-ip=52.101.43.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="yEacK+rN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KxhJsLESA5cQG0/hSJHRUbl2zT4als0S3RD5pBB6V1qbdd+b88w+Nf+CzBbw+TaqoaQrGL/+mU1k+VFBL/nhOaFwWsHZGjGFt8qqtMy0V0RQXblXxo1wkWtEU2B9QmWkjUJ2rrqaBQoll/d5utMVUJDn5N4Bm2EDjhOPwE99CgQcc2KyASI2VP0m9RSxPWO1/6F3rXW8aI/q1rzsL6bg6HO5cB2kK3XQxKnSOB+x42Ccb2q/nQjB28LySHQzzAxFS3r5xMMqd0bZy6ewIhFm7+pvJ2/yBf/YGMTKa2+3m3O5vEa6SepLy10KRbTH6AARpQF24yoZhHmQT6XICYHT4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R5GWF7bTKoH1igrJi40kbZmOmkTi+9m+8lo0E0gaBqc=;
 b=mNL8BfuuJjm6SUSQbj9MR6uOmr9qhuprfuzhDy9M506V1+H2iriPOiFmd0XET3+6h/Xi3ZJaHwGjxUD8JA3WKF/mD06JuR56a1g4l2PJNno3kQOvpiB9jcWwcK5BmvnNQy2b5r1y1iFZ5dksP+wlEJchhkbMIyjYy5OMymjjIcLvCp3MhQWjS1D2xAfTRoBFXQm8EpvfW57hcN7XrY1RS+KNErIH6pMQQgyWXEd834p9GgygV8PPEh3Lr1XkM74ZZyTmY1uojqRAWtUdyBlrhZ+Jw8hUNIdPwjWEJyt+czwuZDkv10IBCbW8nM/4cHxzvBizAxFTH36VEEWVwTePSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R5GWF7bTKoH1igrJi40kbZmOmkTi+9m+8lo0E0gaBqc=;
 b=yEacK+rNS2PKdpjysolz4oXSfeIbnkuJ8FaJhj4HpjOdkcFeWjMIfXmHchnHehrzsNFiEDizlv7yVt+uN4yy5knsXQEKV1X4eIdCLfehSy+8WJ/4vux93sQ3i1z0YgzieyANdIzIvqYYchwpQRs0HgT/tB8rTRyATP6zF6Bzhu8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS2PR12MB9567.namprd12.prod.outlook.com (2603:10b6:8:27c::8) by
 PH7PR12MB5596.namprd12.prod.outlook.com (2603:10b6:510:136::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Wed, 3 Jun 2026
 11:46:39 +0000
Received: from DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5]) by DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5%2]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 11:46:39 +0000
Message-ID: <031221ab-4797-4b84-8683-eb4fce0e4365@amd.com>
Date: Wed, 3 Jun 2026 17:16:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] ASoC: amd: remove unused machine
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 linux-sound@vger.kernel.org
References: <877bogce4k.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <877bogce4k.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4PR01CA0062.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26c::11) To DS2PR12MB9567.namprd12.prod.outlook.com
 (2603:10b6:8:27c::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9567:EE_|PH7PR12MB5596:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c3e79d4-1133-489e-dbb5-08dec165c5bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	StA0e/O0vuewEUxe47pFh+6FSBFVfRV7s6rREByf7wUW1JAbwV+w2EAKRyQHw3ZV79o5wVAHmltzcJEDYdEdg71AIhlW3/PHNvWSFKtSnMimlJGnIJEBFOYTW8n1rVvJ+NSRKB18CQh7Qfv33eCs6/0X3YPT4wXXdco8sKDQu7viiWmaTQKIw0Xq8Cauf2ZeIghIm3odeDu2C4+dBfbvZGkpCe1HjTN5If2Hvj0HD8P3Fji2UHGdzIZVp9FejJgYRNjNfIUQ1qpSS5KVfq+NWfwDer3oJtPw60kPq9A2bqUx6YNQdkJM1QsBRJPMbjFXLj30BcOOQYjHNWr6xyCjaKphhI4hBaASAC2iGfExDZ7Wl9Ym/DKE3V4mK0qRSNuu6ZWE8rIUXX7YU2eUvnTy4uJtNT6NEcYyJOFI9JhgA5jufZ2/bVV5QHpZ7aieMwfUr58pcAvePVCd2RfMLvFUG8k8zhHCBRS93FMOC3RZVmDN2syR2ijPKfbyDIWnnsOUzKiV9I+fHHszHn9mOhUlXSJIVRrpjiY8NskS+e5xhOmzkIDvYq2dAYvZAFhiX1dQruCUvszgNbtndfXYNDWKtYmxITqbDntNFhSO+lNW1CpIlqHkXh7MVFFxMadCACX3RrNH2e8tUx9M3dRRgY9j5lYS4zvsvumjALZT/KMoEZWXuOePKENZe6VgQlAv8f9x
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9567.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TG1mbnc0ZWpxdTJPN1l3aS92c1NVVk5wck9nN1ZJOXdqQWp0d3JEeFM0S1R5?=
 =?utf-8?B?M2ViZFBpYTNHSUxsUXpXUzBpS1poTS96RE41WFJibE1tdzh5cFNyMU9tRVI1?=
 =?utf-8?B?R3J2MVBEQ3hhUDZSMWs0Y3lIOEdycytEempZYXVLOHlOL25tQ2NBZ0Z1Q3Vy?=
 =?utf-8?B?djFxbE9YclJuWm9wZ05Kbklpem1TWkVNeGZScjFrblQyeHNlRjcyWG1HN1B0?=
 =?utf-8?B?N3BueEhvU3NkWE00MS9VNlZRY251SlFJV3Rya1BiSDE4WmszU2d0dFdBU0or?=
 =?utf-8?B?b1ViY3BVb09TQTFuQWw5RGlmY2tjc0wweU1oQk4yT3J0MnpTRW9aVThscTVP?=
 =?utf-8?B?NUpWcDAranBFeHVmTTMybnZCNEdrdlE5VlZjdERRRzVPenlqdENmazMzOG1U?=
 =?utf-8?B?WEFXbytvYjR0OHc4aUFJczhzU3pibjFrcjh0Zkd0b1hHcmFObkdsZ1lqTUNM?=
 =?utf-8?B?N0tEcENCNlk5cVU0YzlKNTdRNDBqZEZGb1hGOTZ0c29vako4SFdaS1NRcU1R?=
 =?utf-8?B?US90NzdhZ3RvNnhudjFUeDJTMVVYME9yRmtldC9keVBTeXJ0aUVTa2xVOUc4?=
 =?utf-8?B?bm5qUVpSWkM2ZmtVc3IzYmpQT3VvZE1mcTJZZE11c0x0QWYwNU03amx3YnNa?=
 =?utf-8?B?Tzl1Z0ZrcVFJYXNUblpCMGN2M1paNWpTT3lmWWxNcWQ3THBDR0o3S0c1Q1Qz?=
 =?utf-8?B?cDhOYmU1OFA2amRqTGNoRjh5SEZSeDZIbUg0MW05VXFYZVZmQWQxZk43MFhk?=
 =?utf-8?B?Q1Y1WGN1aG9MOFBpN2R6dDJUVlpEMXN1d1ZKRlMxNWFpRHdMdWhiYTl4TWhi?=
 =?utf-8?B?TlBUa3B3TUxuZ0hESEdmUE1vT1Bmbk1wTGlPR3R5b2x6OGdQU3BTU0c2aDA3?=
 =?utf-8?B?cWliS1Ewb0pWaTJuM1BGYmJpdmVTbjZuSit4K3V5TU4wWGQ1bHJmMVlEeUVy?=
 =?utf-8?B?eVB5RXRESHRWUGtiOHdBRldGbENhSlpKUHN0NTdIT1VwVFczaWFJZk1NL2Vp?=
 =?utf-8?B?QlhhZEdYbTFQQWtUS3hnR0w5RmZ6dTNvQklnSWpRd3puOVJaNFhJSEhjT1pD?=
 =?utf-8?B?c3FFRjM4akY2eGVGaHVWOTBxWmFHNkJxbWFtRG9nZWdzWnIvNFJwY1lkbEcx?=
 =?utf-8?B?QzlMd3pteEhPa0RZQk5Sd3d0ZVFTZUlzcERhZG5DSWxnU3pWc1EvY1BGM3kx?=
 =?utf-8?B?akZ0WE5RWnhwdzFUK3hESVhnRWo2dFNjbDE4UzM3WlAvNFRlOXZiWXdhZlo1?=
 =?utf-8?B?Kzk1WWpFQjgzdnpNazB2Sk12RU0rVjAwdlJ1eDZBTlJlVEVxTlljVVNEbU45?=
 =?utf-8?B?V1RyeXo4VmNUNzZ2OEtjY0xyOU5EQ1JVYUZlMkNnMG95bEt1UVZZb2UvK0wx?=
 =?utf-8?B?RVV6T3ZmK3Y5dEJMYURSanB5a2tLRGNLSlZXMmI2VVZBTHVKR0VueTBGaWdj?=
 =?utf-8?B?Q3lEdktKUVVnV3F6WVF6V2h6RnQxUVlHUi9yckF6a2VWVTZBZUtVS0kzOTdZ?=
 =?utf-8?B?UXlGbzJBcVZUdUtUZDk3ZkdHV1lvS3hETjViak5tZ2JId2RmMStpS0hZYWc3?=
 =?utf-8?B?RkRpaTd5NnMxSTB5c3FoY2pFRDJEcEJMbkNhZ2dORjJuazdDbjFiL1hYM2Y2?=
 =?utf-8?B?bHh3RjloWkxQaXRLUXJ0N1BIcTB6d3RMcTNsaFEydis2akVOSlRkakNqY1Zu?=
 =?utf-8?B?R0dOTUJyN3VSVjNzTlMvaUhjWUV5QzJRZElVcWVwYUhVWHorbzAzQncvcVlt?=
 =?utf-8?B?c3NUd3dnTSttc2dkdXdHN3g5MDBLdE52L28rZk1hT1lkckU5a2NRYXFRaTlS?=
 =?utf-8?B?RkFzRWFMVHJnM0VyekRpL05Kc21TWlQwbklUVVZaVC9aZjhMaVhZS3AyOTJH?=
 =?utf-8?B?OTllSG5nZ1R1eHh4allNbjRFV1dtU3Jza0wvS0haQnVUVG01NDB4bkJZYVdQ?=
 =?utf-8?B?RnVYNlQ4R3JLUjYrcGNBRDhRemJjeXFWZVRDb1ZqdE5ObUtpdEJQa0dFQ3JY?=
 =?utf-8?B?dG8rM3Y0eTdDTVhodXBZVE9pWTZMSFFFTzIyYXdSa0ZFdG0rRS9Kc1RrdXU4?=
 =?utf-8?B?TE9UblhaYWoydjRLbThVY3BBbUMrUlVseXhRREp1bVZyYVB4K2k0SzlYbnlz?=
 =?utf-8?B?eGpobmlPdEw1bmZvVTlyZEE2VXJaTm9hbVRpZmpIenI0Y3lyTnVlUjF0Qkt3?=
 =?utf-8?B?MVVJcnAycHI1a1J5Mzg1ZUtqNWFiVzdBeGZTeEd1SngzWndXWThkczkzaUxy?=
 =?utf-8?B?b1JWTEdEa2RyYzhNcFRtWm1HeTRJSlZkbTh2QW96ZC9XZUpjUU9WemJFNnhn?=
 =?utf-8?B?a2xydE1GcjdubThUUnhXMFoycUNGQUh2ZzZ2cWEwME1oM3pmQ3ViQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c3e79d4-1133-489e-dbb5-08dec165c5bb
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9567.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 11:46:39.0950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yFMA+1J11LKBdvRs1LrdCLf7slKhSWeMNEJ/sGSB8hYN66GChGJKCs+6SacUEuPQCoFJD2lxPGy5b8aXgNQRYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5596



On 6/3/26 12:19, Kuninori Morimoto wrote:
> Hi
>
> This patch-set removes unused machine
>
> Kuninori Morimoto (3):
>    ASoC: amd: acp3x-rn: remove unused machine
>    ASoC: amd: acp6x-mach: remove unused machine
>    ASoC: amd: ps-mach: remove unused machine
Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
>
>   sound/soc/amd/ps/ps-mach.c      | 2 --
>   sound/soc/amd/renoir/acp3x-rn.c | 2 --
>   sound/soc/amd/yc/acp6x-mach.c   | 2 --
>   3 files changed, 6 deletions(-)
>

