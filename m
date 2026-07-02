Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E8B42E8ED;
	Thu,  2 Jul 2026 09:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782984690; cv=fail; b=s+b6X3jWr2Xrw6XmsRj57SfWBrfzJwYGOMCbOV/+ADOMiAPXxtLAmkGHZRMCevora8GlBviMBqsY7BXfEYFfWtdC9Mrmy29pxAhzxqWmWHbCHZKdfmhgtk6/ogX73g3pFd2kyl05h4EJxumPHwqIGIODlj8T4YPI4L786s5Im2Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782984690; c=relaxed/simple;
	bh=EGDysFY/GQf0uM6AKkgXhXDnZmB9zwkbQyIBOJUpgmA=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qU5g1K+PdC35yEOQQ24Tj+ECaDyPlFbafOJBSw/U/8T/TtmMVvaj+WyEopsXETIiwNTyLVGCUyz+JIFXuTTxhekabAq9dls639EUISImM0jxRM7CZGQswOQEx7ttf79LoYCu9MgWdbqKdebdaWESRlvz/EqvigofRB/K9kLLzi8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VEG0qG0s; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VEG0qG0s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782984688; x=1814520688;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=EGDysFY/GQf0uM6AKkgXhXDnZmB9zwkbQyIBOJUpgmA=;
  b=VEG0qG0sN6rARBKIlWUL789GCvhId9FkPU2eun1wFUS1HFLuu17XcPBb
   Z9Q4KzTyE7LSaAbOnsPTl3p/RKsAONUpHHMXQEyplDW2ADb6AFN0x3GT9
   6GPoj+iFc8gbcvBkY3QG2FG0JHXfPEBeIRn9ycCBJSW14POfyP4SxH4Q2
   xobx5lXSmg4Aya8llvnT2jxau85W0dN+DeEjWXBsUz/+0XXjOMSnJIU6C
   EmlCehsG1N4eNOvpAvNimUJGPcAI17+XeIhfbGVNVIzKmqKAWPOhVdBcu
   wiKQuOp0OPt2Yig8PuJdehHxuFO+bjLiumkPzZ9w1Qp0veBvdKqsOWi7F
   w==;
X-CSE-ConnectionGUID: qPBVZ1cvSAWiZbAF6mVkxA==
X-CSE-MsgGUID: hoIgJZnBSPSzOiqNHtwhiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="101156346"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="101156346"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 02:31:17 -0700
X-CSE-ConnectionGUID: aPDAkP0CTiynFfl1dPgVKQ==
X-CSE-MsgGUID: 5I8BzDH5QQaXMxxYsrFnpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="254754676"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 02:31:17 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 2 Jul 2026 02:31:16 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 2 Jul 2026 02:31:16 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.52) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 2 Jul 2026 02:31:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cAHzKObfpDERTUZitw4Bf+is2pIOy9/OXM4o7BrTbOdJkJgojOakjDhAPhc00UQzN5rcXcBy0XiYRnSD+LkgdAgUMmS4WNO5P2ax3fkBikqTQ+gRoiGfo3Wxzs+QK13fmkLc31xZ4vH9mtDBehm1bfiHkCAnNejygNmh3wRyIFnnnnkGboeXNSmO33an4xUSk/afdOb2yhSz+NfxGzCE8R90YWZrgWEIKm2HPLdiXXhaWh7l30KIlQR61ml2PONHrd75Dos9BQkGW3t/K8EMwgh9TB0/UavuQAK8swmsPElpIO/c8rRapfrNB3hYp3Pr/mbV+SWiPLDGGR8RKWdv+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PxKvZfPhUqsrgQf1f24GtOP7iK5b6tf2HnpQAY8v/Vg=;
 b=E2mPoKEU/9YjuQShfZ6PdORe0/jHQ9gr+Hh6b68xPp2plMf5knGCG70NnDuEcwd1X3tiUclBoCbejVFJnaM5aRxL0KgaRtGdEl8m4jnDNYVScXrH1m4swUNWlto94eNbde502QPNKFkpjc8r5T3ldCZcwH5U/2hgEfVIVaG6kEjgt2rUfvFJrMevrXrkSz3lwzynIfPYDU2vGqzxFv1pqCyEKW8GHicsa+XWlCjZtMX9Ir/D4N1tzoXBbStm6sNk443Y2zbrjUGqy2NnojilDalktjqoC84tWz1XCHqX75eghQS650vN7FXRRqck7wpaRyQT4KZNSASBVsCTGVw0QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by PH8PR11MB9746.namprd11.prod.outlook.com (2603:10b6:510:3a4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 2 Jul 2026
 09:31:14 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%3]) with mapi id 15.21.0181.008; Thu, 2 Jul 2026
 09:31:14 +0000
