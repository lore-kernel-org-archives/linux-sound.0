Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969EB3932C4
	for <linux-sound@vger.kernel.org>; Tue,  2 Jun 2026 08:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780390788; cv=fail; b=B3ymyqUi4ssZs818t4focmcDyW04oMDj3hd6VICpHzTIjyS5ot8XGeRTZqfYFTFk3yPOAaYRvzVEoLNZi4h8ueb/VGb8M5/Xa0lcu0OmqklMlHova9A+Fjn/+OPBlXomm+Bc+C0CTktYW6Vquk2zy3MFJi5tsoG1R4Y6pKfmhqQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780390788; c=relaxed/simple;
	bh=VQ1XWTNgzrDOAXiKh+zwibVOmP+r3RLHmcFXJBOtq5k=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MLaqrPpmuWeUg6Oe2HwihF8Xk5EC++ipkoHSn2M6oEwUyU0YfpW5jDuoSbrThlX16ATCYepwXKqBR+1wOuZMpV3IWNOYqjzYb3NMInrpBFrkKblrKiQ44jOpL3hZocc5RnteZa8oQNYLlEmlUI7KejabXJ+4Kivto2M7ZNzMDZ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B/SAiGyG; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B/SAiGyG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780390787; x=1811926787;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=VQ1XWTNgzrDOAXiKh+zwibVOmP+r3RLHmcFXJBOtq5k=;
  b=B/SAiGyGj1NFaMcOdspVko5Kp6cyVMuxq4gzBKvpK78OSJZjtQ/6zuN0
   hl0awDLkxAN4HfBZ2qXgmYeydxu02a66Vg5YeA23slsMiKukKLyffXYQg
   ABCMit2+vgIXH6lkB4X+fwhyTDdIYZC/RQdTyeAp5lPbBzgvtq8e6IZQh
   32AED/r4dqugeP6rTouvA5X788KRIEVvlpTpuCvAf7JhO603be3Psva/5
   Cp2DxI8bt/shP2lgL9OhqQ26acKbG0c9YxpqREenLoiQS6RRTnEOqSPB4
   HXkgMGBY4b3XSJodT5edO8m5OKWuE0+dXf157XT/RyN94ZAbca18EFRwM
   A==;
X-CSE-ConnectionGUID: Uw9+1+17QjijqYGG2TFSjA==
X-CSE-MsgGUID: wIWz6hCnSoyFeOIOxkUGug==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="81032382"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="81032382"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 01:59:46 -0700
X-CSE-ConnectionGUID: 40Cs57iLTGiHuenUAT7+0Q==
X-CSE-MsgGUID: gpXcRwYWQMSXQixt08iBcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="242823269"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 01:59:46 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 2 Jun 2026 01:59:45 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 2 Jun 2026 01:59:45 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.48) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 2 Jun 2026 01:59:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l6EB18SsVWd0l0RUbE4sad8aLO78iKgUZNdEedz0w5hSmZjz2eJIYJPg1JqzNMpCwYEvDrpzLxXeeqdh98+yrG82fUpNWyRzABwU5xv0KvsL5+U55oaKH8WOMOf3pwEMSfVbXXdRzp8FOO6wAvgqKR7p/GV+PkksfeHo1+2l8AmAUs/qh8TX9XXJ6I2BDtkniAZU4pOlPxbI/xEhIcewl8W+HwfavHzJdIZ4qimwoNfWBOIRqbaGqX9v0+StSSemhyYfmqXuXvlOpG571QEMMMd9CZYPMSEODywT62woxtpfCxjijJRvC5oCOMbz0ixe+Is60ctvdX4FShNk0nDOCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vOHs454ST4xSoauHvIZW+SIIEwT98+z9lBZB6TKIuiE=;
 b=Vwwnjsk0W9oYretRkk7Ss6SOClkpxlZUmfjJAQs3G68OzzOfUvANgx8pR026z7adlnwfB3pXvazB9o+Of5kUWdHJxQMuzgS1I22f0TM13+sQ01QvBR6e6dLio9Wmf52zu9tGB6Z/4Xqta2cUFW5GsdRcyTSeDKQRBbMK46M47MN6l0I3rfyLz3hmbBINwKaeQbDhRwYa4xYmZROQHERNsGDwJLE/eyAVH6i7Sd1Lrx07J185+G6ivh5rsPaG7YeheCGScDYb+CR3lUC5BPMT+oSP2X+Tu/H+8TnJFKNNu22yFbGwlssl2fQNzFBdtAOIcuqPW9bepCYxIjOQ4abXsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by DS0PR11MB8230.namprd11.prod.outlook.com (2603:10b6:8:158::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 2 Jun 2026
 08:59:37 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%4]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 08:59:37 +0000
