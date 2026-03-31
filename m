Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012032.outbound.protection.outlook.com [40.107.200.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43ACE401A0A;
	Tue, 31 Mar 2026 15:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774970234; cv=fail; b=ZFgEHsZ3HimAzBOA5GSq+cZIilA1EZU8UAgOokBol+E4Wco6ZX74c2HtzpvLTQ2gcR3AmFirZtZ0r5FcPOWD7eDFwYOtyj/tNg/auBdl6wJ5+B8MdAUkPK83E3n7L9LqitX3D98zpVbdeZFkyG/FUfIZMx6w7X+WQfojacsg/No=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774970234; c=relaxed/simple;
	bh=HSwN41WARNsBIkGxPwPh1JDCEmH6Z6CBBwM9qo/wAec=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=H2rmznd3h6ovUjRfmls7ZTczazVA9NHbI0NE7n+k8FeCflVwfheETb25IeSelutzB13JbRVmEU9YqwVxsOP3Dh+W1slPnzPlcGAI2IUn4QM926QcdHjzq+lb7YyfVyLTBCNAnL4XaS0YqD1dRRDtFcu4+Q/zslZIgBEfk8O1tgU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=a0AKhD0M; arc=fail smtp.client-ip=40.107.200.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="a0AKhD0M"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q9ufGQZoauU8vVk28Pgip3lXp0uPScwgJCOH5FJEd4ORjfJoK3mA4EmmL5wBdxR7QOMVHW9u+7Hb8NmFsjT6Pb85IQmDThRCZoO71ORWQyUrvdBZEcKgwtQC0ACUMlGBz95V3Zjo8MjoNXvspxLEf/JBELtapNB3/prU2r/qWbvwCI4e1ZHgytgUhhP2OrVXFR9PcEeWPws1OQGLRZmsK4kfBx2aPaQxqaLt6xHm8bmPZbPN/9d6mDMx2jUmgLULwuId4a9gg0EePo3W0JWxuA+wnBOan40W1BMhKuJQZRm2aj59n3rGGr7avY8uTc6tdYwzPk7nXT2hqisqxT+dQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A2/s/HyPyK42GBp6ApKJP9FSsp1k0NuUA1d1upYKto0=;
 b=n5qgaTi2NjAnRAkSgi+xPeVW6eB+OQxXeqOTOFIX2e+KhUGLQ1lV3f+2kJxsx2kDKaeuoJcz9KrGJvYWTCnA5X+A/R/dxce02GUTlhARePZYPq2bcaxLX8FGVRMKxyKbZF6M49BDfAkCfewY5Hi3kWzYX+OcEFNFPPc7ECwDZDRrQf6QAQrVo+B8pd57SzoEtfJJ10mH1bJX/Abmh5365Gegv7BdQtnjYRctIEkPcK3w8hEn+bpLAsBsEM2JbHIl3Rlh0zCba0ieKq6n+Z7G1lxrY5SgH0MlAhv5iPpFK/LV7oXEVnSCAdxlTrHErC88LHn06eiBxIsQEPxdPZ0DTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=linux.dev smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A2/s/HyPyK42GBp6ApKJP9FSsp1k0NuUA1d1upYKto0=;
 b=a0AKhD0MRpyCV3n9WZyxu2kixg4oildQIE7yUTgrP2XwmHaFDCVk5lqiDIj/zW7iCS3hnK28JrJeOk/FWTQKfLj65V7X0KHWKzMU/g1oeHeQ/EMmokJ3LgR5h+XqM2qQ6e0MH/xJND0r4y1w5tJ7bIUFvQ0Di285aXIq5fw4+ic=
Received: from SJ0PR03CA0142.namprd03.prod.outlook.com (2603:10b6:a03:33c::27)
 by BN0PR10MB5127.namprd10.prod.outlook.com (2603:10b6:408:124::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Tue, 31 Mar
 2026 15:17:09 +0000
Received: from SJ5PEPF000001C9.namprd05.prod.outlook.com
 (2603:10b6:a03:33c:cafe::8d) by SJ0PR03CA0142.outlook.office365.com
 (2603:10b6:a03:33c::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.28 via Frontend Transport; Tue,
 31 Mar 2026 15:17:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF000001C9.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Tue, 31 Mar 2026 15:17:08 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 31 Mar
 2026 10:17:02 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 31 Mar
 2026 10:17:01 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 31 Mar 2026 10:17:01 -0500
Received: from LTPW0EX92E.dhcp.ti.com (ltpw0ex92e.dhcp.ti.com [10.82.30.14])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62VFGtw22994147;
	Tue, 31 Mar 2026 10:16:55 -0500
From: Niranjan H Y <niranjan.hy@ti.com>
To: <linux-sound@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <broonie@kernel.org>,
	<ckeepax@opensource.cirrus.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <cezary.rojewski@intel.com>,
	<peter.ujfalusi@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
	<ranjani.sridharan@linux.intel.com>, <kai.vehmanen@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <baojun.xu@ti.com>, <shenghao-ding@ti.com>,
	<sandeepk@ti.com>, <v-hampiholi@ti.com>, Niranjan H Y <niranjan.hy@ti.com>
Subject: [PATCH v3 1/4] ASoC: SDCA: Export Q7.8 volume control helpers
Date: Tue, 31 Mar 2026 20:46:35 +0530
Message-ID: <20260331151638.1281-1-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C9:EE_|BN0PR10MB5127:EE_
X-MS-Office365-Filtering-Correlation-Id: 6be1bf9c-c628-485f-0712-08de8f38931c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|7416014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	1VxVJ2pGywcWx0fJ04YG+2njSkreQBVLCBVomdze/dereWhQxJyW2nfFLjG3XsD7yomCOzLPwOGMpQpzB+ph2CTgikGbuTG1vQtXKW2PyVBRo4no2HMEx7yl24q1+/kESys+KjVfSGMpCpjLOJZCI0M+1FEiCPfdhePWcVf1lGP2s/8VcWoWBj0xR5RIA8iv+y/hD8qwq2iVQNmDuP5kOD7vGsgIEQiVZg9YRGgW1Lq+CEYp+sxL1vrLD+u/UVIQw4cbZvuj4rS7fGzoScqywYHK/itis/BPDZZvKMTOgUEPjIePZnMKNdwjmXB0qqFUPrCOGusAKU3Nokdm5RNXwT128BjeDT5Qq4YwKGzr/qQUB/PcHCaxsVG6h0ikPVN4DjDYYhkEhJaXONzUl0UE4wpQ6JKYg2SnhrigdlFRib/F135QZ9ZV/kZJt/fjajJ/WlAQKtjn6YLMwHL1IKzEd5DvYmMlNNk0C60TU6APfCjnOlcVp24QmNLJ9kaRi0B4uaR+0TM9yxo7FUkSxFAZ+RC0tM4831V+2Z3Fh7VPtJv41h14O9mgiI9/r7jQQdR0K3UYsW9740esyZHYHe4Ss6Wr/bUZv9u7n/lF28Xa7gAQsvT7qM+kVovdkEZPAC6WWZnK8lspw5IXJyJQxMRst+jR94Wn2l57dgdYZhtXNx6rF+9ptcbjrSgc3XQbxjyHpZPvAmkPvsnsAe5e3JgWQ7TU/IvI2fnv0/bNo6FcDK26EfNG4xU1UEe5b60sImxIKbnkAJ1fz8S8Lpwmb7+wBg==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(7416014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ldCbqBFwdqnh1tQFjVK87q031p7Ztr2A4YFtxuI1KSeX+B6ekpN6mHJsGbu33eCGYDWKCzfiq4B2Ljku1v30mCo3GACx+d2KlEzsPLOnJI9j2v/Op7T6o6VWApfXUG4J9zJvSIi3CtZs14xQ3P/nPt9W9c9F8WYDTFgzirbuDyz/L9xcat+gPeiDJ7jpGTKYEvkQGtZeZuiZQ1CngBJwg3kAwsCa5PeJ0oOlO24kwhxFkA4z4lL3oq3raceU3+KjiWGj/D38xCFuaa+pu1gGKWmBonFO/JIcjib84/g03nPY2xq+iRQ5G0LLeJV39pl1LxAFoA4rjFVnh5h/b28CzJR5Y9ZI39AlEcZiztyn6wUv1udpsUYHFWoxyHu1E1WWIkxun1XCWlGLOMqu+8QkUKk7qk3y+4ebmqP3EMl3erddTA1vW+HIo41pWm616s7n
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 15:17:08.0921
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6be1bf9c-c628-485f-0712-08de8f38931c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001C9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5127

Export the Q7.8 volume control helpers to allow reuse
by other ASoC drivers. These functions handle 16-bit
signed Q7.8 fixed-point format values for volume controls.

Changes include:
- Rename q78_get_volsw to sdca_asoc_q78_get_volsw
- Rename q78_put_volsw to sdca_asoc_q78_put_volsw
- Add a convenience macro SDCA_SINGLE_Q78_TLV() for creating
  mixer controls

This allows other ASoC drivers to easily implement controls
using the Q7.8 fixed-point format without duplicating code.

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
---
v3:
- prepend apis with sdca_asoc_
- add macro SDCA_SINGLE_Q78_TLV
- updated the commit message based on the latest changes

v2:
- newly added patch
---
 include/sound/sdca_asoc.h  | 25 ++++++++++++++++++++++++-
 sound/soc/sdca/sdca_asoc.c | 14 ++++++++------
 2 files changed, 32 insertions(+), 7 deletions(-)

diff --git a/include/sound/sdca_asoc.h b/include/sound/sdca_asoc.h
index aa9124f932189..5924400e59566 100644
--- a/include/sound/sdca_asoc.h
+++ b/include/sound/sdca_asoc.h
@@ -13,6 +13,8 @@
 struct device;
 struct regmap;
 struct sdca_function_data;
+struct snd_ctl_elem_value;
+struct snd_kcontrol;
 struct snd_kcontrol_new;
 struct snd_pcm_hw_params;
 struct snd_pcm_substream;
@@ -23,6 +25,24 @@ struct snd_soc_dai_ops;
 struct snd_soc_dapm_route;
 struct snd_soc_dapm_widget;
 
+/* convenient macro to handle the volume in 7.8 fixed format representation */
+#define SDCA_SINGLE_Q78_TLV(xname, xreg, xmin, xmax, xstep, tlv_array) \
+{ \
+	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, \
+	.name = xname, \
+	.access = SNDRV_CTL_ELEM_ACCESS_TLV_READ | SNDRV_CTL_ELEM_ACCESS_READWRITE, \
+	.tlv.p = (tlv_array), \
+	.info = snd_soc_info_volsw, \
+	.get = sdca_asoc_q78_get_volsw, \
+	.put = sdca_asoc_q78_put_volsw, \
+	.private_value = (unsigned long)&(struct soc_mixer_control) { \
+		.reg = (xreg), .rreg = (xreg), \
+		.min = (xmin), .max = (xmax), \
+		.shift = (xstep), .rshift = (xstep), \
+		.sign_bit = 15 \
+	} \
+}
+
 int sdca_asoc_count_component(struct device *dev, struct sdca_function_data *function,
 			      int *num_widgets, int *num_routes, int *num_controls,
 			      int *num_dais);
@@ -57,5 +77,8 @@ int sdca_asoc_hw_params(struct device *dev, struct regmap *regmap,
 			struct snd_pcm_substream *substream,
 			struct snd_pcm_hw_params *params,
 			struct snd_soc_dai *dai);
-
+int sdca_asoc_q78_put_volsw(struct snd_kcontrol *kcontrol,
+			    struct snd_ctl_elem_value *ucontrol);
+int sdca_asoc_q78_get_volsw(struct snd_kcontrol *kcontrol,
+			    struct snd_ctl_elem_value *ucontrol);
 #endif // __SDCA_ASOC_H__
diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
index 7709a4ce26e09..2bfc8e5aee31d 100644
--- a/sound/soc/sdca/sdca_asoc.c
+++ b/sound/soc/sdca/sdca_asoc.c
@@ -820,8 +820,8 @@ static int q78_write(struct snd_soc_component *component,
 	return snd_soc_component_update_bits(component, reg, mask, reg_val);
 }
 
-static int q78_put_volsw(struct snd_kcontrol *kcontrol,
-			 struct snd_ctl_elem_value *ucontrol)
+int sdca_asoc_q78_put_volsw(struct snd_kcontrol *kcontrol,
+			    struct snd_ctl_elem_value *ucontrol)
 {
 	struct soc_mixer_control *mc = (struct soc_mixer_control *)kcontrol->private_value;
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
@@ -841,6 +841,7 @@ static int q78_put_volsw(struct snd_kcontrol *kcontrol,
 
 	return ret;
 }
+EXPORT_SYMBOL_NS(sdca_asoc_q78_put_volsw, "SND_SOC_SDCA");
 
 static int q78_read(struct snd_soc_component *component,
 		    struct soc_mixer_control *mc, unsigned int reg)
@@ -855,8 +856,8 @@ static int q78_read(struct snd_soc_component *component,
 	return val & GENMASK(mc->sign_bit, 0);
 }
 
-static int q78_get_volsw(struct snd_kcontrol *kcontrol,
-			 struct snd_ctl_elem_value *ucontrol)
+int sdca_asoc_q78_get_volsw(struct snd_kcontrol *kcontrol,
+			    struct snd_ctl_elem_value *ucontrol)
 {
 	struct soc_mixer_control *mc = (struct soc_mixer_control *)kcontrol->private_value;
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
@@ -868,6 +869,7 @@ static int q78_get_volsw(struct snd_kcontrol *kcontrol,
 
 	return 0;
 }
+EXPORT_SYMBOL_NS(sdca_asoc_q78_get_volsw, "SND_SOC_SDCA");
 
 static int control_limit_kctl(struct device *dev,
 			      struct sdca_entity *entity,
@@ -912,8 +914,8 @@ static int control_limit_kctl(struct device *dev,
 
 	kctl->tlv.p = tlv;
 	kctl->access |= SNDRV_CTL_ELEM_ACCESS_TLV_READ;
-	kctl->get = q78_get_volsw;
-	kctl->put = q78_put_volsw;
+	kctl->get = sdca_asoc_q78_get_volsw;
+	kctl->put = sdca_asoc_q78_put_volsw;
 
 	return 0;
 }
-- 
2.34.1

