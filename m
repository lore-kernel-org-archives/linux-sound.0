Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CBB18B463
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 10:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205986; cv=fail; b=unRmiytJ8e6LMMushxlKKRqiNExJwuUkPEOXeLe03vfddItq1Rz/6h0X4MKUuFS8KgTJ8Zj4uuxSBBrfOQ0Rl3oy7yZWKNYYmxZlMLyq0Tp+mY0nMPgEy4qAl6ea6Wp2qk0pHHAMvHXdf95EymccNJlxts/Hvj2Y1OzFHWq8I/A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205986; c=relaxed/simple;
	bh=gLRWalF6i2dyytMhhSXG/nUkcqNmmCRjNsI9h4wE460=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Bz8ClP4DaAgKQ5GAOaam5hDvr4/nIVgwb+HF4D5da/wIdBlzUt/xbLt8ZKFHXNtm/KBIDu4VQsKb4oIsI+cBgHnPrI1ckdFwiNdOgGHZpJKLNgMU5Hsmqt+JTHioGZxEqEt8Y38OjScSXyz0thcomyoSpqAx2TJVvX3JpK5xedo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jss3z7El; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jss3z7El"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742205985; x=1773741985;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=gLRWalF6i2dyytMhhSXG/nUkcqNmmCRjNsI9h4wE460=;
  b=Jss3z7ElZz0BHYZEJt3idSfZ/UsYHM/+iqb647CSC/qklIblF4r3TIGL
   7B4Hp0hqZN+PkH0e3L/hKe4xms6umVNBlRsxdN8c81aoLikdd2YsivblG
   0IbT7gG2VKzYsCSBKhWEMgy3JtFn0Mde+iZDNNd5WX5x6gGqilQqk22cK
   RNFVjgvTIxSaaI2P4IM6985GLt/0CgtgPlffzZmr4jIN2ENtidm7TdtC5
   COB60wJSffVlznZ25UR6m8segIezkF7xUI8twYF3gTiuCz4S3EHS+QmUZ
   gCPNxFjQfacsNFfT1wvJojlGRNa/nig7ANNB4Jk9U/66rV0UDMa4HH2RS
   g==;
X-CSE-ConnectionGUID: F1fsH828TJiiRzhWyU9p2Q==
X-CSE-MsgGUID: 03PCieKwSh60yveV0mbgMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11375"; a="43174802"
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; 
   d="scan'208";a="43174802"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 03:06:22 -0700
X-CSE-ConnectionGUID: HRrYjkkiSlK7fXMtag9HYQ==
X-CSE-MsgGUID: QdH6JLOCQd+e4wyoIC2XqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; 
   d="scan'208";a="121852428"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 03:06:22 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 17 Mar 2025 03:06:20 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 17 Mar 2025 03:06:20 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 17 Mar 2025 03:04:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TS1CovO/h+pesxGjfbLJY7YEKxQg/Krtm++xHMOf/z0/QrDFUlxzm14zbq1UPt6XCL8loMj07NqAncGs9B16HvZEKVztBrI02ZhovLDuMjfHDRsqInc05pgi3x5ADwyKeB4eEr81IVYTQ+iUBtZmfmxE+zNhKEMFeuJHvgu7rZ4VwYr5tPTaKh3BvGENe0GUxl1S7j6bxxYsTjWhUVzBHJnzPpH4QT2p+Tk74Zep0/8gJbLWPx50amSpDUewoFxCH54phDe8V0kLyDvkDYs91pza712T61NTqUOQasi9Tbhr9DmcWTUyvkXut8MkBb7+Fr8lEJ8VUUfB5Ix91Keu5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c/NANutr+hsrcdtGUL0N0/cDdimPNySVJgjToXu+OBQ=;
 b=XNJX+lcT2B8EtNQ9gYq0p1WlUTIvKmXzPoOWv7e21Fy1fXtKNH1ghgfcMcl65B5hGAaB+nBdWW8RldN5NQamKWdYKNh9Jr11pUZDKWOYssUwuyyuYDXPNgkUtziBrOA1buxKBwL3+lgPiez/49JVq+oywg0EnU/ZvUibHXip0pzLPcIBylhvPnwhaipQF9biNZ82lqpm3dae/FlG8rzNVFGxLnVcaguJ2RH4aOof2nFfp+ZjIZDl6cD0ZknXF9JdPoL3KeXsvp9y6E1NDkziW4FO8maW8IFcUN3FnHLfnspdFKS+/ihdO5/Zfz7GqjKzw/TL8dLc7Obl3cO48EXZpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 BL1PR11MB5287.namprd11.prod.outlook.com (2603:10b6:208:31b::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.33; Mon, 17 Mar 2025 10:04:52 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832%4]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 10:04:52 +0000
