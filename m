Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45691E00A0
	for <linux-sound@vger.kernel.org>; Fri,  4 Apr 2025 12:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743771165; cv=fail; b=VMA+jOt6wuQrpv45Ko9cf1d2zCXJR4D9mNWacokmC8j9xcm29UyUhIhh2o/PFEMR2/FzDm6MEMYt9yYJnojenpCZmLofmXP1GY9ECEqCRLKTsh6nWmGGKzhl2qQkSVXJQrz8OurLyl7xLFP/PVFHX+lUeBk+y1LfMlJDqPWsfw0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743771165; c=relaxed/simple;
	bh=PNyRY9NUkpkhWCqWk4e5Eh9d3mtKQ6dl7y7wE0UZQuY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fMzCEaf5ZStzW6t3kyomMsAoUC6Owt3us77rgUK7ymld9zsLVWvJd3k8lf4J3ZLqIBcV0FnzpMTwo78T9F3UdHrHHDWXCHBBmjQ+ygXPyQGaeVGFoqAJEi7kURDt8B+/8bR/6/FEVt5tLM8nHsPNIaNDCQyK57LglD8J/PPHy0w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TXUwg5jA; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TXUwg5jA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743771164; x=1775307164;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=PNyRY9NUkpkhWCqWk4e5Eh9d3mtKQ6dl7y7wE0UZQuY=;
  b=TXUwg5jAIVkVvO/PnEtoDdDJ+ewfPrgMAmC9Lkt7BZqcMAu9TichLMCv
   0KI2IgK6R8VTgtS44gfyF2dbF1W1V+UERjCEOau1hABRvAqxE7DhqUO6v
   PKC3as5OJt/Dyg18/vBGoovPRT2a60JgWPV7sMAaREVAzd0xwceYeX+N5
   qCBy+/fQ1ndDf+UuRG+WUbNatd7xHkMfgzpy4yuPa6HIx1IFbVMEPi3G0
   /ifKWt2ypRUO8Pknwv4UNdJ0Riwtho52Ro9wF53+ay8hWZp/peBbXf3pP
   wtDzQmwM2L5KffPgPdIW/FClSyfrDW8UcQrxbqlQGIbRTOtZMiHrIcky7
   g==;
