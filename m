Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C59D37E5EA
	for <linux-sound@vger.kernel.org>; Sun, 18 Oct 2026 19:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792351454; cv=none; b=qK9ttWnSj6y27EXBgfgiuDLjQuTKY29l1cq+2GgDoXhcYX2GYliSL29uaBw+3u/ZptNOvnTWPdRCCV3nOaEMI1R2XxJj5cW2KSiblDcrf/qsjRwbK/U+UOO/8AwMeSCmW4ZH1MruQAGV+QnniVCvnGkQ8bqpTTxYenFqeP8RdnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792351454; c=relaxed/simple;
	bh=YoqBaynnkRTpbHb388bGw0HFMwNyf6BP8DpEms8qk58=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aLnl3/2KCnvEqogpIa4yYzT45e5lPHxCac0sVQb8iYEg4AcR+4toHUJ/9bHzmOQe2BpMpysckor15pQtuIGhZJ1ME7CI8txSHOkyEYDxecKjsJ4o9qGWmZzPlDPVpytGDPBDITMr/zltw1KpqJLcksQ3GeGfMJLK0FcZxhdgmZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z2YJYzpU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XWJC9lv+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z2YJYzpU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XWJC9lv+"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69IIU2GF298523
	for <linux-sound@vger.kernel.org>; Sun, 18 Oct 2026 19:24:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=MBcFHoWt7kw6+kIJkdbihaQS653l5TPxIc5
	Bc3LSNlE=; b=Z2YJYzpU1gn6jcIItdIgYuuAQ3+pqF+YUCcf8FtUlGF6WhSpg5O
	1w/NkMuF6nNtRaI+Qd8L/05xzpN7wpLamicZuSt0jUXaUAkjCJlxnRqrh4nErL0T
	65zuYOy4eeDZvik4DSiDA4KnJ0ER5DuL0IgJH8n3irrh079WhuDA4zrAVZSdZ+NX
	eUW2CUg/tmwN6qAMpzgiuff5R9RaxLeYAemjE7b3a6DOjlpSbSd02YYOFUwMVj20
	C9IYUadmkhc1ICFALSXXUB5ND4cNhhp2eU4C9SYqZirIPtX3TsJP46QTUeE8CRn+
	ax/kuVWMb40okBdmQfy7gWi/9dzNKHH9YdQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbxcnv40r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 18 Oct 2026 19:24:12 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9197553d398so34568376d6.1
        for <linux-sound@vger.kernel.org>; Sun, 18 Oct 2026 12:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792351452; x=1792956252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MBcFHoWt7kw6+kIJkdbihaQS653l5TPxIc5Bc3LSNlE=;
        b=XWJC9lv+5i4VHsC9UG4cA3f8xE0d7neLcDxYk9TxaYOZE5Cgt1iR2ajwGHm8JgEpNM
         oHPiVY81JZaxFWLaEn/lby/9V4uq33OpD3UWwJdlDcJlUcLNO55Yw8qzpKaGVV1rmWJ6
         WGKoCoSH1fCTQODy8yPPQoD8FzYy5lmCLZD4v78iEgJAQ/NM4Ng9w/0ft2TxY7Ev6mVN
         cpGO0JsfwBK5ix+Kd3n1sTMg8IOw5YGahnY/sYVJG7SnG0aUFOtLWIXK91CkkmindB6s
         TMmKTpZyu3WwJG1PBAFnlYu7vaRGfjB6omwitq3e7WfpFRJEK/bjE91rO0hvJKygejEj
         7o0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792351452; x=1792956252;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MBcFHoWt7kw6+kIJkdbihaQS653l5TPxIc5Bc3LSNlE=;
        b=0aioLo7QE3g0YyBASW7tgX969aBOCsfGTgC5d+ZHm26jfbXbYrqYEFqXO5y3ImkBBC
         F8yHemXtew9+bgDN9sRXbyKzLEMgs8qLVzP7pEMQ4Gr2qHn9MJieZVxfvc0nltXJtNb/
         UbD8o/NMpzFKBkj0C2Acqgvx5Vo8kq1WHCampXYD4SRwt1hZIIutOo9l3Mi5sVwdfW0A
         5QFoZVFrAauKGxtm06nl/49WtH3AR9NRljrJ5rD1tDywNaOJUZqxrT5oHdUPMmABlqDQ
         NxZBRL4gVu2UN/KrAX9shkWaEjBF9I3LnXozzltB0PEf6uvlQSiJxrekVXFlsbFqstEA
         IeIQ==
X-Forwarded-Encrypted: i=1; AKwUvBxfcJv4rt0AAMDI0XniBClR7qf7nLLWLg568921bdCByiU+3d5QW1TfaeJbSL8l7FtmWkg2BpFRFlhuCw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKnLXRnFLqSDCAspxmUGp/V2TM2bCM52x1DkdAb2NKlXmlusejP
	aiMdHc6Etdc4oxpSRjmkHsh0XFSA9dl2Nml/EK7MIrd3gEfeTwT35YzwqrM2irpYfRxP7eUgTnn
	G+lU3rR+kD9OPTpBtSW6rAVTwTRjEgsJdEy4jlGFt4w84F225PvS+IFtfSZJW+7A6SuGvz2b/7g
	==
