Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F7137C92D
	for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 06:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789021253; cv=none; b=BD/2jRircXkPpoAOl4S21nO1ZZuGJXsSXiC/iy+YotujfFnhQkH87zouKvO1CA6jFUH/hnZLEeMYO0qv4O7dB3LDlJlnhMcVF0TpUs+S1mZX9U5USV+KyHSAuEBjBkiSHAKtScMAxTzPtnMEhu3agKkgbouxMnnGcuwADBJwwaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789021253; c=relaxed/simple;
	bh=Nzli8Pi5yo58CtlDylHzM+Mem6Z2JfVTDgKp9rmb7FE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uaJNZ5JGpVTJE2qiuOohh4YboIVEkLEvRAwdUoXr8wY3Oqx4yXSIDXPWkU315C3JwxajlbHfaB/xCb+uzsTINqq8f2zExq/hGxEXB6TVuXdnexe3weOcQW4GFukVBPTNx/RE29rrhrWUwL78FYOrBQAwO9yMe0hrxzrSfYjssIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o6bSDLPb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CgIErZ5Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o6bSDLPb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CgIErZ5Y"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A5GSQo3487379
	for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 06:20:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=IMgojOZAp1zHy28WUhd6qU
	yHHwf/BwfPPmDHrlPp4uY=; b=o6bSDLPbstbhjTLbpRSYAZtCstYY8ksoC+Ux2S
	aIiir4/p+vqTjx9Y1OobJIb0T4qR3eACjSGyIn9KcfePN9jJyJcvs3aGVkM9N/Ai
	4SpkrI8bFznR9XiRvXxYRDZ/gwlhxilj5733W7lI4ni/SU5a1mRYc6dgHNb0Kx2Y
	cGDrkksXkhHwlZDmt6nq1cX+8A0RcP2nyLWiN7tXOBHf2gocgdHONFzggY50m2La
	1ewB1nM8dgWmo7rKUsmWTpR5CynZ9GNSdsntzV4jcuuTtgwEJBNZxr0nkVL/k+Qy
	YQ/fEAo17DWyMXBE7fFE9Gix66AbdBrald12laHV4LEvqfuw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyejbhf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 06:20:47 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398fe469aa0so11253381a91.2
        for <linux-sound@vger.kernel.org>; Wed, 09 Sep 2026 23:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789021247; x=1789626047; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IMgojOZAp1zHy28WUhd6qUyHHwf/BwfPPmDHrlPp4uY=;
        b=CgIErZ5Yk33zUNC45Q++0bJi0BDHDUJTzcAglrCzFCJqJds2HgjA9ZwryBzKZ5GT7H
         U+1o7PhcLrGKHL4m87QHQwpc25Bw6/GMo7o02MhbNPrBLgw1SRF0h1ca4WdpAz19/PNS
         cCkJsr0Kpjeiw/a4ITtVGbguCIGAx26jq3OINAcWJC+jDbONWG6rZr8HxxR2slSy0sCK
         Fiql9C7GpsTz5EKW8xFqNDXzh8r6E+BwCrIxAODtg817TDA7eBLdzVuD/F43anD8Ex/8
         aAWeRKoyt8ZmUmNIKjLIJ6fSaYZnbi0Gh+mNDVNGBcQ0RWM28fMCK39wdavFjQC4nFc1
         zyOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789021247; x=1789626047;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IMgojOZAp1zHy28WUhd6qUyHHwf/BwfPPmDHrlPp4uY=;
        b=sBdo4rEO/HLRjiaUv8GACat0G3cBiI751l0osrORB8+z7KHo0ntplQuwoA9uap/JVS
         SE+mLZaP5lpg8eoKR51UlSiSTSGBOYTZ/axh1InWBtJyVkJI0Nvj7P1EXBWkaKEQCvy9
         ure2jr8Y0Oh0wSPuLhHgIjzbtrAQhe0Lxdj5o6obdm1lNvjvYRIyF8ijc3pj9oD089Dz
         /jjFKlF+aiHI2QcZa5QElgZtpvdxGE2y0N/XDFontzfWt/yc2N28Nr/BwqfbJ57AncWD
         eMwTrAFyahliy7LXsqUAYDqnT1QAIeuPx6fzYtAo9PDXPmBOx98/wj8yiRA5ePtMm+GQ
         kXVA==
