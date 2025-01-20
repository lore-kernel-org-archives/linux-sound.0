Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826D54A1E;
	Mon, 20 Jan 2025 02:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737338773; cv=fail; b=ILQb8tSG+C8UrcfThVU9wP5wArwP2921L5ikN+1h0RDNYLj29koT8B1+Rbboj4NUqWx8NNBm3WkLoTbFSUYt7M+z8aOahj4nkLRN35JuVi+8ySdL9DfsVyqgx9QnKH/nb6h2d8I7enrS0PfzWE0DbqS+COqiQDyY4keZ2b+azjg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737338773; c=relaxed/simple;
	bh=alX18MvpBQQEHsAQlnJpamMALqshdMwE4HHIq+sIYkc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kjnLb24rAUAsyRF58Zryc/6zh6qW4Vn9U14LJZ+ajaPUZSABJns8HiGZqL32n8l5zUEg1pLFFqNZd+D9F3OMd+/ZepIcha2IcSclH/7kC6pRYREvKWdygK2LKdE4u8rz6Et/70R3uuoFqIeVUIcuVTK5uUF0PJjXssplXFZoCZQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FCUvHDyW; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FCUvHDyW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737338772; x=1768874772;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=alX18MvpBQQEHsAQlnJpamMALqshdMwE4HHIq+sIYkc=;
  b=FCUvHDyW5zO9MCXIyrrBGzdbzVsKq4P1LlDkurobZ4xcPPdz+13M+SQ0
   ji17Gv4alPPIgddqR/VBByY7OC1kPaYih6etkVmFDhm3D9kW2YCJ+mmMV
   HxsL9ng4vv98uB03wUo7rlLlSsYfhBsl/2AG6Zv+oarjVkik5Zc5/A5tA
   wa/Pd3YNQSaxzfNYvD2B8PYL4fmPMXgQlwJF+FsF8xchzctt4/pkRC7Dj
   4WCRcxxmm8LN0E43sS2v8Kb/EfiDf+mk18hRPqFDbbT0QVVvu3rEO8thy
   7HPfG4oNNJBqcI8V2JDugMH7slSdHgMP+S5i1Two83+ykIQWQCiGY1Nzl
   w==;
X-CSE-ConnectionGUID: X2dgl5eVRd+Q5iZBQ6WDww==
X-CSE-MsgGUID: iaUxdEkLRc67n0bOq3CGoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="37802862"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="37802862"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2025 18:06:11 -0800
X-CSE-ConnectionGUID: 2guTiv5MSzyZmKUzD9kC/Q==
X-CSE-MsgGUID: mF05wdBQRxi5KWdJQ7mNpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106784638"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 19 Jan 2025 18:06:10 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 19 Jan 2025 18:06:09 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 19 Jan 2025 18:06:09 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 19 Jan 2025 18:06:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nj2sxuzV8GHOUKwA0V6LDjFdIB+C16XYzpb1rnWiy1pNFBxGGL8lOzwGhLg5K7vOFaqtPybzOf7sH3rK2MXnyv6t8pHNAFWjAieXGkekwTFj7SJaspNrpFcCgzaWwqjW85Td8gm4M3wv1Pim++jMyJQ6MezHiyJ6IdRrEw4r3vgRBhFc5/cIpAyc7gN0kk7dtVZJQfe41rOvYJmCS2s/FF92TI5+AKGtfwM6J5M0weLrlwS5nCFT7ypy9H0l81cMe2N3qZkNDxgKc6upEika+Zp1nOR57I4hxz9+Ajs+oLpdwSBuqMa0bnjDgpN5u48lHzhoSsuORlBKVXtjGNcwgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=alX18MvpBQQEHsAQlnJpamMALqshdMwE4HHIq+sIYkc=;
 b=NOu7a95VqFVKbX+hcbw9OCdQbVXGCA5wSzxPI0Z6yzkEVIRCGlI7fZaNX9qLXvQW+pSu78t+2Af+1ynthE019RwO7poik0XVAvpFm9/eP6lHTFKt2motY5QBHurmY/RnIB9fjo/TxAo8am7hk9vjebI/dSfdLHI8Ate0U0mz0vro2jdXWcqwXCcrocslcPUAJnFzwf72FwmGkHgSqY+QJOyWq92zQMBCZK4xzhYpIeTVem+SBQxWtA5KCmkIfUb5jWiPvDhha4+plUiW0XyRWZK7gXm5Oxd368WsOzIsTn1HSDp18eNBDABBP64xTM1GyrcnrT751VwuItZtw6JBfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com (2603:10b6:a03:53e::10)
 by IA0PR11MB7955.namprd11.prod.outlook.com (2603:10b6:208:3dd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.19; Mon, 20 Jan
 2025 02:06:07 +0000
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::4053:18a0:f95:3b9c]) by SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::4053:18a0:f95:3b9c%5]) with mapi id 15.20.8335.017; Mon, 20 Jan 2025
 02:06:07 +0000
