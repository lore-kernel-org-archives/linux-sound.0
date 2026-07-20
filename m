Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AEA9404882
	for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 16:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784563384; cv=none; b=Z7HTXkgawxILbwWq0mfHTnvhKaZflLR6PJoSM1rYDhXY0PiV+MLrDF+g5oc5IQECKZ7XxRTySF0S1k2HM0lcWcr9VEY38FpzCYQnfvPiSAVtalSO4P+aDehF9j7ETb+8kdL/BGxPmujpR3g+OoD1dk4mmrelLeEwPjwCWkIwKzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784563384; c=relaxed/simple;
	bh=sQl7WPJ5J5BoF002nBCIMZf/2vH/R29fDZ+vXQkKnNo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=MzPHWsKGNiQ2WDur6Jjr5ZuagDAqdk6IzzpGWKqMHaccSTsHZldvRKdhRcDK4kGd+Qmdxd0VFB1UHRG1mJ8tLXN7urf0OTHhkGpca71I4ua8O3TbGJzyiN4rF0fceQ0mvr56bqlisP4Dy7ACA42NHm159IJ0LE9bYeaZpfZhdiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K7aOBaWs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aTofNNaQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K7aOBaWs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aTofNNaQ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KFxGtt2880386
	for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 16:03:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Salwr7ZkvoC+W+zP0O+9TJ
	cZbgxlmEgTJU1zU+SmQIc=; b=K7aOBaWsMXSEGRUmlJmnfnKGcRbX9y+oWuXlyD
	PTtQZtE2uWcSqscd7988pIr9sAb3Tslz1PbdqmI5uqB/kmY1TEvHIMRl7XOQBMAM
	zpRKdNupWwEE6/VCQdj92ANtQKy7idgqaCZiHs+ZZ4JPawdzLXxrWxSR+BR3ruzJ
	BakVElzaUN9EagwlI7UC/YyxrK3Z2OU2yclLS+TITxfjvPnasTF9bZpJcTEKUa5D
	MfZai4pObhgUFKL4aCyiPd+eJdcuF9GbCSV/+lJBLh4RznW1Ont/P1xM4RKBccn9
	LDqMFp8haO8b4u9hZJXEFX+wfICQCwNus5q6LkDH307rEhXQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhgs01scr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 16:03:00 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c89704da8c7so14738422a12.0
        for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 09:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784563379; x=1785168179; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Salwr7ZkvoC+W+zP0O+9TJcZbgxlmEgTJU1zU+SmQIc=;
        b=aTofNNaQttXYqqd4ZzWJsOStCJea0prlApW8wvd6kWH0hB+QJ6t89wNiE0NIexkgwq
         yMEs2QWxu3in8b6qqrlavZ6pHx+JSGTObMQkUzdCzg4K+NtaEhTx7g1IWqFJMJ+yc4Si
         yRWrXUppo2/KxVmn8+4t2ds4wzcNFpaJxUVsIl68t+v3TNeVwgTK/x6FsP6XY/Pam16U
         3VaHBShlSa9uLifJ9tSq73Z3ZL1Z8E5/4grbzg2eGHP9NwbeFTIfF0seqjwNsOPSeSO9
         gEZEadECRbnxS/cN3mpBi6NnymDrtZUE2dS8f0aS0yuGdIv6+g4wMVfmDgaBkbkLMP9c
         Lhig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784563379; x=1785168179;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Salwr7ZkvoC+W+zP0O+9TJcZbgxlmEgTJU1zU+SmQIc=;
        b=CM+GdEbYpHFBPLAr/gKsmwwqtL2xg1oVq/MkIvrVwDVtwzH3pOTzwZEoCN8riMstcx
         AkxvUgrLnpggKtSuCytNnCMw9EyaeHjZDcL7qUTXYDDWe2HtIzZv4JrgQeDNdCrl7zfr
         YgPrLjFLV7/8biPJv+YgOyRn7AmOT717OdiJ9TXQ6XxaDMJvz4oDVYmuSRB6jgRcdcCO
         gzCXJaI8N3EnG8fTaclboWFbli9OhcQGu81WUmZEd4xBq07c3EGezSOHCzN6pyHZM+dV
         zou9bdQ9H8ZnEx/UFv7HyJBvAZ3BmjhUUsinEBde3CEdXhOcnBVa+u0ZUnTxHhcirOYN
         8pbg==
