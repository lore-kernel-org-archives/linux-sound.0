Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00753DDB04;
	Mon,  6 Jul 2026 13:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783343608; cv=fail; b=UiSCGFf/bpU5xSCT5Bf46h1XAvAhldpz4Kh+FYhCgeNmTAsRhE+0Wf/xH6S5GdzaoN9iw7xTp1xqzrOh0myf0Yo19c7WPtDqWFeYfrsoHXyVZ7PG81FZJlJj5MtNU1PTeAVuncVvF0D9Y+id7M8aDbYzC80JQtHnAMHUzUFzAKg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783343608; c=relaxed/simple;
	bh=7uTrii1pTXcWbzbuYvywfPDLxuvEieObklEVNIeAzhM=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hsz6inUAqxOu/ePlE82bhlMCMBDcx4ywwiLF1eRulEpss1mlFVvqSHRCma7yljOhRbcgplX2yuGhjTB5GO1Xwo7tMsEqpANjigXrRaDMKhB+sz3DCERLO8pXqHvTddDrmK/DUMT/1cgJ6ZoT8izgOW/w3Nze1yJlYm7PA7f3+lg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lphTTdH6; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lphTTdH6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783343606; x=1814879606;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=7uTrii1pTXcWbzbuYvywfPDLxuvEieObklEVNIeAzhM=;
  b=lphTTdH6qbx7pw1cjtAtezUTU8Ou6vv0jvQkTB4GYQzqzI6P9B+V9S7k
   +mOCQtf2TJ9R93pPPMu+hmKxrI3ZR4JDvKOyjjHKdX9mlyMuytMW34u1r
   Z8EkUbE4mwp7WrWxr61vDiR6guX24sDTZKJ1mNo9Glp2C2kacLM9HhqNL
   BRVLy6VXoBOgPgq0GjuhkFicKDVKdn5WZ5y3PlV/UUFF2umf4RDzLxJoP
   gTOT8EXqDkMzGEXjSDJtfil3w1D4Tl8LdL9xuaEMVpcHUyLsRpMPk7Gbt
   axhZXUaa7oMArLS069tMyoU9Nt6zcbzmFA3om55jGTB1ycB9DMnfjFJUh
   A==;
X-CSE-ConnectionGUID: MjXitHx6R/SgU0JAKyXvGg==
X-CSE-MsgGUID: hjpRqIAhSgOkB6eGN+dLrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="71498005"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="71498005"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 06:13:24 -0700
X-CSE-ConnectionGUID: m0A80/wXRueFQS1uA9EgNQ==
X-CSE-MsgGUID: Ph32TBhRTeSTM/Oya/vqdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="250360119"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 06:13:24 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 6 Jul 2026 06:13:24 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 6 Jul 2026 06:13:24 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.53) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 6 Jul 2026 06:13:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vYaXEQesg4DsqG9BrrJcj2qadqlxwLIm8wCbSmwsAk38uV0kz7ns9qvF2SQCktCf9drmCTonno62DdrLTGB+MOyK+DVW03OJyek0FoOTknMP3JAAmf6x0+o3X9zNy59tdY+VG18vgyo9g/sZAj1HFBWweLaWehvjNCnt2ju87Xy+j8qI6pexKMHPrCADURbWLCkpkHlkv3ZIUvaRWjirJ10X3skreqYt4uXZfwfl4rH6PjgRyqgsfYylBTJHuoAy8qX6XgBP//lo21ouKSOVcMMu1LF1Y/mhaSgZV3Yd6cuMd0Uk/F9Oj1/wXRde1Iot65Sj5GMgFPMDg+U0wV63eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DVvH8mfVoyLU0jylLUb81cPm54Wuvf31jRN5kVweQq4=;
 b=xsRK3w5Ty4QuFOIqw4CIaTqReCdE0f7Xa+RJY4FzFo9ox9OTsdl9M9hgDUhH5iOXSFuvJIanQQQlL6GQTcVF6xa/NfHcLoevI+L0l3yB/h8u8NeqHFio2kXh/5RAnvpBsmvgCZPICQRMRTuVAYpjQsDw8PhxlEF7v3JXQa9m/eENWk1xwtTohcwUVXKRrbw+DOVrjU9crOcnPRBBwXaopi7MA90eG3x3N8m9mjyKTWayK/vqEQkeMcxpiesPEofLbUay2YXWyO5OGIo0OtcHTyy7R0xNB08itSNCqXF5FD3d+phCjXQHjD1x7Mwakgg8lScMnKcZwhojvqdsmink6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by DSVPR11MB9960.namprd11.prod.outlook.com (2603:10b6:8:3bc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Mon, 6 Jul
 2026 13:13:21 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%3]) with mapi id 15.21.0181.008; Mon, 6 Jul 2026
 13:13:21 +0000
