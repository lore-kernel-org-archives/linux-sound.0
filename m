Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011047.outbound.protection.outlook.com [52.101.125.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DD730B500
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760416071; cv=fail; b=rI6XBoLOqaLn3WGI9QfqhAGyYGJa/SoW2Dc853n8Ja2NLE6hs/PDsqVdF9AePj8CnIYARAtf7cNu4bXCyuoUacydMUrNXfTYHJadH5Nokhk2RxUQYe2JN95IWCWv+py6WLuMjrKf9CDGtjkUQ7nAlGT+rPcLfge2NOFo8u9+bGg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760416071; c=relaxed/simple;
	bh=xQSgFEDnapDKh36nRLbIqcjAElR6VGny+wDaHdKBiMs=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=QyFSwz2k5teZCh5CWPO721JtUiQ/QhWcKMTmLZP1yWiamPPJQCfj2NjNWBlmfQmh/fZf1qkBJvxyrczdD/yWkzNjTzz2+9dRbcHbdwM1Na+WuUjLEboY/5YXmjxTt7je5QL8q1DdWtu2BzGzpd+7K7AapiRKh969qFMGyKgPdro=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=MxjzhvBx; arc=fail smtp.client-ip=52.101.125.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="MxjzhvBx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X6Jt4pEX7NvmsX1AEdzY/X078alPx+4wjo88RnbL3uII49iIYxCUyWfAkJF+nHdHF2xFYVj6x977x0XbT1iCoyI6JuHQMIkT/77yraQoRjf774sTK1/l+KBxx9jVzUPyLaBwT8lefpuDzciUi4DWqcjZuGRpOuLZ2PKiVEn9wLgW8aflcWFNwdOEbkCxy8ij19Ke30gGAhiSLA86yxrKQKFLuOPLDZm0WkoG1Kw/69YTlOH/Iawf0hOH2fmZolD+2YxqaZ9Z+2yqky+Rk1JrxbubHGaoU32McYWg5uG6grc7WsMKbigMd0FfoDMjpVdqU/Yxwl0XchNRmWw+qLcgYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aX8ymjpsDzAFQS1RvYRv63GwcP8keT8YmyHqTOfJ3SY=;
 b=rRcW9+VBG06xW2WMAeoz2r5YlWwVQP2vBSPZnISCC+xzwGXuaWUPh6xetbr0tPefB9gJAI8ChKvO/irXi6xtIPGhVdMHN8NUADXKvIbt6nN5zjhADOtkohy6MrzfPhEnk9MxRUfy4rrX/gDh9XTOhIf58e4bvNPCA7xNO76AiVfO3U13ITbEWPkT50rDUlK6+x9D1DjUPTSlhwiQ65YYvL9eFE0NC5xQPk384Fm/m313ZJhmo/ffjpgOB2CUvFLoy3vSJydwBhgB+5T+vQaGyMMu15PVOgu8qwdALKpdrQVY5i3Kb5IV7KCfP5kW0mSIEkbp1EuTcZPGGOSWCwQpeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aX8ymjpsDzAFQS1RvYRv63GwcP8keT8YmyHqTOfJ3SY=;
 b=MxjzhvBxvD0mPNcAoExyi0B2/hcL6gZqtJAXNfbAoWFZafqacWt1l09z4q50Vyba7feStGX8YMQTnODHwaBm/aMu1zEDK0fmx9RHVlqIpnkk59dDa5wZg1hxg5sC5osk1K4+pRiosrcnX5tU8FtcVhdk6aODakiI14Oa6nClDKY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB7268.jpnprd01.prod.outlook.com
 (2603:1096:400:f3::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:27:46 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:27:46 +0000
Message-ID: <87ikgim7jx.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 134/139] ASoC: mediatek: mt8195: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:27:46 +0000
X-ClientProxiedBy: TYWP286CA0020.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB7268:EE_
X-MS-Office365-Filtering-Correlation-Id: 88dea953-23cd-408f-a040-08de0ada06e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wlK2XGWS2nuohBsX5IyZPp3iH0h2vSeFTrb75kxV3fqQOa65lEt/XyzZUc5K?=
 =?us-ascii?Q?GQUsNoT3kCQsNyBQdb6cSsAbQtvhlSYXDE8MaSxrwSRWVwQBQfTX+QNqRz99?=
 =?us-ascii?Q?OytCvG5Vuzb8DOnp9rZVUh4l063G+TaKEjXvfdRTxs7vjKSk2kEggsEy2oX8?=
 =?us-ascii?Q?tdxNVq+q9EKLDmsk7UEl9IVyaeRaIxRr7utzesDTuFDDN/o5DAkbq/xzb8XX?=
 =?us-ascii?Q?pHyVRIBkCd2zrVihmNjmu0V5nG6L8ZK3cG4VTLULhJB+VxkQPxOV7yPDeW/p?=
 =?us-ascii?Q?NkfUQW11p1qo57c7OXBOm15WogZ2tOkFSIrZrtIufJvTZiFvaPizQCCAE/5w?=
 =?us-ascii?Q?LWv4Q4JT+wK4go8Z1Akc7/cngNyJ7ZMwYZOFy+Gi4b1Mr5EteNdS03nHqSIX?=
 =?us-ascii?Q?fwyr5UCoiTqLjDuxOFiKkQ0mHaoXkxILZeSfjVyKfqIe+nMtC6CvMUWJO6DA?=
 =?us-ascii?Q?B0jhSLxS8J4mOFI5OfAT/a+nYc7Ea1rHrJnDp+hm0vrrxmL9P8RZZ5N8Zfed?=
 =?us-ascii?Q?qsq1nmM8KKgVjx7psSTqqk0UquJGiD0wGmTEr/JUBF8csax0jqKYn+ZeeefQ?=
 =?us-ascii?Q?Rz9Rem6h1l4tgy9xZ9euP930GZCDL4VvL8vg3PiiSW23D9uitAqBSbex2ZXQ?=
 =?us-ascii?Q?13n1V6i7b3cFD2b7Xg085u1lverW+plD9o8kDtak2AW+3QsT6KZcOABsf3rb?=
 =?us-ascii?Q?8vYp+p8b3UFa3eCsfa3O3xfS4zf9trbTHQpxmExqUK/VWpMFjjIZB5w6/z/K?=
 =?us-ascii?Q?IkYXtyQ0qObUaMyMyHOD03Pd0zZKZzihhB697ei3zIrx1FvR3j2XCvEONAl1?=
 =?us-ascii?Q?j8707lOK5mcfv5owV88eZmYAfr9+Dy5r3oFP/m+GLHBHEzhQ9lml8U0DSi1z?=
 =?us-ascii?Q?ilwsQ+KH07XGhqQkA3b0iZNQWANIxru0mCKzFaalPokOQKN7LfRjF+nPGs4T?=
 =?us-ascii?Q?+VfFl6MYpuTf0MfL/ipvM8h1Zj+0Jq6BRo/WxRfa51isNivCITRXUYNBDKQG?=
 =?us-ascii?Q?WicL1IotMFm2VhXBgwfsdMXVzPk91eICK50L5v/eia4nMVSdXhM76vSYTy+e?=
 =?us-ascii?Q?jJzkCHlLxrtlc/J/Ja0Dgm4OMgvu+BRlaKLCjOMFjN8Hl+/hdIBE1D1m8fbX?=
 =?us-ascii?Q?aIaD5B4c6CdIC/L4xiHZ7BbBN8WemA7jnmvM0mA3DtvZdpVV1N8Nmhvr88sU?=
 =?us-ascii?Q?Lsv5ZgLYd/W0lRZ3z1g5IU9Z+b7yX8JR1898BA5AlUSRCBOwLaXgHDzkMaN9?=
 =?us-ascii?Q?+qYrBqxoHsM+DE5cix/HHpOE/T0hJy4IB8KUhqKNkZixa+ApyiJPTwoXzs8c?=
 =?us-ascii?Q?SZ8miOh400GKK5ZNJZTfUbMiFOIvPtdNVXANcAzx7smm5L+ip70cNmlDKc8u?=
 =?us-ascii?Q?qDoI+Bmy/Umvh3bcxLsGTjgkExqtJvUKo03As8TS/p4qwRBcqG8TtVZ3jCtW?=
 =?us-ascii?Q?WNLqKWgYd2+j7Ie1wbWssa+s6qwuqjlVKwv0alc+lzJElEsEh6tyqz7eaRzV?=
 =?us-ascii?Q?c7HED8MZc/jeqZ+to7YLUWem4PYOnCwVlNfu?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BvALQbe09lWHxrB/LrMFY+KPe4JXpxWV5gl/UzIgzXeS2dgDsoq0MX2bkdNr?=
 =?us-ascii?Q?nD4dio/EK5LKfxOxrGQ8NN84onUBicg48E6EMAVUe8T4aNA0Zih82kZfiZoz?=
 =?us-ascii?Q?jT168c+TyILGCXAJDAOywZNju6A2k16EECxnSKEJ2VkQZOCvtOIkxmPzfT3H?=
 =?us-ascii?Q?6124ODG78tkiyPgEbNt3q1nlUUDN3ENcvJPglIH2hsebiHb47fSDXcWihC0Q?=
 =?us-ascii?Q?fqJK0L9K/gMorczXxghbKFWHbkSroj0uswkxL/EUIFcyCNgMAcZS30e7/sOa?=
 =?us-ascii?Q?NDMZY+gLNAVEDh9Q80jWNq29vyv6U40ofDQBBylHDMItg25JHou2udXHjWnq?=
 =?us-ascii?Q?Dh37Ovt7xQPuvpSzfEx1iayaeC7DMDqWHD2Q0HsWXZx3zJT+t/YNpJsn0Qwa?=
 =?us-ascii?Q?T6GWk9J6NBowaNpKM9jCkh7eJ7gepnezbd/47jLjPTVrSqQmNIvYI1BQku+E?=
 =?us-ascii?Q?6ASHcEAs5gDobIsBcW/sWYRh90zshca7/CKZLcFP3+6Qg9R5Bd5udDthCg5b?=
 =?us-ascii?Q?3H9OD0cfJHaVvDpGdejqVtNZAOmePyMfO9axp+Ac3sJdI0J6MoUq0g3GGR2r?=
 =?us-ascii?Q?GtlP5hUTHXMAktq4h20MzhFG2GvnnRWH8hHqYbWUOBp0WJUCHn/Iy8joinQl?=
 =?us-ascii?Q?mG9A147pjkH0ddfh4OfpWThp0iv2AiSAnPsSOrHXoi7PieVke9lwTP+7t/2w?=
 =?us-ascii?Q?h6Gvt3xaYYZz4WNxV8K5RIPNapbwrnCkJwiVnBo+XubsNF0KYccoHhyvJIk2?=
 =?us-ascii?Q?ict12I+xMIKnU0b8/oyyHtIsUg03JqsOh4bl+3g1JetzS6aW8caoGCvDSt/O?=
 =?us-ascii?Q?xCT42twIjHP0mNNCuhCPhKJHSbPdf7KS9VHQPXKipxAUymLUnfvNRp7eHya0?=
 =?us-ascii?Q?X1n3XSLV26KHQAk/G2j8gjFliCK3JVb+kup16IsgCfAdDiL6pbf34QOZHrAy?=
 =?us-ascii?Q?odoLi19DVQiWIXBunGzQhhEh2YONr1KAEw8kuiGvNCjCZ1/yleRN9HJ32Kd4?=
 =?us-ascii?Q?NKP2hatZHo8x+wa/0J2KKYBYqXitdPNqPKS/RV2c6kk+XcRs2GcbYWF3fHB0?=
 =?us-ascii?Q?miG5wg30oMsMGELcFL6SDEc//GyUO9xNDDDYigF21YgEax4JfXPS7dXMigt2?=
 =?us-ascii?Q?7dNQAPaaVTmxnAmdn+L2pNx3QIb9iBolZGFw8l5raiv5cfePfRYbtl71ULaa?=
 =?us-ascii?Q?/tQjkHboDLFcDpr0JqpP4XvSSWiiW0mj4SpWt9SDQ+eYLOHAmYNHFU+I3zDo?=
 =?us-ascii?Q?m9fEu+bES+kd64O+xoyrV+sHGLMDl8Cez5E94nuMA/GJ54cQ5l2atAJKkuTz?=
 =?us-ascii?Q?sWo8sX6YeEPJF8PnQrRSOsTxxlRwNt/kA7+otbdIk4CXyKWle/H1dCk5njTW?=
 =?us-ascii?Q?DTSuNZx6WUvW2GkYCsftu4vbyy2xbkpb1SdNbcS8qGRvwuGn3mQWIDBKH2Yp?=
 =?us-ascii?Q?/GiclICjkCPZnXk67YqSTMQVDMxXEo3/EBR1lb5eSSAhXUf/PRh5TMc59+MD?=
 =?us-ascii?Q?umGuogxWIwl6Ajp/Gd+xTllM62CWqhtBkgq3JE5+lbT31RWtSARvVkStjOxJ?=
 =?us-ascii?Q?RVToxnvR6Ve8N6q91bdAEARtxQrgd8W100J78H0EPvIoSVU9Hu8Sq2/XKx5l?=
 =?us-ascii?Q?+nkXEvZ9eQdASg8rQ1qC8l4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88dea953-23cd-408f-a040-08de0ada06e3
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:27:46.8929
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YReTd8WJN9+WPevbLW/Q18jgkitTqHcfqxArSN6JUKQG6VxE6uz47h1llSzmN2k2Z4xjGX6vxRwF5XaQUnKDEst1dO+txk/GkR659VsQBgNoQPX3BVbPUxu6b8PkkuRw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7268

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
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c  | 6 ++----
 sound/soc/mediatek/mt8195/mt8195-dai-adda.c | 8 ++++----
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 3 +--
 3 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index 5d025ad72263f..2ee33dcc8e484 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -1460,8 +1460,7 @@ static const unsigned int mt8195_afe_1x_en_sel_values[] = {
 static int mt8195_memif_1x_en_sel_put(struct snd_kcontrol *kcontrol,
 				      struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
 	struct mtk_dai_memif_priv *memif_priv;
@@ -1484,8 +1483,7 @@ static int mt8195_memif_1x_en_sel_put(struct snd_kcontrol *kcontrol,
 static int mt8195_asys_irq_1x_en_sel_put(struct snd_kcontrol *kcontrol,
 					 struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
 	unsigned int id = kcontrol->id.device;
diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-adda.c b/sound/soc/mediatek/mt8195/mt8195-dai-adda.c
index 8da1587128ccf..94abde15ea094 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-adda.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-adda.c
@@ -484,7 +484,7 @@ static int mt8195_adda_dl_gain_get(struct snd_kcontrol *kcontrol,
 static int mt8195_adda6_only_get(struct snd_kcontrol *kcontrol,
 				 struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
 	struct mtkaif_param *param = &afe_priv->mtkaif_params;
@@ -496,7 +496,7 @@ static int mt8195_adda6_only_get(struct snd_kcontrol *kcontrol,
 static int mt8195_adda6_only_set(struct snd_kcontrol *kcontrol,
 				 struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
 	struct mtkaif_param *param = &afe_priv->mtkaif_params;
@@ -515,7 +515,7 @@ static int mt8195_adda6_only_set(struct snd_kcontrol *kcontrol,
 static int mt8195_adda_dmic_get(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
 	struct mtkaif_param *param = &afe_priv->mtkaif_params;
@@ -527,7 +527,7 @@ static int mt8195_adda_dmic_get(struct snd_kcontrol *kcontrol,
 static int mt8195_adda_dmic_set(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
 	struct mtkaif_param *param = &afe_priv->mtkaif_params;
diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
index fd4f9f8f032de..723cab01e72e2 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
@@ -738,8 +738,7 @@ static int mt8195_etdm_clk_src_sel_put(struct snd_kcontrol *kcontrol,
 static int mt8195_etdm_clk_src_sel_get(struct snd_kcontrol *kcontrol,
 				       struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
 	unsigned int value = 0;
 	unsigned int reg = 0;
-- 
2.43.0

