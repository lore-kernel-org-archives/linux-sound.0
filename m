Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013018.outbound.protection.outlook.com [40.93.196.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC0C29E11A
	for <linux-sound@vger.kernel.org>; Mon, 12 Oct 2026 04:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791780199; cv=fail; b=ZKOOn5SXgyzSjv2HcufvgSenFz+yQHo2pR8iYJRz0lL/9TknCziklbxQ5YGZIZLAJ3RzqrgEP+S0QDv50HLFT0+TzHJep6aBLcHI3H5fwCNA+WZKTzqeK3RMJ2mw8yRoVLoDmY/rSIML1ZJDSoQskjjpFaUKQAcdCo2FwREZR58=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791780199; c=relaxed/simple;
	bh=yUxCZK7GGaDgOwpbohknWXkxIYSMSagxftFgOBpxPPU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JNfHRrOW24WrN+RA5KOiKMZAqYW6HctYuVG3xO+cM43RWODcLV+67iLYG4LngXW10rW3+rMnMGdsmGJfxl6j7vUxowXYkUY5StoLAzgbCiJCB/nao9EOae+v0mwSpXLhkZX31TlLXkZkTaOTstLiZlPbxN5M7WLV0s3p9qPWGjo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=l6PmDh6Z; arc=fail smtp.client-ip=40.93.196.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="l6PmDh6Z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HypSw3HKXFACja+cULCbhQYhxdmlqAYRbWc6EU871tl7Z4kDTo9oAf6AmxAUInRgyAv9FkZuP8mhFd+GV2rg5D3XOKuK3PSlVF/O+NRkdkkdpuhM16yQY8LYe+CiN6rAYTie/1OH27NW8KBOeEwLbxioIZDMRcx1goP8NPqZBTGsCDfILvrS600fF3T2YcoNr9k77jpnQ2WTcvoKMesqZX0h3ZowhDlPvNA4jdaKZMZxIR9BQ/tw8nKmiOW6PM6rOsHp9fQWWgq85mV2v4cG7C61cMcNUXMcEBUGFUwQ689Odwmj1g7SpNyPSCihsncxcEXi5tJI/BuhgaG2c9ACnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yUxCZK7GGaDgOwpbohknWXkxIYSMSagxftFgOBpxPPU=;
 b=Rm33LjeAo6NrPuUZHCTsYalIJ1+Go61+6nVKrSZ+yusicbvfCos8TfycK/FwRQVGiR45HjHuuagsMJQFQoL+e7VUGjQ76iuw7XLnbhH4V+pMI0s3xFDtzBr9KOjpfQu2CwboFip/J0fMIY4Q+i/VONx8Y4TkZyzUcmqxiHHM3VDasP4whSuMBPeS4YsISXoDoZAAmoC2iAK0TkEaZJl3gXAE1hhXcJANlN7tNPyRVymuplHm04vbAFX4xleBsfXQ1mDhM1I+ASIB1CXDIP5o4IImChtbgXMc+C10D20UBx1z88UHh31dzKP5xrmO8THE2zesQ8NCNjW72CwHy/WK0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yUxCZK7GGaDgOwpbohknWXkxIYSMSagxftFgOBpxPPU=;
 b=l6PmDh6ZqGsKyv3t/a/SQfkXRPgqPbMf05jw06AZvaL3mYOYlmqbIGK/B8KiQzDFOFEFgp8M/PdPExQJIGjgwELbezZQTWJhKiKMdSn3dHsDr2rL9JL7859Gwr6a0R8EI7+8iK6Y9j6UkacfVqKzHHza2ScGQwlE9FNPSWwpWBQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS2PR12MB9567.namprd12.prod.outlook.com (2603:10b6:8:27c::8) by
 MN2PR12MB4206.namprd12.prod.outlook.com (2603:10b6:208:1d5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 04:43:14 +0000
Received: from DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5]) by DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5%4]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 04:43:14 +0000
Message-ID: <617a5b30-45a3-4cbd-92da-aee94e36aa76@amd.com>
Date: Mon, 12 Oct 2026 10:12:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: ASoC: amd: yc: AMD-Vi IO_PAGE_FAULT at address 0xfffffffffffffffc
 on every DMIC capture start (Lenovo Yoga 7 14ARB7, 82QF)
To: =?UTF-8?Q?Marek_Bor=C5=AFvka?= <boruvka.marek@gmail.com>,
 linux-sound@vger.kernel.org
Cc: venkataprasad.potturu@amd.com, broonie@kernel.org,
 Mario Limonciello <Mario.Limonciello@amd.com>,
 Syed Saba Kareem <syed.sabakareem@amd.com>,
 "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>
