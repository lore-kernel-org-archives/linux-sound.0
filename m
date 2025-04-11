Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672D32367D8
	for <linux-sound@vger.kernel.org>; Fri, 11 Apr 2025 16:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744390323; cv=fail; b=oQM3kke/hBYjQ+B2v90u/Hy7bywBbPWe2nGgB6EOFiED9ReIZNj8C1UfQFkqHL/WPv6iRtgRVc+uRDlf/7J5SzLeZPTCD62f7P/hCsvsep00ioN4YdtihJIxzSCivpeLTHZwfT7PdAsTpL5nmE7I/ew0RocLz68wR5c2C+ydNhc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744390323; c=relaxed/simple;
	bh=FiqMDiTlv7duBXOM4u+P0HfTE+D0Y/hpm46hF/p8Iu4=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=td993n+LGcimPoQ27oLHxq2d61e/7ppE0GRtzi1KWsKeLT17F1zcnCuJGLUGtXSZyqaaDrwDdwl/rPO1BhjeVKBpxOcV3Ia58FyT/nkm2Egenw+ndjgsfQqMbVhfeSeJpAbKfO68FbG6mlZFtQEb9ndrSt3/toSP9M/5XYNhQ5U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hgMZ/UZU; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hgMZ/UZU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744390321; x=1775926321;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=FiqMDiTlv7duBXOM4u+P0HfTE+D0Y/hpm46hF/p8Iu4=;
  b=hgMZ/UZUxdOh2qhkZ2MLK35AeYaw9yf4e2nwNC4ROb9cKQYFh2DSSdfh
   fNsnAoiLs2uCZxPWC4mRtbkz1EnycUCoih7IisIt81qGwLbOK8AHxOrJM
   oT5Dx6hDpCWnWLwzwIgh59ybk21WM4u3rwdqh+BbseXD5YIMbwQ+abPWs
   NYxyMdBFGbOl+29eXLE8mc99efLV6u+ghcokEzKR+6emnvGJl43Sv4rDX
   9+ycuc0+Jg62e9tysxxkFxvLmph31wxJDAx0TDz5jedA1EU9uHDHJZZ0n
   8szeCOtM0pb2J/CElEfcFGR7EiEcAexLrUqx6zGCWQVLxrPI9WI4e512W
   g==;
X-CSE-ConnectionGUID: VRSAS2SDQASN48oiLPoJiQ==
X-CSE-MsgGUID: zpL5uND7Q6qIMQq9j5pueA==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="63492801"
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; 
   d="scan'208";a="63492801"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 09:51:59 -0700
X-CSE-ConnectionGUID: i93p+YC/TjS4oAWYYk0n8g==
X-CSE-MsgGUID: GMpZbmaoSAWdqqVtmhxwUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; 
   d="scan'208";a="129225144"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 09:52:00 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 11 Apr 2025 09:51:58 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 11 Apr 2025 09:51:58 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 11 Apr 2025 09:51:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LH3K+9nXQOUgT9waUVBOp0ArqBo74cfEBYjj+NYPX8d7FmUmoSOILaUnKXarAcGdF4ZIac6I+N0xMqLOYOSPuw82I6RV8k9bUKlETi2GX1AVvUeZk+LfggufOrcjEbS21sn40C23r21GlYXkZ+dJ0djjWw795B1vtOtsGQ4jMPRhcTB1bOl78U/eFqqKG7iUxcL79Q8yZC28c70rShJYYiqKw+ah83qk5CSdFB1OKvHzR6nDj9aJLX9ij7arrChMBpvcKnlypHCi997k/nsiqJ6M72e00L03qfGvsgsFlW5Xn8RPvEGUgz3NC0yYGSurMvlpiThhXJl91i1D6bV9EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FCxqyZTPLLGkZ6j1+Tix9M2MQIKMVglAesGrgAxZ+0I=;
 b=fDaU9v+UXNSp+X8g8wHjf8two8rNzjq2pSDtACAty3QOv0E/k9pQrLy1bCucfg5YiJHBRx9CelqyTfANFSc66SzjvjjTwFhV+F8Lvzd4PxC4oAOaxv70hLO20mFQ3GxHDfpOGDXX85qZgzIpc9v32hlfxOkSb5FRHhZwe5RuVBn4t1FcmY7j/Aaeoy3mV/OAIZOh/WWp+MWSCCvQGjRfLDBbpdQGYQmbnNzrSllDgcS59/fVBJ8KRtOsITvHr+Df4mTNIGg72fnz+n17EPdMKTr/iwlxc7Ca8RujH/suSFVkftL9YEpJ7MDNbsUVKqCXMOCnUWXP5l2I/oukxe8EOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 IA1PR11MB8829.namprd11.prod.outlook.com (2603:10b6:208:59b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Fri, 11 Apr
 2025 16:51:14 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832%6]) with mapi id 15.20.8606.035; Fri, 11 Apr 2025
 16:51:14 +0000
