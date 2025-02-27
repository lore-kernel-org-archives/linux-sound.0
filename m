Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6B027003F
	for <linux-sound@vger.kernel.org>; Thu, 27 Feb 2025 12:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740660271; cv=fail; b=RlcB0/nuLcTXiYiS7TcRQX3eXT7+rPliVvQAOM7pdnzDhUc2YR9986XZM4lflURQeXFDJaMIFJCnOV5pofzxY2vmSbwLwEek2FNl2Z/tkqxRtu6ovCjiaJ+n4zndzMJN8hQI9YIrhukwv+/qDgahAzltF33OZ1D1tRrTEZjj87c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740660271; c=relaxed/simple;
	bh=g0eT5H0g2wjV88jMBfRrkfcfiJ1bcSXvDVmtKe3ZGt4=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mv9QeK1xGpIi5ExNzN/pbBTvA2Jj973hr/XKduOOFPgL/XzariBDRg3iNnoN0qsZ+F3Z2eX4dc9UCBuEWRgF100Z8CHMGJ6/fvsgPtGqCaaBbzkrHptXMY4rWC+tp/rF6w7TW2dvXavnw+mX/HWEaIIr7sdI6PMJ+uv7DijXRwg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J5NHaWFB; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J5NHaWFB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740660268; x=1772196268;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=g0eT5H0g2wjV88jMBfRrkfcfiJ1bcSXvDVmtKe3ZGt4=;
  b=J5NHaWFB4m7Hq8r/sXS9b4xhi2fQc2XiHDCFWF+ah49SGuA8MisSM48+
   bU8jhcJYVJ4Pf9LGVwY79ppuLDhkURsYQgD8B84IS1ie/qvNyFHQoBeh9
   XWqgOVxd7BokPxGi1VHZzpNhVL/QQSgnPLWSa9ohlMTaL7BHDLhrZhGip
   CGy/GZ1d17AXGvrgbJ+Hb5JdP+5KTIVCY+xeBqfTELMmOR8a+EcEgD85l
   KLZAojL7FILgYiLU4MvK1eZAfccWMRRQJuRwDkkpS7XUniGrg73dYCRh/
   hNM88EAFUQYwIoL0K6FLBkdCtdady7utJZe58Y+v/ffHDkaOHyLO1pBjp
   w==;
X-CSE-ConnectionGUID: dl9Pi14KSA2debGpGjvK9w==
X-CSE-MsgGUID: KUpNt40XRAekIqhviHe/lg==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="45460707"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="45460707"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 04:44:27 -0800
X-CSE-ConnectionGUID: osZKVYhsT6SkuB8IllSMfQ==
X-CSE-MsgGUID: 0Ij7UD/wRL+tcVRI4AYMpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116885075"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 04:44:28 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 27 Feb 2025 04:44:27 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 27 Feb 2025 04:44:26 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Feb 2025 04:44:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KQy+XLxpQPyPsP53+eSkbaBKgsqu077czsNvCiEzL0W+7V7QJ36mMWU8hglpnPgLekzm2DdAbSvalNWIgZY5klaumB3bXF1cx3/K50iBG/L7kaHC2w8TCvZK9GM7BFyXN/In42vKNd5IboT61iMOZ90dLJt5bD67zk5tK0vo+RUsdsUIlFhmhtSyzaJTVS8ydQkFDlyhNKfN4bXv9k8UUkcgZ4J/UqDFi8ON/cD1Y6BnPJhxw+PnfRgWPsZtpwGyPQkHkNN02FP0wy+sZi77ZCyQyxYMRDNfQ0Xmmgf2tGzyFKl2e5zhq4u8Bb/ia04xx3LgicyS1N/Zoj26ryGPcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9L7KpfYZDvHrLDkN10c+XgerDjQPOni+rrtTg8WWN4M=;
 b=jMir3ZoXb1OwkqT2iEzLOS72TOXvEeEWTmj2Di/Z/9zqZDYxwZe6iOx0eFTtjYS3kAQ3e4y8HxkafWS63zW2kU2wlnPdSx8MLwio2qpCg+zTaW6LwlWLJakLcmEtHmGemdOGP6nwFHCuwcStjXJ+0WUFMobaGMwFQdemB+Rxg4GmlImpq6YCndh+tskHV663wMw6hPuu25BCP1xjA8arV1cF2N5sR8Kb5EoWWf7yFXuwzHrNIhiaL24sn4VnKOT80AT7uw2A5BfHN1TK/xMWPTCQnhx9KIooxeIRaGZxeQVbek4/aBh8MGXeRYMaLsf51IHWy4U/6G8fmbwgf5fqOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 PH7PR11MB6771.namprd11.prod.outlook.com (2603:10b6:510:1b5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Thu, 27 Feb
 2025 12:43:43 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832%4]) with mapi id 15.20.8466.016; Thu, 27 Feb 2025
 12:43:43 +0000
