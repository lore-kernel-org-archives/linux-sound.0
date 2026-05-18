Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1033E123A
	for <linux-sound@vger.kernel.org>; Mon, 18 May 2026 08:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779092277; cv=none; b=TMQrROimC1GLvMFwDQBJNseCcZoy//YMPlW+MnK6e2OYFzICVgOgP/VuhdPPKSNKj+P0viQ4qZaB1537Vo0ILf5eCLCnT1IwWGQh3RhLTfxrStEGrIZgqCG48Yn7lowv4qpLIB18IoPzdsiX0agJfIJUQIJMlleeCB13YQ5yIkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779092277; c=relaxed/simple;
	bh=qjG2upfFGS/ng2q8HEpHdPRyycc6X48kD9ZdGIXpTQ0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=toV/PhYqRQfcxrI58csiwsxAsnONSVszuRu+A1hIKrYRkP2HHWLUw5a145PRi8yO6zK1ZkJkB47bXH5Jk1x0kbvcWokyfy8CzlLJLF4sX1iN87ok6ocVCfrT5XhFsnyfCjOEd7oBmPSd9GuzpvOTOZmx37Vs+WghxoWOZ+JWEgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kbKxZ5uz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WP7zo0bm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kbKxZ5uz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WP7zo0bm"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I7e8a82892872
	for <linux-sound@vger.kernel.org>; Mon, 18 May 2026 08:17:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=aqalHVRxucLdolvb70IzZuo3SUTvECOzyNX
	WBtPPupE=; b=kbKxZ5uztLWkW47f8W7Ar0g0q0xmxzIr8Ktlr696atBbuXk9SDI
	SGe1V5dLKE99uTAzvZQ0CCNaLxsYkpjTSnxva0qGAnH6jPqvqHAFZNSliNHZtIEP
	la+pIeI7HhmrJ9Yj/a3AQqTKXU5FN8kW29P2KGgHuBAhXtop3cYPFSMw9IOgtMfj
	KSM1MaSE4F4ZAgoo2pzD+GgYBiNDSgHAe+oxyXydBsKvq9TcQrys8DAp0RKqhVgn
	8VpZgbKSvhcgt0OBW3pX6x98ZPNvWndWVt1qqrgvVxcxP/12OCgZQ9TF8NKmc7b4
	UlgaSPU+6EaSwVNrIJmSKuQqaMnQ1oE2Q5g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e7xk185f4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 18 May 2026 08:17:54 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2babc42244aso52274435ad.3
        for <linux-sound@vger.kernel.org>; Mon, 18 May 2026 01:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779092274; x=1779697074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aqalHVRxucLdolvb70IzZuo3SUTvECOzyNXWBtPPupE=;
        b=WP7zo0bmpjHfz0o/nbCPFnEhieBaeR9RrxqND06Zew/76cgId1C9zFtJVGaI1XHEdg
         IGrEwiBbD19eMfhsAxkOhAuuWoGOxmaEfoF7oaYZVDetk3cvGg16BI6K+pcgD1qUYswE
         LjMMPaX+2LqZ4RemZCHwObbHoCkuudMVAndVPU9RtU3eNETUOBMVjSDpkWVU7yY8YxqK
         +PYCi2OvzQPNFcREHP5xUMMtO8dlmc55yzCekSMyNzrDwwxQmQG0TMpuawSioQ3fR3qV
         NrQK2wU2Av6ujL1AsHcYPvpwSzYfRWiioocqvnNfcIH/8nDY624aYx5QrcDkXf8G9gsk
         pTfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779092274; x=1779697074;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aqalHVRxucLdolvb70IzZuo3SUTvECOzyNXWBtPPupE=;
        b=qEd7ykwGVzLYQ29eUybGrdc1F3EbdtDJWVCxRyVsdNYkgxNvApHxa+tZ7sVIYFslM1
         AUvnMR6QXmdk4coio23BP8kjDGOlQyuoNaWZMLU/BJbxBeUtnT40VlagxLeIWxpqSQvV
         Do7WNrUog8grQxlVq6uEjkZwQNFiceBpYadTPfCFbjAJXROm/H4e0HU7VkN+aI/9iw9D
         JnovxveXHGWEM4/tJ+RQpUqzFLjWnDptuGNBN/kuKgVvQLu+DssWAbay5oF+ZVgtMTxe
         bPykR9+qI/6o8pSGtKGMJCrlowawEpyn+khhANx7ekvFzwGpT8gtt96f+SFEEdg38/fG
         uDgg==
X-Gm-Message-State: AOJu0YzDlMeLBwyJCcOYJs2pxSj3rMiBlVjlOS659TlQbcfx44SCAwnh
	U1lIAuKLC3EBPLb9riQ0qZ+84ACYYBbzh1eYGM8U1vCwvQVB5IF9/J50lq8eEE252cuD+u889Md
	iQzXK5ZChwwPI5OLFoQasEpa4ms/tu5lNSf1bmqKNchteP1qjHnr0z2GZuNah+aMnHg==
