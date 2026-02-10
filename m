Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012052.outbound.protection.outlook.com [40.107.209.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2829D2E8DFC;
	Tue, 10 Feb 2026 11:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770721701; cv=fail; b=PU4hwQkqMLgN/UV70uT8ChGyAorlzMbZ+7iuSElhxZBLalvqGheangD/y7pQyDV9s7KPez8m7IpQMDw6dF/2Jk5fDWeqsKodPJ/ZaToqGiJY3jfLRHlRcBrjlJwFAv1EHbxWWynlOF8pXqgICNnf36hNjnyKS0UQf0LkHrdQil8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770721701; c=relaxed/simple;
	bh=58bWWQ1eZEKKkRug30nGd5Ek2NULUoCZEFro/QDcMGU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pPr/YZvsDUBSeg9gBMFt//bA33tvrNb2iOndLYdyUZrt1wBwMnJlS9rDim7algZmpNxuziwRFs2DF79jv0s0NM9aYilg95KAZIdVlsEMX2LM4y2x5Oyvw6qjwsmbrpxCKUZIXyf8cfIc5JltC44lrgHB+Aeuy1JnuwKzQZrVEYQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=KrRDJIKU; arc=fail smtp.client-ip=40.107.209.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="KrRDJIKU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zUKt84kzQ2tl9YYzmAC6qh5sPp1njJEaGrT2l8wUvqXNICMaq2kzq/SoSS2EISk7JP4GcuaQSd366+TKUEaw5xtA8IY5s/snvfEuDeBOFZA+MZXihlgiDW6NUN7myV5i7jBhy4LgA3E908E6Tbx6rIpt3W+vvGLZoBpirelNcTemFF3y9uAftePP6FKn7OX0p/B/EkqphNeU0ibQnaoSFHJ2LrOnoHHWzsZzsvjRSY8rEvjsQH6FuHUhHYvCRyLsw9US8dkf7iY/+yi00fU7XhR6TLsQ7xk+jXdobK8xVnSjgb5/eoGvahTV61yLbCAkpmQmoUBfrEclbp+vqf+S+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=58bWWQ1eZEKKkRug30nGd5Ek2NULUoCZEFro/QDcMGU=;
 b=jnyf9jGLMaCRrpfbv2o8jXmxEuM929WxxAU4aejPeD0ch3Lcmp8hIhO78RMSs9Eaxc4/VanszZX6YoPEpiJXzSiYSDE/GvXLM8xkI1wbOPBQ1U2KNY8tB6pdEJtzksyPoeepuNe1tgEiaQA7mTRb8Z02i7RzsBJuSfMiiI3eWqJQE4KrPLQO39LqKG5CGk67XBIfz7hhBV4FE4cg7dioBIEj3RwOCi/LmKBbvPEwP7wPq5pXOrOiA/Ct3e+C2lH0jmfoulrnYIXKskXD9cycb8xEVj13rf5rdakLTVdOt/KI4ZVRsj2DvCj1JTnz8ZZoN2bjx4E1lozu8MkW0F8ufQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=linux.dev smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=58bWWQ1eZEKKkRug30nGd5Ek2NULUoCZEFro/QDcMGU=;
 b=KrRDJIKUjGtTCE054j1GOL9TvK/7IOWs9awTHStznmcMT72GIWJME2klTD7cfoOR7jYj/SNePRjRfjQgFnpN1bQmDKsAeAjKYbC40epKT1G4Me51HiITav5rR9pKc9iCCDQXEve2WGcxW8rgAqCB0oxBT0XG6Lq5KUtFdtu7D1U=
Received: from DS7PR05CA0042.namprd05.prod.outlook.com (2603:10b6:8:2f::29) by
 IA3PR10MB8733.namprd10.prod.outlook.com (2603:10b6:208:574::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.17; Tue, 10 Feb
 2026 11:08:17 +0000
Received: from DS2PEPF00003446.namprd04.prod.outlook.com
 (2603:10b6:8:2f:cafe::df) by DS7PR05CA0042.outlook.office365.com
 (2603:10b6:8:2f::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.6 via Frontend
 Transport; Tue, 10 Feb 2026 11:08:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS2PEPF00003446.mail.protection.outlook.com (10.167.17.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Tue, 10 Feb 2026 11:08:17 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Feb
 2026 05:08:16 -0600
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Feb
 2026 05:08:16 -0600
Received: from DLEE204.ent.ti.com ([fe80::81dc:e6c6:4c37:9bc6]) by
 DLEE204.ent.ti.com ([fe80::81dc:e6c6:4c37:9bc6%14]) with mapi id
 15.02.2562.020; Tue, 10 Feb 2026 05:08:16 -0600
From: "Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>
CC: "broonie@kernel.org" <broonie@kernel.org>, "ckeepax@opensource.cirrus.com"
	<ckeepax@opensource.cirrus.com>, "shumingf@realtek.com"
	<shumingf@realtek.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"ranjani.sridharan@linux.intel.com" <ranjani.sridharan@linux.intel.com>,
	"cezary.rojewski@intel.com" <cezary.rojewski@intel.com>,
	"peter.ujfalusi@linux.intel.com" <peter.ujfalusi@linux.intel.com>,
	"kai.vehmanen@linux.intel.com" <kai.vehmanen@linux.intel.com>,
	"vkoul@kernel.org" <vkoul@kernel.org>, "Ding, Shenghao"
	<shenghao-ding@ti.com>, "Xu, Baojun" <baojun.xu@ti.com>, "Kasargod, Sandeep"
	<sandeepk@ti.com>, Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: Re: [PATCH v1 RESEND] SoundWire: Allow Prepare command for
 Simplified_CP_SM
Thread-Topic: [PATCH v1 RESEND] SoundWire: Allow Prepare command for
 Simplified_CP_SM
Thread-Index: AQHcmn2OcKW+aGX7D0KL+1y6lTO6NA==
Date: Tue, 10 Feb 2026 11:08:16 +0000
Message-ID: <87773927e37c4d70862c5f047431c7b0@ti.com>
References: <20260209070905.10749-1-niranjan.hy@ti.com>
 <97872c17-73c9-4484-9f8e-373ed9a59a25@linux.dev>
In-Reply-To: <97872c17-73c9-4484-9f8e-373ed9a59a25@linux.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-c2processedorg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003446:EE_|IA3PR10MB8733:EE_
X-MS-Office365-Filtering-Correlation-Id: 6786c034-2865-4dcb-3162-08de6894b162
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|7416014|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bld1SjBibDZFUW5vMzRlMmUyL2ROMWhXYitQakwwNTl0ZkV4RmZrcENSOGti?=
 =?utf-8?B?dWNNMEJrcWNWRzlHU3RKME5KTzdLb1dMK280ak5QcWhuOHFWdHh5SXRpbVY0?=
 =?utf-8?B?WDg3amJCS3JXRldpbEZOaXYreGJMUE9hdlgwb1R5WFVwaHN5bVprK1NrNHg3?=
 =?utf-8?B?WTBQSk55Z2hxWlFVZlV6UStCTy9zRmNHaEhXeHcveDhkU2VoZURmZ2FabU1m?=
 =?utf-8?B?eUd6N1ZSdXBQQnhJdWM3WVZQb3JvZ3dRSVlTOXgrQTJVN1B0cUgzSHJqZjUr?=
 =?utf-8?B?WHp6TnM2ejRUcWcyd1BYTGs2TzdTbDdoUUkzTTRvbUZwOUQ3RHc3ZG1TQWZr?=
 =?utf-8?B?QVhMTGVqcmRCV0ptSjZDSVBDa3dDSmxEUFpSczJOM3h3R0h4WVVnb0tRM2pT?=
 =?utf-8?B?WlBONWFOVEZ4bWhodEc3NTJhTGc4TmVGN0paRE43UmR5ZlJCT010SnRNdnV4?=
 =?utf-8?B?enRacThXdjJ2VVVGc2YzRHNkSkZZYS9uNVQwZ1k3cmNWMEpwc3dDNUNrY2Rs?=
 =?utf-8?B?NXBHRlRSRU8rUXBzamtlajg1QW95dVdiQjVOdjhNN3N0Q3Y3eWtXcERDOVl0?=
 =?utf-8?B?STF0a1daNVdUWVorT0QzOHdXSFZUZVc4OTd3ZThYbFVPZXFkbW9ZK3VCcERu?=
 =?utf-8?B?VVRnY0l6RGpSakh5dFRuVmdWSHNHR1BwZzNhUjRqcXlrblloSDdSeFRoaHQx?=
 =?utf-8?B?K3VNSXVFZWlEOEJ3YVNpUDFPM2YzZWV0ZFRUNWRQSHBUVWdiSndZdGVzbWRR?=
 =?utf-8?B?UVpwaTZJUlRqOWl4WVYybitYemYvbnUxeitxT29MaEpGaEVLSGdSbDFSTEdR?=
 =?utf-8?B?Y2xxKy92WVk0RWNQTzFTeTBlcHBJVFFldngvQ2pxTnFGb2s4THBIV3oxMENF?=
 =?utf-8?B?eDJpY2Urakc5VmUwUDc1TWJyZ1BUNXhqMXBqc2E2V0tMTVBDRmJ5RUJ4aFZD?=
 =?utf-8?B?Mk5rNWY0azBiTGpDeERHVXM2YThaZ3hIako0NEI2Wk1VaVNJTnBCMnlFdng3?=
 =?utf-8?B?a2FtdzdoY1RXS2dhb3FuTFJrNWdtMjh6VXk3Mm1sRmFEUXVmUS94a0krd25W?=
 =?utf-8?B?eGdXcUxFSlhTdVc2d05oVzRHNmlpNFlROUZlZ3FBNjBIalJmYjNkdGc5UXBQ?=
 =?utf-8?B?NllvL2RLT3JDVkNNT2pXTDVGbmVxT2Vsd2J0NXBUcXZFSVRFczJ5RW12NG40?=
 =?utf-8?B?by9EVHoxMUNjVXIxOUtIakVLejJ3WjVDajB1WDRWUXdGRmluS3F2Zkd4dXly?=
 =?utf-8?B?U2RTbXp6djA0YThaaVVUMHIvREZacGowbW1DQkRCYkhpZC8zc0ZQSFpVN3dp?=
 =?utf-8?B?c01JMXpDb05ENnZOdG1BZlNpNjFDUldZTWE3MFBzTGFqcEM5L1EydlRodUxT?=
 =?utf-8?B?allUUWZtRlpLQmg4TmZCWFNHbjVnQUVnZnhwYnVWVXNvVzF3cjJtL2VoMGZn?=
 =?utf-8?B?MWt5NTFvZDVYQXgrRmcybVVCYktoVGhYSFRZMEViVGZDQ3N3TVl5aDNBWGFC?=
 =?utf-8?B?Y21vdHdMQjdpMG4zdWgzYnpIaWxnRU9ma0VhTUhCVXJTcXBMaEJCZUNqQm9u?=
 =?utf-8?B?cUdqekNmOG1JRmY5VDYyQWVjTXlKRUxkNXc2UGp2cG1rZWh1eWhlK21rL0c1?=
 =?utf-8?B?RFFSRWUvVWMxUlVNcWpUb0g2amh6SW1PbkJxczNxd3grZmE4eTVCWExFaEc1?=
 =?utf-8?B?S0FLYU9PcUQvZ0ZZdVJJaWRseFB0ek1SUEFIb3FNeXM5bmpodmxiOGlxbGJq?=
 =?utf-8?B?WUQ1enhURjJjOHZNQ1RXSi9CSjJrTDdNQ3pheFNYVjhVK0ZMU09JbDl4SFZw?=
 =?utf-8?B?cXJHbjc2b0NuK0JMWFltVVduYm9ZL1ZscWIrTGxYT3ZYdy9UbFpGbjhqQVU1?=
 =?utf-8?B?ay84c0RZU3JiQUpkd1lOSHZOb0lhcjNYMWFKYWJUd3NLaGcva3FDenc4SEZo?=
 =?utf-8?B?Qi94QkgzaDhJb2luVjBnMURObWJPWjFCYWNScmNQOGVWZm9lenphSkhqSHpL?=
 =?utf-8?B?TldRMWFNUTlNNVdtY2J3VlFrWFoyOWJvRWluWEllQk4vanpLYXJmMlN1S05o?=
 =?utf-8?B?RUxmKytGZkFYTTFzRHlVb0s5VWNqWlg1SUhnSUZsRVdLMXBxdXRxaWV1bXcx?=
 =?utf-8?B?ZURmMzV1TVhMYXVLbWpUcE9LVXhnenlVcU5EblNUaTRIMW4ySzUvajBnbGM1?=
 =?utf-8?B?ZmVXNW1BVmJvNTNGM1pyQWF2ZkpRSDZodUl6TXpLc09YbFlLVXBjRHpPN0dK?=
 =?utf-8?B?WExwaUIybTl6Qk5TMDFZVkVobTlnPT0=?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(7416014)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FewJVRuHpZLMr3zqldkU0oyC79A0Qwu+6zPnlmaJTrLcU9Sl4Y3ZTdwOM8umL+GPn6G2CJt83zDuSvLGeifJ0FslXq25pbBX9e+6JmkoHkUZ7DcOyhLTakyKrHk7vqTQkEHgO+Gt9yBdmbfhkka0Qe6UMzQFZs6XJXCNSdetvf2cB/RILQreroflj0+ITNtHlmPOjmmM0MiRB6yEy8lUx2hWD5ld4Q/JGXtMFEEu1ySVkIRoh+6f22mTRyWPTXj7WbChkyTkzZCjmBsaz5BFp/dxAMBpLgyzJJBKtntbzb/B3MSiuoUzqZSlumLeMgGA09oCN856O3zQ95tUWcLljobs5GCr5UY2qq1r3JicDhY71o6AChtBiabW0qlG13M9CtFUWjsQM+iypNN/Z3IyliHjInCP1gVfxmrgdKg0mhHIftNgcXn6LbrOe1LyQmDF
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 11:08:17.2581
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6786c034-2865-4dcb-3162-08de6894b162
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003446.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8733

PiBPbiAyLzkvMjYgMjA6MTMsIFBpZXJyZS1Mb3VpcyBCb3NzYXJ0IDxwaWVycmUtbG91aXMuYm9z
c2FydEBsaW51eC5kZXY+IHdyb3RlOg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYxIFJFU0VORF0g
U291bmRXaXJlOiBBbGxvdyBQcmVwYXJlDQo+IGNvbW1hbmQgZm9yIFNpbXBsaWZpZWRfQ1BfU00N
Cj4gDQo+IE9uIDIvOS8yNiAwODrigIowOSwgTmlyYW5qYW4gSCBZIHdyb3RlOiANCj4gPiBJbiBU
SSBkZXZpY2UgaW1wbGVtZW50YXRpb25zLCB3ZSd2ZSBmb3VuZCB0aGF0IHNvbWUgZGV2aWNlcyB3
aXRoDQo+ID4gU2ltcGxpZmllZF9DUF9TTSBzdGlsbCBiZW5lZml0IGZyb20gcmVjZWl2aW5nIHRo
ZSBQcmVwYXJlIGNvbW1hbmQuDQo+IEl0IHdvdWxkIGFsc28gYmUgZ29vZCB0byBjbGFyaWZ5IHdo
ZW4gdGhlIGRldmljZSBpcyBhY3R1YWxseSBwcmVwYXJlZCBhZnRlciB0aGUNCj4gYml0cyBhcmUg
c2V0LCBpZiB0aGUgaW1wbGVtZW50YXRpb24gY2Fubm90IGd1YXJhbnRlZSB0aGF0IHRoZSBwcmVw
YXJlZCBzdGF0dXMgaXMNCj4gcmVhY2hlZCBieSB0aGUgZW5kIG9mIHRoZSBmcmFtZSB3aGVyZSB0
aGUgd3JpdGUgb2NjdXJzLCB0aGVuIGl0J3MgZGVmaW5pdGl2ZWx5DQo+IE5PVCBhIFNpbXBsaWZp
ZWRfQ1BfU00uDQo+IA0KPiBXaGF0IGhhcHBlbnMgaXMgdGhlIHNpbXBsZV9jaF9wcmVwX3NtIGJp
dCBpcyBub3Qgc2V0IGZvciB0aG9zZSBkZXZpY2VzLCBhbmQNCj4gdGhlIHJlZ3VsYXIgc3RhdGUg
bWFjaGluZSBpcyB1c2VkIGluc3RlYWQ/IElzIGFueXRoaW5nIGJyb2tlbj8NCg0KV2UgbmVlZCB0
byB1c2UgdGhlIHNhbWUgQklPUyBiZXR3ZWVuIFdpbmRvd3MgYW5kIExpbnV4LiBUaGUgQklPUyBj
b25maWd1cmVzDQp0aGUgZGV2aWNlIGFzIFNpbXBsaWZpZWRfQ1BfU00uIFRoZSBkZXZpY2UgYWxz
byBleHBlY3RzIHRoZSBQcmVwYXJlIGJpdHMgdG8gYmUNCnNldC4gSWYgdGhlIGRldmljZSBpcyBj
b25maWd1cmVkIGFzIGdlbmVyaWMgQ1BfU00sIHRoZSBzdGF0dXMgIlBvcnQgUmVhZHkiIA0KYml0
cyB3aWxsIG5vdCBiZSB1cGRhdGVkIGFuZCB3ZSBlbmQgdXAgd2l0aCBwb3J0IHByZXBhcmUgZmFp
bCBlcnJvcnMuDQoNClNvLCBzZXR0aW5nIHRoZSBkZXZpY2UgdG8gc2ltcGxpZmllZCBDUF9TTSBh
bmQgaWdub3JpbmcgdGhlICJwb3J0IHJlYWR5IiBiaXRzIGlzIHRoZQ0KYmVzdCBvcHRpb24gd2Ug
aGF2ZS4NCg0KVGhlIFRJJ3MgSFcgaXMgaW1wbGVtZW50ZWQgcmVmZXJyaW5nIHRvIHRoZSAiRmln
dXJlIDE0MSBDaGFubmVsIFByZXBhcmUgU3RhdGUgDQpNYWNoaW5lIiBmb3IgU2ltcGxpZmllZF9D
UF9TTSBvZiB0aGUgc3BlYy4gd2hlcmUgUHJlcGFyZTAgT1IgUHJlcGFyZTEgYXJlIHNob3duIGlu
IHRoZQ0KaW1hZ2UgaW50ZXJwcmV0aW5nIGl0IGFzIHNldHRpbmcgcHJlcGFyZS9kZS1wcmVwYXJl
IGJpdHMuDQoNCj4gPiArCX0gZWxzZSB7DQo+ID4gKwkJLyogU29tZSBkZXZpY2UgcmV0dXJuIGVy
cm9yIGZvciB0aGUgcHJlcGFyZSBjb21tYW5kLA0KPiA+ICsJCSAqIGlnbm9yZSB0aGUgZXJyb3Ig
Zm9yIFNpbXBsaWZpZWQgQ1BfU00NCj4gDQo+IHRoYXQgY29tbWVudCBpcyBtaXNsZWFkaW5nIGFu
eXdheXMsIGl0J3Mgbm90ICdzb21lIGRldmljZScgaXQncyBBTEwgdGhlDQo+IGNvbmZvcm1hbnQg
ZGV2aWNlcyB0aGF0IHdpbGwgcmV0dXJuIENvbW1hbmRfSWdub3JlZCB3aGVuIHRyeWluZyB0byB3
cml0ZQ0KPiByZWFkLW9ubHkgYml0cy4gWW91IGhhdmVuJ3QgZGVzY3JpYmVkIHdoYXQgdGhlIFRJ
IGRldmljZXMgd291bGQgcmV0dXJuIGluIHRoaXMNCj4gY2FzZS4NClRJIGRldmljZSBkb2Vzbid0
IHJldHVybiBhbnkgZXJyb3IgY29kZSB3aGlsZSBzZXR0aW5nIHRoZSAgcHJlcGFyZSBiaXRzIGNv
bW1hbmQgd2hpbGUNCmluIFNpbXBsaWZpZWRfQ1BfU00gbW9kZS4gSXQgYWNjZXB0cyB0aGUgd3Jp
dGUgdG8gdGhlIHJlZ2lzdGVyIHdpdGhvdXQgY29tcGxhaW50Lg0KDQpJIGFncmVlIHRoYXQgdGhl
IGNvbW1lbnQgY291bGQgIGJlIHVwZGF0ZWQuIFdlIHNob3VsZCBpbmRpY2F0ZSB0aGF0IHdlJ3Jl
IA0KZGVsaWJlcmF0ZWx5IHNlbmRpbmcgd3JpdGVzIHRvIHdoYXQgc2hvdWxkIGJlIHdyaXRlLWln
bm9yZWQgYml0cyBmb3IgY29tcGF0aWJpbGl0eSANCnJlYXNvbnMsIHdoaWxlIGVuc3VyaW5nIGFu
eSBwb3RlbnRpYWwgZXJyb3JzIGZyb20gZnVsbHkgc3BlYy1jb21wbGlhbnQgZGV2aWNlcyBhcmUg
DQpoYW5kbGVkIGdyYWNlZnVsbHkuDQoNClJlZ2FyZHMNCk5pcmFuamFuDQo=
