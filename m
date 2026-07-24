Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE421F4180
	for <linux-sound@vger.kernel.org>; Fri, 24 Jul 2026 08:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784880834; cv=fail; b=uA0t+YRZCQP0hGbxcxkUC+Ol5RUEcDMLijVLEc5iY4edavKU3LAkgzFfwC0VTpEGFk37RjewUqC7SZUk20Fybn2h/92ki0eTAKwNMdUbsz0Y4YD2nuMIkmlUKQDREKhM+DoB0kPwcbPkxNxKjjZQB4jkeG34SNZdahlzPxrB27w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784880834; c=relaxed/simple;
	bh=syRG88Y7Zl3FI2obe5ObzK0aTcM1j51z6Xx9WeJmYDs=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ntRDYEZoa+fqnDVVRG2nUNsiSXzrJOhdJ8J7E/CJoJJ8f8bA16Hga84jhgXkvyXnHVExpRgrWBxjzAN3a9PFUkLd8VkhrqOsmsRdYoeTEiUXWkPWGV3bW4cTEIGX7dd/bF48zKIRLOaY1FLNmWWCpiJFyKTJEv/+QSVzrUd8BuE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PjlzZZHX; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PjlzZZHX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784880832; x=1816416832;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=syRG88Y7Zl3FI2obe5ObzK0aTcM1j51z6Xx9WeJmYDs=;
  b=PjlzZZHXmqLpPXpjBVGDnY9TYygvS1wIEhDyzHH+FvLAD+gfQ+btz4cX
   0cz4yyz31cw5HLYkVCs1EQp7SC6F+PdZruP/VljqvKUTjLQCPZLIdU0AK
   +lp3W6Bw5ivLK2sc61KuWhC3SITREC6z2TWT96L0jDPCcQmOTEYd4N5xY
   nWrIlPT+BJBLxTX5LJvn3cx8PNx/wKkexuR/cj5Z1gIRQLPv2i8gUjxou
   RN/Vm60VyKIRaV2varw1b0x3caQX/YPtBV9Of+7vz/tPENEvt8AVMp2Fv
   0SZv717JwVRpGwb0gVFz6oHJ+rUcev9WjjES+MqdH07a8A73XrydV9w+j
   g==;
X-CSE-ConnectionGUID: 9hY2AcNzRGW7sbH/ZNB+ZA==
X-CSE-MsgGUID: qdJ1fx3aRqip5sJuAFDSHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="108332976"
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; 
   d="scan'208";a="108332976"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2026 01:13:43 -0700
X-CSE-ConnectionGUID: fbBfhKhfS6yqhvkFprI2WA==
X-CSE-MsgGUID: 3RFKKNm8TMmJj5w6e8pXvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; 
   d="scan'208";a="288622408"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2026 01:13:43 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 24 Jul 2026 01:13:42 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 24 Jul 2026 01:13:42 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.39) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 24 Jul 2026 01:13:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ionCAnOyToRZHQ1wQ/QMYsemPbmvD1Anhn7JIBqurYfA97pyroRpDF3RUnliDcoE67VHP4MinHirDGTauuUXEdOkXglZfyYFkt/U2ZN0i7r2AClXWjdhzhO+H/eV9xlBiajxCXLWHCqkwzaQVzKadLFmfuJkppXD5caPpP6UPZPgdxv7rriUVktAu4qrENsjkXiGnTxkL8suJkJQjjTEbdYaguzCAMukpCEDLtTlVrcGxqIebIp8Ceqpdkf2Qhpr1wkOIEX47QNVuwzns0/yL+TitTVxmVjFyDzgjYZiZTkNMyiZh1QV24O38Z5476Wj7XBqWlhrcNxa7sNp5MP6Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0y7Su7s9zq/0BP4XqEA6WiBpGWXSCknc1STr7GeCVrY=;
 b=x9R1LUbkr72h/semV+pT3czrlbjEfnYPP++TRcDGSMicJMxqZ+tnNnJ+7HZTVpRDxzZKejMKL3e0tZsmDrVl6YGTa9BskX79/9dhkL34OoeVC17e7EZPlp/eK8dHdim0B2YY2Vwck0ltlmrUA+idUUZW3jXEJDuQPtwS8QN7ZShyxAdqMuLCbGJxS1BqLZF4oaBq0j+2vxqwY0pXZUUm40H1FLcZ52JqBlZLMdejT7Epd0c9y5M/zzvAjNY1Yb9yv4lWpKrPc/8wxQbe8fj3D0LkmzN3YercqVBe9KO7YpGa0+1LwSu5yXIb04eEkW97X/Dcmm7ASvShMbM1gVxbjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by SJ1PR11MB6155.namprd11.prod.outlook.com (2603:10b6:a03:45e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Fri, 24 Jul
 2026 08:13:33 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%3]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 08:13:33 +0000
