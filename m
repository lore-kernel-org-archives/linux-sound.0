Received: from SY5PR01CU010.outbound.protection.outlook.com (mail-australiaeastazolkn19012011.outbound.protection.outlook.com [52.103.72.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8822628C014;
	Mon,  8 Dec 2025 12:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.72.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765195836; cv=fail; b=trfD+8eEAiUzEb1oNyTYMejvifojWGVgAzVsKv3zyTmMwDQxkkXTwto90M1ND0ysyNUghAorrqLhponzGROTBdYgPVQcOxVq4ni/kO1xW2JHYzcCOOBnTl1TEw2sEW4wMsY0hrrggIOrgxji52sFn9Xe4aaYrgfhY7ndzG0Zk6M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765195836; c=relaxed/simple;
	bh=Onx7Yid2PrHMJtuPJgbo4OkD+idzgCTkTETJNcUgezs=;
	h=From:Date:Subject:Content-Type:Message-ID:To:Cc:MIME-Version; b=anH1SIxvhkf9oIcVOFCd+7lUcHA5VKPNl3rbQGCC356P6iKvL7BAJ1BB0uxFYTouHYWj58gJurol3THApDrpb0v4y5Ur48hF/9otQO+jlMJT+DfQjwN9Rau6+mzV6+qvzoqEN9ZFJDWNXKXZ8c4RdMjdsIc9FEZGvz5YrkvJ698=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=IGuGEv0Q; arc=fail smtp.client-ip=52.103.72.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="IGuGEv0Q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=syeoQ6WXgfmMELpTHNw/yxXe/PNiqvxIei7WJOpYn+ryF52ehq4z8Nx7sArWobKMSdLnqQlUU/AlXxmGzDJHhhPZzOcG3TmfbMGe4lag8Vf9AnqsZGTpK5GTCikt8EuS6DPv/n/hyBs/udTlJOlSmH77scHuhcOHxqeaJ72WuF9nacvHuZq3Su2BxqBewHwZiv4xd7C3cRV7X6mr4fDFnQPKX1+ZRBz5HKYW53yQtHPivNfih9ZAmjy4mT5JRqaagHBQ3WJdRFH4b+wp9DhQHxN0p48xOfeuHPRzFnYML0pPRsVXI8jyrmOqI6yZeIM/T8zXGAP+WxhrIRY8V8gFAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uhW/BbdUsXQiznffF+lvj8WecJVK1hXVSjioWXkTnuw=;
 b=I8mk3YrL+p4lE7Ry/HYA1FwHHCWFLKLRvBtyOQIFTCYqbGilDn0E5kZqdiCtRGWDddD8T78Kis4tVhc++QdznhXgf1yB8DyhRgrMugZNmD4XXi6lI+WGkyxZPqGpSZw31bAatR9fx36tyUTkCCcbsiRRrcFd+VJ59cSO8YGFS1EnAPBM7RswzMdXqEJZFTap6kOFOda0ZX8w3dHoZ5H1oifJNtDlmLfxY7rjvDP/+MggugPBauwaR7DW8KtE4Tj3+uj+lfW7MfzaVjegI5viRI2vjUw+qLNrTwWDPTuEJlSbEZndwV6UMcTcg9oQ0eKJ1papR5qWrVG9aa+2AnXlwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uhW/BbdUsXQiznffF+lvj8WecJVK1hXVSjioWXkTnuw=;
 b=IGuGEv0QzMlOY2bhjaSfNFWc2XfaL/4EUAukRmnGqhfuH8SMnKs76LiBIBtm22rQUvwM5Ou/kqQEhA7VQNcMRLmcyaYu0DH8IIC+lcTctG1gdQMaSIqAwiv/aN3AU6GObMp/ISNS/p+a6fOGqvdfinRJB9mkedn97Bk/hfcAFoL7PsPF5EHFpD68R9VNDgulqALqY+nIVPRXr2a+qttXBC7kTekUkN6GNjuokS/MJHX/45lVaK00q7BjqYtil2c56XEuRMfGyV+PqhjJ1qvJpYWW6zPjAp7jGZI+VnOuVW52AuTbDBMQeBXryJQn6Bfl2osQXBmwHKaMBP2iBIl2rw==
Received: from SYBPR01MB7881.ausprd01.prod.outlook.com (2603:10c6:10:1b0::5)
 by SY4PR01MB5641.ausprd01.prod.outlook.com (2603:10c6:10:1f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 12:10:29 +0000
Received: from SYBPR01MB7881.ausprd01.prod.outlook.com
 ([fe80::7cd2:d6e8:3fa0:5f0c]) by SYBPR01MB7881.ausprd01.prod.outlook.com
 ([fe80::7cd2:d6e8:3fa0:5f0c%3]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 12:10:29 +0000
From: Junrui Luo <moonafterrain@outlook.com>
Date: Mon, 08 Dec 2025 20:09:09 +0800
Subject: [PATCH v2] ALSA: firewire-motu: fix buffer overflow in hwdep read
 for DSP events
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID:
 <SYBPR01MB7881452C84016B3F21975947AFA2A@SYBPR01MB7881.ausprd01.prod.outlook.com>
X-B4-Tracking: v=1; b=H4sIAOS/NmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDI1NDIwML3bTMitRiXaMUQ8NkQyNDi0TTNCWg2oKiVLAEUGl0bG0tABE3lFh
 XAAAA
X-Change-ID: 20251208-fixes-2d11c1218a5f
To: Clemens Ladisch <clemens@ladisch.de>, 
 Takashi Sakamoto <o-takashi@sakamocchi.jp>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Yuhao Jiang <danisjiang@gmail.com>, 
 Junrui Luo <moonafterrain@outlook.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2342;
 i=moonafterrain@outlook.com; h=from:subject:message-id;
 bh=Onx7Yid2PrHMJtuPJgbo4OkD+idzgCTkTETJNcUgezs=;
 b=owGbwMvMwCVW+MIioLvvgwPjabUkhkyzA3rrb3XwSKmGHS6qdTTluPJqnr3E5riphZHP97oWG
 CbUij7sKGVhEONikBVTZDlecOmbhe8W3S0+W5Jh5rAygQxh4OIUgIksEWZk2BWS5Rjs4zjZXm4W
 x/W1nRZh1nIv78k9nC6x0alnE5/fDkaGySWhCrv+P619W+uivu5Bl4LSzNjZl6Mf/BQMyNJRfBz
 PCgA=
X-Developer-Key: i=moonafterrain@outlook.com; a=openpgp;
 fpr=C770D2F6384DB42DB44CB46371E838508B8EF040
X-ClientProxiedBy: BYAPR05CA0029.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::42) To SYBPR01MB7881.ausprd01.prod.outlook.com
 (2603:10c6:10:1b0::5)
X-Microsoft-Original-Message-ID:
 <20251208-fixes-v2-1-62a3f274c919@outlook.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SYBPR01MB7881:EE_|SY4PR01MB5641:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ffb274b-8563-4846-ab4a-08de3652c6e1
X-MS-Exchange-SLBlob-MailProps:
	P1EfU6pZOd8VPwDsmXmpSwyPl9aRR8R+hxAlJSNWmzL6MJamcEvn4Xi8wBsbtiDceccFzanxGaKBfIllcjLMHcPdysF4L+Av8wdYg8keIsr9qZTvoRgnfJ2vUczSxk+0OJCy5kh3JjeIKe9pU7hoRDyuEF97VHX4UOJkwIBnHku45Te2xZJApRuo5SSAZxCpqL316SmY9PN3R/zjXhWA4EWvnWqoz0wOSUKjslJndgqf9QUJzP70jiokACRWi8KTCv+hlOV14hLrs8RH5v0T4MyqvRRvix1YQGQyp6W2ohOpq79SXYT5OidmCSSCaOV4BUI98nwQbSbUneL6NW50hk0dIsQjHs8xhU/SxTwQBCOMFVpEWtih2gHKJy8Qc7pswmkvMhd7yjj9YIuOTxfx7sh8/eMOCBM4ZUTOkNHZjjaPyP4CT0Sq765ee9ljVa5QTwFJik3BglPXdO4Rb2tkE98i6KQrJvz08YLazEmuOlGJe6iS+cizDE3Ae9KoJzLAz+LO7fJ7B4XTh39ts8owDFYJdPdQAVP9t7SUcBKrzMNKpexLDMLY/J6THVuazXkPAl6HFyXU5xXNMeaBrQWIzqJ2/jrgqeoUKMsH4xOSlLt0ArWmmTXRzwzQ6y5Vy6+dZvXiCQ+cHOWz1/qLNj21B/HYY+EYtEj4EGP0La/a4xYyBxSGMMbBKD/5mCUbDBou+3/TQyWPrJ9UEdzdueWXRgWW3X6dj9bFAyWWVdf6OvHJpVrOj5BsN0XmDU/bA9uZyrmyx0pVNoIC5WcXrg44b1oznmfrbo/2DgbnhTxp3O4p7ZB3u5IH1Q==
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|12121999013|23021999003|15080799012|461199028|41001999006|8060799015|19110799012|5062599005|51005399006|5072599009|6090799003|1602099012|40105399003|3412199025|4302099013|440099028|10035399007|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VTkrM0l1eWdRcGx0VnI3THNTZlNIdVgxR1grbGpvVVBQTmxiQzdRU0VlNSts?=
 =?utf-8?B?b2t3STk3YUhFOEdRRXhRN0VXUUE0K2o5Uk1UWEErWWo1VFpya1k3MTMrYUcx?=
 =?utf-8?B?ckcrMUtwM2VlNjFqdGQyNlA4MGYyamNPNFVsTVBhY3ZpNHlZTWJQY3dVRFFt?=
 =?utf-8?B?YStLMzhKbklJYjhKbDhHRmVka3h4OHNiUVR2Rm1hMUViTlpzU3pKT2dsa1JR?=
 =?utf-8?B?Q2FHS0FmTVZKRkw1NG0wR01hdmRIUGRNei85ZEtvOHBKYnMvNHBrT3h4cDNU?=
 =?utf-8?B?NDI0STBpREltRWFpR0YrMi9jSGd5WnBoa1ZoSEl3TG9TWHB2NGlTUVZKU2dr?=
 =?utf-8?B?UEp5dDgwcHB4NlBZSWxhVDdXRXgzQTlVMFNSRGdXVjBneXVIR3JSN1FvUXN6?=
 =?utf-8?B?Mmx2NnA3Si9OTzg3TTVFMU9mUUxEZUhmTUNKazlaWW5GMktiK0ZLT01USkhy?=
 =?utf-8?B?SzA4OGxZUVVFTlN5bnRLdlExdEhJQmk1bm9JazQ1TXJzNnFFMG9GL0NLZGNo?=
 =?utf-8?B?VGpYbGlRZVMxQ1hlRWFUMTA4R3lUb2E3WFpYb2s5QmgwM0U1eFJ4NENrWWZt?=
 =?utf-8?B?YW5PSlBiKzVUK3dDOGRvTWJMSk5jZWROcEFsbWdQcVlRRXlLMEZza0g4VmNK?=
 =?utf-8?B?d1d1cUtpajZ0Vmh5WXNoa3hCYmdCYUhqRWV0K0xpL1RuR2VyTjRxL1JnaEN0?=
 =?utf-8?B?am9POWIrNU53YkFTM2QrTlJLdU9GRFU5eEtjMGMycFBvaHFoa2ZZUmhPdFR2?=
 =?utf-8?B?TVhwSlphb1lNOXFYdzdwTXl1UmV2NEF0MlFLendZb3dkRnk4SWxLTldtZmk5?=
 =?utf-8?B?bEtpUmdSaEdzOTZDRmZhazZiczZCU1dxaE43eHR2N0V5QWxOcDhueERCd1Uw?=
 =?utf-8?B?QjFvWHBvTUh0OFpqc2tzNm9rTzhwN0pZTTBsUllDY1NoQmY0YTBkRW1aUVVt?=
 =?utf-8?B?VXduY2V2QzhObFlESC8zMXJoL1o2TWVMOUlnOGdtNlNDNU9QMzRVdW1lazFo?=
 =?utf-8?B?WlY4RVdoMCs0MzdLU0hGWnNRWnlvRFZjQ0xZMHdYYU9QRVd6Wk50bW1xYXE0?=
 =?utf-8?B?VzVYdjNKRTVieEl1aUdBZ3d4YzR5dlpUZEFMcC9pWW5kTUNIL1dvbzEremZp?=
 =?utf-8?B?dFFnU2EycHNGYlBQanYvaUh0WjFkVmRBWXd4SzJqUnliYUdvZTU2bHBYbzJm?=
 =?utf-8?B?WVI5TWxIZUpNNVZFckprYzFETkRLaC95RDRMQUFpZFNoR04vT29kRm1PM1RW?=
 =?utf-8?B?N09Va2FaNDhlaVFBVjFYeDlxcHVlMzVxSkgyQnRjL2s2VG9PNzVrTDl5TEdk?=
 =?utf-8?B?WldvazhZaU9OOTU2N1RzVVlPTElYNm95NGhXanRzRHRiVmsvUkZZRXZ6d2ll?=
 =?utf-8?B?RnNxVVlHZHdIcldhelZIZUlxNCtLWndsUkJvcUdvVE5oZFRCTjFxVktYM2pi?=
 =?utf-8?B?TGI4WnFHTjRYWGhQUzVKcXp1NzVOOVdSOTVialRFN0V4UUZrQll2UGpsMnRK?=
 =?utf-8?B?c2s1NlYrSVVVWGtlS0xZMS81TitVelBYOVkrVGREaGs3bVhWSmdxbDFtcmV2?=
 =?utf-8?B?MDloNnFtcDM4ajAzaWtOUmtNaVVhQUc5MGQrYzlpb0pnUXVOQnVQSVc1YzE2?=
 =?utf-8?B?UC8rcDBuQWJyL0J3VkFPaXpheW8reEtQTnVaeEs5bU9zK3p3TFdVTkE2Umo4?=
 =?utf-8?B?UksvUVhMNVZGOVZiaHNMMHdoenk4a2tBLzBncEpCQTBpeWRZa053NTNnSkE0?=
 =?utf-8?B?VEJoNzQzVzN3aUdGNEtVc1hoUXJ1VGYycC9GeHpkcE9jU2NmT2JjNnhnZUpm?=
 =?utf-8?B?NGMyQVh2OFl0TWFtV2k5U3Rma2JHYktjZ2VFSEt1Vm5QVzRXSzMxd1pubm92?=
 =?utf-8?B?WUQzQnVrKzI2b0s4djJFTlV1QzFMeHAvNDlScnM4dlVxcFE9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UlZQYVBkNmdON0xNSU5JYjJJT2RJLzZOWFRscmdJbmYrdWIzbkFRdzltT3g5?=
 =?utf-8?B?UGpHREhwT2dJczN5TEtpVmN2K0VwYXRuUTljVkpKbTcyQ1hIRkh4emZiZFpG?=
 =?utf-8?B?UEpNZ0p2cVVZUzNlSHpic25NRGZqd256MkRzQ1UvTmdOOGhVWEZsOERUZTYy?=
 =?utf-8?B?amJ4NXJqS0hxV0RKamxCMk9QeVVFV002U21rN1B2anQ5R0Vxc1VVYVRKaW14?=
 =?utf-8?B?bVNWSXIrdCtBdktYNU1TTE44MTF2V0J1c2ZPSGxZOEp2emx5TUoxLy9wcERC?=
 =?utf-8?B?Zi93cWJGV2dtd0dSeWhIS3dLQ1lYcEhsY1BEWTRaTk52YXVXUEdSc3N3YUI1?=
 =?utf-8?B?eXFCZ2RPanI2QkZwelV3azY4cHlFUU5NNVplS1J4bjNJN3VsRDJwVWU0WSth?=
 =?utf-8?B?TGlHbnVpZXA3RkVhc3RhTWNFYTVFQUJXN01EeVlvdXhENmVjWnNzOC9QdzNq?=
 =?utf-8?B?TkZMN1lIc29hc3I4dUsrWkIvelBBOGJ2NUNWaWFLekJhSFN1blBER3pqUWlG?=
 =?utf-8?B?eXNOYUFxNVFWUkFWTVkzazkrOWg3Rk8wQnB0Wk9xdi9ublNHUkZPSXd0cnNC?=
 =?utf-8?B?djR4YjVueFlxNThsZmF6M1VPK0FtWWRucWE3QXdxazJQN3pUai96cEU0cjVp?=
 =?utf-8?B?YyttdnJ3a1hnYm1kTWRoSVN2S2d1VWlGSnFueHl2SE56NGNIaDBYZnZEUUVo?=
 =?utf-8?B?TjBkUzE0UFFWYW4vSmk2c2FYdnFIR0UrdTlQbDRRaC84Uk9lUzlHN0JkUSta?=
 =?utf-8?B?YXVCVitqQWlLalNwTVVscE9GWTk1Y1lJeFZUZWtnV0xubGd3cS84dnF0TWEz?=
 =?utf-8?B?NExhdTNGSGQrVklyNXdudmZsQjhESVNTbHRLSWtGVmVPOFlMTXN5ZjE5WWpY?=
 =?utf-8?B?eGx3YUtwaWVQc2ZMZmllcjA5UDh0b2RQK2xmcXZUMzVrcGNEbzc1SG9TaVFG?=
 =?utf-8?B?TmZzVTVnT0V4SXNEbFpBSi9BNnMvRzRzcFlwT3hFSU1hZHViQ0VuQXJmZ1R6?=
 =?utf-8?B?OWw0WXRjT3JGSnVKSWVwWllHY2pPNzZjU1ozMXd3c3JodkU0ZUZlM1MxT3lJ?=
 =?utf-8?B?TFVRS28vaGpub2lGb0pyRkFaVGlTY1ZnMGJ5cFJ6SnJ0UVkrSXVTK1BOTjA3?=
 =?utf-8?B?ZDI3SXQ4Ulpib1pkaVVaRW9wVHlWdE5lM2xjQUJHY0FzQWR2a1JrSElwU0RO?=
 =?utf-8?B?enB2Zi9xbXZybERyQTdFOTBCU28wTzJQV0hoOEM1a0gzRytGcnJiSnh4UVFx?=
 =?utf-8?B?ZWtjdHRRY1N3NEsxZ3VwK3l1eUlSd2Q3eFJTNmJJa2dUcGlCT0o1bmFxeVJv?=
 =?utf-8?B?aFE3MVN2YVRQcWNIWlFJNUMrd2h0VnhPcmVQeFlESGQ3RjZ4blNQUzBWZ1BX?=
 =?utf-8?B?NXhqb0hBY090SVV5QU9NRDQ5VEVtVHZlWTlrQ1BKejl1SXBFMkxBYjRSWUpt?=
 =?utf-8?B?clpqY2xiOWUrWHpicXBPL2RiTEkyWkE2RERZODVvZERvT3RpSFdiVEpjcWNJ?=
 =?utf-8?B?eTZMalNackVTaENlbUR0bllPUmNaQ2Vkam1VWkFXcXRENnFzZWZlQW92bFhE?=
 =?utf-8?B?OWxJalQ3SnNPT3dVb3hFQkU4NnBmNWR0Nmc2WkFvSGkrQmVlanhJckJzZzZD?=
 =?utf-8?B?MVhoTVpUNHpVUkdWY1VoZ3l0eHoyeno4REI1RmxrTWw0bG1HMHFHWVc5OXJ4?=
 =?utf-8?Q?6mdofk5BT/rB/RzLqvhm?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ffb274b-8563-4846-ab4a-08de3652c6e1
X-MS-Exchange-CrossTenant-AuthSource: SYBPR01MB7881.ausprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 12:10:28.8782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY4PR01MB5641

The DSP event handling code in hwdep_read() could write more bytes to
the user buffer than requested, when a user provides a buffer smaller
than the event header size (8 bytes).

In the put_user() loop that copies event data, when the user buffer
size is not aligned to 4 bytes, it could overwrite beyond the buffer
boundary.

Fix by:
- using min_t() to clamp the copy size
- Adding a bounds check before put_user()

This ensures we never write more than the user requested.

Fixes: 634ec0b2906e ("ALSA: firewire-motu: notify event for parameter change in register DSP model")
Signed-off-by: Junrui Luo <moonafterrain@outlook.com>
---
Changes in v2:
- Also fix the similar issue in the put_user() loop suggested by Takashi Iwai
- Link to v1: https://lore.kernel.org/all/SYBPR01MB78810656377E79E58350D951AFD9A@SYBPR01MB7881.ausprd01.prod.outlook.com/T/#u
---
 sound/firewire/motu/motu-hwdep.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/firewire/motu/motu-hwdep.c b/sound/firewire/motu/motu-hwdep.c
index 981c19430cb0..89dc436a0652 100644
--- a/sound/firewire/motu/motu-hwdep.c
+++ b/sound/firewire/motu/motu-hwdep.c
@@ -75,7 +75,7 @@ static long hwdep_read(struct snd_hwdep *hwdep, char __user *buf, long count,
 		while (consumed < count &&
 		       snd_motu_register_dsp_message_parser_copy_event(motu, &ev)) {
 			ptr = (u32 __user *)(buf + consumed);
-			if (put_user(ev, ptr))
+			if (consumed + sizeof(ev) > count || put_user(ev, ptr))
 				return -EFAULT;
 			consumed += sizeof(ev);
 		}
@@ -83,10 +83,11 @@ static long hwdep_read(struct snd_hwdep *hwdep, char __user *buf, long count,
 		event.motu_register_dsp_change.type = SNDRV_FIREWIRE_EVENT_MOTU_REGISTER_DSP_CHANGE;
 		event.motu_register_dsp_change.count =
 			(consumed - sizeof(event.motu_register_dsp_change)) / 4;
-		if (copy_to_user(buf, &event, sizeof(event.motu_register_dsp_change)))
+		if (copy_to_user(buf, &event,
+				 min_t(long, count, sizeof(event.motu_register_dsp_change))))
 			return -EFAULT;
 
-		count = consumed;
+		count = min_t(long, count, consumed);
 	} else {
 		spin_unlock_irq(&motu->lock);
 

---
base-commit: 559e608c46553c107dbba19dae0854af7b219400
change-id: 20251208-fixes-2d11c1218a5f

Best regards,
-- 
Junrui Luo <moonafterrain@outlook.com>

