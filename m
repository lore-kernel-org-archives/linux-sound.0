Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241702C08DC
	for <linux-sound@vger.kernel.org>; Fri,  6 Feb 2026 17:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770399254; cv=fail; b=W6te8DKo8a4NyXnAtAWWlbRJLnt/NWfiUUMuzaasjt5mvOrz8csyqCctlUEVTkrng2l4hMLqSQ6HqgqnAaYlIiauxR8/jduIH+0jX+tliouTu5v0ie6stsyW8Hdj73vACYi4XszxVLpdXp/WOHY1Yh6dOEVBnk6/SczDLs1XNCg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770399254; c=relaxed/simple;
	bh=RhsQpkm1Dfwc+Ad2aPp4cws/m71RgOCQoMTlonbBboo=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZqhDa8EI2aTLxnIZzJehJ5FM6XsnLJ1jtt6YdLRpTiT2s+yE8h9Y4WfxQ+RualqnWA7LHygB+8YSAwRSKfV3myeeftJ4VhLcJEtfCop1y1mmMh/V/0NhjA973lHQGF9SAXjrLb2my+LVvPn33McZwq2fZk8S/8dwxjwugNXe5sI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WTt5F3PF; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WTt5F3PF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770399254; x=1801935254;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=RhsQpkm1Dfwc+Ad2aPp4cws/m71RgOCQoMTlonbBboo=;
  b=WTt5F3PF8lY0YV4ei6+EI1SGaaVnStTEN/vSKXNZ+bD6uq20znanUi64
   vBVcuTTDbPjA6ynAVPaRylUnI9OZUGJGNNPdRBxjvCB0XNpdpMj8LNwtO
   z10dnLb3WC1BazBS4eB633ADteDidTi7f6xkiOO1tiUMDZe7pCXaGqkPD
   HHda2sfcG7mx/5XrYUmIL544AvEzDQgPi1B+t0pfYh+j/3/WQIS5LPGtG
   xfCcOS2J2MBjm8FFBYL6bf2TXb0ONjqrV8ftRyCCsBzLG4q3T70vCQxRy
   4g/rmStwM7DwwRXOWQ1EEsGlLFdLEkjhZxjDYlAdp8JgWO16sZ61wrngO
   w==;
X-CSE-ConnectionGUID: dbqIboAoSIS+MmpQiWV0+g==
X-CSE-MsgGUID: 1xn4F5V+TWiGlof5RIvt3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="82978788"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="82978788"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 09:34:13 -0800
X-CSE-ConnectionGUID: cOJEzjyFT1qwbCsMsoWP7Q==
X-CSE-MsgGUID: 5h5UI/WWR7m5nsT113Pi9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="248553377"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 09:34:13 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 6 Feb 2026 09:34:12 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 6 Feb 2026 09:34:12 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.33) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 6 Feb 2026 09:34:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gt3+XoTGizmlm75j+Qv3JG3djYCgUxP8QiF/qf1K6oLzIXm0JgyAn66D+iIwyXdl2r0pnrCdv0HGb4kgUszySkQiAK9k4b9274HOixpUxdds5W045RcDFfpUY3BGutD4fSnaviJRqFpDdnELeZH1TU9wJfWnb8ym67FgFVxgckvn1SjM0obnEQNdKThcdqNWqLle/P01YtrAO0Ty19a9yjl4XDz4IWwvJDVzt0iHXT+FRu8uAKjMwOapLj3nOFJ8C8KI2wnYY96N6Hej6/ytpAYvvANPcY4gKvkEdKFI/fxyyRKtIo4WjPv303oTFYBfVCTcg8lph/JMvrn0wfbzbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3c2950ehQpNUlhq4YqVU8AzsfEsirCQYiNiGnFyZs8U=;
 b=JsdrVSdbXfEcpKqvZmEX+80+igw+8oDEe94oanwC+tNRO19WcQ4XFq8RpkPyUn5FsHNqDLqQixr96Ys365akIqI8DKPZHnQSjPrWsuVGxZoJTWawlGLDLGyB55gz6fu7KDqGGd0wa8w2ihVO3saqZTfLMVDM1rrZX7Um4G2841GyfyBsKT6S+vrxy3NXu8JDmqtxh4SvK7e84c8LyyG4IXZggGLyhq2PGrezNrb2k1LziITltGy48Ukz14KuDqqdC6SPmfl95iAzo5I6vtmhHWgAJnrd8z9eKI4KiGDk5VGMGGDf8iGLkVWdr0+f9qFdkQMax/7Nflw5C5K8yqSiFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8283.namprd11.prod.outlook.com (2603:10b6:806:26c::16)
 by PH7PR11MB8454.namprd11.prod.outlook.com (2603:10b6:510:30c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Fri, 6 Feb
 2026 17:34:10 +0000
Received: from SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214]) by SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214%4]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 17:34:09 +0000
Message-ID: <745d959c-ed93-4f18-b0f8-7338205dcdcc@intel.com>
Date: Fri, 6 Feb 2026 18:34:02 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ALSA: control: Verify put() result when in debug mode
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.de>
CC: <tiwai@suse.com>, <perex@perex.cz>, <amade@asmblr.net>,
	<linux-sound@vger.kernel.org>, <kuninori.morimoto.gx@renesas.com>
