Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CB617A586;
	Thu, 21 May 2026 02:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779330301; cv=fail; b=JPt1qun2GCVT3tDE+L0Xxbwdk5hq/eUstxE61nQ5n6rPuoFbmRfRU44jE+dXgiDQNCcDCR8CmBujWtyRNrP3jG5EqUgDDXkcA3ivS5IkRe0Pw62PEnlTCkh7uNa3bwxzWOKh8vAoYxjTdyWBc49zpGMUzbLw5Hd3Glzm+KbDyAM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779330301; c=relaxed/simple;
	bh=iwnhN1SkUcFGhjUeLjtru7jgAe1l2392Dnd9NqYBNgo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VLi2xBwlLkxX4Q3eZr8wlB1hlVEGbmM6cZVcTgiDMpUpmGq6Nc3z5yWJaGRThmjG7/3/vbq2MKQnWPAo/JKFuvQba5n8DziESdN8a4ahpiEB/STsg3npjLuYPQA35g/2dqNhCjXC+z8LsRKLz5uYIchMByKD+PzzmhCPvrJwkWI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kV0ukyP1; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kV0ukyP1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779330297; x=1810866297;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=iwnhN1SkUcFGhjUeLjtru7jgAe1l2392Dnd9NqYBNgo=;
  b=kV0ukyP1K9l9eLQyucizVPw4Nb+BYFNQchyH133mgkDHHYKRUu3ORct2
   ee6szyokUYlf0ZHp36ARqsZKhy+EqXGjkXZxfkHUlSG/eoYgKmY3dC5v0
   aRaYW7PliI24E0OIwVhU4kqQ9L0LOqAgG/Dr3DMv1vgKu9xoG29qGM3sM
   gJZzkVblZMf38DyFQw0USV2C4WhXG78qNMsPlxnGE0r6kNhorIgh/qbaD
   +aGafwRKOMC0PTp8Xhgl98WDxk28qdrTwSSJuZ0eq5HjxGj0O36RUY2zr
   vDiyMQeNh7KRHBdaXcLpM4+JDTuSmoSgvUXmj5Dbws5wvsVWyzKDBOJut
   Q==;
X-CSE-ConnectionGUID: X8pOHdwdQ6WMjADvPLK+0w==
X-CSE-MsgGUID: x3z+xZZdTgy7q2yu7ljaZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="97813337"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="97813337"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 19:24:55 -0700
X-CSE-ConnectionGUID: hDf2yqqyTvKDt/L2o25kHw==
X-CSE-MsgGUID: 84ShABPWSomLDUyL4iylmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="240428769"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 19:24:55 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 20 May 2026 19:24:53 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 20 May 2026 19:24:53 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.5) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 20 May 2026 19:24:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kkru5dU+txbb/F6dtfCd5fPVlaAjbq5aTuS7YVZQgDKHitdAGzAt9dz/z/6MTszD7+k5fGYKXDOhrPyCXAAUySibldP4VtWfr5FqdOpbXnJCAqtypqDCDXXNvFQVxAeODmZmn4aSWp5h7adEke+NZgCvvBjd2ShFJrNG02/jERACcQmuz9tt8BbfhUzdRt2LbDVN1NjqnQ5FB3adD6XBjXNa9UBPslJNRwfKVU6GR9K39kG9SHSENkWVrThNW9sZ+jD90VPUUSxK5NHWr8H3PmiFelYkQv4HqFFHypmyY/+9maPv6td+EGjru5I74STWVpgQ68vZ6Gon7FLLJg+a4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iwnhN1SkUcFGhjUeLjtru7jgAe1l2392Dnd9NqYBNgo=;
 b=RXdhl58GObDsWQcA1OJpVwHrfqm0PO26MRHUWkMy9Ecmr4+n+WFiczec91GnfTjV/4nrCB6LXAI3Qo+LONlIduo/xocHowqENijw032RV677VV7kAmxGQrrUA7c05gcXC+C9jv0LQJ8xe/Q6tOjzN/jetyqZrFnFv85p6kxW0xUCx7xvKFMkp2+SosxKytu47U1opH7GVA5fh41SSIOytQ1wsB3bga+V+LDPm0uUpOBGnTBqrz8gvwNB/Tg6cAPsZFOzVyiYe4qNy6QtbKyowViQsUXYXZgOUwG/vzyonjx7REvoPEiKhQIcXus7/8pYUDMpeJMA0fxngvKikXK9iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com (2603:10b6:a03:53e::10)
 by SJ2PR11MB7476.namprd11.prod.outlook.com (2603:10b6:a03:4c4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Thu, 21 May
 2026 02:24:44 +0000
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::3df:33f9:59a1:da76]) by SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::3df:33f9:59a1:da76%5]) with mapi id 15.20.9913.012; Thu, 21 May 2026
 02:24:42 +0000
