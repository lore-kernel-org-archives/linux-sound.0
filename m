Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012009.outbound.protection.outlook.com [40.107.209.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B91764;
	Mon, 10 Aug 2026 05:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786338714; cv=fail; b=VXD0yp7NswX2vBEEQhWzkpfSCCk+t71pwIW7rA2QqX1zfjiVQciPv1D7LS+kzZ++yH/wDAN+gd9Rj2nmTgeHw0xfpgmU4JXC3bpc23FTIuzSSjCW2BHRuluxuBBDOhab0GDFFUY430rgjEs3d4T2WgqR8icuwOq5JhEjUnN+BrQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786338714; c=relaxed/simple;
	bh=39YNCSL/bEPKqyb4zwKqcN+8wT58wdxg1rUSJSHlNW0=;
	h=Content-Type:Message-ID:Date:Subject:To:Cc:References:From:
	 In-Reply-To:MIME-Version; b=GGkMxlRvoyhpS5sAVeM5EGpHMsIhveEOZFskg6Fio+zT+XxhGO3J73utALRwk76Lkr1sFRHZ8tDnh+PiGeB/YEIlvDc4j/N3F67thO5OKmCrZehJ385JOJ88QfrqqF8a4fOEgvr3xG4b9+b5XAr2zlgUQV/LWb7JEFLWtjOF3RY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=1o4eOAwW; arc=fail smtp.client-ip=40.107.209.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="1o4eOAwW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wqG9/E+ichCSAtuOcSEnS1TXcKEpPdyZHiwTctFyX0kqGgZWH8JvZFEsB8is/dphtqg8/4v3/UTqDUpBoU0IUxrqIll+acN4rO8gfiTWUXAi7w3eaMmiYULDW9MQZjfSi+8knitoUjaDSKE1ANXHzRjNpYHCI+5wBI1PknTfuRaHE2sNg1YDcceU1yD+rdsDAyFLL29RozHq0Y86lmy0hj0LyZq6jadwZjovkOWU/apCy6O37D5cIj3EW863C0aILctc0/Q3zf8FWZlCHEhNDmgLfjgG2yb6R5+Tken14TNj+fqoDBbrW+Ulf/ctZB0/54muqERJWyedoymti7PROw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+0urW8xvy+CJyfp5oASfp3e5yEmajAdq9fbCjWR/x7o=;
 b=h1x7TpWhiFjuF07Ry09Id+XGULKkWSQBrs8wEHpQnmMH49BGen8yj/L584AhqSwYlEHHW7nacMFaaV4Gw0JMkWeR/o0lcCl2ImoxmJcpYJhA59vCCHMIKkMCq/VZT/usGln4YA6VV4ibaw90Zv1ktiKdfi5qp3ZN/5Oub2qOC5JsR86QcfMVy4lVXmLTxvOTDUkdpppSgBFANbcTVluaBltFaLvm7E+p0uri5Off3Una4lBEyfDzZYYpte7+hD9Ju841OBgslXJ4IjPy1/ITMfM01LzyoFdPKbDfKPq7BDX1PkaUwIqc9JmpmCfbG40da1Xb9NR91K0YFenxe+bL1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+0urW8xvy+CJyfp5oASfp3e5yEmajAdq9fbCjWR/x7o=;
 b=1o4eOAwW3m6OU+fxemeud1qIrhTyfj15sxy5qAOhrJF+Ram3Fq4lD9KHCz/GiViWiE8Kg7NtR6gq1AfxL9CXd29EE6RA4RLPk2fTxK8qkz8VEd3bdx6O9tg63Zmnd2anGii9iBqOMVPk4PtU5BRJxTDNr4ZPsfi4MZ1Q1bXfxLA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS2PR12MB9567.namprd12.prod.outlook.com (2603:10b6:8:27c::8) by
 SJ2PR12MB9191.namprd12.prod.outlook.com (2603:10b6:a03:55a::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.25; Mon, 10 Aug 2026 05:11:50 +0000
Received: from DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5]) by DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5%2]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 05:11:50 +0000
Content-Type: multipart/mixed; boundary="------------90EYmxS6MU93PjKpoGH774AG"
Message-ID: <9a5937cc-f4b2-42d7-8564-da81f6cf4e9e@amd.com>
Date: Mon, 10 Aug 2026 10:41:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: ASoC: amd: acp-pdm: full-scale burst on every DMIC capture start
To: Robin Everaars <robineveraars@pm.me>, linux-sound@vger.kernel.org
Cc: venkataprasad.potturu@amd.com, lgirdwood@gmail.com, broonie@kernel.org,
 linux-kernel@vger.kernel.org, Mario Limonciello <Mario.Limonciello@amd.com>,
 "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>
