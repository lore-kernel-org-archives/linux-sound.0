Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012039.outbound.protection.outlook.com [40.107.209.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83303976A1;
	Tue, 24 Mar 2026 15:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774366865; cv=fail; b=EtiGDw6HeIwUIwoQ/W9DbZKxlu+16iQa6Eqxq55ElbuthRZtyPENafsQEjmKB7iQecED1IzkrOeMz/n41ZpRbaqcBWFx9i9MvhCuYFzs7NTLojhZS31TDPfETi1uZMZbTixTEer8gQlOed36kb3qJ4ai9EICfokUVYpRiERG6c0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774366865; c=relaxed/simple;
	bh=ckXkvUaiFohGmcI5xTk69K8lxpp7cqWN89l1MoBa+Vo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jhrvWWG72guaO2hZX+ASHbiNRDO7OBclxK1Oz/xQsbboZDatMCSvDqyBnYScV12pV8FLbTDGHC+1k6uTbnn8TauPuZzUhwcURQVTtYXHq9DpUSDRGcqUAexNh5CPcssYInNRbfCz8qQTzDB+AtepDBqrf9+8oVb8CvIRHfi70z0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=QoW0dhLK; arc=fail smtp.client-ip=40.107.209.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="QoW0dhLK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y1fg/E5BPdLwG0XglCL3NWv63/hkscpc7C5wfDNnfBHJowMS02RlVw8d1s+C5wnLUqFEQ3O/wp6TuLcXFyZooFu9rZ+vMDmXvSuYwEwGFwva1HsS5CL3N0Ao/X30CkU7fsRvglOYi7zpoBSqEd7RBBApG+VWPHTWReZIglbHzO7BFyznQe87q3e/wRPShApb+c0ydpoz6o9ho750b+qqIXQ58NMrtp3QLcVjZpawoacE2A1DtPqwdsnUDjcsDqKKXjoGLHcSHkco2SedEhlnNNsvMNQgpJX0GN3gzpt+67Q14vidjdD586Rnb1AJ20/9n+BqYO3wjFCXyhPw7j1KCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ckXkvUaiFohGmcI5xTk69K8lxpp7cqWN89l1MoBa+Vo=;
 b=gexrOV8MsoCOOSljOYVlggBFNdjvemLv/N7cVG+F7u/1VAju9Ir9heKztHu2Pr7tAX0TDUoKamrBq27sMPiTlwsLuZe+1n/Q7FcLXP3q4y+sVpeSXopGzy0O/Z3NYjykqdywmk4o9MeJ1BtJS2Lk2WNhIZbWmFaf3Zoj3RBrFh8de83pCIMQi7TdrLMs+w2Y5R6iIF+50KoIauXEOJQF1+PAhfzmnqxLKMhwChYcZevIkOC/q1Lc9SwhpSLfIoLLlNM8mVOYmlGSjuAZb5m0L5hGAzt7Ix2+or4PiTXSj2soJc8gYh/utNzalmvWVY9gG70Uo2dhcvBg3XBKCjBuUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=opensource.cirrus.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ckXkvUaiFohGmcI5xTk69K8lxpp7cqWN89l1MoBa+Vo=;
 b=QoW0dhLK1F50EgpqjtU0v9MnauvURcAVRRQsBBxvSPScw62DrVh8UUXJBH4gDf1gIK0egMUsMvnrYZjFLqsoXoFseM/tVwoc60QokwjntZoRHYUZV3dnzvml1xYkGYkmeYgxwcRKWv4CkmC74PgjuiYPB9u0G1MUgZCVJZKzz3o=
Received: from BL1PR13CA0133.namprd13.prod.outlook.com (2603:10b6:208:2bb::18)
 by CO1PR10MB4801.namprd10.prod.outlook.com (2603:10b6:303:96::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 15:40:56 +0000
Received: from BN1PEPF00006002.namprd05.prod.outlook.com
 (2603:10b6:208:2bb:cafe::32) by BL1PR13CA0133.outlook.office365.com
 (2603:10b6:208:2bb::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Tue,
 24 Mar 2026 15:41:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN1PEPF00006002.mail.protection.outlook.com (10.167.243.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Tue, 24 Mar 2026 15:40:56 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Mar
 2026 10:40:50 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Mar
 2026 10:40:50 -0500
Received: from DLEE204.ent.ti.com ([fe80::81dc:e6c6:4c37:9bc6]) by
 DLEE204.ent.ti.com ([fe80::81dc:e6c6:4c37:9bc6%14]) with mapi id
 15.02.2562.020; Tue, 24 Mar 2026 10:40:50 -0500
From: "Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
CC: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"broonie@kernel.org" <broonie@kernel.org>, "lgirdwood@gmail.com"
	<lgirdwood@gmail.com>, "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com"
	<tiwai@suse.com>, "cezary.rojewski@intel.com" <cezary.rojewski@intel.com>,
	"peter.ujfalusi@linux.intel.com" <peter.ujfalusi@linux.intel.com>,
	"yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>,
	"ranjani.sridharan@linux.intel.com" <ranjani.sridharan@linux.intel.com>,
	"kai.vehmanen@linux.intel.com" <kai.vehmanen@linux.intel.com>,
	"pierre-louis.bossart@linux.dev" <pierre-louis.bossart@linux.dev>, "Xu,
 Baojun" <baojun.xu@ti.com>, "Ding, Shenghao" <shenghao-ding@ti.com>,
	"Kasargod, Sandeep" <sandeepk@ti.com>, "Hampiholi, Vallabha"
	<v-hampiholi@ti.com>
Subject: RE: [EXTERNAL] Re: [PATCH v1 2/4] ASoC: tac5xx2-sdw: add soundwire
 based codec driver
Thread-Topic: [EXTERNAL] Re: [PATCH v1 2/4] ASoC: tac5xx2-sdw: add soundwire
 based codec driver
Thread-Index: AQHcunu9/jnUBySI0E6tRb9u0/HXgbW916yA///m0oA=
Date: Tue, 24 Mar 2026 15:40:50 +0000
Message-ID: <9864e705c75a4156be957df8d1aba449@ti.com>
References: <20260323041545.2101-1-niranjan.hy@ti.com>
 <acJtGVN5nOTvFnxg@opensource.cirrus.com>
In-Reply-To: <acJtGVN5nOTvFnxg@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00006002:EE_|CO1PR10MB4801:EE_
X-MS-Office365-Filtering-Correlation-Id: d2512cfb-62bf-4990-106e-08de89bbbd82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700016|82310400026|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	TXX1FDxQqrAsdnaEN+YiFxJ2VROmDc1Qc8rosWZfm2AJ8x6OlWU1CCNZBuFf3Y8HOxqd4NmTvFoFWddizycVwWMLdONq4ad9V+AijNVlYgiJHQrFEBafb0RiJ5peOORgZH2NJ8cVqRsTE+yZ6ZTtg958YgRhvqAjTAtznn7+upRB6RqT22P6KViqW9217A83YWzVsqKdEUDizyzqJth3dHUstBOECwcQL4sJKa4faL5moQNIxj0hOlTI850+xK9/++FSsZuPe39n9+3Cx3es7FiCcqCjuKQqxNJ//YwNCyQdxgP2ZiXu48akZHUGLXdneW0oR5Kb/oNgieS5+ozhI0wd0Wz6LjrXiNjtFrOiLrKIxdJNJwRqibdVFFqXzfJ6ur8yMOyE1ADpFT6E2BzNYdXTfIYJzyUOq9oLEQJV5Ou1KfIKG6kTICasqfsZO2K+4qxe3oQSgCQMBsO2Jpw6HtCjgfV9htRyiZixlhA89FEFL1tQc5Fo+3RZjFUe8LtcJoJVSS8Qu4ZZXYGhNK2D3gnXcWVU+q12o6bsa0q1TyC29OQLvPBCUvBWYwib9qwy7MTnSPvwDGV7zWdR+tdfMu8mld2r1mwMyc8qLbDcNmDeCZdsFDZiKU2+j8uL1kzIXOdfkiR71BDKKo2JXvNWYH28WfgYgu+q9eQ3yvvHgkeh44zgd108elGH+qMRV0MBd04Ri5bvSDfu1qXrO5shckjwXfZ0gWNOtbSYqKG74uVyK1fgNYKX63Ww2Hcmf19ppH6uy7cFIuLePYxOeGjPaA==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700016)(82310400026)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	89LG95xVSm4OWXbdaTaXnaefSUqteWA4vh1ciF4J4dXuz3DjFkEui9njW4j+7Cn+A0a3qzev+++6SZ+ULBQ+xBnzTnQVxI7nyzv2iWgD13Uu0ef3jLzneJH1S9+puYZxye8ex+qpPaIjgvJu41XxPXy7R0vitKFutQfS4BGVNqDr96DP4gNalKsOk3/QYrv+IlYJ+erI9fN69wEeDZjIJh2kpKfup/JwejDvvmj2vKiectdPOYMuSRrHkFExsqQMUldtVMHNr1RSOsmvSKG2Ntfep3JF+lQBWC1b+ue+EG4Hav6ES378uLUo7nijraI1BI1zHulfPIpCthfC5XvEVuqz5Spy3fwsX+Du0WR52ZIIXTBYsGkTnLPNyj0HlEsA0czNhgbPE+rv20HTdOXHkitAevdf4cX5pCZrB6RblceqMj5kBzfawXC44SD3g3uh
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 15:40:56.3364
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2512cfb-62bf-4990-106e-08de89bbbd82
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00006002.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4801

PiBPbiAxNjoyMy0yMDI2MDMyNCwgQ2hhcmxlcyBLZWVwYXggd3JvdGU6DQo+IFN1YmplY3Q6IFJl
OiBbUEFUQ0ggdjEgMi80XSBBU29DOiB0YWM1eHgyLXNkdzogYWRkIHNvdW5kd2lyZSBiYXNlZCBj
b2RlYyBkcml2ZXINCj4gT24gTW9uLCBNYXIgMjMsIDIwMjYgYXQgMDk6NDU6NDVBTSArMDUzMCwg
TmlyYW5qYW4gSCBZIHdyb3RlOg0KDQo+ID4gKwlyZXR1cm4gcmVnbWFwX3dyaXRlKHRhY19kZXYt
PnJlZ21hcCwNCj4gPiArCQkJICAgICAgIFNEV19TRENBX0NUTChmdW5jdGlvbl9udW1iZXIsIGZ1
X2VudGl0eSwNCj4gPiArCQkJCQkgICAgVEFDX1NEQ0FfQ0hBTk5FTF9NVVRFLA0KPiBjaGFubmVs
KSwNCj4gPiArCQkJICAgICAgIG11dGUpOw0KPiANCj4gSWYgYWxsIHRoaXMgZG9lcyBpcyB3cml0
ZSB0aGUgcmVnaXN0ZXIgd2h5IG5vdCBqdXN0IHBhc3MgdGhlDQo+IHJlZ2lzdGVyIHRvIHRoZSBE
QVBNIHdpZGdldCBhbmQgbm90IGJvdGggaGF2aW5nIGEgY2FsbGJhY2sgYXQNCj4gYWxsPw0KPiAN
Cj4gU2FtZSBmb3IgbWFueSBvZiB0aGUgb3RoZXIgcG93ZXIgY2FsbGJhY2tzLg0KV2lsbCBmaXgg
aXQgaW4gbmV4dCB2ZXJzaW9uIGZvciB0aG9zZSB3aGljaCBkb2Vzbid0IG5lZWQgZXhwbGljaXQg
aGFuZGxpbmcuDQoNCj4gPiArCQlkZXZfZXJyKHRhY19kZXYtPmRldiwNCj4gPiArCQkJImVycm9y
OiBvcGVyYXRpb24gd2l0aG91dCBodyBpbml0aWFsaXphdGlvbiIpOw0KPiA+ICsJCXJldHVybiAt
RUlOVkFMOw0KPiA+ICsJfQ0KPiANCj4gVGhpcyBpcyBhIGJpdCB3ZWlyZCBzaG91bGQgdGhlc2Ug
bm90IGJlIGhhbmRsZWQgYnkgcnVudGltZQ0KPiByZXN1bWU/IFRoaXMgaGFwcGVucyBpbiBhIGNv
dXBsZSBvdGhlciBvZGQgcGxhY2VzIHRvby4NCkkgYW0gb2JzZXJ2aW5nIHRoZSBmb2xsb3dpbmcg
c2VxdWVuY2UgZHVyaW5nIHRoZSBwbGF5YmFjayByZXN1bWUgZnJvbSBsb3cgcG93ZXIgbW9kZSAo
IHdpdGggLmlkbGVfYmlhc19vbiA9IDAgKSANCkRldmljZSBnZXRzIGRldGFjaGVkIGZpcnN0LiBU
aGVuIHRyaWVzIHRvIHJlc3VtZS4gVGhlbiBod19wYXJhbXMgaXMgY2FsbGVkLiBUaGVuIGdldHMg
ImF0dGFjaGVkIi4NClNvIHdhaXRpbmcgZm9yIGF0dGFjaGVkIHRvIGdldCBjb21wbGV0ZWQgYmVm
b3JlIHByb2NlZWRpbmcgd2l0aCAuaHdfcGFyYW1zLg0KDQo+ID4gKw0KPiA+ICsJcmV0ID0gcmVn
bWFwX3dyaXRlKHRhY19kZXYtPnJlZ21hcCwgU0RXX1NEQ0FfQ1RMKGZ1bmN0aW9uX2lkLA0KPiBw
ZGVfZW50aXR5LA0KPiA+ICsNCj4gVEFDX1NEQ0FfUkVRVUVTVEVEX1BTLCAwKSwNCj4gPiArCQkJ
ICAgMHgwMyk7DQo+IA0KPiBBZ3JlZSB3aXRoIFBpZXJyZSBpdHMgYSBiaXQgd2VpcmQgdG8gYmUg
aGFuZGxpbmcgUERFcyBvdXRzaWRlIG9mDQo+IERBUE0sIGF0IGxlYXN0IGEgY29tbWVudCB0byBl
eHBsYWluIHdoeSB3b3VsZCBtYWtlIHNlbnNlLg0KSSB3aWxsIGZpeCB0aGlzIGluIG5leHQgcGF0
Y2guDQoNClJlZ2FyZHMNCk5pcmFuamFuDQo=
