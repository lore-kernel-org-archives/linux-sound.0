Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934581F3D56
	for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 10:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773139792; cv=fail; b=cMNMjysaFWEYWh6cvgw3GJgTkEUEZ2hdtjPMLRpkjWhrirnCJ1Vvp6bZQZ627fE5I3GZZPuk8C3GGwj7HXfxBC1BUM6GSwrqUPgO6pjFL/4hQpwF5zUXguM0JSnqtZ65GaFOb0EzRrJb5NHg+3SY5miake19xCYpX/0qLv42vyQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773139792; c=relaxed/simple;
	bh=3YuFvA9nDfv4YAxqgjtVxGnckdJUelkhmrxTwfHuZ90=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=C6WDL2ywtfN/fVaTJtnE8Q9A+fyXGPd0X/VTrZuzlwiAAJoEkc99jlrpxud//h9MUhoAYfP/g3B1fHUtSjsxucdU+9MDNuWJy/+dUBB3dommMDo6HUD1VSY4vvqatkMdfemwmo4NH3uVainnC7fb4D+i192aMX7kWq/eIW9dx2E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ype+J3xx; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ype+J3xx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773139790; x=1804675790;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=3YuFvA9nDfv4YAxqgjtVxGnckdJUelkhmrxTwfHuZ90=;
  b=Ype+J3xxbUwsBJPHBbC6Gmbr2z4YxTbYTJli1DidnEx+XbRD21f6Xgq7
   oOlBXVO4XOFQCRW6IV6H0cYbN2dIZX/I/nKLVY8FSLEXRtZNkOEfwCFye
   vkOvKrrflIQGvqwUb3kQ6lIy2e+0cqYCL24mRFrPUThFiqdI7AUuVwtPs
   25boNC0jcpiMXD1ao50Jpa+aXljpKrVVkiLQ9N/AP+DgkbAHRfBCEqVcW
   N8xC7I4Sv8DQiGJ+ooMnRGdxaaldGLzNXajZJaFRZtiluQSYsObWQRS5I
   BPE/l+vZMuRPNdxf0uQXxViN+fzuDqkxhuNtEGif5zcnNXXkWAbSeG99k
   Q==;
X-CSE-ConnectionGUID: Qf1Hfh69SXSwERV5uP1Wdw==
X-CSE-MsgGUID: OeSyDgCpTh6OPx75EqB0/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="78036819"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="78036819"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 03:49:49 -0700
X-CSE-ConnectionGUID: 3vrrQg1WTBGgcPfl2aaCag==
X-CSE-MsgGUID: NCtM5T63RVOi+hECbzQBCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="220248898"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 03:49:48 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 03:49:48 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 10 Mar 2026 03:49:48 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.46)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 03:49:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yefYCaHW77gkSb6S4l8A80inbVmu6Y8HTbEOdGvl1QyqgcXaDl7nxGQPk0dix5tbG7SVdlNej9e+DdOqX/DdKnnf4DSpHemBmd7tK6+CW5FevOmlnfW9lr26jGHYsL/c+EJCVgkcXhRfRwOw3gYsepXnUm/QCklH4lVog7S0eQQ5E3f3jTFLy7BmWCfYbiYpnUZfx17JVYHLIhcZdAvriXwiiirdUTT/5IqCK/qOKyLYdgcjQFP3CCy3KN+C9P54JWwIagb3Y6nnbhvpQ8oiIw3jU8NpJ4bV8cMoMVsSzH0tu5qJoyzvey3LcpmRXIQKwfaFF2XijL8ofavXvhFaiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YB66yHE8YotjsoqGCj9rCz3r6W3BuavAHa3Folcyyxw=;
 b=UenF5gU4lqAcvVcZh0FscNJ1Csj1ANOfpI1JVAcs3C0/1h9+LVa9fWKh7W1dwksiiQofo7KuoKILsG6daJJLYGFlOlcfG7S1aaGXKn9z9ezC/x5ID2auL3UuLhBW+daO0Ip4iC1r/j9HW8X6ZQ487idqw1Pzntv1PKygu3isYewJnYDb7dzw8qt++CXv10Qauv36U2cdBAArbOdCyOf8u4Cho3uvD14kO74ze4vLOM4k6eRQcE76XNLUhXotEGsuUYFozfo5kZNEKwxmBNHnVE5Bc4nuXkTZamXgDrzr0ZnLpb5blS3s/nVBwt6ZdO5MbfsOS+YSmMjFMUES4XqCKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8283.namprd11.prod.outlook.com (2603:10b6:806:26c::16)
 by MW4PR11MB6935.namprd11.prod.outlook.com (2603:10b6:303:228::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 10:49:39 +0000
Received: from SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214]) by SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214%6]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 10:49:39 +0000
Message-ID: <db9f9b64-aab8-49ad-8904-1c2c99c4ea2b@intel.com>
Date: Tue, 10 Mar 2026 11:49:34 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [Question] ASoC: Intel: avs: Guidance for finishing new board
 support Apollo Lake/TAS5722