X-Forwarded-Encrypted: i=1; AHgh+RofOm8sZwqBPv/2zBgYI+Qi9CRTuNyQ29yoBlGlF1wqJhyPA/ruQAanecZuG84l1F0fWEWUxw3ZX7uXIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJNiRszZAM30bN9I8B5qDCqFuu7rlfw/GMucNq4RnTpI7sUnjY
	n5k4bZ+xyGbcKkLqnj19q/xDw8Vf7wM4z0CpojwnA8q47rXaQv2l3AIiUjVWWqXbn9USBHbls1h
	Hu0WAdVfNjo0nLD0cSc8AdzkRrOJYn+eiYJ6OVQ5kCs5OWSLvyqIHJ67GosCbv7bWNQ==
X-Gm-Gg: AfdE7cnIj5g+czzwoaYDdpuIK2nL2ghMUfKfPafvGUlUaIh0STBB2gb7wQ1Y4DJjt/H
	1lA5FNcbNnqJRMK+xUlM4FjjzTuHA7l4hl39VX0dD1S7mFcSxv5oygwYFVgxdarvbUL2Yv5D4Ht
	t7XjtKu4GeZ6CjevQL+zHFPQyfbXsnEOwXwfAcNdciDbSN4zi4JbyVfqZUStjrjWUXLUAh4l20A
	u1/owj2pJ5lZXZO9ePlu9TTGLzv/oMMPiCgz2/i6enr8RKk0hMLzbklS+lr0Smn/bVyCP8tiMOy
	wh6XQvJgrpseClTJz1UJYWqFyn/5tFe38Uw7Fbwq/bVeGVxS3euPTP/jcvEanq45qqZr8pCteiF
	ZrI686Ah8PI1vYlYUCAoXu7Q8V8AgplPa9rom
X-Received: by 2002:a05:6a21:6b16:b0:398:8870:b58f with SMTP id adf61e73a8af0-3c3ad5d463fmr15393353637.14.1784563379261;
        Mon, 20 Jul 2026 09:02:59 -0700 (PDT)
X-Received: by 2002:a05:6a21:6b16:b0:398:8870:b58f with SMTP id adf61e73a8af0-3c3ad5d463fmr15393291637.14.1784563378650;
        Mon, 20 Jul 2026 09:02:58 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429fe1014sm37616115eec.7.2026.07.20.09.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 09:02:58 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/3] ASoC: qcom: qdsp6: Add MI2S clock control
Date: Mon, 20 Jul 2026 21:32:23 +0530
Message-Id: <20260720160226.1026440-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE3NyBTYWx0ZWRfX3Q6zuhM/r9fs
 Fy3Pclb9BiHgGdX3mOz3PBDPu+aDRQmuzh57mLA4/W86P0t9Cl6tXIEFwraA/kjdK3Y1WmLsOjW
 CQULiLSIRWCXeX1EOd35ehNh7AOySDE=
