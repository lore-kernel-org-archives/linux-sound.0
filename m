Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45CCA44838F
	for <linux-sound@vger.kernel.org>; Mon,  7 Sep 2026 08:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770321; cv=none; b=olhpH1Gz0gdCRI7sThpT6WOJK3cKHi6OpNEoWX70hOqlK5IwsEmL/dQGgzyaJDeNspQbqrTKmh8VBpY/oRDmLlbwfMRNH9jVYdeN/f2x90nLdhseTTwC2pCXyNR1kGa+VmQdSx0gl3OT3Mg2q8K274DtZqOGAlF9WLC7PthtMNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770321; c=relaxed/simple;
	bh=DgNygwjQW1S4gERxv8XXOx2YJrza1CSfHMZkNg6qCgo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XZs6OGuwRbhu9tCdKo+KOdW59WlvTiJGV/q3ZgD1716LgWcqg0a58pCCq2FuWo4LihrXH8UEqBoY9ZVoGvRuF6aZrl5R0dSdhI/la9Un5+Eg684j79+BCWx4WvK75Cnc8/or7mJ8PsmRIx53pLBLGdB0xF6Apol3IDeH3BWVbi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O1BcE7H0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Uxbh1zN1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O1BcE7H0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Uxbh1zN1"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6877NN3Q333055
	for <linux-sound@vger.kernel.org>; Mon, 7 Sep 2026 08:38:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=AiIpEIEQZ4E
	IiKlUje19hDPydG7qbYBZVrWugQnhc24=; b=O1BcE7H07hA/E8X4Ke6ZC51W6EL
	JXB9T1CcoEbIS2uQp/76XoB4zlRJJUrNEfCluZnQREdn3Mp/eQZK1nenAFsGFide
	s+gN1NR9QvSojOak4yBNowyeO5ueTqOokjVTmMFyILqu9ZpGegRLG7/heMc+eY7t
	9Soqr8bXRFM0t0wG/Xpjuvxv3I46TbIpxHlgyObieJJpAgvShK64bcDf4O32TSSw
	rxLTqTt5EymSsxmDmOVyqETFFyC5vqvoYmxNf8vadf9hUNGUyzSL2GgUgGd2EgFU
	4TOyYy1/Ygo/lf3UzCEk0dEe2BCkU2PCiGK0bDcTnD5kun0slgVYNzZakTg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghrua8efa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 07 Sep 2026 08:38:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93909014c85so542771585a.0
        for <linux-sound@vger.kernel.org>; Mon, 07 Sep 2026 01:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788770315; x=1789375115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AiIpEIEQZ4EIiKlUje19hDPydG7qbYBZVrWugQnhc24=;
        b=Uxbh1zN1N6fVS1GpJWrFhgiDl+iiiihUJk8jL6HFNqKLhZ7liZAIO4C/ARoiVLN41x
         gTyd4IkS/LuWkbE/hL8UkCzmNcNywbwceJkrYns5uURbPG1R7KbgIWs0CYeVkMtYIrrG
         JUFlTjF+KG1biAotBKRIvza1op9BL5I6XybkqahQOURZMHWDD8GCNAbzDhp5tvm5sD/F
         Pl+6g1utQkmjSUVvqGQ2MDCgw7YQ3xsKcwRrDlY4O8ZEpx5EUoTFD1ToPXUh7YYxzSee
         2+Nkr0Yu1eF6HEMH5nXWDcPJq6OJXuG9m7jncv3DI4vRJpUhCv/NkaMEuDn+Ji4htPY1
         Dviw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788770315; x=1789375115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AiIpEIEQZ4EIiKlUje19hDPydG7qbYBZVrWugQnhc24=;
        b=UkWbbxb6694mjQ1n2Qdv36edyp+oGSoKVkEx5954IJ84cCeXE0s42fUb/QYoy4yPYm
         yBbVKG7RuU9L3mvyylN9XP2D78wPRZ1cWLJcv1kcWMIVcJpSELMpnkVOyBH1iV2BSbHP
         Ov7dHVwQlMnZXb0C0e9PO8Uu+MMufMS/nC8Um4OxdPS8WREdpRhTiO4wAB7zNqfM8oSg
         qCvw564PhpNwFuhLi3gdAkYU/VZvUZEeLR1T3Yly8QxIUwisqqec9phc9hUwIuXVuD4i
         8WAFPPssX9BG07pMi/bEoQrLwJ8X4RR5FiHul+29Ep0o1RtxvKa3VmBtXZ1SlLX8kiVq
         3WfA==
X-Forwarded-Encrypted: i=1; AKwUvBzQVok2sSBBcA52YE9k0XMDTeUYA6HbP4yJNaty10Rp4bgjsPdLDYp4NAb/SrIm/lB1Gmz67NN0IUTcbQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nSu5+wruxsLY1QOZrP6Z/vsvAcKdCW/EslvFzN9+gM/g3nMJ00
	5rO7HmKw2LmIwq8r/g1gDqhykyzxwkYlibTjvd5TzkeE5o5UUDi0+MUZyErjgK54POPliSWIhlx
	dMPEDmDJcsFDBmwehBEtWYrTuYJHtERRcbnpzcYp93nQPtWpnsDhbkPUxOrIJkARmbg==
