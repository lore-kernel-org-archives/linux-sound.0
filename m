Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.17
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794321908;
	b=pvt3YL+510iXeTrYNVBD9EeJxE1HnsfOw9iu3+CO36NTnIJdqH8f+UMH3gEamutXQ3It
	 a2K8qWvdWrZlCsAB0d7xjmAOQMPzs9e5LRgkGzFalNdkcCbBRnnaffKbYforaY7XpbdMR
	 WAgO1oXHMwume/hy6WwDH1cTMitc3iy/PyjYdra7WAzpMLA13e+6o/I7B+sPw6K7iHizl
	 N2z5GVmzFuXHfTMgOTuehvcFfJ+TDU4t47xoX4ogRBwgROz1mZcM1iFYJUSBk+kaauAD2
	 tWQRz9FyvZkpLGR3bDRCjH6LyshqfiO8pGSfh8OmVVf7lXP2nms7tXf4nvs0huYNB/A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794321908;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:From:To:CC:Subject:Thread-Topic:
	 Thread-Index:Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=UYeYI92jGir3kDdl+GDg9XiLQeV1wgj47M+0JuLFsM4=;
	b=BxuglajXpkYH2jxDLUQKIroTCudcDcFaZ2sGnjrB17sd6M5lb0QrQXjUdAtCuSb5sSqa
	 LYY390Xw1epT2PfCGs24AkabO/KTHinJWp86f/ddVbJT030l5m837PCADoB9gJXsnMqyw
	 lCfusJgMWA5CabVJKhrbz0qfk9rsIcyhA7fqGzXxkz2z/aiQ4RWMvS0mR2FygZoYFPOtQ
	 NOCjHUe+htjY2JmiWDAjM28qas8JvrDkjYr3ie+UPDnb3kBkm7N5rF+RZVuJuGdEIlWYb
	 2WW1Dbd7n3ooZIooVyIGtLDD8cCaOJJ0mZBPqugYftdUsD4yBZ1iDJ0qd3FLqFliZyg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RrdAJoDe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBA460A3825
	for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 14:45:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BBA460A3825
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RrdAJoDe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794321907; x=1825857907;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=UYeYI92jGir3kDdl+GDg9XiLQeV1wgj47M+0JuLFsM4=;
  b=RrdAJoDe68PVr4cji8ci6qe7EbxRG3BZXWBeHlPnNZa+EzzQGnEwyseI
   AdUfcT+BYYW+YmYqNAcGJvGAR8PZRqU7SGFTUtUXXka/nnRqn1e83QSZC
   sSKK47m7TNGOaEzi5z/x8wUMvBis6CZ/Ik4+IHnbrKiyboEROrI61ZT6t
   pZ4h0OUfwTvdrYVlHz4KUOUswboVGzgiZFm2nii6+e83PoKSzILWH8roo
   MNtgluyWjpgSypZwjZGdsuCXGJ8Gtvxx+wAe7M65dUi84jGURaiWY59eT
   tq/UdqTcwQsDbk49w64qIkOquO+ClhJwAoqcMX7FAmzmTMFsHnWyjoyzN
   Q==;
