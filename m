Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6204C320CD9;
	Tue,  4 Aug 2026 11:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785842875; cv=fail; b=OdjWg3o14Kvf5LmPQ4nVt2qufXpoqhjeg3tkH0bm/QMO3uPnSRnayx7zE41H9jwPn84VptU6SrQl51XCwxhgPWnQ+vq6NmKsjaMbGKNgQOTIVH3zGnZw146ZYtWq9rgqIDMdBtpLdKIwsARQ0WaaAtfFT5AGyDtDaNeqlN1C4Jw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785842875; c=relaxed/simple;
	bh=w6S38lrGun9DbJiflGK19TnzYYcV+UgITADT5bcnVs0=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=alAHd3f3DuVWKx8184+n3JbHKXVNJSGsxS7cwilGZpz/anpGrHWxzfHAr29wsy0eGvwuU7xqDnGuyAk6dXdIRPkAFjYG+UeTX7YWHMHXVN0E5xBhNQTcVPg/a50cvz8QdAaJVdtAPORKrzIx0A6PtbKfeqqvj1xeSIUmPQamIWI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MkDi5Y9q; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MkDi5Y9q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785842872; x=1817378872;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=w6S38lrGun9DbJiflGK19TnzYYcV+UgITADT5bcnVs0=;
  b=MkDi5Y9q+Mcfh8O6IRmayaUWfF0w0CD5x5z7PFhUXx2twbBxSb2ilZ5D
   ncv4Csnv2FE+XIT1llaTlUIhu4QS8OtgBEnz51bIKmXoaKBHjc+ZbXiQx
   /EmL23fXY2YvnYIB2UJ5ga8zlKUPqpnHxVPh3Esu5XSaJfPg5064kyDiL
   9hYXVO0CAttGq4p/OUouOkSH4ojk2WBjD71P4qO75IKP4/S7FB7/RwKFv
   64wKcb6Fs8DeJO3dumONUMB5fO9bk+foJF9K9yXOjUOLNF9p699Bx/kQb
   own9//vU0nrhzqwHmKyHLHkV+HPe0zjc76Ae1x77tg8Uwpi78RMhS14ib
   Q==;
X-CSE-ConnectionGUID: cflxUr4hQuSj01VndWtUfA==
X-CSE-MsgGUID: 3lrcr88URJmxBHU8inA1JQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="86267094"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="86267094"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 04:27:52 -0700
X-CSE-ConnectionGUID: 4/KwAEwUTQSU1TLyvMladw==
X-CSE-MsgGUID: SatZMWyRRtKnbeMO2UnqDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="291412254"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 04:27:52 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 04:27:51 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 4 Aug 2026 04:27:51 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.8) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 04:27:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D9/JyUm2VsdBiUHGkYaD4agYMKAeRi3Y7XohqZQCSv+ex+iMMZ98m0tR9WqKjbvcfLbdDojpidSN5UaXFuoJL0IZ5RInIVAcd2QCgy/DX7bZVW5T29ifIriRGcuGaId6/qJPnC+gJmAamDLKSrKCyDSNyOK/QvmKjDHlL166iSFtaJw3iQX3Dg342dM61rDL9dWqAna97T5L4m6bM98ZHr5CQTa0fZGmwzZ0csux2IExUUyIrGmbL9xs2TIV8UC7cN6j6Sb74luSG5PJEIx94hslV9ncJLtf2MESGHzpQfTqoPFm8xH9PghJcIJO+ZJ4t+4FV8Q33WIxY5CAOSlsPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZSER/CCOXlQw5ndqoa++aMeH4QQXMyzAbzOj+NTjOxI=;
 b=c2bzthZWl7nvfwQTat2BCg3t4Ul02NmHQWoRZ/tNigtN53t7M1pDl3sDAWWAtrPWhRGHaFqeqJCTZy1vkfhJGdY7/hLjOB/5JP66C57j+P888hXGZnrEfCalkL9Cp8/wtiVwDsE6sKmTTJlSCwONO7mQeIgOcL3nYpq048S/gLIlwU7ZQ2b9HoW7WKzJbEToruFTtcqkmyHie9KBz5XYpiNYjGXxHaYNNQ3C01auF9LagLv1j8wr+LZKVURx4rzs5qyZSbSmLJcm9Q6c+WUkTZZiG5dmNlIWYEMISEjdCKRWGmbQlzmhWhANEQQURjHj4Uy4TPbNnvN3gKeXNYMXZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by DS4PPF7A0031045.namprd11.prod.outlook.com (2603:10b6:f:fc02::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 11:27:41 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%5]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 11:27:41 +0000