Message-ID: <3fccbd20-693b-46d5-bf31-2beb73aa7e54@intel.com>
Date: Thu, 27 Feb 2025 13:43:38 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 20/24] ASoC: codecs: rt1015p: Update definition of
 device_id tables
To: Oder Chiou <oder_chiou@realtek.com>, "broonie@kernel.org"
	<broonie@kernel.org>
CC: "tiwai@suse.com" <tiwai@suse.com>, "perex@perex.cz" <perex@perex.cz>,
	"amadeuszx.slawinski@linux.intel.com" <amadeuszx.slawinski@linux.intel.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>, "Flove(HsinFu)"
	<flove@realtek.com>, "andriy.shevchenko@linux.intel.com"
	<andriy.shevchenko@linux.intel.com>, =?UTF-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?=
	<shumingf@realtek.com>, Jack Yu <jack.yu@realtek.com>,
	=?UTF-8?B?RGVyZWsgW+aWueW+t+e+qV0=?= <derek.fang@realtek.com>
References: <20250220112643.3813295-1-cezary.rojewski@intel.com>
 <20250220112643.3813295-21-cezary.rojewski@intel.com>
 <d1fe2ca16a7c4c9c90bdd5a8480ca497@realtek.com>
 <fcb19c07-9daf-4fa4-a856-5e8726a98873@intel.com>
 <fa960c2c016342e5addf2eba19881d64@realtek.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <fa960c2c016342e5addf2eba19881d64@realtek.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P191CA0014.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:800:1ba::14) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|PH7PR11MB6771:EE_
