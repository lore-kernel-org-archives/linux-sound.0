Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D70C3CDBB5;
	Wed, 15 Jul 2026 08:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784105975; cv=fail; b=Xly0em58BIwx2LXSEtaBHChDb9mXSWkVamjijR24oKdTpC+bIbMPkDFocQzQkjqQefjXmnv6/zLLa4OX0cC9BH/QEAZ+UuPcfTWkYISIXQBAImjYbKVcaUN3d+YGkxhqPltqquebtU1lC2uB+MUggr9+PBjdbOT4l/r0dADKEAg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784105975; c=relaxed/simple;
	bh=fd6tCoyIMmlyYVZJYFOSR9RcmgW4mcazFMlwDLXiPXc=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HRWbL80JacyzPTLy3QpT59a3QWFci7SAMkCrrVvMHgpywxOoQCSUyfgSmjiXBPjwg+EDWp6uiWj64Dsxgn7FJfNQ+Dd/DeRXZ8uXCBrXStMWlgsKgbl+TB/JVJKBDQ/fpgfaYzSjX5zRjecWzPPAYdMM+inAGsViMnsBqIFn2hs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=njeITmxK; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="njeITmxK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784105973; x=1815641973;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=fd6tCoyIMmlyYVZJYFOSR9RcmgW4mcazFMlwDLXiPXc=;
  b=njeITmxKRYdVHiNs4VGpHQy0p9GaYblZU6bw9BAxlICHe0QaS23lE6tz
   anRtUBYxV2ZdWTXKHDJduUjP3rPhi7tVxLbiIYkqOZwqq5fZFWn6l2+NZ
   BmE0vxymvjcrX6n13SJBZbXrw8MwdQwgOFMuPZaGUguPUkcABVfvvoC4S
   rN8RWndZozti1mOMmv+7a08S0s86mW/7d4CKMN3SfD1V7qlS4y2/idUqz
   F8klbuAQGlOAt/nzAryl1FtvrbmTzniAd9q2A5283SjEslsbUEU4WSIc5
   31y4E1gVNZ+wLUkixN3YG0mbrpfbonL6IAedcHjfEh/gb0yIVUgoG3KAT
   Q==;
X-CSE-ConnectionGUID: D36lHwXySOmHhriFxJdiyQ==
X-CSE-MsgGUID: mru7x8lNQNWhHqSptc4uvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84933438"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="84933438"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 01:59:32 -0700
X-CSE-ConnectionGUID: 85eSlDhhQ/2osjP/M1gFWg==
X-CSE-MsgGUID: nIWT1lYATVOx1cAJhD88Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="280552566"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 01:59:32 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 01:59:31 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 15 Jul 2026 01:59:31 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.53) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 01:59:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CcIQO2EyngP+ZNs8MeSVjgVRXGs4iV3iksiJaIJjN8R1Vgtr1+NitbrHhWxmFN2uf3Uzx1D1B0GpbO5C1/c6IalJpZOJBuff0rtvmcKfhm5q1paCEhz1ZiacD7sVkuQoqhRKUNoLO42CNHkD/GJ+HuuAwKM1FzWBGiI4xPy/pBOUr0TNIOT4JQMTYkUcuc2loisqNgZvSBxCgLY2dHR4LhLei2ODE6ltiqy243IrwRuCASBs5VQtBOFzeeqJokYtctYZDaleN+4KwGmFOEN7D18k27Bbw4vKouWc0kqSRYW0xDZ0SHd+7XVGeQaVC3xLm35U0nMk82I1Mhs/64WdVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6eCL52G7mhZ2IHcHnYa7DqrYEtQG2MX4cu2vjOJ0dlM=;
 b=Y0yDmnKyya/f20aAR7G09GWTBS0HnQs/+KEqsBVrhx/H3OUsgl+vuGzhTiRZ7iqTvumcuyO722QxNA4H2VGiSSuylJ4F9KZLVTcYW8fUW4prQcynyX2T+8gIru0Wy26JLxLOYEGmFJOha6ERT2hWwXQzJptAhICSzCd/7PuB3nfX1tUDhpJteP3EQlpw2wEWVwUW6Dca/MCPCy4qtDfqv1GWTDAMThb71V8oSkW6GNHBjp6oUMDyRnAtBiq0w1vyqgHVfo73hT77PtdAY/gDwy8YH0B905ctOFdmUVHsLJKT6nWZsJffHnSxRwA/0MOV/uvDVmDpl3lIyapjHYRj1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by IA1PR11MB7677.namprd11.prod.outlook.com (2603:10b6:208:3fd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Wed, 15 Jul
 2026 08:59:26 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%3]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 08:59:26 +0000
