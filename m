Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B761C3C9EE6
	for <linux-sound@vger.kernel.org>; Tue,  2 Jun 2026 09:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780391086; cv=fail; b=BB0CxJUELZUIKIGYx1CPHKG8YyHnb8M4EmqmC+ex68BgPi3dnGpnVSOfK4lzmJD6ZFsu0zYEeqlf/SEvNI9md1o0OWJB5hpyv0wxKk1DgLPdTqJvHl/Nf7raXGGgWDs7oO0Xe3y+mhWku0t7qLxncwRqKxv16QyK3dmbe2xChVQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780391086; c=relaxed/simple;
	bh=aozNnYguZ0Ase+Du2ksL4PEYU9AnsejxO+bEapeTecI=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=h/z6BKRJ+NdWU7QhruasuF2q+0BVMmV5NmV3JZXv2Bpvhn8Crc1TWpZnd4oNW2PCN9YNhRNBGh742acLQqK7VcR+wcvqe+k9SViGElZo15A0Jf/EqqMBEOTPVK4SqfQROdExPsUDtNpvT2GOGeuhJ8KI6cPg0vbBA1trjgOWwKI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SrAIz++P; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SrAIz++P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780391083; x=1811927083;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=aozNnYguZ0Ase+Du2ksL4PEYU9AnsejxO+bEapeTecI=;
  b=SrAIz++P19LmXAkaeHooeuejJ8a/vDCzkF/smoJRq6vL50W2wHVpQ6xo
   XYtyfkInV2xTRaAAKWW8zK3GSJun8fOapDtX9gwJnm3ufTM9dDkGa/7yW
   BLTK7oFFePP2zOkXPNcoAFgtPNyn58sQO8gVWvaOSziALO+L1x+4j//Br
   4nsPYmrDHBzB8t0cMiKwnZ3Lr1RM4B4Q+FLXOJ9ADc9mp2/r1XR2CZl7l
   S5rUwYSr5SLcnBrOMeT6T5aHuS7nV3g4/rOt5HaphqHI4/B4wgC47sGLb
   htbu1ksKX0OdR0IJbJxK+WyxyfA8mt4uHDmGsbwpndoiTngbMGg1/aCNr
   g==;
X-CSE-ConnectionGUID: lBjfFqDhSPC51Y79t53/fA==
X-CSE-MsgGUID: q4wvqZxIRUWBtr2ItVIu+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="84794351"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="84794351"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 02:04:43 -0700
X-CSE-ConnectionGUID: 1slNoJ8eRVGFjL2Iwz/4tQ==
X-CSE-MsgGUID: xnweqwtoTBaB2eyCXGUo7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="274114757"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 02:04:42 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 2 Jun 2026 02:04:41 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 2 Jun 2026 02:04:41 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.40) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 2 Jun 2026 02:04:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bBpsDq/r7tn0NIBYP8g+xPAKfv5JRDSkN8oLCKt1ZfDP8ehoWeTh+A+1MQ/FVDKJQ3Qwn7KUjZUWnjA53y9n1lfGWHwrU1g2/2SYNIEY7zdHL/QMJLLjahto1hy5tD9/2S07nJeL9R5luGvLV+/QEm1ORw4prkZxfJltKxhs4rVhJlEwAtJdVssHlUnSrORfAfeg/oDhjM0odQd8zBDy407Ev8hsm61VoDDAI/LAJWwDYDJblFbADXB56qbj1pctpCcQLF+5NpHtOqfKd+Z7PcurUgDW3YAk8XeQ5TPWENEKjOWmBTF2canR3xaeqsZmDdWu6Se2Izl9ffWiBU1h4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0jsBFGHP1JSRp2/vQobAyfnvun12C1TZwXXxlQPz9zg=;
 b=YzQxt94V1SfqTfxPE2ed1Yvci3xpB6yfsFZwgxlwLUdk0HOrAiXbT5+4ce/ZkxjaXV31LLaiNlH6Ux3rn3END3U7O7nn/73n1em4EaA2YeIlJ0MWqwWQ4sj158DPx5JP134WFBGN8bVKPLu/E/KbtSTA9UYMZLe7OBKzgXQn9X96hT53zJ5nuPJKcjKLPFLsKBAMNt9NqsQWWMrO1koEFhsqAYtT4M3NCRnFZxuDGcobDOK0PxlIGSp603yYbrGDjiD5mjrGk5cgA24tlAhXQKRZu4RkODdnDwbG6nGyYUnBvI9L3P3+Vy/VjMSmEXg/SgesrCGUndSB77TDVhIysg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by DS0PR11MB8230.namprd11.prod.outlook.com (2603:10b6:8:158::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 2 Jun 2026
 09:04:38 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%4]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 09:04:38 +0000
