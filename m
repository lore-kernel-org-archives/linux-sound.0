Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013027.outbound.protection.outlook.com [40.107.159.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F389835CBD2;
	Mon,  2 Feb 2026 10:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770029856; cv=fail; b=hwZXiEPvt8XEF/z8Dzq9vaRo0qJFHd6sYo0ZpkOKjIDfzslZdQFVDxg0+hUeC7zimFrQI4iczwUnPZnKGzpYP8zxi/L2QhIoW+HuhHZuImL9524kW7EmKiw8FAlDHbjzsgZ98wKOm0mcXJeedrFquMUFPPl16fAv5BvVQZs7gfI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770029856; c=relaxed/simple;
	bh=vYxiCQaqlEe3YJL2tQvYIa7D3DE1uZsxLaZ5Ty2xlug=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gk7QAS3dJH53u+N8haDjM8LDwCzijnPnF+agD6iCjFLf+0FXj62/0sfV/loPYwC8H0qO0Rlw8rou+AgIOEGjzkzM4z8bu4SGU2AZmQWnKWvXTh1WvWDzo43jdIWcy2E1RjOdT6Gwc/WfB8ZVD4s/GlYJnvQHKivOwROjPHWxhiI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WTqjKv7M; arc=fail smtp.client-ip=40.107.159.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WTqjKv7M"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MnWUpU19N8LzVRPo7wsOyYmGB150uy8ODXsu2+I8pexnueMOIE2dJEmR0TBDQ1QdrHvO6jPWSi+mg5/3YOTtK3lIqjZTaQx6/ieE9nI2d7irUbSlAz5zQzSxQS8kzoSo3CI5vrfnFQ/V5nYEVVxGuw7co2Ijjup8Em+aT3d7vYyDmb7OZ09qrGl0FlmJIPBmmAW+6YkRC7Mum3iFjDVUttnfggaH68Q3L9OIFRclLZXs/md/m1+cBddDFoCeCbgJiqmWY+N/D4Rm0ZVw/JMArDiYbI/r6ARUCEJWAhX8IuVdBKr5j5HwDq1HcFiDdNJSlqCZ2wvAasMx9Uomto7eSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+jbcNarFbT+o/uE/qYm9Kkqr/+Bd4MI0W2Qw/sWzpLo=;
 b=P2HcxoOrL+sB5ErsD1sHgFeAgGsnSzc9qjkear9HLOr1aQqHRSV38ubpn3B8eUaTZNxQWIikMNYB3RSPrW0TSkaoCUrQC+9ukKFmxzD1YsoWmewpQ8rOgRlE9RuGmaB6OxkWTZ+t1XQR/yJe8VqP0nvXAuh3FhWb9lXbBHmvhtOA6pjb9jt80Jzgw/ciSrNkQTGPTQ9/3ffsXcBhlMLR3TYLUPVDOpVwg3Wrb2YmeQSqeLeIrFf799aDKY+fd1pGBZrzk2FTwh1geAuepRbE1/Slz3VJQRLLdt/7dSz7tu//eBXvcRiqguxbtXcwEQt72pbJma7atnfMHOiAfBaeTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+jbcNarFbT+o/uE/qYm9Kkqr/+Bd4MI0W2Qw/sWzpLo=;
 b=WTqjKv7MmmRObImVfgpbxBFx1XRIewdsNZibPNwy6kLw+TDoS3n0N+IXXnw6fU7IAGl/UG69dw2FDxToyNp754E/vBlLEr5Ohm316eVLgdMCvbkx+iy/gQMlpaVNGldicftLt1fp4+PT202xfk+56hlVcsVyaq8AmW/2h9RnHToPBdzSt+VUCa8n+ZGb83gcTqh+/V7NF0EHrL77tTSNlQpc/9lNO80sTV72Usa/8mzU91fqPtI4youdaUQlQCED/aszYrelq2n5er1TJf1FTbpra/s2Xm2Do5rD9lu4TWc3xvWbvOmDt+Q5ID2U1YjvAcNUUgHvsWQr3pILVtbVbA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by DB9PR04MB9702.eurprd04.prod.outlook.com (2603:10a6:10:301::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 10:57:33 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 10:57:33 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shengjiu.wang@gmail.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND 1/2] ASoC: dt-bindings: fsl_rpmsg: Add compatible string for i.MX94
Date: Mon,  2 Feb 2026 19:56:21 +0900
Message-ID: <20260202105622.39772-2-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260202105622.39772-1-chancel.liu@nxp.com>
References: <20260202105622.39772-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0199.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c3::14) To AM9PR04MB8353.eurprd04.prod.outlook.com
 (2603:10a6:20b:3ef::22)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8353:EE_|DB9PR04MB9702:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fa0c893-cc56-4f73-214d-08de6249dd98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4kFqv82mmTplDAVXAJbWxrDs1EhFslZjHb9nmtTatWhd2SidmsPEY3YSoVvZ?=
 =?us-ascii?Q?UeF5GyA1jgrc7LFZvm5asOUHsSv2E68lQPa855tZdIXRZCErfnFoPNqB0pQS?=
 =?us-ascii?Q?77qDn74FxcTaWQnRiNVCYPDf3hDHZxSKP0D7IlXK2GAcE7v3Mfx5NLwlfc07?=
 =?us-ascii?Q?8SQqW9iMAi2+3kBoQWLk2N/YZs3+v0QywNSkjTiVVhwdhgw8y2u3e0D1DatH?=
 =?us-ascii?Q?ZTR2kGk007EkJFr1klu9iUKB6ULHGhh1GXL4GfQyV+bTDSWyV1mqXhZkqZHp?=
 =?us-ascii?Q?pNl96zknRyMDKGP7OmS8FJ1SR9Z0JqeACrVlRrGiraOn1V1BRXOJHTo+U3qZ?=
 =?us-ascii?Q?+Z+1Sd+I7gbhqPO3zMKaFlYAWQ6wu59dUiBJ9a1cGIQitRGTofzQaZYCs2Zx?=
 =?us-ascii?Q?ykGaBa0C4Peb74jybKZ4SuG1nP1jzK3eJ8bI1SewKsNCdxQPNCZ3SnT3+r7Z?=
 =?us-ascii?Q?ay31WFB4bNwneyhZ/KJAau3QxanvOGIvroHMYwCY7Rp7TD4D51pD5on7mB7A?=
 =?us-ascii?Q?Vgshop+Se0QqNtL2PbYTgdl/ToPQueOs/+Jh37+ZNAEOXFOZQDPZ75ASVhil?=
 =?us-ascii?Q?9oWvRfBjeDy7HtX+YEaYtXJpfKExEFIIcKFWTL6NscTOaAnLJ/uKlejLOWCr?=
 =?us-ascii?Q?nqDYMHqOMRechZ+Rc7LYNXQpRpJzoRBXvkUcWKEPTrZyjcyEEUM/j6AZ29r1?=
 =?us-ascii?Q?A+90yVAXU86D21iUGGg3/muBlpvrQ8IoFRlDFG8jlnsAueKpzzXGd36sn3cH?=
 =?us-ascii?Q?mxWEA1mP9muVAheRJ4alEWAjbzIq35F0bAyi8+JzDqoWpl2bXGSE9bxDGTWG?=
 =?us-ascii?Q?ajt4CtMOKBaPQPYFT1TtGHVNTsQWVPRNfaODAQpCe8eBVVws7TaMrwTVBzLN?=
 =?us-ascii?Q?11hrXVXaRHtJbOghk9KQTOBiGC32te3yyEmhaY5uNhO2b2ye5fZP2u+i00+r?=
 =?us-ascii?Q?9s+JlvPdEFP7gI4kRt0KhEciO1iMWsibrFDRe14Uzam0m3qws+e1HTXag6J7?=
 =?us-ascii?Q?Ax+BgE6rSF2GSxC26VPCHopURn7YvEZPYtQtGH2MKQloTVStJuAq3nRspD7w?=
 =?us-ascii?Q?fhHN6Jv40WoZiPppvGqUrWRjUtvLchFHKxM0u7/TLA/x2+dzt2NZuJ5pawuu?=
 =?us-ascii?Q?whXcuWVOfQZwSIpuVtUL0cxgCEImiY4BiLt93SYz0JjN9xlC+x8McysZWFA0?=
 =?us-ascii?Q?vZ4bT9q6gNBWp0RjbeRV5L4cxg3+YKoBt6DtHTKasDd0e96HEVEZhkNlm1PM?=
 =?us-ascii?Q?xHYjXK36tcuDxqcvozjk3KNSiIwolwL2WKgQ2klsQP775cZbWxgNb6DqWcfB?=
 =?us-ascii?Q?AJHGCgFeKQ2ylJNeWnZ23dyEC0lWfpvfmPqwVJIy2giornLdwFNDGZIw0wHJ?=
 =?us-ascii?Q?kSK2g93Cb76Q87KDcPoszaUHM8l8uOrFUqRchiFcekAC7GWu2KRIuPWsbQV0?=
 =?us-ascii?Q?E02p2i7Yf7eDqWkVgFR/0wVbUymfN2k9t+Z/C8hrivXS8Uk7GINZtk2/86+9?=
 =?us-ascii?Q?Xes19cJ40fHgSv3C8aR3u99M70Dh7M3MsUSK1Y9shsCpYJGrS0P2zuQZQk0C?=
 =?us-ascii?Q?MgxrVffsOGiRbHiazVyjNgqNOzh3k78d3ALhSIrxlh9iA+7X0UoEkeIzV8nQ?=
 =?us-ascii?Q?i/7ysBy1j7FUjlKYVe7krRI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xWTp0f91i+nEyf/LoP3VlOEi4wzIo+A/1ObJkvFe+RQYEKSlzVlu0WH7yqrJ?=
 =?us-ascii?Q?cyWd/2QX24heyNwOqeegcPFIyeeRZV8r+LA5j4r4MVPYC0Ij+3CA6y4UeeOg?=
 =?us-ascii?Q?1uymIAU4Dk3rNGV/DYGBHGoAkUuzBrZxoOu0YrLFiFFaS+21tMccBbPRFdyZ?=
 =?us-ascii?Q?ya4gqOs4qapdN1h1fWCYHHdWXJOlzFiqp64EntngNr89lAtjVZLtGXZ73TCC?=
 =?us-ascii?Q?LyCwLqfc+chv9y6QkbAbdPoNxl+HSph9pdgDKVpYCrf1LgClyyPBgJgsnBk1?=
 =?us-ascii?Q?6HC3OfOu/jCQgy2Is6FXiBQm59iS+x8hRGwXL52R9rXhbolOXfYfyYYVpvHz?=
 =?us-ascii?Q?tJ8wAgQzZcTNTRLwx6M3qqiGJ0JmiACCJJoVFxdslCv/crUwh59DsGBFvrQD?=
 =?us-ascii?Q?BNcrExfvKblYbB1jf+euIuvAQk/rzfFFdOU2jjJlmJDtPOlJ+oL8v0H0KzSa?=
 =?us-ascii?Q?CSOBWfGL6SUqX3Kzh0J0FE63dOYnCP+z7+tylhsLSeK0jVyNgOR/OSUjjqB0?=
 =?us-ascii?Q?x6UaFdvfEyPekTaUoOnEt0wjIuIQOIcks8ET/QumkoJ7/5mLybBV/TExqH7e?=
 =?us-ascii?Q?FUQw9OSk8n5KHzfRDO7J04RU8crvsIiUT0gGLwhaXxD4fJOuhyrqWAuRUxpI?=
 =?us-ascii?Q?3W6IqC8eTyd0kqEzut5Qg66r1ueeRC9VnRGsGFPnlMeAIL585Vn0gpSfY22z?=
 =?us-ascii?Q?iJO8XuUBaDPwT8L+EmnBeShoCBTNoLjLzn0g5v9DmMxn7d4urP9FqLz0LGIK?=
 =?us-ascii?Q?CPAqjT38lOIhfr28f1HxwNLhCI3Mh64inPtIF+eo5lFbiM7Gg4H2SnfDR1N8?=
 =?us-ascii?Q?0BW0fRB1OfATrS1wLemQXLjcfguRxqgsTQWXiKJVU3tFzWFuZEvfZQXmg9Dx?=
 =?us-ascii?Q?tVbWUg0RvbL4QRIa22bnAOSxR9CFEsKeQWfbVwqYlSJTJTwQjZfrU47nWzMN?=
 =?us-ascii?Q?PyybGSWjbMbGSL4+83HtDdSzJjr0yKDT82SdTdzXzKXD+698wlQnJ/tDdnlZ?=
 =?us-ascii?Q?FvWqw1USBRlXj5vYFcjusw8GL7GjTG+SQErxsaSHxtMYkS8r2O2hLu5q1QaJ?=
 =?us-ascii?Q?emHmI/uWthQHEYlupNcf58i4Viy4mu6iz9ubc9UsBr+vhiJ7k1nPUmrJB1+G?=
 =?us-ascii?Q?tdwTvbYrYaO56sZLOFfAT9NGdpvZYsyD2kU6/ljH8VhBnhIZuGcMF934u6BW?=
 =?us-ascii?Q?juZsY5oAIPZGSImB8rx1y5sHho7vy0V7f4ZbaphfNyu9J+9dGFVBm7vskS3g?=
 =?us-ascii?Q?V3CvC4aJVV1hoo4BlJO74pIL62c7H5FVqYsRe/tCVIiYur2hGDoRSJb67Y7W?=
 =?us-ascii?Q?0TsL5Z77Ig5T9cus0UnQCdF5dgMJWkhZzA7l8wL/7pStsXyydZ/5AOWCr8RB?=
 =?us-ascii?Q?WvImlkc37VdtWUyd6Dy3fUHKRHJ6vk37RVgfu2TvOUT+DhXCVyWZ1PfelPZL?=
 =?us-ascii?Q?QwJUWsQW9UBJCCnvgfUXXwpnDENY1/U0OC/Ckttb37tibe5eSdlwuQC2cruz?=
 =?us-ascii?Q?ponQIYqi4s3S1EkGNZMTLEaIBZo1DAiG94e/eMY9xF3PXermYijxoPaGkGmf?=
 =?us-ascii?Q?2ceE18gOwbK+7Ac33+VIfHarTuvR8FJLnPZei0TSRZEZirmtiaYaLOMF5HPF?=
 =?us-ascii?Q?R70X3f270TnQjAfJ5bSNH9VWSMKXW6yTIp8/8WJBrni5LmWRAbzE6sCrC3ik?=
 =?us-ascii?Q?CrQAy6KUZmN4/rpm3ZdgJodA9cUG37FmhVKexIl/JFwCs9/J8bZnt8gyUabO?=
 =?us-ascii?Q?GB6l9cDUJw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fa0c893-cc56-4f73-214d-08de6249dd98
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8353.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 10:57:33.1003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tayt0lTFQghEZz2NYEMSiAZtI6k1eMFoaVhpUAOR3+EnF+LApcVg3lGrLnq0/imFWPyUHVPPBy69FRgnka3QTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9702

