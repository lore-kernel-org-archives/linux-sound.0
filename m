Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6EE352002
	for <linux-sound@vger.kernel.org>; Tue,  1 Sep 2026 11:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788263925; cv=fail; b=JRyFdJFUyQb4mNIgLejGU6GCum8UzV4bYLfFFUDmPCNCgX7rtsm1q/I2nXKjkrYRCS3BLBOiPzSQ0GrfiaZSGvbTiqfjtLas33UcUrftruywPE7PqmMju4DDjKsMdnVGFVu4mPT+7Dk/sIu4oUlolvPc/OnO/YlM2YbHCxCJgYw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788263925; c=relaxed/simple;
	bh=1Q94na9RbvW1T6JUtWRTvSyEEyZ1oo/gDoHhpJck6Xo=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cY03dC36DM2U3LrxQXBss9qQF6IwFQvtPbtTeibsaep4nzpvf+sBv+S2nXRbcVWmVn8+9+xfFSLz0/IpRwUd4/Qp3NMXJiNL/ZFn1JVD35wQFPWuFHpjaVFmRgKGWpQv+886VhCP9p/yvHjmK6wNLxBi+381pAapgBhfOWEFl3k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DkIFkNfd; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DkIFkNfd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788263923; x=1819799923;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=1Q94na9RbvW1T6JUtWRTvSyEEyZ1oo/gDoHhpJck6Xo=;
  b=DkIFkNfdLW/kPB7tPSw/b8H8wN8qjf7vUZiwoHUkUwpje0nzfHGo2Z8g
   BZLsVl+Tpcnop3mQRLmO/OeDcCDfCcxXEgNUk+ob7zt5Lm5iMjKxlvpB9
   JriLhNQ4VPmAy3V/j5PJsPSJY1M44IqWN6LxHNitB0dAG4faHP8aKhnMk
   pZaQ75A4rvRwX0f2EZKsmusdpKjAfrIb+mH/SMNj1Afz7DHK016+KScgD
   jeKYWAy1lPOJDJhQSq8BTlPKXA4oi30plnpLH9+JR8G4OkSWSSv7aWexp
   q0oZomH3XW7rab3zE0hFx04U3fpSCnLagq0I1GmaKyV6gVGtu2in1YvQ6
   Q==;
X-CSE-ConnectionGUID: r+OgSpeyS326+ujzd6+3fQ==
X-CSE-MsgGUID: eaMDRJUiQySGUcqBPjmV1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="114228165"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="114228165"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 04:58:42 -0700
X-CSE-ConnectionGUID: RI/0QoztS1mZ9cPGSdu6eQ==
X-CSE-MsgGUID: kPPbcvmsTDm4cwI0vbJ/6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="267763546"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 04:58:42 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 04:58:41 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 1 Sep 2026 04:58:41 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.64) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 04:58:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XAOnp1dIqVm1ezHKzihE27tDHHlZo6a5nFQXNF9Iali7ESV+z0rn5+VGmIqWx9LqzbvYwimBMkWMr6r7b7RGNs/KuvRDq/0j60ymdxBptXT9YyM+KjHUnvFja+1lv7QPpQ6PF8BHoHGsWNixBMoLeTK4iZIcwFhAyB3926dh/REm0HwIpRuyY66IJA+x6D7mokUnCooAImNY2SenPokW3WRRiz+1+FwwctIe8b7iMiI7Q53oyfvOLZVXxVqUK07+y7SieKtHbPNw0p3MTHGgmwdgB4mwD+kEQlm9a9zOJVuWyaiASbJj/vM9aCFJJcXOvo4Hl496Wh1qWAukuob6/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0aGiGo+32k6wsmFxr99IPfwNwct0qRSptVL8CoSKkfQ=;
 b=g4Vq8XsK+N3pOuD8yDZy+RbgGUCAP6EePlXYk73UZ1yxzIcVlAtHN9nzRDTWifREWBDpIWKeWJ/eCjnzH+rXKjI/AltgRubY+794/zV6W4S/mPbZ6Jcl44QF9YADyArTqrYnwr0mKoxMZD3HxejsGWeYnzthrzmA4BDlz4nZqPuawSib/6AAkBJupFIQnKoX17cbylXGQSTaXYaPX2Ig8vMbc1/S7+dcxEXTbOXSTOexlo747d7BsQ3aiERBvnx/4DimH4UzGUeWo1s9Rs1P90+cGn4yEN0Tmj9BAFo9BIqcwEEDVxOwdWqo/Nt/Y0AGAt2M6L0RPaEYrZwaTNpYmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by DM4PR11MB6384.namprd11.prod.outlook.com (2603:10b6:8:8a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 11:58:39 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%5]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 11:58:32 +0000