Message-ID: <64b042cc-088c-4963-b96b-ae5d9528ac36@intel.com>
Date: Fri, 24 Jul 2026 10:13:27 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/12] ASoC: intel: avs: probes: use
 snd_soc_register_component()
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
References: <87y0f2rz8l.wl-kuninori.morimoto.gx@renesas.com>
 <87o6fyrz7h.wl-kuninori.morimoto.gx@renesas.com>
 <58f7f20f-6a70-47a7-8aed-05c5676baf25@intel.com>
 <87zezh2sgl.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <87zezh2sgl.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM9P193CA0009.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::14) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|SJ1PR11MB6155:EE_
X-MS-Office365-Filtering-Correlation-Id: 209e2f6a-69fa-4139-367d-08dee95b73c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|7416014|56012099006|11063799006|10067099003|18002099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info: pVZRBOI2L8JXTMuRIF6ufS35oXq6IH0DG9AP+1qPPHyE3MbNSfpHRYHl6sJslETwj/XlUZCKiz58gfejdCrJZ0DX0ZO53V+oaYVDOVR72uC2qUcmAmwAFvtCoHQkPUmq2+Tl31R7Btn7gOP0/1/PoMQyMoXWA9u686AtwqXzAtCd59U6sm310IWcnPfwGKhTtj5JxYdKF2f0gYcdN20ADaukc5sEEEsGKw/DeAe/F6Unnt8WoBRgev4R2cG9RTTWB9RsKZum08kRCjB/7ap0Y08PIBAVwonjG0p1OQ3U2Vn8Yw7o8GdcfZ0wybvz0SCGSd/8zakIgj2K6GNhciVWyQiHr05Dtsa5AD/rgbWnEqpWp6T8VStL9uJl2lx+XUPr2BAOuf/UB/4muZ6Dl/im5Ay1G3cQov7599yIKVEcD/t5SUyC5BBc+YZdqXIEi2rWjL1tyhRdjb/TmlQ2oTEZZNl5FWmgAesewa5pYg+dB8Z/2eAOUTLaifuIS7HyJZb00bG8ThTvWrBpzSvXRBcA6NWFHZbD9Bvqno2o17rprHU0ZVl5TxXIxbfZm549KmNred4LwyG84GA7wn45XhupInHjdLDfJ5QBnF/++kYRrT4eSf2q0R1px7mELx7Ln+hdB2erOBbZthZsFnPPgFCdlw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(7416014)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VjF5S1pic3VvNnJoYTd3cUtTVE9TdDYyNUVCK3NyMnN0MVYyc3hoL0VZc2Rv?=
 =?utf-8?B?UmZZSG1CVnpvdGJ0dkFRd3NTQU5xRzFTdWFNTVllNlRtTTdCYWZFWS9rendn?=
 =?utf-8?B?TGFsaDM5clBIOWRPYmFPeWUxMmF1Znl1YlNGNERMek9JRFpES3hLaHYzNTRw?=
 =?utf-8?B?RlVNZ0YyeVhBbW5WaHZLTHhMd2tVK0VFNStmdXAwODRtQlZhUlVGOHZqMnJT?=
 =?utf-8?B?Zkk3Z2UyUVNlL3ROYUhLYU44cVN4SXFFQ1V5Nk91TXkvS1ZPN1JzTUZERUdn?=
 =?utf-8?B?SGpoMGhYQ1Y3S0xrNHR0alI2M1I2UERXOXJnb0FSd0JzTjJuUUorMnRXVG5t?=
 =?utf-8?B?Wm9jZHZRM3l2VjNDTitWTnJiOEJIRGJPYUlrZ0ZlZlhxditlNkpuM3g4bTVY?=
 =?utf-8?B?eXJ5K3NUS2Qzb2wrYkhqZHJLaTU5WkhJNXU5Ry9LOWFHcUJZTDlVRnVSeDFO?=
 =?utf-8?B?emRjSm9KU3AyakN1L3JLRHZ6NlJpZ2pyMGEzMkRQMzZGd3RoSlpUT3JCc3Bt?=
 =?utf-8?B?bi9CcEx0enIxdXpSM0tQR0NYU0I2UUM4ZDVpd2NXZ3JaMlZJUEQ0OVFCYmFV?=
 =?utf-8?B?d1pYK1VUdXpMTU0wV1RCN0lrRTRYMC9CbWVpSExqb3lFTWVtQ2lQN3BzR0RF?=
 =?utf-8?B?OGJFMmdtcnVDbHNrMHJCVXdpbUNKV0lhUk51akxHYUtmZzVWUjdYNmltNUZy?=
 =?utf-8?B?bkI3SVB5R21NTEMwMVNlUGxKY0tmNWJSSnR2VnhBSUFDem1MUVg3ZkRKN2k3?=
 =?utf-8?B?WnA4anV2N0NDVU9QSllCV29wVFllclo2TDVHVWxFeE1MV3ZiMFRzZlRGY2NU?=
 =?utf-8?B?ay9LQzltSjNOTTZGUC90NjFCRngxMlpGd0dCRFhBbGhyNGhnaEpZNVBKSGEr?=
 =?utf-8?B?YkhrMWMxajNDUkUzQldtVERGSjBCeWdsamgva3hBdXRtbTBUSXZ6SG1ySHFP?=
 =?utf-8?B?WWZGNVk4MEdPdzNyaW1tbnEvSmhBWCtGdVhWNjJRZGZEalZQcngxR3pMencv?=
 =?utf-8?B?aDZxU29ySnpnM3ZYTEZqV2NubzZKbUxUSmR2Yjd4WDBLVE5yV3hjY2E1SzU1?=
 =?utf-8?B?K1BLMEZnTXh5dnRsU0JIZ2lDbDhXRm9CVTdkVTJzbDdrRWRLVzhMc1FDWWVB?=
 =?utf-8?B?RWM0blhOK2NuODA4dEFPaC8zSHBkWDY0dGxMZXRyZHJiWmZPcWIxV3hHQklD?=
 =?utf-8?B?RGVqYU82cms1UVFnOG5qbHR2c2FCeUZjK3g2eUsweHJJTGUySFVMY2d5Q3NI?=
 =?utf-8?B?K04yUFNGVlBuUFIwQktrakdJMWgxZDFEeU9BZExiRDNPcVBrZDlPdmdWVm1D?=
 =?utf-8?B?SDN0WENmMExFK1NUZTYvU21VdjRyOWxTY2dkZytnUGRnbHNaNnB6QW55WlF2?=
 =?utf-8?B?UWlkV0ZpOTFTdTd0aWhJL1VCMUdaZHN5alhJUU8yanhSdmx4UlZSaVQwejZR?=
 =?utf-8?B?ZklRRmpuN0RGdjMwSGZWd1o0UFVwMXp3M2szTG5rdDB3Tjh4c2RuLzBGRE95?=
 =?utf-8?B?MGh1V1JvbHRTWk9aMmJhZUM2bVIvRmU3MTZrQlFMUXNnT0xBMitMTjN1dTcz?=
 =?utf-8?B?NjgweGRCdU5RMWZlTHdzL0oyZ2lBRU10dHdsb0xoMHlPb1BGUzNVWWNITEp1?=
 =?utf-8?B?WE5zYVZlMzJ2TU52bklFTlJrbVBqWDVXcFczZCt0cDFjUFhzWUovSkJMQ2Mz?=
 =?utf-8?B?TktlL1dtMFl3eDk1MW9USHBjKzZDQjl3cEhIalE4S0xhTVJSQ2lmSmVzV1pR?=
 =?utf-8?B?VXJRQVQrcW81Um1GaWlId0RURHEySjI2eVZ5V3hScWY3b2hMVEFocVBTM3hw?=
 =?utf-8?B?RGt0R00xSmtIWmpnQTZDbVo2a3lVUmYvUlN6eFp4aHlvdklDVmM2OWR6b2VN?=
 =?utf-8?B?dENTUjNaVXNOWkxaWnYzK1lJY2x3UlpIbHdNY0hyVGlZZWNXWkNaUEFUSEZD?=
 =?utf-8?B?dHRhU0NwWWRCQ1J2UjRPN21IZkR2bnJxbUZNN2t4eHp5QmY4b0RoNWtrcDJN?=
 =?utf-8?B?eWdtT1cvbE0zci9pMnA0VzB0UFBMbm8vemNyK1Jmd292cEh4TEZsVDgyOGhl?=
 =?utf-8?B?SE1UaHh4ZnQ4LzNIODlJVmthc1BxZUVUZFY2a1NTaW1FUUJ5a0h1WXdHOU04?=
 =?utf-8?B?Qi9XMjkxeklxNGtucFFlWGRJZFJHQjhibzdWNEJIdGtIWlFzdFFqSi90U0M0?=
 =?utf-8?B?QjNFTGtzM201L3RDd016SndrU21sTFFRS0h3SWU5WjhkVGpsWENYbTVTd2Zn?=
 =?utf-8?B?TUhZUXM4OUVSK0tLQXFkcUFDMTYzVjBlWW9YcEtQb3ZCOWFjTzczMTVFWHgv?=
 =?utf-8?B?WDcyYnBURjZIcGdKaGdDaUs3N09nZTU1MGxmWExOdFhreS9Zenh5cllWS1A5?=
 =?utf-8?Q?5KSK1EtRHrdoc5HI=3D?=
