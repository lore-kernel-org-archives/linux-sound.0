Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39180425CE2
	for <linux-sound@vger.kernel.org>; Fri,  6 Feb 2026 17:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770399920; cv=fail; b=Wg8DL/v8afW+Vhz9kyGH1ZLFRs0vsI1zXC91CpmZFbSt7s4kO5naAofIKGDJ1KVUlw0wrnuTscMCHRIc9eb66NUetVJKTnyt30KmFmsetLa7eAwPa9AcmYzYz1iEECxM8HlIRugJ/H3MTkvwhRv6B2ELlqu+F106hoP/N1Xdx1U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770399920; c=relaxed/simple;
	bh=41vA+hG3f1YuQRNRXYM92g18DL2Fmks2l5RTUpOLCAw=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pOarjUAk6PVFuRDbdsI/F0egHtlEp7+WKofDIulsPDn8ffSvJ4FJmbl3jruGzNmk77Dwrc2IS3RRp6y2l4pwTfyRm5HEXukYVAkfduZd1qDQ7yWyzpVRMJMBI5EehwVsCTTCuC4gGCGKyYrAx7ddvDsYX0MY8AqiAAlYXStpvus=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FvdlTDlI; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FvdlTDlI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770399920; x=1801935920;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=41vA+hG3f1YuQRNRXYM92g18DL2Fmks2l5RTUpOLCAw=;
  b=FvdlTDlIhqGhc1R57tiLR1SpqEJcn4gw2VXaKksIOKyR9i+kqSLtwb9p
   ry33GUpzOBcbcbhqdfs7wXsPWwXiGy/Dv0nXAQOvFlUmluzIaydV3YsTE
   ImwJJYXJMfXTiK+tEM+TgJJ0qJRAE2XTk42rHynQuPxmQqJEYcdKEoGIr
   rl6ud5D+y51IoAsWXxGcK833fIDUJ35zxd4mRsANw8Kf/vUGB4EZxORME
   FDGJRdGnhx3vdS3zZW4nViw3Cc2GmmDQLvKvT+Lp2njJDMhRTN+vMH0B/
   n2twm7IgZj3yNwtR7tSB/J6emFq7ZuqH3qIjW34vy6fZHbFeFVYjNhbun
   Q==;
X-CSE-ConnectionGUID: SHJLFMpkQBqW84M6v2gnnQ==
X-CSE-MsgGUID: S7+MULrXQMWpWqHp5wvZlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="82724000"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="82724000"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 09:45:20 -0800
X-CSE-ConnectionGUID: gZOQ+9l6R3WYoJq5RMVXlg==
X-CSE-MsgGUID: lfv9IfYoS9WAS5cd1KjTEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="210021908"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 09:45:20 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 6 Feb 2026 09:45:19 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 6 Feb 2026 09:45:19 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.48) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 6 Feb 2026 09:45:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HzdMthbly9xpZBWNID6hNlO1Nd89Q3aHLJbse0vwo0Yy4Kw0FRdBjVgD1+wfcMWEa3RY8B1W73nopSHElrcNw5kznHkF+JYme+dAHJGMtDyBtYsybD7ES0MvnDkvxorhOatwLJ0Z/SG72DL/VqlvDk+n4v+unFxESrUZ7atiB0ffo6LPbN/qeiU8w6Q2UEySWDBZojilx5daGQlltaYJ/UTbbAXKpihVvniVs2rhLX/hiGbYNwo+P03zmeO39RVVN0/s69rnO8Bp0fJrYbQ8Jh22guh/pB6f0T6fVAdQTpr0etu/TtJdWEqOpcStIv7JoMLtj5UVm+cNsbHEN23bbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ddqEbt9Qzv6cWdChO7Gfyrh3yi/R1aCh+s8f01LqO6c=;
 b=zV8L0i1YhyXqPg9Cxycla3reHIe4UCBL3Oq3YHtQQA0/Fm3vAaa9MMBQgedFw20oDoqeDQhsZCDyWA56iX/nMu+37uS1vACuDzdS6+kJleYm++uq62BtCjCd3PDwj8O5wzcb9cvb+8rwG7JVTk5UEJv/NzYKeFjU6srJbLRYGz9p13bcUX+6LKw+9LmaEJZblCpUdbRVeEIiRh2BUbvS94hXSzr1libIVE4N7U0RUib3wd6UoEbB0bDzpW/DZhDXp69rFimHc6HGX+HinzkiIJM8Syd6kAIneYvG8y72CBvVyuJnu0qcotBS7KDH28oH9WX64FT5HD7ZP7BHtJUMYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8283.namprd11.prod.outlook.com (2603:10b6:806:26c::16)
 by DM6PR11MB4578.namprd11.prod.outlook.com (2603:10b6:5:2a7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.16; Fri, 6 Feb
 2026 17:45:15 +0000
Received: from SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214]) by SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214%4]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 17:45:15 +0000
Message-ID: <56885643-6602-4155-8644-58eb6e561ed4@intel.com>
Date: Fri, 6 Feb 2026 18:45:08 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ALSA: control: Verify put() result when in debug mode
To: Takashi Iwai <tiwai@suse.de>
CC: <tiwai@suse.com>, <broonie@kernel.org>, <perex@perex.cz>,
	<amade@asmblr.net>, <linux-sound@vger.kernel.org>,
	<kuninori.morimoto.gx@renesas.com>
