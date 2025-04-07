Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75F53C0B
	for <linux-sound@vger.kernel.org>; Mon,  7 Apr 2025 09:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744018629; cv=fail; b=O+CS1KkSmEsUbM+cbDNTtN2DHfj/9PKOO+BbmU0/aWjp1oQo5f2YduJoc7X0UH/NxvQ+qK/JFVaY8XNocE16SVNt0qzxHU9n7vHQF4foJg87Vi4gDvpfCOPWgY9JizFFM7av1B3oGk3YcyzWQhNnlWc9M8O96623ue/mIJpNTYs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744018629; c=relaxed/simple;
	bh=kZRwhZYIuU4K+eDbZRwq0mlSFWI1r8iyJCgtWhpHwWk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tl5YgvwqUpNWKKXrIzSiDp1FVZaywEMUIXjlps3obORDMKunxqi5ZgX0b/OPe5RV+e1uLGqfrSfM9KC0xPuhdBQwkDeDDpRksW/7rKdJdFjCxgZPJ64EjDzuwLn9xg9iZwx+6Trza1x1oFOJSJ24SwMt2QqEOoitcysUn0+KkKw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OD7Lde2W; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OD7Lde2W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744018628; x=1775554628;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=kZRwhZYIuU4K+eDbZRwq0mlSFWI1r8iyJCgtWhpHwWk=;
  b=OD7Lde2WsOw1yLPx3ohYCGBqRzRvChUaNY72bYztPCz9NraX1yF/Hne2
   V0l2ewH4iAGP4648vI2a0e9V1Qo5ZE4ZsX+JO5h1rVx/L/G476ZZC4aDu
   phLV69L/H8fjLfNW8s5c6tjxn4LcLO8cGudjEYOJnTJAglIYaL7IQd1EL
   AR5piXIaO4+9ADhR9ntMsVGUtxC9upIlNrPT6++96o2yHyUjTm5JpwKfn
   NQplYY+JNTLWG46sbB1iwUPfCmX7mkxVaE7TFbsyb6Od4YBlGOyc92ka0
   UusSxbeQ1p2HhCa9UrESrLYtLFnyAqL8ugd5+5EJTCNF6N3hmdBBqFfMz
   Q==;
X-CSE-ConnectionGUID: HRR5cyPPScuxbFxX4gtlHw==
X-CSE-MsgGUID: MKZxEBFnSNOiIp6rTT6JSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="56756679"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="56756679"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 02:37:07 -0700
X-CSE-ConnectionGUID: 5KJnLc5WQLCX7H/2k51tqA==
X-CSE-MsgGUID: KBFahcY/SymxA091+chWtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="127657022"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 02:37:07 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Mon, 7 Apr 2025 02:37:06 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 7 Apr 2025 02:37:06 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 7 Apr 2025 02:37:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d3PUyOk1an/vxHPbUcfJy7ByN8agzeUF1b5mjdBnzZi5Ez4g/Oyp30aLDyUCqQMB7ZvWmcZfakC6pdKX/welrSYxjDKbqTKQ2+DA/9ipV6yvSCvxyu8ynvlCDqT8vfXd1/RdsNCEB3FDvaatGiJ3dDUQbSV/LdcQSLBOG4IKMm2Bb37s3n7xcK3U7TZEUW5Zt9710cUNwCqvL1IDhf935nlvPWrB6wmx3YnbIRewMnqLjjz4oSdsansx+OOkU87GZdnRm4tx6g9cKdfSncZt+5LFpZHOVmCeLPAxcIXPcksnlgs7dxPVBjh/hHeQoYxQyR13b5b+zJL8PRvhwOo6QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kZRwhZYIuU4K+eDbZRwq0mlSFWI1r8iyJCgtWhpHwWk=;
 b=nT7hmyk1LQ4GCKdeWAfTQfKfSk7tAqndVi93IH/3cxP8TAEXAuHnoWXpBglONKk5VYMww9ALbsXn8xsqhRn2QyPnWXlwvMDk0yBPmeRN6czKYDODZMWtJYmS/WmGcrSFmqxj3Olovhj45DaV7KWo/xVos2J3zMpR6M2F05s0+I5LsYwWm8gAEITld/6fweMxHI2DWga5i+Ch4AsMjJuaajgC1SqBpdFVAgsdmotaYPZjhil4BbeJz2kx3pg/bRFINxDLJKOjXThPELnkNBro8moW+TS22RB/fuVKd6LvD6brW/2y13cjfGZoblB9GL9MTeLYy0q8MOwVg8EHWw3uRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB5792.namprd11.prod.outlook.com (2603:10b6:a03:425::9)
 by SJ5PPF6806D69E4.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::831) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Mon, 7 Apr
 2025 09:36:50 +0000
