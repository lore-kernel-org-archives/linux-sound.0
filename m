Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D193921CE;
	Tue, 23 Jun 2026 19:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782244511; cv=fail; b=n7dn9H9r788k8P8F4n+2mEdwa/B62Q9DUxdjbFKNH7dONIwi3J9tLleFcgqNPlnPold8G+czg/MC5gKLNxhOxUcUUJqa7uNVw2w5RTa8hrt37WK9t1VvYaJeL6yu5egDSJJgoHMcz6yyzumrsFGltyt19uZROQcRQ+/NSeLhtDY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782244511; c=relaxed/simple;
	bh=cPze/eB/6PiLsYctWdaSkcBnjp+rlECunmGgLPI8A1c=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HXnCnvy7v83HuVAwUoQq/921oWzo/9rQn8AKDo+XmuzjASOsDJqdt/EMMBDD6SZW1G0OeKWf7cIjg40n3hrjeV3jJ2XcTBdpRFpokCUG4cDg656q8hKwil6yWQKHZTAnGc39vZroR+MZ5uOe7XzXi3AERaUpG3gTepNx+SpG9Gc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=et7SqRmD; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="et7SqRmD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782244510; x=1813780510;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=cPze/eB/6PiLsYctWdaSkcBnjp+rlECunmGgLPI8A1c=;
  b=et7SqRmD5X30PjnOdsi+f7yEz9tfx6FoOOOQOA5zE2w5KisrsnoKCV9g
   mimSx2oP+1hdUYxU+SPs72rz8zGpv5l2SAXm/9XoZ8egAEeDZYlrds5JQ
   ab8J2+9xM60ZCgaCQol6BlOz0Kh3XGFE/a2A7gcajyE9AcSKwvvmXO8vY
   QZIVh4s/uSTgC0OJjxFHi6XR4C1zc3xSDazvyuEpLjd6MjoHVTnewB1rA
   5n6qclS7OYxE2b3KyNzurnL7wuayphAHoL42N6IE1RURYjDSwdWfvqRgw
   22YNEqd8TG0r0g2V4Lm7IuLtlFxGHsm57W5NRlTe5NRHG4nRk6gy6SD2U
   A==;
X-CSE-ConnectionGUID: UWLmggFxR3qcyW8/INSdrQ==
X-CSE-MsgGUID: ihAvjo8lRgaRKfHGz+u3nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="94491926"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="94491926"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 12:55:09 -0700
X-CSE-ConnectionGUID: oGMIUE+RRkiSAiM7wfnEkQ==
X-CSE-MsgGUID: Nb7HwvnjT3iQzTpRyCGixw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="249639650"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 12:55:09 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 23 Jun 2026 12:55:08 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 23 Jun 2026 12:55:08 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.42) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 23 Jun 2026 12:55:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Td3QGY1HORUXFkMjhmlU5JVfq5dNooUt4eL/5yQ6jaSQQXql4a7ygl+XMwkFoTfrueErgQGes4Vuev39clVnnMp68BQdUSreLR/qH9RlGcuyJ1ExgvYlZ04a4vE/c7qo5egNdI3zy6UYDVqt2ffdPppZ3mlp6ahzFZmc3GxI+j9r3qdaNmXBPSnUSpNg12L+2cQ1sy1aNqV1udPl8xa1az7xH0ts3IESeibMIbWo36EH3ekpI/3J9GzbKIQ6vwTMtKEdd8DtZZcxlg42hu3eLB9bDE4IkxBreTfSP4bj+FZNAoEfbAsTH+a7IC3lfolBYlCMFjKjVqRBnmirrmK/+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+lQS6/lR7P2jFhObj5LXfTcoZ4EDKnAuArXdeLcUXLg=;
 b=JvDA/DT6deegeB2Rz5sGBxki0xWC9XHdb/z+XsWUA6/pDaVplfp3WhulIDv9Qp4Ejp51mPjA8+D3VBPauRap93Oc+epttYlY8HPXGh60UBQ4bc8wXqTfM8ai2gABeh6kyhEjOvARWGRZpjBvvwdWooWzP5nzHq227hle6BQmDXoHQcEPwOPAB45kbGMJxj4+OePTVtv6Gef7p9jBkaEhpqjW0IgdkPn+2f96yQDyO02cBfKwT1ifRPCWiI/w0HtgzPYCM+V9gDo4BQbS5qqwbFG32S4SDU+qIxEBIXSMT12DWkQ6ydFZ3Q5JCy9NiFkQQ5ZW75i/8oHFC50VJ3SJyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by MN2PR11MB4758.namprd11.prod.outlook.com (2603:10b6:208:260::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Tue, 23 Jun
 2026 19:55:06 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%4]) with mapi id 15.21.0139.018; Tue, 23 Jun 2026
 19:55:06 +0000
