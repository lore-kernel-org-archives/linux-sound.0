Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11013000.outbound.protection.outlook.com [40.107.44.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E528A221FB1;
	Mon, 15 Jun 2026 12:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781525109; cv=fail; b=oZ5DJbNnLdXZj+noJmHlxFRMehof8wCfELaeo1LblTc6nTZyZ2/IZ5PCwmC2kWHS3IN+UnOJ5UOE25Vrw/PQJ63TlKvTBJ3/9KJYDO7STycikU9RCdMfQT5PVCUS58rlx6zNSxFI9OnPkbLTeXvL272l3puAQ5pO1OfwxwKn1K0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781525109; c=relaxed/simple;
	bh=eMnYrUSA9pXrxkwnCZgcKF56vIZQ/4w1au9idLzjQHs=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=K9GkFbE2E09PY3y6tPieLAFY9+nEk73uFADvugkQVyb6AUQM1I8ygv2w8Iu6Uf00qA9W+rllFr34AvefYU+8epEPOSXet0MQQI3n+Sgd1KKJVu8mNVjxvAN/yQJpLLqT3PmtPflEIUDfeXK32FAQcZf1QWljqSd/uDeokn2o5oc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=Eofd7v7D; arc=fail smtp.client-ip=40.107.44.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="Eofd7v7D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x680C+dryEyZzJcb+I9xzp2I+AiFn0bHASyTY66to8PJ+w9kTda011ftF33CNJIvKByQG03FLnoFo+ekGXMZgKhRWc2IuNEAGAJ8CObvABgEFcAq3dwSSyG5ikNqXTVc8Jx3yGyemONM3XfReQUyuyJZGPLCocIUIBGL7FNVBDimtatrZATxOXFiEdNnaq6P40sGzJdGjQkwmjZsBoxX67h0/WEtX3wGYII7Bosu2mIHS4EHFqFK3+CLlggvP5I1xF3ftzMjWDQqGkR6bEZXvGyTvdSLMUhYhbAqC6F1z+IveOtTO7MNkEmsGu9oiKlbhMwIMdIlQTbXDcLeuJaLZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eMnYrUSA9pXrxkwnCZgcKF56vIZQ/4w1au9idLzjQHs=;
 b=u8sO48pj0FbbRnyy+SqJ5d6cTrhlmBp18KOgF/Duoi3157lp2c433MkRIgowNcWE1fuqe2rnAU8VHjITMAHG0Moh21h8UwdILR80WKzdOrPXSm+jbS/G4/9pjmPvW0Q9SuQYCF5QjOkx+cngb/yqQE7vi3C+Btnc+/nct0t6KUelg65egRO6MSmzFPEl++JPWR9ZZcXFfaQzp1p+aU3eGE9utn2cm93+fIYACHLUi7Cy90f6hin1FAMfvV8txHDXgR4n4R/WbXF860AHOcPzil48NF3p284vKuEfn5RqhLmwaArXrXC3ZsuHhPmUcaIRG+G9Zqs7EUu3jf+kf29tlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eMnYrUSA9pXrxkwnCZgcKF56vIZQ/4w1au9idLzjQHs=;
 b=Eofd7v7DxcMDytwovqkDQCURwvzaZFB1GItB/yth7pz6Q5tkN/LzZfBiiHycXjD63g1UZaeVS1R9LL2bUG/BIFgTizVJgYtPio+R1+7B7hwXUxI+pEN8ES+UV+635TBmjfMXDnP6e95aULFVLyZMrac+V9r7wRLP5Hg4zxVhb8gY56rsqHMklNpsfA6gdKnlBCtd3W0577hKucggQYlbgUFTxEt3pbu1fpNmFuypwdJOa1tT0kOsIUOtyFvjtfZtw0eRSUNc1vqhr1+IlmBEjgcgfw94Hrpdpg+uGqsPV8qFruF2T/J2wfYbR/CzzMywFfGnP8HRof3BZevkmYe1MA==
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com (2603:1096:400:358::7)
 by KL1PR06MB6371.apcprd06.prod.outlook.com (2603:1096:820:cc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 12:05:02 +0000
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc]) by TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc%6]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 12:05:02 +0000
From: =?gb2312?B?uvrBrMfa?= <hulianqin@vivo.com>
To: "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
	Cryolitia PukNgae <cryolitia@uniontech.com>
CC: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?gb2312?B?uvrBrMfa?= <hulianqin@vivo.com>
Subject: [PATCH] ALSA: usb-audio: Add iface reset and delay quirk for XIBERIA
 K03S
