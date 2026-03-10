Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012060.outbound.protection.outlook.com [40.107.75.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2CF940DFAF
	for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 14:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773151944; cv=fail; b=ndEJ6zjxEGNrpUEYJvM4jsZJqG3hRN3oRyezIBTG3qepyjV+lIDKUwLJXOxsmguWhVpw4siMfNaz4IGBdz4dy3Dq+mTAGcMiDN8wlX0eM7o9zHemb9iKyL6M8x6Kl9FEzm12SLR+rQZqesTX4DzN05eDPNZp1kMToc6TXxNN8vg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773151944; c=relaxed/simple;
	bh=y3juVG5ovTqtwCgE33WjpjQJzun0osd3z6J4eMY62F4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=i5Xx+QobrvKlpcxyA+srPiT6igA8/c/x+a85oxPh4QCD3LI9D4/ffnFiiHb6HKCnnhFjMC8kH9ONctVH80LEI+iId+CF4HGq1+KBPcLWqVY/x1q9wcyp8Vkd8q9P7ImPD6OhQRrWq9zkyGCrKJ7nBmKGsnvK7PudvTi+Gsltprk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=YAfy+fdF; arc=fail smtp.client-ip=40.107.75.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="YAfy+fdF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cOH3z/p5OzVmprI/dNNE4PdgvC8whBj/DhBVG7bmB6G+84nspj8ELkHQ3SJCX8AUXx7skQucsou4XG/PfA6x7fsk1My8SE05zNy5dsLY+QjwDsm2R9xtFN5LnkJ7I/GpuWkSltgT3hW4m/tW41aLioTo6uVhA6OxJG9jz6tT2BMSC1rvm/OqENx5/s5I1PwKXR7xzmoWDuOjxpe/FfxxZAfylbVZl3O8gP8W23G7GLNOY0dReq7RADi6W/bU/d+7sXHN7Vz6XHvyvwrRkt1FhBhK93LWnIjK5M9+KLl7q8lc2D7aCj+VyP9Fz3TBh+1j/LcMlSnam8U5QM2/f+N7zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y3juVG5ovTqtwCgE33WjpjQJzun0osd3z6J4eMY62F4=;
 b=CVMy4Po8KcO9B8W/EV4LzXT7KSKQt4/1qr/vkGytQBHdyrvXn7XrthTPi7/CwsgpKyDAologQpGc/1+QcCkL9AAN4cHAs3uEVsvMV6/a16CJVI5vNy6CSTSJktCNCKm1FbR8piFLvPP25CCdQZssUNmllPOQoR/xWPyaV8qLNT1FSjEN4jeKh7y0LNNxeYYfX3NMb+C0mM+nuEUUZiY4eGiPAY4W6ho3We8dV7YweL2m5PJdbtGp/UuMSpVmhmKpeZ96g2DyXpZdCdohkvzVT5fqNetenzgKobk6xg4/U9UBLnw+9fM8ellw6pxfpat+5dMYcRIVZDXX1yyElWP91A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y3juVG5ovTqtwCgE33WjpjQJzun0osd3z6J4eMY62F4=;
 b=YAfy+fdFSeQNV/0Y86hShOXLPABBEGF3Nw0SjHcCEAHQK68PXzztVKkAwiRloyVXCj5xZJ5H+Htnk5CZ3t3A31Ijs8nqD+Z0w3pY+mTphbyWMN9oYLV96wOl3MKLfmAXmZEYcxCv4BgnqjSTz77GSnXfft8yK5QybnXicq7skBMNI+Jndc9BTPTiPqsBlO9yujR3dspv7ZA/Rhvn+PHJ0RiPrAbYSNftUMbSr5OU24XBO81+ON5zH2zzo7cOsxa37nXhDS8hDhTDimHg1JEXCfxqSRJGBEqUUIL2t+Bej2JhaCiD4rrvczJjPzDSueeRq8PCDBl67rX30E03Aw3fqg==
Received: from PUZPR06MB6224.apcprd06.prod.outlook.com (2603:1096:301:116::8)
 by SEYPR06MB5647.apcprd06.prod.outlook.com (2603:1096:101:c1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Tue, 10 Mar
 2026 14:12:17 +0000
Received: from PUZPR06MB6224.apcprd06.prod.outlook.com
 ([fe80::2cfc:b348:3e15:3751]) by PUZPR06MB6224.apcprd06.prod.outlook.com
 ([fe80::2cfc:b348:3e15:3751%4]) with mapi id 15.20.9678.024; Tue, 10 Mar 2026
 14:12:17 +0000
From: =?utf-8?B?6IOh6L+e5Yuk?= <hulianqin@vivo.com>
To: Jussi Laako <jussi@sonarnerd.net>
CC: "tiwai@suse.com" <tiwai@suse.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>
Subject:
 =?utf-8?B?562U5aSNOiBbUEFUQ0hdIEFMU0E6IHVzYi1hdWRpbzogQWRkIGlmYWNlIHJl?=
 =?utf-8?Q?set_and_delay_quirk_for_USB_Audio?=
Thread-Topic: [PATCH] ALSA: usb-audio: Add iface reset and delay quirk for USB
 Audio
Thread-Index: AdywaFToHR5joP9zS8+gtPHW1JGQSwAJ1reAAAHdu9A=
Date: Tue, 10 Mar 2026 14:12:17 +0000
Message-ID:
 <PUZPR06MB6224D136C28892091FD97EEAD246A@PUZPR06MB6224.apcprd06.prod.outlook.com>
References:
 <TYUPR06MB62179ADCD1B86A7E0C73E53ED246A@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <9A67CE55-CD09-4574-85B4-2C4F770497BB@sonarnerd.net>
In-Reply-To: <9A67CE55-CD09-4574-85B4-2C4F770497BB@sonarnerd.net>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR06MB6224:EE_|SEYPR06MB5647:EE_
x-ms-office365-filtering-correlation-id: 640ca1b3-a582-4304-3713-08de7eaf0936
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|42112799006|1800799024|376014|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 Mi1zDBvMDPZUzrRM2MfA/HIVVJMrIWh9n8LRSj04Paais5sMbxWu5eX7VfvLADgLHfq/xgv+QMVMlPgVs574ZqMNVZOIgIN//nJBJ7V8m4V2jTmw8ae0JZipBPXdKXNmUEDa3FbVDzaflpfoc5kIDzljY1s3rBf43MFnW0Mo7DquqClnM0V/wSXYzEXaPG1E6UyaFjDboJKRp2nRjHi73j6W201jCVef1TcYW3IOd6YeZx+enwmZtBfcYS9lWCv71cCp81QltNzMn+3xVn3YuXDr5FhXDErl+KbAMFT083smiKRnZcDgexIfQbGuZuPj3eU9ZUe65aoVuV/B787jNxCls0sGb07mArMdVLqZq0LZTyCXM550+sE3mglEGd15hQ/iXAzpWnJoqGFZp7jukrchKCrxlYNbf/xyLq0rgg4DpYJfvOEOfFbJP6+2/Trs9l8tuO0ft3oNsGc6PIH3HSbi1urApZrHtjJXeJoU2v4poOU/5rxsAfqL5U212m4VKUJGERUpKIf0VHKrMBWeWQQYdCQbYFxqH2XKw0960ta6beKFmTCj6b8Qc+TR27TH3KOMRgbW7XHR03mRGSYoKagNii1FqzCRyH+i3RUY9hLthmxHHB/kdLS0rLbWU60SzQZY0Wd3SWBkRz8fIg07TBG5PZGaJM27xLpDtn0dejRFBV9bD4MjZen/dO33I+7E6IC3gz8qyH+OT9g8T0HxoaT4C2kSoSGuoT9+fsVSi7lMeBN6NlqXoty6SLvpIq2LEGQ16rTuyk94oeUyRXiIHcGGj+eLbvIFIsAgGTpI5O0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR06MB6224.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(42112799006)(1800799024)(376014)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RS9SZVpmdW1OSkxkMzc5OTdvWXhkOHFBVmg5dVpHcEgraytJQ3Y5Tnk3YkFQ?=
 =?utf-8?B?ZVpwTXRpTDhqdmYwZCs1WXNHK2k0SkN5VE9mMWdQbzRxNUhjV1lNSjE1MDZT?=
 =?utf-8?B?K2FockN5bytFRk41T3Z4dzAzem9TRmkwNWhCeUg3cUxZNDlaK080RnlnMDVV?=
 =?utf-8?B?aTVvdmxSVUxOOVdwNGptazgwNG42a25IZVFFTlpvL3pWb05oRlRGSUtoTzc0?=
 =?utf-8?B?MDRYcUU4cEFsYnpmQ1lOeDFLY21BNXBCYUwvQVBhSjNGTkZRUnpWZU9Tb0R5?=
 =?utf-8?B?ZURmTEttaE9GMEFUL0JldzhxRzNpNXgvNEpucVNBTis0Wk9wdW1YNG56aDZh?=
 =?utf-8?B?UUxTMkMzeTR3eDZoTG4wR3VBYnVsSG9EU1JqWkxKcGpETEFpZTdxR1p5Z3pp?=
 =?utf-8?B?MWF2ejYrbEtIZ0dMbXZIR05MZFB0d2tDWURWUy82Mlh3eCtQQS93UmxEcWdG?=
 =?utf-8?B?TzJWR0ZCMjRaaTUxN0p3UjRxZ3BQVGVkYWpwRFlKMlZGOWplaG5sem0vSnA5?=
 =?utf-8?B?NHJXaFZOWEU3MHhpSVpUMFZYQXNONTB0bWZWcVgybzZDclNkOG9XTW1FcmFv?=
 =?utf-8?B?RUt4dUphdk9rWVhwb2xQOVJaQWE1bVhXbVBUL0szaVFtMTI0SHFYU0Z3MjNh?=
 =?utf-8?B?R3FQMHg4ZWVlU0oyRmtKakxhdHRCQW5td00vNitZaGpUMTdzM21hR2pJdmxi?=
 =?utf-8?B?TUl6c2VSeVNuR2QvcDVDTjNBRjlhL3R1OFFKakIyVWtQS2tFdEx1M01IQ1hz?=
 =?utf-8?B?YUd3R3NDMmUwa0NWWk1EOFdUc3RRUnVzbzI5OUptQm1pcmQ4V2R2QmhUeW51?=
 =?utf-8?B?WnptYVhpbnhzQk1NTHM2ZTc1TVlEMkpjT1RaYkVyOVM5YWVBU21lQ1NseDcx?=
 =?utf-8?B?aDVhcXl3b3IyRHpZUUkyKytSYnhoam9PMkMyREJyTTViSDZ4Ti9CVGJRa0lP?=
 =?utf-8?B?cWFueGQ1T2lWdCtZQ0M4Vk1GMmN6Tys2K3lwWHJIUHFtY2I5dnpFVGQyT3Fy?=
 =?utf-8?B?V3RjQTAzRjhSVFhpZno4S05JM3VTQWFvUHNKOXJteU9uekF3WkN3RE1oMGdq?=
 =?utf-8?B?NUVhWEd2L3hKSUJRVWxsdGN4NVp6Y1cwR2NzbVIxdU5yZ3U3bXNwZDZTdmhK?=
 =?utf-8?B?TmlkaDJ3cjQwelZsallpM2p4Ky9WOGZXZWtYME1vUDhqcFpaaTliRTlxYWpW?=
 =?utf-8?B?Vk9KQVg3aGhqcmtKbGphTDB5bWpsRFloTTBZQTJrWjJSRUNSenI1Z0xsN0xt?=
 =?utf-8?B?bkdtKy9oV0tycUpndEtucmJCTTJpL01GK2RQU0gxOVY3Z3pMUTBOcWFGQk5Z?=
 =?utf-8?B?RGlvZ1BxNC9HTXQ4MkoydDhTV0IwcHRXMmRaR0N4dGo0eUlyTUdwdmg0OGhi?=
 =?utf-8?B?S05MRHhnLzVnc1dOM0NiNXFFNUVnUElXZkFBQnZRRkV0OVhCS25pb010djhE?=
 =?utf-8?B?elR4aTVJTmJBRXZPY3Q3SmVYaStJczRyVWp3ZE5SVG9GbGpod2EyNVVHK1BX?=
 =?utf-8?B?VEdWVGxVajhIQjErNDlGTmdWdEFKbTBSeTBaZXlENnczQklnUzB6RG81UTQx?=
 =?utf-8?B?SjdUTVRIQUhOYjVNV3BOMGJZSm5UUytyOFFqcUdFeUFrR2RvQlFNSUVrdGxB?=
 =?utf-8?B?RlFPRjhXNGZxenZxS1VTTmtiMXBzbUVvR21DUU5RTjBpanpXQ241dFVPYUdZ?=
 =?utf-8?B?MWx3QytMMFA1dytFaXcxNWxnTFhUbjlWVnp1MTE2U0hFQy9pK2x0ajlwNFFX?=
 =?utf-8?B?RTZLTlB0RWdQTjNwTE1pR01BTjF4TVpLbUJQaW5ZT0FPV2xiSThVYnN5Q2Rx?=
 =?utf-8?B?UmZidElKYXBZbTdKekROb1crdmZBeDlxai9KMm9aZ1NjcHhkOVFqNkdSRjFX?=
 =?utf-8?B?b2Z6MXFNV0o3TEJTSGd0VVhpWHhtV0tJZHlpMlhHS0FxUEZHOHVjV1FzNlR1?=
 =?utf-8?B?N2h6c0tHWTZBNytCNURnOXZYNmZXeXhuMHZCM0ZyQ0JzdGQ0Rzk2R1l2bVlF?=
 =?utf-8?B?RWNucklIV0VwanIwdHFzejhDeTNudCt2SzBOc0tYdlgyd3MvUUtCbGloVEd4?=
 =?utf-8?B?ZXJiNG5OYmNRQkxPNENUZTkvaFdpNmxWZGd1VmdYZDJjY2hTV0JCZmtsQXc1?=
 =?utf-8?B?NG5CU01vZnZzTUVsdE1BZUxwY2JBUVN0amp2bkxlVy9wS3NmNE9wTEJqOHha?=
 =?utf-8?B?d3hOcXAzTVIvSDhreHNkYUVxYThCbnF1R1hXSmVNZ2lUS3NBZ0gwMXdqZzli?=
 =?utf-8?B?QUN2NXl1cHJ2bmsrVFl3SFJxODBuZXM1alNHS202Qmhxblp2RFJkeGtHNnBi?=
 =?utf-8?Q?q42sCsyBthBn6Q3AYM?=
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
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB6224.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 640ca1b3-a582-4304-3713-08de7eaf0936
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2026 14:12:17.1598
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LoSMg6dRgpsTmPvcSRrrVUA7YwuEGT3w9s/LRVq2mjXZVTYGTQ4oCRi39QPyoYNZ8lwNXOgJvI1KpUIfyua5tQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5647

SGkgSnVzc2k6DQogDQo+IEkgd291bGQgc3VnZ2VzdCB0byBpbmNsdWRlIGluZm9ybWF0aW9uIGFi
b3V0IHRoZSBhY3R1YWwgaGFyZHdhcmUgZGV2aWNlIGluIHRoZSBjb21tZW50LiDigJxVU0IgQXVk
aW/igJ0gZG9lc27igJl0IHJlYWxseSB0ZWxsIGFueXRoaW5nDQo+IGhlcmXigKYNCj4NCk9LLCBN
b2RpZmllZCBhcyBmb2xsb3dzLCBJcyBpdCBmZWFzaWJsZT8NCg0KKyBERVZJQ0VfRkxHKDB4MDY2
NiwgMHgwODgwLCAvKiBTUEFDRVRPVUNIICBVU0IgQXVkaW8gKi8NCisgICBRVUlSS19GTEFHX0ZP
UkNFX0lGQUNFX1JFU0VUIHwgUVVJUktfRkxBR19JRkFDRV9ERUxBWSksDQoNClRoZSBzcGVjaWZp
YyBoYXJkd2FyZSBuYW1lIGlzIG5vdCB2aXNpYmxlIGluIHRoZSBlbnVtZXJhdGlvbiBpbmZvcm1h
dGlvbiBvZiB0aGlzIGRldmljZS4NCg0KPiANCj4gPg0KPiA+IFNldHRpbmcgdXAgdGhlIGludGVy
ZmFjZSB3aGVuIHN1c3BlbmRlZC9yZXN1bWVpbmcgZmFpbCBvbiB0aGlzIGNhcmQuDQo+ID4gQWRk
aW5nIGEgcmVzZXQgYW5kIGRlbGF5IHF1aXJrIHdpbGwgZWxpbWluYXRlIHRoaXMgcHJvYmxlbS4N
Cj4gPg0KPiA+IHVzYiAxLTE6IE5ldyBVU0IgZGV2aWNlIGZvdW5kLCBpZFZlbmRvcj0wNjY2LCBp
ZFByb2R1Y3Q9MDg4MA0KPiA+IHVzYiAxLTE6IE5ldyBVU0IgZGV2aWNlIHN0cmluZ3M6IE1mcj0x
LCBQcm9kdWN0PTIsIFNlcmlhbE51bWJlcj0zDQo+ID4gdXNiIDEtMTogUHJvZHVjdDogVVNCIEF1
ZGlvDQo+ID4gdXNiIDEtMTogTWFudWZhY3R1cmVyOiBTUEFDRVRPVUNIDQo+ID4gdXNiIDEtMTog
U2VyaWFsTnVtYmVyOiAwMDAwMDAwMDANCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IExpYW5xaW4g
SHUgPGh1bGlhbnFpbkB2aXZvLmNvbT4NCj4gPiAtLS0NCj4gPiBzb3VuZC91c2IvcXVpcmtzLmMg
fCAyICsrDQo+ID4gMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlm
ZiAtLWdpdCBhL3NvdW5kL3VzYi9xdWlya3MuYyBiL3NvdW5kL3VzYi9xdWlya3MuYw0KPiA+IGlu
ZGV4IGM2YTc4ZWZiY2FhMy4uMzM1MmUzNTM4YTE5IDEwMDY0NA0KPiA+IC0tLSBhL3NvdW5kL3Vz
Yi9xdWlya3MuYw0KPiA+ICsrKyBiL3NvdW5kL3VzYi9xdWlya3MuYw0KPiA+IEBAIC0yMjQxLDYg
KzIyNDEsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHVzYl9hdWRpb19xdWlya19mbGFnc190YWJs
ZSBxdWlya19mbGFnc190YWJsZVtdID0gew0KPiA+ICAgUVVJUktfRkxBR19JRkFDRV9ERUxBWSB8
IFFVSVJLX0ZMQUdfRk9SQ0VfSUZBQ0VfUkVTRVQpLA0KPiA+IERFVklDRV9GTEcoMHgwNjYxLCAw
eDA4ODMsIC8qIGlCYXNzbyBEQzA0IFVsdHJhICovDQo+ID4gICBRVUlSS19GTEFHX0RTRF9SQVcp
LA0KPiA+ICsgREVWSUNFX0ZMRygweDA2NjYsIDB4MDg4MCwgLyogVVNCIEF1ZGlvICovDQo+ID4g
KyAgIFFVSVJLX0ZMQUdfRk9SQ0VfSUZBQ0VfUkVTRVQgfCBRVUlSS19GTEFHX0lGQUNFX0RFTEFZ
KSwNCj4gPiBERVZJQ0VfRkxHKDB4MDZmOCwgMHhiMDAwLCAvKiBIZXJjdWxlcyBESiBDb25zb2xl
IChXaW5kb3dzIEVkaXRpb24pICovDQo+ID4gICBRVUlSS19GTEFHX0lHTk9SRV9DVExfRVJST1Ip
LA0KPiA+IERFVklDRV9GTEcoMHgwNmY4LCAweGQwMDIsIC8qIEhlcmN1bGVzIERKIENvbnNvbGUg
KE1hY2ludG9zaCBFZGl0aW9uKSAqLw0KPiA+IC0tDQo+ID4gMi4zOS4wDQo+ID4NCg0KVGhhbmtz
DQoNCg==
