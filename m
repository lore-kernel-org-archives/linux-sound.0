Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178D11BD9CE;
	Thu, 11 Jun 2026 19:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781206475; cv=fail; b=ZIaluLIgezAkV1NW3ze5o8Y5EyCPQbvpUl6VJ72OZpb2/+06Hlj6NHb0nojZS9HnH6jgsEju5JeDckBe+Cse/MxwBkuAqjCkP8CxQcq+IOuyym1Hixk2BcQ5Cyn2k0zlcFu0IAOlrO+x0B4QHZkOW7ugqWMvwagQDiqkc6fXAYM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781206475; c=relaxed/simple;
	bh=w6Ltz6hJFAcDJusFMDJLKEjaU71F8/0EIjWX2uowaYQ=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=t7WkYPedzyrlV7CEZm1GYFj/bLLAQua9Em+7/t5Li7SZCpMVkb/BAxDfszYwzVIKvwejxQxRc1Avq+x6cGRNImbJuVlI1aIf4bjYd4wTi9SKm465aVCzi4ab7J/ycSh+VS6ODl0uEjPvBZMgqapUZKjpCcJFcX7g6fu8KtfQGhE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WFSLNOxK; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WFSLNOxK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781206474; x=1812742474;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=w6Ltz6hJFAcDJusFMDJLKEjaU71F8/0EIjWX2uowaYQ=;
  b=WFSLNOxKzLg7G+bQwa3CAkayf4neFbaCUX4kdQEJKbRq/OQnOGgUypLB
   OtKkiSeuPcMXT1CGPeJc5tMgXeQ1CwgeTpEmTSwFznWztfp2g7aK8jeNH
   zCLIByEbU7LGpxGL/vvBuGUMzjealjitAKkZnAcc1yf8Qnw+OLvI1pNTR
   tpen82Sm190keeFulQv1WsZiO9MD3rrOxKTNNfUy5kAmRhOMn7CFtqZJs
   hmafxrBlneXxgsAeFUuHnigdY/1cP83MD+BaWNKUjLPUtxAomSIORTzfJ
   Dhjkyb4p5JEXIs3Bhz+X44Bn8JrzSXU0NrW5IfzrhPt4W4pvb4yTJlDOQ
   Q==;
X-CSE-ConnectionGUID: 1dVvpFBSSMW3EmSSdSOK8g==
X-CSE-MsgGUID: hdlp5o3UTpu9ftLpUU8xGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="69577813"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="69577813"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 12:34:33 -0700
X-CSE-ConnectionGUID: hPO3y0SlQNKVTYLsz74Y+A==
X-CSE-MsgGUID: xcFXO8SBSA2j/ycmwISrqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="240244550"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 12:34:33 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 11 Jun 2026 12:34:32 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 11 Jun 2026 12:34:32 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.15) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 11 Jun 2026 12:34:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=khdlE92EWIZymssg1DWQc+9SBUnJOcIfeNQ3kd6vr837PydcLlmUvyMbOaOA5MWuD4va1WyBt5yNxPFuPmkc8JaF5K+Cxcs28YBFAEOaTr6sncycTmukKxBCXc9JnayPETd+UfmvCCxt2YV7S2Zn1ABljQGYNQN+NrPARctzPzLmo2q1M2kmUOZ+sx6TWI1V8xFuRub1V2Q904ZfKOpC7U4fwAH6gLzZZ9OVGOCbBEJRzS/gmcI9Id5Nqfyft8FnHLdFS3V8FEC3G87MtgpXIIouKrZImZJ815oz9KWxMHrG4Zrbt5v15ZCW7EdEysySAk5Aq3n3UnzxjqdHbVXrCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ipA0feSsAPu+Os7w4q02dJy8FhIx/nvv0HPcc1C5XM=;
 b=TunKl8KqH77qWUuzGIfjORc9s3N3Q44husluu9yQydqXp2YQj8xuRh+QFty+fhIkWi/0jQKv9kVpD3cmudxBQuCQjIOslNF+PGskAXCdCV/YST86WUbUCIuKULr6hbgWfaEn2sDcpdwbzu+i5SBsp/5Vg8w+sCnJMNvUGu9s+yOfcgZuDy3i7Ee61hUnZEaB0VwY1j5XJj2rXLtrCPfrYEsxwvDCK6zhd4aQZumD0j5axdEDYaYFS1YwPPtB/BwjjvX+eWGJm/POjppiPIyEJwfAPKMUxigqfxWPg86s22TxTJ+BHCUG9fQFjspMHFmACKgdb3pNyin9vZB1vkDdgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6978.namprd11.prod.outlook.com (2603:10b6:510:206::12)
 by MW4PR11MB5934.namprd11.prod.outlook.com (2603:10b6:303:189::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.18; Thu, 11 Jun
 2026 19:34:30 +0000
Received: from PH7PR11MB6978.namprd11.prod.outlook.com
 ([fe80::f60e:1044:67d7:d8fc]) by PH7PR11MB6978.namprd11.prod.outlook.com
 ([fe80::f60e:1044:67d7:d8fc%5]) with mapi id 15.21.0092.011; Thu, 11 Jun 2026
 19:34:30 +0000
Message-ID: <8bf70242-a64a-4980-90b0-ab0310685a7b@intel.com>
Date: Thu, 11 Jun 2026 21:34:21 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/20] ASoC: Intel: avs: probes: Use guard() for spin
 locks
