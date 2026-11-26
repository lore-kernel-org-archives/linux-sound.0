Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795718300;
	b=eX4go111Huz4oiQjg42k+efyK4/KimmczyOCXjsyPStWcvV7xuPGRzWksMMRPu8zNiFS
	 KW10BaRxWh03ygu0JeicwgpDug+q7WU8OQrcn84uzTeFT9iZbLVMVleYq9L9OVLfMXJy8
	 noZlQzYAH4zkXz3zB5i3QfTnRvPs45JKUQRk/N40AKgHJ0ttLqCR7LphTJgvmdaJY4g6B
	 ApS6JyczzW3RVWpadkg3C20jTgF1OV+IqL68qTNufJHUV5ScgxCw+av+rjssk94NM+qxP
	 YC/iRmjIw5hXihcSF32xsuCtOCK8sydUgs7N3WulO9kL1/n5memuaRmHB8H1sDLvdZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795718300;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wKhRPqNkIG6fPCBwmHdWSXbw4/Nf0HqMxDnELoPBjMQ=;
	b=SqelqAYbZEQrNniTDDsAgF/nnFY7FgnOL6+m3waCxGNxg5GqVrpr9zLvt6DeykU2DLiw
	 t/ZHH03rYcxhJUNpId89hkMn6N4tZeja9zxrvThXJ1TdXRIJfMYgh+bOIA6UzjzWShla+
	 Ng17+RMmkD4VTYM4EkTQOa7OkOr+jMuGv3dEwenHbpk5u6QPQZ+OIOSPTDGG9204XCA36
	 Ar9QXv3K0H073LGQCPmYERdLUoAcLDn0D0HwpMnxp9rmtsfntOfx++UdE2DUkEA7po1uv
	 idDli7lj3hexGlnxEO36CRZ5xy2ZwjaGfJ2S94chKrdFRypeUxDIJRebL6tPA/LiHRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fv4VTkli;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="g/ErBnnV";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55761606A693
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 18:38:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55761606A693
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fv4VTkli;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g/ErBnnV
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQFtwwu4048179
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 18:38:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=wKhRPqNkIG6fPCBwmHdWSXbw4/Nf0HqMxDn
	ELoPBjMQ=; b=fv4VTklixmFUYwjniiesSq2bKFQDtBm6qGnPZ0kLTT9SMCbGYKY
	XxTAz9lMVwCh93OEhZkifCNe6nrpP4/ITinitYC49C/15WYLwFtoPcTkNAbP0/AJ
	O+Z6E+7CKj/hBWT7qhWaSllGcxJB3k0hK4sYoa07fpgZYvQTGqP9ukfXdEbUxKgO
	3A2teacFHPSlZ/aUchNYmxvghLpJPN6oEe1txM9ANxyWcJuVFfXU7/g4EUDglMEp
	p2djehEwW8ng6UrA06hplwc0JcLIlFFfzii8i/sKf9lTOhZPuEqLSrH1JaUOTsbQ
	CulWx8D1NoBuBNRi4yay4eyqpCIN2eSuJAQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6f8rjjx7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 18:38:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-949b0d322fbso1013852085a.3
        for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 10:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795718297; x=1796323097; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wKhRPqNkIG6fPCBwmHdWSXbw4/Nf0HqMxDnELoPBjMQ=;
        b=g/ErBnnVTkcCyRkKxXMIf/GIiDEiCRB5R9p2DVwZOnKR0Nf1ZdmqkrcJIKFI9bpiaz
         ZW50O0Yw2uWDnPjWZ/ZGpN+zP/bg6HADOW7oXa+4oPC/R0f7uUDncV+VVlACVF2+E6Z/
         6fxAvg3pTGeLXM1kogGl5rLvHtJuGUjrwgjcLRxvaE2tGHhjuDl2FpSV56qsrmZx0grv
         j4O5WiuVmP7AdGCZXXPRDsXeMVnpo6e5ReaKbRUY/4eTGFu/W9Sm80ndA3+/1yEFAnC0
         rLqDldkcjzjUdTfUEYhNv3togS44N4/PEmBmsY6NNOb5FDP+1sh9nO3oQ64AIMfdfq8j
         k7BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795718297; x=1796323097;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wKhRPqNkIG6fPCBwmHdWSXbw4/Nf0HqMxDnELoPBjMQ=;
        b=qNCgoMQ9wPUSOwjErIV9ety5gwFZONcl/RjDIJ8karp+Nz76Ej8S1quHz+vfXW/Egs
         xXjr0W5DE0eea+XJ+Kms8E0rEGHNtIS1/P93UTsfOKUJjU2G7X6gbZzJweK4dZ87p1z+
         uhL38o94YwClWQciHB8o9WXDMIERYIM+SkVzy74ocv2Z5Pk6tHzPp7kF76A1wMCFmmOK
         6ElDrOSWSxtT7cyzWZcm0pm1k7JxbC06l5Y/pi6ylLHVXQSi4TB42w03xjHoMwfnfshx
         v3w3pU2yoauHO3OD/+9gOckneEEXnneATMxafQy5CmGXeqPaQuHp0E5ffV72eo/e/Y4U
         unHA==
