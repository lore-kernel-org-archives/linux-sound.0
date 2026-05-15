Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011004.outbound.protection.outlook.com [52.101.57.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED303F9278;
	Fri, 15 May 2026 16:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778861707; cv=fail; b=tOrqMOLXzI7xt8JVZdENtlyh1VSfx0QYov9NnqE/9F6eopT+uAoU1lWsCIuhoPbHK5DawD2O9ttlTldXJB9Q8zC9NujuTUnH+nEWIM+02Wa4TXT3DK1ldBADGYjnmgjtdEl2xD9kgPHWA9NwkzXbQ8EwEVm4Y4f1eqpI0DiNaB0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778861707; c=relaxed/simple;
	bh=7lO+Wdsup3gNVhA+/RSFu1dQBKkiMDkjxyWICH0k24g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oDl7Xdtez70n0u7cTqtWUtRy09GdL0D32y7MnPKj2nn7OOWHKU0HRGA7P2b9cFEYMapCtAB9iDt2mJqB5+fpQpJh9Md9wSQ2RAc6m/6r0RI5XFJ383I62PI2d0W61HSB3niK0GbQF8IlrF6/xI7pX2IKQ6oVgkRr6Ayb70bZosI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=hSkZgrrW; arc=fail smtp.client-ip=52.101.57.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="hSkZgrrW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sXoVxTKNqtG5Wb6MmohcQWHUy/YKcVLPnx9m5zos/6eUndVu5TQH6vANGirFqCXZVvhC55bVywXcCxh/yiyfRoP1uQEDyI/NRaMyEC4voQsaFfXJsz4dDfcqDJocpEmhbOg8YMpSaCdbEO7RJC/6WTBEEqn4R5bGYUmfzWfx2tCarl7p66BR2BI9T/I3Cx/ROCaW0bvQ3OmZlCEooe7v4waZbjrxc72WQiU7Tqnc4LhM6ZwgJ/xq7Fu+DV3e1gCyJn9k8A2UiktaMVj3f8jQdXge4Tw2bAPqk1Q+fG0FQjGgIQoQoDdbqZFok6BpApYY9NcN1us47Kq0hCwYvFg29Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IB03wv9KRlgE9h6lPTo/JOmjUJHFK8sYweNt7xy+H+c=;
 b=LiUo6laGZssbMJc4QTMt5ZOm+LDGTfq8Sf1WEZo/VIt9bqmn4HNC+Srq23ukWRHh3Lc3a4Y0VJjvAvn2CqRxTnYbnUIxrkd440SkeuP4pCbNKikESejBnxd/LPu7GB/Lwtl3+WeaYguLqw+pu9a7KR0WjSgdxpIK+zjKyA/cUxvteyJQa5pkVBYbG82z2EjrsYZuVqizPKAR6B628I3jn7mSYB/p49Lo1L9YwzpPv9LP26zrYWhcJ+hGaWAhWYTxtwhIHUsY5aXp5n4R5BP1hY74yxbhung2QXkjQwHdT3ZR1NrezoJspZvYexNIQITteqxXUiowa+Dfsj/dqIUBbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IB03wv9KRlgE9h6lPTo/JOmjUJHFK8sYweNt7xy+H+c=;
 b=hSkZgrrWymWMKJvh29eHEwEQuGXTV0+MwWyzUgmIbLAtUf/iiFqUpvzEAXUeewWEPcIiqN/6FclTYv8B7XmDNGWHOln5fE0dz1pZ6ouKfHfSIo/YfttO1o5IeoDvJ6/Z6g4V1M31BnbDC6T7xFHiz8Q8rQJBr/F8t6GkDZx4Stw=
Received: from BL0PR05CA0002.namprd05.prod.outlook.com (2603:10b6:208:91::12)
 by CH3PR10MB7138.namprd10.prod.outlook.com (2603:10b6:610:122::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Fri, 15 May
 2026 16:14:59 +0000
Received: from BL02EPF0001A101.namprd05.prod.outlook.com
 (2603:10b6:208:91:cafe::a) by BL0PR05CA0002.outlook.office365.com
 (2603:10b6:208:91::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.10 via Frontend Transport; Fri, 15
 May 2026 16:14:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL02EPF0001A101.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Fri, 15 May 2026 16:14:58 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 15 May
 2026 11:14:53 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 15 May
 2026 11:14:53 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 15 May 2026 11:14:53 -0500
Received: from localhost (mz02jj9v.dhcp.ti.com [128.247.81.246])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64FGEr8a573990;
	Fri, 15 May 2026 11:14:53 -0500
From: Sen Wang <sen@ti.com>
To: Mark Brown <broonie@kernel.org>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, Liam Girdwood <lgirdwood@gmail.com>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>
CC: <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Sen Wang <sen@ti.com>
Subject: [PATCH v2 1/2] dt-bindings: sound: simple-card: add system-clock-id property
Date: Fri, 15 May 2026 11:13:57 -0500
Message-ID: <20260515161358.1462453-2-sen@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260515161358.1462453-1-sen@ti.com>
References: <20260515161358.1462453-1-sen@ti.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A101:EE_|CH3PR10MB7138:EE_
X-MS-Office365-Filtering-Correlation-Id: 958e8341-e007-47d9-866a-08deb29d1c11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|7416014|376014|1800799024|3023799003|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	YHxzv3EqQ4RGXHA+sD75CHK3wVOMbWOK3/3stWmS9dXv4uAqhKwpmRimZsX0RhEDER8w8jHFdpU80L948Bo87hQchD84vRgeKEPZo/HUJoPgGIrKwZUmV58XABvNHIvmqdfnAmYrhG+n6aFmOK3LZYm5sIx/jNxI4pri2HeGYlk6ecrP9yIdg9VC+K87iEeM+8143doFHL74/luVuRS++lygCOALcl0ZWaKYETJ1UJkvUniGkuvhoN/ttOJmk3qMCJNsDS9mQFph+J6JlmBs+88XUy/SmGjZW8IL/2+Ubj3owH6UPMFBwMKWxIU35+BQahjvQQl3ao8l6hjlKmVAXFnwvvqBb4LDw4SeUc9B75A1bGEbzawNqSJH3UrtX6l5QvIrpNIDDcXoYc1NQAWNOQwiJBEr0TYo+/S08mL1M3usHvmIoAFrPw090t0f/7FcIPhik/MpozF2hh7ABsA4143KwAGIwOz7P0+j8LTkc2fWhRE3JbiBo4EfFNuiFzCCYh6sB5vitQSl8CltgIyx0WUpJR9649k1nFMZRyZPK8Ug2uk/EMS7HSi0PdYvBGobYOMC4p8doFXhq7d2ckfa7wxCO3+Bkl4stmh7ArzXuSppMRThp52ns04IPVdI6JMwCxVQrT3Zv1opJ66jWWBL/BxDyufFl5ehQgafhHgIEem33rhhBrI+koKOaUkDflqkCwDNOxdkG0CC476E7UKw4Stnhy7W+hcn3FcHqMlebMI=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(7416014)(376014)(1800799024)(3023799003)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	11sbnAt14ur9nPWQEAZLUJvoaqDryBgCJsAMONhXRxj1qQSHcXKNDXargeubsbYjPRL7oSHAemERorDHh1hS935ct5QW2FvrbwaH53SlOGQVOlXqUMyNxeu5onx7UNKoUC8hh8GD5y7yDqeTcnw/2JVKL/AOs1OdTixiy0fSimAAGkl/q7PFdrLiuM6oNnOO6rO9+pgP+JRBubOjTWHxl7UodRDDP1ZM3+z2bBvH7sNmZsKD0zMQRusuP/2D6yz/wDBv10KFVAAUAa5pdfccmn/UHYphvmK1xpjZozObjRrkQ3rao5mcW2m14zD+6+TzcO1fguVqSRGr2YGsqppOnYf1aT4QudLV5yc/dX8l5x1QGqwO3pSS8htEbSsW9Rz0JDEIhK5tLC+uAkM86MuDkasH78Zesh2KfrxdSyeEiJfCvqkel7wgtNvJNk5TSApI
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 16:14:58.2556
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 958e8341-e007-47d9-866a-08deb29d1c11
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A101.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7138

Document the new optional "system-clock-id" u32 property for cpu/codec
sub-nodes in simple-audio-card and audio-graph-card.

The property maps directly to the clk_id argument of
snd_soc_dai_set_sysclk(). When absent the existing default of 0 is
used, so no existing DT is affected. CPU and codec sub-nodes are
parsed independently; each side may carry a different value to select
different clock sources on the two DAIs within the same dai-link.

Signed-off-by: Sen Wang <sen@ti.com>
---
changes in V2:
  - Newly added (V1 is RFC)

diff --git a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
index d1cbfc5edd3a..8094a76b9b4a 100644
--- a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
+++ b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
@@ -67,6 +67,8 @@ definitions:
         $ref: simple-card.yaml#/definitions/system-clock-direction-out
       system-clock-fixed:
         $ref: simple-card.yaml#/definitions/system-clock-fixed
+      system-clock-id:
+        $ref: simple-card.yaml#/definitions/system-clock-id
 
       dai-format:
         description: audio format.
diff --git a/Documentation/devicetree/bindings/sound/simple-card.yaml b/Documentation/devicetree/bindings/sound/simple-card.yaml
index a14716b2732f..47a02d340d5e 100644
--- a/Documentation/devicetree/bindings/sound/simple-card.yaml
+++ b/Documentation/devicetree/bindings/sound/simple-card.yaml
@@ -49,6 +49,14 @@ definitions:
       single fixed sampling rate.
     $ref: /schemas/types.yaml#/definitions/flag
 
+  system-clock-id:
+    description:
+      Selects which system clock to configure via set_sysclk(). Corresponds
+      to the clk_id argument of snd_soc_dai_set_sysclk(). When absent the
+      driver default (0) is used. CPU and codec sub-nodes are parsed
+      independently so each side may carry a different value.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
   mclk-fs:
     description: |
       Multiplication factor between stream rate and codec mclk.
@@ -135,6 +143,8 @@ definitions:
         $ref: "#/definitions/system-clock-direction-out"
       system-clock-fixed:
         $ref: "#/definitions/system-clock-fixed"
+      system-clock-id:
+        $ref: "#/definitions/system-clock-id"
     required:
       - sound-dai
 
