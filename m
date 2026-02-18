Received: from mx07-001d1705.pphosted.com (mx07-001d1705.pphosted.com [185.132.183.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1328730B514;
	Wed, 18 Feb 2026 17:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.183.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771437533; cv=fail; b=ok10l4oFZ+XplC/8G5tqvpUjXUvzNIxGCepQ+xnMdU4PWRmInn1TyJIuG5W5c2mWG1TEWBi0t9NMsIbjMtfU8XGACxkWk/GVX+5qkVfuoN8IyhAGDU3iyP3LnEbpZK9ySeMFRTTIf4lNGttg6AJW3mO2iWC02e1c3XG2nNvHTtM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771437533; c=relaxed/simple;
	bh=7XegAXNUiB/xh/XktsSO5/qQEZYiCAMJuqbuPysmiug=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=W0zlzDX8ewXc7HmiKq5QNN2cKFkxXaZfyrJS4Xw9BZpNBcTZMEuaF4jSzqe4MGzIRj7jvwDa/joq7pF+dJRJqWZrB/ilDXEjXNOnJVYCjpUqJ2a9/D0hqbUpH7SuIsyj9le8ii0D0jhd0LOIEypvyq2AwMhKg677Eyr4cvIaly0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=kZAZqOFx; arc=fail smtp.client-ip=185.132.183.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="kZAZqOFx"
Received: from pps.filterd (m0209327.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61IDB1jM2153743;
	Wed, 18 Feb 2026 17:56:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=S1; bh=7XegAXN
	UiB/xh/XktsSO5/qQEZYiCAMJuqbuPysmiug=; b=kZAZqOFx/8Z2mOubqTzR6DY
	m5OJieXpx3XHTfqzEXPf0fsa2wEGAmfLSJ8UtZoawcNxH9BYwXWxsdbGcST0eT5s
	JjtezMcoQi3OkVMYYxS8WQ2OwQ2G8k9WI70MR9nWbxbvZ+9G0Ge62dy4VYq8gLPX
	LMMJMfuaCNkdnpdECOTbMAxaHwhSD2sl05YbH8xjIzhS10bB1Ub0Shy1q2Bal5YR
	Fbqn/Cy9CBhbQf2QqHmrl+CudH/8gpTTYoHjJJutn7lUITnNa/gGZT4bMTFzdHri
	1PEy+7nulupU9wSriE7bBWoFkPeDMdemVnTmnUPG2pt4YwJ8DahyJYhQ4BjdRrg=
	=
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011030.outbound.protection.outlook.com [40.93.194.30])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 4cahxqd3rm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Wed, 18 Feb 2026 17:56:16 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ey0fsX6eQsqcLCiIT56MvzKhNFcQXJowrRM4TEFPcMgeY2puO92/2rvUltTk3/jAi7wzDn1K4JFt9w7g0oN3kgqOxMiXYdqRnvCFLqzJ01mBdKi/ethvMDTcbGD2MwoRqCUYeypAVKIwnKOQgrFqIERlK5cMSABSt9aR633QhiGVBZdOex2JJC+NtV8HB78vlSagO+HI8LgIs68hQ/PbJLJJ6KpySY9x1aVO3WIGOGEO9NE4g8jEq23wHjAyUOdLtQ82FuOb5Dt38D8QYbleYMvyXeC1oIC0TZnNZ5FHRcRRnlTUqrQSuDguM3KJ+myrgANekX0KTWlFsDxSA4cpSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7XegAXNUiB/xh/XktsSO5/qQEZYiCAMJuqbuPysmiug=;
 b=GyjsAXF9QrVKGVXPd6gtzD4C91kt5HDgCbFsxUKX/TZxvNDCZDB0gGxpYF9/9TB0sqKO+Mz/WWkFeAaaSNIjEEGc95aDlzIgDaOS1C/SvpVi6O4joy2DvsF0B5w+pA2jTipiEEegIcpqZ8uxsuYJj+oNk/RSUWaFQgJkoC128IUuks6c6jzB+WM4EDgFKFovUS7L057LPVgiu6hUYl8L68/pOV2xabLxH9+EQ1L64EWOF5h3nfeZenYsSOmrHaitpPWhkjAzkQ0GUHTLiqCrNxJEHTkxj/eRDGoz4QpInS8/3MtHilTRWPoSj4k0z17BjP4aTGBLtXkXeHamIkViuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from MW5PR13MB5632.namprd13.prod.outlook.com (2603:10b6:303:197::16)
 by LV5PR13MB7569.namprd13.prod.outlook.com (2603:10b6:408:363::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 17:56:14 +0000
Received: from MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::29e9:b355:cabf:66f1]) by MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::29e9:b355:cabf:66f1%4]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 17:56:14 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: Richard Fontana <rfontana@redhat.com>
CC: "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
        "clemens@ladisch.de" <clemens@ladisch.de>,
        "linux-spdx@vger.kernel.org"
	<linux-spdx@vger.kernel.org>,
        "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2] ALSA: usb-audio: Add SPDX id to midi.c
