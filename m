Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011036.outbound.protection.outlook.com [52.101.62.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EEDD3290C7
	for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 05:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786511375; cv=fail; b=LOcHKv3hl16l1JYK+JnK9DQyx/msP2F0sU/Hdr94u62pNcHBJ74oP2RYLqRTxlsBHQbEbc40MoyuZmSDtQEjgcrjGS4b7YDSTS13XBFWMe/PdDMAmUgK5V4pwa+hr8VmIWSsMw53czUj8o0Tu/ocZQ81KCFh+ncWQ5eajEp8pMQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786511375; c=relaxed/simple;
	bh=Vt4PPLhpDxgCYk5iAnkACMS75fy0uknwIUa9+4/qbEU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WVw4wvg+CHJH5N7pM7S4qruI4CN5NhywNRWBpnDvtvq38eQGbZuVW9ie9IoeR2Yop5H1+599YeCCYLcishIVdQ3B5md11EypW8qt3/mEbrHfc8dt5pyaXDMnz1QeqPytPTLkuxiah4By7BC6wqGda1VwcCjTquoiLPP9099twq8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=eyKo84SG; arc=fail smtp.client-ip=52.101.62.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="eyKo84SG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t/y3SHLMQR6PjmDrMlwu5IFoyVU6nH7F7YCyKk5WwetJjZW/OtdMvwlnSwWdvFYtjKzHs/7iyJeIJa2Ao/gyr5ZeauAAzpEPIPNf0I3eK5oW6AhosdDQKK3UgQ1RMC151qVPdjgAolC5Zk+/DuKSGO353LYLE8ihbt83/e0NPxq/9fLJiIJfGVyCvoUWfjW0gSy2xmwnKAai7rwWzbip9sjIUecmQA2rpWxIzK7pva/VeCQxq0ZCJLi+7q63sbDpDHTaBQpjWl7lJ4DvQYOTrvwfV3pZLGRJC0LqpJSRyvD9A7XjPQnhHa5w1SPUHWAibVBD2AfgTrFwbgGECiDtIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jnMq6sgeU3eOBgLCuLVVMPfBrD9q3nh8Ysrjw2WhTWU=;
 b=sVxnmEF2a53CRyhkmN/uY2tpUHdAikP0s7PXAJeIPqK+Ua+yIa9gttQg2b3ogbYRruEeAFP8bgf1ecC/OFG+9sIBMig9MEWZYYDwDC/gkC23sKXxzK7ZBQET7HKx/aTOpk5+3KUplCFJkOBQKpWC8fwUkOzi0I57glDrjXmio49x2AX8lL/hnKzYJiILSv0cDtH2IhCoMA3V6m5oQ/SC8/ouL87CfOtUN8Jym2gtD22hGwQ6K3aJZzQI3w/peP1kEHDCv2VPf3aa81HyXOUBmZHW1bjTcqa5VLySUoMLGycsRSLh2rxDJVV6ggrBwdpn6ZJoky3FxCVmCMsIK33nIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jnMq6sgeU3eOBgLCuLVVMPfBrD9q3nh8Ysrjw2WhTWU=;
 b=eyKo84SGepmj5Ue/QXVbLCOstyBWkfah10nHo7e2fuJ0YTw79PvG8T++W0jCWxuTA8mzufc+8nZKXGwWwZOs4ZfsMwC3aaWAw30QmWqxeLKjDCkB+Pqq53+bokN8MJFzvo0XgzzGFRoBLwKIcKtSojF+7z+PzswdWDgAYsS1ktg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS2PR12MB9567.namprd12.prod.outlook.com (2603:10b6:8:27c::8) by
 SN7PR12MB7418.namprd12.prod.outlook.com (2603:10b6:806:2a5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Wed, 12 Aug
 2026 05:09:29 +0000
Received: from DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5]) by DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5%2]) with mapi id 15.21.0315.008; Wed, 12 Aug 2026
 05:09:28 +0000
