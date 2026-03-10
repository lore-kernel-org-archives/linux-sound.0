Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50485389116
	for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 11:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773141643; cv=fail; b=ovx081zXZykiSuGjCcOru7xzyYJ5nq+sXXntH0retj2oP0EjrYLzehn1KcWC+R7oQ+qrw5YB2//MsjaHvD5dr36noZIFtuq5oC4OUqmlAi2w7wJp81f55gjC7V+/A6iVcWXURpWUMCG9HArKTJh9o+vB5WVD6qamu5469XvcOzo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773141643; c=relaxed/simple;
	bh=p2Rwda8VZl2zCrtIdGu4wV8gqzF3MLOAw/1YfqL+36U=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qtAk7lbtQWhd3+B4W98bgiptmK6JAlym+5RasQax+4UNhaRYDamU0Ngw0vfHYxlLQDwIUj8HaB767rwefuZE1ag2YCk8owigKNyZ+ebasIy4w/Qg54aSyMsE3weJPdQLs3VTT8y868QkeBQyBzTIy4vv8djj7Iuh64YckuP2hBM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XPiuO3IQ; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XPiuO3IQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773141641; x=1804677641;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=p2Rwda8VZl2zCrtIdGu4wV8gqzF3MLOAw/1YfqL+36U=;
  b=XPiuO3IQKohDWEoXdvjJFqn0kTnFLz44ieWYiAAqp3qnbGuk0UOeE6dv
   Ox+rfJYFgvmZieJEpsT6e+Jtfs1vUJotkXQcRigYpxFbsJnoiEI6AXq/8
   enoPUzUrllbEr5V7H/ws3SRKA/jfmGPdj9j7OuRIAc5YeQuPNpo30l7se
   Y5UWmipAS8B/bm/MQJgc2vFG/2oZ/GcE4HRZ35CBoyY2OgcmJGksia4U7
   6XNytcjDXhymQivH9VXuNhcXLza12H1DZYT3bTDRFH0ws/5sKgfa4O79c
   5DDZByYrKV0gD+bp8380FB+GpUoOpHhBQkoHD5oztZNL7jwFRozs1DrRs
   w==;
X-CSE-ConnectionGUID: LOEqHttVRXGYey0QfnEbkQ==
X-CSE-MsgGUID: H5xaiB8/RPCVCDUgqH+5Ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="73204977"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="73204977"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 04:20:40 -0700
X-CSE-ConnectionGUID: OojtnzSTS/+tD7ZyczUSxQ==
X-CSE-MsgGUID: Fq0XP3csQHyc4YfQDfJmpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="219319906"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 04:20:40 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 04:20:39 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 10 Mar 2026 04:20:39 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.17) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 04:20:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cIWvvWi7k0EBTgELWOHoRzRJhEqm++HHYNJzwjJEYbZVVfI/U4eOQTXiFW4pYYSOXeyWKOEy3MLd311Xdrt09y+MktWFkb6FMtiV+TkxufFrL9ZrLChMnQcJ+jzmjHmgRlv5//2g9zesPNetoJmukjoegWHgzXnjIgcsbofjt6Kh855VqkbkOmpbskob0VGCGDpdFCUT2aGHJ99eKlbRJg0wx3iTmnvCbJRBupZq1rpyodiaWPO1XL7JXE/9TCSiPXJUolPPLrIySn2mDa8wpxIwHiN3RN0epiSUO5YLbuOYjVKnxzYnT/Oa2SVZujWh3F2UnhG4BcxqLgCFcNJPFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jBBBZnvAN6L2EzgNvQXMIHYNDNCxWtjPt2sM/TUjWsI=;
 b=Q5V0nbptJswFzWa2CginZWQc/Je01/eOVCc6vcpjWWHesrkUdFQg8v6RlTJVbW6maJyQlIjwBwG1d8R5inS7uca0x7kAwYRagTwJ8gFuAkrPX7sJevtEZfqbpRggcXH8G3YpvoP+DZ74LPgevrDBkGv3tvdK/7emsTzBrzhrusUiky+rErB6chm31erohNsuIE+r0NLN8vU+JfA5cvVZHSxeC7LoZesHBBuqb3UEgzX0DvfTiEfFzZMTmLGakeSqYHBsB7awWUXGSoudNU/tkVitdolnh3yQKElWjcIwdWI2E2WG6mJOzBqVycJhTPsbUQPbDHS7zaNxbicDoYW66w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8283.namprd11.prod.outlook.com (2603:10b6:806:26c::16)
 by DS0PR11MB7458.namprd11.prod.outlook.com (2603:10b6:8:145::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 11:20:35 +0000
Received: from SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214]) by SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214%6]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 11:20:34 +0000
Message-ID: <3582df07-8d1d-488e-b76b-b8c288d35ea4@intel.com>
Date: Tue, 10 Mar 2026 12:20:30 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2][need test] ASoC: core: cleanup card rebinding
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC: <linux-sound@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
	=?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?= <amade@asmblr.net>
