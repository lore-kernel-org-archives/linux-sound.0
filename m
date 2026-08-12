Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22D7358372;
	Wed, 12 Aug 2026 02:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786502351; cv=fail; b=rlV/1eOQ9NZ0O42naCFdZKx2JWTZmUGktJ9V5rQqhLRYfzFEKYdNiGFf+1LbmAMMoC28wfqMy1DFNymo0QATPcOg5DFpKt6Hmua0+zrxdOYxd2SEc6KnMcoMwiVjBVh0OgWTYBz6KeoFqurqoSAgywPuWoOj2QlI4UGez5LpR0Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786502351; c=relaxed/simple;
	bh=Xgb53ZKF3KFmhyFV4ps4010p5QSW6wtyFFrPq33NOYo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dspl2shztiQFumFyQISX4FFHE1tZ3Z+vJEneXBr/YihNHFQY6QReEBzDZb1fE1mFGnI6r3EYFi0VniPNZQ8mBTUJiWabzbEg61Bo1Wi0wis2i/98QIidycAg1RPa/K9lfdVyO4Wwf+Oj7ND8BGU82IFLOThWMCdbsRwa02g7JUI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PEOjw+aR; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PEOjw+aR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786502349; x=1818038349;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Xgb53ZKF3KFmhyFV4ps4010p5QSW6wtyFFrPq33NOYo=;
  b=PEOjw+aRXQergMloWvtVmkWhlDSp+/SK73CuHOcQTzgfp4Sx+T2t57h/
   quJbiczFIGFaJEF74Ia2gpGB9vM/4286FmuGHTPjkfZ4SybtGZ4MRgcow
   in3xppUdEOsbgwzf6k5/fLAMxhyk+QZ9mJS4ntIF0/0JIEnzwbcc5MFQS
   de6bpQxGFXQiYUqmEU3C2JDlXaBo+iKTWEAcSyJygtdMTsGwCtWslhNSP
   J0y6dZuaiQArRQ2/XFz5M5ewR7na45zfVOn/RCEdxM2XnGgUSDaW2QxLR
   y+KLbPe40qlPpWubMnyuVdNQq5E6Ji75vVNFEHFhmjs5hZAFNCoOFKm+N
   A==;
X-CSE-ConnectionGUID: bkcOo8mHR8Oxx2COyQD5WQ==
X-CSE-MsgGUID: bebSH89kQ0mXB/FqjJpAdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="86003049"
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; 
   d="scan'208";a="86003049"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 19:39:09 -0700
X-CSE-ConnectionGUID: 22y0iGg7QpqS9afUQRS2ww==
X-CSE-MsgGUID: 1kXhqwohTRqKAn/T3QG1gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; 
   d="scan'208";a="264093976"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 19:39:08 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 19:39:08 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 11 Aug 2026 19:39:08 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.7) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 19:39:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=txdN457+rbQquZnwwr3ARxxiVki4B3y8MgdYfDtEjLSGy76eXRwdOa9M6uKORCRgDtldteI7wAsjkRjtB5NTTP0Smb5qS+OpqixnNnmgxBSCeXEbcIiy55TcEx2alyAKUd11MZjTge5tcGMJ2MOS0ATTAZ/ivfOsC8bpjBg94zVC1n5wtvD5MOVTUjaH12PnVi7uIoiidDz+sBZmAEZqWbHh9EIFr1ESejRuNuoMKfr32PGgEVCtaHM5GzdWnNlsH4UjwyZd6B9pL9QKLZsViCDYPbZa9R543/7QCYL+2ZOTCOA+qAfqDBvyP8uqe1D/fHWRJ1j782GQjp1+E99KEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u00ajaFZAu3VHnf+qgkB4rSWhLVIeWnFsLg9ohQU1OY=;
 b=g7JyV/TkgW5+aFG0I2/O0JXUpJS1slezZdew0yLqW1OdgK28BfT2p4WWCDErS107/vdO2oZ4zZtOc0ZURRipUAZNLIhr273FJa4tlOj6LXOMIUYxu5bKoFsZOxqeExla2hp2GgPS2jiTouoNPflJ19AvnO9PAZVCFAWVR9zn2HAfIOQjj/QdEqis2+lCxHO7Wkm+/5FPGEqWTGjAa8EE5H7PLbdps61H6OEIzBCTZZhjlYkAjfAqsWlnxtXqYSdXoQHSA/ChYlGt2eYTZTzuddujm/Z3qhEdQ+BuiVdj85MT4rL9sb4fR8dP6KYwbmyv+39oqbYBcR/ZQOSypZNrPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com (2603:10b6:a03:53e::10)
 by DS3PR11MB9820.namprd11.prod.outlook.com (2603:10b6:8:366::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Wed, 12 Aug
 2026 02:39:04 +0000
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::3df:33f9:59a1:da76]) by SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::3df:33f9:59a1:da76%5]) with mapi id 15.21.0315.012; Wed, 12 Aug 2026
 02:39:04 +0000
