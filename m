Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013023.outbound.protection.outlook.com [52.101.127.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D443D891F;
	Fri, 24 Jul 2026 08:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784881786; cv=fail; b=YYv5wDipZcsU0QjUELCv2rQlu5w3FsoYPcxLaZvNVju0A4dOyoasxCUZU5jUQJRLbvvwwmOQv4vLKcnl8DQ0qa61eHc+OUXPSlNGPmefTAaRF8YdRE4W4wWwhb8+dkTKT7pd5LfDL/LoJ0yW/moVQAqdnLvEMB+c4N9gjJdQL+k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784881786; c=relaxed/simple;
	bh=WfP7IzcPVZOnWPmSbNcdNvvS7vbXuwGrIVt2lbYnBv8=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=fLi0J78hzbHI+Q7wOj+YHQ0y57Iyw6kgjd7ErTpIjTkqrhx9MdPmO67ggTojwFb03uKP14dXIpJx5qeNeJDMkFsVGPt0GmPU7B5a7c1AXA9OtRt2q1MMPVmG6PXIf0xieUaKIkA3kxa27kuBBTVoe7ehQB38nCyHpL/cJOKRntE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=a3UssehG; arc=fail smtp.client-ip=52.101.127.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="a3UssehG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U4yURhP6GzFwLWHJitcLmG2tfD2h1RHUBO5PFFstqHgR7v4uaiGfReFT2rXs21sHUArQCdvbO4ULYwBKAYEGhjG7ZvUqpE6wDYlyJG6btYMbrOr+OLnjiYbOAXj3HrFDf4HOyn1aUzRUDztUs/YbaZECWPOn4J41WQ2Khsrnhiw2oNRqfYm3Axk7p+jVGnrtXrA/kYXWdGpGTv+Hfa7tsPopxnaR5l7t5j16AZy33x9pcIT2ApbxSzsyYjve/h1vPk0CB4ZZK7zzfrCnZ4QxxG0N/8xW4Nd5AiETt1C5/nkEdkWCT3KZrMZJXc4LdG2+ThsmMmEfpFrdj4g/ykLxxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WfP7IzcPVZOnWPmSbNcdNvvS7vbXuwGrIVt2lbYnBv8=;
 b=w+zcYma6HL7LDCagwOMZNqO0dyJBBo0ROLtgAP9uAHUqmS3a5nqDMuCQbj9SE+oRw1QKEN0amwG55Hi7MYZNVOgHs7QFcop7QfSiwai+A11GdV+vwpaWbTfm4nFB6yR0gFfKTE5nP3x5Sqp+pisWKyYa2Y9lo2/k0wM4ffHNNJb7pa+qsQcV1MsKe0ZzTjVetUiVYlkfI8eA9negBcZpxsJYFEqMu2oBsHGkbL7HM119AaWvfU42BvTMKNH8SzbcDKZ6akKwiojnBTF9we7VObH7kzxr3LgqMXm32mERrq7aU6rbp7DciQWJB50qrrn3Lqa5KmMuyVZIu+iNEI46/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WfP7IzcPVZOnWPmSbNcdNvvS7vbXuwGrIVt2lbYnBv8=;
 b=a3UssehGwkUygDotHpJFBWwwwn8mqPRH0jS5ivT2kGdh/eNUUjrPnwlPJsW6OqBiYNonEKt1MEJoBu6lTVqjC/WprpTRLzWKSQ0SbZ8VFoQ1BMXjSD/qZAzYpcZqWYvXhfwUttpG9WtvoU0BfvCQKbrvoFBv1Xqk6YxeWUwBu7uyZJyU7feCQ+bwvcZi22L0R6xbGfpT3iIDJ7cAwdxTu6LajEh8Rc+o7CmuwxtCmN9jlgJuayKO3b2URMW/1+7YYcUNMoGQe3N9xifI6hAmgxONkGkiuA3pUONSsut7k1OP6yFmo9eQVj8GI//l4F8eXmdtioibw+JxMrZjSXQ4VA==
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com (2603:1096:400:358::7)
 by KUYPR06MB8722.apcprd06.prod.outlook.com (2603:1096:d10:92::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Fri, 24 Jul
 2026 08:29:32 +0000
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc]) by TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc%6]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 08:29:32 +0000
From: =?gb2312?B?uvrBrMfa?= <hulianqin@vivo.com>
To: "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
	"i@rong.moe" <i@rong.moe>
