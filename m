Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DC61CA84
	for <linux-sound@vger.kernel.org>; Tue, 29 Jul 2025 12:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753793383; cv=fail; b=Qg7t+ka0gfO0Y/d0gXtTgpjtPjsUbxiuCVOfZNmcJnUvfHFXV7xZqI0AM0Lbff97TW0q/vPWtkzpIELND0t1zRmW/NjPwcQjY0TmquXfrOF39eURHiUhKTWTYwQdbYZyeZCbtQXvZXx5pW7Tyl8e9hjB27omZLzaXlYa6bEKpOI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753793383; c=relaxed/simple;
	bh=3ckqmilN7SiKHyNugI2LE6r3OgikIz72iFM5LC31Yus=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=uJ8K3xkbGX/Abk4mx8p69GeLOLN4l2F+rk4U0K5BFc/ROJ1EInvVFWyqSLG1uZsSkABGA3/+Zvml6JHhwiDUQqWxoSNu55RyO9LjVrw7Qd8KHnRQ1PtJIZE3amt2wMaCnkYelvn2yTAC1uFk4I7wFin3EVeulfFLm+TP34phDBg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BqpO5i4W; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BqpO5i4W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753793383; x=1785329383;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=3ckqmilN7SiKHyNugI2LE6r3OgikIz72iFM5LC31Yus=;
  b=BqpO5i4WKrQQX10ig8TPCNud9IGifHjJqohpYOInGpxC11SgBoYxABkp
   1MYHOeDOPoOoCKzU+OreYgg5rpO41134+HZAubodTNtmc/5tZX5IXAu5m
   oQb384Ta2kBIYRCKdprsefKEepDOjyWI5knKKr+cGgXAVHfypoiBEkCk6
   KE6rW1xY1h+hJxV0jvvLWwaCW88Lc0KToNYZGZ2N2EU3QiA4zUj3g+FGL
   SyXMJTyc0XlbDEHKl2hr6LJl6BTwVBPXRNaBui/qXvZ61f3fLJSqE3dQK
   CB5+vZ1EJ2gW0uMg3rd2mv+Gts8V28xnBvfMYU4NG0jsLj1gkArBbNNwr
   A==;
X-CSE-ConnectionGUID: 4TAc39LzREqeQLbAdn5A0A==
X-CSE-MsgGUID: 7V+fkejgTcqquPszqJUnsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="55943940"
X-IronPort-AV: E=Sophos;i="6.16,349,1744095600"; 
   d="scan'208";a="55943940"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 05:49:42 -0700
X-CSE-ConnectionGUID: OG474IGMQ62D55ltfA/E9A==
X-CSE-MsgGUID: TVxL0XFxRoOCU4/dFQ3Xmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,349,1744095600"; 
   d="scan'208";a="193529834"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 05:49:42 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 29 Jul 2025 05:49:41 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 29 Jul 2025 05:49:41 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.46) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 29 Jul 2025 05:49:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jTCCUtXL3NR1bkW8tJWqF3UlB9SxTfLskzVisUBDcbZ6X6zDiXSZn3AezX9BT/V2u4HdI7s7GOHU+dwLvkGJVC/vt1+3yClwS7DFDpqDiD8bDRHb8PnpYETYOPd75kZvJWIEENTPIPwk3QpRw5ZnJruq+8d9Hg+B0vX5Ou7M3Ohrnyl5siwqha5tARHqxMD8S6RSlty9URHSqq00ltt6P60H6ekjZD4Rq8qEg4RsVqa00iyRZXSRSuG4qrf7sFaIEVjqtTx+13m69PbimpsEXKABT93coXZ4CVEaqmKAA6TxNwukoxPOA4kVNEb0kk3OJ/gdEgbkZKE8Gkjbt61y/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GOoeEn/4f6e4i6Bn7IhGNnkjpK1ddYo9tz1qdTy7wpM=;
 b=xs5j8pmtP/kOcJzsFBxSvk7VBGH0CNPMt2Yl6pNd6ehNN4X8GY+Y9/OzzvKot7ikP9HxKcp2PjWPBnQ9EhLhCi4Gu/IUoqNVQRcmks8S7BW1wt7ZOPX4Drqn/JaIcDiTpLCltSVdaEl9ZaPD+l7F7DJVkZIpeA2KVoi3xG5Miwxyne6ut0ySYI9SUeamTCcogeU+a0/pBmWkwfVrEqiyFqo5UJ7S3J5itUizY5TQ60ajBhPKSYTVl8JS6eDS4Z4dXBmjnzOKmXJ5lIutFtCyRKLd7qefzh7m7vkOO3d0SfiGyLWBF1kXw+9By8lccoxRfpfXqKWrcSpR4CYlasM+0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8283.namprd11.prod.outlook.com (2603:10b6:806:26c::16)
 by SJ0PR11MB5917.namprd11.prod.outlook.com (2603:10b6:a03:42b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.25; Tue, 29 Jul
 2025 12:49:25 +0000
Received: from SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::3:e0a:87af:d4b6]) by SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::3:e0a:87af:d4b6%6]) with mapi id 15.20.8964.025; Tue, 29 Jul 2025
 12:49:25 +0000