Message-ID: <2235be64-2168-450e-bd32-1b76bd283452@intel.com>
Date: Fri, 11 Apr 2025 18:51:08 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 00/15] ALSA/ASoC: USB Audio Offload
To: Greg KH <gregkh@linuxfoundation.org>
CC: <broonie@kernel.org>, <tiwai@suse.com>, <perex@perex.cz>,
	<amadeuszx.slawinski@linux.intel.com>, <linux-sound@vger.kernel.org>,
	<quic_wcheng@quicinc.com>, <mathias.nyman@linux.intel.com>
References: <20250409110731.3752332-1-cezary.rojewski@intel.com>
 <2025041135-vest-tableful-728e@gregkh>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <2025041135-vest-tableful-728e@gregkh>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0085.eurprd06.prod.outlook.com
 (2603:10a6:803:8c::14) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|IA1PR11MB8829:EE_
X-MS-Office365-Filtering-Correlation-Id: d46a2be6-3a04-4b79-5f4b-08dd79191236
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cTg4OHdjam9oZ2NseC9BSG1CeGdTS0t0RDNDMDFmU2Zsd2lBWGN3RmhJTURP?=
 =?utf-8?B?V1ZwWjNVbzlDVzJsNmlSZVJkZjFNdmJ6MnB1cjJCL05BUDBRTTBzSTliN0xH?=
 =?utf-8?B?bHQ3ZmU5dzl4MCt3elZlelkwOXRGYnlXUXUxeXVTbFE3VkRHYTJFVEtqRTV0?=
 =?utf-8?B?YUtBSUw0bGZReW1XV0s5S0dIWE9qR2VYUFAxUS9TYXllUEM3UVBTMlFWOVBz?=
 =?utf-8?B?NHZ2WXRGbUZZSmVSLzJiOFN4amJUZUtQdklVNDVzTFZFdW9JTEcxVjJNekVu?=
 =?utf-8?B?V09VUng3MGRsZjZwV2pEYWxqK3RGbXVBY2NvSktlMmJJdzVKTE1CUGRad1pG?=
 =?utf-8?B?K21La3BCQWdkMGdWM2hwSStBaXVyTmU0VnROVlFDdkthQkxCckdhS1d4NWQr?=
 =?utf-8?B?Qm5wUUlGbWd0aG9wUkVNamxybE83VjlUV3FrRlhXTlN2Z2M2RW5NajlsTjdS?=
 =?utf-8?B?d2tPTmZjTWhPTUlXcUw5TCsvNmYrcjNVSWlBTysrZHdUd0U5Yk9WM0YyQW9s?=
 =?utf-8?B?amtKOWg2N21LQWFvd0FWMWlCZkNUaVM4TzFvcmpWMGpYM25COHpWR2cyQ3Fp?=
 =?utf-8?B?ZUxZeFZ6U0lZQllRRVQzeHZkdFJNNzZ3QnVXVTg3NmIzTExoaGxFK0Z1aXgv?=
 =?utf-8?B?WVdxSXR4blBFdVhFT1lGYW1qeThGbjNETXdObU5hcmxyZXZ3RFhac2JLWkhZ?=
 =?utf-8?B?M3EyLyt6ZFhUOE55L0lLazhKSy8vY29pMGxQUWZaREdqSlU0RDJYdE5adWli?=
 =?utf-8?B?WVd3WDBqUmpsTHExSGFYTEhUWUxrTkYvcjhyZ2daMVQ1YWMrWGw4eTFTeVNM?=
 =?utf-8?B?VjUwbisvRThKL2NvRjZKeWtTcHNzdjhYVytmMU00L3V2SDJZNXFkUUlkbGpz?=
 =?utf-8?B?WEtMTWVSOFBuK1hTVFpNMXRvQkExQXQ2QVVxRGQxbFk2cTltaXJPQ0pFbG9j?=
 =?utf-8?B?azBNbXE4K3kyNEJrd2JNQys1RC8xQmJUTTEyaFVBYmV3blZ0STZxWFh6NDlu?=
 =?utf-8?B?VmFxd0hLQ094akNCdUdHSy96cGZiU24wc1NkNnhLSUtETHZZOW0rRHBzRENl?=
 =?utf-8?B?RDVabmNST0RxR0hHOGFNQ2N5ck8xQWd5Z0cyZkVZYlVDMUdUZCtWWFd0dHpl?=
 =?utf-8?B?Y1lJS0h2VW1EZFJaZFAxTzZ5MXJaN3pxUFhVRGtQL1VBczlsTEVNdEdDZ0Zj?=
 =?utf-8?B?UUZXVHY0aTlaTERiOWlXb3RQZEkrQXRrRW9qZ2VLMWdkYmplTCttcHQxb3dB?=
 =?utf-8?B?NHRtZE1oVVZZMm53aXFxYWRIOVhwUmVJeDdRUkxYd0sra3VJVDZ3TUFIN0U5?=
 =?utf-8?B?dkdVZ09iYTcyc2t6WDhIamlYYkkvM0gwSzRUYytFSmc1dU9jbDBCQ1BZTWdC?=
 =?utf-8?B?Q0xXOWhqd0tmOCtURlpKeXYva2pXYzJRVDJNeThyencrWk14K0dZR056TU5X?=
 =?utf-8?B?WmUzcUNaVFlzbVoyUy8xSDNsMVM1SVlSY0Y0ZnZwNEtOMTlHeUtHREZaU08y?=
 =?utf-8?B?NmxVTW9WV0YxK3BQOHdlOXRtZkRWZHREQ2ZQdElOZ1ByazkvbmsyMkdWQ0pL?=
 =?utf-8?B?NFgvMllKZDZuN3dQeVZWd0YwQnpDUEN3bWZ5NW1zU3d4RkJsQi9TTlE4QklU?=
 =?utf-8?B?NFdtaEE3V2Eza0pUVXFvR1NoWEZmYjBGcW95MWxsREVjSURxSFU1NU9hZjZt?=
 =?utf-8?B?K0VmT0JnTGkzWUF4cnFWcGI0WktON0t6bm95aTB5dEJxdUF1QUtnajdvVUlp?=
 =?utf-8?B?L21jUk5NQWwzTytVaE56NVBjTU5DdDlPQzd2dHNiamc0NVBUeXhNaFE1Skc1?=
 =?utf-8?B?ekVsaVZ3emdMaDVZc3RZd1RZRUtpcFhaaTRONzBZRVh3NE5MbXJST3R4U2pp?=
 =?utf-8?B?Ny9ITXV5L1k4UFhCbEFCZFR1Z2xJSHlxTHh5a2dkeHZ1OUE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1NqQkNJOTZCZjhGRUdUTVNZWFFudjlNbWVRbWlxNFdwWE5nS1NqZ2k2R1BJ?=
 =?utf-8?B?bXRmV3N3Z09GRjJQZGdIMi8vNklHdlJjN2w0SEd2ZkE2WkwzOGk1TWVKMXVy?=
 =?utf-8?B?b2VGZ09leWVlZVVqOWVLRURQOUpneVR6UmdzRUhIenJvNG4zTWhOV3RqV056?=
 =?utf-8?B?RUd2MkZEQW9KQlJ2TlZwSGNCRmkxUVR3TjlLdGhRYlFiNmJ3MlE3TWRsZUpW?=
 =?utf-8?B?NloyWmhqSUJWd3N3a1dGeTBzS25pbXl2cUZ4YjJqNjBEUlJJTEU2MTZKSHhs?=
 =?utf-8?B?VlhMei9MQU41YjRnaDZWWDBJVFJ3eEU3TldMeWlFQmk3QXdLdlVUSXozZTVR?=
 =?utf-8?B?aUFmVFdjWnZPVmtLdEk4V1Q4aUZhZGFRU0N1QkVyUFZvSWdId1REY1RpTm9Y?=
 =?utf-8?B?QkQzNEhtSnN2dlp2SjVlMXNwbkZTRTRZRGdENDRVQ3psdUlIV2N6cU53Vm44?=
 =?utf-8?B?dFpvbzB3Q2RzRVZlU1RDZDdrTVlYNFJMN0lkOFZSNWRIR3hYREJUeWM1a0N6?=
 =?utf-8?B?dndJRk9sMnlSVXpnU2t0YnA4KzVxWnB3VWlUMnNnTWZhNjFGZkdOcUdjTWVL?=
 =?utf-8?B?QzRLK1ZhWm9JekM5bnZuNDVIRkJ4WUpIL2daWTJuU21nQmF5bEtJcGJxd1B1?=
 =?utf-8?B?L0VGMnl2QVJTYzN1MXZseGRRdHM0STVZbzA1OXIycDh3K3ZmdTEyazZIZ0Z4?=
 =?utf-8?B?eHVrb0tQN3EzUDFBMGgvY0xpVS9TTVhtdFVhL0hXbDdVenVKWlpTdEhyUjlR?=
 =?utf-8?B?QktndUtsQU1CdXMycUNpNDBiTFE2Y21CVnRQYkFkRy9FNEM4UmpvMXhBVkw5?=
 =?utf-8?B?RUc1QWc0T2w2V1I1VmdNOE9lTmZNbzFCVElmcmdDMXZoWW9oVHVzSFN1bzVK?=
 =?utf-8?B?TmtlQUVxeHpyZC9QeDVtUzdQL291QjVmWCtFTVhJR2lNd2F2YStQRFNtckpi?=
 =?utf-8?B?bHBWazhnN2ErVDVjbzdvWGh4S3dZTEZTYngvNDhBa1F0cHR6OUREN21ERGhB?=
 =?utf-8?B?UFI2L3VmU21OVHA2S1dHK3ozV1pSQjVPN1Nub2NkSHhmYlI0V2VwYnhIWVdk?=
 =?utf-8?B?MW50Z3BQSGRoVmNTS0pic3hrRXoydnNRQnBXemFackFWMGhpUDBXWUJ5WDh4?=
 =?utf-8?B?TmFEM0lzK3o1VW1LVmFUL2hEajhDZHZNdHB5OWw1YnoxM0FZKzBnaXA5YU4w?=
 =?utf-8?B?aDBqSHNJK2loRTEwaWlZb09hQzV6bzhERkNNVzVLNWc5cEhSNGtPbXBNTWJE?=
 =?utf-8?B?c1liK3FjdnJOUnpiZWxsNGdYVmYrbXBIN21ub3praFg5MlhCdUNDQnZUYUE3?=
 =?utf-8?B?dWI4dURzVFhpbGgwdG5hbVFMQk5nT2ZJY0xqZXpuOVNlVURsTWFORyt2QUMz?=
 =?utf-8?B?ZHZjeFdtRUc5S0Z2c0JzMlJOUU9EK1RaelZmbVQwN0NORWxFa2ZDVFBiNm5K?=
 =?utf-8?B?YjIzUnpVWnhRRnc1b25tcTNsZDAwY1g5Vm1mL1RkSE5DcGlKNlh1MlU0a2Jl?=
 =?utf-8?B?SWR1anNFU0VyK2FRRFBzSkJoY2tkOVdqZWQrWkxMdWREdExTUzYyL2E1TnE3?=
 =?utf-8?B?Tkx0bm5kUDh1UG1FVXZqbUduZUZLUUV0MGNMT2dKQVhydldkR3FuQWNSdzVi?=
 =?utf-8?B?TVFLZWNiRzVoc2t0bjUzQ3E2cktwTWVWTVpJOUg0eWFXT1plNmdKRUhtMHBs?=
 =?utf-8?B?RDZjbTlKYWxtMnJRSUU3T1V5bzhwTHlGajZTcTZmL0YyNnVtT3ljeWdrVkxZ?=
 =?utf-8?B?VEtudDRHQW9zRWVRbzQrODV0YVhpbit2QXQzMFlrSm03clk5d0I0MXM5eGoz?=
 =?utf-8?B?Y2xnalYwYUxnL0g2YkFlN2pYR3VrZXFXQlRMbC9hWFYwWDlYZjlkdS80QjhI?=
 =?utf-8?B?Ky95SXc2QUp1UVU4b0pDQ29ObDdiQVlCTDkxRTZ3QS9WV1FOZm5mbm9kVXlJ?=
 =?utf-8?B?NG1GZCsvZ3Z6SDJrbE1JaytqMVhzS1Z6ZVkwbGxmVUFJMXJWMXBWK2N5UjR3?=
 =?utf-8?B?ek1SNHJLeEMzekFjTnVGVVcyOTVRbStFMCtNclRHaUcxbGlPL2szcldSOVZt?=
 =?utf-8?B?WHdqVk1xcjlyR29IeWlUSlpORHp0aFVqTGV4ZjA3ZTZDTFNUOVRXbU5aQUNU?=
 =?utf-8?B?M3hYZnpjV25GY2RkOUp2SGVnQU5Pd3ZVMkkzanNKWURCMytKbVdvMWVJTVA5?=
 =?utf-8?B?OWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d46a2be6-3a04-4b79-5f4b-08dd79191236
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 16:51:14.4581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xh0e8roSH078tPU3k8mcGD98DSD58j687xa6D+CTEFag6QrIoLJQlbSsAhUG6zx/dh9877sna7UeE6JWG9nPjdP4TOXh0VTO4uBfeoZbdpk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8829
X-OriginatorOrg: intel.com

On 2025-04-11 4:04 PM, Greg KH wrote:
> On Wed, Apr 09, 2025 at 01:07:15PM +0200, Cezary Rojewski wrote:
>> Note: this series is based on Mark's broonie/for-next. The xHCI
>> dependency is missing so it won't compile.  Goal of this RFC is
>> discussing the direction of sound/usb changes.
> 
> Any specific reason you aren't cc: linux-usb@vger.kernel.org on USB
> stuff like this?

Actually I was expecting the exact opposite feedback had I included 
linux-usb, given lack of drivers/usb changes.  Lesson learned.

However, given the current feedback, for the next revision I plan to 
rebase onto your tree and include the xHCI changes.  While I'm familiar 
with sound/ practices, I clearly was not with drivers/usb/ ones.  The 
initial offload-aware vs offload-unaware USB audio-device filtering 
stuff was done by xHCI.  Thanks to Mathias now I'm aware there is no 
place for such specific class code in drivers/usb/host.

I'll try to get the usb changes adjusted as quickly as possible so that 
the list can see the entire thing.

Kind regards,
Czarek
