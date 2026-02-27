Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013022.outbound.protection.outlook.com [52.101.127.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530367FBA2;
	Fri, 27 Feb 2026 02:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772158267; cv=fail; b=GFKGfPa6gCLU79qosPWzldPFBRwLn/99GvdH377ze+o+lzGn4+FVoEPrTe6yefAWI6gMe/ZzLslUg5UVOCYHUJEveX/FBUQVhbNgVnF77fQ0px2KSIjXWH4rzmCuDxUMaDTTYfF5KtgkjWsXL+t+WEniX7kCvv2UkZTcz08WGl4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772158267; c=relaxed/simple;
	bh=lwTk4X/AMNq7KagrT37cYPmBqnru4f87Mmm7/C62Ukk=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=obCI3b6jM7kLDsscX55gjnDxn78zYH/2AVBKrCHElocR4FnQHFErvVAF8v976zYvdYZp+8NGjCRnVkEyFvorz4zVidIWsMt+daxult46DPR9Bajyx/iiTbF0JJ40+1567MAm/roUFNqoNYhYRh6xc6xCA+W0asyooH7tkZrzNEg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=p4kj0f+4; arc=fail smtp.client-ip=52.101.127.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="p4kj0f+4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NnWXzCRYhZHVkns8eqxl3CDtVIfEZ4QQwpE27yTwWUr+Uk+bdRSQxQxqIlW9T2o05tmtyO/YNmu2zgY/+BALy84AJpc7MiLgkLZj2o5Pjtr0qweff/5AW4Wvf1o1LQ/n52cqV5j9yv+/w1XqcQ203dx+wx8ZPKbFehVhlD314bLCe9pY4Hj/fHAM6vvMKyIJ7YGZWxEvnbiajJ3LK09ocqhDxxXOEe71MExQfiuUiJpk+2SpX+xWbs3Y37/zOJx5fh6taFgaU4HhPLMDDDZGPiiyblHD++pZKithMR8SdN9T0nCfAzOajOYOndLrG4DPXVcI5lndABT2F67WIFMMXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lwTk4X/AMNq7KagrT37cYPmBqnru4f87Mmm7/C62Ukk=;
 b=ppNBZ1mFtGaCTkaVgAtUVULi8bCL6g3WEplqBKcYvWaBlRYZwV58zdWSCgNtBSga1uLaiGhGOMHCZOfB3Z4eR4aTtNaSqoSNAvgOgzbM9lc49GqvuWDYTrGvhwP9w6OA4pA9qdSFRaT9vp3PT2ujRq44cSrEQft7AgPnYtw6YLcKBt4w9oT/zHEyJEvqgMKNe6rdX+mNQPpiSiwF5lOENCU967aAOuGxQ9b/2z7JVCQAyTN88BMxiOzh0hituzvfJmeG33yfjODQTS+K3SpIR3ZpOxijJRykV7/sfB8dSouhzWH6fjFDKdWKdj+6ab7jmyT/RdpRWmmsrsu3rgqaKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lwTk4X/AMNq7KagrT37cYPmBqnru4f87Mmm7/C62Ukk=;
 b=p4kj0f+4dUzTSkuQwrIuJ8FJtsvaah5UmymNjikfvhfmqUnvpwrY4BbbxhE0TLFPJWffWkgljd/xTO7yDTIeH04buqlHILQYl9QXFZHTkbIfKfnXUnGHq58ZtUfaYMjK8scIRwqk5EV1fvMXNCnb3/fRl9LUqIQm11NhSBHeHNBGUZhsId1HySCvZtAwmS9M2buq6JhYViaSewNBSBxlKmFJDqcl/CzYGzQKY2eEaS8vLVyRVWnzfoQg/nEyhVB/0NvXQ6aLIT/rDinDnVgakld141QZdoEzNgZveHgUgMJ6Php7t2+dwTZmFSWFX5BAgrmRjgES0OEP/Axo5nVjjA==
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com (2603:1096:400:358::7)
 by TYUPR06MB6001.apcprd06.prod.outlook.com (2603:1096:400:351::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Fri, 27 Feb
 2026 02:11:02 +0000
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc]) by TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc%4]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 02:11:02 +0000
From: =?gb2312?B?uvrBrMfa?= <hulianqin@vivo.com>
To: "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
	Cryolitia PukNgae <cryolitia@uniontech.com>, "pav@iki.fi" <pav@iki.fi>,
	"jussi@sonarnerd.net" <jussi@sonarnerd.net>, "roy.vegard.ovesen@gmail.com"
	<roy.vegard.ovesen@gmail.com>