X-Gm-Gg: AYBFou361dOunLUrwc/2VwjSKzvK9ZySdYGbsJqn1PLHhNVMAwIPtB0/+B0WZ+noYJL
	2hrvwQEVmulHqqn7TYDi99rt+1ms2S8XRSXn5FvydnEFhrAIW7eGzJdbVch371I+pQrHmpGPMBu
	gBdn4FLKNUH+C+1Z3H1XrHQvCWr2ggjY3KolTrbkEi5GTFZXyA6WHiZ4hkfJLv3ywCuAZrXXf8l
	aWMY7P2PEsNjcZDibn1QlBEHbD1rgehakBtAPGghGm9ELj7LvvKSnsXIlGkOoxsIBiS4ciGXW5s
	sn5JdU9UQz2W1KGwCo0BV4IInC2VlnPNNYXZuZ68ufb2jY7h1c3ooKAgrmFzxAZ4teN4AUIgFFn
	lW4k6yj4tGw7YEQ==
X-Received: by 2002:a05:620a:5642:b0:939:34c6:a333 with SMTP id af79cd13be357-939804a4609mr1838515085a.40.1788770315556;
        Mon, 07 Sep 2026 01:38:35 -0700 (PDT)
X-Received: by 2002:a05:620a:5642:b0:939:34c6:a333 with SMTP id af79cd13be357-939804a4609mr1838512185a.40.1788770315103;
        Mon, 07 Sep 2026 01:38:35 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm30852179f8f.25.2026.09.07.01.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:38:34 -0700 (PDT)
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
Subject: [PATCH v2 06/11] ASoC: SDCA: class_function: xlate sound-dai cell by entity index
Date: Mon,  7 Sep 2026 09:37:20 +0100
Message-ID: <20260907083727.733705-7-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: FSdTKzyBwnC5atfsaJXeRZDttGGmV-qg
X-Authority-Analysis: v=2.4 cv=U+aiy+ru c=1 sm=1 tr=0 ts=6a9e780c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=D7LRd5SpCY7MsyqoJ6wA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: FSdTKzyBwnC5atfsaJXeRZDttGGmV-qg
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA5MyBTYWx0ZWRfX4f+6vG9Cp7ff
 kLDLJr3BsluZKabqEGNoLJBvf9ySZ5rEhFenaNhC3wiRlnHIwjr32K4/t6M8JGtDQlWiuFg4t1T
 J4MU6I4j2lBw2FnO74h+QjPkHC+uM7I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA5MyBTYWx0ZWRfX8SsRqvhX3Jkj
 SK/azh+VAR4RNI4c1iI0xhrWF4TlBP8TNV/d2SM0u0SsnNDl/kfkgU8zoWS0VGKzW1ryovMAT0u
 lw/g4fl4ueymZOvHmK1I0/REx7W3qy93HAuQkv0myOMzr9Pu2d8+bFxTDrzIJernh8Me+7QjBMn
 BFQPUFpesz3mviAmsSp7HrnU/c3Q/VCQLf9NPt00LNE86EK7xw+8cdetQh3zj/juOK1yxMFPT4g
 Qwnnr+dTsLQDtsR9pNh8cbc0ZTuQ2r9YufRUWcVwLpeXsZqUG6TGW76CvJhdtBXidhaE/oYhdxH
 WvZwOEPLG34XgMOF5aqTyOeAWCd+RsmfxicqNsrsZbl5Q8jWQwTaLDLUXCxUAdZoFPUe4RmDBgN
 4KHVEXs1M30rIc2Zc+WzWwEOpCsXjpUzxMp6934KR8tL6yoZcpv59Or1ihXDnb/X2DzQbHYx8cr
 VSsCUMVBrQRPLqGr3zw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070093

sdca_asoc_populate_dais() sets each DAI id from the SDCA Function's
entity array index.  ASoC's default of_xlate_dai_name treats the
phandle cell as a positional index into the DAI list, so on a Function
with non-DAI entries between dataport entities a sound-dai phandle
resolves to the wrong DAI.

Register a custom of_xlate_dai_name that walks the entity array and
returns the dataport entity whose array index matches the cell value.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/sdca/sdca_class_function.c | 34 ++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_class_function.c
index 8bca88865a4d..ab043e23878e 100644
--- a/sound/soc/sdca/sdca_class_function.c
+++ b/sound/soc/sdca/sdca_class_function.c
@@ -216,9 +216,43 @@ static int class_function_set_jack(struct snd_soc_component *component,
 	return sdca_jack_set_jack(core->irq_info, jack);
 }
 
+/*
+ * DT phandle cell is the SDCA entity index (matches dais[].id), not the
+ * positional DAI index the default xlate assumes.
+ */
+static int class_function_of_xlate_dai_name(struct snd_soc_component *component,
+					    const struct of_phandle_args *args,
+					    const char **dai_name)
+{
+	struct class_function_drv *drv = snd_soc_component_get_drvdata(component);
+	struct sdca_function_data *function = drv->function;
+	struct sdca_entity *entity;
+	u32 target;
+
+	if (args->args_count != 1)
+		return -EINVAL;
+
+	target = args->args[0];
+	if (target >= function->num_entities)
+		goto err;
+
+	entity = &function->entities[target];
+	if ((entity->type != SDCA_ENTITY_TYPE_IT &&
+	     entity->type != SDCA_ENTITY_TYPE_OT) || !entity->iot.is_dataport)
+		goto err;
+
+	*dai_name = entity->label;
+	return 0;
+err:
+	dev_err(component->dev, "xlate: no dataport entity at index %u (num_entities=%d)\n",
+		target, function->num_entities);
+	return -EINVAL;
+}
+
 static const struct snd_soc_component_driver class_function_component_drv = {
 	.fixup_controls		= class_function_component_fixup_controls,
 	.remove			= class_function_component_remove,
+	.of_xlate_dai_name	= class_function_of_xlate_dai_name,
 	.endianness		= 1,
 };
 
-- 
2.53.0

