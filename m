Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.10.95
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795204059;
	b=jDw9lFLZi5+X1kPq1oA5lG4EpwBQD/SkaPaRXjlFi+nsL9Z3YAq/3tspqXO7w3yXFnDx
	 YS4rVkt523XyKd1tusscuP3pCL7D76S1ibrhULP+sfRn8QM7roXRzrf5z+lq+xo42uNA8
	 fIqBYJ2Fy7oaeAwGfNuJobooB39eU8DPOD92rhFgzDpkiskOBOBq1Sl8Qta5NDrOuJEib
	 so9N+N1aB+8QJdCdk+BeYAYFitLWhIzc7LyJc+UKZ/u3lBVkamAVyz80dVaZTwEB2u9rR
	 Cw1ihz6TPZhFnEl6mCencYC4B5DBIqigFDtKPT71ci3X/L2aDNowHNYZof22SxVlykg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795204059;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:X-Microsoft-Original-Message-ID:MIME-Version:
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
	bh=gfzlifsapb6Z49pHdNTizjN5CiM2clHNHuO6Tf3er28=;
	b=4NaA0+rB+fbx8EgnkUAFAfdG9869lc1NOpcZjmFcxyK/DuG95UhTpTTRGBTnBGW81Sb7
	 2PDqA0EYC6TsKLFFPWW7zuo68klWSaV0okttx1Qkl60QBIPyEOWEFstr4llnCuPWdPikn
	 I7aXWIfSYlytX7lCpGDRw/aYG4dzTnaSTEFlK77PxrA9Edxt+Sz0gUMMMbd+C/bmSz4Y3
	 8IO3mbSY5bdxMcv+MR2Dj508ePe7Xt5LaWvwdwA4Vk/U09bMfpZO9f9rV16iqjKlNPK0G
	 70lRxwLrJMYXMz0r0aaoLz8l5EXCe5uxg7aLdNu9nAl0nlJ/94tQ+/uFuAQ2W8E063g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.com;
	spf=pass smtp.mailfrom=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=ha3vkGoE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.10.95
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azolkn19010095.outbound.protection.outlook.com [52.103.10.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1AA9606A6F4;
	Fri, 20 Nov 2026 19:47:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1AA9606A6F4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=ha3vkGoE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qXCAIN3wvZyLlhSeLVtkv4GTTbnSCxkYacYIIO9oJMDbikPJSDyCAnKl/KB6F5vlD3yLgu033usiIIFKxx24XGbezIEacoxJCipBMlAp7k+cChcfuzgHo+daHrwtpPeSujbEFbxwdT5OqDVqhIG+mR+jp+q2VJGSiZrHJm+T3vVppEsA/QOqyw7VyQN59VxqfhRO8HoJzTMjRDKfTm9Hb0lVTrglgSVkwc/K7sn6fxFgOQJEzlbijjf/GxtURnGzZwvlqRZ4rHsfcO+yXhEGiJjmSs80rEDbrO27XdctoiVEWkwfVqU7xSbhF5x4iPxFgzTsyd0qMSJwSf1O5IPjhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gfzlifsapb6Z49pHdNTizjN5CiM2clHNHuO6Tf3er28=;
 b=uKt9xgmD8Ythe/Pz9dJd7N33NRH9DSMeLYRjfvpHGW2xtiPpQMpqIyJtD1KAYXiuBuWogTnLCk2cTZHhCjQETzkxXxOHANbybaq3zIvwjAqG6hTOkCKEl5psT7AmPOYIQBd7xHrM1FgKxSCweRJMsQo6NnUBUP43spznMZyVIQYGKzxIlrXSammG20tF1a1+sBgWd99gxwAww/Z2oy/6dAxL0axcuq+vfcIC4gWTuc3Hs12WS9lvuK/5MWMEF2fJRweBh8BysBpjuRjT9CwdC99p4VwCvevIwKeWzjcshjsP3D8kpaepH5jGLB8AIkju16RtI+rxzEYdn9KQljPINg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gfzlifsapb6Z49pHdNTizjN5CiM2clHNHuO6Tf3er28=;
 b=ha3vkGoEeASP6q4B0t0z4ti9A8mVFiMOgpFEWvKP9NOt6wNELM4MnZhnu/zlJzElWfZvM3WNytWqstz8DYh3vTKP7lYia3rhBch+qU+aLsd0YpJC56tEc8Jj7Hl2z08o1Ygao3YVgFPuuGDMEYeItMsR1AA0Bj9tMaM5yGIH2DJVxx5GCdlaAs62GotM3t8XnQslbt4oOZS6eChFtcLh8BT5t0/GAc2uwuPsUmO0w4+3DJ0ljrmSL3SnmD2hqifwlNrAqKM/uPw1ejHwcyXE26zufpWMYwNVXMyV/xBGzMIVwNNOONKIUaOy51mMGzdcpqoYPZJBG6/A0wwIcuSEFg==
Received: from LV5PR84MB4026.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:408:2fb::15)
 by MW5PR84MB1665.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:303:1c0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Fri, 20 Nov
 2026 19:47:35 +0000
