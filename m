Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0028B22758F
	for <linux-sound@vger.kernel.org>; Thu, 17 Apr 2025 09:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744882520; cv=fail; b=Xzd5kc+fbEYaKEwNCmODfhWTTnAOHB7qah0ZEPM8MkXRLKyPpVR3HjiivtVQqRqYr8zz6W+m/OmniriXrCcaLcefAw0dCAaOE2GTv0qivhI0ulQpVtTcds8SLan0W5qfWuJyoT+OJTQFb/LaUu7ZemMCIiZs9ur7FmlYfOrl6+o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744882520; c=relaxed/simple;
	bh=uF6cEyrIAYrzQifk/I7FUYvF2uRhJyliLJlUM+3vP8E=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Mk68CPBPcK0dcXQ+MRSbJRt14sGEEba8Q6fcpUfbQ9zQc5n6z578PoaGwNG4BQSSYOSJEL/raq0PUcM19Eqb/wf3q7qDNYqWRg98OAwPUKledn87+GCGENhYN21S2f6zLpBA47doy2tAeoUyMxaIliVapymT0wkn58Lf+XXNkuU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DvhAx2vk; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DvhAx2vk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744882519; x=1776418519;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=uF6cEyrIAYrzQifk/I7FUYvF2uRhJyliLJlUM+3vP8E=;
  b=DvhAx2vksipmW2v0iwYBLAzQNyF4Wl7wqReQR38we/dl+t6wNFNly4n9
   UmdnL9cta3E/9XScTNz6ob5XoHMis3Qfb8cxx2VbY9eYKt+wjaurPfANA
   pXr8lz4k/Cz0tH9qhcf77IE2rMSMDB5bKY+4fOl6O1/lcXqO7xxXzmuyz
   eg9RF0FZ54WGD06IddCR5UIHI9ikcYHtA/4xEj24gTV03aM+jXq8TVuYP
   BR/L5Y63x9cAmM3LJOlPhY6Q0hrqU7oERhos9hK0xLd+nmdTQiecLluQb
   oXK6jrM79HVLCbT2pE8XMd6x6OG2LoalsMu4HnTykL+SvvY44u9NpOdo3
   g==;
X-CSE-ConnectionGUID: rOZIjORHT5SFzmM8UaJhrg==
X-CSE-MsgGUID: qRjay0ssSUC55FHOcEj4Zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="57831964"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="57831964"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 02:35:18 -0700
X-CSE-ConnectionGUID: +2WvowKSTYqeItTILp8vbQ==
X-CSE-MsgGUID: V2azNwazRqqERd6MVwz50g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="130740571"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 02:35:16 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 17 Apr 2025 02:35:16 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 17 Apr 2025 02:35:16 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 17 Apr 2025 02:35:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BqLFO4TFh6C89Cy9R4UQYzXWmQi9yMUlAZT4teTOHkP7ezhuA7oT9+w+EulFldENQm3NNp6xQi8xQUju9BdiSTFsZ3rZtJ+qVcoie2f0w9cGfGg3a1u3otGAIJA/9f3eRdyP19UJlfJtp4p8ofOsBPM3adYqFdss6ERbtGNCOgm6fEpPd1nQv1YKxnmP7KibDbdl9G/kdRuI5A5RXoDqgJyOwZBP4pJA8uso7CXySlDZp/BRV7vJYIVlmjCtXqMoRpNRw5oBdsni6dyqtQgd8ZmSb5H3x9Z4zaZZltj7Ly2ulM/AxzVOzE4ZqSNdrJrzB2I+DYMa18kZQcaHk8qqzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RJ3wfNj4lnGWx3r4j6aPaQcIW0j5YPIz85XHNus8rrY=;
 b=RhksXXa1s1/QxZPKzw2bHBCyLOf/cHfIkOGEM2zDO/cLZ7KOACP8hdSwlthk931iQjbl3dcX3+4Wgr3uvoJGBYfAUXjs6cDRlBwMmOVEu3PN+F1zewm++ulJdeNprSeDOcC9nyQD4o2Ke6s8cOWuh2FIuEs/UOL9PDP5CcPPQPS4yl1PQY1EOiNERlj9Lrrbrw1SiQHP9fdC+QHvsRDm4fI4IchjBnv56Tkbz4DZ5X/27BlY7qpU44AXIMMETL/F9uR1+fAHgmyQY2w5Ud2W1QMF9UZyeHMF7Krt3xan0T/OoJugEzR9zidvoOCH+15FLTQXTWRgHVZWgt52KLzoew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 SA0PR11MB7160.namprd11.prod.outlook.com (2603:10b6:806:24b::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8632.34; Thu, 17 Apr 2025 09:34:41 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832%6]) with mapi id 15.20.8632.030; Thu, 17 Apr 2025
 09:34:41 +0000
