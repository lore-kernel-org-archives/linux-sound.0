Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0331A44063B
	for <linux-sound@vger.kernel.org>; Mon,  7 Sep 2026 08:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770317; cv=none; b=jSm2XD/fmmUTUTs+IVisN/NCuPSYDROZbnhBoAz+He2FzpS0W9X3E0pD8Gi6xLBuf3bmi2IyptouF0VCaOxFGg771FWB8dRji9iEmo+o5oYG82ovm7sIV/n7iHVV11+Dd1hfWvrp+imw5FuwhdNAZsDwpjST67d0qDOlRoBtcIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770317; c=relaxed/simple;
	bh=0p8RCwSnzJRObH4V/hHmFZHqxqK5DRlHfnAXqVAAiug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ThafCQYvpGB8CBygNzJ5gBb3Y6P+gyceBkDR5fTDHcjzpQQWjlfg50mBxhaqFsT/b7Id5gK6oXNiMztWSNk9ZB1nnyVq2dt+VPpOEMlE/7m0ChwZk8vp0GiXBbBarUHnqeTJAtKPFowD+ADRiHYBZN6RcNOab7riPy3iiViuKXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CoznclFE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JCMVTTJb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CoznclFE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JCMVTTJb"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68787S5F3411488
	for <linux-sound@vger.kernel.org>; Mon, 7 Sep 2026 08:38:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KnWk5w0YLVl
	dL/piP7sv25BHvbCU7XI78c1SRugNzqo=; b=CoznclFETHq6gWvcrKGdkgzdVJU
	WbpsZDKdBktY8kDNvmkx5luylPD/csggtOcPR/1pXl+sSG6GHAsU1ELmp5TCyMZs
	9F68IFPvKfkTl5ObXNP7z/80kUXXD2lizwpDYxkdDc/NkgsJ3A2UyyZwcaRRPMIT
	NsxVljG8u49+ZLHXMa//Yjsmvd/piOq6+xb3P6bgfnDXi8/YxCRB6uxG3hDb1pnO
	aQVVBqLVhmcn55iSEiSObcF7bD0/wtcCTQqnwCw9wwaeJPIPqRSQgVeGKE+Sbjis
	/ERbu/vzQlmxKb1fRllczOKPznPoPWjhFmLbwiHy6bzPNe1Pdb6VbgqTocQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghsfyg49t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 07 Sep 2026 08:38:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e62e3459fso512294585a.0
        for <linux-sound@vger.kernel.org>; Mon, 07 Sep 2026 01:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788770313; x=1789375113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KnWk5w0YLVldL/piP7sv25BHvbCU7XI78c1SRugNzqo=;
        b=JCMVTTJbhi1OjttUteLVQskqzMpTTrqb3S1w/PYZ0WqIttNQIHzA1HDyn+3xhi+yQa
         PkB4w6owidsbh8FGq0cbldZ1V2OJcrl70rNrxLJ9WDXz2q7lslB6IiWeG6eIvi5CXmml
         rLQOLcjTSLtyRjkv/4Ko+jFIX1eF934xvUGZuw0xhXPiv7R5Va7XG1HdL1FvnPZpFVhe
         F9a4BlI99ndZmofwgwnuCT4C/aDGwj0HEh+yLddhAviO3JFcN9iI7iUAD1kqheJ8J34p
         tecU9L8Nh6F4MbNIssmpVz2hV9AyugV1UNemCTDzy1lhDUa0aQ+5D9t7vd1lXSozg077
         DboA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788770313; x=1789375113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KnWk5w0YLVldL/piP7sv25BHvbCU7XI78c1SRugNzqo=;
        b=lgbPFQtxccnT8o1NTxfI7dmhLPv/l11ehsZKFH7rgY8isONRO2opp93/WRGhIAITvW
         vkPKDOBZceqsfP+O3acBP2dJKBnopxhP4Cxwe4cfPik8/cSat2NGMuhMxOj1r6LicP9b
         TC056p2XpVgwOqiQw426JN4zZGQ1k0xGJnIVHcAJxhKPNG7V2r5ZewX+bQ3E1ydEeMNz
         nHKc06mR8mncejENlttLMFzVPdPQMPqWWHRF5CI0EEzPyUymXMV6TzASXK4694GGdb3p
         wONU2LFL7N8TCCYAIbpWWaISCIXU9m2YHDO/gWGhObtNM+Ids1ap0UM9mXVvFRZ0r89B
         dlFA==
