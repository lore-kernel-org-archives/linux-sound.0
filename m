Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14E2490C15
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 11:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789471582; cv=fail; b=aXXIeSb3upQF7goSKl64bXuzpNFRXpLYiDTqhhkN/AAX9Z6IC/AFnwrbrmnGvczLpnZPFSCWwZXqQ6wt7CZouk0kiLeqDFLHj0dL/ndCdbokqCNax80s9RNeKCqb7JadDWt7ax7uIP8AqMZ0DtnRrRjJLGZ0z+PR2QgYGDrjW+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789471582; c=relaxed/simple;
	bh=Wqbh2A68uuUeLUE9DQuHh18L0XC4P0/8jsv/7MFdcVw=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NrbPBuSJsjZQNqCwUu3rb3J99tqt1aMuQaYLf/4H+ygYDZ4t7vO0Tq+0yiJuT/PwPkriVqytcOz2OIPrRMZcEn5iuw6TObqo+AI3A89TK8Wm9VwgjAiWudrpiOI+wR40XqODeQCjcdZrPLF9lxIey5mzWVRUkRpkFCLusbw48nc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m9gOQzCK; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m9gOQzCK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789471581; x=1821007581;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Wqbh2A68uuUeLUE9DQuHh18L0XC4P0/8jsv/7MFdcVw=;
  b=m9gOQzCKjq9BW6cSCUOSzqu4u5aggIV2fBZWFMfJ6HFf9Y7g3JaIkDNG
   QXCvcMnnftYKcqXE6cBQJdB25SNmQVKCNBNqYTBL+zF7qWrJHShdEENxu
   jqy+f4S24iuA7laiUrrKB0xXKl4HkV85e/fcKhxaCpFQDkvjk1YyKPE0K
   izSbjTP/2Zm3V4LLNRHxc744CVAfjl7u+6+xxGWjh1msItOKRAVv22l+e
   HPlSZNqYQEKUo8UBU3vpu5V38PCVVyY2+dQr8xVZ1C0Vhk6S3Mmf/m9Zv
   lOoTui+a1igNLXMm1AkraukOI0YGamzBxqEIyEPl+QdbKD9u30ybldahv
   w==;
X-CSE-ConnectionGUID: uUSGtFNsTIGF3SHDtMGMOQ==
X-CSE-MsgGUID: B9OHksB9SOyNajwetjTlFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89856772"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89856772"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 04:26:21 -0700
X-CSE-ConnectionGUID: 1i8hceTHSVud+uhgWcmmkg==
X-CSE-MsgGUID: HuQqCZpLTrS/Uf4JdPpTBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1207270"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 04:26:19 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 04:26:19 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 15 Sep 2026 04:26:19 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.60) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 04:26:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qmyHQYLnTg4WqHrgdSGFCsc740qWVcJW9EOjUnIxekHNWmK8oAdx+fpycemL6NyFb2z+azlnWeQjkPl6cFgk3ebp7mJOzNILJAg3BpqnHERHQstaRKLM9bFqWnkLSluZmzz3ec0tbuPV+mLTO/mk5KyXn0TxY3Rgm9FYpvMknfDhBapfJerWDGKSNQ6p71xCJ+KJwCS3n3TW8jZ9spAL6v7N8gf/NoBsMaYPJxGBmjRStq58AIjDiCwGNzgm+4ec1PoZXBYsZf9kU/E3mSyXS8DVCcFnRoSJ90A3SQe2Xk72O6/NmqP8oFfMbcjK/6mDYXY2dr1v7vpm0T1b+D99HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HbkXei8KaNvvbHIh9G5Na9kYRh+RTktGxGFAdV3qpmU=;
 b=oni5XeC8SQf87JZ3ofXaV+lLOWGZ29yd8pgCI8HZU1tRKAC3w1APCZSJfKZnkilgJZUdClKzaOWu7eyFQB/utKHeOoKeG2/rNaBMgr/QbEWuDhvxSsLw66NMeuz/gxFpDH3m9FXnzXaDVeYGCc1U9QXnbkA7Nd6G0HAJq6WD1/Umg+ba56ekqWDFQcPvUUWBYi4zmOJcPyKXOomr8IzPDyxQ5vUWhK9HfJ4U0mLJscJPdy//2eRITO8mjjsv3prKW6E5TKnfUb4EMmOtLdhWCP7vsDyoqg672fpR18MqFLk0OUAaPW1Ha9AJDA8wx++eYEQov52oX5iM+uginsO/YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by EA8PPF11583760B.namprd11.prod.outlook.com (2603:10b6:30f:fff5::790) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 11:26:17 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%6]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 11:26:17 +0000