References: <87y0k8p6ds.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <87y0k8p6ds.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0408.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:83::6) To SN7PR11MB8283.namprd11.prod.outlook.com
 (2603:10b6:806:26c::16)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8283:EE_|DS0PR11MB7458:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ee805d2-6c9d-4211-8ffc-08de7e970c67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: FCdkWp4aIWjc4tWrDxz1zW3Yyvuoo508/y8MiJmjO0sdAc/TwHpAd7HadHQ01IArzcaP6MunuaYloCs4WiaSgJW59PNZ6GeutRH5Qjs1t7zbbRn5Eu/p58qmElruWLsIui0a15hDzvgDZFG5+XsbOiw/S+I+QFjL15REkzz13fwUiZlfkZsSnu58tEFVu1iN1oTm9dSMv9+MlPolPceWdT7sgaVZPQK6lp7Wm6p38Rr8I6Soby1Jv1xg+SDHx8IOxwRQAXhhgnU7k3K+cHB7qOCzwjvGjh3lHAyZ2Jmm4Q8yKeu7BakmVgDGHo2pH4nhhtaPT1QCjqswFTghHurrIvsf4CufryA3ATNKUtpHSe3qzL00gtLk7qwyqReTtLEBtNnpspNky+xGhl3L2CC8J4WvYLMr8uI+Zmd4x3pcVHOuPs48JEWpbBdvhrHlC5Pnz0vQjiIKZHVXcgV9vTRrzCWmewbUsLoeI+81wK8u6GwIsgSVW4q1D3tNm82aeQ2pQ57oLC5NmzPN7oOrm3zBn+rxpc/X2A8q8fPOnh7BCcsaR/ER6map7k7rqHLwmB1FJt2LwWIwiDTddhxXXUyEDC3quZ2RlCV51qg7dCK8eVelLqFXjaCoVx4OUmQVgoPyNycnIMoyI4/o2LVHXTT1LGqqkVM+1PsKvdrK3xKt3IEJV7aoGOYL3vo7jD4647otfjX2DNSM9EXK7qsXAC0ObJDpl2o7tLV3cWHXB9sws14=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDAxUXRldTBHRjR2N0c5SGlSNXJzOEZSOUlSYmpXV1RHeUhBS1FCeFRVOEZn?=
 =?utf-8?B?VllpVm0zdm9NRU9XaGNiYWd5WllOczhHMzFqeUN4bUdzaGJsNVFLZ3ZnRkJ5?=
 =?utf-8?B?VzRxbC83ckltajFpL3IxaS9laG5zRzJLWFBvQ0VuSFYwQnh6Z2pBSDNQZEVr?=
 =?utf-8?B?dnFpZGxEQXI3YnFjZERQNEZDU1V1ZHNTUmkrWDJaWFJuSmZpOUFsdFNXbVRQ?=
 =?utf-8?B?UjZCdGVkUkVjZnA4TDg2dUhCZHAyWFVGZ0pLVy9HS09MUnpJK0xyYmtVdkkx?=
 =?utf-8?B?SjRRVWtwQkozOWNwYXRRVTFSMDltdjBNb0JCYVBodEpyL1ArTmpzKzJ3d2pW?=
 =?utf-8?B?dGlFV1VXdGlzaG9jWHE3NGpPV3c4ZmFDQlh4UzZGVmRnTm0zOFQwUnJ5TDNi?=
 =?utf-8?B?dGhodFY5L3F0MksrZ2pSZ3RYQnBlcVhUR0NuWTFUTEM0bDFVS21qdUJUUW9H?=
 =?utf-8?B?ZXNYeE5ad3hVS2ZMR2toa1p3N25rTnEwTFlackRPcjkxWGRUSnMrRVY0ZG1z?=
 =?utf-8?B?TmhXdm5GWnVuTnBYb0V5QldienBUL1RlYTV5YmVDNXJxS0dEY3lNL2Jjbldm?=
 =?utf-8?B?Y20zUXNqaUNNdC94cmN2R3ZhNjhDbWxTS2NwU0t0RjJUSkxpOWpMQW83aWpD?=
 =?utf-8?B?cUFrOVdJR2pFb0xIcHhkZjUxVFM3aGNHMWpYZHNBR2YxQ1NXNTAzM3BaQ3p6?=
 =?utf-8?B?U3ZvYVMzaXI0b05Ob1hid01PSGlDenpVaUdKb1pQYUFFU2lFOWlIS1BhQzJY?=
 =?utf-8?B?YjRiZWdyL1BCUmtzNHYyQ1JLc0NCUXVkVVNWVlh0dFJyV0tibFpEYWNpOE5V?=
 =?utf-8?B?N2szeXhpQmVVTFNsZVpjUitSVzlyS1A4REIwMnBqcGpCU1dFdm1zZFl4Mjlv?=
 =?utf-8?B?VDhuWWhDeWhHNjVtYzN4Y0JCZ3RqQ0NlRHVUZ2o2L1ZuRVIvYm41Vjg3MkRM?=
 =?utf-8?B?aGRUak53TnU5MlBqc3VWditZTXo3OWptSU5IblVBUkppVmRrVFhDdmFReW04?=
 =?utf-8?B?eGZMMDZFenN3eHRMeVhVN0I5UFhaV0ZhaVRQLytvWm4zcmNpQjljaW8xMlkr?=
 =?utf-8?B?V1o0aUFGUlh4OWNFN1pMbll0MHRMZlNTTE9hZU5HTXdTOGFEUWw5RjNIcUUr?=
 =?utf-8?B?ZTZrT09ZVkFPYnI4MkoxTEU3NDN3Mk9MSVN3TVZ0ZzBlTm5adTZHcDhJN0hk?=
 =?utf-8?B?UHgxYzB4RTl4d1M2NS9LWWVVYU1FQW5xV3FRR21XK3RCUkJ4dmZYbHdmZklG?=
 =?utf-8?B?ZGZGaGl2WTh5VWVNZjZRYUs1bjNkVVMzZGpXMkgvR2NVbThPanhwaEpCQzh5?=
 =?utf-8?B?cnpqeWdhQnJBWlBMMzZWUytGOWNZNXlYTkJaeFdBeDhrcWVLMzdWUS9CM3d3?=
 =?utf-8?B?a3ZRRmtPcUFrWE5YTmF2d3d2cXpHNmFDekRMMDdpTmltN2NUcGxLQUlrZGwv?=
 =?utf-8?B?bys5MktVVWZkMUlheWxDNEhJQWtzWndyNllUTjJFWmh0SGZQbGNTdEhvOG5s?=
 =?utf-8?B?K3JFdXFrNVNydkJ5VTc5RFNsK2hxTUhzWW1ieDBYREpHTkRDZ1pBY3UyMTlw?=
 =?utf-8?B?d1UraDEvNzRLSzlvMFExK0ErUk9qaElNZnlVL3p1dllGYnI4WW5WSlFaZ01I?=
 =?utf-8?B?ZU11WW4yNGJ4aVYvcjNZTFJJQ3B6VjJSS051emtabjBEV01OQlk2eS95Mkt2?=
 =?utf-8?B?dlNzRlJxWTVhczJ2eTdWTkxVRFVaVEtRbzhNTVoveE1rdlBweWFNVy9CbFYz?=
 =?utf-8?B?eS9jaitxenhvU0pTSXFqWHdQOHZTdnkwNFduSzAyZWVMTVRJS3BZV1VDT2sw?=
 =?utf-8?B?YTRmdEQya0ZSRlhYZ0tHSHNyRkV3NEFrTkdDTEhqRUVjNEwzVEFDQ3BTSWt2?=
 =?utf-8?B?V1dPbnpTVkNqT3R6eTBtTzRNY2RuTHowWVR4YnpRU3I1WHJPWGhzaTU0c2Rs?=
 =?utf-8?B?eUU0b3VITG1XSWptbkFpcUtxOHE3VktRTDcrQVNqd2VYbkV2VHV6MEFQOWN2?=
 =?utf-8?B?S0pFRUcrTVEvamtxUlAzWHIvT3c0SlNkVkpLZ2F3UEgwMGlNV3F1bE1NWjZq?=
 =?utf-8?B?VmdDUW1QMFdKbEFrNytxMWpGYmJuNU1udWtCM0dDQk8rRmJGQlNtbzNYaG9X?=
 =?utf-8?B?Yk9LeDhUcWYvKzdEWlVEVXVFek0rRzRjUHFVUTc4T0d2cjFzeSt6aXdaVDlH?=
 =?utf-8?B?TGFJOER2QlduUCtBSElUeFc1OTN2RS9sdE9KY0tXN3BOL2E5WmNVdjJ1WHlR?=
 =?utf-8?B?bm5VQ1pFeHdsVnRsQ3duNVpFYlJvaEljZnZyc3lsN3Q5Z3NrN0NnNmFqYkZ3?=
 =?utf-8?B?aXRldVFUbHZZRHFHczMrQmhsakNSSm96WnNHUERYQXRiZEE1bHJPZmViN2Vn?=
 =?utf-8?Q?CSqIqz0lZLG5OLs0=3D?=
