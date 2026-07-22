Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11013013.outbound.protection.outlook.com [40.107.44.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59FB3624DB;
	Wed, 22 Jul 2026 04:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784695870; cv=fail; b=RVIyakAADV7MAt2E8oVxRahWFJ2Y5VBw0Fz65MshvP/PDegpoLMSOnKoEFKCl4VbHZgN9xcgg/I8R7OtNwH3Ww4e1PfQfk+HdqTUv9MSm04YGhQ8i9GeC0aoYXNU42ZVURvwPgj2YkEJtmOr+nSlZYHN0zhEwdYJJewVzGcNU2g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784695870; c=relaxed/simple;
	bh=SR49CLucby1hVicSP4oQ9ksYmbSwAdhcE6j8+Bm7dcw=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=kMZ0N5h3gKwHCqhYRPHipSgVJbCPVTfk/COaBoqY2EYJGh3osxmzdYA/OBttVOc2P25yIHO3/qFwAPz20bdbNd969A/4xGBGp5JgRu5L30nQwxczI49B7f6PeylNEDIuMBrcQdlliRtno8Z3OBD0s5glj/2gj98w8HnvOXlfGvs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=BKmdKG5v; arc=fail smtp.client-ip=40.107.44.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="BKmdKG5v"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eKwJuQt+cmdAmX/bpRujVOIs2b9amEFMNQSkdDfsXInA5pmxJZIl142ObVZe9BpSgIQRcSn0Hlkj3cf2QILvw6XcedmXNcKywOuPdI4jDASPgFAYI11P2TkF27t1WJ7EmS7w386z/YkKRlG727o+o6QykJTUSu5vfXLSR11y7J+vdx8sRFiS6M7thtPXEyorSewiR5Z9zDwnrr83J2l7ZTBN8tVI2BxWHi6VBk3RIIduxulpwNr9Gy3dGn2Bh12/l5AXbksfUMqMzxBcF6nctAwY1CjVbiWsFUeK4Rlu77kdG4HgBwTr9iCqCk0KmDohMqdOwm+hx4jKypxpV/fNGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SR49CLucby1hVicSP4oQ9ksYmbSwAdhcE6j8+Bm7dcw=;
 b=dGSxkG5BcPmJMtt39KtXK+maoto+MY5PtYY9TuQBHClytuTIRxrmvOKKMoTxwHTYspFZ94hOBd/izjh6i/LZsOImbNy8oqx150lZOkv8n9SS2VUqbrXtNL2tLsK1cf1+YdnCe1jnRS0I9Yn9eXCBKgD1yTLrO5D0YWef0hvhrzD7J6RGTjcbr0NdlXUpGkS1Iy+VaOvMiccRLPEZ/1hLgGFzX1nDPNcqzTHFHvLvYPTiFdNeNFywf8lGLxOxni8s1oY7SfRr4tcPGyTg9OZJkvo+T0p08k1IBYQvpR6epU4zLEypYpGweMDdQv1G7GTZ805dv+sDDAkRZqbRTCpl9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SR49CLucby1hVicSP4oQ9ksYmbSwAdhcE6j8+Bm7dcw=;
 b=BKmdKG5vsLzD0BWyjeCdzUUlb338E7vZzn5YiM2bs2DMNV17uBHVmfK1+Xeoef6LLS2+UAVHE+yVIEYCe9B5AIsRYehxJbvqDZ3gQCDkCgPurwUO6pJNY5ncrGKDBGpWHEP4bNzpZyuDcFMNApT0lS+lpsBRUYx+Y5Wm+/L3VNwtLMVuYnks6QoMrOS3fuNiGCWpSFKvEf+g0AD6hhR0B4IYYRnJUmzc/fc4Jb6b4VeZnNOhXoyjjUL5cWo1CuCKjy7AL/nyUx4N7E6P6tuYI/M6BEJC6dDwywWR6cLUiRmB30lBaI6VpU2gSBKPTvzSUKO1VvT5hTpJa3LRYyLMbA==
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com (2603:1096:400:358::7)
 by TYZPR06MB6546.apcprd06.prod.outlook.com (2603:1096:400:458::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 04:51:04 +0000
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc]) by TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc%6]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 04:51:04 +0000
From: =?gb2312?B?uvrBrMfa?= <hulianqin@vivo.com>
To: "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
	"i@rong.moe" <i@rong.moe>, Cryolitia PukNgae <cryolitia@uniontech.com>
CC: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?gb2312?B?uvrBrMfa?= <hulianqin@vivo.com>
Subject: [PATCH] ALSA: usb-audio: Add iface reset and delay quirk for Generic
 USB Headphone
