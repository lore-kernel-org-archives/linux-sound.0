Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazhn15010019.outbound.protection.outlook.com [52.102.128.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2795D35B62C;
	Fri,  6 Mar 2026 10:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.128.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772791740; cv=fail; b=J4mehEDKOS9KyKFlb7GkEd8+iOuL9td7eAfBMLGh5O8VB2VZDQ8kWJ3IdPvqosuM15YwTtCFwHbBjcQHLs5TMV0/Si7t5CxPhiQH4FxVPUYOXnSCDBQjx/g5cRcLcPzejdbAlxnw36XrwtDcErKEXLfN+I4UmkmqxZUD0dv5/Po=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772791740; c=relaxed/simple;
	bh=Yyyzkd5c52o2u502YMfjgmGElI8v7vGvuPQUatweoiY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TR3BsZuxjvVb2H+VqBJvw81V11MGe08iCANsJggPeALztFcvlqjvwEEnHFXSjkZ3C5068c7uwFXWqUetDmDee0TT52c6yIUhdBbMXcQhCgQCefo1HdbBzjIk9VI14tYg8s1umEYTj4UR9azAtyh9Ss1N8YWoxdEW/2NZs05lxwc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=LRrXaGjS; arc=fail smtp.client-ip=52.102.128.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="LRrXaGjS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CcCoZdtthzKVLDRwOokfhvigPDpu1lT4iTOV24ikXDMaZPPE55zawejlMRVmOp9lcCVIeLVKNMD4P2gHqii4PAWgxeHDvMfZXewxfEUb87njDgJo6lw9GIDV76hAlou8PBMtfjMluuItmD7FpRHWgekiI65jQfsV3prkxMmSbSwGQEKD1Mk6gHWuLjyS6O3XNHTOxLOmuySpnW7ik7QtebSvoGu2tA81uNXsw5O5WI76UzkAtXTlducOqEdf2njy5XEdIWRF9pmQgL3aSK9RtaV/IZZrg5TE/6zUODQagBBCE+z8UfFD1p8otRHnJtUHbHGYpJadiwjBJU4vVUTXkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yyyzkd5c52o2u502YMfjgmGElI8v7vGvuPQUatweoiY=;
 b=LYsc1DgpGvdHNVla64SVJ+AuM7fLQE16+jGBNFbghwY3G4j6dEmyy1AwL7hq4pHyvN2e3EJEH2S5KdGg0Flri4GS808LewBgxTNhQybcfm042Nouyg9597A4Q5d3Wba32GHsDYqDlEPrJU/pPQpLeVr9AT8cz1SdCHpNZrdODX9x/7Duz/j1ug8p8VyZ0kFKJmzgArmeI1VD+2KyJdOnAQFbJX1XG+sNhQ+JDQKzWa7SkY/dERS+ffLxLf8p5vz6ffsv15k1CBEZbPGVjqh0V7SXHrFetvOafECuDIN26HSmy8n0QOAq6ucsYzlFg0SOACxAAI7dQBN5l5RlPbeDeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yyyzkd5c52o2u502YMfjgmGElI8v7vGvuPQUatweoiY=;
 b=LRrXaGjSv1ywtuBcjODIQ2p1IUzVzJRelXEBtbQV71Aox9kEFhUDgFn9BRHxOG7kjfoI+e5mqcyt+3ts0+OD26y+w4P9F/ABsPDr8UJ2ZzxGWzri2f+6x/CufjiBNlaBNymyhCix76/kZC7ElOHeO8DSsLzsjh1oE2TwxIXutFw=
Received: from SN6PR05CA0007.namprd05.prod.outlook.com (2603:10b6:805:de::20)
 by DS0PR10MB7408.namprd10.prod.outlook.com (2603:10b6:8:15d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 10:08:56 +0000
Received: from SN1PEPF0002BA50.namprd03.prod.outlook.com
 (2603:10b6:805:de:cafe::ec) by SN6PR05CA0007.outlook.office365.com
 (2603:10b6:805:de::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18 via Frontend Transport; Fri,
 6 Mar 2026 10:08:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SN1PEPF0002BA50.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Fri, 6 Mar 2026 10:08:56 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 04:08:50 -0600
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 04:08:49 -0600
Received: from DLEE208.ent.ti.com ([fe80::eccb:3d12:9ac:a479]) by
 DLEE208.ent.ti.com ([fe80::eccb:3d12:9ac:a479%20]) with mapi id
 15.02.2562.020; Fri, 6 Mar 2026 04:08:49 -0600
From: "Ding, Shenghao" <shenghao-ding@ti.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "andriy.shevchenko@linux.intel.com"
	<andriy.shevchenko@linux.intel.com>
CC: "Xu, Baojun" <baojun.xu@ti.com>, "broonie@kernel.org"
	<broonie@kernel.org>, "tiwai@suse.de" <tiwai@suse.de>, "13916275206@139.com"
	<13916275206@139.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Yi, Ken"
	<k-yi@ti.com>, "Lo, Henry" <henry.lo@ti.com>, "Chen, Robin"
	<robinchen@ti.com>, "Wang, Will" <will-wang@ti.com>, "jim.shil@goertek.com"
	<jim.shil@goertek.com>, "toastcheng@google.com" <toastcheng@google.com>,
	"chinkaiting@google.com" <chinkaiting@google.com>
Subject: RE: [EXTERNAL] Re: [PATCH v1 2/2] ASoC: tas2781: Add tas5832 support
Thread-Topic: [EXTERNAL] Re: [PATCH v1 2/2] ASoC: tas2781: Add tas5832 support
Thread-Index: AQHcpvWtM+IwM+FmAUmJuO9Hs3DySrWWv+mAgAAB3ACAAAFxAIAEj1IAgAAJlQCAAAaZgIAAAZ+AgAAEvQCAAAbRAIAFzqUw
Date: Fri, 6 Mar 2026 10:08:49 +0000
Message-ID: <3af19ebaf32d482ab5cf575b831b2d9d@ti.com>
References: <20260226075737.405-1-baojun.xu@ti.com>
 <20260226075737.405-2-baojun.xu@ti.com>
 <20260227-ubiquitous-dashing-copperhead-b2c6a0@quoll>
 <9f861c7df09c4434a98a203ecff913bc@ti.com>
 <63b0f42e-56e8-474f-8805-4e01bb2f189e@kernel.org>
 <a7316acf9ba248f9ad1fab0313a95654@ti.com>
 <3cfa4036-e7a7-4cde-9dab-a171a63bdee3@kernel.org>
 <4865c7f626a340d7847354512367577e@ti.com>
 <596f90d0-8dbd-4afe-a722-bf2ba65e1776@kernel.org>
 <aaVcDvYvi28wFR2S@ashevche-desk.local>
 <c46a8bf5-7a6a-41a9-b18f-9a7ad7a60bb9@kernel.org>
In-Reply-To: <c46a8bf5-7a6a-41a9-b18f-9a7ad7a60bb9@kernel.org>
Accept-Language: en-US, zh-CN
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA50:EE_|DS0PR10MB7408:EE_
X-MS-Office365-Filtering-Correlation-Id: aa715adf-5423-44be-fe26-08de7b6860c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|34020700016|1800799024|7416014|36860700016|376014|82310400026|7053199007|12100799066;
X-Microsoft-Antispam-Message-Info:
	AqCfkAzmzh/8SMjtaTfa+3wsLQeGetM7pr8iGkRKNzSrVy+i+eBdhix26i6uCCmu218BTMeSc2yQ5c2dFOi9InCfppFCMD+8JwzKboMujq/3aGrBQ8JsjIkjkfM/EO+5dUzVoIEfW8V4g8+A/5+Qm6zYb+tbFxcwXASjlPRm2RzxkJZjRn8k/gdImUa+kw66NPIkL1Y8+R+VPfDk7ADcpL52VJ4TYXIUNz+TLpzbHo84bU01nlRC4JeeTV8B9xM1jmLv8R3b7az7N01EKTWDMMk4Zg4gfjxBPAoc2onnP3njcvjxEDPBORWp8aqVfxWZpgaqFOuCu1K52r8AmINQw/fDxagWCwnxAaq6gz8HQ5GW/y6KxKkMcu3wHwt1G8QEXfvEEvJpEF+nICvaAvg0fF/E8qI+Quc50DRB/Jhr9XB1ibbFlQuriUoOJwWyMPAlsjzLequVtZBHhKSvQELYJjUxPXEqxPG163RbsbJ9Jl/7OEE1SdYruunBvnTE5H9MmBKfVZ4+KtwS8dQZVogS6s2gXdBJyS4vmhTRNCdkmNEemWTHRQ1gqsFpPj1ZTcvRUoT5CSyAW08kexNPutp4IkDi5Wj11LH6d94CQogfUcttRS1bc5t5l2QrAzOpnUExWMsE9RGLUHlDsXA/62xjX59K517fwIgSVqRjnoYuOEhDOEsUyZCKEZXalcdadVMhUxBqkkaIMbPy+Le7cBtLU622Ey0t8BsJeUkZhHbOwlx4NDkY8abKvsMcvZtGA0bpM9varFYVTs1+VKc0PTNSPg==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(34020700016)(1800799024)(7416014)(36860700016)(376014)(82310400026)(7053199007)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0krOu3keoIj4b7o6JcehS3YZWWDtlpl7SZMWzghEua0bx1JtvevCQeqCj9gSgWVwKCy1FsUTF101ZG2QgyD3X3Kzap4gka0U94DkfYtnjOIHzLZ4Cm7/7kSZC5HervoPJyc1r6a0KVtL8nOCqs9jHAS96df13H4zSO47Oru1Kes7fJLQzr60kK7uRTuCCQwNhFF0fvVumGKTaTV2GyP808F1v3pbUsL16+XQBSKhxsECdVg3R0ybguY/pfP5xHKzl1Afe23fecF/HRuafmaLpnEIEcFjk+NGqAvobkfHNMfgPVUkz52VEX68ccEnb9DKOo4uEmbagUJmEGsLTxdFYeY11og9oGuhoo5CxXq52u5lcJ/KQf9AmjCBwidMIuSxOBXNreguR3wiSxL1Q5fuZko1+Rg/uutDjo4OsaRsb1o+b1GeaET4QhdfUDhe0InT
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 10:08:56.3110
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa715adf-5423-44be-fe26-08de7b6860c3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA50.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7408

SGksIEtyenlzenRvZiAmIEFuZHksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4g
RnJvbTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3JnPg0KPiBTZW50OiBNb25k
YXksIE1hcmNoIDIsIDIwMjYgNjowOSBQTQ0KPiBUbzogYW5kcml5LnNoZXZjaGVua29AbGludXgu
aW50ZWwuY29tDQo+IENjOiBYdSwgQmFvanVuIDxiYW9qdW4ueHVAdGkuY29tPjsgYnJvb25pZUBr
ZXJuZWwub3JnOyB0aXdhaUBzdXNlLmRlOw0KPiAxMzkxNjI3NTIwNkAxMzkuY29tOyBEaW5nLCBT
aGVuZ2hhbyA8c2hlbmdoYW8tZGluZ0B0aS5jb20+OyBsaW51eC0NCj4gc291bmRAdmdlci5rZXJu
ZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBsZ2lyZHdvb2RAZ21haWwuY29t
Ow0KPiByb2JoQGtlcm5lbC5vcmc7IGtyemsrZHRAa2VybmVsLm9yZzsgY29ub3IrZHRAa2VybmVs
Lm9yZzsNCj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IFlpLCBLZW4gPGsteWlAdGkuY29t
PjsgTG8sIEhlbnJ5DQo+IDxoZW5yeS5sb0B0aS5jb20+OyBDaGVuLCBSb2JpbiA8cm9iaW5jaGVu
QHRpLmNvbT47IFdhbmcsIFdpbGwgPHdpbGwtDQo+IHdhbmdAdGkuY29tPjsgamltLnNoaWxAZ29l
cnRlay5jb207IHRvYXN0Y2hlbmdAZ29vZ2xlLmNvbTsNCj4gY2hpbmthaXRpbmdAZ29vZ2xlLmNv
bQ0KPiBTdWJqZWN0OiBSZTogW0VYVEVSTkFMXSBSZTogW1BBVENIIHYxIDIvMl0gQVNvQzogdGFz
Mjc4MTogQWRkIHRhczU4MzINCj4gc3VwcG9ydA0KPiANCi4uLg0KPiA+IC4uLg0KPiA+DQo+ID4+
Pj4+Pj4+PiBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCB0YXNkZXZpY2Vfb2ZfbWF0
Y2hbXSA9IHsNCj4gPg0KPiA+Pj4+Pj4+Pj4gICAgICAgeyAuY29tcGF0aWJsZSA9ICJ0aSx0YXM1
ODI3IiB9LA0KPiA+Pj4+Pj4+Pj4gICAgICAgeyAuY29tcGF0aWJsZSA9ICJ0aSx0YXM1ODI4IiB9
LA0KPiA+Pj4+Pj4+Pj4gICAgICAgeyAuY29tcGF0aWJsZSA9ICJ0aSx0YXM1ODMwIiB9LA0KPiA+
Pj4+Pj4+Pj4gKyAgICAgeyAuY29tcGF0aWJsZSA9ICJ0aSx0YXM1ODMyIiB9LA0KPiA+Pj4+Pj4+
Pg0KLi4uDQo+ID4NCj4gPiBJIGRvbid0IGtub3cgd2hhdCB5b3UgYXJlIHRyeWluZyB0byBnZXQg
ZnJvbSB0aGVtLCBidXQgScKyQyBlbnVtZXJhdGlvbg0KPiA+IG9uIERUIHBsYXRmb3JtcyB3b3Jr
cyBpbiBhIHdheSB0aGF0IGl0IHRha2VzIHR3byB0YWJsZXMgaW50byBhY2NvdW50LA0KPiA+IGhl
bmNlLCBpZiB0aGVyZSBpcyBubyBjb21wYXRpYmxlICh3aXRoIGdpdmVuIHBhcnQgbnVtYmVyKSB0
aGVyZSB3aWxsDQo+ID4gYmUgbm8gbWF0Y2hpbmcgbmFtZS4NCj4gPg0KPiA+IEFGQUlLIGl0IGhh
cyB0byBoYXZlIGEgY29tcGF0aWJsZSB0byBtYWtlIGl0IHdvcmsgaW4gc3VjaCBhIGNhc2UuDQo+
ID4gV2hhdCBkaWQgSSBtaXNzPw0KPiANCj4gU2hvdyBtZSBwbGVhc2UgdGhlbiBob3cgdGhlIE9G
IHRhYmxlIGlzIHVzZWQgaGVyZSBhdCBhbGwgdG8gZ2V0IHRoZSBuYW1lLg0KDQpUaGlzIGNvZGUg
d2lsbCBhbHNvIGJlIHVzZWQgZm9yIEFDUEkgZGV2aWNlcy4gVG8gZW5zdXJlIGNvbnNpc3RlbnQg
YmluIGZpbGUgDQpuYW1pbmcgYmV0d2VlbiBBQ1BJIGFuZCBEVFMgZGV2aWNlcywgdGhlIG1hcHBp
bmcgdGFibGUgdGFzZGV2aWNlX2lkW10NCmhhcyBiZWVuIGludHJvZHVjZWQuDQpUaGUgY29kZSBy
ZXRyaWV2ZXMgdGhlIGNvcnJlc3BvbmRpbmcgbmFtZSBvZiB0aGUgY2hpcCBmcm9tIHRhc2Rldmlj
ZV9pZFtdDQpiYXNlZCBvbiBpdHMgb3JkZXIgaW4gdGFzZGV2aWNlX29mX21hdGNoW10gb3IgdGFz
ZGV2aWNlX2FjcGlfbWF0Y2hbXS4NClRoaXMgaW5mb3JtYXRpb24gaXMgdGhlbiBjb25jYXRlbmF0
ZWQgdG8gZm9ybSB0aGUgbmFtZSBvZiB0aGUgYmluIGZpbGUuDQo+IA0KPiA+DQo+ID4gVGhlIGNv
ZGUgaW4gcXVlc3Rpb24gaXMgaTJjX29mX21hdGNoX2RldmljZV9zeXNmcygpIGNhbGwgaW4NCj4g
PiBpMmNfb2ZfbWF0Y2hfZGV2aWNlKCkgd2hpY2ggZG9lcyB0aGlzIG1hZ2ljLg0KPiANCj4gQWRk
ZWQgZW50cnkgaXMgbm90IGJ5IGkyY19vZl9tYXRjaF9kZXZpY2UoKSwgc28gaWYgeW91IHVzZSB0
aGF0IGFzIGFyZ3VtZW50IHdlDQo+IGNhbiBjb25jbHVkZSAtIHRoaXMgaXMgY29tcGxldGVseSBy
ZWR1bmRhbnQsIHNvIHJlbW92ZSBpdC4NCj4gDQo+IA0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBL
cnp5c3p0b2YNCg0KQlINClNoZW5naGFvDQo=
