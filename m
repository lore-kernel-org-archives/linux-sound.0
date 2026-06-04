Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11013063.outbound.protection.outlook.com [40.107.44.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0657F423A64;
	Thu,  4 Jun 2026 12:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780576839; cv=fail; b=to4DjTY0MNNQODWbx2CFedh88CUXcr0hl0/lKz4geoShe+FuHflsIjBsminGkWoWEijHDU+iKaIp8WUJuq2jkhg927dPZ7lWDo84rrGOhYksBxnylXVY1AeFsyitDfn1tkkSJBoJnewzwUF1W5Y7Pp1OUJ0LKZ2MQhFWBzjN3EY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780576839; c=relaxed/simple;
	bh=kYMjDse/nCg62+Jbui//nDHqqKPQOCa7MxRcEdoHSCY=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Qu1AjGh4BtHzEhJDlJJ13tCqU8Dz1JNgmiJ/PdahwBSGjSINCZNrwtpYdSLzP8FXB4k0AdmJsHfwt8CWL0sfe1X1SEkj2vX/SZc960rR7JI8DablZ6tQMeAqkjqkyzWX4rO71sLX+8e5COC3gtBD6SWkRlr3zd65f1oeh1N8ktc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=W26ilhgo; arc=fail smtp.client-ip=40.107.44.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="W26ilhgo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cLWQwQjpJQY6YI4768oqm/oMzNoi4tK1Djn7jSsFCNP3JGskN4qRpOBa4omqkNkEG8tbtCu0IQQuNk/ZSmACSKkHPncGfcJ6kp5l+kwTPmxAXiTohxNZqE18VRhRDYJ71/NvxU481qdQa57EPIXwTxGnrn+fLt79Z0lzrfFkjWbKD9v64eteWfmgnm6ol/6m2Ma3bYiQkv7ynLWdu0JuidulRWA33sQYdVLw6SwQkNqr9S0k3mYRCiYqFxOqFLqcqqc9cQaLAJ6wHDmkaXWAXiPFJAx/p+Td2Dv+GcJhsms60BuCl00Fc/m+dw6isbpKwwFGAV34gfFfNUq1D56vkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kYMjDse/nCg62+Jbui//nDHqqKPQOCa7MxRcEdoHSCY=;
 b=dDUUVdbNkPy9DkjC0dotHitn6rzTahGoHjAA5DkL1fvXPrKqXmTDDLUsTF1tAriUz4pbkFKKj+9yAPo/IAHNaTJVEzIjoBCnzF3hgG+JM1jVP5dcFDQHjU3sCo9GcwHgzhJH8a7SkPloXFUrkj6E4Kvz3lixTQPvx/h6XaZJ7lwnzQkQZDEyfiXazOhYr2IV6iNMLw1Up0VnGwGH9KRZp6MynW5VgYj+t4HVZIudsKEqK92lO4AGkQm3mBcqS0PwdS0QZjg6+g7xYw9y6dH7QsUIMpiy1Q0DNlAAfXWLoKp9veq3Ipgy2hQL4oy2MxJrnNI25OfYGX0GK11Rr1MjSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kYMjDse/nCg62+Jbui//nDHqqKPQOCa7MxRcEdoHSCY=;
 b=W26ilhgooOphVQ28YkogaowB4uTwRzkJPbcW5ijsa8uvyJQrQrBgUrVBIBiggXqEwbuV2wRJ2Oz/hkzjUvd80mRI7pb9G0DPUIzFlzpwHFsIqgbnM8ck4mfr2QYYxJBZTS0gOPtrwn+dj9NcKooBwutryYk9i8/mjALVXXPwPoN69zvcH2yMCFECryHh0tWDfFugNfMR1r6HnChBaIdBf2TLQxhSOLu+vlomXLVfLrT4wbMvmuuXzcsRa8Ol0LF9M/8zaMq7p8pvvhisa1mB8SLnuk/goWP1wP48SYLS+43jqwvV6my2KHjbk8GmmT0Tbo3jimwOqr/jPjLM3JaTkQ==
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com (2603:1096:400:358::7)
 by SE1PPF1BDA05984.apcprd06.prod.outlook.com (2603:1096:108:1::40c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Thu, 4 Jun 2026
 12:40:28 +0000
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc]) by TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc%6]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 12:40:28 +0000
From: =?gb2312?B?uvrBrMfa?= <hulianqin@vivo.com>
To: "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
	Cryolitia PukNgae <cryolitia@uniontech.com>, "pav@iki.fi" <pav@iki.fi>
