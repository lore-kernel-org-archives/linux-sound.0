Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A4545D5E5
	for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 23:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784763761; cv=none; b=kKM1QT3gVfRtEghGIhNGtGqzqBSSXTbjnbwgd2jL3kUXmkVSktVcTT/RtEmfzOJ6rk3ZkMiWeagf2WjjmT1EbvfzqUGZbr5mhaBIuGUz5Edg8NEom/EsbDA2BL+h1jOCclOAXrAdNyiOAkGzwAxx+/YRmodhTYZX9K0uDzg9jlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784763761; c=relaxed/simple;
	bh=7zLqofSl1fFRrfQhgsKi3J3B3rL/IRezTib4sF9WHmI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SxEWoGpxJ56NKtNduRKTrrKZlEVu/VmMRKPKmRhKcJW9EHwZfKsjgpPrae+/ynn8eisrJLtfBUl5bqX4aZJD/fi7rmlP7Ns1IaFTM2yYvLR61BtfgJbcpMk884JcabBhWBQHs/Tm4CjRVeaNHRGscAoogPoMmJXGO7KP7dvxhgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pyYY8QNc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mk2IDjm9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pyYY8QNc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mk2IDjm9"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MMnmod2316300
	for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 23:42:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=oqvjgH5GFBL
	7f+z5ZXVfT3VkAPAKsKCcpcjs7sW2udw=; b=pyYY8QNcHHHbFkhGM3eeUorAELn
	SqpOXkrEqw9HADN27FgmDM1gvOx010xUdRDMjDc5pyOAYqULghMtgLWoiTCbqCWz
	8I0l83xvN1PnQmtJ+mRC56wn/2yqVArGXoWsWPqzch12+fD2rqYNYRoJ3wqrGTSm
	mXa3+3MqG0n2bU9OnLTD1y28iTA4103xevs8C1G2AANhn2MHztN3Tah1SXEWAr05
	NEi5PitefOh6Gq9YnEZ5nUDZyFtlF+PJAI1AIVD+i99DfNF4jGDBiWdjeiofKn0M
	qoFwf/iFq0ngQWZOn2Cviw/5WwCu7B4LyJmPWK6Go+8yRxhscnmnhBSpWAg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk5cc0fsr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 23:42:38 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c0408254aso536481cf.0
        for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 16:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784763758; x=1785368558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oqvjgH5GFBL7f+z5ZXVfT3VkAPAKsKCcpcjs7sW2udw=;
        b=Mk2IDjm94rCybPiWn5lwusYrLe52EKHiu2Xmq5wJJLUGPRQtgVGSFSrejQFhriBGDe
         BgtAAKaSdvkqA+74H2F3HTB70cJKgavX1bbCBJwotUfOuQvqQTHdso6Tid5F+FPnkVCK
         BmCizer6hRFHfrCcjMqE2BgND6uu0VZWLu00QumcFPDn3xfmFRD7tulu+itSkOQ5wRD6
         AtlyalQTeVj4UTVVlN2leP837WIfAtEKDuXbu9RItHjcL29YVALXJ4TPTtwq7id4Ng7z
         ZsBhJTdridQSLfyuDIrF4+3rZH8LXIWgnhtosTqDD7ZF85xKnQMW4K4ZUmOPWarihkqx
         +CJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784763758; x=1785368558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oqvjgH5GFBL7f+z5ZXVfT3VkAPAKsKCcpcjs7sW2udw=;
        b=LQwKrYppuCgs4mxJ6lN0ieRfQ1pTfKM+2CzxeGOLiQ1wjH/+A5BHNsPcnREqhgMh28
         dPX12Hr+C6DFNERX2ENCXU/rYKlDE5BSYCLLNJXT8Ih0FEBAVObu71uPFF2g2MfWLm1a
         etWKu1lqbJsYR+afN0+T5yTbLZ2BWNw1aI671o1QOQS02pWQiQEGo16AlQEMI9rXnkBs
         uf16rEI796u680X968cNxGwokOkbsFynMki9FAUEuCpwBultzE9OcT2b4qkOYjQcDPJP
         hDjUhjE2WKTf9WPznVPjg3RMfDzqktyr3fTysIFh/bXWNenw9KDDc7kcdrIXilIFeQfd
         FndQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr2jsjZ9CDIoLZSemVnijSrRGPTvf5TGRyfrFnl3dPMlZOkfU87bZcHCKWb3rFxTo1jKiWnvpeSb0ObAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLP6+0DUGjBn7zAChIg7jTk/u7g2mc8XXWaJM3xXGhXMMQRJq1
	vMoaZGgKW7Pbksem6O2b6/3jsrSYm4pOpbV4JdMntzW/oqtEgarv6bVkjC2Fui48v62YJux4cYI
	TxyX37gy3KbCXlgCrqDXP//O/XPBqhVNCACFZzxD516X3x4gqiKGxXilV9Hd87+nlqA==
X-Gm-Gg: AR+sD13Wh5XtrWb0XwEP8MPE94PajVwuRYAvWNlCLG+74fsvHD3MBhPskhNyDxlq6ys
	FtTVFReNeKT4RsQwtEDKufjXt0HmgibNMZ2AuJn3SZFevGTGtzou96G+4xAmFoAVJVLST/ljyf6
	wdjcXk0HJutlYMw3+UX8So7fX1KnJc6qkwBifItTP2pVaclVrAPXdsyN/5b79YgqFVZ7dfkZLeu
	nhWyjP3ulBAg/JzEIhYuuRj+M7rnbgOzCDRNpPR3ToloLuTJ5jy7+dQcWkdo/2Sbj9Eu5ThOs2o
	bTHvjDsUHUh4eu9U52RwmakschcVILf6dKR01a3WsnKcKuNldG88BLAVnrXAPovEIObYGNKy20+
	03+I0ZUqrU9JvSQ==
