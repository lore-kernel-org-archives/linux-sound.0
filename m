Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775896;
	b=cULM03+/x+TiMI+Q49b+Er8GLdMP+gsHT2+AY93LZf9FBHTeJUfqlb8tIMcPgayEMBWO
	 QrV8cJG7eS24WqR/a29TuB1OmzvdPOfapn7lXLmD+5GjPa495UUor1e79j0Ilm1ah7BVU
	 tLKgcvu5FeAYW4uBkvMi8zyUkyJ1CbPJkC9Hq7QONiCWX7sSpUz6BP3I9fygAu1EpS+Rz
	 x6k9c1JMNyOJzXQlTm/03z6drvyMhhSzoUod1UzcwhxAGqX0FnNpTRKWMo/MNBewn6FBl
	 ie8j9sjFN/SChWRYLZwh1qZY2v4qHyMqFXBAUrtDvKtM9M2miKk5qVP93r3CU9TE90Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775896;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=U+BHFh2JR5H1czrBSRnQE+UUSBqRmAYSBtaatxRecFY=;
	b=r+jUnENPGvnjQkjDqRZKebc2MfLshrkk5I7xC4aKJwKacsZBBlkOq40+AFHnxVhv3GNS
	 oPDKLTaDjS1xhUkxcrQbj8rCLQPQ8PqcvS94IsUlzJg32LhVE9bjskiuOxjRQrilebeES
	 FK4HQ/Ns8r9T9dsDm7iCQIiibueCPPdb2j0r2e1fJXV9yIK5bPVcperQGczHYKnbcIhp9
	 bdp39IoN1Y1GjjF+rD7YkZ9hee8r854UUo+vuKxBTXTFUHXdLmjxs9P5PHeM8NbgdX1pe
	 MtZ3t2Psg4j0mE3700254V0ARe1QD1sij1HWFy9Jro9LMwc+jb8OilDv7EBmthO6dEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="o/NHi7bw";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="dGsb5tm/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDC4606A958
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 17:18:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EDC4606A958
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o/NHi7bw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dGsb5tm/
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NG6CCK2215802
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 17:18:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=U+BHFh2JR5H
	1czrBSRnQE+UUSBqRmAYSBtaatxRecFY=; b=o/NHi7bwzHaUe0zx+U5i1aJzUbk
	n1FftPGLzrrQVKvHI6ZVfl9YPuLD2ka3yB5oegvIeLmF0RNOkDyoWYuXfSCS+Bn1
	FyH7+3rSnw38pzaskxoZqgIFGkkitbOhKLsY3kt+oqDfEWLYaayJ+KQ8TzdUj80g
	VeU8GaORhFGG6XttX2cSEagqinBCIgUFAWp+tXQerlen3kSKcTGTI2Jg/FzlveVe
	OS8/PlNhJfTzeJQsKoK8yX8J85lKm4okhodWfLS6vhzyKFSt1F/dSKPvkMNgAZaf
	iChj2cGz+hQfv8f19rNOPEdGwVgRpMdBnzSzjBXdVUuzcX5C7SwEF+8fExw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgatc8956-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 17:18:15 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb6391e89so242638185a.1
        for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 10:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775895; x=1793380695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U+BHFh2JR5H1czrBSRnQE+UUSBqRmAYSBtaatxRecFY=;
        b=dGsb5tm/mUjxpoIvKYNiBXd5+9bBYhHrWcN+prVH3pAYDCiKRjYOFItMjhLHWxiI9I
         HEkmXYLYqqNKtW4mAKhkzNp4KFKkjw3inIC/7nCoxWFGcHejSevTweyQWmNzXzntlgKE
         QPQZ0khLGWdVrBgxH9jwOW6M4HTeEROx7+Ae+UU7xs8TiISV93KnFOb9BmzQJnFhXEL6
         wpCituxt9vlOQkRQg72a0YrQyvrcdx9ahTeJ1KLrs87K+yQrUCXSXA9oh74LAskArof0
         3sIc1BxaUV++X+BpNSUduR3zoBOw+E+5KtcWcrRWGny4nkDLlBIB461sh0ipbISpIRQY
         2Srw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775895; x=1793380695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U+BHFh2JR5H1czrBSRnQE+UUSBqRmAYSBtaatxRecFY=;
        b=f/7JE4cfNwqHRFoHzdgJfsFdwmhVFrv5y4Aajnn97sz8XcfcDjGSOlXNWLBw9CXC2c
         f1bgaIgBslUmysgNB4EuKigosPFGenaSHlI+EU4VlGsb0FMIpJIWX6zEeV01l7jamWf8
         drLCPIYybIaeTtt9y6N5VEnoETsG4QN7tGIt+W1xr4fvgWSkTtcXxqCiY+dKuQo+EbYn
         3tLFvWjvNhN2ohInJQ5GwDFdyeJDIU1bjZZxnMaXnGBf0whtBjyS4Q4nyoCfFbS+PwRF
         Uw89VstbYEde1xDpNDoT/QBhqwCtrYY1FP1ucwbFwSS0XV3jbR4h3pSg1UWALlzli+E5
         K9RA==
