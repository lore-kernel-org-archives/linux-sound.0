Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010016.outbound.protection.outlook.com [52.101.229.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966E910E5
	for <linux-sound@vger.kernel.org>; Mon, 10 Mar 2025 02:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741572137; cv=fail; b=t0EhAO21GRgLJmq7Az9DObJq9S9r1ZMkYhfpo6njbZybsrfYYhUWWacRTFXK+i3dPSE6j+EjsIxzSUGvKDRzx24U+ccZndmcdgU2A0QCptz0x1GUCiCv5hwlCoJrYjdTE4h/CU9bv+JvyGVl64RAIJm29+VcxACOsGCxsj1450M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741572137; c=relaxed/simple;
	bh=G72CDSr2O4EHQXsiHx8VBrInlaKfqzZoCcAGsm6Ewgk=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=n67e+VtJbB5uohBrh+qhvxkH2gNzhkKAEKzqt553aaOAfCe6hBj3hFwrm6b8n7LMbHh5jPrsyi5S9waUx37m3bj5k3jeRUSiMEeQc4O1FPExlnI1xolbbFHN/nibKWhSciL5jsRYnHCVeTrgNejfoaJgXkP4d8NEzI0vxcrT9Gc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Ybn7/GGf; arc=fail smtp.client-ip=52.101.229.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Ybn7/GGf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zz5BZJYnrfMJrFJMKTzYPc7RZFJ68HXgiYU01cE2FW0xkgTAwRTjXfxNiHUMtsbJSNxKokro/laAnflbrbOp38Cgo8rUtiRbEi/Bhz4JipwUTB2XcT7RfkYey/cfSnylcRL3ARhtMKTURVw3n/m+Z92gbdmzRrThxrsrLdq90/nc0kjdqCLUSvXp91fInrasuFa8VOAG1ra0fold6SV4NixdfL0IB1oQZhVvNoEwMswPyvuVWvcnlnHIqSCJgyXSSUFJ+zeLDkZKXNHOqV9dcNcC2zoePaGqVg8qlKeLURYDM2Qby4kO9FPtd0EGlfeaQ9X1Llc9cxvtPbcHKD+qNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aNkOS1eZYlozZDXTAEtRBfOLSAmfOzSsP4yYK06kF7s=;
 b=DpBE31YD9GqJ7H3hv3HN19mgHcKdqRMJyw6ipZs2eeJfg/DuMbfYoTlGiYJFEilIcG2i8jx7sx+cfNnET/GOULsX1lkc1Xsw4MAgz4Q49WUYSXrwLgKWuLHAeGadBG0oTunrh4WLWGHhZPD6Ci8NoWPz2lKloR7lF+lF0+LrbR8HymLUtAd5iodn4YU/bcCtlXkrrQR4xcEw0PsQiOWybI9Mq1tJoIdkdffwsFsC3yYLQF8HaD9ZM+fDC+B6evPJLc6L+ZKnm4aCkwRKLMe7rSCABD1KuFOsszoYt9QEAntsl3OZ08YuJitCsUXpAC2oKuQaBx7yDa9ZFULr2ckSvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aNkOS1eZYlozZDXTAEtRBfOLSAmfOzSsP4yYK06kF7s=;
 b=Ybn7/GGfLd50AlhBskNgnts69WX0IcmTZAi8/6yCHs62Hx7wI32thMFaViIohawU8jtnWzX7t3n3H3ClC5tt2ofdH8WQbTqVS+8dISvr+g97mkk6/vatH3PukT0uPZLesHXYLkWFTQgbNZgwgXuIXpXjGYY/nXl6PNM++RVvGWQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB12901.jpnprd01.prod.outlook.com
 (2603:1096:405:1b1::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 02:02:11 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8511.025; Mon, 10 Mar 2025
 02:02:11 +0000
Message-ID: <87plip7ie4.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2] ASoC: soc-pcm: tidyup function name to snd_soc_dpcm_be_can_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 10 Mar 2025 02:02:11 +0000
X-ClientProxiedBy: TYCP286CA0356.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB12901:EE_
X-MS-Office365-Filtering-Correlation-Id: 45d3b1c5-2091-42f8-f69f-08dd5f77922b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tuZU1sLgsr58HLq7yocMnDQv6vgur5VEi19u45H9s5u6QlL23uBIyxXlIzEW?=
 =?us-ascii?Q?V3AoiTD9O/bbOVAIKAjvmN1pTKx7g7ykqjk33LGL52ylqGIf7sR+mxXx+h04?=
 =?us-ascii?Q?nUGHM+xtoYJnklTL34N3dfNmtSKsPAMpRzoBm9XK9X2E0IqyBD2DJMdNMhcW?=
 =?us-ascii?Q?g+BJU5K8fckBUH5s/fqHzKlImNauXVaYwJigiWFfGukr8XMx9Nsiy54TVHi4?=
 =?us-ascii?Q?54J+JEKHESW4SOPrFJ/KegmP+A1B+0ujAMhGrHG0nsqmWD9GsP/sdhHRZIl+?=
 =?us-ascii?Q?fTiiXX3Rh2gnQroSONOsVwv305UIWBoWE2RQ3Fr8SR7/JkSVy1+Ak9qSjUIY?=
 =?us-ascii?Q?8M+SDLnEte4gHidI9pJ9h7nCUvsTflTTwL5Pc7GBatc/vs+iDcxukR4qXzFT?=
 =?us-ascii?Q?0oRwGMb+FNC8d3DH03hsK0UfTYzdVSaZJWXR6FwDhmB2YQG8UxrOqCMTb8vD?=
 =?us-ascii?Q?ohlZjMrCWDRkRf5XwMM/AV7f46qbW9ygHxwX8u8xYIYpP4LxMgCSooDCKn8i?=
 =?us-ascii?Q?qve863xM4zq++iJIaixIcoGA55G9obUzbCwlIFTKUbcI29W7XyoF45gkQhdF?=
 =?us-ascii?Q?E88VNc0WDGApM6iJVnFfK6wNMsiya8LkBUo6qFFAETamAtBbVabU0Yly6d0p?=
 =?us-ascii?Q?Y++ezsZbaJCCHHNIO9/vrmTQPlizY5QuKPA3wjymWjelD1G8W9E+ch1nUl3c?=
 =?us-ascii?Q?3PM31lhdUDbiea9il/xzIFYQ7bmLwQsUmFFfr18zhIl3vYR69wGH+BEo2js9?=
 =?us-ascii?Q?KmKA8M9TTaZDv301H6GORXxaRw0gnlXlrBEnXStdkfTYdFO+YyUp3aVN/m6k?=
 =?us-ascii?Q?kSkjinabUnNVzrGZgARbMl0gFihXjQGCj7dKMiJuNYS6I+F3JPh1u4wds3NJ?=
 =?us-ascii?Q?nILQyCmwPeOY4RSsmdVyNOXW9hoFiLfVRh4Q128eA8QRyjXLEhzYYxBkW5f2?=
 =?us-ascii?Q?C52u+s6z+hCpeRU52nEk0v6QnjAHd/g6aDeDp0GsoUD0POSd+5wlBLCWt4tg?=
 =?us-ascii?Q?iT4+tfhiLurBUamQ7x/rL/LM+nSRsMzfKjn+1VWg36Sg06Mm4V9xSnRNFm4P?=
 =?us-ascii?Q?P7ypkpV46z9//myEbDCIdaTQW3nGyWXM9nTkvT9IlFx9dWwI4bRm7Hk3Jdje?=
 =?us-ascii?Q?dNzmsPsd7sqET3kLJUtPY1JoSlPr6uZHnITiz5bNwMZ03G6kQsHuYW4XPWmm?=
 =?us-ascii?Q?jXDFNrW51//fkyB82ksR8HT5lUqBpMwkMc9Lg/BHEW3/cpMlGG7DuC4Su/93?=
 =?us-ascii?Q?LojiadT21rzNXze2i1dvAk+Z9cr4xaU96AdZkBWfjzgPuFt7m/Xg/rrZXOvK?=
 =?us-ascii?Q?A//roAFmlZ3H/O41jcvZZ5fjXngdVUD4Sq0Vwhey/kD+p1ZxbcbX+0nyvJE/?=
 =?us-ascii?Q?rEgdiX63BK45gcss77TVnITGM/NfbaKabrM7D42aJBX9Dz0I4Xo8mHrZ/pfk?=
 =?us-ascii?Q?i9m05lEup9T5X++zfXVMaeZvJCJb98Fz?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?P/x0Qb+kr6L6RKGcbvirQLxW2lD/mv/hThSSTsHsNwKXGVrOjcQI+QNKZ0pp?=
 =?us-ascii?Q?VMzp+FIUjmYiJWcXfdWoni9Xnn7YsybMSu0QVq2X1+C/gqyYHv4U1JwpPkXj?=
 =?us-ascii?Q?NUOPIh4yD7tqnWt5pivZA+BGOhqPau4Nl4bwQOxbX/PG5nKuvOxCHjhTq0Ss?=
 =?us-ascii?Q?DqgwkJH1RlrGig56DLd9h2FTl1qrhUh+NMDK6Pp9LxCMs5ZE16XdNw27Wtwi?=
 =?us-ascii?Q?Mriq5jaSRaKCKmeCFsrs42gY+XW4KS1OuHl/Dr7LHHi/pBDnAIDa7mfNwvzd?=
 =?us-ascii?Q?Pk3CTMMoi2od14YgGU2q9rMvn7NsfgC/dh66UHiFO7woNZMi6jcvClEbT+jZ?=
 =?us-ascii?Q?qR0a6/FmGW2MmvaCYaMGroR7rUNhQfF9Dm9gga4+1ODRGFuYwZo1MxsakDqK?=
 =?us-ascii?Q?QWOO3Io+4b+i9bqlCszwt+fPV81fp5U55S5oGzgOjrf/1+gJTyXUi+Ag+NUX?=
 =?us-ascii?Q?abLYjkqx7ptig4ca/+3seEFbnCQhiKU5pzZchSEvAIEb6lTVbiyzcbRaGHn4?=
 =?us-ascii?Q?p/HyHWZqbDnZF2mtZL6miZvt+TGmPpoUTN6mEtAt2vkACm9rG1whOZxWvAzQ?=
 =?us-ascii?Q?+NrGQ0iX8VpHNutpUQdYr7FGZp8x3xT59MXA2WDIqXfMkCcWwB86DaP/lX6x?=
 =?us-ascii?Q?ygHVWBKRSa7Nyhz9+D6C/tS3m/naYnMi2hvFbC3G+bFCWuiFgiJC2uhCVI3H?=
 =?us-ascii?Q?7F/gwDv0xVy5/gKBjvGs7yIvzxbks7anVzVPm9ps92Rj3s8ZnR6oMQCDykJT?=
 =?us-ascii?Q?1WYPJz8bQpcmvFSnph9vn5DQFq8N3Seo+5sfYtTj+17BMMGkzyoTpoDiJeZe?=
 =?us-ascii?Q?qYLQY6mBy8INw58FN2jDcDQqMmnI/3QjkqbZ64Wf7GBFBGUtjNQXR9uRpjV4?=
 =?us-ascii?Q?jsI3wRsxzNqo6OwLin7tS7Ww71OhWZqGymakJ5NPa065megQ2JniLe6Q7+rt?=
 =?us-ascii?Q?S+VTZpeCwoDRPVNnwZDjq7vSREGIGKKNWFcq8bhj3NQIamtAi+ZIfCysMvql?=
 =?us-ascii?Q?DyIK1/rIJ6va25J64DS0tZdQMR7f+PmqpeFPnGwKQ7Civsf1rA3fe9WTtZhl?=
 =?us-ascii?Q?CzKcgdSSAKZAOrnF6iqIJ6WOwhKyzWZPRXAOInNT3yHTD5I9himI74B9WDqv?=
 =?us-ascii?Q?G2HJy5hU8jYDHvB76pztuk/pCh41E/JfIAJ/j2QzmHYMVNZTY4Q/1inATq9M?=
 =?us-ascii?Q?0BlDHIvaLUOePmjIgKsZpYsYE7oi9H4ISnvKUs3ExVGgj8ZN+ffpROhPP4TB?=
 =?us-ascii?Q?w8qCH3Os4kqfwaHTl2PLH63noGVPFGIOg6jUgOpGKI2zZFM5HF0Vp0ENfPvP?=
 =?us-ascii?Q?yH2Mu2wOWo5m8+SIaSWkwuzJjgptQfVD5i4MIzfeH9MqveuMqyP767cB9KkC?=
 =?us-ascii?Q?IN0GHIjZ0prp2H03JJQlxKHKiFNNt1AOFWN4TBCRW7pXz2rZTvV0yrdF4oRo?=
 =?us-ascii?Q?AocGHOLowN+h656QD8L45V03rCrVwaaaP4PVEe3wUEe1zEI+vFQJHAA3BYAf?=
 =?us-ascii?Q?MN2t5ce+jMu/CvKk5w44W6md2SmGmkq874spSibCMZS26mOA9jo9mn4wNA4b?=
 =?us-ascii?Q?CGGMmQYFFAisg3J5aH6kZO1ru7DxbC98ccZEueIc5fWmfy6Xc5tNsYArevh+?=
 =?us-ascii?Q?Ou44tNKvEifirVl+NkZDQYU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45d3b1c5-2091-42f8-f69f-08dd5f77922b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 02:02:11.5813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W5lKc+PCqxSyiXiJiYiakhksnlYgFGj8/98XQgMVUFnQI0Jw6aG+DPBLp2NpBnZi7cgblcuF5BOhHU7poLuagcUucZjsQtxfC2JhM3EUtIZRUwOPPfXjVA+lHQMIO2l9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12901

We have similar but different function names

	snd_soc_dpcm_fe_can_xxx()
	snd_soc_dpcm_be_can_xxx()
	snd_soc_dpcm_can_be_xxx()
	             ~~~~~~
Let's unified these to can_xx

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
v1 -> v2
	- tidyup can_be function name change

 sound/soc/soc-pcm.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 403edd2fd8cf..4308a6cbb2e6 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -36,7 +36,7 @@ static inline int _soc_pcm_ret(struct snd_soc_pcm_runtime *rtd,
 
 /* is the current PCM operation for this FE ? */
 #if 0
-static int snd_soc_dpcm_fe_can_update(struct snd_soc_pcm_runtime *fe, int stream)
+static int snd_soc_dpcm_can_fe_update(struct snd_soc_pcm_runtime *fe, int stream)
 {
 	if (fe->dpcm[stream].runtime_update == SND_SOC_DPCM_UPDATE_FE)
 		return 1;
@@ -45,7 +45,7 @@ static int snd_soc_dpcm_fe_can_update(struct snd_soc_pcm_runtime *fe, int stream
 #endif
 
 /* is the current PCM operation for this BE ? */
-static int snd_soc_dpcm_be_can_update(struct snd_soc_pcm_runtime *fe,
+static int snd_soc_dpcm_can_be_update(struct snd_soc_pcm_runtime *fe,
 			       struct snd_soc_pcm_runtime *be, int stream)
 {
 	if ((fe->dpcm[stream].runtime_update == SND_SOC_DPCM_UPDATE_FE) ||
@@ -1632,7 +1632,7 @@ void dpcm_be_dai_stop(struct snd_soc_pcm_runtime *fe, int stream,
 			return;
 
 		/* is this op for this BE ? */
-		if (!snd_soc_dpcm_be_can_update(fe, be, stream))
+		if (!snd_soc_dpcm_can_be_update(fe, be, stream))
 			continue;
 
 		if (be->dpcm[stream].users == 0) {
@@ -1682,7 +1682,7 @@ int dpcm_be_dai_startup(struct snd_soc_pcm_runtime *fe, int stream)
 		}
 
 		/* is this op for this BE ? */
-		if (!snd_soc_dpcm_be_can_update(fe, be, stream))
+		if (!snd_soc_dpcm_can_be_update(fe, be, stream))
 			continue;
 
 		/* first time the dpcm is open ? */
@@ -2007,7 +2007,7 @@ void dpcm_be_dai_hw_free(struct snd_soc_pcm_runtime *fe, int stream)
 			snd_soc_dpcm_get_substream(be, stream);
 
 		/* is this op for this BE ? */
-		if (!snd_soc_dpcm_be_can_update(fe, be, stream))
+		if (!snd_soc_dpcm_can_be_update(fe, be, stream))
 			continue;
 
 		/* only free hw when no longer used - check all FEs */
@@ -2073,7 +2073,7 @@ int dpcm_be_dai_hw_params(struct snd_soc_pcm_runtime *fe, int stream)
 		be_substream = snd_soc_dpcm_get_substream(be, stream);
 
 		/* is this op for this BE ? */
-		if (!snd_soc_dpcm_be_can_update(fe, be, stream))
+		if (!snd_soc_dpcm_can_be_update(fe, be, stream))
 			continue;
 
 		/* copy params for each dpcm */
@@ -2118,7 +2118,7 @@ int dpcm_be_dai_hw_params(struct snd_soc_pcm_runtime *fe, int stream)
 		be = dpcm->be;
 		be_substream = snd_soc_dpcm_get_substream(be, stream);
 
-		if (!snd_soc_dpcm_be_can_update(fe, be, stream))
+		if (!snd_soc_dpcm_can_be_update(fe, be, stream))
 			continue;
 
 		/* only allow hw_free() if no connected FEs are running */
@@ -2188,7 +2188,7 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 		snd_pcm_stream_lock_irqsave_nested(be_substream, flags);
 
 		/* is this op for this BE ? */
-		if (!snd_soc_dpcm_be_can_update(fe, be, stream))
+		if (!snd_soc_dpcm_can_be_update(fe, be, stream))
 			goto next;
 
 		dev_dbg(be->dev, "ASoC: trigger BE %s cmd %d\n",
@@ -2465,7 +2465,7 @@ int dpcm_be_dai_prepare(struct snd_soc_pcm_runtime *fe, int stream)
 			snd_soc_dpcm_get_substream(be, stream);
 
 		/* is this op for this BE ? */
-		if (!snd_soc_dpcm_be_can_update(fe, be, stream))
+		if (!snd_soc_dpcm_can_be_update(fe, be, stream))
 			continue;
 
 		if (!snd_soc_dpcm_can_be_prepared(fe, be, stream))
@@ -2623,7 +2623,7 @@ static int dpcm_run_update_startup(struct snd_soc_pcm_runtime *fe, int stream)
 		struct snd_soc_pcm_runtime *be = dpcm->be;
 
 		/* is this op for this BE ? */
-		if (!snd_soc_dpcm_be_can_update(fe, be, stream))
+		if (!snd_soc_dpcm_can_be_update(fe, be, stream))
 			continue;
 
 		if (be->dpcm[stream].state == SND_SOC_DPCM_STATE_CLOSE ||
-- 
2.43.0