X-Forwarded-Encrypted: i=1; AKwUvBw9a2gx115dfhhMNHOeyLH8ezOK69J+XewPgxP1eecCVbydLnTYd+q1hm88hJLv1qJxSx9NdCqFhmY2bQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mWiYFRxJTLwxQoVFBwXvGvGIM0HZ3sZFh4szyCgY1SnfT7DzN6
	QDZvae/8GNsM6HwHvw4qYcNdIZ+ywqv2BYgoc7sG9fwDw9SZzJtVCGMpmLoSUosmhmahZW0vQnY
	L8/5QwbQ0vxaNOPR/fjDYeRQ96VLHJjZA6vl+Hp5whvKx3jnCCTfz37zNGWyBjMfSsg==
X-Gm-Gg: AYBFou1GXCR0EO1feKofJyRu/RjmseGzhzyVffT57m+DiMdxdd5zpKT+X5EMWsLXsKM
	tk5IyXOBMvhYA9qj/tM3SgOjaTKwgw2gpM1khXIsRmrHh7OVtVLlNtG/rceCUJaFaElOxMzX6dV
	UloT0Vz+wYu9b/kms1+G9eVN7Rhw30GB4T7GqWB/DSKRbEXPNI82815RysjK5NkT7DC2tfuP9xk
	S3YYDA5Tko5rcpGeHFS/sA4bVjM3O+Bpn7RV9NFSn5Jpzo5h+euo9Gwi7d9lutACKJF/m/ppxqf
	v8DsVmT/GG5YhyNcmCOkTBDh4Fq7j+bUffe3N2ShU+VRQXBkE/7eCgGs4SlXpPL/zptWtrycnSI
	jQK4PGrO5L5MIxQ==
X-Received: by 2002:a05:620a:8386:b0:939:6d22:6fd with SMTP id af79cd13be357-939803712c1mr2067471585a.18.1788770312943;
        Mon, 07 Sep 2026 01:38:32 -0700 (PDT)
X-Received: by 2002:a05:620a:8386:b0:939:6d22:6fd with SMTP id af79cd13be357-939803712c1mr2067469085a.18.1788770312351;
        Mon, 07 Sep 2026 01:38:32 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm30852179f8f.25.2026.09.07.01.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:38:31 -0700 (PDT)
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
Subject: [PATCH v2 04/11] ASoC: SDCA: add hw_ops with hw_init hook
Date: Mon,  7 Sep 2026 09:37:18 +0100
Message-ID: <20260907083727.733705-5-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 9y0RGvABRJF_-11GuZy3QdbeoRwqWJBK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA5MyBTYWx0ZWRfX6RtxkEi+7qRr
 e0bGqawzGuDnWX962cr59UK1Zgn7+E4XoyGNgeUvo3m+F+t3J/Yi+z2cOIIV7Yuxad1aRKHUsji
 Mg3ObLz59hvkprWHafDssGcS6hxN4VUoh65pesCI8i185+iWrBhkpwQpBWl1mj/3EjDHZ8B9Ja6
 VzxKFGZwLcgOI4LmqKynGavo+zdQO2R583AaUhFbCxcrW5PB4R9l3XBH+ZseIYUuf07guAPFfRz
 RiihW1L2j6bV/+xYiBmJUl6P/l9ZA6RPNlYU3HnzsJ1DqjIKhoKCxyZmw5OKOGHEDd1f3TU20nI
 ug4lHnOEbVvWOMBad/HgzQj/l+hyHmIecH/TtkkR0m9uPGMj3yK3MyZJKNere0lEwFRgS5FUH+J
 WrQ4CMpn+oGONw48M+MHAdJFvL7+sSxCHWQbg1VE8rHLRY2U2W+7x1y23JpBdUvWebxr0ktk/43
 Kv5NkyANWHhwM0naCcQ==
X-Proofpoint-GUID: 9y0RGvABRJF_-11GuZy3QdbeoRwqWJBK
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA5MyBTYWx0ZWRfX6q537nmT5QZa
 8UaOVeKh4c5hxDMSS4y9AKb+EkmgLHv3heq72n3qig5HHJdTGYvT/RwDhazlQ1ztfvJkehzik5V
 T7S1m0IniYxiZ6e58vPI2HDwO5Tud0I=
X-Authority-Analysis: v=2.4 cv=AduB2XXG c=1 sm=1 tr=0 ts=6a9e7809 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=TbNiP_vgcRotoqA_lb4A:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070093

Add struct sdca_class_hw_ops with a hw_init callback that runs from
sdca_class_probe() before the class regmap is created.  Codec drivers
use it to enable supplies, toggle reset GPIOs and program initial
vendor register state.

