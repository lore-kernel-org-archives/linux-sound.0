Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010043.outbound.protection.outlook.com [52.101.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9493A75BB
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 02:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791946742; cv=fail; b=WFE2DIoVHa8GnKvGqytkJBvgiYESsjFJjfApGhxIdAhvpk9jJcbabzarrS0bjFfrjLdQ89auNbNDUTSpT9SKpobhqxInZdqCNu5tq+/u+Lr2Sjy3Kn0r5bdJZDCEli8EONLuUPbjhGznOPuyAVvZVwnEoIPcOXZyaEcgcO4z0d8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791946742; c=relaxed/simple;
	bh=h3WF/wfeppuQPP5hXJqq697dV0YAFmJq53QZNnqNpBM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=AgADvQS57pcAuTKAPM9SwqPo1XkaVxJtxtXP9thYLB8WEPNiTFpIM863UxWPEbhZkSEW6nMtBO8MSykKvVIAUzNL+fo2SEJ4LfjQbX2bIR57f8mFqMfWM/AQE9+Hri1HFNu2WEVAHzJbpzuANbJzJlQqZC0CeACx3aNpPXZnrL4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=apATigYH; arc=fail smtp.client-ip=52.101.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="apATigYH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kgvz2JbDJgTscXGBpa+xy1INU1zeShNeu0XzldmKwFVIjR0FEWf2yL7TtWs8ohb4Q3yFuMyMgRllYT5u2vfPtl93qe0nUkkgo1pf+NdS8zqF9FTT4aXyS6auKRHs2LUHaHLqY+lZIbzXHI2xHRxOfKOAeQrpCuLyflPHbBZB8vaatccLc72hyz9NZFmZaY7lTGhNd6ShHTo7pYkDtkMtvhN7Nb0eQvczB8P6e0yqY8G3FbmV4TyXwTJLDCM/+oHJk9W+xUimmKRGHofIakYO1Zjd5v8R2MP2odOwYLCWJBUH0rxRUBNYCXL1ucwe0PMduArQ43LiJqWABUkJ1cBJPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+0e62WvsiaCkx5BRyCXm6gqHXP4OAlq8fAkajDRpNpE=;
 b=CCDJSO7zVmpbehYs7OKbJtsOoy7aVwnrjwjt86rD7mh8tPy/IEqqkodrlgWNohGLsgOZYYGI0YXsnDsftB6RzCylC7UCn54Ck+ROYLCZDgtqES3+jwUj5Lmwk0Vy4DWcL+Z4LEiy/UJA+p5JAOpLG+pNaYwXgdapdU28ty8v9JKqSY9JUukEzJ06olI5imkMBf5myea5L2F+mqILfEOugNUKRk8ISTcoDcdusk8H57HxduapfHGXh4TODvzCsqFffK/ejUsfJDHr2wo00dNDoe/zWTXYCU/3BDiaxSAyO3i5ZWDxNQR4VS1QNmr/BdJKdtAPC+cPkNUBH2Hhv+tZWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+0e62WvsiaCkx5BRyCXm6gqHXP4OAlq8fAkajDRpNpE=;
 b=apATigYHZJuuW/KF0T26HxuhBoylx1StBLvIguX8xibhb0kZRAjYrRBaNfLxHvQ+tmmO7lgA/anixLgCpLALt/kb4tvWDUiq4iN8f/s0MOUrYBFC0bzjVIp8EmpLz6LiguW5yRWU/Qs3hAIc7nL4cxHZqjOIpy/suxR4Fg/q+I4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS9PR01MB820914.jpnprd01.prod.outlook.com
 (2603:1096:604:50f::14) by OSCPR01MB14695.jpnprd01.prod.outlook.com
 (2603:1096:604:3b0::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Wed, 14 Oct
 2026 02:58:58 +0000
Received: from OS9PR01MB820914.jpnprd01.prod.outlook.com
 ([fe80::12e4:c507:3730:2294]) by OS9PR01MB820914.jpnprd01.prod.outlook.com
 ([fe80::12e4:c507:3730:2294%6]) with mapi id 15.21.0496.021; Wed, 14 Oct 2026
 02:58:58 +0000
Message-ID: <87ik35yolp.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 05/13] ASoC: soc-component: move soc_component_to_node() to soc-component.c
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87pkxdyoml.wl-kuninori.morimoto.gx@renesas.com>
References: <87pkxdyoml.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 02:58:58 +0000
X-ClientProxiedBy: TYWPR01CA0039.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::14) To OS9PR01MB820914.jpnprd01.prod.outlook.com
 (2603:1096:604:50f::14)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB820914:EE_|OSCPR01MB14695:EE_
