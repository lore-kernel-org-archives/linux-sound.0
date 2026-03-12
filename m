Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010030.outbound.protection.outlook.com [52.101.46.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3DA3302CD5;
	Thu, 12 Mar 2026 06:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773298199; cv=fail; b=Pp/TUjionmgEXvSzeQyU3VMFkFv7s8MYhbjBZ2HlF3/+rxiVQN8z7Qz7NfcVXEO44XRLF7dDlTrjjklbr5ODHJrjfHPjEQSwwkshP+fBV1c5d4cFALs6PtUkTdeJZf1ru+sQw0M6E5L4klDhwWTyvROUlr3vtI/SYIN750+boxA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773298199; c=relaxed/simple;
	bh=EWZSIV2tUmuqlpMBduVMUKWCRqGG+RyubgSs8pbaTA4=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gWEDI/AoDpK0cqAgkH76mSz7C/TYbx4bExpoLnnKaTKTpZYdVA4ixNHHNTfy+lB+ZWyvQd+vAHaeR20OzoBHn5AELEeCTchDTu81I6wq1uamd1my4CjyvIxGNYxjTZLqvJjapH9bswZ+MSUgBcxkj/y8/CQEw4oH//hJtmOCHuQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=FlnU35ad; arc=fail smtp.client-ip=52.101.46.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="FlnU35ad"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iwaYrAwP8awXsKtc/k+jIl5WtuY5iP4MLXRtkT5VjCVcaR9/m0ep93LUTsDkBxNtHaP0Ttix4xs2E296QNx3GPQbTfbnjsopdYKHJjd9q3Q+ueh06VMnbPoCY6TP1X0tD4wlsTghxr1u4USpBsi/hE+9CgzhJSA4+DPxsfqFGj95rpBtq7MNvRwEEjmOgTYpyBfk8Dnh8GGjgWyq5aRU+t2cu+Lufh9nWn/XZ25bDzaRPjEAbk7B5cgFD3pRtpQdaXrn/nYwfylz20RurBWguAczq4wlG+93lgs4nfL/TlWX0cQZY/L0vnvZrbNLYpX2oh6BT/IiwEnUFJf8xezQSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QVibt+AWqtBQwmEev+ECc7AQ7beM6tp72qMzWx9qMpA=;
 b=m8P0Y/CmKUfH5N9LaA4PFlEGg9+uZ7v1v78xPQwMHa1NOurzFzdFZO2j+3DfqgulolsGHuBxOEvUce1eIu7VAqHvaDIugByJDLp+FwLQEH3WWXGScN089+Jg0MAvD7fxBAZK8jj/OQycmi+5snCtQrFWh55eAoi6F/Df48uvtK2deyoJYHHSlq7oyAuUEC9vv6enljxVjCjnAfTwxfpojkd4OnSHbPgcBTit2F0tdINTjg9wtfGk3DeZyqTC5k9O5rcqqwAmUAOuZZl97MUpspwk04rpUNv/UNCHbHJbBa06UZAgv1M0egTaOkePheulsBg1xZooFinrjeYzc/PGjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QVibt+AWqtBQwmEev+ECc7AQ7beM6tp72qMzWx9qMpA=;
 b=FlnU35adzzXeDxckLAJnTuUGbjM4JA4eCT8SwhNVJBrHr3ZGAPBF7vznnQw5tl98vK862PkvrO0A+6ak3kpqcKdmzxFC7qfJ4ygsl391Yi+CWBXqPMaR4iEopySaxTNQKdgowQLGt5mfrpH6OQM1+SsXdyOus9/WG1djv/4nHhY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS2PR12MB9567.namprd12.prod.outlook.com (2603:10b6:8:27c::8) by
 DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.4; Thu, 12 Mar 2026 06:49:56 +0000
Received: from DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5]) by DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5%3]) with mapi id 15.20.9723.004; Thu, 12 Mar 2026
 06:49:56 +0000
