Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B216FC3
	for <linux-sound@vger.kernel.org>; Mon,  9 Mar 2026 06:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773039103; cv=none; b=f0QJH9vJYOj4qZ7zNOsPYpXeIfpPtLKUL41ATVUfCMZVbobgK9Tibte8zhAJMXXxgQyfbCoNmyHlUhHfvcLX2B0U8pyG6rPmMEMM6fy+K6jggD/NfJE9Qguf34/vEXqETeX2QOr1smQ2+jrELnFvrpYAgv1kIuosBZTieckiXWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773039103; c=relaxed/simple;
	bh=z38MtegwG3pVORKxx8amT5B8fQ+hdfij8SiR5NsMFQc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r6oGL1RaTf9bDX2cIZ5QbDlYFAlmGbLen8iFFNxzb2hHV49i5Bgl9aqMitR73smx7zJXdgbX4JFs1EySyqXnztNxMb+vZ9LFE6ETMC+MOtOPkfNcR61G6inKZTjiewn6JU5qmDjyXeUxnJHm7NKe12BDTnq4HJh0WE/l1tELjHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dO9R9LJX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZcRJ9fFQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dO9R9LJX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZcRJ9fFQ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 628NKESX797343
	for <linux-sound@vger.kernel.org>; Mon, 9 Mar 2026 06:51:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=tZyvIVKQnXEaXVDCKwG2/zwsyEc+0sPRl6+
	vscMtVIw=; b=dO9R9LJXBKGAOjLuD+ry/oOSqahPm1J1f3q5srVGh+ShxN069jP
	JgZXToqn9AzeP/xr+zLxFph+aIUJY0E3ZjYUQQPSQ/fpYWBs1L+YlPyuM7xO6aTu
	z9QjlWBrOdgphdysqAW/n8LTP7HfH0UMICf13crs9iQdW/9bn4GbM8TgpQHOAHMX
	jDR65s43QPyR8EiX8eQvRaswB2Kl4fcNRyc/u8tgkG08HrWi7p0Sf2GxSnACCVCy
	ESsOAQGlHLGcH2gWWZ994AbIca91I6uI+QJPy8GXfvj8J5ZQdRSjndLMb/kd9lFg
	xJZUDz45dCx1spQmL0sAz+ex9qzB8xfr7QQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crb14vbgy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 09 Mar 2026 06:51:41 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-506b839cafaso161212371cf.3
        for <linux-sound@vger.kernel.org>; Sun, 08 Mar 2026 23:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773039100; x=1773643900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tZyvIVKQnXEaXVDCKwG2/zwsyEc+0sPRl6+vscMtVIw=;
        b=ZcRJ9fFQ2h5wKI6ylpUpuM/L0Dks6trCsc1ne0XcwT2FYq92yMWxvUY2gNh+BJ8Gvn
         1p/+9BLeBHr/ecsl5qVaxVDYdZrRMH3ihtFk3OQ4W2fvkNfFip1ykWYQQ8bFYZaHw9Jj
         fWyAfunrNWXLxlphFUSJL1WKRFWmOMxEqqR7AcBGzQa4Y2tWMF4PAdfOnE1xGrGjyRYF
         fhKLwdN6tNK0of356TxZ/uImxOvZD1YVdjXMFNxP4Cf+sLHoao2MTzYhPcy5NtHQUzX+
         3FT/Dr0UhX3exDDj86KSQhtg6peGbxw4oW2c8OhT8YezSX6PfMLIozfHvGN3nLsOMOxM
         nF+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773039100; x=1773643900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tZyvIVKQnXEaXVDCKwG2/zwsyEc+0sPRl6+vscMtVIw=;
        b=FZC2DKBd4sR301AFL0Ql+A4/cFceqfOD5KStRthqJ9eCcKphhRQY6Vijg5QjKPdMjF
         NAzkS5brRx6rdPi/i51OaPfIJD+82U/w4oJh9cP0qBvrjJCHfz9f4pe4o37nihsrMLpc
         c1RMlh8MDIHeg4K9kTcgFXv2TwTHjVylVfvL0IDLI+W2dPM1B9SMiKCijkxAvr5r5pz6
         nmY944R6XQ38Els8jhdzcO60xtyj0wHV4kT7VlR18meyKuWdsrQUReR/fDLm87Y1jQb3
         mLX0VwhZ+uVbwrrcJOh/FjSVTX9TMeWQnD2dX8oZ3I7Blx0tP9clEeCpdpnHmfrRMxCG
         +jhg==
