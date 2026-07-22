Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483244C6F1B
	for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 09:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784714216; cv=fail; b=bm+LV3UENebe6kOPquYhCzy6DyPZalskUEmpxLcpsaYRVhWkn5z4BxrFYEsRRq1q8db/5Br8J3Zunvmt+RoscqZtlKz3/jjIl/bs6jGL4wRTK5iIitDWObni1zB2yIeOj6ADwue9jLrn9oS1VB1ua7U3YsmFm2qSxBpG/muYtrg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784714216; c=relaxed/simple;
	bh=Itevl4lI5IwPQEG4hN+hASav9+w7QYKiETpQF7569Vo=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LLxvoRGq4HMUxTbNcxfDblv+lBWOsoKAFVsh0lUVro87vh5JZSJFLl7a96SM2v+RiME+w0ZDeTfoJnYm+abTkAoEC+ktK1663p6WDEI5NUvblEVQtOWx+z3+2GQNxsR6y6tEK4MPSfBXJpcFawe0vjOS10IddLghLZg0jtjpt+k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=By2Jz7p1; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="By2Jz7p1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784714212; x=1816250212;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Itevl4lI5IwPQEG4hN+hASav9+w7QYKiETpQF7569Vo=;
  b=By2Jz7p1PEF52ZC9HHdvWk9M3ECqgPQQ+kpZFb8LGbdNu/4DCtpoDcnD
   tOs2OBXRtWL5LiD26nx8cXVIMis2jIwdGz/vGXiwpx291K0Svz7cBTm94
   UJlFv3LWB6vf06CqKtEmpTkf0odlU8O/jY8sHkBWcsQCiHonpzmoQzoVC
   bbMG3KpYedd9LU/al5gVR65qY8YjBM0cpI8PQDvlvv9ZM3+VbQktmAvap
   GYG2DTXt+jTL5i38oUNfrDeVYPh5n1Q0UIU1IfaBXSRlNCZoKaokffRjB
   KcjTx9m7t6AzfbyqVtPUkotw4gJdHcCbLDMwoBS1gA0ntG1ZGhwTTqBKn
   A==;
X-CSE-ConnectionGUID: 9l5rU9uuTt6dLAd2gwOUoA==
X-CSE-MsgGUID: i4vnVA2eQQSkJgll1Dbv9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="110888494"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; 
   d="scan'208";a="110888494"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 02:56:49 -0700
X-CSE-ConnectionGUID: Xxc8NenOQcOU1h/zkKWenQ==
X-CSE-MsgGUID: h8IREoNMQ6qGmg6KNJaVUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; 
   d="scan'208";a="262981164"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 02:56:49 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 22 Jul 2026 02:56:48 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 22 Jul 2026 02:56:48 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.49) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 22 Jul 2026 02:56:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S04aO2ob6RNzbv6USkPutDVEg9RgUsIVJCveNpQUpBpu2Rux9ASA4TleRIWy4+0PwKuEzGLgAQ7bJVuItbEeNfKgZknHfNKYZkI6A8r5sV/71B9iZWfU1CdYyOsx5FMKWHO/excCERtjiYayoZdJn0okomN0r7PRpHBDy1BgEmsaGEQujvUMtfA3BZ0boqTewzWA75KK7vF8B/xA6qUCA4eOTk6mngvWOTUPmBzjbq8o3sOInAGNbMaQXoOwh3BIadyQRJWTvKqJTlsOqsZsAicSA8CsmasQJkKjtLM7MG2DER7ssMtaQ+VGDXZ9eDgAvX2uO3w/iYMAJFESPJx6qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ai6/dFpK7AO7SZs2dBMQntgg61rzYBJPfkHHyweketk=;
 b=FEoRjU2VYQM9KY0FbDJx1pO6u3RyT4LR0wyDM7DBCVdaHsl2Byg4X22Hkuk+I/w2BuxFrxO/frOPRNHc/9Zxq1JK9DGkWmbbrlEIVr0jYs6AyGdb41v6xWRZNpjXVQr/nlJEs3PweeZUOXor1XMG7UZR0ge4tBM1qyMTW437fIsALbK786opTskKZFhURJsmD2QdvZZL6u7iEHz9khV7X2ehghrpOTU0RUEVoZmrZY58A6YWWQbn8BO6aJw5TTdiZmkZjv92lhtd6De645JVOydVOuUC3w/3OoxPYUy6u7eOx8/5CvkFMyWX7xNMeFwMweleJfIpoKQFUsK2qp8nLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by DS7PR11MB6248.namprd11.prod.outlook.com (2603:10b6:8:97::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 09:56:43 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%3]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 09:56:43 +0000
