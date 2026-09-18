Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F8B4F93C7
	for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 13:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789738309; cv=none; b=NS7kOVn/a2wuiFf/cqLMIKnOJOKSXXwau1bDL71UQTAL6HSaVhIdA0+KidDu0S75aZVU9p0Dmvyei07iqALyzP575V/7gBmdZoTtTlu1ZYs62hZHKayhNYCxwtWFhs75ygJ+FZBpyXXbCcbdXMdFmP3p5upRPN3xJV4NygJenrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789738309; c=relaxed/simple;
	bh=EcScv/7GHH+PudgDUjdWtnbAFUCvWvP6zT1tLcuF5Jc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=et5bqXvq6a+rqsPe169jJsTVcx5x/oNo/qVTW5I1fsqE5Yvc0IYweLiBdlpJcskFe/QuPK2S/46SUSQfsIKl39dkLyqXdOhIHc1NnKW2CyZCd5FnbYvq6poPLile5Ih0t/KrfYTGr5DN09Hn3TaO9FxSnLCZUoeKDMbDvUUINwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BGf1n3f5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RMlf2lql; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BGf1n3f5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RMlf2lql"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IDOTw21900365
	for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 13:31:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=cxnrXJweREiUJN2MSzvDzr
	+es212bwopL66r97AycvE=; b=BGf1n3f5pZrKcCM3Mv5PlBs/OBmUAun0M9zlzm
	FRAjjo/KQi2wGXZ0CIN1k5ZVH2LldE/EBD0HRY7K/vHDBivPXA0Rv0az/apmIgkN
	jsRV8YS/jamDgXsqWCl9CTJW5NUJjc+V6RoZVhAy6wBYKR3fwUxvh5LNqI8cCeLN
	NwWm+yLJ+TRXY+Uvd1D58PdPd/iZCbyudpShBxjNHjs5yd0YoGOCMNMTlpLPDrTo
	WrSPJJZdtDBBtJItGCJprXXNtVeF2FcLvy2Dpigp2rgEwCagLFWgHnzn/uNruI3y
	8soZFym53vL3xarwTKudb8+ZzAYU0zzj8x4lZ4S/WnLMfXOw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grtdptuse-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 13:31:42 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc4922b7c31so801254a12.1
        for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 06:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789738302; x=1790343102; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cxnrXJweREiUJN2MSzvDzr+es212bwopL66r97AycvE=;
        b=RMlf2lqlGhu8MPIm9i+7eK4emhh32JmtIRmOaWn8787GVB9Eb0JVZ5A53d/vlHlZz7
         rm9ZMb1bni85aJVPQgik9QaNdcY1AFjohprwKDmtrTq+y0jY1R5WXV8oKLgk5PHyPe6B
         VuRdpbKbJMehx8PfwkezCCNEkPbsPchM+9mldM/LO8lF3puMwckzPRKPPRsfyUeT60oF
         wsoaRyADFZvgzMBHPk1iQMTwtJnzNyofZJcjv/F3874e8OmIPywuXWKtczrmvqKCq/LR
         EdmBe+Dow2+JVmNaJl3uzCBd8FhBB8aaqY26QXWQjDhLN4vfj2RA9RGHjY5xT15dc2JO
         XQng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789738302; x=1790343102;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cxnrXJweREiUJN2MSzvDzr+es212bwopL66r97AycvE=;
        b=zVoIrNt0uoVOusOCPyNVhcV0CUOw8zzH0wuC/3DSev0Qympuho/EPpKnXTdRFyb3EW
         2X24xprWEO7rFb84MMSNjjRS03p/+ohSSk6gHJb6GNbO0XCd7u+q+Hn6ZC6+4LmfXZzt
         kXvnkR0S8zkt6znjcPwmc3fsBZcRbU4m7852ERPK3H9OmqVOzumwpRlklG3VjIErxeda
         sfJuA9AcAETWdm23F8Rbp/crYw0IXsQrZpcnMwwBW18N1fBqxYPVu5h/rOGEy7fnQqnJ
         LDf4GYAp941UMda3hw/trKh7lsvanESQ1uUQof80wny1kEq+pjVF2OF7QLbbILDKk2vc
         p7CQ==
X-Forwarded-Encrypted: i=1; AKwUvBzdg8t5Rh8paNC64nckdf50UYbVLq0aZUfQ2gsw/aQ4L3Fbpb8IqRuI9ximZ8FP2mOJJlbTWryyXPObFQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mzkHBhP+EQdjM5lddaRrxSfmBJ+GvE62LWSGPMX0rdddBYXSwe
	sVOSWOJAfIWyKsBuxknr7/98LvcYIZ0X9+WWkQAidpBhNd4shWXeXAGVwVqAOSfCrujhj9yOyAX
	EMhsTuVnH/ASRVb0hbbvMExHlaY2PYROJgWiZX9vV8MuF9EEjIXbIjqS9fj17ZcZWwQ==
X-Gm-Gg: AYBFou3sJTmpv2RZ5LBM7gfa3WSNEKIdvyipmMAIJHaHr+VULwsdXSV9p0sRciw7J47
	M3qblF016q52c7QXLeFRPBaoVw0oatbVSnJH82Lstloru6932jSPjUgB6IyP4C36QaYyvNDzKXP
	lyIVyszDE6XmzF9phEJ2QSiigE4p+F6wGnl83xB0zaWY+wKWAkziHNVy3Olwkk4/ed6OAmNVTqS
	6/dTapt6NL4s+mqd1wGWHm73GrTPeiiVrk8uwKn043eR8Fgor/g5zrHed0RE7atM7lAcdZnXklH
	qJzG0NZi9S9KvsOrCA1Wn+3OgJrjzCJ7uIooHKgB11QIRoAV9lOCsqk/FcEv6b93wxflaCx3kpN
	nD8pQT1H39SSKajJQYXP3qUzyPFzK1/QlEQs=
