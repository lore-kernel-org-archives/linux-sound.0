Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013016.outbound.protection.outlook.com [52.101.127.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B9B19005E;
	Fri, 24 Jul 2026 12:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784897200; cv=fail; b=gCfh4SEfXKb57r42DrdNz+IDJL5npYaxcdfsUHN6kQsjBGec4gAKGpsm7hwCqRLXtjVd1bmj/lD8Shh64V+2NNvWD2PUCp9hRWlbxci7U8V5po+i4I9w5GGGZKnzyUJ7KXmlRfDjdCsipzbaAqbvp4J5Bqr4Qm9A11kc/+k1OFE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784897200; c=relaxed/simple;
	bh=68b2QmbmovGFo3kTXifkwNOtsLgEL0zXNC8Zx+Nto2M=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=m3zCdZgLxL/qONOjp71aad3CJRqv+r9704uEaT50SNohPSjcQybRK1cU2AXr6FgbW8gcXCnV5LHqf8rmiROs0z1F3bFrO4I+cEY4ywVzgHru5ujBFgGijsbtlTFVv0lgOVAf7BGVe8Ji/IHUkB1H03FsDV830eDriiRrcDY5iNU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=j8mBh13t; arc=fail smtp.client-ip=52.101.127.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="j8mBh13t"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AxJS0JP2HONM1LJ889gE2hYwk85/GktJlYzh22Gg7DmZcVWUbUQi0EPm6C4qC2t2xcqhzE5hXb5NL+o/Iv1rC9GBxkXkCcF14UXmbFDj8ImCLjCpI+Cb32023jqIOFNOYjDikJ7zQU7vKo1eIKBCFmN019HCVFpnJiRHyw2z7QissVeR3OKgBNMREflQexQdv63Zpg23279gN/AbM2hpRw1UvsO7oQL/2oBzHjdTOFH0TKCikO0eYJrdbqBcyTm9pYoMPwnEPxlFgwyGLqz6TPItK9SRfOJSaATs4mCN7Lm0yqTPeDQMonIdZDrPT/n3iDdGgtuACq/PWWUGWE6APQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=68b2QmbmovGFo3kTXifkwNOtsLgEL0zXNC8Zx+Nto2M=;
 b=my68YQ4+Hn0UAAO2oTltiYcXzI7tEeakxZwy40pFJjDyMioMzaLrapv/C/zGLoJqZvA40eFamcou4JKGNPb5jMmwPG/yekKCuOSFXIfDZKLkJZsEa/poahh8vmDNFJgnDDVVKJYPc+wyp5jj0DQCyJyOsIa4q+QTnCpIB170EX09j9e2fJznaMqcKyIt++3M7HiN/jIcTa/SpB9Sw3vGooRbqK+cxqH63/xPYizmlUuV6TZL8g353lUCcHrCS45FcbQZGhjjzk/RTYiowDLgB9//Rp8JOFQwIt9OyE/VoUb4UM3z3E3BF1rxNC1Rxabb9I1KPNbG4dkjxVrnmJdqlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=68b2QmbmovGFo3kTXifkwNOtsLgEL0zXNC8Zx+Nto2M=;
 b=j8mBh13tjscm5tpjFAPYXQnaDt96XQxI7XvFifcsV1QB9QC4ffsUfb8yEBnngweGqZpPCqy5QqrEcn0/W9T6huf2DZY6KRB1EE+W1NrcYaPqi4MFeiweRgtF3ujCNYpThL4dK9d7GE+f1Co8GuSypGbXJhdnrJGpoTO+HqxROfjLmRzMkYN9jf9U+tgfzhUdDplnRqIUda1MTtYXO65DYCIHH8etdLGLnlMZCZgbwL5DzGA9mMXyONxUiM1szqaHlyu4+SrdcTRYBWlz2sCDIgzcS90ImvaLDi+ZVgPu7THmYlO5pGZ5aHsExgb6iTZ0ZGieTVtdFauum0Kl/Yswug==
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com (2603:1096:400:358::7)
 by JH0PR06MB6654.apcprd06.prod.outlook.com (2603:1096:990:36::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 12:46:33 +0000
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc]) by TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc%6]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 12:46:33 +0000
From: =?gb2312?B?uvrBrMfa?= <hulianqin@vivo.com>
To: "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>, Rong
 Zhang <i@rong.moe>
CC: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?gb2312?B?uvrBrMfa?= <hulianqin@vivo.com>
Subject: [PATCH v2] ALSA: usb-audio: Add iface reset and delay quirk for JKY
 Technology Q2A
Thread-Topic: [PATCH v2] ALSA: usb-audio: Add iface reset and delay quirk for
 JKY Technology Q2A
