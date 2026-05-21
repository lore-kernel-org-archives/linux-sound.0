Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393E72BE7AC;
	Thu, 21 May 2026 01:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779325782; cv=fail; b=ZFLyjOWDoEknCkwsejt4hhBpzdG1x9lH3cGvlzZqMeyVstp5i4U3FZpeyf/FdijsaFN51rQPKEcIKyydpjEF3JJFDhErMORJw/bibXNO4FCaLu4amr1wfux8pDJyr+IgPIowRUrh7HIoC1WkDMRaXZ1chM3S8lxXCwYWcboSz4Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779325782; c=relaxed/simple;
	bh=XKcHbzLsFoSiwPJDuqj8ahNrSnbslivvwYuKRFR8Yr0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=A8WXscycSO5WN6cnz3p5dN+pHX4xKqXpjT1mTkwPMRCqO/ZUF6LI5R6LGUITnpjbn9SqoItphdZj4LpTDvLyPJYgjsgPim5aZkN8ywTfnBcchsjl6ALkBwZV2XMZ4JGYlB9g8Cf+C6tc3gLDGR9Ce8PyeDwJPeuPdz8IpVxfaXQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KjRwpIYP; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KjRwpIYP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779325780; x=1810861780;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=XKcHbzLsFoSiwPJDuqj8ahNrSnbslivvwYuKRFR8Yr0=;
  b=KjRwpIYPmi3rmhdHBpCNKR0uFhJYd9uE3e4vTrnFT/X708W9yivRSs4y
   wHq2DisaCA5IJf8EqOWr6T+08xqlQvUqrZW9kTue+Iqzv0hCbYPQNWaVC
   ag4sATY09jqzpKOa85FLUPNKfDdeWwZvp9hAwUTsv9lpaisrX0I4RzYTf
   1tbLv92r/ZgEld4Ewmj/y7E4CONCDwyyihflBeEHOi/WXbsPDZBB7hp7R
   rnkU1DAkxXnF2Uo6Qg+sobESl1m4nPTkpvJDFMLmyw+xf+z3H1+3ViHiO
   NMAzzPpP8tFagwxV3ril0jN6/JMIumShyImJxpZmyqpVYeIW0HxUu3n9i
   Q==;
X-CSE-ConnectionGUID: I1vNncEiQDaiASgOQPG+tA==
X-CSE-MsgGUID: iCzwoZpZSW+/FVfnLZiPHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="90816231"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="90816231"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 18:09:37 -0700
X-CSE-ConnectionGUID: oqqMoYZwQ/qlqmmpfaFL3w==
X-CSE-MsgGUID: 2lzPKCxhR2yWv1m4zzAM3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="236122721"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 18:09:33 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 20 May 2026 18:09:33 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 20 May 2026 18:09:33 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.28) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 20 May 2026 18:09:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Szgp9B42r8iP0l2jbcENjubbGmxlVKLMWE/nQONAaL/BR1uHS3JNlKhuhnOV2fnbBQrXIAlCkTyoE6DFJO3BxWnHLYQsYe98pjgdRX0J3fV+KsgomFV0Q7Rnztt3tb9YmQiWolAjh0Stx5INFdFRATSWtXMUn8Ih+IBAHVwkY35lj+vUaAsmb7nrAUr4Ouz+IfNdgl9fEU4Zq9lpoS98fCWjFmJLWqqdLqI7S1Wl+kUiRDw/plhMoYWDp45RQAM2nHokNWM99cQFSVB/sg+rnmtJZvLbhXcKXje951xuVI6Q+b75dTsC4uXpM0Uxq7VHfvFcM8cWfHzx/ed5tQ0YQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XKcHbzLsFoSiwPJDuqj8ahNrSnbslivvwYuKRFR8Yr0=;
 b=Oy29YS6mj0DTxGSJFo+iRy4e+hhSZC1dDh69AEAi7UdBKVcKQm9yOYIOgqemvwMW5+NTy9mAz37r1dEtgOk+vWgoF6VBWbxX/JePet/lMKCJs7JB2x/Kz3IgDqV83qrhenOOjpHPoIsWr4XLIeN/hnhM8LJJdeH4oqxg22If3kKUAjzCbDTP3saNWMNocNAfqk1yyyQLJC5PQekf+j+iU/4/xUD7vibQpH4Fmd8YByvo2yVfhlLrqLA4P2RPtK6CLYBGqIQfzGWxbb6TOaaVKH80Evb6BPCOV+kF2V2R3LMojCUoSDNmLlUCr46GmC7kKinDI60+vzLh9DKz/uFJBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com (2603:10b6:a03:53e::10)
 by DM3PPF6C1A2BDF1.namprd11.prod.outlook.com (2603:10b6:f:fc00::f2b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 21 May
 2026 01:09:30 +0000
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::3df:33f9:59a1:da76]) by SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::3df:33f9:59a1:da76%5]) with mapi id 15.20.9913.012; Thu, 21 May 2026
 01:09:30 +0000
