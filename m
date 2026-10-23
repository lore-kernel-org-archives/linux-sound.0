Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775903;
	b=SVkDormeGPNv2vcXkCc5IHpfveZxX7UbrwC0xwjA4QaSqwWjiLKaD/EzKEGpTp0QerTC
	 Sv3wRO4fEYDaH9AIDEhSOArobGTv/l9rtZr9/oSeqMpz1I+uCBEHvqkadzIi+EuYGhwwM
	 c0yb7qnD0uHB1j1WIIoYcVH7JQ3H22yQR5YBHoRTZfxbpYHDT2gzgev1z9gmtAvG//21B
	 xWNvXfeXZA0kPfk7ZQqGwEhGyAIK8CFx0vxhplawoHqEhdNQjzCxvwDXK8/JmTkyuhItc
	 jdWjJpSkzeCkXjwmha0YXU2mnGRjuE/jctTgrSsj8PofPMkhBggF0JdJ9fhs4IHtv+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775903;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=M9b4xWrqlE0Kv3+ymwpxhoecVabQr8ouhVupqXjGu1k=;
	b=VNEt3XYyznPUHpgy6cSsWj/EkuSwgSY/NkEBTGyh8pudChPmCRZdrxzlFwIEJJgRhRtv
	 oUBMK6RBfT4iF+ZpyJk3gzFrmalGqjFupOiauHSWsl9iWQBbi3J6PbY9ZDUQ4FSKhYP+k
	 vbResu7jaFxA8a/0iAtemnIxmkVsWqXCqFQIF2tnTQxC+HbC2oL8M/CD3qGRHhSlSFVnO
	 XZvltzhid8WdMtthfPQ+1jK9geixExmsotj70ncM4rR9ZgtprMI7fbHWmFdaNxIopBWCR
	 V6S3IrInLqPjR1QJrWxi5nzXBbaMzP5b+DHtbzzqSvvW41Pc6wAe3KNYWnu8OZgjV0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N7asCZYZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aoY4qbfu;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7704560A3807
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 17:18:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7704560A3807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N7asCZYZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aoY4qbfu
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NG34443734767
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 17:18:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=M9b4xWrqlE0
	Kv3+ymwpxhoecVabQr8ouhVupqXjGu1k=; b=N7asCZYZQ/M79q0CDhsr6wTFxhv
	5sGz/fRJYD/XXFByGPOAcdh+zXgky2vNSK2rm3lRpd7pYj2ExswyOEA2f8R3C2XK
	+hTA/KAgPw2FJJpGe5yG4wBXWXP36bpn6cWbwiLQdmENul+wLYUoY555IG1nL4Bb
	HKMLAkPXc5Ev9C3UvoN4yjuZHy6jD4T6aR9DpKPT7YOXd8STzrxSHtxiMOvUn2ru
	1cNrs6UU9RXb7rTRMZna+CUlDhWy6A0Zy3+MSBDZ+UxF6nlcnwt8pCHOMT3i0AQ/
	i1vgalvn3sc3Xkc9hbzUyxAyc/xhAz6HJqMXQxXxHD8+FijP1GNpw2bXXuw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgarug9f3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 17:18:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f37c94ceeso438834785a.1
        for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 10:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775902; x=1793380702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M9b4xWrqlE0Kv3+ymwpxhoecVabQr8ouhVupqXjGu1k=;
        b=aoY4qbfuWYIAR8W9rBEtMQzfYepdax1UjkB4LVKkV5tzbmhf0kf+H/Uw3vshdnHMXC
         KvhCrG7XyBaDdYOK4z582xswZn7GcU/h+cGUcNVMDTXm8JHFisv9cIZVk7Y+elhzpgGW
         L43SIbkWwz5Sw37NQp3t/figIeyOfCZcxOxn0rLoYCZ5n4x6QcbjRZtNeWtJYIBZrU+9
         zPqabqsfv1wiqiLbKeZtkOqpe3qrOdaTPFoeaQFBKv1mCAquJHLHgZMdziN3pj+bCiC8
         lI8KX642n29RVhDfk7O7fw4CN40kMN8LRZH/LPbyuKaq/+zNTGHnTMn9etno0WY850mk
         qemQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775902; x=1793380702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M9b4xWrqlE0Kv3+ymwpxhoecVabQr8ouhVupqXjGu1k=;
        b=0dHyl2YyG/4EeLjRe9J9aAO3t50J8dzmj7wKU/dWfR46gAptV7ytG/pkaufmkezcgj
         +0h+XNaRqhQt4ec2emi3cVdfsFVV/kYCWdA7WZhpT5QN1rwHX6J83Gyh3XhREWVQXbKO
         MOmfu96oIyWrousI5AM2cS7OcURJ2B9fVcCOdbmXKl9iUv0i1agqS1+Zu2dETTfVftal
         4tV+2WYQGkZxLa6REZecfOTZXdJ3Ql1DBD6JYpyejHCk1oOw8m3o4QEB6m2buatnI7KU
         nKewwSzuy+4ZsS8H1Bc2G89g2c8CzzgqyQvuZihfkjKRdjp99oX8pF3piBtfJ7kPqQ/E
         obog==
