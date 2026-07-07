Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54769397331;
	Tue,  7 Jul 2026 09:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783416645; cv=fail; b=rZ8d/jEZsp8JkdboLKqRjJvQhh58hKRT3awTRrKw4qro2zwpYIA+LmJ7FbhPcv4N8TKhw451Tlo9MA+WtxhFH/ZNDy+1qaDIeDqreG2Y6S9ZYtIq2rk4IMr0kGo7aWqzoAw1zbkuNQ5A7DWodWtVN/nvILPFec0VM0L2/JR0wis=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783416645; c=relaxed/simple;
	bh=tLPtiNJ9pPB4AanyCDJvpB3zZziL7y2aRoISxb30krY=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nCXUDQCA4XyW9GZLWE4Kw8pwf+CKp+sLTfoThHmb4kNFb0OWChJMikCqkaY0NWYGgbg+Zh+1uLsuDs+bzeUN5PEW+rpwOahIAUJYCj9w8B091g1k3OaF2b3Kz7GwyVsCs7yqlBlfa3k2/n+xrHZVUgGFSGQWUNn6lZxxeufJLRs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D4ZNYEer; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D4ZNYEer"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783416642; x=1814952642;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=tLPtiNJ9pPB4AanyCDJvpB3zZziL7y2aRoISxb30krY=;
  b=D4ZNYEerOubz0xHeMTzFLbPK8rCO9hSZyfKH2fwx3XnPmYhFAE7H4qdB
   oBL7NjmJPJKB+IBpN1nOZEDDK4s9mpQ3bhuAwx7Oo7jadFdvdjp6SCROE
   PFPDyN5rNuY5HP7cYp7K8BDUBkiM/z8xQH7f+WIDov2vsK3mhUU4EGOYY
   D4dDOPE+z6QJzxlixmXE+AVlJQk+8v6xOjtNnB9Rv8XgvX+7jSEYMCZLM
   Et+z4WWXu9hqD9rDcqKCu5HXeTyOxrJgkJBYqtd/QV1XMLVUuMqJkf/72
   LE81B7qi2rx89zqzl2XwndoDmpevjNpgoxJYNPVt1GZ7RdlogwHnAZSJf
   g==;
X-CSE-ConnectionGUID: 8FqjzmozRd+1sVrUrbwWHg==
X-CSE-MsgGUID: nCVnwClOQn6GRtwNOVhdWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11839"; a="84081816"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="84081816"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 02:30:41 -0700
X-CSE-ConnectionGUID: imWFmjGbRkKcvPmuqk23Bw==
X-CSE-MsgGUID: 7XYtxssMQHCzjb3PaBmCNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="249965784"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 02:30:41 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 7 Jul 2026 02:30:40 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 7 Jul 2026 02:30:40 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.13) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 7 Jul 2026 02:30:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jWOzHJorYEs+LSY1koqeXg4iETN/03RobYyuAa7nmjais3vb+YaS1XWvuvuBo5e46XMegUS/mpcnPHSGUz3IOn4wXvaRLQnb8fo/zIMMOFSWI2KQnd+CkV5SuDQtLe2kPeOXJ7WmhlR43e4QpNU/5JE76LhmNuKw8aXaZLN0FPkJ/bM1oQt/UVdyrKFJxXIMXJ9qf2MgAtDN/lSPXMK2X8lrggwX/swL98uL34HnXp2i3FWByljFQ9GKNJuEGE6sitP8W+w855DjpgXKEarx7l5WhAcYVaWB+uHLSzJsfK5RrOcJaRXpg+mGMvWEP7bph/omOrgVeBZwa0U+kuRBew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7t9vtHAcM8SdJcRu2AvOcUr2qAs0bGAofLGovVDtqcc=;
 b=Ba4nEjEY0u2w6c5AeAQhJ2mQYhjmIrkZtmzAys+SYgMkevHaR7QPla43PWfxIgjkA3UwxvyvP4IlCRr7+/XkNDBPaGKwucHkyaJmNpdiaXVCOzNJf8Zn1tYBHpG7xw8yIu+YuH9jzkr3hkq5lX3MzQtmZfwHLPQDsD9jfd0H0NHBoe7T5jATdiU0bF0iBA50GsGRNkJ/et6cXBIvqGU1dUJsCvbT7LhyFOgRr1blW2W5Aj3k4MeD4AlwH718KMJbRvpaeJYpzLPUjzKSmDmMqdLhR8sC42hXqKtrFGQ/EG/Vm5NvrwoON1hxzi+X67VqMdISJTYX87lybJwa7gSmyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by CH3PR11MB8238.namprd11.prod.outlook.com (2603:10b6:610:155::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 7 Jul 2026
 09:30:38 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%3]) with mapi id 15.21.0181.008; Tue, 7 Jul 2026
 09:30:38 +0000
