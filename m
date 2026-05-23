Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011069.outbound.protection.outlook.com [52.101.57.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1457C23D7DF
	for <linux-sound@vger.kernel.org>; Sat, 23 May 2026 13:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779542173; cv=fail; b=iWPyWPwarwSKpdlf1dKBzMzlYNCeYHC+Nev8Gcdi2kCbxLo30hetrR0U4JsFdV/spfWz0dvbiD2KRgnxEQ0obvrOwovyMZYY9NsBgympbf3xyGV4eMosCS0HII9F0YfP/Znda8h1BJ1rNnxAB9y2O68V3v5bV2p/cScNes8tt2M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779542173; c=relaxed/simple;
	bh=3egNJxBohTLoopphjzLtpMvZzzE2M2qx/Gar+79SpWU=;
	h=Content-Type:Message-ID:Date:Subject:To:Cc:References:From:
	 In-Reply-To:MIME-Version; b=Ey0YpL9OCmoH5luGQyjddz07T5mLozUNdcc44eEf11eh4Es/P20bPYEbq7RjlkUsZtAcLFfMo3ey3JAeRHpPPHgK0Ytvtlc4JfhwMCSnfWRiktNAv9NVtmjf+PxVtLaKbcBywr6WhKWWfiPnxhRwtFqExstHsCKC/Tq6nAgGT4c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ppPKEimK; arc=fail smtp.client-ip=52.101.57.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ppPKEimK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e3ysYhOpNDck7S8988NYRr0QtV96+uemZU1LgVM3FjGESWzJa5yIs15urt2N12C+sAk+B0uD02+cSNAuR7EbFzsUB4IVNjDXkQbtI/ofn2cFF/zQudgwfKjNqSJ5tczou30FmO5yjeEot+WGsgp7GSQFia93BKcwUe9xe1dOOa8EqSwZVP9I73nCMU3N/HGZg3B89S5ysjCtZAKmto6rsN2TH78nhSBrbic2QynhrYVIQdGeah/uQF0zrSMniF2LLlxOFzYspziKwWiNME8tr/IcXshmiqnGBmoEc4YI1EOPD0pv0pwCOqTYFBvDWSOjjw59Bcl+SxnqWW2Qaz/M3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3egNJxBohTLoopphjzLtpMvZzzE2M2qx/Gar+79SpWU=;
 b=JV9iFuUw3b7rcNcuTWdRi+60jIzQ52KuudnsRmDI8DfDHaQU85g6s5YfmvN1LcGmAxdhNJQyIkl9Qwv+6jwerq0X6shscpcPHkrjpWLQ2nDlmIu18mVn2EXxlQk0itktSKndtKYCSDo+S94xBSUew/xSwz6Tdgnd/qZT6sRRJDKZkW2+4BWuJMwaG/oVEZaG1wNpGaW3VaMi/xsKYkG3+E1rwnfFgatmP5zp9/2dInBF/B0SO6fwjtzL8Aywjjg7Q5atmfhF2PptAb3XIopNuDXuaBmI4AkmKyXE3EVFhO8ph0vBGzMbcUdznUyRhxQWH5lnbZkJNCCUlivR4XZyAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3egNJxBohTLoopphjzLtpMvZzzE2M2qx/Gar+79SpWU=;
 b=ppPKEimK+oMdjz6zZFFwzUblTr7hbbH4WcTOq/rSLfTSNQFB/Gt7z5MDk5YjwbqUbc0AAFg7f6MGURykEQ/AE64EXKps/RnXF9lCZrhcDtx+05zx0zcjEzRW6OXoracXJnt/cCtWy40R3mOChk6x8MOjV9psCyJMAf3nOs0cUrw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH1PR12MB9576.namprd12.prod.outlook.com (2603:10b6:610:2ad::14)
 by LV3PR12MB9235.namprd12.prod.outlook.com (2603:10b6:408:1a4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Sat, 23 May
 2026 13:16:06 +0000
Received: from CH1PR12MB9576.namprd12.prod.outlook.com
 ([fe80::149b:7b16:cbb9:59]) by CH1PR12MB9576.namprd12.prod.outlook.com
 ([fe80::149b:7b16:cbb9:59%4]) with mapi id 15.21.0048.016; Sat, 23 May 2026
 13:16:06 +0000
Content-Type: multipart/mixed; boundary="------------YPeCIXxDOxfmdzcQMz8JMPEg"
Message-ID: <cab8c5d1-6930-4048-a8d3-720db9b3c0dd@amd.com>
Date: Sat, 23 May 2026 18:45:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] ASoC: amd: ps / soundwire: SDW peripherals unrecoverable
 after s0i3 on Strix Halo (ACP7.0)
Content-Language: en-US
To: Adnrey Golovko <andrey.golovko@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: superm1@kernel.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.de, yung-chuan.liao@linux.intel.com,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>,
 Venkata prasad Potturu <venkataprasad.potturu@amd.com>,
 Syed Saba Kareem <Syed.SabaKareem@amd.com>,
 "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>, Poojitha.N@amd.com
References: <7328cdbf-10fb-46a1-a28c-2f7365fd767d@gmail.com>
 <9a017983-c4ce-4abb-a9cf-8e6c2bafac70@sirena.org.uk>
 <c3bf6b9f-a041-48c6-8d38-f168bb93daaf@gmail.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <c3bf6b9f-a041-48c6-8d38-f168bb93daaf@gmail.com>
X-ClientProxiedBy: BM1PR01CA0146.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::16) To CH1PR12MB9576.namprd12.prod.outlook.com
 (2603:10b6:610:2ad::14)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PR12MB9576:EE_|LV3PR12MB9235:EE_
