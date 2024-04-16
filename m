Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1D312C550
	for <linux-sound@vger.kernel.org>; Tue, 16 Apr 2024 14:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713277058; cv=fail; b=pZB9F1XPNnLxF65aJLa85m4/9mEV4m205/LpLmcxLx9+5CPEKiupZXkmFBEWqMjnZ25j3ZMt1Ho6I/tAE0BqjiMyhETzGLtuCZKDhvYYFeuUF0gShiEPkPRzWsmsScrSaomqg6kHRPJnF2BuU0yy234T4ClhVaKc6qyXfO7SYF8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713277058; c=relaxed/simple;
	bh=Cc9WVqnFzhBjG9vxBjIlY31zIuRePH4UrTW0Bo68urA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iKc2AxFFpnI+PuS174eCK/7Q4UykbbYsYHm0ZUvqLkO1okAB/CbNHWreN1TYJU8ssFRRYxzE7nkXjnzuukCFRd7F+YeY2x+P7qsz7vVB4TXO0bKu1eIfDVDFCHj5TT2h8ImJucpeyX0qA45FaXcZ6uGKIjSZtujG9q/vCyo7L90=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cirrus.com; spf=pass smtp.mailfrom=cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=q2ixQdYW; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=slMjtVe6; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="q2ixQdYW";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="slMjtVe6"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43G6urHO017822;
	Tue, 16 Apr 2024 09:17:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-id:content-transfer-encoding:mime-version;
	 s=PODMain02222019; bh=Cc9WVqnFzhBjG9vxBjIlY31zIuRePH4UrTW0Bo68u
	rA=; b=q2ixQdYWA+IdYk1OI7QKlJYM19eqXhMCYEk72UQLqRDlvMV3uLkohg/Fu
	Xy28RNvE6eYsa/J14U7SLuspJKvvNY/tSJIB5/kSu8jBgpW/qBwAgHKAgKLvfnbL
	UohHTnJ3vYglJ/tXKoQ7o4SY9y2xEOVAEGlekMsvhcWpFLqOCS5WzWQXoL5izcsY
	E8x93riP/I7WC70aYKLqieTyxT4z2E8PEfohSP3oc0JQ5Xn3FWw9iw9txrZGNI4o
	w0yWJwP6ytAoB2VrA3YkauA/7nIOANgO231zq5d5rkbhXVR0rUzt/fnYQQxG4j0c
	gXPCCjZlbYDzHDU5J4iE96qCDQctg==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3xfqeyaktu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Apr 2024 09:17:18 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RQn8uNXSQ9l9kgUgc0yq2m1riwNPVuFktUBHTh1od06uwnL82L495xY3spwLniHkvLmDgAS4bP3VkFkX8Sw8cJdvrw7tJ5fb4BJKFwY/zN2MqFbk/RmZTC00Sn5Tw+4tgGNolEkfsqAvngWgrwM5OEo5ekS+c9NLDpM/G0jKE6zFZSIaDOHjDsP8lqzwoe1KZBwtm4J6d8sPo8OfWVm85pYVGx6wgz2cLtRW3ZkSWiuz/THofMcxkPbcwrxoduWRlBGkSPNWNk2cGl8lnmOsx2H1rJL5VfVXPJklP41RavR2CPusqupe3CZlljKoi7rXanWxGA7kzkoo4R77+SR7yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cc9WVqnFzhBjG9vxBjIlY31zIuRePH4UrTW0Bo68urA=;
 b=KrpPsvSvVFNHnyrRcN3dj7pYmRRF7NzCFyVxN3j0QfxP3ABWWW06V4B9ceNEegsSyfd6yrzFb0clFMis2H2CRqxS0+9LP6bkdnlyzAdLzOjoUiLdS+5wRnqfxQfHOHm8az594wBZ+DDCGFFw0DsyYE/KS+QCRgJ8sQ/HgXC5cdRf0sPA4PRmn/ecKF7bSBTfCSce3rHh3MprONPavIaTf2bfcc3Pav9BP8PqiTtjCp7D30zdec8hH8SMqoQzo333jELQ44uD+7osGSpWRPpcvAP2qoDNo4xjgiX3/WM+J8zdiRz9MSl3ZbpYr5RovsolYv3IjgnLhXm+CbB4JnqK7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cirrus.com; dmarc=pass action=none header.from=cirrus.com;
 dkim=pass header.d=cirrus.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cc9WVqnFzhBjG9vxBjIlY31zIuRePH4UrTW0Bo68urA=;
 b=slMjtVe6jYKKcWOyOgV11uxbli6/5gveRbHWZY2d7gcNJW4T+m/MA3qC1Vm7mWiro5BSCBGyEuXg1Vc2w9IOayTogRHqIJyOdn052mO7nBV9dR+rBDiuUXR/zbbm62e7VyDxUkbrPD8hx+D3EL+YnUKDjlCN7zvWlKv6L4by/U0=
