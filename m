Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11013050.outbound.protection.outlook.com [40.107.44.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42E940DFBA
	for <linux-sound@vger.kernel.org>; Wed, 11 Mar 2026 02:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773194900; cv=fail; b=CDmHp31aQEs+DIZhxe7r/TXAFxeOxr0otNSV5692Wqa0UHcp4AwVp5txttWsT5KJ6ZTmu84C3xRWEXpgq4RkDd4C0pug6zVeOfHEpiCI8kZkR2KYsx47J/PsJHX2UWCn/TzdZc55bStwhorLuiJYvXhzoHCKjyGUTgiKVlG4Noc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773194900; c=relaxed/simple;
	bh=VD11udrtRUnVmgwGjnH92F3bEpyClj1KhIkCtmRBcpU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cF6Kfr/yAQmiGCo2YkMdpJqUKmTGq+P+acO3Osy5Vy8f3uf4Wf3NbNSzlIrlVOEqZOZf5UQoi9nzZ89ey42m8DoEKGner3QV+LmkImEJHh7grCNsSb5NeOcno4qh+TtCVoJ90Yz8nJFp0+J2VjJUW9yRDhGlQ5K02+/T/sXkeD0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=EgUbC2VP; arc=fail smtp.client-ip=40.107.44.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="EgUbC2VP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wUzM4winXVByH/VHiUkZCazYL/6ZT7atZAkjyLUAneUb7uFMXJ1m2+aL0BvZMvcoUz402jUM21+mzKYxb+sd4PgkeMWg46ABCobuyI3jGxDeqWeI7xNYvvbaFc+h7keFcCIWWV+/Zj4tIa8Az+PkQs+XNcqJ5wUeG4cTGt16BxwBN85/WkdAnemTHCoLRCTM3Nple2kfoDiYrMTPRopfJB8pSTWr34NZgsA2e5umAp0l5rchlguOG0lXbbdDgCQ+4iOGP9uMJbop9Bc9c3OFuvKxSzFeIKW/Yfa1+AZlo5q1ntdw0K/mlbuBLxk0/TrR8nqYMuGqOIE4hYG1KlU1WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VD11udrtRUnVmgwGjnH92F3bEpyClj1KhIkCtmRBcpU=;
 b=LiYn+Ef+VEwUYHQxSl6Q8tN0rG4NkYmptdW+GO/UT1o1DBVok8uxZjkwcFFfEiPeFsHmIn0jg7SxXU/3KSzf0/rDdV+Jzjh72tpyLuJUSCsKLq8htuVBrWxqYRIs4ilST9Qiap26pAUDbsw5SOBgOIWLWo+ILWxHZhTbokldrjI07ErDYs+F2+UDMCbgEvz3r2395jH1Mth/qnni3einotKNzdxmSMYNgME/bkTeTexi42uNmH250Gw0vqwT2UsI+YxwRC9YY/RfJlkF2IUaYVHXWEcrWyi0JyrSOqtGaBm2VWTk7VKHUIV4ZbJrGiMZAmKqf5ddgM1RkDGxKK2x0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VD11udrtRUnVmgwGjnH92F3bEpyClj1KhIkCtmRBcpU=;
 b=EgUbC2VPL1K7zaevnzxpIO2QjJd7csx/s+CqK1GhLdWsLJySsz2ImYb3yQ/aChZIQNqcEYctz6xK4Jbun4LyYtJmTmFx+krAtkXQ3MNcWhfiHJd9k8sVaGDFhIi/AH4Jp/uBuKzH4kgTwSJBHD10zqEcaAgkgJnzaD936yY9OKwQHKqK7j28y2jqN4kJU0/tVaAp4UlHDUEID/enlRljhsWCC4giF5LM7/iZErQ2XxsuafZagz6cbrQ8jZN/Fkgfu2Pmk7tPk5AscvdMGDzM2fh8Prvl9AkGcS/Uv3bi+amquPMwdhOIgFJDg9cU9pwJhv7VDp70ADTGTPsXo1+7Tw==
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com (2603:1096:400:358::7)
 by SEYPR06MB4992.apcprd06.prod.outlook.com (2603:1096:101:50::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Wed, 11 Mar
 2026 02:08:13 +0000
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc]) by TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc%4]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 02:08:13 +0000
From: =?utf-8?B?6IOh6L+e5Yuk?= <hulianqin@vivo.com>
To: Jussi Laako <jussi@sonarnerd.net>
CC: "tiwai@suse.com" <tiwai@suse.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>
Subject:
 =?utf-8?B?562U5aSNOiBbUEFUQ0hdIEFMU0E6IHVzYi1hdWRpbzogQWRkIGlmYWNlIHJl?=
 =?utf-8?Q?set_and_delay_quirk_for_USB_Audio?=
