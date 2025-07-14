Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30DAD72600
	for <linux-sound@vger.kernel.org>; Mon, 14 Jul 2025 08:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752482468; cv=fail; b=nxHpwFslHncmssoYyXrpqoPwsHERc3SOXjlgD+zvgZpyrj/GMbt09GqtQcIies6Ajv87WIRT2HDnPmdZFEmA7dDxS5nmC/bpk6yXR8hvFnVwKA8o/0wWGBr3Iex/K1gPAh3TbFqn6QeqEinyZ6+bRsct7N7j96JPhNIglXfPsFo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752482468; c=relaxed/simple;
	bh=OE1IjevRS+P+VX7GQS5JnWnQzs59sknhDCs0odFI7e8=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rb4XTNPatR5Gge3lusjGwvQhwXy+Ujs4KB1Z5lZBL2KLUo3ysI+tyDqUSftlCZRDZOGlqZ8J3PLzvw1NVTRchK3aw14scoeKIb5lcvHUMJ1f6j3Y8KLiDYgAjXGC5XugwP6CBSan2rJODw77F1nAP3mqUXlVoQ90/AboGtd8ynA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iQuTP43N; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iQuTP43N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752482466; x=1784018466;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=OE1IjevRS+P+VX7GQS5JnWnQzs59sknhDCs0odFI7e8=;
  b=iQuTP43N0xVP8sfxi6WkbWZg70nlD9WO3VydBuDCe/Xwcs2xgOlvbnx9
   OYERutVdTkIyj6TADg7JIpbjuW8ikkXZK8QBeJ5J7enG0mPsPYT4CkJdw
   4IxEVaLV0jkTZXQXOQiiZ/Dg8AKaErKFy9ne/IPZUAO0qNSddj8qS/bNu
   p0fkOnrXOxgUMuBGCR1p2m7ukXdxyqECkEKi0gK+xNxYAzLPUgEa5kWn0
   fnhvzdnmnM7ugGNKniWvn0TpvVLFks+w0dp82yNKUEaH28316A4HjRRhs
   shtj3Bzk421KxdHGCJStciBZiGAoatlwdCLsfANXRWsZe2TXqD42Mu3mh
   Q==;
X-CSE-ConnectionGUID: NFdBo9OGRli0sGGWEf/Ong==
X-CSE-MsgGUID: rYrfVuDCRMCjQKPqlNgzMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="58435022"
X-IronPort-AV: E=Sophos;i="6.16,310,1744095600"; 
   d="scan'208";a="58435022"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 01:40:54 -0700
X-CSE-ConnectionGUID: Yp0QU0wDTi+nXBKh97kjtg==
X-CSE-MsgGUID: RzVEAFe+RMqg6+SFBdfrug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,310,1744095600"; 
   d="scan'208";a="156297967"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 01:40:54 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 01:40:53 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 14 Jul 2025 01:40:53 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.53) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 01:40:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=osicIC2pMk30w5+edAi52JiTiLpYks9OVu3v3/jjpb3wtsQB5IZIjDQ7wwcZXtAFaHC7CUswaR287kAElXGAUM/vw78RQRaUjXjaIBeslzKkJTFvJsgRp5C9sm2XS8ekRbVPtRdCuhHDE8ZT6YLXxOxSsmXhI0n3RKI7pI32Nc59KRmSTDsxMyUtoUOm5Omb12sDdRDCrBrUUXjB5fz3Urzq/w3ZmMK0VNsmIn/6J+o1+syRDPGXfUIFXHFUqJ9NbWqTDGdxIi8gVccvHEV+9sD87+Qfa/1Z4qlhTZH9JJAGIqk9hXnuhHLIH5V2jrkliOGiHZ2rHPKmlCSfvjwpEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=txIR3/r5hTkxUoy4YcLM9jIQg3EB08Eqt9bEP920obA=;
 b=vxs+2hNQPFpz1YTTJMsn5fKgIneJQNEIMorhDRK9FlaPwKOeUgubaRLM6TROnD+usH+uoc4LL/3TYS2+JIRgqX3QlIMeEK2oauO9camKUawYolgp5y0R3i6D/POtluXlWRRyeIq9nIj9Wi+6TS2cAz68mtOW1hgESOlL9wrBLmvrlFSs21FbzS0H568JwwfnJaU0qgMzoetyO8whJ49JIsQ2l+6FKIljy4RJpinXOSHlbdlZ3thA1D+5CO8fFBnDNRTnCRN1hZ5vss6+cQZGy4cn3TNkjo3MGyW+rGBr72bWOZODkHWE7d81kaUuHZJ7+wlW0CUXB5ZiT9oPX8TrlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8283.namprd11.prod.outlook.com (2603:10b6:806:26c::16)
 by PH7PR11MB7097.namprd11.prod.outlook.com (2603:10b6:510:20c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Mon, 14 Jul
 2025 08:40:37 +0000
Received: from SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::3:e0a:87af:d4b6]) by SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::3:e0a:87af:d4b6%6]) with mapi id 15.20.8835.027; Mon, 14 Jul 2025
 08:40:36 +0000