References: <20260805181130.75314-1-robineveraars@pm.me>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <20260805181130.75314-1-robineveraars@pm.me>
X-ClientProxiedBy: PN3PR01CA0049.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:98::12) To DS2PR12MB9567.namprd12.prod.outlook.com
 (2603:10b6:8:27c::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9567:EE_|SJ2PR12MB9191:EE_
X-MS-Office365-Filtering-Correlation-Id: 24d8218e-7f99-4357-b05e-08def69de1d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|6049299003|376014|23010399003|22082099003|18002099003|56012099006|11063799006|3023799007|4053099003|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info:
	zcFmnGu4SjG9W6sKxwgtfxaqj3SMdOqIchrkR/V6jmZX79r3gCwUgDVxXEj9f/NvJK8OhvGU7sp7ELwtdolTdXuXsCPcJ/1Szvh3n7jqfmboFStoaiwYDlqxPv7s8fhCVuR8vRsACWeH3c/lsUDU5CiNSsyNXb+VOGhM5r6oY7IZV3Ol78TR0FNPdgmagRSeXJ6Cj4XzlswV5dqRqW1gBYyBf5zuCmXjVLd3CXFexBC8qcHGEdJKDoUHPlZxxfanTqi2kZNGllh8T6MSb0JJW0dYXQ6cyRNcSZRg12k18VQaP9ozPVrXAFzQ2HdmHHZwhMBTVCnSuVYNRyyFIj2BkYS4GmLjnrKID109TQmysgD0B35JBu2EW7BJ4RrrVYTFr/Ad5wN67VIpycmYQ3sd/CwWEvZ03DdtLul7cc3YN6csmWHRldd9DN3Fu94dv3i27VCfdSRisLkdTttqtu31+DNNeoHiknCeLTjSnLGyjCQOOxMLMLRhzk/BVkiHZAb03qMP1i5PICk/m2FMRUwzTtGgyIAs2n2XQbB04t3w3v1CzPw1TFrimehsV5fILmtoMA7OD7m693pPSXwmZMisNdMnEjN5J5LM+cZ9RC9tTDxB8XLQSWhOr5IYYWd3WVDOYC9g7b+P1b0QY8Bm4u/zL71g9e/WqzcYqsGmJR5oAvs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9567.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(6049299003)(376014)(23010399003)(22082099003)(18002099003)(56012099006)(11063799006)(3023799007)(4053099003)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cE5wRjkvK09kQUdOWWxzcHJpSVM2SGkvZVRXVEZsS2hoRGNNcFdTamZ3NWlK?=
 =?utf-8?B?cVR0eEgrK3laNDZqRmswbG0wQWNtSGRyM3FJWVFVYkx5RWI2M0hoSHRnbXkw?=
 =?utf-8?B?TUtKMm5xbngxbk9tWlNWUDdnQnoybnczY21QbTNvaWtjQ1lia1VZa1RBN0hi?=
 =?utf-8?B?c3VNM3R6N2R4VDZmU1ZMNFhzcGNHa0hKVFRDaFN0TlhHNnFsRWREd1hFQ2ZW?=
 =?utf-8?B?RitlS1dFYStUcEx0dmtFcmhXMUlXV085NEUyK0k2WlMyeExKWC9uM0svREpB?=
 =?utf-8?B?Sm9HS1Q0SFJxSExxY25Ud1N6SjZKbC95VEU2NXJFc0pmejlzSDVoMmZJUlVK?=
 =?utf-8?B?bnRTa1BNQlJ0YVZQZFZBZmF1SjdOVXZOdThiRno5NWcrejU3RmdkTTloQWU5?=
 =?utf-8?B?WmhEYkdsUG9OcTNFYzFwY2pUZGVXaW0wY1lhanBiSTJKQjZQUi9DaG42aW5v?=
 =?utf-8?B?Wm1pL1k2c1V3VHFPNUJZcGVnY0c2OVlzdFZaS0ZkM3NURTFzVmwrOGMwUVVM?=
 =?utf-8?B?eUgvaFQ0M2lSd0NwTktvL2RQdnhnZVYrZ0I5VlNqZ2VyRnFFNkhlYmVEUVly?=
 =?utf-8?B?RnNlOGdiVktoK3dTcDY4RzhmWGJ3dEM5b21MNHVYSWF1MEFLYkRWNFZWYWlR?=
 =?utf-8?B?K3F2VFNGTk9pTVhNdWgyV2RvVkljTmZwV2NnR0c3OXk1cUNXU3M3OXdKa0dN?=
 =?utf-8?B?eGFyOHg3QUY4L2ZKS25zMG1relFISjJpQWJFSTRWYU5sVzB3b1BObS8vZFRn?=
 =?utf-8?B?ZkkwdE9IQ2FCSWdZZk9PZHY0NGlQUDFhSU96ZlViTVE4WmdBdWEralJIT29m?=
 =?utf-8?B?RVlZOHVLMVhTdU44dkRPTkIxMTdzWVZaaXQ4M2FBSHM3ZGEvV1lOVEk1dE9R?=
 =?utf-8?B?Mm5IWDZSa2daNndSQXBNWmptZGRMdE05VFk2VE8yelAvbDA1WURtcmp3Lytr?=
 =?utf-8?B?NGtic1puWWZOa29DUG0rRk44VU1XcmVVbFFyTHlIQUpsUHdmNHdaRmtTSXNF?=
 =?utf-8?B?UDVzMVNicVNWODdscVptT0hJTWd3QzlSMXNhODl1cmpWTHRWbUY0dEFEeXRx?=
 =?utf-8?B?c3BpbjZYWHJmVjF5WEVjV3NSQktBUHpwZlFDQ01rMTFPaEp0V29zbFVVaHBE?=
 =?utf-8?B?SWR6dFJzWDd3WjZkVnZiVjVZVVJRb05TVTYreWpJTG1Qcm1IdHc1ZVNsVjA0?=
 =?utf-8?B?WENBeVdzUU9ESnNlK2JBbjVZRDRzLzVsU0RxNUtZVmZLZHE2WCtVdVFNSFha?=
 =?utf-8?B?NFVtTld6K1VRV0JhUm8vREQvaWhQZlBPS1I3VXhyY3FzSnh1Vk15WVMzUHRh?=
 =?utf-8?B?d25FWGRuY2tKZC85eW00dWxSZVBZRmE2WG5qdFZ4UXdnMGM2UEZBdm9jUHpD?=
 =?utf-8?B?c01SZW9YYU5lVVdqN29jL0tKaVQ4dVoxNHZHQjVtcGJTNjNueUJsUG9DTGRo?=
 =?utf-8?B?MDIrTjJqMFVucWlkUTZuZHNnMFJiUU5mUWV1MVF3WVFiRHZhaWxoSWhJeUlY?=
 =?utf-8?B?TjFUaG04aUFXbXF0bFYzek5mUVVJSFdpZFpHZ1BmRURvMmRXQk9hSVRRc2Rh?=
 =?utf-8?B?c0txUzE3UmxZNC9YL0ppeDQ4Uzc5akN5UXdHaUM0Ry9wYjk3NEZkNFR4cURW?=
 =?utf-8?B?Zm80RzdrRlRRamJJUngreHAxbEhrR3VIRWVFRFRZYUNGWkRqYUVBUHMveGx4?=
 =?utf-8?B?b0tkUmpYQkJMdE1SRi9rc2tMSXZoOHFSZDNmc2VJckRxdWN4WTB3UUNMZTl3?=
 =?utf-8?B?bkRuM3BlSjBhK1lBSnFCTG9VaWRnR3JqdUdMZ01pSEtaeHhNREdIYTcvWWlR?=
 =?utf-8?B?WTBoYnlHcGtmMFl3K3FlY1BoeE03WjdyY0hLRU16RGZDQnd5dG1hcWdaK3Fa?=
 =?utf-8?B?aDJ1NDJXbm54eTFFOXYydGVYNy8wMjBuaEhLalgrdk8zbE1WZ1grK3k3NHpy?=
 =?utf-8?B?OVAzeGRKaDZKNSthTS9VL01Hdnd0Z3RYSmxkbHZMUHJ2MUxvbnhYNks1MEEx?=
 =?utf-8?B?LzAyTlJybklzN09RQldpQjJESDVuTFhBM3Raa3I0TVZOODgycVZVWWJEcjJt?=
 =?utf-8?B?Y3FWZnhPbEFUbEFqSWpoSlBsZzBaV0ZUbGIrcjMremYrL2hLR2tmcHF1VHdZ?=
 =?utf-8?B?d2ZzeElXL1lKdHZSbkFFSkl6WVRXa2Y0UktFeXIyaWQyeG1sOWNuNEFpb3dF?=
 =?utf-8?B?RzIxWjdPazB1TTFqZGJnTHJOYWFVVy9tajZ6eUM2eTNEUythbDBVU3BmM2JK?=
 =?utf-8?B?M1VHWThubEhaa01pNzNzQUwvWW52ejc1ckNCQTdVMXFQZnJaK0JrL2pKUXh1?=
 =?utf-8?B?c2FRSHBSTjQ5amFOb2xxV1VaZDZTSVNTV0w4U0cyb09IT2I1cm02dz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24d8218e-7f99-4357-b05e-08def69de1d4
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9567.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 05:11:49.6007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sPdG+ysXM6/K0IXqtRuLWrrFp3twQpYUQ90eAt/tzHxKXBGTVHm1F5lD8+aHVWLMwquvU3uL2j3zGh12J+w2nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9191

--------------90EYmxS6MU93PjKpoGH774AG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/5/26 23:41, Robin Everaars wrote:
> The ACP PDM DMIC emits a full-scale burst at the start of every capture stream.
> It is loud and it begins at the same frame every time. On a cold start it lasts
> long enough that the far end of a call hears a click on join.
>
> Hardware and software
> =====================
>
> ASUS ProArt PX13 HN7306EAC, AMD Strix Halo. Card 1 "amdsoundwire", driver
> amd-soundwire, longname
> ASUSTeKCOMPUTERINC.-ProArtPX13HN7306EAC-1.0-HN7306EAC. The DMIC array is
> /proc/asound/card1 pcm4c, id "acp-dmic-codec dmic-hifi-4", reachable as
> hw:1,4 or hw:amdsoundwire,4. Native format S32_LE, 48000 Hz, 2 channels,
> single rate. Kernel 7.1.5, alsa-lib and alsa-utils 1.2.16, PipeWire 1.6.8,
> NixOS.
>
> What the burst looks like
> =========================
>
> Capturing 3 s of a quiet room at 48 kHz gives 304 to 310 samples railed to
> +32767 or -32768, and every one of them falls inside frames 21 to 177, i.e.
> the first 0.44 to 3.65 ms of the stream. After the first 10 ms there are zero
> clipped samples.
>
> The shape
> rules out an analog transient. Printing the first 40 frames shows an
> exponentially growing alternating pattern that collapses into a rail, that is
> a Nyquist-rate oscillation at 0 dBFS:
>
>    (336, 2529) (311, 2454) ... (4765, 1614) (-14926, -7363) (-32768, -32768)
>    (3598, -3283) (-817, 2296) (-32768, 32767) (32767, -32768) (-32768, 32767)
>    (32767, -32768) (-32768, 32767) ...
>
> Left and right are in antiphase. That reads as an unflushed decimator rather
> than anything acoustic.
>
> Reproducible frame for frame across runs, and across every rate, format and
> channel count the PCM accepts.
>
> The cold start is much worse, and it is the common case
> =======================================================
>
> The 3.6 ms figure above is the WARM case, where the ACP was already awake. On a
> cold start, meaning the ACP had runtime-suspended, a second and far larger
> excursion follows: it rails from about 15 ms to about 50 ms and only reaches the
> noise floor around 250 ms.
>
> That is the c
> ase that matters in practice. Any userspace audio server suspends
> an idle capture node after a few seconds (WirePlumber does it after 5 s), so
> every real call join is a cold start.
>
> The driver produces it
> ======================
>
> Identical through plain arecord with PipeWire out of the picture:
>
>    arecord -D hw:1,4 -f S32_LE -r 48000 -c 2 -d 6 -t wav /tmp/x.wav
>
> gives 304 railed samples in frames 21 to 177, against 305 to 307 through
> PipeWire. Same start frame, same duration, same shape.
>
> It also survives band-limiting. Low-passing to 8 kHz and to 4 kHz still leaves
> an audible click, so a call codec does not remove it.
>
> Where it comes from
> ===================
>
> sound/soc/amd/acp/acp-pdm.c has no settling delay, no mute and no discard of
> the first frames. acp_dmic_dai_trigger() enables the PDM controller and the DMA
> in the same breath, so the decimator's first output words go straight to
> userspace. A PDM microphone needs time to settle after its clock starts, and a
>
> CIC or decimation filter chain needs to flush its state, and neither is waited
> for here.
>
> Other ASoC DMIC paths handle this. snd_soc_dmic has a wakeup_delay module
> parameter whose msleep runs at DAPM POST_PMU for exactly this reason.
>
> What would fix it
> =================
>
> Any of these, in rough order of preference:
>
> 1. Discard or mute the first N frames after PDM_ENABLE inside acp-pdm.c, where N
>     covers the decimator's own settling. That is the cheapest fix and it is
>     invisible to userspace.
> 2. Wait for the microphone to settle between enabling the PDM clock and enabling
>     the DMA, rather than doing both in acp_dmic_dai_trigger().
> 3. Expose a settling delay the way snd_soc_dmic does, so a platform that needs
>     longer can set it.
Could you please try attached patch?
>
> A separate, smaller thing on the same device
> ============================================
>
> There is a standing DC offset of about +0.06 FS on channel 0, roughly -24 dBFS,
> present with no acoustic input. It is passed through to user
> space, so naive
> level meters read about -23 dBFS in a silent room and any AGC treats it as
> signal. After an 80 Hz high-pass the real floor is peak -45 dBFS rms -62 dBFS.
>
> If a DC blocker is expected somewhere in this path, it is not running here.
Since the ACP PDM driver is a DSP-less solution, it does not have the 
capability to apply
audio processing effects to mitigate DC offset. A similar issue was 
reported previously,
and applying certain effects in PipeWire helped reduce the DC offset.
>
> Reproducer
> ==========
>
>    # cold start: let the ACP runtime-suspend first, then capture
>    cat /sys/bus/pci/devices/*/power/runtime_status   # wait for suspended
>    arecord -D hw:1,4 -f S32_LE -r 48000 -c 2 -d 3 -t wav /tmp/cold.wav
>
> Then look at the first 300 ms. Any tool will do; the railed samples are obvious.
> Repeating the capture immediately afterwards gives the shorter warm-start
> version, which is a convenient way to see both.
>
> I have no fix to offer, only the measurements. Happy to test a patch on this
> hardware.

--------------90EYmxS6MU93PjKpoGH774AG
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-ASoC-amd-acp-pdm-fix-decimator-transient-on-stream-s.patch"
Content-Disposition: attachment;
 filename*0="0001-ASoC-amd-acp-pdm-fix-decimator-transient-on-stream-s.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSBkYWIxYTcxNjE4MjIxMjlmZTJhNTc2ZTdlYWJhNjNjZmNiYzUxYjBkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBWaWplbmRhciBNdWt1bmRhIDxWaWplbmRhci5NdWt1bmRhQGFt
ZC5jb20+CkRhdGU6IE1vbiwgMTAgQXVnIDIwMjYgMTA6MzQ6NDQgKzA1MzAKU3ViamVjdDogW1BB
VENIXSBBU29DOiBhbWQ6IGFjcDogcGRtOiBmaXggZGVjaW1hdG9yIHRyYW5zaWVudCBvbiBzdHJl
YW0gc3RhcnQKClRoZSBBQ1AgUERNIERNSUMgZW1pdHMgYSBmdWxsLXNjYWxlIE55cXVpc3QtcmF0
ZSBidXJzdCBhdCB0aGUgYmVnaW5uaW5nCm9mIGV2ZXJ5IGNhcHR1cmUgc3RyZWFtLiAgVGhlIGJ1
cnN0IGxhc3RzIH40IG1zIG9uIGEgd2FybSBzdGFydCAoQUNQCmFscmVhZHkgcnVubmluZykgYW5k
IH4yNTAgbXMgb24gYSBjb2xkIHN0YXJ0IChBQ1AgcnVudGltZS1zdXNwZW5kZWQpLAphbmQgaXMg
YXVkaWJsZSB0byByZW1vdGUgY2FsbCBwYXJ0aWNpcGFudHMgYXMgYSBjbGljayBvbiBqb2luLgoK
Um9vdCBjYXVzZTogYWNwX2RtaWNfZGFpX3RyaWdnZXIoKSBlbmFibGVzIHRoZSBQRE0gZGVjaW1h
dG9yIGFuZCB0aGUgRE1BCmluIHRoZSBzYW1lIHdyaXRlIHNlcXVlbmNlLCBzbyB0aGUgQ0lDIGZp
bHRlciBjaGFpbidzIHVuZmx1c2hlZCBpbml0aWFsCnN0YXRlIGdvZXMgZGlyZWN0bHkgdG8gdXNl
cnNwYWNlLiAgQW4gZXhwb25lbnRpYWxseSBncm93aW5nIGFsdGVybmF0aW5nCnBhdHRlcm4gY29s
bGFwc2VzIGludG8gZnVsbC1zY2FsZSBzYXR1cmF0aW9uIG9uIGJvdGggY2hhbm5lbHMgaW4gYW50
aXBoYXNlCi0tIHRoZSBjbGFzc2ljIHNpZ25hdHVyZSBvZiBhIENJQyBpbnRlZ3JhdG9yL2NvbWIg
Y2hhaW4gcnVubmluZyBmcm9tIGEKbm9uLXplcm8gaW5pdGlhbCBjb25kaXRpb24uCgpGaXg6IGVu
YWJsZSBQRE1fRU5BQkxFIGluIGFjcF9kbWljX3ByZXBhcmUoKSBhbmQgd2FpdCAzMDAgbXMgYmVm
b3JlCnN0YXJ0aW5nIHRoZSBETUEuICAzMDAgbXMgaXMgY2hvc2VuIHRvIGNvdmVyIHRoZSBjb2xk
LXN0YXJ0IGNhc2U7IHRoZQp3YXJtLXN0YXJ0IHRyYW5zaWVudCBjbGVhcnMgaW4gdW5kZXIgNSBt
cy4gIEFmdGVyIHRoZSBzZXR0bGluZyBkZWxheSwKZmx1c2ggQUNQX1dPVl9QRE1fRklGT19GTFVT
SCBzbyB0aGUgcmluZyBidWZmZXIgdGhlIERNQSByZWFkcyBmcm9tCmlzIGNsZWFuLiAgYWNwX2Rt
aWNfZGFpX3RyaWdnZXIoKSB0aGVuIG9ubHkgbmVlZHMgdG8gYXJtIHRoZSBETUEsIG5vdApyZS1l
bmFibGUgUERNLgoKU2lnbmVkLW9mZi1ieTogVmlqZW5kYXIgTXVrdW5kYSA8VmlqZW5kYXIuTXVr
dW5kYUBhbWQuY29tPgotLS0KIHNvdW5kL3NvYy9hbWQvYWNwL2FjcC1wZG0uYyB8IDMzICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDMxIGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvc291bmQvc29jL2FtZC9hY3AvYWNw
LXBkbS5jIGIvc291bmQvc29jL2FtZC9hY3AvYWNwLXBkbS5jCmluZGV4IDFiZmMzNGMyYWE1My4u
MDg5OTVkMDUwMmVmIDEwMDY0NAotLS0gYS9zb3VuZC9zb2MvYW1kL2FjcC9hY3AtcGRtLmMKKysr
IGIvc291bmQvc29jL2FtZC9hY3AvYWNwLXBkbS5jCkBAIC0xMyw2ICsxMyw3IEBACiAgKiBHZW5l
cmljIEhhcmR3YXJlIGludGVyZmFjZSBmb3IgQUNQIEF1ZGlvIFBETSBjb250cm9sbGVyCiAgKi8K
IAorI2luY2x1ZGUgPGxpbnV4L2RlbGF5Lmg+CiAjaW5jbHVkZSA8bGludXgvZXJyLmg+CiAjaW5j
bHVkZSA8bGludXgvaW8uaD4KICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KQEAgLTI1LDYgKzI2
LDE3IEBACiAKICNkZWZpbmUgRFJWX05BTUUgImFjcC1wZG0iCiAKKy8qCisgKiBUaW1lIGluIG1p
bGxpc2Vjb25kcyB0byB3YWl0IGFmdGVyIGVuYWJsaW5nIHRoZSBQRE0gY2xvY2sgYmVmb3JlCisg
KiBzdGFydGluZyB0aGUgRE1BLiAgVGhlIFBETSBtaWNyb3Bob25lIGFuZCB0aGUgQ0lDL2RlY2lt
YXRpb24gZmlsdGVyCisgKiBjaGFpbiBuZWVkIHRoaXMgdGltZSB0byByZWFjaCBhIHN0YWJsZSBz
dGF0ZTsgd2l0aG91dCBpdCB0aGUgZmlyc3QKKyAqIGZyYW1lcyBkZWxpdmVyZWQgdG8gdXNlcnNw
YWNlIGNvbnRhaW4gYSBzYXR1cmF0ZWQgTnlxdWlzdC1yYXRlCisgKiB0cmFuc2llbnQgKHVuZmx1
c2hlZCBkZWNpbWF0b3IgaW5pdGlhbCBzdGF0ZSkuICAzMDAgbXMgY292ZXJzIGJvdGgKKyAqIHRo
ZSB3YXJtLXN0YXJ0IGNhc2UgKH40IG1zKSBhbmQgdGhlIGNvbGQtc3RhcnQgY2FzZSAofjI1MCBt
cywgd2hlbgorICogdGhlIEFDUCBoYXMgYmVlbiBydW50aW1lLXN1c3BlbmRlZCkuCisgKi8KKyNk
ZWZpbmUgUERNX1NFVFRMSU5HX0RFTEFZX01TCTMwMAorCiBzdGF0aWMgaW50IGFjcF9kbWljX3By
ZXBhcmUoc3RydWN0IHNuZF9wY21fc3Vic3RyZWFtICpzdWJzdHJlYW0sCiAJCQkgICAgc3RydWN0
IHNuZF9zb2NfZGFpICpkYWkpCiB7CkBAIC00MSw2ICs1MywxOCBAQCBzdGF0aWMgaW50IGFjcF9k
bWljX3ByZXBhcmUoc3RydWN0IHNuZF9wY21fc3Vic3RyZWFtICpzdWJzdHJlYW0sCiAJZG1pY19j
dHJsIHw9IFBETV9NSVNDX0NUUkxfTUFTSzsKIAl3cml0ZWwoZG1pY19jdHJsLCBjaGlwLT5iYXNl
ICsgQUNQX1dPVl9NSVNDX0NUUkwpOwogCisJLyoKKwkgKiBFbmFibGUgdGhlIFBETSBkZWNpbWF0
b3Igbm93LCBiZWZvcmUgdGhlIERNQSBzdGFydHMuICBUaGUKKwkgKiBDSUMgZmlsdGVyIGNoYWlu
IGFuZCB0aGUgbWljcm9waG9uZSBpdHNlbGYgbmVlZCB0aW1lIHRvIHJlYWNoCisJICogYSBzdGFi
bGUgc3RhdGUgYWZ0ZXIgdGhlIGNsb2NrIGlzIGFwcGxpZWQuICBXaXRob3V0IHRoaXMKKwkgKiBz
ZXR0bGluZyBwZXJpb2QgdGhlIGZpcnN0IGZyYW1lcyBjYXB0dXJlZCBieSB0aGUgRE1BIGNvbnRh
aW4KKwkgKiBhIHNhdHVyYXRlZCBOeXF1aXN0LXJhdGUgdHJhbnNpZW50LiAgV2FpdCBmb3IgdGhl
IGRlY2ltYXRvcgorCSAqIHRvIGZsdXNoLCB0aGVuIGNsZWFyIHRoZSBGSUZPIHNvIHRoZSBETUEg
c2VlcyBhIGNsZWFuIGJ1ZmZlci4KKwkgKi8KKwl3cml0ZWwoUERNX0VOQUJMRSwgY2hpcC0+YmFz
ZSArIEFDUF9XT1ZfUERNX0VOQUJMRSk7CisJbXNsZWVwKFBETV9TRVRUTElOR19ERUxBWV9NUyk7
CisJd3JpdGVsKDB4MDEsIGNoaXAtPmJhc2UgKyBBQ1BfV09WX1BETV9GSUZPX0ZMVVNIKTsKKwog
CXBlcmlvZF9ieXRlcyA9IGZyYW1lc190b19ieXRlcyhzdWJzdHJlYW0tPnJ1bnRpbWUsCiAJCQlz
dWJzdHJlYW0tPnJ1bnRpbWUtPnBlcmlvZF9zaXplKTsKIAlzaXplX2RtaWMgPSBmcmFtZXNfdG9f
Ynl0ZXMoc3Vic3RyZWFtLT5ydW50aW1lLApAQCAtNzQsNyArOTgsMTEgQEAgc3RhdGljIGludCBh
Y3BfZG1pY19kYWlfdHJpZ2dlcihzdHJ1Y3Qgc25kX3BjbV9zdWJzdHJlYW0gKnN1YnN0cmVhbSwK
IAljYXNlIFNORFJWX1BDTV9UUklHR0VSX1BBVVNFX1JFTEVBU0U6CiAJCWRtYV9lbmFibGUgPSBy
ZWFkbChjaGlwLT5iYXNlICsgQUNQX1dPVl9QRE1fRE1BX0VOQUJMRSk7CiAJCWlmICghKGRtYV9l
bmFibGUgJiBETUFfRU5fTUFTSykpIHsKLQkJCXdyaXRlbChQRE1fRU5BQkxFLCBjaGlwLT5iYXNl
ICsgQUNQX1dPVl9QRE1fRU5BQkxFKTsKKwkJCS8qCisJCQkgKiBQRE1fRU5BQkxFIHdhcyBhbHJl
YWR5IHdyaXR0ZW4gaW4gcHJlcGFyZSgpIHRvIGFsbG93CisJCQkgKiB0aGUgZGVjaW1hdG9yIHRv
IHNldHRsZSBiZWZvcmUgdGhlIERNQSBzdGFydHMuICBPbmx5CisJCQkgKiBhcm0gdGhlIERNQSBo
ZXJlOyBkbyBub3QgcmUtZW5hYmxlIFBETS4KKwkJCSAqLwogCQkJd3JpdGVsKFBETV9FTkFCTEUs
IGNoaXAtPmJhc2UgKyBBQ1BfV09WX1BETV9ETUFfRU5BQkxFKTsKIAkJfQogCkBAIC04OSwxMiAr
MTE3LDEzIEBAIHN0YXRpYyBpbnQgYWNwX2RtaWNfZGFpX3RyaWdnZXIoc3RydWN0IHNuZF9wY21f
c3Vic3RyZWFtICpzdWJzdHJlYW0sCiAJCWlmICgoZG1hX2VuYWJsZSAmIERNQV9FTl9NQVNLKSkg
ewogCQkJd3JpdGVsKFBETV9ESVNBQkxFLCBjaGlwLT5iYXNlICsgQUNQX1dPVl9QRE1fRU5BQkxF
KTsKIAkJCXdyaXRlbChQRE1fRElTQUJMRSwgY2hpcC0+YmFzZSArIEFDUF9XT1ZfUERNX0RNQV9F
TkFCTEUpOwotCiAJCX0KIAogCQlyZXQgPSByZWFkbF9wb2xsX3RpbWVvdXRfYXRvbWljKGNoaXAt
PmJhc2UgKyBBQ1BfV09WX1BETV9ETUFfRU5BQkxFLAogCQkJCQkJZG1hX2VuYWJsZSwgIShkbWFf
ZW5hYmxlICYgRE1BX0VOX01BU0spLAogCQkJCQkJREVMQVlfVVMsIFBETV9USU1FT1VUKTsKKwkJ
aWYgKCFyZXQpCisJCQl3cml0ZWwoMHgwMSwgY2hpcC0+YmFzZSArIEFDUF9XT1ZfUERNX0ZJRk9f
RkxVU0gpOwogCQlicmVhazsKIAlkZWZhdWx0OgogCQlyZXQgPSAtRUlOVkFMOwotLSAKMi40OC4x
Cgo=

--------------90EYmxS6MU93PjKpoGH774AG--
