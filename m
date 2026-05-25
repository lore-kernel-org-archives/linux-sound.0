Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE406380FDF
	for <linux-sound@vger.kernel.org>; Mon, 25 May 2026 21:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779743435; cv=fail; b=my2nSSSuNabkP+wAuzM0bbeDlb+b67WNHG0q8PorvP/uXeR7t1I1l7EUGxTwpRQozFjy6VGhPirTtIT9C15JutPXFaK/LOjMugVEms217YOXNy4kTuv70pXlcqNOM1XkCgH7aBqbjAduPSeLWh1nMfoIS5x6KSjA+anC0xMQFFo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779743435; c=relaxed/simple;
	bh=fV+qE1yypheWFUcJaCifGclNaoIsW+VxYmCV4L3T9H8=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hxxrZmWC6YphLmlpEMukXkERgWqUkXA6q1UTWSOYYMCGIPzXSD7EQbMvwA5EzI2a5DGIKaCzN6cNv4KJjsMEdTh+7M4q+OKwGn+oP6eT53yxf8dinxzFTHMx2afPHetjvTVFMvCV/aUGJMECZwpXfuNv3H6IEP2VUbsGWivHSSc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WPj+m+zF; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WPj+m+zF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779743434; x=1811279434;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=fV+qE1yypheWFUcJaCifGclNaoIsW+VxYmCV4L3T9H8=;
  b=WPj+m+zFjA0opPM4euHWaYiFAt+eio7YsBc9PjLaYWf9q2WDhhqaOs1H
   PZjybTjoPyq7N5effb6anUD0g8cHwPP8fnb9OiTd+jbZUg6M2dyTV1YYF
   E397fhe5HI6tt7YdjoRDH4Ya442kk0jKV2xmbuUxcuQcJU8JryFPTfDRt
   l7ZmqI/7N467qVxkGbelxWcoTGaE0L4H9A4QaL/h+FYS50LZ1TY8BKrJa
   8tzmqGZXojTX9CT4DlnNlO5Onm9Vp8Uio5CrzLAuuZQfP4t5burk/euL4
   HDNh2Hmti5B0AU/yeD3BcK/TV7n9OcnpQe/lyOgprRk2kQLgpcAvRw4X8
   Q==;
X-CSE-ConnectionGUID: 67bpJYJITwqU3cQyO7g1fA==
X-CSE-MsgGUID: 6BJV/MOLS8y8AaBi4kaZIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="90858611"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; 
   d="scan'208";a="90858611"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 14:10:33 -0700
X-CSE-ConnectionGUID: 6ZjTJNo6TJqTMlu/wcNvgA==
X-CSE-MsgGUID: s+CX039iS6S3g+V+6lCwiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; 
   d="scan'208";a="241883307"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 14:10:33 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 14:10:32 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 25 May 2026 14:10:32 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.37) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 14:10:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WWcw+bZwKnR7EK8F6aVaOQNqQBb4p2sAUmPaY8wVb05jLTi3p+mE0ZUcUrtkBNYA3QIhu4p4YPhEHLDxocfsHM2PlH4TDqMb9XIOGxbg7bYBDRDf7YgrgSqAsg5kWlw3j/gP9Qq+hOlyOmIsJgeo1bz7ix2EhipvU5h0OX6274k/P15nvWKYb1UCtKfjYJC3hPf5+3ap586IEaI8uYwF/L1fqGKdRa6DcW/Zo+n6+Ad9gGJKSBQnGBPTtt1jQciJYtDfcz7r+zvOQanI3JaWvw/q6lNECNaC4ijV4WxuFaqlCbVO2KxuEXlMannLNErwDaRsVLrFj2JjdD7WIK2YuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pQcX5EgB4svkzPvRUk0+3ZlEtC/QwpjnvVwURkoSqFc=;
 b=MqHoCheVeknWb3lZTawZnUMg+zE6iqZq9eIkwIh4W3n/THCScQaAwO1+aEduldF8cfwK4GgwnZcVqPAa0+ZA9WuxDC/uXKKHg75MBFEPFnQLKTLQ5Ide6TmU/h+SaJcep1a5l9FpUqZvhxYOBPTxf8D8/VrPPGRqQw9QeQ5fdWXlK0M0F/fPOuJ4TNkfPhqhfzjoK5bbDVenlHiyGahvU4fV44DyvwyD5thO2nmyQPwt/RUtcrWe9y5Ne3CCYsOkdggRX3vzE0l4YM/jrVxQalX44mMHImN1rOl1QYJuzysKWw4p09l/a2MgsmyvSklVHR6T+DbCKliLapZdlzPJOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.22; Mon, 25 May
 2026 21:10:29 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%4]) with mapi id 15.21.0048.016; Mon, 25 May 2026
 21:10:28 +0000