X-MS-Office365-Filtering-Correlation-Id: 15ff7c59-caa2-4a5c-6cd5-08dd572c5eaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QkxxSGJBdEpPZXB3ejAzOGhnY3Fma0JIaFNLUlZmZThzSmpObHJRWHRxSHJy?=
 =?utf-8?B?N2xyM1RGcCtsNUQxazN1VXRwdzlvUXJEdFVWczBIQTVBcklrTjJjVWRxZU1q?=
 =?utf-8?B?ay8zcXByOG1ZYzU5RnRMOGRUQ0Nzd2JxcTVmTVYveVQzMFFsdXYxdTV5SGVp?=
 =?utf-8?B?UkVXUFhsQmZ0TmtIL09LRTFxcm5NRDM5Ym9zeld4ek1vMkx3dFJUZ0puR0E5?=
 =?utf-8?B?QzhNV28xTGFObmVpcDZONWJFN2U5ODAyZjlYeFpiemgwU2RhWldtZi9KOXJj?=
 =?utf-8?B?K3I1OEtUYVlndEEyaVpLeVNjeEloZVR3bnZXMUpPYUJmWW0xQURxYkFpclAy?=
 =?utf-8?B?VUlZVUdlWU5MWDZyUUw1bWVTYVVydTh0RUdtWkZRWHdHNTVNaCtZQm1HRXhP?=
 =?utf-8?B?YXRpcmM0SysrTG5jOFZuTDFJZnV2d0VzektGMnZvSkxJaFVDakhKMkdEMmEr?=
 =?utf-8?B?aHNVSWN2QThvV0NNWWdwSmtoRFQwb3FWcXhwWU9XNEJHaDlNRjBkaTF3RjdK?=
 =?utf-8?B?NFU4dHdhNXZHMW9pZDg0Z1NwY1F0YmVVSGNNL3VZS2dSMUdCUmFDUHdrTDk1?=
 =?utf-8?B?bzZiQ1owVGQ4NkxWUDRnYjZ4eEJSQ0hRdjZ6ajh3MkkrTjZOV3lPRG93L3dm?=
 =?utf-8?B?ZmowOVF1N0ZVRTJwc3BzM0NrV1VKQVBZK3gyaUFvbFZsSDYrU242VTZ5REly?=
 =?utf-8?B?R0ppRHR1bG55ZmJUUURCSkhZS0lXdFlpeVpWR3VXVUFUUXBxLzRFaEV1VUM0?=
 =?utf-8?B?d3FueUM1c2l2U3J6djlGVmdmU0ZualEwUTlzOVlWRC9NcVF5S2xjZFFKNVZW?=
 =?utf-8?B?ZHhaQUNyNi9LWHhEaHFiSHhlSmoxcmp6QzZNSHMrdEdjN2dPNS94eHJhcWN4?=
 =?utf-8?B?TTNtTlhJejVYYzFnVDBZS1NKbEtJbE5ZWWJ0U1o4MU1Zbk1IdGZyT0pkRFJq?=
 =?utf-8?B?d3F5bjgxWWNRMTFrNndLVDZPVHpaelBmMGhLeHdkYUYzcTRXTnI4cExWTVhs?=
 =?utf-8?B?d3NYVndRMmJ6bjkvck54LzRva0NpdVdvbWp6eTRJalZnNFJNcGtBNjBlNjM2?=
 =?utf-8?B?T3FnMXlPV2RCeUxlbXZVV2hTRU9IckwzZytmcEpMTE1rd0ZIb0V4V2pET0xF?=
 =?utf-8?B?ZHBTbnBJNXFKV0FtT0dRM1pUbHEvR3lRMDRZSU9HMC90M1NmaTRsVUU5Slla?=
 =?utf-8?B?TlBmVmpJMFpSdUR2WDNnTy9MZHNuaGllT0MzRWlDNTVvcnRvZzAxMVZNaFRE?=
 =?utf-8?B?YlFkZ0FranNCczhzdlppcFJEaW1WOVF3L1RveHh6RVJ3UUI3Q1BOVVRNTnor?=
 =?utf-8?B?NHNsQkVuNzN6VktvWUVIbG1xQ0tHS2VzWCtDSDU5S0Fva05UM0tMYzZGRmJW?=
 =?utf-8?B?ZGhPQVNOTnZxRzRhLzl3UHFVWVVyT0tUd2hyajh4Wm5FVVhpRkJOaENOWHRq?=
 =?utf-8?B?Tnc5eFVGb1luQVZCYmp5em0zbng5Y0tlajRJdFNJaEg2WjVmZFA5emV2c1pG?=
 =?utf-8?B?bnY5Mm0yQ0paZVRLaHRJMS9WcTZ6eGo0dXVacjIrOXhubitjODcxeFpxU1ZT?=
 =?utf-8?B?UXdLL3VkUWFVOWg0SGpvT1QyeDhwYmpGZkorV3FVdHJSdkE4OEZvdkFiKzVV?=
 =?utf-8?B?WGJ2bWh0NVo0cnJiK0h5YVRENTM1enVGMlhqQmFjUFZ4SitzdWNsaWU3T2NJ?=
 =?utf-8?B?eG4zSzkzVXVGeC9YTXNLbjJ6Vzh2bVZ3YjByaDVHRVMrY29KWnRodkMyTUJO?=
 =?utf-8?B?bjRYMDRNTlg2Y2ozTGNiVzNJZk5HOUpENFNTbVlwOTE4cEZlVEVGTFZ6TTVW?=
 =?utf-8?B?MmExWWM2c1o0eFFPdGovdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGVuc29ISElKVjJXL2Noek5wcVBsNjBWbXVJdUF5R2p2eU0rV0dpOW1hOEZh?=
 =?utf-8?B?M2xPaSsvWm1nY1lVNTVkWG5XUEs3RDJVQ0ZYYlFGYzRiOXozMjNPNkNzYVQ0?=
 =?utf-8?B?Wm9OUnBJVUkvaWhNV1J5NERmNjFtRFlUb0hSOUh5N2tXYVpQU1R1TkJKSGU3?=
 =?utf-8?B?YVFTRE1mSUdqK01rNWdDTW1tTDlPa2Zjd01UbU9vRlhmUURJVDBNUFA5dGM1?=
 =?utf-8?B?c2Z2VDNndGdDV1hPRGIyY0lpK251SUdXNU51eGpYT28zL3pwTU4rYjU1SXkw?=
 =?utf-8?B?RDJGTmxoZk5ZNVhMaGM5eXN3Q003bWtNaHVwYUdsK0kwSzUrRk9vRytOQmlj?=
 =?utf-8?B?ZjhVbndWcytVSXFTaHdiNEt2QUF6V2cwMFF3L0Q0ODNSUkNrRTFCSTRqeXR5?=
 =?utf-8?B?UndzT0kvSExMOTA2eTZCVVJWQzU1MTRtOERjUEhxOEd4bEhwTXRRZmR5ek1v?=
 =?utf-8?B?ZVNtZ1JVVUhPQjMyN1YrOU1lK2pwZTVjVHZnK0VyMHBwdkpnVDVjM3lLcTJa?=
 =?utf-8?B?WlRoc0IyQ0g5OXNpejc0ZWY0WmNlSXk3Mzg2RVNud2lMUVUzbWdjaEJBOUZR?=
 =?utf-8?B?Y29TOE80N2ZKWHRBejRVbWVvQlp6bnFVNE4xT0xXRDBreDZIalRDb3RpVmdy?=
 =?utf-8?B?cXA0TVZ6enoxVDBiSUg3bVFUSmxpdHl2TzdzMEpxMkZ6YnAyUzYzK0lPOXlL?=
 =?utf-8?B?dTkvU3BMdUpYSW10azN3ZFdSb21LUk53UU1PbFJ5R0JvejRrQnFQRDdTaVU3?=
 =?utf-8?B?Z2p1YkZPT21RWVFOYXNIbUkvUUl4WENWdDRCcVk3V1YyQ2N4alNQSnl2cWdr?=
 =?utf-8?B?YldQcEgvblZMVEpJdzc2MWJ4eEVGMU0yelBLa2JSQmpISktQSFl5aVpJQktB?=
 =?utf-8?B?MStpMTU5UVArRGFFZTVwSS92Rnk1Q010VEJITk1nUmxKQUNER2Nja05EclI1?=
 =?utf-8?B?Vk5XKytqUE4yVHZNOGkvYzVZWlZIMnQzYTVhcTdMb0ZMZ3BsbTN6SUNLZXdm?=
 =?utf-8?B?eE40VWpRNVk2VnVIdUZiNzMzSFJDUHZhZnUzRUxMek5jcnhqM1NyUTBqbndz?=
 =?utf-8?B?Z25BZnlHSVVqWlVsc2pmZVNDKzNSNXB1VG12YytuY3R6L1pwOC9NWjRWZ21m?=
 =?utf-8?B?MHBCVDl1Z08vVURDbmcweG0rQWNkc2o1KzFxM2NhVGJzTktwZENia2xFdy9t?=
 =?utf-8?B?Y0hmMFlmbDJTbVdDQWZPaC9JcVFRQzNRdlY4clZwUHVzclp4ZWV4SlA1QmVB?=
 =?utf-8?B?YXVxVkRZK3BxbnY5NHBvTzc5YWxWeWM1MTFvVEl0RnhlMEdWR0gxUmcwVzdI?=
 =?utf-8?B?dlhKMjRpZGNnelNwSHJYUkZXQ0hPZXZCZmM4ZFYzeXVRL1FVSEdEN2JCeHRJ?=
 =?utf-8?B?R0x6aUpOQUpLWnlSclhuY3htVXc3QzU4Vy9TazBjcERvQVlNeE40K1FaM1Rr?=
 =?utf-8?B?eXRjLzJzTHh4L0xBYlFiNmRUS2tZTjlGalg1ZjBIMWk0eVpHb3pOclAwVHdC?=
 =?utf-8?B?ckl5b3JtTzZHZndvZ2VsNVFTSjAwWjF2SmhjZUtEQ3BiMk5VcDVHZGZKaE0z?=
 =?utf-8?B?Y0pteFRsbU9sUU9QOGtQRWRhUGNUVTlCS3dmZmphMDN2YytwTjZ3d25pTWJm?=
 =?utf-8?B?a2xzUEFuTnpsU3gweURzTHlQY1lVcGJUUDlLOHZ3NWMrL2tNdVlURTdtQXdj?=
 =?utf-8?B?bG0yNmpnRzJyMGJ1SWpFMm9RT1lxNDl3cGVnNmRtZllWVmtKYUxwMEJHU2hl?=
 =?utf-8?B?KzBlMDVpc213b0RWVGNRU2kybzh4dm1ZQisxSGhaN1AvRUcwV3crU0NKZVV4?=
 =?utf-8?B?TUx2VDNZeElyRERTZ1FWRzdLRGx1TG9WK0xwNk9UQzZ5NlMrU0VJRHdrdllR?=
 =?utf-8?B?dGZZSnFmZzNEak13Qi8yYm9vMjd6VFlhcDFQNzIvdnFnU2tQTkxVM2VnOVhE?=
 =?utf-8?B?bXVuQ2RqT05tdjJNSzFHcDBjOHdOMHdibExUZWVGOFR2ZXc5Ky9Bb3RUbDdt?=
 =?utf-8?B?M2E5blcwZnA2cUNBbFF3SERNM2d6cVVtVjNET1lBdnNhVU5nZWI5RExMRVZU?=
 =?utf-8?B?WjBZWDVJYXJqbXhFenVCeXZObU9hcmZsRjNzTUJtMW5OZmJjUjh6WVVWNXVF?=
 =?utf-8?B?dXBXTUczQ2VUeUU5cVZxTGRSZFgxVnJnZWZsOTdHNWdrbWc0MHdyNjMzRmw0?=
 =?utf-8?B?RUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 15ff7c59-caa2-4a5c-6cd5-08dd572c5eaa
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 12:43:43.7398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ebE6Ryyf9cOo9HZa7mwI8diiLWImLPex3omYqpwaUq4uxii6el8W87aqtISpdBs7kjRfh8gf2TL+lXLljkvKLcwaY//4SUbudSRaZNAuMv0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6771
X-OriginatorOrg: intel.com

