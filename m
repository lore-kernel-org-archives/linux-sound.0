Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16657310655;
	Tue,  3 Mar 2026 09:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772530235; cv=fail; b=oaK/091S7XkuRPNNBZ9q/qrj5khvg2/HYN0DSM3LxElZdekZM1ofVc5+qTmQ8KETgy/bRswLLYVWbW5KN0Se5999jwUTKaWmCLUUy8YlCwfL9VzC2WAqRsvsDxRkxExIiy4lOux/5PsvWdrWAA9oCNCe9Vui0XJNG9salaPKeLE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772530235; c=relaxed/simple;
	bh=MyojWqJ40EeTLajgPPpODmsL+1FPMy6JIIP52JNWVCM=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FUYeSazFUy/NJL3vIn9xGPrAszGvLC+mNC1j0032ZX7IGB6pdXsCKrjyGyfwlsp6Rko6qxPuJUoxR3v55e2WlFg4PDMYGXVXfOiqqF16wU2MW4fyEakfbFzUUomWQEUL68+JrErdBdXC22LbcINrGimLUSYSorpe8PEZ/Uhguzo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XMeM2X9o; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XMeM2X9o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772530233; x=1804066233;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=MyojWqJ40EeTLajgPPpODmsL+1FPMy6JIIP52JNWVCM=;
  b=XMeM2X9oFeWjD/JCKy2iZepCOSV8WPMpQ/e8KwqLWN3YIb42rvlnn2+r
   rzRAuGmTGtgYxJxvBSRg7rCZ2I5dij35r89fs2XASllWyxc7fyCn3r9/r
   l1np0lRH2umHEd9rpsdLmVp8IFpGEpnXrFinw6BUBJjYs6UL2+/9ecgek
   0Fl2hPd3gqbwCAb3P3YzcP2ALoD0jo4Lt3vbeG/FeCo2JjebVKpoZGMhN
   LOECwn9VTTCK73sQ+fnQDUbzoP7Om/+XKzbQiQOJoolx9DCEgeqViESeI
   qZ3S7f53Ev/yIhiuswWXy1CDKDYKvXUsgD31KoQUoJg/TgbCmAewgKxqH
   w==;
X-CSE-ConnectionGUID: wq6/rg8KQuSZHgm2VynTUg==
X-CSE-MsgGUID: SXUjCgl5SAygrtPtBSkg1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="84195866"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="84195866"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 01:30:32 -0800
X-CSE-ConnectionGUID: dls6vyD8RM+oCr/bLpoeOg==
X-CSE-MsgGUID: +HlgU/Y2T46uKMUSvcm/QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="248432387"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 01:30:33 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 01:30:31 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 3 Mar 2026 01:30:31 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.42) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 01:30:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QIKYwOWQlRy6pV/AJR8gP4VhoIOowu2YLqEx0L3og3RjsYK8YbfAJ9mf4oRQrcA7cyJ7PVoKmKJ4mvFG2yExQbPLlzop1VC7ncc+CIqcA1xE/JIfm9qf9ylHXAnFp8bJR4LAddWSLo4Zx4GopRxp7R/X7URGnwWQBHlqkBGza+XC4TI2ych8SinM4CTViX8nNsZyzlzW4VILGNu1bQG1b3e3DQKjqyBAN+8FgkB22qkAlAg1fAGPqx+Q/NFLQdfPBQ45fp+/jdW8oDdV+z4hLnyz7tvKu+3h9O/zlj7aR5lsCLTH00N2Ph/3UHAQrfXtF/cPbUDlZUma5XYVuHs8Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6j3lEUcKk3YG6CWhPwFgJinlLmqeXmIo9nh1MkaL4+c=;
 b=zBpzmH8bCYHMnqwGrmV+Ju0TwlCFLkCxBM4CGJcoCR4SEyDN3Ki6M9xobJLizrX+ft5EXoibI/wFQKqWUKclawgEO1tfg75/6YWUY5jdB5exWO/jH+PYsH214GZE864bSQAqXxXeGYdaKf7zMtoO1CAqAFpkmuvKMA2EhI3gOP0SbvJIaiTZ41HHN0PSf8LX2sYMDtxb+ykoZiPt2iSyCFN04fdYMVWSeHi6Kr0V/CaLw3gMkexl2Q31fD32SDlKT8o442AErKKynfTCLROae/bXX3EKh9E7CQQ1Zki13V5u7qWmYBRMg4cZaph7poGEMuABf7oD8aw8rxy7bhJFjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8283.namprd11.prod.outlook.com (2603:10b6:806:26c::16)
 by DS7PR11MB6103.namprd11.prod.outlook.com (2603:10b6:8:84::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Tue, 3 Mar
 2026 09:30:29 +0000
Received: from SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214]) by SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214%6]) with mapi id 15.20.9654.015; Tue, 3 Mar 2026
 09:30:29 +0000
