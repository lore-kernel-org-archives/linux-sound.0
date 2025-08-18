Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601A031AF10
	for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 12:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755519773; cv=none; b=BZm/uuE4mSUxoLDglUm/0FosWJeqMRZoNJm0aP14UlwbPlIX7vlRZRd9YFwob2LwxWiR8g4JEEf5OKuQdX0hWuZReiLQA42twCibcBtPE3FrC99wR6IuDrcrldnB8qxbze88gkVCbXgxdkaERZU3jS3aSUgWzEMUjNRzUCpAcvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755519773; c=relaxed/simple;
	bh=woYR0S8MjkM9ZAAwccuBmWu4hFKROEcrsh0YhEXKIQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kuNDImknNUUZ9Wt05kJD3TTPQF9A7MP9ZBlSDoiJ/YgDBj+Ed4XJcl4hZeBHA6OByA09DkFFgaq8Fo5oLM8C09iWggyzzuqQ+UKM4wcPP/Q0Mm958E+Tu4oN2ndBlEx4KHTfy/PcDhRWMgWu913aWUGcbXRAtoo9ejqCc5LNQus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o/+vaVl1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o/+vaVl1"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57I8N8BA030849
	for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 12:22:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=CcyrurzVclubp48xK17npWwFzjopK9C7v70
	/ul9zeI4=; b=o/+vaVl1A3jnFnRMUBM7v1l1YGxAplA/ny9/JC5SKyTPr1ojNqS
	HdpN7hFlXHT74IK0nUktW8eAW4lDm+lo1Tys+bPOkyjNiGda+TY3OoobXartgrZU
	B1nQUmMzHbHBFB1a+BaOl93VM9Hf7WNCsgUjM6sSEtWNGwOC+CQ2whyC2TUve/Q6
	Q1udpfTb1po+x6myNGTGG6COQXvHqJCf2tDHAjP888TWvZxIOnQCsKD9pvjmyJdX
	GKhBpLaSDnx4Gr/io40sx640DE58tX9O4WjU3gIekyopQhmIhK+AJuwCunqtrrIT
	eiwzWT8WN6C9hL0ZH8eq8LFwOWT9IwG6a6g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jjrfvm4a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 12:22:51 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70a9289280dso91193836d6.2
        for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 05:22:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755519770; x=1756124570;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CcyrurzVclubp48xK17npWwFzjopK9C7v70/ul9zeI4=;
        b=RjbapOkKJ0eaEPhNSKSPl4wkurAxsIKr8+caFe6iS7J0KglCtvMhnN1hvW5fR6RvB8
         TusEr/CvXT6MbD2kNYabaZ+oyOLBfhoJp6azjRumq9vXHdMpmIbGqHh9X/s+EIaqJI7s
         ICwl85G3bkQaKXv+RZvUpwGMapE3tPWZZucEwxfYgst7/I2D+IBOECpr9kNdCx9wgeyK
         qYwICIlbMWZPJM0JzUdRsSg9Lk8hlKEyAssMLYi9J3P53To4Qjq/sQJKtQGsYAqKVkMd
         j1Q6EQ8ja8CwPM0fQYAfFYjHb+Beg5Cxrp82aj2DFDosvGTuTslZAl6YlT++xwji83YJ
         S9vg==
X-Forwarded-Encrypted: i=1; AJvYcCVLKDookvY2nRX8ELwTxDkDcSkmiZNn0IGl+PfQk4OVxzrLXosCq76n8q+R3F9nD0j0QGXUBO754vcCMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRDHLXcgM11jOfZW0Fw4EAQXJqEMTyBnsUgjcwendlhEH4Ukax
	sWNGNiExD1wYlG/855V0djkn+MJMaLHG3UF5ySweHkpxuxfDbtXP82YASqIj4peuNATUUTCnnU8
	i85YV26sQyWPgwrnhlopXHlzLajnY07M9HBtJ5kFQ2+OWV3PjVItQpKBiFekEsPcPJw==