From: "Liao, Bard" <bard.liao@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Charles Keepax
	<ckeepax@opensource.cirrus.com>, "broonie@kernel.org" <broonie@kernel.org>,
	"vkoul@kernel.org" <vkoul@kernel.org>
CC: "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>,
	"peter.ujfalusi@linux.intel.com" <peter.ujfalusi@linux.intel.com>,
	"oder_chiou@realtek.com" <oder_chiou@realtek.com>, "jack.yu@realtek.com"
	<jack.yu@realtek.com>, "shumingf@realtek.com" <shumingf@realtek.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"patches@opensource.cirrus.com" <patches@opensource.cirrus.com>
Subject: RE: [PATCH 3/3] soundwire: dmi-quirks: Disable ghost Realtek devices
Thread-Topic: [PATCH 3/3] soundwire: dmi-quirks: Disable ghost Realtek devices
Thread-Index: AQHc6Hi2lKhoEvUfK06x/sV26meAabYXJ/iAgACARPA=
Date: Thu, 21 May 2026 01:09:30 +0000
Message-ID: <SJ2PR11MB8424253CCCADAA3E70A5E55AFF0E2@SJ2PR11MB8424.namprd11.prod.outlook.com>
References: <20260520163631.3300102-1-ckeepax@opensource.cirrus.com>
 <20260520163631.3300102-4-ckeepax@opensource.cirrus.com>
 <be5dd478-d520-4e7e-a0e2-946b128ec4f2@linux.dev>
