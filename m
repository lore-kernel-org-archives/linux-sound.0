Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C518DDA3
	for <linux-sound@vger.kernel.org>; Mon, 17 Jun 2024 03:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718595262; cv=fail; b=Lj/163cg0XrYqjjEJGJkp+b1NszzyT6KAAQVoqI/gSne98r37MavRcmyP7923j/tc9UzZHTRNbI0eeDt3GnaIynQqclqlWJFgzLheAu4g3KexB48rga+SiKllEV4uJL2TJOYec3Tq5fUteEgvzpYevL5yyNSrUgnJlb+EB9zZl0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718595262; c=relaxed/simple;
	bh=8oUehhotAb6vMEEyQCZ9Qgk+NvZ1hjOzPEsZ2yHBrRk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OF6Ux9JWwPD/YmHHV7CuijYMquM3t19B+2oX7/WfIsJcANgZ9TRHM9z2TqmVe3RI0a8civ2txLzNmts/zIwngxf2geqV6wDe7vk8frCjSbvQA2Tqad4LedrYSyHr3lmCZpRC13AfsfkivKqpxxb2hXU1H7xnVCcbZN9fHQG8BbM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pd9G9wQz; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pd9G9wQz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718595260; x=1750131260;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=8oUehhotAb6vMEEyQCZ9Qgk+NvZ1hjOzPEsZ2yHBrRk=;
  b=Pd9G9wQzAC0Z/3XcH+iLaNLvW9Ux78X4vKWF1aSkN0s/R6yVKHrTg0yt
   sCjDniNowJiquEbUbNOlsfGKM6Fe2R6v447g4U/JD1Wvstc2vNfPmbpHC
   8giL8xHuK4tWsAHWURmFPM2C0YisNvyuAgBF5yh3fGwh9dvMcDLG0rcJh
   aQfMPqG1mew6hRDS+3A+1WqSql082q0CzC8iC+DV4MFYHtMh4AwOlsrVN
   HNUueNJGRo2lI3jUHCUf+En2omYgfcId3ZZDUjEFugr4aFFGJCovbMohZ
   kphIJhPoZJ7vHGrgJeCUvSMGkCLslkPIqWPmpcF9eDnS7YL3krSnVoDl1
   g==;
