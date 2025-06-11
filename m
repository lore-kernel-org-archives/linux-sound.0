Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B260220F2A
	for <linux-sound@vger.kernel.org>; Wed, 11 Jun 2025 10:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749637607; cv=none; b=jPNYEJ8UP1x513yXzVDI+QaT7xehyU/ReJPXhZlf36QvsaTUGDTpKG1dFGLgX2OUs3rRvmhPxtCmRlWiY0uLT8OBZnXMa1x8psx0g/4IYhSwZBfDo71OmTd+X2qiWyIQtw52ic1s+VyAF0GYRr9mYoBLO0orS/IlRGdLDgYUOdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749637607; c=relaxed/simple;
	bh=mvMyuNg94BklKOPlJXP3sYnPivgs5U3VtPtKH8ePR4M=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DdMKz7XW7DeMFGkQm6/H/uRXWtF8P7vhTcJKV3YBZHHTyZsvzBkJ0TrSE1tiv6RhIjTnkVt8tKOEIR/grdVCidC/5SjEGNiz3ckgRkfdmj3g4Kbt5U8CwjRu7+ozyEb8tHIkfCFlw9U1godZ6RGbEd5ioC97J0lkqW2FnnXsVQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=TDjb6IpL; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="TDjb6IpL"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 55BAPuyeE381499, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1749637556; bh=h0bmEaZs+Xdw6fbq/DsFNKLQls/UviXCGghV94D5e/8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=TDjb6IpL07UxjjA0++WgHWuHxr3L2/3BxmsJoSkC1EO5jgh/bx0gohiJKV5nLc6RZ
	 gkpLel53IApQ1yCjH7OQSlxyyguKGfEMpniX8ShIC4KpKLMuWjQw/RV78RXGlJu8cI
	 ZYDdDiQCBqtwkKQgW1RFncjmb4Ie7mscfeKaSZwU9BdF7RJL0Nh9rrHa8rC+/xFyWS
	 P4vVEa+dv0U4KDjiQglk8wxu5LCXTvqks1FZIuM4/BUQG+8XvgF5gSXNkzMEGbC09B
	 HdVhI9QY2I8giE7f3PaaSAEmnAc/70VYd65tCZQR8AGVnwBYtP/B4172ooyq25dR2I
	 VNtYHqBB7BBxA==
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/3.13/5.93) with ESMTPS id 55BAPuyeE381499
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 11 Jun 2025 18:25:56 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Jun 2025 18:25:57 +0800
Received: from sw-server.localdomain (172.22.102.1) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 11 Jun 2025 18:25:56 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <linux-sound@vger.kernel.org>, <lars@metafoo.de>, <flove@realtek.com>,
        <oder_chiou@realtek.com>, <jack.yu@realtek.com>,
        <derek.fang@realtek.com>, <ckeepax@opensource.cirrus.com>,
        <bard.liao@intel.com>, Shuming Fan
	<shumingf@realtek.com>
Subject: [PATCH 1/3] ASoC: SDCA: add support for HIDE entity properties and HID descriptor/report
Date: Wed, 11 Jun 2025 18:25:49 +0800
Message-ID: <20250611102549.563070-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: RTEXH36505.realtek.com.tw (172.21.6.25) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
X-KSE-ServerInfo: RTEXMBS01.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback

From: Shuming Fan <shumingf@realtek.com>

Add support for parsing the HIDE entity descriptor and HID descriptor/report

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 include/sound/sdca_function.h   | 29 ++++++++++++
 sound/soc/sdca/sdca_functions.c | 83 +++++++++++++++++++++++++++++++++
 2 files changed, 112 insertions(+)

diff --git a/include/sound/sdca_function.h b/include/sound/sdca_function.h
index eaedb54a8322..856b0f40ce5e 100644
--- a/include/sound/sdca_function.h
+++ b/include/sound/sdca_function.h
@@ -11,6 +11,7 @@
 
 #include <linux/bits.h>
 #include <linux/types.h>
+#include <linux/hid.h>
 
 struct device;
 struct sdca_entity;
@@ -1040,6 +1041,32 @@ struct sdca_entity_ge {
 	int num_modes;
 };
 
+/**
+ * struct sdca_entity_hide - information specific to HIDE Entities
+ * @hid: HID device structure
+ * @hidtx_ids: HIDTx Report ID
+ * @num_hidtx_ids: number of HIDTx Report ID
+ * @hidrx_ids: HIDRx Report ID
+ * @num_hidrx_ids: number of HIDRx Report ID
+ * @hide_reside_function_num: indicating which Audio Function Numbers within this Device
+ * @max_delay: the maximum time in microseconds allowed for the Device to change the ownership from Device to Host
+ * @af_number_list: which Audio Function Numbers within this Device are sending/receiving the messages in this HIDE
+ * @hid_desc: HID descriptor for the HIDE Entity
+ * @hid_report_desc: HID Report Descriptor for the HIDE Entity
+ */
+struct sdca_entity_hide {
+	struct hid_device *hid;
+	unsigned int *hidtx_ids;
+	int num_hidtx_ids;
+	unsigned int *hidrx_ids;
+	int num_hidrx_ids;
+	unsigned int hide_reside_function_num;
+	unsigned int max_delay;
+	unsigned int af_number_list[SDCA_MAX_FUNCTION_COUNT];
+	struct hid_descriptor hid_desc;
+	unsigned char *hid_report_desc;
+};
+
 /**
  * struct sdca_entity - information for one SDCA Entity
  * @label: String such as "OT 12".
@@ -1055,6 +1082,7 @@ struct sdca_entity_ge {
  * @cs: Clock Source specific Entity properties.
  * @pde: Power Domain Entity specific Entity properties.
  * @ge: Group Entity specific Entity properties.
+ * @hide: HIDE Entity specific Entity properties.
  */
 struct sdca_entity {
 	const char *label;
@@ -1071,6 +1099,7 @@ struct sdca_entity {
 		struct sdca_entity_cs cs;
 		struct sdca_entity_pde pde;
 		struct sdca_entity_ge ge;
+		struct sdca_entity_hide hide;
 	};
 };
 
diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index 64ac26443890..4a89067dcf76 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -1220,6 +1220,86 @@ static int find_sdca_entity_ge(struct device *dev,
 	return -EINVAL;
 }
 
+static int
+find_sdca_entity_hide(struct device *dev, struct fwnode_handle *function_node,
+		      struct fwnode_handle *entity_node, struct sdca_entity *entity)
+{
+	struct sdca_entity_hide *hide = &entity->hide;
+	unsigned int delay, *af_list = hide->af_number_list;
+	int nval, ret;
+	unsigned char *report_desc = NULL;
+
+	ret = fwnode_property_read_u32(entity_node,
+				       "mipi-sdca-RxUMP-ownership-transition-maxdelay", &delay);
+	if (!ret)
+		hide->max_delay = delay;
+
+	nval = fwnode_property_count_u32(entity_node, "mipi-sdca-HIDTx-supported-report-ids");
+	if (nval > 0) {
+		hide->num_hidtx_ids = nval;
+		hide->hidtx_ids = devm_kcalloc(dev, hide->num_hidtx_ids,
+					       sizeof(*hide->hidtx_ids), GFP_KERNEL);
+		if (!hide->hidtx_ids)
+			return -ENOMEM;
+
+		ret = fwnode_property_read_u32_array(entity_node,
+						     "mipi-sdca-HIDTx-supported-report-ids",
+						     hide->hidtx_ids,
+						     hide->num_hidtx_ids);
+		if (ret < 0)
+			return ret;
+	}
+
+	nval = fwnode_property_count_u32(entity_node, "mipi-sdca-HIDRx-supported-report-ids");
+	if (nval > 0) {
+		hide->num_hidrx_ids = nval;
+		hide->hidrx_ids = devm_kcalloc(dev, hide->num_hidrx_ids,
+					       sizeof(*hide->hidrx_ids), GFP_KERNEL);
+		if (!hide->hidrx_ids)
+			return -ENOMEM;
+
+		ret = fwnode_property_read_u32_array(entity_node,
+						     "mipi-sdca-HIDRx-supported-report-ids",
+						     hide->hidrx_ids,
+						     hide->num_hidrx_ids);
+		if (ret < 0)
+			return ret;
+	}
+
+	nval = fwnode_property_count_u32(entity_node, "mipi-sdca-hide-related-audio-function-list");
+	if (nval <= 0) {
+		dev_err(dev, "%pfwP: audio function numbers list missing: %d\n",
+			entity_node, nval);
+		return -EINVAL;
+	} else if (nval > SDCA_MAX_FUNCTION_COUNT) {
+		dev_err(dev, "%pfwP: maximum number of audio function exceeded\n", entity_node);
+		return -EINVAL;
+	}
+
+	hide->hide_reside_function_num = nval;
+	fwnode_property_read_u32_array(entity_node,
+				       "mipi-sdca-hide-related-audio-function-list", af_list, nval);
+
+	nval = fwnode_property_count_u8(function_node, "mipi-sdca-hid-descriptor");
+	if (nval)
+		fwnode_property_read_u8_array(function_node, "mipi-sdca-hid-descriptor",
+					      (u8 *)&hide->hid_desc, nval);
+
+	if (hide->hid_desc.bNumDescriptors) {
+		nval = fwnode_property_count_u8(function_node, "mipi-sdca-report-descriptor");
+		if (nval) {
+			report_desc = devm_kzalloc(dev, nval, GFP_KERNEL);
+			if (!report_desc)
+				return -ENOMEM;
+			hide->hid_report_desc = report_desc;
+			fwnode_property_read_u8_array(function_node, "mipi-sdca-report-descriptor",
+						      report_desc, nval);
+		}
+	}
+
+	return 0;
+}
+
 static int find_sdca_entity(struct device *dev,
 			    struct fwnode_handle *function_node,
 			    struct fwnode_handle *entity_node,
@@ -1261,6 +1341,9 @@ static int find_sdca_entity(struct device *dev,
 	case SDCA_ENTITY_TYPE_GE:
 		ret = find_sdca_entity_ge(dev, entity_node, entity);
 		break;
+	case SDCA_ENTITY_TYPE_HIDE:
+		ret = find_sdca_entity_hide(dev, function_node, entity_node, entity);
+		break;
 	default:
 		break;
 	}
-- 
2.34.1

