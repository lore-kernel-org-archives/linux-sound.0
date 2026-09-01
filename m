Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20BDE1C84A2
	for <linux-sound@vger.kernel.org>; Tue,  1 Sep 2026 11:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788263400; cv=fail; b=MRL2SLOinpZBckLXHvVtSxHb/Whpa7igcDedGZHDyrD05d4Y7IKgkyzh4gLp7Uy3BB6zUiT/3axyzlpX1Gb0Ojv+vWyZl9qlGqmm9sh1o3pMmxtgWgaFJNaK7ymVL+0rPTmG/YGFqG9z8uWVk/oQVwAlQL518EkKT8rw/kmTot8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788263400; c=relaxed/simple;
	bh=jNNzRyFTH/9yNY9n+pJtVR+qM/dYeK3GWWNt650VJAQ=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=T8Z15BCV4qujVJAZYAw9ONXpXoOqebad8b7UyZjD5tpVVQSEz9e75pDOvIo4GcjK687pnyxOjAywfY5rIq/zQcoh3YIDriNmpWgWe8hWShviQuAMvW4F7bfPMOQsTtBf9srITZKE+T8n6mRWCHV18URutbPVJhqOrCYYGMSrIQA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ccc93wpJ; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ccc93wpJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788263398; x=1819799398;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=jNNzRyFTH/9yNY9n+pJtVR+qM/dYeK3GWWNt650VJAQ=;
  b=Ccc93wpJBDsM4qWpN+M5PySTQi0sp5Yekx5roc/SRzwVwUYXfmkB2iKP
   rerTRRqv41R0z6q1lRuMBrqSex/Ywqa4YcHQBgn81VsfiMqgjMmd+hKKh
   OlpZUTcfm7hgPkJqRljPY8GRUGkXjYJU0hbB234FVmKMeVeNSF07D61+b
   J8iNMT32zIfSxFawywirdcfcm3IxZpAjTtANfzBvaJNXrOEBEk4yDFXvo
   ltRFPQT+o5IJE9c7f0Q0ekGWYVO658gc19OMQxkmQN1AHLzVwvO3IVTYw
   vRe6Z7VTbXeITYEUv5D/O2S1uh3JHgddO7c2FxCy5+jdYDKjjI9Beu6YU
   g==;
X-CSE-ConnectionGUID: BnL2I5YTQEOj0DaoeaMO0A==
X-CSE-MsgGUID: pFAeL9ZpRimlRguZtX3thg==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="88449490"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="88449490"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 04:49:54 -0700
X-CSE-ConnectionGUID: XlRj+w7vSxOtzbxzz7mu1g==
X-CSE-MsgGUID: 74+VDdACSmOYelcrAcXI9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="269652401"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 04:49:53 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 04:49:53 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 1 Sep 2026 04:49:53 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.39) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 04:49:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LExAIYRoaoQZFsQFohrq/XZ3FHLJHAd+iA40s5ZAbL2KHFa9MA613B7Ig4rHmKAkqV3ii8X3V9H7bCC6DbfIVaIot1Gu1WYYtoXd/1GZNUcOh9klsCfZIMhCdNAyH5EXDABzrJsaHl34hRculZi6JlTw01AYYyLlLKYx8fquwCHiGcHEMl+6h1dBtogfiQP73BcMqleYm2ZK2dXzveZlp5UuOC8LzUrWNvJKpDLwNCLrsxHgCTuwwPVXUlsj1U65tgqbjTgLKOdK3luaN0A0zknZYyRk0g7DR4iSd4zRXnUf1YOEqBGdnBVO2UFV9Up8pcXo4vRGi0nwYWwZ7zBoMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0VWgsuq0wDMRzQar5IAq1PfY4FEtI0T0jx2tRyw7YOE=;
 b=wUeLTZsLLJHDq9fiTKMKfIKPkisfZCYJDFw7CP8t9xQLp36xl6eNzSlmqNbZc6JpM1P+OXOv3sVsLAV1FgrHuul03PZaq04BcfsX01blycAwQjAPU7JKpV0z1Ba3w9eDGPj4QAz/mc4KJ3o/bF+7f0EPTZR/Iip8OWUC76gWRnVUGkqsu7aGEQBpW4dDeeLaflpWfgOV3rVmcgrDT0+EF2vW5BhFNlVbU8W6RxaTMAF0DEoGdaZwN+iVHZiQc3uv+NgVOw8r1g7myUX9XJoeQofG7pBK5yn9R5Bp9xMJOll5vqdrByDXbMvr9hUwnB/MccVAU6e0VadkGHzLpy+Apg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by LVXPR11MB9731.namprd11.prod.outlook.com (2603:10b6:408:386::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 11:49:50 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%5]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 11:49:50 +0000
