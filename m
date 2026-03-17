Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011068.outbound.protection.outlook.com [40.107.208.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B3036829D;
	Tue, 17 Mar 2026 04:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773720045; cv=fail; b=cqDez6lJ88CgCMlS314CPwPWcNJrpvvY5dL+7D9kzxI/UbW6sWhO+kLIpAzaVRxfJXAvOB+Z/lBQaCFKyxIkf+kZM2eB7EBMghOOwjoH4XhiE1PuqZTtRWSBwobX/JheKFLzdyyB0D1gXABrj50J5ZbLuySta3NuA4MNNw6V4Ms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773720045; c=relaxed/simple;
	bh=U8vxaon/lh314Xtpc8C0N09xijdlhwQXIGzK+OvYl14=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jUOnph4iuD4C/+fYxwrVlAvz7S/llssvvezdLboOE62k5v5XehtNVLJPlzjvp0bghlFTqS4uPkZormyPbx38CNdIS86OzT83TEgIFqJ87bkZUt064QWLveYBSndTyuXgpHkfrdC1UlwxkTR8e+o12ZxpAhU0ryR8KKHqL7xC/j8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=GF58XzCk; arc=fail smtp.client-ip=40.107.208.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="GF58XzCk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vabQ5p2jbiPEwQE//bI8raiZWGiQjL6O8OMzHwYCiSyoYyr8YHR+uEZWUDrTlC+QK0KWNCH0rvGKCyB1ahe8mvu+3qt/RrJjIx3qpv++IzJ1N8zBuBInZl/DoQ3/thJEv/h0dAknU3h3bGt/LKYpFVTZnvhsNhe8Duf7pX3oZtFhVHnDS4kVEAwji5y02Uxp6mkvbm6HDihpX7x7VwMADByCXDU3tzZsh9yV3zFaXBakBq87IBDQtwgRJNOiCA9U8haCW7XcSd0d/MDV3d4EQLKt1GIZPohrMcsfJNQ6WzkwlV/ykfu0QAL5LucFWRKNmNC0b0mVEwDmNKwRRK3TUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hCVsAp0o8/uUsyfbpr93Oh+Idqr3cX6XXoXQBey/IZg=;
 b=KwzG0w6dgDtqU7X4QKdWAJ6w4mbocCKgtBlcZwoy5dlz2DF05kkMyWTxhFp78SP0xxABHvXBYe3JVloKYsXCqTi37/8HQhTm3a1ifFM4Xliylh9JB3JUqk9fSEoEMvAqF5ck/RpXqev3iXUbNsH3ovbuHD8ja/YtHp4gtgSlMy+OtGVQlxdSvELRNK8HToi8mzCFkM/vho6BwzyWcqmruosYF0+lik8LSWSK/D+8acjUR1bJqCrAYSKp/5MUqNwcAf5NuUaZTCHR6T7d1013BOwkuKYvXYWkdc962l2fDu43/6hRvJaLQI20Cnxs8YGnMbOqLXTxbZaoEx/Az1vLaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hCVsAp0o8/uUsyfbpr93Oh+Idqr3cX6XXoXQBey/IZg=;
 b=GF58XzCksNkH04qPHnB8eduw9I5Nk2veAVA/mID92oZ/D3P46D0wiYgKGz0F0pghBXpEvFcNviuW5co8eC3qRihlE0IKa03Hm0xHYSH2Co6qXjC3gAHfjxFGM/lbbC4V5z6YFFrIvBeo9qsidiEvMM9tEEkqAuTkvjBGdB2sxBk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS2PR12MB9567.namprd12.prod.outlook.com (2603:10b6:8:27c::8) by
 CY8PR12MB9035.namprd12.prod.outlook.com (2603:10b6:930:77::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19; Tue, 17 Mar 2026 04:00:30 +0000
Received: from DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5]) by DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5%3]) with mapi id 15.20.9723.014; Tue, 17 Mar 2026
 04:00:30 +0000
Message-ID: <26e10445-8463-400c-9288-27941c81d939@amd.com>
Date: Tue, 17 Mar 2026 09:30:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] ASoC: amd: acp: add ASUS HN7306EA quirk for legacy
 SDW machine
