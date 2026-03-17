Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012057.outbound.protection.outlook.com [40.107.200.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDB03CF679;
	Tue, 17 Mar 2026 17:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773767259; cv=fail; b=Wki/tOvWc49+Jg0OigwAjyw/+WepNfVlk/j5vrCQo7lGNZrCzdHgy3gKGy4OlVlAwdpxpwiKO0Uwf5rpxobt11jV3AgpEmvJFSp+bqatyBKdOqqsYf1vgXv2YlyC4VwyzlaUD9IOo6LXmdneRQdPTAqyfLLjQlY724xBzOcJQgI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773767259; c=relaxed/simple;
	bh=6SjR7ZaXXRjNvFxH1KqXNQUUBgIdX2s3033YAQOG5gc=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ct8Dg21FpRuEj//4OmLAHnPLhikcpW2iFBf7tg/Aao9zvvVWtU89OjfHBcvXA5R1+X+AUrg5EhUsDLh+1a8nEuOganIY14tFKkHgnxkz6nFxu2eVC7IFG0QeO3ps7mahZjtUX7HB+Sw+tcjVZeNv5JfbOojqTlbM8FDFT0ljag4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=JLmyuoV1; arc=fail smtp.client-ip=40.107.200.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="JLmyuoV1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HlMH8NaZ9BvwzW58hycvht+4OB1xZ5svW8ybLV/fKR3uTqlkCSJUwvMEDRE/i+hn2UwKt5gzwAjyvz9f8XKVE/IG5HVYCLNlz4oHtL7Ft0iKpUQy61WKXWo5V2m4Q9FYifgIU7m04UnheH08o5QgD2sl1CRcip2cMjEHYSU5srPk7zOFrXEoJbrFNYLYKkGG3nQHvLD51/ivYjrMAvMxPi+B0RwcTHrPfQ+kjYXiTUreJHBOJvEmKTbNuESI6lyiEXbfqgr+7hjxvlyx0gY06i3UcOsZ/HVAJcKY+/35sXfyPqjSe2Fir/PFfGv70ifygB34YcFEpaVzN7Jk/krUIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xMbtyhNYaKn7M4t99zL72BRo7Vc/EILRp/sjUVhuilI=;
 b=wogMrpNN83lQCu5QFzNi0dyST4wPHj992gq/BCJBNCCSF2atcVP6CnmXN0KjBbvQD3/UPNsBk4uMnge/yjyHVdYYwdjDzg+VZMAPYj43Bzj/RasfWMM0OTpykSCxdtyArpARkmh5IwyKi7+pDxsCkf9NySHO5X+P8Xoi0abJyB44e5ENwVp35wTb38vciWqrF3/lrS0wFILgh7j99/ZqOwj1ryuaFScfCBq9TUHxIlWXBfatPWjAxGd4nJ6jJt4GXeis5/6ZQe0g2NAOK7fSaVv+UOhqzS9qo9X0lBv10mQe7XDU2V54O7PNPceqA3/8gb0/S0UsBS9vfv0Jp5djJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xMbtyhNYaKn7M4t99zL72BRo7Vc/EILRp/sjUVhuilI=;
 b=JLmyuoV1uUNnryR7i5EvutcCiTZpId9zAvHOcimzcO4dJ3pAQ4//RZljRu8E6F326rbZcwPGEPYc9+A//8jen1tShCxauYArmVSqF7Wq4uWeI4OXVGyIDKUR1LiqrNw7kpT9FOXwGnz9olhq2rdlsy1RBBSENgMojlZHBDH91dg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS2PR12MB9567.namprd12.prod.outlook.com (2603:10b6:8:27c::8) by
 DS7PR12MB5959.namprd12.prod.outlook.com (2603:10b6:8:7e::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19; Tue, 17 Mar 2026 17:04:52 +0000
Received: from DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5]) by DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5%3]) with mapi id 15.20.9723.018; Tue, 17 Mar 2026
 17:04:52 +0000
Message-ID: <7850d480-a1c2-4b18-8d40-883064d75ad9@amd.com>
Date: Tue, 17 Mar 2026 22:34:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] ASoC: amd: acp: add ASUS HN7306EA quirk for legacy
 SDW machine
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
To: Hasun Park <hasunpark@gmail.com>
Cc: Richard.Gong@amd.com, Sunil-kumar.Dommati@amd.com, broonie@kernel.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, mario.limonciello@amd.com, perex@perex.cz,
 tiwai@suse.com, venkataprasad.potturu@amd.com
