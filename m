Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655633A382C
	for <linux-sound@vger.kernel.org>; Thu,  2 Apr 2026 08:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775117503; cv=none; b=oAtOpLeH2cnoYC1QFRT1ZXdg54xIBBNk024EY5nhDbeQ1ykHk53MjonTe71PUUyBhVGjMarfNuFhElqlBqImwugnqI53mGuh6n3vSE3cGwkYI5zlK4g5we+FG0zRbqZW9OT3aPMcYcvK+Cs9dIL/QbmhjIF/gFn1jshRFmX+RNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775117503; c=relaxed/simple;
	bh=FbZUTwPZN/behyTIEI1t6C+aJdSSxAUvCVcJ47Xba5w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Bfva01WdyhFcMjOzNcb9ApIYEZzZRljpROMhpLr3C22zb0SAFSiiO1K/MlYzqmF1rLdrW1hBli4RUVLC00DeMc+Te5DErM7lXQ184b9vi7WdNg6RDPpwajlsm9Ra8463D3JGLB6i7P62L0e3ZcUlYg/IOtjffPOvbKF04nTh7uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DSEDwxzt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SFLLRCYh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DSEDwxzt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SFLLRCYh"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63273Abf2903314
	for <linux-sound@vger.kernel.org>; Thu, 2 Apr 2026 08:11:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=5Nb993gNj9E9Ujy1Y1wxP1UEl3hgOY2Dbp5
	d+XWNVO4=; b=DSEDwxztf1a8fWc3URP3lu7Kqa10ly/M+LXVzUTL00JckPGF3Yw
	QraRYlZtUsf8ceEpZcRSlIuRDWiz0KGpzAYEajf5bGM1GgNtKnGkfTpt7yCYaZOJ
	QZFdhJbx2zHqRXMj5xVTWW+nrHllxS+Hu+wXodY0ys/nyljczMCQLn4OCpFUjhCa
	J0SOkcdT28PxHP6GRg7CxPa0pqdZZUorlxDjzHdElTXbrPdLcpIxrCIHo37VcDp0
	EN0xXt3xYDEtxn27JWiLpEePud64z0sfYIWH/Eyczq07wl0kZuMK2EE1JU0GeLla
	R0WKmUlYZMaMHqIFbyRQip73O/6vPsMYakA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d954cbnya-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 02 Apr 2026 08:11:29 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-509070bda13so1876371cf.1
        for <linux-sound@vger.kernel.org>; Thu, 02 Apr 2026 01:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775117488; x=1775722288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5Nb993gNj9E9Ujy1Y1wxP1UEl3hgOY2Dbp5d+XWNVO4=;
        b=SFLLRCYhPD60u1+9c3+zQYh2ruI/vWXmDXB5xLu9ikXYbscsG0AYbSk2T6ntCboMv3
         cJsFaiNOKkKps7l1yZVkb80XEfcS+mNd8vyQrlPwOoLkzKzoJfrGUN5nqSWM6Cx91dRT
         v42Tua+hh91ZVMQXzbY2kyA7WMyc0xEQIzQoKKORMCXhdag0qvNNzLeqXjPmSNst48FB
         JNjxSulKOMQ8igBsQTCeKJ+rXqQWlUBjFFNJrJeSzReTAXg9F21OqBUu3swthNKHQgtP
         UUtsmqWyK/OBZFj7jNYLRyqHC94o5sBKTSzg0hosiV1t1M/Q6SA/zS7YX1GdGzTClGGm
         kbug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775117488; x=1775722288;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Nb993gNj9E9Ujy1Y1wxP1UEl3hgOY2Dbp5d+XWNVO4=;
        b=ZwmX8hQCBIzjLFCPvKl93A/v5ZLEPaWC6K+vfcuFoZMWJd/SZznOBKzqo44DsdCgNQ
         +Q9LhhYSxztUIcLYxtixcv6+KK78lU521PESrIoNgGiK9y9EZJhjcJg1lNr+isrMFHGJ
         ZJIUbif/t4GS/1GrxmguwtzBNThmYQ0j238OhvJABG4gKj92SM/D1kG5+1VEOcyBgm4n
         nTY/MVK8eaLi6KsGVhpXV4ubh4hdUarWwcn4DxNxmfzSU6ICitUJPYILk/6cYlsg49OV
         B+keRfnSKKalIlQzUiFFFYDMxzPF09YFI/8WpNSoaBLtRJa59B8amqntzb7GeGlWxAeJ
         1rvQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3ufsxSkg6j2vyZuxgVXiVeo4fYM45VI0reKc7r46FJ8O9GMSab0/EGEDbk65ZbWh2OWfoCfeLD9OAVA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yws9LL+wq3TmnRXXYt0Zk48Haw+6HLcysN+B6NcSpfnq2uJCOaO
	VQ3BnIiiJobpLh4ZYqlIbch1fZ7CYS/MATzLr7w1wIrlhbc1nGxVurUC8gjOqr8b/izY0VrxreN
	w1VSsc7rorfPyMquWPoYNrFY0T/fJf2iqTMBWJyK7P95gcRN3kVDzeNYZOWDE7UgFrQ==
