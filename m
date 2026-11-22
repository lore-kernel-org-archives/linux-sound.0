Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364115;
	b=isPJCmX4Px2XFLfQYEMjrglkjYCK7CyewqGK+kOyJHAwOc+eduhkFhdtqpWRt4YC+lp+
	 qTey8UOhCbps8b5zEA6W/vYapjxY8V+079bRWBNVa3vKBxr7AIX0KOBnD/vhjVB1TiwkE
	 /8IZaq8eKCcZ5UsYlpesEc2CLo0UM6p7jKX/Ojc3sJVH2DL99rg7to7Ny3Uk8IqT9ru+z
	 qvqkhVdcRTJZFQFlEbEMgAM0GsJYqNeTpI8+7vqH8UGhXq9ICVcOhvEgd+EOxP9K2ufnc
	 hPynoicDjukUKfWmqqhZ/mI7zk3D+0nKPlFwr++bg9FCjh4w/2Xmqm7RSAXgdWQve6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364115;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5/FrKsGahA+B1P78BToKPUBey5i8SjbBdB9sdPhe2v4=;
	b=dcPMcclJBR31fQdJByLI6VdkLUApTd2ipUmFXg2iZBPfGBw1BbJx+sbq8LRlLJr661o6
	 6YEGYuouc95f5UyJskOwl6pz3kLGW3kufo0Xvd8QRvXwr6uycSzK/hHndVaNFitFqiFHR
	 y6wr+QIy8H3usrhEcXZ5VbcZdF4VmHi9KsEutiuBjjLJS//pCtF8MsmiOiO4xzo1Iqbnx
	 zAhUkIjgAk8CEPO1MGeD1p/To14bHmy47heGLi2AQspclrMbLx4OWj98qlWbi6f2i1DDb
	 pVGlK2ViLQEFT3wOZYjNNovX7xjm4msPaU/cgU/l7OmUX+rNXLEkSdIwhYq8dSAWmYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GEz+sCTP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kCWFoFEX;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C18606C55A
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 16:15:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6C18606C55A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GEz+sCTP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kCWFoFEX
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFQkgB3496534
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 16:15:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5/FrKsGahA+
	B1P78BToKPUBey5i8SjbBdB9sdPhe2v4=; b=GEz+sCTPHivOPsKKvKHmH6SuIOz
	mdhtugYvSkyJwnAFDn//gejEK4CH7ntTLT5JduxHcVfwJBfebknzWA5lnmRqI88q
	C1Ca7sfle4cm8en9LcQh2xnItMlREgheGy6OZQ/AznxJ8koAFvDWHlJAVznJyMqy
	bf9WYPBZsFSYY1NC1emOesS9shMJYD62YggtH0lgAoyohWl/SG0wfPyWWBAGLB2r
	Q7QM0FZk/lLi3sJRuE0ape1oLMDDYd1ReJ5vnbPd3iEOTO/Ajmwm5bzYvjlbQ87D
	NQucV8WuhC1PrAXLJr/0h4D0NkoUMtv60/9mi3ARhkKyoXTDcOngKc7FqwQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32mgbtwn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 16:15:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934963b2bc0so501808385a.3
        for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 08:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795364113; x=1795968913; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5/FrKsGahA+B1P78BToKPUBey5i8SjbBdB9sdPhe2v4=;
        b=kCWFoFEXdrTKBq4EFkEvbyDj6Yb8qVySvKzXjxQ5etXaWzItA2EwVdRj2ViYfHrgug
         Iz7Gfvo9M1cD9DQpt1Z92vn1wvd2rF8v+pObdrB0ZHVBQXcq9D87o6ddgWtjoEW2gyrU
         zwdjoXJmAHIIKWHrOqUUeozcIblmamJRAzNONaFy135ICSROJeODzgtHvjZkoDL+jTYX
         CyaFzHiKpI/DmP38hbPJzXMOseWxd7GBeMcVRczEEznIx0RJfFNWv1ZNcoQlvwk31+iO
         dEEVPGBo2mgTOe69XbkAhQYtVpNaVb52+HpgBzxgaD9Sahj9XEtm/oPySFl7Tj0OG0IG
         i5DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364113; x=1795968913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5/FrKsGahA+B1P78BToKPUBey5i8SjbBdB9sdPhe2v4=;
        b=tfRWZP9uHRH3TDufu83RX1/tPKQ5HtFOqenIGrWslVPuE6o00wnqFdJaoQ2ggvxWti
         B7O+/n0YtvnEeRqlaZxgdUvWLQ1w800tyUQ0PejLqd3GsxMqCkESJGiFNsKQZdow3Ajn
         59SAKYxy6PLyijUzBNTzO7oKl6jKVEOx+keDcRYvGBr7rOnIhi+3mAhTCYDOnONMV3Dd
         dTCdBHzfs2/KFFI9CAWyEEy1yeAWp8O2JxUNNa/jXYeBL45CmGetTuABDoDZ7ZXclpRC
         LIWcDtUigcqOEuxlcgJozABiUoxQcYG9h0IHpbKEecOITZA+2KalXbqI2lg1SGGTxOPM
         X9mA==
