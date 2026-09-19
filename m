Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012022.outbound.protection.outlook.com [52.101.53.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C556A31B828
	for <linux-sound@vger.kernel.org>; Sat, 19 Sep 2026 10:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789814148; cv=fail; b=DnbHuKfywzTakH/7wZXVojEMpthpdSOB1tjYtnBu1HtOGM6r2uthfzW8pI7IaaNKVvAIw1tLKN4BSJ4mvwtIk2ARiyZsvVebf/z8a51bWts78RbHiXYMo9Ret3SjRbDp/vr+iaYCTt1bTb+04trGuEi+iku1fv+JvoYV6b5oxvA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789814148; c=relaxed/simple;
	bh=aMLSZkZXJTEPW0FjWfGxdDv5vCEy+fXJRq/4Bp/mdjI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XEQ7Em9Rwdu3A1LCJlktmPdsWDoQnMLBG8OuHYLeEUkIS3oBZHT5y9zOdYBxmm9eWG6yx2+0m2HbaOQ8dcmQMAtcO0NSETy6WBoUB6Iud6Ldnc7JP/h8jkP6pDgfWZv3jVTLK20foAhsyO0vXaeowDaUPUHokSUEJQmgXVW5Ov0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Mb6lYP24; arc=fail smtp.client-ip=52.101.53.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Mb6lYP24"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x8GV/M4azdjmf9oNf4ESihlBNnmntHAd1OnRtvDOn0ENa0O7mjwP/r8kzG7/F6BLNyJCW5V/SlhNZsOKVDyvEMYkBk13E3w0jGY9OeRN+VrQ8eZXeHu7ub9dMDh9Hqg4tvnAMkL/X2Sbun9+u44YqnaYELBLfdOLzgKk+m0mkESTYFeD7RWIA8Lc3DB/U7VrWOY2QHmp80kQi8thu9nNwzT2OD7OBqyvBAAwCrEx67jooXf6Y5xn9Hq/2ZbPVYH8zmdBccZodL3MznFS8SWJiERRtkPFFPlKHAPEtXAL1ysm7djFhcC20ymubHBKPdzKSyL80G7OLsgAVTCRI4OI9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GodHC4m1ZEauSjppZcrnIzsM5EgNm87ZLrKdYp8UjvE=;
 b=arJI1kd+Pcu133UdMf/MYr1wmJTXzO2/CAZ4GQqgU0zlOPD3gGoG6Cnry0pKhHBbJSE3MkSJCXcrXOamGAUC/XV1SuC4wSikMVg2BXw/pKVcmoWxHd513gR0ebfwNvbJ95AZOAjkn3tiZn1VAR+0XyCYqdYYnV01xbCu5IjpWLtV1cRA6Jn7VcwJPDRr1ROoxlfr+JssTGw6qgEpwHGL8N6F5eWzIl1o8uzsDX5ZT+hG62Q3fq9DYDYJ01BKFvJUwP6Tnn7cGWT1jRipRVx71Q4BfA4w0w54cQVpKg7Fe4kdXJU+vHgkxx8tMR9cTWzzhbBZHAC6K0y5nS1Vw2JFvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GodHC4m1ZEauSjppZcrnIzsM5EgNm87ZLrKdYp8UjvE=;
 b=Mb6lYP24tkQwvOpqrHnC+hexsZXt03o30UB8Xth7L6yex9YYIYG5rQNr0RibWSGyPZWtc3Fcm5xvIiMP99cVKVoxnC+0ndyviQWEpI1pNEVwBUxftxvl5RGbKu1+jUWGIwsFSMLb7vapWjBCWlGrxK0SLhnbJoEJD9fM+PqzmVM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS2PR12MB9567.namprd12.prod.outlook.com (2603:10b6:8:27c::8) by
 DM4PR12MB6613.namprd12.prod.outlook.com (2603:10b6:8:b8::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.13; Sat, 19 Sep 2026 10:35:41 +0000
Received: from DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5]) by DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5%4]) with mapi id 15.21.0428.014; Sat, 19 Sep 2026
 10:35:41 +0000
Message-ID: <feabec4f-b654-41ea-8732-65c5457d5155@amd.com>
Date: Sat, 19 Sep 2026 16:04:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] ASoC: amd: acp70: Acer Nitro AN16S-61 falls back to
 acp-pdm-mach, which streams invalid PCM (no working internal mic)