Thread-Topic: [PATCH v2] ALSA: usb-audio: Add SPDX id to midi.c
Thread-Index: AQHcoGcCjt8tENTRF0+9MjJJddJTV7WHpyGAgAEV1GA=
Date: Wed, 18 Feb 2026 17:56:14 +0000
Message-ID:
 <MW5PR13MB5632F4E211F1610DAFDB1E2AFD6AA@MW5PR13MB5632.namprd13.prod.outlook.com>
References: <20260217234124.242053-1-tim.bird@sony.com>
 <CAC1cPGy_ZK3=F9ZY6P+YPSuAzEAp3XGewwrQUE1MJ+=3jh18DQ@mail.gmail.com>
In-Reply-To:
 <CAC1cPGy_ZK3=F9ZY6P+YPSuAzEAp3XGewwrQUE1MJ+=3jh18DQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR13MB5632:EE_|LV5PR13MB7569:EE_
x-ms-office365-filtering-correlation-id: 6a8b9393-12a4-4339-60ad-08de6f1701fd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?OHBBL2F4b1hUNTZGbkZSZllRa3I4VlI3WC9pTmw3NEMyZERDMnE0MmErelFi?=
 =?utf-8?B?aFNVWjJ0Y2p5OFZYUWJvS2ZKRXBGNnN4dEN1bWZvWjR1TVNoY3Z1Q1I4TFFG?=
 =?utf-8?B?VE1hemhtWVo5aU9uU3BWSmpNV0pzWHRzYXdXU0l6eUt4UzVwRGNPOWRRSXBi?=
 =?utf-8?B?SnM4OEkzeGZRdWVGNmszSUtMa0xrVFF0R1phK3ZVMEN4YUtNc2FITkRLZ3hG?=
 =?utf-8?B?bHFkOGpQUzBrZVhwZG9nVWJUTytEZURYNDBqTWxHemg1YkFveWdMbnAzWDNP?=
 =?utf-8?B?NmN6UFI2NGVVOHpLU0V5NldHM2xhSGQwZ1kybDdyakFrbEQvdzRqeExVbFBw?=
 =?utf-8?B?QmlHcnNGaGRYUUFUMC9hT0pxSFRQNmY4T1VOclpUT25aQ09LTmVmSGxyNVZT?=
 =?utf-8?B?QXFRS0sxRHVwTE1MbFVkazhmdU1KdVFjQ0t6SFN3QWRuZWZIVDl5UlhMdytS?=
 =?utf-8?B?NHdMZlZWR0dlZWErZndnT1E2WGlwQ1ZHYVlPYnBjODBEeThyYkVsckl6RXd2?=
 =?utf-8?B?aE9wS3JDaXdSbmt6OXcrbUZQL2tCa3JwYk9BM2xEZDRyN1p1a2ZCeVRkdkVG?=
 =?utf-8?B?NFdiMEdDWlFkR2xOVXExc3Bub1ROZTJENmkrU2dyZHFqc1I2aE1GT0dJK2Fi?=
 =?utf-8?B?eGtCOVRGT0tMQzQ2NDVIaU8rdDFoOG1NMnk2dkgvd2xqVmZMdVpHVC8wZ3JQ?=
 =?utf-8?B?NExxRXQxbVdxNDNUY29xYUhha2MvTEdxTVJzOWx2MlVWMUtRVUFxU3dMZFJB?=
 =?utf-8?B?c0JkWGhnaGtDM1dUeGcyU1ZZUEYvQnYvYjZSMHFLd1Y5WEIzbFdJUWdNUS94?=
 =?utf-8?B?N0tqTWU4bnpkZk9VVXl2T3VCM0oxM29ZYm80d1FpTCsyMFRMVVFNYUdhZFVl?=
 =?utf-8?B?VlhqNStaZzlHV0RPZitPVVJGck9tQ2VsL2IvaUNOQUZOQUl3a0xkVUxNaDBT?=
 =?utf-8?B?Qk02bkViN0VRTUgxWU8wU0ROeXVKWXI2MVJIcmM5ZlNrL0p4RmxvL3lodmVl?=
 =?utf-8?B?Sm5OcUtLNW5yTTAzL21ac2Jyb0FXMUZQWi8zSFBTMDFsYmVFYnZ1TjhaVE1k?=
 =?utf-8?B?Q3Z0QysvbStJUTM5QWdoYndFZmNmNzJ3MThZdXBsSGd2ZStHSXcxbXh6bFor?=
 =?utf-8?B?VlBtbjNoMkRISG5UUGlHbzk3cVFBTkJmWmljNTRuVjltY0Q4RCtZSjdyL2J1?=
 =?utf-8?B?WTBRak93aWc0bVQyTnFkb1JRM1hsZXZrZVZTMGNxQVlCUFRnUzN1Y2xiTzhH?=
 =?utf-8?B?Rk5uczVwMG1qbXhpM2ROb0NaNlNkSXIxOERvNXZ3WUxDRk5ZNXJlVFJSVERu?=
 =?utf-8?B?YUkyUDljZUh0eXNhc3R5WlU4SFBJN0diVnlCSFpBUHI3a3NrYXRaOFNVTUZW?=
 =?utf-8?B?VEhPR2s3d1kwZ0tjTFRCVHZTRW1URVZ3VXZWU0ZLbzRLczRwT21VQkVYdUhT?=
 =?utf-8?B?OVZFMHdyOHV3RTdwTVNqL0RHeitEc2VHMUFpTDVvN3RnRkk3cU1iRk9ibWxX?=
 =?utf-8?B?dnpmQ1VVR3hRT3hoRTNBZUwvV3lBWnZmclh1azRYUUFNWVV1Y2hCUm40Tytn?=
 =?utf-8?B?SzF5QndTM2E2S25kRmQxdzQ3ZVlKVERhTWVnMnk5TmREOThmQ2cxUDVqVzNW?=
 =?utf-8?B?R1hFTExFVTZYY3Y0UGd4cnJQUmhCbklFVGlYQzVuQ0M1SVJtVUhJZEhPc0xu?=
 =?utf-8?B?WnJ3dy85QlIrT2QzNXBTcmhmblVZek1xQTJUTGlhNHJNcDJYZ1Erc1NzazVZ?=
 =?utf-8?B?NHZkY0VlVjdKTjdpNC84YXJGMzMrMkt1bG5ielNxK3hVa1M4anJrLzFIOW1j?=
 =?utf-8?B?QjJwOUNqSUNZazN0SUVLeW55dkVkSmVQOFZCYTlhZE54RkNnTy9zQkJINGpr?=
 =?utf-8?B?L2xrNm1EMEx0aTUwVDY3QTdaM3JnWTlrbjJRT2paSUFMNEVVSWRsUjZMMm5i?=
 =?utf-8?B?MElrSnpMd1ZRdS9vc3hCdE1yQm1taCtJYmM4bDAvMmN5L3lCVlptM2VycTEw?=
 =?utf-8?B?WXc0dzNKclNGZnBLNEVkT1N3eGpVbWJoUzMrS0k3VmduRWR0aEwvRWc3UXBq?=
 =?utf-8?B?akV3OGVDUXk3TTRFZVBUQUZDUFpBVDBIeENBT3pmd3pwT3VRZEZHUXVpOGpr?=
 =?utf-8?B?bGRxOW4rZlBPTlB5YWp3bm5rT3VEWUlhUy8vbGR1RzhQeE1YSTNKOXRiRk9i?=
 =?utf-8?Q?BspJ0LE7/qOTjuGWbaUDU+A=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR13MB5632.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TXV5NHVmSXdzLzZZQ1lMczR0RE93VDdvZkc5ZEZrdmhqNTkvVkh5V3o0YWxu?=
 =?utf-8?B?c2lvUDRwS1hLc1RESk9XTDFOeTJLQzcyMDhJNC9mYTJxSXhTb1dLL24zVXZ0?=
 =?utf-8?B?RTlFNGwzSmhIcXlzQ3FlS3d5RGlKMHJEbmYxdmc0cXJ1U3hlMGFqY3lhMXFS?=
 =?utf-8?B?Vkc4R0FCbUR5b2FkdlE2OHZ6Yy92T205WEdMakswSEM3V3ZiVGllZ0Y5bFY4?=
 =?utf-8?B?NmJwQXFXYmN6Wk5XNXN1SXRmSXJDdUhjZFo2SWpOVXhhTkpwS2E0bklFWTBs?=
 =?utf-8?B?bWJ4eUJBMHVQdktXczROUThGcFlXYlNScXdVT2hyRzFpdU1iSTBuRStwWjB1?=
 =?utf-8?B?cFZnaXBxaVdOdXBRSHNpdG5jUE5maHhOTTF1VE9UUlkwMDFzSVFYNXdKNmV4?=
 =?utf-8?B?RlhDWHl3UU8rWENoeENZNFJkdWJQb05nSWx0NUJBbFhrMkhmUFAzT0kydkc3?=
 =?utf-8?B?SmVJZHpLMzlrVituSFpWZktqSFZoUDN5bCtZVzNPelRFSWRHRHBIYVlvZlhj?=
 =?utf-8?B?UWpNNkNsU1BvcnJqbVp0MVY0NG5qWjhKSEhKd2psMVl6eDd6d1N5VW1JbVls?=
 =?utf-8?B?dWFpc1BzbmZ1ODFnWEprQ0M2eFcyL2Y3eiswd3NYbDJhVHBNclJIcUhjNXlG?=
 =?utf-8?B?Vjc5d2w1OXRRWjgvWDJjMzdVd2c0bkVqSG9EWnVib0p1SWRMZTNYVjhoOCtS?=
 =?utf-8?B?OTdTUGswMWFCcTlvdFZES1NMM3JDT1hFMDQ0ZjluWThDdjB6ekw5cm5pOEdw?=
 =?utf-8?B?bWI5SUJlN2J5WnllUGhxR3BEREpacWE1R1pYWnI2UzlGeHNCUjZFN1ZJcEtm?=
 =?utf-8?B?bUI5anN3NUpiZGJkdVNCSnRqelRuK0t6RFlXZ2xrUUxKSWNPL2pDTmIyV1V4?=
 =?utf-8?B?N21pZVdiS1lqM005Tjlmd2ZRMVZVdmt5Y0VUUm5tdWNCRTdqSTNYeERCVktF?=
 =?utf-8?B?YVl4MFFxK2J3SGZhSzBveWFUS2liTlhJUHlxMGJxVVJhVENncWtNNVpZQWhi?=
 =?utf-8?B?UGQ3Z3p1UjV2TlAvbDcwbjZSaFJmSlFSM05sQXJaRHM4NTI0MFY5dVhiVGpH?=
 =?utf-8?B?WjFhS0xwdDdWMnR4S2NTU1BDbkQrd0h1UUYrdmxwVVplRGVxb1VyeXphZGF2?=
 =?utf-8?B?YWR4dFZvc3IzUjZmbEQwRFRmdEZhSHNjV0lqOHhwRi94Sm05UkNoTWovSWIz?=
 =?utf-8?B?WHRKcE1ZSCtWSk1kaW1vY0tQb3BKT2psSzJZUTJOZWM1cVNyNisvNjBid1ho?=
 =?utf-8?B?SUhZcThIS0dxYkowYWdmajQrN3ZIN2pNbXJ6bzlHVisyMFlOS0xrNTlEOG5F?=
 =?utf-8?B?OERsUmYvMWdQWDBRdXArVHJvR3hQS0xseE8xMVBYbnlOclZxeHdwdE9kbHUx?=
 =?utf-8?B?L0RBdlFzYlBwazYwRTJhV1NFajVjekYxc0FSdlBGYkFPWlJXK2xvYTB5TTdq?=
 =?utf-8?B?MGVnZXFPejIveldnY09pRXNuK2tGM3pROUs3aElrQ2NyTk5Td2VpVHpJdU9t?=
 =?utf-8?B?YUY3VDRDc0IrNTU2TTBOU3VmZld3U0E5Q2dBWUV3M3IxVFhyeHk4T1Nyakpp?=
 =?utf-8?B?VGEvRTZ0bmowSHBma2VOTW5rQzRhOTErTnJYcWJ1SGlFNUZRTFAzNmZkSmh2?=
 =?utf-8?B?aUI4cjVLUWkwam9WcUdIZ0plR28yckFLQ2xmdjJCVGVkdUdUVEZFQW1Iazha?=
 =?utf-8?B?RHpKNzBnNWVmT3h5c3ZPTzdRVmYwVitZbFp1elpiT2Zsa0puRmdramY3cjgx?=
 =?utf-8?B?SlZpQjc3czJaQUpmZG5HUTV3NWRseWdkb1FSSm0wOWRYTFNKWTdnT2kxRWJs?=
 =?utf-8?B?cGNKRVVnYTZmeG95bkRSTHgwRWlucjE3NEtNcWZhZkgzYTBkNExEdjA2SmZa?=
 =?utf-8?B?Y3JkL1R5TTdtTVNPRHpvSXZkQmduUWZjZnFxdm9zZ1Zxb0Flc2lBV0QxVUtM?=
 =?utf-8?B?RjJMMStDMjdLb0Y3dnhIZEZDaU9tU0ZaN2hpdTNKNG9YZUpHWi9ieTJIa3da?=
 =?utf-8?B?Zitjci9MdjE5TlBsd2NiTThlNmducVVRUkJLemNydC9UZWFsOG11TUxmMlRO?=
 =?utf-8?B?U3F6UXZRU0FXTzBmUWdoMC8rVnBpVk5sTUVWQlF3Y1V1Y1o3cHR4S0IvTG1B?=
 =?utf-8?B?L1RwQzdJOGw4L1BwQVhOTkREMUhJSGIra01hMVRpQUZsR2twNkhsM3Qwb21W?=
 =?utf-8?B?ZWZ4TllQYk9XbGtZNlhOUWpTQjV1Um8wYXRONHdkNk1Eck5zbDNBbkRnbC9l?=
 =?utf-8?B?TnVTV0FycUQvMjIrOXVzQ21HeFNlR0tDb3hGSjIzMm83U3VtbW95VUtXZDQ1?=
 =?utf-8?Q?K1MoY3uYH19qqRhLoZ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	KqLjGvkRH54gajo1v2Sjr8PuMjyEXlEUSWnm3rKdJN+9ka9CsdW68LAiLsggnsLWJ3qCdJ8wla9voSAxmNR2P8hHO1GFMrEGiNtDrGA+DO0roEqg5loHLdVo7tSmj6Z/h1yaAVtud049Sgpv38HQfj9qFvbUQte9PDg3ooAc3i2H4nJmlVdfqTRdrHuLhNP5dJ0MGGx8W30xXdqdNpX5Xus0Blxj6Yv7/e3FcVr+KinCsM3Zm9HLEEPcNHde6VvmBQ25EkB/lIuP6KsHgoELYk1d3/9lvsA+Vyv0am7M9Bw+xzGmaR7xaLtef0OerCqt5phx/vjMP5TlZpzDk6XqJ1NbBmT1jzKBx6+7T5K3j+U2iao1Nxav46+SlQdm8Tay0aKtWAtfRNLSU0gd6MtsLqDbJi722uvSMEAU9i0ZsrK+c/u3PZoYNYRiZbuuCpOzE2BQeIcxtN78I7+xSnpo5r5xqDQtBiPkQZXQNw7ATkn48RytcZBP/n67RwH+VKF9jRWPNyUccLkrpSs5TyZoK8mQ9Ql0ncmaru/s8++p1eL71yAkuwY1C3+/GXjnFQJGOF6m436wKQ5toDEPA+iNhRKkJnULB2J2gKbTIcacG+ZtvqXKm0A6QEEDfAEjOpnP
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR13MB5632.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a8b9393-12a4-4339-60ad-08de6f1701fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2026 17:56:14.0873
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F+4I5OW6f35DB+4vkcoqaiD9FkRM6xEY4zuL2wtSqGImvKHqK0e7PTgcbwY0GtJzK4LV4UnW4TjEgBN0NFRTOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR13MB7569
X-Authority-Analysis: v=2.4 cv=Od+VzxTY c=1 sm=1 tr=0 ts=6995fd40 cx=c_pps
 a=e/sPstj0vE6DIEdYTBOJlw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=xR56lInIT_wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=20KFwNOVAAAA:8
 a=z6gsHLkEAAAA:8 a=4QB7L7BWZo37sd7ZKyYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 2_4vd4gADm8BjlksWDwXXOz3zSvknk9u
