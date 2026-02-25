Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE8F3AEF4B
	for <linux-sound@vger.kernel.org>; Wed, 25 Feb 2026 14:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772028129; cv=fail; b=bois28r7U0WJ7oMf2JStYQq3By3lYXnRL/OdOy4VQWaWB51U32GSVb3MoI+N2X27PPH64Zcuvd0ZUnSi3qfXzr//j5z4ZQZfOx3cxXqqiPasDqvQPKk7Sta37wUOSjazFAYI+ZKoi8qOhIQ66htsLeqE/FdmHP8zPfYKDh8tPmQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772028129; c=relaxed/simple;
	bh=NyzQPSLF9GH2QHGyjM1zST1xhWL5RdVzmN+NcTBHkaw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LvGCO19kMR+8XoicIcmlWAaLhH37yFJ/BnA6OoEbafUu/I/8qMBzF5birxQaUw7Cp3xW8HmSC6IbTapzKIh80KCIwougc+8CG1rPH0Y4soBm8xGka3lRkuihNSA6EXbyMfj0lV9mPKdFLO0AnN9rkEM4BxdErt62AdSVq0e02k4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=eMeiBDyN; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=QwL2hvi9; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="eMeiBDyN";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="QwL2hvi9"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P5xWZJ2374262;
	Wed, 25 Feb 2026 08:01:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=1QktTpE+3xHwGtEst5OeKz+9VeMusRVZi42z8lYCsTQ=; b=
	eMeiBDyNrGFL3TiC6ni35/ryvEuxhNHtgqQLyKpNpYHCsQMQF7xvKfsoXCAZZmWs
	AU+ZnhlFZLFhhxTsb4Q9Em0kETXNd7kUYyZOtpiAvmoQuKA1gKSiHsjHsEXVWc1k
	6xsbPJABeeJVbmxcwipckAnsCoDR1Rp5yvGPsYUGXZXNWRqT75ZoztWqPRqSvJD7
	ih5cL/d5dNc2JSXJo1CRalrb426VXNB6S+aqo+Rx7UN2pj+DU9fOBInM9M6AoErA
	ePv5Na4tZ1JDd6EXt2ulUiy+HvmfDjMCC0PIRaQCmjwdei10lDy7cf+w7QQ7369v
	ZryZ9lT3fb39KltqOAtlXg==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020072.outbound.protection.outlook.com [52.101.201.72])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4cfa0j4e77-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 25 Feb 2026 08:01:32 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fj9LM/NKSYemKgE+SMAFfW/NMdvU5zbxcO3qTfl2aJ3VDV1ZZv46sCiK+4GjfLYGMCcO77/WfhZ271mW4b1VjZNUBCxHuR4iyRECMw3RH0krZeCyY3SuhovqULHgkNdCtUgynhPI8eS1pmASRsMurNsS/b7cATHd6fLzUO/jsAlRjlvUrrT/sVn08Y/rnJosZHbFIzRWBcdjZYwwDLkQAr70eR6y6X1Rm8B7DteAw7S9g8New2wyc4WalmIIqFsBvxndMY8KSJJrLe2mdYnu6LWvbq5ooM97GaC6bYFyXkl6srL8cWcdfz6LdoMD5t6btxfqxsq2puz1QeFHWbdkVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1QktTpE+3xHwGtEst5OeKz+9VeMusRVZi42z8lYCsTQ=;
 b=uM5sgke6ce62utdpV9HhRYRA1MeZa/6ER1BtsDBAiVCgexOJVljji9G0WvPQ0VJVDUT46bl8fcW3OpgjuF7iZyPq6kteHRGo6rR2Xg/a1+vobkJ/rmbdeXocH1gECkCTLQ4Hb9wx3VYIA5ELDmHTj2Q5nVijRYkKfIjEwokJeQIWG+ho0GXnf8htJt5IR2h5JcbGXEDe1lycYk7FTw6rp2k6flJYFUUp4sWlqGA04gZ6i7pJ5YEAN80XJhwPcK70Z09ynl/x+IqvzlZYc2ZaI+x0zf7xeNldGa4R5shr/A4ZJA7gg6mCvBc0/hN6lUN877N2wLCDVwiSOh+H7Wx0FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1QktTpE+3xHwGtEst5OeKz+9VeMusRVZi42z8lYCsTQ=;
 b=QwL2hvi9MHulMP6WuI3deGvmhlKuacEiN4dzP7FSo9/khaYxg5Iv1knt5d6Irsm3KyZXoW3NT1jeEtrkx4fvpeqTezn3RJiHTQCsrJ5vgQgf9Kni6bANo4L4YytWFxgdg/zFkm4bL+MjcDkAoZqsThDGSmZrHJgzUxZlaSaPa2I=