Received: from DS7PR19MB5688.namprd19.prod.outlook.com (2603:10b6:8:73::14) by
 CH2PR19MB4024.namprd19.prod.outlook.com (2603:10b6:610:92::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.50; Tue, 16 Apr 2024 14:17:15 +0000
Received: from DS7PR19MB5688.namprd19.prod.outlook.com
 ([fe80::8329:dcb9:4d7c:df1a]) by DS7PR19MB5688.namprd19.prod.outlook.com
 ([fe80::8329:dcb9:4d7c:df1a%2]) with mapi id 15.20.7452.049; Tue, 16 Apr 2024
 14:17:15 +0000
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
Thread-Index: AQHaicoHNR0TZU5ElUi1zSJTLRH+QrFk3KaAgAYE9YCAABxTAA==
Date: Tue, 16 Apr 2024 14:17:15 +0000
Message-ID: <F90648F7-BE0B-47DB-89C4-A8C91CD65D59@cirrus.com>
References: <20240408153214.42368-1-jogletre@opensource.cirrus.com>
 <20240408153214.42368-6-jogletre@opensource.cirrus.com>
 <F09C19F7-F3BC-44A8-B3F8-3064DF8E666F@cirrus.com>
 <20240416123541.GW2399047@google.com>
In-Reply-To: <20240416123541.GW2399047@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR19MB5688:EE_|CH2PR19MB4024:EE_
x-ms-office365-filtering-correlation-id: 3ab5e7c9-5cbe-496a-faed-08dc5e1fea7d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Aex+EclzcqKTwoUU9VHHhLqds9oK+D0pU3/L3S40Cfm18mrpFhvMNz0yOWHY4IpChysTugNtoya2MVGSGhcirs+IItWCY+Jd/7sOyVymS+7f+Du0MXV1+TBXkuuDAO/QGxHEzgelarbXOEaogCuG+ezAABUxtMcQY7TFbgTgOLKEG/zLzz+E1BkLnk7zZBY74g4F5Feq/DNnbAFBH9kcvFq+gDXYQyQUPXBBtDdY5Hpt1gaqiSDSqG79sjUeX9KpTFpuXvTv4jOeNOoGwLhPQPOukMFLWWETejkA1absS6vTVA/qii/WFlKopW+5MyvXzXWRvE+g6s4eDWdqxSYtHPp3m06XF/VWueN/TbVi9UfAJhZp3aqajZ+oNGGdFS4/s1mCud2JD4qT7S8Sc3cFSc4folLs4OzUPOskTsHJYmi8rweBQBFDMw4c11zS4u1MVRaseGro8IaoONq6uY5nRZwvCi3fCsRRa4zrSMb3stLZmqD+my0SMY1UUExibcK6S9qRnKV1x9sS+3oIwY+XTy/8zSXnOVg+1+Uw/huJZs0pbRjQFrAykZMfaMQzGl/IgXnA4zmVZTgC+289F2qc85GeMwEfUKufOx08gjzLOqGwY+9MTUACBeuP/SmZJH56Ruv2OCrp90dITVqLheIxwbmD0e6wrJ5E4CrG4LHpISvxYlMj++FiNaU6LDATFFeCwcH71WL++621N6sKmKdM9KHeAvfaHb7D9QmYUUJ/b8o=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR19MB5688.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VEZ0OC9ab2VwNGxWMjZCWW1ma3NoTFJVUi9YMDh6N0ZxZWkrNENueE9SUkZH?=
 =?utf-8?B?MDJkRE9NQlF3elVVeGYyM2lKd0RyUjI5RUhZYmtVT291MUtSWHRYUGtGN3JV?=
 =?utf-8?B?dkdwd2JOeEhTRXpEM2taWUNnUFBKanBMck1kTFVFSTlwTHhCbC9CV2k3L05V?=
 =?utf-8?B?OW1MMlQrYnJiYzE4a2phSDdUWW1MQ3RVbSsybmdXbmRNV2Q2VVZITnQ0VElx?=
 =?utf-8?B?YmVWTmc4MWd6SGNJK3hYdkFSY2tRZXNoSWNNU1lHd292eEJERHRwY3JDYXpu?=
 =?utf-8?B?dWRCdjZ6cUZyaytCc1pjdlpKd2czek91T3g0L2hRSE5LcjZ6NlFHM2pKRmNr?=
 =?utf-8?B?N3BnWjJBR1laamd4cDUrR3R3S0x1Z243VlQ2K0JsNEo5am01SEJHWU1ZMHBF?=
 =?utf-8?B?QUwyR2t1NzFIYk0vdEliK3U4ZWNYc29LMWVvZ0h3a1FGT0VVbUY2am5jV0cx?=
 =?utf-8?B?eDEvUWk5c2NvbVdxZ0RSNzRDRXNBT2h6NFFkQkNUS052NStyRkRFTlNxK1J0?=
 =?utf-8?B?S1QwOU00NXBnMDVnbVNBdkEzYk91RXJHWG84QmFlWFUrSnBYbVFqZWwrOThJ?=
 =?utf-8?B?VGM1cCtPaVA0ZGlVejBOVFVPZEM2NUhiTjd4b1BIalhXQ0JER0FRd3Mwd1pX?=
 =?utf-8?B?UHU1eFUrUDJKazJ6QzlGdW1seWx6U21RTWt3cC9LMjBuZTNmZGlkK0VtdHNX?=
 =?utf-8?B?TUdiRklER0R3YXZhb2JxV1JPSStadFNaZHFaajhubGJTdkdBTmYveTRWVVVL?=
 =?utf-8?B?MTVsT2lCcE1HQ0tlOGg0N2RtdWtMRlRHbHhnUjJoZzVmdlA1OGd0SUNwL0VC?=
 =?utf-8?B?SU8zL2lCMDRFSGwxZFhTQndObDdOQ1BNWVhuRXdRNnBZL1MySXBQNkllUjd4?=
 =?utf-8?B?ZnRUTTBNV2FBaHU1MUpLc1pZd0hTR0h2UDlKT01KeGJIS1dMWTQwdkJKcCt0?=
 =?utf-8?B?SDFuekFmUWU3NEpsME8zVHlSNWJQVEtNeUdmOWtLcTdzdU5wMjRscVN3UW5w?=
 =?utf-8?B?MmVXWjBMc3lkaVhIaWVCOEN6bVJGWHdIU1Qwakd3U3BhT21ONnk3bFIwbDBu?=
 =?utf-8?B?QzZtUXQwd0hZS1JYMjFkLzN0YWUvTUJXaWJtUnpCTWtWVnNJZ3hMYm12K0xZ?=
 =?utf-8?B?dU9JVmdUajEzMVhkUUdya1puUmtvSSszb3V4QXJ2aTRsN21OckpDdENFNVlS?=
 =?utf-8?B?ZHpOOGVHL0hPeVd0Ry9hSEl0eFloOEtha09kK05LcWgxK2NDZE5odTM0UVFZ?=
 =?utf-8?B?dXZ4U0FvN1c0U25reFdmT3NPekloeUNLODUrR0pmMTFCSGZTbEptbVhZOEkv?=
 =?utf-8?B?NjBsQ2dFOVY1RFE0YTEvKytOYjIzL0ptb2IvTjZ1Rm9ZNzFlaUdzNDJlcHFI?=
 =?utf-8?B?dEdhckU0SDR6cGR5SC8wR2hCTmpJRW1nK0RUUHk0VkFmdDQxTVAwU3oxQnNM?=
 =?utf-8?B?c1BVWnFXZWkyU1h6QTdOejFManRiQVJzZnRvWnpBTkI0QjFUcWY5YVVOeXR0?=
 =?utf-8?B?dy80cE9PWFliUEF5QklibUtieVVlNDhtNDFXcHNubkMwYWlQWnZIdDBPM1FV?=
 =?utf-8?B?MDhPckwwVExSbjhLVXlKVXEwTnBnNzZkemd2NnBRVlErMy9lRzhDcVFsV0ds?=
 =?utf-8?B?ME5DWG1SNlhqNjBtZkpqRGxvN1Z5bSt3QjFPYmRTTHdGR0dBSmd5ZVFDRDR0?=
 =?utf-8?B?dnBVMGFZRGoyZ2I5YXNqSDNJYThmUTlray9Ublg2Vi9TUHJYa2hnOHVmVm82?=
 =?utf-8?B?QXQ1aHFqYWlzUVZoLzJ5NVFPSUpPWTJaN0djUmhqU1BvZnR6Ty85K3JmN1Vz?=
 =?utf-8?B?eGFBdm4xYTZhaWFOeG1CRjdzb1BTcWlHYWd0L3N3L1dORGFmMkluUGlzd2xn?=
 =?utf-8?B?cjA1TTA5VjJmTUgwVFRFSXFQdU9WQVN3R3NUVHArRnRYaEtXdDhzOUZEZkNa?=
 =?utf-8?B?MzZLOU8vdHhJazRITFY4V3lYaDR6c2ZiUk9YeTd4Nzh0ZmtYM2pBK0xseEFs?=
 =?utf-8?B?elk1dVFsK2VpRWRDb3FxNHBUOGwrUlRPa3k0cGpmTk9CMmo1cVhNTXNQaXIy?=
 =?utf-8?B?ZExQakxDNG5xbEY2bldSWEFNMzBPWU1OUTRyOUNDR1dRZG42ajI4OTRBYXpE?=
 =?utf-8?B?M0hoMTVYODdsK1NhK2Z4czJHdXJOdmtpR1pyNjgyY1U5QmtrZHE4L0tpUDlO?=
 =?utf-8?B?S2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <09757D91C9638D41B6D79E96EA8D755B@namprd19.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ab5e7c9-5cbe-496a-faed-08dc5e1fea7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2024 14:17:15.0716
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tIh6CdiA6iLkowwKTgpQpbAKnU8Xa66u719EogOYIlqb52xJh+ES5sVwdylBxDoiVBFmQ8W8fUAs6zzrp+jDFXebSAPx0a8856apmVyXqqg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR19MB4024
X-Proofpoint-GUID: 2b_Fh371MNN7KTg1tEYg1VXqkrFf4-zV
X-Proofpoint-ORIG-GUID: 2b_Fh371MNN7KTg1tEYg1VXqkrFf4-zV
X-Proofpoint-Spam-Reason: safe

DQoNCj4gT24gQXByIDE2LCAyMDI0LCBhdCA3OjM14oCvQU0sIExlZSBKb25lcyA8bGVlQGtlcm5l
bC5vcmc+IHdyb3RlOg0KPiANCj4gT24gRnJpLCAxMiBBcHIgMjAyNCwgSmFtZXMgT2dsZXRyZWUg
d3JvdGU6DQo+PiBBbGwgZmVlZGJhY2sgdG8gZGF0ZSBoYXMgYmVlbiBhZGRyZXNzZWQNCj4gDQo+
IFRoZXJlIGFyZSBzdGlsbCBNRkQgcmV2aWV3IGNvbW1lbnRzIGxlZnQgb3V0c3RhbmRpbmcuDQoN
CkhpIExlZSwNCg0KQXMgYmVzdCBhcyBJIGNhbiB0ZWxsLCB0aGUgb25seSByZXZpZXcgY29tbWVu
dCBpbiB2MTAgaXMgZnJvbSB5b3UsDQpzYXlpbmcgdGhhdCB0aGUgTUZEIHBhcnQgbG9va3Mgb2th
eS4gVGhlbiBpbiB0aGlzIHJlc2VudCBzZXJpZXMsIHlvdQ0KY29tbWVudGVkIHRoYXQgdGhlIE1G
RCBwYXJ0IGhhZCBub3QgYmVlbiB1cGRhdGVkLiBJbmRlZWQsIHRoaXMgaXMNCmJlY2F1c2UgdGhl
cmUgd2VyZSBubyBjb21tZW50cyB0byBhZGRyZXNzLiBQbGVhc2UgY29ycmVjdCBtZSBpZiBJDQpp
bnRlcnByZXRlZCB5b3VyIGNvbW1lbnQgaW5jb3JyZWN0bHkuDQoNCkkgaGF2ZSBhbHNvIGdvbmUg
YmFjayBvdmVyIHY4IGFuZCB2OSBsb29raW5nIGZvciBvdXRzdGFuZGluZw0KY29tbWVudHMsIGFu
ZCBhbGwgb2YgdGhlIHJldmlldyBjb21tZW50cyBhcHBlYXIgdG8gYmUgYXBwbGllZC4NCldvdWxk
IHlvdSBraW5kbHkgbGluayBtZSB0byB0aGUgZW1haWwgd2l0aCB0aGUgbWlzc2luZyByZXZpZXcN
CmNvbW1lbnRzIGlmIEkgYW0gbWlzdGFrZW4/DQoNCkJlc3QsDQpKYW1lcw==