Message-ID: <0891c2f3-d487-4d61-a3e0-719463332b21@intel.com>
Date: Tue, 7 Jul 2026 11:30:32 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] ALSA: Return -ENODEV instead of -EFAULT on
 module-get failure
To: <phucduc.bui@gmail.com>
CC: Kees Cook <kees@kernel.org>, Dan Carpenter <error27@gmail.com>, Cen Zhang
	<zzzccc427@gmail.com>, Len Bao <len.bao@gmx.us>, Mehul Rao
	<mehulrao@gmail.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Jaroslav
 Kysela" <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	<cassiogabrielcontato@gmail.com>
References: <20260707084506.718583-1-phucduc.bui@gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260707084506.718583-1-phucduc.bui@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR03CA0070.eurprd03.prod.outlook.com
 (2603:10a6:803:50::41) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|CH3PR11MB8238:EE_
X-MS-Office365-Filtering-Correlation-Id: 67929b51-2721-407c-a383-08dedc0a6775
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|366016|18002099003|22082099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: 2jhezfpPHKPcK4mD/8mopSHQ6rrv3bEM1lolNQW4Gnsbc830np8b7hpaj9t+dBRyfKT+rULHBeGwZUHvnAhcjlBHJFpGsPBl0IaXWCvtyRAYD/5OGeOBMLwU1pxLkFBtOiI1l274m0dE00whRzdcuPtq50uzDjBSGWZjCHonwA7RthUqr3Q5U7+/BaKbiqsyKuztYvqWho4j8mElIv+VKTKDuu7lg2TAqWP6jLR1iYe7i0KwoEaLWiQRwsad3G/+59ykwk9l99JSva7kDLi1/jNYwbCiLNcsfHqFTowk9g9MCqBK7SjTlQiFQlvK1fhW9dmuLHAgQfI10xRCDTkoSrl5Xoaw7L3Rj/j0h0JRFc+OztDTG16fuprRa9lMSIf3KFaUWgJFWrkNbwdoQXvbXpx+Y6VH7dcCETIlaj45RZEZVomXkokr5RotxKa61nZEdn9/Xonh4QNkVJpSsnUNpa93IdAsV7iJGo0tGmL5c3pcAL7frN3SaF8tfnYjdKhwjplHd/ODWPFSc3d20qMs8+SaRueU9y8t1E34HlsBjCIt3XtsAGqvV4h90FpPDfr4Sj5xgw6Imlw4a18nHdfI0IG3o+RAHkmI3KoLBiBsB4es1sIHx/IaYkw9EcVI9DK0CmCwophEGeM6ypK43PrK3FbX/2e1xkX+ulW/7TL+ZoQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(366016)(18002099003)(22082099003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bkh5UWxLa0JjMzhyVWRUcDhjWVAyWXVMSk4vdVJWNHBvODQ0NU0xQWFxbWN5?=
 =?utf-8?B?eHhLcGFnYmZOejg4L05xK0NvbFp5Z3FrUVJuRFI3S1VZeXVGaE9Pem5SSmM5?=
 =?utf-8?B?YXQ5N2RSem1zdVNVTjVYeURPWDZrRDg1ZkFnUTJYRWxpeE96bG56V0ZMcmdT?=
 =?utf-8?B?Q3hnUUwvSVdHMnRwSGhZMTVXQXFscC9CKzNSMnk2MWNlMldVeWtKdlNaVzVW?=
 =?utf-8?B?Nm9KSGFxdmM5R3ZFVUpmak4zT3pkV2EyeG9LcE91TmN3YnkxdmFmaWR6TkRM?=
 =?utf-8?B?SFlHWTdGQWo1SnJJekZMcklkLzdVWFFtZFNCQ3RjS1FhRUxUd29oK1VGRDJC?=
 =?utf-8?B?Ujg0WTRJd09NL1JyRzlWNU82R09rZVJMS1pMQWMwZXdRdlhIQUlIZllnWkhI?=
 =?utf-8?B?VUxHWVZ4ZjBhd3lVczBqRUU5UmtKY28vdlg0R1VCSVkxS0hXN05xc211UHZD?=
 =?utf-8?B?WDN2SnF6eHpIS0NUcko0bTlnSFVQNHlRVVNMam9QTituN2lRcHZZdDlPZWNO?=
 =?utf-8?B?ZEZFVjVwdnNQbE9SNlErMG53SzR0NnN2S3pCU1dJY25hM2MrYk5QZmZxeHN0?=
 =?utf-8?B?d2pYWjkxMjl6RHJBK3lsYm03VkQ4VUNMQkRjZEhoT3FqeGpBYjMvS2VVZ204?=
 =?utf-8?B?ZjJONUg3QXF4Q0ZUR2VIQ0h5eCs2RUJlUDAzOEtVKzQ5ZWpEUFBQQzVrMUhZ?=
 =?utf-8?B?eU9YNlpPQllmQnZCMEFVbWQxTE0yOVhMM1o1cUxtZ1JpejV0U0pncEYzTngz?=
 =?utf-8?B?ck92L2ZzYk1Ja2EwaXRzUFdoNUtZWDJWSEFqR0xTQVFicHphR25CTXpoUWNl?=
 =?utf-8?B?bVZSRHc4dk03K0Z3WmExaHA1Si9xTk56NVEvZ0szbkRXaGZOUmF1MGdzdzJG?=
 =?utf-8?B?amRINVlDLzFDcXNkZi8rLzhKd1ZtbmZZS1pRT0Ywek5reVlGdkxyVGdqQTRT?=
 =?utf-8?B?MWdVZDNudEhLMU9NdEIyU2FjeDY2VGFieTRtODBkNmp2ZGJMV0MwdTRGK25h?=
 =?utf-8?B?Rk51bkZEVkJ3RTFMOXZnQ29SQ1BhUW90R2h1alRVYlBLd2wvc1hRZGwxNVI1?=
 =?utf-8?B?QzBCSkJQeStLWnBrdlZSZnpRTHNrVUtNNW00K3JEbnZoeXZkZTdxN1hSbkhW?=
 =?utf-8?B?WS9TL0UwbW5WNlRZSlJUNGQ5YXU0amhDVGYrN2haOEFYSCtJZ1RJMGlINmoz?=
 =?utf-8?B?NUZLMEw5eFk2NTFpb0IxUVZNOThoOTFOSWwrVFIxVnlFOEZERjRzNHZjanI0?=
 =?utf-8?B?ZXBaM2xxMkpmN0l5WHA5aUIraVJEak9zU0xMeUFNeWV4SkxhMUFuWjZaa2Ju?=
 =?utf-8?B?cUdocmFsVWx6Z25VNzhTTlZ4ZnYwZ2ZxenJwbTdQRXVtYm0xUnJQRUlWa3px?=
 =?utf-8?B?aUZmU0w1QkVyeXBmYmZ5OWdjTDY2eDBGcVEySWszd3NZMlU5Mi9ETEt6enE2?=
 =?utf-8?B?cWY5dzhuUXRxYnlwbjdqejN5SVhKZGZpOE42VUwwSjNReWpxMFAxbU9wb21V?=
 =?utf-8?B?azlnQXcxcUxxSzVyNXpsNTUwRG5reEtMU3BmMnc3clpWVFMvVFFGVzFmWDJs?=
 =?utf-8?B?VUQyblo0bkI4b09jWElyNnRpRUdVUnFxRitGSThSbHZnMzhXZUdBQ1VEMlMx?=
 =?utf-8?B?RkErWTdoTmxja3BaOWh6SzBWdWdxa3FEaXk5QmdPSEY3Y0hOTnFBMXZjR0tO?=
 =?utf-8?B?UFZDVlpDREg1SlNQQVhJejJHTG9TdzZUTXU5TWRTRFhoUTV3bXhiTWlTSTE5?=
 =?utf-8?B?dXlrYzFlN1lzZ2R3WmxJY2dJRXpVT2VyZWJCUGlyblhmNHh5bXVvcWhRbWpp?=
 =?utf-8?B?UXNLbXpvWW5oYXZGNjhuMjZ5OUtZNlFFMnBaR3hXcFEzZ3VBMlBPNkJSNFd3?=
 =?utf-8?B?dmM4bEFtQzFmREZGKzNjNDQ0Rk9YNTVVdmROUGl6SnZ2NDVwczU1TGM5ZVla?=
 =?utf-8?B?MHFibmVWbzdxS1dicW8wb2VvM01ORFY5WnM1aWNaNDhLR0w3ZS9JOG41UHdN?=
 =?utf-8?B?QWV0QVQwcVo2VjY2RkRaT3gvSTRYK21qM1lrSEdnK2F4UWtyZnRIcFh0dTZa?=
 =?utf-8?B?WXFnSEhDRnFDSXhkc0gwQU1BUDF5RkVjT09VUFNVM0ZJYkFJaWduYTl5T29E?=
 =?utf-8?B?SHMrSEZ6cUxSUC84S0E4WE55S0pxTVpyWjlpSXZYQzFrRitXTUVDMTBSODRE?=
 =?utf-8?B?MHJ6MlFUN3UyZCtxRVdkNUJpSDRBN3JlWFJDUmx6L05GWWRWWEp3ZkloUWNS?=
 =?utf-8?B?ZHpydlRFcmVJV2grTmNVcklSNTlUNjdUcHcrSGtyVHJoT21xeDR2TStJZlda?=
 =?utf-8?B?N1d1clowUmJwTzBINTQzOTljaWpiN1VJcVd1THVBVWFNWEx4a2lFa1JocldW?=
 =?utf-8?Q?95t4rNbi3gyY4b8E=3D?=
X-Exchange-RoutingPolicyChecked: R9Dl291iZ9RcC29H5DK5IjrL5TxsUz9oqblDYOrumAx5SwzdBmsWZa+jodDOBDqBHMrFgdrOhq1VvG/EWSrLU01bdCrJMyWzYf8DhsoHkDZoVu9pSulb/aG44ijFsUR4BsIDUJdzJrkS2P0fGTCMr5b3eiaICTVflycFxXOI63a5hWYn9wj3D227Bn48tzJbyiGO4GlQHUIcJDV2OHglM27U4Hjj+dsbiMxuFOMGxQcAYCEkSjEwwZymQ9a1/FVsXxJ2cM1iEeLUZancSlhWc4L72+xTe5Z90VXk6nVxbhosn7g13ZCUWTV5Sh+ZeN/CRdIobSmd5g2yynxGWfJyiA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 67929b51-2721-407c-a383-08dedc0a6775
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 09:30:38.0272
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5LgRXsCd9qp900YJ6e7DiCC014+H0D8IOCAG/F3rmKqU6JS7cuX0x+z45uDYcbWEPzAX0P1l1e4QL/UzsATwxhfRbHBx55bngI7q0YsBPbc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8238
X-OriginatorOrg: intel.com

On 7/7/2026 10:45 AM, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> Several ALSA open/allocate paths call try_module_get() on the owning card
> module and return -EFAULT when it fails. However, try_module_get() fails
> when the module is no longer live (i.e. it is going away), meaning the
> device is no longer usable.
> This series updates only those paths, making the error code consistent
> with the existing "device unavailable" checks in the same functions.
> Other -EFAULT returns are left unchanged.
> 
> Link v1:
> https://lore.kernel.org/all/20260706084950.49331-1-phucduc.bui@gmail.com/
> 
> Changes in v2:
>   - Update the commit message.
>   - Remove unrelated changes from the "ALSA: control: Return -ENODEV
>     instead of -EFAULT in snd_ctl_open()" patch.
For the series:

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