X-Gm-Gg: Acq92OH5EuX3e+sbDMCRtBakkH68cNXb5FGHCGKw5HiZflYEpM19m0NMluCu9yWVPxC
	Y4sYcewKi028l+BgIy8TjGZzj4z7nMdm2JV9RZ8770LNx5kNr+HUEgtbICGN9aNIYIad1f2hQPe
	rPNpH4hzYApAg0BPGWvqw0XHgKZ8wQCh8AqgdUxN6kG496RFLvE5EfHZiNCsW/AnJQkdzCZciiP
	j7jyM43Hprs55qv9vuggPy1UHX1ywsd+jQe0iTpWv13aiHllp1dh2T6o9wg3ODsEGxXW3yAmKxg
	yFQlvfwgVMl6OFO1EcBMXF4hXp+473nqcAE65ZNkHtwUYQEEi6Ow9jgcnOPDdmK6EDVUa0nDdzB
	bWTi7LL7mJUB50pEJ7esgkD7aVblmDgRvRfyw8krK1h40gubdOg==
X-Received: by 2002:a17:903:2ecf:b0:2ba:b643:1f81 with SMTP id d9443c01a7336-2bd7e84407dmr150423705ad.15.1779092274094;
        Mon, 18 May 2026 01:17:54 -0700 (PDT)
X-Received: by 2002:a17:903:2ecf:b0:2ba:b643:1f81 with SMTP id d9443c01a7336-2bd7e84407dmr150423355ad.15.1779092273547;
        Mon, 18 May 2026 01:17:53 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c2631basm136620755ad.34.2026.05.18.01.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 01:17:53 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
Subject: [PATCH v4 0/3] ASoC: qcom: lpass: Switch VA/WSA macros to PM clock framework
Date: Mon, 18 May 2026 13:47:35 +0530
Message-Id: <20260518081738.2453957-1-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: HEUXwjM6xJiV1PhaO0KlebYqYdZ7QFNV
X-Proofpoint-ORIG-GUID: HEUXwjM6xJiV1PhaO0KlebYqYdZ7QFNV
X-Authority-Analysis: v=2.4 cv=BICDalQG c=1 sm=1 tr=0 ts=6a0acb32 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=_6DtbLWMUc2xOIpCBHkA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA3OSBTYWx0ZWRfX8Y9ZdfGd+SMb
 Jz8LFJEZFfIfxQzidORoqv/JY3lUMGvb2nv6+nw/RLPmY6VX0aPCqW9l6K6u9KOeuG268rcvjNW
 GAZbBamxYy1VlON/wK0AmYSiNqwpRyaofpkmYrHsvR+CyNeytPLuyW6vwZEi+0sXChuHv/xXRoE
 uqGjbeyJ7Cvu+Dy6XJgb+Z0N5KdsOczAHcCYvwg2eY5NxAdVu0qnYfVoQJ0BZn9drrzXUARsR8X
 WjWB9JBvfnED065EYrRgElmk97Q+ztiI8fZPBS36xjysCKKK6PpCj+N6f9N4pHM9Bij/V6/LBWN
 tcW0YH4GIoPhYiE9BiRv4j6odXoag/tBZZ2pReoM/N/7145HiG/LP2KW2QUoF98VMIn5wocJCwR
 MgpQgA9we9NOmlCZZSbiKaq/xLbOEQ+WjEHYEwxCQuxQqNsEnF/zyn+/o8oCj/aCQN8aS3jCj2W
 +W5eUiB2dqIOqA0X+YA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180079

This series converts LPASS WSA and VA macro codec drivers to the PM
clock framework for runtime PM clock handling.

Clock enable/disable sequencing during runtime suspend/resume is moved
to pm_clk helpers, while regcache state handling remains in the driver
runtime PM callbacks. This aligns these codec drivers with common LPASS
runtime PM patterns and reduces idle clock voting.

Patch 3 switches WSA MCLK clock registration to devm-managed
clk_hw registration.

---
v3: https://lore.kernel.org/r/20260508113503.3550647-1-ajay.nandam@oss.qualcomm.com

Changes since v3:
- Converted runtime-PM enablement to devm_pm_runtime_enable() in both
  PM-clock conversion patches and removed manual runtime-PM disable
  paths

Ajay Kumar Nandam (3):
  ASoC: codecs: lpass-wsa-macro: Switch to PM clock framework for
    runtime PM
  ASoC: codecs: lpass-va-macro: Switch to PM clock framework for runtime
    PM
  ASoC: codecs: lpass-wsa-macro: Use devm_clk_hw_register() for MCLK
    output

 sound/soc/codecs/lpass-va-macro.c  | 128 +++++++++++++++--------------
 sound/soc/codecs/lpass-wsa-macro.c | 119 ++++++++++-----------------
 2 files changed, 110 insertions(+), 137 deletions(-)

-- 
2.34.1
