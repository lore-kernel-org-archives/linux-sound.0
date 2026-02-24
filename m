Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C9127380A
	for <linux-sound@vger.kernel.org>; Tue, 24 Feb 2026 15:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771947278; cv=fail; b=a/Os3ahGnL9yRRNyK1PHN4BEDu7wJk5elKUpt/gzeghAvh99EcolsEXDs7sVrBkE9CBGOwA+Qc3ioYRKnokIW6BP99eRPTc5HFIqr5+QgziQ5GLkSzWHYYMCnuUw/nR+pX3ZyH/311iNMWlCvDzCe+hzjQShXoIpepfOoIRwCdc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771947278; c=relaxed/simple;
	bh=ethVra6K11C29zQ4vmfIu++vO+2lSbX4xAuElYHcjtE=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=I5MfFh3oFnpGKJRzaH4jOKQqooRXeMGPgvTIjilwwDELucGf1uU6E2sqFQSI0D3T/8G9XKPudl4SNtxKc0iW57cugwmkm07V8ouBtFNbe5b+WMTSmik+nRQdiUY178H2vMIVnUFxD7hdvOJllRikUThYzYxrG0IJq8V5a51sz1M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gxgrS2DJ; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gxgrS2DJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771947276; x=1803483276;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ethVra6K11C29zQ4vmfIu++vO+2lSbX4xAuElYHcjtE=;
  b=gxgrS2DJGiHDlKoHwtzCQ0MTdFNsci7uwVL/IeAhBJApSDbUWnO8pWRx
   YUk6GbPh6kAZn0W4lyzwBgKyPMZn++niYa/V+vGV7xcm41aaeWWYisxbd
   iiFIIHvOhRsEznMubLinXBkvQOep8QNqyovVIuIYsrrYpBPeQnmPG7n5U
   CrQG5+265axVlgnbB0EYf+K8vOMwwY5tdceKVjV+TK7vXh54WC5kUP40i
   qF501YgqzWIQr24NKFhi+cZcPSBpgFW4oF/HPtYhdm6OuZG/R5/fa5r2E
   sriYra6D3UOyRZxeO+YcloyVuRniWanREuQDuGMFbX6sLGRzeNd1syRP/
   Q==;
X-CSE-ConnectionGUID: rKkW2maQTEmvSbHiLdKtJw==
X-CSE-MsgGUID: KZo4tRzARzSSGBgvNsYe9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="72840847"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="72840847"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 07:34:36 -0800
X-CSE-ConnectionGUID: xayyihKwSLuo/1p7fba24g==
X-CSE-MsgGUID: qXJ6QmTkTHm3rNyX9MYi8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="220050689"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 07:34:36 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 07:34:35 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 24 Feb 2026 07:34:35 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.57) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 07:34:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PuKBs21z5w2+zpsG5l8slks/jIYLND7BCRToq27aTjs/uEuIGfR0P1Kas35Z0Ar6auKqNmGCnGdhDBf41e5EHH91UOADndg9NNEzZfRYDG3WibwLAeMcKZbN8qarBJxnhHqxtZ4GdTz2upfKN87M5BCL7HlNjpNIud0CmpBAPoRlv2GaCKww22CqAHhIZ5TiT8aWpmd5XCo6APxT2E0JfXK5hAF9XxaRVfbLZ0cwMAn2LYrn9trz9s/+btj7+RSv6YQ9wKIapdWpsnXZ6TTcaHK/AGW75MKdHMiPmPqFw3QP2vBaWO4qmHfN7GSqu8EywoRa33jl1rXX4J4phRG5rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XgDVOmOE7Lacy8+MZAYPjuCCPX7l+7zazV3Cj4Kkon8=;
 b=kUbF5pp4jP58UTYPhxlO2nlBW9kiaXInzEhae+PMqKE7Gze1LC6lHtWiCjLI+lh/rc/MqAHhKXx1YikUH1nSRjpalrkqz2tUVlRvIa26Ks3Spd2HhWiC/+9ByQbkVks4q8kufPOyNNGd/4lpkmcuqkGhCJDuxSFnd2TjSV75hNjQAGI43GdawPJmu5t9YSSOfjIg6Lf/1lhvBqoDbX9RIL2BVVQDceuEuDvCvYxH43gYBbngijE9E+ZMRVqM63TVpU2REtIcstm3Pw1eeQ5pExZsbAe9FeBZrkbLkjsei4KKsxWWBi3ZeKsQ2FBzHUAfXN1LyyUazUh1KfAROES/GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8283.namprd11.prod.outlook.com (2603:10b6:806:26c::16)
 by DM6PR11MB4676.namprd11.prod.outlook.com (2603:10b6:5:2a7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 15:34:32 +0000
Received: from SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214]) by SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 15:34:32 +0000
Message-ID: <b0ed451e-9bed-42f0-8630-637d35f46170@intel.com>
Date: Tue, 24 Feb 2026 16:34:25 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] ALSA: control: Verify put() result when in debug mode
To: Jaroslav Kysela <perex@perex.cz>, <tiwai@suse.com>
CC: <broonie@kernel.org>, <amade@asmblr.net>, <linux-sound@vger.kernel.org>,
	<kuninori.morimoto.gx@renesas.com>
