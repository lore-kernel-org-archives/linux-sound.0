Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F6B189B84
	for <linux-sound@vger.kernel.org>; Fri, 17 Oct 2025 08:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760691385; cv=none; b=bLvEIG1Y56r5SmzkQ0TKa6jU83zshkA1P9Cd5GF66j1Nkxo7NcJVKwoXRrVjznuoOWNXizIzHNwwwWPI/5PwYw22gSHFjWplm+RcrvjrdhDW/s/fkprCeZXQPT3J+84DuBN8iNGNeKIzjMpuUDr09sVHtXVeCAZs8lthlmBETRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760691385; c=relaxed/simple;
	bh=QHBpsKbpDzuuRtkESyqE06ii+O7O5OYSBw6m4JT44II=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QV0EkgAXkZnDoA+AM3dJGaz8PNAB3MgbNo6FlbJUzyog9weMRubnoWVw1Cdyxn20Zxy+E4xSSYscIzhbaUu3UeEYQ6JPJhGmSlPOoH+YbhkHCEOHOeKjh4VZ/6KdL+AUUC2+1+eZVvnqCZhcX+n+rYQyze09Lz/6OvrKNexAhqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TQA/E1Mz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TQA/E1Mz"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59H8NAta002126
	for <linux-sound@vger.kernel.org>; Fri, 17 Oct 2025 08:56:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=GgKHoqXT0qjE288x+uapHdxBiaCQzLjnRUN
	NopeAlSA=; b=TQA/E1MzQ0IhJ4JKwA1t7t5JDNLfkd0/4o8vFZiN5/EtmvIVsOg
	ab57IwU6BOGI2naOeK09x8GRZp6WKDeg4B0MnN2uPu60QS89hwxuL48qYy4n9z8k
	HzhJdzTO3fwFWFOonrSrGmMrkItH7qC5PAlTxyOe6b/goLBMeVae4j6WMco4/+3+
	/Ti2lqge3j4y5Za7HU/1u5I3cRR96rhI973zizXI1A2oqMNGBJTISHRGer9rb6aa
	hrieAZcfum0/5u0BuMyXqDq3Joo6AdI8GeeGwTF+fzwfNft57afSmE630mOLreWA
	fv0Dev5p+NUXN89dpIrPl1FHREOpVHHR3HQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfa8kk1c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 17 Oct 2025 08:56:21 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-88e2656b196so801194985a.2
        for <linux-sound@vger.kernel.org>; Fri, 17 Oct 2025 01:56:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760691381; x=1761296181;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GgKHoqXT0qjE288x+uapHdxBiaCQzLjnRUNNopeAlSA=;
        b=opWLvjCsh4js0G4fqMdqcbYYgZUNN7xCgEvF6lpklcl6L/cLy7Vzn6pRvp9UTYitSg
         atsIwMUgTH3Qj62Y1ss8xMw8ez/v4o4HEyAmc0fW7IhTcjuYQ5d0LB6ysdPGFODtbE3J
         lLGZ4cV8BlkktvPH3Wtdbj9Q7Iz8sfa7gyUxbqige9pbIJjfjHtEKGHKRtdY+iNJUwna
         tFsGCos6zSbDYtxIRxcRrffJoX0gm1g9KZZRMuq5MpZMxpOvVdy4UcUKmcE1EnqrCilx
         fWNsGxH+f9KPr+YACghC/j2XowSBF5LjvIwU7ts33agDtf1uwGxo7iVSg12NQfVARHjt
         QxZA==
X-Forwarded-Encrypted: i=1; AJvYcCWTtnHoQ28TKGe5yaFAocBEXoa7sPE1fkFwULdP1dSR8h/2qGlr53BtvKASS7KJA5g+JCxSMTfOnDQIsA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFLPBGJuLIZ8h8M0Wt1uNyhHLinhhDaLVC+TRVD3eGocBzMhRr
	scIXl6XW+hUbMKwiGCULjrqbA2usXxb2Tvp4RwrEc4XKRJcqY82CENvTx8cT1SjmpUaVhYJ74Q3
	sDiV3icynof8EunEtw4cllO4lJNNvfaHqb0xzX9w5kbI+uAEMEb6ZCsvzg7a5s11lAg==
X-Gm-Gg: ASbGncum2XD8jFtyzYJ3cYGU7n1BXr4bmMlMZ2DrvVZhdXlSs8vczwEeh/M3Wis5I2a
	Ybhx4BqY6+Bb7hoTroWi93B2CMpfj2JY0hUbYwW1kDzUfxhkQ4BT7ddGSmwzR32otRbfF01ukSE
	UxnqazkvKQeTjfE3CEcJFe/a12/Mb7HGoDa0m2Ez2zq2M5sFHaTt+jMpIkIDIZESgW/D8Uj/8xK
	OYwo884WmPis/nFqmFeMbjLOS8hiQriuffAZ3SCeQoLReIDhKcbG2KyF0XK0wUZ+Etho2s/f0Q3
	JtaUZqO1SO+s5OG2FVfUotZ/fTyC9PxRmiYCjrHnRGkDoZ5j1ksMkHjNPLmCBOYD9NgApCxllH5
	wxEvWWY/srqnK