Thread-Index: Ad0bagstKqNrBs0sQNiPQkLxFt6R/Q==
Date: Fri, 24 Jul 2026 12:46:33 +0000
Message-ID:
 <TYUPR06MB6217566CFD33F57D3AE46816D2CF2@TYUPR06MB6217.apcprd06.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYUPR06MB6217:EE_|JH0PR06MB6654:EE_
x-ms-office365-filtering-correlation-id: 7621612e-aa1a-4872-2a34-08dee9819739
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|42112799006|18002099003|38070700021|56012099006|11063799006|10067099003;
x-microsoft-antispam-message-info:
 UuuSFE5hB29kXfpb02I8xAG00kbx45EULGLldeCYxLmlSj+6WMlKIwAN80MrtgZtQRIxiXIGDGLOp/wSE2iFQSzohfHDMWebqxqbG4AzhWJ2I/idHxrdlC2A+gMvXDOPjzirEhdV7aTSMVEGepCNiTwz+juSQUnytbcwgUtVI8iXmWsPx3BWRZNyLeyNfywOUzEUCJEcvjeE4exry4FqYL4XupTOTq28gFZF53vY/uEX/bXA0Kpl1RjGBGGDhtZ34VfH8+4hjv9dQnl+P3tKl7br2rfywLKnbBcUa/LGKVWOlzoWweU0MfD4Rs9UY/lzeXYglTCIHf6rp9koEKhOnb8NuJ5JKLFV30EmX3W7VJ8KYcOfA7yVcdsojiAUotRUJ640ejWlucUH4RzHYgi256lnJESuiILFqvOR8GDZX1YJIbsJlJldF67/sZMM910E82+fC8jvK65uESYzRKAAixE46F9Y/TJYbm2pwqLYF3ywuKjxnO3hg2qLgqXjJAWExYxywerrcOSh5Nz5NvOaMXclLkBAw9WBSryI38McqoCCTGVRd9h/5GrAuGGXHDBHW+o24lCn6iDSk/1+FiD2Oi5Ty8msCThM58C+NYErKYCuRwyJqK5wDjc10+JA09CeJ/W71tQRkim5k00m3ZBPom91RzCpRaHar8ShAF+fL8A=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYUPR06MB6217.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(42112799006)(18002099003)(38070700021)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?MVV2QjhQTjV0YnNCVW03RVg3cDQ4QXl4SGlBWEFiclhlTzVOQzV2UTAxdk0x?=
 =?gb2312?B?dkV2N2lSMEp3blFpNC92a3BnZkgvMGlZV0NvZG1pSTBQZFI3dEs3WDhTVTda?=
 =?gb2312?B?YkZWbFRIZi83bHlvb1lFcDBQNnJ2SDBZTFJxWkFHMEYyS0tqVWY5V05KV09T?=
 =?gb2312?B?M3RKcEFneSt2SGVCSG91UkpPUXVvMzk2Q1dYRm81cHlWRGtKQ1hHNm9laDV3?=
 =?gb2312?B?NFVBYnNVaEJMajNZaWhJWElYS3JOQ3ZBejQrUjJoTGxyYkZDclhuQSs4NG11?=
 =?gb2312?B?M3B5VjNra2hxNmUxSytpcmlPSUtNYzVybllQNisxQlFhdVJxOHUvTndQbERa?=
 =?gb2312?B?NmVGOFM3bERvS0lScnR0OHdsZGlDdFdOOXFDWlVBUWJVNFZDTVgzaTg3Y0Y3?=
 =?gb2312?B?eHVpejByYWFpS1BMMXZVS2RxcXJMSmE1M1B0VFVid1FwVGUyZERHMUlLWEUw?=
 =?gb2312?B?YXU2akp2cmRYYXE1bEc2OXNxSnJlNWlqTVpvU2hFNWhQcytQUDQxV014SnZN?=
 =?gb2312?B?cXAwdC9Tdm5OQm0xZjFKR3VGeTZPSVh4NjJnOWhmdGxZdTdwUXhUUVU5KzVX?=
 =?gb2312?B?VFVDZnRHZWxkVjZYU1ZiQTdwL1B5YUVad2pBNi8zTWc5cXYrUzEzMVJoUE5a?=
 =?gb2312?B?aFA5U1p4RFh1bDdXU1JNL2NGUkFxZHlHSHgyRThDblMraTJSZWFRdjk3UWZR?=
 =?gb2312?B?M3ZibWxWbFliVHN3TW1mczNQa2d4b2N0WGJaWGhnT2Jtd2huQlJaUVI5Tmxw?=
 =?gb2312?B?YWdEY2dieTZKM1V0K2l6Qm1KYU00Z1dBT1BsRG9IYXl2M0JlUllJcURSNGVK?=
 =?gb2312?B?dElVZHN0K0YrZWMvS1FtWjNjSkJFd2NvcXNXOWJraHV4dnMzMEJZb3BHYm81?=
 =?gb2312?B?VWxzVndrWWROZjNkamVYakxNemllUCtSNkpWSmhaalBtZmsvVXphWDVOdHVn?=
 =?gb2312?B?Vk9rSmhSUUlYMlRVSHpURGpic1F2UkJKN1ZWTnQyWVdMa2x5UndFamdLUXFP?=
 =?gb2312?B?VWFnalptd0RDbGlROFk2Y3hENVVNcGRLa3BlVWw0amNTOUZPUm5vZjVRMklw?=
 =?gb2312?B?YXd4TXcwalk0b2QrZ3JWVUFpU092MTdpcm9tbkdIM3k3MENuSEVpY3dNTVhS?=
 =?gb2312?B?OEJxd3h1a2xld0QwR09GMlI3TllrRS9Pbm56QUxvY0E0QWdydG93a3dGb3hw?=
 =?gb2312?B?YmYzNnRIUDQrUEw0dU1SejJsclF1WjNaUHRWSDNuNjh3eTJPMld0dkRQL0xN?=
 =?gb2312?B?dGtBOWV2MUYrWmVXZk1KSkgzVmZOTzZlVG1zZFZNMVVuUW9TOVJRTHQrc05E?=
 =?gb2312?B?dWR4VE14Rk9sNzdsYWtoaTd3MDZSRzBXMDhvNVhaYUM1TUNGZ2paMTFaS2VX?=
 =?gb2312?B?cjhQU2xRbFNIcUMzeVg4N014c2FidlhHOEhEMHlPYWQ1MVB0d2VkUElnUDV2?=
 =?gb2312?B?TUFCK2F0eWcrdERMcW1NcGpDZlUrWmUyYW96a3I4UjFhWm04dCt5bjlVbG9Q?=
 =?gb2312?B?NGVoZzFHK2lqQW1nTGJ2Rm9xOVNiMCt6N0ZWU0lRU3BRWUNFSWNrQlVFZFI4?=
 =?gb2312?B?WWRMUnJLTllESTE5UHowZzNDUlZwUkFUZE9zK1QvNFExQnczVlZxT1dzVmdK?=
 =?gb2312?B?a1pGdzRHdHUrV3R4OWhobkt1aE53ZzlUY2RWeG5EOHlMUW5OdEFHanFBelFR?=
 =?gb2312?B?dGx3L3FjRW02WGZ2Y2ttQkRIRkhVMW94aGFNSWdhU24rTThMZzBYRk5jWHMr?=
 =?gb2312?B?dmhyV2RqVEcwL1pmS3JKK1R6TTA1ekNGQ29udXVsL0x6Q09XSkM5U1JJREdY?=
 =?gb2312?B?ejJCRExZdjFkRnhSNlY4azRNcFptTDFhdjR5eU5yTUJYQTNCSTFXYmMvRUF3?=
 =?gb2312?B?bEtUYXh5UlVCUE1sM3QvemprUmVYRFRaVEdWWk4vWFVnNFNtTGZFTW1LMlIw?=
 =?gb2312?B?REt6UHZZYTUvaWw5REliV0pRaWxteUZ1dktGZ2ovbjJnTUpjQmN6b1NXMWZr?=
 =?gb2312?B?NDJDcGZvN2pKNzNXaDk0TVZVbWpITHIvaEo4WUpnL0hHWG16Vm9ub2FDUmtn?=
 =?gb2312?B?Ti8yKzEwd2VFWDVuN2ZOVlpHdzFEcDFjL1RLa3oxR3ZHTjFGNVljcEd0d3BO?=
 =?gb2312?B?eE9NS2ZkNFdGZWNyeXoxa1cySWZrTmllMHR2YzlJcTlkOTMwRFExVmM4MHdW?=
 =?gb2312?B?UTNEUGZ5YWlMOFJGa25tZ1JhT0xuOUx4REVEM2dVR0ExamhNVXhxQUg4ampw?=
 =?gb2312?Q?NZBc/6eQu62mSlPTEaOYKNPrIiIxOZmUSW6ye4xsZk=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7621612e-aa1a-4872-2a34-08dee9819739
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2026 12:46:33.0329
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DMcorHgVqThweVfujZo8NHp6o3g21e3OdRfuyOwP0DP4V59RvDUtKuFHr+aVlDG+IUomLjYinLIraiej7t5vnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6654

