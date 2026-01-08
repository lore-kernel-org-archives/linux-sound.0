Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010067.outbound.protection.outlook.com [52.101.228.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8372031A571
	for <linux-sound@vger.kernel.org>; Thu,  8 Jan 2026 23:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767916463; cv=fail; b=XY3YP0P0jgyBhLend+6HezUEZQJCaBboEqDHfSyERPkQy2MVfdPWzt8HqXIMQcAL/WphexJTYBNvGakyCVs8yoYQtMdP7xVDVOXJ/ZyJ3gYZ3RuKpSuQfY15SFfWh3E0IBfSj6wuRCo2Sa0ckZ2ZPBg4LAVn7CaRZ49tP2l/GRU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767916463; c=relaxed/simple;
	bh=knXA3/c+/ZbfT7I7TMR8auLT0eH97g3qyGL22Z6/WHg=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=QegzdAJqvK97SkGq890lZ6QZNZFLxSsffx/ra03r/9ayihzojWpR33OEOVoiz158agTk3zZBcnjrwJBAGzWdlepzqZ11C5HYGYuV8fdowbho4luSaP0a0rGg9iP/fDOWKGKZFSbRWPzJW3IghxggljsUpfFPROluvmwh/3Iunec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=UykqngFU; arc=fail smtp.client-ip=52.101.228.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="UykqngFU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G+3HJ5/HLXE+3FskXpLgpqUCsTbNaWJDIkTHJ7qEuhCN2dLdRBFOsDEzwAwjf33Qqc8mlpVmtCZIBXyEMYPJojLVyLVTHgAc/3yzd1101/4bMo+Ty5fmer6YGRUjpRN22xaX71eLVxsT1O9X5qDGxJDpeg1wXYZbFCGJimTkGKhgLnvm0Ki4FY8nYdntUUc4zIDjiMtKHoY7V98parxzFdSVAKm5uSOEQKEi4As74JLg0sGK3XpIwk8Hjb9OuQ+c5WCn5/LJ0IIrOTj9KylwgFdAGeekdj/u38t8C5laAF2hMfgPpJynZSG8TeqgF+cjDCvq+Eth2NjxEge2Tnizaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TC1Wkxwfs22kSqmVcHt6eHDICd9OBWualDKH3A/+psk=;
 b=AQL4M33TvP+RXuSOmBpT5Rh51DIrLTiuXabZeQN2UrpBxenJU1Wko9lrv8bByviHHcb/+3J4tdQLnj5rF+d881j6fxCkopmfLL3EEDkIOkUHVXfEUVgGVUqeD+eESJs44/AiPCvgbCciWQjKKuD5myu36mD7AOUaG0uoRPgE3lY+bmLHzbpIjdehr2NOGaXWeeM7E4eKKo3Rk40lBvvccyygYga9dbe3EM+tzMjff/99esuCUKqhqhcoc59LOYceWkBzkXrLehC4eje/Fpl3uzyUEs3hBNr12wKin76kKqDNjuRq3jL+YcCWsqBYOwtwTtEDGclgkU3xSG74Yh7bVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TC1Wkxwfs22kSqmVcHt6eHDICd9OBWualDKH3A/+psk=;
 b=UykqngFUovaq5I+y2GoWDu8vuWkvywmVkon2A/pxQynjEnDrFoV4Yb6siySiQJuXAgtyfJJGQSnIWbVz5B0KSFKnjO83PT62wuLah4lwJCBa6MydeYsh9PdLt2yt85G2hFvirYGO0fanEBeRyPzX7SvcBhUEjsB/hQ8ZS4OTbKQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB13067.jpnprd01.prod.outlook.com (2603:1096:405:1bf::6)
 by OSAPR01MB7398.jpnprd01.prod.outlook.com (2603:1096:604:143::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.1; Thu, 8 Jan
 2026 23:54:16 +0000
Received: from TYYPR01MB13067.jpnprd01.prod.outlook.com
 ([fe80::dac1:6ae:15b:67ee]) by TYYPR01MB13067.jpnprd01.prod.outlook.com
 ([fe80::dac1:6ae:15b:67ee%4]) with mapi id 15.20.9520.001; Thu, 8 Jan 2026
 23:54:16 +0000
Message-ID: <87344f3bko.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: codecs: rt1320-sdw: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Oder Chiou <oder_chiou@realtek.com>
Cc: linux-sound@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 8 Jan 2026 23:54:15 +0000
X-ClientProxiedBy: TYCP301CA0055.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::6) To TYYPR01MB13067.jpnprd01.prod.outlook.com
 (2603:1096:405:1bf::6)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB13067:EE_|OSAPR01MB7398:EE_
X-MS-Office365-Filtering-Correlation-Id: c0e6beba-267f-40d7-8cf0-08de4f113b39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+0aKJfVvTCfsNH1P/z4coQwZZS8R+sRO2Q5S0B42o+xEAS8wqRDsklhPh8ka?=
 =?us-ascii?Q?UKCpsfM02W2BD1vLXlc/AOcaZLTfcuyUl/og0OA/t0grihTT3F+q6FubKXtY?=
 =?us-ascii?Q?6aVwkDRMVOSUQZe8C7LkNI9hL06JC/RlkPmVrT8A5eFIY8i6sL9LS092QvWR?=
 =?us-ascii?Q?szHVj0XJipsxHDT83WHkQTNWjHFAZZqUvT66kJNDQjR7QSBtj/efR60XZply?=
 =?us-ascii?Q?x2fgdyw6asoylYMN3yRXtbg/UYR7fXjs42ml+duy6DDBBaDW+cjnUc83QBVw?=
 =?us-ascii?Q?aK3zLUFknu2SQ1oKx3SoyOKqTgfw07SETjgdLUcKhKZTSWhvIf7q1aI4431Y?=
 =?us-ascii?Q?2XRl6F5Zk37WFAvorQM0yoFeD4ajuFPmaJ12+nZWDcdxRnmINXgHpl5DJM7i?=
 =?us-ascii?Q?hMf9Mr+fg4bl3ZFtAR3690dml8iREg/p5JGkDWixDndByHHmZeS+OsVr3iOI?=
 =?us-ascii?Q?XWw19qI52eFDaIPuZMrhAnlMX7iTxvtYhxPJlLIN7nQePdp9+G7o0vgrskGY?=
 =?us-ascii?Q?nOZYoBFIc1DOvCynTLP+Ohe0VLFv1hKB6Kp187Fjyz3E+6c3u7tqHnoOKyt5?=
 =?us-ascii?Q?btJETQoW5APk8u+Y+XkqULU7b437w/OCL6pflJIkW69XBDwQbUHDPGg5l9sl?=
 =?us-ascii?Q?Rzidfm6ZXbbIACZdhN52J412OF8BRIPX25Zvtyv0pkvicNzUqC0IsjfnFOI2?=
 =?us-ascii?Q?CmQ3DOJg3Npvg/zJIqR80HSotckrIQOCOrOkE1+knDwebfKyV+7jNv68VGUd?=
 =?us-ascii?Q?Sz0p9uhleQSkrAmfqFknnSlefwCnenomCLwLpsIWIGlkrhin53lf39scBJ8E?=
 =?us-ascii?Q?ViC1BF/4gQPR2mdutXGIuc8BaDH5P9P/6+1TBODblz6Wh87OSsSvA8ckpdKx?=
 =?us-ascii?Q?bUqg2G0tEsv36P7GN+9U/FAI/3SRT0C8a8lckPaa0sOHAikelZ93/ydN8mWQ?=
 =?us-ascii?Q?iggNj+LFIYw62C+9MNUnwlOLj48CKW8D8NCqhPdpd4FPXPEozygIrLNT/8BV?=
 =?us-ascii?Q?RBwBahnSK2Da9JtpVoVCR4IEaAxTTunZpryw/Hhl32oXiaJP6KTwLCBH6evu?=
 =?us-ascii?Q?2UheVkhAHl9WFQSjEA5KHVwyqwEjt2uDRhXlV5ztVO9P3eDJSJPBYHxp5yBQ?=
 =?us-ascii?Q?olM0WW1PtC74YQR1rgcCWuAeiW/wF7DfJtGxsNUgXTISLab3Xxy72A2IcN3f?=
 =?us-ascii?Q?/qTFec5y7Y5t0+q4SCl4VbpTaRG1hTV6TmVzXwa2ndJUj5b+4nQWwTG2W4Zb?=
 =?us-ascii?Q?roxN+llMoO7OIWFgDRbN/mL/2qYEJKKVBi9afGoh2rtttwWKmdtEUcu8LUNq?=
 =?us-ascii?Q?wZQbPKud/4wYEDOkHKs6V67/5guNQA2zD7cWnDiKSddaN6hRKJ3tzTYzjxZW?=
 =?us-ascii?Q?pLNaavzEpbhjQWetidBB1pXByRVBGjffTugIuLTbANeuro0m2124nkcPnPLM?=
 =?us-ascii?Q?S8ny1sLdOJ3fqwbYnzKw/WCXpbstwC2e5gOg5YGCqfBD7ges93wWmMgq8k0X?=
 =?us-ascii?Q?rdA5JruHZfFXoXIbcGS7hWp0yScISuSJMyGX?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB13067.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Xn94JtuTD5b3vXL7LK/NrpWFzA+6tUNO7dlrn2qKXNVh5vUKD5qzbiTniTFy?=
 =?us-ascii?Q?BzzQFPlhS2uYVR2Zpl7Nc3rKxBZJwqJPFxuaEULbthO4o8302fGHqhTE9egc?=
 =?us-ascii?Q?VzYzqOg4kJikH+5CaEaUtY40lgtTjzx1IUrSo0DiidZ6tZ3dgHuAE0S+tsPf?=
 =?us-ascii?Q?AfD6scG8lCTJGxfuvaItPBQWmiutjo8Lu46RufHhgFvxoHLM2Jz7ll/ET+hk?=
 =?us-ascii?Q?wDJiMZQVa+HQcnmZnomZf98V00+VBWnHHc3qhB1uVDEuTyYLHLbL7Yyae0r7?=
 =?us-ascii?Q?o/ymsi6onyIQ6YgxCM+nw6z9aZ40eNRZ6Aw/RVMHm0C0kG6WdLPskVBfuVyI?=
 =?us-ascii?Q?SkcK+OvOOIp1uHRHIbSffwCXUTjnxVS7UkdUDROyk5aS10gbIKxEkJ0tbF+v?=
 =?us-ascii?Q?2hph9ai27mMJmacT3sLlS6DXN1UmmY65+jf5muwK6K3cs5j9YuvKMTdC/Y5m?=
 =?us-ascii?Q?gdc4PDUMAgozYByWMGIsCRYYDfgj4caGcrLpHuTDC8F0pikn8hLWUz7ik91j?=
 =?us-ascii?Q?+EEhnXq9b8OW9nP6fq1+vGeJQBPF/xsaQVu6h+F/PNuKNVUH7STg3QqBWo2L?=
 =?us-ascii?Q?HZomqldoId05CPQxI3E0hqwrVQqbUrc/0Sm4Rps6g9rzabNepKid/XMwkh20?=
 =?us-ascii?Q?gqa3x7et61GWCZrwP8TA8FlMOpFC7vdBxUza35kh/aQ0IfgCDcmYrCRU9pXm?=
 =?us-ascii?Q?FN3lJPPOcAgry1vU0kl6hiOPRKN2ENvm74GmkswI/u1gxeDrtqnoOT4XGw3D?=
 =?us-ascii?Q?Rl+Nwed/xx6pOQ1iSetdb8x4ESHk7nHxklrDyCHtk5U2TBUx8MxksUBLQCv2?=
 =?us-ascii?Q?J7rf9NfZ2qXmZ/Cpukne6eQxhEdTQWhny8qJXo8kNX5DkcNuaH1LTXkhPcRO?=
 =?us-ascii?Q?TN/JIrmJt5NjueOPlHhYiVimqh8z8jmEaus1BJTsp2shotmL0hFCQqKBId/Z?=
 =?us-ascii?Q?WT14zzwNjrIhFSmdkEtZdjSbiBzVGUnNVDDLfQW30LvkCNw1J2KgJ+4P8aJx?=
 =?us-ascii?Q?HmTl3HBVq+E5nHzSEWP6glAaOvxL6sdzWlhd99gLhV8clSQL2GtxDyDFDgEN?=
 =?us-ascii?Q?j3D+vWUXPkNy3+DyqHcc8dXVIloMUSqUCJAsrSH8X2+mgvgVuJ5pkfRfWIAR?=
 =?us-ascii?Q?Q/sBJwSEkZwF6KWNU1mHKXz7MYFukFSqiQqvbpEcPbdSE67qI17g64Mo3RCc?=
 =?us-ascii?Q?pg7eVcI99rGfSv/sDSfRHjbBr7FMizNHbdsuwb4g2adsh0wt4ExMYsBgoN0N?=
 =?us-ascii?Q?rJURDrRkl7xou3EaLAwxJaw0sFVGtLtXMfppBU67KjAD+VKU8+2yW3PCkcur?=
 =?us-ascii?Q?uRoCpyydQFY/z2p4ZAMwjRu5HfBhSgYnKMTi7UMeSGNOFzGQf2HPsWEcOZjj?=
 =?us-ascii?Q?CkzjtI2EFiHRqXSrx7WROusDhV95UMBTsHeMiGIgIW99bVZN7G+MWI9Tzl9J?=
 =?us-ascii?Q?0rFxMxNhW3ZfFchgVipwnjTLuYS+JfeBFYb8mTKJFPDmKNpx03a57Pd9LJ5G?=
 =?us-ascii?Q?tAMJ7xB9vgU095G8Q8slUdDDdFOJ+/oCqdo6262JyL+Brb0XEy9NZeAxC0yg?=
 =?us-ascii?Q?P7A3dQP1AXWU9PfZ04zBY+pYczQIrXWCJDS5DWUK2f1pHChoqjwOJPeSnu50?=
 =?us-ascii?Q?nkkxwcVK49KVkRL+3hTLm+g7vnBzw+gOBGS8cxl7kOS5G+0iYsAQAbNG81Fa?=
 =?us-ascii?Q?5Mn3/YrXfp7BnqvuFu5ZhfZuqcPzfUDnzEMPh1/7W6GRaZKaNGTKzahXqL0T?=
 =?us-ascii?Q?x2Ril/crfMdqmZW8BmXPkuiUoRFlGnMDJAamMztvfMb2J+Iz47r4?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0e6beba-267f-40d7-8cf0-08de4f113b39
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB13067.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 23:54:16.1200
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WeIRnMbEVkpAPm0buFR6jVrBNskOeQ1tNkAJJDGFTXg63sAUTzwRuso+NfA7aLaoAxW/Qc6EP+xoBJNDyqlha1EbgjA/SWh5q6IEidBduuROtBf04cmx47PgU04o7+2B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB7398

This patch converts below functions.

snd_soc_component_get_bias_level() -> snd_soc_dapm_get_bias_level()
snd_soc_component_get_dapm()       -> snd_soc_component_to_dapm()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
Mark

I'm now posting "ASoC: capsuling struct snd_soc_dapm_context" patch-set
which removes old functions. But this patch is needed before that.

Please let me know if I need to re-post above patch-set.

 sound/soc/codecs/rt1320-sdw.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/rt1320-sdw.c b/sound/soc/codecs/rt1320-sdw.c
index 0d54ed754bd29..e37b4cb87fbe6 100644
--- a/sound/soc/codecs/rt1320-sdw.c
+++ b/sound/soc/codecs/rt1320-sdw.c
@@ -1246,7 +1246,7 @@ static int rt1320_r0_cali_put(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct rt1320_sdw_priv *rt1320 = snd_soc_component_get_drvdata(component);
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(rt1320->component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(rt1320->component);
 	int ret;
 
 	if (!rt1320->hw_init)
@@ -1258,7 +1258,7 @@ static int rt1320_r0_cali_put(struct snd_kcontrol *kcontrol,
 
 	rt1320->cali_done = false;
 	snd_soc_dapm_mutex_lock(dapm);
-	if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF &&
+	if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF &&
 		ucontrol->value.integer.value[0]) {
 		rt1320_calibrate(rt1320);
 	}
@@ -1582,8 +1582,7 @@ struct rt1320_dspfwheader {
 	short crc;
 };
 
-	struct snd_soc_dapm_context *dapm =
-		snd_soc_component_get_dapm(rt1320->component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(rt1320->component);
 	struct device *dev = &rt1320->sdw_slave->dev;
 	unsigned int val, i, fw_offset, fw_ready;
 	unsigned int fw_status_addr;
@@ -2388,7 +2387,7 @@ static int rt1320_r0_load_mode_put(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct rt1320_sdw_priv *rt1320 = snd_soc_component_get_drvdata(component);
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(rt1320->component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(rt1320->component);
 	int ret;
 
 	if (!rt1320->hw_init)
@@ -2403,7 +2402,7 @@ static int rt1320_r0_load_mode_put(struct snd_kcontrol *kcontrol,
 		return ret;
 
 	snd_soc_dapm_mutex_lock(dapm);
-	if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) {
+	if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF) {
 		rt1320->r0_l_reg = ucontrol->value.integer.value[0];
 		rt1320->r0_r_reg = ucontrol->value.integer.value[1];
 		rt1320_calc_r0(rt1320);
@@ -2447,6 +2446,7 @@ static int rt1320_dspfw_load_put(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct rt1320_sdw_priv *rt1320 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	int ret;
 
 	if (!rt1320->hw_init)
@@ -2456,7 +2456,7 @@ static int rt1320_dspfw_load_put(struct snd_kcontrol *kcontrol,
 	if (ret < 0 && ret != -EACCES)
 		return ret;
 
-	if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF &&
+	if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF &&
 		ucontrol->value.integer.value[0])
 		rt1320_dspfw_load_code(rt1320);
 
@@ -2481,6 +2481,7 @@ static int rt1320_rae_update_put(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct rt1320_sdw_priv *rt1320 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	int ret;
 
 	if (!rt1320->hw_init)
@@ -2490,7 +2491,7 @@ static int rt1320_rae_update_put(struct snd_kcontrol *kcontrol,
 	if (ret < 0 && ret != -EACCES)
 		return ret;
 
-	if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF &&
+	if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF &&
 		ucontrol->value.integer.value[0] && rt1320->fw_load_done)
 		rt1320_rae_load(rt1320);
 
@@ -2516,7 +2517,7 @@ static int rt1320_r0_temperature_put(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct rt1320_sdw_priv *rt1320 = snd_soc_component_get_drvdata(component);
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(rt1320->component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(rt1320->component);
 	int ret;
 
 	if (!rt1320->hw_init)
@@ -2527,7 +2528,7 @@ static int rt1320_r0_temperature_put(struct snd_kcontrol *kcontrol,
 		return ret;
 
 	snd_soc_dapm_mutex_lock(dapm);
-	if ((snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) &&
+	if ((snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF) &&
 		ucontrol->value.integer.value[0] && ucontrol->value.integer.value[1])
 		rt1320_t0_load(rt1320, ucontrol->value.integer.value[0], ucontrol->value.integer.value[1]);
 	snd_soc_dapm_mutex_unlock(dapm);
-- 
2.43.0