X-Proofpoint-GUID: 2_4vd4gADm8BjlksWDwXXOz3zSvknk9u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDE1MyBTYWx0ZWRfX0UO/MXpVWk6j
 qGsN4uvtrjzNaU3POedR9HMZ+2rU/NypvoJj5SAcZoiCWotOXwivnJiJpQ1fT2AUK9FJhXL/XlN
 cGgG9T64KbFNwaUihARnR0QMFKgWeKFbb7rvPu7vNIWDcN7S1QgF6MbTMo4Emri8eAhjp8WqknS
 Wy2hibg1dDkllAebUus06W26pcydMfTV9bzmlE4+mItm7vElvYC8GoTTWkNu1CYQHbSunuJiMpz
 T0Oz+rOH+wkPWJu00bnBcDErGc2lvOgTFAGcgvuTvwGBYzhuL9DOIMrT8YCMNQ9PddTBN09fPZz
 4IgqGNQWK5WpMECiGFyInGulZ/I6m2eir77KV3GjSDFdAQh4CchjDuBAyU+xetzlOWlQbUJoVun
 cQDCKkSqcYPK8b2rpzsytlJzkSQboPjE4tpI3h0TaNRcqbwIrCffB+mO7NoiQ2R24l9O5ddnuQk
 /ObodoTvOsk4Q/hz6Og==
