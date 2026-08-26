Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EAB713D891;
	Wed, 26 Aug 2026 03:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787715960; cv=fail; b=C3rQvuBwXlnlo7OJlqC7EuUODGd2k3CBu3SMsnMqarax7sA7tog2x5TG9spuFWaeQi+4jgb3n03Bl/xqn6iOLgr+lwxt7/eV+AtoYgRvXCeFP+bdBSdi6ptyJlLso5sZxJOIWZ6OEUHjHg+a+PPJq7Is1BfBUh1NDk5q0t4/kQw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787715960; c=relaxed/simple;
	bh=pyq9xOSJvIMJr1pRriEoQ7aBznbMGv+WEynKNLQxD+w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=of7aJMm+Sh5Sr/Bqq70itUrkz7A1hbqpmAGfFOoxaO+NQKrArRCk4KKqI4KrK10zF0KCTTvWKiXdbRt4j3itk8ZTj4Q3h1iy0DLZLchUwO/sb7u0kJ0XdSkX5HkwgURG45CKxnrOFX+AP4+TZrMAxwOu4eXEgSj3v1f1kulAeCE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=njW942x+; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="njW942x+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787715959; x=1819251959;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=pyq9xOSJvIMJr1pRriEoQ7aBznbMGv+WEynKNLQxD+w=;
  b=njW942x+qVS3HpNcdbc1scAkrKHsNqck4D0ozEjkUH7Dym/7T+qGFdkx
   jqNIVjWaOTsVHoc6ztBqL052vtujZWYFqJbmR133/Gt3Sa+dVZmbYPGmu
   hlhmyqHitpPY/g/Ro04ntcX7qwd2D9fc4Gbs1uLAwOfr8bV0QCYECTpcg
   eNlDxe+Vc58xt6D1ZxyIO8mkEfRHLOFLhuCiRXV3ZKhvceJUJ3YqEqNww
   XgMPl2vMVyo6WLxQyzQXdcLKMATC0XQSLoc+9DKc7Ws4yZfkHTMy+6Uol
   lTXMT3iXA2/RrHnv8618soKRm2k/5fQk2Uw0d9Y4HAmEnaR8vZlWD+xuU
   A==;
X-CSE-ConnectionGUID: ZPjIryw/QUC5EPLFWT8wJg==
X-CSE-MsgGUID: GoRiXYDFSX+1MkYVyrqPaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="88049315"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
   d="scan'208";a="88049315"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 20:45:58 -0700
X-CSE-ConnectionGUID: /jSq1TBvSjqUXJuiWLl+3Q==
X-CSE-MsgGUID: 8R15/vcgRgStbyQ65Nm9Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
   d="scan'208";a="271258301"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 20:45:59 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 25 Aug 2026 20:45:57 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 25 Aug 2026 20:45:57 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.59) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 25 Aug 2026 20:45:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CKb3aYQ0Q1aViEhimgA5YP6LhlDfAvyOrGiLnAO6CHVgeI6GmRFxAtcOABJ2Ytl+iuprUN+pKSG+tfEmHJ5wDorimnZwFyJ3xxhbVtvtJyIiD4zgAG8SKgW+oVZDCDgtUx1QLZTf1gXfv4KHL2qlLiVs0TIVaZJDgoIMzU6t9lsB/QmWiSdEmI+ZX43vz5STbnCBGCs+58lohEqdULCyBJaVRi068YIIJISN0ZWZvCTh2NLCub14FwqOi3TsD/Q5mhqgfETRW0gQuzQi9rZjuOE0eGdginiIaxSsCZuPXoCLOKp91s0E4gLkuUVjluh2wy0ik0CMKIPzbOsOgtcPpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AODC2+pYNE9gPIQ8cWRwKQUCFM7oPPWjfPk7+5qO+Es=;
 b=CS4ogXfE5H4eJunmtVTH0wTjqTcSZcqhvjnxRBAt9AfFQ5H9q+5RBU5gTla1Xx3I5S7t+ZJvuoePyLzWMnz6fa76t65zFCvkbYb+tHdf6vTDx1P/a+ok8HEPAnO+L4K8GbGiMK3KWzybrDHzilUYhQ0CZDZ9uA1/xtnobwBVXhVM48qdqEUOEw2nfrNg8wuD4FrHp5swjGon8suaMav4e22hM4StS7bUPN64XcZnCg3yhDeYUmXi6X3MjX+Q9bnUwHfmONCDRMWNAEeHPoSKcHtpp6578f84vk2xqBxxDANTIrUmEXm1z/okSGURYVIJTZsxlTAaCcSNwc4sEN1lCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com (2603:10b6:a03:53e::10)
 by CH3PR11MB7723.namprd11.prod.outlook.com (2603:10b6:610:127::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.7; Wed, 26 Aug
 2026 03:45:53 +0000
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::3df:33f9:59a1:da76]) by SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::3df:33f9:59a1:da76%5]) with mapi id 15.21.0339.012; Wed, 26 Aug 2026
 03:45:53 +0000