X-CSE-ConnectionGUID: 2QY65fXSS8iMutRvDlZ/cw==
X-CSE-MsgGUID: WR9/x0qJR6Om1G2MjKQDcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="15244894"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="15244894"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2024 20:34:20 -0700
X-CSE-ConnectionGUID: 9LCgeuwyT3Gg6dCENvomjg==
X-CSE-MsgGUID: X2uBcZHeTyK4WhEvD3Zxkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="41209416"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 16 Jun 2024 20:34:19 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 16 Jun 2024 20:34:19 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 16 Jun 2024 20:34:19 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 16 Jun 2024 20:34:19 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 16 Jun 2024 20:34:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VGqI+pEz+1t561eHBQL+7L8QDo0UVa817MODhDFN1z1Qk0wc1Rb84CUB9Ea3L8KDTO7fxDPgO/ll5ja2HCr58OdfDFgQmjp7zQOhkB5JTylAs/uLxZIe4cIaGMFCzSdf8c1WE6hgnpaSWpEqXNb9VF9KgSFT+e37aVescAycekMRRYCMLVdWn7km8J7fs2pb/GpPmnC8QtuOb30NaYbMc4HFQyne5jgv71W2Le4a3OxII30t8Um3c8CYxB/7Kec2LMesDTTgb6zqH4CesGr1sKNJKUjSL6nhcookslpAVMP8Fgl57WTvgFAiAZX5mOvFfsYYkR+9l22qOx2D/qm5+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mz6twe3DEpAhE6g+9Rnb696/sn3ivT+qM3eJ+qWyKRk=;
 b=fa/xpQSfn1ALup3FfHLdQvfoWZVcAs0BBj74YQywTAgUSxufllMIPLH4rRsnIuBaurxJXuRh9p2sU3viJ0xCDDe3GHSZw5gz6GzYoEQ4lmKGLWY1ayloeAoWI5fbxywiOzPlC8YJTALrapl2SSIHthpH1/eQn0F81SkUC+DfM4aQMN/paV/TM+64ALoC/nlNvHy7Ztg/SVMddyjDyNRe0FrJt5NE94B+5b0BXKglY4EuID3uHxuXHTi0qYlop3pdITBARxt+9X5INtO6y/TkvFsMscyUaqfNnKssVhyzGTfIX1357CswRhRX7Ro1zAMq+5CbpFhMptPP8syjBNmdBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8436.namprd11.prod.outlook.com (2603:10b6:610:173::9)
 by SA1PR11MB8447.namprd11.prod.outlook.com (2603:10b6:806:3ac::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 03:34:17 +0000
Received: from CH3PR11MB8436.namprd11.prod.outlook.com
 ([fe80::9823:3913:4d65:5e95]) by CH3PR11MB8436.namprd11.prod.outlook.com
 ([fe80::9823:3913:4d65:5e95%5]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 03:34:17 +0000
From: "Liao, Bard" <bard.liao@intel.com>
To: "shumingf@realtek.com" <shumingf@realtek.com>, "broonie@kernel.org"
	<broonie@kernel.org>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>
CC: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"lars@metafoo.de" <lars@metafoo.de>, "flove@realtek.com" <flove@realtek.com>,
	"oder_chiou@realtek.com" <oder_chiou@realtek.com>, "jack.yu@realtek.com"
	<jack.yu@realtek.com>, "derek.fang@realtek.com" <derek.fang@realtek.com>,
	"Bossart, Pierre-louis" <pierre-louis.bossart@intel.com>,
	"Deep.Harsora@Dell.com" <Deep.Harsora@Dell.com>
Subject: RE: [PATCH] ASoC: Intel: soc-acpi: mtl: fix speaker no sound on Dell
 SKU 0C64
Thread-Topic: [PATCH] ASoC: Intel: soc-acpi: mtl: fix speaker no sound on Dell
 SKU 0C64
Thread-Index: AQHavJ5Tdf7vtRVnAkSHSOv1+AqD6bHLVPAQ
Date: Mon, 17 Jun 2024 03:34:16 +0000
Message-ID: <CH3PR11MB8436FE7DE269E9D8EACD0A89FFCD2@CH3PR11MB8436.namprd11.prod.outlook.com>
References: <20240612075740.1678082-1-shumingf@realtek.com>
In-Reply-To: <20240612075740.1678082-1-shumingf@realtek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8436:EE_|SA1PR11MB8447:EE_
x-ms-office365-filtering-correlation-id: dba8f11d-e02a-4cd2-3241-08dc8e7e5dc4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230037|7416011|376011|1800799021|366013|38070700015;
x-microsoft-antispam-message-info: =?us-ascii?Q?T27Wg0sst0yQr38mXG45ia9PzF3yD3ognpdpgpotMSRZxJ8cCSIzh+k7Bsf6?=
 =?us-ascii?Q?Cyf2wxnkB20Sf0Ceg1IMh2DOYviWlez7ssxMh5rqJLICVg4UkXFISQOPn7JP?=
 =?us-ascii?Q?qO8RtdsO9Ghzl4793lErJJNxyyGmY++DtxphLa5ioB2vuwB2yrOUHdPHWuFc?=
 =?us-ascii?Q?sW42jQSgGgVBXXXvotxtu9vB3fKLbXIHB5tX0pbti0cgx6bzHQ5mOuSPVEWB?=
 =?us-ascii?Q?vzdxFOcJsYUELwPYxS/GcrADjM1W8edzpdToZ51VZuv0HgZ2WHhAcw5g50kT?=
 =?us-ascii?Q?PCJzP52/+qDqwLvZiVC6vC/pn+xbhmffjlgtEXya3v5anXaDXB7y+pIV3R5+?=
 =?us-ascii?Q?hKiFiSrIUqsEvuLqESjbJl5qXS7ahTFxFzekHJ48EEFD+2Q1/H9o+C5toPWH?=
 =?us-ascii?Q?+EyycenUlOt2SfvPUiqcg5J0cVFLQSLvlEVTfzXo9OjWeoQfKtwqPmHmugi5?=
 =?us-ascii?Q?LaZbj4Lx0bqaJieMDIEiji1+AadzjfcCWmAVIUsbHq0wnYce9oG5ElaRDpmE?=
 =?us-ascii?Q?C8Cf8tg4/EVl8cpRkm34yqMUgwHR10AgX111QPit/FDgsk3civ+avesEiQba?=
 =?us-ascii?Q?KI32Z9gtdHDHKx5TxGdYXOfqWprLWklV7rtq0LUco/gQyZiTniO11noXbfPQ?=
 =?us-ascii?Q?s9X3L74eFvSZpazGsKzVtc2apynmv/5iwXPQZQJDs0+TUKvXi3VtcEityJZQ?=
 =?us-ascii?Q?gPlMem25e2tTjMkv3M3UTPPwgIMjyTQMdrsBSzyDMXKZYxTc691XMqN5Z23F?=
 =?us-ascii?Q?o7RMnQWWjpFs/xR4dJ+vMtGNv45brVO+1nc6Bm8XW4S4sLyJ4bKdD8z40VjE?=
 =?us-ascii?Q?lFkehyiVc9fe+T/f7cxiL1xHOfxuJ0iZqVh4o/HuEqiazUEFekJrc6wtpQq/?=
 =?us-ascii?Q?7kpECc983SQ41BGk2bEmNILko+zTy1EWPx9+KO8B8fOml3e0txbidYWEjh52?=
 =?us-ascii?Q?u04cst4oE3Kh5rltBSOzbI3mhAOwSkxwUuex/aE7CfXE91/+9+HtG6r+OVrJ?=
 =?us-ascii?Q?q5yTyp3yb6ZoIzPInp1UQ3HiMgJAADSn3zPhu7fyHEe+ubkFpjKGIPFwv+YJ?=
 =?us-ascii?Q?aYSaEArSmxSZ6XTkksLTcpPiVHKKYfHJQCgzB6IWwo1tSUb5RsY6ngL4eyV/?=
 =?us-ascii?Q?HfKHlOyhX5AnO1OX2x+3pA2fkKaSfkIbzEWZOjdb/Q4fiSbGsRRaSv8G3LE/?=
 =?us-ascii?Q?jbrpGX3HLOdEFBwHJe8TaLSUpikNJELROwAPeamoO75k5X15F6nUl6NBEBb8?=
 =?us-ascii?Q?sxNcE9ioSvdL3DZdsijWxqqQRDocbdcfdMjIklyqvs43I3cWErI/o8JeJ9Bq?=
 =?us-ascii?Q?biQ9lVU4c4l1uocKb8BJLy8hw6ptfGQ8G3rVHO8YfYTQPD2Bh+sMTCXLM42S?=
 =?us-ascii?Q?o4Nyta4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8436.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(7416011)(376011)(1800799021)(366013)(38070700015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZWt2dH8mAFwpcVUk8ijtzni8gR+FIeS5Td6KuRXASizBjFgJuXdBQh349XBJ?=
 =?us-ascii?Q?9EPhjQLCzPYIIxJ/z7SSmTGZzDENEOYHVFxcTcZmJxAP1sg4P6E6NdgqdeUu?=
 =?us-ascii?Q?JD/GAaFed1r2I1jeWMkX9rMudL1HqeD9Us0VxIzZY1cTx6VQdYMdlWMU1qGH?=
 =?us-ascii?Q?O2DO/9m8vVm6ZP85kf/shZ4G/jDUg0tFoDFz9uQ9V2U1eC+0TPkd2ROVTUs9?=
 =?us-ascii?Q?QhDIIkZ26MB9xlXyo1vjFGKXWzEMGeNnlhGIuCJigB2kbKmm8s4/47mVSh3Q?=
 =?us-ascii?Q?vTl256lv8GsrGSz2fHDBJveiLz2UOwYP99nXetdBK7aT19lbEL/B6HL4050X?=
 =?us-ascii?Q?8QBOO/7CYr4X+2S04nUOQUnfist9S5IHvvCDXIfUfqNjun49zM6f3dT9YmWQ?=
 =?us-ascii?Q?yP4URdj8R//Tw6+uzIFKszYekGO3hM184hY86rB3vry1tcJnN3u/Ii9IxVcA?=
 =?us-ascii?Q?ngoheX8R+bd+UUp9UevoUcEvr4R+JKBLPNPQET3Iz/a3LmWoO2jEUfM8mLdr?=
 =?us-ascii?Q?lmrM7VpZlfU+6b+YDO7nNpSULfnJpEotLNDNbHmwne0AorXrXBW4uVw4s2Ot?=
 =?us-ascii?Q?DrtPoXv9RAt6qjAZah6sV5bBF5Sci2ZXO/OJYrsfo5Nk+ZxBpvNX8jcMV0th?=
 =?us-ascii?Q?so8GbI2gQMxY3rrCE0vdq+EpQnh86evvRrQ7kzTjEHr3uWnc0mosmEagYR9K?=
 =?us-ascii?Q?YdX40cEIa3CqktJdUQQjNenUU+3B9ftZIov1Ramp2x+wFCM2ikQzNMpPVaxq?=
 =?us-ascii?Q?xPN207X/MbIgeNGeR1m2sw2jrqz+GEKu2NPG64cPpGPThOM8M3kIJDDlDTjn?=
 =?us-ascii?Q?HGvOjNsd4JdXOS7mekXBJPoGfLJLMXNbkuf+6/TtfMtkHVSU6OQq/sft6rWx?=
 =?us-ascii?Q?gnvazmExeKIh8Rd8dSO5w4A+O0Xh9s9W+3Ov8ysVUSe+CcjApFRENhjEx+1Y?=
 =?us-ascii?Q?KbEXWlPxTSxqxBs2BHzrDWi22jaVm1O25MgF3QMrdGUdB6fBBUl58NcHSVsk?=
 =?us-ascii?Q?ao/Pf8UF+cDce8ntVXtZMQYAf5yZgm/Vr46mIMyAuJWCnZAgpv3komtcCe82?=
 =?us-ascii?Q?Zy0OVAz26up7WdLsk5kJ/otWVW+NvHY9imQTqbSoEQNLxFlzG/U3gXzFn0Ez?=
 =?us-ascii?Q?vm+D/TMGys8D7lmXIj7Rcpf/k0gez1C/5elbJ9p1VD1fsBtQ6pn3pkJN1y+z?=
 =?us-ascii?Q?hgYLdU1b1HSiGlDmDNQHM2GBatYfm5FbSPgnUmbu9T4FiNT57f+3jf/SyM9l?=
 =?us-ascii?Q?1des7VhPpCoVwrn5ccOowY8BLgwuvCCYuRFSfN6yvTrKmw9FMDTr9w4cyz9X?=
 =?us-ascii?Q?b9Uajsc7PtRwfHJ3FDvZhMuEh/Tz755rCIN/hqJOuSOC8jdKbUPBcsxL0Unr?=
 =?us-ascii?Q?8sNZM8B/TR++2FSkXlsrxNQC6y3pdM/+D6ECIDXX4phudy/hEbWxjmYx7Alk?=
 =?us-ascii?Q?NLF2a0DuEUkbs86VtNj9ipQWFT4/7/VJtg/KGOglvpmtbB+opnMJfwli1h8b?=
 =?us-ascii?Q?H9OrWRe9JoXq16Eo7TwC2lUwHxFZtL+TXfqQskNxZqWRr/vHQf6ZNeP3F9Uj?=
 =?us-ascii?Q?a65enOBcivJnq+jjD0s=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8436.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dba8f11d-e02a-4cd2-3241-08dc8e7e5dc4
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2024 03:34:16.9821
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CZAUX0hebV39AjAKvVOJMMa+zvrgVgK1sE3tja3nSFpGCmfMmTNgQFolD5E3XPnrIXxeW3w5p6v9OtGXsMxqwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8447
X-OriginatorOrg: intel.com



> -----Original Message-----
> From: shumingf@realtek.com <shumingf@realtek.com>
> Sent: Wednesday, June 12, 2024 3:58 PM
> To: broonie@kernel.org; lgirdwood@gmail.com
> Cc: linux-sound@vger.kernel.org; lars@metafoo.de; flove@realtek.com;
> oder_chiou@realtek.com; jack.yu@realtek.com; derek.fang@realtek.com;
> Bossart, Pierre-louis <pierre-louis.bossart@intel.com>; Liao, Bard
> <bard.liao@intel.com>; Deep.Harsora@Dell.com; Shuming Fan
> <shumingf@realtek.com>
> Subject: [PATCH] ASoC: Intel: soc-acpi: mtl: fix speaker no sound on Dell=
 SKU
> 0C64
>=20
> From: Shuming Fan <shumingf@realtek.com>
>=20
> Dell SKU 0C64 has a single rt1318 amplifier.
> The prefix name of control still needs to be set rt1318-1 corresponding t=
o
> UCM config.
>=20
> Signed-off-by: Shuming Fan <shumingf@realtek.com>

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>

> ---
>  sound/soc/intel/common/soc-acpi-intel-mtl-match.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
> b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
> index 48252fa9e39e..8e0ae3635a35 100644
> --- a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
> +++ b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
> @@ -293,7 +293,7 @@ static const struct snd_soc_acpi_adr_device
> rt1318_1_single_adr[] =3D {
>  		.adr =3D 0x000130025D131801,
>  		.num_endpoints =3D 1,
>  		.endpoints =3D &single_endpoint,
> -		.name_prefix =3D "rt1318"
> +		.name_prefix =3D "rt1318-1"
>  	}
>  };
>=20
> --
> 2.34.1

