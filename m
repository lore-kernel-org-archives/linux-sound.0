Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023089.outbound.protection.outlook.com [40.107.44.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D9D23D7D4;
	Fri,  5 Dec 2025 11:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764933786; cv=fail; b=Sa7YvloWKTlvgYhDc0JiY7y9UIti6Cd3CwPBLA4hQp8xAEIz24T7j+PijhwlDVCU5Shrq5bTEwZjPuomS/RhejJ41dZt1luU88IOiXsvUKYnjYELhXjEfD3c+ZplJlHdj1GZibRhRrSHB772t9Yp4LuW+LkMFLo87b/A+gSW/QQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764933786; c=relaxed/simple;
	bh=iCpAHpV1er0/8tfScwU/32gbOkrt0PLG0aymI+dkEKY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sG08YDZGzR3KYdXrw9HUP95N73jY9GrCkf0DpqBLp8pES1hNkEU/Pz0AzQgGQ0iWnSBu8XmpF5IJmVZqEdAXq0u6Bo2A8tLXMCzVVO3XhAtrJq5GZADC+1/2VvqUXhjR68TM1E7kH6EAzS77NwzaIo8LOgWGNkQANVrRPnOOz0U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.44.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CCqrPKGwIddsatzi5yDodaPNqApuXvwLI4S9p2lS+l5mjHqFoOMGTKpWuQP1sN0Yk0FRIsIuza+R2fzkpWB4A18cWHW1EXRPfs9NurLKr8dWueMzVPrikocvatMq8c38ayX+hXz6dmVBVCIGqeYXrOP0zkiH+o4m3osfEDYpl4Y1qLYgWAhhPOdW73vdmktrtYnECiBOnTfYB7NCkM9NWPflzaM6cnpLe0IaHYVLcPIjhRDkVKDjKVQvsMhUbUdfEpTXqtGCh2cvqBraGPNMiOPKKnikZGGqZl7UQq/iSeufqIaFvSZjkJFkDxz1Cmw0vnkr/9/vQQgMDsTCs3VeoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iCpAHpV1er0/8tfScwU/32gbOkrt0PLG0aymI+dkEKY=;
 b=Z8I+K82EDDV9LtxseHSIXXqrzc8VsGQrd0XBp6a8ibkUMcUE7ca0RGENUCuCYQcxGC5lZLipN5YESRM/ZIBRcWIWIg1ng882K99V34gwQSZTX0zhQicsuMqNcf3I9wrOYL2/6xXm0iyjxhc3sJeLy1jMu4p7Avf32lu5gVmtFX4V92XPBmsaAbcoJngQMidBxZjBAV6946b5jLifq0yL4QunaELalmI1VK5EHpu1CY7xhWdbDIlt4gI2BY3jvP4GwN7wGmjDI0XLYit+xZrZIsSKNwqKcPHdKuBJB4CmLMHruDH/59KblTkgv0MPJmtyPDCuwhg75Thj3LsRONe/Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from SEYPR06MB6226.apcprd06.prod.outlook.com (2603:1096:101:df::13)
 by TYPPR06MB8020.apcprd06.prod.outlook.com (2603:1096:405:316::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.11; Fri, 5 Dec
 2025 11:22:59 +0000
Received: from SEYPR06MB6226.apcprd06.prod.outlook.com
 ([fe80::56e8:777c:d80e:d364]) by SEYPR06MB6226.apcprd06.prod.outlook.com
 ([fe80::56e8:777c:d80e:d364%5]) with mapi id 15.20.9366.012; Fri, 5 Dec 2025
 11:22:59 +0000
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
Thread-Index: AQHcY385bU/Y88Xk40i6LNSQa/UTGrUSwl6AgAAFGBCAACKfAIAAAMuQ
Date: Fri, 5 Dec 2025 11:22:59 +0000
Message-ID:
 <SEYPR06MB6226971F9A9FA4CF2C9A24DD82A7A@SEYPR06MB6226.apcprd06.prod.outlook.com>
References: <20251202113132.1094291-1-joakim.zhang@cixtech.com>
 <20251202113132.1094291-2-joakim.zhang@cixtech.com>
 <20251205-interesting-determined-gecko-fce146@quoll>
 <SEYPR06MB6226B32B5E26E60F9E673B8D82A7A@SEYPR06MB6226.apcprd06.prod.outlook.com>
 <b0f861a1-1904-4c16-9470-ed8a1e7387c6@kernel.org>
In-Reply-To: <b0f861a1-1904-4c16-9470-ed8a1e7387c6@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB6226:EE_|TYPPR06MB8020:EE_
x-ms-office365-filtering-correlation-id: 07f37fb6-f42a-481b-da93-08de33f0a56a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZHNhZ0pwdkd2TXVJenhiQXg2UU1UcE5pbGJkYXRkWENoNkpIZkt0N2R1Uk0v?=
 =?utf-8?B?NHNYZWxCQUUxOEpnQ2lGVWJ6YllRZ2RRMFFQM2tBSytUc1RTNWo2Zm5KMnRN?=
 =?utf-8?B?N2x1djIzdjV0MjhVS0I4NXpZcnF1OVp5cExJZ2FwNzZ4Wno1REU0SWZiQ0dP?=
 =?utf-8?B?a1U1OC9zOXpQcTBnMXB1ZXZyN0Z0akY0T3BoTnh5UEwvU0dGNzBxR0Q5WjFU?=
 =?utf-8?B?WnNjZUV5MnJZY2VEaUF2N1UyMnJaeHhNc3lCK1V0d3EzQ2RvQittMHFrUXdR?=
 =?utf-8?B?V1puVXpORmdvRndoQjhacWhrTnRMM1cweXZOcEkxbGd3dGJiVUpRM3Z3eGs4?=
 =?utf-8?B?a3ZHSzc0czl2c1NPNHlIa1N0bi9ZV0t0NjZVY283NHBjNXRTZ0NoNHNmbzR2?=
 =?utf-8?B?N2JScmxZZ2FWZ2ZQVFNuWUVhWXNvSmhsM0VodHhla1ozb29iYVdGM3ZkSE02?=
 =?utf-8?B?RmdaSUd1dVI1dFhyTllBODBzNCtINzJxK1hURksrWWJxQk5WZWFQeWU4RU5Z?=
 =?utf-8?B?a3ZnNG9xQVBMUXE2S0NFY1FnTGpvZXY1TmxrZ2twWEJ1VVlWREh3ZlYrcHFH?=
 =?utf-8?B?Q2ZBaUVGM05YRWtsMWF2a25YK3pNMzZaV1hHZ25vOTAyNnBTTHVsL0dNKzJs?=
 =?utf-8?B?V2EzTGJsaEZreXBqSWRWYmppemRKY283UzlPTTdsMDVJdzMyYS83TWE2bTNR?=
 =?utf-8?B?NW5ybUp0aWpsa3hld09SLzZlR08zVzJBRk5Tc2VMaThjazBzMjlIQ3d2SXZv?=
 =?utf-8?B?YWsrTWJvUm9RVURVWDRLV0ZMdkpXa1liOWtjRDJ4c3lYTnRhZXRRRnNldVZZ?=
 =?utf-8?B?RjVCWVFjcnhRdTJhZWNJNkVmUE80aW1mU0RFTUFXM3ZRbm9NT0RSYnhBWWpr?=
 =?utf-8?B?ckJJNmVMbk5ySWpsUmpBRWd1M1hXbk50djNFOVBEYnVublozbnlMYlZuY3pz?=
 =?utf-8?B?Uld5azdkVkZTWDRTWUI3dkU3OWhJTGpEWXJTSUNEZXNQdzhwbkFhdUFSVWdH?=
 =?utf-8?B?dnpzL3ZvWk1qNWlvQUVQbXpFc015ZU9FQTk5dWY4TjR2eW8za3pvK0k2OE5B?=
 =?utf-8?B?Yjh4eTVPL2R6cWROb2NSVmVYd3JPOER3MlREWjFXMFd0S2hpYzBYN1BkK3Aw?=
 =?utf-8?B?UExIZVhpb3AyaWhWd29XZVRFTkM2djRYazJtUjMwbXFnZHVQWEJlemNKY09W?=
 =?utf-8?B?RGk4bVFTRkxoYThNSU81eEhOekxjUm12Y1UvTzRuMWl6cWxvMkdjYk9nRHFN?=
 =?utf-8?B?Mjk3dFBxbU45WUxGUWZZOER6Skp3T2pVQzNURlk1aGI1THNGbjdXM0YwVnE5?=
 =?utf-8?B?MTIzb1A0anludjI1cGd5SXRNRytUQW96aVN5b2diNU5yQmNSazNCdnFKSDFa?=
 =?utf-8?B?RXd1Ry9mSVRQVklhY0FhY2xpWnpzT2piaHljaExNVXBYYVMvbXNTOHNvTVRn?=
 =?utf-8?B?UkVqQ2g2YzdBVWlQVkdIbnZvZU84WTI0dmJIcStIbmxnc3VnSDJKcXJVN0pW?=
 =?utf-8?B?bmFRaGk3RFp0S3pzOVJZS0djaGFUVU1DQWlxU0pIcUhScTdrbUNkamVzYUVN?=
 =?utf-8?B?UjZsZ2J0TGRvYlYrSFJvVWdRVlNMNERJWFlKVGNSMldwRDNDenltSE8zdGpC?=
 =?utf-8?B?dVBXOU10SlNPc1puNXhIWllHZWVFclFkalo5ZnIvdk1kVjEyQy9pZmo1TGdS?=
 =?utf-8?B?NmFMeTYzd1JrbEpBVTQzVWRIY0MwQ1FSTGFMallhMnZ4L2pmWFlPanhEWEFq?=
 =?utf-8?B?NE04T1ArRXdHV1R2SUJPZnpIOXVmMnFheFdZR2VqTnRoQTM3VmU5MTNtcUc4?=
 =?utf-8?B?RHhEeTA3OG9ZRXMrZlIxZ2JqWDlTYzNXOEpSWm1mbStxZFVqcE5lTVVWbkUr?=
 =?utf-8?B?UWUyRHRaU3YrZEZtMVMzWmpyVHBUdXBBK09kR2hwVWZqemZjVERpZnNmd3ZD?=
 =?utf-8?B?VEdQVmkrY0RkdFEzL2xrSEpMeS9VWVdPWGZrWUVxV3ZvcklZUVVZWWVSTXB2?=
 =?utf-8?B?RlVRN2pBMW95MmV0YTFTSEhHcGpFNW1ES3V0Qms3MnMrYWNMSUFxQUViVmVV?=
 =?utf-8?Q?ZAoYWz?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB6226.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZlE5eURSbFNBU0xUS1pSa3ZFR3FmUjh4SGRHVk51UTE4MUM2ZkJ1MDVXb1Bn?=
 =?utf-8?B?Mm5sQ2d5d1Q2V0k2SlhsUDdwc2NNY2JwUU5GeGVRWTV2NVZKQWx0TTFjblpO?=
 =?utf-8?B?ZVdiZm02RXBHK2xCdGtXRnFqTVk2dWpQcmp0dEQ4VllVcklhZmdCS1pzU1I2?=
 =?utf-8?B?emJmMjRRNitqRmlRTkp5dU5rRHFKSnEwbDVvb0xkTzZzN2FHdjJwTktpZXNi?=
 =?utf-8?B?NjZtYWdjTS8rV3dNVktTekNRMjNwYXdKYTkybEVUdTF6cDR3VWtDT2M2OCt4?=
 =?utf-8?B?SjBXZ3dSa3VHaUErL1IwNnFyRHUzWmRqUmJJdFdHWmkxNjlVU2VqR3FBRkZj?=
 =?utf-8?B?bHdMa0dWb3IzdW9uMEhqdy9pa1FQSmkvMTBkcWlJcnREWGdSUERWUmRSMjZ2?=
 =?utf-8?B?UmxrcHJ2eURFbE9NdW1uZTVobThVZTJRbU8wWjQ4ZDhwMnQ0YjVUN2RFUGpj?=
 =?utf-8?B?RkNwMnBpK2dBcXpEeXZBNnB1K2hVZGRHNTdZZmdxUTZ2TElFZERKMzBERmZv?=
 =?utf-8?B?M21WUCtIMzVoWUF5cGMxRmxtQnQwTytyRW9MdXFMNEZmUytZVk0rbm1OamR4?=
 =?utf-8?B?U3Z6ZjF0T1ZsYWNBZTBTQUw4MlozU2RsWHBkWnpFM1dXRmxiL0tZRjRGU084?=
 =?utf-8?B?L3lwNUt4WjQ2YjA2S05RU1lVS0c2S2JzbjJxTklTZ1VVM0Z4Ym1PYVBuL09M?=
 =?utf-8?B?SFd4QXIwS0hHTkNHMW4vclc3RVJjVEFBSlhBRlFZSUZBdlZaZGtDbTZPamR3?=
 =?utf-8?B?UDVVeE5La2VkdDhzWUJ3RTYxNGhPcWErbXRRMEdGM2gwcDUySWZLMVVTZkVD?=
 =?utf-8?B?TTRTb1RnMUVQOWhpNUlYdWJyaGRvRUdkZTlqVEVBL3NoNmY0ay9vUjVxV0Yv?=
 =?utf-8?B?WGhTZUZEY0ozYmEwNnAvMTBlejFEZXhMOFJadXJpRXJKczhnTjdUaWttdXh4?=
 =?utf-8?B?dFhoamx3dmdpbFVRbDArYjh3dkhhUFFBOTRuZXVJcy9aY2lhbEdwMnRVOHlU?=
 =?utf-8?B?cTNpQ0FZREp1NlkzTFBDZjBTNnRhd1VOc0R3aWN5YzFDZ0c3VURiSk0yUUJH?=
 =?utf-8?B?T05vOWdkNXNlVHBvWSsveG1qUU93QUtuRFpza0Qway95MXMrMU9nWStoNS9X?=
 =?utf-8?B?TUhYd0MxR0JBeEZ0R2pZMTNwVmZLTC9OOXBLbVUzRWJ6eFd6SnNNQ3N1blJj?=
 =?utf-8?B?c2RTYmhxNUFmTEVsRXVLam5OT05wZ2dJeExUSUhyVjUyYlZuK0pvVVJCd254?=
 =?utf-8?B?TC9OR21kSW9qdGVRWEpmUlNsalZxclNHVGR1OXNKRTY2TTdTOFl5Z2dwMnNV?=
 =?utf-8?B?bjZ2WXNhbU5tMkZZQ2NHeElOMTRLTmdGYmc0SFpsbDdtbVVIWGxTdS8xbUtz?=
 =?utf-8?B?NFlFRmJRNkpoeVNxYmV0TStCa3g0M1A2MFFBS0VzMWhZNmJham9KVVZ3bE9W?=
 =?utf-8?B?TGZmL2FnbklMMTdLcmxScDVmZ05Md20wOWh3V0dZVkZiMVZuOWQ1TGwzZnFx?=
 =?utf-8?B?ZWdZZy9lbVZzb3JRdmFTSEVOeEVHY1EwemRqRXVUSDJ6dkM2L2dTbzVjVDFr?=
 =?utf-8?B?TlIzWjNqdWF2NzE5N1V5WmZXOXcxT25MTkxGS292YlFvakdZa1VLdXRLVTdZ?=
 =?utf-8?B?M2FudWJlMG9DMEdaTHRCUHljY2lUUHdtV2FSOUM4YkhIZjFvdm9PYzNybWRi?=
 =?utf-8?B?RzFEc2w2elZrUEc5R2U1QTRLc1ZyaTVuci9CVDJKV2tQeEdYQlZwd0NSb2VM?=
 =?utf-8?B?NWFuaW03R0JKYUJzdXg5bmxPOFp5K204L3lXb0F5MVMxT0JOaFNtWHltQ3Ax?=
 =?utf-8?B?WFFZVUV2cHNtcW9BSFhjeThMTktRY1JKZEF5MjV5TEdHRnhaSzhrU1V5Zmpu?=
 =?utf-8?B?MythL2c1RCtEQiszUlN0Qm55NktyMG54VFBUZ0tNMnhFdmdMZldtMW9MMW14?=
 =?utf-8?B?czU0eUUvQ0dKbVk1SHlnem1lY0V6NGtrNTVzWUF4b2Q0TzF3ejlmYklINU9F?=
 =?utf-8?B?ODd3MndPTzNVZktEZnNQR0hEeFdTRTlQeGdDOVZvK21Yd1ZNR0JQdGtzTHAw?=
 =?utf-8?B?SGRidVQ0T2tGOWlObVRxQzBnQi9yY1dzbTV5Y0NGMmRTNnNqbnYzNGh2ZE9E?=
 =?utf-8?Q?gj/uWqgnL9lKJuJiITE+VKFDJ?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 07f37fb6-f42a-481b-da93-08de33f0a56a
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2025 11:22:59.3417
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M1lSHikQy7YQKOVJ9SIdha22Ki34GkAPyrw1d+dQse9XrxqjOmTkTaTPlU16K2X/l8ikqm+bhk9OnliFRLZnf45a/sKNQx4zYh3gOWRfeVo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYPPR06MB8020

DQpIZWxsbyBLcnp5c3p0b2YsDQoNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBG
cm9tOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IEZyaWRh
eSwgRGVjZW1iZXIgNSwgMjAyNSA3OjE2IFBNDQo+IFRvOiBKb2FraW0gWmhhbmcgPGpvYWtpbS56
aGFuZ0BjaXh0ZWNoLmNvbT4NCj4gQ2M6IGxnaXJkd29vZEBnbWFpbC5jb207IGJyb29uaWVAa2Vy
bmVsLm9yZzsgcm9iaEBrZXJuZWwub3JnOw0KPiBrcnprK2R0QGtlcm5lbC5vcmc7IGNvbm9yK2R0
QGtlcm5lbC5vcmc7IHBlcmV4QHBlcmV4LmN6Ow0KPiB0aXdhaUBzdXNlLmNvbTsgbGludXgtc291
bmRAdmdlci5rZXJuZWwub3JnOyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsNCj4gY2l4LWtl
cm5lbC11cHN0cmVhbSA8Y2l4LWtlcm5lbC11cHN0cmVhbUBjaXh0ZWNoLmNvbT4NCj4gU3ViamVj
dDogUmU6IFtQQVRDSCB2NCAxLzNdIEFMU0E6IGhkYTogZHQtYmluZGluZ3M6IGFkZCBDSVggSVBC
TE9RIEhEQQ0KPiBjb250cm9sbGVyIHN1cHBvcnQNCj4gDQo+IEVYVEVSTkFMIEVNQUlMDQo+IA0K
PiBPbiAwNS8xMi8yMDI1IDEwOjI2LCBKb2FraW0gWmhhbmcgd3JvdGU6DQo+ID4+PiArDQo+ID4+
PiArICBjbG9ja3M6DQo+ID4+PiArICAgIG1heEl0ZW1zOiAyDQo+ID4+PiArDQo+ID4+PiArICBj
bG9jay1uYW1lczoNCj4gPj4+ICsgICAgaXRlbXM6DQo+ID4+PiArICAgICAgLSBjb25zdDogc3lz
Y2xrDQo+ID4+PiArICAgICAgLSBjb25zdDogY2xrNDhtDQo+ID4+DQo+ID4+IEhvdyBpcyB0aGUg
cGluIG9yIGNsb2NrIGlucHV0IG5hbWVkPyBJdCdzIHJlYWxseSBjbGs0OG0/IFRoaXMgbG9va3MN
Cj4gPj4gb2RkbHkgc3BlY2lmaWMgYWJvdXQgZnJlcXVlbmN5Lg0KPiA+DQo+ID4gSSBkb3VibGUg
Y29uZmlybSB3aXRoIG91ciBTb0MgY29sbGVhZ3VlLCBpdCByZWFsbHkgbmVlZHMgdGhpcyA0OE0g
Y2xvY2sgZmVlZA0KPiB0byB0aGlzIEhEQSBjb250cm9sbGVyLCBpZiB5b3UgdGhpbmsgdGhpcyBu
YW1lIG5vdCBxdWl0ZSBnb29kLCBJIGNhbiByZW5hbWUgdG8NCj4gInBlciIsIGFzIG1vc3QgZHJp
dmVyIGRpZC4NCj4gPiBTdWNoIGFzLCAiaXBnIiBhbmQgInBlciIgaGVyZS4NCj4gDQo+IEkgdW5k
ZXJzdGFuZCB0aGF0IGNsb2NrcyBpcyA0OE1IeiwgYnV0IGhvdyB0aGUgaW5wdXQgaXMgY2FsbGVk
IGluIHRoZQ0KPiBkYXRhc2hlZXQgb3Igc2NoZW1hdGljcyAoaW5wdXQsIG5vdCBvdXRwdXQgZnJv
bSBjbG9jayBjb250cm9sbGVyKT8NCg0KSSBkb24ndCBrbm93IGlmIEkgZnVsbHkgdW5kZXJzdGFu
ZCB5b3VyIG1lYW5pbmcsIEknbGwgdHJ5IG15IGJlc3QgdG8gYW5zd2VyLCB0aGlzIDQ4TSBpcyB0
aGUgY2xvY2sgb3V0cHV0IGZyb20gdGhlIGNsb2NrIGNvbnRyb2xsZXIgdGhlbiBmZWVkIGludG8g
aGRhIGNvbnRyb2xsZXIuDQoNCkpvYWtpbQ0K
