Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601C914A0A8
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 10:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742206158; cv=fail; b=cjM6+hXhjX5XymkatbDNYYMQto+YwoOd4nW8DgAez1yL9Kbhs/BLHrPfiHzuZ27eGwO0Fv0M2NeIIEKpB8IHyQOQSMJZ09aRBmmPRz/9sn1QHbyLBtoXJNWAIlJUH7qEsWJzMdu2XSimWapktMv8XG3lRmACgXJ2OenO+2YDSCY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742206158; c=relaxed/simple;
	bh=Ie0j8wZrTvOUc6orWA5sRnhTDk1kbFRpE7W0CB1K1pw=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XGo/o93t7IMhTkBGtrAXLWpc2BnsWoE/7pfREiR+zhi7W7ikqm+siN8lT/MlpZei++1rWpupf70oqqa6e5zBfeq/pTObsKLDXQCjsDf/Zq1tfcqPs/ZHmqutOSIuY7SLbpHrauoKQ6o/B6UYwqfGGZtfAueRLNrauwnM/tHAZ8c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KcFLiZGF; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KcFLiZGF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742206156; x=1773742156;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Ie0j8wZrTvOUc6orWA5sRnhTDk1kbFRpE7W0CB1K1pw=;
  b=KcFLiZGFeXu1oCu1sh/+tDNdUIVpQusfsqKQpQT2tB8Bn5Bxc3KT6RQW
   iuv8ryIbdtkZqhNMTqG/6dS7fFb8QbUZyLnAw4+2L+L0ZPwL2ddIr3vjW
   juux+o6LtA93YN7VjvZBQECcJf/piI9QZVsurUSBv/Ur2lcf2d7e2vlYp
   ePqKdn3yvkwpRMrk8YVM/PT+y/BmswBN7Rloij/RRyOSyK8yaOK3ipTu1
   pcrX6ugB3Bj4Uq64CPJPAnloP+N+5t2e4bHKFODiQudmUmX6IddwBJcTL
   hSIjJyva1nhVLsHN5McIYxB2bv4noXc/noHvrzMaPqVYcMYUeZ18vVRFE
   Q==;
X-CSE-ConnectionGUID: hwd3bAjIQAe9stxO8hV6+g==
X-CSE-MsgGUID: p8e4Vb+KRRW8iLdm79hsYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11375"; a="43175131"
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; 
   d="scan'208";a="43175131"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 03:09:14 -0700
X-CSE-ConnectionGUID: JcNHwvI0RvGxFBrjkxyxIA==
X-CSE-MsgGUID: tH0BeXIeRzq+Kjizlb7WKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; 
   d="scan'208";a="121852887"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 03:09:15 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 17 Mar 2025 03:09:14 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 17 Mar 2025 03:09:14 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 17 Mar 2025 03:09:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jJdAyspFu6sbiWtlKGhtJDtVztfmh08/umifsIlHVoVB317YXxiVTgiQYOTS8cAhMnwY2NRdknd6X5cxP6EXEKPKkKkHLRtoe0CCezle7Mz60Y9PM8cwUUbCQnlo3cowkJO8ACkCE2jdqICCpFszymUPa8URUFtSXtBO9WHRGSKcBJS9eIzTkBhYvzTN9m54usNnxqLYWGIncepUu/OXmk04IDF7pNy9wKdCUa0G72W4Pk0GxpHSfDgULoCSlVfIbdGDnX6qop+nIk5Y6T4pFzs4AV9HOfd68OSx5gXIOYqARAKJ7MVKDwFMJqh7qJNhz3a7qgb/wDDIf2oF1a8C8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=thjjBKGd04/JMWXnWFYXM/2j8aPw+ZDeO7kS4WyX9cI=;
 b=nO0IL60HtMeYUPHt9adzDJ9tObrNQpDjjv3P9v9aCQE6w0+NPk+AvRXPxYcF2Ile9NuCO2VnSm5cTMj0I2YTxuOTHu2PTleOYiIzinpv3zFnu2EcwIBYUqPsWcDOWIk+HGRHi0U/QgM/y9frAYr+RkURcEzjC54m7qLkCpgtuyVVtKyD69CVgTOPqlazRO22YezlwgGtlzyWYIy5uyssc28EgBb8lG7szg7OguNoR2r2CMod9Eq5F+e0hmWvMTgAFotVXHpqMUKCLI8i4m0ktBmRfyLHiCM8BAB3LVlUe9duBiBHO+gvXlmIL+Re0Vo7r1fSEb+1X9XkEn39FhIIYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 IA1PR11MB8248.namprd11.prod.outlook.com (2603:10b6:208:447::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 10:08:58 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832%4]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 10:08:58 +0000
