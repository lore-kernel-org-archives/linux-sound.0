Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012039.outbound.protection.outlook.com [52.101.53.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE74B3B8D41;
	Wed, 22 Apr 2026 10:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776854371; cv=fail; b=DYorJafbDPwA6ZNKcNKrrfZ+GcLdWTkDZ3dLt2RO2syTv294KykGQ9tMHTK8WUz87wTc6V8fC8FZxuhtm7T6V+Yef+0QVElAgHy3+zl0w1QwD7/Vt5a3ECJF7m9gVDftujK7PLeHrAV+IzXJ1y7ETfzJXTMP0hYq2u34SuBh6xc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776854371; c=relaxed/simple;
	bh=d/vgtBGUJi/E0jBu9bM1ZdZglXbElzVVOA7GLphg5GI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TOMVB+IWBwSvM2PzKNNNbgVuyAFpiCBB/pPsBGI8cCi0FEfJ3Bz/1Clvwnndo0TC5xj1Lv7t0FuelIMq2AhbpwRHna6mHW0YAXZBDpVzI/yYEmIEeaER+lTmTBfH0e8jdhkPR09hoOr0Tq2ymhPB067TuTtjC8tRgNCY8M/QMwQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=VN4WfxsL; arc=fail smtp.client-ip=52.101.53.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="VN4WfxsL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zRUjiLX7Y/srXRxfRbxl47efGkXGOVsOaQaQwCQqXtatFlgd6BLe53Siv1wFYEvWR4D7m3gbrddEs2Gd0LHq1+p3Zd77oIs2oYxkDueh9Kf048aUMNiabndE6rX/fm9SziT3ihdnzCk5SQ5gpFLE3E0UeO7xNg35LqSJCBVPsRmCqxdOFU8K5vrQwHc6+jrT0u4g4f6NIJpFcArWl+5TZAEICyZL/cSC5PEODWA9LizWqIjxYpieS3H4bFS2Vh2HXw32zoKGhr0fIxjmiNMiIO4ezVTqddrELqbQtJwvgggUYQEBCFBnc4JOfAzB7fjwdNiw/A1b++S0FCKRdT2NuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d/vgtBGUJi/E0jBu9bM1ZdZglXbElzVVOA7GLphg5GI=;
 b=A9Dk6pS5EoHkis2tRd8eMFAArtc7DfeAsHxWAKnNXfdppg2q+4jSAEU792nJ98e+W9C4wmct7JmR1XcTCDz90sgKRiVotbIC5Aw53vs9jg9Cf9X+oBmCQbVQt1PwMZQY1nxvIryFqcVC4O/tY2VddIitLAd3vjvEktIq1hTBHoH0FPPoWFZSCq+shTfiboXOy7Wh6KlVX7sogSi0g/36rlYU4zjuFHgZQaCxFX4Dwp0BloBVWencBLP/HDxcWeBj3tmWh+IPs3qggB9NEISGgz2uNb8MdvRZNiZ9mu1C/7aYdnK+XNw0xvIDlQTu5iIDHJGHsnRXrPoKoy6LeKWEHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=opensource.cirrus.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d/vgtBGUJi/E0jBu9bM1ZdZglXbElzVVOA7GLphg5GI=;
 b=VN4WfxsLHY+f7BnV9/E5MYrVdEQIb8du9OwtqKCX5reyVe4vC5xYQhWru3NM5dnyGTEHGQSQDNab/m2/TKshi2Af8F+r1zg1wmn3DZf7zn2TRXzCvOXC/2QiJKa87HC7NBr23jgyhSvlwSGsmqLqgAXSSCFwUh0v731wNP4EYkU=
Received: from SA9PR13CA0162.namprd13.prod.outlook.com (2603:10b6:806:28::17)
 by CY8PR10MB6634.namprd10.prod.outlook.com (2603:10b6:930:56::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.37; Wed, 22 Apr
 2026 10:39:24 +0000
Received: from SA2PEPF00003AE7.namprd02.prod.outlook.com
 (2603:10b6:806:28:cafe::15) by SA9PR13CA0162.outlook.office365.com
 (2603:10b6:806:28::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.15 via Frontend Transport; Wed,
 22 Apr 2026 10:39:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SA2PEPF00003AE7.mail.protection.outlook.com (10.167.248.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 22 Apr 2026 10:39:24 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 22 Apr
 2026 05:39:22 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 22 Apr
 2026 05:39:22 -0500
Received: from DLEE204.ent.ti.com ([fe80::81dc:e6c6:4c37:9bc6]) by
 DLEE204.ent.ti.com ([fe80::81dc:e6c6:4c37:9bc6%14]) with mapi id
 15.02.2562.020; Wed, 22 Apr 2026 05:39:22 -0500
From: "Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>
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
Subject: RE: [EXTERNAL] Re: [PATCH v10 1/4] ASoC: SDCA: Add PDE state
 transition helper
Thread-Topic: [EXTERNAL] Re: [PATCH v10 1/4] ASoC: SDCA: Add PDE state
 transition helper
Thread-Index: AQHc0aZk+fX95KfjY0+SigH5nMg3CLXp/8KAgAAGfICAAQ2fAP//zLzQ
Date: Wed, 22 Apr 2026 10:39:22 +0000
Message-ID: <005dce2a266043e89c8b904f5cdc6b33@ti.com>
References: <20260421154804.2670-1-niranjan.hy@ti.com>
 <aeeehYTuNON2cGKJ@opensource.cirrus.com>
 <e13e6934-fb5b-4ea3-8517-85d482ad25da@linux.dev>
 <aeiGIpYwZz/dBuqQ@opensource.cirrus.com>
In-Reply-To: <aeiGIpYwZz/dBuqQ@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE7:EE_|CY8PR10MB6634:EE_
X-MS-Office365-Filtering-Correlation-Id: dbd9bf79-55e6-46ec-a8cb-08dea05b6bbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|7416014|82310400026|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	cf5Va7PKYHzp/rbpR5RndGb4+I1Qbdd3SmIYb3WIzXM1YWuKIr+AwMR0Z+To2EvrCZ0qseIk0j3b5jexlmh/f4kzAiU50FJIAFyNfZr0P9sGvXqGB/FGHO9Y939WtOTORNtMdZTN2ZTskuVlful/5qwS8kpaQCP2jO3WWA8D7DknjwUT7AgRmnruRUuVO2zKvDvLSjV/tMadqtehimGJx9bOAXKV2/eqbPqhg9PhtoycNk20hd7xFpy9KYjkpros+LPT4IErl++HVc6sPwo5LbFO9tjhqvciz6Xc1dFw/NFE9QZbnMU9RB45z+TE2EuxyuWsnKZKq0KQtb0bogyxxyIX955VYPi6W6u6me6hR9XK1ir+jVgcYS2tU2xwC5bLx6+5AUXObV11/FRa7BfLqRYEAk9mK5k5iTShllpxAd/97rUCs4X002S+2kVmwMW24GA75sGDp7kVUUXUi4G1BZTqNSrmaeY6tkB8VmBOepnSZW+WP6NmhaKbWMhGDh4HNG6UvWqPtrYCq7hssnWTF1nW2J0oGAUiKEmPJ5xY+13cqIVISnal0fJehhUfFUY+iuJGWEfnlZIWdk12thF4XFzE+HBORyOJOk7hgpOHM6/Oa1AFybP33DGtSnWHcRL6awGWlOpOhzxeJxcWp8eqQ1vk33WHp3Ss8PQwZ5IPPBtR4rYSRhutoeEzhiCtlgraj3Sr6aPlWwzxxUTS71Mh/eCJ3+BFmX1AHHSeWCcoGeMjCRj4HXvwMFOnnT9RpQ6bv7Af/bgpqBf4FC0A0P/Mcg==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(7416014)(82310400026)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	w/EQSNlhPM4t+tpv4NuceRBtrZDK2mtZ+IosTlOvmbCDlxLK8pnIAEhRM8pdoLpZX0zu/Irhrm8P6eEKpi7yb9V+JbZt2Xe3gy3pP7okFCGk5nHImqDWCaCc3RiSvs66hNz8UmxUDf0A+ul9si8ZCNYdyBX1GtUI6m6APRCLUi9M40gpRVwnsslC6IzBIFaTua0yrmjvcePVHRBfBzY5cV1ebbEtkxqOXUyY7PY8KR/yX9xgrf0Xwqtb5lJLi2Z+4bOqeZTv52I3XLCl4GQCGqHkx3EeslkRZo6QRHY+qXNtIgsTOEdoVwHcWrlBuj0/vUlKUVz4eUoJdWv0IuNqfJWR+b707F1bp+IvtGvhw+MxLY6p6JFHVKscvjDFk740LJ7olUz6/NK60n3xs+LooH8vj/rEunVtXvncuHIGk9iQ3CGQyKsz/tn4EGv8H/8D
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 10:39:24.2346
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbd9bf79-55e6-46ec-a8cb-08dea05b6bbb
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AE7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6634

Pk9uIDEzOjU2LTIwMjYwNDIyLCBDaGFybGVzIEtlZXBheCB3cm90ZToNCj4gT24gVHVlLCBBcHIg
MjEsIDIwMjYgYXQgMDY6MjE6MDlQTSArMDIwMCwgUGllcnJlLUxvdWlzIEJvc3NhcnQgd3JvdGU6
DQo+ID4gT24gNC8yMS8yNiAxNzo1NywgQ2hhcmxlcyBLZWVwYXggd3JvdGU6DQo+ID4gPiBPbiBU
dWUsIEFwciAyMSwgMjAyNiBhdCAwOToxODowMVBNICswNTMwLCBOaXJhbmphbiBIIFkgd3JvdGU6
DQo+ID4gPj4gUGVyIFNEQ0Egc3BlY2lmaWNhdGlvbiwgYWZ0ZXIgd3JpdGluZyBSRVFVRVNURURf
UFMsIGRyaXZlcnMgbXVzdA0KPiA+ID4+DQo+ID4gPj4gIAkoKndpZGdldCktPmlkID0gc25kX3Nv
Y19kYXBtX3N1cHBseTsNCj4gPiA+PiAtCSgqd2lkZ2V0KS0+cmVnID0gU0RXX1NEQ0FfQ1RMKGZ1
bmN0aW9uLT5kZXNjLT5hZHIsIGVudGl0eS0+aWQsDQo+IGNvbnRyb2wtPnNlbCwgMCk7DQo+ID4g
Pj4gLQkoKndpZGdldCktPm1hc2sgPSBHRU5NQVNLKGNvbnRyb2wtPm5iaXRzIC0gMSwgMCk7DQo+
ID4gPj4gKwkoKndpZGdldCktPnJlZyA9IFNORF9TT0NfTk9QTTsNCj4gPiA+PiArCSgqd2lkZ2V0
KS0+bWFzayA9IDA7DQo+ID4gPg0KPiA+ID4gSG1tLi4uIHllYWggSSBhbSByZWFsbHkgc29ycnkg
SSB0b3RhbGx5IG92ZXJsb29rZWQgdGhpcy4gWWVhaCB3ZQ0KPiA+ID4gc2hvdWxkIGxlYXZlIHRo
ZSB3cml0ZSBvdXRzaWRlIHRoZSBoZWxwZXIgaXQgaXMgbXVjaCBuaWNlciB0bw0KPiA+ID4gaGF2
ZSBEQVBNIGRvIGl0Lg0KPiA+DQo+ID4gTm90IGZvbGxvd2luZyB0aGF0IGNvbW1lbnQsIHRoZXJl
IGFyZSBxdWl0ZSBhIGZldyBjb2RlY3MgdGhhdA0KPiA+IHRyYXAgYSBEQVBNIGV2ZW50LCBkbyBh
IHJlZ21hcF93cml0ZSB0aGVuIHdhaXQgd2l0aCBhIGxvb3AsDQo+ID4gc2VlIGUuZy4gcnQ3MjJf
c2RjYV9wZGU0N19ldmVudA0KPiANCj4gSWYgeW91IGhhdmUgYSBnb29kIHJlYXNvbiB0byBkbyB0
aGUgd3JpdGUgbWFudWFsbHkgeW91IGNhbg0KPiAodHlwaWNhbGx5IGJlY2F1c2UgaXQgbmVlZHMg
c2VxdWVuY2luZyB3aXRoIG90aGVyIHdyaXRlcyksIGJ1dA0KPiBnZW5lcmFsbHkgaWYgdGhlIERB
UE0gd2lkZ2V0IGNhbiBkbyB0aGUgd3JpdGUgaXRzIGJldHRlciB0byBkbyBpdA0KPiB0aGF0IHdh
eS4gSnVzdCBjbGVhbmVyLg0KPiANCj4gQXBvbG9naWVzIHRvdGFsbHkgbXkgYmFkIG9uIHRoaXMg
SSBzaG91bGQgaGF2ZSByZWFsaXNlZCB0aGUNCj4gaW1wbGljYXRpb25zIG9mIHRoaXMgY2hhbmdl
IHRoZSBmaXJzdCB0aW1lLg0KPiANCj4gPiBJIGhhdmVuJ3Qgc2VlbiBEQVBNIGRlYWwgZGlyZWN0
bHkgd2l0aCB0aGUgd3JpdGU/DQo+ID4gd2hhdCBhbSBJIG1pc3Npbmc/DQo+IA0KPiBUaGF0IGlz
IHdoYXQgaXMgaGFwcGVuaW5nIGluIHRoZSBhYm92ZSBjb2RlIHNldHRpbmcgdGhlDQo+IHJlZy9t
YXNrL29uX3ZhbC9vZmZfdmFsLCBEQVBNIHVzZXMgdGhhdCBpbmZvcm1hdGlvbiB0byBkbyB0aGUN
Cj4gcmVnaXN0ZXIgd3JpdGUuDQpObyBwcm9ibGVtIGF0IGFsbC4gSSB3aWxsIHJldmVydCBiYWNr
IGNoYW5nZXMgYXMgaW4gdGhlIHByZXZpb3VzIHBhdGNoDQp0byBjaGVjayBmb3IgQUNUVUFMX1BT
IGFsb25lLg0KDQpSZWdhcmRzDQpOaXJhbmphbg0K
