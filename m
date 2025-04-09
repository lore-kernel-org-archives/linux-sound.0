Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010057.outbound.protection.outlook.com [52.101.229.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B488C1E
	for <linux-sound@vger.kernel.org>; Wed,  9 Apr 2025 02:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744167432; cv=fail; b=lG4B3EALua9VuwB1vVQVyv+CZioOZMjpeOvDOxbvufFH7g0Q6i3l+eaaFbzJ7wLmTpdg+LVPho6dqypp6hdPBZZ9h9ByN1JmprVcp3jQ7bByzY0/vDeobvsgnf7+NC2znrIg1vwh/UOEHM42lYnsPSIhxeSKNk9FOwnxtc93Zxs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744167432; c=relaxed/simple;
	bh=E9Q0FXAVtWq8MwIC3Kn1GpeGmLBa9w+XZVk+UaF2SvM=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=a2RFITCCJV2/NL9P/W/glitJjZWVc/REmwNArlL+J75s2LsHBd1W/MlxHgIt9vMfoC1cQtkRfiUBlDq2AJXY8ZdcA0MptEg675AYjvSpHI2IX3uqN/oXTNJSa4GegHygAzU71Nk7S/7In6ySjNunwtRpvewdbOye5WYXECnWehE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Zna3VXNv; arc=fail smtp.client-ip=52.101.229.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Zna3VXNv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rrogxxq5/xR+phlLuh4s1R+IlXTuCaxUx95Li1EVx8pVcA6IUk3/u4R8wC7F2HsTchzJRDi6VNoKnP+CpNYUUCxEm9W0i6+Xso2Ily/UxpQ4NSNfg5LdqV7oODHJ+TEMLaUlQdNfO3yuAG3vehD5SielXxB2bl86uLLtAiqfBh5HP3DHhK19FDG2dv+J3/Lp8K31PFhOX7XbsqmECDNY1+Lr7HL83k6MTm+kAclKwLZclhu+c49FQvwMsZneaNB/+hxkM3wV6g1O2FkDzH7H+KQ8bpWn2B851NwQVea077OQJgX6Tkyz8RJexFuNlURDuXKqcjedMDZO/Sgo/Jczxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Kv8/jjJGL/EWBt187YGC0fk/tnhrqgpDVIyVMCzk5E=;
 b=Xb+ScnUbfGHPpEGdLoZYe9sb67U/Zq0ftfOvQpeEzajljNt+bPiE7SnZ7nE7Dy1pAYMHHh7HNi2TdQRw6K4Sk1AYSG5TiBD0qSdKUCjazrIbJ1hQ/xD7pu0XGwlHsgNO7yytD//G7WD10pzcTZXFa++QlhzuKNboYgpylygVNLT4tE05Wsimmew1cRfUIFIBMv+EXgyzqikYQJGRnJBBHUavXBdCEbWxC+7hxE7o3B2dThohj6vpwlRRBeMNvrmffEUQRGS3PjIQb+sgKFOxf0Ep6EFX6sz1xKAYqlZtT8jVEquOPz7pID/daFhShXmPp5OeInQaOmHUD1eoM+U0AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Kv8/jjJGL/EWBt187YGC0fk/tnhrqgpDVIyVMCzk5E=;
 b=Zna3VXNvJrIvaxkfwwuJ4/qtWqeZEpQm4D5Mo8Xs5BU2PRovopGI44ktLnx1I3gPps+IlBk6GyB+CN9b0OyUCn8o1hicprbSMciD8d8du/m6h5tJeXl6D9ovfEceiHqX4D5sbjflwHgBHmLxN7MVX04xvsCN39tqcvv1SCT8Rzc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB11643.jpnprd01.prod.outlook.com
 (2603:1096:400:3dd::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.29; Wed, 9 Apr
 2025 02:57:02 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8606.033; Wed, 9 Apr 2025
 02:57:02 +0000
Message-ID: <87o6x69h4y.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/7] ASoC: soc-component: use dapm->component instead of container_of()
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Kiseok Jo <kiseok.jo@irondevice.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Benjamin Bara <benjamin.bara@skidata.com>,
	linux-sound@vger.kernel.org
In-Reply-To: <87plhm9h5q.wl-kuninori.morimoto.gx@renesas.com>
References: <87plhm9h5q.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 9 Apr 2025 02:57:02 +0000
X-ClientProxiedBy: TYCPR01CA0129.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB11643:EE_
X-MS-Office365-Filtering-Correlation-Id: e05b2240-b1af-430d-d440-08dd77123400
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|52116014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?spRJoMtwkai7JVIQh6CbxTmjG4dI/8OfzUzqe11xvZEFETGWS0L0z0eqs2pJ?=
 =?us-ascii?Q?HkXIjdKqMKjjDJabF3PrWj4HMNMx0nbdTqCljPpwvWNrHX+YPAf5hkMQ5CYA?=
 =?us-ascii?Q?M5pZAoNwPMMUPX/RA66ejvkp49tXZneGRu2bxweakew9CY6OJBcVBvnazrRQ?=
 =?us-ascii?Q?KiEBFTQw0la/4J8SBddp4ZFeXt2RnifUBw06i7XTBUyqcR4/gtSoHzS+c+9V?=
 =?us-ascii?Q?7vV1iAF0g2EHPLdgg3iKE2HpmousbCQukP/0n43p59YMlw8yagzyqbg9RyjO?=
 =?us-ascii?Q?f0tiqRHBqz/LlRD8McbVAhny2/lhZBuFOZUposeFnwBKs8K7ShAKUKs8OeNl?=
 =?us-ascii?Q?4pqPO4Qk/yOtr1AUo3hCA/TxXU7A+mZ7QcC7UUl+wikco6hrXh0gaKv85NVm?=
 =?us-ascii?Q?cfjFFTbAfm3HuxrnMgFBHTp3q6z+WZWzPNbpzj/sTzPyHWXqNnqRAoe5IYTv?=
 =?us-ascii?Q?GOB9YTVZ9zeH6Y7hJGXTAqt4ox6Y1BdccsUohoFx62o/YRdHRqZdlwGT9hQU?=
 =?us-ascii?Q?H2KfDIEpsjhZEPikfWPwYMNforViyQlXwtORbYlZF+S8M2qLHO5g/VjBOnkc?=
 =?us-ascii?Q?mJMSx78Ce4ICpKn47OyVMbAgefb3g71NhFlxDLay1hT2YFQEjHL0bGlyzMVy?=
 =?us-ascii?Q?n3eP8hWm7qUwWRphKTcg8m/4bZ6CA+88o9dR08n0URNbB7y6L6plExAccm1c?=
 =?us-ascii?Q?/Ony9tuDTHQPCHrx0jNw6WzSsQSCqQuHif3Njs6s82PqLYr8B9p0uYB3xWI7?=
 =?us-ascii?Q?oJDZSxy37pk2sKMeg/TDQs6Xy/PFQHTaS09KjPXsW7MrW17hF9+YtqtmmL9f?=
 =?us-ascii?Q?I3Mhfut83PvliwbDGtFMnW33padK7H03zLhNUecE0cK+U7yCeSjnHHv05FZ2?=
 =?us-ascii?Q?vIfGExj2eSssIPyQlHPejhR+Yw+JytaW2f4W+G7TTGZaG3Fdg5MejldsX9Os?=
 =?us-ascii?Q?/SU1OMv/a/d2V46sTmLCgjWbz12LLQMqWst7hwOHm9ByvI4cdwV99iVU+/Ce?=
 =?us-ascii?Q?3GmySgpcUmvxKVFVN9TMHpwTmc86fy0PhHIYDOLWW4cyQnGthm8kz1YsiSaE?=
 =?us-ascii?Q?T9uGxSMSG/1jx5JTqeCW9F4dKSP7Eo8Owy4QLUe2J0zWh0j80gaRa3IAmiQI?=
 =?us-ascii?Q?NtBSzc98gsmxae7LRp70RtvpcbyuRouxxy+2RJrAry4D+2dieajmVqR9pzPF?=
 =?us-ascii?Q?RZ/tzvRdmyh4+iZKe75WH0BoO+TjkbrcmLpEDUPEK48UWG3Qm7VHKQMKKH78?=
 =?us-ascii?Q?qsg5FJFLcQnrylI+uT4+oLY+W1xf0IjN8PwdzSOm2gK1GJ3yE95HomHOiQWJ?=
 =?us-ascii?Q?uez41U0tcxTI2DCBoVStDOmPizyBcCJ4sx3tD22eM/L0Z6TPoW/OX6BwJLQ1?=
 =?us-ascii?Q?8zMLTh+VVLFkEkgJu21ylUa08lu0tpnPISSSIy0JqmdNxl8Sv1iAf4hBhjYf?=
 =?us-ascii?Q?I/8JCizgo7szRV2i+4FIayFMaIHSPVYFF6iDIbPDJK0XBJhCNkT9X/YlN3aO?=
 =?us-ascii?Q?yXm39mIj4NwyFIQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(52116014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2Mo7kDBzIA5A++9oA/uXSOAoHSGLCchRnYL+B7pOkHfquTIE+grbULvlFwcb?=
 =?us-ascii?Q?8W67km/9OUUEMzTvByo4XqIL4VVjxDiXfSB35d+/tYXCFeHevCHLbEXG2HmN?=
 =?us-ascii?Q?rjJqOlA7l2Ufm9KtQWFBIIn2bGIRhdTtoG1dN7vpFIHSrAUXK1dV83TU6Xtj?=
 =?us-ascii?Q?8rjE7NNXplJ9AOkVj/8uYYC8K0lv9h9NBXpewC7XiAUjNprPjDfw9xo0WT6w?=
 =?us-ascii?Q?FUoU4X04G8+60QOPTF7wq2lRvuwP85k0MvQj8PPLlUFzJriug9Eh4/XJXLIc?=
 =?us-ascii?Q?Eay53wKnyDHuofxoQDtEkHQn24Pf/SWBBQTNKFnKXZ9zDYcFq47H1Qz6UtLx?=
 =?us-ascii?Q?9d9/TGeFGE5nnAvw8TPE6ci+UhT1zU77voNhi6DOLQX1UIikm5XBjDhahalM?=
 =?us-ascii?Q?SqJpCVBxfKjBtOAjbXd/wjLYY/mKtUtvO2Xj4HaoOLGAKcf+NGA7SAdoLkZt?=
 =?us-ascii?Q?kQ3Er2gx/LyEudOF+UPEgkMsKuNM9qxDjFfwuULZVfihbhl5ZUJolh9qu3zd?=
 =?us-ascii?Q?jhyjbOX7lVFxlyZ+ft7svOYP/zLywLVwA2J/74wSeBMDICdOxxDARVlXTPnD?=
 =?us-ascii?Q?wftbE9wKLqxo/N+uFhQF4rIf8Kq+qLVblnZVmSs4MJszVvNW02Kjwx6cStn9?=
 =?us-ascii?Q?tJehSRHhnk4BhFIiyfEbib0Y7aQTjhzqlsD9sied5NYkNkhzvfLySVb1Esrm?=
 =?us-ascii?Q?JKda8g76UctOLTpQhGUgNDof+cSC/F4ANs02WAJb+cPaLQk/yMsGB0oS4KaY?=
 =?us-ascii?Q?YuEO05miKG+hRIQzj1Z9QWmIb0W2hljVfGm/rzvTCTLw6r+Sq/Zq/V2dOYD6?=
 =?us-ascii?Q?3NvdfAlT9KtKD9hP4IqHqwwMkSIUvMG78QKUAKyL+g5cJ/TYojDk390YrzeE?=
 =?us-ascii?Q?z/A8HaF4srhUASNYK11uBZ475rZERGFGH0z6a5q+N+NdpxhCvdefy5BtW3bL?=
 =?us-ascii?Q?bXmUxrBLhiMnICa8o7RhN7VyindOLuceWcXjoXLf+VhkcrF9oSLnI4L0gYI7?=
 =?us-ascii?Q?x6vu9mMMlojNVzB45eKZT/vtGJGXIvKJMJWBN/4n4U7ovCYdOsB1Vf1NRKdw?=
 =?us-ascii?Q?CiK40yX9XfosDXZau7TCIQ3YN3Bgh+/LUD7RkjeIgDB6dWvPq1qivOJt/hsb?=
 =?us-ascii?Q?fvr4bv6G0IBZ3xFeQVTlovJF7XiCT1MbI+VdEb3OyZOnwtyURrutW2gmvbwD?=
 =?us-ascii?Q?viTH/bLe071im+BuXFaPINBbtOmDSNDuDY0vARuaQq8VcABJQFHgmqfeyJXa?=
 =?us-ascii?Q?twgGLA93wk+dAt5JcyAK6sw2SMyZ3KNgZBddJU+mYjLgkwulAfLvRzH0P+pa?=
 =?us-ascii?Q?ZebHwoqu/y7LrZhmwIn9f9nrEuDdxxkNghUDmyKXHQpyRkCF+iVL1ZCQB3M1?=
 =?us-ascii?Q?GUmPUHL8YUiq6wCD2SUwSM72E4FYRAVMwwCOjjmUGaFP+VrPxAvHT4eVizUS?=
 =?us-ascii?Q?0jS/3x9TJmFSI5FzUgyUDCcF+Z/uCSzKF6gbhPLmREF//NcNXT3dvXsgreMN?=
 =?us-ascii?Q?6hIap+gA8MRhJpv+WVkzkJ0a2J5rROZCwt1Tfkdm7b70q2rwrC1z37BOJNVR?=
 =?us-ascii?Q?sUle2FW/2/9XZ9gnF0JeQGmspETbS9tpzljjBEy8f8cjXEg4HLvDJPsatGJD?=
 =?us-ascii?Q?GUE7gLMQgvJKFswSjp25YkE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e05b2240-b1af-430d-d440-08dd77123400
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 02:57:02.3045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WLry7We84wKWh5i6OrRhoOg1CgJsDjU4qc684iI75L+3ThZhVoKqROf8wnVcE3RH8QmlJBBS/3azd5LK4TOgd1vBGXGTbPz7SnqUW59x9w0on0dePKrS2MIWyLXuxNAa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11643

Now, snd_soc_dapm_to_component() (A) will convert dapm to component by
container_of() (a).

(A)	static inline struct snd_soc_component *snd_soc_dapm_to_component(
		struct snd_soc_dapm_context *dapm)
	{
(a)		return container_of(dapm, struct snd_soc_component, dapm);
	}

Because (a) uses container_of(), dapm of component works, but
dapm of others will be "unknown" pointer (= not NULL).

OTOH, we will call snd_soc_dapm_init() (X) to initialize dapm, and
it will be called from snd_soc_bind_card() (p) or
soc_probe_component() (q) with pointer (component/NULL).

(p)	static int snd_soc_bind_card(...)
	{
		...
(X)		snd_soc_dapm_init(..., NULL);
		...                    ^^^^
	}

(q)	static int soc_probe_component(...)
	{
		...
(X)		snd_soc_dapm_init(, component);
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
In this case, dapm of others (p) will be just NULL.

Use dapm->component instead of container_of().
The picky note can be removed by this patch.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Benjamin Bara <benjamin.bara@skidata.com>
---
 include/sound/soc-component.h | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 61534ac0edd1..63928773df32 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -265,15 +265,11 @@ struct snd_soc_component {
  * snd_soc_dapm_to_component() - Casts a DAPM context to the component it is
  *  embedded in
  * @dapm: The DAPM context to cast to the component
- *
- * This function must only be used on DAPM contexts that are known to be part of
- * a component (e.g. in a component driver). Otherwise the behavior is
- * undefined.
  */
 static inline struct snd_soc_component *snd_soc_dapm_to_component(
 	struct snd_soc_dapm_context *dapm)
 {
-	return container_of(dapm, struct snd_soc_component, dapm);
+	return dapm->component;
 }
 
 /**
-- 
2.43.0

