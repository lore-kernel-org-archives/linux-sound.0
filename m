Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC7D3B8D5C
	for <linux-sound@vger.kernel.org>; Fri, 11 Sep 2026 11:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789126297; cv=fail; b=Y9vQ4oaSrUKr43npi/yHS0GB46msfkcI6Z3NxW8ry35vtOuu2PySXYDlb9q3ct7IzqkwL6YT3jjJiuM7/lWWxOqxN84j8+gY/H7fG6D7bd1WUyH+Upw/WvHZUsZc5frxojzcoH+v49pLg8N9hnNGyksWXP8MGttjfRCkv0iQcPg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789126297; c=relaxed/simple;
	bh=4cGSk7+jo15fKiYGVRpeUC87pZrv1e3TsPm8GzpCGoA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qpmb0nWaQJFxSMaaGv/Z/2gbMmOYY7BnJrZJ4FDBNGLQSsyaIwBCI/oLFxLAMdsK1NmHzuvlEFx/sNYjbb1MZKc7W5kNgH3PjRw56sRV7N8QmDtdNT+rK4ky5LJWvPSkp1yrVq+uChb/mK9DPcc/y8ZVCuujPyvrsZ3UFMwUTmA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WzgjhMxP; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WzgjhMxP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789126283; x=1820662283;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=4cGSk7+jo15fKiYGVRpeUC87pZrv1e3TsPm8GzpCGoA=;
  b=WzgjhMxP0RfId1FSZHmixV1obaK9KeBKusnqpDC/Uq056ZlNtgkFejEk
   5BR4YdtKLIh3x1f4WVNz8QLbmr5zFa7ebtWXf4CDThK6q+DIH8c/h5ji/
   hwmWY+K0KkOLltwXcP+THQSaCBUtyL9Rf/59t1bb9Rg65Zxck1HKYkSJn
   s3sXBPikUmxTX6S7WKREfCzuLWdRA3Zl2HIWUsCzHAleloJuyJlK2LWOw
   G3hEOzyjPD96ubvDOJX7IiE8/idw5CltJmCToyhgzSyQdThPUYYEXjDhU
   lBv8jm1ESvdtX+qENR2ho9b72N9BK8VRsQEuQOnVrVaWEtTzfZ5U4/lWY
   Q==;
X-CSE-ConnectionGUID: WtcZy7MLQma2OHhwUB/2qw==
X-CSE-MsgGUID: jY4aNDtoQlOOedxBSUe+Qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="88730667"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="88730667"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 04:31:16 -0700
X-CSE-ConnectionGUID: BlG2C6ZiRciChxOjxVrffA==
X-CSE-MsgGUID: 0KF7GfojT/KSPa1Q2TKGTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="271873999"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 04:31:15 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 11 Sep 2026 04:31:15 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 11 Sep 2026 04:31:15 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.5) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 11 Sep 2026 04:31:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tg4mWamjQPBp0gVLH0x3wuD93zVGwgAIf3BeWMYj7L101o1yPk6lPGsa3e/ttR+5yyAtotrq9aCEkmPzy7dpXeKsSxMOiNjtQ6d9c2Z70bZgmCKduhPzsj89QiL+ea5BA5Qu3hb0o4D9chleZdXtGHn3FMiLipHcMI+KUPcxpFA2FPe5uNCnM1AwjFN/I9crUAmP6dRmFW4VnJEZZ8vLnBsPbGN5UYdgINrV553OcTtt1y+QoMV558UnxbTNHVgTeq+fC7IMor2R61eShWQ0AJX5V5pTP3j0br5zpUmaZdl9S7TixBd7XWsvpCygSrbhnN/4e2NPudOctToMbzUEVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AyPjM6SI0cAL/DbPkr5ENnZxy10c5R8uTEu2PxfIa/k=;
 b=Yze9HDyMyhpgxgDWtcFfLJ51Cd82sO/ISDkHaHsmOSlVRvXcUJK7BpG0M/Vgi1IZ7y54Uh2w/yFz13Tc8dA0yTh/BhgMXpV++WVCDm20BkNX/Xb5+lrlTBRYWOVV9iAafxhGjSnFOjz/AuOuIA143orqTzdauTjTCvBAigV+p9udIRDcQ40ov2xo1LS1heX2UjunXISXtWHCedzoXot2ftAJ9s90oQITwMozQsJX23DDNZynhhL5aIeZZbXkwxFoGxDWwpzkuGSX5nFhU+wkfyR1luVsK6FBz4rroop7zRxD3VFMmSIyHAHc/KPeg8RsMk+xNbfEAV5BOt3D9M3aaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com (2603:10b6:a03:53e::10)
 by IA3PR11MB9398.namprd11.prod.outlook.com (2603:10b6:208:576::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Fri, 11 Sep
 2026 11:31:11 +0000
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::3df:33f9:59a1:da76]) by SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::3df:33f9:59a1:da76%5]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 11:31:11 +0000
From: "Liao, Bard" <bard.liao@intel.com>
To: Antonio Di Lorenzo <antoniodilorenzonap@gmail.com>, "Rojewski, Cezary"
	<cezary.rojewski@intel.com>, Mark Brown <broonie@kernel.org>
