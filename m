Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8031725A2CA
	for <linux-sound@vger.kernel.org>; Wed,  9 Apr 2025 08:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744185603; cv=fail; b=uIiip6SkOrsNBb6LtvVGbswjknVd0NP6rXHpiLMCIIDDa0jkjO04MfKJy2SQUwYMdeBimXINZjmYlVBMocWDASBxWcmrUWCDAN1iNjLfvtT8P9HicRlNZQTU5Em3Gysxr7aVBCyHVLEgKYA4W4S60X3WezX9Pb/oQeDixy2dx+E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744185603; c=relaxed/simple;
	bh=RAercvpqJ1LHSqxkWIjd2iUsJZrhyO34rElbCsgOjTk=;
	h=Message-ID:Date:Subject:To:References:CC:From:In-Reply-To:
	 Content-Type:MIME-Version; b=agNjNhnyHMXwlXjy2Etii2tSwklQZcpl/ZBgKmfkPad2PIUjQZlo8TRwJjp73NfMOMzjKsEohEYjqHGZjKbBi1bmBVouQEeibt22DAMy5zFYNN0CqHQ1IKy6a52CwElfcwdn3fxoWmq3sBvBFqawDaUTsFyk4AZkZ+cat75GM/Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EG9y4EnB; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EG9y4EnB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744185601; x=1775721601;
  h=message-id:date:subject:to:references:cc:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=RAercvpqJ1LHSqxkWIjd2iUsJZrhyO34rElbCsgOjTk=;
  b=EG9y4EnBnTvSMyh4qY3wwsB+oG5y2BLPjf47U27zgZB7cuptxwh9h2Dh
   Y1nfw0EDQck88snrgsAX8qQIbSxtEDcgCOD5hKcWrLv4QAJhd7k371X9i
   j7VknGYD4x/AYVDznwBJuEw/eExV8dMzsvN1nGcbcczbUYQLii4YoM9LV
   dCDw05kaZyifpJiQkMtaB39tNgqvhcJemNHsciE7iCFltXY05cXf3J/Dr
   cQw6D11aSsdjaRBM8O1Kr2hUbT+omn0uueJT8ho6/A8JImHQBLqS3VFmZ
   adMGJnV6zsYHU0KdTMQU8zyYzylBQZ9ntGUVbQIJaBZb9MTqwB6vluWJM
   Q==;
X-CSE-ConnectionGUID: rl/FARSkRBeWXDglyRXwow==
X-CSE-MsgGUID: evRFvi2ZRT2K2nGR1a4JBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="71022555"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="71022555"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 01:00:00 -0700
X-CSE-ConnectionGUID: YbIBrIoKSwOvrGkfK9mqbQ==
X-CSE-MsgGUID: pkAOFKAERiaW/+jKak0QZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="159491643"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 01:00:00 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 9 Apr 2025 00:59:59 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 9 Apr 2025 00:59:59 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 9 Apr 2025 00:59:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WIOvZuY4CxTY9ey2L0P0YIY/KgNjc0kHptUjkxvZxa/ypkipovlfQhU9hubMVEgQD2XXoUDr4Nc/BM9FTbLqxm3sh7kAhc1e8OM2oruWbyTXWrYZR3CwEG6tsYfE/wBQHIF/lKk/JejbNlXtDuEYX/+fh0tz7b9XAZjfCa4sEuBaBRRq3mT9OoaxzNa0yZq+1+skt9gD0EjpFYvZ1LzrRU8aEvyBaiicTQWIn9TC42Pvnmr0XKSzsdIXH+z7z/vzUtpd2Fi5voS33QG+o6LKXl6M9lU1H5B3D9g/M8wGpHXQUlB9E+hrBwT7Wbu7XeeSBIw+Akklun6Rt4zlHGqHAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GKxydEg2ET+0G3pB0MeKyOh+RVSfDqBjAu+4z4fD5Bw=;
 b=BsXMwlQfgueM+2Xo2BS+N1tdDbvvrj2j2zKAGPto9lXOuB5Y6sWawifshoZ4lmcz293mol0i1m72PtDb5PHhVXpFL+yblBcDCcp//y0MA8GpCUwuPlrYmoSR9HWWPTRIjO/vYxxqrg/s63IHZ4CnLMTAQCyx5FGs+tdQIqj/QjG/WORI6ta/1HMMUVzGk31chrK4/l4Z4dIaq4CNP3uZ7qG86HAOYZ+kz7haittaVwflefFrQwYa0M0mLbPf5z4ho552oPNqw7qxdFXX0te5T+MPJftFa56GcgR1IaAac1PsTwBoIbv51BBJ8uL+huT82RKkDyiTlIXPE2NYKPFW3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 CY5PR11MB6343.namprd11.prod.outlook.com (2603:10b6:930:3c::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8632.20; Wed, 9 Apr 2025 07:59:57 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832%6]) with mapi id 15.20.8606.035; Wed, 9 Apr 2025
 07:59:57 +0000
