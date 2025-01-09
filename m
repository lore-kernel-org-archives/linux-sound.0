Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F88E2AD25
	for <linux-sound@vger.kernel.org>; Thu,  9 Jan 2025 14:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736434114; cv=fail; b=MHVrDmpGxficZttERcRXDVnYy4ywdFT2N0UZXkwuQWy+2IEJL8MAqn/ezKFTbeRt1oRGn5gQSaYi2lNhllT9m068ijB2ICOC0I1tTU2+RzSSNizcBtwcimGQiyCe3/ohB0kvO4JzQGu7iLWnnYSTTrI79Vet1xJE0ilF13XG64I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736434114; c=relaxed/simple;
	bh=qkR85CaK4IoDBhrZz4pMf6o7hOlxBcmn/TjBVqpnliI=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cRuJuyispwZlQJ6B4WiaQ2lJTosX0orhCQbrRuXsX0CKcchij+C8yqJz722AOxeFMIjpurTTcIxm/dPPMjONVXGr1t0OnqX8S4ITAKtg4kmVa/I2sBEp2SVlOevfllk5GVJEZ17S074sD25k8sxTuEvKf1p16kJeXPCXyqAjPug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LKlWcxWG; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LKlWcxWG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736434113; x=1767970113;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=qkR85CaK4IoDBhrZz4pMf6o7hOlxBcmn/TjBVqpnliI=;
  b=LKlWcxWGx6are3J9Ud1elpnR7+2GcxXHrGlQnaCc1x4Q9qC/z6SLKV2I
   fBupKnpouoffO9vEp48ksSUqc8VeJTsUwHhDYyGoEMHLaQFeYl0l3I/A3
   GPyIMf9FzebHxBvRJqF46GbzXNXtDS97ohgBmFHWf4o5yo1icOCtp3aPx
   3b/B29yaPBN2YpdmNpuaNr2GJ7lllI07XgwxzYYZvzNyrytsgymULsR8F
   aWIYskB2GSvW1vCX1JJqRgawljbf45NSFw+xj/o4kWKWprX7ahOp/g0Yo
   Eqzg9H0dC3qxdJhrUF8uuS4FQL+fj8F8qUAs8sNmwZGVkanEIF2jVCwtT
   g==;
X-CSE-ConnectionGUID: j1pf+/B/Q1aqf5NJukm2yw==
X-CSE-MsgGUID: vjQn6gY2Sle5H1lUf2CPog==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="36716021"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="36716021"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 06:48:33 -0800
X-CSE-ConnectionGUID: aM+/ery4RhaaUY3XeimOrQ==
X-CSE-MsgGUID: g494hUeMT92t5vtzLXlatw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103301566"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 09 Jan 2025 06:48:33 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 9 Jan 2025 06:48:32 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 9 Jan 2025 06:48:32 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 9 Jan 2025 06:48:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LVB7TXK52p7+4XVZuxOJSI9zbGjM8oyLOLVJ6bfmrLgyBkGyGXZ7mi5qBVyTnVni9tReToqP0ntoMQG/aPwBXgPHO1FyeCSse5AfkoM/fL9zMkwy0YX9zb1WCEzvHzia3X6xXRsMhjT8sCKdS2C1Nu1wUaxJDLLwUz/GnXI05TOV1T4MMmIRw8g/Na4DgjmY9GLrse03Wr6Pp1eyoTCsj/2Y/jQwpPsiTJoyz17yUoIVGOWIqeZUNcCQojrT+Yd0wid8C3jymk7clma8zeCfhjOehS/c1SV95rcCrMsN5ZkO+0jHI09kT0ykzqUkaIZ7vp5IrACuLvrYTp14P9TsUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Max4BtisgqrtKfJ3oaKl4Udf6zkmyzekJYnXMbZiO+M=;
 b=RHO4htGkTIX0+uJW8fLeCI7+/e5iNEJoq/WwiWPSk2Td64H/ykrMrGR3L6ljF6xxyQm5sAtk+BpKYjAjXWmAVWUzv+pb5IhMBANUZhGLSGf79CCWI2JSmPc+aFn3ir4Y5/R6mz9JU1tpkB/CYZ1NaOH62mn9VOlhlz2HuGXRFvQt2XuR7P3ouTfTyA7T/JWCxMrjSHTkgXw8YxYwQ3/RCNR7FOni9UeCzli61mS1BhrnjSRPJzJIyllRtge2eESwZXO1TtrbnAZX0whmq4ZxWH/GX5ORmjh4rLnSFraKgTYrJvt1v+AhpfSIKVRTvf9ge+lyxC2xFrPv9SPi2a4daA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 IA0PR11MB8334.namprd11.prod.outlook.com (2603:10b6:208:483::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Thu, 9 Jan
 2025 14:48:01 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832%5]) with mapi id 15.20.8335.011; Thu, 9 Jan 2025
 14:48:01 +0000
