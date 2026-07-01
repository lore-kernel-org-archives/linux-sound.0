Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2573B48BD30;
	Wed,  1 Jul 2026 12:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782909022; cv=fail; b=WvCanS+dOQn04zeWRGlFquD3YpIocSUYnVFCvBjXLhWC4a2pwCQe2MrfWo3qPHxR3fwM77YNsxf7TSDpSBsEChyq6tU5UEgiaAodIA7wOQ2U4hriA8oD8o07qKAtOU5x/OvWyLFWkh49eFm+fcW/ADxTfE7WRMLMPgdI27JDd2I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782909022; c=relaxed/simple;
	bh=DNsmTqCtOjYJc9tJL7P2T5L1guCcrYFyNY1cjDwpbl8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=idlfwPgH88pqcpH7vOJktpWHbNkY35y+ZLGfirVbiW8Ser9HNKoHf9kCxJsrijgvVrBitO9YIyNxrEM3wyWspSeAr6FFqmYI+MLWbDNfspJIGT5GgvTv/Bnj1hZTyakZdd8iS4VnuSlGJXh4MkxiW1zOjYZprdoYoAnFDtdyceg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k9spApS/; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k9spApS/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782909021; x=1814445021;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=DNsmTqCtOjYJc9tJL7P2T5L1guCcrYFyNY1cjDwpbl8=;
  b=k9spApS/gtkt1CPAUDWe9Z+TLa/n+paQW00cI01hE04VrYryEBnpscnS
   EvVQAkzrCvt88IinAZDITUwP5Fwxm7fiBbSOGpE0ekMeL5ssGhs0Xikhm
   8MWVahYFhJqfF1KshKOK4vtJU2SVz2vvWXcIG0IAcGrn20Teb/7HjD4mX
   U9aDP+PY1v0jrl5tSmJBkHyN1jYd7vEhuR9CtiSEICGx5DZy+7Ood2poI
   3DXKFRMSPG3nXt59e+/Io3Fu8fcX1jgtWIpgamH54GqKwKNWQRLQzzL0j
   4Hp0Iod712NIQfSwML5zh26Azf+pg/hJPapmDqzK9yuyYBfQH+K6Ix/PE
   Q==;
X-CSE-ConnectionGUID: QJxDyEWXSvmOojCgiXV0/Q==
X-CSE-MsgGUID: clH3KOSESweXGo6Y8GyeQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="71164051"
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; 
   d="scan'208";a="71164051"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 05:30:20 -0700
X-CSE-ConnectionGUID: oVmj2Q0KSJG0FnzOBObbhQ==
X-CSE-MsgGUID: mfPbmN6pS8aJ6/gALN2hgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; 
   d="scan'208";a="252682488"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 05:30:20 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 1 Jul 2026 05:30:18 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 1 Jul 2026 05:30:18 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.35) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 1 Jul 2026 05:30:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VAPJUcaKcpepaGCLjLA1a4PPE6fETKQxWjJUlY1Y6PCtCwPOfD9fhDkRvuTBgaVsrYjjfvacOQYzVpXZRiQLNNyZAepWuimNhkq6P7tUTFervXl0QEB5HDLPCTlWxmRRY3SwehqR5gK6hGWqL27RNGATMMNyb6A4/fKSFbhQuHHrl5KEPjRcGSU4C8+cl2evFP/qvoPbmU06puJdxZj25jrJmmipb3NCMHdqqf9jr5NeNW83NH9tq5zhJ9/BXQAcYn+5vdeOSBonUXtb2hzR4eNI7obPVEM0+tFk0w1bDL9fvqmQ8C8O19gtjsdqm4taAnAUY2uGZSvkV10KSNJRzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DNsmTqCtOjYJc9tJL7P2T5L1guCcrYFyNY1cjDwpbl8=;
 b=uNCi/t8/P3A1jlwRpC7NoSH9F3ibVJtKZrCamNvuCQff5ycVlD8H/baNJUd4Pr3pLttCgTCRiNg2keYQMK+T55esKCSXGE24Va7mAF0e8stqGi3uq6GjCs9l5Vr7CfFTR4zOcFNtfVjDe8G6WfWXJmK2MQvVZmeb7pDIVYZEmNeoIEeutsqW0BSg7VTZn0YbXXbjmNqyjYYWHbbLLh2xuuRaxCOu2m/ggIlBlsNarW6tzZED/ysLijdJUYrwxbfyNgf49imERBI7XMAgCr4vtF6OggFc/A0bKbYQlRFN2MbBbW//VSwxMYCnslHZzumlAHAmjjUqERZ9NP4l9oUZbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com (2603:10b6:a03:53e::10)
 by DM6PR11MB4691.namprd11.prod.outlook.com (2603:10b6:5:2a6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Wed, 1 Jul 2026
 12:30:16 +0000
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::3df:33f9:59a1:da76]) by SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::3df:33f9:59a1:da76%5]) with mapi id 15.21.0159.018; Wed, 1 Jul 2026
 12:30:16 +0000