From: "Liao, Bard" <bard.liao@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "vkoul@kernel.org" <vkoul@kernel.org>
CC: "vinod.koul@linaro.org" <vinod.koul@linaro.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 0/2] soundwire: set frame shape and divider based on
 actual clk
Thread-Topic: [PATCH v2 0/2] soundwire: set frame shape and divider based on
 actual clk
Thread-Index: AQHbZkvovpppGXtlLUOqFImKvi0XMLMbKFAAgAPGDWA=
Date: Mon, 20 Jan 2025 02:06:07 +0000
Message-ID: <SJ2PR11MB8424ACAB4FD02EABC57FFF16FFE72@SJ2PR11MB8424.namprd11.prod.outlook.com>
References: <20250114061621.110800-1-yung-chuan.liao@linux.intel.com>
 <5ef1ac08-5025-4902-a50a-83915a54d72a@linux.dev>
In-Reply-To: <5ef1ac08-5025-4902-a50a-83915a54d72a@linux.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB8424:EE_|IA0PR11MB7955:EE_
x-ms-office365-filtering-correlation-id: d70fa79a-0ba3-44ef-8246-08dd38f700ba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?d2draitWcG1XOGhCc3ZzSGJRbUxzOGFIWGxpRUdEMHJENFQvbTdERlZMaFBP?=
 =?utf-8?B?aXVGOTF0dWZIdkFIZUw2VldSazRJMTE3MTJtNkxzS0VRaDB5MnFXbEtSbmpi?=
 =?utf-8?B?UjdaZ0hEMWVZRnR3NmJjdHRIUlU3eEFiSS9DMStUK1ZXbkY1V1N2ZXJiNVNi?=
 =?utf-8?B?UjNRdXQzL2VycElBc2N4ZWphVUdoTEFhVmc1aWpyOTFxZGo5OWhJZ1JUdzE2?=
 =?utf-8?B?WU1pZHkzUFd1MXJQVjZzUUU4eTE3OHNXZlBSakJjSTBUNGFkT1E0TEZSUGlS?=
 =?utf-8?B?REo0Y3luMzhtbDUyMlBXQm5PVFNOT2VDalhyb0h5SHBoRmxRSlZkRGlick1q?=
 =?utf-8?B?b0JaTEZLa1RrVGgzK3VyVFU3MzVBaStVNDlxVWhsU2t0dWRveDI4UEtQQUxz?=
 =?utf-8?B?dFcvL20ySzlTcWpjWmFJa2dKLzFjV3BadWE5T1NLcUI2S0RBK0haM080T0xF?=
 =?utf-8?B?R25BMHI5OEhzTlFZNnpMZDRXc25zZW9uOVhUNWZhWFRaVkZLUDRSQzFTTy82?=
 =?utf-8?B?S2dwQ0NpRUdtbEp5NnlqcFNTVzZQTGozbHpMYmFFWjJDZnZ0Y2J6U1JwUWR4?=
 =?utf-8?B?Wnl3R29zZEFScGpmZTd3VUNtaVQvTkVSNVkxcVBoS3FwK0lLanZYS2VHZWh4?=
 =?utf-8?B?bXNpdy9wWStVOTFNUmNmK1pYOVZRQ2Iwd1ZsQ3hIeno4dFVYQXZCYno3WW1E?=
 =?utf-8?B?U1VrMmhxTDJESVpoVG9ZaEhIYkhmUEVEK2cvOC9RSkplS1FYajU5bm5ZTzZq?=
 =?utf-8?B?UXlBMExpTnF0cUdVWjlFQWJXdTM5VHZrMk9ia2grem5sM2dLMnZwMFJmZ3Fy?=
 =?utf-8?B?bHFZeWhrYml4UDdSM1VCelpwd2I4REVGOU5rMDIxSEwzeDIxRWVPWkRObFo1?=
 =?utf-8?B?bFFJbnhqU2dSbU1HV0xJMHJ2VUpRZXMwdWZncUdoSXNLYUNkZGJheDJNSDFJ?=
 =?utf-8?B?cmF3TmdsVE96RnI3UkRaU2xBR2JuYWNtby9Ddkp1b1BNWmk0aXhkQk9HRWQ5?=
 =?utf-8?B?dDA4YnBOMW1JVDFxZDVSUUFGKzhlTUpUWms1T2VDZEVQa0UyZkcrTytKQmdF?=
 =?utf-8?B?ZHRyMEVHL2t3aVRzRHZzTC9SRVdaVnVHOTZ6M2tKUkI0N0JSY3lFS0NZMzIv?=
 =?utf-8?B?SHBlTXlZT1l2azE5d3pLVGY4Y1UxMjVPK3ZqczQ0RlBFb2JKd05SNjdmT2hw?=
 =?utf-8?B?eDdsS1djSHJKTkVjbHhyWCtLRXRaQVhxVDNWcHdoKzZ5RVpVVTE1VjNLdzhZ?=
 =?utf-8?B?dXpxc3c4TXhpTnBBM2hXNVpMeVIydkFpNm9uU2h4ZWZJaEFuTk1lK0tpUm5z?=
 =?utf-8?B?bzdxSDB3OFlNbm1EdHNwSFEyNVkweHJsUWx1T3hkTkRNT0l5WHB2RTR5SUFJ?=
 =?utf-8?B?Nmg4UWRBTTBQTHZidFVpWVlzMEY0bjVvVTlwVjdFZmlGMmp2ZnpBRTZrMHg5?=
 =?utf-8?B?d3g2YkhROStIQ1ZMNGNycjdleWxqVTBocExIY095MkRaMExUQVJrdE9NTnht?=
 =?utf-8?B?dWE2RHZJVTFJU0ZZUVIzbCtnU3FCZ3Q2Z2ZsRUIrbHhXTmg3SWxXTElnTUU1?=
 =?utf-8?B?Q0JMVENqOG9jQ0pyRlBHUTlVVXBPRnEvV3NiZG9Rd3MzMGN4ZThIdXhqcDRH?=
 =?utf-8?B?a2U4V0xGWm5mTkMvd0ZUTVU1RGtFaitkNms1Q3JHbDlNWVhXLzFsbEh6K05E?=
 =?utf-8?B?SGdKOTM2c0wraDV5NHVMd1JQY05kNjFBWTlrNVZmVG8wUmN4dkdMUnRtY1Ez?=
 =?utf-8?B?WnNmNzNLd2tnLzdpaVpJVTdWOTF2QlRzSmhXZE1RK2h3bklXbHdzMVpNeUdM?=
 =?utf-8?B?citiclRkWTE3Q2JLdTgzbkg5dDZoK2k5TEdnamUzUTRBNStOK0cwM1pPOW5v?=
 =?utf-8?B?eEdmUVg1eklrL05VdlBEMzk1SzFZbFd5cDdjbHV4U1FTUG11d214RUF4cFEy?=
 =?utf-8?Q?dAuG0bD8pefF6sl+fYeed5p56Vc6uLg3?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8424.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q2daZVlkSVV4WTJhcVR0NnZVZXVEbkZHTDA5dTVaMldRbjl2TzZZTTAxZEpF?=
 =?utf-8?B?QUVxSi9TZ3pCV25BSFVhVmlXUXVoODdPcHljTEE5T29YNkRlbWpRV2tsbEpG?=
 =?utf-8?B?UWx6enpueWpHcXFaWnJ0SStuT3p1K1ZTRHdvMkF2Uy9hSmo3WUhKcU1UbWlu?=
 =?utf-8?B?MTVhZmxLeEFudWZaeXEzeFQva0FVQkw4bUJBbUF2MnVES1BjU1lmdjFrR0pM?=
 =?utf-8?B?TXhWbnp0UTdYOGQ3bUZEcW51aXNyZUk1YVFLbkJzaERYMGZmMXlWdEZ4OUhS?=
 =?utf-8?B?N1hpeTBkNDJOTFVnaVVHdW83UjVjUEMzNnpHeDVnVEg1eVY4V0ljZERSTGNv?=
 =?utf-8?B?S0RSYUJxSFA4NHdXUVJJQW9IcDYzMXNHcCtNb1RHbUkxY0g3L1NJN3BCUE8z?=
 =?utf-8?B?TFMydzJVcFpTZitaUnZUbWNFRWl0Qm1yTGlyckloNlFLVUhGTmx4alUvdUpP?=
 =?utf-8?B?ekZXOGN1elMzdDhjbFY3Nm5tSVJvRkZEQ0VsTDBRM3JiY0NSdDRFaTVXNlVv?=
 =?utf-8?B?UmRNTTFUbW1ESDJ0dm5FUXZSR1g2cENEQnVhdGovYVpYTTNvL2d6aGZ5WmRv?=
 =?utf-8?B?OWEvSWZXYzArOHNrQXVHN3M4Q0NIa1lDL21JZUcvNW9nZDFLSGFjaSt5Z2tj?=
 =?utf-8?B?S0JCUTdkamVvOUdPUWcvK2MwYW5EUUFSZmY2UzA3VDJtMHNTNksvdFFGbGRa?=
 =?utf-8?B?d1JWbHBIVnViVG4rRFE2WkN3dDJMdUY1WXRZb2ZXQ3VrOTBna1A4L2psb1pD?=
 =?utf-8?B?ZDRud0NLcEU3TUc4ZmFvclhDVm9OalBkaVkrMU9pS3hkMVVlNGt5SUgzRm1C?=
 =?utf-8?B?SlBjcVRPTHlja0JGaVVaa2cxYk0zaksyMjBSL2JFZGc2U2RjYXZSZDhqY1F4?=
 =?utf-8?B?eXJsb2YwM1h4RmZxamwvYm5wamVpOTVQNjJRdHBhdHR5S2doZDJTUXRuUEUx?=
 =?utf-8?B?Tk01MThweUl5STVqR08rNGdzREhRbERmMS9reG43ZTE3OXJoUmxlWWMvSW1u?=
 =?utf-8?B?dXhJMGVsL2FQTXZZRkJUSHFFNkZzU2xzNXdXU1BNdXRhK1dyOG9Td2p2eU5y?=
 =?utf-8?B?Z1MzM0dOYjA4VDI1RmJ1WmI1eHBEbFZzd2o1eHd0Z0dyUm1Tek1ZRDFVWVFl?=
 =?utf-8?B?ME1oNVZSTTVRVGh0b0pvbm1mVFAvNVlPUnY5NWtYY25OS1hwVFZmb2kreDRD?=
 =?utf-8?B?NVltcHdYdlJ4Y042QmZqMFZkQ1N2NWZQN090K3A1M2x4Y3FZRTdCdDRhc3Av?=
 =?utf-8?B?YlloamtDejNMT2YwcEJiWjdpeC85enVHR3pKakRpUnI4a0h2eU96OGxxQUZP?=
 =?utf-8?B?UXJqV1k5S1dpVXdwQldsZ28ydmxkaXJELzRpbE5VMytUbjNBMUlGRVp4R2JG?=
 =?utf-8?B?Qnd1czNmeC9YQVNpOUJGNFFiTE5EM2FOdlV0QlNqR20zMXZNUGNJODI5bkc0?=
 =?utf-8?B?Z01TUU5sS1cxNnFaNlVObTFRb25wbUtvSWd0Mm1PcmNjcCtMZHdRUWY0NDNx?=
 =?utf-8?B?M2d2MncvUnlZb3hOSGJFRFRWdTZobGkvbWtoTkw4NGNDaUoyRlgzR3M1TEtW?=
 =?utf-8?B?azNPL3BURi9sSFNPSDBLdXluVDdpblI3S1FBZ2dCeHJDcWxsMFU4Y2ZydG9h?=
 =?utf-8?B?T3k3NVJ5cG9SV1lRUFRhSERSWmhUYUhaK1BtajAyRTkxLy9pbnQxbXY2OTFt?=
 =?utf-8?B?ZkxSNldwUXc3WS9UWFlKTWEwK3Mva3N2ZlpKd0s0eEJNem0rVXkvTFAzengz?=
 =?utf-8?B?a09ZbS9IL01lbXNhR0cxL0tXQjFZaG1TNnIzb29WOFd1QWZNbWpYNTlDMmh2?=
 =?utf-8?B?YVp5ZFJiOWNnRStSdndaZEFMUmFiMnNaR3JDWEhiaTlvRncyZFlRMC9PaDcy?=
 =?utf-8?B?OTNDc0RoU2tyUFh4c2hUVkdCV0F2cVFpZE1OS3ZscTRXNHF2Z29kblhwRkJS?=
 =?utf-8?B?VzR1UlVtSnF3M2h3b2ZXM3dqUWNWTjBOTzlDN21LTWtYd2tTTTBQTVRXMVZa?=
 =?utf-8?B?RTRmaC9pUnpNRTErcllzWE8wWVFhVkhDWXcycGd3WC9CaHdhRXk5T2JOQlZJ?=
 =?utf-8?B?R00zVkxCOFU4ZGlHOXFVYXhiRVlodm94OXh5N0NOcFNXb0FWNGVTd0pkM0RJ?=
 =?utf-8?Q?AYlA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d70fa79a-0ba3-44ef-8246-08dd38f700ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2025 02:06:07.6482
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SDGZjzXVW48Z/IYwOgb8adK4D+KPk04ljgKP7cH2IUSwihzssj5IAWvcCVKFS0SZUVp+RhZuiWJ/REOQcIWszQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7955
X-OriginatorOrg: intel.com

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGllcnJlLUxvdWlzIEJv
c3NhcnQgPHBpZXJyZS1sb3Vpcy5ib3NzYXJ0QGxpbnV4LmRldj4NCj4gU2VudDogU2F0dXJkYXks
IEphbnVhcnkgMTgsIDIwMjUgMTI6MTEgQU0NCj4gVG86IEJhcmQgTGlhbyA8eXVuZy1jaHVhbi5s
aWFvQGxpbnV4LmludGVsLmNvbT47IGxpbnV4LXNvdW5kQHZnZXIua2VybmVsLm9yZzsNCj4gdmtv
dWxAa2VybmVsLm9yZw0KPiBDYzogdmlub2Qua291bEBsaW5hcm8ub3JnOyBsaW51eC1rZXJuZWxA
dmdlci5rZXJuZWwub3JnOyBMaWFvLCBCYXJkDQo+IDxiYXJkLmxpYW9AaW50ZWwuY29tPg0KPiBT
dWJqZWN0OiBSZTogW1BBVENIIHYyIDAvMl0gc291bmR3aXJlOiBzZXQgZnJhbWUgc2hhcGUgYW5k
IGRpdmlkZXIgYmFzZWQgb24NCj4gYWN0dWFsIGNsaw0KPiANCj4gT24gMS8xNC8yNSAxMjoxNiBB
TSwgQmFyZCBMaWFvIHdyb3RlOg0KPiA+IFNldCBmcmFtZSBzaGFwZSBhbmQgY2xvY2sgZGl2aWRl
ciBiYXNlZCBvbiBhY3R1YWwgY2xvY2sgZnJlcXVlbmN5LiBBbmQNCj4gPiB3aXRoIHRoYXQgY2hh
bmdlLCB3ZSBjYW4gc3VwcG9ydCBja29jayBjaGFuZ2UgaW4gSW50ZWwgcGxhdGZvcm1zLg0KPiA+
DQo+ID4gdjI6DQo+ID4gIC0gTWF2ZSB0aGUgY2hlY2sgYmVmb3JlIHdyaXRpbmcgdGhlIGRpdmlk
ZXIgcmVnaXN0ZXJzDQo+ID4gIC0gUmVtb3ZlIHRoZSAnZnJlcScgaW50ZXJtZWRpYXRlIHZhcmlh
YmxlIHdoaWNoIGlzIG11bHRpcGxpZWQgYnkgdHdvDQo+ID4gICAgYWZ0ZXIgZGl2aWRlZCBieSB0
d28uDQo+ID4NCj4gPiBCYXJkIExpYW8gKDIpOg0KPiA+ICAgc291bmR3aXJlOiBjYWRlbmNlX21h
c3Rlcjogc2V0IGZyYW1lIHNoYXBlIGFuZCBkaXZpZGVyIGJhc2VkIG9uIGFjdHVhbA0KPiA+ICAg
ICBjbGsgZnJlcQ0KPiA+ICAgUmV2ZXJ0ICJzb3VuZHdpcmU6IGludGVsX2F1eGRldmljZTogc3Rh
cnQgdGhlIGJ1cyBhdCBkZWZhdWx0DQo+ID4gICAgIGZyZXF1ZW5jeSINCj4gDQo+IFRoaXMgbG9v
a3MgZmluZSBzbw0KPiANCj4gUmV2aWV3ZWQtYnk6IFBpZXJyZS1Mb3VpcyBCb3NzYXJ0IDxwaWVy
cmUtbG91aXMuYm9zc2FydEBsaW51eC5kZXY+DQo+IA0KPiBidXQgb25lIGFkZGl0aW9uYWwgcXVl
c3Rpb246IHdoYXQgaXMgdGhlIGRlZmF1bHQgc3RhcnQgZnJlcXVlbmN5PyBUaGVyZSBpcyBhbg0K
PiBleHBlY3RhdGlvbiBpbiBTb3VuZFdpcmUgMS4yIHRoYXQgdGhlIGJ1cyBzdGFydHMgYXQgdGhl
IHNsb3dlc3Qgc3BlZWQgdG8gYWxsb3cNCj4gZm9yIHBvdGVudGlhbCBwcm9ncmFtbWluZyBvZiBQ
SFkgcmVnaXN0ZXJzIGJlZm9yZSBidW1waW5nIHRoZSBzcGVlZCB0byBhDQo+IGhpZ2hlciByYXRl
LiBJIGRvbid0IHJlY2FsbCB3aGF0IGlzIHR5cGljYWxseSBsaXN0ZWQgaW4gdGhlIF9EU0QgcHJv
cGVydGllcywgaXQnZCBiZSBhDQo+IG1pc3Rha2UgdG8gc3RhcnQgYmxpbmRseSB3aXRoIHRoZSBm
aXJzdCBsaXN0ZWQgdmFsdWUgaWYgaXQgaGFwcGVucyB0byBiZSB0aGUgbWF4DQo+IHJhdGUuDQoN
CkN1cnJlbnRseSwgd2Ugc3RhcnQgd2l0aCB0aGUgZmlyc3QgbGlzdGVkIHZhbHVlLiBJIGNoZWNr
ZWQgdGhlIGxpc3RlZA0KdmFsdWVzLCBhbmQgdGhlIGZpcnN0IHZhbHVlIGlzIHRoZSBzbG93ZXN0
IGFuZCB0aGUgbGF0dGVyIGlzIGZhc3Rlci4NCkJ1dCwgeWVzLCBJIGFncmVlIHRoYXQgd2UgY2Fu
J3QgcmVseSBvbiB0aGUgX0RTRCBwcm9wZXJ0aWVzLg0KTGV0J3Mgc29ydCBpdCB3aGVuIHdlIGdl
dCB0aGUgdmFsdWVzLg0KDQo+IA0KPiA+ICBkcml2ZXJzL3NvdW5kd2lyZS9jYWRlbmNlX21hc3Rl
ci5jICB8IDIyICsrKysrKysrKysrKysrKysrKystLS0NCj4gPiAgZHJpdmVycy9zb3VuZHdpcmUv
aW50ZWxfYXV4ZGV2aWNlLmMgfCAyMSAtLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gPiAgMiBmaWxl
cyBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCAyNCBkZWxldGlvbnMoLSkNCj4gPg0KDQo=
