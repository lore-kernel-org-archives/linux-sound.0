Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F163D3CF8
	for <linux-sound@vger.kernel.org>; Mon, 16 Mar 2026 17:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773681292; cv=none; b=MmhfT4jKgvflkdF0L2fofjH4VeTRBhreNpqWYvYy2vsjGl2MSJxLLarnnR838xiUPqxtsNM5hQcSivJ2UoNMBlCYvHCy8g+zsrO+rmH99AlDjNC7gxLLyDE/bs5y+C5VJbAVvA/ER1qsjHr7l9wcd8kr1UQhgXcRC1wmlHT2hTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773681292; c=relaxed/simple;
	bh=HtFIHBv2fwd3CfESxvQmQ/xugQw0YlUT46/6770djq4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=unAMUlbWKm6swvk3qXMSlFm/r+qXLtoTZ7oE/DNv/8Rir74vkf65SGF+6ENfNHRZ13vqaGB/IEVHrXcRsg3dpfh0OswjyJ3i7kV63gZqc3tDCybXslrpsmFUxJ7w61XOvEBwMlgP8gN3rMoKE4RtEmszHi2Bqx4owEBmqs8UL6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kfegwWmK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ewxQnOCL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kfegwWmK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ewxQnOCL"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GE81Pf2375045
	for <linux-sound@vger.kernel.org>; Mon, 16 Mar 2026 17:14:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZoAGvqbvmk8
	WgSq3LDSsC0+/Kn2gQStwEGDclAd8WF8=; b=kfegwWmK+oeYWJpckng+sZks14U
	rsp48Lfzham+N65Zre+9ESiRr5oysAv2RkJYK7Y+U1U3MM/CnD8fkCkDZkAOrGUW
	Hpx6CYpG+On9figKHVPAr45yictYQnhXhAUrutjya7i9Xr31yLY/RKA6S+hzO5ZA
	tVsYisIr+HoXh9INI1/BlXHpPS0mSWQneF1qU4EmtOOvJVzdC5r7dKj1v6MmYSNe
	MiNWiBBVxfLFnBIb40R0DteoqRIwA7azcqxzpQp9Jw3OycFuhBKR6sDy8FoVAiun
	FX7nQKMr8eGtigtM96RpSP4VoX/itwoVqd0fo0XuZ0vROwJT3T3e8omsNSg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxkby0qa4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 16 Mar 2026 17:14:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd81506677so3101416785a.1
        for <linux-sound@vger.kernel.org>; Mon, 16 Mar 2026 10:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773681289; x=1774286089; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZoAGvqbvmk8WgSq3LDSsC0+/Kn2gQStwEGDclAd8WF8=;
        b=ewxQnOCLd2STVMDUb82XtgHi5yW+EPxLZ5lUpZ92ms51CuK5/5RD64dhOyZr3pvbyz
         +Qj96wSS+WafM7BPVTV3BRW/2ClOaaTQXWdbzLdnLRziEcuxIw0CRuSzdHnYaQxe3R6T
         3PVkf0vNVEJOY/eM3TXT6W+FIQINzh+JBi8w0Gm2qAvtQ5y3N7oYZTtQdE8tkH7wZ9NL
         /acwmtVCNC1MALsT4AAc3ecNThRkUzdNvgMRwSfjgh4vz8I/yZ7FsD09EGpmg1GKFyLV
         Oyrkyxb1MCgQVEC/tIJZFi+y6dCftuYXxe0aqc9zj9QsLEBYVtCSJIFKr1Wa2UBEx3Hz
         UElA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773681289; x=1774286089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZoAGvqbvmk8WgSq3LDSsC0+/Kn2gQStwEGDclAd8WF8=;
        b=GcKHq28c9Er/LxN8EX+OwEBz/OIlmicv5jsUTCRFgkfp89Ris81TUvNYHX3MNhObbS
         DEpR8IEcjN1nnOboTaMvlJ/qbyQj3OmFp0LNKey83V1+O1Dre72MhtNvlsQsc02AV3pc
         Bqcruy0O8mGQrAmWKu51yVI0oFgU+hyOFF4rjF/yc6qsy+ByeGt5FsIGCBcIKYJ7Ei/y
         w66IDmkJY9UI5IZERQ+Q6WIpTUBxFh8eWhVZuZd9N4eQfqYsu3dBx0+y+4znABzX+DXO
         l09Gt5vb3CPPwgr/WFSN1jOLPRTvgWoqnpwvPvrvVumuwL32K+gmEQBDxKDQTX6NhR+d
         gTuA==
X-Forwarded-Encrypted: i=1; AJvYcCXb0W1IHgXAE/R0HJBJNvnrtjaTrfQUAB6AcKK/DTt2jF+UbSRZiyajfozr96kABJDWeBnWNxoySoVjLA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHEit/l9CRfirhX4qn7S7QhgFrc41hQqZH6FDKIHcxWiNlWl/4
	QA4tjNB615fj/JvD9qpqN9QyZOTKlbkMqIsrKsAslMZ9BaCzdt1B7NOn6QdusLLNg4ieaBQH2lH
	PCNSF9WcLPNj2nGS7PeVRS0lrjgzAcWnKC1ISjVg9v5q6bck4Q3FqgV1agA2SdTxNug==