References: <20260206113250.207179-1-cezary.rojewski@intel.com>
 <87ms1m9htu.wl-tiwai@suse.de> <aYX13LsGaMjO8X92@sirena.co.uk>
 <871piy9c1t.wl-tiwai@suse.de> <aYX-MUIqvrHpduQ3@sirena.co.uk>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <aYX-MUIqvrHpduQ3@sirena.co.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VE1PR08CA0035.eurprd08.prod.outlook.com
 (2603:10a6:803:104::48) To SN7PR11MB8283.namprd11.prod.outlook.com
 (2603:10b6:806:26c::16)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8283:EE_|PH7PR11MB8454:EE_
X-MS-Office365-Filtering-Correlation-Id: 399eb894-89fa-499f-b0f3-08de65a5ef76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U0tnN1REdGJSYVZRaGIyZGR0TVlQb0hWbnErT1FnbmYzazVTbU9JWktFbCtm?=
 =?utf-8?B?cVpKaGJXQWViTnU3MDlCY3Mzdk4ydmF3K3FzWmRJS0d5UXlrRHZ1WFRaRk02?=
 =?utf-8?B?a0RnRGVzQVJuZTQ1OGNTZHZiajdmSHhpbm1wOEdnQnJWczVsdTJwNzlVQkk3?=
 =?utf-8?B?Z0l1eFFTWElRam42V2hoVFREQ2kvb0pnYmUyYldrVFR3TWdwZ2x1eFJzbGxJ?=
 =?utf-8?B?bisxTCtrUERjV1BweXdtMkorOThRdTQwb0ZHQkZ4b1cwZ3JZVkZOZlh4MG5y?=
 =?utf-8?B?K2VFSm1yM0RLRW5yUUNkT0hUaWIxekxoeWw2RWFEY2QrK05tVzRycUZ1U0w2?=
 =?utf-8?B?dXdsUEI3c1VOUm41amVHWmIxQnRzaFBHOEFQVjFEMEZ4ZUcyaWt4b3RTS2Ni?=
 =?utf-8?B?SElSSGNMbEtlOWtDcDNobmtwR0gvcXZWM093Z2JOb2xmRC9tMUpJMVovUGEw?=
 =?utf-8?B?bTZSNVBSZHdRaDluRFhDV1FNakFXaDl5WjVPc3c1cXE1UlZlNU1ucUIvbWZz?=
 =?utf-8?B?NmdjK1lSUkdja0tON2d5TEFDMWN5MDBseDJmRDlJcHZTQmthL3JneWVpYmZI?=
 =?utf-8?B?VndET0NGbUpSYjVhS1krUUJyUUk1ck1iZjBrZTAvYSt1Nzl3RW5ReU5Idy9v?=
 =?utf-8?B?UUc1VmlyNUxwZ2VkMGp6Q2NqZzRkbWUybXNJeEFLWE02UEcrb2VpVkNXOTR0?=
 =?utf-8?B?NnhYQSt5Q2EwcTk4MHh0Vmd0VVl2QTRrTEErL2diTElmNENUb3FRaGJvbHh1?=
 =?utf-8?B?R2hnQUZLVmN4ZlNSTjZpRm5EWkVINEZSSU5VOG1UbDN2UXB0aDlVQzNWQUNh?=
 =?utf-8?B?OUFNU0N1Y3FhU1VxRnFJVjdUV2xuSktqaGpWR0lCcmYwdlkwNzFSemNUdzZu?=
 =?utf-8?B?RURFM2JsQkdMQWZENllGVTdmUkY0SnlFWUphSDVTUHBuT3Q5ZWxUNkFCckIx?=
 =?utf-8?B?dWdWUUxBbUEvMnlyQVVDR1g3UWdKaXpJRGlYbW1ZRHhxbll4QVpNd0dDRmhF?=
 =?utf-8?B?RlM1dmsxNlNvVHJtbklkVHM1ajNUbU9QZzE5ZWdzdjl1TTRYWGFCZzZuTUhp?=
 =?utf-8?B?QTJ6d3dMUWFCUEZyM1V1Q0tBYWYzV2FIWlFPQkNVTkQvdEd6cjNkUVFmMnVk?=
 =?utf-8?B?WUFzWk4rYXRwMlUyQzFxQjQrK1JPd0tYZy9xL1NDb0JMSHhlcDRWZFdhbmRq?=
 =?utf-8?B?RkkvNkVuMGQvV0x4T0NYQ3p0K3VkYndvSXY3b0w4bDlPd1RIUmJvRk5qL0lZ?=
 =?utf-8?B?OXNnZUlXQzZUVzhMay9zcWY2YVRkNkI0QkVBTFlHSGIrT0c0SDQyRjJSemxv?=
 =?utf-8?B?bEdEaUwyb1FVMjhqQWwvZFpDNFBLVGE1a3hmSmNndEVUUHBONFpucjhKRFBG?=
 =?utf-8?B?SWhTZXB0WTZMQXZzcVRIdXlIejV3cFdYVkp5WVZoTDNWMkxNcGUvMmdnaGdr?=
 =?utf-8?B?M3F6N1loR2hNR051VmM4QWlYZzd6Sm5TVzFSVHRBZWhLd2drRGtZeExOeTV4?=
 =?utf-8?B?b0RKUzZnQ2x5V2oxMEFucmtmODFqNWJvalVKbGVYaEIzdzJxMXlOaFJRb0x2?=
 =?utf-8?B?OGt5ZUdkTVRTS0NWYkgwSFNJWmVjQUJEb296cWZyZE9VRDd1Zkk1WnNsYWI5?=
 =?utf-8?B?WDd1OWs3Y3lmdTBIUEh4am9COUQzYjIvckJlT2NpV1BFb0NwdEEyV25ZSCtt?=
 =?utf-8?B?NmNGYStlNjlZQlUrakNpenJxSVB6QlR4RVRBckVnYnZNM1JwYzJ4TWxXNG1X?=
 =?utf-8?B?LzhaZ2dGZ1NSWU1WOUhYOGVYM1I1UGVZS2xPTmsza3o5Z1BzY1JhdmNjZUZi?=
 =?utf-8?B?alhqb2V5L0FSQTlZQnJxTWxVcFR0MUJmY2Y3Z2FaUzZ6YXBYbVpTQTFwdDBS?=
 =?utf-8?B?ZkF5L29XdGRSdjZCVzlva0tVTHNLWCt6NUhTcHR1WW1qTXFmRzZaNXpDOWpn?=
 =?utf-8?B?eWpjM0ZRNkhVbFVxZ3BNbkcrSVpCckJDRTh1MWxwb0FpOHo1OHFjV3I0dnBw?=
 =?utf-8?B?dUlsWVVjYnN5ZCtUeWJLSTA1a3NnZm5NR0dtZ2hVaVlrWHRuQkd3MmZyVS82?=
 =?utf-8?B?U29mN21NTngyK2dSSTQ2V0FuZ2VjTWw2NlZ1NEdJenBRbVR4cTV3ZVU1RTl6?=
 =?utf-8?Q?LoSI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWl6NUlxa0hCSG9rUkc5OFBUcyttbmk1TFgzYXQrbm1hMTg3N08zTHozbkJh?=
 =?utf-8?B?bFhNZWdyVE8wQVZFRFJhMVBqaHQ0cjR6cm80ZzNoMzVSQS9nd2c5VjQxakkx?=
 =?utf-8?B?d29SR0Z5a1dwZnRFakpVNk1ENTM1NDJwRmhoUWkwY0QzSnc5QldqMHR6aWFS?=
 =?utf-8?B?QnhIZHY1d05oaitSWHNFYUo0d05hWkhIUlV0aU5SbithZUROaTRvajh5dmlS?=
 =?utf-8?B?YUEweUZMWkRiYkM3ZjhtNS9tdXJUcVgydHFMcXNZUFhLK2NlcVF2U1NHR2ZT?=
 =?utf-8?B?T3JldFZQN2xmNjk3NzNJUkFucTVFVXRMaW1IWEEyL21NNVlvbm5hdm5xQTNs?=
 =?utf-8?B?dVR6UGtUZFdaMU1RM1p4ZTdjZ1grTy81cUNNZGtTNitMUGdCSGpHVHBscGds?=
 =?utf-8?B?aGNXazd5anM3OGlrMzhaRXArbDJWZk5HT1pRTHhWVlhBcDhyZUpSM3I3YUtk?=
 =?utf-8?B?UVN2Zmh1M1NuSWk4cWwyOHUxeTBRd1QzRmlRU0k5a0IwUjZGejIzUVRwd2Zq?=
 =?utf-8?B?M3k4OC9aNzN0Y2k1R2JSQ1FKdUpYNmpqZ3Y4akkzVHlLdjZLWEY4WFh2ekll?=
 =?utf-8?B?Z3J3aGIrQXJvZS94WGFXTXFQWUNhN3hiRUtVdkNkN0E3L3lpNFB3YmFTNUdv?=
 =?utf-8?B?L0pOSG9sUktVM2JBYXBDMHk1TG5lY1NRN01JQndiZUl1N3hiQ2VkT3NITUZo?=
 =?utf-8?B?YTRHYjJxY0dBNUFHSUozeGF1N2ZNWUYyd3ljOW1Hdm10TUlhTEdkOC92U1JC?=
 =?utf-8?B?QVZsUmorNDFlTXRkM2hzQjU4U3RSbnFLUWpCeG55bWVoTUl3Y1FiaXAvZUF1?=
 =?utf-8?B?akpYY0hLNVhNU21RcXdmV3YvR2ZlMGRnWlBSOTJSUm94ZFBMVWVxa1hWM3lr?=
 =?utf-8?B?dWdLeitWWGVMT2JuUUxSNk5vekZuMWFPL2xmdndmZkhUMUkxNmI3aHdFUjRQ?=
 =?utf-8?B?MG5FZ1F3MUlPeG05SVZyUVppUG9LTjMwa2Y3UVlDTVJpMUNyWkdENDUwOUly?=
 =?utf-8?B?akhkaU9RS3hMMGtxbnlNSGYrMUUzYVg1bVNWdWJzT2ZhdjdoS2E4eE9tSFNo?=
 =?utf-8?B?TmltYmRvanFvSHl5Z05VWVJTTDhySTY4ZWJKQ3dQakdKeFR0N1huNUFLdktm?=
 =?utf-8?B?aHpvNXg1em1mMkVUQTErdmVUNHdZRXkrZnRRT1YxZEFtU2Q0U3J5bGFWUWJl?=
 =?utf-8?B?YUg1K2ptZ0dqdndhYUNzWjVyWFRWeU9mZ0pwSFNwaE1BR0VmdnJWbGxkSG1L?=
 =?utf-8?B?SkN2c3BsbG9oSmU5LzFVYzFDZnBwekErU1JPNm1QeGUzcGEyTjBuOWx0bFUz?=
 =?utf-8?B?bTRhWGI0L1RtSWVZeXRwNElPY2tQWTRIUmJ1eWdqL2F1bTJ5TWp3SERLbHJp?=
 =?utf-8?B?RXlqU2lka1Vvc0c2WVBnaUsreTQzMWJ4MTh0RExGVzRBTVliMWhBOG9EQU5x?=
 =?utf-8?B?ckhZR2NoOURJTU9sYVNqb05tbVBrRGVkSGpBZVV0UzQ4bGE4enJ4dFUxSE01?=
 =?utf-8?B?dmU4TnpkZ0tqYm1zM0hkWGx1VVlMeHdhMEd6MjBoa211czhOUGNZRmlqeDRx?=
 =?utf-8?B?TEI4YUt5Z3RqWEhyUVhCc21wUzdZbG9oZEdURC8rNjdTTkZYaUdiOEtJN1pE?=
 =?utf-8?B?RExHcEtLdUI1Q3BHQ2k2dlMrMVlXaitkcnVHNk1DbHR1Wm1tRUVMQUx5U0FK?=
 =?utf-8?B?VFdVaHEzdG9BZGhpOXVjWEozdXhiNjNNOEJVT2VuZHl3aFp4c1BiOVlzbXVZ?=
 =?utf-8?B?dTRuMFE1ZWcvbE54OTQ0UDhSM2QyOWIrZDJ5cXpCT0JLUWl1L0Qzdk1LQ2ZO?=
 =?utf-8?B?Y0R2U1Y5Qmpud1B5YThhb3YvMGRtZmk1bUlZMFhGSmhPM2kxOERuSlRBZ0U5?=
 =?utf-8?B?aFVoM0gxeEhYOEIxakxWMkVQZDBVK3VWOUE5UXBDTWdhR25vbW9NT1Rob21F?=
 =?utf-8?B?VzYrVGxrNmhCd0YxbVozdkZCSW9KK2ZGemJBQ0g4U2tZSU5kbGJ6ODh3Uzd0?=
 =?utf-8?B?a1BBY0FUUVI3T083YXFwdmxDTjhtbVRyR2daQVNZTmdNR3pZcCtmZmFwOWZh?=
 =?utf-8?B?M2I0cEx0QmM0SVVPRTBZZ0NRZlE3bWNtdHNrNUlaam5kWlc2KzZPTzRTbFpR?=
 =?utf-8?B?MEVZVHhTNFUzOTFlN00zWGRHMDZuQ0xqNjJ0bU1lRm9YM3JRYlNNWjZYeTh2?=
 =?utf-8?B?WjhIRFI3UWU0V0ludHhMbDhPQjkwN2lpVUFvM2JnbHhBU1RZdkpqRlJ3K1Nt?=
 =?utf-8?B?RHcwVnU4UEQrcW9PQWV6RXRMejBmd3NrY2tiR3FqZnNJUEN1QjBhNnJRc2o3?=
 =?utf-8?B?ajlqbHEzdHd6Z0ZXeWk4UHRLSks2ZlZUZWh3L1VPMGtuNWV1eVFNNHd0eWtk?=
 =?utf-8?Q?1t9FM8JO2+FpfSE4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 399eb894-89fa-499f-b0f3-08de65a5ef76
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 17:34:09.7293
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ezC5hD7Z382DJzP6vinKNUYW1G7aenrWJde14dVMNDr5RCuBuzksnhgLx+RNsjNIXKiJzTpNGw5C76DmhAb9wdlV7GO9Fm6JCjz621fPvMI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8454
X-OriginatorOrg: intel.com

On 2026-02-06 3:44 PM, Mark Brown wrote:
> On Fri, Feb 06, 2026 at 03:33:34PM +0100, Takashi Iwai wrote:
>> Mark Brown wrote:
> 
>>> Might it be worth considering doing this via trace_printk() or possibly
>>> tracepoints?  They're very low overhead and with tracepoints they're
>>> strutured so they're more suitable for very high volume logging.
> 
>> If we want to record each kcontrol access indeed, then yes, I agree
>> with tracepoint as the best way to go.  But, IIRC, trace_printk()
>> leads to a kernel warning, so better to avoid.
> 
> It does cause a kernel warning, but given that this is only going to be
> turned on with SND_DEBUG and probably shouldn't be on in production
> (given the extra read on each write) that doesn't seem unreasonable?
> I'm fairly sure tracepoints by themselves don't cause a warning (they're
> there all the time in all my subsystems anyway) so would be more
> suitable if the complaint about trace_printk() is an issue.

Since tracepoints are part of sound/core already (e.g.: pcm_trace.h) 
I'll probably go that route. In regard to warnings, I do not see 
anything and Intel drivers utilize them plenty.