Received: from LV5PR84MB4026.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::9151:9e8:f98a:99e5]) by LV5PR84MB4026.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::9151:9e8:f98a:99e5%6]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 19:47:35 +0000
From: Perry Dale <techluddite@outlook.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Perry Dale <techluddite@outlook.com>
Subject: [PATCH 0/2] ASoC: qcom: q6apm-dai: stop the playback queue from wedging the DSP
Date: Fri, 20 Nov 2026 11:47:23 -0800
Message-ID:
 <LV5PR84MB40268B01B9F458296BE453ACA7782@LV5PR84MB4026.NAMPRD84.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.56.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0205.namprd05.prod.outlook.com
 (2603:10b6:a03:330::30) To LV5PR84MB4026.NAMPRD84.PROD.OUTLOOK.COM
 (2603:10b6:408:2fb::15)
X-Microsoft-Original-Message-ID:
 <20261120194725.4088815-1-techluddite@outlook.com>
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
X-MS-Office365-Filtering-Correlation-Id: ba77a788-0980-422b-401a-08df473f1ffb
X-MS-Exchange-SLBlob-MailProps:
	laRBL560oLSPhlJ95/U7v6W/AahuugGaon7iDtAQz38DyRJypkAXw1R7OfeaoVBfOIxgO7oznr9WwsMOHTbFvPs3QBwRpFdqcwq7LDYX44yvEspnWUsuIIQaoTDIijuk9ToKGJb+YMdayc8kYLwEy2uikWcmCKp5tYb4JYz6Dk+jxSEsu6X3jmUEK+jNohVw9q0+SO0GOj8IQaKYVQENoRnNbHCkDIwnRMx5qaZQgwPHzjTL/Un/boAvkgjPk1DVG5yR+7n8ihKUcNbWvZcPDclR+jWORueNSlJ62Ukwj7/zjdq8LeForGOdj8fhmHZcynG1mVa8BLESJhX+1sA4ynT0DepFm/QOWEx441PDVP5ki2EBhfBCyJFMUyT0yCj8UZWuIyxLDxk99/BS2hYey0c6UKTu7D6TjqETFjvn0GHJX/wpl4bbFogzhLMetz5svD74nIU0z/L/oUGftotJF5VFOaaTpnZxNqiKbCKoQtSaDjTOoDMuqa5XK5Dd6AmFdQ+Vhj2No+i0O9TaSoC/iYBAsVxJhZSrADgRZhWDfXotn6PhUPDk6KlNCUneygViKCO2xVxxigxM3PcMg6QxFVFoE/4V3x0JUzTgrBT1nPJsU02IgTde14SLPJpKM9Eyul70FVOwmhouk9kUZIVSGP1q+z94s6vjIg0ikezQPEaJp7m24xzf3LtcRGUAf8O/xVwab3Nb9KkyJD1+j2yi3eV5Y4LINDZYTMO4Zv2nLRAwtwMhtZ5gnNtLd5hOCrPZ0laXtqUSLmHOovxWfrV4AUKSjJvVniHK
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799015|5072599009|51005399006|25010399006|23021999003|15080799012|24021099003|19110799012|260925184616899003|40105399003|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KBWpagtdOLh6YTBLiydTS9qv6yu4VdrfH/i7NY2s/Nc0otieE14CSDe6pmqR?=
 =?us-ascii?Q?Xz1P36jnHLyaz8/Z0+FD/kZBE61hpg7mnacWUj7zO3BWWdT5oZQ8mjOewALy?=
 =?us-ascii?Q?8CXOGxkQVawbh/TaT6f479+/k3EaThjOMAOFw67j8gsiJ6zcNkdiqwirQsiH?=
 =?us-ascii?Q?SQGijj+EH0QyY8Pm3p1zwZm8HWuGzOrG/ksr+LM5R+C5HniHxTiwsVqiKeac?=
 =?us-ascii?Q?Up98Dn/gIEN1lPUFs8jkcvioPfMvLhc5UeumhYHmcRHyV2lQSEKNLIeljp6e?=
 =?us-ascii?Q?mpFcPcejTd9qND4kkakK45V2cSQ8cwBohEhiHoeatOJ8Yhy7NmevsFLgi3aY?=
 =?us-ascii?Q?qZF8ubl4Rj7feMwCJqPtyoCoHT1+GoKjtu8NNyhJEwq6TiUHI1t2i37kCCUI?=
 =?us-ascii?Q?KTxIUckH11UnK8El/Lvn+RPeYo1LDEUtQ+sbmqXS68b7PlSmyhqmmkgzmxt+?=
 =?us-ascii?Q?4W9Kl1yKNYJ97OvqaBT9iSMLVMrg5ZT6h6lRxQFNm5JMLYo9Td56aA70HTJ+?=
 =?us-ascii?Q?+/bd+XPGWgDMnI9sZJgCi0CHa3m4liedeRTERsDAuUh7YV0+rbbK1/HcBOvW?=
 =?us-ascii?Q?O+8oettWSeIJEGcRJ7gF71SARTyhgSc05/q7oU7xUE/3yxx0kmO5GDBAVhjW?=
 =?us-ascii?Q?0SZnvAoiSLODS+zm4gzqluQ7yVaEXucWhR8AfRyp7iqaty27/rPfXfrBwbYG?=
 =?us-ascii?Q?gP8+vB8k3b/1N37mWYIyAIF2INcsO5feXcAkxkfpJ3+DKdIKQzUPXfr4idsW?=
 =?us-ascii?Q?0o31y7RgZd8rLMxJqBs4Abnu48KYbAMhCXkDuhm1XJYv7pn9qkXnA0UVQx2t?=
 =?us-ascii?Q?ui2YnG719rcvVT749HDt9wfbzPovKi1FU1Kh4o7GDqPIK2L8eJsqv6XjEjcz?=
 =?us-ascii?Q?vB6ZVTWN+FITpm+0izbilOdYsRSs54S8y70zkxnLK/wRJiYoCEBaUiKtjBD4?=
 =?us-ascii?Q?Mz2HJj8GIQMZezlDu/x9gQ=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hlnxM2l4HG3ZxkmNKXgGDbf+zrhVRSIUNupAkcibPUL57F1n9+mfj4DopLXW?=
 =?us-ascii?Q?EtFlOBd+kHVardK6VdSu8CTgPdevSmRx+o7isT+JFHoyq/NxJbkya9VQSkpS?=
 =?us-ascii?Q?UppsO/tQwN1h92E7rb7j2vJmtjepSAG0AvBY3uWj3inigh5ZkkUGRkEO0GMB?=
 =?us-ascii?Q?sX5+YvB+nAq6OKwphN71wpuvoIlmqe9U5wYvACz364XlnzD1ftGHmsBCafFe?=
 =?us-ascii?Q?SpTu1ossRsmTEBPK7Vb2SIvmG0ho/fADuqPaC4BC9QCM0dNMBLkeQP3KqRju?=
 =?us-ascii?Q?WtjMkZEsbGWiw04sgIReirC9qv6Usaq+lnbGO4aP+gKpTqfySVuL8k1KxBSl?=
 =?us-ascii?Q?30fBogi9hFiu96MHp7sb/73OyW81DxEs/CxBjEXef/bDFwJHxodizXhKJkNx?=
 =?us-ascii?Q?BieiyIByLidKmI4yiAWPB/RUW5G4RbIWBa20gtgyNRtN2f82zr5gjr2u0UvQ?=
 =?us-ascii?Q?StV8bOoCkaInBDyWBHNjujHJWV6uCE35vdpSIekMM99lKowm25PmytCzlf61?=
 =?us-ascii?Q?2QXzuISH3PpgP0Hfe4rwsriOjykdNpfxEV48uMo7ol9dsemGSmF6kPSuVloC?=
 =?us-ascii?Q?EOXIsemMbWHOSPp61mh7W0O2fa0y4TFyDWw3DH6HJyi7ySrrXCXrXHqfppom?=
 =?us-ascii?Q?wU4fVM1P48hXOIgqAjwTkMJ/zqoJLFNiIq/gKbOdVejbvwfnDeD/SKC0flTl?=
 =?us-ascii?Q?TNyfVgxVnviIrjKTBrwgWsV7ZT8oBCl7KD1529mQvKTZ2+9/pigP8GolGNzM?=
 =?us-ascii?Q?sYxU8g5ODoLWHMxxc+l7BlZO5uMOt92Jz9ZJ68lP1KPN8Q3CzsitYsUA6joy?=
 =?us-ascii?Q?cF7edwpoLb9FCvmlsolQf0rwMmIoKeJ1bbidexGw0bCFGoYzdeDExgcR4Kpf?=
 =?us-ascii?Q?xlgV9TCwQuufNPNA4bQnFewmiQb9DqCMBaZJvNKFw5PP/DzSJjuePsv3uWk3?=
 =?us-ascii?Q?BhYRQqxPVal13j+2P5kZW4YTj3BvLYg0pNk1a9hxi1q9TrwK1LF5YI4BPXvB?=
 =?us-ascii?Q?mHMiQtyIGUSS6niR6/S9VG+4vsQUvrEJaq7NnTKDnFz9iDBa7VZx4itqACMp?=
 =?us-ascii?Q?6zYZGA6FU/QYqGw0ceShfIOHHiZ6AEmg2imnj4E/Xu12+vpsG5OWhDQCnS+S?=
 =?us-ascii?Q?NEqNtUOtl7LylVRzK+v4TefUII/s55qgLiOuDbGLwRMbqRnUyC7Yyb82RxE5?=
 =?us-ascii?Q?UW7NeGWrOw/D1x9eMgLGI5eBM9Dwxjp8p/Bz3Y6HHv4uMmUNE7uwxj4UO/lW?=
 =?us-ascii?Q?h12Wu6RJfx98gu0rOYS9OUDq9gRe6hAXhu0tseGG1QStXh3mFnUD3KuzGhwm?=
 =?us-ascii?Q?RR+NIkONbJT96//ilsIZls/kARFWLA7lUc1C0SKO3u5oCzTIoKH25MKB9wwE?=
 =?us-ascii?Q?XLmesGRCgZ3+DJv/1PSAOkx7D/n0?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba77a788-0980-422b-401a-08df473f1ffb
