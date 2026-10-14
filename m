Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9523CB2FA
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 11:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791978988; cv=fail; b=gu1lI+WvyVf2UpEEeKb8PVKdKF7LYDsGnSr2G3uTHk/k2l1XC9inuklM73sX9FXoX9QU6pbdk9lfY5UhGS7F4VDUmdaehYPHbE9p24EqjamDc3NqJ8KsCOZeetBxM5ksokmttZrk9Pcn1prHFC63zJ919I8jFzCnCq0nNZGe7hw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791978988; c=relaxed/simple;
	bh=PE1CVhuiF6O/WLhjwEBQ8v3rPDIC7dIRUQHurDegiDg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=o2Oky9DsT4vP/Nw3kXEULywg17exwBiUQg9v7XDSWfpw03TXZHaZokwODEGzTy5loPACVte9ozQ1har1OjOJLaar6I6vmVxkwRL891drgtUjf72hvw40bKaY3mi/F4+h7jFQcuMXsp+Hn1jZcdL1XQp2NXU6KP2+uVrpWtUGcUE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B4WyVidb; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B4WyVidb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791978985; x=1823514985;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=PE1CVhuiF6O/WLhjwEBQ8v3rPDIC7dIRUQHurDegiDg=;
  b=B4WyVidb+XJ90ayK7XlM5Vlfr/dJaQg3rVGHJqwtDoLm6nDykm8zH59K
   GuI9DQmUg2E1v1dO8ophQY4j7eFYeocpuAbWHfGbiikD3HQMSuISR61aT
   9Jj8oid3UGZaJAnortzO0OkVfM4lgbOSDO2UyvydQ+hh0B+YHC7RB+RBB
   gtm1t5/dT7m46vAu4A5ewrl51WUE+8rF5pRrdSxgN9wXGmilUnpr/boLb
   TVPS+GT1jAFUQ2Ey/USp4Tn6YZwAPM5Sr0cz4kOv/c+aY+02Dbvk9wDE5
   o462YaQUiNPognyfNcMSyUiHj78mzM1ZeuedahP3dYiQ4D+P/K2LvSMhI
   A==;
X-CSE-ConnectionGUID: +734Se7HQAGOEBIRBpO4uw==
X-CSE-MsgGUID: WTQmxEQlQNaZI2ib/nb69w==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="627726"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="627726"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 04:56:24 -0700
X-CSE-ConnectionGUID: VZVTRREXSY6ZK8iRWPu1rQ==
X-CSE-MsgGUID: VSGlwvspTly0fJH22h0rFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1735119"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 04:56:23 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 04:56:23 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 14 Oct 2026 04:56:23 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.5) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 04:56:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v0Lpdb6oZ1UVv2YHykrfKRnVMtLH4Rk+u+I7QLq2dkevM1wc5Ndu59DyNbIRIFm0CJ/6zYrkmgI0Q20mSvxPsBbfSOTnkSq0wtvWVsNSKOczZBtMcbO86sTKH4t3z2VUha2yLbS5MBDEte5aq4zL0muOY05mG0QiGW4QgwwwPXHNM9ScpQXCYpKMnRaUuvndfGry5KkcESPWQybOJWUXmIl5xjJFXEoy9oz6lAsz1sFcxE7BZAF54I6JjCuf7CHj0gbW/clRKU7qt4EIjlmehf5wDsLJ0Eoaex2Wc/DEPMdwJDcSvSHoEwlhhRJOf1CQQGyfyJDtNS2Gj/4mgZGbTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PE1CVhuiF6O/WLhjwEBQ8v3rPDIC7dIRUQHurDegiDg=;
 b=mfoRLd3mSuLtQPWhR/q5WDgNt1EnuPBX4TC8QlhbGrx5oQjI10KqtqNcvxn0fsPbuDCalRoBtRkzssbL4JuiEFEjKbJQ5Cxz/otw5u74O5n6MD+jBgAw23phJ/G9IQqJYRzFT2FwZdQYRXCDF1edgNHVkz4mDcOUZbxUL7kzjUvWl6s8qasR1uR3xVyiZQr2mv6m+39E74HWX7UOCVQTToNPLzM0DGISAQsyXHDO2UoehlmU3nHIaObot03rIFyPZmjPiP14jE9uRdyFppDf6xRKTzYk2ZvR3G9ULJAPoLtSEd7fHaUjNfcIUROZHOvnW8ozjGiCGrODzhTfijnnhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com (2603:10b6:a03:53e::10)
 by IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.16; Wed, 14 Oct
 2026 11:56:19 +0000
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::3df:33f9:59a1:da76]) by SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::3df:33f9:59a1:da76%3]) with mapi id 15.21.0496.021; Wed, 14 Oct 2026
 11:56:19 +0000