X-Gm-Gg: AYBFou1CVLhkat87RcMcyX7xMDsCtN7JK7CYkfy/avl1ub6I1D9TtGeOR/UmeXr1rhM
	ULUWbLF7mL+9gBO0KNtbLe/179xEbXG1+dTKG5SMi0oVNRFnhU8c0wqzx6KYcPs4ti600z6weB5
	cdqQu2b+q2LgqRvuY2IpXyrusGqFRBmt5o6w+Alr1Xal1L0mqTQN7ow8Sq1WfGh4csHc7ENFplL
	OHo+iw4HOGt3M7gR9QxpBRipI8zs8HNDhQRc0O0ztZIa4WTrOsOQSase+LrzgHugeECGJwImOXc
	2TsNNmkOxlYHuSDkAer88IZwHVX9i5cQ1z7/keAETGUYkIUDqkFUR487HVEwFDZ5w3xk34xPCKF
	Ijgzni2Lnh/W3
X-Received: by 2002:a05:620a:648b:b0:93f:2643:bd3b with SMTP id af79cd13be357-93f29d7b08bmr948027185a.54.1792351451325;
        Sun, 18 Oct 2026 12:24:11 -0700 (PDT)
X-Received: by 2002:a05:620a:648b:b0:93f:2643:bd3b with SMTP id af79cd13be357-93f29d7b08bmr948024985a.54.1792351450838;
        Sun, 18 Oct 2026 12:24:10 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1ce33ad3fsm184417105e9.5.2026.10.18.12.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 12:24:10 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>,
        Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Takashi Iwai <tiwai@suse.com>, patches@opensource.cirrus.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 0/4] ASoC: SDCA: class-driver fixes and PDM data-port support
Date: Sun, 18 Oct 2026 20:23:55 +0100
Message-ID: <20261018192359.287987-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BNUmP1QG c=1 sm=1 tr=0 ts=6ad51cdc cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=sHKVT8uASMeexBIr0KgA:9
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: quhnjSixJ0-_xDDsnOCP8PeBztIp_fSx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE4MDA3NyBTYWx0ZWRfX8LSof/ihOVJj
 RZ7mGJJKK79ORiULkq4xS+by//sKNSYzxbzzKhFCr0HhwbTX7QEoXDRDCOAw+nhc5vjX3YQsQlo
 Mp3gBfX87OIiZdFWFG4o125iVn5Eq9Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE4MDA3NyBTYWx0ZWRfX/cX6hwzzPErX
 atHztbsgnMtvRU6CUf+QtbuWAHCWkZps6859GAqTL54JiQ85uVWW06Z9CdiWgeNk9MBJW7rH0vL
 qWU166X6dqVTk0Sqay8eLJ9rf0k03GeaV7bxLyZXZEWN9FXEC1bupFonrJgOdo6GY9wszyOd+xW
 mYl8Ke84PmJa1UsqeXgfAtMI5p2mDZoV5POWJFt9BeHp0Eea8YSqbqdURcSEpGyir3mRu2hXgdu
 bgIxWqfZUjR9zTUlRIXqcPLSIHYJBZbmiNNJnqUp2izCz8zg1Aj14wOwdU/g9atQ8cBz1i+P217
 lK/q570ZTc6lMwty1vZqIcqIb2MxqOF15WRHrEN4KG1qJl06gnUxNwXUT8nmhUJi/NuSPyj1ZVy
 /YeP9+6lsFcegygHUQLv80AvqSMzmnPSafOTZ9QN6jwaGSnyZSwlzXz+imQ0OCBMccyE1ulaXd8
 6HF9B9X6iL+DwvdVvqw==
X-Proofpoint-ORIG-GUID: quhnjSixJ0-_xDDsnOCP8PeBztIp_fSx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-18_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610180077

Three small fixes in the SDCA class driver (propagating a read_prop
failure, correcting a pm_runtime ordering, and re-enabling the IRQ on
a failed system suspend) plus one SDCA class_function change that
clears sconfig.bps on PDM data-port terminals so the master's
compute_params() can drive the per-port wire word length.

The three fixes carry Fixes: tags and are Cc'd to stable; the PDM
clear is deliberately left without a Fixes: tag as it is a semantic
adjustment for PDM-terminal SDCA codecs rather than a regression.

The three issues were flagged during a sashiko review during WCD9378
SDCA codec driver patch review.

Srinivas Kandagatla (4):
  ASoC: SDCA: propagate sdw_slave_read_prop() failure in class_read_prop
  ASoC: SDCA: enable pm_runtime before taking the initial reference
  ASoC: SDCA: re-enable IRQ on pm_runtime_force_suspend failure
  ASoC: SDCA: class_function: clear sconfig.bps on PDM data-port
    terminals

 sound/soc/sdca/sdca_class.c          |  9 +++++++--
 sound/soc/sdca/sdca_class_function.c | 15 +++++++++++++++
 2 files changed, 22 insertions(+), 2 deletions(-)


base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
-- 
2.53.0

