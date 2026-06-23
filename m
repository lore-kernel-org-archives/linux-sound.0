Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C972D7D59
	for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 07:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782199048; cv=none; b=kZxW634K3awxaBwTdi8Xu6+5h2YSono5d4t2g+h99Dds+HAYn0ymVeIcH+racpGlOQF2o2veNv8RnxGvjryHtQIc9bYQC72tosOxpr58W/qAj1yus42UnhF8S//iqkoC2ltzocrHASTM2ngNAJoAv5wZ2YgscyLQaqZVWan+HGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782199048; c=relaxed/simple;
	bh=vo6xveCTcHb9cNQ3BQYzxEVs0uKejx18eF6seucc+ZA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TafntQtDKOJ5QUQoRpp7uT3YSoUCY5VY4WE9LE3Y3X98E6h8EWAF7QkaXFo2pdCfW0gdEhvVWzq0F4OSv+UY3K8eVSgG9kWESQZHeVCH5+Uu6bfu9Ql+DbQhwFZbgjYjUha49sBTVI8Eb21E6oNEjss1UggTRhxevJ83XltB3oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZTNcwfpI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hkxuacW0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZTNcwfpI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hkxuacW0"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N6cl4E1628501
	for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 07:17:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ynd4Gsd0vHW+L4qHWQX6NdSF+NnKMDjMbo9
	jekdVq8k=; b=ZTNcwfpIRuaW1MEGUBdiLxGgbePTz2l/JmE5kXRvSRePdcnLz10
	iZ5atQ9N6ZzXbJKxFVKOyStstH59XspN4/Spfx6vGFyh5goKVTjaAx9/SNvDu2Uz
	or5oqVKkvwScKCyxMFYl+rc9D02R2O0zFs+0woNOcOEsvOsJ9sq4PXZ/1KGrrmHS
	+wsvE+MTxZ1dEE9SOK/M9rAaZuRCq/e0hlEW/vz+pbQEHlvlLh1jXjy4y+/ecm2F
	e/yaM8xD9qGGP8hjAgFesCA3Ihm5iPFET2ifRkkebBiCmuQ3CBePACC2yNySARzq
	3XZeqZ/Bvl3rEJsY8x14TS/aXmbZsobHenw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey2yhv3r7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 07:17:26 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c7645ac9b1so26705615ad.3
        for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 00:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782199045; x=1782803845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ynd4Gsd0vHW+L4qHWQX6NdSF+NnKMDjMbo9jekdVq8k=;
        b=hkxuacW01BTMpRREkrigskjhaEW1KQUKgnaPwFTHf0/FzfmXQsIm2+cp8KauPOQnC8
         kpv0y7I3HeIusa0eO647u7sKkHxWW3A7CoaPB9ZOXXOf3x9UoFIGlvCE3s67OogWcKwV
         rDt+feOExBCp9gb4FuG1X7XbkfWqITVVBzQJXBbhrxQDejNDX3SLfzNWfZpjV5AaVv+h
         E8QT3r3pHa3DJnfqXCFUHAL+6JmPPV7ffm1FxpUnvTMjhli6jnvlJ88+sWlzcbaScqXR
         9Sjg4b8npYPc8WrNDrVQaKeJVpM7WWqGnM7lC8uKutVGKCdts0irXDerRNSVipCYpM/z
         Qp3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782199045; x=1782803845;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ynd4Gsd0vHW+L4qHWQX6NdSF+NnKMDjMbo9jekdVq8k=;
        b=lZu69bsYurmcEpR5jsJ5NWEH72sR/bi0m73fR6YiKYCUjfkTNiqSD/tW5iUz58F3p4
         jhPRtgDAlAdA+OycJp/xSg3qc1KCm/lx1hSUu5IXTzW3EEOXfeZGpdFCYI/Xmv7kpHWZ
         i2G7kUJ6eg6pSrPL6eiUr65vP5QEF7yQBenk6W6JlDwbl8KA1idksr49eVo+cGui7bA/
         W72WKHEhMSg3OUsMCjHKPeuJ7nPsZnZSUt/Ev7Sy+FSDnqu3rXJUahy5bCMKYSgB9xKl
         IgwycBiHSBpnS6zve3aCzRgVU4r6nX5s6M3VH188xeoPudbG/KueokxpRuu8FChc5D8/
         75JQ==
X-Gm-Message-State: AOJu0YxlgNavYnhLpFULXPjfqw0mucAS50E3q6/h5OI5Bw5/oBN4fiFx
	0KMhVucZhBTlgNxJApZJz08kbbPxIOUgOd30IWrmQQlliw7g5V9idjptiG7FwxPV6dv5GLXAbyV
	l9vkZZtUYOSimDg3jUuIPm1aLFXsoKwEkCEGpb/CO9y9Rvo40AMSBHcdGwSJAH+/wJg==
