Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795627128;
	b=3YHdSMTRtU6m2K6CgcGS9ZzGVAaCDEcWeDLOQUxPop6ubOmPzQ7eLkyX3fwidhBVSwHW
	 keQtHHMK9h9Ms+9LLpYQK1x0NguFktFZaVAoNLCEmv1+MRBCip9filpbAyIIWHvNx1aBV
	 6INiDY4N6jIrn70n4/iEUSweMV4PJf4X6n5uMKK9ouSih5ObskWC9c2svkm2KFCb5RuY6
	 /AOjSWV6yz+2gTIRGDw3yV+Mv7WaaV8M7sQY4e27NvcYt8N5sR5ROEHcSmbuZ2dzdTidw
	 TkKPwbNmgoKss2IZF7pylUmUjvooRcSRjX5g+Jgqd2gmN0JjaHTC/NNhId936m8YFEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795627128;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QNK+/v/nYKWbc4K08sh3A9N1kK/Pa5xrtBYz5UHPL5U=;
	b=SZZ8s3UJHWOMOU3PUByjVAIL4GKmrh2dH7FHLGvDpIDH+J7U7Y9rCqCdw2RvGZbAohpN
	 eWJn+4BIs6F4SPnAa2SRtX5YHS5SUMFPm6CXt81PifgidD45XOKSAMBTdmHBa+XKWO4bm
	 BiH1hOD7lFxduZpe55OroEjaejrzEb/7i0bs8mvic9ehaMI/BEUssQnUWLd0FBwPir9O9
	 jSiqh6DZe5S7AC9zGEIOXWKpb/+QPimWFHedsz7X7BvGiEHu+McYN7zAPF3fjXH50nCbd
	 5ta1Q932JeAK34tsRfgmMe21tl3n6mPYc3+P13gCUROM5m7ZYdVU5d6Pm0UuKknYizQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hV1dUmhF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IIMibaY4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE68606A321
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 17:18:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FE68606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hV1dUmhF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IIMibaY4
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APGQOU92375594
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 17:18:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=QNK+/v/nYKWbc4K08sh3A9N1kK/Pa5xrtBY
	z5UHPL5U=; b=hV1dUmhFcGwxiMvJ/HgN1LQ5D4biRwZWojEGn6SFkVkV9B9HpUU
	xPYZ8SBB7tyLjo5cTu0ivsCYXVZMaCahWfiaNP7E/LPo+YZhBNYvcF4roaJGjpjd
	p+uXejDi66RNtKF5XcvJYI+HhTe/+oJ1fhXiEL7cist8FU90ZxNSt7KvGzaSAQxl
	KnLlw2L/JLY8isXn/0fjX4CEUDEANYsVXM+v3RzEuv1r23xXmeS6OvEMM4pz2e3u
	dZ5usAb682x49tOVqi5vmP6LiugzZxGRbl4xR++KOevDQvNC9gerSnqLEFHIKHKc
	p0e9cVrTs416wPBv6svPixgUYQFz+cj2FhA==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61args13-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 17:18:46 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8b4cc42ac12so73598807b3.0
        for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 09:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795627126; x=1796231926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QNK+/v/nYKWbc4K08sh3A9N1kK/Pa5xrtBYz5UHPL5U=;
        b=IIMibaY4iOXLrIukeWV8zFLzDlVnf0cEoXhVEErs7p11D8u4ypPfwTcyjc1pNzgO+Z
         1ZaozxIsonPmCMweLeppYWEnvCjDNvWEavT43cVlfha9cMcgj5YHc1LCKwq7rvoz6g2a
         YZBdR4PX5agEU05n4yleZUWqMfL486yPSPHksJO4F33RSiGWiq0RKRayTQSlDrfrdEo3
         edfm8HYUnDCwnff+NEq1pjjbSASY+opQFkGE3jCJGSHv2pmt6gbN6dFUjA3XQgmpNdCO
         mSSfVTKp9xPIHqbtN6tjE8S5kXoKVI8sI2xnvNCBtXGCEldPFg39WPHorFYfC3coSYqj
         cjhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795627126; x=1796231926;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QNK+/v/nYKWbc4K08sh3A9N1kK/Pa5xrtBYz5UHPL5U=;
        b=j5riHLSY5Yb814WY8KohVfDnCW24kpxxVzE3UEMB488IEa0kN1gOWwniDPsxjJG+am
         D87I4mwBbmY5PkmCyEQ7ZkfHp0yDbpJKaJI+zjly1WqoHxqFA04ly9lwpx5gu6Eg2PQ0
         eHR7720wlVWdvjqeQfssM81FGkmT5mYA4CIhsDBYzSBBpjF0LpcETXtiimuZnKqQUYmU
         OxHEtNq+iwgDMmXEruizs5p/YVs329mttMaoS9m8VN2+4Ae4TGWWfnt3zIGXMGQLY3dq
         z6PvejS1XcaJhLQd1/jQytleJp8NUFcBcYq7bKoTzRQWIHc6Vu23TDdvLEHeXLyijSDO
         2lfA==
