Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010017.outbound.protection.outlook.com [52.101.229.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9653BB9F1
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 06:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788158320; cv=fail; b=QDWyMqXc8Um63tTuvg/OUetjVd3oXtKO7un5ScJT6WSw3UR1GFThvyGN4IRa59VEVkV3xsIYzVlvdmFfOxUN2fpUrKgbkXL/0FlpqfuI2aGfysd6s7ap7Hsh1wdIkP0AqKm+FkKYeM+cWoHS3TdRSXLG0ueAsUlg4VDMBMRLCHU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788158320; c=relaxed/simple;
	bh=tT1Yt0w6Fko3AptIN0ZTijBEBFjtz240cjrVzMrNVyU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=mnIkYx7ujIVy2s+n2lk6XuUGGNZKiXCuYzL89B1Hz2Et//lI51isP15c4IEFvtUNUOw8PoCdQVEySJMFAIvHKXvinNXrbUSNj0tgie7D4cmCJRcL4rog5z6qE2xz6L+sBrkc3jqWMZwl88vwiXrsPpsgGRgTGPWLjlaNwZOyCsI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=BCChH6Vj; arc=fail smtp.client-ip=52.101.229.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="BCChH6Vj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sEMs1KkQEDjbNTffWG/Bcdg17x5SPHhDN4/A8KiSeBR2cPnoafD+8i7LOySu2PvHd49nX7rscGx2QTHgvoEOqHv4yBdCMZau8ZfWAeFBrxj2nz4/O7sqViErXf9Th5vpnWPljOAeKddb0dZeUQguVpjVzU4XCtaVYLY9GKBTf3heZf5J1pS+OzSGE0RO4zCuDijMMp+NFu7hzFU3gw9PA226kC78BjIU2UU/YwouLAigDgtUsXnOnA1C8fpJXYZHCiRqwGiPEOWU65JLOnopqHAIXgZQeEWDauoRZXRE7YN5ff+Tlx8M2zZEzro51U82FhAl5rtszm757XrE9AWWpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P1UkkKt0qZiNDeRTFOWSjy5rzDBWcmK9WE7AcChPJ8E=;
 b=AMEH9KPuUaTgww2aYER2lkmMMFiHQ9uaJDKLcHJ9PX7cNBXA7T85iwx9/abnRBvy1palBQxay7np7gUrpBbILC2TiLuWhXS/VN0bw5XtQTvFYhceiZJLv7FjUGvtHugYR0QB8xDpGfMtar9GymepEBBg5QvxDjzIQ5FZCa2Tz+FdxyZq39OLDHFQ6rM5pl0YrOYCz53ub7iM8NKF7mK3ZsgQz7iMHb7QJdy/61inNT1Zy/kkgL/q0aLDwoYDteV1QKqQnVq4IZWqkeL8N86ivE6lgM1bQYEowfUmd6KY1jxvsTTD8rcZm+A3eJXEeudlan1Wiep/7am5QWFgM08tCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P1UkkKt0qZiNDeRTFOWSjy5rzDBWcmK9WE7AcChPJ8E=;
 b=BCChH6Vjrs2GHKoJtDYzCYuqfUjIxyYYyXxegUkr+nvYkCMgXvcVuOofbrVZnB6eBUuVUDsD2t3vLkjSSMuzHqu8pI3xwke/N5gk7JvE3VrHwUgKb2Ffd54q4AxX3WtURAPIpf973JMqEionTGoLlH2V09CwG55tKcXouuqLRJg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by TY3PR01MB11005.jpnprd01.prod.outlook.com
 (2603:1096:400:3ad::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 06:38:36 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 06:38:36 +0000
Message-ID: <87pkyyssk4.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 09/14] ASoC: soc-dai: move snd_soc_dai_get_pcm_stream() to soc-dai.c
To: Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Vinod Koul <vkoul@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <8733vuu75t.wl-kuninori.morimoto.gx@renesas.com>
References: <8733vuu75t.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 31 Aug 2026 06:38:35 +0000
X-ClientProxiedBy: TYCPR01CA0152.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::6) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|TY3PR01MB11005:EE_
X-MS-Office365-Filtering-Correlation-Id: 11337c89-7b8f-40d0-426e-08df072a7bf1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|52116014|376014|22082099003|18002099003|56012099006|10067099003|11063799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	zEdWEuX0N1QIGu6BSkUw7rFoErHwXH6Ejn1bFENMWFGVooy/gmq4xNhIynJsldN35IkFbX3qaP3hNLi2a1sWa9mvAOqXKXWPSbo5x4Wr0LM1rEwy6pHW3t9AeGX2mC0CoRnHcLFoif0UUopKjiYcPfw8zv3Obq/Gpxf7CTybIuc7vJ9LqA+6LbYj3LY9HgSQ6aXDQNjqSiE7Neoye0TvX/+HiWBm4RVxqr6jhocHzxwbf3klkF2sIb7nZS8DJg4wUZxqq3fU4srDXNmJl2fXT7KNn1RY5ZE2dKhyK/tZ9gewhEjARKf+9ZI2j0Nx/cWTbUqcPS2XAIURHW+w2MDr2VG9rsWmoWsTwYEweK8t+0ZdkQfNVXXZH/MD701NUkc0YNJ79XzuZ5eU4TFTagSnUNs6qVZpvvKqpcQtUQ6JI3XLsamdSkOnEB6mSEkG6ZuN4TpYKE5dm4Rwdt2KVKWEtaUSjmqubdSXj1AfzkuiCaoUAoqRyhG0ld3Gr2mv0qfzOLVCL0a+e7+2ZYuM1864FiDGcvR84vYA2HGHwJKrfk/kTqttf4STh3wktPjo+cnUPSs3DRZ8E16c2n41C8Gr+1Mm6KIDyqQs81l2AgX4bpf8rWWg5xIlYxbnQrgP1shBvikECZfdwXoOmiLHbYEV2CN1hX9sY8jrrJbpc0aE7dr51n/Ydy6+VIxV6+0MBAZ7N8wC2fCkIlJ0YPlPJpamrJFsniOrtmjzblNSDZVk5g8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(52116014)(376014)(22082099003)(18002099003)(56012099006)(10067099003)(11063799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?49sLRtceC5BsYOEhHRd9oqFfdA5irgtONDS+doaqg804JBtsnUIjnM08tfW4?=
 =?us-ascii?Q?IRqVb/XCu05o5R5W8xCq2iBahfmxTOZmztOIuX8psnXYqbIRFo0LsofAlJCI?=
 =?us-ascii?Q?/aWP0cjUtXHd0D75AAj+l+z+dD+uJJ805vWyQfEEwDVW0jxTxiOJ5CVpjEbA?=
 =?us-ascii?Q?OBJR/v6m19Es9kgEzxnEe7woUVKxiVmDaujF4yahcdyBk69CNPe9KIRwze9k?=
 =?us-ascii?Q?J6dmchV2zDo4z8VFVpJ42F/n+QcfHI7PlvYyRtm9mEJVVd9y04j6eeDy8B+Y?=
 =?us-ascii?Q?h1u2dq5Zqmr1FYUWymFEbjb6lpRfjohQtd3w8o+spBzwQfuROU8IYLcv6jI1?=
 =?us-ascii?Q?P8DpYSRpvDtF8v4iN8KVNl1BvRkW4fU4SVIwv0QKMp22hEuvGS7fTwunKwIx?=
 =?us-ascii?Q?h9qO/NXdJhAg+/fsL9ylrkgLSV4H7SCGhtcJ9vEFYjbOEmaxfl7eeoads1ki?=
 =?us-ascii?Q?krRPtEB72DCxCbeqJ8G/Uz6D1vMo/3mWtGGr720gpqHamIJPPDqaVK90EZYB?=
 =?us-ascii?Q?2wQa34OP+Qz6EpPJlMgfN5SrYOMvz/1YfaBT8BmydH1yguunq90zplUa0sHq?=
 =?us-ascii?Q?6cLHKPvsDVgCCYSbrOVxFudZSnTiPxV3OepxmCbaY+niN/5O8w5pVN2mNdGW?=
 =?us-ascii?Q?Nm3V3mC7egFZcVKbvqzQXnI9On00i0Tr/+EPa/1HCIy4FcTXbY0/arhVO1k3?=
 =?us-ascii?Q?4fhn8vh3Rd+0s9sD1pEMcUea7FV0FInqDJi3DDna0RtL/0knwpdM91AcG/vM?=
 =?us-ascii?Q?bcuPrJE5XLHrcXpuI3jZNVUWt8gjUceeHGpga9ZL9e88i8389EBlrmTeK4vx?=
 =?us-ascii?Q?WJjJnxQ3hnkvo3WpDm7uphyutWptz08aOirUK3sOs4tz3UfzzbqK/Mlet374?=
 =?us-ascii?Q?NmZ7NKIz5txnqRUvwQQ5+GPQhFE5AwbaNpiXxZcge1NQlWJjLamkUnQ/X6jm?=
 =?us-ascii?Q?fOnNJOYuf7T4VVEe6BaVtUMIWm/TU+wkKsHQVYlmRYtafjwHMNP5XHaqPi3U?=
 =?us-ascii?Q?39Wn7OaxrvOkNTJk2yB+WWa51D5lnOwuEIEBdWZ2smf2pT1zPvirkelTJTKV?=
 =?us-ascii?Q?SV/+I73DOlvsk4vNIDQYoFDocIQ/dI4Xi5UzRDeb/qV8eU9vOmriH9wrrfvR?=
 =?us-ascii?Q?ZAksrHhW6LBkVZ8KAnP+OFcVMtj/skzvj0NYNi3ad4iTkwRf6j2D8xBQen48?=
 =?us-ascii?Q?tBH9E+qXSiSniPbg3Lk8exGetveZiRrs8Ax7WWjsH40AH2yjsa3Gz8S/T/XZ?=
 =?us-ascii?Q?jmEWoG05p+qCRFXx5Cj7kRve4bmn8stKkSNaN5ifLjgqw9Mc5Nq77C0wbPds?=
 =?us-ascii?Q?bH/XokH5+8qjrGEe3QzFOmVrE8rnmbNWcbuNVGeBpGI9D/Vf+ID8fLtixwTe?=
 =?us-ascii?Q?w3fOEwpV6w6iG8y/dNIWFzreTETkrr1dCYSDVZmVxBcko2qE3Qc8jn4CfGjO?=
 =?us-ascii?Q?u/9qj753CeCm1SNpSZ5sqFEXo0/DJ/SSGR/Ds17dNnsoozLlyb5Xjr5IrOhX?=
 =?us-ascii?Q?ZbMqI58lRG4E3ZvVJR8YS7AjAjssQaBIShVxGfEPmpgk8VWkDnNP+d7ayB8I?=
 =?us-ascii?Q?maeoRBoVSWNC8N306nCfGvh82KgVLfzCA3Us0Tc0/QXLeGvM95I6NiE02Lnb?=
 =?us-ascii?Q?BYSBgDmbrxT6QB+aTxdc8P7LuX9gO5VQOfFI/P9THf1iMuhz7AaA8dhGBDp+?=
 =?us-ascii?Q?SalBD75Eq4JJRNcH0f7bJTi1DDxnVDjAakfKbgDtTsDX/3ldlAgwayPBlVuw?=
 =?us-ascii?Q?KwdUObOmIFD4KyHdwqypUzXCt4CMNq72vQxYNKNE8fKppU0030M9?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11337c89-7b8f-40d0-426e-08df072a7bf1
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 06:38:36.0243
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uKq/kM0s7X1GF4ZUQCpRwy2DwvoNGOBMCOdLx4L8jhtp8fbaDtN/KyhV3QOhP5dZWLQbevzJO8n1y6J54HHzarMNuqnpysZ4nKfIoSgiaHAY7R3QZDwLFDWhPp9+64pj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11005

DAI parameter will be capsuled soon, will be not enable to access from
soc-dai.h. Move it to soc-dai.c

It renames function name
	snd_soc_dai_get_pcm_stream()	snd_soc_dai_pcm_stream_get()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dai.h | 13 ++++++++++---
 sound/soc/soc-dai.c     |  8 ++++++++
 2 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index ea5182344c0d0..e52ca6e289cb8 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -494,12 +494,16 @@ struct snd_soc_dai {
 	void *priv;
 };
 
+const struct snd_soc_pcm_stream *
+snd_soc_dai_pcm_stream_get_i(const struct snd_soc_dai *dai, int stream);
 static inline const struct snd_soc_pcm_stream *
-snd_soc_dai_get_pcm_stream(const struct snd_soc_dai *dai, int stream)
+snd_soc_dai_pcm_stream_get_s(const struct snd_soc_dai *dai, struct snd_pcm_substream *substream)
 {
-	return (stream == SNDRV_PCM_STREAM_PLAYBACK) ?
-		&dai->driver->playback : &dai->driver->capture;
+	return snd_soc_dai_pcm_stream_get_i(dai, substream->stream);
 }
+#define snd_soc_dai_pcm_stream_get(dai, x) _Generic((x),		\
+	int :				snd_soc_dai_pcm_stream_get_i,	\
+	struct snd_pcm_substream * :	snd_soc_dai_pcm_stream_get_s)(dai, x)
 
 #define snd_soc_dai_get_widget_playback(dai)	snd_soc_dai_get_widget(dai, SNDRV_PCM_STREAM_PLAYBACK)
 #define snd_soc_dai_get_widget_capture(dai)	snd_soc_dai_get_widget(dai, SNDRV_PCM_STREAM_CAPTURE)
@@ -615,4 +619,7 @@ struct snd_soc_dai *snd_soc_dai_register(struct snd_soc_component *component,
 					 bool legacy_dai_naming);
 void snd_soc_dai_unregister(struct snd_soc_dai *dai);
 
+/* REMOVE ME */
+#define snd_soc_dai_get_pcm_stream			snd_soc_dai_pcm_stream_get
+
 #endif
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 73ef977d23cc9..de3cfdcf2c84e 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -1073,6 +1073,14 @@ const char *snd_soc_dai_name(const struct snd_soc_dai *dai)
 }
 EXPORT_SYMBOL_GPL(snd_soc_dai_name);
 
+const struct snd_soc_pcm_stream *
+snd_soc_dai_pcm_stream_get_i(const struct snd_soc_dai *dai, int stream)
+{
+	return (stream == SNDRV_PCM_STREAM_PLAYBACK) ?
+		&dai->driver->playback : &dai->driver->capture;
+}
+EXPORT_SYMBOL_GPL(snd_soc_dai_pcm_stream_get_i);
+
 void snd_soc_dai_unregister(struct snd_soc_dai *dai)
 {
 	lockdep_assert_held(&client_mutex);
-- 
2.53.0

