Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013021.outbound.protection.outlook.com [52.101.127.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E8B40682E;
	Fri, 24 Jul 2026 11:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784894195; cv=fail; b=Fj5O+e1UDT0MLtRUVIqx6C/orYwITu0QXhXtSFwxccdXjwGNR7bxJ85LDCF+96skfT2NkHSnmBfkF56+s+YiPN7urRpNpHq1E+reOWBQN9Cqb0wYXF4lTfnKP3CMQmqH6MZ6lMTrhrSe1WzDgYfyASD/4QiAh+n5dcOnNxbWmYI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784894195; c=relaxed/simple;
	bh=BzRohJxOBKjxsfPG+NBfcT85iXV6fCqg7iKEWlkNqVg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UPzi2PQEAb3fY61UiOQBjfDX/WoAr0eEjGwiygm/PTd6zRpGF6AeJbFu7pVr96HjKLXzVOrFzJrR8aFOec66OgGDA8vmXNNoAi/9/7a6JM7/eI4nlQUYwrwGIRExpUsgXTN/AhaIL46OY1UKdQkf56pLvIISGYRDCLuvOIgXTCg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=GFnIrf5V; arc=fail smtp.client-ip=52.101.127.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="GFnIrf5V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yeXEqiJEekUVVxuR3l5Exg3lRc2GF8IB9Z6LxgWZt8YOoeyqYKnaEjyTBiGj/y4cEqWlzTfEX+PI7isyp0CU47Uca3gCXNlxmavmzmfgOEenoMpT27dafX+ze7dF5DgBXSkHz4UBQDHDB4Cz1JFUBdrEw6fAaCjrZ2lK1q6e+HsY6S9wPMKJlKkZlEVtKmrwoVwDXeTNV6KAukeE2TcuKG65F4IKBDrheGh1Z6wt9DFjLs8QvZvKha85Q2EOQeYFIECVlpJ6BdCV9Rv+M0qPVwXdxvZSX0PZIvyp0WvDf/gkYq4dgRLiNTSfOWfJZfeS16FIO4yJCqyH4cuJ+uBcPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BzRohJxOBKjxsfPG+NBfcT85iXV6fCqg7iKEWlkNqVg=;
 b=FAgQrj2H/ZVa+dof8ire6wlDAV/9F+QzpfzEIuEWPBshpCJkUeFGr/SnF8VjZgk7SNnOctrr0znMf8TRxLqB/hMUr6SbvjEWYp9+Jw4W+Qrz2EQ+zokdLxeAmm12HokiwQXvsC7DF3y2Kk+pc3gvEeE380TkmcGOtso0l1QxLfIS7t55EDTz2nD9i/gD94ke7DgJbb3dlluJ/JHY36TeOvKYgtjGW2IWGuLKmgr3HhrYDjp95cREN3QKe/vC37hOesMlyOvreuvPSpORyvsrjxW0gU0PxeSYK6gmeQ3P31ZXN11IDmnuj2KiflA7Ws8ntma+ULnI/j1DyGYLizS9ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BzRohJxOBKjxsfPG+NBfcT85iXV6fCqg7iKEWlkNqVg=;
 b=GFnIrf5VZlZ21z8OlGCjnB4HLtz1KzbsgMXDzHavlAUpD2yrnXZoqi+VlVSIM6kBvMr/uZhNp3vWv2TwjysY+x0f0+mw4BnmODC+YndiEsaUsabbvWE9H6hWED25LwIXRt99sxsS80cG/gmFDz4Rf/nnJ9TPINp1lLejN01Sla5hcVOyjq5KcbdIg+4KbAChzT0gz0vYXJdOqwrcfqDqy/spXhWXpmJiCUCWE+FKoFBMO/wEJDBjPmWbejZjIDRTVDycyMlx8x86IsVH/4WRL7glDjatcrT5ZJAAoiYL6pJkkqFBTJObGJYYNWIdjt8NnGxxxxlqOwoQjqC/3/SwIQ==
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com (2603:1096:400:358::7)
 by TY0PR06MB5681.apcprd06.prod.outlook.com (2603:1096:400:275::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Fri, 24 Jul
 2026 11:56:26 +0000
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc]) by TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc%6]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 11:56:26 +0000
From: =?gb2312?B?uvrBrMfa?= <hulianqin@vivo.com>
To: Takashi Iwai <tiwai@suse.de>, Rong Zhang <i@rong.moe>
CC: "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject:
 =?gb2312?B?tPC4tDogW1BBVENIXSBBTFNBOiB1c2ItYXVkaW86IEFkZCBpZmFjZSByZXNl?=
 =?gb2312?Q?t_and_delay_quirk_for_JKY_Technology_Q2A?=
