Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013006.outbound.protection.outlook.com [40.93.196.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B4021CC5B;
	Wed,  3 Dec 2025 03:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764732207; cv=fail; b=qHb3Z2wMpbWjBwQ9YkGtd26ApGz/kXYccA+cOiNKcZPrCz8iSL+9deEoEEwueEUQlbsrKfGHPhuaiNLk0sg32F/FlQIaTJFb3BjY2rUhWzyjfJWfBaWiTam8vqkk3fTSqD3ernsKLlD4OesRXWlMyIe42+dTyQgmyURIH2n6ATc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764732207; c=relaxed/simple;
	bh=D8hCdRLuMb8iYSwepxoc2ZxZpHm6eSKXu4/A/FRRlVI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kqbm3fSc9Kaluquh/1seEBhuNHxFduGSmxBiGnCSIRsNU4E+eDKO+FwiHdkpgr894XLC3y9Xbg0Xghd0FFUqoNtZGRy9tWog4BaX5LRjFSIEOXF7LqUaFIb3PezInSv86ei282/rxkGrMagiu1ZV8iDUQJ72B/F5cCtlSyfz4wc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=rwRkMlNY; arc=fail smtp.client-ip=40.93.196.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="rwRkMlNY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xU8l5Wfds8amEUHGT4v3AS7s+isOTTFY4saiGUhphJYAGfXg8MliRBP+5tGNDYgBhAB4/Q1IZT6sNshfysYI8sBazSdn8joo8uB9LDwa5eoWBJSn/4OSRTNFLBrxSLZEowlczeqrRs/icJPdOJOTqoDq+aKnEp8oJaMsl4BbqioMew/2wsB0w7KOVxqFLjIOTJ95q/ENyVft8TBD+EIyUX53z988SpN1ZEFMDhTlR4a9OkirMfbiIzLHSDxfzY7LoMZM7GvQ94uwv5WNmSxO/si20UDf0l6YOj00UjgcZE1LJmOhPdmsSE5GqviyzpJLP0vCvEoexqZmv54A2NsbvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D8hCdRLuMb8iYSwepxoc2ZxZpHm6eSKXu4/A/FRRlVI=;
 b=RmtQyN8SltoIC/iqCOm3cp6+VuY7gZJkfK5uVk0XXp3yr0TGn+5EesRmjdd/0zIEfnjdAYrf9pQO2uZ4ty+XzLe/xgPTcEXwpsyRiFnNj8jDl85rGi3APfjmCGdeVfaK92Hzx5zHicIivXKOv23NP9KynQkLjWwv0ZERXPWGDTYA//H3D64RGeyB42zXGxkUk2IviUiYvsRKW8PdIRFfQaQ8vMXVJ+/H+6ZvIOvciQIl1ZGsVk+9u2Uwq1vTJftwyx6Zy/hkWOcDC/tYQzJ5SBdMA4EuiBxpg7rlHPwnejIBs522EbMldI3rFm5+gwMSHqrPA4jPJxv80s7Jh4ptiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D8hCdRLuMb8iYSwepxoc2ZxZpHm6eSKXu4/A/FRRlVI=;
 b=rwRkMlNYy/4OuO6y9X9f8RkmPvPiOpEku7DnF8pNOSbptAOjLUxtcaCUijmL4LemT8vdKxGccWv0k2HASAzM2bTiRfZMl2cyQ7McQlyg+eFJhJhRCbWmPHfJxl2H1WbPRQPRvsXOFWyyQEbpZ01xqFBPt+qh7EjVkmDSmNPs0s0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS2PR12MB9567.namprd12.prod.outlook.com (2603:10b6:8:27c::8) by
 BL1PR12MB5948.namprd12.prod.outlook.com (2603:10b6:208:39b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 03:23:22 +0000
Received: from DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::5c31:b454:e529:99f]) by DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::5c31:b454:e529:99f%6]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 03:23:22 +0000
Message-ID: <0f787ba2-8d44-492d-ae72-0bb74999223c@amd.com>
Date: Wed, 3 Dec 2025 08:53:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ASoC: amd: acp: Audio is not resuming after s0ix
Content-Language: en-US
To: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>,
 Raghavendra Prasad Mallela <raghavendraprasad.mallela@amd.com>,
 broonie@kernel.org, alsa-devel@alsa-project.org