Message-ID: <2d286f2d-4084-4bc4-8c57-51c5d0ee89ef@amd.com>
Date: Wed, 12 Aug 2026 10:38:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: ACP7.0 SoundWire: two TAS2783 amps, only one channel reproduced?
To: Kel Modderman <kelvmod@gmail.com>, venkataprasad.potturu@amd.com
Cc: linux-sound@vger.kernel.org
References: <CAFcu4SY1cRs4WD7=ZaD0s_ybYXO2=d-ZMG+dSeotktuPrz2YUg@mail.gmail.com>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <CAFcu4SY1cRs4WD7=ZaD0s_ybYXO2=d-ZMG+dSeotktuPrz2YUg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN5PR01CA0009.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:261::16) To DS2PR12MB9567.namprd12.prod.outlook.com
 (2603:10b6:8:27c::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9567:EE_|SN7PR12MB7418:EE_
X-MS-Office365-Filtering-Correlation-Id: 84755264-64d8-4560-01ab-08def82fe29d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|6133799003|22082099003|18002099003|5023799004|11063799006|56012099006|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	i+50z7kNS6b/midgL+dEYSR9/aa40RQXHbSm9Ish4nA+JAX0YGOZZ4tQC/hBHvjuE4ce4AG3qV6cu/6NO7L4TImcX4t4ZUfLayEqTWoFNhbp9+ssjpHgfPLz2MIw2y7+aEZR6YcwJ7FRCYKO8rn+jiL7aWPtfp1/bvkMt6jl9ozDdF0nEJNZ1MT1sh2kCV1p0NzYBjwSKqBtkFiYKN5mMvEpkaTpE7wWm7RTqmt78InitYlZXL46YCQtScfbchMb+esB/copTilPJT1kVRx202+EJuoBqE2G8lxzipymPH8KI37VtpMDe9QYES3UvU+gaQ7Ecc7a02rKfkl6INQ2lqgT2vB3wJiAd6hJLdW4MBBulVGdWIoE3BlOcvknblOp60rfAfTyVCQbCzS5hLCKT42vu7CuFrix9iUFUEAxJNFA+DoOnGdzRdsrmy8EcOj4vn1nkgC64VMXho8pr9IbgTv6ORgDERZqZW/awTutKHBW+rab9HymyVpBM+W7N7qBfDWd1PwoCN1kNh4G7K57ArffNOngLKmolhJG/BUWl3ZK7ZrmDkI7okzmF8zsm/qUbdbN6u6hSEl4UmvASvELP5HWIx+OGnpxv9esTbJXO82EjM2X7iZRMdNq2arQieEBvX5jMtSI0lmA6wqhop+c94GA05of0iOLLWTdwFBK2ZA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9567.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(6133799003)(22082099003)(18002099003)(5023799004)(11063799006)(56012099006)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?LzI1S2F3dnJabUJOVklYM1gyZFRxeWlBaHNscFFzOGtwL21HRE5jNUV3a3BF?=
 =?utf-8?B?Zm1tdTV3RGNYY2N4MXUrOU1QZWgvQ3hHMmNSbytBTTdYL1IvcVVET3RXNDFK?=
 =?utf-8?B?M3NUMkdaWXVMaU90OWdydzRrWGF2S1pRc2ZYeFRjOElUOElYU3dsS05wSkZZ?=
 =?utf-8?B?c25ReHV0eE1CKzc3QnFIVDIyTGg3bzViTjZSbVpqajcvVWVkOU42SnBjYmtS?=
 =?utf-8?B?bUVuVFZhWUlrdHZub25GcFBrUCs0R0ZtREcyenE5TTI5MS81MVBCR3pnYmhS?=
 =?utf-8?B?c2ExUFJBZWdtWk5wUkhhajlxb0ZxbmlHejhVYTRJM2hLc01yMFVhYThCTExF?=
 =?utf-8?B?eFl3WitLMitIcjVqVjVwNEhza3dmbkdHZnlRbGkwdTFFRUZyaGVUWlVrVmtY?=
 =?utf-8?B?WTFNdEFTM2h1enFiZ2p3enFuRGNscUp0WktDeGEzeFNON3RJQWlQWG9UYThy?=
 =?utf-8?B?dm5WSzRCM2pWVHNJU3FrMTl3a2lJZTMvZzhtSm1UaW5PbHlxVGVvR1lBVDd4?=
 =?utf-8?B?OWVKMGNIMXcySzlTTEFCV1VMV2RyTWtnSCtSQmdDRHNNcWgyVUx1d0lOUEJ1?=
 =?utf-8?B?N2dMbmV0TVVMUGh6R0tJdjBscGZxaTNlREZrN3FrczlZN2l0ZHVqZjRrdTJy?=
 =?utf-8?B?TnMrV1ZWY1lEaGwzUElQdTd2MHFwQXRlV0hCQ2FIcTZhNXRrVi9IenpQUW5w?=
 =?utf-8?B?NnE5RGV3TGFQUXFhWFd2cmF5SWhENFJ4NW8zcS82SDVsalBlejRyamZpSXJ0?=
 =?utf-8?B?VGZ5bVo2WHY4UG0wSi84ZXJlN0syV29JeDl1REdQRk1TZStzZmxCeXJIMEcr?=
 =?utf-8?B?eU4wR3dCSFA3Q2lIU21JMVFaUXR1ZEtCaUM4allMMDBMem1mbE1WM3cvdDc3?=
 =?utf-8?B?MTJSL2Z6cWxSM0FTY3pZTDM4RnJXc1FFTVZuU2gxeUE1QWllT0E1eklJQjhD?=
 =?utf-8?B?dWo4YVl0dzZnUDlmMndnNnNqb2x3d2YwM0xHR3pzbG5CaGlzazQrbDZDdVUy?=
 =?utf-8?B?VmFaVzRjckRSNithRUJZVU1DeTQrWmVMOU9ONVh5b010MEtnaEsxb3N1a1hq?=
 =?utf-8?B?RU82bW1qdWRNdnRQVEc4cWRFNUZ1aTlrME9sd0NkVFZ4bVBrRHJFaFpNWlVp?=
 =?utf-8?B?NlJ5Nk9MVHIwS3g1VUpEM1VBZnZyc1VybEtvTDZ3Nlcya0M0bTU2dnlxWXox?=
 =?utf-8?B?ckhnemtCTUNhTG9jOWk2eG5pekxPQnhtMmtUcndkZDVFMUl5V1RSdGhlTlIw?=
 =?utf-8?B?UXpuaTczbVM4MjVUbC94RS8xL0Fyb1UrTTF3azNkWWxVcmRmeVB0MVFGQjZS?=
 =?utf-8?B?N2hLSm05b21zMG9SSVlnVi82bWErY0w5b1ZJVmJ4Y2c2ZGhlT0cvSnB6cTFh?=
 =?utf-8?B?UnBnOC9GdEZja2d1cVlTbzg2L2RrTHc5ekpLdzF2Nld5YndxOTY4eXJ0N05V?=
 =?utf-8?B?bjlwOTdiQzI0ckl1bU5udm9aL3NQWUV2b2NqVkc3Z2czdSswQjh6UWNGTDVZ?=
 =?utf-8?B?cXRvOGVBaEVmTUkzYVZMdzB4SnhsZXJ0SEFYc0lXcTNhUDhQamxLbjdLa1JX?=
 =?utf-8?B?cWU4QlpWZ1FFRnhHaVd1YjdtMGs4ZGQyQ3JEQThxVmZGMmU2R1N5Z2x4OU9U?=
 =?utf-8?B?Y2dBZlZSa0RxK20rcWVZVTNpTXN2YnFMZlZ0MS9VSWpvZ0pGS1o0OG5Zaktr?=
 =?utf-8?B?Qy9ZdG1vZjJ6Y2FPTWMxR0E2SHFoLzExOXZNTTNYd21GK2x4UU5GcFl0YnJX?=
 =?utf-8?B?Yk1VQ3FtY1QvT2U0L1l0TDQxV05PbmRBQXdPUGZYUnNJVmRCVDZJZzB1VnBG?=
 =?utf-8?B?aFdHVTE0WERsRFVjelNRUCszNExhQmVjS0ZteWZFK1NmSWxIc0c0QWR3b2c4?=
 =?utf-8?B?Y3JkSXFVZ0lVYTlJbkVvcHJOY3I2Zit5WVRhRlVtSDRGZndVVUdLQWdzUGZ2?=
 =?utf-8?B?TU5mOFBzdFlUY2VyYzREbHpQZGR5aHBlNVpIRWVXMTdOelVCeGNvNWlMTnN4?=
 =?utf-8?B?dkVVbFl0Y1pIK1BjS09sSHBqRGt0cElGQkE1bmE4am1CSHpJUEdkZk8zeSsy?=
 =?utf-8?B?b2pJOVArZHRsMmlHRlNUVEJqSktna2hxRHpsZ2IvMnFJNE5KUUp6RHUwQXBH?=
 =?utf-8?B?UlVjSm9ZOTRPakd2akpCTEtGNGxwODJVZzdXMmRIVDdrRWRBdnlxaE1ubGN5?=
 =?utf-8?B?WDN1VnNZNkdtb0lFYUM0QmhBK1BhTFMvQ3RjV2NHTHJXdTFBaDh3bE14UWxj?=
 =?utf-8?B?OGYrVkRjRjg0djJYSkRQcWJVblVvUHBGM3FrMXVTeE1jaSt4eGpJSVo4Nyti?=
 =?utf-8?B?ZHRNaWxnL0V2Rk5BaGpRY0cwNU9uQU02alljYVBtQ01VdXNsdkZIUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84755264-64d8-4560-01ab-08def82fe29d
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9567.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 05:09:28.5771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qKbyXbIPiDBjmOgkweQRIr9r3b4ZkjICeKDg1a7tFONcn2kPZ4JfGlJHGe41ZfScYWakp8TPpIXbXau12tIsgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7418



On 8/12/26 04:31, Kel Modderman wrote:
> [You don't often get email from kelvmod@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> Hi,
>
> I have an HP OmniBook X Flip 14-kc0xxx (board 8EA1) with AMD ACP 7.0
> (1022:15e2 rev 0x70, subsystem 103c:8ea1), and I am trying to get its
> speakers working with assistance from claude. I have got most of the way
> there but I am stuck on one point, and I would be grateful for your advice
> on whether the layout I am using is the right one.
>
> The machine has:
>
>    link 1, uid 0 - Realtek RT712 SDCA (headset jack and microphones)
>    link 0, uid 9 - TI TAS2783
>    link 0, uid C - TI TAS2783
>
> Two local changes were needed to get a card at all:
>
>    1. The BIOS reports acp-audio-config-flag = 16
>       (FLAG_AMD_LEGACY_ONLY_DMIC), so snd_amd_acp_find_config() returns a
>       value that neither acp70_pci_probe() nor pci-ps.c accepts, and the ACP
>       ends up with no driver bound and nothing in dmesg. Adding the board to
>       acp70_acpi_flag_override_table solves that.
>
>    2. There is no entry in snd_soc_acpi_amd_acp70_sdw_machines[] matching
>       this topology, so I added one.
>
> With those two changes the card is built correctly. The headset jack, the
> microphones and the UCM profile all work, and both amplifiers load their
> firmware from ti/audio/tas2783/8EA1-0-0-0x{9,C}.bin without errors.
>
> My problem is that only one channel of the stream is ever reproduced. I
> measured this with the machine's own microphones rather than by ear, so
> the numbers are repeatable:
>
>    amps on group_position 0 and 1:
>      only the position-0 amp plays, and only stream channel 0
>
>    the same, but swapped over:
>      only the (new) position-0 amp plays, and only stream channel 0
>
>    both amps on group_position 0:
>      both amps play, but both play stream channel 0
>
> So both amplifiers are healthy - either one on its own reproduces the
> whole signal when it sits on position 0 - but stream channel 1 is never
> reproduced, whatever layout I use. Nothing changes if I use the other
> firmware variant (8EA1-1-0-0x{9,C}.bin).
>
> I modelled the two-position layout on acp70_rt721_l1u0_tas2783x2_l1u8b,
> and the shared-position layout on tas2783_2_adr, which pairs two devices
> per position with /* left */ and /* right */ comments.
>
> So my question is really a simple one: is a two-TAS2783 configuration on
> ACP 7.0 expected to work, and if so, what should the machine entry look
> like? I am probably missing something obvious.
>
> I am happy to test patches or collect any further information you would
> find useful - I have the hardware in front of me and can rebuild modules
> quickly. I can also send the two patches I am carrying if that is helpful.
>
> This is on 7.1, and I checked the relevant files against the current master
> and the sound tree's for-next as well.
For better tracking, could you please create a Bugzilla ticket?
>
> Thanks very much for your time,
>
> Thanks, Kel

