Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011065.outbound.protection.outlook.com [52.101.125.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4AA1D7998
	for <linux-sound@vger.kernel.org>; Mon,  3 Feb 2025 06:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738563668; cv=fail; b=UXSKmEhURIafs4bqh5Qn1ChtYSrAAfPZ3EfDyOKlPZJk1KQ26RZEq9c32LJDobsiUV/7Tm1wK6fsfMb6DwvjLCAjw3AhAbzzkhDlPBLo8ovHN6ZaTOCXAjB2OGIMeV+0L0nd74qgreJ2ASwa1oybgN3qGkbJ4DIqSlrTIpgoeIU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738563668; c=relaxed/simple;
	bh=A7YiVsue5VvvxZlhlCucooQJ1jqNZtS7Z5+RPKEt0Ng=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=iHCZayczf/9NvfLV26E68TCDYaIiPx7lDPmLwBGkXb8t1E94RFzLYGFQFqPoAgvKzpSPXhzd3wDZCjVBNDCUa+d4csVguCr/eiTVCzWA7++t1JSgGVDE7SVJWWUpajiK1/VTdM75LmtSCtFVuyM4gSZVddBV7OO74KdPne7p3Xg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=fPmlr/q9; arc=fail smtp.client-ip=52.101.125.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="fPmlr/q9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CvmSEMeHPF0C8HJmDxUia4T3m39I+cf541tK6mw4H2HkmR7T4FN7xKCAGIXS7I//z2/7oD1SpRF09tdwEJj3VKeGIMCPCJdQC4FMj2BOvld5Y3YjM8l9KtCJUy53i5LAWMZuF2VNdnSn2q9MVP2dSMQ+OcedtmNBaInArg21eTOMx5dSJJuAwlA9yHAFP+c6afhcE+AfXXwt2i6EJcW77xULpNysAL5wz6dz63iMVit3mN1dbgRN8r5unz1lDZ+XgVxQmJHjywEZHNtiEqgkihKRBCdG67daWz+znTPj1UScUOSaSHm9ZZFTpkDzYgu1ZHdkI7ZnBiJvza8scd35VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zSZXzy755ku0916s7MgbRyhMd/OhV2SyZkbnFN3OOlk=;
 b=yXrShXK4a0G9W50cIeyd6oqQhXh4Jalm6QmA7XZwXgi2BQ6qi4yYr4xDKhZt2ZdLQwMzJUHb0EJ++PRyXI1ssGV/mMdUXDcsr7JD8rNR3skJ/O2Sc6oNsBfsKSfZiuegNta81Qmr0AC+UWRtWHxfeG53c5UXB31FDtul1djyQ8bTfu4VYKpzi/kxZHY28AbxBHvZYZbVxolBbrmCz7Yvq+R/eLHW0mDVW7ZxnnvarXEEtPAAFvX+sGXI4knBTQ5NQXjjTmQp8+7eeWpibMLJfoN+jo3ZWmRZk7sQLFL8sWNY9EJqSYa6nqXRljzmrZx0+lOgEf+Y+SUHBEgwfUtKXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zSZXzy755ku0916s7MgbRyhMd/OhV2SyZkbnFN3OOlk=;
 b=fPmlr/q9/mVQywjzCiQdW9HzHzjLDUQvvIPYQ/c/RBCkApEekMoE3dSK4foAaHrVMA3w8JOULFjFO9iIk2W9tGT9Fye99xEPgVupM/kJW6sQIGrveVyyhuraB24mjgxYIYzLl/KaGyt7oO3UiRXgXnoTo10jTsMB3L5bt5SuNjU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB11036.jpnprd01.prod.outlook.com
 (2603:1096:400:3ad::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Mon, 3 Feb
 2025 06:21:03 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8398.025; Mon, 3 Feb 2025
 06:21:03 +0000
Message-ID: <87zfj3r1kg.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/6] ASoC: soc-pcm: use snd_soc_ret()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <8734gvsg5i.wl-kuninori.morimoto.gx@renesas.com>
References: <8734gvsg5i.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 3 Feb 2025 06:21:03 +0000
X-ClientProxiedBy: TYBP286CA0035.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:10a::23) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB11036:EE_
X-MS-Office365-Filtering-Correlation-Id: c1502494-8d7c-4f97-6ea2-08dd441aef6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6WmjDfMV/8DDWp374wx6Z5CRRt5HcG17olXBw+d/evMs1YW7oV1mULQiktvT?=
 =?us-ascii?Q?39Fi8Wl9x0uetGInCsBS/boPlRJaTt52DaGjAgKI76FSuExI6mQ6B00b9dzj?=
 =?us-ascii?Q?zWl22ot2ZFjavay0lAWZ3QL5NJV1sJkPFayK8izR7o1qLx76Qr2HhF0mSeqP?=
 =?us-ascii?Q?TWTpnQjtTR870BLeoHn7F7NOon1CBncQSfEriwqZmvFQtJm+JJB46H3x02w5?=
 =?us-ascii?Q?TcB9v0iie00QyrdrILFSyu2WK/b98AK+IFmSpq2UXyMocy9s03uuzr6+Pmtz?=
 =?us-ascii?Q?7wTGMr1Q/3c4kcW6hzJnCTrujw8T9DQtVnUVRXwatZLePCvebIZEj/b3XCeS?=
 =?us-ascii?Q?LC4nhArB1Sh5BVG21TbGE+tVkN9ZbUT3uttSknwjsqcZ84PpyQ3COVTrNUi4?=
 =?us-ascii?Q?kif4tz6QDa/+yvLhvZCQHgiuOsPWywfKH2ekmDd8el+DJTldydk7sYit4uo/?=
 =?us-ascii?Q?jhRW3pvPVN3Dm0bdQu7i9rd4j65fGBNKpX9d6EwUyWH2HfVuHT44jHOOBAz4?=
 =?us-ascii?Q?6lHoI3PCyiDLi1eIEeiYzGPCLjOOQmDbq5PDvsflJ3w7wj1IddJXieHNWYd5?=
 =?us-ascii?Q?OqL3QOx9FyIK8bN0H9kMB7g3M4lJFhf8YHeQrbMDyqFO+IglXE1HGQigdAv0?=
 =?us-ascii?Q?CjhOw8u7M6bEybweu7Pah0fQ1Ct2cjZD9JKhYgkHLHRsizAxd0uv4d2FhMZU?=
 =?us-ascii?Q?z+dK7VR74t8bc9qr2s/8aC6Bhg+BaiHCxd7Ohiz6Eq08paHfS5E63sJrzcEY?=
 =?us-ascii?Q?QJPmSY5wB9DJRVcyCWxSGrwZ5ZtPNQ6jyQpaFeA+y0oYnXqUUuRD1rRUMvji?=
 =?us-ascii?Q?WuMT4kJsKi3ZkHQxafRUV4HmtuUFJSRhrloP8iRYYKkVZa0ocRyj1Hm69dSg?=
 =?us-ascii?Q?9Oz+BQj4zN+EgYfcBIIkBzKd7Kic/ynHfInjJm/HZE0gDHIprXiwD5rQ1knO?=
 =?us-ascii?Q?/P7WbhpdPO8HOOxAFcNHxAwWudfj535ujAGb5XBs5FcqoqVFee+czClGZVMv?=
 =?us-ascii?Q?ua7snq4avemz/6AFIFmWBlExAKMSvK6FkIXte//wJbSrJniNwYppcrTDcnU6?=
 =?us-ascii?Q?Al7u2/xEPEaYB6MA3Eyr8t4fdOVpkS0Rk8uH33WZnMylsMgkKgP+y23WJ/ZG?=
 =?us-ascii?Q?ggQ3Psv58Z84rc2+EdWovvUzPBhtI5WLyQra6fI5Sg0XI5kPK60s680nF2qr?=
 =?us-ascii?Q?vZMPaw/53zuvjn28M7xYNmQ/SAJzj83tlai7eJuY4zTY7szl1w7A1lGvQt4X?=
 =?us-ascii?Q?umG41RO0ju1G0/P3+ZjTMgAI05AmOTSVphO7bH6gkkHHaJR865I6LfCGjG4d?=
 =?us-ascii?Q?nthNtSJ7f1qrzocOUq8HLTPg3xLkt73cJSv2nv0091JvHsq6tSv9+KphXhgU?=
 =?us-ascii?Q?oQK9vARpG8WT3uHF7xsDyGlBAShDU5pn7rFJ++NQVVx9kLSEt8YS6TkxMkK9?=
 =?us-ascii?Q?k0ezVKpB7FSKaXeF9JAEmDK77j+/v0ew?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fRikKTaExBi5h1bNc6ZOswu8JzRLG8p8iOk4r7vpFoEAw6EfbS/p52OTnqEl?=
 =?us-ascii?Q?oszv29FuiTrXnET9jI7eEcY/LJirzabgZIWAOq2The91axuSBnb77j4RDMVa?=
 =?us-ascii?Q?5jHFC0CJ/+7o/PPGT39AKCzn+ncxWgq9X4fABuRBFlD42ZEpjVj9EhG/hoHf?=
 =?us-ascii?Q?nYPLwz8gFKGyRIn0UbZC/0U9yt5vyCYdNRgOiMxQMd9+LpFkY9RmbG1k9BMd?=
 =?us-ascii?Q?fRnf9JFn+ZIKoT0QGIk5FBfxNFmWU8Uj0G8rVtbIr/nKqmwyaudI4UWt6xKo?=
 =?us-ascii?Q?zJGj20IWHNn9ckMbmseINBLHLUXsuYuW9YxFXxxImq1vovZ4OVk1Tp/AeTMv?=
 =?us-ascii?Q?VM8A4STpG90KO3zaYdBHlrE2gZhWVv9e8IGWE6dQ6n00snd+EHK+XLXiWZkM?=
 =?us-ascii?Q?JDnY5cekqo1jV+sz8Lag+WDu3jTef9emGLfyye5nSzGwcNf7Ewi5BDz0kjxC?=
 =?us-ascii?Q?hyCBFNvHpodQttEOHq7ZpkBWA6m0mNvXdpVMREW/oyQULxH6zmbazM5/jAP9?=
 =?us-ascii?Q?CGHVYe2kRjB1ch3O+lBMpFHkuB4laAXtEgtPL/2Z3h/QjjGWmuslgk8BezEN?=
 =?us-ascii?Q?GrPD5Y55ItpLmEs2ZJA6umXPW7cZDiE89V565lKu9ZqMnpvSAHHWfmjoU+yV?=
 =?us-ascii?Q?Btf9ZzuTSgAlYy0bLn4OB2Pcl/C4jnDU+1id+/mhy86qM/t/KYTplK1KOGFX?=
 =?us-ascii?Q?pjjQclmmmMfkvoRTyfZnogwCQKplOMPj7qOw7JzhRDUe5kHei8tklhEFmc2Z?=
 =?us-ascii?Q?fNkApJoZ+D7APMzRvwA/KLlHcl34RbyK+0bvvWuul1tdsoRA9X51Lvdg/zVH?=
 =?us-ascii?Q?BXVSioNtcRDwHXFh2mObF5S3Amu7+5+JRwhMktVKp8lMiWa7YXaIGmPLa+gP?=
 =?us-ascii?Q?sOtBGgcd+JjTVNntgNH9+0nM/rm0YlI7ExQuaktITjqDiOeflqHJIvJxitY+?=
 =?us-ascii?Q?hW5uK0ZUk3mBqGX5L5/E8WQJUk32RL/s3C9EgCPwSxEIokwiKCLH3Tt8Fq/h?=
 =?us-ascii?Q?1TUluK3DAMRPmV80PPAKlMVcrIVDOnMssvsnD/FAA55bgeILYULEB/Mr0kOw?=
 =?us-ascii?Q?4jMqY4X3xh2nx2glMW3CLR/dp48smakp4+XaDzXw2AWmgSr+YiiRqp3JE3Ez?=
 =?us-ascii?Q?Q4Ja1gcrqsdxi2NxLf15HVaiQNdp5/Li/ZAw1kaW2ycbgf42CbH7Q9peGXrl?=
 =?us-ascii?Q?7r3dNlJxhTT+gABaISne4Ux3aK5eSt6BsReW9do311mNqlxzWgcKfhvvUYUb?=
 =?us-ascii?Q?V5s/xTG9vToFIkQfAO1L4Wo6ITBpmqotY6hVS2xtFNtsV2vhKcWcv9sSX8UR?=
 =?us-ascii?Q?XkEhupJf1pSaatzhEE0O5+5oFieLMdD15fozNyQnby1HlatJfFu3t9ij6lhU?=
 =?us-ascii?Q?TcrE7R4rJtQS8bKwNaUR+7K7s92VaEuNFNKIbuN3J3Re0/gVfQ8NanrpUQdM?=
 =?us-ascii?Q?/F1dEenn0QBZ1J5lWoxTzyelYRyd0T9toN6EVbQwOxh0jbtBW76wfMSAB/ZD?=
 =?us-ascii?Q?P9k5X5QV9avxkOfF/oK7ugA6U/JKI0xOH87jY17kwwvDPZqJVmPheRTZ2mdc?=
 =?us-ascii?Q?2nBWbHignEFbf4d03DD2ucPSAmxHqP1LAKSVQiU2MgyuvMa4l5Sd45kLG1YK?=
 =?us-ascii?Q?ds68+NaPJczWI2RtFaelypE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1502494-8d7c-4f97-6ea2-08dd441aef6e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 06:21:03.4204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QCLuu/RriIctUlEveGSC5h6dbCpasZDR4MUcJJEAb0d7kHfnxcGHC7qTdyKO1of3I83JY8jwCHMNPioYQ8znMhZLNhwuGpaMWvdWGPitevPYXbbOnDkvcLLLandeBMCL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11036