Message-ID: <d2670363-bbfc-479b-a214-62aec13dde7b@intel.com>
Date: Wed, 22 Jul 2026 11:56:36 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/12] ASoC: soc-component: move
 soc_component_field_shift()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC: <linux-sound@vger.kernel.org>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Fabio Estevam <festevam@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Lars-Peter Clausen <lars@metafoo.de>, "Liam
 Girdwood" <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Nicolin
 Chen <nicoleotsuka@gmail.com>, Peter Ujfalusi
	<peter.ujfalusi@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, Shengjiu Wang <shengjiu.wang@gmail.com>,
	Takashi Iwai <tiwai@suse.com>, Xiubo Li <Xiubo.Lee@gmail.com>
References: <87qzkxjg53.wl-kuninori.morimoto.gx@renesas.com>
 <87pl0hjg4g.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <87pl0hjg4g.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0108.eurprd06.prod.outlook.com
 (2603:10a6:803:8c::37) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|DS7PR11MB6248:EE_
X-MS-Office365-Filtering-Correlation-Id: 07652559-8b73-4c31-8639-08dee7d788e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|23010399003|1800799024|22082099003|18002099003|10067099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: fEcdVj+49FJUaRQLMEPzmbrDZMG5PceyGaqVZfUrZuS9R0jRSPe+Ta8qfLtPsOswm7AfsKICAQEPzv6ukAHp8/8hLympbwDvusKRs0s3CjEci+UXQZvLiUzczHJJs1fzJ+Y7OYTNKvUGt66mA1457Si/nm8K+Tatbayjhrpc0JiALXAvSzVWR0p343/Y12G14MbpK+sCRoxWK+cMzYeBzyByDwOBhLQ7Ng36ALQmbUhOKp2TeXkdG0HCAY9Z/R9kl88wlUMaadfQ7nAFpLY6LkoKXzBJahJLMOAK8RGBFWnwS4N+uR52h9mn3E1tim7psCZ4ZSdI0/e3IaINs+miATr/iXjUDfSxwkiB7mzYnJ9JEGSniZ4JTV9b5RqAqM4vnaM/KwK6D3QHNM17leXRfN/uZKLgFVITVI28jlPAQIQ8zBsN850scZQFo2mgkADXr7GWXuheSFDyx2/mjvaUWvKY2b0t7dXvr7T1oCFs4Ie67Of33SlnziEXClAk8HwdDDSlL+yKN5Utl/s/GADqb81UH4I9KGld2ksRm/3lBypwVWPkI3DL1tvdZSiDQoOlJ7MmpbI+D8kBJtO/yj4sLr0R31oIFRr3BSgcpCLo1KRDsZLW6eRzk5tuznxqRaoXsCppJkzAa6MUWl568vmZFnW/TII4hM9i6dxtXOdbvHA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(23010399003)(1800799024)(22082099003)(18002099003)(10067099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SjViZWtCVS9haEhqeTMvM01oTkFzQ0R1WUg0R013Y1R0SUtkcUdVbnBBaEly?=
 =?utf-8?B?WUpCUEFjcEtVT2JwcFc2M09sUFBSM3VZVHlVcit0ZjRNc3RKaDJkekNEOFpE?=
 =?utf-8?B?NC9DK3VmN21jK0pHVUNJeUZVVTh3K2NNWDB4K0gxblJyREFBMU00UmxGQWFE?=
 =?utf-8?B?RThDV1VuTUVVcGNJSnZ0ZVljbXEyNUo2MDhTcE5UZ3JJdklhckVRcEQ2S2Rx?=
 =?utf-8?B?Tno0U3d6ZjA0cnlpVmkwNStERzJoaUFSeU1zOTZkREhIYzlwRy8rV0ZzdjJ1?=
 =?utf-8?B?TmxRMXpQNFV2b0kyNTYwK2thTDQybDlDYzlDZ0FIclBEWEtYU1p5TXpNcnpE?=
 =?utf-8?B?MzdKcVBnMk00Q3prTklneXB1c2xDRWxpMnFDdngwTkVydzYzSlJmMmJDOElL?=
 =?utf-8?B?ME1Ed3dCNUtQVEpEUjVJMGV0c05JZ3BwUTkzNlFiOXBNUWppd2VrVlllR0tl?=
 =?utf-8?B?L2FoYXB2LzkwOWtadnJaVm9neS9vVUROWk9pdzE4OXA1OXpDVkZ2b3VzSlFS?=
 =?utf-8?B?NERqS3lJTjV2VEIyaGxZcmcwNmxUQnNEbGtOWnVSV0FobWwzV3YxVGhBMzFu?=
 =?utf-8?B?R0RyTXRCOUxZN1RNQVJaMnNoY1R5OVVWZkNkQUdLUjdzakpEa1ZGUHR1aFNC?=
 =?utf-8?B?Uk1VSnRmeEhab1dYQXRxbFZ0WmZ4RDdyZWJSSmxBSW00SUxkYUdOOXovdGJ1?=
 =?utf-8?B?QUZseHFxazhBNU14VHlsTzB2Nkp0RkxMa2psbjRvcHpMRFNla2pHMmFOR1dl?=
 =?utf-8?B?MmZvVkhlS054T2pDQm1WUHZLaEp5bHdHcDhQdlpqVTVsOXlRUkxWdm5Nb3Vq?=
 =?utf-8?B?RWZ2Y1BsZlM2S003Z25yNTZkRXAxSEQzQlEycDJtbmUyQUtrSFc4cjM0ZWhN?=
 =?utf-8?B?WURTdXpSdktoMXZPNVE4ekRSdnJ4bE4xREpkeW05U3plTG10UGp1NTFTRCth?=
 =?utf-8?B?ZlNheGxQV2FqL1hlQWRYN0tOSXMzWlEzcXlmYmt0UnFZZDdPaHo1RVIrNFht?=
 =?utf-8?B?bzhGOVU5VmRTa2ExK202cDBNVTBoY0xFQjdaeVcxRzc4cEZ0Vk43eUM4T1Vr?=
 =?utf-8?B?RmpzY0UzSE5xeGhFcXFxdVUvVEtvK3FrVDJycDFEUjNDUkpIejNYS2xjcmtL?=
 =?utf-8?B?ZjA1WUxkZUZ6NElKcU1FcHFkTW0yWVljVUE1dkRzR0pGWkJYT1Q5ckVMMHFW?=
 =?utf-8?B?UlZhTTE2UFJsNjhZMElmMGNRZVk2d3ZIb0FhTlpIY0IyMWJwUnN2YlZqY09k?=
 =?utf-8?B?NEVnKzlaUXgvaHZLS0pWbjU0VW9PN0dxdmRmUllFb2pHVk1abVpYdDNPSlBN?=
 =?utf-8?B?MU9YcUhmM3ZtdU85bmFvSWlUQkVxdnhzeDkxZ2kzR296ZzI1NjdTendhTGNM?=
 =?utf-8?B?WkRGNXNUTWE3VWxNaXlYV3Jaa1dkdEtkd2JkVGp6ZlVram9zM1hRU2lTcGZB?=
 =?utf-8?B?bkNHdzg3UTRaM0JaVkoraXVTclBKQ2prSDA3U0VXV21TbTI5bWxISUhBOXZk?=
 =?utf-8?B?NThmbGR3VFNNWTBheHZMOE5aU2hJR1JXKzZrT3U0U2l5b3NOMmtLa0lBRVFt?=
 =?utf-8?B?S1dGVW1iR1pkTDJIL0lnVUNBSktrR1MrcTVKekZwWVpPRXhXamwwMmoyYk5T?=
 =?utf-8?B?YWwveDBQVk8zOCsxN0dVMU05RkpxcjNKVWNWRi9obFdBOW1sTGVhRGV3VkQ4?=
 =?utf-8?B?dHRoY2svK0JBSW5QZVZjaEhUK1lIVDR0OHRRUVFxZ3hqWjhaZ0lPUERrVVBN?=
 =?utf-8?B?dG9Jc0QyWjNscTUzMEZ3UHVHWVhFRXovT2UyVWpRampTVWxyZlBKdFdYenZG?=
 =?utf-8?B?bmdGTmRRNXlFZXJDQkNaeWhTTXFtcVlPNXg0WXpUQ1gzRXMxYU44dUEyVjA3?=
 =?utf-8?B?OXRNZDZXUE0wK2JRYWoveS9ZOUMrQW5zVzVGbGp2UUU0ZWxXeTZwVi9SU0sz?=
 =?utf-8?B?T0pUVXRiZGMzNUFNdHNMNEhyNUdTMHE4cWVTL2xXMEdQSTU1d1ZHb3NpdStm?=
 =?utf-8?B?Uk5tcjAwQVZVeE5OcEt4bk5ySElSaDhhY1UrSkxGRTRnRDR6eHZvWHZia1l6?=
 =?utf-8?B?NDNReWZJTnJGbnlFNkFFYlZOREVEd1hPRTNXc2tmeDZNOUZReTM3NUlkaEgw?=
 =?utf-8?B?amRxSUdlL0lZLzIzTUxIdTdaamFnWE1IeDl4OVdBeW9WSloyWWxoTTdQZjRD?=
 =?utf-8?B?eDY4cnpWL0QrdEJNd2FaUWlrQjA3RlhkREVCYk9zWU1heUcyZi9hLzlPc2U2?=
 =?utf-8?B?K2Qyd0hFeW1EcnBrQ1pGM2tvWEszckFwVGxUeHROWnR3TklMOWlqVlIrYnNm?=
 =?utf-8?B?NjBLbDg2MDJ6MHN6WEQ2SWZwYTQvQjNnUmd4eFQ4Tk13YVI0WFNEcmpJbjA4?=
 =?utf-8?Q?g6SmCspuYyvyo4Xc=3D?=
X-Exchange-RoutingPolicyChecked: Q4QkycwaHFomL8LF1WFRqEUwSzcWvyAsI3HDj3PCTHZwQMI6VM2hyFrdZu/V/gX6ecAiORtLV0bfWkACAgqTdG2ikqwIWy/lmb8GBBdDjFv3JFxLdhYd3Zf7caUihWNRaIkYbAeHKYbLu2qszIYkd4ICTD8AAPdJD6YrwhzQ2hqxno4yx6WdfkZC3YQ/8CEjQSnAgE0ibNEnJQ9kGRM1reBwZ4aajn64orBqc/pG30/uxuhVJS8yNa8rDOuSUNxrtlpxecXMgnHUa/PkN0hbgzz5sEyeDGwtLC+50P6rw5QdpgDZrL8U8K7chwywT/pepnF6q3VxBqZnjsQvuiE0ug==
X-MS-Exchange-CrossTenant-Network-Message-Id: 07652559-8b73-4c31-8639-08dee7d788e1
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 09:56:43.6460
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sesRMSpbIanIF3eVetp6t+YKZXt9TRGuJjDnFkH1EHNQeisUf2PEWgUJWQPJzYrvyJy2B2EV/8JmKc81XwYSdP9zpHLt1VrAlVZ7LfCZLmc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6248
X-OriginatorOrg: intel.com

On 7/21/2026 3:17 AM, Kuninori Morimoto wrote:
> soc_component_field_shift() is used from
> snd_soc_component_{read/write}_field(). It is better to located around
> them.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>

Shouldn't the sign-off tag be the last one?

