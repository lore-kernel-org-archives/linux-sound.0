Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013001.outbound.protection.outlook.com [40.93.196.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E38A55;
	Mon, 16 Mar 2026 00:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773622066; cv=fail; b=chvm7896Ifm6HmDMgwSICZDMUX8hZKUQ4PlTt0E7UU+/vW6rfmwhQwgFrjoMngc14LJlFAdnROZX8HXDC0CMSEm92aaAf8pXhHrb/VWlF+wEkHSvJS8+96JJ9F4qzzQLpFaMMncEMhQb0oqXybtHiGFxQEQy6ZRC05njwKPVZ2o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773622066; c=relaxed/simple;
	bh=HnogXSiEuMYvDXY+M79+ARPm1ywarg+kgOivaakXsVo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VwKE1vUHhIcO2VjmcyKmcZqhMoSIF42pd2QT7KVqUsoXuaNWTR+WDa3ZCLOTJcr8e/EEal4V8Ik79J8oOfIjipr32dqVCmiEsoz+AoZChyBhjMoy8AkOYYjiqxHXiNPBOVUuVx9m3asv7IPF+5y+Cg7MtkU5w5rGeM87EDFUI1I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=MZpJbY8i; arc=fail smtp.client-ip=40.93.196.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="MZpJbY8i"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=su/q3/m6wg82ElSpbbClIJTnLFgk7+f//gYWUUMV725bpE6HYS8w2LVvtqe5augyR8yMwycC0DGLNih8NBfY5HC3vKItf9b2caCP9hJmOGwyLfXIuUoWphqAAxifahAwaE6a9Qrhw5elbbAPLlOUP3M0ODOoeHPbdD/MGPqOOUzkzZkbqyiAkLM5oOlkbArb0gfrLnRQ1w/5sK9hhzYubS8DxbrP0vPhd43vxFr2EQnI2U0UKBYHrLYwaWAwIvD2NrPykjokdj9meOLKW50ZLPpWhX4eztrq2MJWDh9lb9d0Q8GhUlUoZrd0u2U84KToy1wtcyQ3+yFfeJ4FZvymUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HnogXSiEuMYvDXY+M79+ARPm1ywarg+kgOivaakXsVo=;
 b=iYzpb8gKfZk1k39OlqkX3E0MLolG0GLTbKDiOUl0HhmBDqHVV+HHYj/E2Kqj6b4bzNErwqhW8j6YCOaDasVPJebognnpL2hSDToVnp+FXSuO6dKxvuEwaWBDgU81IC7ufLEzasBq/1jldpW6dNSG2ZOfKHxIR8YE2z0e5RVEqLRIWodn1dz00jnmMxXVwMrB2EpwZ5qCTXpe6iuggxzg6rUDnRJ6p574n626PEpoqS6lI+mQL0SWMHde3GpYoV6uNckpfjAlMy9A1tmT25+JENyXe1tzY1xLEw8McJ3g7IISjcyiYrZqYWZcwle4WS23WBz55GhB/rRKoxAJCKVFjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=suse.de smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HnogXSiEuMYvDXY+M79+ARPm1ywarg+kgOivaakXsVo=;
 b=MZpJbY8idChNqa4RXXUIBJUJI4ipgoXG3rntwsP/rTe8E+vhikiADHpHhAcMf6BhV/jtI/bVArHFnzEsiHIGshH7iW1da3rIGId+PE5rgZf5urOpJuIWlPgf+Z8/DvaM5zE6gXxhMyp9ZOglQqOTVlBi0SgxCInMDkJGe3dS9Mw=
Received: from DS7PR07CA0020.namprd07.prod.outlook.com (2603:10b6:5:3af::12)
 by BL3PR10MB6188.namprd10.prod.outlook.com (2603:10b6:208:3bf::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.21; Mon, 16 Mar
 2026 00:47:41 +0000
Received: from DM2PEPF00003FC2.namprd04.prod.outlook.com
 (2603:10b6:5:3af:cafe::6f) by DS7PR07CA0020.outlook.office365.com
 (2603:10b6:5:3af::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.24 via Frontend Transport; Mon,
 16 Mar 2026 00:47:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DM2PEPF00003FC2.mail.protection.outlook.com (10.167.23.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Mon, 16 Mar 2026 00:47:41 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 15 Mar
 2026 19:47:40 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 15 Mar
 2026 19:47:40 -0500
Received: from DLEE209.ent.ti.com ([fe80::9756:3b42:e53b:3cbe]) by
 DLEE209.ent.ti.com ([fe80::9756:3b42:e53b:3cbe%7]) with mapi id
 15.02.2562.020; Sun, 15 Mar 2026 19:47:40 -0500
From: "Xu, Baojun" <baojun.xu@ti.com>
To: Eric Naim <dnaim@cachyos.org>, Jaroslav Kysela <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>
CC: Takashi Iwai <tiwai@suse.de>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [EXTERNAL] Re: [PATCH] ALSA: hda/realtek: Use
 ALC287_FIXUP_TXNW2781_I2C for ASUS Strix Gxx5
Thread-Topic: [EXTERNAL] Re: [PATCH] ALSA: hda/realtek: Use
 ALC287_FIXUP_TXNW2781_I2C for ASUS Strix Gxx5
Thread-Index: AQHctLfERc5yasydlUiF7sqPpdzA9LWwUzt3
Date: Mon, 16 Mar 2026 00:47:40 +0000
Message-ID: <4ad2197cf43a45ac9fbab4a9da5a5671@ti.com>
References: <20260315160939.191265-1-dnaim@cachyos.org>,<640ef064-3f41-4642-bf13-8800d8f7adbb@cachyos.org>
In-Reply-To: <640ef064-3f41-4642-bf13-8800d8f7adbb@cachyos.org>
Accept-Language: en-GB, zh-CN, en-US
Content-Language: en-GB
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
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC2:EE_|BL3PR10MB6188:EE_
X-MS-Office365-Filtering-Correlation-Id: f2ad0739-bb77-4cfc-7414-08de82f5a0f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Ajj5xaYv2I7VUY5vSYJMCwoTNBj3u7aJK7Z2SFTp+w0Ah7YtEE3Oazx7ps97VikfHbcz5Y8/zFxfAHVCeg5V8LiILXI+1u2XX2W9wmN6Bx+xSyt75SOjMIVQaqW9sXP0rML2LT7SxPgsc2RrLYBBs2NkFIcSABngdOy5IhXjl4U1YeCPuRHIJd4ypnx15hxOiLvu2KhYt9MjWRQ6Q1jo40griSh/eYca174cSGvCZ3c/QTSguda5dTy5Zdr4gCP8VHYblwCiQGRa492IP0oNIdLuZ+DyNBQmFPS5wyWNOdGoe1tucCcaVPv8iJkQcw5ap9DhiyrrjStrj8zgwNBbUv84m0dq9NEy5bvVELpzUxBoVx7mTiwDy2y6UJ37jwVfk+72FLTpFl0oCeiqJDAW1VtPAmfJvl3fsh0+i3uTU+9AJ9K+K79KbP41iktg8oWe3XIPwpzloTDbUlV5q3v+awgbT1tU7DaW2uJnxxNTIPnLQYuJkpDzKrl3Hd8kWoOFFaaFak/J1PAM6uGY/YrlXEpJqq+fD1MPyDPcVDEQoxVRez19KkCiBVpXQ3B4u5a/Am48Ll9cqVRtGTw9jmffOI09B7tQVBQYAQUJDULrYXu8N2BVpW4vr1XLDq8kziyNRB00G5naLiLLLkT74pzdK1fusoV4+NsGdqKYRvKugKUH+h535rgVBVlQGayd5Y09c0qLyjWfQyZrIsmviDE2h3K1Bdm1PZJnoAfTYWpwoVJ8tFfmZOcml/nLgS4VysxGNHLgIqMNB+A8jzS3Ea2r0ntPNZJdK6yTJEdUKQ1IWvE=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/zfzM0MUhTdM9kCH0IP+S6ZQLrPkyU2eXvt0YzQJcvPpXMFJRS4j+shDxNiIwN73aHL9g9ZAcsw3JZ7Z4/+XColQN/3ak5wyZPrMCcH+5uynh2/aT2a43eIq2ZKiOOzc4B1ugkigvKd71FppcJFS94cHPZWKOM1H9fOasBW48yoB96gDO9NKnXBJvdbHu2HGyA+2FUBt8zG0KDkwVQUoxDkTpb4UthzcapS9OkAFqi7PgmsJxKiNwPm4Riv2EUweo+o32nHZjCar1qlhf/LwHr97diZvwS4JfZ0GG8WxzCiTxbTIOGV8/Kno7ldrVkA6M18S7F6IK7S1WlvF4V2bjm2epsYDutoxxZmFX/dEc9dzUvQRGiBc65QzwCymWg6ZgM6OJAmLcOsslDmbxNuRuooANpm7s2/yuSegpDBQ0xRygyisQr/HvgJiaS7iEfMi
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 00:47:41.1234
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2ad0739-bb77-4cfc-7414-08de82f5a0f4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM2PEPF00003FC2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6188

SGkgRXJpYywNCg0KSGF2ZSB5b3UgYXBwbGllZCB0aGUgcGF0Y2ggYmVsb3c/DQpodHRwczovL2dp
dC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90aXdhaS9zb3VuZC5naXQvY29t
bWl0Lz9pZD0xZDFiOGIwNzM0YWY1MTQ5OTQ2ZTY4NzQxNWJmNmJlMDVhZTU1YmQ2DQoNCkJlc3Qg
UmVnYXJkcw0KSmltDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQpG
cm9tOiBFcmljIE5haW0gPGRuYWltQGNhY2h5b3Mub3JnPg0KU2VudDogMTYgTWFyY2ggMjAyNiAw
NDoxMA0KVG86IFh1LCBCYW9qdW47IEphcm9zbGF2IEt5c2VsYTsgVGFrYXNoaSBJd2FpDQpDYzog
VGFrYXNoaSBJd2FpOyBsaW51eC1zb3VuZEB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2
Z2VyLmtlcm5lbC5vcmcNClN1YmplY3Q6IFtFWFRFUk5BTF0gUmU6IFtQQVRDSF0gQUxTQTogaGRh
L3JlYWx0ZWs6IFVzZSBBTEMyODdfRklYVVBfVFhOVzI3ODFfSTJDIGZvciBBU1VTIFN0cml4IEd4
eDUNCg0KT24gMy8xNi8yNiAxMjrigIowOSBBTSwgRXJpYyBOYWltIHdyb3RlOiA+IFRoZXNlIGRy
aXZlcnMgd2VyZSBpbmNvcnJlY3RseSB1c2luZyB0aGUgQUxDMjg3X0ZJWFVQX1RBUzI3ODFfSTJD
IHF1aXJrID4gbGVhZGluZyB0byBlcnJvcnM6ID4gcy9kcml2ZXJzL2RldmljZXMvID4gWyAxOC7i
gIo3NjU5OTBdIFNlcmlhbCBidXMgbXVsdGkgaW5zdGFudGlhdGUgcHNldWRvIGRldmljZSBkcml2
ZXIgVFhOVzI3ODE64oCKMDA64oCKDQpaalFjbVFSWUZwZnB0QmFubmVyU3RhcnQNClRoaXMgbWVz
c2FnZSB3YXMgc2VudCBmcm9tIG91dHNpZGUgb2YgVGV4YXMgSW5zdHJ1bWVudHMuDQpEbyBub3Qg
Y2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IHJlY29nbml6ZSB0aGUg
c291cmNlIG9mIHRoaXMgZW1haWwgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4NCjxodHRw
czovL3VzLXBoaXNoYWxhcm0tZXd0LnByb29mcG9pbnQuY29tL0VXVC92MS9HM3ZLIXV2ZHEzWmVG
M0swYjZvWEVWaE1EXzVIU1V5Y3Fna2YzSTZhT25rbWUtVDMxN1dJeTYxR0ctUHlOSW9NNWhlTGlH
UlhCV1h6aDRUNHFYLXF2OVB1YnhNRUE2elpKN3JkTDhnJD4NClJlcG9ydCBTdXNwaWNpb3VzDQoN
ClpqUWNtUVJZRnBmcHRCYW5uZXJFbmQNCg0KT24gMy8xNi8yNiAxMjowOSBBTSwgRXJpYyBOYWlt
IHdyb3RlOg0KPiBUaGVzZSBkcml2ZXJzIHdlcmUgaW5jb3JyZWN0bHkgdXNpbmcgdGhlIEFMQzI4
N19GSVhVUF9UQVMyNzgxX0kyQyBxdWlyaw0KPiBsZWFkaW5nIHRvIGVycm9yczoNCj4NCg0Kcy9k
cml2ZXJzL2RldmljZXMvDQoNCj4gWyAxOC43NjU5OTBdIFNlcmlhbCBidXMgbXVsdGkgaW5zdGFu
dGlhdGUgcHNldWRvIGRldmljZSBkcml2ZXIgVFhOVzI3ODE6MDA6IGVycm9yIC1FTlhJTzogSVJR
IGluZGV4IDAgbm90IGZvdW5kDQo+IFsgMTguNzY4MTUzXSBTZXJpYWwgYnVzIG11bHRpIGluc3Rh
bnRpYXRlIHBzZXVkbyBkZXZpY2UgZHJpdmVyIFRYTlcyNzgxOjAwOiBlcnJvciAtRU5YSU86IElS
USBpbmRleCAwIG5vdCBmb3VuZA0KPiBbIDE4Ljc2ODQ3Nl0gU2VyaWFsIGJ1cyBtdWx0aSBpbnN0
YW50aWF0ZSBwc2V1ZG8gZGV2aWNlIGRyaXZlciBUWE5XMjc4MTowMDogZXJyb3IgLUVOWElPOiBJ
UlEgaW5kZXggMCBub3QgZm91bmQNCj4gWyAxOC43Njg4OTldIFNlcmlhbCBidXMgbXVsdGkgaW5z
dGFudGlhdGUgcHNldWRvIGRldmljZSBkcml2ZXIgVFhOVzI3ODE6MDA6IEluc3RhbnRpYXRlZCAz
IEkyQyBkZXZpY2VzLg0KPg0KPiBVc2UgdGhlIGNvcnJlY3QgQUxDMjg3X0ZJWFVQX1RYTlcyNzgx
X0kyQyBxdWlyayB0byBmaXggdGhpcyBhbmQgcmVzdG9yZQ0KPiBzcGVha2VyIGF1ZGlvIG9uIGFm
ZmVjdGVkIGRldmljZXMuDQo+DQo+IEZpeGVzOiAxZTljNzA4ZGMzYWUgKCJBTFNBOiBoZGEvdGFz
Mjc4MTogQWRkIG5ldyBxdWlyayBmb3IgTGVub3ZvLCBBU1VTLCBEZWxsIHByb2plY3RzIikNCj4g
Q2xvc2VzOiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvQ0FDQjl6N2tqczhyaExzdEVjOGZWMjlCQ1RiNWRkODgxSndHb3pvS2RPNWN3Q2I9WXdRQG1h
aWwuZ21haWwuY29tX187ISFHM3ZLIVJEVWNIcXBwajRHV2h6RC1XX1h4SDBlc3RHWW9wcV84alJP
UUVIQkt3RzhIa29FUnN4M1VNVUxXR3Roc1hhamF2MFcyUTNQbFRMdWMkDQo+IFNpZ25lZC1vZmYt
Ynk6IEVyaWMgTmFpbSA8ZG5haW1AY2FjaHlvcy5vcmc+DQo+IC0tLQ0KPiAgc291bmQvaGRhL2Nv
ZGVjcy9yZWFsdGVrL2FsYzI2OS5jIHwgMTIgKysrKysrLS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdl
ZCwgNiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQ0KPg0KPiBIaSBtYWludGFpbmVycywN
Cj4NCj4gSSdtIGNoYW5naW5nIHRoZSBxdWlya3MgZm9yIGEgbG90IG9mIGRldmljZXMgaGVyZSwg
YW5kIHRoZSBkZXZpY2VzIHRoYXQgSSBrbm93IGFyZSBhZmZlY3RlZCBhcmUgb25seQ0KPiBQSUQg
M2YyMCBhbmQgM2VmMC4gSSBob3BlIHNvbWVvbmUgY2FuIGNvbmZpcm0gdGhhdCBhbGwgdGhlc2Ug
ZGV2aWNlcyBhcmUgdXNpbmcgdGhlIHNhbWUgYW1wbGlmaWVyLA0KPiBhbmQgaWYgbm90LCBJIGNh
biBzZW5kIGEgdjIgd2l0aCBvbmx5IHRoZSBjb25maXJtZWQgYWZmZWN0ZWQgZGV2aWNlcy4NCj4N
Cj4gVGhhbmtzLg0KPg0KPiBkaWZmIC0tZ2l0IGEvc291bmQvaGRhL2NvZGVjcy9yZWFsdGVrL2Fs
YzI2OS5jIGIvc291bmQvaGRhL2NvZGVjcy9yZWFsdGVrL2FsYzI2OS5jDQo+IGluZGV4IGMxNzkx
YjEzNjYyMC4uOThkMjlmNGNjODFiIDEwMDY0NA0KPiAtLS0gYS9zb3VuZC9oZGEvY29kZWNzL3Jl
YWx0ZWsvYWxjMjY5LmMNCj4gKysrIGIvc291bmQvaGRhL2NvZGVjcy9yZWFsdGVrL2FsYzI2OS5j
DQo+IEBAIC02OTk5LDEyICs2OTk5LDEyIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaGRhX3F1aXJr
IGFsYzI2OV9maXh1cF90YmxbXSA9IHsNCj4gICAgICAgU05EX1BDSV9RVUlSSygweDEwNDMsIDB4
M2UwMCwgIkFTVVMgRzgxNEZIL0ZNL0ZQIiwgQUxDMjg3X0ZJWFVQX0NTMzVMNDFfSTJDXzIpLA0K
PiAgICAgICBTTkRfUENJX1FVSVJLKDB4MTA0MywgMHgzZTIwLCAiQVNVUyBHODE0UEgvUE0vUFAi
LCBBTEMyODdfRklYVVBfQ1MzNUw0MV9JMkNfMiksDQo+ICAgICAgIFNORF9QQ0lfUVVJUksoMHgx
MDQzLCAweDNlMzAsICJBU1VTIFRQMzYwN1NBIiwgQUxDMjg3X0ZJWFVQX1RBUzI3ODFfSTJDKSwN
Cj4gLSAgICAgU05EX1BDSV9RVUlSSygweDEwNDMsIDB4M2VlMCwgIkFTVVMgU3RyaXggRzgxNV9K
SFJfSk1SX0pQUiIsIEFMQzI4N19GSVhVUF9UQVMyNzgxX0kyQyksDQo+IC0gICAgIFNORF9QQ0lf
UVVJUksoMHgxMDQzLCAweDNlZjAsICJBU1VTIFN0cml4IEc2MzVMUl9MV19MWCIsIEFMQzI4N19G
SVhVUF9UQVMyNzgxX0kyQyksDQo+IC0gICAgIFNORF9QQ0lfUVVJUksoMHgxMDQzLCAweDNmMDAs
ICJBU1VTIFN0cml4IEc4MTVMSF9MTV9MUCIsIEFMQzI4N19GSVhVUF9UQVMyNzgxX0kyQyksDQo+
IC0gICAgIFNORF9QQ0lfUVVJUksoMHgxMDQzLCAweDNmMTAsICJBU1VTIFN0cml4IEc4MzVMUl9M
V19MWCIsIEFMQzI4N19GSVhVUF9UQVMyNzgxX0kyQyksDQo+IC0gICAgIFNORF9QQ0lfUVVJUkso
MHgxMDQzLCAweDNmMjAsICJBU1VTIFN0cml4IEc2MTVMUl9MVyIsIEFMQzI4N19GSVhVUF9UQVMy
NzgxX0kyQyksDQo+IC0gICAgIFNORF9QQ0lfUVVJUksoMHgxMDQzLCAweDNmMzAsICJBU1VTIFN0
cml4IEc4MTVMUl9MVyIsIEFMQzI4N19GSVhVUF9UQVMyNzgxX0kyQyksDQo+ICsgICAgIFNORF9Q
Q0lfUVVJUksoMHgxMDQzLCAweDNlZTAsICJBU1VTIFN0cml4IEc4MTVfSkhSX0pNUl9KUFIiLCBB
TEMyODdfRklYVVBfVFhOVzI3ODFfSTJDKSwNCj4gKyAgICAgU05EX1BDSV9RVUlSSygweDEwNDMs
IDB4M2VmMCwgIkFTVVMgU3RyaXggRzYzNUxSX0xXX0xYIiwgQUxDMjg3X0ZJWFVQX1RYTlcyNzgx
X0kyQyksDQo+ICsgICAgIFNORF9QQ0lfUVVJUksoMHgxMDQzLCAweDNmMDAsICJBU1VTIFN0cml4
IEc4MTVMSF9MTV9MUCIsIEFMQzI4N19GSVhVUF9UWE5XMjc4MV9JMkMpLA0KPiArICAgICBTTkRf
UENJX1FVSVJLKDB4MTA0MywgMHgzZjEwLCAiQVNVUyBTdHJpeCBHODM1TFJfTFdfTFgiLCBBTEMy
ODdfRklYVVBfVFhOVzI3ODFfSTJDKSwNCj4gKyAgICAgU05EX1BDSV9RVUlSSygweDEwNDMsIDB4
M2YyMCwgIkFTVVMgU3RyaXggRzYxNUxSX0xXIiwgQUxDMjg3X0ZJWFVQX1RYTlcyNzgxX0kyQyks
DQo+ICsgICAgIFNORF9QQ0lfUVVJUksoMHgxMDQzLCAweDNmMzAsICJBU1VTIFN0cml4IEc4MTVM
Ul9MVyIsIEFMQzI4N19GSVhVUF9UWE5XMjc4MV9JMkMpLA0KPiAgICAgICBTTkRfUENJX1FVSVJL
KDB4MTA0MywgMHgzZmQwLCAiQVNVUyBCMzYwNUNWQSIsIEFMQzI0NV9GSVhVUF9DUzM1TDQxX1NQ
SV8yKSwNCj4gICAgICAgU05EX1BDSV9RVUlSSygweDEwNDMsIDB4M2ZmMCwgIkFTVVMgQjU0MDVD
VkEiLCBBTEMyNDVfRklYVVBfQ1MzNUw0MV9TUElfMiksDQo+ICAgICAgIFNORF9QQ0lfUVVJUkso
MHgxMDQzLCAweDgzMWEsICJBU1VTIFA5MDEiLCBBTEMyNjlfRklYVVBfU1RFUkVPX0RNSUMpLA0K
DQoNCg==
