Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011065.outbound.protection.outlook.com [52.101.125.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FBF35970
	for <linux-sound@vger.kernel.org>; Mon,  3 Feb 2025 06:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738563666; cv=fail; b=QcRxaILga1zqIAqdM7G8GEIUrn9032hVZBLSSqyxIw4b0fXFS+m824vb0yqiWSh1FNTLbFjyzgHSgq+e+MHC8dX6CshIDrKuDWf5Yj19mcojKDKzbkRt9riHIPAobElZfnEw8JrCw3+7A4D46DVaGoQpAcHFeNxyEvnDwHpDl7g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738563666; c=relaxed/simple;
	bh=M7KvZq3HaKsC10kf0x7t26JUqzm2xYQcLuIa0XSM6Rs=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=YKLEuhrk7FaSu/xNL6x8tDmvbc4Hq+8oeh3cozh2mFEyhsxIxXtuHqL2eNVDzAVkFfDkN7B+TqoWWhryfMuyfBJBRtxDuzchHBPY70oRNeGnoeER+PUd3iB4trqXVUgk1xHzSM8rSem5rDFw/onip/2d5CYc7zMFFGf2OJUOruo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=jVdxAAHq; arc=fail smtp.client-ip=52.101.125.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="jVdxAAHq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qLBP/XZUT51js6WN6MfgbNkQUfBmwC2/NyEQhS599nVaCv955HdfrmzrqqYg7ng0qoyfqWpS9mYam/NZAZ7K3CT9zdoLCT20Z8jzfrHQWkrh7chYnO3yVl6CfrUXqwu3m8tbZ+3Dwg7Z0irEHQSm2c4Wf2HEKx9kMlYJ7fDlJBBUKNjd39MormIX7N+1pnwtfaWfqYSfPIk/9jmNOTdVv0RjCJta17xx2XcUzBPoZGLX3bremWrKjzjwZHRnZPV3qUv57/XhuhoERcNJnEaXvyKeCo/Dr310RWkryxMIXDjXqzfZDpTKom1ccVF6VjmboMtyQdQIqnKhXOZMRhqLMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aFlu4SiIrgs35QgDmbrkGCASX3EegmPiHwMNnKIDVOU=;
 b=msFJDtpc8QW1o/9tf+urgVmjBq9gjsU53IGQHmvBm0tt20WnqwAndcnUpdA30ZieODEb2emuB7nuRfxY34AG/K+n710X62F/LXi2xjS5VV1BqqSvO2G3QozmpQjYYd+f7Dc2UZRc/ku0bVtBcDbi6cu4QrVrR+N2ebYGk2BwYUxqQtVBb4W9WaX34zs4+1FbsbTUVlwhkpfkxyYmivxu0PJOMnhXaR9FTCgY3t03UVubCc/mjCWhycCW8s/su8zUycHJtpLoy0hSN+mqOMvAEKtvQrHPq4tPeusZI/vT/QJTUk3QPGCf1dHt0RsUdBL3/ityTxICT5o3YE4nTLFExg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aFlu4SiIrgs35QgDmbrkGCASX3EegmPiHwMNnKIDVOU=;
 b=jVdxAAHq0rjWAK/4xNhbvHYChQxQ8daMFWs5wzPJ6Md/zGgAMj+3SqQ3WxY5Y/gwW6i8iBW718jJDEpxAwzfIjDKgslLai9hvrBk8dB+VsB5YF8+4YOuxQGeo7QZwwptWe0IdEph9RnMpeb24cuIut4x5JQB2pQkGcznPxiqxbo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB11036.jpnprd01.prod.outlook.com
 (2603:1096:400:3ad::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Mon, 3 Feb
 2025 06:20:58 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8398.025; Mon, 3 Feb 2025
 06:20:58 +0000
Message-ID: <871pwfsg51.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/6] ASoC: add common snd_soc_ret() and use it
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <8734gvsg5i.wl-kuninori.morimoto.gx@renesas.com>
References: <8734gvsg5i.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 3 Feb 2025 06:20:58 +0000
X-ClientProxiedBy: TYAPR01CA0236.jpnprd01.prod.outlook.com
 (2603:1096:404:11e::32) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB11036:EE_
X-MS-Office365-Filtering-Correlation-Id: f8f60c2a-6dc9-4577-9c2c-08dd441aec82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IgPHnRpmxP2lJk/wHv9rx8j7QgCm37Nrdb/AQN9BalgLFEkUeKEUb7yk31FA?=
 =?us-ascii?Q?BZH1XzV3G4GBeyOEtm5xmGyMEwC514s31P++miK/fUZVhm2RwmorztE9OH0v?=
 =?us-ascii?Q?/NViXdLBP3Ptih3eTNoeGFRb3/U+6pnKGn+fUQRZ0dk7sB3yQqDOO5QKVVz/?=
 =?us-ascii?Q?gasYaXI6LS32RHRNOq+IuUna22w11WfaFOu9aww7fAGvUoOB/UU3VDGjvVhH?=
 =?us-ascii?Q?1fvM+gutEbVPdVX6HEHDl9+Z1KQF7yJ5Lk3BT4cwgRxkomScoq2KyYh7kN9l?=
 =?us-ascii?Q?8Pe4MYKweOyORhDCWTPKmBb1gXDhqn2YE+C+NJa1bnKe2P9DTos2DC+zm80H?=
 =?us-ascii?Q?ItqE9QA28mgJkAWutwZFrRJzPioEz5wUKL8Yvnk95r1jAnStYeu1hAW75LvC?=
 =?us-ascii?Q?GgaxYEAHtyhS4o9yKrrm5psOUF70RRmQSvvIiliQ+XCsDbyTngyfCoVDu/cM?=
 =?us-ascii?Q?SlUZnygtfnsJhWJouxnk4XBUSpqe2/F+6ikmZxN3pvHB3PCYO4B/P+7hkz9q?=
 =?us-ascii?Q?y7lBCaZgLXNZHUGkuO0KsOAfiydJ0QUbhbH9aSukk3oL6HeM4Xt0MGyNJqpn?=
 =?us-ascii?Q?wPfawBTTa+A7X/Kki1JoyCSmLMAoiQoDNXtnXrVHCZLURkacBV/jTYQQQeNT?=
 =?us-ascii?Q?c7O36nII5P3BHBlUirM6BfK7hXxzi72qez1za+C2OG1y+iq8oATcBP/XXLMa?=
 =?us-ascii?Q?PyXphbbKIYIDSfKwoS8VJ8/ZQFxb/4PPEtImNtD9n2JLrQfkYrNa+ur8d8mX?=
 =?us-ascii?Q?7Y2f7MO1ihmb2m6LGVQAoCdj8w4fjc44nXnTkcTQ2SNUrcd5C2LCuq/HuNfK?=
 =?us-ascii?Q?Mvdl6PHMVsa0EA/9RSZOYfKgWZTwhs70r5eKu8oiio+MOcizMgdvBmWW6FtT?=
 =?us-ascii?Q?vtloXr8uEs7V1kmbDPBPAO7YiLC8Hga4efxBiGjaTGIRnDeoGdF0o8mHyd6V?=
 =?us-ascii?Q?QwSOFoBb0k4I02LJiwdfgIGbe5dyt2h+9IItJcGUXyNNbDcZgnLItfMw3K9u?=
 =?us-ascii?Q?iJHZK1OYM5okg3bb+pNTx8LWvYFLPBe0SxBKjYGqGi/tvH1mtl9dfS2uvL18?=
 =?us-ascii?Q?cVNYUkF96Tc4gPReQXeRIu/EGFmfxJvGaezSgSTCD8XUDZ5c09c6ZjWE5Zo0?=
 =?us-ascii?Q?42XIm+XnopJ4qaR5fXYNHkngiAbTFAr+eVJEsrJu97/ASqALu56dSa8Y0mKo?=
 =?us-ascii?Q?qTWIB/i7ShMifU1lq+xjsMAzK4ben/8eFlPr1ChUV1Sar0GcH3DcuAeIO0Jp?=
 =?us-ascii?Q?DPw6MJ7s8v1PYlxC2Q0jAQscj5RPt3JMNvxHvyBgPLCu0B8bkRfoiI/mOtJR?=
 =?us-ascii?Q?rYl8nX0pU3iGsBM7doUSHjEZy4bytB20ichzdMC9yOWnFGyA+elTym0Z4hMd?=
 =?us-ascii?Q?BNPd3wE+v7oVO8KSySoyE0ynAObr9AkX2AzVB5pLw5i54NgqJr5/k5g82l0z?=
 =?us-ascii?Q?pLxb+rPbbE3epEB3MbP9ffYYb1axmVh7?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cq0P+ClXN+lxPiFDnl7ZnRU4Yhi0W/bRI2aWoOtl6mJWVpm0W2pqNrHvRwfo?=
 =?us-ascii?Q?E+vu4774ZlyqYSRKwCKoMn60aDDnSYQKemr/MDRJu+4J4h7mORMhmKE/7E61?=
 =?us-ascii?Q?v0HX8cyu6LXzam/vp1zoV2qa3ShKIhUipqVs+iuD4O7rmCCvClJKRB8Ss0lj?=
 =?us-ascii?Q?mVJjHPK7wf1P2R38o5sov80jLvXKMpgsBRRTbkuidrXNP0WSGQZdw4Xgsm4y?=
 =?us-ascii?Q?S/EXU2N7/ftIMqggppDM8b3q32XGMA9Z0lx+0Sbk5AnVoMwE0a+WpsrLHngQ?=
 =?us-ascii?Q?OpdPWdT28xfu3Cxf0EnlY06fCVuUAfryzrW4JRYHRG9E/LqQ8PMWLVBWGQ04?=
 =?us-ascii?Q?zD76+JXUwcneZxKZyhCWGmnPSSdYCtP5sQN2AHUoQhrx+BwdC9a7Hwliv0I3?=
 =?us-ascii?Q?xLOhtvlniHqV8MZfIT+CAYfDccIgBc6spBca3YMJxS6ScF4e03sTYvupfTnn?=
 =?us-ascii?Q?iRfv9G2uAq3aQOv5B5DJjZ3QxKBm0xdHR3D7K2k/pjNek4RG1bxcDUJL9cQt?=
 =?us-ascii?Q?MeH9cgbRsFUsyKdEpOhQryHh4o8y2dPcFgU2fVK07QZHgFH9yQTQFd6wOCay?=
 =?us-ascii?Q?K3U1bV1EMv2NS92QB5aYyZSf3+pfnpbXNbf0i+fjJ/bZnfII9aT5NKsf9Yup?=
 =?us-ascii?Q?A2pgM4slMHet7knY1lXLuuqsL54i1BDIORCLFH2creeCZkYf3BnK3jkXiyqQ?=
 =?us-ascii?Q?W9OEz7usymtxbozE2sZeLnTNqq8M3xTY5l2MDFbkz24bwQZEXsIML94Nz1ky?=
 =?us-ascii?Q?hG9AiBJQzHku6VVtHhhwVlh35n09/y1gvHKhN+cHS6vlhQJ90KIBVD6PRfOm?=
 =?us-ascii?Q?Jd2HdKSJKr3lUnZBEjvjdQKCz38n7bbHzaoUZJJs4UWmIZhaVAHvZmPevZoB?=
 =?us-ascii?Q?gKnUcG3iF8BvF3br79vnuGLwgo4e75TluN1g0Ew6RzAnIiimftr6IKqiBj7H?=
 =?us-ascii?Q?vJ14cIlJ+iPI9Aa//oE9wVZlpycPt1t4mJsRqpjPkuiAAqUzFhv/ojGzL+Iz?=
 =?us-ascii?Q?5tdlXf8ebM6uZjoS5+W0ynAWAhgZjl0HspOYag7NzcbjgGR5ZZLTwKSym+13?=
 =?us-ascii?Q?1E+dPqClh8KQz4fI0nNeCkV+q6nkVF9n/ZYZ7kv6VRs618l+gk57RQB07f9Q?=
 =?us-ascii?Q?+vE7YZRc2Ui7x2D7/w+Dl4IUpOAVxG0mPFZyfMJGZKpjoNnzbIIriiJKlqKo?=
 =?us-ascii?Q?avDq44fqSALaLQeaazQMRkrhfNYJx+oznVC62k88AYq47C7kOqWJPMXzPSWM?=
 =?us-ascii?Q?yEoDAdPw96Ua+rlUVXEo70MZkkV4iAmzq1weu86DgXxn6B4fN+9u/UTLhdBE?=
 =?us-ascii?Q?1YGz/wDIfxbUMPhYv1qykNTma3ZGsNJvdgqnI0xxwYUvYOHUNi/Mve3Gy4S9?=
 =?us-ascii?Q?vwS1j4QXHdx/rvvEY3iTObz00myOs3r2WBqO/6P3m3hvXUsbFcG/dVJJp+kx?=
 =?us-ascii?Q?eo68Fx2+5HPCPwLK9lZmxFy6nmbb+OhtkOygtYCezTnzolifZZPGOng7lRfq?=
 =?us-ascii?Q?f8AFd54tM/iz2XdfDITDEs1W61LTRus0WvCvAT4URfEQherS0O1mnz7mGSYL?=
 =?us-ascii?Q?xmUDoG2YKxewBsZI1UydJ3PG3f4cOFEmY+kK74L40WtjQye9Ir9IWX0Tn/HK?=
 =?us-ascii?Q?peC7qVlqhp93Pm1uD/1aDEc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8f60c2a-6dc9-4577-9c2c-08dd441aec82
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 06:20:58.5122
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eumGLzEzcLMaHYdQ8eMd5+ujuCC9ei7gsF3F+3fTiiv3WsycQaZWFIxsOMAmbGMC+eHAZfDAtPjBX4TB0gHlMc7Vse0dvZe3beEYj+/WdtZhGNoxM9vGtXgTkn9yeoY1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11036

Each soc-xxx.c is using own snd_xxx_ret(), but we want to share it.
Let's add common snd_soc_ret() for it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc.h       |  1 +
 sound/soc/soc-card.c      | 14 ++------------
 sound/soc/soc-component.c | 38 +++++++++++++-------------------------
 sound/soc/soc-dai.c       | 18 ++----------------
 sound/soc/soc-link.c      | 18 ++----------------
 sound/soc/soc-pcm.c       | 18 ++----------------
 sound/soc/soc-utils.c     | 26 ++++++++++++++++++++++++++
 7 files changed, 48 insertions(+), 85 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index fcdb5adfcd5ec..16e4e488521c0 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -539,6 +539,7 @@ int snd_soc_calc_bclk(int fs, int sample_size, int channels, int tdm_slots);
 int snd_soc_params_to_bclk(const struct snd_pcm_hw_params *parms);
 int snd_soc_tdm_params_to_bclk(const struct snd_pcm_hw_params *params,
 			       int tdm_width, int tdm_slots, int slot_multiple);
+int snd_soc_ret(const struct device *dev, int ret, const char *fmt, ...);
 
 /* set runtime hw params */
 static inline int snd_soc_set_runtime_hwparams(struct snd_pcm_substream *substream,
diff --git a/sound/soc/soc-card.c b/sound/soc/soc-card.c
index e6eb71b3010a8..235427d690617 100644
--- a/sound/soc/soc-card.c
+++ b/sound/soc/soc-card.c
@@ -15,18 +15,8 @@
 static inline int _soc_card_ret(struct snd_soc_card *card,
 				const char *func, int ret)
 {
-	switch (ret) {
-	case -EPROBE_DEFER:
-	case -ENOTSUPP:
-	case 0:
-		break;
-	default:
-		dev_err(card->dev,
-			"ASoC: error at %s on %s: %d\n",
-			func, card->name, ret);
-	}
-
-	return ret;
+	return snd_soc_ret(card->dev, ret,
+			   "at %s() on %s\n", func, card->name);
 }
 
 struct snd_kcontrol *snd_soc_card_get_kcontrol(struct snd_soc_card *soc_card,
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index b67ef78f405c3..25f5e543ae8d3 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -13,32 +13,20 @@
 #include <sound/soc.h>
 #include <linux/bitops.h>
 
-#define soc_component_ret(dai, ret) _soc_component_ret(dai, __func__, ret, -1)
-#define soc_component_ret_reg_rw(dai, ret, reg) _soc_component_ret(dai, __func__, ret, reg)
-static inline int _soc_component_ret(struct snd_soc_component *component,
-				     const char *func, int ret, int reg)
-{
-	/* Positive/Zero values are not errors */
-	if (ret >= 0)
-		return ret;
-
-	/* Negative values might be errors */
-	switch (ret) {
-	case -EPROBE_DEFER:
-	case -ENOTSUPP:
-		break;
-	default:
-		if (reg == -1)
-			dev_err(component->dev,
-				"ASoC: error at %s on %s: %d\n",
-				func, component->name, ret);
-		else
-			dev_err(component->dev,
-				"ASoC: error at %s on %s for register: [0x%08x] %d\n",
-				func, component->name, reg, ret);
-	}
+#define soc_component_ret(dai, ret) _soc_component_ret(dai, __func__, ret)
+static inline int _soc_component_ret(struct snd_soc_component *component, const char *func, int ret)
+{
+	return snd_soc_ret(component->dev, ret,
+			   "at %s() on %s\n", func, component->name);
+}
 
-	return ret;
+#define soc_component_ret_reg_rw(dai, ret, reg) _soc_component_ret_reg_rw(dai, __func__, ret, reg)
+static inline int _soc_component_ret_reg_rw(struct snd_soc_component *component,
+					    const char *func, int ret, int reg)
+{
+	return snd_soc_ret(component->dev, ret,
+			   "at %s() on %s for register: [0x%08x]\n",
+			   func, component->name, reg);
 }
 
 static inline int soc_component_field_shift(struct snd_soc_component *component,
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index ca0308f6d41c1..7c4c9127e5f3f 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -14,22 +14,8 @@
 static inline int _soc_dai_ret(const struct snd_soc_dai *dai,
 			       const char *func, int ret)
 {
-	/* Positive, Zero values are not errors */
-	if (ret >= 0)
-		return ret;
-
-	/* Negative values might be errors */
-	switch (ret) {
-	case -EPROBE_DEFER:
-	case -ENOTSUPP:
-		break;
-	default:
-		dev_err(dai->dev,
-			"ASoC: error at %s on %s: %d\n",
-			func, dai->name, ret);
-	}
-
-	return ret;
+	return snd_soc_ret(dai->dev, ret,
+			   "at %s() on %s\n", func, dai->name);
 }
 
 /*
diff --git a/sound/soc/soc-link.c b/sound/soc/soc-link.c
index 7f1f1bc717e2c..02fd68f2e7028 100644
--- a/sound/soc/soc-link.c
+++ b/sound/soc/soc-link.c
@@ -12,22 +12,8 @@
 static inline int _soc_link_ret(struct snd_soc_pcm_runtime *rtd,
 				const char *func, int ret)
 {
-	/* Positive, Zero values are not errors */
-	if (ret >= 0)
-		return ret;
-
-	/* Negative values might be errors */
-	switch (ret) {
-	case -EPROBE_DEFER:
-	case -ENOTSUPP:
-		break;
-	default:
-		dev_err(rtd->dev,
-			"ASoC: error at %s on %s: %d\n",
-			func, rtd->dai_link->name, ret);
-	}
-
-	return ret;
+	return snd_soc_ret(rtd->dev, ret,
+			   "at %s() on %s\n", func, rtd->dai_link->name);
 }
 
 /*
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 88b3ad5a25520..a2caa146cac2c 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -30,22 +30,8 @@
 static inline int _soc_pcm_ret(struct snd_soc_pcm_runtime *rtd,
 			       const char *func, int ret)
 {
-	/* Positive, Zero values are not errors */
-	if (ret >= 0)
-		return ret;
-
-	/* Negative values might be errors */
-	switch (ret) {
-	case -EPROBE_DEFER:
-	case -ENOTSUPP:
-		break;
-	default:
-		dev_err(rtd->dev,
-			"ASoC: error at %s on %s: %d\n",
-			func, rtd->dai_link->name, ret);
-	}
-
-	return ret;
+	return snd_soc_ret(rtd->dev, ret,
+			   "at %s() on %s\n", func, rtd->dai_link->name);
 }
 
 /* is the current PCM operation for this FE ? */
diff --git a/sound/soc/soc-utils.c b/sound/soc/soc-utils.c
index aa93e77ac937b..e8958158acc11 100644
--- a/sound/soc/soc-utils.c
+++ b/sound/soc/soc-utils.c
@@ -15,6 +15,32 @@
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 
+int snd_soc_ret(const struct device *dev, int ret, const char *fmt, ...)
+{
+	struct va_format vaf;
+	va_list args;
+
+	/* Positive, Zero values are not errors */
+	if (ret >= 0)
+		return ret;
+
+	/* Negative values might be errors */
+	switch (ret) {
+	case -EPROBE_DEFER:
+	case -ENOTSUPP:
+		break;
+	default:
+		va_start(args, fmt);
+		vaf.fmt = fmt;
+		vaf.va = &args;
+
+		dev_err(dev, "ASoC error (%d): %pV", ret, &vaf);
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(snd_soc_ret);
+
 int snd_soc_calc_frame_size(int sample_size, int channels, int tdm_slots)
 {
 	return sample_size * channels * tdm_slots;
-- 
2.43.0