Message-ID: <83d2a230-71e8-4a24-9dce-363e1b230b54@intel.com>
Date: Mon, 6 Jul 2026 15:13:15 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] Return -ENODEV instead of -EFAULT on module-get
 failure
To: Bui Duc Phuc <phucduc.bui@gmail.com>
CC: Kees Cook <kees@kernel.org>, Dan Carpenter <error27@gmail.com>, Cen Zhang
	<zzzccc427@gmail.com>, Len Bao <len.bao@gmx.us>, Mehul Rao
	<mehulrao@gmail.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Jaroslav
 Kysela" <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	<cassiogabrielcontato@gmail.com>
References: <20260706084950.49331-1-phucduc.bui@gmail.com>
 <703ea25d-6c74-495f-8d0b-e48e5868a96e@intel.com>
 <CAABR9nH09_u3qNKaN3_epnYXk9rErQ_=Jy7dcn0_mWj+gfb0Kg@mail.gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <CAABR9nH09_u3qNKaN3_epnYXk9rErQ_=Jy7dcn0_mWj+gfb0Kg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0002.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::26) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|DSVPR11MB9960:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ce186fd-4b80-40bf-391b-08dedb605a05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|7416014|11063799006|4143699003|56012099006|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: UPICyf8GDObjm/jFh6TrtDtnPh/f2isBdhCgBt0tjbtTTNmfPRSFirbFMavkqWvmxh5QgTaouPpo2psbbVQiAiBW3dezLTWP8rgkk92ygQgHwT5YmfAVbpObosmZxRxwrRDavpgCAQ+/FLHSm8/OZH3LqZ2OHWf3taAyZ94J0pS+7TKKYLe4QJAecQ4YJUgXJy1ObyX9aTd0kZmhz8uwnUOFWH6qHtPR6+56t22FqqFdxifLB2msoEEmIoJoUMpnz6ccgkioWo5w6NW5CVQHvTfzburz1fmxhRA8pPdqJ1xfeM6J7j8kajP/uhQNCE8GzM0jaoYgECGHf/2qZ/H2t7vDwWIOLw31koIXSGRv2PnomBXhXeNnpdrIHO8DW16SSwtjPeUm/IR8IBD3aY6pQFImn9pefOr9EL1wmqzQqqJhqqetU8ooPHRM5x9PgFSMg4TeopCDxWBNnssN0yYWK9QPc89NXeG7ozyw2S/uiA5ReD/DFoQnv5lTVxlrVRkPSxssZ3SEXVPbAd6cfI6yybA99w5VSt5iOE2U5WJp6ww2KYIeXRNtuAFr2u6cFx2jRouX656eIK6nXpmBg9bB99HfDduTyDBQ2/OTMYZcPOvDe7i/dnca9tf0WzZxkbyVk861JXIxhIVxnnRPutcnYA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(7416014)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVAwK3VzNG81cE5aeEVVSXpsMWFTMkJFSHNkbVIvNjBIK01WWUdpMEhHMkF0?=
 =?utf-8?B?cC9FejZ3S2JTZFBGUTVzcGRNUVBnbEticGtZOXlVMUMwUzFrVWZGNWgybmlZ?=
 =?utf-8?B?dmtEVXlxeHdmL0tGSSs0TElkdHNocE9UOEdoT3phRkNjcm1JWndXK0pOejJm?=
 =?utf-8?B?S3h2bHFDREFkRmV4ZnJaQzZreCtYd295NDhqdXdoOG9EM3E4bCtxdzh6VjVz?=
 =?utf-8?B?UVRkdEZmblpuMGNmak5BSGQ3VzhzTDRkOVpRNExGTUEzWWpzakkzMjIyWE5C?=
 =?utf-8?B?RVpYRG9rUUtYVjVaa01Oc1VJSHRsU0RsSU9uM2dtZkU5Q29UeGRpYS9JY2g0?=
 =?utf-8?B?UFpoZFFkOWIxN1hPNDFyMTM1Z096dmFrQzcxeDNzVjRKOGNZUkRDdlg1Zng3?=
 =?utf-8?B?N3hOTE5GWWxGSllUSm0xZTBKN2p5cExLMnJ5RnlRK3B0NzBLNkY1L0xSa01k?=
 =?utf-8?B?SjlSV1JTMHNiMjM5ZS9uakJRRk0rNjBudHltb3cxMi9kWmF4bHYrWk1Obk8x?=
 =?utf-8?B?WllFWFMrdFdRTm40R01xQmE5L0NxQlo3ZVY1cEJwcGQ0c1lHcm9iQzRNbm5m?=
 =?utf-8?B?Zk82bnZEMnhTaGFYMTJPaGRTRDJrV0RnOTMyU3JpT0ZGaTVpVjJzQkxFS2JS?=
 =?utf-8?B?Y1p3T3ZmeDZDdHRlQkdMMk0ybzhNcEh4eFM1UEIxaCt2NHlmYzk4WkxiS01l?=
 =?utf-8?B?KzllTFVwSlU1cWd0WUhlTzVTNE5FRXplSW9qMDFhWUpweE9pWVN1SVNHanBH?=
 =?utf-8?B?OGo4T1JSanMrVkZhdTI2VVFTYWhrUktuRjY1MlVmZ3lQSis1NEcyemJ1bFpY?=
 =?utf-8?B?S1JqaCsrWWxlRS9Oc3A1U3ZxdWhGYUNhRUovQmRjZlYzelFiN1FPUXhjQXZE?=
 =?utf-8?B?TUloTXRDZzM2dDBXYWE1dXo1eThKTkZVZ1lnYnQ2UCthK1k4aml4UERKdmZB?=
 =?utf-8?B?NUJtanJydUdUc255UC9icmFXdDl4Q2d4WFU3dWJGSVFMS3VIdVF2WU1acDZ0?=
 =?utf-8?B?ZEs4a21JbWRFRnorOENjNit0dzN2OGhJZlQ0K1ptVjNDZXVES2lFWFBPNnND?=
 =?utf-8?B?V0NROUs4aUI1TWVRaWE0R3hRR21tSzBDUFUzTnFuK0xtbDhCd015YkpQV2JW?=
 =?utf-8?B?Ui84WmZMR0tRcHNTbzdpSmpucmtPcEVKTkZ0UkREZW1iakQwb2d5UnRzR01t?=
 =?utf-8?B?d3FvMDR3L0JhUzNxQVI0M3UrUStFMDJxdlNGUGNBRVNrZHBPK3RGZnhOY0Vy?=
 =?utf-8?B?UzJOUWI3cVRVNWZUeXRMODZVYmJpMHJVQktmUUp0V0xpSFQxQXZUK3RzcytB?=
 =?utf-8?B?U3BLNEduUE5SWmgxMkRoOU9PbCtKRlZwRDB3SXlCbmZ2MnJpazFWdVFzU3Nn?=
 =?utf-8?B?TjRiVjVuaSt5dzBBYXo1K1M0UDV6aWp1NngralRKMW1YUzVVSytyYXl4V0lt?=
 =?utf-8?B?d1EwN21LZmNEK2Z4YjA3SkowV2MwbEszbVJ3UEc3elVUM3JMMEtaRndyd0RF?=
 =?utf-8?B?TnQwQncwMkdLZ2pKK1hUSVpBNEtxRzNRYkZYb3RwSmNQb0hBZUNjdHU1L003?=
 =?utf-8?B?TW4wTUJXY1I5L3laaFRTYklqdkdrajQ4cm9hU2V1K2lCbC8xVVpXZHc2a0dh?=
 =?utf-8?B?WFZaV3B2Wnl2U0ZqSjBzd1duRUhaMmRkVXpRSWp3emhwb2lKMVVWV0RlVUlk?=
 =?utf-8?B?WGU3ZWx5MFpDN2hVNGhlWCtFTDIxS056MDQ3YU42VEtKcjRodXdyRmJsdzdk?=
 =?utf-8?B?WkRnc3JBTjZmeE8wZ0tyQ1JhOWJmSHd4SGxPdE9Gdks5VzhWMWdlSm9ZcFEv?=
 =?utf-8?B?U0ZYNzN3eTdjaDRNY2ZyYll1bm5nOEtaQllSNVdpRkJTYkhtcWhHVFJjc08x?=
 =?utf-8?B?YURUVDN5ak4yVXVHTzNaVU05RjhBSmNzWnFscmtiaG9qeTV0L0dhWnd0MTJB?=
 =?utf-8?B?b0hWcW5icXFVMjdyRm1LVnhzZDVHUTN0WXkwMXVzbzFyeWJqMDVjeGcrR3Zn?=
 =?utf-8?B?Z2tPRUY1YzJxUGJnb2xtRzY2bGxuMGJxdnhuUXkzY0FmdWU2ZHNIR1BEcFl3?=
 =?utf-8?B?ekNpMHpuYlJMQ1BPdWIzTEdzcDRpcmJDNEVmNUZLS3NnUVFZQk0wKzBhUHB2?=
 =?utf-8?B?eWx3U1QrTUtVN2pzMFpma1RsNHhrcXU5YTZnNDUwS0Fid1crQldJSlAvTGpC?=
 =?utf-8?B?ZWkvYUtGOUpreno4ZDRnRjU1blRJL1N2VVdlNXFZZE44TERqZ1EwQkRDZyt1?=
 =?utf-8?B?aFpMVER5Ym9rUFp0RWNpQlpHUjZHRzZZVWxKSzU4MUJ2TVBxSjBzZllUVkFK?=
 =?utf-8?B?bGRXUjZNTGxHbFRpWkFnRDNiOUFUdUsrdkJtYmw5TFZManJFUUhVWVpRWm1m?=
 =?utf-8?Q?kSgOFndfp2k8zsHw=3D?=
