Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45EB3386553
	for <linux-sound@vger.kernel.org>; Thu,  2 Jul 2026 19:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783019789; cv=fail; b=ObkZXSJUqFrfLSQMB7230PLcq8hPt7xOzyHm/qe4wphZ98nQFSD/VeyeENp5zqO9DdX+dK8HzLlIiHhZMP9V+4VxJAolW7KnsNbrXo7ysOejmXLYGX1hHrTniR35x0IM06IZ2vUXDISMujVJHmTRDqbgFUJJYfecdc6gGGhhv04=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783019789; c=relaxed/simple;
	bh=sPwzvQdH6mG8QmLcjEWrR+mGU0Du54KxoarITeM3EDQ=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NGKszCQ7HXkM94aJ4tnuoSyjfUtWBJnOysYJ9gHnm2BYmzrEgv4FR/xi78tIUS1N9BA4WNFg9N+porZsNF9iwIq556jpmkkEKoNJtTCCwpObANwXkrT6eGZWFoP2Xmo2bVe+FrLjeQHzbhFstkhQxe8c7dsWBd3ujjZtT4xG23A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IBTZnSob; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IBTZnSob"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783019787; x=1814555787;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=sPwzvQdH6mG8QmLcjEWrR+mGU0Du54KxoarITeM3EDQ=;
  b=IBTZnSobh5kJTshm83PoBwLz5oR5s1Jx3S8xk2i6SeerDdzv0xpW3HgO
   mz9bgPWzt1habCXmJxdw7LXFz2JJ+gljc7yAifcHNZ7kN6s3YUBBzEsZQ
   tkTPJT08q8DRn+kbGQ5+oN8zxfIseSsNu0XHCIOmIVK92riQGyTtSeRgW
   jwp27KWQ6jmABnewMgdcQlyR2VRu8498AsqfVXjzzlNKqGnbk+JHsreGR
   7NbgIl8oqCyPOoB8nIg4DpDbj/QLE37mUaC75UDI6REK8ScMigy2rOEB9
   St0FQkoDKWA/HoISyTE2Tu3esjcnHaI+XbYX9hgjcTIj9DacDNmHGPfLh
   w==;
X-CSE-ConnectionGUID: NIZr9KDFSlOkaw54ei3sqA==
X-CSE-MsgGUID: KkzY11shS263KOcTQEyHCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="87606840"
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; 
   d="scan'208";a="87606840"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 12:16:26 -0700
X-CSE-ConnectionGUID: pdnBq9WNR3K78sjnIsklMQ==
X-CSE-MsgGUID: EUIgYSgeSuqInSky5w32Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; 
   d="scan'208";a="251209719"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 12:16:26 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 2 Jul 2026 12:16:25 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 2 Jul 2026 12:16:25 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.53) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 2 Jul 2026 12:16:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T2bYMUMw+Pz5ER9dOa888HXy386iqleE8x3jB9F/rIRj4hMqopKLQZfk0oTOMmoGAY4d8FTzY0r9K8P+7El7Le0dZjitSu1NH3lDZ4D2SQRygMQyYR+SQlxU9Rk+fw6QQjQn0CPN7C06YiLuHd0fOCLDp4yOr4YkfFdfqmbMIuE/mOTN4aeT/KNzFzZrOex3A1FvTwFCM2hdnYhxXQBCMWqZ6lS2tCZlkoB/kMf5FI9NIBSmM6prd7M9qTUDxfq2ouzIn7O6/Hx/A7CyyH9W57X30HjalX3TS6J9g+QEMjrjAdoKo7T0rngCSGLxFbQG8df1kjKjFDmTL61yRqQEJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bu0rB+ZHYVbyyc5nLMgmV0SXBFaLLL+QyHfJKDdQCIM=;
 b=jEyj8ggj3oGTQ1cr4JlwN4/FUu8yfVNHi5TRE5CrVGd1huHZOhqte9N76Fan/mTxAMX1B+8fq7meNvn71iC4ODcYc9TTnT6UvuLkrY32ixl1mJrqIvZk8q2mEnxUhis4DrmcSjfd6uWFZc61qBce12DUXr/O6ZXSmFPmxVJKRFTPuEf088REi9WMhRNcrTGx6yHqy0cdRwL0uy06HuygURviAaM4dYSAPInyG5AOqeWFNrTYzSIle/whfpa8UOfoEGeYdD3L/7iwzMRL6RNOFh1I4LcBiuJl4iI0sNrl7Yv3XpGZADloQsQ4jq7VBbWSIkMGUU374/YcuskQi0kewA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by DS4PPFFAE6AEB4B.namprd11.prod.outlook.com (2603:10b6:f:fc02::61) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 2 Jul
 2026 19:16:17 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%3]) with mapi id 15.21.0181.008; Thu, 2 Jul 2026
 19:16:17 +0000