X-Gm-Gg: AfdE7cm99nRpI4yBCBx/11f+KBBRrZw5k9kmORq2jbWtE6tbjuAo0eD5HJ3O3sgTllJ
	pDu+xKGBT3dvGY6xH0nDJZwhrY+ctJoqzmjP/KprOwGhZ+QMkIsdI2ELKj2IRu7eak+0ErqRyKe
	0ocklJY5cW/JRAowWcDzhoEPYl0KAdd6DkUFgBsONxwlxQo+U2thdJ2/hXH6TwgX1hP+po9iNeL
	HK2fKApnNcOHpkc+ER2Emesc9ASzBOXKun3nwKWM6MBNrLcNv5yXta1RBP7fElEnHw+a33M2ZYD
	YJdvMSrxPg2NHwENc2IDGM2Lu3heyzIYNrxfoZxDVmTYQWnjmiVSVzGprGySBjLHSKZmUqyVWzE
	/stmI+56NFtnVIwCsK+iT9idCpteSXEtiyLMV8GU=
X-Received: by 2002:a17:902:e88b:b0:2c6:ab74:985e with SMTP id d9443c01a7336-2c7c76e9d8fmr20432585ad.25.1782199045473;
        Tue, 23 Jun 2026 00:17:25 -0700 (PDT)
X-Received: by 2002:a17:902:e88b:b0:2c6:ab74:985e with SMTP id d9443c01a7336-2c7c76e9d8fmr20432125ad.25.1782199044927;
        Tue, 23 Jun 2026 00:17:24 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7437002aesm99673535ad.37.2026.06.23.00.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 00:17:24 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        srini@kernel.org
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/3] ASoC: qcom: lpass: Switch VA/WSA macros to PM clock framework
Date: Tue, 23 Jun 2026 12:47:05 +0530
Message-Id: <20260623071708.2822269-1-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA1NiBTYWx0ZWRfXwkDnGw7Qt/R3
 l+kjTpA3yc8EnAdRNm6rlN4fdU6j5kfsgO0KZyA0qQBM2NSZ0IAuT4QZZb83M0ZtAGwXDKJxI/q
 502F0Flz+5F27gVxUyVb1cgXo6C4Yys=
X-Proofpoint-ORIG-GUID: DSVY4ieJiHhGtGvUZ93pk0E8GwRvNO0s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA1NiBTYWx0ZWRfX2+6HlxqMz7DG
 JWCPoDAo/fOI3PL18Zb0Zz8IIhA0DnxiG28J3suJbewIBZyx77+XZ1i/Za2V8SshFHG5iFlbZyM
 /fweeS9De8laZ8zLgbi4kEHR1hOpzdvvc4ZmJ4JtOClu4qPOUPxiXJzCPGK3AdEPPC6INRryTxd
 vCBK8hEnTXkbCwAGQq7IyyZLCKs/B3RVXZlIp3PBQCfouj0yHdRleU43TR9sMyZI8QieePw7hDI
 npjW7cWAEDHoIkQdjohGHcI8wSw4m4t+cytl7RwdAlpBqug0E69PtckbBjmIR/9rQJTPZh1tmAu
 RZHv8LNjOc6RJZTK950DijZYA+oW25/mdP3S62z7N4+KJMR65zqeAqILXEyi1qeKP+m/mrUtbnm
 6yEVbGi+/O+5l8BAaf6bt5+OiCSY8ItICMvPW8OngPMqfBaQ5ynyc18zmLVRExS70AOe6rXIkJb
 +bITlnWuDHDi9voGv6A==
X-Proofpoint-GUID: DSVY4ieJiHhGtGvUZ93pk0E8GwRvNO0s
X-Authority-Analysis: v=2.4 cv=cKbQdFeN c=1 sm=1 tr=0 ts=6a3a3306 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=JpAD5C703kRQSb3sVZkA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230056

Hi,

This series converts LPASS WSA and VA macro codec drivers to the PM clock
framework for runtime PM clock handling, and keeps WSA MCLK-output clock
registration resource-managed.

Changes since v5:
- Rebased to current linux-next/master and regenerated as a standalone
  series that applies cleanly.
- Added `depends on PM_CLK` for `SND_SOC_LPASS_WSA_MACRO` and
  `SND_SOC_LPASS_VA_MACRO` since PM clock APIs are used.
- Improved runtime-PM probe/resume unwind handling in WSA/VA error paths.
- Kept runtime autosuspend delay at 100 ms in both PM-clock conversion
  patches.

Ajay Kumar Nandam (3):
  ASoC: codecs: lpass-wsa-macro: Switch to PM clock framework for
    runtime PM
  ASoC: codecs: lpass-va-macro: Switch to PM clock framework for runtime
    PM
  ASoC: codecs: lpass-wsa-macro: Use devm_clk_hw_register() for MCLK
    output

 sound/soc/codecs/Kconfig           |   2 +
 sound/soc/codecs/lpass-va-macro.c  | 142 ++++++++++++++++-------------
 sound/soc/codecs/lpass-wsa-macro.c | 128 +++++++++++---------------
 3 files changed, 134 insertions(+), 138 deletions(-)

-- 
2.34.1
