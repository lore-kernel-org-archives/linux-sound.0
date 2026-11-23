Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795454070;
	b=m/0lgz1MDHXRfSBT7dGxZIqNKILPF0GCQgpuu5tTJg4KILFKuQjGrA9auJAWL4UaZTUu
	 P3ib9PsjWgFz/8IIHhPD2I3Lf3MjTu0nScvrx9xZ8TFvcXz/Oy6VGQ/KtczUZJBNSunYl
	 La6xBOjndh+gBEMEK/tAiNjnjEZPArCILAzvZMVqkoGzCammReDiBHMZg00Kdb5smnWp1
	 o9Oy8T3PyQopMuFkzJ/ySZ+hNTpLKbGiARK1dqsr1yitgW84xC0uS5BkoT9sf+6Di/DjQ
	 trtt0ry3HEDlSPb29w8eN2ZbYGW6IfPwgEjrFdcKyTl0Ghx9OIRNfDNNmjiOvwjUCCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795454070;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=W4NOMokerScDRusCsIlTIiG7nXOABdwpnV2l/yhw260=;
	b=eJSoH6k0Mj7+2qiqgKUNG/8obl8B/NJ3tSZmEsZGC74FKawtB6a5TEzhxW61JVbqE8KR
	 2arUdV5rkvsnviyF/PWswl2sMZic7ZaZUQRuu9yOFyzIDrbQrQFIo0z6wOOzdv998akHI
	 1zH/oFvE/qvLT+QyQ8Pz/9gfNYPqb7JQsbAtExrYDvBPoThIKoVAvu8wBmPWz/Ly/9slE
	 1pxKNSbb0eDp+is7ovuRCtNBy1tZK6A6N21GAGekdVsZqXkDG+0VYh61Q4FMTdgfhBYP2
	 FAguyAnKpIYS2lPVe0uzjPFYtx+zeRgueA4zUL42PoRbpYsS8Bzo0mAkDwwkN1YoupA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kNtD7xRK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RUmta1yW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08090606A31F
	for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 17:14:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08090606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kNtD7xRK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RUmta1yW
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGr8H2769122
	for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 17:14:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=W4NOMokerScDRusCsIlTIiG7nXOABdwpnV2
	l/yhw260=; b=kNtD7xRKKfKPufQqHWGDlvpUdKfMbwYMs+CfxgvwQwrtsoN20jH
	YMniMJZlfbb2QXZ67Ulv7v11cOe/OB26lYk9meK78i08hqTC6ZDQZcejlAOMh8M7
	TWROgOrZmtEfUB7caaEgZ8ChtFRdtUTqiBjEhAMZmYQo/lzY4D8wUp0wRdgdkz7E
	xFg4hJjBTeXTi00A4AJtCpzF7uNyCVueIB76LQ5TLhyrlohpuhhghKifVap7Tkg0
	fxhVp8HWdBp302mvCxTf0CYJY9GSuqjcDavUMARGrBgBHaclFFGAyNo17CVguIn1
	2oe+hMPnz+J27ZlKi3/hYY+ddw43s/XB+9g==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1pagmw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 17:14:28 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-836c416b236so53309047b3.0
        for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 09:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795454067; x=1796058867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=W4NOMokerScDRusCsIlTIiG7nXOABdwpnV2l/yhw260=;
        b=RUmta1yWodRd96hJYYv2QoRLP5No4YuO3ZX+fX4ciNb8DKKQqWt+wal9AryXu0DfJR
         95A6Nr4QQod1cMERl5egpTI15YLGa0DiXrFPRJElZq9vqsqTwIFT4hk0E1oeztEzBDyf
         TY5BhoZYXsnz2vi/uzm8weJxyn/hA1G2+eedTqMI6b8u73kb9AcImFHlLvl0MR7qdjIk
         b0Ter+KwzQsVijx05+KzggJLpRgEJqk+6T6leF3A8dU6wzGZ1pVE+tqzPXgIgBlbRHqt
         8gVy804Mp0IGtILodT34PqfOUvWVPAdB0hEBZtP4E8uh9R1BPZoU2jnEUMI9M2AiS5Kk
         cjVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795454067; x=1796058867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W4NOMokerScDRusCsIlTIiG7nXOABdwpnV2l/yhw260=;
        b=obuRX54pM21rd2DzVTU7h0RlzcOBgaVOC/BiggruHfYcTtjV3TqHcYEGbDJCvVnR34
         1Fv2Rr8cKtmTP+COXMe5HhbMETtiWVeKqV7MFHdDkE16O2IfuRNI1sJZ3fFiR0Gp6/mC
         GcfmEjS/dZDDBHas25MG//7j0GuYRWsHSXar6a6Ij94Z4jymKwLqFGve3CsRsPC/HQGp
         YBWsz0JMe/93voboyFvYYyarRlGYEC5pSciPE+PXhGJYkMHtMmTVS05pjMRD+qeHZL6z
         cUzikzjmtnRdS+Ny1yy72YIy39oyYm+QfLaFjHtJUqG9PHhHwtWgET3Zr0u8jTI40NMe
         Okmw==
