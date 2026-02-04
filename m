Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E87314A7A
	for <linux-sound@vger.kernel.org>; Wed,  4 Feb 2026 12:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770208092; cv=fail; b=d6I7YUQtKHPXsWHTWjrnyySY5CeqtBnDddXeuuONnjG47lG69dDBhp79o9Qf12q6w8CSYJcIi2PFynxKU+Qr4ZbqpgFkd/m2qgHadBAl17kdBAUonfHIvG40gv2XX15NU4ynKuwPjbscaMLzOkw1TMWDMhppIsyyjZG7WE26yO8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770208092; c=relaxed/simple;
	bh=Gd5YHTWJqutBe7S5EZIuZ5EwwN+WrR57cH6c9RhSEew=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jB2pQ9RdEbwuCCyfleoyzll83fht+BlUJILPJ8AuYT8wF70L4W661UO+hdU4tA/DbO/NU4ta5bIVcesa9lbtmv/Dqh0QW64RzlqLfzxmv0KeUT7uLjOVK+10OsAhs0evWg6sqeI4G1LYtg1ZeLDgUaBr1TAQF+FMQzKIh+jcgLU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jfVO4/fs; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jfVO4/fs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770208091; x=1801744091;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Gd5YHTWJqutBe7S5EZIuZ5EwwN+WrR57cH6c9RhSEew=;
  b=jfVO4/fs/+272PoS5l4B99rIeLShx5Sts8HVt8FsM347FZ4Yr2zDvFmF
   3+LXJPZZugEmWFkKUy6lBIVUjseNHbVUPeB0gb5sPSYp924CV3wpJ35S3
   bDIMTsmEbzOfoHyjDJKuUFvKmT1UB0hU62t4bIBv8v5XtdLJbMpKUuB3I
   9HHuuEQjc1rqam0Yyl060iwVpGlti9Qa4mn9FJR2fjTzh/t9tgZAPC4rq
   G65LS67TP3/Q4WOP0I6A/UTXHe9uzGmPIkiI/5SKgGTr0DGvn+uqV6ZC/
   dhHMT7/0o0qrmkOJ2LUIcXES5ZvgGVZ7VFuCWPqFZrKtRmmck2nytSJpi
   g==;
X-CSE-ConnectionGUID: 1Nk8Li7mTVyVDxeU23UBBQ==
X-CSE-MsgGUID: ZOGCgEZCTcGZKsJI6vnyDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="82025909"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="82025909"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 04:28:10 -0800
X-CSE-ConnectionGUID: pHf3opL6Qs2B3+gtX5Zt1w==
X-CSE-MsgGUID: dVJlZDT5REihmKj7aNwYlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="209517527"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 04:28:09 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 04:28:09 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 4 Feb 2026 04:28:09 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.26) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 04:28:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n+rCgCs/BVNzNoaLjO2N4XvT6qzkUglG7vXqqWcB2hlU2mcbJ4mbYDs8ynhZuTANV21Dplq6IUvg/muEQY9wMcvk7c8QT+ITfxDgqlt4NYuaQrmK4K9ZFRJ1Vkm9vdag+Nbcd1cqfMn7zZvRx22G57ESRPsZw55MfywbW281cGViZCmc9MZ9QXNnUjOqJYUB2FK3EY9Y8zAhBy9atMf+kuvdA8E5lmZ4z+TW32iWPyG1V9bv+XBrE31ZaXbOmUCbPs+N1d5GHFNy04AJwhoRh6zZTwaWSf79ycCKhcrjCD8WuSGcTUQma3cZOX+aFJ1Qjxg7brc0qXkRmm/7M8+xEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qRqupT6eEXeO2tCtp06BCdiFjza6snb/cnXWaX40HQg=;
 b=BJko9w1L8R11GNPp1TOm5rFMw6/a0MABQtJK87lYAanuhzWKBrCBZxteh17ykQnfAgfYJHopMv/Ct77KjHQJh3XE6P1zlbbzW4ZI1+iLnzDqkyTBNC1nEM5DdFa4iKk4twX/UxTlxMxRAL6VFiUONgk7yMAQB6Ue8yAnLBn3/tbWxQ3BlCoKtL9bDdR21rAZmA3pPAXsYtR83RvGCTCYmnapfGpnSzp090cdUbTbhCFuc/KUv7r2oXBCp0Rax5i+W4l+2146QhqvLnRzBjbytZEV5k/LtGRPuBVWFj+W03FA5Fc2qFqTwQ9Mv7FjdudNfAuntPzas4DbjAuVUjB8pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8283.namprd11.prod.outlook.com (2603:10b6:806:26c::16)
 by PH7PR11MB6652.namprd11.prod.outlook.com (2603:10b6:510:1aa::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Wed, 4 Feb
 2026 12:28:07 +0000
Received: from SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214]) by SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214%4]) with mapi id 15.20.9587.013; Wed, 4 Feb 2026
 12:28:07 +0000
