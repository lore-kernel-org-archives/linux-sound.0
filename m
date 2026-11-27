Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.5
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795760802;
	b=RWTCnYYNa0ltqTMkniA4vPR6eV6+JRQRC+xz9wLQXqR3WvlKJ5m0WIFlRxd76w9mW6V6
	 SdJB+0IUGgoMzeDnTKbaNjrnFIO5ZJndfPWyeoY7Q0kN4J4hsDXMmggcoGkzgym2qkdGS
	 q8/mxZWG29QIQ/0z1NmJdetsFpbGFPUhoPYN6qUNzX/lqMfD+T0XbdncZf7HM+38fq8r1
	 X9NjvTYEhVxFXqeXYk/TYDTMsf5wh/Fy0sy8+/Q7jj6MBbdEiD2YloVptBF46+eSdYos/
	 7NMajMy1Cq3OtmhYXOPvmY2JuF9vwCooicR6VwBfj3+E1nIDQTAt37jmN1vjtq6QhQg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795760802;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 msip_labels:x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=BoYcgk0YYUJ5YHlRo5+tqxCota3V2g+Scwg7NgZqE98=;
	b=manjh7D6SopquM6Ito+HFjs4UjT9IIWG1hWYitYWV6OkpCbvPA1sXW2FRkongSdAqSx+
	 3YbUTo56YSthv2ugbnjmU+gcphIPbOXU3uozVesVa41G81JMHZ308ared6hGCCjOXQUt0
	 NA9FVuwnibn4zXdOKEIrOkoNKG+gcgLKS0WtpLxcjp1uuwLUYWloKBayuKgIP7e7C+vM8
	 P9OrHxwrZkGpuJ6BCSGP/WWaE2QgCbPiFgPXdwW1VRRsp9zA6bypxKovv6bJ2gafa65lp
	 hjrB+L72XtHAJhvO780tReGXtxdw3P9lP4O10zgEFvHLDLUHefdMvflY1ELoD7kua5Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=nhjEjMNj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.5
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011005.outbound.protection.outlook.com [40.93.194.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7BE606A321;
	Fri, 27 Nov 2026 06:26:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B7BE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=nhjEjMNj
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qNuq+qepyHTOQ75WcO1p0bIKSO//XlYTGkCqgHtyKpYwM5j0q9xTThm2fNikneDs0R8aNDVTERuCjfTBuStRi8divVw5+M2MMWvIjF/hCFwdM03H/YGE66hXx8LCjDzcFgF8k2aiBGSKYWzQ52mKmP6iBE3qy7NeE9fbvFIg4y3xP71sr/stjgrSqgnixcj4awTNzRwSk5KLnjMntaTARnPPygbHN7lb9vwHSwcaLwefK6Hk5B7ZfqA8+alpWy/L59FQDP4BCSVHQD3emT+gH8N1GUT2Erkp9KCiieenpVOmX2/K0o0v1iTAZ0OZ4B0BO3RIchlsZaA/qiGmTdQsng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BoYcgk0YYUJ5YHlRo5+tqxCota3V2g+Scwg7NgZqE98=;
 b=J+v28MEMVALiQiqFvXyMvys2sMkbYNMVcTXE4Q0TIHiI6YXyN2BdbKlDO0xvpGH/s0IS3vUOzBo94KxMlALFQ3Mv9eElvlsZz6CQ87FBdRViNoy881XmaFO36cfp629OIkK0H0kgAN/2r0swG8mEf+BR29nDYL45JS0fCkF28oCJbpWpA7u5HMd1/b02g8gOcfCrlbr86UpmHmTZNJxlvdjUFtaHFx4HS7evyXuFJhA0uN7i4iaj+Ar+9ojbw0n2kO7AMl1hOoSWhFpvEy73eddfLymdveUJ16saCYx7nrz3daOaw3rMrjHRJF+8TMKf79bJBkOlk6eIllAb6j40TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BoYcgk0YYUJ5YHlRo5+tqxCota3V2g+Scwg7NgZqE98=;
 b=nhjEjMNj701bxuhGvd097U2g8e6ycTx6ALQski/qaG+9W9Qq9+IT9L3yWIL+y1WB8sus+g+B5chdyZHKMM+f4YgAqBmI0dB4RSZ+Rho4XCuK9huSjnN3Hxat4QHxN6wfP4rLSDKclzxAwpg7wJ1eN9MzoRAYM6A4uOjc5+rzYGU=
Received: from LV0PR12MB999067.namprd12.prod.outlook.com
 (2603:10b6:408:32d::16) by PH8PR12MB999320.namprd12.prod.outlook.com
 (2603:10b6:510:42f::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Fri, 27 Nov
 2026 06:26:37 +0000
Received: from LV0PR12MB999067.namprd12.prod.outlook.com
 ([fe80::890c:eb6c:aca0:c0cc]) by LV0PR12MB999067.namprd12.prod.outlook.com
 ([fe80::890c:eb6c:aca0:c0cc%5]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 06:26:36 +0000
From: "Dhanunjanrao, Katta" <katta.dhanunjanrao@amd.com>
To: Mark Brown <broonie@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Vincenzo Frascino
	<vincenzo.frascino@arm.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jaroslav
 Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Simek, Michal"
	<michal.simek@amd.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "Gaddipati, Naveen"
	<naveen.gaddipati@amd.com>
Subject: RE: [PATCH 3/4] ASoC: xlnx: formatter: set a 64-bit DMA mask
Thread-Topic: [PATCH 3/4] ASoC: xlnx: formatter: set a 64-bit DMA mask
Thread-Index: AQHdfNMa5ZaHug3hY0KQ/e7HRUWIELdApBOAgADHWbA=
Date: Fri, 27 Nov 2026 06:26:36 +0000
Message-ID:
 <LV0PR12MB99906706ABE35C8AEAE31ECEDE99412@LV0PR12MB999067.namprd12.prod.outlook.com>
References: <20261125114839.3642735-1-katta.dhanunjanrao@amd.com>
 <20261125114839.3642735-4-katta.dhanunjanrao@amd.com>
 <179571553180.142532.15022384187541501041.b4-review@b4>
In-Reply-To: <179571553180.142532.15022384187541501041.b4-review@b4>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-11-27T05:45:41.0000000Z;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD
 General
 v26;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=3;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV0PR12MB999067:EE_|PH8PR12MB999320:EE_
x-ms-office365-filtering-correlation-id: 7629dc2c-c5bb-41b4-b4b7-08df4c4f6389
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|366016|38070700021|56012099006|10067099003|11063799006|261022113327099003|261022075727099003|261028144727099003|261022105027099003|261026121527099003|261102123227099003|261021121427099003|261026140227099003|261009223027099003|22082099003|18002099003|4143699003;
x-microsoft-antispam-message-info:
 SAT5YXBO4jn1G2D0tl3arLSZKEsG8Tk4inU1N+9HeHqkByiLrxIPLNxzE69kXu+Do0JpzUJsvqGXDHoe2XmIGPmJdsnKjhjOolby261fnrh0ukFaczGoLCLuyYme5BcZay05pX3UUeZXEUWIiyfd4fvLfnYQ0G/pK3Gr0mN6xJqr8S0LX7pN9dmmT1c3AUjOBnCW2aTuFrXxAhNE8a/M59IdXcIiDOzFjem7AaaJTLqmPxz6OyzrvW5KumxkSdyDaxHC9ay2yTRYETZ6wjr+1cz5dSFkE1o8Ocrr42HLCPCji3K0wVEFs0XXfp/qM85saE6Uk/cRKi0OoSSKnAAeWX7FUDKP3m5SuORJi2nD2QJZrMtFJApHae2dXhCp3Yw8nPQV7cUwdwkjYg9yBJ20Ig089xZFmI+hX820I9LQuFlh7TGyubOgINNgXKXcXfKiZnXdKQEl/GufJ+M6PPgB5PHgHA5IPPqN62tpQ3lpZDpRWQYclr1rZENnnryvmZH4kPH3DjCk7IOehOLket4CspEOR5ognPMXzjVbclNWdcHYZ8fxBgq6DULjUFVllqxDzC+HCC03o5XLnuztJBD9v6opF0YEfgm1q0i2lbfFrhuOQ+H20lq9UH8uudQtWjPT0/lafrqfVICXj9KbS7HM7EydRPkwMfIKIkHyHOHd1tVAsh/wWuoR+DYLrMxpg6YjDU1CWnWRrf2n0a4a3meMKv3w8XNM0vIIqZBvt5FLkLY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV0PR12MB999067.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(366016)(38070700021)(56012099006)(10067099003)(11063799006)(261022113327099003)(261022075727099003)(261028144727099003)(261022105027099003)(261026121527099003)(261102123227099003)(261021121427099003)(261026140227099003)(261009223027099003)(22082099003)(18002099003)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?a095Q3kvRWJnM0Y3S0dGRlJwdmJCRkFHYXVGN2Q1cHVpTjZhUVZ4SHhSR08r?=
 =?utf-8?B?RG13akVPMlNQQ0NvK2JrRWk2L0w2VUc4WThuK2dQbThQYTYxMTVDUmp2Z1RC?=
 =?utf-8?B?R0c1UnM3YWZpSDFrOGgvcXNuaWlyKzNRMUdGVTd2M0lOcWp5NkZzNlBlZDlC?=
 =?utf-8?B?SzZGRm4wMFZZbTVKekNUVWM4S1l2SktKSDlLUDc5WWIyK1RkaTBScG5CSjVX?=
 =?utf-8?B?VkxveERqcENsZTFiWTRuOXVDbXNSZXcwZ0V4b2tNSm5zaEtTd29zdXNnc0pq?=
 =?utf-8?B?N2MwK0JNTWNnMWUzYzJnUWZCZlFabFdvaEpHUlNnNmlWNmM0QkpOanlsUExP?=
 =?utf-8?B?TnVzeWhqcVRBUmlWM3hkcEt6ZDRUQkhQQ09VUVpoMEhlcFFGRG5ka1MzTzVQ?=
 =?utf-8?B?WVlFZnRkbXZiVlppNjNIT2lXRktFMmVrTEI2aDhHb1Z2K1ZaR1ZCa2haMHg4?=
 =?utf-8?B?VDM5SFE4ZlRSc09NR1RjQ0FWZDlhVmxZNkVBWWVNY0lzVHZaS3dPa0xIMWR3?=
 =?utf-8?B?a2FWSHY3Tk5PdUw1MlEyaWVGNzcveVpJNHVvYkJCbDVNNlhxejdnaFhRS3Qv?=
 =?utf-8?B?MkQxYXdCcm10R3FYZXAvb0VyN21qRy92K3BKNzJkdGFiSU5LdFloN1RYaTJO?=
 =?utf-8?B?QzBGQTZVZ2J0OGpMaU1Eb0Y0UU8xWFA5bkxGcU92T1VtckJNWmVyOUdMWk5H?=
 =?utf-8?B?RGhiUTEvVU1pYTdQUnhoOWhDUVBjK0M2Q1hBV1Nsd21aR3ROUWhJRCtLWm1r?=
 =?utf-8?B?SjI1SHBxUWlVUDl0L1lpWnY4cG5iR3lxQnZQRTBudW90cXdvQlBsRGs3WUdk?=
 =?utf-8?B?bGJRRFdvS0lxeHZGMExjdlBZMGNjVGNxaVRScEdmM0tRaGlNVlQxVzZTVGRY?=
 =?utf-8?B?ZEtQZThvdXpYcld5YzNDK0xHZDhOeUxUMkxvRWNVQ1ZEcURNaE9CVFgva1JS?=
 =?utf-8?B?cFlycjBhK2dScVltRXN2a1YxN2Q3YnVzQXJ0L0lTVkU5KzQ0QTdrZWtnWVNO?=
 =?utf-8?B?OUJNalNwTGFHa1RwZVNOYklDVDdJTmNyRFhMblpwclk4VmdyaERHTC9QKy9l?=
 =?utf-8?B?d2dpUWlaUXRYdjY5QktEcmlMRUtvVENHTTZtUFVQcWVqS2dnbm5aZS9MUmJK?=
 =?utf-8?B?cFhrVXRUdDNpMVFiT1VXb0VqeUZ3cTdVb3pDNi8rbkZtR1RYQlJtVzNsdlhD?=
 =?utf-8?B?WVdBbHd0a29aQlhBY3Jqd3Q1TFo4Z2JzVS9kRTlySWxib243b3grVDFRclJE?=
 =?utf-8?B?WGNLY2VqUzhYOEVNajhvb1FGVWpHaUtvTmF6QTFVVFI3b1BTOGhDV0lDUU5p?=
 =?utf-8?B?R0ZlZ3hmS1NJQ2cxODlIUWJKeXl0TkhvZ2RBMm02MTRzcWJCcjJlWFY2WlFB?=
 =?utf-8?B?OHN1R1U5dUppL3NPV2p4aTdCRFZZNjNjYU0yalF2Q1lWa0FJc2JjVWMxY1NZ?=
 =?utf-8?B?NFVGK0lzTXBWYS9ZendUYTNYNFFZOEFlRkxLbWluVFJzR3JCd1pxUkxIV04v?=
 =?utf-8?B?WHpZaHg0dGd5emRqVWIwMDlmTDNQM1lzN2RnRDVxbEpFQ3FHcXB1dDhVMWtI?=
 =?utf-8?B?YTJXNkoveHlJVjFlOVkvbHZDMXlJdDV3SWZveU90UUJ0eHZyUHhoL1JRdkcw?=
 =?utf-8?B?MVprUmoxT2NzQm9EeGQ5MFNBUXEyUXUxQXBTUjZ0aEFRTS9RUHFIZnExQmhp?=
 =?utf-8?B?UzdqdVdibnBOcFZzSzZkZW1mRlZwU3FuSWpCcWRRMFJCMzEzcGRZYWtjdm1H?=
 =?utf-8?B?VUJFbWRZZjFMeWp5VURJV3VoUmlUN2ozYmJoczRrdERIRmNuYUhHMlR2bUlS?=
 =?utf-8?B?WDNFMFU5Z1orSnZLNllpM1dhQ1hLY2VFdnBMLzgyaXk0SlhPa1Ryb3p2YkpS?=
 =?utf-8?B?VXcrQ2gxUlE0L3Q2Z2w4NlBTYUdOVWRsVTN5UXFrZm5OL2l0Z1R6TTc2SzRa?=
 =?utf-8?B?cHpkekxjSVh3OVpTbit3S3NoeG5Lb0h4THFIcFNZazd5cHA0Zk9kZWJEQklT?=
 =?utf-8?B?TU9QMUlmOUdLQnlkM3R6dDRVYWw1SkRNT3B3dGh0WGNIemdNR0djeTRkd3d4?=
 =?utf-8?B?STJmNDNVbkhGVkhKdlpVUHVQMy9DU1FGZ2FqZUtLNW0zaWJrdnUySkowcmhZ?=
 =?utf-8?B?UVQ1T3RoeWd3U1dOSS9ZSUFyWjRvalhSQkptQmJDNFloUERoNnprcmFIcDRZ?=
 =?utf-8?B?TnZmTEl3RHhWOURkcGFhTSswVzNsUTV1a0JPb0ZwWWpEYkFRTzVoc20vbG14?=
 =?utf-8?B?VUFYSnFvK25DUkJxakdRbWZEeTBsaU54a3l2bGZrSy9sYStSOS92Q2I2YWZX?=
 =?utf-8?Q?qIskzxsfke7B/4wgkK?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV0PR12MB999067.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7629dc2c-c5bb-41b4-b4b7-08df4c4f6389
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2026 06:26:36.5738
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: poEQodocNE1LN1hnq74eE4C8nOAeg82ypDDthsfnGS2uOabyqytHgvtXhOW1BFHu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB999320

QU1EIEdlbmVyYWwNCg0KSGkgTWFyaywNCg0KVGhhbmsgeW91IGZvciB0aGUgcmV2aWV3Lg0KSSB3
aWxsIGFkZHJlc3MgdGhlIHJldmlldyBjb21tZW50cyBhbmQgc2VuZCBhbiB1cGRhdGVkIHZlcnNp
b24uDQoNClRoYW5rcywNCkRoYW51bmpheQ0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
RnJvbTogTWFyayBCcm93biA8YnJvb25pZUBrZXJuZWwub3JnPg0KU2VudDogVGh1cnNkYXksIE5v
dmVtYmVyIDI2LCAyMDI2IDExOjIyIFBNDQpUbzogRGhhbnVuamFucmFvLCBLYXR0YSA8a2F0dGEu
ZGhhbnVuamFucmFvQGFtZC5jb20+DQpDYzogTWFyayBCcm93biA8YnJvb25pZUBrZXJuZWwub3Jn
PjsgTGlhbSBHaXJkd29vZCA8bGdpcmR3b29kQGdtYWlsLmNvbT47IFZpbmNlbnpvIEZyYXNjaW5v
IDx2aW5jZW56by5mcmFzY2lub0Bhcm0uY29tPjsgUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9y
Zz47IEtyenlzenRvZiBLb3psb3dza2kgPGtyemsrZHRAa2VybmVsLm9yZz47IENvbm9yIERvb2xl
eSA8Y29ub3IrZHRAa2VybmVsLm9yZz47IEphcm9zbGF2IEt5c2VsYSA8cGVyZXhAcGVyZXguY3o+
OyBUYWthc2hpIEl3YWkgPHRpd2FpQHN1c2UuY29tPjsgU2ltZWssIE1pY2hhbCA8bWljaGFsLnNp
bWVrQGFtZC5jb20+OyBsaW51eC1zb3VuZEB2Z2VyLmtlcm5lbC5vcmc7IGRldmljZXRyZWVAdmdl
ci5rZXJuZWwub3JnOyBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4
LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IEdhZGRpcGF0aSwgTmF2ZWVuIDxuYXZlZW4uZ2FkZGlw
YXRpQGFtZC5jb20+DQpTdWJqZWN0OiBSZTogW1BBVENIIDMvNF0gQVNvQzogeGxueDogZm9ybWF0
dGVyOiBzZXQgYSA2NC1iaXQgRE1BIG1hc2sNCg0KPiBod19wYXJhbXMgc3BsaXRzIHRoZSByaW5n
IGJ1ZmZlciBhZGRyZXNzIG92ZXIgdGhlIExTQiBhbmQgTVNCIGJ1ZmZlcg0KPiBhZGRyZXNzIHJl
Z2lzdGVycywgYnV0IHRoZSBkZXZpY2UgaXMgbGVmdCBvbiB0aGUgZGVmYXVsdCAzMi1iaXQgbWFz
ay4NCj4gVGhlIGNvaGVyZW50IGJ1ZmZlciB0aGVyZWZvcmUgYWx3YXlzIGNvbWVzIGZyb20gYmVs
b3cgNEcgYW5kIHRoZSBNU0INCj4gcmVnaXN0ZXIgaXMgb25seSBldmVyIHdyaXR0ZW4gYXMgemVy
by4NCj4NCj4gU2V0IGEgNjQtYml0IG1hc2sgc28gdGhlIGJ1ZmZlciBjYW4gc2l0IGluIGhpZ2gg
bWVtb3J5IGFzIHdlbGwuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IERoYW51bmphbnJhbyBLYXR0YSA8
a2F0dGEuZGhhbnVuamFucmFvQGFtZC5jb20+DQo+IC0tLQ0KPiAgc291bmQvc29jL3hpbGlueC94
bG54X2Zvcm1hdHRlcl9wY20uYyB8IDYgKysrKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNl
cnRpb25zKCspDQo+DQo+IGRpZmYgLS1naXQgYS9zb3VuZC9zb2MveGlsaW54L3hsbnhfZm9ybWF0
dGVyX3BjbS5jDQo+IGIvc291bmQvc29jL3hpbGlueC94bG54X2Zvcm1hdHRlcl9wY20uYw0KPiBp
bmRleCBmYTc0MTk0MzllYzcuLjU3OTAxYzk0NjZhMCAxMDA2NDQNCj4gLS0tIGEvc291bmQvc29j
L3hpbGlueC94bG54X2Zvcm1hdHRlcl9wY20uYw0KPiArKysgYi9zb3VuZC9zb2MveGlsaW54L3hs
bnhfZm9ybWF0dGVyX3BjbS5jDQo+IEBAIC04LDYgKzgsNyBAQA0KPg0KPiAgI2luY2x1ZGUgPGxp
bnV4L2JpdGZpZWxkLmg+DQo+ICAjaW5jbHVkZSA8bGludXgvY2xrLmg+DQo+ICsjaW5jbHVkZSA8
bGludXgvZG1hLW1hcHBpbmcuaD4NCj4gICNpbmNsdWRlIDxsaW51eC9pby5oPg0KPiAgI2luY2x1
ZGUgPGxpbnV4L21vZHVsZS5oPg0KPiAgI2luY2x1ZGUgPGxpbnV4L3NpemVzLmg+DQo+IEBAIC01
OTgsNiArNTk5LDExIEBAIHN0YXRpYyBpbnQgeGxueF9mb3JtYXR0ZXJfcGNtX3Byb2JlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICAgICAgIHN0cnVjdCBkZXZpY2UgKmRldiA9ICZw
ZGV2LT5kZXY7DQo+ICAgICAgIHN0cnVjdCBjbGsgKmF4aV9jbGssICphdWRfbWNsaywgKmF4aXNf
Y2xrOw0KPg0KPiArICAgICByZXQgPSBkbWFfc2V0X21hc2tfYW5kX2NvaGVyZW50KGRldiwgRE1B
X0JJVF9NQVNLKDY0KSk7DQoNCklzIHRoaXMgYWx3YXlzIHNhZmUsIGNhbiB3ZSBoYXZlIGluc3Rh
bmNlcyByZXN0cmljdGVkIHRvIDMyIGJpdHM/DQpZZXMsIHNvbWUgaW5zdGFuY2VzL3BsYXRmb3Jt
cyBjYW4gYmUgbGltaXRlZCB0byAzMi1iaXQgRE1BIGFkZHJlc3NpbmcuIEnigJlsbCBjaGVjayB0
aGUgYWRkcmVzc2luZyBjYXBhYmlsaXR5IG9mIHRoZSBBdWRpbyBGb3JtYXR0ZXIgYW5kIG1ha2Ug
c3VyZSB3ZSBkb27igJl0IHVuY29uZGl0aW9uYWxseSBhc3N1bWUgNjQtYml0IERNQSBzdXBwb3J0
Lg0KDQotLQ0KTWFyayBCcm93biA8YnJvb25pZUBrZXJuZWwub3JnPg0K