CC: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] ALSA: usb-audio: Add iface reset and delay quirk for AB13X
 USB Audio
Thread-Topic: [PATCH] ALSA: usb-audio: Add iface reset and delay quirk for
 AB13X USB Audio
Thread-Index: Adz0HceNhQZA5/zLRe+Mb2csh8WybA==
Date: Thu, 4 Jun 2026 12:40:28 +0000
Message-ID:
 <TYUPR06MB62174610061C213260E1A992D2102@TYUPR06MB6217.apcprd06.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYUPR06MB6217:EE_|SE1PPF1BDA05984:EE_
x-ms-office365-filtering-correlation-id: ab0b7b7e-81a9-43ce-5b36-08dec2367529
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|42112799006|366016|38070700021|11063799006|18002099003|56012099006;
x-microsoft-antispam-message-info:
 hH7na5ER9JlIsbAEDt0zniDm4/CcSkzwOJhQ7anQT5beWvt1Kp1Yuoq+v8mzmlUkjdd4rnTXvkVVkn9HJTPHIpCN2rocUPoXXOUMSIE4u+Kx/n59SN6TrSToiQwoUObMuYUz3U0LYF4PTJeuAETSojA1Cr0+3b4b8UpM10/wft723e17/dlD3wERIQhS2H9C7fykAbIiHNRWdROQ25Wh6a5HlCviof9v5LobAKN0nLHZwTtNyfdWgUbUWlVdI1PvlPMOwa+9hcmL1yCmwMoTJqwXGYUJEKfWfLeDXuiO3sUF/gItY+v4KCm4CStYHZQeBQOrHnJtswD3UpMQBc0562nG0kg+cFsMNoqvoKqNeRz7N9OokM8VtT74J1qJHAYki8fClKy1rZHXZHmCadLpXKX6w9loPoN0J6aatsaB+qgfohjJHrQoGxxGj+qGigVmJdY8+83xWWw2ChpaqY9Rt4a88auxIBsftCMYIEPP16q2Q5GbbVJU1aDHn4Bo4gyg+6OmXz45aXbUcEihRGc+YZ3zB7UdbNErcbEo5jE5floLuU/s7vwAvudbYjnlkvmGn17EmYjUU9pdY9fiSnC16rQXDnj1fDP9BACczx/yZgg1Td6rKKoKNbYDqeQbahlH+IC2LOd7wFJrdiXZLOcRs5fkyAErIyUiRFhgtWyEnyhFrbfZZ4BN4+5Vr7B4nDvW//Yg5c4rvkd8BUR5j1ewH2Tq3dIRhxro22riMlgUkywnFz/aSfh9WUlL371EfCPo
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYUPR06MB6217.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(42112799006)(366016)(38070700021)(11063799006)(18002099003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?cEovNmFKUURrdjZTTGUxSTUwMUtMTUNhQUhTbDk2YVozM2ptTHRpZ2FmdW9U?=
 =?gb2312?B?MFcrS1NHR2ZWdHBFTitadjQ4OTJrRFpwMXByNXpWNUI3Q1FIOGJZNHM0alVU?=
 =?gb2312?B?MllnRG44OXF5Y2swdGxLUVYyWFd5TkRhTS83Y1B0TmNpN3ZDZ0pIV0djQ3Vv?=
 =?gb2312?B?UGlpMk04eSt6Y1ZlendWVXlVMTJ3Q09CZ1B5VGpUSTBZcEJpTzdBeTJxeTF5?=
 =?gb2312?B?RnpSS0VEOTg0My9EUVphcFpWQlZQWnFvSklHcFEvaHdZL0ZHVVp2TTdmRXlD?=
 =?gb2312?B?QjJQRTEyUHduQXV0Y3JzbE93aEhtcmFkWHB2MDFIOFFnWXdQdlpNVHZEaW0w?=
 =?gb2312?B?Umg5Nms4bERtU09jckV0dzZmbkRaSEQrVWE0L1lWM2RLb2RTWEprYk43Z1ZF?=
 =?gb2312?B?WmQ5d1ZmUTVsR29PekRoMlZueFlRd2oyYWZoV3NZNElVR0Jya3cxZWVQOXU5?=
 =?gb2312?B?VUtVeDdnVldNSWdEMitsOG5Bbll1SUZORGx4Q0QwSFg5RWV1Y2xOTWQzS1lF?=
 =?gb2312?B?MWxxRXhvU28yRVRPc3JJVVRiR2ZWK2UrWG85TllkV09PcmlseWk2bXFxQ0lZ?=
 =?gb2312?B?aW9IWG1HWFcwMGlvb0VHSVVxYlRBUlNkMm9hWHE1Z3VxQkFTTGRxL25IVmRT?=
 =?gb2312?B?Z2oyNnR0TTlsbDE0S3QyQndrMVJCUGhZSmhPNUhab2FET0FpZnIwYTJ5blVJ?=
 =?gb2312?B?M1dhY041MTlZSC9zSVc4a1l3SHFBTTZPMks1NElXazluakwwRENtOVlmRXpr?=
 =?gb2312?B?UHYybmZ3eW9ZR2pCeS9nY3J1NW01aE5kRnhxYzVReW5FMCtNbVBISGFGcm9y?=
 =?gb2312?B?YnZLTXBrKys2cVc3OS9acEhEeVg3RmZTQlNKYmp2aXkwRVV5YzlmbnlJYUlM?=
 =?gb2312?B?SjV0ajBwZys1TUdNZDhEQmJkRWc3eTU4L0RydG9DOE9nSkZNNloxcm05bEpz?=
 =?gb2312?B?WUFyYkJYaHNuZm9YajNjc2ZuN0tEKzN4alNVbmMxMEZjdUQ1cm5oeTBSWkdF?=
 =?gb2312?B?dHRXZHh6QWs0Z25TNnh1SGQyVXhnM2FUekdmRzlHS1RPZkVWRUxQc3MzMkI4?=
 =?gb2312?B?U3RxMGR2UDBTREFLZWtLNGUzTXRUb0J3N0FkdTk2L09uaTFpcm4zVUNWeTZO?=
 =?gb2312?B?clFmeXM5TTd6dFB0c1AvTG1kYUlZWU5Nejc2UnZ3dFFheWIvSUNQZFJBZDZj?=
 =?gb2312?B?N2RmUTkvdEY1a2FaeTVONGRNSDlXNVUvMytHR1k1U0c0d1lyRW9TOFRRT25p?=
 =?gb2312?B?TzRlU2ZPblFlVUNhUkhrOWNpejNlV2N0bGI0Q3Y5SklDaFZtMTBKR1BGNUdi?=
 =?gb2312?B?b2Vkdmk5blNYYlVER3E0M3E4UVdZYUFZM1lVSldDNnc4ZU0zNmxWUWhDdmZF?=
 =?gb2312?B?MnVMcFVNQzh4TmdzaE9PVTlvNmI2SkhoZ1k5UWNqQXFHS3JJdHR2M3V3cTFz?=
 =?gb2312?B?WjJWM2VkOFdrRTB4NDBsQlBSKzBPOXNrcmNRTWNEYmp1RnhLMEc4VGgvOFl6?=
 =?gb2312?B?WEwzYkdtL3I5M2x5R09MaVc3STgxWWRNdnFuUEFxcUpJN1hMQUZrT2hKQjNo?=
 =?gb2312?B?S3kwSkZDY3MxajdMMS9XYjJNMi9jUDNpMHFTTnc2Ly9VTUFEak9tcFBTY2Fj?=
 =?gb2312?B?eVNDRlgwYkxDYUxzVXVrR3NtTEFrV1dvZStoUnZUaDlDWE12Qmx5QzJYWHpx?=
 =?gb2312?B?cVk2bVpTdkJ6TFllSzNwL2JlMlJTSFk2WXRYeENiajdjdTFlcDBsa0NvNDVT?=
 =?gb2312?B?VVc5YlBaOUNPeXMvSVp4ekpTYnFjc3hTKzBoRXFxOER3Rm0yWkFSZHFJZGUx?=
 =?gb2312?B?WHhERGc2d1JXbFBXWTExbHBFdFMwU285SlExV3FHQnJLcGZZMWRkZC9WdjRP?=
 =?gb2312?B?R3EzQ01kMG1pSktpNWhPT3VPWDduTGJtWlZGcXBTYWtzcEtNWUdsMFNpaGlQ?=
 =?gb2312?B?VVViemR6ZUxLYmdtU3gyL0kvckhuU3NmVFdIbTF0NHJ1MjY5dFBaa1d3ZlZC?=
 =?gb2312?B?Nm15R1psT0hUMU5jeUsvRmhWbWRRT2x4UGJCUndYOHZDeVZSR3RLM2k4RHhQ?=
 =?gb2312?B?SVZWSTFCVmVMTVRobW1wWXRacWtkbjdhK0J4VWdPeVJIaDBIbWRTTm1vK3JX?=
 =?gb2312?B?YXNmbnMzUXJibVI5ZStmTXJHR01YZUlIa3dRZGwvUENaRjJvNTBOSW1hYzcy?=
 =?gb2312?B?YWFLTTVhRjNUS29pWHZuT0t3OGtPY3I0T2Y3UEZvU2piYnV4ZlhtdzVFMmpn?=
 =?gb2312?Q?UiXscB2Xe+ovLoGqUcv5xdQX3wEntTj2HTT2JDZRy0=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ab0b7b7e-81a9-43ce-5b36-08dec2367529
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2026 12:40:28.2555
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gL9zE8obNxT8Uwt+L3ycfvJBHH2xp7ZVYx+yZnBxwjW+fEUQB5wvz37AYChVxUYQSNSfn/D/Lm/NYNkBNNMlTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1PPF1BDA05984

U2V0dGluZyB1cCB0aGUgaW50ZXJmYWNlIHdoZW4gc3VzcGVuZGVkL3Jlc3VtZWluZyBmYWlsIG9u
IHRoaXMgY2FyZC4NCkFkZGluZyBhIHJlc2V0IGFuZCBkZWxheSBxdWlyayB3aWxsIGVsaW1pbmF0
ZSB0aGlzIHByb2JsZW0uDQoNCnVzYiAxLTE6IG5ldyBmdWxsLXNwZWVkIFVTQiBkZXZpY2UgbnVt
YmVyIDIgdXNpbmcgeGhjaS1oY2QNCnVzYiAxLTE6IE5ldyBVU0IgZGV2aWNlIGZvdW5kLCBpZFZl
bmRvcj0zYzIwLCBpZFByb2R1Y3Q9M2QyMQ0KdXNiIDEtMTogTmV3IFVTQiBkZXZpY2Ugc3RyaW5n
czogTWZyPTEsIFByb2R1Y3Q9MiwgU2VyaWFsTnVtYmVyPTMNCnVzYiAxLTE6IFByb2R1Y3Q6IEFC
MTNYIFVTQiBBdWRpbw0KdXNiIDEtMTogTWFudWZhY3R1cmVyOiBHZW5lcmljDQp1c2IgMS0xOiBT
ZXJpYWxOdW1iZXI6IDIwMjEwNzI2OTA1OTI2DQoNClNpZ25lZC1vZmYtYnk6IExpYW5xaW4gSHUg
PGh1bGlhbnFpbkB2aXZvLmNvbT4NCi0tLQ0KIHNvdW5kL3VzYi9xdWlya3MuYyB8IDIgKysNCiAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS9zb3VuZC91c2Iv
cXVpcmtzLmMgYi9zb3VuZC91c2IvcXVpcmtzLmMNCmluZGV4IDNkMWIzNTIzYjAyMC4uZjRlODg1
Zjk2ZTgzIDEwMDY0NA0KLS0tIGEvc291bmQvdXNiL3F1aXJrcy5jDQorKysgYi9zb3VuZC91c2Iv
cXVpcmtzLmMNCkBAIC0yNDg3LDYgKzI0ODcsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHVzYl9h
dWRpb19xdWlya19mbGFnc190YWJsZSBxdWlya19mbGFnc190YWJsZVtdID0gew0KIAkJICAgUVVJ
UktfRkxBR19NSVhFUl9QTEFZQkFDS19NSU5fTVVURSksDQogCURFVklDRV9GTEcoMHgzNDQzLCAw
eDkzMGQsIC8qIE5leGlHbyBOOTMwVyA2MGZwcyBXZWJjYW0gKi8NCiAJCSAgIFFVSVJLX0ZMQUdf
R0VUX1NBTVBMRV9SQVRFIHwgUVVJUktfRkxBR19NSUNfUkVTXzE2KSwNCisJREVWSUNFX0ZMRygw
eDNjMjAsIDB4M2QyMSwgLyogQUIxM1ggVVNCIEF1ZGlvICovDQorCQkgICBRVUlSS19GTEFHX0ZP
UkNFX0lGQUNFX1JFU0VUIHwgUVVJUktfRkxBR19JRkFDRV9ERUxBWSksDQogCURFVklDRV9GTEco
MHg0MTNjLCAweGE1MDYsIC8qIERlbGwgQUU1MTUgc291bmQgYmFyICovDQogCQkgICBRVUlSS19G
TEFHX0dFVF9TQU1QTEVfUkFURSksDQogCURFVklDRV9GTEcoMHg1MzRkLCAweDAwMjEsIC8qIE1h
Y3JvU2lsaWNvbiBNUzIxMDAvTVMyMTA2ICovDQotLSANCjIuMzkuMA0KDQo=
