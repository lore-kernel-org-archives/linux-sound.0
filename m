Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013037.outbound.protection.outlook.com [52.101.127.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE96227EB9;
	Wed, 25 Mar 2026 06:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774420013; cv=fail; b=GqendPeZqkLTzP+KUP4rMI3zyPM/ZAX3cu8gWhWlow7msOZC0tNv3oFz43tjbXH2Y0S3a2yuHIaEfdmGjVsKR5LOiILVfJamx1XrCdHBXoHHK1feUUAnIMExkdV4V1skAv1omCzejO4dlKt0bvdq3V2w+VysZiEPXPS2Pfwy0us=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774420013; c=relaxed/simple;
	bh=R/dpmkCZJQxYFdza0sKCw4oD9ZZmegvIBReDCtSiiuk=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=kXQFdDx11FS/Op3w2hFJTHdeVMb2NTHzgeofpFeLH2Jb9/YfQUlgPvqRGHloUGPUUskiNgYu+sJkt1Lo45qBtjUVu++Luo0TGyI7HIo8RBrMiLn0WVB/VZ4lkTdo4bg9A9T8aaSufquXP20sG1iTTRz6on+XDM7XRp4Io3iQ1AI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=lnXrPIFi; arc=fail smtp.client-ip=52.101.127.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="lnXrPIFi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ow7lSSi299M5lmoRtRZcT+CHzMahvzyoNw3VJHgSb5eOf+wnJf5lmpZy/nlIlmZQ4qIM4S3EDQj1o1qqx36iooTzRzIP3MJVUWF4TH9MheTaMXlNV9lZh2GJQXBJtDVdYvfJY07UX81lNeiMMnXmQH12ENY+1335uLHd4ZDbJ44txXKBHLN0ZfOHsyZONBDH5hmPzOSQnkXUx1YfqnyqUIiaLm3BkEXQ6KSYmoFZ9YOkCDWOr2iYAXRfvkvLRQsTT6nuGWYvQYds5Sm5iULbKv3KW3ny6wCU/GfFvlMtEx4U915dWQK1+WDj7tLSRIJoFNrdDJ3hedu7YdzSCZkjYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R/dpmkCZJQxYFdza0sKCw4oD9ZZmegvIBReDCtSiiuk=;
 b=tMFWAaEUtoe/buN0kPr1A8Q24blwBBTW1KQYu016AoEt5RIOsKfJms/rouFF7pNnADwRFkZVHzB/ROsuKRIEQfcdUgP/MRf7Kr1hsk463tVrGVBWFVcz6z6afeS/zEup+lvVYTnzUYJt2hf9TVdRmzkfmPmFXKnpxnEetCIHtIpSFXBU8sapXwg7XjcALwhqhvNsgZcOZyijAZMGHlsFzeLlsQiXBk/Ou3O8FhsVXKEC9CR8gGaSEsbsHAqxqDRVd1tru8k5j2Lo9sFWgUhejp805oGQAQtsbIbdRrBj2RkpuPl6LUEQhl7t0meDcZNa1QlXYxJMJz1IIokM5TRFNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R/dpmkCZJQxYFdza0sKCw4oD9ZZmegvIBReDCtSiiuk=;
 b=lnXrPIFisJzNha855utEmGaUwgEryLAkjqsUavQA5TvMr4SsEUrEf4T0TiOA3grnI7M5NNbTpCtXp7RrEabK5QwlsjEzKb++QFycTS2nPjhrhz3A2uePjnVcCqgiOyq4+3oLGJDoJy0yfD6zjQPcPmPF87naLRSFjNBCsaiN/jY/J84g30cVoW3LfC8JUxN9rpFJoN/8tnet1jEqnXWjGtRnIh+f4hXd65oslMUzf2jQ7ml2ShjnwQgKc5cY8vk9yuYmPPYw88jUIv//sq9JywUG1lj2+j5AdHcn5CtA9LeFQh30eiaJ7sXd6OHfhjlNiid6A5EMd8d07wY/of9mWg==
Received: from PUZPR06MB6224.apcprd06.prod.outlook.com (2603:1096:301:116::8)
 by SEYPR06MB5232.apcprd06.prod.outlook.com (2603:1096:101:85::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 06:26:49 +0000
Received: from PUZPR06MB6224.apcprd06.prod.outlook.com
 ([fe80::2cfc:b348:3e15:3751]) by PUZPR06MB6224.apcprd06.prod.outlook.com
 ([fe80::2cfc:b348:3e15:3751%4]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 06:26:48 +0000
From: =?gb2312?B?uvrBrMfa?= <hulianqin@vivo.com>
To: "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
	Cryolitia PukNgae <cryolitia@uniontech.com>, "pav@iki.fi" <pav@iki.fi>,
	"jussi@sonarnerd.net" <jussi@sonarnerd.net>, "roy.vegard.ovesen@gmail.com"
	<roy.vegard.ovesen@gmail.com>, Jussi Laako <jussi@sonarnerd.net>
CC: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?gb2312?B?uvrBrMfa?= <hulianqin@vivo.com>
Subject: [PATCH] ALSA: usb-audio: Add iface reset and delay quirk for AB17X
 USB Audio
Thread-Topic: [PATCH] ALSA: usb-audio: Add iface reset and delay quirk for
 AB17X USB Audio
Thread-Index: Ady8IAmuq4QkJgPCTMClRjvTzshHFQ==
Date: Wed, 25 Mar 2026 06:26:48 +0000
Message-ID:
 <PUZPR06MB6224CA59AD2B26054120B276D249A@PUZPR06MB6224.apcprd06.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR06MB6224:EE_|SEYPR06MB5232:EE_
x-ms-office365-filtering-correlation-id: e3b90c87-ae28-4664-85fe-08de8a377eb6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|1800799024|376014|366016|18002099003|56012099003|38070700021;
x-microsoft-antispam-message-info:
 D0cIa7vVMDFzGANgU/erP0Unh0JKS+uaqqAycBN4jn/HBTpwS4pjDZM/PvUfjCh3riySbrvT4+kL3xTTYCKVtwgiYOHYbgkR5HhYH5Wgh2oRqzA2ddvguqzl4dSp5Rb8FBkfxC9uwMoHu7CXHDJPt/8cgwRzRoIGIfSyLzKfp3k9IMbdJ3/EFx+mBaH9vYQ3MlsntB4+y1/RAhrZQ83ycbYuma8Z7eGoOnwgyf8RKgWAh1PVFAqBjiRoZBiDd5jYCBa6BjFrcHQaty9AxkGDaHX4tRbbYJS2ME1X5YCLNshcNUuyZmny32KnwDd2ySfd8UF2oYt1qn/ZIXdp+1FRVFIAb2/AurFfwzEHjbstQk/upU/x+71CjC3qQuRUzCTNO5QEwj04gupxYCkFZOewHRoAUswcvPQLrPh87rwlozZQyUcdEJYV2ETn9NnHxzrOsmEYuG1+T+UaaF5cfNFkpU3tprbFtY/W4NTcV6ZnqguTNOa1NzAyc2wtKiKVMYKltHlu1W5KpEoVeoJz/hQdrUzGpSTOLTY7CFAF2K5vy+T1tQUiCL4UmE7q+Q7pfbet4DbfCARnlgakTHVLAyFxQwao3q48NQ/3U4btfk9qH2WpSsrGlOFdlka418PEu1ziT4eoflCiVO36srscIA3bn1fEhcElJw4hVVVlzpzq8D3EbVqQX/Syu3Hfg/68kU+NS2p3ADYJJKr+r61uR2cxZWO0rFLWxWM4By2pFOCPtqySJ0TbOyahVHq/JZotn0n4QQjiiPsFeTO8EALznjMB/xVvXfa+Zr3W/v1Paq0u1xA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR06MB6224.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(1800799024)(376014)(366016)(18002099003)(56012099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?ZUtGZGgyOWpOOXhMV3lSYWR5MTlMZnhNaGMxblBDM3ZNM01pdFA2Smc4bUwz?=
 =?gb2312?B?TGl0RU5qK05kMHdHUnpRY2krN2FNMGgyTjQ4WEJzTXAvUWRXV21GYWVyWkZR?=
 =?gb2312?B?N21ZVHdGcStOK3JKanVINCtTZE9yS28rWjcrL00rL0Y0YzlFZFJXbTJhendR?=
 =?gb2312?B?dkR6enpaVW50MndLMkpmNGxOUmx5UlVJVlc5VjA0Y2RDNWpMZ1VBdCtuSkpt?=
 =?gb2312?B?SDdBSmwzYkNNUVJmbFdHMFdOc2Nua2ZiQ3c4aWpSUXVEVmJ6Z3gzYStUYVc1?=
 =?gb2312?B?OXU5bW96TE9BcEUva2VJZEptS2FSRk1pcFMvRFVEVDVseHFVdEdTN3draWIv?=
 =?gb2312?B?eWM2aHRJL0pKV3Q0SGo3T29WbnorZGkvejY4M0NIUUxiMVVIRXBFcXR2WWVl?=
 =?gb2312?B?czRxT1VRRUFaZ2J0UHlCM0tDQmF1eXpyQzhOejY2eVBTUkpuZkk5QXorTU1T?=
 =?gb2312?B?bjV2dEpvNkRCdGIwY09NNzVxUVp4aVZ0ejhUQ01PTTVXRzZnL3lWd1MvM1RM?=
 =?gb2312?B?YVlyMXB3SmJyZytmb1c4bXZTMGhLVWswUjhNRmwwd1oxeHhQK1dBS3RGUzJL?=
 =?gb2312?B?ZU5IM0lKcWg5aVlyTHEyOS8rNG03aXhWelZ1Sm5zSDZiOUIvanBDbHo5RnlI?=
 =?gb2312?B?TmJXckcxVHBNc0hHUnFOWG43WldwZC9EVXI4V1N2UmZBT2xxdXV0MlA3dVhI?=
 =?gb2312?B?Vyt3NVR4K21jMUdZTlJSRHlHNDh0UndWbHlWc1F2L3hDMnhjMjVBaU15djlU?=
 =?gb2312?B?YnVlWFRpNGhCWXIybXBUaDNuN3MybEZ0d2tqSC9uTStpU1ViTkZpL3Q0dHRI?=
 =?gb2312?B?Uk5FTWlUYlMvYXpDRzFPRWpaM1NoemVxWGp5V1lQbjdMWkdaS3lDQStoMWp6?=
 =?gb2312?B?S2szb01JeTFWbFh6WG10cisxb3pMU1ZIamNXR3hRNE5NVWJsbkYzWTZKZGpZ?=
 =?gb2312?B?T0x0a0QzMU1DeFpLcUVuTWxyM3pqdDdleG54aE5RaG83RHNjUlNFV3FPSjFL?=
 =?gb2312?B?aXVPc1RxU2h6YXFzSUQyQzgxYS9kM2VjcER5MzJmanJyY29ZVDVNbjhENkNl?=
 =?gb2312?B?QjUrMUxUL3BJNnhYWjRkSS9zckVYU0JiWTIvdlhDU1hsaGd1RjIrTnhxVmVj?=
 =?gb2312?B?WEMzcDRzU2w1ZlYwcGRnS0tTVFk5Z1hNUDFiOGgvcWxMNEdlb3FYNGpJVm1H?=
 =?gb2312?B?ZmVSQjBYc25RNnhHSXVrSnZNNXhEMFNsaFhXeE9GbGdtcUxCU0ZvZ2l3bjh6?=
 =?gb2312?B?cTE1eHd2anc5TmFsbWRwSzVwK2MyZ1dON0FpQSt2MzBHRzIzcVJRQVFHNzlw?=
 =?gb2312?B?TmdmT20yTENFT2VMOEhlbm9IT1JLcHVaVzg3TUtCNEtRMTR3YVBtKy8zb3p4?=
 =?gb2312?B?YURaQ1hnQk56ZThmWVdzTGxYRkM4ZllZNi94aGg2eXYzN2tTZzNiMEs5QUtL?=
 =?gb2312?B?ZVF0WlpQRDhIZkk3dlRKSE9ubStGdUZ5MkxSUnpMY01EVGpqZWIyVlVHY2pT?=
 =?gb2312?B?cFBUZU1YMXNXbVdMMEdFbzNFU0NVeHBvNGFOTjZYZ0c3K1U1YlI4dFNHMXc4?=
 =?gb2312?B?OTQyL0pqTW0wcFpEN2VLRmlrNHYzcjFiK2JncGxaYzZwV1QwT2hBRmZYandX?=
 =?gb2312?B?MDNhY2pyRlNZdjFKcDBLbUdlbHJXcHpaVlZVSDFzZjlLYmk4TXh6TlE5K2xi?=
 =?gb2312?B?OTlSVVdtWmNyOExicTZ1c0ZWTlczVlZpYVNpUGp0djNKTWNYbVRhZE1oV2kr?=
 =?gb2312?B?cFRIYXVXdTl0UVV3S0RoVHh1ck51dldGT29UM1RseVpFUU40WWdnNVFTZ2Z4?=
 =?gb2312?B?NHA2TWxOMW5zR3BYZ1Z4WkpqcGVHR091SlJBd09yZ1RWWHpJS3NMSGpSMm5j?=
 =?gb2312?B?TXMvaGZyRlNnL003L0ZpL0VvWXlNMnh1MHl4TkZGT0N0T0xDcE8vZmdrMGpz?=
 =?gb2312?B?bURzY0tmQlB3NzZNZlBtTVFITTFMM05qMHdBdHBKc1p5U3JmQS9KSFBEa05k?=
 =?gb2312?B?T3RoUi9jTGNsdmkzSzZ4ZVhiVGZoVmhkSXFwaGt0aGt0TS9wTDYvZUVBY0lQ?=
 =?gb2312?B?bXp1VERUVHh5bWFwK01xdENMQW9OOTRuZHJ2eEtBTDhQbEs1bysyQUxkNFRl?=
 =?gb2312?B?YW81Ti92U2dOMFMyUnJ2dXY3VXpWWTBPbFFsY2NkWHAyNnB2SVllUXdhMW56?=
 =?gb2312?B?WnVLdGY1ZElvZVZjU1hsdXYxRldWbzA0SXpmbXhPaENlbkdHdTc5NExCSGxm?=
 =?gb2312?B?TXVkeURiUDlmNnZBcTE4UEVtM0U4UnIxK3MzQTNiTDV1WVpzcytHZGRiMlBI?=
 =?gb2312?Q?KCegYvI/bsq1QtVEok?=
Content-Type: text/plain; charset="gb2312"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e3b90c87-ae28-4664-85fe-08de8a377eb6
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2026 06:26:48.6349
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S0WUX9sA+CKEXLFO/gtIldjVq/5UD+xrFu68glk8G0B/z5Fj/eCcmVXq4ZSl0EptTyhptjCZNcC/ubyrZvF8nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5232

U2V0dGluZyB1cCB0aGUgaW50ZXJmYWNlIHdoZW4gc3VzcGVuZGVkL3Jlc3VtZWluZyBmYWlsIG9u
IHRoaXMgY2FyZC4NCkFkZGluZyBhIHJlc2V0IGFuZCBkZWxheSBxdWlyayB3aWxsIGVsaW1pbmF0
ZSB0aGlzIHByb2JsZW0uDQoNCnVzYiAxLTE6IG5ldyBmdWxsLXNwZWVkIFVTQiBkZXZpY2UgbnVt
YmVyIDIgdXNpbmcgeGhjaS1oY2QNCnVzYiAxLTE6IE5ldyBVU0IgZGV2aWNlIGZvdW5kLCBpZFZl
bmRvcj0wMDFmLCBpZFByb2R1Y3Q9MGIyMw0KdXNiIDEtMTogTmV3IFVTQiBkZXZpY2Ugc3RyaW5n
czogTWZyPTEsIFByb2R1Y3Q9MiwgU2VyaWFsTnVtYmVyPTMNCnVzYiAxLTE6IFByb2R1Y3Q6IEFC
MTdYIFVTQiBBdWRpbw0KdXNiIDEtMTogTWFudWZhY3R1cmVyOiBHZW5lcmljDQp1c2IgMS0xOiBT
ZXJpYWxOdW1iZXI6IDIwMjQxMjI4MTcyMDI4DQoNClNpZ25lZC1vZmYtYnk6IExpYW5xaW4gSHUg
PGh1bGlhbnFpbkB2aXZvLmNvbT4NCi0tLQ0KIHNvdW5kL3VzYi9xdWlya3MuYyB8IDIgKysNCiAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS9zb3VuZC91c2Iv
cXVpcmtzLmMgYi9zb3VuZC91c2IvcXVpcmtzLmMNCmluZGV4IDA0OWE5NDA3OWY5ZS4uMTVhMWMw
MzQ4YWVhIDEwMDY0NA0KLS0tIGEvc291bmQvdXNiL3F1aXJrcy5jDQorKysgYi9zb3VuZC91c2Iv
cXVpcmtzLmMNCkBAIC0yMTQ4LDYgKzIxNDgsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHVzYl9h
dWRpb19xdWlya19mbGFnc190YWJsZSBxdWlya19mbGFnc190YWJsZVtdID0gew0KIAkvKiBEZXZp
Y2UgbWF0Y2hlcyAqLw0KIAlERVZJQ0VfRkxHKDB4MDAxZiwgMHgwYjIxLCAvKiBBQjEzWCBVU0Ig
QXVkaW8gKi8NCiAJCSAgIFFVSVJLX0ZMQUdfRk9SQ0VfSUZBQ0VfUkVTRVQgfCBRVUlSS19GTEFH
X0lGQUNFX0RFTEFZKSwNCisJREVWSUNFX0ZMRygweDAwMWYsIDB4MGIyMywgLyogQUIxN1ggVVNC
IEF1ZGlvICovDQorCQkgICBRVUlSS19GTEFHX0ZPUkNFX0lGQUNFX1JFU0VUIHwgUVVJUktfRkxB
R19JRkFDRV9ERUxBWSksDQogCURFVklDRV9GTEcoMHgwMDIwLCAweDBiMjEsIC8qIEdIVy0xMjNQ
ICovDQogCQkgICBRVUlSS19GTEFHX0ZPUkNFX0lGQUNFX1JFU0VUIHwgUVVJUktfRkxBR19JRkFD
RV9ERUxBWSksDQogCURFVklDRV9GTEcoMHgwM2YwLCAweDY1NGEsIC8qIEhQIDMyMCBGSEQgV2Vi
Y2FtICovDQotLSANCjIuMzkuMA0KDQo=