X-Gm-Gg: ATEYQzzi8NnFm8H9w8DNAlnO8JTq55iZ0x6zCjnOULaFJ9zXyQi+UMowR4fR0XukAtT
	ZqWT605HyPIdsymLWYxN6l7PY5EXS12M3JymgVkG8r3Wvg/xCQgyZTTIPJHcCK/z+KyInGiZ9V+
	Oe100QeLDuwApuOUTRjMJENLB+jXAG1goUcFldEeGpG+AnunqBLVyB/b6w2HaaaEPmtE8wQfNdY
	qnUO2lYMeR1ptwELYqZ0iGY+IucSvfLLJu9+Qqridhd3HITVE8RzpZZJ+Jw9h2YYJBJbESM0mw+
	XzwwblUx2BEzXag5kdkmte5uA7ME/6SMupgtqR2Ljzei1odzc6DKzqz8C5awtTCfyuKmNLNcpUG
	ZCFz15jNWlF34qH2g6YfDdiv86bexDZC80ckeAXKvjYtWLd2XjldG3Z8=
X-Received: by 2002:a05:622a:ca:b0:509:f1e:41fb with SMTP id d75a77b69052e-50d4fa37517mr16175011cf.6.1775117488038;
        Thu, 02 Apr 2026 01:11:28 -0700 (PDT)
X-Received: by 2002:a05:622a:ca:b0:509:f1e:41fb with SMTP id d75a77b69052e-50d4fa37517mr16174631cf.6.1775117487541;
        Thu, 02 Apr 2026 01:11:27 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c3a01sm5712604f8f.12.2026.04.02.01.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 01:11:26 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org, val@packett.cool,
        mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v9 00/13] ASoC: qcom: q6dsp: few fixes and enhancements
Date: Thu,  2 Apr 2026 08:11:05 +0000
Message-ID: <20260402081118.348071-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=WMlyn3sR c=1 sm=1 tr=0 ts=69ce24b1 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=D3PLcYtS35CotE0LyjIA:9
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: zDbJM-3ZokrJK0m7R1FEKjF4SPjQBmpH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA3MiBTYWx0ZWRfX05ouHD7MFajP
 ssd/e2I2bzRFbxuBlpEe5fSLq/oV5PN/+s9uVu55BHa3HfaPwwOttSiwaBOBXtlEEon23+ACeu5
 9iIpUaf4/BTTqYU4JfaJqmubZdXiR+jVQZGWYlkz2r6M3WDsGuaQVp9ZwLPQ1SkfvjwTG4Ft10i
 gHRDyaoOWrzLeNlvM1/PlmuWRmxSSXGmvjmVyiUrCX3AhaMRwoY/MFRqsF3HfXm+F+Q5FWGiTGK
 dzIrn3UHjwNzo1p6JFM6mZp3/i3It9FYoHjOuutiaGFEdvSTE4L5tynH0zFonbQ6PfLX22I7SeB
 9f33zqgz9q/FqO0GFW+GtFEbuW8jn40rjYVA3T8J5Qt2rFKUaBs5NbgUbaL9m5xUsRQby/G3T0x
 kXzXMwJ1p77MkzNX5lyLCPatC0LKMDO9rkJJFvFL0UN5Ia+oQueu1gwGyErPOnGbHVoOk7ALc3v
 QGI+0IsnMx/6KiXhQWQ==
X-Proofpoint-ORIG-GUID: zDbJM-3ZokrJK0m7R1FEKjF4SPjQBmpH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020072

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

Tested this on top of linux-next on VENTUNO-Q platform.

Thanks,
Srini

Changes since v8:
	- move "ASoC: qcom: common: validate cpu dai id during parsing"
	  patch before using the max define.
Changes since v7:
	- improve error handling
	- remove unused variable.
	- add comments about bi-directional dais
	- in q6apm use of_platform_depopulate instead of devm variant to
	  make sure that devices are removed before component is
unregistered 

Changes since v6:
	- improve error handing and add a missing assignment.

Changes since v5:
	- moved to using pcm_new/_free as rebased with linux-next
	- fixed typo in q6apm_dai_pcm_free
	- added changes from Val to q6afe_port_get_from_id
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
  ASoC: qcom: common: validate cpu dai id during parsing
  ASoC: qcom: qdsp6: lpass-ports: add support for LPASS LPI MI2S dais
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
 sound/soc/qcom/qdsp6/q6afe.c                  |   8 +
 sound/soc/qcom/qdsp6/q6afe.h                  |   3 +-
 sound/soc/qcom/qdsp6/q6apm-dai.c              | 113 +++++++++--
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c       |  48 +++--
 sound/soc/qcom/qdsp6/q6apm.c                  | 182 ++++++++++++------
 sound/soc/qcom/qdsp6/q6apm.h                  |  20 +-
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c      |  76 ++++++++
 sound/soc/qcom/qdsp6/topology.c               |   8 +-
 16 files changed, 390 insertions(+), 168 deletions(-)

-- 
2.47.3