Message-ID: <5192ca58-6e3c-4ad2-a66e-abd21c778461@intel.com>
Date: Thu, 2 Jul 2026 11:31:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] ALSA: Remove redundant open helper return checks
To: <phucduc.bui@gmail.com>
CC: <cassiogabrielcontato@gmail.com>, Kees Cook <kees@kernel.org>, Ziqing Chen
	<chenziqing@xiaomi.com>, HariKrishna Sagala <hariconscious@gmail.com>, "Dan
 Carpenter" <error27@gmail.com>, Cen Zhang <zzzccc427@gmail.com>, Len Bao
	<len.bao@gmx.us>, HanQuan <eilaimemedsnaimel@gmail.com>, Kyle Zeng
	<kylebot@openai.com>, Dewei Meng <mengdewei@cqsoftware.com.cn>, Maoyi Xie
	<maoyixie.tju@gmail.com>, Mehul Rao <mehulrao@gmail.com>, "Sebastian Andrzej
 Siewior" <bigeasy@linutronix.de>, Nathan Chancellor <nathan@kernel.org>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Jaroslav
 Kysela" <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20260702084445.519669-1-phucduc.bui@gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260702084445.519669-1-phucduc.bui@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIVP296CA0049.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:353::17) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|PH8PR11MB9746:EE_