sdca_class_probe() gains an optional const struct sdca_class_hw_ops *
argument (NULL for pure-generic SDCA parts) and stashes it on
sdca_class_drv for later use.

No functional change for the built-in class_sdw_driver, which passes
NULL.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 include/sound/sdca_class.h  | 17 ++++++++++++++++-
 sound/soc/sdca/sdca_class.c | 15 +++++++++++++--
 2 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/include/sound/sdca_class.h b/include/sound/sdca_class.h
index c6063f22be7a..3342937d09fd 100644
--- a/include/sound/sdca_class.h
+++ b/include/sound/sdca_class.h
@@ -20,6 +20,17 @@ struct regmap;
 struct sdw_slave;
 struct sdca_function_data;
 
+/**
+ * struct sdca_class_hw_ops - optional codec hardware callbacks
+ * @hw_init: enable supplies, toggle reset, etc.  Runs from sdca_class_probe()
+ *           before the class regmap is created and before the slave is
+ *           ATTACHED; callers needing bus I/O must sdw_slave_wait_for_init()
+ *           first.
+ */
+struct sdca_class_hw_ops {
+	int (*hw_init)(struct sdw_slave *slave);
+};
+
 struct sdca_class_drv {
 	struct device *dev;
 	struct regmap *dev_regmap;
@@ -27,6 +38,8 @@ struct sdca_class_drv {
 
 	struct sdca_interrupt_info *irq_info;
 
+	const struct sdca_class_hw_ops *hw_ops;
+
 	struct mutex regmap_lock;
 	/* Serialise function initialisations */
 	struct mutex init_lock;
@@ -35,7 +48,9 @@ struct sdca_class_drv {
 
 /* Library helpers used by codec-specific SDCA SoundWire drivers. */
 int sdca_class_read_prop(struct sdw_slave *sdw);
-int sdca_class_probe(struct sdw_slave *sdw, struct sdca_class_drv *drv);
+int sdca_class_probe(struct sdw_slave *sdw,
+		     struct sdca_class_drv *drv,
+		     const struct sdca_class_hw_ops *hw_ops);
 void sdca_class_remove(struct sdca_class_drv *drv);
 
 /*
diff --git a/sound/soc/sdca/sdca_class.c b/sound/soc/sdca/sdca_class.c
index b952fa6eb802..374de7d9e0b5 100644
--- a/sound/soc/sdca/sdca_class.c
+++ b/sound/soc/sdca/sdca_class.c
@@ -153,6 +153,8 @@ static void class_boot_work(struct work_struct *work)
  *       allocation and sets its own dev_set_drvdata() -- the framework
  *       does not touch drvdata.  Typically embedded in the codec's own
  *       priv struct so codec drivers can keep per-slave state.
+ * @hw_ops: optional device-specific hw_ops (may be NULL for pure-generic
+ *          SDCA parts that need no quirks)
  *
  * Codec-specific SoundWire drivers call this from their .probe after
  * allocating a struct sdca_class_drv (usually embedded in their own
@@ -160,7 +162,9 @@ static void class_boot_work(struct work_struct *work)
  * sdca_class_drv fields, sets up the class regmap, and queues the
  * deferred boot work.
  */
-int sdca_class_probe(struct sdw_slave *sdw, struct sdca_class_drv *drv)
+int sdca_class_probe(struct sdw_slave *sdw,
+		     struct sdca_class_drv *drv,
+		     const struct sdca_class_hw_ops *hw_ops)
 {
 	struct device *dev = &sdw->dev;
 	struct regmap_config *dev_config;
@@ -178,9 +182,16 @@ int sdca_class_probe(struct sdw_slave *sdw, struct sdca_class_drv *drv)
 
 	drv->dev = dev;
 	drv->sdw = sdw;
+	drv->hw_ops = hw_ops;
 	mutex_init(&drv->regmap_lock);
 	mutex_init(&drv->init_lock);
 
+	if (hw_ops && hw_ops->hw_init) {
+		ret = hw_ops->hw_init(sdw);
+		if (ret)
+			return dev_err_probe(dev, ret, "hw_init failed\n");
+	}
+
 	INIT_WORK(&drv->boot_work, class_boot_work);
 
 	dev_config->lock_arg = &drv->regmap_lock;
@@ -222,7 +233,7 @@ static int class_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *id
 
 	dev_set_drvdata(&sdw->dev, drv);
 
-	return sdca_class_probe(sdw, drv);
+	return sdca_class_probe(sdw, drv, NULL);
 }
 
 /**
-- 
2.53.0

