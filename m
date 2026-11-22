Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364121;
	b=U1+sS34XMVS2MXjL1i2DdlZwkZggE+h/+PKmQFKIaHFBl5qeaV51rcHCtp2NZo3vaZpm
	 4WLnRV8OOs/ffhdWfjWeOvraFSpr+TmThCnl+jb0Pe0EvDkzDYtbZqL30CNGtMxUyrizS
	 JFtZnJ23xTQCCQYdNie+iv+zzYr1zPeB7eXF8M6JBq9et1B9DPPxul6UrICPtx3EB6BTj
	 +D4Il71kH5sEnafuG7aLjcEei+z6Gw51iFQkzqyHl83Td2wVzXSgeuAYwjbnPAi6CMCQV
	 OM2wKS5AjeI23/jj/JDLzdnbgkIbpLtcRqGiP5Zfbvbw+9GaHmL7PKvOhUKumr2QCuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364121;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iysdng1dCLf+kvujDP6uwiPwceVMgnehm2WCzSxzIsM=;
	b=atsFNBDZEksBgWwSnZ0dUNYGi53he5R1iDQY9wt3prD2vX2vsYU4OV6nV+HiRYxkqBM5
	 2CWxg3WuHE2aoz/EgW+Pl5Wu0V8Zy57z+elZrbmM+E2b3BKJ19D6alQRW7Hbi7lOxtKFG
	 EstG2j4eD7SjHV3Sr8rYrh8g12J439/BuLdlVDmdiMT8WFshm+dj4ZoIzFyCFcIoKwr3t
	 ele96pAT7Zh4Uc1J57iE+kMq1Bg/ijEJBV5pg6o7F7V3/Upnw7gS5sgnLXb3X6wlhYyIC
	 tuTiGrpnOl+snoCH86ZzXfmlOi5COiDbFDKm+D0zjRDrYdwd27cHVv6tiIRoL1AUe8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XN3pzoI9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B25LNiG2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0A6606B8E0
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 16:15:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B0A6606B8E0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XN3pzoI9;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B25LNiG2
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFQA9L1854237
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 16:15:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=iysdng1dCLf
	+kvujDP6uwiPwceVMgnehm2WCzSxzIsM=; b=XN3pzoI9g3MzpnwybLHow8JiTte
	/qGsd9azDNcxVyNUWXgVxCRTRtWI94bFsgXFy6JGZTbQ58pR5+ku1OAMQYxttu6g
	tW7/CBws1aImrd0rp+J69hRW/POPgmG2IQzlLXuPQzpTLW4uNx1IDVImDo/WaFtQ
	/FaMXCOLgjusZhngutkNgEsN2PKkjFfKNeLvRHaCoNKPXgth6KFxbBJf9vtMzVyD
	XZt96YmWf//gaZV5dczYojjBIbdybMmCWKrUj4L+p9WvgM5VDJTwlXd747HdsNMl
	OmQ13e2reVxU+/2AWFywSyQdXRbNj0FiXTCMJNV30208p7hSBVBOjcTVPtA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j30nnv425-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 16:15:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934963b2bc0so501817685a.3
        for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 08:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795364119; x=1795968919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iysdng1dCLf+kvujDP6uwiPwceVMgnehm2WCzSxzIsM=;
        b=B25LNiG2sg0/nIlv+40CfRZXIHSowjgCAJYtyw4wiu74yymO/oMFGZBndfrjfRLdly
         reaSh2r7DLfC6vJsMo8MuC5egxZ5bput6pj7b2QlC9Jup77lZt0h0hCf+OVs/N8h8n9j
         ulUo9HXfC0gNs8xddloPSZJEURzrKiB9ZJ9WXUtu7Kv9Rl+AOWHMYijWR+8cUNLeDFaj
         shubxX83ywjoUs0sfJK2kHzu3wGLBdM7VT6r2mVXA90/1T+iOoqu43ILdbLejmGBDft7
         TLMk1xzISSkR5kXe2I2hxRjhWtY/RjGVnRZpxlSMWNneNQBIgS+x/l0ulrnamW/uIlMC
         i81Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364119; x=1795968919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iysdng1dCLf+kvujDP6uwiPwceVMgnehm2WCzSxzIsM=;
        b=ao99hwkFN6317+UBHpku4f+BKhV/xleEuVwg8LopqCas0cA8HmtrzlWy6WHw7hdx9G
         oiz5zWC7OCTaA6YF7a2oRMHXD6kRwu9mU8Eis7PhACBLH8q5T/Mke+v4PWjRNLpMYkYk
         o3Zw6TZ5+RYn7C9wSiCx/hj/Btndf/MmNdQSrbjJp7CG9fc5cf1TjOkmGN9Sqfy3XDOU
         s8yx/sILDNCvaOSeslJL5zDDrKd9MpQiswB8RJxmZJ+l32dNZf4fSAPByCFQS6a0pmTa
         HMZMQXo+5QSt/eqSra6yWRTqok4O/EfL9OtGBv9iX3l0rNvArMwSuMdJn4aDlBr18icI
         WGwg==
