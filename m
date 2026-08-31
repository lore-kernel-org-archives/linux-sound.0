Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010030.outbound.protection.outlook.com [40.93.198.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCAB403E8D
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 12:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788179784; cv=fail; b=NvnEV1hgszd3wKkk5i14uoBjY2OiXG0RqgFiJxKwUAeAw8Tex8m60p/xkxOsZYKIHyVMyHQW0FDc3wxDzSnQ5A612moyQM+GP7k5AXR4J3/C4dbMnOnr6WXE3Uaiv8CTmVADpZuDlNtd7aKeCB9o/TkcAY+9MsyLh1le1708bak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788179784; c=relaxed/simple;
	bh=LimQcdYxOijjEWOBXd4I/rIOOmB6sSNnb57tyyVO+RY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=g1cbz6KjfaLl/xA22DcIotR+zhavuctIAIlNs7NI1WVhX0p9RiQNj+624k/tinR31OXdjWXa8IfF8uI9tpfFoIX0F2kxlWulxwaRtxufd4cDACc9tqao83k4bHZmxs0oPLuBBRJ6MZ7Vr1SJ4jdbcgM1m2CvYUI5tbC8i0H0Y+A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=T+5EQXia; arc=fail smtp.client-ip=40.93.198.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="T+5EQXia"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LVKIXSgdp7uxxSh3AxjblC9xc12+DcFIzjmGgxjUiMYVtsH+pxoS+UKCBKeEGA/oYsVF9B9ZZ9fLYbh3HVCpKXNs85HooSG6xxEr9Keqnzz78wNJm+KO7v6jOxWSUazlYOqJE7xktFBxwAVrqTQKnAq2B3mhe8zk85K6YZ+gs2cpAgxNs9JipLEO/nDgbCFnmuhf4XiV3MMgsMqghEiVS1YS8F7vBNHgPwWtchgOr/QQZaKLX/ejxEpxxD1Z9e2JkjyP6MxRYzIl4SoytoddqdKgQj+ZGKrbigh2LoeUoC5c5TNYnWmxERyJLVez41eqzVhKOikWyHiwvRakM6a7+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c/vMgs708bOYNqYgOatbNnAiAEblTrUz7RKXxcfWXWw=;
 b=iEkuJgtTt8sScokJR2C+j1K+yecZBmMQj6JIQO9mehAEIBRg3FTi8koCOtpDqKj+1PlW6UxqCOOY6hqpEDV5DXdtfBJvf7yWt8vxTAq0sl91qaCbYliJ+d13zqPF4UhnloiBQLQfr1jHEQFZIG2ZBbpoXCb3bIhQR138Sa1MrTLsSakpRdvagccxMcnBTiJEWu5NEPZnflSR+lA1mMV6X7Yrkyvtiy9Dyv3YzEUSSHHz0Il0cZOISq8C+Aprn+zsSE7dw0Bw2nnQdl3jzEQqYM+OviTKOHWgksUEu8BE4aA7vIPnxoeMBa2K0/Hr+TVdcSbFv99TIao/sQE9H3b/sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c/vMgs708bOYNqYgOatbNnAiAEblTrUz7RKXxcfWXWw=;
 b=T+5EQXiaz6fOXc50vNy+R8XMOV+3u6f16fhLERYfwvv2U21KNo1jSddrnl/pXW+3JNbe5Wqa8oaHYB9k0sihIZhs94DQ5uC/Oeq2tIaXbEl0Elpjz4ZOCWxoMtv9umlRy78qYWYa44ChMh3v1ISU+OyXw1ef6m4rg+8vtbxTcDY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS2PR12MB9567.namprd12.prod.outlook.com (2603:10b6:8:27c::8) by
 BY5PR12MB4097.namprd12.prod.outlook.com (2603:10b6:a03:213::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 12:36:20 +0000
Received: from DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5]) by DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5%4]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 12:36:19 +0000
Message-ID: <55c93639-b15f-47d2-9697-ad354318dfa5@amd.com>
Date: Mon, 31 Aug 2026 18:05:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] ASUS TUF A14 FA401EA: RT721-SDCA SoundWire speakers
 enumerate and stream but remain silent