Message-ID: <cf0cf8ba-f47d-40bb-8321-47a7054e2027@intel.com>
Date: Thu, 2 Jul 2026 21:16:11 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] ASoC: intel: use component_name for Component name
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC: Bard Liao <yung-chuan.liao@linux.intel.com>, Jaroslav Kysela
	<perex@perex.cz>, Kai Vehmanen <kai.vehmanen@linux.intel.com>, Liam Girdwood
	<lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>, Mark Brown
	<broonie@kernel.org>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Takashi Iwai
	<tiwai@suse.com>
References: <87fr29esth.wl-kuninori.morimoto.gx@renesas.com>
 <d5e3fc22-8a17-4672-ba5f-167d8cab2aa8@intel.com>
 <87se66dyqp.wl-kuninori.morimoto.gx@renesas.com>
 <2965d6d5-6cf0-4fba-97a0-7a97861fbbaa@intel.com>
 <87o6grd4ol.wl-kuninori.morimoto.gx@renesas.com>
 <dfb5efcd-6c9a-462d-85f7-e8fff3ded624@intel.com>
 <87zf0axr11.wl-kuninori.morimoto.gx@renesas.com>
 <87wlvevtgo.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <87wlvevtgo.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIZP296CA0017.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:2a8::9) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|DS4PPFFAE6AEB4B:EE_