To: Hasun Park <hasunpark@gmail.com>
Cc: Richard.Gong@amd.com, Sunil-kumar.Dommati@amd.com, broonie@kernel.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, mario.limonciello@amd.com, perex@perex.cz,
 tiwai@suse.com, venkataprasad.potturu@amd.com
References: <a7e7e79d-c839-4a76-8a2a-f3422d2cc089@amd.com>
 <20260316154606.24110-1-hasunpark@gmail.com>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <20260316154606.24110-1-hasunpark@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4PR01CA0090.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2ae::11) To DS2PR12MB9567.namprd12.prod.outlook.com
 (2603:10b6:8:27c::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9567:EE_|CY8PR12MB9035:EE_
X-MS-Office365-Filtering-Correlation-Id: 0631dd51-b88c-41bf-52a8-08de83d9bad5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|7053199007|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Hiq2M7WN58bL5yky5QBN2dFSwTplvgBAHzaj/ved7L6eGsK3oq5QzKWuB5AurQNyERNgKuNlkqcdxQIQLJlL8B1fn0uFTh8K3gfmn6efVIjdSr/ZCml+AkiHnuniK89EICAqo76oJ7jr87Dgy44UeRyMzH7BARKZ86lqkEubMpqPan9Sx/KRGZ8wpvnMrQHtaXfznBu2+yAEG95YuhhG5X3ezWVS1UteXbqokFA0WVSbcVufcHiO9LVBgJYtKU2kKASr64gJoPpwWKVS1XwRCe94w0QLqrFc1G/dY/TqXMPiK67s+OHp6i0VXOk7WQJERYx5f1cdkknHzTw+VvAn3pVWb3OkQH7YkeNyvEGX54Wyu2xVBuzcNxPMuukifkqamIRGQelX4w9RgzHo18g3Co3DdgCpZLnKM86XIr6g4+lnjBDjqS4R3HiiMhvASSPg1EQ2LDKTSC2icZ23aPYU6aKZU7ryaVZ5WeBBJo7T5qID4hIeMD2L7XgZa0deJLUflH1MR/CzTUMb5RI8lNtTU3LNzVXRbTZpe4zODTJbZr5cI6lHFv2vpns1DXhbivoNuQEsg7WFZsf4bJFapnYtC5vlDiJdJN+LjdTnavi+w18synJB6kV9r8Cepp1ncb4D99/W6xOIfXU+xYspbC2HeLmMFHwzoAd1plP9PA32lwf088yU0lczWFxcP1pDAhnlGl5LL+ZOl4gb6gWYm9GhhbslXBTCb2g/UfVot8f+Az8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9567.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UEtrcTVabzl4ODN1WTRQWjhmcitnOUhYY2JCd1VxdG1INWJsYVpiRG56VzR1?=
 =?utf-8?B?SlpGMlh4SWVmQ1U4M0E5OXJKckcvVi9SM3dVemN0RUlUS2cvS1BUWWkva3V4?=
 =?utf-8?B?ZjF4SDQyTXhXYUo3OFRuWjlJTEczeHNOOVJlaFhUalVRT0tZTHE3VTZnSy96?=
 =?utf-8?B?M3hUUVR3c0FiTVVaNXBIOUxGZVVjQVFsN0dwMUIrcmVjSlhPa3RTQUhLcmNN?=
 =?utf-8?B?RTJzNkpkN29FRVBLUmlhZ0lmVDlHRmhVRWc0MmJPbExqejNudkMzQWQvaU9U?=
 =?utf-8?B?aStqS0hDZWJtbm9LcnU3dkJMaTN5V25RZEtlQk9Pa0RRaFNORzRibkszNHA4?=
 =?utf-8?B?N3Vyb2wvMkNsZStpNWo5S1dBdjcvVUdPOXpMM1RhOWJ2d0c1VmtPQ3VCNTly?=
 =?utf-8?B?dFNOa2xGUDVxcVRaQVNYK2xVQ3g0VkFkU0E3bUd0MWFQWDRvZUl1VmQzQk5O?=
 =?utf-8?B?M3dyQXVQMHFYODIwUDJVcUhLa1ZIS2IvNjFIN2xZSUYrUFRZWGlVMCt6T3dw?=
 =?utf-8?B?ejF5elo1cDBKWnlPNWQ4N3U4NDBUejVNSFBaOTFHRHhiWEF4d2dxVm5xNnda?=
 =?utf-8?B?RU5aNHRKU08vNHBMbE1MZE5CZm42aldOVFRtQjExR2s4Mm9pUE9hL3VFM3pN?=
 =?utf-8?B?S1h3UGMrdVdhVzlNNVh0alJHSUV3QWdpaVlBNXlTdmJwcnovYjJCK01FTFRv?=
 =?utf-8?B?Y0dkMXIrVVc3enRFekliQXEzOXV0SWNMUC9OQzBOdVRqTHFrbG5rOGN0M1U4?=
 =?utf-8?B?aDZ2UXRrWXIyaC82YzlSNWFycVA5aTNva1BrUll5VEJsOWJZdUxtcEZqWFk1?=
 =?utf-8?B?ckNlc0lVM1kySHlQV3ZtVmZtV01ORENqeTVnRElNN2Z1NG5MTmFJTE9pYnpG?=
 =?utf-8?B?a3R6SDNZVDc2T2FxM1VHOTIxSXNHaUR0OUs4MzVhVzlaak1oNzZ4THdsYktX?=
 =?utf-8?B?UHVSeUs5QTh1eW43bVlKOVJPajZ0dHhNL1IvZ1U3KzRPTnR4dmtFSmk1WkVG?=
 =?utf-8?B?ODBOR2N2NDFHV3pzbThPYkk4dUZRd0lYZXFDK3o3WnZ3UjhlQ3o5MWJtbVBP?=
 =?utf-8?B?T0UzTk9KRFFscHdkOUVXRmVpSmI4VG9DKys2UWVsb3lXM01EQkExREw2bzlv?=
 =?utf-8?B?Y0p3OHNSaTFJcjBwRVV0eGNqb0FOdDlVaUZJWFFqb1hScGg1ZEk2akFqWVFt?=
 =?utf-8?B?SGVmWnpOT0pOdEJ5RTF2MDRzTVozelZCOVlRL1o4cm5UbWZiTms1YUg2Njk5?=
 =?utf-8?B?a0dWcUs5ODR5c0ZRaDBZWnNiYldTUzBYU0tkMGt6eDFXMFV0YzNhUmthUnR2?=
 =?utf-8?B?V1c2clJocGxOM0tYVW51UVdDcEpHZUVTNXViVVcxSCsybGFzM1lwbWZHSkhO?=
 =?utf-8?B?YmZoOWFzKzRhL3VtbFFyd2VIVWpEV1BpRzY5Znl6b3RENThocUV1RkdHV244?=
 =?utf-8?B?ZTkrNVJld2JGMzRSbDNEREtEbG5kWHJDMDIzNURlSXduV21tUGJsWlBkMGRZ?=
 =?utf-8?B?QzR2Y3hRekRXZVlJdCtVZDJJaWRMM0xPQm9YRllTNWRzMHBXQnRDZmpZRmtD?=
 =?utf-8?B?eXRVdzRqNGlQM08rdTlWOWduRE81ekhEM3JsQ25ESGpvRHRsZkdtUEh5Nndw?=
 =?utf-8?B?U1BXSS9wNFE1c3hja1gva0p5U2Z6RXlvbWVDUWp3RkFMUDBCeWYzTjBBNVBv?=
 =?utf-8?B?TlArdit5dm93WDFkVmRuLzFrNUprUnBPS3NuaVVsbkptU3RVamNSL1VHNWtU?=
 =?utf-8?B?S3VTTjJTMFVZdzFCSmM2ZkZvcU1HOEFYSzY1UWxvYTEwb1grdEJJNENBc1hq?=
 =?utf-8?B?TWVBUktOZGk1K3VXNTFuRzRJZm05eHJVQ1FjQlVKVWdpQUFmbkROQk9PbGVQ?=
 =?utf-8?B?enhSWTZpSitLdGI3czZCOUdKUmhHME4zNTlpSUV1Z1VIS1dpTlBFZnhQdVcw?=
 =?utf-8?B?WW9lWDQzYm5MYmN2ZVMwaERsQ0lCRnJvU1ZwRmJlYnBYT3dUSGZQNHQzQ2Z1?=
 =?utf-8?B?SXBSaEZtRWVsS2VpNkZGR2E5d0QwWFJpMGVibHFGYVlheGFMZHhTRGpiRUFY?=
 =?utf-8?B?TUpkTFF3RjRheW1PakE4MGZuL1lqeWRCR2JISTE5YnpKeXV3NnV3ZFRSSXNE?=
 =?utf-8?B?UFhPOEVOZFo1bzZKK0tIbmpJbWw0cjN3VkZyVXp4eWxLekFMenVyaUZBSEtO?=
 =?utf-8?B?MkpTZkxpZkw0WkZhTDFYNjVLNkNNbkMzeUJVS2tqUzJNZzhvOG9jUTVWNjFj?=
 =?utf-8?B?bm8vOURReFVsR2g4aURvVGNRTFN6dUVnMU1kcFNpSnJGNDJwVG13Q1dvYkVO?=
 =?utf-8?B?VjBpb0hJTWoyMG93cUN6OEI0eTVKQ0tIMUdtenl1WnI4QVJFVEJGZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0631dd51-b88c-41bf-52a8-08de83d9bad5
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9567.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 04:00:30.0429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XjLrt9OYGnml98WQTEPpMp56TFbFJycc+QXGKAgFRbtGhQ0oaZ1Wigw7f0x1XZ34UKXX9LW6TUnl/Dzfj4qd4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB9035

On 16/03/26 21:16, Hasun Park wrote:
>> On 11/03/26 23:02, Mukunda,Vijendar wrote:
>>> On 11/03/26 22:51, Mark Brown wrote:
>>>> On Mon, Mar 09, 2026 at 11:07:30AM +0530, Mukunda,Vijendar wrote:
>>>>> On 08/03/26 20:46, hasunpark@gmail.com wrote:
>>>>>> From: Hasun Park <hasunpark@gmail.com>
>>>>>> Add a DMI quirk entry for ASUS HN7306EA in the ACP SoundWire legacy
>>>>>> machine driver.
>>>>>> Set driver_data to RT711_JD1 | ASOC_SDW_ACP_DMIC for this board so the
>>>>>> platform-specific jack/DMIC quirk path is selected.
>>>>> As RT721 comes up with UAJ + DMIC, then why we need ACP PDM DMIC in this case?
>>>>> If you are using RT721 (UAJ + DMIC combination) below quirk is not required.
>>>> Presumably nothing stops the system integrator wiring a DMIC directly to
>>>> the SoC even if the CODEC can also use it?  It doesn't seem an obviously
>>>> silly configuration.
>>> On this platform Soundwire Codec RT721 already comes up with DMIC
>>> endpoint. As per our understanding current soundwire topology points to
>>> use RT721 + TI codecs. ACP DMIC is not being used.
>>> If we want to use ACP PDM DMIC where DMIC's are connected to SOC and 
>>> routed to ACP PDM controller instead of Soundwire Codec (Which supports
>>> DMIC path), then ACP_PDM_DMIC quirk should be enabled.
>> We have cross-checked hw configuration. This platform uses DMIC connected
>> to Soundwire codec(ALC721). This patch should be dropped.
> Thanks for double-checking the hw configs.
>
> I'm not sure to drop this patch because when i test it dmic only works when i add quirk and enable BE link to ACP.
>
> But one thing i have to update is both jack and dmic both works fine with ASOC_SDW_ACP_DMIC not RT711_JD1|ASOC_SDW_ACP_DMIC.
Hi Park, There is a confusion. We don't have a platform to cross-check.  Could
you please double confirm,
when you record audio stream from UI, which capture PCM device being used ?  Or
else you can do
command line testing using arecord and confirm the pcm device.

As per our CE team, the platform you have mentioned uses different hardware
configuration.
Could you please double confirm exact model details?  Share us dmidecode and
acpidump.
Share us aplay -l and arecord -l listing.