To: <phucduc.bui@gmail.com>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Peter
 Ujfalusi" <peter.ujfalusi@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>, "Liam
 Girdwood" <liam.r.girdwood@linux.intel.com>
References: <20260611115901.80438-1-phucduc.bui@gmail.com>
 <20260611115901.80438-5-phucduc.bui@gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260611115901.80438-5-phucduc.bui@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0502CA0002.eurprd05.prod.outlook.com
 (2603:10a6:803:1::15) To PH7PR11MB6978.namprd11.prod.outlook.com
 (2603:10b6:510:206::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6978:EE_|MW4PR11MB5934:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c2746cd-7b3e-448a-d533-08dec7f0743f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|7416014|376014|56012099006|11063799006|4143699003|3023799007|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: ovXCv8WzkSbVKjldwyfco0184ZtK6u3rs31avuWyHx0EDycq5LbbENAZ2Jfkc3NbGx2sr1dHzuv5x5tFeebTi+77ehQgH29B65iN5SbBiDg9vsPBe891I7o7WDctG/mMLtjjZOlE8xK921NXd3vkXuucEpEDBJ9yqC/OMSHLLoRH4kC8ywXdLQAI25Iu2Rx2IWvVNd06/LMweZcFWcz3DkIjlctWAKMazQkvSyRed1E56c9jb5z+GSIpCWMEziGfdwiYONjWrLHtzUALVwfOBFav1iZTeU6z1ruBObaeVybuCPgiHrlT3wgptRdMTlexC4CDUwMbSHAfkS5LvrZDJFJl2dPydCng0kemPSN8/wQyt8qJib+8osXmopBUc5i0tp1KnUBEBBQflJmEZFQZcnSeLS7L6/Jgwts5T1JyOpVhYvzUXQPxQvJYAanhuCC9YPGzUOVtO6dshGYCrGhajJaN2ktSOmKdgkOEU+SPCiZsNmWgaz1v0EDuX0omplZKYBWqPpquX3VmM/xGtWxrXRgquWsVEMJjOsS87pGyFdK0oEaD68teKsdC/I73blTieW1hFgBuLwL0a8G8ZFwevyEEU9iLgmJCQYgXaiCO7SUz8zICugIoAKqUwLyYHaS8PEH3u/0c98Bkkc8Xo0TSxEezGzMQo2XegPXGM5kjnHdO5FeCAXe6Lalu6gAXpyFW
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6978.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(7416014)(376014)(56012099006)(11063799006)(4143699003)(3023799007)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dlhCR2JFNTFPZ1NmeTdvNDZrK1liVXJIaFNNOENCV1hlMDlCdHN6RTNFMlVy?=
 =?utf-8?B?eFlHRGVkZ05wQXRvbWZ3N1ZVWEVLYU56WlNyamE3TVJBTGRDVDM3TkM1QVFP?=
 =?utf-8?B?U1BLdFRwYUlkajVzczdab0RaOXc4S2x2QXR4QW11UXQrdU5YT2VuejFyd3Ez?=
 =?utf-8?B?VDg4UUUzL0V6UktTcnl0R3JwQm5SMGlUaGJDOXEyR0pienNEUFB1ZDNqRlNY?=
 =?utf-8?B?aThPRU81dzRnUXk3azZPRVB1b2RqQUxYQm9MWENod1liV0hBZU9BV045WVZ6?=
 =?utf-8?B?dldCSXBRVG9UMXo0Wkh2QmEyK0NiMHVkUk43citOT2MvT0VTNVRsWXMrUkJQ?=
 =?utf-8?B?dTlvYWhGa1hYc3g1L0txQ010OWhZSTkrSzhjcnRXdlY4a3NqV2lsV2dwOGdC?=
 =?utf-8?B?OTRlNkdXempmbmdId3VTUGMrWHZVL0ZjMm1hQ3U0L0JpV2NrQ1BqamgwTkNo?=
 =?utf-8?B?RnlQcW5ObFBZQnJaZy9wR25CWDB2WkR4TTR6ZXk3QzY1TWQ4bmwxeDdvMEJN?=
 =?utf-8?B?RmE2UG9VTDJNTzR0VWFuY2NTUkNLMXdMTkh6dlkvWmZwU2xmcjhpWTFDU2tq?=
 =?utf-8?B?YTV5V1B1U2RidW5vLzVIem1VSEtkRUFkQ1dEa1Y4Y1NoajVtb2RVdU1ROWpQ?=
 =?utf-8?B?Z1pwaWZTdytQd3VmUytQcjhyb3BMUC9zNGREWjBIRDBZWTdHakZQaEs2OVcy?=
 =?utf-8?B?d1B6VTlSN1NIM09EaVpmYko2eGJlbkMrRGV4MzN1aHY2em91aVdQQVZuNDVZ?=
 =?utf-8?B?VXYyTlJaUzgwZmNoWGdrZWI2VHN4UHZxTEFxdTZrUGx4UnFEdkpXeUk5SkRN?=
 =?utf-8?B?c0RhdWNEai80RGY0ZjdCeHl1SW40NHVCeWJTOG1VZDFKTDk0ZlViMVVKYTlx?=
 =?utf-8?B?Z0RtdFpVNVBTZXJlbzROamxnb3JreUkzbzdrUUlPdFh6eUNidHIvQW1STWxG?=
 =?utf-8?B?WXc0b2pQeXFCbmYvNTJ4U2s0clYvTzhENmVMc1V3R1JXVWtYbzI4Q1BsMlJh?=
 =?utf-8?B?RFJDV1czcHY5SnhlTkZ3aFpCcE5xSnh4Uld6QllqVSs4dUJwVU1ybWFreHlY?=
 =?utf-8?B?ZWVTNi96Z0FUVHBJaUJ6eVd4c1lwcE5IdVdER2hRaGdyT3RMbDlRY2x5WTlW?=
 =?utf-8?B?cjVaVW5rV0RtR1NFK2toTkhxRkNienlRRzhERkFjc1pFOWY1T3d5SUZTQlU2?=
 =?utf-8?B?cGJLMUlGNit2RHNGb1dVQ2tvbitKUThJdGFTbVhDZFVnSHRtRlA4U0UrU05m?=
 =?utf-8?B?SnB1Y0RQaGFFNlZqUy9QeEdWcWkzd255cHlCQzI5cXc5YUw5ekFvMWhvSFpF?=
 =?utf-8?B?Y3dBRno5Y1d4OFF4YmJUa0JFMXBTUXBYZmJmWFErRk1xeVJqQ2dsb1BnK2tJ?=
 =?utf-8?B?YkZCMjVBYy9laEN3RTZuZ1hXMWFDaTJIMkxDbmFqcWZkd1NqVDJ5MlZGajVI?=
 =?utf-8?B?eThGbXRlNzRSYlFvQXVWb3J2Q2tlVEtRdGpvTjZ6djV6TE1ncyt3amFxSFpm?=
 =?utf-8?B?TDVrd1o1M1dKY1kxS2pCUFYrWW5NK1djM2RFSktwWWRVMTVOb3J4THVBdmJM?=
 =?utf-8?B?Y1cwSG5UaG5nSG1yNDJNRjZFU01pUVZmMnE4ZlVlcWRhb0VwRHBkR0k3VC9y?=
 =?utf-8?B?Q01kcXREaTlrVXBJdWYzOXBjZmxnMlJvajlDMmlIMEdyUEtWMFkxb3ZaQmhI?=
 =?utf-8?B?ZTlucEMwUjZ3cDVPeVdWdnlhdS9mWExKTzdxOFBhbm92Z3ZsVVdwK3dzTU95?=
 =?utf-8?B?UnFuRnNJdU1ja003dTNJdVRRMmJPSDlJNWd5eFI3VWYrV3VUcUo1NnlJVEhD?=
 =?utf-8?B?U2FZYmh4YUlWT1dzM1lNUXpXbVlUd3ZENEtBUC9EUldaZUxVams3TUxtektw?=
 =?utf-8?B?aUtrc0pOU2FuK0NCOWhFelBiNGx2L3RabDlXZlhpYVJ2eHlJaEoySHE1NFVE?=
 =?utf-8?B?dVFTQkI5QU1EY3hLOHM5M21ZSjFZb2FlTk9kYVNRY2xKSXBsS256U056VFMy?=
 =?utf-8?B?cnNUMGhSbjB5anI0ZXVvUlZQYlZtV0lqbjdPQk5pQkVQT3lKTzhJSEdsOGlq?=
 =?utf-8?B?NE91Y1FLdEtLeVZFRms1Y1UyVVdVNzNOWncyMlBWdCtiUGxZNjVaWU11ejFr?=
 =?utf-8?B?dllpQldtTkZSeGVVdmlGZEFHUVNocjF5enpER0dGaStvN2Q4NjBkY3R3UXM5?=
 =?utf-8?B?QjB2K0xOWW8xSkFqSmYrRFM3dVFhblZQK0JLVi9LWGU1SDFvb25nUGEwOGVq?=
 =?utf-8?B?M0RKMVB1VzFRNWhNYXdkV1M0akVZdndRd1JFTVhBUVdCSTZFejlQa0YxbjJ1?=
 =?utf-8?B?NllYQ25NYUJDQTMzblhuTmVmWTNjRVpJcTlUeU9GdDkyT3pLZ0JMUT09?=
X-Exchange-RoutingPolicyChecked: fNecgGQXDVwmvQaHN5raZq0Cf37kliz8i0CYJruwE7JbVXVgdJHkrihjiWto61XfCqIkBCXC97EN6wx5pnfleU0TnrQNCbuYEsMVaY3zIWf6EVFHGXkLBzHSLAX8IJ3a6KuBcPpqhgkcNLRzYACt13I3mWAb/Q/vXoyoqJA1nzoNoh+WyDMXCpID1ClHvvGLJDYDrk550UjTGj6gThoNwLHMSF+toc9dEikDWMxrRToX52QtcYzFKWMJH9vJcVQjzrToe2DQN9HsoaxUPyG+FkhqvlUiRqzCNoy3cX6Eod4jcZRkCWgstnJn3C+fu3FtCBhdYV8biGwJj/VljkI/9Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c2746cd-7b3e-448a-d533-08dec7f0743f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6978.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 19:34:29.7707
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ke2e2cBk9Gqpwyu0NfrMc2RCU6lg0O+XZXHWLy+9BJ/k/EnxohaRVQaUrY8RxVKkbuGStFp7z456VSQN+9ry2RtNwfjY6XfGQg3Y/DxTguA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5934
X-OriginatorOrg: intel.com

On 6/11/2026 1:58 PM, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Clean up the code using guard() for spin locks.
> Merely code refactoring, and no behavior change.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>   sound/soc/intel/avs/probes.c | 11 ++++-------
>   1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/sound/soc/intel/avs/probes.c b/sound/soc/intel/avs/probes.c
> index 099119ad28b3..13d933ab77cd 100644
> --- a/sound/soc/intel/avs/probes.c
> +++ b/sound/soc/intel/avs/probes.c
> @@ -186,7 +186,6 @@ static int avs_probe_compr_trigger(struct snd_compr_stream *cstream, int cmd,
>   	struct hdac_ext_stream *host_stream = avs_compr_get_host_stream(cstream);
>   	struct avs_dev *adev = to_avs_dev(dai->dev);
>   	struct hdac_bus *bus = &adev->base.core;
> -	unsigned long cookie;
>   
>   	if (!hdac_stream(host_stream)->prepared)
>   		return -EPIPE;
> @@ -195,17 +194,15 @@ static int avs_probe_compr_trigger(struct snd_compr_stream *cstream, int cmd,
>   	case SNDRV_PCM_TRIGGER_START:
>   	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
>   	case SNDRV_PCM_TRIGGER_RESUME:
> -		spin_lock_irqsave(&bus->reg_lock, cookie);
> -		snd_hdac_stream_start(hdac_stream(host_stream));
> -		spin_unlock_irqrestore(&bus->reg_lock, cookie);
> +		scoped_guard(spinlock_irqsave, &bus->reg_lock)
> +			snd_hdac_stream_start(hdac_stream(host_stream));

Well, maybe one patch per driver suggestion of mine was a little too 
much.. Let's separate guard() changes from scoped_guard() ones. 
guard()s carry no readability cost.

I'm not a fan of scoped_guard() update for any existing code block that 
looks like below:

	lock()
	one_liner()
	unlock()

Adding tab to the picture ruins readability.  The cost of tab is OK if 
there are more operations between the locking/unlocking though.

>   		break;
>   
>   	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
>   	case SNDRV_PCM_TRIGGER_SUSPEND:
>   	case SNDRV_PCM_TRIGGER_STOP:
> -		spin_lock_irqsave(&bus->reg_lock, cookie);
> -		snd_hdac_stream_stop(hdac_stream(host_stream));
> -		spin_unlock_irqrestore(&bus->reg_lock, cookie);
> +		scoped_guard(spinlock_irqsave, &bus->reg_lock)
> +			snd_hdac_stream_stop(hdac_stream(host_stream));
>   		break;
>   
>   	default:

