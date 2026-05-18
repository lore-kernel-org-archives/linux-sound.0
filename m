Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476F93E51F9
	for <linux-sound@vger.kernel.org>; Mon, 18 May 2026 09:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779096235; cv=none; b=lkVRIvpy1ok6EPYHjmd7R358vNJHXcJaCj4FdSfJlgZKuQ9bXgetkrpqU2JNwq2MjhgLgqSCx310bZ26zm4+jYXtZ32WXv+4yP2KhPoIA7e+K+s92DR0jjgwXMqVdtYqo9OLLOe9OQ5PoJOQYIQZmXoJcrvb4D08wQZ2tauBqik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779096235; c=relaxed/simple;
	bh=Qk1RF0j2fXjG7msuvwGgj9rC7w8Kju6hH5lAoje9jkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bp4dJ6N4+onvm6aERDfneomxGEpzOo3zoQgvkk+GI23TDzn+PpiA+qgm3laF9tQytg7iNGPll4vLf1r2zoTfwDCgkfX9/+08VqUOTWWCmNWhtm8TjjXt6oEiQRIiUHqaBdjFoZkjitVCM6t01nFTTIy6zfILSd7HmovVQBICRO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HMwsjLAc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S4iqGGJu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HMwsjLAc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S4iqGGJu"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I7dqwX2891865
	for <linux-sound@vger.kernel.org>; Mon, 18 May 2026 09:23:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=fVCt1ewsqxmbeuzjGzYk2sS2AaB10qKy1b4
	MJjqJYiE=; b=HMwsjLAcugXMDyxpJMr/9FXNbLh994jKfq0EWIPzKGS3R2QpplB
	6BPFzGMY5LpNV4KgCl5SSCrQR+Y516SNU0vJHqH0sTnd4V8bQJ1bH6h8i0l22os9
	+RQE0bKYOauaURBSrJOyvYIunYBkOBTO++Qc10rvlbNTTOHicmDIyBq+z3AH35E6
	aKnXNl/NvbEVwCOG+bi+V638Fxsf4hrS8B04JE6IoAQ0agpNkkDKXxrpgJDOd8KQ
	5MSTzhEMw1GGVmmyBKgWWDBgYUDjxpOlCt+HM472LKGJ8/f5LOcMFXhAjlHETXjZ
	E/zPYsHlrvs88iiseyvvhRQa2kyj+xDOnzw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e7xk18ef1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 18 May 2026 09:23:53 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50fbc49bef6so44020381cf.0
        for <linux-sound@vger.kernel.org>; Mon, 18 May 2026 02:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779096233; x=1779701033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fVCt1ewsqxmbeuzjGzYk2sS2AaB10qKy1b4MJjqJYiE=;
        b=S4iqGGJujZgyHCH7RMJB9AtVnJ43xmRj3G789fU6sTVPrSW0IO3OqaeUzzFCZTM+cg
         BrEEytmv/98+0HuDAi6BF8yBm7Thlk45VTbIWaGCh92l3Ii3h7ZfHj9c51W30i3DNNxZ
         xInbMrSX8woEvEKyLXpj7jhtjDt1Vl3b7vkeeiOlw8DSdnLYrLYwLmp2rYIVHfSKXBFY
         qhlLhbMc7QZeEmJiI+LsnRkFdK3vsVJo4PHDc2hf1EkMnQYHU7EUjYGEylDdET7fG6vE
         ojdZvYtoZNMRXyPcwOz7Tf1uXsFBgCrHL8DWtHnwwsxTO5ikKwdqt7LH+XWi/FPX0+yG
         Wr1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779096233; x=1779701033;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fVCt1ewsqxmbeuzjGzYk2sS2AaB10qKy1b4MJjqJYiE=;
        b=b5z4VOkg5lMoKwQlDnKNNBqz7w92RmRznMBmfCo2dYzOZDKlbIHwqCevtDv63nSKtc
         ikoLBtb/09rc51Aa4/ymfo5bTEPBxeVS8Q5jfXnK8PamkEoYVVDJC6YMyyveBYyu2pd6
         vvJ4oHv6VbmQ9Pez2ysFyOjNf+afmrLjec6kWXECbBhqosSCmee0R1tLBCBHRTwJIXPV
         PNFbu/iRojQZyUf6Z9RwXM3ms3n6A6oFHq1yKm24m+nVcCbIys85w1TF5L4IUiaCfHpC
         /Dg6AZvAkb8F5Y+LSh8UomOgDCyDfybpL1phU3PlNPHlCFmAqqnCNcY4iwS1YBWPTHG/
         N/+w==
