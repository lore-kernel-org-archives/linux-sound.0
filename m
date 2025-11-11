Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011059.outbound.protection.outlook.com [40.107.74.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1275923ABBF
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821295; cv=fail; b=XT5tvdanzG8vMqVBHgUxOfduxKmLGx1uP0e4wfbTvflRcpHhdxqO9Tr7zqHXHWPakMIiFoQH9AEEcU8CUywriu95Oj+z0Yt8umZplXh1E6YdIgEVCcuXiIRDRg4Jgtnrx7wuY/bszVTKEgzxgrWEwJpIYB2peALqfBzxonpg3Wo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821295; c=relaxed/simple;
	bh=HgsAMCV9aQat3sQl7pBBSQMTAuPrWAZIeurv2YPOBro=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=qebJe/qsHMfb+uECNSc2KkX0SXQnnyFva542Pu4qNy4pr3MVtEjTC/FEWLJR6XYTpMND9qgYc9f8gOyirQkXMjgzjpkOOgxxIgVW8ecZxTaF0wMeXBXXcOt/ZoZlfzBkxITFsSB/LQDcuT68U5F33OWm13JYj2eOFcqwNzEHfuA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=pNxrHYdv; arc=fail smtp.client-ip=40.107.74.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="pNxrHYdv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tegW29u3oOVm09pRah9eeqXq6Diyy9UtbdoHxvCeI1eEKCVLy51MNmCyvp+AnPw3wEUVVg1PMuU1zM+v2KYJaXPHBNOerLBuMN2yv+OM9XYSUU0bvltoQW3e+vK2lPmv52chJE4sXpebuvnb3h1DsAEaWLoSFEqwhj4bdmLqCeawL7MDxAEgE8c0SC9glmvr5prhqPEnP6seKSL67YWx+O7TZrdHcoDxsdhilp9gjacPKZnHeTY2Pu0v3kR0tPR4SYSvC5ucThO0Zfnq19mNWXbQbLAQJ+uhdvnvp4NYcT/YI+eb5sGiIDtiz15ootKSwD+rI6LilJlKKiVWeqa/zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c7BvSk3rlJ4ni2A3VWubKo5GdZYlBFHzdl+7DDVmSpY=;
 b=Z8h/skfqOgS+UpfBiiYEfJ9sXIxogHYXsjMEMBcAYJcwwnabM7ulY8APG5EDWNUDXBkoN6zTD18iEGu8v8sS/wgrS7O2IpqTBtHWL3hVKVBEhosyVszCnd+qWbJiO7bltCxHeoMIUK8wQ3gGzDWCH0nuKvBEzPQ+RrfgCFwHPXvhazkdpEKhKeSo4aCvNPVeCjxbsGP3h7cjTAZpNBv9D7f4R5kfz10klNOMeLL1BneVrdbXOkotaulx3XOHeTtYhtPw6rnELqQRcKvB3hWVVkoXajmrIHld9WQKWmxgL1WRqPlpYDlnYhEYmaFpOEfY/x3g6vnltKB9TZu3RO5dNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c7BvSk3rlJ4ni2A3VWubKo5GdZYlBFHzdl+7DDVmSpY=;
 b=pNxrHYdvkjaLAlr8C+8A5Ji0vLthDUCLFA1t6JWGYYBiQyEe5Gq69PvFl0XZ4Eh455KwOgpltqxFbU+ADF+WEPjWiyVuxH19aRYNIpWPwwSQYwNvK3vFfPn8cwfmngt6A00LVbf3Mn04XVwWZfmh2VwGrshkESH6LBScVu3wNv8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB14482.jpnprd01.prod.outlook.com
 (2603:1096:405:238::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:34:51 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:34:51 +0000
Message-ID: <87a50tv238.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 251/292] ASoC: samsung: midas_wm1811: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:34:51 +0000
X-ClientProxiedBy: TYCP286CA0057.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB14482:EE_
X-MS-Office365-Filtering-Correlation-Id: 3047f4e5-187f-4ea9-eae2-08de20ba2087
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?g//N0bjB5g9Wf6coNIi/YXZPCA3lhFwDzwHOUdO0M1JfKhLBZAXNrObhgZrb?=
 =?us-ascii?Q?68cTTRe4aXaR9C9m9Jg/pFNsOeIK2V81gUUUD9pWpATmluD61Ona8Yho78VJ?=
 =?us-ascii?Q?UMYkzf9C0HkpeiQBxR4x+FRhDKCJIEEc6wL6MTpZBwqKms30I4bSUy5Gvqpa?=
 =?us-ascii?Q?j/bOX0+CAuM+RD2rpA8GhKpsqs9ychX2WYjaLmTDnwWOJTvAlB5eeMKBOgjn?=
 =?us-ascii?Q?qnVpk9WcJAZTioIFzBKr3w0NEyhzIiabZgrRKyu5pYD0Vaoenl3HcM3OPCWt?=
 =?us-ascii?Q?qhP4V5O2SK3eylXxvbClKsxSaV1ZVozF8RogmCW7CcWPqAT1G2uVNI+wLWWL?=
 =?us-ascii?Q?a5j//vE0pbVv5wX013OhQFCt08QC95d4zi2q/HQHac5i/aYP6Yn0GQ2mbBQr?=
 =?us-ascii?Q?zwVJdKiKDfcuWm6h8Le5fhlPCiL2UVMM1fVjBcSJv2EVxml+umxKrTKlZrX2?=
 =?us-ascii?Q?Vz95SpVrd0W3xm/Efx6EjAhtgD0w5tXFTcQWpTE27ZxI8TAAGw7B4a4Jj3NZ?=
 =?us-ascii?Q?rv0tD1Ttqxu3fjKy0Kf+eJwI+GwMzl/YE6x5tfGKzMQmN6b8uXH72lJp8HVU?=
 =?us-ascii?Q?3FDWdae0nk0k7ObQsm/AarOqzz/A/sa2nDvprZeQWaJJquM5A42yT1YHFeez?=
 =?us-ascii?Q?xoPShOaxFvJz7IaY9ofNP7ZyrOgq9SfneursI+lmZbdsxyhT5/bI8wSqzVMB?=
 =?us-ascii?Q?8JzRcnvkOv56425LLZCqL2hKEwcGjdz/9DvYoIFkzBaUEvbdrk/jUzJmHkY5?=
 =?us-ascii?Q?39P1Zy6SvsWfJNF5ZVRoIp5LLdv3PWXw4FPDrR2KyDjtHaXxZE2JpX81nWhg?=
 =?us-ascii?Q?w3gv6T+V2w1qNOJlcybMi3ogxL2oiTkcBmW/XuO+k0B0nx+/HZvQozYQnGnd?=
 =?us-ascii?Q?0vaaJ8HPyvg7xFe/7zEo42yN2zMnkbysN+3nh3U6PrbZbUl4zcyxCNBD06I1?=
 =?us-ascii?Q?TK+y5gaPxTpyAccyCMlSZdTwKrZg7MwNKiD7CF3GQjdsUDfu1mOA7UjE1ECI?=
 =?us-ascii?Q?+l65pYL/+gXzol2JUACwfrHYmkJniSlL0wnkVUwUNvqgkeqtuhMZDcrhHC0t?=
 =?us-ascii?Q?w+DJzVfMqaNu133fBNYii2EXtvzmDZD8hBJI5vHJTV1WFJhwzgXesO+W7lja?=
 =?us-ascii?Q?m3dSNxM8Sf1WpvZlQ4w6ckU1eFMqZqRkd6GnlTOuEc3jO1dIyANhTTNQoiE1?=
 =?us-ascii?Q?j3HJ0/JPZH9Wz1euPAWXRGoyZ9A8Z58dimWOpZIsEllM5xjsBRvkoC5lJ9Iw?=
 =?us-ascii?Q?jGUkpCjyiCBuwbBpxrAcRvA18KR4XuTp8BZSR8mLg7rZzXrqDCzD9xcKZulL?=
 =?us-ascii?Q?WNfZkZqYxGPaz4TXVuQtsldSf/tRRljFylcNu7uKnjsvYNhBVWnltsUoWJwx?=
 =?us-ascii?Q?fjzzoSRTIx0ogvUDUH9EskYR6mohninjfBzsl/Gi1Ls8RAHzkmG4p1pJ22jC?=
 =?us-ascii?Q?jXWLstXGW/2E/VETiDlKtG19/izJVDWgJytobsLXy4NtucxrU1ds9NQrkA3K?=
 =?us-ascii?Q?TZqCvir8jlt7wef/fjj/FJKpmWFWyin0ju8U?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hjpuPGRuWpzMKJrl6rcGUDQ24werDmWotB5GncTImRxaG0+9B5ZTOrbqjvhQ?=
 =?us-ascii?Q?d6oTQWq4e/RwSolIptvU1oNv9igB1bVPoMOYuAoEh1p0x5nABVUc5ETW0BLY?=
 =?us-ascii?Q?qAJ2L8/RIx27OJdekUDh0prLa3M64v4Ue7IS2DFAPEmsoovuUnHhHciwvHDj?=
 =?us-ascii?Q?g0h+eGQdopAcUmvEbYEEmZ3+ypdHN24V5pGBmlFmN37ivLQty3/cvZpkxO2O?=
 =?us-ascii?Q?KzYuz3NMk6aT/e/XYOtfN+KcTr8oeaUSIx7k81JnQfvbpOhZEcd/qzXfFYNM?=
 =?us-ascii?Q?GwcBlLpsYTyff3ofPpwlzinzqg78RlOsU2rwn8UpHUC9b4RI8GTMrxUhAhff?=
 =?us-ascii?Q?pvRMwdYGERNcuhlXYVosy3cy9XyHGG4PSt70IsSjYNed1/XsOvWqcPK4+tvj?=
 =?us-ascii?Q?23+TTF/bBxmN1osZhLD3r532u1s8xNrvwxnlziheiWdQxyKX69SEv+WoXMHC?=
 =?us-ascii?Q?SBKCRSkCzvHRNRXbRXnQ6EjNlmLA/8tLeSR34Vw40SQgz54vurzIhRjBcaZd?=
 =?us-ascii?Q?Fn6EYGUJWPZ+k8gsn+RvZmio0scmR+4tZrPpc9IW0ups7m2BOqWujJfX1TTO?=
 =?us-ascii?Q?D+ib5GYSVvFz2zHQyDUgbiRj19vgGfyMmFnzsCL0kyNdkSz6+tyIjU2qWZEx?=
 =?us-ascii?Q?tyA/1KsvPCQYhPBQZuPMPa60JsSvQnsun+ZmCJrJjlpDGvyhBtISVSvAB2UI?=
 =?us-ascii?Q?TBAnM9ReCobZTszHubpsDe1sJynSDb2UX56aZ0n8slc7H1DPNbJPMGTnVlqN?=
 =?us-ascii?Q?/9sfL/i7u+nw5yzDDXdFhwihlCA0e4z+PK5bTR/gKuqhTAaY+lqO044Dmd/w?=
 =?us-ascii?Q?2c81Z+vq/mWp8rsaerGryoL3zXeb2Z7o3dk5X8hM4JHl26VNEgiH1B0872do?=
 =?us-ascii?Q?7Z2T67f1hs/K39p6+0e596jg4JFFhEUSUH/TgLeWb00ArxRrzKP8sjh1Q7Lq?=
 =?us-ascii?Q?HVayMgpgzMK7j0oXv887J8CtPB7Y6JZnHxyL5JjGJOPZb98A3vRd6cayiV2h?=
 =?us-ascii?Q?N0/FTEVWedz9+9RLsB6rVx2FIrX1/GSXIqn1w7nMZB2qMRF/zsBvIY/SfvT3?=
 =?us-ascii?Q?1xSSnZA2GeiqCMT4kRY34tAmwY6tUsLoaMqoFcoKdGEFWveVdZUp3eb5m1oL?=
 =?us-ascii?Q?X7ni6JhqL6ur8fomT8qfnUfAa6pNrmcHVvzvEn5HnGJNnHOp8IokAD5iSGTR?=
 =?us-ascii?Q?CRwFp9AN4HEORSUf8TC+wN8hoexn5PFMT3/bLClNZi6EUcSeNMxC+J3O5y6h?=
 =?us-ascii?Q?6Cp4SyX5Op1FAoCfktoXDYHYriZy+Ek0ImYcuuW3UChG8LDjqL+a3Z8XmB/0?=
 =?us-ascii?Q?XacaPX+VhX8SdC81O+ovjy5UhxUtghN+X0+hljkEzcVQksHgCcT9Jtth3srs?=
 =?us-ascii?Q?x3XaMTSL+bmAjRaHff3a29w+JilP/Ce6rbPFsAZQeRZqjgnQVpR+wmOhcsMk?=
 =?us-ascii?Q?37nApumkAdHAy8s7PTRf2e8Jye7fa5S/0c4/+SRC0++0cGkfjXjIb/X7+TWv?=
 =?us-ascii?Q?Pi0H5QiVV630BJ4Gw+S1ymIPMjoe0JFX52LYJzLnJu783KU6K6DIFaO51q1g?=
 =?us-ascii?Q?vg51j4q1MqVVTZ/Wjk2rF76DcEomNY7yDyNiv6eNT2nAZc5qUtCq/I7yknMw?=
 =?us-ascii?Q?sRZIkoqAvP+H3zaNtN7tLkA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3047f4e5-187f-4ea9-eae2-08de20ba2087
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:34:51.5985
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WZpb9WNtGwjj22hC/9L2wPkDyNSeyENrlQ4fMkgZg1ArM0JGFbioIeO/e/okrIwdKjynhSSv07ry04WPvIy3msh3lHZjHGBsNoG7ephZq586LqLvsbLwC9aPotq4BnXg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14482

This patch converts below functions.

dapm->dev					-> snd_soc_dapm_to_dev()
dapm->card					-> snd_soc_dapm_to_card()
dapm->component					-> snd_soc_dapm_to_component()

dapm_kcontrol_get_value()			-> snd_soc_dapm_kcontrol_get_value()

snd_soc_component_enable_pin()			-> snd_soc_dapm_enable_pin()
snd_soc_component_enable_pin_unlocked()		-> snd_soc_dapm_enable_pin_unlocked()
snd_soc_component_disable_pin()			-> snd_soc_dapm_disable_pin()
snd_soc_component_disable_pin_unlocked()	-> snd_soc_dapm_disable_pin_unlocked()
snd_soc_component_nc_pin()			-> snd_soc_dapm_nc_pin()
snd_soc_component_nc_pin_unlocked()		-> snd_soc_dapm_nc_pin_unlocked()
snd_soc_component_get_pin_status()		-> snd_soc_dapm_get_pin_status()
snd_soc_component_force_enable_pin()		-> snd_soc_dapm_force_enable_pin()
snd_soc_component_force_enable_pin_unlocked()	-> snd_soc_dapm_force_enable_pin_unlocked()
snd_soc_component_force_bias_level()		-> snd_soc_dapm_force_bias_level()
snd_soc_component_get_bias_level()		-> snd_soc_dapm_get_bias_level()
snd_soc_component_init_bias_level()		-> snd_soc_dapm_init_bias_level()
snd_soc_component_get_dapm()			-> snd_soc_component_to_dapm()

snd_soc_dapm_kcontrol_component()		-> snd_soc_dapm_kcontrol_to_component()
snd_soc_dapm_kcontrol_widget()			-> snd_soc_dapm_kcontrol_to_widget()
snd_soc_dapm_kcontrol_dapm()			-> snd_soc_dapm_kcontrol_to_dapm()
snd_soc_dapm_np_pin()				-> snd_soc_dapm_disable_pin()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/samsung/midas_wm1811.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/samsung/midas_wm1811.c b/sound/soc/samsung/midas_wm1811.c
index 239e958b88d3f..bc34dbbb50c91 100644
--- a/sound/soc/samsung/midas_wm1811.c
+++ b/sound/soc/samsung/midas_wm1811.c
@@ -73,7 +73,7 @@ static struct snd_soc_jack_zone headset_key_zones[] = {
 static int headset_jack_check(void *data)
 {
 	struct snd_soc_component *codec = data;
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(codec);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(codec);
 	struct midas_priv *priv = snd_soc_card_get_drvdata(codec->card);
 	int adc, ret;
 	int jack_type = 0;
@@ -285,7 +285,7 @@ static int midas_ext_spkmode(struct snd_soc_dapm_widget *w,
 static int midas_fm_set(struct snd_soc_dapm_widget *w,
 			struct snd_kcontrol *kcontrol, int event)
 {
-	struct snd_soc_card *card = w->dapm->card;
+	struct snd_soc_card *card = snd_soc_dapm_to_card(w->dapm);
 	struct midas_priv *priv = snd_soc_card_get_drvdata(card);
 
 	if (!priv->gpio_fm_sel)
@@ -306,7 +306,7 @@ static int midas_fm_set(struct snd_soc_dapm_widget *w,
 static int midas_line_set(struct snd_soc_dapm_widget *w,
 			  struct snd_kcontrol *kcontrol, int event)
 {
-	struct snd_soc_card *card = w->dapm->card;
+	struct snd_soc_card *card = snd_soc_dapm_to_card(w->dapm);
 	struct midas_priv *priv = snd_soc_card_get_drvdata(card);
 
 	if (!priv->gpio_lineout_sel)
@@ -376,7 +376,7 @@ static int midas_set_bias_level(struct snd_soc_card *card,
 						  &card->dai_link[0]);
 	struct snd_soc_dai *aif1_dai = snd_soc_rtd_to_codec(rtd, 0);
 
-	if (dapm->dev != aif1_dai->dev)
+	if (snd_soc_dapm_to_dev(dapm) != aif1_dai->dev)
 		return 0;
 
 	switch (level) {
-- 
2.43.0

