Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C768222565;
	Wed, 28 Jan 2026 10:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769595515; cv=fail; b=P6sY8Lj8W5yVtinsfEkhQzeQu2xkd7NRx98OYvDPCK0jsY8dliDjl5kWWtwMbngbWeDOlqMMHo6eAXvOr+SGdIXhTWsVL6QbPze0WwUZqGMUYQcId+IsbOJigETiEM1joskpLT+GfYK0D5vcO2lU/8VRqK51B0N2YDP58wZj/S8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769595515; c=relaxed/simple;
	bh=bfex/Dg/XukkTtCCY/jf9qPZqt0DCssQJPodJz8o+kk=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=s/qZ7YF8GSdJ2wQM1Z7YW3M4IDslHQWebYtciG7XwTkkGo4zeuFjqviONdf5gdbNooVRu1tk+0MIBOyUPDq+LBQexI2crd8xy21m5aKCWkpqWwUJdvynmy26pvsiZfUfRN3UCvm1sP5vinddEiSvr/dI9dBUxY4MLyjZLFuDKlo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oc25IahC; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oc25IahC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769595513; x=1801131513;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=bfex/Dg/XukkTtCCY/jf9qPZqt0DCssQJPodJz8o+kk=;
  b=Oc25IahCmePWGQIdymjXsU76vNnhMWHHSNF+RIXcCbDCYVehmpxkgR5/
   ehTbEgivR795O3AnU0D2CHVPqrlfBuHDBeVWLi+7niuPEcBDs3o5ASU/S
   anPv3+aBCkYv7OM/bXHfphSGqeUfRGcrT2RCnYOFOAAjt9YFggZhdPA7S
   ItPFQS2TbFw1gb7uv3rPwQhvdFbKUailXP03fg5mxhzkBkm2J5xy+I1iR
   a2mtT1WDKaFdrxf1jMtStMQR36Mp+OgXuo8zIR7lgTAewpNZh5Ule25PH
   3GWxb40gGaSIkRaHQrjBiG++vuoB6ckoG4ms/Lq3OfOUGf/Wud6zWuUnl
   A==;
X-CSE-ConnectionGUID: Zeg1atyHSDiolz6yKY7HKw==
X-CSE-MsgGUID: IRk2ml2bQy2aS3dsUxYfWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70893321"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="70893321"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 02:18:33 -0800
X-CSE-ConnectionGUID: 2AAvN21LR1Sc1Z0/jmtN+w==
X-CSE-MsgGUID: oC04frUVRfW29Jy3GoipyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="208019754"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 02:18:33 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 02:18:32 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 28 Jan 2026 02:18:31 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.29) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 02:18:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KlafC5R5OFhqv6unM7usFFO9gV1ctWhegEqX1V2QRmKa4JGk4J936K/mGwIM9vUTg8yihrIfIAMxcAST4e30/2DpNKasuqMMDH0upEnXRpxjHnYPiEyNqopLYAonBCRDPLGFlxO8RCwcPvwiyX+ii7yBdLf5yV5kWiYp1WODh+TXVpO5UOhu+soxV5ApPITvO9BAn8fjrsKQt/EoLrB+aAZLHPdynG6jQNDpnl7hMevdxY/vkUhL8juUt8pw8b/ACyJnUYI5XrmkRwaedJiCQ5vpsfaKAAY9WOlyacKviPz3zmXHcJkiM0DrXkE80ldlgee7gh37wC+Mk25U+xkIfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HXIWI3LYvfk7k10ufCfykTGjxwv3/mdkkdIL/K963hk=;
 b=MUG1yeLAIiOv1KoBUQZkXrD6SVbAUECdtv4zi0OMCJvjdNXu02pkRoei87gMJ85NZMG/xNAAUfM5iVyj4krWHGGi3YOCuv9CkpbBYNLwhinFueuaJvVLQ2x3nMi/bld3+PmtfOc1wbF+W8dyvj3R2pKCB1RAld3lt+ekZ9jnFDldhV2ruLrWOLCPpzNUsC3WNGvpxhXozX2HJc+flY/wLCH8BvoGfYPwoDV1pOz4dReEm6hGpq9eQDtl0npemYXUVFxHErQaG6ZdeTKlKvy5+i7IKIyXqmhythwIosLHBx6Xx2iUpBs0syvsNVhAAZE+KEKxjUg3uYh4UZqCf0QhHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8283.namprd11.prod.outlook.com (2603:10b6:806:26c::16)
 by PH0PR11MB4853.namprd11.prod.outlook.com (2603:10b6:510:40::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 28 Jan
 2026 10:18:30 +0000
Received: from SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214]) by SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214%4]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 10:18:29 +0000
Message-ID: <daab0849-753d-4917-a76b-c59e9fe1f6bd@intel.com>
Date: Wed, 28 Jan 2026 11:18:23 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: sof_sdw: Add a quirk for Lenovo laptop using
 sidecar amps with cs42l43
