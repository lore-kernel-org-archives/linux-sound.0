Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679E44BA1C8
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 16:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789491453; cv=none; b=Aumur+afwiLX9xkOUEKTwxH4xYeyjiZ/cbrg4DPpSdN80xuD/uoMYrgbe9cvw8hJXl7ydM3uoVe85pSJsBQf2SlztZx5eEEmtn7bPYf2PjB+MAGf6wSYNYYkq+fpIjexpjtP+ueQWqUImwlsH96O3DVnXRq1yTePo+Q/KlPA0aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789491453; c=relaxed/simple;
	bh=sTtAcC6DTgTsyia/QnLhKcG49gomKemayk5z0N7ppgc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h2XTuKs+CKlB4Y9PtFzuujDzJ6L5s1KIhYsHdf0zgSEnsy6RPNGQ4FJePVitEdq6a283MFpPLkOegSK/lCLGYtt9E4wPH05gpOUMEPJIJXoDjZlQ+gX1fweq2LCGIQfv/NvGn04IG7gzXWIl2KQ65Dz2kdCWAW4n0g67OqnQiyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kf4ZLvAM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=REzVRAXT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kf4ZLvAM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="REzVRAXT"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FFAYvF3958803
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 16:57:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xB2gDVEaK5Q
	aG7cBbuSlX5M4RqhKQThd1pOV5mauDU4=; b=kf4ZLvAMFX2gazjCvXoux6fxHn5
	jeLEGwxEtZC2q6dAKbIZ0VNOgpzwehzXucmRvXFZtstTT7acIIiFDI9eUbyr4F6I
	xy5IMJ88V0esrL+kowjejST0c/5JPECIeIu+V9kWwCDz1wE5+cU9ymLSkzsDs0rd
	Mqx2BPSxHG+KkjqAmsYGhgl22NIfp58U2X+XDX8EIGI0jR0MELpe4iYYrnH82/Bt
	MwQw3BBPVqImDOIoodlWh9FaQpbyJ0rtQ99yHmOnYXTFEaN1MP0rnXjUdxGyu538
	k9vOGVMDVQmPX0q4i9s+bfrPth+7UbQ/PwpszIN/jGEm/iTU9fB05u4J7Sg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq2y2j6vc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 16:57:20 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9394ad7f64aso773873585a.3
        for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 09:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789491439; x=1790096239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xB2gDVEaK5QaG7cBbuSlX5M4RqhKQThd1pOV5mauDU4=;
        b=REzVRAXTXeeAU/RcldNqbcQp9qcxFwxs6yd0gkbR++FQlHV6sc5vPSfCqoySkBx8s3
         pKoSn3+9AUL+NO1HZ29IXu3mIJRsAxOfWXsFgyDiG+Z29vv+6xi3XNtmEPDle9P4ZLiz
         JJu7BG5dRdIe+cYJfyCkwkZFu/X2cDjjGhRAzrMn/ahz2AF9dU/L53UQyzoG38dI+aOp
         tIte5Z8q9rb64XftB62rdzKVUbF108NYmBPMLCeBQpEyp/719rOMFu2uizdDXgELBAnv
         kdUZwAenSeSgRO9WHiKBnSRk7KzS2f5cFB7Sc4DfcjJovbYK+9X5M9iMRqBXwad3sgC1
         B/Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789491439; x=1790096239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xB2gDVEaK5QaG7cBbuSlX5M4RqhKQThd1pOV5mauDU4=;
        b=f0JfFy5HjMTn6S6Swllebnp33FxKvct8GBUe92YRmdiFHhfyKCbK068FjZM0HP+otu
         /d0MJzZu6jGG+8CYgrbGt8zSHwEbUNdy6HzCI9nGFHZWP2/vO79mINsVU+8fUPB8stX6
         sd3dulPAm6YhtlXemN6BvetXPtU29KZZDmCgXXxz1P4uAlnli02IUcoeU9X3QQ2NF+qP
         hrtbHTax9fZnU2JOfgfAIMmhbPP5lBCR4tF/aOXYWHoO67TqvSzyzNDj3c3FHaHCaiWW
         2GMs9bSRRVl2R1sYVLsjsvoORrJgFtyskSNLI2bB6wC1CllweQNUvX9YQsYdWNYDmRga
         C/Xw==
X-Forwarded-Encrypted: i=1; AKwUvBxfrZZuA/8phHzUC/DSRtvhF4+jBfRyiyVSGACs0ZOjus5GOnLzkomdevc9Toh0cjghSJYH9HhHVVf4DQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lDniaYfOj+oVQeZbFS7ztW44G6yNxP3PEopfMYHBc5ZHZAC5U1
	+Nakp00SeuV7h8OCCQqejIKLUhpIwqdu4zpLHC0r9KYjYHbg6o9ah2sZs63Cu16dMJxc7m7ERGS
	gJUoRK12fw7fRRv8EO6Vzfgw3XZsTiPQHK/DvK/Iq8KR3IoRFA2PG+l6R0tO6SGAPsw==