References: <CANQNuJuMA6pA1CHR1dtaC4sZJY-uw4CYQgYX23KDitA3biH+0g@mail.gmail.com>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <CANQNuJuMA6pA1CHR1dtaC4sZJY-uw4CYQgYX23KDitA3biH+0g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0060.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::14) To DS2PR12MB9567.namprd12.prod.outlook.com
 (2603:10b6:8:27c::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9567:EE_|MN2PR12MB4206:EE_
X-MS-Office365-Filtering-Correlation-Id: d79bb211-2bd0-4c40-17a2-08df281b535b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|56012099006|11063799006|261009223027099003|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	i/w59CHqsGVtP05/LjK0dM0fT3i7/E6Wxa4yzral2vRB3Q3s89DHmCCy8bKMnDHW8p5yMASvQYURs2Q9esCK1x3YRbGPpMH+JUqlud9LR/HtUalreQUptREFUc9dXOgaBequGGLDfcIWga7lixoetEfeaz99kxjCDBfyZ4xn6HonM8kuCjKEP7/m6KikJGm0fP8UZp4kLicZLwGfjt3zcP7UM9jsEl5pwL7Rbdt8L2oUcdgqtmuE0tZEso/j7WNi/XXTjtnowCAyGsy2cyv9sWt8ODd03g5X0Ybxjyhm/IvE6TibFqL9DF4fLv7SKxDQmwIN08dDvu4W5CNPKLBQEFQUy6yZjV3FAnAe9/6jWYHUZ5/3pxxqvNFfD765FYsn/9TvaWYYW2IOlpKjTq6Z/Fr14pdx+M/xO90rs2MDpy9yilLExhOgQWmYofYp27OMRMALRz0zKTyPRzEEVcrdzdDejSYEl9jch8ixwz1/zWCt/eTtpZ/psVWzyvxleL+UVm+wns3DdAKVy6cXjaefDltasVkKaNrR6HW1kct40sv1mjQzzKPYoqHveD6Fr2UIaPx2WA+w5RBI9KRMXUQ4ebsMmXnko551hnAA+J/QUnA+e5r8bqcYEt5hPVgBbozV/IMl/NN+1fJqW5Gw/DyD9OY5ZxQAO18u8k7PP3Nx6nU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9567.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YzZSY3pFLy9qbXJxMEU4aUN6UmNKQVlRTE5JVEtjdWw4Mk9TaStTOWdEeVNI?=
 =?utf-8?B?U2FNdVVVa0U5SFZPYkpiNHJCbDFGcFBaaDhHRmsyTGFMQjh2YnY5UWFsZ1Nt?=
 =?utf-8?B?eUx3YTJEVjV5QXQ2TE9kZVpDS1VXelBHTXduUUYwZWpHTmhWZHd2MnpGUHBH?=
 =?utf-8?B?UkExRG1rYkZDT2t1blVtcjcxcnZXVkVONUtGRzk2UTZjaG5qaWhHMlZuOEgx?=
 =?utf-8?B?MDdkQ25qMXozRFVsenllR0s3SGVONitzdld1SGY0aXdBQmhmOXBWemhKME1o?=
 =?utf-8?B?KzU2L044TUNLLzFsNkpveTd1bHFUbHFFdkR6RkpTQVNGOEVlak1BWmxvRzJZ?=
 =?utf-8?B?UFdENm5XRFlwbENyLzI2eUg1S05NaVZjVkw5ODYrZU1CUWhlNnVZUEl1SUk4?=
 =?utf-8?B?MlZCRm9FWGVKMWV2bHEyWlRBYWpwWEgvNm9RN0VMSmdLQmdLWGNaQ1hESG1t?=
 =?utf-8?B?RW1oQ01ZaHMwZkZyRjUwVmpINXVpbkdYUzZzZk90WXk3NVVEMVZJWWZ0dW5C?=
 =?utf-8?B?bjlmQTMyYWMzWk9LVzRkNWhmNVR4cmpTMi96c2VhSzJwRGEzREdFUENDdVRQ?=
 =?utf-8?B?ZE95Z3ZaQnpxUFdwcDk3YUN3RDV1OHkrTnNGRlpka0dyYXJrUkFnUThQMWJG?=
 =?utf-8?B?QXM3V1YvSllnZmFPc0pHM3EzWnVLeGxTdHIrczk1UEpEdFVjQXhmVTBiSWlE?=
 =?utf-8?B?ZkJmbHhpYXpMWFFNSzRqOEJvM2FucnhsdXZMTGw2cHZpOHcwemdLZ2FwNm9m?=
 =?utf-8?B?d0tZMjVMbHNvczdnN2R4cExYMGcwNlJFcjZkWE5FTjFSa2pvYm41eDZ2YXNh?=
 =?utf-8?B?cHNZSWUxdWlCbGVwdUhuV2RXWk85MWxldVNaRHkrY3B1Ujc1LzhXbnJYSXF0?=
 =?utf-8?B?MXczRTV3RXMrL2tCd1JEQlhFY0p5N0ovTDVLTmFIM0xvbWdjWlo3NWdLYWdL?=
 =?utf-8?B?U1lPakdUV25FbzJ1WnIwaW9sMU14R1BUbnZFV3pNajhyQldiSTR6V1ZmK3Y4?=
 =?utf-8?B?bkxHUis1TytSV1RFS3RIdHBSQVYxMCtLVzd1bkowQVJiOFRSTFYzcDh2L1Nq?=
 =?utf-8?B?WGE1YTFrMjk5OFpkbDZQMTA3dXlQdjk0QmFCTVM0VUhFYjJMK0Z3WUVGTTQv?=
 =?utf-8?B?NHp1YzVydEZiNEl6TFZyM2ozS2RHY2NtZm5PMjlaUC9qVUZJS1VLTGZDSmNN?=
 =?utf-8?B?UUNGTml2RjdZdTZpQmp5OGlvV2I5SWhhdGV5cjdsLzY3R1ZYOGdnTnFKMklZ?=
 =?utf-8?B?UmxnQ1NyWUpzQzJzWDJaVmUydlVMbGtOR3AxaDFySU5xak41Z21LQWJOR2RF?=
 =?utf-8?B?NFlJaXVEYW1DSTFUYjNBSWtnUHptTDQ5L2g4TUVBU3RLV2JzQkg3WTNFdDRo?=
 =?utf-8?B?OWVYOFlsSlVKYmNQck5IL1ZkUDAwMzNFK0N3a1UwcGJFaXJvOW5pQ0lWZnQ2?=
 =?utf-8?B?Mkg5UnlUaUd2QllLRGhCMUIxN2JPQVdzZTQvbGUyQVFod3p2MW5tSnZ6cDk1?=
 =?utf-8?B?eVFRYkgyakZyaVBqSm1MdDJRV25qSXc0Um1CNGg1RnV0NUIyZGp5S0NUYkZ4?=
 =?utf-8?B?aTBCeUptSWE2a2EwNDdBRWNHYzNSb3lCMWRoU1RXM3BnQUNyT2plSlVSMEgy?=
 =?utf-8?B?bWFMajlHZklkMGdNMnFTc245ZGpQOVk5QUlmeW5yU0tnMTZNaTNHY2xqUC92?=
 =?utf-8?B?RFNwUjQ4b3UrUkFFd25xNkVuRDlzTzB5VElLa0dRblVnSktVS1N4UkdQMlE1?=
 =?utf-8?B?ck13SzNic0lXazIxZDBsM0lpWmpmSXJNWWJrN090cUpFV2k5dkZiZnVrRHdT?=
 =?utf-8?B?aHdjMG5yWXFhZ1JOQWEwaWNpVElZV2ZjNXFvTGwxK2Y5MTY5L3l6L3ZGRjRC?=
 =?utf-8?B?TmMrSis5RTFtWkRHMTgxZGQzdkVtc2l5RTdJaFVzRTQyN3piMHpHaUtOaXkv?=
 =?utf-8?B?NVRHS3BFRk55U0JNQzNqaWNvMnU5M0NRUFhiRkQ5VGhRczIveStIdXEwODhJ?=
 =?utf-8?B?dDJZL1ZKaktjdE5ldVIwc2t6UU8xYzByV1dpaFVLeXpLd1hzQUxOVUVBQldF?=
 =?utf-8?B?c1JvK1dFKzM2TU51Q3FJVS9xR1ZCZGJDVktTQW9Lejhkb3h0MytYanFuNm81?=
 =?utf-8?B?d2pVWk8vV092WGVKdklCSDIrazBBZ3hzdUlUdWgxQ2NIcksrY3BlMXMwTTEv?=
 =?utf-8?B?VEI0aHUxRjZzeWNPNDZ2MU5Ec1dHZG5hMWRtL3pFT0tidWZsN09NVXhMeWtT?=
 =?utf-8?B?ZXRPZ2d5T3BEMjBTd2d5cnBmWE1kcUxOZ0QxODhEcmFRVUpkYWJKejRLL3Q2?=
 =?utf-8?B?ZEJoMWpzU0RrVnpONjRUS0MrUlhkREhESFRManBweUcwOFdZeUwvdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d79bb211-2bd0-4c40-17a2-08df281b535b
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9567.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 04:43:14.0960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iBgrO+WhMgzf+prsh846oGdNG5BKfm3Uuah75SQN/m7x1Ny7MbqvXHll4icuosBDgDhzVuD7boAbKW/EWC5pHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4206



On 10/12/26 01:14, Marek Borůvka wrote:
> [You don't often get email from boruvka.marek@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> Hello,
>
> on a Lenovo Yoga 7 14ARB7 (82QF, Ryzen 5 6600U, Rembrandt/Yellow Carp ACP
> rev 60, PCI 1022:15e2) the AMD IOMMU logs exactly one IO_PAGE_FAULT for the
> ACP device each time a capture stream on the digital microphone (acp6x
> card) is opened. The microphone itself records valid audio through
> PipeWire, so this appears to be an incorrect DMA access at capture start
> rather than a loss of function.
>
> Hardware / software
> -------------------
> Machine: LENOVO 82QF, version "Yoga 7 14ARB7"
> BIOS: K5CN48WW, 12/06/2024
> CPU: AMD Ryzen 5 6600U with Radeon Graphics
> Device: 33:00.5 Multimedia controller [0480]: AMD Audio Coprocessor
> [1022:15e2] (rev 60), subsystem Lenovo 17aa:3859, driver in use:
> snd_pci_acp6x, IOMMU group 20
> Kernel: 7.2.9-200.fc44.x86_64 (Fedora 44), not tainted. The same fault
> also appeared on Fedora 43 kernels 7.0.13-100.fc43 and 7.2.9-100.fc43,
> so it is not a recent regression.
> Modules: snd_pci_acp6x, snd_acp6x_pdm_dma, snd_soc_acp6x_mach,
> snd_soc_dmic
> Boot log: "acp_yc_mach acp_yc_mach.0: Enabling ACP DMIC support via DMI"
> ALSA: card 2 [acp6x], device 0: DMIC capture dmic-hifi-0
> User space: PipeWire 1.6.9, WirePlumber 0.5.18, alsa-lib/alsa-ucm
> 1.2.16.1. The default PipeWire "Digital Microphone" source is mapped by
> UCM to api.alsa.path = "hw:acp6x".
>
> What happens
> ------------
> Each capture start produces one line:
>
> snd_pci_acp6x 0000:33:00.5: AMD-Vi: Event logged [IO_PAGE_FAULT
> domain=0x0016 address=0xfffffffffffffffc flags=0x0030]
>
> The address is always the same, 0xfffffffffffffffc (i.e. -4), which looks
> like an uninitialised or underflowed DMA pointer rather than a buffer
> address. No fault is logged at boot or while no capture stream is opened.
>
> Reproduction (reliable, one fault per run)
> ------------------------------------------
> Fault counter: journalctl -k -g IO_PAGE_FAULT -o cat | wc -l
>
> 1. arecord -D hw:2,0 -f S32_LE -r 48000 -c 2 -d 1 /dev/null
> Result: +1 fault, and arecord ends with "arecord: pcm_read:2285: read
> error: Input/output error" (EIO). I only used these parameters as a quick
> probe; I did not verify which hw_params the DMIC PCM actually supports,
> so the EIO may be caused by my choice of format/channels.
>
> 2. arecord -f S16_LE -r 48000 -c 2 -d 1 /dev/null (default = PipeWire)
> Result: +1 fault, recording succeeds, signal level is normal (RMS 0.0276,
> peak 0.376 over 2 s with the mic in a quiet room).
>
> 3. Opening the stream from a desktop application (e.g. GNOME Settings
> sound panel input meter, voice dictation) produces the fault in the same
> second.
>
> 4. arecord -L (enumeration only, no capture): no fault.
>
> 5. Recording from the analog ALC287 device (hw:1,0): no fault.
>
> The test was repeated with other audio software stopped (JamesDSP, a
> PipeWire client that never opens /dev/snd itself), with the same result,
> so user-space effects/filters are not involved.
>
> Frequency over time (acp6x faults per boot, same laptop)
> --------------------------------------------------------
> 7.0.13-100.fc43: 4, 4, 22, 4, 2, 0, 0 (Jul-Sep 2026)
> 7.2.6-100.fc43: 0 (4 boots)
> 7.2.9-100.fc43: 1, 0, 0
> 7.2.9-200.fc44: 0 (5 boots), then 23 on the boot where the microphone
> was used repeatedly
>
> The count follows how often the microphone is used; it is not tied to a
> specific kernel version.
>
> Not done / unknown
> ------------------
> - I did not bisect and did not read the driver code, so the cause (e.g.
> DMA address programmed before the buffer is set up, or a stale value on
> stop) is only a guess from the constant -4 address.
> - I did not test with amd_iommu=off / iommu=pt (that would only change
> whether the fault is reported, not why the access happens).
> - I did not check whether captured audio is damaged at the very start of
> a stream.
>
> I can test patches and provide more logs (dmesg with dyndbg for
> sound/soc/amd/yc/, lspci -vv, alsa-info) if useful.

Could you please open a Kernel Bugzilla ticket if the issue is not related
to a specific distribution?



>
> Thanks,
> Marek Borůvka

