Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE7334D4F6;
	Tue, 27 Jan 2026 16:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769530517; cv=fail; b=GJusmUYk8aPiEWW2BzOVriN2cyznN+bwK6ALd80ngmYHigBNXiiF7S7/LC5ch5O/37jGmxtI7ToZIQ7jAhXOLC3Y+jb5EX/nJHxksSlPcFp9uSJCtBSkurZRZVMI0J0tB4S/GxaBuXu/VViLQqtFfM3ijfg8+IXj6dw1K2NIQjg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769530517; c=relaxed/simple;
	bh=1yvbdqpPKfYJ2mY2fC/W4VvBGqix2G2O+M1iuhtBXb0=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dPptN+5Bxff9xzSmg8YKK4G1qJnTieR94Um6fELBYyWz6BYkO91ibSLwM8L/P7i7hse/9leDhsDp2wzljjJ0hzvy0VgI/zIwsB5hqoK9NWUyue7iLbQ+j3wCjxJtKOYhsXuAqkoRVaV98uG5laM9EdYPbUpzluGLxEf6J2w1L8w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uvbkqqr5; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uvbkqqr5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769530516; x=1801066516;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=1yvbdqpPKfYJ2mY2fC/W4VvBGqix2G2O+M1iuhtBXb0=;
  b=Uvbkqqr5SoWFlE20hyARMkjuNJezje7JxKj5zVCG42BvkzZgt/Ijtsv/
   JLFw2/8rrI9clgjG4O5v2sG8XQl5GfXZkchqDAV/Qbk3iS/mYtvHOptng
   VFTtQYMqGrRdFuBpCmY/93i8hJEIkS7MJSknD1we0pAHuJjtoeLJe+x4a
   Kwys1xapJGypWhZq+ofmX/fuOGvm/I2yVCyX/5lxgcImaHqRDWj2ycKsH
   yCPCzA6/5hvXXSLawQzmNPwUq1es0M5F6vOeDqnTPoofXPrLSTthW3CPS
   MSsoSkcmNi87eH9krCzSCMsq/PtU1o6cea5FHx2qUvq3oZDbVPJ/iIWYc
   A==;
X-CSE-ConnectionGUID: sTmRvXSfScmauZd27jQwFA==
X-CSE-MsgGUID: 4+EgsQ0ZQZS63jCvPPLHdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="74592229"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="74592229"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 08:15:14 -0800
X-CSE-ConnectionGUID: 5w1SiTBFRYWGRz8EUgs7hA==
X-CSE-MsgGUID: fbK1q/UxQymzSGyOgYmtGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="207914527"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 08:15:14 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 08:15:12 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 27 Jan 2026 08:15:12 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.18) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 08:15:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RU4UEi3D0t0L7ZlWPRKB2UPri64dUBRFqpHyihpv1Kw9BY3LF8YT8Rl8mPrsOjeC4kKLuk3n80VOohMSshbdf4jdDtTTYYA3dRqeHZGAmKoRjejzE7KfHBwg5QwTOsh1Q5pyrw3PL97OW7SSZ6HtTs6vihOnspzGV3Y0/wdmGz6crC1gusiCeA2932snMuH02Qyvqw0TiqiGR3yZXol0dP5FbYWzvIDB9FnIHU4amaIAnKMhHBhENagkaQf3igGjjeRlbz2JbOy5DMu9ybrB66wSbhKj5jykqfN1K2rBvMlI45L2wlClMhmNP7NgoqRUKWxaDBofEa5iLnSbMNi9kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8K3w1KtdjHyqJtwYksMLqeAsSjy5EXO86klNVJPt5t4=;
 b=Te9ggszOX/Be3bHfq5+MqQkFLyL4jCbwjRZumFoAOz1ZxwqwHb+W4YpVndV5MExOGwgxO8E3BbY1b6oLoNZGWUXaZM+tlWQZJk/dV+C4NsJ8TyhH7UM/CkHRQ4CV0kX3xYCfAESLGZfZCooMApSpDn32QG/FJhuY/aL470R7HdfbhbTBnclsxyJ/DElr5O/z9luMuKpbCfohKtO1fGVxqr9S6y9gmym+WhWCPrrKc2gcbocBVmwora0bogFwJro0NMkX2S4tJ7BtOm2dsoBKNU/HEJOE1GCEzMuLakw7WI19N1seEV38NAyDWFKJdztV7ch6oN21Lw5vZiaLpVjHKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8283.namprd11.prod.outlook.com (2603:10b6:806:26c::16)
 by PH3PPF383C22AA3.namprd11.prod.outlook.com (2603:10b6:518:1::d17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Tue, 27 Jan
 2026 16:15:10 +0000
Received: from SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214]) by SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214%4]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 16:15:10 +0000
Message-ID: <c2ad8a83-2c79-46a3-a61b-f1808bad93af@intel.com>
Date: Tue, 27 Jan 2026 17:15:03 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: sof_sdw: Add a quirk for Lenovo laptop using
 sidecar amps with cs42l43