X-Gm-Gg: AYBFou1XwZ5amJUV/yLJIOSEwJsMpq+keSmSYOEBuCnc4nfL26FB8DVucGqRv5Gj9Is
	Hwg5Gv/4fe3sXbGznJQLcWFZ/JzgmrMbSxDU50BenHZOEetGZf8oZb2ud+ApQtklQh+Q8LJ1DxP
	snn9r3ZQLq/PUupWEfx2lYO6/1u4tjvravg8xpldM8nOGNvMVFiqa509IunYx7rW7L5YuCms3U6
	uM992XFyq5pLHqju/ykab7o21m/2gVP6f8o9oSTkArOIi/qdSmmNEkY3zPB2CgMivgZmmPS7GRF
	5piv103sn8+SqrWb7G1eYo9MZh6QFODb51K2LVIRYDc1XRlX04tfYz4BaUIh/RtKipGi/JYTu45
	QvdciYLDP47DTgw==
X-Received: by 2002:a05:620a:1b87:b0:92e:76a1:96cd with SMTP id af79cd13be357-93a297e8f8cmr1355598285a.13.1789491439195;
        Tue, 15 Sep 2026 09:57:19 -0700 (PDT)
X-Received: by 2002:a05:620a:1b87:b0:92e:76a1:96cd with SMTP id af79cd13be357-93a297e8f8cmr1355589785a.13.1789491438612;
        Tue, 15 Sep 2026 09:57:18 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83d9057dsm4361335e9.3.2026.09.15.09.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 09:57:17 -0700 (PDT)
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
Subject: [PATCH v3 4/8] ASoC: SDCA: add class_ops with populate_function
Date: Tue, 15 Sep 2026 17:56:46 +0100
Message-ID: <20260915165652.914893-5-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: PlS-Gf1xErCDN6VdhhMQNdtbp9rm82rK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDI0NyBTYWx0ZWRfX+ObhdPVszFJ9
 K/FZdxDSKV4GN9EwFjdkonmDRurCyQ5YWqYkoZDWCho0tqChaMkCAPDdjrtjlTgyZaex5zc/v0h
 SGoWQ8YKwRZZVhUWH/TGDOgyD9lqm6+5ZJ+qB4oQqMp5AFLLYL+whKoONY1WdAjJzvg3n4hw4/I
 Q1brzl/UwKUhxSfUk75aumPmXGdwZYKSxzkFZe71xAj9A215QwmHtOoktB0AYPoy0JIFRSDup0I
 m9VVM7RU37XRLepJBUGOj+6897o1XJRgOgPjpOLfgrRUy+yEYWX01jQOneYjFKUYKhiXCN5T/7C
 jrrLGegqxMj8iS8h1nXaVLXLcOVZV5dTGLTqqe3cuVfJqn8+6fGEx5DlnXSGGUfwxcVO/k4mYwK
 yE4hfQuW3PyUElT2Krje030jADACEOmKb3LWMwWKHTv+IfY91Xh3lK9MBAJKqsfaM/HBys1Bgw0
 cj4o7qfTVKlXA+7BNKQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDI0NyBTYWx0ZWRfX6j/CrRQu892u
 5D7js/QK+WfsrT8z2KR401I/m7G8QlHNdzJMey86UPSq1D8xXAWrDsvEsMJQN7NyNHNRWE8+5VX
 yBajfz0zr0lcKna4ZS0HiCLPBLvzlN0=
X-Proofpoint-GUID: PlS-Gf1xErCDN6VdhhMQNdtbp9rm82rK
X-Authority-Analysis: v=2.4 cv=IcISymqa c=1 sm=1 tr=0 ts=6aa978f0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=RDHKc21CrRhZfFRGvR4A:9 a=O8hF6Hzn-FEA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150247

Add struct sdca_class_ops with a populate_function callback that lets
codec drivers supply the SDCA topology (entities, clusters,
init_table, ...) from static tables in place of sdca_parse_function()
on DT/non-DisCo platforms. The callback is a pure data source and
performs no bus I/O.

Codec drivers embed sdca_class_drv in their own priv and register
their populate_function through class_ops passed to
sdca_class_probe().

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 include/sound/sdca_class.h           | 18 +++++++++++++++++-
 sound/soc/sdca/sdca_class.c          |  9 +++++++--
 sound/soc/sdca/sdca_class_function.c |  9 ++++++++-
 3 files changed, 32 insertions(+), 4 deletions(-)

