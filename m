Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272C930BF69
	for <linux-sound@vger.kernel.org>; Mon,  9 Feb 2026 21:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770671148; cv=fail; b=Q6yHw5inXWusdH3S2iruI3Ibnlqby7TjDelK6JA3rQjWuwDlBUKtHtuXA1wPR/A+lbWyoFO+tTtHaIiz1I+Aa9hd95VjvvOU6GKE+uNi7ahp61b9DR9rX/aAb523DktqyL0W4Dd4cSkWTJJ8Y4yXH3l2SsHyV+mvHtT46FeAhXg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770671148; c=relaxed/simple;
	bh=YhMNMBMVupC2+kE95GMUBlhkkWBCu6jsLMuOJnZPMvA=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Jm3Fy2ha9LxdW/g5Xk5mNZOpgrAFa02FOAqywAu3ehqXMApYgHcBO4DtU/C+jixAyx82Beuop8wgiF4EpNvOaQTk2qECbnSHNOiYYq4e5lYepay20ak2Br+/AjQ+mn73y/TKnqVtassW+lKjxZW5IRNe+AyFUCWvf2vCF6PQ6co=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YYvZ8aoa; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YYvZ8aoa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770671147; x=1802207147;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=YhMNMBMVupC2+kE95GMUBlhkkWBCu6jsLMuOJnZPMvA=;
  b=YYvZ8aoarajJt70BQTWzW4nhVPXhXfHQIENwWTmvbEclTOxyKhxefImC
   eLZNdT7f80YZXRr4yPg6+deKsv+JInolK9OR0aoedzF4NOd02rt0sWilG
   jOLrooUEPPcq140sHVyx7356Ok7U1U8vqaDadaxtcI5H/3f0QDGqHyZa3
   +I1WlM8EMxDli35OSCczsKNmWu4/9mSEUs5Wp1Um8r0MCkCxmNh0CBmNP
   odJjdU+Jqu88LD6ZYK4J/u8Z0j13mYfFD12wrGJlOG5QiJX0Dri6yLDmd
   51/6SKVEVlGRnp0q6NVbyC00gzeQHrsA8Ur6GarCtXvV8qIo9jmiRewKN
   Q==;
X-CSE-ConnectionGUID: uieZazlfRIGXi9ayCIu/yQ==
X-CSE-MsgGUID: ZgW6VostRSap/D2fSt9nNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71859751"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="71859751"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 13:05:46 -0800
X-CSE-ConnectionGUID: 0BlXsiwaRgWtFXZUyAvqMA==
X-CSE-MsgGUID: qJ7k+BOHROq08T9yvu6ucw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="215869974"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 13:05:46 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 13:05:45 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 9 Feb 2026 13:05:45 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.37) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 13:05:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BI/HEZdNNXKuiLEz0oR2+473/bXgu9g562rirS3S32Kq1hb7k8T3QYg5b6iiBVhJeE4OK+0NBXPayONsKhYVcm5jM1jEYN/u1uZxmF1NDcZlEwYfxzaekA8ik6Aw10YxOyYfDjux4RVO5dM1kgPARhazZTmS8wB9RU8ms0npv+lTjRdOmnHSJyodSKBAWi5u2OXf7htZjfOfLv7Mu95SYF5PywHC29vHXmlKUnnAnnrRvetM1T23lID4xeUlF0Ozd9F9Y+8hseVGrNuaom+a+3kKpl5+einHbbzAld5jrJ6W1o2lqAqwuycZupuYQssHXS3tnWcEQjr+edQlyZm2Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J5DIENWgAu2B82g4pLAGaI2HiAdPrcGefrMh6mHkxDg=;
 b=vbpoG56edPIuBv1AFCqddQqeoMaEoMWpUzrZk+fHJEmgD/oJoDNz14o3p2UcgBA7X6wTZtydNmUojrARBNet01J3IWSExi/5Lt2afJCArmxQ4F5hVRk0lVlafzlCb5hdamTMSNjuc29/zQglAv0qcE/fScrKYykyfZWvM6w9MdeNPi9Pp9aetF1ybU+XBFU6RsXgFbQm0w52atdmT/1uVM+AhUc4JsfZrWSyD0aU79f5E3TktipoUbO0CVmCEblpUdG2VA7GPLGgpWOGv1XBSASpwKaW3IiARz+ob/kXul5yt+xyZHI3qZI404WDnovpvPMbjkXBpnD39v6i7haO3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8283.namprd11.prod.outlook.com (2603:10b6:806:26c::16)
 by CH3PR11MB8153.namprd11.prod.outlook.com (2603:10b6:610:163::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Mon, 9 Feb
 2026 21:05:43 +0000
Received: from SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214]) by SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214%4]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 21:05:42 +0000
Message-ID: <36ce60fe-4ca6-4f8d-b261-f2f0d49a64c6@intel.com>
Date: Mon, 9 Feb 2026 22:05:37 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ALSA: control: Verify put() result when in debug mode
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>
CC: <tiwai@suse.com>, <broonie@kernel.org>, <amade@asmblr.net>,
	<linux-sound@vger.kernel.org>, <kuninori.morimoto.gx@renesas.com>