From: "Liao, Bard" <bard.liao@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Richard Fitzgerald
	<rf@opensource.cirrus.com>, Bard Liao <yung-chuan.liao@linux.intel.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"vkoul@kernel.org" <vkoul@kernel.org>
CC: "vinod.koul@linaro.org" <vinod.koul@linaro.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"peter.ujfalusi@linux.intel.com" <peter.ujfalusi@linux.intel.com>, "Richard
 Fitzgerald" <Richard.Fitzgerald@cirrus.com>
Subject: RE: [PATCH 2/2] soundwire: Intel: stop sdw clock in system suspend
Thread-Topic: [PATCH 2/2] soundwire: Intel: stop sdw clock in system suspend
Thread-Index: AQHdB9XrKSoHXknUiE2vwPpqgRAaB7ZW10YAgAAOA7CAAAfsAIAAHUeAgAADz4CAAYMgAIAAAVeAgAACm2A=
Date: Wed, 1 Jul 2026 12:30:16 +0000
Message-ID: <SJ2PR11MB84246A521C132AADE57FB59EFFF62@SJ2PR11MB8424.namprd11.prod.outlook.com>
References: <20260629144450.2096823-1-yung-chuan.liao@linux.intel.com>
 <20260629144450.2096823-3-yung-chuan.liao@linux.intel.com>
 <11f8d158-9ddc-46fc-9cd5-11a696d3413f@linux.dev>
 <SJ2PR11MB842410EE22537B0673173EECFFF72@SJ2PR11MB8424.namprd11.prod.outlook.com>
 <520f67ca-941b-4e08-8985-03f0e09b0313@opensource.cirrus.com>
 <46af3cdf-d704-4cd2-bb24-cbe9fb1303db@linux.dev>
 <e326c51a-4690-44c4-bf3d-0870591b1eed@opensource.cirrus.com>
 <74bb6575-7d92-43af-98fd-dd46a83b2fac@linux.dev>
 <7c8e8242-8850-4664-b3ad-1099ac83c8c1@linux.dev>
