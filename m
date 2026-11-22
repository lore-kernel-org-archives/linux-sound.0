Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364101;
	b=nzSLRR+Tnhm3u++6wo3CBTbWSGgvCLKPrOISzWPDBJgG98K/v+z+Jc8mvRVp1RsxGEsl
	 oiVaTu0SEkTo4+3sKnSQ0dlYBr6UteIcwhRJoOhGpbKgyo2BFDo1bnT+eGmBsUP7tUK3a
	 nMwj93pZbGX2F1BO7UzHvRVq8KnTZzPE5OBFOT+iq7IbMW3bTV7eWo3+2KW1t5v+P7p3+
	 KTVR6McMq5q+cDrRHrv/ZhNOtRkbuudyBNIk2kjOBM38xBx6YH7kF9OVtxoJ43qRJ5AeT
	 r5CkDXInaJqj9kBnoCm40bwF9l644zTdqrSHCmnV3jRpJkUYwS+g385I4walgFOUr3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364101;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Vj6W0qz0lVqcEFgFOyaDJXDvnQ++m4swtMz3IhnTtyc=;
	b=1whdjbzxHBrmDJrGwAOS/buo5FxDFdGCXSl6UrnQU7wgd45U/I9BnJfKgaeN99MIz/TP
	 i0Lf8j7DuCC7oFcdNMbKcT/5cVR6dGCkhuL+WPj20hh0GqAl3Ac+DjyX4D9ZlmgfiNHTm
	 cBHXSh/7W6coi04XqY5FI+rd2AFLphyVMZcJU7Y9gbhSxjpNAJQF+ZvOfGzlePYNA5c3a
	 CcFUSk32eRPiQJ0VrcZEt/FWybp/tUAlJgAtheKP8n3oxfsNvV9755UjjYDrt6ZIWT/mg
	 ZWdRU+DYPQ8uJu2nnqGHnMRYn7PWrve7GduuEC4kqVUjOMn4czIh7AtA8XiWRsfAaXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G3PFhNa+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fJc0Da6L;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A49460A2633
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 16:15:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A49460A2633
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G3PFhNa+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fJc0Da6L
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFSQuA1251701
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 16:14:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Vj6W0qz0lVq
	cEFgFOyaDJXDvnQ++m4swtMz3IhnTtyc=; b=G3PFhNa+ZVL0wak1CsNwxu6K92Z
	u2NROKfMkhYpBeOnvzSoxwyP2q1oLsDf2v9UoYlIq2qMTpA6iJhXQUpaLxUq90cx
	3r3eNwVxVpzygFbX4PhtL5KjRKGxb0TbydiHqWGBZ2+swzaJ1O1Pk/yk1Vxo3dhv
	sYu/YDQbAZSOrGucvcS2fP5waiQ+RUoZrEkezzY/ieAxmFiVZKl0P0lTDl86s3b+
	dfGIWW0JS+9CHj0Dk3LlDD7+dvq0mWp3HDmZEfqmkt/+aGXkYfCugbXg0O21fAsC
	AViPq+VVOETJt7ZaNzFEvvaboiyvO4qPNAH3tyOI5C/bC50D0inQx7ZCLRA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32w03ru0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 16:14:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-949dc497896so56152285a.0
        for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 08:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795364099; x=1795968899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vj6W0qz0lVqcEFgFOyaDJXDvnQ++m4swtMz3IhnTtyc=;
        b=fJc0Da6LLomYikgBQgVs7Whf5yJ2g2L2ZG6mDoSPspTDd63ay/14yArU4GCOtF+M9+
         /e+xwwLunRVKk20x06uGc7HaKauge7RzwVxBnpxcleYI2KQalh1lGb64rJqhSz6T3HC2
         Y9BaNI5sDEg/QhfX/nOnx1jpXL/bG2Wn1W6oXUyqK/5AbJMl6lrxWMo8x70Gx5Uwk45o
         Gu9Za69KWftEnjE6755xT3pgqFLti1Rgivs3tadi+7Oer4OJYs8HPtRuLhdhQTZ9HSUZ
         X9pVCKMMO7q9VzvsH0pRraN+eDQ+QDcp8LX6eWok64/aLqfMCUdKffawl+uvsUbNuJB4
         PQDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364099; x=1795968899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vj6W0qz0lVqcEFgFOyaDJXDvnQ++m4swtMz3IhnTtyc=;
        b=l1Q3ty1wbPoJuVu4ZEdSbMw73ADd1GiZPSYvXU3T9I6/RwJ+J33uiN/IzeVrZC6rkg
         xSZnTuN3VbYFD17+dGngxFtK7hTt9WtXSkSciHY7LkZZcnTWri4YnUTEahIz0o7GyBwd
         bd/E5aq5LuoaazGSjOJBA1fy0mCV5lCbNRzoF/lHnnz62HiMjBhcfd33OfQnsXdXnUmG
         Fse4F48jAck2k60t3QBhFRBCvM3tQAk6K3s2jja9z5BLzcETruF6ZEK7isDUaq+J1Omq
         u/peiDMJK8mJDqR5L5exI4bxZAjPtgysPs0MZ7VM0r+qAkzs6FxuB+gwou+uqyuMD/fJ
         lcxQ==
