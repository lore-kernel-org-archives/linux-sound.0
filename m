Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.12.37
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795105869;
	b=4vIBeuJgPpK02nrWeR466bE/r2ay5aT1nURl6dZNeQOOwIC+9VFRbJ2nRjQtKLOIHzQ/
	 Mn2BaHS3jaMQlk3LtuTrG/5CtCGfPaHVlucpsOEquouybOaFUJpK5ACq9/klCQy5WDwr7
	 zt/RYSGfb9J3Cot48ju6LaWFTjahL9IahlfgAb3GyPqcHsBt5RklPj7YptYiqIwI/c5fM
	 a4v5rVFKB6FTJCIQm4MUqovqW5UUBbesprJ//U+PTfzpPdNyu1IgSaHfqIxkEnmwOFXhp
	 73ZETJAL18yHFJ2RBVhHwwfy52cJf0pRDKXVYz8jUn1NPRD05VYszGzRl+8XZ9msXfw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795105869;
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
	bh=fKOC3Wzujhdd6fdyf+hXCNDiKanM0fuHpjeir/ycXHE=;
	b=YFu5gtKV7FFcnYo1kVsJ6cLVnqTeUodNTpJl2GY9igOLYfcc5Krub8yCJeee1dfwyKvh
	 J7KnuDVlAZ8M5dDPBq2I1RJilH+X928FbQ0hcH5YzyGQF3WrkMaJS1ipFoszKUSGsDd++
	 had8Crxska5OaNTJEqYacx5nuTSyp0V9ujiR1k7KzciYlfGUOsce2HntJHAoqWjPIVnW2
	 gbPT+QH6MV5rzgniQ1CBrOh3rOj+H/QLiROCHdC8HaDiURDmov5sldZ22qnT5WBpwEIKv
	 n3tcbgMWqybklR5+jHDKZx7AY+nE2nPfK0jN1dY8hJX7C2VTbAksM7mzjWP84ALemTQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.it;
	spf=pass smtp.mailfrom=outlook.it;
	dkim=pass header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.a=rsa-sha256 header.s=selector1 header.b=jOLc9Tt9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.12.37
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azolkn19011037.outbound.protection.outlook.com [52.103.12.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8651A606A325;
	Thu, 19 Nov 2026 16:31:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8651A606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.a=rsa-sha256 header.s=selector1 header.b=jOLc9Tt9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ubAiUVEfGSBcaato9Om65LL4Axhhs87B3EJyQnt7/c+jDWM2rebOXeQeH/TdRub0q1D19mToYlYoQ+m43Hhja5EeFzGOsdbaeC28tVXYmwpm8gjdbj13UYE+Vi/dNr8T3gN8GTq97PFN/HgT42DylpU9cbrtUGQl/kKpnQEJrJudKQR/cOCe7DkKVYwQ/lLV39/pCHWKMEiOH5QBouzilUwxynaD7aKT5HnRreE4g9jWk+0oZUDIEB4gKRRFSNqnHaZqVizx7QgQxzgsmsCt4XGGXBCDwaGeCg2MUZ512YYOX5Tr2HkwqSOwuTm+I/zCnpG7CmqvgPHTX5eWAD2Qyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fKOC3Wzujhdd6fdyf+hXCNDiKanM0fuHpjeir/ycXHE=;
 b=JGgPLIZgOY5ksAN05uTsJfX+XgnRKW5jE5xmDHnxRh2JNQpmTCj53yJ7RL/nwDxVm9+IGKBSD4Pz1j7yT+4H6hoJu6wVMVye6zL6O6wBiiZ5eoqAjQLf7Yyy6GCFHGKcykI8BBCPRwuJT3eUulcMOt/kyz25IBvtBn08lQ9Bo2T7s/yAKp1q3ZCq/NsxcuJBzKRUQsG0ZiJaExvEnou8IqjGFKGzBwXg/7B7oNxf35h6OhRu4Fye4gFVUYLC4lHU8P0EdDBozC+J0zteu00i0g3Er6MrDGj5oWFYCu7tdA7N8zPK7/wWt9Ru64hIiw0lLLnMXyG6rvFWcCz9jzg4Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.IT;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fKOC3Wzujhdd6fdyf+hXCNDiKanM0fuHpjeir/ycXHE=;
 b=jOLc9Tt9sUopAviXm1eVhM7MdimMrwLiHhuNCVjjvLpDBFNSokgdIc3WShPa76PIMQg8cgT3z0fxEukcbx7YOXJVWCCQru+MRaL/EO9a/ry98DgEZjbkVytOWXxPCaDptnK0rMxVme4otEd02Nvujpa8zmvspptt3l1LdOJi2oCjvkPiq+W2yPHfOINnd2II7eACmkYm7tDRfWRCFIZl0/P6425GCPefhekmGM2iStbFAJkjz4v6DzlDttt+j0PNrv0BF6WeLFc3HZrwbb6xshF+re+hLlpByy/9wP7+UFudNxhdHhqXk9x5fdlvGrCt4rt9bcNr/WV1vvD1xynxEg==
Received: from SN6PR19MB2303.namprd19.prod.outlook.com (2603:10b6:805:56::19)
 by CY8PR19MB7036.namprd19.prod.outlook.com (2603:10b6:930:58::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 16:30:38 +0000
Received: from SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a]) by SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a%4]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 16:30:38 +0000
From: Marco Giunta <marco_giunta@outlook.it>
To: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Giunta <marco_giunta@outlook.it>
Subject: [PATCH 5/5] ASoC: aw88399: rename AW883XX_* macros to AW88399_*
Date: Thu, 19 Nov 2026 17:30:16 +0100
Message-ID:
 <SN6PR19MB23031C99F1C5700B1D89003EFC792@SN6PR19MB2303.namprd19.prod.outlook.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <SN6PR19MB2303E8188DC58BDC07645705FC792@SN6PR19MB2303.namprd19.prod.outlook.com>