X-Forwarded-Encrypted: i=1; AJvYcCVPhe+qbFw1Ac+9fcXMQsClxS/7mXreecMgac99tgMLyF3unj1vtHScGH96OTiGOuFpsnbExji5djIarQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4EbKEZA8Zzvq/Un3EU/eSPqiysFansisEoCLr4m17zU3yXiA0
	HjmZz/KjX1dg/wuAogn8JRDbkMXRD1vpD/NNiNVcKjyHZ9p7EKLOkSSt4hsbm0/KTKIbqFH5mBb
	pxoq6oyt+TqdPrqY+fp5UzTEad/FUEGpxAUV+Rnqc1I5u95/+Cq1dyGYh8+iTuTkdBA==
X-Gm-Gg: ATEYQzzacBdxchGB6LnFLyze2GSw1Vvix0POIoHQuQY9H4VkuYI72wXQ0/dsMF8W6AM
	0XQKwFcor1GUUmMKzKQbg7hnGm87V1vnK0vATAc1uawloD08OWz5ndQniaN3jrJFWoSsfoAK5eL
	+mjMvaxrC2djQwt8pfNEz10qmWr/2QOw2P6wBR86R5FBDCi5uCtta2LTlhzQskDissOEow9HSp7
	gdl0tGAgkeUSFvlPivf3xuCDX5uDSEsBoKCUjAkyihA7mmY1bF5S9e8jwq3ae182ya+6+0nHs8/
	f2pIYbNvLuHOpk/b7ZUb4V8tClw/UVq5WG0sBxOXxxV8xXVLgDXok4hsXLHldOxdSDMcLfw0PGC
	ztB2CpP8SUt6q8/BCoWOy3myjqUMt8XCPmFUz4EZbZRZ/8RoY535qS8I=
X-Received: by 2002:a05:622a:44c:b0:509:21ce:1a9 with SMTP id d75a77b69052e-50921ce043fmr767751cf.10.1773039100406;
        Sun, 08 Mar 2026 23:51:40 -0700 (PDT)
X-Received: by 2002:a05:622a:44c:b0:509:21ce:1a9 with SMTP id d75a77b69052e-50921ce043fmr767551cf.10.1773039099935;
        Sun, 08 Mar 2026 23:51:39 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48529f01997sm80449975e9.14.2026.03.08.23.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 23:51:39 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v5 00/13] SoC: qcom: q6dsp: few fixes and enhancements
Date: Mon,  9 Mar 2026 06:51:24 +0000
Message-ID: <20260309065137.949053-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=IYSKmGqa c=1 sm=1 tr=0 ts=69ae6dfd cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=x8kTagw7d3iPfLn8lj8A:9
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 0qmLTL90wYuy_ta_XSmtqcQq4AmZEzjJ
X-Proofpoint-ORIG-GUID: 0qmLTL90wYuy_ta_XSmtqcQq4AmZEzjJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA2MSBTYWx0ZWRfXwz79uza0IZlB
 xBHgIWenICyXP3ohVm075Yr8b7Em7hHoeWMu9JivWHklCZ5ijWT3KWhZjqZAND6Ru+QIJ+tyIpr
 KcUqRsy5vGZEaJ1rz/NFu7sSvL6zeAVn1UJPmKcV4ib/N8jGT/cBHh3YfO75b8WY+H89APFpC1J
 y6n/0e5HMAYWw8+4f2un1YviBLVbnH/j2MnN8RUOiAYKsOvvvGOE06SYIwwZ/w/cnS4i/olhsMO
 M26JruS3mDOBEXhS1Wn/SOEy6Gs3NLluaMyoVdWuD9+FiR1WkhKzSdFTHFH//pYCeOYJv+xRtiy
 pqGM+AVdtQITsMyt+dRETvEcSBtI+QGmJvjHXgF//1FzQDPNxZ5P8v+WQ5hIGJLwKAFdAnxD5tO
 kloC2haK3PEJZFjwtOcRRrriTWtF8PfzrHjvdKf2x2p3Erlwcz9ggO0Z3n1qF+pnb7pLNwEGliK
 vd2rvIZFqYLZ+wudY4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_02,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090061

