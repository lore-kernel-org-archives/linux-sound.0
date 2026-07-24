Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2D944C512
	for <linux-sound@vger.kernel.org>; Fri, 24 Jul 2026 18:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784917510; cv=none; b=JyocuQrmIbLh3+xt+kW/X3y1bT+SQ+UXoowJ40k4kjAcE7mUlR1YFiQNswKbAejsym+wBDEGRH3StnIQAYs7Kfy+n7t2UdBOhNChtMlswe7gwvrtpuimqB9Oqa+OVezb5lVFOvts7SX4py1h3cVE8meh/N1tdOQU+7weTN6N1Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784917510; c=relaxed/simple;
	bh=fd2gjsHnk17kRZ1sAFPqzCllwBcOgpoNKv6YUrTU9yo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=Oomlmau2CnXF1so7IOpHvTQhv+s3+xm4rbKca8K4fm/IjBaIzg2KAyqsR4d84bD3vKu47whieixAZPAvFXrNtLFhqVcDYeXslUq/lrQbWU3HtAofriFo97v1elJ8UwK3tNjeqwMoM22nb2b1tRtnUDJNLr08bCu6JVteAl1DtZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E0nA0Q91; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dwN6sDsJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E0nA0Q91";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dwN6sDsJ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OGqVKB3516886
	for <linux-sound@vger.kernel.org>; Fri, 24 Jul 2026 18:25:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=i9y6oQUtbxwMV5JsskFIGn
	80A43nFpcz6ggSbUuDykA=; b=E0nA0Q917jIqwUp2xB9GzC9q5cW8Y0r8ZudaLA
	V/ucJbN9ZllSIoHkECxvsj5EkcVn7nPvnfV8PUioB90beIAiAOPceFbjksxMHyJq
	1JUJM0dPgg47kAKnGuxCP1YgT9ysqZlrxOis5hYTQMwZdmolqr+/CdbYzvqWdf+8
	Nys+kPbRL91DUwGevvPWaEbpn3PKxLSJ9i2c4G4BkjwQf61AMOkpPHKKHqLAAO6L
	mXwUIygwkZ6mTwyd7guMN0/H2zgS9yVNCr/xeqH2dUBPFwLArMOAtlw/OOpV++UE
	8iI4+y+/+G2Smi1DhYVNjyEvs2MVT7g+yLWuxIXy2o3hZpVg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm0pwb1c2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 24 Jul 2026 18:25:08 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb4bd11ddf8so747600a12.3
        for <linux-sound@vger.kernel.org>; Fri, 24 Jul 2026 11:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784917507; x=1785522307; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i9y6oQUtbxwMV5JsskFIGn80A43nFpcz6ggSbUuDykA=;
        b=dwN6sDsJCrppShe5q/Sjn1fs2jPYJ4F7Id2Y2D0QcdJ5phosawZ2z7IPiEIlhRGGZ0
         GgAvOX457Kg4ruPtaQXu6z0Z/hdGTEi8s/uPMzNKAQiGzffMGGmQWK+94rkMFssBq5BY
         ikCZ6nAK9yITfhTngoAgb6JoGvFGBOPbl+f7WRVXbSe5rv844Nkniak3eYB3dDANGYh6
         y9N2oi/OE3vTlKV5DAV06K0g+jC4Dho45Mdz3tAI4aL6b3fb3/TWFqJkZeCeF7UMFUk8
         9n7lSYwJ/ouvC0y9zNj6MO0E97piPIZP1vKAuAMNynay3DyMntMrzD8krbIUQZaBIll5
         vFaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784917507; x=1785522307;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i9y6oQUtbxwMV5JsskFIGn80A43nFpcz6ggSbUuDykA=;
        b=NozhYS0NJkAlQNcC5BaYxt6jizi+D8onVWPUX0rR6J30r+obJNZVB19nJMQcDYhXzi
         fS6xuoF7isbMwffKiBH0g6OQ5wRqshx3XyFE1j5+YpgkIube7ciHTVOOlHlab8U4w8F9
         gdaSvFa9AWqRSKLcY1N1oyUcU0nw4SAqndUmrGyMEbg2Qjat4rN5qvLQAUezBil+d1Qq
         AFL4lGzemwK8k2d9u9JSoJxXIuOlEwwT19qJ4L7yIHPL2i0hcoV3ZJ5FHyPeNl8XLQgt
         PKHTCTEO1GRMePqhQ3wVR4sEQFDSYTD20wW1B58bw7f16u2/tRUIKCongw2BvlmtPT9b
         l8Wg==
