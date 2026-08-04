Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C139E47D45B;
	Tue,  4 Aug 2026 17:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785866351; cv=fail; b=JVeWrAiDseYwFygT43Uy5osFuCrIvnDxlPdkys9sAOAp5zP7OouN3Q10IFwJqhDr6Ld/TQxJQtXnRNupSpdrwK0QMEjQ5cSqaIevicJnLcli8zS8W0Bb9zqtOybUJOTugLQOWjwTPubTm8UmwsECmDTG6b1r+wGirxxNNHAg82U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785866351; c=relaxed/simple;
	bh=DeNWXHnKfFB4jSiW+l4aOF51ynEXRnhMb/wJljSPDKI=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DHJPiBaLWWi2gj5K2gKGLEa5eez/ABam4fJXbo05GFA5N5ihYNwnc2YkL9pUj8MXsUtn7PZB+pKzFWV9xyi7No+O8rE2sp3eQZesc3f8JmwEYVgdxpebK3Q6cLKOW0c26zCY24RWFSoUNY0zOmVYOGVD64uXoZKeFltjw9/pTGo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kjl7PSbA; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kjl7PSbA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785866348; x=1817402348;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=DeNWXHnKfFB4jSiW+l4aOF51ynEXRnhMb/wJljSPDKI=;
  b=Kjl7PSbAlz3h0duDfUuHaSSrMulsHYRp3tCWPV/cBQLv0COoKneMZUBL
   DsXU6k/pbKhyTR/czNKVUuAlcT0yhlNeVTuO/v4lUpE4sZJJQjLuQSnoj
   xK/Qp+H6mhTEIU+hFSWF3R5YU7iPMAt34ma61WVckgM6yaq9mlrV8ylCH
   8m/g9ti9O8dTWVfhbq2rLprpYTzw851MVLzq9/0JsoROuBPv7GLuqU4oG
   F+p4f9aaBqHAyDRNBS+pEuxB6ZvRL/V8PnynJWBITynH7q2B7aeVcev4h
   2hhPgVo/ZUtjzF5nbJVN8D808m1Az9Hb/f70ctNZKS+wbLgaEH/cfsCUK
   A==;
X-CSE-ConnectionGUID: OqB3cZ9ZRGe/EF4YqAPIiw==
X-CSE-MsgGUID: dMrXDA90TgSFk4efkBxdrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="97586650"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="97586650"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 10:59:05 -0700
X-CSE-ConnectionGUID: kwtEkWPcSD+Qqj+PN4y/Sg==
X-CSE-MsgGUID: rxDAVRlDTGSuolcY8k63/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="258231905"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 10:59:05 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 10:59:04 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 4 Aug 2026 10:59:04 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.39)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 10:59:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vb6Xfv+0YZebe3kPvUCPzgvCydr7mqFS7jgYwpNXSVQa2NGChSLWU+SbaVeVDrlQuDajqAKAZiDihYpVhwAidCspZKsQwrC9USpZg9GbeYFPkU34JJ8CmlgCyW8bMbw/3cnGXbXdZPunNfKD+6s/wrxOOogDszdgAZrS+xsYoAHLp8E+iqa6l3JbrnSxpP1RXWEv6O/bixr/SDvOiq4YDC4cqcmb3y6ornAfeTvPDVZ2cKzAZU32Zo4tAnpFrre2OSGyLNymA+aWh7nNh6HH4KH/66BkXWLqGZ35WciJDqEIj9zmetN2F6eJc7y/7G/RVk9FmTe8jGMUl0SzI2GGdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l78kWOtkRH6xFvp1r64pudOMtE9TiCD+ld4aultD1Ig=;
 b=wFoybl7e/UFbhUgUNQXfWcsZ2lIHMacmM0mAHrT+azaQNWxgMYkdrTGFJBc8lNLIveotCf2EjcqF+OGEozpwRhiLArgkjvwMtpPieVvHIF4dsmCiiDitmc3uuDshax6/qd4G3UTcoYdR2TCf8J5qwOxmnjHKCd3Cta+H4YsF8rfwpAzqB6cLcpFO1jZHGJ/Y4IeYCOQD0//6n7GJiq2jtMNhEvrxmGYmpdkqNdFQPvKWa1cCddUPftM78pMtM3XFig0zKQOyBGQXD+pHDnzBw6taFHt7dVCkPhoGFeJ5MNhSPR79Y376pThsJonzoYl0yzcjHUEvziI7Zj/OB5mA9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by CH3PR11MB7204.namprd11.prod.outlook.com (2603:10b6:610:146::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.16; Tue, 4 Aug
 2026 17:59:00 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%5]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 17:59:00 +0000