Message-ID: <a7e7e79d-c839-4a76-8a2a-f3422d2cc089@amd.com>
Date: Thu, 12 Mar 2026 12:19:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] ASoC: amd: acp: add ASUS HN7306EA quirk for legacy
 SDW machine
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
To: Mark Brown <broonie@kernel.org>, hasunpark@gmail.com
Cc: linux-sound@vger.kernel.org, venkataprasad.potturu@amd.com,
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 linux-kernel@vger.kernel.org, Mario Limonciello <mario.limonciello@amd.com>,
 "Gong, Richard" <Richard.Gong@amd.com>,
 "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>
References: <20260308151654.29059-1-hasunpark@gmail.com>
 <20260308151654.29059-4-hasunpark@gmail.com>
 <53a03615-7a5c-4f1d-88f7-1e6554092946@amd.com>
 <b7c72feb-189f-47d9-aa1d-88e2a223b4af@sirena.org.uk>
 <26a37f81-9c09-4691-9765-66da29dec3b5@amd.com>
Content-Language: en-US
In-Reply-To: <26a37f81-9c09-4691-9765-66da29dec3b5@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4P287CA0049.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:270::12) To DS2PR12MB9567.namprd12.prod.outlook.com
 (2603:10b6:8:27c::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9567:EE_|DS2PR12MB9750:EE_
X-MS-Office365-Filtering-Correlation-Id: 716086c3-43cf-4f3f-fb68-08de80039280
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	C6wxH+7+WL/CAPBCpoEdf6VR/2kvRS1lsUgzsav7KfZ9iVo4HRL3yQ9t7tsP/8w1Jz5NCvFkYWCeKrbkNDNPlq1HJNcuVgEWJVLWpqblbEGIKH3ZTS1cEJdQumF0rANAgoZUplICSy9Hv6H2atgfk2x5afXYP7bChxhQa8dT0sS8iCxvNsYvhINLMmpktUp71fg/LQP3mhySE/gJaAJcA2PJBiL5UseEe9Zu/QWyxTwnA4pVyJ9hJVRoIwX3H3updeb0viiOrBse52VYSGZqdVI9mLvctXpkXAqI/mf3RwHMux+lQIArFAk051OQ+jjXuN//HHylM7FIrW/L/DfrkqArUqf60ouyXjOlpiOCgbUlfXPeWb+G7u0tMhH6k0QjAVc1mlriMs1FhE9Rwtzu1kR1WC9Ohz4O7HygOkYbIIYT/q5EZ1QhK7XRd6WWUDMoBQ3s33I0nkx5hb6dhUX4P3ZRsIed4cFSD0C0dMI/We9mHeHZRAd5DDJR3au1WmBtMzR3cPqmodB/O5knzcUUsV6nly8+M/AqcpycrSwSYPrVLafsHUkERoe20l93TmBJvYSRQ0XxyKaLqaS3RHYchuMz/ueAEcN1nYle/DmR49UgJqy99T2oy1QimxiSDeyubiu7EIFXg0Owh5ADgXm2jPGoxoZ3hXAJtY2UQrpvpW/e4Hz2SSl7y11yQO9loEqWPLrzxdo2FfzpBR03vmKaAPYCEX36l1KiEh8bMxsseLM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9567.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NGxQR3FQTEFyVEdyaGVDajVXVnQwbEpNR1YvV3I1NWE1UjRqdkhacEhPeGNs?=
 =?utf-8?B?RHVLOVo4Z25mSzZGR1VOTVc2T0FpM3J5QnM0QTVFUUVHZ25KcEtlNjZaQVdF?=
 =?utf-8?B?akp5S21sYkZyY3o5aysxMnNLZkpPL0Y2cmFIM0lZUXRCdDdveFdYK3Izd1pU?=
 =?utf-8?B?NnViUXlRb1JkTE4yZU9kNW0vMDl3TzE3NFVXV09KZk5OaGVFam9MZUJDdXJr?=
 =?utf-8?B?MEMxOG82cVFIaVF4cDA4Vmk0d2ZDTC9sSnVUTVhlM0s1VHdTRGNmcStNV2JG?=
 =?utf-8?B?WkNxb0QvZTl2RjJNWk1YajhDcVRUKzVzaGJHQm5FWGZWbmVFMFAvcWdRSEZL?=
 =?utf-8?B?dTk0MkpXbU9BT0g4dEFmU3RZc3pmTjM5b2tnR2x6MHNHTWpMSGE2dzFhTXlH?=
 =?utf-8?B?eEkxeXF1b3RqSDc1NnhqMGVFZHc0YmtiS0RObE5PWm1tcG9RZGRwcXV3ZTYv?=
 =?utf-8?B?TFZ0ZG5PcjdCOUM1bUwxL25NdTFWSG5uQnpYWEViek9QQXBLMEkvTnlCMWJa?=
 =?utf-8?B?WjI3WWxvU2xoZTVjS3JqWmlsdXhXQWpyVDVwZTJKSGRucUhramtxNjJoR0tM?=
 =?utf-8?B?OHlLbTQrQ1RlRVBnMXRyaSs5c1RzaDE5M3VpdmlYMXRBVjZYbHRJdjg3eTFJ?=
 =?utf-8?B?SVBuN01BR0FNSjlEQ3prZTNVRkpwMVNyTDZpTDJoYkVIMzl4Y0N3UlQvWVEv?=
 =?utf-8?B?dTBUR3lqbGwwczRiOFoyUkQ5V3dhYzQyeTZveGNDR3hkeGMvanRoT2YyNURJ?=
 =?utf-8?B?bGI5eko5R3ltbmc3QlFJZXlKZzg3VlRRYzdJMnRIN3NobENwVU1sV1FvZjUy?=
 =?utf-8?B?NXArODM2elMreDJjdjdJYUNORUt2ZjVyVGpVaGNjMHZoSSttUUtOQ2dHTWRE?=
 =?utf-8?B?Y090VjRTSUE2dGdHYWJPbVFFZ2dTdzZTS0s1a3NUYXNvVTVFaGlEVC8rd1Ez?=
 =?utf-8?B?NU9KdTVRbUNKRXF6NHJxdE5vS1dOdzBoTXBwREpDNU9kRkhlbkx2YnVSYWsv?=
 =?utf-8?B?cENINVFmV3FLRllPSU8xbjUwV3QzNTA4bSs3dGZnVzcxSllETk5NRXJ3YXZ1?=
 =?utf-8?B?THVkZE0ydk5keFBlUDRNRGNmdm5NMnFqalJtSktTaXFERFUwWm8xYWVHdXhV?=
 =?utf-8?B?T0Z2Wnlacm5seWNjODlZRlpYK2txZkx2NG1TbVo4L0p4bzFyaGJVTDdFYXl5?=
 =?utf-8?B?d1Y4dVUyWXJVQS91anhiemV2MDA0Ukl6ZmdlU1ZyMHRHYWxBTE5YMUlnU3Nk?=
 =?utf-8?B?ZVZ6cHVQclJqcUo5V1AvNHNyVE9ZNmhpYmd6NmtMVUhEcERRaFB4eW1WNENV?=
 =?utf-8?B?M2FDNTRuQTQ2alNTU3pldDYzNjczWmtIS3IzVWJsdzFqTDRFTjhCczhMQXFB?=
 =?utf-8?B?Z2Nob04zaURwWG9za1h2TFlldW5yVHJtc1h3RW1UNVcvc3d2L3o0dlAzdHVh?=
 =?utf-8?B?K1ZoRGtDeWNRQ2w2eC8vMk5DNkQ0R3dJYzRlUm1IdlBWdGovNzVLOGJOdTBY?=
 =?utf-8?B?S2d1ZHhWZ0x5dDBKZ3B3V2pkVW1zYXU4WDBEbDY4QTgrZjRDeEk2V2VvWjQz?=
 =?utf-8?B?QUw5eXJuSnFweHl6a3gxdDdhUDhaalRwb3ZTSURLRmpSdFhnc3NML293NnRB?=
 =?utf-8?B?MWpZb0t6YWpsTjlnRXJWNHBxVFkrL3ViOWtvUDNYZ2tLY0xlYWxtbDhrODhP?=
 =?utf-8?B?R0xUWVF3RG9UUzdQbUhUdmhDenZsSWJtd2hSNHJyd0g0Ui92WERXTTE5Sk11?=
 =?utf-8?B?SEhkQTNQRjE1YVh3Ung4TlRHUmFoY0FsMzg2L3BmTXpVNGtycFRTQVh3YlJh?=
 =?utf-8?B?cGlWTE5oM0JKS1ZzYnJZSWVRWmVvQnhFTTBzdU0xMmRiY3NsZGh6WURjRmZF?=
 =?utf-8?B?WW1HVXVSQmpFR05qcm5tRlFhMmlDaC8yRDc3Y2dQL3RmOElDWjJSeTlBREc2?=
 =?utf-8?B?YnFYVG9LNTAvRnhGYnk1NmdTbFFWNjFTbGU3ZTJYMENZQk1La08rT3RXVzJU?=
 =?utf-8?B?ZWlmcFRXbVJBYVIydjBycWpsaDUyVGgwUEM3RklnVU43VGZTa2lVcnRJYzcx?=
 =?utf-8?B?eXNuaG05UTI4bEZVdlpVdC9rdDZ3NWY0YWZmUVZZSVhERno1U2wwS2hjcWVa?=
 =?utf-8?B?UkFSLzNNZjQ1RWR3YmxPZnV2dk80WDlxQXBiSVE2bzJHWFdVa1pXTVNWRzdF?=
 =?utf-8?B?OWs0VkgxMW5MNHhNWHY0VmdQK0V5Nm01NnAxcTlJU1NjamU1NEg5MHIvRlp1?=
 =?utf-8?B?RURwMEVQbFhWcFYxeVQwMnlkNHhzVW4ybS84NHY3SEIrM0xTUmJ2dDNiVUwx?=
 =?utf-8?B?NFFsZzdxM2dzOFYxOWxXZnBNeVZpNlRUSlVzV1RsMVVmSnFHeTAwQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 716086c3-43cf-4f3f-fb68-08de80039280
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9567.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 06:49:56.5992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +1eIMiPwmZ91ks3iVT5QaRqtbV94T1L6/ihk7ZDxFc0ZFwfy0ZIHldHAr49dBN8JW7Qhm6G7V4DwNNC83382YQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9750

On 11/03/26 23:02, Mukunda,Vijendar wrote:
> On 11/03/26 22:51, Mark Brown wrote:
>> On Mon, Mar 09, 2026 at 11:07:30AM +0530, Mukunda,Vijendar wrote:
>>> On 08/03/26 20:46, hasunpark@gmail.com wrote:
>>>> From: Hasun Park <hasunpark@gmail.com>
>>>> Add a DMI quirk entry for ASUS HN7306EA in the ACP SoundWire legacy
>>>> machine driver.
>>>> Set driver_data to RT711_JD1 | ASOC_SDW_ACP_DMIC for this board so the
>>>> platform-specific jack/DMIC quirk path is selected.
>>> As RT721 comes up with UAJ + DMIC, then why we need ACP PDM DMIC in this case?
>>> If you are using RT721 (UAJ + DMIC combination) below quirk is not required.
>> Presumably nothing stops the system integrator wiring a DMIC directly to
>> the SoC even if the CODEC can also use it?  It doesn't seem an obviously
>> silly configuration.
> On this platform Soundwire Codec RT721 already comes up with DMIC
> endpoint. As per our understanding current soundwire topology points to
> use RT721 + TI codecs. ACP DMIC is not being used.
> If we want to use ACP PDM DMIC where DMIC's are connected to SOC and 
> routed to ACP PDM controller instead of Soundwire Codec (Which supports
> DMIC path), then ACP_PDM_DMIC quirk should be enabled.

We have cross-checked hw configuration. This platform uses DMIC connected
to Soundwire codec(ALC721). This patch should be dropped.
>
>