U2V0dGluZyB1cCB0aGUgaW50ZXJmYWNlIHdoZW4gc3VzcGVuZGVkL3Jlc3VtaW5nIGZhaWxzIG9u
IHRoaXMgY2FyZC4NCkFkZGluZyBhIHJlc2V0IGFuZCBkZWxheSBxdWlyayB3aWxsIGVsaW1pbmF0
ZSB0aGlzIHByb2JsZW0uDQoNCk5vdGU6IFRoaXMgZGV2aWNlJ3MgVklEIGNvbmZsaWN0cyB3aXRo
IEFwcGxlJ3MgKDB4MDVhYykuDQoNCnVzYiAxLTE6IE5ldyBVU0IgZGV2aWNlIGZvdW5kLCBpZFZl
bmRvcj0wNWFjLCBpZFByb2R1Y3Q9MTEwYg0KdXNiIDEtMTogTmV3IFVTQiBkZXZpY2Ugc3RyaW5n
czogTWZyPTEsIFByb2R1Y3Q9MiwgU2VyaWFsTnVtYmVyPTMNCnVzYiAxLTE6IFByb2R1Y3Q6IFEy
QQ0KdXNiIDEtMTogTWFudWZhY3R1cmVyOiBKS1kgVGVjaG5vbG9neQ0KdXNiIDEtMTogU2VyaWFs
TnVtYmVyOiAzMzAyNzBEMjI1MTIyNQ0KDQpTdWdnZXN0ZWQtYnk6IFJvbmcgWmhhbmcgPGlAcm9u
Zy5tb2U+DQpTaWduZWQtb2ZmLWJ5OiBMaWFucWluIEh1IDxodWxpYW5xaW5Adml2by5jb20+DQot
LS0NCg0KQ2hhbmdlcyBpbiB2MjoNCiAtIFJlbW92ZSBtYXRjaGluZyBQcm9kdWN0DQogLSBtYW51
ZmFjdHVyZXIscHJvZHVjdCAobmV3IGxpbmUpDQogLSBBZGQgVklEIGNvbmZsaWN0IGluZm9ybWF0
aW9uIHRvIGNvZGUgY29tbWVudHMNCiAtIExpbmsgdG8gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2FsbC9UWVVQUjA2TUI2MjE3QkQ3QkYxQUU5QjMwODI5NUZGRkNEMkNGMkBUWVVQUjA2TUI2
MjE3LmFwY3ByZDA2LnByb2Qub3V0bG9vay5jb20vDQoNCiBzb3VuZC91c2IvcXVpcmtzLmMgfCAz
ICsrKw0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykNCg0KZGlmZiAtLWdpdCBhL3Nv
dW5kL3VzYi9xdWlya3MuYyBiL3NvdW5kL3VzYi9xdWlya3MuYw0KaW5kZXggMGRlN2M5ZDk0MjU5
Li4xMzg2M2U5NjYzNDcgMTAwNjQ0DQotLS0gYS9zb3VuZC91c2IvcXVpcmtzLmMNCisrKyBiL3Nv
dW5kL3VzYi9xdWlya3MuYw0KQEAgLTIyMDAsNiArMjIwMCw5IEBAIHN0cnVjdCB1c2JfYXVkaW9f
cXVpcmtfZmxhZ3NfdGFibGUgew0KIA0KIHN0YXRpYyBjb25zdCBzdHJ1Y3QgdXNiX2F1ZGlvX3F1
aXJrX2ZsYWdzX3RhYmxlIHF1aXJrX2ZsYWdzX3RhYmxlW10gPSB7DQogCS8qIERldmljZSBhbmQg
c3RyaW5nIGRlc2NyaXB0b3IgbWF0Y2hlcyAqLw0KKwlERVZJQ0VfU1RSSU5HX0ZMRygweDA1YWMs
IDB4MTEwYiwgLyogVklEIGNvbmZsaWN0cyB3aXRoIEFwcGxlICovDQorCQkJICAiSktZIFRlY2hu
b2xvZ3kiLCBOVUxMLCAvKiBRMkEgKi8NCisJCQkgIFFVSVJLX0ZMQUdfRk9SQ0VfSUZBQ0VfUkVT
RVQgfCBRVUlSS19GTEFHX0lGQUNFX0RFTEFZKSwNCiANCiAJLyogRGV2aWNlIG1hdGNoZXMgKi8N
CiAJREVWSUNFX0ZMRygweDAwMWYsIDB4MGIyMSwgLyogQUIxM1ggVVNCIEF1ZGlvICovDQotLSAN
CjIuMzkuMA0KDQo=