References: <20260206113250.207179-1-cezary.rojewski@intel.com>
 <87ms1m9htu.wl-tiwai@suse.de>
 <5979bcd6-f066-418e-920a-8d127f921ba2@intel.com>
 <816aa887-087d-4ed2-a6d1-68f78e99e568@perex.cz>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <816aa887-087d-4ed2-a6d1-68f78e99e568@perex.cz>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR06CA0139.eurprd06.prod.outlook.com
 (2603:10a6:803:a0::32) To SN7PR11MB8283.namprd11.prod.outlook.com
 (2603:10b6:806:26c::16)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8283:EE_|CH3PR11MB8153:EE_
X-MS-Office365-Filtering-Correlation-Id: f8333219-d35f-4d48-3a5c-08de681efc62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SFBodTl3RTJYUGVCNFdmb2dCL2ovM3Q2R29DTG80d3R1ZkFmaTNHZ1JCbzNq?=
 =?utf-8?B?RVQrcVQwQjhNVWhZejNNMFlTLzRlUFptYmxiTWlzdDRGa0luWktSYVEzNVNr?=
 =?utf-8?B?Q1l4dnlwbGpmbWJkVVpSbTBRM0txa3kxMGpKYi9DOWNpVWxBR2lnT1dYa0Nt?=
 =?utf-8?B?eGZRKzVIMUFhRE1EMXA5WDU1UXFoeUtOY1JqTXgrUkVBNTRTLzRIQ0RjLzhF?=
 =?utf-8?B?Ulk5Mk9IaUdiZkhwNGZ6aWYvVmg5WktGRGF6MWJmU1kvYUxPYXlSOHZCQjNS?=
 =?utf-8?B?SmFpemtKV295Mzd5bnhPdk1VWGNyK2hCaDRaYUgrL2JqMXVVUnY5bUpPbnFG?=
 =?utf-8?B?RElrYmFKeFhKUTVuUkhRSDJDUmFIVTQ0OVord0pnT2hKeHlZeEpwalZPcysr?=
 =?utf-8?B?djBvaDBFeTc1MjhIaGtGSTBwNk00THRuTVFqUUFPQkhwOXdDbFVsVFpJSmFF?=
 =?utf-8?B?aGY4RlNMNWRjdU5vaVZKc1ZTK0tVaWNhM0o4TVRZU0Y1ODR2Njg0eG1GOEMv?=
 =?utf-8?B?ZDd1YVFYYU9pSTNOOXI1d0UwQUlIcER5cGRRcjd2RUFtVDJ6MzA0M2RIdTkr?=
 =?utf-8?B?L3h5TWxSeW5nTllNdFkzVHA0aHhvd2Z0aCtzRVdmQTRmdnAwUC8wZHJZTWFx?=
 =?utf-8?B?WHpyRUtpSDB3Y3IyM1pnZHZ5UUxrK2xTTU10cThuVU5KSkN5RzlsRWFJdVpD?=
 =?utf-8?B?VWc4ZkdVVVRMQXA1OGlyMVNTSlNrMXpWODlJRXlQbnlPZFYrcFpDRjFMVnhh?=
 =?utf-8?B?RnhGRWE2NnpDZFl2RnFsK3FpTjFJK3paWmdjMXdxLzIzTGpjYmlaVGdwL05N?=
 =?utf-8?B?RFJGdERHbkxsSXVNNWhLZXVsbXlSWDl0TjhSc3g2bllkdERLMU5CMmx4YWJI?=
 =?utf-8?B?NzZLYUhIVkpIVm5XUGlsN09tS3FSVHNzRFRlcW1uRFYxcEY4OG1oOFl2SjlK?=
 =?utf-8?B?RGJFZGQxcXZyQktpa0lCTmV4TDVYZWkyaG84YlVzU21FL0MrSCtxY3dUeUhH?=
 =?utf-8?B?MCtSbi9tRVRxWUJ3enlhakM4eisxN1N1UExlSFlLWkVWUGttUUZZR3F0eEw3?=
 =?utf-8?B?TjIwbENxV002N1JmODIrS004T3FZbllwWmw4cmcycmRFMU5Bd0hzYXREak51?=
 =?utf-8?B?dmdHdDJtR2FEcUpIeXI4WmluVUZYbG1yMG1oTUFLMHlBRkIvU0s0cmY2QWgr?=
 =?utf-8?B?bzlQS0VtNmZWSUdhR3hDd3ZJZUEzWWZjeEF0OHRTNzRnSnc1LzJNY3lUR3RG?=
 =?utf-8?B?QkhKL1ZLMmMwMnlFMStCbjBnNmc2Qkg0WjhVNWM4WDdnMitEN0FtNUNqcHRO?=
 =?utf-8?B?S0oreERNUnhkVGVGVklBWVhYT05EZ2VFTklvRmJHUWN2UzdkVTVVaTBPaXI0?=
 =?utf-8?B?QmdSblV6QjFZVTUzRmZ0a055UnRPcHMxczNHSFhNMjlUa3dwNEQyT3l2WGR4?=
 =?utf-8?B?U3ZteS9TY0xGTkhtc1ZMYk1mRGtyV01tTG1nVjBFWDF0TUNmcnpEZmRtSldp?=
 =?utf-8?B?RDV5MGowV0UwRGRGOHpMd25RYVNTenpRYS9tdm1kMHFhQUhwR2dPSWxpTitU?=
 =?utf-8?B?N2Y1Rjk5ei9YSVdmTHR0cjFRU2NVb2RaMmRENkptSU5Rb0pTV21xdE1LcEIy?=
 =?utf-8?B?aHZHZit2YWdnWFdWTU53NFdXQlIvT3VnaytlUFlGRWpIbldZc04remlaUEFr?=
 =?utf-8?B?TGtxQXdTUXQ0SXRSSU5Qa3lsZExRbTFMRDI2SHJlK3R6eFB4QVE1NFFrcHBS?=
 =?utf-8?B?clF4ZytQZGdwVUdvTWJMVWxEcGFyRDZsRFFLTVJSRURnNDEyV3lKMkN0clBV?=
 =?utf-8?B?Tk84MzdDUVlrUXZSdlBXVFV0WXY5K3owTDdpRGxpbEhweWVQZFpNNiswZDE0?=
 =?utf-8?B?Z0M0R1JvaTRScEpRY00vaG1VQWk4ZUs4TWgxbmdFemFCUHpURTR5NlpHRzBj?=
 =?utf-8?B?WUJMeUZzVVVzVHMzQ2VtMThIQ1BEOTFtdTRHc0VrODhlWm1sai9odHJDb2Nm?=
 =?utf-8?B?dUpnaXp5YWRnOEVvditFbmxka01OcnN4eFN0S0lNTTZucWJTZlZCMUROc2FM?=
 =?utf-8?B?UHI5MUNGdjdRZk5JeHVYYmNYNy81emV6My9yZW5NMkYwVjd0WjVRWEUrQkNz?=
 =?utf-8?Q?lGc8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnFBTkNOa2E2M2x1QnlXZXlaalJkYVRBTTh2M050WnE0dW5nY1F0Z2FhZTd3?=
 =?utf-8?B?K3JvWG9IalRkU044SWZiNkhUOFEvNTg2WDVOc2RHL3FSdE01VlpRSDdSa3hw?=
 =?utf-8?B?bHdYK2ZnbEg5MTc1bTlCN056WTAvWEd6QTJPM0JSU3ZnRG5UNDVFOGZlVy9n?=
 =?utf-8?B?ZE95RksyNngrQk9pUkxDaUZVRmZsNkdUVXBKalBaNC9jUEV0RFd6YWtxK2tl?=
 =?utf-8?B?RVY5ZHdUeTJQM1VJa1NBbkJJeFlkcC84V0tuTVBBQTZUY3Zja00wWG84UE83?=
 =?utf-8?B?NGFzQktjWTM0a3hYNm1pU0ltS09MUzVSazhReW5rcGFCeTRRVFB2S1RkTlY1?=
 =?utf-8?B?cmdEY21zVTV2UDg5ZmZ0NFgzVmZtTzFJWStrTm1XRlRGMU5McTVPQ3huMUJ5?=
 =?utf-8?B?d2RBYWx2MHlmbXY0bDVieVA3OWZhaU5oWG5nWlZtRVVTaDNZRzNiWUZGSnBT?=
 =?utf-8?B?elpvV3V4TE9sQUdrY1FURU9kRlkzZGdEamtEU0NrZDJSeWZhazlIdlRFTkFV?=
 =?utf-8?B?clRFcHFxbHN4c29CclJyQ3dEUzlUb1d0QUkxS0FOZy9DTDVMaW10bmtCODk2?=
 =?utf-8?B?QVNwcVE5blo3OXZMYXppdUE5dHhBOU9HT0ZocE9CcUhDTVBOaldrYnhhV0px?=
 =?utf-8?B?Y3VlYzlVQ3VFRnVkdXJMMmxidGRUZ1VjVzlEdHJrQ0N2VUwxSEhPeEdlaTl2?=
 =?utf-8?B?ZWZXVVliMFU1bEpheFlXTTRBV3I4aGkrbUtENWxucWpTZHRuRk1TdjN6YTZ0?=
 =?utf-8?B?SzdVdzBzZFU4WnFEMmlObWZwcGwxWXVObmZGRDZuWGhoTGgrZUpYWjZNTmNI?=
 =?utf-8?B?bFZWa0EzNXgzWVVKdEkwUDQyNUptRUEzK0xidS9pVjdvdStYTkc5cTFKSmhL?=
 =?utf-8?B?b3FXMzFOakJ2V1BGMlpWN2V3eW5mL2lGTmkzMlEvaVhCaWNQWGVzMGl6MGlD?=
 =?utf-8?B?K1BKdjN1YTdKd0J5VHdKOWtFQnh5a1cwUDdrcDM4TXR1Y0pHR2lra3dZYit6?=
 =?utf-8?B?eGVZVkd5WlpkUCs3Vkt5VlowYnRPY3gxZHgyQWVwSzlZdFpJK0VZMVFwKzZN?=
 =?utf-8?B?SEVORVlFK3lUVVMzd3dtRlhRTnVldy95SVUyMVBQcDFmczhZbnpJTjFWd2Rs?=
 =?utf-8?B?NkhGd2dNNk9EaUxwaUVlYjJJTEYwVTl2Mm01TkhaR2xwK0ZsUzRKWVFOZjcw?=
 =?utf-8?B?bGJDWmJ6cTN2NzNPSWY1d25BOTQyNEdZVFZQWnllTG4xNDhFMlBMOXNSWm1m?=
 =?utf-8?B?cWoyWXp4SXJHeHNxNkdXRzdsYkJVRXFITkNCZ25Yb3JibXAzaGRyU0RNamZl?=
 =?utf-8?B?VkdycDVmUzIzSFE1T2ZJekI1dWptM0wrN0crNFhSaW13MTliSmEzaEFRU040?=
 =?utf-8?B?K3hpVlhXL3BLUSs4M2RjcGdMMFdoT3E4QjkrUnlTNTU1TzQxcW1mcjdIQW9B?=
 =?utf-8?B?UGZETUR3N3FCckpaQnRmcExid2dtQkc3QWxYL2JmdjdPcUpjM3J1cWF2cUkz?=
 =?utf-8?B?RjVDZTN4enJLS3FmVkZlbDBtR1pUTnVtelo5UC9USXg0UzFpY2JNWUZuSGpW?=
 =?utf-8?B?cGlzZDh1YTBGUUpIRi9ldXhEWnN6c1RrWWVZbU9rQ2hrblVSdktXVnJaS0xm?=
 =?utf-8?B?b0podkF5elZSVEFGOCt0dCtKQ2tSRENhcmw0Zk55NWwveFI3d2VNaHVsMFdB?=
 =?utf-8?B?dFJDWjBEbU13VEhkcWlEZlhWZytmZXNoZGNXclZUQWNlaU1wUTIwdENPQUtu?=
 =?utf-8?B?dHFpay90bUpZWXNHOWJBSE1XZGU5SG1GY2IrbVg4UG52Vnhxc0tZdThBVGtT?=
 =?utf-8?B?WlZ0TWM4RC82dkJwQlhvSnpEc25mWFMzN0x4LzhGbkN2QUVBVEpBRHdmTGl4?=
 =?utf-8?B?WWxpWkY2OUdEaWZxNERYSnJCVE95NWJ1RnQrVStteEZXSFpKTVJWRUt6MmJM?=
 =?utf-8?B?d1UrczVHV3Y3V25EcXR5M1AvUUJ6T0phUkcyQ3NuSVpSRXhKZTV4VHRtdzBr?=
 =?utf-8?B?SXdpLzhGQ2NCNFhnL215UjB6U2M3RFh3NmJEcG9GcS9zMWVhbU0xZC83aDVv?=
 =?utf-8?B?NnBZNVRYdlp6TG0yQ05FM1FvcUVNaFdvbERoUVphZHl1aVhmT0o1N0xlaG5Z?=
 =?utf-8?B?bGUrd1FUMmwxbmVNZ3JBUUJSc3pEK0N3MnRHS1NxL1JwQU9DckFZbDRsRS81?=
 =?utf-8?B?TVlZYlVVQTM0VytyYWdRcWxsZkNQTU5UVmd0TGphMmoxUkcvclFaRnRsbWJl?=
 =?utf-8?B?aHFTU1Z6ak0wM2dOTGgvSkR1MDNKMDBpWVREa0tJdnJ4dWVrZVI1di9uK2Zz?=
 =?utf-8?B?OGFUcEU1ZDFtRWlEaDdwUU1SWGxCN3l6WEdoS0JoRVNrYi96QTVadEViQWNF?=
 =?utf-8?Q?Yb3zBQnwwUXE1zqs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f8333219-d35f-4d48-3a5c-08de681efc62
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 21:05:42.7320
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z+7pqDXo2nHXkrgYx5B02m4tTKMDMq9EHGX5MSeQip0rRBllnASoX8XV6Xo0ZtEf0a+Zj9U5X9wZ0Yjbzbse8+5OSwtJog3XcVpXXuGKlXM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8153
X-OriginatorOrg: intel.com

