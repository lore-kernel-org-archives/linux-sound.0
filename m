Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB6746C845;
	Wed,  5 Aug 2026 13:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785936501; cv=fail; b=nXi2dB0Ob69CyOuMjXUgG1y4nbxoq9pZMrC1Dlq2uv/brQ34f7AxpA6YnFOVG2YqgzSc69SqhjCnfsKBEjEzyWM0QILU6el1Iju9ctrj8OmuP0DDbuEEVfhP7jKQrutRP1WO+21jGokybRKiCJLdZup6hAUzwtJmBHiQZ83G/Cs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785936501; c=relaxed/simple;
	bh=67YbbYryMMci3pGlQr6G2OxLYlj1NxzAyPSed/7/UvE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Ej48cbT/vWzGn3qndiv50l8w6ZaJSln2HmWTjh6xe+Bc7+QL+tcsjUR1x8v+Ar3NH4CO+b03QjdUGwPwL98U9muWy434yAjCSOD1TXqTSxK6UKT4jQwhOshN22GatCZomZdeCuMELA26J3Lev4QoauYIy7wYKbnCUBIoYpwoKuY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PG5Z6mtM; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PG5Z6mtM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785936499; x=1817472499;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=67YbbYryMMci3pGlQr6G2OxLYlj1NxzAyPSed/7/UvE=;
  b=PG5Z6mtMMFmjhRSOJMnwg5CjkgQmHyziBA4NFIOUC5cHLfHj6b6Ru0+Y
   Wh1rv8J5uR0YIZlJNZCVfmV6G5+mrq9ar/UQOiDxKOO/KiSXLWa9XdRMz
   MxMfeTxPjF9fZaBFvq0uoMBfCiqsb5eaugEs4OuH0p536MytUOib5iI1t
   r7IVlAWuKvAkoJjDTMCT3ohkw8jbqqbEmIrK+rf6XGv9h16DNGhypyjEy
   DL5mh+NrZTIUnOHQrie2bx295nX0uD20cYtqWqK4CRC7ZPFD2bu5kUE+v
   Lwdu66GPe3ASDo0ohxKyFFuK3Bv/6hSFx/NbHYMJYIDNH4/HmvG3kKMQi
   g==;
X-CSE-ConnectionGUID: CePRUSFWT5m+qCzoy0ZQ1w==
X-CSE-MsgGUID: AVd2uA3mR1uzrPky4HtrcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="97104621"
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; 
   d="scan'208";a="97104621"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 06:28:18 -0700
X-CSE-ConnectionGUID: vB5NdDM0Tw6qz1Z+DRsp7Q==
X-CSE-MsgGUID: rLJX5FvuR6a6H/HSNrp2jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; 
   d="scan'208";a="261259508"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 06:28:18 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 5 Aug 2026 06:28:17 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 5 Aug 2026 06:28:17 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.31) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 5 Aug 2026 06:28:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zFz7Lx5YkX3+L7BaVb3eruT5jkBYBLLI8GnmFbLkrzMAvXX21PLidJagrd8WCQ2Eg7ZZzn+3jqK07k9cgy7hqDX3dSkTLIGw4Uv7e/Kb2pRE0ILyRFclCS6bsCe95WIM/WiJeHtbmVGyHUX/okEHMoakex3aXztMoerjCgd+7N1C4lSI4s1h44Qh+/TwNGm5WOSWcjGTDvTC/QZR0j5JpNOQNRkHS86Mu2EMLwUrbJ6ME7tFzjW9wT7s/ka+w5rsskX/UgUHxCCq2D01nTImrK9h2jmlEifd5t/ZjZNWSiqG3Sx9dORBQYO3I3Ipf7+rw3I85Lc+hwGnVoQpHzkxYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=67YbbYryMMci3pGlQr6G2OxLYlj1NxzAyPSed/7/UvE=;
 b=T1Z8XfoM51B5+DyJ3xGF6b0gZC/2PqrjH6INbvikaoh+91toiYAe/48ZkpTQogvlKqnRRYDgJHjZQr2kzDMFnR8tlqcGpoZ+2m8CmBw+mfnz7A6+Omhqk9eGRgDvlGfrYqB2/IDpBVaGqCCeArXVicKNvZ10WwKrzFH6k7wLcXOkq6X58D2x+waP7rB0B857C134oxNTPwD+jR80EQL7vLH0YHqxfbnKcUKaVrK4BFIVzh5bE4VCpcWWy7nUe0l8ouwOr6tohxZ0aKCokFjBScPc8xYdDlzQgP9XxPyFZOOgV6KIetIOnSglKHrsOyAOLN/5Ua++5TDfYrwfIXkifw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com (2603:10b6:a03:53e::10)
 by DS4PPF1B1B74C09.namprd11.prod.outlook.com (2603:10b6:f:fc02::e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Wed, 5 Aug
 2026 13:28:15 +0000
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::3df:33f9:59a1:da76]) by SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::3df:33f9:59a1:da76%5]) with mapi id 15.21.0292.018; Wed, 5 Aug 2026
 13:28:14 +0000
