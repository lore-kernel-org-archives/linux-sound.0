Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D22385522;
	Mon, 30 Mar 2026 08:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774860086; cv=fail; b=WHCQ8Qp8uYYcxx4Qycuq9qI4ojSHqF8jrZBUed9P7X9L8afja8wJ1JBomEOXQu5g2Nz39a5F+QgbVEsxjG54kC6ATNviWrMVGVaXpaibT1IFSpLNGV2KygMKOA/P9qJ6YCZv3OGbWH/NgaOpXGDOSLzNFSjLEnOrk76OsR9XYW8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774860086; c=relaxed/simple;
	bh=YwMW+Hy2rGzSqjUDxnzBW+fA42ZFOqKm+hE3Yk9RnTM=;
	h=Message-ID:Date:Subject:From:To:CC:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kjP3U25HcmVV7XD4lvyz07h56IZsLEL8hlmkOfWNclPEKa/5g7D2IFKmzYxNkq+TpbBhyTI/fUQDMzpZNobxpfKci5RyoGVS8hXQ4Gg2YI+sN0PFHRh/g0GvzNQI4hVPnZoackXwKNAapijk3BMSwkyyyHpn95fsgyjdQpoY0Is=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hw5q4ZRG; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hw5q4ZRG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774860085; x=1806396085;
  h=message-id:date:subject:from:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=YwMW+Hy2rGzSqjUDxnzBW+fA42ZFOqKm+hE3Yk9RnTM=;
  b=Hw5q4ZRGrwQBLKwk00vZVOp+NPWQF8jfEiLWY99CWNqbFbK8u78mZHvh
   Y+5pArtarpf04wVZFN32qVw+mny7b7cHNV/wj2ccjZ36ex7T5h80a/jxi
   4tL3zYZANdoqDq3KpjlUT9nLa2GOInKgCSrA7gKLU5s8pT4Uxs9SZUgPl
   1iMKJTzEp2HaNHr3UMTJIjOB3r8YTlMD6wBGmvNbelhzWW1a/EPIJOxic
   OM3imZxdgXJ97wUWqOA7uw37jQkB/o6VgCxbqlTespqHnLRLYdjWUh0v7
   a9MIG9eyDrfYdVqdeLG5YNJyz/hYgQ4HoD7yA5PyO8l/yZFydDCDAs/0M
   A==;
X-CSE-ConnectionGUID: VEsOdweiR/eRo9wpD2xm0w==
X-CSE-MsgGUID: +YrbTtuVT/+6Bw14Ezibpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="86149075"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="86149075"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 01:41:25 -0700
X-CSE-ConnectionGUID: is6t8x2FSR2nvzT+vYTRyQ==
X-CSE-MsgGUID: Nz8I2J+gTcOHfQjn9413dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="249036414"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 01:41:23 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 30 Mar 2026 01:41:22 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 30 Mar 2026 01:41:22 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.13) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 30 Mar 2026 01:41:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=emzTQCqTVfunfnYplrfFY5cVFUeKhlNCyN3HrHzOih0tRbzaAdRC7zXeODqkrOa8Npyyteu0UD7OhSz38KHtd4KHBYN6WogbBI+RMis2UNQlC7MObN7GZFW/GRd28/4hoyPSYFBgJ5JEQAQv9ATPQ2vSHFN+NNijwkWhaNNqdFhz/eO6xu1xoYLADx1jcG28zvGPcErwShnUko8fnokWBpjsjX1td9ufHL+CjIqiZluoDiuxHsJQhHGOtH5yl+vPkBfdV4obgoLrKAbdiXZ+6Odbj0KSLUB/B7qss7oI87uFmYpBoA2D9+viRxdBVYIa4H2MwunGOIACv8WrIUDX9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oljpA2OFDVbwu6MUf/j7QUuj3N/cVz2AHBR6ELuXLEA=;
 b=JiyCcYF01Xj0QYyYKbIAs6Xl5fXFVBfm0s5f978rgqusytrAXA+0qGQhFbQ1RygTzyQuqoJu2L6lqJQ4CY652wI8I9Hp3dJ+IOL8nkeCDAlwRbgCQ8ZQ4eNdwzDoMQoMbIA08EgtWZA9L7EKSfN8f17ZnEaZQH/gWHjjkOaQDZsR6MwL1DORkRWadLD7eX2Qo8SzUE71ikDmO2MyM2+D/QFOHb6edhm7mU+T0XWizuFnQkfcStdnSzYEplf8QG7tew2gdkUMYtpZTB+N5kWm3l5qPD/Uuqgx0XLW/qbLrgjUESPz0BuS3+zzOSy2vrZqFoQuvCKLE3hnZM6Bql6tQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8283.namprd11.prod.outlook.com (2603:10b6:806:26c::16)
 by CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Mon, 30 Mar
 2026 08:41:14 +0000
