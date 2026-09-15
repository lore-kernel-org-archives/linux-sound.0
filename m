Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B944BA1D2
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 16:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789491442; cv=none; b=VDikRAhyYgClAnRsz/GHI7G6RqPBxmQgnwPYLUx+4EFMikaEJV2SqCykLmU0sLtAGCUTWiCkLCROTZmsiUngcQE/skc6Q0I3oKzyOetM684YfZ4zfmpBCy4uwXA5G4BWeGi9KKISR04hLFLHFPZid6igLvU5MLv07SRQZQ7iNuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789491442; c=relaxed/simple;
	bh=YC5jeRdrV0bVaeAY8A16IgiStDL4XyHSM0tG/acNG/E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oLQQ9at/NuYgc3g9dlzifztK3UJWqmxahHmkq+aFnmizpJb+pVsxBup+RhV6z1mTV0OzCvhmWaSOZvsCYvscuYpuMUktQue5R4JmcsyE4mdcPFK6uTsrbNtFTl8PLvNPm9ziVGlfQ9aSO/B5lOnzrJMchV0zMzg4UyTd1RzdLvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UFa/l6Ef; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WerAeHsM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UFa/l6Ef";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WerAeHsM"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FFAflp2836598
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 16:57:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IKUPurXyGjX
	q2dDSy5YrqbSiwRoZ8osae4bp8uljdHc=; b=UFa/l6Efa8gd5wsCEmc4zF6cz9i
	Wmn4icxVAIL2zCFuk0TJiArnAFGsh5risvSaPddWEE7QQTKy6neOzPmfSlo1DdU6
	R8Qn3cIuBBAatdC4NwRiA5fcd2nj3EhEZMwl904mf/SFJD0D39hetapiirCfkIpB
	9paHMRtjD9l8dJ9yJuKlxwzBpeAnANwkNikHu3mAf2/E2v9qdcr6pZ2w6rwKnczO
	MiP7TgHrVn+YRRdUPHKzwmWgVi/AWFjhdnw12chCBtOEzEYhbimggUvhuq+4Vvyh
	Z8Zrfh/F5dNndnovPGzKJzwB0JPkGDc3e+AusN+sxePMSsINmMr95S3Qz3Q==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq1qpb49m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 16:57:17 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-79014f0b44cso4174100137.3
        for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 09:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789491436; x=1790096236; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IKUPurXyGjXq2dDSy5YrqbSiwRoZ8osae4bp8uljdHc=;
        b=WerAeHsMPSfCBmy+bosqP7uLRj0jxHcjB97/tvLeQGgWWaeK7JfY0akQ+Gx+4i8Zr3
         yb3f0m3gZtzsBu4JmRKML9bc9kV/3pLxZCMEsPUjOwsAkof8qPc9duYWszUn5/p/zna6
         e3BcSomF5zu1k0IL2Ei4j1UemJ2+qPUhHaQcLYml+zIT/qfC/zAjTxBDLRicYQUOpRD3
         h6Z22hV94VdN4eoI0zBQvLciI4Ve1Nc9/ikOVRE1egZtgY/7ZgG4gk02PZnS92CFv6ld
         QbQPFMZXvj9cNyZd793P5Wox0K00uoHUtqIrW2WdkynQ4KOd1c6I4KPbqfwT8ulsmFii
         HLuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789491436; x=1790096236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IKUPurXyGjXq2dDSy5YrqbSiwRoZ8osae4bp8uljdHc=;
        b=QmuNhEx+6KSrWNkluCKqOc62PxZbHymNNKT1KqFY5Ho7ploeAzPbF73/UasEU5sijt
         rg++ydJCsBJM2CZ7Wjyp4g00/nE210hGFmMxuEZ1+GnVqWEJBCzXIz5uYcpoY+FcQVrV
         sEQA44SujR+HMM/H5iBrRxqhCZjVh1FqDGyT3ymCrgoMBZYC5Fyoapg4kPqp1p3j7Unv
         XCF4bM5bI/0mrMc5BOFLSlQYVb79kyON5o0MkyITpPCj26JMBXsLHfORHUjvWgaYbf1j
         Yx4gWm0X3Cz3U0mVDLVknmDaHFLuyV7tRf34SiZ8p2hS6Ke4SeB8oX01ym0gCi53pdTy
         dkWA==
