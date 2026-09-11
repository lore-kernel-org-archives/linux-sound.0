Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE73D2222A9
	for <linux-sound@vger.kernel.org>; Fri, 11 Sep 2026 09:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789118971; cv=fail; b=mDi6jBe687UG5uvg1GyCXYVNebh2b1Pl69RXkWHh0c6dPebcs6olOq+XDX1fWuKH2CFYzrL2FymuJ4SCZ0zN85u5eIiiZ7L8iqC+1cjdiA1hmkzqSTVu4e7PE71b6/wPnWt0BLBpO2On3rym6qVrsr8uAs8YaBK5dCN9VRqTqh4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789118971; c=relaxed/simple;
	bh=dyMtGoSaEPuJbMBTMxB4OoX5dI+CPlxq5mZ4fCkYiqA=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ccjOKcflBgbs1QVePZBESKd4Mz6z91urxhvfgDrcPVn6D2OsVi+MlXNCR14/aShtJ3SLMmwAiBUtvUVv76DYTsadvyBqmPUYr7djBlkfEG4QxMRyM04Wp9quJ+xXsPWp/15nixsrrHuRevzPLApyX0QHQpBrTffiCDwHkRHf4xw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vj5b89D+; arc=fail smtp.client-ip=192.198.163.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vj5b89D+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789118970; x=1820654970;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=dyMtGoSaEPuJbMBTMxB4OoX5dI+CPlxq5mZ4fCkYiqA=;
  b=Vj5b89D+qgWGfqQhtvgxtJh2gvXBxtbOqsflJBsAmRNCbiikbPIepYy6
   S+5CMkfhJ7Qo3//d2ZtigUcu+7sbeSlrJH+PQjHEHoC60PDDNyoGfHR1U
   mKvRZyUw7iegvRwfXX9umHWZOK9A8F8bhdm96/oD2RcDY31U4BDGm1J+q
   8x/RyG0RFUZsxnc3Z23/xc0stfCos41Q8cz3JpuIoVHx/HuHyzOj4PzLu
   yQxpyQ33nkAhkYqEk7x9DOj9ffuYObvmYakg5/SUZkuM36C0/MBoretOu
   YEh10V5xT5gIsfYbPgB0HB80qhwAFvPZrAZT1o/44fs/j75VLYI2WUWtO
   Q==;
X-CSE-ConnectionGUID: wjpp9z23QCiDgyAXbmPZ1Q==
X-CSE-MsgGUID: mmiHzbHiSh6TXj8APPjD5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="90427"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="90427"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 02:29:29 -0700
X-CSE-ConnectionGUID: 5fRpb60bTr6woKmIPLW7Vw==
X-CSE-MsgGUID: 0l1VBpuHSbuWDanyTIMk8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="277120919"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 02:29:29 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 11 Sep 2026 02:29:28 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 11 Sep 2026 02:29:28 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.55) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 11 Sep 2026 02:29:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w1CPrMtIcGFW1ViilAIpK6BJOoaTL34At0TYmoXtGAIPJZ3kota+57vpwkqKMZn1hMhHLrDBq2m/6OShbZ3brQpDt3cnyHNrXi7F2pKIijbGzOUl1IvNbqtjEHpzuCo+VX7w3fP1EaayZhO9qZ7OeUj3S0UbS/+ZyP7FzF47dqsd2WcV/AWafHioXXmlq1x8uWY/QLQgnn6H+y/IKtoc+vJzuUrtmtCn3DcH8kp35CrJFN8qKhJry0Ukyz716UdSq8MJHiORBi/u+B9UadNCXuiHdpB/tBVPiLsry2TXp/qmfEDJ9M0kmQMkpAerBmmEUppNB7XUPInXwPkQFXf1Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AEMAC1dHPum8V87OrTs413zHGc9E1wiJUJFMNYGGtaU=;
 b=AOUbMQzh9LmGEHrDeH+ACDukgOsrIUJdqkjkuI7gtSEPuqrZk9+vOhAb8L5RioURFUJ25kc8rPXrlhW+ZquLmjQYGWVNuYOzOnkEtXqW+IYH0KWg313Bwn4DzuK8t1V+KOBdEr/4yIw1NiX6KDSTZAoUOeevlwdxY189QxgET0+zn3K/R5DrsHrjyIzKdSyGIOCsnaQdsE1Q7geLyge86sHmQZ+HYdzJlRTv6NJBF7Tm9aZaCmTWEPLnxIQ5EAnhneySRjfL0Z4gGXk+I0y/nEg0IFFFIIYQKDBsHeqH4zycR6rYkgxZOjuicT1nyt+D5TKBtX34jy5b5Rdwvs+RWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by CH3PR11MB7866.namprd11.prod.outlook.com (2603:10b6:610:124::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Fri, 11 Sep
 2026 09:29:21 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%6]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 09:29:21 +0000