This patchset contains few fixes for the bugs hit during testing with
Monza EVK platform
- around array out of bounds access on dai ids which keep extending but
  the drivers seems to have hardcoded some numbers, fix this and clean
the mess up
- fix few issues discovered while trying to shut down dsp.
- flooding rpmsg with write requests due to not resetting queue pointer,
  fix this resetting the pointer in trigger stop.
- possible multiple graph opens which can result in open failures.

Apart from this few new enhancements to the dsp side
- add new LPI MI2S and senary dai entries
- handle pipewire and Displayport issues by moving graph start to
  trigger level, which should fix outstanding pipewire and DP issues on
Qualcomm SoCs.
- remove some unnessary loops in hot path
- support early memory map on DSP.


Thanks,
Srini

Changes since v4:
	- sob order changed for co-dev patch.
	- update range check in common.c

Changes since v3:
	- squashed 2 dt-bindings patches as suggested at review
	- updated yaml to reflect the new port supported

Changes since v2:
	- removed non-dt header update in bindings patch.
	- removed some leftover debug statements
	- updated function to void where it did not make sense to
	  return anything.

Changes since v1:
	- removed LPASS MAX PORT define from bindings
	- added few fixes found while testing dsp shutdown usecase on
	  Monaco.
	- replaced tab with space
	- added port range check in place at runtime to catch array out
	  of bounds in future.


Mohammad Rafi Shaik (1):
  ASoC: qcom: q6dsp: Add Senary MI2S audio interface support

Srinivas Kandagatla (12):
  ASoC: qcom: q6apm: move component registration to unmanaged version
  ASoC: qcom: q6apm: remove child devices when apm is removed
  ASoC: qcom: qdsp6: topology: check widget type before accessing data
  ASoC: qcom: q6apm-lpass-dai: Fix multiple graph opens
  ASoC: qcom: q6apm-dai: reset queue ptr on trigger stop
  ASoC: dt-bindings: qcom: add LPASS LPI MI2S dai ids
  ASoC: qcom: qdsp6: lpass-ports: add support for LPASS LPI MI2S dais
  ASoC: qcom: common: validate cpu dai id during parsing
  ASoC: qcom: qdapm-lpass-dai: correct the error message
  ASoC: qcom: q6apm-lpass-dai: move graph start to trigger
  ASoC: qcom: qdsp6: remove search for module iid in hot path
  ASoC: qcom: q6apm: Add support for early buffer mapping on DSP

 .../sound/qcom,q6dsp-lpass-ports.yaml         |   5 +-
 .../sound/qcom,q6dsp-lpass-ports.h            |  12 ++
 sound/soc/qcom/common.c                       |   6 +
 sound/soc/qcom/common.h                       |   3 +
 sound/soc/qcom/lpass.h                        |   3 +-
 sound/soc/qcom/qdsp6/audioreach.c             |  60 ------
 sound/soc/qcom/qdsp6/audioreach.h             |   5 +-
 sound/soc/qcom/qdsp6/q6afe-dai.c              |   6 +
 sound/soc/qcom/qdsp6/q6afe.c                  |   6 +
 sound/soc/qcom/qdsp6/q6afe.h                  |   3 +-
 sound/soc/qcom/qdsp6/q6apm-dai.c              | 101 ++++++++--
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c       |  48 +++--
 sound/soc/qcom/qdsp6/q6apm.c                  | 183 ++++++++++++------
 sound/soc/qcom/qdsp6/q6apm.h                  |  21 +-
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c      |  76 ++++++++
 sound/soc/qcom/qdsp6/topology.c               |   8 +-
 16 files changed, 384 insertions(+), 162 deletions(-)

-- 
2.47.3

