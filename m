Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795376488;
	b=zyCCszDQC1SxoXR15ncN0j/KsOJvO1qbv/UZBTKb5zYwscKZbOpw7lF8U3CKrejWSiub
	 Kw51BVr2atvWI7/84MXZ7cF+GX7rGg/h90A8UBOhFzNpnJKmBEcBHVHbLRWat4r/v+BPj
	 aUnvPpDUHtWefAAFrUNgPMWtXN5WBnn2DVvfKDfqYGoWTzGb33gDlYb+3AWN9wUksvV+K
	 58Bh2DbBF3uE5gMcQN1DNwWYV5w18xLM7Hap8GSsnTvmoWJ2VRom5nyN0tDPQN/Vp4FxA
	 Kj3m3VXAUxI0MAvGscuD5yFFinh1hIqFzWGOC6XPH6kfFwG14tIVz0tdMpzRdQbu7Zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795376488;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=EqnhgFHa0yneocF+y9O7taJ/SceS8rkHnBhkjvLnotE=;
	b=J4hlRhiqvOsRKWjPIRhWCIvnvJuqTCAN1ZYkQyYz9nHlenYqDmlW4dcCy1cuM3uUgg91
	 YtD3mWNWp3bsvHdiJQTviJx5hhBgVBWzvwpLHEHIGB7NOX538CbEjYkoKXn2f1BBUM9XP
	 FsQEu4oCFyKXRKoHQkRQJDR2hWxxAzGRV4eWTgcSGLHYANw+9EcyqPt0h7s3Vy+kUkUol
	 cHE10ZGhLQAeRby6/No+my2/Dmz5vJtKhI/mO99m75GvNfzRYsNuR1ki+jyaHU4cDTRyR
	 zraAUF3ga6YIvYp/KTgLF5K6EZ1DwnkLMJRd32VPuiXs/4z7wRuTzWeYTPyPTQ7+/Gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aPagmhAQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=clQq0gJw;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0CC606A338
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 19:41:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B0CC606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aPagmhAQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=clQq0gJw
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMGUoUK3985510
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 19:41:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EqnhgFHa0yneocF+y9O7taJ/SceS8rkHnBhkjvLnotE=; b=aPagmhAQWCANaq92
	NJQb5j3qzkjxu4ybQLyUefY13HylNTd5dR8efJul/XArUyqhE5WWn5gSq5APP8bN
	KzFS9YIqRejbXwolqIFHpjKqwmcISpY4JSSbU3dbd4iwJOIk21nByitML3QJAXHp
	PpEbAfGevIwKikejmlVwlirb4ERpxNC/Zr4ihgRbX505tGiByVaCI4eiykLrTekR
	tcpQXOpYAD40o0Ylc79JSMY2mZZCmmmgGk4Mhcw5Lpus0+hhpcku83xhfqlnj5zD
	sXovGdwLetHzKxlJ318JjJCxrVGVu/68r3tNPoeEwe1V3c9L/7nOdK9udkWCwEcG
	HOE6QQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33cu443m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 19:41:26 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-38355b03cb8so2684816eec.0
        for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 11:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795376485; x=1795981285; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EqnhgFHa0yneocF+y9O7taJ/SceS8rkHnBhkjvLnotE=;
        b=clQq0gJwMs4mQpQJd10SoQzFBAhWimQbm/IICAKjOb3waEJ674U32w1t13cDnpq1Bo
         8b/SDDtCo0nO1iIVZzKqiZwtz7WMf1cvpp15Q4TO2MCsyO8YDsQbMBsuP0uuRdzIGTrF
         ieWsWxiv5GC1mI5pRKjckEu9elBcpgeHfQc1ZRTtuqXog+zNAi5D0f5jP20+EONuWSIO
         o/qc/1T8UoZxCwn3JPd2oYc9UlbvrWfZPVRbLKEfDYbBE1iCa62Y62AfmJwl7GNA1glB
         TgY98xZccgZOhb9IZAsX4ksiBHb0eonKFRo967ZmSX19+IKU+HzJuDD+kHpzMXfpRPkB
         bgoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795376485; x=1795981285;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EqnhgFHa0yneocF+y9O7taJ/SceS8rkHnBhkjvLnotE=;
        b=GxZ9ZoTTpTkTLARfXBpJhVS+dABfy7f6+YXBtYAtFw4cqqNH+mBykUat3rRDgNT74l
         lw9fWw/aaJb8kHt2E4qHCucdJMJTNpRY5fecJuMKjotZW3Dte5iUE3X94mHocJriTCiN
         jI8exj+48ZS6j0KwusKGjqOZB1VWx8qaGJPVg9L7kEl3y7IB6iB6FKBuEVHwQK7ifXWn
         ve5GPry7blSzieKE0eYzoWT1XfL1NkC4hT/kLAOFTtEPCUY8w403IfdVgMcI+9gkx+QB
         lahsmJ8QDjn6USQOPVWF9YeGrWj+R7Hzhl02X9IDTQGjMDvSIC+9lBr94g6WrWpYjsCd
         DhSQ==