From: "Liao, Bard" <bard.liao@intel.com>
To: Sataporn Saijai <excursively@gmail.com>, Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] soundwire: dmi-quirks: add Lenovo Yoga Slim 7i 14IPH11
Thread-Topic: [PATCH] soundwire: dmi-quirks: add Lenovo Yoga Slim 7i 14IPH11
Thread-Index: AQHdLz7+Eo+3R2iuB0CMsCxA4ZM9uLavvDTA
Date: Wed, 26 Aug 2026 03:45:53 +0000
Message-ID: <SJ2PR11MB84240719C41B46AF491CB8A5FFAE2@SJ2PR11MB8424.namprd11.prod.outlook.com>
References: <20260818182020.143096-1-excursively@gmail.com>
In-Reply-To: <20260818182020.143096-1-excursively@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB8424:EE_|CH3PR11MB7723:EE_
x-ms-office365-filtering-correlation-id: 6f86bfbd-5cf2-4d9b-e09a-08df03248722
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|38070700021|10067099003|56012099006|11063799006|18002099003|22082099003;
x-microsoft-antispam-message-info: FTy94Bh2waDMFbUuKGpon24bWev+LTHwJPBbXGExSGUeNd4O6Of7VNCoRH7L5xXqrT12jJZazljXmHS5DcUZAl+iO/5yIiTcvskku1PvpgX5vvGkYN01EWpBSQFVmK3/ohTtPg67euX3bdSnmjSmaUTBSydaK6ZZydLE+rQK5Hd16tFiqt8xM7CUbY52A0nANlwC5rbAPPiBOAlbO3FCF+XqICpTkqU1XvRcIsyZTxnpCUk3dKy0h82I17xmsDLSgP/6NXmCju3Ev8SG2t3XkpD21kKz+MAXeiDn4cBue1pAk1wYebh2fhQ6/5h0JuWJ6XifCYuf/uFo7Ovlah7c2bud7XE6aMD8q5tElh825esFbVW/tX0kjrS9cM/2j58WH8IlqqUbOBU2mxPXTDwZlBalq4Sb/wnoHVwZS4NQ1BgFP3amnavdrHfWiNQ8QGL122oGkTW1eiXfqtNDbrbj7uPHiyH2bXdT64B7nUzIm2dXM04KdOqgBXZ2ehiFhMutIa6r3KNs0ACz5WlYvs3dcZDJG6T88tJiK2QMNWQ2j8klzFUe3IF66dZas4ilxPofbq/MJLoUFXcpZ/JlLzLKs9azMFicH69NPqfP0retx0vtOAICjNqid20yXIP8A/NJg7ET3Y/AGKTnfZDhHgRQKW9o2mXVr+mU0LEbyon7fc7zrl/Kgq1FCnBlPROeqVhCmPnTBJp/niTixzEwNoWkJm+8CAzdMM+/dPEdQSfY884=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8424.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(38070700021)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?CNBm29HOHNkl4Wj5h3kOUqjEyWVdnBRhXC4f+uMBuhfcJQOmbfI54TzzyQGK?=
 =?us-ascii?Q?uszGKjmKQDVh3lRlL5nRUjauACnKdPmrHHpmPjOquO8ur/BjTafLFiFREd6e?=
 =?us-ascii?Q?vyjrIqsKx/sua90ygwSWNaVcsPOqNjLmGFBq0odS5we6RNNQyAoONtoLcLwA?=
 =?us-ascii?Q?qEtffSMmkNrGZFlQpnNO0k9sSoeCmAGEdkNruTaoGt6l2iDLpBkExIFTHcau?=
 =?us-ascii?Q?no47h8BqZ960Q7g/xTTAGPxMV7+7nRCL5KUQqfYkGg6aGVv/JaytZ9qdr9op?=
 =?us-ascii?Q?9rt//x/gaj75gCTFrECm+xbmbgdSlSiZlFisk9oToY4GKA5HHLvFlE7RzcVG?=
 =?us-ascii?Q?iWgopUwSxyceqwU056uGB7w7CjC5ajr1vOmbsAVAF4ggs5iZAEs3jx6AjuTM?=
 =?us-ascii?Q?4q8JPXaTthHMLKDEPczREkdPuaeROSDwnLXDOZJ++febhU7gym04GDclmoSq?=
 =?us-ascii?Q?YvGusfLUTJqLADfu0Di45eavchwT6wd1QUtrkN+50PIOhrnK0GqNNEBuNIGC?=
 =?us-ascii?Q?BSIdx00ft0IguoK5NXTCUsdnXqSiyT84oneffIBvYQiBj8B855Iggbwrt4zA?=
 =?us-ascii?Q?1e3liZkorOQz2VMtxnIpO9wcNWncYbWhzMW9dVyXLUidROErSHLVrHrWDT5j?=
 =?us-ascii?Q?n/7aR0TA2zEnJsKk10oVYWYDRcFmJJymFp14qZwE7KJ1BA3fQLTMJcoyGTQw?=
 =?us-ascii?Q?clGYATvOltCer3SnaS7+MQFygVjmCvilgPgSHGo2qT9a30bYeNlkEukA88wD?=
 =?us-ascii?Q?qaCYMeJ/jaHgtElu9M/KEEiQAYPTEUA9P5erTzg1lJjqPCPzIiHccO523Dt+?=
 =?us-ascii?Q?Im4m9WjCAt/3789h66AzS9UIOpht3XGMPAqG+xg9Q4ktFARZ6fS9rg9PrMhZ?=
 =?us-ascii?Q?xSoua84cEmHwHILAHwpK6wQDiXgBrXM7OqXD+2tpD+jBYtYXesrODiT2gpyi?=
 =?us-ascii?Q?8H9lhPR2j3Plcd1+Fe7nxa+/nIkQu348QMYzrJhTkOVGyFUe3d2i6ujUhXZo?=
 =?us-ascii?Q?kXnk8L+LYHczSxDKoEGTb8kY8n/wIJxvAQSmqF46iHyBXqih91Ffo0EscHmO?=
 =?us-ascii?Q?sUq8+Y2akb/T0fjbRavoASDUVndKpi9KEwfSltEIPZoVutvJKmhPRS65lC1d?=
 =?us-ascii?Q?N2BhdoPoGhLNWUgEpMWuvBX+gJgBgl3Y/Sb7Q87vyRI18TKqhbSZVQ7TtOa/?=
 =?us-ascii?Q?FH3/QSBCpQUFUXis0q8OZKhPWo+QohgCKuzAKjtt3oCwTCT518n2BLTG33Bd?=
 =?us-ascii?Q?lEhJepG+WT7tgLdPE2di7gLP/VrDPOyBMUaFDWefvk1H1lpyl4oDTT3vaPv7?=
 =?us-ascii?Q?sV/bq8f3DLBdh/PV6GGWj8nxhlbiM8rYDEujDQNz2VanQRPfB0+KiL0x2vls?=
 =?us-ascii?Q?m7KAALkMX+jOmZ+F3+xh83PMPvsXYQXKrDC1SmLt53cidemc79RfV/z3dYcC?=
 =?us-ascii?Q?ZzJqwsZZDRRGujAmtGvJQWQeDyv3K3deHKJVrtbiDz+KCxBA0p9Jxb6IQyQ7?=
 =?us-ascii?Q?MCg9sOvgK7WwRFR2JmVDtn0EpZNK0hKiMNUu/b/BvGFgVsg0n4gxKn8/OlxN?=
 =?us-ascii?Q?XlUcyXHhscodrkKk9aAnjzvYDpgynUTzajIvCGA6zdSzyhtLn3MlVTXWaqO6?=
 =?us-ascii?Q?xLgH5aiOaHE2CmKjo0PTzRNgKhP6SXHB0E//wH9LiiRPw1Z/RxqqkLaU3crR?=
 =?us-ascii?Q?M3qolayxATQH2HJVe/bCJt/3LMJi/VxDpTpbqHal/LMmgFGQ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: izlLoC23g6df3zINkF8GWwxNwRtf7wKDAbq9tl418SpTdPIpJKDSugJ0iDiQdWVPKmxwVgh9HT4lhKFpoOPS0C+CUpVfXxkvu3QJTRzKzx7D4gd+8gPvbgCrqb6u+ZBpo/lUjpc9uNeK2DUHDT7fj9R01pTGiaoH18kO8wteJr5P15cwpSTCrs4HYEJumnbZaJA+I3QtZCYb/mHrsQ0PRJqxw8/vkJi5T2XM4isV8bw7lrAgq5lEIZOGr8v4GrrsWD9bsjdC2rtqdsB1hwThHlGlN15lPQ6lYDBHmHEto9QkNIuHJwy8iG+oAaI9TMKtPHNgwnQFISTMBSlmAJNuDQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f86bfbd-5cf2-4d9b-e09a-08df03248722
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2026 03:45:53.0692
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4J94IRJB0Z8IyllW6V6TMT5r7fiyDsPe8HMdTq57N7TVcv+HI5SKPYtD4j25VHvUGms0sKAEatNLm41HvhLnmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7723
X-OriginatorOrg: intel.com



