Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011026.outbound.protection.outlook.com [52.101.57.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC673C9452;
	Mon, 30 Mar 2026 11:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774871800; cv=fail; b=PrULF6KvDwe2apwu76D+M+TRxqfdfU2G2TgJL1nnsY07QA9dMO1OKwgjd6OBedPZSpXd+AJq9Ai1wVxM9axClSon7cDovkDQuyVL1qXIQASP42J/WTAa3aZrwIez/V8zX18AZSL+9tJgPYvYFlvfZKMCHgIPSu1JIaeIOgLc5Ao=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774871800; c=relaxed/simple;
	bh=rrhx64XQKdbsdiV73AmW2pqBSycoUk3BS7qYZfH6+Es=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=U1EKC65i92nkP+N4zOkI23L11C2tBnbASLOe0VgwmTJjtZt/UChMzpFP6tAopIM7Ox+m4/TLoQKrZwLCSXKPz0/IOtd8ff35IMLVtyBs0HZ9VXiSkesmW57KdkFCYtUIT8ClmJZdbGrNvJblVsr6o1vcjtPF+dIVwt69Yu46JEU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=I5IM+rNu; arc=fail smtp.client-ip=52.101.57.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="I5IM+rNu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xx29xeGcYN6OvQrF+cbYj0DCO0RtI6iKqiU43VPGF/lBLy6L54k6HW1spL0Xl81qmIfyVpp589Hw9zg+jczG8WS3S1GyDgLy1kppZoIxUXcwr2y5Ymp1TF6zC06tSndyfEEvTrJZFF0qTUUcnQChlA8CbSd0sznj6c2HKHnoS+3mJEs5eUFXnf5Q7/4wMMLZx/CH19ENshLzm6SS3PgV7FILuIsioGWz1KrUieLOqaM/kk/mfSwpEL9IWh0SnV/ERPNRkW/EEudZTK+YBOtSH3GkafkZU0dYodWkgcJCtTeUux0jAmsk6dilgC2tP8tZ8+GIo9y+QgIiuEZTnj4czQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rrhx64XQKdbsdiV73AmW2pqBSycoUk3BS7qYZfH6+Es=;
 b=HWGOEbW1yeUeYKnxOOVk/90f85wNyyNOnksf0sCCgCEyPXKuisjXf3yYmoeu+MrZY8HgBvUXMqaL/sz0G5pCPn/5MjE4SX6NgFUvykswNWbYuikhI1H6A46Or9RQAscM/tzEg5vEiJsNrO0EptPlL9HZNmQpMECLc7P6PsKmaVxpYL39Yui8t6txcza4O8n+TCKfSRVGdKwkknE7gcnVaBNFGVKtR46RaKXybPnNmUTo5pBn02PYnmlMX7mYyg/gjmOQX3ri7SAOYlXR1pEd3ZIWu+LqM7YMDJxuPfAb8c3Cfi7bd+9132xufvNfTmptr+68UxWx0riWYODosOfCEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=opensource.cirrus.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rrhx64XQKdbsdiV73AmW2pqBSycoUk3BS7qYZfH6+Es=;
 b=I5IM+rNuO72wb89ue6Mt28N5p+QAUu52RYuPEnXa+71cWDja4k8LXAkyJm3zzgsB87TRZ2cn6rSgdEzPe+zhsKZB9El0SUhX4Kg2CATctGpUlFGqjVTrQ/YObGV/Bl/UpcmKPTdx0Glrmu/pXms8Hra6ccOBNrK/1SWvgHcirtM=
Received: from BL0PR1501CA0016.namprd15.prod.outlook.com
 (2603:10b6:207:17::29) by CH0PR10MB4860.namprd10.prod.outlook.com
 (2603:10b6:610:db::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 30 Mar
 2026 11:56:35 +0000
Received: from BL6PEPF00020E66.namprd04.prod.outlook.com
 (2603:10b6:207:17:cafe::e2) by BL0PR1501CA0016.outlook.office365.com
 (2603:10b6:207:17::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.28 via Frontend Transport; Mon,
 30 Mar 2026 11:56:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL6PEPF00020E66.mail.protection.outlook.com (10.167.249.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Mon, 30 Mar 2026 11:56:35 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 30 Mar
 2026 06:56:34 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 30 Mar
 2026 06:56:34 -0500
Received: from DLEE204.ent.ti.com ([fe80::81dc:e6c6:4c37:9bc6]) by
 DLEE204.ent.ti.com ([fe80::81dc:e6c6:4c37:9bc6%14]) with mapi id
 15.02.2562.020; Mon, 30 Mar 2026 06:56:34 -0500
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
Subject: RE: [EXTERNAL] Re: [PATCH v2 2/4] ASoC: tac5xx2-sdw: add soundwire
 based codec driver
Thread-Topic: [EXTERNAL] Re: [PATCH v2 2/4] ASoC: tac5xx2-sdw: add soundwire
 based codec driver
Thread-Index: AQHcvUzWOQuDNQarQUaJRjLbh+fwrLXCh5oAgAP3g8A=
Date: Mon, 30 Mar 2026 11:56:34 +0000
Message-ID: <25d0ce626bd34dfc9e79d7fdc776f464@ti.com>
References: <20260326181712.2274-1-niranjan.hy@ti.com>
 <20260326181712.2274-2-niranjan.hy@ti.com>
 <acZgZnup3ENYl9SS@opensource.cirrus.com>
In-Reply-To: <acZgZnup3ENYl9SS@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E66:EE_|CH0PR10MB4860:EE_
X-MS-Office365-Filtering-Correlation-Id: 55d068d1-4ab4-4f52-e74f-08de8e536468
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|7416014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	1QPFqx4PY9yWnksac8EwpccqifGhFO7Ht7Yd9JilZr2LNJdWMDw0pmRfF4eScMv6kNCAKuFzbbSPf9lDvgIDGK58NDdsEvr66w1xWjv5LiS7FunitmEd4WGwpelT7w28oIbAb4q2myzo0wlmHPjOOgSDPANbL4Yq408Znqn1dMyJluJDXZAQef0jH4Cl7DL3x/vH7fafwbD7g+cZoeePi+5LQ0Ka9nnRKyek14A0qX7D4f3/q8fhCRfYIVpIh13bkQ+9vm4tmT6wtQhy1pIwG8iKylUB9zP8tAAw1xhO5st1YeEu4R4bkrRrJfhVNDYatUI5dhog/J9LllfnFvUsB4d1kQOwRh94vOqPAnHPqViQ16BWTLNKOyNJcYBxf79EE8vFG8JNc4zk4cHsqqTeBC70hxeayBp+x5bXv65YApR4DJNHqrUf8WOlud/FtaMdsqWuILaPMBcTpUL5SMOKFSQZfYDu1Rj9Oxs/2q30AHXEUDm3I+hGuvoD3GrCfESMdc977acb08zUDE+PMkizF8hdnWmjnc2GummRSVtni8Ke1+Ibha8aLwWjcGWyUB2BgNN/uxdR/YAfq6EQz+PXnDNlCrqr69JpOH7Wx8ZtSXRtiq2c7v1xQvtO3/1vvXcDieFHUkaA1NfgZoxdkwefpV/A7zV8Mo04LD0cLy+glfolQ+YyAxm/pHG+ksRVIapOEvi7qVd6ZRhY0FIsaiRn+Ou3mRO76ot+EWp1dBnwokKzYZv1Kzl9D40e2RZGwhOxf45hLZBIR2knoOlxqZxgRg==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(7416014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rtY5qWOUQ0FjneBrbKkonzi8u3yBFLn4yMcv8HexY7LP2l27arslaiU/ngC1aLWdTf+zrtgKPYA+zyOUOCpnFub3Tn++KVaJkfCZu87yLZ4edUiWnQSG1O2kcO+Zm0z85tTKgC+7Tok/imAE4lmyH4NQ+IH7QUO76QQoNj6/KMU0uHX+zarxU/aw4THIHIumQL7P7I6LteTLae87/84YPWQMAc5sXqWCNB+MBkp3EQfJMD/xdqWykGngqOMIIkYFSuxyx8zLBGsaCfh7SeTHiwKFFhTia0pE53+xER4i47Xhh4csHt365ATBgjZEGcV6SHRIukvf7SRsSojJZ0MdvjiQ5uVNB8BrXdqggPLxMkCq91bOFXhHS9BiyE3uJjINTBnaWIFJx1/zjIFZ8fRIGpH9NhzCg4sycPXBYhmk9RsWkA8VDSZ+0iTY76lz8H1y
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 11:56:35.0062
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55d068d1-4ab4-4f52-e74f-08de8e536468
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E66.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4860

DQo+IE9uIDE2OjE4LTIwMjYwMzI3LCBDaGFybGVzIEtlZXBheCB3cm90ZToNCj4gU3ViamVjdDog
OiBbUEFUQ0ggdjIgMi80XSBBU29DOiB0YWM1eHgyLXNkdzogYWRkIHNvdW5kd2lyZSBiYXNlZCBj
b2RlYyBkcml2ZXINCj4gT24gVGh1LCBNYXIgMjYsIDIwMjYgYXQgMTE6NDc6MTBQTSArMDUzMCwg
TmlyYW5qYW4gSCBZIHdyb3RlOg0KDQo+ID4gKwlTRFdfU0xBVkVfRU5UUlkoMHgwMTAyLCAweDI4
ODMsIDApLA0KPiA+ICsJe30sDQo+ID4gK307DQo+IA0KLi4NCj4gZG9kZ3kgRGlzQ28gb3IgaGFy
ZHdhcmUgaXNzdWVzIHRoYXQgbWFrZSB1c2UgZGlmZmljdWx0LCBzbw0KPiB0aGlzIGlzIG1vcmUg
b2YgYSBsb25nIHRlcm0gZ29hbC4gRnJvbSBzY2FubmluZyB0aGUgZHJpdmVyIGhlcmUNCj4gSSBh
bSBndWVzc2luZyBwZXJoYXBzIHRoZSBmaXJtd2FyZSBkb3dubG9hZCBtaWdodCBub3Qgd29yayBz
bw0KPiB3ZWxsIHdpdGggeW91ciBjdXJyZW50IHBhcnRzLiBCdXQgYSBsb3Qgb2YgdGhlIHJlc3Qg
bG9va3MgbGlrZQ0KPiBpdCB3b3VsZCBhc3N1bWluZyB0aGUgRGlzQ28gaXMgYWxsIGNvcnJlY3Qu
DQpUaGFua3MgZm9yIHRoZSBzdWdnZXN0aW9uLiBJIHdpbGwgc3RhcnQgdGVzdGluZyB0aGUgY2xh
c3MgZHJpdmVyDQpJbXBsZW1lbnRhdGlvbiBmb3IgdGhlIGN1cnJlbnQgZGV2aWNlcyB0byBpZGVu
dGlmeSBhbnkgZ2FwcyBhbmQNCnN0YXJ0IGNvbnRyaWJ1dGluZy4gVGhlIHBsYW4gaXMgdG8gZ28g
d2l0aCBjbGFzcyBkcml2ZXIgZm9yIG5leHQgSFcgdmVyc2lvbi4NCg0KUmVnYXJkcw0KTmlyYW5q
YW4NCg0KDQo=