Message-ID: <1b6f8dd0-abd6-4a66-8f1f-09c26b7342ea@intel.com>
Date: Tue, 2 Jun 2026 10:59:32 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] ASoC: Intel: catpt: Simplify catpt_stream_find()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: <broonie@kernel.org>, <tiwai@suse.com>, <perex@perex.cz>,
	<amade@asmblr.net>, <linux-sound@vger.kernel.org>
References: <20260601141031.1606847-1-cezary.rojewski@intel.com>
 <20260601141031.1606847-5-cezary.rojewski@intel.com>
 <ah6Z8d4aCSykFaaa@ashevche-desk.local>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <ah6Z8d4aCSykFaaa@ashevche-desk.local>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR09CA0118.eurprd09.prod.outlook.com
 (2603:10a6:803:78::41) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|DS0PR11MB8230:EE_
X-MS-Office365-Filtering-Correlation-Id: 0210461d-fb1e-4075-5aea-08dec085462c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|18002099003|22082099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: 68cRNC4qRnHoBKGb2NBW+5nlRNpd/6a+Blf+Qt6lf8zn0lKkaC4h5fYMsVM7O5DE/nV1kvgRWpEv/9EtpAOQRX70jAhJyH39DQPUXJR9OGYgfTX1pP1JXTz7ozO23tEt9Fw5D9P6Gd8aV/opI1F6IQCdcPYyw2ZHDxAT63tjyGnD8Oe4+l1uBF5/yUg8BvBXmniwSZ5a/5QjFRpEdUh5ByP1uLOVUvuyZXa44ebix3SJ+e2Wo96C91q2TEdbLvcsUjVg7YzEpNi0K++l6serIuBGdIuDV9xHOQ/IgMI3lEaRPWYIa1fRRSAKgFyFLpQpwqg+bvwYtrwy6pCqTppfBwMED/xjFvLWYiiLVR2V03fzIh8y/3NG4djsIr4MCuh/aJP/qdoUdyQGe3o6SBcg1smZ2MWDrqnBCp/0/z1SVwQ5CH48qg6zDRgnpJ12IqkvS8bPzEJPltkcA/TpCjFmidMYohqIOQwprbzEf7hX8kVf8yZgQwDXNwPN8NQUZWySVk7z1cfdmBLwQBf6xFBlrxWdbBDHR4rhrlSgKJmTqAayx82Jg5s+fxeNeuE7N2brNsxKFJoxGoY4q5YCBoqkFu1IBRsHlb9XQ+NvLAw3ewED83y/YZhOpmhGpptu6TPvhZRqFNlVh5LkIwO8RcrlQsDEudEtE3aPnIooPVCF8UZNcC7WZE5bmDW2t8++tWeY
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHpQbkd1SDFzVlpVQUFRN3RpdGhtbFpqalU3Y0orOU1QUGhhamNWMWxpNTRM?=
 =?utf-8?B?SHVNN3NFU3VQRzBnVitBUDJPa3hEYkxkbXlzMmVYbkNXR2pzUnIydjM5WE5a?=
 =?utf-8?B?ZTViT1N0eWdJS3NLaWZqMWxFOXp0SzdwSHRuZVFDRXU0ZGp6ZTNyZEk3Uk9J?=
 =?utf-8?B?UG40VE8wOENZbi9tOWxFQ1JYbVBJNkVWRlFsK2lhMGlvTXJCR1FVV0dHejZa?=
 =?utf-8?B?VHVYVXRZcFBaVVFGbjc0c21EcmFIUXlYMVp4djlCc3BuUmFncTV6bFp2SDRP?=
 =?utf-8?B?SG1VYWE5aXlScTEzVGZYR2JOa1doUjlkVC9OLzJvQXRJTkJaNlRZTDF4UzRi?=
 =?utf-8?B?MGppNlBCTDZRckZUWG13UWllVmRDak1nVExpN0FxRUMxbk9DRmR5bXgvQlBv?=
 =?utf-8?B?Zmt2VGgrOG5ZVlFNR2pNQVNwMWI3amNlTFVaenBUT0ZYM3cxenNjbW9UMk5s?=
 =?utf-8?B?RVkvNHkrVHlPT2FIM0l4RU4wd0tHL2lHWG5mK0F2V2NJbnl0WmJvdzZPcVN2?=
 =?utf-8?B?aGFKSWJyc3BZYkNXZHFTU1ZrOUtrR2d1cFJQRzhhWEc3aVA1MzlOamZjSnNL?=
 =?utf-8?B?VEU1Z2hZc3Q1MlpXUG1SMldDY0Z0aHp4cUk5Vml4Z1VONkVxTEJUWFZhMGVR?=
 =?utf-8?B?dGtmWDdsOVl5QmpudlBKb08vRERvaW9paUZiZi9md3JtUmVxbUxsQXNkTEF1?=
 =?utf-8?B?N1ErNkJ3OEdROTNrNUtRa0lNaG1GbWlyOHpKODhWWFczSGtlem80OSs2WHl2?=
 =?utf-8?B?NlRNRlRiT1VZSXFVMHlVTnk4RmNzYXJLdWpYM1g4NmRTamx2RDRSZ1lWemky?=
 =?utf-8?B?bXZpa29wSmV2OUpmVzVBVUo5TXhyWm5oSXkvM24rZ3JUUXdoMHMvNDltSGF3?=
 =?utf-8?B?V0Flb3A4dUExY2hOcktvanB5WXdRZTRKbkdSVDYyOEswSzBMMkN1TnJVeCs5?=
 =?utf-8?B?RmRkSlZ5aHdmU3hWbUdLeTRsWTZwdkFkTG9ycmJiYkUzMlE5b3ZhWHNqN0p6?=
 =?utf-8?B?dDRnZG1yTm9INVJxUGFSOEVUZ0lhc3RPa2owY2tiMG1OTDZLMHFodDVtaHdJ?=
 =?utf-8?B?UWhLaDdsRW4rOEV0dlFlQmMxMFlxOG03UEJBdVZkSUdSZjN3bGhrMDArOU0w?=
 =?utf-8?B?WjIrcmhUcHBHUCtQbnA3UWozNzJzZEY1YXVzZVFuVHVPaHF5VXBFQjMyTWVZ?=
 =?utf-8?B?NzJtZzRhRnk4SEhlVkNqZzFwMU1HZUUvL252aThDSVlqSGRnSWJwWEZ5WUF5?=
 =?utf-8?B?YW9laWZvblhjU2owbEEwUmFZVGNxQU0rdWdLS1A0dTROamk1YVNiMVA0QVV3?=
 =?utf-8?B?RWY2eHNsUll2dnR0dUxpM2JheGt6aHZpam45V3dwSUlEMzRVVmhkQUplaDQ2?=
 =?utf-8?B?SHdDVmtQNWpPekJweDc2L1dQekRFSGg3akYrV2xTcFo3eDNLcGhhVEZlSVM0?=
 =?utf-8?B?Q0NsMjVWVzViZmxqWldhV016aUp2SWZURGFmZVNRZk5xTW5QSHArVzExSjZR?=
 =?utf-8?B?WDZyaGFYSmZld0IzV09WVUVJSWdjR0Zla0xFMXordDVtRlFmanNXS3ZXVXFq?=
 =?utf-8?B?UzBMRmNpK0dtcHV2SzJCYW1SeFlwa29YNGJiNFBMY2ZrUHFDeERWSGNZOGNy?=
 =?utf-8?B?R0loQktTNTFkQ3BIUTlVTmpUQm5RYndMUWJ0WW1DdFd3aG0wdzl1S1UreUNr?=
 =?utf-8?B?UGp4VW53aUwxOS81SGZFYXAwMWExcnRZS3drQnI0MGQyVWNpdHMwR2FkTzRT?=
 =?utf-8?B?amI4MnBiemRXRmlwa24wS0RqbTJ2UmgzWVBKZkFNZ3JheHRqNGQ1YlgvbjBR?=
 =?utf-8?B?aWFWVnJPZldJZlJyeVlZc0wyVWwvQ2N0eDVVUWo1aTJBaXFJZTV4QlpZVGpy?=
 =?utf-8?B?eU5qRUNOWW5vaWZyTVQ4alRCN1F6Vkh6MjdZck9WS3FUOGtZQTc3NDZxWFFM?=
 =?utf-8?B?bStGakswOUtQS0dxREo5YU5YY2ZVVG1STEFETGlvME5FenRVY2JQTzZDamIx?=
 =?utf-8?B?Nk1uODRnaVVOaWk0VjI2UVJXWjg0dCtFaXRsUVVJUnRqSU1GK29QZHRiVkU0?=
 =?utf-8?B?ZXQ4UHhBK0lzbkMvQUgzQm90ZDdTMlNLK1JXZnNGVDFKNlR0ZGRYT2w1ekN2?=
 =?utf-8?B?Q0tuUXdoRCs5Sm9mU0xZakxDUkg0U1o3MWg2VERIYWJxMm5POTNWTlFOLzB1?=
 =?utf-8?B?OGx3Zk5Pc1RJcS9vR3lleGNlYmxOSDFyVzlDSWQwaXpoaGRLOTVOQlhlalJ5?=
 =?utf-8?B?ZU1VUFJyRzBPWFJzZG0wZ3hPbVQwUjNFMlpwY1o1WkZMUlR6dkl3cDVvV0l3?=
 =?utf-8?B?eWhLMzhobDQwcTdSc3RXRkt6ZTk2dm5McDRGRTFtTzFrQzJmUU9YK0tvZmNr?=
 =?utf-8?Q?rN5xNFUnUUx9SFuI=3D?=
