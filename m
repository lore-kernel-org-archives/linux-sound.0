Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A7A442135
	for <linux-sound@vger.kernel.org>; Mon,  7 Sep 2026 08:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770314; cv=none; b=H/ovEKk+/PptuyDugBJI+6RTbeVtPmh71TEnOhsCT0ahtZ7lFD6QV9Y6RVmAD5/TeLFLv/or5HxraIPN7j0N8fVE80fR9RFv/s9ggqPvmn4OiTowKsM24VBLVGaW+fesaJTxwH+WUmaDLRsVC3qgCgISHkT3VmtT9PW399bgaNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770314; c=relaxed/simple;
	bh=hYnwdQoH/bPKBbKKe6pzgkii5DIS6eF65mX2d7m8Pn4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CIvDsjq4bAUgRsAefVuNlbBk+MFBU+3RoCbcZggeUQu3BqIzCZ7okOeOwUuemBhLzHRKFOdZ31TF4g/ngZUZZpunzVNJ9VCrQ8Cx95OxBC9N1A/a7gnuJ4gZP3rzW1i7OtTWdpmtl19MlKc573/ewlHPdsvJet9ikwMkRLDjcqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YJaFVAwf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TW/8Zkv/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YJaFVAwf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TW/8Zkv/"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6877NN3v333062
	for <linux-sound@vger.kernel.org>; Mon, 7 Sep 2026 08:38:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FRAWMnzsW7M
	9ElavvxzLzIlh2SlMssELpYGgo7kMgYA=; b=YJaFVAwfheazDOQj94HV+W5cbz/
	OpsQwKD0SX28kIAeSu2lc1PtYTGGrlY5AtVA0DjV4EfamJXH3ae3/KOsg/Jx7GFB
	pAbS6lkaU/q5vQ4C1My6m75zAhulBeHE/pU4fkulL5Co15534C1i0iQKLx5NpMhg
	wVdiB0Gj+EGttG4bzKkjs1db2lvOi5/krb70Qq+PcHognSsqsowxF+av/xBAfPQJ
	iSF/At5DhOqGi2yyHtsxeEzZQ67jQz+cq0nCerjbsCA3UGsLPfX/TRGUIf/imKpR
	2FqoDd5KHRosQF7T2Vf60CUwmp66O3nTXsXXlfu1m5Cvb24dadvyGx90PXg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghrua8eeq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 07 Sep 2026 08:38:31 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e82060977so535367385a.1
        for <linux-sound@vger.kernel.org>; Mon, 07 Sep 2026 01:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788770310; x=1789375110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FRAWMnzsW7M9ElavvxzLzIlh2SlMssELpYGgo7kMgYA=;
        b=TW/8Zkv/jQhdLvvlYndemCqNuwcgi1BRDdf6BP/HlJ1Be2u3n3N7pc1snD5YWtHSCn
         U2j3h18eciSrSQci1WPJKgbtiXsumP95gA3Nk2d4zxzs/ql4rRR7CIufSEaWP1cxaNlo
         9P3LwwpdaeparEvMBvVAz+vb3/TKY9KBTDVrW9rxLAk0qUxOFSZdbRR7pDbUh8LznpAl
         fiFA+8Ah43jBtt+Of+fpH+/L8weaNaaCjKhFJzmljOvEuirGdUvQM+zHuTR+CKXV0TXp
         31tqJC0iOiv9T7aswjjTUMumXh7+5yYemmB711M/IjJF6oys3sImKubUHwIUZ9UMlhi7
         +F/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788770310; x=1789375110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FRAWMnzsW7M9ElavvxzLzIlh2SlMssELpYGgo7kMgYA=;
        b=UFsb4PYe9Zom8125nCGT84mlc3CHGFYzw+iW7aDXzO7nHunPnannen+Pz+vDsy9PYY
         hdqJqJb8TOq4IUg8aDeiifMORQ4cqVzk7YWwG2DKh2SNhf2LzeVt1JTQhQ/m8lvPyhDI
         bcqrLfA2KYy4wtfJi0LIYEnHId+OmojIEQX2gmf2/VYbaT2GhC5mfXQuNXQ+vEZjVoKC
         KK0wNSyNfhHhOTq1kHVYAH1HMDBgzS2WCb2wkhZBKO1X3XsXD9mVB6hft4qirjOgbJYA
         dX9xu/4V0NL1ML3A+FuZn0r4inITLAUMc4WpFWCa3bJQmatL/myMCjA/eNafivfp3asP
         upWQ==