Cc: Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 Hemalatha Pinnamreddy <hemalatha.pinnamreddy2@amd.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 Peter Zijlstra <peterz@infradead.org>,
 "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
References: <20251202175616.2213054-1-raghavendraprasad.mallela@amd.com>
 <9070b032-03d3-4f01-85d7-d55918678659@kernel.org>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <9070b032-03d3-4f01-85d7-d55918678659@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4PR01CA0044.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:279::6) To CH1PR12MB9576.namprd12.prod.outlook.com
 (2603:10b6:610:2ad::14)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9567:EE_|BL1PR12MB5948:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d26131e-742e-4174-1eca-08de321b4faa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SHhVdjJWRHlnRXJ0MWxBdnd4YVFueVF1bVhxb1FrcnF5d0NVb3ViU3U5M0ZR?=
 =?utf-8?B?WWpNdmlETmR0emxabVhRMGVqekFiNHZyMnVjS1M4cFU3SjBFN08rQjhZdnBO?=
 =?utf-8?B?TU5jRjY1Tm0rUnc1Z2VLbldjQWlvN2tqblBNUVIvalVJelowcm5DZWJ1UUdW?=
 =?utf-8?B?S3B0MXVEVy9jeSs0K1RxS1FGc2pHSnRScWIyNTBiVlNCRVBXYkNaK0xUQkM3?=
 =?utf-8?B?NTVnNjFhN2VON3U5TU82VXlud0VlZ0dMeDJnYjBQNVk5bWlGOGJGclBMcllJ?=
 =?utf-8?B?bVVxQitzcUd2NlhmZmxtRlFLVUhRSWNkUi9IMHRCN1J6UXlYNSs5TUxkU1ll?=
 =?utf-8?B?UHJlUGhSdWVERnRqMXdSVmpjTDVVSjFJRkM1YkZQOWlGdVFqTlpqYXNvL3ds?=
 =?utf-8?B?UkMwNDZxSUNBZW5PRDdpUmkrZ2p6enk4RUh1YkErd0NnUDdYblRFQ0pNZU52?=
 =?utf-8?B?ai9icEh1cTg5ZzBRWU5vZ2hDL2F1cnM3Snl5RzdtSmlmWU1yYVU3elhkeVJu?=
 =?utf-8?B?RURYNTdkOWp0NjQwV0NVNFMwMklMMHhjYjBhNVFIME5Qd2JUSUtCSlA2bm1D?=
 =?utf-8?B?MVcrVkp3TmVFQnBtamw1NWNjUTBaTVRQQi9kR1MxbHAxcGwvMktEYlpKY1or?=
 =?utf-8?B?ZE1BODQzcU9CaEtENDJqejdBbzdaS2d6Mk5DcW5ydEZyWkZGTXhVdmpTK2dx?=
 =?utf-8?B?K0laMmVnUXJxdUNMSTR6Ym54Yi9WSkt0a3JzOWdLWTJ0MUlVZDZsbVBUdlpK?=
 =?utf-8?B?blh6Tm1OR0pJL3JGcENZMURmMnl6UDQ3azBxRDMzM0ZNQmZwUjh6OGNVZjBQ?=
 =?utf-8?B?OUROYWR1bjJBV2dQSWdIcGQ2eHFJOEFmVXkwOVorSjNMZkwxM0VMQjI3MnVj?=
 =?utf-8?B?TEFaSS9wWDlTSHJXWUxiQTZuZzc1bko0dnhlc0o2N2p5czAvL1pFN0dPbGw3?=
 =?utf-8?B?RWIwZ0krZlRKeEQxMkYvcHFZMzl1elIxaGczWjZwRHRaNE44OURGb1RoSUx5?=
 =?utf-8?B?VWVnblRvQnEvNkpuUzVwR2FMbmltaHJIUzYwSjVHbE1jMkEvSEZSbUJHb3Bv?=
 =?utf-8?B?QzJuZmczamdWdThGU3U2MHVJdzVmMUpqTXlqbkEvZHdlT2xzRy9JMDdGeUdp?=
 =?utf-8?B?ZStNQUw1N1FkVWdFNjJuWDEvR2YvanhoMEZPZG5NSWQ2eFY3R0VrMzZxcFNs?=
 =?utf-8?B?b2lNZS9uOW9QUDR4bFM3YWhGRmxNZ3dxdGlpNWVudm5oTU85eHIzWEZtdnZZ?=
 =?utf-8?B?VDNuNzYvVkdZZVdTL1JCTE1oNzJqYThJdlpCcVNPbW5yeGlGb3FUbjlzblds?=
 =?utf-8?B?ckRuOFhWRlpzRm9JSE9Hd3lXdnI3eGZoRkJqWW96Nm54bDdEanZnc1FyMTZu?=
 =?utf-8?B?TG5uM09yY0FpV3g2cFpSVkQrZ3RBQzRvdFBnY1RpKzZnRFlsWVJlaHk0TDF5?=
 =?utf-8?B?RlU2SzE0ZWVodnVWcm5UT0V1MnR2dEFXSHIwU2ZCQnZQY1NTLzh6MTN2amVu?=
 =?utf-8?B?QVczc0pTMEk0ODhmdHMzSWdRZmpTTUREV2w3RDhoUVF3STdscFRGaFU0dkVR?=
 =?utf-8?B?UC9vWkVsVFN3UmNXL0lXUno4TmphV2RZT3EvLzhYa3ZyeThuZDliUlp3Z2c1?=
 =?utf-8?B?dm5SYmE1NklodytJWmtTcy80blJsMWV0OGZJbFQwaTc3MFJ1ek5vQlM1cDRa?=
 =?utf-8?B?L21jazc3bFNSK1VpYlNKenlPOFpwK0c5MDMwU1lZakJpbkZEeWlkbmdWZTdz?=
 =?utf-8?B?R1dNVCs3dFlaeXFxY1hPY2R0WnBZMTR1a1QwSldyWGNUaWoxeEV2WEVpaXYz?=
 =?utf-8?B?UTdaaXlhdEpVbElRZjlHdXZhUUczdjRGdWNSbFBjWVE5RGNxN01JT0wzc09N?=
 =?utf-8?B?Wm92WHJCTlRmWWhjSUh3TEZ4Mjg0V09YNGN6dGhRTzdmT09GZXNxR0cwc0FN?=
 =?utf-8?Q?/Z1NVzLKusSg5I9ItPBVjqn3d6SABvoZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9567.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QUowcTlLTjZRWTYvaER3REp1dERhWUJMdmNiZnIrRVlpNGVTcTB1L1dDWUwr?=
 =?utf-8?B?ak5PRVErdTgxVWp6bGdkTGlvWVh6K09HcXFqM0hTYTJEL0JST1hJS2JKeGtW?=
 =?utf-8?B?bGlIT2NmakpZaVJSNTIvbll0clNNK1c5ekZLY2c5L0k1Y1NPaEZnR1dRbXps?=
 =?utf-8?B?M1ZPaGVpd3F6WCtTaHh1Nk9PaG9EUVU2RnVyY1hORmFXRlhJZ0VmZTVVeDIr?=
 =?utf-8?B?b2pOWlBXc3FIQkFNNWpyYWZKZllkcnIyVmRLUGdmaVVsL0dldHBjSzBsbTVB?=
 =?utf-8?B?NXZpVlFDSU1KeGN4VHpuR0NYL25nNE5YKzV0QUFjUW05R0R5M3ltV0JPMmtD?=
 =?utf-8?B?aVNUMzU2Wm5yd2luUDJHSjhyMC85TnNzb0oyNG5BNjF2L2FoeVFhdHNuTDA3?=
 =?utf-8?B?emdHckExTGgzZzN6WTFtYnJVREFBUmZQdHllTy9Xb0c3Wkd1VXpvajdVSVBq?=
 =?utf-8?B?QktCWnhEcllyMVhYOHZXckc1SE1qN3lGUTZVRllFRzVVREt4NFkvQk1QazRI?=
 =?utf-8?B?MkJGS2pQM1VLbHU0a05Qc0VoMG5Dc25IdDBOQkYyb2lsQWUrVDFLNk43MUJo?=
 =?utf-8?B?NHpVSGFPbzBPOTd0Y2dtSlEwUFdwLzRkVTVGdHBkaFpGVHZtM2VlMk9DNG5T?=
 =?utf-8?B?dDBCTUpZS1VCV2RxZGpNdWlUeS9mZzZzQUV3dDBvN01Wd2Y2c1ZoVUVCbHpQ?=
 =?utf-8?B?UHd5NjNiZDRwK2JUdXlXT2U0NU42R0R1akY2QXlhdHJsb0FBZy9yL3VnSllS?=
 =?utf-8?B?RXJ3RXZyZzQ4azZKNEM4Q2hlNTRjNS9ONDErZUQ1Y0pxeUJMcXhqc2pUemR3?=
 =?utf-8?B?ekhiVCsyMXNMSFRKNVgyZVJRZFI5N1Q3Rk1Ta2ppYmFQeWoydHdSL2t0VUh4?=
 =?utf-8?B?cTdkSkdrN01tYy9hVGswUWNFOXN5VS9qb1JJdkgzWXdTODJuODB0RnBWd3V1?=
 =?utf-8?B?aDcxVzlmQXZGbHpxRTNHb0d5SzVWQitoYUJPRXpCK0hVZXdpVFF5L2pSQkZa?=
 =?utf-8?B?YXJNeENCY3B6UzZIUVQ3M0Rucml5NENFR3I2MFE4M25EeVowb3NxeldHOHR5?=
 =?utf-8?B?TEtrWVE2dSs1eTVLbmZmR3B4UllYYkhFTWthSjJrWndKaEN5WFZScFRXL0g1?=
 =?utf-8?B?OUlCdWJ0Y2ZIams0LzQ0d0lIc0dkci9uZnBNa2FNMG9qR2Yrdk5jc0h2NWlX?=
 =?utf-8?B?VjAxZTltTkZITWhaZ1dRbVZwaFordlh3YkdlZFZocGhqNHBXcjlWdE1HSzE4?=
 =?utf-8?B?czBrQkVSU0h1UXNwbXQwcHpoOWxlbStBalc1aDBFU2xKdzk1d3FkVUZWOXoz?=
 =?utf-8?B?eGJZR1ZBSzhMQzdMdngyYmpXbXl1Q3dkTXZ1NFZ6TkRtYmYvck82SmltQnA1?=
 =?utf-8?B?Q3VIOUhlWTJBbE84dU04UXJQeGY5TUgxQTBVUlRRdDBHUUhoZnBkRnMvK25O?=
 =?utf-8?B?ZWtEMzlmNVJrU0R2QngvMEN1VUk2cUtCNTN1SFdWcmFMa2dIYUJPWnYzaWdv?=
 =?utf-8?B?SWNDcngreTV6eDhqWXB6dkJjUy96MGRFZnl1K3RJU1RnWVc0Zlo4a3BLUVJD?=
 =?utf-8?B?SHg5eWFxR0VDYTNzRnJzVmdxVlpWbUhQZWc5cW96cjcyNkF3RXBvL2QyZHZi?=
 =?utf-8?B?NFpWcXNHUzVER1FndnhDNTBJWmlvM1ByMk56ZWZJUEhIRnFZQUxrQzRRM1E4?=
 =?utf-8?B?Sll4Y1pCM2ZHcHh4am9lb0hmMDNHeXAyaU1EQzNRVkoyazc0U3NIUStmUUtH?=
 =?utf-8?B?MGlqS3NQZ2hMSHRlWGFJY1JGdGVMY1Arei8yUmhDNXFwVjRZV3JGMWxGUE1T?=
 =?utf-8?B?RVFGY2RTWU9jRFIvcVBraGFEbDl4ZnhHdWdVVkc3TTl1VVozSmtjUkxSQWJZ?=
 =?utf-8?B?L3VXVExqb3lXTDFKS3NweUdDY0ZtMHQrRlZDbG5OaHp5b0paaXFMcGo5YjR1?=
 =?utf-8?B?ZU1XZ3RpTFlzNVRHVnhjRmY5d1ZyTkQxVTBZYkl0aCt3UnM4ZHgrbEZtRG0r?=
 =?utf-8?B?dEQ0Y0F3aFVsN3kvWHdDUWgzNWN6aGJBdXNtU3RHZWdhaGhSYjNJR3FIMzZ2?=
 =?utf-8?B?UGFMRFowN1Z6WUgzczAwS3hjbWVhUnBncTJUby82VENIcnFIOURsNFk5RGtu?=
 =?utf-8?Q?bL18NkxOEJlesQ+S9akLWvSCa?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d26131e-742e-4174-1eca-08de321b4faa
