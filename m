Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.20
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795351631;
	b=wRmVH63LIkSSiXIi8E6XoPUwzNxltQuLt/+q3QqLfLMZRPhJDR3Z3MRLGkIYfdExfDUx
	 J0mD5YVJCAO6vqfSGwqevcQGzD1OhD1ALpAdGHV1QUw1ER08L7j4j5wtpC5/DQ7ebljZD
	 QLYIG8X6THDLL5n0bt1kQ+xxAOyGEBQ2P2CUJtMIRErmEM2PWuZuofZS5gLs9TMk6KlHV
	 3FqMXBbd6qjthMGq2IEsRgKUrljdejSlN5D6bupMO00r6l/GSmZt8F42AsImFySqkNIuo
	 D4pRqCmW9XvB81eRSWzXHHhndv6Jw/SKtNBfbH1Qn8B4+EYjJCB7bNZfo9ohqvzTWXQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795351631;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=/w5tPF+K15IQyCxEKweGY31Gh6BH+JqsZ6+CHkneFfw=;
	b=oM6DW9veHFjp8BAy+KOcigfRRWkchYoNmLx83LzxASoPpQDGGoVEUqcxVjx3YdQ5oGjz
	 qcLas4mdD6HeELoDX7I/fAcds3hVa6kjCZXTvfw34sDDwtGOQ0pbZJOcyXGMfCpwrEOKV
	 Ah4whnelYdD+ieYmscZkfQGeVeo9Nu1yYTRKfktq/9ZT4McgW580+ybrSh+rqfJqN1CUt
	 Myd/GOT4dIlhqP5vefROk7gILBmWl3f4S1HHJC11rwO1thLx+GdDUSfDAI9TXg1uKhzqY
	 SpLxd6QVXrPucZxiuq/b4VKB06kqIAOkjREXZ3FEgj0NzFHTkrJGJdt32YsHkPNWPDA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BHgj4Id7;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=fhakNY3I;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBDAA606A32A
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 12:47:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBDAA606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BHgj4Id7;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=fhakNY3I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795351630; x=1826887630;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=/w5tPF+K15IQyCxEKweGY31Gh6BH+JqsZ6+CHkneFfw=;
  b=BHgj4Id7Zg9RP14OcWTK0/2nhDlPMJsxgfQRneZN3JRUssyUtwCE60aG
   WuVrWuTh7Eh8G0gQw5u9ku2g++wmXnjuJFQtEF08CFEU24K9nzFlZwyGR
   7kaIpZ2L0U+2L9xWWb/6gwEqBrePvI39ZcwqVIhUsGqbF/VPPBzAhm6PU
   9ArCqsKCGPO1xR2sCLqKMEQWqJbZcOugb6VLnpVRYBI6bOMR2z5Bdly+X
   NLlV49G7Hrzp5/rvRwZ43cnHTEvFSchAxBpMS8KjcSUGLXKjFsRqDBe7N
   L3DbnEK7MY9sbnHSnSZi/hKVN1s4E6HSURGFLjO7FLhUKSkrsOzTSEyIF
   g==;
