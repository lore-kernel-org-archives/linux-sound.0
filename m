Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011022.outbound.protection.outlook.com [40.107.74.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C19E33EB01
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 05:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788152814; cv=fail; b=T38KiP9WjRypdINIu+Oga+Y9B3p0syRGlEKAkctjZUKtCs9N6Ts93oCXG3DFr316Mi87GLJrc2aDx8LyGkHqLkMnLzXxMY0lJGhAjiEcke7IK18dV5olJfrfILx7sZjI7q1n9AaF8B2M/cbGOrfS2sNZzGuAqMUIEwri8OaJipI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788152814; c=relaxed/simple;
	bh=tJmFOW0Re7fGFVDrkEsI98wmOUjTqfdJZzNOIxh1KGY=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=gg3h+sYU+MgsILr5VxWwP/7JGG1dD82MVDgo6XwgKPESHjYCbEhawgHB/pBsPyqP/xjpAO4TiBtFFdAUrpZ0K5T61eQh/GFp3U/pnNzeSvRrFl74Rx78p7XD3SDvEWlwcsC8ej53pnd7Vj4vhHop/X8FuTI92Pt7FEJt70pHahg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=YZ5npZJY; arc=fail smtp.client-ip=40.107.74.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="YZ5npZJY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gZq+OLIvEsmcxT52zOx9XiifcLmg++rx03mnlpWdmnEtqPobwVWIUuMOKzJ49M1DEq+N1vfsi4Ik72iyUduSjCA0Mr5D1T9kcQiLNSPMPYWlqZUPDSGGzV56MiaBT3TmSfIcNux2kBZ6ZW0IdLZzapw+ASORG7CNqhLOePuwr5Z3A0yeDDV2FeOUHAebf2f5HMKKJ/fNBFNaSuBHf0GQhRnv4gUkXznbeJy9cljDMurXjRSyEMrBcHEJKUfuei+zXwUb5gkEbxnhrTgKA4MDnFzQlMBHMSa0uLGw3PFd1Uzv4IefOea3G/ouxakbzn1FjPbdyN52zFa++rSeDc4BJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1UIpaZ8PQIXRPmhNFadCt1aQXSnKEqs3x9yp3ozrd5M=;
 b=oZ8nu9whjR+oSVLmS9DM6hjCRxd/rOZrKSvj24t6OExUCtKekBHN6+px947B0T8RuVy+ADiKp2WjBqDEVRWGhWjuJz1y/c8nfi+dGeUBf9Du49Yl7l4Zq2W4SoNErON+Ff9JXvHKxL0WWqojakygIyyTkDqf6Joks2d5uKr1uNl5PAXZpbe+8HOXwzHg/VevXHrTvPDWZDh5+9aPJCpBwHROiEet99uJqncLaBhJtyIqmVYOuVXj7GPxiD1J1k6xmmKYCuZbMl9GoCNPTyNjFw575XWSX8BgEVbKxjO7aX/SQvvr9IJO5CVEuVIrZVUlWgXohuoQTUtuOKzbjPOyBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1UIpaZ8PQIXRPmhNFadCt1aQXSnKEqs3x9yp3ozrd5M=;
 b=YZ5npZJYq2FeMDSerL9holhOVV63eA+rjqsrRT6+xlQQ97TEMBlvJjpMtT5nOrFgF21+OcGnSQLrW7/32+YplOl085qMPzQHh8hY9xoYqScELpqx3w3Vr6guDCebPH0SCe+K5ZfaPfMEDM8PovIqNHghG14X7UtS+oAE3G7NChs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by OS3PR01MB9785.jpnprd01.prod.outlook.com
 (2603:1096:604:1eb::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 05:06:50 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 05:06:50 +0000
Message-ID: <87mru2vpxy.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 01/39] ASoC: codecs: 88pm860x: use .auto_selectable_formats
In-Reply-To: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
References: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 31 Aug 2026 05:06:49 +0000
X-ClientProxiedBy: TY4P286CA0027.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b0::9) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|OS3PR01MB9785:EE_
X-MS-Office365-Filtering-Correlation-Id: 4578c352-79e8-4cb4-15f3-08df071da9fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|52116014|18002099003|22082099003|56012099006|11063799006|10067099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	2nzBkJDpMGCLtSVU07QX8pD6awgnj2B2DFTUozE/3YgRiJY56l/K9qKwFWExzx9oPbnvvCLjUJewrblUa29CnXI+Qvbk5YhoOpyRjvC4RQWbypZb4sPClgcZzS2qcm1jyQvWH7Uc1cfPMUEj29fIMrdZ1BOozPJ85jRZ8rSVbcmx0/tonJk2WN1qO3q0ay3D6cRcKlepGD2W88vdCdtHlw1oQNHA0zy5z8y398zUFPSbgMet8TLT7N2kGcZcHUoMGA8Sw2DCQEBKw4Fnow+lXKei91XNKJPOXv2GSS3jNvmRox4Bx9ZgfuEgIEmz9Ti0/bu2ZFoXb78JYfT6oLKHvPx1e5fqkxU0u1EgHPzUJlRXIvs6DNqbXPtzyyWLBRGZvVvyC3X5EU9gmb57owmRyMhy/mls0KQGZEGFtvqkF8HJIt/jAoblRAGerK2lBK6+Qtt2kjvm64NoRuusdVu4q2XHQGaP3xcChXNMpXw3ABn/B5K/OXVMgZF87B9RDFUd1NUQRnCZc4WA4BQXb+0mMRLxqvRCRqQi0NU20FXfp7qS47NzWvmaYkpFsEaydMA24aHenI6cikFHAS/wKdy+cE57uvlBJvelPOwiIy0RrmXxwe937QX9wxXtkPVD8ZoW06oHnxNsXuvdFAFJh8IvBb13xHBXEV3u3bNBBsbfW2wEdu2nyi30gA4SxCpTlUzvNrtJRA0kkwX5RuFKRExHAUSUaDVJLY2NGt2JH/knCZk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(52116014)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Nbbm1tHhOSrnb1qwbum4cDoNDGyRHTGzLHRKcm5FAdLAPX96GT35ViP/FIce?=
 =?us-ascii?Q?XBzJokvdxenUN2qmTkaByaPpQsK8PpQmvSPYzr4g056gYHRjr2OJO806RzAs?=
 =?us-ascii?Q?5XGvCIt7FpLb99xa4J8bX1wPCbJ3KhDpdzpuwvPedIB0znqjAL8cRofSVXwI?=
 =?us-ascii?Q?wJPMVX9hcsEvAc95M+a5g0Nznz8ms8s9oD7Vq7JbXPee60Pxs7hKHyHJfB/b?=
 =?us-ascii?Q?XBZ1FURuA/vBk8ox3czpYXYIrUqSm3bUGZaf7qWenQ3nqum5S1cTg94ml8/K?=
 =?us-ascii?Q?0MGJM2uuLCCFPilcxyXlscApbXXOQAhYPy4MgpjRTRsD4CBYgscYE3OKwDF7?=
 =?us-ascii?Q?41nEcI5PygfpdscND3jqkLb0W23IIOuWbngguGtJbVVT9/2FdKFVk/6jcmkA?=
 =?us-ascii?Q?jOYUBwzEUy1aQYZDML9dfFNHUWVZZZHh359N49Xf2ztMtdXXs+U0+DfbqE7z?=
 =?us-ascii?Q?e1HkajdwCS7F6uaKdppKuoGEzvXPH5ykm6eA41J15Z/3MEmXAmemvBzHDOmf?=
 =?us-ascii?Q?OXA+/LcNFQqFWG8mH13GAn6Cow44waBahhrUP2/7V+C3AbmUzpu/DL44c1c7?=
 =?us-ascii?Q?Q3srN+9MMBHAny6JZUZkNqaPdxRTr222jV78d+wnR+u5nvYvkYcyqrRzZ5uY?=
 =?us-ascii?Q?nUBc2LmjgSphZJYeLRDAvDzOOP2tZpuxGR+YKiGVP0HtoZf1w7whLu1/oU9x?=
 =?us-ascii?Q?uj2MrcMLKvf0RL928lXD+G8/3udFE0xv+xE2ZyAAEFdB1iti+UiEByNF3w2r?=
 =?us-ascii?Q?bu5sQBZOuyX4GdjIuGfWiFn+4FlsVbeTLqhEJrU3J+wY3cYGHuSfgTtSQG2I?=
 =?us-ascii?Q?SNLC9FluVMTXHGHunmBysNL8lSUJD66ZmHL7BsOyGjhMqn18JEBtC/UjcbGm?=
 =?us-ascii?Q?wDS2LdQgf3IZvOWlcwTWzZk9MTALuqKWqqrMgrN+wOob0rSRKqT3FZUGnrmr?=
 =?us-ascii?Q?DeQGBWAy4LFouKfnCjcQMkwOgmAUys+XSvag3AvK3M6C3DypakZsuwr7P723?=
 =?us-ascii?Q?QlLzNpZnSKUq1ktJr2IjSEoOy1gltazzZF66Oy+sUrnAEFklVrOU3/bXm+Xo?=
 =?us-ascii?Q?2VQUZa1a/KVNbeHT26OqFwps/6iJ534hivipOmeX5/eRHy2i3KxJqPMFAwsS?=
 =?us-ascii?Q?uhPso3Km+rJ6fIKuEAP47WB25MjdlGPP/zuszl3wzGQIgSd4DfU6musjJ7vF?=
 =?us-ascii?Q?eFRGC6CZd3xM2bL3RWrx6reBp7tQj7LXSOv/KRJv0/1VY4b1ejGdwgk65T7C?=
 =?us-ascii?Q?cyVCuD7dAWXcyhHhRdI7hdnfAEAqyMegHnJKO81rCcV/THEk3BcuWKWrhRmk?=
 =?us-ascii?Q?JnkLZ/sEgQ+VxP9p2U8tKJjP5pCo7ZkCN8nCaTOF+102xXzPjsVKK0C12Van?=
 =?us-ascii?Q?KiwGcFUuIiKiJ5bWJfwkArVT92WUCghHFMXXwdfKBuqDwzMJttSj41di9e93?=
 =?us-ascii?Q?ogX8d4w9Ewu5WqQZ2b7R/mQmVghi81joykwgkkr037sVkODmmSI7ICMjKxrS?=
 =?us-ascii?Q?E2ULSCDz2C+LxExle9o6ZE31rz0/Fm8LBmemkMyY1fPn3mRdz0v1MIo/x4X0?=
 =?us-ascii?Q?Hia+aFLCIn8UpsqUkhUpp47Zl4NrS00201aHgBam5bLhYEJC7mrHT+VVzADp?=
 =?us-ascii?Q?EdYB0T/USAIW6YtywsUvdCbXdO+JyU6WyDXvyHRoPuW/WvcBdm9a21Is9YK2?=
 =?us-ascii?Q?L/IuhfSYrkAHoSRAK/NgcTBG6pJCrXIgcvTpFWLgzkanFk/F1xX+diX8qRic?=
 =?us-ascii?Q?WIdOsTvOKhVopVZS1L6iZ7DjlzNfmpydG6yCejZ6XYXuaVOe0wDJ?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4578c352-79e8-4cb4-15f3-08df071da9fd
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 05:06:50.0178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ltsomKfEUfYsCuUHku9aGZj1dhAy0ojESSuS8DLzZgZbkI/GAr4pTEKydFsx3qb79s9udJAt/sUK6xX/84SKgDCaJJyJlMNIkYCT1W9K0dSfV26iU0RURC+Pjo0XR0vF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9785

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/88pm860x-codec.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/codecs/88pm860x-codec.c b/sound/soc/codecs/88pm860x-codec.c
index b4f5b24cde456..7596227fbccfc 100644
--- a/sound/soc/codecs/88pm860x-codec.c
+++ b/sound/soc/codecs/88pm860x-codec.c
@@ -1136,11 +1136,15 @@ static int pm860x_set_bias_level(struct snd_soc_component *component,
 	return 0;
 }
 
+static const u64 pm860x_selectable_formats = SND_SOC_POSSIBLE_DAIFMT_I2S;
+
 static const struct snd_soc_dai_ops pm860x_pcm_dai_ops = {
 	.mute_stream	= pm860x_mute_stream,
 	.hw_params	= pm860x_pcm_hw_params,
 	.set_fmt	= pm860x_pcm_set_dai_fmt,
 	.set_sysclk	= pm860x_set_dai_sysclk,
+	.auto_selectable_formats	= &pm860x_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
@@ -1149,6 +1153,8 @@ static const struct snd_soc_dai_ops pm860x_i2s_dai_ops = {
 	.hw_params	= pm860x_i2s_hw_params,
 	.set_fmt	= pm860x_i2s_set_dai_fmt,
 	.set_sysclk	= pm860x_set_dai_sysclk,
+	.auto_selectable_formats	= &pm860x_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
-- 
2.53.0