Message-ID: <9b332fe4-ed5b-4e29-b607-2850a0789929@intel.com>
Date: Tue, 23 Jun 2026 21:55:00 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] ASoC: Intel: Convert locking to
 guard()/scoped_guard()
To: <phucduc.bui@gmail.com>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Peter
 Ujfalusi" <peter.ujfalusi@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>, "Liam
 Girdwood" <liam.r.girdwood@linux.intel.com>
References: <20260623105721.25865-1-phucduc.bui@gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260623105721.25865-1-phucduc.bui@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0288.eurprd07.prod.outlook.com
 (2603:10a6:800:130::16) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|MN2PR11MB4758:EE_
X-MS-Office365-Filtering-Correlation-Id: ce5231fc-7707-42c1-031e-08ded1615257
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: bL8mYsn8lLU8DvN9GHNPI+ltDcIBDLbOCqUKDcRAskXIQ4a+72Rku25tF/qv2YOIhWvMxkgIbDP5tRZKklgQLJaF2QAJROQ6OEH42aldttzh4u6OWbEX5rRzy+IpBPodit7jmIT21MdVoRw7CGNZK5oKNQIz8SBPH3LOrI7mnz5yxOHkovWOlUYdtHAMkn/hrNre/26DIJdiV73mic6rD4c3e7dDXGNGtYWh0b8EJX+lF4jA9KOUsi9cWUkX3UTMXid3Z/It6fhORsa3eJVHyTamwlbggPZS2fGi8PZvWMKWGCte7jux1uzySZWcdFE2czE3rNUBtVnbbo6PJvl1/45/Z0/KHnsnaU2zi5/Rl7/kmsYENyd5YdzU2JP3NHfrWx9rkT41v6PAbSsvRORwXFQzwe6Gyo5hCFtxBSLAlP3bhU40ihFWY4QyV5xJskBHhP0DirTAhkU2Pu3QoOgA+U1zxXLIUnhDRYQIX8DunWfKPhKAEif2qSnOtx66/KWVw4lN6097bL7HpIUXZklc5Kmebh5DiFaCy9Rbs3e3eiRr1pcGE4d7M40nUqNE0rzWyIrP+w9gQQ+ZvTuDWUUSWhd9Rmq0J/fVp2rnA2NwctjRioBQl7DwoPqoZ0Nt4JWOUXhded+Ka2uXZ/Y82xTYvPBfVfRMEXCpMz4Z18L9J60=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3RkUlN1QjlTYlRxNTdsVW5XUE1jTmpxcUFhaW5qWEhrS2dHVE5jQk41WmpD?=
 =?utf-8?B?TkNCRWswQW42WndBNW5vZm14eWhKV004eUhDeWRudElGeEk5d0xZejZSLzhN?=
 =?utf-8?B?aTJURjBINGlacFJXT3JVZ0MxZkpsck9kVFVtVmdLaE1sU3FoSytIT1cyQS80?=
 =?utf-8?B?NEUzV1FZWEoxeXRDc2tTbURhZXpjdDExaW8rei9IVmx6ZmY5Qy94VkFOdzEv?=
 =?utf-8?B?VzFzOU81UlkzbWREQm5NdjRTRENNSkZBTnZ1K0VmS2hGU3JnUEQzZEpSZlZ1?=
 =?utf-8?B?dEJVbU9kMXVBRCtqdmJLKzlYb3NkYk5OKy91OXNUWnpsb25wdGhiMk8zZkJZ?=
 =?utf-8?B?QUl1SkUyM2JBc21zd1JTQjhDcGx1Nm9YYk4wbVQ5WnNRYStHYlAvT2VwNDRk?=
 =?utf-8?B?d3ZSemw0SFJFRnNoRlRyWE5wUnM5dUIvbk1Tc05qNkY1SzBKSjNvbnVkR3U0?=
 =?utf-8?B?eEJRTzdDSHNVNytESzZUMm91Q1JUMmwxRmp6WHlPSFZnVXhZbVJJcVRFb2N6?=
 =?utf-8?B?bzhKalp0M0swZmtoVTRNNnVlNWlkQjR6Z2dNKzJBNkpFd0R3TEhjVDN0d2hV?=
 =?utf-8?B?dE00NytzSzFBTHlYSWQzNWZ6bjZKSm4vcDlmb3VFTXd0b3g4TnVocytNY2s5?=
 =?utf-8?B?RDJ5aWdmbTZmRHBVbVdoTFZtY1oxeWE1SkNoSkd4NXVqMXJodnhCRnBFZWVy?=
 =?utf-8?B?YXVuSDMzZzUvekNIM25Hc0poWSsxd0ZjV3hmMHBPeFhDU0c4ZkJtM2cxcVlq?=
 =?utf-8?B?RjBnS1Iya0xwMC9KSkZJai9pVlJkaGIyQ056VGJZeTd3WEpkblFTODN3ZWNP?=
 =?utf-8?B?RS96bitJaEkvNjdXWWxSbVNwSEZqY3A3eHBJV1JvdlZORHVHYThxamQrQXdF?=
 =?utf-8?B?MXMrTmtYUDdUOG9nUFJtMU5xMnhDNWxMTGRSMmFZdnh6ZTRCYmZlc1BGcStO?=
 =?utf-8?B?SzVZR2VEZG0vMHFiNU5QTXEySVBKcDZBaXF2amptSVNmamlycjErdXBDaEd2?=
 =?utf-8?B?dzc0T0NQU2lTK0M2Ly9UT1lxQ0JNR3lxekZZVEU0WFJpbHkxUzhXaDdzaGRM?=
 =?utf-8?B?c1JNRGFnR3JieDY4YTBxOVVpeG5zL00zcDlRaEg5ZjJCSkNFWWkzdjJQSUFP?=
 =?utf-8?B?d2p0amJlVWN6TnJEdmxpdnhSNXROQ3ExRXBoK1RmZTdLd01OSWdNdEprTXVs?=
 =?utf-8?B?aGxHenNqa3F6VUIyalp3MnN1aERXdks3SHdoS2V5VGRtSTFSVVZxM2g4OXpF?=
 =?utf-8?B?SmFEVk1KbVFMUkVCTURuVlBJYmZ3a3FuYlFvSC9QWGQvOS94NjlUOFEwOGRW?=
 =?utf-8?B?S2d0bWI4ODV6Nzc1THAwditQZ3VpdGhxVXc5SUVFSWJFdUhydXlmYzFmQ2FB?=
 =?utf-8?B?KytpWE14MlJUYmNlcFNvb1NjbW9rU3pTMDhOT1FTbkFQQmhRaXhPU0RwVEN1?=
 =?utf-8?B?eHBHdjZyQldDdWJ0WGQrcW9zRVdzYmZkUE5ZK3VNeUE0ckpxa1E1WUg5blo2?=
 =?utf-8?B?Y094ZW1rSVZjdnk3cUxSQjlmWTBTTUdodTRYMHlKVjBpL3RIRTJBeEJnQzZM?=
 =?utf-8?B?NWZVbGJBN1N1SVJsKzdVcXpjTGFRMGdLZDNPbTlaYk1rMVRyL2ZVK3BsR1Jt?=
 =?utf-8?B?UXd6aFBkaGU5dFlRV3pzc2dyY1pocUtSZDN1M0RxSkUrelZRcG16REJkT25u?=
 =?utf-8?B?ZEFJNnhXUk5jSlp4MWRSY2oySjRIMHJkUW5TZXQ5RTNRRlNaMnhIbGQ2YmVJ?=
 =?utf-8?B?V2pGQWhWSGF1bnNjTTVHemd5cytndlVHemRmcU1GNFZoL21vN0tLSVMyV2ow?=
 =?utf-8?B?ZW9QZnY1U2h3cnNYWE5Zb2V5T3VmUy9VNlJ2VDY2TWY3SnNrbjd5TzF2L29r?=
 =?utf-8?B?WTBsRlVoZ2ZnSmpTS0xXRjRvbW1BKytIcHpBOHgzMm5zUjNvK1NzRGJkMGVv?=
 =?utf-8?B?eFRaeW1MR1h3bVZ0UjdBdmZKOUtuZXN2b05kSXVkejBjamJjeVI1dEUwQ25I?=
 =?utf-8?B?WFNvUnRuUkJ5M0ZlanpET1J5RTc2VkNtSHNIaFlDNUVTU0dWbzdEaFBoalJW?=
 =?utf-8?B?aVpRd2tLTXJqK0xPUGZsc29CcjFzOFdtOWhOR0Y4UkM2SktkcFlQeDhEcWhS?=
 =?utf-8?B?bWs2Q2RoMEI2MTROWjRMYmdoaWxibWJQQWZUdVZmM1UvVEFzaWZTUzNJd1BN?=
 =?utf-8?B?Z2hNOERlRGtaVjhFMVRzTHdWeXlOZ0xMTysyN2VjaXpYZmtLZ3hlYTVNbzdJ?=
 =?utf-8?B?SGFUck1ycWRqd1JNQ1h4K2JMS0pCZmxycFdFMzRreG5QY0hhbGhBYXRNSlVl?=
 =?utf-8?B?UkpXTEVQeVN2LzlOenp2eEk4Z1ZONEpqS2JHVSt1ZzUvbWYxc1k2Zz09?=
X-Exchange-RoutingPolicyChecked: Ikp3Vb7o+HITUhfYTwlBhj8gpnfk3wRvZuE+cyZeZv8uvM74ml7tJrt3+NctjvxCJM/ASXNHMU14mJl5C5aT6W750T50LtQHcCHRrEHO5Ucvw9JjDmHplZbfRz9LSIGVp1YZtsePKkIDoCMcTQegHqAUdLbDnaboD1J0S5q6+vKVnw0JMQaHd865SiF2GV+fAfuc4j+eWsHuDPhAh5GJhBj2ibZLCxVkftzicvHfZ1oIa2IAWgQaON1puRxpk4dsgK+00IWcN53J6416ByYdkJSksXVNm6rewYAAu8qqqbIk2ao3OSjOXgxF/3Yzjo5eXDxRhTV9cfrCjiCVlvARLA==
X-MS-Exchange-CrossTenant-Network-Message-Id: ce5231fc-7707-42c1-031e-08ded1615257
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 19:55:06.0192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F3TMZyrTZdDvCZ+uii41FTotslZ3qrCHBCpTPt7Og4wGgRDWfszbvs590h48Bu6i2eQ4l3hZx7uIjjQ1zGuWD6G8AMfHrv951Ei+3u6qa0E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4758
X-OriginatorOrg: intel.com

On 6/23/2026 12:57 PM, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> This series converts mutex and spinlock handling in Intel ASoC drivers
> to use guard()/scoped_guard() helpers.
> 
> Most changes are straightforward conversions intended to simplify lock
> handling and cleanup paths, with no intended functional changes.
> 
> The series has been compile-tested only.

...

> bui duc phuc (5):
>    ASoC: intel: sst-mfld-platform-pcm: Use __free(kfree) for stream
>      pointer
>    ASoC: Intel: avs: Use guard() for locking
>    ASoC: Intel: avs: Use scoped_guard() for scoped locking
>    ASoC: Intel: atom: Use scoped_guard() for scoped locking
>    ASoC: Intel: atom: Use guard() for locking

The order is off just by looking at it.  On top of what I mentioned in 
1/5, please fix the ordering so that both avs and atom drivers receive 
updates in the same manner.

TLDR:

1. ASoC: Intel: avs: Use guard() for locking
2. ASoC: Intel: avs: Use scoped_guard() for scoped locking
3. ASoC: Intel: atom: Use guard() for locking
4. ASoC: Intel: atom: Use scoped_guard() for scoped locking
5. ASoC: Intel: atom: Use __free(kfree) for stream pointer

Kind regards,
Czarek
