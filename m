Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011013.outbound.protection.outlook.com [52.101.125.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CDD8C1E
	for <linux-sound@vger.kernel.org>; Wed,  9 Apr 2025 02:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744167445; cv=fail; b=BLJjZ0fmaggQdaF8WgdmSVsyAKeMd3pLu6diugWkVsD+I55BVtpMy/8eA936wN7SpQnovmU57IHhVxOAnUzdFC8nrMIFBx8t0H/akxxVLz7TSI3rzVIQ5ZNDZe8OzZ5fcjkGihCks7nG0lxDFRo9GRz0HG7NWOBXkHGNg77Gx7k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744167445; c=relaxed/simple;
	bh=E9LOc1O0ri/wYKPbteG5M0UyKd7z0DdDWP0K4wdUScI=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=qmvEWaMN4N5HkhFjHkWmYhTYo0u+XgqffatW2ElA8FRa8taLquKGfjkJ57SOCS+cRXU+Q5QzXjxVHRUdMcDP7Vn6XuruJNBYUJA1SNJwQjyUuZB9dym/pzqwrr/pSds5vdQg0DAGpJUNop0oo5WXRCjQPJSbKNcat3KxGZuXR7s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=HylouxfR; arc=fail smtp.client-ip=52.101.125.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="HylouxfR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w8PygKUWQtsh09HeG2jOs3xCZcnbyfCjYnmvBqwrSdPUzfqow6l0aW/FgqyoVgvnOzaRQrlVeIJ4s59e1zKbtfa6CsxbAydRzmXm+gVXPyzc6EtMAoRyZwIeR1GdXX+7wr+rlOZoZ47K5tBqN4OBJ1vMzuHg1qXFvi2OXfcbSYwwr16Z43b83nm2bx0GPoqbFnfdEDJ/8RSRyCP1mat6qvf1bnoi2E5m3ikOafOynKIFq7zTb7QvY5zQsl70BGSK7y6w+y5m8XAthVLdhlhCFRBvoAtrj9kKmvkK5HJDpSYCYjuRk4ard8PBnqi+0BuJf2OSLqcxilb5mY1gR8AdDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wiSWRlHdiKp183vIwG7/+3X5z2E3XEsyGmKmYr4wN8Q=;
 b=qBgwVLApFeVhoeaO1JoFg2fmvO3G2UE/O9HngqNznRa55/Xr6X72pxj9DMGMc4EM93uzO0coDukXJHt1CevPkAreSnyJCR7ZK5Y9ll/e6cJy/rHILK4iYjJXYrGb2XgPTkQz3Ykw36BFS/OGr+ylvcWuhwSHferYQSlaNHoSWUPbUYQ7bBJ1OO59TFqpQXau1Moe3jg9iqjNDAdZBFPAKaA3XnoGwgZP38cm6x2syTFqEnl43v8U5CUeJl2FdwH9FSCAhkkX1LEzlmR/NkzLugtlTXEbL13gFCwWGV/S6ogq9I1Ms93JGgnZJErLcXYg8lnVK1XbKw9PX51f5GEAtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wiSWRlHdiKp183vIwG7/+3X5z2E3XEsyGmKmYr4wN8Q=;
 b=HylouxfR9N0EsitQENUIJgA0I6lfhrRUo1a7VxeSZPY0vv/r2PwmD3htGRciPMikJp+m+lKwmkPYkRO+ZHMEgpKn0gWD1YZKoV4bRRUvB5jUVh5N3pb0pcdemQXMKbRFma7KISNvt/U0clm28PM66WBYBhP7jDf9O1czy7R9oLw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB11643.jpnprd01.prod.outlook.com
 (2603:1096:400:3dd::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.29; Wed, 9 Apr
 2025 02:57:18 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8606.033; Wed, 9 Apr 2025
 02:57:17 +0000
Message-ID: <87ldsa9h4i.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 3/7] ASoC: sma1307: use snd_soc_dapm_to_component()
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
Date: Wed, 9 Apr 2025 02:57:17 +0000
X-ClientProxiedBy: TYWPR01CA0026.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB11643:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a6b815d-d14b-4fbb-1c9b-08dd77123d4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|52116014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nE7By0LR078Lmki58G07j4Gmb109YwB3bOyoX4VHyoDz/ymc90ioH4SZyiB5?=
 =?us-ascii?Q?FT1R5UNfWHxFhsu0Kgl3Gs9YdYIkAyc7tNi04Go/xh2RJFe+HMsYHdwEFUr4?=
 =?us-ascii?Q?OALpKmT6wzP/vz4RjV/tRGlGngHBaaiZ5i+9hWCi0ocnHmI7xZYsG3WpGCU7?=
 =?us-ascii?Q?xooE+ePdOJdXCy+JRe/Xq3/Hq9fYcXEFg/gHWKlQ2QERBnQxW+bD19EF6B6p?=
 =?us-ascii?Q?8qWkxgU+bbZbKKMZ4yThuYYb61t/i8ad4o8JaOXDj1p+fxw/Lx1nIJJjYHNO?=
 =?us-ascii?Q?0AQXhu6WOUZkGQ/rm/Seu7IclOqat+dMurqw5uWJIuONrHHNlbHadY5zaAh/?=
 =?us-ascii?Q?y0P2SvtN6JfHrkRc1iZxggsQfHyFaTAByQLjduBtWvvm599Tk7/Fe3GpdM3r?=
 =?us-ascii?Q?S9eMAT1FQ/9v/6Jfl8EfyktkSyfccdQ6d2WbmA20MjojCkKhc8GfmeTDyXMP?=
 =?us-ascii?Q?bwdVVBj/H4uGmZeAP/CdHvWIGVQ4yfdOuYuV3622yNbKPNTNKDlVANwJ0j9Z?=
 =?us-ascii?Q?nR6cVQZ7l9QA49iXCsdt1/MNHf7krNXn+Yf3PimcOjvdGapuxOZoaCI03BSk?=
 =?us-ascii?Q?09lMbMSj+U1481mQwhRAxTmKhUllQqK1CldQgVOkmvcXno/fZcutjFR56Uou?=
 =?us-ascii?Q?nXGQuoCTuOWISkkia10CwZUO7q0GdFKJS5lcFcQ+pk4JkLFVLjMK86VZcYj/?=
 =?us-ascii?Q?Xhv5LL4UC8g8XDTjx2vdPocmEBbcFLB7YZcjiMyYusrEGDYDEeFd1NiKzICm?=
 =?us-ascii?Q?ifmzQUqX0r2IrJjJTyOhF4XVxZpRZuzLgDb3siP9yW/aLSFbLHHZPZnBvxAk?=
 =?us-ascii?Q?xZsZOWhUxiXTzsiAX0UALPmEuI9drSnxNslRZR7vxiYzwh+kbFKBCXyoN4EK?=
 =?us-ascii?Q?OtupI4FoKmT4ruMy4IBPde/FiTi0I1qcK6g7II4eFUiE99KCvZes1z4p6/5y?=
 =?us-ascii?Q?/Wd4HHkqYtsa9KXJFo8AI3lz5wa02QyeU1AS0gW3v31hk6YvtUpKUekGC/Ah?=
 =?us-ascii?Q?L1A2OdVJl8/KNTCZgY++XBjgSTSI4MtvmqEvlm2GHG1JRmGJTDxeCr9UoAYv?=
 =?us-ascii?Q?sWVe+kgxg47QDSVuwBrkfy4oDGPkm9reqG83y2R6KJLcYBmVHGxZwm1Vz6FC?=
 =?us-ascii?Q?hdODsGHNNAEDkL+ss5Td1W1BjWTCoyoPKwu1IEpE7gXX/pBsBJrHgMgeopAe?=
 =?us-ascii?Q?W8q8KofEj6yuNJm6YUbVKwjcsrJ7pXuW2SGoXit9bFHE3qeTeXRgjbiNxvj7?=
 =?us-ascii?Q?CMXQjSIsfqlvl6D31BXGhUUOhi+puRUCwqGLao5V8IuQre8s/VbnxFyTBhP4?=
 =?us-ascii?Q?A0vgHgHQU8PMGqSeBFzWFBcMqT1Nyn5rtCeqKbQ5njeybGN2vTy1IwvBWATQ?=
 =?us-ascii?Q?e4fj3vuJx7tQNZpuS+7Pp1fdQaJtyzL//QwBBJGIJomIeInLMSr6TAKROhDn?=
 =?us-ascii?Q?IRYNJP52JGdpBv/WO1mBq/FwIgwL0WDOi4Smae1ARNx4sQH4nhNBiNh+tV32?=
 =?us-ascii?Q?1OKSiAXCa3EUwfM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(52116014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zi94/+qmz1B7MPtrhWoxbC/CMFxgB+KkqUXS5kilVepYHlpErhsjg8isIRox?=
 =?us-ascii?Q?2GCxDCvfFIeeW1Cpql0eLj19pUCxvw6JmiEr4h0pbC6dquxIXtb4+EvqZP+E?=
 =?us-ascii?Q?w7uLw4FXlK5rH9wBFvv7ijs36xqtpgVhRXh9XIDnQCvBL7nPFBwYXvWOUMDW?=
 =?us-ascii?Q?/21XQQE9o6NQRthVcM3yWXCyweG7p6cbkMd00ag2av78v85INRZi2NQxvxZ+?=
 =?us-ascii?Q?UndK4jxoZj/6F50ro1xrzHuyWKGHAyXfBAtv+x/W8mln6k/DSiiCh9F3cZIM?=
 =?us-ascii?Q?+n3aJX3L9Fv8g7SgRw6kzkMrTc1ikOqLR3r0DePi0Lmp1a+d1+GbMPX51PBP?=
 =?us-ascii?Q?00fpAGXj/oRELN63W2k8LWeCJX24qCYIuD8g+yovNIwX3hPeIiS2bowGdGiO?=
 =?us-ascii?Q?gnoObbEMyo5tQCOfTmiShgT9/5BtmmP2TInwVN1bJSd17TiYdd19osnW0m+I?=
 =?us-ascii?Q?qKRPxFTfqioxYZF9/odTqnVp2FmbvItAYyDaLlLMA6loMWElvjMkInqpJHSw?=
 =?us-ascii?Q?xGs+nKxdqEw+iD8NsmwK+ppr4TpB9QSGK7dA5PKZeWE9w3hts70EQ+IOos7Z?=
 =?us-ascii?Q?JQujDvF6k/Gqndmj9B1JErBi1MmB+zvQ5OudNMhSqDcvBGlSm3e+pN2wcbB9?=
 =?us-ascii?Q?5UfYQS/AQ+YjIPlirB7okT66/20KubolOL74lgUbxAhZvokwvq+attBrvb8A?=
 =?us-ascii?Q?uxqaWf9Gw64DHPnLE5vsUJZnIwqlGJIbuhoSp21neoCFp1LDRElXioEFVdRv?=
 =?us-ascii?Q?6/IYLPi15FHQGRp66YZQ5WfLKBPldrQuGXhtm/WcCJsxQePI6Wiw4qWOnrK+?=
 =?us-ascii?Q?YxYoPKR0eWFsM2ve29KUDpw46QSwk+rnMWmziUH4U+QK5+rSwRMysi9W7jIT?=
 =?us-ascii?Q?EtlsOgJICKA44HqkvayR/MSSAf+NO4/g2aoe3+Te1XBHcysfK+RZLr32ujgI?=
 =?us-ascii?Q?ElEQXOvVj2i366neo/P0ecVRytswBu2RgAQAUD+1375R/Yv3DF8jsDYVtyJH?=
 =?us-ascii?Q?EmgV8NoAbQpkkGU824jOOrIAYE5kHPG6yHZFeC7lsRhQSoK/+X8LuzCxKbe+?=
 =?us-ascii?Q?p2TnssNrwvpcuGdePqOQKMH3ceQS+7HRQDpYdI227tgwx6dXMTAc1LrIy7LZ?=
 =?us-ascii?Q?BRRovyS8wMB8LBkUNFtUAVqVryBmf+tV2RQSm2ji2CmvbUoZU1L9HN3lwGaB?=
 =?us-ascii?Q?jpxEglsIBErUWdYtNAnt1pf86Hnlc9aAHjl9lPcOQ13wcTgJBpzHAnIlmCDP?=
 =?us-ascii?Q?INhtWPFgsuoL9YU+rxlOO+iCp9mRprbPmAw78nbrvjQ6um4m2fQzybOynX+E?=
 =?us-ascii?Q?thUQ4VMtl8xRUljNkw9nbia5R5HmYHp3N/mCOqHQVaOWo4ZDtXFjyg9x41XL?=
 =?us-ascii?Q?NTA9M+5QWIO+NXxyNx2KZSJGqza+5Y6Ebh1biiwI5Ptwg/RIIWCktvn5PrYn?=
 =?us-ascii?Q?/oDWWsOur0fJyfUmZMka1vMkKahp+4WJ8m7TS2dCRhOAvzXlAKGdWVdxKgmS?=
 =?us-ascii?Q?kmO+ppbkuGzaushBrlSK9upBxdMRmrgJPXW51spthb2r8Y2kmfYEILPHlkSw?=
 =?us-ascii?Q?LkqFbazInKg3t4jlBGcvGNr7LJ66h7BiFjnNjl/www6+THlhtHrh4an3L9bv?=
 =?us-ascii?Q?lRgYs6bUCIOdp/vYcN8gJ9o=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a6b815d-d14b-4fbb-1c9b-08dd77123d4e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 02:57:17.9180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CvlxUeNncWqKP0sPTv61cA8sUX3thiH/fr8n94PGcrK10K8Llm7Y29q4cPjQaLNw4IZJh25JwjZHaXDVVFgbOKxFj73Rjh0gu11tIn8/OMb6seTNs0yKftfKXeMj7CPq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11643

We can use snd_soc_dapm_to_component(). Let's use it

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/sma1307.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/sound/soc/codecs/sma1307.c b/sound/soc/codecs/sma1307.c
index 498189ab691c..043bdba47e4d 100644
--- a/sound/soc/codecs/sma1307.c
+++ b/sound/soc/codecs/sma1307.c
@@ -805,8 +805,8 @@ static int sma1307_dapm_aif_in_get(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_dapm_context *dapm =
 	    snd_soc_dapm_kcontrol_dapm(kcontrol);
-	struct sma1307_priv *sma1307 =
-	    snd_soc_component_get_drvdata(dapm->component);
+	struct snd_soc_component *component = snd_soc_dapm_to_component(dapm);
+	struct sma1307_priv *sma1307 = snd_soc_component_get_drvdata(component);
 
 	ucontrol->value.enumerated.item[0] = (unsigned int)sma1307->dapm_aif_in;
 	snd_soc_dapm_put_enum_double(kcontrol, ucontrol);
@@ -819,8 +819,8 @@ static int sma1307_dapm_aif_in_put(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_dapm_context *dapm =
 	    snd_soc_dapm_kcontrol_dapm(kcontrol);
-	struct sma1307_priv *sma1307 =
-	    snd_soc_component_get_drvdata(dapm->component);
+	struct snd_soc_component *component = snd_soc_dapm_to_component(dapm);
+	struct sma1307_priv *sma1307 = snd_soc_component_get_drvdata(component);
 	int val = (int)ucontrol->value.enumerated.item[0];
 	bool change;
 
@@ -845,8 +845,8 @@ static int sma1307_dapm_sdo_setting_get(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_dapm_context *dapm =
 	    snd_soc_dapm_kcontrol_dapm(kcontrol);
-	struct sma1307_priv *sma1307 =
-	    snd_soc_component_get_drvdata(dapm->component);
+	struct snd_soc_component *component = snd_soc_dapm_to_component(dapm);
+	struct sma1307_priv *sma1307 = snd_soc_component_get_drvdata(component);
 
 	ucontrol->value.enumerated.item[0] =
 	    (unsigned int)sma1307->dapm_sdo_setting;
@@ -860,8 +860,8 @@ static int sma1307_dapm_sdo_setting_put(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_dapm_context *dapm =
 	    snd_soc_dapm_kcontrol_dapm(kcontrol);
-	struct sma1307_priv *sma1307 =
-	    snd_soc_component_get_drvdata(dapm->component);
+	struct snd_soc_component *component = snd_soc_dapm_to_component(dapm);
+	struct sma1307_priv *sma1307 = snd_soc_component_get_drvdata(component);
 	int val = (int)ucontrol->value.enumerated.item[0];
 	bool change;
 
@@ -886,8 +886,8 @@ static int sma1307_dapm_aif_out_get(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_dapm_context *dapm =
 	    snd_soc_dapm_kcontrol_dapm(kcontrol);
-	struct sma1307_priv *sma1307 =
-	    snd_soc_component_get_drvdata(dapm->component);
+	struct snd_soc_component *component = snd_soc_dapm_to_component(dapm);
+	struct sma1307_priv *sma1307 = snd_soc_component_get_drvdata(component);
 	unsigned int val = 0;
 
 	if (!strcmp(kcontrol->id.name, SMA1307_AIF_OUT0_NAME)) {
@@ -910,8 +910,8 @@ static int sma1307_dapm_aif_out_put(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_dapm_context *dapm =
 	    snd_soc_dapm_kcontrol_dapm(kcontrol);
-	struct sma1307_priv *sma1307 =
-	    snd_soc_component_get_drvdata(dapm->component);
+	struct snd_soc_component *component = snd_soc_dapm_to_component(dapm);
+	struct sma1307_priv *sma1307 = snd_soc_component_get_drvdata(component);
 	int val = (int)ucontrol->value.enumerated.item[0];
 	bool change;
 
@@ -948,8 +948,8 @@ static int sma1307_dapm_sdo_enable_get(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_dapm_context *dapm =
 	    snd_soc_dapm_kcontrol_dapm(kcontrol);
-	struct sma1307_priv *sma1307 =
-	    snd_soc_component_get_drvdata(dapm->component);
+	struct snd_soc_component *component = snd_soc_dapm_to_component(dapm);
+	struct sma1307_priv *sma1307 = snd_soc_component_get_drvdata(component);
 
 	ucontrol->value.integer.value[0] = (long)sma1307->dapm_sdo_en;
 	snd_soc_dapm_put_volsw(kcontrol, ucontrol);
@@ -962,8 +962,8 @@ static int sma1307_dapm_sdo_enable_put(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_dapm_context *dapm =
 	    snd_soc_dapm_kcontrol_dapm(kcontrol);
-	struct sma1307_priv *sma1307 =
-	    snd_soc_component_get_drvdata(dapm->component);
+	struct snd_soc_component *component = snd_soc_dapm_to_component(dapm);
+	struct sma1307_priv *sma1307 = snd_soc_component_get_drvdata(component);
 	int val = (int)ucontrol->value.integer.value[0];
 	bool change;
 
-- 
2.43.0