Message-ID: <c153ede2-b54c-4e2d-b51b-1dd8e0268dda@intel.com>
Date: Fri, 11 Sep 2026 11:29:16 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: Intel: soc-acpi: add SoundWire config for ASUS
 P5405CAA
To: Antonio Di Lorenzo <antoniodilorenzonap@gmail.com>, Peter Ujfalusi
	<peter.ujfalusi@linux.intel.com>
CC: Liam Girdwood <liam.r.girdwood@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, <linux-sound@vger.kernel.org>, Mark Brown
	<broonie@kernel.org>
References: <20260911091035.221224-1-antoniodilorenzonap@gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260911091035.221224-1-antoniodilorenzonap@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P190CA0031.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d1::6) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|CH3PR11MB7866:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f86a152-6700-4c77-be60-08df0fe728dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|6133799003|18002099003|22082099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: ob4cwfdPkgwutFrsizxEEbMgyvj2cZEmRgQqQJoHnnizZhCRwDGgVolAy0eL/nZLBw7eWblKxjkKxM7bNo3OhCwAHwrZjP7YQXHQxBzwqzzClVd5EWYeXjUcWbYCTdozCvtvNaSQv7pcpgw8gbUml/LVrZaI65gGuf611R54tigdIR0Z0sBVumCyLOSDpWpZ6ulpisXVeUBBsCqE6/KDO25QF8lmVSR2vIuUzLBs/PTt3YieQWIujWImXhhQkjop45IVik9cCLotyGVeFxtcOzelRROB+39SjgxROKeqM2Xqrg4MXUdNRycTH3w2TxiI3dWLdvBPGKiZir5LtbHJcCw4NSSBthzPwU1p/CU/W+hm3M7D+MFft3Rde1mGBalctgVh73jEd0RUEwWfu7suFgLKXTePUoH9bk57T3/XWtYByV1cahkFtwsrPHB2EQgzUQhPPM1bzFN5Rg57k7b/hdxIVJdAa43GsapvoAkXxDTBZWUJ13Anlgrq6DQ52nRU+H9ekdnZdsiJ9laOqDimPA2UACaabnGiwhN3EBKNowLbXjCPpFQpZTp3cVuWsPvU8PShgfzd34PZxBwz9f2/PjgF+KHCR1q560aPIvjSCNqnQXoW1vxMecxds1uK2+GzjRnF5sUO4bgUXnILF4RMP3P5+qN5pri8rMr2NkWmwdk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(6133799003)(18002099003)(22082099003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVhJdktsQWVodkZyR2pKdittMmVrYXpOZ2x2L3ZTaEJsMEtwUXdBb29sb1Q4?=
 =?utf-8?B?ZU1qYXBLQTdnS2I3QWJubHh3QVM3Mnl5U3ZnOWl1OGZlNCtQRmZwdUxFVjBW?=
 =?utf-8?B?M1B5Njg5Nk51QzdWQUhXdzE1MStmNmszb0lVT1UrMExrSWwwTUNPbGpablNy?=
 =?utf-8?B?WVJ5cnZ5b2YzSXB0VDZnampVU0RBcWJUU2IwL25lUUhJMVNpbmZSdE9IUWZD?=
 =?utf-8?B?aW1WQzhQRDNxRFpmbVNZandIZjZMQmIrMWplTWRwYlVUS1d0NDNMWkZkSVVp?=
 =?utf-8?B?bzl4VktBSjlRRE5ZSFNMeDBuNFBQWlBWWVVmOEZHZDlEZmtjVktYNGpNZDNn?=
 =?utf-8?B?Rm5QQjlXRHlYdUNKcURzdjBOL2xFWGJIY29SenprSGk4Mmd0ckgrNi83bjFE?=
 =?utf-8?B?THBGRDJ5UUxHb0plWTI0MkZYUndwNGdwamlCUjNlMlRRTlRtUVcxN3UzRi81?=
 =?utf-8?B?ckdLd1FUTE43a0FtWGNPQTI2cG9VSGtJMkF3RWp3czRpdmN4SXgxMUJXLzg3?=
 =?utf-8?B?NU5BOCtpYUsvelg0a3hWQmRkN0JkekNrRm1YMUlIbnZDenp2RGpqVkVrOXZZ?=
 =?utf-8?B?SlJ5alVFSitibXVxSVVmVXZrN2NKVGFGSFJKa1p5ZWNTZ1FRWDJzOW1Fay9z?=
 =?utf-8?B?TEhSdzU1VDF0ZE5TaXdMbk8rUmZKWXBydFN1cERrS2NlZGdRTlJxQ1dpc2o1?=
 =?utf-8?B?OU9PbnUzM3hiL3JhVmJUelZ1QmIyZjNiSVA0c0N0OWo1RVlNc0N6c0FDQUlX?=
 =?utf-8?B?cXkwSXl2bjRkakx6Z3ZWeUtuMlo0MVdYUU9CNUJySlgwWFFTbDZnZ2VLeldj?=
 =?utf-8?B?TlFsd1R5cmFzZUEvK0Rxb2NEQklIV2I1b1ZQc3YzVHFvY0h3UXZQTit2a0FF?=
 =?utf-8?B?U25oL0VHZ0pVMWVqZWIzb0pEY2ZBREIvSW02bUdoZXVBcTdRL3R2WXlUQXRm?=
 =?utf-8?B?VmpVaHcvNktTQ3VnUXJyUG55bE1EcmVjbUFraFNxRllrdEZRbEtoTmszdENK?=
 =?utf-8?B?SUQ3VzNTb0w4bzd0ckFmNW9aTS9uNmdOSXJGZEVqL28ydy82SzRvTnNvMXVH?=
 =?utf-8?B?TzJYZFd2ZHZzRWZBazJLQWFhOTZMbTNqMldneVhtOTlOUVJwRnI3Qmo2TGZa?=
 =?utf-8?B?NXNWVDVLWUpBOEVqSmpGN3FTTUNRL2tPSzhOMGd5ZTYvQ1ZUVm5BTUg5bTBM?=
 =?utf-8?B?YzdYa3ZBalg0K01CamJIdHhGdXp4czVCcXkxdDI1N0cwaW9UdDJ1c01LT05I?=
 =?utf-8?B?cHYyQjNyR3Jpa1pTd3NYc2dKODI5UzNlbUFjamxod3hWczh2YVIwYjYzQm0w?=
 =?utf-8?B?QlBscENkMTFXY2dGdTJ2KzNtZ3VaRDBISkdUNUpjaHU4ay9aUm5uajUwTjZp?=
 =?utf-8?B?eUVQOUdjOEZGandOUlF3QXd5b3dkQW12QlhPbVNsTVNNWTh6Z1lrdjFJZHhU?=
 =?utf-8?B?UlJLQTREMVlHZDVzZW1OcTRReFYrOFV5YTlSMTJwS00xK0Y5QXJsZXZDMkoy?=
 =?utf-8?B?cWcrV3VRUUZCNE80b29UbnRqVkY1alFRb0dKd1BJYnZWeDlxa3NsWm9raEo3?=
 =?utf-8?B?bldPTkZ4T0I4a20vOFZJQ1ZiOUNJQ0VEYWJ6NGJ3QWJUKzZ0R2dmSUVqb2ZV?=
 =?utf-8?B?QVFRSEcyR09uRzBBUkllRy9pemt4ajdtUXlVRGRLTVluZ1JicERkUE1vU2Zi?=
 =?utf-8?B?T2JVYjZraTNCQVExYmFLbitsdkhhQ2xxZ2dLVnM0S1RQQU1qc2Y1TTRRS1Vv?=
 =?utf-8?B?cTdBdlV6ZWJ1d0hxazNvakVyb0Y3MVk0OUdiL1dkWE56WURmQlFpbUsxa3Zw?=
 =?utf-8?B?aUM2elFXWGhQbld4WFZ1am4ybDdsV2RpSnkzQm1wZlovdm5jQkhHL1Zvb1ZI?=
 =?utf-8?B?MmNtek1PeUpnWVZJNnRnZ2w1YTh6OEQrRVdFbGVZalN0WjVFUjhiYUNYYmlY?=
 =?utf-8?B?Y2ZKMnY2MWRwaDdyT3pWQTBtQ3BDR212L3JRUlhQRTc0V0lBYzhHZ1pxeGsy?=
 =?utf-8?B?TEJmcWlvSnV1NlNodmlDT0tJRDZ0NmRpSkRib2NNYmlOelF2ZGZBSEcxVitq?=
 =?utf-8?B?VllBT3l2VFB1TDh5dk1ic2ZlZjNtLzF6a2F4TjRjUm5aWjN2RHNJL1I2L243?=
 =?utf-8?B?SEtUVzl0cTJ6UURFS2J3bEFNMzZVOUZTRTlUNnVsa1NxMkdYMUR0WnNJVE9R?=
 =?utf-8?B?QlJaNzZYcFd3a2lCTHVrcHVLdEVXbEtyYWpoQ1IxT0lWVE9BVUxVK0I3Y0wv?=
 =?utf-8?B?T29hc0dVNnZGK1NDcnFjU09yZVF1RWkxL1pJTE1WMU1jNmNLZXE3Qkd6RTlo?=
 =?utf-8?B?bVV4cTRQZXVuT2Z1cSs1d1lKOHp4UXFwV2xRVWU3cXlQeTJsZmRocGwvNFJ6?=
 =?utf-8?Q?dRMgqFkCs895V10s=3D?=
X-Exchange-RoutingPolicyChecked: AKoIgxXu/EHGX7RU34kzb1XdMRqBji4262OnW9yn0zjBfhCFa+hmStEScAyTB0bVs5BhwNg919mtI0yF6tF/3n/5g2u5aAOszUKTpB1IvEbf0StLD80Ucj8zixiqs9WHyDOgHFh7Q8ZUmFeESegoJPIAT2ZPo7+j4gCr+r1npJK6LphzDLpGJXVg8QYhJAAfI+PZ5i6Rp6kJOQNJPyEz3DSUldlFclFZqVTmB+CZErLxWWc37N2kkjLPe1Jpq5n5rTDZWe0r0Azxrq0DoXYBKDYWdfnhZllf9JLYDOdxke75bbqt0SujYXKAo2/P6U2fKhF8hWSbmujwjxxNbqIBgQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f86a152-6700-4c77-be60-08df0fe728dd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 09:29:20.9645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MkuJ9ou//rbfN7v03BuWj0G+VPi+ZAAOdaO+SjorkWdSKlbP7ZOeeR+luXi3jgPHD1+NB78B5FsqubLV+JObtulba8zWb6gdzkEhV93tAwI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7866
X-OriginatorOrg: intel.com

On 9/11/2026 11:10 AM, Antonio Di Lorenzo wrote:

> RT721 AIF1 is used for the headset jack and AIF3 for the DMIC,
> while AIF2 is unused when external speaker amplifiers are present.

This patch only updates the ptl-match table, there are no
machine-board-driver changes here so the paragraph seems out of place
and can be dropped.
> Use function topology selection for this configuration.

The statement has little value if any. Explain _why_ no valid
sof_tplg_filename is assigned and the entry relies solely on
get_function_tplg_files.

...

> @@ -487,6 +544,14 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_ptl_sdw_machines[] = {
>  		.sof_tplg_filename = "sof-ptl-rt713-l3-rt1320-l1.tplg",
>  		.get_function_tplg_files = sof_sdw_get_tplg_files,
>  	},
> +	{
> +		.link_mask = BIT(1) | BIT(3),
> +		.links = ptl_tas2783_l1_rt721_l3,
> +		.drv_name = "sof_sdw",
> +		/* Function topologies only; no monolithic fallback. */
> +		.sof_tplg_filename = "sof-ptl-dummy.tplg",

I do not see any "dummy" occurrence within this folder and thus I wonder
how will the code react to such combination. Peter, what's your take on
this?

> +		.get_function_tplg_files = sof_sdw_get_tplg_files,
> +	},
>  	{
>  		.link_mask = BIT(0) | BIT(2) | BIT(3),
>  		.links = ptl_rt722_l0_rt1320_l23,