From: "Liao, Bard" <bard.liao@intel.com>
To: Fabio Lima <contact@thefabio.com>, "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>
CC: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Takashi Iwai <tiwai@suse.de>, Mark Brown
	<broonie@kernel.org>
Subject: RE: [RFC/PATCH] ASoC: sdw_utils: Skip unattached SoundWire slaves
 during endpoint creation to prevent collision on Lenovo 83SN
Thread-Topic: [RFC/PATCH] ASoC: sdw_utils: Skip unattached SoundWire slaves
 during endpoint creation to prevent collision on Lenovo 83SN
Thread-Index: AQHdW7AsQmVAuYcZcUCxeZThNLfYl7b87Gbg
Date: Wed, 14 Oct 2026 11:56:19 +0000
Message-ID: <SJ2PR11MB842439739B72707C25A955FFFF9D2@SJ2PR11MB8424.namprd11.prod.outlook.com>
References: <82a57f28-2cbb-4ef1-a1e6-7023ec2f34eb@app.fastmail.com>
In-Reply-To: <82a57f28-2cbb-4ef1-a1e6-7023ec2f34eb@app.fastmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB8424:EE_|IA1PR11MB7198:EE_
x-ms-office365-filtering-correlation-id: 9ad2ed8d-ff3c-4791-b150-08df29ea28ec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|38070700021|5023799004|11063799006|56012099006|10067099003|22082099003|6133799003|18002099003|261009223027099003;
x-microsoft-antispam-message-info: MW24ubPsLToDRPtburgMbRlC3W/fkwbkav9FUT/ofH2l+dxXKFtrsQePIs8TkuUrlJm3l+fii+0xD3sjNGHpdPy+CWsKKm+Fi55f3+CjxUzZLtIye9mdxDoHXVz2H03OFWpnWshWDHBTBEGzksxcZgGl8DWJwbSpC18NA7Knts60BG3r5VuMVyFmOcGPFqWgmDpHD0k0WpPfS+DCpyyRYSTOfQbRrw+2coGaVrconMQq1GazRmh7ajVxqCNmBVC4xc8YnfnHXPk1ShxHyg9OuHq9B7jDKEK2LtJn5ShVIEW8gvRSEfnzYuCPr3sGHEqTJ0dXeTsflfxE02QE2g3a8jmPeEzsnPgYe5kF5IyNDd7Z83i/3jwefDNX354UFwH3JSKV7MsUFbuc5JnVF5woW1UqfmwGdS4oOOzI9Rk+6Hy3H8SlAeRbF8jIJYra64k4c4sciT0GqyxrK5eIhfxksN2WsIcw7zB9hpebISFC4GNQEXs/gKeNu7a6vRE7jeaukL87QXovIGsxmoF/UOb6feB9CZiS039nE2ldLkpUZB9G9JtJzmiF0hg9cSCfmFW4gqctcXTK/lReyuH9V6gWJkHL/ONRepYfSV5ShJlKC5EsCzCTAY/cYvHluUJ/kd3ysghQ6GtsXSEwTesetKzH8f8SilglR1IQYeNZpYqjQDP8tugkqfmeqP3fshgh8pn04CRs5gWJkcc94uDYXrp7ksYZnfH1hvY28H8Yq76hQ1M=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8424.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(38070700021)(5023799004)(11063799006)(56012099006)(10067099003)(22082099003)(6133799003)(18002099003)(261009223027099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?l0/FU1iuwyprWkeuiJmIPjAbVAo16di7p9dJX4o8CjBWrj+rmawlR3JUjfN3?=
 =?us-ascii?Q?pada0eRNKXThPe0dElnr0SxYcZHNK26uguqbX9foP4hr3dWbTDotdaWVGt+e?=
 =?us-ascii?Q?xo8aaMlNxbWCGK9Sy1shHzj9sxdK0inT3JwwFnbC7WP7SRGMd2tksYhEUBFb?=
 =?us-ascii?Q?450AGwuA+7mb4GC2UYxuGOdDZnxydzYA0X05BryBAOCZm+jyL+8IgIr/taix?=
 =?us-ascii?Q?j7mHmL3UKkQP8ybCcVl6fFuTh4w8Uq64S4Sgu+qoeoEDyblyrlzf4EU+W5rM?=
 =?us-ascii?Q?0k24ybC5+rAtH5Fa8IH+Oz9aMTi1bbtaRBUcq5Yds1LNuRzOhwGKaVkDch/i?=
 =?us-ascii?Q?FD+r15qNPpkh/ZwN8JfVe2i+w43+c3vfT5n4pADJq4IXLg0GH/ztBdhqPvWr?=
 =?us-ascii?Q?4d7ZgsTEBfCXxHwcWyPMP3CYM3X1Od9f0CS5B1xd8UjkvHhksF16QCNXj6Uy?=
 =?us-ascii?Q?8r+1f3iF3F5HLMhy85xDMSHs9jEvipb3ieqYfidQ6+B6iPcCcynuxned6ddo?=
 =?us-ascii?Q?f/V9xJdffikwCtAEd6zCjCy6Blo8Xg1KLzSubiIhNzbDYLlScfEfWDFeMLdD?=
 =?us-ascii?Q?vKLaxpJFSjMz7RCEXwPlJTuMjBwM26uoXFOUhvGtjMWw96ZjPFgygZaQRxhT?=
 =?us-ascii?Q?2C3AwwKdb8IxWLC/mALsUm9R5hKK1UC5yzbZpXuAVmDOxSM/cyxozWvXTWCj?=
 =?us-ascii?Q?xNOQ2LCL9pksFhiWmuWO5jHidGWgNv5rfpgPRNYrUnLg/J3ICaxeLs0rh17S?=
 =?us-ascii?Q?v2dXvPBONw+Yjlutzl/twWMG0u7RwW8u4eZCKOoc5v9J6HZ/ame0uzyW3moR?=
 =?us-ascii?Q?GY20XJRWBOA6U89CA+3AdFSKpnI13hcrFCu24TeWRhX8oN0fn/fteFJnJSIY?=
 =?us-ascii?Q?qPypwezThhjV7EuVG9H7SHJ9Vnax2eHyjS0O+f20XwcgD9elIWsne/bTF8g/?=
 =?us-ascii?Q?J9Mo+a1uqNs9TxUa4GlNrnJZYMb/jW/DhPZ/Pgv4QSby9dbFKlX7vSW5D02P?=
 =?us-ascii?Q?pbehsA95fcytNbfRDPB+AO1UlJzKwb6PC0/qjFq8Ft9dVNQQV7zNr/YqVqDl?=
 =?us-ascii?Q?oxE+BZE6ueRO88pyBV7bktjJTkkAARGw5oAUMY8bLhZljsQ7NOiShTAHoLe2?=
 =?us-ascii?Q?hCwXOdnxrCgFx6MBgh++KJz1MXy1N8nI3JwvviRGZhHxs5lwioQT0d0jrcLW?=
 =?us-ascii?Q?21q7tN+bla1zYfL8AkvZyyk1Zk1hADxAKI+hNo12W5aZVKkpe2AQlSmhCmR1?=
 =?us-ascii?Q?mkQPhtDeL/NeacOH6NuJdoeHIaXZllP57VPWXfNsMk/8zGhQMww2L+3XqZTz?=
 =?us-ascii?Q?ebqM8caMk/gLENnFTMj6GKMSSo2Kv7dcBde0hWyO7FFbOZF4bngxEacpdTjB?=
 =?us-ascii?Q?08PfqJBEAcgeyWXGUrzXMX2UB0Gn+hyy+4VuBRA78bwMzNda8w0FLUiB548M?=
 =?us-ascii?Q?aRo+Q2YW2CapwwNhO8yJJK/UtlejRTOfHqYL5Gvro0EZ9xek/Kadj/yucBvs?=
 =?us-ascii?Q?sTnbc0JEUtBNwFsl4Gbt4Gn3JqCGy8E0LvuQxXuPnskNUF8YKjYm16qQpuHv?=
 =?us-ascii?Q?+OpQXhZ7QIJg24WN++j/uRd8cKrqJ8TWGQP84lWJDiMwHRmfZrmvOkRnxx05?=
 =?us-ascii?Q?kvAzkLRFk4tosHbWYDJBQOB0Ko++yknD0R5Na4Px1ofvOxp1SRfh6SH6mBUs?=
 =?us-ascii?Q?rwV0IBvrFKvQvNIxxV5oYWKRJIJ2BQR75Sqt/YwHgFAYsQdV?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ipPWA4TisS6nVrfs0jQd+IYZXqYX4VGSOCihFF7MnuD5Rc6XBR1l3GL6XgstSeK+u0g9aqkwyEBrZuK9Oif+L7WaYQ1NdQaZ6OnG5PD43b9NyJn67aDuIWpvGJoWuHi8NFlszO1hRUmw4cXSJVvAMAHqP9BgCfxOeURia+H3eJfiZiu5DecziUj0zH1LyrvleAyeLjkXcyXMLjv6zTjxVjQug5eLvHsOZyRXWLSrUfMf1785zdBQJ8eycekYC1fopomrqkB8eDo9sVLvYlGJg4qXGYcZemVY0+imcXsCr5ZFdb0BgmhBMfYJjKI5W3pORu8CpszOQc94+ndaoPLgIQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ad2ed8d-ff3c-4791-b150-08df29ea28ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2026 11:56:19.5155
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tDjyPVhQPiTwgxeBLRcHlwjLPa7ixuPWhv0K790MY3/KLgQZJ3fXDuU4NVZobp9HbgmeuT2dzngb/6WjC6op/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7198
X-OriginatorOrg: intel.com



> -----Original Message-----
> From: Fabio Lima <contact@thefabio.com>
> Sent: Wednesday, October 14, 2026 3:37 PM
> To: alsa-devel@alsa-project.org; linux-sound@vger.kernel.org
> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>; Bard Lia=
o <yung-
> chuan.liao@linux.intel.com>; Takashi Iwai <tiwai@suse.de>; Mark Brown
> <broonie@kernel.org>
> Subject: [RFC/PATCH] ASoC: sdw_utils: Skip unattached SoundWire slaves du=
ring
> endpoint creation to prevent collision on Lenovo 83SN
>=20
> Hi all,
>=20
> On the Lenovo Yoga Pro 7 15IPH11 (DMI: "LENOVO 83SN", Board:
> "LNVNB161216", Intel Panther Lake platform), the internal SoundWire audio
> stack fails to initialize due to a duplicate sysfs entry collision during=
 machine driver
> probing.

The issue was fixed by commit 21f4552fbaaf=20
("soundwire: dmi-quirks: Disable ghost Realtek on Lenovo Yoga 7 Pro")
You could also test with the "ASoC/soundwire: remove ghost peripherals
from the mach table" series which is still under discussion.

>=20
> We have investigated the root cause and verified a working patch locally.=
 We
> would appreciate feedback on whether this should be handled generically i=
n
> soundwire helper utilities or via a DMI quirk in sof_sdw.
>=20

> Questions for Maintainers:
> 1. Is checking `slave->status =3D=3D SDW_SLAVE_ATTACHED` acceptable as ge=
neric
> behavior in `snd-soc-sdw-utils`, or is there a case where unattached devi=
ces must
> have endpoints pre-allocated?

checking slave->status is not reliable. The peripheral (slave) may not
be attached when you are checking it.

> 2. If maintainers prefer limiting this behavior to specific hardware quir=
ks, would a
> DMI match in `sound/soc/intel/boards/sof_sdw.c` for `LENOVO 83SN` be
> preferred?

We have a DMI table in drivers/soundwire/dmi-quirks.c.

>=20
> Signed-off-by: Fabio Lima <contact@thefabio.com>

