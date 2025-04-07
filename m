Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D6A10FD
	for <linux-sound@vger.kernel.org>; Mon,  7 Apr 2025 08:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744013123; cv=fail; b=Ys61eThWU5gISniihkWOsOmT6dxrDSxno2ceRYoblCCPDc0Np04Q20SNfQ8qsn6rd1HPpusrdp35joTjGuFfcjk38BdRAOH9dr4vzEET2zrdQEWvQe7RdGzEI3eaxFQGLuNtVBlnGM/9FHN9IOUY3za5d2GvQ2KQahJVADuGnaE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744013123; c=relaxed/simple;
	bh=rlrfGWnaX10iMHbsTsZEC5HvTevrVE4u17RGOvUg6oI=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gJHNs4JXDXvNEDFZAlcn8B4ptjjwubD9Zt3kWVsutrQ6uaLV5M3bobIfzVUQD7As4LfQngWgrrkJmzgIQKPJJPKyowtIICbXIwXVlDjEBwjhSXcg+LDYd0I/9kB4g1dRPh9dFspWMnSn+/bpHccrpIFsBQtBJ+AHk6VLW5hgHn0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eG5yANeU; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eG5yANeU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744013122; x=1775549122;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=rlrfGWnaX10iMHbsTsZEC5HvTevrVE4u17RGOvUg6oI=;
  b=eG5yANeUabwpkGsHgAcRNgvuyjaYDWJFNDjzGX6EKyVBkjHQEk6eVy2w
   bGidAc/D7LutvsmOY/PuR69ExzzhdZyXSunxn/nPcm711e7n7K27ytZTp
   mNC8o7Mv3jYliahNoQJKUdtGEBxrMZKUw0wasGq2YxQS9Nv/TaxdgCt/T
   /HZ4JAjcyIT89s5RTtmp1numPD5DqNgHui5FIDqiGFTlktpeRWztQathU
   +uXn3XXCKA5c0292sXHwNpcRzQd8OEdSfwZ/9eX7nsnR1dLS1mjLaihIx
   ODHcxkwI3XVMqYq6AvfqzCTNS4GXddu0F10X2nS0xwg6J6BGbh1LCOW26
   w==;
X-CSE-ConnectionGUID: q02GKnehTxWciXJ3h03JuQ==
X-CSE-MsgGUID: tCFoGQQnQP2C3Vck495wRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="45097382"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="45097382"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 01:05:21 -0700
X-CSE-ConnectionGUID: kTpz9MeaRHqrGNxFXQCKRg==
X-CSE-MsgGUID: o1Tfsf1KSsSVMbvjqD8dcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="132614010"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 07 Apr 2025 01:05:20 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 7 Apr 2025 01:05:20 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 7 Apr 2025 01:05:19 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 7 Apr 2025 01:05:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=delJn2MYXFN+XVyXbo+mq1ojpeOasMflOlO+AKAZy0QW9dQc+9+dIqNw/9DKoX3iH7T2Afk+JoUOqcG5B2g11dhwrbuhki6pVbnNFRQHPDa7PNBOXohQsfGZNka5Uma/G5Jm6eoYAjggu3rxejDwho4X1G6sqLdOvfU26iJLvW3ad1pHc/D2bEHtuJwrfoxSUB4zqgpcOsYbTPUYe3aXYBoFxEw8y2pfPNk8Y7Fm1PLIyGOeN8vzZ0xm0Eo4LxzgxwMyNcOb73KDMA6HGNHnrRRq4Ixe7HK7hi2nm2DVehEEtvBQfd5DKnXUYWGkKoLRPJ/s75uIPu1x5zUUjG9mUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2KRTgoA4q9ve8uCFPGeX4446e//rHnwujhOaIXzSnOs=;
 b=fkAR667bxrTjL0Imt4fjJMF0UTAFRXXOmGdj6B2yELNljUh6cFj+hhcCOXlyebtGzD/LAUIG8WWjA4LQDgsr4WKGlEsvqXEg8AJKkUXRlcDbY8cxlaLuM+hosn+8u1550PyZkK4TmyISB4kZM3+Xqs15x/hJ1dNCPGtznNPQEgiWRF5/X0k3IbM0mpe9iR2h+ip4IOvERC7X84K28hNaNddftuBJCI7MdRWr7DLfFGvWwRX/KuX13lW7a2PsV5gL9om+sXtdEtT60ANH6Qa0zCogF2h9fyY3gMUyYINrjnn13isONWnD0Y5RCuvKOxvBFCeTNaGMb924DUh6laldZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6365.namprd11.prod.outlook.com (2603:10b6:930:3b::5)
 by CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Mon, 7 Apr
 2025 08:04:50 +0000
