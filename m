Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010066.outbound.protection.outlook.com [52.101.193.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D242233E356;
	Fri, 30 Jan 2026 05:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769749863; cv=fail; b=Y7Zmxhs2AbFgrTDoq+BksrorD3HkU+UdGkDMm9iLzCMLyaF1tJq2YFRdqYamYKkHgykEWPJAAw3IYFkTguPcQmoz0Z1aYFpTrf5kCTP3LunxuapmpKrV7b9QQgbiSDgnIifeuUEkydfeQFdLf52oyLL0wSpuRj4pZ8ZthkFyeRk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769749863; c=relaxed/simple;
	bh=kdC6/LoOzEKtJpxIcgqdCHZGCXHcn26hdDsvWOzSTxk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Id6VNW+8ALjKpdgiHfhS+FR7fqBAW5o2rLZrR5Iti69CexSnS17RKySe8FusBn0YVUZb0cCy4nuAI9oKyIul+8+XSVY4sMynbtA/jnz2GhmwH95ye9YVliHvKO1HkkmS0BWHhUwlOZS3d99ZSk1S+lzkfertSw2kgItVz20g1dk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=GW407SOt; arc=fail smtp.client-ip=52.101.193.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="GW407SOt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ppLxXKWgIXblbLA4a5T+4a0VlIAEQhagpXL9PF3kXJEyBFczF3mx5sXlY4tkgpYWG8ND+OhZDW/jXK0Uxar8bsdfD0Xogo3MOFc1wCzOwhDxmOwPvEmN2uLhjEbzeYNwL6Srwxto+aK/2q17r7ZV3VDVc+FK3ony4y2jCFPOTdQUeCek9gelqUF5xwnHGAsttDelzN7xTig3eBroO5SqOFAq4BYmF4NW6+GN+ZuDJRnrzJjiTeRih84+kqIUGc4rf8jnIbLKaUqITWYd0QEAfCcF5imxVq5bV0CgFWnsu4X6C7Y8qOrhysPTR2KPYEnffBrM9mmU0Y4foDsS2qjB2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wgyHjFqRytWd9tkBKnSoeGBYFory6CM7c1qHFfUiP/s=;
 b=w7gTTg9e8jf+x05mJPXuv28izo5FASdki/t7mGKCHKM91rbg0wwqIv8j+SSWb8AztPl36jklRNic2x0g+krdpXd1MeBZHGlqfiFuoh5npGWynpHEUwb1Grl7Ulo3toUohNFo7SQqCJMlk3qAgUGT8kn4zezaOriAN8fLzmG9Kcq7Q+7dtXpy5Mq4KnJNs1GwSTGEniW2GgLlbGWmL39HeRPthd4ecKAbsgbUyxNX/QP2vIpwEtHSDfFOgspXeLp8KRMrBb2MJBcR37jQ9jzlTNMmx8G8aWraxSoYwbaF5ftkDt5LhwW7Yh+Vw8oTCrp2PvQwU92LCwgjdtUR+1OCoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wgyHjFqRytWd9tkBKnSoeGBYFory6CM7c1qHFfUiP/s=;
 b=GW407SOtY3y3WFjZ65+Olr1fMvbEiLRceNU1hsBPwoEjIuBE6xdMR7MdYOD4hgq/i3LWBYI9pP5qrGBlgwNVw2o7t1eRekWFErvtRU3Zpkbe5mFwu8zNaE428JL2YJZ1uIriYyREeFRjRpDNx8PbyPNU6CrvqIFMDnNuqhQ0rvg=
Received: from BN9PR03CA0782.namprd03.prod.outlook.com (2603:10b6:408:13f::7)
 by DM3PPF3F503E3E3.namprd10.prod.outlook.com (2603:10b6:f:fc00::c21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Fri, 30 Jan
 2026 05:10:53 +0000
Received: from BN3PEPF0000B06D.namprd21.prod.outlook.com
 (2603:10b6:408:13f:cafe::60) by BN9PR03CA0782.outlook.office365.com
 (2603:10b6:408:13f::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.10 via Frontend Transport; Fri,
 30 Jan 2026 05:10:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN3PEPF0000B06D.mail.protection.outlook.com (10.167.243.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.0 via Frontend Transport; Fri, 30 Jan 2026 05:10:51 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 29 Jan
 2026 23:10:46 -0600
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 29 Jan
 2026 23:10:46 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 29 Jan 2026 23:10:46 -0600
Received: from localhost (mz02jj9v.dhcp.ti.com [128.247.81.0])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60U5Akmj748611;
	Thu, 29 Jan 2026 23:10:46 -0600
From: Sen Wang <sen@ti.com>
To: <peter.ujfalusi@gmail.com>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
	<perex@perex.cz>, <tiwai@suse.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Sen Wang <sen@ti.com>
Subject: [PATCH 1/4] dt-bindings: sound: davinci-mcasp: Add optional properties for asynchronous mode
Date: Thu, 29 Jan 2026 23:10:41 -0600
Message-ID: <20260130051045.1898892-2-sen@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260130051045.1898892-1-sen@ti.com>
References: <20260130051045.1898892-1-sen@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06D:EE_|DM3PPF3F503E3E3:EE_
X-MS-Office365-Filtering-Correlation-Id: f66e5270-8329-443c-2f06-08de5fbdf076
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UsmIDuP6ARLTWNfFxr3HxgEynLNg5VngwUo+sy+flB90SdwuDWy2P4YNNY/P?=
 =?us-ascii?Q?l7OvI0NHuzob0rF+oDAG7cFbeUuSgd6/CLmqi1J7gw7S3fc0HWAfYdzJUif0?=
 =?us-ascii?Q?/CS79DvA5lljVFXOfUR2CFzZjTSoLE0i2vvK2a30KIurJMOhuO4iYV16SGVZ?=
 =?us-ascii?Q?yygrNXqsnJvymmKIiFiWd8y/cE1DyMKME+1nNhMh/tAy3JFHd4h65iOIQnMI?=
 =?us-ascii?Q?hNOMCOLkEcmFLZdoqyslN0KEeezNTcBIiHveciSrgkUqacDp/fiv3axepJJV?=
 =?us-ascii?Q?o5OvODm7yEB5AoPUahwm1tUE5Hv/7e4oDVB29BcGu5GsgbzM1x5z38akY/tO?=
 =?us-ascii?Q?IFSEecqU5LbqSetR8nnYZxPJB8fXmCNYy0rsvirytKsgGTeNgx3okuO3acsk?=
 =?us-ascii?Q?Xg0m0Cq4UNDzWYaGwsQhSY4OcnabD/HL3UWvBJGYmiqsvbQBoSNujp5olNnp?=
 =?us-ascii?Q?9e9Hh/Idx2am7kQApq1ILEcnZ9nmTJlA9xVVvN9HwC1YThCjhV+z7pd1VmIr?=
 =?us-ascii?Q?ck/C5yCyklG4EsAiV0Z/MGRd3ZQdC7UU8cPQYfmIFW36WnrF/Cyj5oYxlhut?=
 =?us-ascii?Q?Ko82dGsYJ3ptdzgSxcaS4+zHTLplthku0PNeIzynHflsupCJkn/R4SHjTm2i?=
 =?us-ascii?Q?zAFO3m/8VljirWKpsHVCd4nYkMIrc8kWNmDuxPjXHYLZ0v+Oor1fakPTxE7l?=
 =?us-ascii?Q?dEniPiVj7By8kQ54fA3M/C4eGbWlMeeJg7k2h4dLrS30HAlJFa/Bv3BqQETr?=
 =?us-ascii?Q?eJMqXZ6JN7JYf0yppSG4mQ4RkKlwsHeiG5H9vIUs1CKQ2gqxNDfAS0BqAOl9?=
 =?us-ascii?Q?sGqJHC3oGb6lAWd60cEPnXyZ9cGAsOYfERrMMuxIqaatjp9FeosjnrFU1yVM?=
 =?us-ascii?Q?M61uwRXK1sGbFPy+/KOm2q77/NdOeXJxdYmvXIACMczQ7F2F/SmGD+s2Kk4n?=
 =?us-ascii?Q?vUajfpPsnwpigqmy60JCYPo0oVGIxxazScGoYVkvsRWWkcnMKKqpbwn1pVze?=
 =?us-ascii?Q?33xKJi+BuUhHK0Vwo02lM5wMLRoCCaPowG+8S2X5vghD01LuQllA4i/VXlbN?=
 =?us-ascii?Q?cNtyAtfvJd4SC81JTZLxfBOD7FS4Rr7/qMqojYL5TGUoVcsbAb6yeIag0w8U?=
 =?us-ascii?Q?53Iq7Xo8UMLUMkvuvMVcRQwa3cuWJ/cnndylUGsJz1Ui45vY0LwHoSPwj7In?=
 =?us-ascii?Q?rBiToZe/jorK2UyTHjPpvAsPN9fmKaDfwJscfAbf4qHC1NkdYJT17CXYapQ1?=
 =?us-ascii?Q?fnXWB8I2q2qDJ0Ux3AyDygUufcQHBnNJlU+QvcLrIXmyRE4bGBw5Jsv2bKsx?=
 =?us-ascii?Q?xe9TUQcKYkoSvGrpGNixwoPTthA8wAXrlaYYeUaLGRGZsAUpGVl9Xv8yYD+M?=
 =?us-ascii?Q?Fy8IEJ+ETAjbXiDqiqvsbfgo3BLQK/JuUqbCzz0pzJD1XTbyAN78fA1Mm5kQ?=
 =?us-ascii?Q?coWU2BHRDlxEhwBo6dCcO4yXRBJ4gXvCrFBLgDWhMQotVygigSSeR+EdS94w?=
 =?us-ascii?Q?ap3nGLSTNqJrM5Is+oz+PtJbzSO6wULpSQjl?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cKFRfF4C7u2TiqNhs81+t1vgpgq5WZQb+T4Eju6V66m7/M/cT5uTWNytYa+6mJxlNrSG0IFPObX5EAT9UEF++Iq4izm2/7uazTmFbfXjUxaKzYyAYw0PalOroj3T7jP17AiIdrhCfqouDbNmsXJDNcjXrZRfDaEOPW7zb256GtOLwOoGxbG3C0Hm26rBeLOYbwfhzHbvWcINhPV/JZnTMYcXFPHKzfTdx4u4C8vom6ZPYv7Rjl4BWS41aH04nkIWkYuUEZD4gColuvRpENJvH2lWnfSMw8EKix7NJh97BIFam9/qQifEfHfKg1yDeVAgkWNEKpYDEuEWs/iGz1GAMIDj0Dsjgvl1pP1EPaS2NMsjTcZywE3imnBPXjbfdF0XLMnr/AZoB9kGOSr/sEdAmgWsw+BnxTVlPX0c4IlHGgfyBWC9VrwSlu2kuu1NwqKB
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 05:10:51.9711
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f66e5270-8329-443c-2f06-08de5fbdf076
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF3F503E3E3

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