Thread-Topic: [PATCH] ALSA: usb-audio: Add iface reset and delay quirk for
 XIBERIA K03S
Thread-Index: Adz8vt3NS07vV8FsQqqiVivkmZH6ig==
Date: Mon, 15 Jun 2026 12:05:01 +0000
Message-ID:
 <TYUPR06MB621706287FE30F4D8EE4618BD2E62@TYUPR06MB6217.apcprd06.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYUPR06MB6217:EE_|KL1PR06MB6371:EE_
x-ms-office365-filtering-correlation-id: 5c59d589-e2c4-44b4-b640-08decad65446
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|42112799006|56012099006|11063799006|18002099003|38070700021;
x-microsoft-antispam-message-info:
 5z3LdjKVbR8RvrScVF5uux6ry5A/EhW6eWZoNdhjAo6Iln+9mSuwr7OeuaYRmstctx5v4WpOgAjiuRmUh4DJm7cfDg1vpqtaJR9gj13XAflGZbDIxVdWzARG9Je7Hv7U48uYWGIjdSfbjFevsonzO40qUUOwf6QxQDIHv8x4RTNL9EvuYxZTOPgNQctJH+DKh27p8XWEMVb8vSJku9Noi15sey4FfO3qhLI9itcU8EvWVHyw1IFpbDNqeAHpDyIEQql8FJzT1lBk8vQ+y8rk2tSFuZUc0YRaQUYkK+PhKirmC8JM8Wte1ptqUNuoez+7ztDYUix2R2I5Nzl3nBT9BRyoKHAev5uODyrr1u84qvppWEkgWolwbPMwuo12ma5GlrIEnReeZTN+VhySIM4kFUUvVSP+iG/HSibtcOS53eJRRegOj37+LZ7kSEsL1/x9M3iAlmWGHFugIuB3vgM/kq+2SkgT+XY/KFluGKhUwI/Rq1oTCXKs0JVrfffcMneTSLYaBHW2cNzaiOyGzZgrDFJuckNIbOTNMVZmonYrKQo9SwklLpTMQtKYh7auq6Js1yXK2DQraHFaepLYe8PZz5vof3XDw9I03OzHzdFA4APLaq81vwXkcSTpuhJg+Li6pKCOlp1RuZMH6XDCd84XMfMM1o5Y+JYczkrPEXFGddHsOGrl6iIx4nf3Ix41f+8uCgQ2+qcnbMTMoBHIsxHEtUtP238ObiNFGmZpZbumQRDHUtkj4oW3QRIkhjQHoeZe
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYUPR06MB6217.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(42112799006)(56012099006)(11063799006)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?cGdRWjJabjZhcExPVVQ5UWIvekJlVmE4aG5tUldQbUVXQ3BUZXdnSURWUitM?=
 =?gb2312?B?VEhheWJEckRPTUVQMFl0aE41WTU3QUdWcThySW5QM0pob3R6ZXNPYWdkMG9C?=
 =?gb2312?B?d3A2c2s4QWZKYUowbWhnODZhZmI5QnZtUm1QQUFqRHhxTFk0SlE3VmY5VUxl?=
 =?gb2312?B?V1M0U0lYdTVZT1BlTkJpU0JwZHdsNXdmNlNjalhWL0FXakhBZDJIY05sNHM1?=
 =?gb2312?B?SWF3MHh1ZGJpa1dnWWUrUk5MMnpHaEhrd2p4L1JSZTFkVDg4eGhPeXlFY3A4?=
 =?gb2312?B?QVlGRXphSndLVmZaeWRQTFEyaytjODdtSFk3SXoxMlFUU24xL1RFREpkcXlM?=
 =?gb2312?B?SnlVbG5IeFRKY240SDJ3d3JXY0hVNnY2ek1yTy9oNDVoRzZjM1EwSElDMVRG?=
 =?gb2312?B?dVNLQlNzUVg3cWhBNHRoRkhoNG9Edmg4YlBHUmFvOUhPZ0ZqVFdKZlA0UVJq?=
 =?gb2312?B?MHErQ3JQS2orQ2pLMTN3NHdzcythbjdzbFdMdURaek5Fbkk2VlduQUY5b1Bt?=
 =?gb2312?B?RU9LM0d2TmlOTnozMnY5cjBsOEZFWHdZSjRIc2svUm8waGYySDY2N3ZxQkk1?=
 =?gb2312?B?cGc2MFFpTDlyN0hWdEJhUTlKeFlobWhQK2hWRzNUVmpuUXJ6bU5pdEZ4ZWJD?=
 =?gb2312?B?Q2xwNFd2SHlxMTlISlFmamR0eGNSQ0dMYWtXc1M5anduLzdFMGxYVUFaQjBB?=
 =?gb2312?B?VStuVmdheVdYb25OZEZxRCt6SmVEVXNXak4xZkhPWUU5YXlaakozcnBZRFJQ?=
 =?gb2312?B?VFh4N2JVV0lnMlF5U3R3c3MrNjZpcHhYUjZ1SGVoZDlqZTNFS2RlYjRleWFE?=
 =?gb2312?B?T0RDa05pemg2bVFFNWZEQjZkWE92K3c2SEV1Tk1mNndla1FxVnVJM1FvSGdu?=
 =?gb2312?B?a2d6TXlNbHJ0VENKWExrejBLTGFkZDV4SDA5cWZ6T2VCUDZ4WTJLdHVBdGtr?=
 =?gb2312?B?UkVGajJJTGs2OG81Q2NOZkg0bkc0b0pmVEN3MlAwemFHR0RlYVdhRjhsYWpw?=
 =?gb2312?B?RytrcXlJQks5ZEpDUXhEeXYzRkJLbnpISldHa0ZwV0hzTGMzWU8vRzY0YStN?=
 =?gb2312?B?UnFsbTcrTW8xS1R1YWFmSWFxVWRSOEQ3L1VvRFZXUldpcXpIYk5Nb3N2dmc0?=
 =?gb2312?B?Wi9RVDJTb1hJQU5POE9iL0d3T1BpZkJ1SEtNMVZybjg0UjNNQzFuaURIc3BT?=
 =?gb2312?B?amVPemJvOThHL29lYmdVZlRta0wzSGhObGNQSWdUeGpqd01TV1NEeHdSdEF1?=
 =?gb2312?B?RU5HUEY1WTh6S1A3Ym94NFh3RkNzcW1lcVIvSnNYZlZmbjJ2amR1Zlk4eGdl?=
 =?gb2312?B?djhRd3VoVlZXNWx5eHZtZ0VVTnVqUWgyTHJJV2s0Uk9qdFo5dkhpbWV4Um92?=
 =?gb2312?B?Y2ZIQ20wRXB1Qyt4enVFVTZtR2xrdGdYUEo0M2JkRHZyQmFLWnY1OFc0NWo5?=
 =?gb2312?B?Y1JaTldpZjFWK09iMVNBNmdsU2E2U3h5SDkvb3dJVkxBK0FPYXBMOFY3anNV?=
 =?gb2312?B?UjJXalZKTFY5MWxRa2RNVVlMMFpwUEl0TlRjcGhaOC9YbjRjOVd0c2UzVzJv?=
 =?gb2312?B?M3Y3L2hvaWF1cDEwTllYb1F6ZmV5WE96bkxrd1gvS29TYlBMSDgvVmhKL0o1?=
 =?gb2312?B?dHd2VVFmNVlWMXNUS0tCTysyREhqNjFwcjVXVU9JYmNWenM0QkhRMkdWRFJ3?=
 =?gb2312?B?ci82S1Q3WDhyRTNIM2NoZUhYQXBBeWRTUlkxdWhtZ1QwR0hoQ3pVN2pyQUNO?=
 =?gb2312?B?UHpJWEQyaFdOQmlHOWxDbkhOYVBaTG5PM255YnpleWZ1OVRZVFpLYjV2VVJo?=
 =?gb2312?B?SERzTUw4b0I1Q2RtNW9iSzhGQ2tiTkU2V1VGRjlHcTZWaHdyZzJJZFhrU21v?=
 =?gb2312?B?STF3L1A5ckdHUDFDS3BpZ2ZsS0pGVUpSMHZMODQrQ25maXR5dGI4WmxDRVdJ?=
 =?gb2312?B?NDRVUWZEamxXdzBhTDNPTEVjSkdCVTkrU0VmMUhrQUswRjd2VWhwNXNJQXNQ?=
 =?gb2312?B?M2VYTTgvazRNZ0NnVVAvVkVUaWZVU092WVZ0aXJxdm94ZDFhU3VFWVY3VzV6?=
 =?gb2312?B?cjV2bzIxTkdrZHhKSjYwYWMxTUFqQmtGcjBGQ29udmJvSzhLa1B0QWhTMXdO?=
 =?gb2312?B?YWVoVzN0RXhkVms4WnM4bi82bk5IV2orWnBCMlozdU5jdnVZSnlra3h4TitP?=
 =?gb2312?B?elJrL3ZxcTFDdUNZUzFBNTBaSmlUajBDK1hpQ0xDN2xuTVd5UTRDSHBEK0ht?=
 =?gb2312?B?dHB3OWhvT0F4MENGem83SG1XWEI3RlNuazhtekRXaFhCUEFLczB3LzdaVFhS?=
 =?gb2312?Q?1VjKXB3QtEjtReB3fq?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c59d589-e2c4-44b4-b640-08decad65446
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2026 12:05:01.8157
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: umG+CysbHcc1IiqDvX5q3oUq1Mfu8MuMwPybLyilhR85KFbh36dgdUr7J3g7IRIG1UGIXVU+E7elyIdVH6gr2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6371