X-Exchange-RoutingPolicyChecked: N079I6lnQSgSuwVzrIMLj6uB0eXK0IOa05wnfA4s5bCIyUsVZIaVmj/fw77SU/5V1cCzquCORebhEQhsPseHmq8SZFLxIt7LsJ7iKLIDWTUUlOUlj6v2ASxcJ3G+kikRxjhzDhlt24L3XiDGTc59tabYGeDs+9pHnSn1uFM9uXKNU72/IpUX0eTgwtrHzEgnfbbCJyVj8sRIQBj1qqZN36ZSFJE6VfVVVCAUBtVfrg7Kg9sxpoeMwgyJrHrjjEryKtNelDCCr0EFpWY+VfkEU3lDZcaH0fNjHm2zT+wurj0AV6vFTbCv4J2hzTV5DNWwPmRp21v2Wjs+syv7K8QavQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ee805d2-6c9d-4211-8ffc-08de7e970c67
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 11:20:34.8748
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +r1GtEI0n/T0uuUrvtoTDsMO5T42PPukmWXb1nQJAqgtMt9Yzin9y90AdEdRGDAT6SGco7aGDCPAdniY/KIkv0bKMK0ezR3TIle9q/CQRtQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7458
X-OriginatorOrg: intel.com

On 2026-03-04 5:26 AM, Kuninori Morimoto wrote:
> commit a3375522bb5e2 ("ASoC: core: Complete support for card rebinding")
> supports complete card rebinding, but it uses unbalanced pair functions
> It added devm_snd_soc_bind_card() (= bind), but its inverse function is
> snd_soc_unregister_card() (= unregister), and it adds new
> devm_snd_soc_register_deferrable_card() (= register), but it doesn't have
> inverse function (= merged with above inverse of bind function).
> 
> Thus, it is difficult to understand, and difficult to cleanup soc-core.c.
> This patch cleanup the rebinding code.
> 
> The rebind method to connecting to "unbind_card_list" is merged into
> snd_soc_{bind/unbind}_card() which are used from all drivers.
> This means no need to use special bind function
> (= devm_snd_soc_register_deferrable_card()) to use complete card rebinding.
> 
> When it bind the card, and if it failed with -EPROBE_DEFER, the card was
> added into unbind_card_list (= snd_soc_bind_card()).
> 
> When it unbind the card, and if it it needs to be reused, the card was
> added into unbind_card_list. If not reused, the card will be just removed.
> (= snd_soc_unbind_card())
> 
> Because snd_soc_card will be capsuled soon, separated from mutex_lock()
> (= client_mutex is soc-core local).
> 
> It renames function name. Will be moved to soc-card.c soon.
> 	snd_soc_bind_card()	-> soc_card_bind()
> 	snd_soc_unbind_card()	-> soc_card_unbind()
> 
> All Card user will use complete card rebinding by this patch.


