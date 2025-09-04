Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011058.outbound.protection.outlook.com [40.107.74.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19CB5169AD2
	for <linux-sound@vger.kernel.org>; Thu,  4 Sep 2025 05:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756963283; cv=fail; b=X1FU9HOvhvyUtLuiAfYJ7on8ybeZFB1Pn8lG02yxY7apQiXo1s+BFSNFxiFWFrdANHwrj3aFJVlkeM68Op3uFl6sIjhCimq/zoYkHGxPpiN4lyvRUS1WJuVaTJyYCOOi139bSWD6rb9Fn3Sm1a0F2zvAbb8jMtKsot0nydrtqpA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756963283; c=relaxed/simple;
	bh=t8/dU+qhNPhTHGArysd6OvjLCvb82QfHbhptTPliulA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=shI4gQjiFj3WfFhtqbx1+ITKFbRhvGuC3wYIjZnPi3lVmZsz44BzEWEAf+/4b03tu1K6mHyFjTg3BzLyP8cu4AdpFzHjfB77LOhj5O5kqnNZCYEjFRpKCMhGqoVpQl+HtclwUha5mC5KtuZm9gYOZjBTgboCRH+ddl6qMNvTvAw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=DgX1BYy0; arc=fail smtp.client-ip=40.107.74.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="DgX1BYy0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fOUwZitdiZJJGe5HYCNRjx8/tgirOcxxgg2cgUXiWNi9H17PW74xOn/ewxj4ZGUSw9qAdwq4UZ6Bj1zhrO6SRKo3sBC2WIHpfhglwCNXyCQ7rojmzxpNDcc8F5pGdyZ7MVKCixN5v6AJMiyIAcXbvLCgIEtqlOq59fJEQju+yjCjiHUhGUQe/2WHgj3ZupwEdroHOH8gTF2ljhHWhEOrWcm3X1ZJVUve6RRnQSyDwv4VKu2wEucpLL6w5ezmhkoL6FGIs/DnaeZVsk0irXzpADmxk7kEl3ybs7SOq2Est+jZ3NHttQ96k624283jUsv+7NuplD55YJSPY3GzvbfkBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7oEjPBXm9G3Q/Gu/KGWOr7FcG9YytkHl1ystzt8PMic=;
 b=LdUwf15GXVPwF20IUXpYnplnbz5ismlWd1lhr8xicqg0/O/7IgKBBD2Nnq9DoRAwGugYObtYpttpmYPUep9ww3EgqMEhlSN8dwfPQD6CMyp5RO5F2nhg3Q9cJ/eBP3ozuwAyUUuKg8iMo27o7YecTimxjoyc35680PR3cz4qtU6ANLNpjrXHMxfFsqHR8CRRr8WDNorm77dPL8MPNoR4YfDe47ROkU3EGjcpc28qa2YlfLbVPbM4AMzitlJyk4g9Rmr/jLJwAWM0a8vj/NfLwAPPg5Htxs5nwA8hzifgYwNnj9AFtIWp6AnsXlrWSrgk6+BwYs2bzqcqJ3zwAAC11g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7oEjPBXm9G3Q/Gu/KGWOr7FcG9YytkHl1ystzt8PMic=;
 b=DgX1BYy0KinxWi3V46f2Ingy2Yapqt5R0YiItR0T54d8vwN6gSWbejYagpEqEQJmTTaKJNw/Tl33VSA3cfjT3cRwoW4Zo7kFAAAtlAHWRXE0QiB3zMU41fNwJZJqGF8tX34biAF/Ll3h+R/uFOAMLmw+w8VKhBX7bdMGPiRbN4M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB15650.jpnprd01.prod.outlook.com
 (2603:1096:405:288::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Thu, 4 Sep
 2025 05:21:17 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.9094.016; Thu, 4 Sep 2025
 05:21:17 +0000
Message-ID: <87a53ax06q.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 03/10] ASoC: soc-dapm: use dapm->component instead of container_of()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87ecsmx07m.wl-kuninori.morimoto.gx@renesas.com>
References: <87ecsmx07m.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 4 Sep 2025 05:21:17 +0000
X-ClientProxiedBy: TYCPR01CA0137.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB15650:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d984a8c-e747-4636-2068-08ddeb72e005
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MEiTkwhmxRghcZMea5TAdr3ArIlxTXNxZJWgHucVBMAKMT0gIfZ3TSyQ0pR5?=
 =?us-ascii?Q?g/uMSgadBVPatxmDK9J9bo/bwb2QVpiRMTqX2ZEY4gq9HnBhd7gP5Zq3oj3n?=
 =?us-ascii?Q?8VoYw+qIGdgkvEM8jPgYcXgZSz+IX8VODIYARY4Pqme13a952OnPprvmyxdI?=
 =?us-ascii?Q?18qKDX+7kaJxt6BrqhlXIwvI57IGvj1ZZIKhexJjlA1sD603osH5JYd1A3SA?=
 =?us-ascii?Q?lmBU6s0X/1ai9ivzjY05yyGkZ+1Ey8KRYn8pk4pdSOXQRKes5UAn5hroI2Q+?=
 =?us-ascii?Q?DXFEuJKjsGEKkHLgPOXElxK5SiYfIkIT1Y1vzweq9ZE/AH9+iPpY4/yiBMF/?=
 =?us-ascii?Q?X26R1O0F0P5yb5N6efc+ysjYZFfbirF3z6AnpRzTVcz9ngAgwVliRf/FssrW?=
 =?us-ascii?Q?uXONQv01gPzGU9VJHKlzAcEyi0KIUKx6UqThHeX/vMHanbRv3SBnJwmf/q/3?=
 =?us-ascii?Q?zRfvHukQBkj30ufhT+eVHZNxFM/znzeYnuSjY3B8WO0q1MEFAukovylUMfy/?=
 =?us-ascii?Q?PgCF6JJjgnNxcr18jltdUMIwKso2tIHErMuC5idy4l0b60H+A6aHS0FkljXq?=
 =?us-ascii?Q?CgfOpqixsQV9KWQmLEa5PKRW+oYgetm8QPd949XGaBgRUS78EcU8+1eh0Ceg?=
 =?us-ascii?Q?jAvhtDCQdoHdQTdRm1EFXxxB1wTfHGQwqZY0ubg8pQxK94mI9mBxoXed1DL6?=
 =?us-ascii?Q?4pGl6NvYtQ55Zyw9kqndQLKJreG0Fyg3SwaNfL5/bpnH1b8+jtqkQmV9G3zL?=
 =?us-ascii?Q?jEJDzbecvHimVmPvWP0gKqOFM13Ue7tyVZc/8dtbdtxPTnwZJdInNfNXf8jZ?=
 =?us-ascii?Q?D8691c3VfaOeVLSRcqteTCp10SB/bxc2yfXKCTlD32S8NnjQkglcqjjNmzDd?=
 =?us-ascii?Q?bT7GRtwkuw2YOUGrWzC1yTZJuZcIoQQUvc6/5UH7U62AcuKbR4wJjrfqDfNw?=
 =?us-ascii?Q?Kb0/+Kr3X85W/rhITO/xzizS2BXpjhW9YbZf99fkjYlGs2wBRZHT0sm7cOKx?=
 =?us-ascii?Q?NN1EDQVk7j7YpVM7BhtE5nn0RIOfbjUgKvwdf2kEbUUpHxJN/IXs06ztlEkR?=
 =?us-ascii?Q?e4BDMP15KVM+hUXi1hFm63djWt5D92JTbbbP/TWB3KTDezrEjA15QgJWIN/r?=
 =?us-ascii?Q?aAh+injVJFbVynU0G8CPcKbDxKHezmtuc9iE8MEWytHffSEPp1q6fwZpIEIH?=
 =?us-ascii?Q?lymQY2mnxi81nmI0e2zajIq57V6qYBC3n9LXk0xN+hSUrm888hII25BOozr3?=
 =?us-ascii?Q?ej7ADOy5yDfegn1FlbHjrD323bqFPDs8qhVB2HdCAdQf8Bf3eQqfhx+PZu7n?=
 =?us-ascii?Q?lotncHEKuYpHh5psZKFmS2GhaNvAoF5Q1JU93YXQsBZfR6PjoQ904Mx00d7U?=
 =?us-ascii?Q?WoUsFdugkDr3CnWpJg4S+2xrOB2kVgYGZcBvI0Ig/Zj2Kcyh02sLZ4OQwf6p?=
 =?us-ascii?Q?yxhpb2RMmIAsZmvq6kvzOD2tjxoOE3hGljpBq0e8d/ud1QEpIBb/GQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?R9sbOOs0JwgqPQM8BfPT2qk66QApzC/Q35RuUudbRxi2XcMKrq1DOD6QEAi7?=
 =?us-ascii?Q?dK0e9ZhGOMG1pSqC+CyZROGz8dpVEpcmLO5Fey8vTh5Gj9/3OFMgFC41bJBM?=
 =?us-ascii?Q?ksqV91XxmE22b4lhiJvm8MJChT8kVAhvb4y/vnWVDPhoJfB2mnEILj7I5WR5?=
 =?us-ascii?Q?jVhx+T3/9KSGrrnISQ85TBGpiq/44suntWk8pid5D/ZdKr69rDLY41LgSh7K?=
 =?us-ascii?Q?qhLPQ34ROCUE7zYE6DsSBZhBXt7ehmoPIIVXbc/xdaPniDAFSk+B1bKm9cMi?=
 =?us-ascii?Q?xQNfKBFQ33G5QhNcwqy2SLajrVjoBoh1iHxiwDPWRMoPeGRJzpYd2gzur+ru?=
 =?us-ascii?Q?Guh52ym5SVM4fbGLTveolh0OZEnhzcP4sMif8hqa/tiLgm8SySpyAz+ajgar?=
 =?us-ascii?Q?U9MEu5JPL3OP6/+OH97P5VTV+5t92y4AKWwRMxvyt3S94AmvUJ83ny3sxTWW?=
 =?us-ascii?Q?kukIwDkKD5SfIZHJcHPStaGwarkdUpDuXpiNwKm7jFRY8tqdPYX6NO1PBmba?=
 =?us-ascii?Q?e7vkqrvMnjbVYQcjGblB+qSUY4kWEskhbpHpxIqh99lfqi1MVNrmiuj7GEFX?=
 =?us-ascii?Q?BhR2ZyyF7j2BFL1VBykdOsm8gAIGqv4+PUG/TDHMQrm+i90OfDVXgPIZfPRN?=
 =?us-ascii?Q?jvhh9cxdxSe83MLS/JHf0YWjofsoRRfRqfsUuk7DwCihotCFUTiv4QMzR9Hl?=
 =?us-ascii?Q?9QcRKzpNphFQ89MkX3y5cAQ2Y4m/BWkgEvyB4sUOikWeCOyFHFEFo+6u5bCG?=
 =?us-ascii?Q?hGea8GFagbCh5kjT8E1wVa1HtgUz86Y7CfD4bKHmv4XKiP1JPs8c8AkSJj9m?=
 =?us-ascii?Q?KZNNnYcfST/oSjqsdgmrLk2zCF6m+yN8ldqTFzLNlmEVFU/O6L0cb5FzLMkv?=
 =?us-ascii?Q?V8UaV3kee8QO2ME7g8Yi3+qQMMs58flEEJpoMPCtwaaiwjhiKfouTlStk1qr?=
 =?us-ascii?Q?rjNQlbHr8JEoPkVmzJsIGVVKh2J/C0RlwblEF2OYLLwyZBnNNGpvFNMJE9yb?=
 =?us-ascii?Q?t5ZffG38XZvYPlPD4KpkdfaHuVG7+1QdCqf1/uRy0v2/6e4PtRu9FHeUafX5?=
 =?us-ascii?Q?C9AwcQYoRsKnv06EjEjFZrMbQs6DIsu0m9B0RV/pfjASCWNILYCSlvO8TSIQ?=
 =?us-ascii?Q?zMwg1zYJ0Z0yGW9T142j0I/2Pd7fozwhW39M3ii5dImhxArnSf+l/Xn9+cwY?=
 =?us-ascii?Q?/qaAZ8cN8Ue9hIOCeCVF74IzJjXGAG15ebLiZo1iF6ALUfn6VcZcVyUP9MDv?=
 =?us-ascii?Q?liUCifPdI7GrViYW6FAu9TtjFM3zClV5zXpjKo/w7V/WysybKHJ4U4BUKYyV?=
 =?us-ascii?Q?TeR8q55V7qiyIimtv5ha2oHXJuZV6e770jviJW7cRLo5hooWKjTdSIOF9M9i?=
 =?us-ascii?Q?Y5Joj8QFUz7ceBZlVUA5OC9Ti64NbCPe+CwKAfkPy4JdWLeMRLqTAhJleTq9?=
 =?us-ascii?Q?hDWgacUAaQLzxmrZFXyRSsxHRZK2/ep4kmeCOyKMsF1BXEDu5zFtIjSTZmAQ?=
 =?us-ascii?Q?lLrP13CZiTGQieRaDqGXiz9DOuOgX7DC5jjMTxXOQRlIFFEhL9e5Cv5E8/XE?=
 =?us-ascii?Q?VoB81XqOFSrodmRf2jPdCBX6d6Q+qikPZFWSBxpM2bkVZqBtO9+wf1I4LDfa?=
 =?us-ascii?Q?S9MmEkaLK5Jl1sYXTramphs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d984a8c-e747-4636-2068-08ddeb72e005
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 05:21:17.4998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e3SZHArH9pOWRGjl3mMh6KrXgBTkoXrKqZIr2zqAit8lzgALxjJt8knj+axQzeucbaOmxtwWXaHQP2sgvmlz+TsMfA1+ulNoi8B6NyyTr9druyHGfXOT1GVRYbVfNVpq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15650

Because struct snd_soc_dapm_context is soc-dapm framework specific, user
driver don't need to access its member directly, we would like to hide
them. struct snd_soc_dapm_context will be removed from header in the
future.

Now, snd_soc_dapm_to_component() (A) will convert dapm to component by
container_of() (a).

(A)	static inline struct snd_soc_component *snd_soc_dapm_to_component(
		struct snd_soc_dapm_context *dapm)
	{
(a)		return container_of(dapm, struct snd_soc_component, dapm);
	}

dapm of component works, but dapm of card will be "unknown" pointer
(= not NULL), because (a) is using "container_of()".

OTOH, ASoC will call snd_soc_dapm_init() (X) to initialize dapm, and
it will be called from snd_soc_bind_card() (p) (for card) or
soc_probe_component() (q) (for component) with component pointer.

(p)	static int snd_soc_bind_card(...)
	{
		...
(X)		snd_soc_dapm_init(..., NULL);
		...                    ^^^^
	}

(q)	static int soc_probe_component(...)
	{
		...
(X)		snd_soc_dapm_init(..., component);
		...                 ^^^^^^^^^
	}

And snd_soc_dapm_init() (X) will fill dapm->component (x)

(X)	void snd_soc_dapm_init(..., component, ...)
	{
		...
(x)		dapm->component	= component;
		...
	}

We can simply use dapm->component in snd_soc_dapm_to_component() (A).
In this case, dapm of card (p) will be just NULL.

Use dapm->component instead of container_of().
The picky note can be removed by this patch.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-component.h | 15 ---------------
 include/sound/soc-dapm.h      |  1 +
 sound/soc/soc-dapm.c          |  6 ++++++
 3 files changed, 7 insertions(+), 15 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 48e45cbe82e53..7322d5d4c0bdc 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -260,21 +260,6 @@ struct snd_soc_component {
 #define for_each_component_dais_safe(component, dai, _dai)\
 	list_for_each_entry_safe(dai, _dai, &(component)->dai_list, list)
 
-/**
- * snd_soc_dapm_to_component() - Casts a DAPM context to the component it is
- *  embedded in
- * @dapm: The DAPM context to cast to the component
- *
- * This function must only be used on DAPM contexts that are known to be part of
- * a component (e.g. in a component driver). Otherwise the behavior is
- * undefined.
- */
-static inline struct snd_soc_component *snd_soc_dapm_to_component(
-	struct snd_soc_dapm_context *dapm)
-{
-	return container_of(dapm, struct snd_soc_component, dapm);
-}
-
 /**
  * snd_soc_component_get_dapm() - Returns the DAPM context associated with a
  *  component
diff --git a/include/sound/soc-dapm.h b/include/sound/soc-dapm.h
index dbb71e396febe..c6470d391eeff 100644
--- a/include/sound/soc-dapm.h
+++ b/include/sound/soc-dapm.h
@@ -662,6 +662,7 @@ int snd_soc_dapm_update_dai(struct snd_pcm_substream *substream,
 int snd_soc_dapm_widget_name_cmp(struct snd_soc_dapm_widget *widget, const char *s);
 struct device *snd_soc_dapm_to_dev(struct snd_soc_dapm_context *dapm);
 struct snd_soc_card *snd_soc_dapm_to_card(struct snd_soc_dapm_context *dapm);
+struct snd_soc_component *snd_soc_dapm_to_component(struct snd_soc_dapm_context *dapm);
 
 /* dapm path setup */
 int snd_soc_dapm_new_widgets(struct snd_soc_card *card);
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index cd8d385798862..4550bf33add27 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -180,6 +180,12 @@ struct snd_soc_card *snd_soc_dapm_to_card(struct snd_soc_dapm_context *dapm)
 }
 EXPORT_SYMBOL_GPL(snd_soc_dapm_to_card);
 
+struct snd_soc_component *snd_soc_dapm_to_component(struct snd_soc_dapm_context *dapm)
+{
+	return dapm->component;
+}
+EXPORT_SYMBOL_GPL(snd_soc_dapm_to_component);
+
 static bool dapm_dirty_widget(struct snd_soc_dapm_widget *w)
 {
 	return !list_empty(&w->dirty);
-- 
2.43.0

