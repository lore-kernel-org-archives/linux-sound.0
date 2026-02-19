Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904A41C84C0
	for <linux-sound@vger.kernel.org>; Thu, 19 Feb 2026 10:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771496151; cv=fail; b=tUypyBJ6O3V2sO4rIrt+AemvbFjlnqPLXCj+SQpLtespR7D2rH8LUqL8LHAX/HwCJ/mwlcFIOSSPIoJTt6W+mcz5YTmwiXd3AT2FUUpXXk+F4hVHdIgLjCJXH1lwqLhe/YPCh/y2oKKik+gcp3kK3Vr+UPc435inRU9Vq7woFjY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771496151; c=relaxed/simple;
	bh=YPRy0uYPWpsiN2o2m9xkAViz5G7obhLEb9szPzi0VnQ=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gXUb+RBBYWHcwyPk4M2Zt4Vbg4M6xpXG9mx82KPpfg/iSkWq/e0U1L0lFxOBTAUc+gH3rnIot9mMoiL+DCrHsQYMkSHywZBwYr+GTN8+CGXbYoa/pGrLMO6+CfYzvpCwFoTPAqpkXKDc4+qXMJ1jHMVtb2M9vAviFWXhnMTJonE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=liQbdr+6; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="liQbdr+6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771496150; x=1803032150;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=YPRy0uYPWpsiN2o2m9xkAViz5G7obhLEb9szPzi0VnQ=;
  b=liQbdr+6xb/hcl5nNf5PXjSAKvayM6Ios85HHi5xGQto1KmUGPRMaijf
   lqUPO8KNovfqbNNmFkuhgLgDDOAZs42zEVUauvvqwjBKBu5IpfdxK6WqA
   faE+Bikt0hyLZOXl6wFGyN5qHv9kKCduPtobxWncYulJ5Q+BJcMsyW8sj
   qPQ1MTKe/ETP38z/z7cHc3duCFnk0KO/VxYs84Rb6M9pmdlaFBXYBGrD1
   qi5JEAOLL3CBmlIxSOXcyG9kXuTdKCfE3D1/nw5ibYUwwqgbPlzfejqU1
   SOyKty0XeePvSNzGWIXkCS5CaX9qzd1wHQQc5fZ04pnu0jlS3Ac+CEGPg
   w==;
X-CSE-ConnectionGUID: SlRT1L/5QqevdTMgbKO8lA==
X-CSE-MsgGUID: xT++TZ9RTk2x3OrAYd2AKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72463738"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="72463738"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 02:15:50 -0800
X-CSE-ConnectionGUID: FS2vaAhPR8qhJFV/Q2MGFw==
X-CSE-MsgGUID: S71Akd/4SVqimGrQh4uflg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="218614100"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 02:15:50 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 02:15:49 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 19 Feb 2026 02:15:49 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.53) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 02:15:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Am3RAJxjPLv9OB1koiUAWREyny1m+mr7tiHR7GkQtzHRr9hOktAv8/mv3kaITs8ssgEnuMXVMefAeOA5GBFxgAFRkM1EcF7OqebH19oLYJqkQtd5ME63tVQV9Y5/LhLL+/lwBfjMZ83eJY51WEHjnXBvgqebzheGOldkj6VpXEAyf3ut9+eC+R5qXlB3Ruy9sDTfRVFig12D70CRo9ZmwsvbkHBjJuaJ4AEMZqMuWNh79SF0K1vkDwdO/+JfMKsZ3mKKqaBTF6NcMZa+HgTxCetOMfapByaibyWL84B7frgrYmLX5eGMEgdj8vXFo/qSESNUqQrHe308JjAjyp+N+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xUcmW4V8FFvXQslRhgeXWcufxlJMyZ/6T5HWsG5eJv4=;
 b=K4Q6p3tJ6E09MPGO9M8TchzopH2SLzaxHDXAqfIMYd+nJt62u3jrwP4/RAIxIS32s4cLwY/G5zsC2+6G/SKesmWob1J4jRc2aJCjDYt42ErliCm6bQNYH0GeleZM1WGYonrj2xeZW0rpy8RM4+ANrB/eFO5WPuH34EfO68O3qGV8e08/S3wuYpreV7IEy+HvfO0A9dUWWQ9aqu7O/DA57eY6wmrRpvSBB6uPcBzbp+QeN6Fnz1U1FMWL73cu0j74Lv0hJ8/xv5pEIxc6/2dU+5EE2u3F45ByGetXcSRq1G3vCVAfLqXIRPgbkCREp44ywi11R6ph7igNRLDbUlILOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8283.namprd11.prod.outlook.com (2603:10b6:806:26c::16)
 by LV8PR11MB8608.namprd11.prod.outlook.com (2603:10b6:408:1f0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Thu, 19 Feb
 2026 10:15:47 +0000
Received: from SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214]) by SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214%4]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 10:15:47 +0000
Message-ID: <2f5d09b7-6cbc-49d0-b1d8-52c48dfadc66@intel.com>
Date: Thu, 19 Feb 2026 11:15:41 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] ALSA: control: Verify put() result when in debug mode
To: Takashi Iwai <tiwai@suse.de>
CC: <tiwai@suse.com>, <broonie@kernel.org>, <perex@perex.cz>,
	<amade@asmblr.net>, <linux-sound@vger.kernel.org>,
	<kuninori.morimoto.gx@renesas.com>