X-CSE-ConnectionGUID: EAeaoJ73QjGe3eCXO/S89g==
X-CSE-MsgGUID: D6dLjWfjQDS8DEmeLcGhvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3070566"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="3070566"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 06:45:07 -0800
X-CSE-ConnectionGUID: d26WPjG8SPG0dp7ttWEevg==
X-CSE-MsgGUID: kxgw1broQo6qkBj14ORqrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8611971"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 06:45:07 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 06:45:03 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 10 Nov 2026 06:45:03 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.26) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 06:45:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eRDEek3jgSAsFjhe1S79lm2OvK8TzFnXMARxk+D5JPDoW07G/2q1xFgqliEthx0kyZFxtVmXdK/OUvAQCUdZz7Q0uhY2y0NH0PlK0Qkn5MgFSFWFcxCKZkx3GO4gQELz2vBkwVExfN0G/zwcKgyh0qGQG3yFQbY/0RTqZ2aDWsIZGGPCkTmEhIFS9DBUdSFg+OdhVZxiPak16DmONsKceGHOfHPYq1O+m5IF4OFarMqKVJWo5HW/DZhB6NfSh4cdU+9nqnuNgD46pf//knwUvkDjYHUgt7GzS3BkZ/+yXmMizYMLp6MtYBMTOujtO3C/iaAPXifsYdta8J5LO9kHlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UYeYI92jGir3kDdl+GDg9XiLQeV1wgj47M+0JuLFsM4=;
 b=TTjkxd5NWledPlA4CTpKlW7AvK1GtVvocjmFb8ZoiH/3wS0K5286nJeAYdD4d0lL4aSp1trtIbChR5AVAP9eMU00RgPtehY/G4bU78b9/drxNepfVJZk4Cvqsd7QQrgHSnhLw0YHjFXbhuE9UlEVUK2+udU0UL8GWmZASRcHMMyR2AaExqHVCVwu/LVzeJRIxpx1Z3UDwaWqjJwKM6Fj6Bry/AfDxbR2uebRuPCy73aiaJMFUOv446jqw4fXhepIoW9fLnI+FkmrJAm8Ee/N1Lr4nqUurGT6+yYX7f9IBn3rexhgtAmgd/hhTACUuuGQYMn4UTgedYmo+RdnKMaQSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com (2603:10b6:a03:53e::10)
 by SN7PR11MB6827.namprd11.prod.outlook.com (2603:10b6:806:2a2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 14:45:01 +0000
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::3df:33f9:59a1:da76]) by SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::3df:33f9:59a1:da76%3]) with mapi id 15.21.0592.010; Tue, 10 Nov 2026
 14:45:01 +0000
From: "Liao, Bard" <bard.liao@intel.com>
To: Qianghua Wang <qianghua.wang@senarytech.com>, Mark Brown
	<broonie@kernel.org>
CC: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>, Liam Girdwood
	<lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, "Rojewski, Cezary" <cezary.rojewski@intel.com>, "Peter
 Ujfalusi" <peter.ujfalusi@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, bo liu <bo.liu@senarytech.com>
Subject: RE: [PATCH v2] ASoC: sdw_utils: senary: handle a missing name_prefix
Thread-Topic: [PATCH v2] ASoC: sdw_utils: senary: handle a missing name_prefix
Thread-Index: AQHdcOsmaiaY6TcZ9Um1DnEi/0hhPrcnYamw
Date: Tue, 10 Nov 2026 14:45:01 +0000
Message-ID: <SJ2PR11MB8424FE5B64FEDEDA5F947D30FF722@SJ2PR11MB8424.namprd11.prod.outlook.com>
References: <20261110073420.842175-1-qianghua.wang@senarytech.com>
 <20261110080535.870596-1-qianghua.wang@senarytech.com>