References: <SN6PR19MB2303E8188DC58BDC07645705FC792@SN6PR19MB2303.namprd19.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI3PEPF00004E9D.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:298:1::454) To SN6PR19MB2303.namprd19.prod.outlook.com
 (2603:10b6:805:56::19)
X-Microsoft-Original-Message-ID:
 <20261119163016.30414-5-marco_giunta@outlook.it>
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
X-MS-TrafficTypeDiagnostic: SN6PR19MB2303:EE_|CY8PR19MB7036:EE_
X-MS-Office365-Filtering-Correlation-Id: dcfeb316-4715-4039-e90f-08df465a71b1
X-MS-Exchange-SLBlob-MailProps:
	WaIXnCbdHrO+2YmbT5jW+WUSUt4IT5vRI5QlhGVB70TNfFSpBeWVJqicOw7xwBod/2RtPVGGUVgxc4hfk8ETL0B8Jq5nYayJvOMm8ev79Hkqe7eXKmDpZ+xNff6bIAjZP2vuUhMpDoCe/8K7/PTge07fXeW7rqmBcmRcknAhe+Ve5wMz9/9pzKvnBrEO3rLR6mBH2m6UsiwhnloDCwpywjvYB9rhqkHgztdTp87NvN0vP/P+Vvqk/iUmCPVtj0+mCCSaeI9rbjECBiaMeSufzW1cST26dtJCW2TEssFFZLbHeGIjYEdNziI95yh+znN+qxUT5HcYnCMvWwSZuYajiGGhwNxLIxlnsaJl9KYbdcEZrd0S2HOG58Q/v5opd5xZTf0rB44fmJ36H/urZScbNsm2xaxUKEvzaodefm5aj4p+80rKlVrYHAybJ6LtT8gIFQetp3Eroaq8KE19wVdMOb1vnOyeOxMrMWFIHHlE0lcRtOcKdQHy018NnY/si3bXz461hXj1+M8X+S6TY736grBnkp9AeV1mGBPY+h7tg0ag17HeFe4wns6MVtYXL0UTyiBXSMJbwk3Bf8O6JZ3g3XtCOJC2LS+TzJ5TnE11d/OQNRwDstKWp2dQBLmpjmcymTo5rddS/GdHgSnuo1LC4+LaihtZ3Ilc182QXTje5yo2dmxfL/sa/tSAk6rNwwj4kF3vWs9KJsp10CA7KFPKHX/vAAsC0VsU1Sltj9SDB1lKZgGgUvaGAkawCiX89CEbCeDprbtBvrM=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|260925184616899003|25010399006|55001999006|8060799015|23021999003|51005399006|15080799012|24021099003|19110799012|40105399003|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XMVoO/GY6tclu1UD1+CW6/TnH8RIXkbd5uc3P9aWE3JdU73PLVby76ksbxTK?=
 =?us-ascii?Q?lP/qeEdgZT1R3ipaQA7qi7mhXqfyr9wXnj/Nbepp6LxC6/p++UUlU2+27zTn?=
 =?us-ascii?Q?BNrtWm6a3uN1Lpn1lyHuyee1nqxK9NCpE0osPn7YcuS61TuZK0HF38UID2pd?=
 =?us-ascii?Q?ZMom2mntaNFdRhJshLApr5F0IDNNd1FAI+lVaZyhV0rEP6WYeOQF/NdITgQc?=
 =?us-ascii?Q?cn1dqWTTcV3V+nqiNfgYUDm/TSGwFoeuW7+g5z4bBoS3v8Oq31elrf2TdNhM?=
 =?us-ascii?Q?vYaUpwYmcEYaHU9KvfmeQuPc2wfHMYvXeA20rB+nmvOuboTQWYKV0T5M6emf?=
 =?us-ascii?Q?9TeF6qxrZewZGEAhRaXDhJD0GAIq3BhCKk6T+GNj4B6MFDAao/BoP6Koag0Z?=
 =?us-ascii?Q?Rr4cwtN9Ip9WX72iwfFHmkILHbnA0XP3AdcMlRb/G5lZalrUzGej8RNrv0VA?=
 =?us-ascii?Q?M61GPT4YqJmYGOfL8qehlxFNN2P8A7oVJk3mRHMr1Vg22Z2ggegsXxXAmrfu?=
 =?us-ascii?Q?MjTbjAa9rIjHkkaYS3PjVrVbk9VtJ7xYs7WE9AmKFxqhra0Xlvm6P/N9ISY7?=
 =?us-ascii?Q?YTcTdOcyuEQDhBhS0IiICI2+P2XAWKdDez6oGPfFBOHQwLKxBKJs5c5lqm5X?=
 =?us-ascii?Q?vWEM0C+dRei0elWXaXc3ItRV/fFXz1xWjlcCjF3VelewS1Hk9zm8rlzb0A+3?=
 =?us-ascii?Q?OpXII7mwJwQUujW1BdAORL64+VBj9szlzXK6rediRrxW8D1/FTQpUFsYBTN6?=
 =?us-ascii?Q?2bB9aII+RQGc0sXw3/oKXGS8MYSyfNLE53ZmNT5NeGrvHjPpKaZzhmH0BAOz?=
 =?us-ascii?Q?6u0kbAy3xNVt9TjiGjZo+ciUAKKqxzQHsj44TwV3YfFNlcexfMLAj5n/RVxc?=
 =?us-ascii?Q?xADL19NagCpguihAtTw4dF0wM7+hH3wCFtfMIAYy59xOx8JphLyc0QIagFKc?=
 =?us-ascii?Q?+1LrF21+pXhQAUOUYRWjxRF5aHWVoG2eTHkcej5PcvZ67LDlXtfej6shhiyo?=
 =?us-ascii?Q?piWx?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6xwtEwgLdsNn8PoYjkfyEAyWwzkf3DhY8vijCSNThVO8EFs6Y7Za7h1reH/N?=
 =?us-ascii?Q?rrOOlW1JXuAU277dA/QLDDu8M5NgyIA91FasK7Kzayr5lnyi/U+h6FaZMwDR?=
 =?us-ascii?Q?FO3QvxAVe0/OYflVpCMMQqy/W+60S5wo3jQ2KBIEqGH8TAK7gR1FCHHsdKcY?=
 =?us-ascii?Q?o9QuJ1cXZVSN41Bjd845inxtWXGU8RsYd91XsB3Ziwf/oTKKXSHcDxdSuJU2?=
 =?us-ascii?Q?zPojecPHiU2snXUFdqeQrN87jF7Gv0YahiUTp8vQSovnLGM+FXpRtzerKWiL?=
 =?us-ascii?Q?5bm3XqtUkomyFlGldJUhdSftdIRreUNFsfLh8NLX1LIg2u+0D4Kf35s3wAPx?=
 =?us-ascii?Q?fkuncKnMlsM5bp6f2OkiCSk4cqOK52QQR5W1g77cUYrFn1TZWJ5DHOK0XMSq?=
 =?us-ascii?Q?rPZFgdmIweRwaAaCUPIbmozMw/Lsb0tFMTTdBZiM/9zBm56NEbklzKUwio9X?=
 =?us-ascii?Q?DALygajTwp+QDpgpJm4RVm0Bxv16zW+oteUHgYFEY48bx3o2CPASf2wVRD4n?=
 =?us-ascii?Q?gcoJ24jH+7572uISzvawM1NTLLMOYaU8KbZicd9AmMWNNB9mh56o50k4MM6Z?=
 =?us-ascii?Q?UcODbRHJxmrkQ7YwMAjhd/AEtRWHgDbMYzFCqQDHImGLLENySvJZwdPPskKh?=
 =?us-ascii?Q?XdoLaNMDNR1Z9lxG48zi6wcvEl8bjp+Cpa7nrnyyHYZd666cY9bM7rcc/ip6?=
 =?us-ascii?Q?pm/zCBOdWcx+jCTadf5fLedyCVsnfa4SON+7t7RCGtV216DnhiaK4TdyOCDc?=
 =?us-ascii?Q?KOjPTB6StLGVHTbGiU/j9Qx5n9T1KFCpZbv63K9dVfi+bI0Gfb8IqZX3hEKK?=
 =?us-ascii?Q?bmzxc+Z7/vM+jhZSsmtWXvAVWOIDou636+Hsc9GQmgce3Eeg6VKCAj1FpOP4?=
 =?us-ascii?Q?hpBi97HViwCOgszRgOPVYUPjE92Kw/HSqFFqNuBpxk7f43E7c4rv7j1rRrfk?=
 =?us-ascii?Q?gyfPKlLD6+hXYOhYc1+RtufV66H1FNDXTEuCfOFNyvbyuoMh/39rAA4CcXZv?=
 =?us-ascii?Q?yU5yv4DMa61Y+oXr8ymdUA1vSFNdBmgRMXEri4XQd1K2zFMy1sgtRnxcycFw?=
 =?us-ascii?Q?+aQYsliw0Ru38ADiofjcphigaCJTYgnL3xwQTj6A4UrDLIDCLVc+dNUfWPzI?=
 =?us-ascii?Q?aoJhNhG3pZ9Cm4vj852dtZw0rs52eajISfDgCK978VFDC7xwm34AiYNwZRgM?=
 =?us-ascii?Q?bYGswRWKLenx6WDQ2grf9AT7KrKkyP689T5kIyWMZzAvnV5Bf7QN7mao4w1O?=
 =?us-ascii?Q?I1S9aN0zmq8n0WMxBanRqbCFqzNNdIBN6r7n5+J3u/B5ahI2jNASOGjQXlCB?=
 =?us-ascii?Q?AGV0ud36SjWpOcHL8MiGhPjGk0lIB0rKKnou7Ke2Wnjy3ehRcKW3mfQIbVtB?=
 =?us-ascii?Q?gJVxs1gf8hAQN0NtI4hrwtXONL0D?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-990eb.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: dcfeb316-4715-4039-e90f-08df465a71b1