Received: from SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214]) by SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214%6]) with mapi id 15.20.9769.004; Mon, 30 Mar 2026
 08:41:14 +0000
Message-ID: <f88a00a9-548a-4b8d-8065-3122f7e0236b@intel.com>
Date: Mon, 30 Mar 2026 10:41:08 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] ASoC: Intel: cht_bsw_rt5672: Fix MCLK leak in
 platform_clock_control
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: <aravindanilraj0702@gmail.com>
CC: <liam.r.girdwood@linux.intel.com>, <peter.ujfalusi@linux.intel.com>,
	<yung-chuan.liao@linux.intel.com>, <ranjani.sridharan@linux.intel.com>,
	<kai.vehmanen@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<perex@perex.cz>, <tiwai@suse.com>, <linux-kernel@vger.kernel.org>,
	<broonie@kernel.org>, <linux-sound@vger.kernel.org>
References: <20260328052556.434191-1-aravindanilraj0702@gmail.com>
 <20260328052556.434191-4-aravindanilraj0702@gmail.com>
 <8ee3c081-cb33-4d6a-94c4-6c7fc1ba734c@intel.com>
Content-Language: en-US
In-Reply-To: <8ee3c081-cb33-4d6a-94c4-6c7fc1ba734c@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P190CA0034.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:2b::47) To SN7PR11MB8283.namprd11.prod.outlook.com
 (2603:10b6:806:26c::16)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8283:EE_|CY8PR11MB7828:EE_
