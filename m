Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010025.outbound.protection.outlook.com [52.101.228.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F522641C6
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 01:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784596673; cv=fail; b=fAPzxyQHD6fZZ6j7+C4ZCogQr/x+wZbbKP9n/njQ6++TGJ33wfhgpM8gdKQ1IG/NUXn5tAqdgiqYfnJ3XyI5SC/u0pNmOAkE6/M3vTUP8iZOBjDT0AC1CsqfqUPii+931L45SGyLS54bzJe+TTpWt25EaipeacF3OUTyRyW/rKI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784596673; c=relaxed/simple;
	bh=pZ44mozhaRFTN0rFOCYswNushfx5fk4BQOuUtlglNwI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=iXAJHEnpv/bHcUWjok5Y6kvx6JSm6edo/K1walWeMHZVzx1S76l+grFXURtcbH1BwDE5QR9lIbFC9k50ll+UDSNhiGYwHjxnCsjXozoHj5ZCa7wBMmXSyj4T0GQYRsygXelVZ4A1GEKU0N4LbwNlLlrLtes0Eb5F9sC+apRMFuo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=kQVjN+rt; arc=fail smtp.client-ip=52.101.228.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="kQVjN+rt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NOeEngatZ9Qv/kIm0Ycs1FJvhUhiAMT+gwaXOT3e9k40JBzZ+G0cUaBAOejT6oQU8lTSf/qPEmUHHedjpZ5yLoklir+C6wu80n8p8rSYmK8bvJ7CeHLlo+UotajBCANifykNY+x0diODwamwFwkfpbpya7vJw8UP7WBaT5+0O3q8Dxl5KUXGsv1xzfdhIxqL4CFGQF/BCtC4oz1yXdRDBQsKfAVU07VBDb4qLIn9v4Pn1cpD3IuopSwe1NIdX7GNVHoKfrPq//GVcA3Un/SttytDf25zptrZ9WtqLLfXzbiyCrhgx1+N5Yr7N+FNd/drhgI+mXrWl8b52hcHwaKCYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BoZVNSagdtnqmVLjZEgk+sWoAGbjgR4tRtR098BpxZI=;
 b=OJabeaJ2vOGNdRu3uXitzhOb4LJGwcWdwCky+hkWxp4dKr12ZIq3M1vwlmzTnT6slgb+e9G7Zkpf5bpcMuzRz9DzXWmnysJp+pAyGEFCinZx6Kk/j4OmiCMcZCwOBIKvd3ih37N56aCr/O8PT1jcqOKT6uqyrFho8rBeXv608kUWRvCwKIKCcs7ZLnXnjQpcxoOk/rEbwi7lcEPrZki5AgnnEb+oK+EdSaWLLiTBp7z4hQ1snj3fef1dPqSB0dZ8hCP0BqHMCC8OWZB8RqE74W0dpkVnaftwbCmHMyFMwrZX5Yy1kjJzays1io5btyL3Rj6aotqyq+GKYIxHI2Pezw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BoZVNSagdtnqmVLjZEgk+sWoAGbjgR4tRtR098BpxZI=;
 b=kQVjN+rt5bqGkFELe9ADPFd809hHS+ys6fmJ0u3GzCnRDJVPhk0aI/HYusjPyHSPCwQxEFdVzuOL1KbwPT4g6SU9lsahOPtrixv+CYCx2hWzG8V3siRDWpY0CEi+Fwttx5C6fHnH8lR6eXOy9gG2NHGVZDwXGM3lAriqCVXurvk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYYPR01MB14135.jpnprd01.prod.outlook.com (2603:1096:405:211::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 01:17:47 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 01:17:47 +0000
Message-ID: <87h5ltjg3p.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 07/12] ASoC: intel: avs: probes: use snd_soc_register_component()
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
In-Reply-To: <87qzkxjg53.wl-kuninori.morimoto.gx@renesas.com>
References: <87qzkxjg53.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 21 Jul 2026 01:17:47 +0000
X-ClientProxiedBy: TYCP286CA0028.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::15) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYYPR01MB14135:EE_
X-MS-Office365-Filtering-Correlation-Id: 2339479c-fcd9-45f8-5a6a-08dee6c5dfeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|23010399003|1800799024|921020|38350700014|22082099003|18002099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	mpD1jz4kvoA6Hz3Sf+Tjjl8Siiax/DgQf3UA3yqBS2VS1hp67Axwj9Wu4jQpOIwm5X71tSOREjO40V9llslP/GItUYeRq0uTgZJ3S1mOMycwqcA61+DvQfL7SosS+8lvfVf4NrmvKLaPWr4rISV5hNMsdYZLJzDgbS0SnJTH1/8rKHpN8T1IWiu1FdhBBC+fjcLseYLAmEUpYPIFgvgI1/QBiYm6LAFstBSqTlsf/ReRzdNZ1N6T+gS+sdTNP+JLUtb/pIYwHxzKb4+o7MJzLElYObukhBzhb45ufV5BnCAKlf2sLvUMhWjx/2+ZH8C9Nz2QvCPZXjxUJAWCRJg7Y4MywTsTGhNBlj8w6Vmvv+q+NMuO2NiSKzXpZYCPy1SbveTr6WCu8ieTzmkjqV7ImaNTs9/QtgA3xIWQaebmXbITxIN000a7JGXJjvLMPwnSw+rZL5ZCZiOfeOt0aldvl7lxH7/X5JFu7uIO7aYEh44p4LETui07CVr2PLxb5+vXRE+qF2EGbSV1EAvH1zkHbc+HZD+skW7oaye2ItBhH2Y5YkwZGcspnHVFo4vzexfs7Av77UkkJ4m3OgEEIJqKQ/8fbE8rXOQCIh1jH2KxRnvsuqJmg8QVo4+jMtFErhoDVvpIt5nzuRR9YMNmq4JldMnR1nMJGmjaCuG6gsBTMkadEfwjhhUrk4/33l46Uh9APDI88pKXAFFXRhsSfnuwTYfJLsUy+4Hy6hR17J/w7c0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(23010399003)(1800799024)(921020)(38350700014)(22082099003)(18002099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lOlhEcoEJqhOG42cqmcFsGrMqAu1iE5a/WryqyGVHaFONd0rABNOzOK97oUR?=
 =?us-ascii?Q?cpDu+EJcV8yLUF0FEBRqbn9A26DtBmfV0gHeji/md3dKNEQ99hYvHzvawn25?=
 =?us-ascii?Q?0E8z3V2U45aLpyT9Ir+COq01J8ypr8u42LmXgzMc+CiveJpwfPRcIuwbiLrW?=
 =?us-ascii?Q?ozFe6GnA50dPdUdz91Os1fbJTK+BLyGIk9O2V4eSataVxrU4im4zJkxeRT5y?=
 =?us-ascii?Q?xwm8lvA0nTnrMFbEq0eyTUFQNmyuA60O8RJOXnZ/uhJC1/qihjNugcbtDGlM?=
 =?us-ascii?Q?C6R5ROGqzvNQ5Bq8Zu6JZr2ZBmkwkSA9v7qmIfiWucIEjHlFWc3Gbp6m3MkB?=
 =?us-ascii?Q?vodrj8eztfZOgCPMUHZRO1nzejGp6ZYqnxvwMAFaDgXU2TdViDFj884vK5zD?=
 =?us-ascii?Q?p36xVjHniw9V84d2mWLWALS5mZXyDtpaczLN8X7LjVxSRR/2WPQ2JiRENE2g?=
 =?us-ascii?Q?ot1H/MO5FPf2fu71sSzGSlq9dHR7mtfmM806iZKtuKxHBXWVDxSMzETo/0OZ?=
 =?us-ascii?Q?bjuvnB51Jb9CMNGpRMMoQPZon/N5FW8wczxuAl6CJgD5vMOuBWFIH2sN8JZM?=
 =?us-ascii?Q?rWpzM+cgtv7W1N/wsw6mqNkGr7cvMLq95ntXKc4uwQ0iG8FR2qilx1AVABz0?=
 =?us-ascii?Q?xWnwcjAtpipg7jO9I/NxBI4ylE21Zt7BF83uhe34dcMef4qPahp1ASwYyEBf?=
 =?us-ascii?Q?l9AQ3h/5iExhlieRE/Nl6GT1zgn0kll6bWgIJiX8f+TdJcRU19p99KxAQV6g?=
 =?us-ascii?Q?jZHsRnM7IHngAuoh8vjJSu0CqWb4ZmsUZk5eC3SLyUdbrJU7UNnIuwpKok2J?=
 =?us-ascii?Q?R93p8Q8k6hAt4WneRyAN9hQHMz+/eri0V5W1jt7DR7p85M8s0V+R70uEgLsl?=
 =?us-ascii?Q?8YG+zRbs57SGscnYJGa2oaQ/feLfjUpRXQpT4AfFUjRx7i8vNBXCoQptiV/3?=
 =?us-ascii?Q?35BxkZXnOvdrMrA0hYulJMjfnVQHXfX+2F4m3svkHBvDvv+NDtgBNUq6K0pi?=
 =?us-ascii?Q?HQSKsYADgOSwo/MM4dWjzSAhxev8PgOhjOD5eMSHovRxk2Hs9wdvEnZl04Nm?=
 =?us-ascii?Q?qhWfjZW5zMX6IEBYXIcyzn4LegcVftZq0eXi7Uoh/2hKNdOn8mbnJ/bMFCdz?=
 =?us-ascii?Q?wfvT7s2on3womjEEZ9qvjXeeUgaWYWoce6b2ZbbdZpBe/BF2FRN4oFCYsBe0?=
 =?us-ascii?Q?FZySLyS5dOFdXW4IvVACixae8b6C0KqpyCGIMlrH74APpb7W4kGZe/jqdx45?=
 =?us-ascii?Q?+E2pOUNLITNHJyE4NO/GNGOPbCCC7Q+Ne5trczmLQVyiX+C6LqObFRZ8AcW6?=
 =?us-ascii?Q?T0/vgo83k4BuDMGeVT4D48i8nJdFXYhG/w/X1rijqxSVHfkEOHliz99fgcCG?=
 =?us-ascii?Q?lvvM32mlXq2imxGYJVbtzn3QAk2v3fiQqkugl11taIvQNtRbyLnKiVt0LjGZ?=
 =?us-ascii?Q?yv2q82uOXCUrcXl1dxiBr7IjBeRAOfOg4RM+YuCHapYlRC7TnQwFV5o5eF1j?=
 =?us-ascii?Q?OF/Jbq/Skmcsv5KPItKodZQZ2DN08p0Wroq4RPDBBuu0ACEk2nthPlw/ScmV?=
 =?us-ascii?Q?IZiXe7J2SSudDK9t0hDZmmrLCA55BZ/fV9B4PaX+Qc8ieb2w2e0Dity75y4u?=
 =?us-ascii?Q?/BSJBIE/HnRJDJ0p/MsiBWu93HC/qR0z9Ij+DhD1dNQwFiqEfZsHwis09nik?=
 =?us-ascii?Q?VrYxZ6d3arhOiKJxMAZw2vjTOdi87rfF9MkEk6sfmcBw1FjHm7/tPsmwJVNz?=
 =?us-ascii?Q?9Ai+k/mRYgrvLkMIXluqvn97ks37Yio83823sSq8207vuzK5Ji34?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2339479c-fcd9-45f8-5a6a-08dee6c5dfeb
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 01:17:47.4840
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nj7eP+helEjhWeOqEZP/urcnGWw+ZtNarMC9Db+6JwH8ZUfr8yDvuuSBHet4Y/kDnesIIbdSPHzXAWvpL5Jhhm2ovMaGdRCVNJs0YLZRU3JjaLS3ToREaJTYA1eQUaDQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB14135

It is calling snd_soc_component_initialize() / snd_soc_add_component().
We can now use snd_soc_register_component() instead.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/probes.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/intel/avs/probes.c b/sound/soc/intel/avs/probes.c
index 099119ad28b3c..e957ef46198a6 100644
--- a/sound/soc/intel/avs/probes.c
+++ b/sound/soc/intel/avs/probes.c
@@ -296,19 +296,19 @@ static const struct snd_soc_component_driver avs_probe_component_driver = {
 int avs_register_probe_component(struct avs_dev *adev, const char *name)
 {
 	struct snd_soc_component *component;
-	int ret;
+	const char *comp_name;
 
-	component = devm_kzalloc(adev->dev, sizeof(*component), GFP_KERNEL);
+	component = snd_soc_component_alloc(adev->dev);
 	if (!component)
 		return -ENOMEM;
 
-	component->name = devm_kstrdup(adev->dev, name, GFP_KERNEL);
-	if (!component->name)
+	comp_name = devm_kstrdup(adev->dev, name, GFP_KERNEL);
+	if (!comp_name)
 		return -ENOMEM;
 
-	ret = snd_soc_component_initialize(component, &avs_probe_component_driver, adev->dev);
-	if (ret)
-		return ret;
+	snd_soc_component_set_name(component, comp_name);
 
-	return snd_soc_add_component(component, probe_cpu_dais, ARRAY_SIZE(probe_cpu_dais));
+	return snd_soc_register_component(component,
+					  &avs_probe_component_driver,
+					  probe_cpu_dais, ARRAY_SIZE(probe_cpu_dais));
 }
-- 
2.53.0

