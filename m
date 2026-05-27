Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013004.outbound.protection.outlook.com [52.101.127.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4201A21A447;
	Wed, 27 May 2026 03:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779852794; cv=fail; b=HTz3KY440+ajkdziwCl5m+TwmkwxL1oMG4mB19h2C8l/wOm+cALn9kD7Oxcg1vrkzpKHEaxsqwkoSr+d6zTmnCUuij9yzgzVuP5Kjr4ieSSSxPQxhyZXmj4j7JG8EdXninK2BW0eyFgoO5F6tDFZTIQHlCAKx8H0vv1UtO6XZZA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779852794; c=relaxed/simple;
	bh=hA9L2Ll/S/BRv08VdMrnuDvlxS4+Nx5rT7LvP+udJU0=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=NqVQnYPyWTnY0cIDQoiobumAzBKTClyQxXxQHxzP0mqlXiNvviw66YbcsaLN4vYjZ9qQ17ij1rHf4M1wA3hec/OrwjwBPcbG9+NgWzStRky8IHOUcyhtv42uoL5f6BgB4FDBVk7V4BxJd+xokSV9MlgvCnT2CwlChVLXPz2ZeCs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=O123Igyd; arc=fail smtp.client-ip=52.101.127.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="O123Igyd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=McnY71y7VfemUN5vMzJhW7pRjRpAdC7yGA9MTcwKCNJ+irkhuPrLQ0p5ta9+A2xqEa9SHMF5gyo+0F1Ssyc7QaXSizqKjWn0F6WhMNvG8Mac8dBGB2kDNZxaom5zo8Jp2VQTnc9lvrArewE134hQTO6atE/n/dnLVsiEAoahaanEQ5PvttAo81wlsUAZCQtAVSoSTH0Cb1Zd5hcB23KZt/FW1rITk2Dr+dwqJOO/gtFUdJcIk6Ytre2Op48WhUQytEsaWb53fXYFvwkeuOCayzu5ayDj9wTmAXrUDjWf1nMRtHIOnqSuKUPZ9CvdZDu6ve/c5LuOCwp/oT57TyNmQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hA9L2Ll/S/BRv08VdMrnuDvlxS4+Nx5rT7LvP+udJU0=;
 b=m0YQOo9UO85NqxDiCmvvrGEz2KunKcTWq1eFn4dZ/yVmQW3vT/+OcKbPwXtsLKQdMTrT1Fdjbk32xVzvzIbVYEJg/jCEe6JWtQHUwkkMjr8IrYHR6wKH8JMjjFy+ybIjcglaVCE7p58rzE5BXYt4fOIMmHWl0fi5mnV1ANDJaKVhSkMDuYJiFyexXD+2tsbhjN/TiOpYD0V4ODTXRBLlAE45pnVEz0mErySY9+tmZR6nO9NuN7lW53aQWjC3i0V8Gde2L+os34BOYVLIngLCdZRnRMrUfmdop9ycZVK3PRXIAxUg0Pl+rdSbNo+NMeJjw9zKe8jBqRBdrx5jga3dFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hA9L2Ll/S/BRv08VdMrnuDvlxS4+Nx5rT7LvP+udJU0=;
 b=O123Igyd45IyxVKmPzsJnC/pkmKkYtQ9KipIvwgVdBYQWSTQdZUzvuZJQW8WdevmS0EwthyF1/xRZ9SuC45J1K4QcU0Vl44z5xTMuiXQVn71K42DZ8t64eyo/wuxgzYO5eyw5nZr3yoII20cAB5VClqFzoTmn0teGklQa7MIy121jEf2lA2Yh8yqRXKVcXkdMMPaZ+z/v7FymnqTdF12CgbTKGg/mnl3KrESiQtE+XQwFalA4mYJNpyR/syXU9dAUukeHqtpch1sli/Yh+qnfeux6hVNXy6AsN/BIrY2EnQoe1HZzWtds6M1qEs9AYxDANo6h3/ndcXkOQ3rR1tKmg==
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com (2603:1096:400:358::7)
 by TY1PPF4A2CDB296.apcprd06.prod.outlook.com (2603:1096:408::910) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Wed, 27 May
 2026 03:33:09 +0000
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc]) by TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc%6]) with mapi id 15.21.0048.019; Wed, 27 May 2026
 03:33:09 +0000
From: =?gb2312?B?uvrBrMfa?= <hulianqin@vivo.com>
To: "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
	Cryolitia PukNgae <cryolitia@uniontech.com>, "pav@iki.fi" <pav@iki.fi>
