Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795694271;
	b=0sV77U00quFhCIwt1v1CRAxFEySkli3C+Qw2zefuzismroLf3+VrPSgRhGmOVYNd+7HH
	 ldsiTvG38Hj/HCn8NqvNp61JSAbtsNyyneHYDAIn8GUQ+as+BGF1BBUUAVUIM7L2F2R7y
	 Rv4/ehlgmkABsGMgYZ5jwQymaE0SQApea8NZBmpr+W//eE1o7DCK8RV0JuXdD2G72zeRk
	 30cgZ/hauDd6YaUv9u+ktSoPofHpUjm9iO1rCivIxmxD2Trgp+0gcphDSxg0mx84QobeE
	 LOGlb//pLHiORT4nICyK7WaH118AEigWiPod096TfpC+EynjM/bvtNKLiLWmgqHXJhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795694271;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=65dy4D0vQNHIbdge304u38ErnayG6vQ30Zwna7XuBUQ=;
	b=YqVqbbTGs5hOj+J4QCjkPf+dafLwTu78EepoXHISjeVbs7AwUqc0jnusGpsDhh49ZyI0
	 dx1fC3nmGIsHcpCRbx8u7sf9V6OnRN0ZaZjE3S1ggWkUxs9TDzIwz6F0laFttiuTfUgoa
	 p1Wt5hBXN59ftlP7tpy+nK52EzbuRYXqAcKTKb06rjfbokDmg+Z7HVvf2Wo5lxapAgdr9
	 iV2wOllBv/7PMKEXmcgcGa4s3EN+h/Oq8+XzSHhH1qAM4ekmXzZrMDDOB3Fbuo/InKXX/
	 C/wBScyin68q3U2hGcZ6G4zQo2jU60meOYscWlV6yABCHYGXgLn2ugMh3P6ACCV40Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nyvRP8ge;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Iic6fVjz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07554606A31C
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 11:57:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07554606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nyvRP8ge;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Iic6fVjz
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVTVm2785161
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 11:57:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=65dy4D0vQNHIbdge304u38ErnayG6vQ30Zw
	na7XuBUQ=; b=nyvRP8gebq9rZDDl6lMUCXRjn7xtnLImqZS7S46xS184uJ34S6W
	yhuJBM6VUIqQN1eMSgkD1ZnfU2/WACDXtnljCG7g/Xq5WS/4dRZSVw0X42bXTad3
	8CS/zk2BEXh04LdNhlgFibJfB+PD2I8zhTNPMdCTUtl+jUy0x2+89qxisqyiKg8w
	ACt/HlNJ2vMd5SxCADq10i+nON957z1PGQEVukJah7SknYhkDBVZd0JrloCQDR8h
	9Nm48rnmtmcvMPRdjan3mzn28uydyCZNz5O4Ecafty9ycvXpIMnV128Dl+JvKbjK
	T++LEdoSnneJGyuXR+28JfE18aRVgCkopkg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j66qfatbf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 11:57:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9496ff065bcso935438285a.3
        for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 03:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795694268; x=1796299068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=65dy4D0vQNHIbdge304u38ErnayG6vQ30Zwna7XuBUQ=;
        b=Iic6fVjzhvM3ddDCXJLYb8bNhYXnFFM238MzCPfga1Pjbx9U59JE/M8x89E8br5pEv
         2vtM0gJKyUGl2qYOeOzffO5DZPaWZ97rPIpShZ4vKqJ8kIaWvYFIk27SYyuWhQRh05sd
         sA1kxzD9EbViA3qt5h5jOGpiagglF1VT1iCd2oNPmMCU7eqebz1oURFSjRxEM/xHyGaJ
         H01fMSDMgIngan+Zoj7FiAyDyNBrZ0XUj3p/+cL5juPbYAmAIsP1dXS5pdg6iNgt3jSJ
         JedHIMb8lE+ezH6wlSkEYhYwwfnfN4L9fRTgr/Qfqk22BVAqwiXxWSjWmYUqFt2xwrTD
         pxHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795694268; x=1796299068;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=65dy4D0vQNHIbdge304u38ErnayG6vQ30Zwna7XuBUQ=;
        b=gn/RBn24D6vc2LSDeuL9w0IMLCC+YucV5r82KdOEPrHtky7tK6hVMo1H9JfsYKOYFT
         ebdcTxQFtCTv0Ejhcxw3wuJT3NvpZQjsFCZruW/YWj1P77AeeIAeRPVnWA9KoIcIEheb
         dd/dhGcVO/uCUSVT5sCDKJPiB6HUp19LDIj2zHuOaFzIXMdW3Q+Xc0j+oKLN7rzGp3KF
         SHU4qLos84WpuA6+nQzneU+1tXd1sFTXAP/Y1Sm568qYeXVw71YRcwipJWRawrxdY4aZ
         9CuVZIxPI7LvkxtyGl5br/omhohw9I99XZkdqDROpOjdQutPag021MW7FF2Qjjz4AAaB
         8a4Q==