In-Reply-To: <20261110080535.870596-1-qianghua.wang@senarytech.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB8424:EE_|SN7PR11MB6827:EE_
x-ms-office365-filtering-correlation-id: 63154150-b8e6-4163-c418-08df3f393304
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|376014|23010399003|1800799024|22082099003|18002099003|10067099003|11063799006|4143699003|261026121527099003|261026140227099003|261028144727099003|261022105027099003|56012099006|261009223027099003|38070700021;
x-microsoft-antispam-message-info: c2OasZyu3lgEMEy+2wEQGh+yhrjuBMTrKFnnO7i+8iiBRlVtb3lzSoJCA9bMKN4LhQ1PzwY/nFs6Ec3FkHHpgkcmXBFvcUIVp8qS/xt4V4KAufPRdVadASXDSLEaE1Ova4WaiHac9LUrlpxyyvD9YJLYJQqDIFRObW3IujHr5635b96OsZg8Rmn4MRbDZQ+hCs6xrQ/0h9rO0gEWpPeEGZNSy6JTj+h7sv9wC2wC1fmYb3+PckWwNkqyE969yB6dfOUvLPVL3XZxUgQUz3nixkheVIQSuk6N0EfJ6Q0+vbKWeHbPNTd2TI+uZGsAmwn8JQaI+PzXSUnFNQHRgzDQXQA8Mw2xWw1YlgwD23ZewL2pvbJ1srnZf4MNOAJFeOb8i+ahFcAmNW4ptQZNe5RQbpVcQJJAkpHbcpL4i6bY5GdUfTV0haK8K7qNBfhecpUZKaExSvjjL8uQy3U41u2B5dlzi2IxhNqv04kyaqV8L7nDKGtvMgOEFvk8WJ9bXkJGrxyy42zWKAlFCu8k/yp63PhUnb7FJd+nhkg0opbS+NMs/cN4TwN/sUay/QlQ9yV6nLVGyIgw+wViAg3R7VRN1xqLtkw4HmKfX57vMQBMKIi88yCQiGbN71wcRNj+PzRIfBH5fetUmfCJteVjdL4v1VSYTi0pdH17D9uKY5Ge0xmExsUZaMsIlYcE2YN0qivzfn534PN8tWas3y+jW99rwpaecMtsgmdxN6Zbf65R+qg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8424.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(23010399003)(1800799024)(22082099003)(18002099003)(10067099003)(11063799006)(4143699003)(261026121527099003)(261026140227099003)(261028144727099003)(261022105027099003)(56012099006)(261009223027099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0s4T+S75To5YAi6PWvefb91cISKv1yXoR9zHtY4M1Sn+e6nS00WN/Xt59XG6?=
 =?us-ascii?Q?RrUAlM/+sXmkLw+t63ho+OGWWVivAIW48x0YdmDrU0Y7V7JmJftKOIVIpSbW?=
 =?us-ascii?Q?zzn93Ajs/iCdS8UFjPW2r2yOLbOXvUiPdjBifmkFjHAw4fiw+gaMEqx6BVPH?=
 =?us-ascii?Q?8K+xR8rzgX+TZ1LuykxsUapCrzW40vrIDrotAhwi7HetiYQGxE0YJSkI1xEZ?=
 =?us-ascii?Q?4c6BzysYLs6Q6JpOVo+PlAByewzm0jutFulNoCDIVVS93MZCPI6R7XGmxpVz?=
 =?us-ascii?Q?oIhiWePguCNedtq06JsMf//Acz1VS7tVqwtQnNUHPIpmH047Y2MQQx1XrmPp?=
 =?us-ascii?Q?/pA2Nxg5tolbR88yocE7MpgRbzKuGgJScCBKbJQr6pI+bGy1LWEYs2fJ6Qmk?=
 =?us-ascii?Q?tScdg1dz0tBfJYl98tswCV2bYEYv75p5VMEN5Td3kTfAgoQSyDpv0ZtHbJK3?=
 =?us-ascii?Q?mGBe6F9dfdnFOZ5ctrZQ9gIZAB4kWPeiHapQySYMzHU23m/0ecTyBx/sNO7W?=
 =?us-ascii?Q?ou4cEJa1XI7c+21sQEMkblckkB4xo6RVXHjRgqI/SbWwFySlF5Xk0eJU4ibJ?=
 =?us-ascii?Q?RBs9ZZTM3KSlI+xRIH5UkM6/9OR9QlNGkaTToyGcqI/OXXm1J2NIImE3YB3A?=
 =?us-ascii?Q?JAymPrPNczj128MJicpctN2/L7gUcWIMKSfgXqPoH1S7PpGIzIdrKqwUMxC/?=
 =?us-ascii?Q?Y2ojKzrFIXdyZ74CWVqXUMmHA3HYFNf8srwmuLKvSD0xkiOMIraCUe/hcstm?=
 =?us-ascii?Q?jlSGshsy4af91oKh99hHVhfNkqHjRIULQmBa+6SGWFwzM06DaUCpNCDlyNxT?=
 =?us-ascii?Q?Tn3DtA0VygK1deNZ8m7vpiJoZ9xZSrso5khyRU0+ywVPhXeYTUxANIGSzQ/z?=
 =?us-ascii?Q?KgLkE2q9lk+v4SM07+Q/e08y4JJ5bXVLZJY74iORzjF491PtkCLpJnDCAMbK?=
 =?us-ascii?Q?HJ5k1kJHXkvLV7MplA12IiG7iUZu1Oya19ZMHV1g5E2B04siSeTlL2JP3hOF?=
 =?us-ascii?Q?ZvAbxotXKtoJiG/T70l2Hja4JHpFdgwQXR/lUBtIW2/STS/rt337NngKRF0I?=
 =?us-ascii?Q?qp7rDdPHfEKbFWl1kovUUPul+PyaKgpmSL5DRjcUhHw5URIZDUjPBzQtmZmI?=
 =?us-ascii?Q?sgMK7gCW+9CIhwFiNufP+YmsteewOR8VFrXIcQ+ps4Xz1nSey9dusAQMfKWH?=
 =?us-ascii?Q?qmEk4azdyYZR8LjUZSAqwh/s1acWG66QE/MTKR50p77ms/AF4vivlIA/ZXxm?=
 =?us-ascii?Q?7g1xfLgU0yfREqPTKEJYYVFa448iGxA7Tyvpbm/djhjYweQf6In+7wev54p/?=
 =?us-ascii?Q?Q5EUs+x6PbVIkrLXpdf6DGCHp6O9O3ZmoUBy8dPr0rdicvhJXkdyQ7zDdm/h?=
 =?us-ascii?Q?cokjp9bB75Q6aT+PVxGVrMReimXP78r2JOWa9Lq7+WB8dDRikBhNLE44SXi0?=
 =?us-ascii?Q?2SV6fn9Oi3TLXKG2ZD0fMxExCjcMmOCwzORNJKAjG9O7KQh7b+L0EbpiByiH?=
 =?us-ascii?Q?OHedf1SM9PSx1DAlKRVbuJTKu0fEQBowvfj1sLgDOCQKwUnLG29dqB0cZxEe?=
 =?us-ascii?Q?m02NNym2NAGPTK9fVyUTk0fxRbuUK8YBTI+RngvaEec4MAVDpA97RNDmMNko?=
 =?us-ascii?Q?h6oMbhqLD77B4hf60KC++NxYxUjPVkQzi6LuV++Dd9IvQAvjA/dEJ5Ejyasv?=
 =?us-ascii?Q?Dw9i4Qz3knd2GpIYIZAhIPYsgGnNgMf9/wcgDoR6t5otI7my?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: DG/4ImANMn+SkDEft854ijLsro+5g2aWByG2z6YDflzL7WBclCvry2hjI2HctGVI9xfAoLfvYMTjHGOPdKlPSkufsDcWOySy6H8i474iz4h01hhhGXGbvvPU8hRjBWK1cqWMuPCUzG7IIelTZmHu2jCK1GZCqZ6boxH0yg5wL0C05rUsKP3bFddrjNpU3knfP7ujwOJMPdaVmwGjsXCTTi6HNwvRYYRP9OaQ92AfuD0i8kQZYRjLn8qhBekdyb4fBtN4Kp9VhAmPZsQTW07YYn5JSg85kgvwGwh8Pc1OsIpat6DbqtSQWyaoMr5KcEeP3ROZC8HxzogloVkIcNZTng==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63154150-b8e6-4163-c418-08df3f393304
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2026 14:45:01.1490
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iqYf1eZBYx5J/btDHFYTl9VU2cBoNbh1HcfXM5WbQ10lCHq7oP+Dw/TbMGy5l1fWDMF7gDnvWGy8DURbua8bCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6827
X-OriginatorOrg: intel.com



> -----Original Message-----
> From: Qianghua Wang <qianghua.wang@senarytech.com>
> Sent: Tuesday, November 10, 2026 4:06 PM
> To: Mark Brown <broonie@kernel.org>
> Cc: linux-sound@vger.kernel.org; Liam Girdwood <lgirdwood@gmail.com>;
> Jaroslav Kysela <perex@perex.cz>; Takashi Iwai <tiwai@suse.com>; Rojewski=
,
> Cezary <cezary.rojewski@intel.com>; Peter Ujfalusi
> <peter.ujfalusi@linux.intel.com>; Bard Liao <yung-chuan.liao@linux.intel.=
com>;
> Kai Vehmanen <kai.vehmanen@linux.intel.com>; Pierre-Louis Bossart <pierre=
-
> louis.bossart@linux.dev>; bo liu <bo.liu@senarytech.com>; Qianghua Wang
> <qianghua.wang@senarytech.com>
> Subject: [PATCH v2] ASoC: sdw_utils: senary: handle a missing name_prefix
>=20
> asoc_sdw_senary_sdca_jack_rtd_init() passes component->name_prefix to
> strstr(). When codec_conf does not apply the prefix, name_prefix is
> NULL and card registration oopses.

In what case will codec_conf not apply the prefix?
Won't it be better to ensure that the name_prefix is always set?