X-Forwarded-Encrypted: i=1; AL+hErGGtkK2QpoCuwOguszMWfLkUWJE0pzHSEd3kgA/ZZ9x0dtvzCUP7LqkzmFI7XoxS1mWQfw00RfJcKNArg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8uwzO2ecrsj0TJfFb/EL0QshoFsswfs7Fe5k8By3qoCgtaqHE5
	fH+HZEPr7Hd1guXSUuNuSWNtgxUIZfo3lhuJmZAAb8A4q1dDneCUGk+aS1Dsyyqi8RIbSKd3GR6
	KEwDcykUaPHx3l93jjFZsV3UrH6fT7iXemKhnWzwCaBZyNdI6BAZ7ws2YEDBaz0L5vg==
X-Gm-Gg: AZFdTZfXrhLGylMBt9UcwrnxCKQlpEJnK7uD3Dv5eq5Lj+GJrjJgcr1c5YZaCRjeFTT
	cP+YlHBswPUOspUaJTznroWoIT5jySqbM42oyKeCTJWLlmXQ2y3cpS9kiZpVoQmk063znMbiahf
	QbcM6YFGGRSZdG/ltTnmaCn2u/TKPkP92XLHvIBuBEHmWkvHHwYqXe/MMQ5aXwmpcvQ26IBFQS/
	DWzd2blxgZQAkYChKfps1WECygaxn2sckAT2L182kJSTAb1HwBJI9BRdCxtRrh1peogpGybeu8J
	kCphsfYQ2IyPJBOIIxk54odA2w4flReVsQLIB9K6tSJ0spWNaOZwwsEfvKtxjaxEQyEEB6fd/Nk
	++n225cCKqt1dLEYTtHWZArQVh7sWyrUFR1uDvyVsMb/4bSAqzaB+KCinmPHQWQGB
X-Received: by 2002:a05:620a:6481:b0:93e:592d:f5a2 with SMTP id af79cd13be357-949ba823313mr1496325185a.11.1795364119018;
        Sun, 22 Nov 2026 08:15:19 -0800 (PST)
X-Received: by 2002:a05:620a:6481:b0:93e:592d:f5a2 with SMTP id af79cd13be357-949ba823313mr1496320485a.11.1795364118528;
        Sun, 22 Nov 2026 08:15:18 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm239042665e9.8.2026.11.22.08.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:15:17 -0800 (PST)
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
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 19/24] ASoC: qcom: audioreach: add speaker protection calibration state control
Date: Sun, 22 Nov 2026 16:14:32 +0000
Message-ID: <20261122161437.5994-20-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfXyKQy7T9GICA6
 2uorxKhENEhSonAM3oueRSMH0AiwfRk515up2kWjSPmCurJEmUtPA7lj8cgYVC8cs+9/DUwD0/o
 qjVZMwcNG1KJVLxlP/rLDEggwuhC3hO4WwoWrLXh6/xhFJDRflGKT4xjXdMhpS3TsojCX/o4lcI
 HkXXhyd/3BQWaEOC+mp0/VfIPzO4F13Ntd3dC0Za+4bcE5XpMIj2Db4L2D8a7HLAXHATxWXuTWc
 dhawmWZOG7wQpSwG2P80AlDoMqMKx0+aY2WQLY/4g3DmssmTgoSrsJPyqMD181tXn6rnWZkCouH
 QNni4vte3EFd+jPfoOQ7VFbGzWgj6bnRW1JEVB9lcfr717LHzzUEzrvZZUoX2rgDkvwRfOJ35MR
 E18xfE8zyxn+Ond8LMlnP1RlLaw+I1iNTUAoMo8ihLDUdxNBWUqkUQFEe4fphEBfqWNLrkTRy4V
 kP0oJbWbE8QsMQ6tNsw==
