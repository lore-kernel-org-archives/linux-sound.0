Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7009C35E930;
	Mon, 22 Jun 2026 07:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782113750; cv=fail; b=fIOJ3w+FWgklfRJbdwORhP85KXBBiSda9A9vVFjwvTUlVMtBiPta8+/IQymBuuDu9rktO5nI6O4WIhfneNB02k0L2v6QrD82rKoJ1T1Ewa3SRXTS2/R6L+Y/909zw9xguc2muv4RTN/2RKRTl7kG+sDtk/zL32VjXyhiWKUxXP0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782113750; c=relaxed/simple;
	bh=ZfSGpGRmFoLpOTLUVrSPDB0DSV8ScWYTmbgVkFNYYhk=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MbyB/V2OG/itCNLBpzqWjkWmBojRS4TorX/IFhcktmESACv7aolu1kTjVzn4CJIql9TCybQclDm5vNzi1orDHor4TpdWhKQzBUUFpwbzNHLon+0tXXLwCd+2iyC72JrtC7e4D6AGHNz/J0XS5j4rSrnWSNIeyib9XRS3qY8iBE8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GEJ9zr9C; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GEJ9zr9C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782113749; x=1813649749;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ZfSGpGRmFoLpOTLUVrSPDB0DSV8ScWYTmbgVkFNYYhk=;
  b=GEJ9zr9C6/sFmtecFxE1iVfVPp3OY0ObpWvnlBEs5oqAxkz1Z4WPRAOq
   srSnvL+E8ILt0B7fojKvHoWGqOrf6DqfdDqgeY9kghumY9rUzVLHXmCmk
   2gutrNLIHeIpTYUyKMbQbkZsOY2xp2BonqyQbb1BzYrG7fMN3YJxx3pAG
   SjE9mnIAJYI6i2xFhx0y/G0jBaTn7pSIq63zMdN8PDYaNmx88i3sAcSrR
   qKSC9UhO1sISdcAJQT2nmaPmotabiUZqC/eGyfkPeoG0y72W4+UfFRaIS
   YP/g2fI5H+N9LC8UFCiWP7DPhEJPMdM1htNvgy8KNHRtrw60ajQ6rKRBv
   w==;
X-CSE-ConnectionGUID: fP0YNR/mTEmdfpWGUGKNjg==
X-CSE-MsgGUID: pSkZh992REyloCr9oGTPmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="100267494"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="100267494"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 00:35:49 -0700
X-CSE-ConnectionGUID: JtEYZsbaQYW8LeX0tc7vxw==
X-CSE-MsgGUID: zJ+V2Z2AQ/WijTHU4X7baQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="279350190"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 00:35:50 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 22 Jun 2026 00:35:48 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 22 Jun 2026 00:35:48 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.12) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 22 Jun 2026 00:35:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iEMVLC+zX8oCRCf/k4vT8u8dvFVsZZm4U3p18BysUBf6EZRswTM/KlhEkIxCsME3RMj26eAVpP5U0UObEj+vmHI26WcEbVTNEgGC6X3xqajjSYd0WTUe38lNZ121bw1MJu36MJDBZVNpGMHFUljtlfWlZtapxRjccn0KJSd41Ncc1uXwQOpQSzziEVsEK0TtTSWfEpQWtiClppnDB6+D+mwt6HMZfOdpqfJJ1Wivn4JbRF7692tOoQE5EX88itXI5st+O8mBLZq2Q2bUpAb3j8z4Js2ZBb51r4tnTJmE1eOYTklx9ZLFzUk7/5Spbg6/0K3WAXGSHfojenfnqDpumQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8kQrzVxP1IV3x1ALRI/KPm+ae14Lm6r2WwlDndp3gWU=;
 b=Z1csvS+w+JBrwQDSB6Atxd5sfyUrCyhOixC2tR7tgZLNiTl8QrP3OGwomyZAOZvfPNSFSkjtL7I304W4R7hFxPGm7NCvxpCJI9iff/EcrNUcd2DDaA/v8WIPYPYrwIIkAgWbcabKM7/W5pn0gtVAD4G4RAG6bUl/SZjxUwF3ZcuiEm9R4Bu1WCvjztMgS/5tWta96WxI9yXBlan8Kfkfr2xqNxvZEJ5v+Z80xqkkV02YX91IJ1KSyNdbOf6GnSNqMmMSNiIMAp4b8IOK3iNAh2V/FXaTyNHTNLsvkkttKSaC9VFevgV3T8J3nVU21yqBfa4Xir7qI4AH3BkMS5YSVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by SJ5PPFC35D45AFD.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::853) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Mon, 22 Jun
 2026 07:35:39 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%4]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 07:35:39 +0000