Message-ID: <d1febb2b-c039-4c60-84c6-9e74af7cb19a@intel.com>
Date: Mon, 25 May 2026 23:10:23 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: core: Move all users to deferrable card binding
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	<broonie@kernel.org>
CC: <tiwai@suse.com>, <perex@perex.cz>, <amade@asmblr.net>,
	<kuninori.morimoto.gx@renesas.com>, <linux-sound@vger.kernel.org>, "Liao,
 Bard" <bard.liao@intel.com>, "Vehmanen, Kai" <kai.vehmanen@intel.com>,
	=?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
References: <20260430140752.766130-1-cezary.rojewski@intel.com>
 <01d1d642-bf24-4ef4-a30d-56884300407f@linux.intel.com>
 <5d8cbbfb-3884-4c6b-aea8-0c9a76964b3b@intel.com>
 <7c01439a-8edc-4aba-bd7b-0e19f4f470ae@linux.dev>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <7c01439a-8edc-4aba-bd7b-0e19f4f470ae@linux.dev>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR03CA0045.eurprd03.prod.outlook.com
 (2603:10a6:803:50::16) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|SA0PR11MB4719:EE_
X-MS-Office365-Filtering-Correlation-Id: 80710df4-c9ec-4efc-b8c3-08debaa20c43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|4143699003|6133799003|11063799006|5023799004|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: z7eg7G97rSwZC+0W+CO3Sjyd3N9E29OKRvUF5kejmLZp3542i9l0+iVFff7ART3QGZ4DPQQsQ/bkfLBT9jaG2CPAcg+BSiRpDeT+w2/CnWN/Zf6TGfETUx+pPT/Lm/jbKx+DPhIsAj0uvaHfNY7AMyxX+9I1PsmaXQKxjPOJgwUnH5quf6lxKUoy3PH+6WpmlqNsrkNBl0wNtnmlQPyfgvF+6DwmsOAiE2IxNrx7wgbYIZSTZJnxGzRcpqzaV2aEcUm9tRJcUrgc4ZhHQQBWdNaHkKPz+t/C/DBxSLFJRkDe4o+l2FkUrlH2ajchRD5JMLITd94lkNRMXxQqZlMHzggtxRcXVmmD7BDIrwddshiCUghZyz4VNE8J6ryRqOlJIz6ucdbJ0V2KFRJ8GdSylnvJksjHZwxS4v/pU7BvkL+ZYCVJm/k9HB3HC17gFZhMoGuo1aqI1bHx098kuvgzVGdW5vXgMnDYRF22PKROJF+AiqPMW3Rzi4iKc353IED5Jld5vVN+0+J2wWk/oDSirb3aMRhDkzC1uWEARPas6ScA9vLbD+tQQ66giD+COde3Qq2zVwVu46Z5eg8XHAtDAXSLcRyNredwUX9jAz8nSjzGOy8BWXuE1/08kJ9xrQ9QwEjv1k3SefyBb16EYrHb/xdD+E9M56WOKlKO+9rdlKrTEVpHKlsrlYbFfXRfGQfTGhAdGrY9sJv9xsOGeoGseA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(4143699003)(6133799003)(11063799006)(5023799004)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0ZIbVdVZS8zNjhWd1BTUmVqZHF5bHZwZnFXcXBWenFQZ1A5VEwrMTVIbDR4?=
 =?utf-8?B?OXlnSEViK3VPdU1WRlBKa05HdzcrOTFXOUVkUzc2TFU1cXNNODIwSEN6eWdU?=
 =?utf-8?B?blRjYllxNHpiTnNFbElFLzU3cWliaVhvQXRDeVEybXpQc2xnVnJ5MkhENlBY?=
 =?utf-8?B?MWFGSkduWUdvekpkNjhZcHhqL21rWCtaQmFpNUV3YnVNa1QzNkxvZzYwOWJw?=
 =?utf-8?B?SlU2VEFscC9uUmVTQ1cvdXRGZko2REt1dkx4Y1BTazBHU0RUZVhKWnR1WjdH?=
 =?utf-8?B?azlHU0tSL1lTT2c0bi9QckhIVjVhU0JCYlRyZkRWa0RmTjBrdFRyUjJmMHM5?=
 =?utf-8?B?UXZ0c2YxbzZKVUhwSFRtaTNBZnZRY0YxM3F6elZzRUorYmx5MWcrRUd2OFoz?=
 =?utf-8?B?WlN5NUN6dzVhaUFzdU1YZ1Yza1E1SmNTWEF6azkrN2R4Vk5wVHg0dkZ3VVcv?=
 =?utf-8?B?WWtxd3FSZ2MyMCtCZGtiK0JkSkVtL3lDMVpJa2FiVTZGa3FVSytOL3dmU252?=
 =?utf-8?B?YlRnTEtiaE5zMVpFQ2ZJMDhsZnZWb1JtRjR3d0djaHY0N3hDZGdRZFBWOGRN?=
 =?utf-8?B?NkFwbmFyZUJrNDd5ckhoNFZnbzJPT0FUdlBLc1oweUwwQjFRMjdNNjdsYXZv?=
 =?utf-8?B?emFUOUVtTVhqNzF1MG1SNkhxR2swQmkyZTJ6Vy9TdTRpNVplWGk0cE50aGF3?=
 =?utf-8?B?eGJQNndiVWVuS3U2S29wTTlhR3pzbnJ0bGl6L1ZsZUJZRHloTndUcTRJQjJx?=
 =?utf-8?B?NS9WbXgyNmNZY0NoTkVvRjVkWGFZQkNPc2RLc01adzlxN2p1WFhIU3Z3Q1Zm?=
 =?utf-8?B?WU8wM0o0cmgwMmcvL0FDMWM2ZjRvTWIrUFJOdnBYbVVkUFpZTHhTOUpBZ2tB?=
 =?utf-8?B?dlFyWHA5YkN1QVJTK00zRUJTK2VLbDdwMTZCTXhRT3lnNkU3Mkh4L2V5a2wz?=
 =?utf-8?B?TDUvOE9hTXNYazZpcGR0SEhFTFlVSjdKZlNxb3lJbTFwM241Tm0yZEpnNXpI?=
 =?utf-8?B?REtZc3VvdjBLak9EaWYyTXVFWEw3UU5uN3hMeE9KQ082L3lJZWttOGcxcWp5?=
 =?utf-8?B?VzdoK0ZUQWJnYnZweityRFBjcXJINmhIcm96R2Zub0JnUGNGNzczN3lQSFkw?=
 =?utf-8?B?eExKb21vT0NFdUtGZC8xNFlyS2RidytaR2VjMitNTFJ6WHljRGNURi9iL3BD?=
 =?utf-8?B?bk9Ucml6bzRmcUJDRUZlRit2MDBIakxrMHhvY3FpZDE1WjJlakkrakRnTGFZ?=
 =?utf-8?B?WHE1WGMvUnhUR0J6VGZKc2N2ejJxV0pUUDdHcWl6TzV4WEV3cDd3Znp2b2ow?=
 =?utf-8?B?VTllMWoxUEhpeVQxR2ZHbHBmMnZHVStYVTVhdHNmNGdWZ21Ic01TNXZVZXI3?=
 =?utf-8?B?aXJTeURQMmdsUlFoU1B0T0JoVFhvVHFNVzJIUC9oUWNBS0NsWWcyZ1hmWDhK?=
 =?utf-8?B?K1Z5VG9wYVd5SVBJejl0aHZPeWNRWitXdWtYd0pxZlRMZWsyOEZ0YWdBWjVG?=
 =?utf-8?B?cUp1Mk1XODR4OTZVditjdnQ3OUN0RG83S2VqVFpqeFk5RVBuN3A4b2l6dGtD?=
 =?utf-8?B?Z3BUZ3BYUktFOGhmVk85UFZjSnEyTmo1QnllSEVjTUhlMlFISEVwRFdGV2RU?=
 =?utf-8?B?RjB6STUxY1Niay9RNU1XdDBBTWUxcUFQYkVCUXduQWgwYjJhb25sOHo1Mkhv?=
 =?utf-8?B?UVZ2WE9BdVFiejhiNlIwUGFFK2dab2FRSzBMTUdUcFVnQUt2Wm9zYmR2N3RV?=
 =?utf-8?B?UDhoS3Y5OEVwUW5jV2NQaHJPRDlnRkNFamk4OWdHWU80b1ZDYzNsREdxRXVF?=
 =?utf-8?B?YnBxT0tZVm1tNWJudlhyN0k3QTBqdGM0NUE4YWY5dXdWYUIrR1pFejEyWE5P?=
 =?utf-8?B?RTMxWE4rQTVJaFU4a1dyaEhrWnFVMXRobGhCcFA0TStoalpQb3BVMm1BUVJK?=
 =?utf-8?B?cEtESlVpN0pYVEY4eDVnc2RXWnN3Z01YVFl4VDdYcHZ3UWVmcXZQRkprZWVp?=
 =?utf-8?B?cDZOY2RRT2ZsbDF4VjdIanRiZmp3RlFEVTU2VEN3K2J0bkNGWVBkMXB1ZVBC?=
 =?utf-8?B?ZGJRS21iQjlwM25LOTFzSmsrZFVNcHZqalVuVzBjR0FJWE5iRUd3TG1wRUU5?=
 =?utf-8?B?ZHY4VE8zUUFXMGlobmsrbkVXb0FVVXBmVTZCcll2REY4bytSc3ZNbnV6OCtY?=
 =?utf-8?B?dUxwMmorZVhaRVFnUVYvaUlwUFo0cGtwVXBjZGIvSHhpZlZ6bW5yVVpLVDNi?=
 =?utf-8?B?dHZlOVM1K0JNaWNPWUlDWjFYSHcvVVpCSE43YTFIQWg2cmVRR29WMlg4RHJU?=
 =?utf-8?B?dk9nazlHZUVDdTQvZHV2dkhDNXNtRUN6Vit5Q0ZxL3VyL1lmNW1YRmc3TmlO?=
 =?utf-8?Q?I9QuknAs0CGcu/eM=3D?=