X-Proofpoint-ORIG-GUID: 4PhTQlQu3gtmJKYUKxODi_3vNIkKIR71
X-Authority-Analysis: v=2.4 cv=LITz05W9 c=1 sm=1 tr=0 ts=6b031517 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=w_sgUqFDBmVKUPfu87UA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX5E9o30dSm9fx
 TkFPcu/mVfsoTtozCQEJtr+J4i9MUz694T0wzvewmJkaoX7ROELGv7kyBzRlyBlckIobTpiZMR5
 LtIKp1c3eu5rhUj/1na4R9EHqRQQQ1s=
X-Proofpoint-GUID: 4PhTQlQu3gtmJKYUKxODi_3vNIkKIR71
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220064

Add a read-only "Speaker Protection Calibration State" control with
each speaker's last calibration state, so userspace can follow a run.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 60 +++++++++++++++++++++++++++++
 sound/soc/qcom/qdsp6/audioreach.h |  2 +
 sound/soc/qcom/qdsp6/q6apm.c      | 15 +++++++-
 sound/soc/qcom/qdsp6/topology.c   | 63 +++++++++++++++++++++++++++++++
 4 files changed, 139 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 2bb56933b9de..f1e454062ece 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -22,6 +22,7 @@ enum sp_vi_cali_state {
 	SP_VI_CALI_RUNNING,	/* Events arriving, none decisive yet */
 	SP_VI_CALI_FAILED,	/* Run finished, no usable R0 */
 	SP_VI_CALI_SUCCESS,	/* Run finished, @r0_cali_q24 valid */
+	SP_VI_CALI_ABORTED,	/* Graph stopped before the run finished */
 };
 
 struct sp_vi_r0_result {
@@ -31,6 +32,8 @@ struct sp_vi_r0_result {
 	u32 num_ch;
 	s32 r0_cali_q24[MAX_SP_VI_SPEAKERS];
 	u32 seen_states[MAX_SP_VI_SPEAKERS];
+	/* Last calibration state per speaker (enum vi_calibration_state) */
+	u32 last_state[MAX_SP_VI_SPEAKERS];
 };
 
 static struct sp_vi_r0_result sp_vi_r0;
@@ -1657,6 +1660,21 @@ int audioreach_get_sp_vi_t0(long *vals, unsigned int count)
 }
 EXPORT_SYMBOL_GPL(audioreach_get_sp_vi_t0);
 
