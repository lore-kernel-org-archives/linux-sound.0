Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E2F2E3718
	for <linux-sound@vger.kernel.org>; Mon, 14 Jul 2025 09:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752485726; cv=fail; b=QFrZzSjQ7GjrW0UthXarnpekk5uYVokm3Bjg/G3/wAImnVCgpvkpYTj5P8sNPtxddChNaadEIsZkbr9iJqEfRIYcJVsQJx5873RB8s5TMS0iwEsgiKaBnqiRkh3cobuZ4uj3O8utfQqItdasHRCcednUXrvmUADnte/NZXzvYxU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752485726; c=relaxed/simple;
	bh=FHeMo5ZhrPDkxd/OhPgfr+Ky6PfHaAsTbyt2/aQbLqk=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tOv0GGY3ohcHrofPwSlNJD5EkhboO7EZcdMjO890vNhzwVmZs2NwwjvFKKdWRaNi6/Xt2uH+A16SO1uNrCbDjXwY58Kd3r0Ixd7LhUNCfuwKbXcE0m3372NYPZRqr4Bel46DslMLYK97383OVhwz6QNcqtWIgZOfavodJsP3H+A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nCYZYEna; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nCYZYEna"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752485724; x=1784021724;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=FHeMo5ZhrPDkxd/OhPgfr+Ky6PfHaAsTbyt2/aQbLqk=;
  b=nCYZYEnazcZWw+3BlABCv/OwGhR5iVCFu0NqdxcU0iPWybOmezkljaN1
   m/sJpo1BVgrp2b5kkUgxC73cZ4yfhAFgk5dGvXfiSJ7Yzqw4yKLW5afqC
   FNnfV9e/VMFvxXHPyLUjZrLmXXzd+JxmJ5cnbCLU8X+wLAdBGBfmEBVeg
   ChTkHIoVYgjHsZ144s57ne7b/KsMrmcmSdSZo6Gq9I3VnAO0/x+2HpRd0
   xWBQ2wUFEL5c/OxOzmzuZyGBQbPI1mxIfKYY+u25AOHxtP6HZzVr0I3qP
   Dl2dR+aTf5aw3ChhamhORQxR+ul0tswu44FzCsY60K0j3sax5KFQBSdCB
   A==;
X-CSE-ConnectionGUID: yjrK48DKQ+aTIKmsCIXA2A==
X-CSE-MsgGUID: lc2aBUU7Sv2+D+I3iGVs7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="72249763"
X-IronPort-AV: E=Sophos;i="6.16,310,1744095600"; 
   d="scan'208";a="72249763"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 02:35:23 -0700
X-CSE-ConnectionGUID: ANqLhfieRnKkEJ4tlM6DtA==
X-CSE-MsgGUID: 2jbz/6iKQEy82gSbVAnE1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,310,1744095600"; 
   d="scan'208";a="162447659"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 02:35:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 02:35:20 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 14 Jul 2025 02:35:20 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.44)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 02:35:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pHku+qxQOCDALwDiv9UREIkWOSJnWyCCu8Ix0SuDGj6ROqItaqMtB46zin6HATq9NJfAKjeB6xrMoZIhj9OQH1tz3F9d9J1b5QpxPEXtk5SINJeWgHFpj6P2cQZUvCH6DMH4gEp12kAHb62bnOSUPjVKmNC72SnrN+Bl8nzShKUx4nRjSlOEkUjRrc4nNCZT6P1d7tDejh9b4KfFS0z4oW3OsyeacjgO+Mvkw95FKEPuVGU4HFTj1UkwKrpQPt5i7TZDcOSobN4VLnJGg0FG/8X0IZ8NnSkBBAPqM2WTF/UldkdAuoSeIBhF9BAJhWrBMAVbGSu74rPeBJQIGg/EVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PO6hF7YtUjFVtAbjH0qliYLS8lrLEwKjFrJ+rE/SkzI=;
 b=XRFiJUh/fk6/S6to5/2H8CuvSNKZowdIkFwUXH8Tjs/BdAfceyuriAUfmKjxdJJ1BqCDB/4OFwZ1EMYDQHA7ZpPnK6YNZOOrXRNBXvdN0su5B8AlGm0tAtr1hVCiuAzd4j27xy5QL/PPsIdjcYJVSScuGsQin0wkywEFdjmmC5IBcaYIZx3Lb1Zi59rLOKJj4DQNfeBu10QnB4pJubu05/+LLXF+lw0Zoq4021kCthNhlq8d40WZBykiOTjDtR1xAX2fTJy1Y8Oloq1hV+CrW0fOGj00QgOAIqHhh6wgx5CBl44v7A1zmOnlKi0S6O+A1cDIvB/ASGhwDGuekJBgWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8283.namprd11.prod.outlook.com (2603:10b6:806:26c::16)
 by PH0PR11MB5159.namprd11.prod.outlook.com (2603:10b6:510:3c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Mon, 14 Jul
 2025 09:35:17 +0000
Received: from SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::3:e0a:87af:d4b6]) by SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::3:e0a:87af:d4b6%6]) with mapi id 15.20.8835.027; Mon, 14 Jul 2025
 09:35:17 +0000
