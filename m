Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E634D7E0E4;
	Thu, 20 Aug 2026 08:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787215167; cv=fail; b=NQTM8lH3mr903iqlRAIz+Vst9Xo9KUSDG973J+43UJ3IF3CMGH+hv4XyWDrccfAYONC46s9rXVBdo7CiGBYJq20Lh2sz0rICKkjzKCFFdHKNBpF+pk45+e1sx/nQpYFFPn5J5Ektyh0ioj5Xm+DFENsOdQqFR5Vcq7NnfB5jbFA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787215167; c=relaxed/simple;
	bh=AabVqoMaSN0p2rbSi/2Fifv0MHRiJjMjpZ7EQOXtBp8=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MT963RowtF41kPM+PtNHAvffjd4z9Q8ZF36pVdyAxfKOA+tzVEO5gSv/ca16x0L6rCmcgNPUgKnJl7DbT/h1eCeBsn5iYIyqMhS7TdqN3l/o6VCoJMAkZKvhUF2X8dMrBSOl27CX6m7nP44ngblRRqt3xuWAUsNNqogJ52pqLgA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MFjJmzTX; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MFjJmzTX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787215167; x=1818751167;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=AabVqoMaSN0p2rbSi/2Fifv0MHRiJjMjpZ7EQOXtBp8=;
  b=MFjJmzTX3rpGga1JzhGStCedFGQnag8Gf9mdSMdsB0wws+bG4neRm2kV
   TlXPucRtuHdU1WOEttt3mAYbVUrgaEyK7QveUy8P7+UzM22pZ4u+eV/SH
   xjrufUZCWJybAlyaHrpeHx7saqLIIyI+wR/0zDLSpV36s3oDLhJqwnCFE
   cC8PFATd9L57Kao+IfvRSBqB3/Q4GnY8E4V6BDONKXTb0yE5n0CUwS3lH
   0mPkb7b5uIeqsS7GraWe4wg23bIPZCc+trvcjwJKyQZyZDpug6HGxK8Qy
   Zt34FcPTkhN7T4Skj5fandbKY2wk+zCgzbzoeS4Bkeci6X9j4rUOkY1c5
   Q==;
X-CSE-ConnectionGUID: cDgjLXEYRIe7jf1xshFwvw==
X-CSE-MsgGUID: Y5FWDnB2Ry2YEHEzziBcfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="87949567"
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
   d="scan'208";a="87949567"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 01:39:16 -0700
X-CSE-ConnectionGUID: js/Ggud9SoGw63zYkcaGow==
X-CSE-MsgGUID: 3La/fqnpQn2+n6Q5wlnNUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
   d="scan'208";a="266534888"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 01:39:14 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 20 Aug 2026 01:39:13 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 20 Aug 2026 01:39:13 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.17)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 20 Aug 2026 01:39:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lC/G6CaIiTpI3ke0L84oteI8z7NCgO/xkdAvuJUA8h8mOyoLsMdLkWBXh2h9AG7ZEDX1E/2k0YFF9PgAzcXBFC3aKolmti31thOcjq2YF6g72w8Cb9e5z6D53GlNQ/3bf6+TM/isVsYMAo+r9ZqDoDu7K/5UZHeyxNnJYu3XjJZ0mp3qFdxf1BTcUleA6fOWjulcOwrsdNDWxOaqgTGrDwBvNvJV/vL4b7hma4yYWRualc2Pl99w60jk9ii+E/w3mxzLmioF41BxSN5N8XXXxAp83eqMHboEZuoG4nWj10918y58rVLELARwOH+zY3DGV4CRVvz+gEt+Sq7HJGceLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hCkgfSKl5rkHtU+scEHYr1l1XPO+sn2/KKtzQnry+mw=;
 b=N6ylRJuyq8CFejTPdAco4pZwNFpyJKxwgMthoFijyRLW1KmXYGEQeq9gErpbYeXIvIuHIrw3H/pj5Km5r+yBa8YD82glFpPoPrZa20fFCgmD4mxDAfmoDjtYhj/g2duI7WRL7BH9w/oe0UrMSpUbokOG396KjxIMbc3hK/zTwmFg9UNRg1dKgn6sSd22zrG2xdGZHhBhMCDH71Kk76JFsHeppiAdOjYupbWZh+YQwgpF2ltuuVEBIRKzDH2l3DZT8z6td71qCxfR11E60aWvv6U9aEDTU8iq37vQY5YNOgPW3dRkiLS20deQCPIdTVABwzTQFH9KcYb0xiQ2gLIdVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by CO1PR11MB4772.namprd11.prod.outlook.com (2603:10b6:303:97::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.9; Thu, 20 Aug
 2026 08:39:00 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%5]) with mapi id 15.21.0339.008; Thu, 20 Aug 2026
 08:38:53 +0000
