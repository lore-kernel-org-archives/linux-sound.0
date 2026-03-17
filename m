Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010053.outbound.protection.outlook.com [52.101.61.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC6128314C;
	Tue, 17 Mar 2026 06:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773727565; cv=fail; b=AFKr8rhSCkivDqSEKx3RomwdzucDuFx/9MzfUwcdNeWZ/cvZxKoZ5ffpIIpsKA5iK0ASuB1Cq2lYkxnxh61jrUlIRLRpNozJfaFzrpeBY2zQxh1aVaIqIF2jGyK+z5FaeWXiTxoNqOAFb1vl8LyszbDrZ4VCfrmJj4eelhU8iBk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773727565; c=relaxed/simple;
	bh=ynx5u1l0ER06KQBqnSMBmrI4v7aAGLdYhGVDvHSAgt4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EmAY9mjUvoUR7RdRoETqqnpCrwIhOydi3H4O4Z4EBTy5NkDyLa83gQodQEsx2x05uwq+y7m/H7hiwu4vmqVNvpBU9b4YykXf7C/tkTGEWJHJyBhwVvUNob6+rReSlH1MaCJPa3ivQ74p9JyI8nU8e+AFt23K3gOBNCZaduVnvNc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=FREvbzvo; arc=fail smtp.client-ip=52.101.61.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="FREvbzvo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S3G99fFQMPOCdb4Pz126ltSi14W08QVVagKUCYIeSdW8E70HaE57TFL3nlEQamnbGI/ynvhciFeu8A3+ksU4BxX7TREoYjit/y/5aqQZWj/21tfDvODJBkHf4qmk1pJa6F2dVGxy454AhntaOrk4ebziaNgh6wPO4Vjm8xDyfkO/CKrnSaSGF0StBBppqvJPk55Iil09b9ZrQs3NS3IXcvtkm6e+TzzM/DBhesbbgI4P90fl4IfJWMT/z7bHvnad1gHFcgIdlVwLb4930vDuZWL6W6wDeRS7wMWZCSUwHE+LPpoB/HfR0HLVuWh9LT8LxlcxPU9vFo6XUIsi+2YaSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ynx5u1l0ER06KQBqnSMBmrI4v7aAGLdYhGVDvHSAgt4=;
 b=wYP0l5HsevAkIfyh1aS/NMJi9wBJdt+1BZMXM0uxgsDsTraWlHgSFS+hKg8HS1gIPWVJfHO4Y1UEgSSRSvpq5JLf6AQgQOscu+JOWT9cQjurj+UJKm1IpCNuJk2+qT5QxIGlKZb5K5KGPJaKym7ongVpvc+H/EEPlCC+bHT9JK1OeBw1M2ln5Ch4ZGHLTUM0HuRKLCNwNsiQwl05SuGD+oY/x65msfVvyM4RH+J9HIsMhxrRbrI3/DutalEgB+yF0f1mCoYmmhmop4gjBMV5qwxV7Lgo5walfRCfeO/FmURxS1nk/cpLl7gEu0colUvfR71DPkk82Il6Mi9qrqyWZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ynx5u1l0ER06KQBqnSMBmrI4v7aAGLdYhGVDvHSAgt4=;
 b=FREvbzvo1Yj3s4qQcqdN+TE17X7OimQbE+E8SZYECcbP0dmN46pAWZvBJk47hHjgwRPfs00UCQexw0ozAs7o8IdxrlJIp0D+JjAS2cIUg8C4nexfcfAlyiv0sM+l4elEFW3+7UDqhE3doKxG5HSjbp2bKx/c4YuNnQZKRgCPXuc=
Received: from PH8P221CA0044.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:346::22)
 by LV0PR10MB997662.namprd10.prod.outlook.com (2603:10b6:408:33d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 06:06:02 +0000
Received: from CY4PEPF0000FCC5.namprd03.prod.outlook.com
 (2603:10b6:510:346:cafe::ca) by PH8P221CA0044.outlook.office365.com
 (2603:10b6:510:346::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Tue,
 17 Mar 2026 06:06:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY4PEPF0000FCC5.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 06:06:00 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 01:05:59 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 01:05:59 -0500
Received: from DLEE208.ent.ti.com ([fe80::eccb:3d12:9ac:a479]) by
 DLEE208.ent.ti.com ([fe80::eccb:3d12:9ac:a479%20]) with mapi id
 15.02.2562.020; Tue, 17 Mar 2026 01:05:59 -0500
From: "Ding, Shenghao" <shenghao-ding@ti.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "Xu, Baojun" <baojun.xu@ti.com>, "broonie@kernel.org"
	<broonie@kernel.org>, "tiwai@suse.de" <tiwai@suse.de>, "13916275206@139.com"
	<13916275206@139.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
Subject: RE: [EXTERNAL] Re: [PATCH v1 2/2] ASoC: tas2781: Add tas5832 support
Thread-Topic: [EXTERNAL] Re: [PATCH v1 2/2] ASoC: tas2781: Add tas5832 support
Thread-Index: AQHcpvWtM+IwM+FmAUmJuO9Hs3DySrWWv+mAgAAB3ACAAAFxAIAEj1IAgAAJlQCAAAaZgIAAAZ+AgAAEvQCAAAbRAIAFzqUwgACDr4CAEJV9YA==
Date: Tue, 17 Mar 2026 06:05:59 +0000
Message-ID: <d8303fc67ae84232b4b6ff0ef8cad6f1@ti.com>
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
 <3af19ebaf32d482ab5cf575b831b2d9d@ti.com>
 <f16d2a7f-04e2-4d99-9239-caca9fd1f7b5@kernel.org>
In-Reply-To: <f16d2a7f-04e2-4d99-9239-caca9fd1f7b5@kernel.org>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC5:EE_|LV0PR10MB997662:EE_
X-MS-Office365-Filtering-Correlation-Id: eefdf2ef-698e-453b-b583-08de83eb435f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|36860700016|82310400026|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	NQVDkIALU15TYUp+ZiOnEZXLKlMxu1dA+CbTKoJ2Z7oaaisjr3DJuIBxFdLTk0irZcwcFe3d20Yy5UIlWE8pYy1u1U0wg2pLwV/rdreRWJoBb97alVrhljjIgQ+RuEpUrnHqpjmHNzgor8mF6UjOUvFnG1lL4uaMyfR6H4ZyI3BMi3gwizB9eTfQGrym6lIC9vgHl+J02CSkjQwBa1eQcPI1hh3W9k6JOJO21u4TbHZ/hvQyQt4iEN2jKbigWIHie3eICAOBsKUYAkoQ4OWOZmoZfl+15LX6TPX4ZfzMjCPzb6yeYWX2PLfII0xpt/QaxdpZi9rKogj30pp70uzVMp3VmfT/3R3N77cYhWxhtRek/nEevTkkoibzYLC4/0hxihtKyWfae+tFna+Py6leNzlFFI0NyiZeVqRyJ+5EfKcZp/gpE0UV+eNadUYjbjiG/WRUpkLW+6VM2MykR0ktz7WUwBT48JBgK4IVcXxaYXxrbkH0oJD+zrKSaQ1Xqn5yKzSfpUtQuAElBduIxIJvHqD2jMXeSQvwnmFQ/tQ/R8Ka54AGEG1C/Lh/6TQJpWZtzrlB59TAP7Dxk0bNbrd+ra3krmzgzzPgn/2A8sLYsbOhxxMNTqTcCxIRuoC+rN/kbv34cCxdIuOxf3D578PgPtFWYlX8quq4w+Rgp4Cc9IyZesGFBoa5gNPfxeTEB/JqkqJpEuGM0Y+yF+6JEjoFoXTcsOMjdTn1stS7dN3XyYnXSUDu4lxgESA7v5R/S1hqUhwWnm1rSSmZkc9ZJOCwNA==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(36860700016)(82310400026)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6h2kbGDyotlOm62MDGDEDSlI44EnKUmIboSOgvoa7eeDtTWkTZgO+3A0WIKQQV91Fq5kzvhp47xdiQ7mzmQjA0AK1EwjEWDdSs2jjITb9RjQrrimxVq2YKpxmT4yLRmrc4VtdAa/TKZfvSbRLfIQC7BU06wZLVmMjgBRrBDHB37qN5gEjSvJ9t08hozLO6ZTLNvQoTOTXJwRdYjW0BDA0KyvuG/QsfZexOjTDC9vkGOiH0ie54P6hfudQyURb0Cdn/+no8JWFTPtbfhQNKsz/VeokcYEmfBo43Rzipxl/dnJuAj0e0ZV2yjXdZbMzawi52vf4hyCRd1BL8QDnLc1TRhy+6+f6+l0l6jJYpKTjDvGcRkL4ViF02teFQ0r85KaF36O5SQ7oyiFQr5P1gjpDkQJwvjsJf2vAnbzARbhlxqE8mxbVQwKDy58kRw1ZMI3
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 06:06:00.3209
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eefdf2ef-698e-453b-b583-08de83eb435f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR10MB997662

PiA+Pj4NCj4gPj4+Pj4+Pj4+Pj4gc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgdGFz
ZGV2aWNlX29mX21hdGNoW10gPSB7DQo+ID4+Pg0KPiA+Pj4+Pj4+Pj4+PiAgICAgICB7IC5jb21w
YXRpYmxlID0gInRpLHRhczU4MjciIH0sDQo+ID4+Pj4+Pj4+Pj4+ICAgICAgIHsgLmNvbXBhdGli
bGUgPSAidGksdGFzNTgyOCIgfSwNCj4gPj4+Pj4+Pj4+Pj4gICAgICAgeyAuY29tcGF0aWJsZSA9
ICJ0aSx0YXM1ODMwIiB9LA0KPiA+Pj4+Pj4+Pj4+PiArICAgICB7IC5jb21wYXRpYmxlID0gInRp
LHRhczU4MzIiIH0sDQo+ID4+Pj4+Pj4+Pj4NCj4gPiAuLi4NCj4gPj4+DQo+ID4+PiBJIGRvbid0
IGtub3cgd2hhdCB5b3UgYXJlIHRyeWluZyB0byBnZXQgZnJvbSB0aGVtLCBidXQgScKyQw0KPiA+
Pj4gZW51bWVyYXRpb24gb24gRFQgcGxhdGZvcm1zIHdvcmtzIGluIGEgd2F5IHRoYXQgaXQgdGFr
ZXMgdHdvIHRhYmxlcw0KPiA+Pj4gaW50byBhY2NvdW50LCBoZW5jZSwgaWYgdGhlcmUgaXMgbm8g
Y29tcGF0aWJsZSAod2l0aCBnaXZlbiBwYXJ0DQo+ID4+PiBudW1iZXIpIHRoZXJlIHdpbGwgYmUg
bm8gbWF0Y2hpbmcgbmFtZS4NCj4gPj4+DQo+ID4+PiBBRkFJSyBpdCBoYXMgdG8gaGF2ZSBhIGNv
bXBhdGlibGUgdG8gbWFrZSBpdCB3b3JrIGluIHN1Y2ggYSBjYXNlLg0KPiA+Pj4gV2hhdCBkaWQg
SSBtaXNzPw0KPiA+Pg0KPiA+PiBTaG93IG1lIHBsZWFzZSB0aGVuIGhvdyB0aGUgT0YgdGFibGUg
aXMgdXNlZCBoZXJlIGF0IGFsbCB0byBnZXQgdGhlIG5hbWUuDQo+ID4NCj4gPiBUaGlzIGNvZGUg
d2lsbCBhbHNvIGJlIHVzZWQgZm9yIEFDUEkgZGV2aWNlcy4gVG8gZW5zdXJlIGNvbnNpc3RlbnQg
YmluDQo+ID4gZmlsZSBuYW1pbmcgYmV0d2VlbiBBQ1BJIGFuZCBEVFMgZGV2aWNlcywgdGhlIG1h
cHBpbmcgdGFibGUNCj4gPiB0YXNkZXZpY2VfaWRbXSBoYXMgYmVlbiBpbnRyb2R1Y2VkLg0KPiAN
Cj4gV2UgbmVlZCB0byBzdG9wIGRpc2N1c3Npbmcgd2l0aCBpcnJlbGV2YW50IGFyZ3VtZW50cywg
cmVhbGx5Lg0KPiANCj4gSSBhc2tlZCB0byBzaG93IG1lIGhvdyB0aGlzIGlzIGdvaW5nIHRvIGJl
IHVzZWQgaW4gRFQuIE5vIGFuc3dlciB0byB0aGlzIHBhcnQuDQo+IA0KPiBOb3cgeW91IGNsYWlt
IHRoaXMgT0YgSUQgd2lsbCBiZSB1c2VkIGZvciBBQ1BJIGRldmljZXMsIGJ1dCBZT1UgSEFWRSBh
bHJlYWR5DQo+IEFDUEkgdGFibGUgdGhlcmUsIHNvIHRoYXQncyBjbGVhcmx5IGludmFsaWQgYXJn
dW1lbnQuIERvIHlvdSB1bmRlcnN0YW5kIGhvdw0KPiBwYXRjaC9lbWFpbCByZXZpZXcgd29ya3M/
IFdoZXJlIHRoZSBjb21tZW50cyBhcHBlYXIgYW5kIHdoYXQgaXMgYmVpbmcNCj4gZGlzY3Vzc2Vk
Pw0KPiANCj4gPiBUaGUgY29kZSByZXRyaWV2ZXMgdGhlIGNvcnJlc3BvbmRpbmcgbmFtZSBvZiB0
aGUgY2hpcCBmcm9tDQo+ID4gdGFzZGV2aWNlX2lkW10gYmFzZWQgb24gaXRzIG9yZGVyIGluIHRh
c2RldmljZV9vZl9tYXRjaFtdIG9yDQo+IHRhc2RldmljZV9hY3BpX21hdGNoW10uDQo+IA0KPiBC
YXNlZCBvbiB0aGUgb3JkZXIgaW4gdGFibGU/IE5vLCB0aGF0J3MgY3JhenkgYnVnZ3kgc29sdXRp
b24gdG8gdGllIG9yZGVyIG9mDQo+IGVudHJpZXMgaW4gYm90aCB0YWJsZXMuIEFuZCBpdCBtYWtl
cyBubyBzZW5zZS4uLiBhbmQgSSBhbSBzdXJlIGNvZGUgZG9lcyBub3QNCj4gZG8gaXQsIHNvIGFn
YWluIGlycmVsZXZhbnQgYXJndW1lbnQuDQoNCkl0IHNob3VsZCBiZSBub3RlZCB0aGF0IHRoZSBj
dXJyZW50IGltcGxlbWVudGF0aW9uIHJlbGllcyBvbiBpZF90YWJsZSANCihyYXRoZXIgdGhhbiBP
Rl9JRCkgdG8gb2J0YWluIHRoZSBjaGlwIG5hbWUgYW5kIGNoaXAgSUQuIFRoZSBjaGlwIElEIGkN
CnMgc3BlY2lmaWNhbGx5IHJlc2VydmVkIGZvciBoYW5kbGluZyBleGNlcHRpb25hbCBjYXNlcywg
Zm9yIGV4YW1wbGUsIA0KdGhlIHdvcmthcm91bmQgZm9yIHRoZSBUQVMyNzgx4oCZcyBsb3dlciBz
cGVha2VyIGltcGVkYW5jZSBpc3N1ZS4NCg0KU2luY2UgdGhlIDU4eHggZmFtaWx5IGxhY2tzIGEg
ZGVkaWNhdGVkIHJlZ2lzdGVyIHRvIHF1ZXJ5IHRoZSBjaGlwIElELCANCmJvdGggdGhlIHN1cHBv
cnRlZCBjaGlwIElEIGFuZCBuYW1lIGFyZSBzdG9yZWQgaW4gaWRfdGFibGUuDQogVGhpcyBhcHBy
b2FjaCBhbGxvd3MgY29tcGF0aWJpbGl0eSB3aXRoIGJvdGggRFQtYmFzZWQgKERldmljZSBUcmVl
KSANCmFuZCBBQ1BJLWJhc2VkIChBZHZhbmNlZCBDb25maWd1cmF0aW9uIGFuZCBQb3dlciBJbnRl
cmZhY2UpIGRldmljZS4NCg0KCWlmIChBQ1BJX0hBTkRMRSgmaTJjLT5kZXYpKSB7DQoJCWFjcGlf
aWQgPSBhY3BpX21hdGNoX2RldmljZShpMmMtPmRldi5kcml2ZXItPmFjcGlfbWF0Y2hfdGFibGUs
DQoJCQkJJmkyYy0+ZGV2KTsNCgkJaWYgKCFhY3BpX2lkKSB7DQoJCQlkZXZfZXJyKCZpMmMtPmRl
diwgIk5vIGRyaXZlciBkYXRhXG4iKTsNCgkJCXJldCA9IC1FSU5WQUw7DQoJCQlnb3RvIGVycjsN
CgkJfQ0KCQl0YXNfcHJpdi0+Y2hpcF9pZCA9IGFjcGlfaWQtPmRyaXZlcl9kYXRhOw0KCQl0YXNf
cHJpdi0+aXNhY3BpID0gdHJ1ZTsNCgl9IGVsc2Ugew0KCQl0YXNfcHJpdi0+Y2hpcF9pZCA9ICh1
aW50cHRyX3QpaTJjX2dldF9tYXRjaF9kYXRhKGkyYyk7DQoJCXRhc19wcml2LT5pc2FjcGkgPSBm
YWxzZTsNCgl9DQoNCg0KPiANCj4gTkFLLCBiZWNhdXNlIGFsbCB0aGUgcmVwbGllcyBzbyBmYXIg
YXJlIG9mZi10b3BpYy4NCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQo=