X-Received: by 2002:a05:622a:2c2:b0:51c:98f:f288 with SMTP id d75a77b69052e-5283edce89bmr4129941cf.25.1784763758070;
        Wed, 22 Jul 2026 16:42:38 -0700 (PDT)
X-Received: by 2002:a05:622a:2c2:b0:51c:98f:f288 with SMTP id d75a77b69052e-5283edce89bmr4129461cf.25.1784763757480;
        Wed, 22 Jul 2026 16:42:37 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956a4aae16sm101796345e9.0.2026.07.22.16.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 16:42:36 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [RFC PATCH 5/8] ASoC: SDCA: class_function: xlate sound-dai cell by entity index
Date: Thu, 23 Jul 2026 00:42:15 +0100
Message-ID: <20260722234221.884765-6-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260722234221.884765-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260722234221.884765-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 8d410_m86R8tSk7YEbISSxPjq5gO2gUf
X-Proofpoint-GUID: 8d410_m86R8tSk7YEbISSxPjq5gO2gUf
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDIzMyBTYWx0ZWRfX4MX8K8EpsuFI
 358Pe4zcm+6RGbSnsJHdXjZNI3cUIZP5VoQ6tJPdV38zTbyIGMRlK6cmpcbZE0/S2m21NaLAfDc
 BRkOR00NkZWVqV/yAmeIxmlFPyQt1ew=
X-Authority-Analysis: v=2.4 cv=L/ItheT8 c=1 sm=1 tr=0 ts=6a61556e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=D7LRd5SpCY7MsyqoJ6wA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDIzMyBTYWx0ZWRfXxC9kkpBKBbSQ
 fu7gBOTMprY7B35YmNPBV2H+6/ghKrWaZfcBUMtdISaTEtueuinmDBo4wKzenfKiT+205/y0adj
 5lbwgmk3ZKdbQX+T3RKXE+zhp1jypfguBpF3xNxr9H0yhQxtsjzukiJIMV6/hyKxlLm2eqZn6Q7
 nuQCXuThzpoNt3WvY8pBTSpu673c0Ze29zUcTLWGB1KdXh/XVEyyin3homJM9lkKTxJ6ejR2Brv
 iMVVkRUq7hg+i7lwhNK87/7BZag4y7NU0CYFIBYYuRUSyJtpX7C6CKvEFslXdJTp/Be04UhvJec
 8I3AsxqHkUyxp0Zz/5m/J59nfZGryQuwqee/BPssl2x0eM/QejDM+pwZi33pL08UgXh6bjGk/vd
 Lo0Snvu0/ZDxn2Of5ZiNrRVgNqUMbuaXZR+r0QZRIhmCJKdviOhkQYZ+mnfUaM4nk18peIDGZ2/
 coGAWaSvct9MPCeUFoA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_05,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220233

sdca_asoc_populate_dais() sets each DAI id from the SDCA Function's
entity array index.  ASoC's default of_xlate_dai_name treats the
phandle cell as a positional index into the DAI list, so on a Function
with non-DAI entries between dataport entities a sound-dai phandle
resolves to the wrong DAI.

Register a custom of_xlate_dai_name that walks the entity array and
returns the dataport entity whose array index matches the cell value.

Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/sdca/sdca_class_function.c | 35 ++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_class_function.c
index 905c96ed6172..b0fbe243d732 100644
--- a/sound/soc/sdca/sdca_class_function.c
+++ b/sound/soc/sdca/sdca_class_function.c
@@ -216,9 +216,44 @@ static int class_function_set_jack(struct snd_soc_component *component,
 	return sdca_jack_set_jack(core->irq_info, jack);
 }
 
+/*
+ * Map a "sound-dai" phandle cell to a DAI.  The cell value is the SDCA entity
+ * array index (matching dais[].id assigned in sdca_asoc_populate_dais()), not
+ * the positional order of the dataport DAIs, so the default positional xlate
+ * cannot be used.
+ */
+static int class_function_of_xlate_dai_name(struct snd_soc_component *component,
+					    const struct of_phandle_args *args,
+					    const char **dai_name)
+{
+	struct class_function_drv *drv = snd_soc_component_get_drvdata(component);
+	struct sdca_function_data *function = drv->function;
+	int target = args->args[0];
+	int i;
+
+	for (i = 0; i < function->num_entities - 1; i++) {
+		struct sdca_entity *entity = &function->entities[i];
+
+		if (entity->type != SDCA_ENTITY_TYPE_IT &&
+		    entity->type != SDCA_ENTITY_TYPE_OT)
+			continue;
+		if (!entity->iot.is_dataport)
+			continue;
+		if (i == target) {
+			*dai_name = entity->label;
+			return 0;
+		}
+	}
+
+	dev_err(component->dev, "xlate: no dataport entity at index %d (num_entities=%d)\n",
+		target, function->num_entities);
+	return -EINVAL;
+}
+
 static const struct snd_soc_component_driver class_function_component_drv = {
 	.probe			= class_function_component_probe,
 	.remove			= class_function_component_remove,
+	.of_xlate_dai_name	= class_function_of_xlate_dai_name,
 	.endianness		= 1,
 };
 
-- 
2.53.0