Message-ID: <36644426-3302-47da-a720-f353c307348b@intel.com>
Date: Tue, 15 Sep 2026 13:26:11 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: hda: Allow for codec model selection with module
 param
To: Takashi Iwai <tiwai@suse.de>
CC: <tiwai@suse.com>, <broonie@kernel.org>, <perex@perex.cz>,
	<amade@asmblr.net>, <linux-sound@vger.kernel.org>
References: <20260914102253.2969724-1-cezary.rojewski@intel.com>
 <87bj9zom8l.wl-tiwai@suse.de>
 <9e17f127-ecaa-407f-96ec-0993e9c1ee83@intel.com>
 <87tsnrn5oe.wl-tiwai@suse.de>
 <1d146db5-f4ff-4a5b-a1d9-181ee6d8ceac@intel.com>
 <87a4pin4v2.wl-tiwai@suse.de>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <87a4pin4v2.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9P194CA0012.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:20b:46d::31) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|EA8PPF11583760B:EE_
X-MS-Office365-Filtering-Correlation-Id: e10a51bf-9524-459c-61a3-08df131c28b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|5023799004|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: 090VMY3teNTC4WaMmER31zIO5Z1mvgQrp0hhxaJ2cx4VBaFqKWFOeCdsBCFd758JxHSOzgIczRZ/1gcPRkLUOQFya35jRNq7f9kkip4FKfp40EmLHpqfsl5a5Th4ZFol0cVobEbX49TtGW6B6Cndg8copWaosVK8yEC08lS8buQQfZLvd05iQg1VkVD2B1Lw7iy3F5TZhb4N6cmtMMpdfB4k+VkhVM9OMNXfWIJAw64RIMNMByD4xPKPpgWwbSwsPKU/hnRiruLAB9yzPNicNDQ+O9OZ8tnH8DilHmPaED5z/8/TBmQIjq6ETEWBvhaKZ9bg/qTNnANtAGIIwHPZMuNwJLSWoA+RNJnnZ3earnFBDcY59r3F1E25XdH8qs2YJyfIi7cHgQqm+YiSI/AzuTXjpWomkAZWi+WhbwyRowBOD6RnMcM+dcL27UhZxOC/xV34LJ6OuzlwmGxJBpaIi+3MNwS1Jy1z1m8MEoTjnGHmb+AS0CWdwuNOpqKE6pdFzZPIY1OIzaUX6APRp4XiACevc6E1teYy2sE551YzsXb6r6OzkfqGw0rNmpr5s6YudEubKgF4xpwaqh+V/sOMBoEU4FTShdYQFb+y2ODXYdqx894JrnPo7rR2eoNXnJrE
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(5023799004)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2pSZS9OLzJwUlRZV0duSzJXTFpmZnpYTVV5OEQxemRRV0JmQm9FWFNrTHpL?=
 =?utf-8?B?RWZPTGo1cGFUZ1FXSWxxMHRFQm15S1RmRVVFOGdieGdveFBlSjl0emszRDZK?=
 =?utf-8?B?QldZY0VSTDAzV1pTWEsvYm92RnVPNStLWmNNTG5LQlIrMmxMOHdlT1E5aGNy?=
 =?utf-8?B?ZFB2Y3VsTDRUSGJvQ0NkOE95ZzFzd05LOWtlcmgvK1liWjRhMkNWZ2xqNXFT?=
 =?utf-8?B?bkJESFZFbE5IaTdJbk4yaXNLYW0zVjlkd1NRUWNpd0s1eTZBSkFtdWxEQ3k1?=
 =?utf-8?B?RlZRZExoa1h4S05uOTNlclJybUh1bUM3anVpN29RMCtjSmZKbEo4ci9HdUw4?=
 =?utf-8?B?V2pCdDBXcFZMTFduWW9YTGVSd2RZYlNJaXpPdGR3d2xwRlZyd0dZYWxtL0Fq?=
 =?utf-8?B?Y3ZDQURVdnZRTFlhc0xpVXBCK1M5NjdZTGZHUVN0TmVzbGFMb3BkMW0zNWp2?=
 =?utf-8?B?Ti9Mc2pjVks3ekdqWWZaN2hiWS9Yb3FOV3lnbkRBREVWbFFwTzB5ZTNhZEFL?=
 =?utf-8?B?MHFRUllCUS9SZkpNQmk0VXMrKzVHN2pJeW9pVU1xT2lrQTJKLzlIc3RaSmlr?=
 =?utf-8?B?U3hXSTRvdjVubE1sYUdpZUtMZ2dKSjJyVU1oNGxheVd0YXlHYVhmRkdFZG5k?=
 =?utf-8?B?WU03V3lXdGloUDBRRm5YREY5VEtKVWFMTURzYzVQajRpV2JRcHQweFhmeUdm?=
 =?utf-8?B?OXlpamNUOWNldlpLZ2p1S1lJdTZ6Y2tYd0xUbjFWSlRHVFdMajRYdjkxanBN?=
 =?utf-8?B?VUhxaS9NS2cwTk0vQUIxaGFGa2J1YXhCZnRXMi9jR09zbkZuU3gyM3IvQnVH?=
 =?utf-8?B?YXFaZFZrS0RjSVl2VHRISGx5c3F0dDF2RGdCbThlVk9uczNEVFo5SDBmSGsw?=
 =?utf-8?B?OWdKWU9pMkx2cEtLVnFDbkpXckhWbVZBcWZxS2IvcUNpRVdpa25FMGpuNkJD?=
 =?utf-8?B?RFVKYkIybUh3Z0NkbGFuRUhWVEZ2ODh1ODBRU0xWbFdBVFpyT1FXcFhONnFt?=
 =?utf-8?B?bnRqWUs2bktTRlgxVFgrTmpFSG9xNWVYZFhUMCtTckVRQzF6bDdST0o1Q0pZ?=
 =?utf-8?B?ZHNCbXVqbnc1eU1XQ2NTeDUrdFp3R0VsdU5BSEM2aFNVN3FXUUN4blR2dk9l?=
 =?utf-8?B?TWdkNVRCZGJld1dlanExaXE3K2J6ZFJPQ2tPU1REckJ1eXZUaWNUeS9URGVk?=
 =?utf-8?B?VlBHQWhXamFzUjVpcTQ4SzJRWkpNeW5aenRiQmF2L1k1L3lJTTZndHQzbWUr?=
 =?utf-8?B?N2dqVDlVV3V6SUx4Tko1cG9BcEg2ZW92Um4ySHFjdFhZRGQ5c0wyOHFVdkth?=
 =?utf-8?B?czVvNFg2UmJvR0NrZklxS2NMMytEZ1NvK2JDY0NsQlpIcmFodmFBMDRNWHov?=
 =?utf-8?B?U1BMSlVYL09IOW5ZcTFiQ3ZwRUhhcFNISkxURmxPbEVxT0RoaEQ1M1RhSmYx?=
 =?utf-8?B?aC9NVitQWDVEZFliaDJJZTRnODNESlhmTFo4UzBWNHl1dDA3U3dMMi9jTVNs?=
 =?utf-8?B?d2RQU3Fucm1SR210K1hiM1Jid0NJeUNpSUNHMjJTUGxmRExaRi9JTnlRL083?=
 =?utf-8?B?b01PSnYyaVR4UHFxbzJlMjFHZ0xOaFUrUXVYNFlIY25nTjlDWGU1M1VHMWR6?=
 =?utf-8?B?V2hmaTNueU4vbVg1NVZ5azROMFUvN2ZYNmsxUklOZzd4RDcvSVB0WHZCamFa?=
 =?utf-8?B?K29ZdGtFM3Y0SEIwL0JJZG9pdHpuZnl6K1p5cXcwb3JPMllXSE5HZUlNWG9m?=
 =?utf-8?B?L2JMMXNXSjcyTmVvUDJ3MXVGaDRweHdNaWRTc3FOVzg2RUV5MG02RjJqQTJU?=
 =?utf-8?B?bVRkejVGNUVINklhYlBoRG5PamZQcjdjZm5tUk8zOVpYUTRFTW91Nkxndkkw?=
 =?utf-8?B?VEdHK1NuZGFSRFBzM3UvSHZUbkd2YmZLTEJHNzZlM0pEVVljOHBIUVZvWWlr?=
 =?utf-8?B?UFpqMGpyQmRFZERJRlRCbVl2N01GTHBpUndrbEJvWGJXT2VmNk9YTHZrWTJE?=
 =?utf-8?B?RXdJaVlDNThMR3E1eE1YcUExS2RLaHg4MC8zL3BqMXhBeEc2SnRISjdGanZG?=
 =?utf-8?B?MWdEY0ZyRDd2NnJlNVZLRFlnczkrWWltZkdwblp2dXNKUWNJMU5zMi9rR1FU?=
 =?utf-8?B?S2ttaWwwdXdadWpubU1ZQTV3OXZSb0xtaUVFRVY2RUhrcCtqY3RRMm1UTUhp?=
 =?utf-8?B?ZzY3eEdQbGs1elM3RVY1U3RQM2VyOWE2Sk1md1JGTXltWm1BNThDb0xsSEpo?=
 =?utf-8?B?MEV3TDhpU0pISmZpTGFqaG1UV2F5NnNaQjg0bFNoMklnWTcrOXFqdjVYZVl0?=
 =?utf-8?B?M2tJUWl5eWRDKytwZG1wZUVHQ0hBcDZVNUJJbXNoNUhTNjFOUmhwcVd6RDdS?=
 =?utf-8?Q?Ul8ihu5fN0mDZNik=3D?=
