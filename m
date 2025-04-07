Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C948820F087
	for <linux-sound@vger.kernel.org>; Mon,  7 Apr 2025 10:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744020965; cv=fail; b=AmLW+vSZtqDldof01YHQkIPjDR4qSSaL8OsPfL/Y+lSXtveBgINR9qtT+b4DP4xoFm3c7X62ITm6R2yHE5xueWyvuRCtYPHu2RidHEuJHN6j8is4pJtR+clxRGc93I+PaioLp61LHS31nW/zXIOW6dz4pbhG5mHytNgG6xdJbVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744020965; c=relaxed/simple;
	bh=i+CVYsdelGX0sVDkdzjJbfSTJFIekQR8xLefGeW2eJo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=INPF6O6Z/nRP6H5zRqkqt8GJq8a8nCh+8SP/1thR3mBL+TXhactMNpUnA7fkpSCOx05snkZ2b18CghkMoQokvP72Bqe5UqLk2E9nOxNhQANyxfjzEZ6Eab3MNeNvZ1eusNc9ApzfG8MwotgKLR+dldgFCybWC4mg1GjVfT73ljw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kix7WWWh; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kix7WWWh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744020963; x=1775556963;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=i+CVYsdelGX0sVDkdzjJbfSTJFIekQR8xLefGeW2eJo=;
  b=kix7WWWhmpnz2V1SbFGz9MgzX8MBwlLl+oQLxtz6a6serTbcYMh1ElsZ
   +65qMRAMM2ndppu6bIDfp1/8BiARth0XcBqkkb0rGi3etdI8vkZ+sQfws
   a5Y9cnFI1jOJD+YuggW9m9NPklDRbK0PmcrWT0cVfAplHU4E0fDqQ1cKG
   aXYx3EzGZMKDjsuN9/KS65f6zzeEDc0hQJaz8Epqf8pD+LOd/SrpWHEnQ
   b1bKJiwbUl4lG6HgmUaOhfiE67VLSuiqlJVFBsR8ESFQHfdj0pejWRn3T
   j7QYHEbtmP/C4IEbV1HYZiroYm3+kDK381yyHoZhaKbVndFsCbfaVGXg2
   Q==;
