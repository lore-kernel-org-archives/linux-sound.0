Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.5
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793156617;
	b=sOBzZE/N4pKA5YbZDyGGC+dO2UKAhUrbV9eKduTZocQ4WSveTntcZ3+KTBRzSvBdWBSh
	 sDTzAEGTm236hLFFD4kmO8JDv3O++/4GB5nRaOm+c1aLOvGj2qH1UsS/T5nOViOigL9c7
	 J4NlcEJdlDQ94ZaZOlvwgr6IdUzcd4Wapgq8SoB/aHsjexaLgOqiLa9Xdp56l8eaEFkpJ
	 EXBE+KqennxFfzVTg4Bq4kNC/1PFoz5SkVedRpqVGHdRJSpwN+12IqoKOBQN0wDIVXKUW
	 xdpG+NpMYfYkZ6xp7Tf+6CbMpxFQWEqDjjDDeHZAFhkEstjcNnR2F+/VI5Z7j0HmsJQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793156617;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:From:
	 Subject:User-Agent:To:Cc:In-Reply-To:References:Content-Type:Date:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=6uI5T4UVoPkZx4uImwXTFY4n2jEyh0kPzIJZqT9EzHU=;
	b=tzsartr6T+h2ngsxQ46m2YBelUsQ+Cz8GuBaqHEF8PEJ2c94vAIP5GR2bDKHKw70dIQ9
	 3dLSxnpjWxckS8NPI7EPHyuj67LXzkbY2t8N1mEI0GTc7+gI+hpbMKrDw4MWytZD7TeQO
	 0E2l27qmW7AlDZ7dpn8URdVnTXqFkCW4tq6XH8+OtX9Km+DVYCDcOP2TJmqEz30hJlOmU
	 WXJ0H7L753ZBQ0X5YlVX2dbJE+CJq2B9/gZToXbwYd6gvhwhwFFdRwkcTOJfV1qI45WEp
	 rA0NNM5MTiJqR9fpie1N0IdA2kqk+b65CTlLSI/YEe38QuICixWdidk/SFkg40zggTA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b="jz/dYCHH";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.5
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011005.outbound.protection.outlook.com [40.107.74.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527BE606A320
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 03:03:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 527BE606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=jz/dYCHH
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kx0mFQLUxfqDHuWtC/oJNznG9YWojrQz2VfOfOPsDiEV7f0gblLyDEKWrtXd2/edJuov2qdevzwFVUsw6oZJAn9G5r07sfmbxucLrIoTk3lPT3Z5lu4YJu399RTiCNxcqB/Cgv7t2Cul9ak4dxk+BbdgKQCrIP8kUN7e0Fvmo8tiaFY33eauD980JSPGAoqkOpdqYOmjhg6b02VeRtbQSbdM+GNiplO0+6GD+lZNNaY9vrYtYHaoP8oOlAk4eFAoj+8kQxr8eSzHo1eKVX+heh1wtOlsE0SVdEUhn0ykWgjTeIABkVuzdBybWuUJNKBH9cmAFgezEx20vDpLsR+rZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6uI5T4UVoPkZx4uImwXTFY4n2jEyh0kPzIJZqT9EzHU=;
 b=vCxRYJ2EmY+dvgaUqqHnzuq8XtzjGQ20+7AHZOMkBP2F9yd9Jxe2EzYyIf7j2UAHTUS0orOGBOrR6udmBmVGdrfntRN1gRTGiIRHPqE7QT2x0ypuXTF8SLv4MttYyQcii37fFFEY5cTUxRmlr+ytMxVCJhfSXGmsit2d2Dd1ckg3GLh0hAAcfABDGtDcr4qkSD4DQ5khFzpV2+I4xUH45PuD8zb0StbktOTXj9Ustp/JpgQzfy4gD51r+ATZnAurxofMfCD92qT7HUz22AhQ7gXOLBsh2gP9YyuHmTz0cH/9+1q1UpNo2HflcV/Z1f8ZVO3qdO27vShR9vK+UirvMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6uI5T4UVoPkZx4uImwXTFY4n2jEyh0kPzIJZqT9EzHU=;
 b=jz/dYCHHyDaSHaFE/oiMc1Z3Qr9K94t/fCsO9gyQ/qI4PA+u3Im5Zq9XJpDXgs9HmMoPx+oNmHmov5UWWfQKHfcz+aiiuUItj43swusowb1/3e8V0H1S+AKeI+4qOyJMk0SFkIPYksZ5TRyo22a1UytnUirKA9E1pjsNhsqYgNk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by TYYPR01MB6650.jpnprd01.prod.outlook.com (2603:1096:400:e3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 03:03:34 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%3]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 03:03:34 +0000
Message-ID: <871p9attkq.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 07/15] ASoC: soc-card: move snd_soc_card_link_dais_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87bj8etuj5.wl-kuninori.morimoto.gx@renesas.com>
References: <87bj8etuj5.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 28 Oct 2026 03:03:34 +0000
X-ClientProxiedBy: TYCP301CA0063.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::8) To TYYPR01MB15175.jpnprd01.prod.outlook.com
 (2603:1096:405:27d::8)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB15175:EE_|TYYPR01MB6650:EE_
