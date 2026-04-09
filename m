Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012061.outbound.protection.outlook.com [40.107.75.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC1A29E110;
	Thu,  9 Apr 2026 08:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775722906; cv=fail; b=YQUn9oyGBvkCYSSlB69iVY/lKHciLkmwutTaYj+7cPK0NC80lfzoH1HgEbgGwczc7+Wq/Wu69N+LXypEU35mWo40YC32i/kE6DBhOe72NZPbphecH1GrA37WGp8PM9D0hsDeNCvBl7y1PcuRk2D0CFAjWfvTBxW+7AqpzNQM0fs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775722906; c=relaxed/simple;
	bh=0J+sc4u3oJF8u0FDF2DoIy3mxVwxdVGsDjGbTvEkgDU=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=RPtPAdjLjvhw8ROpLldn0RPNOc1R5LWy39Ii6wzgZVFS8/wWJ4CgUN45Dtf2CGUl5j1c2MecWdJXQqi6Zxy1ZVLwTTrsd5kYXy1Cs5wc23PkEwTviwuHertWV1ZWD8BFteYSfcFcPXJKi2T31hB682Uhly5jzizunhByHgF/wEM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=mp9waMzJ; arc=fail smtp.client-ip=40.107.75.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="mp9waMzJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OdDiTB1tsAoTR7Mq+85yyMLDawHHmZ/gee3p0Vrm0vrQyOZhu2H3ysJWnmTKTxNHVkGpn1xJh01vV3BzmV2EjVOVL/LRwI/VdIDmMUTCj7ybkRwDO0RMb/tSfSH9C3Tg8cUyemfas4saCY4yVs4cJetJH4/LvOJ0HfEQmvfElZj8djfMVsI6Ut6swM9q6K2iHLNZbOCXrwJLjtqcCMhQbst1uQWzD2N8leVkxAOvL6UPk5juHRroD6xUTSzE5CLmK4c2GZnJlho4OSO8Vw/Jmoej/8b+ci0neCb6F+GfcA3+fyFSMqth3fch1+GkCN/gp5vGT1mGinRIobaEs6JaXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0J+sc4u3oJF8u0FDF2DoIy3mxVwxdVGsDjGbTvEkgDU=;
 b=CRzL+Yc4N1jfR7h+JjB7vb/NFtfb1sD9cjl4vPjzliJtHXwVKcm8QY+FbS+X7TImotQXD018wD79WP4MIbpj1vS5TtCeJ1GJFkXQ7lywocjnLRSL3XRjwKaPYlex2InJGTQn7b1bqDpoVMd8fwGdR83wM9vXDp/2Y42sgxztHpMoDRT1BnOpNVuA1uX8ZM046z1E/iUK8WucAr7LhXK1Y1Aq5jHP3GXwjpycyyV7Pvgje9qiAlLycLsB1ipLqmQKduB+zvso3dN2HSY94HVt/NH8xxbThjBFGuUl1ZZz/55bCF0O/Vo6asM5Hk5AnvUVJjXNtA3gj6y5RPi/dBaLlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0J+sc4u3oJF8u0FDF2DoIy3mxVwxdVGsDjGbTvEkgDU=;
 b=mp9waMzJK/wwYbWbzLSm44Muwy9DavBleXFIKKrDwnlSS9pqnfz1cGsggB84C+9mMuHePNvzPhuTnjzYxm3Q2i91ingegdYlN13BZBxzbMY/lLlp1E5DDUiWoAK0byjyAE4ijFUD/AAap6x9PTUPEkOHP/qMR3S6s9st715gGNwjXxU0futuY4nHPtBBSqv3BGktNPp1D2K9qCg1Cra3PBUyLMJk6z4T8+umkdByQupqBMi3+eH7ngoAtoHrz1jmsrAq77xhHD1ILh6cAhT/2ub9k6BDRrNNNgcM0vztFF/d31bFGaAzL9c4elk/UacP6ULYxWbQqoi/MoiCdgekXw==
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com (2603:1096:400:358::7)
 by KL1PR0601MB5797.apcprd06.prod.outlook.com (2603:1096:820:b3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Thu, 9 Apr
 2026 08:21:39 +0000
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc]) by TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc%4]) with mapi id 15.20.9769.016; Thu, 9 Apr 2026
 08:21:38 +0000
From: =?gb2312?B?uvrBrMfa?= <hulianqin@vivo.com>
To: "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
	Cryolitia PukNgae <cryolitia@uniontech.com>, "pav@iki.fi" <pav@iki.fi>,
	"jussi@sonarnerd.net" <jussi@sonarnerd.net>, "roy.vegard.ovesen@gmail.com"
	<roy.vegard.ovesen@gmail.com>, Jussi Laako <jussi@sonarnerd.net>
