Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010058.outbound.protection.outlook.com [52.101.228.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F89B1F1534;
	Tue, 13 May 2025 23:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747179572; cv=fail; b=F90bT7BjBhz5y83gARRw5h9R38o45wnOL95W3N5WnKdPk6aH4r5og1yyXWVhXftLBemTXT5+ra2fB6E/vOODiZcTUdk7b9EkGD9oz0WUSKYHDsUAqokQFkH6CdTWyP59cvxX1F3LY69muYbWAzsc6/WenVf59jTpLRHAAlW3qqQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747179572; c=relaxed/simple;
	bh=jjso671nVDqBAWcqw1WoeB2U+SZkTQ3rxCoD2FCDwxE=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=WlOykBTsUb63IgVKKXvgNA0kNog36Pd2wpqQpTIH/rSRF5uor6ls9U74IFgMnVoPmVFXHkN+yEQ99tci3FA6/FOGCwZXbsk23Ct2DG97pjiewQc7xyd7TmRtiy0pnj1zqu32XOM8Tm2JdgHinPGG+VmLq2dXCgcDlxZDItDy0B0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=l61y/ut0; arc=fail smtp.client-ip=52.101.228.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="l61y/ut0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VElKMbZr4P7hrNu7ePwHWvZ+Y3xmbTXmSbJ0ulnAmh3Sx8ac/8QePXTER51fOqVS6xyOQvTb5bBYNhCnNkSaAnTbG7VZKcvv+dDt5+7pj4X+qKlRbGM2MTjbYLIzzlpyaP5pqH0H5iTFjJXK45BKUIvyBXM8GFrcfLj9FyNPqoy4BL6+ORLLfr0FjtQEZdBkGtr3jqMPc2xsEzFRK3EqF7iClJNNWDIyCgW1VQUfk2mZhmQpwjYRoMtRt5ppSm0qJq3Ayl0P9gp28poBzIo5tVouklEtNNwxdFLo5S6xfcmTOZ09+FBpG3UsgTEKwJA46M2lr0XKDOwGOMyOcUh/BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RraQFHysqZltcA17+J22tLWt0c3X0I7WLtSXqE8fluw=;
 b=ZkkA7b7xJFEEHMUIW7fhOB3B3HraA2wWFzbWgv/nr+kni0dK4qjWwogpx8v73vHOchYwhpBd2CCpsMQk8ZGXswdbU3JfX1S5B0SZlDe17IhewSOO+LqWGIu8MmaDeMEy0N+XZ/RU4+ss6LUu2hAkiUosSAPkF/qi1Y/Hajgi4Db/LECwUMpmqhSr59fKsCWyeQC7PJ2nGF4OTFLT4ShCCaBe1k6R3j0eX0hP0ZNtq7d1wSsFNTxeC7J4IZmvGdeWdLBttRdwGercOQOszgfptWP/cCSta5kTX9JwWDyHx5692T5SH8Xo7uFCpEmqCKMUmZ06QRHdbKjBQJZ5BMV5hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RraQFHysqZltcA17+J22tLWt0c3X0I7WLtSXqE8fluw=;
 b=l61y/ut0PrEniVPUVjDEYuzoLVf9k70JYWjCr16ZbdJv9JGn9DLjPH4p/74hls8sbfIk/UbZVjWXFzS1avkFkbN00eyIbYf/8966vkeJI6Jud17IDwOC3ef+KJ6yOkzkHwgbpbhR1wITtn2SNKZ1IYu66EJZU26KY/DtaADUksc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB10204.jpnprd01.prod.outlook.com
 (2603:1096:400:1db::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Tue, 13 May
 2025 23:39:28 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 23:39:28 +0000
Message-ID: <877c2kaxn4.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2] ASoC: dt-bindings: audio-graph-card2: add missing mic-det-gpios
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 13 May 2025 23:39:27 +0000
X-ClientProxiedBy: TY2PR06CA0048.apcprd06.prod.outlook.com
 (2603:1096:404:2e::36) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB10204:EE_
X-MS-Office365-Filtering-Correlation-Id: 1befab8e-641c-4d6a-431f-08dd927766b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bsw2j5L4m5HiBfDCekTVjw+d/q9djS0m4zQPbecsJXCNn0/L0JWuOfeskBtm?=
 =?us-ascii?Q?KUiyvlVU8XQ/7iBjaaPHLokeXC8H6wRHQIByHK9Mi4S1lWA7oi9pmf71s1bF?=
 =?us-ascii?Q?3AL3qQpxZyjp5Kn8ROj28uU1epnKMPOGvcH5i3Xk5/aI5AvcdxI/gJIrplgm?=
 =?us-ascii?Q?zlaO89K0tM3W3D3UzTixR2U+pMksdbUINBiItVIwLyUEUur+1YGVlPtsotCn?=
 =?us-ascii?Q?FJpNfFHt+98LjoLSE43lJeF8Mo6vDBpHkXgcGqTsQlEDoKGlUIxpOf974Hv6?=
 =?us-ascii?Q?rQcduOlxq0CAd5BGbLElsUjhx6Y+A4TOxrpHxZEcADuTmVC4Wo5DgF8Zl+J2?=
 =?us-ascii?Q?qz+x0lrAH9jyUGWyy0CH+ALbmcp87IsoKD0I9r3l1TEkGnciz4Io2GybOwLT?=
 =?us-ascii?Q?op2Hv8IWDTHcjCtZe/zM5VLYjQEhwBelEsKQKzqZazAZHlOf0241UF1yE8ME?=
 =?us-ascii?Q?ruPlgZCdlOi3trURBFAGYNeRLz51nGCpx2M5j8uuFg9UQy/mBg3NIpWsRJ5L?=
 =?us-ascii?Q?b4b0MqWf0BuRzZecoFEliYUS7zqwK3Ckt6fl+NlWhzqJA6acz7OgOg7gIfsn?=
 =?us-ascii?Q?nFonRnAAFDq97AokVEn9e8CvzFFbkSrnD0yYaLcnvD4H95bU7Hpgp1VoLgsr?=
 =?us-ascii?Q?gN+2n7SRcS+9n+7fYew/oIOoZ1Pt7L7N1uVTUsR0hrpL1N24v4FlYOeLykdQ?=
 =?us-ascii?Q?t6OgsTTQCQgna2YjoC03J+BgJSOwH+USX96gVcYaXbYBiAlz/7n5+8EpAcwr?=
 =?us-ascii?Q?r8idYrmx3/iuTw6uqdUhko1pdKblKDDIxjrCuMOd00+GNHnF7E9MHV44Fvg2?=
 =?us-ascii?Q?aNfKNlkgqgKzeIoDqQCvFnOO07I+jrIw+EQVmT1sX6SZia3Gtfxl2KoO/2/n?=
 =?us-ascii?Q?gUhmjoLMRbtpF8MIFxs+xHreKDHRxFPRnMA7P0S+c2SdghXGHnTPcrS8YrgR?=
 =?us-ascii?Q?6no7Lt+ZOmcevNEh1bVlWtOMiP1uoow6D7L4Qfq0OqdCV1sef7tzAY9OOwEE?=
 =?us-ascii?Q?/lHwEA5lD2VV39a0G6I/VrExkc9SZvxJ+ry3ZZXjIJBnt6xEAOOf3bOlhgjQ?=
 =?us-ascii?Q?szhtnAW5v9ZbWUk7QxNy6f2ACJo3gUDdQgRqV4j/cA/SbR5Sl//8djWUfkFQ?=
 =?us-ascii?Q?hCVbPLa5oyYYIibR5qTO5YHLfDxFDJh9O4bu35V5LYmjU063WIZLkb/CxkGO?=
 =?us-ascii?Q?mLk4Zk4NvDrdHJ6Q16C4adSq6D9krWfSDu6yAJEu50WYTqzsBk0iSiAApA8S?=
 =?us-ascii?Q?qy7erwyqQb4vqZ4XSbxDqI33kPtR9NOJ2Yctdy9FKAbPzoZzICs/Hz4PM/1S?=
 =?us-ascii?Q?ylMTLn5pEGUjJdZ+Yqe8RK38ocEVGkd9+9jwpVtyL3uAR8vBhC1M/jfakrBz?=
 =?us-ascii?Q?C7vBR3mfa+w5P21agYkjAiiugMpOxEneOLELHOKGYLseorJq4ma+kY/POmM7?=
 =?us-ascii?Q?CnjFBM9f4pp0ucnRiUiABmtMWCbFHW40kYmH5EVLbqNQs16Jd8gzxQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xt1a6VpYrID7//ao88WUDetM5rS0Fu64CJUiye2gRJw/fos0eOC8NhWB/9ON?=
 =?us-ascii?Q?6yatnyxMY73VnetNTDJzPwlb1ssdeg4qb9b9cbwStnli0eIZzNPzf4HwbrWY?=
 =?us-ascii?Q?a54n5NLWL4x5Thp0QUbl7A98nC270Fv6biDNKUxXGvZ95jthUVNy+khJNarH?=
 =?us-ascii?Q?vzKllvlUlprGKvI/eVoe4FyO8mQklrqbxGbJCaVKP5zUkltvcJ+N1f7BZ4kW?=
 =?us-ascii?Q?28LuPs5Rm9nn/tvGvVfutcY1kglbucTxLVw1drcrUhDN84YKv1bcjGhy1cTR?=
 =?us-ascii?Q?dfkkGFhoCZNeQp/n4HMBkWwSOzNctpWk5vOErirzYoGjAMOTourEbEIQDeOK?=
 =?us-ascii?Q?Qv4KAkLk0s0ZsqOa9VP/3NxxTiF9gw/jj7SgPRa7rYeQTKJfGRB0aLf+SwPW?=
 =?us-ascii?Q?Yk695fIl8fB8AKb6VcSy96XcxTRd0BcuIJwzBhWjVH9wWPr2/XCB+aDkQO9Y?=
 =?us-ascii?Q?jNqPHzyx3ZGGOHwSyDE2cRfKnAa+aAoszYXG/xGHNNbiV/OtQ0ksY0JMTfyh?=
 =?us-ascii?Q?tpW2KBRR3rYXLyZwp2NQpxfbeIMY5Lot3MeDu1Sx/NCcvL7vEbAT6uhsQqI0?=
 =?us-ascii?Q?cota9wJny24HcSAeTaT1BSdq9pCwlMCJ9LP4rEAM6WwNGnQZ3AUJoGYPRsOc?=
 =?us-ascii?Q?yieHsC0cIYsNmToXFfAlLxJ3wMO/cBBuj2SMjyyEnkuuC4KVW+i6qUW732N4?=
 =?us-ascii?Q?Th33Jx69XRxRVWzhvyQANV/CZuClfNedUcTQxlBMnJtxn1YbPVbZxmVgd5od?=
 =?us-ascii?Q?m4yJ2yVxuZHvYtC2eKQ1gWye0TAxTiZhahkr09jwJ1qRJ8jPLH1pr17SKpeX?=
 =?us-ascii?Q?R6F5AcLE4VMadS+pvwMCMmp0YvSIbEt4/JHDoFUx8GleCNyPSO/JGG7FuMP1?=
 =?us-ascii?Q?tMdB8c7ngCkD+DpvgyIyTC4B0m0uSqO9dKf/QAgHVIyfRCf1wRAcE/TiQpE+?=
 =?us-ascii?Q?0COjIpAMSYYN4ThsDfLN3pswA8kwcKAK+3kmFmeaLDgGCwX/HaAXfIuufJch?=
 =?us-ascii?Q?uRmwMgJqLLplh7IQVAO7tWU/XXNu+7rQz12p/ErTlm1UydYvHWvaMlFTc7ZZ?=
 =?us-ascii?Q?WWkUuLKJPfI+ZEES08T5WCsFc8MvPQbH5E0tsRvgH0fjZXIBA563F7m09LIL?=
 =?us-ascii?Q?sVW0ZH8JbZ/eMvcvL1qckuA7nJOVKtv5pr7FliaejoOi17K2VK4O313Jha8q?=
 =?us-ascii?Q?mnKoHty6uBRNlxHQ925XLNDV7m/oP0CzwfCjKrdYZSlI6yAaPI79a9xJqJKL?=
 =?us-ascii?Q?lhITKzP/Cd68FBv+kAMqTYMQHcJdp3NijZkxBes5l1BGUxsJJcBVfasC7sSH?=
 =?us-ascii?Q?R1V7gHgCZcRzXTg5p2TCSIKwGaJeIEHCmViE6N20cE+pGPmETm96ocCvuN79?=
 =?us-ascii?Q?0fZWPsCfkuKTU+h9USI4wIxfa3DgVqdRmEwA9m2HtJ1frcGpPjP2D7FsvhCk?=
 =?us-ascii?Q?epz2PGObrP9PJpKMKbOSMsetx+gcLqe8LvMyT3gbW9inF1e/VrBLkZ70JUcv?=
 =?us-ascii?Q?Y/fviJCTdMS9uf7fH8ZbimlIsg0JajZi1Ufj/Xfuk/6BLMXdzqRmU+EDpXC3?=
 =?us-ascii?Q?ap9mxHL+forDpwJQYyamcyUuKxQk7F+nMTppC2YbUM9JqxKSvI/PxaJBQsLL?=
 =?us-ascii?Q?ntsKfFZktjK6PVtfX/66kCk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1befab8e-641c-4d6a-431f-08dd927766b9
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 23:39:27.9902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rtDEYsGrmkyPZ4/+U57e9sPLzfcdxssJpUT1Lpz4a4APnETXR+eFXY6sHZdiafjnm5S+8sDExqisaU+j/DvY9oQpnwFxeDOHYe5WQMHywyxjn4PoNCqiWTLquW0qSMFJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10204

The yaml has "hp-det-gpios" property, but Audio-Graph-Card2 can handle
"mic-det-gpios" too. Add it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
v1 -> v2
	- droped redundant

 Documentation/devicetree/bindings/sound/audio-graph-card2.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml b/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
index 94588353f852..bbc7513b3206 100644
--- a/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
+++ b/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
@@ -39,6 +39,8 @@ properties:
     description: Codec to Codec node
   hp-det-gpios:
     $ref: audio-graph.yaml#/properties/hp-det-gpios
+  mic-det-gpios:
+    $ref: audio-graph.yaml#/properties/mic-det-gpios
   widgets:
     $ref: audio-graph.yaml#/properties/widgets
 
-- 
2.43.0

