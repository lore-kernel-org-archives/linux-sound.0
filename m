Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD2845C6FB;
	Tue,  4 Aug 2026 17:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785865633; cv=fail; b=LtQrOy7pI3O/FbueT3u8R2I6d6rZC62TS0SJ4rP+/bxTFzQNXMybulXfM8fPmdofCKrdVvEJQE5cCu1WvYuu7dvmFq1OgLRJs0+l0jDQm4FJM9qsj5OguhnDxjnHxU9wLCmrdLfrohR1rwfK1/+FRg4XVosJCu02ff/ifd2OthM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785865633; c=relaxed/simple;
	bh=aG3KZhQcOqmcUl/2AZMq/Ey1NkwLE9qjKgAuYLcApcw=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GcGKIqoyumokpBQfiOtFQHumSsTOa0OlypxX8h7hSkv3vf0N4UDJYhf8PMt9rRrEc22GCxxDrhKBOjkB1vDepUmnOQCcrv8SW4mQEheWjqQOoFdTdmE1kBc4AZEXxxO4BAG6PSgg0DMJgnqI7sCxm26QMUxL0ZkfrLQth+vrqCY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RKMB77EO; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RKMB77EO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785865630; x=1817401630;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=aG3KZhQcOqmcUl/2AZMq/Ey1NkwLE9qjKgAuYLcApcw=;
  b=RKMB77EOsN1NwXmzI9L2ph01R8ZBffwrlsqnR3fBUNK6fc32hY0NjvYR
   aI1kzY5y8qwyoF3Y0bWsxk4tJLL4ER1ykfci9nAY5KvEMPZR2iCkfGLh5
   1C8md/hN+s9f6xGSFDxieYfTR3ypT0UbcRoPUYQDtZJlfq7UxvdV9Hswd
   j+OZPQbwMvMXRaiGvgjRcXRyFCNcPUNufkk6AW9P83Vbm8jIj/I7Xn1WR
   /7ncA+TvEUtViYOvsPPZyszvqdrOhGkzQSYlbJdU/d/Z2gNTQ5GrBQ9D/
   Nfs+p435Wtdu/uF1VUJbAm1hyRhDG8D2phy5gxjbpE2f1OFVcheZPe4vd
   A==;
X-CSE-ConnectionGUID: 1ynOu4DXSSWhtTnFl8uGOA==
X-CSE-MsgGUID: PB7nT141S5+qlZmKt183qQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="90236520"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="90236520"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 10:47:09 -0700
X-CSE-ConnectionGUID: W8arqvkMSvSm5R9pxm5cwg==
X-CSE-MsgGUID: +GUp3h5mQtOVWexJvMYHAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="260308636"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 10:47:08 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 10:47:08 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 4 Aug 2026 10:47:08 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.40) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 10:47:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JmjhT4x10PbOtSD0hPZZwFS4VcbBCzd+JM8GHAbyHCnKK2dr/a7gXIPtqTR1LnBdwsI611jNo8Q4VTrvFqrd1Rznz8K2TV8fnx24J3ceANWqHB5d5eSpjURhNqgknnJS6397B+Yt9arpDv3y5mq4t3i4+Gk2+kvYIPt6hF1a/LeiJYtaV4GyZS70VnMD4JTsACygTMNtQnFFM31UuBh9HshnVLR5vnFum4t0HuTsMnmVWnaYN8j8HI4j+bG4UoaQehw2Rx2b5Ndju3/oJAHf56mcY9+0qY2Hg7rMgpCCFnGhPOxMZ+Fa05WS3sXx0E2PODlm2QihQdzgScCoCGU0Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pw9DMQQ33/7y2ajz5wGHL+8u0taUv+1DKMlyUWJLAeM=;
 b=MxIrmUVXMU4KwywUN8PA1eDapVuWwJZdVj0LzdgxOHZ1mP6sljqn3hew+/xt4e3yORpHq6c+gCLD+cVyrV437n8kKN0iOWsqSz9j91WS1gU+E90M7LxvU2hzeJuVRa2EejSYEmNjow+GEWjRaJeDwlIPxPbolbSWi6g9qkrC0Bcgs//9hkYhzGaX6BwI2mWhl3acC1hKwdS+ssrkM/Xr3n7CN+ApBpZiL9nwhyOhp1AcriywCzkmaPwQdjxlQJkszWbkQ5XU+z3puKeNUE5DxViAU4J3WaGOembVWJRQVoyQsaI4GG/QRBKf12eqimhusBazQM7jxTijNab6tzR3YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by CY8PR11MB7313.namprd11.prod.outlook.com (2603:10b6:930:9c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 17:47:05 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%5]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 17:47:05 +0000
