Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478FD3BAD92
	for <linux-sound@vger.kernel.org>; Mon, 13 Apr 2026 19:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776110230; cv=fail; b=JPRwzl8TbBFqU/fZh8Ng74iO/u2/x4NKuQ35E4waOA+75/I3XptlkrUTnYhbdmamGW+pWXFbvIFKezv+W5bPaC7if/LD0JmHtSiBoYx2OUhbIuYl+bASLjr/jphZ7DLdQru/WJVqj7PvtxbCydUaV8tCcOOmM44dIYvC5/nps5o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776110230; c=relaxed/simple;
	bh=RXnNVKqXM8UtDlWsVU433TCKEcRbOyi95q+ZD8mnXwg=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Z2vVuKjhnS3UUGFWRJdY8B20qYpBPm0v6lvENPN7AVcr5sE+x1GNghOGM5yDrJGDL+aTyzYa8kNWaOf4+b04HbWEQ1LR1jfbWTLUKLWqPat8LQ43raDcF+1DdNHtE7MxVhhsWGl1qY51TAWvqR+rOndrT2E7v/+CMOGorFL49OQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MjculH6k; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MjculH6k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776110229; x=1807646229;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=RXnNVKqXM8UtDlWsVU433TCKEcRbOyi95q+ZD8mnXwg=;
  b=MjculH6k/KGuzH95UgodEYkpGQzK+VAnuqWN8ZFB2CyBZS6SyyKbekur
   Tsr15+MrqWz0dHlnL8bn7k00TkE6g+L7ar9tuy8BcGKKNFFGXx65s9GNk
   8Wzz6nd0DmkgyMGnoqtUmJjECVKXwML4Sw7W3AICdFcMV98ytacCQxDNu
   UqmKFtfrDgud3sRzT++GbPj64X2Xp0GiFxQAoFwdVdmJNKq6++zWjqFM2
   SwqeWgKbmB87P5sfOdFm0MbNb8Vuc6EN/E1XNESsP7NpnZw8z/rzPjyXm
   eoPOAbmwIyRhVoFKGdclHeyJvpL6yq7091lpM+ZDUa588vimt63chnVtP
   A==;
X-CSE-ConnectionGUID: /OmGpIR7R02rNRHxEHmhtw==
X-CSE-MsgGUID: qNjthUFyTvyz/1j3/1ILYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="76221555"
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; 
   d="scan'208";a="76221555"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 12:57:09 -0700
X-CSE-ConnectionGUID: +xnFTVT/QP68t+s1s8MTMw==
X-CSE-MsgGUID: AignPl+PR8i5Nh8qhEtNWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; 
   d="scan'208";a="228838241"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 12:57:09 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 12:57:08 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 13 Apr 2026 12:57:08 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.35) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 12:57:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I6PvkUVLGlFm0VhBTMJ3EI8KkEvYLXdGoM3HW9QA/B79gegLAW46EDmqRf7aWLPvxsnoF9yGvVcHu7u4KpEh2q57S+QRwfRJx2DMXk6k07pbwxnqIdKCuk+/i4+0A+sazoX1fnyZ/HVBaaKxjtzp+BvJd0fvewUHPsLlbRlMappMlrc5RL49zhmU0qK974IVeFzc+N32/0f3R9geRON+Jzk2FHmVjFA9rDbX2Y+m49WYdEt4dbFewD14rGmk3Od7720jjyt2rWtDq6negi4Nmzos79C8PyX2xuEtxA6wgF4vWv+IfcmOWFG6bGxnlOVTbE8lsrCBzmWaNZgWacrYrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GmhDsR8EXvYfGbNeVvKXqOxzC74OJwBTtlmUJu2IGl0=;
 b=Q6vHdu3dsoDeOeQ0M+8+HOFQxpGNOFUc5XK9uAJklbbqJI/P6Pv8BDhkLfOQGt5NaHt73l8l7kRWxXhT08Y0aHB4kcU6ZYYvZLsgaa1j6l7ypQKxBIMpkplxrC++314F8b5WZ7sap9zJsgrs9jXjhac0eAx/mU8fVDck5sp3QhLQwzyXstoMO+BKu1UK4Bf4e8SCjv0RJiKaXGrse8dmdEGi2zT/OKKQ9VPeHgoT2uNo6gHyhW+qbGFJGnTUYV9v3tknub1V804n6QGa18UL6IIWGfBtL9Io2r5w2XrwdNYMq1Yb5Muu9MeWVPG9iIRVyaQNgq41Pe9ySJ4O87oiNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by DS4PPF46B98A11D.namprd11.prod.outlook.com (2603:10b6:f:fc02::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Mon, 13 Apr
 2026 19:57:06 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%4]) with mapi id 15.20.9769.046; Mon, 13 Apr 2026
 19:57:06 +0000