X-Forwarded-Encrypted: i=1; AKwUvBz3O8jSLoO4wfBoF9GhPtgjmUbaEIHPDDvkESUlfbVS+1F7KBITOUHu/hxfxs3Mfbizcj71HpMfymi3KQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJEjVr9/3aJFTmSo/4KmOCedqbGX0eUTVg6w67owSxVJAhbgXx9
	+2cQizyL4D8p1V8Uvf3tSpq/LTODll+6X73mSL4kAHsXXic19ruALUtPDXZV0/FMMPoBBhj8Pnb
	ukHYOSxMwnOir3JeYDNSB212EZ9R6VObuLNEDsnDJCcbCz0iZjRzKROS+Qg5CqIqTGA==
X-Gm-Gg: AYBFou1PzWPLdfqnJ7PUtha9IuXsiAKuOzLjp983SHaikq7hhqVRx7xZt29fpz52FD0
	qxgVhIKhhP63yDqbGC+nfQfB76dWk24mcm53QZ+IKZSPHC01Uo3MR4B5XPkivfYf/ZBM9xftnhI
	C/oTCllxH0YvwoxFwxkSeb8ByJXAWI3C6HO6Y85AupJ5DJAXkuodi/7BxAXT8JpWgMGDVMBIa0a
	yh51yOAhWtuxYqNu6tyZDXFE9dar+CEHmbWspiFgWez/tyc4YgQmoGSnUPPxqOlACW9FDvOutaJ
	IyRh90tTDsgUTCet/1BnHBcFG0gVQ5TiRlBKsh0zBMMgNe6URTg3k0UXf+Uf8CbF2oQBk4ZsUI3
	IaHLOKPELanYZ
X-Received: by 2002:a05:620a:4515:b0:93e:4b3c:19a1 with SMTP id af79cd13be357-93f6f7e9cd4mr552285285a.44.1792775894383;
        Fri, 23 Oct 2026 10:18:14 -0700 (PDT)
X-Received: by 2002:a05:620a:4515:b0:93e:4b3c:19a1 with SMTP id af79cd13be357-93f6f7e9cd4mr552275785a.44.1792775893579;
        Fri, 23 Oct 2026 10:18:13 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d41e0fesm937475f8f.46.2026.10.23.10.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:18:12 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [RFC PATCH 15/23] ASoC: qcom: audioreach: add speaker protection mixer controls