Add compatible string "fsl,imx94-rpmsg-audio" for i.MX94 platform,
which is backward compatible with i.MX95. Set it to fall back to
"fsl,imx95-rpmsg-audio".

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 .../devicetree/bindings/sound/fsl,rpmsg.yaml  | 21 ++++++++++++-------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml b/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
index 3d5d435c765b..48cd5fbeb8af 100644
--- a/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
@@ -22,14 +22,19 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - fsl,imx7ulp-rpmsg-audio
-      - fsl,imx8mn-rpmsg-audio
-      - fsl,imx8mm-rpmsg-audio
-      - fsl,imx8mp-rpmsg-audio
-      - fsl,imx8ulp-rpmsg-audio
-      - fsl,imx93-rpmsg-audio
-      - fsl,imx95-rpmsg-audio
+    oneOf:
+      - enum:
+          - fsl,imx7ulp-rpmsg-audio
+          - fsl,imx8mn-rpmsg-audio
+          - fsl,imx8mm-rpmsg-audio
+          - fsl,imx8mp-rpmsg-audio
+          - fsl,imx8ulp-rpmsg-audio
+          - fsl,imx93-rpmsg-audio
+          - fsl,imx95-rpmsg-audio
+      - items:
+          - enum:
+              - fsl,imx94-rpmsg-audio
+          - const: fsl,imx95-rpmsg-audio
 
   clocks:
     items:
-- 
2.50.1