Message-ID: <363cb7bf-7ff5-4f14-8de8-4809f7afe891@intel.com>
Date: Mon, 17 Mar 2025 11:08:54 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 62/88] ASoC: intel: catpt: Convert to RUNTIME_PM_OPS()
 & co
To: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>
CC: <linux-sound@vger.kernel.org>
References: <20250317095603.20073-1-tiwai@suse.de>
 <20250317095603.20073-63-tiwai@suse.de>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20250317095603.20073-63-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0502CA0024.eurprd05.prod.outlook.com
 (2603:10a6:803:1::37) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|IA1PR11MB8248:EE_
X-MS-Office365-Filtering-Correlation-Id: e3f4701b-038c-43bd-d2f9-08dd653bbb86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M0N1UFBYeHNNOUpIV25DczMvUWlCaTVrMnorSUpsUHQrcUJ6RFF4MisybWZt?=
 =?utf-8?B?ZCsrTFgwZVJhU3BEK2xqTVNUK0taMUkzWEErQXpGbXVuR3pYU0ZkUjhWajRC?=
 =?utf-8?B?bVI3R0tDdm1DS1o4VW9XWE5sM1pMWjRqam9NNHNndlVsZVVGM1haK0IzOWRN?=
 =?utf-8?B?VCtoSGF4YXV6SmhGZ1EreHVSVDZKYWlMckxsOTNJUkJhQ3V3UWRkSGF2Uy9s?=
 =?utf-8?B?djZ6YUtyVEJhdFNHdkF2ZHRKNU9Cb1NiRk5GT3Y4YTNOVnNhUElIY3IydC9E?=
 =?utf-8?B?dkNqUFQwNjhjWFNZSTY4ak9sY1FnU2lZTG5EeWVwNlczdndUMWh6c1g2cS9x?=
 =?utf-8?B?cWV2NjJCbElZVE8rWDVSZ3pqQVhEZlZ0bDkwQ1pmNWlDeE15TkFheENVYkZC?=
 =?utf-8?B?QktxcmUxdFl6Q05SZlM3c2FXZzdjWnFuR3IyMGZRMjkxbmFTRWZpZTZ0V2li?=
 =?utf-8?B?UU9mc2l0Tm5hd3BTbGFFK1BRbGdPZUZDR3BEaHI4cEVuVHViSjAxcEdoRExG?=
 =?utf-8?B?VXBJMjF0VGxGNlBRVUhWRGUvTUJneGNaZGYwTzVHa09xN1lvbjJ0Z0pLbnA3?=
 =?utf-8?B?ZHpqcE9HRlpNVHd5ZnJvWDliS21PQU9IZCtTdkRXc0lSWDNZZG5oaTl0ZGtV?=
 =?utf-8?B?WHNWVXNOTXJzeW9sNGVZWDRGS2p5YnNCZmlSZ1VqK3pibnptTDlyMURPcEhT?=
 =?utf-8?B?ZlZBbmUwRTlOaTR6eS9KZTUzaWtyYkMyWFg4V1pUUEtYdlZocUk1cDB6dTVr?=
 =?utf-8?B?OVJqUkpXWmRRUnFQN1Fic1lmS2pVRDVZK2JOUCs5MWpSNlVqODQyU2lkWmRS?=
 =?utf-8?B?R2dSSW1UK25BK0tSRDE2UlVQcVVMQUdQSWsrbkVpZ2czYUtWRkZzMHNzT2gr?=
 =?utf-8?B?Zkl5eUJtMm1PYkV3SldEV0lIVG5BNEVxTkNzY2NUMkllRHJmaHdpUkxqUGlT?=
 =?utf-8?B?Q2s0VU9PZ3dLZjdkd3YzVUo3ZlpOdHdCblhFdTI5ekNIaU9DdnN2UDVvWVFW?=
 =?utf-8?B?a0svSHJzcDJMNnF4Ly9EeDFweGVkdXd3ODNzQUVsaTcrcHhMOGMzei9wSUs0?=
 =?utf-8?B?OWI4bW5maUN5aDk4a0tqajdPRkN4L1BGZ0c0Y2RJRldwUGNuSEJLY0pTMVgw?=
 =?utf-8?B?bEEwMGxUT1VXMHBoVDE3b21tdmRFM0NIMGc3NFp2K3BYWCt5Zlk1V0tWekVR?=
 =?utf-8?B?ZWk4and0M2VFcXRMYkd5eHpPZitOVVRXcDM3YWZDVkdNbVhpVXJRS3RuWDJG?=
 =?utf-8?B?Wk5PbWU0VWNoKzhhK3VKZnF3NjBVdHEvUExGRXBnQnNRcVFTcFBMUS85dzRt?=
 =?utf-8?B?aWFITno0ZkI0Uk03YzdVdW5xSDZqSmttbXZKR0NEbXJOK0svUjZPMy9ORmkz?=
 =?utf-8?B?TWQ3eGlza01GelhlbEVtQlBINm5mdnRITE90dlBzcitGcEVyYk1xektwaUlC?=
 =?utf-8?B?RHFBNHk3WnNFd2RMNXZQTDNoVU9lNkRtU0Y0Vkh5TzhWWlgzVDBGRmJzMFdT?=
 =?utf-8?B?TEFmUGVXTlpTZGx2TlhuZ0xVWjI3VVhTZnRETGFvNkNQVzIyaGp4cE1NUTJL?=
 =?utf-8?B?eGE2czRUTjFLOW5OMXJSY1hQQlRCZkJEY0ZBU1R0YUJJMmJRSG1yTTNFQVRQ?=
 =?utf-8?B?Vit3b3RHaUZvUUxRVks1QVZyRzVxZExZeFp6elViV3dqcFVEbHJsSUNNbXVP?=
 =?utf-8?B?djEzWkp4NUorckROZHFybHF1bmFLakZmakczcG9POTNrUFZuMjlEM1drNnhq?=
 =?utf-8?B?NmFVZC9pYkRaQzVnTHR6a25uSzhkdGwzNkp0ZkJPUjE4YVJNQ2YrRUVKbHFS?=
 =?utf-8?B?bjdYMlVzQWNZaVN4T1NCRHNMV3hMaG4xRFRFRUVjZWI4SFk4VjBhVEZURE11?=
 =?utf-8?Q?kV4HopdlUICKR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFZsMFdJRGRidHRIY0NEczgvZy9Lbnc1dURiWXhqSE9lR25BSnJJaWZVVkJI?=
 =?utf-8?B?Ymp2OUdqc2FGenl0aWUzcnJMaVQ1cDl5L0tVUUNRdXBDNWFiRE5WUm9OVm54?=
 =?utf-8?B?YTd4TlNmK1VaQUo0aGR3d2YwbzgySHlXcngrZTN1eFJWL2U3ZXJsVVVBSWdZ?=
 =?utf-8?B?OG9HdTN1K05sOU5GMnBTS3V5d2czWnd5aURIT0Q0MkF3bTcwNFNYLzZpRW0w?=
 =?utf-8?B?TlBsWW9tK1MzM0xxUGVISU9QSmZtb3NtK0xkRU00bHR4M0dKMGIwSzRWUVZG?=
 =?utf-8?B?U2dtOGtlVUZON0JWeHlxSDBBdlhkSFh4ZEJkSFU0VnBNU1cvc1NKaE5ESXE2?=
 =?utf-8?B?QUVlOWZqdUZJbFhMaTREeXNMNm40dndGVjRQREIvL2NuNjJId3pYRFFrSi80?=
 =?utf-8?B?dUVLR0MweVJ4SnFuOHpzKzNBNmpRUmpyVjZlZm9ldlBVY2JselBkMzNFcnND?=
 =?utf-8?B?M05keHZPZnRxcVdZZVNaQkJjNmFYcjNGK2NlaW1Kb3BYOUM3Ynd6c3RYOEdI?=
 =?utf-8?B?K2VRWXVJbG9zUS9nVFliZlpXckY3M0dDVW9xblMyWXNGaHlJZk1IOWl1M3JL?=
 =?utf-8?B?RStRa3QxMVFkSDlsck9OS0xaMTBvNzRlVXRVWnNTa1M4cDFCN1RQUkJwVEth?=
 =?utf-8?B?Ykl3eDlOL0FVeDFUbUFrd2cyZWViSGg3SGdtQkd2TzE1K1Rkc3Z2L1Nqc1dn?=
 =?utf-8?B?WXdnZGRyOHNLd3hGakdaR3NnU1V2ZFYxdHNQci90SnAwRElRL2xGVWpscFV4?=
 =?utf-8?B?R2UxWE1ZR3ZUVUw5c1Jnd2tiNEFxbHR1eVpzOUJ5SHdEY2hpNEFCUytzeDU3?=
 =?utf-8?B?MlFIaWdoL0dPSllZL0cxazRXdDN3REpqMmo3VGtzOFpwOXNkN0JiYjRYU1Ux?=
 =?utf-8?B?NUw4MDRTQ3UyR2g0TnZ1S01aeGpXdU1UZmtTamxRQTY2TnRQVTNrOFBrdU5z?=
 =?utf-8?B?RlUzNzAzRjlkaGJ6T25SK2I2UndIdTZmbE9QQm9OSjhtQW9FZHJUbGVWZkVh?=
 =?utf-8?B?U3R3WFZwaWU4bW1rWUtVM1ZseDhXSGxGZVFDc3FtdnpnNWFpSCtvM3h5clRO?=
 =?utf-8?B?dkFuZGE4THlOTlF1TzRyeGJZaGNNOXR1NlhCM1hId2RFUE1TMzBtaSt6NW9q?=
 =?utf-8?B?THlmdXc3enhSUUZ3dnlsTzdkUWpmRGR6Q0IvMERBbEo5cXl4VWNrenBlQjU4?=
 =?utf-8?B?ZXdidmFaVnpoalNrekxJZjNMRmViQjc2V3BYU3Zvb0lwWFpvQTgxTncwT2Zo?=
 =?utf-8?B?bldRZW1IU1dScVErWlJQTS9SWU82eFJqVXQzdjZla2RheHdCK0RISHhXMnlG?=
 =?utf-8?B?TjNaSVlkeXRONWxVUVVEb0p6ZXFPa1NmelFSZmZWczRoWHBDcWhiZDBUWGpR?=
 =?utf-8?B?VnhKbHVNbTNsNDlzVHNJN3pFcVVGeHoyYlZyWTJHRlg5RFA3Q09NT2xRdFor?=
 =?utf-8?B?V0gydjIvaW9rV21sNm5HLy81NnR2WWxwenpRajFhNG05Sm8zMXA1czZ0aDRZ?=
 =?utf-8?B?bTA3cE41a0RSS1BMU1B1UzcxZkZtUGlVd1Y2OTdZZndxeWZDRE4ySlEreFlC?=
 =?utf-8?B?QkJReGFqUDBjVnNKbXViNjgwTnZMeHdDWTlaQitMNGswbGVZQldIaVc2YVU2?=
 =?utf-8?B?bHk5cjNsdmppL0JLOGVzd1lYWXh1dXRUYU1oZkh2NFpyWTBxandtMnhkMkJJ?=
 =?utf-8?B?TFhscWRhcFFVQUtsNTFVL2FUNjlJRjJ0aXV5djZQTDhnbDJvZlFPbjE2cVI4?=
 =?utf-8?B?UUhJbEhkekJIRzZPT2JSUnpmRmZTTUd1elo2cDBsMm5xQ1cwK0VMUXRKMVls?=
 =?utf-8?B?VEgzOENXbFlwZ0dpcHY0aHNtRDJmMmM0aTVGZ21PclE2TnA0N09sL3hJZGw2?=
 =?utf-8?B?YVFNRzdBbHdVMkN2KythVUJsWExSTGxKT0padUxNdnhDUW5NQnNjV1FheE54?=
 =?utf-8?B?eitua21NaFR2S1FRUVg2NWc5OE8vUDlqb056dU9sMWpMck0ySHVpSjRHT1NF?=
 =?utf-8?B?aDRQYjRjRmIrcjZVYjM0cDBnSGhiVG1BaWlSNWcyU01xamJIUFNBNW1yMHcr?=
 =?utf-8?B?a1g2YmIrMHc2c3JXWTBWc0ZyQkxEWTZTaUlsenUxN1BndWN1T2Q5aE90SEJ6?=
 =?utf-8?B?aHp0dUNWOWZ1TEtlOUhzT091cWhnTCsvaVJReGgzb1cxSVZCOG1XVFRMVmlY?=
 =?utf-8?B?TVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e3f4701b-038c-43bd-d2f9-08dd653bbb86
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 10:08:58.2271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OtT03PASCRwta5AHd3Fn6bOHsveRw8yyEsN0AutKfqXgxx8v8RiTA0OzdoXE2ftWLjaaUp/2sCpXyk287P/Biiywg02uHz0Hz94JA1rrvi4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8248
X-OriginatorOrg: intel.com