Received: from CY5PR11MB6365.namprd11.prod.outlook.com
 ([fe80::4fe0:966d:6065:3d73]) by CY5PR11MB6365.namprd11.prod.outlook.com
 ([fe80::4fe0:966d:6065:3d73%4]) with mapi id 15.20.8606.029; Mon, 7 Apr 2025
 08:04:50 +0000
Message-ID: <01eecf3e-36a5-430b-8e2b-ef53edbcf703@intel.com>
Date: Mon, 7 Apr 2025 10:04:41 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/12] ASoC: Intel: avs: Add support for MTL-FCL platforms
To: "Girdwood, Liam R" <liam.r.girdwood@intel.com>
CC: "hdegoede@redhat.com" <hdegoede@redhat.com>, "broonie@kernel.org"
	<broonie@kernel.org>, "perex@perex.cz" <perex@perex.cz>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"amadeuszx.slawinski@linux.intel.com" <amadeuszx.slawinski@linux.intel.com>,
	"tiwai@suse.com" <tiwai@suse.com>
References: <20250404094953.3657679-1-cezary.rojewski@intel.com>
 <ce71ea6903d05c3b5312c9f534d83478e488729e.camel@intel.com>
 <abe40ed3-49fd-49d2-bb5f-42481898ecd4@intel.com>
 <b8fa998839daa544acf868e6260fce59f863cf5d.camel@intel.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <b8fa998839daa544acf868e6260fce59f863cf5d.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR0P264CA0164.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1b::32) To CY5PR11MB6365.namprd11.prod.outlook.com
 (2603:10b6:930:3b::5)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6365:EE_|CH3PR11MB8441:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e1641aa-d8cf-4a66-adaa-08dd75aadf2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Qy9CeHJES29hRlAwbGREUWR2cDkweGZSUkN6MmJZZ3g3MlFTMTkvUm1uc1lW?=
 =?utf-8?B?SjNJTTdpWjZScXVOUlpnVy8vU2wzalhMdTVnRld2cDR5WkhibFJUaHBOcVpv?=
 =?utf-8?B?U2V4bm9RbE5uUngxU0VZampsQUtCQ1lQREVhS25KOXpnbTl2Z3dqZlEzR2RQ?=
 =?utf-8?B?SnppSkdIOVBIK0VjbUU3ZlNPNWhZaUtuQWQ3ZDJaY0xuYUR0Y244ZjhHdHNq?=
 =?utf-8?B?YkFKT2lFaGQ1R00ydXp2UG9FZmhIYm1WSHpsWXNwOU1KOEVlZE1pcUt6ZVMr?=
 =?utf-8?B?RHVIMVJtQTJBWjRpcnN4Z281eGRuazNKM1MyVFV4MHZnbTFwckRmNDcwcUpp?=
 =?utf-8?B?UklkM2Z1b3FmcDM4M0YxOEZrZXc4ZnZMK1pIRERXYWFwTTMzMkVQckNHS2pu?=
 =?utf-8?B?SmRaSFZoWjQ1NnJaZUlQNzIzY1hud0dET2VmOXNUd2FkaWp0VCszQWlCcnBk?=
 =?utf-8?B?M1hQd1pRenI3dnpvempNanl1bFQ5V1Vpb3RlMFdzQ0FzMldHSUYrd0MrTjJH?=
 =?utf-8?B?bzZEVllkQnNtWjFUc1I0bVlhUGRpN0lCTU9vSWhDRUJYTFdmYzZSRCtpb3VC?=
 =?utf-8?B?ZG9zK1l1SzFPRjRxNVJrNk90QmFYR2JCR3RlMVVCZmcvK0IzK0JLNXNxeG1Y?=
 =?utf-8?B?THR0eWVXQlRCcU03bHI3VlNuQ0FFaC9oUDdXV3NYdHM5WXNRUVEyRFJHUmlB?=
 =?utf-8?B?cjVoVGpVQ3pIMm9VLzVORnFIbFhqZDNCTGptdmhSS3pYNGxYS3d4enJuWmxh?=
 =?utf-8?B?M3h4b3RIMnNLUS9lNXlseDUvMHM2Z0k1UjRwT2tzWW5sOXk3SkVRdW1JN05X?=
 =?utf-8?B?ckU5cUZrMlNzSlZUc2prYjNkNmoxNDlUNWlzVXBNdWNMSFZPbWNlbzR1dTJv?=
 =?utf-8?B?bm53cGdicFpRT2hrSC9YNTJ5QkE5VkF4OXZ4V1hDOGIxd1ZScXhSMnA2QU84?=
 =?utf-8?B?STF4a1ZOdWkrOXdkV0ViZ3llYUozbVhENmx3MjlmcGVZSzI5aENvUnpMVkpN?=
 =?utf-8?B?M280UERtU3cxeDBsZWZGUkdrclp2UGRjaS9udFY0NzdjMnhXTFlnQ2Q0Zi9G?=
 =?utf-8?B?Yjl5K3REZXZmdG5SbWV2c0FHOFd4STZMSzhub3hTeVFsaUtLc1NMY3JUK1dN?=
 =?utf-8?B?MTNxL01mYnFNNWYrMWc4aHJCNTArUlpKRGZiUGRkamZidkw2dHdkTjdQVUpx?=
 =?utf-8?B?ZWtzWS9yVjIrV2NLRlRDSG9sS2FYUnBNUTg3S0txMEIzc1VCenVKcWRDUmtk?=
 =?utf-8?B?bFlGR0xJZnR2b0JZWGNJbEhWTjVUODRDbnQwMjRoKzI0VjltK0hqaXhOSVYr?=
 =?utf-8?B?NXNxZmJVT3MydG5IcDNSdnNGOTJxREJia1RkSEpDY2J4aiswT2dXTElzd3Jn?=
 =?utf-8?B?UlhXYU1MT0JkWU5TT0JZNTJRSmZzUXpReHFZTXlYankyMlF0MGVkUnFuUVUw?=
 =?utf-8?B?NTNGRWlhd01xWFdySmhoZkJBYUVQbjQvY2ZRQnFGOURpQnkyOXdHaytYcVZS?=
 =?utf-8?B?cTBScndPcG1CVFAwRjhyWTVuL0YraFljK3FTRkdKTHR5enRUdkpGbWhqdms3?=
 =?utf-8?B?VGJpTW9MZ2xJRzdBanFBZTVTd1lvMVNsdXlHR25tSXFhMVN5WHVyeVErbmlX?=
 =?utf-8?B?emVTUytSb1NxN0lMZkhtY2loL2VkeElKZ05DVkVZTzFHaEowQXJmZW9wSFNa?=
 =?utf-8?B?NTZHdVU2d09JOFBRQUJSR1pPYTUxUmlMYUVaRERFUFpqZjNJeEJlZGJ1ZkxL?=
 =?utf-8?B?b2pISytVdWNpVWRuNkRlNHYyQ01pcmx4Ykp5UFB5U1VjUUI2aEZNWGlYVG5S?=
 =?utf-8?B?MHc2NDN1dmlraWxwUXlwR3ZYZjFNbVdjNTB1bGp1aUw4Zlg5VTBLaHUyOVd5?=
 =?utf-8?Q?wxNAo28I3CODN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6365.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUJlLzR5SURTZTYweHY4VmY3d0JPVHVpZTN2TEtJUmVVWnEvME40ekZsSlhZ?=
 =?utf-8?B?bWEva2hvSjc5ODVFTElmOXRxcVB1UDRJKzYvZnpRRHgySk0yaUdjK1pvTnV5?=
 =?utf-8?B?NTcyY0ltb29SbHRmS2J2ZDFja3lPNkJ6QjdnSzBzVFFZWG85YlpkQUJKYVla?=
 =?utf-8?B?WitEb0pZV2piaWMzcTMzMFh5dzF3czFXcUxjU2FFK1lBa2RBZUFqT3IzdGN0?=
 =?utf-8?B?SnZDT3l1bmNLZWJZTG53QlAwTVllRzlxVFByQjBjVExkQ09jM1huaDFLbzZB?=
 =?utf-8?B?cU9IdkJLTy9TeTBmV29kTFpVdWd5NTVTRFZxOW80cHl6dklTbzRWL25rbElw?=
 =?utf-8?B?NTFkdmNDVDlZU0h3S3laRzlkR0I5SVNySEc4VWkvYVRSbFpJSWc3WFhlTUNV?=
 =?utf-8?B?UExNZ3k0bTNXTlhrSC9mR2ZFUndqUEwyMHJscEIycXBSVWFZZFA2dDUrZmQ2?=
 =?utf-8?B?enI3clhRM3JzampEUmZzR2puVi92eVlJY3lwQmJiK1VwUEhJRWx5VDVKMFJl?=
 =?utf-8?B?cmZvdGpnK0ljMUYzVE5NdU1zNXRXd0NhLy8xdDR4TEVvQ2xvT2V0OE9hbkly?=
 =?utf-8?B?cmVzZE54SlBGZm92L3kxalJyQWZyNElzNnRnQVA5Y2h0VXczODlsZ28zRVhV?=
 =?utf-8?B?cXAxNEF6ZlgxbDJnWm5kaVlxSTBUZlNCUkk5TVhFeG9QL2hEWjBBeU5mVk8r?=
 =?utf-8?B?T0IxNElKRjR4YkIwQlNrRTMramY3KzkwTGZjTzJvVzZVUWw5TjJuWEdCbjh1?=
 =?utf-8?B?RnFvcDI1d2ZlZFl2eXdjWTJGVEw1dlJtQUFaaFlXTFhqeCs0YjdQVjhkVGhN?=
 =?utf-8?B?OVBDTjFSdmhRYmlYMU5yK1hKWGdOSm9YOGpCNFkwcld2M0liQWtsdDlxVXgz?=
 =?utf-8?B?TURjdFdybExva0ZCb2o3VnZuR1VwMXNIWHhrNms5OFBrZXhTTEtHOVhVRU1L?=
 =?utf-8?B?Y2VYMCs1cUxML2VSekpVUlE2M0MzYzZWUS9TY0Y2djE3ZUl5SjJSb1NOWWEz?=
 =?utf-8?B?T0lZVlJseUorMjA2eFVRbXE2Sm1VN2lmY3ZockEyQUJxQ1laWnF2RTFvUUg2?=
 =?utf-8?B?M0dtV1c4RWVXMHRQWjBHN3dLZEI0VW83OFQrWlZzYUxtcW8rRUFoTnpUaFpk?=
 =?utf-8?B?R0M0YUdYenVKQmdKMTBzY2VMc3J0ekZwdFZCTHRsWEtveVMwMTFZc2xnZmQ2?=
 =?utf-8?B?bm1pZmtPYkhheW5hYTBEYWVDbnpkOHUwektNaXpPcHNuRmZzRFpEa1VzeDdp?=
 =?utf-8?B?cURjdXhadXZidk9mNlRVSVdld0RDOWlKbjRtNFRWT1h3WWpQVWxQWEpMQks0?=
 =?utf-8?B?ZVljdUJkTzdWRy9yU0JhV0drRjZ6Q1c5SzVERzFHblo3ZVlvd2x1Zy9wcWlk?=
 =?utf-8?B?NWRkc0RxUFpvSTdyOUJNMjFzMlNwZERYZ2FtZWFCczEzNExJcXFPZ2FLT2ZV?=
 =?utf-8?B?VStJM0t5SUFNQndXVnlOTU5IUllQNHRQKzJCeWhEek8yU2prM0dvYWgwU1Aw?=
 =?utf-8?B?TFliVVBIR0JTbXgvSXd0MG9rWi9rcE5pMkh0b1hja3pzTHc0MEg4eVpXT21T?=
 =?utf-8?B?dU03TW9mSE9qZldtQ3d3T2pzQjcwR0tHSHFtT3JIaGQzUWFTY2JTUndYVmpx?=
 =?utf-8?B?OVRpczg0VlVjQXEvZUIvWUJpWSt4QkpBdXVXb0t3QXhUOWNlUEJ0c1Raa0pa?=
 =?utf-8?B?djEzNXVJWjBDODM0R1JkZWxRVU95dkNYUk5KVDFuQ3M2Q0FnREdSeDI3WW9L?=
 =?utf-8?B?b1I0TGRpdm43REJtT3QwRTBJb0JqZ20zWnRtc0M1aElTMDhLTGxITHgvRVYv?=
 =?utf-8?B?SHJld092MlNwNno4VTFpMzhpSXNnMStOSFg3T3BiK3dHSXJQL0hiWjY3ZWMr?=
 =?utf-8?B?Y3RaZ3ZDb2NQdWNMRmxHYmQ5alRnK3hTNEpJRmY3OCtETEYySFVoY2dwU0w0?=
 =?utf-8?B?Wno2dlBHV3JlaXRLOE5IYlcrR2FXcVFKSlZieko3dS9TbE5JeUtlbXc5cVg2?=
 =?utf-8?B?SmxPV0RsOWVLVk9JZjVQWXFSajg3dmhnUFMrd2RENElPQzFRd3hGeDZNSXEx?=
 =?utf-8?B?UTF5emVmcElwem9IN09VeEdURjRuNStCOFI1QUhCMEg3SDZuM0dmYzV2YUEx?=
 =?utf-8?B?QUZLVjNvUTRtSE5BVWh6d0wzOXR2RHZDVDlCbUpDRmNXK3d2SHNhY1VaZUZm?=
 =?utf-8?B?c0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e1641aa-d8cf-4a66-adaa-08dd75aadf2c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6365.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 08:04:50.8204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HYgF+HuPk0uTkqCWnP2ot9+t/35zdFJ/vq+NxfKJIuxu3CdHItIVrCMW+t/XMlIV5yIdelDBjJjqa0lHHUhjF927nKBGJ1k6uwJwqlhO6ac=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8441
