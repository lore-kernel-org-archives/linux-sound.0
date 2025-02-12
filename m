Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011037.outbound.protection.outlook.com [40.107.74.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8190B18D65E
	for <linux-sound@vger.kernel.org>; Wed, 12 Feb 2025 02:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739327075; cv=fail; b=Kkvako3yzXfRTOdyHY47kyzlEurGx8W0Oa04E4bmDRZfG/JSJRbiZKsrejZLM0WNNnr58HKZY2wbDHSBWofz7G49EE8sFaEaypcu0fNIUvbRUaDZaOFWL0ua2BiHS0xTJbjDiGs8PHoqUN+3ggLCoaUTiYJBUvopaILlxnq1zmg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739327075; c=relaxed/simple;
	bh=ooUzEadBfaRJ1I3Jrwa1MPu82BE4iYJhJDfW0n/w6lY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=fyk1pzHl2cUIcQeNR9yNdYwY59U3MeLhVAt4LohfeLOB3x9Gg/TRhP5Eb/onM4Li4HyCUnWQEVvdtClsM5QhshoLuVR/QeIw6XoLILOHdLqEBoZ9sgI9Bl15Ap2JNJ58YUF7myFNm9bHx5O3AviwNas3kslmf9OKuBzrb+wiMCg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=lD+kZMtG; arc=fail smtp.client-ip=40.107.74.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="lD+kZMtG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VGkBmFgDnqnIv2JeHq5ay1epiW5O8Qf3KMaVaVjPU2jAwfKmje+Fgv6QDip0Y2II9cZNPPKCTyL1zMymnAPIxZT8S7iouNq15yLV3BDLmAv+j0FuoTunTQqKZ4BSFdIkJj3kt/6Wv61UcxH9qHgPS5r7iyIiOKFbkIGijJDC+jAklP1pmiaXDo3iL4/LgQiM1c22gS0mX6A4QK747U2kCFK42l0+vIOpxstycxxEwXeDvZL/XHcIoUa9vwujszKW9s3D9HR9jPH/KmboUZCvPe2vZYe0inqCqi2U/+4fciMWeyrkV9ED8QLppPDgkCmN1q7OL6Q7qUWec3Ps3lTYIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xrwMW0kxS/jRqzYJGdLTLIZBkmK9tO0B014kyx580Pw=;
 b=JizpBXtFxxijowuvkjxAMqfwGYB1j4CIbjhpzPG6Yo4XSbxXvz4rIz9Z/bR7OESE2WoMDLsiFS9F/WaNBxEjcOqV7pKGXB9GQ19w63wxYdKz3L2aOhf7bfRC9GE0MqIoquPEwpgiMvp75NX0dPzPIvLVQzocp9S4PoN46kwVqQ3AaPK7uTFISGd+zTwKRLP6U07PyvyGwTCP2yf9wkuWBGsvJ3cAqCC8zteNItQTMTLaFuJ3JWJwbQnUhZQvQYxsXqF5ruKtJwtqLpLIy5YPYJTcDHuxjwCwYIzvVHD3CVC8dgLSH3LXMG7TvzQlBQOf3R0TTzTz9PbguC3/Rk8GkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xrwMW0kxS/jRqzYJGdLTLIZBkmK9tO0B014kyx580Pw=;
 b=lD+kZMtGNKCkHhXByDZe8Dhvn+jAD+ppBkGESsl671Lcfp6eZS1uZdjrsty0QZTg7DebyP/2BEVBkCcaPpIr1KSJ/iZQ6w6ZK9+S5vmLfzpR/loPzvJwtvodOG+w8RQvGPl0qjBz+WiGOb0DcJu/3eOOBCfS58W0uty/i1rzfzw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY7PR01MB13706.jpnprd01.prod.outlook.com
 (2603:1096:405:1ed::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.11; Wed, 12 Feb
 2025 02:24:31 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8422.015; Wed, 12 Feb 2025
 02:24:31 +0000
Message-ID: <87pljnyk68.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 06/12] ASoC: soc-dapm: line cleanup on snd_soc_dai_link_event_pre_pmu()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87y0ybyk8p.wl-kuninori.morimoto.gx@renesas.com>
References: <87y0ybyk8p.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 12 Feb 2025 02:24:31 +0000
X-ClientProxiedBy: TY2PR01CA0023.jpnprd01.prod.outlook.com
 (2603:1096:404:a::35) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY7PR01MB13706:EE_
X-MS-Office365-Filtering-Correlation-Id: 34c7278d-3dcf-4c25-a69d-08dd4b0c624f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?y77CMv28fnpzC97EQQuMUzPMSux+opV4DMXv1K5gO9wlODp68zHLjGO9Bp+p?=
 =?us-ascii?Q?rwQV5/dlfqFz8AELoKo6JMwgxvqbgFeI/0HHadvriL4kQES84md86pl9J76e?=
 =?us-ascii?Q?lHN9NjbWICS/F1AgMIq2zBJjKSEy3d+fV3JLeNQKeQL4pPp9PqrVrl47xXQO?=
 =?us-ascii?Q?6jDgHwE5QhGOhWDuyfcZ9dNeaTFuPkzr8T/zh8MR8T+cFuVqV6M8VsX9cL6S?=
 =?us-ascii?Q?K8xYTbVgUC5nAwY+TAYYDuC2zVsce2I1j8TWMmvb9BpwPSIBKqqYqyBWrVlH?=
 =?us-ascii?Q?9BoAjShGLI7F7JEPRhYhGPzUBzbMcnQrLnR8i8P4wNAO0RrwZCad4GzCldnR?=
 =?us-ascii?Q?Ar9gb1D5CQPD77gxVN6kZE0VKtYhPVUXTIsyuOhdVf1XfxeM7d3RHAZP+Znj?=
 =?us-ascii?Q?QQOIGv76jpY9ze7VU2z7duGjYFnriz3AmTNhiDeltMmWNTy4jTuQX/GRISZl?=
 =?us-ascii?Q?rCVnOyZa0dQvz1OvSq7h03NKjnuG1Sl7x7oY3H+yxF4m7veucXs01C+cRPgb?=
 =?us-ascii?Q?v0rjjZnbxnqKkKLA5fJAmUb8bsm2HYZTZNbVK1MeioBfKg+DupNvf9PhogrN?=
 =?us-ascii?Q?ftnYbI4dNABX10++YJ1KdOoQ9mtYrw5XfYzkGcbLtDNduTFn7OydSy5Oq0Vy?=
 =?us-ascii?Q?PSK6PMEon7vH3LYfZlkps4CJ1kRP3c0V2hnouoTOKp1zGR6gzjzLKAjvjPCx?=
 =?us-ascii?Q?MuJy1U+lBX6DheUT1Ox9lJZR4MOUSKbVHlgVADyQArzBKqvAkCq0HJuiMEFy?=
 =?us-ascii?Q?iqTHgUXr9uhA1mRvXb2Yq1ge6PTE2JpDJJGkkkIcu7Jp7o1iTLhTsuSMDvC6?=
 =?us-ascii?Q?9XlzuP2rFVmIc3wXTsy6ljYk2ZtNeqXrIDNFww1UKAdDfSSYw9KhvAW+V7v5?=
 =?us-ascii?Q?+r7ywRlqVitCxEVjBDJxJ76pp/oUW79zszPfNqHdhBGGxKcTi+FYVSIzH7bk?=
 =?us-ascii?Q?Sh0jqX8W8kVkb0TpwzWS12z8ieQfUFhvyB1GqkcCzAeOLOMGEr2fw1lOpW7q?=
 =?us-ascii?Q?slqUIUhPlgZmP2K/ZPBCNXXPKvcDwg/3nuCwdxwgfMHecbYaVC515Z9wInAQ?=
 =?us-ascii?Q?E+DI6nqOERc6R8SXyzocWeYDe9QRzDWvLOz4r4YR761k3QVpKF31O1b02zuT?=
 =?us-ascii?Q?btE/c4OyQcKzVg6nK5EcnZI3rVbUpB/VXXV/v6cSdeircdf4vZBw0JKcillU?=
 =?us-ascii?Q?JlSxlu19crvGrh1ruoMCHKbLhBx4isrsX8S+fdIYkUu4UPu0KL0RXO2DeTl8?=
 =?us-ascii?Q?KdwU09XWubgleP+I01RIgR2UDNbKLqJKC8ta98637nWX7maa63i1bP5hO8l9?=
 =?us-ascii?Q?QUThdaRltUNAzCs9jjbAItJXXGsulk+pB0aJ/mrRZ3BqGpfxp0VC2upvf72I?=
 =?us-ascii?Q?hI0be5oUUM1YQZKhybxfTN1uafAsbdEnmb3QFALrJongLTPLZQ9fTwFuakwE?=
 =?us-ascii?Q?j2SOkp96wO5qAtF7It4qQxG4o3fdxQbl?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jy9wcyIE3t5XnBnBAvM0mDRfO3upRl/ifw5V5lg4EYzoQ0nTtL1KqTMuKM2z?=
 =?us-ascii?Q?/AqRwfnPugYLcbbmjWb4KH4nT3GEdurKKrR+vSSWDFZOcwXKnm3yIYqawOHj?=
 =?us-ascii?Q?DNdbFIpyw6TB0AOUBnVzO94D+wBpDMwnvSsWDkHqGY+N9/Jgk9gtfHf+dt+5?=
 =?us-ascii?Q?G6rbqNlEJ44gctPnU8j7gIjuz53++T8YuQIBS2nPOL3zA/u/6W0sJ8/L1rHa?=
 =?us-ascii?Q?QELqh2O9iL9gumsi/Fizw+Yagf/kc7Z+5aYiovptedlI9TE3pdwgp3QcOGGz?=
 =?us-ascii?Q?ZlN8CGl+e+Hd4/DFpIlEnWhyYmX2X5tX3kJIxuomBPEACkn+O9TgrzUb0CSV?=
 =?us-ascii?Q?z6CMFdUErftpaR2t/JJa+BTt1fOH97sN5ygavxmFQoT2p3BQE3BUg+frYZiA?=
 =?us-ascii?Q?yCASbKh45DIx71YliwzwsQgmYEyAIHS3VDR71lu9bFRjXrPpfEGXWxkLh4sV?=
 =?us-ascii?Q?YKE5L7FYBN9zanKyYAVVtbnnDkeOWMIr2YYqbFQE7EaJG3ulQqRje6ayYKvw?=
 =?us-ascii?Q?c4lLIoyl+/9LCoNL7HGkGNHAHK8sa9TNH1N3dVFO24y/+CGzYn9q6rdcQv+d?=
 =?us-ascii?Q?zEPdqBwgl9Xfx7eCeSCaPZ6P1mzp4LgBxwZ628t0f2cICUJ3GwP1BFjpuKfV?=
 =?us-ascii?Q?m54EUXd99aPpM0leKwWfYGe8TZFRfNH22jW5gn1lMir/ZzAQTd/zpCbidleY?=
 =?us-ascii?Q?LhoaFO7DsoDrk4tx/yHDF37IorMqCEQtldrI/ZnL/FjLbqQMBeN8RZtYZZAy?=
 =?us-ascii?Q?ppPoCx7E3ut/+7mK2xRwSXGHBexm/2UKR23ifab53vECc3EKOBlriamb3mm0?=
 =?us-ascii?Q?lICv654C5goDVutHEby67Y+X7Njgovuo50oB0lovVmhWPoDCjqC+orK5FR7E?=
 =?us-ascii?Q?zks4F+t0LqKq1e29HGwctJR2FyMGnzSi4swcpLOZ6OFWWam6iyV3qg7Qzeom?=
 =?us-ascii?Q?5vldoVzEeB9+OYVsTiUfkKlmoY5G2KyTwHZvdTfBoUqpvkfDBuWzqGTx23BV?=
 =?us-ascii?Q?PDXJpYIYzdkfhqZVB3J7TeI4Xxo7qjDQwBFIMtUyYcaMJ1ZjYV0SUgahl4px?=
 =?us-ascii?Q?TgYLLYsF3MrFl7io2BMOesUFPRZcqHEbDb6SDdKENeyhEZRManfGKilgdhP1?=
 =?us-ascii?Q?x6VjUdF2QCOCOGL5ravzuLtLlNb28OKoWigc0g7DoIa72KaPIYOredBSia3i?=
 =?us-ascii?Q?zEqaD86AnW1YldkQuanx1d2fQdHeqD+5JxqPUQMZ7QciSkmwo6uT2KFfX6Kp?=
 =?us-ascii?Q?umv7O+ApygqsWyLN79vSaNQ3u2kM3N6Au0f1EWVv6tcuhD0eqev6JmcIwH27?=
 =?us-ascii?Q?Bmd6qrmSi8KHnfHTUJb8Pf1umm67Jd8wskQ0vO9ncoM03kDxESH6OV2rfIXD?=
 =?us-ascii?Q?TocK+ZFcRRR7pF7T8Sajlxxm5S0HPIKkkLcuWbptpdeYSL8vpKvgLhohieY1?=
 =?us-ascii?Q?GLRYHi81MqbZZqFOU113es/jR+rIVcIDgS7RTbTvz2yGaDVBXksXqrdNFs4N?=
 =?us-ascii?Q?FvW43QtdpJHpnkd3SjLQSaoN9zflBYnbRkCrU2gh9vc5lykI57VIv4DOtXMU?=
 =?us-ascii?Q?KwJRAwGsoovaCnqXVKjRJ1ZnSQQL8rk0/hVUM1NJS79WZGS/NeUV+SFmEv3V?=
 =?us-ascii?Q?Ce7xw0bN+llj0/+sKoavHvw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34c7278d-3dcf-4c25-a69d-08dd4b0c624f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 02:24:31.8564
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j/0DQE+drNDMUXsWcEE2KLOtqNRVhFkajGTCPq1akZPRTldkP05c0hXyDSFMWDRoj3u9CB7k2jREpTVGzhhjgv0S9AASMoubOSxD6tZlxMT+qXBhdWbC9JlzPxN2R3dg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB13706

We can use 100 char in 1 line. Let's cleanup code.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-dapm.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 420fe7dea31e9..7f18968097924 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -3951,14 +3951,10 @@ snd_soc_dai_link_event_pre_pmu(struct snd_soc_dapm_widget *w,
 	fmt = ffs(config->formats) - 1;
 
 	snd_mask_set(hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT), fmt);
-	hw_param_interval(params, SNDRV_PCM_HW_PARAM_RATE)->min =
-		config->rate_min;
-	hw_param_interval(params, SNDRV_PCM_HW_PARAM_RATE)->max =
-		config->rate_max;
-	hw_param_interval(params, SNDRV_PCM_HW_PARAM_CHANNELS)->min
-		= config->channels_min;
-	hw_param_interval(params, SNDRV_PCM_HW_PARAM_CHANNELS)->max
-		= config->channels_max;
+	hw_param_interval(params, SNDRV_PCM_HW_PARAM_RATE)->min		= config->rate_min;
+	hw_param_interval(params, SNDRV_PCM_HW_PARAM_RATE)->max		= config->rate_max;
+	hw_param_interval(params, SNDRV_PCM_HW_PARAM_CHANNELS)->min	= config->channels_min;
+	hw_param_interval(params, SNDRV_PCM_HW_PARAM_CHANNELS)->max	= config->channels_max;
 
 	substream->stream = SNDRV_PCM_STREAM_CAPTURE;
 	snd_soc_dapm_widget_for_each_source_path(w, path) {
-- 
2.43.0