Thread-Topic: [PATCH] ALSA: usb-audio: Add iface reset and delay quirk for USB
 Audio
Thread-Index: AdywaFToHR5joP9zS8+gtPHW1JGQSwAJ1reAAAHdu9AAAxxRgAAV/V1g
Date: Wed, 11 Mar 2026 02:08:12 +0000
Message-ID:
 <TYUPR06MB6217FE883938B29DFBDEFFB3D247A@TYUPR06MB6217.apcprd06.prod.outlook.com>
References:
 <TYUPR06MB62179ADCD1B86A7E0C73E53ED246A@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <9A67CE55-CD09-4574-85B4-2C4F770497BB@sonarnerd.net>
 <PUZPR06MB6224D136C28892091FD97EEAD246A@PUZPR06MB6224.apcprd06.prod.outlook.com>
 <A25EA184-130F-4A21-98C2-5B96244812FD@sonarnerd.net>
In-Reply-To: <A25EA184-130F-4A21-98C2-5B96244812FD@sonarnerd.net>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYUPR06MB6217:EE_|SEYPR06MB4992:EE_
x-ms-office365-filtering-correlation-id: 6fa828fe-2cad-42aa-bea7-08de7f130ced
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|1800799024|366016|376014|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info:
 ElZBnhKbgO4ycUXptsL17tvAbfo2AN3S476DsmzoQovx0PUnCmfrVxJvMQKEB9ukNdGDvSHiHTtpKIeVLO07nZFi/RcnjPFbdvp8543B1PgeonFuI2yGCIbE0s1HROwMGYm8705oMGGXlRPw2/KTPgUJ9rkjwMvIEJr1vx4I0w28gKr8RE7U9Tck3FbvJeHugLkQXiSY97V+vdsIIevZiepSvLWPhzkbKg4Rqf6xpogsHWNPhCGRWvhb1Zpf9XDhWEjjq1CQDA1ohLT8UI/rgQQP0nCzwt78puuJbGZn1J3Tgce1ik3FgpZ4TmSXKS5C2YMFty+4RtOL2QwD1E3Cha9b0PZrPr7SqBGFRud6H/635gQ6REYj71E0V0f0jYV9oZnwxQJXI90VQpezWI/3AOT1LMjpmvMw2bvgnMSR8BKUvKIDYjkISpP1iXFrSpMw4DwbsT/bZw4cpMW0ZvcAZ41luIGq+R3Vl7A891p2bSf2IB/STTXgIgEVZXObcP3eKvRiXx0/N8yK754TrMqrMxF/afcSX3KyTRixqNtTdmb3YPCQO6A2vbecK+t0MzGOLuZ7Dh9T8UBTbv5+8ibnrortOBT3XkAJ9sMHgKJWzqy+sqXjvMVOoo+HCSWGfPfyMhMt3mjDivu1LBM25CkeBls4ETximIXLpymPObI6MfR5WjLryVG2KErJt8naAzVz1KYWYaP+iSvKU+Ix3aj72RZ7nSlqm7bW0Bfev2dBZDjPakqmi5+Wbif5OMoKWJaTmVLgBqPSGgf3+0C++NgKLr3KABJVicsPN11eHNS8lZM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYUPR06MB6217.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(1800799024)(366016)(376014)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WG5DOW9MSGhHZnE3RC9xakZMNU95TnQ5NWxNUG5jWGwrMmxBSmZxL3E0STdW?=
 =?utf-8?B?M2NEdkx4a1QwLzJhMjlZYWNnbG9yRGVrbzd6UEtEdTNuelhsYTRVaVg3bWVO?=
 =?utf-8?B?NUt6ODIzcXlCSVY4SzU5SDd4Q0pmMnVrVG40TEhyZWhid3VtWkEvM0QwMUNW?=
 =?utf-8?B?YnBBWmNpYUlJNE9waHo3eUlFQlEzbVhzUDZIRlhPRTNlZUxQNjRoM2dwQjJj?=
 =?utf-8?B?MHdtaE5Ca0hnMjJrZ25oc1UrTU91NWtacG51SjVUb2Q5QkZuU3ROblhVOHJZ?=
 =?utf-8?B?aVFpNUxwdklUTmlHaHJCOGFoQURNUnJNdkFMN3AxZVMzY2kySm5ySlg4akxi?=
 =?utf-8?B?ZU9IOUgrMko2b3ZEb1IxdjJWNE9Jb285QVRCRFJVRkpGMzlMVTFmZ2JEc3ZS?=
 =?utf-8?B?ZTVtWFdOQ2xNL0NyZ2NBb3FiVFd3dU5KVC9nMTN3cTM1UGRGM0J3ZFY2ckVy?=
 =?utf-8?B?d1JHanZRMHFpczkrM0tIZGsrY09zRzlwSXkvM05FNFVPQnhZSE5oNlpYVm5U?=
 =?utf-8?B?aCtpTWRsc00xVWU4WTF2emc5UEVMRXp6SzUxNVZPT3pIWjM0a1VYcFhlclg2?=
 =?utf-8?B?TDlFVm9Sc1VOWE93OHZwbThobE1hQzQ3dUxEY2hnYlZBdWhXaWxXank2dUJo?=
 =?utf-8?B?VEhkWGhkSDRQSmNPODQrUVFBdE52SWJtUFFha2VEU3BnR0luclpVYUl6NWxW?=
 =?utf-8?B?RmZNeWViUTNmaHFuQkQ3MmtOZTBnV05NRndZQmkxalZhYWh5R3ozNzhBUXQv?=
 =?utf-8?B?SmRnaDNqVEIra1NURTR0bDM0QzRqT1NRZTdtVjA1RVRNZnZ1OVY0NUI0NExu?=
 =?utf-8?B?MG5Jb0F0QWdhMms3OGFHY1hmN3kwNHJIcWFvSlJrcllwc3dOMzJSVk1PK3d4?=
 =?utf-8?B?WXJZM3hQUVA2RUthWEluV1VYbFRWcUpNdGVnbGcrM1NzcThYdzByL0kyMS9n?=
 =?utf-8?B?NTNCWEk4SjVKdW1XaFJZQ0NtWEQ0YTg1ODNaV2F4eWMrRkswaWpxT2RXUnBD?=
 =?utf-8?B?OHBuaUtVT0lBOXZIR29mWkdiRHRQaDJzdXEzenNqbHQvNlVFNktxQndlT3B2?=
 =?utf-8?B?eFdIWndIMCtuVGFBR3BqYWo1Q0laWU1DOEUxL2w0cTBPd3NVdUMvY1Btakt3?=
 =?utf-8?B?WURRSGwyOFRXaXFGZzVScU9XWVNkd3Q4SytqNjBWbU1Va2xNbXpjZkh4NDNR?=
 =?utf-8?B?SHg0OEg4dlRBdUo3aGNuSUtheTRjL3g1OThoUlJDVWVqQU9OOG45eFcrSTlj?=
 =?utf-8?B?VlFHMWJoU2NIWkRTSU9LVlUzQmY1dG9va2VGd2ZLRTQ4N29zSGdPdEZkMHZz?=
 =?utf-8?B?azNubU1KY2JGb2xqVHZrRlB3OWRpWmZBZUV1TWFWTHpFOUR4NjlrcVhnOEFx?=
 =?utf-8?B?Zkx3YnBxQmliQVd4YnJtNm1vMks5VllmUlkzU3gvdFc4ZHA3bXE5MjNOdjA5?=
 =?utf-8?B?M1VRaVZtQytBZC9iUTBzTUUrTzVreFBRR3Y5YXd5N240VGtjcVZXNDBZMWNC?=
 =?utf-8?B?Z05MRm5wMDZycTNGcldxYmdSUGtPTVAyUlRabjFobFpuUGpqSW8xRkJwcDJR?=
 =?utf-8?B?bVZ0UjFWWm00TUYvWDgwUE56VXhuQmVVaUMwMmZpNzlUbTluK2o2MkVkR2ZB?=
 =?utf-8?B?YVF1NEJzeGZhK1F4eDM3T3A1RmNBQjhXVHFrY1FpQVlOdmlTejFQZC9WSm1x?=
 =?utf-8?B?dVpmSzlhRTlyNzFhQ0YvQ1k2U3JBZlZsUHZNRFJVbklXZS8rYTdkS2pDV1Nw?=
 =?utf-8?B?N2NFWFBnMENnbTdBRHdweDYxS2VocW9FU25pR0RCMXAzbkdaTFgvbStGcXEz?=
 =?utf-8?B?bFVWQmo5V3pNdGpKcy9kNW5HTXliSUJvbCtFSTlVa3VScHUySUdoWndwS3hV?=
 =?utf-8?B?K1NwM0FhU3h0V3B4NW5CT29ZUk5DSUxKdnUrTlBrZHd6bFBwR3kxTEE5Uzd5?=
 =?utf-8?B?aTJqMXFyc3JVUzdoWCt1R3NROHJhdCtwcXFnb1BpYjFEY3QzMEs3VXBZRmUr?=
 =?utf-8?B?RVpQQWZYSlNoOE5QYWg1WjJqTG56U0JNWUFRRXFqV1N3azhiSHRRTGZac2dx?=
 =?utf-8?B?ZVlXMTJzSkpKYm5ORjd0bURud0NEZ1UxM2doMWdlTzRVTE1wVUFrQUYraDN6?=
 =?utf-8?B?bGN2bTQ1MUJMWitoNWNpOFE4cjRFVFMvWk1uRG1IS3FiRnJCN0pRd2lpK0di?=
 =?utf-8?B?eG1xVFR3WkdhbG1udGhMU2JoRGNEUzVEc0l3QWpVTXcxYVY0QkJUT3M1T3M0?=
 =?utf-8?B?YXhHOWZ1TzFyOUpvWTVIdVV4MEwwQlJOVTNKZ2lwVEIxOHYwclBsTjlGYkJh?=
 =?utf-8?Q?4tpbhMyoT6BDKl9n52?=
