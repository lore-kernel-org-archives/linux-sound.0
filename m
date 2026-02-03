Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013055.outbound.protection.outlook.com [40.93.196.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DF71B4F1F;
	Tue,  3 Feb 2026 00:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770079151; cv=fail; b=OaJ9BP2Ev/GW9o+FX1rnAr6jV3nvpqjJTHvhgbGAcTzWzz6WbwH8ZLCMGzjwjTzz7ucgIEix+Zz7kWdzp7w7k+ysN+BjGfEeQlbwSrdarPAIWTB5kMMGKItOFnwGYdlM1imy28ibyCE+uUAZIsQYAFJLeGkvuz9KdroADyzGuKo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770079151; c=relaxed/simple;
	bh=3fufs1SKsEQIfPJy/GQ9aibZp8F2M/cT+dNN43rw+k8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kyAEyBvQzi16qhRCkefCffhlMS0dXCzclOOljvgqpRqBXLPfBv7vb+/m+9C0kk/7xKcbtVOk+kCyYKDGefGodf7rPQaO5kWC8gEVBdr5d3e4XyIVc4Pz1B7rprDOIZn2twsBekGYyBLe/tbk5rbYT/j44TxNih9xlMfizlk8FRs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=qdfXdD59; arc=fail smtp.client-ip=40.93.196.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="qdfXdD59"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xGJbPKXVDmD06xpociVH/+7FlRfrOBXUOHu2ETm6QLFL3SRhfA36GQfzMkKhBlsaFkd8hqE7HVc+T+j43FRtg/XhPiJCnOy88IYHmwW4QeUBQEk1meUfS1xZViFK1sMKPpNftNSoYLRhBNDq5/ZRVt3PEPHjFuAwzqv5fWJ1Nnm9wClAnbeI823nKLAdHobbZZK1OVtC20FZ2FJjA7ytopzE9TeP0hsGeph7hebAHUvtF2tbFBOceFbApeQ3j4lJVASY4nlMerH3VVJ0Kmvn41gQc8hQTuFMLW8Rqw+U7Ht45aBL0iPGZX6R8/WblJOCoP6k2fHURvRUOm8IpRyxcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NYhRq0mm2e1YsDv6D0t5F8oc+y1jDGTIJCWkHR8l33s=;
 b=w8C0RVF2jILVg48vfbjcgUpFFaR/AdtHogJsAlV418X1Up1soN/5r0qCClef476Bo+nUQxXCgdfJFqCIcA1nf9IfFa25E3EmaQ4pbnZ5b6NqWWcENvCpJIT9b/d41JwtbX2Jkofcfq7rGSSE7o/5NoGBgoybXDSsNnwRvy2V/e18cdBO4EYtn6C/SGClxKi9mlKG6R/Q3bIf8FffifP3a8OC2MKSlJ+L9yc3axy6/DfVvIphSxDT+Wd+89qS9VcME1nHLNMXAD8KJKQ4OMfmahwY4vShzZPP3ZKBrkoIfa1ZZWTTUxSIp7keUqKjRuzPv2rJ4jeozJqC2v6on95yOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NYhRq0mm2e1YsDv6D0t5F8oc+y1jDGTIJCWkHR8l33s=;
 b=qdfXdD59LZUMyplVowYkrRljoxW2P07skdHVVcAIsxxI6iRZfHss3VuXVu3LfPkpyuPI/OoIJN9SCm1mwLyLBNV16qJLNMPI9FvI/duQ4JIRMtyda8BL89VMLpSjPMjTsA6676xNBwNYP5oi9HSxnyKI2auzEi2KPl68R2bKcrc=
Received: from BN9PR03CA0219.namprd03.prod.outlook.com (2603:10b6:408:f8::14)
 by PH0PR10MB6435.namprd10.prod.outlook.com (2603:10b6:510:21c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 00:39:07 +0000
Received: from BN2PEPF00004FBF.namprd04.prod.outlook.com
 (2603:10b6:408:f8:cafe::6f) by BN9PR03CA0219.outlook.office365.com
 (2603:10b6:408:f8::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.16 via Frontend Transport; Tue,
 3 Feb 2026 00:39:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF00004FBF.mail.protection.outlook.com (10.167.243.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 00:39:05 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Feb
 2026 18:39:05 -0600
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Feb
 2026 18:39:04 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 2 Feb 2026 18:39:04 -0600
Received: from localhost (mz02jj9v.dhcp.ti.com [128.247.81.0])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6130d4ju3043807;
	Mon, 2 Feb 2026 18:39:04 -0600
From: Sen Wang <sen@ti.com>
To: <peter.ujfalusi@gmail.com>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
	<perex@perex.cz>, <tiwai@suse.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Sen Wang <sen@ti.com>
Subject: [PATCH v2 1/4] ASoC: dt-bindings: davinci-mcasp: Add properties for asynchronous mode
Date: Mon, 2 Feb 2026 18:37:00 -0600
Message-ID: <20260203003703.2334443-2-sen@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203003703.2334443-1-sen@ti.com>
References: <20260203003703.2334443-1-sen@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBF:EE_|PH0PR10MB6435:EE_
X-MS-Office365-Filtering-Correlation-Id: d4343b46-a5d3-42fe-f603-08de62bca2f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eH+EsV8wz0wCcHZvgJrGfV8wfninO/JaOWgYUwI+ch/siRWNZwhhs0HIIhmS?=
 =?us-ascii?Q?cvSCzRkXGQfkhCWLi1v9/fZ5YTaHk8i9PuV5HlKXJid+W3rlvZ8yF3noYWFm?=
 =?us-ascii?Q?IMibKwVVvSsFBz1rfoNm5x7qCWNEkx24up0JfL8LGlPgz+CBScGzpK3DyTUH?=
 =?us-ascii?Q?EfVMFvF8n+gkNt9hxNEyEq4DCcvqaLRlbfspJrL6jXaK3E1N66j9KhrGC9rk?=
 =?us-ascii?Q?eRXQtCiwFSPVcliMdgySKAxLJQUe1AkWS++5nV2zNuSYDH367FFNmY4Ft4oV?=
 =?us-ascii?Q?UiRyTEB0FcDOiUgR7QkXJaG0+itKqxdcSl0Y7FAGZAvDc7ew0VEkXQ6qzwZq?=
 =?us-ascii?Q?K9DDsIfwsBf8Q4gzjQNOTnHwtbJcX0xXAiZcCt6+0KLy19xUaUdALiDKhW0m?=
 =?us-ascii?Q?j5U+ch6MmK/CsAcLkzrlvNETiGVy34P7VNc+oEL+Itnu7qj7huibwp9NYM8G?=
 =?us-ascii?Q?p7zTrvC2VFhuc54u/COelSoivv2/hsZ+DIIQe8NGYDh9iBNk+OL+x7sgTvhr?=
 =?us-ascii?Q?tEobHKY4tg5SghoRQVdZtbCgSXUWmkvgNuF16MSW0LgRERPY5JU82w7CQjTq?=
 =?us-ascii?Q?xPG7wF9vyZ58t24ITFv3Os3Id9pctNo0W7QaKcaXewCuPvYW8Rnt8rw41abj?=
 =?us-ascii?Q?3Ap+pvu3nNZ0EIY8SpdsmF9EAAAX3NWpWAb3GgLZWpiPLNFr8pO8nN+Yt68E?=
 =?us-ascii?Q?dmBEZQeUq00K/gia4jUxQ+sp2M80C2DdGLmcEqy994GhGBmvk9+2EadAKixF?=
 =?us-ascii?Q?hfDGNc8gBmjBSG1vcXZq5ah21ixFZXbU5NgHhFH2FUqNUoBS1ogXn//o/k+j?=
 =?us-ascii?Q?9sdPEKaT2QScUZoKyPNAm9woWFj9p7W1VK+vu7PmLN7AEP2ngX9U2q1PIoSV?=
 =?us-ascii?Q?WaW9/4A66CeOeqCCVHsez9/kQRyc+2Syz37bTtWOM11Bcd8JHEPNiinJUqWn?=
 =?us-ascii?Q?piXX3WHX7r5JesOEPfTAqkZrqeOrLIu0m4j7VvNH+1FA7jvzisW7Sll35MB3?=
 =?us-ascii?Q?pgOOMRWvSzFzdonwPgNv2xFzxeLSRg3YmmwYW6w/pB3vM4XiKoAqbsGl6O/z?=
 =?us-ascii?Q?v60yfBFfLNyEMw0UhQPHx3nmCA3VQxxHVTIYkT6AiDc3cVif9PfCsGJRTZ90?=
 =?us-ascii?Q?2QC+v3/E9Ffp9HHVykgrYgpHXKlofIqvntkSR/fqsZTdPxEI+hkNgLaBcpSu?=
 =?us-ascii?Q?x5p0eSNRMUYRS3LKwIBUfOr/JRBg8/njFGez/CoYpGhOVLOGY5HN9JU9k71K?=
 =?us-ascii?Q?7HCntRWItG3jQ0tDdoZ/1wpWD84YsUSgEgIJuah8CgGYGWGfxea2fQH5/vdt?=
 =?us-ascii?Q?AYD8eorDfS15YCvzRZ4dUgMBAT+OrIM03rSno+cCyahPr4gvI9Mo9andOtd1?=
 =?us-ascii?Q?8BLmwD8kWWGP3idV8FjUkXpaToICDpb/+Ar4+3ta7ppgZaszmWGXlKViS7/Q?=
 =?us-ascii?Q?z07l3Rjxj9dX5/+8EJ5vcyvc7D8VjUO197l7jmOX8SE0O98BI/v0YoP/7wjl?=
 =?us-ascii?Q?EUAGzJAZM+hCiCjGAa3WFFRrXPqsdOJXViTpwtJCF3m1hkQv0oQGzGN2hDB7?=
 =?us-ascii?Q?KVejDtdbNIKyDNRutRFSLQrphpcYCw44zKOBF2gNLoL/8aV2qxDBiJJEV9vM?=
 =?us-ascii?Q?5YvncQuDD0LUSNtwp2l8Ys3BrpWt+91xxN7UU+ap5mRNuroTtfp3bqeCs2O7?=
 =?us-ascii?Q?P2MnoA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	o04HvZDvfjYKlyO6qOfii3tohj7aJ4tB2ArbMVLpo8dGh1OlgSslSq0zOAOobhQnLuRtDBJLkmbkGVu4OI3NZZK8RqYc/+tJHBNMFh8u02eivwoIokHnmf95R7FIlvum8VD1xSGoYD4ltVJoR+cDWBSR9QhI1YqCeFiBg/4kR0nzQXKQtUjzZr9SLuAoSNSA8FyeXvYAQiYWTN0PyEgs7T93SfwayyYjdDAlBgxd9sOvABLt7ySAvUP0beIi2kKmCD5uPs3qA/hyuiinfFHIagIJH8UxL5LsIEM6xDBhYMMFGd5O9cbDVGNIsrLsS9hKEjyZKcPNilEZhW/JEIVHhIFXPPIyByO6LWccf/4txZ6PLPd9UOX9dBIg40GVf/U7V32aN/sXdQWXJyXYPPrOkeMpsBC8TV+1DvdD6qR/SiCXcbvZo6EY77nm6SGT62Vg
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 00:39:05.9655
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4343b46-a5d3-42fe-f603-08de62bca2f8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB6435

McASP supports the independent configuration of TX & RX clk and frame
sync registers. By default, the driver is configured in synchronous mode
where RX clock generator is disabled and it uses transmit clock signals as
bit clock and frame sync. Therefore add optional properties needed for
asynchronous mode.

Add ti,async-mode boolean binding to provide a way to decouple the default
behavior and allows for independent TX & RX clocking.

Add tdm-slots-rx uint32 binding to provide an alternative hardware
specifier stating the number of RX serializers.
The existing property tdm-slots will still dictate number of
TX serializers, and RX if tdm-slots-rx isn't given for backwards
compatibility.

Add auxclk-fs-ratio-rx which allows to specify the ratio just for RX.
The driver can be supplied with two different ratios
(auxclk-fs-ratio and auxclk-fs-ratio-rx in tandem) and achieve two
different sampling rates for tx & rx.

Signed-off-by: Sen Wang <sen@ti.com>
---
v2:
  - Corrected patch subject title

 .../bindings/sound/davinci-mcasp-audio.yaml   | 71 +++++++++++++++++--
 1 file changed, 66 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml b/Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml
index beef193aaaeb..87559d0d079a 100644
--- a/Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml
+++ b/Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml
@@ -40,11 +40,33 @@ properties:
   tdm-slots:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
-      number of channels over one serializer
-      the property is ignored in DIT mode
+      Number of channels over one serializer. This property
+      specifies the TX playback TDM slot count, along with default RX slot count
+      if tdm-slots-rx is not specified.
+      The property is ignored in DIT mode.
     minimum: 2
     maximum: 32
 
+  tdm-slots-rx:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Number of RX capture channels over one serializer. If specified,
+      allows independent RX TDM slot count separate from TX. Requires
+      ti,async-mode to be enabled for independent TX/RX clock rates.
+      The property is ignored in DIT mode.
+    minimum: 2
+    maximum: 32
+
+  ti,async-mode:
+    description:
+      Specify to allow independent TX & RX clocking,
+      to enable audio playback & record with different sampling rate,
+      and different number of bits per frame.
+      if property is omitted, TX and RX will share same bit clock and frame clock signals,
+      thus RX need to use same bits per frame and sampling rate as TX in synchronous mode.
+      the property is ignored in DIT mode (as DIT is TX-only)
+    type: boolean
+
   serial-dir:
     description:
       A list of serializer configuration
@@ -125,7 +147,21 @@ properties:
 
   auxclk-fs-ratio:
     $ref: /schemas/types.yaml#/definitions/uint32
-    description: ratio of AUCLK and FS rate if applicable
+    description:
+      Ratio of AUCLK and FS rate if applicable. This property specifies
+      the TX ratio, along with default RX ratio if auxclk-fs-ratio-rx
+      is not specified.
+      When not specified, the inputted system clock frequency via set_sysclk
+      callback by the machine driver is used for divider calculation.
+
+  auxclk-fs-ratio-rx:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Ratio of AUCLK and FS rate for RX. If specified, allows
+      for a different RX ratio. Requires ti,async-mode to be
+      enabled when the ratio differs from auxclk-fs-ratio.
+      When not specified, it defaults to the value of auxclk-fs-ratio.
+      The property is ignored in DIT mode.
 
   gpio-controller: true
 
@@ -170,14 +206,38 @@ allOf:
   - $ref: dai-common.yaml#
   - if:
       properties:
-        opmode:
+        op-mode:
           enum:
             - 0
-
     then:
       required:
         - tdm-slots
 
+  - if:
+      properties:
+        op-mode:
+          const: 1
+    then:
+      properties:
+        tdm-slots: false
+        tdm-slots-rx: false
+        ti,async-mode: false
+        auxclk-fs-ratio-rx: false
+
+  - if:
+      required:
+        - tdm-slots-rx
+    then:
+      required:
+        - ti,async-mode
+
+  - if:
+      required:
+        - auxclk-fs-ratio-rx
+    then:
+      required:
+        - ti,async-mode
+
 unevaluatedProperties: false
 
 examples:
@@ -190,6 +250,7 @@ examples:
       interrupt-names = "tx", "rx";
       op-mode = <0>;		/* MCASP_IIS_MODE */
       tdm-slots = <2>;
+      ti,async-mode;
       dmas = <&main_udmap 0xc400>, <&main_udmap 0x4400>;
       dma-names = "tx", "rx";
       serial-dir = <
-- 
2.43.0