X-Forwarded-Encrypted: i=1; AKwUvBxQGsySWpNNlAO+UtGHtquRhzPWUNilkg4WGgmAyK1G5vNzSOrZTyE6DNPIg71rl6VuVYv1bpri9nNxKA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIyMW4ACD6JPbsKiA59TtNgJjhyS3hnuraJRebGMvhx5ZkghhuN
	fU8BohiV0YEJGcteCR9fi7lfQ2Vxa1mVe2PD13a3U899dr1iKvx60iKv64iBDYZ4yWGcvAgkyMV
	e3OlQ1bA7RO/pYBFSfa90cLFbFAHBXxIm+AvIWYNeW3SQhV50ATSjfSrIv33SjLwqiA==
X-Gm-Gg: AYBFou1ycJn63nokfXwz3iqLx4IyaT4OtPjV6G5fCDU/vIG3WrxFC/ROpv4zuey0kwH
	lcEe51Ep51Ml+Z3MAh6+GKxfg0S3op+YRrjPiXJZ3hWYnyBZCiaJ4Hdlof2pfXgrhsD8A+3XW0z
	2kIjTsM+MJfPsxuDbr0qufFXhPweN7ZXgdrGU/SJ7vq1x5pMcn9fOuNMk/m5h//ojYd56WpyNRu
	EDQvWLBQntVxDiKv2ZPvsUZspmNo8j4vgSuL3eFzrSXYCqtl6NVXAI3A/Ou33J+AIfpaQ3NN3yJ
	hLyGdTeTQG25TBr1LUDQFbkiyf0H5GFAVWVTcSBrDvKEzz6NT0tuANdSigJxsWxs1G2I/GV6h0y
	nnQGTMeHrFqBy
X-Received: by 2002:a05:620a:880d:b0:93e:53db:d59e with SMTP id af79cd13be357-93f627233d0mr922231785a.23.1792775901734;
        Fri, 23 Oct 2026 10:18:21 -0700 (PDT)
X-Received: by 2002:a05:620a:880d:b0:93e:53db:d59e with SMTP id af79cd13be357-93f627233d0mr922228285a.23.1792775901279;
        Fri, 23 Oct 2026 10:18:21 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d41e0fesm937475f8f.46.2026.10.23.10.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:18:20 -0700 (PDT)
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
Subject: [RFC PATCH 19/23] ASoC: qcom: audioreach: keep the last VI calibration result until the DSP reports
Date: Fri, 23 Oct 2026 18:14:29 +0100
Message-ID: <20261023171433.820092-20-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX7GxTAwTwQHpp
 mHHRxFqOmCKb+14UkFZ4+LsakdUVLZUqn9pyua3NvWnhbkV6LvuZmZdCi/TK7dp4iVadueDVYB+
 jMuicLZyXB/+yv16DDeiuncLpoILZjM=