X-MS-Exchange-CrossTenant-AuthSource: SN6PR19MB2303.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 16:30:38.0292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR19MB7036

The aw88399 library header at include/sound/aw88399.h defines all its
macros as AW88399_*, apart from a few AW883XX_* ones.
These are likely an oversight from when the generic Android vendor driver,
aw883xx, was originally ported upstream in an aw88399-specialized version.

Rename these macros to AW88399_* to make them consistent with the rest of
the header.

Signed-off-by: Marco Giunta <marco_giunta@outlook.it>
---
 include/sound/aw88399.h    | 14 +++++++-------
 sound/soc/codecs/aw88399.c |  6 +++---
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/include/sound/aw88399.h b/include/sound/aw88399.h
index d72c491ee866..fa43e8068093 100644
--- a/include/sound/aw88399.h
+++ b/include/sound/aw88399.h
@@ -469,13 +469,13 @@
 #define AW88399_DSP_VOL_MASK		\
 	(~(((1<<AW88399_DSP_VOL_BITS_LEN)-1) << AW88399_DSP_VOL_START_BIT))
 
-#define AW883XX_DSP_NG_EN_START	(13)
-#define AW883XX_DSP_NG_EN_LEN		(1)
-#define AW883XX_DSP_NG_EN_MASK		\
-	(~(((1 << AW883XX_DSP_NG_EN_LEN) - 1) << AW883XX_DSP_NG_EN_START))
-#define AW883XX_DSP_NG_EN_DISABLE	(0)
-#define AW883XX_DSP_NG_EN_DISABLE_VALUE	\
-	(AW883XX_DSP_NG_EN_DISABLE << AW883XX_DSP_NG_EN_START)
+#define AW88399_DSP_NG_EN_START	(13)
+#define AW88399_DSP_NG_EN_LEN		(1)
+#define AW88399_DSP_NG_EN_MASK		\
+	(~(((1 << AW88399_DSP_NG_EN_LEN) - 1) << AW88399_DSP_NG_EN_START))
+#define AW88399_DSP_NG_EN_DISABLE	(0)
+#define AW88399_DSP_NG_EN_DISABLE_VALUE	\
+	(AW88399_DSP_NG_EN_DISABLE << AW88399_DSP_NG_EN_START)
 
 #define AW88399_VOLUME_STEP_DB			(64)
 #define AW88399_VOL_DEFAULT_VALUE		(0)