X-Forwarded-Encrypted: i=1; AL+hErEQcNARsjHrSkMg1npvV274J8Ew8ut9dJJ9zAvX6Bqv0DX19UgGamcVL74EyV5MxXhcSc6bwvBi8rC3hQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+2jzbjDM2GwmjI6lX/gVPGeL3ITA5phTS6R7Yo7UZINkdhB+EC
	3rW4orKiStFTWZHmd+fUjWA/h3TpxfLSK+ULmEKlW4xL7QDd4MDXi1AHWB5Qk42YsH1yOTcLMkY
	+4WHbWJKIIGCup6V0yNPYVzi4M7RIWNE+ctk3owm6lxJPUAwvOVWr9sj+IQgCGdVwyA==
X-Gm-Gg: AZFdTZfvc/TzzanUrrAjvp8m8ZZ2vC2Auc7CtmaEbfcNc0irgLIVe0jMnNc6D8iLb6b
	c3anAfsR8c9i0lEYbW4p8feoQL0HnTxHbeQ4mMrP3qXl0ODcBj9ddg14qCdHKROCUdSGK1mHSgq
	h4Nqu8rFMskX/ko8wE+HfUCXuz/RHwIXzoF6fjRUehZlIWpP2FovG92OXnW8VcFOwUclzDLCbmC
	oOKkK4d8jD2iCaTARSisQ8WxN186JTzVHpXc9WhCHtMUxIlBf5PttSAq/Fbo1Ai5cv64W4UJaAC
	95jvxz1SIW9IZt1gTmiD0U2QN2+DFZrZeIyBJHav77MD3kEeOFzWYNW/K0Z/Jq4jVgdJLeGjn1i
	diZ2cZdGSx6m+NVqm2tRwSNpkC+UC4WpG4cggAoZ273gsxWIAC4Kx8aWn5+td0CKl
X-Received: by 2002:a05:620a:2949:b0:949:673f:72ca with SMTP id af79cd13be357-949ba9b4a76mr3628845385a.42.1795694268222;
        Thu, 26 Nov 2026 03:57:48 -0800 (PST)
X-Received: by 2002:a05:620a:2949:b0:949:673f:72ca with SMTP id af79cd13be357-949ba9b4a76mr3628841585a.42.1795694267654;
        Thu, 26 Nov 2026 03:57:47 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf6804sm39533135f8f.10.2026.11.26.03.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 03:57:46 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Michael McAllister <me@michaelmcallister.org>,
        Riccardo Mereu <r.mereu@arduino.cc>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] ASoC: qcom: qdsp6: fix 24-bit PCM on QDSP6 ADSPs