X-MS-Exchange-CrossTenant-AuthSource: LV5PR84MB4026.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 19:47:35.6345
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR84MB1665

On the AYN Odin 2 Portal (SM8550) the audio DSP stops answering GPR
commands when a game pauses its stream, and every later prepare times
out until a reboot. q6apm_dai_ack() queues one write per period of the
whole appl_ptr after a trigger stop has reset queue_ptr.

Patch 1 is the fix and is marked for stable. It queues only while the
graph runs and bounds what one call can queue. With it alone, a PCM
reset on a running stream past the first ring stops that stream until
its next prepare, and the DSP keeps answering.

Patch 2 carries a running stream across a PCM reset. It counts the
buffers the DSP holds, queues from the write-done event as well as from
.ack, and stops the stream with an xrun when a send fails. It is not
needed for stable.

Both were built as a module for 7.4-rc1 and run on the Portal with a
test program of ten cases. The unpatched driver fails the first drop
round of that program. Each changelog lists what was run and what was
not, and describes the use of AI coding tools.

Perry Dale (2):
  ASoC: qcom: q6apm-dai: queue playback buffers only while the graph
    runs
  ASoC: qcom: q6apm-dai: keep a playback stream running across a PCM
    reset

 sound/soc/qcom/qdsp6/q6apm-dai.c | 166 ++++++++++++++++++++++++++++---
 1 file changed, 152 insertions(+), 14 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0