diff --git a/include/sound/sdca_class.h b/include/sound/sdca_class.h
index 9e6b0eab8a0e..90af5b914ba3 100644
--- a/include/sound/sdca_class.h
+++ b/include/sound/sdca_class.h
@@ -20,6 +20,18 @@ struct regmap;
 struct sdw_slave;
 struct sdca_function_data;
 
+/**
+ * struct sdca_class_ops - optional codec-provided class callbacks
+ * @populate_function: fill @function (entities, clusters, init_table, ...)
+ *           from static tables in place of sdca_parse_function() on
+ *           DT/non-DisCo platforms.  Pure data source; performs no
+ *           bus I/O.  Return 0 on success or a negative errno.
+ */
+struct sdca_class_ops {
+	int (*populate_function)(struct sdw_slave *slave,
+				 struct sdca_function_data *function);
+};
+
 struct sdca_class_drv {
 	struct device *dev;
 	struct regmap *dev_regmap;
@@ -27,6 +39,8 @@ struct sdca_class_drv {
 
 	struct sdca_interrupt_info *irq_info;
 
+	const struct sdca_class_ops *ops;
+
 	struct mutex regmap_lock;
 	/* Serialise function initialisations */
 	struct mutex init_lock;
@@ -34,7 +48,9 @@ struct sdca_class_drv {
 };
 
 /* Library helpers used by codec-specific SDCA SoundWire drivers. */
-int sdca_class_probe(struct sdw_slave *sdw, struct sdca_class_drv *drv);
+int sdca_class_probe(struct sdw_slave *sdw,
+		     struct sdca_class_drv *drv,
+		     const struct sdca_class_ops *ops);
 void sdca_class_remove(struct sdca_class_drv *drv);
 
 /*
diff --git a/sound/soc/sdca/sdca_class.c b/sound/soc/sdca/sdca_class.c
index 0e6dead41495..79fdb672be1d 100644
--- a/sound/soc/sdca/sdca_class.c
+++ b/sound/soc/sdca/sdca_class.c
@@ -144,6 +144,8 @@ static void class_boot_work(struct work_struct *work)
  *       allocation and sets its own dev_set_drvdata() -- the framework
  *       does not touch drvdata.  Typically embedded in the codec's own
  *       priv struct so codec drivers can keep per-slave state.
+ * @ops: optional codec-provided class callbacks (may be NULL for
+ *       pure-generic SDCA parts that need no quirks)
  *
  * Codec-specific SoundWire drivers call this from their .probe after
  * allocating a struct sdca_class_drv (usually embedded in their own
@@ -151,7 +153,9 @@ static void class_boot_work(struct work_struct *work)
  * sdca_class_drv fields, sets up the class regmap, and queues the
  * deferred boot work.
  */
-int sdca_class_probe(struct sdw_slave *sdw, struct sdca_class_drv *drv)
+int sdca_class_probe(struct sdw_slave *sdw,
+		     struct sdca_class_drv *drv,
+		     const struct sdca_class_ops *ops)
 {
 	struct device *dev = &sdw->dev;
 	struct regmap_config *dev_config;
@@ -169,6 +173,7 @@ int sdca_class_probe(struct sdw_slave *sdw, struct sdca_class_drv *drv)
 
 	drv->dev = dev;
 	drv->sdw = sdw;
+	drv->ops = ops;
 	mutex_init(&drv->regmap_lock);
 	mutex_init(&drv->init_lock);
 
@@ -213,7 +218,7 @@ static int class_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *id
 
 	dev_set_drvdata(&sdw->dev, drv);
 
-	return sdca_class_probe(sdw, drv);
+	return sdca_class_probe(sdw, drv, NULL);
 }
 
 /**
diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_class_function.c
index 411e3d717bb6..d83be8474e7b 100644
--- a/sound/soc/sdca/sdca_class_function.c
+++ b/sound/soc/sdca/sdca_class_function.c
@@ -329,7 +329,14 @@ static int class_function_probe(struct auxiliary_device *auxdev,
 	drv->core = core;
 	drv->function = &sdev->function;
 
-	ret = sdca_parse_function(dev, drv->function);
+	if (core->ops && core->ops->populate_function) {
+		ret = core->ops->populate_function(core->sdw, drv->function);
+	} else if (drv->function->desc->node) {
+		ret = sdca_parse_function(dev, drv->function);
+	} else {
+		dev_err(dev, "no firmware node and no populate_function hook\n");
+		return -ENOENT;
+	}
 	if (ret)
 		return ret;
 
-- 
2.53.0