To: hazar sahmeran acikbas <hazaracikbas@gmail.com>,
 venkataprasad.potturu@amd.com
Cc: linux-sound@vger.kernel.org,
 "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>,
 Syed Saba Kareem <syed.sabakareem@amd.com>,
 Mario Limonciello <Mario.Limonciello@amd.com>
References: <CACTnKN6KSPjo0xUh=LuVEEwU9bx5CqnK4k1gVyKrEXDfa_tEUQ@mail.gmail.com>
 <CACTnKN5-36P3B1vjtdzod3qB7eqCD8saNhV-EWUqvg5goGg49A@mail.gmail.com>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <CACTnKN5-36P3B1vjtdzod3qB7eqCD8saNhV-EWUqvg5goGg49A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2P287CA0002.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:21b::10) To DS2PR12MB9567.namprd12.prod.outlook.com
 (2603:10b6:8:27c::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9567:EE_|DM4PR12MB6613:EE_
X-MS-Office365-Filtering-Correlation-Id: 12146237-cf0b-43fe-789d-08df1639c0d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|10067099003|6133799003|3023799007|11063799006|18002099003|22082099003|5023799004|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	F6G4f3yKkI6Dq4weK6/6mwa0khgUlotCdiOtYWkdFCIPX2dX47gke3YIPCCZu4BbzBFxBc66Rfmopv3UJP9Aj6rj+JXolX54ZFCnpDggxETwrP0B+tLYnCxfF0bkKoDFM8+F6slLAI/BGlSofNrSocpQQ68ckU7LmVOOHCaGQVX6nh1IUlXYopDofRGiDblH0BMo2OsYOFddt8mta2GADIebZ1yPTYreKMNmc/Lr8jTzdzvbMxh6du9oWgydNGtYhaJP6wZCf2mZxZa82rx6JxuCGYFHUzv+xVnShCGU2JrftTo0mw/gWnVzrIya3Fp3tJFVAISjkbuvvaHbb+R7jtoxe+95RR3AsSZEm+DRL31uaOt8MzzXrk5qeC+QJgBtPICz7hInqKx3QFz0MQ3tEUSTwsdZE7ER4kYV5qBW39oFwSQ/dVvB4+/PIBspCTAsTiDKAP274nLvmKiLobEjwb1pT6tWDMT0rF+uzxAnfN2ga9uEGqsy9AV+b5YFlzLEmvjIcXKRITXv6fUOqhnGC1vfutsB7j4gA4YEX/i7y8+BRZS5jxFUbCORBs+gJP7LMAVsSpUrIwXUuJiMOsvbM68FMNC1Uv+F9xKOW9TwvBGJGYY7risTcYxnQ47Onx991SyfzgZvhz7PIAYAw1D5xdz9Hjc+lZr3QMm/2kgELVY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9567.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(10067099003)(6133799003)(3023799007)(11063799006)(18002099003)(22082099003)(5023799004)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SlFxbVJVQWl0YzNXdEdPVm1zeWR2YWpweVZaRVc1WW1LKzJ5cjVVblpCT0R4?=
 =?utf-8?B?K29OMFJHdEsrblczZXpXaHpMcGVSNVdxaTF2ZElwRzhaWkVDenZ0ZVJ0ZFhG?=
 =?utf-8?B?bXVXQ0s1VEcxMHFKUzZ0alk3bkpYL0h4VkxRUDlWTUxEUnRQY1ZtaHV1SDJL?=
 =?utf-8?B?dHNELzNxcndRWnVOYThacWYxbG5Td1VrUDBvT1RqcDNrNmZOYlZlZFRORS9T?=
 =?utf-8?B?T2xaZnY2Vy9nck5TZGZaMWJVMUxSR2cyRm9ZUVc2b3BqVGMxcU1QK3QvaWFE?=
 =?utf-8?B?blV2cjBIQmZKR3poaG1SRkl0QzM0VmxicFZoOEVpUVdnbG1VZG1UUklxMmZT?=
 =?utf-8?B?SGRBcUpSQ1IzZFBidTVjYmoxbm43ZDJDNDV3SXpUeWVlb0RMaHIzaEpSRDhs?=
 =?utf-8?B?MlNMYU1pd0Zsa2JJUjR3WWxvcWdlNy9nazRoQm84SEx5eWxsejNJWXdrams1?=
 =?utf-8?B?RTB3M2xhM1lPWGwwcUlJcHJ0Mm84OHZpcThQOS9Kb3VLTEhobUZwU1BLWlVD?=
 =?utf-8?B?M3JyZXVqRkJkbHdqR01hQlZiZGpXNlpMY0c5dVhZK2NYV3FFUmdkUkt5VW1L?=
 =?utf-8?B?ZktCUXBHc3Z3ME51RmQxZGVFNm83YlJPcFowRHVuQkVPalM2ZmNsMi9IWWJx?=
 =?utf-8?B?TTRsUWVqU0hqOUhzV21taGJOdnZHcVczbXdXdi9uTmZZZ05PTldlR1ErYjkr?=
 =?utf-8?B?eGNkYk9OSm5oa2FmTFFWZml3dFVyczFNL2JvRjI5V01HczRIQUJaaFR2RE4r?=
 =?utf-8?B?V0dNcTIrcUdDMXFoVnpLcG5qcWJwSG9MV00xNTk4Z0w2Ny9yNW5pRjI0ekpO?=
 =?utf-8?B?MlFTb3hOaHhtUlh3Q0xTSTE4VURQYVVHUUJDbTRTY0FMWEdHbFhIcW1EaVdY?=
 =?utf-8?B?UnlvdGRmRjRoK3pEZWpjL2JlOXBFRnlnd0s0UnFqZmtIN3Z1OFFlK3ZVUllk?=
 =?utf-8?B?UGJGL3VmYmNvOGNjQ3JhNWRtekFGdlhQdWhWNzhkTGZmVTJWK1l2NXVFNUFL?=
 =?utf-8?B?cEJOT2RVVURvM0dyeUtucEVrZEpveDYvZm14RG4vWUJHUjBOSXlnTFFqUTJa?=
 =?utf-8?B?WFN0VEhaYkRncG9iM3EzV2NrS25ZWXpjTzBRaUgyTEZrY2txMHNaNGgwZHI4?=
 =?utf-8?B?cGRZUEJNVTBVdTJXZm51VUlndG5FbWJVeEdoTG4yU1B5RU94TWxJRzkwbDg0?=
 =?utf-8?B?aDUxUG9WbUMwSEVVSUVYUHZ5bUpyemtjRjkrbmpHY0N2NUQxTUxMQmhaYVQz?=
 =?utf-8?B?MUVybHBXYXk2eXV5cmMwbmlZaEI4a0dEYVNjQ1hOR0RwbzIrWFdKRU10blE3?=
 =?utf-8?B?T0VjRGpKNjd0bkd5NlhPWDM1UUp0ZjNLWitZQjNkcUdTRFRheTR5am5aTGxF?=
 =?utf-8?B?RWlHblZTVjVXL2N1QWxsSDRRSmpsWDJqdGJ5VG9KeEttM0FPWFdQa21UdWNs?=
 =?utf-8?B?Q1VmUDRaY3RlSjNOWWtVZTdwdlVBT0NRMldJUGVzaG1jSks3aEtndmwwQUlm?=
 =?utf-8?B?REo1WVFwUHEzaS96VVkwQXM4WTdVRjVSdGs4K0d0YXA3Ukl3ajBrYmpRVUVU?=
 =?utf-8?B?VGU5ZDc1bTNvZGJDbjEyNW5JUGMrT2d5S0NtT1N5c0Z2T253K2w3YzllVTFz?=
 =?utf-8?B?UjhXaS9UWHY2UFNlUXhwSWJrckIrb0M3ckFuSENPVnNNUWNtSExBV0tsdnBs?=
 =?utf-8?B?MU1iSVFRRFBidEpGLzh6RGZRN0M0aStFbWRVN0hnMUZpejNWa0hmTSt0QkxK?=
 =?utf-8?B?T0VrVnl5Y3FtK3dLVTBmTTl2Q2M1QWttaHFpQVRrQURTVjZ3a2RkWFpVays5?=
 =?utf-8?B?ZnBya2ZEalJUdVplY2JMekhuOU5BS2lrV3lFb3NiT242YmpkWWJKSGdtOWNu?=
 =?utf-8?B?Z1BaNEJJTXIzWW1hdXMxUS9FNHJyYzR4OGc4aTFyajc1eEQxUXNaMlFYVWhI?=
 =?utf-8?B?SFQwaXh2QnFmQ3l2ME1WVmpZNHZuNUh2UmdrVEUrQUxkbm5HU1lEa0dmWit5?=
 =?utf-8?B?MEhEUVhLL2lwSmV1dExLcWtEa3RIKzF1QzNjUG1acXozVTVmL0JsSUJSNG1D?=
 =?utf-8?B?ZUxUMmR1Qnk3QjBNSGNqbU00UVRDNEFkRW9PZTB0S1lBc2laaHB0VGJBWk9Z?=
 =?utf-8?B?UEtkM2xZcFVURlF0VDFwUFdMZXVpQzZvMlp6YkVLcEoxb2x0aVNBdDRCeUZa?=
 =?utf-8?B?ajJWc2FhVGhVTzRLZEVzUGNSa2xTZ2E5V0p4TDNtRXhFajkzQmZxSENvMFA0?=
 =?utf-8?B?S0hrYll5a2IvbS9OcU01OWFzekcxeFhKQjVBVTlxTlA4bmdOUHZFYmg0b3hT?=
 =?utf-8?B?M2ZrQ1dIMEdybGEyVlhJc3dFbmZoVEZDRnp5OHovMnJrQmFBK0txUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12146237-cf0b-43fe-789d-08df1639c0d5
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9567.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2026 10:35:41.7389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mkgVd2GuorYBDP2gu65+mRXkmTA3W15FfQqS2V2d+ZC1/dTvk7IE0ZjVuyMNpWa8RIdJLeEM+nxZa2Ydl8qn1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6613



On 9/19/26 14:52, hazar sahmeran acikbas wrote:
> [You don't often get email from hazaracikbas@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> Following up with one new data point that narrows this down.
>
> The internal microphone array works correctly under Windows on this same
> machine, with stock vendor drivers and no hardware or firmware changes
> between the two tests (same BIOS V1.53). So the DMICs are physically
> present and functional, and the EC is not holding them in a muted state.
>
> That rules out the two non-software explanations I could not exclude from
> Linux alone, and I think confirms this is purely a missing/incorrect
> configuration on the Linux side rather than a hardware or firmware fault.
>
> Still reproducing, unchanged, on newer kernels:
>
>    7.2.0-1-cachyos  (original report)
>    7.2.4-1-cachyos
>    7.2.6-1-cachyos  (current)
>
> with linux-firmware now at 20260916. The ACP70 DMI config quirk table in
> snd_acp_config continues to contain only the ASUS HN7306EA entry, and the
> capture behaviour is bit-for-bit what I described originally: the
> acp-pdm-mach capture device opens and streams a full-scale square wave at
> Fs/2 that collapses to an INT_MIN rail, and both internal DMIC pins
> declared on the ALC245 are silent at maximum gain.
>
> The open question from my original report stands: what a quirk entry for
> this board should actually select, given there is no SoundWire codec here
> and the ALC245's declared internal DMIC pins produce nothing.
>
> I am happy to run anything that would help answer that -- debug patches,
> printks in the ACP70 config/match path, ACP register dumps, ACPI table
> dumps (acpidump/iasl output for the ACP device's _DSD), or alsa-info.sh
> output. Just tell me what would be most useful and I will turn it around
> quickly.
++

Could you please log a bugzilla ticket including acpi dump, dmi decode
information along with alsa info output?

Thanks,
Vijendar
>
> Thanks,
> Hazar
>
> hazar sahmeran acikbas <hazaracikbas@gmail.com>, 29 Ağu 2026 Cmt,
> 23:35 tarihinde şunu yazdı:
>> Hello,
>>
>> On an Acer Nitro AN16S-61 (ACP 7.0, 1022:15e2 rev 70) there is no working
>> internal microphone under Linux. The board has no entry in the ACP70 DMI
>> config quirk table in snd_acp_config, so it falls through to the generic
>> acp-pdm-mach machine driver. That driver creates a capture device which
>> opens and streams without error, but the data is not PCM audio.
>>
>> This differs from other reported ACP 7.0 machines (ASUS ROG Flow Z13, HP
>> Omen 16-ap0xxx) where no PDM capture device is created at all. Here
>> enumeration, board match and PCM open all succeed; only the data is wrong.
>>
>> Hardware
>> --------
>> DMI  sys_vendor      Acer
>>       product_name    Nitro AN16S-61
>>       product_family  Acer Nitro 16S AI
>>       board_vendor    SXP
>>       board_name      EV3_SKF
>>       bios_version    V1.53  (03/06/2026)
>>
>> ACP (Audio Coprocessor)  1022:15e2 rev 70, subsystem 1025:1874
>> HD Audio Controller      1022:15e3, subsystem 1025:1874
>> Analog codec             Realtek ALC245 (10ec:0245), codec SSID 0x10251874
>>
>> There is no SoundWire codec on this board.
>>
>> Environment
>> -----------
>> Kernel          7.2.0-1-cachyos (x86_64)
>> sof-firmware    2025.12.2
>> linux-firmware  20260622
>> alsa-ucm-conf   1.2.16.1
>> Userspace       PipeWire/WirePlumber, default config
>>
>> Legacy ACP path is active; SOF is not bound (no /sys/kernel/debug/sof).
>> snd_sof_amd_acp70 is loaded but users=0.
>>
>> Binding chain (all of this succeeds)
>> ------------------------------------
>>    snd_acp_pci  ->  PCI 0000:64:00.5
>>    ACPI-based match via snd_amd_acpi_mach
>>    ->  platform devices acp_asoc_acp70.0 and acp-pdm-mach
>>
>> Card longname is correctly derived from DMI:
>>
>>    SXP-NitroAN16S_61-V1.53-EV3_SKF
>>
>> The kernel log is silent on ACP apart from one line:
>>
>>    snd_acp_pci 0000:64:00.5: enabling device (0000 -> 0002)
>>
>> No probe errors or warnings. Card 3 registers zero ALSA controls --
>> "amixer -c 3 controls" and "amixer -c 3 scontrols" both return nothing,
>> so there is no PDM gain or enable control of any kind.
>>
>> Reproduce
>> ---------
>>    $ arecord -l
>>    card 3: acppdmmach [acp-pdm-mach], device 0: DMIC capture dmic-hifi-0 []
>>
>>    $ arecord -D plughw:3,0 -f S32_LE -c 2 -r 48000 -d 3 /tmp/dmic.wav
>>
>> Then inspect the samples:
>>
>>    $ python3 -c "
>>    import struct, collections
>>    d = open('/tmp/dmic.wav','rb').read()[44:]
>>    n = len(d)//4
>>    s = struct.unpack('<%di' % n, d[:n*4])
>>    c = collections.Counter(s)
>>    print('samples', n, 'min', min(s), 'max', max(s), 'distinct', len(c))
>>    print('first 16', s[:16])
>>    "
>>
>> Actual result
>> -------------
>> A 3-second capture (288000 stereo S32_LE samples) contains only FOUR
>> distinct sample values:
>>
>>    min = -2147483648, max = +2147483647, distinct = 4
>>    287956 of 288000 samples (99.98%) are exactly INT_MIN
>>
>> The opening frames are a regular alternating pattern:
>>
>>    -2147483648, -2147483648, +2147483647, +2147483647, -2147483648, ...
>>
>> i.e. a full-scale square wave at Fs/2, which then collapses to a constant
>> INT_MIN rail for the remainder of the capture. This looks like an
>> undecimated/unconverted bitstream or DMA'd garbage rather than a
>> microphone that is present but silent.
>>
>> hw:3,0 rejects S16_LE ("Sample format non available"); only S32_LE opens.
>>
>> Expected: real microphone audio.
>>
>> The HDA/ALC245 path does not provide the internal mic either
>> ------------------------------------------------------------
>> The ALC245 pin configuration declares two internal digital mic pins:
>>
>>    Node 0x12  Pin Default 0x90a60130  [Fixed] Mic at Int, Conn = Digital
>>    Node 0x13  Pin Default 0x90a60140  [Fixed] Mic at Int, Conn = Digital
>>
>> Both are exposed as mutually-exclusive capture sources on the HDA card
>> ("Internal Mic" and "Internal Mic 1"), and both default to off with the
>> external jack "Mic" selected. Selecting each in turn and capturing:
>>
>>    Internal Mic   (0x12): all zeros, 1 distinct value
>>    Internal Mic 1 (0x13): an opening full-scale transient that decays
>>                           exponentially to zero and stays there
>>
>> Per-0.125s AC-RMS for 0x13 with Internal Mic Boost at maximum (+30 dB):
>>
>>    1884 906 435 209 100 48 23 11 5 2 1 2 0 0 0 0 0 0 0
>>
>> That is a filter/DC settling artifact at stream open, not audio. Capture
>> volume was at maximum in both cases. So the internal mics are not merely
>> deselected on the HDA codec; neither pin carries a working signal.
>>
>> For reference, the codec picks only a vendor-level fixup, not a
>> board-specific one (this kernel is built without CONFIG_SND_DEBUG_VERBOSE,
>> so the quirk name is stripped from the message):
>>
>>    snd_hda_codec_alc269 hdaudioC2D0: ALC245: picked fixup  for PCI SSID
>>    1025:0000
>>
>> Already ruled out
>> -----------------
>> - Reproduces at raw ALSA (arecord), independent of PipeWire/WirePlumber.
>>    No custom PipeWire/WirePlumber configuration is present.
>>
>> - Not a machine-match problem: the ACPI match succeeds, both platform
>>    devices are created, and the DMI-derived card longname is correct.
>>
>> - Not UCM: alsa-ucm-conf ships a matching profile for this machine driver
>>    (conf.d/acp-pdm-mach/acp-pdm-mach.conf), and the failure reproduces with
>>    arecord on plughw directly, which does not go through UCM.
>>
>> - Not a muted or deselected input: capture gain was at maximum on both
>>    cards, and both ALC245 internal-mic sources were explicitly selected
>>    and tested.
>>
>> - Not a stale local override: the machine previously had an invalid
>>    "options snd-hda-intel model=alc245-acer" in /etc/modprobe.d. That file
>>    was removed and the machine rebooted; all results above are from a
>>    stock configuration, and nothing changed.
>>
>> - Mic-mute hardware is inert under Linux here: KEY_MICMUTE (248) and
>>    KEY_F20 (190) are both absent from the "Acer WMI hotkeys" capability
>>    bitmap, and no micmute LED class device exists. The device does report
>>    KEY_WLAN, KEY_PROG1 and KEY_TOUCHPAD_TOGGLE, so the hotkey path itself
>>    works. (This missing keymap entry looks like a separate acer-wmi gap
>>    worth fixing independently.) The EC's own power-on state is not visible
>>    from the OS, so this is not a formal proof -- but a muted DMIC would
>>    give clean zeros, not a full-scale Nyquist square.
>>
>> Suggested fix
>> -------------
>> The mechanism needed appears to exist in-tree already. The ASUS ProArt
>> PX13 series ("ASoC: amd: acp: PX13 ACP70 config and machine quirks",
>> March 2026, merged via for-7.0) added a DMI-keyed override in
>> snd_acp_config that redirects ACP70 boards away from the generic PDM
>> machine-driver fallback onto the correct path for that board. That table
>> is present in the running kernel -- the ASUS board string is visible in
>> the module:
>>
>>    zstdcat /lib/modules/7.2.0-1-cachyos/kernel/sound/soc/amd/snd-acp-config.ko.zst
>> | strings | grep HN7306EA
>>
>> There is simply no entry for this Acer board, so it falls through to
>> acp-pdm-mach, which is evidently not how its DMICs are wired.
>>
>> Request: add an ACP70 config quirk entry for the Acer Nitro AN16S-61
>> (DMI product "Nitro AN16S-61", board "EV3_SKF", ACP subsystem 1025:1874).
>>
>> What that entry should select is the open question, and I do not have
>> enough information to answer it. Unlike the PX13, this board has no
>> SoundWire codec, and the two internal DMIC pins declared on the ALC245
>> are both silent. So the DMICs appear to be on neither a working PDM
>> instance nor the HDA codec as currently configured. Possibilities:
>>
>>    - a different PDM controller instance than the fallback selects;
>>    - missing PDM clock / decimation-ratio / gain init for ACP 7.0 on this
>>      board (card 3 registering zero ALSA controls may be a symptom);
>>    - an ACPI/_DSD-declared endpoint configuration the current code does
>>      not honour.
>>
>> I am happy to test patches, apply debug printks, dump ACP registers, or
>> provide any further logs on request. alsa-info.sh output can be supplied
>> or uploaded on request -- I did not upload it pre-emptively.
>>
>> Thanks for looking at this.

