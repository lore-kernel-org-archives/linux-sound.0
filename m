Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6A88F6E
	for <linux-sound@vger.kernel.org>; Tue, 11 Mar 2025 00:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741653161; cv=fail; b=b0d1YTC2TCSbcro43S3IC53lV6AOemUXUOCnHE1lgfDskfZPuG5Cdgfd8zZeauhUsSHRzR89cPxLNte+ULtWx9fKKneWO/Utzvyq5J3HopL273cq78zJxItW5z76QO47x3Y3OuErvXeQCUwjqCfYHVQeiEywzfEWN1kNR5LHmRE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741653161; c=relaxed/simple;
	bh=przYxmC6HOsQfqwSCRekLH1tFebGqfL7sbcZogwL1EI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lIjiQIHlTBaTgI2a1Sp4AbMWy0iLlxru2x6A2UGAcWpt7ZTJTUBxvBzHU+oisYTnPZNv/cTvmnI0ZPHQm0VsvK5JmHmYCJCehJI3wpUgXg5bqmsQaSW+li32M2epS3+//BDb67ny3X2APCGpvribU5wS0QWrHOnDsZTZ6+Uur1Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PbfcOq6J; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PbfcOq6J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741653160; x=1773189160;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=przYxmC6HOsQfqwSCRekLH1tFebGqfL7sbcZogwL1EI=;
  b=PbfcOq6J4O043NSvVPmipNwsk6ET11uFChM5j5fjeKsy7Y4ZP/7ADT77
   GntEAW3H2ghiJNLHlMEwnmraGjOqD+iU0PjUlTWiGMaY136LhtanUUHPB
   PxcmUjwzk0gdxB6rdXSkSNtcekSHcf9lqRnIvNwoTW4GMzORFqDKG0wOv
   9op3hQTlftey7XsHh79uhWLnnl4poGaeHgWsScTaGsTWjW+TDldv0kkiw
   AnloYPMJjnfWQ/UxKnfxeyWSw5jQL5vmtHCb1/HdfuTQ6PZ4uYXutMLeP
   vPrbq3Gd8l+vsZ4n9PEQ84M6F1vPMtSN0cZg5c1g68nK2u8ZlMXndx9Z0
   A==;
X-CSE-ConnectionGUID: 9P1W4sLuSsOhLIAX0U9gSg==
X-CSE-MsgGUID: o4eZ3O/9RjC8Sl0XonjqDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="42860546"
X-IronPort-AV: E=Sophos;i="6.14,237,1736841600"; 
   d="scan'208";a="42860546"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 17:32:40 -0700
X-CSE-ConnectionGUID: TxH6lJHqRbKsI0gdONzzhA==
X-CSE-MsgGUID: a7J7rP0GSvi0OIYScJttZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,237,1736841600"; 
   d="scan'208";a="119872447"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 17:32:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 10 Mar 2025 17:32:38 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 10 Mar 2025 17:32:38 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Mar 2025 17:32:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mJmaZ0rq08IUV5uZuV62sbS1oykQmMPv5XhkYtsjx/K/+szXcopH8H15LFwKQePwpnq5ut2cXrTNl327w+78gbOTx7ZOs37gNkcF8W+7hM4B95JR9LdbISS4vpwzjsSVXeULdAEi+0fItmYTdNnQ2dZicT9PjuK6tuG3BGGFygBdxMN44f1F5Od386DSedguINV2P8htT4rKMlBXhuuQj4B1JsOw4IYTO4jOkbe7ta0TmzPnzhs6W4O9ry5uMpssCZeVGO6My4dArxF8xHzBqmjHH1J8e77g0CZ61L3XkVkm/H/495WKrnurWJvsCcuuzQzSibZDsrdRXt9qWgetPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=przYxmC6HOsQfqwSCRekLH1tFebGqfL7sbcZogwL1EI=;
 b=v4rwIT89m3T3zOoKE9X0zfrlU0+8ZvNoNcAB0vbK5+TxvrpIHvxYjVufVK+7Cun0rHxvMdZ7wOwQBE959sL9Akp33zq5rhZylHn4a9UXCWHwL6p8gBE/0GT1xJI3JTGMzBuygMa1NjcVimm0YPo1lt11hZUN9RUHwvMncJbkdDcv5rw2M36n7ls0ZY9ZgOgG4ulpDofHHeOEXVwV565714bjXRqfUaw/tZZheVVN40BipI6UzxePQltwd7KRrqun3IXBB5aWoLsvS6O1pgJlrv+XxT3H4t0/e15KC0Cf43wO3jk96rZl3GAywWe9FEJCL6tJiJJsZzvHC103P1wvpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com (2603:10b6:a03:53e::10)
 by PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 00:32:19 +0000
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::4053:18a0:f95:3b9c]) by SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::4053:18a0:f95:3b9c%6]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 00:32:19 +0000
From: "Liao, Bard" <bard.liao@intel.com>
To: Mark Brown <broonie@kernel.org>, Bard Liao
	<yung-chuan.liao@linux.intel.com>