X-Forwarded-Encrypted: i=1; AFNElJ/wxXLnSwe+MW7HtYYHq2w5E6q7Q9H7wGfXKtOe0tEnPSTK7zagE+NJKPiVePHS/lEIq7hAzm36By1DUA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCh1bC+M2Jyz+qTldSEN3uGVRx7zIrZkoxrj6z+ti2MLj4FWzS
	DvuzwTJHsTksDIRBV2H0nuQ8mkZH09n8IDdgoQBui624YTUbGhQmcNeej1EVHOE9aNyxskdFWQx
	9NnS06ZKeZWoUWPlhpoCf8CFM6zPsg0eWPCB4X+5VPXzPex+zF+8DVQJ7aWCJmBI9Pw==
X-Gm-Gg: Acq92OG7sIf/HrRgLewb7KiWr/NVXRn1TfXVrxlbCsUyK1UZlE1FJUoZdTLIyIYEta2
	pORsq+8wKAQFL5XwjPH273Kr+ParnwnXej+3fn6MEuuwaFcDY93AeAvR33WTt7m2TG5onEu9cYy
	4plxayITK+xaQn8K4PELc3w29y6e80xKYX+2Xv8iSvWh22s6WascWvTSH3Bwp8PpaULcksdWlV3
	AfqTfI156aWrVLd7UsUpngikOB17zaJ/BNNNpTKjxkIeyyCeqVmu1jRi+t7u4Wba5yD54yh8I9x
	275fjGLS/eqtwK4I5W3BUVuaaBThm/fy8Vr9GvIsaCzqwK9CNywROaevpioHHJ/rgB2jsfeTwsn
	9KsfTl6kuVQLiLcvHDkZatsHPlpe6U/BFf4+3LZokS6MA3aGfUemNZqg=
X-Received: by 2002:ac8:5996:0:b0:509:35d1:ca3c with SMTP id d75a77b69052e-5165a007384mr193942181cf.5.1779096232579;
        Mon, 18 May 2026 02:23:52 -0700 (PDT)
X-Received: by 2002:ac8:5996:0:b0:509:35d1:ca3c with SMTP id d75a77b69052e-5165a007384mr193941821cf.5.1779096232132;
        Mon, 18 May 2026 02:23:52 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe0fecsm33265900f8f.26.2026.05.18.02.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 02:23:51 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: jens.glathe@oldschoolsolutions.biz, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        val@packett.cool, mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 0/5] ASoC: qcom: q6asm-dai: fix error handling
Date: Mon, 18 May 2026 09:23:42 +0000
Message-ID: <20260518092347.3446946-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: SbK-rXm7lu30BQturq3vQHRQhiu7t1PE
X-Proofpoint-ORIG-GUID: SbK-rXm7lu30BQturq3vQHRQhiu7t1PE
X-Authority-Analysis: v=2.4 cv=BICDalQG c=1 sm=1 tr=0 ts=6a0adaa9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=k1xjn1CKF53Gohu9egMA:9
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA5MCBTYWx0ZWRfX8ihc1C5wH5BN
 NpPDwxVgZqtcj5HJWRVL005v+Z+PPQgMyqxFDo9IOAiOq4P2JXlwm3Y1o0gUWM89lB/7ovUwUIt
 Xx6F6A7vvP9E040G2bF2nQ/XOyV6DVIWXc9+Opls8tOYLlnChuHB+Yz6Tk5rIY3b4k9YeRp8K8l
 74VXbUVyt8kxpHoEWxaY0CD9F+kN0s0R8cNp5DH1WwUcTv+JVLd+8Z+PDhEfVl4QVWvZxa5Ltt/
 etNlb5Pqm/8myAbHBEmsb4gBUd37QsIhg7UqoQca6Wt1w+4xB8KFiaPgeUbc4wIk+mvKHsIkrD4
 ON4JBDGA/cjNlfwHzUcdaXcg4HzpIUqcHhUOoQwNTuHWxDpZt+A5Ufi5fHV8HjQXaKj9EwK1cy7
 FTo2a2REde5f+in1FHKLSVcTyUUE50ni4Uly7zE7I7P7odcubAddJfnzrud5eXFLSYO4FiQGgYz
 8TzPfub7gpUxTTijybA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180090

Here is the set of patches, that fixes one of the isssue reported by
Richard Acayan, while doing fix for the reported issue, found various
other issues in the existing code.

This set contains some of those cleanups along with few trivial coding
style patches which looked uncomfortable to read.

Patch 1 should be enough to fix the issue reported.

Tested this is on UNO-Q.

Thanks,
Srini


Srinivas Kandagatla (5):
  ASoC: qcom: q6asm-dai: do not set stream state in event and trigger
    callbacks
  ASoC: qcom: q6asm-dai: close stream only when running
  ASoC: qcom: q6asm-dai: fix error handling in prepare and set_params
  ASoC: qcom: q6asm-dai: remove unnecessary braces
  ASoC: qcom: q6asm-dai: use pointer type with kzalloc_obj()

 sound/soc/qcom/qdsp6/q6asm-dai.c | 48 +++++++++++++++++---------------
 1 file changed, 25 insertions(+), 23 deletions(-)

-- 
2.47.3

