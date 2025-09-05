Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA6B371E97
	for <linux-sound@vger.kernel.org>; Fri,  5 Sep 2025 14:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757082435; cv=none; b=iSQf7B5l+PfXJkqhinR9O+sTLMDHSycZXu9X7m/9a//JR6UFCMnj5kAVMdZxrz5gY3xmlEnU8lc+flEEk1NzESQPsnUauyxvtQEMt0oggHgIkZrVFtjHrcl0zziJ6NbkpuDTcIUOV39fOa31R7BbntAFoypFoTOavOCus0wAUwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757082435; c=relaxed/simple;
	bh=0mrJk6zYNya7zNruWFwjYDMwVqqDhslfcndoay6BTWY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pvEDrwlkeTBf8iDOnG1TIpwGt3KCFdDZLLQDYLjGaIXCwMgIvdEez0VyJqATkijXDuzbQuShDsfEgv+34mZWd0KH5A+Yduo81aX6niVcawVYgeT86wkqjU7cRbcIZYghWEw58dj48H8eLUJqqY04YmWlBboW0F83HnEGoETw/4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XWu1qiX7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XWu1qiX7"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5857AQv7012042
	for <linux-sound@vger.kernel.org>; Fri, 5 Sep 2025 14:27:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pN4s5Jsp6Mg
	beINTKiydsrxJyktG0zAYiE2Vu5bV4zg=; b=XWu1qiX7fsu6kSjhvUA5rJwu2fo
	mtOMYmhzVXK29zsms4jRb+qmPei7tnqruP4MmX4s0cpC+N31svND7iCYUAGlVHiw
	yiFJLbs/xeMVkq4hDYaxS1yf1yKrkl3mAK4qi77apuZcOlHyUe//JglHfRFzwb0x
	9A15sV+R2WwdnQXJh6cIslHZoqL94pCdnjKKarTYLb8GnfQLzPPLXW4IRldyKEn7
	weDFlwsdw1SvI1a4Q7QNpJt8TBYpNn3P8ez4vSk/L4F9lT5fhV9psJKQBS1vtVnC
	v1zeS/wxiBm7/H7J4C++s1IqQAE+9SzJkEyBJUYQ+EVWayp14+MWTIfyJ8g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48xmxj7qfq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 05 Sep 2025 14:27:12 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-77243618babso2278689b3a.0
        for <linux-sound@vger.kernel.org>; Fri, 05 Sep 2025 07:27:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757082432; x=1757687232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pN4s5Jsp6MgbeINTKiydsrxJyktG0zAYiE2Vu5bV4zg=;
        b=UNnLoCdhj2aE/NdGyg+d8qMWNs8zEKmSIl2ijC0hLFZy6DPNHaJwjspeSktJ/0gaaq
         82TN33LlsVaIg3v9GrswpGiQNIo6XZ2rhvzQLShO9o1g8Pkbss0xImSJuvcqzxxf9xTF
         f0Y7BTXwAJTOsEJ9AaWWcQYyzDZ3Aq6xdk2l7fkqwhXvXAWL9sDzK10ULh47mw4t3ljt
         NngOsoAhb/qFxuikndGmQ/Ss1T6b0CzkucaO8bwayRNHUk/9D3K6olRHvz0hPN6BGhH6
         YB3W8NCQocCBlbK/F7Sx0vRhrnnjEzMX8o9Jb+HalqX/T6UHR+XQbJL4rX4hBWQ8vhU+
         Lz1w==
X-Forwarded-Encrypted: i=1; AJvYcCU1jsvvqVVHdxsv+zRZUXJ8FWzU/wswSJkdPsbfQJPwy4xztDn84coifvdVh4Xnw7aa3NAFWHbzY2gpaA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUTfpQmD+Dl2yHDOEC6eoiDUVuNfwtQuUO58Y8bRwVgsQ1t+2G
	3mgfsEEg31Lir27vJ4XVTC/L/e8qCVHvkMEf9FLrSva8Q/v4xWLXnps/EuzhIGfneZdKNGXxyoO
	CBO5ZLde3LCZN+IAxKyRCJABKJRyfDmSnWld4timOWl83oe6s2UCMtyWqycHatpy9+A==
