Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9392E1B0437
	for <linux-sound@vger.kernel.org>; Mon,  8 Sep 2025 05:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757309848; cv=none; b=IHTnz4T+fKa6byAGZ67q6MjO2bYNGFz2p9e1vVilPRATYree9rI1g2VqLk9U9MoKEPfOWSRxO3mVCBAPMwrvUgJg9YlVCP4SdsVKfgr+ZWu+86+o376RtFbAJfoPnRO/QCRrarcF2hhx/JhSEcrqi8gvhHf8ARuaDiK9U0TwR4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757309848; c=relaxed/simple;
	bh=RhOFMO390kD6vVPQk+wsaIHxpEh7Rl6s/uQ6K6nB+Bo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=P43gqST5b3AtkxsFS4zAn6jkODsD1kTDRxWl4vUSYfQtz+TaudIpwifAsljluhDTM0B0TueviJItDRsREnJ6xKCpakZUabbIHaWf5yp4FTvnBgH4HD5SnYohKz95jbFY0rh5wsWVsQfo6+iQwBhHkE9Rj+pvv/9eRYgj7InbEYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pT+UtsMG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pT+UtsMG"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587NutRF010653
	for <linux-sound@vger.kernel.org>; Mon, 8 Sep 2025 05:37:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=HWX0jsMcz+X
	znw8DUFwCpjh9opKGeTSObz3aq0hQzb4=; b=pT+UtsMGperxMiWj/SHOY9fBAa0
	RPiePWRqn9AtH3Yg1EdsgYIKWfxAjyiUNfNhfX+H5K50spInLYiRZxdN0U7iCypf
	ltcs5u4bGQo/OB8R2rVGgKuikfA4g7sAl5NapYvuwEZTl0mCSpOPIFb9LFZvhMLU
	w21oZgBPIKet6dZAAkP8Xxdsj/lnCADpl0NnLsYTjlF/N4zewxzhmVwKUxjzjBIy
	J32/S5mv+ByR/4BVyvfMDaphxNBo9GQ+i5BukH7Pm4cU3sAG/sRG5dRGEh+1KWXx
	yb20xRQ7jw/xR0z9xfXS97LPfkemrpL23Ug7h8zPHWbBp3AZAxBCT6ffEcQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4ku8hm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 08 Sep 2025 05:37:26 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b4f86568434so3300069a12.2
        for <linux-sound@vger.kernel.org>; Sun, 07 Sep 2025 22:37:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757309845; x=1757914645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HWX0jsMcz+Xznw8DUFwCpjh9opKGeTSObz3aq0hQzb4=;
        b=ATRj8of/jHPRes03bx/5U1rramJaHxcca/WiNpQ+fVzY6+TXPoVtdb7B856+y5SFg+
         9LyK0xynA4NZaa2AbCNvRBNtl0h/X5BIdG0D0AEP2nB4DJaLUXsGnebThOYFbhERUGlW
         U0kGkHf/OjXITk5md0WZKtmv6/qnQHv39o6GcO6iHxD/V+RI4aDmet1ErQ0CknBzuRQg
         FtwZiKOM0c/fb1rfzasT5Ec72kqUaCW9UhqvugYtAS+MhptrquQbGvWb1pdFe+j9uXpm
         kW1jhlxkUHeK3ZuuNqgHIHnWDgIq9y949Wx56Y68RejVHt1VBHg8nRAwYoIQbNulG809
         ioLw==
X-Gm-Message-State: AOJu0YzVJVvGfTwwuIHS8lsLzqe6yRRVrXukGrKpz5e8/qXzy6ndXChq
	BsvWRmLewaW3B21yG3gi3AJTtMhSuQHS+qpDnL1Z1ofCtkeJPeIyjziEAN4ijEFqsyLqvYvjyqF
	rC6wI+oDnMqiCHyJkIL7zFzgbxjgrExS3xcCI93J8IuMXgVDrsrUTLiLsTJ9BNSVjkg==
