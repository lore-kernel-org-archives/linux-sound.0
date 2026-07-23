Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011027.outbound.protection.outlook.com [52.101.125.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5413CB911
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 06:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784788477; cv=fail; b=nS3PFD+ls72sZvS4HBg97VgbPM0WPLdUdE0a8Ostg5WsiSdsFoO0WfCyms0I/Ejzv+V1g1GjOjOYA+Gyg9xmGgnOr9c1F4aNUTjT1gRfOwcCW9lQ19hpo7ZLK0fDgKZD/rYQPnWYkyFdRUh/D45QSSFn0yluFhiWpyuJj13sPJg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784788477; c=relaxed/simple;
	bh=6BDHYpCwsLTFffppOU7gWEd1VH5CHA64WvWdblJsgi4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=QV5QbUzV7yoMyKzaOOFUaaknMZ/M+XYCNn1sJ+KXos8TpRfTmHdP1wiahlNDidC9iSjkvI01wmxsaC6bg41dL+9NE/bU66oEBI1Yzfrf21Y0/HmOysLbdv19yAdlfebc888r5ConYBVIG43CRL85A75Sgab7ahjSjZvB1+oqA9E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=BYmO7IkB; arc=fail smtp.client-ip=52.101.125.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="BYmO7IkB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jc+OYQ72hmuknHfsR+zXaimopuPCtCxwLnxzoq/vo27vlXr57HQDaSuM7WJam3KaghImUlr8uujQPAiA2p2PxwvPRAIzNNUMk+xt9T24J9zBJZ5Jkw5tLi26zwH0lRVP8J75XlZEGaEzufHCb2AkyoVs+DSZrp8YZ8y5piUhiRVADnuB1t9X5pTmDIFRI0v3tvWru6rVuIegjhTilEdozkNNWbiTm8KwJEpB5HnRW5ubRW6IJ9SgLOTNWR/ruepTL2NibsggO8RCbuj7IWIZZAX3LxHMsdlNc5eFJZniyq5/Nxbl74e8Kr8rMd0jS43uS5LNLDNusH43JNhG7JsMRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s8nqEOa/AvKSTIxmY3AoyyuE+rYsJrY2yybbBCFHV5M=;
 b=dkrrXjWR5Tr4tjkvrCDqB02LpatXNWR0aCnXR3sk0W488pS4Y0wK7zvvY508brEgpeZ68w519IGuL+CDWHG04LiBcISyjIhyTOhr5X+YEYq1XSVgjafOXoy6GZLUwxkCRrlmt9/QnZZ/05n30Xw0viOcpR/Q9KWjFqRf1X19Z0kzTQdJfnjrfXKoi9ryKHYH2YwdYadOQtMRtJ8ZmKRB98jkYqzdszGfsqfgxpoHqbdVhwUpqfMQKnusF0Z3oBNSd8LvnayMCyEw/wDNifQxMBfRGI+MAnR8rZcW3rkx57TJpeYViuJqIxfYUc73ozRSiJhIvaJKbv1WMfKik4W0CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s8nqEOa/AvKSTIxmY3AoyyuE+rYsJrY2yybbBCFHV5M=;
 b=BYmO7IkBIV3wkS1xtnkjWZ93Y0wcbyoMACgYKbpDWNvvMiosNemBXF91dvsgGlTWjjitSOTRZga2NWH4yU3QpPulxkjH26s9gdG8bQqnh6vecQYkg/XHEkGIOMu1BKRmMu3YD+pAHMVQS+ELcSGo+yTJQM/a49pwDyX8eyredK8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYYPR01MB7103.jpnprd01.prod.outlook.com (2603:1096:400:df::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 06:34:32 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 06:34:32 +0000
Message-ID: <87se5arz7s.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v5 04/12] ASoC: soc-component: add snd_soc_component_{set_}name()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Fabio Estevam <festevam@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87y0f2rz8l.wl-kuninori.morimoto.gx@renesas.com>
References: <87y0f2rz8l.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 23 Jul 2026 06:34:31 +0000
X-ClientProxiedBy: TYCP286CA0230.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::10) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYYPR01MB7103:EE_
X-MS-Office365-Filtering-Correlation-Id: 8821bc5c-14fc-41b8-e638-08dee8847464
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|52116014|7416014|38350700014|921020|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	+5uUIgjvclsaUuWDQZNmA+JQOwDYSRNSLey2MxATCKmL0uPwwZoivJoEgIzmxjlrCuTqsJCUPZhny2Y5qr7o+ac3HNbQJJimaqN5yyKeN/9v37QgUaPVJTf3WvDx7ZrLB9Pm6Mj6z/x/x+N2fH1Hgs3f/0uvZkTj/5PeAk1pIepB911xdyPPA1kGonn1R4ySFn1rIN6l8Ha3bdc611O03O3c+KBTe6uN4PB6Hi+2Bbxm650A7ULAQHqWgbpV7KYB/mysLL4ymL6BY94xXgtR1Rt6H5+I4Fq+7j8+cFXVhocLohZRV2+nSDpFuJZ7Qp3hOBOgwvqkH96OxZKMil+sKPOfh+jFM7m5gorzKA1+U0ARRRlKyFkLwS43cR6TO6ncUzitk0HYqeCrSz+3FofJK6UdFog2UaB0CLB19YHf2Hr0Zz5sqApk4v4WZ58nYbJCO2KMi5Ff1IM9OjPzf1JSL1rwbtWET69YKxf2sgi5KsgSoNWgZ2QknnJYr4ym0MvNgbLxpI+/cTHWQVLV/ny7WJLOh8DgyshZ5b2OkwDl+uvADBadFe6U8AV9JDVVGGOpckfd4nVX00qcsfFdRdUvQL5RoNMhQcHyndFixsqE+r4jgxthrJGKeCOfPFSph03g7nqr9IxQWN8yuWteJZiA++vjiUsiUilb51nii4E8s9ZwEGuD8FqDHNRpPr8UZrF82F/qS9Wyj6vHQguJeh7i1HeXk1XkQWxBQqSaYoPM2Be/94KLw+XqbwwSseaaMFtx
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014)(921020)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JomF7gS3RTAwCKc7YX4Lr2JCvtQdMqOYcYPCoivTB2Ty4xB8uZdUP5IQUlVa?=
 =?us-ascii?Q?6TXFFv8b6R2lT8/6pAdlMM1QQ7H5UXq3zYm3coslSl3Panm6PFZlxc8KAKsf?=
 =?us-ascii?Q?YJU/LhL8dMInMh8o6M3ozf0XiZ0xt5Co2IZzHIH+PcRQvTDNzl1POyj04O7l?=
 =?us-ascii?Q?FLABPC2xyquORi7zj0X47Af49DSDwemnPrFLkSYLm0WF+i89KrTJjpAEL2Lx?=
 =?us-ascii?Q?nZO+XLRfg7HL2MgOrAF/QKkaxZpsNuPZ0504kaI9rErvru4Rn6Rnbrc7x6zK?=
 =?us-ascii?Q?E939bN6mDfNSU9PIjshFjiuiyFhXPYDG6AkWQNF9/9UVfcXDK1v+gVZ5XdCN?=
 =?us-ascii?Q?BxuG3P9UNElTUgyTr/YLkj1zs6VH005rCkcP1K8sB1guKjt79IB9YEKHM8qz?=
 =?us-ascii?Q?4Rjvg23HZIgzQ3+fMB/HojNmmSHyhHLHc4pt/9KcaZba7MWuGsCnA+5th6Wp?=
 =?us-ascii?Q?igqd8Z8ptieavLHb1a3XN8KF3DnSHjoYuzIW11DvUySB9XrRjIPYkmfGRsF8?=
 =?us-ascii?Q?tYo2CLBObg1hzChrKdnhqho5CSFbNNu0HUiq4ONURloRg7WZ7aZFt1OiOMsz?=
 =?us-ascii?Q?AZCB4ZiTTwwiA4Trn+SUtmv8Hewn3d48CiOpU0T6iKQLw7XXs0uOwfzK3A2n?=
 =?us-ascii?Q?th7Ydgj4DUZ1/ZJJjZTo2IG7MwK97GSTzd6yohqAy/bPveIzySkhzEcW4Knv?=
 =?us-ascii?Q?fBG6UKy7jw2Zs/yQxW4Tuw1RQeLjbcR7gqXyAcx39ATPcrOfTbNTx3KwqoJP?=
 =?us-ascii?Q?YKUhggb0aXRuOQocK6iZB2hukiA7nnIGCC1k8bOXhKP2XFdeCyMeAY/k6JQR?=
 =?us-ascii?Q?i8iaHD0Xmk2AuCDFBPpFqLBD89OVS4IUcO+8pYiDAT3unvk9GOii3BhTfTqx?=
 =?us-ascii?Q?hhi6W8Ctic+J1eWuEmBbiXnXnsIn6NPXZbsP+Co83WM4BTgHyTxWnhwvufYi?=
 =?us-ascii?Q?5FBq07M18TgOQqfTlgC0ZvfswXunxYpHZJz8sMlC839NRRBdFW6FqYFy+TXp?=
 =?us-ascii?Q?FJNtrRgiq/axcQHAjaly15x9UxWH69zEhgSpnizJdwdl99fXx4wGxXVm4Fcu?=
 =?us-ascii?Q?UrXP31MXXUPGQIHMTAHJVJwzT0oKCIahwpUuEUbUcy64MjMHJ1+DrFJg88iK?=
 =?us-ascii?Q?KCMRx10/i2e4Afr/4yuL4PbeMsJOERE8uYuXBa+Xk7bUYS0zX6omkOOMQy3k?=
 =?us-ascii?Q?5aEtXGs4rweCJOFuBxjjwe8sCKL8PGC6nei0Y7RVFB40ZM/cCyYLHv8mWqzY?=
 =?us-ascii?Q?JGMPMD1suwg+Fmt9zm0tH3MwZCdVPWkGQF6y9YYMxT7+7Z/1fXodGINxWEpg?=
 =?us-ascii?Q?VQy9jtkAwahjAFr51BArH4jZf5iEWAf9W22SMbSWumrtb25qY4mQkk6HUlq5?=
 =?us-ascii?Q?EQa6VaDiT7ACijopL7ct5x5choyQ26x8Frb1/nznsWot1vFIxYBMtSh8Mtvg?=
 =?us-ascii?Q?62G0t20WkhQ+HEllEZ9auGjmlV/OzR5QCBr4iG5Wp2hqkH2+aZM11AvFteTh?=
 =?us-ascii?Q?bZzAVwZBcK4hpXf3piP8FQd364nnF0jhlFSYoN/bX1xabpaebczxqK0vtjn4?=
 =?us-ascii?Q?cnoQxFE0SB1tsGnuGCacRUv2AyOQOsoIzWm/sTKFYncZ5kkyXVIsV1yevpFM?=
 =?us-ascii?Q?tNv7JofwYX1xCfMRxDJANLWeObzsr77qJx3GUFJf0Ym4DL7YjWa1/7KIn2BA?=
 =?us-ascii?Q?mjPhTk9G2VN5RgiZa9S15FPVc4EPLZddwaondV1RQIAzfqAWfo0uXz02rHiD?=
 =?us-ascii?Q?bfNS0TB9z9aKPqYMidvsQ677uFrvhiB4UP7NwJGVEBQW1wvlY9Mm?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8821bc5c-14fc-41b8-e638-08dee8847464
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 06:34:32.0365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J5eBu0RZ2Z5vfQWuiS+6oerns26oEjLaRPtzwS+9FfZxdSxto11PK6LxQanjLr1yO7gCEEvbwm46ttRRoPjaq08C1RCv2j8apk1yD7uJ8iYv+j+0SB3eR7w+7E2+flsB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7103

