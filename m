Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11013033.outbound.protection.outlook.com [40.107.44.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FEB1607A4;
	Fri,  8 May 2026 12:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778244584; cv=fail; b=sdyemz762lx5ahHAgq+Z9VS28Np5q6j8B7MRFiOo6I4L24rbjzHsdAZqpgtV2PNodXD1pL3fLbmyh7RjVB38cMNbByMWnUYBj8pRVCEwDxSa1ZGVS5YcGrE0kgVdudPSSKwZVqwzb2TGolMfOWh6rfJXszrT5QgdG0BcVVuyeDI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778244584; c=relaxed/simple;
	bh=jHK72MG4Rj9GLSyxYrcMg6asAYP/bQ7QKOhPf/WkXFQ=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=dXQ/WfLEvy/v+NsFhJVMTI55a1lHzOXgqnwir6q+PBhuqNerUE9LyhCkgDYXM3sxr2Bif2Pm5sAZ6RwO0Y2DtynB+fcKOKB3YXNYmHV3bMDOdK5gD85FE9ebjytftvaQmZbbUSFL+rnGcNBS0kZoabdhn8CKjSZvINVx3uusfPQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=K80Dzh1B; arc=fail smtp.client-ip=40.107.44.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="K80Dzh1B"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fk+FmppdAfoxMwSyb2GPiF0F7a2U/20FAeVZMkHOpiIyNkWDN0X+W4Lih0kjfMJo1nzJqwY+ngs5RPSx/l7Cg3U4oX/MQBDoHnl9ZkZt6h2aYwLdujQgVcbuwYSDHpm9gYV2rOHRNQ8xJr/2pj3iYVUlzSXc+NUH62HVSRsw4WcJRXhPY6qPN1dlzyQk48dEfdDreg5d23SnjzRm3UdmqUmngLCXsOkJuLR1L8aPmo0/VmYyipY72rwJTFyvLM4Wqp9tOgEOrNwE/UxX6cPtkfgbtjhQuH1ihLAEml58IQfDalhEyPyCP0QjABG25Vf5HczW0m/kiawyE7HlOc1pqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jHK72MG4Rj9GLSyxYrcMg6asAYP/bQ7QKOhPf/WkXFQ=;
 b=LdFDWJB1ya13T4IDKlUqLKHOWJKjtkrQxCkcfBk2XKSp21YvvrRm2aUPBWcTDHP/HuL+OTdJebIkwWAElBMhIeZm2XbWAW4VRS797GD91BGN2ya4dVyww2Gb8kJi2BEe7j5od2d9oMGdc//jVRSFEJuwVnd+mo0nUDh0U7XptFqJMRVy9yhqekD/3HMMrK5X2hqdfc975tXqFiyzLWJJ54XjOw2Xr3lCMKVRymS8Askw4pBflvSnGTCXdUzj+21Qpzr8miTpPgeDe0OkErjbV/eljmKGs9/3AvAHmYtJyAZDl5QUj2gGdFIJYz3Kt+lJzxSiMMwOK/edEczwGd9tgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jHK72MG4Rj9GLSyxYrcMg6asAYP/bQ7QKOhPf/WkXFQ=;
 b=K80Dzh1BQtwHOi+fHXddSF2uvPgqmq0iV9h0KmWnLQDKWEB+IxDOa0azJ2ZyP3abnd8qfkSBTxY2228cGQy94jistKcISLBJUQLPS34Mma4ZVOvk6EDm0eqv8KnYXJWm1VxfQEKhoVUhMHq9W8iZ9P7k4YL8smNS4EKk6NDfq7Il2wdnlYzZV377kVcennSYRlz1GoyfcKLt+4QwMMXtGe6+5kgiEfS2LmVTyHUNLasjaKNieiHY0OEK2WRGaEvRnfXLQdSoaLvc3QUHsJ4tVdq8t0WumNIsVWsFAY13NCbPWNUyfOWzmyNfVeyrrmjXpGJ3AZrjLoocRKwoYCcIUQ==
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com (2603:1096:400:358::7)
 by SEYPR06MB5891.apcprd06.prod.outlook.com (2603:1096:101:d4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Fri, 8 May
 2026 12:49:35 +0000
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc]) by TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc%6]) with mapi id 15.20.9891.019; Fri, 8 May 2026
 12:49:35 +0000
From: =?gb2312?B?uvrBrMfa?= <hulianqin@vivo.com>
To: "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
	Cryolitia PukNgae <cryolitia@uniontech.com>, "pav@iki.fi" <pav@iki.fi>,
	"jussi@sonarnerd.net" <jussi@sonarnerd.net>, "roy.vegard.ovesen@gmail.com"
	<roy.vegard.ovesen@gmail.com>, Jussi Laako <jussi@sonarnerd.net>
