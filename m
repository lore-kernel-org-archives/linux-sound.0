Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792551202;
	b=rRuasIdvcmZixfoCuFEUYUPRTwote0X9GebZ37tpHbmo+4Og5S5JlWryToqsaGpkleD/
	 LXW2I6U6yLbAP++s4gZbGu4WjL3s7Li6MK6ibOd0wRpIvOZQxjouRhnWAyT5ein6Pfe1x
	 qlpNOa1i+RLxMQq4dvhIvtx/D6mQDSr32p2CAQb0vhHI2ohGYQPm6fLFiP1n4P3SUexq2
	 rfeqfndo4WiyA0w7BXmoxvgZ3KYR7e5TCPlKpDcs0JQVV+nqS0ukslaFLs75KWLhRec/a
	 N1/mE4c8Sr0jQCqYsGFDp6/XEDyHrbgzo7HuSCvj+nl1gybd9C0AbOLP2tHbYZCWAVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792551202;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=evtR+IpjZNie/CYszb+cjE1e8CH3ljthvc//iWTvEs8=;
	b=vK0SouE831WHQoOd2TMVkVGUviZZXYrbpNUVGsDzRKmIg+w4+LcfUDnlMY6I8ruSXiHz
	 6QxMY0xMSAMmM45d83zZNv5qqieJcqDm1hVm74gRTbcuvv+wFy7Shw4FZ607xg+AcfYzu
	 RLr6txXiLQd2fSdLKTasoMpVPL4uK/q3WF04FwTLyUBIPC6brvnLHUCD9nzSmiSsHI9Hb
	 fro28jWkuhw9AilScQBEOKrKNDvhxBduwFg328tQLADh8+9g0zKmX6gp2oCIVFYZAuRC/
	 P2RDUWbIogSsEdG5GBcQShi+n1rP9xekS3ctv+FJFLEEAl4929crwIFZUgoFVtRaaZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NnwgERab;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gmAFiixS;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA12606A31B
	for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 02:53:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BA12606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NnwgERab;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gmAFiixS
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L2Espt299865
	for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 02:53:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=evtR+IpjZNie/CYszb+cjE1e8CH3ljthvc/
	/iWTvEs8=; b=NnwgERabH2KCRpSUw50yLc7hpbcNI2+sR4sUckcjX2tZbnlMFS4
	V6voLz53KN/hyuHNWncvD820qT7adtSfZA/xSpFSmD3D9sYU4630NdVuoqvyQzaX
	dtndGwQdyxXPbDZMCa71sgxl70k8tkRx3/bMor52G35IDlkzoEXtkpFGN1APNP7/
	p48FWOgb2AcSbOGrL+Hwa/PyaNVUul0jOZpPa2MyUZdSIpg5vJaoc1KbLdhdAi38
	eTP0pD4KOWjqxJivBCs1WTwQaMtKAQgk59SHQ/LVPJayq42ncS5xrkknQSwcgIz/
	w8PFPv2Z3jiGdZixq17AbXNoB622bP+vDpw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda4smm4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 02:53:20 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3552883bd19so887236eec.1
        for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 19:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792551199; x=1793155999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=evtR+IpjZNie/CYszb+cjE1e8CH3ljthvc//iWTvEs8=;
        b=gmAFiixSGIyzcFFL35JkHC2nWwCWb41i8MUuBpF88knplaxpEB24waHC5UnVtdCHER
         /uDNOTsW6KjmxsJArQt8CCyOz6bNPpHf0sIWUD57FTy+n+1huJZXw78BXju6IfNrvHkx
         Z8I1E6AW+be888gIqE5fp9J+fCnchJXK6As+AB6+AySR0bc6bdYf0O+6wzgWz1DXlNSS
         e2G1chxLSg4sU6SOGJ8wke/XkAmvMncfaXZ+4lMEpIE0xK9Yy1vxK0aAZJjXXmiNAzKa
         X4yvIXD8WdgSqG3b3sLaRFWCmbV5RLm3aroGRdwv/fDhg6Fco8HmAS182Q59QmZxXCIK
         sbdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792551199; x=1793155999;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=evtR+IpjZNie/CYszb+cjE1e8CH3ljthvc//iWTvEs8=;
        b=D17gaJgGHZpc6jaVEVFA5N4yzrhlkYFZfIXvyE07XrKt9yTh1zi/tmTLiTUQ9D4PGZ
         tCqEF9WU3Awdl93OwIBSL0H5QXT+PhLfMXHXaMbIXvSyA/NBRnRRWbhb0OXZF6ED4Khj
         qe1M45UBaNgDRxt6fU9H+F0NbnVT1wbGn1XuHtc05Cjv9vQF6SGQoUSTZV4zZacn+Acw
         Z4O6yOBl1DdT0zwHJaZkAJGKcg7cYTwWjfDtyGizyWSKwa2p3hfVGAin9IK3tgR3VfYq
         rKKKViejkQ5TarBDihu1SVD2DfiP803C072o2OiP7eCSiBLwgsdUDWi6dJKMaK+o69cn
         AQmA==
X-Forwarded-Encrypted: i=1; AKwUvBzZ3Stkf+aVfNKDOWDUVPd2VM4+Vnr0HHaQ63M44ZZc8FSk0SVqDddr1kVZS3BE8i9i7ubky438kKTnQw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJbSXIzIWs+4H4c05l57DPe02xVK1emeq6Wzq7RI5MuUsMq+5Q2
	owc2zH/9pgsPRTGfJp2sVQrRp07ucK6B8nm2QkZbJZAPXL5deFy+t0pOrPGu/GjaqBVS9ZzF8Po
	PVdPWIcL4is+lif/BrA1mUcmz+mW8QKdeFdGNH8crExmuP5fMC81UG6hTG1ueygaeVw==