X-Forwarded-Encrypted: i=1; AKwUvBz3HHuXNhu/O90awfM4A4BFQYkZ9AT4qDL9WBuk20Ve9yZLojmFO+HHt7Z+JvSCgs2kZw1AVyU8zLynww==@vger.kernel.org
X-Gm-Message-State: AFuF++mDxJozFTV1wh+XLJAahlfkDKsm9UTyJREyAqqt1+jPXlYLQebV
	o3643cXeH2CQODoKFGQo8iXlFQIsPx3Upx7x2DKp9JCtD+k2qQKQyrY7u5DYJRTvrHv+wnYLg0U
	YWHjXRJp304frYqdQP3x7jcngTmmOEaSZgYyZQu0Q1S7gIxzDtCprsC1Y3tunV7x6HQ==
X-Gm-Gg: AYBFou3oUUaub+Qj6JT6798MlkMAEqmIwh+Y9twpQ7rA9ls9na1Lqa97NYX9vjN7ENK
	O1cxh8ZeOIayGrX6hdewjIwv+RaEioxxtT/12TGBynAItDqspJTQV5CIHRZQmuA3qyq1/P+K8r/
	FZHpYcYJSUJT7RmJJBiTJLr1wynbvKvc2QYEcRWMehzYo0FUhbE9iezM++kXQISZeYo0hn69hBI
	I0d+TGFrj31hjEdfNWKk/zGx2h2hznonPN51B1bFi0rNhMlyhThKhhwoHblieqBeKKFslQiETOn
	mdVEJwnT7LpJzcOGls74WyEbyiP++N6G0aOKUyk22SvmBvHBeJa/elaz5Ehdf7NqT7fGDAFBMRy
	ZrXcBfeZavXie8v6r99L5z8V+StG37Yc8gB03
X-Received: by 2002:a17:90a:d403:b0:39b:61f1:8032 with SMTP id 98e67ed59e1d1-39d70ae19f2mr8651311a91.16.1789021246934;
        Wed, 09 Sep 2026 23:20:46 -0700 (PDT)
X-Received: by 2002:a17:90a:d403:b0:39b:61f1:8032 with SMTP id 98e67ed59e1d1-39d70ae19f2mr8651247a91.16.1789021246424;
        Wed, 09 Sep 2026 23:20:46 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339befe870sm54709946eec.30.2026.09.09.23.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 23:20:45 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Subject: [PATCH v2 0/2] soundwire: qcom: Add Shikra soundwire support
Date: Thu, 10 Sep 2026 11:50:13 +0530
Message-Id: <20260910-shikra_soundwire_support-v2-0-f98c9a6ea1e1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB1MomoC/yWNyw6CMBREf8V0bZuWN678D0NIpcVesRR7ATWEf
 7fAZpKTzMxZCGoPGsnltBCvZ0BwfYDofCKNkf1DU1CBScSjjJeCUzTQeVmjm3r1Aa9rnIbB+ZG
 WmVKFiHmRJ5KE+eB1C9/9+lYdjNP9qZtx+9saBnB0/re7Z7H1Dk3GC5GncZKyWIgiIBXUOiOtl
 Yp52QJDI6G7OkT2nuSrcdayEKRa1/UPnv6pf9IAAAA=
X-Change-ID: 20260910-shikra_soundwire_support-96dd8130874a
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Rao Mandadapu <quic_srivasam@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789021241; l=2468;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=Nzli8Pi5yo58CtlDylHzM+Mem6Z2JfVTDgKp9rmb7FE=;
 b=7Undh+yiyBlfrOJb5bqA53EWwjeC+ABvwYoSnbmVCMS4O0H+c3bqDNgVIKEIW9WxW57M1uVbM
 4Fc1YroyuqJBw9ZCdLKN7gBh7zOImaVvnDJZ2QbxDHSIx1I2V5ba0p/
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA2NCBTYWx0ZWRfX3QM0tzVWF4op
 qd6xJajhy+czhAJ5rMSqvPE+wcZeWC6oacQ/lxudivMe4oCUlq7sTMLUuqA6w+bbo5+O6o2xfFY
 Fp8KwofbhxycgVgAE/IZDDzTzpmlDHI=