X-Forwarded-Encrypted: i=1; AL+hErFibLa32Xd3T6uERGlGNwLmNYw5ugVe+3lOh418TZaRZVuVCV3KPgjjIxa0yQpxaOWz7j1z4ObxFeVd/Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z9DAs99wNxV9Sdmi7CU8cMBsEZRobIsp771v7EuXeKOkzbKH6TD
	QASTHAx2N6bUCaWSlSZ+wJG/i4KFOKzNB9v2yNwuWkQV2FjmNdSRxLxzyk2pCPmKwUFBLYsX4WV
	H6QdUoQQSYaG9amwEqRNSFzynvAcFICRVZxhh0+UdOHJ2ihSWd3yqQUeS5wLvVOGnJg==
X-Gm-Gg: AZFdTZdlHWi/o+UxGjKvWmJzFx5XWkBVYefNiWydeKJJvy50Ue8aEfFC/+oMTZe11Ok
	2SXRh0oNkhcJKbmhobl1qgOQlgEzZTxVTLQcqUvd8Jofd672fgbUin9Up83MkeFdENbsEVhasZW
	Dfb+ywX+ef7d6WozIaj4pICUjVTvnl1B04cIgCeAIKkHik4/CAJ/cNB87T8UofzMlJl+XkVJAc5
	bgZv48Y9IJYpVhS/+a1U8xU4ojM0TomcQLlgbsjeS6o7OuF+F3q9zB4lU7zQDgXDoPu434Ed0Nq
	uvxjxoJmeaQ8LCkWH2jj1QLo8CF2FUBNc2fiCkLYDnnEmvacrEWYlh10GnJt2ebqH86j0g0vaKB
	mZ+QjxFcVCjNdUutIdl5gUE6cl/Kop/ZyfkQFIYRO3uex+Re3drJiWV3jHlheIZko
X-Received: by 2002:a05:620a:270d:b0:949:3ea1:3021 with SMTP id af79cd13be357-949bab6d711mr1536103785a.68.1795364113064;
        Sun, 22 Nov 2026 08:15:13 -0800 (PST)
X-Received: by 2002:a05:620a:270d:b0:949:3ea1:3021 with SMTP id af79cd13be357-949bab6d711mr1536098385a.68.1795364112666;
        Sun, 22 Nov 2026 08:15:12 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm239042665e9.8.2026.11.22.08.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:15:11 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 15/24] ASoC: qcom: audioreach: send static cfg blobs to speaker protection modules
Date: Sun, 22 Nov 2026 16:14:28 +0000
Message-ID: <20261122161437.5994-16-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX2BJQFshAs786
 kF/C+c271AEvUnAxu2lWwkNg7S1u0ssaT5g3r+irNN7ToR+Nc/KUU0QkWEm8tGsw3fg9gcwQsgS
 8baPHMdGbZaSkM4eSwv/CEteJhlry++x+dxX1UtFNSJ/fYmZvdlPHx6EJ5S6S4FzXdraVou2qjn
 VoavzCH/V2rolm+FSMmhVPxXcRXZ3cgL8fJiJ7Ac/NQRw5WVXVVMaKtY2pH23p2ek3ot15Ke/eO
 LZamG0iQmE+kxdGQEI4BDXJHboEe1HOm92IGGEk51hVR9PauOSYDzLhbC4FALwAVztzDw9UAI9g
 5GYCaxGuo+icdij+uMnC1LXPA5NdaVCAckBTKm0AVD8YWGESy8Xf6uAUT+/R/Z0bApw9cFEsbAS
 tszZmOHoRo+6d+JKPsfz9gC3jlJobLJXd0FpJDVVg3bboJeSeO4otpChZcvDYEpq4o1+utuB6bL
 6nbicUtNogr21xFZF1A==