Date: Fri, 23 Oct 2026 18:14:25 +0100
Message-ID: <20261023171433.820092-16-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX0UUGttrN6GwM
 r/sd8sAfaNfGRNA4nYpePRK8h3E12RelQwh5iRhI0FrzKNlr3ELYmfZ9bregL7C/8qTIiHIrbwC
 aOAcC/qVSkjUioSwWTLomMiWt/FKB0c4iVqcRKdmhit01mwsf/vroSinU8yk1aYT/v8Uc1bhquh
 S/1hxyTXeun0CvDqTiI+rGl1EMtxiKQtxlatf1wnjaoA/MZAIw2CNFUlKky0w4+34H+RMEo7rJj
 1fa0xY59Gj0fP2CCVnCWfk9YC6hGyS4F3M9iO4g/xO7rcBhA4/yklCljWXtU7PBJhzkYeW1Ib+A
 /N/V8NSk5cu5ldYlQ2C73/qHnHrxAHhvzn+qQJ2nZiS23Bj3ZvjNe9O7gD9nh5EkwjsbUvlYJFG
 4LMeJXvwT/Aij8rFxR8pXJ7ICsXohQbWcJO+SKZrXEPLfMQsmVMbvcDEu24vZip0UaC64j9d29S
 4jMf+IG5FvnYqiGYCKQ==
X-Proofpoint-GUID: qeQ56tZ5qGZ7PKA1u3vhaxjfxWxNmWie
X-Authority-Analysis: v=2.4 cv=Scxi5fRu c=1 sm=1 tr=0 ts=6adb96d7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=z7hZsS5TAAAA:8 a=9gDSyMU-ReTuyL3ZNT8A:9 a=IoWCM6iH3mJn3m4BftBB:22
 a=Qe1wxHrAD-1Q-kOd8w1m:22
X-Proofpoint-ORIG-GUID: qeQ56tZ5qGZ7PKA1u3vhaxjfxWxNmWie
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX81M7dE/E2tLy
 V+sGzbW8iXS9blOpFvqILqLgH8cV25aej2rZuyCdEJ79ywNMafuYTKq32UNUQYjJtBvmWbSIzEn
 utCHwDt2sVQKA0bK9Z690GHYeVnEP/E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230067

From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

Add topology mixer controls for the operation mode and the per-speaker
R0/T0 pairs, so userspace can run a calibration and restore its result.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 include/uapi/sound/snd_ar_tokens.h |  2 +
 sound/soc/qcom/qdsp6/topology.c    | 80 ++++++++++++++++++++++++++++++
 2 files changed, 82 insertions(+)

