Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11012021.outbound.protection.outlook.com [52.101.126.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C3D3AD522;
	Wed, 11 Mar 2026 07:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773213772; cv=fail; b=dF3Ea063HkjaW7ryVF1tLac5y40eTxms1KsYkdBbgYBL3bSmEl/Oke/VXkmjYpY5ZDHb2IUieZfsFCfQux4ZWOZKpjz9E3gTEZ1aSI4bipPEbM/zTogtFpLqqBvYUZbZe+w7J2+w1RNHMboMkXFZhZ9PBE1PHKquDvTaYIL6qw0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773213772; c=relaxed/simple;
	bh=drpxxLb3EDORgh4guxOqGHOSz9XqZ+8/AEwiPzB8ykQ=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=QZhpiMUp0HYyJVyQuPllU55fkAIQhRmANzWIPK9pkvfp68FLhhynonggeAJmaFWtRTCa2Vj3p1C0YUpr19SycYCD4eHOnevJrnjgFZNnSPkKpvyRvJ6KQSSMsLv8zHCgHRuBv8wPbiK5kpf0AJuVjm/ybrOuU5oadNHOMrddDv8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=PmRu+6dY; arc=fail smtp.client-ip=52.101.126.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="PmRu+6dY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H3XNaMG0BAeYd7fDyABfN5gJBw0QYlJvI7C39lqUrqtf//DzJsZc4eyVJ2ljRreNwa+rwi6DdHU9rQ8nzg8GCWtPqtLNVYl1hd1yYVvl92muHEmMfJ3pThIp8kGEdAXHDwHnl6vREA8mN2HnNpni+KRtsnCLVnUwJdm4op5Feug22jUjoY1qTydRCYVKOVVnK8EDLeI+DlEv1chC4hGZETTG4REGQYvWwaf3ybZuhrszyUDe9oEk3sT6vS9REDF8/bfcTvlM1osIkUYBVe1nfmFoT+8m+IXcFsL9f7g74nMUtxgGRI3BgTH8N0Eb8L1KMzMnXHx8GwPdsgEKEaOXGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=drpxxLb3EDORgh4guxOqGHOSz9XqZ+8/AEwiPzB8ykQ=;
 b=xWJvofbDNqB/xYjuDVgGCISlsebNxUYlusJOqbbdoJ0niordjLmxjLSdBdZg+C1MFBK54vJWaPxBBtwRPXpP+pxiaA331lymkqat19goUjMV6FbsyQlkfVO/z5RjU2CqEO7Jnto8W62AWidYGyoDr8XwpAweyUjXyKSrBrGZ5JlyNCFCUP1AfXwUDjJf6OafgXV0y1GvPzKdgIMrVy/5BUtZYLbqyTBjWErSqH1sNDKcTuX1GfE/P5hauUFTnQepM1bp0k4M7gTs3TIs46vfsYvKccBUxy/vnEiu+J33OjStILWOQaPviYVAflad03D6D9S+T2oqwwADdNf0DH9+5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=drpxxLb3EDORgh4guxOqGHOSz9XqZ+8/AEwiPzB8ykQ=;
 b=PmRu+6dYUou/TuLCshcw+G5Ri1kbtxNDUKD3xGOLOD0tptTlSVmaJQko76El9JOIlmHfdmCMkc+14CCihaOheyGE4GoP7W3H3TRsJYTtrxOkcSi6HJvoVI5CxnQfhUd4UHBTK6oFwfBWws5csTCSLPC8hHL6iaEVQ3kg1fEIoNqFsPetyoOF6MehypsXa8kmRwJqciUaUaIhLgDyM5TK9IXUQI3eLw1SVJAkfqncaKyV9MJ1PXKF7dXVrI8pxqckA6cwb9EkSylE31Tw2orGqjycAs24UxoyDCfGWQsZ/6CPIWQqYLRsOquk8m+mAn1QInWTbs3oWIbH5TypyU/CjA==
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com (2603:1096:400:358::7)
 by TY0PR06MB5031.apcprd06.prod.outlook.com (2603:1096:400:1bd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Wed, 11 Mar
 2026 07:22:38 +0000
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc]) by TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc%4]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 07:22:38 +0000
From: =?gb2312?B?uvrBrMfa?= <hulianqin@vivo.com>
To: "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
	Cryolitia PukNgae <cryolitia@uniontech.com>, "pav@iki.fi" <pav@iki.fi>,
	"jussi@sonarnerd.net" <jussi@sonarnerd.net>, "roy.vegard.ovesen@gmail.com"
	<roy.vegard.ovesen@gmail.com>, Jussi Laako <jussi@sonarnerd.net>
CC: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?gb2312?B?uvrBrMfa?= <hulianqin@vivo.com>
Subject: [PATCH v2] ALSA: usb-audio: Add iface reset and delay quirk for
 SPACETOUCH USB Audio