Message-ID: <1cac3077-9b42-4ac0-bf15-4cf083cfebd6@intel.com>
Date: Thu, 9 Jan 2025 15:47:56 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] ALSA: control: Fix argument type mismatch
To: Takashi Iwai <tiwai@suse.de>
CC: <tiwai@suse.com>, <linux-sound@vger.kernel.org>, <broonie@kernel.org>,
	<perex@perex.cz>, <amadeuszx.slawinski@linux.intel.com>
References: <20250109125204.3668961-1-cezary.rojewski@intel.com>
 <20250109125204.3668961-4-cezary.rojewski@intel.com>
 <87wmf45a9k.wl-tiwai@suse.de>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <87wmf45a9k.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MI2P293CA0013.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:45::8) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|IA0PR11MB8334:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f27601e-0603-4c40-c895-08dd30bc9d59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SXhlYm9tWm9ucUdUcTFiZ0xDYnFaNkhzU24yNHJvVzdCV3k5ZWFTc29QZzNK?=
 =?utf-8?B?azRNSkRKc0JwZkJvTFJKbUIwalpXMFV5M0IraDR4cXYzek9HcDJvVXFNN1A5?=
 =?utf-8?B?UXpQcVR6ZUozOFFRazdJMHQzL2VEa1YvbTYrV1RqSS9KbUpvS0hLNStBaDVh?=
 =?utf-8?B?NUhoOUdvOE5FWFhsY0wxQWJrcDdRTVVOcXY0eFlZcEo0R0pkRDFDaGw4UnNa?=
 =?utf-8?B?UG10aU11TkVJS1JvWEZvSjR0ZXlRN2VVNlpnR1NFc0x1RllMQmh1b2pmRTNT?=
 =?utf-8?B?TUJid1d1TUpsOHJFeVVMYURWWHBJQ2FiRUxiQlI5WFExTHhNUXA4bXZ6U0Vi?=
 =?utf-8?B?TmQ5NDdqaU5qZUJUck40U1RRd1FjTFBZRWZjTVViYXBuQ3ByVjZHWWFYYzl0?=
 =?utf-8?B?VWRMeFh1MTFzK2hBdmFram0wdEprNXZHN1p3YTIyTHVCYkdueWtGRVg3bkhO?=
 =?utf-8?B?SmJFUTFYeW5yaHo5TDZFSnEwYmN3ai9tbnRlNy9GYkFqbGFYN0xPeGtCa2Uv?=
 =?utf-8?B?cGV3eGhIbjdGUFBMMmZSQ0hTa1R0UDBDRC94dXRNaDg0ZXBQcVB1WElkSFBJ?=
 =?utf-8?B?UmxpL0VabWNIbkczQWtzVU53U1Y1TmpvSnlrcDVvZWNHSGkwcngramw3eXcy?=
 =?utf-8?B?Tzh5M05WRkQzanVTTnQ5QVJGcGpPWE52OVBvTWsvVnJ4U3dPT3lubk02eXAv?=
 =?utf-8?B?aFZNOTU0RmdTalcyRGNVNlZkZXlKbXR4Y1hsQVNtYVFmVlhrcnF4d2RFYlpn?=
 =?utf-8?B?dE9NVTlKSzZVRXVvQ29TSU1HSGpMOGUzN0M3TWpVQWtwNEZJMGo5L25BbnYr?=
 =?utf-8?B?U2lqY2ZObi9yTWJwOU5vYm1NZVdCbzJ5S3A2eGNoUW5DY3lkcjh0YkxlMms2?=
 =?utf-8?B?T09EcTFqQnRSUHlESjRqeUREZ0pjcG4xSmRUc1hwOVZSWlgyNS9zZzNRdURI?=
 =?utf-8?B?U1RRNURIZjc3YXNiWU16VHRCSE9JR21vb3RUU0NPRjY4SWxEb3dKbzY3SjJX?=
 =?utf-8?B?YWx1ZGZKSDlQY2hGdkpNZVU3dU5rNW9OdERJOVd4WFpCcGJvemhHbm5NTVpI?=
 =?utf-8?B?b2JxOEVIOU0rR1d5S2lvVHUzVmdNNzQ4R0plUVpRNVg2TWZyQThDL3dsY2g3?=
 =?utf-8?B?VWRPOVV6aW05eEp1YjN2VTZCUXFINlNPTi9OOFoyMHA2NEJxWEh5N2dYenF1?=
 =?utf-8?B?QlR3ZHBCek5sU0NydllnY1dkbVZQWDZ0NnVqY2JBek56dUk5RDJRT1ZIbS9O?=
 =?utf-8?B?T0dPcldHclU1Ukw5MzRiSDk2Njd0U0ZSWjVNUmZIeENjMnU2ZTNsT2RoT3JL?=
 =?utf-8?B?NkRWaU42amZlYUhPeXVkSnBSZkM0bEJPVW9tSlVsS09tWCt6K0FUd0pkUzRp?=
 =?utf-8?B?bWNzZWQ4bGtCa1Bya2VSazY4QXMxVjhDWEc1d1NVb0k4eW5qd3RPSGJ6bVl1?=
 =?utf-8?B?Z2Y0ZVJiMGdmcXE2M1JQWmtDNElsdnM5ZWhoYnBXSU5nWDNHbVZzcUM4QzhL?=
 =?utf-8?B?UUVqcDBTYm1pWmlCZFpMZjlWUGxvY3BsVDhsOWRuNXN0ME5PUTkvNWZWZHIz?=
 =?utf-8?B?dGk5YmNZcHlWckdOem55VmVTdlRDbXJRYkcyRWFKdEpBZXdvTm1iSnFYaU1M?=
 =?utf-8?B?NVZGTHNwcS8yRWhmajNpUnFXUjZSQjc3dU5CS2ZXd0lDeUpkSDgzQXJJTHMx?=
 =?utf-8?B?WDdwRXRuVzR0R2ZMVythNmgrc2lhaUdVWlVtMEI4ZlNma3Y3QnorYlJxY3lt?=
 =?utf-8?B?cGFDeWFJQWtNeU1CRnRRdWxKVGhZRUlYWFIrZ05OeXJnbmx0Zm94MmcxRzM5?=
 =?utf-8?B?d3Y4c2V6dkVaZXNtdVQ5V3RxSUR6am9VanFkbVZMdEkxZUVvdUVSdGZ3a3Jq?=
 =?utf-8?Q?tVi7AsOfFGaL7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWpXRmhpNkhQajJtZC8xem1FbHArZFFCK1dEWHVwTTI0ZUViUkorV2U5WkFr?=
 =?utf-8?B?eFpKQURkSzA0elJoRWRtUjhZTVFlYU9sNGxIdDRIQWtIWUY4VVhBbnBSSS9R?=
 =?utf-8?B?VU9uVllCSGF6VEFBNldFRmpTdmdpY2xXU0p1WStWZVZqekhCVVV5RTJSNlR1?=
 =?utf-8?B?SjRLbWhOL0dTWUFyK3lZcGFWa2dyaFNKOVJESnJSc1JoUTU3NFptd3huQ0Zz?=
 =?utf-8?B?NkZkRjBFVFJrRlBCQ1JITjhUQ2kwK2ZQM2tJQkY0bWVUdzFOeWNDcXQ1REhY?=
 =?utf-8?B?Vy9ZVjVGcGhHaXY4VEtUZXFubkpDREtZSFRkVVR2dVFYakpjRDZKWGgvYTVM?=
 =?utf-8?B?L3A1ZVlkdzlzT3B4ck5MTmhVbVJXekgrc3hnNzJUQlhtMkhKbi9HN0dzWFNL?=
 =?utf-8?B?bHpHS1hoT1h5RjZSVVF4dGtibUt6cFpLVUdkdXBxRUswYXhJc0ptMlo0alBa?=
 =?utf-8?B?WkE4Y3RFcTdiZzRvek1QRFdsSWZIS1FCZ2gxcWErQkpteG9Mbm55R3UrQ2pQ?=
 =?utf-8?B?WnJFNGlHeXhqbnhsaWUxb1BJTHYzYVdLQkdCaE5CMGg1ajRab3V1VGhIOWV2?=
 =?utf-8?B?bVRlMmp5bEFWZ2dxSnRJWmdlZVR3VkpMNExHanZ6Q05WWDJGWHZuZDExUnAr?=
 =?utf-8?B?UUE1UHlaMHFqZERsMTVGWXBMRHlzMjROY0k2M0I5YkdvRWxJNmppOE01eXJF?=
 =?utf-8?B?NFkxMU03T1NIZzBCM0VxOFFYRmx1T0pEdDV2cnFWQWNYQUxvbzc2bGU4UTJs?=
 =?utf-8?B?eWt4WTM2Tml0WVBYSnJqR1BCa2RwdVBnaFBoK3lKQk9ENWJSYVNncDAyQlk1?=
 =?utf-8?B?VVIyV3dUcDY3UFExc2ZrSzVBd01hVUxxVTlVSWlPZWI5U291dXJCK3N5OStZ?=
 =?utf-8?B?eE1XOU1TVm1lck1na3M2WWU4S3dubzBGNWxhdVRSRTV6di9CYm5Vam5CNzI0?=
 =?utf-8?B?bDJ3L2grRjV4VC9EVXVVQlh1TVBWN1VZaGovczFpc2lWSU0ydi94VzNZOFVw?=
 =?utf-8?B?OGNSQnBwbHNpVUQvQ21pNmRZQVIwNklkM3ovN0ZWcDNnT01ZV25kYTlJd01z?=
 =?utf-8?B?WDNxL0tDTlRBUzJlRDFUQlJ1Vzd6SkxYcnN1SzVWMEx6d0ZxRHpBdm1JbVpW?=
 =?utf-8?B?K0FKVlliU1h0REVkcHVRcXZBOGNhYWs0czd0OGpoZHlGRmNrejBKNEc5TDli?=
 =?utf-8?B?Z0N6MVdaN0crSkRxUzc1VDNDSTV5WGh0NzFJR216QWtwVENDb1NUbno0eDRB?=
 =?utf-8?B?b3hlRzFSeW9NWWZQei9UMzlISTB4QmlTdklwM1AzbzVEMFFpRlVYOXdncmdW?=
 =?utf-8?B?dkc1TFJtc1EvOUp0V1NPM1hQck9HQVN4cjVSSXBpTitTdE1oMHl6aUJram1q?=
 =?utf-8?B?aWdaaXY5Z2RLNnhwQ3dYOW5zMUExZElmYWNKSzZuNy84RmhOUnhHNTlIbUZS?=
 =?utf-8?B?L1p2UnNZRzJOK05CSmpWYmRqMFc3aUZFc3ViUE9PSGgvSUI0MXBWaUZzTzJu?=
 =?utf-8?B?a3VDa24vaDNuOHgzTW9OSlZ5STBUVlFRS1lDaXU3RUN4OTNQSmh3TmxWWXNx?=
 =?utf-8?B?T2huK1k5Y08veEhCSWhVUHBnYllCYjRBd04yblhOdmVKS081djFQWEkwbFVj?=
 =?utf-8?B?WC8wYzlMenovU3NIcnFnNDlOd2VQRUVtVHVvbEdrTEdabzJlQThrRGdhVmdl?=
 =?utf-8?B?OU45eElMS29LUC9Wb1dmZ3U3d0FRSmRKV2toYUowOFJqOE5WNmdBQjZiY0J5?=
 =?utf-8?B?eW8xZ2Z0enlabmJoaHkwS2phYkltRE9XR1FrQVdrK0VVN2YxeVJzRzlCaWNl?=
 =?utf-8?B?VEF3NXhSOGMzc0xERitoUFIxaFliOUUyR0wyV21pUmpTdWt4eHg4R0k5QUxv?=
 =?utf-8?B?QTU0ZktOSGY2K3hWY0F6L1FhVnZGczlzc3pEa28wZ0tWRldweGZFaU9LRWNZ?=
 =?utf-8?B?S21iZ2ZEaDZvdHFUaDNuK1FGRTVTeW03dGZranp6YUhZSmNEV1JtRjRhajB4?=
 =?utf-8?B?WFVqTVNYWFpsZkVYS2p6Myt2UmUrRCthUzk1ZU1mYTQvenZsbkRIa0dkd1d2?=
 =?utf-8?B?Y0V2T0xrQ05iME01NjA5dFZtT0tGQmRuYVd6WkNSMVRHWFdweDl1WWtXeGtJ?=
 =?utf-8?B?bnBucit0dzZFa3ZiRGZWV1VUV2NXa0IyMUdGd0w4S1lQVTFGMEYyNTlLcnk5?=
 =?utf-8?B?bmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f27601e-0603-4c40-c895-08dd30bc9d59
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 14:48:00.9201
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Knod7B/xrSVkdv5bZPxjEl1P/uPJ0fSdfHzZG59UBO+OvjIiPdaa6fZntaPKV4DQ+LYJANdo5tmAO03JHnZ12iR6j7XnCBAUQjEwR4OhK+s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8334
X-OriginatorOrg: intel.com