Message-ID: <d591a3aa-fd34-4617-9aaf-1afd698888e5@intel.com>
Date: Tue, 4 Aug 2026 19:58:54 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/7] ASoC: qcom: qdsp6: add topology-driven Audio IF
 support
To: Mark Brown <broonie@kernel.org>
CC: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
	<linux-arm-msm@vger.kernel.org>, <linux-sound@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Srinivas
 Kandagatla" <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>
References: <20260804070307.117119-1-prasad.kumpatla@oss.qualcomm.com>
 <20260804070307.117119-2-prasad.kumpatla@oss.qualcomm.com>
 <03f5d925-3d54-4634-bbf7-c2b29dfc7f07@intel.com>
 <1179aaa5-a7e5-40d6-804e-b52597d844f4@sirena.org.uk>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <1179aaa5-a7e5-40d6-804e-b52597d844f4@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2PEPF000008B2.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::697) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|CH3PR11MB7204:EE_
X-MS-Office365-Filtering-Correlation-Id: 76c31a6a-3163-4c64-0c6e-08def2520fe4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|23010399003|22082099003|18002099003|11063799006|4143699003|6133799003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: f7U53OnzFqRBc2/RRuoLgcBQdqI9/5v9R7CIIEteIWhFOcvdEmeTiGlEs9jJ763wmkaRb/GjYvmXW6ouTfKsAqktX5qSDYCofu+r049GutANlA1R6XuWE/BGGWN1efSRH75k4zAfAuLLHDDJ22nSJVo95ljjbvrDjd6SE0w7imG6ltfZXdeQrsMGX2uI7zIGefIDXfdZozgSL/LFyTpc5HBR0nBcqljpZE1NCNha4f46ZHh0mr7jXRvPhFlNWlV/qRJmMrvB89A9EwQJOm9xayczVsDbrENRYnNIhw1CgznLUxGlwpTylb5zSxoa6Z+15RM0DAmYxOBHrJu4Dqfv8iq3HsFYTnjn87d1sWU29OviDlMSOPAcjmqrc/vJ1MeYVwXSG3G6FCEK9To/Ij6XGloDbmQzEpN/6UDD7pyCP5iwzGUvz3v3Ah53beLzeOD6uWNf/4/myM5I7Nke5qsG16Gnqdby8HntwrBGe0SCPShw/ik5ULR6jWT5CYQybLN/aR4Qf/w+y0cweTRfSyxz22o0ANTd7rD/cjgPEzIgyA7BXZW6tiej6a4CvyTo+rRjdJwt4Jlt/MtMa/5yViMIOE5//YHnGElfK6Mg/oDOp41M/V7rDiGshO59J1a5sX5aBOJiadMt7t6JbsSuTrUzPV0EW0iqodaiFiC577iugHc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(23010399003)(22082099003)(18002099003)(11063799006)(4143699003)(6133799003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZXltTFQ5bU0xYmNkMHYxNGUycDZGR0lkWTZudEVIYjU4am51bnhJU1BNbU5k?=
 =?utf-8?B?VzZOVHZRRXhLc1FrSUtlWXIxVW5XOFNscTlhZXQzSWpIOG1Rc1NlRWdZZFlF?=
 =?utf-8?B?QkRxa0RtbHYxM3FtMXdGckdpUDN0YmZPOFY1L096NEdNYlhDV215RUtOdnRN?=
 =?utf-8?B?WDJGL0YvdUJFK2pEdHhVZFdlOFFwbWRHMUVzc2E1QXBrZkd3L1Y4dE9rdEZi?=
 =?utf-8?B?dWtQWkhOYW5hRjVrbkFQUFJKeUxPNlcxSmlyNXA3eVRrQ3l6R0t5VUhwSi9l?=
 =?utf-8?B?ZXYvOW1KaGZwQllYN3l0NjNrb2YzY0VUWTZ5UkZiVlNiMFdJT0swTjNpMytU?=
 =?utf-8?B?T202RElMSTBiSUFSaWRVTnlEbVlUNkVoZWdhVzhERjJXclNSQUtCRi9sMHNl?=
 =?utf-8?B?Tk9WUTNUZ0VTcVUyMEFZcU1ycHhNc3E1YUkrT012T0VZanNTajNnb0VRTWYy?=
 =?utf-8?B?N0FwTWgvaVpxdXJ6aWtHOXhGZkI5OWdaaEN6NGs4a2orZk9HYk01KzhBRDBP?=
 =?utf-8?B?RVI3eWhrakNCMkFUcmFPOUhYOExnTFF4ekIydmpzRUMwL2N5eUtUYzB6bXRk?=
 =?utf-8?B?SUxHSk1RZS9NVVVhempnRXhTWVRPQW9yR1dIelB5OEtkVlZ2aHZsVXh0SEtx?=
 =?utf-8?B?WHFkbTRmOWV3RFhCSFBJN00rOTRvMWF5di9rRE0zd085STlSTCtKOGF5RkRw?=
 =?utf-8?B?WE8yY3BmZ1dtNk5GLy9SMWlDTzdvMkdRWjk5VVNwY2ZyamlDSU5aa25xdlRD?=
 =?utf-8?B?RThydzMzSHlpNmFOaGtoY1pwcmNoMmZ0YndZZWwyT1dVbDVCYytsUG4yR05D?=
 =?utf-8?B?S0RQbTNYVmVhTEtUR2NTRWRvS3hVdmNXK1NUVVNhZW1USnp2UzVHSmZpMEdT?=
 =?utf-8?B?aS91cDR2SFEzZVF1aGV1OHFXbGl1ZkxmWTQrOWVEdzNLQ0V6cXF1T3lKbUhI?=
 =?utf-8?B?NVorV3RpODJqTTViVkNhdzluZE0wR3FKSVNFRzJvZ0F0c1FtZW9ETHkzVlRQ?=
 =?utf-8?B?b0VpNjNCa3hUNDAzME9CejYrR2wzQUY0S0llbllJY29BMlQ2Rmo2dUdMaFgx?=
 =?utf-8?B?RTdhQjJiVVFDV2s2U2l0VHZzbWtqQ1hhTm9FZ0lxbU1HL3J1RTZXdWRJaXZE?=
 =?utf-8?B?MHJXY2FiTWFSSVV5Mm5ieXVLY0ZZYllsK0g2UmVHMXVDVjh2dlpwQ2FQYlgy?=
 =?utf-8?B?UklxUFg2MkxJays0OTE5RWkvaVdERTY5SzdvRmUvekNoQUg3OHNpZ3lGNW9k?=
 =?utf-8?B?blY0R3hEZ0FsWko1d2ZqOTdKNllsbThsTWRycTZReXY2MnFQV2JteWpjbDFm?=
 =?utf-8?B?N2VsdXhWNDlqUFZLZ1dpUWtlRHBXUDNKSlpjbWFCT3RwWmY5cnBtYnovcE5y?=
 =?utf-8?B?YzhkdVZnZFcvdlkxWklWTUxaZm9YYmJtbERDU0R1Zy9ka2pQMzNHUjRBN0xn?=
 =?utf-8?B?S0tVNmY2WXUvS2xFeWExb05nZTJUZUFqV2RYTVV4TTdIeWZIeTNQOXgzc3F5?=
 =?utf-8?B?OGxPajYyUkVUZmMwSTlxWnhOWWJlYjZ5S3IyWHNGeGpvVGJzOERCTE44em1M?=
 =?utf-8?B?cEIvQUI4YkNvdWV5OTN0dk5vaU1mM3hrV1RiQ2FnZXN2aDVsS3pCcVRlK1My?=
 =?utf-8?B?M3dZZUdOZ3dJQmpHOUJGalBGQWFOejNRZldDNndPOWNPYzNlODNDSUZFV1B1?=
 =?utf-8?B?V0hTUE1aa2s0alZCYWRPb1hZUC8rNVhPM0YrZ1ZMM0ZoK2IycUF1WEFBVFFi?=
 =?utf-8?B?Q0pidzR5UldSc21BQkxoRXMxOXhrNS9iYlQ5aytmTHA2WXdMNmIyNjZ2SzhV?=
 =?utf-8?B?b21BSnNCQmhMMk5nc0JzUDZhOHIxV2ZZQTZWL01SemxIRS81c1Ntd2NHeWRK?=
 =?utf-8?B?UUlRMy82djAwbHRvTDdaRlhvUEp0djgrVys1ekt1T0ZrNGhzVmRJTDR1SkpE?=
 =?utf-8?B?WXgwbG55bWxrRFFPb3doVzBpalFpRUt2ZEQ4anVDTUpJdXIzSUtqZlFoWEp3?=
 =?utf-8?B?SFk3YjN3b1BpZUNlc3BOWXBSYVNsSit2RTlVVnMxMFRoOHdwSVJzUHB6Zk9S?=
 =?utf-8?B?b1lUMGQwcUVGQUc2djQ1UFpJZ2ZEdmVLTDd5bFFvVVpXWDJKWjFxNDFycno0?=
 =?utf-8?B?TWpmK2xpNFhoMzVVY2JDVTNQMlBRN1h6cXFQRXhvRjA2SUZjUXg0VEJoN09B?=
 =?utf-8?B?TDJaTWIrU1diVlh0KzNBWEdxWlpNcWxicVRVcy9iTWdRVVliR0kvaGFlaGVR?=
 =?utf-8?B?VzhOQzVCVmVwSDUvc2dYa1dBdUZqUUFmeXFiS2RxNFFUSlVOdHFqOWRzaFJm?=
 =?utf-8?B?ZHhTam91WkhuY0E3dUFxUW5qelE4NkhoSFE2STBGSlEybCt4QnkwQT09?=