Thread-Topic: [PATCH v2] ALSA: usb-audio: Add iface reset and delay quirk for
 SPACETOUCH USB Audio
Thread-Index: AdyxJz7qKxuM7/2fShm4z38hQVvTtA==
Date: Wed, 11 Mar 2026 07:22:38 +0000
Message-ID:
 <TYUPR06MB6217ACC80B70BE25D87456B0D247A@TYUPR06MB6217.apcprd06.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYUPR06MB6217:EE_|TY0PR06MB5031:EE_
x-ms-office365-filtering-correlation-id: a2623ac8-529c-4020-1ae0-08de7f3ef968
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|42112799006|366016|376014|38070700021|56012099003|18002099003;
x-microsoft-antispam-message-info:
 2V0UX+gwD/syRKvsTp7MxEABWJKNOlbEuPeIS1GXLKr3HIo9JTwzowBXxlna6y+5Xh9hmOXj4F3QlZhn6rqBcKd2GGxnszdB9CmzNTy6yV+ASAN2x2TQR0+5DieYvqZPBg+cus7Esq13R4H77n9WNnC458hvMC/oK2XhnzMiNIg7fGmKnxeSBk1zfB4a2Iy3sHN8CRtLYI7eGkeviqzoMFVSDv/zjBdIOSJhTjW1wertZELtWo9ZzAmO8vROArR9p5j+szNp12ydal/mSkSYItXWh0RDS8//DoO/OmL0o4WQwwxfZLynH95SfPiaeKXuGudMBEUlc0DTywfZSC2YHUhqA+fddweADUGSyoXkj+ihl0P0QvZRmedF/ZfG67fp1WaFf+jNQDfQzIOk24IakBjR7cCYpedIIPY7FaI8n5lZpNpjL22kuTSexSviVmHAnH1dVBSSUnnS2mwy+51iPCrtQDvdSqGW+NE4zmWeAiTah2/X/jd5HgN9dXUJVn9TZk5iupOj5j4pQBJfptuOYRJDUxwEqBJ+84zkrmTBWCfz0A2bH+huIM7EHTeAqvtAshj2XwT/S0skJHz78R2ZECXY2DB4/9Wbg2pWSg4negsf2mJQWtBeq248zrqukD03sf8TnXAPk+6SKx4Or+7xFtO/4mh9dTVWwi1PPIAxa9mjLxs1LOA/2yuMvuiCqyoHo4F8mCx0hH4MKNbElJWA6YViz5Q2XDAkdmouREYE2IOLqwYC1XtUQpyTw53MwB7HZD3D2sSi3CA3RD1ywq7YAvbElcHxb5GjzkUD7/Y9zAA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYUPR06MB6217.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(42112799006)(366016)(376014)(38070700021)(56012099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?eWk2djQvdXgwZVUydGpkZHZHemRRMzBwYkZ6cXNMNjZ0YzVwejRKMDZhRzFY?=
 =?gb2312?B?Y21uQThKNFhFb01lajUybnhxMmI4R0pxYkxCSDh2SHdnbitvT0ZwZ0Zhd1ZE?=
 =?gb2312?B?RzA0WmZpRFAzQ1dZSkxZUDdQRTNXY2JEaXU5cUdtQ3o0dkZvU3k3YnppSWRr?=
 =?gb2312?B?NmYzbHMrQTZucFJIa3VhQVFQeUdlbis2eHpUK3FmOU1icGtwOGlJVFFINXZx?=
 =?gb2312?B?RzZHcUMrNUpKeTUzalJ1NFBRbDBLdC9XSmc0cTZ3cDI0RTBiYisrVmRKcGFq?=
 =?gb2312?B?TEllcFF1SmRIRXZJdGJwMUdqUjFuTlBpT2d1MzFJSVpSV3d3SFdsWFdid2FI?=
 =?gb2312?B?UkFrTkFtUjVTeG0wdU9OYkxPUUlkTUhscnFJUTRDWXArMnBVYUh0OENSVzZF?=
 =?gb2312?B?MTlIUndWVjZkVkNlKzVOTnlCSTBOOUZORkNaYUNlUTRuRWFJdlF0YkVxQndr?=
 =?gb2312?B?MW55Z1p4UUppRS9Vb1Z0ZjdiejhkbURsS0dERzMrNjZrYlpoMnJJL2pnOWhI?=
 =?gb2312?B?NFBuZzIrNEwzQ1FZeTRSVll3alhPVkJNTkMwS1ZaVGs0dUJnTjBkYSt5Tng3?=
 =?gb2312?B?ck52UWJSTlY5WDVXY3owNEU1R2pBTktCeVVVa25xc2JBb2JtNzJvU2hWVlJM?=
 =?gb2312?B?dlVsbG1UeUZodGcxWDRNMXVQRlFNUUVZNzdBWnZuZzZVdW83RUh5MnJka1J5?=
 =?gb2312?B?U04rUVg3TDMwK2crRWZWb2VYNW5yNVBXTFpaUEdPTVVKSVpEQnNXczB6ejV0?=
 =?gb2312?B?WGN3REl2SHFBN0xJS3F0ZjNDUUc3aDd4REFhaW5OUDVKUzcwNjNoTGNpd1NK?=
 =?gb2312?B?cW04aGg4V28zS2ppbnhEUzI4RUN2WnJ3NDFySmdkUGF1eC9lQWRRZGxyM09Y?=
 =?gb2312?B?REtxengrdkgvUVRhY1NISk1kcHppUXJTQ0NNNFQ0ajVhbXJLejlsd3dweFA1?=
 =?gb2312?B?bGtLZWQrTFNVdkFEYkI1NzFNWXo5NkUxWC9JTlBZVDB5Q3IrK2tOaXhObmJs?=
 =?gb2312?B?RGNRdk9SSFRHSlVxZWIvN1ZrYjlHQ1F5QWdxUG9LcDVwM2RORkZZcnQrYjNH?=
 =?gb2312?B?amszM01JYmM1UmhlQk9mcG9Pd0NZL3Q2cFg4UWJBWlJ2Z09hY0NYc2JmVmlj?=
 =?gb2312?B?S3JSSjR4TFpkZEhYSXBNWEtsMHhESVgwT05nSm92ZDltUVNaZ1ZTY1BwMWVs?=
 =?gb2312?B?aE9JVUNUY0RJSzZiZlNGa2JYVHZlb1l2WWVrdDhqQ0hQY2dOSkRMQnlEUlh2?=
 =?gb2312?B?Sk94cEFqa1prRklMZFVOVkxwYzRVS0JDS3NnM3hlcWpJM0FaWXpHVXIvY3NF?=
 =?gb2312?B?ZzdPNkQrMkI3aXRDQ3p3Q3g3RjVWVy9KU04rRThTUTV1eW1hZDdlbm1NaGVl?=
 =?gb2312?B?ZHFpM2luc2dIdjFId0wrK1VSRmc3MG1RZmZSa2JXMlVBSFZGbncrUVpqR3dh?=
 =?gb2312?B?NjMwZGlBMjQ5S2d2dFpyZnFQN2t1TVk5Q1M4cHI2ZHdMMkxxalBrQkV1c3dW?=
 =?gb2312?B?czc4SzJpMktCV2pIbW41VHp2YUp0bW9QSHl6Q0pqV0NGT2puVCt3VHo1bk5T?=
 =?gb2312?B?THRBRkFmOXVhbXRVTS9tMFlhbmVrdERkR1ZhUnhKY0lIMVFBbkRPNitSaFdD?=
 =?gb2312?B?RmprQ3pRMHFkS2cxMy91QkpKMXIyUW9NRkZKeFl2WWUyR0pwZ1hnOU1SN29D?=
 =?gb2312?B?QjJsbk0weVNyY0luSWRFSy9ucHhRcjRJbmlQWjdPeTB0TFhsTVFVc3hRQ1Zj?=
 =?gb2312?B?bFFlVUk2a3dFa0FxVTQyd1pHVXY4VkNWcjd3T2RLMk02MXBreTlVdHIxTHBy?=
 =?gb2312?B?RFB3ZTBveTBhNkx6OWJRUDZTVWpwa1ZNRGt2U3Z1cUoveVJrZndsYkl2eWtz?=
 =?gb2312?B?ampSYitPZTNyZVJ0NDRNcksybEFnUkZueFJUOUhDWVRJYmFXc05JQU1EalBP?=
 =?gb2312?B?YWxEaDNoLzlLRlZsZ0FNdFAwWm9mN09mbEo5NlZXRGswbEwyMHo1Y0NHbkJn?=
 =?gb2312?B?Q0pZdkdHZXBiNXg3bHRuYjg2SlNuL1RVVVZZalFpVDFJam9OUitSTDVlNGU0?=
 =?gb2312?B?QkFnbWZBSzdiMDgxRUNTTDhOSmFtSm03ZWNWMGZpOWpEQmlzSWpOajBTTWNr?=
 =?gb2312?B?NXArdFpsYkZrVy9sSmRVUnlOaDlmMlEyVXZkUGRVNCsxUENKTzd2L2MzaGRy?=
 =?gb2312?B?RzcveCs2bjdMV00ycno2TmtXTm0yOWtxYnNoUE5JWktIb3hVektUdlJFcldI?=
 =?gb2312?B?TnRod0pPR0JxNU0zZGdqUkVzdGp6dzY1MDNGV0lQTUVCN0JyVGZrTVlTL3RC?=
 =?gb2312?Q?QxQ/AEZQWBOOWci2Ns?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a2623ac8-529c-4020-1ae0-08de7f3ef968
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2026 07:22:38.2174
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OlM8Hl61u3WlDdPDYQ1NcKzIlMWLbUydxCttEq7Z8NvBAarwtLYkzQWBMZfJLLk3FQ8ghQHSOPA/6diwQ7aFOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5031

