Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4B3322B8C
	for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 20:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776199374; cv=fail; b=WXuj+hcGw9glTzsvfdWX//z6IAKb5cvVBEaQhldExgqGef00GO7lb/oqTUSP07GEXspYooG2VHUp2CfVDdAstbHszYQBokOD2KqcOpskcJag++fnzHRyprlbuGZyiTNAXL5RxNkMhlmh4m/DxyIN14vRyvdUau/AZWGjrc0rNX4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776199374; c=relaxed/simple;
	bh=UbxKmPmvyAYKJ4OBmKMoyUXShxKZxRWqrnZ92rOQJCw=;
	h=Content-Type:Message-ID:Date:Subject:To:CC:References:From:
	 In-Reply-To:MIME-Version; b=t93YLeFsGuLE7IAMy76CgF3tQFYQK2we4RkDApy2xinniDrdZvr9IAlqiWa5dGhIuZZvHdMuQW+YlxX2Pn0pZi3XYQXoTkZOhoSWhPy1sSXmJz1QItcrcdl/DtP4lRgHUZpa2dD7dXPdzmibfCmlrkeRADvpLPDvIvHl3s2GM0o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TDpquZKv; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TDpquZKv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776199372; x=1807735372;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:mime-version;
  bh=UbxKmPmvyAYKJ4OBmKMoyUXShxKZxRWqrnZ92rOQJCw=;
  b=TDpquZKvKbWEWZrCea4NOY/W41I58wMLdFIdXaKbn+8EeZHJp8L68/sA
   kRachGuE2KtDSB9kYWnTiVvoP0WwSjljTTRYJvSvtYrdg/ObjwdqSnL0+
   HzXpopC4sZOdIVHR87MGvuow4eQ2ypKyGaCfRvUOGL+ZMQT1qDMASI6hM
   leHZO5VKFYop4BvwS6RD2mq/7f3aQ0UHqnH0cahmnsvi8zDYd2hTtMvF3
   uT2H0gN94b5PsRNgPdYhs1gh4rSaP84+dnWfEjjzbVI55EPY6EvG++iPO
   fB45Lqh3xaBf3BPB0P8X02UCJu9BQMfJuMPz0qSnvDQyKHeoCx3QNRcLh
   Q==;
X-CSE-ConnectionGUID: S9UxsYH2S9y3+hDkSNUjWA==
X-CSE-MsgGUID: Y7KhemLqTyemK/RRbPaioA==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="80764036"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208,223";a="80764036"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 13:42:51 -0700
X-CSE-ConnectionGUID: A3LH287oTkyim3g3KDTGIg==
X-CSE-MsgGUID: 0VshcPR+QaSEBAohX373TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208,223";a="225902501"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 13:42:51 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 14 Apr 2026 13:42:50 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 14 Apr 2026 13:42:50 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.19) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 14 Apr 2026 13:42:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BB/JsX+jK/g1FHS+Q/Ud97oUne/PYq9JwWaNfYb1AZy7az5CaoWbLGNk6M8mkz5ysgYqA/PiXmRF8ZGgXaG+WoEHAnsP392S9H06xFLIBaEIQT1Zq3P0CJjGAiTyOB8ZhdsDFs6FDPQdj2kL1LNILu8+FxdwtJ0YRmVy9ed5gCfOPZ0oy9iuOF7WXtUDeTOw5KEUAKoQ4wSMc+9gc5tRikTWTUufTnlXTHHM3uNGzIPHuA7UefFIJmrnu55Cm/6PLyRS5dpPkkCA2eR4LHEK6KwAdCnukmIBGr3tDf4WBQocZT/Kld+D+pkLKUuveh7ngln4FjNGCXAYlINPNIdWvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tHKZF1eMdDe1/63xBxn1G0vAv4eD1TonzvLZVl7ie4g=;
 b=OM1DbWyd+c5AMFbLaNQt2g6WTawg+1N23SzAZvdbRAKaVNaDkucN3zLhrob0xfw7S6mYTKt6W0PbivI4DgV7ZjhRX1/t1OYnQ7lj6G4jnkBbvNn57jb7H57bx/DrsG39CwXBXEDtpiyapA4RZbVkHStFvshwR9bycMjMQ4DLhHUpRHkKOUod8ponfNCjxG1L8BEXkbGyPtkZdSl/lWCcGGUnN4Qu14u1sH1s7jsm6P2bLvumShBEgwhUm1zc42oAUT9Ck1PbMT9y1LvLvIX810fZ4XBiohuslgTN31Nj8wRpx/hwgMOYS1YN6AWXp12md9ufC1tVRJcuNHf4OOMoFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by CO1PR11MB5137.namprd11.prod.outlook.com (2603:10b6:303:92::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Tue, 14 Apr
 2026 20:42:47 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%4]) with mapi id 15.20.9769.046; Tue, 14 Apr 2026
 20:42:46 +0000
