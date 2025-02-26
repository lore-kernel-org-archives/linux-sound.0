Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011030.outbound.protection.outlook.com [40.107.74.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE5F25FA23
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 23:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740612654; cv=fail; b=lhOtufglcF9MjL/ZIiJEWVhXK+4eWXwdGqx9UWVNt5hDDLGeOslom8+WEopFt5UIsUogudol3eIX2iZCuvGwqsQb9STBycj7yeLCanEt3quwdtdjmV606TApkHwsF82BJIqmzPYHB3a9Jk+NCL3Kx2iEqzEP92oC859/uXHXAP0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740612654; c=relaxed/simple;
	bh=f6/3kqMkRZUv0VhmdLcnEx8Jp6hNbMbl9j17DJC+4CU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=WqsT9OYUPCMRb7qhj4WYbsOYlqWBrfS/VTSeX1VUclcGxVo5NCk1ABhSM1GQ0NTk3pPl1odlrbr/AYLz+g20af67XaQ/DfJMi1YOKeehKWHc7k7F2GHP5QQwG5AXc1EelCmEYsQ+qOnu4RNdTx3ljESLOY131pGI/gwf/1wJPvs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=i2ymuSbZ; arc=fail smtp.client-ip=40.107.74.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="i2ymuSbZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hkQT1ezopR3o9ndBvKqdl5Jdn48LBh1zogY7STgpAGmnd3tAGAqqg8JUnqB1DxbVw0of4SC+nI5spme5IPMPUvYFq4bnPNKQ4crO/iPZYJKtStEG3P6Egd9Ta5dl+JfQ2Ix91hJBhhQJdQgZlsJYtow5xpzUQSuc/mCGc1rWOdYczDRNmTBF9Z+2oajcpyTcbb6Ti3n1fUyge3KOj7SzCMeSWmGhIA64oQeeDU1i9M21jfW2CWSGWEZNJOqOzbuba98caa7etioAm88NH00hpVdVLdWxDpI5J2TLtSW2w7+yccK0eBiKSUv2vZ6/U5FCn6efYgdsI7tqy0KBxyqVmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gHT/SqCCc+cYRl093k52QPh4h8Xb6oO/67PUD46QT8E=;
 b=bsEa9LAfT35Gb/zuXQ4d6HiPtXLGCZcXxACwz694neALTM8ohbxtblBqrpbq8DRPrzyQJ/YSMuPpEJahtekO/cQUHHW2cof2FsvsHdTR6RQi99AnYLP3wA1Y40sdxEu+Qle2DFzuyvyhTmKIihtMKhABboY4kuI2y9MvnQYANXSIhhCDFZtOWp/FLYHuIDyzZzom8q1Zg8zT0oceLpwgYJo+UdP6hOQRjOsJSrgBnRl3GVCAaqTONZKqteL9ud5IBQkIJkR/0bi/m9t+3ZwDxxss04mMd7x5LVNTxJd4XghXxfVAGm/g8dvX8RWb/H2NpTE+7sw2PSo+4OqLXiqUwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gHT/SqCCc+cYRl093k52QPh4h8Xb6oO/67PUD46QT8E=;
 b=i2ymuSbZ4LDsBecxkFeaDIxJjAf1my4YQXDOPFiMrGoNYqnc7qfVhGNzeFOlW+DhOgTyXjDZS15OiAOoRFxklpVuivYUWWMOzZM4KueNtgrqWP5AZeWGLXnrVgb4kVp1c7/Gir80UdujaZKF8kDDTB7frWyS4JulOpOJr9vZfzk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB12895.jpnprd01.prod.outlook.com
 (2603:1096:405:1ba::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Wed, 26 Feb
 2025 23:30:49 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 23:30:49 +0000
Message-ID: <87a5a8qo5y.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 1/2] ASoC: simple-card-utils: Don't use __free(device_node) at graph_util_parse_dai()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87bjuoqo6c.wl-kuninori.morimoto.gx@renesas.com>
References: <87bjuoqo6c.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 23:30:49 +0000
X-ClientProxiedBy: TYCP286CA0078.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB12895:EE_
X-MS-Office365-Filtering-Correlation-Id: 6945fe4c-8a82-4755-4fda-08dd56bd9a87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9XwZrporXoJeD/UCvdZG0hZJBB2rAFheikQmtU44N+CIl7LmzVhF7KcZ0rkx?=
 =?us-ascii?Q?fxLYVTN+HCGQ+Aw5uJwyf4poubJOY0lacguk3y5rMqo0kX8+2TRbDe4reE3a?=
 =?us-ascii?Q?bv57dLCRbvim+jj4jm9xyPtEY7Rbb7uzBCi8pJfHtBwp8Vc/HGDCH9rJPUCQ?=
 =?us-ascii?Q?Y33GqGF76/UByhWowu3CtnTo0F1DmAqE/aFxXHZrvsCj1L+fA/Ik7j49U8+j?=
 =?us-ascii?Q?kDFkEVO1Hy/ugTfomvoexLoPxRyX4sDKJUAsJuRSca7MVg5sVDTkddO5qd6W?=
 =?us-ascii?Q?Zh9xjc+snMaUBlYZBZfikut7UhZGf9w3y00ZBKGH12UigxkpMaNJCkITZMNc?=
 =?us-ascii?Q?l7+iC8Og71Z26y3q76ATHrLeMBxFI4F4OmF3Sl76XwYnNFZ06g2TMN6pt5sx?=
 =?us-ascii?Q?lHFdPfdH3wwX6BK7QlWKT9gk5M11J0YtFQDfLAnie9PNevkKRZzaQghy6HF7?=
 =?us-ascii?Q?+jDGE/FadjKDhYmbp16me4Aya+bKzdJkPKmeCW5MABQ0BeS7yjnfWbeBxl30?=
 =?us-ascii?Q?7q9wD6QI135ATmaQ03uukYFTWmaE6Ol6Rny9ym6nUcQiEQ3f/eY6pP3u0Xmz?=
 =?us-ascii?Q?pCWtaUvhdV3sSwhiy02o9csmjoLYmHbuBWWVfMtLelUutz4bO5bETscTTw8m?=
 =?us-ascii?Q?RG1z3RYbz0wrhPultIzQYDs+xhamlowFq948VkCXea36qgFr6FjD0fdwqbkP?=
 =?us-ascii?Q?YG8MMfM6JS9pNiqSfsJ0QnfpWxxYvJ0ILPbc4JAXRY8rhIr3Wc5BwNzjGV5h?=
 =?us-ascii?Q?SnSdbvIXmiHDNL9lQhFp18kIiRA6mfAg90/nfpgU8hdY2XqrWDU4BeYLubV/?=
 =?us-ascii?Q?C63LZkF4dk9kZRiHaONLCMiq3LAPge6jXJL2YAKUGq/VKWfP2WHA/DBPMKrL?=
 =?us-ascii?Q?z/O+xcCjAVysYOrpd27p2sncgVr5DDvoCqgfR9EdT0Z7eS83WOJVGFUSCtb4?=
 =?us-ascii?Q?iaNjhKdMhYk2KROHY+0LzUJ9B0Goi9X6tbhnww38NZprDtMVlo0D06Y28GRO?=
 =?us-ascii?Q?1kz880HnbLGQPbKOFyH48XvbsJgPr3XIbxar+S1ibeSlsUJm4j2Q/2Cao+pA?=
 =?us-ascii?Q?OUAhtez8BFMH8suJP+wFXY1MqxnCwFEi2P3eLKbw1R7wiJZMi5mFUPrcMT4b?=
 =?us-ascii?Q?3TuEOv/KmvtLuIyDEmX5aP1uihjicSidRyUwtM82b2ZT0IbWuXk/Fhjj3sB7?=
 =?us-ascii?Q?H6pB0Wza3UL4XSyIkw9c9tr+VB0Q1mIc5Fs9RVkThjhdfEDwv/GveLHIV4fu?=
 =?us-ascii?Q?2nrdQvF+vGfMyiad1enWldXCAx4OjxlfwMmFt3V4hKoKjaHx2QIf46wnn8kq?=
 =?us-ascii?Q?kUzb56VGqGoC6zQiuFGjZKieSvpF2Ltffb1IOLof+9LoV2pDFVdWynZsq6N+?=
 =?us-ascii?Q?u8Vyt/JIyunhLaaGnzmzWMiKLcV+VLIpsN9E8JgHzM0ZqlZFsSYl9mqE77Iw?=
 =?us-ascii?Q?h2C/dPStXLkFNURuXC39vcvr5dFCIbFW?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hjYSC3Rx5Hbraj4IWePeX56P6Kar/r4SNfKsgWYB8cRI6e/ZIufURYjBr0ry?=
 =?us-ascii?Q?5rH1fnKHkY9E1tr79wV/FwcpYJcun2/hlUIvbxVLfkrRz6xc2uxHYkkfUWQO?=
 =?us-ascii?Q?2VGIDwecbYsEO2eYy5R2rTab5L0e/OiZWUch/+Agjt3Y9V74zvkEYk7DrW3Z?=
 =?us-ascii?Q?VA3fzRIhClD7hUZw1UeYcVobycislnG2If/Eu6JgpJPR/AHwxIkBU6TFrlKo?=
 =?us-ascii?Q?XnZLxxsK4aNnZiW2XbnXYJC7YRC9A0C3uH5dsVeVo6n87v2+UMNARh2GvkEH?=
 =?us-ascii?Q?fccgZjttCVVu2eZ0lS0naMXYxRyjRRasA2u1n2c5+3T/m2OWGHgPwjmSDRRt?=
 =?us-ascii?Q?3YSa7aehjWtP6wujqJ+uWqB2sWhr9WVO017r1svoFnRtkGk44YRG9TfcikPI?=
 =?us-ascii?Q?s1YW5Ou383CXS4he1M+Bo6iUT3G5kAGm9LE1aw3Rh9sS5WJVyYuyibV0hDSQ?=
 =?us-ascii?Q?i/nDyFg/C2NEAt4FiOvqD6+cngYZepRlhlkp1sKfdXI6UCy2FII2nD8eQlog?=
 =?us-ascii?Q?jafUpvH6W5B4/02XPXnv5JmPSPnrUhx3hb2pUxFh3umsEaPxXfHjMJxx8uha?=
 =?us-ascii?Q?MkR+EVWwEMnsTY6hF4sC9R6JnpTbXlDteIp+SCz3X9y++GLDwsXx1BnJsQ+l?=
 =?us-ascii?Q?5Q5gDyJsMT1R0OWTPd+Wouh03W87WkyM0Jw6lmEicLPR+MUAF1rC8kHwpSvk?=
 =?us-ascii?Q?EJHWhUgPZeJEZdwpANufhvVImZmGJR6mlSPrUaw8bgA/DgUV7qnXOemBhfhu?=
 =?us-ascii?Q?dTnftEmWqSCC3B6mvXCTskN/SA/gCtzgOPxVEtmKWdVo8H5PScNiqgaqKhPw?=
 =?us-ascii?Q?MLYxoR73S8d6guYxrjw/2q+pUQfzVhH0Qp5MlN3dtM5fqOr5LfkJBzB4Ht9x?=
 =?us-ascii?Q?Lec5JW5ei6/fdvbUJuO/cXSW5Hp/UPmbzJsahJIrz6w7I7Bp4a3U4HHofl/7?=
 =?us-ascii?Q?7WpWengLbWvv6ykctf9V1DIzOb1VmgWQzUON4OAAJ/QoCP9e6Bo7L6vNUonD?=
 =?us-ascii?Q?Io1Q9EeaEgVnD7PB+0n0W/Addsc7QEOlOqJCi8+Pj8WY0UzD/e/+oetMMYLp?=
 =?us-ascii?Q?lhYfi1ZpDCqmk0ebQIBmoKbUobUqXdfrHbNOSmo4XJq08GoCYPlEswsPaQjt?=
 =?us-ascii?Q?caxLd/h381NQs8lRAMhUNyud+qfxDHz6+1YG6X+WTcq3xkC91/8FYnr1OiXU?=
 =?us-ascii?Q?Z9JUh2mrtQEhp+NUNzrN0kMX9rAoOxvu4gAyjPdfn6zQGK6SrfF+WNl+4emr?=
 =?us-ascii?Q?SzxoDzpDy9G+gCULPzXS+KjAtE5bOOHAYNXH7OC6TXnP91LiDH9d/iV1JlN1?=
 =?us-ascii?Q?rw7ewwNQcFa5P2EarmDkuZKzePAUowoVqR5fo6PjrxaaW9XccaxFqAV2aXlc?=
 =?us-ascii?Q?VqyznGmlwzRmWomYphm2Z6XYyU0iHVmuM2taNuu7dtrcygPMn/AvVlEpWGo+?=
 =?us-ascii?Q?NU0IrxgFHAKQ9eKrc633IvwZUqKGArUs3YPdsMRlGQSfYZkQVZGG7snH3baO?=
 =?us-ascii?Q?RfSgJ1R6xDNgQUpjYXl9/r/swqazcJP/9/1KCRORlK1FAw4SkWvCq6I+W4RW?=
 =?us-ascii?Q?mF9QN8klZPvLUlUG4BliJdAJw6jkEsSS0K9c6bbXUXVIH0BZXxkNmjiEr8Cp?=
 =?us-ascii?Q?gsLYjCC0qtxl11aO/1FkO6k=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6945fe4c-8a82-4755-4fda-08dd56bd9a87
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 23:30:49.8764
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jW7so7jUMSVpSjiDkfd4Pvi50ZaXGFis9REIf8+Dcp9bd3NfS9MMKC0Dig/9kwiv72CVyReFaOn6UyVhW+1e6wpyjBaUKTyDvSnSDtE3KKnERdBleJNlNm0xPIjDfhyO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12895

commit 419d1918105e ("ASoC: simple-card-utils: use __free(device_node) for
device node") uses __free(device_node) for dlc->of_node, but we need to
keep it while driver is in use.

Don't use __free(device_node) in graph_util_parse_dai().

Fixes: 419d1918105e ("ASoC: simple-card-utils: use __free(device_node) for device node")
Reported-by: Thuan Nguyen <thuan.nguyen-hong@banvien.com.vn>
Reported-by: Detlev Casanova <detlev.casanova@collabora.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Tested-by: Thuan Nguyen <thuan.nguyen-hong@banvien.com.vn>
Tested-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 sound/soc/generic/simple-card-utils.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index 51e0e434514d..79fdd57a470c 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -1102,6 +1102,7 @@ static int graph_get_dai_id(struct device_node *ep)
 int graph_util_parse_dai(struct simple_util_priv *priv, struct device_node *ep,
 			 struct snd_soc_dai_link_component *dlc, int *is_single_link)
 {
+	struct device_node *node;
 	struct device *dev = simple_priv_to_dev(priv);
 	struct of_phandle_args args = {};
 	struct snd_soc_dai *dai;
@@ -1110,7 +1111,7 @@ int graph_util_parse_dai(struct simple_util_priv *priv, struct device_node *ep,
 	if (!ep)
 		return 0;
 
-	struct device_node *node __free(device_node) = of_graph_get_port_parent(ep);
+	node = of_graph_get_port_parent(ep);
 
 	/*
 	 * Try to find from DAI node
@@ -1153,8 +1154,10 @@ int graph_util_parse_dai(struct simple_util_priv *priv, struct device_node *ep,
 	 *    if he unbinded CPU or Codec.
 	 */
 	ret = snd_soc_get_dlc(&args, dlc);
-	if (ret < 0)
+	if (ret < 0) {
+		of_node_put(node);
 		goto end;
+	}
 
 parse_dai_end:
 	if (is_single_link)
-- 
2.43.0