References: <20260219094614.504459-1-cezary.rojewski@intel.com>
 <87y0kpqc4z.wl-tiwai@suse.de> <87wm09qc2y.wl-tiwai@suse.de>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <87wm09qc2y.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0194.eurprd06.prod.outlook.com
 (2603:10a6:802:2c::15) To SN7PR11MB8283.namprd11.prod.outlook.com
 (2603:10b6:806:26c::16)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8283:EE_|LV8PR11MB8608:EE_
X-MS-Office365-Filtering-Correlation-Id: a0afd98d-95d0-4a99-8487-08de6f9fd95d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WlIyQjhpYWlPZjc1V1lMN1FPaTFQcXVRTVVhRXg0azFYdklFUCtRZ05tczU5?=
 =?utf-8?B?NjFBVHZwNmhTM2J4M2pmQVBYbVJzbEw3ZDArcHlCbVh2Wlh6anBCdXpEeWVP?=
 =?utf-8?B?b1BLelNKbmJKd0IyOXQrb2EvTjQyWW9ROTUvMEE2WUk2MmY0a3lNZUpZSlE3?=
 =?utf-8?B?dkdrVTFjdlBXTWg4cFBkbDVUZ2c3bjJrUmRKYytjR2dMd29LdGQ5Z0M1SmlC?=
 =?utf-8?B?Q2w1Z1ViSGFyd2x0TGFjbFM3MW9xblhRdHFmclFYNUIraVk1cVduL25IRkV4?=
 =?utf-8?B?V1lpaXk2R0R1a0MrNjh4ZnBzcnlYLzlxVlo2eWM5L2thOUY5VzNqUDRBSkMy?=
 =?utf-8?B?K24yYStQR05nRVpSemNnYTZHcDZyNlJCYm9xUHVjV0ZRZ0Z1US9nZHNmdUVk?=
 =?utf-8?B?dXp3ZzV0b3BXZ3BZOHZsbUc3c0Z4WElwcnZsdVpOL1VSdE00cTIwcG1LMHda?=
 =?utf-8?B?MFNkb2RkalhvS1VPOVlhcTlBV2dMVXFvNkhvaEFLRkZLNDZicUFWT2cwYUJz?=
 =?utf-8?B?a3h1WWxnSzNoQ1didG5QMVdzbkVadTFnci8rZEYxditQK1lud3Y2MHZmRG4v?=
 =?utf-8?B?N01GeXZ1a2haWExWdlNBWTBSZHRhTmpBeUluVkR3MlJtUXV3NlJnMzZ0WkJ0?=
 =?utf-8?B?QkJLa0dNRGhTcXdLS1NZdnhtYkFKeDNMWk9PYk8xVVBwZGtWZ0pBdG1OZG5t?=
 =?utf-8?B?Skp4VDU1bGlkeDJsdlJ2OU50VVJJcWlpRDMvR0RaUEc1MjJ5US9kMzd3UGNI?=
 =?utf-8?B?SkRyd29ZVHRFVWNQbXEzRUNwRzM1V0pZMFNQQUI2NGNYNml5ekNRL081bFJH?=
 =?utf-8?B?TWdxcU4wYlB6Zmd3UnNaMDFWT1U5d3VMVFBpRHR0VzIzNHl1QzRTRVFhT3JR?=
 =?utf-8?B?TFlEZGNFRExiOTM1OG44M0V0eGE1QzZyMVRuR2dKVitqMWhwb0IrMVV5b2h5?=
 =?utf-8?B?clJ1NTU3ZVkrTHl3UjJ0MjZSODFGV1MxdElRcjhobWE2c3FFdXZ0WFRIb3ha?=
 =?utf-8?B?aFh4STBwbk9rUTRWbXBWM0VYNklzM3JFbUU5NTBQZDdJM2VPT09wYi9NV2t1?=
 =?utf-8?B?djlqN1FPMEgyYUxKZk9mQXFaUm9lSVBwZzVvbitTNER4RGFEd1JDQjQzSTQ0?=
 =?utf-8?B?M0RMWDNiVTdJQi9JR2NRSFJERzlPZmxtZTFaMDR1TzdoREVMbm5FVTA4Slpm?=
 =?utf-8?B?NlFrWmlvZG93WUF1STFpVlNPWmNYYVlLWVZockNYMzduQ0laNHFHYlRqU3Ay?=
 =?utf-8?B?ZkpKdFp0YVljcHE1L2N0T1B1SjZYK2pFcmk0cFU3NjA5REhjTjNWODVhcXVa?=
 =?utf-8?B?YWRPVkVGenBvL0ZsYU85SnBqM1dDMlZpMURMN0d0U2hXMUFLOW5WdzZHQ1lO?=
 =?utf-8?B?S3J5S0VHQ3N2Z0dhRTYwUFlDemRtcVVFcWhOL3h4MnRNbitHZlhWVlVvWm1q?=
 =?utf-8?B?N1VabXFDTVRVbjM1ekZidFBPbzFPSW9zU2xOU2NDMEd5MFh4bUU4RktyTCtO?=
 =?utf-8?B?dnVKU2JSRng1Y0Z4RXdxR0laUGFIUUZzdngwa1J6WDU4dTdTMTd1SkRtSFpP?=
 =?utf-8?B?TXV4cVVram1wd0FEbGVpOEEzVzJvdDlyNVhPdUZYMTdNWEliQ0JiY2Nzbk8w?=
 =?utf-8?B?ZUFJdWViVEpvLzBPS3FjeVR3WUpNRnpGWTBCd2tJNFhMYkJ3UlozaVltVEUv?=
 =?utf-8?B?WEViVDNXcTZRSEIyeUZGQ0NWZkFIUi9lVGJyRzlEays3eStaZi9ZdXFaOE95?=
 =?utf-8?B?Q01DM2dHQVNUOGRxeGFYcDVWajhXZVJyZVhCcTg1YXRqTkpPSzdaZzRFMERk?=
 =?utf-8?B?RVNQYjJsaGVSaXRCT0JxSzdOS3Fsd2hacnVKYndlN1FzSCtWc0JyRmQvZDZq?=
 =?utf-8?B?SlhJWU5uRWlZTVljcUNtS3dCY3R6ZzVhbVYwRTQ2ZVFZQTJMQnN6a3hUMngy?=
 =?utf-8?B?a1hTL0I2QW1CUDNwT1Bmc0JaODlCK3ZCczlrTG1vZHBQRzlvVzB4KzZ6K05Q?=
 =?utf-8?B?dk5jTnd3MEJySnZOczE2QWIzWkxzc3lIR3l6MWw4UG8vdzdVYTN1amFQZGFG?=
 =?utf-8?B?OXl5MDhmaVhCV0RBdDFWMHFoSDgyUUxJVDRtd1UxQk5KVmpxay9XN2ZaTXBQ?=
 =?utf-8?Q?4W7Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmJMVnpKKzcvS05OQURDUGh1Z0h0aG5Gb0M5Ym1tZW8xY2Yyc1NDRGcrejg0?=
 =?utf-8?B?ZFJ0U1lOenFwdnNNTzF6dFF4OEEzN2J5cHVqZVpiY241TTF6bGVXODRNd25i?=
 =?utf-8?B?eVF6VGxTNG50QTZXaWRBYmRlMGJudU5IUUFrNjBaNmF2VjBaMmxYNUpuR20r?=
 =?utf-8?B?cGJteTdqdGxOUXlqVkFSbllnK09meU5sVW5Ta2htTWFJYWpUNG53L0duRUNr?=
 =?utf-8?B?cTBzYmJGL1FjbERyRUw1TzJIcksyK1RpcW14elpQVmJWT3Vka3d2bVAvWENZ?=
 =?utf-8?B?Rk9STVJ3QkMxUitwdGpaTDZmM0cyZVlGazN3Zk5RUFdIZndFaktaWVg2L0pz?=
 =?utf-8?B?d2JvOUpva0ZKbldNZSt1WWRBTExOV2xFRFcwMmFuaWJvOHpoQ0JqaEs5aVJa?=
 =?utf-8?B?NXE1UndsZUxuL3hvL3h3anRtc0E1VmNGbU1qd2hkb24vd0p1a3VLUEdSU1Vw?=
 =?utf-8?B?TTZldFo5emF1cVBWandiRmltUVRoUDNMcnhURExhd01XZ3o0b0o5TnBJSmZH?=
 =?utf-8?B?b1RmazMxWnFROTk3SkZCcUlNemI3NTIxcjdqWUNBQWhFSEhNR2lnL3FrM09F?=
 =?utf-8?B?OW1lT0dPMU1JWFE3Ny93Y2lYdmtlVHRLMHVaYjNnQjBrQ2MyNnUvejNLTVht?=
 =?utf-8?B?dmorZ2JJMUtGd2pFcGpCVUdvOWhLbmxiNDJ6blFlQVFBKzFlaHdtRmZFSDdq?=
 =?utf-8?B?dnpDTWtQb1plMEg2ekJXMHY1czNyaGRzeDFvck81QVNDSkRGTi9abWU2SHpp?=
 =?utf-8?B?dmhFZXRFOXZGdDBwMkF2NVV2dnhkVmJaNHRwOFQyOXRrcnE2Q3JhT1hnbTAr?=
 =?utf-8?B?eE9BREZHa1hyM1VkenhlRllFR3o2a2hKWXdCbEFmY2ZTdWNSRDNGMFl3N1Qw?=
 =?utf-8?B?TWNnOS91dStRaEhuMGhtNlluc0RxTnI2RHBqeUFET080QWc5WC92V2RpM1NX?=
 =?utf-8?B?U2ljVUQ1OEhSKzdPeUJYTHU1UDhmOS9TWXNQem9MaTY1eEJjRHVOSGNIK2tQ?=
 =?utf-8?B?ZDhzNVpwMng3MW9teFcvcVkzcEpqZGdjTVB6WWNqWTRSWVd1c2NTSk4yNURG?=
 =?utf-8?B?U0MxRjEraHl0aTR1bzZtbUpRNkhaZndCNi8zRDZENDEyak9KWktUS0JML2lX?=
 =?utf-8?B?dTZLby9UOVF5VHMyM1ErcnQ0aTdKUUE4RUxaM2dGRlFSQkI1NGFoQjdJb3hv?=
 =?utf-8?B?QVZNNUNsZUpnY3BxaFZKSFp4Nys2MExBaXhhb2U0aHRSWmJheDJmeFBYSXZy?=
 =?utf-8?B?Zk1lYnh2UlZsaUdsZVI0S1puRHdvUlhycHRNRXI3N3haZ3oySlFFOFkvUVBS?=
 =?utf-8?B?V29TWDIyMm92SE9oT29kckJJbmF5YlBaV0FuTGl5eUs2NlZubmVNYnJJNFpB?=
 =?utf-8?B?SThPeTVONC9KdGhoVVNHeEQxd2RsVWJkNlViUkw5Q2RrZW9pMGVhUlhWa1pU?=
 =?utf-8?B?TTNOUmlsVmRQMnNDaXMra2F2OHpkUUJMSmptWlpiNmg0QjFONUNCZTZEdUNn?=
 =?utf-8?B?d2pIOFZWWG5vTW9xa21lcjNIdDY3LzlNVThQUk40cSthVGNvbDlxYVppY004?=
 =?utf-8?B?aVlsd3ZTYVdqbmljeXBzR3dndFZYbHk4VmNuVU1ieTF6cjZ5aDU1Uy8zOWNV?=
 =?utf-8?B?THI0eFIwTDlKRU1hcWhCQU44SUY1WkR3YWp4ZWxLWUdUdjYyS25VNm5KRjZq?=
 =?utf-8?B?dkI3WVdXaVZwVU9QVTR4b1duZ01qajRsNy9LZmpVU24rYkgvMmN1c0U5MWhH?=
 =?utf-8?B?akFTNmtRVXMyZjRVRzdvQVFNSVFlQnFxMkx2bUcvQkx6ZmgzMWpaelk0MWEr?=
 =?utf-8?B?UCsvT3FZejNKYmZ6WGRMT1VTS08vcWs4SENiTVorVDNlc294NDhKSlpGSzRU?=
 =?utf-8?B?bkVIUFBoVTNobmM0Q3dxQnl0Ym1wTXNJQ1pvRWVKcFVaSHBMV3UrV2NxeU84?=
 =?utf-8?B?blZqY3hFUW5uU3RHbVZmOHpDSUpvMHI0Tk54VEQxTzlZeWNvbDdVb0dWQi9u?=
 =?utf-8?B?UGlxajR6YW9HM3A4MFdrSkRvaXdRNGE5aHJFWGF0RjhkaCsrU2xJZElpcnNI?=
 =?utf-8?B?M05PekNrLzF3NUdwVlYvOG9wUFJ1SXRMY1ZTd3BoeDlOQy9GclZqRGtCWE83?=
 =?utf-8?B?T2xWdUQyaG5sSjNSL3JrRXZQQVpPWW9kZzA1MmlGZlFSVENmc3FBQytrVzJn?=
 =?utf-8?B?R2hVMTl3bnJ1UHZnVlFwTnMyRWsyeTA3TVdBVlBUNUJQTjNmWWUrM3YvdzVM?=
 =?utf-8?B?bXdzK1ZKbWdRWlM2SUdPR2srNWZmYTBkQ1hkcDhMZ213SWF1WUxzL1B1MUNx?=
 =?utf-8?B?UHFxWWdiYXJPZjZuOHZZUFYvaVNzMGJxMll5WWl2SzhQTXR6dldyV3NaeTZP?=
 =?utf-8?Q?LnRlbtu/AVLVddkE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a0afd98d-95d0-4a99-8487-08de6f9fd95d
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 10:15:47.3624
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bYlnlhPLHw7km+xoI3wuAZqqh3f4XzJFOYnRxBIYU6qXjnxHE4D43Wdy+8aKcrbwdRNJhO79+oHvRChqkAh1oF/6yoFb0j/Wmj8lVO/vDmM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8608
X-OriginatorOrg: intel.com

On 2026-02-19 11:09 AM, Takashi Iwai wrote:
> On Thu, 19 Feb 2026 11:08:12 +0100,
> Takashi Iwai wrote:
>>
>> On Thu, 19 Feb 2026 10:46:14 +0100,
>> Cezary Rojewski wrote:
>>> --- /dev/null
>>> +++ b/sound/core/control_trace.h
>>> @@ -0,0 +1,49 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>> +#undef TRACE_SYSTEM
>>> +#define TRACE_SYSTEM snd_pcm
>>
>> It doesn't look like a right place?
> 
> Also, it'd be more helpful if you put example outputs in the
> description, too.  Then one can have a clue what to look for.

Agreed, an example in the commit message would be nice.

In regard to the "trace system", not a fan of adding a new "system" just 
for the sake of a single event. If we are going that route, I'd rather 
reword "snd_pcm" to "snd" or something similar. From sound-core 
perspective, I believe there should be 1 directory for the events 
declared in sound/core. The event-names are prefixed already, further 
division looks redundant.
