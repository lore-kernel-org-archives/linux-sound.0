Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010016.outbound.protection.outlook.com [40.93.198.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E89F345CAB;
	Mon, 20 Apr 2026 14:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776693843; cv=fail; b=fnzLAhiU8E66t0Lo6yCLSMPBsrM70vvgAuk3z2ZRlHNxTEtiD3PcSpx6U8qLchn3Vn6eM26UdboAzYS9OJFczugG9ysclCBUJVvxnKqZCyhw8Oh/cNINy1ZJ3phg37yEhEblpzVzrq49MkLC7/Xvz7HvcXUQ3Ss8deoS5gp4bgk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776693843; c=relaxed/simple;
	bh=manPy2L6H7UhvyVCDFw1oIiOf3OQBDid8nmmEKQjsZ0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BQ0X5FXqx9gRTuERx13Y6VvfDaILiYzpxZokA8J6oJy8x6Lz1nqvN4QKRVoWH/gc2sX0zs8paeCRKEishti2egi3O4XK7nmg4nIQYRBUE4JmRD+D7sdkJWCR8aPfccM0nvovAU4DKwcPjlkHv3preYFPK9h3zldCx2giHYiYVx4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=M5yv8PJG; arc=fail smtp.client-ip=40.93.198.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="M5yv8PJG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iZErZ1B009AFHRhyp9yUm/S/s9/EQraejGIYzCx8zE4IH72gFQifIbe5gDQKXhERMSkmVbgnaqnp+a4aywD02iQHeyxB/PYSUzI4fTlIB4YoRd4FORdwIt0h1ZGOp2Hpf8p6iC446TtyZ830yXja7EZaYZILAEHaTZqN5ZNW+VrIrBEcmtjTWUW9F8MBPPyfeFtueo/m8Q94BH+CZAijRBYTpmdDr30MZvrH8pY+rs1isahW8YxZGVQ+0g8tsBXT7pHxlsrp9nFHD519yIPEs0RCdEFY0SlY+FAhsbjqUvQ5JHJZzvA8rTd4/TYp0caw0MDlikgPOlIVRwxFtDPdjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=manPy2L6H7UhvyVCDFw1oIiOf3OQBDid8nmmEKQjsZ0=;
 b=Wbu33Ov9Y8wbhiq49wv8y7Q/gjb1Rf9yVhLhD831TvR9LEjO2p8y8Z8ZZrYGQx0goRnySRAHOz7vX5cl8Lbmh9w5kcnAqr/HxQvUV86UWRKBojA0T1ftgW6DAsywTQXT/AnwSrNMBlYQyJ5ngnRcJo4W0oh8LysZeS++0QZ3GndNcxRLXWf0lgUoO3FKkHF5WVkJmg8+UJB15hiHRsCu7B+of5l46tGNkfIhztSGoHTMS67FCXPweHbWDXU0/9u9sXtawwpmUNUpSw1wa8sLmSi6kfzrc+T8tXcBwwGhCwIVv/x7JPFDCdrZU/NkLze6/yxH4s5pkOXBrCxy/rLipA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=linux.dev smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=manPy2L6H7UhvyVCDFw1oIiOf3OQBDid8nmmEKQjsZ0=;
 b=M5yv8PJGBjkozVt17/8r7NV+IciKlmeqzXv9b51DMr07Ziv0WM2JPdpLI4lZ45n/TNZQt+zjGOxx8HxySqyFX+qCH4qoIfpqvGkI1uvntKVZLpEctyUoZL/4k2FTDp4OKrqOSTfsF8hMnOjfv/mhQi50RZJ3N/cXBoV4dJwAfQk=
Received: from MN0PR04CA0028.namprd04.prod.outlook.com (2603:10b6:208:52d::27)
 by LV8PR10MB7798.namprd10.prod.outlook.com (2603:10b6:408:1f7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Mon, 20 Apr
 2026 14:03:59 +0000
Received: from BL02EPF0001A108.namprd05.prod.outlook.com
 (2603:10b6:208:52d:cafe::4e) by MN0PR04CA0028.outlook.office365.com
 (2603:10b6:208:52d::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 14:03:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL02EPF0001A108.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 14:03:56 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 20 Apr
 2026 09:03:35 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 20 Apr
 2026 09:03:35 -0500
Received: from DLEE204.ent.ti.com ([fe80::81dc:e6c6:4c37:9bc6]) by
 DLEE204.ent.ti.com ([fe80::81dc:e6c6:4c37:9bc6%14]) with mapi id
 15.02.2562.020; Mon, 20 Apr 2026 09:03:35 -0500
From: "Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Charles Keepax
	<ckeepax@opensource.cirrus.com>
CC: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"broonie@kernel.org" <broonie@kernel.org>, "lgirdwood@gmail.com"
	<lgirdwood@gmail.com>, "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com"
	<tiwai@suse.com>, "cezary.rojewski@intel.com" <cezary.rojewski@intel.com>,
	"peter.ujfalusi@linux.intel.com" <peter.ujfalusi@linux.intel.com>,
	"yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>,
	"ranjani.sridharan@linux.intel.com" <ranjani.sridharan@linux.intel.com>,
	"kai.vehmanen@linux.intel.com" <kai.vehmanen@linux.intel.com>, "Xu, Baojun"
	<baojun.xu@ti.com>, "Ding, Shenghao" <shenghao-ding@ti.com>, "Kasargod,
 Sandeep" <sandeepk@ti.com>, "Hampiholi, Vallabha" <v-hampiholi@ti.com>
Subject: RE: [EXTERNAL] Re: [PATCH v9 1/4] ASoC: SDCA: Add PDE verification
 reusable helper
Thread-Topic: [EXTERNAL] Re: [PATCH v9 1/4] ASoC: SDCA: Add PDE verification
 reusable helper
Thread-Index: AQHczmwUl23LTwaoVkq9MJFSqfMf2LXoDM0AgAANDgCAAA40AP//zE8Q
Date: Mon, 20 Apr 2026 14:03:35 +0000
Message-ID: <077a8adcced94ea18116ce9a167cc846@ti.com>
References: <20260417131401.3104-1-niranjan.hy@ti.com>
 <6b72e996-a2dd-445b-b145-82644a6df8eb@linux.dev>
 <aeYBgE4JQiApVvRS@opensource.cirrus.com>
 <6832da94-39cc-4cfd-ad1c-0c4bfea8c79c@linux.dev>
In-Reply-To: <6832da94-39cc-4cfd-ad1c-0c4bfea8c79c@linux.dev>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A108:EE_|LV8PR10MB7798:EE_
X-MS-Office365-Filtering-Correlation-Id: a2507cf5-ec38-4a18-0105-08de9ee5a9ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|7416014|1800799024|376014|18096099003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	1MXWg/Te4iyhp9nX9m82x2jETu/vhsnkUsrxT7TXxPuXZymZpamHFj9ijsdIgAGfgNIJLFsWCMXI4lpyxsvyLXBXh9Nz/VigD3ZBUMGN+TRT99veTf4TiDvzoDC975V0j2oOoSpOMcrp8YWYnJaVet7XN9MZCGERbkGYv8J7CMVc6Zs9PHD3B2xU+p8ZzM8skBFPtyFsj/KnVDX2O8vXxH9VD5orCQAaoFgXFOBk+/pMW0fKnBJPsure0JDxuQJvNvNs5j0GGARAVXR0DY1/ZX571uCtM1v09FDkrliam0Uy3mfjge8E6WHJ/NMVVLwm7Xs0raOKLJm3TjZoY2kRIEl0b5Fo7QDvdJ6rTuKoFBHDvhc6IoHHo4yfY67tCTj/1rjmBkqe2hb4S4VDH7mHBld2x9jivEarG9IAyKqfPhTrc10KMLkUJsR8dKG7YkjPhK9uOznbUxGbKgBmkjuFJfSSLUGUeWcepl/T7ctFVmJCKTc07Yi8/IVz834tiY82v3gZUuX2pAV6x8WtYpe6lZDFGTTn3LI7CmiERqNoYCIIxj0Q5XOM62rtIJJUf/4nBidkVvOxP40+hZs+VFNcEUV+l1Y0jgFOcGxEyyf/X0m/q/o7Z+CWq0HgczK6LW4sLkRnz0uSArbFLSDuFRmWgElR8yUa94CNxmSFLCFaTrlsBBGG9axVDTKQTDT6oY89IRf6knQFKwcwLTbsN6pTVNcyLRQGZTns7s17px+Cglp9SbfY1Z8BabuIFjCXL2Ur2310IgYEeWcmD11t/NIBUw==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(7416014)(1800799024)(376014)(18096099003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0cWw3hB+8NpJh/8W4jgllaEto/sZRGB9kKfLVALrcNVS+NaMWwoC3Do6V2CvlKGCRk3EZP5oW8PUusQtVNqP+XeaYArZPV6DsLrsXF6meTPIY+XcGdgG+XmuQWzZpsWT2pplgu2c8ahTLaosduoKO+LW9cNxSfsDivX9hu0muyVLBT/8IH8WjcwaiFL3dzo41xv84giGGPWy3eARO2k6zCBUkbS1eWxhJw5EtNo96KSRA8pXL2ypJcMnWp1os/Rurl3NiLOxxBXT9Yfi0yzOwvBtNgavWsR156pHo/GbOsO9EepOkbrpBkkcTXepKN3aDaKfitIk9zpVpbkCmLmtc/Ri0DqF+XUaIP5E2ZofKNgEzjGsTkMeOakSHjj6yqFj3TfhKQVV3/sLoYUgR6/QkeBFXRzAbmgGBeip8SJxkaT9lG2JIEhNXCqMPy9Hps/a
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 14:03:56.3384
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2507cf5-ec38-4a18-0105-08de9ee5a9ae
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A108.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7798

T24gMTY6NTctMjAyNjA0MjAsIFBpZXJyZS1Mb3VpcyBCb3NzYXJ0IHdyb3RlOg0KPiBTZW50OiBN
b25kYXksIEFwcmlsIDIwLCAyMDI2IDQ6NTcgUE0NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2OSAx
LzRdIEFTb0M6IFNEQ0E6IEFkZCBQREUgdmVyaWZpY2F0aW9uIHJldXNhYmxlIGhlbHBlcg0KPiAN
Cj4gT24gNC8yMC8yNiAxMjozNSwgQ2hhcmxlcyBLZWVwYXggd3JvdGU6DQo+ID4gT24gTW9uLCBB
cHIgMjAsIDIwMjYgYXQgMTE6NDk6MDBBTSArMDIwMCwgUGllcnJlLUxvdWlzIEJvc3NhcnQgd3Jv
dGU6DQo+ID4+IE9uIDQvMTcvMjYgMTU6MTMsIE5pcmFuamFuIEggWSB3cm90ZToNCj4gPj4+ICsg
KiBUaGUgY2FsbGVyIGlzIHJlc3BvbnNpYmxlIGZvciB3cml0aW5nIFJFUVVFU1RFRF9QUyBiZWZv
cmUgaW52b2tpbmcgdGhpcw0KPiBmdW5jdGlvbi4NCj4gPj4NCj4gPj4gRXJtLCB3aHkgbm90IGRl
YWxpbmcgd2l0aCB0aGUgd3JpdGUgdG8gUkVRVUVTVEVEX1BTIGluIHRoaXMNCj4gPj4gaGVscGVy
PyBZb3UgaGF2ZSBhbGwgdGhlICd0bycgYW5kICdmcm9tJyBpbmZvcm1hdGlvbiBpbiB0aGUNCj4g
Pj4gcGFyYW1ldGVycy4NCj4gPg0KPiA+IEkgaGF2ZSBubyBvYmplY3Rpb25zIHRvIG1vdmluZyB0
aGF0IGludG8gdGhlIGhlbHBlciBhcyB3ZWxsLg0KDQpPaywgSSBkaWQgbm90IHdhbnQgdG8gZGlz
dHVyYiB0aGUgd2lkZ2V0J3MgZXZlbnQgaGFuZGxlciBpbiB0aGlzIHBhdGNoLg0KSSB3aWxsIGFk
ZCB0aGlzIGluIHRoZSBuZXh0IHBhdGNoLg0KDQo+ID4NCj4gPj4+ICsJc3RhdGljIGNvbnN0IGlu
dCBwb2xscyA9IDEwMDsNCj4gPj4+ICsJc3RhdGljIGNvbnN0IGludCBkZWZhdWx0X3BvbGxfdXMg
PSAxMDAwOw0KPiA+Pj4gKwl1bnNpZ25lZCBpbnQgcmVnLCB2YWw7DQo+ID4+PiArCWludCBpLCBw
b2xsX3VzID0gZGVmYXVsdF9wb2xsX3VzOw0KPiA+Pj4gKwlpbnQgcmV0Ow0KPiA+Pj4gKw0KPiA+
Pj4gKwlpZiAocGRlX2RlbGF5cyAmJiBudW1fZGVsYXlzID4gMCkgew0KPiA+Pj4gKwkJZm9yIChp
ID0gMDsgaSA8IG51bV9kZWxheXM7IGkrKykgew0KPiA+Pj4gKwkJCWlmIChwZGVfZGVsYXlzW2ld
LmZyb21fcHMgPT0gZnJvbV9wcyAmJg0KPiBwZGVfZGVsYXlzW2ldLnRvX3BzID09IHRvX3BzKSB7
DQo+ID4+PiArCQkJCXBvbGxfdXMgPSBwZGVfZGVsYXlzW2ldLnVzIC8gcG9sbHM7DQo+ID4+PiAr
CQkJCWJyZWFrOw0KPiA+Pj4gKwkJCX0NCj4gPj4+ICsJCX0NCj4gPj4+ICsJfQ0KPiA+Pj4gKw0K
PiA+Pj4gKwlyZWcgPSBTRFdfU0RDQV9DVEwoZnVuY3Rpb25faWQsIGVudGl0eV9pZCwNCj4gU0RD
QV9DVExfUERFX0FDVFVBTF9QUywgMCk7DQo+ID4+PiArDQo+ID4+PiArCWZvciAoaSA9IDA7IGkg
PCBwb2xsczsgaSsrKSB7DQo+ID4+PiArCQlpZiAoaSkNCj4gPj4+ICsJCQlmc2xlZXAocG9sbF91
cyk7DQo+ID4+DQo+ID4+IFRoaXMgc29sdXRpb24gd2lsbCBsb29wIGZvciB1cCB0byAxMDAgdGlt
ZXMsIGFuZCB0aGUgc2xlZXANCj4gPj4gZHVyYXRpb24gY291bGQgYmUgcXVlc3Rpb25hYmxlLg0K
PiA+DQo+ID4gVGhlIGR1cmF0aW9uIGRvZXNuJ3QgaGF2ZSB0byBiZSBwcmVjaXNlIGhlcmUsIGFz
IGxvbmcgYXMgdGhlDQo+ID4gcmVzdWx0IGlzIGxvbmdlciB0aGFuIHRoZSByZXF1ZXN0ZWQgdGlt
ZSBldmVyeXRoaW5nIGlzIGZpbmUuDQo+ID4NCj4gPj4gU2F5IGZvciBleGFtcGxlIHlvdSBoYXZl
IGEgMTBtcyB0cmFuc2l0aW9uLCBkbyB5b3UgcmVhbGx5IHdhbnQNCj4gPj4gdG8gcmVhZCBBQ1RV
QUxfUFMgZXZlcnkgMTAwdXM/DQo+ID4NCj4gPiBRdWl0ZSBwb3RlbnRpYWxseSwgSSBpbWFnaW5l
IGl0IHdpbGwgYmUgZmFpcmx5IGNvbW1vbiBmb3IgcGFydHMNCj4gPiB0byBjaGFuZ2UgUFMgYSBs
b3QgZmFzdGVyIHRoYW4gdGhlIGFjdHVhbCB0aW1lb3V0cyB0aGV5IHByb3ZpZGUsDQo+ID4gZHVl
IHRvIGNvcm5lciBjYXNlcyBhbmQgcGVvcGxlIGp1c3QgYmVpbmcgY29uc2VydmF0aXZlIGluIHRo
ZQ0KPiA+IERpc0NvLiBTbyBpdHMgcXVpdGUgcG9zc2libGUgc29tZXRoaW5nIHRoYXQgc2F5cyAx
MG1TIHR5cGljYWxseQ0KPiA+IHN3aXRjaGVzIGluIGEgY291cGxlIDEwMHVTLg0KPiA+DQo+ID4+
IElmIHRoZSBwZGVfZGVsYXkgaXMgMW1zIHRoZW4gYSByZWFkIGV2ZXJ5IDEwdXMgbWFrZXMgbm8g
c2Vuc2UsDQo+ID4+IHRoZSBTb3VuZFdpcmUgY29tbWFuZCBwcm90b2NvbCB3b3VsZCBub3QgYmUg
YWJsZSB0byBoYW5kbGUNCj4gPj4gc3VjaCByZWFkcy4NCj4gPj4NCj4gPj4gQSBtaW5pbXVtIHRo
cmVzaG9sZCBvbiBwb2xsX3VzIHdvdWxkIG1ha2Ugc2Vuc2UgSU1ITy4NCj4gPg0KPiA+IEkgZ3Vl
c3MgeW91IGRvIHJlYWNoIGEgcG9pbnQgd2hlcmUgdGhlIHNvdW5kd2lyZSBjb21tYW5kIG1ha2Vz
DQo+ID4gdGhlIGRlbGF5IGVmZmVjdGl2ZWx5IG1lYW5pbmdsZXNzLiBXaGF0IHdvdWxkIHlvdSBz
dWdnZXN0IGZvciBhDQo+IA0KPiB5ZXAsIHRoYXQgd2FzIHRoZSBtYWluIHBvaW50Lg0KPiANCj4g
PiBtaW5pbXVtPyBTb21ldGhpbmcgbGlrZSAxMDB1UyBmZWVscyBraW5kYSByZWFzb25hYmxlIHRv
IG1lLA0KPiA+IEkgd291bGQgbGVhbiB0b3dhcmRzIHF1aXRlIGEgc21hbGwgdmFsdWUgaGVyZS4g
T3RoZXIgb3B0aW9ucw0KPiA+IG1pZ2h0IGJlIHRvIGxvb2sgYXQgc29tZSBzb3J0IG9mIGV4cG9u
ZW50aWFsIGJhY2sgb2ZmLCBkb2luZyB0aGUNCj4gPiBmaXJzdCBmZXcgcG9sbHMgZmFzdGVyIHRo
YW4gbGF0ZXIgb25lcy4NCj4gPg0KPiA+IFRoaXMgaXMgZGVmaW5pdGVseSBvbmUgb2YgdGhvc2Ug
c2l0dWF0aW9ucyB3aGVyZSBTRENBIGlzIGEgbGl0dGxlDQo+ID4gdG9vIHZhZ3VlIGZvciBpdHMg
b3duIGdvb2QuIEJ1dCBJIHdvdWxkIGFsc28gc2F5IG1ha2luZyBhIGNoYW5nZQ0KPiA+IGxpa2Ug
dGhpcyBzaG91bGQgYXQgYSBtaW5pbXVtIGJlIGEgc2VwYXJhdGUgcGF0Y2ggcmF0aGVyIHRoYW4N
Cj4gPiBwYXJ0IG9mIHRoaXMgb25lLiBBbmQgSSBhbSBub3QgY29udmluY2VkIHdlIG5lZWQgdG8g
YmxvY2sgdGhpcw0KPiA+IHNlcmllcyBvbiB1cGRhdGluZyBpdCwgYWx0aG91Z2ggaWYgd2UganVz
dCB3YW50ZWQgdG8gZ28gd2l0aCBhDQo+ID4gc2ltcGxlIG1pbmltdW0gdGhhdCBzZWVtcyBlYXN5
IGVub3VnaCB0byBhZGQuDQo+IA0KPiBBIG1pbmltdW0gb2YgMTAwdXMgd291bGQgYmUgZmluZSwg
d2UgY2FuIGFsd2F5cyBvcHRpbWl6ZSBmb3IgbG9uZyBkZWxheXMNCj4gbGF0ZXIuDQoNClVuZGVy
c3Rvb2QsIEkgd2lsbCBjaGFuZ2UgaXQgdG8gMTAwdXMgYW5kIHNlbmQgbmV3IHBhdGNoLg0KSSBy
ZWFsaXplZCB0aGF0IGF0IEA0LjhNSHogdG8gNk1IeiwgNTB4MTAsIEkgdGhpbmsgdGhlIHJlYWQg
DQppdHNlbGYgdGFrZXMgcm91Z2hseSB+NDJ1cyB0byA1MHVzLiANCkFuZCB3aXRoIDEwMHVzIGl0
IGlzIDEwbXMgYmVmb3JlIHRpbWVvdXQgaGFwcGVucw0KIChwcmFjdGljYWxseSBtYXliZSBpdCBp
cyByb3VnaGx5IDE1bXMpLg0KDQpSZWdhcmRzDQpOaXJhbmphbg0KDQoNCg==
