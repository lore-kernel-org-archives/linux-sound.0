Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011000.outbound.protection.outlook.com [40.107.74.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D445A2AD2E
	for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 01:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789350401; cv=fail; b=PRDJBvQd6w75FaBwHYKW8vgtDGYUo4wb69ltaJ5Ciq4PLtUXr/jRhg/n47Qxfjjz3pJIk51rrf9nNvzoLjAcXn2XdHwZRzJCmqqA6zNAwxAuaELvrUvDsQIqCmm7/GCRkteHgq+2jDJlbliU8P/UzkPn7KmDBQylNA1hIaqilVU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789350401; c=relaxed/simple;
	bh=C9NCBxmvjh5ppXYdqu8MSFf9eyjCDLUMprZNmoMcdlk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=p3pggCTsfFGqtuMKIN2gcqfBpyMVmpGfb2+HMDEbzY5W3pLsP9tBeABQ1TQD/iAGBUBVoFuA5LwF0NFJVoE48kUtnxruI1Jr27DebYMQRU9mTTxHdzZZ+/qc7ndyhyMV0xMP5Pmgld/Gec3LZfTB06dZAfaeKu/wxkPjgLC/1U8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=kIFSVEtc; arc=fail smtp.client-ip=40.107.74.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="kIFSVEtc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o6k6p0uwePYGKGK9W3AnJPM/T8SWdIli8FsNjQDWRIVPzWSQZ1DH0ApDoSs/HFxjkKlISyM6y1d5Te1idCpDqEyXQ8Cj5bkOCVQkXDgpwG3mcUyMRyQkI6mSxGjMVGms/856YGOardfS+o4dwuiVWd544Nj1OoRr/IjHw+lgqO4BfNfNWigtMPCKMPjpbXQYzcFe0pZoJpJPi4+jsDoi2Z6myLEWLCiBCH39FAMp2MIW9EF2DoVSBGEQnBzHpD6UNFPQmwIpduCF8x0tRbVHEvGn1NSM6ElLnt2saaQEgT9eLW+HbhS03mi+wWEDcphPLvJpMkxzXg4FsmNm//RRsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TxWVgNLdtCPhBpuoHkydc3dmE8u8prAipTPi8P19aC8=;
 b=JfLmWuQSDyXAFHPmnop7HoLnXXseT1DP/Ad/va3vq2EhBab6z+b0tocLlzL1yTwEUr2zY0WRlVBg9u+WGJmynreVQqM+nlDVmrkJyPebkVdnJhlGkOhl5y70HyynNpqMjFqVSs987XVp2GE6vrLC+lyfF9/Fk0odx4Dl5rnE3M9mCtQKBt17NeAAqVNay9ZGS3xkKdI5l3U6aF7sce/vCTmnCdd/tUadsyLcT5Sf5PdpY6wrmq0tdgIfLhOuZjE5Cpf1TUnoiIqi+zWu7ogCNG5qCk4+78AwmmR0qcBN36J2k59ttTswAbvIJlGWVj+5mM3Te2s732O6gohezL6N+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TxWVgNLdtCPhBpuoHkydc3dmE8u8prAipTPi8P19aC8=;
 b=kIFSVEtcQQLfATZeTyHeYCyqwXiOddxE9HIEMga4fqIMAZqgK5gmKF8gTIlSXPHH/a8t6/Ulnvp70NlwSfbR7NA2BPjBjwVL0BN7urDkT5NXEWOVmbhNpLJhFrRbkBfC5+Da24qJ6TBjKsJ1CE/6UjgSkifsZCa/I7FI2DMBh1k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12) by TYWPR01MB7202.jpnprd01.prod.outlook.com
 (2603:1096:400:ec::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 01:46:36 +0000
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45]) by TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45%6]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 01:46:36 +0000
Message-ID: <87fqzcli4k.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 08/10] ASoC: soc-dai: rename snd_soc_dai_action()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87qziwliaj.wl-kuninori.morimoto.gx@renesas.com>
References: <87qziwliaj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 14 Sep 2026 01:46:36 +0000
X-ClientProxiedBy: TY4P301CA0081.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36f::15) To TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB14118:EE_|TYWPR01MB7202:EE_
X-MS-Office365-Filtering-Correlation-Id: 83567f8b-d0cd-4b7c-8f18-08df12020325
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|52116014|10067099003|22082099003|18002099003|56012099006|11063799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	IXhEz9Ow/uwnmMStljiEsPnxzmug0UX53j9df9SKmixcnMNh4WzNVQnre14cc+4QVGbGtqqgvfxIHxrYd7vpiO1mRFdRiHDdOdNJIeWc+NPNp7wck3ouJu8EJRWZYRj4MUG4pS6qsTHJSRebZcKRwslcZTgbT/bzXZgU+huWtnP5D8ZngTSd2e5ju/WbiA9nzxSbiXuPg6fvUPJg0Il109LKqvxilGoVtpPrMgAZZGixrekFvvZNgc+8DFi0Nk14FYwvbpXKPVFTesu69akvfhTCfQUtBW2HsfzOn76xuxBM4fvghluQNQH7WTBTAU0MZIPKmUzyl4e9vzQ25/Ltd0P3mR9bjrioetgaTsJuXYOE1yOx23mffuvpmcO/aLcY1jS7gPCgz1lIRUZ3wwBWgZVpl8eY3Hlpu34RzYoPlVXUyt/NLYJ5TaBMlzDLBDQOSNCmS6frP59vkAyixBjJZaOdNq0KcemEtVo677Z7/SzsogfZ+0o6OMZ7weevl3/7hXEaElL/LyhH69qoRLFbLEBw3QlMRiqcIO9Aag2zJyLhv7drtgEOBxNzxtTKuAJYk/QxPG5nfuXrt2G6C9T/4RariuQEV0on+P31dPBBU/BAOQ0Zs8awGiFBEfL0T/hXxC4rXI3YHUrm9jMhE+qfyA1jtMe3zU6W7DeyIKQ3k567Xx60Mp8KPYLqL0+G7yp29mgRrj10J7in10qCICYkHaiFLq65rzsru2O+xFEvkog=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB14118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(52116014)(10067099003)(22082099003)(18002099003)(56012099006)(11063799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1VjLS3Fqd+qjMe+yawozGDaU/LicjH9OoGJ92hafQGzEUksV5pjOOANP20Ft?=
 =?us-ascii?Q?Luhfd0Trt75Em7e3JiArvYoIU/oVrTxZ4dhVVm6R5mXkB1rzcYsYZzGlcHEv?=
 =?us-ascii?Q?HSpJxTjW/dr1lYfPCmj79lFj0cs+5BSN9hqMHtfA+xT5DYfsKUls/g8z6OgA?=
 =?us-ascii?Q?82YrcwUnxDw6iHaa4UGYsoShsJWVp7elznocmQBu5Y7uQyDjjhjzhPnZSC/O?=
 =?us-ascii?Q?GZ+Il89daJQe8BxrTZbe6rEaEnbWK5/E7xK/ETYFWYvWIc3OGgCXAUknUdoI?=
 =?us-ascii?Q?upzOCyaJw/aVEF9maVQQiZ0D3Nfs28Gli7V7xlQVB0lRPrO5Ku1ErszxTdd+?=
 =?us-ascii?Q?hn8T7nwoVnqfeuD1PiOGN3uO0kzcZDZXAYRaqOf/ShKJ7zjF7j8sgJZZgO6L?=
 =?us-ascii?Q?ZdIZSlbOtQmeNVu4IJLn3LkP9OCGYdElTp2ZudAXY1hdCahMFhmVv5my0cUi?=
 =?us-ascii?Q?EpFRAvpsJ8n9tLmVvxhWs5/f+N4mf1fQIzu5VXdxf1HCKJH8GTkTfHADf/Lx?=
 =?us-ascii?Q?/MW+jJANMeWTvEGumsRIvU6WKot4yOWCVyFJ3mLgbnlT4iyEKRRfVRaaU5p3?=
 =?us-ascii?Q?9k08YvyxeWRFUxIt+LNKZ4NyW1F7c2hu3+BZ8XEL6Cf8eAsVNhw8C6zupfJl?=
 =?us-ascii?Q?YQYnVjP857S7cn7lFFlfoOeyEhg/NC/yDBYEF13tk9wK926Pkn5tZKyM6g4j?=
 =?us-ascii?Q?nX5XtupvJBNjiecOr37RmkFrfvaYucjaTIbewES4u6VRo46zjLsT6lNBVx6J?=
 =?us-ascii?Q?bQj+N6dmX1FIufOwErfvS/1T+Pk312pnArV2T/7bhxp+M/iMqbZUdBwoCFTg?=
 =?us-ascii?Q?9oyPtOWTTh1VeMM3A0FaIRAmYt09BKxq9h1EsdJSMPMQzt6Lfn0zFD+JIaia?=
 =?us-ascii?Q?6Sdzc/+0KzvDUgoDkl/pvSAgLRsN56MBPqKvEM8aTZrRKt6hQ7K3Wxn6FTq0?=
 =?us-ascii?Q?0VwFyLWgTKQmOGM48SyyBvvZF3lPYMHIhgBAzeFSWff096UwcjYRYP0UhdoJ?=
 =?us-ascii?Q?dbDi0qwKguuubS82LeFGcjelZwc+1rPQl0VRQdp4Wkc7gzriAvdUmIcaEEfd?=
 =?us-ascii?Q?Q8igWlvrJvQ4fGsoHXfHaoanERHC57ct2KHPgVekGjlLimdnuqDlzrijkuNg?=
 =?us-ascii?Q?ScuMXgq1GoIVrgzG+K8trPg2aq0R0xwxJ4/jo+GPV8c6ckrfU5q7y3W5Hoxb?=
 =?us-ascii?Q?xVOcIX5ykPh1nIrE5R2k8xSysqkOwksQFpWaJb9j9ucQrhFpxZs7/LKm/G09?=
 =?us-ascii?Q?ONtEE5Ic/Riyg4MNkBoJW/S/YbZAigSb7UhkpSjM/ZyAmI0ENkJ4QxBYgZpA?=
 =?us-ascii?Q?c5MGz5xfF5quR9J5XIDsOfnrHE3i1IkYJb/JOYG//ReWczdbCnz7YHM9dzRQ?=
 =?us-ascii?Q?5GcUnrp6+ONtKdpOch55F4xJ7djFCddPtImh0Lyd954cuSvq+ap+3VIp19Xk?=
 =?us-ascii?Q?B5W6B1T3fHklbfpnL6B/Az0Qy+M9sDWLKNKwN0B2gCDYk/G37shkH1jPBK49?=
 =?us-ascii?Q?S0WOJzGB0WvEcVfjybu0x8voscVcFO22wAweFWxMrZOB01O396OY/MgWxVeS?=
 =?us-ascii?Q?DN33YD7yEZlT6U/+5LDZM0NvBcbF5Fs/8XXgyfBdLHpuax91I4v/rqbuZSRQ?=
 =?us-ascii?Q?J9xOPJRNsgKW8duo+wZsW/AbY/Yqj2AgSJEQDyFfzphKNtFmD3/UM46cyV2M?=
 =?us-ascii?Q?WQRJVYBlY/+VEQpm6Ou4I7aRsDMdkqM1FSJJ2uINVw4b0WbSw10lzLp99wB9?=
 =?us-ascii?Q?8oaU2FoK5oX73r3QzOr7hrRtEN8Sj1bsY/SrvtYnbo5g9ESqzUbH?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83567f8b-d0cd-4b7c-8f18-08df12020325
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB14118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 01:46:36.3446
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SrVF9P3kftegn+vuXNqY4CjNbxSdBSSDr3ahgHPulj/Ol2U8nn+T5EfmkBZd3GDtfH3YcuhDuAtsGjhePyInA7WNa2pbh8DpHGQmeyZSlYY7vpfBEegkElbp82A0uHhI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB7202

We have snd_soc_dai_action() (A) and snd_soc_dai_active_xxx() (B).
These are related function, but implemented as different naming.

Let's rename it.

(A)-	snd_soc_dai_action()
   +	snd_soc_dai_active_action()
(B)	snd_soc_dai_active_stream()
(B)	snd_soc_dai_active()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dai.h | 16 ++++------------
 sound/soc/soc-dai.c     |  7 +++----
 sound/soc/soc-dapm.c    |  8 ++++----
 sound/soc/soc-pcm.c     |  2 +-
 4 files changed, 12 insertions(+), 21 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index 52c7f4282ef55..27a85abcab51f 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -231,18 +231,10 @@ void snd_soc_dai_suspend(struct snd_soc_dai *dai);
 void snd_soc_dai_resume(struct snd_soc_dai *dai);
 int snd_soc_dai_compress_new(struct snd_soc_dai *dai, struct snd_soc_pcm_runtime *rtd);
 bool snd_soc_dai_stream_valid(const struct snd_soc_dai *dai, int stream);
-void snd_soc_dai_action(struct snd_soc_dai *dai,
-			int stream, int action);
-static inline void snd_soc_dai_activate(struct snd_soc_dai *dai,
-					int stream)
-{
-	snd_soc_dai_action(dai, stream,  1);
-}
-static inline void snd_soc_dai_deactivate(struct snd_soc_dai *dai,
-					  int stream)
-{
-	snd_soc_dai_action(dai, stream, -1);
-}
+
+#define snd_soc_dai_active_activate(dai, stream)	snd_soc_dai_active_action(dai, stream,  1)
+#define snd_soc_dai_active_deactivate(dai, stream)	snd_soc_dai_active_action(dai, stream, -1)
+void snd_soc_dai_active_action(struct snd_soc_dai *dai, int stream, int action);
 int snd_soc_dai_active(const struct snd_soc_dai *dai);
 unsigned int snd_soc_dai_active_stream(const struct snd_soc_dai *dai, int stream);
 
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 112e04049d10d..b8bdbaf200b05 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -707,8 +707,7 @@ bool snd_soc_dai_stream_valid(const struct snd_soc_dai *dai, int dir)
 	return stream->channels_min;
 }
 
