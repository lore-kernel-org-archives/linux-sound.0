Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.10.95
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795204074;
	b=TR7lqMQERpjdiJmemLLcDFWUF1JUCawpY1Heg7gDZrmlRDRExYZP/TtLlpWTkdN5tOEV
	 cXKH+IdsJR/meXVvFfxqFtX1/+4hhYxxg2/bfCmrqp8ApJXIt950wsBbB8kxWtu/UzEAe
	 qxnykDZTwWDdLuALn6rygeGk2qAcClk8qDFvxgVheZ4vbFd4sOdSRvh8y/1ARk1qf/2yY
	 3UotOvsyjbTVCyOpNpUuGuGngNOHARW63zDLhZMGms/3OVqokUzsnDS8O3hbU3w9gH/7g
	 aZwVyHs2GoS7KH4ACwTzXibpp0sid2uaf9jXtEoE8xWzYrIVylx9WI6C6P6itUY46lQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795204074;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:
	 X-Microsoft-Original-Message-ID:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SLBlob-MailProps:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=YxDCVRDqOSFjn6rXyTggCjS8gO1LdHL/knK/E1qlKkA=;
	b=yIbeaVitJ8EbvcvsIbuHEcyRkNEA+LrQQf0jtPtX9xBPkFSjxBPL9kYpL+4S5fGSgfd8
	 9PHDKA4FciN2NhF9NbGDZP9XMqYdGBa/TejkK12PWuZJdTFkuZ/3NOaZDjPOghXDBMXmt
	 Kt3d/bVGJY1XGYhLXSpHnCxrKS8PdWCkZH3t6iDGVVGsz5AJYSmpTI1GXtlE5KyYj9+Qu
	 IRSOkUo7KWfd2VwNZtINOH+1zwa3Xqx5ptcy6W/peA0QtO11f+Yw4JDkwRKJe+4LZU0o8
	 3eiP0uYpQ6OKl8WOHdkUoKqTogVXvKRkSCLoE1BqUiiFcN9AJf2drTkoPJW2F7QJsBQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.com;
	spf=pass smtp.mailfrom=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=PKtz4HjA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.10.95
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azolkn19010095.outbound.protection.outlook.com [52.103.10.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE49606A6C3;
	Fri, 20 Nov 2026 19:47:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BE49606A6C3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=PKtz4HjA
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sq7Lr/7hUxy6AN+6bM/vr1vdJLHApS0hUqJZ4/UXIlPCgp+Nz4kdq0xqpWbqiDCJPJN3nwlAjE0qROEpAsALK+9zNvH5dUHlk4Jlsrj/jUhdtF/0syRyThogYCtthgVL+UlvWY3FD7cOwJNVtpjtqWqk74EdCYGXJJybzr4z7wXLKm78cy9UhqAxvLs460m+Iafr7r8Ogd5nFT0IxG5GS77zjxLfZpnS+8w96q1++dFhsTuBj/D3U/S3X12j2NjjqoBeE2cBl0otoK4g2lXScu/HYF15UIp5k9/VBl/ADjqmAsIlsWeD5talFh28ODrZ7ZL4G2bVtLzS4bXy7ZB+9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YxDCVRDqOSFjn6rXyTggCjS8gO1LdHL/knK/E1qlKkA=;
 b=Z2mXS9o6CIPnfYMwN9CEV8q7CcGB62LdzBZJitnrtw4Y2cHeUQPr0Q/Yr3cx9v2G6FwYMvqilVuG3HK4VBP//BDKprk6JvYJdqFBiUiwCO7sWn/KLBJnBSdAua955Aw1dGwH9mdbxY/MyAdE2D8c76D0WiOTik7V+vf9tTIGiaWljaLBAvQYAK/+tImaaquoPZ+e/GkcQT6eN38JBeVGKM+RsDT3Xxrfyrw7vxPV6643F4De7IRITlMyO4gIlb5qVL5O5QMJSN8NkQFShKVwwTaijIAwzamw9tHU+7QqMPqcZUw1e0+WefEiprdrPgnNiMBRF4nr2GD6MOrNQ6ZLjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YxDCVRDqOSFjn6rXyTggCjS8gO1LdHL/knK/E1qlKkA=;
 b=PKtz4HjAUIqKa+TRLgxngRhU8I+jb3kyrU51ByiJxVfoZFtloBleJBvBemCffuVTN38nS3P1yXVFfaF7/6lUqGMt7wrYmBGxOgkjmq9v94GkM9IlOt1jYt98BB6UWSwp5tC5b7gMSX/bLty+Gxp4eIwFUGvuuP/YeDiGd9V4yQEtuKpO6fESQFelGm9LfD0gsONIfveEBQTtSNYmX8VoJw2hWWt5B/G6tiKrMQZ3vyREbkbGeqUF1YIiysr3MIsZd3hNBxUWNgrFZa1kstTlovR2ILl6LwVlXy/czkxTrNLctRXEtdpTAgMzfheSy4Ht12oDuDRQFCwgkjani3mZvw==
Received: from LV5PR84MB4026.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:408:2fb::15)
 by MW5PR84MB1665.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:303:1c0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Fri, 20 Nov
 2026 19:47:42 +0000