CC: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] ALSA: usb-audio: Add iface reset and delay quirk for TTGK
 Technology USB-C Audio
Thread-Topic: [PATCH] ALSA: usb-audio: Add iface reset and delay quirk for
 TTGK Technology USB-C Audio
Thread-Index: Adze6LFFJBobDgjETYSwB41bhnXAHA==
Date: Fri, 8 May 2026 12:49:34 +0000
Message-ID:
 <TYUPR06MB621720E4E8F99A42E162FD51D23D2@TYUPR06MB6217.apcprd06.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYUPR06MB6217:EE_|SEYPR06MB5891:EE_
x-ms-office365-filtering-correlation-id: 9d0b0e4d-7ae3-462e-ecc7-08dead0041f5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|42112799006|366016|1800799024|56012099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 Zjqo4gdXf5594f3jip26PAn1iRwNs2egq57QKDdWhowtMm7Id3KpH66IuQbrWRzqie+XJGRAi+o5T+L+x8B17aOCZ2KNrbHm8diNZbvN3yBBUpSfT7ushmr0ubO0qm/tdmOIkhPAkovZ1xBoTA/830PWrANl4pxGqX1f/PwSCEUf9BiHd+sg8btId87NNF0ybms5yyHQIdRc3eLC+ld3w8AX46mbrlqZKnbI83Z+IP0ZCdORAupiEf5iV5Hkx4CcmoG2tqsemIO3HGaR+HntV/lQ/MJ/ngvV+NNic8i7Pmgv0FVQBUWB4RztNBTtuHWUDBEu62D+umMpsxt43lFHnKSpdjyCMhFglcwK/7YmEiIbAZmLTlfuXVSwHeB5zkvkE5R/ozbWdbYm17J1vs4pUCckFDJKTQg44wyhwKDsimdYCtN67FLUXFKyTML0LDt+gjjOBH27h8gCCR2R6RGOwyekjm7i1MdO3uWsY0CAgKL6U+a7DYALr59SHgUvXoRW2581RElG1MP2nKnTbYFH9j50P3fN2KAqaNgkwZSI8hkA7IciMUaVJZlRXpXKE5b0xZr/P/NBqwJjhC3C0V0MVhXI4YwXtbZdmIn9LXc0VI3hsInVjct8fKTpQldVYAtbnw/gIQyUtw1jOdChPpL1q71vqKBreJAWwzSDEpoQVifRDUhfapWOgPd9VtIrPDQO7oYYnvbObCWHerAroHsFNluDBTFr2viNl72YP0h12Btz1JqlGmOl+P/6ui2xmMVN
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYUPR06MB6217.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(42112799006)(366016)(1800799024)(56012099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?eGhITkFYQnd0c0IrKzJBeEF2MHIxS09Td1JmQWFtcEE0ME84QnBQWHRnenht?=
 =?gb2312?B?aHZnZnA2NnFHb211cFRBMElEVzljZE16ZnEveElxNm9FSXpqbnhUSlV1bEY5?=
 =?gb2312?B?aXNtbW5yN3B1R2xURnVSYjd0MUdYUlFuWHZRNXlLOHY2RWtTNW5FMDNLSUJx?=
 =?gb2312?B?WFg1ckM0eXA5NmVZN1JqVjFDWVg3VUNMalhMVHE5QjBRYmFrdml5bGJkZkw1?=
 =?gb2312?B?VjNaVTNzSlJxU1EzckdoTHFpYzZqNW1aVDZGb3lWdGdKeUp1MHY3RnNBWHls?=
 =?gb2312?B?bUdsN3BQRjlxNUFzYUhiaDdORVhuYk5vTnlWUDdseDE2WnFwMjBTQkpVeEFp?=
 =?gb2312?B?dU5JMU9Sc2J2YmhkRDBaSEtvT2g1N1FvdjkzQW15dUpMUFBnbkRYRU9NcnZE?=
 =?gb2312?B?L3V2MVpSdEdaUUFEVnpGUkQvSUY5djZ2eWRqNTdLdVZ2Y3JnWnh3dEtjN0FL?=
 =?gb2312?B?YTNlSWxUcXlUbzRGbjFlekxWQkVZdzRPWjA2eHErOTVPVHRTaU1xWGZRcjlU?=
 =?gb2312?B?YXdLbWZ5K2plZ1pqUUJNdU94c3N5MTAyNHJvMndoK1RPVjBDaFZuN254SWhj?=
 =?gb2312?B?aXR0djB1bFZBNGJMcmd6ZWVvN0pVZVVzTjBoQThicnJ4RDdpYm5UWEx3QVln?=
 =?gb2312?B?M2x1OE5ER0NqV2Qrdml0dDFaZWVWMUhubTVUMDB0QmtpRDFOQ3ZPYmlwMmNS?=
 =?gb2312?B?N0dYNytxcmU5eWpEQnROOVJmcXppZ3AvczFEaHA0R2hybitjMmVFd281M1ly?=
 =?gb2312?B?c3JoVVR0UGNmQitjWTFOM0pTRlc3WTk1S0trT2tiRzhOamJXWUFMYlAwazQy?=
 =?gb2312?B?VkdwdVNxdVF1MkZXYWljb0RhQmxWQUJ0L090SitYNzJWc3k5UU1JNWdZVGFP?=
 =?gb2312?B?UnlDQmJIVEpRS1F4TEJ6K2NVSWY1aFZJZW5FbVhlNUNqakRKWElnb2gxTEZX?=
 =?gb2312?B?N1FmRmVXbExiUGZqd24rYlI2NE1aaWovdU83VHdLaUJmTVl0UlZXbWoxc1pn?=
 =?gb2312?B?OTh4RDhSdXdBYVZhSk9lL3FtU0tlRnJwa0k1aGp3QVVxWmRESEg0UnMvM3pn?=
 =?gb2312?B?THhZK0tmVUxYSVA2d0FhekFrd1dQVnFmNXowb3FOVVFBbFA5YUJUbERwZHhF?=
 =?gb2312?B?MUkycjV2UUxrdVpHdWM5eWVTa05YM0s4U1RMb2dMallNb2sxM0N2Wkl3KzE1?=
 =?gb2312?B?NlVQL3diV0szQ2loUlFBRkg3dTJkOWR1aVduTk45VGpheWtVa1A2aUswSGh0?=
 =?gb2312?B?Y3NMeURPREVZRE8xMm1QZG5hdExCZ3RMZjBybGg1RVNRQmdhMVVZdUVkbWg5?=
 =?gb2312?B?TE9SN2d3ajVxRVlqODdKUzJvTUxOVVUxUERxUytwUFRMRWlhTzNiN2daa09B?=
 =?gb2312?B?NVFUMXBFOUREUUNqRDFvVFU3Zm56ODN3MVdkTWpXU3l1MUpPTitvQVNYd0cv?=
 =?gb2312?B?SEsyRW1ncjJ4WmxrMkc1MXRMQUM4VUdhNW1vRSs4UWlIQkt5VlhZdjljSnpX?=
 =?gb2312?B?TmtHUS9DQWdHU0FXSUdKUjdLRjIzemtpWDJpanhFb01xa3lUSmlFOE84c0py?=
 =?gb2312?B?dGpOMGNBVmh3Ukg0VldNd1hMRDF3THpOYm9OaXJJc3d4V0tLN05tTkdrVmlB?=
 =?gb2312?B?VHdZQWIrSTduK3htanRNdmVVejJCWFNUYk95ZVl3R3FsbFVEU0VXTTdPNGRM?=
 =?gb2312?B?VmVmOFUxNnVYaDUxVmRqQk5OaFFabXg2YStlVU84YW9BK0dBb09LQWZnVHY3?=
 =?gb2312?B?OGZtV2JRRno5YzU1ZXdFVXRuZEhyY29HRmpMVzV2aURkSXlWK0tjVit1Tlps?=
 =?gb2312?B?UmNoMDRxV1RDNEZGRHBqZE8yUUN0YklmK0tveE1TYlJic3pBd0ZWelh4OTZR?=
 =?gb2312?B?bXlDZ2RRcmZLYmZGR0JseTl3UXFvbTBZTWlXOG1RN2luNElVeXFheHhWK0Ro?=
 =?gb2312?B?YS9yR1g3ZnhsM0lFTFl6Ny9jbmtJMXpLaExpcjdUQWllb2N0RTkwYSswejdi?=
 =?gb2312?B?SnhTYjJUeXFEK2RtbUtwRUEzWW5ycmxsc0lRZ3lUN1dCZzlzTW9MdU0vckNR?=
 =?gb2312?B?TFptanZKdFpsUkx3T2tCZTJsTGxzejU4NitYbk0rYVZrYmZGOHlpdjh2SjF5?=
 =?gb2312?B?RlJQRXBtY1QvQ1J5ZzBCWVZyR2FlUkk0RW5tUkJ5SnRaNzV0WEtqclVNcEZ2?=
 =?gb2312?B?d1hnRW41dUJUVDIyRVcySURzUmNkaTFPdE9ueitwV2trUnRGM0pJZndvRGpO?=
 =?gb2312?Q?7gzc+r5frvG6yX7saoiR44G6mf5yJmp0btzCj8nOfg=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d0b0e4d-7ae3-462e-ecc7-08dead0041f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2026 12:49:35.1149
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hbLKU0TKcXCct191Kmmyv6QjwrL4U3BaO23HbeOJj6c0KDzTz3EhihboRSCKVaelcjdW/E6CD/LAzxQDd5MzSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5891

U2V0dGluZyB1cCB0aGUgaW50ZXJmYWNlIHdoZW4gc3VzcGVuZGVkL3Jlc3VtZWluZyBmYWlsIG9u
IHRoaXMgY2FyZC4NCkFkZGluZyBhIHJlc2V0IGFuZCBkZWxheSBxdWlyayB3aWxsIGVsaW1pbmF0
ZSB0aGlzIHByb2JsZW0uDQoNCnVzYiAxLTE6IG5ldyBmdWxsLXNwZWVkIFVTQiBkZXZpY2UgbnVt
YmVyIDIgdXNpbmcgeGhjaS1oY2QNCnVzYiAxLTE6IE5ldyBVU0IgZGV2aWNlIGZvdW5kLCBpZFZl
bmRvcj0zMzAyLCBpZFByb2R1Y3Q9MTdjMg0KdXNiIDEtMTogTmV3IFVTQiBkZXZpY2Ugc3RyaW5n
czogTWZyPTEsIFByb2R1Y3Q9MiwgU2VyaWFsTnVtYmVyPTMNCnVzYiAxLTE6IFByb2R1Y3Q6IFVT
Qi1DIEF1ZGlvDQp1c2IgMS0xOiBNYW51ZmFjdHVyZXI6IFRUR0sgVGVjaG5vbG9neQ0KdXNiIDEt
MTogU2VyaWFsTnVtYmVyOiAxNzAxMjAyMTA3MDYNCg0KU2lnbmVkLW9mZi1ieTogTGlhbnFpbiBI
dSA8aHVsaWFucWluQHZpdm8uY29tPg0KLS0tDQogc291bmQvdXNiL3F1aXJrcy5jIHwgMiArKw0K
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCg0KZGlmZiAtLWdpdCBhL3NvdW5kL3Vz
Yi9xdWlya3MuYyBiL3NvdW5kL3VzYi9xdWlya3MuYw0KaW5kZXggMTc5ODNkOTc3NGY4Li4zMWNi
ZTM4M2FlNjUgMTAwNjQ0DQotLS0gYS9zb3VuZC91c2IvcXVpcmtzLmMNCisrKyBiL3NvdW5kL3Vz
Yi9xdWlya3MuYw0KQEAgLTI0NzksNiArMjQ3OSw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgdXNi
X2F1ZGlvX3F1aXJrX2ZsYWdzX3RhYmxlIHF1aXJrX2ZsYWdzX3RhYmxlW10gPSB7DQogCQkgICBR
VUlSS19GTEFHX0lHTk9SRV9DVExfRVJST1IpLA0KIAlERVZJQ0VfRkxHKDB4MzI1NSwgMHgwMDAw
LCAvKiBMdXhtYW4gRC0xMFggKi8NCiAJCSAgIFFVSVJLX0ZMQUdfSVRGX1VTQl9EU0RfREFDIHwg
UVVJUktfRkxBR19DVExfTVNHX0RFTEFZKSwNCisJREVWSUNFX0ZMRygweDMzMDIsIDB4MTdjMiwg
LyogVFRHSyBUZWNobm9sb2d5IFVTQi1DIEF1ZGlvICovDQorCQkgICBRVUlSS19GTEFHX0ZPUkNF
X0lGQUNFX1JFU0VUIHwgUVVJUktfRkxBR19JRkFDRV9ERUxBWSksDQogCURFVklDRV9GTEcoMHgz
MzliLCAweDNhMDcsIC8qIFN5bmFwdGljcyBIT05PUiBVU0ItQyBIRUFEU0VUICovDQogCQkgICBR
VUlSS19GTEFHX01JWEVSX1BMQVlCQUNLX01JTl9NVVRFKSwNCiAJREVWSUNFX0ZMRygweDM0NDMs
IDB4OTMwZCwgLyogTmV4aUdvIE45MzBXIDYwZnBzIFdlYmNhbSAqLw0KLS0gDQoyLjM5LjANCg0K