X-Proofpoint-ORIG-GUID: EYPD2rK3NJpHa69ufmmPS4xs6Xc3RBQT
X-Authority-Analysis: v=2.4 cv=DMS/JSNb c=1 sm=1 tr=0 ts=6a5e46b4 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=BifR_v5mCn8YSut0XsEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: EYPD2rK3NJpHa69ufmmPS4xs6Xc3RBQT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE3NyBTYWx0ZWRfX5A8O53frX2h9
 +3YPckfNwcMqE8G+qbMvWZ55cXnGzBPtpBw0IQUTYema7Dv2/++aX+bfaj4J2DL8iqevHC8AUY8
 jFfZx8VoK5lxLq1ZUmMmNs8UANrsms9X2SzzEY1xENYFz3Pv2/r1n5PMbl7pc92yGhWPA7o2cFQ
 M6l8N5LUq+/A8nRTtZWuxjoU/QfTW0lJqh5HShoXZQ9c4mPqMh/FxKE8ZPSfaYz1f/x9bR6MJQq
 AmgsaQ0LTwYi2xMy5jt/HRGQR1ToROWVQlu3y6IgYuTi5D5wPaFnvQe0b6pTH5NE0vLyP8Uu15F
 g29BgQSdLL78Vow0sDjDxzAbTmLwy0ak2QvXfTt7+uCwBxCyav217h3WG1JFPio6ZWQPBbD502r
 j3fSGSm8k/1sF4QYMw6O/kAiZ7uH3jVK1RxzRDBmDNotcgPSP6qLYrs66FAb8om3aGe6oUAbGiY
 DVjYSCnmEtyUfAPKakQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_03,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200177

Add support for MI2S clock control within q6apm-lpass DAIs, including
handling of MCLK, BCLK, and ECLK via the DAI .set_sysclk callback.
Each MI2S port now retrieves its clock handles from the device tree,
allowing per-port clock configuration and proper enable/disable during
startup and shutdown.

On platforms such as Monaco and Lemans, third-party codecs are
hardware-wired to the SoC and do not always have an in-tree codec
driver to manage their clocks. For these designs, clock line
enablement must be driven from the platform side, and this
series provides the necessary support for that.

On QAIF-based platforms such as Shikra and Hawi, responsibility
for voting I2S MCLK and bit-clock has moved from the DSP to the
kernel. This series introduces the required device tree binding
support to represent and vote for these clocks from the kernel.

Enhances the sc8280xp machine driver to set the boards spacific
configurations.

---
Changes in v6:
- Addressed review comments, reported by Krzysztof.
- Resolved all sashiko comments.
- Link to v5: https://lore.kernel.org/all/20260714145250.2473461-1-mohammad.rafi.shaik@oss.qualcomm.com/

Changes in v5:
- Addressed review comments, reported by Krzysztof.
- Resolved all sashiko comments.
- Link to v4: https://lore.kernel.org/all/20260711125740.3083236-1-mohammad.rafi.shaik@oss.qualcomm.com/

Changes in v4:
- Addressed review comments from Mark Brown.
- Resolved all sashiko comments.
- Link to v3: https://lore.kernel.org/all/20260706132009.1496321-1-mohammad.rafi.shaik@oss.qualcomm.com/

Changes in v3:
- Addressed all review comments from Mark Brown.
- Fixed OF node reference handling, clock configuration, and sample-rate
  handling issues as suggested by Mark Brown.
- Added proper error checking for DAI configuration APIs as suggested by Mark Brown.
- Added SENARY DAI support alongside MI2S DAIs as suggested by Val Packett.
- Link to v2: https://lore.kernel.org/all/20260608023011.942228-1-mohammad.rafi.shaik@oss.qualcomm.com/

Changes in v2:
- Added a detailed commit description to clearly explain the need for this change.
- Improved the machine driver based on Neil’s feedback.
- Link to v1: https://lore.kernel.org/all/20260309111300.2484262-1-mohammad.rafi.shaik@oss.qualcomm.com/
---
Mohammad Rafi Shaik (3):
  ASoC: dt-bindings: qcom,q6apm-lpass-dais: Document DAI subnode
  ASoC: qcom: q6apm-lpass-dais: Add MI2S clock control
  ASoC: qcom: sc8280xp: enhance machine driver for board-specific config

 .../bindings/sound/qcom,q6apm-lpass-dais.yaml |  53 ++++
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c       | 194 +++++++++++++-
 sound/soc/qcom/qdsp6/q6prm.h                  |   4 +
 sound/soc/qcom/sc8280xp.c                     | 251 ++++++++++++++++--
 4 files changed, 480 insertions(+), 22 deletions(-)


base-commit: 0718283ab28bc3907e10b61a6b4be6fefa1cbb2f
-- 
2.34.1