From: "Liao, Bard" <bard.liao@intel.com>
To: Denys Papushaiev <denqxotl@gmail.com>, "Rojewski, Cezary"
	<cezary.rojewski@intel.com>, "liam.r.girdwood@linux.intel.com"
	<liam.r.girdwood@linux.intel.com>, "peter.ujfalusi@linux.intel.com"
	<peter.ujfalusi@linux.intel.com>, "kai.vehmanen@linux.intel.com"
	<kai.vehmanen@linux.intel.com>, "broonie@kernel.org" <broonie@kernel.org>
CC: "pierre-louis.bossart@linux.dev" <pierre-louis.bossart@linux.dev>,
	"yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v1] ASoC: Intel: sof_sdw: Add ASUS UX5406AA SoundWire
 configuration
Thread-Topic: [PATCH v1] ASoC: Intel: sof_sdw: Add ASUS UX5406AA SoundWire
 configuration
Thread-Index: AQHdKdQ5lA3glhOzcEqVDN0g+AHwbbaZsvAA
Date: Wed, 12 Aug 2026 02:39:03 +0000
Message-ID: <SJ2PR11MB8424F5F50192D5E5F7F8345AFFDC2@SJ2PR11MB8424.namprd11.prod.outlook.com>
References: <20260811205810.12395-1-denqxotl@gmail.com>
In-Reply-To: <20260811205810.12395-1-denqxotl@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB8424:EE_|DS3PR11MB9820:EE_
x-ms-office365-filtering-correlation-id: 61d11cef-bd29-43d0-cc9f-08def81adfc8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|6133799003|22082099003|18002099003|38070700021|11063799006|56012099006|10067099003;
x-microsoft-antispam-message-info: +YAPqeqHWr2AuFxU0rpqh8vCHHS48C1e6ZZRwI2h4eDU1gjuUcfjKaKw/g2TlnpCWHiHtmHHIIp2/+UA6W2ZJXQR8NBaJ3Uvm3qAZu3QRovAbL09jcuzij74pcUlHYFEj8pr+K2QomuBbZ2Vu29c3tS9BJekbsHBeRxVyMPaBc55chEHnUecftNQX1+rwVT86TaCnluovPvIWPqPJi9hPEf2YizdkYtrCjeoJE3s/Ec55clODuwlkeqoGZopT0d9Rhz88LuPlcS0eHYFOlc+nf1jR5JwdKIMl2TrotOL7vUABL0I+bzvjpVC0EF42ZvYYFyCLLnISywtq6odHxAc5mi43EXch2Z+CSX8AS8NJ/cZDWlVRXqZJ6e84SuQNqx9L+wynUx7D/+17xv7C49XfPt86pwXHlC7T9oJOQBkTSVg9t4WdOnBCfC0KWZLJTNN/fQpOvjRgzm580+si4Cn881u46XiOGc7MsBs55VPgXbMBEbY0dA4zbDmsuD/oQNZpAhke8Sjtj1O0+81eqjJ7k9ESxTm4HskvNFIDhe4VX1TV9dVDnwqFsSBIZL9gfpo0m6qXiMPZODexwCZaJWOm017R1NjHL8MYCPe2OMw8MDCeIyl3udq8opqGHS4S4dGksAZAe/fkYCq8czfdLj/WwrA1yj6oW9kgAUTUZ1jTCF5PEAN8xSoIGMWy0LRuIjM6XSGgmDjPiFr83amYRcqPQyeq0DhLdMfHePgc7kX6F4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8424.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(6133799003)(22082099003)(18002099003)(38070700021)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?IBBd/pHiampOnhBv95lbtwhxDZM9knTg76FhA+kLEFbWQYABnGbL0QgOSKen?=
 =?us-ascii?Q?gDHhsTIAobxzPqdi4Oop/yc0mPlDGl2HG4UkJCXuy6N7y3xhLcmuBnYi5Ak9?=
 =?us-ascii?Q?Ey+RZ/gNmycCHe5KIk08R0WeYRAsf9KmVZviAi4qU0T5KNW3MlWOYUftSV4z?=
 =?us-ascii?Q?8UMg/BYdCzSg7xm6DeLKqnXs//Qz/YwcP6cfQnK/ygX5Vi3yTzOU12dqIPOF?=
 =?us-ascii?Q?K+V8jk1+TXXbrDaseSqOEreVgJjzrOwXpTrlluXKYlHLO7h7a3WgFs1LQuCj?=
 =?us-ascii?Q?bZKs/cS9yiq37BWM6ck5dq+H6SYmct3ZaaeRODm4cu09U4MN7d6xB6puKy8I?=
 =?us-ascii?Q?eWgH4AoLjxy0Ue2YN6Z3+PPMoJ4v9YoKncG9kIUzPcHT6v3b+aIUXBgH9f/t?=
 =?us-ascii?Q?3nw/T+GFHG1rsa2aKCWtKCnBr3Qtv2Z0RWa6GpLJI2eo4xBuJN7zmgdE9oG/?=
 =?us-ascii?Q?5akYg1i0IohTrcz+T/F21GKh3xiHtrMlV6dddfwLRT6/AHd0kkCUNtTPZd4s?=
 =?us-ascii?Q?VQCTTX5p6QpIP9qqE5wMe+7MvApKec28o9iBba4oBL7d4x0JhzpBaAuZmSOS?=
 =?us-ascii?Q?tGxO97N1EE4p/VINg+YwbWwFxnF0iKVAxjRX8aIkz0hQVNCN6MoUqoescJUL?=
 =?us-ascii?Q?xAPHld0yenLw/x0ArIsUC7XCD/KSPnT/lRQjL7kBCUNt3T5mNn4sHtkfvtkU?=
 =?us-ascii?Q?h8udc9mJJGE6qtmAqSX3rZrTAbwlUI4tvP8Jo1H9sNzoWh83BrK40sNV+oCi?=
 =?us-ascii?Q?CNugjsl3NFhXHQCCvX6+G46WcyxRjM4lCSzVw9K74mYb3UdEppSwK6iwlmBG?=
 =?us-ascii?Q?dh0TTv4lYUM4UucOmzeb9wmLsASs1+aEoYYsGvV1cbzvs0aFZIRCP0PiD1yz?=
 =?us-ascii?Q?9P2nL8tjmKcYasgWkhMbJpITvK+mPtsLQoXtArwuIBLeaQw+GaBiQz16M47/?=
 =?us-ascii?Q?z+RPZHjcAt6qMjsS/QhZE7/aID5yERRu3xt0/yQghclk+BS0jbOwNQs8rjzX?=
 =?us-ascii?Q?LGpP4dhHbRhPZNqlEUFuE8e1SzyZHB2LgoN5En++Mw70dRgqxJ8x2cHeCeKY?=
 =?us-ascii?Q?o9kmrMk8lTOKvEfVOxCGOIYEzaxl9JZuz6uJ0VYv785e6Vx1CY223guB0yBM?=
 =?us-ascii?Q?uhqIAWygUAU2ZmCPUJTfwBzhP/AqBWPqXA/s4kZ63GInJ038O/UOjMUiAoOY?=
 =?us-ascii?Q?MrHM9o4RE9KSE+7u2wh+h0Gd6EQoyCsVb/dTvCG9Uh1GUSm4HZhT7AKfn0OW?=
 =?us-ascii?Q?4N1lQ/SNeTIrmam7p/Je4uJf3pjMMCgZPEnLRoupnOYCR9E2V1EUMisVCrhT?=
 =?us-ascii?Q?+GoV1wCZFEZuEg5OEYatDt+YpgTwCAYSEgIpB6UHIibf244c8yHZY8yenp0H?=
 =?us-ascii?Q?xpq7QRl4/tbpPVuTIuFawr14MbXR6uZNZsWAXuCR+fWhb/fjKBaZR4fCi/DN?=
 =?us-ascii?Q?j0yqp9/XvywSdhKQqHKA4zTfVjR2mGwA6m867w5Jzh/oGe/h+yGCVEHOa2oA?=
 =?us-ascii?Q?CCESTaLVipqLyoemfhhjq9wnwyaAPOre7reKwR3ZtjPNZ7HFlXWaCY6oo+SG?=
 =?us-ascii?Q?BF8u+6eG0f3/deoJWsjsZmYA9FbcTrTwRkYpjIBMN6aeNRCuGNK95BuZCKuv?=
 =?us-ascii?Q?a93ZGcA7YMq+ueeKxAcrtnvJfpqfy6pTfErCSGdebmYvFazdqjFzDWqFQES0?=
 =?us-ascii?Q?FbjaCgI0ZZ+PDuxHvqxKx/2r8PjYL3l8nDPmXvcaVIDfdtjG?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: sQvLk7Zc4FQnwUNerIvNzMB5g9V5YA6IFZDHofWk/qvJL3TpNdBD8wRJqE/LxHaJb3MHI4lIvkOICPVFny1lukJF36VvnI2Tne7UGDfULrAROtZd2RyS4XLA+wOP9pCddIJjWtT5MiZ+SD1i/uf2/IPKGa1y1hSdxWmroDQk1giQ+l6GX7xbkKdVafHnCOePgOEq63WjYDtUw7A6izmfcuFt16QQCpz6l3YG1GioO8s5+FMiS8b1Tfby9NPH9kaUu6ngBo66G24aTay6sbUB66TG2b+1yL4eKeAfyFrm5R50jHnuUVv9bmFbG5GEKgpIqw2zWGVDgi+NkcCZrPh9/w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61d11cef-bd29-43d0-cc9f-08def81adfc8
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2026 02:39:03.9290
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h/7/CitCRCK5XVeoufvqWKVWPngOKsBO/2sPZoAZhSRe/tvLSosObvWT1uMiPlTtDWmvgFLY8kOaj2W6g7xnmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR11MB9820
X-OriginatorOrg: intel.com