Message-ID: <1ee28d25-7f89-4c5e-a6e1-020e8fb6fd4d@intel.com>
Date: Mon, 17 Mar 2025 11:04:47 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 61/88] ASoC: intel: avs: Convert to RUNTIME_PM_OPS()
To: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>
CC: <linux-sound@vger.kernel.org>
References: <20250317095603.20073-1-tiwai@suse.de>
 <20250317095603.20073-62-tiwai@suse.de>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20250317095603.20073-62-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0140.eurprd07.prod.outlook.com
 (2603:10a6:802:16::27) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|BL1PR11MB5287:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e5198e8-2e65-4342-ad96-08dd653b28ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VDkwV3FicHZIRCtFTHdnM1FFNFJqUFh0VExFaU5BZm5SM2ltengvVzdoZXVv?=
 =?utf-8?B?aS8xQnJSV0NlWjc5TENYNjcrd2Jvb3dvdU9pc25iZWI1OUVrbkdoWmlWaFNR?=
 =?utf-8?B?MGhXRXQ1Z2ZHdW4xd0VwblZOeEUzTGhBZHhkRkthOGdmdVV0bGVrK0pUcE1Y?=
 =?utf-8?B?dU40bkU1NzRBZXNaZ3FoalhTR2g0Z0dXSC94eGc0SGRGNnJ4b3VXQjZIZzk0?=
 =?utf-8?B?VjNwYU94QStOR0hra3o3NGVCWXlINS9XTWJ2b1FiVGZVeGtXN1JnMVVHbnZs?=
 =?utf-8?B?NVdsOXNuUXZVNzAzcnZ4U3FQNlVCY1BOdm1XYzAzS0hiTUxJd1hRZmE2RGJI?=
 =?utf-8?B?S1ZUQ3lGb0R1SnR2TUlpWlRpQS84SGFadjJwanRNdzBFV3J3SjRyOTRmc3FZ?=
 =?utf-8?B?eUU3OU91U1FPRm9Qd2cwRTRSNWhBaUVSQnQ2TGRtUU9XM3lRRXVncmE5dGRv?=
 =?utf-8?B?WU85TzRtWEw3L1dpK05CQ2RNYzFOOURHRUowaEgzaGk2c1VMZmR2U1doNE9K?=
 =?utf-8?B?dVN1OXJCVTNaWVl2bkJxSkxPeXZrTFo3L2NiekQzcEdLRmhMbndRbHcxWXRr?=
 =?utf-8?B?UnFZN2s4cUE3a3Bxdld6UE45eXBmOEVSTzdnNy9aOURUaUMwQjlkMGE4Yjl1?=
 =?utf-8?B?VFNTQVpkZnpweEJ0N1BraHQxOWVTUEhQRTlnSVVOQ3FPZG1DZU1WbjNhQ0xT?=
 =?utf-8?B?SDZiRDdUWmllblJYWmFtYytxRjlFenNLcjNFNlFJOU5yb0FHQTZSbE1kQVY2?=
 =?utf-8?B?VmlMaTFIMDdzUC9lWS9KUXNtaTliUkZJd0Ircm9zV1lueVVxYmRCNTZUZTB3?=
 =?utf-8?B?RUl6S24xZEliQVZLRS96cjZkb1VrKzhVaE5DZ3JBY1UwWk94OHA3cjVHcmJR?=
 =?utf-8?B?cmN0aHpCM3kxcnoxQklYOXlVTkRlSFo2bGJ1UVdFMHJ5MUdDY1YrMG9kdmJi?=
 =?utf-8?B?ZmdTTGVzTk5NaFFKdjZYVFdOWVF4QlhJQlRIMkN4bDRrc3kydEZaeTg3RlMy?=
 =?utf-8?B?dGMweXVxMFAxaVZjaTdPcnI5NDFkaHJEMjhueEhaakdZeHNNYW9VSzJwZTlP?=
 =?utf-8?B?T01xemg1VXlhSFdNSk15ZjF2aG5BRGd2TmZIbDNNRWl5L25UZHYveVpRUUpR?=
 =?utf-8?B?YjE4bm1yb25xU2txRVNyZmsyVmk3b3FUUU5WOEpJS1lKbE9WcHc5T3VKdDZZ?=
 =?utf-8?B?NFozeVRZOFlzZmRYdGdNMFQ5eXhQTUQ1YjVVbE11SHY5bW45aHoxUjNZR3pU?=
 =?utf-8?B?V2ZUYlpVUUlrNU1UZHk2djJITmtITVRNUWtzZ0d2U3lSaGZhNlA2WEU0dXdN?=
 =?utf-8?B?eDdJWFl0SUVkTlRoWHRFZW5ldVhDcWhYNGhrRUs4LzdLZlJ3T1RVL2RsMDA5?=
 =?utf-8?B?eEhxL2pjVW5VL0I1OS9CU0RJdGdYVHUySnVFVU9YVi9tU041b1FlSVRCMU1M?=
 =?utf-8?B?T3hRazViWUs4Y1RWVWo2amI0RVROdkN5ckw0NWlOVjJMUzdzWHU1YzIyVDF0?=
 =?utf-8?B?R240UHpnbm9VU3dNVTlDYnRaQ1BpVTdXcHh5cEtEUUw0VThiZHBEUS9waUtz?=
 =?utf-8?B?b3VycUp3OGVHTGZHSWhhUU5xNkU0cXhtRHVLY1VPMjNxUHpOeFhxam4vUjc3?=
 =?utf-8?B?S0VxSTZBWFJyKzB2WGFSVEdCV2dEZmMvYUc0TmVOeS9ROGs4eTlyTmZFVEJr?=
 =?utf-8?B?aWNTOTFaYnNGZ2xLWDRtendkRFJROXllOEJJL1J6eWVibk5jTldLYTNwS2I1?=
 =?utf-8?B?TlVsdTBOajY3VGFzZ3RzNWFxVlV1Z0NnanRUYTkxK0JmZGpOWGdWbHFONEhD?=
 =?utf-8?B?T2dOcEk0dTBmaXJEMThqalErc2RCcFJNWHNWREZOejErSVNpSmt4dGJXemd5?=
 =?utf-8?Q?hSrjzfX0LYaw6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjAyRHF3RVV5dEsycVVKaG42YVNqTjUvWk9kU0MrWFd2ZmUwa3J4UHc2MmRt?=
 =?utf-8?B?Y1paTEpMek5KNklxdGpNNEJpL2tmR0Zoa3cxZHBMZDJhbFFHTWd0aVdIV2pS?=
 =?utf-8?B?MzU1RFBJajFtb2VxMlNNY0oxbmhzZDhFSlRVbjk3MmlneTdxMk9rRVpIU1VI?=
 =?utf-8?B?bC8rMnRaMzRnQmdiUnNvbHhTd1B2WmZPZUhMSTd3OWlIZ2YrVC9DeEFSWkp2?=
 =?utf-8?B?Q3lMcFN4ZGFHY0F6RW5MQ2tsdUdLcVUweUJkVU43bndYSHl2OWJsaDhjMWFB?=
 =?utf-8?B?S3VzZm95UkN6clo4WmZKc1czQmErSjR3Qm83OGx4dUo3MWduWTM3L1gvNFZv?=
 =?utf-8?B?aHJ2T29BZ3BQanFVd2pQQnU4VU13dGxaMDduV2tiRTNGYmdJWC95M1h4TUx5?=
 =?utf-8?B?cmtUVUhsYkFkeDZYM2pmL25PV2pMSmxjVGpCRTFuU1ZsYStVQmVHT3hucTh4?=
 =?utf-8?B?WWNtTVBjRVk3c1ByT09wYnBuMVBtVzNUazlCMWtReG8xSTIzbWFUSWVxdVNi?=
 =?utf-8?B?TTFuMXhiVDFyVUR2M1RwVGZGZ2VGTUZRcVpQcG9aeFMrTlkxcHNCSXhXZ0VT?=
 =?utf-8?B?ZTFkK2VuVndOR1hZZjVOa21aOC9jZ3BUUzR2a1hVUG8zazk5R1FxTzIybzE0?=
 =?utf-8?B?VldnY3Uway9ERkowYnZRMU9mUGdMZ3o3eUtFYkdEb00vaXhGbnpZWjdnc2kw?=
 =?utf-8?B?ZE9kT1dqdUFvZUtzdkdFVkcyUkp5eUFzSmdPMkdqRVVPLy92TlVuSURSdll3?=
 =?utf-8?B?YVRUNUI3eUgrTFJPdTIrY0JQNkcrSkpXMkF1TkxzL25RQzVwL3ZWU0R3TXFH?=
 =?utf-8?B?eG50MmtFVXloeUdpc2ZvSTkyL0MrU3JjWGlNZ29PS3NyUzVtSm0xaHFJMFBp?=
 =?utf-8?B?b3dKTzhzTnU4aitFV2lZOExKa1Q0dTF5TjNRTFVXeDRHNDZyVFJRVU5TR3pr?=
 =?utf-8?B?K0JVcy84YU0yQ0dPcmFIaFByVVl2QkU1SEx6NzdVSkQrVmJyNWFYaDdCc2N3?=
 =?utf-8?B?RDVYTjlMcHlOazZpc2o3MHZLZUdZczZXZWswcUpIWG5FNHF1VlBoK0taQ3VG?=
 =?utf-8?B?TUtjU2VmRFFyeTllRXpwLytpWThFdFFXbFJUekNmWHpwNHFYM3VxU0tEQ1A5?=
 =?utf-8?B?bloyeEhmSm1jUGRiL3VBUmdxbm5PZVkxU0hVbFBCQnZjc04wczdJbks0U0R3?=
 =?utf-8?B?TURDb3AyNzJGR0tFUlRhZS80dmRxMFk1QTd6bHJURS9jYXB2L2J2WnE1bHBw?=
 =?utf-8?B?SWVJSDc5QmVhZGZPNTR3Uy9oMHpoVG5INDJsdXp0QkRYbnpYcGVXTkd3VEti?=
 =?utf-8?B?cDd4L2Z5WE9pRnA1YzNSdW5KSjBMdytiTm5vZGhUNnBjQ0d1ajIyRjVSZTdk?=
 =?utf-8?B?cjBJVUlYRFJHcmdXeU1QNnNCNk16TU9peU5iRVFlYU1MdGZ6ZWRwcDlvRW5T?=
 =?utf-8?B?M1J5UmhMZHh5QjlPRjVHUkh2Y1ZOUkpHdTZhY09sTEdESkk4UXg1eFZXdTIr?=
 =?utf-8?B?b0J6T0FGd2I0TCtxc3JPbGlORVNUNEhuVGJWS3UzaE40OHBLYzB3TkFOSE0y?=
 =?utf-8?B?THNjeVlzV2s4Qm42TE9RZiszUTF4eXpIV3NwYTI3bGp0cFdzYndKTnBZb3FN?=
 =?utf-8?B?UzF6L0xaU2hWY3pqdVlvTVcwQk5ETmQyZHpqNllhR2RJaHZCL29QSnZkSXhr?=
 =?utf-8?B?UzVtaFV4SWtmVTdkQnF6ZStidUd5dWtMUFQwU1pBQXE0Y0tyT1E1QUhpQzg4?=
 =?utf-8?B?NkllYXRDVTRkY0QrQ1A0blZhbW4vRHRJdk9ET2tkSkMrTTNZYkUwajM3Q29a?=
 =?utf-8?B?Z0xtYVlIdHY4QmtSSXFWVzRqRDdnQkpXVEk4ckJ4UHprL3ZEeDdXYWIwNjM4?=
 =?utf-8?B?SjJRMVQ1MGg4cHoyMUQ1RnRUNzFTNGNXOGliYXptVnVZdkd4dnFrcFNOVXRx?=
 =?utf-8?B?cUYwbmNVOXhCWnE3SytHSUkwNE9tdys1SC9hSzZLYXBPelJBVEptZXhVWUtV?=
 =?utf-8?B?eTE4Z0JzNUxkQ1UxN25HTGk5WFdUUnYvY0ZZTnZKSEhmQkJCSjByUVJvTG1N?=
 =?utf-8?B?TVdmc3B2UWpKSTcwL0dYR2FndnBiWVVSTWJMNDR5TnV3RDE5SElXZGd2aVlR?=
 =?utf-8?B?bEEwWTdxeUc3eW5MdVp1QTh2bzlmRUcwNnY5ZzNEYmZ2UHZxMmczRVN2a0VC?=
 =?utf-8?B?U3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e5198e8-2e65-4342-ad96-08dd653b28ff
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 10:04:52.3100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hAkVCw1ff8kVUikq5PLXbiRf7pfn7+3fUXIzGBaP+4bsPAWo24LntgR2QJB8sUTXRQjaK7YlBh8W/BUKoOx7pLnETXcuv3cM8rKXuHr0w0Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5287
X-OriginatorOrg: intel.com

