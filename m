Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795603119;
	b=Z+t2Ecj/1gLMlpSX+T+HLkh+adZSLuJTCFikEtdvL+jqfnFMGq3fQF1qQcimfXAfuFYI
	 7y6O5XTpTY4sb0qWqAbQ0WiWDMkL46ZZxraFNMgC9Q3p2/uzv56dxBUxYveBYda+8C4SO
	 uuSyh9ytrvBWSqBfi7/q9PObsXy1xfKxYl0IV0tPwulctGn6QaVmXtylA1VNI6Ljd5Oaz
	 cqkAn2Jl13SezN9ESts7hjJ4sc6zp92h7RbKoWYdnMlEdUUy+DalzEfxoHGTGt1tYuJEs
	 IfbLKxB0ZOUjRJNGoCQ3j+OnJyGnA1aDdTMpBYmu5ePP/YNxBkOMV4+qXrzfzoDiESg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795603119;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lYNN0rE+dUHJ/lh5txZ4L6ybaalR++hG1Fy7SoKy798=;
	b=0LyzWMvwBhKOYtECU2weh65zhgzI6iX0xeneSFa9CMrBU5uo1mO5izLiZAQW8KKpsRXV
	 OwSyXGPrd1Yykf2YZNzseMpYsTPXhDbO9IhbEsbTP8KLotxEQU/NOVMo8JulcgzjDLE3Z
	 /9Z6/oihPpvyzD4+ozpC3xWcanhxNhFolojk6Rp4yzD7H/5eAylU8jBxBDbrsEmo3V5y3
	 DbEgnbyBCUcEE1ubCedaMLp0peBAQJNYzDm23js5RUb75wH2SUqlwKr1SLnjgvSs8ymZ9
	 JmP5lmyknqR+dPuHtnjHVePKoSrgenq9UMAgVaE3lNO15y9O5FtGYb6KlzF/YHj2pyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gIlV9BIY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RkJ+0eGu;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C12F606A331
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 10:38:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C12F606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gIlV9BIY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RkJ+0eGu
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mTIf4034187
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 10:38:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=lYNN0rE+dUHJ/lh5txZ4L6ybaalR++hG1Fy
	7SoKy798=; b=gIlV9BIYUQ6FbHNklMRnta5hYmgxqfFSNL1CsWUbWDFuvlDzRoF
	rmEJ/rxczMLQb//yz2ucn8kWVtpcMkoNPWSK4GZeidbPkKdSDlMoROYwt2VLH2uN
	kBdK9i8sn6Dq8ULNTf+EE8mznxSxKUlHpMLRHmsYIMeR5zVVxOJshrpWoQSQ/1xU
	KveRVLNf5soJM+VGk/gfyggeZmzN03HDXTVBeLwoKoMKh9zq/PWz+WlPCq1zVOvG
	Qjf4ui66Y/4JJNnaSmsPByGHjAUyRKVl3OtgL/nuE2+Wzra5mPQMBYxQY88zT50o
	bLlloJ8zPV8mW9GA64jZ7toqdMrQ8KFwrAA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mqbjb0x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 10:38:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934963b2bc0so1010025385a.3
        for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 02:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795603117; x=1796207917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lYNN0rE+dUHJ/lh5txZ4L6ybaalR++hG1Fy7SoKy798=;
        b=RkJ+0eGuV+iEYxQ9PE8akrsqmXCBzGodOmNHOZXOFKDESRAN4zi3OrpvhMNdMlm1Mq
         ppqNYeleqoihtGvrHL31t5dMkJiwHpYHAlsKAgInjt7DRCfNq/Ta2CPVlZUyYJNlzMeu
         62HdMGBhhNz1JuifYnq0FE+JDXx7VtnqUSpj1gebV8aMB3ORwB7OUglYh0A808DgXZkt
         9MF0OvZ9DDoWiYe4mCzASoD9zTBYhDzWcdilcV5yxmdCr8V4kI2CDJMmbgtFPpvMnDWr
         x9k2m/8464LJ29SDXWZgGNpuBOzyfsXGNeMSene5Cdn4C/Ah+CcbBorTs2NUW+6j8Prw
         FznA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795603117; x=1796207917;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lYNN0rE+dUHJ/lh5txZ4L6ybaalR++hG1Fy7SoKy798=;
        b=NJvqesfHdFTKfzabI4gtCaIwyuOU116B+2kz4Tw5QDyhgWIGv69JFAvIkpTI1qU618
         ufi3K4+SwwQD8tVElW/gBIVYnPMqLfoXVlYhpN9Qsfvhn43E86tZhp/up4adgwY+oJ4g
         1sDlSfcdpOB/2knwq9bbYo36kNmLzFVhVzMnT2KD5JDwGr0XyR1XRWloLrQr6iOzssXe
         7AjnCtUNbHHvaeRPKPKagU/wZ8nDeY2lCfV0vGetmFBCrIvDzyE8L1x0Fx6T3cRG834i
         29cXQr8wp/8DLuWjh6KXg1aP+JK3W6q+yh9qCg4AmkgNqI5R/gC2mIAnboiZcRbM2Zi5
         j05g==