-void snd_soc_dai_action(struct snd_soc_dai *dai,
-			int stream, int action)
+void snd_soc_dai_active_action(struct snd_soc_dai *dai, int stream, int action)
 {
 	/* see snd_soc_dai_stream_active() */
 	dai->stream[stream].active	+= action;
@@ -716,11 +715,11 @@ void snd_soc_dai_action(struct snd_soc_dai *dai,
 	/* see snd_soc_component_active() */
 	dai->component->active		+= action;
 }
-EXPORT_SYMBOL_GPL(snd_soc_dai_action);
+EXPORT_SYMBOL_GPL(snd_soc_dai_active_action);
 
 unsigned int snd_soc_dai_active_stream(const struct snd_soc_dai *dai, int stream)
 {
-	/* see snd_soc_dai_action() for setup */
+	/* see snd_soc_dai_active_action() for setup */
 	return dai->stream[stream].active;
 }
 EXPORT_SYMBOL_GPL(snd_soc_dai_active_stream);
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 06b85313af126..dff23127de429 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -4010,7 +4010,7 @@ static int dapm_dai_link_event_pre_pmu(struct snd_soc_dapm_widget *w,
 		if (ret < 0)
 			return ret;
 
-		snd_soc_dai_activate(source, substream->stream);
+		snd_soc_dai_active_activate(source, substream->stream);
 	}
 
 	substream->stream = SNDRV_PCM_STREAM_PLAYBACK;
@@ -4021,7 +4021,7 @@ static int dapm_dai_link_event_pre_pmu(struct snd_soc_dapm_widget *w,
 		if (ret < 0)
 			return ret;
 
-		snd_soc_dai_activate(sink, substream->stream);
+		snd_soc_dai_active_activate(sink, substream->stream);
 	}
 
 	substream->hw_opened = 1;
@@ -4150,14 +4150,14 @@ static int dapm_dai_link_event(struct snd_soc_dapm_widget *w,
 		substream->stream = SNDRV_PCM_STREAM_CAPTURE;
 		snd_soc_dapm_widget_for_each_source_path(w, path) {
 			source = path->source->priv;
-			snd_soc_dai_deactivate(source, substream->stream);
+			snd_soc_dai_active_deactivate(source, substream->stream);
 			snd_soc_dai_shutdown(source, substream, 0);
 		}
 
 		substream->stream = SNDRV_PCM_STREAM_PLAYBACK;
 		snd_soc_dapm_widget_for_each_sink_path(w, path) {
 			sink = path->sink->priv;
-			snd_soc_dai_deactivate(sink, substream->stream);
+			snd_soc_dai_active_deactivate(sink, substream->stream);
 			snd_soc_dai_shutdown(sink, substream, 0);
 		}
 		break;
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index aaba9ca724e61..7eb58c4b6fc31 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -368,7 +368,7 @@ void snd_soc_runtime_action(struct snd_soc_pcm_runtime *rtd,
 	snd_soc_dpcm_mutex_assert_held(rtd);
 
 	for_each_rtd_dais(rtd, i, dai)
-		snd_soc_dai_action(dai, stream, action);
+		snd_soc_dai_active_action(dai, stream, action);
 
 	/* Increments/Decrements the active count for components without DAIs */
 	for_each_rtd_components(rtd, i, component) {
-- 
2.53.0