X-Authority-Analysis: v=2.4 cv=OM+yTiaB c=1 sm=1 tr=0 ts=6b031511 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=OAJap1ZGhMVArrtS6vMA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX5EduUzUg4MB9
 zlcEfGALAvzQfr037VOlLndSdLJwksqRdIfKX0HvnPg2BA+NLkCOTSaURKLUOpT9KclOPEuzE8v
 mGN9n7VetX/uU40GkpTQbudEm0Dr7cw=
X-Proofpoint-GUID: rmX5GXWOKymOM-9m_KP2Sq5aKEOhNqFX
X-Proofpoint-ORIG-GUID: rmX5GXWOKymOM-9m_KP2Sq5aKEOhNqFX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611220064

From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

The speaker protection modules need tuning parameters from the topology
cfg blob, which is never sent to the DSP.

Send it once the module is configured, in small SET_CFG commands split
on parameter boundaries, with each payload padded to 8 bytes as the DSP
expects. Every record is checked against the end of the blob, and a
malformed blob is rejected. A blob not laid out as parameter records is
sent whole.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 139 ++++++++++++++++++++++++++++++
 1 file changed, 139 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 070100627809..436d33ea568e 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -1949,6 +1949,141 @@ static int audioreach_speaker_protection_vi(struct q6apm_graph *graph,
 	return rc;
 }
 