CC: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?gb2312?B?uvrBrMfa?= <hulianqin@vivo.com>
Subject: [PATCH] ALSA: usb-audio: Add iface reset and delay quirk for AB13X
 USB Audio
Thread-Topic: [PATCH] ALSA: usb-audio: Add iface reset and delay quirk for
 AB13X USB Audio
Thread-Index: AdynjgbYJYjww8/fRtq/0uIAmeGWlQ==
Date: Fri, 27 Feb 2026 02:11:02 +0000
Message-ID:
 <TYUPR06MB621795D087BF2D594027C235D273A@TYUPR06MB6217.apcprd06.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYUPR06MB6217:EE_|TYUPR06MB6001:EE_
x-ms-office365-filtering-correlation-id: 4e1e901a-b923-453f-ea59-08de75a574bd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 oCXSzTJN+Klpfs23HSalQOt+LWWQ9ZJ7XIbMAQHkbQxlxJrhBKjCQNvcAIJGxWxCA+o368oYuN+WHcyM84iFWfEqTfMWKIktliX2NxCCdMbgBFF24HsrtK59qDzJauMXkQQZdhP/i2fgMC3Y4W74q+XyljXoj5Qfe3tTJKLqHm0Y46GddFuv/NoGgm8F2rYZn43Fu3iNaZQcZziHEB5qzNZpnOcz6iY5zYKvVE+LS4y+pxaSvIiY/JFHNdPIoib+tmp6Spf6yjiiYAfKaMGtDJ7IIRuHl82kH7ue7caWxS30DOxAXns9x5KhfRNB8XpJJrBH2gRDFjyxXtHxkBprwlJCrM/vYLUcQGIczSEGRVgiT4BcKtXTE7RNWe9EEK9c524ePeT4utfZT6n9Gc+/pQejK2r7dAdE3z/ckMOxgY3VLact5hkEr6iuUaae0LjjoBO4Ty4dhx+/tAYlSVYeFiLk+CASP5ASzD+crjsOasP3DA9mgCZ9cLJtXHFBizBk0KmeZhvfbdYfZRrQt5I5ZuSqLicA0GmXX0BVm2A4BDeUtPAiK4HUe6RedF9WBNGVEz/SQ77BA/SJ7zyxqhaThcgCm7JmJ04xQ6c1C06iYdojuss2CCfoFXeRixIbP8zTthTJIEhfmgDZKPHd8QI2RRITVVGnlPAoIWcShZTnI8p9YquGaJSQOOJskkMi/W/zQAlZjtpsmsCjrSQzp64YVAJ7DFy6t47wkhPD+utxZVUinBiKSy8EzzSBcgCasgubIlXlMoaGV3J+ExtV8puqE6XOjx1f6t9pC21+RfVo0gE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYUPR06MB6217.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?NkY1dmJaTjJJdC81RXVYN3dPTm5GdmI5RmNnU01MMzRCUHNsUkZYeUFPekNY?=
 =?gb2312?B?Rjd6ZE5oQmVYZW92RzEwME11R2ZneWhNMkNGR3B6QzVzTW0vbldtY2FTVjcr?=
 =?gb2312?B?eHlFUGc2WTVLUzBobDVUYitwM1lxMGhWY0VtTXMxdkV2ZVk2NE5aYTBnUFBC?=
 =?gb2312?B?S2JkNU0rbE9rTDhkaFR2NThZeXN6WVMrVG5sWUFKdXRhRUpsejZBSHJHQnZM?=
 =?gb2312?B?UkFsM0hKU3BqcjFyS2tRTTNZRXQwNGhCNS8vR3lha2Jsek1aTjh4Z3B5L0ww?=
 =?gb2312?B?a2o0OVJyclZHNExEZGs1KzQwN0pGTU16UVoySVRXTTcvZlZyZFdtWGNUUFRn?=
 =?gb2312?B?c0tFdytEeENwN05GSnBiRUxMV2daNXdMMG9Na056akhydG1aNHQxN0pLQWpL?=
 =?gb2312?B?cFY1c2hReExGOWxKaWg2dE8xYkZITEEwMDVxZ1hYQzd5WlJNWmp0WEF0TVdQ?=
 =?gb2312?B?bW51K2ZOeTkydXhjZ045ZTNBNFM1VkxyRkN1V2JGTVQ5UVFFN29VYWRteHFh?=
 =?gb2312?B?RGdLM1BIazRmTEkyS2pJL1ZFazNDbVc5bjR1QWNDc2w0N2ZSZTNaTlBZRGQw?=
 =?gb2312?B?UXFuRmhoYTFyalNrNHdzV0xQeWxHbmc1S0NzbWEvT3lZakpNQ3JVYms5UDBO?=
 =?gb2312?B?SjZIcUVYZG1neVZFVHgwcDlsSnJReVJ3ckpXTSt4R1I4Yy94RTBlMlhZaE9S?=
 =?gb2312?B?NXlMQ0NOY2xKcCtTMzVIazFmRUxIYnRVMkJYNHFRQU92eFk4R0hBcEdCbnpW?=
 =?gb2312?B?TUZDMjV4Mk1qenNaWWpidUxEc1k1MklhSU5Pa2lncjB1RGE0T2tMWklhMDRZ?=
 =?gb2312?B?Y2Z0TEllcjcxRjVPYytXKzZ2ZmQ2NTlpbk5LMkN1bjZOODkyWjI3eXZYc2xW?=
 =?gb2312?B?bzlVUERkN1FSNCtsRXdFbG1TT2w2bXoxR1psamFQN3hBRTZyd0ZNS3BhM29P?=
 =?gb2312?B?Z2FiblVjejVUZWxUSjUyS1hYaU96TDRrNE9zTmUzTTJYVmphVEg2QU9hYlJN?=
 =?gb2312?B?blkvelc3TjhUeCs3YTZOQVlWOE1PRFYyd2xORVdRTXBzWDg2WmlWUVhQK0J0?=
 =?gb2312?B?RHFNVmZKYXErbFdjSnoxRFhmVmNBSG91OFFTY0JXNG9ZemZlZ2RISGtuZDlN?=
 =?gb2312?B?UmVSV0lhVmROSkxNa3Z6Y2lKb0p5RzQ3ZXE0TXBCcm9MQ0VvNFVHdlpmVkxI?=
 =?gb2312?B?WVJqMkdGODNTR29ZNnRqN2U1bEIrMVY1QzJhOFdiOHdQWXRsdXlHcnJ6VWF1?=
 =?gb2312?B?OTVLd2RYejNmWDlUdmVvSVBNS0lmU2c2cUozUnUvVE4wOWFyQXEvVmowaGpP?=
 =?gb2312?B?K2JVRVpwUVUzakVtTmdISU4reHgrcW1aNFdURDNSdzFFRG4zcnFRaEwvN2VB?=
 =?gb2312?B?ZVlpdkJacDBURk1GUU5IVzMyQXhEcmR2Qjh4Vll6d21SNnhjNHVvVU01WlRv?=
 =?gb2312?B?S2k5UXNMaXU1UGpFNUZMYTJHR09VTFRYUTJmQitkc3dlcXFwUXlxM0NBL2JV?=
 =?gb2312?B?TDlRWDlFUWJlV2htRVdDckpBM0xYZGw3M1RYWENOVnBZaEZNZXcxR29UM2NV?=
 =?gb2312?B?bWZ4SXJCL0J6aC9mYmo1WmM1K3AvSkd4UCtEcDNpanZBc2x3L3E1SmxqMnJN?=
 =?gb2312?B?RGUxODcyR2hscjduZlZ3QUUxRWpoNHNNT29Pbm5uTWtlQ0k4d2R5SjhVMHB5?=
 =?gb2312?B?WmVaUTZ1MGhDTndKRk1FYjlrc2pVNEZzMTluS3VVZjB2SCtBRVFqYnlKOGRW?=
 =?gb2312?B?dHRNOWxGcGVGQzQ5R3ZlVEI0aUUrTEJUaDBKTUtibFRLYWtiSkRlT2tiUDJ3?=
 =?gb2312?B?bU5HYlE1OUJJWXlCWHR0QW5VYkliTnVqWWNrMWNLb1MyVWRSVG9zS1V6R2Fv?=
 =?gb2312?B?VnpjY3RkY000ZUdYZnVVY3NOV1BDVFc1U3ptT3JpMVl1YzB3K2dLbTZMTnJw?=
 =?gb2312?B?VUxLWXo5YXZwc2FmVkV6U3V2dWRMQVFqZEdrb2JkTGpRaEVnNjVWNTV2enFH?=
 =?gb2312?B?biszeFJXZ0tFQzQ4WHVJRDlITGdMVzBvbGVxSFd3WHhQQWFzRFcwUmFNemxy?=
 =?gb2312?B?UFVLOGt2cjdBTjJiMzNxZ0syTjJFV0JOb2dEOE5xamtrL0dIc2NubWRoMWd4?=
 =?gb2312?B?ejUreVdsbU12N3ZLSHdMclJzM0Vnc0tjYmRDamFrWEZ3d2tqTWtVS3FGRm5r?=
 =?gb2312?B?RUZ0SUF6NTQ3WXB1M0c1TDVQSk0yMzRrc3JVZzBhd2V0VVdlS0Y2eUF2am13?=
 =?gb2312?Q?hiyPSmim9Z5fZcwJfoSVRn39aKNpB2XeqSP7K8A3jw=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e1e901a-b923-453f-ea59-08de75a574bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2026 02:11:02.1250
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sTqqQY9MkQPt0bd70FMwEqysDD26KWglbCg3SLWWdpoCDk5Z1317bidRWWfpIhXIGUY9vL96Jki9W/4+dLx9RQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR06MB6001