X-MS-Office365-Filtering-Correlation-Id: bbe29737-7626-4f12-9b5d-08de8e3819f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 9Uldl/WwssNph9hjS/y49mfyQCaa+strE5CpwVHQ07Qt7XPh7jH22hYc0Pq5MuCJDcAY2RnmpY/GAXWIOyT/pWOkDlxrLcR5gEkJIWq6n4PjXG7r7tH2JsjisTxAXGUVNGzlq0gdeBF/PTvgXtr0IY2myfD5/LLRrz4Tam0+ZU7jYHYLxAtTfolBBbbs9e2s3ZKT+fPQPV2JvkKVrXMM8D1CZqvSTrMV2KkxtahVUCtCErK+B/FvmiUP0MjtRFAf6YPyg+mOeRcMJwVezwZJFAtY5cmgi9cjHpb+EPlIovzs3C86TwXtzRK2zGazTkXdfIG67bdEcoRXQTVwhxi4DFyCEh3hCuEb/eDmBdTVF93OESzCpb8WWWTeFtPR3rZh8w3c2bUUw8ecwOhobkU+qIzjBkH4SWFNxWBr/qgrX41+HTRX2Jbz6zoW7VGInK8tmecV45NTI7k8Ok6XLUsuawfl50o3IT5KHN4SXB3gSd7sWIBlmI8GiH9ZUInqFz0JJRj14qkBhkTOQHbsJS+xQIaYnTjAYMDORiLuXj03FZhTiemc9TwY0k2+9fvEQ4tb4aSNMuVmKTZTzh/Kp2hx8vH6cs7q+v/EyNzAtFPQ1vgyfQp4uxR+gGWFIYCL+Fzc6s+qfDiBdU0GVyOlIOAPKqWmKIJPqYnTbtdKQigBswoQTtVmS4VZWELZ3H12IR6qRg7xAcOCjpsFe6NLiFkAWLBCaFHb802BV529zwFRtUk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?amtyc0o4Ync1NEpmNFMvR3hXRGpJVjBLOGtSbm5hUGlaTk5GdEF3ZDRwWUdl?=
 =?utf-8?B?VmNDbjl2NFNzMXowRDhNME1sQmJGdWVkVE9icEhaV0Q5cXZtc1V2WVd6VWZ2?=
 =?utf-8?B?ZFg3TDJFblVxZlQra2t1cDJOZTBiNTZmUVE0VVFhTEtrbFNSZzhPV0lNQnNz?=
 =?utf-8?B?eUZLby9URnplbjZyQzltNm5YdnI5c1h0Q0pvZGtuWGtuUm9BRmUrTDB0ZkZC?=
 =?utf-8?B?NXk0eHR1VTMzcFRUWG9QZ1JteGtFMmM1VW9MUXNFNnBOVDNqNk9nNTRJQ1Zt?=
 =?utf-8?B?WnEzSEtpYWFPNUZ1RURySXJ1bWNyNlFvMmtzN29SN0dqRWd4VnhSYkdWL0lS?=
 =?utf-8?B?OUxPbHRPanFTMlhIemFldjB1d3IzNlZIblV3OHJ3ZVNIUU9jMS9qK1ZXc0cx?=
 =?utf-8?B?aUErbGhTVkFnUWZjNkRKZ004SGVJVDdnRTRBV0x0MnJxbTFncFJYaWRuci8y?=
 =?utf-8?B?TklDdDZaY0VRZHA5M2toVUszM2w2a0dTbkNCcGJDSDBnYzd5SjZqcUxMZWxJ?=
 =?utf-8?B?ZzdOOUxSdmhpeGZxQlpvbEE2eWtVYi9mQWZuV0d5ekhiNDI5cGh3M0RWN0wz?=
 =?utf-8?B?WUM1b012OWNQYlhoT3dTQm0zaUgwWkxhZkJlaWVFL3pXNjB5bXBwaGVlbDNQ?=
 =?utf-8?B?VlFVM1NObnJ5dVdiKzVYOHNVN0M0T3oyMjQxdk1RUTdPc2l1SkZ2d2FOa3ZT?=
 =?utf-8?B?UmRVWkhoY0owNFduVFo3enhlazdsQ3pzejBoM3k4NlllS3dneXFXWEIxREw3?=
 =?utf-8?B?YUhtRCtBbGxzbVNwbThqdzVSWEhaS2QvZ3hhdG96a1JaZ3I2RW8rSHFlVm1s?=
 =?utf-8?B?bkJqUmtabUllM3JZeW9TcU9Xdkkvc1BzcnhRYS9lblRKRU1RQzJrbkZDa05a?=
 =?utf-8?B?TlpUNjBZUUY0MSthb0Y0L2xQdkhGMDYxb1BXMHF0dEhaS0VOSGdDUWZoZ1Mv?=
 =?utf-8?B?eUJIZXFJR2svb0NBUVBucy94OW1UVTBCbXNqSnVrTktURHBiZVdHNXBlcmI2?=
 =?utf-8?B?RzRsYWdZRWxJbnRBNjh4ZVF2OTAxVHdRYmd2SFpGZUFXMmpESXRZZ2NySnpq?=
 =?utf-8?B?NWJRWnQvTFYyTytiZWlPdEwrdHAwMTQ2cVRpYjBiZmRFYzRPRGpiK3BXQ0xN?=
 =?utf-8?B?RmNnVnFmYVBVU0Rnd0h2azh6dFNjeStGV2RiVzBJNlhHbFNkWk0wdkdnTkxZ?=
 =?utf-8?B?WCsvMXQ0MkIxMFFjVmJFc0dneEwwTU1nekFMZWFiNzJlQm9ic3NJN245WGlH?=
 =?utf-8?B?SEhTUWttTUN1OVVLckFVWW0wcVdCTFFSYnRkdTF3NEhhckcxRVhxOHFrZG15?=
 =?utf-8?B?VTFGOVJ2UEZLY3pVTDc4V3BaMCtVU2ttd0RRYkpmcjRKU0ZvUmFOVkpJUXFB?=
 =?utf-8?B?RUI5ZG9aZDc2V25iR253bXRqV1V1M0h1NFQ2QUtYZUF6VGRTZGphYjlDd0M5?=
 =?utf-8?B?Tjg5YStIeERhY3JnRmFRcDk2VjZmejVkR0VrS2RPdHN6NHlqYVNLTThraW45?=
 =?utf-8?B?eGdIb3BMM090aW12R2pqdXRsc2ZHL2Nnb2gvTWFlaCtTSE9aWG0zTGtrTUoz?=
 =?utf-8?B?dXNITHh2c1BHUnlUMjI1U3JJanN2THRiNHhkR3lvOHhzV1N5empIdVUrS3Ro?=
 =?utf-8?B?alNtS2FZV1NqVzZScGQ2Mnc2VGI2cWhYL2lLc2Rpejk1N0doWnhtVmdCdGJl?=
 =?utf-8?B?d0x3OGVxRCtOVGRiZkNGYTZoZXVaOHFnTG1PSWhKbVB6TmF3VVZ5Mm9mREh5?=
 =?utf-8?B?K3BxdFBEQUs5WVFpQUFqU0tMRDltdHN0VFVVSVFiU2dOWEFXaThyZGY3Y2kx?=
 =?utf-8?B?cFhwNGVGWXpBT2tWaUxFdFNYUDNWMENaaFI0Z21QWnR5eHQ0dW5sTVl5bEJr?=
 =?utf-8?B?blRBVWhTMTFZci9GdDViYVVmS1hGVnlZbXFhUS85RjVuRGcrZ0Y5MlAveUQr?=
 =?utf-8?B?RWpjZjdJVC9GaGQ1TEpMdkpidDNpUzUxTXRMTm1BYUNSTHkwS2dON2EzMkdj?=
 =?utf-8?B?dXNLNi9mZEZOOHBZUkNFeGJ1NGJwOVgxcG5SNG9YREVCQTJrdG11Y3hjcVc4?=
 =?utf-8?B?ZERZNU1TOHpibWxrTCt5RU1pakZjNzFGTER5NXFhVGExVk1pS2hJY1pxMDQv?=
 =?utf-8?B?OHY3YzFpQnRlMHBVVTdDVUtxZHpKenMvNmpLVUhVUktlb3RjZWtWSCtXYUFL?=
 =?utf-8?B?UzRUK2NxaFU2bGU5RzJaMjJYTHhmUnZKSFZ2dURyY2dTWVlaZGx0LzhqNk9v?=
 =?utf-8?B?WG11ODNJa3V3d2tIYmVTU0R1OERlRDlDL0FNMHhvVldEeGtQdUpNeDhHWE8w?=
 =?utf-8?B?c3Z1RUZyUS9QWXFqQVU5cHo4T3JYL1g4MXU5MnBPelJOU0d5RUZSblZrOUVF?=
 =?utf-8?Q?osy4IQ6AdUh4Z9B4=3D?=