Message-ID: <83626aee-e2df-45ed-85a9-b81e24a895b8@intel.com>
Date: Mon, 14 Jul 2025 11:35:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/27] ALSA: hda: Move codec drivers into sound/hda/codecs
 directory
To: Takashi Iwai <tiwai@suse.de>
CC: <linux-sound@vger.kernel.org>, Richard Fitzgerald
	<rf@opensource.cirrus.com>, Kailang <kailang@realtek.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
	<amadeuszx.slawinski@linux.intel.com>, <patches@opensource.cirrus.com>,
	Baojun Xu <baojun.xu@ti.com>, bo liu <bo.liu@senarytech.com>
References: <20250709160434.1859-1-tiwai@suse.de>
 <20250709160434.1859-7-tiwai@suse.de>
 <b6ecdfd3-f5c0-4ca1-b38d-e16dc5ca2855@intel.com>
 <87h5zfqh1k.wl-tiwai@suse.de>
 <b10d1812-85cb-4958-a493-185701dcdd0d@intel.com>
 <87ikjv876x.wl-tiwai@suse.de>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <87ikjv876x.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0043.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::28) To SN7PR11MB8283.namprd11.prod.outlook.com
 (2603:10b6:806:26c::16)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8283:EE_|PH0PR11MB5159:EE_
