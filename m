Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010065.outbound.protection.outlook.com [52.101.201.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D6241162D;
	Wed,  1 Apr 2026 13:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775049763; cv=fail; b=bYDziEcSiEy+iufIv0JoZM/W6YzsWsXnLr1VwiHvYBcOP9krMuHqPX2eewIxhmLuud1gTI44uUQG1lGt/fAZfyhrF2qE1eJYc6mTjo0T+eVflG2q3uqQvfRDHF5nASozeaWguZFceSovsDGTgHM/VSH7FQKXBjutMV0G2xLdS9M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775049763; c=relaxed/simple;
	bh=5EFpng4EEuDVmfCbjpbkmZUtUdDQevnlcPJvlEjWd2w=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=J1VNLHHcmGbp9K/Bq9YQ008/bAAfxa/z14qQOowl7p4zEaGnGBjRfMy9eIPG8CEgJVGbL4EjWuzRQRQ2DPTWF8MBviaEcgL5L756S0oMju9J8/xmsnpMoOpAGoupcjQ9yTgTEtzGrn+nDsm+bIRiszX+DjMKqwddu9lXfRNzATE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=npmQshbe; arc=fail smtp.client-ip=52.101.201.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="npmQshbe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NcMwECCmGuRXCWxo6319IC0QJwimwPxeGsKUuKWk1jhHeOev0OrgrLv1zGsZRGlr90GUgy8lKyQMkowpLfQC6lU2NYiXqx/MdgHWges/9Xy4jiRYBqXF40ITB4MWFKcCUYAsTlkYp/5zK2IBhl4PUBX0A4tzgjZnwnYn1lyYH8RvZWhrC3NUpfbBWfYq9e1Hp0yhTYNJB3bjNHxKi7Ev9JkqAk8yP09t0mz8N9ySNW0AsKK23ybzPg2/ER9CqNczhi9/aWWoauiIgnBXmePujnm/sN5UXab6CoS2ZkojpXf1YYknLLpcQPsKad47HdluznTsDaWZPgz1W4+eD87XdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0SUrabzAQGK+cfGxaQxVbfqlouDRxA9usdHqC+keMuQ=;
 b=nc1SXyNhDdfIjUZgNheTpMGW+gqBM1SdstRuR8MUthpm75VXImcIwJuACeGZfpz3t+76DDjIYz2YWaBDoxlDtVI06QQuGHZaEwwdQBuhxZwTpABy0LbyUxe05Nsi1WCxgfe7/zunxA5Vjky6OYdHT5wWkewbv+CFcnPDESf0Ze2XtSpFRENLHHtwjBkmo2yXnR0oIBZ86MDmpwjhINaSmIDZjlpFIU+8fdcL64cm1bUSGaGnYXwjEsiRdDhtgsTIxfCiyqUFulBJY8pHyKQsbO71c8uZHBStOdAv5yCSixLyjpYWExjCOy2vxs9qbYYitcPZVtsBr4LdjTFtkdvVug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=linux.dev smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0SUrabzAQGK+cfGxaQxVbfqlouDRxA9usdHqC+keMuQ=;
 b=npmQshbeM260IRvxQsKjjT29VAeI01W4pbPOv+4xqriceYOg9F9A5rVc2cdDI+HsF7ul16ypwcxZ6xcXGrp+sQGmjdahQ/1UPp0UNlpJJW7lfY2fGeJBtdxLWFOiOKl9CiUw1ieW3MLCJ9pT49p+AzYzeHA5mrupu+VuOOPWPsc=
Received: from SA1P222CA0120.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c5::16)
 by CH3PR10MB6901.namprd10.prod.outlook.com (2603:10b6:610:14d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 13:22:34 +0000
Received: from SN1PEPF0002BA50.namprd03.prod.outlook.com
 (2603:10b6:806:3c5:cafe::52) by SA1P222CA0120.outlook.office365.com
 (2603:10b6:806:3c5::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.30 via Frontend Transport; Wed,
 1 Apr 2026 13:22:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SN1PEPF0002BA50.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 1 Apr 2026 13:22:33 +0000
Received: from DFLE200.ent.ti.com (10.64.6.58) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 1 Apr
 2026 08:22:23 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 1 Apr
 2026 08:22:22 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 1 Apr 2026 08:22:22 -0500
Received: from LTPW0EX92E.dhcp.ti.com (ltpw0ex92e.dhcp.ti.com [10.82.30.14])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 631DMHUR147568;
	Wed, 1 Apr 2026 08:22:18 -0500
From: Niranjan H Y <niranjan.hy@ti.com>
To: <linux-sound@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <broonie@kernel.org>,
	<ckeepax@opensource.cirrus.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <cezary.rojewski@intel.com>,
	<peter.ujfalusi@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
	<ranjani.sridharan@linux.intel.com>, <kai.vehmanen@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <baojun.xu@ti.com>, <shenghao-ding@ti.com>,
	<sandeepk@ti.com>, <v-hampiholi@ti.com>, Niranjan H Y <niranjan.hy@ti.com>
Subject: [PATCH v4 1/4] ASoC: SDCA: Export Q7.8 volume control helpers
Date: Wed, 1 Apr 2026 18:51:45 +0530
Message-ID: <20260401132148.2367-1-niranjan.hy@ti.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA50:EE_|CH3PR10MB6901:EE_
X-MS-Office365-Filtering-Correlation-Id: d4237396-a1ca-4268-47bd-08de8ff1bbc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|7416014|82310400026|1800799024|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	ccDzELZgWypAv9uh5P3Bc8J9ZKLJzsZOWmF0+tuTeI/HDxKyxQyWZ2IbCxxgve+o7iaiBNZTfFj2CDCQXatasoAOO5jcFWtmbIFvYqbA5bVY2iiXnFR3iAt3JZi+PceUloF7tP/KYwORUfnANuHy2tgR7UbQqtTNezEhWM/zUnRFvcMJnwboBzoQFTYfmZCtF4EToXCs3U2sLXuoPAHaX4EUns9SDC46PV2dZkdv/Kz2ahX1TET2jEaLrenLOC+ZAgi5Dmw21QhGx68m/+kI7fK45QbizML5/SO+O94sSL7qOZIIKEB9mSuPeXOoZgCVw1d1Ax4n3XVVDd6xxrbteozKmUBMCo+gN5FH6TuaXEQVWwRHlrhQHhjDRnNPvC/6DreD83aKaPz6Eb1H8nCaYGzER9peQDRVYgWruXPiFKOE0KWK6xFqYU6oU3qyheMTKYP9UHDZcs28KJRe6AAm5eY4hl+yIO8QCcjZNYBsXSSAL2zJX7oJlXv1wrlIyzwZgRjVM869giX2fiqYsJdPDk5ttBDrXbbYnMZWyi7ATt7T8+7bhZuFcNQMh6duj1+xP4RLFiLltHynZlZtqw6UvNLYwlHk6lceGhJVK+/m06dyGR63ZtFV+06PjbRSm8mjZPa4cpyjR/iA77tDqE+3qr10Cz3raDzDOrAtI0U0PVS+hgqnuRXdTV192by2J8a8OK8dgTbXL/WyYGQJADi25nkKbQjp4USRKLZ8R82QcW83GecUEhoBxIwiv+Yah7y9t6vcwynonFni+ke5PCJvRw==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(82310400026)(1800799024)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	aHsF6ety6pv0XKiMwCMdliglJgwLxVGETAeUNjPdmrHdUpZk7ajfiQpGRzJZijwUo6DICon1Yaau+CxgHIt0VlBIH9Dn4awFkD62c1bgmWlPzAmMSNI2qowW3MIJahYKjf1dhQwi7lCu3hT2i+dNYN8jNZPfTXKB5XilYLR2Mrm+JgnULUuNeBAo0qkD5J/FAFU0pSgA4QAYoTKndmcIsHrIlx1adQsYJdHcxFJQoif9OMd+Umex/4P/F6H413vXLVVvyhrPHBLtXqcKpWKHnwkRrFfhtEhGIL+MLTgvESSETkGjivJPmHy2KgYtrDso2SXinop5txnE++KaoMzvkqjryUQ2v+VhDQssqlmkTI330VTJgG6m7lIP93LTi1Drul8a4I4hmwng1HVE4Yofs39v9VminPePcUt1vQhpW7OpqIGrDqOs2/KLylvBH5ZK
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 13:22:33.2408
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4237396-a1ca-4268-47bd-08de8ff1bbc3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA50.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6901

Export the Q7.8 volume control helpers to allow reuse
by other ASoC drivers. These functions handle 16-bit
signed Q7.8 fixed-point format values for volume controls.

Changes include:
- Rename q78_get_volsw to sdca_asoc_q78_get_volsw
- Rename q78_put_volsw to sdca_asoc_q78_put_volsw
- Add a convenience macro SDCA_SINGLE_Q78_TLV and
  SDCA_DOUBLE_Q78_TLV for creating mixer controls

This allows other ASoC drivers to easily implement controls
using the Q7.8 fixed-point format without duplicating code.

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
---
v4:
- add macro SDCA_DOUBLE_Q78_TLV

v3:
- prepend apis with sdca_asoc_
- add macro SDCA_SINGLE_Q78_TLV
- updated the commit message based on the latest changes

v2:
- newly added patch
---
 include/sound/sdca_asoc.h  | 43 +++++++++++++++++++++++++++++++++++++-
 sound/soc/sdca/sdca_asoc.c | 14 +++++++------
 2 files changed, 50 insertions(+), 7 deletions(-)

diff --git a/include/sound/sdca_asoc.h b/include/sound/sdca_asoc.h
index aa9124f932189..46a61a52decc5 100644
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
@@ -23,6 +25,42 @@ struct snd_soc_dai_ops;
 struct snd_soc_dapm_route;
 struct snd_soc_dapm_widget;
 
+/* convenient macro to handle the mono volume in 7.8 fixed format representation */
+#define SDCA_SINGLE_Q78_TLV(xname, xreg, xmin, xmax, xstep, tlv_array) \
+{ \
+	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, \
+	.name = (xname), \
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
+/* convenient macro for stereo volume in 7.8 fixed format with separate registers for L/R */
+#define SDCA_DOUBLE_Q78_TLV(xname, xreg_l, xreg_r, xmin, xmax, xstep, tlv_array) \
+{ \
+	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, \
+	.name = (xname), \
+	.access = SNDRV_CTL_ELEM_ACCESS_TLV_READ | SNDRV_CTL_ELEM_ACCESS_READWRITE, \
+	.tlv.p = (tlv_array), \
+	.info = snd_soc_info_volsw, \
+	.get = sdca_asoc_q78_get_volsw, \
+	.put = sdca_asoc_q78_put_volsw, \
+	.private_value = (unsigned long)&(struct soc_mixer_control) { \
+		.reg = (xreg_l), .rreg = (xreg_r), \
+		.min = (xmin), .max = (xmax), \
+		.shift = (xstep), .rshift = (xstep), \
+		.sign_bit = 15 \
+	} \
+}
+
 int sdca_asoc_count_component(struct device *dev, struct sdca_function_data *function,
 			      int *num_widgets, int *num_routes, int *num_controls,
 			      int *num_dais);
@@ -57,5 +95,8 @@ int sdca_asoc_hw_params(struct device *dev, struct regmap *regmap,
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

