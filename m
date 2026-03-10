Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11012028.outbound.protection.outlook.com [52.101.126.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D89347BC6;
	Tue, 10 Mar 2026 08:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773131615; cv=fail; b=JVdOt9oUrUTPxZWrZgK8Tqzo9gkx/x8q3V0ARASRKRnhYCqQmwj3jLBnD3XWYzapOE1he/BVOQyDmOtb9C04APzbkDxqf2I54L8C31Qu0qy5bWnqtjN8+djjbmzPdg02Udtdd5VEmV+4XV/baNjw3tKeeCwju4AOXqTW+BLGS+8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773131615; c=relaxed/simple;
	bh=sGUUPgO3cXcxniuWJWMksg5rDlBMMgk3YAuzo7BTL7k=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=AWsc6oGAPjZ3UM8JHHzIP5K/69BeGPw5mgymLTZ3/VtclyVzYobAcpd7ABK+r66G5FCiFAejRU63K7n+lJ84G/nHzCvHSmxW53sXUeZ1YQwiOGParxoR7l4WIAwJSI01SeQ4jkqyg/9qXSdS3gwtyqBHZGJbTKHyAQW3su5F1CY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=J37gn+E6; arc=fail smtp.client-ip=52.101.126.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="J37gn+E6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=meDg2POsUP5YrUgjP+Oka4/ve68/aJ/7UnB6RLwaFmlgO3a6upWTBria6FLmXazuxMGt/tJrTeOcZLBfsOsyC9l0eZTuMraDVOrv8dCOG6pNkhUMHiIPnMxttqDFrSn4U7MuELOlQXtz0eDgvjXZ0BMKBh7yq+Em7aWM1kwg8Ukh64ViZWNf73dT5+VD4MKJc/1e65oymvBgpIsNnjA+LZ2nenKlZZiqXTryTvEVSJcX8HQmK+ta32Zms6viqvcaMsyaBTj5zEWjbL1MJkVm7LYVwwdwCdvg5q+NQbbRXL38KD8YE1Jtt9IwE35fpstgMdXwoBWAtunXU1RbyVFvXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sGUUPgO3cXcxniuWJWMksg5rDlBMMgk3YAuzo7BTL7k=;
 b=xYtKmn7Dth014OoGhj97u6o50s1ydk3OdTjukHyYnymdyY3ybTeuw4W5nFAXJbjFercY2h7vmZRdGglKBgpxq/X+sINGQIMWGn1iCJMGNnyC5Nm3A6/VEXH9b3l1CikZNAaJ+segAheQKozTcqP2pSOvB7svI/HlJ19WxytTBLpWr7mRfIHnwkOtfn4Hg/bNSb2hVicz30We0T5UH/A2i+lDYp/8RTox2BcYia9RPXYpRIrSudxWPTJLrifd1eScRcQOkIMy56tLqZfTqJ2yQ1ovRG98xnOtGiLkv9FTkZalS1ThUujh735psnD0XAh3ziSTk45ABu+BzQSoFhkaAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sGUUPgO3cXcxniuWJWMksg5rDlBMMgk3YAuzo7BTL7k=;
 b=J37gn+E6yFbpiM9C4xBWKsBsDNNn308P9Lavwer+LynjHCUcV4BVSBek0AgYzEEpeCsl1ND+7z6wCDwXSY8dRfOZpodTdaX6bqA4iqPu4QmZpoTojnX7NmSv9bpTqZO3ceyGvEPTBdq08lIXhEIQvudI7MQQxJ0/V43VeR5sSVgIkXZaY3KL4lbTTqh2bSoEekjBUW/DcrVqKQEef+DMj3RaZ6G4DdNHfPSEugLcgJzJw4P5orsNdOOdpgOs/wn3m9NLTkPGf3LXhJbMO5HGePc4Hk3P+Q0i8KtOc7abm8phgtNeRhKIIN2qO4IlFj/5w8LG8XeAcAzt9ffEbbgLaw==
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com (2603:1096:400:358::7)
 by JH0PR06MB6739.apcprd06.prod.outlook.com (2603:1096:990:35::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Tue, 10 Mar
 2026 08:33:30 +0000
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc]) by TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc%4]) with mapi id 15.20.9678.024; Tue, 10 Mar 2026
 08:33:30 +0000
From: =?gb2312?B?uvrBrMfa?= <hulianqin@vivo.com>
To: "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
	Cryolitia PukNgae <cryolitia@uniontech.com>, "pav@iki.fi" <pav@iki.fi>,
	"jussi@sonarnerd.net" <jussi@sonarnerd.net>, "roy.vegard.ovesen@gmail.com"
	<roy.vegard.ovesen@gmail.com>, =?gb2312?B?uvrBrMfa?= <hulianqin@vivo.com>
