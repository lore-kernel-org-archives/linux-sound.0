Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7143936CE02
	for <linux-sound@vger.kernel.org>; Fri,  5 Sep 2025 14:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757082430; cv=none; b=mq116xYn0Ul2GLCZDBCqtJIZW6oxdEc7Tw1ss5OJW6p4AeJNhRMeiP4KKm9yqEzMtyvPV9zVxV8zyHyttdsiM0HimgAEM9LnhJ/Z5GVk2Hoh8bpaWyjApcC4jNNaQqblDYVHCw7h7Dik9XTYjXkLuABTKl78PYxAPLDU0EJslmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757082430; c=relaxed/simple;
	bh=COONmJayji3/apDDC0fohQM7ae7ePr8nTLeg4wuARHo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GKkxfUYGBKHK/3WrzkYiE7MqCylW9/ebOe1MHqaeVezQ573mF5cP8kbYpj5jA0Qpl8PZ94KY0ptHIr2ss/rR/Y0chAfgAVeNcmKBNujY7YtakYSvzTSfxrifYpf0ptq0p3oYGGJb9OViLObksEQA00JFvuMn3lDr3faPR7C86hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=apFBEYuI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="apFBEYuI"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5857E3gc004654
	for <linux-sound@vger.kernel.org>; Fri, 5 Sep 2025 14:27:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/ckEIR0Lh7M8rafeQHMKQZUw5tTBw3CzxgX
	B0MrQTyo=; b=apFBEYuIMu3qKJ9pwCYwLKJU9N3n78Q0fuP+40Kq72lbEnFygN2
	mf2OrCFIzhd8jM/vlSurLDJJyEOvrGxp0ft8ztrAO5v0a9OJnzGdMzsEHpMu5Rd3
	frvg4pG9bYIGiSpPRoSJmPtPQ6OAXGR6UKyIQ4k6hCFOa9S9z+bz9nu2wkeEFN7b
	dGthv6sK3rbJKqs3yz8DLZ8xCAOMuBt8OS3Rvrmp/7UKGTsjCh40D3ye98PoT6iw
	ZajIi9hdSvyRZbqEtXJBVxQfj7r/baum0lHQqnMYdX85MWCVV8oUU3cNYD7WaEow
	C8MGF0SoCxaUHcJ316YwxO3u39Qkhhuk2RQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ur8sbggv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 05 Sep 2025 14:27:08 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-76e2ea9366aso2376919b3a.2
        for <linux-sound@vger.kernel.org>; Fri, 05 Sep 2025 07:27:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757082428; x=1757687228;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ckEIR0Lh7M8rafeQHMKQZUw5tTBw3CzxgXB0MrQTyo=;
        b=DqhE/VHd9W+PuUYY4pg830ihZc772q4GPNmCUuMDgk/CvhkTXtj2S9rf5G6aMtyihF
         CptWMDqS3o8SkzKLSy95XrzQGfFXH2U2IeQuCD6z+v7nxrBturrDFYnQtD7f9BVAnHIb
         Sg3DXKZw/Raz9AJqSHQXYoiLqHCMpDJikhfG2VfFOesLhlsshaLRZXM7cG9acxjN383W
         Wn2lhp0iwphr4GsCac13HhMZE+dvU6os6OdAqRyqsaW8sD+YD2sH8zuyXoLW4k76xdZm
         2Llyn7CvOQ7kCR5wRwXwjK3qCMt0Mx9qgyX4rmkMhJozldThSCd4ttIXU01QImdxtES5
         RCyw==
X-Forwarded-Encrypted: i=1; AJvYcCUuJ5J1nyY79LwtUQqdQh77LBt5g1EE3pjhXbVxuBLcAe2eqyy6KReJW3sIK3lMMFY8g+ezsw43JIXxMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTiJQ/vn6nlNlgEoBqdpoKGPtjuC1Qdm+nwjaWwNVJZu7YKXJ1
	AgKJWAeOf+N5+Rw2QbzPg5Y9X34TcfdGmK5YpklAwAZh0tHUygCqumJ957mOrfADYwNbOmBHVhT
	O3+rkJASGCTz0T6SLVlKgqN3TfalP5K0ht1H/OFtqqUOIzUJsEbXV24VG2qbTU0UbHQ==