U2V0dGluZyB1cCB0aGUgaW50ZXJmYWNlIHdoZW4gc3VzcGVuZGVkL3Jlc3VtZWluZyBmYWlsIG9u
IHRoaXMgY2FyZC4NCkFkZGluZyBhIHJlc2V0IGFuZCBkZWxheSBxdWlyayB3aWxsIGVsaW1pbmF0
ZSB0aGlzIHByb2JsZW0uDQoNCnVzYiAxLTE6IE5ldyBVU0IgZGV2aWNlIGZvdW5kLCBpZFZlbmRv
cj0wNjI0LCBpZFByb2R1Y3Q9M2QzZg0KdXNiIDEtMTogTmV3IFVTQiBkZXZpY2Ugc3RyaW5nczog
TWZyPTEsIFByb2R1Y3Q9MiwgU2VyaWFsTnVtYmVyPTMNCnVzYiAxLTE6IFByb2R1Y3Q6IEFCMTNY
IFVTQiBBdWRpbw0KdXNiIDEtMTogTWFudWZhY3R1cmVyOiBHZW5lcmljDQp1c2IgMS0xOiBTZXJp
YWxOdW1iZXI6IDIwMjEwNzI2OTA1OTI2DQoNClNpZ25lZC1vZmYtYnk6IExpYW5xaW4gSHUgPGh1
bGlhbnFpbkB2aXZvLmNvbT4NCi0tLQ0KIHNvdW5kL3VzYi9xdWlya3MuYyB8IDIgKysNCiAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS9zb3VuZC91c2IvcXVp
cmtzLmMgYi9zb3VuZC91c2IvcXVpcmtzLmMNCmluZGV4IDRjYWMwZGZiMDA5NC4uZTA2YWYyZTc1
N2M5IDEwMDY0NA0KLS0tIGEvc291bmQvdXNiL3F1aXJrcy5jDQorKysgYi9zb3VuZC91c2IvcXVp
cmtzLmMNCkBAIC0yMjE5LDYgKzIyMTksOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHVzYl9hdWRp
b19xdWlya19mbGFnc190YWJsZSBxdWlya19mbGFnc190YWJsZVtdID0gew0KIAkJICAgUVVJUktf
RkxBR19BTElHTl9UUkFOU0ZFUiksDQogCURFVklDRV9GTEcoMHgwNWUxLCAweDA0ODAsIC8qIEhh
dXBwYXVnZSBXb29kYnVyeSAqLw0KIAkJICAgUVVJUktfRkxBR19TSEFSRV9NRURJQV9ERVZJQ0Ug
fCBRVUlSS19GTEFHX0FMSUdOX1RSQU5TRkVSKSwNCisJREVWSUNFX0ZMRygweDA2MjQsIDB4M2Qz
ZiwgLyogQUIxM1ggVVNCIEF1ZGlvICovDQorCQkgICBRVUlSS19GTEFHX0ZPUkNFX0lGQUNFX1JF
U0VUIHwgUVVJUktfRkxBR19JRkFDRV9ERUxBWSksDQogCURFVklDRV9GTEcoMHgwNjQ0LCAweDgw
NDMsIC8qIFRFQUMgVUQtNTAxL1VELTUwMVYyL1VELTUwMy9OVC01MDMgKi8NCiAJCSAgIFFVSVJL
X0ZMQUdfSVRGX1VTQl9EU0RfREFDIHwgUVVJUktfRkxBR19DVExfTVNHX0RFTEFZIHwNCiAJCSAg
IFFVSVJLX0ZMQUdfSUZBQ0VfREVMQVkpLA0KLS0gDQoyLjM5LjANCg0K
