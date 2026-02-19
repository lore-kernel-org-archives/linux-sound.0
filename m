Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB1B21ADB7
	for <linux-sound@vger.kernel.org>; Thu, 19 Feb 2026 09:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771494394; cv=fail; b=ZSj+OELMJVN17kVqAFLU+sAdn+9SrIck6bSWEqX8jdzfC0heOaSvK541YnztdmkyosUkTRMaZPM0LYILw9Ny/MZcjwciYeavRd94b1RSuwlagM88P1q/q5EwDa/h4nhx24/KtLzxJlRoCdZaVb7J7miwCTKaAIENhFCTnBCAXA0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771494394; c=relaxed/simple;
	bh=g9yzm5wnQLiRN/cKlIhYY2SVpWhz11Z5pOsT36bd1Vo=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pe5AW1xS1m91LYRYDTO1GZnYcggmRayBR1iRA9IAbvm0YKYQo/WwfZv/mgF5ImVclutY+zp0xI7cQUvq9tN8w+xMOcdAiklm0fgU8dMB6wnx2guhjO3HqTIvFobs+C6K5pbbbTTFFnYwJSqlQSHpaYy1LucIfRScPhS7SSqTmSQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T4ICdTis; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T4ICdTis"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771494393; x=1803030393;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=g9yzm5wnQLiRN/cKlIhYY2SVpWhz11Z5pOsT36bd1Vo=;
  b=T4ICdTisCkRVCcPsznpszbJ8hubGup6zIdOc3rTa1YWRxJmpylrs/CLR
   I4jC+s7QPovwMQ7UyVfNZ4ewfYH3ffBfHlf583/ITh6BqrLIwHe7ZOpxd
   NtUY8zkN7XexnAeOEMW78p5gRWIYaTNiKfj8HzGpR5vCRVACf7YKBGFg7
   MkQ4kuSGudthWsrbjYONeqj+1kyLWoqQGwIJUYetF4lL30noU9T5cKEkd
   Q04PK2BOua+wcQFMdAW39V7oC8M2ILiJ5HD6IFuh4D1OqDM+MBwIBjL3W
   A9qOZKtPpvNaszrGi4xoH4ZNsMld9Rg4v+FOb5naw0uwBEkxnDQfYNg2B
   w==;
X-CSE-ConnectionGUID: QB9umPG+RoKZC7k8vVK47g==
X-CSE-MsgGUID: 1jjE0PSETrynXlmMmqUAaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="95193636"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="95193636"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 01:46:33 -0800
X-CSE-ConnectionGUID: ZqaxCj14TTezvS2ZBQzxiw==
X-CSE-MsgGUID: mPkIjTX0Rie2KZAgviBM3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="237456087"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 01:46:32 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 01:46:32 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 19 Feb 2026 01:46:32 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.0) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 01:46:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nuKDBKuG0qGqP9aizQp4WkKNWUBrWk3jQqbr3FLv2H2/bTOAkFAs8LQ6OT76G5m4ociU/ELumI8CXJxSvCM8XUJSHc8ceNDKHfbQ0zTR6f2bfVu8pu5Oe4raNCQq2RWU0QWKLPS1Pp91+ah8IMeXpV2FZM+YfQg03nkEvaCCC2UrWNNh0VCkjvVMZ/ZmvkCh30KPaR3O0x3+zSujQsCYzbG6c3RMAFrLTq8ZdmU+FfSrFyxvKtthSxSsy26roW2HXUZq35+iytSVbZROppFnmK/nrnQ323Fq6fVxbLQdWV5p/Pr8t4VBJZnVLMCfg9a8jhJkedYqlhNRQy0K9WWP8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jQqOzt/xyT0/1ywustiobkdkO1sp740sm+ZBO2d74Kc=;
 b=d+uLfbnBesvfkry3umPvIDoDsv73SYH2Yx/WITw9XL2p8ZpPwIOXGv68stOGTharJNCUIte2GdftYvqrMfva1y5yOSBvO9LGNtikTzb2uGw3xn6v5eBolZmAWxlK0L44AKXHKH7VyglNM0Rw2VeHaT1hu83pUVB08FXJPQzCix0nYTp4X6zs83j6vnsi41o09lfbAXHFm5OGSt567LKlztYjzqDIW//ywVK4R2ld178JjrwNrIlm3sALrc81RqCtY61+sxD+I+zIebk6ERT0i3tYuE4I6w6F5L0qm9zx858/IrPAqTSbajxhOAJeVNQdX9IcY/F4oPvTcJI23IZC3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8283.namprd11.prod.outlook.com (2603:10b6:806:26c::16)
 by CY5PR11MB6281.namprd11.prod.outlook.com (2603:10b6:930:23::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Thu, 19 Feb
 2026 09:46:29 +0000
Received: from SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214]) by SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214%4]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 09:46:29 +0000
Message-ID: <d220e660-71a0-472e-b402-7a8c0d999908@intel.com>
Date: Thu, 19 Feb 2026 10:46:23 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PAATCH v4] ALSA: control: Verify put() result when in debug mode
To: Mark Brown <broonie@kernel.org>
CC: <tiwai@suse.com>, <perex@perex.cz>, <amade@asmblr.net>,
	<linux-sound@vger.kernel.org>, <kuninori.morimoto.gx@renesas.com>
