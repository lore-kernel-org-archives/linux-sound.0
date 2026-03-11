Received: from mx0a-00154904.pphosted.com (mx0a-00154904.pphosted.com [148.163.133.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F84C1A6829;
	Wed, 11 Mar 2026 13:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.133.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773235689; cv=fail; b=R85idnxq66yeGN+hQvimUohe8tGuOFj2546TQc0Jx12u/gZHAY4Z4xZJbMTjGTyVXibl1Wcf+2BMcdzvGNo6uVo/M2mw1k8B9yA+DaH60WUbJQXifFpzT1Wb1vsGblgxZBqPQEZbD3BtPOks3z3CybABtCy2adkXXmbo2hGRfGg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773235689; c=relaxed/simple;
	bh=szA5VDsErNP3yk6X9rJgMmNiVUCTehWwJTLwushLPI8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ur0vZ+RHZM/0NFu1AUtB6PXD01kMteOeY5Qc5n9O+e2/bwP78xFinfUQNdsSBob7iRPJxAt0RMk95Xuupz203Z6gaqBk2qk0JAPvUas2Gb432X3HMaW+r33PKxQzs7uWwfqgcRavipYkfC5agSWgek1iY6lHsRLnKsLLMh+fnmI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=Dell.com; spf=pass smtp.mailfrom=dell.com; dkim=pass (2048-bit key) header.d=dell.com header.i=@dell.com header.b=Oz3DFqLj; arc=fail smtp.client-ip=148.163.133.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=Dell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dell.com header.i=@dell.com header.b="Oz3DFqLj"
Received: from pps.filterd (m0170392.ppops.net [127.0.0.1])
	by mx0a-00154904.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B7pheY030910;
	Wed, 11 Mar 2026 09:27:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=smtpout1; bh=6
	8Nl27OrPjymq5N1cMMfhE3hvq8g2cVnKCFTcQ4PHp8=; b=Oz3DFqLjfJiHSU7+O
	Wk+WLx7UlgUItpr9muve9klhqvtVWV13vlZV4U7Bumz0Q5eIn0so2GghAE3zsO8z
	O5ESXKcFR9pS9Z2FXmDCawPc3oNCzDkmoocLOhRmHC+hobRhydsH6yyxH17iA5Op
	WITa7EWyRvuzdPNboAXi2lML3S+hAgbGtDy860p98ql64KfKCnCPIelIQNAcoiY0
	r603EFIlHS7teSB4tUbp/X0f0G1UHT+RFVgPlhhOI3ZiUGNWPeXk+PlRkI7Pk1FO
	AK8HtuPwWeFg/CuU5Os2xKQp94IHuyEHQnuSPhm6Q/Xe93Wr5ByKUTGJMRra+tg+
	qyQzQ==
Received: from mx0a-00154901.pphosted.com (mx0a-00154901.pphosted.com [67.231.149.39])
	by mx0a-00154904.pphosted.com (PPS) with ESMTPS id 4crg2bgvgh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Mar 2026 09:27:29 -0400 (EDT)
Received: from pps.filterd (m0371675.ppops.net [127.0.0.1])
	by mx0a-00154901.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BDEKSP901622;
	Wed, 11 Mar 2026 09:27:29 -0400
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011066.outbound.protection.outlook.com [40.93.194.66])
	by mx0a-00154901.pphosted.com (PPS) with ESMTPS id 4cu93m86v8-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Wed, 11 Mar 2026 09:27:28 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XTGAe6toaKxLAXXUY9p7pV0vPYFEvkIv9BySQb3jdNyVensN28s0UxEE3n9O/ILpZjL2xKNlia9km3UCHoomQTLMeZQ/PBtIjrnCfKhOG0tSpYu0XpANHyUd0XCU7++RDhvLsQ2kuLUkjXyO6WSTZr1J656gmjD6fXfW4jhXKCUSgoouKzWjtp5Ff2+4Qv3TZcIikDQR9Os6850UVTjgroV5HpqTJ/cIfVqIPzPIy89fEIMYiSwMqnmfPhwfTjTEXoSKyeVsaaT66xfR6Vh1PjLyqzuuUOUalCVwymEPNAweqHg8fkLN/mXIVF2MqFtse369dK4ATPMp4NGTqCPV4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=68Nl27OrPjymq5N1cMMfhE3hvq8g2cVnKCFTcQ4PHp8=;
 b=AtLvgr6z4ouM5bXK3kwbhmQAlQ34A7JBg5O0zv/e6Jwro10h0G+A638BHduFGmmJ6v3F2EBuQxhobEQWzIyJyHFtaPB1Fq++Is3h4jfVKBnWZ0KdXGntS7waX9zAcjRS0nbZEpN5QATMiXrJUFXDkz9Om0AfJO289v7ipVTxRtitvF/zbDSULxZzhXP+ZxYR/bcOj0zlD2zj5imco3jOFE9JtlHZFgV467U5YnS055hBKhK4XOPjXHeHQrMAnFzWIXI8nuC91ZkctSvPK7XXND66zz6Yl9eYXRGVJ4f4PGLiIEINok59R181lq06ZjeW61UPks9x7e78XRDJvAPSUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
Received: from CO1PR19MB5206.namprd19.prod.outlook.com (2603:10b6:303:f2::21)
 by LV8PR19MB8672.namprd19.prod.outlook.com (2603:10b6:408:256::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 13:27:24 +0000
Received: from CO1PR19MB5206.namprd19.prod.outlook.com
 ([fe80::1814:bf75:7f13:8880]) by CO1PR19MB5206.namprd19.prod.outlook.com
 ([fe80::1814:bf75:7f13:8880%4]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 13:27:24 +0000
From: "Harsora, Deep" <Deep.Harsora@Dell.com>
To: "Mukunda, Vijendar" <vijendar.mukunda@amd.com>,
        "vkoul@kernel.org"
	<vkoul@kernel.org>
CC: "yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>,
        "pierre-louis.bossart@linux.dev" <pierre-louis.bossart@linux.dev>,
        "Sunil-kumar.Dommati@amd.com" <Sunil-kumar.Dommati@amd.com>,
        "Limonciello,
 Mario" <Mario.Limonciello@amd.com>,
        "venkataprasad.potturu@amd.com"
	<venkataprasad.potturu@amd.com>,
        "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH V6 0/2] soundwire: amd: clock related changes
Thread-Topic: [PATCH V6 0/2] soundwire: amd: clock related changes
Thread-Index: AQHcr4vIwqrpw2pybUa4Tnyd+lFVj7WpVXWw
Date: Wed, 11 Mar 2026 13:27:23 +0000
Message-ID:
 <CO1PR19MB5206CEA9AA23242964F1F859FA47A@CO1PR19MB5206.namprd19.prod.outlook.com>
References: <20260226065638.1251771-1-Vijendar.Mukunda@amd.com>
 <02ee420e-c693-4e98-8eca-98a5a47855c2@amd.com>
In-Reply-To: <02ee420e-c693-4e98-8eca-98a5a47855c2@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_Enabled=True;MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_SetDate=2026-03-11T13:23:40.0000000Z;MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_Name=No
 Protection (Label Only) - Internal
 Use;MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_ContentBits=3;MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR19MB5206:EE_|LV8PR19MB8672:EE_
x-ms-office365-filtering-correlation-id: 2e1bcfe9-87a6-473c-ae72-08de7f71ede7
x-ld-processed: 945c199a-83a2-4e80-9f8c-5a91be5752dd,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|786006|1800799024|376014|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info:
 IkvOHmXEWiO9RaMkSMIHbIvkIQUhh592hfWrzl8fyQoEDJfYWrjsY9bJ7BznwV+o0dWqAPpuR0eYH/79750YppyTMuBGbMLLbVZ4jTzAYZ3h9lfyRtCV2uiEiPt2z6+N6Ona8Hy1yVsKF+niTmHUbE8vQa2AunvkfNAWSI5B1bQ8JgMjDyAtjmiZfvN2gQ4L3I0/EekAyVBZoWgrO0hWLxCafTsSpIgikb7Is41F8G4mdQnd6WCgo9cZOb8jRz51SgcB+62sjnZpNXXPME4jE1o3d66YeFNPn4W1qo9lZGZEjbsySEYiWZ1UKobtB45pvfFDDpQizBW8tRNclmH9UlVrhsMBu/1t6MPgANpHNBw+1Q1N+iUIYpFv1TXvXSzL7PyVUtLHnasopsL/I624S2cA+Oua3ppfbQL63+Hj3pJcPpmlZ06HzuhUub3OEHSbkGHxerx0cY0kMWzUmjqrGbcZ5646y+k1lqbma4FYJPFQzfwJw4syuXplt30obwCH0dPDYzBZvEFjkN7b2BF5jy0JA+4U8sjgLUe0xwNgwKyFMJnwzt74/Lw8BKshJ55WfPTOligf8dkpGTrRs55Q5+luIt/cOsI88VwUd9NYA3bkC/zrNchgKUk2fdJCnuelooUA3hE/ueqbywJLhIbSGoqNTKbFUSePsT/NnzsV+ROaPELZcZTceF2bVfG8ObApqLTKLjmdSPWkKcr+GMAOUcJgb62qSjmg0qoL2qAKcR+6KnfdUlvGne2WdcKl6BlE0L0UTetNdnZA7ugjfG0OTfRxx9e3I0epk9ti6jF2r3M=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR19MB5206.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(786006)(1800799024)(376014)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-7?B?T2IzZXZ3V25OWUpUUnl0VE9va1NXNlZxbUZtZkFVVmp1a0c1bDZNbllUNFlj?=
 =?utf-7?B?NklLZUFEWnNhRVZORk8wbndqU2tZOXo4QkZkZXNXN0RIKy03UnQ3eC9RcCst?=
 =?utf-7?B?VlZEQnpyZDdxeTMrLXJLckRaYUhBeldaZkVUUE8rLTdlcUVmN0hObDhJTWNm?=
 =?utf-7?B?V1FTYWxJUEZXVnE5S1hEckJMRWovRWF3TnNqY2Q4WVV0UEl0WjZIbGtpeVlj?=
 =?utf-7?B?OHowbmtTS3FpNlFOYTNjdFk4eVI1SUN3WTBVNHlvUmsrLU9tVWNqVENMNVJB?=
 =?utf-7?B?d0E1aG85N09vVGVQdWxSSmdmNGhKbzBUT2JaaXpmaFhBUWJCRG1ESkFpaDQ3?=
 =?utf-7?B?dGEvMUcrLVJ5MnkyL09YZkhhZkkrLWdRWTRKN1QvSEFLbDZDVjdnaU8zV01o?=
 =?utf-7?B?MnM4Rm9KR2lyT0Z4Q3pIbWhBTkE4UUxBR1JqWXpDQUdDWkozM3k2cEtTZmFW?=
 =?utf-7?B?R203YkJpaGZGeXdPbm5kN1BWdzN1Ky1zbDNaamRmRWVCZEc4MnI2USstdmk=?=
 =?utf-7?B?dSstc0RhUThkTExmUmVzMXFESVByY0M2ZFdIcHQ4TGYxQ1Q3cVpCSW8xTnhl?=
 =?utf-7?B?MHREMnFYNVlkL2dVbFk4aU9HbllhQy85SDNDb0JJc0hheWdTc1g1YXg3cnVS?=
 =?utf-7?B?V041ZEF2WTU2Z0dta1l5eWtOeEhqa01vLzczZGl0UWtBY2tHUGVnYWxJVjZK?=
 =?utf-7?B?TEttejcrLXFzSklFL2Q3bGhSSXFMVWw3TGdibUltb3pGeGZBczFvRnpuWGln?=
 =?utf-7?B?YmN4RjJWTkFNZnQyMGVNRFg5Ky1JRFIvcHJRSXVwMjBUa0tGSkorLWtIVjl2?=
 =?utf-7?B?c2ZaUHlSdTdZNmYzV0pnNm9KdzVkYmJnczdNWFFmYnE2UXZ3WHNKekp5SEQy?=
 =?utf-7?B?S2RvQ0s0NlZlYncydDE0NkNHR1FnKy1pb2g2bzk4MnFLaFZFeWlxMnFkclQx?=
 =?utf-7?B?bUsvQzVmelQyb0ZxcHBrV1I4enBndEpvaFRKMVR4OW1LU1BWMHJrN1FuZWh2?=
 =?utf-7?B?elJtR0M1cUlXRFMvWXlwTkNmZnp4RSstVHpVL1RIZWlYZm55bnpRZmJOVTNN?=
 =?utf-7?B?V0FZVkF4M2RIc0tLNzhacTdTNGtJcVlGVkowLy94YjRYRzNFdUtFZzZWcmFl?=
 =?utf-7?B?dlBxa1N2Rld5ME1JenRBSm9VdVA3RW9BSkdLN3RzZER1RXF4UzNpcDJ3NklI?=
 =?utf-7?B?UVB6Z0tuOG5FR3hETGFKN2tMSVRTUzdjMlNDVk9GZjRBaWlRQ2RQSmJMalpl?=
 =?utf-7?B?ek1GTjF6UHBsdmtQaTdrdVF2aXc1amdJeFNkNFg0cXhnc1FDQjRzNUdKeHgx?=
 =?utf-7?B?ZGpBdnRka2I0TUQ4T2FMSEFlaUpqMWxPUWppcWQrLUhubTBnR2hhZ1d0Z3dC?=
 =?utf-7?B?T1phaW1Va0RBc2RhM1V3TUorLWMwN3lCM2VvZ2R6a2ZnQ3NzNnFnNkZ2S1Vx?=
 =?utf-7?B?bTY0RXlGdHFSUmV5c0pjYnFxblVEeUErLURmWmw5R2VHU2h6VHJUQ2p0U2FQ?=
 =?utf-7?B?VzV5TURRb1dGUHh1ajhqNXpUKy15UFp0Q2EvbEIyT3dYVE5qQWZ3QU1nTXlP?=
 =?utf-7?B?VWdSNmN0NU56cm9EOVEvTWZ6a0pkZzZaT1FXMWhGdDZsQ0dDRkFaaU5oMzRR?=
 =?utf-7?B?ZEd4N05QZ09zOUZHdnFac0Q4UVRkZm1nb3BoYistUkpJbHJyNFZaVEpLTlV6?=
 =?utf-7?B?d3p5QTNaSWFXWXE0TVRYdistNXpweW1lREd0czJKN1dQRElGMEtTdzIrLUc=?=
 =?utf-7?B?dystU3JYMWttQWtkMVlGWUc5Qmt4QzNESWZGanNrVlpmeXBQOXd5emQ4dGpD?=
 =?utf-7?B?T2t4eTE5OXBGTnppRnRkQ1dhTGZMZ3hYcmpaNVVHTi9hYWF6Z1EzUVNxMDYx?=
 =?utf-7?B?ck0wRDhFSUlkKy1RZXJ6bzBXN3RGS2JQNnRub1NoKy10dG9EanJDYUpuLzJ2?=
 =?utf-7?B?ejdXbjk3bWZKZTNVY05MN2RFQVBPcWtlNisteUNJVVdleml1aWh4NHZhMHBF?=
 =?utf-7?B?WkJoSDdUTEMzVVlBM0xLMlhtN1R4UTdweG85bjFwSystb2o1QmNFWjF2dUJm?=
 =?utf-7?B?VFJrUGhFOGFqTEM5ZHdSc1JPcExqSTZpL09iMS8xbXliQmtqY1JNMzdQbk02?=
 =?utf-7?B?b0dVUUs0bkFOeGdHOVdpNUVlZ3JNTystZFRHVDlkOFBrRk9ZbXltQWZhVE1m?=
 =?utf-7?B?R01GckQ5djJhUzl4Z3AvdWh2UFREekwwMUVTVVJoM3NvaHJRcUcrLTNuODBB?=
 =?utf-7?B?RG9xSlg2RVcrLTUxdUhLUkYybWlIZlBaS205TTAyNlR2NW5ydUZ3bUJSc0lQ?=
 =?utf-7?B?UXRWUTcyenNRSjlFVXpPSEYveHQvN2Q5My9wcnUzdEtja2laM0Y2Q1lnNEow?=
 =?utf-7?B?UWo0NTdPeTVKc1NJKy1LOW9DRDF6Wk9RRmxyUStBRDBBUFEt?=
Content-Type: text/plain; charset="utf-7"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	Gx8fPL4OYL+CH27BaTY6n+4pUsX49xXs7fw7BF7Fyv/IsZ5pG2+Qv9khe6C1pDjNcX35ITdcUnLnfUf4QnsHpLQ5qD+yRJmTOw6m0Mc2xi0WZgRLjvK0hGG8leuDQiqIaGY5WcKvjcdkWhEOJ+w376e8pUmykaUdVPZhMAGnDGK1FXCBWpLLZSd9LF7BMxV/stOsMgub8SG3SOvQBlG5p+FblAxgPADHkHdApOeFTwULHw02POv1aIOf0l43Efm0yUnV3PiBRH2V5SmNL9s9C/ILNBaaTKFJ+dLRsifMAX7gSDvzpAuvI1LKZr5EYgaziFa7oj51r80daJby+oU0hQ==
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR19MB5206.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e1bcfe9-87a6-473c-ae72-08de7f71ede7
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2026 13:27:23.1942
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YVu2IXUviuW5NbjiIylhH+aq4HjWENaNh9JIALNHR1HKAm8FlvFWMXXFTgo+KscNMQemKlPDf4+mCdYz5NvfXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR19MB8672
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1011 suspectscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110114
X-Authority-Analysis: v=2.4 cv=Y+H1cxeN c=1 sm=1 tr=0 ts=69b16dc1 cx=c_pps
 a=j0++y401J6f/BxNAf5EDow==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=wzW8d0FwaosA:10
 a=YU3QZWNX-B8A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=6gNNCFAoQcIphELLPWWu:22 a=m3zZTHMLHbwB7Lmtoed2:22 a=iLNU1ar6AAAA:8
 a=zd2uoN0lAAAA:8 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=LfxEVeEBAAAA:8
 a=sS_K4Su9AAAA:8 a=c1PdSmG1AAAA:8 a=yt-sdrcKZX5D3m4o18MA:9 a=avxi3fN6y70A:10
 a=gbU3OgOOxF9bX48Letew:22 a=7k9nRlTqVbDGZ3p5_T00:22 a=QaANnTo53oYaUAiVOp1Z:22
 a=4iM0TfZbaBQr0p37pvCp:22
X-Proofpoint-ORIG-GUID: kKXbkoQso_g0JElzX235pk1U8qb-RhUg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDExNCBTYWx0ZWRfXzfATGWSFHuGB
 WnA3ft1taWlVwU9+Y5dzA/YhkuOANfuRaWkaBzhWY2xyoopls9dQacYiNQTAjC5vBvLEX/R7scp
 HVNGKq5g7OgeDzGhrCWytimSFuPmzGN8nnqUPG/gXNwATS7Fq2RQI6lzmXkPdVzoa+3YyTl42ui
 l4szfCxn56yVXvmVOEzq870+asFVyOie/xya2+Q8uZEGjhxEIFG2A7qiEdemMLxrg0XfgquZX6G
 ghODC3BAC+GfvR+dygyy/zjcykEZpUmpLzEfHidJHQSI+DWYJ8j+W1nwbq7gXCoRDbGL0ECXAxd
 z9Paf8qegJhngrNjeN+bFGdfTbhRy11l5O2TlHeiIi3uryFZQdfgXZZlNfHXyCEWhVmkojfXGUo
 u6ONqcoC6l2H4uLcgqu2tuoWKvsiES0vjvAAyqfQbiYA5iI5jroIO7UNlCPyI1+B+8QCh9h1JTR
 /K6UJtpxFgttNYmEHeg==
X-Proofpoint-GUID: kKXbkoQso_g0JElzX235pk1U8qb-RhUg
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0 adultscore=0 clxscore=1011 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110114

This patch is verified by backporting to 6.17 kernel. Works for Some Dell p=
latform.

Tested-by: Harsora, Deep +ADw-Deep.Harsora+AEA-Dell.com+AD4-

Thanks
Deep Harsora


Internal Use - Confidential
-----Original Message-----
From: Mukunda,Vijendar +ADw-vijendar.mukunda+AEA-amd.com+AD4-
Sent: 09 March 2026 11:43 AM
To: vkoul+AEA-kernel.org
Cc: yung-chuan.liao+AEA-linux.intel.com+ADs- pierre-louis.bossart+AEA-linux=
.dev+ADs- Sunil-kumar.Dommati+AEA-amd.com+ADs- Limonciello, Mario +ADw-Mari=
o.Limonciello+AEA-amd.com+AD4AOw- venkataprasad.potturu+AEA-amd.com+ADs- li=
nux-sound+AEA-vger.kernel.org+ADs- linux-kernel+AEA-vger.kernel.org+ADs- Ha=
rsora, Deep +ADw-Deep.Harsora+AEA-Dell.com+AD4-
Subject: Re: +AFs-PATCH V6 0/2+AF0- soundwire: amd: clock related changes


+AFs-EXTERNAL EMAIL+AF0-

On 26/02/26 12:25, Vijendar Mukunda wrote:
+AD4- Refactor clock init sequence to support different bus clock
+AD4- frequencies other than 12Mhz. Modify the bandwidth calculation logic
+AD4- to support 12Mhz, 6Mhz with different frame sizes.
+AD4-
+AD4- Vijendar Mukunda (2):
+AD4-   soundwire: amd: add clock init control function
+AD4-   soundwire: amd: refactor bandwidth calculation logic
+AD4-
+AD4- Changes since v5:
+AD4-       - change the 'divider' variable from signed to unsigned
+AD4-       - drop dev+AF8-dbg() logs in clock init control function
+AD4-       - change few variables(stream+AF8-slot+AF8-size, max+AF8-slots,=
 next+AF8-offset)
+AD4-         from signed to unsigned in compute port parameters callback.
+AD4-
+AD4- Changes since v4:
+AD4-       - update commit message
+AD4-
+AD4- Changes since v3:
+AD4-       - drop unnecessary debug logs.
+AD4-
+AD4- Changes since v2:
+AD4-       - Update commit message
+AD4-       - add comments in the code.
+AD4-
+AD4- Changes since v1:
+AD4-       - Update Cover letter title.
+AD4-       - Fix typo error in commit message.
+AD4-       - drop unnecessary condition check in compute params callback.
Adding cc Dell team member
+AD4-
+AD4-  drivers/soundwire/amd+AF8-manager.c   +AHw- 100 +-+-+-+-+-+-+-+-+-+-=
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-----
+AD4-  drivers/soundwire/amd+AF8-manager.h   +AHw-   4 --
+AD4-  include/linux/soundwire/sdw+AF8-amd.h +AHw-   4 +-+-
+AD4-  3 files changed, 93 insertions(+-), 15 deletions(-)
+AD4-

