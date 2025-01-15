Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sg2apc01on2080.outbound.protection.outlook.com [40.107.215.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4EA20B810;
	Wed, 15 Jan 2025 09:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736933565; cv=fail; b=IO8o87qII/p1FhsHeCieysqxZse7eYGXb87uaxPmuT1aZbxoXlB8wUuCCSpfsHkwO/GFTFHUpNyhS2SDbieVz7okKZwseJt9wsMH2qcUJ/SWCiIekRd8fwQJeDT9r2FOBqK0PyjQ01ziA1ovAX2Likb48JZPh5Q0J6I13dz/LpE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736933565; c=relaxed/simple;
	bh=nVo69RDfwGBIQVawOOZpY8Lk5ECwBWehqUsGB7F4PLQ=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=aNTwXgUt7agEuR1/gEKktJwCIhBjpVfNuXVG8a2FwPqb7iMIb/M8oBgnqb7wRCgKjeABDns5eP7TgFZgiGA80oaclWWOu09z7d2QcSsr+GIurpnI1xr0YKe0SsJB3CR2lpWWYapzMlOOQ4KCsgB1929/IEFfJDREffbi1OefZmk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=hVTFWKIl; arc=fail smtp.client-ip=40.107.215.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="hVTFWKIl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gWqr21YyXlSVS1p9U2Vx7HD2Fl9JBd6s57VJtTgfJQY8sJL/e0gVby8rp2uIxMvSIo5QShrmzBCePgmdLu8Gr5GHOF9Tiv5m3Y3RBF5Uur5yt/AabS1ZH34EF6LeOrNJi6kAGH41QD/odefJIvCGUGFuYIrR6Z/GqHk0QmHbQRTb61vnFhPSeQaqc1ed3Xoah8opn2A33p2RMqxMGfPjOqmDe8Uwszp0RMm2YlLGJNs78N7t7cXaYNzM5wkkSUxhNPmGqFdoTWMFcRVX6a7/IdkGT9tEKopiydx/la4NoTqzNGqkK6EWDcFp2CVr9uOb51O34qmEWEojcKtkq4tcbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nVo69RDfwGBIQVawOOZpY8Lk5ECwBWehqUsGB7F4PLQ=;
 b=RPgSXAEM5DnTJAKQe8RSDScwy9SCVU7Y3/tR08o4c935ypOLu52SclA4a4oQnycUFOY+e7wgbV90JSwMJwZ8QwCCghYo/Pr2V93qRXN5AI7LQ1n6w66ASZdqJPPld08D17zeyad8vBQufp8fAecubnAFle/diQgRs9/CuHfd7fpdBKvXXlIbaPpfNx1LxpiK0AkiKtO7pfixSYFvz53NqsGcSr1EByOutSRVkVx4G6Gg3nYVH6jrRNEHuskt58cNiuqi+tIuatCQrPubGSpZIDTk+Llih9qhgRo4AqSGVKin2WDG1dONjIxjLrDiEz9/LDa9dK3gVp6zWfbQTNpKDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nVo69RDfwGBIQVawOOZpY8Lk5ECwBWehqUsGB7F4PLQ=;
 b=hVTFWKIlaLUH7dtX23GZl1x1PUkq5CxQdoY9CXwq+M2/KxfkL45diUlDyHYmFdbgrZiZH2+hsuph6pewrX/Ov68Ghf1ifOx/sH8ewVBoEOnNyE5/lIZHwtR6LrvZTHmmN70TLg97S2zjsj8QdfK1loPFHA3O+dAzANrJdeR0mx7BT/5Ck30EIdtBNWMbDSbfvAjc6FARtnm469rTnw1lN2mt9W0d+0+Wr9qS+wP+sFeQy87dr9ABGK9rDfvs6z0Q9Y36/t8jRTMGAr1+wgicG0/EjYIQ9tB83EW3mskine2rskCvdbgAuS0rFHsDKTP+vygQ+48ph5X3kFR2t1klVA==
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com (2603:1096:400:358::7)
 by SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.11; Wed, 15 Jan
 2025 09:32:35 +0000
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::c18d:f7c6:7590:64fe]) by TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::c18d:f7c6:7590:64fe%7]) with mapi id 15.20.8356.009; Wed, 15 Jan 2025
 09:32:35 +0000