From: "Liao, Bard" <bard.liao@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Sergey Lebedev
	<lsa.uz@pm.me>, Mark Brown <broonie@kernel.org>, Liam Girdwood
	<lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, Oder Chiou <oder_chiou@realtek.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Peter Ujfalusi
	<peter.ujfalusi@linux.intel.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>
CC: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"sound-open-firmware@alsa-project.org"
	<sound-open-firmware@alsa-project.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 2/3] ASoC: sdw_utils: skip endpoints of a peripheral that
 is not on the bus
Thread-Topic: [PATCH 2/3] ASoC: sdw_utils: skip endpoints of a peripheral that
 is not on the bus
Thread-Index: AQHdJGUoCBZXVNqOiEu9pzUA52bbwraOoJ+ggAB9wgCAAFL/0A==
Date: Wed, 5 Aug 2026 13:28:14 +0000
Message-ID: <SJ2PR11MB8424F459A22A44CAFA9C9EBBFFD32@SJ2PR11MB8424.namprd11.prod.outlook.com>
References: <20260804225853.31585-1-lsa.uz@pm.me>
 <20260804225853.31585-3-lsa.uz@pm.me>
 <SJ2PR11MB84240C52AC5C4DB36B92AACCFFD32@SJ2PR11MB8424.namprd11.prod.outlook.com>
 <7be50891-3861-418d-8237-5340a80b9159@linux.dev>
