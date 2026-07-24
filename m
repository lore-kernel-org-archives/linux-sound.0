Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012039.outbound.protection.outlook.com [40.107.75.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BF9422E2A;
	Fri, 24 Jul 2026 11:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784893292; cv=fail; b=BZOQsNqw5quB3rHgrabtQv87aYM1Ybb3rACX7bpMmhY9eLJKGbo1/u7s+GS2XVkmSxNaxplgEIxfY3Gpupt7VQ117tjDXGN00Crw4r8XKnud9zcjF+EL72ymX2yreVBmglI0tayZphcDpu54f4FENiJmnT/u7l3SSBPM4YxIpZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784893292; c=relaxed/simple;
	bh=6Y8dUUn9UNFbBykhdOkPnxThPDnvDOoAdlYRF44haq8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uWPNt4uZnjvI7lKNDUTfytaRWmXotCUdVviPs7O8q17z56NWpns+Pjv8asA+IJVr0RJhPxojMVQ8K79u1zUFCjp3mttHzEgaR88fHVQyQn+YEz1qe4ppmFGMhYOZK6FpnFZr3+mZ71YKVEk/YeRS4sW5noW90It8C5Wv8+9tbNY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=HS+bWUng; arc=fail smtp.client-ip=40.107.75.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="HS+bWUng"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=na+UakaF9RuuB2cShVEQytzeEaseI0bJ3YsmDjZV9NF8JkKKGtmLzSKcR3taoKg85vyJI7hjEmZnr3jHto0tudH61lo/wZmubmtXFzFXFeWyS91pxJbDpkoRZY68rT3C8sANQuMUkyJRPLTEt9bt7PtVRhMY25RN/V7bDAZ7jtPtrNdh1/r/KxMGCWrjU5+kLOb3b8jcELWOgUEVITmVA7LkNf5ZmKMDCCkpYho6gY1VqFD1qnww5u7p/boHzYNfURoZSEJ1izuRvpgyDH9Hk1vKd8unGafnHq1DW0sn+d7sUx7LxWAgYBmOls5JU2ngLQUF0HLxINs6gWQucq6rTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Y8dUUn9UNFbBykhdOkPnxThPDnvDOoAdlYRF44haq8=;
 b=WpqPrX295sQkSeBwzDvn87eGumpV6iz3VWh4NNtunGDsPwZnFP7J56lt51YKPHK6DzWv4uCrqOX/98/cYXWbvBCw9Kr79ZCIp+loO+DENv0yZu8QJR/xHm1xNJgVko3U/QE6zOAnI+pxNzVoDry2p5uLCko382THIjIu8aTmJTw5dY0RSj3YhPD6mDTA5XfHM3B+rk/Q+2zL06lmjguz3b9Ydlun1sGSx5d0XmY9GscJfRl9yCy2yhO326OAuIyQFyDKQJ0emyAs5LDXlBJ6cvQiyIRocvzfUQkh49hKfGqUog8x5p2Ymga3/AXYkN5ZfnXcQgdszUW/nXaELHrTrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Y8dUUn9UNFbBykhdOkPnxThPDnvDOoAdlYRF44haq8=;
 b=HS+bWUngJmGJPVDXITnSsrKwZQTTXYcBCYk5DEWxJXVVjDh1Di1FIMgeHYv5R9TwQ2Z7Cvy1+KMx+qaaCoF0u4C1hvvL5bGGa2j6wnHWggwy1TUMfFOtZcTvoE7Q9rv8ibeOsHWrALhJi2O+fyGJ8asvt4g3TbhNCZcmybw/bHt7m1LrbZshY8iHPXBsA0eJ558dWc3u/YW90W4lQqxCaC9ba7F8VygiaZ2hnEQox/3Y3a5IBEvGtCxRC3+zT4NxijmkX0tIVCvVuK5Wk8d+czUbc6BYPsrBVvnGC+RzcZnGjFFtXsM/xVp6fa5k4OzT2YA5lepsfuC68WJgN99HsA==
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com (2603:1096:400:358::7)
 by SEYPR06MB5400.apcprd06.prod.outlook.com (2603:1096:101:8d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 11:41:19 +0000
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc]) by TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc%6]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 11:41:18 +0000
From: =?utf-8?B?6IOh6L+e5Yuk?= <hulianqin@vivo.com>
To: Rong Zhang <i@rong.moe>, "perex@perex.cz" <perex@perex.cz>,
	"tiwai@suse.com" <tiwai@suse.com>