Message-ID: <03f5d925-3d54-4634-bbf7-c2b29dfc7f07@intel.com>
Date: Tue, 4 Aug 2026 19:46:58 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/7] ASoC: qcom: qdsp6: add topology-driven Audio IF
 support
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-sound@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Srinivas
 Kandagatla" <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, "Mark
 Brown" <broonie@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"Jaroslav Kysela" <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20260804070307.117119-1-prasad.kumpatla@oss.qualcomm.com>
 <20260804070307.117119-2-prasad.kumpatla@oss.qualcomm.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260804070307.117119-2-prasad.kumpatla@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0902CA0043.eurprd09.prod.outlook.com
 (2603:10a6:802:1::32) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|CY8PR11MB7313:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e549d3a-1749-43db-c76d-08def2506587
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|23010399003|22082099003|18002099003|4143699003|5023799004|11063799006|56012099006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: VPTvcY9t5sqoDPveOwY0VibIoMiZGAuPwsRI+S34jfV3IeIQcdyRLNC35mlcXvO8Ekgdk1NfEBjb//i2UJ0pqRiP/lDIQicTTyGWs8wzVLsygEFx16Wz8DCeYBVFLSaSUNbifeqOuvP/13sKvzIN9xroNpuSCPM2OrJbV/VaGRMJPU/hYD4+sQYDEV8hJDWPQV+N+LwWqGnRV+DPZuHCu3Q2oZH7yEHBt4nFFOjHWASkFltuw7OwSeI8jI3C5QTRuaDyOck9meWD+Ida275h2mPsB2PR1tVRxfDoYIiEJGfzoF7UNouBBeiQHzakT2qpERLwfxi9hJzQFX8wrdz5VpIBe/1CZbjXTrlJAIhYj6W6/jninEC3aEaJa1Yl9mjYrywAa+QTdM+XMadEoIDF0T/7MACtZ6ciFkVwtpQ3A/Xff7gHoY9EwnaIKNkNW6vJ9nh+IhbM/nGGCpmVJo1Q75Frv3tJWzCQqgSx1ey68X9l7P2pfeKJcwbJ3RTD27E7LQ2sRdrMoMafgictGI3xMAiO9nDJhqU67DGYXogonLxS0w4E0iBQyeCou0QQvOcAUBEZnBTGxS//GOuZh+h3I03nyEuY7HsSjOYDJXSdEmGkLjxDe9vQjiI7FTQFqMz+W08Ej5C0oap/A30aH482MOVQgF1dIPTOMWttfArq9Fs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(23010399003)(22082099003)(18002099003)(4143699003)(5023799004)(11063799006)(56012099006)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0I4OW51RG4vYXBOdThNMjNXL1hJZ1JITm1wZHpOMFNYUDZORlg3TzJpT0R2?=
 =?utf-8?B?V0p1Y3hMSVBmamEyTUZpTHRPK2lCSC9VT1NYVEFjWFlhak1TT0N4b1RVdWhm?=
 =?utf-8?B?U1pQajVRcE5BZlVXRXJQNGZzdXNmZ2xaOFFYenR1QjhUWlpqZVZNb3hSSjJY?=
 =?utf-8?B?K3Z6cTlMbXpyZm0wTnRTQUxjN0VPbWFLaWUySGhFaURpT3RYcUd2NHlTMkps?=
 =?utf-8?B?M1REaUI0MEpocG1OSHBtNkFuTEVza1lKSktFQkU4QWV1WFJCUGZ5UHBiV1NQ?=
 =?utf-8?B?VGhOVVJidzl2emJ5QjJJb1d1Mk56cy9vRyszWUxiK3ZEd2xqRzg5aVJLd2Z6?=
 =?utf-8?B?aFZDMS9xdVZoTVRiUkdFM3M4cHNOc0JFa1g3MVBrSjlrbktyNlEvZ0JhQ3Y0?=
 =?utf-8?B?TDlIK25IMi9ka05odWdydkxHeEcrekdyenNLUXJtUDBLamdFbVFRWGRGajhK?=
 =?utf-8?B?V2pZRmVsRWdhcUZQVVVsYWtHMG0xcjFGVk5PS1NLSkZPYXlwRUZhS2JEUUVN?=
 =?utf-8?B?ZkVzWUN6TzJpUW0yQlRxcGRNSE4xUFNOUk1BQ0lTSk4zc0JQemRIOWQwVjZ0?=
 =?utf-8?B?UFAyZWE0QW92YWM5ditlVUU0L25EdWxkUko5MUtnZmFyeXpYZXZoTXRRM2JV?=
 =?utf-8?B?THhXTllHL1kxMFFGdDlGZ3M2czFlWmN2WUtiZ1ZIK2dUcmlpZ2tWdmtzbkh0?=
 =?utf-8?B?bXJ4ak1yM1lOU2krSVQ3cEdjakRlck1wbFp3aDQ4RnBpc3dTUVhtUDJydS9V?=
 =?utf-8?B?ZXlockt6WGJIdWowME8yZ2MwdFE3UTJ1d05uRkZmWm9FL3l5K2M0V3pvaE1P?=
 =?utf-8?B?WkE5bm03ZVhQOVhtNU81N3FWMFUxQXZrV1I3cGhTaU91UTV6TnYrZURuYVcv?=
 =?utf-8?B?RldHQ1o1SUVRelhreDNlbUdpZFBDMGZERlBBSU15M3F6azN5UjlNalVqSUVR?=
 =?utf-8?B?YnUrSmJVanBpRlB4V3I2NnMzSEJESVNGYU5GamFsbE9mQUZUYXhPYzlUNmJM?=
 =?utf-8?B?TnJyTWZHeXhlY2lJSjhDZ2tJc3NPMDhtMmlFQVp6QSthb1JCL0duNTJUNXhm?=
 =?utf-8?B?RzJpM1Z3RDgxSTd1Y1VLazE5Zll4OEwyRmFhaHhrT25iTm16ZDV4WThLYWlC?=
 =?utf-8?B?L3Q2NFVxeDQ4NFBIZ2d0QjhTaC85OVhUMkxCdzJhbkUzODNrditNRG9kTVFL?=
 =?utf-8?B?c0cvWXBxdGpLcGI3Q3B1UDB2SFhRejZWYVp4ajdMalY4djF0NVNWSllSK0o0?=
 =?utf-8?B?MWJhVDJWUHRUZEtFMzFBeUN1eXBFNnpOQU9lUTV6MDJOTFM4dlBrQ2xtSVo3?=
 =?utf-8?B?MHN2SzlOL1J4VHh0VGR5d2VhcEFQV0w2bWMwUExaMjAyQzBaa2ptSHNXTFJT?=
 =?utf-8?B?MHphdVkrd3lZc0pOMjZjYk1oUU40djlzVUVBWEpodFJmVFRkUXV3OEx6UXU1?=
 =?utf-8?B?MnVaVnlIQU9OQnFycGtMcTdvaHVqK01ENVVFVmJWRVZicG5ycnZlYzVSSFVH?=
 =?utf-8?B?VzgwSkJwN0lhVFNoV1dld0laSktKK3N5S210M3FEYmtzY0dkZk04SExtVWRT?=
 =?utf-8?B?Y1g0c3BsSnR4ZExRQ0s0bHo4Zmtrd0hyYUZUYzZPTGUvZTlqTHhwdDZ4K1BW?=
 =?utf-8?B?RVlpQThRMXAyVEFxNjVZT2I2UDF2NFppUUFYWlJ4b3NSV25CRGVuamgwTzdn?=
 =?utf-8?B?R3JZdzZVRDZaUFB2cWRJU3FmTWo3STU0SjhJQlNMcEh2eThCbm4zTEdlWStS?=
 =?utf-8?B?V3VIRUJoaytyWEFCZGFxcGk0YVUrNDZ0K2xZbE16TW9iTEVXbzBVblNiVUYv?=
 =?utf-8?B?QUp1ejExTkt3SS8zL0FxdWgxbk5PTjR4ZFAxUU1EU0lES0c4RDIrZlo1MjQ1?=
 =?utf-8?B?b1owcHRGTVpnRVBva0RvdDEzTTk1VC91VzZHaXNYU0FpVmlWaHFiMEZjVU9H?=
 =?utf-8?B?VjdNd09mbHRKVkRHQjBSQzNBMWxmZFFmelBXWldYdnpmWWo4ZGtQMjVjaEVH?=
 =?utf-8?B?WDZpWlllYnRGcmJZcmEwU0gvOG9NZnd1Mm9kZXZIbVh4U2JHTFBkRTFDU0Q4?=
 =?utf-8?B?T2JHUzd4VWR3K3NFQmtOUEg1dnFXMXh6UHBKaC9RYURKUnZ1aGE3WjViSG9O?=
 =?utf-8?B?UHRvbWlnUERqSkdaREtJa1RZL3hrSUhobE10Tnp2clRCNUZJSHJHV3pycjdL?=
 =?utf-8?B?WWN4Z3lFVkRhaDdPQkNPYlBwV085Y0FEYVZkbS9ZNVBubzRDdFhONXlSVnA5?=
 =?utf-8?B?d3ZGcnhvMDhwYzFWeGpmSWNUV1c0eDQyZDJaWExoOWkzendoZG90NDMyQlNZ?=
 =?utf-8?B?aDVuVmxwazd0N1JiMFNwOXlkRVVscHZhKzdFRTBDSThSZGEzQUkxSlRtNVFN?=
 =?utf-8?Q?w5OVDXr9bFDWomDM=3D?=
