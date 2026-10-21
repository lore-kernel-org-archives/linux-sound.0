Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792555864;
	b=dueSiZT89q6+0b2jJVaNg1wuZoRMGePmrL7VHCI/uXjoRm8epGJ8gJswbazMNKO27A1n
	 eCWiTkfFULjrzObT3ze2FXt9ZrVGFa4lDnPy3n13GbtDm36FhKWDqWhacilQ07qcKDn2l
	 qIYLFHWqYsvM+uLizJgM2nxf2BizfmTmkEmFB+VCiniK9oPKUsyubYwSU5V4qrHRxlUOw
	 pec2BPLoCKD28oaYeGwXTbIW710XWpwTy+4pl36Nwwq77sRiS4l3o2pj05ac1vKluZrRD
	 ah3FbCsOmXXcN5tGqR+x+29RKqQu3L9n8feEG/amB72EKwKEIAXZFcjoAF7ML0Plf+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792555864;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DRwHzAsu4kYv/7vHMXqsZu104JeuOCSvLKfto/eg58Q=;
	b=jAYFFKO1DD+oWSp+J1d8ehM5feEdnIWpWsRxL2Kcw5hjFno0XSk6yWz0yBmv1kEndxC3
	 5UT6D3Ml1dEKYuPPR9+Z+hFbq63hVOvgwSaiAZXkp/sEtzztHf47isu6FWyzYec4QfaQO
	 RLjGkqLasiPQjJXuBRKivZ5fg0Kn2TYevG9Sj3xxEnYbINSnQ6QFkQdsUlS7A/lMdgrwm
	 S7xu7AWQTJQNYF2C5t1QhlRMSTzd7FNSydZWqMJoa3n+VxuFZWxsewc73VsECvHAiF1hn
	 56fkYDA0po5vxAZ37F+/kRe1oK6k9vfqkV4joV4Ppbhq15B1jjvFGnDdCQoiJcESKpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Dl9bYCHd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E5tKTbc8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5486606A319
	for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 04:11:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5486606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Dl9bYCHd;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E5tKTbc8
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L2ExH5300015
	for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 04:11:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=DRwHzAsu4kYv/7vHMXqsZu104JeuOCSvLKf
	to/eg58Q=; b=Dl9bYCHdXyIwzUyCF2SeUA9h6+mQAojQV0JJRQjd/I2qcojmpyE
	HMOYzLUrvalVi6CvMM5kEqYTuEWRFJKz0RW1Tj+suGcXJ6o5gPaA0el4MfqhVeK2
	0fbASxwlzyWzs9zTh2uqHmESWFxrwrDd40Pg8qYAnWn1kjKpEJX2s4ExPDBhv2yp
	R3TlzxxVNGckdg90CL42xSpYYEuZajc0hR0KM3BFE/wGy6KZ7/IL8R3ke4UyNy5t
	f0f5bDsRcnHUjgU4Y++bPOIl+I7UtXJTG+CYLK+uKwvtr8yO6qrrCDpjsDljTCu8
	Lm+JCzxM5meG84GKrWcwwpMJuIez2Ot2sGw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda4svmj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 04:11:03 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3510d0baf63so666144eec.1
        for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 21:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792555862; x=1793160662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DRwHzAsu4kYv/7vHMXqsZu104JeuOCSvLKfto/eg58Q=;
        b=E5tKTbc8k/N6cpreQNznQflMHw+T4CaWLFtXqeYgrd2Y4gPACS7ZyWPvIKwctDHgCv
         PpW2M6QNpZzd4xQQIKkslqaKKypkmItfy6q+CH0L+LOnBwd81vn7tbfLrbDTb5LQReGd
         /4fhCTkznf3HqIncp29pJzFSZfbS8VAyMaTGjptZmUGLv39njiZSq+SmoLTWWXqQaMMU
         YTHRYboVajDir3pXb9oAAkwZxxJlA5srK2NffT9qbmkT00+go/e9gp3z8kI2yfBmn1ub
         C6uUcH9O8sJmHAP96n5BTrHO0ukqdQkZrWXoql/raUK6eo6RgmueFntZ/qXAXNytWhS8
         tDpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792555862; x=1793160662;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DRwHzAsu4kYv/7vHMXqsZu104JeuOCSvLKfto/eg58Q=;
        b=U+vzIiEu25TB0Du4P3Eq6qaPFF1JBWxezDSSCMYJG9TdFt2balMPJJJdLkp6oDmw3Y
         X9aPRIzveT5UzPmR7PqeHdm75e3SUo9mgtgjoGBNjvLiAqzFTjQbQjgyfTmvJVgzQcgc
         Fk5K79/IGqpn6/L/vYBZKQRYhu7d0s7NC/LFiVHktPBKledy9iLYXOI0/nZ2NsAIRmnY
         RPs8OHkip4MYyChi8DKBMeZZWzW8x4qKpLzKIG7h/1gMLn8upU6hTaFI36cUaqaUT0iB
         ZM2OXTcVD5Opil2Yg4Kl7qbwNBhclhJ+MwDlpSRaLZd627bflcAIY2iJLpgcCMhJ3cpl
         4LgQ==
