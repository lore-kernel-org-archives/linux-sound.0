Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazolkn19013045.outbound.protection.outlook.com [52.103.14.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FEDF3502A5;
	Mon,  3 Aug 2026 21:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.14.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785792403; cv=fail; b=NHpxOnEYP9FBdGOj3sX/lEc5bcE1jE70Tw6bGcOhd7jAP4gp5lLNdJDobAOQCMSnCQKcqpY8av+rVtaynfAFOE6z+HVTsRUkhkG93QN2iUyN2UYPoO3iA9FFkCcuCVgDuZKnH/e7nBVCaasJStFebq9gBSnSfLkgNhMyXftfYlg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785792403; c=relaxed/simple;
	bh=Ce0EOYvQdDL2G19ALLbWWiVXFUkXVdZ4JNJ9bAlwgl0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=M79Bfjc1mLzG/UY6TDGTeH9WWudjF6fW66Jb9m4c8H5ilo/hCSbHKHDYU+OqpcD8I1KFSh9927ghw8S76V5MFoK9W7U/W8zTh7yyMGcatwPTCnB4VQ29sJHohTe2JwVZqX53tq0hJFM7X954YqSBDYvs/tzSNtJl66UxHxg51JI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.it; spf=pass smtp.mailfrom=outlook.it; dkim=pass (2048-bit key) header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.b=eeY4LTfF; arc=fail smtp.client-ip=52.103.14.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.b="eeY4LTfF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NSeXo8lAEVUefqQrVgLvFVm+DfymCImfM3KUQW5/qucDkKt6lqESOIE0c2xKmTKBY5uD9N9PAj5eZj0xuKhKDt413qIAgZVMyqLQ1R/4qHKfF1k/8pBvTc8YNCa1lf9veuwEYMJuiRqkHaJvT3Zx2MObu3nG7aLmyYCBZrz7MtnTtHy+piz7j/uGf2BiD1HuIG1QK358ayik4Opv4wD9FfMpv9M8En7bB9AIr/Jwf+Snp6kbZNnkw6iFW6Oa77c+ixgNbADOiUgBiPCspeloYm6O6VJBjdUfwKwO/smNNI3NqHkP3JIGwzeDj2YSKr9UESQ1O1VdhjvzgXoCqZ7OuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ce0EOYvQdDL2G19ALLbWWiVXFUkXVdZ4JNJ9bAlwgl0=;
 b=s879ytfBpqs7oi+LVT142D2jhfNXt6v7sw0XhLmxJJRCbJEIPldcZTKf57jSEujhTr4JbNC9bwTcwbd/uI9c2oMkTPLbjYzt8XHvlXO90S3+Ae1GTvDwL3y4rHQcZ/Ux2ycn55YvJX1Vgy3QkP7jZu1tYj20+AOXMqSyCQ2mXGYKkEUFsvmuuJnlRT5HahoY82pmmtSlKJgG7AZbWPGC01D1PKKHl3F8DntjFCN6tTTR7J61cuzvzSPaFFXPcAz07ZI196oVs+TCS8V4lE5SdgBCEUW6hHZdB1aO3buyyeyErKYicyqjW2qCZJKCHRY/b4BMtBZuFKRDXIEwxeWhLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.IT;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ce0EOYvQdDL2G19ALLbWWiVXFUkXVdZ4JNJ9bAlwgl0=;
 b=eeY4LTfFUVlDTSX+OeMxwWUnwyc2bV+FMd4Bxgm8BW3DFybjsJkuwsPRxTMPPQeVrbPdocjWSIFMnytDh8HskCcXFjtfeE8QVCNqs+H2sKTMvXq2ex9ijM5hA5lEKQyfl0ci6sK5Nxoem5y3DJHeIJ/queF8BDt4gEm6Z+qYhd4UkJs9b0Z9l9nWUNFPQ9iTLZ/LB3xsH0EqyWw8w4Jco2f8uWy39e3E0QyZSePpV3wxPHF9qDPamJXJTtNkxZUsFz6Ag+aPy8lwWjiVOcvw4IfqOuzgpL8xkY+33d+j/ILaGW6s5Zi2nwoaTzGbVirSD1tNUaP2V2jTAqp7bUhyQg==
Received: from IA1PR19MB7712.namprd19.prod.outlook.com (2603:10b6:208:3db::7)
 by SN7PR19MB7598.namprd19.prod.outlook.com (2603:10b6:806:34b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Mon, 3 Aug
 2026 21:26:40 +0000
Received: from IA1PR19MB7712.namprd19.prod.outlook.com
 ([fe80::3e3c:51e1:5e00:be4b]) by IA1PR19MB7712.namprd19.prod.outlook.com
 ([fe80::3e3c:51e1:5e00:be4b%5]) with mapi id 15.21.0270.016; Mon, 3 Aug 2026
 21:26:40 +0000
From: Marco Giunta <marco_giunta@outlook.it>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	marco_giunta@outlook.it
Subject: Re: [PATCH 1/3] ALSA: hda: aw88399: Use auto-cleanup for put_device()
Date: Mon,  3 Aug 2026 23:26:14 +0200
Message-ID:
 <IA1PR19MB77123CDE718748E9109665F3FCD52@IA1PR19MB7712.namprd19.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803140100.919071-1-tiwai@suse.de>
References: <20260803140100.919071-1-tiwai@suse.de>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI1P293CA0017.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:3::13) To IA1PR19MB7712.namprd19.prod.outlook.com
 (2603:10b6:208:3db::7)
X-Microsoft-Original-Message-ID:
 <20260803212614.9548-1-marco_giunta@outlook.it>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR19MB7712:EE_|SN7PR19MB7598:EE_
X-MS-Office365-Filtering-Correlation-Id: 44fbea2f-af84-4689-5bcd-08def1a5e7a1
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|51005399006|15080799012|8060799015|19110799012|55001999006|24021099003|23021999003|25010399006|5072599009|40105399003|2607281247196008|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EjSQvma5m3yqk0VfEf+XUqsRrSusytlr/b/eP36wsYkltQtnk5s7ANMiGsyc?=
 =?us-ascii?Q?WM5I7peTSeaN30xPpCQA6Sh41W8UaQDVxBCjKVk7+8bZAIGYzu1Apim2Nipz?=
 =?us-ascii?Q?hTE7oW1r3e/Xptgx73L7kBnqowLGg7luspD1T4X4kB37EWBkesg/KbAkzArm?=
 =?us-ascii?Q?yCj1opJIpq4g7VVp7Bz1DG08O2XpOOl7yirLanHg64HlXSYdkwtGSDtAmnNF?=
 =?us-ascii?Q?Vn5EnfOGDGlNhwQvWRBtkH7d8JVaLBRZ7DNzSc8+GdJuHP126oc7aV2nt2kG?=
 =?us-ascii?Q?eWPZ53m7FOYB9ipae4VAXYuLe8v6Lwha6qIsE0AmQ1uzPyaL3c+Ii/SbJeta?=
 =?us-ascii?Q?QWoRtMmdxLpitQO5XscaEv2ko18NsdEcZXZFpBsQ71oKx0fB3FpbUo8mvKpF?=
 =?us-ascii?Q?FqmfK0XZm78fSvqgLQOfVOSq+MUYJkN3TlF8ZUiKh89lgoCR+deMQBCp1ayW?=
 =?us-ascii?Q?CxyM+41oShdp8L++q06vtUXa6A0OuJ2tyDRdC+edG1W+xK7HqDRSmFbsSoPn?=
 =?us-ascii?Q?Fq51YY4FZjFoNOG7EUKzGcX5htsME7nQUAr+Yqmnj6/b+XsJ8o6MQnleP/J5?=
 =?us-ascii?Q?WAOG5K8UvqA3dq84szwYIXHtPf9jwFJL/ZzsO66CU8F02czUareX4IwIiRaV?=
 =?us-ascii?Q?yl2jPho0B0AKndlNt/BAr7PPiwewoVpTNjCJHlVZPh3iGKcoutMk/kankgv4?=
 =?us-ascii?Q?KvzWq9z7w+vSdYkSsrps5TJS90RSnoYzEQTqtvNb/xBzspJC8KPKpOukErSc?=
 =?us-ascii?Q?vr7QHTo+YGfXm45rmi5j0iYLddg3SAY2k3RJUWufwTvBoHWs3vMWPk1dT4ED?=
 =?us-ascii?Q?xLcMysZk1LKtpbjgPsDrqy+wuZFu1kBn1GHlYlXueDIyUxpDU7uLy0WbD37P?=
 =?us-ascii?Q?D32yg1gQO7yUegdxo+oXIS2FkeFOWbFk3+8Tz34HhKmIBsA9zL4TBUNB0ICd?=
 =?us-ascii?Q?csZG6YZ5S/aEGqIj+Dw5vPRMqFNfLTiVxd9kB/7SinDjBeIPiI2KPwOSG47K?=
 =?us-ascii?Q?zqvz?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HgZoHKOKaQpEgubA9y8daPPGNaKBo6ukZv3SDZiSlqPSOKCR9w4vTlbbjJ31?=
 =?us-ascii?Q?B2YKZGYCxRUO+ltyPNWTTakb8ayTtl5ly2cjshH7At4dCMBR9kkB2R5+TAPG?=
 =?us-ascii?Q?IoLDsjUBxZGPWmDQ5uendcqmrGozoh2WRzW2ijRSxFPuWm6BrOXfjqW/XRd7?=
 =?us-ascii?Q?7kiTj+Rr/nLAngM+aDWT4XAmOwyPqI+U1kfxzpPrR8p8jV+l4oNOFatxe/VM?=
 =?us-ascii?Q?yR/HLENl+6400cud4jnt1pAdfw0qPw2lEX9M1Q28NkTwc6sLJJ7ZT9xHjieC?=
 =?us-ascii?Q?Te9CymxPXTTyXA1BUL/P+q3I9918W8Dp+cXuEKClnX/jNyqqvVsAbgbm0IFt?=
 =?us-ascii?Q?iAw6hIB4T5Lk3PkGYqezSuQF24XPcTNknHqceBA4U0of3HOzFmYezD1eHvjQ?=
 =?us-ascii?Q?epoBX5WFdmCvp/9N+0wLejTNvYg1z56PUwg1xd8vDwuCng8g6WHCZe16DaLZ?=
 =?us-ascii?Q?yzQqc83pTqQobtJ+yGLFO4YuKw1/aMWd3SBWsb0raG96SXHWkx0qtcPOgY8P?=
 =?us-ascii?Q?uLkfeYljwDNOghHpfJErgmXVV4IDgbUZKLRJOGciS0hNimo4xjLR+0oiId8v?=
 =?us-ascii?Q?oPUlMs3iU7NGg3lk1wQJuNLMWbgFnJi8cuw/7sy9GFAMKVKHwWUiCVpJkv86?=
 =?us-ascii?Q?ttJm6C9bfHu2J6lBvmseuEfeFWjEfzaFhoGOEep4mSc797+vKsoVCydnQl3W?=
 =?us-ascii?Q?Km3yvUadGKtUEOe/miulG1obsvmOurIMjUygZij/LUv9mTbEPThYW22U+RGQ?=
 =?us-ascii?Q?CoDhBh0sxvHXIHfrIZYS9ViHWI6FPlIR0RoYIehKO9N2m+kGUnnl4eCStgTO?=
 =?us-ascii?Q?NntjsS5A6S5bsoY1xqPkSKwyP75ZI5PD7ZwfwxArukgzn1EdRyc687FB8VDk?=
 =?us-ascii?Q?I86xDOxRydRZNEaRVcH4HlB+ZwOU/NjpRp5pYNPMTydiTF03kLmzHq3Dy1D3?=
 =?us-ascii?Q?m7z+gvariOsBVq4Ib1zrdsUkBrUG6bsCNtReoHVZZ6Lx22u7R4qCyw14YL8Y?=
 =?us-ascii?Q?0Ajqk0rWgBXamZpvkJjXbRswJPaLRkVgnxMOLRSPgfcBBAzv8eunrw5+/0zH?=
 =?us-ascii?Q?W4waylkAy2kp9/bZr3emX5AAvm756d6ZMUK2pJDXaj5v1hrYxwNmxSRM6W4/?=
 =?us-ascii?Q?77RCxENPhxKW9OeVwBZcKYwt+DpxfBycKJJ24MToFp82OJxrl/ahvcEHWk/h?=
 =?us-ascii?Q?KWBQcaooMC41ZIJdOnxnSNdqC/Fk94KiBY50HC+dgrETf5W4ny9I6Xd94X4N?=
 =?us-ascii?Q?Q3ALW+x0KJhf8pPMW+5PLT/rwz+gK+8M/7I/D5NOHsbTGBJNeE1AWKwMqbST?=
 =?us-ascii?Q?WaPwJuuhH8JGXLu4IRu7tUmKZTd+944/g37jDRGE1YVxz+IDN12II0oiur00?=
 =?us-ascii?Q?x1B9uKQA2tb3u6NY8dU7fVVJriFT?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-990eb.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 44fbea2f-af84-4689-5bcd-08def1a5e7a1
X-MS-Exchange-CrossTenant-AuthSource: IA1PR19MB7712.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 21:26:39.9289
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR19MB7598

> A temporary refcount management of a struct device can be done
> gracefully with __clean(put_device) for avoiding potential leaks.
>
> No functional change but just a code cleanup.

Reviewed-by: Marco Giunta <marco_giunta@outlook.it>