X-Forwarded-Encrypted: i=1; AL+hErFZTrUcucdeDL5BcaCPGkXXFGIhrAAD0SOa1QXluVY2COBzzeoV7EqR2X0sm1aNFy8c89pJKD0i6BzCsA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9dPDg5F1PCORMVdV5jhrsN/sLw48/PtAefL6zap3O8GWKehXnE
	S6Jb6Jb+ti3G6B/QDYh8FMGZm2aFGh1ZdW66fiQKYHl7myr3vDVf1bHQ9b1YwKkAe47pBH++2vN
	dNsE/p8za20Tb/C42E00xDkf9gUc6thMwgUuEZBsHupcANnL7wwW+pVeNRK15klTkPw==
X-Gm-Gg: AZFdTZem14gFsAO4I0dvurrakJF8rz84eL7Q2Dr6Qnntdmimp3KNdb7x0vjU4qiGgTJ
	3xN34zdWES+gGppfj8Dh0xRBbFVcBsRYNAOOsiRZWpuNr186ktKxaqKDVF4uwrqoNdmwjzuW+EL
	VQ9Q5IHpagC26ZuVXLeMkKNLIxwTb8HVxPU6EnLHbz29+qhnYdIY3rUfSBSid811O35v6v6HS2t
	07ByzJBxogX8KcdD002N9lgvRfvPjmOguo4VVBG4MM2QqaoGAvdnAOEFxXJsu+QAUjfL0+absVU
	M/LpV9SRd91PXSEHsCqI1JNh8+tT3ZZNEaubDDjsjGe6n5HrO2ayA3k6eUb0BPl1CYt51IwAjbk
	A914G2Mz2l1o5+7epnKT/Xar9/aBissgh4Zb7eqxDk1+jppgZV8immmXrydLgNSJD
X-Received: by 2002:a05:690e:14c7:b0:677:b7a7:ba38 with SMTP id 956f58d0204a3-67df42b4d6fmr9127736d50.14.1795627125949;
        Wed, 25 Nov 2026 09:18:45 -0800 (PST)
X-Received: by 2002:a05:690e:14c7:b0:677:b7a7:ba38 with SMTP id 956f58d0204a3-67df42b4d6fmr9127699d50.14.1795627125392;
        Wed, 25 Nov 2026 09:18:45 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm42096548f8f.21.2026.11.25.09.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 09:18:44 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 0/2] ASoC: Glymur LPASS macro codec support
Date: Wed, 25 Nov 2026 17:18:29 +0000
Message-ID: <20261125171831.1458954-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: e7eEKOXjzMSBP2PF6XlUnVxq78un6m16
X-Authority-Analysis: v=2.4 cv=OIOyTiaB c=1 sm=1 tr=0 ts=6b071876 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=OBTfIaPFV1-Q2Zl7jqIA:9
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-ORIG-GUID: e7eEKOXjzMSBP2PF6XlUnVxq78un6m16
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA2OCBTYWx0ZWRfX4rD5tuy7gqqv
 +kpDRIRsCj4AdnP1DxYNIhLMd+bhomUyoT3JURGoX5zqGyty0UMLHqnbZZfd282vB2JkkDDw7YZ
 fIaB4Nq0/JhaXETZMVRSF+YbpT9Pc9s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA2OCBTYWx0ZWRfXzBCROolhFDtM
 tVkBdz0mfIqI19vTHfulf2A8ojdtwjOFfJvsz3+dLFMNu13ZUbiPwowG8qcBd+8LXbqJSM5MRMP
 eCIJoLvOvVKYp1vyNxxIYcqYP6pBrVoCPmVcowmhaD8nSOHul3agvlki0ywwhEb/aQBNanw2RzG
 2JGQCfjWKAxZ0k14slDGGkuEjHSiw5T/uO+OFGV+eUMoHZIYTfzhm2FT+yQew7SIJeBOP9AlWqm
 h5mQLZLqNl/4QpIftkkV25R7CHjPgD1QQUCggzkmVyTx/g1u4ute3R/ebb9WTHS3KzBG0J4rS4o
 tsP8nEEWCPyuxrOfMSB23ZOHzYpGuGKSt0Z/K5V4Wv1ogcUwZenKsBoCs2haEkBGyWdrjfvH43Q
 zJ4JamMokEiUTVngaMogK3x++qoOhSEZmsSVgBPjJcSBkBL+1DsuxU1c+bYpCquHJFX6Mv3WkI+
 fpWU0uupPileoSNERfQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250068

Teach the LPASS RX macro driver about LPASS_CODEC_VERSION_2_9 (the
version reported by Glymur's RX macro) and add the matching
qcom,glymur-lpass-rx-macro and qcom,glymur-lpass-tx-macro
compatibles to the existing rx-macro / tx-macro bindings.

Based on linux-next (next-20261125). Tested on Glymur-CRD and
mahua-t14s.

Srinivas Kandagatla (2):
  ASoC: codecs: lpass-rx-macro: handle LPASS_CODEC_VERSION_2_9
  ASoC: dt-bindings: qcom: Add Glymur LPASS macro codecs

 .../devicetree/bindings/sound/qcom,lpass-rx-macro.yaml         | 1 +
 .../devicetree/bindings/sound/qcom,lpass-tx-macro.yaml         | 1 +
 sound/soc/codecs/lpass-rx-macro.c                              | 3 +++
 3 files changed, 5 insertions(+)


base-commit: 9437046953b2fb3bf55b36582450ea0267df82a7
-- 
2.53.0

