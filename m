Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023074.outbound.protection.outlook.com [40.107.44.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F531DED63;
	Mon,  3 Nov 2025 10:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762166201; cv=fail; b=OGfaFfwNl2XKrVsR8yEGz4a8luGXpPtlseR9tkGDIRxEN8yghIsRW6+GOFapSB2z2XsIUAN6aLYkfoAGzSFDCXjdmQt/X7BiBRu7xdtw+5uQluwyTkQk9HDV16bygAPw5MlQSyXuahl5+ZZ7kkdsWnygmn0Qs+Se+e3pmWFrVUk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762166201; c=relaxed/simple;
	bh=76/pxoI15Ei38qZIDBLkxhiyDCMyM8xOvRLd8WDELN8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=li3dojLQ7YAULNbtYSGcKdSvxA9Uy9aIQu4ssuJfWbPceCxoJIyo9gEZRpAEe2RBIc+UOZxLxbGNiAW7owQJtx38Q7+5SAyJq8R/BozTf9fBLqWNqBfhEQd+RJr4ySPbyzMbWJRDGeR2Dzuo9KINsgzkD5D+fC8YGA3LG5XQ3gI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.44.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CmRFDaYQnykgNvsurbVU3mbXJyYeIkW79iAwb98QR0PeQsfSfIK8SzN86s3giIHXxUsf6Woz0tdcykbuPzm/ZOIcGzelsyv445PzKxRz3y/pR/AOuXOCqZzF4AtGm6W/goZNO/NC8/R/r9JQ54fdD/Efk0V95EG9qUPRGhwew/B+ykEDR9zvxWw3ZrPMBFjio1hYcdqZTVxR6b2E03o7Td3VTeBFtHb9YiRT7LQnnH2UE/BTfMcZu9TVqzFMnWtauXyGFteJIyE+3I98ylN+je7OEWKuPSP0/oLBMV3OPfPwRx4b3F2EUioOZEufZhzaA4mLBhkNXbYq0vOsZ9IJHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=76/pxoI15Ei38qZIDBLkxhiyDCMyM8xOvRLd8WDELN8=;
 b=r9crIeXufkzuLz7D2lLJ1yEymKuzbYno3PUgtIAfuQ63VC2vdYpT/aYT4NgPlZXOAwQHluptfvgLkNwXJ9m8yo24BFKGcSLNIe2mIvTjHZi4IqeQ1U4vERXqScIjghpyCRgIWC2neWzm8rBFejnVem5PXw9ZDJzNTt/c6LQZiZU5OS0i1aaDPjbPA5Fqg8nOavScVAJLq9Za5IuiikzzXUxu8/LPL+NoUIKrf4zALn82MY49q/RHbDVO080MXQt6G7zdqRkmrFW5sQ7pmEsU3Om9VzHsFkSxTacOzkreQdMPy23Gyk3BYjlwl+pO79ScxptmTeTEvisVucm0+MZQdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from KL1PR06MB6236.apcprd06.prod.outlook.com (2603:1096:820:d7::11)
 by TYZPR06MB6466.apcprd06.prod.outlook.com (2603:1096:400:45d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Mon, 3 Nov
 2025 10:36:30 +0000
Received: from KL1PR06MB6236.apcprd06.prod.outlook.com
 ([fe80::f390:bcd2:407b:c474]) by KL1PR06MB6236.apcprd06.prod.outlook.com
 ([fe80::f390:bcd2:407b:c474%5]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 10:36:30 +0000
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
Subject: RE: [PATCH V1 1/3] dt-bindings: sound: add binding for CIX IPBLOQ HDA
 controller
Thread-Topic: [PATCH V1 1/3] dt-bindings: sound: add binding for CIX IPBLOQ
 HDA controller
Thread-Index: AQHcSY3fztsh59A+U0eplCvLGbX3abTb9ggAgATRuvA=
Date: Mon, 3 Nov 2025 10:36:30 +0000
Message-ID:
 <KL1PR06MB6236E3E69036A237D47B5B7482C7A@KL1PR06MB6236.apcprd06.prod.outlook.com>
References: <20251030110928.1572703-1-joakim.zhang@cixtech.com>
 <20251030110928.1572703-2-joakim.zhang@cixtech.com>
 <20251031-pearl-pheasant-from-atlantis-bf4e7a@kuoka>
In-Reply-To: <20251031-pearl-pheasant-from-atlantis-bf4e7a@kuoka>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR06MB6236:EE_|TYZPR06MB6466:EE_
x-ms-office365-filtering-correlation-id: 859d00da-6873-427f-72b9-08de1ac4d9f4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?RHZCTUx5RGZIbXQwMys0WW52RzRnR0Q2REhNb2EzRHJ0cUNtQmVIeDBzY2Vs?=
 =?utf-8?B?WnBRUlpUbmUrajBtbzdUSVhMbmRaaDV6c2M4NzRseW1DNWdrc0NtdE5Ubmsz?=
 =?utf-8?B?R1JCNSt3VUlXcjlhQ210OWVkeUJITmV5Mi9DYi9Md1REdHU0dm9oMTRlOFNH?=
 =?utf-8?B?c01Ma1dwZkJ5Wm9nVitDZWlzNFRzTmZpd1JHUEozWGFMa1Vrdy8xUy8xc3NU?=
 =?utf-8?B?SDh2aWk5UkZIaDQwVk5Wa3V2MlpiYnVyMTdUallzTWw3VEpFNHhNdG5zcWJt?=
 =?utf-8?B?SnJ5M2RLWFMyeUJHQlU2bk11NHcyNjRqRTQxZ2FZVzdiK0VBWUVVa1h5ejhy?=
 =?utf-8?B?Y3J4RVFSbmpmektFNGoycStobEZEd1hBOUxCYnRJeDB6a0puWE1nLzlNYkFo?=
 =?utf-8?B?ZExvc05rUGluWlBiQ0d6dFhWMitMa00zaU1JdnEyQVJMMzEzV0hxMmI3bUxw?=
 =?utf-8?B?TVB5aU5CK0xUSkVESldkeGdQZEd3cUtkbEpqYjBPVnpyVklEaWFUM3dycDVS?=
 =?utf-8?B?Q29USm1abUlQUlhBOFlhUWxrNHEwQ0VIL1pocTA4Y3l1K050MzlRR096YTli?=
 =?utf-8?B?ZnZnTmZDT1I0TmUzektKOEg0RmtCcUFjWEQ0bXJVQzhhOXVZVWYydHNXbDVn?=
 =?utf-8?B?RjZXamcyei9YS1V2Z0prYWg2VkZGTmdFakRRcVU3ZHM4OWRFRVc3dkJxcXhE?=
 =?utf-8?B?QXJDcUx3MnV2UGcwRElncTBhWW03UUJVci96eTdFS3I4YWZTMUxOelQ0YXBl?=
 =?utf-8?B?OFdNd3pwckhXQ1pkVTNGTEYxWTRySGR5VS9CbnpPSFZSbktGSGZxY294RUFn?=
 =?utf-8?B?TnJCR2RITEszM052YlJxeVh4ZTg5WkJxd05wMVI1N25LejhPdmpFSzg1WUd4?=
 =?utf-8?B?QzBrOHJ3TGcvQXUvNHJmbEM4Q29pZDZCTXRZRWNuMHNpVnBDczZLNFJ3S2Q3?=
 =?utf-8?B?MTVIWU1oZ2NJWHB3L0JCMWl5Wm1uUEU5R01WQjRjbUVlL0ZqZzVJWHdsTmIx?=
 =?utf-8?B?NlUvUUVZQXc1dXhwbjRUbnh2N0V1dlNKNmJLNHV6M285R1hFMFVia2FxN3Bq?=
 =?utf-8?B?R2NpZzBpYnVkOTdZMEY4d0tJTlZtOEQ2ZWMvb0VCSXQ0OVl2WUNuUGdadzd6?=
 =?utf-8?B?THU1V2psMURWZGttVkcvdnZJTlVmdnJ3KzNmUXVnMC9GclRpeS95MjJrVU1F?=
 =?utf-8?B?alBsejR6QW5vcERXcDBEUlJQdHRoRW9TVG4zWTRnbjE1NnUvWXRRWVFaREhn?=
 =?utf-8?B?MTNnR3l1ZkdVS2xhc1M0eGdNMzhKRm9UQis1QXp5M0txc2JsQUlGS21MZGRa?=
 =?utf-8?B?MUZaNkZnc28wYlpwY3BSeFk4QXVlY2IvZlVieVg2QVVPQmFJQWVPay8wV2Zq?=
 =?utf-8?B?YitKa29iczNuN0RIRWxrUDRnQzZQc29CSTFRdUg2RXF5RGtPMlhyVStoMnIz?=
 =?utf-8?B?T09CL0Ixc0xISzI5N05WTXE5WldmenZXU0hVNis1SnNCeE40d0FBT3RFTDVP?=
 =?utf-8?B?b3dtYkhyWUxwdm15TWlJQUs4WXVUcFVhakI5VmdQMTRwTmkvUmNuL25EdlpN?=
 =?utf-8?B?d0FNWXBLQjd1b3llYUFCMGpvbDRjS0lWM29IRnQybGdoUkxCTG9RdWJhQjZ6?=
 =?utf-8?B?UHhSNmFBcWFTOFE0MUJ4NDhLWEZ3Q3hkV0NMZFBtWjhqWElkaTdjR0QwV3VQ?=
 =?utf-8?B?Njg0ZTlBQ1JiTTdBQ2xHQk4wOS9vNGwwMnNjU0daSTN1WGNFM2Y5OTNSOE12?=
 =?utf-8?B?aG5WRE9ZTTFwdG1JemFKb3VnMzJPekVHRm1sOUNPUDNKQU5jYVZ4Snp5TldY?=
 =?utf-8?B?ZGcwcDBkM3FNUGw0b2RlL3R3cjdOM2ZWR015MVhxekJuZ3ZvNWNtbFRtVjl4?=
 =?utf-8?B?Z2J1Z2tGb1lyMTJSVnNLeFlZcTZSblE5NVk0anhINThkTGdRWXRpWEtURVpq?=
 =?utf-8?B?aytkRkNMMXBtbVArQm9yV3QydnRBTk9JRE5XR21aVlpCVDBkeDBnMzcrN2Va?=
 =?utf-8?B?T3ZYT3RBU0FnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR06MB6236.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TDlBRWJEZjVEaXhvU1FTbHRQYU5RNkV0eVlRdWJZUjZyTkZBU05oOG9ia2g0?=
 =?utf-8?B?Q1lxaCtYL0JXQlg4TFpBNE1lWnkxWUVua0lxMEtKb1c1TDFsSnZUMGhheXlD?=
 =?utf-8?B?SnVTRnF5cWl2Tnh0VjlkcU9zTFpRdTFXVnc4dk5udFA2bHBrUVZRZ1kvLytK?=
 =?utf-8?B?VDN6aHlxWUszVGthMjBJYnRTMVdSdUdtZWNwM1ZJRUM1bk9qMjE2Y1hqRkwy?=
 =?utf-8?B?UWJaUWNUSkhESVdra3ozTDZrMk9jcHdSRFdLeXo0VmFBb0loWWh5b2xiTGp3?=
 =?utf-8?B?SXFGUXl2TCtjMXdOaDlIdFY0VXZ2YTdFYWkwNWZWOFEwa0xDT0t4ZmhtU0dU?=
 =?utf-8?B?VEZhVmg4M0lxZnV1WktjSUE2V1VnZEFkT0htdVptU0MzdEJoWUFuQ0RlK0ZS?=
 =?utf-8?B?MWREd0JOSFQ5MXA0SGx0S0l3RDBFU2tOSlFGMlg2RGpjOU5MZFdELy9EUXdj?=
 =?utf-8?B?RUVGWHJwSSt3aU5FclluZEFIR1hNZTBCb1RDcFpPUXB6OVg2WDQyM1NWRENp?=
 =?utf-8?B?NXFiU2FhVFZiNGFlTDIwQW4xcGswSjh1amxkS2ExZjF4TjBzSGNZUzdXK1FD?=
 =?utf-8?B?VW1SWUhuTzI5ZWkzNHFtbUZpbTB2MVBjSmxaQ21peFNQTDZoeWRRaVVONTNC?=
 =?utf-8?B?ZFdNSGw3MUY2RlNPZVY0Q2xETUFzWXhubUVXL24rQkFXUC9FNEc3dURINGdq?=
 =?utf-8?B?TEM5Q050S1ZiZ0M2K3RtQnQyTjJheDFKbnhKUVpuSXNDQm1KYUtvZlRPSjRx?=
 =?utf-8?B?ZU5McmZuQzQ1alN5eFZHQTBjYkZUWTdmK3RORDg1ZmQ4YmlUOU5XSkJ0dGVp?=
 =?utf-8?B?aVcwVjJrSkRpcm1HMFJPK2Jtd3ovYU1VTEVLYVhVaVE3OUhmVk5xL1hiUnZl?=
 =?utf-8?B?QnBEbU1pditEYkV3SXRlYnMwNjZ1VmQyN2tNcVRURjJzWHNBdzVTR0I3TTNZ?=
 =?utf-8?B?TTJKT0ttcXNmNlZSY3QwMWFRT2dGQm95L0lNZGl2enIzNUJnMjUrRWNLbUFx?=
 =?utf-8?B?VEo1dnFQQ296dzBRZmZvdkx0aGRiTFNMQTdQSFlyR1kzeWxHYUZCSVRTcjBh?=
 =?utf-8?B?RVlVOUMrcXFhblhMNDBjK3F1S1NTdElKbzJaMTExSWovZkJRc1hxTkYxNkpM?=
 =?utf-8?B?Z2pvTkVLMGw5NkM0S1hYTHZqdDZhMjI5U05mRm0zR2FrM2xhVUpyK3l0UDd1?=
 =?utf-8?B?SjR5cDlXSTVIYk9TNzJjSVh4c3AvVGFZRmRCY2lRc2pvTzdWdk5Ob0Z0KzlP?=
 =?utf-8?B?eUJCN0lCckpJSm5ET2gxd2NsdHNwdU5EUUllQ0NjTVpqL1VBaFFkYk1nN0ox?=
 =?utf-8?B?eEFNc0Y0c2M2NExkWm5wSms2SkJsU0lialQveUx2WllsK1YyQ1RzVEdaN1Zx?=
 =?utf-8?B?U1pFUFlBbHFkNWR3STlmTzV0Tm43TWNuL3NFYmpyVXJZYjljMzMrSWpFQmFs?=
 =?utf-8?B?bXllSWdwOS9nSGJseUNVQXRWa3FVcHNyVmt5RjhHeWZRNytwVzhTY0JtL1FD?=
 =?utf-8?B?d1liOHQyZDNDY0ljbGxOTlNtaUpUcjhqdFZKRkJSQy9sZCs2SGtTWDlDdG1w?=
 =?utf-8?B?Ly9ZeERvc2EwQ1IxNnNyYy9STmtBck0xR0RaT3FXaGIrbjM4YW44ZHpIMnBu?=
 =?utf-8?B?MHduenZvY0RUczdSNU9ucXVJZTZHbnh0WEU4cmRBN3I2cytFOTFvdTNqSEo4?=
 =?utf-8?B?dDJ4K3RqTjNueG1FcFBiaVk1VEVNUG9CYnhTMXZSTVFiWjNSVStSWThIM0pn?=
 =?utf-8?B?bmc0bWpzb2JucFVpazJHL3QwQmxGeThkUXdGanFXQUFIS001Zjk0WngwRzV5?=
 =?utf-8?B?S082Vk8xTGdEZnVVNVc2aDZVR2lDdGExSjd5cXUrR1AzUmg0MGh5bGZHTGtS?=
 =?utf-8?B?MlJibDhHRTdzK2hnWi92ZjJqSXd5djBnbkIxK2FOZWh2cUVROHMzZXNCNzZZ?=
 =?utf-8?B?cGt0QXJkWE94MnNldUNwK25hNHdUanFlMlplR051cENMaGM4M2dPTVhBU01l?=
 =?utf-8?B?SEM1VFVLTXJLVUlBOXVLaklKQm9GSHFPZDdScjF3N1lINnZtMTlZQStKQjJs?=
 =?utf-8?B?Wks5aWNpN3l1dy85S2cvenVObGpoV3RhMU9MTk9jVU5Pd1NTSEhLbS9YZnVC?=
 =?utf-8?Q?FiisF5ggu/fmpSxiLtbXGoP9C?=
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
X-MS-Exchange-CrossTenant-AuthSource: KL1PR06MB6236.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 859d00da-6873-427f-72b9-08de1ac4d9f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2025 10:36:30.5155
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2w9hXTGdGZ8UXIxZ/Y1mFoAt1liHek1xxrUnleOyEfiD61Z1XPqtRABkk1eoGJ6L/g6p+zbeGAwadD8qwjUwdzmZJVvoFXcuPtqBr3gYi4A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6466

DQpUaGFua3MsIEtyenlzenRvZg0KDQpJIHdpbGwgZm9sbG93IHVwIHlvdXIgZGV0YWlsZWQgY29t
bWVudHMuDQoNCkpvYWtpbQ0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206
IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4NCj4gU2VudDogRnJpZGF5LCBP
Y3RvYmVyIDMxLCAyMDI1IDQ6NTkgUE0NCj4gVG86IEpvYWtpbSBaaGFuZyA8am9ha2ltLnpoYW5n
QGNpeHRlY2guY29tPg0KPiBDYzogbGdpcmR3b29kQGdtYWlsLmNvbTsgYnJvb25pZUBrZXJuZWwu
b3JnOyByb2JoQGtlcm5lbC5vcmc7DQo+IGtyemsrZHRAa2VybmVsLm9yZzsgY29ub3IrZHRAa2Vy
bmVsLm9yZzsgcGVyZXhAcGVyZXguY3o7DQo+IHRpd2FpQHN1c2UuY29tOyBsaW51eC1zb3VuZEB2
Z2VyLmtlcm5lbC5vcmc7IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOw0KPiBjaXgta2VybmVs
LXVwc3RyZWFtIDxjaXgta2VybmVsLXVwc3RyZWFtQGNpeHRlY2guY29tPg0KPiBTdWJqZWN0OiBS
ZTogW1BBVENIIFYxIDEvM10gZHQtYmluZGluZ3M6IHNvdW5kOiBhZGQgYmluZGluZyBmb3IgQ0lY
IElQQkxPUQ0KPiBIREEgY29udHJvbGxlcg0KPiANCj4gRVhURVJOQUwgRU1BSUwNCj4gDQo+IE9u
IFRodSwgT2N0IDMwLCAyMDI1IGF0IDA3OjA5OjI2UE0gKzA4MDAsIGpvYWtpbS56aGFuZ0BjaXh0
ZWNoLmNvbQ0KPiB3cm90ZToNCj4gPiBGcm9tOiBKb2FraW0gWmhhbmcgPGpvYWtpbS56aGFuZ0Bj
aXh0ZWNoLmNvbT4NCj4gPg0KPiA+IFRoaXMgcGF0Y2ggYWRkcyBiaW5kaW5nIGZvciBDSVggSVBC
TE9RIEhEQSBjb250cm9sbGVyLg0KPiANCj4gUGxlYXNlIGRvIG5vdCB1c2UgIlRoaXMgY29tbWl0
L3BhdGNoL2NoYW5nZSIsIGJ1dCBpbXBlcmF0aXZlIG1vb2QuIFNlZQ0KPiBsb25nZXIgZXhwbGFu
YXRpb24gaGVyZToNCj4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuMTYvc291
cmNlL0RvY3VtZW50YXRpb24vcHJvY2Vzcy9zdWJtaQ0KPiB0dGluZy1wYXRjaGVzLnJzdCNMOTQN
Cj4gDQo+IFBsZWFzZSB1c2Ugc3RhbmRhcmQgZW1haWwgc3ViamVjdHMsIHNvIHdpdGggdGhlIFBB
VENIIGtleXdvcmQgaW4gdGhlIHRpdGxlLg0KPiAnZ2l0IGZvcm1hdC1wYXRjaCAtdlgnIGhlbHBz
IGhlcmUgdG8gY3JlYXRlIHByb3BlciB2ZXJzaW9uZWQgcGF0Y2hlcy4NCj4gQW5vdGhlciB1c2Vm
dWwgdG9vbCBpcyBiNC4gU2tpcHBpbmcgdGhlIFBBVENIIGtleXdvcmQgbWFrZXMgZmlsdGVyaW5n
IG9mDQo+IGVtYWlscyBtb3JlIGRpZmZpY3VsdCB0aHVzIG1ha2luZyB0aGUgcmV2aWV3IHByb2Nl
c3MgbGVzcyBjb252ZW5pZW50Lg0KPiANCj4gQSBuaXQsIHN1YmplY3Q6IGRyb3Agc2Vjb25kL2xh
c3QsIHJlZHVuZGFudCAiYmluZGluZyBmb3IiLiBUaGUgImR0LWJpbmRpbmdzIg0KPiBwcmVmaXgg
aXMgYWxyZWFkeSBzdGF0aW5nIHRoYXQgdGhlc2UgYXJlIGJpbmRpbmdzLg0KPiBTZWUgYWxzbzoN
Cj4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuMTctDQo+IHJjMy9zb3VyY2Uv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3N1Ym1pdHRpbmctcGF0Y2hlcy5yc3Qj
TDE4DQo+IA0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogSm9ha2ltIFpoYW5nIDxqb2FraW0uemhh
bmdAY2l4dGVjaC5jb20+DQo+ID4gLS0tDQo+ID4gIC4uLi9iaW5kaW5ncy9zb3VuZC9jaXgsaXBi
bG9xLWhkYS55YW1sICAgICAgICB8IDY5ICsrKysrKysrKysrKysrKysrKysNCj4gPiAgMSBmaWxl
IGNoYW5nZWQsIDY5IGluc2VydGlvbnMoKykNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+ID4g
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL2NpeCxpcGJsb3EtaGRhLnlh
bWwNCj4gPg0KPiA+IGRpZmYgLS1naXQNCj4gPiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9zb3VuZC9jaXgsaXBibG9xLWhkYS55YW1sDQo+ID4gYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3Mvc291bmQvY2l4LGlwYmxvcS1oZGEueWFtbA0KPiA+IG5ldyBmaWxl
IG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi5hNDI4NWQxZTAzMTkNCj4gPiAt
LS0gL2Rldi9udWxsDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3NvdW5kL2NpeCxpcGJsb3EtaGRhLnlhbWwNCj4gDQo+IEZpbGVuYW1lIG11c3QgbWF0Y2ggdGhl
IGNvbXBhdGlibGUuIFNlZSB3cml0aW5nIGJpbmRpbmdzIGRvYy4NCj4gDQo+ID4gQEAgLTAsMCAr
MSw2OSBAQA0KPiA+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9S
IEJTRC0yLUNsYXVzZSkgJVlBTUwgMS4yDQo+ID4gKy0tLQ0KPiA+ICskaWQ6IGh0dHA6Ly9kZXZp
Y2V0cmVlLm9yZy9zY2hlbWFzL3NvdW5kL2NpeCxpcGJsb3EtaGRhLnlhbWwjDQo+ID4gKyRzY2hl
bWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIw0KPiA+ICsN
Cj4gPiArdGl0bGU6IENJWCBJUEJMT1EgSERBIGNvbnRyb2xsZXINCj4gPiArDQo+ID4gK2Rlc2Ny
aXB0aW9uOiB8DQo+IA0KPiBEbyBub3QgbmVlZCAnfCcgdW5sZXNzIHlvdSBuZWVkIHRvIHByZXNl
cnZlIGZvcm1hdHRpbmcuDQo+IA0KPiA+ICsgIENJWCBJUEJMT1EgSGlnaCBEZWZpbml0aW9uIEF1
ZGlvIChIREEpIENvbnRyb2xsZXIgZHJpdmVyLg0KPiANCj4gZHJpdmVyIGFzIGluIExpbnV4IGRy
aXZlcj8gTm8sIHBsZWFzZSBkZXNjcmliZSBoZXJlIGJyaWVmbHkgaGFyZHdhcmUuDQo+IA0KPiA+
ICsNCj4gPiArbWFpbnRhaW5lcnM6DQo+ID4gKyAgLSBKb2FraW0gWmhhbmcgPGpvYWtpbS56aGFu
Z0BjaXh0ZWNoLmNvbT4NCj4gPiArDQo+ID4gK3Byb3BlcnRpZXM6DQo+ID4gKyAgY29tcGF0aWJs
ZToNCj4gPiArICAgIGNvbnN0OiBjaXgsc2t5MS1pcGJsb3EtaGRhDQo+ID4gKw0KPiA+ICsgIHJl
ZzoNCj4gPiArICAgIG1heEl0ZW1zOiAxDQo+ID4gKw0KPiA+ICsgIGludGVycnVwdHM6DQo+ID4g
KyAgICBkZXNjcmlwdGlvbjogVGhlIGludGVycnVwdCBmcm9tIHRoZSBIREEgY29udHJvbGxlcg0K
PiANCj4gRHJvcCBkZXNjcmlwdGlvbiwgb2J2aW91cy4gQ2Fubm90IGJlIGFueXRoaW5nIGVsc2Uu
DQo+IA0KPiA+ICsgICAgbWF4SXRlbXM6IDENCj4gPiArDQo+ID4gKyAgY2xvY2tzOg0KPiA+ICsg
ICAgbWF4SXRlbXM6IDINCj4gDQo+IFlvdSBzaG91bGQgbGlzdCB0aGUgaXRlbXMgaW5zdGVhZCB3
aXRoIGRlc2NyaXB0aW9uLg0KPiANCj4gPiArDQo+ID4gKyAgY2xvY2stbmFtZXM6DQo+ID4gKyAg
ICBtYXhJdGVtczogMg0KPiANCj4gTm8sIHlvdSBuZWVkIHRvIGxpc3QgdGhlIGl0ZW1zLiBUaGVy
ZSBpcyBubyBzeW50YXggbGlrZSB0aGF0Lg0KPiANCj4gPiArDQo+ID4gKyAgcmVzZXRzOg0KPiA+
ICsgICAgbWF4SXRlbXM6IDENCj4gPiArDQo+ID4gKyAgcmVzZXQtbmFtZXM6DQo+ID4gKyAgICBt
YXhJdGVtczogMQ0KPiANCj4gTm8sIHlvdSBuZWVkIHRvIGxpc3QgdGhlIGl0ZW1zLg0KPiANCj4g
PiArDQo+ID4gKyAgY2l4LG1vZGVsOg0KPiA+ICsgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFt
bCMvZGVmaW5pdGlvbnMvc3RyaW5nDQo+IA0KPiBVc2Ugc3RhbmRhcmQgcHJvcGVydGllcywgc2Vl
IG90aGVyIGJpbmRpbmdzLiBNYXliZSBvbmVzIGZyb20NCj4gZ2VuZXJpYy9zaW1wbGUgYXVkaW8g
Y2FyZCBmaXQuDQo+IA0KPiANCj4gPiArICAgIGRlc2NyaXB0aW9uOiB8DQo+IA0KPiBEbyBub3Qg
bmVlZCAnfCcgdW5sZXNzIHlvdSBuZWVkIHRvIHByZXNlcnZlIGZvcm1hdHRpbmcuDQo+IA0KPiA+
ICsgICAgICBUaGUgdXNlci12aXNpYmxlIG5hbWUgb2YgdGhpcyBzb3VuZCBjb21wbGV4LiBJZiB0
aGlzIHByb3BlcnR5IGlzDQo+ID4gKyAgICAgIG5vdCBzcGVjaWZpZWQgdGhlbiBib2FyZHMgY2Fu
IHVzZSBkZWZhdWx0IG5hbWUgcHJvdmlkZWQgaW4gaGRhIGRyaXZlci4NCj4gPiArDQo+ID4gK3Jl
cXVpcmVkOg0KPiA+ICsgIC0gY29tcGF0aWJsZQ0KPiA+ICsgIC0gcmVnDQo+ID4gKyAgLSBpbnRl
cnJ1cHRzDQo+ID4gKyAgLSBjbG9ja3MNCj4gPiArICAtIGNsb2NrLW5hbWVzDQo+ID4gKyAgLSBy
ZXNldHMNCj4gPiArICAtIHJlc2V0LW5hbWVzDQo+ID4gKw0KPiA+ICthZGRpdGlvbmFsUHJvcGVy
dGllczogZmFsc2UNCj4gPiArDQo+ID4gK2V4YW1wbGVzOg0KPiA+ICsgIC0gfA0KPiA+ICsgICAg
I2luY2x1ZGU8ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvYXJtLWdpYy5oPg0KPiA+
ICsNCj4gPiArICAgIGF1ZHNzX2lwYl9oZGE6IGlwYi1oZGFANzBjMDAwMCB7DQo+IA0KPiBOb2Rl
IG5hbWVzIHNob3VsZCBiZSBnZW5lcmljLiBTZWUgYWxzbyBhbiBleHBsYW5hdGlvbiBhbmQgbGlz
dCBvZiBleGFtcGxlcw0KPiAobm90IGV4aGF1c3RpdmUpIGluIERUIHNwZWNpZmljYXRpb246DQo+
IGh0dHBzOi8vZGV2aWNldHJlZS1zcGVjaWZpY2F0aW9uLnJlYWR0aGVkb2NzLmlvL2VuL2xhdGVz
dC9jaGFwdGVyMi0NCj4gZGV2aWNldHJlZS1iYXNpY3MuaHRtbCNnZW5lcmljLW5hbWVzLXJlY29t
bWVuZGF0aW9uDQo+IElmIHlvdSBjYW5ub3QgZmluZCBhIG5hbWUgbWF0Y2hpbmcgeW91ciBkZXZp
Y2UsIHBsZWFzZSBjaGVjayBpbiBrZXJuZWwNCj4gc291cmNlcyBmb3Igc2ltaWxhciBjYXNlcyBv
ciB5b3UgY2FuIGdyb3cgdGhlIHNwZWMgKHZpYSBwdWxsIHJlcXVlc3QgdG8gRFQNCj4gc3BlYyBy
ZXBvKS4NCj4gDQo+IGUuZy4gc291bmQgb3Igc291bmQtY2FyZC4gTWF5YmUgaGRhLCBpZiBpdCBp
cyBrbm93biBlbm91Z2guDQo+IA0KPiBBbHNvIGRyb3AgdW51c2VkIGxhYmVsLg0KPiANCj4gQmVz
dCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCg0K