X-Forwarded-Encrypted: i=1; AL+hErEPdYdVeIiaJm6Uls8SRvg4iqwBXJqOQzzspFEsv7kUbJz0VgFRGuKhabr4cZleLa9lxCWdlAMRML0kyg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9M6gopYs2WowxpwE3JbSJeKqZ+TLnYU/iqxnK3CXV9C9PXZt0b
	WnN2KlMZe0YjmBvAbBrOTPj2mbE3NEzPqxrrWqlO5Kz4I5fLaWVZdfOWDH65/fT7HwmoYz8H9tg
	JaRlTmzVN7O+cVokMteEW+upwYKEWmitzBMNWcaVrcEdfW+a2deHNiSf1P5zlqp9EYg==
X-Gm-Gg: AZFdTZcIwQj6IYabQQ2t65X0hL5/Qlax2Gv7YW2AM87frObVzkUBf6owe5cuBjWiipt
	k0j4gjFycXbQHYzuyF3MwmtFdFmG6osl2nr2/j8Ap43iIq/ASF0eT77aXNyH5S+q2PXTWqfYfJU
	nTZ7oWtGRY4hmYZL1UJ3sMl4JZAk2m9gwdVnfpkdi5B8GMr+9AFy3puOLNos9ngkb8iPmqvooz8
	8wEPjjAxDIiMJEb4EiXehib45TNqinbb0ADELyPhjVDqf6yZwTvQjddFduy8hNI617PXRAcq2Bq
	Zb9znOfkBFmk7UHYbNboNAE4IZHXsDbUg0LvvfRWG6ul2/QSzYBbBSmFLiGmdW3Y0cajBF9fFgS
	ou2fh1KV3gQDjS2HegAdGukCgE1NyN98bB3i9r2Kv2KGy5O/IW7vMco1XnSzkSBRf
X-Received: by 2002:a05:690e:150a:b0:679:b5ef:a0e9 with SMTP id 956f58d0204a3-67df44b7711mr3150738d50.137.1795454067129;
        Mon, 23 Nov 2026 09:14:27 -0800 (PST)
X-Received: by 2002:a05:690e:150a:b0:679:b5ef:a0e9 with SMTP id 956f58d0204a3-67df44b7711mr3150728d50.137.1795454066646;
        Mon, 23 Nov 2026 09:14:26 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa397asm23885443f8f.48.2026.11.23.09.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:14:25 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>, quic_srivasam@quicinc.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 0/3] soundwire: qcom: add multi-master support
Date: Mon, 23 Nov 2026 17:14:08 +0000
Message-ID: <20261123171411.444381-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2OCBTYWx0ZWRfX/qdBaJ3FV8v/
 KjlJo10UfMSG8aWrmcb8IvSX3r8HsDqeFF/dpb8YvnoRZES1WRSk1vBvrujrJ46fXzuDVh2cOKO
 3PsFB8iKNNmK91+sN80LYK/pCsfS905MVVUKvZEe9hV1IsEYI6Y5HDPaNFqv3Tf/5+vXYzh6Tcb
 go9G+i8GAV+waBsD5fgHY7ygVShXlcA+R13MO72dA590zyImaCSB1wYWqSx3e16YQjhgYVgRqzE
 xpiLk87INHfkbjPVoff8XUqBdRvbA1X0EWG2Mu/oX8zVziwuaN0hcXgRA8vobzjkN1deNo2REZU
 hV5z0sXaOdeL4d8lxSAIx8MTNZyVvz6UEg7NvzgoknTPACbaNpyv7WlWtl7BFOvHPFN6dDoYI17
 O8Lq2QIBnuV4XVfuWCFETdzEL2Frj+4GrupvYmLoK8eqhAWuP7krcOHXdL8dx1EPfLv/tr5+IM+
 M7vByj4M8X5eD2k/HPQ==