On 2026-02-09 4:14 PM, Jaroslav Kysela wrote:
> On 2/9/26 15:43, Cezary Rojewski wrote:
>> On 2026-02-06 1:28 PM, Takashi Iwai wrote:
>>> On Fri, 06 Feb 2026 12:32:50 +0100,
>>> Cezary Rojewski wrote:
>>>>
>>>> The put() operation is expected to return:
>>>> 1) 0 on success if no changes were made
>>>> 2) 1 on success if changes were made
>>>> 3) error code otherwise

...

>>> Also, this message doesn't show any relevant information about which
>>> card, device and which control caused the error, and that makes
>>> debugging harder.  Put some prefix to identify the problematic
>>> control.
>>
>> Quick peak to what I'm currently logging - output from 'cat trace':
>>
> 
> ...
> 
>           amixer-1185    [003] .....   144.007205: snd_ctl_put_fail:
>> expected=1, actual=0 for ctl "Loopback Mute" of numid=5 from
>> dev="bdw_rt286", card="broadwell-rt286"
>>
>>
>> The format for trace_snd_ctl_put event class:
>>
>>           TP_printk("expected=%d, actual=%d for ctl \"%s\" of numid=%d
>> from dev=\"%s\", card=\"%s\"\n",
>>                     __entry->expected, __entry->actual,
>>                     __get_str(kname), __entry->numid,
>>                     __get_str(dname), __get_str(cname))
>>
>>
>> kname = kctl->id.name
>> dname = dev_name(card->dev)
>> cname = shortname or longname, shortname prio
> 
> I would trace just card number (the driver/names can be obtained with 
> other tools), but add control index and control interface number. See 
> 'amixer controls' output for hints.

I like the idea of aligning closer to the output of ALSA's standard 
apps. For the rest of reviewers, pasting exemplary output from my test 
device:

	test@BDW-I2S-1:~$ amixer -c0 controls
	numid=12,iface=CARD,name='Headphone Jack'
	numid=11,iface=CARD,name='Mic Jack'
	numid=1,iface=MIXER,name='Master Playback Volume'
	(and the list goes on)

Not sure about "but add control index" part though. I'm already dumping 
kctl->id.numid and, kctl->id.index is nowhere to be found in 'amixer -c0 
controls'. At least not on my end.

Example after the change:

	snd_ctl_put_fail: expected=1, actual=0 for ctl numid=5, iface=MIXER, 
name="Loopback Mute", card id=0

Looks good?