X-Received: by 2002:a05:6a00:a909:b0:874:705d:f644 with SMTP id d2e1a72fcca58-874de706acfmr4341739b3a.38.1789738302206;
        Fri, 18 Sep 2026 06:31:42 -0700 (PDT)
X-Received: by 2002:a05:6a00:a909:b0:874:705d:f644 with SMTP id d2e1a72fcca58-874de706acfmr4341664b3a.38.1789738301659;
        Fri, 18 Sep 2026 06:31:41 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-875dc8f8b00sm834747b3a.20.2026.09.18.06.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:31:41 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Subject: [PATCH 0/3] ASoC: qcom: Add QAIF AIF MI2S and TDM DAI support
Date: Fri, 18 Sep 2026 19:01:11 +0530
Message-Id: <20260918-qaif_dai_id_support-v1-0-ed863c0e5e45@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACA9rWoC/yWMQQrCMBQFr1Le2kBSg7ZeRUqIyY9+F23Mb4tQe
 nejLmdgZoNQYRJcmg2FVhaexgrm0CA8/HgnxbEyWt2edG869fKcXPTsODpZcp7KrHTqz8ba0B3
 Jopa5UOL373rFajD8nSy3J4X5u8O+fwDl4zA4ewAAAA==
X-Change-ID: 20260918-qaif_dai_id_support-0f97144c83e4
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Harendra Gautam <harendra.gautam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789738297; l=1242;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=EcScv/7GHH+PudgDUjdWtnbAFUCvWvP6zT1tLcuF5Jc=;
 b=GeTw2uERLVv9847hn+WQvTCMfaMomffeXpMKpbai+/1YAzAVM2lalTBL907PQRu4Pp1K3GcrD
 wL6c+w0Y2zyDfohlcm1+LMNdCGZybz5qEw1sOTdUGO/T7+dNDAtLaZz
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE5MSBTYWx0ZWRfXymW60k8fuoz5
 688xvAUfOYn8+OwYq8FGDCGrIHcnWeRa0kprDgpBkHgca89NlfuyttZn4hwJnTWW+Twb9QknJ1u
 qhPZStw7Onk3qQ0VX7AhaIKQcPzpdhV85knCD7wYT6oaKudyRr3MjO/tp8VBtSPIxHxyoF1Axel
 T6ttWle2dKJ+eSeIHu1X6AP5GUiBdBudwnho4zQFJYEmO0d19j/pf6OkhEgKmF+Obu1XZyxS8Rz
 WK/Egq4O5RZYkg8bQRUJ5wuyMzSncTW7hqabKmITwWjc7azf2WGM4n5XktzzYAyRKjfWlI+Z7ku
 M58FAUGAkLysLxz1qHSIE+ege/Cv0r5bYZnTcd2p3g78isV7aJIwcEYkDLuhRgJeNACFe29zHzv
 6840oOeD/t/8Q8iAbp9KcQNFx/4fLQOIH5BCWIm2Ob2FTI8WYJf0LeSU2zfk9T0ZlqNR81/DzOA
 lq1Nt0+FUlB/OdZV28g==
X-Authority-Analysis: v=2.4 cv=N+e8hG9B c=1 sm=1 tr=0 ts=6aad3d3f cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=lDHNxqq9c2JpMXR4PYYA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE5MSBTYWx0ZWRfX7zhpGoXcOHgT
 39L1+7nvnrFhES2RWXNRYp7Xxb+xNFkEBikYS9ACsvKTB+uYQ/Z7Zb57EsIfXT4uDSrJJ3maqAj
 gElTGW77tsCazcb1WAXC32Hsg+JH9UQ=
X-Proofpoint-ORIG-GUID: 1_uHk4foJr0eaqRg6bLz2-IMGgMHFf8p
X-Proofpoint-GUID: 1_uHk4foJr0eaqRg6bLz2-IMGgMHFf8p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180191

Add support for Qualcomm Audio Interface (QAIF) AIF MI2S and TDM DAI
id's across the Qualcomm audio stack.

The new DAI IDs are required for platforms such as Shikra, Hawi, and Nord,
where QAIF audio interfaces are used to connect external audio devices.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

---
Mohammad Rafi Shaik (3):
      ASoC: dt-bindings: qcom: add QAIF AIF MI2S and TDM dai ids
      ASoC: qcom: qdsp6: lpass-ports: add support for QAIF AIF MI2S and TDM dais
      ASoC: qcom: sc8280xp: Handle AIF MI2S and TDM interfaces

 .../bindings/sound/qcom,q6dsp-lpass-ports.yaml     | 16 +++++--
 include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h | 52 +++++++++++++++++++++
 sound/soc/qcom/common.h                            |  2 +-
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c            |  2 +
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c           | 54 ++++++++++++++++++++++
 sound/soc/qcom/sc8280xp.c                          |  2 +
 6 files changed, 123 insertions(+), 5 deletions(-)
---
base-commit: e657a464aba873f5eaf3ca821b6e4016674492d6
change-id: 20260918-qaif_dai_id_support-0f97144c83e4

Best regards,
--  
Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