X-Forwarded-Encrypted: i=1; AKwUvBy5XplO/zAcna9EEszoOBtRJb8coO0xVxpKif05/5kTLZp+22FeewAq9jeb3fcZKfSNV+QsNHM3FvWxLg==@vger.kernel.org
X-Gm-Message-State: AFuF++m9g0QgphgthaBXXy+55JIBoygQyMWpTaXfG3a1RHezQ6zjJoY8
	S1f6Vq1GuP5K0jtLP4pfycrgReWI9EhH5JY29w7ug9MF7JgwclO6uL5ukpM7tDcV9IYHDruNc3B
	e8fqbx1fyCHEmGHiypZOCnnYzUFRqVA9BR+hbw23TqIBfdcRrcs2ioi71JXTfOWvxdQ==
X-Gm-Gg: AYBFou3mW0xI3oa3hBEWiLZp3032/cs/GtO3kqZlfO11jHbCeCtGIdqLDf89cnIpoZf
	S5SPKIT/yqVP6DG1eKYR1Wdu4Hb5Lf+rIkC1jnOtuZio+DMYw6Yi31pLXDoGNG0H4e/pyPVxX+5
	ie6jmC4r5HeIqKA4iPW86utOzSVdCZCxueRbs3jBpQcQ/yyws9PrSfdGdESMGLu4MDFlBzkPGs4
	bDlJma5eqSmR6r/bOacV4XSGgLBHfkRT+GV/CL29987eLofUWzDaPnYamg0CA+EK/uz8mqYy6or
	vCeSZrBiIQMMypNETtsRmP3hYDlo81vgHW8JPJ0D4xgJ2pDwDVQJvxgEymls80er9NQSwezUtYO
	L5pi7Fle5wZaA8A==
X-Received: by 2002:a05:6102:2921:b0:79b:1b6c:4f66 with SMTP id ada2fe7eead31-79ed34ac6c5mr3719708137.1.1789491436027;
        Tue, 15 Sep 2026 09:57:16 -0700 (PDT)
X-Received: by 2002:a05:6102:2921:b0:79b:1b6c:4f66 with SMTP id ada2fe7eead31-79ed34ac6c5mr3719613137.1.1789491435551;
        Tue, 15 Sep 2026 09:57:15 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83d9057dsm4361335e9.3.2026.09.15.09.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 09:57:14 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, patches@opensource.cirrus.com,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 2/8] ASoC: SDCA: export PM helpers keyed on sdca_class_drv
Date: Tue, 15 Sep 2026 17:56:44 +0100
Message-ID: <20260915165652.914893-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915165652.914893-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260915165652.914893-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDI0NyBTYWx0ZWRfX4HFSLuQFiJ1S
 Gs3orkczEV0hHVvLbe86AAtFKVKpn3ODj1KO4t9rzddys3v2wj1EHnl6D5rT6CBVIOFbp4lJ/+R
 yt0mhn2Fb0veZQJFRKenSkdYJ/Mgj38=
