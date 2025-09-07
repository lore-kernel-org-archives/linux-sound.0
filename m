Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E662609D6
	for <linux-sound@vger.kernel.org>; Sun,  7 Sep 2025 11:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757244131; cv=none; b=DMxRdHxUdQ/1HY7XzqKBKeHFUnTUmTwSltSJs71g0r1HIiBdq1+BD1cqwSKe09mXt3r+FrZt4J2o5EE/JTSxUdZ6zLywcTf9BcLal9wfV6PZD3j7sRZsSSPwVf+gFlcrsbRvGGxP7L280sdC8dmyMOIN+ZfB1sqpY3wtVrgUZWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757244131; c=relaxed/simple;
	bh=Y67OeXOkwjcW/WgRDCaa4+GVWkV3DnYW2b1CZ9RDeD4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dn2jd7JefmroOKEx1jpPO76BmLypycJBlXZkXPxTZ+XXCvE3oz05MJNoxbFhABhptjDmNgUSD9qeNvQ9RKvVIKc5U4HYLnREBB46ds047eBjn43e8GBbXyyEa5vmiLhTDpicCUBpN/f7obqnDzHFVMyMxhiVZyo853aaArido+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=He5UVYVg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="He5UVYVg"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5878jIbk030394
	for <linux-sound@vger.kernel.org>; Sun, 7 Sep 2025 11:22:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Jw6p4thKtOG
	Ii/duK9Bwui939to4NPczh9FQMtKLRgs=; b=He5UVYVgzFSPSHyrXkl6dcmoMAq
	yi/iz8se6Vdqr3NKuNZmha2s2KUP3ql+FTZB2nAzdJePQJSPLH3XU/oYEeUb6Pab
	z1PW52eNrSWujywPLV4uDAK2EYtwlrbbcuvKgNVl+8E33cjoUI2a5tXwZvN/bdPG
	WCrGQebyzeLCHQw1F1hFIzVqOZo/Xo4t3xefMMIw4Wwt+mRpcP/jxFcp9J/drTTs
	uJ24rvR4pV/Wyz6yKFnXpJkb+VtYD67Az+tCioDhzqNx/RkxDCY6mUdbxjGl0XzG
	rr0A0SlheOFGe0zMi4LWnsmKC9Tp4cxKF4ds+gFVQA2RdcVu925xuqWD/qw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490aapa7ss-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 07 Sep 2025 11:22:08 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-720408622e2so74849106d6.0
        for <linux-sound@vger.kernel.org>; Sun, 07 Sep 2025 04:22:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757244128; x=1757848928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jw6p4thKtOGIi/duK9Bwui939to4NPczh9FQMtKLRgs=;
        b=oJKNM7Zdr4DihlOpxRLe2Qm+5/Bq7pxkPLnuIUl7i7q5zJpynQ14D5pybLR13vVtRt
         Llhv9F1izMDYtMxrsPr4z2rEDbs2n9msfcsloZaKUH3sYgPD3VXsrj9icPcRA6bSa2bJ
         eQR6NLzJHcHZvmKXFI8rXAcWCuM8h5nXpLAG+YodGessfg+qBbOFvU7gzh23FbBYgy5K
         V34QszbPZVBobJi+ZUtKyRWOgq3eag3NwKykDVlsd5Bs0kWFVO2LrTtScfxKWr4RterH
         tDTeGbEIfVr4gxsAZb18l2a89gS4AlK4Mzpp66clXvRFiJNHkaPGrOMa9S8VAeYqy3vv
         CVhA==
X-Forwarded-Encrypted: i=1; AJvYcCVadBVFpIrV7vhWIZfOGe6oCe6lMArBiL4xAGptJMXmnvYEa5fnFiJds+dBtwJAppAYwvyx3K6lQwA+ZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBrOk5GC7r3t6ideI4wVPi3znDaMRpy1oCLbHJ7sjBL5ZozuMD
	n5Jm/XjwiCvrQ7NfxxCIha/feUUv/9xhUGYxgVYlTfRzQntuezMsGycicO7pnM7T9Bi1nAoOkIl
	uqN9NDw9Z1GaB1OEqjqMwsaJcqwzZPiHsANYouWK7vE/bsJ6LQIUSDOQQd5aTRfkQ2w==