On 2025-03-17 10:55 AM, Takashi Iwai wrote:
> Use the newer RUNTIME_PM_OPS() macro instead of SET_RUNTIME_PM_OPS()
> together with pm_ptr(), which allows us dropping ugly __maybe_unused
> attributes.
> 
> This optimizes slightly when CONFIG_PM is disabled, too.
> 
> Cc: Cezary Rojewski <cezary.rojewski@intel.com>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Thank you for keeping me in loop. The patch looks good.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>

> ---
>   sound/soc/intel/avs/core.c | 24 ++++++++++++------------
>   1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
> index 0e750e9e01d9..8fbf33e30dfc 100644
> --- a/sound/soc/intel/avs/core.c
> +++ b/sound/soc/intel/avs/core.c
> @@ -612,7 +612,7 @@ static int avs_suspend_standby(struct avs_dev *adev)
>   	return 0;
>   }
>   
> -static int __maybe_unused avs_suspend_common(struct avs_dev *adev, bool low_power)
> +static int avs_suspend_common(struct avs_dev *adev, bool low_power)
>   {
>   	struct hdac_bus *bus = &adev->base.core;
>   	int ret;
> @@ -673,7 +673,7 @@ static int avs_resume_standby(struct avs_dev *adev)
>   	return 0;
>   }
>   
> -static int __maybe_unused avs_resume_common(struct avs_dev *adev, bool low_power, bool purge)
> +static int avs_resume_common(struct avs_dev *adev, bool low_power, bool purge)
>   {
>   	struct hdac_bus *bus = &adev->base.core;
>   	int ret;
> @@ -696,41 +696,41 @@ static int __maybe_unused avs_resume_common(struct avs_dev *adev, bool low_power
>   	return 0;
>   }
>   
> -static int __maybe_unused avs_suspend(struct device *dev)
> +static int avs_suspend(struct device *dev)
>   {
>   	return avs_suspend_common(to_avs_dev(dev), true);
>   }
>   
> -static int __maybe_unused avs_resume(struct device *dev)
> +static int avs_resume(struct device *dev)
>   {
>   	return avs_resume_common(to_avs_dev(dev), true, true);
>   }
>   
> -static int __maybe_unused avs_runtime_suspend(struct device *dev)
> +static int avs_runtime_suspend(struct device *dev)
>   {
>   	return avs_suspend_common(to_avs_dev(dev), true);
>   }
>   
> -static int __maybe_unused avs_runtime_resume(struct device *dev)
> +static int avs_runtime_resume(struct device *dev)
>   {
>   	return avs_resume_common(to_avs_dev(dev), true, false);
>   }
>   
> -static int __maybe_unused avs_freeze(struct device *dev)
> +static int avs_freeze(struct device *dev)
>   {
>   	return avs_suspend_common(to_avs_dev(dev), false);
>   }
> -static int __maybe_unused avs_thaw(struct device *dev)
> +static int avs_thaw(struct device *dev)
>   {
>   	return avs_resume_common(to_avs_dev(dev), false, true);
>   }
>   
> -static int __maybe_unused avs_poweroff(struct device *dev)
> +static int avs_poweroff(struct device *dev)
>   {
>   	return avs_suspend_common(to_avs_dev(dev), false);
>   }
>   
> -static int __maybe_unused avs_restore(struct device *dev)
> +static int avs_restore(struct device *dev)
>   {
>   	return avs_resume_common(to_avs_dev(dev), false, true);
>   }
> @@ -742,7 +742,7 @@ static const struct dev_pm_ops avs_dev_pm = {
>   	.thaw = avs_thaw,
>   	.poweroff = avs_poweroff,
>   	.restore = avs_restore,
> -	SET_RUNTIME_PM_OPS(avs_runtime_suspend, avs_runtime_resume, NULL)
> +	RUNTIME_PM_OPS(avs_runtime_suspend, avs_runtime_resume, NULL)
>   };
>   
>   static const struct avs_sram_spec skl_sram_spec = {
> @@ -893,7 +893,7 @@ static struct pci_driver avs_pci_driver = {
>   	.shutdown = avs_pci_shutdown,
>   	.dev_groups = avs_attr_groups,
>   	.driver = {
> -		.pm = &avs_dev_pm,
> +		.pm = pm_ptr(&avs_dev_pm),
>   	},
>   };
>   module_pci_driver(avs_pci_driver);