diff --git a/include/uapi/sound/snd_ar_tokens.h b/include/uapi/sound/snd_ar_tokens.h
index 7ab8e11ca5c2..db62dc7f9c8a 100644
--- a/include/uapi/sound/snd_ar_tokens.h
+++ b/include/uapi/sound/snd_ar_tokens.h
@@ -57,6 +57,8 @@ enum ar_event_types {
  */
 #define SND_SOC_AR_TPLG_FE_BE_GRAPH_CTL_MIX	256
 #define SND_SOC_AR_TPLG_VOL_CTL			257
+#define SND_SOC_AR_TPLG_SP_OP_MODE_CTL		258
+#define SND_SOC_AR_TPLG_SP_R0T0_CTL		259
 
 /*
  * %AR_TKN_U32_SUB_GRAPH_INSTANCE_ID:		Sub Graph Instance Id
diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
index 5de7e821e5f4..6316d1ab0675 100644
--- a/sound/soc/qcom/qdsp6/topology.c
+++ b/sound/soc/qcom/qdsp6/topology.c
@@ -1463,6 +1463,73 @@ static int audioreach_put_vol_ctrl_audio_mixer(struct snd_kcontrol *kcontrol,
 	return 1;
 }
 
+static int audioreach_get_sp_op_mode(struct snd_kcontrol *kcontrol,
+				     struct snd_ctl_elem_value *ucontrol)
+{
+	ucontrol->value.enumerated.item[0] = audioreach_get_sp_operation_mode();
+
+	return 0;
+}
+
+static int audioreach_put_sp_op_mode(struct snd_kcontrol *kcontrol,
+				     struct snd_ctl_elem_value *ucontrol)
+{
+	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
+	unsigned int mode = ucontrol->value.enumerated.item[0];
+
+	if (mode >= e->items)
+		return -EINVAL;
+
+	if (mode == audioreach_get_sp_operation_mode())
+		return 0;
+
+	audioreach_set_sp_operation_mode(mode);
+
+	return 1;
+}
+
+/* One R0/T0 pair per speaker, written as a whole set */
+#define AR_SP_R0T0_CTL_COUNT	(MAX_SP_VI_SPEAKERS * 2)
+
+static int audioreach_info_sp_r0t0(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = AR_SP_R0T0_CTL_COUNT;
+	uinfo->value.integer.min = S32_MIN;
+	uinfo->value.integer.max = S32_MAX;
+
+	return 0;
+}
+
+static int audioreach_get_sp_r0t0(struct snd_kcontrol *kcontrol,
+				  struct snd_ctl_elem_value *ucontrol)
+{
+	audioreach_get_sp_vi_r0t0(ucontrol->value.integer.value,
+				  AR_SP_R0T0_CTL_COUNT);
+
+	return 0;
+}
+
+static int audioreach_put_sp_r0t0(struct snd_kcontrol *kcontrol,
+				  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *scomp = snd_kcontrol_chip(kcontrol);
+	long cur[AR_SP_R0T0_CTL_COUNT];
+	int ret;
+
+	audioreach_get_sp_vi_r0t0(cur, AR_SP_R0T0_CTL_COUNT);
+	if (!memcmp(cur, ucontrol->value.integer.value, sizeof(cur)))
+		return 0;
+
+	ret = audioreach_set_sp_vi_r0t0(scomp->dev, ucontrol->value.integer.value,
+					AR_SP_R0T0_CTL_COUNT);
+	if (ret < 0)
+		return ret;
+
+	return 1;
+}
+
 static int audioreach_control_load_mix(struct snd_soc_component *scomp,
 				       struct snd_ar_control *scontrol,
 				       struct snd_kcontrol_new *kc,
@@ -1503,6 +1570,7 @@ static int audioreach_control_load(struct snd_soc_component *scomp, int index,
 {
 	struct snd_ar_control *scontrol;
 	struct soc_mixer_control *sm;
+	struct soc_enum *se;
 	struct snd_soc_dobj *dobj;
 	int ret = 0;
 
@@ -1522,6 +1590,14 @@ static int audioreach_control_load(struct snd_soc_component *scomp, int index,
 		sm = (struct soc_mixer_control *)kc->private_value;
 		dobj = &sm->dobj;
 		break;
+	case SND_SOC_AR_TPLG_SP_R0T0_CTL:
+		sm = (struct soc_mixer_control *)kc->private_value;
+		dobj = &sm->dobj;
+		break;
+	case SND_SOC_AR_TPLG_SP_OP_MODE_CTL:
+		se = (struct soc_enum *)kc->private_value;
+		dobj = &se->dobj;
+		break;
 	default:
 		dev_warn(scomp->dev, "control type not supported %d:%d:%d\n",
 			 hdr->ops.get, hdr->ops.put, hdr->ops.info);
@@ -1548,6 +1624,10 @@ static const struct snd_soc_tplg_kcontrol_ops audioreach_io_ops[] = {
 		audioreach_put_audio_mixer, snd_soc_info_volsw},
 	{SND_SOC_AR_TPLG_VOL_CTL, audioreach_get_vol_ctrl_audio_mixer,
 		audioreach_put_vol_ctrl_audio_mixer, snd_soc_info_volsw},
+	{SND_SOC_AR_TPLG_SP_OP_MODE_CTL, audioreach_get_sp_op_mode,
+		audioreach_put_sp_op_mode, snd_soc_info_enum_double},
+	{SND_SOC_AR_TPLG_SP_R0T0_CTL, audioreach_get_sp_r0t0,
+		audioreach_put_sp_r0t0, audioreach_info_sp_r0t0},
 };
 
 static const struct snd_soc_tplg_ops audioreach_tplg_ops = {
-- 
2.47.3