X-Received: by 2002:a05:622a:1791:b0:4e6:d87a:280 with SMTP id d75a77b69052e-4e89d3a47d3mr35994201cf.55.1760691380718;
        Fri, 17 Oct 2025 01:56:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEC4UOU4CztdtiviPzgPboziVO3y4fuMgxWeeOy7auZ+T//H6htzc8sa0xc+JXaw3/TGhF01Q==
X-Received: by 2002:a05:622a:1791:b0:4e6:d87a:280 with SMTP id d75a77b69052e-4e89d3a47d3mr35993981cf.55.1760691380214;
        Fri, 17 Oct 2025 01:56:20 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4711444d919sm70764985e9.14.2025.10.17.01.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 01:56:19 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, alexey.klimov@linaro.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 00/12] ASoC: qcom: q6dsp: few cleanups
Date: Fri, 17 Oct 2025 09:52:55 +0100
Message-ID: <20251017085307.4325-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: kDLNtaARwxwvw0RcctlAqUHQEncS7OOj
X-Proofpoint-ORIG-GUID: kDLNtaARwxwvw0RcctlAqUHQEncS7OOj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNyBTYWx0ZWRfX9LdydEzK9rWN
 ZN5Hdagn9P/dVXbHqp2iQDJGMUYwVhtfyUOTncfjEIYMbFFq/jWtdYXaUfUH/+uFQZreG2HCB0g
 Gdbfhb5rDwj3TeByV2B6k4jfYx4P3knXIcqr0v88UhRDDwxjDyofX+3iCSJl1IeRqzOtJmtpAro
 xYvmfLJ30P7tAvqYcYSBmAipPKSw44wRCbG9ytxQQ8oTYMpw/Y2M9xaRAcGCM9gqqp1QqQ4u3uh
 zfNEO34+Vm0vNwFiTyWO9C+gkbSAezhbS9pPxhLj6zsvV7vRKAJKgSf6EkVXmrW+gIZ6jytDLQ5
 +3TGrhy9CwKH1mjFXOXfFQscdXGWUZaZjdeQB/L7R9oBO+3jTXemgFtmYubBpCuDGd88MUKVYff
 lNfh4d9OqTrMWlKyPf6ROPoFhJT99w==
X-Authority-Analysis: v=2.4 cv=JLw2csKb c=1 sm=1 tr=0 ts=68f204b6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=WpVtij-2m0Y91tUO0AgA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110017

This patchset does 3 things.
- simplify code via __free(kfree) mechanism.
- use spinlock guards
- few cleanups discovered during doing above 2.

No functional changes


Thanks,
--sirni


Srinivas Kandagatla (12):
  ASoC: qdsp6: q6asm: do not sleep while atomic
  ASoc: qcom: audioreach: remove unused variables
  ASoc: qcom: audioreach: Use automatic cleanup of kfree()
  ASoc: qcom: q6adm: Use automatic cleanup of kfree()
  ASoc: qcom: q6afe: Use automatic cleanup of kfree()
  ASoc: qcom: q6apm: Use automatic cleanup of kfree()
  ASoc: qcom: q6prm: Use automatic cleanup of kfree()
  ASoc: qcom: q6asm: Use automatic cleanup of kfree()
  ASoC: qcom: q6afe: Use guard() for spin locks
  ASoC: qcom: q6apm-dai: Use guard() for spin locks
  ASoC: qcom: q6asm-dai: Use guard() for spin locks
  ASoC: qcom: q6asm: Use guard() for spin locks

 sound/soc/qcom/qdsp6/audioreach.c | 234 +++++++++---------------------
 sound/soc/qcom/qdsp6/q6adm.c      |  33 ++---
 sound/soc/qcom/qdsp6/q6afe.c      |  49 ++-----
 sound/soc/qcom/qdsp6/q6apm-dai.c  |  23 +--
 sound/soc/qcom/qdsp6/q6apm.c      |  57 +++-----
 sound/soc/qcom/qdsp6/q6asm-dai.c  |  23 +--
 sound/soc/qcom/qdsp6/q6asm.c      | 189 ++++++------------------
 sound/soc/qcom/qdsp6/q6prm.c      |  27 +---
 8 files changed, 170 insertions(+), 465 deletions(-)

-- 
2.51.0

