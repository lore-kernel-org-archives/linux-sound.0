Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775899;
	b=QykYgC0BZllspT8KXrCkw5IA0k9qmGAA4gfTVvCQtsiBLZ79hgEU+guG4ks5ycAfTwFd
	 R3kfbgUVpn7ChZDiYNd2GPCy2ScbQ1GjD7bkb8N3n3yF8QjV/sDb4oIvu7sz6GV2u51Pd
	 f4bJyT6AlK17Vy/M/h+IpAHrh+UltPfbxMiolw8THsTjmKIpFtRLtnzKuqVcIHVagsndP
	 O8jACfzO6fo/HPRpTSJ5OXTpxzs/W2oI875YE0ve3tOr0uo4iPZ6+n/mGQhKxc6fM/aHw
	 zl0LKqrbQ+PoaisQVtoTxhHcNezgL1JprUBhLOUqodwyLwiUR0Nz/RhSav68gA3KVWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775899;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DZfg246TfQNYtunz0I9gt0EsxySLDi22L36IzvOxp2U=;
	b=PLbP5vwh5z2J0Oy/51gO/GXGnoGNVx18+ql2VLRvMRXcOSIWOYM+P4X2XFRjVsTyCQDf
	 JFRoKRlUi0ToDFm4DOlQa+DvSzDaACydYgds82S5ziukvl7gguzDxYqJJAJTPnQQIoB4R
	 Kjp/bjRdrIJFk9gFoGeqH7y6GBgc1Pq1AZEJFMGCN47tKKdeUF9No4ON8Bs+ZZDaSoThO
	 7sRlitST4GmRnJdwmNWyL+NF/Nr9eOSzR7iXUPCEdOvtF8Fl4Q+Isg5M/d5joWkQGpbvg
	 HDd/QJ4pwF6l/bsBFsHY7iUzphDKJuvom1Hqd0DNo31y2j9FWzTVPs5c+ZTlPqU1tcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c9XFIlA2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GT6jvuoU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DF7606A976
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 17:18:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52DF7606A976
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c9XFIlA2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GT6jvuoU
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NG6Cgd2215814
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 17:18:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DZfg246TfQN
	Ytunz0I9gt0EsxySLDi22L36IzvOxp2U=; b=c9XFIlA28Y73lvz+5dq2//1lUGL
	VKgarBj45iMCPHAYBwkiMulg82OsyJ+MY7u20+5VgBmWCLyVn9tb0yWrNYLAkfiW
	4jMCWR41NOS87rNOvQj0atc8nyzqcaDNwz3zKbW7L0iPyBG/xkWNTXnd81hIK87l
	62gzZQhuVlCRXz+HMGm6bQB/HX6mf3KGHQVrRbBHzY3O4zIoS0THO2ijS+AvvQlq
	FGZ+8P15fL3T0Y8YEgz/uQY1B24zCJLQ7k0kv9UBbXQylJEcen3OezjNB4vHeRVO
	QvDyEaxTPqxF8BSbUhBdA0qOyFBcZgRb5euXhA1BYJrCPH3TggDpGCcTx5w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgatc895d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 17:18:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ce7a85f04so222499785a.0
        for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 10:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775897; x=1793380697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DZfg246TfQNYtunz0I9gt0EsxySLDi22L36IzvOxp2U=;
        b=GT6jvuoU9QS3+S74DLDt6SKuUfyyWPUc3Pkov4dOw8QuSXxfY/sDXMliyC1YI4X3tp
         TO+8e8tcuK+UMNsxbC/mvFmhioFu9MrJwm3hXSZzkT+GGLW5f+3E7eDHnRWU3n2NDCvr
         DXuV4A9YHWPgcwVoklcUIzQdOIPDvamOS4IHKuiqN/S0QNUlsGuMEIGB5KDgNILVmPY9
         JJNqaDbUuHGFEZ7MZHnOq9xtASCOSCsAtrBhgBYRtTZ7xSeg9t+n+wpVyqCelJkA1/DV
         mOEr/E85rknnG5yOAo0uen0d3Z6shpxKB9yZI80FHW62ljL0vxtUpnYkKiD2+a0dCNQU
         IgJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775897; x=1793380697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DZfg246TfQNYtunz0I9gt0EsxySLDi22L36IzvOxp2U=;
        b=n0CSVTtV8zA4XQ3ohn2i+qfWuzVdEX38CQuCsIqV2tuyN0wDWz6wPMF3uF+w5HsLi2
         o204qOmxKI623C40pzY2033NACE+aqPka7xXZY2L3kTH5WWeGPeuOuzvzxXbF5uRs4Z7
         Tg30vfFhD+aCpVbRKOuEX1I7zv+RVc5XDWM8WxN+K3qf99tOGa7f1gy/camjmHYvM3w4
         F5cI6eIOxBl3PVL97kQLHiqqwweHhvM8EfJ/Okmu7kMamSIDKnVLvRAk9xP1LDhjlX4b
         ZhEmyy9WjjPRECGNh3fW0cN9PsdPEfaWweTW2l6vfet1wwk66U+51yT+zBnU70lul8Vn
         xYlw==