X-Proofpoint-GUID: J1uLJyrocHNwI7QTNqsP9yhGxtpMUgra
X-Authority-Analysis: v=2.4 cv=SK7Xx+vH c=1 sm=1 tr=0 ts=6adb96de cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=IK27QhZfs67nWGHMqAUA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: J1uLJyrocHNwI7QTNqsP9yhGxtpMUgra
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX18nfLhcZPLAm
 FdcifmrKmzPOfnOAG7cvqUDDIQ/E4idHmpRzQ87pf8nJUMElzcV2J4YWUoYYxVtj09iTRKV+dUA
 Gv1jbjASZZmthvi+98FoLWoTwotokWLOgfKuPEA7QDCAkMyx3zABddPTj1b8ibiTD2kB6eJ+JuF
 ud3+6/Z+rtYgpaZddRDgu17GBNiaDgkOQF1KiNZOb2R+Qp+1KCiDeSUaDO1KCE6PtilyPpPItPN
 +Qs7V18aU52Yk1T+IBM8pymw+tPM37P3UU1TFGXkV7TcQgIYa4wP8s8Z9L52qKW38DapMDKu/Xd
 4YyqAH9xs3WXD8kI6k3/6i6wFQtLvX7QKgcu9B8+9VkmtIUT2+5QG21ccFMnbpbK88MpnQmK1kD
 ELrkjERDv5ePMC0MzC35jASk9vI7iEtsSn+oumfPdGPORWFUgNckIcUL2lokljMvcfPZ8yfw3Kg
 AO8+xg16d1dSisphEZg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230067

Preparing a VI graph in calibration mode cleared the previous result
straight away. A graph prepared and stopped before the DSP reports, for
example by a sound server probing the PCM after a calibration, wiped a
successful result.

Only mark the run pending when arming, and drop the previous result
when the first event of the new run arrives.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 3eba0a9a0372..e996be54c42e 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -25,6 +25,8 @@ enum sp_vi_cali_state {
 };
 
 struct sp_vi_r0_result {
+	/* Set when a calibration run is armed, cleared when it ends */
+	bool armed;
 	enum sp_vi_cali_state state;
 	u32 num_ch;
 	s32 r0_cali_q24[MAX_SP_VI_SPEAKERS];
@@ -1707,9 +1709,16 @@ void audioreach_vi_calibration_event(struct device *dev,
 
 	guard(mutex)(&sp_vi_r0_lock);
 
-	if (sp_vi_r0.state != SP_VI_CALI_RUNNING)
+	if (!sp_vi_r0.armed)
 		return;
 
+	/* First event of this run: drop the previous result */
+	if (!memchr_inv(sp_vi_r0.seen_states, 0, sizeof(sp_vi_r0.seen_states))) {
+		sp_vi_r0.state = SP_VI_CALI_RUNNING;
+		sp_vi_r0.num_ch = 0;
+		memset(sp_vi_r0.r0_cali_q24, 0, sizeof(sp_vi_r0.r0_cali_q24));
+	}
+
 	for (i = 0; i < num_ch; i++) {
 		u32 state = cali->cali_param[i].state;
 
@@ -1731,6 +1740,7 @@ void audioreach_vi_calibration_event(struct device *dev,
 	if (!decisive)
 		return;
 
+	sp_vi_r0.armed = false;
 	sp_vi_r0.state = success ? SP_VI_CALI_SUCCESS : SP_VI_CALI_FAILED;
 	sp_vi_r0.num_ch = num_ch;
 
@@ -1780,7 +1790,13 @@ void audioreach_vi_calibration_abort(struct device *dev)
 
 	guard(mutex)(&sp_vi_r0_lock);
 
-	if (sp_vi_r0.state != SP_VI_CALI_RUNNING)
+	if (!sp_vi_r0.armed)
+		return;
+
+	sp_vi_r0.armed = false;
+
+	/* The DSP never reported on this run: keep the previous result */
+	if (!memchr_inv(sp_vi_r0.seen_states, 0, sizeof(sp_vi_r0.seen_states)))
 		return;
 
 	sp_vi_r0.state = SP_VI_CALI_ABORTED;
@@ -1844,9 +1860,8 @@ static void audioreach_arm_vi_calibration(void)
 {
 	guard(mutex)(&sp_vi_r0_lock);
 
-	sp_vi_r0 = (struct sp_vi_r0_result){
-		.state = SP_VI_CALI_RUNNING,
-	};
+	sp_vi_r0.armed = true;
+	memset(sp_vi_r0.seen_states, 0, sizeof(sp_vi_r0.seen_states));
 }
 
 static int audioreach_speaker_protection_vi(struct q6apm_graph *graph,
-- 
2.47.3