diff --git a/sound/soc/codecs/aw88399.c b/sound/soc/codecs/aw88399.c
index 1275ac601bcb..28a9803a693f 100644
--- a/sound/soc/codecs/aw88399.c
+++ b/sound/soc/codecs/aw88399.c
@@ -106,7 +106,7 @@ static int aw_cali_svc_cali_en(struct aw_device *aw_dev, bool cali_en)
 	aw_dev_dsp_enable(aw_dev, false);
 	if (cali_en) {
 		regmap_update_bits(aw_dev->regmap, AW88399_DBGCTRL_REG,
-				~AW883XX_DSP_NG_EN_MASK, AW883XX_DSP_NG_EN_DISABLE_VALUE);
+				~AW88399_DSP_NG_EN_MASK, AW88399_DSP_NG_EN_DISABLE_VALUE);
 		aw_dev_dsp_write(aw_dev, AW88399_DSP_LOW_POWER_SWITCH_CFG_ADDR,
 				AW88399_DSP_LOW_POWER_SWITCH_DISABLE, AW_DSP_16_DATA);
 
@@ -166,7 +166,7 @@ static void aw_cali_svc_backup_info(struct aw_device *aw_dev)
 	unsigned int reg_val, dsp_val;
 
 	regmap_read(aw_dev->regmap, AW88399_DBGCTRL_REG, &reg_val);
-	backup_desc->dsp_ng_cfg = reg_val & (~AW883XX_DSP_NG_EN_MASK);
+	backup_desc->dsp_ng_cfg = reg_val & (~AW88399_DSP_NG_EN_MASK);
 
 	aw_dev_dsp_read(aw_dev, AW88399_DSP_LOW_POWER_SWITCH_CFG_ADDR, &dsp_val, AW_DSP_16_DATA);
 
@@ -178,7 +178,7 @@ static void aw_cali_svc_recover_info(struct aw_device *aw_dev)
 	struct aw_cali_backup_desc *backup_desc = &aw_dev->cali_desc.backup_info;
 
 	regmap_update_bits(aw_dev->regmap, AW88399_DBGCTRL_REG,
-			~AW883XX_DSP_NG_EN_MASK, backup_desc->dsp_ng_cfg);
+			~AW88399_DSP_NG_EN_MASK, backup_desc->dsp_ng_cfg);
 
 	aw_dev_dsp_write(aw_dev, AW88399_DSP_LOW_POWER_SWITCH_CFG_ADDR,
 			backup_desc->dsp_lp_cfg, AW_DSP_16_DATA);
-- 
2.56.1