X-Forwarded-Encrypted: i=1; AKwUvBwQ1bRcpOoBSxaCdOST+TtQygnecV/4wPdWC1A42okfRdtWk6fO79Ak4jat443B7uW+r5SviDY+aX9KtA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKsVY3QlhmpGvl5zpVAIQhFwYLenjcV8Arex1fZ4glUQnQw/0u9
	oCmUt5CVN8O8aSHjhmGsfs22AhgywCeIfmzkZQgSj4uJg3YJpNOlYdPvbJPdjqW4L7CAWA8dzkh
	tdigLY9fQz0UmWSF0AoBdSK/fIjC9Vn5tJgvMMSQCtUn9PX1vQz15hitT4TviMXg6AQ==
X-Gm-Gg: AYBFou3OPFwvGSHH3jWQGbNiGw0DK7Cq5+XTvXAOG6pLUqDu1MIIdg82mPz2NvIo79q
	Z9koOPfD5FVaumiOC93pvYMSzVvlD8Ykah7kzZg+zj94U1/kSiOHP6S5RKVWWfTbDYYUq1ckarw
	MX+aWlkfdUfQydBwKymnl2186EfWun6QC39Mu/oeVAJ11Wpyg/SmRn6dggQLjXXdEpUpbCJi2jK
	nb8WtwgMgI2EhwadGGfVvCtUNZERxDuYrM3ZNimIJnzsWG1FqT6L1BvEOP4vl12s+VleuZQ7jJy
	FqJj4oT98/0NswJPitb8VvRoIrYf4EsigjZjPYXeO62iE9lvTV0VwWLucuWJtiLC7fbiT9UVetz
	W42kvupQurZPX
X-Received: by 2002:a05:620a:4542:b0:93f:1dbf:6cf9 with SMTP id af79cd13be357-93f6f795ea5mr513761985a.33.1792775896774;
        Fri, 23 Oct 2026 10:18:16 -0700 (PDT)