To: Maciej Strozek <mstrozek@opensource.cirrus.com>
CC: Bard Liao <yung-chuan.liao@linux.intel.com>,
	<linux-kernel@vger.kernel.org>, <linux-sound@vger.kernel.org>,
	<patches@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>
References: <20260127154744.2583611-1-mstrozek@opensource.cirrus.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260127154744.2583611-1-mstrozek@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIZP296CA0014.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:2a8::13) To SN7PR11MB8283.namprd11.prod.outlook.com
 (2603:10b6:806:26c::16)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8283:EE_|PH3PPF383C22AA3:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dea80ad-51bb-4f2c-d5f2-08de5dbf3e18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bXU4d2VIbHJRNVRCekhLVEw4dXNTcGIxTkpFVXhXd1czSVd3YTN5QzFLY1JC?=
 =?utf-8?B?blZrRFFKdEg3NnFoMnNncnJnWDJMTGFxOGlMYmpmcFFjQkNxZjM3WGlxTWo0?=
 =?utf-8?B?U3FPZytzcGZXOUdCQ2R3ZmIyV0lBYzNIN3hza2NweVJYbDd2ZitnamRleGJJ?=
 =?utf-8?B?ZzNIYSsyUy9hL0cyZDFObW05QURINFFWMTNFdkw4Vm5wSURDOU1yWlZEekNO?=
 =?utf-8?B?S296dVlYQUFNVzl3cHh1VEMzbm5Xd0xhM3JYelFwaGFuMDNwcytjK1ZKblMx?=
 =?utf-8?B?OEZmbGUwME83R3UwMjZaTmJmY2NTNW05RUp3akMzZ0Rzbk9Da1lYRjA4aHdz?=
 =?utf-8?B?YWFXWGhOUDFZalhoWlN0NWdwVHRrNk5xZ3ZQNnBYOHZPT2J5U1Z4eDU2ZUZy?=
 =?utf-8?B?VEJtNnpuNFpqdGpTUkMwek04aHA3dE5ETUhzZjNoZEFpNjM3bzczWTU5cWY2?=
 =?utf-8?B?RkNhVjVYTWFTNTdMZnh3K2lHQjFHb1hSbE9SdlRONm5HT1BoUVBtUkl3MURk?=
 =?utf-8?B?MjRYdVprUDJFMGhRZWlkK25oRkVBVWlLcDlJZDY3bUR2N01NbEQvc0Q3VERu?=
 =?utf-8?B?R3VIbldqU3BlaTFWWklDRVNHaERVZE5KdG5mUUdjNDlaa0hCR1U5NjFlMGZV?=
 =?utf-8?B?K2pFazNwcDk0Q29wNXpuV0lzYjVFZUNjU09TTHp4MG5SaEo2WmpEZU1lc2RG?=
 =?utf-8?B?VUJUYmdUYnVXY21ZUkk1bnFGSTRtUHJsODVnNFE1Y0lxbHRJWWdXdFl2cWN2?=
 =?utf-8?B?bHdSdTZ3ZjdGb05lb3N2Y3pVRkN2SDN6ZjJNZC9TOHZyUmwyOWY3bVVjbUVw?=
 =?utf-8?B?SU5LWUsvKzVtN2hmalMvVmxFN3NXV1FGWko2cndPUGhONkVnODV1YzdIWjFh?=
 =?utf-8?B?V2lMdXJrbGlWdlZ4d2R5YjdsY3plVFdrRC9NRXhSVkNtRGRBckljVGZGRlov?=
 =?utf-8?B?dVJtZitjWUVrdWF3NmFQQkNwSENJTzBlc0lZTXl6ZE5RVWpFNncwbnZGL05w?=
 =?utf-8?B?NVRrMjVDTU5NQytKNGVJQ3R3NXZ4U1ZmWDYyaGNqY3p2YlVTbE1qUkVrbTJI?=
 =?utf-8?B?RktxUUdwZVpvUWpid3U2VVVBRC9zSCtZdXZiT2JqY0Jic0x4MzRWSzRoZlFY?=
 =?utf-8?B?QWFjS0FCOEdkNlBJV0tWbmthT2llb1lnZW05V1JTUEFUdVdLcURPa0ZML0w3?=
 =?utf-8?B?NmE2c1owOGs1U3oreS9jUVNFU0xzdUtvU2IvbXVqajIwaW1DMFJkaU9ZeU9X?=
 =?utf-8?B?d2FpK3k2MnBXcFJlZ3l2eEdZaWcreGc3b2JOWXZPOWQ5Unk3S0R0NG5ZMXlC?=
 =?utf-8?B?S01RcEcvOFFKWWQ0c3FHVkhrVmJYdDRpM2MxcnpDbkVEdTdGMG43VERTKzN3?=
 =?utf-8?B?NnlMMHBubktVY2pLaEx2NzcydUpKWnZmbVhQMzIrK1Y0TnNQWmtVbTdRcVN5?=
 =?utf-8?B?UFcya3Y0RDkrWG4vM3hjTjU2czRjMUNNU21wd3hqN3R3WWo5V2JNWjRyeE9J?=
 =?utf-8?B?WGZxdHVORTdYM2ptTEdpSk1aTWZ1cHI2NytQMGNrOEI4YXhYOEhjK1Z4c1Jt?=
 =?utf-8?B?T1VEcU9sam10cm9xTFZxVlZkTGJNMGJMaGp0MmRmb3FXT0J3NG90SDNhMS9H?=
 =?utf-8?B?S1lSeElHdmJMbTZ1TmpUNzltSUpOZWFDcm1laVJCd1lGdXFKSC9SdkNLVjZ2?=
 =?utf-8?B?MWlCeDBoSGxkYVUwOVRPZ3JWcnhFVCsyc1ZweE5YNjF2ZU5VRWlxL3lzSHJz?=
 =?utf-8?B?QzBhWFR5cytnSkNQUFUzeXdocEwrb09icmJEVnc0Tmx2SnBBaExqTW9wWkhR?=
 =?utf-8?B?cEJWazBZaEZoT2ZrQUw5c3JLL1FERTlnTkVnRjlIMjliakpqNk1VRE4vaENq?=
 =?utf-8?B?NnJyZExSOUgraVRxRWxhdGRPVTdxWFN3NGxHWWcvd2p0R0VpZVcvQzQ0VzdU?=
 =?utf-8?B?L25KcnlPc2x5b1lORWdsWll2ODhsbDhsMEdQYzIxNDlwNUdFcnVtQlpPOXBL?=
 =?utf-8?B?TzlDNDI0RGQ5QjdDVEZYNkh6d0pBMHZXdGVFVytybzNSc2NSSkhwYUUxMEp2?=
 =?utf-8?B?K0NkM2pXZ3hvelRpcXI5U3JRRzdJREhrRW05enFVWU1GYm1DSDZtT2hSOWI1?=
 =?utf-8?Q?Q+KY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVB2UVlROXNjQVdDc0F6cWVadTVVb2diV3FTS2pvdC9RbHpHcWZxRTlhRUhZ?=
 =?utf-8?B?YXRKVnc5OGtnVTNWOGU5RDRGblRISm1iNHNlb3dSUlpXUmVsQkd3MVZWS3dl?=
 =?utf-8?B?UkJBNkJRSlo0R0d5Y2YzS3VqS1ZPSk5Hb2p3M0o0RzAwVjJmQjh3dDMwQ1k4?=
 =?utf-8?B?VTdRLysvN25QZjJaZ0JObW9VQXBxeUEwTjY4QXpmYjlMYzhmRmlFZHc5Rm01?=
 =?utf-8?B?Mml0TG82QlcvTFNPZmxjWEVhaFcxbHJsRDI3S0lBaTRYMUcxR3I0RjJLU1Jj?=
 =?utf-8?B?Nzlya3ErUDVPYks3WlhockhoUWJ3dy9mRkFUSG1lZERKeVF4L3NWVVBFSEE1?=
 =?utf-8?B?MWpLZWNhTWovN2hteUg4cjN6UTZqMHpKdnQ5dnA0THNZb1RMcGp5cjlabWxh?=
 =?utf-8?B?ZEZzUjkvZDQ3NmpEblFPemhMN3RleG5DN1YxNjBCYTZPdzdIaU5BT0lYa1VN?=
 =?utf-8?B?MFNHVjFUaGtFVGFxY1pWZVduODVyeE5hbWFKYjNBejk2WHlpbGlCM3NqWTZE?=
 =?utf-8?B?TlN6TmFYRVZ1WVN0aFdobE9uZlRjMDV5Vmw2SjFWR0g0QTFFWmVmZjY3YXdJ?=
 =?utf-8?B?QjhaM1BFa2o2LzNOdjUvM1NHS1J4QXJsUVZiVkpMWVVvdVBNRXNvdWxGV0pH?=
 =?utf-8?B?amxlRDRJUGpFSURjMjRJbUhsZzZtREhnWkEySFNwbUNJTncvdmhDQWpJeGRw?=
 =?utf-8?B?eXJLWnNEVnJxL1p0c2dxWVZ5SG56TVY1N3hBWm9UVmlWRkNTNHVDUXJoK0Js?=
 =?utf-8?B?SnVlVno3THJiU01NcWZJYXgxUVhLRWpsWWhGbG1hdVJYaitNZUlMNEh6RUNz?=
 =?utf-8?B?bndhZ0FlbzhwSEdMZlNsRUJzNGQvUXdqRHczSVlaWDZzK28rVUtuTUMzUmV6?=
 =?utf-8?B?T2tTc01QY3VURUtqQ25HSnRuQkpDT3ZWZ24zQ21GRzdsdjlhMjUyVExFbDkr?=
 =?utf-8?B?TmVPQlpJZGVTWmVwUVpENUkyL1hDb0ZwMXZiUVNrRExTVy9HcWpyMXNGWk8x?=
 =?utf-8?B?UThBdTZLbjZXN3pXWjJ2V0lOWUZldVFwODdyZnJsMVJpOU9VU0J1cDlaK2hU?=
 =?utf-8?B?K05vR2ZKbFNHQVhyNjZER2h6T2taOWV6Zm5pL2VDcFlMbXBWeVJkcngrZ0lP?=
 =?utf-8?B?Q3NiT1NrTWpDck5FTHQzOXovclA2eDZ3S2pPNE9rM2VnenJscXlkN3JOQW95?=
 =?utf-8?B?dmpFTVZaVDFWanRhclFRWWcvSm9zNVVUbkY5TzVjQ2hWemYwVG1QUjdJc2Ev?=
 =?utf-8?B?MXdiZnVlK3B1RUpBdjRzb3EzZ2VzRTU3V0VnRmNhV0tLeFdWU2NIbHZNNWR5?=
 =?utf-8?B?M1Z2TDI1dGlZRmd1VG1yU29XZnMvSFNXYzlDZkdGbnNGeDcxV1l2aUozeTBT?=
 =?utf-8?B?VjZORlp6K1FmbmJMK1pvMVhFcHZTSzRub0tqaWtzT3hUcVV5VzJFZllLaWhB?=
 =?utf-8?B?U2lqYk1ORFo5STljYXhXTHd6RTJRN1RaM3U3SVV3dm83NENtSXRZdTdNNWt5?=
 =?utf-8?B?QklaOVlNQkJ2RkhYZ3U2cjl4dXN4QzRPTWIrYXF5enRZQzZHU3NsU3I3dE4x?=
 =?utf-8?B?YXljOGJDZHQxa0RLWnE5SWJHbXh3SGZ5eW16NEQ3aUNVNkZXTGlNK0d5N0wx?=
 =?utf-8?B?a3VIMXRONDh6YXRNanpQRW1MZkUwSHdHZmpIOXk4N1ZxbXc0eDlMVHdlaktW?=
 =?utf-8?B?Y0NIbnVUQWtYaXZxVFMwT05QRTVuVlllNmNydmpxUWVKMTVWOGtVekROSWZM?=
 =?utf-8?B?TnVObnQxejh5dkRDdEtqUU1yQnUyQ0d3VnRndnFxQ1ZVU3d0Mm1OYlB3c3Jm?=
 =?utf-8?B?b1NlZ2tYRkZiNHFPVU1CUE5xaHBLeTk4LzN2SWNSSXpReWM3TmMzd2J2NlVV?=
 =?utf-8?B?aWRtS2llL3J3dWlUWEQyZ0c1eVlmR3MyWXg4WnQ3QlM5c0krUEU3VHlFMm8r?=
 =?utf-8?B?cldyK1lrN3FuMzA4aVdWcmV5aUQwREdDcmZ5UlJ1TW56dTI5R3pGSTlJK25D?=
 =?utf-8?B?RzRMK21EUXd6bEp3N0RYdXdWMTg3MWxpdE5JM1R4bDZzMDRxcklxQldlMmlR?=
 =?utf-8?B?d1lPMkc3dlVCYkxMbXd3MkFIcGk4SXBqaU5EdHRTTy9hcnVvcTc3NzF1VDJw?=
 =?utf-8?B?YjUyS09US2FhSE5HZDBoQnF4b0UwZHN3d0g3UDlNU0VncVd0Unl6RlkrcTJW?=
 =?utf-8?B?d1dzZ1dCWUs5VkdoNWpMbG92R2JzdE9LK2lGeS9ZTzkxb1lGbHd5QXd0azhM?=
 =?utf-8?B?ZnZpVERkQmJMNVdTTlR6UVNBb1ljbXJqWGJvOUxvbzVUQnNBNmVwbEV3d2oz?=
 =?utf-8?B?SW9GRXh5R0xVa29XbGVjd1Q1RkdGNDIrZ0p4WTR2ZkF3M0I5L0JpRDY3eFZH?=
 =?utf-8?Q?I0y28oyz5Ssqjcpo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dea80ad-51bb-4f2c-d5f2-08de5dbf3e18
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 16:15:10.0901
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AXELxfBD45RPGlmLfIG0+fgJrsO6teNC+c2OVdmOJhn1Z1ddcFMB++qjsjNf4tsvlU/keHQ5L+jHWBl0FxZHVKr1lYVEwovc2c42ByPDc3E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF383C22AA3
X-OriginatorOrg: intel.com

On 2026-01-27 4:47 PM, Maciej Strozek wrote:
> SSID: 0x17aa3821

That's not a proper commit message, see 
Documentation/process/submitting-patches.rst. Don't forget to loop in 
relevant maintainers of sound/soc/intel/ for v2. Script: 
get_maintainer.pl can help you with that.

Kind regards,
Czarek