+/* Keep each SET_CFG small; a larger single parameter is sent on its own */
+#define AR_SP_CFG_MAX_CHUNK_BYTES	512
+
+static int audioreach_speaker_protection_send_chunk(struct q6apm_graph *graph,
+						    const char *tag,
+						    const void *data, int size,
+						    int chunk_idx)
+{
+	int rc;
+
+	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_apm_cmd_pkt(size, APM_CMD_SET_CFG, 0);
+	if (IS_ERR(pkt))
+		return PTR_ERR(pkt);
+
+	memcpy((void *)pkt + GPR_HDR_SIZE + APM_CMD_HDR_SIZE, data, size);
+
+	rc = q6apm_send_cmd_sync(graph->apm, pkt, 0);
+	if (rc)
+		dev_err(graph->dev, "%s cfg blob: chunk %d (%d bytes) failed: %d\n",
+			tag, chunk_idx, size, rc);
+	else
+		dev_dbg(graph->dev, "%s cfg blob: chunk %d (%d bytes) sent\n",
+			tag, chunk_idx, size);
+
+	return rc;
+}
+
+/*
+ * Walk the parameter records of a cfg blob. Each starts with the module's
+ * instance id and a param_size, followed by its payload and optional zero
+ * padding; a parameter smaller than a word may come without a payload word.
+ * Each record is checked against the end of the blob. With @dst, the records
+ * are copied there with their payload padded to 8 bytes, as the DSP expects.
+ * Returns the packed size, or -EINVAL if the blob is malformed.
+ */
+static int audioreach_sp_cfg_walk(const u32 *word, u32 num_words, u32 iid,
+				  u32 first, u32 *next, u8 *dst, u32 max_bytes)
+{
+	u32 pos = first, bytes = 0;
+
+	while (pos < num_words) {
+		u32 param_size, payload_words, avail, rec_bytes;
+
+		if (word[pos] != iid || num_words - pos < 4)
+			return -EINVAL;
+
+		param_size = word[pos + 2];
+		avail = (num_words - pos - 4) * sizeof(u32);
+		if (param_size < sizeof(u32) && avail && word[pos + 4] == iid) {
+			payload_words = 0;
+		} else {
+			if (param_size > avail)
+				return -EINVAL;
+			payload_words = DIV_ROUND_UP(param_size, sizeof(u32));
+		}
+
+		rec_bytes = APM_MODULE_PARAM_DATA_SIZE + ALIGN(param_size, 8);
+		if (bytes && bytes + rec_bytes > max_bytes)
+			break;
+
+		if (dst) {
+			memcpy(dst + bytes, &word[pos], APM_MODULE_PARAM_DATA_SIZE);
+			memset(dst + bytes + APM_MODULE_PARAM_DATA_SIZE, 0,
+			       rec_bytes - APM_MODULE_PARAM_DATA_SIZE);
+			memcpy(dst + bytes + APM_MODULE_PARAM_DATA_SIZE, &word[pos + 4],
+			       min(param_size, payload_words * (u32)sizeof(u32)));
+		}
+		bytes += rec_bytes;
+
+		pos += 4 + payload_words;
+		while (pos < num_words && !word[pos])
+			pos++;
+	}
+
+	if (next)
+		*next = pos;
+	return bytes;
+}
+
+static int audioreach_speaker_protection_send_static_cfg(struct q6apm_graph *graph,
+							 const struct audioreach_module *module,
+							 const char *tag)
+{
+	u32 size, num_words, pos = 0;
+	const u32 *word;
+	int total, rc = 0, chunk = 0;
+
+	if (!module->data || !module->data->size)
+		return 0;
+
+	size = le32_to_cpu(module->data->size);
+	word = (const u32 *)module->data->data;
+	num_words = size / sizeof(u32);
+
+	/* Not laid out as parameter records, so send it as the topology built it */
+	if (size % sizeof(u32) || !num_words || word[0] != module->instance_id)
+		return audioreach_speaker_protection_send_chunk(graph, tag, word, size, 0);
+
+	total = audioreach_sp_cfg_walk(word, num_words, module->instance_id, 0,
+				       NULL, NULL, U32_MAX);
+	if (total < 0) {
+		dev_err(graph->dev, "%s cfg blob is malformed\n", tag);
+		return total;
+	}
+
+	u8 *packed __free(kfree) = kmalloc(total, GFP_KERNEL);
+	if (!packed)
+		return -ENOMEM;
+
+	while (pos < num_words && !rc) {
+		int bytes = audioreach_sp_cfg_walk(word, num_words, module->instance_id,
+						   pos, &pos, packed,
+						   AR_SP_CFG_MAX_CHUNK_BYTES);
+		if (bytes <= 0)
+			return bytes ? bytes : -EINVAL;
+
+		rc = audioreach_speaker_protection_send_chunk(graph, tag, packed, bytes,
+							      chunk++);
+	}
+
+	return rc;
+}
+
+static int audioreach_speaker_protection_static_cfg(struct q6apm_graph *graph,
+						    const struct audioreach_module *module)
+{
+	return audioreach_speaker_protection_send_static_cfg(graph, module, "SP");
+}
+
+static int audioreach_speaker_protection_vi_static_cfg(struct q6apm_graph *graph,
+						       const struct audioreach_module *module)
+{
+	return audioreach_speaker_protection_send_static_cfg(graph, module, "VI");
+}
+
 int audioreach_set_media_format(struct q6apm_graph *graph,
 				const struct audioreach_module *module,
 				const struct audioreach_module_config *cfg)
@@ -2002,12 +2137,16 @@ int audioreach_set_media_format(struct q6apm_graph *graph,
 		break;
 	case MODULE_ID_SPEAKER_PROTECTION:
 		rc = audioreach_speaker_protection(graph, module);
+		if (!rc)
+			rc = audioreach_speaker_protection_static_cfg(graph, module);
 		if (!rc)
 			rc = audioreach_module_enable(graph, module, true);
 
 		break;
 	case MODULE_ID_SPEAKER_PROTECTION_VI:
 		rc = audioreach_speaker_protection_vi(graph, module, cfg);
+		if (!rc)
+			rc = audioreach_speaker_protection_vi_static_cfg(graph, module);
 		if (!rc)
 			rc = audioreach_module_enable(graph, module, true);
 
-- 
2.53.0