X-Forwarded-Encrypted: i=1; AL+hErG6w9N3u40+iC+z9sJDMOBrhJMSz2MYGC6DjGGygBd4QCh4spAnfPth5neA+gNE1KEadlGrLisrZ0/KiA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/rygug9TwqU/SZJKJyp07ZC6KZvZIdD+xGhmPgp/74LBMDnl90
	mvB2tELOhPRlPLOOVuyDbA2VubBhXar313HselOwScXv25E1ccmvddcATbw5Q/K4pfIJlHqGfh+
	lEqdKNsRC41zGEfC5oPJElsRRYd7KqXc9qB35Qxw9C7iUCh56Rlj6KwJCfxsRrIx0Jw==
X-Gm-Gg: AZFdTZeVwaKusiRlmvbRZ1DGtXGf+MO5wpfNS6nk3U3YdpM3i0Q73qqS+ovMkhNB4WX
	qf++WFV1t2JdRRW40t3pcFhHUFnRWi9kVU5Ex/4Q0JqG++0qhKJNmcOxP0t/REVcdpQZsxMa1ES
	2saiZNU1092twp8QQ1SVQntMV533ZZGhYCiQ/YmpQYNc7vYM6PULjNtPikfWL31qiA3NAkurhrN
	qwLSxpsy/SYQ0HM+bNfEurtXTWjz70NAE696Ug3ASQkEroUkLMtXQuA/emvkA1zefSIlvPswAMr
	7OiF82RhaKOBfrqyztApXRayxNNwe2oZ5b7XdbrJ9mxbDrml6Job7nce8SBTCf7h8H4FK2Tuha2
	Vpda0ifyQjbXtGZ0nrgjouaNgjrH8zKK2zHT76LnWrgxXCiNLncCoT6kIreZr+WKq
X-Received: by 2002:a05:620a:4008:b0:947:832b:5527 with SMTP id af79cd13be357-949ba9a967emr3906148485a.42.1795718297421;
        Thu, 26 Nov 2026 10:38:17 -0800 (PST)
X-Received: by 2002:a05:620a:4008:b0:947:832b:5527 with SMTP id af79cd13be357-949ba9a967emr3906143185a.42.1795718296863;
        Thu, 26 Nov 2026 10:38:16 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895f7bc1sm239659035e9.3.2026.11.26.10.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:38:16 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konrad.dybcio@oss.qualcomm.com, abel.vesa@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 0/7] arm64: qcom: enable WCD9378 headset and DisplayPort audio on Glymur boards
Date: Thu, 26 Nov 2026 18:37:59 +0000
Message-ID: <20261126183806.172485-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA3MyBTYWx0ZWRfX9NBbJnYIrCIc
 tGb0gxztylJlDunrUbHpEF7f7AePh/teTsExxQGgTxp+aHvhAVfElJqmska8AECESfkMLnsoQsi
 NIZjMu17IMsrHwygpp88d2C+PvCoDFMfOc0xSEleY9NWuLPKF/aznfh+PfjfanKa33INyJoYtAt
 iYNsLJys1tiecb/2uulSEqcsKjus30JplkAnLR3bx/cpvHXaolm+bNeBZwtLXRBeTQwRH5bQNYC
 ADR+kCd4/78KzNs628KkITnCap2EzApHcLXa5tDeNHv2OoTz52EHQweCm9+BQ6cOzzmKR4lBW2t
 XenwuAWjtyAu1Fyi+g6xIz+48jSNzoMBpBkET+9I3DDr9ytnb108sHTG9kRrdFc6Nj2Uq44KRVD
 mEHm2Jx2RhHQmI2mU806i7XioI6UlQkTbompViEJQYZ0zhiuAA6/7Lh+EJO3ngNj3sGEKHZ5tQP
 k8R3wsiE6eXSxFpIQHg==
