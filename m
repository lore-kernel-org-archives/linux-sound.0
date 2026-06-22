Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012054.outbound.protection.outlook.com [52.101.53.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B74394E80;
	Mon, 22 Jun 2026 09:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782118893; cv=fail; b=nWc/s2otycNMY9w/S2fLQEzt2jpNTm/TTy+lys+2i/H5TcOwbIFpPJuXlXH/YatJqzYw5H4Iptu38Bi5AGRMwpUTr/XCXzeRI5l6wm13jXfSWk16cj2ouG3stEsJ2dnTH//fmzYKQdLzZ2cYGyMhmiXf1he77RjWTGH/XTS8Q7o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782118893; c=relaxed/simple;
	bh=yB6LRuCR0oVI22K6v4YlCyRv8q69Yk6HR1eXdUfkWMk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=I8d30Xo4FoQqcg2oxXurBOEU80eU2Gr/k/nUMZmIedq7+WYCgyl6uoeVJgB6A1MfIWApzYlKtqXHTIEkhENvj1LAl7RcXFtom8CbaOObHaZaHsvTTk28BllurnjwuYuOveoZ9zoJZzpHTut3o2Dr45m9fXnMWUXSLnmmKamVcZc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=2Yj/Q148; arc=fail smtp.client-ip=52.101.53.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="2Yj/Q148"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ky9LkkqQZPNSjiQHUMpFMVn2KdwwjIT6yEh0d5K6wbpWE73/F/qrxTtNnurkx9mofK7qzGv28eI79CP2w65/AZ96tDw8kKP739fMG7UKXmk2Bazulex9nneqNWMNzgGL+yurLYkcmUqUOGhi6pzruKp5IYmP+qffzMm2pSlsZlBkHvBuYhmNU68xgHZ4MnNj3nZxrnJYy7d6IIXQKGgCIe/SGKhNZtJlG4uwAYYArWCpAiMbFLMc11SBvCl5kRNdJFoc7j7cZXpQP+AFXZ2RSPkDFzOMVtLn2Ciew6DE4PWiK1pmZVnKRrSVJXHwsgN+nVndglFNL0/aEtIzyZ7TuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WHEZuQwxI6z4pvGaUM2UTrQA5QqJYzqQe3okYA94rWI=;
 b=fWnVkw65eu2VfYt0NZDjXJ0+iK4RZr4xGCvezlcBupqMDw4Wc8Oq9UwR+wvwXCLdPbZ/6zkPKgKV2ZkGUirBwiYUhjzJqCNOrx1RtQvO+gr7NVaGeetuX23kXe6sKLGp3kNB+DZeVCdtQ2Y+A142g4jpukeh/mGAUYi2FnhGvbc/0PAxkQEmy1GYE+ZjcQRD2uUFcct5W5bXiiPH6WKChCdSFcbjk0X82sQu98rudINFSBwEekV8d0u47zyOMZg8G/guGYbcO0+Aosu6KBOKO7f/RmIU65iNIjQBOVftmqMNXsVAwH8a/uJA38IfKDltG8ImnW/h08dauzGQjYo3pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WHEZuQwxI6z4pvGaUM2UTrQA5QqJYzqQe3okYA94rWI=;
 b=2Yj/Q148xT2DYrNWsLEv5Rq3wXO5GIsLStSUgJJGQdfLhMUjgU9rNHs3FKYs2ymuaBs8vgg45vL4NiQ/1llhSrrlDwRMA6uZhTa6h9fSCevytCjiEr5+GLFJKkOxfjWuC4lpCSXvj7Sf7Z2hOt+0MGY5CudGxOOYox5W0pJ9U/s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5356.namprd12.prod.outlook.com (2603:10b6:408:105::23)
 by DS5PPFB8FBD73EA.namprd12.prod.outlook.com (2603:10b6:f:fc00::65e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Mon, 22 Jun
 2026 09:01:27 +0000
Received: from BN9PR12MB5356.namprd12.prod.outlook.com
 ([fe80::8e9c:2f3d:9679:942e]) by BN9PR12MB5356.namprd12.prod.outlook.com
 ([fe80::8e9c:2f3d:9679:942e%5]) with mapi id 15.21.0139.009; Mon, 22 Jun 2026
 09:01:27 +0000
Message-ID: <4b711cf3-00ec-4500-a48a-25ab3b50d7ec@amd.com>
Date: Mon, 22 Jun 2026 14:31:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: amd: acp: Fix linker error with SDCA quirks
To: Julian Braha <julianbraha@gmail.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Sunil-kumar Dommati <Sunil-kumar.Dommati@amd.com>,
 Arnd Bergmann <arnd@arndb.de>, Mario Limonciello
 <mario.limonciello@amd.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Randy Dunlap <rdunlap@infradead.org>,
 Simon Trimmer <simont@opensource.cirrus.com>,
 "Mario Limonciello (AMD)" <superm1@kernel.org>,
 Hasun Park <hasunpark@gmail.com>,
 "open list:AMD ASoC DRIVERS" <linux-sound@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260619124343.1683484-1-syed.sabakareem@amd.com>
 <f092d0a0-3188-4fd0-8228-2b715c642a08@gmail.com>
Content-Language: en-US
From: Syed Saba Kareem <syed.sabakareem@amd.com>
In-Reply-To: <f092d0a0-3188-4fd0-8228-2b715c642a08@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN5PR01CA0034.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:260::8) To BN9PR12MB5356.namprd12.prod.outlook.com
 (2603:10b6:408:105::23)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5356:EE_|DS5PPFB8FBD73EA:EE_
X-MS-Office365-Filtering-Correlation-Id: 8406ce04-c049-42c2-27be-08ded03cd7b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|22082099003|18002099003|3023799007|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	CXOPmmyxncpEuadJZ6knf1ZWIS0iWVbMqg2py4pRiIxqXKx2kzQWZVx25k3k9H90h9bA2h2PScdPBg2IF+uDR/zqALukt5qpzvslPP1t44YO+mveHV6QgTUIqR3K8UtrNQf2JdlcoDpwhBwVGJf0SLvAZXvyMvbBLTMJJXrOBMZ8XOffxhcnZIBEYk7/CcEKZdu4cU0dGUwaEtVcFHCJ8HGBhQrc0Lkti6807+aiJ9XkisPN5Uoof8kpLQvzpyNXMouVOa55ZZ7bNXax9R6JA9zjqWDomRamvDVEF8tSVv+3l0p4HpKSssLT0qirvLGe5ocNwbxyPknjtQ8PulSV13Eb6i3kE0oE+jYCvuJONToKdJGplX+sDBabHolAgKmvjuM/wb2JbbLOpCvOS5/lel7SSakX+NHu1INoWYdbCjY0H0S4NRNoiVWGuhrHfUmL4H0Ul09qkBDhfZSf/2FwYaNZ0NUmzm2Zy396aFPVSSGMBMQekl5JmvyaN38Wy3wjoQkXSVfBYLAgf5oy8OIT+39gOKnQLpCk1lbMheWuuSWXKZx6AS1ipAPzVP5/kw60hFtF4/izewLTuTmTvOZtFLAD/FYMvRd3a37PJJDKZmJzMqrUMDpuR3A48B5DusynWCD3em3u8kbLCsbdBQWg1MfhgTEgR5dBpaXaBEUPxLE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5356.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(22082099003)(18002099003)(3023799007)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cmRwNC9aOVVWS0dOS2d3M3JpRTBZSHpMWnB3MXVkV2tDRHhzMmQyNEpkVHB2?=
 =?utf-8?B?SkNYZWh4dHBiZ2lLRjhId0YycHgwUFk1YzByL1J4ZnBFWGdCekVnK1pybVhM?=
 =?utf-8?B?bzZtQjVWVDY4MmZkQnUwU2lkc0piUTkyTXNZQktObElGRS9oM3laSG1lWDRL?=
 =?utf-8?B?b0NZQ3ZSQmtEWFdkeTY3N1hSRmdKK3NkbEdpQXhOK21VeVp2NG5rZFhHRjIw?=
 =?utf-8?B?cDNkNmttdC9Lc1dKSVU4aFNqaXdSQk02YW41VXI0ZUZkd1dYRjgrSXBEVVBI?=
 =?utf-8?B?c0QxcFBaSkdxK3c0N2VzU2tIaGM2U3o3WTlsMmd2SlRWTnpEUHdzdktwYWor?=
 =?utf-8?B?dFdZaytPUFFpWU42eFRjZGV6dHFIMU53WjI4ZkJVbnBwaUpSSWt4b1RPM29j?=
 =?utf-8?B?VWw4RVAwdkptSVZsdmEwdDlTMldJWDg2VWZDQ1Q2R0w1cnhydHltVVBlaW5a?=
 =?utf-8?B?aHhyWE5SUDg3SndMdlVTVXFkQldzQ3BsQVM4dldHejdMRy90TGgvRER1OEdn?=
 =?utf-8?B?dW9GQlZMM2JqSXhNQVd4Rll1Ym5rNDkxUTlKZFdhVEFrcHlSUDFBQ00zWFl6?=
 =?utf-8?B?MzVSOEZnZ0UzUmNHMVZJQ1dkdXZuWmVrZEZ5b3M4THdoTXh0VzJ6dXZRUWRP?=
 =?utf-8?B?Nmo2eklmQUZEZFZELzZMS3p2dTBLY3NUd1VlV1dFYjNZTW1sTGdLTWNOVFR3?=
 =?utf-8?B?N3FTS2oxdVkxeC9UaTl3UDBUaVQvcXBxY0draUtIOE4xRUZ2b1NFdlp4ditS?=
 =?utf-8?B?NDc0RnJuTjNEN2l0dTJjK3V1d0IrM2lhZ25CR2dKSmNqTC9lUDdjSzBWTmRO?=
 =?utf-8?B?Nk4yT1ZjQjBxQlZONlY3b1R1NUJ3NVRhdE9JdXhJbHhxcDhGalVkZFNzNmor?=
 =?utf-8?B?QVdKaTZkMkJXZ2VnT1hZbDl6c25qM2s4Z3RoV3ozbDFUOGdxalVLamlxQzNT?=
 =?utf-8?B?ZDhCNWdkZE0wTFZNSnlqSUVDdXZRcDlaUmVTSDZxdm9ldEMra2lPdDlmTHBI?=
 =?utf-8?B?c3VWSHJrOUtGcy9kRXhNU21LdDRxNjFvcjVqQlVoYUFZcjU2ZEdLTjk4ZHZY?=
 =?utf-8?B?QVg3b0JsWDgrTVJHNHFtditoSHhIaVhvM2NYR01TZnRFRVBOSFFwRFk5L1BS?=
 =?utf-8?B?enFDeGdhcFRGSXJmR2loSnlIeGtrVUloSGFRa3ptR3FFdmM5OGlZRWtPNEZD?=
 =?utf-8?B?MHZmTHVCY2lELzJwWkZwQU5TbXYvU1c5QW5TV0lrS1V3YTZOcmNTRnRNMzlt?=
 =?utf-8?B?YTV2NGdjNUJ3RTR5SXFRRjdqN1NRSTEyMFkyc3BuSytXV3k0U3Y3SmpWbFZh?=
 =?utf-8?B?b2o4VHVlZnRmcThWRmF4RFppLytZYy9EL3dMaVF5ait4MUJDODFmQmk5c3N2?=
 =?utf-8?B?ckdpSVM3T1N6bU9PSFFwU1BmV1U3UHdxVzBacWFIZ1dOWU03cFI1U000bENx?=
 =?utf-8?B?OCtGVjlaMFUrNGdlMk94MThxb2s2bFZiZld1WDAvdTh3YXBmS01WK0k4QmFj?=
 =?utf-8?B?cHFYYkp2SzhBdzNPQlJDRUFZRmxVbTFld1RWaUtSUnBxb2E3VWlucFpLZWV6?=
 =?utf-8?B?bFU3QnVhNFBEUXN4NS83NVUzSzN5RWpUaGdCVk12aE9xUm5DL0xIK0JnS1Fs?=
 =?utf-8?B?R1UxYlFrTXpid1JFanV3TnlyV1lxRkkzZXU3TUtVYmJIZ1d5SUJVZzdHd3F5?=
 =?utf-8?B?L2ZsRm42bTF4eDB2cTYrWmJrMVBkZEY5aGVyckVMOWJ1RjA2K3JOeDlkSGRh?=
 =?utf-8?B?UVhnU0dYQVNvd3kyNUN2dEFkcEtKVktscURNYVhtZVlyUmZuTjJFR1B1TXdL?=
 =?utf-8?B?alg5ZnRLZTFVUU5pTjQ3U3IrTGx4OC9TYXllR0I3ZUZxU2pkcTJabm5kTmd1?=
 =?utf-8?B?Z2FpWmVsVFJjQnl3WFFrcEtTYXRZU3ZPa2VwNmcxSGhNbmk1dDRmL0RkL3Yr?=
 =?utf-8?B?UGFnMEM4VTMvak10R0dnUitmZm5qRkJ4akVSNmMyZTd5Z1htTTJLNjl4UDE0?=
 =?utf-8?B?T2x6d1BjTFZrazdSeUtzQ2ZKOUFORThGd0RyYWZGUVMvMGgxYUdLYVBGNUUy?=
 =?utf-8?B?RFBiNWV4Rmk2RTA5UEh2QzM0WDYxbTQ4UnFQNzhlc0sxMVVqSVJtM09pN0dz?=
 =?utf-8?B?bE9VVmQxcVNPaDZqNlc4b0RXc25qUTU4S05qbXY0NzBqNUtudHFxOU5DbWs4?=
 =?utf-8?B?M1FsTzBVYjlZYjMvTEd6ZzdlNGR3d2lKeEZTRzJkbFVaWDl1WmtvVnpEbnM3?=
 =?utf-8?B?a2FUZ21vVmRKMmJRVVkxM1JJSmVKU0RLODNSSHpZbE5RT01Fek1jQkc5eGNq?=
 =?utf-8?B?RmpxSzl0ZWNhSGhTdG4xS0pibmpkbGVjSzZRWStwNlNmR3oySHMvUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8406ce04-c049-42c2-27be-08ded03cd7b0
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5356.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 09:01:26.9974
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MUmDGi3uq243+ZsRFcysFe4rGKM/6oQC8wRvg9ORnxlXbHUr4qfmiQMRyoqy3oAZzy2SSuHdLBVOMDSDLW6a/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPFB8FBD73EA


On 6/19/26 18:38, Julian Braha wrote:
> [You don't often get email from julianbraha@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> Hi Syed,
>
> On 6/19/26 13:43, Syed Saba Kareem wrote:
>
>>   config SND_SOC_ACPI_AMD_SDCA_QUIRKS
>> -     tristate
>> -     depends on ACPI
>> +     bool "AMD ACPI SDCA quirks"
>> +     depends on SND_SOC_ACPI_AMD_MATCH
>>        depends on SND_SOC_SDCA
>> +        depends on SND_SOC_ACPI_AMD_MATCH = m || SND_SOC_SDCA = y
>> +     default y
>> +     help
>> +       Enable SDCA quirk support for AMD ACPI match tables.
>> +       This is compiled into the snd-soc-acpi-amd-match module.
> This Kconfig file uses tabs instead of spaces. Most of your Kconfig
> additions are formatted correctly, but one line uses spaces.
>
> - Julian Braha
Will share a updated V2 version patch.