> -----Original Message-----
> From: Sataporn Saijai <excursively@gmail.com>
> Sent: Wednesday, August 19, 2026 2:20 AM
> To: Vinod Koul <vkoul@kernel.org>; Bard Liao <yung-
> chuan.liao@linux.intel.com>; Pierre-Louis Bossart <pierre-
> louis.bossart@linux.dev>; linux-sound@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org; Sataporn Saijai <excursively@gmail.com>
> Subject: [PATCH] soundwire: dmi-quirks: add Lenovo Yoga Slim 7i 14IPH11
>=20
> The Lenovo Yoga Slim 7i 14IPH11 (DMI product 83QM) declares an RT722 on
> link 3 that is not actually present and never attaches, leaving the
> machine with no audio. Since the address is already handled by the
> ghost_realtek table, only the DMI match is needed.
>=20
> Signed-off-by: Sataporn Saijai <excursively@gmail.com>

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>

> ---
>  drivers/soundwire/dmi-quirks.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/drivers/soundwire/dmi-quirks.c b/drivers/soundwire/dmi-quirk=
s.c
> index 32a46a2d9..8f74b0dd2 100644
> --- a/drivers/soundwire/dmi-quirks.c
> +++ b/drivers/soundwire/dmi-quirks.c
> @@ -192,6 +192,13 @@ static const struct dmi_system_id
> adr_remap_quirk_table[] =3D {
>  		},
>  		.driver_data =3D (void *)ghost_realtek,
>  	},
> +	{
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "83QM"),
> +		},
> +		.driver_data =3D (void *)ghost_realtek,
> +	},
>  	{
>  		.matches =3D {
>  			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> --
> 2.55.0
>=20