To: Carsten Behling <Carsten.Behling@loewensteinmedical.com>
CC: "liam.r.girdwood@linux.intel.com" <liam.r.girdwood@linux.intel.com>,
	"peter.ujfalusi@linux.intel.com" <peter.ujfalusi@linux.intel.com>,
	"yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>,
	"ranjani.sridharan@linux.intel.com" <ranjani.sridharan@linux.intel.com>,
	"kai.vehmanen@linux.intel.com" <kai.vehmanen@linux.intel.com>,
	"pierre-louis.bossart@linux.dev" <pierre-louis.bossart@linux.dev>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
References: <7f3fde61-5319-4001-8b7e-ed44008a1521.152c0446-3a39-4bcf-a504-672812e167ea.c8587f20-63e8-402e-be65-78b29d37359b@emailsignatures365.codetwo.com>
 <AM0PR01MB1244966F3CBED7538B41DA7AB9046A@AM0PR01MB12449.eurprd01.prod.exchangelabs.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <AM0PR01MB1244966F3CBED7538B41DA7AB9046A@AM0PR01MB12449.eurprd01.prod.exchangelabs.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0170.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:66::9) To SN7PR11MB8283.namprd11.prod.outlook.com
 (2603:10b6:806:26c::16)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8283:EE_|MW4PR11MB6935:EE_
