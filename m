Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41845C8E0
	for <linux-sound@vger.kernel.org>; Mon,  7 Apr 2025 13:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744032682; cv=fail; b=WedZ6hl4rk/IXc7SAodjdxxg4rtoSfiZyluHlmCMsRqFxR06iuiCzTGx5bY5XS3+WzQK4wzLmQcpoiTpS34PnFnnb54DLkV2JleRD05u6BS95jJyc/v1KKf92FAi3b6tNbuMHYsW10HqAlEPAV6JnnS8kAXLTiANljC5HS3lxb4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744032682; c=relaxed/simple;
	bh=0oXtlUtQ4wDnujzmOciXpX2nShBfQRa80GzSdAlmyGE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mmMs7HkCKCgKx8RG3dOxClLvl3ILQpXC5d/z61mdhjyrupcXpEagaum7NSmvYn0xn43YUDHN1UlNBdXkR3GtmNH1t5GjmvPs7JwinS0h9AjZvXMyX8gbFX9gQqMXyL49+AhRajo22poIxk1q24IaB5YeB8BrhtGqBXhJcI1yWGY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JbzVyC3J; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JbzVyC3J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744032681; x=1775568681;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=0oXtlUtQ4wDnujzmOciXpX2nShBfQRa80GzSdAlmyGE=;
  b=JbzVyC3JiIzfib6JcAx5j5NT2Emd+cuoRUuR4XD7QdomlzMXyDCvwncR
   zLaDHV2lhi1lH1bEYRe5DgQ+hL2ZidxEtuXb0XyzwOELv26ZtZGrwKBDY
   7hnxlM8Iv5zsJwpzbaEJv6vzwz3XMQmaPqC1LvxB6qSTOVidWexdJ4Ji5
   nlf3QLBtsG9yIoOC9wni6sh2zCyAKuHFjCMn1usZ1GOi7jqaisEqkLZgM
   s6R0brGNfbw6L774U8s+Ii8qS0nBXAGTTgcbZcCAHanywQTWrrRrDNeTc
   g9x8icgwNHahKXK02opru4ncd2kwGGf5HWKsoBqy7hSBZAEiQeGD9c8jY
   A==;