struct snd_soc_component will be capsuled soon, its member will not be
able to access from non soc-component.c.

Add snd_soc_component_{set_}name() to access name.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/sound/soc-component.h |  4 ++++
 sound/soc/soc-component.c     | 12 ++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 3c628402e289b..61aa6523f2f75 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -283,6 +283,10 @@ static inline int snd_soc_component_cache_sync(
 }
 
 struct snd_soc_component *snd_soc_component_alloc(struct device *dev);
+
+void snd_soc_component_set_name(struct snd_soc_component *component, const char *name);
+const char *snd_soc_component_name(struct snd_soc_component *component);
+
 void snd_soc_component_set_aux(struct snd_soc_component *component,
 			       struct snd_soc_aux_dev *aux);
 int snd_soc_component_init(struct snd_soc_component *component);
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index f0506a9c36ec9..625714293fbb4 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -42,6 +42,18 @@ struct snd_soc_component *snd_soc_component_alloc(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_alloc);
 
+void snd_soc_component_set_name(struct snd_soc_component *component, const char *name)
+{
+	component->name = name;
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_set_name);
+
+const char *snd_soc_component_name(struct snd_soc_component *component)
+{
+	return component->name;
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_name);
+
 /*
  * We might want to check substream by using list.
  * In such case, we can update these macros.
-- 
2.53.0