+/* Latest calibration state per speaker, 0 before any event */
+int audioreach_get_sp_vi_cal_state(long *vals, unsigned int count)
+{
+	unsigned int i;
+
+	guard(mutex)(&sp_vi_r0_lock);
+
+	count = min(count, MAX_SP_VI_SPEAKERS);
+	for (i = 0; i < count; i++)
+		vals[i] = sp_vi_r0.last_state[i];
+
+	return count;
+}
+EXPORT_SYMBOL_GPL(audioreach_get_sp_vi_cal_state);
+
 int audioreach_set_sp_vi_r0t0(struct device *dev, const long *vals, unsigned int count)
 {
 	struct sp_vi_r0t0_cfg new = {};
@@ -1743,6 +1761,8 @@ void audioreach_vi_calibration_event(struct device *dev,
 	for (i = 0; i < num_ch; i++) {
 		u32 state = cali->cali_param[i].state;
 
+		sp_vi_r0.last_state[i] = state;
+
 		if (sp_vi_cali_state_is_failure(state))
 			success = false;
 		else if (!sp_vi_cali_state_is_terminal(state))
@@ -1805,6 +1825,46 @@ void audioreach_vi_calibration_event(struct device *dev,
 	audioreach_sp_finish_calibration();
 }
 
+/* A run cut short never reports a final state, close it out */
+void audioreach_vi_calibration_abort(struct device *dev)
+{
+	unsigned int i;
+
+	guard(mutex)(&sp_vi_r0_lock);
+
+	if (!sp_vi_r0.armed)
+		return;
+
+	sp_vi_r0.armed = false;
+
+	/* The DSP never reported on this run: keep the previous result */
+	if (!memchr_inv(sp_vi_r0.seen_states, 0, sizeof(sp_vi_r0.seen_states)))
+		return;
+
+	sp_vi_r0.state = SP_VI_CALI_ABORTED;
+
+	for (i = 0; i < MAX_SP_VI_SPEAKERS; i++) {
+		u32 state = sp_vi_r0.last_state[i];
+
+		/* Slot never reported: not part of this run */
+		if (!sp_vi_r0.seen_states[i])
+			continue;
+
+		if (sp_vi_cali_state_is_terminal(state))
+			continue;
+
+		dev_info(dev, "VI calibration channel %u: aborted while %s\n",
+			 i, sp_vi_cali_state_name(state));
+		sp_vi_r0.last_state[i] = VI_CALIBRATION_STATE_INACTIVE;
+	}
+
+	dev_info(dev, "VI calibration aborted: graph stopped before the DSP finished\n");
+
+	/* Edge-triggered: the mode auto-returns to Normal on abort too. */
+	audioreach_sp_finish_calibration();
+}
+EXPORT_SYMBOL_GPL(audioreach_vi_calibration_abort);
+
 static int audioreach_speaker_protection(struct q6apm_graph *graph,
 					 const struct audioreach_module *module)
 {
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index fb3f2f61e2b1..4db93c7f8829 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -1141,10 +1141,12 @@ int audioreach_set_sp_vi_r0t0(struct device *dev, const long *vals, unsigned int
 int audioreach_sp_register_speaker_map(struct thermal_zone_device * const *tzs,
 				       unsigned int num);
 int audioreach_get_sp_vi_t0(long *vals, unsigned int count);
+int audioreach_get_sp_vi_cal_state(long *vals, unsigned int count);
 int audioreach_add_sp_telemetry_controls(struct snd_soc_component *component);
 void audioreach_vi_calibration_event(struct device *dev,
 				     const struct event_id_vi_per_spkr_calibration *cali,
 				     u32 num_ch);
+void audioreach_vi_calibration_abort(struct device *dev);
 int audioreach_compr_set_param(struct q6apm_graph *graph,
 			       const struct audioreach_module_config *mcfg);
 int audioreach_setup_push_pull(struct q6apm_graph *graph, phys_addr_t bphys,
diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index c410e2f6e6a3..35daf763287c 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -815,10 +815,19 @@ struct q6apm_graph *q6apm_graph_open(struct device *dev, q6apm_cb cb,
 }
 EXPORT_SYMBOL_GPL(q6apm_graph_open);
 
+static void q6apm_graph_abort_vi_calibration(struct q6apm_graph *graph)
+{
+	if (q6apm_find_module_by_mid(graph, MODULE_ID_SPEAKER_PROTECTION_VI))
+		audioreach_vi_calibration_abort(graph->dev);
+}
+
 int q6apm_graph_close(struct q6apm_graph *graph)
 {
 	struct audioreach_graph *ar_graph = graph->ar_graph;
 
+	/* Covers a graph closed without ever being started, e.g. on prepare failure */
+	q6apm_graph_abort_vi_calibration(graph);
+
 	graph->ar_graph = NULL;
 	kref_put(&ar_graph->refcount, q6apm_put_audioreach_graph);
 	gpr_free_port(graph->port);
@@ -854,6 +863,7 @@ EXPORT_SYMBOL_GPL(q6apm_graph_start);
 int q6apm_graph_stop(struct q6apm_graph *graph)
 {
 	struct audioreach_graph *ar_graph = graph->ar_graph;
+	int ret;
 
 	if (ar_graph->start_count == 0)
 		return 0;
@@ -861,7 +871,10 @@ int q6apm_graph_stop(struct q6apm_graph *graph)
 	if (--ar_graph->start_count > 0)
 		return 0;
 
-	return audioreach_graph_mgmt_cmd(ar_graph, APM_CMD_GRAPH_STOP);
+	ret = audioreach_graph_mgmt_cmd(ar_graph, APM_CMD_GRAPH_STOP);
+	q6apm_graph_abort_vi_calibration(graph);
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(q6apm_graph_stop);
 
diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
index 0e28c68c735d..a19efbb889a8 100644
--- a/sound/soc/qcom/qdsp6/topology.c
+++ b/sound/soc/qcom/qdsp6/topology.c
@@ -1548,6 +1548,45 @@ static int audioreach_get_sp_t0(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
+static int audioreach_get_sp_cal_state(struct snd_kcontrol *kcontrol,
+				       struct snd_ctl_elem_value *ucontrol)
+{
+	audioreach_get_sp_vi_cal_state(ucontrol->value.integer.value,
+				       MAX_SP_VI_SPEAKERS);
+
+	return 0;
+}
+
+static int audioreach_info_sp_calibrate(struct snd_kcontrol *kcontrol,
+					struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_BOOLEAN;
+	uinfo->count = 1;
+	uinfo->value.integer.min = 0;
+	uinfo->value.integer.max = 1;
+
+	return 0;
+}
+
+static int audioreach_get_sp_calibrate(struct snd_kcontrol *kcontrol,
+				       struct snd_ctl_elem_value *ucontrol)
+{
+	/* Trigger reads back as 0 so alsactl restore of a stored value is
+	 * a no-op; writing 1 arms a single calibration run.
+	 */
+	ucontrol->value.integer.value[0] = 0;
+	return 0;
+}
+
+static int audioreach_put_sp_calibrate(struct snd_kcontrol *kcontrol,
+				       struct snd_ctl_elem_value *ucontrol)
+{
+	if (!ucontrol->value.integer.value[0])
+		return 0;
+
+	return audioreach_trigger_sp_calibration() ? : 1;
+}
+
 static const struct snd_kcontrol_new audioreach_sp_telemetry_controls[] = {
 	{
 		.iface	= SNDRV_CTL_ELEM_IFACE_MIXER,
@@ -1557,6 +1596,30 @@ static const struct snd_kcontrol_new audioreach_sp_telemetry_controls[] = {
 		.info	= audioreach_info_sp_t0,
 		.get	= audioreach_get_sp_t0,
 	},
+	{
+		.iface	= SNDRV_CTL_ELEM_IFACE_MIXER,
+		.name	= "Speaker Protection Calibration State",
+		.access	= SNDRV_CTL_ELEM_ACCESS_READ |
+			  SNDRV_CTL_ELEM_ACCESS_VOLATILE,
+		/* Last calibration state per speaker (enum vi_calibration_state) */
+		.info	= audioreach_info_sp_t0,
+		.get	= audioreach_get_sp_cal_state,
+	},
+	{
+		/*
+		 * Write-only edge trigger.  Writing 1 arms a calibration run
+		 * for the next (or current) WSA playback graph; the mode
+		 * returns to Normal on its own once the DSP reports terminal
+		 * state, on graph abort, or on the watchdog timeout.
+		 */
+		.iface	= SNDRV_CTL_ELEM_IFACE_MIXER,
+		.name	= "Speaker Protection Calibrate",
+		.access	= SNDRV_CTL_ELEM_ACCESS_READWRITE |
+			  SNDRV_CTL_ELEM_ACCESS_VOLATILE,
+		.info	= audioreach_info_sp_calibrate,
+		.get	= audioreach_get_sp_calibrate,
+		.put	= audioreach_put_sp_calibrate,
+	},
 };
 
 /* Kept apart from the topology SP controls, so FEs have them without it */
-- 
2.53.0