On 2025-02-27 6:11 AM, Oder Chiou wrote:
>> -----Original Message-----
>> From: Cezary Rojewski <cezary.rojewski@intel.com>
>> Sent: Wednesday, February 26, 2025 5:42 PM
>> To: Oder Chiou <oder_chiou@realtek.com>; broonie@kernel.org
>> Cc: tiwai@suse.com; perex@perex.cz; amadeuszx.slawinski@linux.intel.com;
>> linux-sound@vger.kernel.org; Flove(HsinFu) <flove@realtek.com>;
>> andriy.shevchenko@linux.intel.com; Shuming [范書銘]
>> <shumingf@realtek.com>; Jack Yu <jack.yu@realtek.com>; Derek [方德義]
>> <derek.fang@realtek.com>
>> Subject: Re: [PATCH 20/24] ASoC: codecs: rt1015p: Update definition of
>> device_id tables

...

>>>> diff --git a/sound/soc/codecs/rt1015p.c b/sound/soc/codecs/rt1015p.c
>>>> index 44e7fe3c32da..33917438196f 100644
>>>> --- a/sound/soc/codecs/rt1015p.c
>>>> +++ b/sound/soc/codecs/rt1015p.c
>>>> @@ -133,9 +133,11 @@ MODULE_DEVICE_TABLE(of, rt1015p_device_id);
>>>>
>>>>    #ifdef CONFIG_ACPI
>>>>    static const struct acpi_device_id rt1015p_acpi_match[] = {
>>>> -       { "RTL1015", 0},
>>>> -       { "RTL1019", 0},
>>>> -       { },
>>>> +       { "RTL1015" },
>>>> +       { "RTL1019" },
>>>> +       { "10EC1015" },
>>>> +       { "10EC1019" },
>>>> +       {}
>>>
>>> There are different settings for RTL1015, RTL1019, 10EC1015, and 10EC1019.
>>> RTL1015 and RTL1019 are used for powering up and down via the GPIO.
>>> 10EC1015 and 10EC1019 are used for the I2C-controlled driver.
>>> Therefore 10EC1015 and 10EC1019 should be removed.
>>
>> Sorry for the delay in response and thank for you the feedback.
>>
>> I'm surprised this hasn't come up earlier in the discussion. I'll
>> probably cut off problematic patches so that majority can be merged.
>> It's important to have some follow up though, on the subject you
>> mentioned. Correct me if I'm wrong but from the .c files it seems:
>>
>> for DT/ARM rt1015 & rt1015p are represented by:
>>          .compatible = "realtek,rt1015"
>>          .compatible = "realtek,rt1015p"
>>
>> for ACPI/x86 rt1015 & rt1015p are represented by:
>>          "10EC1015"
>>          "RTL1015"
>>
>> The first pair is nice and clean, the second is confusing and error
>> prone. Do you know where the second pair originated from?
> 10EC is defined by the PCI domain, and RTL is defined by the PNP domain.
> To distinguish these, 1015, 1019, and 5682 use different drivers,
> with the RTL prefix being used to instead of the p postfix in the DT.

Thank you for the reminder. I'm aware of the origins for PCI/PNP 
prefixes, though. In fact, there is more to it - OBDA [1] and ALG [2]. 
The idea is to choose one _recommended path_ and follow it. If the 
desire is to name future chips using suffixes such as -p or -s, then 
perhaps PNP-based naming should have been selected instead. Another 
option would be to change the hardware naming scheme e.g: '1016' instead 
of '1015p'.

If the latter is not an option, why not:
	RTL1015
	RTL1015P

on ACPI/x86 side? Aligns with ARM equivalent nicely, no?

[1]: https://uefi.org/ACPI_ID_List?acpi_search=realtek
[2]: https://uefi.org/PNP_ID_List?pnp_search=realtek

Kind regards,
Czarek