X-CSE-ConnectionGUID: IOq8ZE/wSaaxZjb7CdjV/w==
X-CSE-MsgGUID: zLObRzR9R8CNuMgRmI6aNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="45286998"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="45286998"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 03:16:01 -0700
X-CSE-ConnectionGUID: Ga2SzmXxRQaIqB/F9UyTIA==
X-CSE-MsgGUID: 1Bl6WAi8TmmSPUtKN3wFrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="128237404"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 03:16:01 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 7 Apr 2025 03:16:01 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 7 Apr 2025 03:16:01 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 7 Apr 2025 03:16:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I8xv9+8Z/cHRQgDZdfH+bPA+iudBHKQ4QwlJrN68WctbvILYlRtZH6FMIKgzWbx4/Oe83pBETpJS2LXo4HCyes17RrJukqq6s2DUDO0w3BkPEpCUNDXzR4LALNysxZgmX6F1Xb3KZHTMI98l27f6QtbVtqiIRK7xVkkqwp3SI8bXnXAvxCmxvzfueqZ8o6AsvlmVnKm15qbCSCAjfezAOGFB5Fgd0rrIEQPO+VoguPV+TEVmYJ0x42wCxsDgucNaqtrDF/7vXCJP1XfTCiM9pYzfZXPB4N3duuCWlMF/r+USDxl+6L6q8pLdqgUfp3VGYHr9O9NKl8WP7Fx6OgTbKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i+CVYsdelGX0sVDkdzjJbfSTJFIekQR8xLefGeW2eJo=;
 b=DUp9IJDx8Fy0jgRrE884UrBsbDH+4athXQtKpbI/dhSKecNxANQK+TYss8MxteUMEDzNmuVJf5xwMpW7+ASfLdeaHsxWWGDniX1r3TdCZ1tS9e88FeULtir0oyH3lp03bSiDMTHFTGIG+IxU6rslgLbhCuuXUwcxoAOM8LqpyXs2fT55jCfBynBHLxzBFgXqNTYGvWS7ynemX6OXPilepYJcfpKpDonV5rHssPCp69U1rxiYZycmPP0INLh/4DY5iBXT6tvXBuu5lIRNgQTvVSfkVZD/wuP9+qLoYuWJnxVeSTc+nvo2HxtLjY8+hkxe9dKe2SNdngTgCmq8O9AdqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB5792.namprd11.prod.outlook.com (2603:10b6:a03:425::9)
 by PH8PR11MB8037.namprd11.prod.outlook.com (2603:10b6:510:25d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.32; Mon, 7 Apr
 2025 10:15:58 +0000
Received: from SJ0PR11MB5792.namprd11.prod.outlook.com
 ([fe80::2e4c:49ee:6f37:d200]) by SJ0PR11MB5792.namprd11.prod.outlook.com
 ([fe80::2e4c:49ee:6f37:d200%4]) with mapi id 15.20.8606.033; Mon, 7 Apr 2025
 10:15:58 +0000
From: "Girdwood, Liam R" <liam.r.girdwood@intel.com>
To: "Rojewski, Cezary" <cezary.rojewski@intel.com>
CC: "hdegoede@redhat.com" <hdegoede@redhat.com>, "broonie@kernel.org"
	<broonie@kernel.org>, "perex@perex.cz" <perex@perex.cz>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"amadeuszx.slawinski@linux.intel.com" <amadeuszx.slawinski@linux.intel.com>,
	"tiwai@suse.com" <tiwai@suse.com>
Subject: Re: [PATCH 00/12] ASoC: Intel: avs: Add support for MTL-FCL platforms
Thread-Topic: [PATCH 00/12] ASoC: Intel: avs: Add support for MTL-FCL
 platforms
Thread-Index: AQHbpV/FHTEbCMdxQUKL9OqqNoE6irOTdgIAgAAE54CAAAVDgIAEXIKAgAAZugCAAAKAgIAACG8A
Date: Mon, 7 Apr 2025 10:15:58 +0000
Message-ID: <c969bc5ed36730c12ae9e82f024bbbd43dfacc68.camel@intel.com>
References: <20250404094953.3657679-1-cezary.rojewski@intel.com>
	 <ce71ea6903d05c3b5312c9f534d83478e488729e.camel@intel.com>
	 <abe40ed3-49fd-49d2-bb5f-42481898ecd4@intel.com>
	 <b8fa998839daa544acf868e6260fce59f863cf5d.camel@intel.com>
	 <01eecf3e-36a5-430b-8e2b-ef53edbcf703@intel.com>
	 <0793b635e75ddffb3ebef1bc773f90b3be16b6fb.camel@intel.com>
	 <4177c8ce-41af-4264-b4e5-550d2a6fb785@intel.com>
In-Reply-To: <4177c8ce-41af-4264-b4e5-550d2a6fb785@intel.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.54.2-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5792:EE_|PH8PR11MB8037:EE_
x-ms-office365-filtering-correlation-id: 6c21a6ce-6343-4f15-e853-08dd75bd30dc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?bkhCKzVFQ2xIMFdVV0p1dEJPQm9tVGxqTEpSUW1yQ3V4OXJPbWR2UnVrM1hn?=
 =?utf-8?B?Rm9jYnNIanFWMDF0SnZmWVY1c0RKeHdxc1FVWjgyVHl3dWhTTzBiRUh4NnhI?=
 =?utf-8?B?a1FVY0tJRzczNWFyK01UWFVJYjFIQVNySU1zb1pGcmZoU1dYRTkxbk9pNmUr?=
 =?utf-8?B?dXdPekRFaGNmVnVXTnExTmI5TUxOdng2M21hQnNGem1FOE1NclZXQTFWMy9x?=
 =?utf-8?B?dnd1U0V2TmFVdXZOaDZ1T1NubU5GNlR6YVU3V3pGYVhPQUdCWHlqeXg5ckR1?=
 =?utf-8?B?cDRXOE1sOW43cjFNL2czV1pGOFFQZ0REVXZaK09La2NrTnRYQzVqU3RvaENw?=
 =?utf-8?B?TFRneWRoYWFDcXJJYTZ0WXhmOHMzdEhtYlgxSHN4Z2krYzNJcmZtcU1tN2FP?=
 =?utf-8?B?cityYWNDYlExQmJBMEowTWFJRzZwenRrWmd0MlE2ZjBrMXNxM0dMVU1zQU9q?=
 =?utf-8?B?RUJ3bE02cUs0aG12RktoVTlYWG9YR1hSN1dHZlNiTEJHV25QN2ZYR2R0SUlv?=
 =?utf-8?B?RGhaTW5ZcElPMHZsWFgrRlVEZS9oWG1wN1ZJSC9BanZ6Mlc2Q2Vza1ZvblNi?=
 =?utf-8?B?MEltNmNLUm9OaGxrU2pJUUt6MEY4dEJEMktJZGI5TVQ4Q3hCVm1LUDc5WlM1?=
 =?utf-8?B?Z2RzN0NxRnpKdWdNNVgzZk8xZVlQMy9uOW1NVDhRTnRMMjIvY3ZORkMyMEJ4?=
 =?utf-8?B?clhqY3lWUVJxS3JqelVpeDZwMDRpZEFTOGlMcEl1SnhWNExRZEdiT09aVmRs?=
 =?utf-8?B?YkRUYTQxbndNMlpIN2U5YkpEaGQ4VFBoajgxOXQ4U1hyb005WExCekRHMEhz?=
 =?utf-8?B?UWhkZmhEbzV2ckZvbDFUZ0hvNjJkQ2xRUXM2cXVoZHhVN0tQbDJZNVRtS3pN?=
 =?utf-8?B?dUxNemRKY3ZPb3cybG51KzBTWkVIc3lqdWFncmN6bGowUGk4WDhBRjN2QTBI?=
 =?utf-8?B?TVVVeWJpSEFaNnFlUjA2NnU5bjArZnJCVEtqbllrMXNJazV0SFFZd3dnYlZo?=
 =?utf-8?B?cGNkZGVQUnI4TDVDZmh6bGpwRStWYjRtLy9vRWJOL2hqQ0c1M2hZL0svV3Qv?=
 =?utf-8?B?SlE4enU3V2Raek8zOTdwL1ZvT29IMlNLbE81bWFTNkcvNS9MRVVVYnBqTWZs?=
 =?utf-8?B?NHhNMlVTWGVYTHNKdnM3OHZ1eVkzN291OSt4TXlmU2x5ZkRicFkxeStHOWlO?=
 =?utf-8?B?NGJ2VFB6ZS9WMVZpVmJvYjJodktsdzEzK3dhUkRSaGJFdG11WkpmSGgxVktJ?=
 =?utf-8?B?Y0ZYcVVJZHYyRGh5SHRtUStUSUpXWnJ0MEJMSGxINHBFZ0FvdWJJcDdpelgx?=
 =?utf-8?B?cWZYS3h2R0JzSEFyTkg0NHREdTM3TWJBdE1sQTkyYVVtbTJvM3AwVnpyclBl?=
 =?utf-8?B?dXFiMjZMc0hOQTErekpnT2pPdTYyZVBBcHhka2FZeEN4QVAzZyt6UE5SbUFF?=
 =?utf-8?B?VmlGYVZib0h3aEl0WmlVNHdKTmsrSDBWMjVlS0FlZHJnVlkyeVBVa08zT2Mz?=
 =?utf-8?B?dmczcFJUUnhadUJ0aW5ISHZWdGJ6VStINXdseCtZWjBnVlNwbmQzOXc0RFBi?=
 =?utf-8?B?L1NtbllBZzFUWTFQOHdaeDVFRmh2Rkp3TC9QZ0pNK0g5dm1ndm1qU2d2R0tC?=
 =?utf-8?B?bmxCc1I0bGEzeG5yWUpzbXNUZWlTd0xqd3ZyNkNqaU41dHlBUUtXeEIzN2Z2?=
 =?utf-8?B?MzRPWFprTk9Fd3dZYUU5NGlCZ2U0Y0ZGQ1ZxUmI5U2ZUejk0dHVCYjM5eXhj?=
 =?utf-8?B?OTlqTTR0Z2FkMExaOENGZGVHVU9BeGtYTlVrMjRpWkhmOVJERDMwb1prV01I?=
 =?utf-8?B?OFZnR2tYOU5XMFdPRTBNZHRuVEFrZm1ad3M1ZXJnZE1TWW9YOWlXSzgvQVAr?=
 =?utf-8?B?SVROcSsrTnN2a3pFV255RHdlbHZPYVJpdmRqbm12MktLWlIvMXZnVjNyOHF3?=
 =?utf-8?B?RTJFMk0yckNYbVJNbGozOW51YWpTY0VCRXUyT05iVVVJUFRYWFRDekgwV0FM?=
 =?utf-8?B?R0JLQ0N3TFh3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5792.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VjdXNGVuVWhYY3BleE9zVVlJV0lPWlh1bGt1RTEzZE94M3MyTlF1TmRrRy90?=
 =?utf-8?B?WkpXaEk1SXNwTVQ5WGlCM0pNcVQ3UHRob1Z3QVNFRmJXMitkbThGbXN6YjFE?=
 =?utf-8?B?c3ZycmV1a0x2aUlWQzlrVzYwS2RKSzJhT0xEaEF5TGhNaVM2akFMd0MrVWpO?=
 =?utf-8?B?N0UvQUovamJMTkg4UjFaTGRxVmRhS3lpaEw0a202V3VFSytXekZhSHptbCtn?=
 =?utf-8?B?NGZMeTBnQ05MNlZpYW9XM2FrMUdHOXlUS2d6VUpsR3EvcTBTZHA4YTdkZzFq?=
 =?utf-8?B?OXcrYVV5STZDeVlOWFpJaWhQZVNodWJYaTFGSk8zcFY5WTlQdU16anI2TVpo?=
 =?utf-8?B?TlBhT0lCMFRTckUzRGViSFJHcVgwendhWEhFcDNMRnlleG9zaDZ1SlpqVVZJ?=
 =?utf-8?B?OEljdTZyY0x2UWVCYWlGazZHc3VsS21KYUxRSy93SW9waFlZN1FYZTAzN3Rm?=
 =?utf-8?B?SzNUMDFZTjAzZzNUeG4veThncWM1cFdkTmd3VEhtMitYR2M1SWVIbDF6cEhS?=
 =?utf-8?B?Nm9jWFg0N2tQUmRoNnZBT0tWT08vU2RndG4yYStUNGNkQmtJNVd0R0hwcVly?=
 =?utf-8?B?dytITmJnbWtuendtK1NKTi9qSlJUdEg2K1h4Zmc2UVFLelZ1cGk0S2lEY2pF?=
 =?utf-8?B?Uk9udjBEenJlcjFmY1BjUHEzZ2JOaFZkV1YxMGQ4eStLSEtDT1pnT1NZclNJ?=
 =?utf-8?B?VWlKZXBCaXpXZ3NVTk9aSTRLM2tJTXpia3FrMWV2QmlhUVVGVjhkcTlzb0dy?=
 =?utf-8?B?V29aN1VBVWRjWVJaWGhCNHlBUjFJQXZDUkNrNDIvUk56eGR0R3cvRTI3bmxk?=
 =?utf-8?B?WHVKZy84Q0lsZFgyQzlNY0JjV1VDblBDc3hLcmlhU1hyQWFhMmxWRXJVTkVi?=
 =?utf-8?B?Mk1rd24zekgwMUJwSWk0Y0hBRUlXdGhuaUNCcXBGRSswd1JUcWlseWZ1Y2t5?=
 =?utf-8?B?c1JHb3VxNDkvSTRuN3pSK3pxamtranpZb3I0c3h4WUFyUGVaUVptalE0emJR?=
 =?utf-8?B?dmsrbU5jdUduYlQvblN5WE9HallYcTYyWXUvZ1lkaVBVc0dEZzVyU3gwZDUz?=
 =?utf-8?B?bmwzYVhBOTFZdUMvcGRZNjcwZDRSRjZOaDdTVDNaWnBWekFEYVJFUFR3YWp1?=
 =?utf-8?B?UTFBU0F2NXpsN0F3SjBGS2tyNlZkNFA0TitHa2x5S2pRditRaGdMd1NIU2hO?=
 =?utf-8?B?eUtWNCtSVWJqZXV1dHpKbmNKSTF0SnlhYTV0d1R1WWtuejBaOHJpeEVwQTAx?=
 =?utf-8?B?bnVOY2ZwWkk5NU83MDBqNG84dFVTM0FrOHp3b3Eyelk0d1NwN2JJWVRCcUZQ?=
 =?utf-8?B?dWQ2bzVubUxXQ1MvREhTV1Q2YjEvNmlZNnYxUlpRQjliMkQ5NUNBdGlzSmhJ?=
 =?utf-8?B?eHhLcnRQam41SkhuQk5ZcStpS0RVZHhvUjltTzY3T2FLK3dnU0VhRm5ZWWVj?=
 =?utf-8?B?dTV4MDhGb2lMWjZUSEdxRVd0OE9vR0VTWkNES2czaXcxUUpSaXpqV0MyZllt?=
 =?utf-8?B?Y1MrV2poQ2tZb3JaUUpmMVRiOGR2T1l2eld4Y1hlR3FJMkNOb2V5UXVyY2ZK?=
 =?utf-8?B?R05EeGg5dDBZWDUrKzVXMXIxV0Z6cFZ5TXhSUlpsRjQvYU84MlgwcjNHMmFz?=
 =?utf-8?B?Q1h0R2FwRFFXcjliZDZCbHdiWm1iQVN3djczanRTZy8vRVRiMFFQdy9lVXAv?=
 =?utf-8?B?UmkxUi9rajdjYnR6UE10Y29kWWN4TXREcWpUT1JraVRuZk5Lby9hQ3IxY1hE?=
 =?utf-8?B?K3VIaXlXS3ZPWkpMTlNrakd0ZWFqZHlSQkJVYXJhbzFZTVQxZzNDUFR1NUM4?=
 =?utf-8?B?R3pyK3NHSVFTbnZKeWh2RE1mUTlMQ05OVkR0SU5UdzNHN3R2Vzl6REJZdFo2?=
 =?utf-8?B?VUU2bG15LzlFQzdMTnFwZ0NITlJmN0xkZ3pFeGMrOUc1WXFkQlNUYnEzRHBv?=
 =?utf-8?B?aUN2bXZLbWxhVi9lNE9YNnJCd2Y2WlE2dCsxSDVrRlJlZUlGVjBqUTNzUjFl?=
 =?utf-8?B?TWQycTc5dzBFRFhURkhGWFJiamdVQi9iUUJTcTQxQkZGaXFXN1dkaE5paXk1?=
 =?utf-8?B?dDFad2M3NVZxaThJQlBTQ0pWSGtiUG1OeWd0ZFJSajhENmI3ajdaY2I2UEFD?=
 =?utf-8?B?dVFpS3Jyc2pBL2gwSm9taHYxdWgzTEs3YVROcDJ5elJ4MFZPSUo2MVA5R2tj?=
 =?utf-8?B?OUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0A15C4B1F010194C86AD425FA1EF9140@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c21a6ce-6343-4f15-e853-08dd75bd30dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2025 10:15:58.5233
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q2BMwANfVQNt2UBPOTSv//SUmW1VgFJFa3tc3mom2sEnS2kYccDbUPsvNK97JxwQoQ4gxQqe28epZhr01YZEseB4V1vRIunijxlHGYNEcvU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8037
X-OriginatorOrg: intel.com

T24gTW9uLCAyMDI1LTA0LTA3IGF0IDExOjQ1ICswMjAwLCBDZXphcnkgUm9qZXdza2kgd3JvdGU6
DQo+IEkgY2FuIDMgY29tbWl0cyBhZGRpbmcgbXRsLmMsIGxubC5jIGFuZCBwdGwuYyBpbnRvIGEg
c2luZ2xlIGNvbW1pdCwNCj4gZHJvcCANCj4gdGhlIHBjaV9pZHMgYW5kIHRoZWlyIGNvbnRleHRz
IHNvIGl0IGFsaWducyB3aXRoIHlvdXIgY29tbWVudCBhYm91dCANCj4gbGVhdmluZyBvdXQgdGhl
IGNvbmZ1c2lvbi4gRG9lcyB0aGF0IHN1ZmZpY2U/DQoNClllcy4gDQoNClRoYW5rcw0KDQpMaWFt
DQo=