X-Forwarded-Encrypted: i=1; AHgh+Rq2/G2Pza/muIQpDId9rJUQHJan3xd5aOpM/N1P1XUOQhTlKWeUqm/Hv+a5at58und7KldPYjWC+2KQzw==@vger.kernel.org
X-Gm-Message-State: AOJu0YymxXQH8IU8d3sl2j7DNpJkkX0+b4/P0MFhidn9mY8OLAGDvrJu
	rnsZJfozbyyCZGKSfBOYvXnoKugBakENNESmGwck4wpgMyu3OQpKnKHFJVsG3114FG9s6V2ODBT
	UOhluKEFiHy5enbxyWfTDuwBm5JYanW1DeQ/kfTZBbsz6OAyb4sPyBM4z+2nksb1ZTw==
X-Gm-Gg: AR+sD102EV/9V3J+oQ+++gNa+VG4ynZ9mQkYaS5bTyvwmKX77WU7PB/l74NSxfJCKRk
	KRNWLxZ613luKCIKZ6kydrfVFP2U6+aVEoaa74IBJjTv+shkln3TqmQ5Y69kluKXhbqFd0YzjpZ
	HfkcMxK+FBDqThWeE/iG7sZQqX/pjP+AxpA2SdRbZevj8erS5pazKQRKzof+kWnLJFmJgUtkUTh
	2/1r52EbwZRWHBJzjuZZNfEcLZ5DrWjV1QIbGbNjyhEISWo3+a0JypZDMTSk5kbF4StP0o1+wr8
	kxQT+QEnkOlvExnFjMgkpLr1o8qZVbi/nXTmsRo0Gc9iww2ggnDR4sMY/hDo2L8zIy2Uo77QHAr
	drmyURCPP/qybPUbInxZzBZbNW1OXxFIg2ckX
X-Received: by 2002:a05:6a21:e0a2:b0:3bf:e2dc:bc85 with SMTP id adf61e73a8af0-3c44b1ca809mr9520152637.40.1784917507183;
        Fri, 24 Jul 2026 11:25:07 -0700 (PDT)
X-Received: by 2002:a05:6a21:e0a2:b0:3bf:e2dc:bc85 with SMTP id adf61e73a8af0-3c44b1ca809mr9520118637.40.1784917506739;
        Fri, 24 Jul 2026 11:25:06 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc5a67f3sm1669324eec.29.2026.07.24.11.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 11:25:06 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/3] ASoC: qcom: qdsp6: Add MI2S clock control
Date: Fri, 24 Jul 2026 23:54:43 +0530
Message-Id: <20260724182446.1484894-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDE2NSBTYWx0ZWRfX6cAz0ZtX3K4G
 +dRyEDI5xdvOau570SLCkUPHXEyTUnpYgy9L3+JuxSCXL0kcmlvJjIO7WJF2QKiAy9jElzIPkBD
 y8fEztPK3y2JP5je4UzP9ATHc0scpo3ZibH/WTnLAFHtZiT4EH40yWEeOrjqC2aSijD3TIEYwSB
 7NOkvr6yNFP8J0IcnyB8/gJuE2otPsHh/Xa1fAlU6lp3tiUJ0WuNlKB+kTIgVf0nZ/cQ0XnYDOx
 K3fW4S/imPH2ukDYpm851ssFcFMk8lLvIt2UZM5zmvqN/rMnxVN3axaa9A3kUqRNOS/Xika2ZEc
 nduVh+55R46xpntioF7Jtd4yFgrd1GCR41GuzhvU3EY0Eo815FZzxIi8YbKFfTVYVsFU2x1xc3v
 lI54+CzUBKNj/5KkCjcM1ug6lgCn7Mp7MEPiMiF9Q19ugOexzdUl33W6gmbJQLmD77Ziot/hkNB
 bFr2DtVFPMEp1lKGMEg==