Message-ID: <1b5d28fa-6f1f-4307-bc1c-a3db4772ba08@intel.com>
Date: Thu, 20 Aug 2026 10:38:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] ASoC: mediatek: mt6797: Use dev_err_probe() for
 error handling
To: <phucduc.bui@gmail.com>
CC: Liam Girdwood <lgirdwood@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, <linux-sound@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>
References: <20260819101736.67632-1-phucduc.bui@gmail.com>
 <20260819101736.67632-2-phucduc.bui@gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260819101736.67632-2-phucduc.bui@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIVP296CA0087.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:35b::17) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|CO1PR11MB4772:EE_
X-MS-Office365-Filtering-Correlation-Id: 6294669b-0a50-459c-4e63-08defe96775f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|18002099003|22082099003|11063799006|4143699003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 7+ERHZArPs6crASJirYf0lMtkA4ib9bU04C450ka0t4/siqLWyaTC7ba2QPsyb+lOjiKnXGumt3s4JoTZYPCqpvvym50d3TWZp+uot3zBWxg+zaOE4hacjHDv0sUfucZU2PYBZe6mBpWmwRgsRJ8qLsB94bUU3u+fcC1UOxpU+ypBkDU1/xO2XChQs3K+b7PvffB972HJ7Zmq3zM8+Z74xZWcgaELQGnYmoMx/qPQc2dNBVkLPteSV3wIBCvKUsnJ9r+RXctnbt2ZoBQcZX5CAbJpBhSlsJMWMzWXgRlJDvE1O84xohwpkhgL4/SEQ4WhwxBzdSJn8r+c0bDWRivo/8c7Z7bomJEgzuFBm+d4y6W+358eSg37owxV/5U3XS04HmAQCRlvAv/7et+iSLzXQ4neKSPfqWxU4Y/Bidyk5RSEHF7aQ6rFhF6SgEK/z7PyYt+r0LfUB+/uNALhJy6RnX4aqqnPpgmzyLdKOEwzMt1rM+awJtCN/CJTA85ypJOM/ZAk8LxfND+nIv0GVpl73UiwuOUCM5bg1dU2kZtF9nPZBvJ4lKNzf6PMx3tpAPEPV1X9l60CI2WDwRDVi0xpnKbmLCH9+v3EpYpdydEl58WZtB3wPR6sxq+yFxk91CNzC/Htkb6cvpkPRxQBaTHgqmJ/LWS5K3OpEzReIcUgjE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mk1wMC9ROTg4cklxTklKeE00VUFNOHUyeS9senQzcE5DKzZxVGVVczBkT3F3?=
 =?utf-8?B?UWpSblZEVm5aNU5xa3YyRG9Ia0lvQnhZbENYMkZVazI0Y0IwNWpZMkI1TnF2?=
 =?utf-8?B?eXIwNTkzNnNTTjhBS2ZOTU44S0JYRW4zS3ZvUzZETVNCQUtOWjBMR2ZHSFpi?=
 =?utf-8?B?cktBaGtvSmVWMnFlTlNOYm5PQUR2d2dOZE1POGNUVCtvVi82b2pNSWV3U1Fu?=
 =?utf-8?B?bkVrcC9PWnNrT1ZlNzlQeWNKbXorYmRSaytGRm9HM2duSFJtYklKT0JTMXFo?=
 =?utf-8?B?bU9XZ25RZ1IvcXNOdHFiMHdWZnovSjFQeEJjSDRzV2toWkJTVnVkUlF3ZXdP?=
 =?utf-8?B?SEtneHIrOTBSbUg1MHFaV2pNdS94OWNVVlpSQlU5WFpmaHg4NlJrMCtOeUtB?=
 =?utf-8?B?TUN0RjY0b3B4YTQ2V25HSCtaMHZxb2pNV1lkWEV6REJ1N0RuNllXQjgzTXpC?=
 =?utf-8?B?N3JWUGxHTkp3NmVhdW5ZYWhUMVp4bnZaQmFQS003QWxmbnVBbnRqWE8weWVr?=
 =?utf-8?B?RlVBa09HbkxZeE5VRGZOSEd5VVFHamt5MVZCMm1YUlR5Rit5MFdjVk4vcWpw?=
 =?utf-8?B?ZXhxSmVxQ2g4aXJhVXk1cmlQbU0rVTd5bW1tbFpwdjNaeFlhNHVrZU1YS1dN?=
 =?utf-8?B?V3UzU3p1R3UvVlRhL2RRTzRnL2ZnRDhrMmhsQ0w1blk0KzFsUndYOWF2RS9u?=
 =?utf-8?B?c0QzRDZLRkszMW5hK3dhMzR4OC95a0ErNXM0L000UmZHcjhEODV4THlUQUxi?=
 =?utf-8?B?UkhuS3RYZ09wVmVJN2s4VWd5QVFTaTQ0K0habURhQzFINVpyRGRIeGhoMmxn?=
 =?utf-8?B?T1ZkUGtyMFB3bnIxMW1iTjBUTytSeXk2ZyswYW1NemVZd0ZlaE1hcGVrZ2Nu?=
 =?utf-8?B?eDc4Vk1mN2xRendQZGxYcWhRVTFhbWdsR0FaMmdOV1FEamFiek5kUmVReDIy?=
 =?utf-8?B?SVBVMEdQb0Vpb3l0eFZpMzNxL0w3dWhBRmdMREIvMDNPNlIybDE0RGY1b0l2?=
 =?utf-8?B?a2k4VzJNOUxIM2Z1ZWtreUV4UkRwWFgzaWVkL2dsVHJXa1NUZzZHcFNxMHlJ?=
 =?utf-8?B?MGUrdkVscGVvTGdWU3dVUzZRNGF2cWFwakZJeENWcXI3RzRuMkJQaVVhMkM4?=
 =?utf-8?B?dUJnOVN2WVNFVXE5eEo1bmZSTXozVXpoTGoySXZXNE5yYnZwaENaWEc3QVpv?=
 =?utf-8?B?MnNOWHY1MlBsaXE0cnd2RmN0NTdrT2lxcWIyTGdTUmZpanVrY01wTE9SSy9t?=
 =?utf-8?B?Y1NDcHo3dEEybFpZSDJ4THFsK1RLMWFwZ1U1K2NuQUpWRkNkaFg3R044VDJ1?=
 =?utf-8?B?QVg4eUhBVU5NdlArQTFobXA1S1Y5NWp0Z2YwYnZ0UUlLZVpWbzZjcEUvQk1r?=
 =?utf-8?B?K0dRc1NoaHRTdWVjUnpwbjdwRTFiNFBwVmIrbWEzQmJzL2RlNnRWdG8rb3ha?=
 =?utf-8?B?OXdzTmNzdkpjM3BZS1FxRzRMVU1nUUtZL2JheVNVMHZiT3Y3K2JhZWNENVQz?=
 =?utf-8?B?QnBhNzZxaUhxRzhTcWhmL0dNZEpoUFdtcWdpSmJidWhzN0R3anJPT0pFZ1Ji?=
 =?utf-8?B?MG8yMk81bWJ2cU9ObkphQmpuNkkyMGRTNDM5TnEveVhBT1YyYm9ObklpVmFa?=
 =?utf-8?B?VHFpcGpLaWI4MS8wUk9sK3c1eHE5c0pzWVhNZEliSjZORkhJNnF1VXF5VEhw?=
 =?utf-8?B?YkNpb3R3WGRCM091S2N3R1E4Wi9VYVluSXBjUVdQWHg1emVkTWl5OU14ck1x?=
 =?utf-8?B?bTQxY3oyMFVBenhTU2doem1iTkZCa2ZpNVFsUnlCQm8xQ2NKeU84aXAzSmVi?=
 =?utf-8?B?RlZnSVRFNTRTVGJhWWJkTmlLajRpZkdPRjBUMXRCRnZpNDVCUFhJNnZDYlcy?=
 =?utf-8?B?NmJmQU5rcEEyR1dNVndUTG9KamJVNnU2clJQTmd1ZzRBU2lKS0lZVzhYeUNH?=
 =?utf-8?B?eGpXMHBReFRVTGcrZTgvMndVSDNJUUdVUFZBMFVxR2JzK295endyMjd6aGZa?=
 =?utf-8?B?cGkycjVLRm12QTZLeEhrRUtCYjgxTDNqUFo0cXNDb2phTUZoUWxlc1I2Nzc4?=
 =?utf-8?B?VHRtYW9PVXhwTHZmNjRZUjVzNUpKZ2o1Mk83SXdXUTdva3Q2Z2FpVUo3d2Mr?=
 =?utf-8?B?dm13V0R1cXkwNm5INGlrVFRIUWtocW9FYkJ6MXVFNE1OdW1XWndMUElCamlu?=
 =?utf-8?B?YWZnZXQ5U01SRWM0UjhmNHFtUVNQUkdPOXBqL3pNUkJIZW10eCtwUEpVcUJP?=
 =?utf-8?B?SCtFbjc5d1RpWUo5TlhzbThHZENWYjVNVkQzSmlLRWdYa0RRUVdQYVlBUDBK?=
 =?utf-8?B?ejd4Z2xxbG9JUHJjRkNlUWdPUUhNZ3JsSG5DL3VJTStTaDRGN1NSdz09?=
