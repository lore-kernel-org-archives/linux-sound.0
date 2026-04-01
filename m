Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4902B35AC36
	for <linux-sound@vger.kernel.org>; Wed,  1 Apr 2026 03:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775013772; cv=none; b=QYvGk1xU6emlEmHQ9NlVLAIE5UOLiO5zQCSX9zVd5R38oPg3wFhT82/VoYZ+/0qfjhPW7shw1wh13d/RLV/oAZPjBJIKyP9/YsQQryZnFCD76LiLYehyD0zoqrcOEbCH0fjylxJLfwUpRQGRBN6rw9e+nTsRLc3wdG11sNiB9eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775013772; c=relaxed/simple;
	bh=zzBZafCwz7Sgkv3YYEeCkqcfvb9M0NNIk52DhAvnPMk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kE/dzOupwqUbE6nNCliawqFhXCarfVGLsxTxawDgTY2ZPKthX/+FB7oNF1453rFPR9SAwYGguRRb0QvcOuoJm+zu6liELmcMPXR32IKAioOlli02C1l5fhDcLPt53Uf+P7vaSOlThLLt8CYe+goSwapAs6x38N4IFNnL7TDhun4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WC1YkecU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UrNWSzwe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WC1YkecU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UrNWSzwe"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6312HXwT3081358
	for <linux-sound@vger.kernel.org>; Wed, 1 Apr 2026 03:22:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=UMERm25G1kIJ4nAgyhsahp
	M/Hpa67mXEHVBlXbSg5OE=; b=WC1YkecUsAIPWzr6+EMEl7M/3H8JHnxLcQxbPp
	nvTAZuKJRlBrvhPNWkRem+h10AEPpgigMrxhzPFrwGokYp2LvB9/h9T2zsPQYgEK
	3eLUroUCVI/j2XhJCvrJ+lgjmDWAb3VZaSQH/0/JnQKg+/2I2k/aURuyBC14hyWs
	f/kdXv7lCrOHNEAl3FAXHu2rt81yLTqnZvTOlC21fkgw0YMnik/Ck/XmU518pLag
	8ictfp712JOvNaFLlXBDoZCk4FPrhuKJdYbdwUrJF9KlF8/posnVFVLPzIY2EGcu
	Fzs2c5lAiAMy1ASn/5MtNns20uI300he+/7XWZglYwyYDUFA==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8kdkswvc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 01 Apr 2026 03:22:50 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7d73fe3f986so19405800a34.2
        for <linux-sound@vger.kernel.org>; Tue, 31 Mar 2026 20:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775013769; x=1775618569; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UMERm25G1kIJ4nAgyhsahpM/Hpa67mXEHVBlXbSg5OE=;
        b=UrNWSzwejJWAv5kkD+VPshqZn1DV3VOkk88gXSbWnIPxiVZmHrCkO1Ddc3abhc81m/
         P5eLJv/L/y3i/0X8QrGl12gDb2TxRTw1c65gVSmT2vzmQ1R5N202e8BJIHBDGqqryVmu
         ExvtJsdUuSyjEBqVMsqPJrvdLor/zhOEoxKf6vZpNtRZD15UeZ5s6PbVvhLUvp6NrMJd
         6oAPPynapVW87w1WfSuiy03muzN+9iqPF03n3QLkBZhTaqUa4bcbRN0O5AThMPcHr9Xm
         gJXzjrJPIInwRaCA5JIl4HKLO/POJLyO2XEcvlp19n7qwDuGOPwKeqM7OCpezrCy/6g8
         SdEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775013769; x=1775618569;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UMERm25G1kIJ4nAgyhsahpM/Hpa67mXEHVBlXbSg5OE=;
        b=qO98R5KTM543mE5NRw+xBqkdbMtuBLwjPcnQP07lf0+rQ2ixhQMAqPwNc/0uGfVKlZ
         11t8ibgdWZ3WTix0vt+/nt/o4arUqQcyjYFWuMvKEuonCt1E4lSgqNh04VbrMzZguSol
         pwJUCKspE0CBhI9MPtTxS1B5HuEjHaso6jBk2BdLy/rocQtRkbGzQXqhdBLxoBlPg6wD
         v2EspXJUZUdNLR19f3uvlmgKh/9Lo5zgoGkBSIoCrIX0BAoWnM7gHG3U4zZFE1IVrhI5
         n8xy1cvT+RlB6KH89NZi1NQXaNiWXys0WhzKai48z+/olxh3h1LeDNPljcAuegexUNjY
         6EVw==
