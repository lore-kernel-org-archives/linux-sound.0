Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B298156978
	for <linux-sound@vger.kernel.org>; Fri,  7 Jun 2024 07:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717746124; cv=fail; b=rxsf6RXNTSqqow53qwlH5tfJuEEaaunVcsTt6h/OwcaA3Rv9lRuaVVM07pe3kPsb+fPicqPvOrSupQoF0NiX2S9zeQ8pTewJjX2/3Daz1EUgTOxMs0RT3oLkmidujT80owORTUrjnhYX5QEbUI67+B4xI4VM3coZweprwCNkcFA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717746124; c=relaxed/simple;
	bh=H/JG1P8lzc0od2eo4CuXaKnkQa31gOL5OfxGMA/o+8M=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=sL+gJRv4v76eKGQCeZ8NTn+mjbtZ7ohLk5knpFk/QK/gOs0/rqeu1aZWwzz2lAz+U/nQKAj9SUS0560rN7sDDsGbibrhb8oFnnauobwhKbH/BvYLnHItvnrJdqIJumqm9HPzUqSTWPHwGEmxot321OS3pzJ9i2+ox93GYJ8h1xs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IxtJexSm; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IxtJexSm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717746122; x=1749282122;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=H/JG1P8lzc0od2eo4CuXaKnkQa31gOL5OfxGMA/o+8M=;
  b=IxtJexSmtFymdh73FUQP7Wr+BzRvvdM9cdVV2ZZlIwxTEZIZ36/vrZlN
   FwHjwVXV8WcsIegT8X8D2HxfBIoNW63VIztgPFidSU9W2+bk36vqxXTb6
   ZcKBQiB5nwkojryFVv8IZs9fyNCYhVGQHbziPvSOFrUv9679g3p1xNvAI
   eg7wY9pdlNFFh9vLi6pzZu0hqmfkUhV1ETSjESwFdjEDiEz3ZIwc4zvSM
   mbAnK++G1oqc0H7G09D4xpcmQdI2IszJ6GQ/1lOvVIrrd+KaPvmcNkak+
   NETPqKWvQgu9gxTdrljkrtaQYToHuFWDkPxlOVzT5QWp7EikbHmh0Lf8d
   Q==;
X-CSE-ConnectionGUID: RmTcKjy/Tee00g9QnPhUdg==
X-CSE-MsgGUID: b+ffEGp9TIeAjLR71i7QLg==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14289316"
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; 
   d="scan'208";a="14289316"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 00:42:02 -0700
X-CSE-ConnectionGUID: M/FDojofQRKTOpHGBR1mDg==
X-CSE-MsgGUID: bMw3/lWITZqOBHWVbjYy/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; 
   d="scan'208";a="38325707"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 07 Jun 2024 00:42:02 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Jun 2024 00:42:01 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 7 Jun 2024 00:42:01 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 7 Jun 2024 00:42:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ceaCK2xu+jv80/fJtiqPhYID+ut6LUmo0dZnyt17YGpfEDcM1OP2T8R5aVwBL0sq0sZu4dOmCGXafIlCWHNbcmQF5lftADODVwffjszpDoVW0UB4FvIZ/8dy+tL3rtmLfqFp1BQ03QTuHnTvY44I+Urx0QLmL3A+8SfY+gxXjGiM9KUIUH9wju1hpgK9sKU5wf3RH36B1ctAVhvYSvvY3CbMul2Eix44LjYndGa+1fRO2RWuFcU+JC7u34nLUYizajRqb27d9kvu1OiCz7YVoTl0VNpPdZe7M21GMGlnmDSW2V+9sa7rScHQbBxgD1X4uMQ8QFdXUK+acc8Wc0PYhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mBGFo+sdAGYoQ473S8De1rfzUs500SxbEzUPgAD10Dk=;
 b=m1bMPg25DxHoZrG5BeyaYWWFGGS4/o9K9PVaBAAibS8afTnTf4wgdKPOsaWemDAzkUjoB+IhJvLuMvPfeYYGYcA7GILoHX+pVbe7nA6EncomTU4iWXO8gpd9yFUSRBPlxpvi2SKUKeAqpgqsDmji9KzfrPly3GUCpZeCfYHI6xhdWYmlfV5H+2nuBOqmnBwpTIHAehPj8N+3eGSqr5WfL2MFlJavVfH8xv/4HEsu2sOzsKeJN0sz9CYT1+x7dxZLVXB8ndRw2/d5l0Coe8gB/0hqz1Rq96xbuL7QGck8o1gm1ig+Fzr3d5kqWLQz7LG3Tkr4pi8WmYhV83j3U/KnLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 DM6PR11MB4705.namprd11.prod.outlook.com (2603:10b6:5:2a9::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.34; Fri, 7 Jun 2024 07:41:59 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832%7]) with mapi id 15.20.7633.021; Fri, 7 Jun 2024
 07:41:59 +0000
