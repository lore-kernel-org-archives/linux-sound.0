Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010021.outbound.protection.outlook.com [52.101.229.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8690D309EF8
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415842; cv=fail; b=BBJ7g0QxX8a3SI1lZMUplWsFxDHTMKz5esO/wYHjrVbzEWOydvXY4MXn6kXA99UhXXCdIlG5K8BXLAsiRVwRRFOMsYlAY+4Zgz1moJmjLqT+C+pobcz0x6IBfKYHvOZRD+mmH9D1dYqxNtOrG/Fbky01kFMIC5q1Z1DJZTzr/Ao=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415842; c=relaxed/simple;
	bh=OS3oVCmAK8Pfhcrzfa3Pq7FxVmyYnGRRiXjqNXGCgpw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=qC+r4VFAH6d1Emd59MbW6CoOgIrfIkUwQjbrCSaEywR9Mlfxd/B3jouvN6CR/bdIAKbtloOAU9KVRQKeKVWbwlt2bNyVKkS41aDWYweAd8pwi1X5qvNUd+Jp4sNUjet38CGzIxwun4cwxrfxmrmd01Q2xJ/GcsOuUQ7Tz9oBBGk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=P0GkWW9J; arc=fail smtp.client-ip=52.101.229.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="P0GkWW9J"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F0m+pU+5PKnD2UEJJ3tzjxMO2bOEngcd6olJgWGZlj2wPb6gyA/WMFcP7qpN8VTb3v+aDAkZqkuPFWWkDpxWfIODy2XlI19gisqGK9GRs0nmYEmp7bmOB07xf7Q3pb3rFsaWqKVlX83MnYPLqjE5NDTi8OWzgCcBusGZ73lasDYbB4H+ehKxxQM7mjsxWQlqgnVbIdqTqsAHLd1LX7a3Vcwb+E4bHpI3aPK1Z0I+gI3Uik1FsypBWYbxyczmr5U3cZFhnf8NLCivF0pApKi7ymKEJFCYZLMmbcHaJ1TRYAg4IgNPlK+5HVOYGA7o3h2J6AORNf0yqZ5fh3AlJWPhPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bKMD9Z0qtCNOUkt5wbFGIj67sZJ7wODnYnpR77HBzCM=;
 b=GG4Q9UFv84HjQh++CWUKVRex0kULpUQEJuLoXTxKQnao6jL1SNQcWvbKMyEJJBBiZ1zvz+2yh/WNm9RwHPpRaB+ek6XnT5qFn6EXexuzByLc72CudBwxZmx81v7HiXoqaIxuO1QvvoOu+tT7viQ1w542EU3zA5lnqkrLbKoTwGEUn0QL74Xu6Nu1re0/vDbfxUbRClN1qe54TvKJrKKfZcuGWyhNQRaYY//pT105UVYsFlRkqo62hdbbQFbXpLoU/IwKYGADkKS4UlXR4SAR3cTovAdmZV7LMD3YFhar43QkZsGfUReRPup9ZfHI2Uff2+X/BEuM9tfiEhkYd9Qayg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bKMD9Z0qtCNOUkt5wbFGIj67sZJ7wODnYnpR77HBzCM=;
 b=P0GkWW9JA0h3t/UaHMM1aTNVnLp9Jtn482kCSpdg0iDOF3+wBxoQfhAq/vmCrODkY/hzTIhOB1GUMzxDFk7DyAVlW/7RPvW0Itg4oOikn0+2WKeLnLYvJ29nIFH9AM13buWUMRsK+SQWmMnI1+thq+T/ZMs2LEpxv1QpaXSV0Wg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB8810.jpnprd01.prod.outlook.com
 (2603:1096:604:17f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:23:57 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:23:57 +0000
Message-ID: <871pn6qffm.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 071/139] ASoC: codecs: rt5670: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:23:57 +0000
X-ClientProxiedBy: TYCP286CA0266.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB8810:EE_
X-MS-Office365-Filtering-Correlation-Id: 8073bbb7-c399-4f8c-b4ad-08de0ad97e1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4VOnDjYDMCNKvXEWf1o+hMKK/McFUb/KZF7J2D2lj2YxaVKubaNyXrCF7gv+?=
 =?us-ascii?Q?w0XRc9tgy4g/0MCIg1ledfL1rRaWqD9h4bMnEH9XgqJfDpcTyyTsHL3++Olu?=
 =?us-ascii?Q?i/qxTa6NQMVxl9NQOEVLcOlWzDimhSFTrB3OgwJy+T4bIaQeHN+k8svLKkpi?=
 =?us-ascii?Q?irELIrqBd6jCu6+eE69TtdAEMkEMqHVR+iZaExH8FWdPWBkTBc815OdD9Ogv?=
 =?us-ascii?Q?riLfPUB2YnZLgR+F7FbB/Zt+Cf6aap61Y1g3E+8juK+jq3yEj4dmCNK+ITXL?=
 =?us-ascii?Q?/Ue0IeNO2ESbuGkZqnrdVpXnOAuYo6VCardKzvAKoRZGMhUi+lUsFJUKjbeU?=
 =?us-ascii?Q?NL3IHBZwb8EFDJQ7nlFBWg3RPxroWDrgm7CABO5++sYOJz3CKNpUEhlAuOFO?=
 =?us-ascii?Q?gDb0ZGyzS5waFWAfUWBI3vK55N07Z+bl3jYzFr6ssJN56t2ycFnY/4iSd9IU?=
 =?us-ascii?Q?N3otxfxyLAv2bzHGENVia6LelqMvYgmzskDUhNRS5s0LApKwG9azhh4hmQWk?=
 =?us-ascii?Q?BPREO2vUpckSI1SMiBSfzBlJN6Iyly21jJPE/q3PHE4W+ONQxcQJowmZHsHT?=
 =?us-ascii?Q?P4VrBH1+D4RZrJg+FOJ491CfvmaK7y4QfscX/ALFphQ9CxCK8lc0QIsTkYI9?=
 =?us-ascii?Q?EKk3AMRXg7HwP6V77JYDFrg/71I6EEsZv4ecyxIybCPlIrOxXEVCvG9X3NzI?=
 =?us-ascii?Q?6VZ75LlRZcQEteZfcjIPPl8XEzszPyHrI27USVl0DcPtUZIQNUrUs/6iKwOP?=
 =?us-ascii?Q?fbCtKjLSPDYwRO7TTTu4E3VBwPu2b6QGTnoU4LSDi8sQ8GfACxYqzsQHUKVK?=
 =?us-ascii?Q?JVR18R+mg9Zt3L1zVoivrTpgpTyzDXchk0uV8EtVNicE7FRsQQPdDaZ/aV7s?=
 =?us-ascii?Q?1UQWpzY3Ih0zrwH+MmWjp1PgPQWi4FVCCkD84cjwKYBvKwyhQm7K0iEZxaxk?=
 =?us-ascii?Q?8uZtTUQOTxwVFh19exjdV6W/rtwpjZqOaLK6RMBPg3fUSEHjvb8Ph8mV6fM/?=
 =?us-ascii?Q?A6MqqF8XoeY+Ekh8Dz22AG8nxkbFy79BkhSieEEEE6bTWM/LogD0iW/eirXf?=
 =?us-ascii?Q?y0joKVHrRf1QAWERoj2geZTrhhije1GTiuVvbujDd/va48JelftyQAuPuvhS?=
 =?us-ascii?Q?3gu3dOnIv9mA0nldf7oPev+jXfhuO5zlE3wcT5M0BXhP2foz1Wy36kFoZ+uQ?=
 =?us-ascii?Q?49CiiXD03N4D4DHEP6OCHDNPnEh/6a2j91RuzhKd7OgIdD2I6GnlnHHnnqYA?=
 =?us-ascii?Q?BD8FidCc7K5yBgm0yjXXJ1tyiG3ni+qSDeNXG3KTaZuczizLdje0TLRNrLXF?=
 =?us-ascii?Q?RqncpiTgii8304L16mZb0pMZUUcnzKHYCFvsxfA5Q/cHnc67Wvk5DC+0a109?=
 =?us-ascii?Q?hNLdihgq1pnrg8oS2hYLiNCjAWG6cZlTT2NJpdHQO0QlCn0KuaSRi9pdGbTJ?=
 =?us-ascii?Q?Qb0WV4EofpuiosuJnhkFtHR5Wxl1PUiPAon1Q4bqSC/0UMB6eWkxzb/A6r3J?=
 =?us-ascii?Q?CMb5/xRgQLsB+xOSrmZyNBtNF/x2JdQi+GkA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FffjltyO/yJTdJoNW7Xocfq9C7gawe0tKLGt6XD0Fts4+bscECbB2UB/H/4x?=
 =?us-ascii?Q?iTtj3URbEeuqtpwGOb6PTkx+1JwBmaYC+maPFkh/EIlaWQWmmCRsBKN5687y?=
 =?us-ascii?Q?0Ac9E/kW4nFqOhVPjbfsXnMvvHDXHfkZKXDolajdS4fYtgBsMZSHAz0Fw8KU?=
 =?us-ascii?Q?zAJphmKvsfmz8WWn2y+ejq6jJ5qIMtpov0kXAflKB5R2JmS3HLBZH5CJzbdV?=
 =?us-ascii?Q?aT33dZV8onF01ycsYIvbs0FVfW2Q+okGU3Q7jr+DOVPu2x0WxqfwTH7W+/xY?=
 =?us-ascii?Q?txDXcI2IN2BDrKpoB8OjgJjVJ+ToDu/QrwLpwXMo/v8XvEjE0Fi2NFleee/W?=
 =?us-ascii?Q?5IPvsD0bKkQeRNVfdFd86IvYe+jXzhG1vwg9jzGRAR7MhaBxheGzzITzqp7j?=
 =?us-ascii?Q?YqH2dH3RFxKCdbARjVYu9T/8guKyC9Cap3T+cpKc4+khYHLL1/Rs4tsr4cna?=
 =?us-ascii?Q?tRFFczPvhS9VlWuXoz8qIKDcO/9DnXusiHhRW8wNBunXW/VQbz3fTt0YlatI?=
 =?us-ascii?Q?wBxZcmF9f+W02EGTVwf/324IJb1aZNuGxOsOJJxg7jBDVOYytScPb6eXnuok?=
 =?us-ascii?Q?iEMH8D78IgdVMZI8L1lux0LxGs18saJPUaaBq2YDw1fR9foya7MiH0qQSCQ4?=
 =?us-ascii?Q?A5++EKFKy1mcYqMrZYRMBQzoX+ahL08TxwJkNZc+tDJUpbHEggzZC0cwkmbf?=
 =?us-ascii?Q?X0eoIbZqURcZl4l/+XU+gyPC2vaLCrTitSmDsUEYymYYUlI/SYMzFjIG9ZfU?=
 =?us-ascii?Q?oeijn7LGN7yjTMf+MiNpk9vfqwRsNPIGFfYfScj8Sp4y/NsmR5LtXNeg5piF?=
 =?us-ascii?Q?0ECLa9VpWTPoRHXrvLeiiDmcwjq0EVMBTwX+NHe77y+ZAdGLvq9eGBLM1xLC?=
 =?us-ascii?Q?Kx7zEow1s1Vum/sgYRiXqTQMDlznuIoC7rBFIm8sDJcWULlFoas36/GW/nkD?=
 =?us-ascii?Q?7Ap1CjgP8E/OleT0I8AD+csfZrzB7zifAPl1iXaOj2Mrl3rnv3UzNS+ovSyg?=
 =?us-ascii?Q?YhUq9W5ZneOMvmz2PEu3w7cHY/YiYF3YcrswdbsNgb4Wvuz5mTxPsHt39bdF?=
 =?us-ascii?Q?1/oRJWUR+W9fghNiAxA8dWR3x3jLJiwaCpQlf5jJGZNjGwaK1DrR07Amtf4d?=
 =?us-ascii?Q?zyeR83iGoT8esjDHSQETnbY1zlu8ICqBtQBfFBZJ9YbrPfyEPRk75qt4lvju?=
 =?us-ascii?Q?6U5C12i0SEPbPYZHirF6X5XW9gHAcmDcaHV/GxPKa1IX5j4jgZo19bVZe/h1?=
 =?us-ascii?Q?eykWLXsVLDn4RmqktyGIeMvgWLDCtgbgIIWRuUbpL6ZUsemydhoJdyjKf3Xr?=
 =?us-ascii?Q?/ZE7oujdUUiZp4Ze8FH5SzVSg/7npwOdTLpX+wnDLrLeevtFSYtYT+jX5KU6?=
 =?us-ascii?Q?mXQLAGf1WBMC8VAj+gMdGIZTf6qthC8k+o5PFJjQ9CqKUePt/Ef8n8HfPn3x?=
 =?us-ascii?Q?FaNRRYysG/YeJtCvofpCNM9oWlU1yhanTpjMj1yR58Y8Kx2sPOlDSI7KAlKc?=
 =?us-ascii?Q?N6bH0Vd9npis5B3Q6JsgwbFAAwU6gv+4xfJrchfcC8NgwARkdXDGhJ1jyrVS?=
 =?us-ascii?Q?54QRLWcLR7dDGuh2dvaG3HZcx5znU4g6KYG+mry2zLW+s0UZUz5t9cyma6GU?=
 =?us-ascii?Q?WZgnIrIQce6c03JdixxipRE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8073bbb7-c399-4f8c-b4ad-08de0ad97e1f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:23:57.4743
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qEQKVaXaKfsUJ3izI8LmSF5e3gmcx3bvhQjIo474iYr/ocUo59WZXoaH6D0K04uDLYJQlyRfuee/3JpJ6ku2pd67pNszhjbuONbSSKUWR0EfapJ13iUWwNlfsMkIlXSu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8810

We have very similar name functions (A)(B). Both gets component from
snd_kcontrol, but (A) is used in callback functions which is registered
through snd_soc_add_component_controls(), (B) is used through
snd_soc_dapm_new_widgets().

	(A) snd_soc_kcontrol_component()
	(B) snd_soc_dapm_kcontrol_component()

(B) is using very picky way to get component but using it is necessary in
ASoC. But (A) is just wrapper function to snd_kcontrol_chip(), and directly
using it without wrapper is very common way on ALSA.
To reduce confusions of similar function, let's use common way on (A).

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/rt5670.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5670.c b/sound/soc/codecs/rt5670.c
index efd26082f19ab..43912f45992f1 100644
--- a/sound/soc/codecs/rt5670.c
+++ b/sound/soc/codecs/rt5670.c
@@ -652,7 +652,7 @@ static void rt5670_update_ad_da_mixer_dac1_m_bits(struct rt5670_priv *rt5670)
 static int rt5670_dac1_playback_switch_get(struct snd_kcontrol *kcontrol,
 					   struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct rt5670_priv *rt5670 = snd_soc_component_get_drvdata(component);
 
 	ucontrol->value.integer.value[0] = rt5670->dac1_playback_switch_l;
@@ -664,7 +664,7 @@ static int rt5670_dac1_playback_switch_get(struct snd_kcontrol *kcontrol,
 static int rt5670_dac1_playback_switch_put(struct snd_kcontrol *kcontrol,
 					   struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct rt5670_priv *rt5670 = snd_soc_component_get_drvdata(component);
 
 	if (rt5670->dac1_playback_switch_l == ucontrol->value.integer.value[0] &&
-- 
2.43.0