CC: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?gb2312?B?uvrBrMfa?= <hulianqin@vivo.com>
Subject: [PATCH] ALSA: usb-audio: Add iface reset and delay quirk for HUAWEI
 USB-C HEADSET
Thread-Topic: [PATCH] ALSA: usb-audio: Add iface reset and delay quirk for
 HUAWEI USB-C HEADSET
Thread-Index: AdzH+XBipaMTgz0xRM2XH8yy3I97jg==
Date: Thu, 9 Apr 2026 08:21:37 +0000
Message-ID:
 <TYUPR06MB62176A18EA7A9DD0AC2826BCD2582@TYUPR06MB6217.apcprd06.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYUPR06MB6217:EE_|KL1PR0601MB5797:EE_
x-ms-office365-filtering-correlation-id: e2bd5336-c453-45b6-021d-08de96110517
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|42112799006|366016|1800799024|38070700021|56012099003|18002099003;
x-microsoft-antispam-message-info:
 3CAfYZg0+/vTU8+7BiIdGyOxs4C2uqqZJhzsLm47ffJwtB6rmnvmJZ1yjGbDbYD1P8lPmKXkdo1isljG1pvGa8+iaoB+cxMXScbvs9cKPjZaBOElCsoYmbqFrRZsatCVjNPPnhLgGyEX4gXrmEX4uq3ndAQgMrhvqehXtumV7BRhduJNr9igRmgwV5i2cKC/RB71iBQZd1ELb4bdlk0Sv2KyvjduFh+BBozVzoxN6pYQtjpt1L01EYCZHbSX4rSeha7ra867zRHY/f2PcWXVueT0YWYV1E+4+jxTzvyVvEVCW5lTe5YeQ+sgoAePDw1v7dhD2f+nDgKaXu96uDkbSJovMQsghwj3jXqLq5YHBqTRMUJuvSxYMprKgMinx3PiRMlCGa6YStr7VzDen8EglB6gX15fHoxCVwivkEqGoaeAwYOTiFU50IDHtwl6xXC93b7kDLbXFDtIlRvoTTJCOVHchMw9bdiPy0cxDnWPYtX+zGhhq/3iexW9g2r3zk4FbTGZ8Mg315flu7evv6/SM/DKf00re7i0QlNuTR0xtFblqYrRP3Dio1CYl/jQeIZK3aVK6PsFVyt5Jf6QiLoyMwkIlHqJEJ5tBJSbaxv5D4Jd1NVphzdxAGERUDm7l5i4nlHnPXh9quMtw9nlVQBiin6anhXC522bVdHVqMluczE+dNbbmNcp+vmdZCqHdazV6mB9i7yCjy5MyGsQYQpBiNOCfBNRERMDfeOJ8rb5TFyRsrKpvugc18RSMtWdFCTsncd4zn8c3K0+G+NoiJT2voROnZ3o9h9ANu66xdwxOB0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYUPR06MB6217.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(42112799006)(366016)(1800799024)(38070700021)(56012099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?ZENwNXFsOU85aU1CdnVEOXEwb3pRbWJJWEVYajBTQVJjbmZuYkxNUTRkZzUr?=
 =?gb2312?B?ZG9HTzF0aDVJclJyemZTSjlRSkp2NVNFUkUzU1VtRVJSNGU2eVRlTHdGeHJz?=
 =?gb2312?B?T2tCK2NvZ1pSNUE1TW02dDEwLzYwbURKZDRoeVEzMlFIb0c0d1RIS3hROW55?=
 =?gb2312?B?alYxVGtKTWRuZGtoa0NNeWNDQTBJM0ZPZUk3Q29FbzJlTVNMeG9IUmUwQU1v?=
 =?gb2312?B?NzlTbXNER2JOUUR0WEd6M1lhTlBLOXR1NUlwVE5VMHYzQXk0Rm1JMzlNTjVY?=
 =?gb2312?B?TFZDcGdsT0hTT2NjRjZXKzgwb0tjWnRKWTYydXQrTGd6ZVJNaFJFenYzeisy?=
 =?gb2312?B?SERUSUdEMS9sdWlFTlZOa0pPSFJjdERYS0VKNFFBYXF0WmxMWjBBZExPK3pl?=
 =?gb2312?B?NXNMZjdaOElZMWFaRmV4ODlFVy9oR24rUG1waTJHQzdCL1U0UWJaRjBCeFhz?=
 =?gb2312?B?VFBPR1IzdWJpbC9kajM3M1YzdXF6MklGTHJMeUpmbVBVSzRxeHVLR1NrSGYx?=
 =?gb2312?B?OUcvaUxWN25DT24yaEY1dEs3WE0vMUtsWi83WmxTVVlQQit2UjVSR2VUQ3Jy?=
 =?gb2312?B?Vnp0M21MSHEwL295Zi9YbzlkZWJCSDkzUVlYc2RXa3c0dnJudG9FOTlRV3Z0?=
 =?gb2312?B?WFlyUlE5bk5NRnVQUTRJcVArdVM5Z2NjZnFDaVBtQ3Yydk1XbStjOEZRSTFr?=
 =?gb2312?B?YTBXRWVNSkxVVW5Nd0xLM0FCMkFSTFNKRWRHV0hGT0FjVkloV0RTcTBsMU1Z?=
 =?gb2312?B?blNONURaM3pMMEJoTkNuMTQ1c1pxb2lackN5dXRKdUtrQ21NdHQwZndsUFZs?=
 =?gb2312?B?U09wYXNvc2w4NGJYcDNydTJpM2paQW9HVFBLR2IzekVpL2ppOWNSTWJ4MFFI?=
 =?gb2312?B?cVhycjVWbUtvNTJLU1FGaUZUcGxvaSt3MXNNQ2lCVmZlMWRGb0Y0OGpTelAr?=
 =?gb2312?B?a2QvbzlGWkxCSXlyTGZzV2g3VzdKUUFSWDJPcXJwTEdNMFZxN3lXa2R1MERH?=
 =?gb2312?B?MkoySis3ZDVXdlhMLzRzQUtuS3l5UE9QSXgwWkhwZ1BZS1JVUHJ6ekVaS3RZ?=
 =?gb2312?B?b2tWeG1LaThJdjlOODZiOHI5ZmRwNm5hVzFBNTZINzhWQnZZc1hVR1dwbzd5?=
 =?gb2312?B?TTB1N1ppSm9rdXpCd0VzbVhaeUQ4S2JwcXo2WlRHdXVGc2EvTE9LZXNNV0FR?=
 =?gb2312?B?Y2V6SGd6MHVLbk5WWVo3YVY4Sk9FUmZBWitra2pGa1d3Slo2R1dSTkN6alNU?=
 =?gb2312?B?aGpXeE9FMW12cWorZnRTSFVUQXVneU9NVUowYmlSdGhiNTVITkxQWENFN2xJ?=
 =?gb2312?B?dmVZNHorcm5PU1RSaVFuL2J1T3dTWE5lWFZPbTRPVGh6eUNwWWdVanlrbjFn?=
 =?gb2312?B?ZURpd2R4RndGWGRlbldycVQybGZqdk9LeDZza2s2b3J4S1V1cTZ5S2JlbG1H?=
 =?gb2312?B?OFNJM3IxQWZITXhsNEtsNE84eWlnL2pWUWpWTEVHKzl3eXpINzlsVlhlSGV5?=
 =?gb2312?B?U1JRWmlRLytjSk5JMDJVMDNlamlQODdzWTYxeERjWFhlc3hKWUdGN2R1NkNX?=
 =?gb2312?B?OEtaUjIxdm9rWTZKdzVVR3FCWC9wSld4MzZBSWRqaDFVd2xXdWRjejVuajhY?=
 =?gb2312?B?Mnk4R2QxWHJScEZEZ1ZXTnBCTVRwYXlvTGFHSDRIVTFRbDhZNno5azRNdm5r?=
 =?gb2312?B?ZlVOYUNGRFdQek9VOXFKbTBlcGkxS2tVUVovS1lLUis0amFTaVp6TmtFbHZE?=
 =?gb2312?B?cVlnbHAyL2dxNGlUTUZ0em5QZVFlcGhiWVBkOFJTblpGbjNqVXpqbUdHNDk3?=
 =?gb2312?B?aGJIaDV1SnN6RnNBenFzNXpnWFVWbndEKzBrbVM3a3pVd0N4ck9BNTRJV3FI?=
 =?gb2312?B?K2s5cXp5YWQrTFZYaHlvL2FIVmhlOW4zVER6UVh0N3I3eExBTjZDaW5XaDIx?=
 =?gb2312?B?MGQzY3F4M2N6OHpwZncrQXU0NENmcFcrVDdQemEwZjNsRjJrU1gxNDg1Z1c0?=
 =?gb2312?B?TTUwdjdabUJTNTZFNi9pT1V4YUovdUJ1R01KalFHWkJlNDV1YzJBaXNvTWNL?=
 =?gb2312?B?aU9Qak1kd1NsQ2YxYjFjUmpKeTdCeUt0T1g0NlRlendmRzBzU0YxU0J5VmxM?=
 =?gb2312?B?Y001MWxEK3Q1ZkE0Vy9YaVpBRitMdG9iNVVOdExuZ0lYdUVjbWdPbFpEdnRw?=
 =?gb2312?B?UTVOUE1QNlcrMW9PK3pqVlhhQllOTjB0TnVoWjRSTHY3d1RJZHV0czZBREFJ?=
 =?gb2312?Q?EjqL0gVyPkgCyxvGEXPBAhy+9ajxmUQFpZztJkM4Jw=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e2bd5336-c453-45b6-021d-08de96110517
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2026 08:21:37.7160
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UhU7vVSslNCMcLlya3CvZDJtT/gen9Ne+vq55rgC8328LZ60mjXX69R6my4Cd3v9UA/iHmpjmVHRShHB1hCyZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5797

U2V0dGluZyB1cCB0aGUgaW50ZXJmYWNlIHdoZW4gc3VzcGVuZGVkL3Jlc3VtZWluZyBmYWlsIG9u
IHRoaXMgY2FyZC4NCkFkZGluZyBhIHJlc2V0IGFuZCBkZWxheSBxdWlyayB3aWxsIGVsaW1pbmF0
ZSB0aGlzIHByb2JsZW0uDQoNCnVzYiAxLTE6IG5ldyBmdWxsLXNwZWVkIFVTQiBkZXZpY2UgbnVt
YmVyIDIgdXNpbmcgeGhjaS1oY2QNCnVzYiAxLTE6IE5ldyBVU0IgZGV2aWNlIGZvdW5kLCBpZFZl
bmRvcj0xMmQxLCBpZFByb2R1Y3Q9M2EwNw0KdXNiIDEtMTogTmV3IFVTQiBkZXZpY2Ugc3RyaW5n
czogTWZyPTEsIFByb2R1Y3Q9MiwgU2VyaWFsTnVtYmVyPTMNCnVzYiAxLTE6IFByb2R1Y3Q6IEhV
QVdFSSBVU0ItQyBIRUFEU0VUDQp1c2IgMS0xOiBNYW51ZmFjdHVyZXI6IGJlc3RlY2huaWMNCnVz
YiAxLTE6IFNlcmlhbE51bWJlcjogMDI5NkMxMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDANCg0KU2ln
bmVkLW9mZi1ieTogTGlhbnFpbiBIdSA8aHVsaWFucWluQHZpdm8uY29tPg0KLS0tDQogc291bmQv
dXNiL3F1aXJrcy5jIHwgNSArKystLQ0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9zb3VuZC91c2IvcXVpcmtzLmMgYi9zb3Vu
ZC91c2IvcXVpcmtzLmMNCmluZGV4IDRjZmEyNGMwNmZjZC4uZDNhNjk5OTVjMWFkIDEwMDY0NA0K
LS0tIGEvc291bmQvdXNiL3F1aXJrcy5jDQorKysgYi9zb3VuZC91c2IvcXVpcmtzLmMNCkBAIC0y
MjkxLDggKzIyOTEsOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHVzYl9hdWRpb19xdWlya19mbGFn
c190YWJsZSBxdWlya19mbGFnc190YWJsZVtdID0gew0KIAkJICAgUVVJUktfRkxBR19NSVhFUl9Q
TEFZQkFDS19NSU5fTVVURSksDQogCURFVklDRV9GTEcoMHgxMTAxLCAweDAwMDMsIC8qIEF1ZGlv
ZW5naW5lIEQxICovDQogCQkgICBRVUlSS19GTEFHX0dFVF9TQU1QTEVfUkFURSksDQotCURFVklD
RV9GTEcoMHgxMmQxLCAweDNhMDcsIC8qIEh1YXdlaSBUZWNobm9sb2dpZXMgQ28uLCBMdGQuICov
DQotCQkgICBRVUlSS19GTEFHX01JWEVSX1BMQVlCQUNLX01JTl9NVVRFIHwgUVVJUktfRkxBR19N
SVhFUl9DQVBUVVJFX01JTl9NVVRFKSwNCisJREVWSUNFX0ZMRygweDEyZDEsIDB4M2EwNywgLyog
SFVBV0VJIFVTQi1DIEhFQURTRVQgKi8NCisJCSAgIFFVSVJLX0ZMQUdfTUlYRVJfUExBWUJBQ0tf
TUlOX01VVEUgfCBRVUlSS19GTEFHX01JWEVSX0NBUFRVUkVfTUlOX01VVEUgfA0KKwkJICAgUVVJ
UktfRkxBR19GT1JDRV9JRkFDRV9SRVNFVCB8IFFVSVJLX0ZMQUdfSUZBQ0VfREVMQVkpLA0KIAlE
RVZJQ0VfRkxHKDB4MTIyNCwgMHgyYTI1LCAvKiBKaWVsaSBUZWNobm9sb2d5IFVTQiBQSFkgMi4w
ICovDQogCQkgICBRVUlSS19GTEFHX0dFVF9TQU1QTEVfUkFURSB8IFFVSVJLX0ZMQUdfTUlDX1JF
U18xNiksDQogCURFVklDRV9GTEcoMHgxMzk1LCAweDc0MGEsIC8qIFNlbm5oZWlzZXIgREVDVCAq
Lw0KLS0gDQoyLjM5LjANCg0K