Message-ID: <0c9116a7-58b3-4e2a-b257-162a57a02bd7@intel.com>
Date: Fri, 7 Jun 2024 09:41:53 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA/hda: intel-dsp-config: Document AVS as dsp_driver
 option
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, <tiwai@suse.com>,
	<perex@perex.cz>
CC: <linux-sound@vger.kernel.org>, <pierre-louis.bossart@linux.intel.com>,
	<broonie@kernel.org>
References: <20240607060021.11503-1-peter.ujfalusi@linux.intel.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20240607060021.11503-1-peter.ujfalusi@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DBBPR09CA0033.eurprd09.prod.outlook.com
 (2603:10a6:10:d4::21) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|DM6PR11MB4705:EE_
X-MS-Office365-Filtering-Correlation-Id: 15f2dfcf-3d52-4c7b-3a50-08dc86c55056
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aEo3a3o1djUvKzJ2WlZmZy9xZTBnT2VSakxXeHV3K3M1RjNxUE9JdVVYdVE0?=
 =?utf-8?B?TldsdElOT0wxekRzMUoyMmY3R2xKWGVPZjNya2NUbnRPMDF6UkNFZDV3SDB2?=
 =?utf-8?B?RklXKzdDeUlzaVV6K0d6Q2hoUnh4Y3BaVlVDMk9KQnptM0hoVWpoeTVXZnFt?=
 =?utf-8?B?WHhMSHhxTGlmSWk4TkdZU0pGemdxQjJ3WXFjNGhMcG9DWFBsUk9CLzZneFhW?=
 =?utf-8?B?UUZYRHdpclo2MHdMN2ZWZTVkMHlJTUxCVGw5ZHBEcWxRZFJ1VzlGUlljL2Zr?=
 =?utf-8?B?Q29CTERoNXFDeGpuOUhQL3dmQm03b2JDR3RZWkY5Zlo0ZE9QOE1UZTlxMHVv?=
 =?utf-8?B?bUROdVhtWWxFK2RJYjdBZlljMWlOZ2QxRDVQRFJJY2hHT0tCa3dhWGV6Nndk?=
 =?utf-8?B?WUZUWnl5RkJnekxBeUNWVTdYL2w1cmJ2MnBTWEw5WU5VZzVxNHluRmdVZFlv?=
 =?utf-8?B?Y0dQUEV5S0o5OFhlTWhodlVmWXlXSFpaV0phSDJUWlYrWFB0NEVFRW1vUGxa?=
 =?utf-8?B?Mm9IRUthOTk4dUM2RCttS01ybEk1V2VNTVBWMlpmK0xYdWpRb0NmK2tGSWlN?=
 =?utf-8?B?MmhEbm9lUk9GaHQ2bEVUNHYwYS9PdGlkbVpKbDU5YStWYzZBcmtGQXh4Vklv?=
 =?utf-8?B?aUxRRTNJVUl2QVdZSXZrS05tbkZuZm5Qdmwwd01Ka0xJUnhGWU1KY1VLNEp2?=
 =?utf-8?B?bWR4U1FDS0xUM0pFVXFPdmkvMFAwMUY0d2FMVTRMOWVnWVd5RnQvMTYwNXcz?=
 =?utf-8?B?c1FqYno4U2IwZ1RjK2Z4MStuWXJXZUlVTDdjRkdJZkxWTFF1WTNmelhjcHM5?=
 =?utf-8?B?a0paSXdnWFk4MU5CWXQ0RVExcForUmJ2Q2s0Smt3ZFBxV3Z0V2lwM2NlUVdZ?=
 =?utf-8?B?UkRWRyt0VWdZZHArVlV6UXFvZC9ZUXc1MUtVYUVKVy9GK2pIcXd0eTlOanBs?=
 =?utf-8?B?cmRCN3VNMWtMOFYyVGtxeW03Vkl5Y3doeURuWU5RM2lCK0Jidm9JaGRTWmJu?=
 =?utf-8?B?QnhGV2dHb281ckpOanAzMm1UcnZjZ1lTQmhZR2lUTExUWVBja2d6dXVrT2Ni?=
 =?utf-8?B?dkQ5c3VsZVNMY1A0SDAyaXBvRFpBbkVaZGUrVEFHNVdtMm1LeUx1ckFBazB6?=
 =?utf-8?B?ODNtdkF6T0RYdkJTMzlCaFFBaWNsL2NBZnp2dEZYZEVzaFMxVU9nMVB1QnI0?=
 =?utf-8?B?UG00L0lXc0lzUWZRdlAwY2ljcVVFT2RxZ1RmcnAzRWpweDJjWmY0YkxySlF1?=
 =?utf-8?B?Zy9HTmI4RDk4dXBCdXlhUkl1REI0YWorZTlJaHZadzc3czNtQWVGdWJadFZu?=
 =?utf-8?B?YXRuMDRxbzBuZ2c2d1VtbFpEbUM4YzhuL1hCcisrVG5YaVNrTW9ZcmJRMXBY?=
 =?utf-8?B?Y21GMlFtVFdEem82d09oYkVoL2ZqSC9OOE1PdFhzZWpjYUVIM0orU3hYeHEz?=
 =?utf-8?B?SDNyQ0U1cDdLNm1RRTBnbUtaQ1dtUm1ZMVdVTW9BTzNSWnpEaXJudVNueWQw?=
 =?utf-8?B?TDFuQmlmbzdpTldmQ0czaWJJM1pKSDU4cVQvc21qaVJQdFVHaWg4QmVuZ2FK?=
 =?utf-8?B?akRqb2ZLN25QTnZyUm10cFRxQVMyK0xDSUJidWI1Q0lWRklCbzdsM2tkZTlM?=
 =?utf-8?B?ek9qdHYrNHJNL211c1h5U2tXQWdPU1M0dm1wWWcyeVdlc1JBMVJYUWl3b012?=
 =?utf-8?B?cjNsVmpKd0VjVkhhRGpQN3h2T0lSdHRZb3A3WlhVNVZaYmpXWGxRczdMb1hZ?=
 =?utf-8?Q?fkIloODouYxiZc3djcSxzH0cevh2gZjznpojs63?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q1pwV1h1OHVOMy9PcmIrM2JvWXk0OHBsa1lmMXY3aG5XcDZiL0RycHRqSW5q?=
 =?utf-8?B?MDdvbE5Nak9XWkZJK0h1WWlOWHdSMTRNUXJyTjN3YkYxQkd6YVBCRGdIU092?=
 =?utf-8?B?M294VytnRXJpY3FKVDJDVzJXb1VEeldLbXFhWjlvaTRNTGRIY0ZQenA0SXRQ?=
 =?utf-8?B?cXVkeWg1cHAyNm0zYk5Jdm4zQVF5SEtRaWFGOTVISVlhaE5vOGZCK0ZkTVFS?=
 =?utf-8?B?TkhrZHV3bDlPREd0d3pESk15YXA5Tk10WkJOZ0pac0Z3MXAxL3hXNE9PaCtr?=
 =?utf-8?B?SXpFL0YxZXRjNVhUcVBQOExHOFNpSlBjTzNjTlFxMUZGOVY1MDFOTkl2ZjUy?=
 =?utf-8?B?WmpWLzNGWHd6RURNZFhNNkUzY0xIMElGQUgxcHQ0ODd0RTVsQjVya21KdFNn?=
 =?utf-8?B?N0JDdFp4UE5GMStsUXRIQnc2TWZtNHhJNU1OVjFNblJkdlVWd3h0azdCamIr?=
 =?utf-8?B?RHo5aXNEVHVFL3k0aWZDU3IxMnQxdjlPVzlONTN2cHBFMDZUSHJwTmFDSzM4?=
 =?utf-8?B?Q2RkbjVVZGNiMGFYa1FkWlFoL3JjOFU1anVZSldyNWlsSjJ6SE9ScHJtdnhH?=
 =?utf-8?B?Wi8zNTMvdTJIV1RkMG5xVzFLTEdBL0xLanlrTEZ1SjFPN3ZIYzBIODlxVGln?=
 =?utf-8?B?VFVDUEVXZ0JHM2I0OVVtLzZWaVNORm9WaXlRVXNNcVVrdHhqL01SWlhNT1dw?=
 =?utf-8?B?VWhOODFsZmE0aHBySml5c2JuMmJUUzlDc2FQQkFOT2pOZmFrdUN0bUFXNmxz?=
 =?utf-8?B?L2xOSFY2QkIvUkFEaVc1b3dPdHdlemtKUTRCMTlHSFZIYTB6RmoxMW5tMEdm?=
 =?utf-8?B?MW5aVXM0UFBlTW9GZTNwS1hwOGxWd3p5UFBYcHhub0tCT3pIaW10ZVo2NWda?=
 =?utf-8?B?dEFhd2FNbTYrL0VZOUVPeXU4SFV6aDZxbDRvaG5FNng0ZjhyUWsrak8wcUdq?=
 =?utf-8?B?QnpDYWsvd0tTcGx3YjRERGl0Y0ord3hlSW1wNzFBR3lQZ29ScjA5YUZmUjhL?=
 =?utf-8?B?U1hITFR4cU44RFR5ckNBRjJxOVQxNDRnZHVzNFNaQWxvcW9ueGV5M0g5SE11?=
 =?utf-8?B?TzR5UzkwWWNPYncrWDY3c2FwRHNIcXFQY0NuWWJhY2FKN0w1d2JRZFJKRS9E?=
 =?utf-8?B?dEhCU0lmRDRMUmZRcGUySlh2NXV5OWtrYTBNczZtT2R2TDcyNkQ3NkExRmN6?=
 =?utf-8?B?dTFXNHRrbHJ2YTl0V0paK1pUZkJBUEdzTUtEQndZeUU1Z1VlM2owUjNvNnho?=
 =?utf-8?B?TjBObTRSZGdmVUd1bG5Cdk5GYWZPVGtrL0FLNndkU2xUNnhpbmFaNmZ1Rk5D?=
 =?utf-8?B?YWJIak1aanZGVnZLMDZZREVCdUliZDhMZ1ZxYUxVczNxcVBxQXNGTnJQV1RO?=
 =?utf-8?B?VEpkSldPVlJkZG9ueVk2MzRtWnNFWXUzd0NmdXhIT0cxcUt3dWlGRHl2aGd5?=
 =?utf-8?B?eHBBa3Fmb3Y2aXl3bEJtMDMwVnJKRHUvd1poQXRTcU9JV1VxSzVBRnRZRFFt?=
 =?utf-8?B?cVlnbUlzRlJZQkhFZXlJbFhVOFdNZ2x2Nmsxd2ZVb0lsQ2dpMHE3WXphbnI1?=
 =?utf-8?B?K1hDZE9CRmd6cURIRHR5QU1VS3hpQjRBOGhZbHd1ZXVMajR6eUc1VTVwV2h2?=
 =?utf-8?B?VVYzQW1IYjdFakJRMGZJalRMT3d4Y2ZMRmlGQUs3OFVtcm95R2VVcXpvay93?=
 =?utf-8?B?d2pKUTY5OTl2TjMzbVg2REpuMnlYd1VMdTM1LytnbTlOaTNMV3c4UmFJYTdD?=
 =?utf-8?B?cGt2OElSbUE2L3FQbjVIY1ZJRWMrQ1VJdVRLV3FKUVZucUtjMFRKbWNqRHF6?=
 =?utf-8?B?c0RTN29ySTRJdjJrTi9GZkNuZXdJcVRQbVRGVTlpa1hoakFDT21TSXJyTnl1?=
 =?utf-8?B?QjlVTUdBWERtU1drYUpaaHo1MzJmRzRobEFuZm4rUUMvZ3I0dFF6UHZLRXF4?=
 =?utf-8?B?NlJ4RUNrNFF4dVBacGd5UmZxWlBVUnpxYjZaWUZOUUFQZXM2aE96dStsaWox?=
 =?utf-8?B?NWs0SFlhdDZ2UVRvR2RhY2hCb2o2V3FDQW9YTHRuSFdXZTRTbHYvVHFmQk51?=
 =?utf-8?B?ZmFxaGFVWG96YkZOckM3NWVhL0VFeWJEeXpnUCs5QytJR2RLaTVYTldQUVRa?=
 =?utf-8?B?YzNoemJhMlpxUzNmOTAvOFFRV2dTblh0VDVpUkVxRHlhdkJlR0QzV3NCODJj?=
 =?utf-8?B?bWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 15f2dfcf-3d52-4c7b-3a50-08dc86c55056
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 07:41:59.5164
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vIJ3O8/A5+er04MKKLXVWSgjqffvFi/z1zJgyX7migbhhR+WwlLnOs4dmPTxDJX/b794Dji2it5ERdL7JlXanKYO6vtbXHPPhpQbF6Yyj/U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4705
X-OriginatorOrg: intel.com

On 2024-06-07 8:00 AM, Peter Ujfalusi wrote:
> dsp_driver=4 will force the AVS driver stack to be used, it is better to
> docuement this.
> 
> Fixes: 1affc44ea5dd ("ASoC: Intel: avs: PCI driver implementation")
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> ---
>   sound/hda/intel-dsp-config.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/hda/intel-dsp-config.c b/sound/hda/intel-dsp-config.c
> index 537863447358..478d2b50c571 100644
> --- a/sound/hda/intel-dsp-config.c
> +++ b/sound/hda/intel-dsp-config.c
> @@ -18,7 +18,7 @@
>   static int dsp_driver;
>   
>   module_param(dsp_driver, int, 0444);
> -MODULE_PARM_DESC(dsp_driver, "Force the DSP driver for Intel DSP (0=auto, 1=legacy, 2=SST, 3=SOF)");
> +MODULE_PARM_DESC(dsp_driver, "Force the DSP driver for Intel DSP (0=auto, 1=legacy, 2=SST, 3=SOF, 4=AVS)");
>   
>   #define FLAG_SST			BIT(0)
>   #define FLAG_SOF			BIT(1)

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
