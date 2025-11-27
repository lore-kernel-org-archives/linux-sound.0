Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023087.outbound.protection.outlook.com [40.107.44.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C136931E0F0;
	Thu, 27 Nov 2025 09:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764236599; cv=fail; b=tu4xy612WejjhzDocrN4xUwNKuIpLCxWyM46lQpe1Ueg6+TZdPMunMWsJIHJIDi+GiYARpF0BP/WAxSd6OX3Cfs98VcpmW1k5xXr4KXO5Zl4hWTbZQM4ofYiGP25l49uxGKuGHCgyqwqxyWXoGumbZd8wuPGn89Qeb9Rp4E3fkg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764236599; c=relaxed/simple;
	bh=4aBRjDRn9NmjrnTCMp4S5+YUZxk32hgA59WoV2CBsOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RsMswCIH+G2Gfy7rZhfUJolHT+sjFBkZGnT/URBxVHmav50QTJ/4Te/OCOBBF422O7kzrRw0oxoayPgn4UvIIJEcqzGQFKk/J8P9o40O9CDRIxzcuMc3jgoUZYkdRfQRsgFtzmDPu7rqeSRUg5xzleQEX6wKBtauQhqFV+KW96k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.44.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ja2mZ0EexFteVsm7rB4Vw4n1e+KyOiqCkqLVvW0sZtVamrfkUlacRTbbh/zK3jJhhcv7LCBX7oJOEWov0QjfT1cPXShPsbTTWlOlLI7KIxoyV0VkV3OXmPcb8cqhorhddzd8tEQ4Q5E484mS1nayVrZYqZgFcZHv0B7ILvd8jdUF5WdVca/aZG6zcf4LBHhgSJjqNYECv8Fn8Z2HUphgnXwXx5/khqxUflC6CiLUyuc3ZNAEaA/zrxZ0b7t/MbdUAveOyJELqrekaU79kbCRMCFfN1BKEY+7PZnObpS7B94OVzjP0kpNPbLrReIijZoBb2NRhCssItSVT89FSKa+0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jwh/0RBjyK9Fa+GFqV+hnmIQe08EJVFIc/3m7c5LClk=;
 b=eOYpyMY6YyNPiPxJDLYAEQ8zI7UnnBeKOSEAvDh8cLJlO0QK+Y0BZ7mUBb7FebaZld0Gf0+WYV2c5kra0eLHMS1ImIwzwC/bx+HQs8J/BPiiItlG6ojp/7f+6VvSYJ25LiasHN00uX78uylBexqW6gzt0jhoWs0OniRtA4azelQ6TGyEu5AKKQ17f4jpdHviGWjZp7u+fP3pZ0n939k+XjdK01thnMhg0rj3AKFtU9itw4nm8oiWWLms4UBkwihoVg1PRRU4aJMudXRzgKgBcxl5b/XWGshoUYZ1MjXnR2pW+EKKed2gk1WWCthqPANkF0BZFq7x0HG0SIghkujm5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PS2PR01CA0065.apcprd01.prod.exchangelabs.com
 (2603:1096:300:57::29) by TYZPR06MB6239.apcprd06.prod.outlook.com
 (2603:1096:400:33d::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Thu, 27 Nov
 2025 09:43:12 +0000
Received: from TY2PEPF0000AB86.apcprd03.prod.outlook.com
 (2603:1096:300:57:cafe::1) by PS2PR01CA0065.outlook.office365.com
 (2603:1096:300:57::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.13 via Frontend Transport; Thu,
 27 Nov 2025 09:43:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB86.mail.protection.outlook.com (10.167.253.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Thu, 27 Nov 2025 09:43:10 +0000
Received: from localhost.localdomain (unknown [172.18.64.15])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id AE6D240A5BE6;
	Thu, 27 Nov 2025 17:43:09 +0800 (CST)
From: joakim.zhang@cixtech.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: cix-kernel-upstream@cixtech.com,
	Joakim Zhang <joakim.zhang@cixtech.com>
Subject: [PATCH v2 3/4] ALSA: hda: controller: specifyhdac bus ops from azx_bus_init()
Date: Thu, 27 Nov 2025 17:43:00 +0800
Message-ID: <20251127094301.4107982-4-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251127094301.4107982-1-joakim.zhang@cixtech.com>
References: <20251127094301.4107982-1-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB86:EE_|TYZPR06MB6239:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f52d817f-09e1-47bf-8342-08de2d9960d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XveGPuFA8bCGZqbMYRa7z6l0nIOz0oJWUofs7lq3akbvJgzXH1olyJR+EKIX?=
 =?us-ascii?Q?fI6EZ2EKEmzOT2M9/l4e8UzhLs+9r/fWe9zwitWpb5pB/Za2tT7FRLpmb2zF?=
 =?us-ascii?Q?n30Yy2llci7QvAZR+7xjEGCmNR6sMzWYNcOjSMmqr4qiKtxoSBoKwM4XZPqD?=
 =?us-ascii?Q?z+qZb79A4A27qFFbRPsmxlpVjDzO2b0ZZvD6UxSQOg0lTY2he06cPh6OAUkF?=
 =?us-ascii?Q?zlxpo0YiwUQkO6EXdfbCRsu0p9KhVmbcBtZn6Rc6RbskqOLDGxTh33YRoneT?=
 =?us-ascii?Q?G5WX5IVQiyIaRpJLb4qypQ/zzIFSSgwIgvzZeZGizVHeBIjh20B0Zu44Sg/1?=
 =?us-ascii?Q?W6sa1i26FObNJFETNUjWjunVJyqSAdLUXQXVTyKv0tcYDWHHT0+aKbl6ATVP?=
 =?us-ascii?Q?47bD+jss1FWLSS0NkbK7M2wDlb+Cadz/ZbEyFceT3Wely1BNKsUr+Xat7ov5?=
 =?us-ascii?Q?PdqWys8zNUAdUmbfBvZywBwDSYHHQMS0cfPMAdLO6I1y07vEYArriJHJFfjL?=
 =?us-ascii?Q?2BVJJgZOXuICs7ERJJvqMVSQMHa+RFos/6VV/EmKuvd+TEk8eqWhk7hyfWhW?=
 =?us-ascii?Q?EqRJRDO52DJJs/IpzhGIl2oWCNC5G86XgLSs99fdz1spWTmXHZPOoLp8fB/U?=
 =?us-ascii?Q?AOMQPqkNr9eBVD2sCOUDnzZ+VVu263z194opmujdoAeppZnyBgM/gxHWKaOi?=
 =?us-ascii?Q?5FoVK7/U7y58ZCErWLhvyC+J27aZ0Q6U9Z0p+PlaZn/vYnLmoo+Df99XbckE?=
 =?us-ascii?Q?9Q+k+lvQsXa+G/LSqOu+F8iMMQKD9/cb6bPxmzlLnJWGB8eSHRbxTlm6Qr0S?=
 =?us-ascii?Q?AtRg6qwUXkSfv2GZeAx8QX6un39Ay/Unf+fIoX1yvevlFRiS9GawjD7ui4ke?=
 =?us-ascii?Q?SVh8ZiL9zLQs+hmnu+0H1p7Na5VFcDU8bRpSEhdBnU0c+z4kU4SfiHkJ3FBj?=
 =?us-ascii?Q?lCg7b5AucgOBNeCy6UPB5NCfUCQVrXPUSSqBeJfJkvtbFMI6qlXgwO3jCKXr?=
 =?us-ascii?Q?NkdyZaeo4r7Tpd87uC5QfMzvW4LkMzjIYJTN8mUoB/SDV8P1rXCxVOaWBajz?=
 =?us-ascii?Q?pc0eM5zPmkFX6r92n7LpnCA5CER/X08Rq89R2VoqTjNzptBUkCTtZmCRpz86?=
 =?us-ascii?Q?yzE4o97jE5QKrXj+cHYPXoKnzxVtR7uBPaCvKqLRcMWCOPH/qNE0MEawH1XX?=
 =?us-ascii?Q?qMUuLfenL+hlyaGmivK2b5fbDtE618CSjOj2zC5B/qS5fokV/UaLBXnm/1y9?=
 =?us-ascii?Q?/xPJocjIlUPnBaluim6Ek9+f8rCjGAswjzTzQq/1ewTRXV/SkI4ujliW1ocd?=
 =?us-ascii?Q?8e97Ohwz+uC4hbIu1UrSE14wiyceCjVUVVVuVelGtwJD+DB4JMRK+4RjVMEl?=
 =?us-ascii?Q?6Hhu7hLgMdVDhZ+/+qiO7rpdCUuRuxpScapG8swsmnZLbH4fgcBxJxn6YnQ1?=
 =?us-ascii?Q?vEBVSPR/rDWZ6N+rr2iQ47xkxOj/wb9MfWvc/Pm6JD8CKiZydGA9dwW8gGlS?=
 =?us-ascii?Q?Le6mjZ8CMO3E2a6ak9vd+/I7RFJaEJaBpDZxIrFP4ErMxPUlOUx2Bkqp4AOn?=
 =?us-ascii?Q?KBjkgjbXb8MpPOYjcv8=3D?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 09:43:10.8492
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f52d817f-09e1-47bf-8342-08de2d9960d7
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB86.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6239

From: Joakim Zhang <joakim.zhang@cixtech.com>

 - extend azx_bus_init() to support specify the customer hdac
   bus ops, such as add addr_host_to_hdac ops to do dma address
   translation.

Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
---
 sound/hda/common/controller.c     | 17 +++++++++++++----
 sound/hda/common/hda_controller.h |  6 +++++-
 sound/hda/controllers/acpi.c      |  2 +-
 sound/hda/controllers/intel.c     |  2 +-
 sound/hda/controllers/tegra.c     |  2 +-
 5 files changed, 21 insertions(+), 8 deletions(-)

diff --git a/sound/hda/common/controller.c b/sound/hda/common/controller.c
index b1cfd9bd4dcb..1bf2d0662c8f 100644
--- a/sound/hda/common/controller.c
+++ b/sound/hda/common/controller.c
@@ -899,7 +899,7 @@ static int azx_single_get_response(struct hdac_bus *bus, unsigned int addr,
  */
 
 /* send a command */
-static int azx_send_cmd(struct hdac_bus *bus, unsigned int val)
+int azx_send_cmd(struct hdac_bus *bus, unsigned int val)
 {
 	struct azx *chip = bus_to_azx(bus);
 
@@ -910,9 +910,10 @@ static int azx_send_cmd(struct hdac_bus *bus, unsigned int val)
 	else
 		return snd_hdac_bus_send_cmd(bus, val);
 }
+EXPORT_SYMBOL_GPL(azx_send_cmd);
 
 /* get a response */
-static int azx_get_response(struct hdac_bus *bus, unsigned int addr,
+int azx_get_response(struct hdac_bus *bus, unsigned int addr,
 			    unsigned int *res)
 {
 	struct azx *chip = bus_to_azx(bus);
@@ -924,6 +925,7 @@ static int azx_get_response(struct hdac_bus *bus, unsigned int addr,
 	else
 		return azx_rirb_get_response(bus, addr, res);
 }
+EXPORT_SYMBOL_GPL(azx_get_response);
 
 static const struct hdac_bus_ops bus_core_ops = {
 	.command = azx_send_cmd,
@@ -1147,12 +1149,19 @@ void snd_hda_bus_reset(struct hda_bus *bus)
 }
 
 /* HD-audio bus initialization */
-int azx_bus_init(struct azx *chip, const char *model)
+int azx_bus_init(struct azx *chip, const char *model,
+		 const struct hdac_bus_ops *ops)
 {
+	const struct hdac_bus_ops *bus_ops;
 	struct hda_bus *bus = &chip->bus;
 	int err;
 
-	err = snd_hdac_bus_init(&bus->core, chip->card->dev, &bus_core_ops);
+	if (ops)
+		bus_ops = ops;
+	else
+		bus_ops = &bus_core_ops;
+
+	err = snd_hdac_bus_init(&bus->core, chip->card->dev, bus_ops);
 	if (err < 0)
 		return err;
 
diff --git a/sound/hda/common/hda_controller.h b/sound/hda/common/hda_controller.h
index c2d0109866e6..0ba352a8ee05 100644
--- a/sound/hda/common/hda_controller.h
+++ b/sound/hda/common/hda_controller.h
@@ -206,7 +206,11 @@ void azx_stop_chip(struct azx *chip);
 irqreturn_t azx_interrupt(int irq, void *dev_id);
 
 /* Codec interface */
-int azx_bus_init(struct azx *chip, const char *model);
+int azx_send_cmd(struct hdac_bus *bus, unsigned int val);
+int azx_get_response(struct hdac_bus *bus, unsigned int addr,
+		     unsigned int *res);
+int azx_bus_init(struct azx *chip, const char *model,
+		 const struct hdac_bus_ops *ops);
 int azx_probe_codecs(struct azx *chip, unsigned int max_slots);
 int azx_codec_configure(struct azx *chip);
 int azx_init_streams(struct azx *chip);
diff --git a/sound/hda/controllers/acpi.c b/sound/hda/controllers/acpi.c
index 505cc97e0ee9..81a60e3e220d 100644
--- a/sound/hda/controllers/acpi.c
+++ b/sound/hda/controllers/acpi.c
@@ -192,7 +192,7 @@ static int hda_acpi_create(struct hda_acpi *hda)
 	azx->driver_type = hda->data->flags & 0xff;
 	azx->codec_probe_mask = -1;
 
-	err = azx_bus_init(azx, NULL);
+	err = azx_bus_init(azx, NULL, NULL);
 	if (err < 0)
 		return err;
 
diff --git a/sound/hda/controllers/intel.c b/sound/hda/controllers/intel.c
index 1e8e3d61291a..b76839401ef5 100644
--- a/sound/hda/controllers/intel.c
+++ b/sound/hda/controllers/intel.c
@@ -1814,7 +1814,7 @@ static int azx_create(struct snd_card *card, struct pci_dev *pci,
 	else
 		chip->bdl_pos_adj = bdl_pos_adj[dev];
 
-	err = azx_bus_init(chip, model[dev]);
+	err = azx_bus_init(chip, model[dev], NULL);
 	if (err < 0)
 		return err;
 
diff --git a/sound/hda/controllers/tegra.c b/sound/hda/controllers/tegra.c
index 6ab338f37db5..4890425a4e89 100644
--- a/sound/hda/controllers/tegra.c
+++ b/sound/hda/controllers/tegra.c
@@ -435,7 +435,7 @@ static int hda_tegra_create(struct snd_card *card,
 
 	INIT_WORK(&hda->probe_work, hda_tegra_probe_work);
 
-	err = azx_bus_init(chip, NULL);
+	err = azx_bus_init(chip, NULL, NULL);
 	if (err < 0)
 		return err;
 
-- 
2.49.0