CC: Liam Girdwood <liam.r.girdwood@linux.intel.com>, Peter Ujfalusi
	<peter.ujfalusi@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>
Subject: RE: [PATCH] ASoC: Intel: soc-acpi: add SoundWire config for ASUS
 P5405CAA
Thread-Topic: [PATCH] ASoC: Intel: soc-acpi: add SoundWire config for ASUS
 P5405CAA
Thread-Index: AQHdQc9N2a/4Yn8Ne0uxsnUvsO/cLbbJPN5A
Date: Fri, 11 Sep 2026 11:31:11 +0000
Message-ID: <SJ2PR11MB8424CAC73F665B786B57C1A0FFBE2@SJ2PR11MB8424.namprd11.prod.outlook.com>
References: <20260911091035.221224-1-antoniodilorenzonap@gmail.com>
In-Reply-To: <20260911091035.221224-1-antoniodilorenzonap@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB8424:EE_|IA3PR11MB9398:EE_
x-ms-office365-filtering-correlation-id: 6fababe1-caf1-4d65-3f14-08df0ff82e58
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|38070700021|6133799003|10067099003|11063799006|56012099006|18002099003|22082099003;
x-microsoft-antispam-message-info: kuzg8qvhrv4cqpVDhsN/mOYEz5KgMH1HT0csX2jE3XoH9/eDtD7rYewpGGZiJlObudeqUHNazAhgEcNa6QS+0e0I4dIdxra0q9UHp0hGiLtbNKww7eY+doe83W0QgUWN/RiuiGwYxLG3dzsoRwyp2SsTj+8dyWEGlk2CiKWmOhDZVG0TyHIhZULK9HoQCjeDt6DsGcuDZezKFJV7lazGyScIAldzBY/zbh6KFYivk3fk07nQy18fUZdMY8sUuF3z69edI2oBSJr0zXMU6/F2jHHX7lfobY4TBZFe7yOlqpWHQ2Sc10nwWBIQ9bDlo7/IRjqun66AxQrY6hWyhvRr1gsRAh4heRpr0ukEt53akLQ/+CmOCaDR47VPjMkrbkdsWy16yjVfsrwUK2jK/yhJ3ltYEdEJ8V+tEOqHRYIFHJKhLN6FHasPVH8HImWblce/5lgKdUaGd73a64mibNV9R1TPCUFvtTggfbWMecmp/2ySHXvBjVdT+UCpihu99vpjpxMqyQ4+JXNxoBHRbx/a3qvPK5IIxZifILQRGh27mCHmYUoRFchvokNUIQrrHQEEh5uol8BDn+rp2jx34XXE5kPRRj4ye8+UiGBCklPgDnlWPjBkqEZvSweOcWAB85FRlQAlB05H8xygC3zvovfa0QpuVlyTyJnBUzh3UB5jjmMr3GA0tabyjU4KzsN3R5l2rMpmePlTJKQtMSgc9mWmgiZ5Ti99b1lpuOFo5UWsd8c=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8424.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(38070700021)(6133799003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PB12Bzzm7T6nPVzaM5D9CI/49Xw9v+gYgtBmK/S2kT9OjgNIOZnDCnFuwoEg?=
 =?us-ascii?Q?Xuh8SfFqvw3porJgblBdMr6cwyI/FdO9zdXZC4Nx1CuoBdml1GMPcFZ1QKT1?=
 =?us-ascii?Q?x96BhAjT0D4O8KItMt7f8xgOY8uSxkLME7fD1PVd596jXLcinQ2sIPJd/wDu?=
 =?us-ascii?Q?itkZKbK0h4fwVDNWTYl2NaLznnVJ7mEP2iPj7A0+3aMeectmOIaD5ZEPuGM8?=
 =?us-ascii?Q?3MsOyxenNUot6g2ScwNioMaVIvJZvx+ISoMMiNW4FUoogVF5w3WmPC3wXA9S?=
 =?us-ascii?Q?klYIxdmfyRJADUdVb65qGeUV25qai5OY8H34sn6hXay3p5trGSABtip2Qbzk?=
 =?us-ascii?Q?cf5MIdwFH45wJOK/5p9oH5RV6ywiS3VQjIdO67mXylZ/DtOcCRjgN0JlsouX?=
 =?us-ascii?Q?tFX1bs8Pcx8AXC2aeSv7ZCr0ciQ2DobZzsEogGv7kW/TOZ5vI0IZDkEvDWb/?=
 =?us-ascii?Q?WovcrINyx6EQ9nzJdwzgaP+1jNH6cuVuukpbdqGbtqBgCl2LeVVD9sB8r09x?=
 =?us-ascii?Q?8YVlkKVfy81gWbVNNPbOdoiax7D9j3B/dN7BKRYD7ln3bSD9qyUr+DYHSuzF?=
 =?us-ascii?Q?xfeCmtDdS+uhPXbILbZLQ3781bP3nR5Mm3MOH+wyFq7mp2vI8+Z9L0aqxZMv?=
 =?us-ascii?Q?IoxiuSyKZe2UMh137B8/rQZ+Qx/lu6ipU5z+okXkafeclKaYQEJ104XxfA/m?=
 =?us-ascii?Q?Q9bp3ZgIyorLfg0Pu/4Tsbo7T4Wzxuxwpeu8DBltwSxrnMJ5h7EPaSlDKxgq?=
 =?us-ascii?Q?R2XBU13u+R7oaOvIrxvxAv3XFKUKpxpvZRW+Opts5E4gQORD8p4/N+7pyBck?=
 =?us-ascii?Q?zCVRaTNATsZTT9kAyBNVkptr2PQT/rtU1f4vaZpheQ9yKN6IIIbIs2wzebd1?=
 =?us-ascii?Q?xmMpWRoClK/1M71LZw3ATaNcWB8milvw68OUDUovV3/hSTfMqzbq8/T/BFl4?=
 =?us-ascii?Q?6OOQKlICuPpQtp4EVmMqH5rx02fkS+TkMe1ZytDbVA7a2tbqovHNpyA3mWWA?=
 =?us-ascii?Q?YMqZCQky2YyGl/Gb52SQq3S+MwsOjVEFkIHMhl6CU5Fs3uep0ZkyisNwVlRz?=
 =?us-ascii?Q?3OSxzrdO7yP9o6yfh0xEbkhj2+wSFz9xZsrj+hT6q5vIpj4JmA6lShGbooYI?=
 =?us-ascii?Q?VLe2WqIrvorOCX5Ph+XuLK/+PWUKjA2RmPYuSEXjqfLksj/vJH7qWJsVw4HL?=
 =?us-ascii?Q?AbTF/6Pgw667dLh9m0HN/cDuMRP8RLP7kGInDf/VsSZA9p42TdLFEnBico4V?=
 =?us-ascii?Q?zABF/kYj2idU024J5RW90wybS7xr4gCNE80r15+4bOSpA07D208v5nbz79Br?=
 =?us-ascii?Q?7qkzU7wRC57Xzc/eGGRWcxzsxUPV/49zv2TsawA02cQ4nle85POOHjvsUS1F?=
 =?us-ascii?Q?xKF+8qARwV3zggLsxO8LlKBgzFTYEyVl4euyNGtHk33MGjbt067zNwuyE6Ez?=
 =?us-ascii?Q?C0UlcyFCn+C5lNtYwaSrWFoWc9QRHV/4yqAhugeKRNzyDum/XdMaI6EddJTe?=
 =?us-ascii?Q?DfFgGT0ytCCBGakP21X2FBXzSQl6T1Bz+8QzC29i+DQRM8V6/eQHyBm84ETy?=
 =?us-ascii?Q?jBJFnYI+eUF8pxmtzRB8Wa3Q9vNHGRmDQWoPYF9B2DV2Vx5H2GbbtsxCvs/C?=
 =?us-ascii?Q?3ULrfi2lMFv5fU8WXW9aZ1TSpZj05a0Th2ZkzG2JlxLjXyiX8YG3FADtVUQ1?=
 =?us-ascii?Q?5EPfe7ES11uwVDVN7IRu6MUUTOtd3IzxrdM4StlFAzHzm3oJ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: RHEvXJ0eWN/hnHzfH8eFx0J2pFzO1dBZ126GeHrFtPgPcOMqf2353iwbcU5qb7fGqp3Jp9QkTC4jpIvbDgiK1ImvxVDvDlOdVA38luy/QfTp/7+5DFJCGAiutv2yRvOzORMflZjWWmfJaCqt60V5mwra/zh9XNGi0plPm6t+CbxM6jzI6s9vKZyc3B7me6BsaUGSPNvWeOmkTH3VmJPXk884f7bC9iemuBqrfD880jeZGs7XC5rYB6ZlA35+X8VnDDI4XUS0/zziC8cPBt0klXEiRphUOMVay6yZt5gVGKe8W18mo0eKtqHVf/5Ks9+ldhBcyg72rX6dpKjfEmynAw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fababe1-caf1-4d65-3f14-08df0ff82e58
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2026 11:31:11.2763
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MOp2xTEFclS6Voaq9dJoa3MUtISG5F4TmoImRTYdhv1HcBszPkbD69JAf8+1CB1K+i/SghUpvTS3ZCkNJsTEDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9398
X-OriginatorOrg: intel.com



> -----Original Message-----
> From: Antonio Di Lorenzo <antoniodilorenzonap@gmail.com>
> Sent: Friday, September 11, 2026 5:11 PM
> To: Rojewski, Cezary <cezary.rojewski@intel.com>; Mark Brown
> <broonie@kernel.org>
> Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>; Peter Ujfalusi
> <peter.ujfalusi@linux.intel.com>; Bard Liao <yung-
> chuan.liao@linux.intel.com>; Kai Vehmanen <kai.vehmanen@linux.intel.com>;
> Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>; linux-
> sound@vger.kernel.org; Antonio Di Lorenzo
> <antoniodilorenzonap@gmail.com>
> Subject: [PATCH] ASoC: Intel: soc-acpi: add SoundWire config for ASUS
> P5405CAA
>=20
> The ASUS ExpertBook P5 P5405CAA uses two TAS2783 speaker
> amplifiers on SoundWire link 1 and an RT721 codec on link 3.
>=20
> Add the corresponding SoundWire ADR devices and link description
> so the sof_sdw machine driver can select the correct configuration.
>=20
> RT721 AIF1 is used for the headset jack and AIF3 for the DMIC,
> while AIF2 is unused when external speaker amplifiers are present.

In theory, hda_sdw_machine_select() will create the mach table. We
don't need to create the mach table for Intel LNL+ platforms. Have
you tested without this patch? Please file an issue on
https://github.com/thesofproject/linux/issues if it doesn't work.

>=20
> Use function topology selection for this configuration.
>=20
> Signed-off-by: Antonio Di Lorenzo <antoniodilorenzonap@gmail.com>
> ---
>  .../intel/common/soc-acpi-intel-ptl-match.c   | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>=20
> diff --git a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
> b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
> index 756bbf82a326..1035d61f65e9 100644
> --- a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
> +++ b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
> @@ -109,6 +109,23 @@ static const struct snd_soc_acpi_endpoint
> jack_dmic_endpoints[] =3D {
>  	},
>  };
>=20
> +static const struct snd_soc_acpi_endpoint rt721_jack_dmic_endpoints[] =
=3D {
> +	/* Jack Endpoint (AIF1) */
> +	{
> +		.num =3D 0,
> +		.aggregated =3D 0,
> +		.group_position =3D 0,
> +		.group_id =3D 0,
> +	},
> +	/* DMIC Endpoint (AIF3); AIF2 is unused with external speaker amps
> */
> +	{
> +		.num =3D 2,
> +		.aggregated =3D 0,
> +		.group_position =3D 0,
> +		.group_id =3D 0,
> +	},
> +};
> +
>  static const struct snd_soc_acpi_endpoint jack_amp_g1_dmic_endpoints[] =
=3D {
>  	/* Jack Endpoint */
>  	{
> @@ -301,6 +318,46 @@ static const struct snd_soc_acpi_adr_device
> rt1320_3_group2_adr[] =3D {
>  	}
>  };
>=20
> +/* TAS2783 stereo speaker pair on SoundWire link 1. */
> +static const struct snd_soc_acpi_adr_device tas2783_1_adr[] =3D {
> +	{
> +		.adr =3D 0x00013c0102000001ull,
> +		.num_endpoints =3D 1,
> +		.endpoints =3D &spk_l_endpoint,
> +		.name_prefix =3D "tas2783-1",
> +	},
> +	{
> +		.adr =3D 0x0001390102000001ull,
> +		.num_endpoints =3D 1,
> +		.endpoints =3D &spk_r_endpoint,
> +		.name_prefix =3D "tas2783-2",
> +	},
> +};
> +
> +static const struct snd_soc_acpi_adr_device rt721_3_adr[] =3D {
> +	{
> +		.adr =3D 0x000330025d072101ull,
> +		.num_endpoints =3D ARRAY_SIZE(rt721_jack_dmic_endpoints),
> +		.endpoints =3D rt721_jack_dmic_endpoints,
> +		.name_prefix =3D "rt721",
> +	},
> +};
> +
> +/* ASUS ExpertBook P5 P5405CAA */
> +static const struct snd_soc_acpi_link_adr ptl_tas2783_l1_rt721_l3[] =3D =
{
> +	{
> +		.mask =3D BIT(1),
> +		.num_adr =3D ARRAY_SIZE(tas2783_1_adr),
> +		.adr_d =3D tas2783_1_adr,
> +	},
> +	{
> +		.mask =3D BIT(3),
> +		.num_adr =3D ARRAY_SIZE(rt721_3_adr),
> +		.adr_d =3D rt721_3_adr,
> +	},
> +	{}
> +};
> +
>  static const struct snd_soc_acpi_link_adr ptl_cs42l43_agg_l3_cs35l56_l2[=
] =3D {
>  	{
>  		.mask =3D BIT(3),
> @@ -487,6 +544,14 @@ struct snd_soc_acpi_mach
> snd_soc_acpi_intel_ptl_sdw_machines[] =3D {
>  		.sof_tplg_filename =3D "sof-ptl-rt713-l3-rt1320-l1.tplg",
>  		.get_function_tplg_files =3D sof_sdw_get_tplg_files,
>  	},
> +	{
> +		.link_mask =3D BIT(1) | BIT(3),
> +		.links =3D ptl_tas2783_l1_rt721_l3,
> +		.drv_name =3D "sof_sdw",
> +		/* Function topologies only; no monolithic fallback. */
> +		.sof_tplg_filename =3D "sof-ptl-dummy.tplg",
> +		.get_function_tplg_files =3D sof_sdw_get_tplg_files,
> +	},
>  	{
>  		.link_mask =3D BIT(0) | BIT(2) | BIT(3),
>  		.links =3D ptl_rt722_l0_rt1320_l23,
> --
> 2.55.0
>=20

