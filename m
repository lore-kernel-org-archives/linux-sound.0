Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D75030DEA3;
	Tue, 28 Apr 2026 08:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777363539; cv=fail; b=hIr6f+hWt4LIBIKbE5RhKRPZGjzD7wKRLuxGMjtlALU+1HXva/bCUMbA+5GwKVMV6UT8E4R25jcNGMkisqk+nlbnsfWyj7+qLj4x2M6R032Kuanzxk2L3MIGWw5bhhOqF/GqT0aC/Zq1eh/b2p+HSwnCUD+oZJikwgupYgDnNdU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777363539; c=relaxed/simple;
	bh=eKgHuPwy+zEa7038Hz9P66ApUACw2uJQiOf74jJ2YXk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nispO9re3y5zhuISasEIsZhbul72cpfN+9B78B/CpiqpyCYFQlF7BJhH5I8cbrVX7lUtHLqeKZ95qq/s6JHa/tR3nnClLw3v2nf9pMptVwTtIhEXViwW7cs71yC4UXpFUob9wgNLuXa4riICJONTizs0Exvru7HTA2KQ3z6wpNg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EXMXHZpm; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EXMXHZpm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777363538; x=1808899538;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=eKgHuPwy+zEa7038Hz9P66ApUACw2uJQiOf74jJ2YXk=;
  b=EXMXHZpmwJVQMkIWl2ByCncp0Cu6KCNNC9SBtXGAE1V4ohNUT9PJNJXS
   Ucy84lbtobH3m2x1f46w8nLudmGdFn3952FCMZPZqrda8NT4+loOdeV/o
   V3HSHWN/UIxH/k/nZmmVJwc53NSC74v2fjIMGijgXhdQRFrFohzaPSIA+
   a1XoYy/PGFxvAYlZ631jnR1/YHhLklRSylCBk+DQ19h8cFVHRIuzlkL4s
   rJsTthbHWgDW6UsBsbpYSokwRnaHZk9/oUOw3NAlegEoFOVbcCd07gN2R
   KNCPJvnPS5rmL6sTpYMii5ThP7/5Z2fSN+X4F/7TPde1aVOVgY3VukbRB
   A==;
X-CSE-ConnectionGUID: F7lGQo0cTBKRrow8Tv+RdQ==
X-CSE-MsgGUID: WIsACtYbTW6f9rSnGP8qmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="82116989"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; 
   d="scan'208";a="82116989"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 01:05:38 -0700
X-CSE-ConnectionGUID: ob87uX8bRuKnne89pmN8pA==
X-CSE-MsgGUID: v+1cWoBQREWa2/Go8TLYNg==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 01:05:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 28 Apr 2026 01:05:37 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 28 Apr 2026 01:05:37 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.45) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 28 Apr 2026 01:05:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cvqC6AnKAt+AJRnUXplDX5lyf+qJatWqb1KLxvnkH/30lKe9KAU8xqFRKlSeTBvH2aO3GTe0dG24i+LA86HpnaUlK163cXrk+evvvXUoWamJjGVItlpTqrzK3DV26kqdEsOMS3EkErP8KRAAxiAABUGKCxnPSCwzJinV9K27Eo2bUsbNliFxDBFgTYvS9/dYU7DMq7lkBtVHDLyJaimPuvQUdK1LoYtViKOtfWS5dNKBagrMZnFaJMbvt8eGihIIatU2fYucHAztOGBjPwSmf9oaR4aIAMZjNPtGx7m6l2sNXaG2fNaz1S5XWQa7uYe9o7fcuT/jw7WOI4vzWM/Y1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eKgHuPwy+zEa7038Hz9P66ApUACw2uJQiOf74jJ2YXk=;
 b=JbAVi88UmRedZq+BYBUhU2gmoTUIB2PW6BmrLB7pIvog+udBPqCrNnjo35WAMs2eARr+VXw4S7aLE9qd5QFpHwkKRPOB7oFJqJN/W2z31LjKGS+z8T0PXus6zDUxw4o+v8K8kpof6N3XOTyuvMrAcksZkHZyKG0mF69j5aPnE3oczDihJzzyej7osGZiHXLXHR4uxxLLG+TotUFC0fhlcblpKEeAS+VFhbGWw38POG523tcB5zJo7SkWCnMixAIWGbmMx5fwjazHlxJmEm/AIWDoEXFIWj6+irY5OrUPLUEVlQatz1CKy5+2shlTQsm5CBruQDbqlNRpliD9BwBRVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com (2603:10b6:a03:53e::10)
 by SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.15; Tue, 28 Apr
 2026 08:05:34 +0000
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::3df:33f9:59a1:da76]) by SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::3df:33f9:59a1:da76%5]) with mapi id 15.20.9870.013; Tue, 28 Apr 2026
 08:05:33 +0000