Content-Type: text/plain; charset="utf-8"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fa828fe-2cad-42aa-bea7-08de7f130ced
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2026 02:08:13.0934
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wCinUbt7RQmA0LFw5CymmpG1UwPI4IHo90E3vJsgnO+vUNPUFN0Oe4VKmAzoXqZyfmUP7jtfz4E0hky/v9wZ3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB4992

SGkNCg0KPiBZZXMsIHRoYXQgaXMgYmV0dGVyLiBJdCBzaG91bGQgYmUgY2xlYXIgZnJvbSB0aGUg
ZGVzY3JpcHRpb24gY29tbWVudCB3aGljaCBkZXZpY2UgaXQgaXMgcmVhbGx5IGFib3V0Lg0KPiAN
Ck9rYXksIEknbGwgbW9kaWZ5IHRoZSBjb21tZW50IGluZm9ybWF0aW9uIGFuZCBzZW5kIG91dCB0
aGUgdjIgdmVyc2lvbiBwYXRjaCBsYXRlci4NCg0KPiA+DQo+ID4gSGkgSnVzc2k6DQo+ID4NCj4g
Pj4gSSB3b3VsZCBzdWdnZXN0IHRvIGluY2x1ZGUgaW5mb3JtYXRpb24gYWJvdXQgdGhlIGFjdHVh
bCBoYXJkd2FyZSBkZXZpY2UgaW4gdGhlIGNvbW1lbnQuIOKAnFVTQiBBdWRpb+KAnSBkb2VzbuKA
mXQgcmVhbGx5IHRlbGwgYW55dGhpbmcNCj4gPj4gaGVyZeKApg0KPiA+Pg0KPiA+IE9LLCBNb2Rp
ZmllZCBhcyBmb2xsb3dzLCBJcyBpdCBmZWFzaWJsZT8NCj4gPg0KPiA+ICsgREVWSUNFX0ZMRygw
eDA2NjYsIDB4MDg4MCwgLyogU1BBQ0VUT1VDSCAgVVNCIEF1ZGlvICovDQo+ID4gKyAgIFFVSVJL
X0ZMQUdfRk9SQ0VfSUZBQ0VfUkVTRVQgfCBRVUlSS19GTEFHX0lGQUNFX0RFTEFZKSwNCj4gPg0K
PiA+IFRoZSBzcGVjaWZpYyBoYXJkd2FyZSBuYW1lIGlzIG5vdCB2aXNpYmxlIGluIHRoZSBlbnVt
ZXJhdGlvbiBpbmZvcm1hdGlvbiBvZiB0aGlzIGRldmljZS4NCj4gPg0KPiA+Pg0KPiA+Pj4NCj4g
Pj4+IFNldHRpbmcgdXAgdGhlIGludGVyZmFjZSB3aGVuIHN1c3BlbmRlZC9yZXN1bWVpbmcgZmFp
bCBvbiB0aGlzIGNhcmQuDQo+ID4+PiBBZGRpbmcgYSByZXNldCBhbmQgZGVsYXkgcXVpcmsgd2ls
bCBlbGltaW5hdGUgdGhpcyBwcm9ibGVtLg0KPiA+Pj4NCj4gPj4+IHVzYiAxLTE6IE5ldyBVU0Ig
ZGV2aWNlIGZvdW5kLCBpZFZlbmRvcj0wNjY2LCBpZFByb2R1Y3Q9MDg4MA0KPiA+Pj4gdXNiIDEt
MTogTmV3IFVTQiBkZXZpY2Ugc3RyaW5nczogTWZyPTEsIFByb2R1Y3Q9MiwgU2VyaWFsTnVtYmVy
PTMNCj4gPj4+IHVzYiAxLTE6IFByb2R1Y3Q6IFVTQiBBdWRpbw0KPiA+Pj4gdXNiIDEtMTogTWFu
dWZhY3R1cmVyOiBTUEFDRVRPVUNIDQo+ID4+PiB1c2IgMS0xOiBTZXJpYWxOdW1iZXI6IDAwMDAw
MDAwMA0KPiA+Pj4NCj4gPj4+IFNpZ25lZC1vZmYtYnk6IExpYW5xaW4gSHUgPGh1bGlhbnFpbkB2
aXZvLmNvbT4NCj4gPj4+IC0tLQ0KPiA+Pj4gc291bmQvdXNiL3F1aXJrcy5jIHwgMiArKw0KPiA+
Pj4gMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQ0KPiA+Pj4NCj4gPj4+IGRpZmYgLS1n
aXQgYS9zb3VuZC91c2IvcXVpcmtzLmMgYi9zb3VuZC91c2IvcXVpcmtzLmMNCj4gPj4+IGluZGV4
IGM2YTc4ZWZiY2FhMy4uMzM1MmUzNTM4YTE5IDEwMDY0NA0KPiA+Pj4gLS0tIGEvc291bmQvdXNi
L3F1aXJrcy5jDQo+ID4+PiArKysgYi9zb3VuZC91c2IvcXVpcmtzLmMNCj4gPj4+IEBAIC0yMjQx
LDYgKzIyNDEsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHVzYl9hdWRpb19xdWlya19mbGFnc190
YWJsZSBxdWlya19mbGFnc190YWJsZVtdID0gew0KPiA+Pj4gIFFVSVJLX0ZMQUdfSUZBQ0VfREVM
QVkgfCBRVUlSS19GTEFHX0ZPUkNFX0lGQUNFX1JFU0VUKSwNCj4gPj4+IERFVklDRV9GTEcoMHgw
NjYxLCAweDA4ODMsIC8qIGlCYXNzbyBEQzA0IFVsdHJhICovDQo+ID4+PiAgUVVJUktfRkxBR19E
U0RfUkFXKSwNCj4gPj4+ICsgREVWSUNFX0ZMRygweDA2NjYsIDB4MDg4MCwgLyogVVNCIEF1ZGlv
ICovDQo+ID4+PiArICAgUVVJUktfRkxBR19GT1JDRV9JRkFDRV9SRVNFVCB8IFFVSVJLX0ZMQUdf
SUZBQ0VfREVMQVkpLA0KPiA+Pj4gREVWSUNFX0ZMRygweDA2ZjgsIDB4YjAwMCwgLyogSGVyY3Vs
ZXMgREogQ29uc29sZSAoV2luZG93cyBFZGl0aW9uKSAqLw0KPiA+Pj4gIFFVSVJLX0ZMQUdfSUdO
T1JFX0NUTF9FUlJPUiksDQo+ID4+PiBERVZJQ0VfRkxHKDB4MDZmOCwgMHhkMDAyLCAvKiBIZXJj
dWxlcyBESiBDb25zb2xlIChNYWNpbnRvc2ggRWRpdGlvbikgKi8NCj4gPj4+IC0tDQo+ID4+PiAy
LjM5LjANCg0KVGhhbmtzDQoNCg==