Message-ID: <dc0e04f9-c43e-417c-b92b-c1db1d201e5d@intel.com>
Date: Mon, 22 Jun 2026 09:35:32 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] ASoC: Intel: atom: Use scoped_guard() for scoped
 locking
To: <phucduc.bui@gmail.com>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Peter
 Ujfalusi" <peter.ujfalusi@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>, "Liam
 Girdwood" <liam.r.girdwood@linux.intel.com>
References: <20260618110649.227062-1-phucduc.bui@gmail.com>
 <20260618110649.227062-4-phucduc.bui@gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260618110649.227062-4-phucduc.bui@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P189CA0035.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::48) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|SJ5PPFC35D45AFD:EE_
X-MS-Office365-Filtering-Correlation-Id: 63ac21e6-b1ac-4900-d974-08ded030db57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|23010399003|376014|18002099003|22082099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: 3uUyH19Td3xK7H7N8O0gentw+oGAHeZes//a8UmFKskv9zEx34iG2Hje81inowqkQ2G+Kgho+hJxmRkIxti7DhrusPE4kJHBz8iJK15MVd7VKmGk+5pwi8RCvwXZGjTZcv/rTtvGgJc5VmxosVxYGJmO/kGTznlfNuEcqd3vMzLCNNgaepjKzMYNolKggQrjMJKelZevIGHJmaHHUN03o2+hoz5yh/zicfpeJ/ZaLKLwZvv3yeeZVwgrSo26XaRMyVbtxnNQBw4L04vgsXLKvuiKTJLonmEVfi+njJgst/tDZqbhuJgaoMz/tDqhqWJPDA/+e7A4vTG/sb6abk5dnl5qmCPDtywJPgpnTKodwtn+4JriVLOJcv5Okz1ccsK04XpxH11NvpWFNo+x06Q2CBcJhuTa+b+Fl7RLqjnV1vIpL4gDUzO1IpVYsX0CSfZZvMUtqpX/q++9Y+2/riVn2uGAUx3ujPlX6UwXWuFV1kOmCbfXvQRx9SgMF4uESfvqljBoni7ebewI9LZnX4WtP4LM528D4HU1pihkM6/OoopWjKQZe5WZDBMiVRay7jsVFCBxJJ4IGit8PlAELMqOah24kDhRSTg/8zjpzxb3jMpA9wuaPAitIJrRdta5KBtJ4yL9DRKPBOCC8504hXYIkCFYkRRnkAdK7j8mR17SDCk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(23010399003)(376014)(18002099003)(22082099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eS9QeVpqOUI5ZGh5WVJBeVA5K0NhcHlkYlowMEVQcE9UaW5NRGtPQWNETlRa?=
 =?utf-8?B?aytXWGpGVitHRnd3UnhDS3IwRWVVdThWbTh4TklaUUo0T3RuUEFlMEgrT01E?=
 =?utf-8?B?VkNnNlZFaFFGbGxpN0I0MEdBTDFNMWpWTXlzeEcyRTRFTDFLZ0JseG9iOU5k?=
 =?utf-8?B?UjA5OHI4VCsyZ2lScHVVTndHbGRvZDJkbWcvcFpNaXE5V0g4Z2xpTnRhVUc1?=
 =?utf-8?B?OTlPeVlJYkZSRW5rWjNNVmovb0RnMjg0VGdWS3F3ZEQvOTZPR0hwa3dLeGdQ?=
 =?utf-8?B?alRTeWtDbG5IRktmeVJJMW45aFpaUGxBNWh4OFBPaDlNZk9pNTI1TXZyNy9l?=
 =?utf-8?B?bFluWlRZazZWV1ZwYzJkUGpRMlIwdVBwSitBRzRJQ2p4Z0R1ZkxmZHpTajVH?=
 =?utf-8?B?Q3lYQ3UzeGFWSnR3UXY5a1BEa1JyVTFLRTdFZk9CdHVvYWZraTA5Y1JDRG1n?=
 =?utf-8?B?M2VqSWNsTlJCWTVzUitweGx0bU52aFRXdENTUnhBVFkyRGE1VFFyaGN0K3BJ?=
 =?utf-8?B?VllHbWZObFQvZDNab2U4ZzhLMHRoSVpNMmdOaHkzaExiZGVUM0VURk5KVXUx?=
 =?utf-8?B?VlVpQk9aS2hKYUJxT2ZoWjVNMjdBcjBENGlWNUorL3IvaDREeGszOW1GSHFL?=
 =?utf-8?B?dE5tb0YyV3g2eWZMcVVwMkc2Rnl3U2tjRlE3RWYvWDVnRXNRSUVPaFk0VGZS?=
 =?utf-8?B?RldKV3d4cWphcGFiUlBYODE3T3NmQ1NTVmVhVHIzN0kveWRFTlR6ZVY3dlp4?=
 =?utf-8?B?aWRVZFVIbHBaTkI0RkRTeS8zeXRDZVlRQnFXa1JqNkl2T1JMaktod253N2FS?=
 =?utf-8?B?dXF6NkZJUGtQQXljcUZFcHlkTFRlV0FUWHg1ckcyakFjOFUvcDYvVXpyL2JJ?=
 =?utf-8?B?N3BPNGRUOTRSbmd5V3BVdjZTSGF1UmdESSttSWs0U2NxSTBXY0drM0pFV2NY?=
 =?utf-8?B?L0xOdEk3OFR1VUJRVDRZc1BzRXVkN1IzQWpDWFpWdTM4ak1ib0RrcHYxdG96?=
 =?utf-8?B?Q3NsaDBXZVhqMTd0RTEvclZXU1VpZHNlOFQrdzdZeEQ0VGw4R3EzZzFwMnpp?=
 =?utf-8?B?cWpoSmNHTGRuMGE1ald6Rm1FMnZGdGo0bzNDR055U1hPaDBiRWIrUkxhcUMz?=
 =?utf-8?B?R1gzTmVOck5yaXZtV2o3MEtWLzZDRGNpMHBjTThLdHZQWTBXL2hGQWJWcS8x?=
 =?utf-8?B?aXRKclhsenFybUJiTFp2dGxsU3FwTmJLbk5iRU1hUGFTTWhtRitsL3VnZEdj?=
 =?utf-8?B?Rzl3U3VreEhxVDZuZHhVNVJXZDlMbzF4RlEzSWFzYmdicUpwVFFDeVlCMDZq?=
 =?utf-8?B?Q0RVS1RqN3JaS0o2dXY5enlLVXhxelNQTitWQzZuTnhXV2s3VTNET1ZHZnFj?=
 =?utf-8?B?dFpIaDFlcFJpSjR0d3FZbDhROHJjcVAyMWYwbVVVa0xjTmFpNGlFcWl0Um81?=
 =?utf-8?B?MFhYMFZTSTdwVmtOSnIzZG5sdjJrODU2NTI0T0Y3Znc5YzdUK2xDNFpjbnFV?=
 =?utf-8?B?dXl3YytXZWJUWllkQXJOUFRwM2lhS1lBTHJSd0lTNlkzOW10aEZSaFhHZGwx?=
 =?utf-8?B?Uk1YUGZNSDhsN1cwbnEyYVB5NEdhMGNtei9BOXFncTRhajQ5MlQvUTc1UUND?=
 =?utf-8?B?K0Y3YzJ6eExVNVFjTFVONTRjRTZmV2VBUWdUMitSOWM0VVpqWEVZN1RWaDBD?=
 =?utf-8?B?UTNvem41R05HSHJLaFlPVC82b1NnTjdXNWxieU1sYktjSFErdWl2bUUwQjhE?=
 =?utf-8?B?Tm5WdXpuZGlDR3BGSFJ4Uy84UEtQdUhuRmdsOGdKSGZ3dFdqaGRzVTRtY2dN?=
 =?utf-8?B?N1B3M1ovZ1FaOGpDUHRRUVl5NFU2QmJ5VW9jbEloWHdDcnAyb0k1Si9qZTA1?=
 =?utf-8?B?NnVnRjk5ZWU1NGtKRi9tb2liYkF4ZW9GUWRIcVlTR0tObUk2bnl3WWk2UW55?=
 =?utf-8?B?S25LaVROTEJ4V0Qydk9JZ3NSamdCLy9aa1hEa3BjbDZnUWtsVXhKc0lCeDZS?=
 =?utf-8?B?TkJ5Nmhjd3NqZjR0QnJZU1VpdDBjaHhWemE4NnFrUGV1TlV3RHZrQ0tPdTJ6?=
 =?utf-8?B?SndnNnc0NGErOGJ0LzM1WlNlanp4T1NJem1tTXJROHU1bHc4dm9zaEtUMzY2?=
 =?utf-8?B?ZGticTdUcnNvL3R3TVJiN0FTTEtuR2h2czMzay84Y3kwaElNWGcrcVBzSzlt?=
 =?utf-8?B?Uml0dlBBOGZ1OG55T3pXVmJ6WHFrVlZWMzZWdlI5VXRaSWJnWi9PeDk2eUIz?=
 =?utf-8?B?WGZjc20rMnJPOGZJTnNzRzhyT011enhOb1pROWNLdEE5dXRHZTdacGdSL2hY?=
 =?utf-8?B?Vm5XSTg0ekpYWFFMZmhGVEJqRVgrNVV1ZUMxQS9aYTd6blBxQWtNa1VIMU1B?=
 =?utf-8?Q?kAWnXmZBMMTPosrY=3D?=