X-Forwarded-Encrypted: i=1; AL+hErGvuWfiJ4LSQQ3d9Gu7U8Svv0QlWMhtvFadA4M4T1lA5qmJ6xEJuJMZloH+UjYs2/Krs2k30d7eF5+BYg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8gc8rXUaOb4GnWtQJLlPR4PGqu/C8mGQOE1XZrlHrUpXIFgROM
	nh3hs3vdcfIp6vhjwqGiSTk4Gv8R03geQoKIvASMGTqmx62eSDvZuKDkarV1MkWLZag8s7ni0/u
	TIF3A2gUsn3T3gy++O1pA3RPhv1Kj2+NKkQj+ubvx0usfOr6M8k662gElP8sLsvFLEQ==
X-Gm-Gg: AZFdTZdlOsOOh9PM8dJ7FkxPkAKJGUcNrKJ0KGHrKxpX8XA2B0BjF9caxOECmUD6vWF
	DUQLUDO9RqG+t4MqCDhsLptzrfM8iMRMk5B2NsDU2YJRyVlV8aGZ8Xjny9KpGO6NvKsSSQpiZ6a
	v5RG+3TeObujhPlZbaqn8DHIlLuG67U6UVTbGK/WuH+sSqt49n9lY5GME4gir0JRGJgeCQgdakY
	HSSRpHB3TZH0U3A4HX5nJZYECIDMXQcDVTNXhCNIk0KaxL6YDZEBlwQQcOuh2lL7uAA7Jxb064i
	KFrakvjlTgjWalCn6jFdKK2Cerifhc6t9qkdSY6Nt/OMl1VloqHQV3xTIXgwjEHdI6WpeM4uIjd
	JaDgbDCJfipbzRwFLm+FIYjBj079NgG+SsPM7A8Er1Ksj/eB8vuNd5SnyiXz+4TE5mJ3qyYcm8J
	g1xGrPRax0GA==
X-Received: by 2002:a05:693c:829b:10b0:376:feb:2df3 with SMTP id 5a478bee46e88-3856f85236cmr12193790eec.20.1795376485404;
        Sun, 22 Nov 2026 11:41:25 -0800 (PST)
X-Received: by 2002:a05:693c:829b:10b0:376:feb:2df3 with SMTP id 5a478bee46e88-3856f85236cmr12193755eec.20.1795376484904;
        Sun, 22 Nov 2026 11:41:24 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm28348711eec.15.2026.11.22.11.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 11:41:24 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 01:10:48 +0530