U2V0dGluZyB1cCB0aGUgaW50ZXJmYWNlIHdoZW4gc3VzcGVuZGVkL3Jlc3VtZWluZyBmYWlsIG9u
IHRoaXMgY2FyZC4NCkFkZGluZyBhIHJlc2V0IGFuZCBkZWxheSBxdWlyayB3aWxsIGVsaW1pbmF0
ZSB0aGlzIHByb2JsZW0uDQoNCnVzYiAxLTE6IE5ldyBVU0IgZGV2aWNlIGZvdW5kLCBpZFZlbmRv
cj0wNjY2LCBpZFByb2R1Y3Q9MDg4MA0KdXNiIDEtMTogTmV3IFVTQiBkZXZpY2Ugc3RyaW5nczog
TWZyPTEsIFByb2R1Y3Q9MiwgU2VyaWFsTnVtYmVyPTMNCnVzYiAxLTE6IFByb2R1Y3Q6IFVTQiBB
dWRpbw0KdXNiIDEtMTogTWFudWZhY3R1cmVyOiBTUEFDRVRPVUNIDQp1c2IgMS0xOiBTZXJpYWxO
dW1iZXI6IDAwMDAwMDAwMA0KDQpTaWduZWQtb2ZmLWJ5OiBMaWFucWluIEh1IDxodWxpYW5xaW5A
dml2by5jb20+DQotLS0NCg0KQ2hhbmdlcyBpbiB2MjoNCiAtIEFkZCBhY3R1YWwgaGFyZHdhcmUg
ZGV2aWNlIGluIHRoZSBjb21tZW50IGluZm9ybWF0aW9uDQogLSBMaW5rIHRvIHYxOiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9hbGwvVFlVUFIwNk1CNjIxNzlBRENEMUI4NkE3RTBDNzNFNTNFRDI0
NkFAVFlVUFIwNk1CNjIxNy5hcGNwcmQwNi5wcm9kLm91dGxvb2suY29tLw0KDQogc291bmQvdXNi
L3F1aXJrcy5jIHwgMiArKw0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCg0KZGlm
ZiAtLWdpdCBhL3NvdW5kL3VzYi9xdWlya3MuYyBiL3NvdW5kL3VzYi9xdWlya3MuYw0KaW5kZXgg
ZDU0YTFhNDRhNjliLi4wNDlhOTQwNzlmOWUgMTAwNjQ0DQotLS0gYS9zb3VuZC91c2IvcXVpcmtz
LmMNCisrKyBiL3NvdW5kL3VzYi9xdWlya3MuYw0KQEAgLTIyNDMsNiArMjI0Myw4IEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgdXNiX2F1ZGlvX3F1aXJrX2ZsYWdzX3RhYmxlIHF1aXJrX2ZsYWdzX3Rh
YmxlW10gPSB7DQogCQkgICBRVUlSS19GTEFHX0lGQUNFX0RFTEFZIHwgUVVJUktfRkxBR19GT1JD
RV9JRkFDRV9SRVNFVCksDQogCURFVklDRV9GTEcoMHgwNjYxLCAweDA4ODMsIC8qIGlCYXNzbyBE
QzA0IFVsdHJhICovDQogCQkgICBRVUlSS19GTEFHX0RTRF9SQVcpLA0KKwlERVZJQ0VfRkxHKDB4
MDY2NiwgMHgwODgwLCAvKiBTUEFDRVRPVUNIIFVTQiBBdWRpbyAqLw0KKwkJICAgUVVJUktfRkxB
R19GT1JDRV9JRkFDRV9SRVNFVCB8IFFVSVJLX0ZMQUdfSUZBQ0VfREVMQVkpLA0KIAlERVZJQ0Vf
RkxHKDB4MDZmOCwgMHhiMDAwLCAvKiBIZXJjdWxlcyBESiBDb25zb2xlIChXaW5kb3dzIEVkaXRp
b24pICovDQogCQkgICBRVUlSS19GTEFHX0lHTk9SRV9DVExfRVJST1IpLA0KIAlERVZJQ0VfRkxH
KDB4MDZmOCwgMHhkMDAyLCAvKiBIZXJjdWxlcyBESiBDb25zb2xlIChNYWNpbnRvc2ggRWRpdGlv
bikgKi8NCi0tIA0KMi4zOS4wDQoNCg==