X-Authority-Analysis: v=2.4 cv=I4Xw19gg c=1 sm=1 tr=0 ts=6aa978ed cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=3PQulrMEHypX3zRcvmEA:9 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: M5d52EDhDvJzL8NgqeYYOxY0RZLfBycO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDI0NyBTYWx0ZWRfX3tbQ5dy/Nkrv
 Wd3c9ip3+zpW0sQDQ/V0Z6z1SsC8c77lfpDVFfu2LTCiurZP9rRwfw80VlD8Lk1VARVoa49dUZr
 NmkECU5x6M0lqhaerHsjX4GF70Ge9+aRTX/5eNwaRheV2dflpfTatcvorTAzQ3NAl+ftvFnHZvH
 yET/Fc3zdH3dWK3hQcjtX4Jlt/tbmpzRREupHlo3APpg0dbWy3T2Q0wgdSBNA9j3MP+0W6cg3rK
 /W+AhX7ry3de1dNzqQDXBJ9VgIIFDJpVWcyr3ntCFDV7wu6E625vIck4qpDY1pVRwPjHmoEVjgC
 dGbwhNfCS8DKSuBjuOUzW0ZQcJ0J07ZcTGx37k62kKVgdZ62DySyI5+WueQJ92QUxT4/UlarXO2
 WIupqCbnagkrTLmkEtafA1YRKGBUeGF2RY5h3lk2tLWT1MVPbNMR9RxbPxPthYHsTlipcn/tYtW
 5TJ5+sUJ4lBKfihkn+g==
X-Proofpoint-GUID: M5d52EDhDvJzL8NgqeYYOxY0RZLfBycO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150247

The class PM callbacks pull sdca_class_drv out of drvdata, so the
built-in class_sdw_driver owns the drvdata slot. That works for the
generic case but blocks codec drivers that want to embed
sdca_class_drv in their own private struct, they need drvdata for
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
fetch drv from drvdata and wire them into sdca_class_pm_ops (kept
static; the built-in slave is the only user).

No functional change: the built-in class_sdw_driver keeps the same PM
semantics; only the internal plumbing shifts to operate on
sdca_class_drv instead of struct device *dev.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../soc/sdca => include/sound}/sdca_class.h   | 15 ++++
 sound/soc/sdca/sdca_class.c                   | 81 ++++++++++++++-----
 sound/soc/sdca/sdca_class_function.c          |  2 +-
 3 files changed, 79 insertions(+), 19 deletions(-)
 rename {sound/soc/sdca => include/sound}/sdca_class.h (57%)

diff --git a/sound/soc/sdca/sdca_class.h b/include/sound/sdca_class.h
similarity index 57%
rename from sound/soc/sdca/sdca_class.h
rename to include/sound/sdca_class.h
index 57f7f8d08f49..ce2ed5f33e7a 100644
--- a/sound/soc/sdca/sdca_class.h
+++ b/include/sound/sdca_class.h
@@ -15,6 +15,7 @@
 #include <linux/workqueue.h>
 
 struct device;
+struct dev_pm_ops;
 struct regmap;
 struct sdw_slave;
 struct sdca_function_data;
@@ -32,4 +33,18 @@ struct sdca_class_drv {
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
+ */
+int sdca_class_runtime_suspend(struct sdca_class_drv *drv);
+int sdca_class_runtime_resume(struct sdca_class_drv *drv);
+int sdca_class_system_suspend(struct sdca_class_drv *drv);
+int sdca_class_system_resume(struct sdca_class_drv *drv);
+
 #endif /* __SDCA_CLASS_H__ */
diff --git a/sound/soc/sdca/sdca_class.c b/sound/soc/sdca/sdca_class.c
index d7444f442c71..a092ebaa620a 100644
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
@@ -265,10 +283,37 @@ static int class_runtime_resume(struct device *dev)
 
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
+static const struct dev_pm_ops sdca_class_pm_ops = {
+	SYSTEM_SLEEP_PM_OPS(class_pm_system_suspend, class_pm_system_resume)
+	RUNTIME_PM_OPS(class_pm_runtime_suspend, class_pm_runtime_resume, NULL)
 };
 
 static const struct sdw_device_id class_sdw_id[] = {
@@ -282,7 +327,7 @@ MODULE_DEVICE_TABLE(sdw, class_sdw_id);
 static struct sdw_driver class_sdw_driver = {
 	.driver = {
 		.name		= "sdca_class",
-		.pm		= pm_ptr(&class_pm_ops),
+		.pm		= pm_ptr(&sdca_class_pm_ops),
 	},
 
 	.probe		= class_sdw_probe,
diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_class_function.c
index 1d7fd6603882..411e3d717bb6 100644
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