X-MS-Office365-Filtering-Correlation-Id: c1d65a13-f4b0-44ef-ffe8-08ded81ca956
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|23010399003|56012099006|11063799006|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: he5VIPdE4+LZrLw/CrURjHrUutboVQn/E1wfx3AtMVz7hvwgnXgWt6g9rRFe4afuSI0vyToPdcwJ+fCQPi7tgr7eRyEENraSwM3nM3nfGgWVSKhe3Q/TZ0Pnf1XMrFqA2ntN4HHxEsWEgjD8dSqqsuQGt0qJzqVHFS6Rv3fsbL62oXrdxxuqCmuA2aeFX/nPp5mj9R9N9kDTqxpumTf10v1MXuK5r0sd+MVOCe6CHD9NTx4hF/LIflmy1WBF+pPEM2PXSwLSFRYQLoT3sUUu5i9UnnLG253YYK56/BoNWisSJUqmquGXPI6j/rxuRhVz5oMrRC6VwCC6RmvpPkcrpSo/vn5KFhWQNH7JYcYVx4ctJ6tyD0s4WQQPclAXjGWZzEo390CNaDoz+Rv8ltty/fXqzGbg4UkWlOBVf7vR+IiR/Y7liqnJ9tQ4BNCzy38kWsqDzmXMv20B9CCGjTMb94BPlM2YHAHEwUg3aTM2f+Oq1JLFMIldm9mzOpCyTJMEJ9mEqUf73EQys8DOfO4uWzo7vtO4tedZ2ehjPxXnIPuBF53xoW0VhDX9MO9om+jFA7SdrNCv8XnediloDxnpzNdfkOKpkf6TuX63w9AdBw4ty77JJe+5V3n/wjYvuFYRSNnjDpXEJtbetIjIzjwBFLCyaBt+bJw/V8tRDA93/Qk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(23010399003)(56012099006)(11063799006)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFBTMXpCQzVHaEs2aisyQnMrZkRoOWp3c0NYNUVjaldoOGtGYUdUcDhqdVhU?=
 =?utf-8?B?UkRFN2hPd01yR2ZDN1pIenVaV2txVmUvdGYxajZvSUJ1K29LOG52bkdQK1NG?=
 =?utf-8?B?MStoSDl6WGtTVUtYSzZSZHp4ZGN5QmVlaUdQSWcxbnNvVjB4L3A2VG5yTnhj?=
 =?utf-8?B?SnlyR0ZDQUhSajZBbDAzSWNZblZRWXZMRW5icm1jTkdqSlRuazRtK1lQMHBG?=
 =?utf-8?B?OERpSUVFSCs1K1UxNU5Xb0twRUlxK1lyMG9EeElTR0U2VG1WdGFHdjFDQ1Bn?=
 =?utf-8?B?Y2w1U2J4a21DL21sYlRDRkJhcXZnMUtuWXVvdHRrL3VYU0txbVJ2SWRpZDVN?=
 =?utf-8?B?allqZ0FHVGhkajRDSUlFNXpWRUV5ZVJzMjhhcHNnZEZlaEhqOGZ3NXhEQnVD?=
 =?utf-8?B?Wm01SHVrUlZSWDhXaXN1dGRnQnYrNGRHalRmUmJRV2psMDF5anA5SXlRelhk?=
 =?utf-8?B?aFFmS1ZDcVJkekg2elYyREozYWJQcUw0cG5UcUVXaWx1SW1nVXFPMkx1d1Zm?=
 =?utf-8?B?ZEQ5TkJhS3ZKVTVUd3pBS0NVUHBuMHZIdXJsaHMwMTBraWMzS2F6N2FodCs0?=
 =?utf-8?B?Z3ZBQzlzbG8rdVBVZWhaOGdVZFR3N0s4eitNUHJYT1BVZzJ2UUl1bDQ0SFNl?=
 =?utf-8?B?YnBLUzJENTVTMmwvbStZaTJCOGZHZTFsa1BqK1RVZ0M5K1dUanVjN2VqM3ZH?=
 =?utf-8?B?NEdzVXg1eDNXUHZ6SzFZZVl0ek5tUjhCNXVKSnBkZVVsbGd5Z09lamMzaFhT?=
 =?utf-8?B?MDNKSVB5Zm5NVEVnNlJ6WE9lWnRsV0xOSEw2Z2RTdlI1aFYxL3MvaTJwYk9C?=
 =?utf-8?B?S0Q4c2ljQ1UrTDBOaVdTWGUyNjhsVndLdDIrc2tpKytBUGVvN1lmUDRtVlBm?=
 =?utf-8?B?UWUwMy91cks2bTc2eVJ3ZjF4R1NKbEErY1dNV0t3N2hQdHZnbGQzd1F3QVFo?=
 =?utf-8?B?WnRZOGNPSXgvd00wZndLQ1Zyc1NnUW5QWFVwVmcxUE4wd3Rmdkc2dXR6bTVo?=
 =?utf-8?B?WFNWR1NtYXJ6WWhKVmRiOHkyTTcyYXJoUk85L0hobDcvY1Z4N05KNFFQTkVK?=
 =?utf-8?B?WnV5dDBRNGlzQkFoWkc3Q3M0WW9QL05zS1NKbnhjYjFxQVZhNE12UWM4SDNj?=
 =?utf-8?B?QlRaSGtTYW5mTlFRWWxTVUpScytQVWZJRnhqSTE2WC9MeWdCOUZOdXJuekJW?=
 =?utf-8?B?bWxqYksvQkxxWmVBMm44UnpHcmZKTm1DWXQ4dUZ3dytmZTNpTmtVcFJ4OXB5?=
 =?utf-8?B?cy9JOGREQ3Q5QjNpOVZXb0paSEtvbi9WZnZDbmNGQkRyckNQdkxDTmozK3pQ?=
 =?utf-8?B?TzhqUGYrUzl2UnRxUWVFWmpDTzNLZkNLYlQ3NjRwc2pyTWUzczdWU3VPK29y?=
 =?utf-8?B?L0NxbXJ2STZQVS95dHNJY0swV2ZGQS84dHB6enBGV3RYc3pkcnFKV1htWFN0?=
 =?utf-8?B?NVZHc3BuMjc3SjN6amRubmdpZEhFVkwxQ1NmTDEyZjBnUkFpRVdoWHVxU0M1?=
 =?utf-8?B?UzlrUElKbjd3K2FHM2hFcXRpL094bmUzRmNuVDVIak1HTVVUYlNxVDk3c21u?=
 =?utf-8?B?YmwyM1RlNkJUZXFubTMrbnFkaE51ZGJmVkYwbVVwMHMwMk9OTENxTUJaZWZE?=
 =?utf-8?B?SEdqYjN3b2o1SlFuZWRkVkZHN21QcEttSU1hQWVkVG0vdzBlZ2ZWblBEeWM3?=
 =?utf-8?B?eEp2RjlpTzdwbUd4NTJiNCtsaFNLT2lacEtSNzZoYi8rMWxpYk9uSzlGdXZ2?=
 =?utf-8?B?S0pDTHpwQ0U0NmUvOEpZTitNTlB5eC81cmVWTGlmR0NzdUxmSXJERG9zd1do?=
 =?utf-8?B?MTdPY0pCZElGZG5JbEJ4OGprMUFDcENUMWVwTHlVTk5tRjl6WVRZQ09KcGlT?=
 =?utf-8?B?Q0FJN20ycXdqYTNJdnE3UWZIR0VsdmY4eS9iZ21OQ2NweXE1bUtZeFlKdnhR?=
 =?utf-8?B?aVdJVjZ1ZjhyVjNCM3dmZWJZSXdoVnZib2N0NVJMcm9DMVN2Q0lSZS9WOHV3?=
 =?utf-8?B?aG5LRkM1cFdMYlB6OGtLNElBblNrT1pBNUJuSDMwMkxJMUgrSStTTjUvcmhI?=
 =?utf-8?B?bFhlQWZYcUxwazJCVUdCSDl1RHNwc2RYL3FGTlBoQjk4NHBvaytETUZoV2x1?=
 =?utf-8?B?bzMyYWpLOC9HU20zR1QvejBseDJpSkRlYVkzYnpzNlFsa2c1NGMxNXNVV0d0?=
 =?utf-8?B?b0M0OWRxaTJEbWpEeDJ4dERsZEdNbEE2OUdWOG9VL216c1R6a0t3ZnZlcm9Q?=
 =?utf-8?B?YURDdjJTZm53RDhNazJCRmlaemRtRjlRaEVFYW1KT0hqVS9ramE2SkZYT0kr?=
 =?utf-8?B?cUJaWWFlSFlseFRIOE1iaVZSZGJlTGUzcHdQOWJzSUZMRkZnYUZYNWVPZ2dD?=
 =?utf-8?Q?iwdjMPqd94XqqGvk=3D?=