X-Gm-Gg: ASbGnctR36eS96i8o5MAfEUX/qczQX3GpwXwm2KLpgE7jlVk/4DNIO8hcFTJZXHNQ/C
	7Ns7mcb1yaaaylQu0TJn+Q48mo4Rb1fMv6ayRjH0Qor0KxxkpgmYR4tLLx17LbNRlDm5nS5s4aB
	DzNsg7Wzp9YWlZ5G8809kMAI1EddstAytcAtUwJG0S04g2UGLXkczI+ryfyzPrjhV+iRfFN5gXI
	z/jjHRGPNUqEIRKgFf9CY7JaVS44zdn7DoyuEA4uBc+iLq+NbgBWC0pkcygc0TP9PhzK6SKln06
	PHaMmcHPxM6pXp72wCFBrXBjyKB7Ds9NeSYi4o0D/DDnLir4KxJ3lUWAn6a4ozGyk6fNKt4l8rc
	S
X-Received: by 2002:a05:6a00:4f81:b0:772:60b5:957b with SMTP id d2e1a72fcca58-77260b598a8mr24282232b3a.32.1757082431949;
        Fri, 05 Sep 2025 07:27:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFQKIMJndn5bwcU6MyFm5v/inGRI3uo/dgTXqP/UDOrNbxCF1ZR4FqzrLYTPamp8Ieukwasw==
X-Received: by 2002:a05:6a00:4f81:b0:772:60b5:957b with SMTP id d2e1a72fcca58-77260b598a8mr24282190b3a.32.1757082431468;
        Fri, 05 Sep 2025 07:27:11 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a26a601sm21930824b3a.3.2025.09.05.07.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 07:27:11 -0700 (PDT)
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
Subject: [PATCH v1 1/2] ASoC: dt-bindings: qcom,sm8250: Add QCS8300 sound card
Date: Fri,  5 Sep 2025 19:56:46 +0530
Message-Id: <20250905142647.2566951-2-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250905142647.2566951-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20250905142647.2566951-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAzMDExNyBTYWx0ZWRfX3UtCnGX2QE2L
 flFZhogPxsEXHlKtUZeOJLUYvCEoicsFggqvuVf2KQix/i3fLbR0p3qEgb1a49O8RkTeQojrCMS
 1mw+Xt9sacDh9QBOqJJ/fsZh3VAAOHLA70yiMpxd8xpsYGhF1rSXRjNs9yiK+FgAGwRoHBf+IxW
 kBgHrcryqPgBcUqBWoWcNnx6w59XsgpfIexPJ14NoUvaiPcul9NYHwwJWp7GzH9dX7W21OKwtq2
 qQkLzN2TLhrrnIucwdWNPQ1/zTrFzfOjvw1ZUot2R5/CHGPC4sSIOc2MAfu+F6UVErbG1UY/ij1
 nx/cLYABRDY1AG+cJkS+qzoXmBlVi7UwTqANvHIuMrE82sYBTKrinQMgRhosfsDXiAoK5kXNX3D
 xAaPicw0
X-Authority-Analysis: v=2.4 cv=a5cw9VSF c=1 sm=1 tr=0 ts=68baf340 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=zZQLtTUG7XCfRDSkAgYA:9 a=zgiPjhLxNE0A:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: slyYgTa5eyBUfXt1kKsiachgtn7q1dL7
X-Proofpoint-ORIG-GUID: slyYgTa5eyBUfXt1kKsiachgtn7q1dL7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509030117

Add bindings for QCS8300 sound card, which looks fully
compatible with existing SM8250.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 8ac91625dce5..eebf80c1d79a 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -35,6 +35,7 @@ properties:
           - qcom,qcm6490-idp-sndcard
           - qcom,qcs6490-rb3gen2-sndcard
           - qcom,qcs8275-sndcard
+          - qcom,qcs8300-sndcard
           - qcom,qcs9075-sndcard
           - qcom,qcs9100-sndcard
           - qcom,qrb4210-rb2-sndcard
-- 
2.34.1

