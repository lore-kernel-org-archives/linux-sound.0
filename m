Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010046.outbound.protection.outlook.com [52.101.193.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4902A35028D
	for <linux-sound@vger.kernel.org>; Mon, 12 Oct 2026 04:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791780568; cv=fail; b=Rmkb/oWsmEtAj6zAfLwGe2eU+TJV3Mh9m3bSKPMgnon+/kMTm/NmQ/g0FyOzx4ePZyIbgMJ7RVDymUGYrFUarV063f69I0ChBY36cMMDi702q3+tdWlCO0eYXt6xnnrW/A7dDIpreQpKbfMTkLkwkkkWPKleUu0M1okxt0JL4gg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791780568; c=relaxed/simple;
	bh=PnyG6W7PUsJfNnbMC8FwR0NbSEHl19mZU2kW6C2VfAQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=epINA/Kj02nCBkgs0B3ix12Nq5MtUMaIxxr6J9j7PX3eEO12wpS2Vvs292JKfhE7GzC5p6i5cV+rWGB2doQMGFU9pHmXx1P9uJPICs7mzKkzkRDFWdYmAXwukT6UbbAedEDJtFaOA7JQa8x1PM2qipyRmlfGM2oEv/OMnLyMdlc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=RJdZwO9z; arc=fail smtp.client-ip=52.101.193.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="RJdZwO9z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YcYsfJ1WpAc7+0mgmk1ICrZDvTGcPl3/CQMC3SIMDqQeApb05vk2kMY3vJcR4eT7IGbj7Ps2sZ5gTX59D0Q8JN4kUVnRAfxbS+rFI4yDTXkoj838CzDYNSmFkpG2uxpWaiz+US7ZIpxRB4xRX68RTCYCbq7+6a9ScUyXL9fvk05hbm3FD9xwLfLW4TmXyeM4IZb6HPzeghKzm71Mv3PsMlD8DIV1UCUvtOoiTvThuup6QvENVhuvfbptOMOQuvVHhF7cTKO9M9fCHPVPWF5erDoHj35cRVqaoScmpJUMYuMEOosu8H9smJyAFBq+OcI3Z56FXxnB0TbzHlg2VG2LBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CXIWdDKp+fcGyeO4d2J471sroQwmYKG0ZHa4ompbsmg=;
 b=mNaIjEQu7l8qy87u/o0cPAOXVAnG8Aid8QWw3RxQfhq7o4BMRJTyuAaHxr8/SAhwpa2WUYtbrexFiOEQpBETdoIcR6kuYfCO/Jmc4V/K1iqk2xqrTI7/6e598QjaO7o5gT/8rp3+z92cX86UffEAcZg5crh97DOH76hhqVRJCH+z/hmWwWBoCcVgzRuI5SS2AIgMCzSKaai2dSlQMmwhIIyqu6+aVEPDo1QWi8bsTgIvMLpC0ggll62UXtmmbLsQaCcJj0m1e3DghCp6QGWhAvrnpweT7hn+WMxgIKFhRSPu6b5aE00/Uo/aGA3kwlxe+VCe/azl5lOJVYvSEPlsYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CXIWdDKp+fcGyeO4d2J471sroQwmYKG0ZHa4ompbsmg=;
 b=RJdZwO9z62DmGIzdW2FF2bZIOfjiyWyw4Yuvxx/97GLdj6Wo5t2KlrVWSxWigOQoANCmHtvvAZaRAiWXtAvFvnhJsfWH75qaPnLPGF8acvzTikVBce9KLnu5hgnX7g+nU30/q96Dcv0yOz0fNjgidwqDp0H/9aBZDG/HRWuhrvM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS2PR12MB9567.namprd12.prod.outlook.com (2603:10b6:8:27c::8) by
 SA1PR12MB8117.namprd12.prod.outlook.com (2603:10b6:806:334::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Mon, 12 Oct
 2026 04:49:24 +0000
Received: from DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5]) by DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5%4]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 04:49:24 +0000
Message-ID: <3eae2a23-81f3-4776-ae03-a32c80ad450c@amd.com>
Date: Mon, 12 Oct 2026 10:18:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: ASoC: amd: yc: AMD-Vi IO_PAGE_FAULT at address 0xfffffffffffffffc
 on every DMIC capture start (Lenovo Yoga 7 14ARB7, 82QF)
To: =?UTF-8?Q?Marek_Bor=C5=AFvka?= <boruvka.marek@gmail.com>,
 linux-sound@vger.kernel.org
Cc: venkataprasad.potturu@amd.com, broonie@kernel.org,
 Syed Saba Kareem <syed.sabakareem@amd.com>,
 "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>,
 Mario Limonciello <Mario.Limonciello@amd.com>