X-Gm-Gg: AYBFou25aJOrOqG7BKYlrPSEB766cN8G4dT6TzoZQTiedFfc1dKJ5igi6vhxVWa4bTZ
	h+1BR4+YD52Pi9gUdODvRCVEXu5VRrH03mCZ9DqHQa+d4mKfHtQUF3kCdZyw749A3WAwRfDr/9k
	Ze2Vsmc0snSk/P2/49qFbEgNodSBItpyUCVgtfhKm1ujLpolJoG5IOn0DHMw6PWaUd7ZaW3UInh
	WjF2XnDjMuamzgtCL6G/h4e7rLW2W6U2b3pC5CDhEA9mHL7pYF43wRsBfXwilhqXGLuJJwzcyNg
	0wOzSRZrbGPqz3BOUsWUxbCh5+FiTYbEO4CU1AYdMv/dS7PBZebRpkNhW4UY0eK9FFm3CI3gSrN
	AidcG2YgoCJUYek6+Eqwgoga5CZD+j2mMRbuxu7VbhSIpRrJqAKu6iTXoUHA=
X-Received: by 2002:a05:701b:205b:10b0:165:4b88:abc2 with SMTP id a92af1059eb24-190a6705badmr874408c88.26.1792551199407;
        Tue, 20 Oct 2026 19:53:19 -0700 (PDT)
X-Received: by 2002:a05:701b:205b:10b0:165:4b88:abc2 with SMTP id a92af1059eb24-190a6705badmr874385c88.26.1792551198861;
        Tue, 20 Oct 2026 19:53:18 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903bf5d61csm2553952c88.15.2026.10.20.19.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 19:53:18 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] ASoC: qcom: sc8280xp: Derive TDM channels from DT mask
Date: Wed, 21 Oct 2026 10:53:10 +0800
Message-ID: <20261021025310.2072026-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Proofpoint-ORIG-GUID: lYlAhKspoz1FAmuLaljxEcIFhkuSJnDa
X-Proofpoint-GUID: lYlAhKspoz1FAmuLaljxEcIFhkuSJnDa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAxMSBTYWx0ZWRfX8Xsr3n8BBxhL
 +U6vPqmllZQ+i+uQAjKtkVNifjepVlQaYW/Qt+UdM0+h5F420+umW4IAg9G7uCNoVFHVFrVSdct
 8LkCjki8rFzYY/9zmP2N+R6o4sT65wE=
X-Authority-Analysis: v=2.4 cv=R7aWitRX c=1 sm=1 tr=0 ts=6ad82920 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=ZgtpBRw3GK28A7t1_lEA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAxMSBTYWx0ZWRfX3zm7EnVsJmQS
 scSGHJ0sVTYaGu0cIsyQm2oip8KzTKuaxi34VeJbfeCcARzFPJx9ED13S0GrShbT3ssRnrSJvT7
 82ADJkE5RyZJwT/ENE5SR/D9VGEOnpB9FDd3aI9xK+1tI2TcgjVwUlDM0BUc4HDDjq75pJj14ha
 hJwQGTrY/hFTfeySBE6DXdDhSdr6vBKWbMfbgPVThPIJegMB2PHfXY8NUkvm3PHqIE6KIArxrPj
 ABcBOEB+Fb7CGEK4z1REfuVmSfWJsPIvW33Vj1U9Sgx+7K7OnjlErOh5DAmvi4ue8Ab1AhGbGK8
 QgxYwicm99gixsnpwhwCaAfMn38FavJTL7xPc9g33vu5XFNZxuIaqSV+KjJMT4TsAzbpV8t6HJc
 LCTS2xQUEme0Np/S+zoHWMhYCjxHWUVLmOdJoxN0ZG8qOFdMLE3S6v4VUe94lD+1nXdy/5HWlaT
 VqCqy3Fo3RyClnWBCgg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210011

Derive the AIF_TDM_RX_8 and AIF_TDM_TX_8 backend channel count from
the cpu DAI TDM slot mask in the DT, using the same tx/rx mask
selection as q6tdm_set_tdm_slot(). Each board then gets the channel
count its dai-link describes, e.g. 4/4 on Nord RRD, 6/4 on RIDE.
Keep the default of two when the link has no TDM slot description.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 sound/soc/qcom/sc8280xp.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 9aae6aadd43d..f3fb13145b3b 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -303,6 +303,22 @@ static int sc8280xp_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 	channels->min = 2;
 	channels->max = 2;
 	switch (cpu_dai->id) {
+	case AIF_TDM_RX_8:
+	case AIF_TDM_TX_8: {
+		struct qcom_snd_tdm_slot_cfg cpu_cfg, codec_cfg;
+		unsigned int mask;
+
+		if (qcom_snd_get_dai_tdm_slots(rtd, &cpu_cfg, &codec_cfg))
+			break;
+
+		/* Same slot mask selection as q6tdm_set_tdm_slot() */
+		mask = (cpu_dai->id & 0x1) ? cpu_cfg.tx_mask : cpu_cfg.rx_mask;
+		if (mask) {
+			channels->min = hweight32(mask);
+			channels->max = channels->min;
+		}
+		break;
+	}
 	case TX_CODEC_DMA_TX_0:
 	case TX_CODEC_DMA_TX_1:
 	case TX_CODEC_DMA_TX_2:
-- 
2.43.0