References: <20260206113250.207179-1-cezary.rojewski@intel.com>
 <87ms1m9htu.wl-tiwai@suse.de>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <87ms1m9htu.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0005.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::13) To SN7PR11MB8283.namprd11.prod.outlook.com
 (2603:10b6:806:26c::16)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8283:EE_|DM6PR11MB4578:EE_
X-MS-Office365-Filtering-Correlation-Id: 03739dee-eeb5-4c8b-dc14-08de65a77c2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SlhEcWR6YnNWU2FLOTE2Ulh1MEhOTGNJeWhmUEEyVmtmTmNFUXcxcTBxWVgv?=
 =?utf-8?B?SE5hcTZ4L3krTFI4WHVtNlR6bTJaNklreVhYUnRIMk1mWmE3T0p3NHByK3Fj?=
 =?utf-8?B?dUZBbllkMmt6RXNMS0orV1dlTVNvenpNT3djK0lIZVpMaEVHU2JkRlpGUkt6?=
 =?utf-8?B?SDhzOUFkbGFPNlNrU3dZT1NjMXd5UndYQk5pdFZYakZlUXJPdGdVMDhnKytS?=
 =?utf-8?B?WVFOcTdwSW13VFN2MU1JT1hMeE9NUmJpMk40QWVNL2s1RmhtdDdIdkRaSTBN?=
 =?utf-8?B?dEM0NEpoTlpNODl5dXJWSTB4WmxjdS9UY21icElqT054TnVNOUE0QUJrdkVo?=
 =?utf-8?B?ZDZGMW1uODduVkxNdjRKZFlqbExGRFg3TnBmR0lUL0ZPUmxHbG53N2JNeVpn?=
 =?utf-8?B?dUI1bjZPOU9IRUZaL0owV3RRcFJRYmE5ZFlYZExDbGhVN3A5NzRMUUNoRjVq?=
 =?utf-8?B?VW5UK3llNytuNTNYK05aQis2eE1Tc0lBb1RGWDgrbGtFSStOWVM0eDErU3dX?=
 =?utf-8?B?dUNiY1hsa0N5RzZkdXYrS0c4d2thK2ZuMDVqSVFmSWpmR0ozMXo3SXpLSHhw?=
 =?utf-8?B?RVhNNi9TWEFycENaNlF5THBMTUMzbmNDWGxnZDVPYzV6b2k2aHlDU2RablN6?=
 =?utf-8?B?TktxaS9yOU5MT2NFK25acnRSaUFCVE9KeFliaSswU3RJRmpkdUFndFBvR2N6?=
 =?utf-8?B?dHNwNmpKSEZLSVlsWDZPQmxhSzF6ZnlVSlExMEV3Z0ovQit1em1rK3RjaXRI?=
 =?utf-8?B?bU1UR3hiWVZuUjYvMjFCZ0RhRnE2L1gzenNJdlZGMTUxTkFIeVJGYS81S2dY?=
 =?utf-8?B?NnBIMkwyVTgyVWQwTmJvVWgzNkxRSmREMzJkbWxEL053ZkdVTlpncE5qUTBK?=
 =?utf-8?B?WnAyVGthN3NaUWtzU056bUNNRnJDeVZ6TEN1Q0pHNVpOeXd5VjhjM1dObzFM?=
 =?utf-8?B?Qm5ockdhNTl6VGlzOUczT0JmL2dVdGZIbnNhc3JQeHBvR2RWc1Z5eTQwTzBx?=
 =?utf-8?B?REJmcFJUZWZ6UTVKd3FXWUtWUU5XN1d0QVVqajE4bUwwVUlTQ0RUTTZzanR3?=
 =?utf-8?B?aStmS3BDY05PeGdNMU83c0s5emtJTFZ4ZFI4Y0ljd1ZRNWdweDhXL1RWZzJL?=
 =?utf-8?B?Q3RCN1hIU3V3RkpyUEluQjNvSjBlSkllaVVDN0NEZzdsRlNEcFdMUXlMbEdp?=
 =?utf-8?B?RThMWnpJaW1DUzZHT3UwT1ExazU2TndtMnBqRXJMNWM5anR0amVjUWc3NGs4?=
 =?utf-8?B?VmZFRUVJdVhKc2N6ZStKTkZpaHFjTXpnbVhLaDlKMGhPMXNvb3labFdNcklB?=
 =?utf-8?B?Y3RuU2hmSzhqZkNTWFJGUGEweGJLOHVBMGpQM0lSYTNSeU05N3ZVM3RIZzNw?=
 =?utf-8?B?WnBlVThuN1RHNStpY0llUkhSeEVxWVJDRjRGVHkrUkpPaFUyQ1c2Rm1JTytM?=
 =?utf-8?B?eDBObWk5Um84eG13b2RobjlVS0piWVBkRXlZTWw4YkI1QjJzd1Raa3FodWJF?=
 =?utf-8?B?MkpTMUYvODNKVkw3Z05wSHg3VkxUSmU4NmFDT3VOcWJGSDdWZndqaFpjQ21Z?=
 =?utf-8?B?eVh3U2ZrUkxNY2s1bkU2Rkl1bzFtWktkY05yRUVHaVVPRVFBekZLRGpkcXFJ?=
 =?utf-8?B?eUcxSWQyRTYyQkJtazhzc1dXQ3JMNE0yN2pjZGQ4TzRoQW5JNmpTOVkydXEw?=
 =?utf-8?B?MWNDSEdrUHB6K0dpRzZpUXFoOUhVOUJOclhUNU1pUUhXODY3ZndTazFIYXNU?=
 =?utf-8?B?UGFvamM0TWlWMlZBc2EyYXF2azgyWDBrOWF5ZmIzV0xkeEtES3hVUGU2TWFh?=
 =?utf-8?B?MVRveTdRVTFCVVNOMWtLQ3E4RU1jRTRrcG03TlBBM1QrQnRhUzlZMWlXUjVQ?=
 =?utf-8?B?cEFMWm1CTThZdVNTc1NGUjZKQUpTSXRqRG5LYnh3dStUWVhwZjNLMDlLWHEv?=
 =?utf-8?B?czZUQnRBS0dsb1lVVkZFSnVzdUhHQ1lodFBiTjBiYXZKdXcvTWI0ck10U2NM?=
 =?utf-8?B?ZHltQ2xnN2EvdEVtNXRkeDVvR3BMaDIrUzg2eXRLeVpjck1KZ0prdDlRbU9j?=
 =?utf-8?B?ejF4TGZrd1NjWnYzRzBjVGFnZk9UOVVuUzlyaG5sZ2dBN1kyTk41TCtrSnly?=
 =?utf-8?Q?175U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHFkZlpuSjdDYnA4NjdRcGRVYW9OcHNpbEdVbWFEbWpjbFordmQyd05QaXMz?=
 =?utf-8?B?SGloK2VXc3dNS0VLMlBFNHltYndRbUlVNGpDQy9QWVlmS2ZJZm1POFlqYlV5?=
 =?utf-8?B?MTZvc3RyS2JCV1ZkRTF1aXNaQ3RZSy91dzBJRVlHUjNTVU0vVGRlMzRWMmtt?=
 =?utf-8?B?WS9vY1NMaGdyUmRWVmw5eEhPZ044TmVWbTdpMk1sOTFjYjVVZmdMNTZUQW11?=
 =?utf-8?B?b0NNMmRIWDE5bFdyLzYxcGl0SGd3bmFVVVJHNHBaN3A3dnhHdk9YTVBUNmN0?=
 =?utf-8?B?TVZvQ2I4S0dCNHlwUFFRQmtTSGhyRkk0M3pXVFl3S2UyUHVPR0N4ejh6OUdl?=
 =?utf-8?B?K3ArRCsxdlpLTXRhK2Q4M2NxK1BLeHJla0pubit5Yk5rY1NyTy82MlZ3UGhl?=
 =?utf-8?B?MmtjclA2Y2U3S3hHUDB5c0NKc0ppaHN4dXh4d3F1STI1V1ovUmNJWXpOVTJI?=
 =?utf-8?B?OWxta1lQSFh1ekpoamVuUnhUNm5QUDlyRjBEU2UzaGJPb0N3MXFwbFZ5dmt3?=
 =?utf-8?B?K1VvUW5zSEJxM2tycUdPand0Y01GOGR5MnpBa2FGaTBjd2x5emMxRXBCNFlI?=
 =?utf-8?B?RG00MWpCTHpqL1J1bE02NFZkdUhIbVd2WUhJT3FpdENlZE5vYktXVExiQld4?=
 =?utf-8?B?U2FXL2ZDSXpSVkFmVDd1Z3ZYV1IrWHB1NkR0K093cVZMSkc0YThlUk5zUDNX?=
 =?utf-8?B?TlNYTmlWMGg5cUFmeCtDNTg5L0hUbi9zUzlzd0cyV0t0cEdabjVDUFh1UDhO?=
 =?utf-8?B?YVRHZXN5Lzhsb0l4TTBRbk1oNElZL0d4QkhVM1d4dDJEcXpXb0w5Tm13NWxx?=
 =?utf-8?B?UEg4MTQwY0RCR2xxdUVEWWJvL3ZVWjJhcVhIaVNxL0NuYXh4dldnV05BMSsy?=
 =?utf-8?B?WjQyZ0RLcWFNMEdhbTBGWWVJM25uYVV0SGphZ3QzQmk5a2pwU21EUXhoNFNo?=
 =?utf-8?B?RTdsWWFUMXpPSUJHbk56MCtXYzY4ZVpoR3pTYXhxUDBMcFlNSXk4TWJQanpW?=
 =?utf-8?B?bFZkNjBCWGQ3NkcwUlJsd0RCbG9rL2xtdlhvS3Z5aktNYXN0b08yd25BK2Vj?=
 =?utf-8?B?Zkt2MHd6V25iRXZQZ2xsbXE3SXhEcXNuNnF5b0RKd2htaE5NS21aM1kwWldk?=
 =?utf-8?B?OGhYRVl6S3hQeGJ5SktUTEU0TWp6dUhoaHFvdnc5TEZid2FJSVgzM2lTbUNB?=
 =?utf-8?B?RHpBdUpIaHQrbDNYb3NQSk0wR3E4U3R4Y3lwL21mNkwxRmE2Q0NjbkI5VmV0?=
 =?utf-8?B?T3IvL2x4VFJNL0FhdUJDOGx0MWFDaFRNc0JBclE1ekd1YmRRNHZLMk5xd3JK?=
 =?utf-8?B?d1VPanJrMG9FUlA1NlZLZDVmZmp1amFwTk1ZUmdncFZOZnFGTWVzQi8yakFF?=
 =?utf-8?B?YmVheHJEMjdZVjBBQXpQYjJsTmFCQ3RIMHI1ZldBTFdaS2lrRVlUclJJdXl5?=
 =?utf-8?B?T3pRdERjTzJmNTNRUFRUZmpaSXdxNXdIZVRCbXBnSklWWUpMdlZxMHB4dytV?=
 =?utf-8?B?V21YM1JQNVVybHRsSjFqR1NlVDZ6bktTbFBnRUhPYzNQend2MUt3eTQzT1U5?=
 =?utf-8?B?dVVqYWp2VUdwbnJqQUhNV25zbTd3UzlKemFRVUk1UVRrVHZ3NE1vbDROeXBM?=
 =?utf-8?B?WldRanViYm1leEhNSUtyc24waUhsaC96NU1IOGRSZE4xMTBHL3dIK2RXcGc4?=
 =?utf-8?B?aktscXFBZ3NzNERkZVQwNVZ0Rm55ajFCL3hWWi9ub0tyRW5CSFpkZnlWLzJq?=
 =?utf-8?B?bnhSZk1UVDkzZ2x3ay9MM21GOVMvWngyQ3owZE4xU080c2tUUVNaNnh3UkZY?=
 =?utf-8?B?RnJEbVhpUUp6QmM1bXMzQjNiL2V6cE5ZdDFYaVp6MTBWd0NHL29FQnpsVzZa?=
 =?utf-8?B?YlgxU29QeUtwVW9CZVFpNlNhOXQxVTZwVjliN3dpeHdMRTVUNjdpQ1NQYmlO?=
 =?utf-8?B?TUxGUHV5bmhQK25oMWlETlBUcUhXZElxZnFIZzdBcWVuYitjZWs2ZnY5K1Ry?=
 =?utf-8?B?dFVIdzVWTWI4OUNzOVkveG0wNVFHclRRU2taK0ZGS21OYTdOSzU5TGtacGtt?=
 =?utf-8?B?enJOUmc5WUwzQThERDVxcFloZ2gxQ1RURnhtSFdUWXRzdGVTa1dVcHozbXVp?=
 =?utf-8?B?QzNXNjIxWGs4T3ZBdUxlZGtxTTJlWXgwYlpHWHlQMHRBSHg3bWdQSnZ2TXBn?=
 =?utf-8?B?UlM4VzFMRTdvaFRkMTlQUkdBL3Y4eU83YUUvVHBoZEkvOHVVeHBMWjZqL0da?=
 =?utf-8?B?cC93cHJRTE4xZlM1SDFWY3Exd3VGNEdlWkZYUGRtcVE3cHN3eUdMRzhGbHdZ?=
 =?utf-8?B?QWtObExnejBqT2h4RzFmUmc3TERBVDNrTzRBUzBRc0pSQWphcE5EUmFLVVhu?=
 =?utf-8?Q?EdCl8DdqI5YuLoR4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 03739dee-eeb5-4c8b-dc14-08de65a77c2d
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 17:45:15.4898
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IIZ12CN2dJo+p7i2r4IsVOp/5z8i0Z5Ck+6FNr/nRV+K+tfHYC02IUMjmM1ws+RpVOR4ek159qMcNQK4GDzBLzBdrXhx+0rB6Mff81eSKi8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4578
X-OriginatorOrg: intel.com