X-CSE-ConnectionGUID: e90na9YPRTKmpzcO6tKzWg==
X-CSE-MsgGUID: sTLOnL05RnGBLMmHEJYuXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4215182"
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="4215182"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 04:47:10 -0800
X-CSE-ConnectionGUID: 1SFmll79S+C+uPGbKbo9hQ==
X-CSE-MsgGUID: y7pdkz10QsGUX2ama8Glzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="12898372"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 04:47:09 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 22 Nov 2026 04:47:08 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Sun, 22 Nov 2026 04:47:08 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.23)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 22 Nov 2026 04:47:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SjEITNkL4IOS1mHnZXb09nUn2Q389AdEfTu62N49cVVfLhaTK7hJwNnwAKpPGk3jM/hltnQcbu5WzN2w7Hrxt/UIVN4LVUapqufJykEY+CAjItoTb4ut7BX2DxZDCWkcpffzKSwF04ckPemiudf21LgNFqpbD33uSTlX/OPbYP8mNfgzE23mPmjc1G7sDNnAefMw/tA5z1FA29TqRoEhjCc7JEA+fskcctiJSvcaioJwdUHNEZYwbg76qrEXGhS2zrRYDuHenxP1Ewm3lsSWZlNBvwrw84flNS7O9P/RVk/hqgMdEKxwlhp2J0sTQyM2dE1DbERVjQbs1M7GhzEcDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/w5tPF+K15IQyCxEKweGY31Gh6BH+JqsZ6+CHkneFfw=;
 b=kwswC23thToadTtaEKuOj/nVOKpfRwTG8B5NkTc1fX6gzKUi7A/X9Xrg8/C4LpxsK/cDe+rZBR8pB1kFxtrRI3jKKJ+zGF2HHDNnwUYaOyPL1M8BWKeQ2ecK2ROq1yfYLOJfUafHivvylhOFQT3Eos1t9YtrXxDqyOfoy9wnbJTsMSS3QgTU4bt8HLBq56LKxJjThU9Gp+QagCisoq7WfziyoeUJUqdnxAvIUZ7Nlq68BQwzHwif1FZzMgpK+/6BRipZatHQIx6wOH5AXmV0EtZaLPs+uTmmR4zU+uHOO4fdz7VqW6c7sD9qX7QOxJ91KK6e/dNtzLSF15cdxsA91w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/w5tPF+K15IQyCxEKweGY31Gh6BH+JqsZ6+CHkneFfw=;
 b=fhakNY3Io3TI7QOrHYSsXS7YXdKa/qbaXrtk3RFBuhBhh+6EHZEjaGx4wJtYAfXg3zYIpj8MhqcagIJonTty084KGr7gOS5wYo4sAwXNRG30EQQZQnIEG9Y6i64BhLm68XJZDFwvgV397FUPAQo0tRMsBrX5l7wD6xYKM7HFt5M=
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com (2603:10b6:a03:53e::10)
 by CH3PR11MB7843.namprd11.prod.outlook.com (2603:10b6:610:124::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Sun, 22 Nov
 2026 12:47:05 +0000
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::3df:33f9:59a1:da76]) by SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::3df:33f9:59a1:da76%3]) with mapi id 15.21.0639.012; Sun, 22 Nov 2026
 12:47:05 +0000
From: "Liao, Bard" <bard.liao@intel.com>
To: Antonio Di lorenzo <antoniodilorenzonap@gmail.com>, "broonie@kernel.org"
	<broonie@kernel.org>
CC: "Rojewski, Cezary" <cezary.rojewski@intel.com>, Liam Girdwood
	<liam.r.girdwood@linux.intel.com>, Peter Ujfalusi
	<peter.ujfalusi@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>
Subject: RE: [PATCH v2] ASoC: Intel: soc-acpi: add SoundWire config for ASUS
 P5405CAA
Thread-Topic: [PATCH v2] ASoC: Intel: soc-acpi: add SoundWire config for ASUS
 P5405CAA
Thread-Index: AQHdQdNprtgsqHJMHEqobQSMQn2HXrbajK+AgFz/0gCAAumtYA==
Date: Sun, 22 Nov 2026 12:47:05 +0000
Message-ID: <SJ2PR11MB8424BD6AC815533B4889C5D6FF462@SJ2PR11MB8424.namprd11.prod.outlook.com>
References: <20260911094539.237430-1-antoniodilorenzonap@gmail.com>
 <179007765990.322763.17356606026712759937.b4-review@b4>
 <CANcofmUeSPtVsCdsQ7Lv+pSw9Y5BovAZWVNC3rKoXD-7q0Y+Sw@mail.gmail.com>