X-Exchange-RoutingPolicyChecked: neRFnReDOI8b3/yEtiNb4gCaiZNOde9EJ23aMREHoW0EWwH4PvJMBgl35YMGa6zyAOjy8chFA4H4NrgBdiiPdXN0KkZSofg5JT2oBxZ8SqOPEItAAkwbw1Bw0xcDv3cAm+ropuuD8R5Cl8l4V79FAvdRoXcoc0GfJrXYjmu9LsIHJUWJ6klfdaUbdz/j+lNKTtQC09e3n16YGHRi44YLmw3/YoG+dtz4skIT6y+NJ8+lF/fEjZ3vwWXKq16qQGkTb4sw5/pS8WJ4NcdeAfNl6A1fRqu6OYx5kYDRVJCmf97RmpwUWuZFWfSs1iPqxtDrzyWI8UfDwYPxN09aqy4RhA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 63ac21e6-b1ac-4900-d974-08ded030db57
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 07:35:39.1728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IjFJz+t4t5Lpmxa0faFTuGrFJSuXoiz7fJDWFaVWruRaxPMi7u2yVI5q6oi0nMhj7dFRT1A3QZBG2EbXHSJSsL5PAVseqw0S2nSUi7C+wog=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFC35D45AFD
X-OriginatorOrg: intel.com