On 2026-02-06 1:28 PM, Takashi Iwai wrote:
> On Fri, 06 Feb 2026 12:32:50 +0100,
> Cezary Rojewski wrote:
>>
>> The put() operation is expected to return:
>> 1) 0 on success if no changes were made
>> 2) 1 on success if changes were made
>> 3) error code otherwise
>>
>> Currently 2) is usually ignored when writing control-operations. While
>> forcing compliance is not an option right now, make it easier for
>> developers to adhere to the expectations and notice problems by logging
>> them when CONFIG_SND_CTL_DEBUG is enabled.
>>
>> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> 
> Thanks, it looks better now.
> 
> A few remaining concerns:
> 
>> ---
>>
>> Changes in v3:
>>
>> - simplified the memcmp() as suggested by Jaroslav
>> - added ->access verification for SKIP_CHECK and VOLATILE as suggested
>>    by Jaroslav and Takashi. For that very purpose I've deviced to use the
>>    kcontrol-volatile (vd) pointer that already part of
>>    snd_ctl_elem_write().
>>
>> - as things are more complex now, replaced snd_ctl_put() macros with
>>    functions. This aligns with suggestion previously provided by Kuninori
>>
>> - reordered operations within snd_ctl_put_verify() so that it's more
>>    intuitive to read, at least in my opinion:
>>    get/info/put -> info/get/put
>>
>>
>> Changes in v2:
>>
>> A number of fixes as suggested by Mark and Takashi. The initial version
>> did not account for possibility of invalid payload sent from the userspace
>> and was buggy.
>> - enlisted ->info() operation and reused existing
>>    fill_remaining_elem_value() to sanitize the 'new' value provided by
>>    user
>> - fixed size provided to memcmp()
>> - the 'original' value is now initilized with memset()
>>
>> Readability improvements suggested by Kuninori.
>> - added conditional #define snd_ctl_put() so that no additional
>>    if-statements are needed in the actual code.
>>
>>
>>   sound/core/control.c | 57 +++++++++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 56 insertions(+), 1 deletion(-)
>>
>> diff --git a/sound/core/control.c b/sound/core/control.c
>> index 9c3fd5113a61..18ddae138795 100644
>> --- a/sound/core/control.c
>> +++ b/sound/core/control.c
>> @@ -1264,6 +1264,60 @@ static int snd_ctl_elem_read_user(struct snd_card *card,
>>   	return result;
>>   }
>>   
>> +#if IS_ENABLED(CONFIG_SND_CTL_DEBUG)
>> +static int snd_ctl_put_verify(struct snd_kcontrol *kctl, struct snd_ctl_elem_value *control)
>> +{
>> +	struct snd_ctl_elem_value original;
>> +	struct snd_ctl_elem_info info;
> 
> Those will consume too much on stack.
> Maybe snd_ctl_elem_info is acceptable, but snd_ctl_elem_value is too
> big.  That's why we use a temporary kmalloc() for storing the values
> in other places, and I'm afraid you'd need to follow it here, too.
> 
> If the performance matters, we may introduce a shared
> snd_ctl_elem_value object with some protection, too.  IIRC, this code
> path is already protected exclusively with card->control_rwsem write,
> it can be per-card basis.

TBH, I thought going for ~1K on the stack is fine, as IIRC, the typical 
limit is 4K. This function should not be folded into any of its callers 
either.

Since the idea is to move away from on-the-stack approach and, a global 
instance of struct snd_ctl_elem_value is no-go, guess the per-card 
buffer is the direction. And yes, I'd like to avoid memory allocation 
for every single kctl->put().

> 
>> +	if (retcmp == ret)
>> +		pr_info("kctl->put() returned the expected value of '%d'\n", ret);
>> +	else
>> +		pr_warn("expected kctl->put() to return '%d' but got '%d'\n", ret, retcmp);
> 
> So this prints out a message at each access even if it succeeds.
> I believe this would flood too many messages unnecessarily.  Can it be
> better to be with debug level?
> 
> Also, this message doesn't show any relevant information about which
> card, device and which control caused the error, and that makes
> debugging harder.  Put some prefix to identify the problematic
> control.

I agree, this is a little bit bogus without more context. Will add 
tracepoints as suggested and more descriptive message.

Didn't see the problem as our tests do write to /dev/kmsg or the trace 
equivalent before _and_ after doing operations such as 
control-manipulation and later dump all the dmesgs and traces to the log 
files.


Kind regards,
Czarek
