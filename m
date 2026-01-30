Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010025.outbound.protection.outlook.com [52.101.61.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0272AEE4;
	Fri, 30 Jan 2026 08:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769761184; cv=fail; b=b/IKUksP3W/5Vk0hKoFY4Hd+Q9mi+fPeqlajH5T39j8EHQtNpPp5DVlZ7Y/ed3N70Bza73+Cm2RbTw6vAnNVGowOiT5CX4qcwzM34n0XyKxHEmrM3wIASHysEPAcLs5vzGpfvrc0Z1oBiwccnsvT54FLynuVhr23bMXFbZHtfAo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769761184; c=relaxed/simple;
	bh=x/oGIx9hyFKW3KXSEnQRpFkHsEVbqDafzw/hY6Tr0s4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=j5z5l6kGIAU+C7VQ+JJ0pVsmNaMuem5Zl9oJg5QtdenQ7YD9jLk7x2vfgceiB5ImARC7Pbg9w0rst0voypr86VNmeDRRqeP9xPlAgNnxxEeQcdojyc11jk/ey4WPq+NQpaXKc3QZkHH69BTpXNHS6eqRFDeEzTDkPeRBkbbcH5s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=AnqB+HZJ; arc=fail smtp.client-ip=52.101.61.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="AnqB+HZJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V1H3oC6Yh3ZtA5Q92SuDrftv/RloxJr7nMvFf+K5NBM8CU5Plk86ppOdr4w5JcS1Q6bf0OctgHIzF+CwO5UrWFkzrJdLb9PtYyH9IKkUD6q8mLP1uj4TTPfHgcmkvhb6jv4NXRl21avt7/hA+zfIVXTFoON7aR03f48nW3GQmeKH+zCXonyP8/nvSocXEEQs0vayEtxIDb/jK3KbUDrGzGXbhiuHIau6PIw1vNqMgBpb0fbniNuP3LoiTOB+FWLGiUXDMxJYBp89fGD9h3w2ZHIw6s+nOcOxQlzNlEhY2xgKFz16tZZvEb5Ne1L1QVNRvkH6DPGXrcDhiQWBo9fs7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oHEAq0H4SJmUvz1J2vy+a7VQq2AZCinqKMvVnRt1bvQ=;
 b=L8plfa7rvT3PV2dC8p3jH3v7PxGd7KX4leJMPmcbHvxoYKLnjKZsj3m4ds3pRORzna/IXeyBbhp4//p1mPopckFQ6NUl+8FXsFnqWq6gD4A9ZN5Wa4F87Qpr7H7Ygk5m2dUfQYCiwW/Mulepo2hQ2IjXvggQTG8j8nrUQJ63Mo0woInHEO3uP5WDBdKwbD/Wciv6MMJsboJGajoQX6rCTBmZl43jHI3vYCEnDy2tGD++abGUB2+j+d2dBGeO1k0luEtBRyVAIUa4IVhSU378Kji2kF+YmdQDFKRaA2aH2Nu/6N2LuQkGLHkgTshLtWcZEg+HorTM6MpvZ9KOuYXQ9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oHEAq0H4SJmUvz1J2vy+a7VQq2AZCinqKMvVnRt1bvQ=;
 b=AnqB+HZJhM9eRv0j4XFgzVIRBEorlWHnbYKbmoRoMHqm84Fr5C6RgPG1cJoCujO2neHSIV7SH/68l1T23FspzpwlkQ32b1SAcB4KJ8Ky0R8rr+s+7/UP4pxZGVRf9cLCUvIKvasvHI3DI2IFNRIkm+rpCFSP1s18pV/LsTV+sok=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB6939.namprd12.prod.outlook.com (2603:10b6:510:1be::18)
 by DM3PR12MB9351.namprd12.prod.outlook.com (2603:10b6:8:1ac::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Fri, 30 Jan
 2026 08:19:40 +0000
Received: from PH8PR12MB6939.namprd12.prod.outlook.com
 ([fe80::d84:b1d8:bca1:7c3d]) by PH8PR12MB6939.namprd12.prod.outlook.com
 ([fe80::d84:b1d8:bca1:7c3d%4]) with mapi id 15.20.9564.006; Fri, 30 Jan 2026
 08:19:40 +0000
Message-ID: <7aa5b8c1-1d54-4d40-8822-5e79d0fdc4b5@amd.com>
Date: Fri, 30 Jan 2026 09:19:26 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ASoC: xilinx: xlnx_i2s: Discover parameters from
 registers
To: Mark Brown <broonie@kernel.org>, Sean Anderson <sean.anderson@linux.dev>,
 "Dhanunjanrao, Katta" <katta.dhanunjanrao@amd.com>,
 "Sagar, Vishal" <vishal.sagar@amd.com>
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
 Jaroslav Kysela <perex@perex.cz>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Takashi Iwai <tiwai@suse.com>
References: <20260129172315.3871602-1-sean.anderson@linux.dev>
 <20260129172315.3871602-3-sean.anderson@linux.dev>
 <700e4e67-a2ed-4b37-a00b-303bbc5ee6cd@sirena.org.uk>
 <a95d7feb-4d94-4b25-be96-c7c367342c19@linux.dev>
 <a17602f1-537e-46e6-a85d-8a005a0443a2@sirena.org.uk>
 <21a738e6-6585-4479-b797-f8b17df91aed@linux.dev>
 <06b3d7e0-27b5-433c-85db-23e4c5ef5472@sirena.org.uk>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <06b3d7e0-27b5-433c-85db-23e4c5ef5472@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VE1PR08CA0019.eurprd08.prod.outlook.com
 (2603:10a6:803:104::32) To PH8PR12MB6939.namprd12.prod.outlook.com
 (2603:10b6:510:1be::18)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB6939:EE_|DM3PR12MB9351:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ae43989-572b-4986-c15c-08de5fd8504a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U2RIMjlzaXU2RlBLUWM4UVNhdVRsQVlQSjJKOWE0TzFyME5ZZnVrQU5helNZ?=
 =?utf-8?B?VkVpVHovWHJvS0FwbzEwMmw4UURvUUFIUGtkbHEvMnNHOStjaGxkTXR6T3BZ?=
 =?utf-8?B?UTBNT0R0UG10ZUNSZzQyaWIza1dXbFM0Tm52RjErQ1VVcno3R1JTemV5RTFh?=
 =?utf-8?B?WnJSMnBJRTFMZGhhUzF2Um9zOGRETklaOGRqWkFkdXRCd1MvZ2xEM0JjOUcy?=
 =?utf-8?B?KzFnUEVaVVUzcFVlOFZWb2dzUlBPQXh5QlRXOUFINnNwaVFaSE4rNzkxeUp0?=
 =?utf-8?B?eWRuUW8rWCt2a3g5ZHVoK0RYdFRLVFJUM09FOCtiNVhsVy9yWlNQcGtvVzJs?=
 =?utf-8?B?ckZ5UDBYSnRXYU9Yb1p1Q0I0aU5IcktJcGxqb0Q1RmlQLzhsNnJGYUFTTjJl?=
 =?utf-8?B?TTIwaS9VV09QdGROU3FWbE4vdTlPZHlwZi9sWklpQ2dCTStvRCtxSFI2SldX?=
 =?utf-8?B?L2w1SUN5eW4rWENmRWpIeHRCQWg1Vlphc0U5b1VhdFFqS3lyV2txUWFKZy9Z?=
 =?utf-8?B?VWpSUEJ5KzZobVdPTS9mWEtSZW42eUNRWE5HOVh3Q0psTWlLa2JnOEpRQUk3?=
 =?utf-8?B?RW5lYzdJOVRIdXBvUWFjWTlFTFhsMlBhMEJXMzEzRDBTOUlIa0trRlJNYWwr?=
 =?utf-8?B?c1d4SUxKYWNFWGMybnJnTDNYZUkvdE1Qa3EyTU5xcWFSWVd1WUFLZnlLY2Zw?=
 =?utf-8?B?bmZYTHhpVmkyTFJGSlZHNVlYNGlNUk90SnJDSEJidGZNTEltNnZEa28zMHFh?=
 =?utf-8?B?UWRVaEs4UG51N29DK1YzRytCS3k5UU83dU1MamJ2VEhFSGp5ZGpjVzkvRnRD?=
 =?utf-8?B?Ti9DSzBsOFVaRmMzOTVLbDkzNmVjQzEybmh5WlZiU2pSQkhPQmtuRjRGMldr?=
 =?utf-8?B?aUs3bEh4ZlY5UWtCNXpXemVmRU40bGlIN3JoRW1pcHU2dEE0V3ZubTZ6NGpS?=
 =?utf-8?B?V0syMnVtd053UHd2VEhKU0VWbFlnOHJkdnJveXAwTWU2UTAyT05LZ05vWWVC?=
 =?utf-8?B?ZWpwM09NMG5Fd2cwTU9ySkhFbWFsUE5CdDBGQVMzWFN5WDU1RFUzd1I3WGZw?=
 =?utf-8?B?ZmhibGE2QUJueDdrbmlNUjZXNUE2VHY3Vmk1UWN3RG5hMVJvbHV5bFA4cWhE?=
 =?utf-8?B?clpRUW1rUkpaR0drZ0Fzc0RwT0Zsekx0VnBoNjNXQzBhc2kzbXYrTTVBdmQy?=
 =?utf-8?B?R21HNk91THpjaXo4Y0ZIVVMzWEszZjdoeWNyMWloUVFXYVdiMnYrV2EyMjlV?=
 =?utf-8?B?K3VrclRSOTdHWTlPVjJWM3BuSkV0SFgrb2lzc1htMXZkeVdxYlVaaUVOd2pr?=
 =?utf-8?B?dFE5SW9vRG5BTllFanpBN3RlN1JXMG5BaFVPSTVuQ2pUVlJBMEVkUXdGT2dU?=
 =?utf-8?B?Wmw3bUhsbWNjajZFSlMyZnhlcTk3VldKTkp2SGt4bklSZWUwUjNPQkFhbGZj?=
 =?utf-8?B?cVRDVGRjY1hCeXJidUFnWURZdXJ6S1B0U0FJRTZKMHQxUThHQTZiQWNYV0k2?=
 =?utf-8?B?Z3Q5UUp5VWt1UVVETjduZVNwQjA0REh2NDZqZFhUT1RkZGdkNzBxZ0s2eWsx?=
 =?utf-8?B?eCtnZEREcjMrZzNmaG9zVXFPMzNlNjdMSnZTb3FyNlpRMzJwZ1dPdHFraGZD?=
 =?utf-8?B?Nmk2UkVUbWl3VUlyY0xiMEdFSTBBZDVCNkpZRk1LT3N6TEhYYjAzWkpROTNj?=
 =?utf-8?B?RVR5MkR3QXpzTW54WU1LcFY0aTdVL1JvQnNEek0zUDhjVzNxeHF6cldWQnJx?=
 =?utf-8?B?NmMvQnY5eW5ONnFmSFduUytCVTZCa1VVSk04bHdzZzZvcFg2M0lya2dIN0RU?=
 =?utf-8?B?emorbytuckJnNTBHL0h1ZjFHZ0ltcU16VEcwZkF1WEdOUlpSdzh6ZVU4bGZt?=
 =?utf-8?B?OVBOUy8xZ2krMzRwdXdYMVFHY1U5U0dKZ1ZYeXY1bFdKaFlsV0plcTBMNmda?=
 =?utf-8?B?RlEvMXhnK0NXTEpNREFQV1YwVHcyYlNCV29GejZ6bnBGMTZpcHNiVTdkdmVF?=
 =?utf-8?B?Umw3azNmbk5KYmxlV1RtRThhVTcrNkZ5L2NpTUtwdWV3YklDckRqNHVBVTJj?=
 =?utf-8?B?OU5ONXRIdERzZm1qRHJjQVhoQTBLcnVMWjJLUHAvVFpzbmdUWTVMYjN0dHJ1?=
 =?utf-8?Q?7OPw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB6939.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VG5uNjNSQXpmbCtGZW9tMmkvU0MyTXE5N3lNZ1hxaFcwdTNvZVVveWduMlNJ?=
 =?utf-8?B?WmVQZit3dVJuVUdzR0hwcTFIdFhnczhXckZ6djgzTHoraGN1TVpuQS9pSGlJ?=
 =?utf-8?B?RGllYjRpemtOSTRmbmU4a2xBeC9OSG5OMFdCYkUrUmR5OUR2S2xPQXU3ejhQ?=
 =?utf-8?B?OGl3TnJWWG5oYnorazZSeXBpY3RGMlQ2dEZnZmp0S3JBaDJ4WkdXT2xLd2cv?=
 =?utf-8?B?OE10NFF0dnM2ekc4L3VEcWxZdDhUWnI2dFpWRzJBcjNDOU5uM0Nld1gvZ3Y5?=
 =?utf-8?B?QlBLeVIrQnhVai8rLzNtd3hvZXc4N2FaeFRLUHhBNGMxNkd0OHNDSjgxZnBU?=
 =?utf-8?B?TDRkK2hSVmpkWTVzNHdRbzFWNXBXRHBzY05NSDJRZWMvbWlCdzBqN3AxRE1q?=
 =?utf-8?B?RlNtSVhjcEZEemZlMzlwUGJXNkFxdkFvUlFNcFdSV2pTQ3FXYmxxRmJDWHZR?=
 =?utf-8?B?djdUSG45aEJPeElQTmI4YkJEWUZHV2lvd20zQ01rTFRjMjJIcUtubFhBVFpl?=
 =?utf-8?B?NzFxUVRxTWhONGR6RFZiRzV3L1dnV3U2bGpwV0F5N1dJdTFPMk44Z2o1WlNL?=
 =?utf-8?B?ajB1eU1GbUdLczA1VE5mSWc1cjhHUzd4SnhzaUZuUDVsVzR3Q1BpNllCWDlo?=
 =?utf-8?B?OG5oOUJFWGFqWU8zQms5bUtiU256WURCZGcxYkh3eDBWRktPZDdpM3M2T3RM?=
 =?utf-8?B?c0pScisvZFRmOC9mV2hrdGxmTjVkZk1Ra2tIMDJQcnltb3doOWdYTlpUTlEr?=
 =?utf-8?B?aThsN0FCUGZ3WURVT2lJVzF1ekh4MmR4ZTl1cXE2RnJSVFJpdVhRbDl4TVE0?=
 =?utf-8?B?WCs0OVkybDBKbGtQVGhzNlFYZjRXbDJ1c0hOSy9ZUDFzVnlwRURWK0ZDZEhj?=
 =?utf-8?B?M2hHT0JIWXNEYmdNK1VTbk1nYVovNGc3U0twejlXa3g3akRjWE9aYVYyQkRF?=
 =?utf-8?B?UE53bjZFY1lLZ3JDc3ZDM0dWWktTNmNiWFE0eUd0Q0lrQ05HQzA3cHNQOUlv?=
 =?utf-8?B?WmVXVVlManZ6ekVlU0U1WTNSTlZmWlJQYXQ0TUs4TldUUm9tUGFhMklWeklp?=
 =?utf-8?B?THMvRDRoRWJRT2NkK2xyVjR2OHNmN0V5ZGZjMVREdENBVUl0OWlWVDBENUJR?=
 =?utf-8?B?cUsxMEx1eWdEYXRVQTY0a2FlSUtYNHUrY1M1ZHFndC9wSDZYN2tEOWhMeTJ2?=
 =?utf-8?B?RldCWkEzeDNqRzVON2IwS3VLWjN4aU1ZeUVUdG9IdTVIdjRhZElNdVJPRVcr?=
 =?utf-8?B?T2ZYWmlVV2dhRW1ZSkx5eU1GZEpvWFNsMDRxa1FBRTFnT3BFYnRvOWFCcEIv?=
 =?utf-8?B?enNwTnJMMmJ5MitoWGovd0J0SVVlaWtLSXY3RDQrNkFEWnIya2VPamFSRU9E?=
 =?utf-8?B?MENEMkJrYzhXVGp4d0ttc29DRk5RUVVmMlZEK21Jam1ldTlIbUcrOVZRZEVZ?=
 =?utf-8?B?cXVxdkl5bXZpOUpiUHhiZXB6RjkwNEpxeFNaMlBjN2lhZ2RVMHZvbFV3RVJ2?=
 =?utf-8?B?ZnpxeWVaUm96VmZjT0VZOEViQ2cvMC9heHBBcm5uZlNMQlhxQUtqZkZIa1B3?=
 =?utf-8?B?VXlHR3RLY0dJNEFvNFFGNXdmR1ltblZqcDJTdzB0OFVpdlh2eDlOa3hUU1JY?=
 =?utf-8?B?UmlkSHpyOC9wY3dKSTFRS1JOZnVGWmltSjR4NkxCelAvUTI4Rm5DdDNUVDU5?=
 =?utf-8?B?MlZNeG9vSmM5R09DcnVwNFg2MWl5a0pScEdBY1JvNkpocFBUYk1jaFA1RWtn?=
 =?utf-8?B?Q01ES2ZzT2p5MVZaVDVaOFJPeFI0SFZITmUyV2pzTjQwaWVQQlJraHN6Zzcr?=
 =?utf-8?B?T3gwbC9EMkhDazhCbjgwdWErVEpZV2Q0MThmdTlLeVRrMVZPeDA4amF0SDNU?=
 =?utf-8?B?WFR6K2c4UUREa1JQZXM0M05xaG5tOW8zWENrbjloUWtxSDY5STFBVWpCdlJN?=
 =?utf-8?B?VEdyZnJkOHFxeWg5QmVTZWNTcGdlNytObjM4cXUxUVhub3hJdldMbFN3L04v?=
 =?utf-8?B?Ym1sWkNKTXA0UVRQa0JZUmh1d1ZDdFB0NmlCWXFhVm82cjBCdUpxZE9uVDZD?=
 =?utf-8?B?WkJpSFp1SFVmZHEvK2VZcWMwazN3UUp1b05UWmdUNS9TZ1g3YXgwSW00aGpP?=
 =?utf-8?B?a3ExeXlncElhZGdjcU4rNzlLQ3pzWG1oNHBZOEQyalo4WnpmWVZGaTByS2VR?=
 =?utf-8?B?b25XN0dRRXlLVWhMckwzUVlPeHZhUlptN3k1TzcxWVZLVUJOMGxBYllqS1ZX?=
 =?utf-8?B?YkRPZHJsU2FFMjIxRGpRbStzTDlxNExwWTFhclYxU2ZnOU5NbUg4OEN1SDNz?=
 =?utf-8?B?bFBsNWhNMEhsaElBSWhuTndMalQrYk92R2xhK1RaS3h0NTM5ZDVpUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ae43989-572b-4986-c15c-08de5fd8504a
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB6939.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 08:19:39.9909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yy3T8HA1X+Kp1g8UfFx3PYtV46AWnRWtJx381Y4g4gqZEOUueykgzTY4txw+DCQH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9351

+Katta, Vishal

On 1/29/26 19:46, Mark Brown wrote:
> On Thu, Jan 29, 2026 at 01:17:45PM -0500, Sean Anderson wrote:
>> On 1/29/26 13:09, Mark Brown wrote:
> 
>>>> - Driver authors tend to use them even when there are hardware registers
>>>>    available with the same information, as Xilinx has not always been
>>>>    consistent in adding such registers.
> 
>>> I'm not sure I follow your second point - driver authors tend to use
>>> what?
> 
>> Authors look at the devicetree node and see something like
> 
>> and go "Ah, there are the properties I need." On some Xilinx cores this
>> is the only way to discover certain properties, so people have gotten into
>> the habit of using them even when these properties can be read from the
>> device itself.
> 
> Oh.  If the properties are there it's reasonable and sensible to use
> them, them being redundant is a concern when specifying the binding but
> once things are there any discrepency should usually be resolved in
> favour of the binding.

Let me add our driver owner of this device to answer some questions.

Katta: Can you please look at it?

Thanks,
Michal