Message-ID: <1cbe18e6-f2f8-49fb-b49d-7fac35dcaf97@intel.com>
Date: Tue, 1 Sep 2026 13:49:45 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/10] ALSA: hda: ext: Clean up streams if their
 initialization fails
To: Takashi Iwai <tiwai@suse.de>
CC: <broonie@kernel.org>, <tiwai@suse.com>, <perex@perex.cz>,
	<amade@asmblr.net>, <linux-sound@vger.kernel.org>
References: <20260831164233.1487766-1-cezary.rojewski@intel.com>
 <20260831164233.1487766-3-cezary.rojewski@intel.com>
 <87se3tci4e.wl-tiwai@suse.de>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <87se3tci4e.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P189CA0029.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5db::20) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|LVXPR11MB9731:EE_
X-MS-Office365-Filtering-Correlation-Id: 06f1f4b9-96ba-4383-a4cc-08df081f20e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|22082099003|18002099003|10067099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: fv6bAPv4Yv44yPJSkD/XwdMHHjsVXjn+I0EQNgMS46EsogFpmQEhFt84HiOEMQ+8bWWBVqvGHM/Ln5NTkutPT4tqQRaXkepnOsu4c2E8iegCx42wPredEt6QRDgadGrZLZVcjiLyZ5uRrrDlOneH2g+ZNJllbQLBtq795Oggu7eUy0lq5z/q4z+kIeO/XkOWnP19bOJE2bjhHfU6rInlmIiEUZn+6/v+93pC271sY76Wx5D/TMVV9gGCmlppzS5RF5AGOexU+gxA+I3VlYTJXkCaugC9CIGAzT5+wyEQnNGXWvjzcCo8WwFP1T+EcshncgKH63GkatVw4wUHDiU5tMdYkFWnM30kpPlM5J9jJk/XfjFPaijpPi59nfVdSfoLSc4Fsz35CkF+Sus3wd+ntCeGRNjiofsOZMqS96R+fYBw7XjFDaHiMu6ATFdhzuwbh/8KqmWGFR7yWklnvxb9KKd/bJ7p185RcMIU7ylCSDpRyr3lTWhvTkGxS3kL1PCiGXKK3WenYMsw529a/LmsIQk/ZnGUObcUFdTQSP6xva5bhVIxQoawLkYupUDJ6/HMfu1Z4yv5OZQOCtPAenCXBvkRBnKRNt35dJ8dDXLEQCtSO/3+Xa1ZUMIdNwC4nCo2TRjXNU+tMkBcfu2CEKYwGx8NSLA/PbCXB+uXMChWFbw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(22082099003)(18002099003)(10067099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bFdaNmZ2SWlxWGNoWCsrT0NXajBtUWhKTzdwYlUzLytobkZkY2pmdVFYRS9V?=
 =?utf-8?B?ekJubzNlYk1qcWdnSHlDUHNYanIzejk3VVRsaXpGNnlrd0lHdFR1YTl1S29Z?=
 =?utf-8?B?MytRb2ZneGhoaXBML2h6UnRiZEplekwzcTRVdU1NUnZqdUJxTTN5enNFUGVm?=
 =?utf-8?B?MnQ0a2NLWHlZV1FoaCs0U1U0UXZBblFtYlBFN0RVbTg3Wk9ianFIVVE0elQv?=
 =?utf-8?B?OFNnVGJyYW5CUWdIT1pwQk1YOHJTbTRBWVB1SzVrYkNTNFlNWWp2TWMva2Iv?=
 =?utf-8?B?TmladklXaFNFVGNJVkZ0L01pZjB1bHpVNE9sdWVaMHoxKzdjQWNRRXUzWEph?=
 =?utf-8?B?NjBGeVV5SGdBN2tGMVl4ZFdrOGF6eUhpUUwyYnZ2YTQ0R3BNVkMwalZReXZF?=
 =?utf-8?B?M2szd1ZXRysxcGFmZllCbVdqZUEvekV6REZiZFB6RE1PbGJvbXRYcjUxTGwr?=
 =?utf-8?B?RGNQS2U1Vkx6UUlOcUx4Vk4rSFprbTEwOTBGUFUvd2pycFN1ZDVIQ1lnZ3g1?=
 =?utf-8?B?N3NIYVV5aTJnSS9EaDNQT0JMTEhEU1RYVHZCVWVLWjQyZjRzU2NNb1ZoSkww?=
 =?utf-8?B?TlRZcVMxdXBYRnNkbDRaQngzczBHMm1qZzVaN0dLdXFhRlZPNlUwVEhwVmRG?=
 =?utf-8?B?SEdzR295aGpvUC93OUVSVC8xNjZrT2ZrYXM2UjBTSlEybGRnZUFNb0FjM1Bs?=
 =?utf-8?B?dTZjVThSQ0ZwN3NzU01MSnpUMUpzVkdsMkpkL1RjWnIrMzRwc09RYnpSWlYr?=
 =?utf-8?B?QzQ5YkNCdFh5SzBlNlZtSVRlL1UybnJuaSs4Wjg3UjhvT1JyK2RFRzQvVzBt?=
 =?utf-8?B?V0NMWDdjT0RVb1VXVWxjWXlqaXRYaFUrdUxWdG9sWGxUL2V5ZVlTSExPY0E1?=
 =?utf-8?B?Vmp4VWJlZkthM2JuK1pzb3ZjdVFaMDV5NVZqVVJlcVU3S3MrLzRteHBQMVpw?=
 =?utf-8?B?Ylc5dHB0S1ZqUXl1UmlHVGhQc1NzYjJNaHpmVHNjYnQwRjFhOTdJMDZIQmJT?=
 =?utf-8?B?QzB0Um8xeUQrMW81MmNTd3o1WVFGc1JNWDB1Uytpb2FnenZscXFVNmpjVDhS?=
 =?utf-8?B?Rm0yUjNqZlRLNmtkMVAvYmhsNHU1V1dWWXJpcnNqa3gvajZBdlpoMGN2TjNI?=
 =?utf-8?B?MWVBbVJncFduYjgwWGI2aXVtbkxEclpQNTRtWXhZcHBvUGZ0RFRwdE96ZUo4?=
 =?utf-8?B?Q3ZDTitmcHlFMlZJMXRaVGFEVEwwQ2U0a2JJc0twcGFxc2VDOVpIUVdUUlZN?=
 =?utf-8?B?UVZpTDE1dkVGMnNiN0ZUMk9OamRnT2lKczgrMURMK0lvY25EMUVIakpMdW5I?=
 =?utf-8?B?RnU3eG53ZE1qYlQ0eVRQZGl6OG9RaHY4Q0c5anVxOTVua1BnTnpHZklrLzZt?=
 =?utf-8?B?SGR0YUE3UTdnV2Z5bEllT3NDQmFrVlo1RVIvTnpZQUJFaFd2by8rckxhdjEz?=
 =?utf-8?B?eElUQ3dOUk1OUXZ0TDNKU2QwK2QweGd6L2JIWWJOYzRNTktaa3k3b0phQ1ov?=
 =?utf-8?B?VVE4Zytuei9SVGt1MFlPczZhR1BoZmxPRW9LZ2dHeDdoQiswZFhFeDFSUW9C?=
 =?utf-8?B?TXFKQWNoNXlDVTBhejQ2NWt5NFdGMmNBMjBpTHc4YkEvVEhGMXIrT3hnWERJ?=
 =?utf-8?B?N0hmeVdMam5jMkRNMUNPZVl6ZVcxZmtNN005cGdxRDA3WDlLYlJtVFNwaG1G?=
 =?utf-8?B?WmFPeTVvdWI1bHhIK1dnYmF2OHlHWWtpeGlmb2Radmd2ZXA3NkwzU2czQmV5?=
 =?utf-8?B?c1VueWd6UU5URC92TVBMOHdLRUJxYlg2cy9lQ0d6U1R4YnNrSGViU2xBSXZP?=
 =?utf-8?B?dERhRFluS2IwN0JyN2lpYUJ1ZG1VU1R6SXRzM0E5TFZsQ0VLNmdLdWxvZFdV?=
 =?utf-8?B?c0pCR1hGTnE0bDhYbVhnOVZ0ekU4NlZpeTlXWnJuczJ0NXc3OHVTbWxxRWE3?=
 =?utf-8?B?eU1hcm01a3BEN1k0MFRvUW5HWmxVNlBiUTcxUGtBOGVVK1J0TlNqNXNsK0JX?=
 =?utf-8?B?UkRRQUhucVBtSEYyZGlsQ3RINHk2U1IvRmQ4azdQcjE0Mnp1WGFPZWFJRDhW?=
 =?utf-8?B?TTd0YjQ1NmNXcnlIYlNDYkZPMGxEOGZEV0I1V1ArMWtFdEZEZnhNTytTeE5i?=
 =?utf-8?B?V2hFcnhYU3AyTkhGTVArQzJpdTR4VUFudG1yZ2ZVM3BWK2YwNlNSNGU5MFNX?=
 =?utf-8?B?Q096VklSZjA5aHZLeGlHSmdITUhtaFpLV01BNUNvck1Cazdxc3FZWE92VjE2?=
 =?utf-8?B?bVUwaVBXUVBLdG43YlJJTlBycW1tYTZXMUJHbjhJNC9RbmgwZ2FsK1lacXZV?=
 =?utf-8?B?TExvTmpFSzl0bGNaOG9iUkRWd2Ura3llV0RtTVpFKzk3MU1pZUNBL0dmdE9C?=
 =?utf-8?Q?Cqq0yk3MxuPazr00=3D?=
X-Exchange-RoutingPolicyChecked: hlXs5ZthnWdmiLVPFrN7rF7EQsDy9xfCMlvBzL09dUu8CnfEURmvx99cBxXNZ/9U5Ff9mag9jaO211QMPhvd7r8lIH1lTvH1fdFceijN5CJI7YHWs+VYSBx+dgLIDmOVihkJb9BA+p9iSm8Bqqp8djZ6fliyrtM8jzs7kZMjLhrEiPHzD32/rRp9CuMPJ9LQiSYebtpk3Ktu17w4FMSm1lFk62KN5DAfy4kxOCIf/g1Hl9yyupBmtosp1ILUNi2C9xIyOuapDPJbUPtNj1x3nA01rpCLC4KPnmMwLPiFWqpGLPen9e9wv+u6rFKLUKPbhaLIZF4mTg6dT7BHCzSGFQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 06f1f4b9-96ba-4383-a4cc-08df081f20e9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 11:49:49.9954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SkVvE68QrXur+UkURcBmzeSM/tYIe04V61WLw1ybiMUQuPsiAF8OHd1EVTs9XGshItU8ly11nJkY3n8h0L35M3kpMgXSIs3Xm/uBaIZxwXA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVXPR11MB9731
X-OriginatorOrg: intel.com

On 9/1/2026 1:42 PM, Takashi Iwai wrote:
> On Mon, 31 Aug 2026 18:42:25 +0200,
> Cezary Rojewski wrote:


>> @@ -94,6 +94,7 @@ int snd_hdac_ext_stream_init_all(struct hdac_bus *bus, int start_idx,
>>  	int (*setup_op)(struct hdac_stream *, bool);
>>  	int stream_tag = 0;
>>  	int i, tag, idx = start_idx;
>> +	struct hdac_stream *s, *_s;
>>  
>>  	if (pci->device == PCI_DEVICE_ID_INTEL_HDA_APL)
>>  		setup_op = snd_hdac_apl_host_stream_setup;
>> @@ -103,7 +104,7 @@ int snd_hdac_ext_stream_init_all(struct hdac_bus *bus, int start_idx,
>>  	for (i = 0; i < num_stream; i++) {
>>  		struct hdac_ext_stream *hext_stream = kzalloc_obj(*hext_stream);
>>  		if (!hext_stream)
>> -			return -ENOMEM;
>> +			goto err_nomem;
>>  		tag = ++stream_tag;
>>  		snd_hdac_ext_stream_init(bus, hext_stream, idx, dir, tag);
>>  		idx++;
>> @@ -112,6 +113,14 @@ int snd_hdac_ext_stream_init_all(struct hdac_bus *bus, int start_idx,
>>  
>>  	return 0;
>>  
>> +err_nomem:
>> +	list_for_each_entry_safe(s, _s, &bus->stream_list, list) {
>> +		struct hdac_ext_stream *hext_stream = stream_to_hdac_ext_stream(s);
>> +
>> +		list_del(&s->list);
>> +		kfree(hext_stream);
>> +	}
> 
> We may reuse snd_hdac_ext_stream_free_all() but without calling
> snd_hdac_ext_stream_decouple(), too?
Majority of code found within sound/hda/core/ext/ needs some lifting the
goal behind this patchset is not it.  Moving the decouple function away
from snd_hdac_ext_stream_free_all() is a refactor.  I'm against adding
an if-statement in snd_hdac_ext_stream_free_all().  However, I could
replace the error path with snd_hdac_ext_stream_free_all() for now and
live with the superfluous operation till the refactor : )