X-Exchange-RoutingPolicyChecked: RPmSlRk2Pms7BEHXMX7gEGe8dURBwOOox/2ymXwqrzuV5W4w3O/TEMM2iYJahU8hRs2UW5ogeBZwLFPRMyPM8TfTwoFSUKHD62yPZZT91YxyAPNqRsw/+0v1U4Xy/HEk6SVht5TuNjs567QNJ4xLT31HyBeMLsq3f5lTDoGydSJOoI201tgGNnxlAdX7GAjrUJyIb5yqLlFnudxpdOJTiCndW7O7wpJAbKJRuKrWocuivq9b3OQ2IsxgrbnY1yk7EDeOsHnYn1Wr9/glTsXw/bRmftXTyrygnNAYu6ZsPAE/IIiNXLzE7lsvKAQdpCPMlzxRa3r5Z8f4gbH/DQ60/g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6294669b-0a50-459c-4e63-08defe96775f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 08:38:53.7521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6T19wRyQ5Elu+Sd39wvNUZlJ5FSbkFnDjNn99ouxf+BaYiKBc2sqMbZESwxpaG8U1WOSA8MoB5rEMyyYt5bvfBJ7lpCYKQqpAjUa0CzAv/s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4772
X-OriginatorOrg: intel.com

On 8/19/2026 12:17 PM, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Replace dev_err() with dev_err_probe() to prevent log spam when probe
> returns -EPROBE_DEFER.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