X-Exchange-RoutingPolicyChecked: KRF3e8T0/n9ZgmcQkH/dVPaAZYjFtxNJS8bLXr6OcCQRdJFcN5vruvf0Dbr4H9ZzL+2M/CbDscMEG99gPn/27C97ECyAw8rL2gCAxeyODSW/WiZmGAfUCeZrgLZu+QFFU24drZkmkIyEeadWetmgYKj2s10fJQfv1INc5F7y83948P6pHpLzOxUdmg0Rvbar9Jh5J8UsoNqYaVwypjoz84DWIuwb7Ms2vdJo9GMFSPLG6MEWuW7XRJz3jfTKNZ1kfWhNpaBnsunQT0Mfu+t+HslDGUu8wD7pUk2mb7hb3WNplpQEeL/DGjKB7oZkunO9GtYrs5uvVJTShUUSyRy3Yw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e549d3a-1749-43db-c76d-08def2506587
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 17:47:05.0951
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V8UJiEH2f2dGgXOr8ftOTUDR5BwSlebkSp0LpcamutMxfn3yLDxj4t6YDeZGch46riXj3fjoraO9e61KtrQeoyeLCfp5H6xpjNLnKktYhLQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7313
X-OriginatorOrg: intel.com

On 8/4/2026 9:03 AM, Prasad Kumpatla wrote:
> Add topology parsing and media-format programming for Audio IF source and
> sink modules.

...

>   include/uapi/sound/snd_ar_tokens.h |  93 ++++++++++++++++++++++++++

Meh, looks like QCOM took a "bad" example from Intel's past drivers and 
put the header directly within uapi/sound/ without any meaningful 
prefix. Even moving the header into vendor-specific subfolder e.g.: 
uapi/sound/qcom/ would be a good start. For "better" examples take a 
look at headers exposed for newer drivers: sound/intel and sound/sof.

I'd suggest to move away from snd_ar_tokens.h (the name is as ambiguous 
is at can be) and start new header family within 'qcom' subfolder.

At the same time I'll prepare a patch and remove the remaining "bad" 
examples so people don't propagate them.


Kind regards,
Czarek