Message-ID: <a7ab2e02-a864-4243-add2-c16b54aa7435@intel.com>
Date: Thu, 17 Apr 2025 11:34:35 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] ASoC: soc-component: use dapm->component instead of
 container_of()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Bard Liao" <yung-chuan.liao@linux.intel.com>, Jaroslav Kysela
	<perex@perex.cz>, "Kai Vehmanen" <kai.vehmanen@linux.intel.com>, Kiseok Jo
	<kiseok.jo@irondevice.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Peter
 Ujfalusi" <peter.ujfalusi@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Takashi Iwai <tiwai@suse.com>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>, Benjamin Bara
	<benjamin.bara@skidata.com>, <linux-sound@vger.kernel.org>
References: <87plhm9h5q.wl-kuninori.morimoto.gx@renesas.com>
 <87o6x69h4y.wl-kuninori.morimoto.gx@renesas.com>
 <921a38aa-8a75-4561-b505-14961d9e20b5@intel.com>
 <871pu0na09.wl-kuninori.morimoto.gx@renesas.com>
 <8734efh2s8.wl-kuninori.morimoto.gx@renesas.com>
 <fefd793a-3625-41a1-9fa1-ddd6cbbf3612@intel.com>
 <87ikn7r5qm.wl-kuninori.morimoto.gx@renesas.com>
 <87jz7nlcvf.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <87jz7nlcvf.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0092.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:18::32) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|SA0PR11MB7160:EE_