In-Reply-To: <7be50891-3861-418d-8237-5340a80b9159@linux.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB8424:EE_|DS4PPF1B1B74C09:EE_
x-ms-office365-filtering-correlation-id: b7e6cd19-f742-4288-fb51-08def2f56751
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|18002099003|22082099003|4143699003|11063799006|56012099006|3023799007|38070700021|6133799003|10067099003|921020;
x-microsoft-antispam-message-info: wBbUoZ8vSOAnhZkIyR1ntx0CIvclpXLBcsK+Rm2ZA8fIusncVgchLF6BpEY/OGN47Q50B0/yypwBtFXr5fH1hSKXlIO56ixn03LeomR0/XEghawBZAYWruy1yoIIxlLK5zjLzquxzfMqtvb4+yPl8XE35Xxx3f/5iwtMBD43PM2uzsaOK7Tge5RreIPdMIorbwlbDiTrK6zTF/+oundG7yB54NyZXbarwu2rSgJ6jJxWge+DM18hqy5ZbsmkjDPQWaPVJGBp7fq3gyoForxM72SxdH2n7T9I3SwIokSZQLvPZFtKYeW8o9357Om93nWGC+yr/eYesd5BRmOv8FMBuqQsHlom5b6n6cMOvcJfRo3NpvK1rbOIEpYhwg9z6Tog+gy3IiW+8DLFBxGlXs1YRoeHjG+8q141AV09tJ4BHnA5xhQpx40FnjKwbU/m0jglX9wAw+mr53fyiRmkkeA0kpcZacih1TAftWis2m3iCLn34vdNS/BE0S05JcYntYPqZz7uLX/vH5Yn64Ji5vL3ZSc4VOdnIc7f9uGRW0CNzRjhlnXc25VbabXoqogywKIf/SNIDKhYsvwg/mdb6Tj+U6hks4VHKQLo8QnmOOT6LYKxXWOcUUZMPV1sUh/3gVYwoPBS56q67iSfXE8fxlNDhjcMq/IZwHGTjydIzJQvnlvefNnUR9G9EzDws3pjbp0mJ2xjqvoYE3QiiYLL2Wf0EbZOAnWT2z/CeYC7DyChGhg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8424.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006)(3023799007)(38070700021)(6133799003)(10067099003)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V08vZ2FoT2EwTnd4bGdkY0lTMmo4c1VKYm1VM0VNNHJiK2ZTSG1UUko4eHRG?=
 =?utf-8?B?Z1Y1Tm11Lzk3OUg3SlovUG9kMkRDSVRiaGtET2JrRFBpM0hJeXVPUWVhWkxK?=
 =?utf-8?B?c1o2b3J5N29BVkxpSGNucmJKWUw4Y2V2YWVRME1SbVpWbEhKaTRPR000bm83?=
 =?utf-8?B?QmJYL0hUK2tSUHNUVVgvOEVRemo1dEl6cHpDbU0wdnQrMEhZemJBT3c1ZHhk?=
 =?utf-8?B?VkpHR2VwYlk2WlhKUUJ0eTBhNXBidWxOWmVsRHdmUWZzSG1idEMwM1U3d01k?=
 =?utf-8?B?Vno3Q1IrTTJQajNXMUtSRjV0ekdBcmxmVTQ0cmEwMjNEMEFLaWFiZlZUWVFh?=
 =?utf-8?B?MzZMbUhRdmpXTzZkZTFPaWNnTmhaeXIzaGhHeUZZRmRzSjgxZ1BqdTVnRGR2?=
 =?utf-8?B?c05CWngrYTY1STZFdGJtMzNJU0Q0Mmo3VFlYUkdRa0tEWFRrdUJ4U1haMnIx?=
 =?utf-8?B?WGNyRFhwRWxsZU1JbFJTQU9lSkpEbGtRSUk2Vml3Y2h1MTF3Mi9pTEZCMlhX?=
 =?utf-8?B?OWtDM3RVYndYQ3dxMTdQL1NLbHNpNFZ6bytqSXZHR0QxZFUyekxiSXE2UHYw?=
 =?utf-8?B?L1U4T2ZqRHRxYm1ZZHVLRHpQK3NxazdIR1dsdEVRWDJkbFhkblFTL1lwNVpQ?=
 =?utf-8?B?S3BSV25zQW9kVDc2UzZpYnlmakJZSGQ1YkptUkx1Y1pWR09xRkorWnJqODk0?=
 =?utf-8?B?U1k3U0ExK3NKdGczdmhObHZlQklHK0h4Wi9sekxSY3haRnNVS0VrTDlSRHFR?=
 =?utf-8?B?U25WcnEvbHk0dGJXM3V6VXpFM3E5enU2dHcrS2ZQQ1o3NVJYYlV6cUV4bmZ5?=
 =?utf-8?B?M3R2Uk5xSHU3bmRBK3hEaVRLZ3VaQm9oNmhWeWt0N1Q3Z0lqSTJQL2o5TWl4?=
 =?utf-8?B?Q2w4UTEzNk9QeDRTeHFGRS9HclBXN1RpdGVOT2JhNTFYSWN3VG5PNmFCSGho?=
 =?utf-8?B?L1dvUFAxUWdVVVJSc25LZDNIenM1N3RRb0dpS3lsK2NybVRtUndBa2g4STV0?=
 =?utf-8?B?V3hBK3Z1RnJrWjQwWUZCaGxmbkZIRENiRVBacTNxamhYVjVoNk5KQmpBdk9Q?=
 =?utf-8?B?RGEzM3dwbDl3SGI3SkhRZk4yaFpsSzRhUWRHZGJXNWFWMGdvNHNSM2pEOUM4?=
 =?utf-8?B?eTVqWlZaMXl4SWdzeG9oajdWaVdZUGtvUXBFamtHa1lkeHlqNlhjQkx0akVw?=
 =?utf-8?B?SE9IcVAwWlB6WE9IdUNOV3AyQkhRSlRCUGdRWTdEdXlrNS8xUDJybW5xOTB4?=
 =?utf-8?B?V2FPZHZDWXFjSzVXekdoUmg4b0tob1BCNUZDNk83K0p0YUJvT001VVg3Mjkz?=
 =?utf-8?B?UnNFY0FhQThuc1RvRkJqbmloWGhQbnZpT2tvVVZYa0t0TnFrOGlhV1VFZjBk?=
 =?utf-8?B?aXBadmVTQlVGUWR4NW5HckJueU15Z3NnUEFseXpPa2w1aU84YXpzYnN6cEdj?=
 =?utf-8?B?RlJyaFZGTFk4MkQ5MmtoU3Q5cnNBVnB3dzJCdnFkdnlYRThkcnFIVmtYc0dr?=
 =?utf-8?B?WVcrYkNHSVIzTEEzUWhtRHJsYUVJZnBqTjFYV2Q0S0lDeFBBcHg3a0VYQ3NB?=
 =?utf-8?B?SmhEa1o0S1NOM3hHeUk5cG80dFNaTmdJbDRKckVKS0prcWpFRWoxTkhXY21H?=
 =?utf-8?B?VG5vMHVFUEdIVm1PWGppSnhkRFp3RmpmZjFSYVRHc3k1WjRoSUlvL0pabUk5?=
 =?utf-8?B?TVpTWmp1MkpqSFhUaVFoSXlmQ0ZibHQ4NmtYMTJPMGZXb3lOMzdpZEVwN2pu?=
 =?utf-8?B?MDFWMkxGbnc0VDJpVnlHZ0ROKzdqa1NLdFM2UGZpcThMbExiR3FJeGJYa2ll?=
 =?utf-8?B?YlJ2dmRyZ3JvZ3R3M0tJc1RDMDEvaWZTN0QvRS9jQjF2blNYdlNPZy9ybzdq?=
 =?utf-8?B?VXFhUkk3RFhNSnBuNGc2NWc1YlNZWjg1UXpUR1IwM2ZYMlBOc0wyMU1pQURI?=
 =?utf-8?B?bHA0ZTVJbWJ6RVlOQTkzZ2FwNlJNZDJscEFhcFpPVytUMGpVa1RLSnpQb0dT?=
 =?utf-8?B?V3Byb3JRVkRKWnl1SkN0T0ljV1dRdVBMa0lITC84bjRGeVRQUVJxZU11bzRv?=
 =?utf-8?B?bFVsbkRNYU9QRWxUTERQUEg0M1c5dE1FMklpNE9qdEtNb3ZGcmgvYkFIRWZE?=
 =?utf-8?B?eE5mWWYxZy95dWNiZzYzeElSWDE0aTlRV0kwUnFTYWF1U1ZSd0RZcjIxZnhV?=
 =?utf-8?B?dkVDWExIOUtmcU10a3p1enVWQmQ5ME1PK0MwTDVxS3BGYlR1bUhDVE1XYzJn?=
 =?utf-8?B?NEZWUklremMrYXE2TlE3SGI1YUg1M1FFZkdHWEhYbmZic3BzcGFjeU5FK1Zw?=
 =?utf-8?Q?uHpsVVh4iTAq/eoUqZ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Hu/M2MmdtJoByw214aGOxX2dmAoHHLZogI4v8S5NQNPi6Ke/VUG0UtokQ+4qTPZPltagrQwC51Kgei8yE7G3i7jpm16SelbbURKSE18LsRCP7CMnWiBPeMj9DwToxjQHGlWe41o9PM/BsPGfcaihhyHkd6dHY0o8Pn1t02C5YO14VLXNzNjMmjIkEiGp1flJ1CwvD9v5oQ/5qIs64CADs4cv1nKV/LS/qFhJU9kIziKaegFj5XAzpcsde3lThrzxtAb29OS+MVLFGkkCm4oxS9PEyDxm53KxWYNd2HNnmlwnSNOV6oR6ohNaiqn9B4CC2jdfAnad68C8soV1M21a/w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7e6cd19-f742-4288-fb51-08def2f56751
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2026 13:28:14.6925
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A2tV1+S040iJbwx6V5003nT4qMrOWInlI6LaTNEcdxSJEDkV0RBgV7Af8U1AGVl+mhET8Kf0NuXjVhpmHOnuRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF1B1B74C09
X-OriginatorOrg: intel.com

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGllcnJlLUxvdWlzIEJv
c3NhcnQgPHBpZXJyZS1sb3Vpcy5ib3NzYXJ0QGxpbnV4LmRldj4NCj4gU2VudDogV2VkbmVzZGF5
LCBBdWd1c3QgNSwgMjAyNiA0OjIzIFBNDQo+IFRvOiBMaWFvLCBCYXJkIDxiYXJkLmxpYW9AaW50
ZWwuY29tPjsgU2VyZ2V5IExlYmVkZXYgPGxzYS51ekBwbS5tZT47IE1hcmsNCj4gQnJvd24gPGJy
b29uaWVAa2VybmVsLm9yZz47IExpYW0gR2lyZHdvb2QgPGxnaXJkd29vZEBnbWFpbC5jb20+Ow0K
PiBKYXJvc2xhdiBLeXNlbGEgPHBlcmV4QHBlcmV4LmN6PjsgVGFrYXNoaSBJd2FpIDx0aXdhaUBz
dXNlLmNvbT47IE9kZXIgQ2hpb3UNCj4gPG9kZXJfY2hpb3VAcmVhbHRlay5jb20+OyBCYXJkIExp
YW8gPHl1bmctY2h1YW4ubGlhb0BsaW51eC5pbnRlbC5jb20+Ow0KPiBQZXRlciBVamZhbHVzaSA8
cGV0ZXIudWpmYWx1c2lAbGludXguaW50ZWwuY29tPjsgS2FpIFZlaG1hbmVuDQo+IDxrYWkudmVo
bWFuZW5AbGludXguaW50ZWwuY29tPjsgUmFuamFuaSBTcmlkaGFyYW4NCj4gPHJhbmphbmkuc3Jp
ZGhhcmFuQGxpbnV4LmludGVsLmNvbT47IERhbmllbCBCYWx1dGEgPGRhbmllbC5iYWx1dGFAbnhw
LmNvbT47DQo+IFZpamVuZGFyIE11a3VuZGEgPFZpamVuZGFyLk11a3VuZGFAYW1kLmNvbT4NCj4g
Q2M6IGxpbnV4LXNvdW5kQHZnZXIua2VybmVsLm9yZzsgc291bmQtb3Blbi1maXJtd2FyZUBhbHNh
LXByb2plY3Qub3JnOw0KPiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6
IFJlOiBbUEFUQ0ggMi8zXSBBU29DOiBzZHdfdXRpbHM6IHNraXAgZW5kcG9pbnRzIG9mIGEgcGVy
aXBoZXJhbCB0aGF0DQo+IGlzIG5vdCBvbiB0aGUgYnVzDQo+IA0KPiANCj4gPj4gYXNvY19zZHdf
cGFyc2Vfc2R3X2VuZHBvaW50cygpIGJ1aWxkcyBEQUkgbGlua3MgZm9yIGV2ZXJ5IGVuZHBvaW50
IG9mDQo+ID4+IGV2ZXJ5IF9BRFIgZW50cnkgdGhlIGZpcm13YXJlIGRlY2xhcmVzLiBJZiBhIGRl
Y2xhcmVkIHBlcmlwaGVyYWwgbmV2ZXINCj4gPj4gZW51bWVyYXRlcywgaXRzIGxpbmtzIGFyZSBz
dGlsbCBjcmVhdGVkIGFuZCBsYXRlciBmYWlsIHRvIHByZXBhcmUsIHdoaWNoDQo+ID4+IHRha2Vz
IHRoZSB3aG9sZSBsaW5rIGRvd24gcmF0aGVyIHRoYW4gZGVncmFkaW5nIGl0Og0KPiA+Pg0KPiA+
PiAgIHNvZl9zZHcgc29mX3NkdzogQVNvQzogZXJyb3IgYXQgc25kX3NvY19saW5rX3N0YXJ0dXAg
b24NCj4gPj4gICAgIFNEVzAtUGxheWJhY2stU21hcnRBbXA6IC02MQ0KPiA+Pg0KPiA+PiBUaGUg
TWljcm9zb2Z0IFN1cmZhY2UgUHJvIDExIChJbnRlbCkgZGVjbGFyZXMgb25lIHBoeXNpY2FsIFJU
MTMyMCB0d2ljZSwNCj4gPj4gYXMgdHdvIF9BRFIgZW50cmllcyBvbiBsaW5rIDAgZGlmZmVyaW5n
IG9ubHkgaW4gU0RDQSBjbGFzcyBpZDoNCj4gPj4NCj4gPj4gICBTV1JBICBfQURSIDB4MDAwMDMw
MDI1RDEzMjAwMCAgIGNsYXNzIDANCj4gPj4gICBTV1JCICBfQURSIDB4MDAwMDMwMDI1RDEzMjAw
MSAgIGNsYXNzIDENCj4gPj4NCj4gPj4gU2FtZSBsaW5rLCBzYW1lIG1hbnVmYWN0dXJlciwgcGFy
dCBhbmQgdmVyc2lvbiwgc2FtZSB1bmlxdWUgaWQgMC4gVGhlDQo+ID4+IHBhcnQgcmVwb3J0cyBj
bGFzcyAxLCBzbyBvbmx5IFNXUkIgZW51bWVyYXRlcy4gU1dSQSBpcyBhIHBoYW50b20gYW5kDQo+
ID4+IHN0YXlzIFVOQVRUQUNIRUQgYWNyb3NzIGV2ZXJ5IGJvb3QgYW5kIGV2ZXJ5IGZpcm13YXJl
IHZlcnNpb24gdGVzdGVkLA0KPiA+PiBpbmNsdWRpbmcgdGhlIE5vdmVtYmVyIDIwMjUgYnVuZGxl
Lg0KPiA+DQo+ID4gV2h5IG5vdCBqdXN0IHJlbW92ZSBTV1JBIGZyb20gdGhlIEJJT1M/DQo+IA0K
PiBPciBhZGQgYSBxdWlyayBpbiBkcml2ZXJzL3NvdW5kd2lyZS9kbWktcXVpcmtzLmMgdG8gc2tp
cCB0aGlzIFNXUkENCj4gZGV2aWNlIGVudGlyZWx5LCB0aGlzIGhhcyBiZWVuIHRoZSBkaXJlY3Rp
b24gc28gZmFyIHRvIGlnbm9yZSAnZ2hvc3QnDQo+IGRldmljZXMuDQoNCk5vdCBzdXJlIGlmIGl0
IGlzIHRoZSBjYXNlLCBidXQgaXQgaXMgcG9zc2libGUgdGhhdCB0aGUgU0tVIGhhcyBkaWZmZXJl
bnQNCnJ0MTMyMCB2ZXJzaW9ucyBkZXBlbmRpbmcgb24gd2hlbiB3YXMgdGhlIGRldmljZSBtYW51
ZmFjdHVyZWQuDQpIb3BlIHRoZXkgdXNlIGRpZmZlcmVudCBTS1UgdmFsdWVzIHdpdGggZGlmZmVy
ZW50IHJ0MTMyMCB2ZXJzaW9ucy4NCg0KPiANCj4gSXQncyBtdWNoIHNhZmVyIElNSE8gdGhhbiB0
cnlpbmcgdG8gZGV0ZWN0IGlmIGEgZGV2aWNlIGlzIHBoeXNpY2FsbHkNCj4gcHJlc2VudCBvciBu
b3QuDQoNCg==
