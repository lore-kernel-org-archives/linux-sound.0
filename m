Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643F92D73A4;
	Fri, 21 Nov 2025 08:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763715371; cv=fail; b=lsnCXQAgvuKhsDKZipDk53PmeQA2CL8yzS44rp2gQR/1HfxASknTNi5YtTPKH868Ak6RbVTm/6wHhUhH3wrPXnu9pukJYQXg4qDqKcUzdH/r9HsJyi1pcUWcwHobDPiUQw0hHBnppjAcp1hpWCvY4dAOcuWO0jdMTLTnnggf4+Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763715371; c=relaxed/simple;
	bh=5oEetF0FSSbDI6SzL3oPgY9RD9OUcDTpCO50kytVieg=;
	h=Message-ID:Date:Subject:From:To:CC:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZRxxWdmjw1WyC2EOObYQeX/6o9i91/0zrfKo2jCUKsiXxpxue6iTygi2knjWraRmVKs3ByH/wWXyDaNCseIYdiJpmHEpHL60zHpCxrU+fxhcT4YoF+vpCUKG8Q4xtqrF1a4Lv6m2P0L5l2Jqc/zcdPToBSACA8XOwSGO2ceZico=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BDa+YTfb; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BDa+YTfb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763715369; x=1795251369;
  h=message-id:date:subject:from:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=5oEetF0FSSbDI6SzL3oPgY9RD9OUcDTpCO50kytVieg=;
  b=BDa+YTfbfD7ecM08N9IWPeipb0g4QNH7T4ehWP1DCLUBCMqJK7wF1QFb
   DKkJ8Lz3kKPL8op3pMP3IPmSjyRT8yBJ/zD5jvKQgHRsQoOpaCNZnNnNH
   8fSTeFAWF7uwzm8SIwQbpaJ1d5PCe5RE7/4s56kSqPhJ4Euc4PCBB+jEz
   YW0raWJhxOBB21u26dLR8nDkinJ48O1zvr57cXoBdc/ICwtJMgrUka6zi
   tRt5KRJ4nTdy6s7ibQSh/iszQgKooDXd80dBpyx4HxfDRZm01V6CiDrn4
   BBwKf+GPj1gtdY0H+jq6RuyW+JoRmYkDqLSeLr4sPKAg8T8o9aXXqTvQy
   g==;
X-CSE-ConnectionGUID: QH1VZfzUSUCRhxegauVOcw==
X-CSE-MsgGUID: TvjcDyLaQqW2PDdJZXY6AA==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="83427350"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="83427350"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 00:56:06 -0800
X-CSE-ConnectionGUID: ai/Qob3LQjyU+OY7SAqgYw==
X-CSE-MsgGUID: qq9Rg3jGS3WPIVlUrcGlQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="196111033"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 00:56:07 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 00:56:05 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 21 Nov 2025 00:56:05 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.62) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 00:56:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rtlJIuCyIl6IU/5B/nNpZsNJt+f9krTowWcPtpdiF1OQnsycQOAagMrJ9SQgXSv8mBreiQcj57HigspS/PlQJZMRQvLPHmyhrCW6ntBT7IWVjvgsM4qLE/UpkCBPBEB60K/4jIHF9V27tzcdrgcZc6F93SZxEFscbdVlDrPkX4//Xx9gLWieboP0OzeajRlAJSu/KgfCpOrMmZqdukBa/zXQTcXio1Z1Pqb0uuIxhIPe9dDR9syPmtfvkK1GTf3ZN1xHVlC7mq7ZVuJJBNuZlSVVMEnL6YTHH/rlvhx6T/J56IH7KYLImhJBis2ZrFDmJdrzYufMefyL4756LM61Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fn42LLd1zWRVpBxJbjwjp97zniodkdm00iKeiNLtmbc=;
 b=Xngn8Gddzp3xsWCb/s5w1L636ptCAHalTrxL95GMemVty+KVKK3ew0LU5Ar7miuMwajBLUKutS72iXcQ5fbLYjrPBMAqo9yHE+wnE8CBA76IFf0GIxawUjieUlZLoiNliKKEcRYFHhaBUTMVjnqcB+xehr/h469YuqtvN3BBLEo/pD6pYvflx8wDmhmH6QLfH9C8pBHTXMiMVs5gskKKagTZ96UtZwEBfRtE4aSAg3KEGPaWP2Afo8g5nw6zQCBh+kKjtNXWLKd23nqb062yClsP4JY+morQhgfo+iAVu8dVuGNQfwGyIAfDCG05sVG51soC8I59GLlfCKrGYV1cvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8283.namprd11.prod.outlook.com (2603:10b6:806:26c::16)
 by IA3PR11MB9304.namprd11.prod.outlook.com (2603:10b6:208:57d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 08:55:58 +0000
Received: from SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::3:e0a:87af:d4b6]) by SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::3:e0a:87af:d4b6%6]) with mapi id 15.20.9343.009; Fri, 21 Nov 2025
 08:55:57 +0000