References: <20260219094614.504459-1-cezary.rojewski@intel.com>
 <40c8dde9-0801-4bbb-abdb-fe7be4df58ff@perex.cz>
 <3839a346-5b5b-496c-97b0-3a556a570b44@intel.com>
 <a9191fd3-1317-4b76-b35e-367afeccf1de@perex.cz>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <a9191fd3-1317-4b76-b35e-367afeccf1de@perex.cz>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR09CA0147.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::31) To SN7PR11MB8283.namprd11.prod.outlook.com
 (2603:10b6:806:26c::16)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8283:EE_|DM6PR11MB4676:EE_
X-MS-Office365-Filtering-Correlation-Id: a5efadb9-6921-4458-29fd-08de73ba3459
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WG4wcnh0V3Rmc0Z1ZFhTTWtRU1IrbVIyNEl3NGwzb2xWMXcwOGpHdlNUT0s3?=
 =?utf-8?B?ZUovYjllT0pRMHJHMTh4ajVUWHB4WmtrZnhrV3RsdHE0VHkzODE3UkN1L1pv?=
 =?utf-8?B?MUJkdlhSVkFOUjNkNUgwZEZyamlDRkdEZ1phdlFpaTUzUFI5SzJZdmFFTElB?=
 =?utf-8?B?RGoxaTBSakNrQkpLR0JFYnd4S3FEdmswQitXVFJSaHZaaTdGWHJaS2dCcTZU?=
 =?utf-8?B?aGxhbEVVWElBMXNuUW4vUXkwTGpQM05MYldrN3IzTURER2hEdUpqVGI3Mmwv?=
 =?utf-8?B?b3NaczRuVXlVNTkxUHprTFMxeVo3SmFXejZHOWtSdFE1S3FqUGVMbWY4MEpy?=
 =?utf-8?B?L3VRbHBETDZNYWhGWElrRnFaNDl6MDZxNGx3TWpxb1MweFRuSFVUcGRQOS90?=
 =?utf-8?B?K0F3Qm9OZkFIQm43SGp5eml0MjEyc2h6K3piMiswTURxNERtZWxjczI0TVg5?=
 =?utf-8?B?ckpEd1prREk4ZS83b3RYVzNUdVd6ZzN2b3RqMVJNNENSdEhvZlZCRGZadEF5?=
 =?utf-8?B?N29ha0FMODExbGQ0MjZ2MTRnOHB1aTVsNXdqeDFuYXIrQzFteWxJRnc3azBS?=
 =?utf-8?B?KzJPR3FReSsyU2o4YkVNVUdEYjBsRFJmcmVZMjR6NVJ2UC9rd2RuUXpjQzJK?=
 =?utf-8?B?QnB6NmdWSm1XSzQ0UXRSdUdsdVd3RWFiVFBUbGM5bkIwK09zRmUraTdMVTIv?=
 =?utf-8?B?dmczZ3NFZ1A0QmZQaDY5cHFwcnM1NnF0aFpkQkJmWGFFUUg5U1NuSEI2TlpN?=
 =?utf-8?B?SGtEQUtOcjJNSmVkS1BQT0Q1K0kyS3U2RUZRS2NaUjVWWmpyUVJITHZQVVNB?=
 =?utf-8?B?TjlQWVN2NFUrT0tOL2NFanBhTDU1b3YrWjdLLzdNTVJRMGRFOVVpWi9KdkZn?=
 =?utf-8?B?Tjc1ZE9vdW1RbWJLd1krYzlZYUwrb3J2dDFYcUdvakhINDRNMERTRXpVSTJV?=
 =?utf-8?B?NlY0WlV3SUlheGpsbnY1eVhCWHNvUVZoOEpWY29OZFVvR0VtcUl5Y09xKzR2?=
 =?utf-8?B?ODJZaVIvTDdCSU93bjQ0SWwyWlNuWEw3WTN3ZklrL1VDRG5wU2hWM3pzMFV0?=
 =?utf-8?B?TWJ2RkJ2UWduZDhoNjRmZi84QmhJY2FWSDBwNTAzL1ErNjRLSVBBSmRFNVpP?=
 =?utf-8?B?RVZuazdRU2VXektSeDRhU1UxSTlMVjVPSWF1R0kxeURudWxLRjlyQ09KNXp6?=
 =?utf-8?B?TlU3YzdsalB3QjdNektzRWNndUlFRjAyWE0zNFdqTVBCcVJSL3VyQjBIL0M4?=
 =?utf-8?B?bHpENXppYktKYkppQXVpUHV6TXZCeWUwcUN5a2tJaHRuYUZEZ1pKY1oraERU?=
 =?utf-8?B?WlRLUkM2WkJ3ZE1RSEkvWCs1MUpUZVdObkVtZGQ5eGlRd1I2WjB5aENtMDcr?=
 =?utf-8?B?VjVUOXFMckRUMTRZMmNhbHhwdjhVWUR6eE1EbXJONUExbkwvbi8vbEZNcyt2?=
 =?utf-8?B?WjRKc1g5UUcvOWlVeFprN3lZdU8xMXljaGtYUHhpcEVybWRGTzNzNk85Y0Z5?=
 =?utf-8?B?cmtrazI5b09JK0ZKektvRlFWODZ6WU5FSDd2RDJLYkZ0ejlLNHBiRE4xS0xE?=
 =?utf-8?B?RExHNW1RenE4U2hFVmlaSlUyY3hsaTVqa0xXTHdhYTdrSVZlRjExUnBrTjQv?=
 =?utf-8?B?d1YvbGlLL1hTcUw2NkVlYVI4TThkWGtvWnROdU9GbGY1NGc5RmJES0NoMGpU?=
 =?utf-8?B?dVN2SWI5Z1B5RTNxSWRSa2gwbTJvTURFTlhyVXlMRDU3cGs2SC81ZC9kbVBi?=
 =?utf-8?B?VWhUN2FTTk80Wkwvb0JjenBueDRzSjRadDBXMFdKTzM3Mkw2aFR4MThMbW95?=
 =?utf-8?B?cTlDSDl2N0hzVFNCZk1HYlhSeWp5V2RWdUJiLzBwTkYwcXo3MmFhcTQyWlk3?=
 =?utf-8?B?eHdaV2RsYm5ISVV3K0NKa2NlVDBGelhJQW9IOVFWSy9USnhJY0w4NUpFMzFy?=
 =?utf-8?B?OGFGTW1WcDJOaDhGaTY3OTBvUjhQa0VTcU56NW9FNkQ5QlhnckdtZzJtaWJD?=
 =?utf-8?B?VFlaWWxneTFEM1hDTDVrT0xxSWhNZDkyK21hWkNWVDdZY1BxRUtIcGhRY2E5?=
 =?utf-8?B?NTI4RExZZFdOb1UvNXQ2bkhRVUNPT214bGZoTUorNkRJVXpKaDBPNENjK0NM?=
 =?utf-8?Q?x5i5voziZXV4P6e3TojJ2xhRO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NlNmdlc1RkVFNzgwSExVR1N3UEdtQ09xdXBUQWtXbW1ZNjhyVkRQblRaMVIv?=
 =?utf-8?B?TUlwUFVSN0RsSkZBQ2hWSVlmRnBwbGFieG95dzJ1cHlwTTYyMEpnQnl4bXdz?=
 =?utf-8?B?RFJtQnJJaWhoVDVTRmtIYTU4VmUvd0dCcmsvdUJkUXRtTUtXeTJvWnNpdXR4?=
 =?utf-8?B?bjJDNFRoMUtzc1NxME1Lai9uMnVsa29VdmhOUWRlNllJb09lN3VZQnd6dzYz?=
 =?utf-8?B?SEpKNzJ5eHR4bDlPQjZpaVNNN3M0RXlBN3J4elI1K1Z3Q1k4V2pSMytKcmgv?=
 =?utf-8?B?RmxkeVlKVlZiTlZPYlkzUjFCajd3QjVFRjdUdm1ZNjNxY0xSRFZwK1ppOUt0?=
 =?utf-8?B?cUtmbHE1cDVwckcxcFBVWkVjK0c3Z29aSW1xSXJNYUlZckdDQVVzMXNYMEQy?=
 =?utf-8?B?VVV1MDhRRG9oWUpwRVViOHczU1M1aWhiVGQ3VFozaHFVSHlsMGt0V1NJcEU5?=
 =?utf-8?B?V3hsU2FjaHlzUjlpMmZEdHNsZzZvNE1lK3doZXY3cmUzTlJUZDlTUW14M0Fr?=
 =?utf-8?B?K0RlK1VUMWxVdVB1d3R3cUZjdUs5QXBUUW93KzNpTDE2M3Q1TVZIeGk2V2dr?=
 =?utf-8?B?a2xPUGZ1Yi9aREEzR2hvQXBPd2RTb0xxS20zaU5Lb1pxS0ZORU13c1pOaW1D?=
 =?utf-8?B?TUVMOWdwQkl6L2V1czU4dUN2REIzVk9tVDY0cFZycmpia1haVFJjeDhIc2kw?=
 =?utf-8?B?Slp2ajZKbFp6TjBTRUNOSFp2NW00bUlTdThLU1FZb1VtQjlOdGV1dmpnNHov?=
 =?utf-8?B?RHVDekU1RVpmTGNQejZnajRMajFJUVVZSzhsaS9Lb2Zhb3V1cXJQQkpqbWsy?=
 =?utf-8?B?SnF1Rk5WODlDT3BTZk9MdVJQaGRFVkMxdmxTVndMMkJROThwSysvTlBtL0hT?=
 =?utf-8?B?Nmh5M0FrTXZ3VjlxcCs0WWw3ZFdibUwzSUFpWmJxVU1oNmEvbjVFM1lBdUJW?=
 =?utf-8?B?Y21vUkFPNjk1NGQ3VU9LVXZzbFkrU3Bnd3F4bGVqWkc3SnAxNEY1NXp1di9j?=
 =?utf-8?B?clFaMGNwTUt3a25Ec1RWVExLc1VSWkZCRFJrQ0tJOWllOHJJN0J3d29wMS9Q?=
 =?utf-8?B?dFZKalovRmJQQ1RtRXBEeFBBeGhDK2dGbzZVTjFEWG1oYzZKYiswcXVkOHAr?=
 =?utf-8?B?TldTaThpUGpFczladjRsLzdmc2pqR24vcFQ5MUt1UVl2NzNKSHVRQlpHZGFC?=
 =?utf-8?B?RzZhSnhiMUdBZW1POHZCeDdtV2EvUFRNOGtRdmZQMjFYcG4zc1RYWFpaSU52?=
 =?utf-8?B?Rkl5Tkc2RHB0b0RuYlF0RjdIME5ZY3hrTm9YUTIzaE13THlMR0pML2t5ZlJo?=
 =?utf-8?B?UkdUbzRXdFRoRENUUjVMSkVkc0NYc1JudGQ1d3MrNzZyQis2VzNZZ1dPNFhn?=
 =?utf-8?B?VWVPUEprK0F0TnBpQ3VDaFRCMHZCVk9TSFZjQW5tNGhZMUw3ZFZJbXFxY0ll?=
 =?utf-8?B?TXNmRTFERUh0cnh0TTR0ckMvUkQxR0FDajQrSWVHTDQxS0tOM0wzbE16WUhm?=
 =?utf-8?B?VkRIMjdxM1JJRWduN0laUXVPNWhuYW9VVHNsSWVuODRYTEwvQVNkVzF3Mm9n?=
 =?utf-8?B?RjdmL2RvWlFreTFJM1RnTUN0M095K001QVNWMzFObHg5L1BJV1FYazNjV2Jx?=
 =?utf-8?B?aS91OGZ4YUVZN0VOWUFGaU1TQzFwcTQzbTN0YlJRMjAvb2RNNG5kVVpYNExW?=
 =?utf-8?B?UXdIV25CaEJ6VTFVemdNczI1UmJuLzg1aVJZMnRyYlQrdGd5TXN3NXBjeEFs?=
 =?utf-8?B?M0I2TERkUFdrOXh1dE1udjRWRERNdlRXQWsycWNhbFhxV1Z4Z0FzaG5QR0lQ?=
 =?utf-8?B?YkhmK0VIcXZZK1Q4UnJFWkpnMWc3NjRRMWd5b21WK0o1YmJaUkhXQ2xFMWNC?=
 =?utf-8?B?cmJkSDV6bzl4bWxDVEdFcmh6dTY5anY0MFczdVVHSjRSdkhKSEZaaXdTcSt3?=
 =?utf-8?B?dlNXckd6ekY5RkxRalhWMUVvSWNxUDJqeHE3azMvQlp2SHZNT1d0ZGlnZkE0?=
 =?utf-8?B?Qk5wNkczTGsvZGNGQjN0eENwM05DSkJXVE1iRkpYQnRkcGhFLzFFWGV5M0M5?=
 =?utf-8?B?cUtqbzJnWXM1M0d5enpyWTRxbkpYLzVCWnU4OGVFc0dqSmpHSHpDNnJtN3kz?=
 =?utf-8?B?QUt6TU8zc0U4cnhVNTNNT3pZVUZ6ZGJScm5rWDRCbFFUdU4zS0NrZFptb1F2?=
 =?utf-8?B?VHBuOW9OTTJvS25QZjMyTElCeXJLYTVGK0pZZ0t6aVNYKzVVN2xnT0VFN0Z0?=
 =?utf-8?B?aXhQZ0NOM0ZEQzRzankvd0xYWDExUG1lb09hU1FBanA5UGxrQWY0Ymp0eDZD?=
 =?utf-8?B?SDNjcm5OQ3JkL0xkTWxVaFJYZ0Q4Vi9EQ1JZcXc5bm01R1pJcjZzaC81UVhu?=
 =?utf-8?Q?Fq0f3jLWQiB1wx44=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a5efadb9-6921-4458-29fd-08de73ba3459
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 15:34:31.8978
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YA3XrY5IyijMTVmkNUXqp77/RK407kVIfX9JYLrnBkus/ouW7AxeDCX6DGpikkF1uuY3XUYwtEnAY8chrzf7Cw8CTYLy607AeEQ1QUaGgkc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4676
X-OriginatorOrg: intel.com