X-Forwarded-Encrypted: i=1; AKwUvBzVZocBin6YVuDehDxF92VY3X7qUm6Px2cI2HA2NouTnG4oiL5lcapUiODWHUqG1QMsNCcdamwZj94MEg==@vger.kernel.org
X-Gm-Message-State: AFuF++l9nIlh/tQhbdFB3Ji97cUiGDyszCLwUBZ8yRuK5NFS3KPD/PeB
	KKkXl+v8k/LtQt5rJevPMlK/YlR+nYA1grcwefS3i38NdoHhsple/lWfPG0249U10Zw7oEkXv/c
	fMnmemYIIKpNy2Y3/g97BXCeWSRw3+LH0VmishD08Sih2tWMKrmDMGOwKkJ/Mi3mgzQ==
X-Gm-Gg: AYBFou16ZkqbPxlqcJ0Sieh/vPFILx+JEdnCnbzGDhrrOnYy/Rm99kcGbthrM3BWoaG
	m3mOkRLvqsumrIl9MWFhzShgio/3QOwC4I5WUXmRoFD5ZzYTRnOMJQcpFMG8EZLhbfO5VsU2Xge
	it4cHtEnYyJ/yLZXwL6aT8yaJqw78wccfNXTcHDOK+71Gfg5m1wkyizNzby7OkTR5MtpAQdDj+8
	YqwwpKl0y3WwfCBPXsXenCMSrU09gMZO98TQd9LDeE88VMTJCnPG/CXsc3JB0jdtq9OXnon6N9/
	DPSm4n0utVZImuhtl/SoCRMdrbtlqpIGC/EktlU6FykV9zEwRHJnkTMUt21T2iNZH1VqSYGk2AD
	hHi7UbhEhVZCCHg==
X-Received: by 2002:a05:620a:4106:b0:939:72cb:baf1 with SMTP id af79cd13be357-93972cbbcfbmr1935132585a.40.1788770309958;
        Mon, 07 Sep 2026 01:38:29 -0700 (PDT)
X-Received: by 2002:a05:620a:4106:b0:939:72cb:baf1 with SMTP id af79cd13be357-93972cbbcfbmr1935129685a.40.1788770309534;
        Mon, 07 Sep 2026 01:38:29 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm30852179f8f.25.2026.09.07.01.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:38:28 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Takashi Iwai <tiwai@suse.com>,
        Faiz Nabi Kuchay <fkuchay@oss.qualcomm.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 02/11] ASoC: SDCA: export PM helpers keyed on sdca_class_drv
Date: Mon,  7 Sep 2026 09:37:16 +0100
Message-ID: <20260907083727.733705-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: yVbqIrjWWnBZ7M2NBRT8wPAfP2E3mwfo
X-Authority-Analysis: v=2.4 cv=U+aiy+ru c=1 sm=1 tr=0 ts=6a9e7807 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=3PQulrMEHypX3zRcvmEA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: yVbqIrjWWnBZ7M2NBRT8wPAfP2E3mwfo
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA5MyBTYWx0ZWRfX3b3OklWN4I9T
 FsZYhAcwHpF4xW4p4VZoAoYApv/rEhtKf9/d3nGOUb2hx0q/hhC66taFImRLfVwEyjehkpuhetr
 t6Ep5OJ3eXtz7tYjNgEpHiaXitfIVOo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA5MyBTYWx0ZWRfX5+hqJr45ldYD
 LbZA+vNYesXeL2aZL26D5hx70V6IcCfUDFb1tI57+W3AHpbOaj8MoiHW+1jMsQbF8SUUGD2tYiY
 SFZZnh8HwbmioNYSfrgjB2jtwPW2jInhaIWmMMW1lPlHVJQkx7N7zdfMi/SQMCAfkFstr3OV0FV
 EeH6QenslOdHI7GB880fOiDSFvjrf3+zbq6s8dIZr/5xMKHR0Cb/fL6D+mZM+h15gNjzPDqbubw
 N+iCGIUyB24wdN5X3HQ9ovM/UIziJWvl8LICQrWns+s7zCNEZFkgCocZjrZyGIzzAqAcn4+iNro
 +cDxYAxJrYGq835SRUx9ab5sxmsJe0QhIrd6lTZxvE3doi7nYz4Aq1H5slNXsYdB63jiE9oEH/A
 N20qRDn3BJqupoMptr68HwgfOcjnBc/gBztAgKCvcuZj1EGp3G7bfXTNW9ar1a+yFmVkrojv9QN
 UVwkQRz7qKexMR3x45Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070093

The class PM callbacks pull sdca_class_drv out of drvdata, so the
built-in class_sdw_driver owns the drvdata slot.  That works for the
generic case but blocks codec drivers that want to embed
sdca_class_drv in their own private struct -- they need drvdata for
their codec priv.

Split the four callbacks into exported helpers that take a
struct sdca_class_drv * directly:

  sdca_class_system_suspend()
  sdca_class_system_resume()
  sdca_class_runtime_suspend()
  sdca_class_runtime_resume()