Message-ID: <407b1224-be04-4737-a8b9-42f70b8cb635@intel.com>
Date: Wed, 4 Feb 2026 13:28:01 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ALSA: control: Verify put() result when in debug mode
To: Jaroslav Kysela <perex@perex.cz>, <tiwai@suse.com>
CC: <broonie@kernel.org>, <amade@asmblr.net>, <linux-sound@vger.kernel.org>,
	<kuninori.morimoto.gx@renesas.com>
References: <20260204112609.127085-1-cezary.rojewski@intel.com>
 <08cf484e-fc2f-4878-ab18-c80798b844e4@perex.cz>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <08cf484e-fc2f-4878-ab18-c80798b844e4@perex.cz>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIXP296CA0002.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:2a9::12) To SN7PR11MB8283.namprd11.prod.outlook.com
 (2603:10b6:806:26c::16)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8283:EE_|PH7PR11MB6652:EE_
X-MS-Office365-Filtering-Correlation-Id: 22f1d642-98ff-4773-57f5-08de63e8d99a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WkV1QSt1VTk3QXJ0a2ptUk13NTNHSWZ3YnlmR1Y0TmM1aS9xYlVxMklPRFlv?=
 =?utf-8?B?WEkrZ21UZG5wTkY0SnJJOTgra3NreDNzNC9KRVRwQVFianl2emdDUktucStZ?=
 =?utf-8?B?ZkkvNkxUN3ZiRDlFa1ErZDJHMmJLVXdHQ0RNVFNoVnhvMVoyM1J2TDZRZW1U?=
 =?utf-8?B?OHpTeXdqT3VPUnZCb2k1THAzUldQSS81d21aUWQxQmhFRHh2bURFVUdQVnpq?=
 =?utf-8?B?R2JLaVFXQ0RJSHpDOGs4SEtpRWRhWW1MNzBYL1R6c3VSaEJ6WWRQVGtIOWtC?=
 =?utf-8?B?cnVqWUNCby81ZFBHNG9sT01iNGRLSlZBdzc2Z2dBaFROdlhBNWk3MXlNRTVw?=
 =?utf-8?B?Q3FQQWlHdExIOGZuSFhqOE11U08yRmpCN2tOUnJ0VGhBeVVETHRlQS9ZUjR6?=
 =?utf-8?B?VVp1d0xlZStqaEtlUi9QdGJDY3RNRC9qdDJiSW10L2ZEc1BxTEduOFVPUGI1?=
 =?utf-8?B?a2Qxa0ZGQ2E4ejA4WTNacE1lamplYURxMUJ1dE1VNDRzWlZjT2NzWXJJeWtS?=
 =?utf-8?B?d1BXMmowT1NSWUIzZm1NTzBTMVF2NHBuU3pFTXRPSHRZd2xDZVljZ1Bqd3JJ?=
 =?utf-8?B?Wkl6ci96VGtsNW5RWkdFOHhvQndrM1gwV3JjMDJ2MFBnTWhtWWdlSlNFbUpU?=
 =?utf-8?B?b3RsT3Zta1dOQ3ZyUmpBWlFNVGs1aXU2ckQ4MjdNSUpsRnlsdytZRkN1K3pQ?=
 =?utf-8?B?RCtqVitpL1NaQ1FFQlJlK2R1RUVRSFB2WVlxZ0Z5YVRQWisrQzJRNXlIRnIw?=
 =?utf-8?B?YjFQaWpLK0NMR2dJbExxUU9XMDkyZzFhUGptU3lDVWhYNVdOZkJSUk1PWXk0?=
 =?utf-8?B?WmRtdEpNS0dGVXNFaG5GbFhJMiswTzZWalQxV1BnWFo1UDA2WUhiaTMwaHc5?=
 =?utf-8?B?Mjh1bUFTZ1k2c0MrMDNORGd6K1ZFL0tOZmE1L3VTTjRYV29xTDFVSWpoSEtJ?=
 =?utf-8?B?U1FXOUVmazhBOXRPL2ozaVh2TlFBWmc3WXhYRlAvK2hpSkxvaEpUaDRyV0JJ?=
 =?utf-8?B?WUgwZy9mYWxlTldUTXgyU1VEUmcxeForOW5xQ09PRzJpMnEwNG00ZDZJRjNn?=
 =?utf-8?B?UDdaeWNkMWdnTGtHOUhpeXlCUk52TXRKUGxJWFFVQ0tqekg3UGQzMkZTWnN5?=
 =?utf-8?B?RXBwR2dDVGV5TmZ5eEdWaHdCMVF5Ny8vdFhLMkNjNkZwN2cvZHZpMVpxV1hj?=
 =?utf-8?B?M2RRckFLSnNYY24veGZaQTlMSkh1V3ZEUFcvcGwvL0FFN29sUEw0bDhBZHNG?=
 =?utf-8?B?N21BYTdMWnRPdHppeWNpN2c1VDhncEs2anhtSkZxYkV2TFFvZ0tJeGNtRmRC?=
 =?utf-8?B?NW55VGN2R0hHQ0VNOGwzRjVkSWdQd01iRUxrdGxvY2VrUmxRdGN4bEI4TjlI?=
 =?utf-8?B?TEIvVVc4MjNQZ3lDcTgvelZVVThCemZwUWxDa1ErMGQzMzZYNElFellRT1Q1?=
 =?utf-8?B?NFRGTC94UmxnK2hqMjkyanBXbFk0ZUdpd3BJZ29VbEJ1YWFWMjMwd2FTMEV1?=
 =?utf-8?B?S2IyenVGU0l3QUp0OE1pMlptdEcwU1E0YUdHeXBsVzJKRVVmVjl0N0ZnNzEy?=
 =?utf-8?B?ZkRDN1dKUjE2VFZLcGJzOG0vUndDS0tGRUM3eTdjLzNIeTR0SzRVaStDVDFV?=
 =?utf-8?B?RWhscGQzN3Q3SFVXczNJV1dObVpIcERhYTdOL1I4enI4eHBKbldVN2tDOFdF?=
 =?utf-8?B?enVKK0FxNTBON3JYU01FNmpaaE5DaVNla0NQYjJZNm1kb0tvSDFrNFprcUkr?=
 =?utf-8?B?OTFLaUdjUVZOR0NsRU9PTVloejJraEdxSHhJZXpCSWx4SGFja1JyN3IvNkRr?=
 =?utf-8?B?dGNTNjZmWm5IaFNsakdvcWxtOHh4b3dpam5oZTR4aUdzRmJTMnBDRC9CUTlJ?=
 =?utf-8?B?enNnOWdkazJEbVlLYkFOWnJOaGQySDkrNUZYYnJlM05sVzVCcE9GSzJDR0cy?=
 =?utf-8?B?Q0g5WlMvZVJVOFlkcFFIaDVkNUw0SVIvMXVCS00zOTZaZnRqd0pLenJKajll?=
 =?utf-8?B?WjBsWVc1UVRhSlRGcGYyaTEzLzJYUkd5Q29rUFdIWk94Q1U1ZlVtK09uaysz?=
 =?utf-8?B?azFKeEpFeHJuS0ZqRVRlMCtpSjdHSmUzVkhQWXpwZllsbjEzSVVxUG5zcDZn?=
 =?utf-8?Q?EB6g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bDExV3hsU2tHb1JpLzFra1ZoSWxZaWdjOFhzcDhoM0tFWlBXYXl4SXBzc3NE?=
 =?utf-8?B?MmFUc2NIZGxWYU5mNzVBTUdzaElUZ1NoYnYzSHE2bXgwV0llbDQzdWJJTER3?=
 =?utf-8?B?N291bWQ0NnR4STVQeFA5ZHdlbkIvb3BwREJIUWZzdWVLMTVySTY1VzIxL2tu?=
 =?utf-8?B?L1RNOGhyZkY1c1ordlU3MFdNTVUvaStJZlFFMEg3NFMwNjB2UmZWYXdUU0Mx?=
 =?utf-8?B?VkoyUGU1aUZheHRuTFZGS1FHQkRDaEU2Nys4b0FJdWgwNE1LTUp5T3ZCQXc4?=
 =?utf-8?B?ODRlSU1LeDQ0T1owZGJJN2g2RStwTWk5bHppNStsUWhZbFZzckk1ekNPYnVl?=
 =?utf-8?B?bVdxamVEUlFnc21uNkg0TlpMMFovN0FYbEhqWHdkYkNFbEpDWWkzWkhaMTJ2?=
 =?utf-8?B?R3RRSFpTd3plUGZaaTFjYmR6U1NQUnFzV0QyR2dDMlk2MzJTUW03d0lVelVo?=
 =?utf-8?B?T2p6bHJuUjJoWENyWEZWcmdtMVBRczVVcEdmVnNDaVBlaDZRdTVCbDdaM015?=
 =?utf-8?B?V1R3S3RMMjRWMHZHb2MyVWNmQ0lNR21hSENVTTRlNEVWUFVhR296ZzQrL05P?=
 =?utf-8?B?TmtobXhYUk5XQWxVUkhPR25mSTQ2V090MzRvTXBaUldPMG5RMFpVMnVIWEtD?=
 =?utf-8?B?QnlYdmNSSXVFWG9qNms3UzBqQUZNdjZtR2dRd2J3cFAraTFCOTBuZjZQdWZp?=
 =?utf-8?B?MkRESTExcjIxR000cUwva2tjSWJQcHpDUFBPYjNkQzFWMEkzaFRneDVHSEpk?=
 =?utf-8?B?ZHczaVA0a0FrNlFsVXJGSHFNdng1anhiOFB2TXNlWTRndnpVR1VFYkhzKzZC?=
 =?utf-8?B?RlJuUHd2aVlvSHlTRTl6bjF1MG1McG9uNnd5QmhkYnVEd3Y5QWU1Q0R6ZDRq?=
 =?utf-8?B?UVJPdVFidzlUSWhSbU10aVBpZzk4Mzdza3pkeURRSnJJdVhzQ0JlTXdUNE5X?=
 =?utf-8?B?ZVhhUVJ1UXBtWjA0ZHByblROR0hsWTQ5aVdKaDFKa0M0L21kakZCMDkzTllK?=
 =?utf-8?B?Nnp4cUU0N00wNG16THdUeWxKK2NDaDZHWnB6QWlCNHJCeExmTnJndmVJL0d3?=
 =?utf-8?B?a29sSDVlZjlGZ2lHd1F0bUJua3pLdFM4Ykx6Yjhjc2Z6Z0JBcmJ0TXpza05Z?=
 =?utf-8?B?WnFMR1hjcWlvU2pyOWtHNE9ZcC9EZmVVRTNCR1pkekxQeklnenFVb2k1bHVX?=
 =?utf-8?B?Ni9GUEhRNU95aHJJSzZwdUVGb215eUU4b3h0SEVFZWQ0T1RnN2c4R2ZycWRO?=
 =?utf-8?B?bUdNNUZFQndnbE9OTVNQbUt0M2xsT2hpM2tIRVEwajhhQlZ4YnIyc2RhbCtq?=
 =?utf-8?B?SDM5M0J1SHlUUmF1bkEvazFhdHArcXl1cmNyOXUrQUJwMVlmM0JvRjlJQ0lW?=
 =?utf-8?B?cmluQjh1dGlRcG0zVG4wT0F2ZHhKMml1UzJUWXFsbGNxbkVZcjVwSng2SWJ4?=
 =?utf-8?B?QzV2cFc5RU1VbVBxdG1GKzBRSHlpYkI2WklWbGUxRDhVMG5hd0tndERZb0xv?=
 =?utf-8?B?M0N0VHI0RU5nQTZ4STlLWFZ5bElzbEZwOVhVZmtSZk42Y2NDckxlRktoRmp4?=
 =?utf-8?B?V1pzRFRTRUFQSldHSmUzd1VsdzVHbGNGb0FUTVFmNFY2bzRTR1pHTVc3eW9Z?=
 =?utf-8?B?aUxrVld3S1o1MmJ4WmVscVd4dVk5UU5JdUFOUU1rN2N4SE1LeHE5QTB2VnM2?=
 =?utf-8?B?bmFYZTVqWFd5ckkzZncvckpIQURjcU45cllVNjlDQitxR21mRWpnVWVDRVBM?=
 =?utf-8?B?WGJnU3lOTG85S0pCWWY4NWxGc0ZSMkpqSU1wMVV6SjZYRXBSeENUL0g0SkxV?=
 =?utf-8?B?QmVXRS9UR2VKTmU0QWVrUHNNRHMrdklTd20yK29CUjNEb3ZSdkZJa2V4S1Ez?=
 =?utf-8?B?Tk5vMFpNcXM4QzcvQkZ1MmNNWnhnWUl4ODFxcElaL1lxV3RVK3JwcDdEa04v?=
 =?utf-8?B?S0gwTE12THFZaXNiMDNlaVVocDlEMHBuMTUwNy96TGhwNXJLMklpYnZHMmY4?=
 =?utf-8?B?b1VadFhuM1VEcHBVQmhYYjNHaXp0OE5kQzVXVlVoeXlPQUJiWnpmZkEyazZq?=
 =?utf-8?B?ZmVjSC9IeEU3NkN2Z3JDUlArZlhsSmtaaFpuZXkyZnBDSUtjUGZGMWRPN2Zj?=
 =?utf-8?B?RE11WUNkU2ZvRW44cERFblRyL29TUE5rcko0NW5DSStNRlZpbHJYenN3S2FV?=
 =?utf-8?B?dXVrOE9iSDRDTDVsNlJwSGJ4ajJwVUQ4Y3ZZdThjdnlZejA4NVh6b1Y2UnQr?=
 =?utf-8?B?ckV1NUF0UXRXSlQrdEppU3ErbkJMYXdlTWdiN0xvcG9IeXNhNkVFam54VkFh?=
 =?utf-8?B?c2Nha3d3M2o2Zk8zR3FJakNWVFRJRnRDVWhuNGc1Mkt4YUxEUUlvUEdzTWRN?=
 =?utf-8?Q?eXM1btAHEAbq1/XU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 22f1d642-98ff-4773-57f5-08de63e8d99a
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 12:28:06.9768
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jFSiCAY4hGXFagPkeEgsCZqOkp/h1mVB+PPXuDvSFFlYgv1Uxd9IZvUR96FxJtuvU6snHxSNBdpXM+X4XGBZgbsWLdq6Y+0ccY4nW1qcq1Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6652
X-OriginatorOrg: intel.com