Date: Thu, 26 Nov 2026 11:57:36 +0000
Message-ID: <20261126115738.1765949-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
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
X-Proofpoint-ORIG-GUID: IMdxxYEZCu6x8b7QDO9A33HiBzaPyhZp
X-Proofpoint-GUID: IMdxxYEZCu6x8b7QDO9A33HiBzaPyhZp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0NiBTYWx0ZWRfX6EwJNNL8ApqO
 Jdsw1LWMGvOzHPpk5WMvCC8cGR3u8hbzBh1NWjhRzGQHKxdzngF19QG1rOlElzL0CnU4YIQ60MT
 fw2+vG+Najne6az+hGkohBmwU0RUU24=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0NiBTYWx0ZWRfXwf5XPec6v7SK
 sBDR2tlEshLwaxZ/ovz2M/zmAHMuB8J0qiCWSfOpbd48KMPSc+YJQlfyNRYjH1ueDha284m/3bY
 ZlBWyoIPK55mh5GXj7rNIZTFRycMx5OSL1e3WdoSpsmyq7NARtRZJF4bx2nRxXNodYVxB/VboxJ
 Z9nYIex4PkiQ7NZXeg0AY8iSaK73bm9i5hafjFkL3fBcr84Z8CDNQLmwdnhjsAmPCNiGOEqEvZj
 YoINAzBS06cACrXMdOS+P+lXSdmfQFbmEKs5+uMFD0/EqAo80YkvWcxGZPqGzaWc6HIWz0lxJ4G
 +g+KUY95oT2cpWhe/eP6KdXYfCc2Y359Bn/z2ljWxK3I/h/jZ2jiAV4c6QlPPc4jPIjoVVOX+Rd
 70hvEqXd45MkSWGjt5pDwOMJzezEv4GIt82QkB1+oDesfGiasyEHKz/Jbxevsfsso/8ctyFqYc+
 efgJO8FZA0nT3fEp/ww==
X-Authority-Analysis: v=2.4 cv=Q5VHcI2a c=1 sm=1 tr=0 ts=6b081ebd cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=JwJ85b4fAAAA:8 a=5u302ktTOndDhYrJvdoA:9 a=NFOGd7dJGGMPyQGDc5-O:22
 a=qg2vb7sgHZQYDKbllo_a:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260046

24-bit PCM through q6asm is ~48 dB too quiet in both directions.
q6asm sends ASM_MEDIA_FMT_MULTI_CHANNEL_PCM_V2 for every LINEAR_PCM
stream. V2 has no sample_word_size, so the DSP defaults to
word_size = 32 and expects the 24-bit sample MSB-justified, while
ALSA S24_LE is LSB-justified.

Patch 1 switches to V4 or V5 based on ac->q6asm->ainfo.api_version,
plumbs sample_word_size through both playback and capture, and
drops S24_LE from the MultiMedia FE PCM in favour of S24_3LE and
S32_LE. plughw converts legacy S24_LE requests to S24_3LE
transparently; clients opening hw: directly must pick S24_3LE or
S32_LE.

Patch 2 (originally by me, rebased by Riccardo as part of his
Arduino UNO Q DP audio series) adds S24_LE and S32_LE on the MI2S
playback BE DAIs and teaches q6routing about S32_LE.

A different approach was proposed by Michael McAllister and was
developed independently:

  Link: https://lore.kernel.org/179416102230.53258.7301268454500974217.q6asm-pcm-format-v2@michaelmcallister.org/

That series keeps V2 and routes 24-bit through S32_LE + msbits = 24
so plughw repacks every 24-bit source into a 32-bit buffer. This
series carries sample_word_size natively in V4/V5 and advertises
S24_3LE on the FE, preserving the zero-copy packed 24-bit path.

Tested on db845c (SDM845, LT9611 HDMI): S24_3LE, S32_LE and float32
at 48 kHz play at full level through HDMI; S16_LE unaffected. DMIC
capture at S16_LE and S24_3LE verified on target. db845c reports
ASM API version 1, so only the V4 branch has been exercised.

Srinivas Kandagatla (2):
  ASoC: qcom: q6asm: fix 24-bit PCM level via media format V4/V5
  ASoC: qcom: q6dsp: add S24_LE and S32_LE to MI2S playback DAIs

 sound/soc/qcom/qdsp6/q6asm-dai.c         |  26 +++-
 sound/soc/qcom/qdsp6/q6asm.c             | 184 +++++++++++++++++++----
 sound/soc/qcom/qdsp6/q6asm.h             |   6 +-
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c |  19 ++-
 sound/soc/qcom/qdsp6/q6routing.c         |   3 +
 5 files changed, 195 insertions(+), 43 deletions(-)

-- 
2.53.0

