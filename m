Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2057.outbound.protection.outlook.com [40.107.113.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658E8125DB;
	Fri, 28 Jun 2024 01:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719539282; cv=fail; b=ojOwmu4LECM0P0sgnfWdcHINfoIxjrCgQj4xRYbQ3bb7BTBCwJZJ5TJ5dBfYn6rh0Z+RiaJFqfe29k+dg26dcIwZLONnNGuZEisGepsFYJKgP/ylVGk5c2zhbXtdfQYyPyCn5XoI+vnUgXBdlmwwMlyZPAemyybh1T1Dwx9LgeA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719539282; c=relaxed/simple;
	bh=AaMrLZgBc02FiWy9uvzjnD8w+ZORFU1I987r2DWPybM=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=FMcI2Q/j8WEQlb19539PG73XCN+KHgoAMsP97LwArwK1PLMbC7XcH0HF1+leCQCtveUvfgeQW/Vk1tcvjbQnkFwrqXnwodAnKb++wlOlm89PUasN6KW47/aFf/BgKM3SuPgcC8T2cY7LVItjiJqVKrOPooR2BqciNNHrtRhmBCg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=LDiF8Lbm; arc=fail smtp.client-ip=40.107.113.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="LDiF8Lbm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OWZ6Udw6BXMhfB03Ui/CxCxEfoxG8dfLpIrXpxjgF48f8xBE1L63CNcgqKIX2OoDOdnpEcE4FaVC3M411NcUGggIe6+aiaMQDANnSC6VQjJIHLyYSRLfaEY+RdWYLLdP3tr/V+5P+sf2a/P5z+Wu4wVklk8APtABKbmXBH2NYbikJRk7npbGGgZX/689u862IZtDHjzFP3m1AwieXSF4FNk/VcgcD/G430Qua1k5lKCmTFiC7zc/+x6iRM0WaBRq2Dr88hvZMlbTBMweLsrGzzvcXzDTaS0BwmEVkxbCUU+MrczVymH1p1QxMxa4TafTuqmvkshx2lsTbHvWRin3pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NVY3oRgsh6M60t9TbuZjUC/hFLe3TSuxpb07/Q3ATXI=;
 b=UYjs8fLJ56X1r1BKbD+7zB67KD+LanUYws/GewAu/uk/ruklbKS7/Tw+pROhHvXbex/toXsaZsl7biEyeDZU6Tnr1VM1vhMltLyqZUC2q7yxpqQwOzJV6zW8SRXE51vadwd9lDv4NnSsc9ustzpceiT5B/7bHIJaldptmlROdrJDN/gagJBrabh0QeLdcwhwWa/odwTOmRgSDO7ME8n+T6A8qdKyZGCYlzqxTtRxdcbbcBWoKmMIfHIUek6wnPbcJdw1cN23LgXVUzKROUKaHm/z4pqyXX7i54Y5nT6o4RJcPCkV6q5Tj83QnIwNbWEngd2NAbvTFHrJ8XFZYzhOVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NVY3oRgsh6M60t9TbuZjUC/hFLe3TSuxpb07/Q3ATXI=;
 b=LDiF8LbmrBTsAT7AHRrJ5/EEb3Gp0QTCymrCELrWXo6Wok7yN4w5yaeym3DOpKlVs8AhNYbBlzbdgFz4v3L/D2ybH4TO9MB9NJa+iAt0CIbuFsn/p/fxoFSnQ3dKDYBR//kQQG2U7gT2SVqDttAEnmQquQqjZwXfIfKNYRj5r9k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB11434.jpnprd01.prod.outlook.com
 (2603:1096:400:379::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Fri, 28 Jun
 2024 01:47:58 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7719.022; Fri, 28 Jun 2024
 01:47:58 +0000
Message-ID: <87ed8halde.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 2/2] ASoC: dt-bindings: simple-audio-mux: add mux-names property
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Alexandre Belloni <aleandre.belloni@bootlin.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org
In-Reply-To: <87h6ddale3.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6ddale3.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 28 Jun 2024 01:47:57 +0000
X-ClientProxiedBy: TYCP301CA0004.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB11434:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b024d24-bc51-48f8-60a8-08dc97145613
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|376014|7416014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?W/kFC1jPQsSQyT+RKEbDrEaf8zjbhm6G5uNiVbj6X8dIWxv1HKMGTd0J+tw0?=
 =?us-ascii?Q?GO6wCb2lV/wcN+bBcSi7kd4uQadRqoEtRYDjckw/6IIwB7SUBqHznTNCLxDy?=
 =?us-ascii?Q?IOWCeINFC9+PcsCmh7d1KMk23oVMHN0B4Mhigwmu+9gaJHI2Ert58QqJ/4sM?=
 =?us-ascii?Q?NolW+THxS7xFZIm90sfFNVN2XYUuQBCI+GvQ8gWwN11QB8XGYgY7KCEKv3Nm?=
 =?us-ascii?Q?2RV8Pfn3nHnDFdgjoGxr/QMvl0epVXgMdlPlQtUVlP1chlioIN/R3Sf+oEBp?=
 =?us-ascii?Q?7uyeVjUq75VD/DNDrshwfOLv8urlN918qgkDCj39tZAiV3PL4RwqPiIR0XiF?=
 =?us-ascii?Q?6YYwjAzpMK0SobjrpVxu2joez/N+qJ2CUueCWD3xo+a523QxnsFwC8u8cxyO?=
 =?us-ascii?Q?2wK60jG/TmXkv6PxVrFkenkr7asZb+uoLptEYLwNW//uflaPr5kA3V7QPnhN?=
 =?us-ascii?Q?o+TCr2BmmGg1DfugywhkGQNCv0q27tKDVVgWXL90/ci2Q/s7vb0qtZqlzZQ6?=
 =?us-ascii?Q?jwKkk+hiNIyh7GoffhORXI2HOdiu0PrcHzZZqt/MnkAalP9rbTDFMfWILNGb?=
 =?us-ascii?Q?MYcB60T9UtcYsELCPOeq/Za/zlH53Cq90eoHQ3d5E7R2MAlwezB+uOZ66dTv?=
 =?us-ascii?Q?nNs8SSiWn/zhMAjRNFgZH4qGDgkeHpRQ0GwCCJrk37hw0DnmTV73jiCis9et?=
 =?us-ascii?Q?RXGNmNBnhquFbuuHnrskYSFoC0Uj5DCIyLOMx2cDP8qlKM7x1G4Hm4FJWOb/?=
 =?us-ascii?Q?lmR/JiCA/7PB5jXrtz9VzTt1WM5m/cnnMB/nSakJ4/pwzAOSR6cZ2ktPrClc?=
 =?us-ascii?Q?//zD62sRH9ZwQaSHb4LoBAIthF/fnfs0yzn0tWE3hXpWeTFkEZA8e94d1kw6?=
 =?us-ascii?Q?1615R6YVxguMqMQYOUuQQF9bCcGquiFK+sAQ0UcBt7tkwasn9W6e34GbnF/M?=
 =?us-ascii?Q?hKx0hGtzA3JsU4xS/la5XcEB+53pDHnGTht66Mhcv+YWIyg1BqvlkmsYg17o?=
 =?us-ascii?Q?Vc/S2f0H+WN7xVJWqWR5MZMt0jT6UVRku2k84tcVHHFL7RE9wzUgerF358FA?=
 =?us-ascii?Q?YUH4n6Ik3s18R0zB8br7N4km2E3VRSRaNmQPQm1WMSw6Rjg55Lj/0Xo2g/sj?=
 =?us-ascii?Q?i/6Pyk7VhKOJ0a+gSOyw6kK55WDw/nRudo21UIMhMsutfSHfu+KTN+XnSinA?=
 =?us-ascii?Q?mPejMNBPYovFBi4VLa0d7jUepJgzVL2wlABHl0o1MhwCBEVwrd1cldmZfAHt?=
 =?us-ascii?Q?R+4+cq1WDHPxFKI107blkoxLM38hIZcxqWJ0dRcryZqWJPcNeL8DJy2joJnA?=
 =?us-ascii?Q?i1RsxTpKzaDFh3OhHXcl4BpTx7LWBlxt/DvB9T3ZKjslb+zY1OK2vDcHiaVV?=
 =?us-ascii?Q?3ypYRHpzLbcufzNluoBJDrRSbMga0+hDGRR/ugSnRT2a1nX9itTv7k11e8ub?=
 =?us-ascii?Q?zY3qm0yWWCI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(7416014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mAxZZUchIuDz8ZvHDssTLouRIP/WodQKs6XDvDHPST8Cb3eLNW0bthXlVq+v?=
 =?us-ascii?Q?ZHJBR5Q88qfVcYcsY434FLYHPnyI+KAZpZ6uTI7h0RowREZx2oKcDzTQ3FWJ?=
 =?us-ascii?Q?I87kBkvBFSZluD3LUYARbFbSNYMDl9wiFoJ/OHmiCpR9AIoVhJ1rV7fMycDZ?=
 =?us-ascii?Q?d/MnUpAwvOIl4Rnvv/anE154dDH3Ey6q5pauuUckvvMswwLN9IW/q3N6sOpl?=
 =?us-ascii?Q?GjkQTB/v4/Q8Uyjf1X0R5MLdaRWTME4KQ5XWdNhreGucTMYFUurVIcLkDTT2?=
 =?us-ascii?Q?LZusc/XLxyOS9ogiKHOl1uolBZOVjSt29Ks8fpCCFJKN1gU3HGHoo+6LKR6c?=
 =?us-ascii?Q?S0Fz0VWSHlNp5q+c7yQdi3MqxdykhnM9kY8nLTn3psSAbsntlz1HhAjQJfpE?=
 =?us-ascii?Q?bQfdLREf0Ax6u1c8hj4tzh3CfjVcRnVioxC0FZXnUjWMNvQAAMg4jK/tJ270?=
 =?us-ascii?Q?xPDoQvJsDyIMAu1e4rUw2pMctiHIOAsnoHXFbxgcQMfNejDxJONY8HHV2aJf?=
 =?us-ascii?Q?hJGnEvhY5MSleHLzfyA5/PmW+4XeQCTtdvwdqJ2uAXf0teWU4X6SWTGY1wiH?=
 =?us-ascii?Q?1iTPKBc37MG9Rt+0df02TzbccQ70GgK/ZDq6yH1wjaR22zmms+1/G3qaQRg+?=
 =?us-ascii?Q?VdINRrJw4tMV5NNnpE26/5sPNNOJwfJMAbgQfBYzGUD2MTSbH4ypnX9CHn7b?=
 =?us-ascii?Q?2k3heiFj0Rfj1o1xXjyXV0QHqTeRhwt6ofFjAaWd1REFnVSuCEnbeFLPLowX?=
 =?us-ascii?Q?mG8w/Ry2dfEHnpGDO8xoAoQH4V/jShhQ+jRrnDkVD139asqJ9uzFm/VFSEyV?=
 =?us-ascii?Q?4hS7bLh3Gc0pyOMeRdaixo/20nQm6aHjzHioHYGRGNYjrJfa7/bXa0UxrRBh?=
 =?us-ascii?Q?MWt8WbsCX7TmETTqdHah8cJH0CR6g+TCEUwqhvBHxuY1HBOsF3wQrsJqqJ5X?=
 =?us-ascii?Q?jFm7+Mbb3bLeo7oaBRfwS8D7/7UFxslYxkE6WL1hpRa3QdIV6UL8++2LwLcY?=
 =?us-ascii?Q?CfXVfl5kKL4IZRIuQbJhWk6TFiKtEJx+Rdh4/rWhdzzRoIARsFQ5I9RDzzWu?=
 =?us-ascii?Q?T+8/V808HGMi9AhNixM6aWskuRGbYafWiB2jZ5oHTy3P2TzVwwDJrYBnglP5?=
 =?us-ascii?Q?cMtYrdi9ghB7PhgeN6Le8+L1epw2D2pmReh+ylxJEYnd+fOKl5+idcUb4ysI?=
 =?us-ascii?Q?5r1wotlv0uTwYWPejRAzetnxQiuougPyn48OCAPzj/TebkK8YpUgi0pIndMu?=
 =?us-ascii?Q?SzxUeNvTqdF0UkG6Uxss4Yzq5aTbIg02WTMDlJqvcuV3g5ck5LOaelNHfV8M?=
 =?us-ascii?Q?id90IzWPu1dJKmYCzaswMnjZCo2SiIiTUg5Z6oQhs4AT2aIO6b2XNVLnlIYY?=
 =?us-ascii?Q?Xm8fU8emXIuhvKwFKrExUezfEUPBW4TqFoRAMIvnYsv0hxo248XRY6cLn+Nx?=
 =?us-ascii?Q?uEd0zBLJENpPlGyWgr4h/QeeX0mNI4ZwckbFMKDw30FXXuuG98e7G2a3X/s8?=
 =?us-ascii?Q?MbpyPyPOocSAq9V/NtT4BoJPIjW+bHRz5tRDT1CshCGiphbT5MY0ennINoxs?=
 =?us-ascii?Q?vhNk8akA0rBX622/ozhSq8XFMVlm1sp9jKTI24wfqcNgdcVy1fCZ+N+yOsN4?=
 =?us-ascii?Q?lyu2iU6k/3QO4NvanE0KBA0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b024d24-bc51-48f8-60a8-08dc97145613
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 01:47:57.9940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aWiBSyOW1cAo2n5V7UeR9ax8g9d0Se/hDxhOB5CJxUG7cll5f8KVXvRdCrqus28ngLBS20Wf/8lT3uvg8dkK2C1Ab66Rc+Yztz7cZk6c7e+CniUOsURdKmEnLvPwFmvv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11434

simple-audio-mux is designed to be used generally, thus "Input 1" or
"Input 2" are used to selecting MUX input. This numbered inputs would
work, but might be not user friendly in some case, for example in case
of system hardware design has some clear labels.
Adds new "state-labels" property and enable to select MUX by own state
names.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../devicetree/bindings/sound/simple-audio-mux.yaml         | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/simple-audio-mux.yaml b/Documentation/devicetree/bindings/sound/simple-audio-mux.yaml
index 9f319caf3db7..3b38a0753282 100644
--- a/Documentation/devicetree/bindings/sound/simple-audio-mux.yaml
+++ b/Documentation/devicetree/bindings/sound/simple-audio-mux.yaml
@@ -24,6 +24,11 @@ properties:
     description: |
       GPIOs used to select the input line.
 
+  state-labels:
+    description: |
+      State of input line. default is "Input 1", "Input 2"
+    $ref: /schemas/types.yaml#/definitions/string-array
+
   sound-name-prefix: true
 
 required:
@@ -37,4 +42,5 @@ examples:
     mux {
         compatible = "simple-audio-mux";
         mux-gpios = <&gpio 3 0>;
+        state-labels = "Label_A", "Label_B";
     };
-- 
2.43.0

