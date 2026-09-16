Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47AC938DC6E
	for <linux-sound@vger.kernel.org>; Wed, 16 Sep 2026 01:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789521228; cv=fail; b=S2FBA/hrZ8ZSXzo2l5aw43uHBkvcHsVZ4X8r2BFG1WQqF1wCjokwjzuZJzmb+ju7hePCVWddGHlcXlV4PJNzS0WeVeQOIdlscI2RkWWq0pXr0fy4gkSzYQ5G2Q7U+YrtJ3AU+0Bup9Ai5DuiOs//7f0HEQFbucaNv0X4mFEWsqQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789521228; c=relaxed/simple;
	bh=QLUGVPLcA62MbHvUSrHxyByFE1wNY1oGz9pnzYgiWHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kvqfcuqyL2YehrJ22rKW+YcUSHgxH7kQkA5t1P37Dt9boxgkcAXhrr3ZjXrIGVVz4Sf5a8cjK/nBhwUnA9m+az5RMaNaU+q7g2sJ9Uo2fNJla/yQCU3vzIOIDXi8x5jr+uBx2KON0yEQetnaChTAmXdjtDWp01BRUPAgqnaQGX8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=adRyj6Iu; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="adRyj6Iu"
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FLXHOT995329;
	Tue, 15 Sep 2026 21:13:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=DKIM; bh=DQzEpMW4tOmuXcsyXnf7N22fUgbYB
	JVUx/VIgO5StRI=; b=adRyj6IuMwDcpI2PjCShybDpqsgmQNiAibuH/CWfnbOU8
	vBnUgmLjuPQ/oSFabx8HWzn+PNL6vs6C6DcAK/vfm4H6dSPT+tU8+GNWSTWg55rU
	54Z77rryhMAHek4SDgM7c52Z8GpDQTE0r2RwaJdTsxs/1rJY9CwAOwEVg+uXHhtE
	263aIPzixqwzPepZiU19SXbbPglox1DXn3NqYHPYgwS2QkrFnZyhrKP1wT8RvIe/
	cN1OrsD6s+6mgx0fcge5U+Gv6OKROYeB0ccVL40G50MQ74Ihcu09C8DjXOsbuq4o
	4AL6FIRWmL11ibdSbOWLKAirEX+9zysXY3DxpxQIA==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011067.outbound.protection.outlook.com [52.101.62.67])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4gq4v9ksrf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 15 Sep 2026 21:13:41 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QHk6vYvIeZ8iUcw3ZPhlH8B1TSahLSX5psWqQ1InO/xUvAhtJUIEv+oecM35a7E8OnAwymH9iPsCpl3SnTdLEbrNsSlae2byuAg6auXWXm6cD6zHvU79PNxRrV9vrJsWSoh7GUVDomPhBdf8iKXrnoJR2Mzt8afqLkqHhzkYvf5W+1p+4G3hy0htJg8O6qzUwx+d5b55Qi+p2ZO0OCLIR9J86gL1LgFaEsa9+N1Wrkm6b3jIEFxqFaQNJePnWX+O7DfJ51vtdFZOxqGRIHS3PqPQHDLBA5+MDo2dN5+vBzLX1lDxnOrpjCz+V1hfNGQMwgFbu5yHdYANt166iZdTCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DQzEpMW4tOmuXcsyXnf7N22fUgbYBJVUx/VIgO5StRI=;
 b=WcwqVoPVjF56x82/045tn4kRDpn/BBqUHwtEChkvQ4NeGnhXs76vj0QGhF6bTjk8snlAK7mtptsrcDDUc6PHaRFUEsgwCUNbWKv73ttXA4d6NAJsb8kPKEU7WhvF4jiRMWI2yGpjTAvw4lyh+NqZFxqOPJx6GFNTTiCscerOIu213txnpsZG/g1VdGBNGdzNLMSasrqrvNtpB23dLRDtGtWL7L2PJU8BCGzzmsr+lEQJ5zVAm5M6G5KxC0gv7n+T//iy7gkJGR7EdGrKiOtAr9IbEOHvd5xF6VcLWw9m7Zuan+huBStcofZS7Rvm2EsZ0/EtDfgR2mE3/t78+EcNjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from DM4PR03MB5981.namprd03.prod.outlook.com (2603:10b6:5:388::24)
 by CHAPR03MB989224.namprd03.prod.outlook.com (2603:10b6:610:2fe::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 01:13:39 +0000
Received: from DM4PR03MB5981.namprd03.prod.outlook.com
 ([fe80::7af0:3071:4d42:63ed]) by DM4PR03MB5981.namprd03.prod.outlook.com
 ([fe80::7af0:3071:4d42:63ed%5]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 01:13:39 +0000
Date: Wed, 16 Sep 2026 03:13:35 +0200
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org
Subject: Re: [PATCH 07/10] ASoC: soc-dai: rename snd_soc_dai_stream_active()
Message-ID: <aqnojhexUNccmf7O@analog.com>
References: <87qziwliaj.wl-kuninori.morimoto.gx@renesas.com>
 <87h5jsli4y.wl-kuninori.morimoto.gx@renesas.com>
 <aqiS7yz4IIYzU6ml@analog.com>
 <874ifrrsy5.wl-kuninori.morimoto.gx@renesas.com>
 <aqke4IixnU_L9osp@analog.com>
 <87fqzavx57.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87fqzavx57.wl-kuninori.morimoto.gx@renesas.com>
X-ClientProxiedBy: AS4P192CA0009.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:5da::16) To DM4PR03MB5981.namprd03.prod.outlook.com
 (2603:10b6:5:388::24)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB5981:EE_|CHAPR03MB989224:EE_
X-MS-Office365-Filtering-Correlation-Id: a59e0cb5-77f9-40a5-29d0-08df138fbd2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|10067099003|22082099003|18002099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	0PnJK6WywUQh51ur4rU7w2AdMUugwcjsgvBXHU8dm9vJ3dx8WXEpJ/rOIhmyH76dGlusLcO/XqkOznUP0t7eTp98fUzZYLq+GLk3uWJp8EkxGQEglJIf/pMhuVYKf1H1FQht0/kTafzdYw8Nb1qsphOs+scKUi4RityWQu3rgYuJtaR5l+Mnfm98n0ugG3FtAyKd7glUe6uvuiaRsqdN9K/Evkdf/N9qLrDa7m8x6yNwrZJcpESHEuLUBgIxMYmlYOt4DpaikVwZeCpGisAPgCFNeuHhKnEg+IoA5YUTenK3KY09ugAAcS9HH5YsJvl4z5ml6R7L3olXn7DUBIS2YJXj0kXl8BkQFMc1iy9xRt3TKURd8vlNQirv1dRtxMjKUpJrgwsjHjFRVNCXXR5bSZOb89g9YFRmsDVuObCHUL8dIdjn16BvKSUNUbAjJiZmzPy4fa2p0trZLP2TJ/I2gocU4zOMPhfwvXD5IGbOGOVg5iYx0bJwPJLp4BhJi6bByHUpl5NRwXrOVNDPuV7IPFbJe9W1wR1Bp4b1GCEhq63fBXU0DZwqAUeolL21VVOb/5XuvNIb3nD07oRRvhwgHxzoUXlU75lUT0EXQNci3JsUSMp6c/DNqpouQTt4syNP0uJ7csR4zTHzvLehlegwvHiOTNBlLi3sWB8cSpwX8AU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB5981.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(10067099003)(22082099003)(18002099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZWtKS214dmhvZzBCVU5NSjNxQ20xS016NFNZR1QyWDNzWUZQQ3hmSUFXeXhu?=
 =?utf-8?B?aEZDYXFGQW9QTWEyWDhkRTh2ZFJuZThHOFl3NDduMm0yY3lSR1owTEhPaEF4?=
 =?utf-8?B?Wm1aVjVWZmNPdlFzZHRodVFITE1XOW1oLy9zUkNaS2ZRcUt1WGluM1NWd1hi?=
 =?utf-8?B?WitPa0pDWlN6TFRHYytDNUJBVVVRaHE5SnZncDduS1p1dXR3SkNsRGFkNE1J?=
 =?utf-8?B?YUVXUDh1eWhUQTlzSU1DWUdBUCtIaWltRTlsbkFvTVdkSUN2U3gzekorZFhH?=
 =?utf-8?B?TVg2dEs2dkt4Z0lxei8wY01xbWlueW9LeUE5MEN6a3c2VDhZMnBwOGREcTc2?=
 =?utf-8?B?OUF4NmVIYlh4dXc0UTAzVDBsOW5OazFnRnBKTlJYdjJSM2ZKNFFQTFFOc3du?=
 =?utf-8?B?ZmhESEsyNGpZcUh0U3h4eWhqL1pUUkhOZ01wV3VFYm95d216dEFaYXNuY3Y1?=
 =?utf-8?B?TnlTWW9FRWR6Zkk5K0dZSGJXdVgrc2w2ZFBhM0xxQzJDTG9MZFczU2JieDRs?=
 =?utf-8?B?RzAwTytab0dmc1BqV2dqSzV4MkNOeDVTbjlPYkFLTDJNckorY0VZUGs3NzJk?=
 =?utf-8?B?QWpwNVhIYW5iZ0pwSDVNVEZuZGQ2eTBRSWg4c1pVYnJhdnc5QWF5QlVUeGF4?=
 =?utf-8?B?S1Y3RjA4SmZ5WXhwRi9DeHF6aDhrN21wY2djWER5dnVkOGloZDJKM0E2MW1k?=
 =?utf-8?B?TVZ2WVZHcDZacTlMOXkzVVFsUWUvRVdhSEVzY3hTRHVaU0VGR0FBb3lWZi9j?=
 =?utf-8?B?OEFqQnBwREdJQklkbVNtaDd1QlUyRlpBOFpibGdhUEcwamxVQzJJRnJZQXpP?=
 =?utf-8?B?V0VYQUU0M0J6czhoOVZPdHZiejdYTHRUdWlKanpxZ3NscVJaY3p3N3ArYzJF?=
 =?utf-8?B?Ky9qandyZ0JTOG55NDRZclVET3pnM25ka2ZnZlAyQVVnV25yM1JRa3hRRnpu?=
 =?utf-8?B?b2pleVBTcGx0WUpxMkFsYXdMMFpmTEd3K2pCVmZEUDl0c1hHUjh4UytoZkZy?=
 =?utf-8?B?ZXhNV1Iwd0Y4VENMZVk0am1MMjBpMXI2N29TWHBNRU9QbWphMlF5Y2U1MlBm?=
 =?utf-8?B?dWpHUzlyWFBBeVEvWUlCYUpvNWYxQmMxZVB6VHoxMi9BdFRqRWdjOFFBUnZW?=
 =?utf-8?B?NWFVOFRiTXVtaXFzSlR5emFKcFFBL2xjdDArTm1VZ1U3eitISHZTcTZsT2ZB?=
 =?utf-8?B?Z3BpZnIzWlVjWnVWczBjSUcyZjd0YkZKOWlsRlJqZGdIM3BPUlhING14ZFRG?=
 =?utf-8?B?SG1tdkpXYUV2eVhkbU5vNUI5NUsyUlU1Mis5dnNxVFRyVVdTVUtYWWw3b05O?=
 =?utf-8?B?TTI2MjRDWFNFM1R4N3JPSE00dmlSbmVhb2ZydVhhSFRkaVJWL1UzV1BkcjJl?=
 =?utf-8?B?NmRlSHVDMmhTQ094eWRiSkRDS2M3aytXSHJkbm5yZExWVlZzdjM3eWVwUXl5?=
 =?utf-8?B?Ky9LeWVaQjhjZkFTQ0wzL002L2NXYWhtSVA5VGZiUnZaS2UxTUJaNkpCL3Fh?=
 =?utf-8?B?SDdickFqeHBndFZ3ZFhkZXdOempvM0lPdXcvd1AvRS9kLy9hWEFVMW5mR1VK?=
 =?utf-8?B?ci93LzF5STZWWlYvUkJyNlhZV3lmV2h6N1I3eVdUQmg5ZUw5NGxPbHF6ZThZ?=
 =?utf-8?B?WDFiWUFQd0lZcFM3NkFNajdUV0I1bEE4Y1FKS09hK0F6MkhHRmtQSUVZRkJx?=
 =?utf-8?B?Ykc4c29iZVpQclU3NDlDRkNueHgyaFV1Y3pJU0lrOE4zL28yVE5yeXpLcUls?=
 =?utf-8?B?YWkzUGpDcXZFN2NZeldnRStINE5SVkcrWExJSUVtQ2tjVVFuc0xDeEVBcU4z?=
 =?utf-8?B?NU9JRWtVZWxJMUY3cGRrVFVPYlBGZkVZcS9TNVZvOSs0ellDa2hoN2VpQ2Jz?=
 =?utf-8?B?bVFldkVrZHZwamkzdVg3VEVsSFhqdjNNZ2NNSy9BdWdYa2hrN3dxb05rdWlt?=
 =?utf-8?B?MDQ2OWhGSFdQQVVFR0M2UnNHcytvYzl3alZQU2lBdDlyeXBNc04xeWxmSFpL?=
 =?utf-8?B?Nzc2VXFod0J4clAyVUFPVFpzS0FyTHcvMy8zYmZid1J2Zzl0V1hja1Avanor?=
 =?utf-8?B?d0pyWkxjbDE3UUN2cDE1TVJNcXFyYWhCemRuTm1EQXNNSHAyakZ1MU8vdzVM?=
 =?utf-8?B?UW8vUmpJNVVMRXVHK0RaWUVTRXdiUERweW8vUW82ZFJkSXY5eFBBZ2dKcm9J?=
 =?utf-8?B?TGN3TWRjS0xIcGkybTVDTzZoeWh3ZVk5MDl3V0lHMmNlWm5LOFU2ODZpc0xI?=
 =?utf-8?B?R0VuNm5EeTBVcGpaajNqL3RObTNqclVnUnBybDUrRmMzRlZwcHpWK1VmS2ZI?=
 =?utf-8?B?QkFBNW05cEpNZGlqbmYxdE91NGRZUG5zalJ4WWc4ZXNnWmIyc0kzQT09?=
X-Exchange-RoutingPolicyChecked:
	SoBefd+zk1TLEDiV6C1wrhuDUd55Y/lanobBs2Rlk9Mq4he+hI1a+ol0N5MMs8drkg2aU7637fhDLoDzeDihK9A59u+U/dDOR/PHo+jPNxeE+wxXaSbk+zY64VGfIU5bDmN3pH2MraCwB/45zX9fUz5DQqJxTzwOIWIoqnjFpyPrMnSO9aTx4nQkVJk2v9TfvoeGArOBeXyjBhzmukvJiQHBW8Aqx85Ph68z47p9bcbXJktiq6Evb1pH1I/wc1/AoT0iLlQQU/JxWQYGIjVSuQcacbqQWfD16t67CmTEzPz6uHgT7BNZO+Rr4lchQ6TwT8FQkN/HqhsnFWxXmgJ3Pg==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a59e0cb5-77f9-40a5-29d0-08df138fbd2d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB5981.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 01:13:38.9776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: anzoNRBDmw66vZbskznZb91UIvewaPzewKRZObtGS8bxANecPTeDKIAat1i/nfOVfhPKwA1C4erlj5GpwZ+BXfcdTh7PXAlHrQQOY16zxFI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHAPR03MB989224
X-Authority-Analysis: v=2.4 cv=JekpPkKV c=1 sm=1 tr=0 ts=6aa9ed45 cx=c_pps
 a=GcdpE1at2Es8HfJfZlkF2Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=N--XFCr6TIEc_64PeIT2:22
 a=cjREzs8w_fLJ-t7UBwAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDAxNCBTYWx0ZWRfX82u3qa6WNG7m
 aZETYv4ofF39yRCo9XWZ9c2BlAAfkNiLZg0nOVsNo9QtSo+tRhX9M6ESaz90EOgbTIqBEVULQa8
 h9cNyYwP+BskpYPzPUYcQF+7+m1MszrNbYLbhnEpzHgdzzfC8vbwWawd6TdM/z5LcfvwGV9Vbum
 VJraZ8cN/TjFTjUFLJPez5+E8QTEwuOTuiqhTvUzWwXLFex3tv4qzIGHxgj+gJmxLLYPwcSkhjT
 qo2jN1FLGmwHid3Lg+z6zuUDp1IvAj2cgoGmLPkOS/Lpj6yXn+K6wI+B2H8TFC2JcIQW1UjnsOy
 rlVa0hNki1dHhyYCMnprxPotYmg3HOq872ti9cHHNn6qnF+EwqtJzpz8WC13XULSjiyCS+FyHmV
 qYICH8zjBQf4sFCnjV/BY++rc1CRWt5gK9g1xR7F8+KeUFgI6xCvIIe4XtOGXKiYa2pIDdG8Ban
 DEL4N1kcemgCNoX1SbA==
X-Proofpoint-GUID: XK69AB3vwqw9rhuu48Ash4EdCt1akaAS
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDAxNCBTYWx0ZWRfX/VmehMBOv0hy
 m5vzCEtWsGW0GDch3bNn6w8R9wAqrPcEfs7/QKNdl4l6mGOOjnzBepenOufzOddpgaknxLfrqGH
 McOFqhXOvTn8PagAk02AS/wBYFwimE/o3xekwhtFrdF1VVXmg7d/
X-Proofpoint-ORIG-GUID: XK69AB3vwqw9rhuu48Ash4EdCt1akaAS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160014

Hi Kuninori,

On Wed, Sep 16, 2026 at 12:48:52AM +0000, Kuninori Morimoto wrote:
> 
> Hi Alvin
> 
> Thank you for your feedback.
> 
> > I agree _active() <=> _action() is not an obvious relationship. But the
> > _action() form is just an internal thing to avoid code duplication in
> > snd_soc_runtime_activate()/deactivate():
> (snip)
> > Since it's internal, I wouldn't care too much about the naming. It could
> > also be snd_soc_dai_active_update(dai, +/-1). Or maybe _push/_pop? But
> > even as a native English speaker, I think _action() is quite fine.
> (snip)
> > Most users of snd_soc_dai_active() just treat it as a boolean.
> > changing it from "active" to "count", we would be advertising the
> > internal reference counter, which suggests to the author that he/she
> > should maybe care about it. I don't think drivers should care about it
> > though. Especially for more niche things like DPCM, the reference
> > counter value can be surprising.
> 
> Basically I have no big objection from my side. But I have few concern.
> 
> 1. Most users are using it as boolean. This is OK. But it is count
>    up/down on .active value. It is confusable ? Indeed it is internal
>    things, but this kind of confusion load some issue.
> 
>    I want to rename .active to .count
> 
> -	xxx->active += xxx;
> +	xxx->count  += xxx;
> 
>    But the function is keeping _active().  Maybe _is_active() is more
>    good naming (?), and use bool.
> 	
> -	unsigned int xxx_active()
> +	bool         xxx_is_active()
> 	{
> -		return   xxx->count;
> +		return !!xxx->count;
> 	}

Making it a bool would be an improvement I think. But it will require a
few driver changes, and I think it's out of the scope of your
series. But good you agree with the reasoning.

> 
> 2. From non-English speaker (or only me ?) point of view,
>    active / action are very confusable. The diff is "ve" / "on" only :(

That's a good reason to change it then. And to be honest, I can't give
you a good reason for why it feels OK to me... I guess that's the
problem with English ;-D

> 
> 	snd_soc_dai_active()
> 	snd_soc_dai_action()
> 	                ^^
> 
>    I personally would like to grep related things by same grep.
>    So I would like to use active_update() instead.

I think changing _action() => _active_update() is intuitive and makes
good sense.

>    # Ah, so _is_active() is not good match to this naming...
> 
> 	snd_soc_dai_active()
> 	snd_soc_dai_active_update()
> 	^^^^^^^^^^^^^^^^^^
> 
>    # this is one of the reason why I want to use get/set at end of
>    # function. But is a little bit strange name and different from
>    # traditional naming
>    #	snd_soc_dai_xxx_get()		snd_soc_dai_get_xxx()
>    #	snd_soc_dai_xxx_set()		snd_soc_dai_set_xxx()
>    #	^^^^^^^^^^^^^^^^		^^^^^^^^^^^^   ^^^^

Yea, I see your grepping point. I see from your mail agent that you are
an emacs user. Normally I do a fuzzy projectile grep[*] of the form:

snd_soc    dai_fmt      set

       ^^^^       ^^^^^^ -------- extra spaces for emphasis, I only use one

[*] helm-projectile-rg

and it gets me quite far (set can be before dai_fmt and it still matches).

But agree the get_xxx/xxx_get inconsistency is unfortunate.

> 
> These are not a big deal, and I don't want to start bicycle shed mail here.
> If you have no big objection about above, I will use it.
> If you have, I will use your idea.

No objection

> 
> > As best as I can tell, it's a marker saying that the DAI's .startup op
> > has been called successfully. If it goes from nonzero to zero, then it's
> > guaranteed that .shutdown has also been called. Nonzero is also
> > equivalent to PCM .open having been called, except for codec2codec where
> > there's no PCM.
> 
> Yes.
> 
> > snd_soc_component_active() always follows snd_soc_dai_active(). That is,
> > the following condition is always true:
> > 
> >   !!snd_soc_component_active(dai->component) == !!snd_soc_dai_active(dai)
> 
> Maybe not always ?
> For example, if Component has many DAIs or, Component is used as "platform"
> (= DAI is not working, but Component is working)
> 
> 	component (1)
> 	  - DAI1 (1)
> =>	  - DAI2 (0)

Yes, of course, forgot about multiple DAIis per component.

> 
> > Personally I always found it surprising that DAI .startup can get called
> > multiple times on the same substream. (I think this is just a DPCM
> > thing though?) Unlike .hw_params, here is no new info to act on I think.
> > So maybe the core can guarantee balanced calls of .startup/.shutdown
> > per-substream, and the guards can be removed. Equally for .set_sysclk,
> > it's mostly the machine driver's fault if it does that when the PCM is
> > open. Along the same lines, maybe the core can help here.
> 
> Yeah, agree.
> I will focus to capsuling for a while, but this can be next focus point.
> (Actually I already have next topic, after capsuling)

Of course. I think it's a big/messy topic I'm bringing anyway. I will
look into a bit more and maybe try to submit some improvements if the
idea makes sense.

Kind regards,
Alvin