On 6/18/2026 1:06 PM, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Convert mutex-protected sections to scoped_guard() helpers and
> simplify cleanup paths. Also use __free(kfree) for the temporary
> stream pointer in sst_media_open().
> 
> No functional change intended.

...

> diff --git a/sound/soc/intel/atom/sst-mfld-platform-pcm.c b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
> index f074af2499c8..ce2814e206e1 100644
> --- a/sound/soc/intel/atom/sst-mfld-platform-pcm.c
> +++ b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
> @@ -304,7 +304,7 @@ static int sst_media_open(struct snd_pcm_substream *substream,
>   {
>   	int ret_val = 0;
>   	struct snd_pcm_runtime *runtime = substream->runtime;
> -	struct sst_runtime_stream *stream;
> +	struct sst_runtime_stream *stream __free(kfree) = NULL;

No mixing of cleanup classes.  Cleaning locking != cleaning pointers.
One action per patch.

...

> @@ -347,13 +346,10 @@ static int sst_media_open(struct snd_pcm_substream *substream,
>   	snd_pcm_hw_constraint_step(substream->runtime, 0,
>   			   SNDRV_PCM_HW_PARAM_PERIODS, 2);
>   
> +	stream = NULL;
> +

Is this needed?  If you believe so, then I'd rather see it placed 
immediately after any operation that could cause the variable to leave 
the scope.

>   	return snd_pcm_hw_constraint_integer(runtime,
>   			 SNDRV_PCM_HW_PARAM_PERIODS);
> -out_ops:
> -	mutex_unlock(&sst_lock);
> -out_power_up:
> -	kfree(stream);
> -	return ret_val;
>   }
>   
>   static void sst_media_close(struct snd_pcm_substream *substream,

