Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA4C378803
	for <linux-sound@vger.kernel.org>; Thu, 21 May 2026 14:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779374475; cv=fail; b=X6vYJ21f0yhy6+BlPIaZ32qzlj4CkmzQBTPUAycwmxgSq90I05kVhAjMRVObqSouhu+cspNEWGyKwUqWdWojkjU2YvIbshIY7T5JlOW+GqNmABv9Qz2IoxzEiyTz1JBuDMd5WS6yoighCwfH1mUeLEVtKW1/MxgZPHpP560CKYw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779374475; c=relaxed/simple;
	bh=88q1jSPIP5DCkopdCOApKNnL8pF7qCM66NoDitDSy9k=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JGSg8KuSh9zYHgF5Otv8Yx/XDwDNzlKp76Fj3KnhzGPbrq6SminjsQT4UJ5bVdJqafAh/6MPZHVGN9Aa6BRwd1m76pqPdLepQN+kiJsRD7eqQOJ0pyRGA7O0bOp8X1HeYfsJoeTeZvqOFpr02pXxlECBPYZN9uamr8AyEOHpozE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VijqeOl4; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VijqeOl4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779374474; x=1810910474;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=88q1jSPIP5DCkopdCOApKNnL8pF7qCM66NoDitDSy9k=;
  b=VijqeOl4znZArIObaujBd3sDt95Hb8+hB2EYSk9x4gyjkNLX9Br5iZxt
   CJtoWtPZoplaVKt3AscA1Ln4nuN3xbODdrEwqd4o0tIbUTi2ljtC3Cq6y
   zISh5CnH5I0PzvMfwl5uqcrjpqvRXJkfjgHddc8llvN3wfaUamV1HgpcQ
   sfukejcgraaYYlvbY4vuXTm1zbx/RXFOt/LiGRkT7N43oW8hik1NRozDf
   u6YdIbN9DLfLnBPeYC26Ntuu668E+4fa7y6UgbOtZsAUZFp0Aue01Ab+K
   47yLmnGSbeQb0rY3lY3DYH/brmsvK03Lcj+dk4qGIEffNjZUCamXTOhCe
   w==;
X-CSE-ConnectionGUID: 4t5yUwLyQHKUebgb040vMQ==
X-CSE-MsgGUID: pfG/q76PQHiNBhYHAbtL3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="80147955"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="80147955"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 07:41:13 -0700
X-CSE-ConnectionGUID: WENXLgpxTZuVFNXkQaEZPQ==
X-CSE-MsgGUID: uzhKElsaTRC8hP9HxbnO1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="278652390"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 07:41:12 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 21 May 2026 07:41:11 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 21 May 2026 07:41:11 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.26) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 21 May 2026 07:41:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=igYPgWdGYAV0R4HvkfeR6gKhH92npnhbjQGM3d8c2futr11aY8cYKHussD0d+vGjdicWBI+5bNzD3znW7S8rpQAezzT/me9kDgG5OUl7nxMDdA+oTPXUXswOcqsw+CkJxZXfla1bgA9sxrFwIdmI45f/VwRcr12KhfN8KFNbMmRZWqWXPkuaGEUEq3fHbFYmCiFxytxKxq2yFjjqHvg/8scZRGe9I12OVNUH11EoC3DcpGOOTW3BafUnKwYhddCsuVm/+t56lu+v/B5WYeBx7UC3ZvYXPmpzKUkhNYIaVkOlJs+1yZduxxzgkjBlAxMj0sO25Chik2gWNRTTeqOPkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ge8P2KV0mqaH0ox1u5B89GUwxNPjGkQIndTKVUOVphs=;
 b=BA1jYDr95R2thN2zPlP1kN5h63Lioy3l48Fi0UatjRRzBWxB4G+egtRy0nU/HRVi6Aaj4/EVHiIU/r9zOTsJZKz3sqYA34bc29hY0rN17V1/9ocakHRyswEieZ/V0SYzGzxI7C7vG2PzIIpYN5meOl9mwBaIiAnQB21A2YhGWj3gAM27gZFJ8Uqy2LP9psUMFiWipbSSXPPGYoz64tQft4ZtBOSOe+8XsB/DxY1Q93bRMs5A0i33Peg5NTCwKZR3+NHbDjCyyBykWTA/Dle5TfOnRhB5ho3yMYWQDsKZGQ5h+BDuP/rksloIQzS9hsDB6PucmOtdYFA0IBsHceeaNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by DSWPR11MB9954.namprd11.prod.outlook.com (2603:10b6:8:39d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.16; Thu, 21 May
 2026 14:41:09 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%4]) with mapi id 15.21.0048.016; Thu, 21 May 2026
 14:41:09 +0000