Codec drivers can now compose these into their own dev_pm_ops without
going through drvdata.

For the built-in class_sdw_driver, add small dev_pm_ops wrappers that
fetch drv from drvdata, wire them into sdca_class_pm_ops, and export
the ops so any generic SDCA slave can pick them up as-is.

No functional change: the built-in class_sdw_driver keeps the same PM
semantics; only the internal plumbing shifts to operate on
sdca_class_drv instead of struct device *dev.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../soc/sdca => include/sound}/sdca_class.h   | 19 +++++
 sound/soc/sdca/sdca_class.c                   | 82 +++++++++++++++----
 sound/soc/sdca/sdca_class_function.c          |  2 +-
 3 files changed, 84 insertions(+), 19 deletions(-)
 rename {sound/soc/sdca => include/sound}/sdca_class.h (50%)

diff --git a/sound/soc/sdca/sdca_class.h b/include/sound/sdca_class.h
similarity index 50%
rename from sound/soc/sdca/sdca_class.h
rename to include/sound/sdca_class.h
index 57f7f8d08f49..15a180385202 100644
--- a/sound/soc/sdca/sdca_class.h
+++ b/include/sound/sdca_class.h
@@ -15,6 +15,7 @@
 #include <linux/workqueue.h>
 
 struct device;
+struct dev_pm_ops;
 struct regmap;
 struct sdw_slave;
 struct sdca_function_data;
@@ -32,4 +33,22 @@ struct sdca_class_drv {
 	struct work_struct boot_work;
 };
 
+/*
+ * PM helpers.  Codec drivers embed sdca_class_drv in their own priv,
+ * own dev_set_drvdata(), and compose these into their own dev_pm_ops:
+ *
+ *	static int wcd_runtime_suspend(struct device *dev) {
+ *		struct wcd_priv *priv = dev_get_drvdata(dev);
+ *		return sdca_class_runtime_suspend(&priv->class);
+ *	}
+ *
+ * The built-in class_sdw_driver in sdca_class.c uses sdca_class_pm_ops
+ * directly because it stashes the sdca_class_drv in drvdata itself.
+ */
+int sdca_class_runtime_suspend(struct sdca_class_drv *drv);
+int sdca_class_runtime_resume(struct sdca_class_drv *drv);
+int sdca_class_system_suspend(struct sdca_class_drv *drv);
+int sdca_class_system_resume(struct sdca_class_drv *drv);
+extern const struct dev_pm_ops sdca_class_pm_ops;
+
 #endif /* __SDCA_CLASS_H__ */
diff --git a/sound/soc/sdca/sdca_class.c b/sound/soc/sdca/sdca_class.c
index d7444f442c71..88a29116a334 100644
--- a/sound/soc/sdca/sdca_class.c
+++ b/sound/soc/sdca/sdca_class.c
@@ -20,7 +20,7 @@
 #include <sound/sdca_function.h>
 #include <sound/sdca_interrupts.h>
 #include <sound/sdca_regmap.h>
-#include "sdca_class.h"
+#include <sound/sdca_class.h>
 
 #define CLASS_SDW_ATTACH_TIMEOUT_MS	5000
 
@@ -194,30 +194,41 @@ static void class_sdw_remove(struct sdw_slave *sdw)
 	cancel_work_sync(&drv->boot_work);
 }
 
-static int class_suspend(struct device *dev)
+/**
+ * sdca_class_system_suspend - SDCA class system suspend helper
+ * @drv: caller-owned sdca_class_drv.
+ *
+ * Codec drivers compose this into their own dev_pm_ops.  Disables the
+ * SoundWire interrupt and forces runtime suspend of the underlying
+ * class regmap.
+ */
+int sdca_class_system_suspend(struct sdca_class_drv *drv)
 {
-	struct sdca_class_drv *drv = dev_get_drvdata(dev);
 	int ret;
 
 	disable_irq(drv->sdw->irq);
 
-	ret = pm_runtime_force_suspend(dev);
+	ret = pm_runtime_force_suspend(drv->dev);
 	if (ret) {
-		dev_err(dev, "failed to force suspend: %d\n", ret);
+		dev_err(drv->dev, "failed to force suspend: %d\n", ret);
 		return ret;
 	}
 
 	return 0;
 }
+EXPORT_SYMBOL_NS_GPL(sdca_class_system_suspend, "SND_SOC_SDCA_CLASS");
 