Message-ID: <5ab5d54e-434a-4cef-98fb-c83b8c341407@intel.com>
Date: Tue, 3 Mar 2026 10:30:22 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] ASoC: Intel: cht_yogabook: Add driver for Lenovo
 Yoga Book tablets
To: Yauhen Kharuzhy <jekhor@gmail.com>
CC: <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Hans de
 Goede" <hansg@kernel.org>, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, Mark Brown <broonie@kernel.org>
References: <20260301-asoc-yogabook-v2-v2-0-adcc7ed40985@gmail.com>
 <20260301-asoc-yogabook-v2-v2-3-adcc7ed40985@gmail.com>
 <7932c58b-b6fa-40c3-8967-7710d84f9667@intel.com> <aaYRd2Irw8bOpDL0@jekhomev>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <aaYRd2Irw8bOpDL0@jekhomev>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P191CA0009.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:800:1ba::13) To SN7PR11MB8283.namprd11.prod.outlook.com
 (2603:10b6:806:26c::16)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8283:EE_|DS7PR11MB6103:EE_
X-MS-Office365-Filtering-Correlation-Id: b360e828-77fb-44b6-bb61-08de79078267
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: qJye/1uZvfUmd88d0bHGtU5Z7J0JGmZ8vniYK8LSWYsOp48v1miVhRabUlPd7vW++F0f79hEkDieFbbCZ3Gb1iyjcDKdayyavHG+jlNzNS7kdlLM06yRFlz7lLAZHvxpbHf5kAs3ub625jRou3DrctWq950EVUJjl92j8XIm+FKetoNPu7UtGvYeEp4wzdiF9rCQH+idSXTgUmYI0Q4S7gawUAdX1FsXlTDB3BrnEhx2yf2iOx9/uxeX3cLx+i//FjUKVa+P3iA45tjph0SaUOIfo9ilGShccQwD2toXgWCs15nkQSKMqayjDTkW2HJCNZ+ji70fAI+pbOPW3YBxQF0YgvIMBj0NWyWdkS1IwAjrrwo/A2vggYx8FzzjAkaTnKjso4fR8QrChBI7GfGQn/3amlWHXYQtc3A5hwAD/kuT/27xOPgbOzGevArsico8U9EDUGdlPXWvTAJjxbfi1eXqZJVUoD64a9aItyK4gWyHh6qy2Min4yUlza/dE/F6jNyfgQ12pANRhQWCv4syfSu4CvZAv8rTrc/iGNuZeEFRtZ33L3HDi/7B/FGYyMFx38v4pb6pjZiC0PK90Uno6dHZOh61v7Z+n8YG1fB3qrq72v6m3mbQ/PoI0ydAlT+cFqfBC6o34cjx2uXpPRGVBG/x6MIvhP/lhan1r9jCy4MrcqNdrErPz6MM0y9kPQvVOrnnkeNA6GpeHBq3HJYEJzxrs8stEC9usdOEJ4P6H0s=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkxoL0xsOG4zSitXbGZESkU5WWpHbWVOTDlQWERUeVBZN2VXR09nMkZlQklr?=
 =?utf-8?B?VVdsVFo5cXdnKzVaOCttcGtxcEc0UE1hQVdnVVJFcisvNTJOYlh3L0dlU082?=
 =?utf-8?B?RStHSDlwNE5ZZjhFQjNaR2dIWFVxd0g2TloxbGJEYmxxSWoySzMwdHczd0dN?=
 =?utf-8?B?V3JkaTZ5Uk5jdWZLOWZKZitESmsxeTBqNGwwREpxaVRFV2N5WGdWU0tsaVNh?=
 =?utf-8?B?YzFZK0dTSzViemRtTE4yL0VFK3JDNHQ2RHo5dlN4ODhZRTBvNDRsTmoyREtS?=
 =?utf-8?B?aEIzUXRjUS85cFpJd2hNbXBzdE1CcS9xMHFtS0lFSDB4Y25UMk5mVkdqU3Rj?=
 =?utf-8?B?bU9NQXJXYXBFQmdIV0tDOXFKODIyQWdkaUR6ejl4Z2hpVU1wbzRxS0xMOUlp?=
 =?utf-8?B?UGVpWnJiU3g5SkltMWxyeGQ4Q25TUll1Q081YXR4RS9oWVh3NytJeVBucnk0?=
 =?utf-8?B?SHFQWmJRQ0N1dmF5YWw1eThJTHZ4ZWpHSVdrcjcyYzlBUkJ5TnpodnVWd29C?=
 =?utf-8?B?SzlsQmEyZU96K3JDOThCQnBiRUEwYWl6ejc2TytGWXVTcmNMY0VEN21MT1JB?=
 =?utf-8?B?Y2txSE9aMkYyOURRSjdsL0tvL2FNTDNzYWtuYXFiWkhZUHltS2xPUWRudGtu?=
 =?utf-8?B?Uys1MDEyRE5vSUM1UGhjN1ErelpjNytTU3YvV0xWR3g5NTg3dVAwdncvVGF1?=
 =?utf-8?B?NCtEMVdxa1hmYTlhaDZZc2lYOHVpTUZLNVBQeG1oNkNiUU5pQlU2WU1EZU90?=
 =?utf-8?B?eWM3eXJQRWFsVVMyaHlXQi9pNGhGMzFBREtKRFg3cmxNbFdHcllWeG96Mkhy?=
 =?utf-8?B?L29LaUtialpRVHBycTRpTkF4Zm5JaUFFWk9DdGdyS2wwb3FMeUF5SGd4UWRx?=
 =?utf-8?B?eEF5R2RFUE9BclptOFdNVmx3OHR6K0lHcTRaSDcxQjVxWGc0Y2JZV1VrUlNw?=
 =?utf-8?B?TFRmQ0NyMFNOcWw4OVR2elVEVmRGYTcwZExuZ05sR1FiUDh1dldGK0V2cU53?=
 =?utf-8?B?YnlEWndaNE0zaFBSbnBVSVhYdnVEaGw0aVNmZWhMNzFWZjhkbGwxOXgraXVR?=
 =?utf-8?B?YTZYY1p2RGNMTzJkRVBzNzBXM1hOdkJhcUtwemZSaklSR01Na09oTm85Z3pX?=
 =?utf-8?B?VDVoSzB3ZGI5TzQvb0JoUkxzeTZGYTlTaGUvcjJwb1pPQWVKMW92eWVacllU?=
 =?utf-8?B?ajJHdVpyWk91NlBEdEE0bHJWMFBMUWZpQ1NKK1VGWVh3dnlMZTN1RmMwLzF1?=
 =?utf-8?B?b2NsSGtXTi9ncmNHSzNxOWg0bGcxZStqMEVXMEpYWVd3eUlpRVlMbzE4dTJH?=
 =?utf-8?B?SmZXSU1aYzdDVTRqOGsrMngzTWcrRUJqcDNVU011L2RGYWREaXcwbEhrSXli?=
 =?utf-8?B?R29BY1R2UVpIYkwrMm0rc21JOWJJM0h5QUhmLzdUTG0wQ2xSRDVjNEE3amNR?=
 =?utf-8?B?RituTVBQeTBNUWdJckFnU3loQ3hub0tucXU2WEZYRVZBc1JERHp1L2M4NUVZ?=
 =?utf-8?B?Tm5SY3VJT3dlQU5acVVjRWxVRW9PQkdIbEh3dXQyWmpiakRyNWtWb3M2TjVl?=
 =?utf-8?B?WnFtYVlWR3NYQ3pKMGhhMVovVThrZlhRb0pnUTFxWWZuS3VCV0hGcjFWREU5?=
 =?utf-8?B?VnNZajZ2QmRPcFBpWjBIVGEyT3ZxUlN5eHBQeXBVdzJmdXdlbFJ1WFo0MEV5?=
 =?utf-8?B?SWYyN3FvY3piWUdzL2dGclBLSHZGcHFUS1BMS3lVOCtKRndNMjM0MlNuMUpn?=
 =?utf-8?B?bjczK1c1QXdQZUZ0Rzd3YmZPaUVwM2FkZ2p0Ry9vMWg1WTE3MkloZHR4NG81?=
 =?utf-8?B?MzlhSW5UZXc0blBWT1M5NDVSS2JEaUQzZ2JCYTRpUVg4V1pYalFjc01VNmhy?=
 =?utf-8?B?dHpsM3lHV2x3MXFIZ3hxWmVFbzBGR1B1c3h1SG5GTlJFeDN6UVYvVVdRdllu?=
 =?utf-8?B?UWk5elVPZit3WHMwa3RheDRiMnVIbm1PUzV3RWkweDcvUVRWb2JNcnYyTHBy?=
 =?utf-8?B?MEQ0Z0FZV1N2ZG1Fb3JiL1FnaFN3MjBQaStTTkxXQS9lS2tqS1RJT3NSVzdh?=
 =?utf-8?B?SUtiTXNqSGtkK3FsclJNOHlud1FlUWhXdUJJZ3RBM0RyUUMvM2h6N1d4RG8w?=
 =?utf-8?B?Rmo0UGhEWkpUS0ErMWtKVlZ1OUhQaU9WYzhuVjVmSmlGTDNIRENtNGNYdXli?=
 =?utf-8?B?c0JpZEdLc3QwbUZiSFlnODhlUUUvTGxETnB6MHE4L3Z2Y05ReldoUGZWcVUw?=
 =?utf-8?B?aEdPZENqYU40dWJod0NVbU93T2ZzNWpGNENqaGxOcisvWHBvcURPWXlaQ0Jv?=
 =?utf-8?B?d0ZrYzZKdktRZkMreGt0cTg1Zm1odDFjQ3lMbGYwU0lxOHRab1dST1kzZTky?=
 =?utf-8?Q?wILAL9CekckvNe2A=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b360e828-77fb-44b6-bb61-08de79078267
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 09:30:29.5280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FfZsHIDzCKZtbihh5T7zHEeziym1/lW3+6MbQeEho8yz+7yNQcEQI1r1LCoAB2UVY9M84ExDEYwMwe7jOeIQUGUwj0u6Oa8BT4hu5U5LUJs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6103
X-OriginatorOrg: intel.com