CC: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?gb2312?B?uvrBrMfa?= <hulianqin@vivo.com>
Subject: [PATCH] ALSA: usb-audio: Add iface reset and delay quirk for TAE1159
 USB Audio
Thread-Topic: [PATCH] ALSA: usb-audio: Add iface reset and delay quirk for
 TAE1159 USB Audio
Thread-Index: AdztiUUpOqMCzHPLSpWsMwESsog5Tg==
Date: Wed, 27 May 2026 03:33:08 +0000
Message-ID:
 <TYUPR06MB621736D7C85D43200E54E740D2082@TYUPR06MB6217.apcprd06.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYUPR06MB6217:EE_|TY1PPF4A2CDB296:EE_
x-ms-office365-filtering-correlation-id: 6c3bed31-67df-4d58-0048-08debba0ac1c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|42112799006|1800799024|38070700021|11063799006|56012099006|18002099003;
x-microsoft-antispam-message-info:
 kWcuhjedFw6eGz175eWLPF5K6u85a0nt0c8dR7sy9VaMs8YuUS4s/NDb84UF73WJCM9Iyct+pLkQ3YKszmqkissNwSUTychn/3AjiL10UX5ROSXie2WG0eduu3IH0ZlLTbDPQOq+7Ms7u6djWegC4QfZRwwy0fVWgnezouAiB+H2LqpuyhBIrcb1Cmm86OuEWHRgdcW4fuqFdVNnTktfiYV8D81ShxRuIjuDIAZEMYzepbltqyC+LEXu6ararwOOCyqewVSMBY9dh92d+qqs2CCHQhiDd9axbpoJQnduKuPszNuTCGtp0vyDlbiu71kcg/AUti6Xp2UT/FxOMVyFj1T624bd2X09DbLKGn3qBbbilBtMCARUP/CshIFxfckTCMJJGBHAmL+BHAl/JZpgruvSjFlqzKBrrmHPw8C5gLApNvwvPrfC+QaoMRc2EmPzXWKBr+wOHcRi7i17srBF9X2xK+PIAbTXGhWOeslVoNoNrdg6jEoUI4PdDx5Cj5i6T2G3HYk0Yj0Xo0fdBpEBxTPEQacE9h4cL5ryZtN5m8IX2rLTnabRWtSPw1vDwjji30k7DcsZIu/02Osut0gh887H92JAxI5+N4xsB2l4FrrMDUgB2W/Ut//Jw0aWptXovooejW77AN1pQbKpLszmbXEBZz2ZKtvoVQIvzzTxRUrEZ5Po7BevipIFx8jJtrQG6n4eI3jVPaDexC1ys8XzrpIa5TCqH//4czNJ5Oop2fBDeOpuEknnwndd3JqN7S+b
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYUPR06MB6217.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(42112799006)(1800799024)(38070700021)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?bTUzbkxPZjNzMU9SUnJ6d3RKTFY4WTdlNWdlS3g4dXE5cXAxMklPZEx1KzAz?=
 =?gb2312?B?RVl0cEpkVElGSkxZbFAxOWJZNGswOFdMUkZ1MzVZWWgzQUdXa1ljTWhwOWFw?=
 =?gb2312?B?VWd0akNPZ0hQMEp3cG5PWTZVSUoxOER5UUxsVCswQXVLZEcrMjNpRnpMV3hu?=
 =?gb2312?B?Z3BlbDBXQ3NqNmovQnRFVTZLRklEaTRJRnBlOUNQVzB3dnFPWFRkb1ExYlE1?=
 =?gb2312?B?dVUySHFDVVd2ME9BcU5TTFNYRWtIMWh4S3B4QW9Jb0N2NFRMdWJUdEVyMTVC?=
 =?gb2312?B?V1NvUVhyWWY5dlo5L1FoVG1sUWZ0YXh6eXhkVzRPZDl5ZTdLaVRud0xMNm9Z?=
 =?gb2312?B?SE55ZGhIQllWMmxrWitnUHh6a0krWk1CSEhrTmRnSUtwRC9waXlEL3pteWw2?=
 =?gb2312?B?Qk5BRmI3TW0wZXRvNW1FVjhaelFtK2dkUEpXNFJ3YktnRGRtU2ZncVJJUVNX?=
 =?gb2312?B?eXd0TkFsMHA5MlZLd1NjVVF3bi9IZmErVHRRc2NVK1JsWW5NWktpS21JUExi?=
 =?gb2312?B?enpONW9UaktGZFJTdXZBNXBzTDNoV1B5WFlGaTYzMmtYS25Pclg1Wll5Nmt0?=
 =?gb2312?B?Q21IZVMyVWJ4WENwakllNEhBK2kvNUhKRFVNYVNaYUh0Znl2cUNsU0JkU0J5?=
 =?gb2312?B?eU9NeGxocGh4S0ljYzZkUTdGZm8wKzB4MXVud0hzTXdQeDc0Wm1PcWM2WGN5?=
 =?gb2312?B?ZkduR2tqcE5CQVRjbktnRm9ONkJNaGpIUHFvaWszL3FQZlBPNk5USkc4d0ZY?=
 =?gb2312?B?b1VWbVpQTmNIOWt3aFR3T0k4M0RoS0xidUtnMWl6L0ZWQ3ZFVHBEUVNRSk9l?=
 =?gb2312?B?eWxacmp4MUg0Rjg0TXhJUUhGcE1xYm5WSmkzR2x1Ym1VWUxlUy8wbGk4TGgw?=
 =?gb2312?B?aWViWXRab25UUCtiNWk1aldXSjFmZW9qYVpNNFlrTWhrL09RQVA0MzhwMXc0?=
 =?gb2312?B?ZFRhTTB3VUZQVjRyWXl1Tm9zS1EyMjk5NFdVMXZYRUZPZnR4bkxBSmhVZ3h3?=
 =?gb2312?B?K1BhV3hybURHaHFUOFl4NGEwV1pacWV4MW8yUkxUZGJWUVlqWnRESW5MWjZB?=
 =?gb2312?B?MmVaVXM5MHdBQ2lIZlgzSmgwVzIrajcwL25mRVM2aEtBeElYZmZKTGx0YVll?=
 =?gb2312?B?cDJ2UVN3SGRJMHI4N1AwTGRGREVlNWdRVTZJblJwRERWdGo3TGhXbXFEeTc0?=
 =?gb2312?B?UGMreFEya0tnREowbW9tcmhBM0NTSEJkdmRPR2paWFBqblNWdWk5RzZSL003?=
 =?gb2312?B?M2xxdXZldEhKUmNtOUhhdDdBWnJ5NEJRQktaRUlWa2YyRTNPdFBuYWJLTTV6?=
 =?gb2312?B?UW9oZUlHQlhnamRZaDZ3Si9yUkxBSzJXeXg4ekUvd0lLMFZ3eldOVVdDZU9J?=
 =?gb2312?B?WDFZbkdlVlAxd1YrdTJybE83SUhVQmlpOHZtZEtTcEQzYmhUWmNNeUpuSlQx?=
 =?gb2312?B?OEszYzJBMXNYQ0hBcDd3UHIvUzM5QzEvYnZMS0xoSHZyVlZDaDlRWE14Rnlm?=
 =?gb2312?B?N1JDR0tWdjdjVzhtYmtZYVl0aFVSdzU5aC9GQ1VNTGdWak5lVFRra2VyUDFn?=
 =?gb2312?B?U2lheEc2V3hvNjZHNW9kTkZOZ0xpZFEySHhHbTMxQ3Vab1owZ0VxMDNSVE5r?=
 =?gb2312?B?bm9LUFo2Ui9neEFzREdETWFVVGhYanZOSDNvOUd2ZXVCTzZKVlBTemd5aURV?=
 =?gb2312?B?clZqdEk4RTd3Zk40VS9TQWpScVVIR3JraDRQNFZ6VlRaWE1DRGk0ZFNnUTlp?=
 =?gb2312?B?Q0x1QWFXWTMzQ2Z0dkYrbU1lRm1FZ3FwWGxzajVKdFNOY0ZhcXlsZm5BS25W?=
 =?gb2312?B?QVhSMk5sTmtKdE5UNVg5aDhUV3JoVzBJd0Q2V1YrMURuWkExUDlYWUZWTG95?=
 =?gb2312?B?ZEdPaFBTdjFKWERFNENtdEp2KzNhdllwYzVnMUxwSVV6N0syOXpuRXlJSTg0?=
 =?gb2312?B?K0tzdVNWVUpMYVlDOXY5am9BaVQ3c01wenVoVVY5NjdnUkF5cVdUcmxiWXY5?=
 =?gb2312?B?c2ZyWE9sc2owNUJSU0tUeC9KQTVISFNYMnFPMTB4T1dUL0tWOUhqWXpkajU0?=
 =?gb2312?B?cmNnUW5TZXoxeVJSa3FiVDJuTG91Y1Fid0twbFZyR2ZhZTFPY01FK0FOdVIv?=
 =?gb2312?B?MFhiRWlDWHdwVC9MemtqK09zb2YxTmplc3poZldHN05yZVU5SElueXBEcHNQ?=
 =?gb2312?B?OTlHdDZ6NElLNGE4QmEybjdtRHV3cEsvUTV4cDhQdk5kMGZRZjR3Q210U1BK?=
 =?gb2312?Q?nKQOqoskp4n33h/H9Frm8qrXoM8ii7Sc3wKzLME0QE=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c3bed31-67df-4d58-0048-08debba0ac1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2026 03:33:08.9405
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HmF0jT4cQI1htmGU17qlEj7+CXInUMY7DTDS7e0jfKTgDStQ1yRvRSX5j2qfh8JLbSF2d0QqBExstAawWfG/hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PPF4A2CDB296