X-Gm-Gg: ASbGncv994m4DLMLYgaIKKhNwcup7RTCstW30TP5kef/iPvEqs+R/ykkoA9zlSxiqKG
	s8yW22PqDJYi3NRwcJGRRJEftttK8aHGPt49IqI+nXgq2VU9TRzINC970k9I687qRV2Wapbsw1C
	hpOw8ssQBdwoDrEPdjI4ayH0vU4PtaiIC1VYUu4fFPvtZDj0R1J+yYVVmdbo80w4qZXt4Zms5VC
	4fe1Ng0ndADJ3KZdKBV6oyxPjBptvdXnv4A3rBDxzpjCDnzXXIKJrf7MB0sHos0OAt7qXNIcJCL
	rsFLxl2OTa7i7juilvwhfE3Hv8Ea0cJWP9cNSiF1qHdD57TnoFP3Eg==
X-Received: by 2002:a05:6214:130d:b0:71f:85bf:6386 with SMTP id 6a1803df08f44-739453b8593mr51717116d6.59.1757244127723;
        Sun, 07 Sep 2025 04:22:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUK7tyWynSX9vOFGSp5aznUiforb8jjvNd8bvncFpn2AcSchHoh7Woa5kC+0D8QEz8w1rZxA==
X-Received: by 2002:a05:6214:130d:b0:71f:85bf:6386 with SMTP id 6a1803df08f44-739453b8593mr51716966d6.59.1757244127332;
        Sun, 07 Sep 2025 04:22:07 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf34494776sm37523289f8f.61.2025.09.07.04.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 04:22:06 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, vkoul@kernel.org,
        yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        srini@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Stable@vger.kernel.org
Subject: [PATCH v4 02/13] ASoC: codecs: wcd937x: make stub functions inline
Date: Sun,  7 Sep 2025 12:21:49 +0100
Message-ID: <20250907112201.259405-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250907112201.259405-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250907112201.259405-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=eMETjGp1 c=1 sm=1 tr=0 ts=68bd6ae0 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SV47_qJM1wkz75m2VG8A:9
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: 8qpIkvWVdp12zZcy0dfaPu_2fGE2i4x2
X-Proofpoint-ORIG-GUID: 8qpIkvWVdp12zZcy0dfaPu_2fGE2i4x2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwMCBTYWx0ZWRfXz6eMBSj96rE6
 BrzjILP/x/YFY3v3AN+FVtq8Bz998xjkJ/S4wHd4QXoETh2vgKlBctLxzQB4CdEpdiLMEY5JRQf
 EEHV2eSL6xQPCR0EIrIrnAzGOkFDqiZ6jpRsCdiaA/ixuORpxJb2iyBHZVVwupGgJkO4OvbZKXX
 YbWnXSkJ5dbbi85jZ9cHV98/DT9N1ytPtE47Tix4c5yM4t3yDKxk9g0UEkZTY0N7I3Vw/4+ywot
 8k7+ar4cdP7TbpF9H37kHdCCIgU1amiNdQn5GjtV66iNcgC5D1vvanBv7Ev1OKpdaYe625Eh59Y
 Fo1+OrLp8wb7p1fO8sHx4v1iYwJQgMtK2uqgTOHGHAGj7uA8tyl64vI1nonQAmotBhTJN4c8Z4D
 7164VjQu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-07_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060000

For some reason we ended up with stub functions that are not inline,
this can result in build error if its included multiple places, as we will
be redefining the same function

Fixes: c99a515ff153 ("ASoC: codecs: wcd937x-sdw: add SoundWire driver")
Cc: <Stable@vger.kernel.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/wcd937x.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/wcd937x.h b/sound/soc/codecs/wcd937x.h
index 3ab21bb5846e..d20886a2803a 100644
--- a/sound/soc/codecs/wcd937x.h
+++ b/sound/soc/codecs/wcd937x.h
@@ -552,21 +552,21 @@ int wcd937x_sdw_hw_params(struct wcd937x_sdw_priv *wcd,
 struct device *wcd937x_sdw_device_get(struct device_node *np);
 
 #else
-int wcd937x_sdw_free(struct wcd937x_sdw_priv *wcd,
+static inline int wcd937x_sdw_free(struct wcd937x_sdw_priv *wcd,
 		     struct snd_pcm_substream *substream,
 		     struct snd_soc_dai *dai)
 {
 	return -EOPNOTSUPP;
 }
 
-int wcd937x_sdw_set_sdw_stream(struct wcd937x_sdw_priv *wcd,
+static inline int wcd937x_sdw_set_sdw_stream(struct wcd937x_sdw_priv *wcd,
 			       struct snd_soc_dai *dai,
 			       void *stream, int direction)
 {
 	return -EOPNOTSUPP;
 }
 
-int wcd937x_sdw_hw_params(struct wcd937x_sdw_priv *wcd,
+static inline int wcd937x_sdw_hw_params(struct wcd937x_sdw_priv *wcd,
 			  struct snd_pcm_substream *substream,
 			  struct snd_pcm_hw_params *params,
 			  struct snd_soc_dai *dai)
-- 
2.50.0

