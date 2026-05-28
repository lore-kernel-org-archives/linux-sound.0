Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8644327C18
	for <linux-sound@vger.kernel.org>; Thu, 28 May 2026 18:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779994705; cv=none; b=HJy0Z4O2qGaI8EjyRFl+W/nl8J14UMbhLnK5Cpdo1sxqE30byPKnw+cpuALEwl2ds9gNiYUZ0wOtx5RKaRNt1H5jVQEvjGacIj/s2gyurG6S1v3qCN5M3vQbgD2NCMwyhgb0klaI2Ef06pmC+GWmC1SO86E1dyCw2xNB3fkS3wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779994705; c=relaxed/simple;
	bh=t/9S6AeNLj1ovwarBDMWalZlR00m/lM0EbTcNGy2MS0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SttNNo/jyrQuPglNO+4OEVx5YCgpCwqCuYXV5ACjqbUvSNMXqXRIRMpUhJ4h7MwoLcKn4PT2XhUJfua1TaRU1ssDfisyzjVVDpVOUgzPApQqCUzdW46lGvJkQmLjLbv2bmZ4rAwn76uRUOFmKD6R5QJLIM2Q3T4U7D4lteOU+fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L5Yxuejq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fKnZRr++; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L5Yxuejq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fKnZRr++"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64SGwDHq2753569
	for <linux-sound@vger.kernel.org>; Thu, 28 May 2026 18:58:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=x7AZdku9HFm1COyt1+lX7l6F8Bbb3NUtcc+
	8Nvzg9ms=; b=L5YxuejqcqfFd5NOC1OHeLZCdgmrWrrci58rvW7RBTEv+kw0b4C
	Bl5wkbaYHqaJeyIb8BaGM0XGKEs2KdgkuIcltNQfhEZ6C0Rd1K7njUI+7JBUudlS
	RmP1W4NjkHnFqRHJ4sdOHLytUJaH92YrlibHToZpGJyirPXiYJxMlVwvHf8QcNqb
	hPW8VEh3uHBO9QBQQ9jGw+3pZC9S1zaBrPAnsyF8FVxMDLh4yZlLyca3yJzcn/Ek
	70b/6yUQkbU2JIhmxu3IFqT5lTJmSndxHicc2zFv2DXZ0ulskALBr8bdvwdNn0NG
	sTCkigYMMCEcJelwnU4CoJ0H60IC7ONZqCg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eespn0far-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 28 May 2026 18:58:22 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51494d74d4bso91963351cf.1
        for <linux-sound@vger.kernel.org>; Thu, 28 May 2026 11:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779994702; x=1780599502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x7AZdku9HFm1COyt1+lX7l6F8Bbb3NUtcc+8Nvzg9ms=;
        b=fKnZRr++eff9IkeZHw9YcC8+VAcIK87RMSVn6vzEy3egIpk7qvwf0dMwjQ9YDso7Rj
         CKdOMgf250qHfkfAbCPW9+0578hcuWB29dG9jkvAOfvBJcDJRuLaGrhoDB4wRv7W8X2o
         /NkNU/jeuoSHjRYlr8JYFHPVDOfAqMHTy5ScbtYI4Flos+FoyvLTh6V0504dfg8gglE7
         Te3HvX7YRVlrh7MuWz4IDRTo9QOGHfX5EB0IFhCaDMOQbVxzzBnXQsozvECPDFzTPgLS
         NxK9WN1/jiFSzzsl6grSphpqL9lIYcj0EVkbKYu41fDCIDrsC83C3FqaIm+19biKJfWm
         5apw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779994702; x=1780599502;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x7AZdku9HFm1COyt1+lX7l6F8Bbb3NUtcc+8Nvzg9ms=;
        b=nAm4/0hfl05xFV9RGT0HhCdEpKA8KEuh7UkWiWUtcVlauFutnuVovGm+8yCaPLdfDD
         yI2WY+Ax/9XSd+keF8Wu+4QRkYfYVnD2tWZbOujUB0iRsZ7IeFvcsd4/3j5j82dw2aN2
         HimizPcWLZ4wchJr3ATiWTDKIkDwwqbHs/18UUyVuYTUTJVqO24oCI+3k+6ueoY1NJpM
         BfK9YnDTnrr7lPy+mpqrgIafx3SjkUSOdyQ5NGDXpMvNuaX5z2w042HzyZQH+iVPoQ3T
         RigtgSsl72Pk8m8NYP47+6m42Do5WMiT0Vmce71oUsDTeqT7cFQhl6GmGyNtXp8ndZKq
         Vw6g==
X-Forwarded-Encrypted: i=1; AFNElJ+MLKEXKnodnG8mjyXbcUCKdVL4HO+AYMePezWhko8lHNxh/ipf9db7IIj6TfyE3MPUkdTns8K1mcOomQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf5gSakYluGNBZJOgfvHxdwxXWdtFY/gh2pk7UiMq80We/M6Xr
	mE2Zo9JSr5UZmuimLWELwbhc4JYVo5G2Y9GDi148Lxx5ygpVXz1aFNXIZGCNt6yg5DMlxcQoc42
	AZp86Y/FeAWGRhxfMfPsQn8zDSKVxcNfBJfeXPp8FRTDM0BJdyUQ5kRrgGRW+diBGRQ==