X-MS-Office365-Filtering-Correlation-Id: a5eeeb8b-ff83-4905-5a89-08dd7d93149c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VEJxOWtsVnBIZm9Teis1QVo3WkdGVWNmU3dDOTdZU294dytKb3dsUEplSUtt?=
 =?utf-8?B?dDhRTkNPNHNXdEl6T2RJRW8rR1ZyZEJBdXhMbkNEMFd3cXBValpYY3RxZFJ3?=
 =?utf-8?B?ZWlucFZGanF5NVVHTExjTWdmZ0lnQ0p0L1hnbFgranRKVisvTzNTNjFoaHJF?=
 =?utf-8?B?YU5YbTB3eEpndkdtTklvckVQQUxkZmhaNTB3UFAxKytQeDlMa2lEK2twZHQr?=
 =?utf-8?B?VWlJeDNzVlJPMU4vU3R4US8yM2JjNmEzR0RCWVF3QVhpTUx1bjBwdG4vM0NK?=
 =?utf-8?B?UXBpR2ErR2lFYXc3SEx3cDdtS3Bza0l0WDhibGFHSGQ3UG84RUprZTh5akk4?=
 =?utf-8?B?UzcxUmJTdHUvQmdiaHg2WHlhOTAzK0V4N1hra05sNmx4VC9ENmw4VmcxRTcz?=
 =?utf-8?B?cnBBV2RlL283YTA5blE3MDJDNGxKajNOUzcxR2IyK3VnaWdaUFNOSGhCanFh?=
 =?utf-8?B?VitKckdUcmlvTGxzcXgvNWlCQ1FMNFh5TXFQMk0ra1Q4aUJrVzZ1dnovM0Fk?=
 =?utf-8?B?ZE81TEV4aDlHeDBHdTMyVHE5N2NEU3htdUpFY0FnWHplK0l5RW04QWZKZHBD?=
 =?utf-8?B?YlVoMFA5amc2SlhUbXMrbkxMMGFUL1ZJME8zQXFkVFVjTGxpdjBKb2FRVjNK?=
 =?utf-8?B?TjZSaWoxSkErYkR1ZUJrelVMcEdxOVljYWUrNHZNbVczamxKTDNoNWhjMGNT?=
 =?utf-8?B?UHU1cG0veDhZNlBha3R2YnFvZW1QRXJ0eVZiUDhXSjBpUDRrZnNVWW1rMWxW?=
 =?utf-8?B?MU9vK2Ntc1BaTmdVSGVVV0tvbENqdU0vTzEzSVN2Ri9YcUlEeXdrUHRKZG5U?=
 =?utf-8?B?NFBDMS9DNGRWUFkrTy82UVJNalpob2h2VksyakdxbUFKcUw3ejhGb1RzYU51?=
 =?utf-8?B?NDFVVzdWT3p6N0lkRDU2WVk4VDlkZllQVFZlRW5uTTlzbEJvVEtwZTR5RDRa?=
 =?utf-8?B?WFd4OVBwaXNxWURRVGw1UUZ3UjU5NHVSeFZwQnZrb2NkZmhvTDZMU2lSU3Vw?=
 =?utf-8?B?dkw1RW5tZHJkaEFvTVpPemRKMVVwbWZ2VDV2SVpmRXNSRkg1VGZiaHEvT2w3?=
 =?utf-8?B?Y0JaU3VtbmdkSXl1bzgxWDlXcW9OV1V0R3BzczJSTEZIMTVRSDZ5ZjAxRFRI?=
 =?utf-8?B?RCtSaXZ3NEM3TEVXMW5tTDQvdWhCbXE1aHpsVmZlUWpzbGZGS0JVME11TCs2?=
 =?utf-8?B?OFFtS05ibHprWFZla1BkRnRlWHZkRmk5MWtzT2JuRFF5dDJCR2ZoSnJoTlZP?=
 =?utf-8?B?aDdGQWwrUHpwUXhENDVaRDBMNFJ6bk5BVkNIVi9PZXdDTXMrL1lqQ0c1NnpL?=
 =?utf-8?B?aFdJc0E4ajhDRzZVYStnak9aQm9sTXc5ODBTYXIzUjJqalFGdmhBZG9vSnQ0?=
 =?utf-8?B?dFpvM21VeW9rcnVVVitzcjMvMXpVUjNNZEUydnNENnFoOW1WVTg0OWxCb2t0?=
 =?utf-8?B?OUpFSWsrbEtNWlhEQkhtQkQrVFBqc0tHUkdZRlJvbTJFKzk1cE4vOGE5OXFG?=
 =?utf-8?B?VGFKdmh5L3FuMjZudjZSQytvTDgvbUo5WERRU2hXSEdUYTAvR3Y5VUg5THdD?=
 =?utf-8?B?WEhwNVpidlNXaWhEbGJuNjQ4UG5JWXExR3BWNzVWekNvR1JNdlp6REljVklY?=
 =?utf-8?B?ZElrZHI1SU1ycUd1RU1iV2hNQ0x5d0hoM0JyVGFwZFBoQkw0WHdReTl2NS9W?=
 =?utf-8?B?VGcwSllxMXlwS29HSnJhek1yaXo4YUk3elhyMmk3d1F6ZUJHT3kzUzVBakNs?=
 =?utf-8?B?Yks2Y3FEY0U4S1hpSEtyL0syWDFUUWNybGE4TUhKUDlOc05LUkNudlh1MzFM?=
 =?utf-8?B?QnZpbGFuS0Z2bzJQMEpaOWxFZ3ArTm9JUVk1dVNMb0E0cHFTNkVtRitldmVP?=
 =?utf-8?B?TXBGVWEzSTF6RWg5TFgvdjkwQnRHTlZobE9rM2wxSC9lZHJkVkQ3cUJEcG5I?=
 =?utf-8?Q?/vN86MASoEo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWJVV3FlMlEzVnJmOUV0eTdpSW5kNFl1aklxRmk1N2NqMmlVU2RCMERlS1Zz?=
 =?utf-8?B?WkhEZ01oKzVYMVRWRXFCc0l5MXMwVzFNMVF0b3hzaE9MSi84Z0Z1MDIzSDJP?=
 =?utf-8?B?cnB1aVpvaFJ1MVlpWC9xUjlJcHZUQ2xlOXA1KzRZYzhRbk5JN083ZzV4YUNq?=
 =?utf-8?B?MExpTUZzL24yQkE2eFc4NFV4R3JHRXltNFdraERySGhJZk9DZUowTy8xYkIy?=
 =?utf-8?B?VVZBZHZJNFAwZm9pZWF0aVl1QnVyRDcyYTNIRmdMalVpNHZMNk1obVllaDhV?=
 =?utf-8?B?WU1jZnpJYXV6SjkrSzVEakdLV0VrM0NRQ0NaUGxiS0JWVVJwQTZjOWorS3Vk?=
 =?utf-8?B?a2Y3dEFhVWxJbDBHUVRGby8zS1VaZnhwNTdPVWgrTlA0Q2lRSktFdTNJNUVj?=
 =?utf-8?B?eW9xRGNxWFp1VnZlOUpMRDJ1VWZNY3JWZ3ordWtMQ3VYRlRWRjFML1YyREJD?=
 =?utf-8?B?c3dvYWZLUUgydnA1eUJUVU03Z2p0QThEMFQrOTkyZmEwdUtURi83OXUzSHRY?=
 =?utf-8?B?ekE4cnhTejNXaXh6eXh4aFJqRHB6V0plTTBnSk54aERJUHZwc1pXVHN3YXhs?=
 =?utf-8?B?ZkQ0ZWpVQm94Q0Y3MVloR3duZGZwT1QyQ3ZBTE1NQ0xWa1dwVFNvRUJrVG0v?=
 =?utf-8?B?MFZlcWd4SzIvRlI1ajVNTEYzMFlKeEEyUVRwaGh4empzRVpDMFBCSllHNTJo?=
 =?utf-8?B?WHh4dEhyemhzOHJFTmlKNzVjZVZ3TGVTRCsxWjQvK2l4YlBLWjlCWS9lMmdm?=
 =?utf-8?B?YnZjM2RsbEV5ZThScktETU9Ba3JsZ0VTN2lLaXlxMlIwSjN5a2JTcDNCQk0r?=
 =?utf-8?B?dVRDRExsOUtaN0xYWHViQ1I5WmVzTEMwTXhkdy84ek9FQkdYeXZwZ1kybDlR?=
 =?utf-8?B?L3JDd2hEWmV6QnNxL2FramM1VlNNV0JvNER3dWNITHFBd3RQakowZnJuRlJH?=
 =?utf-8?B?VzN0VWJkNTZuWmNob0pFSUFqV0djVUNOYkFCbVJFTGpkc2QvaDUyZWI4eW9T?=
 =?utf-8?B?MUM2YlNVRDNkQnk1NVlPQnBINmJEZVJOZmNxNjhRS2NQdngxdFhQazRsMXgw?=
 =?utf-8?B?cC95SW1Ob0ZZV0pyNy9ncW4vMVhhUjBvRTJOWXNXY0ZCTHZ2aGZKekE2bTh3?=
 =?utf-8?B?MHFvUk9TdTVsTWc5UG9GZlB6aEZBU2sveU14N25TWjZ4UC9Mb05kM2lKYWYr?=
 =?utf-8?B?ZlFxTEhUbVJCNGNqQ3VvOVByOTkwV1RhenpwQjBuZGNWNU9UMVMrMG5YNG55?=
 =?utf-8?B?TUp1azdBZEMyM3gvUGVxUlIzczZxRHNkZjlTZUlBankvNGR3aEZYbkU3dVZm?=
 =?utf-8?B?NG9GWkFKdDJ4VHo1N3I0S3dSQjRqbkRUYm1zNjlvYk5iSEY0STJqamhCRmVZ?=
 =?utf-8?B?QzlpWGlmWlpjZlExendLYUErYXM4NHJ0Y29PTk9QNXpPY3dtQWo1WG05YXJS?=
 =?utf-8?B?QWdrb01pbXAvMllhNmFmUzJISTdyYmlYN0FKYmVCVnY3eFdGUjhLTStHMDAw?=
 =?utf-8?B?WVowRUNkWFhxT1M0eUowMXFUOGoxNENXVDluei9ocmpRa2p0dmZjdUQydytR?=
 =?utf-8?B?ZTAzUGt3TjdILzh4UjJYZzVKTUVzc0kxK2RYL3JURVB5ZElpSy9XZ2ZGQWwr?=
 =?utf-8?B?LzJsVWtwNXc4MUNYaWJFL0hPSzB6c2JWYzdjckMwT01PL0RQYTBhaTFSOGJH?=
 =?utf-8?B?Q3dVS0tRVWdKWFlyRnNralJYd1ZQeGoxclVrZEljODJYdXZsL1F5cm8ybmtr?=
 =?utf-8?B?QzVIa0dqb1Q1ZDlnUUxpYWp2bkxIcitMQUM4QWx3R3U3aEYyNklwc2VXelow?=
 =?utf-8?B?OWRLZzZrNHlCbW40VmxHRVlCcU1JYjhBRUtLLzJERlZSc2ZHUEJhMHhGUGQx?=
 =?utf-8?B?MHR1bkpxdmEzV1lwZUJjd2s3R1dTVXlrL1V4Uzg2Y2xXaXRoUlBkYlNWeldn?=
 =?utf-8?B?dDUyMU9zR003WDErbEZxb2hOdnFHUGF2cy9IaWlDMDJNVXRsUnJ3NDh5MlV0?=
 =?utf-8?B?SGhLSWEzMjJqWWM2dWw2V3Jpbmo5UEJvZHZrU1dZdVRjdi9MMWVUeWhTWW81?=
 =?utf-8?B?eVM2cG52QXdjU2FnSDcvKy9QZWJ3ZDN6c2FoemkwVndaK2dzMEF2aW53TDZo?=
 =?utf-8?B?U0pPdVpuYkI4V1pHTzRhbzdIOHByVXJvSGE2bEw0eWtKMWRjRzhic0NLM21C?=
 =?utf-8?B?SkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a5eeeb8b-ff83-4905-5a89-08dd7d93149c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 09:34:41.7442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xzu7OlK3XbVRvBM5RhExav9AvVOb+jpQUA/ACwMslZJaWKKPFV74Ziml7ruZkugPJ6Jiq8ojbXO4G46PAnEcLY3IRwPIvP4zcNa0oGCsp7U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB7160