Thread-Topic: [PATCH] ALSA: usb-audio: Add iface reset and delay quirk for
 Generic USB Headphone
Thread-Index: Ad0ZlO1BPCkDJxiHTNSKhkjrjc0+AQ==
Date: Wed, 22 Jul 2026 04:51:04 +0000
Message-ID:
 <TYUPR06MB6217572BF01C286C94B7596CD2C12@TYUPR06MB6217.apcprd06.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYUPR06MB6217:EE_|TYZPR06MB6546:EE_
x-ms-office365-filtering-correlation-id: 9411477e-f6ba-4c4e-f259-08dee7acd5e7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|376014|23010399003|366016|1800799024|38070700021|56012099006|11063799006|10067099003|18002099003;
x-microsoft-antispam-message-info:
 qnGOxEYw3eKD4XR3boRnC4MPFKriI1knMtY7wPvEvAIrl7zjBkzmLjOBafk81tGiju48A1JnAwTGJK/k2Ur+WzptrUb/WnsTtoJ8NtphFWUynFLjRD8BOVXUmWMXDKQKlhZc0gD0mJf2JlOdpmo/eTudP6k4/RSFuPUpest93LGIl5V3hgb46swVxa+blkq+hfJvEe9odbs4i8c2a9v85WXZLhD1rEmRNbWm9jtwbqJ+bTrXLY+K9RC3wnXBjBoJ3ePL1A0eYdI4ClJEuaAN3UMbAjE1HF2FxhNY3wwRyEysLEdDVMjKPnNTibT+13nc7EFTyv1VZnkJqpFx+EKWVjMNsGiyK6cPiNZCYfT+7tnItZ1O1lCaBLGdyupvdNGpswholINgq2IrBB0RvhFv8bfjT9Av1Gi1qrESceHqMpqwP0qxvrpjUSSw6aOSUnOWAY0A582oDt4bVA87YcUkTZkmxb7NobAahiegR731hDN/2QrB03s2Cv6LF4XD9QAZzS6R2jHG5+5R6ZpzpRxaKCIQw+Ve2vAP1kg4nNjRD1DxNC8N/wKr7AdgTQHq6mOEaSd9nq//EPKTobwgbwNTBFJ0oSU5fNbXqmYJiy51yDgkYZbqYzgvPVGbxFkkp1aZxiVbUpcQuttdrMsf25/ZyHOwhN0Riqs+ym/JVIspZoeuG0mOPMNeKpnZT20IG0+p93jWeiY+DRdxzi2YhgBvhl+RxnbuCgBhlnJOL9935x8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYUPR06MB6217.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(376014)(23010399003)(366016)(1800799024)(38070700021)(56012099006)(11063799006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?SnpYVlRwclpsYkxQczlXSDQ3ZlBLbnV3TlFCL2JtY251Mytnd0JpMlYyWXUz?=
 =?gb2312?B?c2JmRzdWV1dnV1BVN2I5SmxLWmd0NWdueW1xM1g2Zlo0c1VMU0NxbFpKaFlY?=
 =?gb2312?B?bkcxOHBCUTV3S2tDSEJWb1FGQXpyYzUrRW5NREtscWFkdFRXeEhBK3NJWThT?=
 =?gb2312?B?R1VrZ3NKNXl1MFd0R09FUWJkb0x4anY4cDhydXV4eWk3NDBDRkJJdlN3OVVs?=
 =?gb2312?B?eXByZTFWUmRkLzUvT09PWE9IM25vT2lXaVREUFJ4YlBjdWpWL2tiWENhZUVm?=
 =?gb2312?B?d05reTRjNGx6aE9VbEhtbDk4SzJGVVRZb0lxUnI0Slo1ZmdoeG9CUVdFWE1V?=
 =?gb2312?B?S2dPRVdFMktOSC9EU1o1WW85Z09pd1pyaXo2aTBQMmFTTUM4Sk9PRy9Wd09G?=
 =?gb2312?B?RlR2ekdHTDFoM0Vnc0FyRW1GdUVEMGxWSThrYTBzWU1uZ002eUcva1ZWbHcx?=
 =?gb2312?B?S3kvdWJNa20rNEEwc2dUWjlvcktSTytEMjZadHdyTEhST3J4azV5R0dFYzJu?=
 =?gb2312?B?NXlxdGdWbzB3ZFRoazYzS20zZEF1Y1FWQmg2QjJWRlpITE5wZzJadXhXdTdK?=
 =?gb2312?B?bkxORHA5T1QvamtzSW9WTks3Y2dIeEtrWGhNUmRmRS8vWnJxalE2cjFLdlha?=
 =?gb2312?B?TFJMRityR2hZZzVoRStwR2I0WDBGeWZNOHY3RWM1bWdybHptTFQxQzZGek5i?=
 =?gb2312?B?VVYweXJ0dDh4MFhDK0ZHeXloanRXMnpySXcyVms1dzkrTUczQkx0cHptNWg5?=
 =?gb2312?B?WERoSUZJdGlpSmtGT1hlYit4RnVVZzNTVVdHLzUzcWwyV3pMczFsdXNUR3Er?=
 =?gb2312?B?azkzc3hidXkyWTFSb3VVL01BckF6bUM0a3FNQkNjYW5VaVFvSk5nSGZmalpK?=
 =?gb2312?B?ZFRhYzR6ZnpIeWpBVStEN3R1WTZkdy9XaU42bGdoSUZYSHJDVFBzV2JTbVBW?=
 =?gb2312?B?dHVMcmdoVHZhQlZQdERTSDFTSUNoYlN5eXVUOU9SQVlLOHF2T0dMK0ZVNXZU?=
 =?gb2312?B?NEhZZ3B6Z2NmTmRZSENJY21xSzRUaVp2UUpDQW1QaG9zYmh1bFg3L254YXph?=
 =?gb2312?B?UVMrb0luUUZkZkVZaW1Jb2VsamZ1N1FOdFJpRkRCQXFVbVhOUmM3d2lDalpv?=
 =?gb2312?B?RVdkcml3WU42YnFyc3VkVkRBbzRaS3lFaVcyMWJtenBtQ2xvRk05eEhzcVNI?=
 =?gb2312?B?aU9BYnVjT2J0ZUFFK1h1dVhubUVUVTROV2lNZmtrcnl2d0JFUkdueTdrVVU5?=
 =?gb2312?B?UHB4ZmZwOUFKa0xyZ09wdzM0ZTBGVnBUTTdkMzdqcjR1ZFlBUjB0RjNVMWRJ?=
 =?gb2312?B?R00xNXJ4dDVucVhMS1JzMU9kdys4NG00T3haSndHWkFNcllzZklVMmVRL1JK?=
 =?gb2312?B?YkNKcDYxY3Mrc0d4eWJDZmZjZDEyT2NnRm0xVUtIK2RpTHNsV2szaXVraXIz?=
 =?gb2312?B?OU9FV1ZNbkZySVYvN09QUXRETk1vZG52Z0JaVG5rRDFQSEgydnJ2STMwajZ4?=
 =?gb2312?B?aStrQ3U1dEVmdmZmMElPUGhuN0pxeEVxRG0zKzgwMnVHSXZVNERaWDB4cFNi?=
 =?gb2312?B?dUlpQlZvQ0xIeDZkYktBejZwb1BuOVM4clhLTGh4MC9Pc3JTR3hBTHBEejRP?=
 =?gb2312?B?cSt1T1lwSjJIUi95MDhVQmNTY0pEOXRqb2RCU0U2dVFsYm1lRXFNa3BWK3k5?=
 =?gb2312?B?SnkzbWUwNHE0TDA5NTBmQ0psbFZ6TVlNZXB4N2FGZUY4WnhLRlZpVWtPL3Np?=
 =?gb2312?B?MjJubkZFb0p0MmNQMUJyKzJyaEJBaHIvVVhqQW96WDJ1UUp0UVZ6RnFTZldj?=
 =?gb2312?B?aGx5aTR1RWhXeXNpNmxZbzhSemdibktvcGxtQmo4YXZIeW5OenVTZ1poN3lY?=
 =?gb2312?B?SUNRNWVObHBHUGRWWGRVNkxEL01IQTF1LzZVMk40U0RCekNwOXJMMGM1MVJi?=
 =?gb2312?B?RE9RcEdTUXR6a2RoQzhGRGFQZlhLZFZrcG9QWmhrdVR5UGszdkxWSlJ3TUY0?=
 =?gb2312?B?NUhmeEM5ckErL3JDZm0yQUsrRWJqbGc2NDNkYUtKRThSUUVRSzVpSVVaWWsv?=
 =?gb2312?B?TEFKZ25wbTdNcWVQdzkxME9WdEhTWDJUUW5ycERva1dpdTUzaFVMdWJtTkta?=
 =?gb2312?B?Wk0wTkdHT0d5L2h6SEViQ2Vva01vTitPSjIrSlluakhUaXAzVkx4OURzZ3pG?=
 =?gb2312?B?TEErdjYrNEVjT2s0NDRON3U2N1FxNzkzWTh4RXF0TDJkb3ErUXZ4dGcvV3dz?=
 =?gb2312?Q?ZaItMhfp5didwcE+3YPMiEZEW0LLafh4b1M2LMKy1g=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYUPR06MB6217.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9411477e-f6ba-4c4e-f259-08dee7acd5e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2026 04:51:04.2005
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g8u+FYtiNDIOSVtnfx68HGYZaL0xm6KF2dRK9qBe5l3Jgv7+M9lX04wWy33wUrAs1N15KaQ/chAL4YHa+NY1Tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6546

