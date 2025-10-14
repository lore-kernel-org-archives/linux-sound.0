Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011039.outbound.protection.outlook.com [52.101.125.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74494307AC7
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415620; cv=fail; b=s6pMRq43DipyCxWj0r0uv2rh5frW0/aKFiXIaHba9tusW2zMLSR8nPrBmFT0EYUl+4qnJSm7Jhwxp7fYT+QZQw9CXgMtuCwfDd5vbtI6np7UHQkfw4wp77ARgOa9NPM6xeIemnBg7iLb+q07OxfYrqjEGnYGiSYwZgi3pdPcBqE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415620; c=relaxed/simple;
	bh=j+vYDwCQrgZtev8x1eo/sCLtEf0KJQ/r8asshgxExYM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=R4PksCGCPAyGwsodYNlUWIvJTWDErI2jveokBlR5Wd83jpqto3moVALttz4qjc1hnsf0uN+D4zmOaV6rJ/2Ujr+7X+taHZhj3JfnTGzzuMNKbJW/cUyi/pGRsl8Zwi+992Io3rXYb6lDL+rgouVeZwh6bWQxMmeXuIn+1zEnNaA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=m1m4Qane; arc=fail smtp.client-ip=52.101.125.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="m1m4Qane"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XAgvDlkqzz/gzMJJOFb9JEfkybVqaTAPYkhAHRSIfGbbATylfnsWH5rRX2VmK37XI6iTvo+1BHDPJ7Ahlk6FGb8ZR/271Rchqfktlkla6nKXnTs0axdw1Hx2+DO1q+Q02ZJrNx9JDMkmqud21b6TGIHbrzAlWFNS56oYwmVGHRArV7Ry43cUBpcdHcIKUGGZeJuXN5rBCw/2W8vHI9StQoxexcbzoM7SrN0zaIs/IzYsjfA3g4yh0VAdslcWM4DX7dREiZ7vuFflh82u2CIfa9AH8aCy8umvvlR0SbHj1MT9wRWY7v9239sVAMjuEailw/PJ5dOVAL7+Ub9Cytznvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cafb5fCN8CivPLdLz7PlmGiqjZp/1TIf4LNlcJ8afHE=;
 b=G7eSFiA3xs1o6+7KrQUaDmQxJ4qBbf31KQBZlWsKgcq+J6PGB1zTNM4GWC7ufUBzEIUhVIlr6qYZVVy/zbup5IvNhPdaxXSgynmnVaQJk5EKSu/egQRuKP/ZDGKgUxBJiNGnDbvF54CJsRpLIWrO5I2yZr3rfoi6j4R7nUmKUEpQEejUp8pi3210z8OS/FvmjCzno8HwuESEl2qyjzci1VmbkdBcfap5uUd92HofhPvsX8QEdBcTMngIbi5R/O1517ymPcQ2u9qgfl1+hrj8UNWMJMGN1mHmbWvHEdxx7z3K4+F2coDgqTaHia5FVJKQiXGduCbyV3yDUoSrvcX5Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cafb5fCN8CivPLdLz7PlmGiqjZp/1TIf4LNlcJ8afHE=;
 b=m1m4Qanemxi7OHMlFtcQHIBR7H5Y5UC7UBSjSX3r7HNbcFBcNFccd4eihJs985WtZvzFku7/1R5n5J9+YtD22mBRU62VWqodXqFP6gxvmZhYeaGN6spmRSu7/gUNdOj5wlAdQhDQeDYLxnddFELAKIb9eKLR8wwr4jVq9McnUIE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB13923.jpnprd01.prod.outlook.com
 (2603:1096:405:1fb::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:20:16 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:20:16 +0000
Message-ID: <87cy6qt8qo.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 013/139] ASoC: codecs: aw88261: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:20:16 +0000
X-ClientProxiedBy: TYCP286CA0351.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB13923:EE_
X-MS-Office365-Filtering-Correlation-Id: 32df6ad5-2f28-449d-21f1-08de0ad8fa3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OhvzwJHnRDRPjG8lHn3krzaau/rBtLmqz4T0wpBBmmM+RwbcecEU5F1vsacu?=
 =?us-ascii?Q?hlE7mhLZPAY2Jmno0HnhoLbUISQKr9c5Anlb0SxFsPKlRnOF9f7+PUZgUlEt?=
 =?us-ascii?Q?bL1gu3nwFFwneAuED8m+uemBc7hch+9/XniYh66e7yfuK4WI2qlGKG4cks2E?=
 =?us-ascii?Q?EwG5F5lsSL5lMTXJiZOBDt61uZggLiFuuHL38gsZNSLAHv8j3Vr6BULS769G?=
 =?us-ascii?Q?9abLAv71RdHnMgn9kC/JkhXNxVuJ0Q3H8VLqeBxNn5DvP22aBFT8Nc4wHBbX?=
 =?us-ascii?Q?Yt0ENVmntczX5KZ5Tg3em3DDxnt5U1/l3DV8/99jC+8F9E4lfiKK5sW1+FeL?=
 =?us-ascii?Q?tXzFSCaYigGaSmfURcHgGfJERl+/YobrUUgZv6XSJFRlaXAGzCqnYHu6Fpvp?=
 =?us-ascii?Q?kJFj5YH7qLHQXjllWVAEXVlu6Wjfg61A4NqEvfsZrO9TiH/GoOLIcibRj0nA?=
 =?us-ascii?Q?pcNPMo4YsdzYl3qJXI+9C92Br6Ed3SX4XfgWtebeCaUQhu9nJrGvdUk31ADj?=
 =?us-ascii?Q?XH+oqthSFRxfgklI1gP3iUnVu5rRd9BfLLGBil5MIX3e3M50LhApldvEAPzt?=
 =?us-ascii?Q?2F4Uhv6IBeG0SEW0Oki3pW4glwkakuU5FE3CCkE9Fy28qxdKpSI/SjCNfsoa?=
 =?us-ascii?Q?FtJvjKQh6qpPGgwkbCSTL4+sX2GXvkH+KYPIdA1EURp2zaPbu4FBJ98sMfif?=
 =?us-ascii?Q?eDeCcdTLUZNhUz6B4EiXki/fC3N0mnqSVewzOqQ0Fw+ph/J0fSdnqT2oxmuG?=
 =?us-ascii?Q?BchX7jqhKZffykAuQ5Q9hQFHsAqtE7W8XTcyHGRmhISwqJDYQQ3CDUIRgcOn?=
 =?us-ascii?Q?RwB9Mc+jVDPPS/9EJWrmgs30fzt0K1nVlzRmiMLSQv461Ay9kFrCUGA2FtDB?=
 =?us-ascii?Q?xPKEU7rfD2/4ZFAP+0++PExWfa2ydMibra9RCcsU3R2MSHH+PWg6/Z/tcJ2f?=
 =?us-ascii?Q?wLNvGLQ5Vk8NS56c0+Y4M+uCpB/8GLtOyYC8iKhvNWlu1TLYstZxOT4OuRIu?=
 =?us-ascii?Q?vls8QGw2+m8MFm0HsIypR1AV8epEE529RLbc5hV19OmmD9uE3XK40l6m8wyi?=
 =?us-ascii?Q?5qnRXzx3uGA3KPorlzZRjJAqcYtoaZ9Z3nhY5+lReNWe7inLevGK9Nb3PEu+?=
 =?us-ascii?Q?1mOPEiJlBi0H7N3abCGVOk3TSJKGX5QsqNEY4PN9TE2Rc4IYS/GSGv3fBaGD?=
 =?us-ascii?Q?xD4K/DzQc2awEwK+DvDWZz3zMViLOOZyiXl1o3mQ6FufW8ftoH+vpVQIHvGu?=
 =?us-ascii?Q?9uBhUsrs3vQ0LixV2dtGRlv7T5rjFHVy3FhqWYv+LtCBEfV/iU16hv1YIUys?=
 =?us-ascii?Q?R1yCB2+6nfQsfqK7NDqBvVkeoZvLZw88BObMT2RsRiATaO354FyJRCO7DZOh?=
 =?us-ascii?Q?AzLZU+KulYGmuX+mYj9Clsl9I4rzeS23w8HSTALofU8qds4/TjzHgvPRXmjs?=
 =?us-ascii?Q?poAqOCln14CogPf2DT/dZVY2smkQXa312Lp5JLsiHEg9v5/vHkPmYT+adLCe?=
 =?us-ascii?Q?rbgqYgVpviIqFlb/1Aq26AfIvqnrPNdl2MgU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WGWhVMEmH6V5Z19O+IsMcE+O7HsSsf45tZ18Vz7aHBvX964lwMh27aXyXHqA?=
 =?us-ascii?Q?3lcXl5sb5cKdnKG46l46PgZKCE8gbPxxjY+nns/GY8zcuop5v9G0tLjwEHaV?=
 =?us-ascii?Q?sY+qGZXVOc35FOz0zLnmDERGq5R/heBNdpiwnjex9uuJRO5CSDdK2F861l9F?=
 =?us-ascii?Q?S+yXI5FFjtfWJu/97RnNxjco51jHOhKURB3QWnkJ0LoboVTp6FPvczGO08pt?=
 =?us-ascii?Q?+HgvcdEf4W3u8B5fKOPYniWnNfM2jKn3E7BAKdkQkhZZO7Q22R4/AFkjnk8L?=
 =?us-ascii?Q?GI34eenaf2ivRDZc+GG0vhim4qHdrMlZg8TYzrRyLG0uqvO/76Z9nE0ztKAT?=
 =?us-ascii?Q?ev/C+gQPQra06TR+BuokXORozF83+qnKOlb6vUIzVXB9ayq+YFELO3iqxuQG?=
 =?us-ascii?Q?6qLEu9b+rXGU2bPzDjX2vm+Eg3Ypi4H3BSMHRpHAyx7pbydXe9jDL8nvdNX7?=
 =?us-ascii?Q?6A9nAIaeRC1zV/dq8qEz/0HVIwQqmQanoXSXNYlZ6Gts+4cI9crLWWXYqo2w?=
 =?us-ascii?Q?TFkqi3wQoHIDE0DnS2zcSTIwL/eie2RJjHMK63eKCZeNX90yGzbGNB/Wik67?=
 =?us-ascii?Q?LOeK4eI7rqTnaO+foAaTzUST//72hweRCmh/seezs2m5q48C5cmqhm8zTC8k?=
 =?us-ascii?Q?OU8z2M7XVbvqtGpyk4knnnBi8uVicgdCdbAYHw4YKHMULoGz3H8Ml19Nj3eV?=
 =?us-ascii?Q?bL+eYfmrHB6TZj9UmQ1m7BJvj71zs7kq8hSpwnMBAdZ1UxWJeZhlnilOuXa4?=
 =?us-ascii?Q?9BsCep9oQr+XmGpCNawI91Fl1abJhVJj8VJqr+jOn9c0osMINDmic704nCmK?=
 =?us-ascii?Q?FSRBqwUIBLP7FBeQAZzE0QC+zGqDegyQw0TDs6Vgqz7nfmpuIvvKV4MblOlV?=
 =?us-ascii?Q?3QnHovMhkBuY/IhYCsciOxCFZc+xTRFvPFDs15mRGCXJw585SJ8Giqexfc7R?=
 =?us-ascii?Q?rB3/QbQXIwBTLR1BNC73GtaVwfv9GaPTYW5/Nn99ergXPPewgQ3uqvTI8CJV?=
 =?us-ascii?Q?GMQLQixMZ6wHrvP+qNLaPGXU5R9lpUdyJM3KGFAshyJ/Cud7dHA/XFb5KiIT?=
 =?us-ascii?Q?axRafM5SdYtnSVwBYwI7/2bZmpRzLeL/63LQc8FDaWe2150VEhvwdDLXzfOE?=
 =?us-ascii?Q?4fnJSkPI20+ygIQuCoV7tQyCgulxREqCjEUzMEvt5p0uRP8SDXUjk/tuGQOw?=
 =?us-ascii?Q?FQUsBRSOoTpb0n8mLpOoCiAyP0DVKTu4qoYDfJ9lKtYMeH0uk4L36FZdl+GN?=
 =?us-ascii?Q?TY4odCYkUcGhJI/X0QQSROZwaOjTbqzw859P0jLXi4AZPNber1h8PbT4WF19?=
 =?us-ascii?Q?6QfOyAOy8GYY1Z22AXZLGGnf/FqJjhnL4Nl+2rdXzRkJWSMp+xkCBTqT4U0O?=
 =?us-ascii?Q?ByGbdMnG+aypXN02RubUR8V6j+ijQ5G79btyp+SSpYHmx0wJljEkV4K73frw?=
 =?us-ascii?Q?0oFpNYb7vTUGPZLLgRWO88jxCjns783Co/tjToSIW8+uGJccWpB5rCiEGdLV?=
 =?us-ascii?Q?qNuIW2tnQmti9TKhoFMF2Avt3+WzYhmNrrj7VwEUcLs5joHAajU2AHTirABG?=
 =?us-ascii?Q?N51cFb06C4kpLJp4wSCj5oKp6ZS0zqUfTU3kMKnhdHY+cGCtDNWdbZ9YdlSz?=
 =?us-ascii?Q?gJitC+pJQWROAneQgtQYr0U=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32df6ad5-2f28-449d-21f1-08de0ad8fa3b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:20:16.1674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JvWVcpLxFz3tMvPTPEWgqLD1HTuC/gJdHOS19pfCN3zxLthaYavZdRg3Zc/4CB2DqOWFdKHdivRAOnLNs39OTIqkk5eV9yQipEts0/AIALl7TSxItMjhAIT2MPLiqBut
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13923

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
 sound/soc/codecs/aw88261.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/sound/soc/codecs/aw88261.c b/sound/soc/codecs/aw88261.c
index de11ae8dd9d9f..51ec40aec3678 100644
--- a/sound/soc/codecs/aw88261.c
+++ b/sound/soc/codecs/aw88261.c
@@ -734,7 +734,7 @@ static struct snd_soc_dai_driver aw88261_dai[] = {
 static int aw88261_get_fade_in_time(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct aw88261 *aw88261 = snd_soc_component_get_drvdata(component);
 	struct aw_device *aw_dev = aw88261->aw_pa;
 
@@ -746,7 +746,7 @@ static int aw88261_get_fade_in_time(struct snd_kcontrol *kcontrol,
 static int aw88261_set_fade_in_time(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct aw88261 *aw88261 = snd_soc_component_get_drvdata(component);
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
@@ -769,7 +769,7 @@ static int aw88261_set_fade_in_time(struct snd_kcontrol *kcontrol,
 static int aw88261_get_fade_out_time(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct aw88261 *aw88261 = snd_soc_component_get_drvdata(component);
 	struct aw_device *aw_dev = aw88261->aw_pa;
 
@@ -781,7 +781,7 @@ static int aw88261_get_fade_out_time(struct snd_kcontrol *kcontrol,
 static int aw88261_set_fade_out_time(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct aw88261 *aw88261 = snd_soc_component_get_drvdata(component);
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
@@ -817,7 +817,7 @@ static int aw88261_dev_set_profile_index(struct aw_device *aw_dev, int index)
 static int aw88261_profile_info(struct snd_kcontrol *kcontrol,
 			 struct snd_ctl_elem_info *uinfo)
 {
-	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct aw88261 *aw88261 = snd_soc_component_get_drvdata(codec);
 	char *prof_name;
 	int count, ret;
@@ -852,7 +852,7 @@ static int aw88261_profile_info(struct snd_kcontrol *kcontrol,
 static int aw88261_profile_get(struct snd_kcontrol *kcontrol,
 			struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct aw88261 *aw88261 = snd_soc_component_get_drvdata(codec);
 
 	ucontrol->value.integer.value[0] = aw88261->aw_pa->prof_index;
@@ -863,7 +863,7 @@ static int aw88261_profile_get(struct snd_kcontrol *kcontrol,
 static int aw88261_profile_set(struct snd_kcontrol *kcontrol,
 		struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct aw88261 *aw88261 = snd_soc_component_get_drvdata(codec);
 	int ret;
 
@@ -889,7 +889,7 @@ static int aw88261_profile_set(struct snd_kcontrol *kcontrol,
 static int aw88261_volume_get(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct aw88261 *aw88261 = snd_soc_component_get_drvdata(codec);
 	struct aw_volume_desc *vol_desc = &aw88261->aw_pa->volume_desc;
 
@@ -901,7 +901,7 @@ static int aw88261_volume_get(struct snd_kcontrol *kcontrol,
 static int aw88261_volume_set(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct aw88261 *aw88261 = snd_soc_component_get_drvdata(codec);
 	struct aw_volume_desc *vol_desc = &aw88261->aw_pa->volume_desc;
 	struct soc_mixer_control *mc =
@@ -926,7 +926,7 @@ static int aw88261_volume_set(struct snd_kcontrol *kcontrol,
 static int aw88261_get_fade_step(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct aw88261 *aw88261 = snd_soc_component_get_drvdata(codec);
 
 	ucontrol->value.integer.value[0] = aw88261->aw_pa->fade_step;
@@ -937,7 +937,7 @@ static int aw88261_get_fade_step(struct snd_kcontrol *kcontrol,
 static int aw88261_set_fade_step(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct aw88261 *aw88261 = snd_soc_component_get_drvdata(codec);
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
-- 
2.43.0