CC: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject:
 =?utf-8?B?562U5aSNOiBbUEFUQ0hdIEFMU0E6IHVzYi1hdWRpbzogQWRkIGlmYWNlIHJl?=
 =?utf-8?Q?set_and_delay_quirk_for_JKY_Technology_Q2A?=
Thread-Topic: [PATCH] ALSA: usb-audio: Add iface reset and delay quirk for JKY
 Technology Q2A
Thread-Index: Ad0bRhPoJJEBfya5Q7SBchl1mjk0TwAFrMMAAABG3KA=
Date: Fri, 24 Jul 2026 11:41:18 +0000
Message-ID:
 <TYUPR06MB621767F631B7932FD6F3B079D2CF2@TYUPR06MB6217.apcprd06.prod.outlook.com>
References:
 <TYUPR06MB6217BD7BF1AE9B308295FFFCD2CF2@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <2cb27fb80f6fbdbd3b72138ce2d33c878e4e8049.camel@rong.moe>
In-Reply-To: <2cb27fb80f6fbdbd3b72138ce2d33c878e4e8049.camel@rong.moe>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYUPR06MB6217:EE_|SEYPR06MB5400:EE_
x-ms-office365-filtering-correlation-id: f3244164-83b9-4047-c59a-08dee9787a33
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|23010399003|42112799006|1800799024|38070700021|56012099006|4143699003|10067099003|11063799006|22082099003|18002099003;
x-microsoft-antispam-message-info:
 53mfyyBE+me60HMBhHWAki0JxHTQJ6+A0gw+hR3zoR7C4hZhk7fvIWPqvXsl+7xhIv5bbsf+rvrgz6ajh3REz3bOhAfk9F1Vdmi5wMKyr+iMOT4Y8eHC8ySKkZWZ4xvLSBNRE/C4bxLO0Il+TwCIJ+AhMLWijs7v3GDJIsdwbpLXr957JO6tcoY71PuSTYt1OqaYIw16rAIodyITm76pjyNsF9AWuIwCdEF1GnliDOi32FDm1bdzABSopFf3dW4nWzb1+oTlshkIbkGOqLU/8RQb/qkOykwyMmIUxLrSKBS0+xUPUun/EJyMSa2eldQveMlQbSIAwbo/+wmSf4ApR8JB67Ud+nOsnzF2Dj23PepigfgGtE+Ig50qk9XHVbhi8LvWUQf/t+XLkYK1guFlYtL2yeapKvEk5V8+l5iOTo3HZRuqqAc2dOd61RsL1NlQAgGRueC7zfMTYeGm9rrMqZeLTRlNUsMDfV8GyHYQdNgGhXkXSvHhdOkTjW+pB3hMDtce18lgzBeyjZ2pl0pmH+t4MHuB8Boa2vUttdJY8ju2NY9PdnZk4Rrc8CMa27VVatT/aIhlxbTwMy9DSqgEX+8DIZ95WkvhHGZ0Gz+FqGzZD3OtX32ycen/MpV4lhLsBX5ulgeLYoSS/mVR9KFjskEsfYbMG4djtrU5ek506PAyj9qlmajnGxuhzl+AloOD/5otDX5hCrb5X1FJVfJpU4Xgn857xRVydanac8ucA8g=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYUPR06MB6217.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(42112799006)(1800799024)(38070700021)(56012099006)(4143699003)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dTgvRm12MlpHVFFEamlZekNrcUlUOEFCVklVZGJLb2dHK2puLzdsVm9naFl0?=
 =?utf-8?B?YUNub2FIVW9MME5yRW5odHcvbFd2YzF0ZmQvWUk4WnVuTlFwelFWZHBqVktS?=
 =?utf-8?B?RzJGUURIa3d4TERDOUxXS3A5M3Z3ZjUyNnVDUnNTMEQwNEtrelJFd0dBYzlQ?=
 =?utf-8?B?SjA5d1BRYlRMRC9UWk1Kd3dITnhwY2ZuWHNkQ1YwakgxTnRnSVZ5WnVVaUti?=
 =?utf-8?B?VUlpWUExTlNZM3VGZFZ5MDFIbnJwTDlEWW5BbzgxT0E5cS9ZNEs2RkdXMFZq?=
 =?utf-8?B?NFAyVTN5QjJ4WEd3azdmbmJQT2pMNktlTEdacFRlMnRrYnBrSGxLUkJaUmF5?=
 =?utf-8?B?b1ZvanF4M1RsaS9SNktKWm5KckhVcFZGWVphalNBbzRUMVFxTVN4azhjRVdT?=
 =?utf-8?B?aUhXMXdZOThMaWtzbDJ3UTlJZUZ0RnlXeDJKSU1Pd2xVZXBSdEZzWVJmYml5?=
 =?utf-8?B?TTRKSnBnVzJyb1JnVENNWVpETU5TUXBXYzNmM2Fwa3ZucXJBUDBLc2M1NWZj?=
 =?utf-8?B?NXJuMFFIMDJuMktCVFFOYnBpbHh1TkE2ZkgzTEJ1ZmthaUNGekorQy9wUVhM?=
 =?utf-8?B?aEozVFVpTTlFQzM0dDVKM1lGK0h3cmswT0JETW9TT3lKTGErdStCTUt6eEdZ?=
 =?utf-8?B?SnJpU21QY2VERWJJSXhnbXR1endCQXc4NUVWOGtwL0RNOExQZ3ZCaG1PcVpp?=
 =?utf-8?B?LzRORE9FcmhFNjAxYXg3SUZOK3ZDWDkwUGt4dlVNSjh3V0hPNjlybTdSa0hM?=
 =?utf-8?B?RjdROEVLVlZtTmlBY2FkclFaemw2YU5wVmNtMHZndVhNYUtHN2VTeWlaR0hG?=
 =?utf-8?B?aURtalBzemRhV2VxUzFzcFlEclpya0hSNFQwZHRGVENqUm11NTkwNkxwdXVL?=
 =?utf-8?B?NzdEaE1Jcng3NHNqSEcwOFhTRDhPbjVad1NvdGpSd2Z4bUc3RVFUb0ZLa3lC?=
 =?utf-8?B?a3JPaXA1eUFQOUxwV0EvMG5WVU4vK2w2N2pHQ0pEZ3lCbkI0d3RadGJ2ejYx?=
 =?utf-8?B?ZnRQN3p2dCtSVHdEU0NpRUwvMWp3RnFzNmNVMHVyTW9XTy8xdVZjSWw2S1BM?=
 =?utf-8?B?c2paQ1V1SUpZcUdwSmdwNjRiWVBmMTcwVzVZUDRTczBRbnBLWUtlTjBHM1dy?=
 =?utf-8?B?STBSekxSM1RmNXMrMklPazd5Q0pMYjBYMmZhRldvVDRiM0tUNlBsVjZmNmJh?=
 =?utf-8?B?dnFVeHBNTlFGM2FYRFYxZDhoNTBMYVU3UzNiWTE2ZUoyV1c2dCtwMlFua1Ir?=
 =?utf-8?B?NTBOL0FuSFdGRHFjQ2FZZ0JhOVQzLzQvNlRvWWpuNTROUHhKR3hBZEdmc1dG?=
 =?utf-8?B?ZHNmVU8vb0N0R3hiT0FQYndISENPU2ttRUZzMncwaW9oWUlLTHVnc3psdnJj?=
 =?utf-8?B?YTNZZC9ocjNoRHRQc2tjL2JHaXdPcFZFWWR3aGQzQVl2QmRTbXdMRE0xS3d5?=
 =?utf-8?B?aGFRenRBNGJHYTlLVndTNXhiS1E4ZEloQzJQbzhyUGd2VEQ4WFkwUkZEREZK?=
 =?utf-8?B?eURld242T2Zya3IwY1I2ZkRLL3gxc1J3aHVaZmtDRE1PYWx5MzZDWWxDUUpN?=
 =?utf-8?B?TytOK0pSL0dqRU4yUXUwMUxtdTJ4dTlzMThic09Gb1dWTVVhTEczY1pHMVN2?=
 =?utf-8?B?cmRwM21Vdk45Snh2S1BBTGx5SExtQmVMcVNNY0FNVjhlakZUZGlYS3NrYWJC?=
 =?utf-8?B?KytwN3o1TkgxUmcyN24rSW1RVWRLR0JnT2hoZnl5K2FQaHBsdDRXaHBGdEVP?=
 =?utf-8?B?VUtOOFdYcktWbkJKdEROSlZtbE1WUW0wYWIwWVorblBscUZCNEthQ2Q1LzdU?=
 =?utf-8?B?OEx2OHFDdG1kRFFpS3dTQmRiTEZmdzVQaEpoZXZuQW5TdkpzOXJZdFRNUDZL?=
 =?utf-8?B?V3B3ZG5OOWh0VHpJemY3eXNrZkdJemdpWGRuNVMyRlA0bDdUYk9jR0pxa3VM?=
 =?utf-8?B?QzE3RE1YOVFvMEh0Z3c0NUxhUTMyVDNjZ0lRNGdTN2VFK0xzMGQxREo1Njd3?=
 =?utf-8?B?dUlRQTJMOXhSRGsvQ25oUjd5NEp0cjE1dittM0JWNm9BdFVkS08ra0tycFNK?=
 =?utf-8?B?MnR6akFOQzVRYllSUkIzaHI5MVBtUGdLZ1lSVzlZNHlNWGs3eXhUejBUZU9X?=
 =?utf-8?B?UGtxOGVaTzFHVkVZdVh1VThINnAvUS9LUWEwakxQMEcyUTNmQlVWZWFPRlRR?=
 =?utf-8?B?R25aa25GbmlYaUs3OHFxRVpkbnl5NlF3VWpCaU1Gc3crNkdlOXVteEdkWUdx?=
 =?utf-8?B?LzN6WlFOeHpvbUlKSGQrM2NwcEdJeWF2N2RYS2I3Nk1aeENxcXBteXl2dHgw?=
 =?utf-8?Q?WsxZmmP5tBYd5kwIm/?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYUPR06MB6217.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3244164-83b9-4047-c59a-08dee9787a33
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2026 11:41:18.8458
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oU/PqIAubIrV0T3Lp2/o91R/XL52+DzCUxEJne5s0vG8rO3AZU4pKXlP4ZzWcUrW0lEmm6WrJi3fmolmpB46xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5400

