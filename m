Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5508325727
	for <linux-sound@vger.kernel.org>; Wed,  4 Feb 2026 11:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770205065; cv=fail; b=FGbe/EJ5GfYntHb9Uqr79r/kbfvA06TdvXJoncI34vCXbcf2SyPRozqiYb9KJ0bPFIYRcyFpDXhgS2D6kS0nmEtgDfbiHOWtd3sEhi0Tk4AjJRgh5OREY6VLgLRlWfGSzFZ18o2fTSSKRG+RAm+GrGdkmAOg5XXuJhjzIs8LbD4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770205065; c=relaxed/simple;
	bh=SpWleJ+5KMPVVCoBuN63Ega2NVi4icfUJYzItuZQ3kE=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KeUmvpDVHZQVric4JU5ASi7uejaVGS3EK83hJSR+TxvN6dk6EEibG8yJAIx3JNmOHHO/YiXyS+efszJG8JIy6PsYbIMa428S9uY8kK/e1ET63IZgkzfDwuJJeI+qr9bVkf7d7pgDUvrUstOr0cv+zFzPuOM0Cd1lwFTa00lo1+U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L4m5J1lG; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L4m5J1lG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770205065; x=1801741065;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=SpWleJ+5KMPVVCoBuN63Ega2NVi4icfUJYzItuZQ3kE=;
  b=L4m5J1lGJKcz1ZvzfGTrAoBU61GYS2CiUHtQ6hE+jHmTFw2vZFdEAUYo
   hoviOI46pCEXi3bI3IRdo0zGREF4G/XfaECSLsxdi5ijLf13ozozixGCH
   qMcnOK7yWSY5dGuLolWaK2thFwW+lJ58XOLd0yGuMiaWHNeeaVl8Kv5H8
   Q0nXXBYrDSfsaYUjGbGHpC2R80ppzmtBe3acvF+18XSsxkZW7WpRHmzsi
   bW6dMErt/sP0igefQ827hqhZFzsDOOQVH89rzxppzm2cijyfptJTnWqpZ
   w4haI927MpoTYRVSfg/VDo+ugPGeF6Qfjt4gbIXD/jTlaI53vLxEsIkQW
   Q==;
X-CSE-ConnectionGUID: WHBpl0wZSdieR4q0Ii3xbA==
X-CSE-MsgGUID: kX6Nl3bCQ9mDooub4aTClg==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="88966823"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="88966823"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 03:37:44 -0800
X-CSE-ConnectionGUID: TJH+4aUQR5WClZz9pah+Eg==
X-CSE-MsgGUID: scGShUbZTt+ysOKF4+CM4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="210177260"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 03:37:44 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 03:37:43 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 4 Feb 2026 03:37:43 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.0) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 03:37:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZGaxTQVxPt4orOMkRk0fyw7PiEKVy4E69KwW/j14Raq7hvibVKdI1ZTjboA1lhgKrpdSyDGJg5Kik1lOYWNnIo9R1uNL/2X3/97o2fSGTC++bkfTHJhOq0zs4XzqfTFIaA/5Moh9fekq9FC88WtdJDBUCM8LRw8UB3W5o0O/NmbCdxuQ1a4jnVsDLWD00YFjnx08KDJdTEYJQBBKBjPYYYZf/nYrkIZrh7NLNVwi/gbo0fgPU6JdH7T+9AinLSfzkESV4NefpcmM9ZIC3Qfs+l42E8hQLqcdwRo/u3u3w7sxgtEcJICldjCJPx6Z6OL0CmEhkhWh6T2xIVmofNRkDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A0Ve+VJ3MSSrdRwhOdnJeXQxUjzsFyuCnG2OcUL5alk=;
 b=e76bbJDk6HnYhSPRsUU8APaX9hslCrKsLU/rrGwsuOq2J5Fw13rN90oAPOEyMY/mPwDY6lrvVv243tKO+LicMmAtsNgjW+37orm0gJ9u8x0SjW43XEBaqEku23bZLlKhS4TjnnHCoOQxKoekGTZjLneXqF6DDJ4xsBAlVdOaSxh/oDQXqPBvrQsq1HE02Pe4Zs4XDBwmdxM2MKV9dgQIthOH3Gg+OMnFfbJIkDXdFgsHMNdC2JJVVc1E2eA98MAtZVwtCS2Gt57jy/ZDwFEdz5qVAuqwKS1qgNhienvw4YqInJ8lWXxKFcGc8i++kC35NvAB7r0gKp71uWtrOpZiew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8283.namprd11.prod.outlook.com (2603:10b6:806:26c::16)
 by CH0PR11MB5268.namprd11.prod.outlook.com (2603:10b6:610:e3::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 11:37:40 +0000
Received: from SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214]) by SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214%4]) with mapi id 15.20.9587.013; Wed, 4 Feb 2026
 11:37:40 +0000