X-Forwarded-Encrypted: i=1; AJvYcCXDZ1PJHDnsa16KEXXLCoTMHpXogz8hRnE6gzuQGvejZGP2wriNFyxunWj/mScN7FDTHnkYZ/a8efdTMA==@vger.kernel.org
X-Gm-Message-State: AOJu0YztEOngZ7VlxLkW6+/xfEfOnhcLRX2skPyrYPMp6zyus1NsY9WF
	vLJ9twCt73wh9PDLOtmZnPpsF/7l+xEX2ntnQoT1eGEZBUZg/gOAwMLR6mSwDkD7ALNgbT0nnkD
	2YbtroJPchp7u2SxE6PNji7wuaMpv7uRnGU7ZFDu0pbQ5J+ybPjdQCE7+KJ41xQv1vA==
X-Gm-Gg: ATEYQzxrM3murBne0vDhQj2Y6yLLo2MRXMx8x/rCHqOkj+CQAJjYVofJNKVOXm21YJs
	kufgHoS+dDrtqQHhsALCYSBJISe+qzEfsEiXMBCVtZWAm9VVEQ+deHgxqfKR/oFfseSTefxXGb9
	+/TrRPrXGQnElHPPoKsjCFs/amAJqaQpKOjzkeP86bgFjaSgv7rHsuU3pVt+rAPbCKtmYZ3Ur1U
	AzPJ6o4AMItsiCny08I67aLup1p1ZSzyzig9Ve7ugC8POWnmmZcs5Yq+k8lTYXWbxj/MqaeXrJe
	pXRQLpSS4wELR3M5k6WVtsSZvJgzk/dCT/HGXmMcu0CxOGSHJjOLREAO2v8D37sOelju1D+V6nO
	QHVkjc4o8qLByp5ZuQgJl3NuWWXuqHotaLDyzQi9R++8=
X-Received: by 2002:a05:6830:6f49:b0:7d7:c985:3a30 with SMTP id 46e09a7af769-7db992530e8mr1362642a34.11.1775013769497;
        Tue, 31 Mar 2026 20:22:49 -0700 (PDT)
X-Received: by 2002:a05:6830:6f49:b0:7d7:c985:3a30 with SMTP id 46e09a7af769-7db992530e8mr1362630a34.11.1775013769050;
        Tue, 31 Mar 2026 20:22:49 -0700 (PDT)