X-Exchange-RoutingPolicyChecked: e0Zmk8wUreUpvsSmUcOebBcYGCReM7WpQZ3ojbyq0K5sSB05Y38MmpVtwR47qmNh695XzkDOcNBas0eKPRpp4eZmLbj1t+o2OLf+/45r0mqLuE4MOCIMGj4eDpqvcTqY1SjrbTak6VhBph2oitDA0R/fBzVK3nsTFfuZaiYSeb7IkhAY3CjgskUneMW6iPBmGaS3ZF8G/iREn7cwrhByBX2MbHRXOYZgJaJ1cRE4uQyStcW3AbmZOl18Gn4aoRi/WawZwqfor7YSo7Stw5Jx+2A1BQmyJRHdJPTJrgiyrMdu80wCJ3eLQ41AI5ICSJEMZHx+lcnskJYL8Jsct83j1A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ce186fd-4b80-40bf-391b-08dedb605a05
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 13:13:20.9985
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K14ytTMOIbCt6lf3SH0v3Q6JiOQBvkNbwhHNJXpTC0+6qyskPmAdq7/SJLHUVDp4s+QLDVpcxOAjDZeXNpL3sv23WbX6AbXUX2iwHx6iYfs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB9960
X-OriginatorOrg: intel.com

On 7/6/2026 2:31 PM, Bui Duc Phuc wrote:

>> Now, there is a benefit of having a different error code in
>> try_module_get() case: easier to find the offending bit when viewing
>> logs.  All the functions in the area have rather low log-coverage so
>> distinct error codes help.
>>
>> Regardless, as you mentioned, -EFAULT isn't exactly the right return
>> code either so the direction of the patchset is good.
> 
> Should I also add dev_err() at these paths, or is the distinct error
> code enough for now?
Nah, typically I prefer not to mix the changes, let them remain atomic. 
Distinct error code is enough.

In regard to the specific constant, I'd ask Takashi and Jaroslav what's 
their view on the subject.  Perhaps -EPERM or -ENOENT are good candidates.