Message-ID: <a215b553-d56a-4965-b6e7-0bab69e7473b@intel.com>
Date: Wed, 4 Feb 2026 12:37:35 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: control: Verify put() result when in debug mode
To: Mark Brown <broonie@kernel.org>
CC: Takashi Iwai <tiwai@suse.de>, <tiwai@suse.com>, <perex@perex.cz>,
	<amade@asmblr.net>, <kuninori.morimoto.gx@renesas.com>,
	<linux-sound@vger.kernel.org>
References: <20260130135541.115574-1-cezary.rojewski@intel.com>
 <60f477d0-ea1f-435a-bd8c-4e7e06a1802b@sirena.org.uk>
 <87ikcjxjgr.wl-tiwai@suse.de>
 <2d5852c1-f754-4b5a-8a01-962a4ba14b68@intel.com>
 <245c0bad-9040-43c7-9c12-08919eb3640f@sirena.org.uk>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <245c0bad-9040-43c7-9c12-08919eb3640f@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0252.eurprd07.prod.outlook.com
 (2603:10a6:803:b4::19) To SN7PR11MB8283.namprd11.prod.outlook.com
 (2603:10b6:806:26c::16)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8283:EE_|CH0PR11MB5268:EE_
X-MS-Office365-Filtering-Correlation-Id: 73d524d8-c1b7-4eeb-d778-08de63e1cd76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N3BXcXp6Wk9VVmRuaEU0ZlJiRWM2VkNFbGtsbGFKZ09vYlhGc3hoRXlseVBL?=
 =?utf-8?B?K0prNktBZ29MaTZteXNFRDA0Y0Rob1Y2Mzkwc1hTaEZGaTF5WjBuTTVNZmlQ?=
 =?utf-8?B?VmJBcmVnTlF4eTM4NXZGTTNBR3I5WUVJcjJpZFY4cWRLSnhCdjJnSkdZVXdH?=
 =?utf-8?B?bWJkV1hwcjJzOS9wNWpJNW10ZUpJRWRwUmhqM0lTZWoyZks0NE8rd0dzYzhM?=
 =?utf-8?B?OWgxRUJOajhTNE5BQU03Um55Ly9ZaEFySHJKL01CQzVjY2FmRlFMK24rblps?=
 =?utf-8?B?ZUlpYkUrRHlCUVU1eExIK2oyY3hoNUJkN1pWNmFueERrYjNOYjFRR2VuNXlo?=
 =?utf-8?B?Q29kUHNkanlQL0JhYms5clg4MlNHUzJRTDB6TmxoZmlPZzM1MFRKdWp1ZVRn?=
 =?utf-8?B?dTYzWDlNVHcxb2djMDZlMit3REoxZko1OXVBNlk3U0NjRXBGVDBYaHVqVDRS?=
 =?utf-8?B?N1dRZTRzQUFBU0RTWG1paXJBSEU0SldacndmNGJYQXQ2SmhOVm44bEZYcUFS?=
 =?utf-8?B?R05ZVFRRdnV0a3plcTRBOG5aU01UTGxLd3c3TVhoSk9id0R5WkFXQXFXNEp0?=
 =?utf-8?B?L05EZ1JvYlQ4cVBrb2Ywb2R6b0VwUDhTVGoyWDhGZ2ZoSmJoTUtQVUx0eWJK?=
 =?utf-8?B?MDI5aUd0MW1ReEhQeUxsQ1Jxc2xPRzgzL3lYVURaUHdQMTlVZ3JUYStZTUZ5?=
 =?utf-8?B?YVd4V1Vha0NEV3pEMEJHVkxwWkoveWZzamJlU1M1M3dVUnBxeEJrMFhSVzNC?=
 =?utf-8?B?Yy9ZZUV6b1hnZEdud3ZNZ1N6YnRENG55QmtvRWJjeE1TWHRSQ21pWXNDTGww?=
 =?utf-8?B?M0ZETnNhcTJTcmJ4ZVoxU1R4WTlibWpVVEcvcmhTMWpCR21JeWQvNGhMMUxH?=
 =?utf-8?B?b3VFYVUwM2diVzQ3VFVCTjhHdFBoSGFvSlQxZEQvZ3Y3cG5taVR5MDhoV01P?=
 =?utf-8?B?QUJxUDBNbXloSlFSdXN2SFJWNnpVZU9GNjlnNDU5Wm1ITS80MC9DKzNoOUdK?=
 =?utf-8?B?cVpWSzVRazNlTEphaVdOeFppRkMrS1diZnZxb3Y4TytxQm5HNkNSREJPOUEz?=
 =?utf-8?B?RktoK1lMUCtjODFHTmV6T0xhU1dBNVFEMVArLzhWV1h6ZmtNK01PZjlnQ3hz?=
 =?utf-8?B?YVRVcnRxUDZUeEd5TjhXcDNmQVZRTXk1Z0lRdENQNGxFUnlSdXlKeFhNZk9o?=
 =?utf-8?B?bmNtdlFtbzRVYWZBMkpCQzZTN2V2eFR0OSs4TGZzNDl0bjkzNTJDT0IyLytw?=
 =?utf-8?B?OXJHdVE0NGpEaWlSQTA2T3NJUCtlUktVN01MVml5QXRVS2Z5T0hGang3Njds?=
 =?utf-8?B?bG9YYUYxSnVJT2twM1M4T1FVQ056Nm1uNWxhdytCVThOMjZTWXFrU0krTHB2?=
 =?utf-8?B?dm01Mm5qcTJkd3B3ZVVEcTBydk5nalVlZEpORHNsazVyS0Z5c3NGbmp5aXR6?=
 =?utf-8?B?V09PWUNzdkpGai8vckZqWGFOL21xekt2SFRwNUhESDdTZEVZV3ZSb25RVnl5?=
 =?utf-8?B?SFJLTUF5ckJVcld3c08vMHhRVWFXeSt1dGQ3STBXd3FJbzFGUkdqbmtqUTY3?=
 =?utf-8?B?cnFJaGY2bDJ5TmlMdjRQV1BLN292OTFvc2FwMHJudXZKeGQ5QzAvVDdkZ09z?=
 =?utf-8?B?eDhYa3lKU1FzLytwL1dZdDhwQk00aU1WVVUyRXo2ZnBEdEJDZmI0WkR5ZWEz?=
 =?utf-8?B?TkYxdld3RmhnQkxVWFRkcWRYbXFENmxXenNjeEMvdmR2Slo4d1B4L3gyVXdh?=
 =?utf-8?B?b2hNTUkrakhZRzNHWXNXVFU4a2NQd3VZSzdsTk03YW1XSXkvNkdxcm9sTDU3?=
 =?utf-8?B?U2NHOE5pS3pMTlhYZnJNOThxNXp5YU1RcjBZRWJLeVBGUlZZZ2pmOFp6blNH?=
 =?utf-8?B?MFZ5SlJWaDJwcFFiaG1wNzNhcTEwOTV1SlI0Y1lsWEJBaUVYeXJjY1M2VUtO?=
 =?utf-8?B?VFFZSW91dld3blFQQ3Fja1RDc05XSDdqcVd4SmE0T2FHcEFobkpTYjZBdzRC?=
 =?utf-8?B?QSt3SGlxZGovQ1NiT0QwRXlYZFhhV2o1WkxGdnI4T2s4NEVuR2NmU0RKR2lq?=
 =?utf-8?B?a3h3UEN4ZUJhekluc2Z6N3FwS3hLbFJIb041L3l3YmxUTU1jazBqLzFGUE5F?=
 =?utf-8?Q?DWBg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzhhZVJNRzBCNUpIYmVHNWNjYTh4NmhPbkx3QlhNNUJoaDd6OStyWldMMmRF?=
 =?utf-8?B?d053VW9XU1BvckZERXRTWWdRTTBpS09PZkJjc2Yya0RVTGNwWjZ3NS9JcU0x?=
 =?utf-8?B?ZEZNajQybU0wS0F5eDZ5SW56R0ZHZTN1VkRsSXlUbTAybzdHVDlUeWZNR2ov?=
 =?utf-8?B?N09mZjA0WGFJSC8vYVk1enMxbnhYbzFPMDRQU0lFbWtCQ0ZLb3NPS1lHcWl5?=
 =?utf-8?B?Sy9UY3FXLzdrSXFCVlUyaVVwaE5OOWE4ZUhiakRabnBIVlBwa3VJb052RG56?=
 =?utf-8?B?ZGRlVzA0OXRNZHZZSmFMdHNCclJhUmZ5RHdwd0RueFNseEwrc0lOUS9abk40?=
 =?utf-8?B?dG9OUXJ4cEJvc2JiY3doMFJlR3hLZTdZR0tDRG1hSnQ2VXBKSjU0N0h2ZWwr?=
 =?utf-8?B?ZExGZmFYOWFXSTFLY1B2eEVCY2xlSmpsanJZSWxvNE5NczF4bTdaNi9aNkkz?=
 =?utf-8?B?dDFSdHVGWWgzZHB5M0FEbFF1L201c3NnUnlBS1ZaQjlUMXNmeEZ1a01KWGJl?=
 =?utf-8?B?ZGkwekNyQ0pycEZwbGdSbUE0ekNRWTZ6RElHcmNkSWdVNkc1MnVsZzNWUUsr?=
 =?utf-8?B?bHpOOHNIdGsreExJNXBVSVlaY1pFcUlhUmRiYmRrczRidDZ5Y3oyTS84Mis1?=
 =?utf-8?B?ZzBLdWtHMU1abmRnY3U4ajhWd1g3TFZPK283Mm5zNEhWaG1VZjNwSlVHM2Fh?=
 =?utf-8?B?UW5MOWg2b0Y5VCs2T2hjWGh0dzhWYUJoQ2hiNUdwTzNxOUhNczFpb0NqaXNZ?=
 =?utf-8?B?Nk9hNC9QMVlSRm9tbGhDRVdZR3N1Y1F0ZGovR0E3dkthRUpBNThORU1EQ2hH?=
 =?utf-8?B?MWFiQnpBUE0rb0o2NS9ETTJGKzJJd2g3V2RPTEIzVzAyR04ydU5FZEdTWG80?=
 =?utf-8?B?S0xzSmF6eVZNS0kzTWxjMHIyaXdvVEpHeDc2eG5mTmZpd0tCb3JseFBienNH?=
 =?utf-8?B?UUF3SVdadlVBaXBUTHZPNTVYblhRL0ZiR1VmeTdIcGdVd0xydmx5L0xuZm1l?=
 =?utf-8?B?UjN0Z05CT2l0UFdNcU40MXhLRHlCQWxtY2xicG8xbWNwb1JialdIaU0vL280?=
 =?utf-8?B?RkRLVDVySUZLK09VSjN0NmZGU0c3QnVDbUlkSDFEYzd0bWZKUXhBY3ppcWJt?=
 =?utf-8?B?djVOR0lGaWF6S25UYktKTzlwTFVxRVBybUU0MjJWWXRhZnFtNUtTMHJRWkFt?=
 =?utf-8?B?TDc2dWhNb1p3WGgvS1RTOWZzdEZQTXFRa0xHeGUzRktxbWZ6NzhUQkxOT1Er?=
 =?utf-8?B?SjlvZjJnVkxDd1FYN1RCZWJYM1hHK2FSbFhEdGVJU24vUFZHb2pIUEVlb2py?=
 =?utf-8?B?Nk1VK0pvbFdQcVFBRFVYRFVmMUNGY2kwS2MxT0txanVGSGd0VWZMakJxRHJk?=
 =?utf-8?B?RDhSUU90UGJmVm5FUE9kdUljTzJDTWdKMit1d2grWEk4RUNFUmh5ZEFiSmoy?=
 =?utf-8?B?U0c0eGZIUDRaY2ZWd2R1b0NYTzhNNWtlWWhtWncwSURtNS93TFFNZzc4blpq?=
 =?utf-8?B?R2NNUmYrQXc3ZStVeGRyQm9TNFh6bjROZFNVUlo0aXA1dmk5bXdWekJuSTBM?=
 =?utf-8?B?SWhWYWRPeGJYK3doS0trakRFZkRtL0dQOExWMDlyd0dRdkh2SHJ1TVd3emly?=
 =?utf-8?B?ckk4RXNBWk51bE9zbytSVVFldTIyOEtoRFFtKzRac3YrZlNrbTBucWpsUHV1?=
 =?utf-8?B?ZW55Nm1EblJhRnBNQmhweWM2NnlIc3MxU3BVY3RaaG5LZW9kVlgvZXFlbXdR?=
 =?utf-8?B?WEsrWGpVYklMdC9Qb2lHdWVnMEFRL2RNUTh3OUdQd1BTazAzZVdUTmxncXI4?=
 =?utf-8?B?MlhNNmpEbmFoY1dReFdDb1kwRmgwb0cvNU4yK0g4KzlHTGtzanVQOVNIQkpr?=
 =?utf-8?B?T1RtaXpDUm1TOHdHN0FXNnpaZ2ZQc2RiSTExeWRhUWwwTVdncHkxZnduNmhz?=
 =?utf-8?B?aWlLUkI1NHZlOFV6dzdNVEVBN2MyVDdWSUIwSjh4SW5GWDlqK2RaWGhXcFB1?=
 =?utf-8?B?eHJMMGVtWlVBTjg4QUdJZnk1aHpDaEZ4Q1F0ZXlkWjVUME9QalFDbnI2MHhs?=
 =?utf-8?B?dWVpMjQyWjMza3pkRWZtKzI3YUc1bkZMbGxOWElnd3lSTHFPWXpld0E0QXNw?=
 =?utf-8?B?K0RyL2xnU2RyWU81M3o3TjlVUE5QcXF4VWNrRUFGTkpxZnV5RmZPdmJwaGcy?=
 =?utf-8?B?RHBCdFFzRlozRW4zaWdjQ0NIVTNnV2Nja3JwSmRZSk5nYkZaUnM4MFQybHFR?=
 =?utf-8?B?ZXN2dUN4RWN5Ris3cWpRT2pZbDBhTWI4TW9vZkd6OWJnSlQ1dFRESUtod0pu?=
 =?utf-8?B?ZWkvczZibVEyN1BxVHdZeHJSSVJncmtTWm9BdDVFTncrZFpXNHFVQXcxQ09H?=
 =?utf-8?Q?J3UtSU4hHn66Nwaw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 73d524d8-c1b7-4eeb-d778-08de63e1cd76
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 11:37:40.2422
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ziLNuyUDd/9Je4eAccGRHZUaCix6SupDTDNiGrkdlP6XWXfj5ngMMvwi+vTs+A2TSBfgGTEXoeYHBm8BwM8ya2CdI1Et68KocJ/MEFPDzQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5268
X-OriginatorOrg: intel.com

On 2026-01-30 4:13 PM, Mark Brown wrote:
> On Fri, Jan 30, 2026 at 04:00:10PM +0100, Cezary Rojewski wrote:

>> Wouldn't memset(0) as a preparation-step solve the issue? That is, each
>> element - instance of struct snd_ctl_elem_value - has up to 512 bytes of
>> data, regardless of type. Not seeing usefulness of ->info() here. Perhaps
>> I'm missing something.
> 
> A memset() on the original value before reading would get it into a
> known state but wouldn't solve the problem that userpace can pass any
> old junk in the unused parts of the new value it passes into put().

Thank you for pointing this out. Indeed, "proper userspace" is not 
always the case, which my v1 clearly forgot about.

I did few tests with ->info, namely info->type and info->count. Reused 
the existing fill_remaining_elem_value() to be exact, with '0' as a 
'pattern'. Hopefully that method is enough to deem whatever is provided 
to ->put() worthy for the verification.

Kind regards,
Czarek