X-Authority-Analysis: v=2.4 cv=AeIkjHXG c=1 sm=1 tr=0 ts=6b047474 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=owqDj3WxTxIMLBZ9Q5AA:9 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-GUID: cq2fkVaYNLhE-wYHwtLBdNXelpFVo2yO
X-Proofpoint-ORIG-GUID: cq2fkVaYNLhE-wYHwtLBdNXelpFVo2yO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2OCBTYWx0ZWRfXzO0n5cC9UsqB
 b4FtPqT1KsvtJ58joUhIIyE5OUNgDFolPYwyaZwu8NDp9c/5bt/V8+yeMnZlKRFDPuoSfJU2l4f
 aTkqbmL7oHcFrPeJB+hBzSY8Kb/p2vY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230068

This patch series adds support to the multi-master in existing soundwire
controller driver.

On Qualcomm Glymur SoC, both TX and RX soundwire controllers are wired
up in multi master mode connecting to an SDCA compliant Tambora codec.

One of the two controllers (tx,rx) act as primary controller in this
instance its tx which provides clock and control and some data lines and
other controller instance in this case rx act as dependent controller
providing extra data lanes to primary controller. This is called multi
master mode in Qualcomm Soundwire controller.

Multi Master mode allows synchronous transport across two independent
soundwire masters. This includes synchronized clock-stop, clock-resume,
clock scaling and bank switch between both masters, the Primary master
will ensure that.

From the slave's point of view there is still one SoundWire bus with
one clock and one control lane; the extra DATA lanes just come from
a different pad on the SoC.

Currently the bindings are added in a way that its possible to add more
than one dependent, however to keep things simple the driver only
supports single dependent for now. The primary rejects a second claim
with -EBUSY if the dependent is already paired, so any future misconfig
is caught at probe time rather than silently cross-wiring.

Topology (2+2 lane example):

     Primary IP                          Dependent IP
     +-----------------+                 +-----------------+
     |  MM_SYNC  <=====+=================+=====>  MM_SYNC  |
     |                 |                 |                 |
     |  SWR_CLK  ---+  |                 |                 |
     |  CTRL     ---+  |                 |                 |
     |  DATA0    ---+  |                 |  DATA0  ---+    |
     |  DATA1    ---+  |                 |  DATA1  ---+    |
     +--------------|--+                 +------------|----+
                    |                                 |
                    v                                 v
        +-----------+-----------+           +---------+---------+
        |  SWR_CLK, CTRL,       |           |  bus DATA2,       |
        |  bus DATA0, DATA1     |           |      DATA3        |
        +-----------+-----------+           +---------+---------+
                    |                                 |
                    +----------------+----------------+
                                     |
                                     v
                              +--------------+
                              |    Slave     |
                              +--------------+

Patch 1 adds two new DT properties qcom,multi-master-mode and
qcom,multi-master-peer for describing the pair.

Patch 2 wires up the primary and dependent roles in the driver.

Patch 3 programs SWRM_V3_MM_SYNC_CONFIG on both sides so their frame
generators lock to a single SWR_CLK.

Tested on Glymur (SC8480XP) CRD with WCD9378 in compute mode. HPH
playback and mic capture both work.

Two further patches (broadcast fan-out and SSP-period programming) will
follow as a separate series once this core lands.

Changes since v2:
 - Collapse is_primary/is_dependent to enum qcom_swrm_mm_role
   {NONE, PRIMARY, DEPENDENT} [Pierre, Vinod]
 - Reject a second multi-master pairing at probe with -EBUSY
   (primary already paired or dependent already claimed) [Vinod]
 - Gate the dependent hclk through its own runtime PM and keep it
   active via DL_FLAG_RPM_ACTIVE on the device link; fixes the
   stranded-hclk leak and the double clk_disable on teardown
   [Sashiko]
 - Hold device_lock() across the peer drvdata read to close the
   UAF window against a concurrent sysfs unbind [Sashiko]
 - WARN_ON_ONCE() on peer_dpn_offset underflow in
   qcom_swrm_port_target() [Sashiko]
 - Commit log for 2/3 now explains the lane -> port mapping and
   how the dependent is driven via runtime PM [Pierre]
 - Rebased on next-20261120

v2: https://lore.kernel.org/all/20261001093806.634862-1-srinivas.kandagatla@oss.qualcomm.com
v1: https://lore.kernel.org/all/cover.1789114385.git.srinivas.kandagatla@oss.qualcomm.com

Srinivas Kandagatla (3):
  dt-bindings: soundwire: qcom: describe multi-master
  soundwire: qcom: add multi-master support
  soundwire: qcom: program MM_SYNC for multi-master

 .../bindings/soundwire/qcom,soundwire.yaml    | 109 +++++-
 drivers/soundwire/qcom.c                      | 337 +++++++++++++++++-
 2 files changed, 418 insertions(+), 28 deletions(-)


base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
-- 
2.53.0

