Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011045.outbound.protection.outlook.com [52.101.57.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A843469EE;
	Fri, 27 Mar 2026 16:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774630360; cv=fail; b=ViA/Bdbib7iKNquXQcNGbFmIBnwU2K37ipvC4tuHwtm/S6SexLxWS11BzR1QNYiWCtk7kMMR4cxD/5QiqJX3eERaUmggi1uFHy7LBFDbRfO1j8kgTDZ8xtWFjKwMs8I2sEaH/qZnHxt2etCShS/Y/f3HlCqMFbUFablJVwAM3Ro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774630360; c=relaxed/simple;
	bh=BFTEpYepw5f4FqFs8xfE25Cib3m3DqN21+ERJmUTF/M=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KvKYLXrRo4iCSjDyvRekq9nb6ncvlixpJtiIt5I4RpuuvmYCzKziwh2cYkjesE1zL2sYbRIxkb/4WGoLaTejHU2u2h9MTL8m6f65oV0cW435NQ8neaeJa+cu90vYLx6Dp1U9nogaijXiqJmIppFXdKta7KTHfCaCXiLs09Rgg1E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=pFVFBLt9; arc=fail smtp.client-ip=52.101.57.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="pFVFBLt9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BPJlY3LrGcdU5goOIRRedZMfiZY5Vye0D4E9VupghS5B7qZzSYiVtYDD3OjGw5VHSYdFY8Dc+wCuQJcfknWV7rfhbrTQ0eivhJ2NKptO7dt2HUl9OV1JwBQfSiu/TeLJXUqNjJAuMo/wrV3RhjGcBh/BdIXDMnUDRGan8NJF8vYsDJEgSrpJx6uJjhjQAYQ9muhVAA1e2JXVnc/PK/UWIArB3PWO9MDVMVoQApd2vDC3bKG0cHmnn64mP9pyGAcVZkijsOrDe9yd2+4/3FWAPIcFooc7dFIrGT7otJpQpnHJpdxWYGbWuUT0iy/mN4GmKGp3+AHDB378Qk/XLXQVZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l9lYZksaCWvIrFiPSWOKL5rv/p9S7IASXj63jOeJLfE=;
 b=xMlmxZg0Fi8Yau19UI6/QNSApPQsLhX1dKqqGbPeC6J8Y624OD5s3htTHRT+2iGlsgir6Ifkd7XmOVDwb5XeTRGNpU6V158FvmH0tPU/7jOAFSQY3Ln31aoghv/QiIcMGpOkq+x8jOgdavZsgbBFcYEDI5h7fmJNeQrw/3oYmM+8QM5YStxPyE1PWTYeDbvk5nsun2UwivZMdQrPawy5Sb1nyUyVr62BqdPoyf5UJIci0w2cblBGUd+SLwuz0a/nvyCZPICY8hPySAyrSHG0+zG8nf6gEXwUZhRE92rhviK53E4A0+RrAC/YjDe+Rj3Jz2QhBqjpg2sZFL2G5nB8iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l9lYZksaCWvIrFiPSWOKL5rv/p9S7IASXj63jOeJLfE=;
 b=pFVFBLt9VsBxouefVQEFrsHGCc43GS2iD/zlSoURqCqZ8USxoMVg4PaOtpr6Oe5ea0H8RKK++9KEhvoJyk12soRH08NgqKJciZSKlz7zrfz1F/wLxnbKdy3c2yJadEz3vULyirSz4Lc0RuaKymFx2L/eWREfyOidTBIA+6BS2eU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4557.namprd12.prod.outlook.com (2603:10b6:806:9d::10)
 by MN2PR12MB4206.namprd12.prod.outlook.com (2603:10b6:208:1d5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.10; Fri, 27 Mar
 2026 16:52:36 +0000
Received: from SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287]) by SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287%5]) with mapi id 15.20.9769.009; Fri, 27 Mar 2026
 16:52:36 +0000