References: <a7e7e79d-c839-4a76-8a2a-f3422d2cc089@amd.com>
 <20260316154606.24110-1-hasunpark@gmail.com>
 <26e10445-8463-400c-9288-27941c81d939@amd.com>
In-Reply-To: <26e10445-8463-400c-9288-27941c81d939@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0038.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::13) To DS2PR12MB9567.namprd12.prod.outlook.com
 (2603:10b6:8:27c::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9567:EE_|DS7PR12MB5959:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b7a41a0-ec91-4301-f069-08de84474de9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|7053199007|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	almeuFloCwsoDdeB/bHYjm5Ma3UUCy71d5nx4IM3iSF0mFYamcf02hxMfSMEG2n1lGmhI9+p6TcIoA786C9Sk/iQN7RlgHGckVQdw9/51LFv3bYRP47308xlSp67T75XniQNkPcMF+krMBTXQpYYs8agY5Pl9ZJQJ4rHuGCBERA6fTdyLznQfo8N4c0tHqrgrGnbgWP+K1GQMMv5ZgosoQUNVY8bqBxCCfNJlo5rBUn/RfhJeYXo2aWAFUilDB3isJBeXAuKxSVxFsUwAkTNkoXcwyklFLSDO0yBUosvCZK9gtpxSHpUs0lRqt51W3ZytV4z53Mea6sxdqIMvwQTNFRfHYCjqRzKTEGw3RSCWFyS0HIY3vURKN+U/LIosIw3LP/QcSValC+JrvfWeFoCSRYzRV/cb7j5+EDYXcht4BioygGjQCS7KpetxuukQBPuD0O891U0JrIw5/QVGw02wXL/2ii2qpIjGhuH/TUTxp63e+fYrWKlPB7HsQIYoWNdwo4grJHIFDTfL3eav59pgFNzryrSRwuo7JBHmA1meYBWz6c4GMqNE/eBYpMdENs8cT9JgQ+fsce98arwUkf3KBWebiCdx/WIO30Nc/qGnJrXvCRCL4SIAL4xB+lGYs7S731pLWYZcI/0TdBdRv239pLBGaJHAeAUxCwNZNw6Iasq9ub+4EzGnqVN8oMP2l6eUT0UVms+eEPh4SKZ6wPK0iMF429bE+lGqRS5b14vncM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9567.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?by9MTXZFSnozdFlxWThlS1U2RFY2aVhYYlZXa1JwVUJyMGYrSW51dnJCVmwv?=
 =?utf-8?B?NHFreitrS3EwTmY3WmZsUmxZbTFkMW1DalY3d2dVeWFzWnQ5M21CSUFmaWxH?=
 =?utf-8?B?WDUzazdrSkZhTGVwdm9DcDh6YkFURVM1RHJwbjNMcU1PenN4OGZpUFV5NGlN?=
 =?utf-8?B?azVlLy9MTUh3ZkVyWStqN1g3bi9tZmRab2R6UnJTWGJjTSs5ZmVIT0xRZTZs?=
 =?utf-8?B?c2tmd01ZL3FBNFA1QXpHRlRNdUdYTVBpV01Xd2pZbVNhWlk5Q3oyUjBuQzh5?=
 =?utf-8?B?ajJGc0EvNnhnNDZZa2paTGRuYkFhdWJyNG1TM0Q3ZGtKcjFaTmYwandWZ2N5?=
 =?utf-8?B?WmQ3VVo2MTc3d0RRR0dLYVhlWmRmcVNwQjVIaitiU1VLZlBFWUtyUVdsd3hW?=
 =?utf-8?B?bXk0ZnBYUzUvR1RrS0xBWnozTzFIT3BtNm9SbWl1ZFlPNy9lekZCWlZ1TDk3?=
 =?utf-8?B?clZTV0tiK29UVEhxM2VlQkFiZkQzRXlTRHFRb1lTaEwzZXZyVVdFRlVvaVo3?=
 =?utf-8?B?ZHI4aUFQb0Rrc1A5cm12c2FyVm53VlNpSUJqdm5KWlpOTFZsZkhqS2graUtY?=
 =?utf-8?B?Z0o1UkNaQ2l1eGo1cWkzbUZ3WDF1VTlkSWcrRzY5L1o1N3I3c0pjYXlFYi91?=
 =?utf-8?B?SzdjdGFxYWdoZXlkY095emp3ajlwb0FOazl4UE5CbG1jNmZ0VmR1TTdQVFRh?=
 =?utf-8?B?SzRabHd2VzN4MkpRMHQ5MmVVVHF5VEZCNDhUeko3cnBYbklybytvdUprYm41?=
 =?utf-8?B?a0t0K3hhNmNSUjhmNERNVnRkVUduS213VC9VWXRuUlNoQXZLOVdIOU1Mcm5m?=
 =?utf-8?B?cjB6T0U1Si9ncDIvVTRnWGtWdjRzaFNKMytTUGh3bnpFUUZobEtaM1A4dmh4?=
 =?utf-8?B?NTlXcDFnRExOUjNsZVhMOWU5N1cyc3ZLMkJ1blVUWDNqQVRtS1pXOWlYQ2Rs?=
 =?utf-8?B?Nm94UFd1WWxSMjRoRWNlOStEMU9pSWE0NmMzVGxTSmVyMFl3cU4yb1dLN1p4?=
 =?utf-8?B?VVhJdzBwTG9KV3NsSTN6bHdnT0Ntb0loUzhYYWJmcVUwdXZoa3Nhc0NMRElC?=
 =?utf-8?B?QTJaR3VpQU5BVGFsTSswQ1YrQ1hsNm4yS2YyeU16SDhuTkZCQU5Fc2NZanpT?=
 =?utf-8?B?UWNJU0UvSUZybDFtaFE3NURsL3hQb2xyQ0RCN2xMRjM1bEVIcWM5SnBIRGV0?=
 =?utf-8?B?bHRCRXUrSnlxTWRLSFRIcTZJcDArb2s2R2JOclFFOVR4QzVjMHkyR2l5UHky?=
 =?utf-8?B?OVFIa0lwN1JTU1A1MEJrT3h6SVFjNUpwanJNa1JJdTJzYmRTYzVCaHFvQ2lv?=
 =?utf-8?B?YTN5amZXTVI4VmF0eC9oSFRzZUtXSzVSODl3VWNNK2R6eXJnWnRHd0dsNUE2?=
 =?utf-8?B?TkVyU1VhQ0x1d1ovWTBVVXZLR2c0cUlnRzRzYXkrdmFjV0M4dGsvR2RtUitJ?=
 =?utf-8?B?cXJ6d0l3d2ZVeFMvNzdPK1hVRzRaWXRtZmNjeUcySUt3T3k4SjNtKzg0d0Nk?=
 =?utf-8?B?aEFYVUNUd3RiWHQ3ZTlzU0N4bnJFK0JabUFmMjdaQVN3Qm4yeUo2K3FheHM3?=
 =?utf-8?B?UGwrcGxibjI0eklSSERBR3J5eHJrckhjNzBibHV6V09OMmtKVlZPQUJWZkp5?=
 =?utf-8?B?WnNlM2xlME1uWEhoMXM0RUJtREUvbE1EaDZHNmY3eDZDZ0E5dEh0cjFqKzlx?=
 =?utf-8?B?bGhMR3BmVTdWQ3RKL0g3QWRuNlRJZUlIcGVjY1JlVG5kSTFjYTZya0xINklI?=
 =?utf-8?B?R3lHVElUR2Y5QXdIZ2dBVmJNcmtjV1dnTS9ZL0h4OVdPVHl3eVJseWJrSURn?=
 =?utf-8?B?QzVIZFJCOG0xZmF0elJ4cUNrU0JwMVczTWVMKzJ6KzlHVmoxR0FkOEcxbVNh?=
 =?utf-8?B?TE9TQS9Sbkh5b3FXRHZaZVFSekpUWGwxQTBYcFkyejV3akcwckFCYk5QM2Q5?=
 =?utf-8?B?NzQ2MHlOaGE0dG50bUZ2R0pTQlRKb3pHa3p2Q3BUMmUrbVJxZGFJRFF0Vmk1?=
 =?utf-8?B?czNlMzlCZXdYS2hocWsrcDZiOHBISXZ5MlU1MzNPUkR0elQ2YW5VejNGb1lr?=
 =?utf-8?B?cmYwWmZQdEdTbE1Jckg4MVZQZVVwTk5SRDRVNDNGTm5wYkl2L3MyMjFMR3Yv?=
 =?utf-8?B?eCtmSEc0OTZGNEJ5L1dhdjFzZjNLZUk1bGp5ajV5aDYyTjlGU2tZbmNKMkJJ?=
 =?utf-8?B?UG5KdTZDVWIzV2g5Mjh4Z3JNaHE1aWRBMW5Lazc5NHJFOVg0Tld0K2dpZ0J3?=
 =?utf-8?B?bVUzMlRMOXhlaUJCd3gwaVlWZVlOWlRaWlJkRUVRNTJXdlE3d2oyaTNidVlV?=
 =?utf-8?B?bVNlUXkzN0owSVVrVXFDUTdhbDVNcWNMb3pjTkV2Tnh2WnlOa1Ztdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b7a41a0-ec91-4301-f069-08de84474de9
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9567.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 17:04:51.9171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dVHbYg1rsYJBTcNhVvrduAA5ZWGY+4biphRhCFAne6ugsIIlXu1y6UOzJsQKUi5KJDBxvfUPCbEAcoWJR89Rlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5959

On 17/03/26 09:30, Mukunda,Vijendar wrote:
> On 16/03/26 21:16, Hasun Park wrote:
>>> On 11/03/26 23:02, Mukunda,Vijendar wrote:
>>>> On 11/03/26 22:51, Mark Brown wrote:
>>>>> On Mon, Mar 09, 2026 at 11:07:30AM +0530, Mukunda,Vijendar wrote:
>>>>>> On 08/03/26 20:46, hasunpark@gmail.com wrote:
>>>>>>> From: Hasun Park <hasunpark@gmail.com>
>>>>>>> Add a DMI quirk entry for ASUS HN7306EA in the ACP SoundWire legacy
>>>>>>> machine driver.
>>>>>>> Set driver_data to RT711_JD1 | ASOC_SDW_ACP_DMIC for this board so the
>>>>>>> platform-specific jack/DMIC quirk path is selected.
>>>>>> As RT721 comes up with UAJ + DMIC, then why we need ACP PDM DMIC in this case?
>>>>>> If you are using RT721 (UAJ + DMIC combination) below quirk is not required.
>>>>> Presumably nothing stops the system integrator wiring a DMIC directly to
>>>>> the SoC even if the CODEC can also use it?  It doesn't seem an obviously
>>>>> silly configuration.
>>>> On this platform Soundwire Codec RT721 already comes up with DMIC
>>>> endpoint. As per our understanding current soundwire topology points to
>>>> use RT721 + TI codecs. ACP DMIC is not being used.
>>>> If we want to use ACP PDM DMIC where DMIC's are connected to SOC and 
>>>> routed to ACP PDM controller instead of Soundwire Codec (Which supports
>>>> DMIC path), then ACP_PDM_DMIC quirk should be enabled.
>>> We have cross-checked hw configuration. This platform uses DMIC connected
>>> to Soundwire codec(ALC721). This patch should be dropped.
>> Thanks for double-checking the hw configs.
>>
>> I'm not sure to drop this patch because when i test it dmic only works when i add quirk and enable BE link to ACP.
>>
>> But one thing i have to update is both jack and dmic both works fine with ASOC_SDW_ACP_DMIC not RT711_JD1|ASOC_SDW_ACP_DMIC.
> Hi Park, There is a confusion. We don't have a platform to cross-check.  Could
> you please double confirm,
> when you record audio stream from UI, which capture PCM device being used ?  Or
> else you can do
> command line testing using arecord and confirm the pcm device.
>
> As per our CE team, the platform you have mentioned uses different hardware
> configuration.
> Could you please double confirm exact model details?  Share us dmidecode and
> acpidump.
> Share us aplay -l and arecord -l listing.
 
Got the confirmation on hw configuration being used for this ASUS platform from
our CE team.
ACP PDM DMIC being used for this platform. 


>
>

