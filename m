Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023086.outbound.protection.outlook.com [52.101.127.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3CAD303A1B;
	Fri,  5 Dec 2025 09:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764926791; cv=fail; b=XL6unvE56jTil5vw+CiZfyO7esyJtETpjI6NOkwO35wbmh+h6mV2zZKb2voE8Ed+y4WtaVx4gUUMjJ53Fzx9Y2i+EOaS2b3deL6cPDyt5/GAfBUDMZ3c6uQcR7r5fdumsMqqPZNHabCpccPFHl6PLMO3jpfdL5Eug97wI372byk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764926791; c=relaxed/simple;
	bh=tFqTYHd89yOQwf/t+kMDwtNQ9wfOmQzHDOcFt3whYNY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=i+5ybRivo7vNaCQQGMwqLHZmad7O1xkOUWWx/MeIQwgzVcsFWJYHXzg8/ygoDrRKYwkG4YsHuWGDNvy2NckokkV5xtqtxSQ5di5vLOpOHuWnncelziloWvr4Se1Qsz/NLZQ7vn4LjQNRECogsQp/KvE9zUqc45wT88aXnyac3iQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.127.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hKA+Dm1GfV9GvoSf98IIWad0fWsFnMct1rsJtETQ2Jf3y6uJaFnk2OpZnOQE6gt4jdBjbabMjftXW/yN8FRZUev02F292ih+9YGmURnTuFWMJsbGXjkMVYTBGjE3HMFVoza5E58I66fY6gGUzWIAZ281q0n1rZNOdkZl8TyTXFsu8tyKB+nKyfcrEZhJfuzS+p6RlGAogg9Wbbx1KVR1Rx/M0edaP+ySYRqGto7FEJUJTbt1W13xXA+Be6Ss79cvE7UglsjlRKAtXJU79P2gqurluhzvi4/+JIClU4tS8IVBquyOwSGfPvY++mpBZX1pr2+xppnx66CtI0kTLfcwKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tFqTYHd89yOQwf/t+kMDwtNQ9wfOmQzHDOcFt3whYNY=;
 b=gPQ3KwlzjlsSPnU+yj4wl2fm1GLj1s4Yr2vE7DNmhujMY+Nserk6S+/+75DAToP3j2V4NvxhNpTHcdViGaDVMIkUbrI+dhS02kN7kWKYmp48s4lgKJKxzf+3cDHG70cMB+LWeg5vlc4V7OxlfMg0UPJMrCRWBdr8m7WYR67fEResA9xrndlnTQP0kvib1S7gNozSnBrAQKyq67ofCGzk55vNQp9gbzHPBBfZk6eV2uAaARzI2AZKFzIxWbAb65qvCGiHNCJbpkD1CZjxb0Ra3pD41cdnTjf9kUWFV4SHlvs/SRfW+qLL8zoWT9MhK1geqO84SoQAD/1bZahCeCku8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from SEYPR06MB6226.apcprd06.prod.outlook.com (2603:1096:101:df::13)
 by SEYPR06MB5647.apcprd06.prod.outlook.com (2603:1096:101:c1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Fri, 5 Dec
 2025 09:26:18 +0000
Received: from SEYPR06MB6226.apcprd06.prod.outlook.com
 ([fe80::56e8:777c:d80e:d364]) by SEYPR06MB6226.apcprd06.prod.outlook.com
 ([fe80::56e8:777c:d80e:d364%5]) with mapi id 15.20.9366.012; Fri, 5 Dec 2025
 09:26:18 +0000
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
Subject: RE: [PATCH v4 1/3] ALSA: hda: dt-bindings: add CIX IPBLOQ HDA
 controller support
Thread-Topic: [PATCH v4 1/3] ALSA: hda: dt-bindings: add CIX IPBLOQ HDA
 controller support
Thread-Index: AQHcY385bU/Y88Xk40i6LNSQa/UTGrUSwl6AgAAFGBA=
Date: Fri, 5 Dec 2025 09:26:18 +0000
Message-ID:
 <SEYPR06MB6226B32B5E26E60F9E673B8D82A7A@SEYPR06MB6226.apcprd06.prod.outlook.com>
References: <20251202113132.1094291-1-joakim.zhang@cixtech.com>
 <20251202113132.1094291-2-joakim.zhang@cixtech.com>
 <20251205-interesting-determined-gecko-fce146@quoll>
In-Reply-To: <20251205-interesting-determined-gecko-fce146@quoll>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB6226:EE_|SEYPR06MB5647:EE_
x-ms-office365-filtering-correlation-id: c5847511-d180-4cbb-de0a-08de33e05883
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?KzcxRExFNFQ3dXQ1ajFMQWJUeHdwMm4zSmNnY3FXY2d5RUx1YkRiQmdaaHBx?=
 =?utf-8?B?MWFhdkt6M0FRWjh2TEU4czBOSG1yMDVLalFzVUZrZjBkN0xOVm5YelZxRnYz?=
 =?utf-8?B?TFNBWWY5MXI3SWZtWFdVZ1B0aTArdlhocjFCMHhrRXlTQlhnU0RsNXlKdmwy?=
 =?utf-8?B?Y1Rrd0RkZldCd0x6SXl5a3p3dVVwLzZDVCsxLzU2Mm51eDdWbXBoMzM1Uys5?=
 =?utf-8?B?d25PN25mQi9FT3h6N1ZFY0wyaENyTTU1S3FMQnpFOWhobEJiTGlQQjVZR2Zh?=
 =?utf-8?B?N0R4M2lGWVRWR01vZG9nTE1HS3JXR3V1aUJXazhCY1ZvY1V1aUkvMUZLYXdO?=
 =?utf-8?B?ZkNReVRYWFg0TlBKdHE4SnZ3MEJycHFSNWMyalRCVXdjc2lZL3A1SVk2VVB6?=
 =?utf-8?B?NXd6UHZheWg5dmRSMk54MWtmYmQwSGF5SmhJYzVpRUJ0dkF6TEgwdDQ4bXFZ?=
 =?utf-8?B?eUJhOS9wZjVtODZGekY4TWdCZTU4a0l1dHZoeHJYYXkyTEtsZTB1cXZCQ1hu?=
 =?utf-8?B?QU9wZHZtUCt5RkZPRFczV09zS1VYdDFjNjhDazRBNW03S3hWNHkyazNnSHNx?=
 =?utf-8?B?ZXpzRnk3ZUhycW9JdTBoYlRZdWxUcFVHYzlZSDlwcHJ5VkdYNHdQUCtRRjdT?=
 =?utf-8?B?eVFITno0cFRpUDk3OEpJVXkyb3JxYThSa2xPenRPOUN5T3JWUENzRFVMYTRi?=
 =?utf-8?B?eTFEZnFHWmJTQkJzaHVXcXdXcDZjYkRpb3VZMXJSd2k0MVVheTZHbE9jMWdP?=
 =?utf-8?B?bUlkT0NxaVo2YXRjZkFySk5YOUJLVVJFRDYzK08xQzRXREROSEZ4RkI2OEJJ?=
 =?utf-8?B?amxOb1M1ZFlHYmpVOUV2YkplSmJTMzFBa2RURlIyUkx5RWJUSEhESDNCSkNH?=
 =?utf-8?B?UFJCdjBvZCtNcW5Ia2ZYWmFMcSt5QmtISHVrMFFhWElXK2J4ckphUjFoVVI4?=
 =?utf-8?B?dThxbXg0UmtTNGF5UDdzN2YyR1FuRWVLcjVuZmJCTUoxRWZPRDM3RzFSTS82?=
 =?utf-8?B?VExiU2ZyaFN6SHg5UTBoL1F3eUhiazFqcHRLM1N2Y0xtNnA2WDZvbW1FNm84?=
 =?utf-8?B?OEJTSVkxOEpOTVNGODh0M3NxQTRKRXJITkN4cW5jWGxyZGEwL0hINVB3blVP?=
 =?utf-8?B?OGlrWEp3VUZWaEV5UmxMTVRDdTFKMUJmUXJSamd1WGpVR0R5TTJZWXVJMkhh?=
 =?utf-8?B?UXNVdHlXYXBHMDJUcThrL0h2RHpiZk95VzJuM0gwc1RzTTBUTE1SVTJGMjMv?=
 =?utf-8?B?cXlydE9zdEY1NlNyZGJGQ0ZIVXFHVmhuUWhVcTZEemdKWlY0cytvRjZFS3FZ?=
 =?utf-8?B?UDE0dHV6cWlBUVc4SkJFRERvS1I2RVl4cE05RDYxOEl2ZmpUWTV5azE0NkZ4?=
 =?utf-8?B?c2pqRlE4OGpjYWFvMVNWWE42MHN1SmovL01XMWgwdEpnWk1XRlJxc2dvYU1Y?=
 =?utf-8?B?Q2lvaFZvNlB3Y2pXWjVwcFFWMm5vRWlpUDd3MUtBUm1hZUl4ZitENUNEYVAr?=
 =?utf-8?B?RG5uR0FvdkZlWU9vaDFRalpGTExKS0x4SWhaNHllWTNaT3ZHNDNGN2E2N3Ft?=
 =?utf-8?B?TWU5WVh2YVhyaW9iVENlYmU4RU5SKzg5MnBiakMySmhpWkRJd0NwMng2RjIr?=
 =?utf-8?B?eU5TNnJST3p1NTNVVS9MaGcySXZkMS9vSnRLWkR6ZUcyWi9DMXRja3laSG5C?=
 =?utf-8?B?RWtiYURrb1FGd0d4WmRYOFJkeU45VG1IbmZMZUtSM01Ra3pEcUM1QkZZR0hj?=
 =?utf-8?B?YWp4YUtaQ3IrS25wTWFQakZuRCtMSHJZWVAwTUg2eHFEVlNTUXBEUHEyWHFu?=
 =?utf-8?B?SW82R1VJcXVYR2dMTDBSMG85dXZCU3hVcUwwTm9WTGlXeHN6T0VnODNteXRh?=
 =?utf-8?B?bi9TaTVyMGp0VWszL3FUYitwbjkyb2NxQmJnV2tqTXhaQ1F6NU5VYmZzbEdk?=
 =?utf-8?B?cTAxbCtDQ0tQOHdmQnRlK1NPWlFUY3lXOWpvTUpNdkxJaTNCeGt0dzRjTXRK?=
 =?utf-8?B?ejN1d1M4MlpBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB6226.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MWlzTFJkSURyZ0xBQm9XbVJuTEFRZmdBejJGVFNCRCtHWVQvd0xmUmJvbVF5?=
 =?utf-8?B?T1o2alB6OC9NRmo3dHdTbGNmV2UzU0hMVVZNZGpmSXpBODJFcitVUUpVZ3NK?=
 =?utf-8?B?Z1luVkQxMk12cUVRQ3VsdlJkazBUSXJRaDEzTFBiY3NoaXMwbXVpMXJURHc2?=
 =?utf-8?B?NHpWanZsTVRWK2pKM0hJR05sbm9zSnVhSm5MaXUyWWJYQllCV0FDczR2ZWRr?=
 =?utf-8?B?WG0rR0R4SkN1R1VQSloxbVRwazZiMnhVOFRyWFdMZGNqVEo1UEdjbmk4ekx5?=
 =?utf-8?B?NkhMc0FxUWM4MzNoMTRTRytDRDFPKzFuRUNncm56bFJoWHZKTGN5cE1YcXNI?=
 =?utf-8?B?Y1lTUjZ2bzdwK1ArRytoMXAyb2FKRVptK0IvcWRYSldpcEpoanRqK1dXWi9k?=
 =?utf-8?B?UGtZR3ZDUnZvU1QrOG8yTitia3JvbHNjVUhYbW9Hanp3VG55WUo3S1l4ekdX?=
 =?utf-8?B?NGpoalNRYjRGUFRaQ2MwTTh0cmhsOGdYc2VEeGY1L1FSVVVIZ0FxNStEejFL?=
 =?utf-8?B?SzA2RTZQazRKTnQxbC9acUhMNUxQQjRvUDMzNDRnbjkyZzcyd0g5bCszNkxO?=
 =?utf-8?B?NElZcU9NUGJSRFBvRUg4R2ZHbDZWbTNHTktBNVRUaldKQXNWb0lkNEwzb1lx?=
 =?utf-8?B?TDYvbmtBYXJxNGwydEYzbG5QZnhOSm5kUFBrWmN5T2I2cXlmbVlQcXhtZDg2?=
 =?utf-8?B?WC9SaUxjdDBlSGFNcVJHWnRwOEdYL2hRS2trTHV3WWlYOTVEcTdkbFpFQWY0?=
 =?utf-8?B?dDk3TlBlL0p4dVpYMUl6cHJacmNMZ0RFaGNoSy94QzZqLy9RZmphWkxWMjNG?=
 =?utf-8?B?QlV1TjI5KzA1SmxINjg1YWZVOWdFdHlIbjFGbDBtRUYwWElWVEFJMzFEOXBl?=
 =?utf-8?B?N1BrZlNCS25Pa05uaEJveWxRQXJNUmhnMmtHRE1PMjlVQkJjYmRwT1E4ejJp?=
 =?utf-8?B?c1V1OUM1a25vTTBDMlQrWDR6VVdQWWFoczB0cEFzWG14cU8wTG9IUW1YWmtI?=
 =?utf-8?B?RFN0S2JJTjRLUGhXWjJta2VRbnI2Sk9yanN4aXViRnNPMS9oT2tKcmlpRG8z?=
 =?utf-8?B?cEtOL2drMDBFZVhqeG1HdHAvQ1d0Wk0rcUFzTDBOWEUyeFEzMFRjTmptNk9D?=
 =?utf-8?B?KzZxOUx3U3BZVGtEVTh0RW44LzF5MEphaGVmbEhKUklLamNpK2NOVm1Ldkw0?=
 =?utf-8?B?cHRyNytIcEZPL3BuYzdmWDZ1ZTNwZVpKK0VkaDhBVzRNQ01tNmV1T0YzY3Az?=
 =?utf-8?B?T3dXTFRJT0ptcHk4ekpzVmRHWkVWc21KN3NaRU5qejhkWXJ6ZVg1a2Z0ZjN3?=
 =?utf-8?B?ZGlRbUNNTmxWdVgzaVcrc0F1N1MxQ2NUKzZnVmNFWnpZT0puMVFEUnhwRXF5?=
 =?utf-8?B?QmVaa3BYS2J2SUNzdEVJR2taN1FDMkREbkJ3Q2tWc2dUQ1pmQWFTdzlWclRk?=
 =?utf-8?B?ME9JdFBHVGIvay9KQUE0T3lsWWovVmdiRjh4WE9oL1NoMGVjcnhGeFJWVC9j?=
 =?utf-8?B?T21zVWhnbXU5OGlUaFhjS3lEcW50VWROeEM3N0RKZVdIRmNRSklpclRyQmFM?=
 =?utf-8?B?TDJkdGVkOXAzNC9QRG1kSnVNNTRSME1SaXFOQnBBd1cvK0ZGKzlIVTBJS1hk?=
 =?utf-8?B?eEFBblVsMDdnVFNIT1JQb0E0QTNlSVZYb2t3a3VtRHlFZEpUODJMWllObjhD?=
 =?utf-8?B?ZEhFZ3BzVHp0bTVVYnQyVERvS1BjMGIxV2dlRldCc2I4c0c0blhndXBZY0Jv?=
 =?utf-8?B?L3RXbmNDL1FielJsakpnUlFMd2ZpTWFiNVh6OTdsTlNWckFHcmRobHQ0Wkt6?=
 =?utf-8?B?bjNpOXFCSHNTc2RTNTFEN2VRWG9oMjg4OFlSWWNqMmpFd3dIeUlIbWdXWFNX?=
 =?utf-8?B?ZEFsdVNQNWJjaFYxTE9iWlZPd0Y1RkZycVFVT0l5YUR1TnZRL291ZEJmQ08z?=
 =?utf-8?B?TU15dFNUWjN5QVNZS2FYZkNSRmUydjBSQ0I5Z1F2S1Iyc3JicXpSaWwwTEdM?=
 =?utf-8?B?Y3VwUHlpVGRSYTRoQjMvMmZFUHFLcTg4SHR2Zk92a0M5M2U5a1FPYUpOeHlZ?=
 =?utf-8?B?d1BHU3c5Y00zTHo4SGJzdHAwWTU0dGtGZEVUb1ZqWkcraVZBOXRwS2JheUpl?=
 =?utf-8?Q?0xTrF5KQ7si16C+Aec7vthxBA?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c5847511-d180-4cbb-de0a-08de33e05883
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2025 09:26:18.3860
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iuk+aaYZV2PWMENwzHJTjufT1y5TXmsqKpzT+whfXhUqKoNRS8qFBw+dDAhEqXQsKuAdHFMZiHAyL0PYJ2nAjInFgzy8f7yxcN9i+iOLSmg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5647

SGkgS3J6eXN6dG9mLA0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
S3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3JnPg0KPiBTZW50OiBGcmlkYXksIERl
Y2VtYmVyIDUsIDIwMjUgNDo1NCBQTQ0KPiBUbzogSm9ha2ltIFpoYW5nIDxqb2FraW0uemhhbmdA
Y2l4dGVjaC5jb20+DQo+IENjOiBsZ2lyZHdvb2RAZ21haWwuY29tOyBicm9vbmllQGtlcm5lbC5v
cmc7IHJvYmhAa2VybmVsLm9yZzsNCj4ga3J6aytkdEBrZXJuZWwub3JnOyBjb25vcitkdEBrZXJu
ZWwub3JnOyBwZXJleEBwZXJleC5jejsNCj4gdGl3YWlAc3VzZS5jb207IGxpbnV4LXNvdW5kQHZn
ZXIua2VybmVsLm9yZzsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7DQo+IGNpeC1rZXJuZWwt
dXBzdHJlYW0gPGNpeC1rZXJuZWwtdXBzdHJlYW1AY2l4dGVjaC5jb20+DQo+IFN1YmplY3Q6IFJl
OiBbUEFUQ0ggdjQgMS8zXSBBTFNBOiBoZGE6IGR0LWJpbmRpbmdzOiBhZGQgQ0lYIElQQkxPUSBI
REENCj4gY29udHJvbGxlciBzdXBwb3J0DQo+IA0KPiBFWFRFUk5BTCBFTUFJTA0KPiANCj4gT24g
VHVlLCBEZWMgMDIsIDIwMjUgYXQgMDc6MzE6MjlQTSArMDgwMCwgam9ha2ltLnpoYW5nQGNpeHRl
Y2guY29tDQo+IHdyb3RlOg0KPiA+IEZyb206IEpvYWtpbSBaaGFuZyA8am9ha2ltLnpoYW5nQGNp
eHRlY2guY29tPg0KPiA+DQo+ID4gQWRkIENJWCBJUEJMT1EgSERBIGNvbnRyb2xsZXIgc3VwcG9y
dCwgd2hpY2ggaXMgaW50ZWdyYXRlZCBpbnRvIENJWA0KPiA+IFNLWTEgYXVkaW8gc3Vic3lzdGVt
LiBIREEgY29udHJvbGxlciBzdXBwb3J0cyA2NGJpdCwgYnV0IHRoZSBhdWRpbw0KPiA+IHN1YnN5
c3RlbSBjYW4gb25seSAzMmJpdCB0cmFuc2FjdGlvbi4gVXNlIGphY2sgcG9sbGluZyBtb2RlIGFz
IHRoZXJlDQo+ID4gaXMgYSBoYXJkd2FyZSBpc3N1ZSwgbGVhZCB0byBpbnRlcnJ1cHQgc3Ryb20g
aWYgdGhlIFJJUkIgaW50ZXJydXB0DQo+ID4gZW5hYmxlZC4gSG9zdCBhbmQgaGRhYyBoYXMgZGlm
ZmVyZW50IHZpZXcgb2YgbWVtb3J5LCBzbyBuZWVkIGRvIGRtYQ0KPiA+IGFkZHJlc3MgdHJhbnNs
YXRpb24uDQo+IA0KPiBBYm91dCBzdWJqZWN0Og0KPiBJIGhvbmVzdGx5IGRvbid0IGtub3cgaWYg
IkFMU0E6IGhkYToiIGlzIHRoZSBjb3JyZWN0IHByZWZpeCBoZXJlLCB1c3VhbGx5IFNvQw0KPiBz
dHVmZiB3YXMgIkFTb0M6IGR0LWJpbmRpbmdzOiAuLi4uIiwgYnV0IHRoYXQncyBub3QgQVNvQy4N
Cj4gRmluZSBmb3IgbWUgYW55d2F5Lg0KPiANCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEpvYWtp
bSBaaGFuZyA8am9ha2ltLnpoYW5nQGNpeHRlY2guY29tPg0KPiA+IC0tLQ0KPiA+ICAuLi4vYmlu
ZGluZ3Mvc291bmQvY2l4LHNreTEtaXBibG9xLWhkYS55YW1sICAgfCA3MiArKysrKysrKysrKysr
KysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA3MiBpbnNlcnRpb25zKCspDQo+ID4gIGNyZWF0
ZSBtb2RlIDEwMDY0NA0KPiA+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3Vu
ZC9jaXgsc2t5MS1pcGJsb3EtaGRhLnlhbWwNCj4gPg0KPiA+IGRpZmYgLS1naXQNCj4gPiBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9jaXgsc2t5MS1pcGJsb3EtaGRh
LnlhbWwNCj4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9jaXgs
c2t5MS1pcGJsb3EtaGRhLnlhbWwNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4
IDAwMDAwMDAwMDAwMC4uYjI3ZDQ3NTIzYWYzDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9jaXgsc2t5MS1pcGJsb3Et
aGRhLnlhbWwNCj4gPiBAQCAtMCwwICsxLDcyIEBADQo+ID4gKyMgU1BEWC1MaWNlbnNlLUlkZW50
aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKSAlWUFNTCAxLjINCj4gPiArLS0t
DQo+ID4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvc291bmQvY2l4LHNreTEt
aXBibG9xLWhkYS55YW1sIw0KPiA+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0
YS1zY2hlbWFzL2NvcmUueWFtbCMNCj4gPiArDQo+ID4gK3RpdGxlOiBDSVggSVBCTE9RIEhEQSBj
b250cm9sbGVyDQo+ID4gKw0KPiA+ICtkZXNjcmlwdGlvbjoNCj4gPiArICBDSVggSVBCTE9RIEhp
Z2ggRGVmaW5pdGlvbiBBdWRpbyAoSERBKSBDb250cm9sbGVyDQo+ID4gKw0KPiA+ICttYWludGFp
bmVyczoNCj4gPiArICAtIEpvYWtpbSBaaGFuZyA8am9ha2ltLnpoYW5nQGNpeHRlY2guY29tPg0K
PiA+ICsNCj4gPiArYWxsT2Y6DQo+ID4gKyAgLSAkcmVmOiBzb3VuZC1jYXJkLWNvbW1vbi55YW1s
Iw0KPiA+ICsNCj4gPiArcHJvcGVydGllczoNCj4gPiArICBjb21wYXRpYmxlOg0KPiA+ICsgICAg
Y29uc3Q6IGNpeCxza3kxLWlwYmxvcS1oZGENCj4gPiArDQo+ID4gKyAgcmVnOg0KPiA+ICsgICAg
bWF4SXRlbXM6IDENCj4gPiArDQo+ID4gKyAgaW50ZXJydXB0czoNCj4gPiArICAgIG1heEl0ZW1z
OiAxDQo+ID4gKw0KPiA+ICsgIGNsb2NrczoNCj4gPiArICAgIG1heEl0ZW1zOiAyDQo+ID4gKw0K
PiA+ICsgIGNsb2NrLW5hbWVzOg0KPiA+ICsgICAgaXRlbXM6DQo+ID4gKyAgICAgIC0gY29uc3Q6
IHN5c2Nsaw0KPiA+ICsgICAgICAtIGNvbnN0OiBjbGs0OG0NCj4gDQo+IEhvdyBpcyB0aGUgcGlu
IG9yIGNsb2NrIGlucHV0IG5hbWVkPyBJdCdzIHJlYWxseSBjbGs0OG0/IFRoaXMgbG9va3Mgb2Rk
bHkNCj4gc3BlY2lmaWMgYWJvdXQgZnJlcXVlbmN5Lg0KDQpJIGRvdWJsZSBjb25maXJtIHdpdGgg
b3VyIFNvQyBjb2xsZWFndWUsIGl0IHJlYWxseSBuZWVkcyB0aGlzIDQ4TSBjbG9jayBmZWVkIHRv
IHRoaXMgSERBIGNvbnRyb2xsZXIsIGlmIHlvdSB0aGluayB0aGlzIG5hbWUgbm90IHF1aXRlIGdv
b2QsIEkgY2FuIHJlbmFtZSB0byAicGVyIiwgYXMgbW9zdCBkcml2ZXIgZGlkLg0KU3VjaCBhcywg
ImlwZyIgYW5kICJwZXIiIGhlcmUuDQoNCj4gDQo+ID4gKw0KPiA+ICsgIHJlc2V0czoNCj4gPiAr
ICAgIG1heEl0ZW1zOiAxDQo+ID4gKw0KPiA+ICsgIHJlc2V0LW5hbWVzOg0KPiA+ICsgICAgaXRl
bXM6DQo+ID4gKyAgICAgIC0gY29uc3Q6IGhkYQ0KPiANCj4gSnVzdCBkcm9wIHRoZSByZXNldC1u
YW1lcyBwcm9wZXJ0eSBjb21wbGV0ZWx5LCBpdCBpcyBub3QgdXNlZnVsIHdoZW4gaXQgaXMgdGhl
DQo+IHNhbWUgYXMgZGV2aWNlIG5hbWUuDQoNCk9LDQoNCj4gPiArDQo+ID4gKyAgbW9kZWw6DQo+
ID4gKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9zdHJpbmcNCj4g
PiArICAgIGRlc2NyaXB0aW9uOiBUaGUgdXNlci12aXNpYmxlIG5hbWUgb2YgdGhpcyBzb3VuZCBj
b21wbGV4DQo+IA0KPiBEcm9wIHByb3BlcnR5IGhlcmUsIG5vdCBuZWVkZWQgYmVjYXVzZSBpdCBh
bHJlYWR5IGNvbWVzIHZpYSBzb3VuZC1jYXJkDQo+IHNjaGVtYS4NCg0KT0sNCg0KPiA+ICsNCj4g
PiArcmVxdWlyZWQ6DQo+ID4gKyAgLSBjb21wYXRpYmxlDQo+ID4gKyAgLSByZWcNCj4gPiArICAt
IGludGVycnVwdHMNCj4gPiArICAtIGNsb2Nrcw0KPiA+ICsgIC0gY2xvY2stbmFtZXMNCj4gPiAr
ICAtIHJlc2V0cw0KPiA+ICsgIC0gcmVzZXQtbmFtZXMNCj4gPiArDQo+ID4gK2FkZGl0aW9uYWxQ
cm9wZXJ0aWVzOiBmYWxzZQ0KPiANCj4gQW5kIHRoaXMgc2hvdWxkIGJlIHVuZXZhbHVhdGVkUHJv
cGVydGllczogZmFsc2UgaW5zdGVhZC4NCg0KT0sNCg0KSm9ha2ltDQo=