Message-ID: <921a38aa-8a75-4561-b505-14961d9e20b5@intel.com>
Date: Wed, 9 Apr 2025 09:59:50 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] ASoC: soc-component: use dapm->component instead of
 container_of()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <87plhm9h5q.wl-kuninori.morimoto.gx@renesas.com>
 <87o6x69h4y.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
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
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <87o6x69h4y.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0013.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::16) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|CY5PR11MB6343:EE_
X-MS-Office365-Filtering-Correlation-Id: 035506e5-f08a-4a02-ab48-08dd773c84eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MVJJL2RnMlZaR0dSL1htR21XTVcwUlNwNzJaTjBSZ0pPMDlUcEp4cXI3QWhF?=
 =?utf-8?B?cE4wTTkrOVMyc3djbE9iZXRxRlAwUE1lT3ZCMnhzZkR3d2pvNnJseFpuOGlo?=
 =?utf-8?B?RjQwZVJUckd2bW8xY1psUHpFWC9HalovbFp2UlgvYUd0YXlzaEtXd3ZCQkVT?=
 =?utf-8?B?NjNSZEh1UlI0NXBldVV5TGtISjZhUlNJOGpScTEzWEhtdXdXTWxoaUozbHVH?=
 =?utf-8?B?RWlNZkxjbGVhSUw4MmxucGh0ZDZBNDVDZ0JhbUZVWTlNMWhBUngvWHZ5SHFS?=
 =?utf-8?B?c2dyclRuWkRIQmU5NUxLNXFQOG1xNkozZVNab0kwbGFNYWxhR0ZzdFR4dG9a?=
 =?utf-8?B?V2lDWlZuR2hSMmVYN0tPak8rSVNJeURqTWpRVERXNEVLb3dTbUplZjd4b0Uy?=
 =?utf-8?B?clY2OGVoRjJxbElyUVljMGdkSmdOZUVRazM2S0NUeHhlc1VsNjZPNjhiRjBi?=
 =?utf-8?B?M1dpNUZvNVZVYW1SYkRPajh1VjdaNDE3R0Z4Q3A3NTU4RDhLWWRrbDBTQXdv?=
 =?utf-8?B?SU16bXoydjhCQU0zTGRhTFNWR2FRVG82bnFLZDM5ODl0WklHc1VRS1VxYTFY?=
 =?utf-8?B?SXZyclRTMlRTRkg4SEN2ZG5JYUd0VFAvdHJGN3cyd0p5bklONFRoeTN6M1FW?=
 =?utf-8?B?N0ZNcnNxS05LSjBkU2VwV2FhQkpISEdveU9mbnY3RlUxUWpnUmVwWHNXMk9O?=
 =?utf-8?B?ZUxGT1VhU2RleURiQzdzNFVMZEFIcUVidlZGTHJuTkFwcWZzMjlDRHpjeXNS?=
 =?utf-8?B?Y1c1Vm1OSWtGa0Q0SVBXQkpPRkNLM0EwNHNVeDNsK1ZwQUNrYWd5WkFQZXdJ?=
 =?utf-8?B?b1E2Ni85Qm90SGVzS0lQNURLY214aTFCTmU3THFqc0t2aVh2MjBvaXBhZ1BD?=
 =?utf-8?B?RUJBRnd3VGFkZWUrODNCZlhPU0VqbzN0dytpbmhqYmNqcEpnYzZrVlFabGI3?=
 =?utf-8?B?MVk2aDdIQXJtZ1RvamRQcFQyWng4Mm8ra1Z1TnVJUGpQRmsybUx2S3lnWFdh?=
 =?utf-8?B?UG1ENUxzV0MybEozMWQ1aWx2NDh3VDMweG1nQkZPMzJmTWFmZ3p2MzF0VjJW?=
 =?utf-8?B?dm5hQU5OMnhyYWRhdEw5czdCR29ybXAvUk5Jbm5iQkJXVWJsTjNHNFdGSkFr?=
 =?utf-8?B?emtvMDFFS1B3cy9ZSGVLTGpadG5NcG5KUkU5Z3d1T0E3VlNwMU00aUFyS0w5?=
 =?utf-8?B?NzMwR2lDRlNFWVBNejJlOEpGcEVRZkVES0MwWThXNEh2YnhYYitoNmpoYnZS?=
 =?utf-8?B?b2FGZXdjQXhsUkVGRHNReExmNjcxUDR4N3Q4bVJ6K2ZvZTFOSGN1UU9qUGxS?=
 =?utf-8?B?c3lockh3a2M3TU9VRTNrNGNFNC9OeWtSalVUZmxHMDRmTkk1NVRlUC8zbEpL?=
 =?utf-8?B?RGJpazJBYWVicXlyTlFHVVdXTU40OHhSRGNWT09ianFWWFhNNktXeUxlSE9v?=
 =?utf-8?B?dHIyOWFSRDRlbzE4ajJKaWVDYUxEU0hMeGR4UXBIU2t2cHppYWVxUVFOWm9P?=
 =?utf-8?B?M0JhNHRjRXdwcjhsT0RZZTJ3dlBCTXNDZ0NOazlLMTBORnhBVWY4V2hYQkVw?=
 =?utf-8?B?ZVJUZk5aQTZQTTh5MU1zL1ZaWXhMNUl6Y29UaUFwVnpsWE4wRm8yTXJPeXgw?=
 =?utf-8?B?TFlBVFJ2Yml6V0RiNlJCeDdrQmljZWYydmRkU3h3RTBNYXBpVmhtQWY0VmJq?=
 =?utf-8?B?ZXhyYWtXWGhkamJPNHZCOFFZVmt1eVpZMWJSMm90Wmx3RWluVTYraVVFMFNJ?=
 =?utf-8?B?eW13QWRnWXpSMjNFNVFLQXdDckF1WnpqaldrLzYrNDZiazMvbHc2aEFOQy9x?=
 =?utf-8?B?dXE0b3VBWmlLMUU4cTIrVDJKWWJYbG1FKzlZQVVnbThndnFrL1UxSndCTytM?=
 =?utf-8?Q?vIZpcQvWGiUVC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MUZ6eXI5anEwMmxiSks2M01SYTlvSlpqSkVBMDZiWmZlWXArRHpaOVAvZ1BC?=
 =?utf-8?B?NVJJZjFBSzhuWlBzYi9QMy9hTVl5K2lEc1I4LzlhaHBMMHRhazhkRXFpSGlM?=
 =?utf-8?B?SXpYaDNUNmtHYzg3RkZPZGxES2YzQUFRMzZPSGxmN3kvdzRhNGRtbWpJcEN3?=
 =?utf-8?B?YlNRTGczNkdCSnBNSFd1cmN4YmdNSzFUYTkzcVNBekVxTGVZcVFLUEc0TWNt?=
 =?utf-8?B?d2dpSnNOWVlPT3lvMHFJSXZIQVJhMGZCMkFWZGZVenJSdEthYUtnNzhSb0U5?=
 =?utf-8?B?L2tzMXhneHdKYlRJck40N0UxS1Q0TWt2K0JoOWxRSkYyMElVVDRlbFFUUTBK?=
 =?utf-8?B?cUxacVFJWGlBMm9pc2VtR2l1ZDVYMVNPY0dqa25LYjVOa1Y3MzJRZWhTOGNn?=
 =?utf-8?B?SXpOSmk1NDloblpRWFo0ODNuUmZHaXdVeHd2MHdSZXFmOXZOeGFFRXpTNXdy?=
 =?utf-8?B?aUszbWx6T0FTUWdENFlMZnM3U0ZzT0RlRktmcFpPUUxIWENRSkdvUHdOdTlO?=
 =?utf-8?B?Y1hTbHIwUUdMSnZSdmhVendHdEk5VVVmamlQTE9nWW9rd0NDenlXcEJ4ckpY?=
 =?utf-8?B?MG5xR2V6TVpYWUJPd2M2SFJMa3JQVDRvUlRsdGllU2hlejZpU1R1cjkzSkR4?=
 =?utf-8?B?MW1VbTBJNk1zaWlxM2ljT01vTzIzWWY5OXVwV01sVkVLZUhBWVJud25DeTIv?=
 =?utf-8?B?SCtTT2Ntd2t0MGs2citETyt1S3NZWUdYQ29Oemx0OGVOdlF5SjJ5ZlFnSWky?=
 =?utf-8?B?a2hRSVBGb2RsVi9LbEpOTVVIcjFkak90RUVZN0Y2dGVXNXovdUF3M0tYbC90?=
 =?utf-8?B?L01ZeWhQZjdiS3F4VW5ORHZjUVBMUGZUa2pSb3Nnby9rRlMrcFZ4U3A5aDZQ?=
 =?utf-8?B?QUpwNi9EejVhSlltRk1tU0ZHSEp6emVISWx2aWNRRWpRcytQdlN3UG9MQUNn?=
 =?utf-8?B?REVHcnlWbzcySm1PeGpuZWpLVzVLRG45VGVrWExDMW1aZndTaGxnUE5YMGJI?=
 =?utf-8?B?bERuazhucWNUeEI4UmFMY1RoMVNVYXZ1aWlpb1hwanJvcVZ6KzRoT09ITXFY?=
 =?utf-8?B?U0JhTDMxYVBPZW1QeWpUR1cyek4wczFJZWt2YytjQ3c4VTJoT2RvMCtZeGFN?=
 =?utf-8?B?N2dKbnh4SCszWDJrWm9KdWFDTUc5LzcwZ3JFZXNwdkZBQ3NFZGhObnBQbTYy?=
 =?utf-8?B?bjNZT3dlSHpQK3pLKy82QlErYjBzTi96RS9kS1JzaVdNNzFRL3dpcitMV3g2?=
 =?utf-8?B?MzA5b2kwY3Z1Z3I2akpIbTZkUGhnZXlkVXdoNzhOSlFlRS8yRHhSSHJoR01v?=
 =?utf-8?B?bC9EYnVwTmRJRm8wUDdTckZzVE9DcklUSlJIMVFKRmY3cFYxU2JFZUd6OC9x?=
 =?utf-8?B?OWJQN093MnVsaTF0a3B0Nm1Fcm9WanVrMGdiZXN5bVI4emFXNk1pMGtqRnI3?=
 =?utf-8?B?eUZGSEh0RjFkVWpLaEpSQnhiNFRqcnlkWFVpdytVRUFuVnlPK2VLZWJjU09a?=
 =?utf-8?B?Uk94OFltUklLencwR1hRUTJyNDJ3NUYyK2F2djNZNnpoTzIvVlRNYVVJYUs1?=
 =?utf-8?B?UUxrekdRdGN1Wld6WktnTy82MjVnOEc4djlYaTEwWHh5R0xFYWlGSnFITG0v?=
 =?utf-8?B?NDdzdlYzbi9nZmhIN0I4bnpWaXdjUTNTZkRlT3psRktuZ3dmWjcyTFdrRURN?=
 =?utf-8?B?enNnUjhNNmpUNFVyRVgxSktPbzAzVnkvTXJsQjk3RGtmUVpwMkJmaVU4NlJQ?=
 =?utf-8?B?RXR0emtBVk9VcUJiVkZQQzZYQ1U3bWpWMFpRNjk4a2k2TXRsZmh2VEx6aUNN?=
 =?utf-8?B?Z1Z0dGlSVXVFL3NDN3dDVXRVVWx6SVlUR3UwelYxRHR4WnI1MVFCUW1RUWhD?=
 =?utf-8?B?MStIU2QyczJjY2pYMkV6VVhsUC9kV0g0Z0Yrd1puVVBkMEdXc1ZLaEVXUWpU?=
 =?utf-8?B?aDF6NTRNa3RBSHNoYlY2YXozbU1tNnEyTnZodDNHc3Zsd05lRUorTUtjNXl2?=
 =?utf-8?B?M0E2eXdYK2l5MDRobWlXU0ZzQzQvOVk2bVJISzZ5SGl5N3BQM1RucFYzd3pH?=
 =?utf-8?B?VEgxQWtYcytiM0o5QWNlRGpPK1FmRXBTRitVTk1hMUt5SXBuamtNaVc5N0JH?=
 =?utf-8?B?WW5BOEY1WU9iU0REdlFCRzYvMmdPM1R0TjZKQ0ZsanlTc0tna0o4cmZhTDcy?=
 =?utf-8?B?OVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 035506e5-f08a-4a02-ab48-08dd773c84eb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 07:59:56.9661
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1iL7TEVpRRs2R9YZSsC7rORoa92Bi85fRuratDPZulH6Q6/cThIsva3lDmebj/2zOjbkAePScmfpDhpLR318uSt6sRL1zs5rY7/fXb/ljYw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6343
X-OriginatorOrg: intel.com