X-Gm-Gg: ASbGncuxqtAI3xNZia/UWWZOqgs0TAlUIHx5jfrSbxuzGeuh+CNp7Nj+t8ne/3qvhah
	Pr409dfXormolJm4lev275YeyHD8HsOhzO9sOJFOdP6q63qhWbbVg3Tq2idgpg8m29t3REcOE0J
	JizsOdVaNWQLeB5B013aQ7nVbyduScbTpoBxIbpywzuByNEvzfLD8PuzKEfBBJqj+YLZoXyTNxu
	W0qQH4YDtpHZanuEGJXRTKdLBWx4PVeUxxrjdLP/bs83hpqsZfrU/waV6lKBC8+s4ShiOrQgXvb
	igFSQP5FVhbY9k/sUWeWHWVr/1G4og2ZDaG+754I/3IgCfmToGkyYXjLhG3+OQiyfHFsWjvMUa0
	Y
X-Received: by 2002:a05:6a00:4b56:b0:772:2c15:230e with SMTP id d2e1a72fcca58-7723e21e99fmr30451164b3a.6.1757082427524;
        Fri, 05 Sep 2025 07:27:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMpYEFhjfDJgMkmgqtvzTOSg19rOBoG+ruM9W/bufKK65tLBiqApGfqLO9jTLPptM39ajKow==
X-Received: by 2002:a05:6a00:4b56:b0:772:2c15:230e with SMTP id d2e1a72fcca58-7723e21e99fmr30451120b3a.6.1757082427002;
        Fri, 05 Sep 2025 07:27:07 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a26a601sm21930824b3a.3.2025.09.05.07.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 07:27:06 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, prasad.kumpatla@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
Subject: [PATCH v1 0/2] Add sound card support for QCS8300
Date: Fri,  5 Sep 2025 19:56:45 +0530
Message-Id: <20250905142647.2566951-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAxOSBTYWx0ZWRfXweSUbY0hHqvC
 Hn97+IYsxYRQpmPMYnCDQkxZq9c9mWdO+QN5wufKCn+VRBvieq9Y+zSYPXPtjtBVguomlf1MeV2
 xQQi55ETln94QjMdjUIfvJmk9+PsUx/v1saOQ/Rl1OqjaRAUJxPrvhqu/x+xw5zUCrctP1ljD2d
 4+EMeCt79mNcs72rmLQDBsidaIOni/pxNIFPS29PA6hl7FFCSaFa2jMTNRf5ZZZs1sW0OitGWrI
 7JKbck3ycMRTFxYjooEhWHLEQkTj9uQSSoD2trwz9a0lA+fQ98eOQ7OiJn277uenVxLo3qlevKJ
 zNSvJSGbrlyFxbIpexnNvyQ6Gy85t376a0yNoCgr8DIAiLLc1ReD0wTvLnujNT7Wai+xWTgXJEL
 KiluANnq
X-Proofpoint-GUID: _copBYdCfbRK8kV4dorKouK7ZR61jq3P
X-Proofpoint-ORIG-GUID: _copBYdCfbRK8kV4dorKouK7ZR61jq3P
X-Authority-Analysis: v=2.4 cv=PNkP+eqC c=1 sm=1 tr=0 ts=68baf33c cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=yJojWOMRYYMA:10 a=3So_8DPhrXatR6NxOeYA:9 a=zgiPjhLxNE0A:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300019

This patchset adds support for sound card on Qualcomm QCS8300 boards.

Mohammad Rafi Shaik (2):
  ASoC: dt-bindings: qcom,sm8250: Add QCS8300 sound card
  ASoC: qcom: sc8280xp: Add support for QCS8300

 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 sound/soc/qcom/sc8280xp.c                                | 1 +
 2 files changed, 2 insertions(+)


base-commit: be5d4872e528796df9d7425f2bd9b3893eb3a42c
-- 
2.34.1

