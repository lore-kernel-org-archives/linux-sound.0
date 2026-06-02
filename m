Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010037.outbound.protection.outlook.com [52.101.229.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03953364047
	for <linux-sound@vger.kernel.org>; Tue,  2 Jun 2026 02:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780368935; cv=fail; b=Pn3FABY1NlXMjAIuqRNlMfrlBOgJcSm/9rKZunrQpC/aX0WqT81QlGXLGReCMYmQcy3xO/kb359kZ1/cRG7TnDJJWVIgXN+TEFRwbgVjrTnROqbRO3+I4sYHranlJVE2rZPeXeDNhxrnIrkXNtyOdkvhuL/IfQA7HlkbpdMzlfM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780368935; c=relaxed/simple;
	bh=SSxncmNUUR0Fub1+oI54xmoZbxc8gMlOQuO2EpNZaQ4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=E/xiVxrs7bkr/w6vfPyuXsRAAdreyzNLYh+sfq/ZBCEd3Fzs5Q2E0RsLQpeAMUcv0PbIP3d0CBa8oz95vGlhUCyNf5tWSK1prtshu9qlWXR9fU7nh978949NeX7S5NzWzQM+NUoompOAVPmvf8KfAp6f2t9UD/DUPeiEVBOt4+w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=jtYv1rIo; arc=fail smtp.client-ip=52.101.229.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="jtYv1rIo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tQYIYu+fLJvWzc/0fDp15MIActLpTo5UqsEA8aZcHj853XVuwJARDMLm7ZuRXPs+Si3DUvLq3NbO2Kr417nGQyFjcHwHj9qoJuPCby898Yj1cAuICh0sEozVrUmV/WK0GTNzvWw/73IsnFZxKfoiqLcW7Q8yt7G9vNkTto8c2fkAQWqwovlI+eAnu61Dh4/Q/Y4A8CseKTtWl9pvUKVLcBY8oHztslKi5i7PCGEn9C1K1Vq7QuwNYxE7T1zwM5PxHRGLKhF90borBRXz0WT2yD7HVqhSPVyEgQhotLkCycwVcFgpqcXnAsBLrdcdrEw9urVJm7RUvb+tFIW0L7vk9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2T6AQM7TWSIKz3zPlNLlrB5uZ1UjI3Qw6Bw1XlTMqhQ=;
 b=et3nkLk8dyC/cnwDdijv8WUilfVXcesDyx97rGcpSDU4lGdcX3gYSfgt9WV8AQ7imTDmTLgJw4+3SS+81eyv81vuZM/SdWIUDvf+IiTJ/mSxacctjm0NNMU4eTa/l+t70yLVC2xTEt2gJlc8RDKERohJuzKOW+WqP/z7fjS8FKZFuGyF4BAu7hO+ViWGnraDFKct7hgaa2IGZz0ZqBSXYJYrkTGPVbs/ZfI1y0WHb7wB/ci8HlO1IwdO1ucVcq5hAk0dumZ2nLgXMyk7TyxOniS+IFRt0oK9Ik+be04fD+W2MaMrltyoWcazoWT9UL2VxdtDu2oA7ZpLTqUSExVJcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2T6AQM7TWSIKz3zPlNLlrB5uZ1UjI3Qw6Bw1XlTMqhQ=;
 b=jtYv1rIoKWSk2XtYT6xJNfdNsUJbwqGKDI2M738CccuxO5obCfWORqOvlobLS//lsMaVs+6D/VT8xXgYK3XuUR6+D2vncGt0cP/BAdzCuPn64GT7+GpZnnEUs8LgI1f4WKeM6zgQUOKyKR1ONli3L2EGg5/eRBa1u8RrXbhXtUk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYRPR01MB13216.jpnprd01.prod.outlook.com (2603:1096:405:113::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.17; Tue, 2 Jun 2026
 02:55:31 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 02:55:31 +0000
Message-ID: <87jyshk5wc.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/6] ASoC: soc-component: remove CONFIG_DEBUG_FS for debugfs_prefix
To: Mark Brown <broonie@kernel.org>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	linux-sound@vger.kernel.org
In-Reply-To: <87ldcxk5wz.wl-kuninori.morimoto.gx@renesas.com>
References: <87ldcxk5wz.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 2 Jun 2026 02:55:31 +0000
X-ClientProxiedBy: TY4PR01CA0083.jpnprd01.prod.outlook.com
 (2603:1096:405:36c::13) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYRPR01MB13216:EE_