> -----Original Message-----
> From: Denys Papushaiev <denqxotl@gmail.com>
> Sent: Wednesday, August 12, 2026 4:58 AM
> To: Rojewski, Cezary <cezary.rojewski@intel.com>;
> liam.r.girdwood@linux.intel.com; peter.ujfalusi@linux.intel.com;
> kai.vehmanen@linux.intel.com; broonie@kernel.org
> Cc: pierre-louis.bossart@linux.dev; yung-chuan.liao@linux.intel.com; linu=
x-
> sound@vger.kernel.org; linux-kernel@vger.kernel.org; Denys Papushaiev
> <denqxotl@gmail.com>
> Subject: [PATCH v1] ASoC: Intel: sof_sdw: Add ASUS UX5406AA SoundWire
> configuration
>=20
> The ASUS ZenBook S14 UX5406AA has a CS42L43 codec on SoundWire link 3
> and four CS35L56 speaker amplifiers on links 1 and 2.
>=20
> The existing machine table only describes the CS35L56 amplifiers on link =
2. As
> a result, the machine configuration is not matched and SOF falls back to
> function topology enumeration. That fallback creates duplicate DAI link n=
ames
> and prevents the audio card from being initialized.

It is likely there is a ghost SoundWire device in the ACPI table.
Below commit covered the UX5406AA SKU
4dab2b904414 ("soundwire: dmi-quirks: Disable ghost Realtek devices")
Could you check if it works for you?

