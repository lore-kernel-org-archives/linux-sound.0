Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30003175550
	for <linux-sound@vger.kernel.org>; Thu, 18 Apr 2024 18:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713463205; cv=fail; b=mc0u8wKPdoyDgHFSKIPREfDVN6oKgqYr0j6U9R6hq54WZXFIOQLnSOQFrAOn/nBjMMdPnYOW6Z53FFn/T56jW2+yI0opx9cOzpYsJbbTRU5JHox3LieYhEIK3FZvYSSU/+M/oxq0CAvUSZREOAaxVGZOt2T/B31exKmMz7sqlP8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713463205; c=relaxed/simple;
	bh=bLqLXyQgaMBEn/A8An5TD3ahPlE2Ug+wNoeD/sH2SAQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Mc8huGlVuIsJfqQEpHXJ98bYP8kBD5K+3GoJMtq08qOUr+1HCuQH5o8LlOzI00IoN1IPgEwUIelAKHqK64WiEayeWyvkqiP3kdRCYjnUHVK5WcoJkVbo20vmEr4lZT3SWpv0adAw2lQlEiU1BRn/CQqRvay/PMZZuGGVr1X5PWo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cirrus.com; spf=pass smtp.mailfrom=cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=L0ufgJOW; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=XgMkRkmk; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="L0ufgJOW";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="XgMkRkmk"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43IHhJ9x024818;
	Thu, 18 Apr 2024 12:59:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-id:content-transfer-encoding:mime-version;
	 s=PODMain02222019; bh=bLqLXyQgaMBEn/A8An5TD3ahPlE2Ug+wNoeD/sH2S
	AQ=; b=L0ufgJOWxGSWBD0x6C2JuQ0iIGd9pnCa/QR7kBAFpSylDmBwq3hCNdiY2
	D7dAK3Nzke2dDKxoT4Xi63OLH01UxBZlBetfCyOwlV6hlvyo7yJMd0XBWbTkbNb3
	4k5jAC6eh5R2Ztw1YYCBTofzzJum1yiQUfidnBBALzQtcvir4NYl+5n0jc/Zuccz
	wzhzDUUJ7SBzXuKzHuRahFrjoki9Z5RdddfgDq532c5InG39cEHLrA8bDgKR0ScG
	B7oJXGkLO13NzACeoUooVZbOj07KYoU/KIvGPcg5YrA0kLJqr4uuZs8SeDr8QeJ2
	QXhmbkqna2aiV5l+xXzqlkPq3CbHg==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3xfpfhw3wx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Apr 2024 12:59:46 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jfRumkZtolLEsFlO2W2p/cMueAmukv95/aAeGMnN744WWySI3+1G020NDOF8c04TMegcf4KphsZu2QvafRHQtCvOHlrCkAytaHpJs/3AJf3E2/Lds25It5qg+Daf+QeKwKcvKH9LjzFvKojSAB3XRi+5hKSVaJX3kFlTlKE8Zc5S+H5sSdYZZGSW8uY7hPVtvCB8jotzzk3ko4g6NQJbTZSvPMuyVVOyrdXA2WBoa2RJ2h1+m7/jdpVu0sXq2DbAvFJO1B3lVk6Qz7ACUUvy17phjpaZMIEd/g+rdj/t/u1IeI4LE5y3J74HzXH6cVkkGGgHDPRNIo7gb4w0zZVB0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bLqLXyQgaMBEn/A8An5TD3ahPlE2Ug+wNoeD/sH2SAQ=;
 b=g4UrCGyVC7B29F+iDn60shM1se3CK8vJUs+rJyfIVFtVpE1k5GEZCgeP290DeFuxyZdYEYhuMdR6izRN57qhsYPKDzA+dXHDYybJCpAjbPEHejXfqftjU2ps6oXULbrExwNtUM5Wv591NED+ulAZixujgeLqvolhQYqS8J3+Z8u+bKWvGrp3EEFrfeMnSGu9YPO1/fbm2ezGkb8s3Gu6KGGmbGc6lVthXGa9VVxTNTy2b+XBtkCIXMkMoKjGUJWN9694NBJUBLIS8u87I8NCFN2+uDg0Ysq4kTzqnPEv4kpOLqtvyxb9FE35r3CftCD5wn5o8+XZoeWJIaDP18C+pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cirrus.com; dmarc=pass action=none header.from=cirrus.com;
 dkim=pass header.d=cirrus.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bLqLXyQgaMBEn/A8An5TD3ahPlE2Ug+wNoeD/sH2SAQ=;
 b=XgMkRkmk/ZfGJxKXba5YhhgDG07+xFvMq76sdEcoHMg5UlyVcYvlXMUtXZ/pHcjl1FBxq8Wq3Y97sR9boJKflmqiqwx0azGYYY7oSCfqJtiOScxeOM65MmKOp9cKIPPAClAyWQYpaV7Et5PxZKETKEQCc8G8PgZXrBxx09aufI8=