CC: "tiwai@suse.de" <tiwai@suse.de>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "pierre-louis.bossart@linux.dev"
	<pierre-louis.bossart@linux.dev>
Subject: RE: [PATCH] ASoC: Intel: soc-acpi-intel-ptl-match: Add cs42l43
 support
Thread-Topic: [PATCH] ASoC: Intel: soc-acpi-intel-ptl-match: Add cs42l43
 support
Thread-Index: AQHbkZN5No/8Vrc5MEmsTio24tJ5I7NsfAAAgACazaA=
Date: Tue, 11 Mar 2025 00:32:19 +0000
Message-ID: <SJ2PR11MB84243EC82B19458E3E578D5BFFD12@SJ2PR11MB8424.namprd11.prod.outlook.com>
References: <20250310080712.58911-1-yung-chuan.liao@linux.intel.com>
 <ae3ee5b8-e461-42f4-8cd3-97247f28f583@sirena.org.uk>
In-Reply-To: <ae3ee5b8-e461-42f4-8cd3-97247f28f583@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB8424:EE_|PH0PR11MB5832:EE_
x-ms-office365-filtering-correlation-id: a20a7ab3-e17c-4fa0-1605-08dd60342e8d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?OHFVNmNNdUNMeEJtSXVXRWpONWcyTWxQdVRSaFBFNXJzQXZQM0ViaTMxYkVC?=
 =?utf-8?B?T21hQ3ovN0tqTkdLRlBHNmYxdXRaUUE2TjA1cDIvdjZ1YW5nRnlSYjYzWnU2?=
 =?utf-8?B?WVBwNzJGcjgzUjR3a3lXU0t5YkJ1NUJBKzlPaUVaV2hXUVJkcDBPK0NRWlg4?=
 =?utf-8?B?S1ZGOGNWUHo2c1BQb0RURVlLbnNmbURPQXFodXRUSjNPcldWVHdOcDV1S3Vj?=
 =?utf-8?B?dkVyUDgvaWdEcnFhYzNvdE9vU0syTDIzVXBvd1BDczNxakdMbFNnd1hZT2F2?=
 =?utf-8?B?WS94SmtIak5WVDhyKy9FOFFoeE4yd3IyQ2wyM0ZLM2FMZXNLa29EWUlRdllM?=
 =?utf-8?B?VXM0QXp4dnRrREVaOWlMWjdLU1Nhd0RxenNxQ0t0V3kvOFl5VFFSbnZ2MjMz?=
 =?utf-8?B?MXVnRkpLMnJoVDkrTDFHMkxIdk5leVdrYTlSU2paSU9qaFNHTWUrcFJoRnN4?=
 =?utf-8?B?cUkvNFJTL2Y2dkJ0RmtQSVlnR3JrbFRQbEdaUTA1Q29tZGIxZWRWSUxNdjZ4?=
 =?utf-8?B?SEZBek1uaTU2cVlmSUhtUS94ZXNNZHByOXlxRktmZm1rb2R4YjM0MW5jc0hK?=
 =?utf-8?B?cUZzR1QxWFhscUlPNzUzWkZpaG0rVXlOSXVyb3U3bzZvRVZDTUV4NjlYRnJq?=
 =?utf-8?B?b2JXZHBzeUlLYVpzMDFwZWczSElmdW5DNUVXNVpqbHBCS3JETDBCY1ZOczd4?=
 =?utf-8?B?YStXN0VYblRobGJsQ2p4eG5VaVhWQ0p0YzZPdnhhNUE1cjJLaTJPVGZvNUdZ?=
 =?utf-8?B?dFFSR2JIQ1NxTkoxSm5qNnFSTlh2RDZHNURIM2JVVW53ZGs5Uk9WcW05aTlt?=
 =?utf-8?B?eWUveXgwOTMyTWwyeFljRHFYSkJadlpIN2Y1K2FUQXVUdlpTYWhjaXdCU05R?=
 =?utf-8?B?VEtpd1pkQjNlQ3NINFlSbHhVamc4VFVrakJmY0JkS2dpTit2dlhKczRIUlBQ?=
 =?utf-8?B?djFabVo2aWVnRXU0VUd0WXROUm9SZGZBRHc5SXlrSmQrVXAwYjYxT29WT3lr?=
 =?utf-8?B?Tkh0VVFyOWh4Q1FqVzhjN2tDcTI1R21MdTY4bVQ0VG0rUlJKOGxuYzR2ZENn?=
 =?utf-8?B?TXlaSUFqem5aeXJWYTAwdzl0YlVxMDdkbkJyZExJTWR4Z3VPbTVpZThFVXJC?=
 =?utf-8?B?QVJTZmJvVGFXZlBLdEFYaUNWYytKeUYvTGFRYk5iU00vVCt5elBFNEZhKzFl?=
 =?utf-8?B?bGpZTkZGU0h6cGRLbEVDNU1lNEg4V3BYbENucXBqZHdRSkpFcFgxVkFFNVp5?=
 =?utf-8?B?RFA5U3hKNTFYZHQwN05OTjR3Tm5mRm41ZlZWaEQ4Znk4YWwwbmFzUFFQWVVK?=
 =?utf-8?B?R2p5a01RZk9xTzQ0andWR1NFQ2UwWUxFYWFNb3p3ZXhwNGp0UjFMd2tDUXVC?=
 =?utf-8?B?a0t2L2wrc1pCdGc5Q2w2ekJBQzFmSW1hTUxLSGh1Z2tuNkNCRG5jUWlRUHEv?=
 =?utf-8?B?L0VDN21ST2xaT0dna1QzYXp2bEQrRnVFakFhVFBCYXBFUTdtMzc2YlVudTkz?=
 =?utf-8?B?UjRtRGY2MXBzRWowcmJCcU9BczdYVWJhbHJIcVhONVhsM2ZHWEl6eTBBRVdl?=
 =?utf-8?B?cHFsZU5VRmdYTDZsYjBYVFJtempoZktFMElXT0JOcnBlQ0NVL2ZDRHJTRDZp?=
 =?utf-8?B?amtvM3NoZEY1dVZVMktEWHNBZjVGNTE5cnNod1lhSm9PM0JtMmpHZ1h3eGdF?=
 =?utf-8?B?ZzNtQjZWVFhMOGlXL0FrdWpZVnlNdkNCTlgvVlRPNDEwM2UwODRFdkFWaUw2?=
 =?utf-8?B?aUFXTCtQNUJoT0NrYWZ5WXZyVEVhNC83WGxkTHIwKzhGMGJPZEVJNW1VNS9u?=
 =?utf-8?B?S0UrUGprR0MvWk45ckhSZk5lQWtxMzlhQUFxK3RJOEU0UG5SQlZhcmFMaW1k?=
 =?utf-8?B?NXIzTnkxSkg4RG5rQ3A2SVJua3YyUzZCc1hGTHNQRG5sL0NQK3VWbGRzNzAr?=
 =?utf-8?Q?rUAJ/x6zefw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8424.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MVlPYnRCUzdUV28vUjdja3FlVHBycU0yeFJNdzdsQmhlZG9HMjFhNkZFaGhO?=
 =?utf-8?B?cFVEMWVOYVlDbEFYM3FuV1VLQlZNQllZSEgvTXgwV1V3dXJHSWdablg0Ymdh?=
 =?utf-8?B?ZlJ3K2F4dGIwaEVJTFFnOHVZUjdBeEtNNXU2dUVPUlFaRzVuK1c5L2h1VURN?=
 =?utf-8?B?MHBrVDJxZE5UQTFWQ3VHdVFwSGFwSjJaZUh5RmNTajh3NXArSlZhU2hETHFU?=
 =?utf-8?B?ZUpDclAwQVczRmg4aG0ycnFZSGl2bkh2T3lGQk1WLzRIM1dGNXFTYW5wTmhM?=
 =?utf-8?B?dnhud0hVQmsxek1sRVJIREliUXZicHcxYmVsRWlnUVo3T2xSQVZhdWdDTlhQ?=
 =?utf-8?B?T3MzWU1RNitrYmJ3OEtwVlhidjA3LytkWVNUZkhXSjJrNk96aFRpZDRsNEhn?=
 =?utf-8?B?MFFxSEtFWVNrbjNoOXdFQnUzWEhSTUlzUy9vUzErOVlTVDRXd3hZTnI1RmlN?=
 =?utf-8?B?Z2tqVDBrcFJ1WFdNNURwQnpPSTBDN0xERXpoUm5jaXhyUloxNVQ0aDBIWDBq?=
 =?utf-8?B?OTZ0K1QwYXRqQy9QY0ZlbnBneWgzUGdtdldWWHdEY0IvTi9jVGNnSzBOMjV0?=
 =?utf-8?B?aHlHUHNvQ1ZrOHU0UEMzVHNTdUtpSU5jY1BHcStpYXZUUm9mMEowSG9vNDBs?=
 =?utf-8?B?bHJGYXpOWUNKWnFFSmt0cDRLOUZpY2RabXpZMkpscENxa1V4SWM4S3dBZDJo?=
 =?utf-8?B?N21TdDFrTjEvOENkcU1jMGNqTXp0N21PeUJuZnlOd1NkNUxYaS9QNDY0ampz?=
 =?utf-8?B?eDVteVJnWnhWZ3EvekppMmdwblRNVjRiamNxN2FBZ3lkc2p1Ni9jajNYYUdT?=
 =?utf-8?B?VUduRTlJRnFIT3pJTUdzSFRrTVFzMGd2VHk1UHlBMzRtUmwzU05jazUwQVlB?=
 =?utf-8?B?SmFnenRhS09GZ2ZYUGNEN0ltcE9HZlZoMnVsL3JtWlhrNS9sWVNIc2xQMzhS?=
 =?utf-8?B?cllWRFJLT2hmajFoUDJUM1M3aUcrUDFYQlZpNkJPd2F1WnhjY2F4WVdLT0VV?=
 =?utf-8?B?MFo3SDlkdDh0bi9DaEVROVRlZnA0ZjJTcitJY2ZPNWxBR3RXSkZSblEzZzVF?=
 =?utf-8?B?WWJxVVBiZHRhSkRHbkYyZTh2VUdWbGJCbTcvS3lUYmxET2dRMmJTeDFuc2lh?=
 =?utf-8?B?c1dlNkdOVkhQWGhYalVQeWhBTXFCRysyT0ZoOG5obGd6d0N5bmkwZkxDWEo4?=
 =?utf-8?B?T0U0d3JiM2Zza005YkZuZnl5NElGWno2NTlET0xXS0NHYUxkd0VPeTh0azlp?=
 =?utf-8?B?YVVyUlZrRVAzS0VaK0FnVnlybGphd0Q4blpxdW1na3JPMmdCQ2lDMUdHMGF6?=
 =?utf-8?B?azlCVWljUTJFM1l4MmNUZnN6Ry9TNW41emUwM3M3TmhoOTVJMnBHME5hZ0tv?=
 =?utf-8?B?TnFuMm0wM2hLVzE1WXBpZnRiK3BxN0dwVkdyM3NrZEdHQWFDZFUyaTBLWGFC?=
 =?utf-8?B?UWt0YlJOZGkxUXF0SU9KSTVGK3ZTN1l6Z2c1dWMvNDZkNWx1UU9QVWtoWnUw?=
 =?utf-8?B?WGM1Y1ZyTSs2b3U3aFIwVVVNYW0wam1rL1B6eEZ1VjN2ZEVVUGZrQlg4TjF4?=
 =?utf-8?B?TFc5L0tzZHF1OUNrNEordHFJRzlDRTBNSHFkZGhUWDl0RlAvMGNrelg5Unln?=
 =?utf-8?B?d1pGZ3ZiZFEwbHpQeWhnYzJrMlRtbnZTb1hic1hOOFMvSG54Zkp1RjBXemlT?=
 =?utf-8?B?eHltNlJkVituUVNiODZwSTA0VkhjRW1mamZQSVBPVWVyeS8vNVVodkMxWEpn?=
 =?utf-8?B?bERKcVBLREw2Z0VXZXgwVVFzZExrM1BXUjBDc0dic3hNbUhOUjYvd0hHZWxP?=
 =?utf-8?B?ZXhhN25EdmtHd3N2VHFZZUtHbGE0Q0Y3WXZrZno1L1BiTTJNWUYrNFJ2SnVG?=
 =?utf-8?B?K0YzeDNORXBrUVlqaWV2c0N5Rkw0eCtPMUZIcjJqY1pGVzhQRkQ2RC90ME5Q?=
 =?utf-8?B?eHpvbUt5b0x4cEsyZ1ZHZVNaNzJXblVGS05pRVcyeE5zWVArNXJ1UVhPbGUz?=
 =?utf-8?B?Z0xWcG4raTNWd0I1c0dHamJtMTJWV1V3ZDlRRmZUdlFZcy9kUVdobVFiU0o4?=
 =?utf-8?B?TDV1M0xFaUF3SWcxN2lpMytTU2pDZkdKbjZQY091ejJPaFpQbWdVWERoQ2xj?=
 =?utf-8?Q?6uRs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a20a7ab3-e17c-4fa0-1605-08dd60342e8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2025 00:32:19.1861
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e7hVxLiSrPn5ExZl8uHGLHYwgwwTX7IaNKbXtX/C3BdUHe/W3bjfOioULOVxfWQscMYQxszH5jv6QAXF897tFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5832
X-OriginatorOrg: intel.com

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWFyayBCcm93biA8YnJv
b25pZUBrZXJuZWwub3JnPg0KPiBTZW50OiBNb25kYXksIE1hcmNoIDEwLCAyMDI1IDExOjE4IFBN
DQo+IFRvOiBCYXJkIExpYW8gPHl1bmctY2h1YW4ubGlhb0BsaW51eC5pbnRlbC5jb20+DQo+IENj
OiB0aXdhaUBzdXNlLmRlOyBsaW51eC1zb3VuZEB2Z2VyLmtlcm5lbC5vcmc7IHBpZXJyZS1sb3Vp
cy5ib3NzYXJ0QGxpbnV4LmRldjsNCj4gTGlhbywgQmFyZCA8YmFyZC5saWFvQGludGVsLmNvbT4N
Cj4gU3ViamVjdDogUmU6IFtQQVRDSF0gQVNvQzogSW50ZWw6IHNvYy1hY3BpLWludGVsLXB0bC1t
YXRjaDogQWRkIGNzNDJsNDMgc3VwcG9ydA0KPiANCj4gT24gTW9uLCBNYXIgMTAsIDIwMjUgYXQg
MDQ6MDc6MTJQTSArMDgwMCwgQmFyZCBMaWFvIHdyb3RlOg0KPiA+IEZyb206IE5hdmVlbiBNYW5v
aGFyIDxuYXZlZW4ubUBpbnRlbC5jb20+DQo+ID4NCj4gPiBQYXRjaCBhZGRzIGRyaXZlciBkYXRh
ICYgbWF0Y2ggdGFibGUgZm9yIGNzNDJsNDMNCj4gPiBtdWx0aS1mdW5jdGlvbiBjb2RlYyBvbiBQ
VEwtUlZQIGF0IHNkdyBsaW5rMy4NCj4gDQo+IFRoaXMgYnJlYWtzIHRoZSBidWlsZDoNCg0KU29y
cnkgYWJvdXQgdGhhdC4gRml4ZWQgaW4gdjIuDQoNCj4gDQo+IGJ1aWxkL3N0YWdlL2xpbnV4L3Nv
dW5kL3NvYy9pbnRlbC9jb21tb24vc29jLWFjcGktaW50ZWwtcHRsLW1hdGNoLmM6NTgzOjE4Og0K
PiBlcnINCj4gb3I6IOKAmHN0cnVjdCBzbmRfc29jX2FjcGlfbWFjaOKAmSBoYXMgbm8gbWVtYmVy
IG5hbWVkIOKAmGdldF9mdW5jdGlvbl90cGxnX2ZpbGVz4oCZDQo+ICAgNTgzIHwgICAgICAgICAg
ICAgICAgIC5nZXRfZnVuY3Rpb25fdHBsZ19maWxlcyA9IHNvZl9zZHdfZ2V0X3RwbGdfZmlsZXMs
DQo+ICAgICAgIHwgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fg0KPiAv
YnVpbGQvc3RhZ2UvbGludXgvc291bmQvc29jL2ludGVsL2NvbW1vbi9zb2MtYWNwaS1pbnRlbC1w
dGwtbWF0Y2guYzo1ODM6NDQ6DQo+IGVycg0KPiBvcjog4oCYc29mX3Nkd19nZXRfdHBsZ19maWxl
c+KAmSB1bmRlY2xhcmVkIGhlcmUgKG5vdCBpbiBhIGZ1bmN0aW9uKQ0KPiAgIDU4MyB8ICAgICAg
ICAgICAgICAgICAuZ2V0X2Z1bmN0aW9uX3RwbGdfZmlsZXMgPSBzb2Zfc2R3X2dldF90cGxnX2Zp
bGVzLA0KPiAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+DQo=