X-Exchange-RoutingPolicyChecked: ZK1MGGJFwiW5nbZ8xzOqkcaNfCoRk8Bn80ebFPrOS8loEnRnKEJj++1ZyCJrXHzlPkwAUHR2NLPdDbh6BpWb7lB1NREeRNNwIxsYFfZ+R1OxiZFpCQvv987xJD4BGZGyjrXUeKtaRxpRuozq7XxYDYZfGmtQgewqi806b/Li9kMEud7Hc0tKfFIbshk64UJlt7gz6QX4RRdLhkIgbzr4WlSkC4U+GkdoswxnsxeGViXXmAL0iwgFSxS/pxEcfIyYJr2cZdDkkfKBBhW9J74z60bnGK9wX593OfrRRdRRUDGS9xJ2GeFWZ4m5K0IHHB5xO3AoCTxad+UNuJ8YhKRAng==
X-MS-Exchange-CrossTenant-Network-Message-Id: e10a51bf-9524-459c-61a3-08df131c28b5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 11:26:17.5389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZyBQUPRl06QRF/ABsAv5HWaCKVbqM7lNAWx0UhGhWH9fw0jegwiXAPewsM1skCKTQt8kb61pfkFeRH4ry/J0wDXbg68ZJIwfjHpS2kUsILM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EA8PPF11583760B
X-OriginatorOrg: intel.com