On 2026-02-04 12:46 PM, Jaroslav Kysela wrote:
> On 2/4/26 12:26, Cezary Rojewski wrote:
> 
>> +    /* With known state for both new and original, do the comparison. */
>> +    retcmp = memcmp(&original.value.bytes.data[0], &control- 
>> >value.bytes.data[0],
> 
> I think that shorter &original.value and &control->value pointer 
> reference should be enough here. It's also more readable.

Agree, will do in v3, thank you!

>> +            sizeof(original.value.bytes.data));
>> +    if (retcmp)
>> +        retcmp = 1;
>> +
>> +    if (retcmp == ret)
>> +        pr_info("kctl->put() returned the expected value of '%d'\n", 
>> ret);
>> +    else
>> +        pr_warn("expected kctl->put() to return '%d' but got '%d'\n", 
>> ret, retcmp);
> 
> For volatile controls (SNDRV_CTL_ELEM_ACCESS_VOLATILE), the result may 
> be fine. I would downgrade the level to pr_info for those controls here 
> with another message.

Does that mean that verification for controls of access VOLATILE may 
never be fully correct? If so, maybe let's leave the developer to make 
the final call, whether it's false-positive or not?

Another thing: Many info() implementations, if not all, ignore the 
assess assignment. If I'm not mistaken, info->access is left as default 
unless __snd_ctl_elem_info() gets called. Reusing it would translate 
put-verification into everything-verification.

Kind regards,
Czarek

