Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D40B416CED
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 14:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782742612; cv=none; b=JY8j/jUhxk3AtqSEzfWF+aPq4aS43vPNUkPM6y4EWJ9+ZJlNdFZ/kXU+B9R3D/HEXVrTDllhZ6XrHJ018erwiGH5MNfDEM75afiyqAl7qNl7c+xrFULojIkYkocIYM864yFPG4Q9VGz8hCtUogidj6w9WrTGLGcxpBk/KaZUC3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782742612; c=relaxed/simple;
	bh=ujKFGrBXfqzzTWYWiLZhzbg8yaOGSF7iUYvN9/dYiJI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mLaY+mVaYVaR8XLeI5uSg4Mfj4Mt58jn7JQQKgrvdzgjfPG63iY2X21S3A7dQrfd5WwlPKz5JPu0H19/YLz4k0T4A4LbiATugD9gUvFBPvLzl8bwlL5cc/4mqlZRYz5mSF++Q2aWyDopOM77Oe3gmWz3lo7JiFYPJd6R+vwA0uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I4V20ZYJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L+2h7g6H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I4V20ZYJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L+2h7g6H"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TAT4602627852
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 14:16:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=3BPlLjvuawkSXnix132EPJTzuTnANMmOQWr
	ZnYK/bR8=; b=I4V20ZYJlZ/zhQTKKzMSOaOyTstEz3yCPBg6wZ6zBt8aRQFHWUH
	lBTeXK3WiaqJD62QP901tGkPKZtv0Nq6IFrq5ufLqW97azJ9esbh4QjjQRnStlZc
	U2VmZb/3RIeHiooJGn6+wN00thfpi27kPive5H6n42G1yvXmJbK+enjYRja9D69V
	yW0ljbT84UNCTH+oCXBsZBIJQwCGROKdZBQyENcRs3gathxHMBE2NAnha/RXDdjX
	qFdzge/q3W5WpRhUs0ePGcj+OBwqFZyXDCGx5ZiPFcD8dIK+e0SRx7rdXEQ6NLqd
	wUUenp65p6ULMEkY8yQS1BelpZp9s6LODVw==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nbgs939-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 14:16:50 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7e60737a964so5443981a34.3
        for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 07:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782742609; x=1783347409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3BPlLjvuawkSXnix132EPJTzuTnANMmOQWrZnYK/bR8=;
        b=L+2h7g6HbgditjzHzvybO00yEw9leQSKFiQsj8NrRZu0/Bg5Tg/fg9bHgFHVZtILcG
         eTY0HFUr0rKUr+5hGq72R8R7Zbdh2TibSV1B5zNrgm8VSwzGfzGNWvn8+prmZ9UVofZW
         IFhjwmBYPnMHcxtO9Wew/3Swrf9Mc+/8RjGNrJn2FkJJ96ZmSVCQF8hF1XsQhqfVzdNT
         9kVzu4yc8df5mWHsn4yCJbvyt4krOOC0Ffn1dHsJ68Gm3xK4CcL8ZKiy39tNcuQBt3/U
         GsXLH1IjjVhSk2nIpmQFJG2RKFTpkkcH8x9WL9z33IdL744iTFlybS/9OVdKrhE+3pNE
         iWYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782742609; x=1783347409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3BPlLjvuawkSXnix132EPJTzuTnANMmOQWrZnYK/bR8=;
        b=V4BUXiVIxq9czYJSEoJzYIc8Ng1wv02i61auXbT+2lbT2Q+OkKzvRdgjVDXdu0Ow8m
         xeQSUp7cdO5IoJ2rJWXEJmWgzWVsZoHyega1rK8tizu3gQIJy0lKa+BG6gu7gpiSg+KB
         lnf3svXGEuN0iTf9yEXi72iHFa5z/ArKdylfPVCf5MUghz7beI1UW6AxvgqNJXstKscg
         f45iCSYX0gSFcURRupWE00JoxuLZPCDNpHxMsYY9wv7UnOWwp5XguBWY/KMSMN2Whkqi
         AUI26MXuHB6Qk4kVVRtMs+xLNL0EJ/+rS6/8NDgKQ13o7TucWR3krfQFbU0L8BAchnKK
         CWfg==
X-Forwarded-Encrypted: i=1; AFNElJ/6YQ5rUeeXpxnplvdgPXJORaYA1k6wl55mcicHG8Hu7wZNM1zHjYQEQYTPqRH4cqXbEzgYlu5IBGii3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGIX+9BkQn6K1V/VXzs3TePU5D9K8mrj4yCSdqvgy5feTkWlcD
	DmAYgnbFwrKJHrIiJcX/rF5p4lIjYwCPTOyfrtlcHsVFMdSEKYXTO1RxsKj5HQsHY/Yflgxqjl9
	9LRw1EpBB/G/JjOCHaB/mdbpE+lEPT4QSGsxrD+BO5Rpltqmpoiz+4NslYYLZR9K4Fw==