X-MS-Office365-Filtering-Correlation-Id: 62d51673-08cf-4752-7a46-08dec052692f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|22082099003|18002099003|11063799006|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info:
	NdQ302S5KQENqyxucyQLIDbHnfNUojvUZjOlHAf5b3nipmG2/EANyhuTmTH7OQZGP5khsgnwzCPwKmGs+selLIdnSHdQtAfWD4+Os2DH69cOu/HSxfpjBL0GqSGqqd7svpFhL+NsiMp5IPRtTKdqgDnAHUrl17pl96iXbCPlzeZV/fKCsQ+o5W0TtEvPqYpJ1rClxBinyVEDl18+P9ucE/5TLzdynCJB4F2MmX/7cBycApWKiZR8pa8inWVRI5rhp5LrW8zN7ljWqgHGs9yzHW6TKAa58F+iWic3x/OiBqa0qEXhGiUksBvgcNlM+6ECLy7gLIDjxFuPqzCbfU0xwWIYYkJbzNfKsOSc+8muvU+xQH8Z/DqNxakG3EomF5Gr3Tx9j/IfD3So6k019aayHJ4wS6bWW889vLYxE1xM51HIXaLNxcrrGQ5/yWCx6bEk7wY98JjH91A0pRpuoXURkfbN3tLU7HxZviIr/R29yVsg/VtT7L3VC8+IaKskz73sV6+Yc4qZuv2tU2e0zdTAw50Q1yS0bPxkrqA884SCBhuPkGjeQa7pP8iSviieNPkTIaKBneHCpxbTeX96sTBIIijHRcBLrziiSB7fvDiJMKz2XjC+jb4tg6Q9o0TOsxq+86k6NPxXAQFMRFr/JZALValzHUkdckZ0GSpsT/Kr/17ItmOVdM4TOq54yyXvg51E9nRhpUJGS069/JsaCz6XzU0a5XQtGKF8jFbp3I3t3KLeuUhUlgOy8xCoupK+QIMD
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(22082099003)(18002099003)(11063799006)(56012099006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?b8xbOsQC/FwmN4cVHC6Ue8Ulay+b7uc6CqLIcXX830R2Mf6bRN/P2ctbrMk3?=
 =?us-ascii?Q?vo0aPUjFe7tg5t+W0B9ua097lKV/Gpwe47NpbSHv1cJLupqyhruwI25dkzx8?=
 =?us-ascii?Q?oiTDj68kp4B4YinIPwKSA8X+s8eN2b5A5w2ZKEGTRCgCHkReERzAtI8P4OyU?=
 =?us-ascii?Q?FH09l+fbNR7b/Pgy8GiuahoXNt28q1vrssFLienHDiAvq7TJwFWSZzaVe1XC?=
 =?us-ascii?Q?iFuVgHCn6RbLa7g460GbaQ0BJPjzu62Kggy7vRTvZr3pkZJ+nGN5gb4bNtUG?=
 =?us-ascii?Q?we68NjOpqrnM5APWXUqIyBbuOzLdQ5g4gy4kCJbrEHTpI+r+UyUzk+Mfba5b?=
 =?us-ascii?Q?DHoVkoO7h7PfgC53rn67vg4GmoHJ6HfK3CtmCmLKQA/exf+1M7DpqPaoYAOe?=
 =?us-ascii?Q?in5jDR7xNZ1VelBQPuyIO7CCBUM9cRky/YpKNcEq6RxLqtX2OOwPA6OMqgWX?=
 =?us-ascii?Q?jN1Y0wIvjffNUPGPUIiaECQomQIhSuWgkiWJqX+/ywjSMFSbfmmsFfjisn20?=
 =?us-ascii?Q?Kmt45PK3u60FlTSqvTjRic3I1AxhbUgNIGsNTLk+JdwMN+fL6o2CeO6aH7KY?=
 =?us-ascii?Q?sxVWV1+hoS1a+aP0nFB740U0SsOD2IXagYS7abHqkamp7z11x+Pg8u/yopiw?=
 =?us-ascii?Q?cYMhxy08CAfzwYMyBKnKRoVkeK/gYiMiDjT3/5n39571gbESH48ZzNmlANMx?=
 =?us-ascii?Q?nya0fEkq7rPplog6o/sJAvd3JJbpR3QZj+PWuXZK+fg7O9OvQhm7dEw3/0dv?=
 =?us-ascii?Q?+Db7ek4wd9UShl8f2o8V40vcfXPGMryKFoNEHP0dcQotAHnAe3gRv/mJSEhU?=
 =?us-ascii?Q?1ceK3P+YWZLx2dFLlHGx+OJyr4euh2H5mCsenxNG1N6OXLFmVXW6klB5hhfK?=
 =?us-ascii?Q?HWYWj3N8RU38kGF6uD/hrU9fKjfFDl25IzIUm5ilPdEpAMPj5Ksf5hX4UApJ?=
 =?us-ascii?Q?s2FC8uFAs1BcVjgab3Mjlw/FTU+HCmTss+8WyQrKVq2hMqChR8nfW+tdow2E?=
 =?us-ascii?Q?NakR2aFoKt5buanUiPJ4WwLhjzYA7Zd5alpbrt+i7Xp/L0trX0k8l+yfUgjj?=
 =?us-ascii?Q?qbpdEaKv5gPquESoR+8NvoCv+QT4xL03sA0rVi0oNRMHFzAS9DhonwcDSLJs?=
 =?us-ascii?Q?odUPDv3jG4thzoj6WpQaa6Q6DjsLgK2kaC02dUKF2BgHGM2A+whuuewUzmWw?=
 =?us-ascii?Q?qmKjLJGAyKkRUIsNO3mgfu0J2Jd440Ev2A42KCuS/qRrg487WwCMQ4qWnKPj?=
 =?us-ascii?Q?u4qFK2FSJySJwKKqkQ/apBDIH2cazef9TyjjSqP8oeDPn+YUOTf3eleZfOIT?=
 =?us-ascii?Q?LzfPt4d3rGKu8zvJSxEvZaxROfyxjZH82ZbhuTsNzBfwbIPT4/ty6Dre8lRI?=
 =?us-ascii?Q?MKxpOLyIVbnXQKhKXR7EONcUrlLhXIMwkGp2lIsnXCkv+6TfD3wyTjY4csu/?=
 =?us-ascii?Q?g+VqGyylgZgPCmAz2s5vAtjTHMaF/yQEejO7F8fua+JMTetCntNbdTIGmH2n?=
 =?us-ascii?Q?48XOEcatsB6Q9h4r4o8yl6rp1GFh+PkiWzRPaGkVajNsdhB7u5T7n4JT7iA/?=
 =?us-ascii?Q?wjhK4uD8dSOf8JLsfZ7UQgAePFH1jVw5/eEOF1hyYi53ob2OeW40OwAleCMt?=
 =?us-ascii?Q?IiCfyJjpSOslZf2nzKOWHshIWpU+9gMoeewm1cu/+xsyEocqlP79LB0965ZW?=
 =?us-ascii?Q?mEYdfj8E9I+r0cH1Fb+JzJmRDtscz/XfDRYIGPpKzF/vUJxVgnrODgbzA5zB?=
 =?us-ascii?Q?1wBd7ogPIcIfmoxrZzv1gI7Ine6a5esyyHF5VgYjS/YRuD4EZXAW?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62d51673-08cf-4752-7a46-08dec052692f
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 02:55:31.8943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dKfO753o7rNVEDbKSKICcI01dbTJNM3+YqKMtthBeia9jaA87V6YbNzEZ75MzMucC+rgmWqke+N2M5/ecFmF0e3fSk7oDwgkyWwI1ihtansF35FvIQyu3hHDQJhU0FMC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13216

Both (A) and (B) have debugfs_prefix, but (B) is using CONFIG_DEBUG_FS (C)

(A)	struct snd_soc_component {
		...
		const char *debugfs_prefix;
	};

(B)	struct snd_soc_component_driver {
		...
(C)	ifdef CONFIG_DEBUG_FS
		const char *debugfs_prefix;
	endif
	};

Remove (C) which makes code cleanup difficult.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-component.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 7e158d27ae8d3..337b7ef4156c4 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -199,9 +199,7 @@ struct snd_soc_component_driver {
 	bool use_dai_pcm_id;	/* use DAI link PCM ID as PCM device number */
 	int be_pcm_base;	/* base device ID for all BE PCMs */
 
-#ifdef CONFIG_DEBUG_FS
 	const char *debugfs_prefix;
-#endif
 };
 
 struct snd_soc_component {
-- 
2.43.0