From: "Liao, Bard" <bard.liao@intel.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "vkoul@kernel.org" <vkoul@kernel.org>
CC: "vinod.koul@linaro.org" <vinod.koul@linaro.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"pierre-louis.bossart@linux.dev" <pierre-louis.bossart@linux.dev>,
	"peter.ujfalusi@linux.intel.com" <peter.ujfalusi@linux.intel.com>
Subject: RE: [PATCH 2/2] soundwire: record Peripheral scale_index
Thread-Topic: [PATCH 2/2] soundwire: record Peripheral scale_index
Thread-Index: AQHcvExzTHgxVasB90GnJJKme0ztiLXqcj/wgAnfCMA=
Date: Tue, 28 Apr 2026 08:05:33 +0000
Message-ID: <SJ2PR11MB84248728E44D163E8578765BFF372@SJ2PR11MB8424.namprd11.prod.outlook.com>
References: <20260325114156.1028118-1-yung-chuan.liao@linux.intel.com>
 <20260325114156.1028118-3-yung-chuan.liao@linux.intel.com>
 <SJ2PR11MB8424027CB4355B9B11BDAC82FF2D2@SJ2PR11MB8424.namprd11.prod.outlook.com>
In-Reply-To: <SJ2PR11MB8424027CB4355B9B11BDAC82FF2D2@SJ2PR11MB8424.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB8424:EE_|SA0PR11MB4719:EE_
x-ms-office365-filtering-correlation-id: 6e0d60a6-62e6-4137-01bd-08dea4fcec64
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: AlfI9ejsEGCiE6l+aWFGLd51mKfhF2lhr5K06ZsDoLE5sbwu0sAHRSIZWylujpFyHb9DcitbsJfleMhH7E6wvM8NlHiXg1y+63ng+ee9yJwWtoqjH1qMaIutA47hK2UfZZMr3s0aGDTPgtgkhBkC1Dcx1khfl7pdG2xMd5cQNFjca6QroC0SoPGjIOxp9pIlGla1FV9TmCL0VWV6FpXYxfqrbHe2kco3VkJb9y3XzKlCrffJkNDpj22yxgUOnef6lnCrZ6NY+Td8QbCG0874EbECPTAfuKq5P1JHEc3DUit3UfOsX9sYJCdugnGRbf2+GI6OE6aodlRgr15B7RHvA4o0hJbdtGdfuGDYzpctJ+EJJAkpLJQv30lakgsjUTNmbe0966HnmczRNg8s8Lu5Sw9UAqfx3zyDdSWEOK3f1gDrkwWjSVWOCn/nxaktBl1euVhIo1cANR0Lo4urZD5BLiryGCmCfQ0ARtjxwVoBoqN60xb7i8EIOZSiDhE7ug2YIfWSpO8SH+pEMrOYFZGsz9ICdlOui0GmTuujB3c6vwHWnS2HFE+mf4g5lcGV72nTNr72d3519lQvfamHQMxMOBb8s86yeqywWUcTG2JIYFalzPXT9t61S2PHYlQ714Vpf8DKvNLHvn33KgGK9nN2o636ZL/d8fdNIRSo0FMe59dSpegu6habKWlCYNsMaDJ331tnqb2SngtIAn6NgPjKamBPPq5xX77T/GK+RqkAA03iN4YiF0EgRb38lL1polZ92715Hhn9ev7UbSX8dBSiJt/C3N/xf3biWjoYknkzpws=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8424.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TWRYa1VqRHVtSDlKVjMzQ0xUWHkwVXVMb2YzRWk5aUc3ZnYxSFR3RFZyS3N5?=
 =?utf-8?B?V1BsamtQWVlQWW9PT0xwcitlbDN1VVhaZmY1Tnl5UVVzdFV5VUR5TVFqV3BK?=
 =?utf-8?B?U3QxanJ2WVlDMjdZMU40WlNTS0h1M1FLZ21iaWFGNFRLVkNtZnVHS3BETWww?=
 =?utf-8?B?OUpPVVplNzQ2NDY3MGVzNXdMQUQ0a3BWMC9HUmxabUc5eHF1WTZ6ZDc2NDRX?=
 =?utf-8?B?YWdkMTVGWU92YlVwS2Q0Ym03NDhHSWUwcXpGT1c4RFlIa2VaYXJZR2NGMlFh?=
 =?utf-8?B?TFFZSEI2NUh0bTVwWDEya2xIallPd1FRMjZrdWhQblZ6N05rdVNVS1Y0L09q?=
 =?utf-8?B?azhaZ3RNakRibDl1Y1h2bGVnRVBHTFFacFFEZDdzZm1DRXZJcW1adEFzUysw?=
 =?utf-8?B?Y2JCZE94QUplSFNLdjlBb0NiR05SUDZwQUdUdHJXOHpTNlArU0dVcGs4ci9C?=
 =?utf-8?B?UTVyRHUrU2crYWo3dVc0b2dQOEo3dVVrLzk5V1M0Wlc3dFhpNzlGUXU1MUpK?=
 =?utf-8?B?M3UvVDlzemRrMk9PYW82NWNGcFZ6c1JITlUzNjBLbnJZNzZJR0phY0ZKaDN6?=
 =?utf-8?B?Z25MTEFZR3E1VUZONDJDeWM0S1lHekFBWFpiL1pYeDdIQlZxZzJYOUJSNkRI?=
 =?utf-8?B?L0xDb0x1ZW5FdW5LZTQ0ZW5aY2xjNjd1aHAyU3ZHbTA1VW00VU44ZzNpZFBP?=
 =?utf-8?B?L1JOYThIcDlsUWtKVnNkMnZadGhIUnBKcG5GNjl2b2ZlNDJOWmt4OWNOOTFh?=
 =?utf-8?B?T0xrOHgyQVI1eVlTS2RFYk5sNUl4U29DZDMwcWlpL3pDc1ZOaVNldTZVOUxX?=
 =?utf-8?B?cURyNE9xSkNtRjJucmpjR3p0SGd2SFRrLy9lVE5DZG5oUHk0YVNRalZYYmJ3?=
 =?utf-8?B?SWNxTmJib1dtRDFpSXBzVzVUZzk4UkhhdEdCUDI0K3hmRVVHN1p6Ry9XbWF6?=
 =?utf-8?B?dmh3Wk42WFFrRVZ5aXNXM2NjTlRkaUNQeCs1NmlYTUNTNWZTSUlob2g5Tk1M?=
 =?utf-8?B?dHA3b29TNEhlVXdlbk1qSmt4cTFZaG16Mkd5RnpQQVZOVU8vS1pjeFN0NkNJ?=
 =?utf-8?B?c25xSU44NTRrdTBKanB6dVFEOUVlVnB5UXcwZVdJQnVtbDNna2RHWDE5MjFs?=
 =?utf-8?B?MEJ0SDAwdTFKWXNSdTFnUjgzMTFGbit3aVlqU0JWcEVJM2tCd2xJZEsrZTZY?=
 =?utf-8?B?dGMrcXcvQ1grMVVySERkUlVNc1ZZYlFGSmdVdStKU0tXOVY4enNDeUd3UTAx?=
 =?utf-8?B?NkhSSytCNmNZYzhTNjlYQ3cremNYY25TZEFEMDJIM0lENExrVFBWMjZSVG9O?=
 =?utf-8?B?dENqU0xUczNJaE9UcmpDQXpHYlhnQU5BWHZsWmUvWlNJdlBJdldPOGZWWkVt?=
 =?utf-8?B?OTRUNlZwS2N2Ni9iWUw0NmlNa3dIS2tMNXRvNUpyV0VBMFZYTVc2eWw2WkFk?=
 =?utf-8?B?dk92ZWdSQXVZdUxVcVkzN0trc04yaVJDQ2lLZzE4eEkwd3IySWE2MkQ5MldX?=
 =?utf-8?B?eE9XcUlHYjR3YmRaYjZiNHRzeVVBMWl3N2UvMC95WDc3SnJ6RXdZb0ZwbElv?=
 =?utf-8?B?b2daSTdiZEdFb21VdEhpVkd2aDZRYnhBL1A3REhtSUVsblR1dUtWeVFXSU1W?=
 =?utf-8?B?a2pBV3hqYWJKMUpxVVM5UUpZTWhBMzcvVjdlUHJDd0lVNitHdTVxc3l3ZHBK?=
 =?utf-8?B?WGJSRG1PMDY4K1BJS0xBSU1GdnJOVzkzZ21DTzVBSFVQdXRIaVBHVXFscmlm?=
 =?utf-8?B?Zks0OVRVUmJHL0xNb0pHZTJvZFNtajJZS0pDazV4ZEhDb3BPdGxHMVJSQjBD?=
 =?utf-8?B?QzBzSHI4eGFLQmJzZkVZN3VOQXhoVW0wWnBUQitodHpaclg4THdjeHptWFFy?=
 =?utf-8?B?cHJvbGlVUFNpY05RRlhnNHptZ29vTmhjeFRrb2FTSzFYQ0tBYVcvc3gwVzRa?=
 =?utf-8?B?RFpEKzl6cTdaUzZ2cjhmM1hsb3lsUm9vWm11dWZCeitHbU5aUTFtQXliR3Bk?=
 =?utf-8?B?a01hL1V1SCsycXB2Sk55Q0tleDhPM09IWjU5dWppRWtYNXFWdWthSFlVc1FY?=
 =?utf-8?B?eFhuVVBqZ2Roc2p1VXJOYWQxZFJueFBnaEFtUU1ITmt2U3hMMHg3akNCRldY?=
 =?utf-8?B?eFFTWk1LVnQyY2JETS8vUzJiZHg3dkF1Z2VGR3o5RjFKNG1PUWwxTEFGYUx3?=
 =?utf-8?B?TlBnZHpSM3dXdXd1c0NCQ0c0UURmNFplMDR4Tkd3dnhLWUtNTlpQWjkvbWI3?=
 =?utf-8?B?NFZ3MXpDVTdtTnViVVVjYVlDM0EwcytYTHJxRmpydjAzU04wdG53SGZhWkZJ?=
 =?utf-8?Q?jbjC+SpJweeYzyW0i8?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: TQoXF5SD5oPCQk5nqeeX7X9sJs4YLpiKWGBMIaiXjgbJwOvSEuwwVi9lCzt3vehsu0NUK9MWFB4papkZzfG4DdJGmirPx3ElZ4q3bEP7pF8PKSbm71ZOiUBE0agQCXEviiWsoJYHn/5VOwy3p2acrCYCfdZyGOXZNsWO9fPLljkJqSEaRlSWtY1LOgq6XPPNobeGO2WVPprGhUHKWLqZDvSdGAP1Bil0JQ5PT1qiH2WRtwxwHAZEIgCPB9whJ/QbL1rGHNxvzkzXkJboevDWMzfYeGE4mKLTX9O7bV9DCc23x8RpVcyv1GpYdW5OO3wPzsV6YyVtgT3pon1hpai/uw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e0d60a6-62e6-4137-01bd-08dea4fcec64
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2026 08:05:33.7677
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dDJsXgzANACaTyFzzI42vqv8BX0J5ctbJfwQmfG/f07hfxXUJygAnWp7bErYHuT21Al03JwgVYnKgXuBq9bx7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4719
X-OriginatorOrg: intel.com

DQoNCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+IEZyb206IEJhcmQgTGlhbyA8
eXVuZy1jaHVhbi5saWFvQGxpbnV4LmludGVsLmNvbT4NCj4gPiBTZW50OiBXZWRuZXNkYXksIE1h
cmNoIDI1LCAyMDI2IDc6NDIgUE0NCj4gPiBUbzogbGludXgtc291bmRAdmdlci5rZXJuZWwub3Jn
OyB2a291bEBrZXJuZWwub3JnDQo+ID4gQ2M6IHZpbm9kLmtvdWxAbGluYXJvLm9yZzsgbGludXgt
a2VybmVsQHZnZXIua2VybmVsLm9yZzsgcGllcnJlLQ0KPiA+IGxvdWlzLmJvc3NhcnRAbGludXgu
ZGV2OyBwZXRlci51amZhbHVzaUBsaW51eC5pbnRlbC5jb207IExpYW8sIEJhcmQNCj4gPiA8YmFy
ZC5saWFvQGludGVsLmNvbT4NCj4gPiBTdWJqZWN0OiBbUEFUQ0ggMi8yXSBzb3VuZHdpcmU6IHJl
Y29yZCBQZXJpcGhlcmFsIHNjYWxlX2luZGV4DQo+ID4NCj4gPiBDdXJyZW50bHksIHdlIHByb2dy
YW0gYnVzIGNsb2NrIHNjYWxlIGluZGV4IHVuY29uZGl0aW9uYWxseS4gSXQgaXMgbm90DQo+ID4g
bmVjZXNzYXJ5IGlmIHRoZSBuZXcgaW5kZXggaXMgdGhlIHNhbWUgYXMgdGhlIGN1cnJlbnQgb25l
Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmFyZCBMaWFvIDx5dW5nLWNodWFuLmxpYW9AbGlu
dXguaW50ZWwuY29tPg0KPiA+IFJldmlld2VkLWJ5OiBTaW1vbiBUcmltbWVyIDxzaW1vbnRAb3Bl
bnNvdXJjZS5jaXJydXMuY29tPg0KPiA+IFJldmlld2VkLWJ5OiBQw6l0ZXIgVWpmYWx1c2kgPHBl
dGVyLnVqZmFsdXNpQGxpbnV4LmludGVsLmNvbT4NCj4gPiBSZXZpZXdlZC1ieTogUmFuamFuaSBT
cmlkaGFyYW4gPHJhbmphbmkuc3JpZGhhcmFuQGxpbnV4LmludGVsLmNvbT4NCj4gPiAtLS0NCg0K
PiA+ICBtYW5hZ2VyX3J1bnRpbWU6DQo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvc291
bmR3aXJlL3Nkdy5oIGIvaW5jbHVkZS9saW51eC9zb3VuZHdpcmUvc2R3LmgNCj4gPiBpbmRleCA2
MTQ3ZWIxZmIyMTAuLjA4NDUxODJmNzVmOSAxMDA2NDQNCj4gPiAtLS0gYS9pbmNsdWRlL2xpbnV4
L3NvdW5kd2lyZS9zZHcuaA0KPiA+ICsrKyBiL2luY2x1ZGUvbGludXgvc291bmR3aXJlL3Nkdy5o
DQo+ID4gQEAgLTY2MSw2ICs2NjEsNyBAQCBzdHJ1Y3Qgc2R3X3NsYXZlX29wcyB7DQo+ID4gICAq
IHByb3RvY29sIGZvciBTb3VuZFdpcmUgbW9ja3VwIGRldmljZXMNCj4gPiAgICogQHNkd19kZXZf
bG9jazogbXV0ZXggdXNlZCB0byBwcm90ZWN0IGNhbGxiYWNrcy9yZW1vdmUgcmFjZXMNCj4gPiAg
ICogQHNkY2FfZGF0YTogc3RydWN0dXJlIGNvbnRhaW5pbmcgYWxsIGRldmljZSBkYXRhIGZvciBT
RENBIGhlbHBlcnMNCj4gPiArICogQHNjYWxlX2luZGV4OiBjdXJyZW50IGJ1cyBjbG9jayBzY2Fs
aW5nIGluZGV4DQo+ID4gICAqLw0KPiA+ICBzdHJ1Y3Qgc2R3X3NsYXZlIHsNCj4gPiAgCXN0cnVj
dCBzZHdfc2xhdmVfaWQgaWQ7DQo+ID4gQEAgLTY4Niw2ICs2ODcsNyBAQCBzdHJ1Y3Qgc2R3X3Ns
YXZlIHsNCj4gPiAgCWJvb2wgaXNfbW9ja3VwX2RldmljZTsNCj4gPiAgCXN0cnVjdCBtdXRleCBz
ZHdfZGV2X2xvY2s7IC8qIHByb3RlY3QgY2FsbGJhY2tzL3JlbW92ZSByYWNlcyAqLw0KPiA+ICAJ
c3RydWN0IHNkY2FfZGV2aWNlX2RhdGEgc2RjYV9kYXRhOw0KPiA+ICsJdW5zaWduZWQgaW50IHNj
YWxlX2luZGV4Ow0KPiANCj4gV2UgbmVlZCB0byBzdG9yZSB0aGUgc2NhbGUgaW5kZXggZm9yIGJv
dGggYmFua3MuDQo+IFdpbGwgdXBkYXRlIGluIHYyLg0KDQpPbiBzZWNvbmQgdGhvdWdodCwgdGhl
IGJlbmVmaXRzIG9mIHRoaXMgY29tbWl0IGRvbid0IG91dHdlaWdoIHRoZSBlZmZvcnQNCm9mIG1h
aW50YWluaW5nIHRoZSBzY2FsZV9pbmRleCByZWdpc3Rlci4gSSB3aWxsIGRyb3AgaXQgYW5kIHJl
c2VuZCB0aGUgZmlyc3QNCmNvbW1pdC4NCg0KPiANCj4gPiAgfTsNCj4gPg0KPiA+ICAjZGVmaW5l
IGRldl90b19zZHdfZGV2KF9kZXYpIGNvbnRhaW5lcl9vZihfZGV2LCBzdHJ1Y3Qgc2R3X3NsYXZl
LCBkZXYpDQo+ID4gLS0NCj4gPiAyLjQzLjANCg0K