X-Gm-Gg: AfdE7cn5RlrUTz2NbQ1swdyK3a7uCzAZNkKHglxV5/ieKrldhXzkPMxT9gpG3bpGDm3
	zBhfx1uHnBbJOQ6Wd4wDMLLindHEUP5tdsXbyI9+5fyWGZ+Rm7cJZZAk6DLWZ4whhx+h8fkr+3G
	Hp+QlRmnLIP8BBuZZLniSgcScmLYCp5RLx/I0jdwQtfPQ5SrHzJkIDUpC6YqoOgxIT5Da+zUTx8
	9KxQqNLDt/PoVp+AGKnrsyRYWg8WW6lGtR6RiJNsT7M1297HMcRcDbZGcwVuYQAZPdvsntRUXxW
	kLuxbfEe2WrINJssKSk+noYsCdBG0MLYYMXEghBRrKme7plo/HgYkEplYOxx/KgjZG366QsP77r
	m9NVwB+54pRmjwTVH1Ku1KdV0t8n9Mb273Bh7LJQKls2rhGo=
X-Received: by 2002:a05:6830:f83:b0:7e9:eaf2:edff with SMTP id 46e09a7af769-7e9eaf2f456mr125050a34.26.1782742609390;
        Mon, 29 Jun 2026 07:16:49 -0700 (PDT)
X-Received: by 2002:a05:6830:f83:b0:7e9:eaf2:edff with SMTP id 46e09a7af769-7e9eaf2f456mr125019a34.26.1782742608855;
        Mon, 29 Jun 2026 07:16:48 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9aa5d3500sm8584812a34.8.2026.06.29.07.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:16:48 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] soundwire: qcom: Restore and fix set_channel_map support for SWR master
Date: Mon, 29 Jun 2026 19:46:31 +0530
Message-Id: <20260629141633.86657-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: aOZwAGKaD8OrGU41KDw-LPKiqTPVzrMf
X-Authority-Analysis: v=2.4 cv=Z4Hc2nRA c=1 sm=1 tr=0 ts=6a427e52 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=pegW1h1avVakzY11HMUA:9
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDExOCBTYWx0ZWRfX3/a9KAiQD+cd
 5LNuuzU9De9R7rwbnLjdUW4H1uIKc7WUthfbXs7cJR968O5+U8RZ1+AY2e1Bj0P5uv0GY/hyuNA
 Zms/bO7UVaOo6ZBM8nfr+6Vs5pPQO5o=
X-Proofpoint-GUID: aOZwAGKaD8OrGU41KDw-LPKiqTPVzrMf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDExOCBTYWx0ZWRfX2yVwLliX0T/D
 EZmwBx4QS6AzdQqhU7/xKMUVGSklMkCMWeNQt1Xt9jX0mbgZxIgkw88i/yr9cew3WxmGNvTrdwi
 ps5RUiqmrZLqRUDrQpGed8vYjI5p5hWceW7RvcIc8o+q9T4hqcUgheG5i3iNMOJn21KRf149X0O
 2kGIq5GigryyJIp4/qKPM5S1K01FYHYuW3p1lNMk37xkpYEeuXeSJQeGrFcraYIWa1ODmO5F+9K
 SNJWx5zlR/jO+pMcrPpFVQiAqL35ZqgqlDNpah4t6+Ta+P4uaafxth/Cx4MlbM2RdXQe7OcEbK9
 kNtajUXwAWw07OSv7lRRMxNVRDof8acP06UrwQIq3C7QRk0xNinAfk84Z11zDNGu5lqCGGXJ6eZ
 UzIl+GjGpgtDPyoA0ruG/DVqQ5E5RKkZKA23K0J3hOfVq4bm0W+9gsuKIXPwsM95z251/u4MCRi
 xCutH9wAriCNe37h53w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290118

The original support for set_channel_map in the Qualcomm SoundWire master
commit 7796c97df6b1 ("soundwire: qcom: Add set_channel_map api support")
was reverted due to multiple issues reported on sdm845 board, including
kernel crashes and data structure corruption. The root causes included
incorrect port indexing, array size mismatches, and improper handling
of TX/RX channel information. This series reintroduces set_channel_map
support with a corrected and safer implementation, and fixes the sdm845
machine driver to avoid misuse ofthe API.

Add a robust qcom_swrm_set_channel_map() implementation that stores
per-port TX/RX channel masks safely under controller lock. Ensure the
configuration is only applied to valid ports and does not corrupt memory
or overwrite unrelated data. Preserve existing behavior for ports that do
not use set_channel_map, by falling back to the default SoundWire stream
configuration. Fix the sdm845 machine driver to avoid applying SLIMbus
channel maps to SoundWire DAIs by skipping DAIs that own an SDW stream
(identified via .set_stream).

Mohammad Rafi Shaik (2):
  ASoC: qcom: sdm845: skip set_channel_map for SDW stream DAIs
  soundwire: qcom: Add set_channel_map support to SWR master DAI

 drivers/soundwire/qcom.c | 54 ++++++++++++++++++++++++++++++++++++++++
 sound/soc/qcom/sdm845.c  | 27 ++++++++++++++------
 2 files changed, 74 insertions(+), 7 deletions(-)


base-commit: 3d5670d672ae08b8c534b7beed6f57c8b44e7b43
-- 
2.34.1