X-Forwarded-Encrypted: i=1; AL+hErEpY8FFrZhOYYEOpTlwQqWzVy1QCdQUL20gOdMDRLgxHODT6gCfJKj2CrfmDsrrrCXh6I0cjKm9eSoApA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8NXeA7uJugWFlptUB9rMihmcIqNnfpXDyIFdRgMLaeGDIlFCn1
	MaVRud2/oe/u0PUjOfoS8HWNEeuU9q9UJt+CuNnZfoVySNk13kV7KFWM82uU2iHijDBOgOUvyFf
	JA8S0CdCP/8cmYxKLQRh+QfDB+CYlTRDm1gdu9rwCBvyT1nWtr3FyhdyRhIKOjWrlUQ==
X-Gm-Gg: AZFdTZfGrRUnjWZf8cEciASPC7DpY1zC0xGD0sjVflDdrgxZPYRMkkb7Z/uQcEL3DVS
	UTD5tjPKhv3jK+8Y+eNNXRb1DUArqo0ZO1UphlvosrcuUqsAod2mBkhwlIYSd9xpVC0MuQ2qgie
	LTcsZqa6fcSGCjUGCo5DgDKXyeXZUm9SACrySGCgeoq4m7ferbDoSLv0cI3tvr2CpOpOf4OoH1J
	oR5jDMt31fmlHlehwWUsNtfodG9cVvuRDYd9ob+/NTS+7Ocgfmv9aD1EeWCSpxsxUMDZxrrMIFj
	LM7+eOLFGds/V1zLr/ZjGeRgJ5PV/87HKmxzA7viljEE7NhFPokeykEZCMph/F4dpMMUHGziUIJ
	AC7sB61e5eh1bBCky8kSNINYHsqeyyUYb95I9em4IQfTcyubhjnxCtz0Njr6om+Tn
X-Received: by 2002:a05:620a:2b9a:b0:93c:62c4:e2e2 with SMTP id af79cd13be357-949ba8246e2mr1521956385a.12.1795364098911;
        Sun, 22 Nov 2026 08:14:58 -0800 (PST)