X-OriginatorOrg: intel.com

On 2025-04-14 4:01 AM, Kuninori Morimoto wrote:
> 
> Hi Cezary, Mark
> 
>> 	dapm->card
>> 	dapm->component
>> 	dapm->dev
>> 	dapm->bias_level
>> 	dapm->idle_bias_off
> (snip)
>> 	snd_soc_dapm_new_controls()
>> 	snd_soc_dapm_add_routes()
>> 	snd_soc_dapm_disable_pin_unlocked()
>> 	snd_soc_dapm_sync_unlocked()
>> 	snd_soc_dapm_mutex_lock()
>> 	...
> (snip)
>> To hide dapm_context details from user driver
>> 	- define struct dapm_context name only in include/sound.
>> 	- define struct dapm_context details in soc_dapm.c
>>
>> To use dapm_context related feature in user driver
>> 	- use snd_soc_dapm_xxx() function in all user driver
> 
> We have 2 way to get dapm_context (card vs component).
> So if soc-dapm has function for these, we can remove dapm_context from
> header (Not 100% sure for now, but maybe).
> It will be big patch-set. I'm OK to create it. But what do you think ?
> 
> --- soc-dapm.c -------
> 
> static __snd_soc_dapm_xxx(dapm_context, ...)
> {
> 	...
> }
> 
> int snd_soc_dapm_xxx_for_card(card, xxx) {
> 	__snd_soc_dapm_xxx(card->dapm, ...);
> }
> 
> int snd_soc_dapm_xxx_for_component(component, xxx) {
> 	__snd_soc_dapm_xxx(component->dapm, ...);
> }
> 
> --- soc-dapm.h -------
> 
> #define snd_soc_dapm_xxx(x) _Generic((x, ...),			\
> 	struct snd_soc_card * :		snd_soc_dapm_xxx_for_card, \
> 	struct snd_soc_component * :	snd_soc_dapm_xxx_for_component)(x, ...)
> 

Sorry for the delay in response, Kuninori.

Now, personally I'm up even for big patchsets i.e.: it's 'just' a 
_proposal_, nothing is merged by default and every good engineering 
discussion I see as absolute win.

Reducing the need for users (sound drivers) to manipulate dapm_context 
is a good thing. I'll tell more once I see the actual proposal. The 
pseudo-code shown above, provided is used by soc-core.c alone, looks good.


Kind regards,
Czarek