Message-ID: <075c095d-c42f-46cc-98aa-b290f25519d2@intel.com>
Date: Thu, 21 May 2026 16:41:04 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: core: Move all users to deferrable card binding
To: Alexander Stein <alexander.stein@ew.tq-group.com>
CC: <tiwai@suse.com>, <perex@perex.cz>, <amade@asmblr.net>,
	<kuninori.morimoto.gx@renesas.com>, <linux-sound@vger.kernel.org>, Mark Brown
	<broonie@kernel.org>
References: <20260430140752.766130-1-cezary.rojewski@intel.com>
 <3949821.kQq0lBPeGt@steina-w>
 <77942519-5c7b-48ae-a709-6529d0577e98@intel.com>
 <6456213.lOV4Wx5bFT@steina-w>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <6456213.lOV4Wx5bFT@steina-w>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0102CA0074.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:15::15) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|DSWPR11MB9954:EE_
X-MS-Office365-Filtering-Correlation-Id: 24ab3e90-21ea-4564-5185-08deb746ff6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|22082099003|18002099003|56012099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: AFgfKHptTlPdC+S61XBCerc6Lt8G539eKiwZBvCxqNkSaGEVWY/qMlj19imm9N66ABDg9y21SYf77oGgupes6mKsXM9+5wPuqWURKkuzTx9exe5Vy/qjm7lojD7FbFkkGhzm21jfFwr/gAt5j7p9Jd/fdZ+7VEdFQhATJpj9rSwYuFpSlD+nqZI7L2IbisK747g/u+3MItsCT4azLr6V1vs5uzJyI1+j1bXXgXzGulvJGDQD3x9Brp/tyWbcIIfNsVbCRNsU+lQ012vCRaD6o1AeGUO9AyjdYJ6zjqSiOa17DdLK/hg/ki9xPeRHDpyT5O/JAUeeCwAh7RMerwQRE9qdFfJkXISHrqUClxwdENmR29E2EmMIYRmpFKR9nVO4Q4fBq7TFZMRNSMzco02KwqlYSz8GnM5/PeifYk60cJmMB6qGHuPYsZLlyiI+epSjGK2ZZShOyK0A8PmLInRIIq0GI0GZZIegVtS6i7BBOzEX8BbjUx2UfaKD0OsEVHGpJFwSVqKMeDPz7hchJkCjoSCwHIdveCGm7Nmp10NczAPGGfTvAvzgh03CE8ZYcUd/qtjdZAcKl04n0stxNntaw+nK0TJjrgfyi0XdLUYeNbptb+6WHQ0/yrDb0aEEAR9I9NUyMdNcfGmOIxv9HZwxVBWzToWw431I8Myx3qbaXUjV15hu0CsaoQvLL43Hh8Gk
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WkZvRkhjRVowVGNqQm5Pem1oWXY3eFFGZDNwMEJsK0gxc2dlL1h6cVJYdm8z?=
 =?utf-8?B?aC95L2hwV1daQUwzN0VPdkdIMGdOb0xldmo4LzRkSitYRjd1b0EzKzdVeHdt?=
 =?utf-8?B?VUJ4VExQM3JIQUM1L0IzOTljc09SR0pzUEo5bFNUK2lIamtHcGNrMjRXM2hY?=
 =?utf-8?B?RVJIaVRsZzNXVHZBc1ZvWUU2amkyRFZiMFg4MDcvNHJXenQzbTNPN05oRWpR?=
 =?utf-8?B?M2tSS2NxVmlJNDE2eVFqOVFGaU5aSzNMSnFUdVhmZDBjWDhlaEJzL2l6cDBV?=
 =?utf-8?B?UWk4bUhUMVRUZVZMWjZlWUY5OG9LU2JwVHlrUzVUUFZZWXZESkdvYWVTRmFH?=
 =?utf-8?B?VWVXSldlQUZNdnc2NlpIb3VkSCticjl0R0FFd1M1SWl0RVY3MG10YkZWc2Z0?=
 =?utf-8?B?TW9qYWM0YmdNRElRUUVaMk9GUitTYzZvcjhUTE9rY05EQThPM2J5cklIZDhY?=
 =?utf-8?B?dXMrOU8va2tNYkxmMWVmNFJYbDFvVkxTSlErSThXei9HbE44ZjhBVWlOU3lk?=
 =?utf-8?B?d0swVG1VbHYxNmdoOEJKYmFTMmlJNXQwRVp3S2MyUVcwLzFMTHNFV1FZWDlZ?=
 =?utf-8?B?cnptbTllN0E2bS9JRVpNRTM2MkcwcHFWdjhGdW1hNnptcm9PS3h4cUI5YWhP?=
 =?utf-8?B?NStVME9NY001Wk5PN3ZUSHFvb2w1OVdLaW41N0NkTWFybUN5Y0tlei9rWEt5?=
 =?utf-8?B?bGkyOUJ0NW8xUlNxWTF0NzlXN3czWVQ4dndSMkdhTWF6WVF6WUJXcTR5R2h0?=
 =?utf-8?B?MjRyWGFOWVhKNjFOaTUrV2FscmlWcHNqcGQweThBejlubkJVVFlYakdvSGtz?=
 =?utf-8?B?MHFTMEJ2Nnk2RlFrUDBGUXhuK1FlS0xBa0w2Vm0xMU15U2JNS1JSbXZqYk95?=
 =?utf-8?B?aFhCZXZzamJsV2kvWi9GMHNFQjJGeXBqd2R6RnBUMkYxakNxNHVQYlVFYlR2?=
 =?utf-8?B?WFFVZW8zTEtyVERsS0NJN0NxL2lXR09sYnBIUHdGU1hybElZQnZ0aXI4cVNZ?=
 =?utf-8?B?MGxnZVVSMTQxclIyZFJKY1FpNzY1c3pnQmZWb0Y5K211WTNjd1Q3WHk4UlB2?=
 =?utf-8?B?S1BPcFE5QUpMYWZQOEowNUZoeGpmOExDRFVQTDJIc1M3WXBrTndWNlFqYm1L?=
 =?utf-8?B?VHNka0tabmFRR3FTK2xHU3AyMk8xL2NHKytYZ1JlaHZybGFzMnNENjN5a2Z5?=
 =?utf-8?B?RHFCOTMzSklXakZaU3FpYTdlOGVGaU56a3FaUTd6NEhnQ2RLYm9iNlZPK2s5?=
 =?utf-8?B?QlFJblRMUFg2dXJmRDBydUczZkdIWVVOZ28yUU0zWUgrcFkvZFh3ZkJveXgv?=
 =?utf-8?B?amlXQWdvYlFiNzRHWTlsbjd4dXN6bzNFZzVIaGpCOGlYeGVmZ3N0TnpPOWJZ?=
 =?utf-8?B?VXVheitwUUNBcDZjU2ZTMjNuOFE0WkZFZjBGMU11dW11S3hrZzFubjk1Y1JW?=
 =?utf-8?B?bHpRdFJtVUI3Nno4dUkvMzlrcEJUT21aTGMxWVhZK0VGNXhzcWFldWpCblM5?=
 =?utf-8?B?dUlET01ncGtDLzhVZnRCUWRVSVpnNEYxWXdFMnB4YW1sZVNGQm1yYVhTKzJa?=
 =?utf-8?B?NXJ0c2JMdFdaV0RERE5PR1Z5eDYwVGp3dko5b2l1SmlLZE44RlZXdkE3SlV4?=
 =?utf-8?B?TmJWWENoRTlxNEZ3TzV5WDloSFZpZE80TGR2OFpQYVhTazZ6d2QrK0dzbFVo?=
 =?utf-8?B?TURmK0RMOGNCNzRPRWwweWRNcjdEdXIzWHlQZXRUSDNMbUNibHJlWjFiSTZk?=
 =?utf-8?B?TUlCZXZUeDBiZ042K3NCRktWK3Jmd2duaDM0eVNvZjExVUMyQVlockh0OTJP?=
 =?utf-8?B?UjFtVVRrekw4ZUozNGZ1TmVxSTFQdjRMSFhqa3lDQUxnN1BQNEN3eDFUalFi?=
 =?utf-8?B?ZFRhN0g3VVg4WVBYVndFVG9PL2t1UVFUK21RLzNoaE51N0FTR0NjV2RaWWla?=
 =?utf-8?B?WURLQUxLZ2VzQkZEWVA5N01kcmtJNldqb01rOGY0Ky9NaEJyQTc0Q2xkdmNS?=
 =?utf-8?B?VE1FWm13TXdBbUVRbmR0bk1Nc2M5YXNCUEY0RnRuQmhEemxFNnczTWE0MjFU?=
 =?utf-8?B?QTFMcGw3bSt4cHFZK2FxMlhZajdLTE5xdUtwSVBYdm5xNkZIdzhtRmVQclBD?=
 =?utf-8?B?RUxacURDL2U4UEhnNldlcE5OUjFtck5aZFltUEFacC81K21HMVhlbFRFK0hn?=
 =?utf-8?B?ZmFZUnhJZ3dES0RLbHE3L0xIejJUVHhWM3hkVk9kVjNxZU1XWlFSYjlmejFx?=
 =?utf-8?B?MUlMTkpWOHpkMWdxa1dBR2czMm5pY2pmZ0hsTEdkVGVIbXYvQkpqVEZYbVdx?=
 =?utf-8?B?d3kvWmo5WnZRbDIzKzloR2d6S0F2WS9KUStxL3h6bGRCYmtrVjdwcGRWU3Jh?=
 =?utf-8?Q?Vnjj+sZD4wRjNgxg=3D?=