X-Sony-Outbound-GUID: 2_4vd4gADm8BjlksWDwXXOz3zSvknk9u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-18_03,2026-02-18_01,2025-10-01_01

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSaWNoYXJkIEZvbnRhbmEgPHJm
b250YW5hQHJlZGhhdC5jb20+DQo+IE9uIFR1ZSwgRmViIDE3LCAyMDI2IGF0IDY6NDLigK9QTSBU
aW0gQmlyZCA8dGltLmJpcmRAc29ueS5jb20+IHdyb3RlOg0KPiA+DQo+ID4gQWRkIGFuIFNQRFgt
TGljZW5zZS1JZGVudGlmaWVyIGxpbmUgdG8gc291bmQvdXNiL21pZGkuYw0KPiA+IFVzZSAnQlNE
LVNvdXJjZS1Db2RlJyBhcyBwYXJ0IG9mIHRoZSBPUiBmb3IgdGhlDQo+ID4gbGljZW5zZSBpZC4N
Cj4gPg0KPiANCj4gPiAtICogUmVkaXN0cmlidXRpb24gYW5kIHVzZSBpbiBzb3VyY2UgYW5kIGJp
bmFyeSBmb3Jtcywgd2l0aCBvciB3aXRob3V0DQo+ID4gLSAqIG1vZGlmaWNhdGlvbiwgYXJlIHBl
cm1pdHRlZCBwcm92aWRlZCB0aGF0IHRoZSBmb2xsb3dpbmcgY29uZGl0aW9ucw0KPiA+IC0gKiBh
cmUgbWV0Og0KPiA+IC0gKiAxLiBSZWRpc3RyaWJ1dGlvbnMgb2Ygc291cmNlIGNvZGUgbXVzdCBy
ZXRhaW4gdGhlIGFib3ZlIGNvcHlyaWdodA0KPiA+IC0gKiAgICBub3RpY2UsIHRoaXMgbGlzdCBv
ZiBjb25kaXRpb25zLCBhbmQgdGhlIGZvbGxvd2luZyBkaXNjbGFpbWVyLA0KPiA+IC0gKiAgICB3
aXRob3V0IG1vZGlmaWNhdGlvbi4NCj4gPiAtICogMi4gVGhlIG5hbWUgb2YgdGhlIGF1dGhvciBt
YXkgbm90IGJlIHVzZWQgdG8gZW5kb3JzZSBvciBwcm9tb3RlIHByb2R1Y3RzDQo+ID4gLSAqICAg
IGRlcml2ZWQgZnJvbSB0aGlzIHNvZnR3YXJlIHdpdGhvdXQgc3BlY2lmaWMgcHJpb3Igd3JpdHRl
biBwZXJtaXNzaW9uLg0KPiA+IC0gKg0KPiA+IC0gKiBBbHRlcm5hdGl2ZWx5LCB0aGlzIHNvZnR3
YXJlIG1heSBiZSBkaXN0cmlidXRlZCBhbmQvb3IgbW9kaWZpZWQgdW5kZXIgdGhlDQo+ID4gLSAq
IHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcyBwdWJsaXNoZWQgYnkg
dGhlIEZyZWUgU29mdHdhcmUNCj4gPiAtICogRm91bmRhdGlvbjsgZWl0aGVyIHZlcnNpb24gMiBv
ZiB0aGUgTGljZW5zZSwgb3IgKGF0IHlvdXIgb3B0aW9uKSBhbnkgbGF0ZXINCj4gPiAtICogdmVy
c2lvbi4NCj4gPiAtICoNCj4gPiAtICogVEhJUyBTT0ZUV0FSRSBJUyBQUk9WSURFRCBCWSBUSEUg
QVVUSE9SIEFORCBDT05UUklCVVRPUlMgYGBBUyBJUycnIEFORA0KPiA+IC0gKiBBTlkgRVhQUkVT
UyBPUiBJTVBMSUVEIFdBUlJBTlRJRVMsIElOQ0xVRElORywgQlVUIE5PVCBMSU1JVEVEIFRPLCBU
SEUNCj4gPiAtICogSU1QTElFRCBXQVJSQU5USUVTIE9GIE1FUkNIQU5UQUJJTElUWSBBTkQgRklU
TkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UNCj4gPiAtICogQVJFIERJU0NMQUlNRUQuIElO
IE5PIEVWRU5UIFNIQUxMIFRIRSBBVVRIT1IgT1IgQ09OVFJJQlVUT1JTIEJFIExJQUJMRSBGT1IN
Cj4gPiAtICogQU5ZIERJUkVDVCwgSU5ESVJFQ1QsIElOQ0lERU5UQUwsIFNQRUNJQUwsIEVYRU1Q
TEFSWSwgT1IgQ09OU0VRVUVOVElBTA0KPiA+IC0gKiBEQU1BR0VTIChJTkNMVURJTkcsIEJVVCBO
T1QgTElNSVRFRCBUTywgUFJPQ1VSRU1FTlQgT0YgU1VCU1RJVFVURSBHT09EUw0KPiA+IC0gKiBP
UiBTRVJWSUNFUzsgTE9TUyBPRiBVU0UsIERBVEEsIE9SIFBST0ZJVFM7IE9SIEJVU0lORVNTIElO
VEVSUlVQVElPTikNCj4gPiAtICogSE9XRVZFUiBDQVVTRUQgQU5EIE9OIEFOWSBUSEVPUlkgT0Yg
TElBQklMSVRZLCBXSEVUSEVSIElOIENPTlRSQUNULCBTVFJJQ1QNCj4gPiAtICogTElBQklMSVRZ
LCBPUiBUT1JUIChJTkNMVURJTkcgTkVHTElHRU5DRSBPUiBPVEhFUldJU0UpIEFSSVNJTkcgSU4g
QU5ZIFdBWQ0KPiA+IC0gKiBPVVQgT0YgVEhFIFVTRSBPRiBUSElTIFNPRlRXQVJFLCBFVkVOIElG
IEFEVklTRUQgT0YgVEhFIFBPU1NJQklMSVRZIE9GDQo+ID4gLSAqIFNVQ0ggREFNQUdFLg0KPiAN
Cj4gVGhpcyBpc24ndCBgQlNELVNvdXJjZS1Db2RlYC4NCg0KV2hhdCBkaWZmZXJlbmNlIGRvIHlv
dSB0aGluayBpcyBpbXBvcnRhbnQ/DQoNCkkga25vdyB0aGVyZSBhcmUgc29tZSB0ZXh0dWFsIGRp
ZmZlcmVuY2VzLCBidXQgSSBiZWxpZXZlIHRoYXQgdGhpcyB0ZXh0IGlzIHNlbWFudGljYWxseSBl
cXVpdmFsZW50DQp0byBCU0QtU291cmNlLUNvZGUuIEl0IG1hdGNoZXMgZXhhY3RseSB3aXRoIHRo
ZSBsaWNlbnNlIGZpbGUgdGhhdCBJIGFkZGVkIHRvIHRoZSBrZXJuZWwgaW4gdGhpcw0Kc2FtZSBw
YXRjaC4gIElmIHlvdSdyZSByZWZlcnJpbmcgdG8gdGhlIDR0aCBzZW50ZW5jZSwgdGhhdCdzIG5v
dCBwYXJ0IG9mIHRoZSBCU0QtU291cmNlLUNvZGUNCmxpY2Vuc2UsIGFuZCBpcyByZWZsZWN0ZWQg
aW4gdGhlIG90aGVyIHNpZGUgb2YgdGhlICdPUicgY2xhdXNlIGluIHRoZSBTRFBYIElEIEkgYXNz
aWduZWQgdG8gdGhpcyBmaWxlLg0KJ0dQTC0yLjAtb3ItbGF0ZXIgT1IgQlNELVNvdXJjZS1Db2Rl
Jw0KDQogLS0gVGltDQoNCg==