Message-ID: <179e32a8-b20b-40ab-8663-2a793a96993b@intel.com>
Date: Tue, 29 Jul 2025 14:49:18 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ASoC: Intel: avs: Synchronize happy and error paths
 in PCI probe
To: Mark Brown <broonie@kernel.org>
CC: <tiwai@suse.com>, <perex@perex.cz>, <amadeuszx.slawinski@linux.intel.com>,
	<linux-sound@vger.kernel.org>
References: <20250729114229.309472-1-cezary.rojewski@intel.com>
 <20250729114229.309472-2-cezary.rojewski@intel.com>
 <9af2c2ca-103f-4f2e-afab-1fea5a2160a5@sirena.org.uk>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <9af2c2ca-103f-4f2e-afab-1fea5a2160a5@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0472.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7f::25) To SJ0PR11MB8294.namprd11.prod.outlook.com
 (2603:10b6:a03:478::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8283:EE_|SJ0PR11MB5917:EE_
X-MS-Office365-Filtering-Correlation-Id: a20db4b7-47c9-44a1-b58a-08ddce9e5879
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L1l2YWN4eFNER2pLRGFjNGl5VW84Zytya3VNU1IwZ0ZsWlBuYnkyc2w4Tk50?=
 =?utf-8?B?VzRWTUNoVTF4cUkwMWtVbzR2eXBEK0JMVkJzYlhkWktIZFo4eEMvSWdHTFBx?=
 =?utf-8?B?V214aDIxMDNCUFpvUzEyNVFGQi9jSmZYYnFDNDFJbUMwbU0wd3FTTFhEQ09Z?=
 =?utf-8?B?M2VtNFRKMGgrTGFjMHV6dVVHb3dUUVVqZ01vbC9hTlpoZi94MEd6ZUZTeDlU?=
 =?utf-8?B?N245Yk5tQUc3OFBYSUZnNkhUVlNqdUl1VFFBWHRITjIrakhmY1lZOVBtWEZM?=
 =?utf-8?B?SEszbWZ0b2NqQzV0c3NSN1REd25JVTVvWDY1azdsMU50aVBiQU5jN3plM3Jk?=
 =?utf-8?B?VjMwZXdDODk4UExWMVZDKy83VituUGpiNFQyYWExYVVOS2huKzRsVmhBMTEx?=
 =?utf-8?B?WlAvU3hhdkRvRnJXQjJNQjNUUDVYaXVndjltc0p4N1lvRmEvVmlnR2NyYkVI?=
 =?utf-8?B?VnVVRk44dmxhMTM4UHkrTHBiS2IwNndwb2hQdnRYLzFpMkZHSG5hUGVVZnlT?=
 =?utf-8?B?d2FqUkhIZ1R6Z0dZbWVrNjhPNUh2TTQxdmFBYndCSDFYbVJJMUUvdG4yOW1G?=
 =?utf-8?B?ZDVIN0lpR2xmVzFnZGZhcEpQL2FMMnp4RThvenVDRkJZeEJSTjlMcWxqMGl6?=
 =?utf-8?B?aW1IRTRPekI0ak5nTlRScGZwbUhzUkxIYytBUzVYdG45Zms3RXdKMU9GVDhw?=
 =?utf-8?B?V2JySnZSaTJYaHFUdWxzRzVuQkhrSTZRTXRTVzJMNm5oN1lBRGpiajZ1N2wx?=
 =?utf-8?B?Tmo0ck80U2tTM2pBYlBBRUZwYmZ3ZXdNNlJnemhGd1EwQ05EVHF1S1VzZVJC?=
 =?utf-8?B?ZnB6UFp1SVJmSGx4NEFBYXlwWThKQms2L0o5eTgyMnZvRVc2L2g4UjFYRGZY?=
 =?utf-8?B?RUc1RGp1VVRNa1NPZWFjVUVwRlFZR1RWa0pnam1OcVROZ1lkWmk1U3dhT1ht?=
 =?utf-8?B?QStpYkpYdklwV0s3TUZiVW9NWFZYVHMvNTZzYjVXbXBXOXhXY0QzZWs3Rml0?=
 =?utf-8?B?dVY3UWpScGNqVVVqRUVic0tWcXZ1VDhaeWU5LzZtaS8xdWg5dlV4dU0wMUg1?=
 =?utf-8?B?QlZGeWNheW9TbkR5VXFyNE9GZG5rWlNaNVZrVHNMeFlPSHFHUUR0S0pvelRi?=
 =?utf-8?B?Vm5tc0NieVdrUDZlWk5mSUhNOWh0QlFDcE1raHdhaXdpS2Ixd3JONVlYcXBD?=
 =?utf-8?B?UDUrZUxnUUFvY0s5eWVHUldmMlpXMUhYd0xJaXFyWHc0RnhhR2FKRU00T1Vw?=
 =?utf-8?B?YWx0NStoUEptanJYYXBqOVN4cWxMQnN3NitSaTBNbXowSlFwc3FjOXNxK2FU?=
 =?utf-8?B?d2RvUnJjSmE0cHo5b0p3cmVPWnhqdERicDJhZjJ2UVQ2WVl1QWJFTHJTaWhH?=
 =?utf-8?B?SCtEUTErOEpXSXczRmxQOW4reFFHRUcrOGZPNVNaNXhCT1BiOUJlbzdFSi9M?=
 =?utf-8?B?eTlRanUwWlMzOXdvME0vdE9rc1NORmxTdlFjSHhUNmY1aE41ZzNYcmt4WUtl?=
 =?utf-8?B?K0FKVG16MHNTb20yOURGQWZTQ3ZMeUxWWDhnQmdDZU5RL2M4Q1NlcDg1Ym9j?=
 =?utf-8?B?elhjcEZMYUdyM20zbkcxNEZJU0Q4K0ExRWpQZ1d3bWdzYUJXZjNBRU02T2dv?=
 =?utf-8?B?R0FpNU5DRmQycHBsOUlXeXg5bXFDd3pkSzZDVjRLTWpGcjdobVkrZlFIYmty?=
 =?utf-8?B?MHBUU085RXZoaWp0ZjBRaEo3bXNmNUFsL25uYnptTDk2ZDk0U1hvT3hDajA2?=
 =?utf-8?B?MWdGWDdMUjBnS1JyUHFibVEzUEQ3YVBuZStpU2JIQlIxOTByeFFXVXkzODNa?=
 =?utf-8?B?Z3RDZThNbml6VjhRNi91Vy9yMXlJc0lVa0kxMUZxTVFqRGhhOHdOTGNwcFRR?=
 =?utf-8?B?MU9icnlESG55SnZxWnBIR0RTWFVPSkRLckZ3RGJTdHM5T3c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDBQcTl5a1Y3VUF2RWlKdkV5dUVMZzBVS2hYUmNmSVFxNVJNamV5NmsyMVhK?=
 =?utf-8?B?ZlVVYkNDQ0Y5OWxVZnV5S3JWakRoYlVPTXNMWXpoRFQrRUZ3SE44OTlDNjFW?=
 =?utf-8?B?M25LMU05Y1B2SlNkWUJjNFdWMzBRZlNSby9zYWxFUVZiZVpJM0liVDM3QmZC?=
 =?utf-8?B?d2lFN2dzK1RKOCtZejA3VWRjbmtHQ0Nsb1g3ZFArU1lleW5jM3Erc0plZldB?=
 =?utf-8?B?MVlFdjFvdnRHOUVvbXNIMEczOWJaU0c1NFFqc3FVZitOQk5Xems0Um41enlW?=
 =?utf-8?B?WmNIUXducUpvV1hsVXJpck1ueVJmYVFZUVlpdVl4WHd2blRINTZsOUQ0OHlh?=
 =?utf-8?B?TElCWEZzc2tadWV0RlZ0d2hWVEJlQzYrOFUwNDZUaTRqNnlnRFpuM2ZnM2xv?=
 =?utf-8?B?NkpQaXF3U2J2UVplZEdRZXM0ZU90VXNRV3pKSElXNVhqRk9uYmZSclVIZ3V4?=
 =?utf-8?B?WVJRcTJvRFhicGhtaXFIckI5TXUrSkFBb0w0d1ZHajhBeUVGa3Y1akRiMThH?=
 =?utf-8?B?TUx1ZVhSUVVUenRNbDRrNjFJc0dBcjRyOURVWkF1QUwzRkpjcHdMUk56QkZu?=
 =?utf-8?B?aVRmcHphb1J0M2hIb1Q0ak44czAwRkVERzgzOXU0ZmkzVlZzZWJYNy9xQjUv?=
 =?utf-8?B?MlRSNnJWVlZnSGYxVDA1cXJuZUZzRDNLWmtocXM2alNJTVdlY2Fnckx0VHIz?=
 =?utf-8?B?ZCsvbTFUK1YwSnp5ZEVnR2JmWVNoaitjM3IwdnpRS296eHBBRHliRzZUbjhz?=
 =?utf-8?B?V0QwSDVNdjV6cGpDVytXYVRDZHByQU9ieFZ0eTJ1VStXWFVhbnRzQWRDV0hY?=
 =?utf-8?B?RkRIT1lieVppZWtXa3RqdXhPelNML0djVW11UVcwMnI3MThMWitLK0FaMXdm?=
 =?utf-8?B?N29rT3pjYTExeVJmQkRnVnRCQVdxdHVrbHBkaVZIZ2dpblJQaEZldFFXeFNq?=
 =?utf-8?B?TlB2RnNQOWlzWlRSVXZCTE9XMUZndkVYdDJrMUtBUkY2cjY2SDhWR1pYeE9r?=
 =?utf-8?B?QUJYUVprUkZ2dHhXNkdRUE5GeHpGVlMvUEJDcW5DWTN4WTFZcUxiZUx2cUN2?=
 =?utf-8?B?SEVMaEFoeUhuUUpBd0pxU1BXQm04cjJzTlc2Mi91VHBCQ1lNRE9XR2FQckFQ?=
 =?utf-8?B?QkRRb0NuY0FQREhIdFY5N1dCQnQvYnprVlJTTmlvNGRkRVAzMFBuT1JoREdv?=
 =?utf-8?B?REhGTllyYUVjRUZiK1RabkZkM0lYVm44Y0pVa1JwMkFyOHVod09rZ1BWRDNN?=
 =?utf-8?B?WXh1djVZemdGWmtNb21QTytZa2pxQk84WTRseUY1cG1kZjczVnJ2ZldZODVW?=
 =?utf-8?B?dGM1cDZjNVoveWViLzhLbTMvNXBnaWg4TWY5NDZoSHdDU0QyNk9mQm1sQUVI?=
 =?utf-8?B?ZEtPeEw4SWpCcWpWRnBOVm1WZTZTQTY2YmdwL2xJajlxTklFSjFybTlrSGF2?=
 =?utf-8?B?M1dXN255Y1RRT2xIek1PUWRqbS9MY01xcGJKbUN4Z1VmYXA5RFpUUzh5N1Bm?=
 =?utf-8?B?QXRKZGkxd3V6c0dFQzh6cnc2ZzB3WG1MWXpGQmoxQnRYOVJFcWFDQkM0Y3Yv?=
 =?utf-8?B?WjdocVJkdkJrYkdWeDRIL3NLNE91bVJSd2loZlBXejBCOWZSQUpzMTBhUlNV?=
 =?utf-8?B?RlUwSGhZRU9vTzBPQWZqSnprWTV1ZEJwNHRDOUNyV0xNc1YvQlBvKzRyVmRF?=
 =?utf-8?B?THZDOFFyMVZveW1BTnlZTVVDVEd3OGFLdDFwT0lRRnliMUpqTTNQVWxnaGs5?=
 =?utf-8?B?T2J2Tk9HNkRaMTRmZzdYREw1UWVFWFBEOHFlanMwZTZiNWxwcnBzRHZORjAw?=
 =?utf-8?B?ZDIrRFRuZkJzWk5FdUlROE9wYXlBT3owK1U5bis0RHBQK2JJUGhQNkVzNnEw?=
 =?utf-8?B?TFAwNUlJd1AwdHdGbFRmak1BRi9lbVQ2SzNMWWRMckpVV1pWSzBsQnZwUWhP?=
 =?utf-8?B?U3RTbE1TSSt2SDJPWVpwQUozNlg2OWs2aitZdXlERjhUbFdqeXpQRW1sbG9G?=
 =?utf-8?B?cjcxLzVoWEJlSkNOSHNENC9PSFhWMGN0WTRFeWY1bFkyNUJqMDY4dHpMbGlR?=
 =?utf-8?B?RnJLb2JYOVV4cGNiTUplcHRMYlloWWlLdzFhWWhuR21PeDNhRGFMMDM3OEYw?=
 =?utf-8?B?eVhHa3Jqdm1CTGt1bDdDODlBYUIzU1ZDWDVMOXFFWXVwbEZBRWo0aWdvUWFS?=
 =?utf-8?B?WkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a20db4b7-47c9-44a1-b58a-08ddce9e5879
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB8294.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 12:49:25.2852
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tO5YabljShF2Sui7M/wPbrjKcZ91XY7Cp8NpWEw4oSj7BIFluGIJazeJvxkL9KuuAo7fyQ+mNyM31tJkgJLL0leweJrDpRmlaaZY3Rb3lUA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5917
X-OriginatorOrg: intel.com

On 2025-07-29 1:47 PM, Mark Brown wrote:
> On Tue, Jul 29, 2025 at 01:42:28PM +0200, Cezary Rojewski wrote:
> 
>>   err_i915_init:
>> -	pci_free_irq(pci, 0, adev);
>> -	pci_free_irq(pci, 0, bus);
>> -	pci_free_irq_vectors(pci);
>> -	pci_clear_master(pci);
>>   	pci_set_drvdata(pci, NULL);
>> +	pci_clear_master(pci);
>> +	pci_free_irq(pci, 0, adev);
>> +	pci_free_irq(pci, 0, bus);
>> +	pci_free_irq_vectors(pci);
> 
> The ordering before clearing the driver data actually looks sensible
> there, though looking at the interrupt handlers quickly they don't seem
> to pay attention to driver data.  Really you could just delete the
> pci_set_drvdata(), it should be redundant (and IIRC the driver core does
> that anyway).

While I do agree that pci_set_drvdata(NULL) could be skipped, I feel 
better with having a true reverse order in the error path:

happy path:
	pci_alloc_irq_vectors();
	pci_request_irq(bus);
	pci_request_irq(adev);
	pci_set_master();


error path:
	pci_clear_master(pci);
	pci_free_irq(pci, 0, adev);
	pci_free_irq(pci, 0, bus);
	pci_free_irq_vectors(pci);

Is there anything wrong with the approach before I send v2?