X-Exchange-RoutingPolicyChecked: TxHi82FiyohWdAWX6qpWKGJ+9n4eU4Rd6udamr9OuM1L1SOVButmS1gv5ZrqRx8hlt6wA3zJrncK0inVfsGfdSpgGIArbzhtfSU4ZKqnBW7sVyfk0ts0xF6cWtmDnPzhmyK0vWt7uBy3L3+vx+D4VVUkjtOSupJ4YKrUUrqssiFcclW3lzvL2c7BENKZZriFWsKXVxKIex6Tk1Kflj68tP1cJmwMa3mGW/exYXv/DxxgfP1IIbxCmiUq/AWyJi6jcfDsHt4z02rAjVlaKdcjByNIGFEDRcw0pdfMaJ5XdGXmW9/RZESi7zMnpT0kLG0LQ6RFtxJc/zMxihIyKzutqg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 24ab3e90-21ea-4564-5185-08deb746ff6a
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 14:41:09.5714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C+pDvt7JEqzu/zvhYfXh0BYv8psGbOHEAvAFQSMfvCW9bp9KN98MlHG+bhQus3cAz5FQVwZpuQK+f1J79PTp7Umj0Molmr2KSKmwSBx0QI8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR11MB9954
X-OriginatorOrg: intel.com

