Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012054.outbound.protection.outlook.com [40.107.75.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A463EAC68;
	Mon, 17 Aug 2026 11:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786965588; cv=fail; b=AYViN6oL4EnRrOF1Fy6ah9s8srziJEWHAzH2Vac2ImlV5yZMvquNtRmOY76QPI7ppllMhnBIIqWo5tnZKq04DgOwWNPHcoz5uOQ/QD0QM+jQnuVfhjsPPdCmz7hbLLhFTiKLZRRdH4nJZgUdhJIh4qhAJXDCAuxYISUDi5N7l3c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786965588; c=relaxed/simple;
	bh=yCBSsE6Sefk+QQTN+llX4YQteju4DBlC87EktOpU6hA=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=GOFwh80me2ZxAhCPo6sG1NnVwt+6UpMINMCLmpmxltOnx/aGKRlQrFgxJjpUV6/KnQxgkPCQbE4Fk+dF9vh+UgUgvAZZ0Fd11XlEy3Qy+yJgy4s7GdKZOcFGqfMBSaamQZL7nsFK7P4qGX6v8Fyj7sL9dIw+C6vwRcAPFJ2sccE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=H5aPO4tu; arc=fail smtp.client-ip=40.107.75.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="H5aPO4tu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P4TwRZVgmDFKlLioyvAftz2n7+w+zo3oUf11LDtxS5vAXOeFX14uJ0RionrF1TV7WAa54B6dHO3fhLdJ79QxhXYhB/d5s6cn3smOlbKLpxP4wzJST3y27CnaaJLah7L8BoFKgB8HehNAxziLymPJhNuLyDlx+w8UIS91cXpSif9l2WJ6q+8PXRuDfxru/FvTxRYQwUHPoGUw68fUyWQx+5gOPawDzhu+RBFk9jVS5J1zI3/IxlKXlx7RUZq8jrqz9LD6STcw5eGdI4E1/HwMeU2zdkkMBDczEa8n46J2SzhhE18/kxUQXXXNNuxtP2IiYnznbDh67CFDjjUQlZn0lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yCBSsE6Sefk+QQTN+llX4YQteju4DBlC87EktOpU6hA=;
 b=DHL0iVo4rDfc46DbyOF97nJfjy0AWbvHD/D6a0CP6uXyaE2QqQeBBOYAewAirVvuoU6/hKqnghX7g0RYU1X+QaPoXsI21ji5mRbgHzzUkbR5cEHPTeXQNpGVn361/Dh4NSiYh4BxsK+6FmM1ikX6Wwul14GI8bwuXJxOPuTHvE/2rxPEf6jblfC/JIwJPcdRODE+Wb4bdebTFc5rnCi9jOGIc6LIQ8wmx+BzC//R7Ei+Ro/5nGntSuoGiemkw8kWN8lro2rSS9AfqFb87KOF4he6+i+EXUTDPrI2Tm2e/jldSCwwimkiSgMDruvBmlvDEfPKw1QrY4E1mLO2tV892A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yCBSsE6Sefk+QQTN+llX4YQteju4DBlC87EktOpU6hA=;
 b=H5aPO4tuG7ZfYuNfzxDDMjf256PpU2ez6EyzonsOwUokpTKiNu8bpN0AfjfQooBOH5mAdXkyeT6szarJBGKBklY+Z4zqPsy0fO2GhN4pyWwPBk7Nv2fCTKLEVrkJmg1zzmSeV5dGXFwSxrvb2BzqZD8mfAAOnC0aZW5eUKZMGVm/8Kmzhpb6Orxz34zzJK13vUO/pWPl09eoYjY5Qd4nDOmPp8mEJt2rSs9svvmeSR9qhX1eAZASlQC9gOMrq2rZc1jwU451TGp7GqtdWoce/RFxWxT+jkRhDg0Ag3Zyw8mop8xTwe4BuQRk018po3NV4iDaDr/9CVqdiUsnhxGXlw==
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com (2603:1096:400:358::7)
 by KUYPR06MB9039.apcprd06.prod.outlook.com (2603:1096:d10:77::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 11:19:43 +0000
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc]) by TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc%6]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 11:19:42 +0000
From: =?gb2312?B?uvrBrMfa?= <hulianqin@vivo.com>
To: "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>
CC: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?gb2312?B?uvrBrMfa?= <hulianqin@vivo.com>
Subject: [PATCH] ALSA: usb-audio: Add delay quirk for SPACETOUCH USB Audio
Thread-Topic: [PATCH] ALSA: usb-audio: Add delay quirk for SPACETOUCH USB
 Audio