U2V0dGluZyB1cCB0aGUgaW50ZXJmYWNlIHdoZW4gc3VzcGVuZGVkL3Jlc3VtZWluZyBmYWlsIG9u
IHRoaXMgY2FyZC4NCkFkZGluZyBhIHJlc2V0IGFuZCBkZWxheSBxdWlyayB3aWxsIGVsaW1pbmF0
ZSB0aGlzIHByb2JsZW0uDQoNCnVzYiAxLTE6IG5ldyBmdWxsLXNwZWVkIFVTQiBkZXZpY2UgbnVt
YmVyIDIgdXNpbmcgeGhjaS1oY2QNCnVzYiAxLTE6IE5ldyBVU0IgZGV2aWNlIGZvdW5kLCBpZFZl
bmRvcj0yNWFhLCBpZFByb2R1Y3Q9NjAwYg0KdXNiIDEtMTogTmV3IFVTQiBkZXZpY2Ugc3RyaW5n
czogTWZyPTEsIFByb2R1Y3Q9MiwgU2VyaWFsTnVtYmVyPTMNCnVzYiAxLTE6IFByb2R1Y3Q6IFRB
RTExNTkNCnVzYiAxLTE6IE1hbnVmYWN0dXJlcjogR2VuZXJpYw0KdXNiIDEtMTogU2VyaWFsTnVt
YmVyOiAyMDIxMDcyNjkwNTkyNg0KDQpTaWduZWQtb2ZmLWJ5OiBMaWFucWluIEh1IDxodWxpYW5x
aW5Adml2by5jb20+DQotLS0NCiBzb3VuZC91c2IvcXVpcmtzLmMgfCAyICsrDQogMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKQ0KDQpkaWZmIC0tZ2l0IGEvc291bmQvdXNiL3F1aXJrcy5j
IGIvc291bmQvdXNiL3F1aXJrcy5jDQppbmRleCAzMWNiZTM4M2FlNjUuLjNkMWIzNTIzYjAyMCAx
MDA2NDQNCi0tLSBhL3NvdW5kL3VzYi9xdWlya3MuYw0KKysrIGIvc291bmQvdXNiL3F1aXJrcy5j
DQpAQCAtMjQ0OSw2ICsyNDQ5LDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCB1c2JfYXVkaW9fcXVp
cmtfZmxhZ3NfdGFibGUgcXVpcmtfZmxhZ3NfdGFibGVbXSA9IHsNCiAJCSAgIFFVSVJLX0ZMQUdf
RFNEX1JBVyksDQogCURFVklDRV9GTEcoMHgyNTIyLCAweDAwMDcsIC8qIExIIExhYnMgR2VlayBP
dXQgSEQgQXVkaW8gMVY1ICovDQogCQkgICBRVUlSS19GTEFHX1NFVF9JRkFDRV9GSVJTVCksDQor
CURFVklDRV9GTEcoMHgyNWFhLCAweDYwMGIsIC8qIFRBRTExNTkgKi8NCisJCSAgIFFVSVJLX0ZM
QUdfRk9SQ0VfSUZBQ0VfUkVTRVQgfCBRVUlSS19GTEFHX0lGQUNFX0RFTEFZKSwNCiAJREVWSUNF
X0ZMRygweDI2MmEsIDB4OTMwMiwgLyogZGRIaUZpIFRDNDRDICovDQogCQkgICBRVUlSS19GTEFH
X0RTRF9SQVcpLA0KIAlERVZJQ0VfRkxHKDB4MjcwOCwgMHgwMDAyLCAvKiBBdWRpZW50IGlEMTQg
Ki8NCi0tIA0KMi4zOS4wDQoNCg==