U2V0dGluZyB1cCB0aGUgaW50ZXJmYWNlIHdoZW4gc3VzcGVuZGVkL3Jlc3VtaW5nIGZhaWxzIG9u
IHRoaXMgY2FyZC4NCkFkZGluZyBhIHJlc2V0IGFuZCBkZWxheSBxdWlyayB3aWxsIGVsaW1pbmF0
ZSB0aGlzIHByb2JsZW0uDQoNCnVzYiAxLTE6IE5ldyBVU0IgZGV2aWNlIGZvdW5kLCBpZFZlbmRv
cj0wMTI0LCBpZFByb2R1Y3Q9MGMyMQ0KdXNiIDEtMTogTmV3IFVTQiBkZXZpY2Ugc3RyaW5nczog
TWZyPTEsIFByb2R1Y3Q9MiwgU2VyaWFsTnVtYmVyPTMNCnVzYiAxLTE6IFByb2R1Y3Q6IFVTQiBI
ZWFkcGhvbmUNCnVzYiAxLTE6IE1hbnVmYWN0dXJlcjogR2VuZXJpYw0KdXNiIDEtMTogU2VyaWFs
TnVtYmVyOiAyMDIxMDcyNjkwNTkyNg0KDQpTaWduZWQtb2ZmLWJ5OiBMaWFucWluIEh1IDxodWxp
YW5xaW5Adml2by5jb20+DQotLS0NCiBzb3VuZC91c2IvcXVpcmtzLmMgfCAyICsrDQogMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQ0KDQpkaWZmIC0tZ2l0IGEvc291bmQvdXNiL3F1aXJr
cy5jIGIvc291bmQvdXNiL3F1aXJrcy5jDQppbmRleCA0MTE0OTU2MWFhMDYuLjAwMTEyOTgyMWJh
YSAxMDA2NDQNCi0tLSBhL3NvdW5kL3VzYi9xdWlya3MuYw0KKysrIGIvc291bmQvdXNiL3F1aXJr
cy5jDQpAQCAtMjIwOCw2ICsyMjA4LDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCB1c2JfYXVkaW9f
cXVpcmtfZmxhZ3NfdGFibGUgcXVpcmtfZmxhZ3NfdGFibGVbXSA9IHsNCiAJCSAgIFFVSVJLX0ZM
QUdfRk9SQ0VfSUZBQ0VfUkVTRVQgfCBRVUlSS19GTEFHX0lGQUNFX0RFTEFZKSwNCiAJREVWSUNF
X0ZMRygweDAwMjAsIDB4MGIyMSwgLyogR0hXLTEyM1AgKi8NCiAJCSAgIFFVSVJLX0ZMQUdfRk9S
Q0VfSUZBQ0VfUkVTRVQgfCBRVUlSS19GTEFHX0lGQUNFX0RFTEFZKSwNCisJREVWSUNFX0ZMRygw
eDAxMjQsIDB4MGMyMSwgLyogR2VuZXJpYyBVU0IgSGVhZHBob25lICovDQorCQkgICBRVUlSS19G
TEFHX0ZPUkNFX0lGQUNFX1JFU0VUIHwgUVVJUktfRkxBR19JRkFDRV9ERUxBWSksDQogCURFVklD
RV9GTEcoMHgwM2YwLCAweDY1NGEsIC8qIEhQIDMyMCBGSEQgV2ViY2FtICovDQogCQkgICBRVUlS
S19GTEFHX0dFVF9TQU1QTEVfUkFURSB8IFFVSVJLX0ZMQUdfTUlDX1JFU18xNiksDQogCURFVklD
RV9GTEcoMHgwNDBiLCAweDA4OTcsIC8qIFdlbHRyZW5kIFNlbWljb25kdWN0b3IsIHNvbGQgYXMg
UmVkcmFnb24gSDUxMC1QUk8gV2lyZWxlc3MgaGVhZHNldCAqLw0KLS0gDQoyLjM5LjANCg0K
