Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A213A1697
	for <linux-sound@vger.kernel.org>; Thu,  2 Apr 2026 08:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775117505; cv=none; b=ORVvBG1cUJrx9tzQwgpyNGQM31NfrUrWgAnMS4K8jteFzmWot/ZWYbsBkguvM7OeSeuS2sgWf+CAwIjjrVagdZ6G3lpga78QeB/XLXS5JHwOlaSm0RKJW+e/wA/YKMi8rXLlG9awV3vEHY/mPbv3RaXWK/zUG9AiMIceRAlEabs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775117505; c=relaxed/simple;
	bh=6jShP5otc7Z/xglFZY5mqaUqDhEckaI1JOm+jwe6kcI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VOw6SR34MJ4YcpEdX2KTVnJIfoS3ppoPsRECy82KVp/RPelaaQVOcPLMbt+AujKIfMb1bbd2z+vCYf5C6qfttDqd//wCeMEZi4hno3Lw27/VzSqzJ9Rhk7cjYo09DlBe2V5stIfsfMwOLBo0kKD+FHloSMSHDXaSBsU1Fq6X/U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S2+HEmJ3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SkPkdTXs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S2+HEmJ3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SkPkdTXs"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6326nCS22904364
	for <linux-sound@vger.kernel.org>; Thu, 2 Apr 2026 08:11:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xKWL+GAYqNp
	+tTujHQMkzR7HCGoYVVs3sPVjIKR0hiY=; b=S2+HEmJ3crj0wV11XDg2YgQvH18
	a02FPNaTVFkTDaGhtLm4FWUPs3Nbt7ANG7Hkh1PJDZF5AoK4AcDPQinGI7LYvZOh
	Cw/SytMcQZtiaYuTxanDCGCaibH69gLTwZOO0rNCjwOiKiHi8UucFWOMAXhkcMm5
	Bsy28+ZhrIjSXb1hyDG7uZdmZlaZAjCV2B8PvzRMNzjTL6t49fBttl2svAOTCLVW
	edkJBYXnz94tJeD0lI//5WF77q+5i/a/dmeHKA1LC/suuO4a/1ATBoYcyKWdm8SF
	o5ppAWx5uuYaWrFmw7koQ+RxeRMJKv8XCXhaTtJuJpD8Ttm3JN7hWwpwHbA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d954cbp04-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 02 Apr 2026 08:11:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd7fc27cf7so170057185a.1
        for <linux-sound@vger.kernel.org>; Thu, 02 Apr 2026 01:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775117493; x=1775722293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xKWL+GAYqNp+tTujHQMkzR7HCGoYVVs3sPVjIKR0hiY=;
        b=SkPkdTXsRsBIsiUJn74uHNoSYimewlGu1IFheNZgq3SBDXK3nvXVijHDUlvnL+O2mv
         ZphzAGpVlv6Tjun3k49MPq5skQVK1OOjtUbqL9U2eaxWfuj3Hq4wjWpm10w5X+/ATAaa
         rsUN2G6HFCx8E4QeOBk6d36FiDM2buSTH98I9Y5b8VcPDyNTCgsokWIJHa9wUTRm181L
         Q7ohXy/bkZbXplBKZHzkPiOqDhcXde20Zevnuv4fxwmcZ6trRNS8wpsSqRdsRY2Sczi3
         EMvaHaDxsBoNZfsXEGAif7i3EZgAHq+DEcrWeypfRmb1EYvK6NrdQTzUqbFSFLpqcSvN
         ex1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775117493; x=1775722293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xKWL+GAYqNp+tTujHQMkzR7HCGoYVVs3sPVjIKR0hiY=;
        b=EZPAOypVZlud0eszsOMuBgzjce8caHfKdu6maDgq8HDeRa5d9klHWPaH1nKzfBWWXU
         XAdQ8NEGm8ei0pMDdFqoFjXWEbQS8gcSsFPDINQfhsaDCbWPyMM0QEbUPqzN9ZgHu3Ap
         Bg+qYykyY5PNshyMKwNOauigOSVHq+CoG98lijwa0OqSJkyNjw95QZBKjzyR9qQXitOV
         FcL3TPr9RAmYRXqB6edTQN3j9B2CqzVg78p7Ud1z3AU7z2OKDA8th6plmfaypP96EmMB
         gySBeM4e6BrngpKSxVhGaPolM+lyXugrD2IVQoptDjjr4eB2ihnIydVaW9iM3yel5OdD
         iGSg==
X-Forwarded-Encrypted: i=1; AJvYcCUFW78BORt6hcfda9bz1eBEr0uI3I0CaUcv98Dok1IvODYeH91eMrqWgp/J/TTuWIwxujdD4uYXoZ5V+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBqtwQRsFfu91vBFK9NVM0JJA/rijegJeFhR810/PMuyq0y+R+
	c8to7ob//WMYBcy4Ies/u5J20/MSSMSlIto8HYgwRo8gpUwYrFS9+ebTphAcf6f/X6HpPS9uusO
	WSSA5YOx0uKM7TX8sYKILrih5+DRJTQFqIbI9kWWvE3PmnAGPJsbZ61WSWbJ++zQtAw==