X-Authority-Analysis: v=2.4 cv=RJeD2Yi+ c=1 sm=1 tr=0 ts=6a63ae04 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=kcwWOOnH8nsvB6J9kCwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: 6AyEh4ks7thzXll1B5U2kxmNy_x6FMqo
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDE2NSBTYWx0ZWRfX/NwBvtfpswak
 Uj/IoyHCgehHGVPmPddavW7F64UCseP48NE0OBWO+HWsBjs7UFOfTtWjALB3QPLuf9O0erqxUGN
 MBiNq90mGTXQsi9GrmmqosqeOZWRG/E=
X-Proofpoint-GUID: 6AyEh4ks7thzXll1B5U2kxmNy_x6FMqo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240165

Add support for MI2S clock control within q6apm-lpass DAIs, including
handling of MCLK, BCLK via the DAI .set_sysclk callback. Each MI2S port
now retrieves its clock handles from the device tree, allowing per-port
clock configuration and proper enable/disable during startup and shutdown.

On platforms such as Monaco and Lemans, third-party codecs are
hardware-wired to the SoC and do not always have an in-tree codec
driver to manage their clocks. For these designs, clock line
enablement must be driven from the platform side, and this
series provides the necessary support for that.

On QAIF-based platforms such as Shikra and Hawi, responsibility
for voting I2S MCLK and bit-clock has moved from the DSP to the
kernel. This series introduces the required device tree binding
support to represent and vote for these clocks from the kernel.

Enhances the sc8280xp machine driver to set the boards spacific
configurations.

---
Changes in v7:
- Addressed review comments, reported by Krzysztof.
- Drop ECLK handling, which is not required.
- Link to v6: https://lore.kernel.org/all/20260720160226.1026440-1-mohammad.rafi.shaik@oss.qualcomm.com/ 

Changes in v6:
- Addressed review comments, reported by Krzysztof.
- Resolved all sashiko comments.
- Link to v5: https://lore.kernel.org/all/20260714145250.2473461-1-mohammad.rafi.shaik@oss.qualcomm.com/

Changes in v5:
- Addressed review comments, reported by Krzysztof.
- Resolved all sashiko comments.
- Link to v4: https://lore.kernel.org/all/20260711125740.3083236-1-mohammad.rafi.shaik@oss.qualcomm.com/

Changes in v4:
- Addressed review comments from Mark Brown.
- Resolved all sashiko comments.
- Link to v3: https://lore.kernel.org/all/20260706132009.1496321-1-mohammad.rafi.shaik@oss.qualcomm.com/

Changes in v3:
- Addressed all review comments from Mark Brown.
- Fixed OF node reference handling, clock configuration, and sample-rate
  handling issues as suggested by Mark Brown.
- Added proper error checking for DAI configuration APIs as suggested by Mark Brown.
- Added SENARY DAI support alongside MI2S DAIs as suggested by Val Packett.
- Link to v2: https://lore.kernel.org/all/20260608023011.942228-1-mohammad.rafi.shaik@oss.qualcomm.com/

Changes in v2:
- Added a detailed commit description to clearly explain the need for this change.
- Improved the machine driver based on Neil’s feedback.
- Link to v1: https://lore.kernel.org/all/20260309111300.2484262-1-mohammad.rafi.shaik@oss.qualcomm.com/
---
Mohammad Rafi Shaik (3):
  ASoC: dt-bindings: qcom,q6apm-lpass-dais: Document DAI subnode
  ASoC: qcom: q6apm-lpass-dais: Add MI2S clock control
  ASoC: qcom: sc8280xp: enhance machine driver for board-specific config

 .../bindings/sound/qcom,q6apm-lpass-dais.yaml |  50 ++++
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c       | 168 +++++++++++-
 sound/soc/qcom/qdsp6/q6prm.h                  |   3 +
 sound/soc/qcom/sc8280xp.c                     | 251 ++++++++++++++++--
 4 files changed, 450 insertions(+), 22 deletions(-)


base-commit: 9eebf259d5352b87080d67758f483583d9e763d7
-- 
2.34.1