X-Received: by 2002:a05:620a:2b9a:b0:93c:62c4:e2e2 with SMTP id af79cd13be357-949ba8246e2mr1521950385a.12.1795364098203;
        Sun, 22 Nov 2026 08:14:58 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm239042665e9.8.2026.11.22.08.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:14:57 -0800 (PST)
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
Subject: [PATCH v2 06/24] ASoC: codecs: wsa884x: add VI sense capture DAI
Date: Sun, 22 Nov 2026 16:14:19 +0000
Message-ID: <20261122161437.5994-7-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX6rp5fOcwGcKS
 KoQQzke6gxz9o0T4SwUsjy+9AY7T72eTWAhPZ+WXHjiLziRtD6VMbV0RccBb+NLs+qeZqBJhCYB
 GpkxXse4d1DV1Puj1Bw/rTB8Mc3/DmCaAPuAcgY9eMilRf3VXC7dyFyfKcxxwjtu1haP39ytb+x
 43/Sdp2hJYG1YdqjVVje+q3ZE9YT7wo3fWFl+X79Vu6tbqVdVCoVmWEEadk+3QZwsmb6P4oL38k
 kTWgum7oMbmpHwQH65ElMCUeroPFsjPMQON5BoItfPyCMtbYDt/HjaGHXZmTmfWSqo/HJxt3YWm
 RyDR7dW/NpI7LfsvT9Ai4253w2ESPTZdnf3CCl5EyPTaFfpP1rqPVFH7Xo4OGFMP2C8Qb/A9AHQ
 Oq7+hDi0w+HVRUka4Je7td9gvsXsLXaeNC8WzoK7M36kYQgZP7dyVrNtgV6wV96RIcrB+OwZnQX
 n+sPtLLuyanV8wHbwrA==
X-Proofpoint-ORIG-GUID: OhrsEyUVWmSy6xGo376WNYn5TAuUqCus
X-Proofpoint-GUID: OhrsEyUVWmSy6xGo376WNYn5TAuUqCus
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX0Uu2mmINnCdq
 7oUCQL3EYqM1tWCVCyUoiWd/BCBZF/4NY+cdcGabfswGSEHmEdxE3lTdFefj9EBRmc8bqjFZMte
 A8mmPV+EuO8MrrQrxb2d1ibGgQG4TR8=
X-Authority-Analysis: v=2.4 cv=S+dMU4sP c=1 sm=1 tr=0 ts=6b031503 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=mD6ITISG3cOiDhduhQgA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220064

From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

The VI sense port carries the voltage and current sense data that DSP
speaker protection needs, but it is described as a sink port next to
the playback ports and has no DAI, so nothing can capture from it.

Make it a source port with its own capture DAI, ops and stream runtime,
and leave it out of the playback port list. sdw_get_slave_dpn_prop()
searches the sink port properties by count, so pack that array densely
now that VI sense is no longer in it.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/wsa884x.c | 95 ++++++++++++++++++++++++++++++++------
 1 file changed, 80 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
