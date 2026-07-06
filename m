Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011025.outbound.protection.outlook.com [52.101.125.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D0637C0E9
	for <linux-sound@vger.kernel.org>; Mon,  6 Jul 2026 02:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783303354; cv=fail; b=t9WFVZO3FZq+aZOvTR4F12L59DcyOw+u86uVTXHyVwBEitpAt/KFvXdt6QXJRKqoGIwpBl9ByIg1dJlS0lKEGrJ/OUUS5qVAD63m4W7VT96+OC5JlAqaogc4k6bSu45deCRVbJzPdx1NFxDlayI3J0rXSFBi0G5xDJ7/cVM0j60=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783303354; c=relaxed/simple;
	bh=IsWQqKLYpNRZzViYqA1iaK6T6CjdFGpLBGOmpeP/HaM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=PF57BUG7wWhQfTMzR6m6v3SwxY29O5LwvAkFZLMhNUdOWFG5e8ctVYfjVRAfi82wTeumkcTs7ORaLdBF3uSI7bfk/nmc8nDdu+0dM/sE6e5d/HjFrB4/RjJAEaqNVhpHz2xt6/Io8gMa90/fIoiZ972h8LK8+ogDdX01P6ZAF5s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=E86c1whj; arc=fail smtp.client-ip=52.101.125.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="E86c1whj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jRMSWaBbU2YorNFhkHa5NABi3KJNFEDWxN0WKOclbpJGOZNLZs25/Y6mxwp22oDgSsNcExda80GyEQe+lu8tl6ohpWxHxrQ1u8IPa/4XKUNkWbBy0eINHA5WrW1coJF3AQbAUxctjsq6BTGQtY7W1QFE5yR5CBl29PF/d/s/9oNWuSFwxzJE+qKWiDw5Zd5GACuZpdnhmFNo5XPUaTnyPr06jQ4IRLG4gpTUEDVwG+KwfgvnVLShsFQIs2fSflEgAJOiFaxm0HKq2WuJ6UlNKEIZwfnWHNjCQLqY6Z1CaU03axRrZBULISVjqx3HS3rBh3YehZK9SOfCtT9DzkK36w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6kFqdVtvMf4grX9dKNNHIq05JZ0nqIwgi3UxDVR6c7s=;
 b=aRk+n+mGjFNxl2z5UgM+eYhWJdm2n2WfQxoyRLInNghVv0paMDXveiSkeo7hrgqLvEOHE5jLlazin93d3VQ+iJE1FjVx0qynbOMIHxHgxBm7Xo5cCFBD1WWrsKcWRitofIgnWFQ2SOwq6EVfb/EpHrx1KpQxF7XkbJO5+b99/AHbMjf6tFVPPblK+E00zdCPCsfJOo28CieLo9t5t4WKB5cmd2miXIFdz67RR8MHJBj0sgKjHbUOQQGNON/bGX+08OlgAoCJ6NgG6oYaR8hLmr8Lc3h5AQxJHhiDwJvxf6ZlRerT29msOqf9Pm06s7rZrtlUE8JipiymBwDZeT3evg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6kFqdVtvMf4grX9dKNNHIq05JZ0nqIwgi3UxDVR6c7s=;
 b=E86c1whjrrM+BXE/SUNngGeq5Ghve1iOH+eZ7f4lEX1VgRVNH6M57+yY4bXKJI0DGjSU0rANbCBW0MhwnZcLgt45A21tx6XkEKK6+DMbLyl36oTL9dVrhQqx5Rzq4wVwpf48jkFvFAaLur0HtSsuIbZii52axX+lJOQwCmlZ1vk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY4PR01MB14075.jpnprd01.prod.outlook.com (2603:1096:405:20d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Mon, 6 Jul
 2026 02:02:30 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0181.010; Mon, 6 Jul 2026
 02:02:30 +0000
Message-ID: <87tsqcc1u2.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 04/12] ASoC: soc-component: add snd_soc_component_{set_}name()
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
	bui duc phuc <phucduc.bui@gmail.com>,
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
In-Reply-To: <87zf04c1w5.wl-kuninori.morimoto.gx@renesas.com>
References: <87zf04c1w5.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 6 Jul 2026 02:02:29 +0000
X-ClientProxiedBy: TYCP286CA0272.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::18) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY4PR01MB14075:EE_
X-MS-Office365-Filtering-Correlation-Id: cfabcfdb-ba90-4663-6a02-08dedb02a280
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|23010399003|1800799024|38350700014|921020|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	j4WUByaMd0yfxAOhpm0o7Cv7McBeX9Fg0yq7Sn/Jxqniut1dvalUTiXkqWSXts2xAoHonXZZk6F4WX19JPm4V4I6KRPWDaiW+ipkOXnk8X3Qksntbld7ZIPW4yDdfCYMNj1tVRiyh58WN5/2YN6lJM6He2r3ZhdEp/3KM+xW6ICb0NkPFD3QHypMzNOQcsM6B24Gohtg4bRGXG1l7hSTBjm6+4tCT8SpgzCLNekJKFBAxtQM4S2ORkakSXAvJyxtdgvs5Q9d0F/Yhb0n39m5IIYt08AA389bPtoMR/xTSgGnEIyZrhnwGoNQLGVl0eMYwVrYxEP86wtQipBardayOoAilPD6Y8ZgjweXlH2X9O+NlPwKkuP/KVF7j/2McBwYtIcjTUVRkwuQZVgxu2mVYX8ErFAgGwEngkzQD8v6vDGF3GHa301spoWAPGLM2kLVSJYp7sIKacQFlj1Kik5u7ZFaVSgBjpnj+ETtQIjMwaafkMJuO97S4nG1DBotC+2EoWm+63UlwbG8E5kJtUFXbsuVPMKVqTCZH8WT0s5vFQ611LtrLZmxj4bqQ/C0Ag0Q5hLOHM7IqNTUGkSqcqNd3FdXH5muWGw5hc3UjM6T8+6yYfcK49SKfoyxZycLR+HWAR+i0KBZR924iuZoeKHuZW5BB+eWsGA8XiFBo3fwU6Qq6gwT3AAbLKSHfD7nU1zlzDOTsiJIkvv+0paiD633Yo9TLdwGPI0f42gh6vrVfSf3+cGbZMB7UTt36IdwvENk
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(23010399003)(1800799024)(38350700014)(921020)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lkJGo82YfU5OR8uETLJ6REjsHsxDVkVqxY8Xth/be4sZN6m02YtlkJyXEL86?=
 =?us-ascii?Q?nwcNBmBVG+KShzMDRh8AWx5gJUAz06nr56mAGhzxaIbhpKeazW7UAlCfAApf?=
 =?us-ascii?Q?r9e3FD7t65LbjTDBrJnFYgRM5bZNAT5O9RlRNQ6O+MnUk/gMNSPGOgC3axae?=
 =?us-ascii?Q?bEIoNalzSZL/9A14czv3fWR0fmQu5Qasv6Y/rG7SiNmQfv1+8ZVWAfTGxqiv?=
 =?us-ascii?Q?HNQhmVWj5dccIZ82NannA03whWg7OIDqXUMK2688iG42yffNiU9AdyiDbMfg?=
 =?us-ascii?Q?DfJI8RtvELPX7n3z2XmqwkkkxJKxS0Lrkvh7Xg0rLNpVxAnXTMN1RvMqndXa?=
 =?us-ascii?Q?jC2OEn9CrmTqxa/uwCDjhFgNMQ3NPyQZ0Ds0l06/a/paYepwBGweAbyFncjT?=
 =?us-ascii?Q?Y1zTngLaYKb8SqrP9a9tPn41gRcSC15OdUIrtjXlqdUIPcXZ+zBlR6L1KZUC?=
 =?us-ascii?Q?gfCuTUIya1Yppvb2xGBiyIK1Mp6+Zq6J47TjbdJhBZtwxauqZ8P4bg4rYZ3e?=
 =?us-ascii?Q?4532BZ275kJw+i7JvgkkX3dt2GEMWHvhtxhOAg9YEcp34x4ejdLaNyQZ4fbb?=
 =?us-ascii?Q?gnWMwSa8iWzeDEbZuNG9ZO1UdITAvFASMP+gtsHT5uoHCAPjnyUsANeCymGi?=
 =?us-ascii?Q?+WCblz8dDZzhdP2cAIMLmI9FBwWB0rwyMmSDHO1Fo3sGQpvxnf4ucLNkcD7a?=
 =?us-ascii?Q?o9MxqW40Or9E9vY/fn7H9n+ehQ65J9k5vW11uSbQ3rgQETaQFd+MnnY7m5Pp?=
 =?us-ascii?Q?z6BGhOU596fAsr9rcqe+HLiakgnkVSwKhZbI8bTp2LnU0DQ+wMKopXFppWm0?=
 =?us-ascii?Q?ujsTHjklmARtzvqV+ccGlG24uQtyv/4yeAdSNmMo+rNkP2SWetfF/vend0R/?=
 =?us-ascii?Q?B/YsjpeQbt+QA0+5Nf+thLVvCjgKFHXLfxv5bRt92suXvmrshBVdzqEoXn+w?=
 =?us-ascii?Q?0bFcGnPjEao+sLI9AaaqCQv5nm7u16Tj6fRU0Cxey+Xk6DyWYpehYafjlB+o?=
 =?us-ascii?Q?5pGKDnX/ih/3uY78iBK5BzFffyUqR8n5SqHGG6SfsGSLDqHrPn9g1ZmIOpOb?=
 =?us-ascii?Q?oZLHqR/FmnhmTjPZxAn6ytIrGD9iPc7tJwQwH90cUvtUuAt5u91uDoBY6gfg?=
 =?us-ascii?Q?xSRtIk9hOD51qztMBKjY4BYOdw8jsRG70YyhV+KpnxpqxUoNiWz5a7W/ZZKh?=
 =?us-ascii?Q?oPdNK9CzKF1arMS1Ya4J5/OsPTHhOceIIwNhJnMTjkBDjb0NWYwyijhnZvhZ?=
 =?us-ascii?Q?yhOuK3r9aOTr0t0yPe97cr//dsM9nxwYoqLUwybwhlukeDpQ+QZjg5aEOmQh?=
 =?us-ascii?Q?JVzLW5vOOCIICs3TvM88YzLFlRrepLK5cyxw+73yMzaPvcIii355ScXvlCRh?=
 =?us-ascii?Q?SJHBEzCHAWLYL49ec1gO0GLctE+uRH5UfRSxALvX0KF/dOUl/vCRYmqk2aAG?=
 =?us-ascii?Q?yDzWeuIN0EKecfB2bBnBgLSeh0bohBTVuBPIG9x+jSzNCBau3MgTWq3py+pN?=
 =?us-ascii?Q?D9hLvdjMMoUGpM2CIvFtTwWvilHZLCqaU29hNmLxIQztT92WbKt/eALIvU1P?=
 =?us-ascii?Q?WUsDQkZaPHcZYsp0qYTwXiTMRzeG9XNMkaplfA/ONKC3GfyRaM8L4765lWFz?=
 =?us-ascii?Q?uBkktKj0CAHA6XoD9S6sIGhrwOspMpgI88sSChvdYYfQ5jThdp7CecFwN/C2?=
 =?us-ascii?Q?1vByS//YASdIFLB7RNOp4DfMbLd/z2BMPdwbA9R2fyjV9GbL2uzCb0LIFQcZ?=
 =?us-ascii?Q?Y9tUyJm8s6F6BMm4Qj75wRxzVtQExRk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfabcfdb-ba90-4663-6a02-08dedb02a280
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 02:02:29.7780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zp5eVh8S4jPgzyCk4/IWRgFeQRAjvK/VAO+5A3SH9BQvDJuCKsF99Os5oAnZglJ4dPOD+Z1pG5NKS1AQuTfyAqJrv8MFdwT3+3BMq1Zn0kgnkFKmYM4rYGrWe0P2tMsG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14075

struct snd_soc_component will be capsuled soon, its member will not be
able to access from non soc-component.c.

Add snd_soc_component_{set_}name() to access name.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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