CC: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] ALSA: usb-audio: Add iface reset and delay quirk for USB
 Audio
Thread-Topic: [PATCH] ALSA: usb-audio: Add iface reset and delay quirk for USB
 Audio
Thread-Index: AdywaFToHR5joP9zS8+gtPHW1JGQSw==
Date: Tue, 10 Mar 2026 08:33:29 +0000
Message-ID:
 <TYUPR06MB62179ADCD1B86A7E0C73E53ED246A@TYUPR06MB6217.apcprd06.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYUPR06MB6217:EE_|JH0PR06MB6739:EE_
x-ms-office365-filtering-correlation-id: 0e1d6893-4437-4c96-d1d1-08de7e7fb55d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|42112799006|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 4ZeBZIPDTJUOhdJ2N2ynMuzI6ITg0mhoqNhkMZzNUgzscJ8B5voeaSIYHa9RqTyjIAXAaHMDAuX6O0raAIsTtOOh/Mpf/6MTbDOSaXsugYU7SxmIchGvMf07oQo6nN7Zq0K1w+l5ZVGBc/5DBRx+wxpYFL7y+4koypClVIQsY8bMLBneTbbzAC2caV/Ilc8a1mf35n8HdQX9daaqGhGnVZuRt6xGNNYSSmIKMvLau257vNW5uezNwry68qIBnFd5wWaFZhKDYJO+bMW/SiamAeI7RzcM+LXzmWuhYZSs9fd72808fB2owc0NQsxIaIoEl8sGbb0NhzYpaTHUG+VEWG9znMJ2XDvA+W1LF6vIKlwUNx7lig8YGimCA9iwuAlm1HGKKYM44p22653+iPw4jHmea+e7fNRnaAm7KIaPqNeU3LhDSkdKqK8grRA1zP8lWbUaBiPNjfYcfyeLv0EKckUqgTQOQ+FwM6x8pXXysoZu8EKMs/9lKaNeOpi50td5Q9j47x599fJ7jT23wwEvKIG/ULFaIUd8CQit7JHEcbUDqog0v0kQCKz0GhxmP2I7TWG+Sah3DEElrI9Ba3p1W6YK9DnmOe0V5v46FFuVCNOuT419fxR3gQElsxafjzTo8pjnH+L42+O6wjLwf3yOhFI61T25dnvb2l23ln+TYVmgycPPA5MORdTsNKfKlWUJ8h+GGKthNwqu/5Z/s3psaE5lOyOhU0HIITY2A5f23+Nh04slAUmtgtyTlYkU1W+n3xllGTsDwj452d+MoaT03wMNEo8GptW7UW7yLrxWQus=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYUPR06MB6217.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(42112799006)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?dlVyV3BIZzVRbmhhWnJDYXBQT3BSUm44cjVzM2FybDRjS3VGWGs3SUFzS2Rr?=
 =?gb2312?B?b05IanBDeGhnQ2p4TTlieUpsOC9EY3lzVnNxL1dVZ3lLQXcvcDBmZ1F2ZWRC?=
 =?gb2312?B?NnBHbVM1MTVrdVRDdU9jQU9vS0QvclVuTlJPUUlHcUlVZTNvUytTanNjNVJL?=
 =?gb2312?B?aGtQbi9rV0dSUEs1MGl6SGI4TG4weFdUR0tsSnpnam9SQkZVZURnbld0VG05?=
 =?gb2312?B?b1hBMnJxN0NUeHpSR3RzZS9TUENuQU96cC96S2tSZEZtSVc4enhRY2dGNUJp?=
 =?gb2312?B?VThxTkhIK1l2a09wL1dBcTh6MGpEbFlHa3NON09ob2pZeTl0Wk1wMjJraVpK?=
 =?gb2312?B?NFVwUTNTWXY2K0dmRFNzdlJRTHVzb29lTXZ6WFBUam5VMFlKZ1F4S0pBU3NU?=
 =?gb2312?B?UHc4RFhjTS83V2lsQnIwRTNyV1dVQVZsVmRuSWJPWFc0MTBuZE5rRVhVQktJ?=
 =?gb2312?B?cDZMU2J2ZUd5aDd6QS9XRCt1TjI2OE5PMldxUmx5UWRjNVMvU0lLQWlBamtG?=
 =?gb2312?B?YmV2dXhUTkREWVNVWXhzWmRJbmJPb1k2dEtVMU8yMktXZC9wVHpYL05Jd0JF?=
 =?gb2312?B?WTBlSmZVQXBRNnNDdWh3K25QajY0RnZlMXdOTm1jVldtdmtXb2ZVQVM0MVJs?=
 =?gb2312?B?Q3hOK2FvaXNZSk0vMHg2Y0hOaEFXTUNjNkRZekVmVU9MRFN4WS8zMXRXckhx?=
 =?gb2312?B?czU5c2ZScDM0VFVTV0ZJeE5LS1h6azduYldCZnVabm83azdzWmQzLzZyWnBH?=
 =?gb2312?B?Z2JBRStBNy9XUkF4RWNWbTVLZ1loMkFXbWVUdFFZNjA3WldrMkxTOEZKUGZ4?=
 =?gb2312?B?dVFKaHZuRXprZXd3bEwwbDlkNVVLOG16RWpxY1dDM1VDdG1VVGhacW9IRlhz?=
 =?gb2312?B?ZERpZUlNZ1kyaHFVQWwrYlF4cHQyWWhDVGRLUDhLRzFDZkpXWXBwMXJDU3kz?=
 =?gb2312?B?TWZoQTk0SDdKUHNYUnVlYWlNREpqQXRvcTAxWU9TbjQ3bzNLQUlEcWcra3JG?=
 =?gb2312?B?Zm9rb2VuU2NUS2NNaXMweVV4ZHdxNXVkVUE0VHB1T0g3cDFkUGw1UlhGKzIz?=
 =?gb2312?B?QUY5WVN4cXpmalFCZUo1Q1l4Q3pSWXRISjRHZ0xMdzJJcUd3UG9CSzVaMWtM?=
 =?gb2312?B?UzU1VVhabDZXMFlqOFZSdEQ3Y0J4RG1xUUMvcGFwZlhBNHd0Y2FZRzZ1OWZN?=
 =?gb2312?B?THU0MnJZMlZwSGZMcFZYWVUzUFZrVFhveTF1WW43Y1NmZEd1NHgwV1FQUWhK?=
 =?gb2312?B?KzhmbUlpdGpMTW9nSDFzekJvaU9HM0dLOUNvUXJYQUZud0FqaVd3bnQ2K2k5?=
 =?gb2312?B?cFNDQ0NQM0h3NGtyTjl3WXBHS3Vzc1ZzTDBVckZaLzVuZDliMGhYeFgwM25W?=
 =?gb2312?B?Y0FnL3liRkkrak5oRXppb2FjRFJhNlorZmgwa0tlRSsvVkdHdUowa3lZSGpa?=
 =?gb2312?B?c3gzTGhGRjBGOHJJdVhsYzJveHIxaW9HVW9aT2VLa3dtSXRsMDg0cFVyM1Bq?=
 =?gb2312?B?VGZzL0N2WXJtL0RSMjQ4N0lXeHJGRklQbmVFS1gxeUI0SzIyWEdrdTM3eXcr?=
 =?gb2312?B?UE9lRzB4VkxjMHpaMWNpYWFWQjN0T0phSlNGZ21IUFBvQXZ5TkgrVGxJTGlu?=
 =?gb2312?B?ZER5THBxeWhPNlFNNWtYS0VXbTN0YjhFVk1RUU9kUi9jUmlnSXo4L3k2M0Jl?=
 =?gb2312?B?R0RrRVJtNFRIczFTeCtwbjRpNDVVRnBWRENFNlFMR3FKNGdJdmdzN1ErM2Mv?=
 =?gb2312?B?RWdDWEliWjArT283ZCtWNVFsWmpXSDJ5RlBjRXZOa3ZmZG81Vi84WkZOeGhM?=
 =?gb2312?B?V1FESUx3cUk4bzl3VW5hazJrUXlyZ2pCOGVqTjFlQUhacUlIL3JPdlh4SzhR?=
 =?gb2312?B?MzVPbzNMaER2eFp1ckRpcWFmWmFMSjE0WkxqMkJHdnZic0VuaEc3SVd1VmhJ?=
 =?gb2312?B?VXVCM3FGYzMvVTA1aGVuUkpPQ2k5RzhFdC8xdlI4MVRjVzdqNTZHNDV1VjBs?=
 =?gb2312?B?ZkVNYzYxMzZJdXIvaTFxRFp0U25ISFFsTEI2NTJ2anRPZEJ6Nlhjd2txYW8y?=
 =?gb2312?B?bFIwMnc4TXlKRHpRakZnbzh3SUpqaGMyR2FYcG5Ta21DeG1RQi9NNDJXOWg3?=
 =?gb2312?B?K2JRNHp6ZkZ5cEswbHJnWWdSLzFHcVp6VnJxQTJvUUdnQkdkVXdFUDloKzRM?=
 =?gb2312?B?OEdUTG9rUkphTUtxN043UUtxdThycHB0MVNPU3BOR1liakZjNG50OGkyYTJF?=
 =?gb2312?Q?d+roWBBpkX/TL+HP+xrY94GJTRsdxmARk+8mT10vDE=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e1d6893-4437-4c96-d1d1-08de7e7fb55d
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2026 08:33:30.1461
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: whE/aK939ptw8RlzRm9VhOLu2/W4brWAsGCBxnAsjbNtMmLc0iBjwv2ecaIWucvDNH/yjqyoYtgoPoOqh6qYRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6739