X-Forwarded-Encrypted: i=1; AKwUvBwAABOR0drIZiAe5NNOP4gjRbC7hNJ8Dd1HB1mFlh/sWs9GLV3KBoYjspN1NFdYGZNUZv7EHZKYL6tX+w==@vger.kernel.org
X-Gm-Message-State: AFq9FYIEY3998qyUxkjjmLVZJKO6O+L0VvFd6DOA3CmnPdJ9xjXZrT58
	/mLsaPm2zVqKCMHO61tU8Qnz5Orya4nri00Um06fguoRHuti1GUCzCbUy9YJ1AujDlP/EntEPNZ
	3yKKrp8jdVSb7+Q89BLC/xnxooaa6WfIAQXqmqTAl1uXnOrnAhcQBeXnomH7cQdAO8Q==
X-Gm-Gg: AYBFou0KF0h5OpsunsvcaOHkamiicY6NwFigUiw2rPou1EKV2PTGZ0CutM4ROdn4enL
	81/Zlc8m8ZaZekSmBAkkRDEKcOTMectN+DOoGlcm06RuAmPLZ8jd4rrzGh1GqNEBDWh1E2CTYVr
	pPUNXXotBN8QhJICs0GQriD3c4Mgq34MWSndSszN6XLbOQPnRKfaK0kq+FEEDeXZ8mT98dplkUq
	EzLKau9rrBPZUph/Eeh4GTCJL5CAugyHljEH7a4qRA/cCFAIZi2d1HcaTka3us5ZI78ks17CLEY
	hJVF+UuBuaA7D1qui9brTR2JGXQ3S0e0SYZNDttVnFnopNrD7KHiM8/GjNh7HAGwoGNq/ZQiNoU
	Wmphg9bjIRkNBAgCzwiDvQDv4p+p9UiE//vvECPH6e6SyT52P7Pt9fW/VEc0=
X-Received: by 2002:a05:7023:c019:b0:143:7001:7645 with SMTP id a92af1059eb24-190a8f51d82mr965145c88.47.1792555862090;
        Tue, 20 Oct 2026 21:11:02 -0700 (PDT)
X-Received: by 2002:a05:7023:c019:b0:143:7001:7645 with SMTP id a92af1059eb24-190a8f51d82mr965116c88.47.1792555861468;
        Tue, 20 Oct 2026 21:11:01 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903e02901fsm2915427c88.22.2026.10.20.21.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 21:11:00 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 0/3] ASoC: qcom: q6apm: Fix shared memory unmap