X-Gm-Gg: ASbGncvgIwTP2DsyR/VhsZ0uRLlO+AtEjknoW9REqmBm8NZRW4pgsfnjihukjj56svH
	6//NEB2DfzMRun+UCZ1geIOOE8GS/Fh7NVOBGdAcwN5PrQ6G21x7jPz5DJdTakDv2kjAzirKBsz
	10fd8p+TiJZGvFfen65Z82t30W9j+nTqHXUMmvcQNLJPFfX+K8AaHs701vijAmnL7qGleaPMf/d
	yb2VVrgeinPvD0GV8pddGWWcPhKgQx7XMVCRvFQ69B4IaGFxeCIk7Qq5tSNOO4Kviw5+qdYh8EB
	qNNWpcr9N3R+h41QjOCpG5gh+7/GcYUeDiF5WR1kcFlUzOeAFT+lSw==
X-Received: by 2002:a05:6214:c43:b0:707:6c5:55ad with SMTP id 6a1803df08f44-70ba7a9b906mr133531256d6.12.1755519769767;
        Mon, 18 Aug 2025 05:22:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG45A8WxLBwNz5N151tfynjvFYn+kG0tl5dncAsfpskCOCbDDrJKZ7Z/t2auL175IhLqB2fFg==
X-Received: by 2002:a05:6214:c43:b0:707:6c5:55ad with SMTP id 6a1803df08f44-70ba7a9b906mr133530826d6.12.1755519769141;
        Mon, 18 Aug 2025 05:22:49 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb653f657fsm12601563f8f.29.2025.08.18.05.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 05:22:48 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 0/6]  ASoC: qcom: audioreach: cleanup and calibration
Date: Mon, 18 Aug 2025 13:22:34 +0100
Message-ID: <20250818122240.1223535-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: kC1jwsaQFSZ7zy6gUqrUAva41kPX0dwc
X-Authority-Analysis: v=2.4 cv=YrsPR5YX c=1 sm=1 tr=0 ts=68a31b1b cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=qzXCfJFTvBpdW4sr2IkA:9
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzOSBTYWx0ZWRfX866JSBxlLk3C
 u+n/B5fzc/1ACfPuyDDGH9ZIGQNKUq68+w2u1IduT88HloPECVt2swH7f02CZJuMVatoWhFF5Q2
 S2fUfeje3145tJyOBJFNJDsFRRfT88nURjmqZzr6iyv+/MY+mEv9GIsiMal0fosJm5nSptA5MeI
 pJ1t8XARgKqV8u3L3tbjCQpKUWVT8D9mfwpoHb04KD0fbaZbJ40I2CZN1Sxns1H1i7pfqUM7oHk
 WY8vSEpZa4u0ZvLywrSy/Fq2//+jdKvd25i+/uK5iZYza0D625mkY2HPJ06FZXld4eCxPRBhwcN
 s5AJ7VVBWxsQBYiViKzwcF4Ba9Nv0SzJdbZ5QECykpUQkDVCp99OMJ52cUmM3ddudxJfOhshcsL
 xZ7VMLa+
X-Proofpoint-ORIG-GUID: kC1jwsaQFSZ7zy6gUqrUAva41kPX0dwc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 phishscore=0
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160039

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>


This patchset:
 - cleans up some of the audioreach tokens which are unused
 - adds missing documention 
 - add support for static calibration support which is required for ECNS
   an speaker protection support.

Tested this with Single Mic ECNS on SM8450 platform.

thanks,
Srini

Changes since v1:
	- fixed typos in I2S_INTF_TYPE
	- sorted module defines based on ids.

Srinivas Kandagatla (6):
  ASoC: qcom: audioreach: deprecate AR_TKN_U32_MODULE_[IN/OUT]_PORTS
  ASoC: qcom: audioreach: add documentation for i2s interface type
  ASoC: qcom: audioreach: add support for static calibration
  ASoC: qcom: audioreach: fix typos in I2S_INTF_TYPE
  ASoC: qcom: audioreach: sort modules based on hex ids
  ASoC: qcom: audioreach: add support for SMECNS module

 include/uapi/sound/snd_ar_tokens.h | 18 +++++++++++--
 sound/soc/qcom/qdsp6/audioreach.c  | 27 ++++++++++++++++++++
 sound/soc/qcom/qdsp6/audioreach.h  | 19 +++++++-------
 sound/soc/qcom/qdsp6/topology.c    | 41 +++++++++++++++++++++++-------
 4 files changed, 85 insertions(+), 20 deletions(-)

-- 
2.50.0