X-CSE-ConnectionGUID: mhAtBLOSRNqMpM6XRwR32w==
X-CSE-MsgGUID: bW31X//yQEWl0FSHBd1M+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="56575899"
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="56575899"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 05:52:43 -0700
X-CSE-ConnectionGUID: DP/T1NMdTE6f/oKqOlqpPA==
X-CSE-MsgGUID: Y9Rmnq9/SAOJmFtFKDkS/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="127118065"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 05:52:43 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 4 Apr 2025 05:52:42 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 4 Apr 2025 05:52:42 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 4 Apr 2025 05:52:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w1hSjjqRFILSrltF30jYTZ72eodvzMeteeQF5uSurzC8JaSdLBuAnmaakqwcMntETn4AOCGz0Hl8o/axPolp/4NfhLO29+V3IsWOOKKzkuNeSmH1j6xcvNVk40u59sZxX6Ed0H9riR/gZdK/JN9iThu2eakfimvQd9Xe9xd3kuH6ISE0nL38gcTKcAQyvKwNa5/DTlL0MOBz2i7Ue11CZaX9fNfqMrXui6ZEB/XH2jOq10EAwPfNfOnbQPmXBUHN7D46+A6xj+K0RJNE2HCrwv62Vb+nsSNubnsBYt4gJZe+EDfBWthqIq3/ln4kPEdLzumC0eYn5xtBbkE8Brn+MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PNyRY9NUkpkhWCqWk4e5Eh9d3mtKQ6dl7y7wE0UZQuY=;
 b=a80UQidEyBeSZYwaEkgyutAmo342PxBbA9sYLOshbRvPuvQak5xTnvEz07l6/ocguu+PgseeLtBqgrgqGwVMqT+rsUnqZS/aiu3RUAb0/zAi9gXauOmNHl0zGMSgtH6Xt6j1BXuuuitCW4Pdxky0Go1SoftwJ08RMn9f38FqaXnxnEpJSBW9ktycxiCHBoKCSVBfsW4HAomxv7qFvNuGJUD7UyR3pmy3HGxOQ31NwuG9UEkCb2IeFToxqaFEPBhwsfVl4raChiNnLBaKlL6/zSSwIzUgXswMkcsjWE24gs5I2bXJX7QfQzXPS+6OhL0tynZ0PQRSY4Kw7r9X7F3C9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB5792.namprd11.prod.outlook.com (2603:10b6:a03:425::9)
 by MW3PR11MB4602.namprd11.prod.outlook.com (2603:10b6:303:52::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 4 Apr
 2025 12:52:12 +0000
Received: from SJ0PR11MB5792.namprd11.prod.outlook.com
 ([fe80::2e4c:49ee:6f37:d200]) by SJ0PR11MB5792.namprd11.prod.outlook.com
 ([fe80::2e4c:49ee:6f37:d200%4]) with mapi id 15.20.8534.045; Fri, 4 Apr 2025
 12:52:12 +0000
From: "Girdwood, Liam R" <liam.r.girdwood@intel.com>
To: "broonie@kernel.org" <broonie@kernel.org>, "Rojewski, Cezary"
	<cezary.rojewski@intel.com>
CC: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"hdegoede@redhat.com" <hdegoede@redhat.com>, "perex@perex.cz"
	<perex@perex.cz>, "amadeuszx.slawinski@linux.intel.com"
	<amadeuszx.slawinski@linux.intel.com>, "tiwai@suse.com" <tiwai@suse.com>
Subject: Re: [PATCH 00/12] ASoC: Intel: avs: Add support for MTL-FCL platforms
Thread-Topic: [PATCH 00/12] ASoC: Intel: avs: Add support for MTL-FCL
 platforms
Thread-Index: AQHbpV/FHTEbCMdxQUKL9OqqNoE6irOTdgIA
Date: Fri, 4 Apr 2025 12:52:12 +0000
Message-ID: <ce71ea6903d05c3b5312c9f534d83478e488729e.camel@intel.com>
References: <20250404094953.3657679-1-cezary.rojewski@intel.com>
In-Reply-To: <20250404094953.3657679-1-cezary.rojewski@intel.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.54.2-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5792:EE_|MW3PR11MB4602:EE_
x-ms-office365-filtering-correlation-id: 00a91c91-a9d9-41d3-652a-08dd737784f7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ZUYzTkFRRnZ3cjdIZ21sbmVrc1Zldk9iRVJhTmVsVE8yeXhjYkMxNkRGWk43?=
 =?utf-8?B?dmVjMTNQTUdmUTF2VUYwTnhzSWJNK252UlQrTmNrUU5iaER6QXphL2tKZkQw?=
 =?utf-8?B?VjQwN1ErR1NzbWFGSllhVldsUkNLLzNYQ2pGVTVINkx6NjNicDhmS3R3NDNn?=
 =?utf-8?B?WFVHNnpmVk1kc0Q2eWRQVTQ4MDVXeFR3N0FzVVdRZE9JZVpwSnJRQVVHKzEy?=
 =?utf-8?B?RURJWmNTNngxMVJoL2ZBRmFBaHN1L2tUZkpPL0F0SzB3UVV0Rnl6UjZMdDRL?=
 =?utf-8?B?UndXV2RLc1pJNHNtMUxJM3hRWlNpdENMMlovWnZwem56dlpTdXh4V1JlVTVO?=
 =?utf-8?B?OVE1SVR1NFlKNHlNdWhjMjVTVzRxd1lZZTg5TXhmRi9BTE5pZnNULzdQcnZ6?=
 =?utf-8?B?SnRIVkRqaUZjdDFTWVVNT1laK0hnd3hqOE1KT0Q3aDNKWXFQTkJGTzA3Sm1y?=
 =?utf-8?B?eFZoYXdBODE2N3l1dGtyTlV3STZqWlpTWkpvN0E2M0FuOUdIVCtMbXlxNXkv?=
 =?utf-8?B?QlJJeEhTaEV3b0tJVzZLaDQ4Tzl6VDV3WTdaRlhXRFhkTmQ3TnlJVHhjYVZX?=
 =?utf-8?B?VC9menZ4NllMYWZyUlZtYzZOQ1ZiM3ZHUDRJMXFWZVVWNklZcktzejJ3ZUEy?=
 =?utf-8?B?Y0NHajNOQ3A1TWhIeWw2Q0lSN1cvYm5jckVwZHdZRnJ4YnlJZFVjTGtweTRR?=
 =?utf-8?B?MzVWYWJHTkNaUUJVTUtTU2VlSGR5K1ZaS2R2USs3bTBHVFpROXRscGRETVNn?=
 =?utf-8?B?K1BRbS84N0pYNFpRNGwrT1VyVGthOWFEOVR1enF0Q2k2QU8rSHVaa05yb2sy?=
 =?utf-8?B?ZSt0YVZJMjk4TktXT1Zxd1VpUjhIekdHaGJWQTlmbWxWanJkdUt0RVBhS0tJ?=
 =?utf-8?B?ZWhScWlYR0tZQkVHMVRXSUZXVEJSdFd0eFNjUDZwYk9EZGtQQzZOYkFuM0to?=
 =?utf-8?B?b3p3MkJyMGRDZHNvZnJPSXlzMTB1U21Vd0dwR0x1SlVLc3FQQ0pWL29UeHF2?=
 =?utf-8?B?a3NrSmtBUEZhZjVMb3RRcmt0TTZtSVdaeXZ0K1NoSXpwbEgrZXlhS0JCdG5l?=
 =?utf-8?B?ckRQZU5BNUJIcEFibDJ5MVl1WTI0NDRnMDZpMjI3WkE0Qk54ZktWYkxrOC90?=
 =?utf-8?B?SkR5ZWhna08rRnpDNm1rcnkvUmUwbFpqZldZNkd5enNpWlRwVXVjQnJUNnho?=
 =?utf-8?B?UTU1SkE2MEVGR3pVNHRCQWlWRFRleUZtT0FPUFFsZlM4Y2k4MC9ncmw1eVdh?=
 =?utf-8?B?UGVGUUp4VnViRkxQRS9udmxlQzlKUHVJNFFLelZMRGltWlVWT1YvYlIxMGVB?=
 =?utf-8?B?cXYrN1BJSktlVmhqWFV5N3FqcmprL1phRGwxandRNzRRQ29naWlueW9qNVpE?=
 =?utf-8?B?RUVlMTNKNFk1NnhZUTRnYTRIb1JXQmhVMlRDeTlnSlNKU29sUFdEc2Zndi81?=
 =?utf-8?B?ZkN3LzM5bStiRDQzRWErSTlmSHVkc0d5K0hyMmxwUDFiQTZ2YkZlR3Yrd3NK?=
 =?utf-8?B?ZVV4TFZWWVNzdHdBSWVmV0VzUUIxZ0U1dVVFVVNEWGQ5eGxNSmh6K1RPNkc5?=
 =?utf-8?B?U0hKQ2RyeDFyKzlTZXovdEpUWHVndDU5TzJ6djNOQm1sRnZxV3dBNGU4UGE2?=
 =?utf-8?B?cmVSWUQ3bks2NmlwKzM2NVB2YytBL1dFa2hacjdTZFlpTitTVzluMW5FMmVl?=
 =?utf-8?B?Q0kwMHFEVUhtVHMyMUc3MEl3cG01Q2RlbDQvbFA0Nmx1THFFNllMMVhTOFBP?=
 =?utf-8?B?OGhNSVQrYjZkemtjY2Ntbk01cDR2UlhkOWRnbTNLSmptVHFzdzBXWFplS2Rk?=
 =?utf-8?B?MXZ5ZG03NlpYVVpWeFhVc1daNHlydlNPcTQ2K1RGYmxVdmxJenMvYWlVak5P?=
 =?utf-8?B?Q0hRenc1TW5vQTFON1F0WFcwQzE1dWUrQzJNZGhUb1BGNzZlWGtQRDlkeDZl?=
 =?utf-8?Q?shpkfT0rr4gQuLCy8s5prZ0koCmAW1Hl?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5792.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aDllZVNzZk1DOENtU0JzSCsyTUx0Q3hPU0NncStwZElxVDNaMXBkVENUcUFT?=
 =?utf-8?B?R0xKZk44MDM0RlMrWU51eEN5TzdoM0IrZWNyMjNQV0o4U21MQ05JZnVuT28v?=
 =?utf-8?B?K2dhaWdjVzNXMEF4blVGV1ZGeStUK1pvcUg0cTFGWGtpMXBqbHh3RHBtLzhT?=
 =?utf-8?B?T1lSU2ZyZHNNclV4by9Hd3Uwd2hsWmV4M3VVdlJtRU1GVXZBZHhYdExQNFUw?=
 =?utf-8?B?NGRlc1JRcGFndExRS2h5dXlHVXNMa2xvczIwNzIvNFBIOC9scE9xK3VUaUhl?=
 =?utf-8?B?Ri9yMDdOWHAxSXhRNkdaWTBpZm8zL2psMWZjdmtKekh4RWxOOFdXMDQ4KzF5?=
 =?utf-8?B?TERndjFtYkt0Q29nczEzUU8zMGg3T0NYSWVZcGZ5aFJ3NThQREdma1NBUEdJ?=
 =?utf-8?B?SnZ2S1lJbXdWUEFoR2M2VVhrR0h6dU9sNVMvcU1EWlIwSWJNUDE2VEk1QWNX?=
 =?utf-8?B?WWlzaVFPUVRLOCtHUDExalN3d0xMZ3NtOHQ0L2NBUnc4WUhZakFUNmlKSTN2?=
 =?utf-8?B?NUFvZG4wd2ljSDkzSjVpQkYyY0pKTkZOTmlGbklzTUJEditjZThGZi9FeEwz?=
 =?utf-8?B?a3JOYXJ4Znc2cDhJbVlxd0hudWhzTStFZUU4NHBYOEFFWkdua0VlcWc3Rldt?=
 =?utf-8?B?M3Y0NFEwZzczY1NrRGwxekg5dFpvc3JPUWFIWTJMWnRtN2gzZFAzVlN5ekpF?=
 =?utf-8?B?OVMrd2tKODFSQmRMOUhGR2RTVVExZkR5MVhVVERoL0ZpYTJZWlZUSUxrRGVz?=
 =?utf-8?B?WW9USVRWTk1JdkJoOXRIaTlBODlYR0dRekwwU3UrSVJSSFMvNHVEdzg1N0hC?=
 =?utf-8?B?VitWRFhCSGw0MEFESnBZVnFjMnFFN0RLV0FzWWttQUpXUUdqTnlYWkJMa0NU?=
 =?utf-8?B?czFvdzZDS3pHdUFQVU9GZW9sczBTZmlWTWVHSmJscVJXNUphWnppYjhBcGlh?=
 =?utf-8?B?cm9Pa3laa1I1RGw4aGlETjlSUlRhL3VrVWpwbUdINTFiTWtVL1g4TmhqSTY2?=
 =?utf-8?B?aTNCQW1teHFrQlV2QWVDbjRFTEZBeXVvU1d3MUxreGlCSnZMS3JoTG9Ibk5m?=
 =?utf-8?B?R1JBUXcyT1dvbUJ5UzhCcWRJalhCanFCZzh6VjJKQkFYM2JXNzVvLzZhQnhw?=
 =?utf-8?B?aCtJc1JCTmg3Sjh3ai9oUlF5T0p6c1cxakpEclZFTThhcGRPT3dZQU1iakJJ?=
 =?utf-8?B?N2ozU3FuSEgxaXFlKzRqTHVaTnFXT1lpbkFiNFE1OU1na1RNSFczRkNkYk95?=
 =?utf-8?B?bzBNOFhEY2ZnVkp0SU5qM2xHKzZMWGF2d25jZG9RajZ1azRDTTN3Rmd4aHhX?=
 =?utf-8?B?OXNkUnZ0K1g2VXVqZFdYb1h5N1l0YzdwR1pPUzVMWlZ5QkF5emhxZjVVUEFw?=
 =?utf-8?B?ZGhuR0lKZVgwOThNdUFuOFhQektTV0RreUs4dHRYNjF6Q29FL3Y1M3kyVEpD?=
 =?utf-8?B?c256T0l5QkdydXpLdUR3cWxJN0FLcXBicEFTdS9hWm9yeXJiUEo3TWtPRlpC?=
 =?utf-8?B?TlplTk53SjZrWXcyQWNlYmRVYmZwZWh3VkRUU2ZzeE91QUZOVkhsSHMycU45?=
 =?utf-8?B?dStzTG02TGxieW1CQ1hKWWZvR2Q2RnBaOHZldFlqeFFsanRQbXlJaFVzV1pL?=
 =?utf-8?B?NnhSUG5USVIwb0FKNWpKZndoZmIzTGpVU3ZoZERqaWx6TWtJczFrWjZUUDhO?=
 =?utf-8?B?VnhQQWV6S1Z1MlYzV3pFUldjenYrWkFBMU1HQkdzdHVrYlU0L1lTSlgwd2RY?=
 =?utf-8?B?Z2l2NWtKVzN5NlR3UDEwS0wrT1lsN0lLdE9rK0gySWpsdVZrODVHTFJnUXgy?=
 =?utf-8?B?eW9zUm8rdzJFcTh2ZWIvUXk3WUJsY3ROaEs2cFA4L0VobHJ5ME5kblE4U0xK?=
 =?utf-8?B?azNFeEFUZFQ1a2FsYXovMjNaSStpZ1JiM1l2UXdGUzVsWU9LclFONUQzZ2lX?=
 =?utf-8?B?VVEvbXcvZW9iK0tsckdrNXRXSTZYQnI5L3lxZDRUNHhLSE9abXMvNGhUVFoy?=
 =?utf-8?B?bS9Kb1pFQ3hYRmR6eForNTRraWhyYWVFMVdudGhUWjJBY01NKzVCRWl6ZGhY?=
 =?utf-8?B?QmcvTWFCd0FYY2VZSEk3cURlRFZTTkRsUDBMaFRpTlhpMUpURUorc3JSK3k2?=
 =?utf-8?B?amRlZGlzOVcwSkpDaGJPank2SEhIcUdMMmZkNVJROEdneEhON3BIeERFZ2ln?=
 =?utf-8?B?M1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <00A6CA5DAAFA6C40A7D18620A8770FF7@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00a91c91-a9d9-41d3-652a-08dd737784f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Apr 2025 12:52:12.5447
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KFJj7eVVZX2Y0f9CxCQcf00QBLYW3oY3qbdfc88ZtF4/yFG9OY5LE8yVNJgNd3GW1Z5v4Wb1yhppRmoy/H8/0oMwvbBSqVBQSs8tsxGNhe0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4602
X-OriginatorOrg: intel.com

T24gRnJpLCAyMDI1LTA0LTA0IGF0IDExOjQ5ICswMjAwLCBDZXphcnkgUm9qZXdza2kgd3JvdGU6
DQo+IENlemFyeSBSb2pld3NraSAoMTEpOg0KPiDCoCBBTFNBOiBoZGE6IEFsbG93IHRvIGZldGNo
IGhsaW5rIGJ5IElEDQo+IMKgIEFTb0M6IEludGVsOiBhdnM6IElnbm9yZSBWZW5kb3Itc3BhY2Ug
bWFuaXB1bGF0aW9uIGZvciBBQ0UNCj4gwqAgQVNvQzogSW50ZWw6IGF2czogUmVhZCBIVyBjYXBh
YmlsaXRpZXMgd2hlbiBwb3NzaWJsZQ0KPiDCoCBBU29DOiBJbnRlbDogYXZzOiBSZWxvY2F0ZSBE
U1Agc3RhdHVzIHJlZ2lzdGVycw0KPiDCoCBBU29DOiBJbnRlbDogYXZzOiBNVEwtYmFzZWQgcGxh
dGZvcm1zIHN1cHBvcnQNCj4gwqAgQVNvQzogSW50ZWw6IGF2czogTE5MLWJhc2VkIHBsYXRmb3Jt
cyBzdXBwb3J0DQo+IMKgIEFTb0M6IEludGVsOiBhdnM6IFBUTC1iYXNlZCBwbGF0Zm9ybXMgc3Vw
cG9ydA0KPiDCoCBBU29DOiBJbnRlbDogYXZzOiBQQ00gb3BlcmF0aW9ucyBmb3IgTE5MLWJhc2Vk
IHBsYXRmb3Jtcw0KPiANClNvcnJ5IC0gQVZTIGlzIG5vdCBvZmZpY2lhbGx5IHN1cHBvcnRlZCBm
b3IgTVRMLCBMTkwgYW5kIFBUTCBvbiBMaW51eC4gDQoNCk5BSy4NCg0KVGhlIHJlc3QgaXMgZmlu
ZS4NCg0KTGlhbQ0KDQo=