X-MS-Office365-Filtering-Correlation-Id: 91ea89a2-c0b8-413c-10d2-08ddc2b9be75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NWlNL0pDT1JyUWpmU2lMT1hoSmc4Mzd5d1hJM214QVpwRzdRam9mQ1Z5d1RV?=
 =?utf-8?B?eUhGMEkvb3dwV1BjRzhWaW0rTkl2cHdFNnVETkw0c3loVk1EQnc4b3l6OFZN?=
 =?utf-8?B?NkNaaEYzNTF1QmtXRU9xSjZsYXIwdTVjWW8xbytCN0J5WWRweFZxNWZhajJm?=
 =?utf-8?B?ZkJWUlFha1BQTTJ0M2ZybWFTL3o0dmNvTVNmZW4rUWZ6dTZZYXdxUEdLOUox?=
 =?utf-8?B?cFJqWDZySTVhNVFYRk5BTGxpNlZ3NWdKcU41YzVlUGc5U0lwVmhrK3BLNE5p?=
 =?utf-8?B?Q3JLREdxRjhlais2MVRBMWJtSTNRc01sQjRMeWRORmNna3didnJPdVFsTXhS?=
 =?utf-8?B?d1VtSi9BTnduZGUyQnpmOVl6OElNV1RFek5UMEQ1UlVJeHRkamVIQnBEaXNi?=
 =?utf-8?B?VGlpMWhVbDBGcGhFUnNaZXI0dDYxcGtvcVZzN1QweWg1Y0F3VElRc0lyaWR4?=
 =?utf-8?B?eUJ3aDRtYVlnaW1ubGNyTnh5UVJNejRDZGU2VzFqbk5CbFlTeWhsNE8vd05W?=
 =?utf-8?B?dWhsMVpBamNEb0pRNk9scW5nc0hmcDJHTmxyT1dhaS85MlVxbG1GYlVUdTZB?=
 =?utf-8?B?Ulo5NmQveG0yYkVXTlFTb0xCY2lSTVc2RCs5Zzd1R1ZCTHNBck5jdkNmS1hU?=
 =?utf-8?B?bFFyWDVyem9rdWlPL0RIRlN4cCtNdDNieTAyZ1BjTWVWQ3E4VXY1Vi80MW5O?=
 =?utf-8?B?bDBQR00yRFdWVWNJVEF6UExVQVExQkVuOXA5OFpjbFBCekxEVXFmSDd0M3dq?=
 =?utf-8?B?YVE2VXhlWndkRm54bndudUtzenhqalcwVEkzRlZTRW5DelFFelZtcUMxMVdl?=
 =?utf-8?B?M2VPK00wMy8wUUtLTTdGVFlFS2RUMUIwTSsydExPQXBoVldKVFdXakNHWDZa?=
 =?utf-8?B?RUh3MUxOUVdPRExZZ29RZmxWQkE4ZCtaNWUyS3JvM1gzUlY0SUZrY1BHMnln?=
 =?utf-8?B?UmRVcGxmZ1R3OGJMV3JQa0hvb0pCeFdhWmlWN281V20rVlVTQkRzL0RtVDFr?=
 =?utf-8?B?ZzZZbFNKeUNaRi9USnhDdFhlZGdTNm1OY3RDbHoxdFJCZnVIRFFYM1J6bWRU?=
 =?utf-8?B?Y2txMmNUUkJSWU85aVNxNWNFUHl6LzBqTmNVa0R6clZHTnR5NnJGUjdOUG8v?=
 =?utf-8?B?Z1JDbTBoa0dIK0YrUUNlOEtvMDJmWDAvVGZDU1FsT2hQbXVkYlMzRzdhaWox?=
 =?utf-8?B?QkQzZ3l3SzRyRVlNWFhRK2wvMjVhMWx6bDNYNG5ybDNBVWJaVTE3a1B4anRn?=
 =?utf-8?B?UU5RVkIxalVGQmlHeDhWTmdqc0lSMUwxY00rWUNQbGlWVy91bVRNL0k3VXhH?=
 =?utf-8?B?VXdEVktnSWJBZjhsVVdjWWxCbG1EMzlOUDlJVG1mTlFXTGlkcFF3RmVURW9W?=
 =?utf-8?B?UW5IQWQyN0I2aHpKMytpZWk0VEorbGxBQjdtMEQyZEZiaHBYRFZOQ3lzY1Ra?=
 =?utf-8?B?ZklNcDNqaDE3TzlKWHFHQ0psaTRSL3BGNGxtaitJZmNLSkxlMktRdjhoa1ds?=
 =?utf-8?B?eUVVWGRubUFicDVxUlArVFk4SzZjNks3K0ZFbCtKVksyNWdxN0ZOb2MweXYr?=
 =?utf-8?B?TXdoRFFyMTBUSWRHVTErUGx5bkNjTDc1UkY0QzUwSU1HVDkrUTlFb2VhZkNq?=
 =?utf-8?B?aDMyNFBGYTNyUFpaMUJsdE1ycXpYUWQwUjFXZ3cyc09ZS21VdFFoUFdmdkhj?=
 =?utf-8?B?cWE2Q2VxSzc2RDhvbzRVdFEvaW4xTGZuZHN4Z29HNll5a3lsenV3YzZxMkFH?=
 =?utf-8?B?U0JJTkFRWmI4ZzgxaTdJTmoyRDI5MzFLcjZLa1hNQldjUGtCT1hHV1VVNDZM?=
 =?utf-8?B?c1kzaXNYQ1ZBbVp5L3BOYkRiRnNDelJINUxFYzZPcVd5cTRtYXdCYUlseWJx?=
 =?utf-8?B?Q3BJckhKbStDRzFhQkJaYlZ4K1kxNEVzZVRlRnIxVTVqZUZkeVArK1poaW1t?=
 =?utf-8?Q?ApKRj1MMOmk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWF6UGlaSHNTNjFrYmlLakpxV2ZTMUMwRFpSUnREUUJYSTVlQXkvWkFPQyti?=
 =?utf-8?B?WmRxbENUdWNPcUJzQlFhVDByZlUva1lGb0tndnRtcDJzRTFMUUJLZGdHZ3lS?=
 =?utf-8?B?d3FhWE1yTTZMWmdNMUhJUWxXMjJkNmxNWnJ3dCtSUDc2Wlpwb0pPbjZrSGhr?=
 =?utf-8?B?RWpWc0xQZExRbitRRENnL1dhekk4WGFpenlBUFdoVVI1QlFiSVVYVVhOaVBX?=
 =?utf-8?B?ZU5STVF0OFYraXBleFgzWmpPV1JscUg3TWRTd3VkNDV5eExQdm5ZcjhsRDdw?=
 =?utf-8?B?MXdpTlNVRUFta21XRWxPODBUZEMxcHpqdzhRVldUb2RXQmxyc0xEYllxU2p0?=
 =?utf-8?B?dWkrdGFSWmNwSVd1SVNKeHJJRkwzSUVwcWpYRjJTWFQrV1Z6L05OSS9sb2dp?=
 =?utf-8?B?eDZSbmhkRHZxVmVUTFE4bGwrUDU4UTFjMUJFQUwyWko2Q2tRU0Jnc2w0VklZ?=
 =?utf-8?B?dHBPY2sxaGN3QVFxRG81ME1aZUJFNGt0dHkrV3Z4SXZZeU9Xb1hOc2R5LzZ3?=
 =?utf-8?B?WEFsSklneVp1SkptOXdrZThBY0dvSGNocEhMTnZ6TlEzdzE2WWFiUzJDeTZF?=
 =?utf-8?B?bTM3Tjc4ZUd6Qjh1aUJLTUNrbzczeTVRbjNNMEdQOU5BQWJBeUEvaGllaUxh?=
 =?utf-8?B?N0ExaFhreXdBbXRqVGxoR0dHSHg2bTRtSzdiRmlxSlJFQWtncUhQemxvVGxT?=
 =?utf-8?B?RDFJSWJUb2p6cklYYVpYOEVnSktIUUJEdG5UM0dWMk5wU2xZaXdOanhZTDd0?=
 =?utf-8?B?a0hyWXZuY1Q0SDdKcWVIOHc2WSsvMDZJbGh5MFF5NW13ZFF1RmovQ1BuQk0z?=
 =?utf-8?B?dHJKbVFtaEJ3bEo3NTc5d2dlYkxVQnY2NTJqc2MwSE1tbXltcFBGT3lxY3NL?=
 =?utf-8?B?SFBiQlRYR3c5UWllQkdIMjFaUGZFOUlFUmJ1R1oxSnNFS0owK2pGU2lBamFU?=
 =?utf-8?B?bFQ4RVQ5RDJWVDA1aENGUzRHZXdvT0hZWHJSYmZBUVUxaVdCWjQ3SzVMaWk0?=
 =?utf-8?B?OTQzQjhaZnd6NkpxOTByVUg5cncxWGhjSVhpN25FbWgzUEpwTVpoRThhdVp4?=
 =?utf-8?B?NDlaSFlUa3dDVC93eVRFWjFLVGRuckUzSndseVhvVnZwVW54YllvSGNOYnBF?=
 =?utf-8?B?cWZRWUNLaXA5WEp2Nkk0N3F6NjUyNmtaYmQ5L25wc1ZhNHEwbldaZnRSYUxr?=
 =?utf-8?B?YU13M01aNGtwK1VITGJGZnc2d3dQTHo4UlBlL1JmK0ZYaXM4UUpOaW5sK1gr?=
 =?utf-8?B?NnhZQUIxMTlIOFBTazMvTmp3NkM2bENuYS90OUVOMk95N1d3Nk1BTURBb0Zh?=
 =?utf-8?B?d0s0TFB5Z1BEY3FFWnIvcThIZmdlMHNHTHdFZHJ3NE8wNFNYZFZwc0tHVXNz?=
 =?utf-8?B?NmhWZGp1bHhtNzFJWnlidGI4eEE2TjlLY1d1VGM5cXM3c3hlUHpDR1Z6TXlF?=
 =?utf-8?B?WW5uV0NEQ1YyY0x4bm5QTm80ZWx0SXo5TDhKNlNJWTNMNDd5WnpJQmEyQVUx?=
 =?utf-8?B?L1ZaSWUvVTQvaUhUL1NPYkNlaXVHM3V0cTNjbHJVUExFaCtIS3pmZGZmS3dI?=
 =?utf-8?B?Q1JXNlMyQVkvS3cxZDdYRTd0akJMeFVyYy9uYTBCT3RKQStxMkRXZFNLTHNz?=
 =?utf-8?B?V2kwTjBJRXoyUWxwMnIwYnl2Yko0dFVyY1I4Tlhydlp3bWNRMkExcTlDUmVW?=
 =?utf-8?B?WUtycXlmS3NQb01RNkhNTndTNHdLQUhyVFNwS3liTFYvWFVPSHl0OS9zZ0dB?=
 =?utf-8?B?RTBxRGtKMHl6cXFVNWl0WDM0bFdGUXVTZmMwbWdyTU8wdkZuekVJeU0rSStz?=
 =?utf-8?B?NTNUdjAzT25zSnVXQXNYbkN6RlF2VWtlaG5yVHJXUUdKcUoyMDIzNlQ3U2hM?=
 =?utf-8?B?V1ZxS2hQaHZlVitlY2FNclNxUkM4bGJpaWJjQWhaMjdpSjM3M0FSYVZaRlNo?=
 =?utf-8?B?Tk1lK3hYZkhSVGFuaUZPNWRLbVNnYzlMMTFWN3h6Sjh6Qm5RSStGdFR6RjlT?=
 =?utf-8?B?U05qSEIzN0lOS3pkVVc4cmJjdTdUUE8rbmUwUnJZLzQzYTROWUNKSk5uRXhp?=
 =?utf-8?B?ajBOY2JNVzZtaUV1RDVMbFl1SHc4K1QxVW5QK2k2aXVkZTBBNVc2Z2VZdmZi?=
 =?utf-8?B?Z1RmVUgwSStiRXFXcHd1alZoMzkxNGZtUXZjbW9URis2cjIwYmF5L0lYNVQ1?=
 =?utf-8?B?U1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 91ea89a2-c0b8-413c-10d2-08ddc2b9be75
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 09:35:17.7354
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sFEJS9+Hw7mmNMUCGpo1QhC22y5AsgmPpACxQcqfg6PbAESMgGTIVanhKc5IbidgK2YMO3TfyfThjc3LQYw/CNz3hJXfFSIMWwKFhBHRfF0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5159
X-OriginatorOrg: intel.com

