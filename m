Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F33F36EAB0
	for <linux-sound@vger.kernel.org>; Tue,  9 Jun 2026 06:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780987256; cv=none; b=sN15/GT65zFqYz+fOy/0LzDzX9v39D9qHK7bbvrEYfReIg5QXvalmi9slLEKP7tDS+UAja715TCInCmIsx1Ofmvveui5gK3DhdNrMx3q6trCKVorpWF4apncu4iEN4ayjA+JQ3kYeo3rIL2I5F+CUJdWVF8xK1beIT0NGkT2+aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780987256; c=relaxed/simple;
	bh=jS6vuumUGsy5DRLQvCZuWVIjD9dQD9f0kBeu9DzftvI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=umph0yzjPkVP+yT9zjipKhO/+kujbYUKVOpnccHRhTWXEiZ8feRzEAR8vxXimHQmRKKbugx1QjWboXKBPmtwVrs3AXdOtMYmPFz0vsQB2j3qIaT86PBToPoi8wW2yW6+WdMN5tX6plx21Z3Q1ePvCBIJSaySoAunrhCgcgle970=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IY0RL+0s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dsvyjlk+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IY0RL+0s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dsvyjlk+"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6593waie1060937
	for <linux-sound@vger.kernel.org>; Tue, 9 Jun 2026 06:40:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=oMEUFLD08DrEmn371mkAKLKBf7jIb4Wko31
	92m3taNU=; b=IY0RL+0sHKiESf/npKrdTTzqch9nkX8CBNj1eKDLIjkOzBQqrEu
	ozc+wAKpMwSGFIRtbPLo8zj8OTTNU2zhZCSchDGDsEI9actbihmOb3MYTdVnHw5y
	OcB4dff24J1oGBJqmqcF3IBb954tfHvg80aX9mjVpsQZCknxTdDbq8tDrF/c8zAs
	vdS/iL9qzJ3Kz92MwsV2p3uMECIGO4Ukly6UAvMzV0KDtaBhEh9BKq3x8oYhIbbw
	RJWLPW0YHq9nmQn7FAIZ0Of666/tGk3kX3Sdm0fM4dWYzBo/WhHW8abwfvLITNPd
	85JAZAn+HembjU/DglGuhZ8tBQLXK0YBNWA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enun44udj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 09 Jun 2026 06:40:54 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36bd4146cb2so6082315a91.1
        for <linux-sound@vger.kernel.org>; Mon, 08 Jun 2026 23:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780987254; x=1781592054; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oMEUFLD08DrEmn371mkAKLKBf7jIb4Wko3192m3taNU=;
        b=Dsvyjlk+nQmxeDfv5i9s52ek9GcNZ70uSYSrPli1BJRoEr8WRfKvzGb9lxZ18RlWzG
         vWpif5WJvQeFibNiy9tE8bcCXTP0/LP5b/2fYzzJ/kyXDY/jxsR8J7q2IvTD04NZeaLO
         1RinnUb/eMj67gjEKqMAO+E44ZYOdRL4jaeRUlumXQtiZOWTs+NEg35JFez4EjbWPtG5
         GKSfiw6MHKPCPGOy4rhnBQt4XncJY7zgKCBAGMfnJLGjvs2Ugt6ji8rNtqxVFPINacJI
         XlHN3hKNDn59Nq3bhIZ0BAQ0WiLn622wl9kCKHodqc5MK9a7IAYgJ0p/pMNIIiGWKcEu
         jZbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780987254; x=1781592054;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oMEUFLD08DrEmn371mkAKLKBf7jIb4Wko3192m3taNU=;
        b=Hbd0DvsGJMLdsZu6z8Gonhmb3p02tKaJ9/QTd93pmv7mt89EJLnGhdZORKq0D6rZ1g
         +PUFyJowhkgb+0sEMCGTzHmiP5C39EmUNEfbBxH+EFDLlQWADNRnClwpZm30rvo3D0nk
         aExDjEaoxrP3JrfwSF3JkOl2IunPRA1/INXa79oLqvUbxD1uJ8AC+Eb+9mY4qAjFRHLv
         va6XVycjwonv0atbHAjy5GyDQ5v42b7pYvLgzudhFRUQkk1x0ASAHrRJzx2KPz85xGqt
         WbjiTyNwtpiOXVu2msLEhpL/g/CrogRyP2oYcie26FGRX4IEfheJALE2Hg3TH+9jtI3Z
         ajog==
X-Gm-Message-State: AOJu0YyrWETI/4/dXxRuauBA2emfowp6lkt4j56TtMiMk0uHeNs6G/+B
	MzBj/3rpJK3zMBfFunwuy1Xz+XjJC6v5/cKj9kGeAZoIWCM/P3sGWDLwGhjq02jy+yj3OMQe1ij
	+A5w9NMo3ASAKRzQgUnROtWJkh3yiO+Isqx/e5W6hlLXwmrpWHKPZevNy2cuK+BL1Qg==
