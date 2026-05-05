Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013051.outbound.protection.outlook.com [40.93.196.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1299A3264CF;
	Tue,  5 May 2026 10:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777977523; cv=fail; b=Gw4gpDVeNrJap8nuKxCvBFXSFtRyNz4dkSQOOrmAVMhgT+72hN2sQGto0g737cOVq3eOv//8U59ApRJo/uDlLC/06Y50b7K16ouNtp5+0894QmuQZ3foBoyqYDnym1D05GXReTnNj4rifLm2rbV0evUnbNBGBEThffm/mf1xX5g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777977523; c=relaxed/simple;
	bh=5t9GHRDSeRUPWXYc5lruNpYOgFIwMZkHncEFB4y7gOk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bZyTUzO4Ii4CtyJd/+6L0eGdS5qZN72QBjoFZ3JHJkdfp1vCv0ekreNrPpxuOXfA5PivqrLOBAF9sS6OjsRoNtUgwpKM+YXNiyIJZb0JzuwHl/0kp4GTPgG5sok5/S5VEFCiGJRE07VY/voa3DVyBY8+2XP7O4MHuM+UgfXP0JA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Sj6fnhcX; arc=fail smtp.client-ip=40.93.196.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Sj6fnhcX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S9qbnw9jiLV8G/UHqHTHxh/hWUfXY8YPBsIr9Ui/hESNRFuz9rlVbA4ZUFwdrxctnBFQMSBr3SGNZj2igI78URXGpvVxAFlchtAzhS1D6MIA9jE/fLOKNRATdkbgSYBYJWSdEChH/5DW/O+4ObRJg4X+1wYu+LVjxbd1pP35DH/GM2Ij/ijmaZA17sfZnsHWkfRQFQ2o8wVJUX3uVSCytEFHmA3TiaQ3LgwJ8mGeeiBgqxnSfURN0vG8KZ9ZAS4/jEr1Ma16yJ5XPXVjQeYjIuzXBMQ6ViGaQOFpLp9c2Xy8ymLIsK3Qan/yrLI5KO5HCCmw22WnhmoNLEHa8JhHpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5t9GHRDSeRUPWXYc5lruNpYOgFIwMZkHncEFB4y7gOk=;
 b=j0APKAs8KOboV0XJKL4wkhZQ3BOXve821xv9jD1LTxPfn4gbrh9WyV2+NUeRLfnhqzrk9L7jc+959Kv1c209V3LMVoEp8FoDowBXMeV9CYj0CCOdI1jAqaIJx2Tsps9p+QA51cPtCDgxvlaN022Hl9TCPXs01paCFUQqUMOMKlIG0mKFckG1YxFet5zA7dtlVF51VzspxObK1TWwesaEoUVyFGaHlCAJvGxYXd+4q4Ak9khMsyD5vp/Sh7StzsL4uABrv3Temi2VSu6ak4rb6tQ4o1jgO701KbRRm/huFCs0qhCuU9IUhqnw6Gs1kDvT+kgv54cyTr1c+lJ1u/nxdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=linux.dev smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5t9GHRDSeRUPWXYc5lruNpYOgFIwMZkHncEFB4y7gOk=;
 b=Sj6fnhcXq4OuFIFX7QzpaoeG7d/YjWJjpi+z7Opqg0yA851srh10Hjsn4rr/lqBvzLZpb+KDZKmNLoDsgkbH/OaRiQLZNNfAQnkN4sEy9/qzUb7FP1sHN0paYAoh3RIYI9KA7VKWwGlVtvtKo+hciHU30G5LRxU0lwERF7j9hew=
Received: from BN1PR13CA0021.namprd13.prod.outlook.com (2603:10b6:408:e2::26)
 by CY8PR10MB7145.namprd10.prod.outlook.com (2603:10b6:930:70::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 10:38:39 +0000
Received: from BN2PEPF000044A1.namprd02.prod.outlook.com
 (2603:10b6:408:e2:cafe::a9) by BN1PR13CA0021.outlook.office365.com
 (2603:10b6:408:e2::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.14 via Frontend Transport; Tue,
 5 May 2026 10:38:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN2PEPF000044A1.mail.protection.outlook.com (10.167.243.152) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Tue, 5 May 2026 10:38:38 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 05:38:37 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 05:38:37 -0500
Received: from DLEE204.ent.ti.com ([fe80::81dc:e6c6:4c37:9bc6]) by
 DLEE204.ent.ti.com ([fe80::81dc:e6c6:4c37:9bc6%14]) with mapi id
 15.02.2562.020; Tue, 5 May 2026 05:38:37 -0500
From: "Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Mark Brown
	<broonie@kernel.org>
CC: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"ckeepax@opensource.cirrus.com" <ckeepax@opensource.cirrus.com>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>, "perex@perex.cz"
	<perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
	"cezary.rojewski@intel.com" <cezary.rojewski@intel.com>,
	"peter.ujfalusi@linux.intel.com" <peter.ujfalusi@linux.intel.com>,
	"yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>,
	"ranjani.sridharan@linux.intel.com" <ranjani.sridharan@linux.intel.com>,
	"kai.vehmanen@linux.intel.com" <kai.vehmanen@linux.intel.com>, "Xu, Baojun"
	<baojun.xu@ti.com>, "Ding, Shenghao" <shenghao-ding@ti.com>, "Kasargod,
 Sandeep" <sandeepk@ti.com>, "Hampiholi, Vallabha" <v-hampiholi@ti.com>
Subject: Re: [PATCH v15 2/4] ASoC: tac5xx2-sdw: add soundwire based codec
 driver
Thread-Topic: [PATCH v15 2/4] ASoC: tac5xx2-sdw: add soundwire based codec
 driver
Thread-Index: AQHc3HtUzKGcZvzIXESe+LlFuWcQ+g==
Date: Tue, 5 May 2026 10:38:37 +0000
Message-ID: <5279216f15c144eb84ef39fe53ea0386@ti.com>
References: <20260504125716.2015-1-niranjan.hy@ti.com>
 <20260504125716.2015-3-niranjan.hy@ti.com> <afikt0VzLDHrTjvM@sirena.co.uk>
 <71f22f63-c772-42c5-86e2-2703be7fb056@linux.dev>
In-Reply-To: <71f22f63-c772-42c5-86e2-2703be7fb056@linux.dev>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A1:EE_|CY8PR10MB7145:EE_
X-MS-Office365-Filtering-Correlation-Id: fa5348d2-ecea-48fd-5bfe-08deaa9277d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|1800799024|36860700016|10063799003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	v/G6cTHgt2TenoLD5w5Fuop7fL1bCdx+5dQxDSyImYL8nty3Ntuden6LNylYCVBqDk5pTp/mhurhBfj2F2NXQhiZPDTa9emaNw3OGjqwi3QN5w3CgeLgTjqL/FyPxx1WZNUKoKCJE/DiVyOdF7yDagWfjVV2gz42u4dUTlHEEIddDzEZYnr6y6rFse8HemZMJ058Tal2mOdzsRWXWWXyniKPU3iHm+LULDz4XuGqoWHCY9kVB3GvwjZYvnIbkGv23PdPFEpIf1f2XT7gu3KXvhfilqj+m7Nxpd5yYES7V/8rOK+Y72avTd+WDV/0NQk+EHoE+Wvzj7a/rQZQaUStB1CEK0sNX1+rXzk1xjTj+/38qWB6aGbWwQLvzGjbY2QGahb/3C01AinN4k0FUGABROmBNF3p7Gzs0QW71a/wqb9Qzbt0vM0RhOeloZfNy1XlpCqLgflrkYfjSHCutBorZbXm2Rx4RnfYNEGxUggvP1ffFeod4vjb6Npj9rYGnQiuAyTEVbbrJXYxMg6HWncCrMY0ujrvpV9MW4KQpG86lG24Ttlc2AvwVFlIxbsEamufj8bU8AWH2cJZIzmMVnHj8ZbUw2/yDQ4przhikWoY4TN5bc9P5g7KaFsdEEo3+P3VwPeIVWDmYCKg+g8tG+e3ptaLWztxV2EFo738F7uedO4dHD/dZzfQaNqYflIOyklSRGj3aFLtxX++vRBRwtEU3gvecjdWcJytNU1vZKcTZrc=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700016)(10063799003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	w2tPwWz5p0dw1/4zXGcoZK/C7bbfY20+WEKfzliUfFoWdDCn4qth3UXTaUKsNwJXwzZnGj0tJBMUOl4L5fsFhf/G/44QjI0oGqz4FXVLhNub7wASfS6LIie5yF+CoetZhMnqARPYEWSgbDZkRxYA7+PxCHwSehbAUzGZAovGpQOkd6fU9d2aaJ+XMJktmYRUWogqGdmKBkvm81sZhlpNkBDuBYvsHEmYHINiMOtAAiKuyuKEVLa9yAmCRYV9LTXprxhXWnPPlV9FSTuDJIKEA5nbydvmxRml5K41pgeidPSAbI5+7N1JhotHTPAz1hABm7OBfmeD86jW8MINlr6DRWmJ6A6+5DC5/vWC8VKkTeToMxe7Ii0UiRZcOM/yNqc/d834qSS0+2/qtBTrmyyZ7SCOGhkKpRmAW4AOSxzerFbLSy6kYCgeA80+bfHX0wj/
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 10:38:38.4038
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa5348d2-ecea-48fd-5bfe-08deaa9277d0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7145

PiBPbiAyMzoxMS0yMDI2MDUwNCwgUGllcnJlLUxvdWlzIEJvc3NhcnQgd3JvdGU6DQo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggdjE1IDIvNF0gQVNvQzogdGFjNXh4Mi1zZHc6IGFkZCBzb3VuZHdpcmUg
YmFzZWQgY29kZWMgZHJpdmVyDQo+IA0KPiBPbiA1LzQvMjYgMTU64oCKNTIsIE1hcmsgQnJvd24g
d3JvdGU6DQo+ID4gT24gTW9uLCBNYXkgMDQsIDIwMjYgYXQgMDY6Mjc6MTRQTSArMDUzMCwgTmly
YW5qYW4gSCBZIHdyb3RlOg0KPiA+PiBBZGQgY29kZWMgZHJpdmVyIGZvciB0YWM1eHgyIGZhbWls
eSBvZiBkZXZpY2VzLg0KPiA+DQo+ID4+ICtzdGF0aWMgczMyIHRhYzV4eDJfc2RjYV9kZXZfcmVz
dW1lKHN0cnVjdCBkZXZpY2UgKmRldikNCj4gPj4gK3sNCj4gPj4gKwlzdHJ1Y3QgdGFjNXh4Ml9w
cnYgKnRhY19kZXYgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsNCj4gPj4gKwlzdHJ1Y3Qgc2R3X3Ns
YXZlICpzbGF2ZSA9IGRldl90b19zZHdfZGV2KGRldik7DQo+ID4+ICsJdW5zaWduZWQgbG9uZyB0
Ow0KPiA+PiArCWludCByZXQ7DQo+ID4NCj4gPj4gKw0KPiA+PiArCS8qIERldGVjdCBhbmQgc2V0
IGphY2sgdHlwZSBmb3IgVUFKIHBhdGggYmVmb3JlIHBsYXliYWNrLg0KPiA+PiArCSAqIFRoaXMg
aXMgcmVxdWlyZWQgYXMgamFjayBkZXRlY3Rpb24gZG9lcyBub3QgdHJpZ2dlciBpbnRlcnJ1cHQN
Cj4gPj4gKwkgKiB3aGVuIGRldmljZSBpcyBpbiBydW50aW1lX3BtIHN1c3BlbmQgd2l0aCBidXMg
aW4gY2xvY2sgc3RvcCBtb2RlLg0KPiA+PiArCSAqLw0KPiA+PiArCWlmICh0YWNfaGFzX3Vhal9z
dXBwb3J0KHRhY19kZXYpKQ0KPiA+PiArCQl0YWM1eHgyX3NkY2FfaGVhZHNldF9kZXRlY3QodGFj
X2Rldik7DQo+ID4+ICsNCj4gPj4gK3JlZ21hcF9zeW5jOg0KPiA+PiArCXJlZ2NhY2hlX2NhY2hl
X29ubHkodGFjX2Rldi0+cmVnbWFwLCBmYWxzZSk7DQo+ID4+ICsJcmVnY2FjaGVfbWFya19kaXJ0
eSh0YWNfZGV2LT5yZWdtYXApOw0KPiA+PiArCXJldCA9IHJlZ2NhY2hlX3N5bmModGFjX2Rldi0+
cmVnbWFwKTsNCj4gPj4gKwlpZiAocmV0IDwgMCkNCj4gPj4gKwkJZGV2X3dhcm4oZGV2LCAiRmFp
bGVkIHRvIHN5bmMgcmVnY2FjaGU6ICVkXG4iLCByZXQpOw0KPiA+DQo+ID4gV2UgZG8gdGhlIGph
Y2sgZGV0ZWN0IGJlZm9yZSB3ZSByZWluaXRpYWxpc2UgdGhlIHJlZ2lzdGVycywgbWVhbmluZyB0
aGUNCj4gPiBkZXZpY2UgaXMgc3RpbGwgaW4gY2FjaGUgb25seSBtb2RlIGFuZCB2b2xhdGlsZSBy
ZWFkcyB3aWxsIGFsbCByZXR1cm4NCj4gPiAtRUJVU1kuDQo+IA0KPiBJbmRlZWQsIGFuZCB0aGVy
ZSdzIGFsc28gYW5vdGhlciBzZXQgb2YgaW5pdGlhbGl6YXRpb25zIHRoYXQgd29uJ3QgaGFwcGVu
IGluIHRoZQ0KPiBpb19pbml0Lg0KPiANCj4gSXQncyBhIGJpdCBjb21wbGljYXRlZCBiZWNhdXNl
IHdlIGhhdmUgdG8gZGVhbCB3aXRoIGRldmljZSBhdHRhY2htZW50IGFuZA0KPiBzdXNwZW5kLXJl
c3VtZSwgYW5kIHRoZSB0d28gcGFydHMgYXJlbid0IG5lY2Vzc2FyaWx5IGVxdWl2YWxlbnQuDQo+
IC0gd2hlbiByZXN1bWluZyB0aGUgYnVzIHRoZSBjb2RlYyB3aWxsIGFsc28gYmUgcmVzdW1lZA0K
PiAtIGJ1dCB0aGUgZGV2aWNlIGNhbiBnbyB0byBydW50aW1lX3BtIHN1c3BlbmQgd2hpbGUgc3Rp
bGwgYXR0YWNoZWQgb24gdGhlIGJ1cw0KPiAoZS5nLiBpZiBhbm90aGVyIGRldmljZSBpcyBhY3Rp
dmUgb24gdGhlIHNhbWUgYnVzKS4NCj4gDQo+IE90aGVyIGRyaXZlcnMgaGF2ZSByZWdjYWNoZV9j
YWNoZV9vbmx5KHRhY19kZXYtPnJlZ21hcCwgZmFsc2UpOyBpbiB0aGUgdHdvDQo+IHBhdGhzIChp
b19pbml0IGFuZCByZXN1bWUpIHRvIG1ha2Ugc3VyZSBib3RoIGNhc2VzIGFyZSBoYW5kbGVkLg0K
DQpJIHdpbGwgcmVvcmRlciBhbmQgZml4IGl0IGluIG5leHQgcGF0Y2guIA0KDQpUaGUgcmVhc29u
IHRoZXJlIHdhcyBubyBlcnJvciB3aGlsZSB0ZXN0aW5nIGlzIHRoYXQsIHRoZSBjYWxsYmFjayBh
bHdheXMgd2FpdGVkIGZvciANCiJhdHRhY2giIHRvIGZpbmlzaC4gIER1cmluZyBhdHRhY2ggd2Ug
Y2FsbCByZWdjYWNoZV9jYWNoZV9vbmx5KHRhY19kZXYtPnJlZ21hcCwgZmFsc2UpIGJlZm9yZSBj
YWxsaW5nIGlvX2luaXQuDQoNClJlZ2FyZHMNCk5pcmFuamFuDQo=
