Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11013030.outbound.protection.outlook.com [40.107.44.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8C933BBBD;
	Wed, 22 Jul 2026 04:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784693235; cv=fail; b=lLZ4FQ+/s43YBFAyOvGat9rpf/U8qIsl1vYg0eEMwB/nHvHnh8ZkPIphZPoXluIWJRYK+PufVUqMsYujdCFW8H5pny6SidN0DJiQsFqXicxj//s4AbYLR0hdhZC/WIMnoREWzwr39PvTbV6vGr6K4szzx/uF9fl+8rhWwIAvcRs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784693235; c=relaxed/simple;
	bh=SR49CLucby1hVicSP4oQ9ksYmbSwAdhcE6j8+Bm7dcw=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Y7GmCgefH2DA6+TikDVYSkAso9KzvJetp4j1zHqrzEl3j/JPWkwI/+CsW6hq8wOJi984MV2ag0sFFnsQmRFk7MdSjNd4iPN9qvgYJU0SLTE3HLfGHpKSOkZC2LxWR/SSldPt1v8GIl4UHKI3drfq6QJHDUUMQnxGxqY/Xka8/FQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=daZD9EBK; arc=fail smtp.client-ip=40.107.44.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="daZD9EBK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=blvsXIeNOHNWWUVehrq1tf4OKl6BXMh7KHPcoiIXOtUXoNgVX7dbwTPSqR1kqiAVTM8wg64+S+LuXkj/y90zGDUayhq8fAn8xUXW/WNMFw+EZfurOjvLT1ZcJX7/ek862gwmyyN0bRk5HvAU4c26toeeIoEOIVE7I0Ca8qXHN7XLKlrAlxwYp92IfIAR8DMMLtmU0wsOFxktZnGzUVQiuLFnIMvXzuBfcN48xdUqM4yxC0IqiHOLPGfxuykNiaNZNzohVxO1Iqg6QjBRj0sJWIkSZeBV4WB2pwQwjq0njfqjebvv3wQA8INTsT+66k8vZmAVMW7BS1irojo4AEDoeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SR49CLucby1hVicSP4oQ9ksYmbSwAdhcE6j8+Bm7dcw=;
 b=pd0pG6PSs2oHq/eCrgyKXpvxC/Ivuv+LCLXIv2EFNq5yRxv+4DgVtzwE42ZiYslkvED6Vn3c0lICyXQnVBd8F4+yf4uf7dNuQJ0GbzTtEakrkqe4fpTzZe08wQvvYmjmFYLRZ7PqL4uB6B3Oiw8gvxo8dn0esCDiQ1xEq27h/rBFvXafniD7tdgzQUiVVjTAaaXKlp5TmR+CA0CJMzgsOEqnuJpCem9xlmuD+Z3AUaT29+qLSvH6pD1IT02YKv/Bg6uoIsOblM000J1n25MtuAKgIU9veff5nAs8r238z9hQam8WX8A9dM5PAoGvfoxgxR+73tOFyFBlQlpJziV8xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SR49CLucby1hVicSP4oQ9ksYmbSwAdhcE6j8+Bm7dcw=;
 b=daZD9EBKqiyWGiHtDWnIKtMyZge+MLXGF8CQvNM/MQmkqPYuYFlvM0+Br1ok94UndidvEqlgQjUaMTMoK8UNRP0Ux+y9ZpRLHECvmP0pf6IuLJBhbH+FQTMiZfLa+IC35Y7lzZYb2qkvc2Hm3QyVmyM+6eMyDSFXx8hqB553Pcs6dFvgpVYNPrIMTkLGUvUAZh2XNuJYgcy+dfylqa1nudhWSM6gwN+uHP7oipxedl0tS3ZUzGK0PnGTSiekswnmOx/3AFCsGYkxVtFI+N8nzIb6mO819Vz9EE3hC5k8CROxfHOTKQj5SBDMy8+eDWfDGojFC/QznhWkVoVFehtemw==
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com (2603:1096:400:358::7)
 by TYSPR06MB7298.apcprd06.prod.outlook.com (2603:1096:405:95::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 04:07:08 +0000
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc]) by TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc%6]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 04:07:08 +0000
From: =?gb2312?B?uvrBrMfa?= <hulianqin@vivo.com>
To: "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
	Cryolitia PukNgae <cryolitia@uniontech.com>
CC: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] ALSA: usb-audio: Add iface reset and delay quirk for Generic
 USB Headphone
Thread-Topic: [PATCH] ALSA: usb-audio: Add iface reset and delay quirk for
 Generic USB Headphone
Thread-Index: Ad0Zj2FUuSJlBZw4QyeQyMdbK4HdsQ==
Date: Wed, 22 Jul 2026 04:07:07 +0000
Message-ID:
 <TYUPR06MB6217CBB68C8F868C076A4353D2C12@TYUPR06MB6217.apcprd06.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYUPR06MB6217:EE_|TYSPR06MB7298:EE_