Message-ID: <c54dc8ed-18b7-4914-835d-a17a0e32bda2@intel.com>
Date: Mon, 13 Apr 2026 21:57:01 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ASoC: core: use Complete rebind cards by default for
 all users
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC: <linux-sound@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
	=?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?= <amade@asmblr.net>
References: <87y0jsibki.wl-kuninori.morimoto.gx@renesas.com>
 <87bjgaxkdb.wl-kuninori.morimoto.gx@renesas.com>
 <a53ac4b3-1774-4e78-b88b-4316ffe73cd1@intel.com>
 <87ikacdcdj.wl-kuninori.morimoto.gx@renesas.com>
 <87jyub396o.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <87jyub396o.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0010.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::10) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|DS4PPF46B98A11D:EE_
X-MS-Office365-Filtering-Correlation-Id: afb93199-80dc-4a3f-9288-08de9996d691
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: CdqFHAtzXMVJqzgxxhu8KI/TRqvxCbm9XFjPAsV7aToOWu0PiniXXOe+C+nZJ3ZNf/zZALgitOvfI62eYdUs9wtAFV7hopoVKQbuBqf/p9yRGNWedcKvMGtj+2Owlt2jHBixSz4inYGiJbLX5QUMYN0mMblUESJwyKaEQeXf/bdL9znpenxFKOXIM1tKO6JlFoegxSfAn5u93aOUn6JVACnOWsFvdfSf4u7yVD8A7Zzim8LIvpyshgxunxuF2E4ucLj8obu1+99g+e5JnatdZR58l+T5wU2/3qcfCHm9uqj0Q4AMywF+dyHbVaCE0P02sRpl2MJu1nCbG7/nkEUT/9DJC2RUrDpRDaKj0Qjjr//lBi3EghOfsOu/GssdgoR7/YK9pYpoPIg6eR8HEBB2lIhLRGIJ5n7N1EO0wUX+BOGBGMl0So7OGdmk7vDZVZ9qFUhnQB6KcU9UfaKuUJ0UKaDK6G1DIiYqdikwGaxLV2lUkHX4jtC6xoWhJlvMJ+aidrMI1YuNS6X7PnPSkQ8gAS5JLM+ecRq5IoJzh3dlbjR3RmuBi1Ba6l1cKaOJeGiujpVXlklE2A1wviaoJpgvJlg3gPILgXC3aT0ghaapVQu9ee9f4jB0YuLI/uaE0ZhyLjIy4Px3THDKseI4A79/cG/kPkgZakowDbcD3dHq6IjASCjNFBd908U8Ypl0KvtLrAT/dq6+yOPPxwZdSkaL/a5gNkz5Aqg2wucM8SgRlC0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUFGS2kzQ0l5Q3d4eXFSamc1bUZ1d0NuSm1ZNGhRd2dIMWxMU01LVENrWkhk?=
 =?utf-8?B?NGZQZnd3T2IxNU5Xc216Y3l3R2U3YmtacnBRVVdtOEF6OXR1cUNYMHJYWWdq?=
 =?utf-8?B?ck0rQnIyVW1xREMySWlEdENvVnVWUnIydkthSHN5NkN1K2xucW1GeXYwRkJY?=
 =?utf-8?B?Zy9WV3FxeUhKVG1XZEdjc3JuM0FwcndqdVdBdmNPWXl0TEhZejk0Z3kyY0NH?=
 =?utf-8?B?U2RZemVMQ0xlMm9GbFM3TGQxNnRLRzN3NkJFSndWbU56ZnVWbjU4M3ZoT3Ev?=
 =?utf-8?B?cmxZbnZtMXlmUCtiQUZHRGZJWGZHUFMyeVF3Nk9zYnhyNjBtdWdhZTdpU3hl?=
 =?utf-8?B?U1ZmM3JtbVZUUC9SOXNaYVNkZEhwMWw3WVZSYXh3aU5QT2VuOXh4YVI1NDY0?=
 =?utf-8?B?SzJXcGlXYmM0RWxuYmpaSW5yc1orM0pHd0NhZzl4a0JaclZldjltMkZGUmV6?=
 =?utf-8?B?eVVmUDFOanYzdzVoRVEzQm92ZlVjV3B2N0VwUkhQQkZvcWpxNUZ2UytCeHNr?=
 =?utf-8?B?K1AwYzdUbk93UXFBaFJFSHhKUmtveDAvdmRvWE1yWHBQWkJCWHp3Z2RrVm9L?=
 =?utf-8?B?VnlpVWkxM3NVQ3o1MlVQd05xQ2RCWUNPRkRYNk9CMUYzanhCVXFVZ1daU1FI?=
 =?utf-8?B?QzVWb0s3WWRxamszbUhJWW9ST2RqRkdIb2F4U0Ixay9yMXZ3Mmo2SWs2bytE?=
 =?utf-8?B?cjhXWThlTlgvM0ptemtyS2swampmQlNnRVhxcUZnWkxGVkVzL0tXd2kwZ1hq?=
 =?utf-8?B?ZTEvTUJXZSs4ZEJ4ZHF3b1BLQTRuK3ZkRFN4d3FxRGJ3Sklrc1VlZGphVDUz?=
 =?utf-8?B?VGpLK3Jtcm54VWtGS0p3L3pNdlZ5c0lLZnhvamUyQm1RQTVDOXRuUnBmZ1Zk?=
 =?utf-8?B?bkc1a1ZFWG41clppVk85bmtkblVJWmtJUVdkUWtsaHJSOWNMR2d1K0FQNFpi?=
 =?utf-8?B?cCttYkRVeFNBREJucVRCOGdvS1I3YUZtVVorZzFEK2hhRDgrZkJqeXorY0lS?=
 =?utf-8?B?SUl3dGdjcFlIejlPVGlDYkJuQkZHQnF5NmZOTHFabmxtdWtwZGpFSDlPaXQ2?=
 =?utf-8?B?VE5RZzd2V00rWmtyWHJKdkZwcUJDcUJ2ZzlHVkRaWWlIM3RtbXhTK1hxb3FH?=
 =?utf-8?B?RDA0ZnQvQmtqNkxjeE9mUkI5UG1WemEyNGhxdmFRM2JiTW93S2NFWUtLdG1u?=
 =?utf-8?B?NzBGTWFSWGoxVXJLRUtxRXJ4QzA4eTY4R1Q5N3pHYkhPZzRDQW5TVk94eGw0?=
 =?utf-8?B?WjN1VVNLMVlSdHlDYlE5Wk5WVnhzd085SEtieExwUllqN3BZRmtONkFZVVBx?=
 =?utf-8?B?dzJVWEwrODcvYkc0ZWVmMFhOYzFsWGJrQUg2TURzTzBpMSthVWl5NUZwV1k1?=
 =?utf-8?B?TEJuQVRVcVFXVWdnb0x4REp5RkVFaDZSMjBEUTh1cU4rM2dZSFVVWmovRS8r?=
 =?utf-8?B?eXdQMkZCWjBSSU5WZUlzeVgySk5qNjZPcERyeCtLMlFid1Y3VENPS1NHMTJu?=
 =?utf-8?B?Q2h6WXZiUFJDeDNjOThtZWcyTk8xN1JHek41Z05iTmNRR2FxT05nZ05BcXZz?=
 =?utf-8?B?SmFIT2plY25xSHlIdWJpOXY3VDVFYzNMYXVkaGhGb1Y2aHZjM1ZQSzFtTndl?=
 =?utf-8?B?eUEra1cyVSt3UzVDWWZiZ1FQTWhwVjY0UGQ3WnBSZ0N3RWJMemFPRk9hVVdH?=
 =?utf-8?B?YkpBV0N2QWtTZ0J4Tjh3VzdFRUdWd01BRGZ0OUNJK1NySElkelg4UTZGQ0Vj?=
 =?utf-8?B?bTdjeHRocmlZZFowdkp2bFFpWnhzZEdIQVZTMTIxZFBkR0F1THBaMisvVDRG?=
 =?utf-8?B?ckk5ZWpnVW5ueURyZjMyRWlyekYwYmRjdDEzTUw5S3dneWFTaXo1ZjBwMU1G?=
 =?utf-8?B?QjdqUVZPYmpocnphOGNWZDM1SGRtbWNmelNEQWd0MGlmSCtUTGN4RTZCdmFj?=
 =?utf-8?B?Wk9JVTlhRy9LMW9CVTlGWGVMeHhnZm9vZ1lETjA3c0poTmJuZWtkcDlDa25M?=
 =?utf-8?B?U1dtRlVGMzBKQi9pK1hyMWVWbms0alJ2M0Z3R01vaXNjcFZpWXRKN3A1aWE1?=
 =?utf-8?B?TGNWbWxHeldUaE1GMmlGakpPeitlY2FMVEJKMDJQV3ZRSFNjOCt3dmdWSFRY?=
 =?utf-8?B?NEc2ZUJLZldBNGFZMVM4RkVIK1RYVzM4bkdqZFZ6RWU4bkdMdGZjMTRGWGQv?=
 =?utf-8?B?WDl5T3cvWjRiZGhlSkVnTTN3WHVTREQzNHlBMldFUUI4QXF6RXZFMzZxVk1q?=
 =?utf-8?B?QnFqVDBXdFhZYWp1VWVLWUxLUDV5Y09MQTZjWG01ZElGWSt3aTZORU12TDhE?=
 =?utf-8?B?QjhmSVAzYVZYNjcxb0wrVDJOWXBUZG5QdzMxdy9MSE9YSmcrVThFaXJ3aXdx?=
 =?utf-8?Q?8xxmpaEI3wqAaiZQ=3D?=