X-Forwarded-Encrypted: i=1; AL+hErEVgv01edxJInSEjHEGhaM1nJRo8dNtXzihbGEKCwYc9/hAA1sX2Qgb7DMR+l3FxPxVZm1my51oTSApbw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9x68Y4vH1EVNuFIIAtdz3vZnqoMOZUXSszhGjkB3urqf22ueIL
	OKtE/2aGh2YUAtb67a45sUdyNw8JFLsQQNRj6NFnNBQ/+bkHYz4leg2KobknP5koOipc+YiWD6k
	vZQwxqO/SRb04RR6jSIA63plqTv/r4K7awucK6SHGEOK8sdLQi+heWpxVwgZpWL0jaw==
X-Gm-Gg: AZFdTZf98Yx1dX1xMA+N2Df8mLCH63wxXhsiuw6gmbIqNlnavUZsrNzyFUXs9MYdXiw
	YQzxm0wAHJMpEOSPURLnkmcRnoAaHJyRmInz8Iq+MpomubuMC8ZQjoo2qtEyKKUAIA54poUsQBr
	NQ4QeoYb/qVqRsHQgGZBwRb51j2jv09hZprXTC/flmy2BzozAzYEdiOm1p5hiZT71pwv6eDRiY0
	v3kJLhaOgKHdc9mORGKnhnaYYoq8VAonFwa2YFuaVsanXl66WcICXDzUPfdG7Jyo5uEbSizox+s
	X0fhrmhu8iU8sJ934BZ1Y0pm/1DMpEaS6lx7zlrsKA0Ntw2Mjpi+2O78foojaFTMIOzcggNhV7S
	INTtVjyiJxKPtJeMzwQkjUVi88VDbYX4oOAs1X8A8XG3Rpn2JeeWsu6U9qIoBLVib
X-Received: by 2002:a05:620a:1713:b0:93c:6534:d04d with SMTP id af79cd13be357-949baa0d7admr3060479485a.35.1795603117181;
        Wed, 25 Nov 2026 02:38:37 -0800 (PST)
X-Received: by 2002:a05:620a:1713:b0:93c:6534:d04d with SMTP id af79cd13be357-949baa0d7admr3060476385a.35.1795603116608;
        Wed, 25 Nov 2026 02:38:36 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa397asm34171502f8f.48.2026.11.25.02.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 02:38:35 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Srinivas Kandagatla <srini@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 0/4] soundwire: qcom: fixes and multi-master follow-ups
Date: Wed, 25 Nov 2026 10:38:21 +0000
Message-ID: <20261125103825.936939-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MiBTYWx0ZWRfX5MxamVvsdl5p
 BchGli+MItD59sM9X0u1DRBILTm3eA3tNhBUXNy/FKE1hz5TvYXmiFxRbrbQzFUgU/JMjRkEF8b
 OsOb3j4S+drav+FRM3HDJGt9tyudUhY=