To: VR RS <james.vorres@gmail.com>, linux-sound@vger.kernel.org,
 flove@realtek.com
Cc: venkataprasad.potturu@amd.com, oder_chiou@realtek.com,
 derek.fang@realtek.com, "Dommati, Sunil-kumar"
 <Sunil-kumar.Dommati@amd.com>, Syed Saba Kareem <syed.sabakareem@amd.com>
References: <CAA0e5J=fuvTkqUeasaNqgwwooKacgtS7a4unsT-PXH+HoUPp3g@mail.gmail.com>
 <CAA0e5Jn-hrgROfTPJqRTnUA7Y5rxho_6TToAQ+WVM-Aij6YEcA@mail.gmail.com>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <CAA0e5Jn-hrgROfTPJqRTnUA7Y5rxho_6TToAQ+WVM-Aij6YEcA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PNYP287CA0100.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2b9::10) To DS2PR12MB9567.namprd12.prod.outlook.com
 (2603:10b6:8:27c::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9567:EE_|BY5PR12MB4097:EE_
X-MS-Office365-Filtering-Correlation-Id: fd069d98-2065-49f8-db7a-08df075c7531
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|6133799003|11063799006|10067099003|4143699003|18002099003|22082099003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	YufqLcoRNIbx9XOJ7nMmCkTHK3janLfKC4rF4/MXyxiDtHM+ZgS12nomm4iufY/ZK6yK8MKJl5ke/jyTjetyb4j+hu7EcLPK6JnJY6pbSo05QzB3OVDUu7Uqe/1vBTR6MWj/8Hn64tCSqa/k/+Y8JCVFLiu6JpET6wKg1JRsbW8ZkwXiDqBd9GXTF/bmWLFmd0nA/rZk2JZ4q/e+YAflSh96M1SrpD4n/AH0wgwHuMptOXTU83q8XM29FFRAyKQK3DiWjn6cWcYZ6qGpwPWaIg12dSmwqggRTc58HnVVazQMFa+O2FjcX5ahhU/8J2mVoGwWZhdQd/2xMXkB/CEVmvRFzsW0s5SNQ1XDpEUNtNrO2Y9Uhar37nqDpHg6v6asrFaTbDjfS88zXXUtVEZyGptt5QOooagJGA8ZdxIQliYFsIKtPzmlq0VB/3qC737GLJgvmcb5tdfZ8W5HbdbDIlyFrtQfcIFAJyQKA9PozuGXZjblOLGuPcv5+XlasTx0szynVLrfcANBHxHf0BoLZVIOEoYokDGNPGyZyJXHGFxKo+y2CH1/LCPN730e/nrAcuGFOZX/pj5P22qzaXHk1tlChRUgiUMePttZgEAOh0u5YmKdYRep3g2wQdyrZ506F+n4hXFaK+EJQU/lMVOC1RI8WVE1AzaLsAg6muyWP2E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9567.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(6133799003)(11063799006)(10067099003)(4143699003)(18002099003)(22082099003)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cVVxQVFwS3RDQzlxRzlMRitVWDlMTGpRYUp4ZHlCWGNqUmF1MEx0R2JlS013?=
 =?utf-8?B?S092V3d6TkJkcWpwWGZsOHphS2xYazlEdFVWcjFWUEtKQmh6QTJsdnVteU15?=
 =?utf-8?B?V2k3Tzl0YXNCNkxrN0dvc25sT055WjhobVE2MmNhRmRNY3E0QjVDUW10VURW?=
 =?utf-8?B?ZU9Pd2lkUEh4Wm5wQm12bGY2NE9nWFAycy82ZWJlVDU2c0xhVGY1S2hZRlpv?=
 =?utf-8?B?V3hpWllnNkdPQlNnVEZneXQxWjJVN1hWL0NjQUkyZ2tMQjNHcW9tK2FEMk1R?=
 =?utf-8?B?SXNxcFBNN2IwTm53akZQYXM5NGRXbFFpYjZ1U2JTYXFIbmhUR3RNZFVMRXd0?=
 =?utf-8?B?Zy9PaWFjVUJoVjlDMnJTbHFyNzZaRUVnYXZYS3NVb2FxR053TVA0b2h5eUw2?=
 =?utf-8?B?ci90VnBwcDVxMWpxYlgvRU1PeVcrZXdzdllmbU5WOGQwbHJtRkJQeWlDWkZZ?=
 =?utf-8?B?cW1LWHcyT05GZUV5bnZ4OFVrQmxtQUNzV0Z1bk5tdHRVUXlVSUp6SEZzVEtQ?=
 =?utf-8?B?U3hMb1ZGMHh4aHpPSUJwZGhBV3JpY1FnWS9CS1ZxQWx3cTJBUnpPU2hOU1VM?=
 =?utf-8?B?RTNKM3NnaUNyRFN0Y25lRnM0Rit6MjBBZDIyb0VKYkZkUldsOU1FWGJGLzNY?=
 =?utf-8?B?MXpWdW0wVEVubUZiZ3QvUnJ6dnhVTFRIK0FTTVlmQnpteDJQL1RHb0JBWCsx?=
 =?utf-8?B?NjJLKytJTU9vR2xlWG1tbTM5Snd2MTFJRUVLMW5jNjFPd1pOMnZBNldVVm1m?=
 =?utf-8?B?dTIwSmE4aG91dUFkaDk4T2FXUThYMk9rUm5EbzdFZjk0UGtrNDlhSTdnMjdS?=
 =?utf-8?B?dEMxY08zNG5pNWZKamYxcldjNU1zTkZUc29aaE5EcmoyMmh2OERvWE9Ca0xD?=
 =?utf-8?B?VzVvcHIwUUU4NFoySTZ1VHFxQmVxZ0pKeTJkMngyZG02Umo0Y284ZkI3YnZK?=
 =?utf-8?B?elg0WEgzek1Rc00zTEJmbzI0VllRUmxOVngwR1ppaDRkWnZNRS8zaVBMSVoz?=
 =?utf-8?B?c3c5blR1WXBSUEhxbTQwRHdrQS84dFdDUE9TZ3hWY1BlNjdiRlhYSnZ1WFRs?=
 =?utf-8?B?ckk5Z0xLUkFQY2VmZXJKZit1c3N4eGF1Wi9TSXBYYlBMNldBczFaY3FLZDFP?=
 =?utf-8?B?V0UrdzJnR2lWbEhod1VuK1Z3bEVQM1lzVVFtTFNXbG9kRUoyUW5tTjYzN3dy?=
 =?utf-8?B?ZTZrVERlQnZiTUlvYVhLQ1hFa3ZUb1NxemlMWWZ2UzdFS1dJWEtaeWZVZ2lw?=
 =?utf-8?B?OU04U3J0eURoMzgxZG0yeXVXVGF2M3lNNDBkaXdvUHlLUDZjNEMzeEtzOWdO?=
 =?utf-8?B?eCtLRU5FQTJYWkQ5WXBUTjJLQVA4d2pnSjVwN2szbW90YmpjeDd6SjNIaTB5?=
 =?utf-8?B?NkR5TjFnTmZ6QWd0emdodDhsd0tHU0FYS3U5UVp1Q09aS2k2RHlWOGpiV29p?=
 =?utf-8?B?Qld1OFF4b0RpQXIyRWxaZWpBKzd0Vmp0SGU2Q201Ym9NTXZPNFR6WDdYVVE3?=
 =?utf-8?B?ZnZiVUN2dThWSVJtd2c3dDBBbUQ0aEhidEQ0R3RiSVpUSm1qYzNmaWFvcDFr?=
 =?utf-8?B?akY2UmVaVVZXRldBN25veVRmWHAvZlRyUTZZNjA2OWo4N2hPL1J5VXcwSUE5?=
 =?utf-8?B?WHNHTGhYTjFCUkNkd2gyYzFVZU5HOGcxMjc2RU0vWS9OcHY5RzlUWllQSGhE?=
 =?utf-8?B?YlU3MWltZ1R5cFh1aVZ0NVhINWxtQUwxNmFNUGZJVzB0WjFNajNKaXR6VzRi?=
 =?utf-8?B?NlQ1ODgxdTNUcHBlTnRwS244QWdLZ2cxOUlXZ0ZIVlNOMm9sTUpSWTg5Ukx3?=
 =?utf-8?B?eGFWcEt6OG9jR1JEdEJRUVRscTN6Z2w2cFZ0TTVzOG1hZ1ZBbm1nZWVxMi9V?=
 =?utf-8?B?OGdlc05PbExiK0oyLzNoTWNhRlRWY1lhcDdQMTRpN1ZUWERoWmJ1SmY5QitR?=
 =?utf-8?B?V0w0ekpNMzdYNFJFbEQ4SkF4Z05neUNGWGhBcTExTzlnSnYxSVY4eEdJZkVy?=
 =?utf-8?B?NWhmQ1M3S1M0VFpTNncxUjU3SjZFQXF3YzJ6OVhsYzYzSWx3MkdzZHJIeVRK?=
 =?utf-8?B?b0Izdk50NlhReVdUYVVhb0dkbVA5TFdTZGdpbHRnS0lNU0Fyd1FwQ25KbXdF?=
 =?utf-8?B?cjRqYmtNalpKUjdwbXMwMTRzK1hxNWFPc28wSkNSMEdwekdreWhoK3o1U1pR?=
 =?utf-8?B?Wlp6STlLVnU0bFBiM0xGOURIMFBXeFRVU2JjenkvQzZPbVJLMU9qNFZUVlRM?=
 =?utf-8?B?M0pNaWpKVEE1aGJFcTh0Y2dGem1RNnlxazVNL0FQK3NIVGZSZzVlSWlWaHFM?=
 =?utf-8?B?eDFKS0ZsQ012NDRsZ1BkMjVBZXBpZjNJdkd4TlduMm9xcWxkWW1Odz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd069d98-2065-49f8-db7a-08df075c7531
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9567.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 12:36:19.7800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YI7BOZbyHBkBQRDxUA1fVzrX3WLnNs1gIMVhL/88kmIJHgGTVGPZYFeRHhOI2ccqY4oX5w6HOQfsqstRi/UwMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4097

On 8/30/26 18:43, VR RS wrote:
> [You don't often get email from james.vorres@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> Hi,
>
> Follow-up with a confirmed working fix on the ASUS TUF Gaming A14 FA401EA.
>
> After the FA401EA ACP70/SoundWire machine quirk was in place, the
> RT721-SDCA card enumerated correctly and ALSA/PipeWire exposed the
> internal Speaker and Headphone paths, but the speakers remained
> silent.
>
> I decoded the board's ACPI mipi-sdca-function-initialization-table for
> the RT721 SmartAmp path and compared it against the writes currently
> performed by the Linux rt721-sdca driver.
>
> Of the 20 ACPI-supplied SmartAmp initialization records, 19 were
> already reproduced by the existing driver sequence. The one missing
> board-supplied write was:
>
>      regmap address 0x2f5d = 0x01
>
> This is adjacent to the existing per-function raw preset writes
> already used by rt721_sdca_dmic_preset() and rt721_sdca_jack_preset(),
> but there was no corresponding write in rt721_sdca_amp_preset().
>
> Live test:
> - before write: 0x2f5d read back as 0x07
> - wrote 0x2f5d = 0x01 via the SoundWire debugfs register interface
> - readback confirmed 0x01
> - internal speakers immediately began producing audio
>
> A minimal source change was then tested by adding:
>
>      regmap_write(rt721->regmap, 0x2f5d, 0x01);
>
> to rt721_sdca_amp_preset().
>
> The kernel was rebuilt and installed, then cold-booted with no manual
> debugfs write. The speakers now work automatically from boot.
>
> Regression checks completed successfully:
> - internal speakers: OK
> - headphones: OK
> - jack detection/switching: OK
> - internal mic: OK
> - mute/volume controls: OK
> - suspend/resume: OK
> - 0x2f5d restores/persists as 0x01 across resume via the existing regcache path
>
> So the remaining speaker-silence issue is reproducibly fixed by the
> missing RT721 SmartAmp preset write specified by this board's ACPI
> initialization data.
>
> I can provide the exact patch, ACPI table decode, debugfs read/write
> logs, or the full investigation notes if useful for upstreaming.
++ wider audience from amd and rtk teams.
@Flove:  please help to comment.


>
> Thanks,
> James
>
> On Sat, 29 Aug 2026 18:33:12 -0700, VR RS <james.vorres@gmail.com> wrote:
>> Hi,
>>
>> I am reporting an audio issue on an ASUS TUF Gaming A14 FA401EA using the AMD ACP70 / RT721-SDCA SoundWire audio path.
>>
>> Hardware / OS
>> - ASUS TUF Gaming A14 FA401EA
>> - AMD Ryzen AI platform / ACP70 SoundWire
>> - RT721-SDCA acting as jack + internal SmartAmp + DMIC
>> - Arch Linux / Omarchy
>> - Windows on the same machine plays through the internal speakers normally
>>
>> Kernel work tested
>> - Stock Linux 7.1.9 did not expose the internal audio path correctly.
>> - A custom 7.1.9-arch1-2-fa401audio build using the existing FA401EA SoundWire quirk lineage made ALSA/PipeWire enumerate the device correctly, but produced no audible output.
>> - A follow-up 7.1.9-arch1-3-fa401audio build tested an FA401EA-specific non-aggregated endpoint mapping. It still produced no audible output.
>>
>> Current ALSA enumeration
>> - card 1: amdsoundwire
>> - device 0: SDW1-PIN0-PLAYBACK-SimpleJack rt721-sdca-aif1-0
>> - device 2: SDW1-PIN1-PLAYBACK-SmartAmp rt721-sdca-aif2-2
>>
>> PipeWire creates both:
>> - Audio Coprocessor Speaker
>> - Audio Coprocessor Headphones
>>
>> The Speaker sink maps to hw:amdsoundwire,2 and can be selected as the default sink.
>>
>> Raw ALSA test
>> speaker-test -D hw:amdsoundwire,2 -c 2
>>
>> The PCM opens successfully at 48 kHz / S16_LE / 2 channels, runs continuously with no xruns or errors, and alternates Front Left / Front Right, but there is total silence from the internal speakers.
>>
>> Diagnostics performed during active playback
>> - PCM/DMA state: RUNNING
>> - RT721 SoundWire slave/runtime state: active
>> - ACP SoundWire manager: active
>> - DP3 SmartAmp sink port: active bank, both stereo channels enabled
>> - DP3 word length: 16-bit, matching the stream
>> - DAPM path: DP3RX -> FU21/FU23 -> SPK -> Speaker, with the relevant widgets powered
>> - Speaker mixer controls: unmuted / full playback level
>> - RT721 driver power/mute sequencing: verified against the exact driver source and appears to execute as intended
>> - CS31 sample-rate programming: 48 kHz path traced in the driver and live state checked
>> - Function-unit input gain on entity 0x23 / control 0x0B: live readback is 0xFE80 on both channels, matching the ACPI mipi-sdca-function-initialization-table (approximately -1.5 dB), so this is not a muted/default-gain issue
>> - ACPI DSDT/SSDT inspection found no separate GPIO/_DSM/WMI/EC speaker-enable sequence outside the RT721 SDCA path
>> - Windows on the same hardware confirms the speakers/amp are physically functional
>>
>> Hypotheses already tested and ruled out
>> - PipeWire routing/default-sink issue
>> - ALSA mute/volume issue
>> - missing DAPM route or unpowered speaker widget
>> - incorrect sample rate
>> - missing ACPI speaker-enable GPIO/DSM/WMI method
>> - missing FU input-gain initialization
>> - FA401EA endpoint aggregation mismatch (tested in a dedicated rebuild; did not restore output)
>> - a meaningful behavioural difference in the shared RT721 vs RT722/RT712 speaker-init path was not found
>>
>> At this point every Linux-visible layer from PCM through SoundWire transport and SDCA control-plane state looks consistent during playback, yet the speakers remain silent. The remaining unverified area appears to be RT721 vendor-specific analog/index-register initialization or another board-specific condition not visible through the standardized SDCA controls.
>>
>> A detailed local investigation report was generated, including the live register/DAPM/ACPI findings and the failed endpoint experiment. I can provide the full report, kernel patch, logs, ACPI tables, or any targeted register/debug output that would be useful.
>>
>> Please let me know what additional traces would be most helpful, particularly around RT721 vendor analog/output initialization on a self-contained SmartAmp topology.
>>
>> Thanks,
>> James