On 2025-04-09 4:57 AM, Kuninori Morimoto wrote:
> Now, snd_soc_dapm_to_component() (A) will convert dapm to component by
> container_of() (a).
> 
> (A)	static inline struct snd_soc_component *snd_soc_dapm_to_component(
> 		struct snd_soc_dapm_context *dapm)
> 	{
> (a)		return container_of(dapm, struct snd_soc_component, dapm);
> 	}
> 
> Because (a) uses container_of(), dapm of component works, but
> dapm of others will be "unknown" pointer (= not NULL).
> 
> OTOH, we will call snd_soc_dapm_init() (X) to initialize dapm, and
> it will be called from snd_soc_bind_card() (p) or
> soc_probe_component() (q) with pointer (component/NULL).
> 
> (p)	static int snd_soc_bind_card(...)
> 	{
> 		...
> (X)		snd_soc_dapm_init(..., NULL);
> 		...                    ^^^^
> 	}
> 
> (q)	static int soc_probe_component(...)
> 	{
> 		...
> (X)		snd_soc_dapm_init(, component);
> 		...                 ^^^^^^^^^
> 	}
> 
> And snd_soc_dapm_init() (X) will fill dapm->component (x)
> 
> (X)	void snd_soc_dapm_init(..., component, ...)
> 	{
> 		...
> (x)		dapm->component	= component;
> 		...
> 	}
> 
> We can simply use dapm->component in snd_soc_dapm_to_component() (A).
> In this case, dapm of others (p) will be just NULL.
> 
> Use dapm->component instead of container_of().
> The picky note can be removed by this patch.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Cc: Benjamin Bara <benjamin.bara@skidata.com>
> ---
>   include/sound/soc-component.h | 6 +-----
>   1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
> index 61534ac0edd1..63928773df32 100644
> --- a/include/sound/soc-component.h
> +++ b/include/sound/soc-component.h
> @@ -265,15 +265,11 @@ struct snd_soc_component {
>    * snd_soc_dapm_to_component() - Casts a DAPM context to the component it is
>    *  embedded in
>    * @dapm: The DAPM context to cast to the component
> - *
> - * This function must only be used on DAPM contexts that are known to be part of
> - * a component (e.g. in a component driver). Otherwise the behavior is
> - * undefined.
>    */
>   static inline struct snd_soc_component *snd_soc_dapm_to_component(
>   	struct snd_soc_dapm_context *dapm)
>   {
> -	return container_of(dapm, struct snd_soc_component, dapm);
> +	return dapm->component;
>   }
>   
>   /**

Why not drop the wrapper all along? Personally, I find assignment 'comp 
= dapm->component' more readable than the wrapper above. We have very 
long prefixes in sound/soc/ in general, and the devs end up reaching 
char line-limits.

I'd rather focus on 'struct snd_soc_dapm_context' exclusively. A valid 
pointer to this type is required for many functions found in 
include/sound/ yet the struct is more of framework-internal entity. 
Strict separation between dapm-context "for the framework" from 
dapm-context "for the user" would grant better readability benefits.

Kind regards,
Czarek