Received: from BN9PR03CA0199.namprd03.prod.outlook.com (2603:10b6:408:f9::24)
 by BL1PPF7FD9E816C.namprd19.prod.outlook.com (2603:10b6:20f:fc04::ebb) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 25 Feb
 2026 14:01:25 +0000
Received: from BN1PEPF00004688.namprd05.prod.outlook.com
 (2603:10b6:408:f9:cafe::a1) by BN9PR03CA0199.outlook.office365.com
 (2603:10b6:408:f9::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Wed,
 25 Feb 2026 14:00:53 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN1PEPF00004688.mail.protection.outlook.com (10.167.243.133) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Wed, 25 Feb 2026 14:01:23 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 57258406544;
	Wed, 25 Feb 2026 14:01:22 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 2ECB2822543;
	Wed, 25 Feb 2026 14:01:22 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 4/4] ASoC: SDCA: Pull the Q7.8 volume helpers out of soc-ops
Date: Wed, 25 Feb 2026 14:01:18 +0000
Message-ID: <20260225140118.402695-5-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260225140118.402695-1-ckeepax@opensource.cirrus.com>
References: <20260225140118.402695-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004688:EE_|BL1PPF7FD9E816C:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c7757150-fa74-49db-1271-08de74765c42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|61400799027|54012099003;
X-Microsoft-Antispam-Message-Info:
	HmUfzpzdr1Lg4szCCzOiq25RrPp8j1VK0l9KtPsMl2ERHYSqHGKFI5xJKMHVsPI0VKOo9xaS6XvZcNgwD4snlz7GwmOIf7pmkvRMdcQ1Quy0RmZXeNEN8s8qC09jnw8gVHFBSjU0qO324BevmtYjPaeAdJsfAyNJlvfrlql5ZMqyJpVUWNa1wDyH5hFwxNukwdC0E+WMc+605VCoh25bQopRHsiuouN8SgMqif8C5YCHAx8PgMbWl5yvfT70Akrwr0QHNYrfk96QrDpWVg0U+7Iq2HSU//4tDID+UK7xod3ofMMJ0nAbQ2nZZor19SazzGlAvbvaxp4eDjkLZa3QorWeJCgTgugGL1O4WjB/FC6Zfdl/AcxXHO7UpC7tu8rMIVTaNeXSaCb0p6posGzNmuX9gKoGoNEGtauBL7aXSJ99kKUJ5nAyoZJrzJZenlUR7cqoehtEyHNGI9trbj10UHjAtFRXZn/0+Pd7G3hwweZz+wQ0pWTbLUtyzWFr/VxlZc4dOxK44C5yp0cMVs6zV11OGVQshpTV/SdenuPEyR7AxpW/wAVGtEG4ptSzW8qFpojGXYMB9UCCJyhn8OgImtOBln+ZS3zrZzHTfVffWW7DpiI5+8C1+YFoUtrqc4pAabxe+z89fpk2LSNJBdZ+4x5w4aT/XnSUyVb83IPqzlxQ1kzalFSIafA8oHc5siXtPNZ0PqH9GafBcL2e1L//hjCaYp8JDAqfYIRtLI9LdP3r6YpmUzfOwIHZPXQRkXhASRbL0xYGzXyUHQOBQeRMI9SzkGOZlVSWXhGryA9n4Nbys1iAOMY5+4F4nH/0Yr1Ua/LxdPVL+FRdxETwvnPrWw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(61400799027)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vYoNuwh35sIoU8dda4weRPuMekYLftCmMpNArgdE/BQ2a8T0xLUq+DSfwPbzk7UUfcDbkA3HbRi9GRzRyXMSkjmM7GWNIaqXY7Qn65ieUrqEvJTo8QGMBghpOHRtx1Jj3BmEdu8koGNlW/Q+mbTazJAr8pbE5tM0HOR5sf03Yzv/HiBkSin5fHhJg1ZGzfN1fiKXqMiLovb9CX+i2IWsqLdHJk+NmowNS8C07G/DR3k8ON539JwyMU5irR0QdRgGemwJVKNU4SJXtGYSrY9fAr1Pm+AwHslm+hHlPuJ0L9HhJzw15bwxXWyXpemnI6n1XI2Jn8/Ir/FEyVeoPSohKTnaLRhROQZwUm+WpiS+57hXPoKyR6HK9dXFlGb0GnWSGX8K9jkTVSP7eouTzihAeT0GqvDMnlF3o94LaUBhVD8ESbE+lYqltqCXQR2QFA2C
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 14:01:23.3850
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7757150-fa74-49db-1271-08de74765c42
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF00004688.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PPF7FD9E816C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDEzNCBTYWx0ZWRfX1d0KppSFZBDh
 HgGnAkIUlrimpR+DYjlk5VVc4PP6hx14ygyCYT9Fl4co+TJjUQocvusbbqvtnzaDVsR4Bpazeq/
 xRvhQ64K7CJ1FZ7cJutTyZH7zHQnLO/HF5sDwbifbjr94lsvOB8t/ubWcCYBSKWCqMMH5DtPOeL
 XZ4TzoirBbBDkIpFGtQvV5P/AvHZn8/k2M8J3/Tkk3qN6Vedj+GNL/yo8TVZimbyrRaPKgRmXVI
 VaFVE7ymV2Rq3Klmho6D0ptbE9xqXlCnXuDPbu8LOc0rTnYlxaUyY2XOrU/KgAmHyXXHdjK5VHt
 cV6s7J/sLaNMvT8Gmeja3nWRTxqIMYRtKRqyjUvm1YmGAiJJPg8qnjEKRt8+/8u2xTYcA/bvHOk
 dTaDRcPxstaLY7rFYwhYGdpNDY6Ppo82pq+PWcj4D445/3UQHCaRflsfA655G0ivPU6pqn2cuOQ
 ROWuxm87FXizbdxgG8Q==