Thread-Index: Ad0uOazZsbYGgNyFRK2Q3Slu9wNozg==
Date: Mon, 17 Aug 2026 11:19:42 +0000
Message-ID:
 <TYUPR06MB6217D93F595D9995413C9721D2A72@TYUPR06MB6217.apcprd06.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYUPR06MB6217:EE_|KUYPR06MB9039:EE_
x-ms-office365-filtering-correlation-id: b45519ab-7e7d-42b3-5622-08defc516f90
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|42112799006|376014|1800799024|366016|38070700021|10067099003|11063799006|56012099006|18002099003;
x-microsoft-antispam-message-info:
 F4w3iHyU+vqfcX5Oo5iBb7kXcub+cGHCOdUpKIKXE2dpyVT61pkXobaSgzqDFUAdcPiIbkVI+bB10eTTcYx1s1BBopapmXA0NZJunDR4+Z0rU7NjbYusWvF5OcajS235AlznVlLosOTbFBF+W5mfrwbvuIRMZ/ckfSeTSs5x2WyQvTbrTKPzqqmfsbtraRn3MQ6XIlOQQj3GqmyaveL5+Qtu68gy8Q3XiCPpllWATqUiZej5x1FhgGrr6qbisT/oJ3Hto5pvJJJcyxmnpv2PbZlUaqwoYjsiLwCewb2+kJMbfGdVyJYLbomlCl0xDLIzFX+3yxBtBYJDwEwr4VnzDUT8pBmwGcZNoJpDLRJBqLbpRgE5SlT0mCPuFvvNRda01+n6iEDEizrj1tYC7okKWP/MsqquJasDqxeuKyHSGfa39Ko9qQpRa7oJOnlmCwJMONxG6vyuZg5B2jSpdeXkKEv3BCz/zrz03TpqFfXQbhvfzjy6FQboKvgGNHgnNTqmyv46hN4PYDIIh58uxeUCZ1DnyMzYuAOv/J3qLLIGUlu2IRPvOZq987cqkBzBpLEtPD/dDwddjTkQwnEi0Yflrzpf6rkg6bs3CRZRuxDOLRY6UuLntyozHBTTwb1neyRqYFA6jB2pqnZTBhbHOPnrkYf6Qmw8TM6pF3gvLX2cn5fUa8Aae9aJvR8t4V2Ifqg6P+3Ojg2imhCj0kdeKx4iv2+d7fT+MErMAvs8Bu0CvWc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYUPR06MB6217.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(42112799006)(376014)(1800799024)(366016)(38070700021)(10067099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?WGQyK01JaEJmWlkrRy9iRm5RVlYvVmgyYWVobjd6dmhlQzdBbU9BTlU4ajRJ?=
 =?gb2312?B?N3pENlJhWkkrVlA1WmttdndjeVREM2dYeFdSbGVXSXc0OXdGS1RrdjlzLzkr?=
 =?gb2312?B?N2Fmb1ZOV2p4SlBMMW1BeWRtNlc3K0VJb0h1dzV3dGtsQzZYSndRYk4xNTZr?=
 =?gb2312?B?VVVaRjRMVit6dW1WajlVdnJqd1VYSWFBLzVxcDg1Z0hzNHhiWE5yWGVNVHl5?=
 =?gb2312?B?NVlPaVUra3hQaFhrZlZNRGJ6RGFLenA2Znh5NklLWUdxTkZ0ajByS1huZllF?=
 =?gb2312?B?QzVnZGVZbEMvZFVXby9YNGZqMDhPR0hUTGRiS2FkaHJHREJseTNUR0NWMnVK?=
 =?gb2312?B?UXRxQUVnNlVicUdrdkp5cC83dXA0bWlzMGt3b29zbm04VmRFL1krZDdJU1Ey?=
 =?gb2312?B?NSt5QTNYN0lGWVNSenc5enM1dW4ycEgrWnNIR2t5cGVaZTdVTEpsSExGWjBM?=
 =?gb2312?B?dGM5OTZNdXM2UGh0Zm8vNnBMMjUxT1Q5UjcwSGRVMFkzekMzRU1WY21CQnRp?=
 =?gb2312?B?QkU4ejlxSkRIN2YyRk95WXRpUnJJdWxmbUUycnlRN3VQeEVFY3BJWHo1TkdQ?=
 =?gb2312?B?MVVHT0EwKzdic0U5QWZCaFNXSUFQYjRYUkxsNkYzQWFxNGo4U0lHRnBvZk9E?=
 =?gb2312?B?eWxML3RPT1pFRTBGVWJLRkczUmF3RHlXenkxaXNXTmNlL2dyUGlLNTlLTmsr?=
 =?gb2312?B?RVJBUHBMcTgzSGRaVTFoMjE3MGZSZXBleDYzaWUyODdodTVUdFRDa2V4QkxW?=
 =?gb2312?B?Qml5c1U3ekdEYXZ1R01hZlZ0YS83bkxOM3c1VG9GYlMxcEFJZ0RkUnZERGZm?=
 =?gb2312?B?bktQd3RGeHpPRnh3Wnd6ei9raTdOVGFOSy9DNVpwaGdGYzg4ZnFERTV1VEdN?=
 =?gb2312?B?UjlEL3VLS2g0RDF1NmE0Sk9mTG5mVzRyUjVUOXVhWCtQSlZ3TE14T2I5MktO?=
 =?gb2312?B?Z1pkMUxjMG1vRmlsMHpyRnFHMFBiUDFvbXhKR0hBY3FlZGRmaHovK1MydnZk?=
 =?gb2312?B?UGdCajUwUEhrMklBWG5ZSWpnTURqbE1QMHpTSStETGZSUEVycU9mdlE3OUsx?=
 =?gb2312?B?RFJyZHZaMVAxcmZLZ3hpWGhRTDVaVmJ4dnAxc2ZaUWxLQi9nSmFjSTNRZnFW?=
 =?gb2312?B?T3VHSFRoRWdrZkhZSkc1QUxtNXVIZVFUdk1vVDc0QldLZ2dmVjR5dXV1OWJ5?=
 =?gb2312?B?cm5ROHlrR1J5SjdsaW5VYmptbEsxMUJ0YWI4TzFoRy94UXF6Y1VwaFVaSFJJ?=
 =?gb2312?B?MldIRFZJN0Jnd1Voa1lvZG9MRE1CNW9ZV2RTYTBDcWRRS0FGM243anBJMjN2?=
 =?gb2312?B?UGR2OEo0V2YrWEc3T2xzYXI2OVJBczMyNGJFaDNGb3dRSUZaL3pFS29laW1I?=
 =?gb2312?B?eElucXZVdy9Md0FGZmxNdmJxdEdKQ1p4Ujc5YWdFUnBaV0pSeW5ycjEvMU5r?=
 =?gb2312?B?YUY5SDVaTnBYd3BoZllZaUVxSEp6bXlXbWx5b0x2bXpvbk1ibjE1VVhyUDNr?=
 =?gb2312?B?dUJJd2dGVTVlS1UwelVPYWV1dnJJTnBWWjliR1dZcGFNMlNPR3dZVVdMdkVx?=
 =?gb2312?B?My9GK254WDY3cWlEbDFzV3NENGhQSnZVS1ppZy82K3dsQnJYcFFodzRLWnJu?=
 =?gb2312?B?OHl5RU5jMWp3RE9VNlhiRkltbnNnVVRnc2lMRXhvL1J3akM3ckVyMWhrT2Jt?=
 =?gb2312?B?WklyTGdjbUhXTFpKZUx5WE80TVBaQmJwUFRoU2twNnZyMEFSNVNVRnZZc3hC?=
 =?gb2312?B?bDBwTEsxWEh5ZU5pVDE5SXI5aGxpUGRlU3pCQmtKN2ZrcjgybHkzODZFQi83?=
 =?gb2312?B?dmVmenF1alM5cjFHeGJnMzVBK2JrL1gzdEpsQWRFa1FtcjBSSzJ4ZFdjS0h2?=
 =?gb2312?B?TjlLMktXWEMyZ3Z1bEMvbGVBS0NMRGtLYlFUZ1kzcC9NTloyaE5hVkYvU0p6?=
 =?gb2312?B?WURobDJ4N1dmZEFxcUlwV1g1bVdKVFF2aGR6dzdhcVhxbTdXNHAyNTZKMEpK?=
 =?gb2312?B?K2RvZ2hRWkwrRVN5Mk52cHR5UFp5NGdjcHlRVk5GTDhDZnVLNThOYzdzNE0x?=
 =?gb2312?B?ajd5Rnc1NFBPMGRHQXRCaFhUTlUyQlVOWlp3bExWOXIvdWJaOWxibVBKQUZq?=
 =?gb2312?B?enlTVG9yNUZWbVA4bzhmWkdWd05DUVErYWFsYlVSbml0RGNjbjdKTTJUMm1k?=
 =?gb2312?B?TFhtanFDU09mcE5zWmd2Umd5czVwQjlYVG5wSG5HSExLdHRnRGhUSlc0Zlhh?=
 =?gb2312?B?RXIvMUFPMFNLMXhtVS8wRXZRMzRuQlcwWXNvdkdkU2dxVkdOTTF1VUZQWEdt?=
 =?gb2312?Q?BqsgVOc6BalQ7TKrwC?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b45519ab-7e7d-42b3-5622-08defc516f90
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2026 11:19:42.6908
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I6SV0v+c5X09qK5bgGDPCvjpZN2W+9n7t4KBVBGbyHu/eL2e6l9nqCUhQVKuibj13UGJ3Ruq2aOAIudLrohTuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUYPR06MB9039

QXVkaW8gY29udHJvbCByZXF1ZXN0cyB0aGF0IHNldCBzYW1wbGluZyBmcmVxdWVuY3kgc29tZXRp
bWVzIGZhaWwgb24NCnRoaXMgY2FyZC4gQWRkaW5nIGRlbGF5IGJldHdlZW4gY29udHJvbCBtZXNz
YWdlcyBlbGltaW5hdGVzIHRoYXQgcHJvYmxlbS4NCg0KdXNiIDEtMTogTmV3IFVTQiBkZXZpY2Ug
Zm91bmQsIGlkVmVuZG9yPTA2NjYsIGlkUHJvZHVjdD0wODgwDQp1c2IgMS0xOiBOZXcgVVNCIGRl
dmljZSBzdHJpbmdzOiBNZnI9MSwgUHJvZHVjdD0yLCBTZXJpYWxOdW1iZXI9Mw0KdXNiIDEtMTog
UHJvZHVjdDogVVNCIEF1ZGlvDQp1c2IgMS0xOiBNYW51ZmFjdHVyZXI6IFNQQUNFVE9VQ0gNCnVz
YiAxLTE6IFNlcmlhbE51bWJlcjogMDAwMDAwMDAwDQoNClNpZ25lZC1vZmYtYnk6IExpYW5xaW4g
SHUgPGh1bGlhbnFpbkB2aXZvLmNvbT4NCi0tLQ0KIHNvdW5kL3VzYi9xdWlya3MuYyB8IDMgKyst
DQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KDQpkaWZm
IC0tZ2l0IGEvc291bmQvdXNiL3F1aXJrcy5jIGIvc291bmQvdXNiL3F1aXJrcy5jDQppbmRleCA0
ZDI5NTdlNjJmYmQuLjE0ZGFhZjJhMzA4OCAxMDA2NDQNCi0tLSBhL3NvdW5kL3VzYi9xdWlya3Mu
Yw0KKysrIGIvc291bmQvdXNiL3F1aXJrcy5jDQpAQCAtMjMxNCw3ICsyMzE0LDggQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCB1c2JfYXVkaW9fcXVpcmtfZmxhZ3NfdGFibGUgcXVpcmtfZmxhZ3NfdGFi
bGVbXSA9IHsNCiAJREVWSUNFX0ZMRygweDA2NjEsIDB4MDg4MywgLyogaUJhc3NvIERDMDQgVWx0
cmEgKi8NCiAJCSAgIFFVSVJLX0ZMQUdfRFNEX1JBVyksDQogCURFVklDRV9GTEcoMHgwNjY2LCAw
eDA4ODAsIC8qIFNQQUNFVE9VQ0ggVVNCIEF1ZGlvICovDQotCQkgICBRVUlSS19GTEFHX0ZPUkNF
X0lGQUNFX1JFU0VUIHwgUVVJUktfRkxBR19JRkFDRV9ERUxBWSksDQorCQkgICBRVUlSS19GTEFH
X0ZPUkNFX0lGQUNFX1JFU0VUIHwgUVVJUktfRkxBR19JRkFDRV9ERUxBWSB8DQorCQkgICBRVUlS
S19GTEFHX0NUTF9NU0dfREVMQVlfNU0pLA0KIAlERVZJQ0VfRkxHKDB4MDZmOCwgMHhiMDAwLCAv
KiBIZXJjdWxlcyBESiBDb25zb2xlIChXaW5kb3dzIEVkaXRpb24pICovDQogCQkgICBRVUlSS19G
TEFHX0lHTk9SRV9DVExfRVJST1IpLA0KIAlERVZJQ0VfRkxHKDB4MDZmOCwgMHhkMDAyLCAvKiBI
ZXJjdWxlcyBESiBDb25zb2xlIChNYWNpbnRvc2ggRWRpdGlvbikgKi8NCi0tIA0KMi4zOS4wDQoN
Cg==