Message-ID: <6657d726-9916-4d90-a6f7-8675715faf5c@intel.com>
Date: Tue, 1 Sep 2026 13:58:28 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/10] ALSA: hda: ext: Clean up links if their
 initialization fails
To: Takashi Iwai <tiwai@suse.de>
CC: <broonie@kernel.org>, <tiwai@suse.com>, <perex@perex.cz>,
	<amade@asmblr.net>, <linux-sound@vger.kernel.org>
References: <20260831164233.1487766-1-cezary.rojewski@intel.com>
 <20260831164233.1487766-2-cezary.rojewski@intel.com>
 <87tso9ciaj.wl-tiwai@suse.de>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <87tso9ciaj.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P189CA0022.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5db::6) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|DM4PR11MB6384:EE_
X-MS-Office365-Filtering-Correlation-Id: 4de3569e-a3d3-4dd2-7078-08df0820588b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|6133799003|18002099003|56012099006|22082099003|10067099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: DGA973+5Jjx25F/yRKiy6ud4kNEPfTzGvwEvkpfNv+drCAyk5jk7FlOTDtm51BylVfKOWexw/UupHXropvT/51d+KDe6o7LZxVSM7UcBX2jlVLw55qMSgijk3k11iN8aoQ8PfbMz5Ri0YiG+1MdejLnI8C5GY0IxvlesW0AWLUFEa/9wxAMjoi4u8bYFfqcQrgLUWuUS00pd+5PYa7xrErinJTZiPyAgwyx1USi87GvgNr25USv0rNdQ1v12iVmRBSRYtg9E2Iu+2iS/zvtNFtM7IuVAT8mmXRarvWAZ6VXoipwuFtFWsn9IAG/XV/QuZV4lhDCJTZUR1QNKgOKWvsXabP/NS7AMvCQeBrIPLAor7j7bjdVPuiW7O8yXo1n73FIMBN24UX+5aRg2hvqTEbpZMUlkeFamrJGmdrWMB/qk5m8pmrcQ58vJY/AOp7j6nBMTOCWak0yfmnnuoiZHT0aIXJptGn+tRg/ESu7v2NMqWvoNA12/LfqcSzULJhRm2FiAwz+xGfY/Sd2kUxpCUbD7kakeTKCexT8/6Q0RoJNE9iFmxsgPGm/0JsSr11wFaKcpBxSymPLmZTi5yaAOajJkYlCInE0JIvZHEAqdSXRxY3ZY9C4wcG9YGSgiVhd+0Z4x98tRbS0x7HUt5g+QD+KlXLgWXP7Hp5gaQHIdpho=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(6133799003)(18002099003)(56012099006)(22082099003)(10067099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWRXVGVtWGQrMVZ2Wnk3MndORHE2cXN0OXMvbVhMMmZ5MUVpY1Bja0w3a3ha?=
 =?utf-8?B?bXdNSVQ1VzkwT0V5bU43QUxZNlNOb1NVSW82Z3p0cWdYTzZ0cFViSnVKWk9Q?=
 =?utf-8?B?U3JxWndFM01JendjbzFhVzF0TDAwVVVLZ1RzYkJCTXE0eFdCTEc4cWZLQnlK?=
 =?utf-8?B?bzhkLzZwNHEybGs4dG1ta1VISllleS83eWNMM2hSME56K0NVbnZHaHU5WCtM?=
 =?utf-8?B?ZytPWmU4SG5LdWRXaHorYkxnUkROdFlrQi95U1ZyRmFoVm9GeUVKNkwvTjhR?=
 =?utf-8?B?WitjZVd3OTVSc0V6Wk1EM1U4M3ZIYTg2NHR4elZSVitQc3ByZlJqU3FmVUVz?=
 =?utf-8?B?WC9STWpGTHBKb1g5cXJvRjNVQVN0SXBoNGpJUlQ5by9NSkpqQnhZelVwaTI4?=
 =?utf-8?B?L1U5SFdNTjVKK1pFVytMeVdqWkp1SkEvSzFmMWJPZjhBTCtSTEJMN2VLRzc2?=
 =?utf-8?B?YXBYVEcvVjlNcmxUQlJ3eXZRTUtZaDhvbWMzcVVYZ1N1SkN4eXB1MnN5UDVG?=
 =?utf-8?B?NnhPNUlCWThWSUFnbE9DT0pVTFB5dWp3NkoxaEhDUU9MbHJSdFU3QStqMUlK?=
 =?utf-8?B?b204anc3SjdpV2tWRStwbXh4dEU3ZmFYZHFjVkM1SXNId25MOW1veFhrU3Iv?=
 =?utf-8?B?WmdKSlhxNEhnaStrR1NhSUMwZTRERlovdUpFV1JjbWVaUmtJcklMTm8wakRq?=
 =?utf-8?B?U3N1dHgvTktQSytXZlR6UnFzMVdpeG4vbWkxM2p6U1hLMlg0UENpa2VRRC8z?=
 =?utf-8?B?TWIzb2VPWEV1cDFGVlZkNHhGa3ZMSUFHcThMZXphYzl2VmJ4T0d1YUFtZ01J?=
 =?utf-8?B?K05sRkJiU2NrUmpURHVNaWZncGg2VllJdzAxbW41U0RjM0Nvak1BNHdxQXlv?=
 =?utf-8?B?dEJjbWtETy9tblZMYXgwOExTQ3RER0Y0RDIxK1NOTS84R0IySkljd0hCWFpF?=
 =?utf-8?B?N21zZHhTaUgxdG1mbnNVRzcvNCt6RXluREMwYjF1cGZBUk12bGc3L09TdDky?=
 =?utf-8?B?clpPdStNbXFLSDZyci9tQW5tVHR5dkZrUnpZUUhjYlVOZy9PQkN2K3hqVjRH?=
 =?utf-8?B?elIwZ2YwY0FYZmlvOHNXUHBjOUZCSXQvUzZWYUhWWUlhandUamQwcWw1RFF5?=
 =?utf-8?B?Z1UvZE1xMTVBME5ueDNLcE5XV0VoUW9zTTVYZTRPQ21sR3VDa1N1bEZHM0R5?=
 =?utf-8?B?ZlQyOTYyRkx0L0Q1S1hraExHdUVXSm92bXJDN2ZIMFNGRmx3MFhibDFkN1dD?=
 =?utf-8?B?QmdnRDc0YnZYejFqOHJaZmZzVVgxcVJmNlRWQzhBT2ljMnFPcXByckNmRUZU?=
 =?utf-8?B?Y2lrSnlkYWt2M0xRVE40eWlyTzZZL1h4OHRNWGw0Uks5c0N3N0RudlZuUnp3?=
 =?utf-8?B?TlJQWUxLd2NJdDlFNkpGUGJxYWp2NWxXZjhyZ2prbWVSaHdVRFloK015SkNn?=
 =?utf-8?B?YXNJL0YzNEp4b1VpTStXVDRRaDAwOERjU1Y4d2doSDlGL3l3UjlRcG1sT0N2?=
 =?utf-8?B?anNEOGxQbFNTWE1NdzlrdnVnemxGSUNOOTNwbFZ1T3VtbFJKa0dOR3BPcytr?=
 =?utf-8?B?MVdkSnVlT1hzTzR5NTh3RHBHTUN4SnZmU0lZSVhuQ3VPbnhUOVk4eGkreTZV?=
 =?utf-8?B?eUVYMjNtTlM3OG1Xak1QQ05xV01MU1RERkNueUJZVElZN2RQd29lTURxY3hI?=
 =?utf-8?B?YjZEMHhibW1hVXBVTDFuMHBNZUNHSkVxMEQ2SnpxRm1HcTc4MVE0elkyYm1v?=
 =?utf-8?B?aGtFaThaK3dhK0M5Wjh0TXNxbzFucEVjS0JrOVFwUUduamY2MmdoT3R0cWNo?=
 =?utf-8?B?cnlRbmdRbVQwMEhNMFNBeS9Ebkg1ZGFOODVIbDI4RGVUamNwTTFEeWpGNkE2?=
 =?utf-8?B?d3VCNStCdW8xc1ROM3dUVkJyRzUwYzNQSW9keGZ2SEcxU044aHVOVTgwVVVj?=
 =?utf-8?B?YXVaNzROeEd0RDdQL09tM050NlUxNjE1S2tRSmVlT2svcU0vTXdHUzNaVWpE?=
 =?utf-8?B?b01VT3ZnTi9PSUZGc1dWWXhHWXhUMEZOazlNNGpVY0JDNEtSSncwMEU4aUVV?=
 =?utf-8?B?YjAyeUxsb2Q3WEpXRmdQMUlPdFp2cnVIQlFka0lGOFozN1JRT3dHOE5DNGNF?=
 =?utf-8?B?cjA0QmhWZTYySTRNVmNkZWtWVzBCQ3VHMHVHY1djc2xBZjN2ZTBLVmpXY2lO?=
 =?utf-8?B?ZCtqbTVRVy9aSW1icVpaZTFqVnRaUFc4YzU3QUlaekhXcnhkQk95ek5RL0pX?=
 =?utf-8?B?ODRsL1FWQi93enZqL3MrWUgzTUduYXRSTE9hMmZhZG9HMjMyQjh0ZFBNYTZi?=
 =?utf-8?B?cUdMS0l6aVhUSzQ2bjJLMHRzNzc3M0VLYXIwajMzVUprR1FaTy9CdlNacVg1?=
 =?utf-8?Q?XmeDi5bBsNe9KVig=3D?=
X-Exchange-RoutingPolicyChecked: F1LxXkmCmQapio390GpzT2srLp0ioTVceXT3w70OTuJPsRTI0cOwm6ye3VxIRyqB3SD0ahnbZeNfPwcdRrZ+0zZJz49zaN9an1RoxXbadfp1YX1NLGn/3y48rvtR9j/Xve10NCMCjsmlRXhLyivUVmORkGF0wErecPNGTAmxlHunfirR1CZ0EBh5nXtsySYuVjL6c2bjs9OIiwhEJWOpaoqgwJ+3dZ/SIZtFSvcvqIOpkJAAWISA3USSMT9N7YSmy7KSHIeMrjcXcKYH6yAW9p9cswKm0mPb+y9PdNsmW7PBxdQF5jIlP+aQ65nMxoD+464logW1CLNGGB8G+J/vQQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4de3569e-a3d3-4dd2-7078-08df0820588b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 11:58:32.8539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T0cGPEjy0+lLxG0J896sHC9dWIFP5FrvXvKSw4MB8BrDPM9Onf73A6EI2T8hVoEOmdvRy9RDbivxrgHvJzuoSwMpRkWa1iipdHiUjVs6IbY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6384
X-OriginatorOrg: intel.com

On 9/1/2026 1:39 PM, Takashi Iwai wrote:
> On Mon, 31 Aug 2026 18:42:24 +0200,
> Cezary Rojewski wrote:
>>
>> snd_hdac_ext_bus_get_ml_capabilities() allocates the hlink nodes
>> one-by-one but the procedure may fails due to -ENOMEM in the middle of
>> it. Clean up the list before returning the error code to simply the
>> function usage.
>>
>> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
>> ---
>>  sound/hda/core/ext/controller.c | 11 +++++++++--
>>  1 file changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/sound/hda/core/ext/controller.c b/sound/hda/core/ext/controller.c
>> index b1f1eff1d181..f75d3dcc6cb2 100644
>> --- a/sound/hda/core/ext/controller.c
>> +++ b/sound/hda/core/ext/controller.c
>> @@ -81,7 +81,7 @@ int snd_hdac_ext_bus_get_ml_capabilities(struct hdac_bus *bus)
>>  {
>>  	int idx;
>>  	u32 link_count;
>> -	struct hdac_ext_link *hlink;
>> +	struct hdac_ext_link *hlink, *save;
>>  	u32 leptr;
>>  
>>  	link_count = readl(bus->mlcap + AZX_REG_ML_MLCD) + 1;
>> @@ -91,7 +91,7 @@ int snd_hdac_ext_bus_get_ml_capabilities(struct hdac_bus *bus)
>>  	for (idx = 0; idx < link_count; idx++) {
>>  		hlink = kzalloc_obj(*hlink);
>>  		if (!hlink)
>> -			return -ENOMEM;
>> +			goto err_nomem;
>>  		hlink->index = idx;
>>  		hlink->bus = bus;
>>  		hlink->ml_addr = bus->mlcap + AZX_ML_BASE +
>> @@ -112,6 +112,13 @@ int snd_hdac_ext_bus_get_ml_capabilities(struct hdac_bus *bus)
>>  	}
>>  
>>  	return 0;
>> +
>> +err_nomem:
>> +	list_for_each_entry_safe(hlink, save, &bus->hlink_list, list) {
>> +		list_del(&hlink->list);
>> +		kfree(hlink);
>> +	}
> 
> You can simply call snd_hdac_ext_link_free_all() instead?
I could but then I'm tied to a teardown function which may become "catch
them all" in the future.  That's why I tend to avoid using teardown
equivalents directly within the startup functions.

However, it's not something I'm going to hang the review on so no
problem moving to snd_hdac_ext_link_free_all() in v4.


Kind regards,
Czarek
