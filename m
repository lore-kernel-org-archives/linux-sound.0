Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010035.outbound.protection.outlook.com [52.101.193.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E071A9F96;
	Sat, 14 Feb 2026 16:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771087376; cv=fail; b=LJ0sqTXCgekjIQ/gVdoYoBvso/24ZjZI+zIGccPObtxrM2vz4eH+yPqNT0gzaFhY9KNzQ6XgnnY+8aNA/GC7gp6U8Xsbb+jFoF6H0cqkcBZU4DizRDRZ4RGFet5QqA1Qsyh6MLLMs2VP8yDPNmwvU9PL859+5mYz1T32OGpxytQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771087376; c=relaxed/simple;
	bh=i7eoZ0xSFESkX8yVNP5CMeCBIbt/qYkuOoAdBZMzTOg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=upYStJKxB93alp5Sgow9JiApE9ZwBzs2Srd4s2+VqcCA2WiDh4MBEXqKEmUs4LD8LivdozI8HVBrdebLFB62TcsDq82M6tjzkPQJUU/6I1caQ8RkWWDfZ8dyRHFSvqQYAm5SeYyV284efe38lCH53WXkKirXcp6Nbi5mb3THLqU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=PpFpLKvI; arc=fail smtp.client-ip=52.101.193.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="PpFpLKvI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J43Fym9gNQTsn4Et7BJecYxOQUnVql8uCaO+7kXkeccSC2YTrZbsaXwIufHRSZjh5Lo1H6zNWiD7lINn6rZbM410/1B6ESC7kW6VzHB14HVqM1PQwoESBugaVFEtoaVHcZWnHYNxhBSLhRY5Q2OLGojhYF/p/6No7B0+nv7iD6SNLz4CazWaJjuxKbhgUa+8hAJzAWW5fHS23GLjsZKIfNKSPguo8QvT+Qvweq4V2eUqL54O8jIe6QG8Wk+vRgfE3THN32GU3FG0InvxYjkIXl9q7G9QwF0qUqh7Q33ei0DlQMrFz7wEZRWbw+IWNVOuQ6Wps95Hf95W1/bK7H9rzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i7eoZ0xSFESkX8yVNP5CMeCBIbt/qYkuOoAdBZMzTOg=;
 b=QSt9tcsJ5OffUfBkHp9+kPZZf11NuaKw8mgRAH5hoyV/XHXWmiXcn9/WXu7i0Mgh2sVbNzcaRP+QugZKwDKiV3nVtVFI58Htu/Y3Syznn3EdoFGshfxLvzvMKPY4VHo/OyNFV+cehq9xpANfhik5PUnH7Ex1eZ53X2E3KWXrQgOHS61yz2RtJGpEaumjWKO/Oh1UxTJqHJIQoDUz6ek2Hnmut3e2ki704lmGgf0uzrDgS65v+DTKXnRircwcapwRQa1vSViiiO610e7NkK2OnAm8q9VQJX0n9NuLmnhlZ0L7xJRhXVwW6IdvbU1o9enGsHQgMvBTmibN3BlFeO4s+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=linux.dev smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i7eoZ0xSFESkX8yVNP5CMeCBIbt/qYkuOoAdBZMzTOg=;
 b=PpFpLKvIXkGzbh0m16RCemplkQRU29yqWwhIK+E84Sjzf4GX8O+zasnGhrevpqXGlTRFHontKCiObxp4DMMoqMHXhTtl8LhpNZU3HUK77/YKDEzWwi80lkQoo1iVO2RqCfmgepHGIGeM+4C9cV3s9IZRslhvrGRBXi0MMwgxF/4=
Received: from DS7PR05CA0064.namprd05.prod.outlook.com (2603:10b6:8:57::26) by
 MN2PR10MB4174.namprd10.prod.outlook.com (2603:10b6:208:1dd::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.15; Sat, 14 Feb
 2026 16:42:51 +0000
Received: from DS2PEPF00003439.namprd02.prod.outlook.com
 (2603:10b6:8:57:cafe::a8) by DS7PR05CA0064.outlook.office365.com
 (2603:10b6:8:57::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12 via Frontend Transport; Sat,
 14 Feb 2026 16:42:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS2PEPF00003439.mail.protection.outlook.com (10.167.18.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Sat, 14 Feb 2026 16:42:50 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sat, 14 Feb
 2026 10:42:50 -0600
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sat, 14 Feb
 2026 10:42:50 -0600
Received: from DLEE204.ent.ti.com ([fe80::81dc:e6c6:4c37:9bc6]) by
 DLEE204.ent.ti.com ([fe80::81dc:e6c6:4c37:9bc6%14]) with mapi id
 15.02.2562.020; Sat, 14 Feb 2026 10:42:50 -0600
From: "Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Richard Fitzgerald
	<rf@opensource.cirrus.com>
CC: "broonie@kernel.org" <broonie@kernel.org>, "ckeepax@opensource.cirrus.com"
	<ckeepax@opensource.cirrus.com>, "shumingf@realtek.com"
	<shumingf@realtek.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"ranjani.sridharan@linux.intel.com" <ranjani.sridharan@linux.intel.com>,
	"cezary.rojewski@intel.com" <cezary.rojewski@intel.com>,
	"peter.ujfalusi@linux.intel.com" <peter.ujfalusi@linux.intel.com>,
	"kai.vehmanen@linux.intel.com" <kai.vehmanen@linux.intel.com>,
	"vkoul@kernel.org" <vkoul@kernel.org>, "Ding, Shenghao"
	<shenghao-ding@ti.com>, "Xu, Baojun" <baojun.xu@ti.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Kasargod,
 Sandeep" <sandeepk@ti.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "yung-chuan.liao@linux.intel.com"
	<yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH v1 RESEND] SoundWire: Allow Prepare command for
 Simplified_CP_SM
Thread-Topic: [PATCH v1 RESEND] SoundWire: Allow Prepare command for
 Simplified_CP_SM
Thread-Index: AQHcndD0bcq4Sk46LUm1ohNHPW7tsA==
Date: Sat, 14 Feb 2026 16:42:49 +0000
Message-ID: <bc2fcd39b9f943a3b08c1af354ca6f09@ti.com>
References: <20260209070905.10749-1-niranjan.hy@ti.com>
 <97872c17-73c9-4484-9f8e-373ed9a59a25@linux.dev>
 <87773927e37c4d70862c5f047431c7b0@ti.com>
 <e9e27355-a3d1-4ae2-aa6a-da47c6bced1f@linux.dev>
 <5066fa12-3ac1-4619-8fbe-62d61f9d446c@opensource.cirrus.com>
 <5c8a4d68-0f43-40d1-971f-7d1f4f55eb5c@linux.dev>
 <286c2158-5f53-42a2-a04d-e9bed3e7acf0@opensource.cirrus.com>
 <54a891e5ee36487d9b6665cd73a19af7@ti.com>
 <b1238db5-25ce-4046-9719-bd6fa8fbc82c@opensource.cirrus.com>
 <f3a7b462-477d-459b-91ba-1ccf4bde5268@linux.dev>
In-Reply-To: <f3a7b462-477d-459b-91ba-1ccf4bde5268@linux.dev>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003439:EE_|MN2PR10MB4174:EE_
X-MS-Office365-Filtering-Correlation-Id: 21847e02-e830-427a-427a-08de6be817d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dGI4LzFFQ1VUUEZxeU5pUE5GRkVHRHlQc3JTS3A2U2dDN0VpZUFNS0J5ODJ5?=
 =?utf-8?B?T1Y5elhZQyt2WVBzcGxZMnlNVUJPZjlRMFFnS2ZqRGZ6bzZ5OC9HeUw4YkpQ?=
 =?utf-8?B?U2NmMHhXSnRJa3BTZndPYXR0YVVqOFRCMWhHMlFJUjMydzdrSDdOa3krc252?=
 =?utf-8?B?czYxYUJ3ZHE3OTlWTHErNEtWNHFkdThyWHRzbWJSbmpTbWhDTVFUek5nTkta?=
 =?utf-8?B?MjlXa0UvQ0FPUGljNG5iS0tIQ3Vrb0tZc2VidXdndXNPYUxHdUhGNzhPc0tQ?=
 =?utf-8?B?cXllM21VdkN5UnRBNGhTdHdvU0IwL2d2cDZGMHhKWHgvQUtRUmJ5TXNTZmd6?=
 =?utf-8?B?eEhFY3kzODdtN0ttVldpUGQxNWFkRVVvRjR6c1dXMFhBcWlYWXpQRERTUElk?=
 =?utf-8?B?TWQvS09ib1JKbjJCamsyMkxYcWtXYlRUclo0ekp3SFpJYnJET3p5bFBsYm44?=
 =?utf-8?B?MFczTnQ5UUdtYTNHMXBxRStIQjVqOGl0dTZ0RkIrQ2VoZmViWFEwRmgzbTlC?=
 =?utf-8?B?NHYxRm02WUxqbmUxeVVVKzlSM1pNOTF4T2tHTlB6UWpBQm9nZVREaWdZM0VJ?=
 =?utf-8?B?VzczeVBRUVQwR3VvRThKNW9Uamo1OWlNRmZQTTU3K0FOWEQrSENLQW52Wm13?=
 =?utf-8?B?cGtwZEl6UU9Rb3V6RmVSTi8ySlBFVzV4cU5uQjc2NmtZOC9vOUNodG1YdVRn?=
 =?utf-8?B?U2NicHNzSlRHaGd1WjFNenpmOEw2ODRmb2NMUGxoSGtqeGtxQ3RjUmp5bVpI?=
 =?utf-8?B?RWI2TkcvWFVsanA4OG5CWjlKWVAwTFczSFZuUzF4VlRrTzdVTHk3Y3NzTlY0?=
 =?utf-8?B?MFROb2RMRGJyQ2kzMEE5ZXYzQk1EQjBUQlN0OU5sY2k4WG8yZ3JjUHJiVUV3?=
 =?utf-8?B?WHJhdFVPZ0ZmdElIRjhDUnppOGtQUmo3S01KU3Ntc25qcUdWcWRLYWhrOEV4?=
 =?utf-8?B?ZmU0S1Bvci9TM2oyWVA4OGd5ckl5QWsvZHNVQzcwRlNaWVJqdXNBdHN5RDgr?=
 =?utf-8?B?UUt1bmJqVWhzTmdvRHQ1TUFLTDZmUlE5NEFTd0huOGd0SFgya2RiK3d1a0Rk?=
 =?utf-8?B?UGZ0bE1TYnVUMFlBSCtFdUxmeEFnTnkyRHEvUVJsZ20zUkFvcUZwWitmc0tP?=
 =?utf-8?B?MVRxWWtMd1BUSVdwTHFBRTU1QmpyejVldVNSVmdUeW1EZEpxaHdNNDlrcGhl?=
 =?utf-8?B?d005d3k2NldRT1A2RDdodU8rTDBoTEo0Z21jUU5MWVd6VGI3TkpSYVMwR1lJ?=
 =?utf-8?B?L0RxcUl6cXhhQnBwSGRONXBNR2tudU9tOEx1SEZ3eU80STFHR055YjVId0Jv?=
 =?utf-8?B?QUVXOHhFbG5oM1cxb21kTkR1MjBRVFNIWVlVR0pnS0gybmtNaVpCZG80bGhU?=
 =?utf-8?B?S2I1QVdaTHBTTEFJWmF4eG80Z2JYd2RVZUpoeDVBaU56RGdyalZOMXYvNklC?=
 =?utf-8?B?OTRyb1ZSTXdWVi9zUy9mNVYranNyRHlsNldXdjhyRHBlWnVSOXZReWpoakN4?=
 =?utf-8?B?LzdRbkk0OVEwMGovcnJuOGVNSk8xbVlOeEhLTDJVd1VTdFNPSmtWZTFTMWlE?=
 =?utf-8?B?dXN5MVBDY0QvaEJhbVAyTy9DRzRGS3AzbXhIeWJhZ21wQmllM2s3NndneFI3?=
 =?utf-8?B?clVGWnQzS3ZIYzd3Z2s5akQwaUs2RjNWSHB2clVjQjVuVHNGN1hMZTdPZTBL?=
 =?utf-8?B?TXlDQzlwelFKeGc1RjZJVnY5Z3lSUWt6M1dqZnpBNnZLT1Fla2M1R3k1Sno4?=
 =?utf-8?B?UkFTMURJMWtLdVN5YnpabHZvREFUSXVRdGlYbUNyc3B2WXZvMWRaVE1iaE9l?=
 =?utf-8?B?anpvNVBSS2VKdWQ4dzl3SGdHYWFpaTBCSi9YZklMcy9VbjVKc0s2bTlUeEFq?=
 =?utf-8?B?OGcwL3JJekxldFV5K3MrZGgxMm5PaDl0Qm1KWGdhbXdFYnNiR09SOHNjSEVp?=
 =?utf-8?B?WW1zQWl0QUdKQXlGVWVSQjVlL3JrUWVBMXlwQTRRNm9NK2JrbnhuV1Npd1Va?=
 =?utf-8?B?QzNhajhzU2V6cmNLcElBS0lqdUhMZG5BdmwrVnpJUEE2Ym5CQXRmWDJ5QWRm?=
 =?utf-8?B?OHllZnk2clFCN0h3L0JKNDBIN0FHR05vMjV5RzBUNHVrYVo3MXRmUE41MWlS?=
 =?utf-8?B?bmRjdnQxNjRQNXRVb0dEY1l3K2xXZ01vZzhYd2tkaTVKY1dweUFnblZOQ1FI?=
 =?utf-8?B?QXErdHE3WU04dzRVaHVXQ0VBQVhIbW5OMlVaZlhjcEE4czNkUkNZek02YnJS?=
 =?utf-8?B?WnFYVmFtTjhOQW0wazVUdUJkamRBPT0=?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7OihPque7qVPkXBVhMsAvvn2P2AI2/zm2X8ZIZp40nsmjakPgUM7bk5/1Oq8mdlh9c/8EuPEIi6emccH08XuDq9FRWQSq80vVRCT7M2KKBpHDvkfBmABMvi0MDuvSEeOz4+4NtI5HdoX+6VDvgOe+YJAsCluVx5IZG8Yy5WYRipMtLReJoDJDzCAzrrxCeuHUlFpqo7fNfEsoJpO72WMeiyZWCH+L8r9sYJcOnhEXg8vAj9dLm46AF9nolnhzIitLbuj6RG0Xdh+P3Lc6zXkktHodRzuUDZq+bJC6yfjaHOkBIGcmQ9qX76iKzy4FGagImxz2PPFz/BfXxk8YFMkKcdjWtifWbY7UYok8JeKI2oX7TYJV4gFGL4WCwGeJqw/n8zmFv4FtZnRjZQIsyjZdENY6vOJecVYg104xymQ7q90U6iaYkJkv7J2m5KTQUrF
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2026 16:42:50.8560
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21847e02-e830-427a-427a-08de6be817d5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003439.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4174

DQo+IE9uIDAyLzEzLzI2IDIwOjI3IFBpZXJyZS1Mb3VpcyBCb3NzYXJ0IDxwaWVycmUtbG91aXMu
Ym9zc2FydEBsaW51eC5kZXY+IHdyb3RlOg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYxIFJFU0VO
RF0gU291bmRXaXJlOiBBbGxvdyBQcmVwYXJlIGNvbW1hbmQgZm9yIFNpbXBsaWZpZWRfQ1BfU00N
Cj4gDQo+ID4gVGhhdCdzIGJlY2F1c2UgaXQgX0lTXyBhIGdvb2QgcmVzcG9uc2UuIElmIHRoZSBw
YXJ0IGlzIHJlcG9ydGluZw0KPiA+IE5vdEZpbmlzaGVkPTAsIHRoZW4gaXQncyBnb29kIHRvIGdv
IGFuZCB3ZSBkb24ndCBuZWVkIHRvIHRyZWF0IGl0IGFzIGENCj4gPiB0aW1lb3V0LiBUaGUgdGlt
ZW91dCBpcyBjYXVzZWQgYnkgdGhlIGRlYWRsb2NrIHRoYXQgUGllcnJlIG1lbnRpb25lZC4NCj4g
PiBGdWxsIENQX1NNIHdpbGwgYWx3YXlzIHRpbWVvdXQgYmVjYXVzZSB0aGF0IGNvZGUgaXMgaG9s
ZGluZyB0aGUgYnVzDQo+ID4gbG9jaywgd2hpY2ggYmxvY2tzIHRoZSBpbnRlcnJ1cHQgaGFuZGxl
ci4NCj4gPg0KPiA+IElnbm9yaW5nIHRoZSB0aW1lb3V0IGlmIE5vdEZpbmlzaGVkPTAgd2FzIGEg
d29ya2Fyb3VuZCB1bnRpbCBJIGZvdW5kDQo+ID4gdGltZSB0byBmaXggdGhlIGludGVycnVwdCBo
YW5kbGluZy4gT3RoZXJ3aXNlIGZ1bGwgQ1BfU00gd291bGQgbmV2ZXINCj4gPiB3b3JrLg0KPiA+
DQo+ID4gV2UndmUgbm93IGRlY2lkZWQgdG8gcmVwbGFjZSB0aGF0IGNvZGUgd2l0aCBhIHBvbGxp
bmcgbG9vcCBpbnN0ZWFkIG9mDQo+ID4gdXNpbmcgaW50ZXJydXB0cy4NCj4gDQo+IElPVyB0aGUg
c3VnZ2VzdGlvbiB3b3VsZCBiZSB0byB1c2UgUmljaGFyZCdzIHBhdGNoIGFuZCBmb3JjZSB0aGUg
ZHJpdmUgdG8NCj4gdXNlIGEgcmVndWxhciBzdGF0ZSBtYWNoaW5lLg0KPiBzZWUgaHR0cHM6Ly9n
aXRodWIuY29tL3RoZXNvZnByb2plY3QvbGludXgvcHVsbC81NjQ5DQpJIGNoZWNrZWQgdGhpcyBQ
Ui4gU2VlbXMgdG8gYmUgd29ya2luZyBhcyBleHBlY3RlZC4gQnV0LA0KDQo+IA0KPiBCdXQgaWYg
eW91IHdhbnQgdG8ga2VlcCBmb2xsb3dpbmcgdGhlIENQX1NNIHN0YXRlIG1hY2hpbmUsIHRoZW4g
eW91IGNvdWxkDQo+IGluZGVlZCBhZGQgdGhlIHJlcXVpcmVkIHdyaXRlIGluIGEgcG9ydF9wcmVw
KCkgcm91dGluZS4NCj4gVGhhdCdkIGZpbmUgYXMgd2VsbCwgeW91J2QgYmUgcmVseWluZyBvbiB3
aGF0IHRoZSBjb3JlIFNvdW5kV2lyZSBzdHJlYW0NCj4gbWFuYWdlbWVudCBwcm92aWRlcyAtIG5h
bWVseSBhIG1lYW5zIHRvIGRvIGRldmljZS1zcGVjaWZpYyBzdHVmZg0KPiBiZWZvcmUvYWZ0ZXIg
cG9ydCBzZXR1cC4NCnBsZWFzZSBpZ25vcmUgdGhlIHBhdGNoIGluIHRoaXMgdGhyZWFkLg0KSSBo
YXZlIHNlbnQgYSBuZXcgcGF0Y2ggdG8gZG8gaGFuZGxlIHRoaXMgaW4gY29kZWMgZHJpdmVyIGl0
c2VsZg0KIEFTb0M6IHRhczI3ODNBOiBhZGQgZXhwbGljaXQgcG9ydCBwcmVwYXJlIGhhbmRsaW5n
DQoNCg0K