From: "Liao, Bard" <bard.liao@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "vkoul@kernel.org" <vkoul@kernel.org>
CC: "vinod.koul@linaro.org" <vinod.koul@linaro.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"peter.ujfalusi@linux.intel.com" <peter.ujfalusi@linux.intel.com>
Subject: RE: [PATCH] soundwire: only handle alert events when the peripheral
 is attached
Thread-Topic: [PATCH] soundwire: only handle alert events when the peripheral
 is attached
Thread-Index: AQHc6ARxWDtUyGmcvU2FjXngVfAKsrYXKhgAgACUHiA=
Date: Thu, 21 May 2026 02:24:42 +0000
Message-ID: <SJ2PR11MB842444E0D5E021C967A6165BFF0E2@SJ2PR11MB8424.namprd11.prod.outlook.com>
References: <20260520025720.1999367-1-yung-chuan.liao@linux.intel.com>
 <1e808962-9a8d-4b0b-ad3c-867de1555d9f@linux.dev>
In-Reply-To: <1e808962-9a8d-4b0b-ad3c-867de1555d9f@linux.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB8424:EE_|SJ2PR11MB7476:EE_
x-ms-office365-filtering-correlation-id: e1708688-fd55-4126-9c64-08deb6e01e14
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|38070700021|11063799006|56012099003|22082099003|4143699003;
x-microsoft-antispam-message-info: cgkOH6/dk2UD/Yu6mjw9vhXTPv+75L/aF14/Lmv1z6wa0NdMZQYOqZ/5vk/u/VDLlrzuAuXjBmvZ6mGBer98LbL5fCnWgSxlCI6iaTuN1nj7893oQ0NDW4IcgvynFMUvmH3yHRblUpml8EMl6AbN8S7yaCRMEf/Zq2tenOcOUP1Mny7/mcaV3/jPDwELqFCtUE25WTNFkZ79QaJFA3UhQv11EW4B5VGe8F1uVsA5ck8lIyp886mNQEr2AwQmw2jKebBjIRMV6zM4gsM1YSjOGfuku+mGYM4/Q4+4+C3WUM+CgEwvbxdeivPTteTDtXZYt++9AlPgIOEpKn/Xsz0DgdAAmxZHohw9T0PCeczG0kT6ma94XJiULixhqo3jG/ovY21eJL3ysVY3s63aNn0vzCqjvK/bWGNuW3irI+FzVehwWfAkMpzbfuhDQm7mNVCCAmVdN0nx9ynJPQRVzEAcYm79ZTJFKtCYKDhjlolmChpBb+yoi6NCuaAWFknwZUsG/WvRhd51Uk76eFLCEY/y06YfxVZgWzecosZgN8+ziF7ZW19i+NuUqsrv8x/oh5KqaQtiRU1g4ZRmeH0H/VkAQuaRnT2ynr08ihM56BU5EOa94p8BK9dICumP1kPzwHeCHzPj967KCB+x2Pm0ZNapN/hZRk5yxB3LJtWMZ5wlxboQhS5PpewRZ6/frUKBJahrwJlMMbn3cSM6tM9m+Y84cs3sPeY3eMe+GOVBsyhs0CfoquYoJYwnuk9v7VvVttss
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8424.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(38070700021)(11063799006)(56012099003)(22082099003)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z0V3akZFTHFjaU42K1htRUpaUnZ4MTJHWU1PYk1PRDFIZkcya29nelJ5cDIz?=
 =?utf-8?B?SDJWbEhBTFk5Q0JBa3BqR1BnMXhNVU85dDhUcWhxMW0va3l1b2l3c0NFSFpB?=
 =?utf-8?B?cEtiVitocGlNeE1pTWJwNDJOUVhLblkvcTR0d01FRjBwMWhHK2N2M1pTekhD?=
 =?utf-8?B?V3JmUGYveitYaGhuK2hiSW9YeDdZMCsxYUhiRjJxaUliQ2xjUnJSdUVRcE94?=
 =?utf-8?B?MDJoRDR5bk1sNnJtbElOeXJpY1lBSlYxRllmeU9taGJnc1FYYnNEbmF5SEZh?=
 =?utf-8?B?c29HN1VPLy9Hd3l1TXBaWDc0NTlLeTlpdUNtcGVuWWJMME5WWmdQclNDWFZK?=
 =?utf-8?B?d1BxWlBxMG5DaVc3cnBMMlBVaFQ4OGNLNDlWUHBaVnhsbmEvZmdzVHBoUzZH?=
 =?utf-8?B?cTBLRGpVRXMyaUx0NlZPY1dvMHlhOThEUWY3ME9uaVFuUmRsRjBMZll2dWtU?=
 =?utf-8?B?SmxLY0V4ZkMzdlM4U3V0YmZEUXJGeisycFNSZXdyZG9PRWd6WkJwZktMU2dV?=
 =?utf-8?B?aldjdkdrM2FpTHRnd1NGVXJUeWN0eWprb2VzTkZYdHJCck1UVUpmTGxQK29p?=
 =?utf-8?B?TnlTeThOSWNPdEk1bmxFenYvUituL1o4Qi8rWTljYjNuTUU5QkpyZHBkV20x?=
 =?utf-8?B?OVdGWkNCVitBYm9TMGUxUTZpWWpZNWdTdlF4b2ZQdkdtT2JiMjRtSVh2VEg4?=
 =?utf-8?B?eG16MnpVcTk2LzlQMmlUdVE4NHlaMkJnTndQRS85M1hvcFdqcks3MW5oQ1hC?=
 =?utf-8?B?Q2ZWU0YvVmVmbDQ0aFNiMWtvZTVOVytzeXJVM0I5TzF4YjRtY2lxcEtweURO?=
 =?utf-8?B?RjZlN2hpV2V1aU1qUCtKOE1NMHVqQ1R0dmE0MDVodmpxcU9XVFJUcGZ0Mm4w?=
 =?utf-8?B?RjBOaXF0Y21sWGFvYzA5RWtNNkNYT3NQelNpWmRjMXhYMlZYWDhQdk5reWxY?=
 =?utf-8?B?VGozcllKRWMrVlpCMGR3ZElkZko4ZzhRa0ZJNCtrNWZVVTlmMkZKS3Z1SHNX?=
 =?utf-8?B?d2Q0enVIUGhHS2I5eUREck9HUzFvSmZLNlBUYkY2Tkh3THJFTmNkNFREUG9Z?=
 =?utf-8?B?S3B5YzVLOFE3MXAySXdOejFuNEhmdXBjQjBLS0l2ckhaV0crZ2sxaGFKKzVw?=
 =?utf-8?B?Z01TMEVDdG4vQUx6S1MrMmcwdWlJaFE4MnNiemNGY0t6a0M4ajBZZExseGVn?=
 =?utf-8?B?TFc3UWJybFU3d0h0WWdjMDBDSFcybTlDbVNxTGpYbERKOWFIV0I2ZUx1TlVv?=
 =?utf-8?B?eG9hUHN3Qk1aczdXUFhuSGg5a0t2bDI3K1NvR0VSL3dYZkpBY21IT0k5cmJl?=
 =?utf-8?B?QndxSlFWV0VpQy81MzFmcXcvU3RKeE1jajFVVkRndllKTTBxay9UVVJXQ3hu?=
 =?utf-8?B?QWRTQ05NbWQvRkxnVnUvL2Q1bFJNQk5CZnMzMGVmbWdEaWhSNWNGdm9KaE1x?=
 =?utf-8?B?NUYvZWl3bERtZEJIZE9HNExvT3pZL2I0VENKa0ZWZVpNc3h6V1ZYNTBDMldQ?=
 =?utf-8?B?RnRjdkpKcm9UYk9vTURVaWFFbWlMVXQvVEZEaXVwOWFyNDM5a2I2T3VVSmlR?=
 =?utf-8?B?R0UrMks4YVphWGlXWmZBemVuSXprano2N2JkajdYRUYwMDRNMFlDekpYbi9w?=
 =?utf-8?B?WmZJdDBzbXRVOE5icitnWksxZytWRFltYThqWnF1ZUhLZGcvclpSRHdMS1BQ?=
 =?utf-8?B?ZjlkV3BKTTFjcm1xYmFPRzJVWEZUY3lLWHlzZXREOWJhWDNBUmx3V2xnbmc2?=
 =?utf-8?B?R2ZhbDJLUzN1ZjZKczE2dE5Ydzh1cFN2eFNTZ3JHVWpKU2JvcUVPUzdtSVRQ?=
 =?utf-8?B?a0pxNkVQV2ZlQkdHQkxYdlcvSjBCcnBzaTE0eGpaTzBSaVluelkzaVBVdjl3?=
 =?utf-8?B?Rk5lcGVvanI5QzlyQTVXMFZTeXZCVWVJc3VwREpQcUM2Lzk2UDVhM3VGS25k?=
 =?utf-8?B?K1NWVHc5amdQYVJNZmM4ZUEzUm9EaWd6RFBDYnlGeG5kMzN1NHhaNDYydm1Q?=
 =?utf-8?B?OUVsSnBCbG5DVzhzcFhKcG1xZElVOHh1RlF3N296Y1NzcW1iYU94Z2NQMzUr?=
 =?utf-8?B?am4zMmp4cU8zU3pwRzVzWnZzMk8wMnlZbG1pOTEvK1Uwb1EvcE15RFgxclFn?=
 =?utf-8?B?eFZsb2tGSjg0K2ZEbzJhYlQ5Y3QwcnhrMEVudnJoZnJVSzkwWmQ1OFZjVVZw?=
 =?utf-8?B?SVY3L2doQjhWc0h6K1ViZktqUXExWitCMEhEMHIrelZWTlNKaE1NNldjSUtU?=
 =?utf-8?B?OExVcHpWd2w4NmJsdnk3TlpFazVYWG5jTmErSlJtaVpkbHd2MW5ZYURVT1ls?=
 =?utf-8?B?cHpLeFVuL2IvRnd3YTFNa1hIWE5PaUhwLzNHeU1iNzI0V0dTTnZEZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: lB1gPa06OMCO8ZCnBKHQ2CyBFv05xP+2z70LWo1clLzSXRupIBh7SK/+PXXoljwDvauRVMGlJ6ZPgMEIBr4Dmq1ZeU0NVe5ylLXQPnOUcIUBJI6TjY8bzfGjn38l1LMaHd9e837SlZ3ZrsVUH+vA6dDZZvohFr8bHsGKrdIKoHYSXZnbhIFvcN49GkUUgwi66641S/8TBCC62NFI2xbhrutbwjucz/eustXwARueAvUvFXaxizyQgUeTftMth869whRcs3da8IrF/d4R53KX39fXclPiZp82GYuX5ixo9RNxWHpwCz8SvLmY8Jsp3sxCbmyX0LfcUIZQE4HHpqw+tg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1708688-fd55-4126-9c64-08deb6e01e14
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2026 02:24:42.6699
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JWyfyjLQOQ8Mg5n1hVRtpEqWFqIvEdQ2Rj3DiHOwPl1Sy7BJSmdibLzMacnIYHb/EcMwxo6W8XlUB+LkYqzeUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7476
X-OriginatorOrg: intel.com

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGllcnJlLUxvdWlzIEJv
c3NhcnQgPHBpZXJyZS1sb3Vpcy5ib3NzYXJ0QGxpbnV4LmRldj4NCj4gU2VudDogVGh1cnNkYXks
IE1heSAyMSwgMjAyNiAxOjIxIEFNDQo+IFRvOiBCYXJkIExpYW8gPHl1bmctY2h1YW4ubGlhb0Bs
aW51eC5pbnRlbC5jb20+OyBsaW51eC0NCj4gc291bmRAdmdlci5rZXJuZWwub3JnOyB2a291bEBr
ZXJuZWwub3JnDQo+IENjOiB2aW5vZC5rb3VsQGxpbmFyby5vcmc7IGxpbnV4LWtlcm5lbEB2Z2Vy
Lmtlcm5lbC5vcmc7DQo+IHBldGVyLnVqZmFsdXNpQGxpbnV4LmludGVsLmNvbTsgTGlhbywgQmFy
ZCA8YmFyZC5saWFvQGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gc291bmR3aXJl
OiBvbmx5IGhhbmRsZSBhbGVydCBldmVudHMgd2hlbiB0aGUgcGVyaXBoZXJhbA0KPiBpcyBhdHRh
Y2hlZA0KPiANCj4gT24gNS8yMC8yNiAwNDo1NywgQmFyZCBMaWFvIHdyb3RlOg0KPiA+IEl0IGRv
ZXNuJ3QgbWFrZSBzZW5zZSB0byBoYW5kbGUgYW4gYWxlcnQgZXZlbnQgd2hlbiB0aGUgcGVyaXBo
ZXJhbCBpcw0KPiA+IG5vdCBhdHRhY2hlZC4gVGhlIHNsYXZlLT5zdGF0dXMgY291bGQgYmUgU0RX
X1NMQVZFX0FUVEFDSEVEIG9yDQo+ID4gU0RXX1NMQVZFX0FMRVJUIHdoZW4gaXQgaXMgYXR0YWNo
ZWQgb24gdGhlIGJ1cy4NCj4gDQo+IEhvdyB3b3VsZCB5b3UgZ2V0IGFuIEFMRVJUIGlmIHRoZSBw
ZXJpcGhlcmFsIGlzIG5vdCBhdHRhY2hlZCBpbiB0aGUgZmlyc3QgcGxhY2U/DQo+IFRoZSBzdGF0
dXMgaXMgb25seSByZXBvcnRlZCBpbiBhIFBJTkcgZnJhbWUgYWZ0ZXIgZW51bWVyYXRpb24uDQo+
IA0KPiBOb3QgZm9sbG93aW5nIHdoYXQgdGhpcyBuZXcgdGVzdCBpcyBuZWVkZWQgZm9yLi4uDQoN
Ckl0IGNvdWxkIGJlIGEgcmFjZSBjb25kaXRpb24uIFdlIG1lZXQgdGhlIGlzc3VlIHJhcmVseSB3
aGVuIHJ1bm5pbmcNCnN1c3BlbmQvcmVzdW1lIHRlc3QuIHNkd19oYW5kbGVfc2xhdmVfYWxlcnRz
KCkgaXMgY2FsbGVkIHdoZW4gdGhlDQpwZXJpcGhlcmFsIGlzIHN0aWxsIHVuYXR0YWNoZWQuIEhv
cGUgdGhpcyBwYXRjaCBjYW4gZmlsdGVyIHRoaXMgY29ybmVyDQpjYXNlLg0KPiANCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBCYXJkIExpYW8gPHl1bmctY2h1YW4ubGlhb0BsaW51eC5pbnRlbC5jb20+DQo+
ID4gUmV2aWV3ZWQtYnk6IFDDqXRlciBVamZhbHVzaSA8cGV0ZXIudWpmYWx1c2lAbGludXguaW50
ZWwuY29tPg0KPiA+IFJldmlld2VkLWJ5OiBSYW5qYW5pIFNyaWRoYXJhbiA8cmFuamFuaS5zcmlk
aGFyYW5AbGludXguaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL3NvdW5kd2lyZS9i
dXMuYyB8IDQgKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspDQo+ID4N
Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zb3VuZHdpcmUvYnVzLmMgYi9kcml2ZXJzL3NvdW5k
d2lyZS9idXMuYw0KPiA+IGluZGV4IGZlNTMxNmQ5M2ZlZi4uMDQ5MDc3N2ZhNDA2IDEwMDY0NA0K
PiA+IC0tLSBhL2RyaXZlcnMvc291bmR3aXJlL2J1cy5jDQo+ID4gKysrIGIvZHJpdmVycy9zb3Vu
ZHdpcmUvYnVzLmMNCj4gPiBAQCAtMTk1OCw2ICsxOTU4LDEwIEBAIGludCBzZHdfaGFuZGxlX3Ns
YXZlX3N0YXR1cyhzdHJ1Y3Qgc2R3X2J1cw0KPiAqYnVzLA0KPiA+ICAJCQlicmVhazsNCj4gPg0K
PiA+ICAJCWNhc2UgU0RXX1NMQVZFX0FMRVJUOg0KPiA+ICsJCQlpZiAoc2xhdmUtPnN0YXR1cyAh
PSBTRFdfU0xBVkVfQVRUQUNIRUQgJiYNCj4gPiArCQkJICAgIHNsYXZlLT5zdGF0dXMgIT0gU0RX
X1NMQVZFX0FMRVJUKQ0KPiA+ICsJCQkJY29udGludWU7DQo+ID4gKw0KPiA+ICAJCQlyZXQgPSBz
ZHdfaGFuZGxlX3NsYXZlX2FsZXJ0cyhzbGF2ZSk7DQo+ID4gIAkJCWlmIChyZXQgPCAwKQ0KPiA+
ICAJCQkJZGV2X2Vycigmc2xhdmUtPmRldiwNCg0K