X-Exchange-RoutingPolicyChecked: WV7fIsHBNqlVrqTL90Vo4LK0QyeBnuTAq+CYptHTInwqiWlwqmd9z7YuPlTc+93tvebINZN+m4A/DFbL5DXBH+OsKzeJcCC+lW6x+LrgCVn297KFUfbPqa0V5Ix/uFCFFblF60wIhxLruT+eK1HwnpLcqQcNr+UjUx/m4D4CtNp4xOG54nfzvGqm2IHq0xQzMdB+jVaHZd4qTcMUOkflCMSyOxgmUrF+G0UKNvxeohRoCZkV3Ehm15dkFJDy0eNv+gxRcLYzCO2HE4x+zUOiTC8CPowLgJ8eDVqZKlXcJVDOoA9dO8+I00Fm9QwoG3mGIKZyu7JeWvnM9NpjAornaQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 76c31a6a-3163-4c64-0c6e-08def2520fe4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 17:59:00.2176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dFezdWx7gaHJZwwkP9u/tP6vVMmi2/zJxV0W5Cxb/2gMLdXwnJ5wIZfgN/3Ve/T2WNPfwPXYGwclnD/allBLW++AV5fRlyynmHdTZfYMu7s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7204
X-OriginatorOrg: intel.com

On 8/4/2026 7:50 PM, Mark Brown wrote:
> On Tue, Aug 04, 2026 at 07:46:58PM +0200, Cezary Rojewski wrote:
> 
>> I'd suggest to move away from snd_ar_tokens.h (the name is as ambiguous is
>> at can be) and start new header family within 'qcom' subfolder.
> 
> FWIW the "ar" is I think AudioReach.

Indeed but uapi is exposed to "users". As a "user" which would like to 
take advantage of their dev kit and collaterals, I'd expect something 
more descriptive than snd_ar_tokens.h.

For the readers, I've not mentioned the full context - let me correct 
that now. The "bad" example is snd_sst_tokens.h which targets Intel's 
skylake-driver (the driver has been removed few years ago). SST stands 
for Smart Sound Technology.