On 5/21/2026 12:11 PM, Alexander Stein wrote:
> Am Donnerstag, 21. Mai 2026, 10:13:45 CEST schrieb Cezary Rojewski:

...

>>>> Now, listing the clocks won't help here unfortunately. The patch works
>>>> on the component-level, clock details do not interest it. Also, could
>>>> you specify the scenario? Is just a simple platform boot causing the
>>>> problem -or- do you perform some specific test steps to reproduce?
>>>
>>> There is no specific scenario, just booting the board causes this error
>>> during probe.
>> Thank you for the confirmation.
>>
>> I've forgotten to mention - please also attach the equivalnet but from
>> the system running the previous kernel (one that causes no trouble).
>> Now, would it be possible to receive the excerpts as attachments? The
>> timestamps are also welcome - in the above snapshop, all of them are cut
>> off.
> 
> I stripped the timestamps deliberately, people told me it's just noise.
> But here we go

...
> [   15.360319] tlv320aic32x4 1-0018: ASoC error (-22): at snd_soc_dai_set_sysclk() on tlv320aic32x4-hifi
> [   15.360342] fsl-asoc-card sound: failed to set sysclk in fsl_asoc_card_late_probe
> [   15.360360] fsl-asoc-card sound: ASoC error (-22): at snd_soc_card_late_probe() on tqm-tlv320aic32
> [   15.558546] snd_soc_core:snd_soc_register_dai: hdmi-audio-codec hdmi-audio-codec.1: ASoC: Registered DAI 'i2s-hifi'
The framework' behavior looks just fine. I'll need some additional help 
from your side here.

What does -22 from snd_soc_dai_set_sysclk() actually mean here? The 
codec's ->set_sysclk looks as such:

static int aic32x4_set_dai_sysclk(struct snd_soc_dai *codec_dai,
                                   int clk_id, unsigned int freq, int dir)
{
         struct snd_soc_component *component = codec_dai->component;
         struct clk *mclk;
         struct clk *pll;

         pll = devm_clk_get(component->dev, "pll");
         if (IS_ERR(pll))
                 return PTR_ERR(pll);

         mclk = clk_get_parent(pll);

         return clk_set_rate(mclk, freq);
}

Do we even get here? If so, does -22 is caused by devm_clk_get(), 
clk_get_parent() or clk_set_rate() ?

I'm also up for a call (e.g.: Teams call) to debug the issue. Typically 
such problems arise due to dependency problems between the components 
(e.g.: platform into codec works, the other way around does not) but 
I've only spent an hour or two analyzing fsl <> tlv320aic32x4 stack and 
analyzing dependencies usually takes more than that : )

Kind regards,
Czarek