On 2026-02-24 2:17 PM, Jaroslav Kysela wrote:
> On 2/19/26 17:54, Cezary Rojewski wrote:
>> On 2026-02-19 11:36 AM, Jaroslav Kysela wrote:
>>> On 2/19/26 10:46, Cezary Rojewski wrote:
>>>> +    TP_STRUCT__entry(
>>>> +        __field(unsigned int,    card_id)
>>>> +        __field(unsigned int,    numid)
>>>> +        __string(kname,        kctl->id.name)
>>>> +        __string(iname,        iname)
>>>> +        __field(int,        expected)
>>>> +        __field(int,        actual)
>>>
>>> Trace also the control index. I know that ASoC ignores this field to
>>> allow simple string concat (easy name stacking), but we have drivers
>>> which are using those integer index numbers.
>>
>> amixer seems not to do so. Isn't ctl's numid sufficient? The reason I'm
>> asking is that the message is quite long as is already.
> 
> Amixer prints index and also device and subdevice numbers when they are 
> not zero. See function snd_ctl_ascii_elem_id_get() in [1].
> 
> Jaroslav
> 
> [1] https://github.com/alsa-project/alsa-lib/blob/master/src/control/ 
> ctlparse.c#L117

Thank you for the explanation. I've never seen such output when working 
with asoc-based drivers. Looking at the code now I know why.
