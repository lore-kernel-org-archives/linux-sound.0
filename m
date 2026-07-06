Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011019.outbound.protection.outlook.com [40.107.74.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2544A37DE83
	for <linux-sound@vger.kernel.org>; Mon,  6 Jul 2026 02:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783303386; cv=fail; b=V0pm8kJVPls78RscVFRZWPiHaLkgr5PMYKIk097qHz1EPmTs5KOn3VHfOs4ACLqra7KMf3bkr8Na62w2l1+RbtEbXsouhd6smXQb/ZBsGOGXKfse+YbENP2GYupnkWxkrFx+pPjePYinxLamnvw4gdeWHsNEM6B9Hfo18Zixgd0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783303386; c=relaxed/simple;
	bh=oUKOuwGFgdsRUAPr946IsutHzZFDxaG2wD30wZXjWmE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=RgolpzwdCGBX622rDLCm6YEwz0GHPDTCz2pYuAtv8IJAhUTH4ZSlgw0Dx6fnFEwgYkyWPPZ1hDVbNY+llvB8Bbweu0Tirb/hla4SxHCJSL5W++NlsUEz5zaP9Viqjltq6a0qrkyzPYX+DYIvFuq3ECcBVWiGJCWed5ccKtFE8io=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=IHViHB5r; arc=fail smtp.client-ip=40.107.74.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="IHViHB5r"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P3aJ7APiYfeimetFJIQIjEU/ExFshwoUO82TzVGjAkYL5OOLKNblbO39RA3HVBfUdIRxPZFpPej5CHf1Ms4hNZCJuDSpcfrD4as2nfkZkQS+Jlscg2cVuU5cRYNWmHiy8opN5S58ejoGrgc6H9qEVMVURDGqDDxHB2Qe+yUlBsIIT2PP0OslY3BmaBIFqN72jMY+sthPbjigFnqOVppXVdAbt7jIb/BzOpOJg3apDtWCUv4PfNbjnoBQx6yEVHCXGTGV87/gAZH2Z6XgrSVC/+poYzPLfwA0xZGCfg50+1gFVyzvfe4EApFoZBHZLQNVximl7bOoomUEeyXkw5rdzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uuTApaQgb2SJMnuGbpctGa+R310CcO0FVRrc5KnCiSs=;
 b=Fct3wcf3HOebiohn9yHcB4y34xXuAgwsbMQNSoauwtljceHAyHqq78pEvAOqrkSm9DG072+mLt5ko5lHNU16soUQLq19aO2MY0Hwnx8B2DM6q7e/qNgYqTNDe3jZ//yocAKmb3UGhJFpeN3qPKYp0Db82t2yNr1QSxQJHOuxCsIY2e0zIUmdRewbZA4c6FkzzPJszXQCKnv/mLWGeQwjRqjmAS97pUNuRUcjbvzklKUV6ibJr7x0aEJUuayJ5qpjfKQbTXzcGfdgVVG+WylEZhw1WAmWh5mNl03cv6GpEuc9cc7PpSIZfeRNl/e0s6YmD00EJK2ggSG4DyT+Jeg+lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uuTApaQgb2SJMnuGbpctGa+R310CcO0FVRrc5KnCiSs=;
 b=IHViHB5rlTMsLCenklk6n3Mlysu1K3xTqYSUyC5WiEhAYVGtdg5ofuqldbDQtn1L+X54Ivo+E4vzt1E6wJkUZV4fbmZ+58tYFf0HHhiyW19ucgBZagRbFa3O5DKtb1wzbc2JqaIkbyaSIG0pq8Hr2OJlxCz/8bcJzV07hdYfNeU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY4PR01MB14075.jpnprd01.prod.outlook.com (2603:1096:405:20d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Mon, 6 Jul
 2026 02:03:00 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0181.010; Mon, 6 Jul 2026
 02:03:00 +0000
Message-ID: <87ik6sc1t8.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 12/12] ASoC: soc-core: remove dev from soc_component_initialize()
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
Date: Mon, 6 Jul 2026 02:03:00 +0000
X-ClientProxiedBy: TY4PR01CA0043.jpnprd01.prod.outlook.com
 (2603:1096:405:2bd::16) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY4PR01MB14075:EE_
X-MS-Office365-Filtering-Correlation-Id: f6ef2637-1e5d-4c58-e2a7-08dedb02b4c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|23010399003|1800799024|38350700014|921020|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	1WBzMCZ9kw5bETSQGEX/8zXAI7qIOhJZgodQuqO5/W4uycd2pHRDja2cEQuE+KtSFihGkmNO3d2EhklnLpa8XEKEdB0suYM3D86xgCjwL5TUMvUqfS3f9SqESBtcfUp7jIZpF1cXpK73mtXP+I3bmKeak6TajXyzNviBgLP9POwQML3kT2gTqTmGWWjeex+yS4XlFS3LtfWUYAhkZrlJbrI5wtzqgY7GvP6nUWtW9kM0TQM22+mMOU44PfPdbhT6PiWX3iDw9BiFtBILeu3k1Ni7OjETnp91sUhw6Nvm79Aq6G+8TOkVF2IePlBLDHVHOO3xgggtkba4J2UkTL/Osdm6j8nzUZpr245D1OVMEfjcki0Serg505ni8FP/iRQu60fBh4G2T4EgHrkvAXj/VE8DFsTFzzWMJZo0wJ8ExUu9T/mPjL77ambK/lWsPB+tLhlL6ovKt3LNfzpIxJ4Tz+phaCxnSPFwo6C/rZ0ihKK+Kgk+eQr10Iv/ivs9Sts5RRwlDWLrMkbO+nJieDO5ltbbCJ3f/8pUIxc8dxHKs/d+LwvxXqG7x01epUK02WUuxnZdeWsWN+8aZnqCxG2woJhCFHZUW8zGx0gAWLFrInOWR8SIEb4gHlW9AxcEerzLnsMXsPtSprrL7Y6gKE51MNBKOcoeVT/G5ymYrucu/OJqaa71GgRb2bVs3XSn6swUllmTZh8wL4ruYuJGs7YuFXKo6r80Hi/Vljmmq/R9SJI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(23010399003)(1800799024)(38350700014)(921020)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3XloqBtJRKNPkxsopTc8j5XUfYyxFnmQ9hu6vBz3fvbXqTc/k49hQZk9+aXG?=
 =?us-ascii?Q?982ieCyJXqYS74r2ujdiJG/e33kcqoBnQ3OXx0QOOd82oh7Bq+X65ypbv5xI?=
 =?us-ascii?Q?ULBdI/SxQjLaL4kKdJnQofQ/iqJT+mKjMsaHIKUGFWKZAUdFF9JsLuYFgBJ0?=
 =?us-ascii?Q?DDvaSZzO+LJ6eEWOUaKFHhDn7Cj9KbZEnV04j31HMN874Tok2KoOfcmvQ+Ko?=
 =?us-ascii?Q?bcBnMJbyJ5hZD5H27Q9Zn0IvviPedev1WNHYglKlIXsFgJP8tXy6oDvS3AwA?=
 =?us-ascii?Q?dkbTMOg7KyOv8esCCnRshjvDOreAenPftJvTMYtYujAglNvx5Pn9uNETw7YL?=
 =?us-ascii?Q?y2IpBNlznDT0WMMHbZcas4YdZEQfPpCgeKjgq8V9cmxbr4TdCShmWVHebZcT?=
 =?us-ascii?Q?D77pQ0o0YabCUk0PWO3PNNQVdChjF9GRs1h3w1CoKZNyTB+2WU+SBc3RxpEw?=
 =?us-ascii?Q?GsajGmDQ533ndUDKjzKjCV/km1k5g7cwjIjYJ32dCLOs+7enBYCgC1B21QXB?=
 =?us-ascii?Q?R7BuYgZp8lAL/XrX3aFl0VgaGKoFGlMoC3C+34FEVppiyS/zkzFjUd4nAVIw?=
 =?us-ascii?Q?IV16Wrl0CkPvGdVbxytMyF2xbYnecmTolSykIviSfDZ87ZuQ/KFDlD+N3tOD?=
 =?us-ascii?Q?u23id/McxUqX57dUtD723DtapeByswjaw4ATxNLT/XbD2fsXpudhXiJ5l4N5?=
 =?us-ascii?Q?x2mhs7Qiaayii94S93RsDGs8EUpe0pf45KER3CoaGiM73INzgKEBVdUoUtC7?=
 =?us-ascii?Q?NVWG6X1DyRlPY/d9u/Rr2c6hTu6Lz7lNbNBHXlD1/VcsG2jYHCIFMMsZwyy/?=
 =?us-ascii?Q?kgQSg+Onj/qMaLSTroajNFziThBMdkDs3z0mzJmXWHhRuObxqJMjHqT3Edn9?=
 =?us-ascii?Q?Rx0po5KFBeje3fuHFQOnpC/Ozxo1Se322lROe2wW/R2p2q11VLm6yGBVozAi?=
 =?us-ascii?Q?KRmIJ2l7yfIqX49+nczrq3FH+gzmrCKvSUwPLXmibXmx5Zb8tmGwbNNhCJQz?=
 =?us-ascii?Q?QWXls1rlwy3PehdU3zweYzt7E8RVAF+IqKHTmaV2FAh9AY469wNquFN9KMed?=
 =?us-ascii?Q?mbX90+nJJwrs8vPKOxdz4tQkyuyftwQHgssscYzYcaiW4GflbNZKOpiArcbr?=
 =?us-ascii?Q?XA6DFO/Z6pal5XIxPd1NiBB9xGpS9ocuB0/r8WxL3GXjMeQFQEJ6rn6g4cRu?=
 =?us-ascii?Q?cy+n8Dk3+kldykAvihJ8DfRqtqQUsdrsp3S01H46okfP8bcIib0dIla+OZ1n?=
 =?us-ascii?Q?SlgZqKqfMMgDZIpD2ez+zDbiSLm29Q3r+FUOfuA+K8aeoY0s+jCoVgraY2Bu?=
 =?us-ascii?Q?HnzJ1/QrxfjmGCexoskCyIaJOJXNWhmFc/vGev1ALJsBEQ/yMNCopYMgQJ4J?=
 =?us-ascii?Q?A9gXothq2aEo3PZBoAuxzW55pdAsRhbfnqYgamZEmQVJjiW9KICLmB767Srk?=
 =?us-ascii?Q?gzM1R8MpH1Jhx62f0cshbjtA4fqWkZwTpGl1o87ECi48+9peSCBFba+R/6R/?=
 =?us-ascii?Q?56SyT2knaOpI92C0ue7ZnSiAIVNqhVhKgjdnqMj4dKDWIhQlIOOzqFlmGNc/?=
 =?us-ascii?Q?9dHB964r+3TdmOw85q5lewgaRW81F5iOGkFStA9tv75NwCiCHpkt/y5YCCzv?=
 =?us-ascii?Q?0vb7930WGnUxgrmCwbA7OExETHtf2VxW6WUy7e1DzIxC+OBfTIPkZbGZOJhF?=
 =?us-ascii?Q?+ZoGeSHLF0n8eEQLjVKTqECpffWefPpSpUfIncxG6ojmabSHXO5sSPIi9cKz?=
 =?us-ascii?Q?DHxbMBwNWX+PcHIqHtq349CcUlwIKz9jhOhnNh65Penqw+jXl0R8?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6ef2637-1e5d-4c58-e2a7-08dedb02b4c1
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 02:03:00.5797
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6BwIhtaTf90DDge2ss2o9YIAKTtbhrU0zsKZ8jfz3SMa7OKqsfuiMZ+/QrpkIexE9wkNMyn0qSJ25S0SPKP1kXR4J4ltYPL3XqXxB7+5PKw0l+vpFjyezG0nSUn7w5iD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14075

Component already has component->dev. No longer need to set dev
on soc_component_initialize(). Remove it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index f1368bfe3fa4e..8aaf85db0ea5c 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2703,9 +2703,10 @@ static void snd_soc_del_component_unlocked(struct snd_soc_component *component)
 }
 
 static int soc_component_initialize(struct snd_soc_component *component,
-				    const struct snd_soc_component_driver *driver,
-				    struct device *dev)
+				    const struct snd_soc_component_driver *driver)
 {
+	struct device *dev = component->dev;
+
 	component->dapm = snd_soc_dapm_alloc(dev);
 	if (!component->dapm)
 		return -ENOMEM;
@@ -2725,7 +2726,6 @@ static int soc_component_initialize(struct snd_soc_component *component,
 		}
 	}
 
-	component->dev		= dev;
 	component->driver	= driver;
 
 	return 0;
@@ -2780,7 +2780,7 @@ int snd_soc_register_component_c(struct snd_soc_component *component,
 {
 	int ret;
 
-	ret = soc_component_initialize(component, component_driver, component->dev);
+	ret = soc_component_initialize(component, component_driver);
 	if (ret < 0)
 		return ret;
 
-- 
2.53.0