X-Exchange-RoutingPolicyChecked: MxNZYcAEU3YHo7eB9LaNIkod3Ox4AycSdtUxAEY44Nhhiw0h8VsNVdQq3h+B88ByE8W+XPhuT1rROiDwMmx0oHR2rkVb6k3zKZEA9u7E5Eh8X/TvE0EtOxh8yW7VYbx3Up+E3S1yUEbhOMiohdez78TsT/rMF3ZNst3ZpuJqzcY14+JvfDDMSj2oiM2ouYFDDgxySDgf25wsl1hyfqs2CfIQicxSUukI361YH/JYv3zaTYTJS1Wle/T2PSrYfH50S1DrgOw6rRdj6/v+K/8XrC7uysHfZGyM4M7NSK61MuEqqiWxY/qo1x7DtbZGnG5Si4SGaXVUCIxRsiu0AOGdLw==
X-MS-Exchange-CrossTenant-Network-Message-Id: afb93199-80dc-4a3f-9288-08de9996d691
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 19:57:05.9693
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LhVqvFVoTDTKifxBT/HJjDvLhQ7ILBBG3CDXDCRJISS7fyLtn2U/EgOtJmh3RrR+Lc6BLjHOdd3LlLRfN8jJuBD62rUlO5LyoZI2FMYbP/A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF46B98A11D
X-OriginatorOrg: intel.com

