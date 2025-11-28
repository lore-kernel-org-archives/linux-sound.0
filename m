Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022129.outbound.protection.outlook.com [40.107.75.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2373002BA;
	Fri, 28 Nov 2025 09:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764323656; cv=fail; b=ShBg7c16WLAluwtKPU1aTNfjU0Us8JGHAf8kEaZCc915NL+qlIDC6e7O2GZnySEFXNS3DxiKQtyyZQu1dWlvgyNo0LjrSWsoFa/riPb/SGk1VjV884tC4QJARgUcZ2va4ya9dYkWTKDga0mUhEEabpFLT2cpFMP5xErdPJzHXy8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764323656; c=relaxed/simple;
	bh=MSoTXOdtsjTDoqlgfr5X1+0d0wPW9GtfOrdTCFFcINw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=k9sYP/sKPcLVzxD8UCMazallCThfbssJ3LnnnunuXVVYrFtxvcFy69MLRs85Ort+UCRoUHkDFDVsYKOdoE0IoMIH0/S+oYUTHLT08j8jQTSmRKQO7gA0K4eFi+Oy6Z6FvHD5dEQB3CCE6CwHxeuVoNhzmlI7PShu6Tq/eEDKlCo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M6UUVF7Atwdsevw5QRGFJEcn05JZDeMdNow77aXxyPV+JsScPOQsNYvVOdoxgfv8p6sZRsoe4G5iOxw9RJyNQzw9Us1PSHLQSBc6QlO9B10lA0a8kpFTzhhpXrKNUAldHqxhrUb6pqtqORzGpaF6Mx38/qcUqRTRKML13fQ7vd6xB6tv33/SSbDI5bV5xrhgD0a3Y6Pd59LLLND8tg3ZC0NDYtZw1QAwTyN5gH/V/Jl2AqC+NWgnSROPcEshbiQfnoQylxTC/nZzsR6BO9kKtpf3Jj+MiuzEoR9x/ioouPzps87YCzYu0gNn2VGASKSAvRK4FjDPebHI6H9gNnOQTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MSoTXOdtsjTDoqlgfr5X1+0d0wPW9GtfOrdTCFFcINw=;
 b=Ck6ieKy4F7AW0GATiS48P/C0JP5SSzOBrHVCkfcHXsbsRC4Z9+prcv23knEgX98TarsM4g4gjwzlxeUrPJNzXbyy53e1v5AE9yKieKtgESjIrJdfI8uSoq7H9RoGx3lTNw3Qist8VyorlGEzkwrEtAmNv0o783a+friKY/DEAifOzqK+IvcEssZny8c0qugGP5pHHVUyfQ5IoMX/t9QcbNA6NgOSPZF5utfc+SK3iFV7s18zT3wBprJ6T6NdoYuX2Oi37RQV/nd5KLCJd99kODowD7s3U7UmNS/rZFkhqcFPxvvhqwlGDC60h/pa8lUindissQ5wgCHz2TSFAtRLyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from SEYPR06MB6226.apcprd06.prod.outlook.com (2603:1096:101:df::13)
 by SEZPR06MB5344.apcprd06.prod.outlook.com (2603:1096:101:64::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.13; Fri, 28 Nov
 2025 09:54:04 +0000
Received: from SEYPR06MB6226.apcprd06.prod.outlook.com
 ([fe80::56e8:777c:d80e:d364]) by SEYPR06MB6226.apcprd06.prod.outlook.com
 ([fe80::56e8:777c:d80e:d364%5]) with mapi id 15.20.9366.009; Fri, 28 Nov 2025
 09:54:04 +0000
From: "Joakim  Zhang" <joakim.zhang@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "broonie@kernel.org"
	<broonie@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com"
	<tiwai@suse.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, cix-kernel-upstream
	<cix-kernel-upstream@cixtech.com>
Subject: RE: [PATCH v2 1/4] ASoC: dt-bindings: add CIX IPBLOQ HDA controller
 support
Thread-Topic: [PATCH v2 1/4] ASoC: dt-bindings: add CIX IPBLOQ HDA controller
 support
Thread-Index: AQHcX4I/rWYXEfmiWkK1OjlzuYyFLbUH03+AgAACkFA=
Date: Fri, 28 Nov 2025 09:54:04 +0000
Message-ID:
 <SEYPR06MB6226157DB7A5D5486500063A82DCA@SEYPR06MB6226.apcprd06.prod.outlook.com>
References: <20251127094301.4107982-1-joakim.zhang@cixtech.com>
 <20251127094301.4107982-2-joakim.zhang@cixtech.com>
 <20251128-fearless-kittiwake-from-arcadia-662dbc@kuoka>
In-Reply-To: <20251128-fearless-kittiwake-from-arcadia-662dbc@kuoka>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB6226:EE_|SEZPR06MB5344:EE_
x-ms-office365-filtering-correlation-id: 2e952ee3-81ee-4058-4177-08de2e64107a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?aGFkVWIvQUtHZ09pUmo1YXN0Z2p2Wm5FQzZnYmxlLzdOQkIyRHIvczRFYitz?=
 =?utf-8?B?Zk05UFpwSW9ETDl4dzdaenR0L2ltdS92QkRNN0ZINjF6WndkeVZ0aVE0UWhS?=
 =?utf-8?B?dkQyb3oybG01V1F2ekZacE9wQ1J0RU1LL0U1M3A4dU1JenozaWgzZUs4YUFp?=
 =?utf-8?B?a0sxUXJVd2tBUlQ5SXhYQzdPTXpSemppbUV6MEpVdzI4N25IRW5TMjFoSSt2?=
 =?utf-8?B?THRKQ3FEcUZ5OGJqWVYrcmpCRWhzbkFIRTc5OTcvbDFvK3lqcDRPWlArKzRz?=
 =?utf-8?B?OGNNZmdRWFNRQnNmQXRrQTQxaU44QmRYL0xNUm5hQ0JFYVYrZU00SS9EZ1J0?=
 =?utf-8?B?dTd3QXhRN2xvUlBtWnFNYytqMDV4UTZ2R0FTTGFUUWcyNmVMaEk4MXk5eUxD?=
 =?utf-8?B?ajBTTnREUmNka2lTRnRTdW5FUmUwN2g3NUZOUjcrbGpJb09DcXFMVWtxV0d3?=
 =?utf-8?B?YjZ0dXdwRlJSdVFkRjY1R0FtaHhsUVhSK3lCS1ZOVjE5dDh1SUZ6Yi8zanNs?=
 =?utf-8?B?dG1rZUJCZnJOVXVydER4SFVFUVVBR3ByOGVCdnFCK1lxU2lwQWZKN2t2Nlh0?=
 =?utf-8?B?TkxZZ3RTNXhuQ1JGTE1PQmtkZDNGdHMrd2RYT2VETG1wS2REWEVuUjBaVXp2?=
 =?utf-8?B?SE1KajcyQWtkTm14Q0xkREZtc1dYc29halljcGd3NFplVmNCV002U0dyRkNK?=
 =?utf-8?B?VFhaOXpaWUpSVTViSGRvUmR5S2Y2UDRnQmxvNjd6QUg1YUNwbU1yMlBTOWlm?=
 =?utf-8?B?S3VYeHFkbzU4RFlnWjQ1NEtLNkxlNzV2bVVYSGsxOUpSeWwxWlc1aDZMVk1q?=
 =?utf-8?B?VW12SVR4TUZLaW5TQml2U3h2c2hXbzVxRUhxNmlpa3FNZ3VyQW04L3BjeUcw?=
 =?utf-8?B?SUtWOWY5SWFYNFV0dW5QZmZIVTc5Z25CWUJtbVFOQ3Q4dEVqK3pZK0E0cXZD?=
 =?utf-8?B?Z3FRRGN5MUtWTERoQy93WlMrWERNZHlraXpQZ1dyMWw0UXlaSTBvRWNqY1pz?=
 =?utf-8?B?dEdmb2t1K2pvdWt2QmxtTHJHNXFod2F6OVlTdUVFZXZGOUxBTWU4dVRLVHNO?=
 =?utf-8?B?WmJ4UWYwV3BEVGxHeVI0WmpLclFRMnc0S3NUekxhdzl0N3hoVWw3aUZLQ1NT?=
 =?utf-8?B?ZVIrN1ViTDV2cHhZUUhIMm5ra2tjTWNhZTF3OWt1TXljcWxXM0ZGRSs4czJJ?=
 =?utf-8?B?bERGTlBocHlobG1uQXZDSnNWUXAzTm5oc2pDMEtOUjNSRElpOXJJamZxN3Zp?=
 =?utf-8?B?VjVoTlJ5Ly9kQUl6UG9YdDZ2cW0wS0pNbnFrWXdLMTVsa2t6TVFoQUdyS3li?=
 =?utf-8?B?djdjdFBYdmR5dmxZY002UnZPZXRrM0xFWFVaOGJXcnVOaW9tR0d5cTgrSHVq?=
 =?utf-8?B?ZXlaR0ZDM2NFQUFUWXN3a0tVcGc2a0cxTUNpeFo3MnJ3WHc1MXZPNHpVWHdh?=
 =?utf-8?B?VjN1enNBR29TM3QyVG1LR1F3dU5QMElUT0prSnlsUDhHTHRKcTJEa3dzSGpQ?=
 =?utf-8?B?TWIyOWhEaE9PbDVkSFU2RFFUN0pvd2lsTzBsUUhuUkRrN0FEK3NlMG1pZEtM?=
 =?utf-8?B?R291Q0FjbU93UXpNVlZlc2hUWXlCamZUZ1lvNjRZRktWZWJRb0tITjdiZzRJ?=
 =?utf-8?B?blFLRjJlRlBLa2JNQ291QUswdE1VMEdGRnBTTHlIRnhaZ3BoSkVoMDZ2WlVo?=
 =?utf-8?B?cit1OGhTbm85blBhY0xHNit6dzhJK0poU2MwT3VGb2ovZXlEb1VTd2FtL0tp?=
 =?utf-8?B?UFhISnFTb3JWMlFJWm95TWFWK3U0dWRLK0pKVHdsdW9ZdXZQTDlPNFkvK2Vz?=
 =?utf-8?B?aHFBelhLQzRDbzlsV29ib1V4TGFlVzBjRTFVS004R2NVZ2RSblozUFZ0cExY?=
 =?utf-8?B?d0E1WHR5U1NlN01McUd5SUtXZnQzdm85bGJqbnZVaUJuMSs1Z0w0VEdpWlR0?=
 =?utf-8?B?OXNXbXh5bmNPL2F2OEdVWnFhRHp2dE9RSXJ4Ym9mN0J1eERuZUY3QVNhZzh5?=
 =?utf-8?B?OUVNQWxmUVF3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB6226.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NnJINEFTS0JHUFdjRUlKOGFYVGc1MFIwS2MyZllpSzRjSTEySlVMVGFtV21I?=
 =?utf-8?B?Ky92SWRhUkFXSHlLSnBvbDQvT0wwV2h4Q1JHOHNPTU5pMVNpdHg4enZSUXpY?=
 =?utf-8?B?amZtcW9KdTZyZENxd3U3b0lhQncvMWI1MkUzZHhNOHBheTk5SHY2L1BrME95?=
 =?utf-8?B?OUlObGFLczJ3WWdTUkh3Q0x3d1o0WGJVY29vZSs4WWw3TTZqZUhDU3FHSTFY?=
 =?utf-8?B?ekdhU3R4elE5TXBUYkJnVG9NSFZHcnlZbDdOSjFuZUlQZUdKS0licEFEZGdm?=
 =?utf-8?B?R1pIZlJGd2pEdHZaMkJ3Nm8xWEJyaVRHMTRScTZlY2ZUTUFsWkJLZXRlc3NO?=
 =?utf-8?B?Um44OXBKaGN4Z0VWVVZsUTV1SzBBQVU0K3RZMzA3YmtxdXdjSkppNUF0MWhq?=
 =?utf-8?B?Y3RibzNST0RWSStqT1VSejZPUE9WQ0ppdkZXSnk4ZFliM2xJQTBKT1J1MDk1?=
 =?utf-8?B?N1lIRWFZdTdCRmpBRFRuZklnL2ptamFZUFgwWjlHWWpBM2dQbFBNUU1rQkJq?=
 =?utf-8?B?ZHpjbUNPMjJ4UG5LcVUwbUNFWnJKZzZnRHBGVDZvT3ZrdFNoN1BEK0VoLys4?=
 =?utf-8?B?aGdkSEdGZVBoVGFkUmlvYk5haHQ3eHhzbEI0aklmeEhYRDRJSEhlQzM4eUpY?=
 =?utf-8?B?REt5MkpNcnhKSGhaNkxoYWs1cmxTWkt2THZsNE1XT0J5YWs5dmlJTy9SUnds?=
 =?utf-8?B?VjRydXh1VTY2bkJIdGJNT09zdDEzTkVYc2d0eCtqY3VrYzAxTWYyQmEvd05M?=
 =?utf-8?B?cFlzc2JnbHFpMWlBVlZrSDZzS0svci9yeXUwKzJjZmtucmt4T3d3STZwRERv?=
 =?utf-8?B?NERGbjRKcjFoYTc1d0xzWlA0SnhkZGhuWlV4SWdmbnFiVkt5b3ZIeGRXVWRs?=
 =?utf-8?B?ZjliVUR1Y0VvZWpoL1gzNVZCcEZmcGJFU3J5aEgwdlRTRkYvN0hLbllxZVBq?=
 =?utf-8?B?TmcvNGx3S1VkK1VJUFExb201d1BoSncwdGNZblBBQWZSandpWW9VbzNValAv?=
 =?utf-8?B?RnlKUmpvYUpzZDl4cmN1Nm9ibXZ0clE2c0xOdUJhWmphYXhLeFRuc0dJMmk4?=
 =?utf-8?B?RkZyTDcxTm9va0JNWjE2TjlZelhvd2p4TS9nSWxUMHVwakY5cmxoamIzZEhk?=
 =?utf-8?B?UzVoSFZXNmN2QUFBYXh3d3hNYnBpalJFTGJxVHVyVDJQaGsrM2c0STdVRGF5?=
 =?utf-8?B?bmZ2UG5KRnRIclJsQkJsU2RSQjVkMEZRamZsM2QybUViL2hNbi9SMzJIWUow?=
 =?utf-8?B?andBVmtFS1MrdTFoSU84SDVtVk53M1dkcmJPeXhxL0FOdmhGeTVaY2x0VzVs?=
 =?utf-8?B?TFFka1ExTVVmQUFEYVdRbkJ2OHlCMFByN0owTjZNcHljb29LU1ZhMHNtRzFX?=
 =?utf-8?B?OG5pcmllTDJIMGkyek10eEZoWFFQbHZVUVpkaEhzR3BDOTBSbCtzRytWcFN0?=
 =?utf-8?B?QnVUL2R6VHJGazlWVmxCMnQyL1pmQ2dLc0xpVkx0UU13dzRpaEVyVFZLeWFh?=
 =?utf-8?B?VWpjTkJ6WEhhZ3Q1UDUzeFlEaXdWNWVzMS85R3hPTkczT2JMV282TWNxSlZZ?=
 =?utf-8?B?SktrNHRsQkF5ems3WjRkS0NYYk80YlIySTBMR05ZcTJzL29uQjJOWG44T3pN?=
 =?utf-8?B?OXZueVJ4eHE0azBiSzlMSTBabEcxejRiQ0g0RXAvYThydjFTT3IxLzI4TXcy?=
 =?utf-8?B?SWYxNjk0UTRmQk1nNE9VcFdJZWhHa1Z6NXFZMjJ3Y0Rta1ViRGhFa1RVVXlU?=
 =?utf-8?B?d2RzYXlnMHdQS1l0MXZQRkRROUd2R2VlOFM4RGdQclY3N2VQU0VnZlJUNTZE?=
 =?utf-8?B?VjhwSUk3dmNBaDcvczdZRkdQbEsrbmVadGE2UDVIMXVNMmhKcDlLOHM4Sk5t?=
 =?utf-8?B?YUprWFdWN1hGRFJSTnJVTCtYRGtzZmNFcXdqSWxPVElUQS95RG9VUmRjbmVQ?=
 =?utf-8?B?VEhPZnd1dEZSQ2pTMVdWUHAwdm9XOE1EZTRFS1hMcHZmR0FsWVNKV2VaMk1o?=
 =?utf-8?B?NVJxaHplcmY5VXJTNDFwOUFzQmxpbS9iNndjclY4VnlpUTRMZENxbWs4VVhz?=
 =?utf-8?B?REtYdW9pWXBzVi9FWFE3KzB5LzNYakNVNmhKelVjSnRJYzl6WERhL1loS1Br?=
 =?utf-8?Q?CZks+SIPB+ALzFmJY9cEHdeyL?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR06MB6226.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e952ee3-81ee-4058-4177-08de2e64107a
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2025 09:54:04.1209
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /d4TmWU3ot5ULPggiGRDfj/e3L5kUnVKsIVi7Px9q4TaMJ2lBfbMsFAVK2cNmDLT4p61VhnvfY4yioaPDr0SZByQ6ZoVb8UDSHC3ru4VQak=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5344

DQpIZWxsbyBLcnp5c3p0b2YsDQoNClRoYW5rcyBmb3IgeW91ciByZXZpZXcuDQoNCj4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0Br
ZXJuZWwub3JnPg0KPiBTZW50OiBGcmlkYXksIE5vdmVtYmVyIDI4LCAyMDI1IDU6MjggUE0NCj4g
VG86IEpvYWtpbSBaaGFuZyA8am9ha2ltLnpoYW5nQGNpeHRlY2guY29tPg0KPiBDYzogbGdpcmR3
b29kQGdtYWlsLmNvbTsgYnJvb25pZUBrZXJuZWwub3JnOyByb2JoQGtlcm5lbC5vcmc7DQo+IGty
emsrZHRAa2VybmVsLm9yZzsgY29ub3IrZHRAa2VybmVsLm9yZzsgcGVyZXhAcGVyZXguY3o7DQo+
IHRpd2FpQHN1c2UuY29tOyBsaW51eC1zb3VuZEB2Z2VyLmtlcm5lbC5vcmc7IGRldmljZXRyZWVA
dmdlci5rZXJuZWwub3JnOw0KPiBjaXgta2VybmVsLXVwc3RyZWFtIDxjaXgta2VybmVsLXVwc3Ry
ZWFtQGNpeHRlY2guY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDEvNF0gQVNvQzogZHQt
YmluZGluZ3M6IGFkZCBDSVggSVBCTE9RIEhEQSBjb250cm9sbGVyDQo+IHN1cHBvcnQNCj4gDQo+
IEVYVEVSTkFMIEVNQUlMDQo+IA0KPiBPbiBUaHUsIE5vdiAyNywgMjAyNSBhdCAwNTo0Mjo1OFBN
ICswODAwLCBqb2FraW0uemhhbmdAY2l4dGVjaC5jb20NCj4gd3JvdGU6DQo+ID4gRnJvbTogSm9h
a2ltIFpoYW5nIDxqb2FraW0uemhhbmdAY2l4dGVjaC5jb20+DQo+ID4NCj4gPiAgLSBhZGQgQ0lY
IElQQkxPUSBIREEgY29udHJvbGxlciBzdXBwb3J0DQo+IA0KPiBQbGVhc2Ugd3JpdGUgZnVsbCBz
ZW50ZW5jZXMuIExvb29rIGhvdyBvdGhlciBjb21taXRzIHdlcmUgY3JlYXRlZCwgaXQgaXMgbm90
DQo+IHRoZSBmaXJzdCBjaXggY29tbWl0LCByaWdodD8NCg0KWWVzLCBub3QgdGhlIGZpcnN0IGNp
eCBjb21taXQsIEkgd2lsbCBoYXZlIGEgbG9vay4NCg0KPiANCj4gPg0KPiA+IFNpZ25lZC1vZmYt
Ynk6IEpvYWtpbSBaaGFuZyA8am9ha2ltLnpoYW5nQGNpeHRlY2guY29tPg0KPiA+IC0tLQ0KPiA+
ICAuLi4vYmluZGluZ3Mvc291bmQvY2l4LGlwYmxvcS1oZGEueWFtbCAgICAgICAgfCA3MSArKysr
KysrKysrKysrKysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA3MSBpbnNlcnRpb25zKCspDQo+
ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9zb3VuZC9jaXgsaXBibG9xLWhkYS55YW1sDQo+ID4NCj4gPiBkaWZmIC0tZ2l0DQo+ID4g
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQvY2l4LGlwYmxvcS1oZGEu
eWFtbA0KPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL2NpeCxp
cGJsb3EtaGRhLnlhbWwNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAw
MDAwMDAwMC4uYzllNDAxNWE4MTc0DQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9jaXgsaXBibG9xLWhkYS55YW1sDQo+
ID4gQEAgLTAsMCArMSw3MSBAQA0KPiA+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BM
LTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkgJVlBTUwgMS4yDQo+ID4gKy0tLQ0KPiA+ICskaWQ6
IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL3NvdW5kL2NpeCxpcGJsb3EtaGRhLnlhbWwj
DQo+ID4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55
YW1sIw0KPiA+ICsNCj4gPiArdGl0bGU6IENJWCBJUEJMT1EgSERBIGNvbnRyb2xsZXINCj4gPiAr
DQo+ID4gK2Rlc2NyaXB0aW9uOg0KPiA+ICsgIENJWCBJUEJMT1EgSGlnaCBEZWZpbml0aW9uIEF1
ZGlvIChIREEpIENvbnRyb2xsZXINCj4gPiArDQo+ID4gK21haW50YWluZXJzOg0KPiA+ICsgIC0g
Sm9ha2ltIFpoYW5nIDxqb2FraW0uemhhbmdAY2l4dGVjaC5jb20+DQo+ID4gKw0KPiA+ICtwcm9w
ZXJ0aWVzOg0KPiA+ICsgIGNvbXBhdGlibGU6DQo+ID4gKyAgICBjb25zdDogY2l4LGlwYmxvcS1o
ZGENCj4gDQo+IFdoYXQgaGFwcGVuZWQgaGVyZT8gWW91IG1pc3MgU29DIGNvbXBhdGlibGUuIEkg
ZGlkIG5vdCBhc2sgdG8gY2hhbmdlDQo+IGNvbXBhdGlibGUuDQoNCkkgdXNlZCB0aGUgY2l4LHNr
eTEtaXBibG9xLWhkYSBiZWZvcmUsIGJ1dCB5b3UgYXNrIHRvIHVzZSB0aGUgY29tcGF0aWJsZSBh
cyB0aGUgZmlsZSBuYW1lLCBJIHRoaW5rIGl0J3MgbWF5IG5vdCBxdWl0ZSBzdWl0YWJsZSwgc2lu
Y2Ugd2UgbWF5IGhhdmUgc2t5MXAsIHNreTIuLi4gbGF0ZXIsIHNvIEkgYWRkIGEgdW5pZmllZCBj
b21wYXRpYmxlIGhlcmUgYXMgYSBmYWxsYmFjay4NCg0KPiA+ICsNCj4gPiArICByZWc6DQo+ID4g
KyAgICBtYXhJdGVtczogMQ0KPiA+ICsNCj4gPiArICBpbnRlcnJ1cHRzOg0KPiA+ICsgICAgbWF4
SXRlbXM6IDENCj4gPiArDQo+ID4gKyAgY2xvY2tzOg0KPiA+ICsgICAgbWF4SXRlbXM6IDINCj4g
PiArDQo+ID4gKyAgY2xvY2stbmFtZXM6DQo+ID4gKyAgICBpdGVtczoNCj4gPiArICAgICAgLSBj
b25zdDogc3lzY2xrDQo+ID4gKyAgICAgIC0gY29uc3Q6IGNsazQ4bQ0KPiANCj4gY2xrNDhtIGlz
IHRoZSBuYW1lIG9mIHRoZSBwaW4vc2lnbmFsPw0KDQpZZXMsIHRoaXMgSVAgcmVxdWVzdHMgYSA0
OE0gY2xvY2suDQoNCj4gDQo+ID4gKw0KPiA+ICsgIHJlc2V0czoNCj4gPiArICAgIG1heEl0ZW1z
OiAxDQo+ID4gKw0KPiA+ICsgIHJlc2V0LW5hbWVzOg0KPiA+ICsgICAgaXRlbXM6DQo+ID4gKyAg
ICAgIC0gY29uc3Q6IGhkYQ0KPiANCj4gV2h5IHRoaXMgaXMgaGVyZSBzdGlsbD8NCg0KSSBhbSBu
b3QgcXVpdGUgdW5kZXJzdG9vZCwgZG9uJ3QgbmVlZCB0byBsaXN0IHRoZSBuYW1lIG9mIHRoZSBy
ZXNldC1uYW1lcyBwcm9wZXJ0eT8NCg0KPiA+ICsNCj4gPiArICBjaXgsbW9kZWw6DQo+ID4gKyAg
ICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9zdHJpbmcNCj4gPiArICAg
IGRlc2NyaXB0aW9uOg0KPiA+ICsgICAgICBUaGUgdXNlci12aXNpYmxlIG5hbWUgb2YgdGhpcyBz
b3VuZCBjb21wbGV4LiBJZiB0aGlzIHByb3BlcnR5IGlzDQo+ID4gKyAgICAgIG5vdCBzcGVjaWZp
ZWQgdGhlbiBib2FyZHMgY2FuIHVzZSBkZWZhdWx0IG5hbWUgcHJvdmlkZWQgaW4gaGRhIGRyaXZl
ci4NCj4gDQo+IFlvdSBkaWQgbm90IHJlc3BvbmQgdG8gc2V2ZXJhbCBjb21tZW50cyBhbmQgZGlk
IG5vdCBpbXBsZW1lbnQgdGhlbS4NCg0KSSBpbnZlc3RpZ2F0ZSBpdCBzZXJpb3VzbHksIEkgdHJp
ZWQgdG8gdXNlIHRoZSBzb3VuZC1jYXJkLWNvbW1vbi55YW1sIGJ1dCBpdCBzaG91bGQgZm9yIEFT
b0MsIGFuZCB0aGlzIGhkYSBjb250cm9sbGVyIGRyaXZlciBkb2Vzbid0IGJlbG9uZyBBU29DLCBz
byBJIGp1c3QgcmVmZXIgIHRvIHRoZSBoZGEgZHJpdmVyIGFzIHRoZXkgZG9uZSwgc3VjaCBhcyBu
dmlkaWEsdGVncmEzMC1oZGEueWFtbC4NCg0KQW5kIHRoZSAiIEFTb0M6IGR0LWJpbmRpbmdzOiBh
ZGQgQ0lYIElQQkxPUSBIREEgY29udHJvbGxlciBzdXBwb3J0ICIgYWxzbyBub3Qgc3VpdGFibGUs
IGFzIG1lbnRpb25lZCBpdCBub3QgdGhlIEFTb0MgZHJpdmVyLCBDYW4gSSBjaGFuZ2UgdG8gIkFM
U0E6IGhkYTogYWRkIENJWCBJUEJMT1EgSERBIGNvbnRyb2xsZXIgc3VwcG9ydCAiPw0K