X-MS-Office365-Filtering-Correlation-Id: c2be0c3b-e2a2-42ac-4cde-08ded86e643a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|7416014|376014|1800799024|22082099003|18002099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: LdrdO5fttNTvtk5OctJTrFxGmTAS03LXvqGVSLNhH2uI27Alh7ZUuz2OVOZLwZBxStsUb0fVSfbsQHS8K8l2HIFGjV8ufTySdrjQp0EVVvzr1fuOliz/RyLHRO4EYH2xa26erUh/ttmBuTgAUGjnuyCZ2XfHaSGNB8iKy4g2HEY9xV42WvHFC3gpY7YqnXYrErUAT3Km4Nu1cSsb+RqJZcD22GdQutBjbfwsTzE6/K5T0gcnNtYHvFr1mmmzMoPkqUTwrM1Ec+se+/fwX1MyL5rBY6Lw/K5fK0MhHDZ0s3Xt72LhoqSVc0tUnvANK+hQq1kYsAHd/0xgvVZe9y+2qt0FGA08kQEHZkl7lQ4dU19DRAf7+c9+DXpiven5+jOg/PCrQFc0O6ipZsMdY7DoXtkOpANPwfPcG6LhcaZdVA85j3PGK45zex3AOoGr1uD3Oo7SaK+qPyzP1nMWzvWEM51N6TFBgOUcSz/1G3pLTx9i2zFNgf+b4dafwOYa4s0BoEALOj3jOn8W4/AqeJ5+7OxCnQFN7TI2C4Sk1qQuqhfb4DTqqNnXsW9tSUhQcyXTkrVtjQD2VWQIX9O5aptwignCW0T6em1yovlUmoLV7n5BXoS0TD1Znq8mJpZH8atcrCSLpq/3s+cTKupEcg2z6uYdxYmdi1SaXaeJ0SCc26A=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(7416014)(376014)(1800799024)(22082099003)(18002099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGpnSFFVY29pbkhaV1JacThxeEVWa3c5REVIMlJua21UN1ptYVkyUjhsU3VN?=
 =?utf-8?B?Mjd6NmQwZU00Q0lvQ0FpMFBQWmpGV1pWbHlibUI5TmRVYkJ6VENBaW5NWEIv?=
 =?utf-8?B?WktiNllmbTZjdGdHeklmczRHaDh1bmZJRUFYUENoZXhudldqYkNxTlRBQXVE?=
 =?utf-8?B?cXlMSGtzTTVOaExYa2s2SldMQk5BNUFkajhmVVFFWmw5bnBEbFFtQXN3a2pW?=
 =?utf-8?B?Yzk3SVkxWjQ4SlRrb094WG1Yblc2L0JDSTRnRmMzRzA3YlRGbG1YbjhlNTVh?=
 =?utf-8?B?Ty9ONlJKWGhkai9EUnY4eTREU0hoOGZlRW03ZzVpaFozTnV5ZG1Sa3NmbVVu?=
 =?utf-8?B?SXJWRDkrZUt6UHVFV0dIOXJMTjU5aVQxaXh2R2lrQU9RejdqNk5NazZ0OW1I?=
 =?utf-8?B?UGE2S2dIcElKWk5iR3VkM2ZLL1BXaG9QajlXOFNPeWhFMm5yRTkxOWdkM1NH?=
 =?utf-8?B?bUM4UmtUelVqWEFTMjNYVzdhMTFZSnB1bFdWdDdtNFlJY21hUFN0czVST2Jr?=
 =?utf-8?B?VDVYM21tVHlyWWpnZGdNSHN0YTJ4WlZVWGhsR1JIZnM3ZjBhb1lyNUhqQ2Z5?=
 =?utf-8?B?b2JlT3VPRHRRS2hOVS9BWVhzTGZHTGN1NTkvbDZOVVNXamdzZGZ6eUhJTUlK?=
 =?utf-8?B?T2JCNjNnejJJVmc1M2JIcGxubGdQNTBKaGpYaUpjZ1RMczFDWGZiYnN1NXFp?=
 =?utf-8?B?R3o1UWsyMFkvcGY5MzZuYXdicFQ5YTlYM25YaW1wRWw3d0oyTVZKT01qOTBN?=
 =?utf-8?B?N3RjNEFpWGlpWTY5MU00aVZidGpPNitTRXBRNmg0M3BTVWljemNVNTVMNk5L?=
 =?utf-8?B?MGZ3dVZGSGtHYzBLQ1BoM1B2MFN5N0pwYk5BYnNOV1hMZUI3bllkc3c4aFg5?=
 =?utf-8?B?cDRHcytpRVFhUXB3UDZOTVRCc1RSV1RxaEJpYW84VWpWazB1a0JaNjdKajVL?=
 =?utf-8?B?T0JidVdwWThhVDk4UEhTeXRrNFUwYjhUZEptWWphZGF5TTc2bEtNYnJHc0dV?=
 =?utf-8?B?YzF5TXJPUE1GWFMvMXdHNE9yQkdlN3U5SEZubEpUTm95MDJKWE9OUCsrTndp?=
 =?utf-8?B?S1RuWXordW5NK2pMVDhKbHByZGczakRIeWxTd0ppaVBkRytXZmFVSG92RE16?=
 =?utf-8?B?ZjlsQllWMHh4SEpYa1d6VkZ2ejhZNmx1b3crOGhEL3c4NFZtMGo4ZzRudnYw?=
 =?utf-8?B?azNVOU00NnEyb2trb1pPVXpleUQyMEhuSUxTaERXLzA1QytsM0VENzBPc0Ew?=
 =?utf-8?B?YzRoZGtaV3lLK3RxcHJrUWU5K1lwdVlNV1d0YVMyTEFNbGE1VlBFWlhkVTNs?=
 =?utf-8?B?UjFadEFzMGNEUjBJOG9DT0Q3eWFhbzJja24rT1Y0WnZNSDEySWlobEEyV20v?=
 =?utf-8?B?SERUakwxTktzQmNLRXkxbEtPOEpzMzJhRHZnUERiVC96VUFWa0Z5WE9HNlJU?=
 =?utf-8?B?Y1Z6b0VVQ0piSkJGallzMXU1TnJJV2o4Z3ROYWp2VEJpSUQwOGUxWDJOWGE1?=
 =?utf-8?B?aEExbk5vKzh1YUVIOE5wV3RuYm9oQlIzUXd3V3ZQaDh5ckZEQXloeFcxR1c4?=
 =?utf-8?B?b0R5Zk5hMWR1dDhOdCs4a3Z0MjE3NGFleVd0RGdWNkwrZ3JDTzU4b3MxcS9q?=
 =?utf-8?B?NnNFTnpoUUhrTzJRTk1pcHA1aDJ1c0JHY1lML1RIUlIwNm14dDBzMUZCSS9z?=
 =?utf-8?B?d2hPYUMzb0lXOUREY3ROTEIxZHFwVUU5UXVIdnRXbVNrem9IQ0hud091bkZX?=
 =?utf-8?B?V0dNL1FZRzkvUWdiQ2dFeW9nVW9jT2xEZ2w0NFVZRktoYkxPazhQNCtWbHNW?=
 =?utf-8?B?emdibVZIWHVTNENPdk51SFRkRmxmVHlFUHpQWC9RVjdyV01tODhHSm9SeVFE?=
 =?utf-8?B?QXljYVMrUUVNeE5UYkp5Mmp3R251cENPWGNPai8wRkg1cDM4VVBick1NV1Q3?=
 =?utf-8?B?LzhVMUE0Vm44ZStia1Z6d1UvZjBFZ2R4UGtLbTVBR0lEOFJOcjAzKzdQWksv?=
 =?utf-8?B?MmlFMGJnUGRIdGtOcEs2NzFoN1BUa0VEQVdoS1RzeFRCSkI4cUUwbzVXWlJO?=
 =?utf-8?B?MzNmY0tiMFVac2lFbnZXQ3RiZFpGajR1VFZtUkhkbUgxenlUeTBnRS9SVk1Q?=
 =?utf-8?B?UE1YNGhSK0hjUVdwbmlIKzFKVVlyMUxsZmVNd1JYei8zU0RxMGVDYzh0ekhh?=
 =?utf-8?B?TDEzV3NvSi90blA2YWlNMTkvTEFXTVhWbk5LVzBlNDN4VndvNTN6ZmhpQnVY?=
 =?utf-8?B?bVJvWldQTW5JUGNYN1lhSEhaZEdXWURZbWdVTlJ6ZlFYNGVLQ3lhREV3YUdP?=
 =?utf-8?B?SWFVK0c5K1RKNmNkcFJQV2IxTW1BeFp6cEpDTXBCVGF5YVZnR0EzTUFydFNB?=
 =?utf-8?Q?UrGpLvUDq1OZq53k=3D?=
X-Exchange-RoutingPolicyChecked: N0/hORZVJoUqbhL+V7tcm2a/bM/Ui3ZFUxOyvESZzbyvRQhIrFiKVsu1ClfkxcsRthqjUEn0R37RF/7u78a7jYgKZaSQ5V7pkqNQr0FXDUBE3vAZuNNwDFqGNl6nIsGHtVQNnMAduFYEhVU4ibJR2GYFekCtD5qEk6TXiZ33Bzo2idCxWsWoMhqgpYm8XDG4/01y+LOTdoL/SUjwDKnyVKRNWKj2GuVwna3yws8Y33T/8Yosfss7qLaCGd1DU3/awZBtgmoYRZSFMqlihH62NU7c2HkRENnAvI+Qvu3HV+Yu7WJ/NU3+tQNd1aIe2aIYxZs+9IYRL9fnxfrMj0uf9A==
X-MS-Exchange-CrossTenant-Network-Message-Id: c2be0c3b-e2a2-42ac-4cde-08ded86e643a
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 19:16:17.4593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /SapobgQN55ev6pmmBg+uzpj94HtJS5HKL69H/6ekmtc8axZMRVy4AZJGP31Sp326cp534RuH46TPfB+1qTGOeK3FhmoGaaQhgpguHuJfwo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFFAE6AEB4B
X-OriginatorOrg: intel.com

On 7/2/2026 7:41 AM, Kuninori Morimoto wrote:
> 
> Hi Cezary, again
> 
>> I can agree that flexibility is important.
>> But current flexibility is used only for adding component->name,
>> and it makes difficult to read code. I don't think this is "flexibility".
>>
>> This patch trying is not removing flexibility, but removing waste.
>> There are no drivers lose flexibility by this patch, for now I think.
>>
>> I don't 100% understand what you are worry about.
>> Could you please tell me more specifically, what kind of "flexibility"
>> is lost by this patch ? And what it makes impossible to ever get back ?
> 
> I reconsidered about your opinion (= flexibility), and is your concern that
> we might have new component->xxx in the future which is Component specific
> (= not Component driver specific) ?

Precisely!

> If so, can you agree to add many _set() function, like below ?
> 
> 	component = snd_soc_component_alloc(...);
> 
> 	snd_soc_component_set_aaa(component, xxx);
> 	snd_soc_component_set_bbb(component, xxx);
> 	snd_soc_component_set_ccc(component, xxx);
> 
> 	snd_soc_component_initialize(component, ...);	(A)
> 	snd_soc_component_add(component, ...);		(B)
> 
> Here I think we can merge (A) and (B) into one ?
> I would like to have like this
> 
> 	component = snd_soc_component_alloc(...);
> 
> 	snd_soc_component_set_aaa(component, xxx);
> 	snd_soc_component_set_bbb(component, xxx);
> 	snd_soc_component_set_ccc(component, xxx);
> 
> 	snd_soc_register_component(component, ...); // = (A) + (B)
> 
> And more, I want to use _Generic() for register()
> 
> 	snd_soc_register_component(dev, ...);		// exist
> 	snd_soc_register_component(component, ...);	// new
Yes, that's why I've explicitly provided an example for component->name 
earlier:

	snd_soc_component_name()
	snd_soc_component_set_name()

Without getters/setters, soon I won't be the only one complaining about 
the lack of flexibility.  Anyhow, I'm going to continue in the follow up 
thread you've posted.