Message-ID: <1b19ff26-235d-4715-b7ff-0bd440ed8da6@intel.com>
Date: Tue, 4 Aug 2026 13:27:36 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: core: add snd_BUG_ON() check in
 devm_snd_soc_register_card()
To: Bui Duc Phuc <phucduc.bui@gmail.com>
CC: <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Takashi
 Iwai" <tiwai@suse.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
	<perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>
References: <20260803102739.55569-1-phucduc.bui@gmail.com>
 <f7c2eafb-84c0-4c4d-a359-8c80ed989c24@intel.com>
 <CAABR9nHynGR4TjdpGW9-sjEC8p1x4D8omq8ouPR6E-3ifDhBqw@mail.gmail.com>
 <61910d04-6f6c-4c99-bc96-397163cfc31f@intel.com>
 <CAABR9nE6Jcfkj94ABPfyua5bBjaqE-ZNQp43uHc5d8fo_Xu-1w@mail.gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <CAABR9nE6Jcfkj94ABPfyua5bBjaqE-ZNQp43uHc5d8fo_Xu-1w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIXP296CA0009.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:2a9::14) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|DS4PPF7A0031045:EE_
X-MS-Office365-Filtering-Correlation-Id: df9183e2-b127-4903-4c6f-08def21b6571
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|18002099003|22082099003|56012099006|4143699003|11063799006|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info: wM6IZRR4B0NF4vpTPWJfJnB1zO/1v2fc2klbJQGslzyWjkELBTt6FgawCyNZBa7a8g1Xm4RbgqaYHJKyGyKEFlNB+vfEXH3q20wIiPdSCa3bTPNS0/YqBZ+TrLcGojgydycbJn3UkS8/0aD7dsbNctTME/iwn9stHtqGIjuahOIBMBF5gc02/0MBOQzHju3GrybT4ssFFF4LlvMQzIfcdVTI1KhMO2PgtTv3TfqF8lh1XF4UombgIaZE0MgbVqHumDn+Zl0leGr3wlLN5ZMfz1V2wweGSnrsKJ0lIpZs2dVoGz6LLdRWzFgprBw6euH1sqPpAm0AtIiZ0fs24Y93YxqqAHejKWgg4S8DfdCsBkSZm+fhrRhZ2tM9RoNVxM6Ze2guThrsWuzyC3Ma82qilSO7B4horGQvbEAR4TbPb9zzn55omfXR24tszAtHBjUtsytmrXlrXX3DHSVdDud79CJufxpge+OzbWLUu2bbPE8Qc/kmmLzCNj+ksqQluOL1OyMRGabJL+M/5KyQT3MzEpHdoK8aiwx7z0ny1KkeHSRRuMI1qY0pQwNWooJsPOlKJ6crY49oPOVVcsWofsB8fuxlfBAgGyhJLO02gj6lBxzqG5iDTEQ3zIXBoCPjJ6Ox
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006)(10067099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3FoMTFhZko5SUJFaHUrcXB6ZHA1TzYzazRSU1l2enlKT1psNnZncjF3SXV1?=
 =?utf-8?B?K1BHTjd1ZzNrQnltNmR4NFZUM1FLdVhQb0Vtb3ZvQmR6elU4c2ZiTmZlOFNl?=
 =?utf-8?B?cmFFN2J5ZWpYYldtVGlUa1poSHBtY280amxFSkdxOVhtb3hiRWlqODZmcHVS?=
 =?utf-8?B?V25LMnFUbXNNckhkR0VUbjdSLzhHVmxSMWUzeEtScE5PdXhVaytMSmkwQiti?=
 =?utf-8?B?ellid0JDU3ZFSXQ4MmV1NzUvazhqelBsalNNZStzYTFOc0ZZWU5iaEdzcVZC?=
 =?utf-8?B?K0gzR3dnV25lR2hFdXFwanhkd3BKejdId2lPNk5DUWorOHJaeFc0NlBQQlhv?=
 =?utf-8?B?RzhuQStKT1htSEcrYWNwU1Uwa0RZZUZEU3VFaEhSVEo5WFdFOHJ3eTJ0ajVa?=
 =?utf-8?B?K3N2RmJtMmxWWTBHTnY1dlEydzRPRnZva1orUy9oRjYzQ1RYSlQxeHhLTEMw?=
 =?utf-8?B?bzIvaFVQVTBiSnVsV3Y1TDVFTTVIM2ROTnRIVHB0UFFJNVdqWDZ2UFUyV2Mv?=
 =?utf-8?B?QWEzcDA1aVJIK1BGa2RXWElHdFRxcURKWHFFWGN0VmRJRFVoLytIN3FtVGE4?=
 =?utf-8?B?STFQQUppZ1hsN3pVWDQ2TFo0UXhpeFExSnVPenZNMzZGNUhSak0xY2FsUHVX?=
 =?utf-8?B?TkNhSXYrZHhnOGphdm1VZE1jZGkwb25jaERqWE1YZkt6OW9XeHM2d2w2aHpi?=
 =?utf-8?B?Nkh2K1diazJJN1BGVDFXZXVRdDVjQlJqbmgwakMzU1A2cDVtVnhIUjYyZWRw?=
 =?utf-8?B?ckJoc2JoeGI5YVpQY3QwZkkyOVg1K1V2cFhDZGNHVjJMMW8wdHI0V2ZFOTh2?=
 =?utf-8?B?WXIvNDFpZFVIWERhZXJHZE56TkgrRXlPSElnb2hZR0NGSkZxNzZqN2xFWXA4?=
 =?utf-8?B?U3dVaStPYjQzeW83ZW04QVltYTg4VGZHVVhLWW5ITmZkOXBqaW9LSC9zYnZh?=
 =?utf-8?B?OGF6enVOSTNzS0VlR2JybXFmNVVCNjRXR1VBV2UwQmtNVnNobUVUZUFmRWF5?=
 =?utf-8?B?QlZ0WFBOUnJ3RUxkTXhjcFZzVU0raUo3QlM3MHoyN1htZEhKMGpZYkF2VnBE?=
 =?utf-8?B?bW5DYW5KVU9JdzQ1Zjcwd2xMZnJCYWxjTjFVdEpyRWZ3WGFhQTdlQU13U0xT?=
 =?utf-8?B?NFY4SVowY2h5K1BFaVBsQkJrYUNJU1VJaFVKNnlHeHZXTDJXNWdMZFZMd1pt?=
 =?utf-8?B?WThSNkE2Z0g3N2pic2hjU3NMd3FMeU9qUG5CRnkwQ09QQ3IxTEJSQ1NuT3J5?=
 =?utf-8?B?Ui9la0ZpdFBIOHN2aDUvYkhyNEV1T2hrRjVGT2ZnQnVIa00xT0tWNGJyTXNt?=
 =?utf-8?B?bXhORk4yNFM5MU9zWHhrVzBYdk56TS8xNWRnZ3J5ejJmZ2hLdTJDbU05T1Iw?=
 =?utf-8?B?UzNZYlV1eVY1dVdjTTlzNXFWSnhXWDdLaFRNeG80Z1JtOGRxL3h4VFlzQ3NS?=
 =?utf-8?B?ZkR3MTZKNTdSRlpQRmRnTHFLbENlRkRsTCs5S0w5QXA4ZENtRkF5RnEzK3lk?=
 =?utf-8?B?ZnFPOE1URmFheW9tYVc4aTZXejJIeHlzaUlrSEcrdXRzdTdUTUtWckxKaWJ4?=
 =?utf-8?B?MG5SL3hHSjQ0dHZsdUpTTUsxaFRNT2lIeG04YmlzSk82ekROK1oxU3VFalhH?=
 =?utf-8?B?RWxRdERUZFlYTTN0eUhEY0gyRStrMXJrUUYrN3dweUpUdlVrSEU5OW5tcFJT?=
 =?utf-8?B?bytGVm5iaXplYVM1Yk9RRFUrM1B2MEx6Q2xLK1dhdUx3TXN5SUdvbGdkMm9k?=
 =?utf-8?B?WkhCV1hPenJpSytHNGhCZjdHYm5pdisxSVNwc0pZZ2pkMmRsV3ppNUhoNC9i?=
 =?utf-8?B?TENZbVlUTzJ5aTErU0JDYTNsT01HNVhUQTVzcVVnd3hBakU3OXpFWmRQV0VJ?=
 =?utf-8?B?V0hPaEZ4SlhXZmF3T1JHMVl6d1Z2Y0VKNUpQSDZ6Z0FRL3NNRll4RWVBMUFh?=
 =?utf-8?B?ZE40eit2WnBRZi80WFdtZEhyUjFCbUZhS2VVOENkZDhpeW5IRUlvL0hBTHpK?=
 =?utf-8?B?K1VqOG5NaVhtTytTQVlYcDNyUjQvQVpsb2p6bEVTcHpGSUw3eTVMT1BqeUlv?=
 =?utf-8?B?ZXMrbDlFZjEvVUtrMUZwT1ZUc0M4MXRLUTg3WktnR2FBczl1a1BPTFNyM2Ey?=
 =?utf-8?B?aTQvQWt6c1NBYk0zcjJwWFBVVnpBN1hJSFlrVnlSTVdkMXovaDhSWk5TME1o?=
 =?utf-8?B?RC9Hd25Ca3pheEJVUWlZREg0V1FHVWNyZG5rZ1hkb3o1Z01RTEhycXEwWkts?=
 =?utf-8?B?WmlGcFZzOXFwY3d1dGlEazRSMFBXM2VNQytnSWFaWlpORk1ZMGY3bU1IMzZv?=
 =?utf-8?B?YjBRTU8rM004bmRkQjdncnViME1Tb29PZDZNKzFuWFNWRlpRL0IvTVd3MjJO?=
 =?utf-8?Q?6maXiVRAlzcjV31Q=3D?=
X-Exchange-RoutingPolicyChecked: A+/tS/CO9QEodvNjyA1q34p+A1bMLc+bvvWE5X9lqY8mJISPEikXIGOVNtS1FlNwp4KW7A/ia1OzyWv/ZswYjuRR0kKU3oSPdNWFb6kYkcvU8FQWvFU3RHVph1ABbUOgQiQRn5AVlWeYXlkb2h3sf1VgUYHm4n7Ooe22JHguOwfiY197uW2nWV3bcLrvI672hBdSZyB3q+fKd4dIkQvwUOnW4dq1t8ZYtWENP8/FcFRrPv9aaxnj32Xge496ko14ijc0+ZfVEwcLnmn1yB16tyqrcSB9gUYdBbDylttIvDqhgVaT2zT1mX14irxmUa5DAcuBeKRfd4qKIcrYDS9epQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: df9183e2-b127-4903-4c6f-08def21b6571
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 11:27:41.6104
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nUvVvs2o5jHqPoKQ9kGntuunad5n0alE15Bt9sYSyPw4MxvtJLmmfc3p+LTIPuANRu3hxIFh/neHa7b0iAnsakq9VELhRmltPfiL1Q4WZrg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF7A0031045
X-OriginatorOrg: intel.com

On 8/4/2026 5:19 AM, Bui Duc Phuc wrote:

>> snd_BUG_ON() translates to WARN_ON() in debug conditions.  After reading
>> the macro documentation, pr_xxx() or equivalents are recommended when
>> dealing with invalid arguments.  Same results after grepping for WARNs
>> in sound/soc or in general references such as driver/base/core.c - it's
>> clear to me the macro is not used as plain null-arg-check.
>>
> 
> I couldn't find anything in the snd_BUG_ON() documentation that
> explicitly says the
> macro should not be used for plain NULL argument checks.

My message reads: translates to WARN_ON() (..)
And WARN_ON's doc is what I meant.

> Also, there are quite a few places in the sound subsystem where
> WARN_ON() is used to
> validate NULL arguments, for example:
> 
> https://elixir.bootlin.com/linux/v7.2-rc5/source/sound/usb/endpoint.c#L857
> 
> https://elixir.bootlin.com/linux/v7.2-rc5/source/sound/soc/ti/davinci-mcasp.c#L2476
> 
> https://elixir.bootlin.com/linux/v7.2-rc5/source/sound/soc/meson/meson-codec-glue.c#L59

Nah, these are not plain null checks and if I missed something and any 
of them are, that's a patch candidate.

> and even in the Intel code that you maintain:
> 
> https://elixir.bootlin.com/linux/v7.2-rc5/source/sound/soc/intel/atom/sst-mfld-platform-pcm.c#L31

That's a clear example of when _not to_ use WARN_ON(), good catch. :)
Maintain != reviewed/acked. Many maintainers maintain code that they 
inherited and were not there when it was merged.

> That said, I'm also fine with not using snd_BUG_ON() here. Replacing
> it with a simple argument check such as:
> 
> if (!dev || !card) {
>        pr_err("invalid arguments\n");
>        return -EINVAL;
> }
> 
> is perfectly reasonable to me. It's not a big issue either way.

While not a fan, still better than WARN_ON().

>> Updating just one function with the check raises the question when
>> reading the file - Why just one devm_snd_xxx() has the check and the
>> rest do not?
>>
> 
> I think the remaining helper functions can be updated gradually over time.
> 
> To me, this discussion itself is a good example. You and I interpreted
> the intended use of snd_BUG_ON() differently.
> I don't think the macro is wrong; rather, its intended usage is not
> clearly documented or consistently reflected by existing code.

Not a fan of snd_BUG_ON() in general, I'd rather have it removed and 
WARN_ON(s) updated is one believes something is missing or wrong with them.

Anyhow, it's up to Mark. I'd avoid selecting just one function and 
filling it with null-arg-checks.