X-OriginatorOrg: intel.com

On 2025-04-04 3:28 PM, Girdwood, Liam R wrote:
> On Fri, 2025-04-04 at 15:09 +0200, Cezary Rojewski wrote:
>> On 2025-04-04 2:52 PM, Girdwood, Liam R wrote:
>>> On Fri, 2025-04-04 at 11:49 +0200, Cezary Rojewski wrote:
>>>> Cezary Rojewski (11):
>>>>     ALSA: hda: Allow to fetch hlink by ID
>>>>     ASoC: Intel: avs: Ignore Vendor-space manipulation for ACE
>>>>     ASoC: Intel: avs: Read HW capabilities when possible
>>>>     ASoC: Intel: avs: Relocate DSP status registers
>>>>     ASoC: Intel: avs: MTL-based platforms support
>>>>     ASoC: Intel: avs: LNL-based platforms support
>>>>     ASoC: Intel: avs: PTL-based platforms support
>>>>     ASoC: Intel: avs: PCM operations for LNL-based platforms
>>>>
>>> Sorry - AVS is not officially supported for MTL, LNL and PTL on
>>> Linux.
>>>
>>> NAK.
>>
>>
>> FCL is a PTL-A, PTL-based platform. The driver is officially
>> supported
>> on the ACE architecture with clients utilizing it on distributions
>> such
>> as Android and Yocto. As software needs little to no changes to cover
>> PTL alone it is preferable to have clear division: ace1.0 <- ace2.0
>> <-
>> ace3.0. The code is maintainable and readable this way.
> 
> No argument with FCL or any non client devices.

I see. So we're talking about pci_ids and their attached descriptors, 
and _not_ removing the functional code that enables avs-driver on ACE 
architecture?

The filenames/prefixes shall remain as-is given the driver's design - 
platform that starts given arch, becomes its namesake.

Kind regards,
Czarek