X-MS-Office365-Filtering-Correlation-Id: 6635f8f9-50f8-4402-0944-08de7e92ba98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: F2RKPYhTwqI1cRZtCkrWBaiNV13zpTrnPLMyxzyVjxmzZNOMlaQzkMSqZrvaj2xOETm4GtsYOuqFek+DSNzTAYLIjLHPkVJ8E6W/i8YaW5sIRUvoWAOT9ZOPXjbqVhvAFhnM1XEjVN9dmwTosYYdC40kMJ9ujhsA0Iex8B8QwGUCFBahaRK481WDXrwETDe5owEEr4v1YXfZqPrm3EKY0hhDilJwlOViowyuKrWLaFrytfRWUOzGccBVWQAxCtIwfTzl1MT/0E3KBXlqcehooDBF6KepSGtTR8ZykS7gpIoH7a0xZUXQwL2b5oyywTvjClxKvLCppytlMs9DT2PILe474q7acXGnKcBC4CdkUmwKnaOkjIH+JEhJBHBhgqUU3o6gj/whDE1XjBMV6WM4QzmUUf4HaQ0W7VTkl11Xu+Xw6fqx//H9lPxNnZKPTtJOqqKKtimhlfeR5tmHlRn8/HZJ8u2NwfEZlRtAq3xYlMiiLt7eeaWd2iaGhc9FmYDZjYMvyGMjJ9jybGwhww1xylefEuo2dWsHnN2PfETXG1geu4huws1I/2d9CBAva/ckoZdyvo/JIEqcEOlX8AvQavQRl/PtjZywsBSuvy9JXvaqs5vDZJMedHV/aViJ1MZh1PvmB6cZOcLUz5JQFddUVe+BgjqupvGQkzt19WmPuKyYy0qFrdWJnLwQxRzeOVtV+ZdVfARBfJUniC5Bg8QIWg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUl6N2tGQldvdUJiNFdyalNrNnloSnhqb1VweWZPUFhMcXNNTTRnalBSamtW?=
 =?utf-8?B?aW9WT01nTTFabHJvTk5KbDZyRGg2MU8wZHRRR0I4eTYzRmlSeU1xaitZVnU3?=
 =?utf-8?B?VzNRd3d2cTVGNTlSVHVZT0ZnRkVuL2JCVjFwd0xGWVBWVzIzQzROU0VJWnRQ?=
 =?utf-8?B?bjNlUTAzZlp1WDdtU3lpcFFrWkZsdm9penhKNjZRcTdDMzhiaTdrdVhIRHAr?=
 =?utf-8?B?RTN6WXJJTjBEVUx1SWpjYkRZUzV5YWh3ZHBSek5DQjczTGp3OGo2LzVtK3NB?=
 =?utf-8?B?NFUzZU9hejY4VXZkRUN5RVdmb09RVnhHQUNHaSt2dDFEcHE1WVFSUUZhNlNp?=
 =?utf-8?B?bllhL1lSbGRMTGNkaXdoSXpwZXBHTDlVWlBqcGhsblErOTlROTA3cmRJU0ZN?=
 =?utf-8?B?dSt6SERnN1Y0NDQyd056UTIxZkVXRGxSQlVNZ1VDNHN5SzNybW1jaEYrSlQ0?=
 =?utf-8?B?ZEpnMytlcmNXMXNnSU12ODJlbHpGeUFJTHhpd0pwZWdRc0QvdjhxS1puM1RJ?=
 =?utf-8?B?UnhmK09QSGtjV0x4SVhnL095TEVranpjWnJyS1JaSkljMEc2NXp1bWF6emVh?=
 =?utf-8?B?QVBGZERyMUs0d0hYRWgyZks2MDNjTkRKL1dnVVg5TnNPam5sUStxMSttL0dN?=
 =?utf-8?B?Q3B3cUM2RlV4c3RNeHlxNnJ5NElrNDBVQVllVE1wTE9kdFYwbG5wVzF6SHJr?=
 =?utf-8?B?SVFRRDJPSklWZkpkKzBZRFRhUmRIS1JEY2R4aGs4YkE5N09Hd1dLbktJNXZj?=
 =?utf-8?B?QloyYzhtZ2dOTFNBM2Ivblcyak1GZTNqZDJobjBzYTE2ZnJKLzdOZFVDZDJC?=
 =?utf-8?B?ZlBqMDA3ZjN3eEl5RFEvc3dEZmxHSThVVDE1bHZJaVRqcTRCcFpFWFlzQStp?=
 =?utf-8?B?N3hRRjh1VzU0akFJTUtIMjI3NTI3RHdRdkhRUENiQlJhREFWZk5TMDBWWlE0?=
 =?utf-8?B?cXZIQnlTZTJtcHpkN0FvSEtGcGdMaWpTcVNSYlE1UE5vVkNsUERLTFNyVG11?=
 =?utf-8?B?TG9hMFptOUZkRzBzazRXNGxlVFlPdldiSTZkRkFROXRRLzNUY0FER2xLZXYy?=
 =?utf-8?B?dW9FTTdCemhoQldqYUtsTitncksxWHR6NzBwUGRvbW9laU11STVBWmdQZWM1?=
 =?utf-8?B?UXZ0YW1ucmhEdHd5cGVNbVdVVmxYNzh6L2I3K0xibGFBbGhxMTBPOHBSRXZm?=
 =?utf-8?B?ZWFpbTZzWHZJWHZnU1Bxc21LeFZQSXEwR3daMk1pZ1BkdE1Wa1NmcDh6YnV6?=
 =?utf-8?B?RHoxZ3ljVXJFRHJWTS9jTTAxQUdnTjFqRHJWcU1sekJqNldISWhQa2tqeXdx?=
 =?utf-8?B?MmwyOXJRUHYyYUZCQVVndmVVVk94N2g0SFFXWnZ4Z0ZRaS9GSlNiUGhGbUFC?=
 =?utf-8?B?Sk5nbGlCcCtXcTF2bXlEenFFRWkrZDlnamtVSFEwRXZIUGROOEZDeFI1RWxZ?=
 =?utf-8?B?MzR6dTYrQjAxZCtSN0lyT3JzUVFPenlrcjZ4WmpkZEYyQWF0eStLU2pFT3Rz?=
 =?utf-8?B?OVBLYVluOXduYUZGSVY5a2NTRmtMNjdnZytkamZlS1VCNDM3OTg3SnRHM3Bz?=
 =?utf-8?B?TDhNa2U0WXJDYXRGSmtFbWJOUlVEaHp4NHFGbkhZOEp0eWRWdXdnenkrMHB3?=
 =?utf-8?B?dXNXUVNtYUo0QXdtWTVzTkRxL0trVUYyUUZ4dlVYYmhSS1Q3QXBkUHRod005?=
 =?utf-8?B?WDlVUHNQY0VqMnB2RW9NMjVvM2FOQ0xwMTVGc2t3NFZUM2dTdkxnU2pGekpI?=
 =?utf-8?B?UjVoQUtWaitIM2FRQTNnLzl4WDEyRFZ3aExIOFo1YjJqd2V1MUVXY2c1R3dl?=
 =?utf-8?B?cXZxVjdTUzdaaW1VTGlGZE0yL2hTYjhacEwzRUpUNjhKc2grNVNCd3MvN1U1?=
 =?utf-8?B?T29Nc0MxSThLVHdick1IUGtldHZRVGJ1NXlHOUlDa1ZjL2YvVWRiQXR4ZExN?=
 =?utf-8?B?dVFJK1NJVGxTUFgxSDhUR1hiWWUweTc1bGZITGJSajNER2JMMTFrSEd6RFZz?=
 =?utf-8?B?Z25qZXVjUzlpNzRnZHdrQXpoamdoZjFveHpiWXo3UFlNQk45ZTF0UUlLbVRp?=
 =?utf-8?B?WDhVcllxV0Z3ZXV0Qmw5QjhWWkRzbms5Z0J3T2V1eWtUWWRtVytHMzVaZnho?=
 =?utf-8?B?YUZZalozZ293TklUV1JhMWRzdGZSejFIMmRZM24vdDF2S0JvS0E3Q2huSzFK?=
 =?utf-8?B?b3FJV2JoYVlNdStNNTBwOGI1RjFTREF6WG5VMjNNQ2RzcE1YVnF6TTZFUE9k?=
 =?utf-8?B?M1RxVkZTUTZSaW1zTGduV2p5eGVqNEg1QlNuQmVhak1LMzBnNjVqd1hrNjV3?=
 =?utf-8?B?QzFBWmhMRXJWa3E4d0RCOGQ1a0xtTnczc0Y4dWlyNytBb0dlMFExYVM4U1p3?=
 =?utf-8?Q?Yvj+2k7OLd8adomg=3D?=
X-Exchange-RoutingPolicyChecked: Z+ecy9DCmZn0xhw6cJRBuErSawQhLBBTT1VDaC48fQu170403Mp0qEcUNEujVKPqwesFHXQK5HwkzY36v2Q9lJpJv1VKGcSUJgrVYg7aKhDPoipmun117+zt4EGecppvzdy+ILaYxqrjOvLHIFZdE6CE415ofgyjzjajFfr2WvdTazz4WP5fgL3GlpKJbp3ygZBCenbbayZ8nbJBMSndplc0U9iBDYxjgRbyIsK/s2J+rxOO/yuWU19bwpG+vD67PN4asUU1uYd5HZKVsyE/n4a+M4jWCgre7c7jGZYQBwDHhgt4xSin9+5BIWmsCvkXn4Zuj7oCJaZZ2ZQpE91ong==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6635f8f9-50f8-4402-0944-08de7e92ba98
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 10:49:39.6620
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ezr1afZACHdFzGE2Qk6wiAptoWv2B1gFDPtW8o8v102yDhpqg68frV2TxXBMIQuHAH1usrBJu7wsglNLXbqClrDcgDMcmeWf4mH7C44lfCw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6935
X-OriginatorOrg: intel.com

On 2026-03-10 10:39 AM, Carsten Behling wrote:
> Hi,
> 
> while moving to a recent kernel version, I need to port the E3930 (cAVS 
> 1.5) <-> TA5722 sound soc support from 'Skylake-Driver' to AVS.
> 
> I assume these facts:
> 
>  1.
>     The port covers basically four components:
>      1.
>         the board file aka ALSA Machine Class Driver
>      2.
>         the DSP firmware
>      3.
>         the Topology File
>      4.
>         the NHLT ACPI Table
>  2.
>       After some confusion it looks like the AVS driver is the way to go
>     and SOF is dropped after old 'Skylake-Driver' was dropped.
>  3.
>     The DSP file is signed by intel and obtained by the linux-firmware
>     project.
>  4.
>     The topology file can be written in XML as done in avs-topology-xml
>     I2S subfolder and is then compiled with the AVSDK's avstplg tool
>     into 'Use Case-File' and than with alsa-utils alsatplg tool into bin
>     format.
>  5.
>     The board file can be added in sound/soc/avs/boards.
>  6.
>     The NHLT ACPI table is a little opaque to me.  Due to missing
>     enpoints in the NHLT table, my predecessor extracted a
>     byte array from a *.blob file and tweaked it into a struct
>     nhlt_specific_cfg and hended it over to the old Skylake driver.
>     I have no cue where this *blob file comes from and what the
>     extracted contents means exactly.
>     The ACPI specification is a little confusing on this. It seems to be
>     the Format Configuration for the DSP.  I think the old
>     Intel way was to pass the *.blob file to the kernel. I found that
>     iasl compiler is capable to generate a template NHLT *.asl file that
>     could be filled with the matching enpoint data and compiled back to
>     *.aml .
>     To me it's not clear where to but that array from NHLT blob above.
>     Furthermore, I don't now how to load it by the kernel.
>     I thought about some kind of overloading similar to
>     CONFIG_ACPI_CUSTOM_DSDT_FILE, lets say CONFIG_ACPI_CUSTOM_NHLT_FILE
>     feature.
> 
> 
> In a first step I took a look on how everything works together by 
> tweaking the original NHLT blob into AVS driver to prevent the board 
> selection from failing loading the board driver.
> I made a quit similar copy of topology file max98357a-tplg.xml and the 
> sound/soc/intel/avs/boards/max98357a.c board file.