X-MS-Office365-Filtering-Correlation-Id: f87c6424-cb3d-44e6-d9d8-08df299f17d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|52116014|366016|1800799024|38350700014|56012099006|11063799006|261009223027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	nns/XGs8V5CyyEVhCFK++W+Li29jMRtS3pWW7PCCn0ufeP5zpltVtwTFE7Z5mvWhwR55A/aLwwZNXrfCdcqbF/6LaBYCccZ9MOVdYHvUTxpydgyGT2TflE96Zm5898OqdkfVc0/5hDZvcxg4MvyerE1cm2DCiMVklkeR9Uh++2/0nuK2Wu+j9GYgYs+M/RCOl4gNCI6iIYzdMYBuj3V8VVAGg/RppJWl4LUWUj3sGa30T2fhxGnYWcuzmN3oGt6UE3o6ry3FEZp+RcwJhx+7Srcd/HiNBC9y3UiMw27SmYkiYeNhW17byxfTD2stHCcBjLTr1h5BGUwFUgQ/Jwtzy2IGvfUdtHdcJC15Xy70r30TYWdVGQJ8VJw6VHY7yEdpXfwqJD+mB/61mXMkpjvaSTUCZ7IzA2EBf71fbHVL8j9zd43NDS8yAHw1gCoGHAKVpEfKYlgRsXmSvnKmqswnmNOYJCy1+poyB3NpYaBh+GdC/RJacOilCgW0Rfics8/9tf5ZP9vxI5sy8YsD2RY43TMYVNDAnr2Kh2Pd5jjTSgiNfN+m6HqQDgmCVphcRtiGtqXVlcR5LuwDM069/vqqPTkQCGJIgcDJmSqfD35dpIDVx/u6nu44BTKY8+mdp4Jszs21G25c3jyeg2MCUoOU+I5Ia5Wuaqw974BX25FuQ5I2I0DG1cZStx2GUThpuGApa930ymsIbGjsA1ex7gCQcBv4rfVuny8P5KQcxiEUTFw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB820914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(52116014)(366016)(1800799024)(38350700014)(56012099006)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?OhEp2r4IjmY5R8pQzhdrLvgQDLpQucjqn6Idn8pHvGMlABi1FsgnKU6+1h?=
 =?iso-8859-2?Q?bRO8NudpDtaSYE6TyVZKnaH4qXdsdxI33JK0Zqi59ysUO7J2ZHPskAF6KA?=
 =?iso-8859-2?Q?MHQdU7/k5LYT6Kszu9zKA3k6+zw51fgXw37TdTnVDRA4vP1i+dxYPJ5gui?=
 =?iso-8859-2?Q?GH6i9KHzYfMVbN2+ZIHnVC/4qyGpGP8Rj7maCV7/Yicz/Vn9PK5lk8m5pt?=
 =?iso-8859-2?Q?C+bIvEMX0nTpCyVWM47Xn7PKHh/hsoWbnoEVVsw0xNGisgQgjEnT504bBa?=
 =?iso-8859-2?Q?czVR5RVve9RJwxutQ2aBv+gFU+GAyVetEhaCWAU6V15H17PBDTwuk6DRMD?=
 =?iso-8859-2?Q?xLl9nndjVKriVdl7Du0hdwrb5a9T1N2MrQY5c9JbjluO6sO2UluBYS1D9l?=
 =?iso-8859-2?Q?4JtPm0Qsaw2/r2oT9eq58SBSWLdSwuibnTfX0GNdfYP5rgh9PwEbPw9Zbo?=
 =?iso-8859-2?Q?AKWdEWz7/yPwXMrm7gqyaVDut6WocrXnHzCiDpy7mEjl1NSY7IJY4Bsihf?=
 =?iso-8859-2?Q?wo5B8gkUSw2FGZ98GTwqXY6QAhAPg45zHP649M6t+P8Gh86dLeBPdfc7eg?=
 =?iso-8859-2?Q?8AkhGlnBrp4Dq/2lZqwas8w73/cPJl+uhucwO69sOKXAYHjDkzfeMqo+vh?=
 =?iso-8859-2?Q?VQUmRFw63G7W6rzgSzPzmLd2OalhL/h2fOeFFiYZlA6TMi42BeOn4333E/?=
 =?iso-8859-2?Q?uit+E9Czor0I5s1ih4T/G5CvLM3Ja/gN8yX2sMTsRHP/i88OWKKldFA+iu?=
 =?iso-8859-2?Q?Nh72WpBF+Z/j1wEA3CF0/ZOKbHZOULMrAHheQwbTI7aN0IsAGZWKkQeLu9?=
 =?iso-8859-2?Q?0JHKGiE8NLHm+fTUdKyuOSOp6/YAev1uBE6Tbpv5eVykisxc9b+uk/DN5D?=
 =?iso-8859-2?Q?gILCuelpNmAtPLlP09giTDtG/deW0GFCzY/p8MX+mBPWdJQuBvt9uJZ4tl?=
 =?iso-8859-2?Q?g/goAQ5adTF4pRUKg4DrhhJVAS4FLwqMCiP9Gc+eN9fSa39X7DOnZDKtUz?=
 =?iso-8859-2?Q?4z4JMoJAHbGhsrkcK609auhQNr4oa1raFc2JxizoYrQtpcyXLnzmwK+qn1?=
 =?iso-8859-2?Q?20/lGQNvCw84E/ruc8E+36XWFci1RC+w4/NiESgwxYULc1zE3UdJLIDR8A?=
 =?iso-8859-2?Q?hFDVaBd6vLIGwcWCrPQ3P01Qmrgbn1bwbBq+TC2C0iWHzCsvFg3bZBl4H3?=
 =?iso-8859-2?Q?fqCuWHSE847N+82izDJUxGkLZqiM5ydGSVqy4xze1dNi/EF1imr0n496Kk?=
 =?iso-8859-2?Q?2coQZLAt0GIHpNf029lJzkxkqj8S5F1qSaILqgRrvumlBpFxGF+Hmgar1J?=
 =?iso-8859-2?Q?X7E5EdRZUYz9S8O35cEncbUTnoHy9JpVovbF7OjSqe/9Vfp81rqEEQFw9f?=
 =?iso-8859-2?Q?bDy2mWerUtUol9Lbo9mhQ3BMIaOciRCk/CzDqQ836JJDkNfy8BlylOna+X?=
 =?iso-8859-2?Q?ulzg5rpWHPwp2EWLWNyk6uVAMWNpsoRG6bxoaKKbNpAmHPgJW3CoZLJP7G?=
 =?iso-8859-2?Q?vh4YPAFmx6kTKzrhYJS0q+Hcqv6DSc/Qd7lwijUaZCT6siPwQS1/LWfA5P?=
 =?iso-8859-2?Q?4Vt2i1rdok0Mgt3xExE0IsB0yTCRxBfJk7pYiVcYYKbU5D/7xHKFNjuoRl?=
 =?iso-8859-2?Q?xZ5x9W/IRWp/nc1XMSPm213yV6/xgvXjv8viEVTE1H1f3ascA9VI5Qg2N9?=
 =?iso-8859-2?Q?8vCp50B3XLq3kMYqJKrjdLXvdop+LPNEnHrW5hypnBCdwv/XQm+tRCdi9U?=
 =?iso-8859-2?Q?xNg6p9lLcVI22pYkIPHsZSZRLnOZ5PEF6qXtNH89cxCnZ5z7xslDo8medg?=
 =?iso-8859-2?Q?aSv32vvDTYuI68Lv2cP9vyQlh3IoTfVEomInI95jAvAFHFFkNyWW?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f87c6424-cb3d-44e6-d9d8-08df299f17d4
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB820914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 02:58:58.7008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oCLjI+lWf9GwW2fYlYtJQRpUU4u8ZuW+0uyhvIFEwpk0lr8nCDqvhGP19ifM0YSCOHC9pJ6XqJUclJcsr9k5eeLFOeNitJ8KAYqIKuMo5HBTUiRvW5kK+3/g8UR/3C2e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14695