Message-ID: <8e7535ff-323a-48e8-9c70-8bb6fabddd4b@intel.com>
Date: Mon, 14 Jul 2025 10:40:09 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/27] ALSA: hda: Move widget capability macros into
 hdaudio.h
To: Takashi Iwai <tiwai@suse.de>, <linux-sound@vger.kernel.org>
CC: Richard Fitzgerald <rf@opensource.cirrus.com>, Kailang
	<kailang@realtek.com>, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	=?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
	<amadeuszx.slawinski@linux.intel.com>, <patches@opensource.cirrus.com>,
	Baojun Xu <baojun.xu@ti.com>, bo liu <bo.liu@senarytech.com>
References: <20250709160434.1859-1-tiwai@suse.de>
 <20250709160434.1859-2-tiwai@suse.de>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20250709160434.1859-2-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0102CA0040.eurprd01.prod.exchangelabs.com
 (2603:10a6:803::17) To SN7PR11MB8283.namprd11.prod.outlook.com
 (2603:10b6:806:26c::16)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8283:EE_|PH7PR11MB7097:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a94c22b-e261-49da-3e42-08ddc2b21ac4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d3VYUVBGUXpqaXpJZmxIamUwMVVSL1BGQ1NkbmozOHJybVFIUU1HR0JtYXBq?=
 =?utf-8?B?NzdQMlNjc082c2Y3SkpoSVJQK3JpOTJuMU0wdzdyREdORHdSbVpXYUtqRGww?=
 =?utf-8?B?RDk1RkVMTHY0RVRxc3FxbThDVW1TaUZzbGtiZTcyUFkxNkhxVk9xYTVubEtL?=
 =?utf-8?B?cTBmZmdSaDZrSWhJREFmV3MwSFVlVXFqUnRxZ1ZkZ3Eva1ZvVXBLYjdsWmF3?=
 =?utf-8?B?T0czR3hNWnk5N2d0WFVFSnp3b255Q0Vpdy9RS3hCNmwxMnpYeHpCbXJ5WjNQ?=
 =?utf-8?B?L2Y5QkxuUFdSRGVJenI2M0MzcTFCeWtpMVMrR1hqY0NSekJPTG5KSlhtRDIw?=
 =?utf-8?B?ODJrSlp4bGZPOHJ2MGZ6M1ltMVUxdzlyQWI2VzMxYS9LOHJ5MWp3eXNSRVow?=
 =?utf-8?B?azN1dEJCN1BRR2VFWEVIbG1WSjhWblRLbGMyMDRwQVdVZ2EwUEdPU2ZnckNa?=
 =?utf-8?B?Y1dWYWhQd0V5UjhsdTlGeExIRkppRlowRU1WWnU0c3ZzR0FPakg3Z1YvL2s1?=
 =?utf-8?B?c0ZCSTd6V2ljMXp1ekV3ZWRjQkZMbkxBN2VmUXVib29udWJhcEFGVUgyTklv?=
 =?utf-8?B?QTlVdzdVeVdMaVNubm0vY2IwSStvbURkenR0T3o2dnM3a0dEdTFYZVFIQzA5?=
 =?utf-8?B?MlRxRVJQWHp6WGVuSVpLSnVvWXBTTVhCRzdtZkJQNGxmYWpSSXFaV0RmNy9J?=
 =?utf-8?B?a01nQkFnNStES2RtZWhSY2VPZDRwVVliTTlOOTBOY1lYbFZMRmhhM0NLM0Fp?=
 =?utf-8?B?Qy9oUHdxTmVLMDBFWWRPampNNG9mVE9RdEY3MUJFaGJsMnYzeDlYZ0kyQ09k?=
 =?utf-8?B?dXVxblpYN1ZpSnNIRW1qTmoyU0NjNnZXYkNtOE1YT2RUZW1QMGZ2K1lmTEVS?=
 =?utf-8?B?Yk1QZDE1RVZiU1RMNUhhWm1UanNVWmJtaVRERDhHMk8wQ2l3RSs2MWZSZEov?=
 =?utf-8?B?UEdhOW9HMWNtTktHYkwxaWgyakl3NkZFN08zNlFuZXhtUTZ6R0s3QUlnWlBi?=
 =?utf-8?B?R0dPZ2lQbGNOMkpXalpheWFhWjFJY1pMdjgrK21SdGVPekYzNExlbnRJbnJO?=
 =?utf-8?B?eG9PMkhPaVNiNUcxSld3NlBXOE9vejhFTDd5RzYrZnFKK3ljVTNJMVpMd1FX?=
 =?utf-8?B?d1BzOGNzT2VzYUtyNjJLZFFHVnI3ZStpaXRFQk1nMVhMaXd5bzIrNUtOL1hI?=
 =?utf-8?B?NWJTLzJEdTZHdW9mbUtUc0lacXorSDB5aU05NzVpS29kd0tWRlhER0RHb0dw?=
 =?utf-8?B?emJOMzUrdmd6c2hDUWlpQ3M1OTZYd0NqcndPMGhIKzY4SlhFcjFCUENBVFlz?=
 =?utf-8?B?RzRRV2lqRVJuY0FRRFVxL2RwbzdMN3J6NnlGakFNS3ZQOFpUOGU0ZU5ka1BJ?=
 =?utf-8?B?UmxqK3hyY2hNYTdDbDY3aVovZnFQTWEwMkszQ1pMQXQzLzlVVlljWDh6LzBk?=
 =?utf-8?B?aVEwMDFXTkN2c0xRSVhQOUg4ZUdhdDAxeTVxWWRLRDZlQVQrNmR1bi9pQWY3?=
 =?utf-8?B?NG00bitTa0xyaE9jcVZMTW4xb0w4TE1KYSttU3FxMm5QUE5YZ0JqYjR1TmNz?=
 =?utf-8?B?azZ6dkg3N0ZEK2lIaUplRlloM2hIejdsU0VXVjVVaFlTWjJoL2RCUno2Slpl?=
 =?utf-8?B?UVNrVmVRT2owVEgyem50WGtmaDFGSXBlY1REM3J0cjdhenJCb1Z3ZjZyWWFr?=
 =?utf-8?B?OE51eWl6MEYyZjUwT1BDUDRCODF1dGNBZWJmdXU1VWkzeXFhMm03RE5aTGFO?=
 =?utf-8?B?YUpkN0EvOERsV0JRSkZGTjBpOWhCT3F2V3IxNzFwSWxaS1Bjc3pqVVduQVpT?=
 =?utf-8?B?TTNpa3dhelBCZGhQWkdmZHhRWlN1eEJOM0dtNWhWalZMY200cGZtejZsOVlC?=
 =?utf-8?B?eHFsNnRJVi8vYTkySFVpRk1aYm1iaVlaRW5MdlpmandzRWlhQS9VQ1doTERE?=
 =?utf-8?Q?s4P793LIznU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RjZIL1Frc3l1ajRucUh5NEZCNGpwaDVFaVdWQTdoYkFPNWNZWE9WYXR1cEky?=
 =?utf-8?B?V083Wk5sUVNSZUNhZGpRY2J4YTdyeTg5WXdsK0NaZzVzVkpOamhlUWEvUGVv?=
 =?utf-8?B?UWxIckpiUUtPWUl0N2w2eXpub3FjM2hNbDJHZU90b0R5dElGZFJILzRkb0xQ?=
 =?utf-8?B?TmxFRTNsRmNPeXd2WUtQclhvRDc4c0VpOHVvMkRRTEJramhmZjFNcGErcmRx?=
 =?utf-8?B?VG11Q3ZXMG5vYndmazJ5REgvTzBKZXJHUm43aW5ZV3lGSlIzbi9FVmNNeHB1?=
 =?utf-8?B?YW5ldzZUVjdRVWtDS21ZeVJ4RUQ2K3JDZTVBUmZBUTVpN205SFZPVGNzeUNo?=
 =?utf-8?B?TXRJUW5tanF3dG5VYVB4ZnFnZXJvb2JXcnVLd2RWbXhUSlFBZ3poMm5TMW95?=
 =?utf-8?B?ZjNpM0dtdWRXM0poMXJPaStNdGYyWjRKUHBtYjA0M1JpZHJhOGpweXREWnNn?=
 =?utf-8?B?TTZHZXpyRkhMVURJc2o5OTMyWUtwdnBOWW0rN0ZnczJGUTBzUFgyTE5XTFR1?=
 =?utf-8?B?WFFmV0hqR3FEcUozeE5BcHYzRUx2RkdmQVI5cnRFVjlYdUtPTXFLVVZmc0NQ?=
 =?utf-8?B?USswY2g3a3M4SXd2Y0tRSGJLMld2dFplbWQwY05HUUNtd3FyeVdaYzZYZzRO?=
 =?utf-8?B?WjM1eGF1UWtBd2lObW5uVFI0am5PNXVTRk91RFZDZlRvSlBHS0s2Ym9oK21P?=
 =?utf-8?B?TlJnWEdVakhzUkM2bDlUa1YrMXVNdTl2S1hRemU5WktFUStRZVRxa0p4UEpQ?=
 =?utf-8?B?OEtQOE9PeXNZWDNsS25KUVA5dEEyUCtMcUlPMWJQVE80RVQyMVBKaFZqTzZP?=
 =?utf-8?B?MWRCb0pjdEk5am1HdTZqWGNvbWp0aHNRa0QzTFUwaFJlNUVOTFUrdGhTelZR?=
 =?utf-8?B?NVNLYnRSeE05OExHdU1WUGxrTUszSnM4SElkSkh2QjRCb1ZvaEhKaEVaUVo3?=
 =?utf-8?B?SjVMbWRqZWRzYmxPQXR6R1NBdW4xMEhySW1lWk5XUDlDMndrbmFGalAxMzlq?=
 =?utf-8?B?UEVMV3BYL3lBazFBTUhIRmdYRkxQckdQd0RzV0U1cWNZcjdvTDNmOW5zclJo?=
 =?utf-8?B?TGo1ZUgzb2lGblpZdytGQTR5bjJHQk5acThHREo0VUREaENERXVQRTMzNEFN?=
 =?utf-8?B?NnZvYmRkZEZadVdLQ1Vqa1B1MldmWHl5cjRNOFUzUmFxdlYwOHRBdElpaHRs?=
 =?utf-8?B?NVd1WC9SUXFoTXVxKzJYMWtDblc0V0xKdlVHZ1UxTmFpVzVBelQvYWZ5bXN6?=
 =?utf-8?B?OUtVTVRnbmwwS1gwa3ZOTjQxT1BwdlRHakVuL3ppejNTdEZsUVNseGgzQWtL?=
 =?utf-8?B?NXhGeVRPNmNOWFBUclBQTnZrZHcyN3gyZHdlV3hRZnFsZUVoRlR0WWxrK2tz?=
 =?utf-8?B?WE5IdHpGbDVDTVp3L2JPZ1RGa043MTVTNWtjYVVUNlBkSWdoWkx4bXJBUTI3?=
 =?utf-8?B?RStEVnpOWXlXUUpTTTZ1eDVQRUdvY3lVSnpwN0NjR2x3emFoUGtXZCtpcXlS?=
 =?utf-8?B?UXpVMmJTRnIwMVd1QSthczBVcE1rMXFEWjFRbDdXZjJuWWo5eDI1cHRsYTNJ?=
 =?utf-8?B?YVFPVUZjMm5JT3RvckVQMzdHclFqOGJxajJCeXZrTVJMR1NBZFFZbE10VHNt?=
 =?utf-8?B?c3R6ZnhyRE5Bc09KUkx4Z2NpL0I1YnNtQTVTV016cUNFUk00Ty9jdVVlZTN3?=
 =?utf-8?B?WjhKM0NhK1hKanR4UjFBS2NYaUFPL0prZXVPUzUwWldTOWx6aGFjREVyWHdZ?=
 =?utf-8?B?WjNuOWJDSUc4bUFlRjlLVHZFU0p5bHNqVUpxb0l1elNNTlZLVm96YzNmYzc4?=
 =?utf-8?B?dUhUdk1UcTZJOEJxdEdNcGNjNTVqbzJDUXZWUXNlSGt2NHJaUFJDUFZmVkRo?=
 =?utf-8?B?RExSZk1mVFhDSk40ZUtYRFpENEkxcXd5dU12SjNSNUhoWEI1OGxZNkJhb2kw?=
 =?utf-8?B?c3J1aXpzVGcwYk9pbjZHZDVNZ2s0cmdFb2J2bTI2ZDZqYjE3Um1oT09XQ2du?=
 =?utf-8?B?S3huaytKUzAxTDRBVThpdXEyQTNoNUF5amxpckYvODZLUzVCeEl1RnFwaXRP?=
 =?utf-8?B?dktKZElzbzF4eUluSzhrUlcyV3J1Y0RFVzZYWjU2N01sQ3NFSDNpT0tPWDRt?=
 =?utf-8?B?N0hvUnF0ZnpCbGJVSGlyZDhNUFI5SW9nSTgvcUVxMDV3RjlqcU56OVF3Tmcw?=
 =?utf-8?B?R2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a94c22b-e261-49da-3e42-08ddc2b21ac4
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 08:40:36.7791
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0zbd4IoyBX6s3KaXZ+j2w+8krMBEzWb2y0VqvPXiMoznLsIHwxpaI5MslFCcU7qElXtfsj76Vtr9BkFael38Had9N862UOeokIIyiEmHWQs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7097
X-OriginatorOrg: intel.com