X-MS-Office365-Filtering-Correlation-Id: c82017af-5c07-4a15-033c-08deb8cd725b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|6049299003|7416014|376014|366016|11063799006|3023799007|6133799003|4143699003|56012099003|22082099003|18002099003|4013099003|4053099003;
X-Microsoft-Antispam-Message-Info:
	qGfJAnUWLSvGAn3D0uWZgb4YnQ/JcWVFHFzM3nW2D+PGA+A+PGsrHVz6xn8h3s85K8U7qRAI+YqXuxAE/yHAwjSw5OOzmnXuxNwWEmCDvBof0HjhTLDVXuu0zpIr2E+dpXU0n5v0bJOttSurJGufs5wWj9Tk5kaejeEaWgOELaIlzUf48vUQODK0EcOBf66VwETMMEVY4uF1854GLizGKWfDwiR1XyLudD36u/2RD01XQMsqOwnl/9jeiVyFpPT0ATJpyfR46gqwepOotaWTJipM042uKe78F92T3ft5TSHjS0sJdNSIO3tZEmNf77Dz8yWD9zE8hRt/3a+xs3NLSIERlk76SOkdZWW1Dz7f/hNhoR/zwCtWTanNswqrElB23YYYLQ/2n8qAqy9276NoCvjbvUErw0wAZ6pavKJIXzm4ZtCtYabu0qdtEYnK79eh53y01Na3SFnSSV6dExIWbA6nUza5oScuub8HfZ+vXaiDdDq2upAmGgIrSB8h+U/CgOl/MMnGR1AqLXzqUlC2DSUdvyxaKwA79axrL7+FrlPzePg7zLKnF6JJ4nVsAYPe+zf7SabtWUPx1EThGy+BaTpoHGNon9qYXME11OOHMJOPgxudjtC6jR3TPFHmCgLe0FEsRAmFvOn/SDoFO8f8kg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH1PR12MB9576.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(6049299003)(7416014)(376014)(366016)(11063799006)(3023799007)(6133799003)(4143699003)(56012099003)(22082099003)(18002099003)(4013099003)(4053099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qys1ZlZNckRvd3c1Q09uVUJMcGxPckx0cUR0cXJiZEJpRTBLMmRkM21vSjYv?=
 =?utf-8?B?N2pHT2FIeEVXY1VIT2hKNFlPQzVnc2ZZekFTWFR4RDAybGNSZEZJdTN2YkNw?=
 =?utf-8?B?blMyb21WeGNkNWZZV05BYXBJNGo0VnM5aDZyMnF4K2NQMkJ3OEZYQ3BnZXBB?=
 =?utf-8?B?aVE4aUZFQmJWRHhoNjlqN1oyTzM0K3lpeGNQOEpvMlo0MTM4M0ZwcSs1U3dk?=
 =?utf-8?B?Tm54Unl2U1NrMHFEb0g2L2ZyMjRLQStTbE95S2lWbFZwZ0JHWGRIbmZKTlpv?=
 =?utf-8?B?elFhdzFKMkhyZVRmUWJhcmJiOHNmbDVjejNIQmcwV0F5aEYvaXBBaWxvR2F5?=
 =?utf-8?B?WVkzUVFRYUoxVWtsVHByeVI3RnBvYWk4ZXBLbm40SVpCS2ZIRm40R3NEMStL?=
 =?utf-8?B?TGk5WUZmcXFzd0JQcEw3MHo4OS83S0ZJclpDbnMraGd4WmJ2S2dGT2hXZWxu?=
 =?utf-8?B?OVRjdk1RY3VsVytQODFzT0htS3FmcXA0WnV1OGwxMnlKUTVkS3VkNWo5aHhT?=
 =?utf-8?B?cjJ3UUlRTVZZdEE4QnRxZDBSL2hOVzJUT09qeTJGMHNJNXEzcGlOVWNSZk9D?=
 =?utf-8?B?VHdBcnNzNzgvZU9PalFXR01SK3QvdkVsUDZjQS9DY3BjRVVOTXZmQkY0NUpk?=
 =?utf-8?B?VTYzaUkwYjArblJLdVkrYUhCQkFFK2Y3ODdRQzlMajFoSXVHWXUrWFZQcnNz?=
 =?utf-8?B?eldLRE9ld2EzTEpCVDB6VjJtanNUaHZHS2ltSzdTMG5paEFjTjFTcUhydFJF?=
 =?utf-8?B?czdHTFNaOUwwTmpVcE45MERXd1lnZFhFYXJrVExkeVRMODZDaWxpYmxEYjBm?=
 =?utf-8?B?dHUrTXdiOEF4bVNaT01tZys3aHVDc1NIa01kVWw1akRlajJmZkJEZFdjclY0?=
 =?utf-8?B?UUVJa2lnUGtCYkpNUHBvTUZidlYrTmVKdGhYTnRJZzAzcWl3UGtsYjI4Mjlq?=
 =?utf-8?B?K2cyVmdNY01pTU9UOE93QlBWbFVYV3NDdzM0TXowd0tiM2laL0RTOXpNV3BD?=
 =?utf-8?B?eTJnTFZzRFlBbXJMVkNHMDdCOVZkdC9pN2hOWFk5RURWUlkzOXVoZTVTVS9P?=
 =?utf-8?B?di9tcDR4aDFVTEVrbVJLdkV0amFwaW5iaVpxVkRvNmw4Y0NXcDBvbm9ETkNI?=
 =?utf-8?B?ODh4dmN3YitkK0ZoNzVjWVFZM3c0dWhFSWU0T2hFMEM1cjRqMjRvOWNSdThO?=
 =?utf-8?B?RmdZdUhyQkd1dGxJcW41WnhMN0c1UEF5eWxHS2lENHZBVUtON3pMOXhlL3Za?=
 =?utf-8?B?eGVaVFJRbnMyRWIvbWYySTNpemZHWW45b3dIOFFmem5HL2xSRUROUzNFaU1a?=
 =?utf-8?B?NmFkSEdmd3Z2THNmcnA3L2pMYmw5T215R0lnNk9KZGVSYTV2dnpsRTVRZHVB?=
 =?utf-8?B?VDl0TWZmaHZXSUN4NU5Jci9ObDdNZE5LN0d5ZSttYUtHRUZDbEF4cGIxV0xm?=
 =?utf-8?B?UW96Nk5GZ1hqYngxbTZYYys1S0NEUEN0b2JWMHVpVC9TaXZlSFJIT3Y2MHdq?=
 =?utf-8?B?WmhKclBObGc5UXdoTUNtMjZLR3IwU1lVODNWeStKUTlFNmFCSkZLQ0UzSEp5?=
 =?utf-8?B?b3QyZUZsajYwOG5MVXIvdmVpVEZNWFp2V2kvTW5nV2pVcVhpaHlMbnpWVG54?=
 =?utf-8?B?MThSNGd2bXFIbWVoS1VYdzFtQXEwNkt4Ym96UTF2NnhHcFZMMm1yVHVXeDNn?=
 =?utf-8?B?WTZ5WCt3em93Q3JQeCtvNEVhcElGL1NqTG1OZkNBWGdjVjgreXlKdnVaTjJH?=
 =?utf-8?B?c3FQeW54SFpLdktmK0lzZ3QzUTkwNTJiUTZDRkt6L3ZoUVA1elVZNFd5N0t6?=
 =?utf-8?B?TUFua2dSV0xrUDhjZ1VJTXFoNFB5U1EzNktqY1A5TCsvNTdOclpyb3pETWtu?=
 =?utf-8?B?K2NRbDNqbjdzRE9HSDdYYzZPZ2NxaG54NnVzekV1NFFuVGZkZlJmYVp2VnZq?=
 =?utf-8?B?enA1MVFNTHRKL1FubzBkNXd3WXlrSDMzWTBsYWtWVTN6NGkrS1pOY29uU1Nr?=
 =?utf-8?B?anlvdHFXaVdCS3dHTEpsb3VLaXdEdjNMZ2ZiZHd5RE1zVEVJRkx2NFZLanNl?=
 =?utf-8?B?Z0dSbEwvVUMxNC9XczIvWTl6bXhnd2JSMStUSHBHTlM0TmRPMThRSldHRU1i?=
 =?utf-8?B?WEg3VVF0UTM2WC91ekJEd3MvazBTQVBXQ2t3U1Nhc1F2bjVVNHE3VVZNYUJO?=
 =?utf-8?B?ZE1Gd0xzYkYyQUovRkU1b0R5U1VWRGFleUtHTlphZVNGRWkyZmdlQ2NlMGwx?=
 =?utf-8?B?Ujc5WVNzTVBjc3NVL3NjVXVLZllKN1RUaXZ1ZWo5K0dvaktFR2lhYTd5U0VM?=
 =?utf-8?B?aFV5YVBoMzNvc09uMHVSUTB2QjRXeCtobDlJZjBoWVR3amNpRlVYQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c82017af-5c07-4a15-033c-08deb8cd725b
X-MS-Exchange-CrossTenant-AuthSource: CH1PR12MB9576.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2026 13:16:06.3897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: soLuWUgnOiJiqiJr95xSkcNKPkZFXniv3mfSwBn9ZDx4avVfpPDb1I70Suq2wb72vlbIlQUN7cszdGdZKbmOeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9235

--------------YPeCIXxDOxfmdzcQMz8JMPEg
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22/05/26 18:37, Adnrey Golovko wrote:
> [You don't often get email from andrey.golovko@gmail.com. Learn why this is
> important at https://aka.ms/LearnAboutSenderIdentification ]
>
>   Checked the codec driver path — it does clear hw_init on UNATTACHED
>   and re-runs tas_io_init() (which calls request_firmware_nowait) on
> the next 
>   ATTACHED. Problem is ATTACHED never comes. Bus log:
>
>     amd_sdw_manager.1: SCP_addrpage ignored for Slave 1
>     sdw-master-0-1: trf on Slave 1 failed:-5
>     sdw-master-0-1: PING status: 0x1
>
>   The peripherals don't ACK any SoundWire command after resume — not
> even SCP
>   page addressing, which is pre-firmware. RT721 (SDCA, separate codec
> driver)
>   is in the same state. So the codec is willing to re-download fw but the
>   chip is not on the wire to begin with. 

|Based on our current understanding, codec enumeration does not seem to occur
during the system-level resume sequence. It is likely that the codec attach
(slave status change) interrupt is not being asserted. Could you please try
reproducing the issue using the attached debug configuration file and share the
corresponding dmesg logs? Copy the provided soundwire.conf file to the
/etc/modprobe.d/ directory before testing. Additionally, please log a ticket in
the kernel Bugzilla to help track and investigate this issue further. |

+ AMD Audio team

Thanks,
Vijendar

>
>   No GPIO/_RST in DSDT under SDWC, no FLR on the ACP PCI function. Looks
>   board/SMU level rather than codec — but maybe TI knows a SoundWire-side
>   recovery sequence that wakes the chip from this state?
>
> On 5/22/26 16:01, Mark Brown wrote:
>> On Fri, May 22, 2026 at 03:54:06PM +0300, Adnrey Golovko wrote:
>>>    SoundWire slaves lose firmware after s2idle on AMD ACP7.0 (Strix Halo) —
>>>    TAS2783 cannot resume
>> Adding the TI people (not deleting context for their benefit), my first
>> thought here is that this is the CODEC driver not redownloading firmware
>> after power loss.
>>
>>>    ## Summary
>>>
>>>    On ASUS ProArt PX13 HN7306EAC (AMD Ryzen AI MAX+ 395, Strix Halo) with
>>> ACP  PCI
>>>    rev  0x70  (ACP7.0), entering  s2idle  for as little as 3.8 seconds causes
>>> the
>>>    Realtek RT721 SDCA and TI TAS2783 SoundWire peripherals to enter an
>>>    unrecoverable state. After resume,  Peripheral status = unattached  and
>>> the
>>>    TAS2783 driver reports  error playback without fw download . No
>>> software-only
>>>    recovery is possible — driver re-bind, PCI hot remove+rescan, and module
>>> reload
>>>    all fail. Only a full machine reboot restores audio.
>>>
>>>    Filed because all available fixes in current upstream/-next are already
>>> applied
>>>    and do not address the root cause.
>>>
>>>    ## Hardware
>>>
>>>      DMI:               ASUS HN7306EAC, BIOS HN7306EAC.307 (2026-01-27)
>>>      CPU:               AMD Ryzen AI MAX+ 395 w/ Radeon 8060S (Strix Halo)
>>>      ACP PCI ID:        1022:15e2 rev 0x70  (sysfs: 0000:c4:00.5)
>>>      ACP driver:        snd_pci_ps
>>>      SoundWire link 1:  Realtek RT721 SDCA  (sdw:0:1:025d:0721:01)
>>>                         2× TI TAS2783        (sdw:0:1:0102:0000:01:8,
>>> ...:01:b)
>>>      TAS2783 firmware:  /lib/firmware/1714-1-{8,B}.bin  (extracted from
>>> Windows
>>>                         driver — ASUS does not ship to linux-firmware as of
>>> 2026-
>>>    05)
>>>      ACPI path:         \_SB.PCI0.GPPA.ACP.SDWC.SWM1
>>>
>>>    ## Kernel
>>>
>>>      Linux 7.1.0-rc3 + 3 backports:
>>>        c368dd5cbd61 soundwire: don't program SDW_SCP_BUSCLOCK_SCALE on a
>>> unattached
>>>    Peripheral
>>>        9a0afdd19a01 soundwire: stream: sdw_stream_remove_slave(): Check
>>> stream is
>>>    valid
>>>        e09bbf11b53f HID: input: delete hid_battery on disconnect (unrelated)
>>>
>>>     git log v7.1-rc3..v7.1-rc4 -- sound/soc/amd drivers/soundwire/ is empty.
>>>     broonie/sound#for-next  adds  sound/soc/amd/acp7x/  (ACP7.D/E/F, rev
>>> 0x7D-0x7F)
>>>    —
>>>    not applicable to ACP7.0.
>>>
>>>    ## DSDT / ACPI properties
>>>
>>>    SWM1 (active link) has:
>>>
>>>      amd-sdw-power-mode                    = 0x02  (AMD_SDW_POWER_OFF_MODE)
>>>      amd-sdw-enable                        = 1
>>>      amd-sdw-wakeup-enable                 = 1
>>>      mipi-sdw-clock-stop-mode0-supported   = 1
>>>      mipi-sdw-clock-stop-mode1-supported   = 0
>>>
>>>    No  _PS0 / _PS3 / _PR0 / _PR3  methods for \_SB.PCI0.GPPA.ACP.SDWC  or its
>>>     SWM0 / SWM1  children, no  _RST  method.
>>>
>>>    With  power_mode_mask = AMD_SDW_POWER_OFF_MODE ,
>>>    drivers/soundwire/amd_manager.c
>>>    correctly takes the full deinit/init path: amd_deinit_sdw_manager()  on
>>>    suspend,
>>>     sdw_clear_slave_status(SDW_UNATTACH_REQUEST_MASTER_RESET) +
>>>    amd_sdw_clk_init_ctrl +
>>>    amd_init_sdw_manager + amd_enable_sdw_manager + amd_sdw_set_frameshape  on
>>>    resume.
>>>     snd_acp70_resume()  in  sound/soc/amd/ps/ps-common.c  correctly takes the
>>> slow
>>>    path ( acp_hw_init  + pad-keeper restore) because  sdw_en_stat  is cleared
>>>    during
>>>    suspend by  amd_deinit_sdw_manager . So the driver-level resume code paths
>>> are
>>>    exercised correctly. The failure is at a lower level.
>>>
>>>    ## Reproducer
>>>
>>>      # Cold boot, audio works.
>>>      $ aplay -l | grep amdsoundwire
>>>      card 1: amdsoundwire ... SDW1-PIN1-PLAYBACK-SmartAmp multicodec-2 []
>>>      $ speaker-test -D plughw:1,2 -c2  # → works
>>>
>>>      # One s2idle cycle:
>>>      $ systemctl suspend
>>>      # (3.8 sec residency in s0i3, /sys/kernel/debug/amd_pmc/s0ix_stats
>>> confirms)
>>>      # (woken by i2c-ASCF1A03:00 touchpad wake event, but issue reproduces
>>> with
>>>      #  any wake source including RTC alarm)
>>>
>>>      # After resume:
>>>      $ speaker-test -D plughw:1,2 -c2
>>>      Setting of hwparams failed: Invalid argument
>>>
>>>    ## Evidence — kernel trace
>>>
>>>     /sys/power/suspend_stats :
>>>
>>>      last_failed_dev    = sdw:0:1:0102:0000:01:b
>>>      last_failed_step   = resume
>>>      last_hw_sleep      = 3825561   (µs)
>>>
>>>     journalctl -k  around suspend/resume:
>>>
>>>      PM: suspend entry (s2idle)
>>>      Freezing user space processes completed
>>>      printk: Suspending console(s)
>>>      ACPI: EC: interrupt blocked
>>>      ACPI: EC: interrupt unblocked
>>>      slave-tas2783 sdw:0:1:0102:0000:01:8: PM: dpm_run_callback():
>>>    acpi_subsys_resume returns -110
>>>      slave-tas2783 sdw:0:1:0102:0000:01:8: PM: failed to resume: error -110
>>>      slave-tas2783 sdw:0:1:0102:0000:01:b: PM: dpm_run_callback():
>>>    acpi_subsys_resume returns -110
>>>      slave-tas2783 sdw:0:1:0102:0000:01:b: PM: failed to resume: error -110
>>>      PM: suspend exit
>>>      snd_pci_ps 0000:c4:00.5: AMD-Vi: Event logged [IO_PAGE_FAULT
>>>         domain=0x0018 address=0xfffffffffffffffc flags=0x0030]
>>>
>>>    The  0xfffffffffffffffc  IOMMU fault address is the sentinel returned when
>>> PCI
>>>    config reads return  0xff..ff , i.e., ACP is in an inaccessible state at
>>> the
>>>    moment of DMA.
>>>
>>>    Detailed resume-path trace (excerpts):
>>>
>>>      amd_sdw_manager amd_sdw_manager.1: SCP_addrpage ignored for Slave 1
>>>      soundwire sdw-master-0-1: trf on Slave 1 failed:-5 write addr 8089 count
>>> 0
>>>      amd_sdw amd_sdw: ASoC: PRE_PMD: tas2783-2 FU21 event failed: -5
>>>      amd_sdw_manager amd_sdw_manager.1: SCP_addrpage ignored for Slave 2
>>>      soundwire sdw-master-0-1: trf on Slave 2 failed:-5 write addr 8089 count
>>> 0
>>>      rt721-sdca sdw:0:1:025d:0721:01: Initialization not complete, timed out
>>>      amd_sdw_manager amd_sdw_manager.1: slave_stat:0x1
>>>      soundwire sdw-master-0-1: PING status: 0x1
>>>      amd_sdw_manager amd_sdw_manager.1: SDW1 clock stop successful
>>>      amd_sdw_manager amd_sdw_manager.1: AMD_SDW_DEVICE_STATE:0xc
>>>      amd_sdw_manager amd_sdw_manager.1: mclk 24000000 max 12000000 row 50 col
>>> 10
>>>    frame_rate:48000
>>>      amd_sdw_manager amd_sdw_manager.1: AMD_SDW_DEVICE_STATE:0x0
>>>      snd_pci_ps 0000:c4:00.5: AMD-Vi: Event logged [IO_PAGE_FAULT ...
>>>    0xfffffffffffffffc ...]
>>>      slave-tas2783 sdw:0:1:0102:0000:01:8: resume: initialization timed out
>>>      soundwire sdw-master-0-1: PING status: 0x1
>>>
>>>    Note  PING status: 0x1  — the SoundWire PING-frame status returns the same
>>> low
>>>    value before and after the manager attempts to re-enumerate. Peripherals
>>> are
>>>    not responding on the wire even though clock is running.
>>>
>>>    Steady-state symptoms after the resume path completes (slave drivers
>>> loaded,
>>>    codec link tries to prepare PCM):
>>>
>>>      slave-tas2783 sdw:0:1:0102:0000:01:8: Peripheral status = unattached
>>>      slave-tas2783 sdw:0:1:0102:0000:01:8: error playback without fw download
>>>      slave-tas2783 sdw:0:1:0102:0000:01:8: ASoC error (-22): at
>>>    snd_soc_dai_hw_params()
>>>      soundwire sdw-master-0-1: Program transport params failed: -61
>>>      amd_sdw_manager amd_sdw_manager.1: command is ignored for Slave 2
>>>
>>>     command is ignored for Slave N  from  amd_sdw_fill_msg_resp() indicates
>>> the
>>>    SoundWire bus sees no ACK for any peripheral command — the peripherals are
>>> not
>>>    responding on the wire.
>>>
>>>    The  error playback without fw download  from  tas2783-sdw.c  is the
>>> giveaway —
>>>    the TAS2783 driver explicitly knows its firmware blob is no longer loaded.
>>>    During cold boot the firmware is downloaded after slave attach; after
>>> s0i3, the
>>>    slave never reaches attached state, so the firmware download path is never
>>>    re-entered.
>>>
>>>    ## Recovery attempts — ALL FAIL
>>>
>>>    Attempt                                │Result
>>> ───────────────────────────────────────┼────────────────────────────────────────
>>>
>>>    Stop PipeWire,  rmmod snd_soc_tas2783_…│ EBUSY  — kernel ALSA-SOC retry
>>> loop ho…
>>>     echo 0000:c4:00.5 > /sys/bus/pci/driv…│Probe replays cleanly ( probe
>>> complete …
>>>    PCIe Function-Level Reset ( /sys/.../r…│File does not exist — ACP does not
>>> adve…
>>>     echo 1 > /sys/bus/pci/devices/0000:c4…│Same as unbind+bind — slaves
>>> enumerate …
>>>    pm-utils system-sleep hook running the…│Same
>>>    BIOS update 305 → 307                  │No change
>>>
>>>    This is consistent with the underlying SMU behaviour on Strix Halo s0i3:
>>>    the ACP power island is power-gated, peripherals connected to the
>>> SoundWire
>>>    pads lose state including firmware. There is no software path from the OS
>>>    to re-power the slave chips short of a full machine reboot.
>>>
>>>    ## What I think the bug is
>>>
>>>    Either (a) the AMD SMU should hold the ACP power island powered during
>>> s0i3
>>>    when SoundWire link is active and peripherals require firmware (BIOS or
>>> SMU
>>>    firmware change), or (b) the kernel needs an explicit recovery path that:
>>>
>>>    1. Detects in  snd_acp70_resume()  that ACP was actually power-gated (e.g.
>>>    by reading a sentinel register that survives only across non-power-gated
>>>    suspend).
>>>    2. If power-gated, performs a full peripheral-chip reset (some
>>> platform-specific
>>>    GPIO toggle? secondary bus reset on the ACP's PCIe link?) before the SDW
>>>    manager attempts to re-enumerate.
>>>    3. Triggers each slave driver's firmware-download path on resume.
>>>
>>>    I cannot find any GPIO under  \_SB.PCI0.GPPA.ACP  in DSDT that would let
>>> the
>>>    kernel toggle slave chip power. Is there an SMU command available via
>>>     amd_pmc  that would force a re-power of the ACP island? Or is this a BIOS
>>>    deficiency on this specific HN7306EAC firmware?
>>>
>>>    ## Workaround currently used
>>>
>>>     suspend  is disabled in GNOME.  hibernate  (S4) works because it goes
>>> through
>>>    a full cold-boot path.
>>>
>>>    ## Asks
>>>
>>>    1. Is there a known software path to recover SoundWire peripherals after
>>>    ACP power-gate that I missed?
>>>    2. If not — would AMD consider adding either a full ACP island re-power
>>>    sequence in  snd_acp70_resume()  or a peripheral-reset hook that
>>>    slave drivers can call from their resume path?
>>>    3. Should ASUS BIOS be updated to either advertise  _RST  for SDW nodes
>>>    or prevent SMU from power-gating ACP during s0i3 when SDW is active?
>>>    (Happy to file with ASUS Linux team if you can confirm direction.)
>>>
>>>    I have full DSDT/SSDT decode, complete dmesg traces, and a reproducer
>>>    environment if more data is helpful. Source tree with all backports at
>>>     https://github.com/...  (will set up on request).
>>>
>>>    Tested on  7.1.0-rc3  + backports above. Confirmed same failure on stock
>>>     7.1.0-070100rc3-generic  from kernel.ubuntu.com/mainline/v7.1-rc3/ .
>>>
>>>    Thanks,
>>>    Andrey Golovko
>>>          Device (SDWC)
>>>          {
>>>              Name (_ADR, 0x05)  // _ADR: Address
>>>              Name (_DSD, Package (0x04)  // _DSD: Device-Specific Data
>>>              {
>>>                  ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301") /* Device
>>> Properties for _DSD */,
>>>                  Package (0x03)
>>>                  {
>>>                      Package (0x02)
>>>                      {
>>>                          "mipi-sdw-sw-interface-revision",
>>>                          0x00010000
>>>                      },
>>>
>>>                      Package (0x02)
>>>                      {
>>>                          "mipi-sdw-manager-list",
>>>                          0x03
>>>                      },
>>>
>>>                      Package (0x02)
>>>                      {
>>>                          "amd-sdw-aggregation-master-id",
>>>                          0xFFFF
>>>                      }
>>>                  },
>>>
>>>                  ToUUID ("dbb8e3e6-5886-4ba6-8795-1319f52a966b") /*
>>> Hierarchical Data Extension */,
>>>                  Package (0x02)
>>>                  {
>>>                      Package (0x02)
>>>                      {
>>>                          "mipi-sdw-link-0-subproperties",
>>>                          "SWM0"
>>>                      },
>>>
>>>                      Package (0x02)
>>>                      {
>>>                          "mipi-sdw-link-1-subproperties",
>>>                          "SWM1"
>>>                      }
>>>                  }
>>>              })
>>>              Name (SWM0, Package (0x02)
>>>              {
>>>                  ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301") /* Device
>>> Properties for _DSD */,
>>>                  Package (0x0E)
>>>                  {
>>>                      Package (0x02)
>>>                      {
>>>
>>> --- SWM1 properties (active link with RT721 + 2× TAS2783) ---
>>>              Name (SWM1, Package (0x02)
>>>              {
>>>                  ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301") /* Device
>>> Properties for _DSD */,
>>>                  Package (0x0E)
>>>                  {
>>>                      Package (0x02)
>>>                      {
>>>                          "mipi-sdw-sw-interface-revision",
>>>                          0x00010000
>>>                      },
>>>
>>>                      Package (0x02)
>>>                      {
>>>                          "mipi-sdw-clock-stop-mode0-supported",
>>>                          One
>>>                      },
>>>
>>>                      Package (0x02)
>>>                      {
>>>                          "mipi-sdw-clock-stop-mode1-supported",
>>>                          Zero
>>>                      },
>>>
>>>                      Package (0x02)
>>>                      {
>>>                          "mipi-sdw-max-clock-frequency",
>>>                          0x00B71B00
>>>                      },
>>>
>>>                      Package (0x02)
>>>                      {
>>>                          "mipi-sdw-supported-clock-scales",
>>>                          Zero
>>>                      },
>>>
>>>                      Package (0x02)
>>>                      {
>>>                          "mipi-sdw-default-frame-rate",
>>>                          0xBB80
>>>                      },
>>>
>>>                      Package (0x02)
>>>                      {
>>>                          "mipi-sdw-default-frame-row-size",
>>>                          0x32
>>>                      },
>>>
>>>                      Package (0x02)
>>>                      {
>>>                          "mipi-sdw-default-frame-col-size",
>>>                          0x0A
>>>                      },
>>>
>>>                      Package (0x02)
>>>                      {
>>>                          "mipi-sdw-dynamic-frame-shape",
>>>                          Zero
>>>                      },
>>>
>>>                      Package (0x02)
>>>                      {
>>>                          "mipi-sdw-command-error-threshold",
>>>                          Zero
>>>                      },
>>>
>>>                      Package (0x02)
>>>                      {
>>>                          "amd-sdw-enable",
>>>                          One
>>>                      },
>>>
>>>                      Package (0x02)
>>>                      {
>>>                          "amd-sdw-wakeup-enable",
>>>                          One
>>>                      },
>>>
>>>                      Package (0x02)
>>>                      {
>>>                          "amd-sdw-power-mode",
>>>                          0x02
>>>                      },
>>>
>>>                      Package (0x02)
>>>                      {
>>>                          "amd-sdw-multi-lane-enable",
>>>                          One
>>>                      }
>>>                  }
>>>              })
>>> # System info
>>>
>>> ## DMI
>>> ASUS
>>> ProArt PX13 HN7306EAC
>>> ProArt PX13
>>> BIOS: American Megatrends International, LLC. HN7306EAC.307 01/27/2026
>>>
>>> ## CPU
>>> model name   : AMD RYZEN AI MAX+ 395 w/ Radeon 8060S
>>>
>>> ## Kernel
>>> Linux asus-px 7.1.0-rc3-px13fix #2 SMP PREEMPT_DYNAMIC Thu May 14 20:38:57
>>> MSK 2026 x86_64 GNU/Linux
>>>
>>> ## ACP PCI
>>> c4:00.5 Multimedia controller [0480]: Advanced Micro Devices, Inc. [AMD]
>>> Audio Coprocessor [1022:15e2] (rev 70)
>>> rev: 0x0x70
>>> driver: snd_pci_ps
>>>
>>> ## SoundWire devices
>>> sdw-master-0-0
>>> sdw-master-0-1
>>> sdw:0:1:0102:0000:01:8
>>> sdw:0:1:0102:0000:01:b
>>> sdw:0:1:025d:0721:01
>>> # Trace of one failing s2idle cycle (captured 2026-05-22)
>>>
>>> ## PM events
>>> May 22 15:10:43 asus-px kernel: PM: suspend entry (s2idle)
>>> May 22 15:11:05 asus-px kernel: Freezing user space processes
>>> May 22 15:11:05 asus-px kernel: Freezing user space processes completed
>>> (elapsed 0.001 seconds)
>>> May 22 15:11:05 asus-px kernel: Freezing remaining freezable tasks
>>> May 22 15:11:05 asus-px kernel: Freezing remaining freezable tasks completed
>>> (elapsed 0.000 seconds)
>>> May 22 15:11:05 asus-px kernel: printk: Suspending console(s) (use
>>> no_console_suspend to debug)
>>> May 22 15:11:05 asus-px kernel: ACPI: EC: interrupt blocked
>>> May 22 15:11:05 asus-px kernel: ACPI: EC: interrupt unblocked
>>> May 22 15:11:05 asus-px kernel: snd_pci_ps 0000:c4:00.5: AMD-Vi: Event
>>> logged [IO_PAGE_FAULT domain=0x0018 address=0xfffffffffffffffc flags=0x0030]
>>> May 22 15:11:05 asus-px kernel: slave-tas2783 sdw:0:1:0102:0000:01:8: PM:
>>> dpm_run_callback(): acpi_subsys_resume returns -110
>>> May 22 15:11:05 asus-px kernel: slave-tas2783 sdw:0:1:0102:0000:01:8: PM:
>>> failed to resume: error -110
>>> May 22 15:11:05 asus-px kernel: slave-tas2783 sdw:0:1:0102:0000:01:b: PM:
>>> dpm_run_callback(): acpi_subsys_resume returns -110
>>> May 22 15:11:05 asus-px kernel: slave-tas2783 sdw:0:1:0102:0000:01:b: PM:
>>> failed to resume: error -110
>>> May 22 15:11:05 asus-px kernel: PM: suspend exit
>>>
>>> ## Steady-state symptoms after resume (first 20 lines)
>>> May 22 15:11:05 asus-px kernel: amd_sdw_manager amd_sdw_manager.1:
>>> SCP_addrpage ignored for Slave 1
>>> May 22 15:11:05 asus-px kernel: soundwire sdw-master-0-1: trf on Slave 1
>>> failed:-5 write addr 8089 count 0
>>> May 22 15:11:05 asus-px kernel: amd_sdw amd_sdw: ASoC: PRE_PMD: tas2783-2
>>> FU21 event failed: -5
>>> May 22 15:11:05 asus-px kernel: amd_sdw_manager amd_sdw_manager.1:
>>> SCP_addrpage ignored for Slave 1
>>> May 22 15:11:05 asus-px kernel: soundwire sdw-master-0-1: trf on Slave 1
>>> failed:-5 write addr 8109 count 0
>>> May 22 15:11:05 asus-px kernel: amd_sdw amd_sdw: ASoC: PRE_PMD: tas2783-2
>>> FU23 event failed: -5
>>> May 22 15:11:05 asus-px kernel: amd_sdw_manager amd_sdw_manager.1:
>>> SCP_addrpage ignored for Slave 2
>>> May 22 15:11:05 asus-px kernel: soundwire sdw-master-0-1: trf on Slave 2
>>> failed:-5 write addr 8089 count 0
>>> May 22 15:11:05 asus-px kernel: amd_sdw amd_sdw: ASoC: PRE_PMD: tas2783-1
>>> FU21 event failed: -5
>>> May 22 15:11:05 asus-px kernel: amd_sdw_manager amd_sdw_manager.1:
>>> SCP_addrpage ignored for Slave 2
>>> May 22 15:11:05 asus-px kernel: soundwire sdw-master-0-1: trf on Slave 2
>>> failed:-5 write addr 8109 count 0
>>> May 22 15:11:05 asus-px kernel: amd_sdw amd_sdw: ASoC: PRE_PMD: tas2783-1
>>> FU23 event failed: -5
>>> May 22 15:11:05 asus-px kernel: rt721-sdca sdw:0:1:025d:0721:01:
>>> Initialization not complete, timed out
>>> May 22 15:11:05 asus-px kernel: amd_sdw_manager amd_sdw_manager.1:
>>> slave_stat:0x1
>>> May 22 15:11:05 asus-px kernel: soundwire sdw-master-0-1: PING status: 0x1
>>> May 22 15:11:05 asus-px kernel: amd_sdw_manager amd_sdw_manager.1: SDW1
>>> clock stop successful
>>> May 22 15:11:05 asus-px kernel: amd_sdw_manager amd_sdw_manager.1:
>>> AMD_SDW_DEVICE_STATE:0xc
>>> May 22 15:11:05 asus-px kernel: amd_sdw_manager amd_sdw_manager.1: mclk
>>> 24000000 max 12000000 row 50 col 10 frame_rate:48000
>>> May 22 15:11:05 asus-px kernel: amd_sdw_manager amd_sdw_manager.1:
>>> AMD_SDW_DEVICE_STATE:0x0
>>> May 22 15:11:05 asus-px kernel: snd_pci_ps 0000:c4:00.5: AMD-Vi: Event
>>> logged [IO_PAGE_FAULT domain=0x0018 address=0xfffffffffffffffc flags=0x0030]
>>> May 22 15:11:05 asus-px kernel: slave-tas2783 sdw:0:1:0102:0000:01:8:
>>> resume: initialization timed out
>>> May 22 15:11:05 asus-px kernel: amd_sdw_manager amd_sdw_manager.1:
>>> slave_stat:0x1
>>> May 22 15:11:05 asus-px kernel: soundwire sdw-master-0-1: PING status: 0x1
>>> May 22 15:11:05 asus-px kernel: slave-tas2783 sdw:0:1:0102:0000:01:8: PM:
>>> dpm_run_callback(): acpi_subsys_resume returns -110
>>> May 22 15:11:05 asus-px kernel: slave-tas2783 sdw:0:1:0102:0000:01:8: PM:
>>> failed to resume: error -110
>>>
>>> ## suspend_stats after failure
>>> last_failed_dev:  sdw:0:1:0102:0000:01:b
>>> last_failed_step: resume
>>> (captured 2026-05-22)

--------------YPeCIXxDOxfmdzcQMz8JMPEg
Content-Type: text/plain; charset=UTF-8; name="soundwire.conf"
Content-Disposition: attachment; filename="soundwire.conf"
Content-Transfer-Encoding: base64

b3B0aW9ucyBzbmRfc29jX3J0NzExX3NkY2EgZHluZGJnPStwDQpvcHRpb25zIHNuZF9zb2NfcnQ3
MTJfc2RjYSBkeW5kYmc9K3ANCm9wdGlvbnMgc25kX3NvY19ydDcyMV9zZGNhIGR5bmRiZz0rcA0K
b3B0aW9ucyBzbmRfc29jX3J0NzIyX3NkY2EgZHluZGJnPStwDQpvcHRpb25zIHNuZF9zb2NfcnQx
MzE2X3NkdyBkeW5kYmc9K3ANCm9wdGlvbnMgc25kX3NvY190YXMyNzgzX3NkdyBkeW5kYmc9K3AN
Cm9wdGlvbnMgc291bmR3aXJlX2dlbmVyaWNfYWxsb2NhdGlvbiBkeW5kYmc9K3ANCm9wdGlvbnMg
c291bmR3aXJlX2J1cyBkeW5kYmc9K3ANCm9wdGlvbnMgcmVnbWFwX3Nkd19tYnEgZHluZGJnPStw
DQpvcHRpb25zIHJlZ21hcF9zZHcgZHluZGJnPStwDQpvcHRpb25zIHNuZF9zb2NfcnQ3MTVfc2Rj
YSBkeW5kYmc9K3ANCm9wdGlvbnMgc25kX3NvY19jb3JlIGR5bmRiZz0rcA0Kb3B0aW9ucyBzbmRf
c29jX3Nkd191dGlscyBkeW5kYmc9K3ANCm9wdGlvbnMgc25kX3BjbSBkeW5kYmc9K3ANCm9wdGlv
bnMgc25kX3BjaV9wcyBkeW5kYmc9K3ANCm9wdGlvbnMgc25kX3BzX3Nkd19kbWEgZHluZGJnPStw
DQpvcHRpb25zIHNvdW5kd2lyZV9hbWQgZHluZGJnPStwDQpvcHRpb25zIHNuZF9hY3Bfc2R3X3Nv
Zl9tYWNoIGR5bmRiZz0rcA0Kb3B0aW9ucyBzbmRfYWNwX3Nkd19sZWdhY3lfbWFjaCBkeW5kYmc9
K3ANCm9wdGlvbnMgc25kX2FjcF9zZHdfbWFjaCBkeW5kYmc9K3ANCm9wdGlvbnMgc25kX3NvZl9w
Y2kgZHluZGJnPStwDQpvcHRpb25zIHNuZF9zb2YgZHluZGJnPStwDQpvcHRpb25zIHNuZF9zb2Zf
dXRpbHMgZHluZGJnPStwDQpvcHRpb25zIHNuZF9zb2Nfc2R3X3V0aWxzIGR5bmRiZz0rcA0Kb3B0
aW9ucyBzbmRfYWNwX2NvbmZpZyBkeW5kYmc9K3ANCg==

--------------YPeCIXxDOxfmdzcQMz8JMPEg--