On 2025-01-09 3:31 PM, Takashi Iwai wrote:
> On Thu, 09 Jan 2025 13:52:04 +0100,
> Cezary Rojewski wrote:
>>
>> strscpy() expects argument of type "char *", not "unsigned char *".
>> Found out by Coverity static analyzer.
>>
>> Fixes: 68fa05d4a82b ("ALSA: control: Introduce snd_ctl_find_id_mixer()")
>> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> 
> The conversion between char and unsigned char pointers isn't taken
> seriously in the kernel code.  The compiler warning was disabled
> intentionally, too.  In general, such an unnecessary cast is more
> harmful.

Understood, will remove in v2 and squelch the analyzers on the intel side.

>> ---
>>   include/sound/control.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/include/sound/control.h b/include/sound/control.h
>> index e07f6b960641..f7e18a1d144f 100644
>> --- a/include/sound/control.h
>> +++ b/include/sound/control.h
>> @@ -161,7 +161,7 @@ snd_ctl_find_id_mixer(struct snd_card *card, const char *name)
>>   	struct snd_ctl_elem_id id = {};
>>   
>>   	id.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
>> -	strscpy(id.name, name, sizeof(id.name));
>> +	strscpy((char *)id.name, name, sizeof(id.name));
>>   	return snd_ctl_find_id(card, &id);
>>   }
>>   
>> -- 
>> 2.25.1
>>