Received: from SJ0PR11MB5792.namprd11.prod.outlook.com
 ([fe80::2e4c:49ee:6f37:d200]) by SJ0PR11MB5792.namprd11.prod.outlook.com
 ([fe80::2e4c:49ee:6f37:d200%4]) with mapi id 15.20.8606.033; Mon, 7 Apr 2025
 09:36:50 +0000
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
Thread-Index: AQHbpV/FHTEbCMdxQUKL9OqqNoE6irOTdgIAgAAE54CAAAVDgIAEXIKAgAAZugA=
Date: Mon, 7 Apr 2025 09:36:50 +0000
Message-ID: <0793b635e75ddffb3ebef1bc773f90b3be16b6fb.camel@intel.com>
References: <20250404094953.3657679-1-cezary.rojewski@intel.com>
	 <ce71ea6903d05c3b5312c9f534d83478e488729e.camel@intel.com>
	 <abe40ed3-49fd-49d2-bb5f-42481898ecd4@intel.com>
	 <b8fa998839daa544acf868e6260fce59f863cf5d.camel@intel.com>
	 <01eecf3e-36a5-430b-8e2b-ef53edbcf703@intel.com>
In-Reply-To: <01eecf3e-36a5-430b-8e2b-ef53edbcf703@intel.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.54.2-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5792:EE_|SJ5PPF6806D69E4:EE_
x-ms-office365-filtering-correlation-id: b9c50eb6-83cc-4382-b589-08dd75b7b936
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NmNGU0R5OUlzaGFUWlZqQ1BkVm1hRkJGcHEzRnh3Z2Z3dko3UHZ0dC8wVUgv?=
 =?utf-8?B?VUlTdWZaSFRabE05MWJXcXlzSGdreTNLazcyVXZtNFI2bDNMdjZ5NWMxcndD?=
 =?utf-8?B?MTJUdm1tdUhEUHpYQlg5S0N2WmU4NEhlUkR6NUVhQUpWb2wvU1J6aU9nL21x?=
 =?utf-8?B?SHVJc0NRTEtqOHd6ZEp0UEFFZ1d2UFQrd0VZVm53eDlFSEU1dENjcWdxQXEy?=
 =?utf-8?B?VXRvMDlzWTN3T1NDcmtKU25lL2R5QUlLcllNM05ad3F6NUI3cTh0RFRpVlFw?=
 =?utf-8?B?L1RLZ3ZpUXFBQjZZVnlrRDhtbjJkZTNmUWZLZ3htS1BSL3VJbzNzYU9ueEhp?=
 =?utf-8?B?RkovZzZOUnZXRWRkRitwZXVSWlByWmRqQTVEcVBSTUZvMEJ1NmJ4b0ZIbmhv?=
 =?utf-8?B?SUxDUXJxY25HdTRNWUM1SllkcnV5U2F6a0dUZlEyMEJ1Ulg0aWQ1Q1l5Wlp3?=
 =?utf-8?B?eEhOazZ3akd6NUdMLytkT1BKSTZOOFBGZTdVUnRkZVc2ODd5YXJYOXA2NUpa?=
 =?utf-8?B?UXNmb1FKWG16emFza3NqT3RvS0R2TUZVY0k0T051T29DV0I0bFllM2VHNi9D?=
 =?utf-8?B?NUc1RjB2QU9HQjN0bXN0Z3VsR0VlMVQ0OHRueXJIc2p6RmVtOVYySlpBK2tL?=
 =?utf-8?B?Z3NObDBaSjBUOUdVejFNTnFTdVNyRmZiYVFTb0dwemdQSDRvUkVXakVsNmZz?=
 =?utf-8?B?Y1JObUZ2MkV2VTd1Um9EVHFiMnJKbUp0WUhBS3h3clJ2OU4rNVZ4V0ZQZ210?=
 =?utf-8?B?TUd5eU1mWmhZVEUveklrK3NJM2tHM0RmdURJc0RFcFBneXhXeHRrcGdxbzFR?=
 =?utf-8?B?M2xkK2ZNUmlIbVcvY0RVdFdRTlp4MmM4bUJGajlWQlhCWTFNZkdZZVhoa3Qw?=
 =?utf-8?B?Tmdyd3FFNjZMamY0bEZqeVNXTEM4Tyt6cFBjcG1IQ2NJMVNJV2Z3UEhGUlN3?=
 =?utf-8?B?OVlET3lVcUtqUS9jbHhTOVRId0lxM20rZzh6Z0VkL0txdWVFZ004ejdBVnMw?=
 =?utf-8?B?dG5HWU5telRjWCtaL1RhcEZpRk5zYnhVMFZFRlZrU0RLYWZZZW5zU055UG1p?=
 =?utf-8?B?cjEzMnpndld3QjcyVWoybDQ4ZEpVd0lPR3lEK1ZEU3A1Qlh2Z0xEU3h0Nktq?=
 =?utf-8?B?K1g4MUhiODRjTkF4TTNvYi9vZE16UVVrK0RjUjBESHNnMW5lNjNDdEpZSEpu?=
 =?utf-8?B?T1dHT1pLYjdwVnZWVTRFVWI5TzBrZzYrZlVlTmZUb2xWQktUc016Yng1OXh4?=
 =?utf-8?B?UDNKV3J2cDUyVGxraE1TNkRqamVSbzNFU1ZZOEFBTDNQVXVZUjh5QzdEZHZq?=
 =?utf-8?B?bllWbkpvZDE4RGZUWHJIWWNPbi9PbUdROHUydDZ6RGFuL1FQanFEOWZ0K05D?=
 =?utf-8?B?dTMrK0NUKzM2NTllNTd5SDBNcnhqZmNZTFdjMTNkcUxrcFJTUGZuQjlWRW1W?=
 =?utf-8?B?ZFNsR0dWSGJXOHpvRTJJZW9Fd0l5bllmcmxaR2MxMGJSQVNVRndoTHFPS1Ra?=
 =?utf-8?B?YTFqNVFPaFRiNHZRM1l4Nkt0ZUx6TjluUVlsQmFnNnUvbk1qQk1QSXhuNm9m?=
 =?utf-8?B?cEN4RnNSS2VHOE9kSjhaS29QcWFGaG1YUmNNR2pTWWlnYjRZREJDNDZDc2s1?=
 =?utf-8?B?NG5ob0tNOWNZQlc0aHJyOUNjSHhVbURTMCtKVmVhTzIrUlZhR2x5dG1aT3Uw?=
 =?utf-8?B?MmVNWlhqN05sQ3hVTElVMzJGZDJ6OFVGd0MwbVNrSFdqTjBzUk9oQy9RcG15?=
 =?utf-8?B?QWorVG9Ua2lJRkd4UmpvR0x6cXZubzJLRy9mZHljUWNuYTRVYkNrTU1KMWxu?=
 =?utf-8?B?bktCeStaTG90bG5wMUZhQlhRSit4WWYwYmdrUkJ2WFVHd09QNDUyc3pNdjRI?=
 =?utf-8?B?czBSR3JCeEtkR3luYkNRck1tRmNjYXR2eWsrQUdNcnliNm93Si90UUZpWkIy?=
 =?utf-8?Q?ovfYh4NFW/zdCSGGJBNGIyjEEd/Lpu5d?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5792.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ajZtWi9nYXpIVW45dXMvRU5NOHRRbUI3VEUzUEdqWEY5SUNUSzFWS3hjcHFQ?=
 =?utf-8?B?TmF4MUlORkJEREFzcTRlbXZiZC92SVhYMkxma1VnWEl5WDg0blNmdHVvYzZX?=
 =?utf-8?B?d1h0L1ltRnJZOEtpNGE1M2huV2UyQ2diMDh5a0xGY3RCbXJaa01sZ3JUWUc2?=
 =?utf-8?B?M0ZnY0MvK0prN0ZRTlVXZWRsR3QvWVd4TFp4VHF0ZEtNTFdUMitFZkhZbEMw?=
 =?utf-8?B?S2ZHU2lHMEd1Y0pBaTJRMG9YeStKWmxiUU50OE9sTENibUZMb1BBY242ZVlp?=
 =?utf-8?B?TkN3ZEdmcmxVVnVqdTdXVy93Zk94UVhYMkJCU3FZNEp6WU5XR2dKYlYxVFhN?=
 =?utf-8?B?RjAwa2E0Zm9YVkM2SmFVeVJBYWE5bUo4SXJxb29rRjk5QXhZMmtPVllWTEd4?=
 =?utf-8?B?ejhZby8zUVlPcTNOSlZIMEJUM244endkUEZyc3NJdHAzWW5ybDdYaVVRSEw0?=
 =?utf-8?B?T0pHZ2Evb1dJMXVBK2R6QkxGTkRjK0xOOFl5b3k3S3VsOGZUdlhTQk1hYjdT?=
 =?utf-8?B?Y2c1bnFlejhWdG1WUjNUV1ZmdTFFWEU1ZGtaQlJxZHpneGNKS1l4RS94ZjQ1?=
 =?utf-8?B?V2xDdFI1cnR4YWd6c0wxQXRkeW5abm1TOUc2cEZWL1RnNHJPaWtxcDVsdGk0?=
 =?utf-8?B?SVJTeW1YYXVveEQ5RTNYSDg4K01vNVNFR0xvMVNyeTJKc0Q0T2ZER25EMXBY?=
 =?utf-8?B?YmlWOUh4OHdkSDAydHFpR25HWlV4Z2lSOUg4bDJjbmRGMlh2QW1iUldLSkZj?=
 =?utf-8?B?bWhDV1YzMzkzTnR3VzlPTmZQaUZ4Z3Z1emt4eXJGOTBreUFCdC9zbmd1SlYy?=
 =?utf-8?B?VE9SOW1tdkxvTUw0R1c4WFVodnp0ck40WGRDVXErVURHdHZMTHFPRjdkRXJI?=
 =?utf-8?B?REJmazhnLzNuTUpWVkdzRk1xZkEzQjhlMTVuRVU4aktjckE4bFg3N1V2WFA5?=
 =?utf-8?B?a3ErVmd0VVU2SE5zT1ZTS3VlVTByWGNiVlJnZnJJaW9wVFVlRmRYYk5NY2NF?=
 =?utf-8?B?NW4xSzcyY2hkSGFsdFdJNjV6ZUU1aDRpYXJwbDR5S1A3Q0FMY2xEa0VYeDR4?=
 =?utf-8?B?YmdRM0V4Vk50anRYYUJ1YmIxU2tQL3REaldjV0w0dS81K0RwcU5tNFg5V2wy?=
 =?utf-8?B?eE93Q05Cdm9HVEMzRk4zM3lqbFlXbkp2S05MM3VTMVg1c2FBdGF2V2JiSG5o?=
 =?utf-8?B?azFadFAvbFFxbGxXWDE3SHBMcmY4TW1vMUlnZlg5SThLMG1QUlFUNnlqZVpF?=
 =?utf-8?B?YjAyeEFZek0zRHdaTklWc1BUSjZXWjlnaUVyRlpSc2VFOGw1TFFpdHNFcWdY?=
 =?utf-8?B?bmR6alQ1anI2dmxQQ2dzZEpVN0NDQVpHV2RLM0xNalZvKzFaVHFKczZOVi9S?=
 =?utf-8?B?ZjFTV1ZSWVpPN2c0Q05oVGlSbExITHBSWTZxRzVjUUREbzh2b1BreUdkMmJW?=
 =?utf-8?B?c05xWnZJak82bnMxZVAxeVU1L2lVSEVQSmt1S0tTajJ1d0ZEaThHMzY0eEI1?=
 =?utf-8?B?UUs5RHBkYjJqRm5TTmxmQ3RLV00vNWxGYVgrTXYxUm5IZkNHTVBJS0ltd3Bo?=
 =?utf-8?B?cEJjQWkyN0RIRjluV0NlQzFha1NsVXNrSUkvSi9HWUlxc00zdFl0OUVVYU9X?=
 =?utf-8?B?emZpMGt1UW9mbTRLdG50SUpZb0NxRzZidDdydXZvb0ZieDdESDNWYXpYaXlS?=
 =?utf-8?B?bGFWRHdaWTlJa3p3aDFxQUx2RzhGNUpLL0g1QjdySTY4a2ptYTQzWHJnd05j?=
 =?utf-8?B?SEpjOGZMV29lMWhGeU93U3dDbUNvZHJmdjBUWWV1VGFjQkF1YVFqLzNSOXNa?=
 =?utf-8?B?cXhRNDZ6Y3loMWo0czBMWVNzRU56T3ZrbjdzVVNCTkUyRUZrTWo1NWE3UDk3?=
 =?utf-8?B?T2hzYS9iaEpYY3E0WmdOZVRFSG0vRnEyMldoRFJyY0M4VVd5V0VHQ3BmRWtJ?=
 =?utf-8?B?aEtmSXl2dU9OTmJUSFFkeEdHVWMyYkVWQ1ZJVE9FYzhrV1RGT2xZQU5YbllD?=
 =?utf-8?B?K1drcFcxZTJiTmN0VWR6c1F0QW9BUnM2R3g2YTVmb3dtL2dHb0wyVGpjM0lz?=
 =?utf-8?B?cm01RHdjMks5MDZWanM3WFZEdUpqS29QaFl5bHFvbnNKQkNSY050Vkh2bUg2?=
 =?utf-8?B?ODdqODRmamVVd24vVnJRb3FNSFZsaVZpWVNXMEpWVUhVR3hEalhIMEJyeWdK?=
 =?utf-8?B?bkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FC13157F6F06A947929D48621F6736C8@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9c50eb6-83cc-4382-b589-08dd75b7b936
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2025 09:36:50.3022
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XKVQVYb8Q29XoAh7LIVr5Q10gFJcrpjVzm/xbb/i/OjKJub1+IEYqry+VnHIqKF81EI4BUnfSClMxzLLhteSEOVXNQq5K8+NtPrNuvbhBZk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF6806D69E4
X-OriginatorOrg: intel.com