X-Exchange-RoutingPolicyChecked: Mo10o1/Zsq4a9k12B3BH9U7jW8qTrnMNRlDW/LrAQ077XDXLaKhbkOd8HTb3E37kljcLoYlj65548aJBcEUFs9ck3uqglKO7pRFE/Tar2RbdGgaepDu5oPJPoH5vHun0cfQsst9MJ3QGRIPq4LXw4J+Ctcv2OFE8YjpylTf7Btx9McPWJPsKjxJnqxETRt7touyFCpZnmHYIALt/r1y6ggFi69m+Yq8J8HM/WFGz6EvnYBXDuHNIc+ub0itVLMrwu1mDmBIs1qD2ydV+wkCk/i9JTmX/mLt/+qHx9bmx2k3IbbagV6uewW5yUE00bJTGoKj1gIgLufW1GV8h3aNRbg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 209e2f6a-69fa-4139-367d-08dee95b73c9
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 08:13:33.0619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1gVHoCbIE73SVOhwpx7+IHtY7osOCfWu3aRr0TbHsQJ8a6hLNYQz1ujMFGBK71pH8aOGADniHN508fZotd268WoBd41ztHIVuzrRmk3oGJU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6155
X-OriginatorOrg: intel.com

On 7/24/2026 1:31 AM, Kuninori Morimoto wrote:

>>> It is calling snd_soc_component_initialize() / snd_soc_add_component().
>>> We can now use snd_soc_register_component() instead.
>> Noticed it only just now, why is "probes" change split away from 6/12?
>> That's just a nitpick, not a blocker.
> 
> I have found each "snd_soc_add_component()", and replaced them 1-by-1.
> I thought [06/12] and [07/12] are independent.
> But I can merge them into one if it is necessary. Please let me know.
Only if there are other, strong arguments for you to send v6. My nitpick 
alone is not a reason for generating additional traffic on the list.

Kind regards,
Czarek