Message-ID: <20910af9-271e-431f-a896-b5216fed1c1c@intel.com>
Date: Fri, 21 Nov 2025 09:55:49 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: intel: avs: Fix potential memory leak in
 avs_pci_probe()
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: Mark Brown <broonie@kernel.org>
CC: <liam.r.girdwood@linux.intel.com>, <peter.ujfalusi@linux.intel.com>,
	<yung-chuan.liao@linux.intel.com>, <ranjani.sridharan@linux.intel.com>,
	<kai.vehmanen@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<perex@perex.cz>, <tiwai@suse.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Abdun Nihaal <nihaal@cse.iitm.ac.in>
References: <20251113120447.86911-1-nihaal@cse.iitm.ac.in>
 <24e5abed-9084-4f3d-b620-e272164f687e@intel.com>
Content-Language: en-US
In-Reply-To: <24e5abed-9084-4f3d-b620-e272164f687e@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0031.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::12) To SN7PR11MB8283.namprd11.prod.outlook.com
 (2603:10b6:806:26c::16)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8283:EE_|IA3PR11MB9304:EE_
X-MS-Office365-Filtering-Correlation-Id: c122ac11-b250-45d9-0c32-08de28dbc96f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N1o3ZlVBZk5lcXVEWkdNM3NyaXpsY25MOXYybmQyNlZUMW9UOFhBNWdyZjRW?=
 =?utf-8?B?TDZDYTVkVG1qVzRXb052b2VrRHpvL05ybU8wcmc1WTdqanJuN2ZPbUxlVEpx?=
 =?utf-8?B?YVJiOXpNWk9OSnlXUHgxbUwxc0VYMXMrK0I2N3FUdytiWVJVWm4vV2JpTXJa?=
 =?utf-8?B?TU9NYisyOWtLMVNROGI3KzZ3Vy9wZzJ5b2lKOEFENzZpVGNMM0JaSkxIRU80?=
 =?utf-8?B?TUQ0V0U5c3N6ODNLT0VVT25DU1JOUVdDMzBhSG8wcHF2M0NhcTdYdXBDSG5j?=
 =?utf-8?B?QjNTZTZ0MnlTSHlyS3hBNjZ1dU9RM2NBcDFkNWRPeTJiU2FCQmZMb2kzZ0FO?=
 =?utf-8?B?N3VVZEVjNXJiR3ZVYnA1M2hpM1lSRitJZkw4RjJuVVNtaitQVmtodnR0RWpH?=
 =?utf-8?B?NEVqUk03OUJlQjB6eDE2UFJSMGRDQllUaVlDRnlQUnBVdStwRER5dGp3ZGhO?=
 =?utf-8?B?RTR1Ujd5UWNIT2dNTTczeS9zY2x4cDh3YWtvOFMvMS9wZ3J3WUorRVBYZDFm?=
 =?utf-8?B?MW0vL2R3VlNiZlhHN1N3ai9wYU1jWi9xOE1tU0lORjRPZzZoeHpDZVkyaUdt?=
 =?utf-8?B?MW0yRFVqZGx4bjNWVTdqeHJMQ2dacHZoZEZZNlF2RXhtcjk5TUVrdWVQdWxm?=
 =?utf-8?B?ZVNWNGl2TTRJSmszVnA5aDc5MjZ0dWh1dHU3ak5FczhGRjdvcjV0WU93dGp5?=
 =?utf-8?B?a3pXRGNzU0xrSUNxYitlL0xjQmE0R0JVS1BQTUFwemZXeDdya1BDQVo4THZJ?=
 =?utf-8?B?R25GYXRNcVk0dzIxTjl5WDJ3aUhaWVlDVmgxdmJodldZSENPUkVJYUczS3U1?=
 =?utf-8?B?WCtBYk10TXY3UVRCWGUvWHgvRk9NT3ZBNHBDK0Y1OEgrWDlxb0xLSDJTMGk3?=
 =?utf-8?B?eW5BOTVYQ3RZMU53anBVZitGVVhWVFRoVzMxSnZsU3FlRFR0SnpLWHNibUNQ?=
 =?utf-8?B?NzczM0hGQjMzVFByczZVZDc5MlFzK25pUTVvV05RMEI1SlVPTXF0QURaeXVH?=
 =?utf-8?B?SlhVc0dOaWJMWEF1azJHK1M0N0JXa0dXVmxpem0zLzdvOTdYM0Fwb0tTbnZZ?=
 =?utf-8?B?bHloejh3dldBR0g4RXRLVXlGVWI1bkdtNUhiQTF0eUpKS2F6Z29ldFRiSjFH?=
 =?utf-8?B?YkFRT0J3V041bUEyZ2ZCSzI4OEVHRDRKU1lIUnJXZEJmY3lCdEhtR3Y0cXRY?=
 =?utf-8?B?NXlUNXpZRXdnWVlpaDBVMnNQd2lxbm9Cc0RDUW9GRHdGcUlURGNFRW15SXB4?=
 =?utf-8?B?VEhZN05SSHBLd3lTTjdyOUM4VWh2Mk9rR05VS2JpcGE4ZkpaeHl3Wlg4cTFL?=
 =?utf-8?B?TXFqc3hTSWhNL1hGamlPNzFmak9pK2o4TzlOa2hoUXlNVk80dGZRMk1ZdkFR?=
 =?utf-8?B?dkk5RUNkQ3Uvanptc2ZoZ3pyMmVPdmtGSG9oN25QUVRqRExVUXd0bFBMOWhG?=
 =?utf-8?B?aXBvRWdUUi8va1BhNG4yMDYxTXNLb2VDZ3NDQ08yWk4yMDZrbThzNzZEZjFD?=
 =?utf-8?B?YmVZY214QmpwUUZJbmRPYU94RWR1NkhqT2RjOFRFeGdJaUczenE4SDFxeTh0?=
 =?utf-8?B?UGQ1UnpEQ1doOGJZYlRLSzc3ditMUHFZeXNaTnRmMGJSaXpnSjBZQ3dIektK?=
 =?utf-8?B?amhkdVpxMnh4TFloWlVBSWpzeW1FS3ZnYVR2ZlNIQTJIU1R4M1pORE02dU55?=
 =?utf-8?B?c3hsVnpVUlUrM01tWmhXVmV5blVDMG1hMG5CaDZEV1gzS3BpU3RHeE0yZFYr?=
 =?utf-8?B?SVMrTnhJUDZ6TWxlTzRKYWMvWjRrQ2lCeXJhSlN3YWY3UjVmV0JxWW5LN0lJ?=
 =?utf-8?B?b3J1MmZJSllxR3djRHpOTTZMd0pxbVFQSlBrOS9qbTBmZ3NDOVlyc1pXelA4?=
 =?utf-8?B?c2tYdC9RdTkranp6MDUzNml6MlBZSm9hT1krRnFUSGltNDk5QjE1ZTgycXlt?=
 =?utf-8?Q?vzi56xHMG100DTtm2nt41LOVzIkqfiHM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVVwRDdOcnZQNlNGWldVWGZ3aVR6VENoT2VGN2N0SzRJaGI3clY5VXFiUjRX?=
 =?utf-8?B?OHZMaHQ3K3RjbjVtNlJTcXlvYi9mNUlSd2o2ZFFVTFlPZ3ozUE92NkY3QWtx?=
 =?utf-8?B?VFQ3alRMZmpLWHprdk1LN0hZVndybEsrQjJoQm1CL3ByYU1pOGxJRWk2Qm1P?=
 =?utf-8?B?b3M4dUNhU1ZRc1BHQjRUR1dHaFo3bHRBMG9vQWxKMlVNTWpiYlU4Nnh6dHZM?=
 =?utf-8?B?WkhSOEE1Ui9DVWJvVE4zZUg2ODh5dkQ1QVNpREloQVpJeXVEQlA5Vlk5eHZZ?=
 =?utf-8?B?cVpyQ2YvNUFudGl6WHJUUEdwTEtmcWFrM3FTdEZEV3Z6a1hETXFVaUM2NnVO?=
 =?utf-8?B?N0Q5MzdDSVc3engxVC9zaU50RnBCMXZvc0tlaHBIV1g2bTRNN3BYaERBZngr?=
 =?utf-8?B?dDk1bDcwWEVxdUFETnNyOVFGOTRwVnVlTWFFWm90RDZ6TzFwYTQ5b2ExODBu?=
 =?utf-8?B?TmlFTkV0aTZzU2ZGMlYvNjZpTk5yK1B0SHVOdEFXcXR0VWVpWENXOWpGcmVO?=
 =?utf-8?B?c3N0ZjB4Z0EvcFlOTC95MWFRazhweU5HcFRKVFhaOUh2YjRDS2g2RzZjNVdp?=
 =?utf-8?B?Qk1Jdkd0Y1F0UXcwaUFnbmN0NHpLM1RmOEYzV3UzSStNVkRway9EQ2R1U2NP?=
 =?utf-8?B?QkZHWXQ4NDJrSHlNaDNNMGYrckQ0V1pLS3daSTBya2R4ckxIK040OVk4Rk5y?=
 =?utf-8?B?VTlqbmxSVXQ0QVlLQjkxSlpaVHlvTk9oQ3dLK05XTW9pSDV3WGEwb2sxdVE5?=
 =?utf-8?B?eVB6S0lQLzVqSlZFaVFwbjU5MFNIblZmM3piN2hwT2NMcWcyVUlqd0JyTWdQ?=
 =?utf-8?B?RE5sbHdNNkhTUjNiRk1GVldJQmFwdHRmbThNYm9ObVlKOENUbXozQzhacnda?=
 =?utf-8?B?WkRENU9ZQUE0STJUMngwbFMyWmFleENJdTBPcHVIbjFqamFnQmQ4WFZJUytS?=
 =?utf-8?B?Kzl5QjdGRVF5VDBXT0I3d2gwTEpYWWZkR0tYN2NIczEwa2pWMmNEdEtxbi8v?=
 =?utf-8?B?L0Y5ZVRoaE56eUtwZ3NuRmZWUXV6dmhHdjdFUnhBejNhVkMvV1dFeVhOMmxJ?=
 =?utf-8?B?UjdqL1UrVGtLRnhUWVRMWFhYU3p5NVlWZDVJUExUWFoyMEljQXZoVEtlcFFE?=
 =?utf-8?B?WVA3RVdFbGkrNkhIUE1IYnZ3QUNUa2gya1BqYWthWFBwcVRQNDFQTnRqcmpy?=
 =?utf-8?B?U0p1azBNLy9qUXF4VmFDMk1oNm5XbmlHM2FvcG1DT2tZb2tURytUQW9GNFBa?=
 =?utf-8?B?a1pRUjZ6VjhrK255bzZVOVk4akNpcHpaUURtNGJRUGJGSmlCMXRlWjVrZ05q?=
 =?utf-8?B?THJZQzNucUFXalhkOG5nZDZKT1NjM2pMWVA2eDZXenY0TEhEdXBKL0RtYXhM?=
 =?utf-8?B?TmxnR014VHBlWDdVNmlkbWFuTjUxNEd0MnprYWRSN2NHcEFwdFp0TzhUSjFY?=
 =?utf-8?B?b2VFR0NtRnlBVE4rQWZBaVNkQ1kxaUU2YTl6eUxVRDZTaDBZRmlXTFJQMGd1?=
 =?utf-8?B?cjR0a0FzdTMvZ3QxNEdYamEva0NDRlo1UnhVWHI2M3RUUXhac2dFaHhja043?=
 =?utf-8?B?L0ZteklEYm1TUG40M25vY0NVcnR0SUhZWm5OcW9zNW5wNWhSZnlwb3hhTGJV?=
 =?utf-8?B?UEcwbWxpd0kvWmVjVjN3dDJUMEhlQXFJWElYS1c2dVp4TXNiK1AyYlVjOFJL?=
 =?utf-8?B?bklpeXljbWFhRWlJNzYxSm5VOTVENUUxd3Y4VXV0K1UvVFZibTJUbm1rcGx6?=
 =?utf-8?B?cGNZSjJ1RlUzMXlWbTlsSnVCbHpQb1ZIVlNCRjBGRE10NkpvOGFjemdFMG9B?=
 =?utf-8?B?bVBxbnZFWmhkYngyU3hReE84VjBHQ1Jka0dlekVBY3ZpL2lhOCsreDJIeFJV?=
 =?utf-8?B?T2RTSFdDN0xYQkI2azdmV0YrRmZ3b1djelAySkx2Z1htWjlxWnorS3JlVlli?=
 =?utf-8?B?QVI4WW02Z2R0L2h2eWhNVGZSb2JzQ01wTmxWdDNFblRNcGRteUE4ODZKOS9z?=
 =?utf-8?B?emZtN0YzMElKcjBQck5Iek8rR2FiTGs2M1c1R2J0dGJxcGZLS2dxSVdLOEcr?=
 =?utf-8?B?b0ZDNno4SW5qbnVjb3F4d1RxMmR6UjB5NmdOSWFUbEFERmdzcU1zTGkyOXIr?=
 =?utf-8?B?a3A4VWdTSk9EczMzaGl6bE1NYmcwU29ESTZ2YjU3SVJXYkJaZ0FKbHJPc3dS?=
 =?utf-8?B?aFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c122ac11-b250-45d9-0c32-08de28dbc96f
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 08:55:57.8699
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Jf50A3VMrYJdYNJ409P3LWxVIz+7rnjc1nfuvbcKokobtlZERwXwGf99xJu7PC6PeGadz3JEPBOmt9rjUEYNQ8MCdrxIZlMjS3uT9TwDYk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9304
X-OriginatorOrg: intel.com