Thread-Topic: [PATCH] ALSA: usb-audio: Add iface reset and delay quirk for JKY
 Technology Q2A
Thread-Index: Ad0bRhPoJJEBfya5Q7SBchl1mjk0TwAFrMMAAADFlwAAANrqcA==
Date: Fri, 24 Jul 2026 11:56:26 +0000
Message-ID:
 <TYUPR06MB62178484B219BDB18CB0CD82D2CF2@TYUPR06MB6217.apcprd06.prod.outlook.com>
References:
 <TYUPR06MB6217BD7BF1AE9B308295FFFCD2CF2@TYUPR06MB6217.apcprd06.prod.outlook.com>
	<2cb27fb80f6fbdbd3b72138ce2d33c878e4e8049.camel@rong.moe>
 <87v7a4d3q3.wl-tiwai@suse.de>
In-Reply-To: <87v7a4d3q3.wl-tiwai@suse.de>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYUPR06MB6217:EE_|TY0PR06MB5681:EE_
x-ms-office365-filtering-correlation-id: 8ea653af-af61-4e93-0c98-08dee97a9701
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|42112799006|23010399003|376014|38070700021|18002099003|22082099003|10067099003|11063799006|4143699003|56012099006;
x-microsoft-antispam-message-info:
 /BocAal6WmJD7mayxPsc76Ht9pnfHqwqA+K0kz6EKDZw5QDPGKc/QjAJkFjZ8dRkd2J71Z7/HY0Ge4fJQSToSRqkzEkRbzO+04o7vH3svwgAlyirUvSRxCeJETwZiIUyU1ZOk+uYz4CNe/xeHnG+rydPWGky/w5/j+zb94xRs+kTKJHu6o+CVlGvso72CfgcIDa3IAa3q6EEdZiuPyEBb+vNm4DRBDR9ElCy1Q+S/mrefSf96C7I5IdQYG+m6ZFQd45RcfZH3zeaZAIeuHMRMMnBLtO4m3nXnsdrt3Md0kZDZz+C0maoEtg0F80qoVfrNPYNzETyQmZofbSdul4kImHutNRMRpI5LwWu55LJJ45GXqRiyFQl6KhnrzcKjNFIPLS19glimuTOR1H+uTbv8hDbE9uYY9ToArOPr3OGJeR4XUSh2z5/Ive6l9MSdGSxwN7Gf8IpLmHrAwDW281H3aAbmpkzOxqb54eZdiPuC6Xff1BVk7h7Pmj7N9oAk6bAMl5bTiMpZ2NEuae9F0+e7MkE7ivAEzJwMZttdEkkJCrnjOhgNgznBanQFu7aZn1cnR5R9yIJkGGd/ClbldSJ1OsX2QiZkcxsiuo8NTL8lSsnCq6JW5zfp+tZZtqax8DE4Ypm3J6gBg4zGeluSgrakvFA/YEeg4Uv27/1Wtvor4msKiuqM0lOwLUHCNucFkBV3gBeCPMDSuH2EAgNJMW8VE4uO/PzUGM1FWTTsgosu04=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYUPR06MB6217.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(42112799006)(23010399003)(376014)(38070700021)(18002099003)(22082099003)(10067099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?MGlHT1VBdkVQdHJKL2M3VlNzYS9haUlYbkJBQ0dBdWRkNHpibklrTG4wVUIv?=
 =?gb2312?B?c01adndFUE5JenlabmxSRkdiRlhJQkxHZFJmZ1RxRFJUdTIvN2E0VU5hQ0li?=
 =?gb2312?B?TjBGeHdFbkI2Mm9saHZtcGxjMGxSKzRxYnkxQnkyUVNub1Z5blkvTFU4ZG9D?=
 =?gb2312?B?Y29UL00zQjhmUEtrell2aVBLdktTb2RCUG5Qc3RPcXdhY1hHbmViU01HVnZL?=
 =?gb2312?B?TllETTBlLzRKOGozeGNuTmJad3JtNVdONFRDaGkzelFrenA5SzlMWUIyR1pp?=
 =?gb2312?B?L0ZOQWZRbW54V3BKY0VOcGVqZUFsb2JjYnBKdkFiM3Zxa09TTXBhdUIwN3U5?=
 =?gb2312?B?ODZrZ0Mzbi9ObitiSy9ERkRFSERvOVdOdGRpVkM1MnJMcEdBMFBZY0NvenZ1?=
 =?gb2312?B?ZnhvWEFsNlNna0RwQmN3TjVOUURLN1FGUlV6cnZXWDh4NTdINWtlUjBxVTZo?=
 =?gb2312?B?WXgvUHgySjMxTEZHeE5jOUF4Y1U4eVFGdE1wSUcyV3UyUXB1cXVXdGFRVzdo?=
 =?gb2312?B?MTFOdzZXRjdseWZ0eWhDMnJSdTVvYlg1MXQ4a3JiZnVXeWhaSjlxWHdRNllp?=
 =?gb2312?B?eXQ0ai95SHcwcjZCa3Zlem9KemRUcEdTYjJZQTYreE51V3VlczQ4b3crc2Yx?=
 =?gb2312?B?UXJ5THRac2grQkwrYVR1dEtTKzFGTytDV2Y0NUNSWnRxN25iRzlwQjVqcytm?=
 =?gb2312?B?YjU4cUk5MDFhN0Y1NlUxUmcxVVVzR2VmNDNFWEZLNE5YQU82QlI1SWFhOG10?=
 =?gb2312?B?RXlPSHdzSUtJbDNtckNEQkw5V2EvVEN5S0RLaVhsVTBLL3lObkkxcFZkMmVS?=
 =?gb2312?B?WXUwbERtRHZoMmRvQXJNeGRWd20vVnA4cGV3VytIU0pQeXl3ZVBYbVFETHFR?=
 =?gb2312?B?T2hTeFoyamlQMG9RVEIySWQ3UUtTM3JmTzBwNVN5dEcxdkRhM3pMM09EZ1Zq?=
 =?gb2312?B?Mzhhb29TQnJRTEpyZmRyREVsMEZvbklnQW55OXIyVkF6UW8rVWpVelBnRitx?=
 =?gb2312?B?T0p5UGlZNHNFN2ZBeG5ndTZ3Z3kyc096MDVYVlgzdDd6WmxYVFdGd2dXVUFh?=
 =?gb2312?B?L2EydWNJejhuVnI3Q3dkMldwa2JMby9QTXc3YUNLdXJPM1g0ZUJNVUliTCtE?=
 =?gb2312?B?b09rTXBqZGdPZVZYMDlBSEMybGRHaGFZcEFEUjFxVTE0Q2l3OXVCazFUeHRV?=
 =?gb2312?B?NkVCelNOeCtMeTl1U2s3c2N2NEZtelJOQldmZFQwOC9PQVNLRFRBUCtGZzNu?=
 =?gb2312?B?WWozelhYWnpuakxOUHpYOG5oUml1WXRmMHVOWVp0NWduZVBYTFNJSEVqeXJH?=
 =?gb2312?B?aUVkNmtOeTdYWUxBZ05xYlh4RFgyd2xRRUwrS0V2bXhGMkJlV2FXNFpIVWtJ?=
 =?gb2312?B?aytGR2hSTkU4TzVSY1NWeVlRSzlCR1pPT0p1VW1UVGxQbHk3R09sTGJ2QU9t?=
 =?gb2312?B?NkVBQUtBTEZ1K2NRcXNvRnBveG82OWJzd0FUMHdWRnBiOGR4Ni90RHFmYXZS?=
 =?gb2312?B?UytRekZYVEpjdkNyaHdmdFlTUXM3MFQ5a0ZrSkQrenJsRkZ5bWZUMEIwQ3pI?=
 =?gb2312?B?N2JXUlpSMjRvd1AxREd1TGpUWlBycU15NzRMMk1PYzJtRVFjckZSRngzaFhR?=
 =?gb2312?B?c1VIU29tZTBPNHBFYVh0T3NweVk1cmFndFZ1YnliaHNXckMwQmllenZ0WXBK?=
 =?gb2312?B?NjdVTUorNGpGcmo2ZVdyWFRLaE5McUhYM0k5SWJpWVR0NDc3TDMwbDJUNEk1?=
 =?gb2312?B?cXRCYVZwaDgwdWU4S2JRRGwremUzVUdtdlpMY1dmRVkvSm5MNWx3SERMMFlY?=
 =?gb2312?B?T1p4YU5abytGMVRVTlQ2T1pkcGRSQTlWYmpLbk5tUGQyNkQ4aGozb3Ayc1BZ?=
 =?gb2312?B?d08yRks1ajR1eUQxWVJIUlF3Z1IrVEY4Umw5cjExb0ZvTmhzU2ptejFWK3hN?=
 =?gb2312?B?RUsyakZ4M0UzZHJQQS96UzgrR3Q1eEljdjIwVDBaM1VEOVZ2OUwwdVZUQlo4?=
 =?gb2312?B?UWcrVnBsUzdSTWNSSGQ5NTFCWU9lSXVnOHlzTzNDMUk0RTRiT3p2dTVQdVdJ?=
 =?gb2312?B?SCsyOE9FVlM4NXhjUU5HVHBXWDYrOHc3L1BuaWpMQkE2UHp2K253QnpjYWU0?=
 =?gb2312?B?TE1ESkZSdVM5eHNwdE9MeUlBWlVPT1h1VnpLMDhKQU9vZXZpdlNwODFzTFVu?=
 =?gb2312?B?R05CNlpCUlY1U24xVWNjSWNHc00zdDRBUC9LWmpuMW15UW00M0FxeUg3VDRY?=
 =?gb2312?Q?Ib6UlmDhAON0+xTNjgbRVsmiqrjiAqOGn6xCmdETLY=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ea653af-af61-4e93-0c98-08dee97a9701
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2026 11:56:26.1812
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: guSy8sc/4z6zwC3m0o8eLEBnzxghbEAeQJWbI6HghplAVA+iiGHoBnyljwJoeftvl2lS4p0ieRqZ5Wf17fJYBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5681

SGkgVGFrYXNoaToNCg0KPiA+DQo+ID4gT24gRnJpLCAyMDI2LTA3LTI0IGF0IDA4OjI5ICswMDAw
LCC6+sGsx9ogd3JvdGU6DQo+ID4gPiBTZXR0aW5nIHVwIHRoZSBpbnRlcmZhY2Ugd2hlbiBzdXNw
ZW5kZWQvcmVzdW1pbmcgZmFpbHMgb24gdGhpcyBjYXJkLg0KPiA+ID4gQWRkaW5nIGEgcmVzZXQg
YW5kIGRlbGF5IHF1aXJrIHdpbGwgZWxpbWluYXRlIHRoaXMgcHJvYmxlbS4NCj4gPiA+DQo+ID4g
PiBOb3RlOiBUaGlzIGRldmljZSBtaXN1c2VzIHRoZSBBcHBsZSBWSUQgKDB4MDVhYykgJiBQSUQg
KDB4MTEwYikuDQo+ID4NCj4gPiBUaGUgZGV2aWNlJ3MgVklEIGNvbmZsaWN0cyB3aXRoIEFwcGxl
J3MsIGJ1dCB0aGVyZSBpcyBubyBQSUQgY29uZmxpY3QsDQo+ID4gcmlnaHQ/DQo+ID4NCj4gPiBJ
ZiBhIG1hbnVmYWN0dXJlciB1c2VzIG90aGVyJ3MgVklELCBpdCdzIGEgVklEIGNvbmZsaWN0LiBU
aGUgZGV2aWNlDQo+ID4gZmFsbHMgaW50byB0aGlzIGNhdGVnb3J5Lg0KPiA+DQo+ID4gSWYgdGhl
IG1hbnVmYWN0dXJlciB1c2VzIHRoZSBzYW1lIFBJRCBhbW9uZyBkaWZmZXJlbnQgcHJvZHVjdHMs
IGl0J3MgYQ0KPiA+IFBJRCBjb25mbGljdC4gSSBkb24ndCB0aGluayBpdCdzIHRoZSBjYXNlIG9m
IHRoZSBkZXZpY2UsIHVubGVzcyBKS1kNCj4gPiBUZWNobm9sb2d5IHJldXNlcyBQSUQgMHgxMTBi
IGZvciBwcm9kdWN0cyBvdGhlciB0aGFuIFEyQS4NCj4gPg0KPiA+ID4NCj4gPiA+IHVzYiAxLTE6
IE5ldyBVU0IgZGV2aWNlIGZvdW5kLCBpZFZlbmRvcj0wNWFjLCBpZFByb2R1Y3Q9MTEwYg0KPiA+
ID4gdXNiIDEtMTogTmV3IFVTQiBkZXZpY2Ugc3RyaW5nczogTWZyPTEsIFByb2R1Y3Q9MiwgU2Vy
aWFsTnVtYmVyPTMNCj4gPiA+IHVzYiAxLTE6IFByb2R1Y3Q6IFEyQQ0KPiA+ID4gdXNiIDEtMTog
TWFudWZhY3R1cmVyOiBKS1kgVGVjaG5vbG9neQ0KPiA+ID4gdXNiIDEtMTogU2VyaWFsTnVtYmVy
OiAzMzAyNzBEMjI1MTIyNQ0KPiA+ID4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IExpYW5xaW4gSHUg
PGh1bGlhbnFpbkB2aXZvLmNvbT4NCj4gPiA+IC0tLQ0KPiA+ID4gIHNvdW5kL3VzYi9xdWlya3Mu
YyB8IDIgKysNCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+ID4gPg0K
PiA+ID4gZGlmZiAtLWdpdCBhL3NvdW5kL3VzYi9xdWlya3MuYyBiL3NvdW5kL3VzYi9xdWlya3Mu
Yw0KPiA+ID4gaW5kZXggMGRlN2M5ZDk0MjU5Li5hZDJjZTM4NGUzMmQgMTAwNjQ0DQo+ID4gPiAt
LS0gYS9zb3VuZC91c2IvcXVpcmtzLmMNCj4gPiA+ICsrKyBiL3NvdW5kL3VzYi9xdWlya3MuYw0K
PiA+ID4gQEAgLTIyMDAsNiArMjIwMCw4IEBAIHN0cnVjdCB1c2JfYXVkaW9fcXVpcmtfZmxhZ3Nf
dGFibGUgew0KPiA+ID4NCj4gPiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0IHVzYl9hdWRpb19xdWly
a19mbGFnc190YWJsZSBxdWlya19mbGFnc190YWJsZVtdID0gew0KPiA+ID4gIAkvKiBEZXZpY2Ug
YW5kIHN0cmluZyBkZXNjcmlwdG9yIG1hdGNoZXMgKi8NCj4gPiA+ICsJREVWSUNFX1NUUklOR19G
TEcoMHgwNWFjLCAweDExMGIsICJKS1kgVGVjaG5vbG9neSIsICJRMkEiLCAvKiBKS1kgVGVjaG5v
bG9neSBRMkEgKi8NCj4gPg0KPiA+IEhlbmNlLCBJIGRvbid0IHRoaW5rIGl0J3MgbmVjZXNzYXJ5
IHRvIG1hdGNoICJRMkEiIGhlcmUuDQo+ID4NCj4gPiBNZWFud2hpbGUsIGluIGFueSBjYXNlLCB0
aGUgY29tbWVudCBzaG91bGQgZGVzY3JpYmUgdGhlIFZJRC9QSUQgY29uZmxpY3QNCj4gPiBpbnN0
ZWFkIG9mIHJlcGVhdGluZyB0aGUgc3RyaW5nIGRlc2NyaXB0b3IocykgYmVpbmcgbWF0Y2hlZCwg
YW5kIHRoZQ0KPiA+IHN0cmluZ3Mgc2hvdWxkIGJyZWFrIGludG8gYW5vdGhlciBsaW5lLg0KPiA+
DQo+ID4gU2VlIGhvdyBjb21taXQgYjEzMDMxY2ExMTJhICgiQUxTQTogdXNiLWF1ZGlvOiBEZWNv
bmZsaWN0IFZJRCBiZXR3ZWVuDQo+ID4gRm9jdXNyaXRlIE5vdmF0aW9uICYgTVYtU0lMSUNPTiIp
IGRlc2NyaWJlIHRoZSBjb25mbGljdCBhbmQgYXJyYW5nZQ0KPiA+IGxpbmVzLg0KPiA+DQo+ID4g
PiArCQkgICBRVUlSS19GTEFHX0ZPUkNFX0lGQUNFX1JFU0VUIHwgUVVJUktfRkxBR19JRkFDRV9E
RUxBWSksDQo+ID4NCj4gPiBCYWQgaW5kZW50Lg0KPiA+DQo+ID4gVGhpcyBpcyB0aGUgZmlyc3Qg
REVWSUNFX1NUUklOR19GTEcoKSBpdGVtLCBzbyBwbGVhc2UgZG9uJ3Qgc2V0IGEgYmFkDQo+ID4g
ZXhhbXBsZS4gSSB3b3VsZCBwcmVmZXI6DQo+ID4NCj4gPiAJREVWSUNFX1NUUklOR19GTEcoMHgw
NWFjLCAweDExMGIsIC8qIFZJRCBjb25mbGljdHMgd2l0aCBBcHBsZSAqLw0KPiA+IAkJCSAgIkpL
WSBUZWNobm9sb2d5IiwgTlVMTCAvKiBRMkEgKi8sDQo+ID4gCQkJICBRVUlSS19GTEFHX0ZPUkNF
X0lGQUNFX1JFU0VUIHwgUVVJUktfRkxBR19JRkFDRV9ERUxBWSksDQo+ID4NCj4gDQo+IE9LLCB0
aGVuIEkgc2NyYXRjaCB0aGUgY29tbWl0IG5vdyA6KQ0KPiBQbGVhc2UgcmVzdWJtaXQgdGhlIGNv
cnJlY3RlZCBwYXRjaC4NCg0KSSdsbCBtYWtlIHRoZSBjaGFuZ2VzIGFjY29yZGluZyB0byBSb25n
J3Mgc3VnZ2VzdGlvbiBhbmQgc2VuZCBvdXQgdGhlIG5ldyBwYXRjaCBsYXRlci4NCg0KVGhhbmtz
DQo=