On 2025-07-09 6:04 PM, Takashi Iwai wrote:
> The get_wcaps() and co are used not only by HD-audio core but also

What is 'co'? Meaning get_wpacs() and friends?

> other driver code, hence it'd be better to put into the common header
> instead of local.h.
> 
> OTOH, there are macros of the same name like get_wcaps() that are
> still used in sound/pci/hda/* locally, and those conflict with each
> other.  So we need to rename get_wcaps() (to be moved from hda-core)
> with the proper snd_hdac prefix for avoiding name conflicts, and
> define in the common hdaudio.h.

No problems found, just some nitpicks.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>

> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>   include/sound/hdaudio.h      | 24 ++++++++++++++++++++++++
>   sound/hda/hdac_device.c      |  8 ++++----
>   sound/hda/hdac_sysfs.c       | 14 +++++++-------
>   sound/hda/local.h            | 21 ---------------------
>   sound/soc/codecs/hdac_hdmi.c | 21 ++++++++++-----------
>   5 files changed, 45 insertions(+), 43 deletions(-)
> 
> diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
> index 25668eee65cf..d38234f8fe44 100644
> --- a/include/sound/hdaudio.h
> +++ b/include/sound/hdaudio.h
> @@ -680,6 +680,30 @@ static inline void snd_hdac_dsp_cleanup(struct hdac_stream *azx_dev,
>   }
>   #endif /* CONFIG_SND_HDA_DSP_LOADER */
>   
> +/*
> + * Easy macros for widget capabilities
> + */

Nitpick: there is just one macro here.

TBH perhaps there is a better location for it - where all 
snd_hdac_read_parm() could lie - but that's probably a subject for a 
different tale.

> +#define snd_hdac_get_wcaps(codec, nid) \
> +	snd_hdac_read_parm(codec, nid, AC_PAR_AUDIO_WIDGET_CAP)

In future wording for "parameter" could also be streamlined. Typically I 
see 'param' in the code. "parm" is more of an outlier.

> +
> +/* get the widget type from widget capability bits */
> +static inline int snd_hdac_get_wcaps_type(unsigned int wcaps)
> +{
> +	if (!wcaps)
> +		return -1; /* invalid type */
> +	return (wcaps & AC_WCAP_TYPE) >> AC_WCAP_TYPE_SHIFT;
> +}
> +
> +/* get the number of supported channels */
> +static inline unsigned int snd_hdac_get_wcaps_channels(u32 wcaps)
> +{
> +	unsigned int chans;
> +
> +	chans = (wcaps & AC_WCAP_CHAN_CNT_EXT) >> 13;
> +	chans = (chans + 1) * 2;
> +
> +	return chans;
> +}
