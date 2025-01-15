Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2096.outbound.protection.outlook.com [40.107.255.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723C61E260C;
	Wed, 15 Jan 2025 06:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736921797; cv=fail; b=rGVgaqUrq6C53IgiQj2OhE3E7zdnJII4akmaqyd4cHofBJ8JDmkGh6tN4A3AMwXfHLZYKmaTyj9OXnFVl/kw+KKrShCEXeis73Jp9OCxejzVbf0Bwk4fAcA5p7KGHrPVAI1tOecVvjo1q1cLlgBvTI6hAL4ObQVoSMPEwm0oXIg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736921797; c=relaxed/simple;
	bh=NtutUx2fwd312HqA5dNC2MHDzEMm/v6msPSuniw8yGs=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OIJkuvrS5fMMhWfvdy3vwouqhJIPpU/RFcxrGRQxhUMnOapiB6qiohAxJ7J5S4E82yfR3f7ArRlH5R6b+eTJIa834qSgYDM5rsJ5WIJQ29dbRQ/j9kShDveS7FYGyRSIrjaoSukWSTMQmSLWY0lGemp0y94iOE1N+kSpYBW5rL0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=eppMObiZ; arc=fail smtp.client-ip=40.107.255.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="eppMObiZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ulSh09mwBo0vWX2Wovbxo7nd3imJpXkTSnNo1xBfn9ea3+lWvtuwBsfVLZFtw5NemAzs2G5MZr8mQipstw1DSMf4SJccRMT3daiFh7VkJhru+Nz1s7xWcmHLAHzXXPIA8oSyg3rNO81u/lkKW3rJ21v0LxqYBt2ZQs/3A0FWHmfJ2O5g41s4AuULIKxDHRGk0M8xtRSieVEbkUVg7KpKAmRQosfSHT91RK/u7DKKxg9zZ9gUvdswdgwis3i9qVGy06opfk8NrTfdFCuEI4mtGpW4V65hn6N9qI2cMqd0zLhCCoAnKai/oAQGZ1kWHG3l8AShj0CCSITbcz709fYtTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C/eQva/DYi9PRBY+HSHYY3bekf0p6/YWGhrFDPczrZY=;
 b=GDgwJjixXnV1bmizvu0d74fy9M2CkQR/KOTQfTGN19mYvN10z+xD4p0fBlv+3DHhvFiyFFSZla338KiNfbp0y5yM41sLp6tA9cxx3kKE2eVcHhGgDwS3uTZFEVBYr6k7XBqyTPFz/9hf9pxpIHaU5lYkJrFX/LJgH/KcGrzAdnG8c8wlqGA+V5BpuEzhWkH6etV279je43crXmjfTqN/8BiREgnQZHNPQa656/WVnjtEEmqv5BC0rh47BIu3wkJ7HLlFwRIEV2DvpHSmIjwgpMjRLmgPvb/B6nXQ1pSmDRPQlU4MwRKTBCIbL/SpLHMAdLH9DtkdBsfgx7O50rd4VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C/eQva/DYi9PRBY+HSHYY3bekf0p6/YWGhrFDPczrZY=;
 b=eppMObiZyTdSqHhvO6Jp2O6xLJw3cWObPG2yzooNHEVsIV9jD9gTFKQXIleWHzwd0VOaTMcbFJSG7kE1H/P3JyJc71w/pZfjNBQ5iGAr3KErwHfDaSqOXhpjNSezp8WoauWHiYjOFNeXsVXXLiWm6aGCVm+tNW1YAngzGm5QEcqmd/oZtfWUjTjaRh+9EsO4a8k8bUaKRKrt0KXRP9NJYSJWQNy2Fo2vGdMucAX1cxdA9JlnZqefvJrYumM5KiMdqH610KemnBzBBWb4H8qApsE4cNLmrZBsqLQNJ1dPM9l9MhdF19ABpYFfmNzjd/ByBo/RWZnX+e3qNoR8Ob/d8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from PUZPR03MB7135.apcprd03.prod.outlook.com (2603:1096:301:113::15)
 by JH0PR03MB7934.apcprd03.prod.outlook.com (2603:1096:990:30::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Wed, 15 Jan
 2025 06:16:30 +0000
Received: from PUZPR03MB7135.apcprd03.prod.outlook.com
 ([fe80::ecac:a387:36d8:144d]) by PUZPR03MB7135.apcprd03.prod.outlook.com
 ([fe80::ecac:a387:36d8:144d%3]) with mapi id 15.20.8356.010; Wed, 15 Jan 2025
 06:16:30 +0000
Message-ID: <83a93dfc-2fcd-4166-98ed-e0491645f4e5@amlogic.com>
Date: Wed, 15 Jan 2025 14:16:27 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: amlogic: Add Amlogic S4 Audio
From: Jiebing Chen <jiebing.chen@amlogic.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: jiebing chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20250113-audio_drvier-v1-0-8c14770f38a0@amlogic.com>
 <20250113-audio_drvier-v1-3-8c14770f38a0@amlogic.com>
 <1jldve939f.fsf@starbuckisacylon.baylibre.com>
 <813e2564-8c4c-4adb-8184-ab88156e3e4c@amlogic.com>
 <1jmsft7ihz.fsf@starbuckisacylon.baylibre.com>
 <0e8b78c1-5c56-40e7-a2d8-41a7f49d52bc@amlogic.com>
 <1j34hl7a8b.fsf@starbuckisacylon.baylibre.com>
 <40aca60e-92e7-4344-8f7d-f62a61dd1898@amlogic.com>
In-Reply-To: <40aca60e-92e7-4344-8f7d-f62a61dd1898@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYCPR01CA0031.jpnprd01.prod.outlook.com
 (2603:1096:405:1::19) To PUZPR03MB7135.apcprd03.prod.outlook.com
 (2603:1096:301:113::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR03MB7135:EE_|JH0PR03MB7934:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ff1126c-d43d-4165-bf41-08dd352c26f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RkpGMEFHU0FqUXFPVjFuZmltdVo2RlpTdlg4OTVrbUd1cXJ2YzFkS3RQNVBJ?=
 =?utf-8?B?YmRCaW5CMzBuQkI2NHJmcXd5ek9wSUN0M2lWV0ZGenZ1M3I0MStZeU1MQjFj?=
 =?utf-8?B?MUxwUVZZUHgrVzVkdE1sQUdaT3BBSXJYUnBwUDBuOXZhb1FhMysrUnhzRWpO?=
 =?utf-8?B?OStiUThHbllxMUtkZ2NacGJoN2NCMkpNTFUxN1JZV1FjVFJyWnJIVGl3WCtx?=
 =?utf-8?B?TVpacXlLVW1sTW5CeEwrVmpKWDRVZnNWWitBMko0dzhsbGV5N2VlU0N6dDF2?=
 =?utf-8?B?NUg3d0Vha2Y4R0NCYm1aUlFiZ1h2S1F0VXJNMG1BOXlNK0twTFVTNmhzaUsz?=
 =?utf-8?B?UnlMNVpKVTR4VkQ4NERjSjVzZU1uWVo5b2gzc2FZaTREMkJnaVpTN0pQWDY3?=
 =?utf-8?B?RUJnR3BzNUF3S1V1L1QvOCtwcUFrMTZpLzBSajVWaWJ5NnVUUDVFZzZURXFH?=
 =?utf-8?B?SWlJOUZ1Y0pHb1Njd1RzRkxUbGZXd0VLaXdSNUs3QUJrSWd6ZmpoZklMZUtO?=
 =?utf-8?B?Ui9JeVZJSVhKR1hqSGJLUGRYUkZRL0gwcy9MM2hHNTVjcnBGOWIvaTU3TStB?=
 =?utf-8?B?U0p2NTA5eVRPaDRGamhMOGRXMXJkdWxpM2o0ZE5SUklYSnpXOGc4d1lUUXhM?=
 =?utf-8?B?RVRIRkhqV1Zac3N1NXBrQTZESG1oWHNGQTU0YWZrWnhqVFVtL0cyczJYcDZx?=
 =?utf-8?B?ZW5OVTVYV3ZpUmlUTVhBbG51aW5jV3ZDRVBRMmdjRUxtRkZ5ZnNKSFRFQXJT?=
 =?utf-8?B?cWR0Ym50Z3pxUkxPbHFJTkFmVG8vdU5BZWNGSm4yYjNmb2JDYytaUEtZMWMx?=
 =?utf-8?B?ZUQ5YUJYY3VVd2NNc0VZNVJEZGQ5UFNuS2ZVVHhFOXNHYjd4YUV4alovK3B5?=
 =?utf-8?B?Y1BFcHlXTzJzbFJtRUtzS0V0Zm5kRUwwemdqSjUvNURHcERHVnN5dzhkdCtY?=
 =?utf-8?B?YTY5eEhBYStZdUQwNEtsNkJJNitoY0ZwTFkxakI5NjFSaEJ0SU1aSXgxaDc4?=
 =?utf-8?B?c1RWaTF2anN6c0RtaXNhTFNkVm82U0wrZ0ZMU0RFTDhaL3JuNzgrdkptNjVv?=
 =?utf-8?B?eFlHeDNPTkRnVXZMZC80cFgwMGZwVDZESU9zNXZ3SERvU004WWE2Ukd4V3Zs?=
 =?utf-8?B?dUJtdjUxN01WWVZpWjNaMEJKbmdhSFkwdzJNTnVmazh2TUZHNi9FRnR5Nkc0?=
 =?utf-8?B?d081SlRjOWgwcWpZKzYydjZENzRwTmNOWmVzc0xUSW40TWh3aWxHME0xODZK?=
 =?utf-8?B?eEJtWmRTK1YvMEM2aitGdUJqVDhyV2NabWgvb3RZR0dTck1jektWU0NjT1hU?=
 =?utf-8?B?S01ncWxHUDFtTE4wT2NYeUR1cDdKMnVucHpzNUtwZGZCdVVqWlhvbjB2ZWJy?=
 =?utf-8?B?UDNVbWtkdVhsbHdBYVZXRXBoOGpHdis4bm40TWtVdjVGVTBhbEp2V05rVjVV?=
 =?utf-8?B?V2I5L0ljdkRlWHlKOTMwMEg0bnZVREViN1ZCNmhLUjlzcFZZRmZSK1VPRFVT?=
 =?utf-8?B?WHppYmhKdTlUNWtDUGxteEdBTFlGTWNiR1RvekhnUmxOUE84aVd0TmJ4UFFX?=
 =?utf-8?B?UUlwbkttYjdaMVZSM1FLK0R4M3pIY1NYM0pTK3RiT1lhTkVCT2lVYjVjSmRH?=
 =?utf-8?B?THQ0S3dMN1BTYzRRT0dlMDFiKzROTk9rSEtCSmFhRkRHTFVpVWZoVjlmQkoy?=
 =?utf-8?B?M0JTT0F5Smh6MUpWbHBJb3ZoeFpYQkJXQlltV1FINEk1bTZEL1pJK0xYd1FX?=
 =?utf-8?B?a1VtOWZhTDJoRmZDd2RQYS9KY0drZWluRldFbktreVYzOHZHc2NiQXV1WDMy?=
 =?utf-8?B?WllPZGN3aTR0Q1pYSldxa0VYNkhoMEF1RitObnhZbFJQTzBpRDBvZnhRRHFs?=
 =?utf-8?Q?tVs9YsDaoiUkf?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB7135.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SUVRQ04wRlVsSnBjZmNqUHl4eHhXQlYzakVhT0VkQkdtem96YWJTclJqS09j?=
 =?utf-8?B?cERRb2hVMVRzK3JnRXp5TUNEcVZ4Z2plWXFwZHJWdUIwMHhoRStBaGowVCtq?=
 =?utf-8?B?T2pNdkpkdnJYWExnbVBDTm1kdzNwSDRsY1I4Yno3ZFlpV1FZNlREWkhuS3Rl?=
 =?utf-8?B?bWhMM1BoR0VkZDRIQlMyYnphMDRsa0N1ei9aOWxVTk40OWtqVFQ4KzdUN3Rz?=
 =?utf-8?B?cnBiNmxQaGtHL2NPRU1SNUU5Umdqb3c4b0lvdkVjVGFtbEZ5VnRYQUNNdU0r?=
 =?utf-8?B?Wjl2dGxEd3lCb0N4Y3FIbkl4Vy9ML0w4a0pPOXM2VDZLL3ZkSXB0czBQRDcx?=
 =?utf-8?B?ZEYxakVCTGFXNncrVGdNY2g0NURiNmd6L3NmOGh3d2txYTBmaTM0YUNWZ1h1?=
 =?utf-8?B?ZitLQTFlQzg4VmE2QTJTaUphMUM1TFJoNlkvK1BVZ0FyVjhxRWJaYld5dURT?=
 =?utf-8?B?bjZUSGorcHZuSDlvTkFRd0RxRzRaZmt1bmwwVmEwTzRMOWNqTis4V2NyWFBj?=
 =?utf-8?B?WVJ2Nyt6UjQrOHNCaVpnbkoxb1BDRmU1V1FXZWswV0h6TmJTd2NwK2JldHdm?=
 =?utf-8?B?K0Fma2l2L0VVbHRvR0ZGSlR3YURwQ1NpejA4Yk9IV0tEQ3ZmeVFVWWZQajYv?=
 =?utf-8?B?OGFDc1ZWMWgzOWFEajdXeUdqVmVwYUJseUtEQUtlWEhCNTJUanhpcng2ZDE2?=
 =?utf-8?B?V2lnY1lMZ1FhUE1ORFRwUXB4bFYrWlBnSDU0c0Q5Z3NkT245Tm0vdk9JZkpY?=
 =?utf-8?B?bFZLbjFUamNCd25RRkxnK2FlVUtDWU5TZEU1dmNzK081bFZJQy9xdDh4RUti?=
 =?utf-8?B?NjQycjJGeGFGVEdBb0lCNmwwZFBsbDU2SG9tNkFwMkRGb1N1bVNXSlVPUml4?=
 =?utf-8?B?QmNwQm5BdUc3WTR5RjJrMG4wQnlHekZBZXBPaUcxejVzRzcwM2JEdGhKeWxJ?=
 =?utf-8?B?emdMWkEyU1VTemNqeVdsTlpBdDQ4UmFUYnhMc0tZdGZwQlNaWlhvMjIrYnc1?=
 =?utf-8?B?WGtSRm1kSDBvMm4rbGlRMnZMd3Q4bVJITTFLT1pQTSs0Y1VMcjRhbGlpSlZT?=
 =?utf-8?B?Q1hDVXEzODdxaGV2KzVUejJFR0ZvMTN2RTZoQnJPaDhzRUtYTVZYallyVUs3?=
 =?utf-8?B?S0ZzQ0JRbnl2QzdKMjc0S0VjVXNzc2drQmdpYXl3c2RGSHNPdmtNZXpjMkI3?=
 =?utf-8?B?ekpiYTZ5WXBEckR5QTlJUWtDQ3NRQlBKZVFaZzVTdTNXU1RKd2pJczRVRmdk?=
 =?utf-8?B?ZXR3OUZHZERtVC9mTkJoUis3YlR1WFZvWkFNTllPUmhXMWtWTE1pajFyZWJw?=
 =?utf-8?B?TGIxM3FUZjM5RDBDc1V6S3VtMG9hTmx1b2V5NzVkZWxRRE1JSnNjN1VZOHdE?=
 =?utf-8?B?ZjNuYkxTMlBkWTVLanpJeVI5TmZMaCtUc3pySFk3UlhTenk0cFRyOTg5bzEx?=
 =?utf-8?B?Y0l5N3hhTk1IcE5nMHhIRFd2a2U4Ky84NUs5YjVVL3d1bjVuei9XMUpkd3Ez?=
 =?utf-8?B?VkVFazRDT0FCMk5ORElBaCs0UU55WHFzdnV0UG95akpXVyt0RTgzcnhNQ1Qr?=
 =?utf-8?B?alc0cThkdHBKZThUTG9aVmIybWVSMlZmSXFoQmg0K0htRU5VSDNqRkdIbXJG?=
 =?utf-8?B?b1RCd0tqZzhwNHkzakdNcy9sa0VzblgreDhwcmlsRGV3dTRzakxzNE1wQWRZ?=
 =?utf-8?B?bFBNak9wWEZsNmpzMEtjbkpOQ1hLQStoejVpM05MdXJsbnUybTI3UjNsdmNH?=
 =?utf-8?B?SVRHb3l4cjEwZkRHRFpCcWpuY1I2QzVrMFprcVhRMTFlaWhNNDY3U0E3UFN2?=
 =?utf-8?B?MG9aOTBsSG0wRHVTTTQ4RUJuTTVTL0lZeEFoTkg5d1dISHhyQ2VDM2VCSkcw?=
 =?utf-8?B?S3UyS256OU43WFlKOE9VVDg3QkZneUFWcnpEb0hZTytCbkFRdStTRDRRZ2F3?=
 =?utf-8?B?K0V1YThvOUswOVdWcXZJYjZXL2ZvUFg2aWpubEFTbmJvVFhSY3J6eHJTelQw?=
 =?utf-8?B?YWxsMW5rZTdlbGpPN1NiZFBKKzNadEQ5eS9MdW5JVlJVYTdvMSt6aU5EUGtH?=
 =?utf-8?B?bWdyenluckNScExGNlp0VmlacWY4eHdXd2ZyWXZ6QlBhbTZ2OGtzdWZYNVJX?=
 =?utf-8?B?TkEwU00rcmJDSTV0Qm90Z0lucE5WU0crVm00NmhLeHVyS0FXREh0eXJFNDMv?=
 =?utf-8?B?aGc9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ff1126c-d43d-4165-bf41-08dd352c26f3
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB7135.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 06:16:30.6501
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OmXYeV7b1Cd2e/CevTZbDOWO3cmGVvRO4sEaH747zu/KFOMBzsPrKHvjIorEaek/PAj3N7vU0ABS8K+/TfI6wi4FmMRfWq9+dGb1vMticIo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7934


在 2025/1/15 11:38, Jiebing Chen 写道:
>
> 在 2025/1/14 22:15, Jerome Brunet 写道:
>> [ EXTERNAL EMAIL ]
>>
>> On Tue 14 Jan 2025 at 20:34, Jiebing Chen <jiebing.chen@amlogic.com> 
>> wrote:
>>
>>> 在 2025/1/14 19:16, Jerome Brunet 写道:
>>>> [ EXTERNAL EMAIL ]
>>>>
>>>> On Tue 14 Jan 2025 at 16:52, Jiebing Chen 
>>>> <jiebing.chen@amlogic.com> wrote:
>>>>
>>>>> 在 2025/1/13 22:50, Jerome Brunet 写道:
>>>>>> [ EXTERNAL EMAIL ]
>>>>>>
>>>>>> On Mon 13 Jan 2025 at 14:35, jiebing chen via B4 Relay 
>>>>>> <devnull+jiebing.chen.amlogic.com@kernel.org> wrote:
>>>>>>
>>>>>>> From: jiebing chen <jiebing.chen@amlogic.com>
>>>>>>>
>>>>>>> Add basic audio driver support for the Amlogic S4 based Amlogic
>>>>>>> AQ222 board.
>>>>>>>
>>>>>>> Signed-off-by: jiebing chen <jiebing.chen@amlogic.com>
>>>>>>> ---
>>>>>>>     .../boot/dts/amlogic/meson-s4-s805x2-aq222.dts | 226 
>>>>>>> ++++++++++++
>>>>>>>     arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 385 
>>>>>>> ++++++++++++++++++++-
>>>>>>>     2 files changed, 610 insertions(+), 1 deletion(-)
>>>>>>>
>>>>>>> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
>>> b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
>>>>>>> index 
>>>>>>> 6730c44642d2910d42ec0c4adf49fefc3514dbec..32f50a5b860435d50d9c5528b43422b705b20130 
>>>>>>> 100644
>>>>>>> --- a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
>>>>>>> +++ b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
>>>>>>> @@ -75,6 +75,19 @@ vddio_ao1v8: regulator-vddio-ao1v8 {
>>>>>>>                 regulator-always-on;
>>>>>>>          };
>>>>>>>
>>>>>>> +     vcc5v_reg: regulator-vcc-5v {
>>>>>>> +             compatible = "regulator-fixed";
>>>>>>> +             vin-supply = <&main_12v>;
>>>>>>> +             regulator-name = "VCC5V";
>>>>>>> +             regulator-min-microvolt = <5000000>;
>>>>>>> +             regulator-max-microvolt = <5000000>;
>>>>>>> +             gpio = <&gpio GPIOH_7 GPIO_ACTIVE_HIGH>;
>>>>>>> +             startup-delay-us = <7000>;
>>>>>>> +             enable-active-high;
>>>>>>> +             regulator-boot-on;
>>>>>>> +             regulator-always-on;
>>>>>>> +     };
>>>>>>> +
>>>>>>>          /* SY8120B1ABC DC/DC Regulator. */
>>>>>>>          vddcpu: regulator-vddcpu {
>>>>>>>                  compatible = "pwm-regulator";
>>>>>>> @@ -129,6 +142,219 @@ vddcpu: regulator-vddcpu {
>>>>>>>                                  <699000 98>,
>>>>>>>                                  <689000 100>;
>>>>>>>          };
>>>>>>> +     dmics: audio-codec-1 {
>>>>>>> +             compatible = "dmic-codec";
>>>>>>> +             #sound-dai-cells = <0>;
>>>>>>> +             num-channels = <2>;
>>>>>>> +             wakeup-delay-ms = <50>;
>>>>>>> +             sound-name-prefix = "MIC";
>>>>>>> +     };
>>>>>>> +
>>>>>>> +     dioo2133: audio-amplifier-0 {
>>>>>>> +             compatible = "simple-audio-amplifier";
>>>>>>> +             enable-gpios = <&gpio GPIOH_8 GPIO_ACTIVE_HIGH>;
>>>>>>> +             VCC-supply = <&vcc5v_reg>;
>>>>>>> +             #sound-dai-cells = <0>;
>>>>>>> +             sound-name-prefix = "10U2";
>>>>>>> +     };
>>>>>>> +
>>>>>>> +     spdif_dir: audio-spdif-in {
>>>>>>> +             compatible = "linux,spdif-dir";
>>>>>>> +             #sound-dai-cells = <0>;
>>>>>>> +             sound-name-prefix = "DIR";
>>>>>>> +     };
>>>>>>> +
>>>>>>> +     spdif_dit: audio-spdif-out {
>>>>>>> +             compatible = "linux,spdif-dit";
>>>>>>> +             #sound-dai-cells = <0>;
>>>>>>> +             sound-name-prefix = "DIT";
>>>>>>> +     };
>>>>>>> +
>>>>>>> +     sound {
>>>>>>> +             compatible = "amlogic,axg-sound-card";
>>>>>>> +             model = "aq222";
>>>>>>> +             audio-widgets = "Line", "Lineout";
>>>>>>> +             audio-aux-devs = <&tdmout_a>, <&tdmout_b>, 
>>>>>>> <&tdmout_c>,
>>>>>>> +                              <&tdmin_a>, <&tdmin_b>, <&tdmin_c>,
>>>>>>> +                              <&tdmin_lb>, <&dioo2133>, 
>>>>>>> <&tdmout_pad>, <&toacodec>;
>>>>>>> +             audio-routing = "TDMOUT_A IN 0", "FRDDR_A OUT 0",
>>>>>>> +                             "TDMOUT_A IN 1", "FRDDR_B OUT 0",
>>>>>>> +                             "TDMOUT_A IN 2", "FRDDR_C OUT 0",
>>>>>>> +                             "TDM_A Playback", "TDMOUT_A OUT",
>>>>>>> +                             "TDMA_OUT SEL",   "TDM_A Playback",
>>>>>>> +                             "TDMOUT_B IN 0", "FRDDR_A OUT 1",
>>>>>>> +                             "TDMOUT_B IN 1", "FRDDR_B OUT 1",
>>>>>>> +                             "TDMOUT_B IN 2", "FRDDR_C OUT 1",
>>>>>>> +                             "TDM_B Playback", "TDMOUT_B OUT",
>>>>>>> +                             "TDMB_OUT SEL",   "TDM_B Playback",
>>>>>>> +                             "TDMOUT_C IN 0", "FRDDR_A OUT 2",
>>>>>>> +                             "TDMOUT_C IN 1", "FRDDR_B OUT 2",
>>>>>>> +                             "TDMOUT_C IN 2", "FRDDR_C OUT 2",
>>>>>>> +                             "TDM_C Playback", "TDMOUT_C OUT",
>>>>>>> +                             "TDMC_OUT SEL",   "TDM_C Playback",
>>>>>>> +                             "TOACODEC TDMA", "TDM_A Playback",
>>>>>>> +                             "TOACODEC TDMB", "TDM_B Playback",
>>>>>>> +                             "TOACODEC TDMC", "TDM_C Playback",
>>>>>>> +                             "SPDIFOUT_A IN 0", "FRDDR_A OUT 3",
>>>>>>> +                             "SPDIFOUT_A IN 1", "FRDDR_B OUT 3",
>>>>>>> +                             "SPDIFOUT_A IN 2", "FRDDR_C OUT 3",
>>>>>>> +                             "SPDIFOUT_B IN 0", "FRDDR_A OUT 4",
>>>>>>> +                             "SPDIFOUT_B IN 1", "FRDDR_B OUT 4",
>>>>>>> +                             "SPDIFOUT_B IN 2", "FRDDR_C OUT 4",
>>>>>>> +                             "TDMIN_A IN 0", "TDM_A Capture",
>>>>>>> +                             "TDMIN_A IN 1", "TDM_B Capture",
>>>>>>> +                             "TDMIN_A IN 2", "TDM_C Capture",
>>>>>>> +                             "TDMIN_A IN 3", "TDM_A Loopback",
>>>>>>> +                             "TDMIN_A IN 4", "TDM_B Loopback",
>>>>>>> +                             "TDMIN_A IN 5", "TDM_C Loopback",
>>>>>>> +                             "TDMIN_B IN 0", "TDM_A Capture",
>>>>>>> +                             "TDMIN_B IN 1", "TDM_B Capture",
>>>>>>> +                             "TDMIN_B IN 2", "TDM_C Capture",
>>>>>>> +                             "TDMIN_B IN 3", "TDM_A Loopback",
>>>>>>> +                             "TDMIN_B IN 4", "TDM_B Loopback",
>>>>>>> +                             "TDMIN_B IN 5", "TDM_C Loopback",
>>>>>>> +                             "TDMIN_C IN 0", "TDM_A Capture",
>>>>>>> +                             "TDMIN_C IN 1", "TDM_B Capture",
>>>>>>> +                             "TDMIN_C IN 2", "TDM_C Capture",
>>>>>>> +                             "TDMIN_C IN 3", "TDM_A Loopback",
>>>>>>> +                             "TDMIN_C IN 4", "TDM_B Loopback",
>>>>>>> +                             "TDMIN_C IN 5", "TDM_C Loopback",
>>>>>>> +                             "TDMIN_LB IN 3", "TDM_A Capture",
>>>>>>> +                             "TDMIN_LB IN 4", "TDM_B Capture",
>>>>>>> +                             "TDMIN_LB IN 5", "TDM_C Capture",
>>>>>>> +                             "TDMIN_LB IN 0", "TDM_A Loopback",
>>>>>>> +                             "TDMIN_LB IN 1", "TDM_B Loopback",
>>>>>>> +                             "TDMIN_LB IN 2", "TDM_C Loopback",
>>>>>>> +                             "TODDR_A IN 0", "TDMIN_A OUT",
>>>>>>> +                             "TODDR_B IN 0", "TDMIN_A OUT",
>>>>>>> +                             "TODDR_C IN 0", "TDMIN_A OUT",
>>>>>>> +                             "TODDR_A IN 1", "TDMIN_B OUT",
>>>>>>> +                             "TODDR_B IN 1", "TDMIN_B OUT",
>>>>>>> +                             "TODDR_C IN 1", "TDMIN_B OUT",
>>>>>>> +                             "TODDR_A IN 2", "TDMIN_C OUT",
>>>>>>> +                             "TODDR_B IN 2", "TDMIN_C OUT",
>>>>>>> +                             "TODDR_C IN 2", "TDMIN_C OUT",
>>>>>>> +                             "TODDR_A IN 3", "SPDIFIN Capture",
>>>>>>> +                             "TODDR_B IN 3", "SPDIFIN Capture",
>>>>>>> +                             "TODDR_C IN 3", "SPDIFIN Capture",
>>>>>>> +                             "TODDR_A IN 6", "TDMIN_LB OUT",
>>>>>>> +                             "TODDR_B IN 6", "TDMIN_LB OUT",
>>>>>>> +                             "TODDR_C IN 6", "TDMIN_LB OUT",
>>>>>>> +                             "10U2 INL", "ACODEC LOLP",
>>>>>>> +                             "10U2 INR", "ACODEC LORP",
>>>>>>> +                             "Lineout", "10U2 OUTL",
>>>>>>> +                             "Lineout", "10U2 OUTR";
>>>>>>> +             assigned-clocks = <&clkc_pll CLKID_HIFI_PLL>,
>>>>>>> +                               <&clkc_pll CLKID_MPLL2>,
>>>>>>> +                               <&clkc_pll CLKID_MPLL0>,
>>>>>>> +                               <&clkc_pll CLKID_MPLL1>;
>>>>>>> +             assigned-clock-rates = <491520000>,
>>>>>>> + <294912000>,
>>>>>>> + <270950400>,
>>>>>>> + <393216000>;
>>>>>> Why do you need 4 base rates ? Which rate family does each provide ?
>>>>> hifipll 49152000, mpll2 294912000 mpll0 270950400, mpll1 
>>>>> 393216000, the
>>>>> accuracy of hifipll
>>>>>
>>>>> is relatively high, for tdm/pdm/spdif 16/48/96/192k we can use it. 
>>>>> if the
>>>>> tdm and spdif work on
>>>> It is fine to use the HiFi. I'm glad this clock finally got fixed
>>>>
>>>>> the same time, for example ,tdm 48k. spdif 44.1k, we can't use the 
>>>>> same
>>>>> pll, so spdif need use the mpll 0
>>>>>
>>>>> other pll , only set a default value, at the latest chip, we 
>>>>> remove all
>>>>> mpll for hardware, only two hifipll
>>>> I'm not sure you understand how this works.
>>>> There is 3 families of audio rate: 48kHz, 44.1kHz and 32kHz
>>>>
>>>> Each family needs a PLL assigned, so you need 3, not 4, unless 
>>>> there is
>>>> another specific rate family you want to support. If that's the case,
>>>> document it.
>>>>
>>>> Setting the rate of the PLL should follow this principle:
>>>> * Family rate
>>>>     - multiplied by (32 x 24): to accomodate different sample sizes
>>>>     - multiplied by 2 until you reach the maximum rate of selected 
>>>> PLLs
>>>>       This allows to support rates such 192k or even 768k
>>>>
>>>> 491520000 is not dividable by 3, it won't allow 24 bits words. It is a
>>>> poor choice.
>>>>
>>>> Have a look at the s400 for an example using the HiFi PLL. The axg was
>>>> restricted to a 68 PLL multiplier but the S4 is not so you should be
>>>> able to use a higher base rate (4 718 592 000 Hz), providing better
>>>> accuracy in the end
>>> for new soc audio ip, the hardware will not support the 
>>> 24bit(include g12a,
>>> sm1,axg)
>> That may be what you chose to support in your BSP but that not how it
>> works in mainline. 24bits slot width is supported and has been tested on
>> axg, g12 and sm1. This is not going away.
>>
>> I would find extremely odd that 24 bits slot width is not supported 
>> on s4,
>> but as long you document this, it is fine by me.
>
> i understand your meaning, you sad we configure the slot width 24bit 
> for tdmout control
>
> if the format the SNDRV_PCM_FMTBIT_S24,  it send the 24bit data, for 
> the format, and send the 24bit clock
>
> if tdmout control can cut out [24:0] from the fddr, maybe your right, 
> we can send the 24 bit accoring to the slot width
>
> but it can't confirm by us, we are worried that there may be potential 
> risks, so we don't use it thay way
>
> so this why i sad can't support the 24bit slot clock, 16/32 sample bit 
> is fully validated
>
>
i did some tests for the S24_LE format use the tdm base drvier

aplay -f S24_LE test.pcm -r48000 -c2

  # cat /proc/asound/card0/pcm0p/sub0/hw_params
access: RW_INTERLEAVED
format: S24_LE
subformat: STD
channels: 2
rate: 48000 (48000/1)
period_size: 6000
buffer_size: 24000

we dump the mclk

aud_mst_a_mclk       2       2        0        12288000 0          0     
50000      Y audio-controller-0              mclk

according to the base driver

in the api axg_tdm_set_tdm_slots function
switch (slot_width) {
     case 0:
         slot_width = 32;
         fallthrough;
         ...

if dts not configure "dai-tdm-slot-width"

it use the 32 bit slot width

the api -> axg_tdm_iface_set_sclk

srate = iface->slots * iface->slot_width * params_rate(params);

set mclk rate

we dump tdmout control register

# devmem 0xfe330500
0xB001003F

it set 32bit slot width to send

the base driver is the smae behavior that we wound expect,


>>> SNDRV_PCM_FMTBIT_S24_3LE, 24 bit in memory
>> I think you are mixing up slot width and memory representation
>>
