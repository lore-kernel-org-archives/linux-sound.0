Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4310289E17
	for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 10:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761215158; cv=none; b=fHqd9pB5VGlG5VswE5+eM6GlgQ+GCD/0N4Uk3iA5GPQxJCIBr9Z8wENdyxD2ypGYTPJRR2iTPKCfeQffrrhLfN0VGsB+YXMa13BzNAJsnbAaBmOM56cMLuAxVPCnJHTMjb87BD37Hm7Yq5m8Uxfq9CLt37N6fT+yBgqE8ElYEM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761215158; c=relaxed/simple;
	bh=MuNDVGw863t1MIYdxFnFeXldKN/aMHxbss5HGe8ElnY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q0zX3KceVh+Pjj5C7cey+U/XwZMyCc8OKKaufWLD6mm5MXBTI6WLTq6ZcsQXzw3AdFIwVSPJcLGXnwiBpl40e+FQK/cwDcXSzqi8Szd2QGw2aejMG/nS5pfyQBX1hG3OBVesFu0HLTCdsMc7bGSCFxn3Dc3PTR3mC27ZRApTdIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n9pPd7dj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n9pPd7dj"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6NGkl016465
	for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 10:25:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=e6NuyEZl5rpUsxOevTTxhTo/WEHtJ7ZXG7h
	onHAVIWs=; b=n9pPd7dj/zaPBPQEhf1k+FZ+bs3OybuJ8u5pi8eFhXU3AC/AFcT
	m3lx3uwM2F7uUyZDMr/Fm0pJtGLCPxmZVNGBjDWPHGC2E4jY7K/5sOVY5KLgl9B6
	9oCkonKq5KVc0wZla5GrDNkoaPyTJk2GOJsmiw75WRV/X7zIisZav3lni9QPtEpP
	kZMKydpGwKXd4y2dywN03oXCs24AVBvrqqPf4m54o3lHZ4PYKrYVv38Sh0hJzRP0
	WQFKDgsRQ/gjHxukNFdugADbj+ULKS7NPnMJWYY22u4zNAq1lpjMaqhYFtSFLgPr
	kZ22M4EMKerOrwruHd5JyYR7vqVxB7YLMww==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xkpsdmu6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 10:25:56 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e8a73256easo71101261cf.0
        for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 03:25:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761215155; x=1761819955;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e6NuyEZl5rpUsxOevTTxhTo/WEHtJ7ZXG7honHAVIWs=;
        b=wu1HNZsrkOpAyWxe+htFPiDLdrOa8QizuLqTcgfdU4/js3veSqHIJrPnvgHh2tiTmg
         5YFHWETDhBtXu7xeFMBdWAWRLH7T2j3v53awB8cuooxyO9N6i4PU6LUCYwkU6KpvWtBl
         sSKe1HiQ+QDHHelRXSm5r4v9ywjab9VANY1eaKE3S4Oh81lB6cMvhW4I8kpVIJpGiXjF
         GC95DoLSnxpLNjtViovTIfbXLKiovdzZ6sVS5fXInNFQ97H0Bz1j73aJpOhpEALblVud
         cgX9iqJx3s7UCMMr22zuXLwwl4tvckj9uIzWo+bkGBOEAKhu/4nZaR1S1xcrwiQOfVSe
         qGog==
X-Forwarded-Encrypted: i=1; AJvYcCVUbK5L/fLxStvCixFHoqU3OYgsi23rrIMtIl/sUOLulVN35NuNaE0QCqlD6/7kGqPV1eZt5zXr5NSWcw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhmHaN4glN903Sx6At6CCM/lg1OKRvEF4CrkNHZ0/W4pSLCbEp
	s6+qcxRyLHNxr39nj6Ph5W+NCnFij3HzPkm9YgCEc6PnLW9w4DA7KK7w8gKvJPJDrHakgRQb7Iz
	zjFr47cZBGznqs1fXl2O3zLYrCG/9T9d6mPpozG5YFXO0RLCV87U0Fz+1v37qvF2WEw==
X-Gm-Gg: ASbGncsrfaP3U8hL6rXtMCQZP4khA+2/MMa+YixLnraJog9n4dAWVWPjToUfKkkAtbV
	BrEZ/8po1rKv9OIG9jzJK28+CutTAHGmHOqSP20aJVTq+B6dKJeTBQ30Iigmaf3pS2XkEknDiAT
	BGxR3qkRPpaAUvR8Y+HaDH4NqoEqgIv4eo3eQNjuksatVd49/q/4ZS27BxfpIn4Txubhum8Os08
	HnSC4GQ5BwBfi/ehN2/UuK4SldIK5DkKoi1Che2IyM6IvMsUGplFFvbO5JA8+ShKd7oYqgpF7dQ
	/voGvItc5oq99eDKOHXmT8UFbLKNlI73RhBxRbsUr9gV0FLfI6PoGdOLur2Kv3/RTB1MkxNCgoC
	A16u1NsWvjkA6
