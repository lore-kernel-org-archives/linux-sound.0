Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023092.outbound.protection.outlook.com [52.101.127.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FDA1C5D6A;
	Fri, 28 Nov 2025 13:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764337572; cv=fail; b=KxbgZuXl65Dyh4JaW6KtMhnjopX3dnVH3XIkHJrZp9rHoWTKBegdG9mHOHNCt2eID96AqJesDzpTovCjr2ZBpmJSWDPI36QpGeUkP6azJbGU+ZwYPVqKvXKJ7JBspK1Fkhfgvoz/4ZgEQcOFnSnP/6sNkCKghHs+NI15HNm5JLw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764337572; c=relaxed/simple;
	bh=mNOGsouRPaeOIUokcrsBx9smofNRciZ55/He2QiAHfI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GxxiyJ4IXIVjWPu+el+YlaYp83J1otthXYZJ1vPf0nBI745+oa6t/L/5nCf2gVA+n+WyYTo4WnJVnvWj7qb4jC9esaCc9yLtPb+BELmSh4b/s8b6+KiUdpopyCo/YoqovoZ4LQPaoaKPLZaMOsnLUsNY3Kj0tEtDDZU1FwMF0mA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.127.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jOeWLg0Th3rfCuHL7Uez/1MKiRUyjvXhpgMbmbADaV26PSNO5W+jwXkavhjCdx72gDbpcqIrx0XWS1EfreoL37/rMYjZuHFnBmxV6wbf5xJH7zZBWAmWla0dSMoSreIKjeWtDXk9OL7567QDnd71Z8n0UMUF+HpXBeVH6bfmOhVMsBtgJerGf2RTj3+fr7d4kuKfb0oHoEbFKL8gFn5vJwpT0OLrQZfQN6WNrQ+hjkaOazxQi5zIgQ+UMimcBc37uFio6M6kK7cKJZ0CJGM0OnNSnevUBnpM003F+mjua9Z+VxIM1uUQndgX8mNuFzRLS2mc1zKU5/J6FALr6jwsag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mNOGsouRPaeOIUokcrsBx9smofNRciZ55/He2QiAHfI=;
 b=GZqB+PrTzasVaeK226tZKFuKzJ3BSfU4VKC6FjZEpIKabWUM9z+Sk0XoBZYumRKOK/J6uIk2uRjGzLOkNYg8XgCcy0FNBJlpUzGbWMcNW2jkX9qO33eBxxETAyOkShC+9NdUqQtG0Jy49Xb5xixIEEmnfDSYC+wnI37uUQ6LDArpuWQWpps82PkilJKeB3djFKGtbkYVyCBeily+1FI3f1RbHbYpx5P4Y1F7zDGYA387MZjfHUgAQcdV4TNALAYb6Xib0OtfaNlUMVmtbvb2TbS67eDnRrrvidizo/Bl5BLF8tpE5JLXCi1QJRsulpv2HLmzvB0mex/jbWVODk9lqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from SEYPR06MB6226.apcprd06.prod.outlook.com (2603:1096:101:df::13)
 by JH0PR06MB6721.apcprd06.prod.outlook.com (2603:1096:990:3e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Fri, 28 Nov
 2025 13:46:05 +0000
Received: from SEYPR06MB6226.apcprd06.prod.outlook.com
 ([fe80::56e8:777c:d80e:d364]) by SEYPR06MB6226.apcprd06.prod.outlook.com
 ([fe80::56e8:777c:d80e:d364%5]) with mapi id 15.20.9366.009; Fri, 28 Nov 2025
 13:46:05 +0000
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
Thread-Index:
 AQHcX4I/rWYXEfmiWkK1OjlzuYyFLbUH03+AgAACkFCAAA6QgIAAGa+QgAAGTACAAAs44IAACe4AgAABflA=
Date: Fri, 28 Nov 2025 13:46:05 +0000
Message-ID:
 <SEYPR06MB6226B8044465896C912C7A7682DCA@SEYPR06MB6226.apcprd06.prod.outlook.com>
References: <20251127094301.4107982-1-joakim.zhang@cixtech.com>
 <20251127094301.4107982-2-joakim.zhang@cixtech.com>
 <20251128-fearless-kittiwake-from-arcadia-662dbc@kuoka>
 <SEYPR06MB6226157DB7A5D5486500063A82DCA@SEYPR06MB6226.apcprd06.prod.outlook.com>
 <f9ce51ce-6fe9-4612-9be3-552736ea19a7@kernel.org>
 <SEYPR06MB62266F00FF610A9506807A3282DCA@SEYPR06MB6226.apcprd06.prod.outlook.com>
 <679b49b8-c965-4bee-943c-2e2af7e4d8fe@kernel.org>
 <SEYPR06MB6226B5A5CDEE8F917B86A3A082DCA@SEYPR06MB6226.apcprd06.prod.outlook.com>
 <b54d9584-4de4-4c7a-ae12-73fab6d02e19@kernel.org>
In-Reply-To: <b54d9584-4de4-4c7a-ae12-73fab6d02e19@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB6226:EE_|JH0PR06MB6721:EE_
x-ms-office365-filtering-correlation-id: 4d538017-2b3a-45ae-0b2b-08de2e847a45
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|10070799003|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?RGk2WnR5U3NlV1g0ZXFmYWVIWURpY1U1QnROTzBXbzNRdTVQdjNPTExLcFgz?=
 =?utf-8?B?bFd1bkM1K1huWDlVcDlKZXdWbFd0TWJrSzk0S3FhbWdjMzEzb0FNL3BidUVJ?=
 =?utf-8?B?MEtkMFVSa3IxeEJZTkhSRUlUYmNiU2Q4bll4L3o1ZTVxdE0xTjJxcVhkbzZx?=
 =?utf-8?B?VlIxQmEwYVBGWUI1bkV4RTFuM0VRQjY2V1c3UU15WXZKSUVDckxMa1I1SnQ2?=
 =?utf-8?B?SlRwNWZrVEhOdzM2Vm52NzZlb1FraElMV1MzeTNnNVpuTEpCak0vMTlPNEsy?=
 =?utf-8?B?QS95NS9tSmZtaW9neWh1QjRacnlzMDdwR0U3SEFjSTc2dWVpSkdhSUZzWW5j?=
 =?utf-8?B?MVNSRHlMck1pVnplWW5nb1ZpUE1zdnpPbW4zNlVjYnpVS3pLR0hZRG1zME80?=
 =?utf-8?B?Z2VXSGhnRWEyeE1FTGxJNit6ZHRiMGYzUkR3VVR3c0JNdldjZk1GT1N0M3Nj?=
 =?utf-8?B?RFdVVVlTbGxJT1NYejNvRy9sNlVySVhRcXlYS1MycmVSN2trWDE4eFVYZTBk?=
 =?utf-8?B?ay90QUN6eEVpOExaRmE2UUtkNmdDTzlSVndPemZadHI4ZS9nZG8vRDV6SzVQ?=
 =?utf-8?B?VUtNayt1dUh1UkJ4RlBtVDZZbnorVGZJUkx1aEFyMVBPME1UMTBaR25sajYz?=
 =?utf-8?B?NFNnMy95eUdpTEFwdFd3OUlZMkJkT0g1Uk40djVZeHBvMDY0bGtmalU4aGpt?=
 =?utf-8?B?QTRLRC9wU3ltVDZNRWk1dUNkSW9wamlHR05ZM2tCTDhxT1IxOE1FQ0R6Ujdk?=
 =?utf-8?B?dGU1MDFsLzVCRWpSdXpMcUhkbWdwUUdhNUs5aE4yMDZBaS9hQzVrZ0E0STRJ?=
 =?utf-8?B?VDladVRrQUErZ3ZuNVU4MCt6dVFZNjJjU3dDRlJ3bE9sMExpUFNmc3JmSEsv?=
 =?utf-8?B?a2NmaGR2WHdpelhmTnJIbzN5MEJ6eTVLMkx6clNma1hGTGRLRk5ZdTUvQkhy?=
 =?utf-8?B?MDFNUkFwU2ExZDdEbmxLWkRXSkdZSUkrYW1RUWFGMTgxVG5iM0U2L3lXVlYw?=
 =?utf-8?B?d2NvSURvL1RYcHNmSEdyUjVaUy9yZFFaOVRhUkdUbkpjQ2RqeVp3eHpYbTI2?=
 =?utf-8?B?RTBQOGhsKzVkakhRdTlGZ1J1THZQWVc2ZG5CTFo5cmhEOTl3N0tmNy96bGVC?=
 =?utf-8?B?V0xoOGdhM0pjSjhrTHRRUzJydERSazRUQVNzNlFqZ3JpWDlEQi92SmxzZytU?=
 =?utf-8?B?REdxVC9OK0pRUCs1blpqRlRXZXZzamFYM3BoOXMzdlRFdWkybUdGNzhXT0E1?=
 =?utf-8?B?Si9sN1hmeFQvT1M1N3pjV29CaDVzdjhxamN3eUFYQlc3SkF4SldsQlFyVHN6?=
 =?utf-8?B?OVJORXBGalVzK0cwTEdWWHlTZml4cGFTd2xPd3pxeDArOEtYZkhueVdQVG1j?=
 =?utf-8?B?SHIwMmdWNWowMFpjaW1CRytHU05JUW1oalB6SHdRaVM0dzRBYWRXeUJQQ3ZX?=
 =?utf-8?B?WE9JakdBVWZxejcvTzZqVzBoZ2ZXbzNIdE5TakNPVUMyanIwbTN5QWtXRFZ5?=
 =?utf-8?B?dHVRbkF5SFRnNUxiL0FvNkFkaGlYbW5KdmJGTk8yS28ranFLMVFEcUF3ZXA1?=
 =?utf-8?B?aEMxQUNIOXg1Mk5EYXg2ZFlZdGdMYS9KUDQyZTVHSi8wZWdEaXI0bDVvQVlm?=
 =?utf-8?B?UkEwQ1c0ZGlWRExSVmNOM0V6VVhVNmZLQnpMc2gvRTRCRGdOS1BNSnFoSktr?=
 =?utf-8?B?WGg2ZWMrL0owU1FDb3cwWGJ0VW1lSDhlUjdHKytyeUJlRVBZdzRPMHZ3NUox?=
 =?utf-8?B?dnZaWmtiQ24xUjlRdjFxSkVNTjA0Ym90aTlDbzhrK0sxaGUyUzBJRE1SNkJq?=
 =?utf-8?B?SEhoa1N1UjZTbnRoRW9KQkdlaEpVcHArdFBtMjZjZlo4R1BGZUxacHN4NFFS?=
 =?utf-8?B?clZ1b1djMlhjVWp1OUcyMjRLUDlDUnprbEVUSVpVeWtWYmpUdmZvM1BTajZI?=
 =?utf-8?B?SXgwN0pYQjh1cjdKQkFDZGt2dy9OY000NmlPeTBzN2NUSk81N2tncXpiTFpx?=
 =?utf-8?B?azVkVXRHZ25BPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB6226.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MTZLNzc3cE5jeDZtTXpHdlFZRGZibnhCaUlQK3dxQXc0bXI0eW82R3BhSEpV?=
 =?utf-8?B?bkpiZysxYkF1UHpUeUlpVFUySVFJWlZaTEVsaHUzNFVrSkZkdHRKWGJiVjFV?=
 =?utf-8?B?RW00WnlldzdoNUpONWRaRmZaSm5DVzZSMUZjUStyb0lLck81WXBITHV2aVJ0?=
 =?utf-8?B?cjF2U2JZUGxuR2dERlY2aXZ6Q21wMFl5MkFGQm5ia3JtWWZwNXdQWG5BNkhG?=
 =?utf-8?B?WURRNy9SVmk2VXlyeHF6dFFIVTh2bnJmQm5EOHlMR2k4S2FHa0FZdjhOZDk0?=
 =?utf-8?B?V21uMnVSTENpN1k2MDYzdjEzQktZcVBZRTJSNFdkQ0RxeWR5QTRoKys1MDlV?=
 =?utf-8?B?TTl3RkdyZzMvVGlwR3dZak1ya3Z0SHhieTJqcklhUDljdHNkQUJOaHpLTnBJ?=
 =?utf-8?B?cVUrNC8ybEpoSE91MzVRQUpqdmhTcmk4SndDc2N1TytpODdXaVpBSHZMazE4?=
 =?utf-8?B?a0xCa1JpeGZKRVppRjFtVGtBTmlVUWYvL0t5MW1tNThBY1d6S1JobjhvSWJx?=
 =?utf-8?B?UXNIL3Z5MjM4Q2hLQm4waG1uOFhRaTVPNEkxcDBuNnVaUVc3TmdzdU5vdzlJ?=
 =?utf-8?B?MGV3K2QyUUlwU1VOQXQ1NFk3L1EvdHAweFhDWEtvd1pwZ0drVjNFNmlVWENm?=
 =?utf-8?B?ZEcwbmNOcGk2TzEwd1o5Q1czWHVlSWVmejEzVTlLYkxyU3ZkWlpGQ1lZNVBT?=
 =?utf-8?B?R3VOemZIcDV3eGhXY0lCN2ZrRjA4SkdVQ0VEVkYxYVo1RmY1Qm0vNEdpL0Jw?=
 =?utf-8?B?blRNQVlDUlVUVUozNmJyRVI1aUNNTnhsR1BUeTF2UzJLbk5jZkpLSG5NTHVY?=
 =?utf-8?B?VW5pVWRkTSt6cU95ZzFIM2l1aU1nSEg5cGZzYmtia3pmZWkwZ0lMU09OTVBz?=
 =?utf-8?B?WDRWd3ZYUEVBMTlkNWVpMW0zRis1SWFKbHh1YzhKK3pMZWhCR05lL1hSVlNl?=
 =?utf-8?B?RHpIb05RL1lYWFJNUFVwYUhLci9ZYVYvSlp5eUdPcHBCS0NpeU5JK1Avc213?=
 =?utf-8?B?OXluVGYzOUN0RHVQakI2cXdqRTFqRWlDMlZDcEpnaThqTVhLMUUxVVo1VXdq?=
 =?utf-8?B?N0FCSEllRnV0RDd3azJVYkZ6ODdMTzFCdEZIODlDbGdGTWJkS29zZytEYUUy?=
 =?utf-8?B?VW4xcUZ1Tm9ZWElLNUJvMzFkYVFHSm5Kd1d2VDdpdzkxcEQvWTZVRW1kazRH?=
 =?utf-8?B?SG1CK29oTHkvbkpBWDg3L3JVS0QrdkUyZHY2bEtualhDMTQ4UFZHbGJ1b1h6?=
 =?utf-8?B?bkR5YnFXWTNscFk2QjkvV1dhMTZmQTJjeWlsTG9xbTMzZ0EwYVNOcmdxVnA2?=
 =?utf-8?B?clk2a0VZV2JDQVAvbjhCK241bzQzOHRTaytzNlkrS1doN1VzRkEwNzdORndV?=
 =?utf-8?B?L0dlVEVhYjJnMjBYdU1zVVcwckd0S3p5QVRnWUFzV28wakZuNUNqbncvMVVT?=
 =?utf-8?B?NlJHKzExREx3bFpWby9FdlV5MnVMdnBwMWFRT0YrVEl4NGl1M0VGNEEzVENj?=
 =?utf-8?B?YkMrMzQwZzNKZlJCQm13Ym5uMC9aYUFBSHh5b2dVbng0b2FOcHExSG9MNFBK?=
 =?utf-8?B?R1Y5cWpXYmZUazB1RzFmWnRoSTEzREw4K0w2YWtReitEejRLMStHaDlBQWdY?=
 =?utf-8?B?cEZNZGVyOVk1aEg4RDVKWllBYmNUbGdJckJWY1FGenBObU1vZ042RHVadTVm?=
 =?utf-8?B?c3pHTE0yRHd4YVpHM09UQkV4N3c1SnJ4eVd6aGtrYzJhZ1dNb3NBUEVaOFll?=
 =?utf-8?B?S2FrRk1mckJFaVd2Q1g5ZVUrR0NGUE5vMmRxUFJDZUQ0SUl4TjJmaVdGbzBj?=
 =?utf-8?B?ckpFWkd4L3Y2RGFFS1l5d2tOUHd5YTdkUVJ6dlI4OGw1Um1waytIT0JqL2Zl?=
 =?utf-8?B?dzgrN3owOVdYMlV2YVdIdWk2QmtJb3AxVmdjeTM0WUtsdEZ3NmpFZFhNQlAv?=
 =?utf-8?B?ZnN3cEtwZWNwbVNRbzY0YUVya2M1N0dkdGE0Qyt5dkZGbnZCc0g2NzZNTDlu?=
 =?utf-8?B?NytDQ3p5QXJuUUZUcW5NbHVNdUlJaUhRMlNYQlo5aHJ2THhzeGJYaVV1aWVv?=
 =?utf-8?B?WWY0MGtjRmNONDN3N0o1VHp5Zmp4V2cyaHQrbXFQNXRXbnFOQ3NZdkJMaXpk?=
 =?utf-8?B?SWtnZ1hnNzdYWFcyOXV5a05EQnNoSzVacHBlMFdzRE9vV0Q3Z0dEYVlqMHNa?=
 =?utf-8?Q?7SkfO2cNcmTlc7xmxE5Bt6rGpsM/r7PeyeEUXLCZqhmw?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d538017-2b3a-45ae-0b2b-08de2e847a45
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2025 13:46:05.4632
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /ERahYCJc/Eo1ZAxAGsU67wmPsmwXl7w1BcPxfXIPdzGtBjYs+DZxLSeh7luzRI+GeFGEb5DZT319UR0RKKvIaAPjeX6jZPyzH+/lxEbNkk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6721

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6a0BrZXJuZWwub3JnPg0KPiBTZW50OiBGcmlkYXksIE5vdmVtYmVyIDI4LCAyMDI1
IDk6MzkgUE0NCj4gVG86IEpvYWtpbSBaaGFuZyA8am9ha2ltLnpoYW5nQGNpeHRlY2guY29tPg0K
PiBDYzogbGdpcmR3b29kQGdtYWlsLmNvbTsgYnJvb25pZUBrZXJuZWwub3JnOyByb2JoQGtlcm5l
bC5vcmc7DQo+IGtyemsrZHRAa2VybmVsLm9yZzsgY29ub3IrZHRAa2VybmVsLm9yZzsgcGVyZXhA
cGVyZXguY3o7DQo+IHRpd2FpQHN1c2UuY29tOyBsaW51eC1zb3VuZEB2Z2VyLmtlcm5lbC5vcmc7
IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOw0KPiBjaXgta2VybmVsLXVwc3RyZWFtIDxjaXgt
a2VybmVsLXVwc3RyZWFtQGNpeHRlY2guY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDEv
NF0gQVNvQzogZHQtYmluZGluZ3M6IGFkZCBDSVggSVBCTE9RIEhEQSBjb250cm9sbGVyDQo+IHN1
cHBvcnQNCj4gDQo+IEVYVEVSTkFMIEVNQUlMDQo+IA0KPiBPbiAyOC8xMS8yMDI1IDE0OjIzLCBK
b2FraW0gWmhhbmcgd3JvdGU6DQo+ID4NCj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KPiA+PiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+DQo+
ID4+IFNlbnQ6IEZyaWRheSwgTm92ZW1iZXIgMjgsIDIwMjUgODoyNCBQTQ0KPiA+PiBUbzogSm9h
a2ltIFpoYW5nIDxqb2FraW0uemhhbmdAY2l4dGVjaC5jb20+DQo+ID4+IENjOiBsZ2lyZHdvb2RA
Z21haWwuY29tOyBicm9vbmllQGtlcm5lbC5vcmc7IHJvYmhAa2VybmVsLm9yZzsNCj4gPj4ga3J6
aytkdEBrZXJuZWwub3JnOyBjb25vcitkdEBrZXJuZWwub3JnOyBwZXJleEBwZXJleC5jejsNCj4g
Pj4gdGl3YWlAc3VzZS5jb207IGxpbnV4LXNvdW5kQHZnZXIua2VybmVsLm9yZzsNCj4gPj4gZGV2
aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGNpeC1rZXJuZWwtdXBzdHJlYW0NCj4gPj4gPGNpeC1r
ZXJuZWwtdXBzdHJlYW1AY2l4dGVjaC5jb20+DQo+ID4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIg
MS80XSBBU29DOiBkdC1iaW5kaW5nczogYWRkIENJWCBJUEJMT1EgSERBDQo+ID4+IGNvbnRyb2xs
ZXIgc3VwcG9ydA0KPiA+Pg0KPiA+PiBFWFRFUk5BTCBFTUFJTA0KPiA+Pg0KPiA+PiBPbiAyOC8x
MS8yMDI1IDEzOjE1LCBKb2FraW0gWmhhbmcgd3JvdGU6DQo+ID4+Pg0KPiA+Pj4NCj4gPj4+PiAt
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+Pj4+IEZyb206IEtyenlzenRvZiBLb3psb3dz
a2kgPGtyemtAa2VybmVsLm9yZz4NCj4gPj4+PiBTZW50OiBGcmlkYXksIE5vdmVtYmVyIDI4LCAy
MDI1IDY6MjkgUE0NCj4gPj4+PiBUbzogSm9ha2ltIFpoYW5nIDxqb2FraW0uemhhbmdAY2l4dGVj
aC5jb20+DQo+ID4+Pj4gQ2M6IGxnaXJkd29vZEBnbWFpbC5jb207IGJyb29uaWVAa2VybmVsLm9y
Zzsgcm9iaEBrZXJuZWwub3JnOw0KPiA+Pj4+IGtyemsrZHRAa2VybmVsLm9yZzsgY29ub3IrZHRA
a2VybmVsLm9yZzsgcGVyZXhAcGVyZXguY3o7DQo+ID4+Pj4gdGl3YWlAc3VzZS5jb207IGxpbnV4
LXNvdW5kQHZnZXIua2VybmVsLm9yZzsNCj4gPj4+PiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9y
ZzsgY2l4LWtlcm5lbC11cHN0cmVhbQ0KPiA+Pj4+IDxjaXgta2VybmVsLXVwc3RyZWFtQGNpeHRl
Y2guY29tPg0KPiA+Pj4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMS80XSBBU29DOiBkdC1iaW5k
aW5nczogYWRkIENJWCBJUEJMT1EgSERBDQo+ID4+Pj4gY29udHJvbGxlciBzdXBwb3J0DQo+ID4+
Pj4NCj4gPj4+PiBFWFRFUk5BTCBFTUFJTA0KPiA+Pj4+DQo+ID4+Pj4gT24gMjgvMTEvMjAyNSAx
MDo1NCwgSm9ha2ltIFpoYW5nIHdyb3RlOg0KPiA+Pj4+Pg0KPiA+Pj4+PiBIZWxsbyBLcnp5c3p0
b2YsDQo+ID4+Pj4+DQo+ID4+Pj4+IFRoYW5rcyBmb3IgeW91ciByZXZpZXcuDQo+ID4+Pj4+DQo+
ID4+Pj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+Pj4+Pj4gRnJvbTogS3J6eXN6
dG9mIEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3JnPg0KPiA+Pj4+Pj4gU2VudDogRnJpZGF5LCBO
b3ZlbWJlciAyOCwgMjAyNSA1OjI4IFBNDQo+ID4+Pj4+PiBUbzogSm9ha2ltIFpoYW5nIDxqb2Fr
aW0uemhhbmdAY2l4dGVjaC5jb20+DQo+ID4+Pj4+PiBDYzogbGdpcmR3b29kQGdtYWlsLmNvbTsg
YnJvb25pZUBrZXJuZWwub3JnOyByb2JoQGtlcm5lbC5vcmc7DQo+ID4+Pj4+PiBrcnprK2R0QGtl
cm5lbC5vcmc7IGNvbm9yK2R0QGtlcm5lbC5vcmc7IHBlcmV4QHBlcmV4LmN6Ow0KPiA+Pj4+Pj4g
dGl3YWlAc3VzZS5jb207IGxpbnV4LXNvdW5kQHZnZXIua2VybmVsLm9yZzsNCj4gPj4+Pj4+IGRl
dmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBjaXgta2VybmVsLXVwc3RyZWFtDQo+ID4+Pj4+PiA8
Y2l4LWtlcm5lbC11cHN0cmVhbUBjaXh0ZWNoLmNvbT4NCj4gPj4+Pj4+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjIgMS80XSBBU29DOiBkdC1iaW5kaW5nczogYWRkIENJWCBJUEJMT1EgSERBDQo+ID4+
Pj4+PiBjb250cm9sbGVyIHN1cHBvcnQNCj4gPj4+Pj4+DQo+ID4+Pj4+PiBFWFRFUk5BTCBFTUFJ
TA0KPiA+Pj4+Pj4NCj4gPj4+Pj4+IE9uIFRodSwgTm92IDI3LCAyMDI1IGF0IDA1OjQyOjU4UE0g
KzA4MDAsDQo+ID4+Pj4+PiBqb2FraW0uemhhbmdAY2l4dGVjaC5jb20NCj4gPj4+Pj4+IHdyb3Rl
Og0KPiA+Pj4+Pj4+IEZyb206IEpvYWtpbSBaaGFuZyA8am9ha2ltLnpoYW5nQGNpeHRlY2guY29t
Pg0KPiA+Pj4+Pj4+DQo+ID4+Pj4+Pj4gIC0gYWRkIENJWCBJUEJMT1EgSERBIGNvbnRyb2xsZXIg
c3VwcG9ydA0KPiA+Pj4+Pj4NCj4gPj4+Pj4+IFBsZWFzZSB3cml0ZSBmdWxsIHNlbnRlbmNlcy4g
TG9vb2sgaG93IG90aGVyIGNvbW1pdHMgd2VyZQ0KPiA+Pj4+Pj4gY3JlYXRlZCwgaXQgaXMgbm90
IHRoZSBmaXJzdCBjaXggY29tbWl0LCByaWdodD8NCj4gPj4+Pj4NCj4gPj4+Pj4gWWVzLCBub3Qg
dGhlIGZpcnN0IGNpeCBjb21taXQsIEkgd2lsbCBoYXZlIGEgbG9vay4NCj4gPj4+Pj4NCj4gPj4+
Pj4+DQo+ID4+Pj4+Pj4NCj4gPj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBKb2FraW0gWmhhbmcgPGpv
YWtpbS56aGFuZ0BjaXh0ZWNoLmNvbT4NCj4gPj4+Pj4+PiAtLS0NCj4gPj4+Pj4+PiAgLi4uL2Jp
bmRpbmdzL3NvdW5kL2NpeCxpcGJsb3EtaGRhLnlhbWwgICAgICAgIHwgNzENCj4gPj4gKysrKysr
KysrKysrKysrKysrKw0KPiA+Pj4+Pj4+ICAxIGZpbGUgY2hhbmdlZCwgNzEgaW5zZXJ0aW9ucygr
KSAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+ID4+Pj4+Pj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3NvdW5kL2NpeCxpcGJsb3EtaGRhLnlhbWwNCj4gPj4+Pj4+Pg0KPiA+Pj4+Pj4+
IGRpZmYgLS1naXQNCj4gPj4+Pj4+PiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9zb3VuZC9jaXgsaXBibG9xLWhkYS55YW1sDQo+ID4+Pj4+Pj4gYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3Mvc291bmQvY2l4LGlwYmxvcS1oZGEueWFtbA0KPiA+Pj4+Pj4+IG5l
dyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4+Pj4+Pj4gaW5kZXggMDAwMDAwMDAwMDAwLi5jOWU0MDE1
YTgxNzQNCj4gPj4+Pj4+PiAtLS0gL2Rldi9udWxsDQo+ID4+Pj4+Pj4gKysrIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL2NpeCxpcGJsb3EtDQo+IGhkYS55YW0NCj4g
Pj4+Pj4+PiArKysgbA0KPiA+Pj4+Pj4+IEBAIC0wLDAgKzEsNzEgQEANCj4gPj4+Pj4+PiArIyBT
UERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpICVZ
QU1MDQo+ID4+Pj4+Pj4gKzEuMg0KPiA+Pj4+Pj4+ICstLS0NCj4gPj4+Pj4+PiArJGlkOiBodHRw
Oi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9zb3VuZC9jaXgsaXBibG9xLWhkYS55YW1sIw0KPiA+
Pj4+Pj4+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUu
eWFtbCMNCj4gPj4+Pj4+PiArDQo+ID4+Pj4+Pj4gK3RpdGxlOiBDSVggSVBCTE9RIEhEQSBjb250
cm9sbGVyDQo+ID4+Pj4+Pj4gKw0KPiA+Pj4+Pj4+ICtkZXNjcmlwdGlvbjoNCj4gPj4+Pj4+PiAr
ICBDSVggSVBCTE9RIEhpZ2ggRGVmaW5pdGlvbiBBdWRpbyAoSERBKSBDb250cm9sbGVyDQo+ID4+
Pj4+Pj4gKw0KPiA+Pj4+Pj4+ICttYWludGFpbmVyczoNCj4gPj4+Pj4+PiArICAtIEpvYWtpbSBa
aGFuZyA8am9ha2ltLnpoYW5nQGNpeHRlY2guY29tPg0KPiA+Pj4+Pj4+ICsNCj4gPj4+Pj4+PiAr
cHJvcGVydGllczoNCj4gPj4+Pj4+PiArICBjb21wYXRpYmxlOg0KPiA+Pj4+Pj4+ICsgICAgY29u
c3Q6IGNpeCxpcGJsb3EtaGRhDQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4gV2hhdCBoYXBwZW5lZCBoZXJl
PyBZb3UgbWlzcyBTb0MgY29tcGF0aWJsZS4gSSBkaWQgbm90IGFzayB0bw0KPiA+Pj4+Pj4gY2hh
bmdlIGNvbXBhdGlibGUuDQo+ID4+Pj4+DQo+ID4+Pj4+IEkgdXNlZCB0aGUgY2l4LHNreTEtaXBi
bG9xLWhkYSBiZWZvcmUsIGJ1dCB5b3UgYXNrIHRvIHVzZSB0aGUNCj4gPj4+Pj4gY29tcGF0aWJs
ZSBhcw0KPiA+Pj4+IHRoZSBmaWxlIG5hbWUsIEkgdGhpbmsgaXQncyBtYXkgbm90IHF1aXRlIHN1
aXRhYmxlLCBzaW5jZSB3ZSBtYXkNCj4gPj4+PiBoYXZlIHNreTFwLCBza3kyLi4uIGxhdGVyLCBz
byBJIGFkZCBhIHVuaWZpZWQgY29tcGF0aWJsZSBoZXJlIGFzIGEgZmFsbGJhY2suDQo+ID4+Pj4N
Cj4gPj4+PiAiRmlsZW5hbWUgbXVzdCBtYXRjaCB0aGUgY29tcGF0aWJsZS4iLiBZb3VyIGV4cGxh
bmF0aW9uICJ1c2UNCj4gPj4+PiBjb21wYXRpYmxlIGFzIHRoZSBmaWxlbmFtZSIgaXMgYWxzbyBj
b3JyZWN0IC0gdXNlIHdoYXQ/IHRoZQ0KPiA+Pj4+IGNvbXBhdGlibGU/IGFzIHdoYXQ/IGFzIHRo
ZSBmaWxlbmFtZSBzbyBpbiBwbGFjZSBvZiBmaWxlbmFtZS4gU28NCj4gPj4+PiBob3cgY291bGQN
Cj4gPj4geW91IG1ha2UgaXQgcmV2ZXJzZWQ/DQo+ID4+Pj4gZmlsZW5hbWUgYXMgdGhlIGNvbXBh
dGlibGU/DQo+ID4+Pg0KPiA+Pj4gWWVzLCAiRmlsZW5hbWUgbXVzdCBtYXRjaCB0aGUgY29tcGF0
aWJsZS4iIGlzIG1lYW5pbmdmdWwsIEkgdXBkYXRlZA0KPiA+PiAiY2l4LHNreTEtaXBibG9xLWhk
YSIgdG8gImNpeCxpcGJsb3EtaGRhIiwgc2luY2UgaGVyZSB1c2UgSVAgbmFtZSBpcw0KPiA+PiBt
b3JlIHN1aXRhYmxlIGFuZCBtYXkgZm9yIGFsbCBDSVggU29DcyBsYXRlciwgaWYgdGhlcmUgaXMg
YW55DQo+ID4+IGRpZmZlcmVuY2UsIHdlIGNhbiBhbGwgb3RoZXIgY29tcGF0aWJsZXMuDQo+ID4+
DQo+ID4+IFNvIHdoeSBkaWQgeW91IHJldmVyc2UgdGhlIGxvZ2ljPyBBbnl3YXkgY2l4LGlwYmxv
cS1oZGEgaXMgbm90DQo+ID4+IGNvcnJlY3QsIGJlY2F1c2UgaXQgaXMgZ2VuZXJpYy4gU2VlIGFs
c28gd3JpdGluZyBiaW5kaW5ncyBkb2MgZm9yIG1vcmUNCj4gZXhwbGFuYXRpb24uDQo+ID4NCj4g
PiBIZWxsbyBLcnp5c3p0b2YsDQo+ID4NCj4gPiBGb3IgdGhlIHYxLCBJIGtub3cgeW91IGFzayBt
ZSB0byB1cGRhdGUgdGhlIGNpeCxpcGJsb3EtaGRhLnlhbWwgdG8gY2l4LHNreTEtDQo+IGlwYmxv
cS1oZGEueWFtbCwgbm90IHRvIGNoYW5nZSB0aGUgY29tcGF0aWJsZS4gVGhlIHJlYXNvbiB3aHkg
SSB3ZW50IHRvDQo+IHJldmVyc2UgdGhlIGxvZ2ljIGluIHYyLCBzaW5jZSBJIHRoaW5rIGl0IG1h
eSByZWFzb25hYmxlLg0KPiA+DQo+ID4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3dyaXRpbmctYmluZGluZ3MucnN0DQo+ID4gLSBCaW5kaW5ncyBmaWxlcyBzaG91bGQgYmUgbmFt
ZWQgbGlrZSBjb21wYXRpYmxlOiB2ZW5kb3IsZGV2aWNlLnlhbWwuIEluIGNhc2UNCj4gPiAgIG9m
IG11bHRpcGxlIGNvbXBhdGlibGVzIGluIHRoZSBiaW5kaW5nLCB1c2Ugb25lIG9mIHRoZSBmYWxs
YmFja3Mgb3IgYSBtb3JlDQo+ID4gICBnZW5lcmljIG5hbWUsIHlldCBzdGlsbCBtYXRjaGluZyBj
b21wYXRpYmxlIHN0eWxlLg0KPiA+DQo+ID4gWW91IG1lYW4gdGhhdCBtdXN0IGxpc3QgdGhlIFNv
QyBhcyB0aGUgZGV2aWNlIGhlcmUgLCBjYW5ub3QgdXNlIHRoZSBJUA0KPiBuYW1lPw0KPiANCj4g
WW91IGFyZSBtaXhpbmcgdG9waWNzLiBZb3UgbXVzdCByZW5hbWUgZmlsZW5hbWUsIHNvIGl0IHdp
bGwgbWF0Y2ggdGhlDQo+IGNvbXBhdGlibGUuIFlvdSBjb3JyZWN0bHkgcXVvdGVkIHBhcmFncmFw
aCBkZXNjcmliaW5nIHRoaXMuDQo+IA0KPiBCdXQgeW91IG1pc3NlZCB0aGF0IHlvdXIgY29tcGF0
aWJsZSBpcyBub3QgY29ycmVjdDoNCj4gDQo+ICJETyB1c2UgYSBTb0Mtc3BlY2lmaWMgY29tcGF0
aWJsZSBmb3IgYWxsIFNvQyBkZXZpY2VzLCIgYW5kIGZ1cnRoZXIuIE9yIGFueSBvZg0KPiBteSBz
bGlkZXMgZnJvbSBzcGVlY2hlcyBnaXZpbmcgZ3VpZGVsaW5lcyBmb3IgYmFzaWMgRFQuDQo+IA0K
PiBEZWZpbmUgd2hhdCBpcyB5b3VyIFNvQy4gVGhlbiBkZWZpbmUgd2hhdCBpcyB5b3VyIGRldmlj
ZSBuYW1lIGluIHRoYXQgU29DIChJUA0KPiBibG9jaykuIFRoZW4geW91ciBjb21wYXRpYmxlIGlz
OiB2ZW5kb3Isc29jLWlwYmxvY2tuYW1lLg0KDQpPSywgSSB3aWxsIHVwZGF0ZSBmaWxlIHRvIGNp
eCxza3kxLWlwYmxvcS1oZGEueWFtbCBhbmQgY29tcGF0aWJsZSB0byBjaXgsc2t5MS1pcGJsb3Et
aGRhDQo=