Hi,

Yes, for ApolloLake (APL) devices the avs-driver is the way to go. The 
driver, the available firmware (linux-firmware) and the machine board 
drivers should enable base configuration without any issues. The TAS5722 
support is a different story though. I believe that basing your code on 
existing examples e.g. max98357a is good starting point.

In regard to NHLT, the table spec is public [1]. However, the details 
for the hardware registers are not shared and are 
configuration-specific. Fortunately, the avs solution does allow for 
including such details within the topology file. So, no BIOS/ABL updates 
required, topology will "patch" it. If you provide the details i.e.: 
streaming formats, perhaps we will be able to help.

> Along with the newest dsp_fw_apl_release.bin DSP firmware the sound card 
> comes up, the DSP starts without error and the topology file is loaded 
> without errors.

Using phrase "dsp_fw_apl_release.bin" explicitly made me curious. What 
binary _exactly_ are we talking about here? The avs-driver _does not_ 
expect such wording, neither did the skylake-driver.

> 
> While the Codec registers are set correctly while playing no I2S frames 
> are output by the DSP.
> 
> My questions:
> 
>  1.
>     Is this the correct way?
>  2.
>     Since the board supplier suggests SOF driver support giving a
>     Elkhartlake/SGTL5000 reference only, the community
>     seems to be the only way to get support. I started implementation on
>     for-next audio soc branch and I'm ready to contribute with the help
>     of the maintainers.
>  3.
>     Can I expect help?
>  4.
>     Can I provide my patches here to discuss though I haven't audio output?
>  5.
>     Since the topology file is part of avs-topology-xml, should I start
>     a second thread there in parallel?
In regard to the board driver, send a patch. We will review and process 
it as any other piece of code.
The preparation of XML file (avs-topology) is a separate subject. I 
believe it would be best to open an "issue" on avs-topology-xml project 
[2]. While support for the new board is not exactly an issue but I doubt 
discussing such specific subject on linux-sound is a better idea.


[1]: 
https://uefi.org/specs/ACPI/6.6/05_ACPI_Software_Programming_Model.html#non-hdaudio-link-table-nhlt
[2]: https://github.com/thesofproject/avs-topology-xml


Kind regards,
Czarek