X-Received: by 2002:a05:622a:3d1:b0:4b7:aa1a:eb1b with SMTP id d75a77b69052e-4eb784a0e0emr61011051cf.2.1761215154755;
        Thu, 23 Oct 2025 03:25:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZ+fBPIYF+HXBjwQ3mpEIhl8FmKoONb/emdfB+NWGfyifEI1oSIA/Fyjaxd3+5zqRuhDPVpw==
X-Received: by 2002:a05:622a:3d1:b0:4b7:aa1a:eb1b with SMTP id d75a77b69052e-4eb784a0e0emr61010711cf.2.1761215154168;
        Thu, 23 Oct 2025 03:25:54 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c427f77bsm92220685e9.3.2025.10.23.03.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 03:25:53 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 00/20] ASoC: qcom: q6dsp: fixes and updates
Date: Thu, 23 Oct 2025 11:24:24 +0100
Message-ID: <20251023102444.88158-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE5MCBTYWx0ZWRfX71A6u9ADA3Zl
 3htDpYQSLf29earN+D1llycQey/0pEylcUbTjBD8EMaeanSY1QyaLqm5QwyCg7Tu/sob3ziGkqq
 JMw9tCkSG9KPGksZjWouTVKdtmuXYrKUSdCCsTVZs5gQzzIdPH7hLTwlg8gaCF8zxkjqkDQ7lKW
 iSk+BVGqKD8S4HSI7C+bNn5DMilQ9rasqkF79t73x+cOr2H2Iz34fh3mLwUUDoWbvLjc/FbJbU+
 ssJSNJgN8dK5N35j1i8cOPAcG6OsNML4YevELJXWEuaQNuEAdKvD09/Tk/ivJibu4zc0T7u8P4Q
 aYpg0nYrpKfSayE8wdfAW/6zpiBNW7yQ+vQ9rTqEvtZzgc2AkFOUltJzfmGQmqizOfaloIcW5iX
 FSWa6RTfOMZTe2vPbfxyFeJYeAW6BA==
X-Authority-Analysis: v=2.4 cv=FbM6BZ+6 c=1 sm=1 tr=0 ts=68fa02b4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=OLL_FvSJAAAA:8
 a=ywnRGdmwFc_i4B4SztQA:9 a=jdvOL2tdKL0A:10 a=UsU4ZBEK-5wA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=oIrB72frpwYPwTMnlWqB:22
X-Proofpoint-GUID: ZAgwc-57ZJE27NTcLN0QRA58HBR1HouI
X-Proofpoint-ORIG-GUID: ZAgwc-57ZJE27NTcLN0QRA58HBR1HouI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510210190

This patchset has 4 fixes and some enhancements to the Elite DSP driver
support.
Fixes includes 
	- setting correct flags for expected behaviour of appl_ptr
	- fix closing of copp instances
	- fix buffer alignment.
	- fix state checks before closing asm stream
Enhancements include:
	- adding q6asm_get_hw_pointer and ack callback support
	- simplify code via __free(kfree) mechanism.
	- use spinlock guards
	- few cleanups discovered during doing above 2.

There is another set of updates comming soon, which will add support
for early memory mapping and few more modules support in audioreach.

Changes since v1:
	- updated commit logs as suggested 
	- merged "[PATCH 00/12] ASoC: qcom: q6dsp: few cleanups"
	 https://www.spinics.net/lists/kernel/msg5884053.html series
into this series as its going to be merge conflict, and to ease
applying patches.
	- dropped patches that are applied, added tested-by on patches
	  tested.
	- rebased on next-20251023

Tested on RB3, RB5, X13s, T14s.

Srinivas Kandagatla (20):
  ASoC: qcom: q6apm-dai: set flags to reflect correct operation of
    appl_ptr
  ASoC: qcom: q6adm: the the copp device only during last instance
  ASoC: qcom: qdsp6: q6asm-dai: set 10 ms period and buffer alignment.
  ASoC: qcom: q6asm-dai: perform correct state check before closing
  ASoC: qcom: q6asm: handle the responses after closing
  ASoC: qcom: q6asm-dai: schedule all available frames to avoid dsp
    under-runs
  ASoC: qcom: q6asm: add q6asm_get_hw_pointer
  ASoC: qcom: q6asm-dai: use q6asm_get_hw_pointer
  ASoC: qcom: q6asm: set runtime correctly for each stream
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
 sound/soc/qcom/qdsp6/q6adm.c      | 179 ++++++++++-------------
 sound/soc/qcom/qdsp6/q6afe.c      |  49 ++-----
 sound/soc/qcom/qdsp6/q6apm-dai.c  |  25 +---
 sound/soc/qcom/qdsp6/q6apm.c      |  57 +++-----
 sound/soc/qcom/qdsp6/q6asm-dai.c  |  87 ++++++-----
 sound/soc/qcom/qdsp6/q6asm.c      | 203 ++++++++------------------
 sound/soc/qcom/qdsp6/q6asm.h      |   1 +
 sound/soc/qcom/qdsp6/q6prm.c      |  27 +---
 9 files changed, 302 insertions(+), 560 deletions(-)

-- 
2.51.0

