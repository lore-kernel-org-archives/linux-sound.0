Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011011.outbound.protection.outlook.com [52.101.52.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC67FC0A;
	Thu, 12 Feb 2026 05:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770873253; cv=fail; b=ZRtLdjEXhqKtFFkUFC4iOiKKSO9BAZkGmsDbHwEko/N1Td/r8uer9JAbnxJTU494JOe/GXpOpEJwBaq6yVmbkHbNcIgDxaSQTSIMXRywhVlbyQ6CfJYFPCuXS96nsCKHF4U4rn2sNmZ1SpSGfTtyHChlM2solbowiN/zxC3z+28=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770873253; c=relaxed/simple;
	bh=JBWhlJp6BU8oDJmi2ruGjRdS1X6otcNPUmnrl2y5wHY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=n/aFWfibFWkPemUeGHiqPLd0ka6M/lArsN0uj+Osn5gnhGt18k8wiuvfpZcbP1EioJygb+3At5sQi2EnHGZosGncTJiYJ2vBnyyAHIANWcSg1WHwZ7/bO74JYQw+1+VnQyUJ/lL77s/KfI4PFvvnmwm/wOeK3qy5pPbiwiTZqvo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=1SbJDEv9; arc=fail smtp.client-ip=52.101.52.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="1SbJDEv9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ppGBBRMQbc9PiXlk1xjH/2foi9IsbZInumkP2RRL1F6PDTq8TO+WU4qqgkwCtBeAv2DavANlM56uLEc50Lt6d2eFWXzEMPWkm6utC1W1luprCD2EayfNSe3yiiHAkBtfkMWEmQWsUqbuvmIEd2qHeRhMUTYI5a4hh0+trMipA3d+KjhFP5WfbdQWw4bEIv/q6HthZQE2gl0xFkqRuUWPJwvwARykFynLGUAXNDWIL1JeKczvLJIq85ZkpRwbU8Kv1UBLn0gx7XtHX7cp90OVd/aZWHBiOMV0nM6nfy29GTdRZbm8YTUkXNH4fw9mo00u6Zey64LHpa5/KNsDWo5WBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4H1VSRe1RlNhaVcIV3oMVJJOhvtVzzZ79ROhNXSD4mI=;
 b=XVxqqYk0dypBF/RLVI+hYjS4TWtGUIzAoYKeG2dYUss8I3wLR0EKVRb8jv8hAVGEdM3q6HY7wtg1vPF5aIh7zZvzwgUyhCLvPNPohAZfxzwjmcRPmd8GGEBzjS1iY5VOckg3pP6MFzPdVhvkIY+Bg3GvifiWSmQd5CJdOjLor4rUR4a/uOpt9l273RisHZFl+l0nexiSfbLmRjDnFl4gnj4dMDg+srJIDpB2KVsumAo7EvgfVB0Ugb9cGeEcz6/9FbaOV6p1aPc3FXpZhnmkuYiXv+DnmK1o8aCggriMN/AcKXv2eR0Vv3/1dP9kw8z0H9+rtgkDSLJ68nlgIWWWeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4H1VSRe1RlNhaVcIV3oMVJJOhvtVzzZ79ROhNXSD4mI=;
 b=1SbJDEv9Wv0Pb+GYuAPNkbPnfdl23AzYDW+q0TBLRVKogV2VtffI/VdnBvI6MK+xGcZLteQJdoW8FJ7P9S5xS6VL3GRMeTjnB/qDxMK78FZoAflAIJ7edL1e5FLhSVwB80W51aswQW+4O2x2jnBrF29+y1lsNUKFM6wQTIgs1BU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS2PR12MB9567.namprd12.prod.outlook.com (2603:10b6:8:27c::8) by
 SJ1PR12MB6314.namprd12.prod.outlook.com (2603:10b6:a03:457::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.11; Thu, 12 Feb 2026 05:14:04 +0000
Received: from DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5]) by DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5%3]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 05:14:04 +0000
Message-ID: <c0c5382e-eda4-48b6-9afb-aadfe873b633@amd.com>
Date: Thu, 12 Feb 2026 10:43:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ASoC: amd: add DMIC support for RPL platform
Content-Language: en-US
To: Mingyou Chen <qby140326@gmail.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 mario.limonciello@amd.com, venkataprasad.potturu@amd.com,
 Sunil-kumar.Dommati@amd.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <a68b5c3f-3938-4402-80fa-08da74b87405@gmail.com>
 <20260212014658.8367-1-qby140326@gmail.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <20260212014658.8367-1-qby140326@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4PR01CA0094.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2af::7) To DS2PR12MB9567.namprd12.prod.outlook.com
 (2603:10b6:8:27c::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9567:EE_|SJ1PR12MB6314:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c4155e6-4945-496e-9787-08de69f58a7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VGc5OGI0TzRhVGRPUVVRUXcybU1jYUlObG1UYUNSNnE2M2xtN0J3NjArZ0xy?=
 =?utf-8?B?ZFpiNE50blNyZFo2aDFDdm0yTFZCSHFEa3VEVjJhdzUzVlBHYVVNdXM0Z0o3?=
 =?utf-8?B?cTFTU2loN2RXeFpzdmcrcWVscmNMdEJ1N2tTN0ZEZmIxbUdpeXFYRjQ2Wnow?=
 =?utf-8?B?dHp2aTA0RGhpV2pCVXN6Y01MOVlKcmF0OExnV1gySVhwTUo0dlkwTGlvdWhC?=
 =?utf-8?B?NHNndDRKZnFkc2FuSFN5dUI3MFFSMFpuMFJqWXoxclF5S01DSDVJRlNteHAz?=
 =?utf-8?B?YjJjVVVxanpyMWc4TlpNZW5SUjAycXdjckViUStrNnVpK0ltelhvNUJSR2Rv?=
 =?utf-8?B?SUYzQnhaOExzNnFhaHJKOFl3a2RGSDBlR0grUUttMHpHYXo1V2VYYklDSVhy?=
 =?utf-8?B?WXJKYVVZUWZjQ0VpK3U3N0JPREZOVUtyUW8zZHM4L2lwUlRLclhQOTNjWFZx?=
 =?utf-8?B?TWpMYXlybzRIME9vdnpwenM1UTc0T090Znd5Zlp6V0s4bW9iaEFlc29Vd3VR?=
 =?utf-8?B?aTJPVTNSTXZ3eXFjTTF1RnRMUmppRXhuZ0JoVmkzdWV1MEc4QnhxMWZzb3hB?=
 =?utf-8?B?bFo0QTdXZ2xZOFBWaEp6MHJMS1NBdy9XRWpqVERtU2xtd2t6MmgyRFBDQ0pG?=
 =?utf-8?B?MkFNWWVIMjJXSmMrWU1EeWZsRWVPQ3hTcmY3eFd1ZTl3blIrdXRQdmhEcERt?=
 =?utf-8?B?YXJTTU1Pa3o5TmVWZHN5TmsxRU9Bejd3bU4vSTZIcm1DSzd1MkdPazlnc0dr?=
 =?utf-8?B?cW0vWDRIamFDblZSMWhyRXA0d3NCUW9xeUZSRldtTXVGRFh4NEZkWG1QckVQ?=
 =?utf-8?B?em1zYkE0OTFrcUpXT1B4Z1FBQWJCT2ZyTmhIS0c5VjZ6OU5TQ0lRNnJWY2xu?=
 =?utf-8?B?dlk3a2swaGpqV25wazd4OGFLblVyWXAwaEovT2JaR1FabERkdU1vYTZDSHhq?=
 =?utf-8?B?N2ZHZlAvVTlPemRZN3ZQOE5aRFRqdkFNNUFpaG5xcmp4STRnR0txbWF6b2kw?=
 =?utf-8?B?aXFtMmljblp2TFdhTitQaEpaclM5bStpaXFCV3NrcnhvVlE3L1piZzdlcXZY?=
 =?utf-8?B?aHQwN3lTZUM0MWFsVExrTkFPV2VpVUpTRFFxOXRwb1V6YXVGZi9vd2Z5QXUy?=
 =?utf-8?B?TmFkMXZqNmM4Y0s5ZEZMQ2REemhlUCsvWncxSm1oTUNPRlBxcEViYlR6V3VB?=
 =?utf-8?B?RnVtU0JYaDVYSnVIVUJxVnhKRE9MZUsxalFhNEczYkxMVG9WbzIvMGdhQjFV?=
 =?utf-8?B?VzhDTXEvMC9lVUpLOXRVdVEyazdJN3ZUSGNkZlBDSkZLUnBWRnAzMVRPVUVw?=
 =?utf-8?B?Z0hPMjhOMU9UWmlKSVYrVkIyUGRGUzFtS0dmQnR5UGk1aHJvWEJYRmM4T0t0?=
 =?utf-8?B?YVJhQTRBNlFEYlhUSFJEcTZVNW45Yk12eUFweXpObkRMVElHOFhVQ0tnRmVs?=
 =?utf-8?B?RDFhcW5sVGJ2L1FlLzMxbk9NSy8wVlp0Q05ibW5nRUJDOE5OSmZkcFBWWmps?=
 =?utf-8?B?RjVKUGZRdGpVZ2dYbU9oaGhBWmxNbDRrY29RbVBDNlFhTkpsdlBzUlV0VmZW?=
 =?utf-8?B?SVkwSWRFMXJQeldNSktHQ05qRXc4bkJwUjNMa0IyZ3QycEQ2ZHlHc0NQdmRD?=
 =?utf-8?B?ZzBjR1BYZ1IzL1pWelNULzFNQUJjdDllKzRPa0liK1BkaEN6NkZWNUlIOUZi?=
 =?utf-8?B?M0grODA0VFZCRGtKTkdZd1VWMHpHVWJmU1hJRXQyTlpOUHJhZkd4SlFuY2tk?=
 =?utf-8?B?ai9NT2Y3Vkt6THZhOVE2cjMvbFArSjl1VHl6QUFMQ3J1ZUJDbHgraUc5VzlS?=
 =?utf-8?B?S2tmWE1NZHR1S1RZcGx1dEp4L3JFVytCa2FIaW8zNXQ5TkNuOVNId2NRZlBj?=
 =?utf-8?B?a2dkaGwrZXErKzFTZWNIZVFiRW1uY2hDdU5Rc0Nsa0ZLejZmTUZ3V0RocFYy?=
 =?utf-8?B?TVZsOCtkZWxBNkNQUkpGTkRJL3RYOUpLaHh0a2JYRTBtOFh0NEhnZTVud0ZZ?=
 =?utf-8?B?U3VxVFJLUXEyTms0MzlLYXF2eWx3T3BheDB2TkZBN1V0djFlQ2hpVWoyeEh2?=
 =?utf-8?B?Z0N6SDhSWlQ4L3RFNGpDbkQvK0hHV2pUT0EzWXhmQkp3MGE2SkpVc1kzOE9F?=
 =?utf-8?Q?8O5A=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9567.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WjZoNEZVVGJrcHU2OEFpam9xZGFCczFFUFUwOWt0S3RDVlAxSTNLaVgzOXRk?=
 =?utf-8?B?eTdIV2Q5V0lTcVlzcmdKdFIvM1FtTTFQcEsyQVNtTDhDODZtNlJUQUFFaWtX?=
 =?utf-8?B?Tm9XNjBSKzdFZnVRQjlmRXU3anBwdFNWVm9EQ01kbHVpbUdiY0pwL1hHUmh6?=
 =?utf-8?B?eStNOXRpbVV4dE5VbURZTmpsUCtBT0pxTG84MDJJZjVqdG0zV2ZDM3g2QjRw?=
 =?utf-8?B?SVhEYlhsYmk3bEJlYTRrODJSeEJvN2hQREl2UXhlcUZwSVdSSVhZMEJxcTNG?=
 =?utf-8?B?aUo3WGxTS0RSN3JBV1BoUzh1MjhBUzN6SE5wWVVaY0NxL3VhZzZIdzJuUy9r?=
 =?utf-8?B?NGFpeDk3TEladThIU3M4dS9FVjYrL0xZa1NVQ3d4ZkhkRXhTemFFSU9oSkxU?=
 =?utf-8?B?MWc1MzBhMEdOOXJYZjIyWDBlaU1Cc3VjOVJmODYzL0hVVjdzQ0ZxYmN3NzdE?=
 =?utf-8?B?WFkwL3FZc3FVa3YyREFBVGRCb05CQzIwMFVJSWMyMEpweXFpL2tVbk1BMFAz?=
 =?utf-8?B?ZHU2RXZUeG5EcHFwZnQwS1Z1K3JxeHoxQ1ErcG5QWVpyWC9XNVRNeEoyTG1L?=
 =?utf-8?B?L1hRY0plWm5JaERud3VBelVzVE9xS1pNa3JrUDNiYnByNHdMdENqd2ZuZStB?=
 =?utf-8?B?VUg2bWdveU1EM3JWMlV3MXZVVVE2aURFQXQzcXhDbjBBWS9ZYVY0UjA1Wk1m?=
 =?utf-8?B?SlFKdFpUVTVRdXRSUnBUZFFzWTBZZVNCOFJsbTNtOG01U21nNEV6eGFOV2l5?=
 =?utf-8?B?aWtvOENCclJuK0lTcnFRR21NNFI4bThWdm1vQUZIaEpPNU5wcWdPejFuK2t5?=
 =?utf-8?B?Q3RRUlB0UFJVYmFPYWRZbG9UOGptdHcxUzhwckhWVXI1dlFRTDZXRXpOWTlN?=
 =?utf-8?B?U2FHZFlpQTVpOXNCMVJZZlY3SFVzYmJjRlIvb3VCaEtyY08wWjU3QUlHUUJT?=
 =?utf-8?B?VDdLcHFjZ2RFUTZSYm5wU0p4MXk0U0sxN1UrQTl4dms5ekFKUkRqcURONVRY?=
 =?utf-8?B?Z1hlU2ZkWS9ROHYrbURUd2M5dzkzZXBQSXliUmQ3UXoxdG13NUFDRms2bTlr?=
 =?utf-8?B?SGJWN2h3V3lBU2FZcmVzRnpCbEI3ZXVPVzlqMmlyU29DUDZBZ2tDN3lZekZ4?=
 =?utf-8?B?aERSdmxqWDc2WkRZNDZoMEhGQVArbk9DY2NBNm54R25pa2JYb1I4SENqZzVk?=
 =?utf-8?B?M1p3ckdoMm1od0FDUlpYNVd1b2ttSFdBUlp6K1I2am1KdWZ0NW9tM253cjla?=
 =?utf-8?B?YUJpT0E2b3pLSmZxbTBKZXpBSVhKZzRWTXp5VExaRkJWTWplWk9qdDVBa2NK?=
 =?utf-8?B?SWVISENnRG83QkdBU2QrYjZkUmlPU3lXTG5xRGVTOVV6TjlhY0JvUDFja3dY?=
 =?utf-8?B?VXRtd0NxS25KTm5tSnF3L2dRaytqWFR3Z3hxN0hoc2k3SXd4NFcyeUNCT2xN?=
 =?utf-8?B?ZUVwU2dvMGxQZTNrRG5IVjFaYW5mbUdtb3dac0pZVHBFdVAvWlloaTRDdjI1?=
 =?utf-8?B?RXNTM3NpR0RaV3grcHJvSzRqK2FOMVJsd3NjTE5ub0lSTURUZUJjK1BkcUNS?=
 =?utf-8?B?eHUyWjVzRkZSQ1M5dm1RQlhpZlBYWGkwaVZXRlpOK1M3cFB4NWVWTHJTbXZX?=
 =?utf-8?B?WGl2YkMrNFpmMzdOaERGelZ2UnNMU2ZVWnNWZmE5MldJR2R5TWlaclhHU0V2?=
 =?utf-8?B?cFVnNXZjdnRDS0pXWUFHcTlNajhyWklkTlpMMVNKWW44b2lyQ1BBWFlpTi9X?=
 =?utf-8?B?ZkxBZGhsczdXa3dCSWJVQkRaeDZ2dGhULzN3aGxDQkxEdTQvTkNzWUNpSHhM?=
 =?utf-8?B?VFY3L1ZIMmwwZjN4cGttUURWVGs3cXVhUEpaQTcvKzlDOVM0dzlCcEY1bzND?=
 =?utf-8?B?V0UraC9PTHI4aFNNVFBrRDdSbnhtQnRyTkJSbkVMUlN0SWtkT0JUNkNuWE51?=
 =?utf-8?B?RWpZcHQwUUQ5Um52Umo3cDRUV05NckJTRm4rbDlQTFBPOGhKU3lqMFlEdU9q?=
 =?utf-8?B?YzdqS0VYcTBXdlYzUG0rUEVLZnRxTEpwM3FUZGwyTnpRQ1lrVjBSVFpQT2Z3?=
 =?utf-8?B?OWFmUXYxbCtXdk13Ni92Nm1YbmJsMC9ZcUdGUTZDRGIrekRmbWNZTVluQkV0?=
 =?utf-8?B?NVR4QStyTmVHRUlrczNiWHlaNGVLYXYyREt3Mm9qaWhTK2ZUM2lsa090VzBj?=
 =?utf-8?B?U2Y0ajB3NmkxQXJXQXQ4SThqbDhsVXVOL29OcWRLSTR4VEdVZkdnSkt3STZG?=
 =?utf-8?B?dUdWZ0dHMHRPeDZLY0ZUdm1XU2ttZ05YOVhXbER3N0xWM2NiKzc5YkdaOVEz?=
 =?utf-8?B?WEhmOG03ZDduZlhuVGkzT0dPTEFaWGVpdFZRS0J4VjRDZmszR3hGdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c4155e6-4945-496e-9787-08de69f58a7c
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9567.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 05:14:04.6202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5xbbNduqWspyarG/kgmWDOPOdJ1ea+fb/Z51B1Yr+3/OFqtHoLaPzswl/9qGzomQLRBVjO1kYkr6FwKeepM+rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6314

On 12/02/26 07:16, Mingyou Chen wrote:
> Add DMIC support for the AMD RPL platform. The drivers are derived on
> the YC platform driver.
>
> Signed-off-by: Mingyou Chen <qby140326@gmail.com>
> ---
> v2:
>   - Reverse ACP CONFIG PIN from 10 to 14 for rpl
>   - Remove the rpl folder
> v3:
>   - Remove rpl configuration from Kconfig and Makefile
>
>  sound/soc/amd/Kconfig                         |  10 -
>  sound/soc/amd/Makefile                        |   1 -
>  sound/soc/amd/rpl/Makefile                    |   5 -
>  sound/soc/amd/rpl/rpl-pci-acp6x.c             | 227 ------------------
>  sound/soc/amd/rpl/rpl_acp6x.h                 |  36 ---
>  .../soc/amd/rpl/rpl_acp6x_chip_offset_byte.h  |  30 ---
>  sound/soc/amd/yc/acp6x-mach.c                 |   7 +
>  sound/soc/amd/yc/pci-acp6x.c                  |   6 +
>  8 files changed, 13 insertions(+), 309 deletions(-)
>  delete mode 100644 sound/soc/amd/rpl/Makefile
>  delete mode 100644 sound/soc/amd/rpl/rpl-pci-acp6x.c
>  delete mode 100644 sound/soc/amd/rpl/rpl_acp6x.h
>  delete mode 100644 sound/soc/amd/rpl/rpl_acp6x_chip_offset_byte.h
>
> diff --git a/sound/soc/amd/Kconfig b/sound/soc/amd/Kconfig
> index fd35a03aadcb..a6eecbe12e84 100644
> --- a/sound/soc/amd/Kconfig
> +++ b/sound/soc/amd/Kconfig
> @@ -124,16 +124,6 @@ config SND_AMD_ACP_CONFIG
>  
>  source "sound/soc/amd/acp/Kconfig"
>  
> -config SND_SOC_AMD_RPL_ACP6x
> -        tristate "AMD Audio Coprocessor-v6.2 RPL support"
> -        depends on X86 && PCI
> -        help
> -          This option enables Audio Coprocessor i.e. ACP v6.2 support on
> -          AMD RPL platform. By enabling this flag build will be
> -          triggered for ACP PCI driver.
> -          Say m if you have such a device.
> -          If unsure select "N".
> -
>  config SND_SOC_AMD_ACP63_TOPLEVEL
>  	tristate "support for AMD platforms with ACP version >= 6.3"
>  	default SND_AMD_ACP_CONFIG
> diff --git a/sound/soc/amd/Makefile b/sound/soc/amd/Makefile
> index 4f89d962cce2..23b25ff0d800 100644
> --- a/sound/soc/amd/Makefile
> +++ b/sound/soc/amd/Makefile
> @@ -17,5 +17,4 @@ obj-$(CONFIG_SND_SOC_AMD_ACP5x) += vangogh/
>  obj-$(CONFIG_SND_SOC_AMD_ACP6x) += yc/
>  obj-$(CONFIG_SND_AMD_ACP_CONFIG) += acp/
>  obj-$(CONFIG_SND_AMD_ACP_CONFIG) += snd-acp-config.o
> -obj-$(CONFIG_SND_SOC_AMD_RPL_ACP6x) += rpl/
>  obj-$(CONFIG_SND_SOC_AMD_PS) += ps/
> diff --git a/sound/soc/amd/rpl/Makefile b/sound/soc/amd/rpl/Makefile
> deleted file mode 100644
> index a3825c5be4e7..000000000000
> --- a/sound/soc/amd/rpl/Makefile
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -# SPDX-License-Identifier: GPL-2.0+
> -# RPL platform Support
> -snd-rpl-pci-acp6x-y	:= rpl-pci-acp6x.o
> -
> -obj-$(CONFIG_SND_SOC_AMD_RPL_ACP6x) += snd-rpl-pci-acp6x.o
> diff --git a/sound/soc/amd/rpl/rpl-pci-acp6x.c b/sound/soc/amd/rpl/rpl-pci-acp6x.c
> deleted file mode 100644
> index e3afe9172bdf..000000000000
> --- a/sound/soc/amd/rpl/rpl-pci-acp6x.c
> +++ /dev/null
> @@ -1,227 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0+
> -/*
> - * AMD RPL ACP PCI Driver
> - *
> - * Copyright 2022 Advanced Micro Devices, Inc.
> - */
> -
> -#include <linux/pci.h>
> -#include <linux/module.h>
> -#include <linux/io.h>
> -#include <linux/delay.h>
> -#include <linux/platform_device.h>
> -#include <linux/pm_runtime.h>
> -
> -#include "rpl_acp6x.h"
> -
> -struct rpl_dev_data {
> -	void __iomem *acp6x_base;
> -};
> -
> -static int rpl_power_on(void __iomem *acp_base)
> -{
> -	u32 val;
> -	int timeout;
> -
> -	val = rpl_acp_readl(acp_base + ACP_PGFSM_STATUS);
> -
> -	if (!val)
> -		return val;
> -
> -	if ((val & ACP_PGFSM_STATUS_MASK) != ACP_POWER_ON_IN_PROGRESS)
> -		rpl_acp_writel(ACP_PGFSM_CNTL_POWER_ON_MASK, acp_base + ACP_PGFSM_CONTROL);
> -	timeout = 0;
> -	while (++timeout < 500) {
> -		val = rpl_acp_readl(acp_base + ACP_PGFSM_STATUS);
> -		if (!val)
> -			return 0;
> -		udelay(1);
> -	}
> -	return -ETIMEDOUT;
> -}
> -
> -static int rpl_reset(void __iomem *acp_base)
> -{
> -	u32 val;
> -	int timeout;
> -
> -	rpl_acp_writel(1, acp_base + ACP_SOFT_RESET);
> -	timeout = 0;
> -	while (++timeout < 500) {
> -		val = rpl_acp_readl(acp_base + ACP_SOFT_RESET);
> -		if (val & ACP_SOFT_RESET_SOFTRESET_AUDDONE_MASK)
> -			break;
> -		cpu_relax();
> -	}
> -	rpl_acp_writel(0, acp_base + ACP_SOFT_RESET);
> -	timeout = 0;
> -	while (++timeout < 500) {
> -		val = rpl_acp_readl(acp_base + ACP_SOFT_RESET);
> -		if (!val)
> -			return 0;
> -		cpu_relax();
> -	}
> -	return -ETIMEDOUT;
> -}
> -
> -static int rpl_init(void __iomem *acp_base)
> -{
> -	int ret;
> -
> -	/* power on */
> -	ret = rpl_power_on(acp_base);
> -	if (ret) {
> -		pr_err("ACP power on failed\n");
> -		return ret;
> -	}
> -	rpl_acp_writel(0x01, acp_base + ACP_CONTROL);
> -	/* Reset */
> -	ret = rpl_reset(acp_base);
> -	if (ret) {
> -		pr_err("ACP reset failed\n");
> -		return ret;
> -	}
> -	rpl_acp_writel(0x03, acp_base + ACP_CLKMUX_SEL);
> -	return 0;
> -}
> -
> -static int rpl_deinit(void __iomem *acp_base)
> -{
> -	int ret;
> -
> -	/* Reset */
> -	ret = rpl_reset(acp_base);
> -	if (ret) {
> -		pr_err("ACP reset failed\n");
> -		return ret;
> -	}
> -	rpl_acp_writel(0x00, acp_base + ACP_CLKMUX_SEL);
> -	rpl_acp_writel(0x00, acp_base + ACP_CONTROL);
> -	return 0;
> -}
> -
> -static int snd_rpl_probe(struct pci_dev *pci,
> -			 const struct pci_device_id *pci_id)
> -{
> -	struct rpl_dev_data *adata;
> -	u32 addr;
> -	int ret;
> -
> -	/* RPL device check */
> -	switch (pci->revision) {
> -	case 0x62:
> -		break;
> -	default:
> -		dev_dbg(&pci->dev, "acp6x pci device not found\n");
> -		return -ENODEV;
> -	}
> -	if (pci_enable_device(pci)) {
> -		dev_err(&pci->dev, "pci_enable_device failed\n");
> -		return -ENODEV;
> -	}
> -
> -	ret = pci_request_regions(pci, "AMD ACP6x audio");
> -	if (ret < 0) {
> -		dev_err(&pci->dev, "pci_request_regions failed\n");
> -		goto disable_pci;
> -	}
> -
> -	adata = devm_kzalloc(&pci->dev, sizeof(struct rpl_dev_data),
> -			     GFP_KERNEL);
> -	if (!adata) {
> -		ret = -ENOMEM;
> -		goto release_regions;
> -	}
> -
> -	addr = pci_resource_start(pci, 0);
> -	adata->acp6x_base = devm_ioremap(&pci->dev, addr,
> -					 pci_resource_len(pci, 0));
> -	if (!adata->acp6x_base) {
> -		ret = -ENOMEM;
> -		goto release_regions;
> -	}
> -	pci_set_master(pci);
> -	pci_set_drvdata(pci, adata);
> -	ret = rpl_init(adata->acp6x_base);
> -	if (ret)
> -		goto release_regions;
> -	pm_runtime_set_autosuspend_delay(&pci->dev, ACP_SUSPEND_DELAY_MS);
> -	pm_runtime_use_autosuspend(&pci->dev);
> -	pm_runtime_put_noidle(&pci->dev);
> -	pm_runtime_allow(&pci->dev);
> -
> -	return 0;
> -release_regions:
> -	pci_release_regions(pci);
> -disable_pci:
> -	pci_disable_device(pci);
> -
> -	return ret;
> -}
> -
> -static int snd_rpl_suspend(struct device *dev)
> -{
> -	struct rpl_dev_data *adata;
> -	int ret;
> -
> -	adata = dev_get_drvdata(dev);
> -	ret = rpl_deinit(adata->acp6x_base);
> -	if (ret)
> -		dev_err(dev, "ACP de-init failed\n");
> -	return ret;
> -}
> -
> -static int snd_rpl_resume(struct device *dev)
> -{
> -	struct rpl_dev_data *adata;
> -	int ret;
> -
> -	adata = dev_get_drvdata(dev);
> -	ret = rpl_init(adata->acp6x_base);
> -	if (ret)
> -		dev_err(dev, "ACP init failed\n");
> -	return ret;
> -}
> -
> -static const struct dev_pm_ops rpl_pm = {
> -	RUNTIME_PM_OPS(snd_rpl_suspend, snd_rpl_resume, NULL)
> -	SYSTEM_SLEEP_PM_OPS(snd_rpl_suspend, snd_rpl_resume)
> -};
> -
> -static void snd_rpl_remove(struct pci_dev *pci)
> -{
> -	struct rpl_dev_data *adata;
> -	int ret;
> -
> -	adata = pci_get_drvdata(pci);
> -	ret = rpl_deinit(adata->acp6x_base);
> -	if (ret)
> -		dev_err(&pci->dev, "ACP de-init failed\n");
> -	pm_runtime_forbid(&pci->dev);
> -	pm_runtime_get_noresume(&pci->dev);
> -	pci_release_regions(pci);
> -	pci_disable_device(pci);
> -}
> -
> -static const struct pci_device_id snd_rpl_ids[] = {
> -	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, ACP_DEVICE_ID),
> -	.class = PCI_CLASS_MULTIMEDIA_OTHER << 8,
> -	.class_mask = 0xffffff },
> -	{ 0, },
> -};
> -MODULE_DEVICE_TABLE(pci, snd_rpl_ids);
> -
> -static struct pci_driver rpl_acp6x_driver  = {
> -	.name = KBUILD_MODNAME,
> -	.id_table = snd_rpl_ids,
> -	.probe = snd_rpl_probe,
> -	.remove = snd_rpl_remove,
> -	.driver = {
> -		.pm = pm_ptr(&rpl_pm),
> -	}
> -};
> -
> -module_pci_driver(rpl_acp6x_driver);
> -
> -MODULE_DESCRIPTION("AMD ACP RPL PCI driver");
> -MODULE_LICENSE("GPL v2");
> diff --git a/sound/soc/amd/rpl/rpl_acp6x.h b/sound/soc/amd/rpl/rpl_acp6x.h
> deleted file mode 100644
> index f5816a33632e..000000000000
> --- a/sound/soc/amd/rpl/rpl_acp6x.h
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0+ */
> -/*
> - * AMD ACP Driver
> - *
> - * Copyright (C) 2021 Advanced Micro Devices, Inc. All rights reserved.
> - */
> -
> -#include "rpl_acp6x_chip_offset_byte.h"
> -
> -#define ACP_DEVICE_ID 0x15E2
> -#define ACP6x_PHY_BASE_ADDRESS 0x1240000
> -
> -#define ACP_SOFT_RESET_SOFTRESET_AUDDONE_MASK   0x00010001
> -#define ACP_PGFSM_CNTL_POWER_ON_MASK    1
> -#define ACP_PGFSM_CNTL_POWER_OFF_MASK   0
> -#define ACP_PGFSM_STATUS_MASK           3
> -#define ACP_POWERED_ON                  0
> -#define ACP_POWER_ON_IN_PROGRESS        1
> -#define ACP_POWERED_OFF                 2
> -#define ACP_POWER_OFF_IN_PROGRESS       3
> -
> -#define DELAY_US        5
> -#define ACP_COUNTER     20000
> -
> -/* time in ms for runtime suspend delay */
> -#define ACP_SUSPEND_DELAY_MS    2000
> -
> -static inline u32 rpl_acp_readl(void __iomem *base_addr)
> -{
> -	return readl(base_addr - ACP6x_PHY_BASE_ADDRESS);
> -}
> -
> -static inline void rpl_acp_writel(u32 val, void __iomem *base_addr)
> -{
> -	writel(val, base_addr - ACP6x_PHY_BASE_ADDRESS);
> -}
> diff --git a/sound/soc/amd/rpl/rpl_acp6x_chip_offset_byte.h b/sound/soc/amd/rpl/rpl_acp6x_chip_offset_byte.h
> deleted file mode 100644
> index 456498f5396d..000000000000
> --- a/sound/soc/amd/rpl/rpl_acp6x_chip_offset_byte.h
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0+ */
> -/*
> - * AMD ACP 6.2 Register Documentation
> - *
> - * Copyright 2022 Advanced Micro Devices, Inc.
> - */
> -
> -#ifndef _rpl_acp6x_OFFSET_HEADER
> -#define _rpl_acp6x_OFFSET_HEADER
> -
> -/* Registers from ACP_CLKRST block */
> -#define ACP_SOFT_RESET                                0x1241000
> -#define ACP_CONTROL                                   0x1241004
> -#define ACP_STATUS                                    0x1241008
> -#define ACP_DYNAMIC_CG_MASTER_CONTROL                 0x1241010
> -#define ACP_PGFSM_CONTROL                             0x124101C
> -#define ACP_PGFSM_STATUS                              0x1241020
> -#define ACP_CLKMUX_SEL                                0x1241024
> -
> -/* Registers from ACP_AON block */
> -#define ACP_PME_EN                                    0x1241400
> -#define ACP_DEVICE_STATE                              0x1241404
> -#define AZ_DEVICE_STATE                               0x1241408
> -#define ACP_PIN_CONFIG                                0x1241440
> -#define ACP_PAD_PULLUP_CTRL                           0x1241444
> -#define ACP_PAD_PULLDOWN_CTRL                         0x1241448
> -#define ACP_PAD_DRIVE_STRENGTH_CTRL                   0x124144C
> -#define ACP_PAD_SCHMEN_CTRL                           0x1241450
> -
> -#endif
> diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
> index 0294177acc66..de49c812124a 100644
> --- a/sound/soc/amd/yc/acp6x-mach.c
> +++ b/sound/soc/amd/yc/acp6x-mach.c
> @@ -45,6 +45,13 @@ static struct snd_soc_card acp6x_card = {
>  };
>  
>  static const struct dmi_system_id yc_acp_quirk_table[] = {
> +	{
> +		.driver_data = &acp6x_card,
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "Lecoo"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Bellator N176"),
> +		}
> +	},
>  	{
>  		.driver_data = &acp6x_card,
>  		.matches = {
> diff --git a/sound/soc/amd/yc/pci-acp6x.c b/sound/soc/amd/yc/pci-acp6x.c
> index 1140ed1cbb3d..296b74252a8a 100644
> --- a/sound/soc/amd/yc/pci-acp6x.c
> +++ b/sound/soc/amd/yc/pci-acp6x.c
> @@ -163,6 +163,7 @@ static int snd_acp6x_probe(struct pci_dev *pci,
>  	switch (pci->revision) {
>  	case 0x60:
>  	case 0x6f:
> +	case 0x62: /* RPL */
>  		break;
>  	default:
>  		dev_dbg(&pci->dev, "acp6x pci device not found\n");
> @@ -205,6 +206,11 @@ static int snd_acp6x_probe(struct pci_dev *pci,
>  	case ACP_CONFIG_2:
>  	case ACP_CONFIG_3:
>  	case ACP_CONFIG_9:
> +	case ACP_CONFIG_10: /* Reserved for RPL */
> +	case ACP_CONFIG_11: /* Reserved for RPL */
> +	case ACP_CONFIG_12: /* Reserved for RPL */
> +	case ACP_CONFIG_13: /* Reserved for RPL */
> +	case ACP_CONFIG_14: /* Reserved for RPL */
Need to handle separate switch case for RPL. Above changes breaks
the functionality for YC.  
>  	case ACP_CONFIG_15:
>  		dev_info(&pci->dev, "Audio Mode %d\n", val);
>  		break;