On 2026-04-13 4:06 AM, Kuninori Morimoto wrote:

>>>>> +	ret = soc_card_bind(card);
>>>>> +	if (ret == -EPROBE_DEFER)
>>>>> +		list_add(&card->list, &unbind_card_list);
>>>
>>> This does not look good i.e.: squelching 'ret' is required in
>>> EPROBE_DEFER case.  Otherwise binding deferral is not supported, leads
>>> to KASANs and eventually more serious problems.  I may have misled you
>>> in my previous review (v2) as existing code has explicit "if
>>> (card->devres_dev)", whereas in v2 of yours the 'ret = 0' was moved away
>>> from snd_soc_register_card() to snd_soc_rebind_card().
>>
>> Yes indeed. Thank you for your feedback.
>> Will fix in v4
> 
> Should I post v4 patch first ?
> 
>>> I've attached two callstacks and summary of operations which I've used
>>> to reproduce buggy deferral manually - no magic tests needed.  If you
>>> would like to see full dmesg/traces, let me know.
>>>
>>> - case#1 is patch 1:1 as is
>>> - case#2 after updating the code with 'ret = 0'. This means there is yet
>>> another bug I've not managed to hunt down. I'll continue debugging v3
>>> later this week.
>>
>> Thank you for clarify the issue, but hmm... I couldn't reproduce the
>> issue... I manually uses -EPROBE_DEFER for card, and use rebind().
>> After that I unregistered card, but it works well...
> 
> Unfortunately, I can't re-produce the issue in my side.
> So I guess Intel test is needed ?
I've debugged all the necessary parts and arrived to the starting point 
- the whole reason why the rebind-patch of mine is shaped the way it is.

Let me elaborate on _why_. High-level view on the case2 described by me 
in the previous email. The register call-stack:

snd_soc_card_register()
|_snd_soc_card_bind()
|__snd_soc_probe_component()
|___snd_soc_component_tplg_load()
|____soc_tplg_fe_link_create()

The load-topology procedure generates a ton of devm_xxx(). This may 
include allocating FE dai_links. devm_snd_soc_register_card() allocates 
devres hooked onto card->dev with release pointing to: 
snd_soc_unregister_card().

So, after applying v3 found here, we end up with devres-stack:
1. devres with release=snd_soc_unregister_card
2. all the devres from topology

Teardown sequence, LIFO:
1. all the devres from topology
2. devres with release=snd_soc_unregister_card

The unregister call-stack:
snd_soc_card_register()
|_snd_soc_card_bind()
|__snd_soc_unbind_card()
|___snd_soc_link_exit() AKA rtd->dai_link

Boom, the dai_link (FE from topology) operated on has already been freed 
earlier in the teardown sequence. And that's the reason for:

	devres_destroy(card->devres_dev, devm_card_bind_release, NULL, NULL);
	ret = devm_snd_soc_bind_card(card->devres_dev, card);

in the existing code. First, destroy the node to avoid bogus unregister 
later on. devm_snd_soc_bind_card() calls snd_soc_bind_card() _before_ 
appending the devres with release=snd_soc_unregister_card ensuring 
correct order of operations during the teardown sequence.


Kind regards,
Czarek