X-Authority-Analysis: v=2.4 cv=Q/7fIo2a c=1 sm=1 tr=0 ts=699f00bc cx=c_pps
 a=IBJHqVCGmmUWI27oiwGTEA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=9jZZ71lAdJMwbo2PLCIA:9
X-Proofpoint-GUID: inZcT1EFm__yl-AxcZGzymhsM7d16puO
X-Proofpoint-ORIG-GUID: inZcT1EFm__yl-AxcZGzymhsM7d16puO
X-Proofpoint-Spam-Reason: safe

It is cleaner to keep the SDCA code contained and not update the core
code for things that are unlikely to see reuse outside of SDCA. Move the
Q7.8 volume helpers back into the SDCA core code.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v1:
 - Correctly set val_mask in soc_put_volsw.

 include/sound/soc.h        |  1 -
 sound/soc/sdca/sdca_asoc.c | 67 +++++++++++++++++++++++++++++++++++++-
 sound/soc/soc-ops.c        | 56 +++++++------------------------
 3 files changed, 77 insertions(+), 47 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 7d8376c8e1bed..172bd68e1315f 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1239,7 +1239,6 @@ struct soc_mixer_control {
 	unsigned int sign_bit;
 	unsigned int invert:1;
 	unsigned int autodisable:1;
-	unsigned int sdca_q78:1;
 #ifdef CONFIG_SND_SOC_TOPOLOGY
 	struct snd_soc_dobj dobj;
 #endif
diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
index e6f7c2778bec5..a342a4e56717a 100644
--- a/sound/soc/sdca/sdca_asoc.c
+++ b/sound/soc/sdca/sdca_asoc.c
@@ -805,6 +805,70 @@ int sdca_asoc_populate_dapm(struct device *dev, struct sdca_function_data *funct
 }
 EXPORT_SYMBOL_NS(sdca_asoc_populate_dapm, "SND_SOC_SDCA");
 
+static int q78_write(struct snd_soc_component *component,
+		     struct soc_mixer_control *mc,
+		     unsigned int reg, const int val)
+{
+	unsigned int mask = GENMASK(mc->sign_bit, 0);
+	unsigned int reg_val;
+
+	if (val < 0 || val > mc->max - mc->min)
+		return -EINVAL;
+
+	reg_val = (val + mc->min) * mc->shift;
+
+	return snd_soc_component_update_bits(component, reg, mask, reg_val);
+}
+
+static int q78_put_volsw(struct snd_kcontrol *kcontrol,
+			 struct snd_ctl_elem_value *ucontrol)
+{
+	struct soc_mixer_control *mc = (struct soc_mixer_control *)kcontrol->private_value;
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	int ret;
+
+	ret = q78_write(component, mc, mc->reg, ucontrol->value.integer.value[0]);
+	if (ret < 0)
+		return ret;
+
+	if (snd_soc_volsw_is_stereo(mc)) {
+		int err; /* Don't drop change flag */
+
+		err = q78_write(component, mc, mc->rreg, ucontrol->value.integer.value[1]);
+		if (err)
+			return err;
+	}
+
+	return ret;
+}
+
+static int q78_read(struct snd_soc_component *component,
+		    struct soc_mixer_control *mc, unsigned int reg)
+{
+	unsigned int reg_val;
+	int val;
+
+	reg_val = snd_soc_component_read(component, reg);
+
+	val = (sign_extend32(reg_val, mc->sign_bit) / mc->shift) - mc->min;
+
+	return val & GENMASK(mc->sign_bit, 0);
+}
+
+static int q78_get_volsw(struct snd_kcontrol *kcontrol,
+			 struct snd_ctl_elem_value *ucontrol)
+{
+	struct soc_mixer_control *mc = (struct soc_mixer_control *)kcontrol->private_value;
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+
+	ucontrol->value.integer.value[0] = q78_read(component, mc, mc->reg);
+
+	if (snd_soc_volsw_is_stereo(mc))
+		ucontrol->value.integer.value[1] = q78_read(component, mc, mc->rreg);
+
+	return 0;
+}
+
 static int control_limit_kctl(struct device *dev,
 			      struct sdca_entity *entity,
 			      struct sdca_control *control,
@@ -845,10 +909,11 @@ static int control_limit_kctl(struct device *dev,
 	mc->max = max / step;
 	mc->shift = step;
 	mc->sign_bit = 15;
-	mc->sdca_q78 = 1;
 
 	kctl->tlv.p = tlv;
 	kctl->access |= SNDRV_CTL_ELEM_ACCESS_TLV_READ;
+	kctl->get = q78_get_volsw;
+	kctl->put = q78_put_volsw;
 
 	return 0;
 }
diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index 8ae6609ca9618..0d633f38cfdca 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -110,29 +110,6 @@ int snd_soc_put_enum_double(struct snd_kcontrol *kcontrol,
 }
 EXPORT_SYMBOL_GPL(snd_soc_put_enum_double);
 
-static int sdca_soc_q78_reg_to_ctl(struct soc_mixer_control *mc, unsigned int reg_val,
-				   unsigned int mask, unsigned int shift, int max,
-				   bool sx)
-{
-	int val = reg_val;
-
-	if (WARN_ON(!mc->shift))
-		return -EINVAL;
-
-	val = sign_extend32(val, mc->sign_bit);
-
-	return ((val / mc->shift) - mc->min) & mask;
-}
-
-static unsigned int sdca_soc_q78_ctl_to_reg(struct soc_mixer_control *mc, int val,
-					 unsigned int mask, unsigned int shift, int max)
-{
-	if (WARN_ON(!mc->shift))
-		return -EINVAL;
-
-	return ((val + mc->min) * mc->shift) & mask;
-}
-
 static int soc_mixer_reg_to_ctl(struct soc_mixer_control *mc, unsigned int reg_val,
 				unsigned int mask, unsigned int shift, int max,
 				bool sx)
@@ -226,27 +203,19 @@ static int soc_put_volsw(struct snd_kcontrol *kcontrol,
 			 struct snd_ctl_elem_value *ucontrol,
 			 struct soc_mixer_control *mc, int mask, int max)
 {
-	unsigned int (*ctl_to_reg)(struct soc_mixer_control *, int, unsigned int, unsigned int, int);
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	unsigned int val1, val_mask;
 	unsigned int val2 = 0;
 	bool double_r = false;
 	int ret;
 
-	if (mc->sdca_q78) {
-		ctl_to_reg = sdca_soc_q78_ctl_to_reg;
-		val_mask = mask;
-	} else {
-		ctl_to_reg = soc_mixer_ctl_to_reg;
-		val_mask = mask << mc->shift;
-	}
-
 	ret = soc_mixer_valid_ctl(mc, ucontrol->value.integer.value[0], max);
 	if (ret)
 		return ret;
 
-	val1 = ctl_to_reg(mc, ucontrol->value.integer.value[0],
+	val1 = soc_mixer_ctl_to_reg(mc, ucontrol->value.integer.value[0],
 				    mask, mc->shift, max);
+	val_mask = mask << mc->shift;
 
 	if (snd_soc_volsw_is_stereo(mc)) {
 		ret = soc_mixer_valid_ctl(mc, ucontrol->value.integer.value[1], max);
@@ -254,10 +223,14 @@ static int soc_put_volsw(struct snd_kcontrol *kcontrol,
 			return ret;
 
 		if (mc->reg == mc->rreg) {
-			val1 |= ctl_to_reg(mc, ucontrol->value.integer.value[1], mask, mc->rshift, max);
+			val1 |= soc_mixer_ctl_to_reg(mc,
+						     ucontrol->value.integer.value[1],
+						     mask, mc->rshift, max);
 			val_mask |= mask << mc->rshift;
 		} else {
-			val2 = ctl_to_reg(mc, ucontrol->value.integer.value[1], mask, mc->shift, max);
+			val2 = soc_mixer_ctl_to_reg(mc,
+						    ucontrol->value.integer.value[1],
+						    mask, mc->shift, max);
 			double_r = true;
 		}
 	}
@@ -281,28 +254,21 @@ static int soc_get_volsw(struct snd_kcontrol *kcontrol,
 			 struct snd_ctl_elem_value *ucontrol,
 			 struct soc_mixer_control *mc, int mask, int max, bool sx)
 {
-	int (*reg_to_ctl)(struct soc_mixer_control *, unsigned int, unsigned int,
-			  unsigned int, int, bool);
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	unsigned int reg_val;
 	int val;
 
-	if (mc->sdca_q78)
-		reg_to_ctl = sdca_soc_q78_reg_to_ctl;
-	else
-		reg_to_ctl = soc_mixer_reg_to_ctl;
-
 	reg_val = snd_soc_component_read(component, mc->reg);
-	val = reg_to_ctl(mc, reg_val, mask, mc->shift, max, sx);
+	val = soc_mixer_reg_to_ctl(mc, reg_val, mask, mc->shift, max, sx);
 
 	ucontrol->value.integer.value[0] = val;
 
 	if (snd_soc_volsw_is_stereo(mc)) {
 		if (mc->reg == mc->rreg) {
-			val = reg_to_ctl(mc, reg_val, mask, mc->rshift, max, sx);
+			val = soc_mixer_reg_to_ctl(mc, reg_val, mask, mc->rshift, max, sx);
 		} else {
 			reg_val = snd_soc_component_read(component, mc->rreg);
-			val = reg_to_ctl(mc, reg_val, mask, mc->shift, max, sx);
+			val = soc_mixer_reg_to_ctl(mc, reg_val, mask, mc->shift, max, sx);
 		}
 
 		ucontrol->value.integer.value[1] = val;
-- 
2.47.3