On 2025-11-13 2:11 PM, Cezary Rojewski wrote:
> On 2025-11-13 1:04 PM, Abdun Nihaal wrote:
>> The link resources allocated in snd_hdac_ext_bus_get_ml_capabilities()
>> are not freed on subsequent error paths in avs_pci_probe().

...
>> diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
>> index 6e0e65584c7f..f0d77f3f3a28 100644
>> --- a/sound/soc/intel/avs/core.c
>> +++ b/sound/soc/intel/avs/core.c
>> @@ -473,8 +473,13 @@ static int avs_pci_probe(struct pci_dev *pci, 
>> const struct pci_device_id *id)
>>       }
>>       snd_hdac_bus_parse_capabilities(bus);
>> -    if (bus->mlcap)
>> -        snd_hdac_ext_bus_get_ml_capabilities(bus);
>> +    if (bus->mlcap) {
>> +        ret = snd_hdac_ext_bus_get_ml_capabilities(bus);
> 
> After giving this a second thought, I believe 
> snd_hdac_ext_bus_get_ml_capabilities() is the offender here - the 
> function should have freed whatever its already allocated before 
> returning an error, not count on the caller to free the resources 
> instead. In other words, the fix should update the callee too.
> 
> However, one may say that it's a separate issue. I'm fine with existing 
> patch landing as-is. Can prepare separate a change that covers problem 
> mentioned by me above. The cons is: additional 1-2 LOC traffic for the 
> avs-driver code.
> 
> I leave the decision to Mark, I'm OK with both approaches.

Friendly reminder. Which option do you prefer, Mark?

> 
>> +        if (ret) {
>> +            dev_err(dev, "failed to get multilink capabilities: 
>> %d\n", ret);
>> +            goto err_ml_capabilities;
>> +        }
>> +    }
>>       if (dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64)))
>>           dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