struct snd_soc_component will be capsuled soon, its member will not be
able to access from non soc-component.c.

Move soc_component_to_node() to soc-component.c

It renames function name
-	soc_component_to_node()
+	snd_soc_component_to_node()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Alvin =A9ipraga <alvin.sipraga@analog.com>
---
 sound/soc/soc-component.c | 11 +++++++++++
 sound/soc/soc-core.c      | 18 +++---------------
 sound/soc/soc-internal.h  |  6 ++++++
 3 files changed, 20 insertions(+), 15 deletions(-)

diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 4984cdf1f7b89..e431b07159eb8 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -1276,3 +1276,14 @@ int snd_soc_pcm_component_ack(struct snd_pcm_substre=
am *substream)
=20
 	return 0;
 }
+
+struct device_node *snd_soc_component_to_node(struct snd_soc_component *co=
mponent)
+{
+	struct device_node *of_node;
+
+	of_node =3D component->dev->of_node;
+	if (!of_node && component->dev->parent)
+		of_node =3D component->dev->parent->of_node;
+
+	return of_node;
+}
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 06f001baf2472..e6cc2bb73fdad 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -771,18 +771,6 @@ static void soc_resume_init(struct snd_soc_card *card)
 static inline void soc_resume_init(struct snd_soc_card *card) { }
 #endif