X-Gm-Gg: ASbGncty770Bw/h173N2R4JJCus0QUAvJHZ7fjarZHYwtpmzJlB8hPPcksWt9NRPCU7
	csxKaWWdYOeV0hZsgFvfB4DT1P6sEwk4HYkdwQl/mNwZNT//9pHiF7V0j2qMFbiOX6ktF+6/CjZ
	4mj5tQOPZbKw9KtH+sRrvMLT5vXEIWeBI3tv0ZMsyLeZRWebbl52yfZlwvIWztgTU9uZmd48K4a
	R1JL2tRMQ6ZE/6E/pzqt/cENcxa1oBEAhJXjWSGKTPgp+KCrTZIAjet8oEIYNImrjMNZVA+2gWE
	UJaJQYckUAVCwk2K7SB/JMmwn8nrd+mjjq2kfj+a30Hi1cia7Rp8OPmC4WxvON0mmNpatTIxfZZ
	c
X-Received: by 2002:a05:6a20:4322:b0:240:489:be9a with SMTP id adf61e73a8af0-2533fab5821mr9907416637.23.1757309845025;
        Sun, 07 Sep 2025 22:37:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiiCDYxE12pB+bzy1cltbrdX0bzzKGs/EE30YA0O6ftyQUyRTV93nZj0ULHEaojirXrT3w0A==
X-Received: by 2002:a05:6a20:4322:b0:240:489:be9a with SMTP id adf61e73a8af0-2533fab5821mr9907391637.23.1757309844546;
        Sun, 07 Sep 2025 22:37:24 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a4e1d4fsm28013488b3a.73.2025.09.07.22.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 22:37:24 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        kernel@oss.qualcomm.com, prasad.kumpatla@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 2/3] ASoC: qcom: q6apm-lpass-dais: Fix missing set_fmt DAI op for I2S
Date: Mon,  8 Sep 2025 11:06:30 +0530
Message-Id: <20250908053631.70978-3-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250908053631.70978-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20250908053631.70978-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfX+WydcoWXtsku
 8F12P2TriK5Tl2vykwOdCwQIu//5y2fMzRyBpzU7KOZ/HLT7uq3BotP7Y9Kw1O/5UBcsNMllSvl
 rZblPFR2rjdh3MhU4JWJZsVmvuIeAjq6kZBRvqoyU4Yu6WARx5bAlw8X9OEIeSvdwuHClFZhpsZ
 8ip6PoJpVtCizBprYzovSUTgQ7zVgXN3DJlX7NiB+bgQRQiKzpqsAm1JO5/DqGENgKAXCM41wu+
 Ik5YdumUSxU6yng3BgVeL1NqRJZBeUOSiYr96QQIESgMtabI7fpqd9hr/Pv+ReApHezKZZ500uF
 UsNw3C75Q5+hJohAMxRvsN92O3dSCVJGU3Rr2mqytY4YblO5plh3h78dNzDfVq4f2Fu2WbNpsRa
 kvXlyzgx
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68be6b96 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=VUbThP3hI7wIHPtXhhgA:9
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: JbxU3-Z1uBdxuWw0OBPOCpGXIcsaettD
X-Proofpoint-ORIG-GUID: JbxU3-Z1uBdxuWw0OBPOCpGXIcsaettD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_01,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038

The q6i2s_set_fmt() function was defined but never linked into the
I2S DAI operations, resulting DAI format settings is being ignored
during stream setup. This change fixes the issue by properly linking
the .set_fmt handler within the DAI ops.

Fixes: 30ad723b93ade ("ASoC: qdsp6: audioreach: add q6apm lpass dai support")
Cc: stable@vger.kernel.org
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index 20974f10406b..528756f1332b 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -262,6 +262,7 @@ static const struct snd_soc_dai_ops q6i2s_ops = {
 	.shutdown	= q6apm_lpass_dai_shutdown,
 	.set_channel_map  = q6dma_set_channel_map,
 	.hw_params        = q6dma_hw_params,
+	.set_fmt	= q6i2s_set_fmt,
 };
 
 static const struct snd_soc_dai_ops q6hdmi_ops = {
-- 
2.34.1