References: <CANQNuJuMA6pA1CHR1dtaC4sZJY-uw4CYQgYX23KDitA3biH+0g@mail.gmail.com>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <CANQNuJuMA6pA1CHR1dtaC4sZJY-uw4CYQgYX23KDitA3biH+0g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0055.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::10) To DS2PR12MB9567.namprd12.prod.outlook.com
 (2603:10b6:8:27c::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9567:EE_|SA1PR12MB8117:EE_
X-MS-Office365-Filtering-Correlation-Id: d012424f-443b-4370-a975-08df281c2ff3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|3023799007|6133799003|22082099003|18002099003|11063799006|56012099006|10067099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	wrFVD0scUpywm5/g7+UCzko8NGWZBTYpMDNeZM/FcFdIbBZmliDuJ1krxao/LYHNO9ZONxX971uRLdDo5J4usfWd4uqp8V/Pu8lL/mzL6PGbEgvrZkMQxWyW9mFcx5WNPivcketdb2IoiYkv4qch4KeGNqcLFWG4rmIsrvlc8jtN7KXm9UbBwmTrgAMKm8guJ+1T19u8+GdrsbbcEPPXhYVq6zsVBrvRIDeJ0E4dGCNxqtjTnKeDTojAGANyghFDrDugj/UAoZhzjM36OMqTVG6qwMwx5qYSjnxOnYOC9eBoFZTna+t16etV6TfGkShx2490YwOUWjtxbEAW5p4CA4xl/2fKcry/NlYDQGnwtUpdYsfZUqkqtPuWfNkAwwli4zqiF6pZQoKRu0gV2sA7pvPkak1cN9SV1jHJCDLeLAzWSGW0OlARcdr59EPn50wd8F3TpbP/qc4h3YoyNLo8wyOP6Lt3QhQM23QkSnfuxf/DBw6bbg9DbQylFOhNhBUWZQhGVcGFU1YHzGBouYn2k5o0qZkwdIyr2QQYsRzpdt9yzvcYvm9DTZbBMT/YlGQ8GJFPwOkZD6PRXUV+PrFgLLV9cHt7nOWsW5JnkmDJbyZ60IWDVVNz/5AHsWgb00pxy2XmYx/b1sbe4NtwZKEPiLp58dOG1QtZaxo589oo/4A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9567.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(3023799007)(6133799003)(22082099003)(18002099003)(11063799006)(56012099006)(10067099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b2xESWZVNWhucXl6NWtZZi9HRFhhVTRvdFppY3UwaVRrWDFzUG93UHp1V2cz?=
 =?utf-8?B?eUZCdnZMQ3ZVM3pvWjVSQ242VmtPMW9NdmpSNWFDZWdqUzZzOERNM0oxc0RB?=
 =?utf-8?B?YVkxZXZwanVJaWM5clc2N1gydnFzTTZGWG1uUmhtNW92dHBuLzJOek9CNS9k?=
 =?utf-8?B?T2VvN0V6bjQ4T1U4YmZFWkZsQ2tsbytGTTU2MVlaOGhxSG1PbDhPSGthdUxm?=
 =?utf-8?B?ZTZLajZxaXNyd20wZCtlYnl5SktBRFJCa2MxY0txRXhMTm5Jand4K2g0c3pY?=
 =?utf-8?B?M3g0Y3RFbnMvSkZCTWlqZGY4VE12NEtBajhuV2xTWkpsLzM0WHl0cDFMaURt?=
 =?utf-8?B?YS95TnFyQUVpdlhiM0toSWNNYU5FS2svSmlpQUZGMnI0OTBsd2RMdldvcEN1?=
 =?utf-8?B?RXp0SElQb3grUjlxNVdzcHppd1NXb00xaUV3K1VIZ2pLN0gzR0MrMFRQUXhR?=
 =?utf-8?B?aHZ3SnlacVVFSERjbTFNN3pNeHB6MjNLQy8wa0VtcTQ2L05mSUVZZ3lKemJw?=
 =?utf-8?B?ZG1kV2hGZnNXZFpPUnFXZEtSVUdsakVYbnJBMDR4RDRFWTU2RkM3TVZEWUg0?=
 =?utf-8?B?TzhJTjBLSWl3TXJmSk5yQ2t1eS9xRDI3Ni84bEw1T0t2OFNSbWpWYTlUTys3?=
 =?utf-8?B?enlSZGhURUdXaFVaKzFGQXhjSTZvbndYMWFLOXU2VlNuY2tZUFVoRWhmY29U?=
 =?utf-8?B?RUVxZUVkYnVQVWg4WE0raXRRZ014UlZ1elc3ZHc3dWRkeGZDL0FTUVRkMW8y?=
 =?utf-8?B?NFJMaUlTMXhrVi80ZGovRWRGWjdDK013QWs4alQ0ek13SUVvUk1DMEMrMWYz?=
 =?utf-8?B?c0xKcTVTOGJRdDczZ2Q1TjZzYlBKNnMrckYxUVBhQnRqWlFTWFE4THVCUC9H?=
 =?utf-8?B?ZkVNSDNrZUorMnBZa1VZeFJpSUkydzJLTWM4SThRYXE1YUQyTXptTWdZdjNt?=
 =?utf-8?B?SUh2M05ha0JGOVdhZE1lUUJQUDZ2dVlVS2ZKc2dPWC9EVldWZmlDdzVpQTdn?=
 =?utf-8?B?a1BVRmZyd0M5Uk5ybks0VDVvd0FpK2NxaHFoVWRNOHRlQ21penYzSEV2RXl5?=
 =?utf-8?B?cFQ0c0JWdzluS1JrT25iQno5Q2haOFhBby9hbDArRUsxVmZaTTRkcmpPcUx5?=
 =?utf-8?B?T21xVUxHdG84NGgzMVBhVkgwdDI4V2F1YWx4VnB5bmk3Q0FRS3JHMlJtR3hT?=
 =?utf-8?B?cHZ4SkZuUC96QmhYRVgrS1ovTUxXMUo4SlRIR0JqcDdUVjFCV29hazVxV2dr?=
 =?utf-8?B?d1Bmb3V0RjhPbHFTT2tzUFIyV295dW5yblNycjVDZVI3d1AxNGJRYk0wblZO?=
 =?utf-8?B?a3VENVNrRDZQY2lublJhcXlyWE10RERkaFZ0K3ZWbnFGZ2dpTGdCbVp6R2R3?=
 =?utf-8?B?ZlBaSFdQWVBDUlQyakVrUnZxbWlsYWpnalZHWkZBVS9wN1B5NHJnSnJNWE9R?=
 =?utf-8?B?T1N1bjMzRGFjUmdKNzQ5UWhsUHNFZlBjSDM0dlhEa1RSUEFaKzdqU0lwenFE?=
 =?utf-8?B?TlZUOEpXUnFvR2xiZ3dBQ2YrRzJFT0doL2JwZUZnSWJIS1VYQ08rMHczRElP?=
 =?utf-8?B?bGNLUHlEV2lQOEhhaWtjWlRkb284OEN6OVVLYnFXTHVkYTdjRk9DWTJVS1hU?=
 =?utf-8?B?S28wWm5jWWx4eGtKSWt2MmFpVFF6R1puZ05EZDEwUk15cENCcjZKZUVRWnFB?=
 =?utf-8?B?U0lDZHdDZFdTR1lxS00xQXhUdm9aemFzTFFNbDhvamlmZmYrU3crdGMxVVd3?=
 =?utf-8?B?L2w0YTFYYnI0eEdIUjhuUVkwenlrM1pkWHRzVFNZb1FJY0RhZUkweHNkbVpq?=
 =?utf-8?B?WTRlSUxQaWY5UVQrdmw4VmpRRWp4UmxmdWhROFpUTC9VZ0JIdU5PTXh2RWtJ?=
 =?utf-8?B?bWFaeVh1VGFNZUY2WHFlekFrMHU3dlM4akZCRnRQcldqM1ZyQjBHVndvQUZH?=
 =?utf-8?B?VDE1ZHBOeVRENmFjemRnVU1lMjhYU1pKWktlemFBRGppS3NHaHlwc3dudlM5?=
 =?utf-8?B?QndEMlRzcXFRTXBEcTE2MkZ5ZEFSbnhGSGl4UVUwaHh0MmEzMEdvUlRUUGov?=
 =?utf-8?B?QzREeXZZZWk5RHhydDlHcjFPNzFyakw2VUg3Uk5xV3NmeTFrOUdQOG9WRmg1?=
 =?utf-8?B?R0RDT08yYjVaamFuMG11cUhIeUNWbE1QM3RTUmtCRUEraExiMzZsSnFpTlY1?=
 =?utf-8?B?aHI1VlFuVjVlUzhzRGRqVENYNjdFa2RKSGVRN25sTXZCbTBGR2t4bWlRbFFJ?=
 =?utf-8?B?dElmSmFqUTRucEtiZDBzSkZlcTJibmFIVmdJY2Z2OFI2bndrK1ZFejd0SW5x?=
 =?utf-8?B?TFhaNEdaTDRFalVIUVlIWTBqN1MyT1YzNHVwRysxRUsyTXA4NTRIZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d012424f-443b-4370-a975-08df281c2ff3
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9567.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 04:49:23.9725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fKGKBslHx3VJ3T9U3zkQ0CxCgZd1sK/6zdTdAwgEgfWGcTWwnrRA1I55cr7ayo9/VUs+lGgHjKQCo2FTbI4QaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8117



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

Could you please open a Kernel Bugzilla ticket ?
Attach alsa info, DMI decode info, lspci -vvv output, dmesg logs and 
ACPI DUMP.




>
> Thanks,
> Marek Borůvka