X-Exchange-RoutingPolicyChecked: Br8UCR6x85mPh46wLQHVs9QAaqwIfPjjPTnZvLgdoDomETKp0/eq7P1ARpq3ndFsXkqlvY8DZeOcCVtlZ77gSvmdbs5CEUaFQGTSb3Hfxjm+dtcyZHQvxM+LSFLWM/qXTxzXI5Ea5XncptA1vCNTCUUBMao0CM9FkO3CbMOCBbyUtHZhxV5G/CjfG7Evm1n3R03cEkrKvado65M3LmZ5RVTovNxmGRI2In5jOzCv4RqZZCrlXUrSSLeWEG4VZxpZXggCnGV3sBE98XuYW2/W59C4zsV20QnzQvinOM8BJiQfOekPH3FGhkDy3QCCrDMXSDnNuHuk5rc8diTQRHwmRw==
X-MS-Exchange-CrossTenant-Network-Message-Id: bbe29737-7626-4f12-9b5d-08de8e3819f6
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 08:41:13.9950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FdSHeHtVOe7QiwGNzBpLqn/ZxEl0ulcGciAcUDWozLtiOdz0iR5qCJ0dTlTcplpsgiGE4xgtqmDfw7DoNg576qzSM2jGS4qVt42xyNWNDjU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7828
X-OriginatorOrg: intel.com

On 2026-03-30 10:33 AM, Cezary Rojewski wrote:
> On 2026-03-28 6:25 AM, aravindanilraj0702@gmail.com wrote:
>> From: Aravind Anilraj <aravindanilraj0702@gmail.com>
>>
>> If snd_soc_dai_set_pll() or snd_soc_dai_set_sysclk() fail inside the
>> EVENT_ON path, the function returns without calling
>> clk_disable_unprepare() on ctx->mclk, which was already enabled earlier
>> in the same code path. Add the missing clk_disable_unprepare() calls
>> before returning the error.
>>
>> Signed-off-by: Aravind Anilraj <aravindanilraj0702@gmail.com>
> 
> Thank you for the fix.
> 
> Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
> 
>> ---
>>   sound/soc/intel/boards/cht_bsw_rt5672.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/sound/soc/intel/boards/cht_bsw_rt5672.c b/sound/soc/ 
>> intel/boards/cht_bsw_rt5672.c
>> index 359723f2700e..e5806dc16ff9 100644
>> --- a/sound/soc/intel/boards/cht_bsw_rt5672.c
>> +++ b/sound/soc/intel/boards/cht_bsw_rt5672.c
>> @@ -67,7 +67,7 @@ static int platform_clock_control(struct 
>> snd_soc_dapm_widget *w,
>>               ret = clk_prepare_enable(ctx->mclk);
>>               if (ret < 0) {
>>                   dev_err(card->dev,
>> -                    "could not configure MCLK state");
>> +                    "could not configure MCLK state\n");


I've overlooked the string changes.  For all three leading patches, 
please ensure only clk_disable_unprepare() is part of them.  The updates 
to the dev_err() make the patches non-atomic and you already have a 
dedicated patch for dev_err() - the fourth patch.  Do those changes there.

>>                   return ret;
>>               }
>>           }