On 9/15/2026 1:14 PM, Takashi Iwai wrote:
> On Mon, 14 Sep 2026 19:58:05 +0200,
> Cezary Rojewski wrote:
>>
>> On 9/14/2026 6:44 PM, Takashi Iwai wrote:
>>
>>>>>> Model selection allows for customization of codec behaviour and thus
>>>>>> dealing with various problems on very specific configurations. The
>>>>>> parameter already exists but is part of snd_hda_intel specifically.
>>>>>> Non-Intel HDAudio controllers and DSP-capable drivers cannot benefit
>>>>>> from it.
>>>>>>
>>>>>> The common place for all the bus drivers is snd_hda_codec. Add modelname
>>>>>> parameter there and honor it when initializing codec->modelname field.
>>>>>>
>>>>>> Link: https://github.com/thesofproject/linux/issues/5683
>>>>>> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
>>>>>
>>>>> The handling of the model option is a very long-standing PITA.
>>>>> A few years ago, I proposed a change like:
>>>>>   https://mailman.alsa-project.org/pipermail/alsa-devel/2022-September/206631.html
>>>>> but it didn't reach to agreement.  So I'm not 100% sure whether adding
>>>>> here is the best choice, either.
>>>> Thank you for the link, Takashi.
>>>>
>>>> IMHO patch presented here addresses the feedback. I too prefer
>>>> one-location-for-all approach. Also, I do believe having no option for
>>>> specifying the model is worse than choosing either of the approaches for
>>>> the model selection.
>>>>
>>>> snd_hda_codec module is *everywhere* and given the param is an array, it
>>>> supports even very complicated scenarios when multiple HDAudio codecs
>>>> are engaged.
>>>
>>> The multi-codec is exactly the problem I've been seeing (of course in
>>> addition to the lack of the option in ASoC HD-audio).  You'll have to
>>> be very careful how to pass the option, and it can be even fragile.
>>> That's why I hesitated to take this...
>> By multi-codec I also meant scenarios where one has 2+ codecs from one
>> vendor e.g.: realtek. Having non-array param e.g.: for
>> snd_hda_codec_realtek would not suffice.
> 
> But those 2+ codecs are for the single device, right?  (e.g. driving
> multiple channels with multiple codecs, but all of them are a single
> device for user.)
> 
> In theory, it can be a hotplug device, and in that case, we may have
> two device configurations for multiple codecs of the same codec chip.
> But, that's an exception, and I wonder whether we should care for the
> model option that is mainly used for debugging or workaround.
On reference setups we do anything. 2+ standalone codecs on HDAudio bus
in our lab is not some kind of sorcery. Obviously right now we
workaround the kernel by applying a bunch of patches. But adding a
module param (of type array) covers both: any userspace and any
reference scenario.