Date: Wed, 21 Oct 2026 12:10:41 +0800
Message-ID: <20261021041044.2080369-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: BEG6RPGZv0ePi-YCgdrtD_e80uxtioj6
X-Proofpoint-GUID: BEG6RPGZv0ePi-YCgdrtD_e80uxtioj6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAxNiBTYWx0ZWRfX+Yk1TX5zXBu4
 ZNNxVAphIUdRmaf2RkR5+eJ3HfTvjBRXMQZue/HbNOKMyLebg2naN0aT5XL4/w2BHVQutbTN6d3
 S9d2fIX1YslrSC5nSa55ASTBK9ioXUo=
X-Authority-Analysis: v=2.4 cv=R7aWitRX c=1 sm=1 tr=0 ts=6ad83b57 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=jKFkqTp6JJoCw1ulDCgA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAxNiBTYWx0ZWRfX4ZSJ1V9+/L23
 XPs2yr1UO8VuNTuU9CFKxQfEOZqA4kY01QTa1VDrscy1zQwrshmOnH1UaFGdulUkKmjkuc5IBew
 CGAyVhFeJiifFQQl8lq03P/ShzXuXxrOpoAOpt1fWzQ7GvaMQazJQPSoEQmU1Udqh48pGA0UOZH
 N+uv6jLcgpomwfRN1+fpIUcxjdQjcNWoiBFpZDUn40GfeBenZu1zSP19TqpxdZGXYBrIZSrCEGp
 JggYbHeTgUPKgz65iZIk8JwLSZZLSOhhm67quiENDAikIn2u1ie8oQvbXOyLJpQWXs5naf1NuUM
 0mpBpLET9b8OC8z+4lC+2R178jZBIP3e2xHbQnM7K1+if6fLrVW85zhMpvdRyPrcRDej2rspnuY
 teT34JoK3wgJUUDs5NFJFzuYyDgMztMtUcOseDaI7V5ZKxzDsa+rxOaykJTnfQDGfuzF5lSYv1/
 g/lwsSVn/GWZ1RPD/DQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210016

Since the early buffer mapping, q6apm maps a front-end's DSP buffers
once in pcm_new() and unmaps them in pcm_free(). The unmap side has a
few problems, which show up when the sound card is unbound and bound
again, e.g. by unbinding and binding any codec on the card:

- The card core removes the components before it frees the PCMs, so
  the topology and its graph info are gone by the time pcm_free()
  tries to unmap. The unmap is silently skipped, the DSP keeps the old
  mapping, and the next bind fails to create the PCM:

    qcom-apm gprsvc:service:2:1: Error (1) Processing 0x0100100c cmd
    snd-sc8280xp sound: ASoC: can't create pcm MultiMedia1 Playback :-22

- Once unmap is actually sent, every command stalls for five seconds,
  because the response handler matches on the wrong opcode:

    qcom-apm gprsvc:service:2:1: CMD timeout for [100100d] opcode

- Unmapping the position buffer clears the circular buffer's handle
  instead of its own.

Patch 1 fixes the unmap response handling, patch 2 makes the position
buffer unmap clear its own handle, and patch 3 moves the unmap to the
APM component's remove callback, before the topology is unloaded.
Patches 1 and 2 go first so that patch 3 does not introduce the five
second stalls.

Tested on Qualcomm Ride board by unbinding and binding the PCM1681
codec.

  echo 0-004c > /sys/bus/i2c/drivers/pcm1681/unbind
  echo 0-004c > /sys/bus/i2c/drivers/pcm1681/bind

Changes in v2:
- Rebase on next-20261020 and drop Assisted-by: LLM
- Add Cc stable tag and pick up Srini's Reviewed-by
- Link to v1: https://lore.kernel.org/all/20261016141153.1346219-1-shengchao.guo@oss.qualcomm.com/

Shawn Guo (3):
  ASoC: qcom: q6apm: Fix unmap regions response handling
  ASoC: qcom: q6apm: Clear the right handle on pos buffer unmap
  ASoC: qcom: q6apm: Unmap DSP buffers before removing the topology

 sound/soc/qcom/qdsp6/q6apm.c | 49 ++++++++++++++++++++++++++----------
 1 file changed, 36 insertions(+), 13 deletions(-)

-- 
2.43.0