Content-Type: multipart/mixed;
	boundary="------------r6XAk4YsnLWi4xNou0TLmnDK"
Message-ID: <6b1025be-04fe-44b1-aaa0-703265d015b8@intel.com>
Date: Tue, 14 Apr 2026 22:42:42 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ASoC: core: use Complete rebind cards by default for
 all users
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC: <linux-sound@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
	=?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?= <amade@asmblr.net>
References: <87y0jsibki.wl-kuninori.morimoto.gx@renesas.com>
 <87bjgaxkdb.wl-kuninori.morimoto.gx@renesas.com>
 <a53ac4b3-1774-4e78-b88b-4316ffe73cd1@intel.com>
 <87ikacdcdj.wl-kuninori.morimoto.gx@renesas.com>
 <87jyub396o.wl-kuninori.morimoto.gx@renesas.com>
 <c54dc8ed-18b7-4914-835d-a17a0e32bda2@intel.com>
 <87o6jmpa2q.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <87o6jmpa2q.wl-kuninori.morimoto.gx@renesas.com>
X-ClientProxiedBy: VI1P195CA0043.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:5a::32) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|CO1PR11MB5137:EE_
X-MS-Office365-Filtering-Correlation-Id: dd7561f4-3022-4868-4aea-08de9a6662b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|6049299003|376014|18002099003|22082099003|56012099003|4053099003;
X-Microsoft-Antispam-Message-Info: 6qUzZGueV7mAKv5AV6DLKqKsO0TeKR9NkSzK2MTdFN0a4cOWXj+grP16OPnrdIaRwXTphRr3HXk5lY/CERh5a4Lru3jRRRY1Fx9CMxjofd4LDH9dK2aIYfuoewYjh8UHxgXxzLnw8OuUo2cYooSNumoNHlVDlQMb4QNg5JUSjDdDNV9V1dgOKnveN7g+ZUS/7NFndG/nOYwHOVUqJRGi3tagX5lmlBbbWgvcBLe8SAK79PUZRPE+aejnpRLlolq8NNiKBDhuhqZdYb4XUqnAjm698HZ/TkZyEi3jCrvIggyg7o2AGnSelIFj6qqh+BMifA4OsBt1MfL1gPbSk7d5GXM8zkND6TpyyWFPfx3oyi+3gYJRdGPoGAc/moYVoLdUsAfhVvV07uog0hwnfyYuIz+GsyH7+wzhWIKGDVkGOFPQOxib1ghqaZg936wgvnIzRZI+HlIOFJ7Xuo7SDLmLiehkDLAFpw7dYymfmIwfAe0FqQ3KuFDmlXqI/IYYO/Liz3Qgc5vyRiXpeLD5UcM2Ao/FdCbSedR3sQ4z9NRVQ/PYOyjIz2AdkRM37iUJE4oLO8vvDz1iq5HJQ2rpFoq6nQzjytegO5pfVmzyTkp0vfcbj/n0oxxITotxQgpnhqrT98wV129j5Ppdxq9RASo1ch4Q1k7DTIVhX/G8+oyMR527tzimmLA/jcpjuQED1IYqg0XZZ0X8eYa5iCBgbAC2QINejQQlcGvM/MV43nMblQw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(6049299003)(376014)(18002099003)(22082099003)(56012099003)(4053099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWJ2Z05HOGFxclJwYlBFTkEraW1UKy9YK2tCNlUrRnJLbjNMdGQ1OEZjdVRN?=
 =?utf-8?B?ZmZRM0RRUDRtankzSHQrelpOVC9uNURML0lRVnpBd293V0lRdnlabzMxZ1RQ?=
 =?utf-8?B?andzWXd4dkpJQmJDQVArNlMvdXhYNVFQK2tUSVoycmRZQ0V5WndmUkptYmJ6?=
 =?utf-8?B?YWFFbnJPR0lkZ09abG1TWHBHSEZ0UUVOREdJTk1pa21DSit2enR4c3RvNzJk?=
 =?utf-8?B?RVJnMDJ0RU5zd2FVb2xxNDNVT1kyRWxUSm1ManVXNUp4enF2SitZWDRqZ2Nj?=
 =?utf-8?B?NGQ0UDBDZm56QW16a0x6bUFtVFQxYjJnSXFXY1hXMlRVY2tZU1k5ZHlHV3h5?=
 =?utf-8?B?UU56SVpBMGdqYTFZRThiaE1IQng1WjJyV2ZMcWNCQ1lrUndWa2J1ZXFUWmtN?=
 =?utf-8?B?N1NFUHFxOFM2T3M4K2lIUFhsWDd5UDA2dFlGTTVBQjErdXo2eDhYWmQ3enpp?=
 =?utf-8?B?Y0N1WkhxbTdVU2lOK3ltT3psTGQvS1R1blljVk1hSlpLRXU5NkI2U3l3T2FS?=
 =?utf-8?B?R0RuTTVkamlTRmRXcDdqZGVyMFg4QU1Xa0VmZE9YQXFsTVlHajdEZTh4TlFs?=
 =?utf-8?B?Nk1BdjQzT25Qb3dWZHZONHhNTUpOMU1odFNzbmNQc1hpd2VGZHJyaVR1NGRU?=
 =?utf-8?B?UVFLVExxWDZVa1ZRZ1lNWlpwMWF0aTAxdk1qV0ZvTTdkSzhhTHFDd3E5UXZp?=
 =?utf-8?B?Z3NKeHY3TG4zY0VPaGhYaEd4L3o3YU9HN0JLWDd1WFJYRnpUZS9HdjRyUnVm?=
 =?utf-8?B?bm5qaTNXSW1oUHlPZFY2MkY2WjQ5SWMxc3pYUkdDcERrQnV2ZHhhYi9TUHQ2?=
 =?utf-8?B?OUp2b2hMb1VXOU91UmZRQzV6d0d5am5ITkNRN05hVHkwT3l3S2pSSmhkbGRV?=
 =?utf-8?B?bGhrRWgxWnBodGNlbEQ5SVVmRitpb2pTb05VamJqcjQ1MEdHYkp2NHJhSElN?=
 =?utf-8?B?QVpVWDJJekNXYW52SXRSelNJR2dIQXBmOTJwVlhqNVhvUU50N3psMmZTc2NV?=
 =?utf-8?B?YmVsMUtsNytYRld4OTJGYnJKRHhUTTR3RjFRWlgxdzdZd0Y5dkwrbk1Qdk90?=
 =?utf-8?B?bmpVdEQwdHUyWVF3ZWswaHNVNWJma251YVZSc0NsTXdzbURSY0pMQytIZkFG?=
 =?utf-8?B?ZnIzL3puQTlmV3I4N2RhYjd0aDJZTk5yQm1YcWc1T01xVFlSckR1Z2srcXY0?=
 =?utf-8?B?S2JJYTFDTHFqbDZDZmZkYmRsWURVYVE4bUhHM1RVOUpDQ3FCZkNFSVViejhm?=
 =?utf-8?B?YjR0VnhRSTlZUW9zV0xaQ0tod3hjakg2QkR4Y0ZUTHQvMTJJcGpGbm85ZE82?=
 =?utf-8?B?Z1BPSlJJS1BCYkZsVTh6ZVZzZDMwNVd0ZGlEZmcxSTVZU2s4WlpxKzVQeHVL?=
 =?utf-8?B?V0dJVjlkVVRhdGJyYldub2ZKeDE5V1BVRkxMR0Y0MmlPZU1DUGtqdjB4UTBq?=
 =?utf-8?B?d2hBY2xWRVUwTG1uV09VU0laTVU2ZlJRbHpaUHM2U21YM2kvWloyMzdKUks3?=
 =?utf-8?B?OGt6QjRJNEZoa3krNkx0dVhoa25iRUNHbFpVMWFyK0JyQTR1WkNhVEd1Kys0?=
 =?utf-8?B?YVA1cGJzVlRXMFg4WXMwcHdnbk84bXhnUGw5dUZjcC81QUcwYXNXYThha3Fv?=
 =?utf-8?B?ejlFOGJYdFcwZ0UwRHBBVE11UjNFdXhPQjE4eFRxSDBhMzlqblpTU0N6RG5E?=
 =?utf-8?B?WFBUSFV3RDZ0NjVxY0lxWkRDQitUQ1pzRVNZR2YwN0MvZGI2Vk12ZVlEMmFn?=
 =?utf-8?B?RzhZSzdrSTFRREF2VUhuLzBEU3Z1Rno1RlZOL2JTaWNkemFiL3JjcEtXVDBW?=
 =?utf-8?B?d3kvQ00xRkpPcEtCOUcvZzI4c1NydW5mRVFLYVcrWHRwTUwxdzdjOXBiK1hl?=
 =?utf-8?B?SjJyRmRSMittcUd1MVpyUk52Ymo0dWdNRzlHanpZMzh6VEFJdE5ha0FPVGpk?=
 =?utf-8?B?UUlXR25vdXFTQkxTanR6VTlaS3V2TDZpRGRYWlNFbHZncHZNZkRxcE02RlNy?=
 =?utf-8?B?OVZQUDR4WUNxc21scndVekVkQk9ueVhZelljWGt0T3ZXQjBXWTFRNmRxbVZm?=
 =?utf-8?B?blVVbWpkZEY1dnpWM1R1bjRQQSt4d1NDbEd2WFJqT21VZlVOZjJiYlF1b1JB?=
 =?utf-8?B?Q1pLL3RHSkJoY0x2REpqS1FuTkw2ZFZ0cG5xZ2g1amthME5KdkV5WVBSRW9K?=
 =?utf-8?B?c0hhM3NwUk5KMEN0Z3dlOHcxdysxdnFPTWlBLzB5cU5kWWhNMXdmc1BlMXVU?=
 =?utf-8?B?c1JjSm9SYVJ3QjBKSEVINFZzOE5qaTc5OFg2VkU1cE5oZ2xuT0V4UlVLd3pu?=
 =?utf-8?B?bklTaWFReDdRQk1MWndyblRLMXA5UmE2blQxWmRzbTJIcmVPUW83aDROdWlI?=
 =?utf-8?Q?/WmTzanm4Y11MHUo=3D?=
X-Exchange-RoutingPolicyChecked: vohEv+BXYWeQoBw1dmly+fOaGfR3EiZHmJNsiSqVbkXvkzzYz8SORQWLynriAalVU9kmQcPMFNlzZzyj6dD2xlQyFRbBAMUmVWZ/bz++WNnluzSH+Nh3g+1ptrZHiFpDGmqsyIFAYiQG5NZXvWR7rE8+ED2VcS3vLt3kD2UHkJoInJlQA+8fMTK0j8wfkC5dCp16WlmB1z9YVQNOwAZmTlw31XiXISFo/3kyNzecW4YNoGcyyvOn4DCP+uoVs84yl/2MMBAXjhAvgVQLRjen9XXx95A/SxMhO6polI6KgPNQtTWQ1Vi51J3jPLXW1dKbDQx/6cfXqd4IcxsnPlSK3A==
X-MS-Exchange-CrossTenant-Network-Message-Id: dd7561f4-3022-4868-4aea-08de9a6662b7
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 20:42:46.8886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i1r/xeHrarzC6wZhU6uQBMa1jdSbDsUFzZzHP3PhaHsta41nZCdbgl9gsld1rL02ghWwdGl/nkOM5lQ+0QlK+RrfVVcJ3DZHSnyL/fBsEnY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5137
X-OriginatorOrg: intel.com

--------------r6XAk4YsnLWi4xNou0TLmnDK
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-04-14 4:09 AM, Kuninori Morimoto wrote:

>> |_snd_soc_card_bind()
>> |__snd_soc_probe_component()
>> |___snd_soc_component_tplg_load()
>> |____soc_tplg_fe_link_create()
> (snip)
>> So, after applying v3 found here, we end up with devres-stack:
>> 1. devres with release=snd_soc_unregister_card
>> 2. all the devres from topology
>>
>> Teardown sequence, LIFO:
>> 1. all the devres from topology
>> 2. devres with release=snd_soc_unregister_card
>>
>> The unregister call-stack:
>> snd_soc_card_register()
>> |_snd_soc_card_bind()
>> |__snd_soc_unbind_card()
>> |___snd_soc_link_exit() AKA rtd->dai_link


Sorry for the typos here. Meant to write:

snd_soc_unregister_card()
|_snd_soc_unbind_card()
|__soc_cleanup_card_resources()
|___snd_soc_link_exit() AKA rtd->dai_link

>>
>> Boom, the dai_link (FE from topology) operated on has already been freed
>> earlier in the teardown sequence. And that's the reason for:
> 
> Ah....
> For me, this is because topology is doing irregular operation.
> (= adding dai_link *after* card binding)
> (= used dai_link should exist when card was removed)
> 
> So *topology* side needs irregular operation for remove, not *card* side
> IMO. Otherwise the balance will be mess.
> 
> The reason why snd_soc_link_exit() (X) was called (and hung kernel) is that
> rtd->initialized (Y) was set, and/or card->rtd_list was not empty (Z).
> 
> 	static void soc_cleanup_card_resources()
> 	{
> 		...
> (Z)		for_each_card_rtds(card, rtd)
> (Y)			if (rtd->initialized)
> (X)				snd_soc_link_exit(rtd);
> 		...
> 	}
> 
> This should be solved if topology calls snd_soc_remove_pcm_runtime() (A)
> which removes rtd from card (= Z).
> # rtd->dai_link will be used after above in cleanup, so remove rtd from
> # card is correct approach I think.
> 
> Hmm... soc_tplg_fe_link_create() devm-allocked link, and use it by using
> *add* function (B)
> 
> 	static int soc_tplg_fe_link_create(...)
> 	{
> 		...
> 		link = devm_kzalloc(...);
> 		...
> (B)		ret = snd_soc_add_pcm_runtimes(..., link, ...);
> 		...
> 	}
> 
> If you use *add* function (B), you need to call paired *remove* function
> (= (A)) when it gone.
> 
> It seems *remove* (A) is called at soc_tplg_remove_link()
> 
> 	static void soc_tplg_remove_link(...)
> 	{
> 		...
> 		if (!link->ignore)
> (A)			snd_soc_remove_pcm_runtime(...);
> 		...
> 	}
> 
> But is this function called ?
> # there is related comment on remove_backend_link()

To the best of my knowledge snd_soc_tplg_component_remove() (and thus 
soc_tplg_remove_link()) is called where it needs to. The problem is 
ensuring the devres node carrying release=snd_soc_unregister_card() is 
pushed last onto the devres-stack once all the bind-card activities 
complete. I wouldn't count on the topology being the sole place where 
problematic devm_xxx() can occur.

Moving on, I have an idea for reducing the size of existing code that 
handles the rebinding/deferrable binding mechanism. Can send RFC 
tomorrow after some more testing. To not keep you waiting, attaching a 
preliminary version of the patch.

There is more to the subject but first I'd like to know your opinion on 
the code.


Kind regards,
Czarek
--------------r6XAk4YsnLWi4xNou0TLmnDK
Content-Type: text/plain; charset="UTF-8";
	name="0001-ASoC-core-Deferred-rebind-story-continues.patch"
Content-Disposition: attachment;
	filename="0001-ASoC-core-Deferred-rebind-story-continues.patch"
Content-Transfer-Encoding: base64

RnJvbSBlNTU0YTE3ZTg1YzljNmU1Nzc3YjAyYmYyMjY0YTQ2NTcxOTBmNTI2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBDZXphcnkgUm9qZXdza2kgPGNlemFyeS5yb2pld3NraUBpbnRl
bC5jb20+CkRhdGU6IFR1ZSwgMTQgQXByIDIwMjYgMjI6MTI6NDUgKzAyMDAKU3ViamVjdDogW1BB
VENIXSBBU29DOiBjb3JlOiBEZWZlcnJlZCByZWJpbmQgc3RvcnkgY29udGludWVzCgpTaWduZWQt
b2ZmLWJ5OiBDZXphcnkgUm9qZXdza2kgPGNlemFyeS5yb2pld3NraUBpbnRlbC5jb20+Ci0tLQog
aW5jbHVkZS9zb3VuZC9zb2MuaCAgICB8ICAyICstCiBzb3VuZC9zb2Mvc29jLWNvcmUuYyAgIHwg
NDQgKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiBzb3VuZC9zb2Mv
c29jLWRldnJlcy5jIHwgMjggKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAzIGZpbGVzIGNo
YW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDU3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2lu
Y2x1ZGUvc291bmQvc29jLmggYi9pbmNsdWRlL3NvdW5kL3NvYy5oCmluZGV4IGEzMGY5NWZmN2Q4
Ni4uZjA5MzU1MjNjOGRmIDEwMDY0NAotLS0gYS9pbmNsdWRlL3NvdW5kL3NvYy5oCisrKyBiL2lu
Y2x1ZGUvc291bmQvc29jLmgKQEAgLTQyNSw3ICs0MjUsNyBAQCBzdHJ1Y3Qgc25kX3NvY19qYWNr
X3BpbjsKIGludCBzbmRfc29jX3JlZ2lzdGVyX2NhcmQoc3RydWN0IHNuZF9zb2NfY2FyZCAqY2Fy
ZCk7CiB2b2lkIHNuZF9zb2NfdW5yZWdpc3Rlcl9jYXJkKHN0cnVjdCBzbmRfc29jX2NhcmQgKmNh
cmQpOwogaW50IGRldm1fc25kX3NvY19yZWdpc3Rlcl9jYXJkKHN0cnVjdCBkZXZpY2UgKmRldiwg
c3RydWN0IHNuZF9zb2NfY2FyZCAqY2FyZCk7Ci1pbnQgZGV2bV9zbmRfc29jX3JlZ2lzdGVyX2Rl
ZmVycmFibGVfY2FyZChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBzbmRfc29jX2NhcmQgKmNh
cmQpOworI2RlZmluZSBkZXZtX3NuZF9zb2NfcmVnaXN0ZXJfZGVmZXJyYWJsZV9jYXJkKGQsIGMp
IGRldm1fc25kX3NvY19yZWdpc3Rlcl9jYXJkKGQsIGMpCiAjaWZkZWYgQ09ORklHX1BNX1NMRUVQ
CiBpbnQgc25kX3NvY19zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldik7CiBpbnQgc25kX3NvY19y
ZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KTsKZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9zb2MtY29y
ZS5jIGIvc291bmQvc29jL3NvYy1jb3JlLmMKaW5kZXggZTcwYmYyMmRiNWM5Li5iNDFjYzJhNWNm
YjMgMTAwNjQ0Ci0tLSBhL3NvdW5kL3NvYy9zb2MtY29yZS5jCisrKyBiL3NvdW5kL3NvYy9zb2Mt
Y29yZS5jCkBAIC0yMTY1LDYgKzIxNjUsNyBAQCBzdGF0aWMgaW50IHNuZF9zb2NfYmluZF9jYXJk
KHN0cnVjdCBzbmRfc29jX2NhcmQgKmNhcmQpCiAJc25kX3NvY19maWxsX2R1bW15X2RhaShjYXJk
KTsKIAogCXNuZF9zb2NfZGFwbV9pbml0KGRhcG0sIGNhcmQsIE5VTEwpOworCWxpc3RfZGVsX2lu
aXQoJmNhcmQtPmxpc3QpOwogCiAJLyogY2hlY2sgd2hldGhlciBhbnkgcGxhdGZvcm0gaXMgaWdu
b3JlIG1hY2hpbmUgRkUgYW5kIHVzaW5nIHRvcG9sb2d5ICovCiAJc29jX2NoZWNrX3RwbGdfZmVz
KGNhcmQpOwpAQCAtMjMwOCw2ICsyMzA5LDEwIEBAIHN0YXRpYyBpbnQgc25kX3NvY19iaW5kX2Nh
cmQoc3RydWN0IHNuZF9zb2NfY2FyZCAqY2FyZCkKIHByb2JlX2VuZDoKIAlpZiAocmV0IDwgMCkK
IAkJc29jX2NsZWFudXBfY2FyZF9yZXNvdXJjZXMoY2FyZCk7CisJaWYgKHJldCA9PSAtRVBST0JF
X0RFRkVSKSB7CisJCWxpc3RfYWRkKCZjYXJkLT5saXN0LCAmdW5iaW5kX2NhcmRfbGlzdCk7CisJ
CXJldCA9IDA7CisJfQogCXNuZF9zb2NfY2FyZF9tdXRleF91bmxvY2soY2FyZCk7CiAKIAlyZXR1
cm4gcmV0OwpAQCAtMjMyMywxMiArMjMyOCwxNSBAQCBzdGF0aWMgaW50IGRldm1fc25kX3NvY19i
aW5kX2NhcmQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3Qgc25kX3NvY19jYXJkICpjYXJkKQog
CXN0cnVjdCBzbmRfc29jX2NhcmQgKipwdHI7CiAJaW50IHJldDsKIAorCS8qIFRoZSBwcm9jZWR1
cmUgbWF5IGJlIGNhbGxlZCBtYW55IHRpbWVzIGR1cmluZyB0aGUgbGlmZXRpbWUgb2YgdGhlIGNh
cmQuICovCisJZGV2cmVzX2Rlc3Ryb3koZGV2LCBkZXZtX2NhcmRfYmluZF9yZWxlYXNlLCBOVUxM
LCBOVUxMKTsKKwogCXB0ciA9IGRldnJlc19hbGxvYyhkZXZtX2NhcmRfYmluZF9yZWxlYXNlLCBz
aXplb2YoKnB0ciksIEdGUF9LRVJORUwpOwogCWlmICghcHRyKQogCQlyZXR1cm4gLUVOT01FTTsK
IAogCXJldCA9IHNuZF9zb2NfYmluZF9jYXJkKGNhcmQpOwotCWlmIChyZXQgPT0gMCB8fCByZXQg
PT0gLUVQUk9CRV9ERUZFUikgeworCWlmIChyZXQgPT0gMCkgewogCQkqcHRyID0gY2FyZDsKIAkJ
ZGV2cmVzX2FkZChkZXYsIHB0cik7CiAJfSBlbHNlIHsKQEAgLTIzMzgsMjEgKzIzNDYsMTEgQEAg
c3RhdGljIGludCBkZXZtX3NuZF9zb2NfYmluZF9jYXJkKHN0cnVjdCBkZXZpY2UgKmRldiwgc3Ry
dWN0IHNuZF9zb2NfY2FyZCAqY2FyZCkKIAlyZXR1cm4gcmV0OwogfQogCi1zdGF0aWMgaW50IHNu
ZF9zb2NfcmViaW5kX2NhcmQoc3RydWN0IHNuZF9zb2NfY2FyZCAqY2FyZCkKK3N0YXRpYyBpbnQg
c29jX2RvX2JpbmRfY2FyZChzdHJ1Y3Qgc25kX3NvY19jYXJkICpjYXJkKQogewotCWludCByZXQ7
Ci0KLQlpZiAoY2FyZC0+ZGV2cmVzX2RldikgewotCQlkZXZyZXNfZGVzdHJveShjYXJkLT5kZXZy
ZXNfZGV2LCBkZXZtX2NhcmRfYmluZF9yZWxlYXNlLCBOVUxMLCBOVUxMKTsKLQkJcmV0ID0gZGV2
bV9zbmRfc29jX2JpbmRfY2FyZChjYXJkLT5kZXZyZXNfZGV2LCBjYXJkKTsKLQl9IGVsc2Ugewot
CQlyZXQgPSBzbmRfc29jX2JpbmRfY2FyZChjYXJkKTsKLQl9Ci0KLQlpZiAocmV0ICE9IC1FUFJP
QkVfREVGRVIpCi0JCWxpc3RfZGVsX2luaXQoJmNhcmQtPmxpc3QpOwotCi0JcmV0dXJuIHJldDsK
KwlpZiAoY2FyZC0+ZGV2cmVzX2RldikKKwkJcmV0dXJuIGRldm1fc25kX3NvY19iaW5kX2NhcmQo
Y2FyZC0+ZGV2cmVzX2RldiwgY2FyZCk7CisJcmV0dXJuIHNuZF9zb2NfYmluZF9jYXJkKGNhcmQp
OwogfQogCiAvKiBwcm9iZXMgYSBuZXcgc29jZGV2ICovCkBAIC0yNTUwLDggKzI1NDgsNiBAQCBF
WFBPUlRfU1lNQk9MX0dQTChzbmRfc29jX2FkZF9kYWlfY29udHJvbHMpOwogICovCiBpbnQgc25k
X3NvY19yZWdpc3Rlcl9jYXJkKHN0cnVjdCBzbmRfc29jX2NhcmQgKmNhcmQpCiB7Ci0JaW50IHJl
dDsKLQogCWlmICghY2FyZC0+bmFtZSB8fCAhY2FyZC0+ZGV2KQogCQlyZXR1cm4gLUVJTlZBTDsK
IApAQCAtMjU3OCwxNyArMjU3NCw3IEBAIGludCBzbmRfc29jX3JlZ2lzdGVyX2NhcmQoc3RydWN0
IHNuZF9zb2NfY2FyZCAqY2FyZCkKIAogCWd1YXJkKG11dGV4KSgmY2xpZW50X211dGV4KTsKIAot
CWlmIChjYXJkLT5kZXZyZXNfZGV2KSB7Ci0JCXJldCA9IGRldm1fc25kX3NvY19iaW5kX2NhcmQo
Y2FyZC0+ZGV2cmVzX2RldiwgY2FyZCk7Ci0JCWlmIChyZXQgPT0gLUVQUk9CRV9ERUZFUikgewot
CQkJbGlzdF9hZGQoJmNhcmQtPmxpc3QsICZ1bmJpbmRfY2FyZF9saXN0KTsKLQkJCXJldCA9IDA7
Ci0JCX0KLQl9IGVsc2UgewotCQlyZXQgPSBzbmRfc29jX2JpbmRfY2FyZChjYXJkKTsKLQl9Ci0K
LQlyZXR1cm4gcmV0OworCXJldHVybiBzb2NfZG9fYmluZF9jYXJkKGNhcmQpOwogfQogRVhQT1JU
X1NZTUJPTF9HUEwoc25kX3NvY19yZWdpc3Rlcl9jYXJkKTsKIApAQCAtMjkwOSw3ICsyODk1LDcg
QEAgaW50IHNuZF9zb2NfYWRkX2NvbXBvbmVudChzdHJ1Y3Qgc25kX3NvY19jb21wb25lbnQgKmNv
bXBvbmVudCwKIAlsaXN0X2FkZCgmY29tcG9uZW50LT5saXN0LCAmY29tcG9uZW50X2xpc3QpOwog
CiAJbGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZlKGNhcmQsIGMsICZ1bmJpbmRfY2FyZF9saXN0LCBs
aXN0KQotCQlzbmRfc29jX3JlYmluZF9jYXJkKGNhcmQpOworCQlzb2NfZG9fYmluZF9jYXJkKGNh
cmQpOwogCiBlcnJfY2xlYW51cDoKIAlpZiAocmV0IDwgMCkKZGlmZiAtLWdpdCBhL3NvdW5kL3Nv
Yy9zb2MtZGV2cmVzLmMgYi9zb3VuZC9zb2Mvc29jLWRldnJlcy5jCmluZGV4IGQzM2Y4M2VjMjRm
Mi4uNzE4MTY1YmE4NGFjIDEwMDY0NAotLS0gYS9zb3VuZC9zb2Mvc29jLWRldnJlcy5jCisrKyBi
L3NvdW5kL3NvYy9zb2MtZGV2cmVzLmMKQEAgLTQ5LDExICs0OSw2IEBAIGludCBkZXZtX3NuZF9z
b2NfcmVnaXN0ZXJfY29tcG9uZW50KHN0cnVjdCBkZXZpY2UgKmRldiwKIH0KIEVYUE9SVF9TWU1C
T0xfR1BMKGRldm1fc25kX3NvY19yZWdpc3Rlcl9jb21wb25lbnQpOwogCi1zdGF0aWMgdm9pZCBk
ZXZtX2NhcmRfcmVsZWFzZShzdHJ1Y3QgZGV2aWNlICpkZXYsIHZvaWQgKnJlcykKLXsKLQlzbmRf
c29jX3VucmVnaXN0ZXJfY2FyZCgqKHN0cnVjdCBzbmRfc29jX2NhcmQgKiopcmVzKTsKLX0KLQog
LyoqCiAgKiBkZXZtX3NuZF9zb2NfcmVnaXN0ZXJfY2FyZCAtIHJlc291cmNlIG1hbmFnZWQgY2Fy
ZCByZWdpc3RyYXRpb24KICAqIEBkZXY6IERldmljZSB1c2VkIHRvIG1hbmFnZSBjYXJkCkBAIC02
MywzMiArNTgsMTEgQEAgc3RhdGljIHZvaWQgZGV2bV9jYXJkX3JlbGVhc2Uoc3RydWN0IGRldmlj
ZSAqZGV2LCB2b2lkICpyZXMpCiAgKiB1bnJlZ2lzdGVyZWQuCiAgKi8KIGludCBkZXZtX3NuZF9z
b2NfcmVnaXN0ZXJfY2FyZChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBzbmRfc29jX2NhcmQg
KmNhcmQpCi17Ci0Jc3RydWN0IHNuZF9zb2NfY2FyZCAqKnB0cjsKLQlpbnQgcmV0OwotCi0JcHRy
ID0gZGV2cmVzX2FsbG9jKGRldm1fY2FyZF9yZWxlYXNlLCBzaXplb2YoKnB0ciksIEdGUF9LRVJO
RUwpOwotCWlmICghcHRyKQotCQlyZXR1cm4gLUVOT01FTTsKLQotCXJldCA9IHNuZF9zb2NfcmVn
aXN0ZXJfY2FyZChjYXJkKTsKLQlpZiAocmV0ID09IDApIHsKLQkJKnB0ciA9IGNhcmQ7Ci0JCWRl
dnJlc19hZGQoZGV2LCBwdHIpOwotCX0gZWxzZSB7Ci0JCWRldnJlc19mcmVlKHB0cik7Ci0JfQot
Ci0JcmV0dXJuIHJldDsKLX0KLUVYUE9SVF9TWU1CT0xfR1BMKGRldm1fc25kX3NvY19yZWdpc3Rl
cl9jYXJkKTsKLQotaW50IGRldm1fc25kX3NvY19yZWdpc3Rlcl9kZWZlcnJhYmxlX2NhcmQoc3Ry
dWN0IGRldmljZSAqZGV2LCBzdHJ1Y3Qgc25kX3NvY19jYXJkICpjYXJkKQogewogCWNhcmQtPmRl
dnJlc19kZXYgPSBkZXY7CiAJcmV0dXJuIHNuZF9zb2NfcmVnaXN0ZXJfY2FyZChjYXJkKTsKIH0K
LUVYUE9SVF9TWU1CT0xfR1BMKGRldm1fc25kX3NvY19yZWdpc3Rlcl9kZWZlcnJhYmxlX2NhcmQp
OworRVhQT1JUX1NZTUJPTF9HUEwoZGV2bV9zbmRfc29jX3JlZ2lzdGVyX2NhcmQpOwogCiAjaWZk
ZWYgQ09ORklHX1NORF9TT0NfR0VORVJJQ19ETUFFTkdJTkVfUENNCiAKLS0gCjIuMzQuMQoK

--------------r6XAk4YsnLWi4xNou0TLmnDK--