On 2026-03-03 1:12 AM, Yauhen Kharuzhy wrote:
> On Mon, Mar 02, 2026 at 01:03:04PM +0100, Cezary Rojewski wrote:
>> On 2026-03-01 10:33 PM, Yauhen Kharuzhy wrote:
>>> Add a new ASoC machine driver for Lenovo Yoga Book Intel Cherry
>>> Trail-based tablets (YB1-X90F/L, YB1-X91F/L models).
>>>
>>> This platform uses a Realtek ALC5677 codec accompanied by a TS3A227E jack
>>> configuration detection IC.
>>>
>>> The driver is based on the cht_bsw_rt5672.c mainline driver and the driver
>>> from the vendor's Android kernel [1].
>>>
>>> There are no other known Cherry Trail platforms using an RT5677 codec, so
>>> the driver is named 'cht_yogabook', and some device-specific tricks are
>>> hardcoded, such as jack events and additional GPIOs controlling the
>>> speaker amplifier.
>>
>> I'd switch to more specific naming. From the Intel-maintainer point of view,
>> it's easier to navigate between configurations when <platform>-<codec>
>> naming is in use. TBH, we do not see "yogabook", we configuration composed
>> of Cherrytrail-based device and rt5677 I2C codec.
> 
> So, should it just be named "cht-rt5677", but the code inside will be Yoga
> Book-specific without generalization? Or is it better to make the code as
> generic as possible and add machine-specific things via some kind of quirks
> selected by DMI data, for example? I doubt if we will meet another
> working Cherry Trail-based device with RT5677 codec in the future.

"cht_rt5677" sounds like a good filename for this very driver. Yeah, I 
should have used '_' when mentioning <platform>_<codec> in my previous 
response, so that the naming remains cohesive with the vast majority. Oh 
well..

In regard to the generic/specific - I typically turn to the coverage and 
the schedule to answer such question. I believe the specific tablets you 
mentioned are the only coverage for the driver. And thus I do not see a 
reason to scale beyond that.

The generic approach is good (and usually favoured) when one provides a 
feature or a driver for specific configuration XYZ_v1 but with XYZ_v2, 
that's coming a year from now, already in mind. I do not think this is 
the case either.

>>
>> For the entire driver:
>> - fix alignments
> 
> There are alignment rule violations only at SND_SOC_DAILINK_DEF()
> declarations where they looks acceptable. I just copied their style from
> other intel board drivers.
> 
> But OK, I will change this.
> 
>> - fix char-per-line limit, submission rules expect 100c-per-line limit
> 
> checkpatch.pl reports no such violations except of the link in the commit
> description.

Few years ago the limit was raised and basically anything we do for 
intel-sound utilizes that limit. checkpatch warns about violations, 80 
or 100 is more of a preference. So, nothing to worry about, just a 
request to align with what we provide daily.

...

>>> +	const char *platform_name;
>>> +	struct acpi_device *adev;
>>> +	struct device *codec_dev;
>>> +	bool sof_parent;
>>> +	int i;
>>> +
>>> +	drv = devm_kzalloc(&pdev->dev, sizeof(*drv), GFP_KERNEL);
>>> +	if (!drv)
>>> +		return -ENOMEM;
>>> +
>>> +	strscpy(drv->codec_name, RT5677_I2C_DEFAULT);
>>> +
>>> +	/* fixup codec name based on HID if ACPI node is present */
>>> +	adev = acpi_dev_get_first_match_dev(mach->id, NULL, -1);
>>> +	if (adev) {
>>> +		snprintf(drv->codec_name, sizeof(drv->codec_name),
>>> +			 "i2c-%s", acpi_dev_name(adev));
>>> +		dev_info(&pdev->dev, "real codec name: %s\n", drv->codec_name);
>>> +
>>> +		put_device(&adev->dev);
>>> +		for (i = 0; i < ARRAY_SIZE(cht_yb_dailink); i++) {
>>> +			if (cht_yb_dailink[i].codecs->name &&
>>> +			    !strcmp(cht_yb_dailink[i].codecs->name,
>>> +				    RT5677_I2C_DEFAULT)) {
>>> +				cht_yb_dailink[i].codecs->name = drv->codec_name;
>>> +				break;
>>> +			}
>>> +		}
>>> +	}
>>> +
>>> +	codec_dev = bus_find_device_by_name(&i2c_bus_type, NULL,
>>> +					    drv->codec_name);
>>> +	if (!codec_dev)
>>> +		return -EPROBE_DEFER;
>>> +
>>> +	if (adev) {
>>> +		ret_val = devm_acpi_dev_add_driver_gpios(codec_dev,
>>> +							 cht_yb_gpios);
>>> +		if (ret_val)
>>> +			dev_warn(&pdev->dev,
>>> +				 "Unable to add GPIO mapping table: %d\n",
>>> +				 ret_val);
>>> +	}
>>> +
>>> +	/* override platform name, if required */
>>> +	snd_soc_card_cht_yb.dev = &pdev->dev;
>>> +	platform_name = mach->mach_params.platform;
>>> +
>>> +	ret_val = snd_soc_fixup_dai_links_platform_name(&snd_soc_card_cht_yb,
>>> +							platform_name);
>>> +	if (ret_val) {
>>> +		dev_err(&pdev->dev,
>>> +			"snd_soc_fixup_dai_links_platform_name failed: %d\n",
>>> +			ret_val);
>>> +		return ret_val;
>>> +	}
>>> +
>>> +	drv->mclk = devm_clk_get(&pdev->dev, "pmc_plt_clk_3");
>>> +	if (IS_ERR(drv->mclk)) {
>>> +		dev_err(&pdev->dev,
>>> +			"Failed to get MCLK from pmc_plt_clk_3: %ld\n",
>>> +			PTR_ERR(drv->mclk));
>>> +		return PTR_ERR(drv->mclk);
>>> +	}
>>> +	snd_soc_card_set_drvdata(&snd_soc_card_cht_yb, drv);
>>> +
>>> +	sof_parent = snd_soc_acpi_sof_parent(&pdev->dev);
>>> +
>>> +	/* set the card and driver name */
>>> +	if (sof_parent) {
>>> +		snd_soc_card_cht_yb.name = SOF_CARD_NAME;
>>> +		snd_soc_card_cht_yb.driver_name = SOF_DRIVER_NAME;
>>> +	} else {
>>> +		snd_soc_card_cht_yb.name = CARD_NAME;
>>> +		snd_soc_card_cht_yb.driver_name = DRIVER_NAME;
>>> +	}
>>> +
>>> +	/* register the soc card */
>>> +	snd_soc_card_cht_yb.dev = &pdev->dev;
>>
>> I'd move away from static-card approach and dynamically allocate the object
>> here, in the probe() function.
> 
> hmm... OK but why? Most sound drivers use a static approach to simplify
> declaration.

Most of the "legacy" machine-board drivers I'd say. If you take a look 
at SOF's or avs's (intel/avs/boards) the number of static cards is limited.

There is no _strong_ argument against or in favour of either. The reason 
I suggest to switch to the dynamic approach is similar to what you do 
here - base your code on someone else' work. When such copy lands on a 
configuration where not one but two I2C codecs are present, more than 
one sound card might be desired.
With statics, things would get messy in runtime. With dynamic allocation 
developer can forget about problems related to inheriting some unwanted 
data.

Small bonus is not occupying space for the card object until the 
platform-device (that represents the sound card) is ready for probing. 
The static descriptor occupies space the moment the module is launched.

>>
>>> +	ret_val = devm_snd_soc_register_card(&pdev->dev, &snd_soc_card_cht_yb);
>>> +	if (ret_val) {
>>> +		dev_err(&pdev->dev,
>>> +			"snd_soc_register_card failed %d\n", ret_val);
>>> +		return ret_val;
>>> +	}
>>> +	platform_set_drvdata(pdev, &snd_soc_card_cht_yb);
>>
>> This seems bogus. The probe() found here is not the function that spawned
>> the platform-device 'pdev' yet it attempts to manipulate device's private
>> data. At the same time there is no platform_get_drvdata() anywhere. Unless
>> there's a strong reason for the call, please drop the line.
> 
> Sure, snaked from the cht_bsw_rt5672.c

These older machine-boards drivers contain some bad examples, unfortunately.