X-Exchange-RoutingPolicyChecked: aOtwpoSlUeLgMvsRMCK8ruoiD6sGFwMDYHfsKhdi05jJ4GLb9Ipd5gVyfEGtDaLvoPFJykj9evszVgw7b/6pB/zfPUrpdYI4yKrAqqVoBc1Y5nsH/EmpuQZF1WbNw6GJ29LQ2X2M/zHXDv8h9BdUu5Eu2QdICvKujSypbZX9h49F88D0DuPlz56RDPzE2//5mu1lZVxr7GC7x+D7O/U+pBE0dP/JwcSYhv1ULsF4W6bbCE5R9IvPZHmz8tXz+6s4Q+ntUFstg2tJzLDZGcs1ojm+16UCgHlZCo8XF8E5PduGnXP0psnsxbNG5kMYUIVIrm9WfcxGSAPHY06D7XiJ/A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0210461d-fb1e-4075-5aea-08dec085462c
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 08:59:37.6293
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FDdFyGR5W7EYPXxJpEZgZFPxlJ1jU5aw3mUt21yR8jlQn8Kqr+Al9n2dUG7CXg3FddHoPOF3gpuPaWyYsdc1zMdKQOYdzNCB6m91SZJnr/A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8230
X-OriginatorOrg: intel.com

On 6/2/2026 10:53 AM, Andy Shevchenko wrote:
> On Mon, Jun 01, 2026 at 04:10:28PM +0200, Cezary Rojewski wrote:
>> Code line reduction and more transparent variable naming.
>> No functional changes.
> 
> ...
> 
>> +struct catpt_stream_runtime *catpt_stream_find(struct catpt_dev *cdev, u8 stream_hw_id)
>>   {
>> -	struct catpt_stream_runtime *pos, *result = NULL;
>> +	struct catpt_stream_runtime *stream;
>>   
>> -	list_for_each_entry(pos, &cdev->stream_list, node) {
>> -		if (pos->info.stream_hw_id == stream_hw_id) {
>> -			result = pos;
>> -			break;
>> -		}
>> -	}
>> -
>> -	return result;
>> +	list_for_each_entry(stream, &cdev->stream_list, node)
>> +		if (stream->info.stream_hw_id == stream_hw_id)
>> +			return stream;
> 
> Please, keep a blank line here.

Agreed, will give it a day and apply in v3.

> 
>> +	return NULL;
>>   }
> 

