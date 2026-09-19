Received: from SY8PR01CU002.outbound.protection.outlook.com (mail-australiaeastazolkn19010021.outbound.protection.outlook.com [52.103.72.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5403CFC0A
	for <linux-sound@vger.kernel.org>; Sat, 19 Sep 2026 13:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.72.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789825602; cv=fail; b=cGdogHsQhDYeWmupKgwCpzCgjBC7H327l8RNKvzvRqIfs0mrl8JzKOFezdUcR/A56/KKJejcseFoYJG60bQRWvgc/LZ6gqHdVKOgXxSjM3/coap7kUXZbCPoKX0PwH60GDpdyvdhIrok96Y8KVgJCAHThG5Aty9S2DXaY//P3Z4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789825602; c=relaxed/simple;
	bh=EJNCw2nqLJ/pqxYc064mUZJF34bOPYSP/Nqc3XRXvzY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Dv5VpoUPmmOCy8+GI8/kVmtSNC683yys4wMFnBxp5eTWVY4mzeIfYOGt4fXH10R0lloRNpL/tLqpTuUNpyyh8MU030MDcGCJLr5qMwRWRwssoTi9P5GDYVey5jSSLBDhoN1fqx956KDlZMfu7yWs6+b+n/ZHSHv02626nyLpwwM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=kbXhWEoG; arc=fail smtp.client-ip=52.103.72.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="kbXhWEoG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QWnNjqLvq9fLXoJ7kbi0C+52feZykWPt3ODoOUlNsnz74WAD+43Trmn5bSpGEKrrk2ua3oxJkf5K1SEXEKnBVtCNU5YsuKouvNqWckfnRD/QrFyffiPLJX1fA785xyu1MNHLCM/MW8bYBhKwnESGLsAsAfQaklfzxU32RrEm7wuhb9q9GeV2+kUhPeBs3h9hHrrDzM8dgFrA9t+ZnDtTXlRVgT+UDFA3hPtLDltt43PlGHXAwBgjX9elHDkCHJO1GdtExwcthDDSNbKadMIcMF2ZNigOoo5qFzw+30b8rwonJafCoVSFf6OsGHA94gNcvwybqM1Fg40wih558CpkHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1LXaZES5kTTu2mzOZYbvv+r8oz27SOY/97RVA93K+Nc=;
 b=QdQDBNx1F1stdoOT9k8wj8feQenWC8YwaKlf29F3blqOGvjYYHE9cuAboEeWO+wqQzSBjJmEBAnvX57JT5Js1EPInHE/Y5mMCPUuZuQfnHa26BHGhOFI8HA+56z3nb0lmPNzJbaBoyAMrN1Agrc29dolTJ15SFhU430SVQkll3u2BiZwnVSmD1jgCaeWxV6jvX0VwESBg+jlCvFhvb8Ab4gaH7AGpUFMyAX2P3Rj+2sLOEt5X5y931bXdZtxMha5JNtMGXwuO2CKHXZzeXr6LALeSzO3H+4X40t3aGAVTmnfJB4L/GyKpSd8FHAX8wnwTTKi2UhvN/raFO4akwEc2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1LXaZES5kTTu2mzOZYbvv+r8oz27SOY/97RVA93K+Nc=;
 b=kbXhWEoGQSXBiKSppLOZLK2lapyF2c6uGo+BDmPW4n6k1wcd1mD1P/+EW28cIrI+i+DlIYmyY3c+cUI7Pjnazxglr8TeAAs5zu7976TamARfk77x7MBAQivchlnd/9kqdw5MSzIpYq7jG31tTOUW7g58Eu1UtjI4tTIZ+aJGJ7lvls4yFm2hWxgUdED3pTSZiqnhkg4ec2Y8uHth35O+eCa0KOrxNWR919XtX35Vd38oZMafPFXNFLszj40zETmrZ8sHNL6sI4BsVmpfX5sSjFPcCudA8EsS9KifE8z9Mxg2cgPrD1psmdI/R98FweDrPcAKx+8pWbmmmI7V2bqcxw==
Received: from ME3PR01MB7504.ausprd01.prod.outlook.com (2603:10c6:220:135::15)
 by SY0PR01MB11036.ausprd01.prod.outlook.com (2603:10c6:10:33c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.9; Sat, 19 Sep
 2026 13:46:34 +0000
Received: from ME3PR01MB7504.ausprd01.prod.outlook.com
 ([fe80::98f7:12f3:4e95:414a]) by ME3PR01MB7504.ausprd01.prod.outlook.com
 ([fe80::98f7:12f3:4e95:414a%4]) with mapi id 15.21.0451.004; Sat, 19 Sep 2026
 13:46:34 +0000
From: =?gb2312?B?wfUgtrA=?= <liudongxjtu@outlook.com>
To: Takashi Iwai <tiwai@suse.de>
CC: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"perex@perex.cz" <perex@perex.cz>
Subject: Re: ALSA: hda/conexant: Fix silent speaker on Huawei MateBook 14
  (SN6140)
Thread-Topic: ALSA: hda/conexant: Fix silent speaker on Huawei MateBook 14
  (SN6140)
Thread-Index: AQHdQr9RtiNUdcaHGkCDaOZNUr6OCrbOQAAAgAe0ot0=
Date: Sat, 19 Sep 2026 13:46:33 +0000
Message-ID:
 <ME3PR01MB75042406F30EE48AB6DA3595BD862@ME3PR01MB7504.ausprd01.prod.outlook.com>
References:
 <ME3PR01MB7504E1F31E26F760F73DF639BDBD2@ME3PR01MB7504.ausprd01.prod.outlook.com>
 <87a4pjom3r.wl-tiwai@suse.de>
In-Reply-To: <87a4pjom3r.wl-tiwai@suse.de>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ME3PR01MB7504:EE_|SY0PR01MB11036:EE_
x-ms-office365-filtering-correlation-id: 7568c31d-338e-42f5-d3ca-08df16546b1a
x-ms-exchange-slblob-mailprops:
 AlkLxVwsndm0VyxXF8Qt58maZsxVls0azCw2UiBxJOJEiTIRrjGId0n/JgO1LV4QCOdDFNV9G/abj/fbx5t5ZiOjxp5sBZN/LMuyrj7ot0uzi5ExKPYr7kC8zkCKDTNTsV1gn2gROa1yTXTYemNFWxjuxf2lQcnX/7MoT+T4YmHKTBeLCW0YD9XSrm97FuubN/3IbmvqBuq8wBFoehiyLx8ZzVknBm7Pe1r2STaiNy1fxOKGxUN6/ndNBLKFx4edg3Jt3bQVEoyGxk6tBcRBA+Xec7JSWWVypsU9LoK+HX5TuFrPGpAgz6i7L/CvmnN+gr2JuilXy/tG+LNTOLiQ+9H0s/KdcEUWINEBKvZNHXh9CrBuZEKTnJ+NBoWYUjQKKSURLR8U/y2u6+l1s9wT983b68usQHxBcyff6ojvtttURrRGk0+LDH0pxY5dtqR1bHYdDLSyUIuJWp6na97zpoXXQUH//BJMiQ3FpSJrx6rRl6Nv6ka9TWkv1g4ovTntyVVGJtK5778d0atdmDc3250iKYdlEVJF1lye3evEUuGgAU7PKicT1tQqkhM3U96Mcre45kCvqCz6IaYL4WP/flIJHYkrQ9PesTCawonw6y8YOzI3AIQmQ4T4dt6rwjX+w1BEdzCWeEV6qTiC0dDGtUwTVVo0GkpHmRqWy1AzJaYhDQjLWGsSCy4J3W4qp3A+t0G0L4+59SoHYHWk7WKFw3zDDWhTirRPnpRuO8Vzdcxz+v3pjAkrD1v+GjWMz+++fJnG0LHNWdBoW6Ptr9A6N+LgD8UgxkdR
x-microsoft-antispam:
 BCL:0;ARA:14566002|15030799006|31061999003|24021099003|15080799012|6092099016|19110799012|51005399006|8062599012|8060799015|25010399006|40105399003|2607281247196008|102099032|440099028|3412199025|26104999009;
x-microsoft-antispam-message-info:
 =?gb2312?B?Y3FuTkhHY1RWckllZzkxMkZhaXdNUXhGMFNoNVFwcVhyWE5MMnZLUWhJRTlL?=
 =?gb2312?B?cnlhczFpR21LQlc4cG10UWhxY25oOWgrNkQwUlc4dURQTWhXQTJPTENQZW5X?=
 =?gb2312?B?dmt0UDlERlM0WHlKNkp2WlNKb3F1SDAzWVd2VVJqUnZadWFGUkdidEtjaFlW?=
 =?gb2312?B?MklOdjBYbS85V01Da05OZGlBbmY1enRQRy9yMkswSUlxdGxPcmc0THZ1MWM4?=
 =?gb2312?B?d21SOGRmamhqNGRBZmpIdTBkVlc3SjJXTzBkMk82MzZkZDdQVmJVcE9tTzJw?=
 =?gb2312?B?cjlXcnVqSXR4Y1k1MTdTT3FFbWhJSnpGdnpucVlQL1o4dmFvdVdua2daY0pn?=
 =?gb2312?B?MU9JMzdQZ0ZUVnFuV1RwSUgrc0dJQVkrMy9qUEhDTzZkckZYT2U3MnhLUTlI?=
 =?gb2312?B?Y0dJdnZ2T3ZMQ3AyQUpRMThtcTR4S3F2YS9ZQnA0QnJyRmVhMUVUVTJOQTZv?=
 =?gb2312?B?bUd0VURhTWRrTzRRZUJzTXQ1WWlRTy93YVpnb1VBdWJFbGV6WTlMaHpjMk5p?=
 =?gb2312?B?YlBWZXpUWU1CUHpQNEpONFJoaFBnWFJvYVB6OVVpdmdZKzhxTGsvZyszQVdx?=
 =?gb2312?B?MmZTUmk5dUNzME5KSXBTcGprRTRpMHNITGhDY2hKLzh3TjJlTCtrUVV4QTFV?=
 =?gb2312?B?UDZkYS9ERlBMaFFRK0pkZWRDc0h3azIvVTUyS2JQQ3JuZUpnY3RJenVYendK?=
 =?gb2312?B?ZXBwb3BRM2UrQmcvWG9lWHR5VlBQb0hvbk93bWcvS2tXZlhvWUFsaXdKZlht?=
 =?gb2312?B?dThHVkI1VkVDd2k5KzQrV1lmenUxclZoUzV3NzIvMUlqYk41ZDFBdEJFU09y?=
 =?gb2312?B?RVIwY2c0Yit5QzBBWi9XbEZXNE5xc0FuZnFXZWJKV0VITWFrMGIzTk5uY2NC?=
 =?gb2312?B?YWEraUZYSGY3MTFLd1lkNzJmb1Q3NllxSXREd2U3NmNsVTc4UXV4K2cveFE1?=
 =?gb2312?B?Wm9kejBxNUZjWUVLdzJuS0pJUWdXY2EzbXZidGpPMTNjaUtmQmp4b2w1SnJa?=
 =?gb2312?B?US95OGdOQ3N1bEF5eHp2c2R3MFlJUWtqREpva3NHTlBVYWRIay9ta0pJRktq?=
 =?gb2312?B?NWNKRFRuekt5TUw4Y2xxamFkdFhWaFJLVXpJcE9icHlaVEFZSWZWOVFESTVX?=
 =?gb2312?B?OWJmeWIrRFRuaVVpa0h0L1hORlNYL2d6VVRaMmJ5dGNOQ3Z6SWpVcHNWMzlT?=
 =?gb2312?B?VjZaRUpkeTE0SkRISndOYkdaSHlXaVhZdHlmSUVOZll4dk04Ym5paGY1bXVJ?=
 =?gb2312?B?dG45cUZnbHM0VmJPSHNsa2FHR0dYT1JwNkVnQU5GVGFXcUJ0K1pCZVJ1TDN4?=
 =?gb2312?Q?O/JtFpK+o0lv46BdfFzRPf8Ofz0VhW0vki?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?NkR0bXJod3N3d2dqYzZ2ZC8vb3E2RndBVnNwZTI0M2dvQVNyV0RCQWhqT0E0?=
 =?gb2312?B?NCt1RGFHdnFDR3QveXB6UVd1UXlxK1MwWk5pU1RxVC9Ed1BIWEJjZUNIK1Ji?=
 =?gb2312?B?bmtSYXljSTZiTWNPZ1lPNDYrc1NwMmNLSURqOUlEem1BUW0wdXYxMzRwMUN3?=
 =?gb2312?B?MTBIZmNqaFdIVFo3WjIxK2grcWhxc1BweFBPOTkzTVhzbE1zNkpxTTZDOTZv?=
 =?gb2312?B?MG1xa0VlYk5adXN5bW5rRERzb0Z0cS94V1Fadk80VW40U1BOYzFkOG9BeXVy?=
 =?gb2312?B?QnRjRC9BOG4wSnNpeTlEaGpCUVpDVk1wc0hhNHF0NlZXNWh5ZVRyQW1JUGly?=
 =?gb2312?B?REZEYmM2SFl4TjNrT0hxQmQ1SHlzbm9ueE15YXVvVnFLYWNTN0VpUkNsMzdI?=
 =?gb2312?B?TWZwbTQyTEEyOVRWa3dONkZaVFNYYnhnenRZWThWQVJ5V2lTRURGcmw5WDZC?=
 =?gb2312?B?aFdVKzhMVEFaTlhkcG05bDVRK3NXeDNoYmZJRnAxSkZSenlQSkFabHlyZEhM?=
 =?gb2312?B?R2hSN3RhQVVhQUdVc3RjNk9QTGRETk5JRlNhbnJ4dXZSLzlpT0RST1NVbndB?=
 =?gb2312?B?REkxNDNRQnpXcHFNQjBacG1oMng1b21qSWdqSklQdmR5SVNWUXNzZXZuVllm?=
 =?gb2312?B?NDlqWHE0cnQvaTFzUkNDNXlXV21NcGlXS1g4VEdLdWZMZlFQcG5LS2Vsd3Yr?=
 =?gb2312?B?VVRYcHFRWXZjdXphUE9WYnEvTGRoSU9IZXlQRmp2em95WXBKK2lteC8xSmRJ?=
 =?gb2312?B?d0NOcDA1Uy8rY1hHa2hocDdtQk4wbG1ROUM3N3B1NDh3M3NHYWV2SGpMMmo4?=
 =?gb2312?B?ZTREU1hWVGg1UWU2cXEzZUtrcW1FNTJqczd5a00va3psZWxZemozMy9WRTQ1?=
 =?gb2312?B?aGM1ZDlXVlkrbGhidjRtYlZpN2gvU1hsOVFoYjdRcENEbUpZQlhKbUZiTEIx?=
 =?gb2312?B?TDhvV0RucEpMVVdLalZxV29jeHIwS0FWYTkxZEJwSjFGVVBoaUQ4NC9neXpU?=
 =?gb2312?B?amY5aHNLQWtiZ2NoNnZHMmhiRFh1YnlGOHkxeEdxK1dFVlZuQ3htU0hFUkdP?=
 =?gb2312?B?NjR0dlR1UWRpMDl5V3FGWktZeXJ5MS9hZXdtNE9qZUkwS0xrU0MydXpqbWV4?=
 =?gb2312?B?WktBS3NuNHUvUjYwUUVLU1A2djQxcjYya3Q1c0wwaEY0ejZWRHU3NjczMEdZ?=
 =?gb2312?B?cU5TNDJNWW8ya25iSXcrbk5XSGdqL3VQMENrTDBid2s3cXVmcGhVOGZWZmha?=
 =?gb2312?B?TEdDaTNzSW9JZkxoWlgrR09hZXRMOThSMGVlL1ZmczI4TTRCZTBxVWZNM3dY?=
 =?gb2312?B?cFc3ZmxWQ3hCSjg5LzU3a2ZjODhDNWt2bkcwNzdwWVd0ZjFOMVRycnUvd2ZN?=
 =?gb2312?B?QkQ4UVd1ajJlMXlDMElTYUIzTnpvanMydElmTWFDUmtnRVc3ZU16dDhzZVdo?=
 =?gb2312?B?NGt2d29ETU9rNC9Ja2dBNlkvM1JvSjQzOW5ObDFDc2FpYTd2YWN2K3RHSjIx?=
 =?gb2312?B?QS9OOGJlNUhiMVFkK09OSjRjSVZ1YlRLcWNBYlErUzFZK2l2SDlHekoySGd4?=
 =?gb2312?B?QzJZRlpqS2gwVDFPK1lGK2JUWHE0MXlpWEhqM1hoYUhJV1VscjhCRWFaNFVN?=
 =?gb2312?B?KytnTHdpRjViNUtsS0FLUkwxWjZ5M2tMbDdnYVNTbWpydUVHbHNhR2p0WmtD?=
 =?gb2312?B?QXlmbmVKZVJjd2tVY3ZDblQzZXRNbUNtRmh3T3d1bldmK0VKcDNObW5CeFlv?=
 =?gb2312?B?Y3NYTW1RbGsrUzcvdEF0VFZZUjBCT1laTGNrNmgxdldhS0NtTDZpR2N5Mk9o?=
 =?gb2312?Q?yNKcB4EEAYKxtsyFkdnbFgbOqOIoKNz9oCRz4=3D?=
Content-Type: multipart/mixed;
	boundary="_004_ME3PR01MB75042406F30EE48AB6DA3595BD862ME3PR01MB7504ausp_"
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ME3PR01MB7504.ausprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 7568c31d-338e-42f5-d3ca-08df16546b1a
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2026 13:46:33.9317
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY0PR01MB11036

--_004_ME3PR01MB75042406F30EE48AB6DA3595BD862ME3PR01MB7504ausp_
Content-Type: multipart/alternative;
	boundary="_000_ME3PR01MB75042406F30EE48AB6DA3595BD862ME3PR01MB7504ausp_"

--_000_ME3PR01MB75042406F30EE48AB6DA3595BD862ME3PR01MB7504ausp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

UmVzdWJtaXR0aW5nIGFzIHYyIHdpdGggdGhlIHBhdGNoIGF0dGFjaGVkLCBzaW5jZSB0aGUgd2Vi
IG1haWxlcg0KbWFuZ2xlcyB3aGl0ZXNwYWNlIGluIGlubGluZSB0ZXh0LiAgUGxlYXNlIGFwcGx5
IGZyb20gdGhlIGF0dGFjaG1lbnQuDQoNCkNoYW5nZXMgaW4gdjIgYXJlIGxpc3RlZCBhZnRlciB0
aGUgLS0tIGxpbmUgaW4gdGhlIHBhdGNoIGZpbGUuDQoNCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fDQq3orz+yMs6IFRha2FzaGkgSXdhaSA8dGl3YWlAc3VzZS5kZT4NCreiy83Ksbzk
OiAyMDI2xOo51MIxNcjVIDA6MDQNCsrVvP7IyzogwfUgtrAgPGxpdWRvbmd4anR1QG91dGxvb2su
Y29tPg0Ks63LzTogbGludXgtc291bmRAdmdlci5rZXJuZWwub3JnIDxsaW51eC1zb3VuZEB2Z2Vy
Lmtlcm5lbC5vcmc+OyB0aXdhaUBzdXNlLmRlIDx0aXdhaUBzdXNlLmRlPjsgcGVyZXhAcGVyZXgu
Y3ogPHBlcmV4QHBlcmV4LmN6Pg0K1vfM4jogUmU6IEFMU0E6IGhkYS9jb25leGFudDogRml4IHNp
bGVudCBzcGVha2VyIG9uIEh1YXdlaSBNYXRlQm9vayAxNCAoU042MTQwKQ0KDQpPbiBTYXQsIDEy
IFNlcCAyMDI2IDE2OjAzOjU1ICswMjAwLA0KwfUgtrAgd3JvdGU6DQo+DQo+DQo+IFNpci9NYWRh
bSwNCj4NCj4gT24gdGhlIEh1YXdlaSBNYXRlQm9vayAxNCAoUENJIFNTSUQgMTllNTozMjllKSwg
dGhlIFNONjE0MCBjb2RlYw0KPiBzaWxlbnRseSByb3V0ZXMgdGhlIHNwZWFrZXIgb3V0cHV0IHRo
cm91Z2ggdGhlIGhlYWRwaG9uZSBwaW4ncw0KPiBjb25uZWN0aW9uIHNlbGVjdDogd2hhdGV2ZXIg
REFDIHRoZSBoZWFkcGhvbmUgcGluIDB4MTYgaXMgY29ubmVjdGVkIHRvLA0KPiB0aGUgc3BlYWtl
ciBwaW4gMHgxNyBmb2xsb3dzLiBUaGUgZ2VuZXJpYyBwYXJzZXIgYXR0YWNoZXMgdGhlIHBsYXli
YWNrDQo+IHN0cmVhbSB0byBEQUMgMHgxMCAoc2hhcmVkIGJ5IHRoZSBoZWFkcGhvbmUgcGF0aCkg
YW5kIG11dGVzIHRoYXQgREFDDQo+IHdoZW4gbm8gaGVhZHBob25lIGlzIHBsdWdnZWQsIHNpbGVu
Y2luZyB0aGUgaW50ZXJuYWwgc3BlYWtlciB3aGlsZSB0aGUNCj4gaGVhZHBob25lIGphY2sga2Vl
cHMgd29ya2luZy4NCj4NCj4gQWRkIGEgcXVpcmsgZm9yIHRoaXMgbWFjaGluZSB0aGF0IHN1cHBy
ZXNzZXMgdGhlIGF1dG8tbXV0ZSwgYmluZHMgdGhlDQo+IHNwZWFrZXIgcGluIHRvIHRoZSBzaGFy
ZWQgREFDIDB4MTAsIHJlbW92ZXMgdGhlIG11dGUgc3dpdGNoIG9uIHRoYXQgREFDDQo+IHNvIHVz
ZXJzcGFjZSBjYW5ub3QgbXV0ZSBpdCwgYW5kIHJlLWFwcGxpZXMgdGhlIHJvdXRpbmcgYWZ0ZXIg
ZXZlcnkNCj4gb3V0cHV0IHVwZGF0ZTsgYXQgaW5pdCBpdCByb3V0ZXMgYm90aCBwaW5zIHRvIERB
QyAweDEwLCBlbmFibGVzIHRoZQ0KPiBzcGVha2VyIEVBUEQgKHdoaWNoIHRoZSBkcml2ZXIgb3Ro
ZXJ3aXNlIGxlYXZlcyBvZmYpIGFuZCB1bm11dGVzIHRoZQ0KPiBEQUMuDQo+DQo+IE5vdGUgdGhh
dCB0aGlzIGlzIGEgZGlmZmVyZW50IHByb2JsZW0gdGhhbiB0aGUgZXhpc3RpbmcgSHVhd2VpDQo+
IE1hdGVib29rIHF1aXJrIGZvciBTU0lEIDE5ZTU6MzI4OSAoY29tbWl0IGQxNTJhZmQxY2Q3YSks
IHdoaWNoIGZpeGVzIGENCj4gbWlzc2luZyBoZWFkcGhvbmUgamFjazsgdGhhdCBtYWNoaW5lIGhh
cyB3b3JraW5nIHNwZWFrZXJzLg0KPg0KPiBUZXN0ZWQgb24gVWJ1bnR1IDI2LjA0IChrZXJuZWxz
IDcuMC4wLTMwIGFuZCA3LjAuMC0zMSk6IHRoZSBzcGVha2VyDQo+IHBsYXlzIGF0IGJvb3Qgd2l0
aG91dCBhbnkgdXNlcnNwYWNlIGhlbHBlciwgYW5kIGtlZXBzIHdvcmtpbmcgYWNyb3NzDQo+IHN1
c3BlbmQvcmVzdW1lLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBsaXVkb25neGp0dSA8bGl1ZG9uZ3hq
dHVAb3V0bG9vay5jb20+DQoNClRoZSBwYXRjaCBjYW4ndCBiZSBhcHBsaWVkIGJlY2F1c2UgeW91
ciBtYWlsZXIgYnJva2UgdGhlIHNwYWNlcy4NCg0KUGxlYXNlIHRyeSB0byByZXN1Ym1pdCB3aXRo
IGEgZml4ZWQgbWFpbGVyIHNldHVwOyBhdCBiZXN0IHVzZQ0KZ2l0LXNlbmQtZW1haWwuDQoNCkFi
b3V0IHRoZSBwYXRjaDogcGxlYXNlIGRyb3AgdGhlIGhlYWRpbmcgIlNpci9NYWRhbSIuICBUaGUg
cGF0Y2gNCmRlc2NyaXB0aW9uIHdpbGwgYmUgdGFrZW4gYXMgdGhlIGNvbW1pdCBsb2cgYXMgaXMs
IHNvIHN1Y2ggYSBncmVldGluZw0KZG9lc24ndCBmaXQgYXQgYWxsLg0KDQpBbHNvLCBzcGVsbGlu
ZyB5b3VyIG5hbWUgaW4gYSBiaXQgbW9yZSBXZXN0ZXJuIHN0eWxlICh1c2luZw0KY2FwaXRhbC9s
b3dlciBsZXR0ZXJzIGFuZCBwdXR0aW5nIGEgc3BhY2UgYmV0d2VlbiBmaXJzdCBuYW1lIGFuZCBs
YXN0DQpuYW1lKSB3b3VsZCBiZSBiZXR0ZXIuDQoNCg0KdGhhbmtzLA0KDQpUYWthc2hpDQo=

--_000_ME3PR01MB75042406F30EE48AB6DA3595BD862ME3PR01MB7504ausp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Resubmitting as v2 with the patch attached, since the web mailer</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
mangles whitespace in inline text. &nbsp;Please apply from the attachment.<=
/div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Changes in v2 are listed after the --- line in the patch file.</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg">
<div style=3D"direction: ltr; font-family: Calibri, sans-serif; font-size: =
11pt; color: rgb(0, 0, 0);">
<b>=B7=A2=BC=FE=C8=CB:</b> Takashi Iwai &lt;tiwai@suse.de&gt;<br>
<b>=B7=A2=CB=CD=CA=B1=BC=E4:</b> 2026=C4=EA9=D4=C215=C8=D5 0:04<br>
<b>=CA=D5=BC=FE=C8=CB:</b> =C1=F5 =B6=B0 &lt;liudongxjtu@outlook.com&gt;<br=
>
<b>=B3=AD=CB=CD:</b> linux-sound@vger.kernel.org &lt;linux-sound@vger.kerne=
l.org&gt;; tiwai@suse.de &lt;tiwai@suse.de&gt;; perex@perex.cz &lt;perex@pe=
rex.cz&gt;<br>
<b>=D6=F7=CC=E2:</b> Re: ALSA: hda/conexant: Fix silent speaker on Huawei M=
ateBook 14 (SN6140)</div>
<div style=3D"direction: ltr;">&nbsp;</div>
</div>
<div style=3D"font-size: 11pt;">On Sat, 12 Sep 2026 16:03:55 +0200,<br>
=C1=F5 =B6=B0 wrote:<br>
&gt;<br>
&gt;<br>
&gt; Sir/Madam,<br>
&gt;<br>
&gt; On the Huawei MateBook 14 (PCI SSID 19e5:329e), the SN6140 codec<br>
&gt; silently routes the speaker output through the headphone pin's<br>
&gt; connection select: whatever DAC the headphone pin 0x16 is connected to=
,<br>
&gt; the speaker pin 0x17 follows. The generic parser attaches the playback=
<br>
&gt; stream to DAC 0x10 (shared by the headphone path) and mutes that DAC<b=
r>
&gt; when no headphone is plugged, silencing the internal speaker while the=
<br>
&gt; headphone jack keeps working.<br>
&gt;<br>
&gt; Add a quirk for this machine that suppresses the auto-mute, binds the<=
br>
&gt; speaker pin to the shared DAC 0x10, removes the mute switch on that DA=
C<br>
&gt; so userspace cannot mute it, and re-applies the routing after every<br=
>
&gt; output update; at init it routes both pins to DAC 0x10, enables the<br=
>
&gt; speaker EAPD (which the driver otherwise leaves off) and unmutes the<b=
r>
&gt; DAC.<br>
&gt;<br>
&gt; Note that this is a different problem than the existing Huawei<br>
&gt; Matebook quirk for SSID 19e5:3289 (commit d152afd1cd7a), which fixes a=
<br>
&gt; missing headphone jack; that machine has working speakers.<br>
&gt;<br>
&gt; Tested on Ubuntu 26.04 (kernels 7.0.0-30 and 7.0.0-31): the speaker<br=
>
&gt; plays at boot without any userspace helper, and keeps working across<b=
r>
&gt; suspend/resume.<br>
&gt;<br>
&gt; Signed-off-by: liudongxjtu &lt;liudongxjtu@outlook.com&gt;<br>
<br>
The patch can't be applied because your mailer broke the spaces.<br>
<br>
Please try to resubmit with a fixed mailer setup; at best use<br>
git-send-email.<br>
<br>
About the patch: please drop the heading &quot;Sir/Madam&quot;.&nbsp; The p=
atch<br>
description will be taken as the commit log as is, so such a greeting<br>
doesn't fit at all.<br>
<br>
Also, spelling your name in a bit more Western style (using<br>
capital/lower letters and putting a space between first name and last<br>
name) would be better.<br>
<br>
<br>
thanks,<br>
<br>
Takashi</div>
</body>
</html>

--_000_ME3PR01MB75042406F30EE48AB6DA3595BD862ME3PR01MB7504ausp_--

--_004_ME3PR01MB75042406F30EE48AB6DA3595BD862ME3PR01MB7504ausp_
Content-Type: text/x-patch;
	name="0001-ALSA-hda-conexant-Fix-silent-speaker-on-Huawei-MateB.patch"
Content-Description:
 0001-ALSA-hda-conexant-Fix-silent-speaker-on-Huawei-MateB.patch
Content-Disposition: attachment;
	filename="0001-ALSA-hda-conexant-Fix-silent-speaker-on-Huawei-MateB.patch";
	size=5746; creation-date="Sat, 19 Sep 2026 13:46:01 GMT";
	modification-date="Sat, 19 Sep 2026 13:46:26 GMT"
Content-Transfer-Encoding: base64

RnJvbSA4YzkyNDE0MjIxMjg3ZmZkODRiNjMwYzA3ZTU2MGFjZGU5ZjM0MGVhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBMaXUgRWFzb24gPGxpdWRvbmd4anR1QG91dGxvb2suY29tPgpE
YXRlOiBTYXQsIDE5IFNlcCAyMDI2IDIxOjA4OjEzICswODAwClN1YmplY3Q6IFtQQVRDSCB2Ml0g
QUxTQTogaGRhL2NvbmV4YW50OiBGaXggc2lsZW50IHNwZWFrZXIgb24gSHVhd2VpIE1hdGVCb29r
CiAxNCAoU042MTQwKQoKT24gdGhlIEh1YXdlaSBNYXRlQm9vayAxNCAoUENJIFNTSUQgMTllNToz
MjllKSwgdGhlIFNONjE0MCBjb2RlYwpzaWxlbnRseSByb3V0ZXMgdGhlIHNwZWFrZXIgb3V0cHV0
IHRocm91Z2ggdGhlIGhlYWRwaG9uZSBwaW4ncwpjb25uZWN0aW9uIHNlbGVjdDogd2hhdGV2ZXIg
REFDIHRoZSBoZWFkcGhvbmUgcGluIDB4MTYgaXMgY29ubmVjdGVkIHRvLAp0aGUgc3BlYWtlciBw
aW4gMHgxNyBmb2xsb3dzLiAgVGhlIGdlbmVyaWMgcGFyc2VyIGF0dGFjaGVzIHRoZSBwbGF5YmFj
awpzdHJlYW0gdG8gREFDIDB4MTAgKHNoYXJlZCBieSB0aGUgaGVhZHBob25lIHBhdGgpIGFuZCBt
dXRlcyB0aGF0IERBQwp3aGVuIG5vIGhlYWRwaG9uZSBpcyBwbHVnZ2VkLCBzaWxlbmNpbmcgdGhl
IGludGVybmFsIHNwZWFrZXIgd2hpbGUgdGhlCmhlYWRwaG9uZSBqYWNrIGtlZXBzIHdvcmtpbmcu
CgpBZGQgYSBxdWlyayBmb3IgdGhpcyBtYWNoaW5lIHRoYXQgc3VwcHJlc3NlcyB0aGUgYXV0by1t
dXRlLCBiaW5kcyB0aGUKc3BlYWtlciBwaW4gdG8gdGhlIHNoYXJlZCBEQUMgMHgxMCwgcmVtb3Zl
cyB0aGUgbXV0ZSBzd2l0Y2ggb24gdGhhdCBEQUMKc28gdXNlcnNwYWNlIGNhbm5vdCBtdXRlIGl0
LCBhbmQgcmUtYXBwbGllcyB0aGUgcm91dGluZyBhZnRlciBldmVyeQpvdXRwdXQgdXBkYXRlOyBh
dCBpbml0IGl0IHJvdXRlcyBib3RoIHBpbnMgdG8gREFDIDB4MTAsIGVuYWJsZXMgdGhlCnNwZWFr
ZXIgRUFQRCAod2hpY2ggdGhlIGRyaXZlciBvdGhlcndpc2UgbGVhdmVzIG9mZikgYW5kIHVubXV0
ZXMgdGhlCkRBQy4KCk5vdGUgdGhhdCB0aGlzIGlzIGEgZGlmZmVyZW50IHByb2JsZW0gdGhhbiB0
aGUgZXhpc3RpbmcgSHVhd2VpCk1hdGVib29rIHF1aXJrIGZvciBTU0lEIDE5ZTU6MzI4OSAoY29t
bWl0IGQxNTJhZmQxY2Q3YSksIHdoaWNoIGZpeGVzIGEKbWlzc2luZyBoZWFkcGhvbmUgamFjazsg
dGhhdCBtYWNoaW5lIGhhcyB3b3JraW5nIHNwZWFrZXJzLgoKVGVzdGVkIG9uIFVidW50dSAyNi4w
NCAoa2VybmVscyA3LjAuMC0zMCBhbmQgNy4wLjAtMzEpOiB0aGUgc3BlYWtlcgpwbGF5cyBhdCBi
b290IHdpdGhvdXQgYW55IHVzZXJzcGFjZSBoZWxwZXIsIGFuZCBrZWVwcyB3b3JraW5nIGFjcm9z
cwpzdXNwZW5kL3Jlc3VtZS4KClNpZ25lZC1vZmYtYnk6IExpdSBFYXNvbiA8bGl1ZG9uZ3hqdHVA
b3V0bG9vay5jb20+Ci0tLQpDaGFuZ2VzIGluIHYyOgotIE1vdmUgdGhlIGFtcC1jYXBzIG92ZXJy
aWRlIHRvIEhEQV9GSVhVUF9BQ1RfUFJPQkU6IGF0IHByZS1wcm9iZSB0aW1lCiAgdGhlIGNvZGVj
IHJlZ21hcCBpcyBub3QgYXZhaWxhYmxlIHlldCwgc28gdGhlIG11dGUtc3dpdGNoIHJlbW92YWwg
d2FzCiAgYSBzaWxlbnQgbm8tb3AgdGhlcmUKLSBSZS1hcHBseSB0aGUgcGluIHJvdXRpbmcgYWZ0
ZXIgZXZlcnkgb3V0cHV0IHVwZGF0ZSB2aWEgdGhlIGF1dG8tbXV0ZQogIGhvb2sKLSBVbm11dGUg
dGhlIHNoYXJlZCBEQUMgYXQgLTMwZEIgaW5zdGVhZCBvZiAwZEIgc28gdGhhdCB0aGUgdm1hc3Rl
cgogIHZvbHVtZSBrZWVwcyBhIHVzYWJsZSByYW5nZSB1bnRpbCB1c2Vyc3BhY2UgdGFrZXMgb3Zl
cgotIFVwZGF0ZSB0aGUgdGVzdGVkIG5vdGVzIHdpdGggc3VzcGVuZC9yZXN1bWUgYW5kIHRoZSBr
ZXJuZWwgdXBkYXRlCiAgZnJvbSA3LjAuMC0zMCB0byA3LjAuMC0zMQoKIHNvdW5kL2hkYS9jb2Rl
Y3MvY29uZXhhbnQuYyB8IDY3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysK
IDEgZmlsZSBjaGFuZ2VkLCA2NyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvc291bmQvaGRh
L2NvZGVjcy9jb25leGFudC5jIGIvc291bmQvaGRhL2NvZGVjcy9jb25leGFudC5jCmluZGV4IDcz
NTdkYzkuLjVkYTUwNzcgMTAwNjQ0Ci0tLSBhL3NvdW5kL2hkYS9jb2RlY3MvY29uZXhhbnQuYwor
KysgYi9zb3VuZC9oZGEvY29kZWNzL2NvbmV4YW50LmMKQEAgLTI5Myw2ICsyOTMsNyBAQCBlbnVt
IHsKIAlDWFRfRklYVVBfSFBfQV9VLAogCUNYVF9GSVhVUF9BQ0VSX1NXSUZUX0hQLAogCUNYVF9G
SVhVUF9IVUFXRUlfTUFURUJPT0tfSFAsCisJQ1hUX0ZJWFVQX01BVEVCT09LMTRfU042MTQwLAog
fTsKIAogLyogZm9yIGhkYV9maXh1cF90aGlua3BhZF9hY3BpKCkgKi8KQEAgLTc5OCw2ICs3OTks
NjcgQEAgc3RhdGljIHZvaWQgY3h0X2ZpeHVwX2hwX2FfdShzdHJ1Y3QgaGRhX2NvZGVjICpjb2Rl
YywKIAkJY3h0X3NldHVwX2dwaW9fdW5tdXRlKGNvZGVjLCAweDIpOwogfQogCisvKiBIdWF3ZWkg
TWF0ZUJvb2sgMTQgKFNONjE0MCk6IHRoZSBzcGVha2VyIG91dHB1dCBmb2xsb3dzIHRoZSBoZWFk
cGhvbmUKKyAqIHBpbidzIGNvbm5lY3Rpb24gc2VsZWN0IGluIGhhcmR3YXJlLiAgQm90aCBwaW5z
IG11c3QgYmUgcm91dGVkIHRvIHRoZQorICogc2hhcmVkIERBQyAweDEwLCB3aGljaCBjYXJyaWVz
IHRoZSBwbGF5YmFjayBzdHJlYW07IHRoZSBnZW5lcmljCisgKiBwYXJzZXIgbXV0ZXMgdGhhdCBE
QUMgd2hlbiBubyBoZWFkcGhvbmUgaXMgcGx1Z2dlZCwgc2lsZW5jaW5nIHRoZQorICogc3BlYWtl
ci4gIFN1cHByZXNzIHRoZSBhdXRvLW11dGUsIGJpbmQgdGhlIHNwZWFrZXIgcGluIHRvIHRoZSBz
aGFyZWQKKyAqIERBQywgcmVtb3ZlIGl0cyBtdXRlIHN3aXRjaCBhbmQga2VlcCBpdCB1bm11dGVk
OyB0aGUgYXV0by1tdXRlIGhvb2sKKyAqIHJlLWFwcGxpZXMgdGhlIHJvdXRpbmcgYWZ0ZXIgZXZl
cnkgb3V0cHV0IHVwZGF0ZS4KKyAqLworc3RhdGljIHZvaWQgY3h0X21iMTRfcm91dGVfdW5tdXRl
KHN0cnVjdCBoZGFfY29kZWMgKmNvZGVjKQoreworCS8qIHJvdXRlIGJvdGggcGlucyB0byB0aGUg
c2hhcmVkIERBQyAweDEwLCBlbmFibGUgdGhlIHNwZWFrZXIKKwkgKiBFQVBEIGFuZCB1bm11dGUg
dGhlIERBQyBhdCBhIG1vZGVyYXRlIGdhaW47IHRoZSB2bWFzdGVyCisJICogdm9sdW1lIHRha2Vz
IG92ZXIgb25jZSB1c2Vyc3BhY2Ugc3RhcnRzCisJICovCisJc25kX2hkYV9jb2RlY193cml0ZShj
b2RlYywgMHgxNiwgMCwgQUNfVkVSQl9TRVRfQ09OTkVDVF9TRUwsIDApOworCXNuZF9oZGFfY29k
ZWNfd3JpdGUoY29kZWMsIDB4MTcsIDAsIEFDX1ZFUkJfU0VUX0NPTk5FQ1RfU0VMLCAwKTsKKwlz
bmRfaGRhX2NvZGVjX3dyaXRlKGNvZGVjLCAweDE3LCAwLCBBQ19WRVJCX1NFVF9FQVBEX0JUTEVO
QUJMRSwgMHgwMik7CisJc25kX2hkYV9jb2RlY19hbXBfc3RlcmVvKGNvZGVjLCAweDEwLCBIREFf
T1VUUFVULCAwLAorCQkJCSBIREFfQU1QX1ZPTE1BU0sgfCBIREFfQU1QX01VVEUsIDB4NDApOwor
fQorCitzdGF0aWMgdm9pZCBjeHRfbWIxNF9hdXRvbXV0ZShzdHJ1Y3QgaGRhX2NvZGVjICpjb2Rl
YykKK3sKKwlzbmRfaGRhX2dlbl91cGRhdGVfb3V0cHV0cyhjb2RlYyk7CisJY3h0X21iMTRfcm91
dGVfdW5tdXRlKGNvZGVjKTsKK30KKworc3RhdGljIHZvaWQgY3h0X2ZpeHVwX21hdGVib29rMTRf
c242MTQwKHN0cnVjdCBoZGFfY29kZWMgKmNvZGVjLAorCQkJCQljb25zdCBzdHJ1Y3QgaGRhX2Zp
eHVwICpmaXgsIGludCBhY3Rpb24pCit7CisJc3RydWN0IGNvbmV4YW50X3NwZWMgKnNwZWMgPSBj
b2RlYy0+c3BlYzsKKworCWlmIChhY3Rpb24gPT0gSERBX0ZJWFVQX0FDVF9QUkVfUFJPQkUpIHsK
KwkJc3RhdGljIGNvbnN0IGhkYV9uaWRfdCBkYWNfMHgxMFtdID0geyAweDEwIH07CisKKwkJc3Bl
Yy0+Z2VuLnN1cHByZXNzX2F1dG9fbXV0ZSA9IDE7CisJCXNwZWMtPmdlbi5hdXRvbXV0ZV9ob29r
ID0gY3h0X21iMTRfYXV0b211dGU7CisJCS8qIEJpbmQgdGhlIHNwZWFrZXIgcGluIHRvIHRoZSBz
aGFyZWQgREFDIDB4MTAuCisJCSAqLworCQlzbmRfaGRhX292ZXJyaWRlX2Nvbm5fbGlzdChjb2Rl
YywgMHgxNywgMSwgZGFjXzB4MTApOworCQlyZXR1cm47CisJfQorCWlmIChhY3Rpb24gPT0gSERB
X0ZJWFVQX0FDVF9QUk9CRSkgeworCQl1bnNpZ25lZCBpbnQgY2FwczsKKworCQkvKiBSZW1vdmUg
dGhlIG11dGUgc3dpdGNoIG9uIHRoZSBzaGFyZWQgREFDIHNvIHRoYXQKKwkJICogdXNlcnNwYWNl
IChXaXJlUGx1bWJlcikgY2Fubm90IG11dGUgaXQgd2hlbiB0aGUKKwkJICogaGVhZHBob25lIHJv
dXRlIGJlY29tZXMgdW5hdmFpbGFibGUgKGUuZy4gYWZ0ZXIKKwkJICogcmVzdW1lKS4gIE11c3Qg
YmUgZG9uZSBoZXJlOiB0aGUgY29kZWMgcmVnbWFwIGlzIG5vdAorCQkgKiBhdmFpbGFibGUgYXQg
cHJlLXByb2JlIHRpbWUuCisJCSAqLworCQljYXBzID0gcXVlcnlfYW1wX2NhcHMoY29kZWMsIDB4
MTAsIEhEQV9PVVRQVVQpOworCQlzbmRfaGRhX292ZXJyaWRlX2FtcF9jYXBzKGNvZGVjLCAweDEw
LCBIREFfT1VUUFVULAorCQkJCQkgIGNhcHMgJiB+QUNfQU1QQ0FQX01VVEUpOworCQlyZXR1cm47
CisJfQorCWlmIChhY3Rpb24gIT0gSERBX0ZJWFVQX0FDVF9JTklUKQorCQlyZXR1cm47CisJY3h0
X21iMTRfcm91dGVfdW5tdXRlKGNvZGVjKTsKK30KKwogLyogVGhpbmtQYWQgWDIwMCAmIGNvIHdp
dGggY3h0NTA1MSAqLwogc3RhdGljIGNvbnN0IHN0cnVjdCBoZGFfcGludGJsIGN4dF9waW5jZmdf
bGVub3ZvX3gyMDBbXSA9IHsKIAl7IDB4MTYsIDB4MDQyMTQwZmYgfSwgLyogSFAgKHNlcSMgb3Zl
cnJpZGRlbikgKi8KQEAgLTEwNDMsNiArMTEwNSwxMCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGhk
YV9maXh1cCBjeHRfZml4dXBzW10gPSB7CiAJCQl7IH0KIAkJfSwKIAl9LAorCVtDWFRfRklYVVBf
TUFURUJPT0sxNF9TTjYxNDBdID0geworCQkudHlwZSA9IEhEQV9GSVhVUF9GVU5DLAorCQkudi5m
dW5jID0gY3h0X2ZpeHVwX21hdGVib29rMTRfc242MTQwLAorCX0sCiB9OwogCiBzdGF0aWMgY29u
c3Qgc3RydWN0IGhkYV9xdWlyayBjeHQ1MDQ1X2ZpeHVwc1tdID0gewpAQCAtMTE0NSw2ICsxMjEx
LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBoZGFfcXVpcmsgY3h0NTA2Nl9maXh1cHNbXSA9IHsK
IAlTTkRfUENJX1FVSVJLKDB4MTdhYSwgMHgzOTdiLCAiTGVub3ZvIFMyMDUiLCBDWFRfRklYVVBf
U1RFUkVPX0RNSUMpLAogCVNORF9QQ0lfUVVJUktfVkVORE9SKDB4MTdhYSwgIlRoaW5rcGFkL0lk
ZWFwYWQiLCBDWFRfRklYVVBfTEVOT1ZPX1hQQURfQUNQSSksCiAJU05EX1BDSV9RVUlSSygweDE5
ZTUsIDB4MzI4OSwgIkh1YXdlaSBNYXRlYm9vayIsIENYVF9GSVhVUF9IVUFXRUlfTUFURUJPT0tf
SFApLAorCVNORF9QQ0lfUVVJUksoMHgxOWU1LCAweDMyOWUsICJIdWF3ZWkgTWF0ZUJvb2sgMTQi
LCBDWFRfRklYVVBfTUFURUJPT0sxNF9TTjYxNDApLAogCVNORF9QQ0lfUVVJUksoMHgxYzA2LCAw
eDIwMTEsICJMZW1vdGUgQTEwMDQiLCBDWFRfUElOQ0ZHX0xFTU9URV9BMTAwNCksCiAJU05EX1BD
SV9RVUlSSygweDFjMDYsIDB4MjAxMiwgIkxlbW90ZSBBMTIwNSIsIENYVF9QSU5DRkdfTEVNT1RF
X0ExMjA1KSwKIAlTTkRfUENJX1FVSVJLKDB4MWQwNSwgMHgzMDEyLCAiTUVDSFJFVk8gV3VqaWUg
MTVYIFBybyIsIENYVF9GSVhVUF9IRUFEU0VUX01JQyksCi0tIAoyLjUzLjAKCg==

--_004_ME3PR01MB75042406F30EE48AB6DA3595BD862ME3PR01MB7504ausp_--