U2V0dGluZyB1cCB0aGUgaW50ZXJmYWNlIHdoZW4gc3VzcGVuZGVkL3Jlc3VtZWluZyBmYWlsIG9u
IHRoaXMgY2FyZC4NCkFkZGluZyBhIHJlc2V0IGFuZCBkZWxheSBxdWlyayB3aWxsIGVsaW1pbmF0
ZSB0aGlzIHByb2JsZW0uDQoNCnVzYiAxLTE6IE5ldyBVU0IgZGV2aWNlIGZvdW5kLCBpZFZlbmRv
cj0zNmY5LCBpZFByb2R1Y3Q9YzAwOQ0KdXNiIDEtMTogTmV3IFVTQiBkZXZpY2Ugc3RyaW5nczog
TWZyPTEsIFByb2R1Y3Q9MiwgU2VyaWFsTnVtYmVyPTANCnVzYiAxLTE6IFByb2R1Y3Q6IFhJQkVS
SUEgSzAzUw0KdXNiIDEtMTogTWFudWZhY3R1cmVyOiBBY3Rpb25zDQp1c2IgMS0xOiB1c2JfcHJv
YmVfZGV2aWNlDQoNClNpZ25lZC1vZmYtYnk6IExpYW5xaW4gSHUgPGh1bGlhbnFpbkB2aXZvLmNv
bT4NCi0tLQ0KIHNvdW5kL3VzYi9xdWlya3MuYyB8IDIgKysNCiAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS9zb3VuZC91c2IvcXVpcmtzLmMgYi9zb3VuZC91
c2IvcXVpcmtzLmMNCmluZGV4IGY0ZTg4NWY5NmU4My4uNWQzOGYyODBiNDIzIDEwMDY0NA0KLS0t
IGEvc291bmQvdXNiL3F1aXJrcy5jDQorKysgYi9zb3VuZC91c2IvcXVpcmtzLmMNCkBAIC0yNDg3
LDYgKzI0ODcsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHVzYl9hdWRpb19xdWlya19mbGFnc190
YWJsZSBxdWlya19mbGFnc190YWJsZVtdID0gew0KIAkJICAgUVVJUktfRkxBR19NSVhFUl9QTEFZ
QkFDS19NSU5fTVVURSksDQogCURFVklDRV9GTEcoMHgzNDQzLCAweDkzMGQsIC8qIE5leGlHbyBO
OTMwVyA2MGZwcyBXZWJjYW0gKi8NCiAJCSAgIFFVSVJLX0ZMQUdfR0VUX1NBTVBMRV9SQVRFIHwg
UVVJUktfRkxBR19NSUNfUkVTXzE2KSwNCisJREVWSUNFX0ZMRygweDM2ZjksIDB4YzAwOSwgLyog
WElCRVJJQSBLMDNTICovDQorCQkgICBRVUlSS19GTEFHX0ZPUkNFX0lGQUNFX1JFU0VUIHwgUVVJ
UktfRkxBR19JRkFDRV9ERUxBWSksDQogCURFVklDRV9GTEcoMHgzYzIwLCAweDNkMjEsIC8qIEFC
MTNYIFVTQiBBdWRpbyAqLw0KIAkJICAgUVVJUktfRkxBR19GT1JDRV9JRkFDRV9SRVNFVCB8IFFV
SVJLX0ZMQUdfSUZBQ0VfREVMQVkpLA0KIAlERVZJQ0VfRkxHKDB4NDEzYywgMHhhNTA2LCAvKiBE
ZWxsIEFFNTE1IHNvdW5kIGJhciAqLw0KLS0gDQoyLjM5LjANCg0K