X-Gm-Gg: ATEYQzzIqkCzabaLT5P7fHW5lCYhFLb/xQ+R22zLrv5zj7Wl58XWHH7QkDP21YL24RH
	FwyyAKP8SRy8bK2Z0vTMKFURd2lPkOityH+9sqp+DMvmgfZruNIV0tWJzCkUeSE+HbYO92OUR7p
	/QDoL00nf6XepSSPk6exoAije+HNGPZY/jQELj5405pAtpXigvC43alpGKb/w3U8+15giTVuOGY
	6W8dZeNGJRhzHah+87BVfIMi9Zcs1bNgo1+bGjCaIQ94F8lcQJ6qENjgGTCAWtNCZCdcWRDAf8t
	KWHSRQZFvYYD1gmw2sfmL5u9tyA2pkEgbdwQOJSajf9bl3aSk4YpBnOj8ml73p0fe3qFR2a8Ef3
	8Is86N+AFkltIodRIW9+speb3pTXhVZD0+8DgO2E8fm/HOyUVvICaAcU=
X-Received: by 2002:a05:620a:44cc:b0:8cf:d804:4569 with SMTP id af79cd13be357-8d1b5af1029mr968083985a.23.1775117492941;
        Thu, 02 Apr 2026 01:11:32 -0700 (PDT)
X-Received: by 2002:a05:620a:44cc:b0:8cf:d804:4569 with SMTP id af79cd13be357-8d1b5af1029mr968082085a.23.1775117492486;
        Thu, 02 Apr 2026 01:11:32 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c3a01sm5712604f8f.12.2026.04.02.01.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 01:11:31 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org, val@packett.cool,
        mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v9 03/13] ASoC: qcom: qdsp6: topology: check widget type before accessing data
Date: Thu,  2 Apr 2026 08:11:08 +0000
Message-ID: <20260402081118.348071-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260402081118.348071-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260402081118.348071-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=WMlyn3sR c=1 sm=1 tr=0 ts=69ce24b5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=5HTw2GpdgXbBP0wXRk4A:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: g5mQekTjLO3E9cOR-NqcObfpbG2VHTQy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA3MiBTYWx0ZWRfX0PG7UU/lcL2Z
 br60kiER0TonSEWFPUkv/pc9UE3bce31XAzxKvpFUPch7Cc313U0S/goljsNMgrvRRiy4pMnbW4
 m3qmaTUB1Hf5XtrZLFeaIX+48DVqlKPKEqRRdsN5WjQ8Sh6UmDFvXMQKiSkODAx0ZDsHA8JkXKC
 HA2lYOfgSKjNP2cZ+5jsx7mPgA5O74e0WZniHbyQGH7C+R8NaN/MKDcIzBrilxAf11rNK5ze5sg
 oHXk3MJ2n8wNFSCr9KPjN+9J7DFr6qV2y+TFvMggF+bcgWGcTZwpUoooScCuAuNwscpFMmIIPDP
 Xo2r0cp29u7D3rKlY+sGGbNbqEXmrFykdJu7V+U/I+DI88O6+PjRTsi7aW2USf4wYwc+yNyGFfX
 olWQn3qx1oj+Xpd7Ni9x27dnAsa6JU0BCb1tl1JVZboV7MMLdnVyJXAnHZdJIxK+KHKEYmExto2
 VfqrCwIyWZIOiCGffRA==
X-Proofpoint-ORIG-GUID: g5mQekTjLO3E9cOR-NqcObfpbG2VHTQy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020072

Check widget type before accessing the private data, as this could a
virtual widget which is no associated with a dsp graph, container and
module. Accessing witout check could lead to incorrect memory access.

Fixes: 36ad9bf1d93d ("ASoC: qdsp6: audioreach: add topology support")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/topology.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
index e732fac9b8ca..1f69fba6de26 100644
--- a/sound/soc/qcom/qdsp6/topology.c
+++ b/sound/soc/qcom/qdsp6/topology.c
@@ -952,9 +952,6 @@ static int audioreach_widget_unload(struct snd_soc_component *scomp,
 	struct audioreach_container *cont;
 	struct audioreach_module *mod;
 
-	mod = dobj->private;
-	cont = mod->container;
-
 	if (w->id == snd_soc_dapm_mixer) {
 		/* virtual widget */
 		struct snd_ar_control *scontrol = dobj->private;
@@ -963,6 +960,11 @@ static int audioreach_widget_unload(struct snd_soc_component *scomp,
 		kfree(scontrol);
 		return 0;
 	}
+	mod = dobj->private;
+	if (!mod)
+		return 0;
+
+	cont = mod->container;
 
 	mutex_lock(&apm->lock);
 	idr_remove(&apm->modules_idr, mod->instance_id);
-- 
2.47.3