x-ms-office365-filtering-correlation-id: 64416ef1-04cc-4757-6d00-08dee7a6b26b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|42112799006|366016|376014|1800799024|38070700021|56012099006|11063799006|10067099003|18002099003;
x-microsoft-antispam-message-info:
 0MiGAouX4EEhi0MfitYeXKpgg4WSRUoNexAxYqXJH3zPLKWigglnd4+6zYZCUBsf8/Io5w4VmqmsQVWMXdNm48yVe9uQfs0QySjrAU+22O3OWb+/v+tjMNTzTO66q5bcL++7Mwy9wGLSAfdJXXzaReiomDBU12QKtMgJmhFG2G5rfBqsk0vtM5AAAHBA7WAauEnhauXQR75b7AjxHF5ZhPSc5rcKWe88jovIJoepQ8AoH3rCLF1t4MFAU4neHDP/OW/BpE/1lh7Ej3a4YROsW3Uu99yyUnU5uZGqQy8XRTS+puK+Yg2Ct3YWaRM894q8n8ut90EAUvmx0vFq1H38r/xVThzvsr6KyHq3aLuTAj6oe7s5fLHSVQleQ/9sy2aB2J7wiBEJHo+2ctKLu4yqkW2IuRZ8CiUZm6b8iVm9GV/CHV2i9MgL+oI0LAtmkbYOu2qpwOrClwlIYHWPs/wkVMxIspjX0cprQTr9giJ1f0FwLAWzU5DEZkwU47Vrv4z7w8bc6IqCiFgqCTe3h/R24fYs+HFR18B/M3oltzFMcdIBO/+GdF0y/5Wc0F5Vybu4O+683Acx6TY4RglwlhDzdWOBeeIDF13dfmvrpzkqtBKk31+LGdxRZVdWzFlc8pFvUjGRbOT5P1ykt0Mr75u4jXg4QeJ4VEpsMKwO4GtmCsFHTKaWYlvDQgi3jrti3xZsTQ7v5dILALJTkqnP1lO17TmSBFh6dQCbKrORg2vDBzk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYUPR06MB6217.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(42112799006)(366016)(376014)(1800799024)(38070700021)(56012099006)(11063799006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?bTEyYlFGdUZJUWRpeFh6cVcvdHJ1UmdKdlQyeFdEdUMxU04rRXAzOUVlV0tB?=
 =?gb2312?B?Q21kUGVhZXZYQVYxMmpVUFhIM1BhTG1PRXdDRW83ZitZdWQwRS9JMlBtdmZ4?=
 =?gb2312?B?R1NlQkhVL0pWR3p1aWhuU2JzSENkWUt3TlpLOXUzZ01ZVTBVbm5OcUFscXAw?=
 =?gb2312?B?OTlGdktjUmtMaGo0cXlKL0h2MVVGZ3JBYXpvRHhrYlhFM3R2VmpYWWRaaGEw?=
 =?gb2312?B?MGt5QnZIbnhLWU41UVdCdVo5UktncUtFcERRRmhzNDBXdGFUSVZIWkRLSHgx?=
 =?gb2312?B?OFJ1aU1tbCtxVDYrL2IyNkVVdGczWWFsd25XSk8zbXRxMUZYRWdjcHEzYlE3?=
 =?gb2312?B?cXdGVnhBRWJNS0J2S3dUYit6MXJKZGlxWWRLb0NEMkZQRWNadDNqc0JURXk2?=
 =?gb2312?B?Rm0wU2E0WkZubGxvdjlKK05NYXFOaVFPVGJwMW5Fc2k3NDllbm5IV2pZR3Rw?=
 =?gb2312?B?K05Ka3NWK0k3bWd6SlhpZ3NwODd3b21KdG5IZ1NUUDhSLzlyZkJtcUttakJh?=
 =?gb2312?B?YUlIYklRNURNWmYzU1JlYllrMmhXZEtyL3pySmpNOThTbFRVSFdXalUxYXF6?=
 =?gb2312?B?d3hNNDROOTVuNWthOGtRV2w0cVlwWWpLU2NoZ1VjelMzYzN5cFI0WURzS29G?=
 =?gb2312?B?Z2x4UTdHUDFIeXRhaFU2S3NpTytiWks2dklId1R3U2ZUYlpoelAyS1M2ZmF0?=
 =?gb2312?B?N3Vic3U0MVpFRjlSK0t1MTdEcFd0L0R1bXRCMFZwUEFHQWtyYlV1c3lrY0RL?=
 =?gb2312?B?ZHRXbnZSY2phcHAzM2NmdG5Nd3dneFF1YlpzaDd3WTd2Q2czRVJCTHBTR3FV?=
 =?gb2312?B?bFZ2TWxVSjRmUXJ5V2ZzbEZ3SWNBUkxRRG84SGphMTNoWUFCMndab2hjUTFY?=
 =?gb2312?B?OWRMSFQ5dTJNOFlBbXBBc0ZXcG5BU0xIZXZzdEJsYzNjSjkzUUplTGNxNGc4?=
 =?gb2312?B?TTJzSGZ2VWFzOHNRQVVOWDlKRWpFSWlzY0YzUDR2V3prSWw4QXllRCtzMUhZ?=
 =?gb2312?B?Q1plQUFmZm5VQ2gvYXpxSy9mRDZtRnhMMHZHcURQeTBsdHJQd0ZCcC84YjM0?=
 =?gb2312?B?T3VMYm9YQkNlSTExYUJzckoyQlh1d0lVWnN3d3hDRlR2VldHZ3F3YWpVaWlx?=
 =?gb2312?B?elBhZjBmUDVBTU1TUkg0UHpyNld3M3phTWVCL0pxZm9EUnI2WlFTdlE4WjZ1?=
 =?gb2312?B?SHhUbkdvSTBZVExqeDlKamZkSXdTTCtPRzBHeWdmQVRpOGlTWFZlK3kvQTBr?=
 =?gb2312?B?L3JVRi9yM3ozbGtmWENmMlFsVWpYQjZzVFE3NVhENW93YkNvNlZJcGJLU1BO?=
 =?gb2312?B?KzR0K3lCQVlIbkhKOVV1emVNV1dzaHBaaTNGdUpmVmRHMmFObkZER2xRMHBJ?=
 =?gb2312?B?akprQi8wc1hzR0ZUaFcxZmw4c1lyRkdPNXVUNjZmdm1QZGpTNDlGcm9ITCtH?=
 =?gb2312?B?bHM2V2tMSVBqRHdyUFpYMzI2Rk04RlVNSFlza3FsTXRUMU5Kc2I1NS9mczNs?=
 =?gb2312?B?UFl2V1NkZWMvR2ljbTdnS3M2WlU3U1p0MitIdkdBM2hWNHJBbnJaYjJ4WlVQ?=
 =?gb2312?B?dDBPUnhqREFuMFY5eGNzODg0MGZFVmgyaTR5dUNkc0dLS0VzZHhoUkczMnJy?=
 =?gb2312?B?K1JtK1BhNVJJZ1dZalNaQnNDNkYxT3RaN1FYRyttMWNoNnpndkpEYUFyd0l0?=
 =?gb2312?B?YnVPd3VLbG1GeHJ0REEzeUJRL1R3S1hSWGx5V1piUE0wWnF1OFd0dkkrWFFK?=
 =?gb2312?B?bWFsVEMyRWFYWndWYWVnQmVBSU1TcDBpTGs4WXY3ZGVoMjBYZXcxT2xBMWk1?=
 =?gb2312?B?SWdNc2NTeFpyODREVG9UMGFPVjc4blI2ZWZ3UnhUbHpRNkxaZnhSRWIyeHFP?=
 =?gb2312?B?MUE3aks3cjAxclVOMnlZM0EzRUY4RkowVU9FWjAyQjJzc3lBanZDeUJBNFM5?=
 =?gb2312?B?WFpKV0JrOStBOTQwRld4STM3U1FnUk5YNUFZZlR3TFNHYXh2Q01vbEJ3NzBp?=
 =?gb2312?B?WnB3bVZnSVhuQkg2akgxNXQ5WXNvZFRMUjB4ZXNOZ3hzcHZEOEZDWm5WSVBy?=
 =?gb2312?B?eTNyVDZuTGhxV3lWV3YvNSt4c25QZnp4ZVRURHhTVlhYTDcwdTdleEFuNm43?=
 =?gb2312?B?QVRvbVNJbnVUOEwvU2MyRkFaQi8weGdaRzdzL0xhMWFZT2xBcUZnSGhRY1Rm?=
 =?gb2312?B?aFpxSDNqcmVGUzV6WklIbFd5R1lLYUlGN2hqa21LZHdoQVIwM2hkOFZCVXM4?=
 =?gb2312?B?eEVLSllpUGZCRzhEU0d2ayt3R1BFZklUQmpob1J6VVA5ZkM1em4xa1VQYlRt?=
 =?gb2312?Q?0LFixxmDHcpeZyZkoq?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 64416ef1-04cc-4757-6d00-08dee7a6b26b
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2026 04:07:07.6357
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ky3TAh0Y1QpTZYu3RRuvkV8OUp9sb6enR92FhG5jKp4fROuIFUVBaPDNyLJ2ojCIH/ESncL+HFDnIbbHsxvwBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB7298

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