References: <20260210152737.347279-1-cezary.rojewski@intel.com>
 <8d133f5f-dee1-46cb-b0b2-48a50b747d8b@sirena.org.uk>
 <29563f08-a478-40db-8c86-23977508205e@intel.com>
 <d48daf72-89fe-4ed0-add2-717dcc5d03fe@sirena.org.uk>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <d48daf72-89fe-4ed0-add2-717dcc5d03fe@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR04CA0074.eurprd04.prod.outlook.com
 (2603:10a6:802:2::45) To SN7PR11MB8283.namprd11.prod.outlook.com
 (2603:10b6:806:26c::16)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8283:EE_|CY5PR11MB6281:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ebaf968-607b-464e-7931-08de6f9bc173
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K1ArdGZLRm9PblpXZ2dJcFhBYm0zbUdVelNWOWZEMitHcjlOVU92aWpnZ0FY?=
 =?utf-8?B?ZlJFcnVXTm1iSVBjZWhQYi92RXJWc0xtL3p5RlU5UGkraUpncmJ6c1FsVE9u?=
 =?utf-8?B?aDJNSkxCVUFXZVFGbUlGQTYweCtYR01BdlNzeUVuY2JXWEY5WklGVUd4OFVu?=
 =?utf-8?B?c2hkOGNPdEMzQ3ZPTGNLYU5VZFpndkZFT1dVK0hVY2hEMWdvMGlTYjI3bG5Q?=
 =?utf-8?B?YjFVemcwRTZPdGp1NkdIaHhVRzFpQWRLYUxPTG4xTUs4bUY2N0xXRFQ1RjNT?=
 =?utf-8?B?ZjA1UXpDa2tWd09NTDZHTUNRK1VsSjlEd0wzRzVXamtFcVJKd2wwL1Y1OG1r?=
 =?utf-8?B?dnd4cFlQNjMrTkNtNVFFR2VzMHNiNWt2eHg3cWx4am9IeUVhdDJnTWxvVGds?=
 =?utf-8?B?dFRNTnF4ZEliZ2JkMWdOSm1hMUdkdHZpWmZaNENJTkx4dWIyb1NLaVZXY2xU?=
 =?utf-8?B?SS9sMFgxdFdlYTMzOW42aTAvem1mVVh5aEMvcU5yNEc5dFJCR3k3TUNYMmlZ?=
 =?utf-8?B?THROVVNFSHZxTDNxaUY0YXljMUdzazQ5Q2JkS0VCbXdidlFCOSt4MTMzdTFh?=
 =?utf-8?B?TFk3Z0FoWDkyOTA4MDU0K2dDRTRNQ2ZOeUhkbDlWMFFhNGc2bUpKV1l1Vmxz?=
 =?utf-8?B?Qm1tL0FUUVlVYm5TcHhRcWxocXErTWxRWW1XQWdrYjJWUGM3MDRBblM1Y2RM?=
 =?utf-8?B?NzVlUjg0ZHErNG5weDcvMnNnOXB2ZloxZFZKeGcvR0ltM3hDZXk0ZEhTTS9t?=
 =?utf-8?B?OHZOdnFvTXFKa0dJbTV6Y1FxK3V2NU5YUm5DUVY4QUp4dUhNN0h4UjdZclpk?=
 =?utf-8?B?ZkVuMTZZZzZBK1MzMEhZSWxqOGJqMGZvcjEyVDhhaUpKYzVoa0RTdmxxaURQ?=
 =?utf-8?B?bEVyQStkV3FZK09pZ2RpbzFkZFFzNnQwNGVIWWpqSXNBVHNPVzNaSUJLTXBV?=
 =?utf-8?B?N2hVT3U5ZFV1ODR0NGJ4NSszSUZtbFREblZKZnQ2anErdWdhdWptR1JSRytV?=
 =?utf-8?B?NEI1bFlUR3ZxR2ZkRGtpMlhPNk9NTG00bXhMSnQyUm9tYmJGbmxXdklRb0Y5?=
 =?utf-8?B?MFVrQUFKZFMwVmQ4Y0FvMUFlYkcxNXlYRHRadk9mc29IUUVzTzBhTW42UGlP?=
 =?utf-8?B?ZHZOL3R6QURVTnA0UDVqMnM1YWNkRjRTdkRqTlZPK003aFhoZDRKZFUrRnNY?=
 =?utf-8?B?RDczeGp3SndLbUgxb0N1Q0FXanlhRmYvNjFzQkF3S3lnZ1ZnUmhhRlZpbnFE?=
 =?utf-8?B?clRIa3hNRFFIREpoVC92aEI0d0NDRHFFMVFGTjBIZ2VyT1pwV1RWSlBLS3Z0?=
 =?utf-8?B?QmNvazFEdE1VVnUxY0JXZkJTVFY3MDFOa0t0SVVUZm1lRXJiQmdreGpUTndx?=
 =?utf-8?B?NU1QT3hsVjM1bTN5REIyNGtTbE43Uk5hK3JmYzY0bVlDamJ1YVg0TE1RekYz?=
 =?utf-8?B?QUFSc1dCSjc0RDUzRHMzRDl5Zk0rOXNzaUp2aCtQenNVbUNFL3dGdGpQOGpV?=
 =?utf-8?B?WXRVOE55N3picm9KSFBmQ1RPVnU1UmN3R1NaUGdpTXN5bTkxVDhDcTVKVEhN?=
 =?utf-8?B?Zmc4V0M1M2x2Vms2ZWVHNEptY3A1WGUxbllUMlBDNTJaM0xHOTJFYWp1UDMv?=
 =?utf-8?B?TVdHY2JaR0ZqRkxFOFozN0VTSVM2YU1wR3p5dkQwRlB3NmkwbkJJL0Vjdi83?=
 =?utf-8?B?ZHZmd1drMEhxTTdna2dQMDJ0VnpXVjA1bENTTm9NSmpqdHo1KzQ2OFowdC83?=
 =?utf-8?B?TnNWTDMyRTVSSHhJVjBJREwzajh5bzAxSVByMG96UjJQMHpkRW9BYWRRTUEx?=
 =?utf-8?B?d3VxM0JmYWZyM1NzQ1RudUV4OUVuYkNabjE0M0VNRDVOdjIxaFlnUG9taTBT?=
 =?utf-8?B?R1JTR251emRFUkxzSWZMQ2JYZWpMeU5uTEVFeE9VdUJaNmgxVW1ucVkxamFX?=
 =?utf-8?B?d2xLWU9mZW94aUtTaEY0WkUwaXk5ZGVHZFlYSFRITmN2bmpIam94UndEcFdD?=
 =?utf-8?B?Sk9pMUZvQ3FDOGtBMkNwL0R3ZTUrOS9mUUh0SkhvczlJSGxxN3YvME5hdFJn?=
 =?utf-8?B?cjQvU3BjUGh2VldlbkZmdytzbTMzNWFTRXFleWJSa0d0aStBdGd2bzBSQUdl?=
 =?utf-8?Q?AS1E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NnBKUFEvODgwMk9oaEZWN0cydHJTallmeTVJbGJaYUxmTkE1ZU9HOGdDQlRH?=
 =?utf-8?B?cDd4cXVGVysxSmgyL2tnaGpJYW96T0F2dFVxNnpHTTQ2cUxtV21JN0hZaGI5?=
 =?utf-8?B?T3FNRFhCZDNlS01CUEhMMnFrWmJ3N3NvRzNsWDJya3JSQkh4VlBxUW1HWlNZ?=
 =?utf-8?B?TGozdDhWZzd2M2tkc0pNM0xPcGxmc1gzeGM3dmJBOEw2eVB0U05CRmRva0pr?=
 =?utf-8?B?aVoxRitPRS9CenpIRGJyNkxXWktxSFYzaWwrT1p1RGF6eFZ5TnJOWE02UHA0?=
 =?utf-8?B?Mnh6MEZTVkwzMVVGWU1wR2piOEw0bUFJVm1pZFU3M2RZcEQwZHM1NDl6eVQy?=
 =?utf-8?B?Qkk0WUZIaUtESGIybWtJZ0x3SGxXWW1UVE5iOVMwQXdJM0JodmV6MDhWejBh?=
 =?utf-8?B?VUkvNStwWXozcnlBNVg0VG5SdVlMS0E0bmZXalptc3d6M2QvZjJCbms3ODNC?=
 =?utf-8?B?RDluWEZ3OHpodkNyK2VVQnN3THJyRnVuNmdVS2dQSW1rbTFKaVZPSVZQOVJF?=
 =?utf-8?B?SWhSeU4xUG9QZWRsNGRicXcwajZIbHR0a29xUjdiR3NFdVN0eTBWeEw4Q2RL?=
 =?utf-8?B?Z21tZFZrUDM5Y0gvNGVWVmpzOGJOb1F3dHdBaXZRTFRtajBiSlJud0dsMFly?=
 =?utf-8?B?NWg1ei90YUhVdUdRSy9JTFRSM1VsQ1VxSXNESnBSM2M3anlzS0Q3Q0tUa01Q?=
 =?utf-8?B?L0tnQ0hlVjdFYTVWN0VldTUzTk1yS0ozaFBmNEFTbGRHK1dzeFFlUWJzdmZO?=
 =?utf-8?B?WGtDanVmTGZyR3E2SGkrRGt0VlhMbHd2bEQ4S3oweEFSbTA3MjRWRnc1YUxk?=
 =?utf-8?B?NUhWdFZmcEl4RjBLMWtNdy9EcWJCc0U0dTNUQ3RncksxdzVESHhpTG1pdFNq?=
 =?utf-8?B?alg3TzBLZDg4OWpXZmNvZXNnbHZybUdKRlBJUzhUL3doV1Bpekh6cG5qS1k5?=
 =?utf-8?B?dFJ6WGlWMlpMREFCTThwa3VlcjgzSkg5cWtBR2d3MzJxa3AySDdCeEprNGdW?=
 =?utf-8?B?UFEya05wOFB2ZC9HV3RMRGNxMkZibjMxRlZTcCtnVWlGcXQ1Y2JxWEFkVk5a?=
 =?utf-8?B?dXQwMERRMnRHMk9LRzFFUXJ4SEhlSlhkdGtDTWNWQnNMWVJ3cXlEbFFPZ3Jr?=
 =?utf-8?B?QUdSTERKaG1EUlROTWRqU2JjYUFJQVYwd0ltekEyd2ZqZ2JPT1YxLytvWmF0?=
 =?utf-8?B?TTM5T2RaR2VadjlvamViNldHVXY4Tzk2d1JrdFFPZXhRRVlpU2FzaXJJdy9w?=
 =?utf-8?B?RWowbEVhT3lGdDl5b3NhcnptZnlZMmFQZzFFZUJ2eEhLeXdzdnpNU1lLY0pL?=
 =?utf-8?B?SmxMWnJseWhjUkJTZHFoK0IxeHliZVlUQ0RZWnZSdE1zdmk3bFVKWENRYWVz?=
 =?utf-8?B?WThUODVqMDZwZkY4OWlQeWNueEVhUitsdzg3UC9GUlc4b2xnUDY2NW1pTzI4?=
 =?utf-8?B?ZUFYRkZjYk96S1B3eFArNm53L3RoSmQ1L0ZneDZrYVA3UXd3NlRLSmdVZk9k?=
 =?utf-8?B?L0tTOXVsMzY4M2lJNU5HWTRVc2xkNGNIb2VDclU2aG1zZzduMnoyOTNYMmNn?=
 =?utf-8?B?R21KMTg5QzNXVXVvSkR6eFYvd3FVZ2lMOVhUR05ra0pSK29XVk96bnNJb1My?=
 =?utf-8?B?SG1RUEVQa1NVWndXZWNwOFoyZWREaTNWZ1dJNWpxKzVRbXhyL2NONE1QakpC?=
 =?utf-8?B?L0ZKSStDWUxmVjUzWXREN1dQWFdkVEU3dkhaVWU0cXhkeXgxL042NVVMZzFX?=
 =?utf-8?B?elJuUzVCZ2tJNEhBNDZiM3F5SUcxcC9aMmhteHM5VExhY3phcWxlLy80S3hi?=
 =?utf-8?B?enNhYlZvc1YvNWRQa2F1aUhlUnlvSVk3N0R4Mm44RDlmYlp2ajc3S0R3ZWhM?=
 =?utf-8?B?NHBQNXFZbEZDbzBhM2dMSG53ekREaHl6eDhNWjdCWGJtajB5Rm9KS2pkQXdi?=
 =?utf-8?B?T2ZEK3A0bkt4UGR3K0orNXFFb29IL090UkdSc0pHaThpYVNSVmY3dG5YOGoz?=
 =?utf-8?B?aUl3ay8wd1lmbXBtV1owUFpUR3J5cTdTSkQ1QUdCT281NEIzZy9SRWVWaitV?=
 =?utf-8?B?aHNtRWgzZWZzaWpYVEV6UTVVM0Y2UlVOdlpXRm5vbzVLbmVIVTNtbkpyNEdQ?=
 =?utf-8?B?ZGc3MFhXdkdDcFU0QnhOeDUwU0I1RGF3U0tsQXhFamt1L01sSkZ3NFhOWnBt?=
 =?utf-8?B?U1k2MmVUQmhwWUZFMzR0WTROQytPTWxWeGk0NkpWVUloWUR3L001cFVtNnBQ?=
 =?utf-8?B?cnlySTg1QnA1enhVc25EWDJhZlloak5zSGcvU3MvdzF0ZlQ5RGUwV0srdUx4?=
 =?utf-8?B?czc3eHQyQjdlakdRUmVVWERraXBHZW5iS3JVODZYODQ4SVQxZzVhdytPMU54?=
 =?utf-8?Q?kacMDT9mSZqZZZlI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ebaf968-607b-464e-7931-08de6f9bc173
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 09:46:29.1809
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9KvE4Mx75kRihJ9qZSXOtWWVl8tjj4lU1pAvASu5CWE5DHvwa1u/8VMmoNoKGTw6XUzFtzYwPId0dCYFj7GemR80APinjGrN3Niw7A1F7MY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6281
X-OriginatorOrg: intel.com

On 2026-02-18 2:40 PM, Mark Brown wrote:
> On Wed, Feb 18, 2026 at 02:32:34PM +0100, Cezary Rojewski wrote:
>> On 2026-02-18 2:20 PM, Mark Brown wrote:
> 
>>>> +	trace_snd_ctl_put_success(card, kctl, iname, ret, retcmp);
>>>> +	trace_snd_ctl_put_fail(card, kctl, iname, ret, retcmp);
> 
>>> It feels weird that we have two events here - given the result of one
>>> you know the value of the other.  It seems like it'd be more idiomatic
>>> to just log the result of the comparison, the output is structured so
>>> it's easy to parse.
> 
>> I don't mind either form.  Typically, I filter just for the fails (here:
>> trace_snd_ctl_put_fail) but greping for the 'fail' in the output is fine
>> too.
> 
> I'm not super bothered either way - it is a conditional event so only
> one will actually be generated for a given put but it looks odd in the
> code.  Possibly worth a comment?

git diff shows +5/-18 after your suggestion, so now I mind the form :) 
Shipping it with v5!