X-Proofpoint-GUID: diKqrjvyeRI3vO4xzHPtL6tmfTavwNvm
X-Proofpoint-ORIG-GUID: diKqrjvyeRI3vO4xzHPtL6tmfTavwNvm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA2NCBTYWx0ZWRfXwkYkVxGreZ4+
 KHWnfOp0Wz5Fzr3DjkatEAueLnUYxXXHApL4fZZBo6/oL6A4uoE+mBPQhNNoS0+PAUN2VtiGRW+
 JDrVZ/oYihpwtePwTTSnJwZsnwCgXVglV1UUrdfzd673niLRV9botbfImr6USai1zd30TAp4pc8
 p32bwj9iQ3YKfo/6KYPoCboHvlSWdkioMN+Ieqnm9BFwr4FTDMEkmLPZB/Dr+UKnu8nImpm8Ltr
 GdauQw/q86WQXt1bvuxW4rXeCVYld0wAzsJ+TeJvmYPkgrbKYupT491I/+JB6/Ij+mrnBDOHHK5
 RNEadoj7qeeyxxCfQkjzBbM+mfM4XkPLtxPUnrvIUd3msAuuw60mRPO3fo006MbjauiuB0mgLKf
 IT70Ub40daOvw8ts/MCPOQb1d2vZBzOo69gnXyscGQ5Dhb07/+KgdWqT3iautHiMQw4Sb8oegLn
 A3wFIN1B0xyDmc1K2OQ==
X-Authority-Analysis: v=2.4 cv=Go/XaU1C c=1 sm=1 tr=0 ts=6aa24c3f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=QyXUC8HyAAAA:8 a=Q10Gi985DRLpIu94YWsA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=FO4_E8m0qiDe52t0p3_H:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100064

This series adds support for the Shikra SoundWire controller.

Unlike existing Qualcomm platforms, Shikra assigns the SoundWire master
controller to EE0 instead of EE1. On SoundWire v2.0 and later hardware,
FIFO, and status registers are banked per Execution Environment (EE),
making the register layout dependent on the EE assignment.

To support this difference, the series introduces a dedicated
qcom,shikra-soundwire compatible and updates the driver to select
the appropriate register layout based on SoC match data. Existing
Soc's continue to use the default EE1 configuration without any
functional changes.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
Changes in v2:
- Drop qcom,swr-master-ee-val DT property; the EE assignment is a
  fixed SoC integration detail, not a board-level property. Encode
  it in qcom_swrm_data match data instead and introduce a dedicated
  qcom,shikra-soundwire compatible to select EE0 at probe time.
- Remove the dt-bindings patch for qcom,swr-master-ee-val (no longer needed).
- Apply EE stride offset to SWRM_V2_0_CLK_CTRL in qcom_swrm_init()
  and swrm_runtime_resume() for correctness on EE0.
- Remove the mmio guard from the INTERRUPT_CPU_EN write; always enable
  CPU IRQs for the selected EE window.
- Link to v1: https://patch.msgid.link/20260608175345.3118060-1-mohammad.rafi.shaik@oss.qualcomm.com

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>
To: Rao Mandadapu <quic_srivasam@quicinc.com>
To: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-sound@vger.kernel.org

---
Mohammad Rafi Shaik (2):
      dt-bindings: soundwire: qcom: add qcom,shikra-soundwire compatible
      soundwire: qcom: add EE-aware register layout for Shikra

 .../bindings/soundwire/qcom,soundwire.yaml         |  1 +
 drivers/soundwire/qcom.c                           | 85 ++++++++++++++++++----
 2 files changed, 72 insertions(+), 14 deletions(-)
---
base-commit: c68a982815dcce5464e3bf2a31ac94f5146c04ca
change-id: 20260910-shikra_soundwire_support-96dd8130874a

Best regards,
--  
Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