To: Maciej Strozek <mstrozek@opensource.cirrus.com>
CC: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Jaroslav Kysela <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>, <linux-kernel@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <patches@opensource.cirrus.com>, Liam Girdwood
	<liam.r.girdwood@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Mark Brown <broonie@kernel.org>
References: <20260128092410.1540583-1-mstrozek@opensource.cirrus.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260128092410.1540583-1-mstrozek@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0439.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:81::23) To SN7PR11MB8283.namprd11.prod.outlook.com
 (2603:10b6:806:26c::16)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8283:EE_|PH0PR11MB4853:EE_
X-MS-Office365-Filtering-Correlation-Id: 2125b7d1-1a7c-4484-684e-08de5e569523
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SGNLVVdmTkVnVmlxc0RHQnJWMXMvLzFoZGNHZGc1SW52ZHVramFRdVlVbjAz?=
 =?utf-8?B?UkNlazZrMlJhRHduMzlWR1MwZXpTb2svaXZxQzBMRGZMaGl5a1VsYlJ0WEFw?=
 =?utf-8?B?UFdXaFp4YSszWS9GU1RROWZ6UDRoZGNiMm5pYnVSTVl3VXg4V3FXUW9mdnZu?=
 =?utf-8?B?U2hGR0s5azZ5RjJZbUFoNU4vRUd5dUJyMkpLcWJ2cGdkYjR3RjlIV2xxY1Vj?=
 =?utf-8?B?aXpIdDBuRmxVUFhOQUw5bjJVaGJNbmtWRUd1VVowQUU4RW5MWTlrWmV5VGhW?=
 =?utf-8?B?N3pMeEFtV3loZTRmQTN2S1M2dGEreVA3dlpKRGUrbjMzUWdUVHY0dnBwY2hT?=
 =?utf-8?B?NDJhaWhSQzJrNGVaZGlxaHB6MzNyWTZ5L1J0Q0t0R3grRDd6ckVFeGNwbjNl?=
 =?utf-8?B?T0NPLzlTZXo5T291T1lGVG5XMlZZQmNBdGg4d2RkZjYvVGpSaWUxakVQRVNZ?=
 =?utf-8?B?YXEyOGVTclRnL24wS2dDclRIQmVUNVlxYndnbFVneUJkZVRkRDdBeko0Q1JH?=
 =?utf-8?B?Y0FzblNWTkNmelY4Y1M0eWZxWmN6ajhXTDNaWCtjY2xuYWRrT2E1L2lCd1h4?=
 =?utf-8?B?dXdVTmZzZ1ZDMmpiazJ0QlZ4eTZXeU1naERISCt0ckRCTXM1QkRUU0RUZVVu?=
 =?utf-8?B?VjB0MXhSTnhtTWlLV1BDS2FZNkJtdlBnaFBROTNLL0ZWcDRRaTkvZWtoRzQv?=
 =?utf-8?B?VXZlOHVEOWhsR2xhdmtIdUUyREJldmtzSnozRHV5Yzc0SWlwOVpFZVdDanJ2?=
 =?utf-8?B?NkRrQmh2YW40dU5pWXo1MTBqcGtJSG9BSUNlSGZ0NU1qbmtkOHREMjdsSWdK?=
 =?utf-8?B?SEpmOUVPTGI5RW1UQ0tEU0llQ2hWSmNsdGlDZTJEaVZPazhpZWRORkdnQ0dX?=
 =?utf-8?B?WERFc3dpVXNWdVdIRkIwWmhzbTI0WkMwTmRmRURVdSszRkRIYjAveEluamJU?=
 =?utf-8?B?ODJISmI2ZkNRK3lxcHBFYWVYdExHRXl6ZVBoMUNBZEtORVRLRE1wUkFVbzJq?=
 =?utf-8?B?YkdIbmtiOUR0dFVrK1hZalFPMVNaYTB2c2FrMVNZZ0E0WXAzelZ5ZVZFSGw4?=
 =?utf-8?B?V2xyMHZRWXgzRUpJSEo0YUhYNHc3b0pnKzVPUEg3bFNpVGUvTXd3aGZCWHRV?=
 =?utf-8?B?SHkvU0VwTXJ5NjdEK2RqdVJ3WW5jR3U0SzBrMU1WT3FrMEFFTk9UVEFxQnla?=
 =?utf-8?B?czR3ZWU3TFdMNVJtUGlLWkw2WEg5RDZsYVdlR1I1MEdBcWY5ZVArRE90bGpP?=
 =?utf-8?B?UU0wcCtHLzNXVklWSWVESnNHWHk1ZGdyVE82bWVKVHliVTUrRmRwNjAwbjc5?=
 =?utf-8?B?ZkMxbGpFc01UZnJGSk8wQ0hVQ1MxOTdUcmFrS1krcEp4czdDbUtyRENjc0lt?=
 =?utf-8?B?dmRMbEFQdnNDdnFyVU5yckQyZmdsa1ZlMm5sNDhLY2JDczVvTWh0Z1o0T0FD?=
 =?utf-8?B?VTdQRWtXcmVXTmc1Qm1GcWlhUXV2NVNKaWNoZHB3R1pvZWRTZFdEZjVjZmpi?=
 =?utf-8?B?dmhBWGxDUGtjNVdtcStsK0FOa1dmcUllSnBoNnpLVEhkVXQzZm5BdjFxaE5o?=
 =?utf-8?B?TlU4VldkcU9EMmcveXhDN3VWSCtaeDZ5UzRKajBXRmJOYkZRV1dmdHZkSWtK?=
 =?utf-8?B?OWhyWVJMdHNSbDRHZmdwWkVTU2pRaEh2eVhLSjRwR1RjcnBiT0o5S3N0dVhv?=
 =?utf-8?B?N0hrSmVuaVlZUy9yQ1ZWVzZQUks0dFZRUmdNTmoxWjVJUERTb3BheVM0TUtT?=
 =?utf-8?B?UFVnQlFROE1IcVZCS1c0YUR2RDVXM3FZcmxlM2RDMnQybUlmazNoWjcvaEE5?=
 =?utf-8?B?emkvWVBBblJxcXFyUTZGU2doR05qMWRSWHJNM2FxM1BLbnRtbk5rSDhOR2t3?=
 =?utf-8?B?bEpuMGc5RGh2SjNnd0xYQlpOT2ZCSDlJVHRzUVpPMzFuNU1VRU1BdW9mUmZ1?=
 =?utf-8?B?cDFZcllvZnlYNHJUK2VUbzdxcUFXQ09PZDR3TGRyeUZtRTBGSzd3eXY2OHo4?=
 =?utf-8?B?eEEyZVR6d3FBUVhOS2ZhNzNsMElabVo0Wm12RHZaak5malViRzFnRktNbExW?=
 =?utf-8?B?Ny9QY2pUZDU1blU0ZTRyWmlrWVRCNGZUTWFUN250MEZVVFVUTkJOTmpWWlJH?=
 =?utf-8?Q?iZiQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RjdtVm1wZ08rbDQyNUpFSDBYN3QzOFZmdEFCei9EMHVUeWRuWWkyK2Fhd2tE?=
 =?utf-8?B?bEZkbUFHYUxoOUdjcWREcjhRUlB2ZnNkQ09Xa21IZFU4eTRMblNoSlhaWkpk?=
 =?utf-8?B?TUgxeUlrSFhydVlZaFpvT2oxeTF3bzZXNjhQM0hwS3phR3FEZEt6R1JxQzN2?=
 =?utf-8?B?U1RqUUFxa3Bkd3l5ZlFpbW53dGZrRTF5Mmc4dktORXBOMDhsZ0JJV0g5emFZ?=
 =?utf-8?B?RDBha2xGN3JRVk9jRXBSWFhYaHFRcGJUR1psK2w4RTg1Y2xacVBmS3lwNGRu?=
 =?utf-8?B?dDB6blZmTDRUK2JjYTRLaVZxMk4xQ3U4amVpRmVnbHdzRVAvSys3MHhJODBJ?=
 =?utf-8?B?L0wrdFNPb2NicXlDeTlJQnYrc2J0VnFGLzdHOWZZZVNxMjYwTCtqTmM4bVRt?=
 =?utf-8?B?Yi9IUVFEY1NJaGZHOUFaMDh1MXM4OVl1MVVuKzhQdDYxOStxbDdQZVkwSWUv?=
 =?utf-8?B?UTM5WnVDMnhrMlA4c0FqN3A5Q0tLN3pKUmF3TTNFZm03RkVIYUlMazdyY20z?=
 =?utf-8?B?dy9jZHNrbjJaQ1JUcEcxOHl6MmRMbDEyUFJmQjhQcE9WQmhmMXZZNzQwMWpr?=
 =?utf-8?B?VHgweHpVN3lwQWhSekRPcTJXdlphVDVEeEFxMWI0TjR1NXVjbXdMWmZad3lL?=
 =?utf-8?B?OEZXQWNWT25HSE1BQ1hXbWpRSjhKSzh5WlBLd3VCQVlXNXQ0R1hGQ0dqaHR0?=
 =?utf-8?B?V05lZHJ1dDMwSmhzVlFPNkNaY3JMa3hKNHJhVnR1NFp0MGlqa0xWRUhKUkpz?=
 =?utf-8?B?YmQ4cWtTaHZsdk0rUTEvSE1tcEY2TnlVY3BieGszaHNOcmVESWpwdXZjUUxh?=
 =?utf-8?B?NHVhbXVYTHQ2UElCeEJiV3VQQ0JVTE9tVmdPMWtnUXFKRjVGdStMWWZseVlE?=
 =?utf-8?B?bnpqdG5xUUZRM1cwN2hFY2NhakhKNnZwL21tR0dBajhGOXJ2TlA4VVRsMFJZ?=
 =?utf-8?B?VE1hb3BZUWIzZHh3QTFxcFJiYlhvVC9iQVBMNjU2ZE5LSWNVdC83WFUrUEdW?=
 =?utf-8?B?L1duZUUzU3dHQ1ZiL2xmTzFLUlhoVXdBQVQxZG5CTlRHcklDbitRcVRHNUdH?=
 =?utf-8?B?cGN2dTBRbFJOSVNJWldGWVB5amJYd1dkRzY2RERIeUNZbkVOUzQwYkFSbWxF?=
 =?utf-8?B?cDlmd1JPYkxwaUNRaVAxR3Z1TldldGFKeWt3YzlKYlUwMlBvYlNmWVNwc253?=
 =?utf-8?B?d2VoWC81ZngyWXFZTEh5eXZ0Q2kyMG9lVmc3M0s4QTJORzF1QWl4eDRiUGhB?=
 =?utf-8?B?RzVoRXVuQU5mM1psNHNRWHRQWFNNMGpxcFRObWtiR0syQVNJS0RhUHl6bjRJ?=
 =?utf-8?B?NjdGclQ2M1VqZTFPTXA5amVleEozMm1PTm9IZ1RTcWJaY1FHN2d5MlNPYStt?=
 =?utf-8?B?NDZkTVFqbVpPUUV6NmtkbUQ2U1B5VytDZG5TT2ExMktST0wyT1VQSHpxYWdz?=
 =?utf-8?B?KzZFbXVFMzlHSjlXdnRUUDVBTEtYZXZJQjZrQU56M243SngrT2toVFR6YmJ5?=
 =?utf-8?B?bXBGVVFtQUFCVEMxNWplR1FVUFlaOG5RQlk2TDJnbU1TS0U2Z2ZFNGlVajV4?=
 =?utf-8?B?ZHJvcHZMQXl5M2J6QjVEUUJDb2g1cHY4UU4vYVBCU3RHSWtxMEZ2bjdLM2lI?=
 =?utf-8?B?QzR5clZSQmQzVWllRUNGQUhVMnVuMmhoTkVzYWZQL3NBWGhLeEZGKys2bDcx?=
 =?utf-8?B?R3BMWlF4UUJZR1Q0a0cyWnlKMmJEa1l5ZFQ2d2E4STQ2ZTNrdTZ2WXozQXNU?=
 =?utf-8?B?Z2UvcUIyZlBMbXB3dlFtc0pLNHlZcGwxUjAreU1zak90bktIaEg2YjNreEFN?=
 =?utf-8?B?Q3VFZ2NNdzZMVWw2T3p5MzcwLzR0LzVCMVl3NE91T3pIM1ViY291OXAzZVJO?=
 =?utf-8?B?Yk9MU283dlpiYitHWHhFc1N2cGEzQUZqTzZJQXB3MWFub1NndXllaHZ4ejNK?=
 =?utf-8?B?elRLYlM5UjZTeW1rVm9ESEVmRy9WWVc4eDRXM0NnSG1EMTFjVy9zOVlwSWll?=
 =?utf-8?B?NDlDempOY1FFaXJkbjlCS0p3bDQyRkdGeTB1WktmZkh3ZnZWb1JZYmdFVnJs?=
 =?utf-8?B?ZUI2bTFTNzcvd205V1A4VnNxT3F5SjhuSmNkNk1xY1dNcDBBcnY4UW5BbXlI?=
 =?utf-8?B?QVdhbGZKeHBOclVhRWNta0ZUTTBqckZDVlFkZk40TFUyTDBFcGJVaWwzTC8r?=
 =?utf-8?B?cC9PUDJ6RXlQbk5Cb0I0OHNPL01wOVI3R3VBVVRqS3RWdHdnd2tYVUJTNnBw?=
 =?utf-8?B?Ty9kdzhtRHhMR1lvZXo2V1IyWm8zRVJMd0REQkFQOHd4U1FFd3g3RUl5Y3h0?=
 =?utf-8?B?cnhrK0N4K3pvQ1pCZERPMTdnZ0hMNzhMNElyTWhsQ3cvRTB1V3l6MnIyUWZC?=
 =?utf-8?Q?7JVNUVqHYof0tgNk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2125b7d1-1a7c-4484-684e-08de5e569523
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 10:18:29.7713
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dF+OrOpgPF0j1FoJuBuM3pIRN6WlGRuj0G1j3AHoe25dW6VL3Ffp3//wm5A1L5tct277N4lnZYuBNVf89LbExvV9lTlSGmDJYFzZi+9RmuQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4853
X-OriginatorOrg: intel.com

On 2026-01-28 10:24 AM, Maciej Strozek wrote:
> Add a quirk for a Lenovo laptop (SSID: 0x17aa3821) to allow using sidecar
> CS35L57 amps with CS42L43 codec.
> 
> Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
> ---
> v2: Added more detailed commit message.

Looks good.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