>=20
> Add the missing SoundWire ADR entries and aggregated speaker endpoints fo=
r
> the two CS35L56 amplifiers on link 1. Add a machine-table entry matching
> links 1, 2 and 3 and reuse the existing CS42L43/CS35L56 topology.
>=20
> Tested on an ASUS ZenBook S14 UX5406AA with kernel 7.1.8-arch1-3. The
> SOF card initializes successfully and all four CS35L56 amplifiers are det=
ected
> and calibrated.
>=20
> Signed-off-by: Denys Papushaiev <denqxotl@gmail.com>
> ---
>  .../intel/common/soc-acpi-intel-ptl-match.c   | 67 +++++++++++++++++++
>  1 file changed, 67 insertions(+)
>=20
> diff --git a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
> b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
> index f7694b2a2b02..b62a946062e4 100644
> --- a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
> +++ b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
> @@ -92,6 +92,21 @@ static const struct snd_soc_acpi_endpoint
> spk_r_endpoint =3D {
>  	.group_id =3D 1,
>  };
>=20
> +/* Endpoints for 4-channel CS35L56 configurations (e.g. ASUS ZenBook
> UX5406AA) */
> +static const struct snd_soc_acpi_endpoint spk_3_endpoint =3D {
> +	.num =3D 0,
> +	.aggregated =3D 1,
> +	.group_position =3D 2,
> +	.group_id =3D 1,
> +};
> +
> +static const struct snd_soc_acpi_endpoint spk_4_endpoint =3D {
> +	.num =3D 0,
> +	.aggregated =3D 1,
> +	.group_position =3D 3,
> +	.group_id =3D 1,
> +};
> +
>  static const struct snd_soc_acpi_endpoint jack_dmic_endpoints[] =3D {
>  	/* Jack Endpoint */
>  	{
> @@ -184,6 +199,26 @@ static const struct snd_soc_acpi_adr_device
> cs35l56_2_lr_adr[] =3D {
>  	}
>  };
>=20
> +/*
> + * ASUS ZenBook S14 UX5406AA (Panther Lake) has 4x CS35L56 amps:
> + * 2 amps on SoundWire link 1 (unique_id 2 and 3)
> + * 2 amps on SoundWire link 2 (unique_id 0 and 1)
> + */
> +static const struct snd_soc_acpi_adr_device cs35l56_1_lr_adr[] =3D {
> +	{
> +		.adr =3D 0x00013201fa355601ull,
> +		.num_endpoints =3D 1,
> +		.endpoints =3D &spk_3_endpoint,
> +		.name_prefix =3D "AMP3"
> +	},
> +	{
> +		.adr =3D 0x00013301fa355601ull,
> +		.num_endpoints =3D 1,
> +		.endpoints =3D &spk_4_endpoint,
> +		.name_prefix =3D "AMP4"
> +	}
> +};
> +
>  static const struct snd_soc_acpi_adr_device rt711_sdca_0_adr[] =3D {
>  	{
>  		.adr =3D 0x000030025D071101ull,
> @@ -315,6 +350,30 @@ static const struct snd_soc_acpi_link_adr
> ptl_cs42l43_agg_l3_cs35l56_l2[] =3D {
>  	{}
>  };
>=20
> +/*
> + * ASUS ZenBook S14 UX5406AA: CS42L43 on link 3, CS35L56 x4 on links 1
> and 2.
> + * Link 1 carries AMP3 (uid=3D2) and AMP4 (uid=3D3).
> + * Link 2 carries AMP1 (uid=3D0) and AMP2 (uid=3D1).
> + */
> +static const struct snd_soc_acpi_link_adr ptl_cs42l43_agg_l3_cs35l56_l12=
[] =3D
> {
> +	{
> +		.mask =3D BIT(3),
> +		.num_adr =3D ARRAY_SIZE(cs42l43_3_agg_adr),
> +		.adr_d =3D cs42l43_3_agg_adr,
> +	},
> +	{
> +		.mask =3D BIT(2),
> +		.num_adr =3D ARRAY_SIZE(cs35l56_2_lr_adr),
> +		.adr_d =3D cs35l56_2_lr_adr,
> +	},
> +	{
> +		.mask =3D BIT(1),
> +		.num_adr =3D ARRAY_SIZE(cs35l56_1_lr_adr),
> +		.adr_d =3D cs35l56_1_lr_adr,
> +	},
> +	{}
> +};
> +
>  static const struct snd_soc_acpi_link_adr ptl_rt722_l0_rt1320_l23[] =3D =
{
>  	{
>  		.mask =3D BIT(0),
> @@ -510,6 +569,14 @@ struct snd_soc_acpi_mach
> snd_soc_acpi_intel_ptl_sdw_machines[] =3D {
>  		.sof_tplg_filename =3D "sof-ptl-rt712-l3-rt1320-l2.tplg",
>  		.get_function_tplg_files =3D sof_sdw_get_tplg_files,
>  	},
> +	{
> +		/* ASUS ZenBook S14 UX5406AA (Panther Lake): 4x CS35L56
> */
> +		/* on links 1+2, CS42L43 on link 3 */
> +		.link_mask =3D BIT(1) | BIT(2) | BIT(3),
> +		.links =3D ptl_cs42l43_agg_l3_cs35l56_l12,
> +		.drv_name =3D "sof_sdw",
> +		.sof_tplg_filename =3D "sof-ptl-cs42l43-agg-l3-cs35l56-l2.tplg",
> +	},
>  	{
>  		.link_mask =3D BIT(2) | BIT(3),
>  		.links =3D ptl_cs42l43_agg_l3_cs35l56_l2,
> --
> 2.55.0
>=20