X-MS-Office365-Filtering-Correlation-Id: 3569883f-cb8d-43b9-c56d-08df34a00dc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|52116014|376014|261009223027099003|261021121427099003|261021123027099003|261022105027099003|261009221227099003|261022075727099003|56012099006|10067099003|261026140227099003|18002099003|22082099003|38350700014|261026121527099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	IJROx+PXbhqL6g5rGLtoERLPhEtg5EsdHWcWJKGsBShj30f90SLtYFtxwHuWAoJBgX6+QeGrywXb8sQ/v/UIgHE0ouf+5DHPhfIXOtjZ7UfrMD7BmRqlyI1gksTWN2QhwhEDwBdDZigQSGiXnr3zAjOsjxSs4PS4sKGhGhOluhGCydU37tmDL36x7VVUeb6o4wzfXLNH5Bt6pblZ7+AhGgGK2PA4ZyDuQsWv/XXYsBSOiBTzn3aolQYAQMjAd+TjJPL5TmIhnv+VWDLEoqBvmZ0bf9YFd4QP2eliSc7UHbgxfMvNVNiJdTYTNppHa0PQr1DFh9svieI1uoA4IXJWPwNBvaIdVHhUGMEbi2frRx5JhYceOt8jIB1vciTxMP0lRdsLrD2wMGI37f6CmmtlShG3v0y2N3IAY43o2Dks5gsrqhbcG/QD3bIO2F8sIcU+9IlIofwhUzotfpJMEndXbOtcJ3CcaeM+r8bfFYn17RrJfkabhufsSyBZlbBk/PiPd9acTA0Ilw2Hs2VLJAW3I0mWkhi8r3UbYGpdj0kCDx28e5c2xe+v3QQvZPoJXZtcUAj3wFezS5033VakqGaMmaqu+KfQfBVMy6nDWeeUvEooyIbC4di79Th67hXA/7JK+i2c2AwZSY6mdIa0Bb48HXsaVNAfvrWjS2YuTqqAGaQYBe2N+nONHYEBTm09uFY/8Y1ZfpmdZFWIsUopfRFIP9aTS4kFEAlDIH4hvkqejS0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(52116014)(376014)(261009223027099003)(261021121427099003)(261021123027099003)(261022105027099003)(261009221227099003)(261022075727099003)(56012099006)(10067099003)(261026140227099003)(18002099003)(22082099003)(38350700014)(261026121527099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iitHXRkv+RDTU9OEBM9nGA+J1pvM6DLTvwL40U+CZaAGaoc5vzWm2O9ROzkx?=
 =?us-ascii?Q?PeqpugI+dkn/zQ2U8EyjAaxThbc8Lp3X3Urq3agNsde+dnP4YNwEq9knJoAc?=
 =?us-ascii?Q?EJ6w2eB8bhC3kg4QbFJHZZzuvwgjSeeC3ZJ42F6tDix9J0vWsis9xszHW3ZX?=
 =?us-ascii?Q?MGD153BB0nFbO/OxxmxtVPkr+xKYENodDgtAF7mIK3MpQ5HVfTlOKZHrSem7?=
 =?us-ascii?Q?piYqgrsT1LqKZVz+o/HKvmhHONx8/Gua/v+YQhGhiSDOAbgNCPhYLYIB5kfi?=
 =?us-ascii?Q?paAqP5WT9+4/o4Kwwz8wu96WwhZGSxyKGRg0ttnnhRml6xLvm4JZrHuTtCfD?=
 =?us-ascii?Q?eDMSPBlpIesuIkm0ASudUgyzLTI0q8w1Axf0L0Io0wkySuCSrdx2asd6HA7M?=
 =?us-ascii?Q?Fj8Wct4dr9iuTN673iNaUp3M5uBNBOVf7Y3TyJ5qW4kTeiX362auQ7Mt/gw7?=
 =?us-ascii?Q?1q3KgGnbuTDd3wJLsvGPE6/PJEIULRp7aogpxwxjKG2y9R9Vost5zX5aMQOJ?=
 =?us-ascii?Q?U0KLJ0XQ1dEP9UMjA3TqqUZIZGIDHHZcohMDv7I3uYNhcq2oOEGXRk6dbFZq?=
 =?us-ascii?Q?mh89vj5lW/0Ly7aHadqDfIHk/ymjKa2Ntff0DMj4Dqlr8pYl6+W4GEsCDmkE?=
 =?us-ascii?Q?VbajRRgmnT3sI5hfTu5kz0GohIo66EeZLjnZnG/BJIy6tkzYT/Vru3O5dDQC?=
 =?us-ascii?Q?nDxobG0TYGrxgOXK+VOj+C5Y01UwpwvxKLEMpDykzkOyX16yS0dD96z5cRk3?=
 =?us-ascii?Q?9k7P8axVeXIz0tS8bEZqOZQ6ttrlpiy+zFF6HRoS7ld742BgzqYNrDfXtNrF?=
 =?us-ascii?Q?RqP4xx0VR68n0zHeO2FNIpFrCUdosFogLCAc//A3Ebl8/o9gIHB6WmsdflcV?=
 =?us-ascii?Q?1byqw5wbgQF3yKBjPU/ChKChk2BTag6nal5jJA5MPyPm5tlG4N1yVi6yhxef?=
 =?us-ascii?Q?/zCYM8kUAb9t1ZNKsW0E9tFT+qLC3uftAkMryUOlpPQaNFdlYm8inIUVi8aT?=
 =?us-ascii?Q?NjbBCW206sI2BNzWL6c6k/3k58ZNfN8gelN+vSbfveiWmiT74SPuQSSbW1UC?=
 =?us-ascii?Q?1R21XB9/XEF50Wrywyya+12D2iuwrXPM8a8G+Oz4nYeUIoGKwbWqp7ggI4cd?=
 =?us-ascii?Q?c3NDWqtm2JQYIak/t+E8tPonAjJ1R1s+uQI5DWazokECCfzrJEtjHGFWAWI2?=
 =?us-ascii?Q?6bZwRn9LSf4Jtlx8vtbgOlQlm2HkkYMAooFcZD5oLcU3OiS3S5U3e/arMMYd?=
 =?us-ascii?Q?TDnCPmzqAaO6kO7T4DZFErhFNGfIfue8JUMJLem1h/+ZHqnui5376SBgUi/V?=
 =?us-ascii?Q?tENnQSzgIlydWTmy5t0IquazXKVS3Vc0x9a21/cq58PHT1IK3MtIxcT9ttZM?=
 =?us-ascii?Q?kb+UbDst60pfhN1Dx5x5J/UwSSDEVR8P1tZbUEAsTDUdxBWIuEGktQce+rB/?=
 =?us-ascii?Q?fK6KotAL2yDFzhSWl/nArjJCIGRtorsUucACJ4aM3liJJyuguvMzggVBiMhR?=
 =?us-ascii?Q?hm+yV6QOCnlDJGnnYs/IDDgYLE0LQuXULs+/FMFX823lxpB2flthTk5khfKN?=
 =?us-ascii?Q?VpDlf5ExzLSje6KH41An/S0UeYalxmTx5YNj4EQF43qfIwNY/PXthZlLv2H8?=
 =?us-ascii?Q?GLMDa5mK4rUuFvO0ah0mmJqKYj/+1DniTuD8fcVSipKmz0DcuxIz7uoVl9sB?=
 =?us-ascii?Q?xjvUYdfgsZ1LAJtW7QJFfj0yb4YcCQrf9i9aDJ9mW5+OJobLVBtfsPJw6bdl?=
 =?us-ascii?Q?gBZQ16UTiXpQTDTPqN0wmd5ZVc136mXkoS7A5lj22OhZYQlD2r21?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3569883f-cb8d-43b9-c56d-08df34a00dc9
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 03:03:34.2144
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WGjGHYF+Qq68Wn8AFfGyA0EywjdkmidPu8CBUHJgfqJPch57aNZmowz1RYkfB1XWa0Q6rncSKjVDOhClraJLWIAcVixmmDp/nYJxvcS6bZTRvI+d0yNFPieiNb6ofjbg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB6650

struct snd_soc_card will be capsuled soon, its member will not be
able to access from non soc-card.c.

It has too many local function dependencies.
This patch uses temporary funciton define at soc-internal.h. It will be
removed all funciton were moved.

It renames function name
-	soc_remove_link_dais()
-	soc_probe_link_dais()
+	snd_soc_card_link_dais_remove()
+	snd_soc_card_link_dais_probe()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-card.c     | 30 ++++++++++++++++++++++++++++++
 sound/soc/soc-core.c     | 34 ++--------------------------------
 sound/soc/soc-internal.h |  2 ++
 3 files changed, 34 insertions(+), 32 deletions(-)

diff --git a/sound/soc/soc-card.c b/sound/soc/soc-card.c
index 405d88e57fcbc..1d16cd74eee90 100644
--- a/sound/soc/soc-card.c
+++ b/sound/soc/soc-card.c
@@ -166,6 +166,36 @@ int snd_soc_card_init_pcm_runtime(struct snd_soc_card *card,
 	return ret;
 }
 
+void snd_soc_card_link_dais_remove(struct snd_soc_card *card)
+{
+	struct snd_soc_pcm_runtime *rtd;
+	int order;
+
+	for_each_comp_order(order) {
+		for_each_card_rtds(card, rtd) {
+			/* remove all rtd connected DAIs in good order */
+			snd_soc_pcm_dai_remove(rtd, order);
+		}
+	}
+}
+
+int snd_soc_card_link_dais_probe(struct snd_soc_card *card)
+{
+	struct snd_soc_pcm_runtime *rtd;
+	int order, ret;
+
+	for_each_comp_order(order) {
+		for_each_card_rtds(card, rtd) {
+			/* probe all rtd connected DAIs in good order */
+			ret = snd_soc_pcm_dai_probe(rtd, order);
+			if (ret)
+				return ret;
+		}
+	}
+
+	return 0;
+}
+
 struct snd_kcontrol *snd_soc_card_get_kcontrol(struct snd_soc_card *soc_card,
 					       const char *name)
 {
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index c1d64892f3876..e3664cbe67059 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1076,36 +1076,6 @@ int snd_soc_runtime_set_dai_fmt(struct snd_soc_pcm_runtime *rtd,
 }
 EXPORT_SYMBOL_GPL(snd_soc_runtime_set_dai_fmt);
 
-static void soc_remove_link_dais(struct snd_soc_card *card)
-{
-	struct snd_soc_pcm_runtime *rtd;
-	int order;
-
-	for_each_comp_order(order) {
-		for_each_card_rtds(card, rtd) {
-			/* remove all rtd connected DAIs in good order */
-			snd_soc_pcm_dai_remove(rtd, order);
-		}
-	}
-}
-
-static int soc_probe_link_dais(struct snd_soc_card *card)
-{
-	struct snd_soc_pcm_runtime *rtd;
-	int order, ret;
-
-	for_each_comp_order(order) {
-		for_each_card_rtds(card, rtd) {
-			/* probe all rtd connected DAIs in good order */
-			ret = snd_soc_pcm_dai_probe(rtd, order);
-			if (ret)
-				return ret;
-		}
-	}
-
-	return 0;
-}
-
 static void soc_remove_link_components(struct snd_soc_card *card)
 {
 	struct snd_soc_component *component;
@@ -1503,7 +1473,7 @@ static void soc_cleanup_card_resources(struct snd_soc_card *card)
 	snd_soc_flush_all_delayed_work(card);
 
 	/* remove and free each DAI */
-	soc_remove_link_dais(card);
+	snd_soc_card_link_dais_remove(card);
 	soc_remove_link_components(card);
 
 	for_each_card_rtds_safe(card, rtd, n)
@@ -1623,7 +1593,7 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 	}
 
 	/* probe all DAI links on this card */
-	ret = soc_probe_link_dais(card);
+	ret = snd_soc_card_link_dais_probe(card);
 	if (ret < 0) {
 		dev_err(card->dev,
 			"ASoC: failed to instantiate card %d\n", ret);
diff --git a/sound/soc/soc-internal.h b/sound/soc/soc-internal.h
index 2b4beca5f9e5b..e95b34a7869b4 100644
--- a/sound/soc/soc-internal.h
+++ b/sound/soc/soc-internal.h
@@ -23,6 +23,8 @@ void snd_soc_card_resume_init(struct snd_soc_card *card);
 void snd_soc_card_fill_dummy_dai(struct snd_soc_card *card);
 int snd_soc_card_init_pcm_runtime(struct snd_soc_card *card,
 				  struct snd_soc_pcm_runtime *rtd);
+void snd_soc_card_link_dais_remove(struct snd_soc_card *card);
+int snd_soc_card_link_dais_probe(struct snd_soc_card *card);
 
 /*
  * In soc-core
-- 
2.53.0