Many functions uses below style for error return

	dev_err(dev, "message");
	return -Exxxx;

We can merge these into snd_soc_ret() which can use same error
format. Let's cleaup code.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-pcm.c | 96 ++++++++++++++++++---------------------------
 1 file changed, 39 insertions(+), 57 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index a2caa146cac2c..ebe99d369ca9e 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -238,11 +238,9 @@ static ssize_t dpcm_state_read_file(struct file *file, char __user *user_buf,
 	int stream;
 	char *buf;
 
-	if (fe->dai_link->num_cpus > 1) {
-		dev_err(fe->dev,
+	if (fe->dai_link->num_cpus > 1)
+		return snd_soc_ret(fe->dev, -EINVAL,
 			"%s doesn't support Multi CPU yet\n", __func__);
-		return -EINVAL;
-	}
 
 	buf = kmalloc(out_count, GFP_KERNEL);
 	if (!buf)
@@ -460,12 +458,9 @@ static int soc_pcm_apply_symmetry(struct snd_pcm_substream *substream,
 		ret = snd_pcm_hw_constraint_single(substream->runtime,	\
 						   SNDRV_PCM_HW_PARAM_##NAME,\
 						   soc_dai->symmetric_##name);	\
-		if (ret < 0) {						\
-			dev_err(soc_dai->dev,				\
-				"ASoC: Unable to apply %s constraint: %d\n",\
-				#name, ret);				\
-			return ret;					\
-		}							\
+		if (ret < 0)							\
+			return snd_soc_ret(soc_dai->dev, ret,			\
+				"Unable to apply %s constraint\n", #name);	\
 	}
 
 	__soc_pcm_apply_symmetry(rate,		RATE);
@@ -496,12 +491,11 @@ static int soc_pcm_params_symmetry(struct snd_pcm_substream *substream,
 		for_each_rtd_cpu_dais(rtd, i, cpu_dai)			\
 			if (!snd_soc_dai_is_dummy(cpu_dai) &&		\
 			    cpu_dai->symmetric_##xxx &&			\
-			    cpu_dai->symmetric_##xxx != d.symmetric_##xxx) { \
-				dev_err(rtd->dev, "ASoC: unmatched %s symmetry: %s:%d - %s:%d\n", \
-					#xxx, cpu_dai->name, cpu_dai->symmetric_##xxx, \
-					d.name, d.symmetric_##xxx);	\
-				return -EINVAL;				\
-			}
+			    cpu_dai->symmetric_##xxx != d.symmetric_##xxx) \
+				return snd_soc_ret(rtd->dev, -EINVAL,	\
+						   "unmatched %s symmetry: %s:%d - %s:%d\n", \
+						   #xxx, cpu_dai->name, cpu_dai->symmetric_##xxx, \
+						   d.name, d.symmetric_##xxx);
 
 	/* reject unmatched parameters when applying symmetry */
 	__soc_pcm_params_symmetry(rate);
@@ -846,9 +840,8 @@ static int soc_hw_sanity_check(struct snd_pcm_substream *substream)
 	return 0;
 
 config_err:
-	dev_err(dev, "ASoC: %s <-> %s No matching %s\n",
-		name_codec, name_cpu, err_msg);
-	return -EINVAL;
+	return snd_soc_ret(dev, -EINVAL,
+			"%s <-> %s No matching %s\n", name_codec, name_cpu, err_msg);
 }
 
 /*
@@ -1319,11 +1312,11 @@ static int dpcm_be_connect(struct snd_soc_pcm_runtime *fe,
 	fe_substream = snd_soc_dpcm_get_substream(fe, stream);
 	be_substream = snd_soc_dpcm_get_substream(be, stream);
 
-	if (!fe_substream->pcm->nonatomic && be_substream->pcm->nonatomic) {
-		dev_err(be->dev, "%s: FE is atomic but BE is nonatomic, invalid configuration\n",
-			__func__);
-		return -EINVAL;
-	}
+	if (!fe_substream->pcm->nonatomic && be_substream->pcm->nonatomic)
+		return snd_soc_ret(be->dev, -EINVAL,
+			"%s: %s is atomic but %s is nonatomic, invalid configuration\n",
+				   __func__, fe->dai_link->name, be->dai_link->name);
+
 	if (fe_substream->pcm->nonatomic && !be_substream->pcm->nonatomic) {
 		dev_dbg(be->dev, "FE is nonatomic but BE is not, forcing BE as nonatomic\n");
 		be_substream->pcm->nonatomic = 1;
@@ -1493,11 +1486,9 @@ int dpcm_path_get(struct snd_soc_pcm_runtime *fe,
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(fe, 0);
 	int paths;
 
-	if (fe->dai_link->num_cpus > 1) {
-		dev_err(fe->dev,
+	if (fe->dai_link->num_cpus > 1)
+		return snd_soc_ret(fe->dev, -EINVAL,
 			"%s doesn't support Multi CPU yet\n", __func__);
-		return -EINVAL;
-	}
 
 	/* get number of valid DAI paths and their widgets */
 	paths = snd_soc_dapm_dai_get_connected_widgets(cpu_dai, stream, list,
@@ -2388,23 +2379,23 @@ static int dpcm_dai_trigger_fe_be(struct snd_pcm_substream *substream,
 
 		ret = soc_pcm_trigger(substream, cmd);
 		if (ret < 0)
-			return ret;
+			goto end;
 
 		ret = dpcm_be_dai_trigger(fe, substream->stream, cmd);
-		return ret;
+		goto end;
 	}
 
 	/* call trigger on the frontend after the backend. */
 	ret = dpcm_be_dai_trigger(fe, substream->stream, cmd);
 	if (ret < 0)
-		return ret;
+		goto end;
 
 	dev_dbg(fe->dev, "ASoC: post trigger FE %s cmd %d\n",
 		fe->dai_link->name, cmd);
 
 	ret = soc_pcm_trigger(substream, cmd);
-
-	return ret;
+end:
+	return snd_soc_ret(fe->dev, ret, "trigger FE cmd: %d failed\n", cmd);
 }
 
 static int dpcm_fe_dai_do_trigger(struct snd_pcm_substream *substream, int cmd)
@@ -2460,11 +2451,8 @@ static int dpcm_fe_dai_do_trigger(struct snd_pcm_substream *substream, int cmd)
 		goto out;
 	}
 
-	if (ret < 0) {
-		dev_err(fe->dev, "ASoC: trigger FE cmd: %d failed: %d\n",
-			cmd, ret);
+	if (ret < 0)
 		goto out;
-	}
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
@@ -2693,11 +2681,9 @@ static int soc_dpcm_fe_runtime_update(struct snd_soc_pcm_runtime *fe, int new)
 	if (!fe->dai_link->dynamic)
 		return 0;
 
-	if (fe->dai_link->num_cpus > 1) {
-		dev_err(fe->dev,
+	if (fe->dai_link->num_cpus > 1)
+		return snd_soc_ret(fe->dev, -EINVAL,
 			"%s doesn't support Multi CPU yet\n", __func__);
-		return -EINVAL;
-	}
 
 	/* only check active links */
 	if (!snd_soc_dai_active(snd_soc_rtd_to_cpu(fe, 0)))
@@ -2768,7 +2754,8 @@ int snd_soc_dpcm_runtime_update(struct snd_soc_card *card)
 
 out:
 	snd_soc_dpcm_mutex_unlock(card);
-	return ret;
+
+	return snd_soc_ret(card->dev, ret, "%s() failed\n", __func__);
 }
 EXPORT_SYMBOL_GPL(snd_soc_dpcm_runtime_update);
 
@@ -2842,10 +2829,9 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 	int has_capture  = 0;
 	int i;
 
-	if (dai_link->dynamic && dai_link->num_cpus > 1) {
-		dev_err(rtd->dev, "DPCM doesn't support Multi CPU for Front-Ends yet\n");
-		return -EINVAL;
-	}
+	if (dai_link->dynamic && dai_link->num_cpus > 1)
+		return snd_soc_ret(rtd->dev, -EINVAL,
+				"DPCM doesn't support Multi CPU for Front-Ends yet\n");
 
 	/* Adapt stream for codec2codec links */
 	cpu_capture  = snd_soc_get_stream_cpu(dai_link, SNDRV_PCM_STREAM_CAPTURE);
@@ -2887,12 +2873,9 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 	if (dai_link->capture_only)
 		has_playback = 0;
 
-	if (!has_playback && !has_capture) {
-		dev_err(rtd->dev, "substream %s has no playback, no capture\n",
-			dai_link->stream_name);
-
-		return -EINVAL;
-	}
+	if (!has_playback && !has_capture)
+		return snd_soc_ret(rtd->dev, -EINVAL,
+			"substream %s has no playback, no capture\n", dai_link->stream_name);
 
 	*playback = has_playback;
 	*capture  = has_capture;
@@ -2932,11 +2915,10 @@ static int soc_create_pcm(struct snd_pcm **pcm,
 		ret = snd_pcm_new(rtd->card->snd_card, new_name, rtd->id, playback,
 			capture, pcm);
 	}
-	if (ret < 0) {
-		dev_err(rtd->card->dev, "ASoC: can't create pcm %s for dailink %s: %d\n",
-			new_name, rtd->dai_link->name, ret);
-		return ret;
-	}
+	if (ret < 0)
+		return snd_soc_ret(rtd->dev, ret,
+			"can't create pcm %s for dailink %s\n", new_name, rtd->dai_link->name);
+
 	dev_dbg(rtd->card->dev, "ASoC: registered pcm #%d %s\n", rtd->id, new_name);
 
 	return 0;
-- 
2.43.0