X-Exchange-RoutingPolicyChecked: qUInWi7feCwzeypIfIOs1nWf9TwcdecOmjxxfJjoxbbNjyYHgiPQwWBrZwNQ00LlCXapWEsceJRXYoxFygii/9IceoHGKWLNFGmipiHsh9+z4TPXdpUaOi5b5zKao+HQJ6gaPFj5Uz7q82rU9LkWXWKj5RXUs/aA07JcQfqnuaCgjTNchWoZPawPhxiU56bWvWtbEU2DXdMsgZaBLo9nNvAcJ5qACnzUnTzzZyvOOrSlILTjpul5EJ6I9VD8y6UcIclJ7eLVRXRoCQxDGT7xsgO3KRNieX37v5AkJNfXcyTIo6KfAm/RCOZvemxmU7gQ4EXXuzD7q+0ib3CuKLPebA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 80710df4-c9ec-4efc-b8c3-08debaa20c43
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 21:10:28.9592
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HBfSgzqyy4JO5DKigx5B9aVp1dKT1pWgeW5Yeqj8H0eS84YMfqA/X3yQewx2zhIKkdi9ND74gWHERCn96zLP8p+2HTs3xUXX0817D6p7I48=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4719
X-OriginatorOrg: intel.com

On 5/25/2026 12:44 PM, Pierre-Louis Bossart wrote:
> On 5/22/26 16:32, Cezary Rojewski wrote:

...

>> I've had a debug session with Peter today (yes, right after one with Alexander) and the outcome is kind of an expected one - dependency issue, TLDR:
>>
>> // working case:
>> 1) snd_soc_add_component(sdw_codec)
>> 2) snd_soc_add_compoenent(sof_platform)
>> 3) <sof card is probing just fine>
>>
>> // failing case:
>> 1) snd_soc_add_component(sof_platform)
>> 2) snd_soc_add_component(sdw_codec)
>> 3) <sof card is MISSING dependencies i.e.: components>
> 
> FWIW the SoundWire codec components are registered during the ACPI scanning phase - there is no dependency on an actual codec being present or bus started. It would be extremely surprising if the missing resources came from the SoundWire side. The probe is done early and returns a clear status.


Haven't solved it yet but I believe it's related to order the components 
are added to ASoC's components_list and the difference in behavior 
between snd_soc_lookup_component_by_name() vs. 
snd_soc_is_matching_component(): strstr() vs. strcmp().

sdw_utils/soc_sdw_utils.c utilizes the former, soc-core.c (during 
soc_bind_aux_dev()) the latter.

> Conversely, the SOF platform component is registered in a workqueue which doesn't go well with deferred binding. It's a known problem, there is *nothing* that will trigger the deferred probe list to be rescanned when the probe workqueue completes. If a component isn't available, the card creation will fail and nothing happens.
> 
> You can test this theory with a simple Kconfig change, with SND_SOC_SOF_PROBE_WORK_QUEUE set to 'n'.
> 
> Alternatively you could try this patch from 2021 that will force the deferred probe to be reinspected.
> https://lore.kernel.org/alsa-devel/20210817190057.255264-2-pierre-louis.bossart@linux.intel.com/
> 
> Note that the workqueue isn't an SOF concept, it's directly inspired by the plain HDAudio driver to make sure PCI probe of non-audio devices isn't delayed by the sound driver taking its time due to the use of request_module for HDaudio.
> 
> my 2 cents.

The workqueue does not make things simple, that's for sure.  But all the 
HDAudio-drivers mimic this behaviour - the avs-driver also utilizes that 
mechanism and still supports both cases (codec -> platform; platform -> 
codec).  Will continue the debug tomorrow, perhaps borrow the setup from 
Peter as "dry" debugging is slow.