Message-ID: <03980ec0-b96a-4df6-8458-d11bf3f2e384@intel.com>
Date: Wed, 15 Jul 2026 10:59:21 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: Intel: avs: validate configuration TLV bounds
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
CC: Bard Liao <yung-chuan.liao@linux.intel.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, Mark Brown <broonie@kernel.org>, "Jaroslav
 Kysela" <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Liam Girdwood
	<liam.r.girdwood@linux.intel.com>, Peter Ujfalusi
	<peter.ujfalusi@linux.intel.com>
References: <20260715083340.24372-1-pengpeng@iscas.ac.cn>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260715083340.24372-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VE1PR03CA0038.eurprd03.prod.outlook.com
 (2603:10a6:803:118::27) To PH7PR11MB6978.namprd11.prod.outlook.com
 (2603:10b6:510:206::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|IA1PR11MB7677:EE_
X-MS-Office365-Filtering-Correlation-Id: 97eba27a-6977-42fb-b4f1-08dee24f5f0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|7416014|22082099003|18002099003|56012099006|5023799004|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: 7VC9Yamuy4043k0csFPIPpeDNohmTUSZp3jBSX4l086PsA1wIj861e0B6g8GOZvys2xDwld8LXpfUXoLuecSYqQOJmJUBQWSAABGdpp2+cHBGr3mtKHg4mXXqgIEZ6Y96qCxNsTq8PpSb4RCGN20m8joaClrVPQSwJtFkz/h76/assKcp+ymfK4eHBV0OYaNSGxVu11+89rHO+fdN04BF5ft5DMXmis4rSayjhP6Ohmbt5Wqotk6Eqavurom83/rnrpjyr6jx0c/STvKXggsAWrdzDMAqVLc9BcruVrcNkTmDUyEtez9yrj9bDFAIV7TftTFXNpiTf9P/Y8MQlt4nXDRQg+aqvJ/RaaJXJGB6MSQqg35brekm8JYhUT0B2t7iyucxKgZ8hSqjZsOwKIsblN89c/Yvyqn2gtQjcK/MvsyREGIS35jGWTl85+A+MrXo9v0O/YsrhCp35rUSWsyH1i0y3rpt9cBEWV8Sm1roiZIDfVc0MsTYlBc7BNWibsXGBpUyrdU1+LkWECdC2qq8FaT+WVKUIfu5QySkz7KoSU/Cn4gORx+n4TgOtH3V0j4GhlegPJdiR788GwtizVg7+1Y96qom8tnwdHleu/gu6FeB/zpzTwa3DQGYZCABpF9hUo4YQp52kDQnwi09Am2TB98jJBDX3o1piqtbqX2NCI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(7416014)(22082099003)(18002099003)(56012099006)(5023799004)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cU43cWZEbVdXYktUaUJNKzZrNTIzejBBYXdGL2hIRXBMcHRITXo4SGNMRHda?=
 =?utf-8?B?R0duY2lsWTNwYy9HeHVQczg2SnkvU3ExQThaK2ZwSFQxcHJpZVFaMDZZbkNC?=
 =?utf-8?B?TWZoZENadXpTVjRGc0lsdkFWSlBYVUZwTXlkQ3VuV3psbTJ1dGEzUnV0eG1x?=
 =?utf-8?B?Sy82YzhLNU93MXJwTFhOOWFoSmNXNzVPQ3lKNmwxRnJuOW80eVgyYzJWVGVv?=
 =?utf-8?B?V05LSkQwTldmekZENlZRK1FhTUh3TEVvTHlSMVVjbmo5aEZTd3JLYXZqZ0Zn?=
 =?utf-8?B?VHlVSmRZZDQwR04zSVdjYU9EQmpyRFkzeFhsSkVGU2FQVytOQkZudnIvQlRT?=
 =?utf-8?B?M3lsTVdhV2VLK2lSSVl4ajRIU2tTbWhidFVmblJJSkQ1OW5IRExWYXhrbUZR?=
 =?utf-8?B?UTEwRUJ4bmZETU1KR3UrSXZ6MW1ITnhaSmtjZ01MTzgwd3daNitweE85U09I?=
 =?utf-8?B?czFJVXBrMFFRTFBLY2dlbU02R0p3aG11U0FXZWdCTGpTTXJFVWF5ZE9mNVBz?=
 =?utf-8?B?YnZxUDdDOUxkMnVVSGZSam1lS05IQ2drdkdJR3Z2Wko4ODRyQTUvcjRoUFhJ?=
 =?utf-8?B?TFg0aW9ONElOZ3d6OG9RYktEc0R5ZGJJSFUvMUpHWjFpTGVIcG9Dc1ZLcWZR?=
 =?utf-8?B?OTNTTHhBek40T2RXUkFacXZDMnBMRXg1NXZ0MThMWUJzOGU2Y1dmbEN2cXYv?=
 =?utf-8?B?S2cyYUhwUi9HcERidDVqR0ZtVDltU3lnSFRJVWdaQ0ZHZjVCVFV2ajZNL3A2?=
 =?utf-8?B?OWVEWHo0dCsyVzFlOFhabDNOSUpVUkJLSVF5a2VMZ2lhc3REbU93aVQyZnFK?=
 =?utf-8?B?SDhiTDIxZStCZWNueXRWNEh0MEF5bDhHL3RMWUNndzVhOGlNUG1zdmtTL2Rh?=
 =?utf-8?B?OTI3L0gremw5RGlJaGtTSi83bVpHTmtLN1FQdUpYYkYrV3dLN0hzL0hTc1Yr?=
 =?utf-8?B?emI5ckdSenJlYTJ1NFVHUGI0d2tvRTVRNXR2R3VPWGQwMU45K1ppSXpXTTNI?=
 =?utf-8?B?UGtZb0dVdWIya1VMek5tMGhPczlXWjVuWllQcXRCdit5K3BZYnZCVHhFbXBW?=
 =?utf-8?B?UitDam5tYVBtQUxNVGw4NGQweUV4NWlTcjNuZDk2dEZvaFZDK2ZUai9aTHEy?=
 =?utf-8?B?ak10QTNiUDZ6OW5XcEIyMHFQMldYa2ZVTDFJc1F3SGJybDZvcGFMUXFtd2ti?=
 =?utf-8?B?dUhiaHNKaHlRT0hLNG8rRlNXVEk4RTltWmxIejB3MFQwNmtJSDZyc1ViMHR5?=
 =?utf-8?B?SE1Xc0tPSy9JMWFlMzkwZUZ2aWs1U284dndvTy9RM2MxWjNrWmoxbWcwd24w?=
 =?utf-8?B?SGdEOVYwSXppY3FRQ2lvNjBxa1JQYXZCa3RWaUE2Vjl3RGFhdXErd1d0Q0gz?=
 =?utf-8?B?UUp4eUQzSmVZRTg3dE81d25ZYTFwa1JGdml0WEVnWnIrNUxoSG5ENG1CbFQx?=
 =?utf-8?B?MVpPVVQ0bXBYQjNobS9uSWN0bkxqVnR2MWEzc1lVeDY2RU5VbSs2eUdzSkZ5?=
 =?utf-8?B?b1NSTElOOHk0WXR5NEZoTzVkeVFxTkZ5WjdWOTlBTXBxaE5IQUdMUXhBS2N3?=
 =?utf-8?B?U09IYVJZMzJlelNBa1ZpZnBMWHJmaE5CV2orTzQzRCszUXU1TmJqUFI5cmsx?=
 =?utf-8?B?a01tdFVBNjdXMUlnMmdCQ0NjeVNjRFdiRkJieXVzSUFJNDh1aEVBYjZoKzB6?=
 =?utf-8?B?a2hGazVsUTlvcUxENitBODRkQWpleDgyTWhscHdlUzgvcFR0Rk1aT0gxN0Nz?=
 =?utf-8?B?VGtNNGEyR3Q5YmRueXlyeFZKVHd5ZU03NTFJWkVTRXhMUWhIMmdIbjRlSHpI?=
 =?utf-8?B?RzNWc2ZQbHVvNVZUOExXdmJwVlJJTUlIQnVlMFlWaG1Zc3lRYUN6a1JGaVov?=
 =?utf-8?B?Rk15TUhRZGVWRkgxSXc2QmdFUGNSZ3MzQ2E1eU1YYTJsdWcxdlVSUkFMN0FR?=
 =?utf-8?B?WjFjNXhHRU5mcGpReWFoMVhCc24rbkFkRlEwSUR0M3hBeW1QeWVTVWNVNHdv?=
 =?utf-8?B?alUrZnloRUU2clIwWjJpYURUSHJXU3ZLKy9GcHcwTHYxbGwxallIbWpjaitL?=
 =?utf-8?B?R1pKYklFdWhmSXUvOFcrYVVkUHY4MlJEZlRWVitBWE9UMEdmNm4yMi9WVHha?=
 =?utf-8?B?bFBwemsxODU4UVRzS0lwMWpncmlRVzBFOWNPcWtIRmNsWHlpNCtCdFpneTZh?=
 =?utf-8?B?cEh1RUdGcXpCcWtWTCswUktQNDlFcjBpSlE2OStRbk0wTjVjTmhDUUY2RHQx?=
 =?utf-8?B?RlFmenRvY3R6bDA1MkhvSHhXemg5bDYyb1hoa21HUjlQOFRhbDdyUkVuZmc2?=
 =?utf-8?B?NFZUL3FmSnNwNGpROWNLUnFka3lqM3J6em4rOEZzeFF5WnVoNklvRG1NMkJ6?=
 =?utf-8?Q?hKxYUSpGYxzPVpBs=3D?=
X-Exchange-RoutingPolicyChecked: RrJdwcSplUYp2UulC/HKR5aSt+OTvu8tIpFugHzeIbv6T2crMAfS6G2YjLaQ9ee1B2dWKTOsyApeddoVjgQpkpV5UWL+07zv05KV/6Ru/iiH4WlrbrlXBkTLlyd5kIhg1C+ELDBaaXA+gA5lz78Mg847kUrJYa8HvMFuS3hyP5nJhXdcpQhRX/TNkKxJ3emYYFJNsKcNencReVFqKVxhE68buAm/srujtCnscglzMP1esz65b3Z41+TIvNvQNcEW5YlqqdUlGWo/YeRF+XJt434NqeohgZlmEEEcuEoo8RLHCMTPuXoPG4P/jj+TuElVqC+U/u3A5ogEl7YR/Ju4xA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 97eba27a-6977-42fb-b4f1-08dee24f5f0d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6978.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 08:59:26.5418
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: swi/hNtUbVuWPQotMpRJ8e60XsnWLbw1eHs/HGGuNjJOKovXXu5dwAJ23UMkrk0ZYJJghmdN+P/FXYxe4iblGDbIG8q5Kd3CrkwayZ00yrA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7677
X-OriginatorOrg: intel.com

On 7/15/2026 10:33 AM, Pengpeng Hou wrote:
> Firmware and hardware configuration replies are parsed as a sequence of
> TLVs. The walkers only check that the complete reply is non-empty before
> casting the current offset to struct avs_tlv, reading its header, and
> consuming type-specific values. A short header or a declared value that
> extends past the reply can therefore be consumed as part of the current
> item.
> 
> Validate the fixed TLV header and the declared value span before dispatch.
> Also require the value space used by the selected type: firmware version
> copies need the complete version structure, scalar configuration values
> need one u32, and I2S capabilities need their two-word prefix plus all
> declared controller addresses.

Hello Pengpeng,

I understand where are you coming from but there is no reason for such 
defense - as per Intel audio driver architecture, firmware is the root 
of trust.  If one breaches the verification mechanism, the TLVs are the 
least of our problems.

At the same time, struct avs_tlv is no different from any TLV in the 
kernel so I'd rather see the functions you're adding here applied to the 
kernel/ or drivers/base or other common location, not hidden within 
sound/soc/intel/avs/.

TLDR: NAK

Kind regards,
Czarek