Message-ID: <03c7be0e-4e55-49e4-826b-ff4db16271e3@intel.com>
Date: Tue, 2 Jun 2026 11:04:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] ASoC: Intel: catpt: Cleanup components_kcontrols[]
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: <broonie@kernel.org>, <tiwai@suse.com>, <perex@perex.cz>,
	<amade@asmblr.net>, <linux-sound@vger.kernel.org>
References: <20260601141031.1606847-1-cezary.rojewski@intel.com>
 <20260601141031.1606847-8-cezary.rojewski@intel.com>
 <ah6a_OG6qSJ0lXJ4@ashevche-desk.local>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <ah6a_OG6qSJ0lXJ4@ashevche-desk.local>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0208.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:89::19) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|DS0PR11MB8230:EE_
X-MS-Office365-Filtering-Correlation-Id: 55c23bad-822c-414f-77d9-08dec085f975
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|18002099003|22082099003|6133799003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: KPLltKcNvRWhO7yqxuQU6478wb1pXWGRVDMZ+2vkGKI7l/iTnsxOPqA/FN4StRu/ZapknJEBd5vbNjNaFhIkf+F68agfF54jdtV89LCTd3terqcTiAMLQ0HDjQA7PFgnUtIVmoofwR1JYkmNI4GQgF8xls8YlsxkiavBkyqXymHpdswLWcFd5YPOa6VHIpcdZp9+IJasLgZrqEJ/rGd43bqDO518aQABnvYB5vEn7DsaFX65DHE25C5gpYGkc6xB3SVBPQDZxm6MQpKnZUd8eKkt0uw4mh6LiBWEiDeTeWhXJw6D3+OqZs/mLYQ6wzrzmwaZMBouhAIFO6s1FLrZdMx1Qq9LQre4+cqXfcMu5QKLAIHipnRld4tuSnPxZDCzGLuaaNYQLreM+8Murzk1ZQYus/wg+zWt6kXeuCtK7mQAEfebYUcCBX6LzQN1sHEmDVDfSn/HCYXfi9J1vOl0taX0QtX2oOTlYloAZFTnCWX++5idw3K6MpW0aVOqycBEPe7AYEWyGRiE4iMJ1e6A0djtmr+rzFS6YOKqaMMsAOW1DiUTp8hIf7YeUXAHsMTkcwMCBJOKMAWxYAeK+a7DyIYa8Hz6Z8mmEdR8i3f9Vjkx3EBgtEEORIeBvuD2e9PJ3Lnl6BUpnMt9PsnQ7Fhol7PDktRXtvyzH8HHqZzp6uPqklONsQ5WYvLuuP302ByG
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(22082099003)(6133799003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUhLTFA3VjFrSkExMXR2YkkxdGpUZ2RzZzhqRm54UHUwdVd1SEorcmJkb1Nn?=
 =?utf-8?B?ZEQ2Y2dyUUJ2RkVualVPU3QzZ2ZmcDUvMlZadUxyaXhtWTVVdjdhZUpyTitn?=
 =?utf-8?B?Uis1dTJNY2FyYzQyYVNTOHlDcGRtZm1XdkdqRmNFQW5yR1h2VjRYOUJ4K2l3?=
 =?utf-8?B?MU5zTEZ0MVZ2c3ZSZFBacXJBdjFLWFMxWnhicWJvSDg4WmxpTlo4Rk5sL3hB?=
 =?utf-8?B?bGRwWkxKRkdKNnI0c2xxNzZvUXhIQ2sxdG53ckFCSzdWcTgwM3p1Z2Z0WXVF?=
 =?utf-8?B?a0VHbFFJSytiMFZVamUrVmQ4TFdOZDVTZFcwSnJ1amlLWHJpb3dwZmJZTnZ5?=
 =?utf-8?B?Mks5U2dNbWdDQ3p2cUxKenptUDN4RWxTVVV5T1RXdk1UUm5iYkJJTG9tMXF5?=
 =?utf-8?B?VU5iRE4wUmlKWGdKVmJGVzNhNUNydUc2VFI3ZGFTY2xuRTc3T1B0cnF5QWpS?=
 =?utf-8?B?ZDYzVlppQktnc3RxZDlLRmRGdDNJc2FxMzI4aUZuQjRVSUxYUHBkTmZKRXVl?=
 =?utf-8?B?OVJWSVcrM3FReFZDWk55cjlhbTNoNjZYZVFwTmRGR0NkYVZNK3hvS000enBT?=
 =?utf-8?B?VWp6SXB4Y1l6STJxaFFqc2RnWThyaE1hZzhaSVpsbW1lNy94NWRVU0pwbDh4?=
 =?utf-8?B?NGZhaHB1RHNSeHNUdEQvaHNJTUZKblF1YUZ3UFVHaVFydHhzcjdKTmJGWng0?=
 =?utf-8?B?TDR5QkoxZzhpcFRwV0VKbFdiNVE3bjBzNVdHRXRVSUdScUp1U1VxUjhENFpt?=
 =?utf-8?B?Yk9sT2ZrWklXdmwrWitFNUp0dEVEMGhpb0I4MmdZQTNDWGt0eExYRG03ZUdS?=
 =?utf-8?B?TldJeEMxMnFCUHNmNEV6RVJSaEFkaDJ2Z2FqdTh5YWtDK21LQjVPMVVvbWcz?=
 =?utf-8?B?QnNtSU5tdXNyRmZnVjR0RXlzZjcvY3U1UEd1ZVNaWmxEbTFqekxnYS8ra0RQ?=
 =?utf-8?B?TEdMcjRxVWRDWkIrblhod0l1RHhsY3NGTXNra0NQNHdXUUtqTHlpWE9QaTdp?=
 =?utf-8?B?aU5zZGplZ1ZSWTVCTmtiRVVSNmNnc3I3WS9aeVlJTVpBTGQ2ekgzOHFCMElw?=
 =?utf-8?B?Qmlaa1ZQR3VsWVVMVHpGQUhvNlA1NEZGcHlFMEJiK051OXoydjRnQ2NYZ2pU?=
 =?utf-8?B?d2laM0lWV1FDeSsyZE9OYkhtSkZRM2wxUHdtMlhFS3BSOThCOXFjcWlzQkJR?=
 =?utf-8?B?UnhSLzBOdkk0VEI3YXZKRDBmVGQvMzlKeEpmNG5kWHpHSU5Xd0JVTFp2VUtz?=
 =?utf-8?B?WVRsUkxYSHh0ellBaC9wOXo0aGNyTjVxT0x6RzlXZTRJMWNsSXR0bVN0Snla?=
 =?utf-8?B?cUY2N1dYdm4zS21PKzllTEIwTTBmQ0oxRG53b3VaemlnYzhmMjVaVmxRY1Z6?=
 =?utf-8?B?VFhDSkdRay9XOGVrNTZndHRyRUxNb1RIMGhTK0Q1djQ0WmdKVnJhV25HclZo?=
 =?utf-8?B?UkxvbS95WVZCc2hiU3IyMjEzc0d3OVA1YS9sK3BYSmRMOXBFY0d3c0JYR29Y?=
 =?utf-8?B?d3BxeGFCRGtSdFlGVnpuL3d3eUhWUkVCRHRnWTd0RWZKVDVxN3c3VWorU1Rh?=
 =?utf-8?B?cXVWYkRIN1BwdWhaNzdRUkt0QWY1TEcvT2Q5aUFsK2ZTdjJheHJRMjdWUXRS?=
 =?utf-8?B?a3hxak9KYys4RHNMTjNxbXBYcXpRSGQzS05ueGRONUpWUmQ2NlBrTU9jc2M2?=
 =?utf-8?B?UExDaTNFcWkxZEZES2xDbm1FWTJqMHBkMU9MV1JUK2pLdE9qZklHYjFvMkNx?=
 =?utf-8?B?OVU3cVNBRWNDVm9lSkp0c0ZCOHJFSFQ3cFJzTTl2UXNTYkJia25PdVVPQnhx?=
 =?utf-8?B?bTBLdkJScThqd3lZK2NsZitydStJRkpFclBGd3JHVmNaS3puaVJiVFU1S2ZT?=
 =?utf-8?B?TGF0ZFp0aVBxM3FqRUd0SVVSdjgzWnBZZXR1NnZwL2pOcFczSXRnTDU4RzB5?=
 =?utf-8?B?eXpkd3lERituMXZWN3doL2Jjb1pGTk00a2dCUjRSbUhZTC95MHZ0MHQ4L21x?=
 =?utf-8?B?MDBjNFZQaUE4WVVWaXppK0hNa0NIcy9zdEFBNUNZSC85WHIyTnBNdTZJL0k4?=
 =?utf-8?B?YlZJMi9nOWFKbFRYUzFWajNUZTRRWDFPWGRqL25FTlFvTDNPK1FBOHZLUzZ3?=
 =?utf-8?B?K0FvbnJETnpDZDVhb1JPZWk1RHNTdTVWbmRDTjNtTnRNODR3NEVTOUdiait2?=
 =?utf-8?B?dFh1dDZVTTBHVC9iWVYrT21LZnpZZ00xY3FkZGk1ZkprV29Kbm93YUhWeG9K?=
 =?utf-8?B?dlRDc0pZRDhkRVBNU3E0QWVxZXZOaFc5KzFuTHpFakpNZk9vRHN4TnJtbjN1?=
 =?utf-8?B?SzlGMlJuNnhnNWJGVTI2cDNPWWdZVU9taGZzU2s1Y3Rzc2tSSDM4Wkd1MmhR?=
 =?utf-8?Q?FM76Qs3J47QOUuoU=3D?=
X-Exchange-RoutingPolicyChecked: G3BLyvCsPreSoaoLzr0ZqSsqRA+Vol/+rcVxkOmfcecOllGcvGa4Dx6f/Dsq11TAm+7vyiOHKnlyrzTKuUfjmE61wjsFwtVel24VSRDd3iba6YsaxkTKzFdpcbLJehZRYon9B2yaA8cgTvZyneIZ5YevJJVEYUlXi19S9QbQ1Ec/sUt7KlNjrV5nT6s5+zsZ3WjdHcfFL7VJjZMEFnncN2ljilTpszVCKUFaA15bLu1kCAupsp7lKtinJrGE/mHbsgyrxxOHYnmAJkwt01sU8QGLrGNQ4/MVgN/YGwdoUHrQCgYDUQd9JPoWd9ilhbLYl1Zu/ljwOHBTSejp3XueZQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 55c23bad-822c-414f-77d9-08dec085f975
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 09:04:38.3923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PpwaWJ2G9vMaXL6Hc7BsTQpy71AeqTLojicMTqHkpFSHf8bhoR17dQ2cHRywY9aHjgWI5Z2A2Fo2W586U+wk71DeJKGKO7z4xptLHUVMZ9g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8230
X-OriginatorOrg: intel.com

On 6/2/2026 10:57 AM, Andy Shevchenko wrote:
> On Mon, Jun 01, 2026 at 04:10:31PM +0200, Cezary Rojewski wrote:
>> Fix alignment and drop redundant comments.
> 
> ...
> 
>>   static const struct snd_kcontrol_new component_kcontrols[] = {
>> -/* Master volume (mixer stream) */
>> -CATPT_VOLUME_CTL("Master Playback Volume", MIXER),
>> -/* Individual volume controls for offload and capture */
>> -CATPT_VOLUME_CTL("Media0 Playback Volume", OFFLOAD1),
>> -CATPT_VOLUME_CTL("Media1 Playback Volume", OFFLOAD2),
>> -CATPT_VOLUME_CTL("Mic Capture Volume", CAPTURE1),
>> -SOC_SINGLE_BOOL_EXT("Loopback Mute", (unsigned long)&(bool[1]) {0},
>> -		    catpt_loopback_mute_get, catpt_loopback_mute_put),
>> +	CATPT_VOLUME_CTL("Master Playback Volume", MIXER),
>> +	CATPT_VOLUME_CTL("Media0 Playback Volume", OFFLOAD1),
>> +	CATPT_VOLUME_CTL("Media1 Playback Volume", OFFLOAD2),
>> +	CATPT_VOLUME_CTL("Mic Capture Volume", CAPTURE1),
>> +	SOC_SINGLE_BOOL_EXT("Loopback Mute", (unsigned long)&(bool[1]) {0},
> 
> While at it, can't we simply do outside of this initialiser something like
> 
> static bool loopback_mute;
> 
> and here
> 
> 	SOC_SINGLE_BOOL_EXT("Loopback Mute", (unsigned long)&loopback_mute,

Hmm.. not a bad idea though the loopback_mute static would never be 
referred to.  All the functions obtain the values with 
kctl->private_value and I'd like things to state that way.

>> +			    catpt_loopback_mute_get, catpt_loopback_mute_put),
>>   };
> 