index f58ce92c46d4..91aa004d7137 100644
--- a/sound/soc/codecs/wsa884x.c
+++ b/sound/soc/codecs/wsa884x.c
@@ -732,8 +732,11 @@ struct wsa884x_priv {
 	struct regulator_bulk_data supplies[WSA884X_SUPPLIES_NUM];
 	struct sdw_slave *slave;
 	struct sdw_stream_config sconfig;
+	struct sdw_stream_config vi_sconfig;
 	struct sdw_stream_runtime *sruntime;
+	struct sdw_stream_runtime *vi_sruntime;
 	struct sdw_port_config port_config[WSA884X_MAX_SWR_PORTS];
+	struct sdw_port_config vi_port_config;
 	struct gpio_desc *sd_n;
 	struct reset_control *sd_reset;
 	bool port_prepared[WSA884X_MAX_SWR_PORTS];
@@ -822,8 +825,8 @@ enum wsa884x_mode {
 static const struct soc_enum wsa884x_dev_mode_enum =
 	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(wsa884x_dev_mode_text), wsa884x_dev_mode_text);
 
-static struct sdw_dpn_prop wsa884x_sink_dpn_prop[WSA884X_MAX_SWR_PORTS] = {
-	[WSA884X_PORT_DAC] = {
+static struct sdw_dpn_prop wsa884x_sink_dpn_prop[WSA884X_MAX_SWR_PORTS - 1] = {
+	{
 		.num = WSA884X_PORT_DAC + 1,
 		.type = SDW_DPN_SIMPLE,
 		.min_ch = 1,
@@ -831,7 +834,7 @@ static struct sdw_dpn_prop wsa884x_sink_dpn_prop[WSA884X_MAX_SWR_PORTS] = {
 		.simple_ch_prep_sm = true,
 		.read_only_wordlength = true,
 	},
-	[WSA884X_PORT_COMP] = {
+	{
 		.num = WSA884X_PORT_COMP + 1,
 		.type = SDW_DPN_SIMPLE,
 		.min_ch = 1,
@@ -839,7 +842,7 @@ static struct sdw_dpn_prop wsa884x_sink_dpn_prop[WSA884X_MAX_SWR_PORTS] = {
 		.simple_ch_prep_sm = true,
 		.read_only_wordlength = true,
 	},
-	[WSA884X_PORT_BOOST] = {
+	{
 		.num = WSA884X_PORT_BOOST + 1,
 		.type = SDW_DPN_SIMPLE,
 		.min_ch = 1,
@@ -847,7 +850,7 @@ static struct sdw_dpn_prop wsa884x_sink_dpn_prop[WSA884X_MAX_SWR_PORTS] = {
 		.simple_ch_prep_sm = true,
 		.read_only_wordlength = true,
 	},
-	[WSA884X_PORT_PBR] = {
+	{
 		.num = WSA884X_PORT_PBR + 1,
 		.type = SDW_DPN_SIMPLE,
 		.min_ch = 1,
@@ -855,22 +858,25 @@ static struct sdw_dpn_prop wsa884x_sink_dpn_prop[WSA884X_MAX_SWR_PORTS] = {
 		.simple_ch_prep_sm = true,
 		.read_only_wordlength = true,
 	},
-	[WSA884X_PORT_VISENSE] = {
-		.num = WSA884X_PORT_VISENSE + 1,
+	{
+		.num = WSA884X_PORT_CPS + 1,
 		.type = SDW_DPN_SIMPLE,
 		.min_ch = 1,
-		.max_ch = 2,
+		.max_ch = 1,
 		.simple_ch_prep_sm = true,
 		.read_only_wordlength = true,
-	},
-	[WSA884X_PORT_CPS] = {
-		.num = WSA884X_PORT_CPS + 1,
+	}
+};
+
+static struct sdw_dpn_prop wsa884x_src_dpn_prop[] = {
+	{
+		.num = WSA884X_PORT_VISENSE + 1,
 		.type = SDW_DPN_SIMPLE,
 		.min_ch = 1,
-		.max_ch = 1,
+		.max_ch = 2,
 		.simple_ch_prep_sm = true,
 		.read_only_wordlength = true,
-	}
+	},
 };
 
 static const struct sdw_port_config wsa884x_pconfig[WSA884X_MAX_SWR_PORTS] = {
@@ -892,6 +898,7 @@ static const struct sdw_port_config wsa884x_pconfig[WSA884X_MAX_SWR_PORTS] = {
 	},
 	[WSA884X_PORT_VISENSE] = {
 		.num = WSA884X_PORT_VISENSE + 1,
+		/* V and I sense pair */
 		.ch_mask = 0x3,
 	},
 	[WSA884X_PORT_CPS] = {
@@ -1767,6 +1774,27 @@ static const struct snd_soc_component_driver wsa884x_component_drv = {
 	.num_dapm_routes = ARRAY_SIZE(wsa884x_audio_map),
 };
 
+static int wsa884x_vi_hw_params(struct snd_pcm_substream *substream,
+				struct snd_pcm_hw_params *params,
+				struct snd_soc_dai *dai)
+{
+	struct wsa884x_priv *wsa884x = dev_get_drvdata(dai->dev);
+
+	if (!wsa884x->port_enable[WSA884X_PORT_VISENSE])
+		return 0;
+
+	wsa884x->vi_port_config = wsa884x_pconfig[WSA884X_PORT_VISENSE];
+	wsa884x->vi_sconfig.frame_rate = params_rate(params);
+	wsa884x->vi_sconfig.ch_count = 2;
+	wsa884x->vi_sconfig.bps = 1;
+	wsa884x->vi_sconfig.type = SDW_STREAM_PDM;
+	wsa884x->vi_sconfig.direction = SDW_DATA_DIR_TX;
+
+	return sdw_stream_add_slave(wsa884x->slave, &wsa884x->vi_sconfig,
+				    &wsa884x->vi_port_config, 1,
+				    wsa884x->vi_sruntime);
+}
+
 static int wsa884x_hw_params(struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *params,
 			     struct snd_soc_dai *dai)
@@ -1776,6 +1804,9 @@ static int wsa884x_hw_params(struct snd_pcm_substream *substream,
 
 	wsa884x->active_ports = 0;
 	for (i = 0; i < WSA884X_MAX_SWR_PORTS; i++) {
+		/* VISENSE is driven by the separate VI capture DAI */
+		if (i == WSA884X_PORT_VISENSE)
+			continue;
 		if (!wsa884x->port_enable[i])
 			continue;
 
@@ -1800,6 +1831,16 @@ static int wsa884x_hw_free(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static int wsa884x_vi_hw_free(struct snd_pcm_substream *substream,
+			      struct snd_soc_dai *dai)
+{
+	struct wsa884x_priv *wsa884x = dev_get_drvdata(dai->dev);
+
+	sdw_stream_remove_slave(wsa884x->slave, wsa884x->vi_sruntime);
+
+	return 0;
+}
+
 static int wsa884x_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
 {
 	struct snd_soc_component *component = dai->component;
@@ -1829,11 +1870,20 @@ static int wsa884x_set_stream(struct snd_soc_dai *dai,
 {
 	struct wsa884x_priv *wsa884x = dev_get_drvdata(dai->dev);
 
-	wsa884x->sruntime = stream;
+	if (direction == SNDRV_PCM_STREAM_CAPTURE)
+		wsa884x->vi_sruntime = stream;
+	else
+		wsa884x->sruntime = stream;
 
 	return 0;
 }
 
+static const struct snd_soc_dai_ops wsa884x_vi_dai_ops = {
+	.hw_params = wsa884x_vi_hw_params,
+	.hw_free = wsa884x_vi_hw_free,
+	.set_stream = wsa884x_set_stream,
+};
+
 static const struct snd_soc_dai_ops wsa884x_dai_ops = {
 	.hw_params = wsa884x_hw_params,
 	.hw_free = wsa884x_hw_free,
@@ -1856,6 +1906,19 @@ static struct snd_soc_dai_driver wsa884x_dais[] = {
 		},
 		.ops = &wsa884x_dai_ops,
 	},
+	{
+		.name = "VI",
+		.capture = {
+			.stream_name = "VI Capture",
+			.rates = WSA884X_RATES | WSA884X_FRAC_RATES,
+			.formats = WSA884X_FORMATS,
+			.rate_min = 8000,
+			.rate_max = 384000,
+			.channels_min = 1,
+			.channels_max = 2,
+		},
+		.ops = &wsa884x_vi_dai_ops,
+	},
 };
 
 static int wsa884x_get_temp(struct wsa884x_priv *wsa884x, long *temp)
@@ -2091,9 +2154,11 @@ static int wsa884x_probe(struct sdw_slave *pdev,
 					WSA884X_MAX_SWR_PORTS))
 		dev_dbg(dev, "Static Port mapping not specified\n");
 
-	pdev->prop.sink_ports = GENMASK(WSA884X_MAX_SWR_PORTS - 1, 0);
+	pdev->prop.sink_ports = GENMASK(WSA884X_MAX_SWR_PORTS - 1, 0) & ~BIT(WSA884X_PORT_VISENSE);
+	pdev->prop.source_ports = BIT(WSA884X_PORT_VISENSE);
 	pdev->prop.simple_clk_stop_capable = true;
 	pdev->prop.sink_dpn_prop = wsa884x_sink_dpn_prop;
+	pdev->prop.src_dpn_prop = wsa884x_src_dpn_prop;
 	pdev->prop.scp_int1_mask = SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY;
 
 	wsa884x_reset_deassert(wsa884x);
-- 
2.53.0