In-Reply-To: <CANcofmUeSPtVsCdsQ7Lv+pSw9Y5BovAZWVNC3rKoXD-7q0Y+Sw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB8424:EE_|CH3PR11MB7843:EE_
x-ms-office365-filtering-correlation-id: d23da7e2-97ed-4376-f9f4-08df4896b65a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|38070700021|10067099003|4143699003|11063799006|56012099006|261022105027099003|261022075727099003|261021121427099003|261009223027099003|261102123227099003|261026121527099003|261026140227099003|261028144727099003|18002099003|22082099003|6133799003;
x-microsoft-antispam-message-info: OQ/KKzmInUWbLlbHHpMyyBDMz4hGX4wx4PjTTGDa3c3AQjLwo5eUzavUp7fzF5d6wmYJbnzpegt3tLEeGeY6A+KmOla9TSSDbdWGsE2WxAXfXhQ67qNyCHQ0dUDx7C146dmCJDmBBvuSgIU6RtETQ66midlaJVWLB/UwulStyisPWOqx3JJPvp3kmt7/UduwdJgttINUHmejDIGlNvogSEZye0+VzNKQn1UFjS/JOYBta4pAcz9zetK59AFvJzPfa1J0NjgK+YrOtIPqwQ/v2YRn2qcuGky1gYckSEMOkdycAh+7GS5a492alGGU4x8VqxEEdlzHFKIMBid0NMgJRhgXuZOh4rGSfjAzBFFVylR2A/DyQxeAXHgSsXZHewaFXY+QnvJd0pegnISxao0iJQQBr0uSHZAVHEqT9SYFQF9OxA9LM8DAzj6Sj/ApLQemmDkWnCA0JgOugv6brB5GI+SkK6yvnQCpk9ksLddFhHLhb17wIaf+n4IKTxnE7JXo3zU237+APITt72YP0LzMibeJyf2YfQxMKgGvke7LaEQE4gFUd+VP++xrUw4B4f+zpns0UEHJ9Yxch0BLXwVo9dMX84nRd4g/9yg0xGfn/pjX8rVCg0gwibYqgS8j+RUAm4fjTQOQJg5huPBfn9Vd6kkGF0mNl2RpNxhP7GvjHAgNgkeTA7qze67BhC4u7mAhshwtXePAwBpGDL3uHFWn6qiF/965pA25CA1FV0IVsYE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8424.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(38070700021)(10067099003)(4143699003)(11063799006)(56012099006)(261022105027099003)(261022075727099003)(261021121427099003)(261009223027099003)(261102123227099003)(261026121527099003)(261026140227099003)(261028144727099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cXhtNjVxRFRXby8rQytybW5LaVNTUHpaVG8xVi92dmNlN0I4Z0VGMlhaYm1x?=
 =?utf-8?B?REVKdzJzR1NTSy9CZ2YxL01SMTZJWEVaVkwxajZ2YytpS3ZJQjU1cDYxeW1z?=
 =?utf-8?B?UmJXV0d5WWhOdkh4M2dSY0JSUUgzQjNiOC9hNHJueC9oQmQwY0hwNG8xNkJF?=
 =?utf-8?B?UFRYQU1qUkVFUDNOZURIZ1Q1ZTVYNmFSbTFha3ZNK2RHdVNZeE1UUjNuV3Jn?=
 =?utf-8?B?ZTZFOU12SC9nWThIWjc0REEyOVNaZ0JsY05MUFhlbFZ1NVhRdUhWKzlXd2px?=
 =?utf-8?B?K1JRWXBzWXpza1FVWnpTc3haU2N5M3FQcXlRRVpYb2o4WS9qTy82QkVDYlUr?=
 =?utf-8?B?NzA2L0dodzJDcURlYU9GN1FVN1dWQ3VWVDNhUmx0Q3A2em1QK2JCUFJKUVo3?=
 =?utf-8?B?VnVBSHpuQlRNait0eTJpVkU3TE8vWVNpRVV0a0UrWWZLUVRpeU9TMlJBQlRn?=
 =?utf-8?B?RDZZTEgwYTJDbFVIeVZtMk5HNWJXRkVXVGtZL0R2ZnZVelMzTzRBMWpyeitt?=
 =?utf-8?B?ZDgrdTJsOTQrZnF4cFVva29tL0pReFErN0NjczhKOGJyWkZ0MEdCTHFMMGly?=
 =?utf-8?B?VGw3SDdsWXJINkJ1WXd0Z09PT0NTYlZEdE81RUxVTlh1eEZmalJxUUxrNlhS?=
 =?utf-8?B?T2R1aEV5SkYzeE1mMzhMUHZhdk1TdGZ4akJabU5GSWhlb2prSm5VakhHdGlr?=
 =?utf-8?B?YUdJSUJhQlg0OXNRanZQWjFxbTArVnFRR3pNdGNYdE1zd3VldWxBUE9NSHU5?=
 =?utf-8?B?VG9MZ2JTUS9yYTZlRXJnRXFtUTRQazhNSlh6RGpHQzkvKyttWTE3citEeklr?=
 =?utf-8?B?dXNBQUJlcEI3NG5wMXpsWDk4c3lzRDNCRkdaY01NTVl3NXVPY1ZoRkJhVjZs?=
 =?utf-8?B?UHBKRUFiaUNrWEJIUktiQ1daK2t1amlmMEpYUkdOZXh4Y0xYUjVjQ3lDZW1H?=
 =?utf-8?B?U2hvMmdaT3V1aXZxUzVNNUZacmx3QVhZYnBqSE1uZHV2QXZJZUFhVHlrYmhD?=
 =?utf-8?B?UG93ZDJFeUdnUSsrUEVIcjM4Y3NJQmZVMzZLMVljcnZWWGpnVmNTVmdvM2ho?=
 =?utf-8?B?R0c2VXZmaTZna2ZxWGt2L1VoMmswNllLOVphOFBYNi80QzI5UGY4RG9yMWNF?=
 =?utf-8?B?OWlTRzlEWHJJRDdVRjFKcUIwTnlVUDZyMXJtcWxDeFVqVHRoTzJISExBWTZR?=
 =?utf-8?B?N0ZQUCs1TlhVSUZuTjcwZ3loR0FZbStrenlEQ1RVSnpsR1hPUDM3eWVqQTVS?=
 =?utf-8?B?QXZZMkVNaGNCanI5U3ZudWZ0Q1pGTkR0YUxFUHA1eFZmbTNtUnFmSlJjS0pW?=
 =?utf-8?B?eDJqVGM2YzBORzdwcGcyMWhZUlNKZEI4Unl0NHd4UW5EYzBQTlpHSmxyZDN6?=
 =?utf-8?B?aHl3U2RPb3paQlA2aVBXM3NzMHFBZVh1ZHpGQlBacWVzRnE0eUg0eFRwQmll?=
 =?utf-8?B?Q2QrUEVFTnlqaFRXNzd2NS9tYnBHMkoyNENqZ1ROZXdTOVJrdWxrT0I5NGx1?=
 =?utf-8?B?aVFsNEZQTGM2RlAzR2VSbXBXSVU5OEdHam96K3B3QTdaZ0hWQ1poQVdwMGc0?=
 =?utf-8?B?Y1FsYlNLVUtTWnYybXB4bnJJV25WblJmR2xibWhQQk9NbnI3V0cvZW1PSnFV?=
 =?utf-8?B?L0htTVhvdzdvenJ5R0dlaTA4ZVlNMjF4eGg0bTM3U1RPaWJOcmdTV1l3M3Rz?=
 =?utf-8?B?RTVIUklGYTFiN0pEYWM1UTZjZyt3Um5DbFpnVEpJQTc1ekxBMmF1VlgvZHBZ?=
 =?utf-8?B?ZWk2Tks2Z1pDSU56RFpyZ0dEVS9GMjY2aDJQaDZxc0dwT0htajM3ZkpVd01L?=
 =?utf-8?B?ZStiVjRPTll0YVF1d2Z4MkQrRFQwSEJESDhzZzNQTU9PeG9JK2lneEpJV0Ni?=
 =?utf-8?B?V0ducmNmTWdZTlBBSFZDcU5aSVRIOTRlVFdrazFtcjR3RThaMUVNWmNXWWo2?=
 =?utf-8?B?VXZPRElhUHgwaTdyV0U0amRXdm9pN0hCUHJ5MjJod21ZeVlpbzYrRVJ2cFBS?=
 =?utf-8?B?RG9OMHRCR1hRT21lcWlGenFIWmQxcGlTWWV1cGgrbnMyay8xQU5hbXdQR05H?=
 =?utf-8?B?bDY3S2Z5Qll2d01ESExuRjRSWjhlc1ZnaFRlZHN2SmhBZEN0QkhXc1BYUE9V?=
 =?utf-8?B?b1hUWUtyQUNJSzNPSmhzZTFubmFxTCtGc2ROcU1KMkw2Q29LTlNwdkxvSVZ5?=
 =?utf-8?B?OXQ4SjV0dnVObUpmVXF6SXNxQi8vbkpZYWJpdC9tUmh0eGsyTndJTWlTd3V2?=
 =?utf-8?B?eVNWV0xTOHcyTmF0ZWVob3JqbWlZaEY5aXpMYUlkWHVyVGh3Ky9NamxodVhD?=
 =?utf-8?Q?CJG/gZ/1UcuZY9BYnU?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: BhDJYX5t9FO+raghGi5SASyt0Pu58jXwCYZFC4/Kqt+5ZqBD4c57Z87fLrUsAIg0R3HPaUHrREMXiEdY7IM1onvR1yc8Q8hl0sw+GsZm+8rorHn7z0oGezgq8totEv/u5cqSHKHdv6taBRtPrJPHk5bd1kZ0KXOhWySyEs9LWDsEycpQEgKB8c2XHXkF84tASDnQMl7MmbMovY93rTp2TWzaRKJlEGO/23+fSEex15kw4Dfp370vO2lkJMx08Tr3ua0cbKaAOeUt0QqyrJJG1lelYFcjaBEpMXY9fBcNEJ9gnoUJm++EHDq1x41NluvBHjYeWNyHRtN0JowAcu/llw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d23da7e2-97ed-4376-f9f4-08df4896b65a
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2026 12:47:05.1233
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a4o0ZloScgE1JS89KRks5bq5cZR2a9eizwCwosAt36062eBtakRH6OI05sE+qRjf9oCn0dC854EP01TbI8OR5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7843
X-OriginatorOrg: intel.com

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW50b25pbyBEaSBsb3Jl
bnpvIDxhbnRvbmlvZGlsb3JlbnpvbmFwQGdtYWlsLmNvbT4NCj4gU2VudDogRnJpZGF5LCBOb3Zl
bWJlciAyMCwgMjAyNiAxMTo1OSBQTQ0KPiBUbzogYnJvb25pZUBrZXJuZWwub3JnDQo+IENjOiBS
b2pld3NraSwgQ2V6YXJ5IDxjZXphcnkucm9qZXdza2lAaW50ZWwuY29tPjsgTGlhbSBHaXJkd29v
ZA0KPiA8bGlhbS5yLmdpcmR3b29kQGxpbnV4LmludGVsLmNvbT47IFBldGVyIFVqZmFsdXNpDQo+
IDxwZXRlci51amZhbHVzaUBsaW51eC5pbnRlbC5jb20+OyBCYXJkIExpYW8gPHl1bmctY2h1YW4u
bGlhb0BsaW51eC5pbnRlbC5jb20+Ow0KPiBLYWkgVmVobWFuZW4gPGthaS52ZWhtYW5lbkBsaW51
eC5pbnRlbC5jb20+OyBQaWVycmUtTG91aXMgQm9zc2FydCA8cGllcnJlLQ0KPiBsb3Vpcy5ib3Nz
YXJ0QGxpbnV4LmRldj47IGxpbnV4LXNvdW5kQHZnZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBS
ZTogW1BBVENIIHYyXSBBU29DOiBJbnRlbDogc29jLWFjcGk6IGFkZCBTb3VuZFdpcmUgY29uZmln
IGZvciBBU1VTDQo+IFA1NDA1Q0FBDQo+IA0KPiBIaSBNYXJrLA0KPiANCj4gU29ycnkgZm9yIHJl
cGx5aW5nIG9mZi1saXN0LiBJJ20gcmVzZW5kaW5nIHRoZSB0ZXN0IHJlc3VsdHMgaGVyZQ0KPiB3
aXRoIGxpbnV4LXNvdW5kIGFuZCB0aGUgb3JpZ2luYWwgcmVjaXBpZW50cyBpbiBDYy4NCj4gDQo+
ID4gV2hhdCdzIHRoZSBpc3N1ZSB5b3Ugc2VlIHdpdGhvdXQgeW91ciBjaGFuZ2U/DQo+IA0KPiBP
biBteSBBU1VTIEV4cGVydEJvb2sgUDU0MDVDQUEgcnVubmluZyBGZWRvcmEgNy4zLjQtMjAwLmZj
NDQueDg2XzY0LA0KPiB0aGUgc3RvY2sga2VybmVsIHNlbGVjdHMgdGhlIGdlbmVyaWMgU291bmRX
aXJlIG1hY2hpbmUgZHJpdmVyLg0KPiBCb3RoIFRBUzI3ODMgYW1wcyBsb2cgImZ1bmN0aW9uIHR5
cGUgb25seSBzdXBwb3J0ZWQgYXMgRGlzQ28gY29uc3RhbnQiLg0KPiBTT0YgZG9lcyBub3QgbG9h
ZCB0aGUgc3BlYWtlciB0b3BvbG9neSwgYW5kIEFMU0EgZXhwb3NlcyBubyBTcGVha2VyIFBDTS4N
Cg0KVGhlICdmdW5jdGlvbiB0eXBlIG9ubHkgc3VwcG9ydGVkIGFzIERpc0NvIGNvbnN0YW50JyBp
c3N1ZSBpcyBjYXVzZWQgYnkNCmFuIGluY29ycmVjdCBEaXNDbyB0YWJsZSB2YWx1ZS4gV2hpY2gg
c2hvdWxkIGlkZWFsbHkgYmUgZml4ZWQgaW4gdGhlIEJJT1MuDQpUaGlzIHBhdGNoIHdvcmtzIGJl
Y2F1c2UgYXNvY19zZHdfcGFyc2Vfc2R3X2VuZHBvaW50cygpIGFzc3VtZXMNCnRoZSBlbmRwb2lu
dCBpcyBwcmVzZW50IHdoZW4gdGhlcmUgaXMgb25seSBvbmUgZW5kcG9pbnQgb24gdGhlIGRldmlj
ZQ0KKHN1Y2ggYXMgdGhlIFRBUzI3ODMpLiBodHRwczovL2dpdGh1Yi5jb20vdGhlc29mcHJvamVj
dC9saW51eC9wdWxsLzU5ODYNCnNob3VsZCBhbHNvIHJlc29sdmUgdGhlIGlzc3VlIGluIHlvdXIg
Y2FzZS4NCkkgYW0gZmluZSB3aXRoIHRoaXMgcGF0Y2ggc2luY2UgaXQgd29uJ3QgaW1wYWN0IG90
aGVyIGF1ZGlvIGNvbmZpZ3VyYXRpb25zLA0KZXNwZWNpYWxseSBjb25zaWRlcmluZyB0aGF0IG5v
dCBhbGwgT0VNcyB3aWxsIHByb3ZpZGUgYSBCSU9TIHVwZGF0ZSBmb3INCnRoaXMgaXNzdWUuIEBO
aXJhbmphbiBGWUkuIEl0IHdvdWxkIGJlIGJldHRlciBpZiB3ZSBjb3VsZCBhZGQgYWxsIGltcGFj
dGVkDQpjb25maWd1cmF0aW9ucyB0byBzbmRfc29jX2FjcGlfaW50ZWxfcHRsX3Nkd19tYWNoaW5l
c1tdLg0KDQo+IA0KPiBJIHJldGVzdGVkIHRoZSBzYW1lIEZlZG9yYSBrZXJuZWwgd2l0aCBvbmx5
IHRoZSBTbWFydEFtcCBmdW5jdGlvbiB0eXBlDQo+IGZhbGxiYWNrIGZyb20gdGhlc29mcHJvamVj
dC9saW51eCBQUiAjNTkwNCBhcHBsaWVkIHRvIHNuZF9zb2Nfc2RjYS4NCj4gQm90aCBhbXBzIHdl
cmUgcmVjb2duaXplZCwgU09GIGxvYWRlZCBzb2Ytc2RjYS0xYW1wLWlkMi50cGxnLCBhbmQgdGhl
DQo+IFNwZWFrZXIgUENNIGFwcGVhcmVkLiBCb3RoIGFtcHMgdGhlbiBsb2dnZWQgImluaXQgd3Jp
dGVzIGZhaWxlZCwgZXJyPS01Ig0KPiBhbmQgdGhlIGRyaXZlciByZWplY3RlZCBwbGF5YmFjay4g
RHVyaW5nIHRoZSBzYW1lIGJvb3QsIHRoZSBrZXJuZWwNCj4gcmVwb3J0ZWQgYSBkaXZpZGUgZXJy
b3IgaW4gc2R3X2NvbXB1dGVfZ3JvdXBfcGFyYW1zKCkgZHVyaW5nIFBDTSBwcmVwYXJlLg0KPiAN
Cj4gU3RlcmVvIHBsYXliYWNrIGFuZCB0aGUgaW50ZXJuYWwgbWljcm9waG9uZSB3b3JrIG9uIG15
IGxvY2FsDQo+IDcuMy4wIGJ1aWxkLiBUaGF0IGJ1aWxkIHVzZXMgYW4gb2xkZXIga2VybmVsIGJh
c2UNCj4gYW5kIGluY2x1ZGVzIGJvdGggdGhlIHN0YXRpYyBtYXRjaCBlbnRyeSBhbmQgbXkgc2Vw
YXJhdGUgVEFTMjc4Mw0KPiBzdGVyZW8gZml4LiBBIGNvbXBhcmlzb24gb24gdGhlIHNhbWUga2Vy
bmVsIGJhc2Ugd291bGQgYmUgbmVlZGVkIHRvDQo+IGlzb2xhdGUgdGhlIGVmZmVjdCBvZiB0aGUg
c3RhdGljIGVudHJ5Lg0KPiANCj4gV291bGQgeW91IHByZWZlciBhIHNlcGFyYXRlIHJlcG9ydCB3
aXRoIHRoZSBsb2dzIGZvciB0aGUgVEFTMjc4MyBpbml0DQo+IGZhaWx1cmVzIGFuZCB0aGUgU291
bmRXaXJlIG9vcHM/DQo+IA0KPiBUaGFua3MsDQo+IEFudG9uaW8NCj4gDQo+IA0KPiBPbiBUdWUs
IFNlcCAyMiwgMjAyNiBhdCAxOjQ34oCvUE0gPGJyb29uaWVAa2VybmVsLm9yZz4gd3JvdGU6DQo+
ID4NCj4gPiA+ICsgICAgIHsNCj4gPiA+ICsgICAgICAgICAgICAgLmxpbmtfbWFzayA9IEJJVCgx
KSB8IEJJVCgzKSwNCj4gPiA+ICsgICAgICAgICAgICAgLmxpbmtzID0gcHRsX3RhczI3ODNfbDFf
cnQ3MjFfbDMsDQo+ID4gPiArICAgICAgICAgICAgIC5kcnZfbmFtZSA9ICJzb2Zfc2R3IiwNCj4g
PiA+ICsgICAgICAgICAgICAgLyogImR1bW15IiB0ZWxscyBTT0YgdG8gcmVxdWlyZSBmdW5jdGlv
biB0b3BvbG9naWVzIHdpdGhvdXQgZmFsbGJhY2suDQo+ICovDQo+ID4gPiArICAgICAgICAgICAg
IC5zb2ZfdHBsZ19maWxlbmFtZSA9ICJzb2YtcHRsLWR1bW15LnRwbGciLA0KPiA+DQo+ID4gVGhp
cyBsb29rcyBhIGxvdCBsaWtlIHRoZSBkZWZhdWx0IHRoYXQgaGRhX3Nkd19tYWNoaW5lX3NlbGVj
dCgpIGhhcywNCj4gPiA3NTRiM2RhZGU1ZGQgKCJBU29DOiBJbnRlbDogc29jLWFjcGktaW50ZWwt
cHRsLW1hdGNoOiBkcm9wIHJ0NzIxIHJlbGF0ZWQNCj4gPiBtYXRjaCB0YWJsZXMiKSByZW1vdmVk
IGEgYnVuY2ggb2YgYm9hcmQgc3BlY2lmaWMgc3R1ZmYgZXhwbGljaXRseS4NCj4gPiBXaGF0J3Mg
dGhlIGlzc3VlIHlvdSBzZWUgd2l0aG91dCB5b3VyIGNoYW5nZT8NCj4gPg0KPiA+IC0tDQo+ID4g
TWFyayBCcm93biA8YnJvb25pZUBrZXJuZWwub3JnPg0KDQo=