Received: from DS7PR19MB5688.namprd19.prod.outlook.com (2603:10b6:8:73::14) by
 BY3PR19MB5025.namprd19.prod.outlook.com (2603:10b6:a03:36e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.41; Thu, 18 Apr
 2024 17:59:41 +0000
Received: from DS7PR19MB5688.namprd19.prod.outlook.com
 ([fe80::8329:dcb9:4d7c:df1a]) by DS7PR19MB5688.namprd19.prod.outlook.com
 ([fe80::8329:dcb9:4d7c:df1a%2]) with mapi id 15.20.7472.037; Thu, 18 Apr 2024
 17:59:41 +0000
From: James Ogletree <James.Ogletree@cirrus.com>
To: Lee Jones <lee@kernel.org>
CC: Mark Brown <broonie@kernel.org>,
        Dmitry Torokhov
	<dmitry.torokhov@gmail.com>,
        Jeff LaBundy <jeff@labundy.com>,
        "open
 list:CIRRUS LOGIC HAPTIC DRIVERS" <patches@opensource.cirrus.com>,
        "open
 list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
	<linux-sound@vger.kernel.org>
Subject: Re: [PATCH RESEND v10 5/5] ASoC: cs40l50: Support I2S streaming to
 CS40L50
Thread-Topic: [PATCH RESEND v10 5/5] ASoC: cs40l50: Support I2S streaming to
 CS40L50
Thread-Index: AQHaicoHNR0TZU5ElUi1zSJTLRH+QrFk3KaAgAYE9YCAABxTAIABgLkAgAHiFwA=
Date: Thu, 18 Apr 2024 17:59:41 +0000
Message-ID: <9F7C82D1-1622-4FD8-9987-30236122E852@cirrus.com>
References: <20240408153214.42368-1-jogletre@opensource.cirrus.com>
 <20240408153214.42368-6-jogletre@opensource.cirrus.com>
 <F09C19F7-F3BC-44A8-B3F8-3064DF8E666F@cirrus.com>
 <20240416123541.GW2399047@google.com>
 <F90648F7-BE0B-47DB-89C4-A8C91CD65D59@cirrus.com>
 <20240417131402.GZ2399047@google.com>
In-Reply-To: <20240417131402.GZ2399047@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR19MB5688:EE_|BY3PR19MB5025:EE_
x-ms-office365-filtering-correlation-id: f15d6b66-b1bd-49c0-af19-08dc5fd1525c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 gmyGw8xu4nAtRTC1XLFcR96nOnv7zzNJNwgJMTUTCFB2rF+7tSZZjMU1d4vEiqARzNSoCgWpNh5ucRYx10J3c//t6Zn6NGtocw1Dq+O8YZMiuecST6dSTwncGAq722qkHV72OlZsjwEj1m5gprEjlqDNiCxJxoA51S+JdzGWvMt1FXQqL8B3saiT364WPmmP8GeSvmYNF5tZkkJPevKw8TxAyIvB8GTauMJYhB/LeKrKFyanyYEN6TkxqfPR1hR3RsuNAXnswpNvi8+lGbacU/nA7e9ntJ4c1ZFAau4jGEJIqiTWBLCZ8ptK+JvV5T15INloJtfYvboyk/GCslkNmCq3bZyJxS2ZRJm1LNLmimCSogjr9n+ntrjb7rlf3Uv0wX9/PTyGouB1CoPGBgDK2nYkDZe4esioZ248XqPhxhjpc2q0xuxKblp+oFu3Rb6hv8ElLQmE/yNra1BE4ApY8hpnlirSAg3BI3CFwXU6ktKK2zj5fHmVU8nz6j6ys+TLljGLVf6TFQHZwsdpTya4Tb3i6f2X3O+SPLev6oezRyXUN/q7btgAbrahQ9g1+nwdMkCYw2qZqVQF4xUz3F/fGH9yoGxnYdQcDocbsp0ctxlsmHei2EE7Z7CeCJA9/0zZNNHUKsaBKKC6Q5XKmeoDHJCoJPHx3fneM/oMrbOwW9XZHiKVzZJqmlQ/f6/dpT8UumJvJVP1WYJLH6fvi+EM9+hPgS/sM5aCsG3iPm47f3A=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR19MB5688.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UW42bno5a0l4QzBqQ1lUMEJVQVl0dEJ5RjV1YWcydkRZN1o4bXFhWG1wa053?=
 =?utf-8?B?SEZWeHg0bWVLY0xNNG5wSXhEcVZsY1hrc1VPTnVPR1kwYzlqL2ZRaFVFU1RR?=
 =?utf-8?B?U015OHZFaWkrVVJ5MmYwQ0dUWlM2YWNsTml2aUFPMzhpTXhMY09GVDBiUzBo?=
 =?utf-8?B?b28yNmt6ZjJYNTJRbzNpL3NtN1ZMU0JWTzd4UnpJUUw4QVdhS2N5WWE3UWpN?=
 =?utf-8?B?dlhEbGdxZStGdlBPeTRtZnRvQk5oZDBFd00yZGVnQm5QbGFsaHJSeHhiM0Nw?=
 =?utf-8?B?bUZuYmowckZERW84MTA3S2JTVUEzanZnL0FZaDlwWHBMUllDMHl3Vi9URHBo?=
 =?utf-8?B?Z2lkd3Jncml0K0RLMk1aYU11ODZFREpBNjJZV1laYzFpMEF6NVlKSXBXaytP?=
 =?utf-8?B?bGtnYTZGb01BOTFOZGxSait2SWdpY2UzOVpSWVJrc0Ixa1VMSDc0VTFoTTcx?=
 =?utf-8?B?eWxnbGZjelJMTnNaRm42VFl3V0VxNlVPRnc0VUJQTU9UVzROSmhxeHJTSURh?=
 =?utf-8?B?WktQeTl4a2RMNFpENHlrZ1ZkeE4wOEtEcjFXbzdUSzBhR0hIMXRSbURJOERZ?=
 =?utf-8?B?ZG54VWRMYWFjcFIrN2hEM0xuaDEzWHFKVHdTYVpMaDFJbFZLdkdUb21IMTBO?=
 =?utf-8?B?OWVlWEs2cnVvYU1kVzZmbkk5MnRMQ0JHK2JxcGdrelh0K1lFdXNqdWxrL0dw?=
 =?utf-8?B?VTJYMXF6THlTYVZqMExRbjhlS0ZycGVjS01WTjA1L1gzVGwvRDBTQ3FqMGt1?=
 =?utf-8?B?STBLQnlkYml5WmFsVzV1RllWbGkrZGRMcUJoVnpWMHAxMXR5NFVEcS9uZXB0?=
 =?utf-8?B?NG12Q0tBNWtKRGpsSlZPSzhSbFZ5TDZsdTY3Qk5qVHpGU1BKV0hzSi9sK213?=
 =?utf-8?B?cUU3elA3TXg5U2RyUmhKRExMWUNqTHlLUkJYWVNBbWd5a0pFZnhpQ3BBcU5X?=
 =?utf-8?B?ODJaNzdlc3pMVW9md2VQTEp0ZkNlWHdOMzFIdkU1UXQ0Vm0vNDkxcWVLOSti?=
 =?utf-8?B?c3RTS2tWUzdDOFA1N2hJYnhXUFI3NjBGRThLQkdlaTU2cHYrNEJIRTRIM0x4?=
 =?utf-8?B?ZjgwMXBOZFFXNkhzdUp2a2sxTFNPZXVydWFCa2Fzc09VSlo3cUJGRi9XV1Rs?=
 =?utf-8?B?em8wNWdtS1BrTzRoYTl2c1ZLNmhCcDZxb05Ga1Z6VnpzRGtVejg3VWExUnp5?=
 =?utf-8?B?bjN2bTdUSGVKaGJtL3J2VFFQbUc1S2Q5b3FSWEZBekRma2xiYkJUVXRnQk9x?=
 =?utf-8?B?ekMwNVczNVdMVUtRMXh1WjZyRXF4K0NDcG9Rc0ErSVl3VWIzYXdSa3Y0NGlL?=
 =?utf-8?B?VDhFSGIxR0JhZlVBYlBnUzlPdkZWNkN3WlQxakxIN2liR0xTeFZrUlhKdzdz?=
 =?utf-8?B?MUhsaFh3R3h1am4yYStxMFpVM3hSNjhMRjJUajRuQWpERTd6dksrdmlrSHJK?=
 =?utf-8?B?dmV6R29iY2lnOENlR0RWWU1KRGlJVDhRNlY5TTNnZXBMbFJsWEJOeXg1NHRa?=
 =?utf-8?B?ZEd4WUp0LzVVRWpTc2NVRmpaUjBWWXpVWU16MXJ0N1dyOWMydjlFZ1N3eC9M?=
 =?utf-8?B?N0FXcUMybnBwU1ZtTlNTMG84ZFBya1VxRCtBV1llZWRaTGNDOWpKMUwrb3Fw?=
 =?utf-8?B?YkdLNFp3ZUtGSjNmRjBZT2UyanB2UmJtWUNWR3pCTFJqdHhQaEpQMTN3NUgz?=
 =?utf-8?B?WlVyN2NPRnNqemFTMmZuZTVoTi9NQ1kwaHhGcFNjRGVKYU1FN3FVNGpjQzAy?=
 =?utf-8?B?YmFpV3ZHemJnM2MxdS9OOWhKZ255amcrajVDUHlxbVVSSlJNZTdOTEtPR2hM?=
 =?utf-8?B?V2pIQ3Vpd2wxWk9Xa1ZWeHVpckhSOS92QlJhVzg3NjZGbENSM29yRkdjcDRY?=
 =?utf-8?B?TzJhcUYrd00vTkNmMWRqVk5EUUZYOUttU1hlSDRDMVZIblNyQTJKbzVvdGww?=
 =?utf-8?B?a1FGN3BzcE1MQ2lseWJMQnFuTHhudjNKaGZ5Uml5ZG1WVnl5azlBSC9NZTZt?=
 =?utf-8?B?d2tvcnRpZjFMdUFHN2NDY0QxQmVaTEFJSi9NQ3p1eCtRUjI4RWVjSXR6cXZq?=
 =?utf-8?B?RDFsdmY0RkhsbkJ5UEdxRXMzODk4VDl5cFRXeGNubzh1bWFwekNkRUU0ZU81?=
 =?utf-8?B?cGpUZldlQ1BYcUNzMXduNi9TZFh4c0dldUk3bkVhRk9iOXBZQW9NdkVlQ25X?=
 =?utf-8?B?cHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D88FC9C0B5F05F43A6669E7A279B279E@namprd19.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: cirrus.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR19MB5688.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f15d6b66-b1bd-49c0-af19-08dc5fd1525c
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2024 17:59:41.3752
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /wJONKxBS0FCotV+jL6MBb6wgjaJD0Thq077+HEO9xmaDFLjhAqIV1OCp6zk4tLhxfyIxxSNux1sdZTieSwjN58fTjTj1ECe2w+nTidmOnY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR19MB5025
X-Proofpoint-ORIG-GUID: mLnnwWhzUG8Z55gL8g1SxKEPmfY4PSaX
X-Proofpoint-GUID: mLnnwWhzUG8Z55gL8g1SxKEPmfY4PSaX
X-Proofpoint-Spam-Reason: safe

SGkgTGVlLA0KDQo+IE9uIEFwciAxNywgMjAyNCwgYXQgODoxNOKAr0FNLCBMZWUgSm9uZXMgPGxl
ZUBrZXJuZWwub3JnPiB3cm90ZToNCj4gDQo+IE9uIFR1ZSwgMTYgQXByIDIwMjQsIEphbWVzIE9n
bGV0cmVlIHdyb3RlOg0KPiANCj4+PiBPbiBBcHIgMTYsIDIwMjQsIGF0IDc6MzXigK9BTSwgTGVl
IEpvbmVzIDxsZWVAa2VybmVsLm9yZz4gd3JvdGU6DQo+Pj4gDQo+Pj4gT24gRnJpLCAxMiBBcHIg
MjAyNCwgSmFtZXMgT2dsZXRyZWUgd3JvdGU6DQo+Pj4+IEFsbCBmZWVkYmFjayB0byBkYXRlIGhh
cyBiZWVuIGFkZHJlc3NlZA0KPj4+IA0KPj4+IFRoZXJlIGFyZSBzdGlsbCBNRkQgcmV2aWV3IGNv
bW1lbnRzIGxlZnQgb3V0c3RhbmRpbmcuDQo+PiANCj4+IEhpIExlZSwNCj4+IA0KPj4gQXMgYmVz
dCBhcyBJIGNhbiB0ZWxsLCB0aGUgb25seSByZXZpZXcgY29tbWVudCBpbiB2MTAgaXMgZnJvbSB5
b3UsDQo+PiBzYXlpbmcgdGhhdCB0aGUgTUZEIHBhcnQgbG9va3Mgb2theS4gVGhlbiBpbiB0aGlz
IHJlc2VudCBzZXJpZXMsIHlvdQ0KPj4gY29tbWVudGVkIHRoYXQgdGhlIE1GRCBwYXJ0IGhhZCBu
b3QgYmVlbiB1cGRhdGVkLiBJbmRlZWQsIHRoaXMgaXMNCj4+IGJlY2F1c2UgdGhlcmUgd2VyZSBu
byBjb21tZW50cyB0byBhZGRyZXNzLiBQbGVhc2UgY29ycmVjdCBtZSBpZiBJDQo+PiBpbnRlcnBy
ZXRlZCB5b3VyIGNvbW1lbnQgaW5jb3JyZWN0bHkuDQo+PiANCj4+IEkgaGF2ZSBhbHNvIGdvbmUg
YmFjayBvdmVyIHY4IGFuZCB2OSBsb29raW5nIGZvciBvdXRzdGFuZGluZw0KPj4gY29tbWVudHMs
IGFuZCBhbGwgb2YgdGhlIHJldmlldyBjb21tZW50cyBhcHBlYXIgdG8gYmUgYXBwbGllZC4NCj4+
IFdvdWxkIHlvdSBraW5kbHkgbGluayBtZSB0byB0aGUgZW1haWwgd2l0aCB0aGUgbWlzc2luZyBy
ZXZpZXcNCj4+IGNvbW1lbnRzIGlmIEkgYW0gbWlzdGFrZW4/DQo+IA0KPiBBdCB0aGUgdmVyeSBs
ZWFzdCwgeW91IHN0aWxsIGhhdmUgdGhpcyBpbiBoZXJlOg0KPiANCj4gICAgLyogSWYgd3JpdGUg
bmV2ZXIgb2NjdXJyZWQsIGRvbid0IGJvdGhlciBwb2xsaW5nIGZvciBBQ0sgKi8NCj4gDQo+IEFm
dGVyIHJlYWxpc2luZyB0aGF0IEknZCBjb21tZW50ZWQgb24gdGhpcyBiZWZvcmUsIEkgc3RvcHBl
ZCB0aGUNCj4gcmUtcmV2aWV3Lg0KDQpJdCBsb29rcyBsaWtlIEkgdG9vayBzb21lIGxpYmVydGll
cyBoZXJlIHdpdGhvdXQgY29tbXVuaWNhdGluZyB0aGVtLA0Kc28gbXkgc2luY2VyZSBhcG9sb2dp
ZXMuDQoNCkluIFY4IHRoZSBsaW5lIHdhczoNCg0KIklmIHdlIG5ldmVyIHdyb3RlLCBkb24ndCBi
b3RoZXIgY2hlY2tpbmcgZm9yIEFDS+KAnQ0KDQpJbiB0aGF0IHJldmlldywgeW91IHByb3ZpZGVk
IGFuIGltcHJvdmVkIHBocmFzaW5nOg0KDQoiSWYgdGhlIHdyaXRlIG5ldmVyIHRvb2sgcGxhY2Us
IG5vIG5lZWQgdG8gY2hlY2sgZm9yIHRoZSBBQ0vigJ0NCg0KTXkgdGFrZWF3YXkgZnJvbSB5b3Vy
IHBocmFzaW5nIHdhcyB0aGF0IHRoZSB1c2Ugb2YgdGhlIGZpcnN0LXBlcnNvbg0KcHJvbm91biDi
gJx3ZSIgd2FzIGltcHJvcGVyLiBTbyBJIHJld3JvdGUgaXQgaW4gdGhlIHRoaXJkLXBlcnNvbiwg
YnV0DQpzdGlsbCBpbiBteSBvd24gd29yZHMsIHJlc3VsdGluZyBpbiBpdHMgY3VycmVudCBmb3Jt
Og0KDQoiSWYgd3JpdGUgbmV2ZXIgb2NjdXJyZWQsIGRvbid0IGJvdGhlciBwb2xsaW5nIGZvciBB
Q0vigJ0NCg0KSXMgaXQgdGhhdCB0aGUgcGhyYXNlIOKAnGRvbuKAmXQgYm90aGVy4oCdIGlzIHRv
byBpZGlvbWF0aWM/IElmIHNvIEkgd2lsbCBhcHBseQ0KeW91ciBwaHJhc2luZyB2ZXJiYXRpbSBp
biBWMTEuDQoNCkJlc3QsDQpKYW1lcw0KDQoNCg==