X-Proofpoint-GUID: Nkmxa34P3wIhzsm3xvzFyQa9Iq6kSO9X
X-Proofpoint-ORIG-GUID: Nkmxa34P3wIhzsm3xvzFyQa9Iq6kSO9X
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA3MyBTYWx0ZWRfXxhePtfA+rWZA
 9sh8JURFQTdb4HSkTrT0pF7+oHJxVqoOJ8rezK4OejBwxuWVrvo70dPeSCeZawmbMa4Ci6Najf7
 rW3es9ltkWiWkdE+xFXMoYmDL7P0kxs=
X-Authority-Analysis: v=2.4 cv=FuOQbGrq c=1 sm=1 tr=0 ts=6b087c9a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=H8Vl9kw8bzbrLTmWWJQA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260073

Wire up the WCD9378 (Tambora) SDCA headset codec and the DisplayPort
audio DAI links on three Glymur boards: the reference CRD, the
Lenovo ThinkPad T14s Gen 7 (Mahua) and the ASUS Zenbook A16.

On all three boards swr2 is the SDCA primary and swr1 is a DATA-only
multi-master dependent (lanes 2/3); playback and capture run through
the LPASS RX/TX macros.  The WCD9378 SoundWire port-shaping arrays
live on the SoC swr2 node in glymur.dtsi since every Glymur-based
laptop uses the same codec wiring.

Dependencies:
 - SoundWire multi-master support and the Glymur LPASS clock
   controllers are already in linux-next.
 - WCD9378 SDCA codec changes are posted separately and must be
   applied first:
   https://lore.kernel.org/all/20261125171831.1458954-1-srinivas.kandagatla@oss.qualcomm.com/

Layout:
 1/7 adds the Glymur SoC-level LPASS glue (RX/TX macros, LPASS
     AUDIOCC and LPASSCC, swr1/swr2 controllers with the WCD9378
     port-shaping arrays).
 2/7 enables WCD9378 headset on Glymur CRD.
 3/7 enables WCD9378 headset on Mahua T14s.
 4/7 adds DP0/DP1 audio DAI links on Glymur CRD.
 5/7 enables WCD9378 headset on ASUS Zenbook A16.
 6/7 adds DP0/DP1/DP2 audio DAI links on ASUS Zenbook A16.
 7/7 turns on the SDCA class driver and the WCD9378 codec in the
     arm64 defconfig.

Tested on CRD, T14s and A16.

Srinivas Kandagatla (7):
  arm64: dts: qcom: glymur: add LPASS macros and RX/TX SoundWire
  arm64: dts: qcom: glymur-crd: enable WCD9378 headset codec
  arm64: dts: qcom: mahua-t14s: enable WCD9378 headset codec
  arm64: dts: qcom: glymur-crd: add DisplayPort audio DAI links
  arm64: dts: qcom: glymur-asus-zenbook-a16: enable WCD9378 headset
    codec
  arm64: dts: qcom: glymur-asus-zenbook-a16: add DisplayPort audio DAI
    links
  arm64: defconfig: enable SDCA class driver and WCD9378 codec

 .../qcom/glymur-asus-zenbook-a16-ux3607oa.dts | 138 +++++++++++++++++-
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi      | 115 ++++++++++++++-
 arch/arm64/boot/dts/qcom/glymur.dtsi          | 100 +++++++++++++
 .../mahua-lenovo-thinkpad-t14s-gen7-lcd.dts   |  83 ++++++++++-
 arch/arm64/configs/defconfig                  |   3 +
 5 files changed, 436 insertions(+), 3 deletions(-)

-- 
2.53.0