Received: from [192.168.86.59] ([104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7da0a336d73sm9589357a34.5.2026.03.31.20.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 20:22:48 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: [PATCH v2 0/7] slimbus: qcom-ngd-ctrl: Fix some race conditions
 and deadlocks
Date: Tue, 31 Mar 2026 22:22:42 -0500
Message-Id: <20260331-slim-ngd-dev-v2-0-9441e9c8420e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIKPzGkC/1XMTQ6CMBCG4auQWVvSH6jiynsYFoQOMAlQ7WijI
 b27FVduJnkn+Z4NGAMhw7nYIGAkJr/m0IcC+qlbRxTkcoOW2kqtlOCZFrGOTjiM4lgpawfdDNL
 UkCe3gAO9du7a5p6IHz68dz2q7/cHGdn8Q1EJKepTZdCgs7ozF89c3p/d3PtlKfOBNqX0AeYxb
 l6vAAAA
X-Change-ID: 20260211-slim-ngd-dev-74166f29f035
To: Srinivas Kandagatla <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        stable@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2364;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=zzBZafCwz7Sgkv3YYEeCkqcfvb9M0NNIk52DhAvnPMk=;
 b=owEBgwJ8/ZANAwAKAQsfOT8Nma3FAcsmYgBpzI+HJ2qKGFLw+JqIgkgmjilSDdW76L2ziRCkk
 jkLQb40so6JAkkEAAEKADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCacyPhxUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcUUSBAAw3kdbSBT1owNQXsY9nQC8eyM93V4KeQcIY24b9B
 uvZ3M8kRotYFE7q74CpcHjeAXrlSjoK/r1T6xoEDC2nq+YtljYwBBwaqR8JjEosigt40F13BQOy
 HTqLivIK5Tg7WaOnJ52GgZiJTWbF7xW7dEVgpLC81OQbwCPFHA9N3YPlPpjEh0e9MqzvD90+K+r
 Fq3yZlDArrXTkQaSAQ+bbunE0IxDd0r/Vqhl9ge1nQEZeLvdpV/4LFNJXuKjz029XHxo3MyltFk
 OI9z84BkOXfDNpTIcZXAzuZiSysWMn2EwVbslU1BNAJbrxucBO0uf+J/31R/bbWWeBaoWDDcAVg
 sz92A2vn4V5G06kXK2i+R0BM3WL++LbCm2AJmOkqlbJSVOTMTb1a1/SsT2XEt2o5wlFPQCDo2Mm
 g2JveRwkN3+DNyGofF/pYu/9Hsa70xqeMHVHFfluoRjgIotnYAY7SW8Tb6v1gk1JwGv5W02n3dS
 gXLMHiqyvYhXGHAl8JVah3kOBwNSErLG6xFY1/gycyCNm8SAIoxeya+bDiyMmvffCsnVNAL48BK
 HFIxRiGdIS5U4lRGv2+rJc5u0gEqtgGb/Tnko+SyPdWWD9O+fIDCneAjfKFnaMKaHqkak8jVm/7
 ysbDHH5UXqG1f/vqSmAIrx3rMfpko2ie9f833bxJIvlM=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDAyNCBTYWx0ZWRfX/LYEEhBWyzpP
 ISNKGhHdkpUOBFjbdZsOfxB6Oo+cIMPT7WcRmgwlOzO8KzKNdMqG1Hv0m2oMQhY8EuSx1W0zkef
 8Dk1E2E3Dbx2NHxrczY/mkV+BtFEfykC6h2Y7H7rau19naZYGW9ubMOB/lGsArFXqDbt57pLE30
 ucS0BZxUdiPYYxyHi43GJA2xIcLKOcIZOHDNLVFpINoZInU8nIgkRbv/Bkftzm439JbW623jYjr
 r0LK9zri+9aix7pTz58lcYN6T5VPM2HOFi22YeJIVjLL5LELHnG8m7u0ScwKAj58jWqFWNk1BcI
 vbuXCSh3aEAio1irrA8xPbXMpq8o66NRioIPsWFLG+8kKQyRhwjwSy5E2B6ZI71/gBUHbPvwtZD
 oC0ImSE/tD5l2HRVbE2Y4bSvEBcOUdYwdLnbtjlwbyxIVtRFt72UEs512JHFArg5OTWbDfC1FNe
 /cfjRnuiUHiLW/WnQaA==
X-Proofpoint-GUID: yr8aC8Ur9V5EWcGO5A8-UBgGM-8af0B4
X-Authority-Analysis: v=2.4 cv=YsQChoYX c=1 sm=1 tr=0 ts=69cc8f8a cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=MHgItQEwDyoaoLbnQDYA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-ORIG-GUID: yr8aC8Ur9V5EWcGO5A8-UBgGM-8af0B4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_01,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010024

When the qcom-ngd-ctrl driver is probed after the ADSP remoteproc, the
SSR notifier will fire immediately, which results in
qcom_slim_ngd_ssr_pdr_notify() attempting to schedule_work() on an
unitialized work_struct.

The concrete result of this is that my db845c/RB3 now fails to boot 100%
of the time.

In reviewing the problematic code, a few other problems where
discovered, such that platform_driver_unregister() is used to unregister
the child device.

Lastly, with the db845c booting, it was determined that attempting to
stop the ADSP remoteproc causes the slimbus driver to deadlock.

Note that while this solves the problems described above, and unblock
boot as well as restart of the remoteproc, this stack needs more love.

Upon tearing down the slimbus controller (when the ADSP goes down), the
slimbus devices attempts to access their slimbus devices - which is
prevented by the controller being runtime suspended. This results in a
wall of errors in the log, about failing transactions.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
Changes in v2:
- Left devm_request_irq() in its old place, added IRQF_NO_AUTOEN
  instead.
- Changed order of platform_driver_register, to avoid the possible issue
  that controller probe completes without the NGD being present.
- Cleaned up commit message of the "slimbus: qcom-ngd-ctrl: Correct PDR
  and SSR cleanup ownership" patch.
- Link to v1: https://lore.kernel.org/r/20260309-slim-ngd-dev-v1-0-5843e3ed62a3@oss.qualcomm.com

---
Bjorn Andersson (7):
      slimbus: qcom-ngd-ctrl: Fix up platform_driver registration
      slimbus: qcom-ngd-ctrl: Fix probe error path ordering
      slimbus: qcom-ngd-ctrl: Correct PDR and SSR cleanup ownership
      slimbus: qcom-ngd-ctrl: Register callbacks after creating the ngd
      slimbus: qcom-ngd-ctrl: Initialize controller resources in controller
      slimbus: qcom-ngd-ctrl: Balance pm_runtime enablement for NGD
      slimbus: qcom-ngd-ctrl: Avoid ABBA on tx_lock/ctrl->lock

 drivers/slimbus/qcom-ngd-ctrl.c | 120 +++++++++++++++++++++++++---------------
 1 file changed, 76 insertions(+), 44 deletions(-)
---
base-commit: 36ece9697e89016181e5ae87510e40fb31d86f2b
change-id: 20260211-slim-ngd-dev-74166f29f035

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