X-Gm-Gg: Acq92OGFCfQlEloaWjKUHzEOpp9uNZdZ3kcCfJnt//qDmKWVZ7krZKGxzkj7mce0aYQ
	4ySnML5Tw/KcLrGsWpKl4zhWPr1VJbjjK8CFjCerjUSNyFzg6t2Yx0XUkoIlxdiWaLomoLkiMw2
	MCw8oYejgmsaSlJsm2DDUzH8j9A+6pxIjvP8PBGjarsa4mwL3T4R5CQhAYJaKnSj9090sA+8FKN
	/Ny1mjXid6xXjS2FbqSJyg9ajlRYNyW6XzhlxiIksAk7re1fatd1XlXOgxyDN7hI1LbtH5VpVHD
	lDmPg5xg/f1srNnpzmFh0xq3vKO1UzOFljuCsElipVnBAppuN+dJEoznCLeA8658rbr67wj+KqC
	5gUxlcE8vLuN7dTmYqkKhQAFXb8CtcRUu1GwzZQhJ9zypZazcTT9GCpaEwZDy
X-Received: by 2002:a17:90b:4fc6:b0:36a:8254:8eb1 with SMTP id 98e67ed59e1d1-3713113c245mr14020208a91.6.1780987253842;
        Mon, 08 Jun 2026 23:40:53 -0700 (PDT)
X-Received: by 2002:a17:90b:4fc6:b0:36a:8254:8eb1 with SMTP id 98e67ed59e1d1-3713113c245mr14020181a91.6.1780987253397;
        Mon, 08 Jun 2026 23:40:53 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6c668f9bsm17898953a91.7.2026.06.08.23.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 23:40:53 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com
Subject: [PATCH v1 0/3] ASoC: qcom: add q6apm VMID support and qdsp6 GPR destination-domain routing
Date: Tue,  9 Jun 2026 12:10:35 +0530
Message-Id: <20260609064038.492641-1-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA2MCBTYWx0ZWRfX1alYhQkrtE5v
 WYcP4d84HET8SKKovl/xOSDONDvcEgJYpmOM5uGzlmJBVwOqFD8IU/R/Q3ECEVfhcojVHzC8ceB
 oalTxodvTo97n7T6uCdjrdPqccQSwdhZyafkDdTa0DaaLBNmwKFSjuVWAnNcwvP0/gGTKkVxD9Q
 VhGFIRDCMOsbxI4i8/MVL/JPSMJVt7L51+1LOm5D2pEEKi2NR2GAGBY7CY1Xd2oT9wah8ybn0A5
 pkDhQBv+K3T/2g2tmm0a8cWX51AVK3LhwbMJG9nK7a6vrQP2XymZghfgXyrA/coL7WL28UVpmEw
 riG+6ptK6drkE74DXZQeQVxEP+iL3K8s6FaAHWdJB3BrZ+NLnSRXrp6VHc+XlwLkqsuQAfNGWsI
 A5KztpyhmAYYboPXOf2vMqa1oOVTaXU3Tue+irvFqEcqVbcYcjYl/D17sjNhcIKJaNB3Gjiq4js
 9Egt6BIqjgXLjwZuu6g==
X-Proofpoint-ORIG-GUID: rTKHZ3Q7ZYbKXSE7k0ssOBXvcH-0YlCm
X-Authority-Analysis: v=2.4 cv=ZY4t8MVA c=1 sm=1 tr=0 ts=6a27b576 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=g18NhSc54fSbZ7kgshMA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: rTKHZ3Q7ZYbKXSE7k0ssOBXvcH-0YlCm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_01,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090060

This series adds two related pieces for Qualcomm audio paths that are not
always ADSP-targeted.

1. Add optional qcom,vmid support in q6apm-dai so fixed PCM DMA buffers can
   be shared with secure/non-HLOS VMIDs via SCM assignment when required.
2. Generalize qdsp6 AudioReach/APM/PRM packet destination-domain routing so
   packet allocation follows the active GPR device domain instead of assuming
   ADSP, while preserving ADSP fallback for legacy/default paths.

This is needed for platforms such as Shikra where audio may execute on mDSP
and buffer ownership must be explicitly shared across VMIDs.

Ajay Kumar Nandam (3):
  dt-bindings: sound: qcom,q6apm-dai: add optional qcom,vmid
  ASoC: qcom: q6apm-dai: add VMID-based SCM assignment
  ASoC: qcom: qdsp6: generalize GPR service domain

 .../bindings/sound/qcom,q6apm-dai.yaml        |  10 +
 sound/soc/qcom/Kconfig                        |   1 +
 sound/soc/qcom/qdsp6/audioreach.c             | 112 ++++++++---
 sound/soc/qcom/qdsp6/audioreach.h             |  23 ++-
 sound/soc/qcom/qdsp6/q6apm-dai.c              | 178 +++++++++++++++++-
 sound/soc/qcom/qdsp6/q6apm.c                  |  48 +++--
 sound/soc/qcom/qdsp6/q6prm.c                  |  19 +-
 7 files changed, 318 insertions(+), 73 deletions(-)

-- 
2.34.1