On 2025-07-14 11:15 AM, Takashi Iwai wrote:
> On Mon, 14 Jul 2025 11:08:01 +0200,
> Cezary Rojewski wrote:
>>
>> On 2025-07-14 11:04 AM, Takashi Iwai wrote:
>>> On Mon, 14 Jul 2025 10:57:59 +0200,
>>> Cezary Rojewski wrote:
>>>>
>>>> On 2025-07-09 6:04 PM, Takashi Iwai wrote:
>>>>> Now move the all remaining codec drivers from sound/pci/hda to
>>>>> sound/hda/codecs subdirectory.  Some drivers are put under the further
>>>>> vendor subdirectory, and the vendor helper code (*_helper.c) are put
>>>>> under helpers subdirectory.  Also the sub-codec drivers are moved under
>>>>> a different subdirectory, sound/hda/codecs/sub-codecs, for
>>>>> distinguishing from the main HD-audio codec drivers.
>>>>>
>>>>> The prefix patch_ and hda_ as well as the suffix _helper are dropped
>>>>> from file names as they are mostly superfluous.
>>>>>
>>>>> No functional changes but just file path shuffling.
>>>>>
>>>>
>>>> Path: codecs/side-codecs/ looks wierd. My suggestion is to avoid the
>>>> repeat and stay with codecs/side/.
>>>
>>> Sorry, too late, I already merged the stuff.  (And IMO codecs/side
>>> doesn't sound intuitive.)
>>>
>>> Since the directory names are more or less understandable, and Cirrus
>>> people seem OK with it, so let's leave as is.
>>
>> Oh, didn't notice. The series is large and I wasn't expecting it to
>> get merged that quickly.
> 
> There should be no much functional changes and the only matter is file
> name shuffling, and no much regression reports from 0-day, so I
> decided to merge for 6.17.  Then earlier, better.
> 
> Currently no further code change is planned from my side for 6.17.
> Also some changes have been queued, they are post 6.17 materials.
> 
>> Guess no point in reviewing the rest then, thanks for the information!
> 
> We may still rename if something looks too worrisome, of course.
> If you have something in mind, let me know.

Thank you. I'll update my tactic a bit - rebase onto the new hda/ and 
reply/send patches separately if anything pops up.

There is a lot to look at and, at the same time it's very encouraging to 
see major work done in hda/ area :)

Kind regards,
Czarek