X-Received: by 2002:a05:620a:4542:b0:93f:1dbf:6cf9 with SMTP id af79cd13be357-93f6f795ea5mr513755185a.33.1792775896248;
        Fri, 23 Oct 2026 10:18:16 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d41e0fesm937475f8f.46.2026.10.23.10.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:18:14 -0700 (PDT)
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
Subject: [RFC PATCH 16/23] ASoC: qcom: audioreach: pin SPEAKER_PROTECTION_VI media format
Date: Fri, 23 Oct 2026 18:14:26 +0100
Message-ID: <20261023171433.820092-17-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX7w1zmDFDvLKX
 FvOTMdRwO8yzv7wCZT+zhr/6VT0vBn3uRmAtTDvGlJsdd90LYJRqrHyRpeZw3x0O8oIOHcBOMtP
 3PgMInNQspa/vOrFZPta8Y9W6FKxxdE3zXSXddyUZGutxnH4VfCM2PldwZsg0/2jVWNKBNeDgcw
 F7Rx1wXFFayKRk8J/nRig+w99sNY/TjYY86D/hEBt7dG5za3kUUF+XjS77q0LaH8rjW0TFWqSLW
 wwaHNGJOS8Mu7Gquyn253oQ6uB8pKLKmaI2DwyORFfKcdSN3kk7WcwkXDT/eh0neQRcDeiJ5X2v
 hLxIGXUjZpjyrWEuH15lEq+grRhXlim8iScE/LGWJBGu+SVdrhfED9Iezzx4DL0jZIYAEntg2Vp
 OZjeKJJ4KF9Ifyk8aZ+wcMgVA2XEtlSFi90l+9tNDBf8yLwuMNThlWsopFAnjKKbbFFKSM8/jJc
 J6VSA2T7XJJFaJGI3eQ==
X-Proofpoint-GUID: wvI-zBhLb1jTFc4Rgy5XEmYzK7ff8qp6
X-Authority-Analysis: v=2.4 cv=Scxi5fRu c=1 sm=1 tr=0 ts=6adb96d9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=2Irll14qWxTS2nb0BqIA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: wvI-zBhLb1jTFc4Rgy5XEmYzK7ff8qp6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX17sN3thjrbXa
 nSkj1PPxMukLzyRqOu1mtl4e2EZhqofE/91IfgygmKF3l4CavYStv91bIvEFPTGxbXsGD4mtuuK
 +fvGS3cU/s8qD2jm5uzqF199inBIjxw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230067

With multi_direction_codecs the speaker protection VI subgraph is
opened with the playback stream's parameters, but the VI module and its
codec DMA source always run at 8 kHz and 32 bits.

Use those for the VI module and the codec DMA source in its subgraph,
and keep the channel count, which follows the number of speakers.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 089cc9dd76fc..d027c763eb25 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -2033,12 +2033,41 @@ static int audioreach_speaker_protection_vi_static_cfg(struct q6apm_graph *graph
 	return audioreach_speaker_protection_send_static_cfg(graph, module, "VI");
 }
 
+static bool audioreach_sg_contains_sp_vi(const struct audioreach_sub_graph *sg)
+{
+	const struct audioreach_container *c;
+	const struct audioreach_module *m;
+
+	if (!sg)
+		return false;
+
+	list_for_each_entry(c, &sg->container_list, node)
+		list_for_each_entry(m, &c->modules_list, node)
+			if (m->module_id == MODULE_ID_SPEAKER_PROTECTION_VI)
+				return true;
+
+	return false;
+}
+
 int audioreach_set_media_format(struct q6apm_graph *graph,
 				const struct audioreach_module *module,
 				const struct audioreach_module_config *cfg)
 {
+	struct audioreach_module_config sp_vi_cfg;
 	int rc;
 
+	/* The VI module and its codec DMA source always run at 8 kHz, S32_LE */
+	if (module->module_id == MODULE_ID_SPEAKER_PROTECTION_VI ||
+	    (module->module_id == MODULE_ID_CODEC_DMA_SOURCE &&
+	     audioreach_sg_contains_sp_vi(module->container ?
+					  module->container->sub_graph : NULL))) {
+		sp_vi_cfg = *cfg;
+		sp_vi_cfg.sample_rate = 8000;
+		sp_vi_cfg.bit_width = 32;
+		sp_vi_cfg.bits_per_sample = 32;
+		cfg = &sp_vi_cfg;
+	}
+
 	switch (module->module_id) {
 	case MODULE_ID_DATA_LOGGING:
 		rc = audioreach_module_enable(graph, module, true);
-- 
2.47.3