Subject: [PATCH v3 3/5] ASoC: qcom: sc8280xp: Add shikra-cqm-evk compatible
 support
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-shikra-machine-v3-3-e5d074264428@oss.qualcomm.com>
References: <20261123-shikra-machine-v3-0-e5d074264428@oss.qualcomm.com>
In-Reply-To: <20261123-shikra-machine-v3-0-e5d074264428@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795376465; l=2047;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=BCHLrEhwGhe1O6yp+CHSIz3VktK4Nv5ZZBQEoMfmYEc=;
 b=gH8tAk1kaREfDEeheHZdrbuOQocoz5hcTZ6LpEM3sh6VwjwpF+HP/1ctSLNvJVg28xNIhKsyy
 wKNxOraoxKcAYC+eOzhC40pP30q/tQ/n3rUYleYcuLrxAXiy7Vr1iGl
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-GUID: J4B3N3LNcq5CEq62MMByB3a19J5U4EtA
X-Proofpoint-ORIG-GUID: J4B3N3LNcq5CEq62MMByB3a19J5U4EtA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA3OCBTYWx0ZWRfX26oHgy7NqvZY
 6bhU0g7wiAbAv2lfdqZHnDXLdEDEnAO7TKl3dHRIctvQuuMEE6yphdnDmiKmM8fFeBAg7ZLg+Iw
 2HBPTQ1zxBYoKc7k2N3EVVMnnJziXW3zhQ64Kyy85fd/KW+Q9U0+5oDQmwHl8xc8k3CI3FE63d4
 wsqnn2uknzdqPbUpHeTDWEuGECdmNqnLoASUWkRRMLHq2y9DNT5c/mbvVeuxfmuvrS8Mj4x00Fd
 6/q/XxvAW9Aug3jDE0QD6z4E+VzmkYRxR+tIwLnI1CS2jRpldzNMGqArEOsIf2v+XPgsoMdgtT5
 Zd3QZRvlyz2SAueGElNbdPsdC0t0VwSm7vEmQ+LymOEmRr1XN1JgFt+xi3OXlZr6n8BUdwocuw3
 qUOHPteesLFzZcyjkpFyHG8oEL7jXl5tBHO5m+NDHCmiRNP+dm1LOcLQL3IKYctwF+1sRsrumiU
 HCUwkAKftXbUxVG35Vg==
X-Authority-Analysis: v=2.4 cv=MM71C8Zl c=1 sm=1 tr=0 ts=6b034566 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Jl9POzQKuGOmLu04UGMA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA3OCBTYWx0ZWRfX/qBXAou25Moi
 KKANV8Z3ScWPA/6qOm7s1LVEx4WZKzi2rdBIHthqqXPDxZe5YeiYfcyH2tZv8iwvhVpOXkx6VYD
 cS1ODQEEPycAN4enrxeHd3AsENFbLT0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_04,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0 spamscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220078

From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

Add machine driver support for the Qualcomm Shikra CQM EVK board. The
Shikra CQM platform uses an I2S-based audio path with WSA885x
amplifiers and PM4125/Rouleur codec components.

Configure the CQM QAIF TDM speaker backend with DSP_A framing using
per-DAI board data.

Reviewed-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/qcom/sc8280xp.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index ff8ccd3065eb..e1d701a1b1dd 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -727,6 +727,21 @@ static const struct qcom_snd_soc_common sc8280xp_priv_data = {
 	.wcd_jack = true,
 };
 
+static const struct qcom_snd_soc_common shikra_cqm_priv_data = {
+	.driver_name = "shikra",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+	.codec_link_be_ops = true,
+	.wcd_jack = true,
+	SC8280XP_DAI_DATA({
+			.id = AIF_TDM_RX_2,
+			.cpu_dai_fmt = SND_SOC_DAIFMT_DSP_A | SND_SOC_DAIFMT_BP_FP,
+			.codec_sysclk_set = true,
+			.mi2s_bclk_enable = true,
+		}
+	),
+};
+
 static const struct qcom_snd_soc_common sm8450_priv_data = {
 	.driver_name = "sm8450",
 	.dapm_widgets = sc8280xp_dapm_widgets,
@@ -796,6 +811,7 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
 	{ .compatible = "qcom,qcs9075-sndcard", .data = &qcs9100_priv_data },
 	{ .compatible = "qcom,qcs9100-sndcard", .data = &qcs9100_priv_data },
 	{ .compatible = "qcom,sc8280xp-sndcard", .data = &sc8280xp_priv_data },
+	{ .compatible = "qcom,shikra-cqm-sndcard", .data = &shikra_cqm_priv_data },
 	{ .compatible = "qcom,sm8450-sndcard", .data = &sm8450_priv_data },
 	{ .compatible = "qcom,sm8475-sndcard", .data = &sm8475_priv_data },
 	{ .compatible = "qcom,sm8550-sndcard", .data = &sm8550_priv_data },

-- 
2.34.1