T24gTW9uLCAyMDI1LTA0LTA3IGF0IDEwOjA0ICswMjAwLCBDZXphcnkgUm9qZXdza2kgd3JvdGU6
DQo+IE9uIDIwMjUtMDQtMDQgMzoyOCBQTSwgR2lyZHdvb2QsIExpYW0gUiB3cm90ZToNCj4gPiBP
biBGcmksIDIwMjUtMDQtMDQgYXQgMTU6MDkgKzAyMDAsIENlemFyeSBSb2pld3NraSB3cm90ZToN
Cj4gPiA+IE9uIDIwMjUtMDQtMDQgMjo1MiBQTSwgR2lyZHdvb2QsIExpYW0gUiB3cm90ZToNCj4g
PiA+ID4gT24gRnJpLCAyMDI1LTA0LTA0IGF0IDExOjQ5ICswMjAwLCBDZXphcnkgUm9qZXdza2kg
d3JvdGU6DQo+ID4gPiA+ID4gQ2V6YXJ5IFJvamV3c2tpICgxMSk6DQo+ID4gPiA+ID4gwqDCoMKg
IEFMU0E6IGhkYTogQWxsb3cgdG8gZmV0Y2ggaGxpbmsgYnkgSUQNCj4gPiA+ID4gPiDCoMKgwqAg
QVNvQzogSW50ZWw6IGF2czogSWdub3JlIFZlbmRvci1zcGFjZSBtYW5pcHVsYXRpb24gZm9yDQo+
ID4gPiA+ID4gQUNFDQo+ID4gPiA+ID4gwqDCoMKgIEFTb0M6IEludGVsOiBhdnM6IFJlYWQgSFcg
Y2FwYWJpbGl0aWVzIHdoZW4gcG9zc2libGUNCj4gPiA+ID4gPiDCoMKgwqAgQVNvQzogSW50ZWw6
IGF2czogUmVsb2NhdGUgRFNQIHN0YXR1cyByZWdpc3RlcnMNCj4gPiA+ID4gPiDCoMKgwqAgQVNv
QzogSW50ZWw6IGF2czogTVRMLWJhc2VkIHBsYXRmb3JtcyBzdXBwb3J0DQo+ID4gPiA+ID4gwqDC
oMKgIEFTb0M6IEludGVsOiBhdnM6IExOTC1iYXNlZCBwbGF0Zm9ybXMgc3VwcG9ydA0KPiA+ID4g
PiA+IMKgwqDCoCBBU29DOiBJbnRlbDogYXZzOiBQVEwtYmFzZWQgcGxhdGZvcm1zIHN1cHBvcnQN
Cj4gPiA+ID4gPiDCoMKgwqAgQVNvQzogSW50ZWw6IGF2czogUENNIG9wZXJhdGlvbnMgZm9yIExO
TC1iYXNlZCBwbGF0Zm9ybXMNCj4gPiA+ID4gPiANCj4gPiA+ID4gU29ycnkgLSBBVlMgaXMgbm90
IG9mZmljaWFsbHkgc3VwcG9ydGVkIGZvciBNVEwsIExOTCBhbmQgUFRMIG9uDQo+ID4gPiA+IExp
bnV4Lg0KPiA+ID4gPiANCj4gPiA+ID4gTkFLLg0KPiA+ID4gDQo+ID4gPiANCj4gPiA+IEZDTCBp
cyBhIFBUTC1BLCBQVEwtYmFzZWQgcGxhdGZvcm0uIFRoZSBkcml2ZXIgaXMgb2ZmaWNpYWxseQ0K
PiA+ID4gc3VwcG9ydGVkDQo+ID4gPiBvbiB0aGUgQUNFIGFyY2hpdGVjdHVyZSB3aXRoIGNsaWVu
dHMgdXRpbGl6aW5nIGl0IG9uDQo+ID4gPiBkaXN0cmlidXRpb25zDQo+ID4gPiBzdWNoDQo+ID4g
PiBhcyBBbmRyb2lkIGFuZCBZb2N0by4gQXMgc29mdHdhcmUgbmVlZHMgbGl0dGxlIHRvIG5vIGNo
YW5nZXMgdG8NCj4gPiA+IGNvdmVyDQo+ID4gPiBQVEwgYWxvbmUgaXQgaXMgcHJlZmVyYWJsZSB0
byBoYXZlIGNsZWFyIGRpdmlzaW9uOiBhY2UxLjAgPC0NCj4gPiA+IGFjZTIuMA0KPiA+ID4gPC0N
Cj4gPiA+IGFjZTMuMC4gVGhlIGNvZGUgaXMgbWFpbnRhaW5hYmxlIGFuZCByZWFkYWJsZSB0aGlz
IHdheS4NCj4gPiANCj4gPiBObyBhcmd1bWVudCB3aXRoIEZDTCBvciBhbnkgbm9uIGNsaWVudCBk
ZXZpY2VzLg0KPiANCj4gSSBzZWUuIFNvIHdlJ3JlIHRhbGtpbmcgYWJvdXQgcGNpX2lkcyBhbmQg
dGhlaXIgYXR0YWNoZWQgZGVzY3JpcHRvcnMsDQo+IGFuZCBfbm90XyByZW1vdmluZyB0aGUgZnVu
Y3Rpb25hbCBjb2RlIHRoYXQgZW5hYmxlcyBhdnMtZHJpdmVyIG9uIEFDRQ0KPiBhcmNoaXRlY3R1
cmU/DQoNClllcywgbGV0cyBub3QgY2F1c2UgYW55IGNvbmZ1c2lvbiB3aXRoIGR1cGxpY2F0ZWQg
SURzIG9yIHByb2R1Y3QgbmFtZXMNCmFjcm9zcyBkaWZmZXJlbnQgZHJpdmVycy4gTm90IHJlbW92
aW5nIGFueSBBVlMgY29kZSA6KQ0KDQo+IA0KPiBUaGUgZmlsZW5hbWVzL3ByZWZpeGVzIHNoYWxs
IHJlbWFpbiBhcy1pcyBnaXZlbiB0aGUgZHJpdmVyJ3MgZGVzaWduIC0NCj4gcGxhdGZvcm0gdGhh
dCBzdGFydHMgZ2l2ZW4gYXJjaCwgYmVjb21lcyBpdHMgbmFtZXNha2UuDQo+IA0KDQpObyBpc3N1
ZSBpZiB5b3Ugd2FudCB0byByZW5hbWUgYW55IElQIGNvZGUgZmlsZW5hbWUgdG8gZS5nLiBBQ0Uy
DQppbnN0ZWFkIG9mIExOTCBhcyB0aGlzIG1ha2VzIGl0IG9idmlvdXMgZm9yIGFueW9uZSByZWFk
aW5nIHRoZSBjb2RlIGFuZA0KeW91IGNhbiBhZGQgbXkgIEFjayB0byB0aGF0IGlmIHdhbnRlZC4N
Cg0KVGhhbmtzDQoNCkxpYW0NCg0KPiBLaW5kIHJlZ2FyZHMsDQo+IEN6YXJlaw0KDQo=