CC: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?gb2312?B?uvrBrMfa?= <hulianqin@vivo.com>
Subject: [PATCH] ALSA: usb-audio: Add iface reset and delay quirk for JKY
 Technology Q2A
Thread-Topic: [PATCH] ALSA: usb-audio: Add iface reset and delay quirk for JKY
 Technology Q2A
Thread-Index: Ad0bRhPoJJEBfya5Q7SBchl1mjk0Tw==
Date: Fri, 24 Jul 2026 08:29:31 +0000
Message-ID:
 <TYUPR06MB6217BD7BF1AE9B308295FFFCD2CF2@TYUPR06MB6217.apcprd06.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYUPR06MB6217:EE_|KUYPR06MB8722:EE_
x-ms-office365-filtering-correlation-id: ecb120de-08c9-49d6-f1c1-08dee95daf90
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|42112799006|23010399003|366016|38070700021|18002099003|10067099003|11063799006|56012099006;
x-microsoft-antispam-message-info:
 emgr0ebXipdcR+BepSu/S1MiZIoYW5izy/i5C0OnFRW/mI7Qwz1zUWRGezO0t1LSKB3oDnlDK6F1qy0Nxc2rU7sOfFyKOphMyGrFH8DFaweYh7VAGdbLMaqMdzyNjvHpjBmrLAWARrS0xEY3qPhQrYnGLGoBfB9TC8U+lQR8dxOS0sOPKzpRPJGcNSOeblvdkdUYm/Ik8ZkI77mHgA4vorWwU/rAWdalLZtbfjPXIz+acNFdOS6tlFGh0QAsixl4K/lh787H+PKiAIiUB1XX4YWLY+HBuSeUymA4iJ6DSnAwF/dJruL3n1OSavIPRj8SIKQLstYPupumU0G17UIOQRNzjsDGxrbhFmoc9agqeUGBEMxaoys9AuQa4oTCb7h22OPeH9xK3Rz2j43uoeMj/s/v4pxYFvCghdPfphSg6HoEJZReMlzQ4OqQYk9kY54d/lmWLaKFC4PlGexZJPjnYa7sTdsvNvgyyuD5dCQYrHJ/fTQTt2zzTMREoGRiLz/RJihK0CVrfUBh3WxoS8WqyeutHQBNKNh9rCUus04DPe8PYZfwmPfdmk0Tps1AqacTCe4wO0dRpS5WRuo7AoglG/EzEWpjL+DVmtpi8W/l3q1cQFAAFLnYNQFjRoQ29ZRWCHkS/f4yaUJCjk55Lf97E1dAi+7pnASrCRCFgiPKhEE3IWyf2psZnf8h8nKKVflBQHD41BXNSWwMAuRX5qLxkW6eg81rmMAuLSuHsWvx6Vo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYUPR06MB6217.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(42112799006)(23010399003)(366016)(38070700021)(18002099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?a05CUlRmeGpPYUo1OUhKQzFwTzg0SWJsYWp0cjJBZVl6c2NLcWZvMWpJZEd6?=
 =?gb2312?B?dlZtM1JGUDFDdVlUK3ZnVHZpTGozeGNPTjN5K2kzaFlHdUlsK1ZFR2dzSStI?=
 =?gb2312?B?TmdDRXh4NFAyT1dFTTFZNEliajFiL3MzOVhZSmQ2UjM4OCtmR2pHZWxXY2R3?=
 =?gb2312?B?SHJvN3oycXdyZlVBeW9pMWdlb0dHUTVhM0JGK3BSdWFyMFpLSkFKQmtET1JO?=
 =?gb2312?B?SUJhQzV5ZU9BRGtGSFp4aU9XWm1JcnVFc01zeVJYWnJkRUdrd3huc3IrR25L?=
 =?gb2312?B?WnB2UnVJZTNOWXRkemI2Y0h5RWswQWJkN2tTUDVNWXpHTUUwMmZVWldjSGJC?=
 =?gb2312?B?UEp3SnVVZXhrOFBUbG1Vak5tdEpPRjQxN3RPdjBtazQ5ZlhjbExzRHBPYUVX?=
 =?gb2312?B?dGhmZ3RpcEwwOW5qSHpCVG0yVjRta1BRL1V0aXg2c1VoMWFyRnBQSnhKdFhW?=
 =?gb2312?B?WUwxVVZLTXZlQ1dvWlFsRXgxQzVoUUdRbGRNcWRPeTlQWm9vRXlmcDlNYVpF?=
 =?gb2312?B?WVExbXJTMVZvWE1Rd25yRlVqQTg4Rk1qcnRrWC9RZEdPV05RbjNaUVQ4TEIz?=
 =?gb2312?B?bEd0RTNINWdCemptSWJ4aWl6cTByQ0tFL2hsM0VKSGcyUmJUSWRRUFMvaDA0?=
 =?gb2312?B?Um1pdXkwdGdLTW1UTmlBbFhhb2ZGaWdaMkNUTCtPTC93T0FGYmxCaEx5ank0?=
 =?gb2312?B?Rk41a3k2dG9uQWdzR2xlcDJyUjVjTlRoeUdzSkYrcVhmN1FJNmJLbWxLb3pO?=
 =?gb2312?B?djBBYm1UZ1BIM0pvNlJueTFCWGE4NmtzcDJiYkNaTjZTT09aKzJMc1Y2Wk1t?=
 =?gb2312?B?V294MTAyRkZ5cnpHcWJaL1ZoSGV3NWxXRWFIVXJWMDlJdHIxelNiemk1OTdH?=
 =?gb2312?B?Sno1YzdUY0l0V1RlMjB4c2EyQ0p2b2NoY1dDam5sWWtzb3c3bm9YR2dEUjBO?=
 =?gb2312?B?TVFBVjgybmE0NzcyYURsUFU2Y215V0RTdmlpWEc5UnFOaGc2Lzd5SmZ4ZWYy?=
 =?gb2312?B?SW9NTGw0dEVpQi9QYWtwWXExTHEzc3J5ZDlsa1VDT2QzdlFhUzM3ODJudFYv?=
 =?gb2312?B?S1JLZHJTeXJ3QTEyZ0luM1R2NC9KVGN0NGI0SExpakJ6NGtLSC9ScVBsUWls?=
 =?gb2312?B?VElueEtpSDlSUk1rNU1QdXFIZms2MUg3MmxBczNDQis4NWVmaXViMEh2NUZV?=
 =?gb2312?B?VXBJcmRDV2FSUXFVZTNwK0RoNEx5NXNvMUJoVHljcml3MDdaRXVvMVdxYmhk?=
 =?gb2312?B?dlhtbnIxZEpVc0pRTVYvWGtGVlRUNEFWaVJONlBuSnhreGNQQTQxWno3REla?=
 =?gb2312?B?YnlRUUlCYjhrN0o0aitmMzMrZVpKVC8xWXVoZkMvQUthQ1gzaWdDcE9SdGFu?=
 =?gb2312?B?R1hMSlB3bWVid21IbXNzMmhzWjI1VUdRMHdKSTl1TDVHSzFWcmo1cUVPNE5Y?=
 =?gb2312?B?N3dwS092U1FudnJyL09jYVVUVG1TemRuci9uMWRhRHEzZHBaWVV5cEYzUzNM?=
 =?gb2312?B?dTRYeTc0Mmpaa09MRDNmWXBwREc3S1hLN0hNYzdwNDAyd0E1cW9CSGpIVUFH?=
 =?gb2312?B?dVZUY0QzR2d4Nng5b2g3b1FacU5xRTAwV1FWTzIvcU5HbFpGNWt6dU4xdlAy?=
 =?gb2312?B?dGEwK0RLbFJtNVg3RUs3bTVxWXBRbzE0SDVNa2xyeGhGVG5Ec3I2WlRUMTU2?=
 =?gb2312?B?cnhrdzhtbFVwaWFyenIxL0dSNm9QcUplYTZpUUw1RU1YN0syWUtBcXR0NmE4?=
 =?gb2312?B?cExqZWtyRVJWMU5NTDF5Y0oxUk1vRWZ0cWpBTFNNZHVVQjJLaS9Md3A2SGVy?=
 =?gb2312?B?cU1UUHNKZkoySi94R1ZpbTRsYWtoYnc5YkxJQVVlajFITmN3SUhtLytTQ295?=
 =?gb2312?B?aE9wT201aC9sUWZmd0NmSEwvQlhGeE1NSmlnT01PT1A5eFVZRy92dTRWUTB3?=
 =?gb2312?B?Q2pMbkdLRk5lNWlJNFNKK21QNG53akhYSmZFMW9XNXZNbmo5K0JYUW5aS2xV?=
 =?gb2312?B?aUhUVlVNVlZSWkJZekRrTHhCdDVIVFllMElMSnlicS9xZVFaT0xsQk5CZkQr?=
 =?gb2312?B?MXlMZUUwRk0vWHBydC95MktLVitZS3ZhMDNiVks3TGMzYWt4ekZRdVNVdlJY?=
 =?gb2312?B?L3M5L1o5NHlEbS9KQXphN3BtYTk3M254aXp5bXdxa2Y0RUJERFhDSm1pcGdD?=
 =?gb2312?B?YXhna0t3MnRlTU56aTIvczJhQm11ekRrdTF0YjFWVk90YnJiT25QM2Q4SVJk?=
 =?gb2312?B?UXh4U08zbmo3SUh3cUJyY0ozb3JzekErTTdvU3U2Zk5PUXEzaUZWR3BiVDVR?=
 =?gb2312?Q?cByZHCkW8xCcrXBzlI?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ecb120de-08c9-49d6-f1c1-08dee95daf90
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2026 08:29:31.9306
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FNATh2OzNHIl75/71O9/HDKxuhn3vhn4BSjXmcsz6V5aESMH+Fb3blDQbiexdWuP+vtrB3btZR8+pPwy7IVIww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUYPR06MB8722

U2V0dGluZyB1cCB0aGUgaW50ZXJmYWNlIHdoZW4gc3VzcGVuZGVkL3Jlc3VtaW5nIGZhaWxzIG9u
IHRoaXMgY2FyZC4NCkFkZGluZyBhIHJlc2V0IGFuZCBkZWxheSBxdWlyayB3aWxsIGVsaW1pbmF0
ZSB0aGlzIHByb2JsZW0uDQoNCk5vdGU6IFRoaXMgZGV2aWNlIG1pc3VzZXMgdGhlIEFwcGxlIFZJ
RCAoMHgwNWFjKSAmIFBJRCAoMHgxMTBiKS4NCg0KdXNiIDEtMTogTmV3IFVTQiBkZXZpY2UgZm91
bmQsIGlkVmVuZG9yPTA1YWMsIGlkUHJvZHVjdD0xMTBiDQp1c2IgMS0xOiBOZXcgVVNCIGRldmlj
ZSBzdHJpbmdzOiBNZnI9MSwgUHJvZHVjdD0yLCBTZXJpYWxOdW1iZXI9Mw0KdXNiIDEtMTogUHJv
ZHVjdDogUTJBDQp1c2IgMS0xOiBNYW51ZmFjdHVyZXI6IEpLWSBUZWNobm9sb2d5DQp1c2IgMS0x
OiBTZXJpYWxOdW1iZXI6IDMzMDI3MEQyMjUxMjI1DQoNClNpZ25lZC1vZmYtYnk6IExpYW5xaW4g
SHUgPGh1bGlhbnFpbkB2aXZvLmNvbT4NCi0tLQ0KIHNvdW5kL3VzYi9xdWlya3MuYyB8IDIgKysN
CiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS9zb3VuZC91
c2IvcXVpcmtzLmMgYi9zb3VuZC91c2IvcXVpcmtzLmMNCmluZGV4IDBkZTdjOWQ5NDI1OS4uYWQy
Y2UzODRlMzJkIDEwMDY0NA0KLS0tIGEvc291bmQvdXNiL3F1aXJrcy5jDQorKysgYi9zb3VuZC91
c2IvcXVpcmtzLmMNCkBAIC0yMjAwLDYgKzIyMDAsOCBAQCBzdHJ1Y3QgdXNiX2F1ZGlvX3F1aXJr
X2ZsYWdzX3RhYmxlIHsNCiANCiBzdGF0aWMgY29uc3Qgc3RydWN0IHVzYl9hdWRpb19xdWlya19m
bGFnc190YWJsZSBxdWlya19mbGFnc190YWJsZVtdID0gew0KIAkvKiBEZXZpY2UgYW5kIHN0cmlu
ZyBkZXNjcmlwdG9yIG1hdGNoZXMgKi8NCisJREVWSUNFX1NUUklOR19GTEcoMHgwNWFjLCAweDEx
MGIsICJKS1kgVGVjaG5vbG9neSIsICJRMkEiLCAvKiBKS1kgVGVjaG5vbG9neSBRMkEgKi8NCisJ
CSAgIFFVSVJLX0ZMQUdfRk9SQ0VfSUZBQ0VfUkVTRVQgfCBRVUlSS19GTEFHX0lGQUNFX0RFTEFZ
KSwNCiANCiAJLyogRGV2aWNlIG1hdGNoZXMgKi8NCiAJREVWSUNFX0ZMRygweDAwMWYsIDB4MGIy
MSwgLyogQUIxM1ggVVNCIEF1ZGlvICovDQotLSANCjIuMzkuMA0KDQo=