SGkgUm9uZzoNCg0KPiANCj4gT24gRnJpLCAyMDI2LTA3LTI0IGF0IDA4OjI5ICswMDAwLCDog6Ho
v57li6Qgd3JvdGU6DQo+ID4gU2V0dGluZyB1cCB0aGUgaW50ZXJmYWNlIHdoZW4gc3VzcGVuZGVk
L3Jlc3VtaW5nIGZhaWxzIG9uIHRoaXMgY2FyZC4NCj4gPiBBZGRpbmcgYSByZXNldCBhbmQgZGVs
YXkgcXVpcmsgd2lsbCBlbGltaW5hdGUgdGhpcyBwcm9ibGVtLg0KPiA+DQo+ID4gTm90ZTogVGhp
cyBkZXZpY2UgbWlzdXNlcyB0aGUgQXBwbGUgVklEICgweDA1YWMpICYgUElEICgweDExMGIpLg0K
PiANCj4gVGhlIGRldmljZSdzIFZJRCBjb25mbGljdHMgd2l0aCBBcHBsZSdzLCBidXQgdGhlcmUg
aXMgbm8gUElEIGNvbmZsaWN0LA0KPiByaWdodD8NClRoZSBWSUQgJiBQSUQgYXJlIHRoZSBzYW1l
IGFzIHRob3NlIG9mIEFwcGxlJ3Mgb2ZmaWNpYWwgZGlnaXRhbCBoZWFkcGhvbmVzLiANClRoaXMg
aXMgdGhlIFZJRCAmIFBJRCBpbmZvcm1hdGlvbiBvZiBkaWdpdGFsIGhlYWRwaG9uZXMgcHVyY2hh
c2VkIGZyb20gQXBwbGU6DQoNClsyMDk0Ni44Mjk4MDVdIHVzYiAxLTE6IE5ldyBVU0IgZGV2aWNl
IGZvdW5kLCBpZFZlbmRvcj0wNWFjLCBpZFByb2R1Y3Q9MTEwYiwgYmNkRGV2aWNlPTI2LjgxDQpb
MjA5NDYuODI5ODExXSB1c2IgMS0xOiBOZXcgVVNCIGRldmljZSBzdHJpbmdzOiBNZnI9MSwgUHJv
ZHVjdD0yLCBTZXJpYWxOdW1iZXI9Mw0KWzIwOTQ2LjgyOTgxM10gdXNiIDEtMTogUHJvZHVjdDog
RWFyUG9kcw0KWzIwOTQ2LjgyOTgxNV0gdXNiIDEtMTogTWFudWZhY3R1cmVyOiBBcHBsZSwgSW5j
Lg0KWzIwOTQ2LjgyOTgxNl0gdXNiIDEtMTogU2VyaWFsTnVtYmVyOiBKQ1JGMFhRUUgxDQpbMjA5
NDYuODMwMTExXSB1c2IgMS0xOiB1c2JfcHJvYmVfZGV2aWNlDQoNCj4gDQo+IElmIGEgbWFudWZh
Y3R1cmVyIHVzZXMgb3RoZXIncyBWSUQsIGl0J3MgYSBWSUQgY29uZmxpY3QuIFRoZSBkZXZpY2UN
Cj4gZmFsbHMgaW50byB0aGlzIGNhdGVnb3J5Lg0KPiANCj4gSWYgdGhlIG1hbnVmYWN0dXJlciB1
c2VzIHRoZSBzYW1lIFBJRCBhbW9uZyBkaWZmZXJlbnQgcHJvZHVjdHMsIGl0J3MgYQ0KPiBQSUQg
Y29uZmxpY3QuIEkgZG9uJ3QgdGhpbmsgaXQncyB0aGUgY2FzZSBvZiB0aGUgZGV2aWNlLCB1bmxl
c3MgSktZDQo+IFRlY2hub2xvZ3kgcmV1c2VzIFBJRCAweDExMGIgZm9yIHByb2R1Y3RzIG90aGVy
IHRoYW4gUTJBLg0KDQpUaGUgZGV2aWNlJ3MgVklEICYgUElEIGluZm9ybWF0aW9uIGFyZSBleGFj
dGx5IHRoZSBzYW1lIGFzIEFwcGxlJ3Mgb2ZmaWNpYWwgaW5mb3JtYXRpb24uDQpNaXN1c2luZyBB
cHBsZSBkaWdpdGFsIGhlYWRwaG9uZXMnIFZJRCBhbmQgUElEIGluZm9ybWF0aW9uDQoNCj4gDQo+
ID4NCj4gPiB1c2IgMS0xOiBOZXcgVVNCIGRldmljZSBmb3VuZCwgaWRWZW5kb3I9MDVhYywgaWRQ
cm9kdWN0PTExMGINCj4gPiB1c2IgMS0xOiBOZXcgVVNCIGRldmljZSBzdHJpbmdzOiBNZnI9MSwg
UHJvZHVjdD0yLCBTZXJpYWxOdW1iZXI9Mw0KPiA+IHVzYiAxLTE6IFByb2R1Y3Q6IFEyQQ0KPiA+
IHVzYiAxLTE6IE1hbnVmYWN0dXJlcjogSktZIFRlY2hub2xvZ3kNCj4gPiB1c2IgMS0xOiBTZXJp
YWxOdW1iZXI6IDMzMDI3MEQyMjUxMjI1DQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBMaWFucWlu
IEh1IDxodWxpYW5xaW5Adml2by5jb20+DQo+ID4gLS0tDQo+ID4gIHNvdW5kL3VzYi9xdWlya3Mu
YyB8IDIgKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4g
ZGlmZiAtLWdpdCBhL3NvdW5kL3VzYi9xdWlya3MuYyBiL3NvdW5kL3VzYi9xdWlya3MuYw0KPiA+
IGluZGV4IDBkZTdjOWQ5NDI1OS4uYWQyY2UzODRlMzJkIDEwMDY0NA0KPiA+IC0tLSBhL3NvdW5k
L3VzYi9xdWlya3MuYw0KPiA+ICsrKyBiL3NvdW5kL3VzYi9xdWlya3MuYw0KPiA+IEBAIC0yMjAw
LDYgKzIyMDAsOCBAQCBzdHJ1Y3QgdXNiX2F1ZGlvX3F1aXJrX2ZsYWdzX3RhYmxlIHsNCj4gPg0K
PiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0IHVzYl9hdWRpb19xdWlya19mbGFnc190YWJsZSBxdWly
a19mbGFnc190YWJsZVtdID0gew0KPiA+ICAJLyogRGV2aWNlIGFuZCBzdHJpbmcgZGVzY3JpcHRv
ciBtYXRjaGVzICovDQo+ID4gKwlERVZJQ0VfU1RSSU5HX0ZMRygweDA1YWMsIDB4MTEwYiwgIkpL
WSBUZWNobm9sb2d5IiwgIlEyQSIsIC8qIEpLWSBUZWNobm9sb2d5IFEyQSAqLw0KPiANCj4gSGVu
Y2UsIEkgZG9uJ3QgdGhpbmsgaXQncyBuZWNlc3NhcnkgdG8gbWF0Y2ggIlEyQSIgaGVyZS4NCj4g
DQo+IE1lYW53aGlsZSwgaW4gYW55IGNhc2UsIHRoZSBjb21tZW50IHNob3VsZCBkZXNjcmliZSB0
aGUgVklEL1BJRCBjb25mbGljdA0KPiBpbnN0ZWFkIG9mIHJlcGVhdGluZyB0aGUgc3RyaW5nIGRl
c2NyaXB0b3IocykgYmVpbmcgbWF0Y2hlZCwgYW5kIHRoZQ0KPiBzdHJpbmdzIHNob3VsZCBicmVh
ayBpbnRvIGFub3RoZXIgbGluZS4NCg0KT0ssIFRoZSBjb21tZW50cyBzaG91bGQgaW5jbHVkZSBp
bmZvcm1hdGlvbiBhYm91dCBhbnkgY29uZmxpY3RpbmcgdmlkIGFuZCBwaWQgaW5mb3JtYXRpb24u
DQoNCj4gDQo+IFNlZSBob3cgY29tbWl0IGIxMzAzMWNhMTEyYSAoIkFMU0E6IHVzYi1hdWRpbzog
RGVjb25mbGljdCBWSUQgYmV0d2Vlbg0KPiBGb2N1c3JpdGUgTm92YXRpb24gJiBNVi1TSUxJQ09O
IikgZGVzY3JpYmUgdGhlIGNvbmZsaWN0IGFuZCBhcnJhbmdlDQo+IGxpbmVzLg0KPiANCj4gPiAr
CQkgICBRVUlSS19GTEFHX0ZPUkNFX0lGQUNFX1JFU0VUIHwgUVVJUktfRkxBR19JRkFDRV9ERUxB
WSksDQo+IA0KPiBCYWQgaW5kZW50Lg0KQWZ0ZXIgY2FyZWZ1bCBpbnNwZWN0aW9uLCB0aGUgaW5k
ZW50YXRpb24gaW4gcXVpcmsuYyBhcHBlYXJzIHRvIGJlIGNvbnNpc3RlbnQgd2l0aCBwcmV2aW91
cyBpbmRlbnRhdGlvbiBwcmFjdGljZXMuDQoNCglERVZJQ0VfRkxHKDB4NDEzYywgMHhhNTA2LCAv
KiBEZWxsIEFFNTE1IHNvdW5kIGJhciAqLw0KCQkgICBRVUlSS19GTEFHX0dFVF9TQU1QTEVfUkFU
RSksDQoJREVWSUNFX0ZMRygweDUzNGQsIDB4MDAyMSwgLyogTWFjcm9TaWxpY29uIE1TMjEwMC9N
UzIxMDYgKi8NCgkJICAgUVVJUktfRkxBR19BTElHTl9UUkFOU0ZFUiksDQoJREVWSUNFX0ZMRygw
eDUzNGQsIDB4MjEwOSwgLyogTWFjcm9TaWxpY29uIE1TMjEwOSAqLw0KCQkgICBRVUlSS19GTEFH
X0FMSUdOX1RSQU5TRkVSKSwNCglERVZJQ0VfRkxHKDB4ODRlZiwgMHgwMDgyLCAvKiBIb3RvbmUg
QXVkaW8gUHVsemUgTWluaSAqLw0KCQkgICBRVUlSS19GTEFHX01JWEVSX1BMQVlCQUNLX0xJTkVB
Ul9WT0wgfCBRVUlSS19GTEFHX01JWEVSX0NBUFRVUkVfTElORUFSX1ZPTCksDQoNCj4gDQo+IFRo
aXMgaXMgdGhlIGZpcnN0IERFVklDRV9TVFJJTkdfRkxHKCkgaXRlbSwgc28gcGxlYXNlIGRvbid0
IHNldCBhIGJhZA0KPiBleGFtcGxlLiBJIHdvdWxkIHByZWZlcjoNCj4gDQo+IAlERVZJQ0VfU1RS
SU5HX0ZMRygweDA1YWMsIDB4MTEwYiwgLyogVklEIGNvbmZsaWN0cyB3aXRoIEFwcGxlICovDQo+
IAkJCSAgIkpLWSBUZWNobm9sb2d5IiwgTlVMTCAvKiBRMkEgKi8sDQo+IAkJCSAgUVVJUktfRkxB
R19GT1JDRV9JRkFDRV9SRVNFVCB8IFFVSVJLX0ZMQUdfSUZBQ0VfREVMQVkpLA0KPiANCk9L77yM
VGhpcyB3YXkgb2Ygd3JpdGluZyBpcyBiZXR0ZXIsIGJ1dCB0aGUgaW5kZW50YXRpb24gaXMgc2xp
Z2h0bHkgZGlmZmVyZW50IGZyb20gdGhhdCBvZiB0aGUgcHJlZGVjZXNzb3JzLg0KIEkgcGVyc29u
YWxseSBob3BlIHRvIGtlZXAgaXQgY29uc2lzdGVudCB3aXRoIHRoZSBwcmVkZWNlc3NvcnMuDQoN
Cj4gVGhhbmtzLA0KPiBSb25nDQo+IA0KPiA+DQo+ID4gIAkvKiBEZXZpY2UgbWF0Y2hlcyAqLw0K
PiA+ICAJREVWSUNFX0ZMRygweDAwMWYsIDB4MGIyMSwgLyogQUIxM1ggVVNCIEF1ZGlvICovDQo+
ID4gLS0NCj4gPiAyLjM5LjANCg0KVGhhbmtzDQpMaWFucWluDQo=