X-Exchange-RoutingPolicyChecked: Qkdsha6rcRNjt4H1FU7vfzswfWRTG+hKnbyVMl7NnwviVtJ+3PiyITQ5XdY/dcDKgMKQOF+osiB02zMcFGjEBYC2cpt5UVxVLG5C++9Yk/Kq4frGvX4+5QIawBdqKvil9xKpi3H9NYvzMpXW8gI8CCh3GpjmgeH7ESI/RqFcpYGLTvo3tTp+Ffn8sjNB8B0D/AZE+zrCVCPk3+FIN3oLE7GMl9QnztXLhFARUC/Gy/oJkssZGAvAVs/CHjMeESQQgFIKjy5xTShGM7XGvlC/rfx81N3IYZne0ZuMNzkU1Kcgho8yZHmC02/YkHhRQ/FD1ns7a+m1FIyT+NkSBGDFNA==
X-MS-Exchange-CrossTenant-Network-Message-Id: c1d65a13-f4b0-44ef-ffe8-08ded81ca956
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 09:31:14.7454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6wlmoWs0kWT/5f0Q63hhGtDOui2bloUfggF1z+bBTBG0ZCZRtLDIT6oewrPLgd3QeLPJA9tA2BtSBng6K9AVyerjv+GHKTvdt4WMUZHXn7I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9746
X-OriginatorOrg: intel.com

On 7/2/2026 10:44 AM, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> This series removes redundant error checks after calls to
> nonseekable_open() and stream_open() in the ALSA core.
> 
> nonseekable_open() always returns 0, so checking its return value is
> unnecessary.
> 
> Several users were later converted from nonseekable_open() to
> stream_open(), but the original error checks were retained.
> Since stream_open() also always returns 0, those checks are likewise
> unnecessary.
> 
> As a result, all patches simply remove dead error handling paths with no
> functional change.
> 
> Change in v2 :
>   - Drop the unnecessary assignment of the return value from
>     nonseekable_open()/stream_open(), as suggested by Takashi.
>   - Merge the individual patches into a single patch series.
Hi Phuc,

Now I released you've sent v2 within few hours of sending v1.  The 
comments I've provided for v1 are already addressed in v2 so:

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>


Kinds regards,
Czarek