Received: from LV5PR84MB4026.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::9151:9e8:f98a:99e5]) by LV5PR84MB4026.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::9151:9e8:f98a:99e5%6]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 19:47:42 +0000
From: Perry Dale <techluddite@outlook.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Perry Dale <techluddite@outlook.com>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 2/2] ASoC: qcom: q6apm-dai: keep a playback stream running across a PCM reset
Date: Fri, 20 Nov 2026 11:47:25 -0800
Message-ID:
 <LV5PR84MB4026E23CD27421FEF1D8B373A7782@LV5PR84MB4026.NAMPRD84.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <LV5PR84MB40268B01B9F458296BE453ACA7782@LV5PR84MB4026.NAMPRD84.PROD.OUTLOOK.COM>
References: <LV5PR84MB40268B01B9F458296BE453ACA7782@LV5PR84MB4026.NAMPRD84.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0205.namprd05.prod.outlook.com
 (2603:10b6:a03:330::30) To LV5PR84MB4026.NAMPRD84.PROD.OUTLOOK.COM
 (2603:10b6:408:2fb::15)
X-Microsoft-Original-Message-ID:
 <20261120194725.4088815-3-techluddite@outlook.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR84MB4026:EE_|MW5PR84MB1665:EE_
X-MS-Office365-Filtering-Correlation-Id: 521d324a-e03d-4861-18b4-08df473f23c2
X-MS-Exchange-SLBlob-MailProps:
	qdrM8TqeFBvhuFgLLe5qs4jWk9CHdv0AQEIpEXbEjM+eiwlH8NH8IGd2xVlDOaSb8bBYOhIt2GRtskjrY5NpjEWEwexEtLN9VmZ8Y0IIktVkFZzNOglW7UEwjRQyyoQgs1UAgfCqwdk5gueY7tIRE6gUZE5C0jajj3+M/9Axu2d5YNepdAzfzwchwBUlx7n31OADS/djIVz2iy91fsiyATJtSZHGndEttwY7ZMGbav0FO6TKdaGlM4LOzgNkStRXJRhoJqzvA54MXVKhvd7va80fzu8RS3f9X/NWChItMHAH/9iKwkG3p9HcxL4gNJVJr2Htx6cfYcHlrjAOIoWt8meP1wMpogHAXEObc1W633Z98zhbk10lYhdYFT0apkAS1mUABSQ1SFlEZMC2B0nLuH/kKAtmLMOVrIfJkiswLs0kbljAeDKwgjohVfUL5kKfn+ETsxBHiLp0V4GZvKzusrrJT/NE/omjUumSFOEo3koCYubPsvPZpAwY8tv1eIv99yWvoQUr3+MAxDEz1Q4Kstwx2KCmbpsNbsmv36TT/pzrvLflMHrFJP3i2RJ1vcnZgUL8xCVwx/hy0WUinpJzNRfX7JXeZ+J2hcSrWVGOqpAxruu7HaJ+1eYi0qOEvtpXqRyBlzyiuyprkIobybrwRvdHJoPzzzdSGUAQwVBv8cm1KUTTQ9jWjPILWtAl6VKwH3jv5tNcwicTlulKDp2RNjElIVjGXXh1Nxvm4J44E8zwjB9r4m3+IlYQnUUua3xmpa+LIuWI2PustHtXVtQnVqn2tcgGUHab
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799015|5072599009|51005399006|25010399006|23021999003|15080799012|12121999013|24021099003|19110799012|260925184616899003|21061999006|41001999006|12091999003|40105399003|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WmF2FxqMnRgmBW8reWj2U7kJnEVwSQSp/hYMlHKVKtfggxpovMu+Nbzhu7Gv?=
 =?us-ascii?Q?yP5GfvRnUR84o2v4ZoMGWJWh5cCRQLX2I0jwx5v86XoEOpAdz1Lqk5yb9aq9?=
 =?us-ascii?Q?J1uS/a+334fa5D6I4BQQStRtrTtHGxJnTSogqZz09A1Ef6P+1RYHqQMON7b7?=
 =?us-ascii?Q?fPmNdmjiIKy+0sQdsTX1KgJ/VhFt0Pm8quigLVPDv5B4+KajWStVYvU1HE48?=
 =?us-ascii?Q?U9XJrcP6Sj/2H+/PaqszohKHBinlrspRJ0bYnuaszb3qB0x5xGttuNvCDoP9?=
 =?us-ascii?Q?dvcEpM4gSOpmSUFiYne7IfaN2KLIDxO+/vtWgUt8KJxyGvWOaXz5L+KnqB0T?=
 =?us-ascii?Q?Q1vnXFaK1y2BiQ8i2OHuaES4quJQrzIppiG7RXbb9VcWYjTcfUjBi28vxgUb?=
 =?us-ascii?Q?pU8EZbOUVzgOk9fSjT5JRwqFlTeMvwZBFiJn34T+SPP50lMfEo7WL5va6vAA?=
 =?us-ascii?Q?mClMQqdAEGUflAWCmlFRuylSeMBTgTH3JayeWmDdUk5Gmi3ltwwqw2q5RGSd?=
 =?us-ascii?Q?0TR+57gERJTcU3N7b8moD6OBEdITLZHBq2YlMcVGlBQsNftQNIRh4fsw7UUP?=
 =?us-ascii?Q?l0PVqc70r1LuEersyMd9hwTYbxcItzFcMxlcICxSHlR8p/7mTvondXFCzslH?=
 =?us-ascii?Q?3Wzh18se3Z8eLye98vuYLdORDJ/enmY+DULSth/Xpa5C+pPQR4lkqfz71J1d?=
 =?us-ascii?Q?YY6bi4qnRoADf/jGB3+rXfemDTYRzAe+SDWvX9upk/ihTzCpHGQQDqA5Rd/o?=
 =?us-ascii?Q?kMD0fariRcYYaP24Ejx4zhXbPuS2rl5/4IzR7MaNrPPRhoBb4jXuQCk8eZ9u?=
 =?us-ascii?Q?nxLjhC9n8f8a+NxU4KI+k/fb1Mg5Nph2ibNBss4BafurJmR6S5AXEfX6rWmQ?=
 =?us-ascii?Q?2XepmgMp9VHwwE3WbfQf/zAB4dHSsds39dFKGKCFDrd8f4z2ZMuZYQytNSLh?=
 =?us-ascii?Q?7zvGOCmugSYBPtdsuohM5XvQbtAo5WSgTpHR/ZHyNIpeWvsr3pbnyY+BHR7a?=
 =?us-ascii?Q?JB4R8FyeM18+8ARjM9d5UfjVwlA+dorh35uzSu6vAjovBSN0cLVxmmN08R2k?=
 =?us-ascii?Q?GZ/nx234ps9v0pfPujDis1/vhj+r8wQHp50S5MAYzCcs+MUsemQ=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?poPtisqyLTNl1HAanmDN4AFCUlGldhvymeW9g8mgfpQWdmd5PsRKw0NnZI7c?=
 =?us-ascii?Q?wmoQLZU/AMYFzt7vN6WTMyk3NBqjCTqV3VG7v8UkQNwcmyhBvl8ymw1Ur3JS?=
 =?us-ascii?Q?h/Qje+7sAqa75Z/gGPU02XGGgSmqtHnI+d9xshnliXvPKVg9pvLMPHpKL/V0?=
 =?us-ascii?Q?wNPr/EOASIsFvZH3MQNGO8c08sjzvkILpANzdxIdd/6+1NOwKoaWEdPw2bM+?=
 =?us-ascii?Q?LVM2nb8uUbWPFzo+qQYf7plitdpFajEXQUkdvCD8CehnBijzVAaPgXCGClxk?=
 =?us-ascii?Q?ECzPbSH9t0Jpq300jowtKuLKIOBdFqKpRk2zKSm+n3x0MPZwWdcDh4kY5Q4U?=
 =?us-ascii?Q?Pfz4ri29mnYAjsxUtz8Y+fJ1I+7YgOyqCcF9bVZDXMogJfH9c0Gy3GV7voMq?=
 =?us-ascii?Q?U9XXZcNeJcdrHiIpbyLAwIgrKmAaOLFx0E6oWwXi6tGJ3GaarIyFjJYuzUzj?=
 =?us-ascii?Q?1hXsrH9nV69gtM9JUizVtSHRSxKcFenojOZ42K/JXry4TLNbaRsFpshMdiM0?=
 =?us-ascii?Q?k2QGoyonnTZhrm1Y/jGfrANkvfd6obzwSukk7U6Gk/vc05KKfUXXTiq20zFS?=
 =?us-ascii?Q?bsHWuFF//+u3FwEyi7TS0eZFV6tq6ROcPCoO6zT0y/MQTRqaB2f6BqyVOMO3?=
 =?us-ascii?Q?uHJ3uRYVCRcRzVD6DUI+KHT/GWqHP+faYKzu9aFgWpogKS92WZTmRdNS/DP8?=
 =?us-ascii?Q?hPrKVvQZMcVA2R4GwecPUBgNKEzI0KNS1JCXikwdgIJAlYPJuB1pNuaQ0wbL?=
 =?us-ascii?Q?J09kLxjzGhAT7UdRyuqVScGsDWOWqPuFfLX5z0HrwOfp45jogBN2zIa6pQG9?=
 =?us-ascii?Q?HYOdYjnxYYlgA0pEfeOfRT6+/tWCB/0HKEKS09P+sKeqs12YxhfB+yiJU5dg?=
 =?us-ascii?Q?A2vijUFxRMVNRc7bTYhBTV5jXNcKZfJio1t6xKzlwSqmhpFLslQiLTrVQzfu?=
 =?us-ascii?Q?dQxVLXmvFy6dB5vjpWtL2GogPjQ/JOzq20x0Sj2+IJXMP00I0+ZVWaNz0c0q?=
 =?us-ascii?Q?a/hUiKJ/j9XkuJstJd6uGKyYIqGT0RMvtf7gSvNKPV1Dem3EkVllVv6gJDn2?=
 =?us-ascii?Q?5dc/NAgL5Nqqsz9s4j1hYxySR0oUhdkSIVhERx8vU1W+TvqczErv/nABI9UX?=
 =?us-ascii?Q?RRhoYBAiMhJkv8Y4glDsNtbqYznHrKGHe4+q/ePSltYm6hm/ms9YbWANIdqg?=
 =?us-ascii?Q?AqkwiL+5sdAI2nRvYr0v54qTSPAf+FQP4xbDEOLb5bMm2vW9KDWWGqDgIK+i?=
 =?us-ascii?Q?wj8XI3Ai1D+88vWUZkXtd9sRn9gBGCrvr3cm27D60n4tlomXGVHfV4WDe34u?=
 =?us-ascii?Q?JQvPke7IV72bAJGXiiFsGdaihzYiCoMDNMpMnjgUiXL5rldA1gvf3tingtGu?=
 =?us-ascii?Q?gxOLvB8wcQujkguMZ/gcTYdi6I+9?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 521d324a-e03d-4861-18b4-08df473f23c2