First, the general idea behind the patch is good, and I agree that 
things can be simplified.  Plus, it takes some confidence to do moves 
like this patch - and I'm a developer who favours the bold :)

Having said that, let's move to more grim comments.  The title shall not 
be worded as "cleanup".  It modifies the behaviour of 
card-registration-procedure for all ASoC users.  There is a reason my 
team and I prepared the patch (mentioned in the first paragraph) the way 
we did - provide incremental functionality rather than altering things 
for everyone.

The last sentence of this commit message should be the first one.  The 
title should be transparent e.g.:

"ASoC: core: Rebind cards by default for all users"

> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
> This patch needs Tested-by from
> 	Cezary Rojewski <cezary.rojewski@intel.com>
> 	Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>,
> 
> v1 -> v2
> 	- tidyup handling of client_mutex
> 
>   include/sound/soc.h    |  6 ++-
>   sound/soc/soc-card.c   |  4 +-
>   sound/soc/soc-core.c   | 86 +++++++++++-------------------------------
>   sound/soc/soc-devres.c |  7 ----
>   4 files changed, 29 insertions(+), 74 deletions(-)

...

> -static void snd_soc_unbind_card(struct snd_soc_card *card)
> +static void soc_card_unbind(struct snd_soc_card *card, bool reuse)
>   {
> -	if (snd_soc_card_is_instantiated(card)) {
> +	bool instantiated = snd_soc_card_is_instantiated(card);
> +
> +	if (instantiated) {
>   		card->instantiated = false;
>   		snd_soc_flush_all_delayed_work(card);
>   
>   		soc_cleanup_card_resources(card);
>   	}
> +
> +	list_del_init(&card->list);
> +
> +	if (instantiated && reuse)
> +		list_add(&card->list, &unbind_card_list);

See my comments below - not a fan of unbind_card() manipulating 
card->list directly.  In my opinion this dilutes the responsibility and 
counters the main argument of the patch: "let's make code easy to 
understand".

Removal of the manipulation here simplifies the implementation of the 
function too - no need to double check for "if instantiated then".

>   }
>   
> -static int snd_soc_bind_card(struct snd_soc_card *card)
> +static int soc_card_bind(struct snd_soc_card *card)
>   {
>   	struct snd_soc_pcm_runtime *rtd;
>   	struct snd_soc_component *component;
> @@ -2306,51 +2313,18 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
>   			pinctrl_pm_select_sleep_state(component->dev);
>   
>   probe_end:
> -	if (ret < 0)
> -		soc_cleanup_card_resources(card);
> -	snd_soc_card_mutex_unlock(card);
> +	list_del_init(&card->list);

Perhaps git option --patience would help here.  The diff seems all over 
the place.

I'm against modifying the list unconditionally here.  If the bind fails, 
let the order of nodes on the list remain at status quo.
Right now it acts as a "protection" against possible follow ups.  Either 
there is a need to modify the list or there is none and don't touch it.

>   
> -	return ret;
> -}
> -
> -static void devm_card_bind_release(struct device *dev, void *res)
> -{
> -	snd_soc_unregister_card(*(struct snd_soc_card **)res);
> -}
> -
> -static int devm_snd_soc_bind_card(struct device *dev, struct snd_soc_card *card)
> -{
> -	struct snd_soc_card **ptr;
> -	int ret;
> -
> -	ptr = devres_alloc(devm_card_bind_release, sizeof(*ptr), GFP_KERNEL);
> -	if (!ptr)
> -		return -ENOMEM;
> -
> -	ret = snd_soc_bind_card(card);
> -	if (ret == 0 || ret == -EPROBE_DEFER) {
> -		*ptr = card;
> -		devres_add(dev, ptr);
> -	} else {
> -		devres_free(ptr);
> -	}
> -
> -	return ret;
> -}
> -
> -static int snd_soc_rebind_card(struct snd_soc_card *card)
> -{
> -	int ret;
> +	if (ret < 0) {
> +		soc_cleanup_card_resources(card);
>   
> -	if (card->devres_dev) {
> -		devres_destroy(card->devres_dev, devm_card_bind_release, NULL, NULL);
> -		ret = devm_snd_soc_bind_card(card->devres_dev, card);
> -	} else {
> -		ret = snd_soc_bind_card(card);
> +		if (ret == -EPROBE_DEFER) {
> +			list_add(&card->list, &unbind_card_list);
> +			ret = 0;

This is a breaking change.  I'm against updating register_card()'s to 
_always_ squelch -EPROBE_DEFER.  Let the callers decide whether to 
squelch the error or not.

In general, I believe it's best to treat bind_card() and unbind_card() 
as workers.  Let them do their job but let the callers decide, based on 
the return code, what to do next.  Phrase "next" includes 
unbind_card_list manipulation.

> +		}
>   	}
>   
> -	if (ret != -EPROBE_DEFER)
> -		list_del_init(&card->list);
> +	snd_soc_card_mutex_unlock(card);
>   
>   	return ret;
>   }
> @@ -2578,15 +2552,7 @@ int snd_soc_register_card(struct snd_soc_card *card)
>   
>   	guard(mutex)(&client_mutex);
>   
> -	if (card->devres_dev) {
> -		ret = devm_snd_soc_bind_card(card->devres_dev, card);
> -		if (ret == -EPROBE_DEFER) {
> -			list_add(&card->list, &unbind_card_list);
> -			ret = 0;
> -		}
> -	} else {
> -		ret = snd_soc_bind_card(card);
> -	}
> +	ret = soc_card_bind(card);
>   
>   	return ret;

Well, the assignment is clearly redundant.

>   }