X-CSE-ConnectionGUID: cujvz12mSVCn2KxxOL/4XQ==
X-CSE-MsgGUID: g43e7nN3Rc6r+j+i/OkZGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56055891"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="56055891"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 06:31:18 -0700
X-CSE-ConnectionGUID: n3iJsDlESVKWjnBi+6l56w==
X-CSE-MsgGUID: Nr0ZXjSYSLaZjVT3TXZnLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="128289693"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 06:31:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 7 Apr 2025 06:31:18 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 7 Apr 2025 06:31:18 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 7 Apr 2025 06:31:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VgvBve3oTbRsvQkM8nNgWx7/sQvwBbGs9nbNFOo4tAadf56r9OoUiPlMUbOwy92J03AC+HIiObFt5sPNaqRd7dzUyk4MO+21gEt3eDLPfSUV+I4WNKGmdCZRMkepml8etdZe7lntC6wd8zCFKWwoOeQVgQjUK4rncihB9Z1NXA+NVvrwSKVKKtoyraKnDZGlURqKu7ALds69Cu+RFg3uUBW/twr911GRPGsctBXMfI5Exqo2f2FtLGKuqf5NTNME4I/1Aml+oVwRn6bONDxR935WAv6V9axnwkm2s+ory8iCkS4qEXE+SAoHCvQNnDkOvNpBGBLZ9UdvkLRNn8RrYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0oXtlUtQ4wDnujzmOciXpX2nShBfQRa80GzSdAlmyGE=;
 b=vEfSppwW7PWBrd8HVHfXl7+uEajnA71uY3lPGza5vxpgeVPzXHvQTmHjxlyNAHTvqgSXXEU0+ndPVfmHHOp16TwQSwp2Ho/hb8hOTYF2s/Pl7HrAgZpPKDXWzX4N3UUV0/5khwoWDLxrfYZ7w3dQZInkZRqRbzDPjQjf4GLFU7T23hVJZaObqyehsmxDweJEmhSvyYNlkvnC9XVUZ7StAZxGZBYWf+KW4YXiqe2o7sfT902JmFpWKYpAmlKIuf/A9dK/4U9GL+GmgwVo35XD1+b8Mv7P9RUZQkJeTEGVec+fEGDHn7Jfr0IwJuJ7IaHOUTazYhEgOxijFPCyCMg9xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB5792.namprd11.prod.outlook.com (2603:10b6:a03:425::9)
 by LV3PR11MB8725.namprd11.prod.outlook.com (2603:10b6:408:21e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.46; Mon, 7 Apr
 2025 13:31:15 +0000
Received: from SJ0PR11MB5792.namprd11.prod.outlook.com
 ([fe80::2e4c:49ee:6f37:d200]) by SJ0PR11MB5792.namprd11.prod.outlook.com
 ([fe80::2e4c:49ee:6f37:d200%4]) with mapi id 15.20.8606.033; Mon, 7 Apr 2025
 13:31:15 +0000
From: "Girdwood, Liam R" <liam.r.girdwood@intel.com>
To: "broonie@kernel.org" <broonie@kernel.org>, "Rojewski, Cezary"
	<cezary.rojewski@intel.com>
CC: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"perex@perex.cz" <perex@perex.cz>, "amadeuszx.slawinski@linux.intel.com"
	<amadeuszx.slawinski@linux.intel.com>, "tiwai@suse.com" <tiwai@suse.com>
Subject: Re: [PATCH v2 00/10] ASoC: Intel: avs: Add support for FCL platform
Thread-Topic: [PATCH v2 00/10] ASoC: Intel: avs: Add support for FCL platform
Thread-Index: AQHbp604ZAroSxADz0ahBni2gEQjC7OYM00A
Date: Mon, 7 Apr 2025 13:31:15 +0000
Message-ID: <5bd371a2f47fec7d92e9033902ab43286796a5fa.camel@intel.com>
References: <20250407112352.3720779-1-cezary.rojewski@intel.com>
In-Reply-To: <20250407112352.3720779-1-cezary.rojewski@intel.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.54.2-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5792:EE_|LV3PR11MB8725:EE_
x-ms-office365-filtering-correlation-id: efb675b4-00d3-4eff-be0e-08dd75d87873
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?VjBNckRIdkl0OE5RdDBNQkRFMzliVEtYRWwxRy9FRmlSQTNNbENWWTV6R2ZL?=
 =?utf-8?B?bWlHTll0Mm4yN1YydXNXSEFId1lHYnRSZTE5WERRQWkvM2NEZzhMM2tNNUVu?=
 =?utf-8?B?N0tTM0dPbjFnSVVYZkd0MnIvVWloZVVHT3d1bnBaQ2VMakwwUElCVEZLcFNt?=
 =?utf-8?B?aEdvZE9rQWFteVoxcTY2czJ6ditzaXpHdGtxRExRRnE4SXRJc281cnNXbjdk?=
 =?utf-8?B?U3Ayc3I0Zzg4TTJsdGUxa2tQWE1Eb3A2Y3M1OVM2ZjdQeDdyaXc5cUowck1I?=
 =?utf-8?B?RGNQQjlsV1E2TTQyUlpXc0hCWUNyRFpUbm9wNkdsb09ndGp0dGZIa0lkblE0?=
 =?utf-8?B?T0xITnFhQXpickVTYkpsMGtpOTNTcTdtWlN2NG1xRVhCeUJBd3hHRGxYckNw?=
 =?utf-8?B?dDVlVTM0d3plTUFueURCTjdhRURReTZFT3RDN3R6R09jZmt0QW5DbWhSWlhm?=
 =?utf-8?B?RnQxTmd1dTJ4d0xWWmw1MTYvSjE0dGZ1eHRaSTVuZlg5NXF3S1RlOVcxdW5L?=
 =?utf-8?B?Q2g0ME1Ncm1saGJkdFpjWmkxT0NDdm54UmNqdE81RTM4VjVyUlVtbWdyRGNP?=
 =?utf-8?B?azdVUzdVNWNDVEYwMzZMNGVuR3Q0ZWdRN0RmenIxWGR0Y1JGNmx1aG9oK3lI?=
 =?utf-8?B?ZUdhWmo2N1JJODVKSlE1b0VFcUNiZVQ0QzlybERGN1ZiRUJaeXVCYzlLQi92?=
 =?utf-8?B?Z1g1NUdzdTBraEM5U0VZTHRkTG82QTZXUDBlU0pmeS9iVFkzVHo1MzBTNlI1?=
 =?utf-8?B?OFpWdmVkWWNTd1NrK3VUcGJGenBqYWhtdFFSTTcxTldkMlFMWDRKUEMwc0t5?=
 =?utf-8?B?ZUJrOHBVTlhqNzM4SU5LNkJpcHBwTUJ2NlRFNXhCaHBkVlYxYnR0alpKWm5h?=
 =?utf-8?B?bGtIbzBaS3Y0YjJ2MjhRRDM3bTlPTVNwS3RudzJicnRuU0JBUjJnQi91b1dR?=
 =?utf-8?B?MUMxNEVIc0VMZ1A4cnduRjBYbzJ6VWUzNlVrL0l6Wkd5MHFudWZyM1FEbWVG?=
 =?utf-8?B?R3VnZjJydlFGR0lKQ09XbXRwbTVvOVp4eDFRZFY4cFNDL3VvN25ybGhYTUsv?=
 =?utf-8?B?d1grS0NKUWo0TW1rNWJZbDNxS0NSZElTSXY1RjAxZTRRMzhZRGZ1RG8rLyty?=
 =?utf-8?B?azV4ZVMvODN5eGJweGI3dy9qTkJ6Yys2b3ZIakpDOFRodGlKeFVqeFQ1Q2tM?=
 =?utf-8?B?MVNVSHhuN3cxY2tBaHMwSFJYSWJ5Sm00b29NVHBqVStuOGlIbXl2YUx0aEpn?=
 =?utf-8?B?WFpYZUJIZy9IemNkcFFxN2RWMTM0MGw5T0RyMWw4eUNXSnhjbVFsb3FjMjE4?=
 =?utf-8?B?VEg5MXY4TTFpMGxheFJUbjVicFlIYmE3clV6MzlvU1BvdE9FbXFtZytCMUo3?=
 =?utf-8?B?bC9oWTlJSzVMSFN5VUtuSG9MNElNWUR4NFlva1pzR21uT2FXUUpJWTlBWU8y?=
 =?utf-8?B?aGFZejA2Y0MxL3BkY0pPcHVYZ0I1aEloQUdIMnNWcmdQUDBiT2JpcWZETGJt?=
 =?utf-8?B?OUJDTzZ2eTNLRDhvMW9jZ0RQdDlSRFhoOE1XRnRWSS85dk1ST1o1K1ZHZEVE?=
 =?utf-8?B?Z3ZMWXlDR3dYMDJFbnBFUXlvVktQbkJaR1lJRVRaTXMzUkJvZ0szZGdXWC9C?=
 =?utf-8?B?OXYvREY0bUtpTW1lWjZPK1VvSUtlbzY2WkYvV2RodVpERGRmd2RBMnZ5cHkz?=
 =?utf-8?B?TjBpdWpBa1FYOHhYcE1lT0lqUEZXVzNJalJHTFd2ZDJET0p3cWNLOGtpMytV?=
 =?utf-8?B?WDUyQjBzS1J6WU5wSXVhYkt4Uit5MkxmN092dDdRMGVYdEhjVGZaUW1aeTQ2?=
 =?utf-8?B?bDl0UFFRMitqNWxJLzJGbnpJUFNZVzdQNGJKcUlJNUZud1N2Z2dJNWJGNXNs?=
 =?utf-8?B?cTl5MGplZ1RrL1J3dVVvcVBTTW02c2VxcG9IYUtJODg5N0FHQXBNMXJGR2VD?=
 =?utf-8?Q?nmubGgAVhyU/oVDyM73Ei08IZDW0UOL/?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5792.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RjkrUm5LaUVLbGcrV0Z3ZDkzQW4xUWgwcFVUQ2lMY09ZNWE1MktHRm14bDFY?=
 =?utf-8?B?dmRnU0krM3kyWFJBRm55amRJdXJDMzNOOGZhR0ljUjc4a2ZDMC9BUnFDN1JM?=
 =?utf-8?B?K3g5QU5UZ3QrSFByZWFQcFhHd0FjcSs2cU1UYWlKaEk4cHFScTQ3VTFWV3FM?=
 =?utf-8?B?L1VhTEhkc2grOWlNdXZWN25Za1JZUHVlbzZpYm4vWUk0UmNPSmlnVXNFVE1L?=
 =?utf-8?B?S05Kd0l1YkR0YldnYnNZci9EOVIwZHBQZlc2RnExWWhhajlDSElOSkxZbVdk?=
 =?utf-8?B?R2JLdGtjQVc0NFJ1SmtrTU9XQzZPRnlhZG9HbzFXaGxHQ2RtaDNZWlpXNUFy?=
 =?utf-8?B?Ly8yUHBRelZIeThIUnhRZGIvbzBOdVYzMGJabGd6Zk5XbUU2MjN5UTRKYStZ?=
 =?utf-8?B?L2w4TzRML0JET2F4dEYwbjR6WVJXWm55NnUxUFJWRXJ6SHRlT1l4bVcyZ2FY?=
 =?utf-8?B?WnpIWmVuczQ5NFdzSEcvaG1taTJFYm50WDRiUm9TWUF4Q1A0OXc3WnpybnpC?=
 =?utf-8?B?MkJNaVcxaG5PaXRCS0xxWnBZSVlnbnpSYjloU1F1UXBUT2hXQVBHVlVKUkxF?=
 =?utf-8?B?NU5wVFRPN2IzQ0NzMTFiNVVlUjgzZ09xOFBuWHZ0bHBjOTNYa3pNUGJsZTJK?=
 =?utf-8?B?Q0VUeXQ5Q2k1Y1ZKM1pmNUhjZnd3TElqbjFKQW94ZnBBa0lGTUw1MXJCUFFS?=
 =?utf-8?B?WndzNk5pZXdkRUpQS1FuMWRPV2VTNlFmcXRyUVYzalR6eUxhaTVNZCtNampH?=
 =?utf-8?B?ZlV3L2pERzFIWDVqTUk1TDNVZ3lEYmJISUZQMnFVOWpBOER5Sk9LYkRYOTBh?=
 =?utf-8?B?T2c2Q05TQVBnckdEVENhU3dMMDZEWEtNSXJEVUhFY1VOY1FZNHRyaFJ2VCtu?=
 =?utf-8?B?T25RZHB2a1hUdHFTR3I4QzkzVmh1anZnR0wrRnFwOEpveno2NWhPZmZqSUdH?=
 =?utf-8?B?UlJxcWpmM3BWWis4VUdIeFdPajVQWW9yQTlZSjg3VFNXb3dJVTBhV3JZNUh4?=
 =?utf-8?B?V2ZmZkxaNDFESFVRbEIvWjFYOGd4NGRLUTdlZVdQanFwWW1JU0s5MUJscTF3?=
 =?utf-8?B?SmZTRWNmYkh3WFNBTGZvYWVDbFdRL0lUK1dQM2dTK1N1elNzNlJwcDR6dy8z?=
 =?utf-8?B?OFFMbUY3SkRydVZyV1ZybWtieHNQUE5sRnNodlY0c0d5R3Y2MDE0UjdOd2px?=
 =?utf-8?B?WEc4NnpRRjdjNXdpVHJFclRzUnRkd0N5OHBtOEF2bnV1eVVLUlR6WVhOdGc3?=
 =?utf-8?B?dHBURzdqMXFxK0RKeUIyTFdxRjNlMmJhZXlzQzNJQVVYZzVPOHd5YlVKL0RM?=
 =?utf-8?B?M2o3d2RGeE04MDZxMkRzYjh0Q0lMT0J1bDlkWVYwcmp6K1g3QlBNRzMxZm9l?=
 =?utf-8?B?cm9CNjk0cFYva1QwSmJUbFZnSEhmU1pDS1l4ekMrZkNDaUdDN0h5QXUxWVRQ?=
 =?utf-8?B?dnBaZTRJV2YxcFNIUUVDNmZaRUJlZUx2WDNsSmNVVlJkR2NERmJyYXhkZUVq?=
 =?utf-8?B?WjB0NUs5UEdFYTU2SkJGdXVmVzFYZmpOWUxERjNUSHBKWGVCNFo5S1pPZTc2?=
 =?utf-8?B?NHlacGlVMFhaOEUvZEJVZG9sTjY0cjRLR3h6ejNwcDlPVmtJSXBDMURkS09K?=
 =?utf-8?B?dFg0RTBOUjNYeGRnTEZ4YkE5d3Q3MG03eVdoWmpubCtSVTRPZjVwVEY3S1Jv?=
 =?utf-8?B?TmZEbk1uOW1IaXRYS2lmS1dBdjhvMGNUclI0WEQ5NTFhZVJWTW9Pb1ZpTlQ3?=
 =?utf-8?B?SWJzd01DaWlrcWZJcENadUNUYmFzeDhVeDdjaGJKWlMrWmpzWVNGSGpnQnlY?=
 =?utf-8?B?bGZMODIzVXM5MStieFRJNmhaWU5IY1NwdWNyajlzeDN3QmtReUhGcURVQ2JK?=
 =?utf-8?B?cVdNWlZZMUlqa0JEaXVvdXpBQUQ5MzE3QXh3YjJwNGxvNWY4QW1ReWpZR2t5?=
 =?utf-8?B?MEhXVm5ydjBOQjd5cmh2cTNRSEN3YU54MlBPdWFCK3Q2VjFmZHRvM0tveU9W?=
 =?utf-8?B?Mm5uSEZydElNSGcyNnZUSDY0a0prNWlweGhRbmJZSHVzQm43Y3M3WkxPUjVo?=
 =?utf-8?B?L1k2K0w0ZnBOMmQ3bjlUUy9lUTAzekt1dm1aK2xDTFI0TS81KzdaSW0raDBQ?=
 =?utf-8?B?WmNiNXI2M0I4bTlJNTk2SnhxL0l5VE13ZzBja3JPd1lBRzR6dFp6cnBiTnda?=
 =?utf-8?B?SEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6E70EEC3760F9D408527676E68BBE123@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efb675b4-00d3-4eff-be0e-08dd75d87873
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2025 13:31:15.0450
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d93TovclrtwXJ6byXiQdKYlLil9weAaXNivV/j+IwgHCLPXvJXhJqCw2rLvyPMO34NTuQ6png4Um1n6U2oybzngLkeQl2WTeIvxINwnCcj0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8725
X-OriginatorOrg: intel.com

T24gTW9uLCAyMDI1LTA0LTA3IGF0IDEzOjIzICswMjAwLCBDZXphcnkgUm9qZXdza2kgd3JvdGU6
DQo+IENoYW5nZXMgaW4gdjI6DQo+IC0gZHJvcHBlZCB0aGUgcGNpX2lkcyBhbmQgdGhlaXIgY29u
dGV4dCBkZXNjcmlwdG9ycyBmb3IgTVRML0xOTA0KPiAtIG1lcmdlZCBNVEwvTE5ML1BUTCBwYXRj
aGVzIHRvZ2V0aGVyLCBnaXZlbiB0aGUgYWJvdmUsIHRoZXJlIGlzIG5vDQo+IG5lZWQNCj4gwqAg
dG8ga2VlcCB0aGVtIHNlcGFyYXRlDQoNCg0KQWNrZWQtYnk6IExpYW0gR2lyZHdvb2QgPGxpYW0u
ci5naXJkd29vZEBsaW51eC5pbnRlbC5jb20+DQo=