In-Reply-To: <7c8e8242-8850-4664-b3ad-1099ac83c8c1@linux.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB8424:EE_|DM6PR11MB4691:EE_
x-ms-office365-filtering-correlation-id: ed98f9d5-8491-40b0-52b4-08ded76c817d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|38070700021|22082099003|18002099003|4143699003|11063799006|56012099006;
x-microsoft-antispam-message-info: MkPDC7pERHzRZWvuBvSGdEZ/bcNATX1kwexy8AAXB9cckjHcQPIDQClzPGFcTkzmMSjKXCOKNyAVq/QwtcG//DJan2q2x1d7FH4/m4qOSCRtsctfgXLLOerHQ2khV0IVVWhcopCQPb6bwGY6dsFrmFfj4BFbGNZUQWfuny7OVcObKslnb3ceadf1UWCMNKg2D9sHZrayuYF6s7qF5jKiVvPxOuoIVjUrRLwQEInTD1jnflNvAxAqpidBLPwtvtOi50Y35Xn85UeWO2627o4cr/uy8a+BBky9JY8Z52CSr5jzDL+eHlbMsKkF1IqmPCPgxk4vx+Tar5OlOkzsJLuggrxa1UuqI1jJczK0ojSSK+euXKVx2+Z9UkrET2V5aTSjZIsX8hw+F7fTu88hYcQFNsGLz6GuRx9X8gryv4QbzRcqG8zDx3e/PIv+AwjAS1ZNPR/x7Pd57qIV2jZnkEPgHvHUTPlNOS/B/RZI5blNRuldoj0MeQNRQBBQHxZy+9IcHigNLG1XAIsd16DceakjKkjRZqyphVK2oGQQbGCLylHpPpmAnWDxtApr5JxR/t0Bos7yaLFAm0p3pLVQdomVPwWGXkS9MidPzgz2w0CS2L+QZSG1nQ8t9yC7je+4QgKQtLCIqQ44Rvj5t/Kb2up6blIDL4nyCYUtK9t6MXcnt8oWB91TUSVBmcFr9FvRmQ+/5rV96B5F+0H71ysfmNhXEAcgtiRHHwMO8Me0AMoBy3s=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8424.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(38070700021)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?KzNzUERSaVdtWDcvajN0L2d5bHZCZG55UlN6VHlPMzVWaXVjdmh3Z1I5bDZy?=
 =?utf-8?B?em9ZN1lIZlR5S3Y1VGVyVEJTaVlrNGV0cFllNnlVVDJLYWlsM0I0amZyd3I3?=
 =?utf-8?B?WDBCZmNiazRYUXAwMXB0OVlUdWRjYW5lNnNXWmlrSXdoN2g5Y1grT2UwUzYx?=
 =?utf-8?B?amZpUEgvVnBvRDQxcGw1TkxQTkhjNng1ZUdvY3A0aHJsNks1UVpCV0RIREdK?=
 =?utf-8?B?TmtpbzJ6QzBuT3JEcUlMUmZYRWpVcHNlTHl5bVFmQ2xmb0hSU2JHcUlvRVhD?=
 =?utf-8?B?Si9XUnRiaHY3VlZBbVVIQ2tDS21yVW02dGRJUmNqcVk4TWRrMGVxZTViOFcw?=
 =?utf-8?B?dzFJbHp4ekJSN0ZwVzhSOEhqTXduQ3hlU0JqQkJERlJuRms3emxhU25sak9o?=
 =?utf-8?B?ZUx2MW8xZ3JGTFMwbzgzaFlMSDR4YjVHN0VvdkJlTElPUjdkb3d6dE9vYXI2?=
 =?utf-8?B?WEJBdXJrWEJiTk8xSVdlN0ozaEtZR2dLdmhSTEY5ZEszNG9TeHdHQUNpQVAx?=
 =?utf-8?B?YWQ3eEtGYzZwaWtnblVrcHg3YkZiVVpTdUF6RWFkQ3MvTXlmdTlTNDZIa3JP?=
 =?utf-8?B?a0UxSmtPVWFESVBNalpsVmlpVUNtNVdFT3hXbUJuRXhZYlZxUzBtRmt1WVVK?=
 =?utf-8?B?ZE9KSERPN0t1SE1YSHhzMlN4Y2l1VVE5QS9aQ3hTWjgwRStnRlVZTy9vRGQw?=
 =?utf-8?B?RVhvRUNCeDNHVlFnL0VFb21rbURNejVndThsUXJvZWpEckpNZ0o1d2Q0L3lz?=
 =?utf-8?B?ODJ2NmxyNVV1dHNTdUxrL2RMTFo5SExJbDVuME1HRzFON0N5MTVhSFErRVdZ?=
 =?utf-8?B?WVlHYUhhUmxNUGNYbktuOEdJY2l1QVhDMWlYSWZJU2dSNmthT3JyUUIxSnJY?=
 =?utf-8?B?dU0zK1JoK0ZlczNXNVU4T0tYaHNDN1N6WWJURGVNT1ZHZ3FuN2pvRUdrTFZY?=
 =?utf-8?B?TzY2WDE0dklFeU9oRjFaOU1FZm1TRFJEV1d6czhFMmNQOENyWFYwcnlnWTYy?=
 =?utf-8?B?L0M1LzBSSlAxY2RneDdtV2FzS3QyRFJ3OElVU21rMzRKaU93WVA0OVgzZ0RP?=
 =?utf-8?B?cFVSN0hHNTFMREw1WVNrMjE3WmltMnNzY0hzR05XVFptdGJpK3B2b3BtSFZu?=
 =?utf-8?B?bGRsSzdBayt5L0xuTVUyM3NKZWZFSnFZNlBINkxTYnRUcHdBblZyY0dsTVdy?=
 =?utf-8?B?NE9HYVQrb1AxWnN2bUdXQTJjcFZHL2JuRndnMWpnV3RENEtNTzduK1hIb0Nl?=
 =?utf-8?B?SDV1OTVlNURGTlh0ZGZobUE4NUdmSHNSMGdVRXJpaWdlNkxrQnFKNTI0d1A1?=
 =?utf-8?B?dW0yR2hBeUdFeWRPNXJ3WVp6UlJZdDRYSEUrbS9UWVltQWo0SUREbVBNSW16?=
 =?utf-8?B?NzVzU3lhT1dPZmNMV0FOZFNDdkU5Mzc2d245L2UycFRySFI4UUx2VTBHZ1kz?=
 =?utf-8?B?WFNLcHNkT1hobXVtNk0wUUxUdDYrK05zeXlCa3hETk9oOGN2dVZEbWtTUUtP?=
 =?utf-8?B?UDJCWXYzOUpnVGpUaHJ6bFdBNEJpV0pOaG9DL2xLOVNkYldTdUNtSWduejE3?=
 =?utf-8?B?akgydFZpNVZUYWI5TWNwcVZQNjlpcDdiTzVaT0tpTVlWL0lWR2xkZG0zUTR0?=
 =?utf-8?B?bkhBQm5QMFpnbFFTcWxvQlIwUHB0Q0xTemxIbk5Ra3F3SXVCNHVDY2Q1c053?=
 =?utf-8?B?aWJDUVVpVVRrRWhtU2NQdENGaWVqbjROZG1QbGI2cUk3aHZ1by9xcHZGamZK?=
 =?utf-8?B?TE1RRjhHWnB4aHExOHUwQUxmT1F4RHowRTEyS0FXanlMa2w5NUlWU2tMTk5w?=
 =?utf-8?B?T091T0pZdlp4S2FmcjBncmdIcHBmbm5IRCsyYUtJblI2N2V5WmVoVGY2S0xZ?=
 =?utf-8?B?Nm1qU1VPcTBlOVlSbzRMaEFDVDduOHg3V2dwSzV1QlZGT1lwY0pHYXVMTHRM?=
 =?utf-8?B?YlhXZzV4T2ZrVzFOd25jeEo3VGo2MmVQM09uME9BcUd3aGJFK2NvUUdEa2Rn?=
 =?utf-8?B?RzMySUs2TDhqakF0NnROVENmdXZDVm1BZXhnSVBkNU1YRjliL21VZ21mdE9S?=
 =?utf-8?B?aEZNRjlrTG1DeVZxbFdpRkoxZXRLdmtBb1AxODlpOGpvYXlxL1BFRUFhcWFW?=
 =?utf-8?B?cU9xSklralhXQXNmR0pxY0lMVVVkVnA1c0RBa0Z1dHdTcnFTckREUEROVWRI?=
 =?utf-8?B?SExkUHZsL0ZFOWtlT2xDWkE3OGJhRDN1UEVXK2dDMERLUE9VV3M4S2hkVDBF?=
 =?utf-8?B?UlpqUTcvR0hWVG1jVkluL21MZmtIcVNnMTIrbkpKNGJub1ZPalVHWGxVREJG?=
 =?utf-8?Q?WJND0WhVsjbd5NCQVN?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: k+0ebUtrybT0AhAuRI35ZUoJnQFMz3IYnQi+u8UJPmpqsBWNJ0Db39PGXstq778DQssEzjfoSVhike3WvdXPRRuKkPj6i8vgMM0KGG9kP0k17M2oV+snuMl1gWI9WByxKcYXrhV5kBexjWVYnL1NcYiHbfgZLUmmiuKz2c3A7/jDh48eotp3o8NUVMMqqh6BeYHSskHFY1IY+kp6wu1SOkqRh5nYR/iRldW7SAR4038idiXHPyfSIxXYTlb5TOmlBbU4ep5oSf0OcR/s2y30pW1+knm4gZ8Z9VH/CkLCEpUW19QMqoskNTjZskLmODRdqO1k3+tVoHTwPGP6kDucfw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed98f9d5-8491-40b0-52b4-08ded76c817d
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2026 12:30:16.1498
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N6o4hdQNv1pQnm41d+WAXHv7ZUJJLXMQ/DDZ8aHK/ujiqqk5TmdE2kepZNl/Mf1gE+ocTl78syqKYJt9ictfGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4691
X-OriginatorOrg: intel.com

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGllcnJlLUxvdWlzIEJv
c3NhcnQgPHBpZXJyZS1sb3Vpcy5ib3NzYXJ0QGxpbnV4LmRldj4NCj4gU2VudDogV2VkbmVzZGF5
LCBKdWx5IDEsIDIwMjYgODowMSBQTQ0KPiBUbzogUmljaGFyZCBGaXR6Z2VyYWxkIDxyZkBvcGVu
c291cmNlLmNpcnJ1cy5jb20+OyBMaWFvLCBCYXJkDQo+IDxiYXJkLmxpYW9AaW50ZWwuY29tPjsg
QmFyZCBMaWFvIDx5dW5nLWNodWFuLmxpYW9AbGludXguaW50ZWwuY29tPjsgbGludXgtDQo+IHNv
dW5kQHZnZXIua2VybmVsLm9yZzsgdmtvdWxAa2VybmVsLm9yZw0KPiBDYzogdmlub2Qua291bEBs
aW5hcm8ub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOw0KPiBwZXRlci51amZhbHVz
aUBsaW51eC5pbnRlbC5jb207IFJpY2hhcmQgRml0emdlcmFsZA0KPiA8UmljaGFyZC5GaXR6Z2Vy
YWxkQGNpcnJ1cy5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMi8yXSBzb3VuZHdpcmU6IElu
dGVsOiBzdG9wIHNkdyBjbG9jayBpbiBzeXN0ZW0gc3VzcGVuZA0KPiANCj4gT24gNy8xLzI2IDEz
OjU1LCBQaWVycmUtTG91aXMgQm9zc2FydCB3cm90ZToNCj4gPg0KPiA+PiBJZiB0aGUgTWFuYWdl
ciBkb2Vzbid0IHNlbmQgYSBjbG9jay1zdG9wLCB0aGUgcGVyaXBoZXJhbHMgZG9uJ3QgZ2V0IGEN
Cj4gPj4gbm90aWZpY2F0aW9uIHRoYXQgdGhleSBjYW4gZW50ZXIgYSBsb3dlci1wb3dlciBtb2Rl
LiBUaGUgY2xvY2sgc3VkZGVubHkNCj4gPj4gZGlzYXBwZWFycyB3aXRob3V0IHdhcm5pbmcgYW5k
IHdpdGhvdXQgdGhlIHBlcmlwaGVyYWxzIGJlaW5nIG5vdGlmaWVkDQo+ID4+IHdoeSwgc28gdGhl
eSBkb24ndCBoYXZlIGFueSBpbmZvcm1hdGlvbiB0byBrbm93IHdoYXQgaXMgaGFwcGVuaW5nLg0K
PiA+DQo+ID4gdGhhdCdzIG5vdCBxdWl0ZSByaWdodCwgc2VlIGJlbG93Lg0KPiA+DQo+ID4+IFRo
ZSBNYW5hZ2VyIHNob3VsZCBzZW5kIGEgY2xvY2stc3RvcCBub3RpZmljYXRpb24gYmVmb3JlIHN0
b3BwaW5nIHRoZQ0KPiA+PiBjbG9jay4NCj4gPg0KPiA+IFRoYXQncyBleGFjdGx5IHRoZSBleGlz
dGluZyBsb2dpYyBpbiBkcml2ZXJzL3NvdW5kd2lyZS9idXMuYywgdGhlIGNvcmUgZG9lcw0KPiBu
b3RpZnkgYWxsIHBlcmlwaGVyYWwgZHJpdmVycyBvZiBhIGNsb2NrIHN0b3AgdHJhbnNpdGlvbi4N
Cj4gPg0KPiA+IHNkd19zbGF2ZV9jbGtfc3RvcF9jYWxsYmFjayhzbGF2ZSwgU0RXX0NMS19QUkVf
UFJFUEFSRSk7DQo+ID4gc2R3X3NsYXZlX2Nsa19zdG9wX2NhbGxiYWNrKHNsYXZlLCBTRFdfQ0xL
X1BPU1RfUFJFUEFSRSk7DQo+ID4NCj4gPiBUaGVzZSBwcmUtIGFuZCBwb3N0IGNhbGxiYWNrIHRo
YXQgY2FuIGJlIHVzZWQgYnkgdGhlIHBlcmlwaGVyYWwgZm9yIGltcC1kZWYNCj4gYWN0aW9ucy4N
Cj4gPg0KPiA+IEkgYW0gbm90IHN1cmUgaWYgdGhlIFBPU1RfUFJFUEFSRSBtYWtlcyBzZW5zZSwg
c2luY2UgdGhlIGNsb2NrIGlzIGFscmVhZHkNCj4gc3RvcHBlZCB0aGUgcGVyaXBoZXJhbCBjYW5u
b3QgYmUgcHJvZ3JhbW1lZC4gSUlSQyBpdCB3YXMgYWRkZWQgZm9yDQo+IHN5bW1ldHJ5Lg0KPiA+
IFRoZSBQUkVfUFJFUEFSRSBpcyBtb3N0IGxpa2VseSB3aGF0IHlvdSBhcmUgbG9va2luZyBmb3Ig
aW4gdGhlDQo+IGltcGxlbWVudGF0aW9uIG9mIHRoZSBkcnYtPm9wcy0+Y2xrX3N0b3AgY2FsbGJh
Y2suDQo+ID4NCj4gPiBIb3BlIHRoaXMgaGVscHMhDQo+IA0KPiBPaCBhbmQgaW4gdGhlIGNhc2Ug
b2YgYSBzeXN0ZW0gc3VzcGVuZCwgdGhlbiB5b3UgYWxzbyBnZXQgdGhlIG5vdGlmaWNhdGlvbiBp
bg0KPiB0aGUgZHJpdmVyIHN1c3BlbmQgY2FsbGJhY2suIEluIHRoYXQgY2FzZSBubyBuZWVkIHRv
IGJlIG5vdGlmaWVkIG9mIHRoZSBpbXBsaWNpdA0KPiBidXMgdGVhcmRvd24sIHlvdSBjYW4gcHJv
Z3JhbSB0aGUgcGVyaXBoZXJhbCB0byBlbnRlciBsb3dlciBwb3dlci4gWW91IGRvDQo+IG5vdCBu
ZWVkIGFueSBjbG9jayBzdG9wIG1lY2hhbmlzbXMgdG8gZGVhbCB3aXRoIHN5c3RlbSBzdXNwZW5k
DQo+IG9wdGltaXphdGlvbnMuDQoNClRoZSBwb2ludCBpcyB0aGF0IHRoZSBTRFcgYnVzIGNsb2Nr
IHdpbGwgc3RvcCBhbnl3YXkgaW4gc3lzdGVtIHN1c3BlbmQNCmV2ZW4gdGhvdWdoIHNkd19jZG5z
X2Nsb2NrX3N0b3AoKSBpcyBub3QgY2FsbGVkLg0KQW5kIHRoZSBwZXJpcGhlcmFsIHdpbGwgbm90
IGdldCB0aGUgY2xvY2stc3RvcCBub3RpZmljYXRpb24gaW4gdGhpcyBjYXNlLg0KTm90IHN1cmUg
d2lsbCBjb2RlYyBkcml2ZXIncyBzeXN0ZW0gc3VzcGVuZCBjYWxsYmFjayBsYXVuY2ggYmVmb3Jl
IHRoZQ0Kc2R3IGJ1cyBjbG9jayBnZXR0aW5nIHN0b3BwZWQuIEFuZCBob3cgdG8gZW5zdXJlIGl0
Pw0K