In-Reply-To: <be5dd478-d520-4e7e-a0e2-946b128ec4f2@linux.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB8424:EE_|DM3PPF6C1A2BDF1:EE_
x-ms-office365-filtering-correlation-id: 802cc0a3-022b-4f93-5191-08deb6d59cc7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|11063799006|6133799003|38070700021|22082099003|56012099003|18002099003|4143699003;
x-microsoft-antispam-message-info: YhOZrK8ev1INCOxfbbIyHSomlgjTDvpkLHCgyyC7v3QIWDxHn/pbgcg7iNxsYU0pxm7Sghlaf6wZeJyGEKXJwGUasHVwedGmYAP3LhXOMzXFMS7JZm93wVK4iz9/0z2eXXo3j2FZT6G9BospRLRoZozmz186bU4dxmsQGOOwyC4rizm43wYMvqz4/11RavpVy2RMvVRu1c+K8zl4+1dbnjVn9YR5Lci4QUNSmNHXX1sqJ/1EJZbZgzZWwCYs7UZ/7xD7cEavjmmxItXGOMGYw/GgmUulJszMfRl6NYBXujGEr514U+hML1ASvlwzr6wmfPtP3gi//ToCXd5MUhT5gJ7kkgiFa4GHHeyPVuobcXM21TKzt7vArldESytraJz778nOAVdx3PoPJ76do2HNf6b5LAu/NyKcNpwxsVSFV7KlRxNn84p8aCdPqD0k6pH9gJ1FiIqBSOyaAmrCVR9wuEHFVeDDpMCw++WDxKSSmP8tt6qu8/JzzpkT+cGRNYUpUPe/F8Ah1LtDvM3NOBWxtmPdZArOhYYByHC3dC4yzLPLkvivLwLLAvopBPLLm5HIcIprd8Kr3MDYg4vTXSgWOtJoR/yTIVsdhZBDnI+HMIL7UmtzQ8ow5g9J1FzXhB7PNDzsfVHMwlRY7xEbpjwHIGxgAQG7miN4KI4ElbBbhcW3VdHFQMU2cSOdGykjZ5TSr7CFaVlm8PC8p7qQDqv9C5EzRnqoIKoDB6OwKMGlC5m9qplBoa2dOidrICzVnUUP
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8424.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(11063799006)(6133799003)(38070700021)(22082099003)(56012099003)(18002099003)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bjArak1YdjlZb0tNRW4zVlZWZUxFVEFGRWtCT2czUkxuUGYzOUtNYmdGYjdK?=
 =?utf-8?B?MXVvc3hJZVYrWCtyNE9iVkEvZ2hyQjBla1pKajExdHpuUmJTSGRIeUZuQlFF?=
 =?utf-8?B?S0s4ZHhoRUJNRGZQUk9KQzhnSXVFU3ZwaGJibzE5NEIxUTRrOG9xYTVnMXdK?=
 =?utf-8?B?d1BlSEVFYkVlK3dSN2NQaG1oNElYM3krdkJXNmdSYXlaVk8yRTVleXVEY2pJ?=
 =?utf-8?B?WXN3RXlEeEtxUlZINlRVT04wbEg2WjA4WTFCKzVmbnF4eitTY1hSK2l5UXU1?=
 =?utf-8?B?Q0JwVW9WNnk5WEE3Q0RsZkU5OXZGb2NtZ0oycGFsenNvMTdLa0pzd2oxUnA5?=
 =?utf-8?B?M0g0TmJaUTJKWUk3NHJ2T0pORG5uR3RNbUZmOW1ONnJOTlhYcTMzR1ZCUEZB?=
 =?utf-8?B?ckxhUjgrbGkxZG1lZ1VOckNCQ2VzOERqUE1uTW9DbVlDRDVuSGpwRDBMZ0RE?=
 =?utf-8?B?RXZZeFhqUFhabHIrY1RRNWxYOVVNZk1LZXBTb3BLcTJRNFE2Z3FWQkVVamx4?=
 =?utf-8?B?OWh3VW9zSDB5TVJjekRRckZVZUs5THRmOWswbklHRWMwemZUNmtWT1JUOFZt?=
 =?utf-8?B?TTlTMEhiRHAranhhc2xrTkVhWHJKWXFjMEZ0eW9DOHpHQ3NSRHpjS3QrMkIy?=
 =?utf-8?B?dmxZWTJuVlE2MGRUdXUrREJoRWNMVWozekVveWs4MEpJcE5KbTdnSThsODA4?=
 =?utf-8?B?NDkzYW52em9jZ2VYL1VqK1lhbytWekJJVVF4OXpNYjlXM09VTEFnN21kdmxx?=
 =?utf-8?B?eGs0RDJLaHJwV0FCYVh3bUNxZmJ3blJ4Ulpza3VSR3pYcU9HL1dGUXRsUTdK?=
 =?utf-8?B?am9qdnZRbjd1T1B0SXdzUzVEVm1PcE4zSWd6WHZFVW5veFY0K2IrTEF1bDAz?=
 =?utf-8?B?b05nSXFwc2RzUDhHTmNYV0NHN29KeWUvdUczemxocjUrdzRiVGNNTEUxWnlv?=
 =?utf-8?B?TUIvaGliU2RLaFhORStJMGxXOWxtNG1McU4zb1luUDFTb0tXemNCNkZaLzJI?=
 =?utf-8?B?Z0ZOaXlRQnEzclh5SWZrbXZVekY4T0lpQ25WT1JPOWdYK2p6UUp0Nld1NXV4?=
 =?utf-8?B?OWcybkhvUGh3U2M0ZlJNU0kwaDNzTERSeVY0WWJZSmsra3RkVU5wRG1rZE9t?=
 =?utf-8?B?MFZHQmJ2MGlJZFIvNFNLbllkd1FQeWJvY1V5M3Z5UnVhVXNxOTkrcDdXTHVu?=
 =?utf-8?B?aU16Nk5nVFdObHNVaGpNSk1tMTA2MmNiUVVTb3hUTnI3Qi9Yd014NW42Tlo4?=
 =?utf-8?B?Y3ZrMGx2MzZMM1V0Zmw3WDBtSmNXNXNXZTR1OCtiSEsxUUpPSHQxWm5zU0Zo?=
 =?utf-8?B?cGgzcXlEbXUyNkNJVHU5RDZqY0xGMzB5MGtVNXhZNXNHTXFyVVdvRmU1bFY1?=
 =?utf-8?B?UjJYcHJkTXhFSW5EMCtaYzd2U1JIT3lRTGZMRVBkTnFTa3kzN1haY25Vc3lB?=
 =?utf-8?B?YTVNaEg0akZnYjk3TEpReXFGaHFuTERxK2ViV1JaKzdrL1Z6LzRYcmg1UXVL?=
 =?utf-8?B?M1ZSSnNHVzJBZE8rMGtXZ1JKbjlDdkloZ2QyMnRyYUVibWRITzlKOS8zQ1Uy?=
 =?utf-8?B?aUx6OHRlbVdhTE1kNFNFMGpDeU5UNE5rZEwvZVJvTDdIc01mcy9OVzhTOEUx?=
 =?utf-8?B?UUQ1K0NWZE5qY2tmdjVkeUhCVVR6SkF6cUlrSmxvNzRYOXlTWGVPN0xHdmpV?=
 =?utf-8?B?UlJoSVBBaDRoSy8yZ2I2QlZJS3VNbURFbnVvbCtVZ1lHVUkvako0RUkrckt2?=
 =?utf-8?B?MXRGbUdGU1QxazBPMmtoMkdGYkhrOXVOa1loajBJYzc4N1Z0ZUp1TVVwQU42?=
 =?utf-8?B?R1FqcHowRi9KQk1pYzcyU1F1dE41WFp1UWtXaVF0Z2hkWUM2NS9yY2RGd3NQ?=
 =?utf-8?B?ejcwVGVBeUlRNlNhSFZlcUJ6SWxKWVM0ZGFBaW5pZFdtSGs3QVdZUVhUYjZ3?=
 =?utf-8?B?UTJ2WHVBMTRLa2gxK1h3YkRJTG1rSmcrczBLTE43T3VkQ3dla1hUUG00bk9H?=
 =?utf-8?B?N0c1S0pPam1rc25lNW9sSTMxYS94eHgwTnkzdklnTHcwT0VGcEZqV0NiV0pC?=
 =?utf-8?B?UllUbWZMRE5PampPT2dSR1dYOHc1TzB1ZGFRNVZrRXhzMkh3OFI4MytWOEc1?=
 =?utf-8?B?d0pzT3VTUk5ZU0tvL3hmOFBvN28xUWdOMitveHQwcUo2a1Z3N2Urc0xUU2N2?=
 =?utf-8?B?ZGVKVHkwNjg5SzNtS3NqQWNFeVA4WEw4NXI0bzU5RU9GRURFOUZhdlFGMDM5?=
 =?utf-8?B?Zy9NNnNsWUtKNFA3Q0JEU2JpNElXUTdJOEQ2SFJnYkcvYkY2cktVb1lEdzNN?=
 =?utf-8?B?Z2ZpQkNsQUJ3YitzcGdPNVZOajJtUldxcnljWVpYcDJ5SWRSa3Z4QT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: nX1rAX80vX+jiK6VwGhhQIpSZsTHDi9mS4ZAmj9j9Jle/+BjlKITiNMb6NFaKJt1a4zczmv5HfYiDUxvzrAoJ/URLB57Dg1kR/WNdD9+82IvXHtjx9GS24RQRLHl9G2pVDwq1+QYpFNr3febPXc/JtkbBH6tBUSEKDXnGwmw90SLUnwmkG1TV8ZO+7N9jVddXS+g7w+CSi1Q2eGLQvZXl8cIaF2bY2H2vkd9UXmI7dWPVHH5jUdFqwWbsjgPHY8g5vHnBfjm3kzoMegRTUFANuIsBEegltcUjg+2SkvjYpVl4IMnQ/Cb/27m3GYJ+PkKR9NFPttmjcVSvWaHqytoHg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 802cc0a3-022b-4f93-5191-08deb6d59cc7
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2026 01:09:30.7397
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xsesSB3bWmDyYjLmxzD02/WMH0dsV8idTCWugdLzuT0t+sMWWP5M5YtQEsa8mWWnF+6FL/XfkjXmNuctKyEz0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF6C1A2BDF1
X-OriginatorOrg: intel.com

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGllcnJlLUxvdWlzIEJv
c3NhcnQgPHBpZXJyZS1sb3Vpcy5ib3NzYXJ0QGxpbnV4LmRldj4NCj4gU2VudDogVGh1cnNkYXks
IE1heSAyMSwgMjAyNiAxOjE3IEFNDQo+IFRvOiBDaGFybGVzIEtlZXBheCA8Y2tlZXBheEBvcGVu
c291cmNlLmNpcnJ1cy5jb20+OyBicm9vbmllQGtlcm5lbC5vcmc7DQo+IHZrb3VsQGtlcm5lbC5v
cmcNCj4gQ2M6IGxnaXJkd29vZEBnbWFpbC5jb207IHl1bmctY2h1YW4ubGlhb0BsaW51eC5pbnRl
bC5jb207DQo+IHBldGVyLnVqZmFsdXNpQGxpbnV4LmludGVsLmNvbTsgb2Rlcl9jaGlvdUByZWFs
dGVrLmNvbTsNCj4gamFjay55dUByZWFsdGVrLmNvbTsgc2h1bWluZ2ZAcmVhbHRlay5jb207IGxp
bnV4LXNvdW5kQHZnZXIua2VybmVsLm9yZzsNCj4gbGludXgta2VybmVsQHZnZXIua2VybmVsLm9y
ZzsgcGF0Y2hlc0BvcGVuc291cmNlLmNpcnJ1cy5jb20NCj4gU3ViamVjdDogUmU6IFtQQVRDSCAz
LzNdIHNvdW5kd2lyZTogZG1pLXF1aXJrczogRGlzYWJsZSBnaG9zdCBSZWFsdGVrIGRldmljZXMN
Cj4gDQo+IE9uIDUvMjAvMjYgMTg6MzYsIENoYXJsZXMgS2VlcGF4IHdyb3RlOg0KPiA+IE1hbnkg
c3lzdGVtcyBzaGlwIHdpdGggYSBSZWFsdGVrIGF1ZGlvIGNvZGVjIGluIHRoZSBBQ1BJIHRoYXQg
ZG9lc24ndA0KPiA+IHBoeXNpY2FsbHkgZXhpc3QgaW4gdGhlIHN5c3RlbS4gVGhpcyBjb25mdXNl
cyB0aGUgbmV3ZXIgZnVuY3Rpb24NCj4gPiB0b3BvbG9neSBzeXN0ZW0gdGhhdCBjcmVhdGVzIHRo
ZSBzb3VuZGNhcmQsIGFzIGl0IGJ1aWxkcyB0aGUgY2FyZCBiYXNlZA0KPiA+IG9uIHRoZSBBQ1BJ
IGluZm9ybWF0aW9uLg0KPiA+DQo+ID4gV2hpbHN0IHdlIGFyZSB3b3JraW5nIHdpdGggdGhlIGxh
cHRvcCB2ZW5kb3JzIHRvIHRyeSBhbmQgc3RvcCB0aGlzDQo+ID4gaGFwcGVuaW5nIHRoZXJlIGFy
ZSBxdWl0ZSBhIGZldyBzeXN0ZW1zIHdoZXJlIHRoaXMgaGFzIHNoaXBwZWQuIEFkZCBhDQo+ID4g
cXVpcmsgdG8gZGlzYWJsZSB0aGlzICJnaG9zdCIgZGV2aWNlLg0KPiA+DQo+ID4gQ3VycmVudGx5
IHRoaXMgcGF0Y2ggc2hvdWxkIGNvdmVyOg0KPiA+ICAtIEFzdXMgVVg1NDA2QUENCj4gPiAgLSBM
ZW5vdm8gWW9nYSBQcm8gOWkgKDgzU0YpDQo+ID4gIC0gTGVub3ZvIFlvZ2EgU2xpbSA3IFVsdHJh
ICg4M1FLKQ0KPiANCj4gaWYgdGhpcyBicm9rZW4gQUNQSSBzdHVmZiB3b3JrcyBmb3IgV2luZG93
cyB0aGVuIGl0J2xsIGJlIGFuIHVwaGlsbCBiYXR0bGUuLi4NCg0KV2UgYWxyZWFkeSBpbmZvcm1l
ZCB0aGUgT0VNcy4gSG9wZSB0aGV5IGNhbiBmaXggaW4gdGhlIG5leHQgZ2VuZXJhdGlvbg0KcHJv
ZHVjdHMuDQoNCj4gDQo+IENvdWxkIHdlIGZpbHRlciBpbnN0ZWFkIHRob3NlICdnaG9zdCcgZGV2
aWNlcyBpZiB0aGV5IGZhaWwgdG8gYXBwZWFyIGluIHRoZSBuZXcNCj4gQUNQSSB0YWJsZSB0aGF0
IGRlc2NyaWJlcyBhbGwgdGhlIGVuZHBvaW50cyBhbmQgY2FyZCB0b3BvbG9neT8NCg0KU29ycnkg
UGllcnJlLCBJIGFtIG5vdCBzdXJlIGlmIEkgZ2V0IHlvdXIgcXVlc3Rpb24gY29ycmVjdGx5Lg0K
VGhlICdnaG9zdCcgZGV2aWNlIGhhcyBhIGNvbXBsZXRlIERpc0NvIHByb3BlcnRpZXMgZGVzY3Jp
cHRpb24gaW4gdGhlDQpBQ1BJIHRhYmxlLiBXZSBjb3VsZCBjaGVjayBpZiB0aGUgZGV2aWNlIGlz
IGV2ZXIgYXR0YWNoZWQuIEJ1dA0Kd2UgbmVlZCB0byBzZXQgYSB0aW1lb3V0IHRpbWUgYW5kIHdh
aXQgdW50aWwgdGltZW91dCB0byBjbGFpbQ0KdGhlIGRldmljZSBpcyBub3QgcHJlc2VudC4gSXQg
c2VlbXMgbm90IGJlIHJlYWxpc3RpYyB0byB3YWl0IHNheSAzDQpzZWNvbmRzIGluIGVhY2ggYm9v
dC4NCg0K