X-MS-Exchange-CrossTenant-AuthSource: LV5PR84MB4026.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 19:47:41.9799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR84MB1665

SNDRV_PCM_IOCTL_RESET sets appl_ptr to hw_ptr. On a running stream it
first reduces hw_ptr modulo the buffer size, otherwise it sets hw_ptr
to 0. The period buffers already given to the DSP stay with it, and
queue_ptr keeps its value from before the reset. Once that value is
at least a ring away from the new hw_ptr, q6apm_dai_ack() queues
nothing, the application fills the ring and the stream stops advancing
until its next prepare.

Count the buffers the DSP holds. A buffer is added when it is queued
and taken off by the write-done event, under the stream lock and in the
same section that reports the elapsed period. Prepare clears the count
when it replaces the buffers.

Handle SNDRV_PCM_IOCTL1_RESET in an ioctl callback. After
snd_pcm_lib_ioctl() has moved hw_ptr, give queue_ptr the ring offset it
had, relative to the new hw_ptr. The next buffer handed to the DSP is
then still the one after the buffers it holds. That offset is 0 both
for an empty and for a full queue. A running stream with every buffer
queued continues with those buffers, and what the application writes
over them is not queued a second time. In every other case with offset
0 the queue is taken as empty, and what is written from there on is
queued as buffers come back.