U2V0dGluZyB1cCB0aGUgaW50ZXJmYWNlIHdoZW4gc3VzcGVuZGVkL3Jlc3VtZWluZyBmYWlsIG9u
IHRoaXMgY2FyZC4NCkFkZGluZyBhIHJlc2V0IGFuZCBkZWxheSBxdWlyayB3aWxsIGVsaW1pbmF0
ZSB0aGlzIHByb2JsZW0uDQoNCnVzYiAxLTE6IE5ldyBVU0IgZGV2aWNlIGZvdW5kLCBpZFZlbmRv
cj0wNjY2LCBpZFByb2R1Y3Q9MDg4MA0KdXNiIDEtMTogTmV3IFVTQiBkZXZpY2Ugc3RyaW5nczog
TWZyPTEsIFByb2R1Y3Q9MiwgU2VyaWFsTnVtYmVyPTMNCnVzYiAxLTE6IFByb2R1Y3Q6IFVTQiBB
dWRpbw0KdXNiIDEtMTogTWFudWZhY3R1cmVyOiBTUEFDRVRPVUNIDQp1c2IgMS0xOiBTZXJpYWxO
dW1iZXI6IDAwMDAwMDAwMA0KDQpTaWduZWQtb2ZmLWJ5OiBMaWFucWluIEh1IDxodWxpYW5xaW5A
dml2by5jb20+DQotLS0NCiBzb3VuZC91c2IvcXVpcmtzLmMgfCAyICsrDQogMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKQ0KDQpkaWZmIC0tZ2l0IGEvc291bmQvdXNiL3F1aXJrcy5jIGIv
c291bmQvdXNiL3F1aXJrcy5jDQppbmRleCBjNmE3OGVmYmNhYTMuLjMzNTJlMzUzOGExOSAxMDA2
NDQNCi0tLSBhL3NvdW5kL3VzYi9xdWlya3MuYw0KKysrIGIvc291bmQvdXNiL3F1aXJrcy5jDQpA
QCAtMjI0MSw2ICsyMjQxLDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCB1c2JfYXVkaW9fcXVpcmtf
ZmxhZ3NfdGFibGUgcXVpcmtfZmxhZ3NfdGFibGVbXSA9IHsNCiAJCSAgIFFVSVJLX0ZMQUdfSUZB
Q0VfREVMQVkgfCBRVUlSS19GTEFHX0ZPUkNFX0lGQUNFX1JFU0VUKSwNCiAJREVWSUNFX0ZMRygw
eDA2NjEsIDB4MDg4MywgLyogaUJhc3NvIERDMDQgVWx0cmEgKi8NCiAJCSAgIFFVSVJLX0ZMQUdf
RFNEX1JBVyksDQorCURFVklDRV9GTEcoMHgwNjY2LCAweDA4ODAsIC8qIFVTQiBBdWRpbyAqLw0K
KwkJICAgUVVJUktfRkxBR19GT1JDRV9JRkFDRV9SRVNFVCB8IFFVSVJLX0ZMQUdfSUZBQ0VfREVM
QVkpLA0KIAlERVZJQ0VfRkxHKDB4MDZmOCwgMHhiMDAwLCAvKiBIZXJjdWxlcyBESiBDb25zb2xl
IChXaW5kb3dzIEVkaXRpb24pICovDQogCQkgICBRVUlSS19GTEFHX0lHTk9SRV9DVExfRVJST1Ip
LA0KIAlERVZJQ0VfRkxHKDB4MDZmOCwgMHhkMDAyLCAvKiBIZXJjdWxlcyBESiBDb25zb2xlIChN
YWNpbnRvc2ggRWRpdGlvbikgKi8NCi0tIA0KMi4zOS4wDQoNCg==