Message-ID: <8cd14428-24a9-45fd-9286-9d9f142b32b1@amd.com>
Date: Fri, 27 Mar 2026 11:52:33 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: hda/intel: Add MSI X870E Tomahawk to denylist by
 DMI ID
To: Takashi Iwai <tiwai@suse.de>
Cc: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>,
 linux-sound@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>
References: <20260327155737.21818-2-stuart.a.hayhurst@gmail.com>
 <05e1cb0a-18f0-412f-87c6-99319b18af52@amd.com> <87zf3tp6p4.wl-tiwai@suse.de>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <87zf3tp6p4.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN0PR03CA0028.namprd03.prod.outlook.com
 (2603:10b6:408:e6::33) To SA0PR12MB4557.namprd12.prod.outlook.com
 (2603:10b6:806:9d::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4557:EE_|MN2PR12MB4206:EE_
X-MS-Office365-Filtering-Correlation-Id: 65332a83-8bde-4aa3-a49a-08de8c213f6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	lVnR9zlJTI/JxOD1JES5u5lAk8IbezA1q+xs28RPNCwmqEPOQZhC7mnXKKgzPmi9kPfOKTCj0ylECwEAXFUUW0OMddnr9q1b2NjZqFkYk8gh9aTAaQhPSTsHqzoSYC1tB04dtzcLsgvSNpHftcKFD09HRF2v3wOgdcUBxTo/hnoOfJujHhANzV/C/+uRN67KbMQgWNYYpG5Xf6VyjVN8B/sL2WUZbDJVpfi3ND+8HqoOrrfSdI2kwgYC7rPXgltthS99a/Cb2irAnFvr0XOOaX/qoW8slg59Ftv9x8WZh/HNtvTuhc+BoMrtweaH/X7ouHd8MngCeh5gsKBiChpf/ks6cRH1pkYb9Gg30AX/ivbyJa1OcQYWl3EJzZSfSst+XwIcDUEKSKV6c99fCBlC/VjulEchxirlAUb/o7zifywUZimg4gy/pafhKhDS63CMlIIfRCvl+LIOUS/V6zLpmCj37ZHOk5XLFa2qFrnepEwqHzAtJSHg4LlxO8Yp6AIvunQRQdsZysRt/zLWMftRUwAJib4J8qAzAKRgS1/nWjYHAHr+zstiT+Jjo9YtY3NvVTns6f2WG0g3QMZM7lakFaj5D3jLObleope5dBvsEnRyqYgwyeblgMpUmnPsbgoJoAzSboxB30KEQmlK4lEgMoegxCiMuGRXDoNhI5/6y84AYTlE+upEabMhMguAUlVsvHAxCArurRzjJfz9h4TmTMJk4Buw5U12Pu1HD3T7kN8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4557.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UTZaU2NvQ045U0FtSFdQbjRuNGYxT0RrU2ZkZ0p5M2RlM2NDMlZaV2k3K2RE?=
 =?utf-8?B?WU5DV2h1YkY3SE45a2craGdRcGxPc00xcGYvdWFDUEJ2M0d3UnJzWEQwb1VL?=
 =?utf-8?B?S2p6QjRlVi9qWlc3cFRLKzV6OFBIY0tnNkNlQVVZb1hqRVFiQThxeG02bDFh?=
 =?utf-8?B?UURvbkR4bkZsZUdHYUUrRTRGNU9kYVBiWWkrb2VFZHgydk56OTZnMWcrSDVX?=
 =?utf-8?B?czdoQ083QjZ3bnBrdkRHamxBUDRTaUhpVy9jR1RwMXQzVWtwRlNYdnFQRVVP?=
 =?utf-8?B?M09BcjBjalI2cnZVMW5lOXZPNUt5cmdqTkVBaEhUeDhzdmsvS0FJNEJFNzJP?=
 =?utf-8?B?UUQ4QkUzamdSK3REOG1JS0lVSzFvczlrQ2xMNjRod0VSRHNab3l2VFhXcVJ2?=
 =?utf-8?B?dWIzK1ZMS1d5aEVYVlZWTU5RdjlYZ2gvSW1CdHM2SGRIVStRRjFONEtvVEQ4?=
 =?utf-8?B?NjBIdWpGTDlNOHluWmUxeDRMYjdlZWE4V1FFZVcrWkxPWmtKMUU5cTlHRWVs?=
 =?utf-8?B?VXdoeGo5YlpHSFNFaU9aVC93VkZyTjErc0diRjcwaEl0NndrdEZtNmpHNVVX?=
 =?utf-8?B?WWRTK01YNDFaZk9ESkJxem8wSHZqZE12eDVLN3RPdFdKaG91MzhyTHVnL0g3?=
 =?utf-8?B?SXdHMkRnQjFJV3NZMlVtT0NPd016R3Y1d2FtakVxbWUydnlDa2hiNUtTZi8r?=
 =?utf-8?B?L0owKzJoZlZBdTVSSUN2WVJjV2FBK09iMVhsV0F2STVuUi9URUpRK2JaNWlV?=
 =?utf-8?B?Wmc3VWlpcTRFK2hCNzIyR09BQ2s4cUQ2N1h3bDBENXc3cCtwQ2w5V3MxMVlE?=
 =?utf-8?B?QTE0bWtIYXVwdFFDVXdTQXJvQmRkeDErV3FwUzlBc1RFWTdwdlREaGo5cmYv?=
 =?utf-8?B?U1FWZHl3Qk55Zk0vWkFsUVo0dUp3SXhXY05lOHh5SndqQUV5dVR0TUd4RXdU?=
 =?utf-8?B?c0JhanIrdklIZWZSNWNIRWNvTktvdHcvSkNpZi9uRnNKNGY3UjRTOVJ6ejlo?=
 =?utf-8?B?QmFnK1ZsKzlYQS84ZmpIaXBXNkl3Y1BmbjdXYTJTWVdQekUvNTUreVM3NmtZ?=
 =?utf-8?B?bmNtZHBOelZkMWQ4WFVib0JmMU9JRUQvOUo2L1hudE5TNTd0ZGhGdFd5Qk81?=
 =?utf-8?B?OHVRc0J5SWZ4YnVNaE4wVzZyZCtGa3NaY0NjbVhGZ1FjRnpyWStqZzFEdncr?=
 =?utf-8?B?Qk05RVFlNDVLLzFXdVpBa0NQQ3VDSDBVaGRrL2g4ZGRqV3pPZHVxR1ZiYUJV?=
 =?utf-8?B?UVhqcm1uL3NMR1ZTV2dKMURUZ0wwcDJvVjBrcm1OQzIvRFEyVkxOT2VPTUN5?=
 =?utf-8?B?SUlGSmowb09tdDc3NlNvSSs5eFpZS1ZTTjFXaklrRFcvcmtyVU5hc3NjV3gr?=
 =?utf-8?B?bFpkS3NVRHlldzBuNnR3WmhQTm9pcXlMZ01KOTJ4TXNiV0VLY3VZUnJQaFIx?=
 =?utf-8?B?ZHpGcCs1V3N5Vk9zNHA2UjBiOHA2QmxNL0lHWlUyaUdoaWdxT25aTDFCamwy?=
 =?utf-8?B?RmtCUytiOFJFZWV5YWhtaVVaLzQ3cldEVCtYTXllU0RISzErMzRqbU9MbGVu?=
 =?utf-8?B?WUNCUERidjJjR1JyeUFKTjlJR3JMZUFCYkdhSHIyaHhNZW9VZmYvR05qZVZT?=
 =?utf-8?B?WVl4Wk9uaFRySGNhcGZpT1RxWVY0d0pBdUZVVDhhbk1nS3V3dkI5YWVkQWtD?=
 =?utf-8?B?WndIWW5MTGQ3WHA5QmorbEYwV1BzL3VrL0ROTks3ZnFFZ0NVVUVaTE9NNGF4?=
 =?utf-8?B?bmsweUpNYkErc2tRSXhhRTZ3OVZYRmZUR0taSVJsUncreGpLTWVyV2VmbURL?=
 =?utf-8?B?NWJzdUxNZUdKWXZRQ2FoS3hYZkVjN3Rhd0Fxcnk4cmxjdzN1eElmKzllZUlk?=
 =?utf-8?B?Q0Q4bHdjdUMwa2FoK0tGNWRSZmxYTm4xMU5RV2ExVkpDM3dOR081d09kTStB?=
 =?utf-8?B?N2VkVTE1SW81N09SSG03WFNYNHZzb0dHNFpJWDU4TTBvUUgzdmFoK3dKcnRi?=
 =?utf-8?B?ckNPY0dRNTd4YzdKNW9BU3AvbCtzSitFMlFxTnA0TEt5MUF6Y3MycE55RmRS?=
 =?utf-8?B?V3RjaEZVL3d3N2laY1FoUWl3ZDJESEtZTGVRZWdrSnJOTSt1eEJlNlUxT2tV?=
 =?utf-8?B?b1NtVXVSRkF1OWtxenF0TEpOeTROcm5KQncyb3lNY1NSeGNpcis3dFdiRXF0?=
 =?utf-8?B?Z3VDbzhrcDBkVWZaM0IyWDUvbDlFUGZVekJkTStHb295TzVqTzZvdktZdGdZ?=
 =?utf-8?B?YWdJc1lmTWU4OG56SXA3R2NMWFFxblJxQ1BNRDVYMWV0Vy9qSWl3dVcwOER4?=
 =?utf-8?B?dm1vM1NVMStabjlYRkpzbVdKVGVhd1NOVWFXbE92Q1BLTnBmejJodz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65332a83-8bde-4aa3-a49a-08de8c213f6e
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 16:52:36.0456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ujuNHLhksKG7Pu1MWagIEizrvYwEaIEEAeW14GK4sOmuM9vEkxU9oJXlMcDeC2hEiDP1nuPYQHGjMw2i7Xsr9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4206



On 3/27/26 11:39, Takashi Iwai wrote:
> On Fri, 27 Mar 2026 17:15:38 +0100,
> Mario Limonciello wrote:
>>
>>
>>
>> On 3/27/26 10:57, Stuart Hayhurst wrote:
>>> This motherboard uses USB audio instead, causing this driver to complain
>>> about "no codecs found!".
>>> Add it to the denylist to silence the warning.
>>>
>>> The first attempt only matched on the PCI device, but this caused issues
>>> for some laptops, so DMI match against the board as well.
>>>
>>> Signed-off-by: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>
>>
>> Thanks!
>>
>> Takashi,
>>
>> Probably worth asking - why is the "no codecs found" ERR in the first
>> place?  There are obviously designs out there like this, should the
>> ERR message be simmered down?
> 
> Although HD-audio is a bus that can be dynamically enabled / disabled
> codecs, it's been supposed to be rather static and exposed only if
> there is really a need for it -- that is, only if there is a codec on
> it.  So "no codec" is seen as an error for now if you try to
> initialize the HD-audio controller.
> 
> We may downgrade it, but the situation is still not ideal either; the
> driver is still bound without serving anything useful, and it needs to
> react for the PM and other things.  Since the probe of codecs happens
> after the driver probe stage, the driver can't go away by itself,
> unfortunately.
> 
> 
> thanks,
> 
> Takashi

I guess in an ideal world systems like this (where physically there is 
USB audio and HD audio, but HD audio has no codecs connected to it)
the BIOS should avoid exposing the HD audio device on the PCI bus.

Stuart,

In parallel could you try spinning up a thread with your MB vendor?  If 
they're willing, maybe a future BIOS can also stop exposing the HD audio 
PCI device.

If you end up having a good experience that could be the way we approach 
this problem in the future.

