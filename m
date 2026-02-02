Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010041.outbound.protection.outlook.com [52.101.84.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E2B359F87;
	Mon,  2 Feb 2026 10:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770028608; cv=fail; b=AtfFrqfZI/kJKpJ6qx/K/3er32axWypyEzB45hNvxR32o4wRndnU5vzB20+Y/WBHy+neMPR+kvPnYmgaS6Tq8jYQ+6yo8FoWsn4t2AFOHEN363WVIHxGoNNUxjH3wVranGvKJ6HIWPwBSu8tvDFtCVTNKm7AtcjWZ2gA6ErnR/o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770028608; c=relaxed/simple;
	bh=ZNYY7IPKBOwn/RTp2ORloFoAXZRyHOQFKoNpI1OJ0JI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IpAd2rjrYaTdx9x2Vsh1dVIOl5zZS405rqVlWVSkZlS3Ca6ISmxtbtttyVNDfmaUTJYMitE1cVVGe9vr4+HEBGJLgmbFKpWLoozo/QkTvU8dxGfxJAVm05y3i+dBOZcPRtiiGhfZNVQKv7/IoRH9tgvX5xVmmBfinh5Savpahoo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=cjFgjHOz; arc=fail smtp.client-ip=52.101.84.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="cjFgjHOz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zQ0T2Y0smTPSELq07qrhJgqDdSomAV5Kuztd2znhkds4vzgHCikOcj4asDEy/4cQ9g/1ghas/5lE2qde3uEMYcLELU/suXFntdQcrr6b66uuAu6ezpFNgbmOUCj3daffAFC/l7IoS4kY8T9AjzIB0N0a8oK04d0rrGDpWSyG4j5nGHpb7uJ46qMo89KJjPEfHnIe6uO6yuHclFaPOsHxaXCqqdO/AfSRU/Y37e+2IDvtjKqZGrf6j9cfSkw1WfyrsG/cUEgVs5pR0O969fchITIQho63U/vCWhsj5oGAly12zW7I8rGzFN9TB8sS+UtusJtoS5fY616PaYrCb3mx5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=txxusRkmLc23xilW0g1sf9Xf/nPdgMhVqL2fAacvzo0=;
 b=pkeehR0frkllN4oZpgEn0RrtQpuf6ONbl8wde7eg5F41Y9GVqucfTty/aWdTvPEnHDBJ1uvICcXLJrB/LvgGvjZD2sxhcfgzAzQ1hRIalvfB8MHLEEOLA55WqvGxxs4Z276IZzJDH8+WdLEPEz/ciSKdDWBd7O7RQqBszGk5NIk0+W9snkcKCnTLsbiUAVP3vvP+O33nkyElQVp7CGIr2PjV2X/hlptQUDpjMw6kJHJe0ObLnx2iOggEq/x4QONzz//qRdfb3xYABbRssdEF/UEbqGkJg7nxAt3jRgnl6njIczga4PeP3zc8rYjrG6DqY3m5U4yIZVOZH9Dg1gq4wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=txxusRkmLc23xilW0g1sf9Xf/nPdgMhVqL2fAacvzo0=;
 b=cjFgjHOzxUYrXIQuNlWLFvjT3cCLO6B9+QM0a2cFj+rVbBuHFviivJhZgPVnlKHjzPqPHSQ9w4dsCDqpzOiX/RbwQQQCdqqgNRhNYcUCIUdIKmDM87X2lDa31HZJJp3eJiknO8Jyvq54ZkpjPGBz63QP3VOu7EaEZnVLTtcogatdIkBKVA/HJ8grhJntyF8+CKk+KImykZJZMFRcVa8GVGjk9oj/SHTJ+B4dcMfrZfFoDexbIY8EqKd3UvfcSQryfXMkY40Hf2qORjOwxgFPZdNmk2kI7Hh7UzWHkiY6QUXtajkEKo0esbhvapE8N7fUIqRpNyTfsGp1E84j9PeCEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by PAWPR04MB10008.eurprd04.prod.outlook.com (2603:10a6:102:38b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 10:36:45 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 10:36:45 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	shengjiu.wang@gmail.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ASoC: dt-bindings: fsl_rpmsg: Add compatible string for i.MX952
Date: Mon,  2 Feb 2026 19:36:18 +0900
Message-ID: <20260202103618.13929-3-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260202103618.13929-1-chancel.liu@nxp.com>
References: <20260202103618.13929-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0047.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bd::11) To AM9PR04MB8353.eurprd04.prod.outlook.com
 (2603:10a6:20b:3ef::22)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8353:EE_|PAWPR04MB10008:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d70cccc-4c40-4737-611a-08de6246f61f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eYmsc7GD9Zk2at6exmnldpsoHtyGcf6wZYfwcpXD967mDaMvRcJuoqHGPd2B?=
 =?us-ascii?Q?k087UYpxgbQCbF0VS4LhP+VnKTgxsMf7tf7f/QRPY3lSRoA9li1rgdx4b7Ya?=
 =?us-ascii?Q?KzhleQr4ofAOBkwhDQZrAMb8eOcEZiR7Kj+oMD1GAHIV8j5WLfk5Hta/pjes?=
 =?us-ascii?Q?SJK7rOoQjNSEWhZJ/k9YuuM4xbJ9yIzUsfeklXugACbElZKN8bIJeMbrY58u?=
 =?us-ascii?Q?XTf4zC7QbFQBUMRGppq0EzlHj+Yrbyg4/4wQeD4LqK6tAuz90oD7PKJYeQXL?=
 =?us-ascii?Q?jy82nvybB5/iLTuf9TVaRgMcgtc4FUKyFYIk/AnBqiSgmqKn9/JEmn1fYocI?=
 =?us-ascii?Q?SFej8dVZBYiLzjhcDOr0M3vfKv3N5rpygJoSCYFGspwDzJ0xd+800oI5i9BU?=
 =?us-ascii?Q?IZp/RI/oXpC5un+avDw1p87WRXrrdMzJrKHpT2YStyYW4FU1z97RKBX4AfUg?=
 =?us-ascii?Q?BUwV65tQNFuZldtgw6Ao4B3T04eR+APYW/DA4LTK1voFd1Gwh7n8k2tL8R9S?=
 =?us-ascii?Q?3BTS1qWJudw2W933UN5mrRaqaGBxhFighcJQo8IkYJbvFIN7FJTfsdLlS3iL?=
 =?us-ascii?Q?XKoRF5XjRpbaEv44Onl6wRs3oheiGxBFRw1Ated7ESgpcED0yUsRszPCz1Te?=
 =?us-ascii?Q?+22+BCMFSDFR+19pv34VfUafhKuS7FSto1rK3rTrvqRC7i61isUO4kG4BMLi?=
 =?us-ascii?Q?Pi7uKOZfTz+1Zuy4pKJhLX8sFOX+uSKHOs3qEWWCOipRYKSfFr/1aBgnj5FZ?=
 =?us-ascii?Q?h2qkIXSG3fsa5gwX3goC864umPUblRr1PTpGFoxjzRu2jG1MhJVyUztbSoQ2?=
 =?us-ascii?Q?D2JIA83XQyYYQyL1937mp12Sj8npvZOj082LFbr1zpnn3lafKp5NLA5IvZC4?=
 =?us-ascii?Q?ddfKCXOLaRilSq34mvv1TYsXosKWOzTV70X+gcxiRdmT40cyjxJzP/x27Vlc?=
 =?us-ascii?Q?jIYs18k/x37xOpiopU2rC5A/TdJPSBsBvcc3M8nZdKWIde7Ls7h4uvxmFSlP?=
 =?us-ascii?Q?O6X4z+CpiBmhpcz7W/vkHTihrHVT3axRVsUXX64HglnnUvyxOQtZwP9xSTIj?=
 =?us-ascii?Q?onKAsGBITwT9jSSpbDjAOA4SyAG98XYo63aJKitM+Xw/U8/M/jana6QqhU3f?=
 =?us-ascii?Q?KuLhz7ktJYMd+BXts65I6ScbePO1uElgz5TtNMUBs9bgvGIhWQaPHMziBgwC?=
 =?us-ascii?Q?+f3yaZt6YRF4zY/zEZJfTh4tEXSP6WxdpyyMHFjWYE4nKCa8CDkmJbekTmkL?=
 =?us-ascii?Q?DHrGhgNnazryuxmGp3glv+SBLRL3d0eEiT+zvBPMv9ZrtxkXOEG1VldhsUPV?=
 =?us-ascii?Q?Eprv2j6R3FK44WRAP63Dz/IDWyy6TWuW+KZrwRhy0utOciIPeKdtlenEWbYF?=
 =?us-ascii?Q?iebc/9grfcHuwlqUB7AE5bIbzEDSDTHyWydntHeS3vUA4R7yUOg8nvm4bDxv?=
 =?us-ascii?Q?BOQypbzzlzmXRff9SvjUU9t5qbJXVbVEn/SGw+8cghZmBJaQtVVqVv4Qic27?=
 =?us-ascii?Q?Oz4IPPljQKS+MbIBx5wsC+Ks9+a5Ot8T62jgLf+Pkc4wOOR8Z5gFdL3v9UCV?=
 =?us-ascii?Q?McLEtV3JvzykK4bgcVzYhONS4pQTA2Jv4b9ib5bXDqUX7BghEGfbyuMkwEJu?=
 =?us-ascii?Q?FSevvjehbm8zZdA2YaE+aJ4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qx7F4w4B86HCrLfZZoMq05ET5Es0ZCy9yet+yyqxI8NW75apvCgR+Lrie3HP?=
 =?us-ascii?Q?ENeMuppz2A8cbRIUcFOb61lRPotHWDj3fJ4WHm2Q47jPJN/kViSCgFM0GE+a?=
 =?us-ascii?Q?nmofueZgZFNnlDtMh8tN1p5pdSP21JOmxi+efcbS4l7sv7gh7z1AdxTODNrN?=
 =?us-ascii?Q?BTl0r3QWcOIQQdensVsDcUv3kuVACVoU8sG/v1l5oVIS1uE9V57YaxxoSdXK?=
 =?us-ascii?Q?dzajVniEwq/GIBP9snYNg+Z2NPM0M34NAZpb7SXeAACO29GTdcb4gPsIj/N+?=
 =?us-ascii?Q?BkgZt699zdx5ZGPcSqV5fhBptYTLAZpIfL902abTK3awmwOFYsNyqT3BrruM?=
 =?us-ascii?Q?ie1n9iQp4ZCagMvuf5NYvha77vjzmnHO75U1lKk/+fytFa1d6PIxh0ZJArKd?=
 =?us-ascii?Q?hofrVsQoFKtih+vy0654FsJ3oIIOtqNPwu6OYuyyDikE2Q8MEvN0YQ1//zMI?=
 =?us-ascii?Q?6f4yB6wYX2THjk7T0l7QAzpJEVKcdNDGP9Z+SRrEo0oQmf4EBniX/kaxgs0C?=
 =?us-ascii?Q?q6QjSBijEV9RQF+4pUt4dnnm1miokSxBJ+3GiAMRZCu7AKb8Yl6z4e87h6iF?=
 =?us-ascii?Q?mrqCukBU0QuBhK1qd9jmMUjgK+ptJw78aTDREhl4upA7kgal57XK6O8xUdeu?=
 =?us-ascii?Q?kguM67NE5rbJiv4hkxeHwpzj1O2R4rpkuaofC96ICsHE0BxXwuPfUN7cOx1f?=
 =?us-ascii?Q?syG/GZjFjk9KJdmm4WU3OWvogQ0q1BBIPnPtzmuAns5ut4jTNfniyvLEf0/d?=
 =?us-ascii?Q?qUkr9eKbHh2is7ObljvzwHtNd+lL59GVYSg3zW4pDeTwRZqKbNUZgDjQkHyg?=
 =?us-ascii?Q?NqyU/xrAuC9MBv01QAmSSOzgAe92q72z6NA2T941fUpJwFuIvOEgW0GsV+zV?=
 =?us-ascii?Q?Gpq1go4Alua9WJvzvCgz9pWLQJD3VpM/9SpQq7kRtleNkU+Dm0V/wx6FwPGF?=
 =?us-ascii?Q?D+JKc6kwLI4TsRaXlcjZjP6jTL8T3mWlNEeJ5wjKSjbcCDAmlQ4+4MHzf/mQ?=
 =?us-ascii?Q?6NKQ2urz7Q7WWhccGgznGEKBPhpKuUSFJ6sxfrhR/upbtAO941TUFCSAlCpd?=
 =?us-ascii?Q?1arufm5Jyt34/UKzl8V/iu0yNbvDcBD4rGNT1X3w98C4OZ4njMiHn7BD8lPt?=
 =?us-ascii?Q?h2RFYrRVyoYdMWlKJEsNQDEQwvJjB/4/4joKDFDiZyOQqTXUvZ80byTLeBfx?=
 =?us-ascii?Q?1iiB2pSFKYBqPt9/Ok2Vuhg1uZq/xaK9AZffuMuMJvds1hAUEQqasNiPypqn?=
 =?us-ascii?Q?3AQTBNQB0bJr2rRh36By6I6mKaB8dLXl06rqkrt5mg3asRRGooKfh0wzXT8t?=
 =?us-ascii?Q?f38+kc/iVWGsrDfSIIM7Sj9P/y/VfgKsfrJi7VBvi7keRhBfCr4ix60I7l2G?=
 =?us-ascii?Q?uOp10eoH5MxMu4omBdfphqWITdyX9lFWC9KHGbpNcpMKr2vJFXss/NAPfGpR?=
 =?us-ascii?Q?0g0MD2GizBY3l4NVnXKzdBrJ7B7o92Mzi3jlaFRcTAUpg9oYo61K9HUwjOY5?=
 =?us-ascii?Q?ma+DJrdiGrzMVpNgmS+2l0CtIyYfBy2d9zLnvLPnWu+rWn1bNrmDYORRAa+A?=
 =?us-ascii?Q?qHkZyeNVYpPG7VLP7vXp+x3eEFk8q9ckxEM+dpFZsa32Hpudp/8US2TRhPWq?=
 =?us-ascii?Q?LAIVaZ/RBLr7rZBKwIYDuWdabdp9I0UZkNbnEZUER3LCCi61e2miGM9KGfU+?=
 =?us-ascii?Q?VZN+5NoFnud5E267KuSwS+SZm57JagFYKcmmzXdtlbVUFfeNiU2jWMzLZihu?=
 =?us-ascii?Q?PTl6v9hXHQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d70cccc-4c40-4737-611a-08de6246f61f
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8353.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 10:36:45.3813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 78nRvD5Iif//hh8NJWNigXd/PFv2PGDn7Yx0/ySzz7Q8eqmXFECRZHEsYRiTuXmkiJX42I/JQiEQU4RbuV0u8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB10008

Add compatible string "fsl,imx952-rpmsg-audio" for i.MX952 platform,
which is backward compatible with i.MX95. Set it to fall back to
"fsl,imx95-rpmsg-audio".

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml b/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
index 48cd5fbeb8af..3a32f7517d0c 100644
--- a/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
@@ -34,6 +34,7 @@ properties:
       - items:
           - enum:
               - fsl,imx94-rpmsg-audio
+              - fsl,imx952-rpmsg-audio
           - const: fsl,imx95-rpmsg-audio
 
   clocks:
-- 
2.50.1