Move the queueing into a helper that both .ack and the write-done event
call. One call queues at most the buffers the DSP does not hold. The
limit of one ring per call did not account for buffers already queued.
With that limit a write can find no free buffer, so the event queues
what is waiting when a buffer comes back. Without it the data waited
for the next write, which never comes at the end of a stream.

The helper measures queue_ptr against hw_ptr and aligns it in the same
way when it is not within one ring ahead. hw_ptr passes queue_ptr after
a reset before start with every buffer queued, and a reset on a paused
or suspended stream can leave the two apart as well.

A send that fails now stops the stream with an xrun. The core has
advanced its buffer index by then, and only a prepare brings it back in
step with queue_ptr. Before, the error went to the writer and the two
stayed out of step.

Not changed here: the graph keeps playing while the stream is paused,
so a reset on a paused stream can skip the first period written after
it, and a write-done event that the core drops leaves the count one too
high until the next prepare.

Tool use: written with Claude Fable 5.2 (Anthropic), run in Claude
Code, from a prompt asking to carry a running stream across a reset.
The tool wrote the change, the test program and this changelog, and
revised them after reviews by Claude Opus 5.5 and GPT (Codex). Built as
a module for 7.4-rc1 and run on the AYN Odin 2 Portal (SM8550) with the
test program of the previous patch. Five resets in a row on a running
stream, a reset with the queue played out in the second lap, a reset
before start with two periods written, and a reset and rewrite with a
full ring queued before start all continued. The cases of the previous
patch passed, and the DSP kept answering through every run. A debug
build that failed two sends during PipeWire playback stopped the stream
each time, and PipeWire restarted it.
The test checks that the stream advances. It does not check which
samples the DSP plays for the buffers it held at a reset, and it does
not exercise the boundary wrap or a paused stream.

Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Perry Dale <techluddite@outlook.com>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 156 ++++++++++++++++++++++++-------
 1 file changed, 122 insertions(+), 34 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index d0d19fc38..e4a6817ee 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -91,6 +91,8 @@ struct q6apm_dai_rtd {
 	uint64_t copied_total;
 	uint16_t bits_per_sample;
 	snd_pcm_uframes_t queue_ptr;
+	unsigned int in_flight;
+	struct device *dev;
 	bool next_track;
 	enum stream_state state;
 	struct q6apm_graph *graph;
@@ -236,6 +238,8 @@ static const struct snd_pcm_hardware q6apm_dai_hardware_playback = {
 	.fifo_size =            0,
 };
 
+static int q6apm_dai_queue_playback(struct snd_pcm_substream *substream);
+
 static void event_handler(uint32_t opcode, uint32_t token, void *payload, void *priv)
 {
 	struct q6apm_dai_rtd *prtd = priv;
@@ -249,7 +253,13 @@ static void event_handler(uint32_t opcode, uint32_t token, void *payload, void *
 		prtd->state = Q6APM_STREAM_STOPPED;
 		break;
 	case APM_CLIENT_EVENT_DATA_WRITE_DONE:
-		snd_pcm_period_elapsed(substream);
+		scoped_guard(pcm_stream_lock_irqsave, substream) {
+			if (prtd->in_flight)
+				prtd->in_flight--;
+			snd_pcm_period_elapsed_under_stream_lock(substream);
+			/* The returned buffer may be needed for data already written. */
+			q6apm_dai_queue_playback(substream);
+		}
 
 		break;
 	case APM_CLIENT_EVENT_DATA_READ_DONE:
@@ -363,6 +373,10 @@ static int q6apm_dai_prepare(struct snd_soc_component *component,
 	}
 
 	prtd->last_pos_index = 0;
+	/* The graph gets a new set of buffers and starts with none queued. */
+	snd_pcm_stream_lock_irq(substream);
+	prtd->in_flight = 0;
+	snd_pcm_stream_unlock_irq(substream);
 	prtd->pcm_count = snd_pcm_lib_period_bytes(substream);
 	if (q6apm_is_graph_in_push_pull_mode(prtd->graph)) {
 		if (prtd->pcm_size != prtd->push_pull_size) {
@@ -433,14 +447,39 @@ static int q6apm_dai_prepare(struct snd_soc_component *component,
 	return 0;
 }
 
-static int q6apm_dai_ack(struct snd_soc_component *component, struct snd_pcm_substream *substream)
+/*
+ * Give queue_ptr its ring offset back relative to hw_ptr. Called with the
+ * stream lock held after hw_ptr moved without it.
+ */
+static void q6apm_dai_align_queue(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct q6apm_dai_rtd *prtd = runtime->private_data;
-	int i, ret = 0, avail_periods;
+	snd_pcm_uframes_t hw_ptr = runtime->status->hw_ptr;
+	snd_pcm_uframes_t ahead;
 
-	if (q6apm_is_graph_in_push_pull_mode(prtd->graph))
-		return 0;
+	ahead = (prtd->queue_ptr % runtime->buffer_size + runtime->buffer_size -
+		 hw_ptr % runtime->buffer_size) % runtime->buffer_size;
+	/*
+	 * The offset is 0 both for an empty and for a full queue. A running
+	 * stream with every buffer queued continues with the buffers the DSP
+	 * holds. A paused stream can have them played before its hw_ptr moves
+	 * again, so a stream that is not running queues what is written from
+	 * here on.
+	 */
+	if (!ahead && snd_pcm_running(substream) && prtd->in_flight == runtime->periods)
+		ahead = runtime->buffer_size;
+
+	prtd->queue_ptr = (hw_ptr + ahead) % runtime->boundary;
+}
+
+/* Queue the periods written and not yet queued. Called with the stream lock held. */
+static int q6apm_dai_queue_playback(struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct q6apm_dai_rtd *prtd = runtime->private_data;
+	snd_pcm_sframes_t ahead, pending;
+	int i, ret, avail_periods;
 
 	/*
 	 * ALSA calls .ack whenever appl_ptr moves, also after a stop and
@@ -461,37 +500,84 @@ static int q6apm_dai_ack(struct snd_soc_component *component, struct snd_pcm_sub
 		return 0;
 	}
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		snd_pcm_sframes_t pending = runtime->control->appl_ptr - prtd->queue_ptr;
-
-		/* appl_ptr wraps at the boundary before queue_ptr does. */
-		if (pending < 0)
-			pending += runtime->boundary;
-
-		/*
-		 * What is left to queue is part of what ALSA holds for
-		 * playback. It is more when queue_ptr is ahead of appl_ptr,
-		 * as after SNDRV_PCM_IOCTL_RESET, or when appl_ptr was moved
-		 * more than a ring past hw_ptr.
-		 */
-		if (pending > snd_pcm_playback_hw_avail(runtime))
-			return 0;
-
-		avail_periods = min_t(snd_pcm_sframes_t, pending / runtime->period_size,
-				      runtime->periods);
-		for (i = 0; i < avail_periods; i++) {
-			ret = q6apm_write_async(prtd->graph, prtd->pcm_count, 0, 0, NO_TIMESTAMP);
-			if (ret < 0) {
-				dev_err(component->dev, "Error queuing playback buffer %d\n", ret);
-				return ret;
-			}
-			prtd->queue_ptr += runtime->period_size;
-			if (prtd->queue_ptr >= runtime->boundary)
-				prtd->queue_ptr -= runtime->boundary;
-		}
+	/* Frames queued that hw_ptr has not passed yet, at most one ring. */
+	ahead = prtd->queue_ptr - runtime->status->hw_ptr;
+	if (ahead < 0)
+		ahead += runtime->boundary;
+	if (ahead > runtime->buffer_size) {
+		q6apm_dai_align_queue(substream);
+		ahead = prtd->queue_ptr - runtime->status->hw_ptr;
+		if (ahead < 0)
+			ahead += runtime->boundary;
 	}
 
-	return ret;
+	/* Nothing to queue until appl_ptr has passed queue_ptr. */
+	pending = snd_pcm_playback_hw_avail(runtime) - ahead;
+	if (pending <= 0)
+		return 0;
+
+	/* Leave the buffers the DSP still holds alone. */
+	avail_periods = min_t(snd_pcm_sframes_t, pending / runtime->period_size,
+			      (snd_pcm_sframes_t)runtime->periods -
+			      (snd_pcm_sframes_t)prtd->in_flight);
+	for (i = 0; i < avail_periods; i++) {
+		ret = q6apm_write_async(prtd->graph, prtd->pcm_count, 0, 0, NO_TIMESTAMP);
+		if (ret < 0) {
+			dev_err(prtd->dev, "Error queuing playback buffer %d\n", ret);
+			/*
+			 * The core has moved on to its next buffer. Only a
+			 * prepare brings queue_ptr back in step with it.
+			 */
+			snd_pcm_stop(substream, SNDRV_PCM_STATE_XRUN);
+			return ret;
+		}
+		prtd->in_flight++;
+		prtd->queue_ptr += runtime->period_size;
+		if (prtd->queue_ptr >= runtime->boundary)
+			prtd->queue_ptr -= runtime->boundary;
+	}
+
+	return 0;
+}
+
+static int q6apm_dai_ack(struct snd_soc_component *component, struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct q6apm_dai_rtd *prtd = runtime->private_data;
+
+	if (q6apm_is_graph_in_push_pull_mode(prtd->graph))
+		return 0;
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		return q6apm_dai_queue_playback(substream);
+
+	return 0;
+}
+
+/*
+ * A PCM reset, which ALSA also runs at the end of every prepare, moves
+ * hw_ptr: modulo the buffer size on a running stream, to 0 otherwise.
+ * appl_ptr follows it without a call to .ack. The buffers the DSP holds
+ * stay with it, so keep queue_ptr in step with the ring.
+ */
+static int q6apm_dai_ioctl(struct snd_soc_component *component,
+			   struct snd_pcm_substream *substream,
+			   unsigned int cmd, void *arg)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct q6apm_dai_rtd *prtd = runtime->private_data;
+	int ret;
+
+	ret = snd_pcm_lib_ioctl(substream, cmd, arg);
+	if (ret < 0 || cmd != SNDRV_PCM_IOCTL1_RESET ||
+	    substream->stream != SNDRV_PCM_STREAM_PLAYBACK ||
+	    q6apm_is_graph_in_push_pull_mode(prtd->graph))
+		return ret;
+
+	guard(pcm_stream_lock_irq)(substream);
+	q6apm_dai_align_queue(substream);
+
+	return 0;
 }
 
 static int q6apm_dai_trigger(struct snd_soc_component *component,
@@ -547,6 +633,7 @@ static int q6apm_dai_open(struct snd_soc_component *component,
 		return -ENOMEM;
 
 	spin_lock_init(&prtd->lock);
+	prtd->dev = dev;
 	prtd->substream = substream;
 	prtd->graph = q6apm_graph_open(dev, event_handler, prtd, graph_id, substream->stream);
 	if (IS_ERR(prtd->graph)) {
@@ -1229,6 +1316,7 @@ static const struct snd_soc_component_driver q6apm_fe_dai_component = {
 	.pointer	= q6apm_dai_pointer,
 	.trigger	= q6apm_dai_trigger,
 	.ack		= q6apm_dai_ack,
+	.ioctl		= q6apm_dai_ioctl,
 	.compress_ops	= &q6apm_dai_compress_ops,
 	.use_dai_pcm_id = true,
 	.remove_order   = SND_SOC_COMP_ORDER_EARLY,
-- 
2.56.0