-static int class_resume(struct device *dev)
+/**
+ * sdca_class_system_resume - SDCA class system resume helper
+ * @drv: caller-owned sdca_class_drv.
+ */
+int sdca_class_system_resume(struct sdca_class_drv *drv)
 {
-	struct sdca_class_drv *drv = dev_get_drvdata(dev);
 	int ret;
 
-	ret = pm_runtime_force_resume(dev);
+	ret = pm_runtime_force_resume(drv->dev);
 	if (ret) {
-		dev_err(dev, "failed to force resume: %d\n", ret);
+		dev_err(drv->dev, "failed to force resume: %d\n", ret);
 		return ret;
 	}
 
@@ -225,11 +236,14 @@ static int class_resume(struct device *dev)
 
 	return 0;
 }
+EXPORT_SYMBOL_NS_GPL(sdca_class_system_resume, "SND_SOC_SDCA_CLASS");
 
-static int class_runtime_suspend(struct device *dev)
+/**
+ * sdca_class_runtime_suspend - SDCA class runtime suspend helper
+ * @drv: caller-owned sdca_class_drv.
+ */
+int sdca_class_runtime_suspend(struct sdca_class_drv *drv)
 {
-	struct sdca_class_drv *drv = dev_get_drvdata(dev);
-
 	/*
 	 * Whilst the driver doesn't power the chip down here, going into runtime
 	 * suspend lets the SoundWire bus power down, which means the driver
@@ -239,10 +253,14 @@ static int class_runtime_suspend(struct device *dev)
 
 	return 0;
 }
+EXPORT_SYMBOL_NS_GPL(sdca_class_runtime_suspend, "SND_SOC_SDCA_CLASS");
 
-static int class_runtime_resume(struct device *dev)
+/**
+ * sdca_class_runtime_resume - SDCA class runtime resume helper
+ * @drv: caller-owned sdca_class_drv.
+ */
+int sdca_class_runtime_resume(struct sdca_class_drv *drv)
 {
-	struct sdca_class_drv *drv = dev_get_drvdata(dev);
 	int ret;
 
 	ret = sdw_slave_wait_for_init(drv->sdw, CLASS_SDW_ATTACH_TIMEOUT_MS);
@@ -265,11 +283,39 @@ static int class_runtime_resume(struct device *dev)
 
 	return ret;
 }
+EXPORT_SYMBOL_NS_GPL(sdca_class_runtime_resume, "SND_SOC_SDCA_CLASS");
+
+/*
+ * Convenience dev_pm_ops used by the built-in class_sdw_driver, which
+ * stashes its sdca_class_drv in drvdata directly.  Codec drivers that
+ * embed sdca_class_drv in their own priv compose their own dev_pm_ops
+ * using the sdca_class_*_suspend/resume helpers above.
+ */
+static int class_pm_system_suspend(struct device *dev)
+{
+	return sdca_class_system_suspend(dev_get_drvdata(dev));
+}
+
+static int class_pm_system_resume(struct device *dev)
+{
+	return sdca_class_system_resume(dev_get_drvdata(dev));
+}
+
+static int class_pm_runtime_suspend(struct device *dev)
+{
+	return sdca_class_runtime_suspend(dev_get_drvdata(dev));
+}
+
+static int class_pm_runtime_resume(struct device *dev)
+{
+	return sdca_class_runtime_resume(dev_get_drvdata(dev));
+}
 
-static const struct dev_pm_ops class_pm_ops = {
-	SYSTEM_SLEEP_PM_OPS(class_suspend, class_resume)
-	RUNTIME_PM_OPS(class_runtime_suspend, class_runtime_resume, NULL)
+const struct dev_pm_ops sdca_class_pm_ops = {
+	SYSTEM_SLEEP_PM_OPS(class_pm_system_suspend, class_pm_system_resume)
+	RUNTIME_PM_OPS(class_pm_runtime_suspend, class_pm_runtime_resume, NULL)
 };
+EXPORT_SYMBOL_NS_GPL(sdca_class_pm_ops, "SND_SOC_SDCA_CLASS");
 
 static const struct sdw_device_id class_sdw_id[] = {
 	SDW_SLAVE_ENTRY(0x01FA, 0x4245, 0),
@@ -282,7 +328,7 @@ MODULE_DEVICE_TABLE(sdw, class_sdw_id);
 static struct sdw_driver class_sdw_driver = {
 	.driver = {
 		.name		= "sdca_class",
-		.pm		= pm_ptr(&class_pm_ops),
+		.pm		= pm_ptr(&sdca_class_pm_ops),
 	},
 
 	.probe		= class_sdw_probe,
diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_class_function.c
index cc7045dc26e6..10a2b031b572 100644
--- a/sound/soc/sdca/sdca_class_function.c
+++ b/sound/soc/sdca/sdca_class_function.c
@@ -26,7 +26,7 @@
 #include <sound/soc-component.h>
 #include <sound/soc-dai.h>
 #include <sound/soc.h>
-#include "sdca_class.h"
+#include <sound/sdca_class.h>
 #include "sdca_function_device.h"
 
 struct class_function_drv {
-- 
2.53.0