X-Authority-Analysis: v=2.4 cv=Bb9NQbt2 c=1 sm=1 tr=0 ts=6b06baae cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=_Oj4qczf_YSIFfDCRqkA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MiBTYWx0ZWRfXwfr/bnBwAo8/
 oentevUoUuuVmYNEOPsr2AM7KaKSvdx0Ak2Ix6fQ3shYdYBIzBHAXhTrnPoH9VFKBRwUXALntSI
 vwDgLAOOTDEwO9YAUNALTzp8PU/CLquRYIp5N7u58L8TzZXRvoD4G/h2o1td6S//yC1ccj08/nc
 x1lOLm0zefs8SA5WC7MkcOm/58zjDdo4ILRMhCH5ylBzotfoFkPX6j8mHmQ/6f7gm/bER5JLQbK
 FXx+FVpVxdcXmSt06xMCYfotNNf1fH8j4q8Rd/kE7U1+5aTW3rev3XD4ivrNx3kg+o1wWboZcCp
 IXf11W42WKBNynvBHzcv3kERAIpCgAc2cbLapSvT0OwzBfM2/Ez9fUrmoGBf1hPw7BYTFllE3V3
 2eYxamuCujA646w4qMm/ffu2ObnFCXeCXW41o+nCm+1MuiCoQS78xpPslLoM3lMd2dx+80osdY4
 99Vhzbk9xge4Sqt2IDg==
X-Proofpoint-ORIG-GUID: 3uj1aafW0B2nQ9lvNfEJekVwSZfLH-zI
X-Proofpoint-GUID: 3uj1aafW0B2nQ9lvNfEJekVwSZfLH-zI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250042

Two pre-existing bug fixes (Cc: stable) picked up while bringing SDCA
capture up on Glymur-CRD, followed by two multi-master follow-ups on
the series merged in vkoul/next. Tested on Glymur-CRD.

Fixes first:

 - Always set master p_rt->port_params.num/flow_mode/data_mode in
   qcom_swrm_compute_params(), guard the port-params callback when
   bps is unset, and bound-check the master port number against
   ctrl->nports before indexing ctrl->pconfig[].  When the DT marks
   word-length as SWR_INVALID_PARAM port_params was left zero-
   initialised, so dpn_set_port_params() was handed port_num == 0
   and bps - 1 = 0xffffffff was written to DPn_BLOCK_CTRL_1(offset,
   0), which is outside the DPn register range.  Addresses the same
   underlying bug as Marek Szyprowski's RB5 report.

 - Skip offset2 programming when the DT marks it 0xff
   (SWR_INVALID_PARAM), matching the behaviour of the other optional
   port fields.

Multi-master follow-ups:

 - Fan broadcast writes out to per-slave unicasts on the multi-master
   primary.  The primary's HW never raises SPECIAL_CMD_ID_FINISHED
   for broadcasts on the shared frame, so SCP_FrameCtrl updates sent
   that way are lost and following unicast reads to the slave time
   out.

 - Program SSP_PERIOD on the primary at init and on bank switch for
   v3.1.0+ frame generators that derive the superframe boundary from
   row/col geometry, and zero CLK_DIV in the same write so a stale
   divider does not survive.

Ravi Hothi (1):
  soundwire: qcom: skip offset2 write when unset

Srinivas Kandagatla (3):
  soundwire: qcom: always set master port_params.num
  soundwire: qcom: fan out broadcasts on multi-master primary
  soundwire: qcom: program SSP period on multi-master primary

 drivers/soundwire/qcom.c | 72 +++++++++++++++++++++++++++++++++++-----
 1 file changed, 64 insertions(+), 8 deletions(-)


base-commit: d9ea256ee889f3db9f0bd07ce5d114ce92e31b4f
-- 
2.53.0