On 2025-03-17 10:55 AM, Takashi Iwai wrote:
> Use the newer RUNTIME_PM_OPS() and SYSTEM_SLEEP_PM_OPS() macros
> instead of SET_RUNTIME_PM_OPS() and SET_SYSTEM_SLEEP_PM_OPS() together
> with pm_ptr(), which allows us dropping ugly __maybe_unused
> attributes.

Off-topic comment:
While __maybe_unused may not be the prettiest, it is still better 
alternative than #if/ifdef spam all over the code if you ask me.

> This optimizes slightly when CONFIG_PM is disabled, too.
> 
> Cc: Cezary Rojewski <cezary.rojewski@intel.com>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Thank you for keeping me in loop. The patch looks good.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>

> ---
>   sound/soc/intel/catpt/device.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/sound/soc/intel/catpt/device.c b/sound/soc/intel/catpt/device.c
> index 2aa637124bec..faa916f40069 100644
> --- a/sound/soc/intel/catpt/device.c
> +++ b/sound/soc/intel/catpt/device.c
> @@ -28,7 +28,7 @@
>   #define CREATE_TRACE_POINTS
>   #include "trace.h"
>   
> -static int __maybe_unused catpt_suspend(struct device *dev)
> +static int catpt_suspend(struct device *dev)
>   {
>   	struct catpt_dev *cdev = dev_get_drvdata(dev);
>   	struct dma_chan *chan;
> @@ -72,7 +72,7 @@ static int __maybe_unused catpt_suspend(struct device *dev)
>   	return catpt_dsp_power_down(cdev);
>   }
>   
> -static int __maybe_unused catpt_resume(struct device *dev)
> +static int catpt_resume(struct device *dev)
>   {
>   	struct catpt_dev *cdev = dev_get_drvdata(dev);
>   	int ret, i;
> @@ -106,7 +106,7 @@ static int __maybe_unused catpt_resume(struct device *dev)
>   	return 0;
>   }
>   
> -static int __maybe_unused catpt_runtime_suspend(struct device *dev)
> +static int catpt_runtime_suspend(struct device *dev)
>   {
>   	if (!try_module_get(dev->driver->owner)) {
>   		dev_info(dev, "module unloading, skipping suspend\n");
> @@ -117,14 +117,14 @@ static int __maybe_unused catpt_runtime_suspend(struct device *dev)
>   	return catpt_suspend(dev);
>   }
>   
> -static int __maybe_unused catpt_runtime_resume(struct device *dev)
> +static int catpt_runtime_resume(struct device *dev)
>   {
>   	return catpt_resume(dev);
>   }
>   
>   static const struct dev_pm_ops catpt_dev_pm = {
> -	SET_SYSTEM_SLEEP_PM_OPS(catpt_suspend, catpt_resume)
> -	SET_RUNTIME_PM_OPS(catpt_runtime_suspend, catpt_runtime_resume, NULL)
> +	SYSTEM_SLEEP_PM_OPS(catpt_suspend, catpt_resume)
> +	RUNTIME_PM_OPS(catpt_runtime_suspend, catpt_runtime_resume, NULL)
>   };
>   
>   /* machine board owned by CATPT is removed with this hook */
> @@ -378,7 +378,7 @@ static struct platform_driver catpt_acpi_driver = {
>   	.driver = {
>   		.name = "intel_catpt",
>   		.acpi_match_table = catpt_ids,
> -		.pm = &catpt_dev_pm,
> +		.pm = pm_ptr(&catpt_dev_pm),
>   		.dev_groups = catpt_attr_groups,
>   	},
>   };

