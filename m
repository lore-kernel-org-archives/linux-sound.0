Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013062.outbound.protection.outlook.com [40.107.159.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D5B35D5FC;
	Mon,  2 Feb 2026 10:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770029861; cv=fail; b=MBUBcNXsJdjNyMQ05aoPMP1P7GMLR5K0ZoHcvIflsDkwBfyfUnlF136uqW3MVuEsnynQtA0eq6rFZmrUD+iv/sUw21xgU6hYb/wR4TxeeDKVRVxK0/PJ8iH93kzbKYfS0t7hMFbDD1dxft1WA3K8ZpyFWA1dPH+8SOovLEMOlcs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770029861; c=relaxed/simple;
	bh=ZNYY7IPKBOwn/RTp2ORloFoAXZRyHOQFKoNpI1OJ0JI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kjW/BmlnvGC2p6i7HslrRlGdCQ43CBPFsIDIdeOauD6nxBCnHr2n2lKOwOwllKRklB3WQ2X+u6oxGOv3Twc860MXsIyZYNGhISBQCEe8krFO7QUIVKKqo1jGWLphxCS0h7HyGHA2GdMvcYwIZJ29IFqgW5xCu+3aYzJoRTR4XK0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=NBVdCBgk; arc=fail smtp.client-ip=40.107.159.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="NBVdCBgk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SDg4aoijykwZnm1JYPx9lu06LEGT9NV69EdNxYLbBnHiHyEpB56jIYsnk6rsiic4wkU/PBEdUxXiYbitYl99/z7rA+jV+mmodJ4wHD2hPeFdnPLFA3BX52uicaSdA6M/EStzJ1dMa8SRWI54jjuY6LlaFsfC3ynOBSywlrZO1uy0AJoCuN15D5V0TI3ulWf2amUWNOT2b6L9FC2olkOWets9nvlICAtmcrDnWM1D1ZywdAQNZYfYdr5aDapHTJje4r2fXNvS5Y+8Oe+rqZ535x8GGY+Pt8f/CRClH7fPnTWpWoIVWeEr2cFge2e0WySkDO5ix6tnVq1HxVFxGezuiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=txxusRkmLc23xilW0g1sf9Xf/nPdgMhVqL2fAacvzo0=;
 b=VGUfe4woySaEWLbMEkPXpuV0bP4eqSPdLn6f9J/MOcXEniVYE6Kcc9okvZmAz7YdQWUO4whb03GCixHKrDDZbWQIealvka8Sb6yvZKiUTN8I0pQLHfTpHIy2GEaZEfdAxlMLtpIjc07VNRrQ2HdcOpZyemBCk9+J7hmz3ki1FZY1ecOdS+EUE6UBNvLniAhbUDDIx7maRDDQO/uLzivf9ydPKvy6AtC5Aja8hAHcEa/At7uKLsu/5glB8kkxhlAkwgVE/sHCXvlBsoyW9MTaqwPRX0fGBPXLvUoRMAZMCgNn7w3uLnpkb9vR9knya9CLE980qJMXSrI9TmnUOjdIRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=txxusRkmLc23xilW0g1sf9Xf/nPdgMhVqL2fAacvzo0=;
 b=NBVdCBgkRYZ9Flczs+jSzDvXR/zD3au2FIh9YRGDtvLLYYIISWCmpS8KuGc+EsJweu1y8z8QTXzfxDZ231rGBqiUAcu7w5HqAs50J5HyQp1wJxuFjJhBQAi54nTx8nQ0yw1CKsNqT9yn9CRJ5uvobRL7tffhX3UQ7o+65pl97L9lQHnxwS9D+XNXrGFqn2WT+YhzNXpBzFbvpi2lMXALJo15kTyCampgdzZCpTPsb+5nXwld80qj+ZjneltgE2MT+bh1khG9vNAzyBH3L6hx3wOBHpgZNKURjq9qXyAbW2J9v2O57hPOvxgfIKDFORbeSzHBShsRmQ0RixR3K78ATg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by DB9PR04MB9702.eurprd04.prod.outlook.com (2603:10a6:10:301::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 10:57:36 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 10:57:36 +0000
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
Subject: [RESEND 2/2] ASoC: dt-bindings: fsl_rpmsg: Add compatible string for i.MX952
Date: Mon,  2 Feb 2026 19:56:22 +0900
Message-ID: <20260202105622.39772-3-chancel.liu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 6539ef56-f654-44cb-05e0-08de6249dfcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?E81ZMwh8hJqjvK5aJiQfcfzRtsjXqxiCVsFAOZgAHspDcWdaopPLLg1hessa?=
 =?us-ascii?Q?Mtw17MyUJC+tyTKlUW4ZLd1Zy8FDkPPpuzrgUKabSzMTuDoFMCCHPtEDIU09?=
 =?us-ascii?Q?GkrldsdZrIA07kgn2hmqH+gh8rRwNGSeU+0HJn4M6jbbtbMtRFdDG7I+QZSu?=
 =?us-ascii?Q?19XgWD5650dWhhv8DMeWMzguV6to10W8NQU+PNPzqt8Wrcfd8BwjI7Ta4duO?=
 =?us-ascii?Q?yl10pzAKXcsPVexQjbf5CTOoXfrD1rq9ZfevyibyU5mRPIzEGarmMhrgg3Bl?=
 =?us-ascii?Q?N59NCVnRHIPQM+BNGiKTKl3aibTaKPn7iFy/Zus+yGkoUBfnM4Fq6gW/pJVn?=
 =?us-ascii?Q?0krCXTjO0yT5+TRGTnQL0OW+1k+ar/l299RoYQWr0zD089pmc41V+zHJKgoo?=
 =?us-ascii?Q?1SpfcrK8AVK83R8R/LO35VnBDi/24I8McTJbsEaom/eaVUOJ9J5AyVxTxyIb?=
 =?us-ascii?Q?w0/ybB/7sbLVdWVVYbl4rU72tLCf/Zj1+Z1y9zrWpWkGRaRHSCW1FrxYlWPk?=
 =?us-ascii?Q?Js7L2E7Pc6SQmfpH8U7F2RgSKWWLI5uAuXDvPZHdOr8af3WxLc6UuIVZrycH?=
 =?us-ascii?Q?NyAZPTHs5vfF7TZleID9agdtpwl71epiJ8N3Vx2U0z+RwIohpKzIIEa4icun?=
 =?us-ascii?Q?QHmXsKpCJdFwxKsUfMRZPBzRVMuwRQPuAapXYJhDPjsl11JJJTn8SwBbkadS?=
 =?us-ascii?Q?0J7HTrx0wO0uHMHZypn4/nr5wb+vWeih5GQkvJDQeZ3yGAEfSyiLvS56ur3j?=
 =?us-ascii?Q?By9o4UX3SilXyxJB7Pny2+5r5eQ+MWQoCHqFnGtzE4AgAzoqy5KkIPKwx+MA?=
 =?us-ascii?Q?F09zZ8Kq2KFMY2yBv8p6Z7DxufK/VxzZ8GyzOTKr2n3yiTRr5fISTCkQ61gJ?=
 =?us-ascii?Q?OMvyk6d/RUpQQtJW1mjNXyn03L9qGMtIQB8SUbDBobyZwz6Kq5feYhynw4vY?=
 =?us-ascii?Q?K6TnKbP+eL+PiWmI4vB2/07kwKiac6C037arDtIqJfc2eb53QZjf7x/90gSQ?=
 =?us-ascii?Q?5rwlXcwQN4NudHjihxdhdum/tUts2D4Fy9LFWgIE+VKJk9u5sUum7PXxt1Gv?=
 =?us-ascii?Q?mKkKYb9601T8HncKVn0JN7P3j60Ei7Cd3OqfPo7iANU5upcRdlylaV3vfTYS?=
 =?us-ascii?Q?XEeOIx1SasNfdf8aggrqsPqKsZDerSDgQ1P93pF6byxRra3VIcy90Nydvh8J?=
 =?us-ascii?Q?C48sh8hIYOulFfCokhPtZbF/AiEHlKiSH79wXH2GbDecxkVjUsQtSb8vb0p9?=
 =?us-ascii?Q?FQaYsvjWhiSIq4oLUTeHLpkrpC19GNNs8ARBaJ1i5KJSFTdrDbAe2Yl0c9M1?=
 =?us-ascii?Q?gY15iKiEF5P1K+itwFqdZzoN+lmr8/FcvN6fD3jYD/OOOpdRqhlbYybQn53V?=
 =?us-ascii?Q?EQTpKxekfFxueciFxXyW9xW9C1zUptJojf4Bo9yXOZUD9tib3WN/lK+mkzds?=
 =?us-ascii?Q?BMmR9jVmosae72iMxrMY5vGXDY8RlWuYEm4jdSwsAwdq6vU5yDXOkSxDn4dt?=
 =?us-ascii?Q?gXuri5sAdncVcHCfR0yFymC2riJJtTz16KP70Sh9peJ4JbVYTAXnbJxjNeXw?=
 =?us-ascii?Q?P79VKvSIPrzM9nmXZh8lkdu8HfORFw8r1hCLr9nmO8DGt4jEUOV0otKz/MBu?=
 =?us-ascii?Q?hTTXOvpOPpHmndf1WmO5hzg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Rh4ZjaXz4mivq0O6J+IubZ/sIJBwj0bBl+oallI8/qxSWHmpEAqFH2qX+RQh?=
 =?us-ascii?Q?4XNJ1IXZW2/MwzMSnsCa3aDoIhkHEZIZ1IAaBY/dL5YFbQxr4CWJOcnKq3zi?=
 =?us-ascii?Q?hS3S+hBpuxtKHBaDG+YFo36zKGRZ/hhDN5YAMaYzSL2+1tz+AsA+86oQPUeV?=
 =?us-ascii?Q?5kWlTQM4SDgjUgefWe4CpEPdm2KwDM0aFaHu9tjTHL8o3jf3SLCmBgBvIgYX?=
 =?us-ascii?Q?hY0oL2O/2wm1+q6tYd/Ap+V9AfMyqW8AwxSqPJCZyGMXr8Vln322e9yrVcoT?=
 =?us-ascii?Q?hX+uloPt4/3qomwMzjpQQdh+id8JjwHrydVjvr7n1/hynKmn/PzVMSMJW6km?=
 =?us-ascii?Q?Zufjzm9yCBuCS1lZuSspOopkKnwwHmSVZeccwAz1rzSxXV4N2DKyLYC2KoSf?=
 =?us-ascii?Q?O8xcC6RFO8lMvpmHk+s8X/jgvpw9L4jC5kXRcbXXhDoDs8AZFMsJ0I7jeDhV?=
 =?us-ascii?Q?H5781fR3u/CD0gnWoznuL89hpARvnlx8TeT3PjdOVTAACX5G+nsU7tu+z4/3?=
 =?us-ascii?Q?oEE5wKQkIuf5c/K3WpxbFfeJMR51igOKHTrpbWJFgenkrNCMALxw86fn7gGz?=
 =?us-ascii?Q?NXWHTOya2NIh00Pyjd4lmDWZ2mljI5spjp+rAPZZcvyNREWiVwfGSGP0zEQs?=
 =?us-ascii?Q?YahGNCAsMvs620qb6NvsMwqDmCJrGyHIeQgFF8f2uiuPn1lbi/GHzRNGOYDr?=
 =?us-ascii?Q?SVerNPVhMm3vJqhi41kVPpcTDOxm+SV9xSaM8zM7iDX7uv4SG2Atf89b9Rha?=
 =?us-ascii?Q?Ppvr3li1EM8KLjea93B/2JcoBJaxTlnTWmzQXCoyZJ7e6nSjT6MwIiwNGYhm?=
 =?us-ascii?Q?QOW/AGZr0OFCO6IpAl6Y9WqwjGtiZ/XCUdOJUVAECxs7JTB/QjskAd7YlTHU?=
 =?us-ascii?Q?espEF7ZSXhEaqu2ouXs/JE0rmSryD31eme9RbWdqOjhRADRBKRcmCL/HFy/d?=
 =?us-ascii?Q?6oyUyy0mRje8GyeS+TBreN0/V07ADyX9b+57XBPMUmGdDi33m3kWuHY14pVP?=
 =?us-ascii?Q?SHb23g6Lw9RFQcILZD9hD7W/G9Tym97XXrq7+uDooJuvKxg4sUHVSXnOmIpL?=
 =?us-ascii?Q?7FR8p2pmkwqmUcVZAk9QjQaDPbpSOk/O9DgNw5Q9cfVqgbP0cRSEsny27y/R?=
 =?us-ascii?Q?MZ7QnBl/OESW/tBSVrMx3VKuLiTbJh7DbkLOoB98kthroyObO0El1yORTP9W?=
 =?us-ascii?Q?ADULiaxLZVLnCAq8Jac0tAp9X2O99J8sarOgqgS856jlhkWRnu0uwGXc0wMW?=
 =?us-ascii?Q?ipCjzcZU/LfOF0cgQC16G14YnBJnRXqAdogxDuWt5sbuv5Rr3oDUVP56LEe2?=
 =?us-ascii?Q?KmTWqALAx4ZvieFYkhl1BjghHu457IpiPnxqWxJ2PTtkomzmVa59BSeMmAVd?=
 =?us-ascii?Q?1ihhpcVdLc4h00EOI3o4VDgzfohXp76NZ+Q24iIygevDxrGyr/FylCIOUCkD?=
 =?us-ascii?Q?pgro7HcgVkIsO4vAAR5uvdTbNeoIOyKoW42H20cD+tzUOMrnsr3pDhykcR00?=
 =?us-ascii?Q?ytn6xIbIK7zHeRTugG8Qm47735HMBQuktwg2y72IvjSktoQ2S1pxc9gSd37g?=
 =?us-ascii?Q?QzIUcsXd2/tOJInNx5ie/yWKZ7Oyz9btOvdPOdHX8GH9HFGNpo6eovQfO+sw?=
 =?us-ascii?Q?afPTg3fUjAuVgWSdZJ/8TFmo+/hnozhwbtbhLYVFjJRjCr4hZavYdv210QIB?=
 =?us-ascii?Q?+nW4MyCE9lZCf9ZRo4lTMAdiR1WDh2v7KGX98sbuPNtEbUm54gZsRIu4p6+W?=
 =?us-ascii?Q?7jDqGxDgeA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6539ef56-f654-44cb-05e0-08de6249dfcf
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8353.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 10:57:36.5099
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eDLIxVRKNgARbgCtlkxrSM20w2GVpq4W8VxWirYozTPASgh6clBrRO6+7m3637NpbTIOh2q+99G8OJ+U4it92A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9702

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