From: =?gb2312?B?uvrBrMfa?= <hulianqin@vivo.com>
To: "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
	"lina@asahilina.net" <lina@asahilina.net>, "mbarriolinares@gmail.com"
	<mbarriolinares@gmail.com>, "wangdicheng@kylinos.cn"
	<wangdicheng@kylinos.cn>, "cyan.vtb@gmail.com" <cyan.vtb@gmail.com>,
	"dan.carpenter@linaro.org" <dan.carpenter@linaro.org>, "bsevens@google.com"
	<bsevens@google.com>
CC: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?gb2312?B?uvrBrMfa?= <hulianqin@vivo.com>
Subject: [PATCH v2] ALSA: usb-audio: Add delay quirk for USB Audio Device
Thread-Topic: [PATCH v2] ALSA: usb-audio: Add delay quirk for USB Audio Device
Thread-Index: AdtnLwEf2pCc0pQaRz2DBvcsRcrMfA==
Date: Wed, 15 Jan 2025 09:32:35 +0000
Message-ID:
 <TYUPR06MB6217E94D922B9BF422A73F32D2192@TYUPR06MB6217.apcprd06.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYUPR06MB6217:EE_|SEZPR06MB5576:EE_
x-ms-office365-filtering-correlation-id: 2fbacff0-b15c-4829-9e6a-08dd35478b84
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?gb2312?B?VFJrWUd1Y21CZ2tockV1b2Urc2VXSEpCT1BuRFgyQ1FYTXZwdFRKWVNzY01z?=
 =?gb2312?B?cUJxVENNREtQTE9rVER0a0VXVEdTbHF6Z0Z1bDFRUjUvblNJTjFQWUU2cndq?=
 =?gb2312?B?WGlSd0lUaWo1ZE9JVis1MitsbHo3ZWQ5WG5mOUZoZGdDckQ0SzRNRy93VHE4?=
 =?gb2312?B?RjVnbGg3akhBT0FaWEJXWlZZaGpVVWRmanMxRDl0L1BUZjhTRWlYRzBQKzBJ?=
 =?gb2312?B?QThESWJEblhKN285aUhGaFM3eHJTcWw5V2hkanFlS1FRalhOM3Q2NWJCV0ZO?=
 =?gb2312?B?N2phTW9WbFJqZ3N0WmhtZUtnbkhkM01PNVNmLzI1NlFwVzFNcDlFVmErY2xS?=
 =?gb2312?B?bThGc2J5Y2JYNHk5dWhGdVZ2TmhuWThNL2JvL2ZPOUJXc3NxVVFPdll6Y0I0?=
 =?gb2312?B?Um50cENiOUlGc2RBbFRBeVVkR0ppRmZMcUovVnZHb3ZCblhsRHNwUFBvUDRB?=
 =?gb2312?B?WE42ZkxkZnBMSEZuUkxYbTdwa0RuNzQrejkzYys5RkNQSzdDeVlnMTZvdWNZ?=
 =?gb2312?B?NnFmWmhqSEt3dGFYVkpKdGRmdUxPWk8zNHlpMXRac2UraHVvM0s3TnFnUDBj?=
 =?gb2312?B?cURyQnRNRVJFRk15WHBkZ2N3M2x6WlpBZ3Jva0lTYUJJL0VlSmd0R21KWU5r?=
 =?gb2312?B?dDhUTExvM2JtcGt6ajRlazRsSlVVd0QrTnpNSjdXM0xBQ09PYXdrT0U2Vmt5?=
 =?gb2312?B?aUxtd3duYk1sajdnZSt2WEVTc25aNFk5Wjk3RmJoR3h0bnZNOXBLWVVHNzZL?=
 =?gb2312?B?NnNXTzlVR1RXaTAzcloxUHFmenY5TnRsV25nOC9FRDBLcUN2MnNCWHF3aVJt?=
 =?gb2312?B?V0hSeENUek1uMXJZakdKQVdxdTdad2NoT2ZKWmMxWWpOZExJeGNjMGNIdisr?=
 =?gb2312?B?Rkp6RnZESVQ4eUp0TzgrVTlQVG1rajR4Vzk4aGtmRTlucTExTkt1b0dzQ2VX?=
 =?gb2312?B?MGVRbmkrSFB6ZXEyYi9GdFNNT29kZkZJTWF1bEE3T0l4OFk0cVR2RlVwL0hr?=
 =?gb2312?B?L1ZhMHlzVVFMYXlLeVNrWG80UjNHTXhtTE5ZWlg4UStWWDFuUWVUeTY3ZWFa?=
 =?gb2312?B?Mkl4a0U5M3ZsY3Zad0ZRRjFoNVhPWTNOL0h4ZlFoS0paVzhMNCt1RThqWHND?=
 =?gb2312?B?YWgySUltQkFHWnZvYllWQy8rdDFES2h6UFhINDBXbnhpajZJYi8ydkNQWVB6?=
 =?gb2312?B?S2R0MzlIU0RCbkswK2prYlZhVG1JNnZvdGh1d1grVmYvalB1R1RIOGVadzVB?=
 =?gb2312?B?R3ZEOXVmUWRxdWJGVU41NFAzanpFd3MxY21Zc0hhdDJ0RlBqR0ZQWmxCZ3pn?=
 =?gb2312?B?UG01dlZ6MnRnTEJqbXQzKzQ0amp2K1NXbWhZekNSOGE3akdOT2FXVU5ISEdy?=
 =?gb2312?B?VWtSMnRuYVh0WDVVd3AyTzdvUk5Sa0xjVCtjVUdmWVRtUU1uYy9PbUlUVmxO?=
 =?gb2312?B?dTBmUGNKVWUxNWxjYnZ3Um9iSjVBSDVOV3ByYWJUaXo3bFhaU0VUb3AvbTNU?=
 =?gb2312?B?YkxqYnVvYnpMWTY3cTQ2M2s0eUlVek82djhqTkZmaE9HMXh0YlFtbTIyeFNv?=
 =?gb2312?B?K2ZHY1hqc3U3TVB3NU1oUyt3Qk9zdmNuU0FBd2g0MXR6bE9zRVJRTDQyMWxn?=
 =?gb2312?B?NW1YMkkvQ3ZMU0ZYa1Yyd1ZsSmtWR1lmR2FFWjlhaUh6b2ZIWHdiTy83OUVB?=
 =?gb2312?B?MENrVE50SVg5Zk9pZEdQV2JFNk9heGVXampWU1U1UmxZc0hYY2VVdGl6N1lC?=
 =?gb2312?B?SnBXdDRuL3M5cVhnemN0bUhTTE1OK2FIMnJaWUtOd00rNjF1b1RtUGtEL1Vx?=
 =?gb2312?B?S21xWDZKMWlrdXhGSVdkZVU4aTJZeEZsWkdibkhOMDdHc0ZEVWNNbHBJVlBa?=
 =?gb2312?B?SUEzMFUzVll2a2prNmw3SW4xOENZMTZzR1NVbEllSldFMzRGcnQrcXg2ZC9C?=
 =?gb2312?Q?7CaRowTkQarTTloJXJYmF80AsvqAIPsF?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYUPR06MB6217.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?RmwyN3lCbW05ZWZSZDdoMHZ3QXp1TFFVSmVmaHEzbFJVYmtoQ0R4RitzVys4?=
 =?gb2312?B?UVBDUE8yd3J2Tjg0TDgyaGp1UWEvTDRwOEROdGNWUytwRkdEZmx6UVVCelU3?=
 =?gb2312?B?dVhCN1JKR0h0dzdYMS9ZNkhzSk4zU05nL2RaWXNKejVwaHZCdXh0bXdSM1JV?=
 =?gb2312?B?d0VJTFNVbUVZTEdNZ2p2aWNOU3FtbUJ3cjE0M0Z5cTd4TFpSeHlyMHlDYVlG?=
 =?gb2312?B?RXBXTUlYcHQ2ZzYydWM5bVM5MlBlNnlyeHJvSng1WGV2VHU0eHdicEhmTWds?=
 =?gb2312?B?aDMyUFd4MHhJclZ5K3lmdnQrSzRnUjArRlliOXJ4ZFFoYU5aa0FQSys5ZUpo?=
 =?gb2312?B?a1FGWDhWSHlOUm9GR3hCei9oazRiN2pRRStxUnRwQ2JMeVZIVmVQT3ZYN1dw?=
 =?gb2312?B?V2ExZDJyM0pOVlV6WXZzVjdIanFUd2pZV2lwcm1Fc01XcnJKRnlOMkY3MXls?=
 =?gb2312?B?bG40clRRMkRNTVhEak9KVlZXbFF1RHZPUFprU2srTmJpNTBLRmxFYU40N0p1?=
 =?gb2312?B?cU1YcDBRUnlFYUNEMVI1Q1dnUHlvdGZrMjRXVHgydERGeGZRRW1MeUVOZGRB?=
 =?gb2312?B?T3o0bThDUzByWGZTZDZDN1dkRGdIMlpQUDk4QjJJSGx2YkpjT0d4Ti9PcjU2?=
 =?gb2312?B?Mkp1QzZuZi9qcEtxTU9MTGZPZmxyOXZQY2g0em9ZUjBBK1FIWTQ4SXptWnlG?=
 =?gb2312?B?dFY0Ym02bi9kOS9ROHo3K0lXL3ROOW9GcEZ0eXd1SXgwazltUlBhUDJJYkhO?=
 =?gb2312?B?MGpzeWRyaStwMS8wWFd2OEhqQzNNQXNKNHJsR21jL3VOZ3pzVjZPZndFZHZX?=
 =?gb2312?B?QzE2bW1KVjdvZy9kRkVaYW1uYXgwd0llOWxiM3E1d2V1N2FOREJVUml4RzBI?=
 =?gb2312?B?aWtBS05TS2JZQVBnWVgydVlHNDNOZlo3MWxCb2tGYnk2aVBjVVhuMEVtSEhB?=
 =?gb2312?B?bUowUm8zUWo0c08rei9hdUJzUU5lY3B2RjFwTm9nS1pIVmhJdzRXNXJlTVF6?=
 =?gb2312?B?UXJpc0ZZQkdUZ1NKUk53UjBwN2sxY3Azd3lnNzhsOHNVWnB2WEVXcHlJK0lr?=
 =?gb2312?B?TEZOT3ROR0xGWVI0OVJzbnlrVDk1WmF4ODUzOGlZUWdjc1VKWXl1UXBJWFNt?=
 =?gb2312?B?VlFlMmRiVWdQTHV3eTJKWmY4dTYyNWY4ZEJkaDNyM1dYdDF6RGQ2V2lITURP?=
 =?gb2312?B?dTVEanNkSVRyKy9hajNUZzA3TWVlNjVUWnkyQ0Jld2V0cnVrbVZNN2FwZ1lX?=
 =?gb2312?B?bllYK0pMTjRFKzBwc0JiR3gzU2RrWHRKaURZR2tEZWpST2oyWlpFeDAyd29N?=
 =?gb2312?B?MzFUU0p4clp5R3ZmbVdCeHh0WU9Ha2tRWWhPVUgwMlpuaGl3dS84Zm15bGpa?=
 =?gb2312?B?dEw4emRpY3QwSC9mVzJCMkRweER0dzhFamNPWTBwMCtISitaZVRCT1E1SGlq?=
 =?gb2312?B?VHJ1RFdhT0MyNjRJdVlaLzdjUUdOc1ZzUytkWlRPZXNXRXNUdXkrNkF5ZUI5?=
 =?gb2312?B?eTVTenFkV0xyUmpBSmlRNmNVODlNMGhRVERWQ0xHYzNMQ08vSjdrTDdVWHhE?=
 =?gb2312?B?WG5HM3JXbG96NWdROUJhTkVGMTMyclRiVGMwVDRJbVJVZVA1ZzVwdk0ybUIy?=
 =?gb2312?B?SldFeTFvMkVxV1BLRXBCbzJhSG1iZVBDL3VOYnF6UGt4dlpESVZnOHFpN29j?=
 =?gb2312?B?RCs1ZXJpaWVhdGhTOEIxWFFjWW9ud3c1YnZDMW1JZFdrdHd5VzU2Q0RpWUts?=
 =?gb2312?B?OEQzYXJUMEM3VVpxQnd4SVRaWGlCSldCV01rKzFJWThIUGM1TnBzdUsxRnRJ?=
 =?gb2312?B?VmQySFhLWXAwcGJlZXVmNWdTelF3UnlhbStvem5tRC9QOTFPR01VMm5QWUZP?=
 =?gb2312?B?V2RaUHdQWGFacGRpQ1A2N25IMU9kZWhwMnRuWmpWazZmNnphT01CMzR6aDYz?=
 =?gb2312?B?ckJBUWppTW01THRUK3BIVlk1OGlLSitpREFySDgrcWVWR3pQTDFrMWtGZDhU?=
 =?gb2312?B?bVJ3NFdsUXEyYzZKL291SGtzSHhsUjBIcVZqenN1bWRmUWk0WWNVL3hsU0ty?=
 =?gb2312?B?R2gyb3dWcDNwVjBoVUcvdHlkTEFBY25DVSs0dmhtQnZBN09RdVhlYWY3SHNE?=
 =?gb2312?Q?Grkg=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fbacff0-b15c-4829-9e6a-08dd35478b84
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2025 09:32:35.6082
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QH1fdB9/uHEwKq690ugXuH45EVW/Iw4LoW67Bd0DN65TVamlWngN9/+P1O+hTOewuH39JTV9S+dwodXa3+lRyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5576