X-Gm-Gg: ATEYQzy1Fwat8qnJgz+Hdf2pBW74qhIpxbuqaAriWWjQQoUQT2iEWRMThSlS4vTUMmS
	1vR1nECFAQoT9cN4diASvSYx6B4E0pKl1NCARK4Gvbjmi3h1d/mLOLEKK0DFz81kgfTjgLl5z71
	EkySrX8uKXqFFEScstU3T1ZcRPDyxTd/cEb3O3fRnk7SRsre/pEOKGDt/UbWjPZ4jVpZt0vJdpL
	h2oEkSUwMpv+fBRznuPBVc9NFEvG8hj2xn2asOkYpzR4vFqexdddwK+ZXNrVwHSPGyqWTr0ktX+
	MUv9j2lkJRMCey0SjSGR/p2HGC59KKmiKbQ/a+BAs4fn7WRo25LTG2e7QLBNf4AVYibXzZYPG4b
	MwBW2l8SJ2oZPUJ36cpHE+5FPC/Ij1bC8POZ/QeXWKAsjeuq8Mg==
X-Received: by 2002:a05:620a:4d5:b0:8cd:b626:cdf1 with SMTP id af79cd13be357-8cdb626d117mr1319004585a.46.1773681289326;
        Mon, 16 Mar 2026 10:14:49 -0700 (PDT)
X-Received: by 2002:a05:620a:4d5:b0:8cd:b626:cdf1 with SMTP id af79cd13be357-8cdb626d117mr1318998385a.46.1773681288653;
        Mon, 16 Mar 2026 10:14:48 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:5dfc:3995:22ce:d286])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20b544sm43860993f8f.20.2026.03.16.10.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 10:14:47 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: konradybcio@kernel.org, andersson@kernel.org
Cc: linux-kernel@vger.kernel.org, Alex Elder <elder@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH v2 4/4] ALSA: usb-audio: qcom: Use the unified QMI service ID instead of defining it locally
Date: Mon, 16 Mar 2026 18:14:14 +0100
Message-ID: <20260316171419.2619620-5-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260316171419.2619620-1-daniel.lezcano@oss.qualcomm.com>
References: <20260316171419.2619620-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: EOksa7oxT4DNtTT5k7vV-iz306OUcZH8
X-Proofpoint-ORIG-GUID: EOksa7oxT4DNtTT5k7vV-iz306OUcZH8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDEzMyBTYWx0ZWRfXz36hCnPV5fkM
 AB5p9TmRjYtvE8XXIbAO5va43E0ozOzQ5sIHpT2Fy/qLLAApmeFQkp6vwIPH/Le1zaRGMCbh6tB
 ROCItvFDXLe5z5cOZAM1du5c9xn3AoBInIC294vXvT+WYtpmTceP1G1kgPdPIPrnpJHvxjhEM6b
 CXTVWCpSMpD2csoIqSww0LZlXf5asXDI4fd6if0v1Pkc1qolTY4Qu6vy+TyWx5XKVVq8+1TH6w0
 lNhzq3SdF0u98NRF+MyEX838PS1NPqRDEX6R925UCD4St578Octcne38kQ76K/+2paqB8cP4NiU
 +thUHqOshtXpp4/+jJ3Qt0Si5P5/oG271yeYgKL3r3p3S1U+yAONZXtJdESDfc8Q7PbXfKbFy6e
 kK4Pg4tzK+0lJm6NqLn9ipC97JA8yNvvXpVf4caWaYpYrDbAfiRwguFSLV9aBWL7MNHuGz7wWW+
 fs9lGZGgmb7lBqQ65CA==
X-Authority-Analysis: v=2.4 cv=ZpLg6t7G c=1 sm=1 tr=0 ts=69b83a8a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=GLuZV9TbpKr0kWuSc8UA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603160133

Instead of defining a local macro with a custom name for the QMI
service identifier, use the one provided in qmi.h and remove the
locally defined macro.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 sound/usb/qcom/qc_audio_offload.c  | 2 +-
 sound/usb/qcom/usb_audio_qmi_v01.h | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
index 01e6063c2207..38d36397bb40 100644
--- a/sound/usb/qcom/qc_audio_offload.c
+++ b/sound/usb/qcom/qc_audio_offload.c
@@ -1927,7 +1927,7 @@ static int qc_usb_audio_probe(struct auxiliary_device *auxdev,
 			      QMI_UAUDIO_STREAM_REQ_MSG_V01_MAX_MSG_LEN,
 			      &uaudio_svc_ops_options,
 			      &uaudio_stream_req_handlers);
-	ret = qmi_add_server(svc->uaudio_svc_hdl, UAUDIO_STREAM_SERVICE_ID_V01,
+	ret = qmi_add_server(svc->uaudio_svc_hdl, QMI_SERVICE_ID_USB_AUDIO_STREAM,
 			     UAUDIO_STREAM_SERVICE_VERS_V01, 0);
 
 	uaudio_svc = svc;
diff --git a/sound/usb/qcom/usb_audio_qmi_v01.h b/sound/usb/qcom/usb_audio_qmi_v01.h
index a1298d75d9f8..c7eee03225ec 100644
--- a/sound/usb/qcom/usb_audio_qmi_v01.h
+++ b/sound/usb/qcom/usb_audio_qmi_v01.h
@@ -6,7 +6,6 @@
 #ifndef USB_QMI_V01_H
 #define USB_QMI_V01_H
 
-#define UAUDIO_STREAM_SERVICE_ID_V01 0x41D
 #define UAUDIO_STREAM_SERVICE_VERS_V01 0x01
 
 #define QMI_UAUDIO_STREAM_RESP_V01 0x0001
-- 
2.43.0

