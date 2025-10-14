Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011008.outbound.protection.outlook.com [40.107.74.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482E7309DA0
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415741; cv=fail; b=E9Xhcac8Z2TrBHiaxI/EnldWLcY/JdVpC2HJy7DlVxppngHficpBg+HaxTW7WuYRMGOF1ldWz4XqG35zHMsBnKl3sc28YlplOBwjFPqH+MAPsq2AiAVB2nTlaJm0jIcBlXqEFTMEBffmB0Rxb8hHdUlPFHN+U8oGwIvfWdMJbkI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415741; c=relaxed/simple;
	bh=F/kvsDrRtPbfoi2rQVQiZkzStdr1D5zfdGwIK1bYn5g=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=sQORi7JsAc7g6CosXdIr/fJymQ+A8b0NjDHZ4DpvTFQucTjrFaWKGHw1s2/LPgV8MuQJtfDGB+OdUV20dq7tfwXUacLWFDT6LCbkGNuGC51zX/jdZkyqkfw7osB7XfEwGQsMuons++8JmxoLpRf1VsmQv6oTVRG/gH+LEVqqXZk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=PgCV0+6+; arc=fail smtp.client-ip=40.107.74.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="PgCV0+6+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XgBPd2K8FGEpMT5pgN9D96qWnCxCpS0XRXsCzHO4ElHbLejOB0so3mmowoEBNUVyu8NSmVtoJJVTTfVXLMhMXugUeGXjNpTuO7seiRqvLb/AkoVzsnlM5i7SFZ4AHRUcokMuMZUUlY/kLcpVLYCGIXxkkrHLreQ88vJ4e36n/ffBdxo/MLA6zMsWT09E2lBLxyB+y2KlkDewyEfJtWHb3nCrOsu2FP045EXDj3Y9EUOq2MisqotPQVgqMOnkBFHuIYjN0e4atMkSf/oUq3R+jXcHO5R6MBkZ7VmR8IXe46WN1kHElzfVNtk7XS1Asx8t20SYhS8mq6MZ4TMgxfvgdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G4HZgZwFk5qNAFgnnInrC8iQ/SYKClGPnqfqPcbyG2g=;
 b=eGSnPFdTBD5oc6pA73vdpycRjgxN8QEvVz02qJ4tKMsu0nnOIuPls0drPJtc1S1LiYK92lhf1KyD+DB23L3UO1qMET4LjwSnlzf0zD6afVt1arbGls8ZG10kvMTfNIzIfvw94sYHTY+nDSD5Fp98vzL6dXToKzV4/NJihP7YwGPKbuLZZajN+mHmKjXWzvLZs/M8gpoSqZXOeLzkWsr09akymp69wHt9x8K1QDJbeBNylf8djcUCZMhmSUEnuiLwmvPBWAQ5bfkgW5OdWYFZTQj7bjvL8j5qOB3nDARARvea+FgZNGGkJcbd6ucMgRbK15o7FuszCgvIr0OoVLkwcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G4HZgZwFk5qNAFgnnInrC8iQ/SYKClGPnqfqPcbyG2g=;
 b=PgCV0+6+dWz1IfhCDOxu/1Azfy35/TlH0+AHcskhk8GCnL8sXQfSOCfsByyYdxd0p+z+Ya9iNWn9c93hm/wFsNv4hkAbFIMUWXvk3qr54MVeFekpVCfdEkZpKA4LSBEFSL5EcXUifYICN/6lA71jpwiWXV0Qy+iJUHR3xF6rDQM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9449.jpnprd01.prod.outlook.com
 (2603:1096:400:199::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:22:18 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:22:18 +0000
Message-ID: <87347mru2t.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 045/139] ASoC: codecs: max9759: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:22:18 +0000
X-ClientProxiedBy: TYCPR01CA0181.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9449:EE_
X-MS-Office365-Filtering-Correlation-Id: e785977d-3630-479c-1472-08de0ad94336
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?W68IqUWmNkE2i2xY5/aKBX95NQHO/N2xBK0EFZJOwGhI698tVlDcfvfEkrYu?=
 =?us-ascii?Q?nKWOX81PybDHsMOfdlJpxFsfaiY042oq4Gvq48gvTr/HpauBEDNfcrzoaAP+?=
 =?us-ascii?Q?sKHEoyp6FAEvUY3n3yrzxR1JLIyw0Yu3hBDvo5ls7niKVbST3LVFaXpxk9/8?=
 =?us-ascii?Q?/RHLDiT27cJuAwfTlDuDCJVew0WBO//UJDAyYcsUuK8+K7UhYdglvJzH0LE4?=
 =?us-ascii?Q?FOq1yRwrNITnvIwvTgDtQu+gB02wx/yG+ER2O19MBARBtMoeZ6HUS6T6CvoE?=
 =?us-ascii?Q?qNjDZ+B+kjD6v+u6ZbLi5uJEU2aWj985O69lSD09oPlGBlxnVFsK8Rl2f+me?=
 =?us-ascii?Q?Ov2Oh1LS58iGhOjvu1vc+ylCacuxcbzpegTKsPwxHqKzfd2lKU6mpKng/JgX?=
 =?us-ascii?Q?Yi4SFDet9OaMlaiP401379p7xZqA8D5y3JyP/3Cj4vynt/UwrzMDX9l+ENSI?=
 =?us-ascii?Q?i2gGrAFqV973ufebE9EO1pAXmHGF7rGW/Z9AeK44MKXJ/hayQehi8PL2+vT6?=
 =?us-ascii?Q?Tr6VOxGhFg6LDPZL0xtWqZAZUQfChM+tHkvccIPJhO0jwEP28IVDy80aAC75?=
 =?us-ascii?Q?L/XQ2FilKEdq9oVLFrph0w/kC0MGsiWIX/Pw5rDAVpdyni9T1sF0lf9SHrgu?=
 =?us-ascii?Q?3aXJ26zkDnKdp8dpjuglAFF5RbNgD66O2qEnnZpztGIiJPA6svEVIHE26+Gt?=
 =?us-ascii?Q?56woFypz7iQxFyjfFusG2iwPZBOj8XPiQvv0Wxk6si9GuFKtc22dfb7/huft?=
 =?us-ascii?Q?8R2xMMEu2oDxJNauWVdsztzvXlBLgPRNayAP2Dymi/jLKaiF8YnMkNVd9P0g?=
 =?us-ascii?Q?b/2bRfAWnHmN19jlDUXiLaS//2aRMJL48XG1AQtQwy+62g1cXXK1GH2jsXtL?=
 =?us-ascii?Q?kP7BaD5bPqFOMadVKgiIkqzfJNNzCBBf+2WjhIL/SoJE0RmYuNPvJdVJ5bhU?=
 =?us-ascii?Q?h+VSAHYvbnP0p6/Iyf+qp9hNVFOg5GsmOThgD0X2PadphoBk7vBU4s3HsAqI?=
 =?us-ascii?Q?mzikYfRvo7d8oLqcP5cUjj1Ir0bb8bFtL/7RjmdqjGvsIE0DNTj01Q4vLLWu?=
 =?us-ascii?Q?PTq/JWLjKHhTPfw89CdrQj8rt/Um2Jph75o/4oQM58iKYij0w+DY1ArnCLEL?=
 =?us-ascii?Q?7l/Ghzx3LuNcYXmyc+IQBGyaWyM6vJym7sD1A9sJl4qBb1aamrerKoWzb04n?=
 =?us-ascii?Q?rvNUEJSzQGvhE7IHW4N+mTiT5gvNjzrRjg1y7SXRlVVOMS7yu7kbas3076n7?=
 =?us-ascii?Q?cEkZvLTy0avX79f2H8405I1iFLr55tWSrPeWukd774qFY/13w9JcLkS10inZ?=
 =?us-ascii?Q?41+yJdGrNVc9IKCCkopvDlC4HxGKBT1JdaD8xZ0t7lQ8Wztfq/7792va5fDV?=
 =?us-ascii?Q?0KznGeNtWWh/gST4hcj/VwMwFMVu1aPT8p156AYDkeifQRLrshdC/5WtI5rA?=
 =?us-ascii?Q?whIMn6Y/evV2nVJ/FjDFC6R/8g5mvef8IeVQNqZNk6swJTX6DyzwI04zH30w?=
 =?us-ascii?Q?vuT3T13C2OaHrAx5mz83ht0rdXOIfi5xeDLX?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lrVDBxi7rMe+/nm0o5jiKjtOlo0r1BiF7hSo7lv31egPk1gXUEVjdAiiyVEo?=
 =?us-ascii?Q?BUMh/ocZrSwrGoegKFiQL/VtTGqzr5dJX+RK0F5Tftv5dMljuYow7EA+pMKy?=
 =?us-ascii?Q?MAX2oPceuiWVL30GMOtO6OIEMQsAC53OwZ2Crs4s6lSYdwLz+CxPACBWlFLF?=
 =?us-ascii?Q?zAUCZpoqtn+yrVpPe6GBymv/Zwn7DOeGIOz6mF7ccNn7HQDtLc54Nhto1Vne?=
 =?us-ascii?Q?yCKuZV8JIB4ygxPwVUb+R8oxdsaN37Gi9Lb6U+IGnQCjXgF9JY8MHZHw9BrH?=
 =?us-ascii?Q?96K94FENU5mWczPu23eaTR5RrO1bSjeb5owds2+HqwN75UukpZJitxdLMxx8?=
 =?us-ascii?Q?Qm7i/hBjtdhT5HJBYAPutBTXLaRxcC7+mSifjOztm5kD1y/u1KMSwXr7sW66?=
 =?us-ascii?Q?mvoDX6ckx1QVR5eVBz1Nbz6EMuzkhFxx8yBSpRXB2WBPvpuVu6k8/TuZNAVr?=
 =?us-ascii?Q?wZ8MEf5donm6YpGP3ZJDWfYv82Nul2ZxGTKrJ1UjWruHHkH/t3bs5GZLGMoV?=
 =?us-ascii?Q?UMyGvEpkeLNlvAUnY8Ir7qFlXHjrHxHBSQ5saaPgcao8rl3XXzVCxLD99AKi?=
 =?us-ascii?Q?pq6Hp6mTWR2aVYrB5FFEw+k77mO6cYgz/P4/XrFHcWI1ezH7R2XDmrdRHg7Y?=
 =?us-ascii?Q?shjjwX4kqSjSyTVoBb7zNRVqFOPy2PE81nISskRUK6W1y/vT1kjIwBXjba9A?=
 =?us-ascii?Q?DdzKxgLM5mqEqR1h8i/JFgduw3eIzKTmhvI+oI3C9YcsQcJl+/4AcPsib0XL?=
 =?us-ascii?Q?ew0xhWcYsYE4m6oZNAAAxqcW0R7ZplYCtPnDnBWXTMvNqEJJDGeKGFQgpCdN?=
 =?us-ascii?Q?z3b+j333vDm3W/imk3+tvF7aQ1e2FnsZP8QOixWnTqk0zBw7CWs1G3ROdcpD?=
 =?us-ascii?Q?KHz+GFIaojqa8GMjisKuwmnwTzEWcphpxKWKBngYa74eE88azhPjJiU13yHL?=
 =?us-ascii?Q?RYDzvzk4fKBl9esZd1+8yvplsyl9YNN8DyltZ8jKUd4C8KFn5oJMrc+Eul+d?=
 =?us-ascii?Q?LIgYqK9cHqIhspGMwM2jiuqjNxiuhz7JR15oubIoh5s8xNDJnaUMXP4eRQMT?=
 =?us-ascii?Q?bUGyVKraAudaYncp7+pZGR9GGqdMeg6EmSlBAmw7fBJyv11StvNnJHH4/nRt?=
 =?us-ascii?Q?VEGnEJPgsQl8Mp51TxMvOBnxkpaXqaLalRdjRWr3SdWVrDblrLQrEd2X6MWf?=
 =?us-ascii?Q?cIO1Vqxauqv8F+cANGpwQAxVDyF7s5oJu0PaxceDaWMXoi2z5eZzxAKQOb5b?=
 =?us-ascii?Q?JJaHF83Y6acqq5+SIOsjXc72QuSCXv/gMAlaUjD67fLjG/lAocIlN6Di/zpi?=
 =?us-ascii?Q?EqlE3CRmXUiCoRgtfVCzLDz5anuQ5L5RnzpyM1lJvnigN7EacILaIPq8UsXj?=
 =?us-ascii?Q?rjybIzC6lyp3Hw1cITBqDpo5/I4j9s0YGjAFFb2PnbmzZPIqNSuNZzkcVUON?=
 =?us-ascii?Q?CBczvRhWgSRM8clDOiZdgCW9cjSrEZshFizNvlj/Cvv3iw/6FQXBmU/F32TT?=
 =?us-ascii?Q?DGAEVFB9IN2FI8auH53vR58RxVe4ly11E56fK7n8ENLYds4f32yN6FzEe83H?=
 =?us-ascii?Q?KBDc+LYD1a4UDoAn8u6kwXSWGi9zJlgMDbKnEP8FtroQmib4mfE12jqjHO/W?=
 =?us-ascii?Q?ulcpgF2qMzA2YNmLZGy00Ls=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e785977d-3630-479c-1472-08de0ad94336
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:22:18.6722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fgP/1MnoJKWJaHE2kJFivpFqDXy3wz+txFzAaWq5gElbI+x0Gl8/t732RzCGEWT37+aivLZm2F4pKuhAzHeHKTQPPeU4DxvKVLtO2YxBPNZoS/oMwRX2M7hHCpQBdhVP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9449

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
 sound/soc/codecs/max9759.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/max9759.c b/sound/soc/codecs/max9759.c
index bc57d7687f16a..9760543f2922e 100644
--- a/sound/soc/codecs/max9759.c
+++ b/sound/soc/codecs/max9759.c
@@ -42,7 +42,7 @@ static const DECLARE_TLV_DB_SCALE(speaker_gain_tlv, 600, 600, 0);
 static int speaker_gain_control_get(struct snd_kcontrol *kcontrol,
 				    struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *c = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *c = snd_kcontrol_chip(kcontrol);
 	struct max9759 *priv = snd_soc_component_get_drvdata(c);
 
 	ucontrol->value.integer.value[0] = priv->gain;
@@ -61,7 +61,7 @@ static const bool speaker_gain_table[4][2] = {
 static int speaker_gain_control_put(struct snd_kcontrol *kcontrol,
 				    struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *c = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *c = snd_kcontrol_chip(kcontrol);
 	struct max9759 *priv = snd_soc_component_get_drvdata(c);
 
 	if (ucontrol->value.integer.value[0] < 0 ||
@@ -83,7 +83,7 @@ static int speaker_gain_control_put(struct snd_kcontrol *kcontrol,
 static int speaker_mute_get(struct snd_kcontrol *kcontrol,
 			    struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *c = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *c = snd_kcontrol_chip(kcontrol);
 	struct max9759 *priv = snd_soc_component_get_drvdata(c);
 
 	ucontrol->value.integer.value[0] = !priv->is_mute;
@@ -94,7 +94,7 @@ static int speaker_mute_get(struct snd_kcontrol *kcontrol,
 static int speaker_mute_put(struct snd_kcontrol *kcontrol,
 			    struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *c = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *c = snd_kcontrol_chip(kcontrol);
 	struct max9759 *priv = snd_soc_component_get_drvdata(c);
 
 	priv->is_mute = !ucontrol->value.integer.value[0];
-- 
2.43.0