RnJvbTogTGlhbnFpbiBIdSA8aHVsaWFucWluQHZpdm8uY29tPg0KDQpBdWRpbyBjb250cm9sIHJl
cXVlc3RzIHRoYXQgc2V0cyBzYW1wbGluZyBmcmVxdWVuY3kgc29tZXRpbWVzIGZhaWwgb24NCnRo
aXMgY2FyZC4gQWRkaW5nIGRlbGF5IGJldHdlZW4gY29udHJvbCBtZXNzYWdlcyBlbGltaW5hdGVz
IHRoYXQgcHJvYmxlbS4NCg0KdXNiIDEtMTogTmV3IFVTQiBkZXZpY2UgZm91bmQsIGlkVmVuZG9y
PTBkOGMsIGlkUHJvZHVjdD0wMDE0DQp1c2IgMS0xOiBOZXcgVVNCIGRldmljZSBzdHJpbmdzOiBN
ZnI9MSwgUHJvZHVjdD0yLCBTZXJpYWxOdW1iZXI9MA0KdXNiIDEtMTogUHJvZHVjdDogVVNCIEF1
ZGlvIERldmljZQ0KdXNiIDEtMTogTWFudWZhY3R1cmVyOiBDLU1lZGlhIEVsZWN0cm9uaWNzIElu
Yy4NCg0KU2lnbmVkLW9mZi1ieTogTGlhbnFpbiBIdSA8aHVsaWFucWluQHZpdm8uY29tPg0KLS0t
DQoNCkNoYW5nZXMgaW4gdjI6DQogLSBBZGQgZGV2aWNlIGluZm9ybWF0aW9uIHRvIHN1Ym1pc3Np
b24gZGVzY3JpcHRpb24NCiAtIExpbmsgdG8gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2Fs
bC9UWVVQUjA2TUI2MjE3RjZERkNGNjcxRTdCMEUwMDFEOUVEMjE5MkBUWVVQUjA2TUI2MjE3LmFw
Y3ByZDA2LnByb2Qub3V0bG9vay5jb20vDQoNCiBzb3VuZC91c2IvcXVpcmtzLmMgfCAyICsrDQog
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQ0KDQpkaWZmIC0tZ2l0IGEvc291bmQvdXNi
L3F1aXJrcy5jIGIvc291bmQvdXNiL3F1aXJrcy5jDQppbmRleCA4YmEwYWZmOGJlMmUuLjc5Njhk
NmEyZjU5MiAxMDA2NDQNCi0tLSBhL3NvdW5kL3VzYi9xdWlya3MuYw0KKysrIGIvc291bmQvdXNi
L3F1aXJrcy5jDQpAQCAtMjIzOSw2ICsyMjM5LDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCB1c2Jf
YXVkaW9fcXVpcmtfZmxhZ3NfdGFibGUgcXVpcmtfZmxhZ3NfdGFibGVbXSA9IHsNCiAJCSAgIFFV
SVJLX0ZMQUdfQ1RMX01TR19ERUxBWV8xTSksDQogCURFVklDRV9GTEcoMHgwYzQ1LCAweDYzNDAs
IC8qIFNvbml4IEhEIFVTQiBDYW1lcmEgKi8NCiAJCSAgIFFVSVJLX0ZMQUdfR0VUX1NBTVBMRV9S
QVRFKSwNCisJREVWSUNFX0ZMRygweDBkOGMsIDB4MDAxNCwgLyogVVNCIEF1ZGlvIERldmljZSAq
Lw0KKwkJICAgUVVJUktfRkxBR19DVExfTVNHX0RFTEFZXzFNKSwNCiAJREVWSUNFX0ZMRygweDBl
Y2IsIDB4MjA1YywgLyogSkJMIFF1YW50dW02MTAgV2lyZWxlc3MgKi8NCiAJCSAgIFFVSVJLX0ZM
QUdfRklYRURfUkFURSksDQogCURFVklDRV9GTEcoMHgwZWNiLCAweDIwNjksIC8qIEpCTCBRdWFu
dHVtODEwIFdpcmVsZXNzICovDQotLSANCjIuMzkuMA0KDQo=