X-Gm-Gg: Acq92OEODbfr5VlWSEF3DDA1AOZYgRFoIeFCYK7XGeorth8BTrTMEmqe47mOeAbvyI8
	Qo/O+HjAZnAU9VuJcfF1yNIKTceZRRjs7DPiobLT78sB+oJ+AgRO6kIezgjlIBkkci2nQ6U7bJR
	aEYVIpIh10ZJq5OVmhSwuu0jww1azwRzlBz/0dG9QJIwoOYzEsWq+s/DKd7Mrhju6U9BvyuC8G/
	7fAnOv9ldFuxO5mttSLEDhJjVFWfP8DY33hcVPiu3mx63XKOHtIKxUdZma6g03rJ9MkxAnLYF6G
	7jR3agKpqZTtTkO/7u0oHvtAX/v1Dvt9ydCIcL1gjVP1ipaFjBDg3NUkUJIMGV7tj0IOm7JRtr5
	dQyqXeo1FjH2OUXTkem8QRa6fr2+Jyw2TZ/H2RQPy1q1Ev9PA9FjXXcEjJGkBwSgkscAUIg==
X-Received: by 2002:ac8:58cb:0:b0:516:7a83:8c37 with SMTP id d75a77b69052e-51722fbb1cdmr35047331cf.11.1779994702057;
        Thu, 28 May 2026 11:58:22 -0700 (PDT)
X-Received: by 2002:ac8:58cb:0:b0:516:7a83:8c37 with SMTP id d75a77b69052e-51722fbb1cdmr35046891cf.11.1779994701594;
        Thu, 28 May 2026 11:58:21 -0700 (PDT)
Received: from debian (71.248.69.85.rev.sfr.net. [85.69.248.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49099feef7esm3107165e9.0.2026.05.28.11.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 11:58:20 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        krzysztof.kozlowski@oss.qualcomm.com, alexey.klimov@linaro.org,
        mohammad.rafi.shaik@oss.qualcomm.com, ravi.hothi@oss.qualcomm.com,
        mathieu.poirier@linaro.org, andersson@kernel.org, kees@kernel.org,
        verhaegen@google.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 0/6] ASoC: qcom: qdsp6: add push/pull module support
Date: Thu, 28 May 2026 19:57:59 +0100
Message-ID: <20260528185806.6316-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 0V0F5ZbmIFeO4dxmHelxew7wG4LIWf_-
X-Proofpoint-ORIG-GUID: 0V0F5ZbmIFeO4dxmHelxew7wG4LIWf_-
X-Authority-Analysis: v=2.4 cv=auOCzyZV c=1 sm=1 tr=0 ts=6a18904e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=hLrqdhl2Yb02WBc7oxehMg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=NEAV23lmAAAA:8
 a=3lmQo_yHb_bEsz3NOkoA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDE5MSBTYWx0ZWRfXyRuSc9RRrUJs
 pXrOywocG4fTlFqK3N20JRerBIonlf7eOv66QCIuM+VnglxHw0gcnk4eUQph7dVSkoA4gTIWp3A
 PXQ3OlWt5GktZsq33qRiT/l0EU4U6j04k2AKzNftWqYWD/F9Neky9OEcystPVv2eEIHGcsjrB04
 yeBZ9eHW+u3614GQnVPhvvJiMsxRFO5djxdm3/iU3C6oSSXaFUnxb+7jkoG8CE+usJ1VgByYxjn
 gN+FFwCYSurM3KRK8cHAn51htKAKp0Ej+rLuU9mch5cp3H9sq+9EivhXD9mQRsxIXFiG4/g3yYr
 fRtyutGFX0ytVhii/ZxdPhYxqvwx1SsRduBpwANUFdmFsYxXPHq8EwC2XoPUFP7Wfme0FT3uJyp
 9MTWUI8MDWUvZBcQ/DcO2KqsZZBJuo72XC1kChYaZi+FiqCBPRk/smD9S+lVWbHub6l3Z/qwgiG
 7Apc+03Kp//mCSlQE2Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280191

This patchset adds support for Push/Pull mode modules.
Push-pull mode uses dedicated shared-memory modules that allow the DSP
to access the PCM circular buffer directly. In addition to reducing
fragment queueing and ACK handling in the host driver, 
This mode exposes a DSP-maintained position buffer that provides
fine-grained hardware pointer updates. Unlike the Read/Write Shared
Memory endpoitn modules, which are period based, where the reported
pointer advances only at period boundaries, where as push-pull mode
allows .pointer() to reflect sub-period progress, improving pointer
accuracy.
Also the driver now can queue buffers which are less than period size,
which makes tests like alsa_conformance_test happy.

Now the pointer update visibility is around 1ms, compared to min of
10ms with read/write shared memory endpoints.

Along with the circular buffer support, this patchset also adds
watermark event support to provide a period level event from dsp to
notify about period progress.

Tested this on T14s, Arduino VENTUNO-Q platforms.

Tplg related changes are available at: 
https://github.com/Srinivas-Kandagatla/audioreach-topology/tree/push/pull

thanks,
Srini

Changes since v1:
	- move position buffer defines to PATCH 4/6 to fix dependencies

Srinivas Kandagatla (6):
  ASoC: qcom: audioreach: use cached shared memory module IID
  ASoC: qcom: q6apm: return error code to consumers on failures
  ASoC: qcom: q6apm: remove shared memory IID helpers
  ASoC: qcom: audioreach: Add support for shared memory push/pull
    modules
  ASoC: qcom: q6apm: add watermark event support
  ASoC: qcom: q6apm-dai: add push-pull and watermark event support

 sound/soc/qcom/qdsp6/audioreach.c |  79 ++++++++++-
 sound/soc/qcom/qdsp6/audioreach.h |  96 +++++++++++++
 sound/soc/qcom/qdsp6/q6apm-dai.c  | 144 +++++++++++++++----
 sound/soc/qcom/qdsp6/q6apm.c      | 222 ++++++++++++++++++++++--------
 sound/soc/qcom/qdsp6/q6apm.h      |  13 +-
 5 files changed, 465 insertions(+), 89 deletions(-)

-- 
2.53.0