=20
-static struct device_node
-*soc_component_to_node(struct snd_soc_component *component)
-{
-	struct device_node *of_node;
-
-	of_node =3D component->dev->of_node;
-	if (!of_node && component->dev->parent)
-		of_node =3D component->dev->parent->of_node;
-
-	return of_node;
-}
-
 struct of_phandle_args *snd_soc_copy_dai_args(struct device *dev,
 					      const struct of_phandle_args *args)
 {
@@ -815,7 +803,7 @@ static int snd_soc_is_matching_component(
 		return 0;
 	}
=20
-	component_of_node =3D soc_component_to_node(component);
+	component_of_node =3D snd_soc_component_to_node(component);
=20
 	if (dlc->of_node && component_of_node !=3D dlc->of_node)
 		return 0;
@@ -1339,7 +1327,7 @@ static int soc_init_pcm_runtime(struct snd_soc_card *=
card,
 static void soc_set_name_prefix(struct snd_soc_card *card,
 				struct snd_soc_component *component)
 {
-	struct device_node *of_node =3D soc_component_to_node(component);
+	struct device_node *of_node =3D snd_soc_component_to_node(component);
 	const char *str;
 	int ret, i;
=20
@@ -3268,7 +3256,7 @@ int snd_soc_get_dlc(const struct of_phandle_args *arg=
s, struct snd_soc_dai_link_
 	guard(mutex)(&client_mutex);
=20
 	for_each_component(pos) {
-		struct device_node *component_of_node =3D soc_component_to_node(pos);
+		struct device_node *component_of_node =3D snd_soc_component_to_node(pos)=
;
=20
 		if (component_of_node !=3D args->np || !pos->num_dai)
 			continue;
diff --git a/sound/soc/soc-internal.h b/sound/soc/soc-internal.h
index 31559918355f8..a08e6e8ef17f3 100644
--- a/sound/soc/soc-internal.h
+++ b/sound/soc/soc-internal.h
@@ -36,4 +36,10 @@ struct clk *snd_soc_dai_get_bclk(struct snd_soc_dai *dai=
);
 unsigned int snd_soc_dai_get_bclk_ratio(struct snd_soc_dai *dai);
 void snd_soc_dai_active_update(struct snd_soc_dai *dai, int stream, int ac=
tion);
=20
+/*
+ * In soc-component
+ */
+struct device_node *snd_soc_component_to_node(struct snd_soc_component *co=
mponent);
+
+
 #endif /* __SOC_INTERNAL_H */
--=20
2.53.0