X-MS-Exchange-CrossTenant-AuthSource: CH1PR12MB9576.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 03:23:22.0779
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3xBh15KPW57lZ06nQt/ubmLI6ljLq7lIykfDRwK7KTTQY1jYNUfQIOtqDpgHHyD6ybs3POkAyThZRhPFojv4wQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5948

On 03/12/25 03:38, Mario Limonciello (AMD) (kernel.org) wrote:
>
>
> On 12/2/2025 11:56 AM, Raghavendra Prasad Mallela wrote:
>> From: Hemalatha Pinnamreddy <hemalatha.pinnamreddy2@amd.com>
>>
>> Audio fails to resume after system exits suspend mode
>> due to accessing incorrect ring buffer address during
>> resume. This patch resolves issue by selecting correct
>> address based on the ACP version. 
Add fixes commit
>>
>> Signed-off-by: Hemalatha Pinnamreddy <hemalatha.pinnamreddy2@amd.com>
>> Signed-off-by: Raghavendra Prasad Mallela <raghavendraprasad.mallela@amd.com>
>
> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> One nit below.
>
>> ---
>>   sound/soc/amd/acp/acp-legacy-common.c | 32 +++++++++++++++++++++------
>>   1 file changed, 25 insertions(+), 7 deletions(-)
>>
>> diff --git a/sound/soc/amd/acp/acp-legacy-common.c
>> b/sound/soc/amd/acp/acp-legacy-common.c
>> index 3078f459e005..da80c761d657 100644
>> --- a/sound/soc/amd/acp/acp-legacy-common.c
>> +++ b/sound/soc/amd/acp/acp-legacy-common.c
>> @@ -208,7 +208,7 @@ static int set_acp_i2s_dma_fifo(struct snd_pcm_substream
>> *substream,
>>       struct acp_resource *rsrc = chip->rsrc;
>>       struct acp_stream *stream = substream->runtime->private_data;
>>       u32 reg_dma_size, reg_fifo_size, reg_fifo_addr;
>> -    u32 phy_addr, acp_fifo_addr, ext_int_ctrl;
>> +    u32 phy_addr = 0, acp_fifo_addr, ext_int_ctrl;
>
> Why initialize this variable now?
>
>>       unsigned int dir = substream->stream;
>>         switch (dai->driver->id) {
>> @@ -219,7 +219,10 @@ static int set_acp_i2s_dma_fifo(struct snd_pcm_substream
>> *substream,
>>                       SP_PB_FIFO_ADDR_OFFSET;
>>               reg_fifo_addr = ACP_I2S_TX_FIFOADDR(chip);
>>               reg_fifo_size = ACP_I2S_TX_FIFOSIZE(chip);
>> -            phy_addr = I2S_SP_TX_MEM_WINDOW_START + stream->reg_offset;
>> +            if (chip->acp_rev >= ACP70_PCI_ID)
>> +                phy_addr = ACP7x_I2S_SP_TX_MEM_WINDOW_START;
>> +            else
>> +                phy_addr = I2S_SP_TX_MEM_WINDOW_START + stream->reg_offset;
>>               writel(phy_addr, chip->base + ACP_I2S_TX_RINGBUFADDR(chip));
>>           } else {
>>               reg_dma_size = ACP_I2S_RX_DMA_SIZE(chip);
>> @@ -227,7 +230,10 @@ static int set_acp_i2s_dma_fifo(struct snd_pcm_substream
>> *substream,
>>                       SP_CAPT_FIFO_ADDR_OFFSET;
>>               reg_fifo_addr = ACP_I2S_RX_FIFOADDR(chip);
>>               reg_fifo_size = ACP_I2S_RX_FIFOSIZE(chip);
>> -            phy_addr = I2S_SP_RX_MEM_WINDOW_START + stream->reg_offset;
>> +            if (chip->acp_rev >= ACP70_PCI_ID)
>> +                phy_addr = ACP7x_I2S_SP_RX_MEM_WINDOW_START;
>> +            else
>> +                phy_addr = I2S_SP_RX_MEM_WINDOW_START + stream->reg_offset;
>>               writel(phy_addr, chip->base + ACP_I2S_RX_RINGBUFADDR(chip));
>>           }
>>           break;
>> @@ -238,7 +244,10 @@ static int set_acp_i2s_dma_fifo(struct snd_pcm_substream
>> *substream,
>>                       BT_PB_FIFO_ADDR_OFFSET;
>>               reg_fifo_addr = ACP_BT_TX_FIFOADDR(chip);
>>               reg_fifo_size = ACP_BT_TX_FIFOSIZE(chip);
>> -            phy_addr = I2S_BT_TX_MEM_WINDOW_START + stream->reg_offset;
>> +            if (chip->acp_rev >= ACP70_PCI_ID)
>> +                phy_addr = ACP7x_I2S_BT_TX_MEM_WINDOW_START;
>> +            else
>> +                phy_addr = I2S_BT_TX_MEM_WINDOW_START + stream->reg_offset;
>>               writel(phy_addr, chip->base + ACP_BT_TX_RINGBUFADDR(chip));
>>           } else {
>>               reg_dma_size = ACP_BT_RX_DMA_SIZE(chip);
>> @@ -246,7 +255,10 @@ static int set_acp_i2s_dma_fifo(struct snd_pcm_substream
>> *substream,
>>                       BT_CAPT_FIFO_ADDR_OFFSET;
>>               reg_fifo_addr = ACP_BT_RX_FIFOADDR(chip);
>>               reg_fifo_size = ACP_BT_RX_FIFOSIZE(chip);
>> -            phy_addr = I2S_BT_TX_MEM_WINDOW_START + stream->reg_offset;
>> +            if (chip->acp_rev >= ACP70_PCI_ID)
>> +                phy_addr = ACP7x_I2S_BT_RX_MEM_WINDOW_START;
>> +            else
>> +                phy_addr = I2S_BT_RX_MEM_WINDOW_START + stream->reg_offset;
>>               writel(phy_addr, chip->base + ACP_BT_RX_RINGBUFADDR(chip));
>>           }
>>           break;
>> @@ -257,7 +269,10 @@ static int set_acp_i2s_dma_fifo(struct snd_pcm_substream
>> *substream,
>>                       HS_PB_FIFO_ADDR_OFFSET;
>>               reg_fifo_addr = ACP_HS_TX_FIFOADDR;
>>               reg_fifo_size = ACP_HS_TX_FIFOSIZE;
>> -            phy_addr = I2S_HS_TX_MEM_WINDOW_START + stream->reg_offset;
>> +            if (chip->acp_rev >= ACP70_PCI_ID)
>> +                phy_addr = ACP7x_I2S_HS_TX_MEM_WINDOW_START;
>> +            else
>> +                phy_addr = I2S_HS_TX_MEM_WINDOW_START + stream->reg_offset;
>>               writel(phy_addr, chip->base + ACP_HS_TX_RINGBUFADDR);
>>           } else {
>>               reg_dma_size = ACP_HS_RX_DMA_SIZE;
>> @@ -265,7 +280,10 @@ static int set_acp_i2s_dma_fifo(struct snd_pcm_substream
>> *substream,
>>                       HS_CAPT_FIFO_ADDR_OFFSET;
>>               reg_fifo_addr = ACP_HS_RX_FIFOADDR;
>>               reg_fifo_size = ACP_HS_RX_FIFOSIZE;
>> -            phy_addr = I2S_HS_RX_MEM_WINDOW_START + stream->reg_offset;
>> +            if (chip->acp_rev >= ACP70_PCI_ID)
>> +                phy_addr = ACP7x_I2S_HS_RX_MEM_WINDOW_START;
>> +            else
>> +                phy_addr = I2S_HS_RX_MEM_WINDOW_START + stream->reg_offset;
>>               writel(phy_addr, chip->base + ACP_HS_RX_RINGBUFADDR);
>>           }
>>           break;
>

