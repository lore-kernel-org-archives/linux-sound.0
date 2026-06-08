Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B61D3D3321
	for <linux-sound@vger.kernel.org>; Mon,  8 Jun 2026 17:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780941249; cv=none; b=TWusbLD0Xpj6Y1bLyGNrglHLwPgmAGf0nx5UyNyqpASo7zSM5GHRqnKQ5mpAZtLu86Jx4gPrB5G1fPA4Ktm6oeh8CIS+wZQv3gz93EvJFPFN27SJrap0kfZRt2tWQL+I04b2T2m9KKe7Y0HkEIQGS8atkbQs2yTvvdjMuQqrdII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780941249; c=relaxed/simple;
	bh=Sp9uCyVhZgE6V5ypRAHDAVLYx8d20YuRlOPU3GnP3Gk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cXYHmy16mRgB0JIvp6BDiQkRBKPe3aysazvNRXl74kUfzCBO/+hziGGambOUwvDUhuSjF2fIpVl/nKbKteaFkXxb2I2vJ9pMl1j7LBERf1qh2dtt5e2EOmg5ORW7hyJpSkJ/gT9Ixi8OX9YN9AwB17+A2Wq8oaky77aQq4+oKxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FcoHVPoA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fFx8xdNU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FcoHVPoA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fFx8xdNU"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658FFdei3479258
	for <linux-sound@vger.kernel.org>; Mon, 8 Jun 2026 17:54:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fvv0JMgN8Ty
	Za2eRZEukzJ03DvsKQNNfZlj9HOik1Nk=; b=FcoHVPoAaHtp3MEkph1MP3eGt9+
	akc2WkZi8hOQb+5MOtUoiDev40y2mhw3CQhJL1AchabXydt+2McJW88qNcgjSyJD
	VaQjnldwbmSCFimf7V3MuSEYujaNws35AjglWKk4JUmoHfeQ4dyxfI9W1sqPbk6u
	U1j0vthFQEO27YfvFIgpFdC3UCaDECZmclDQoQun25tEZKt67USDbQwen+pkVM6R
	9i0hOiGXLFuY4nE3ViOepKvHuGTxGF+gm4P0MaCj8Ll/KjTJVRma5DLsruDPcZQf
	pntSXQtSauVeBzKaYZ2MbC9aJ3w5rzZat5NNv3var/XkGNWhX3yLWmVvySQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enxx418kn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 08 Jun 2026 17:54:07 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c8514f8ed5dso2773089a12.3
        for <linux-sound@vger.kernel.org>; Mon, 08 Jun 2026 10:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780941247; x=1781546047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fvv0JMgN8TyZa2eRZEukzJ03DvsKQNNfZlj9HOik1Nk=;
        b=fFx8xdNU1G095a0tELdyAeGERwOyqb4hY8GHdTjKohnUD7TKNgs+FLIQeJphSzZCkj
         LE9peSPJ+XGMMrIYcJXvLPKoMEIQodi8ulZ2cEvaXHCsq5RKoW91rgO9W7KGnpMwvIMi
         ZxU0J14wgfuu4OKsW0QlJEc2Si0I+l2ecriHkPhFByDN3e8NNe0gsKP8WDbsFqKopRAB
         XYwfbVbd4IDdIC2MRy924X+OfvLkFeKtacWVZ9MRb6mB6KZJAJPkRCvubByl9+4UN7+e
         oMsujAyHqgtj1oHi9t82UE9U4gxdm8ySKvQk5wSkXtR9XVCc5cTeKrJIWPR+IO55HDVO
         8hpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780941247; x=1781546047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fvv0JMgN8TyZa2eRZEukzJ03DvsKQNNfZlj9HOik1Nk=;
        b=SiA4a3JqYdXf0JyEC6R3bf69IkFlo99mkNE77VnMILU4bgGejaW5WGkKCBNBAPtpYF
         IvqPn82gFC7pB1TWgqiHpUyEovUL09JVw28NGiM/FBx7tp62LaOYfkTsZrpak6+kiBby
         6ypW07j5yqwkXKISwa37S7CAX1g0VBKCPfyjnrdb063p/ld0Hlw/by1k8gIBzK2ymZLC
         F5iQvr9NLreSPyUQnMyr5oAL2avIdTg/buJ7KLXxYlX0mlJ+axq98+xQsr4jMWwavAHV
         W3EtxGhBc3z3OZsm10cUNOh3dbJqBd1pk6iOnIKCZSuaxkAHn0/zZwp6UpeOrcS/50gO
         IADQ==
X-Forwarded-Encrypted: i=1; AFNElJ+CUTAHEZtyVAt/GWkBNls7aIkxUm06kuLfH9Utm2pr57HjpuG/u7r7QABfO0ww4WsNRGnHHK5OBn2++Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmcoRMKdoThgbADqQtpewwLmfd3m01WyXU0mYhsWCWi0emOBcq
	ZG528XxMvhDKnmgDTpHpl5yVjCE21pqE4w66gvhhQIh1SunvQ8kNtqUmEfwP3grbKTGjv93T7BZ
	iiMQGe1hv9xKAgMOE4tT+o3KY/wkpa4PNFXxvEyv4d6OlFbxOqWlAELMBaLZk7goo1Q==
X-Gm-Gg: Acq92OHrO9sZuQgriIlJQvOOxlD04H8FVivxaqGwPlnq7v69CIb8jPn5OnEWggCMBm3
	5+OivOlzSltXhqFUDtYXRDu4mk3GD/15hLf5vz+CLLkms7ynW75HD6c0oSe+mCHW0lH+CEq8N1f
	JchHe9JIQ12uBfgl0+AC0XhHH0q0Xn/FSX7P1BOXKvLoaw9TLZ4rkT6tccnVLyAjSzVy5qYBhKq
	95eBenes9bgs0ZudK/LOt5+qndehlL3GSmXxd2mfw6en2Vyp6LVShUny27f06jfwRbyfCx8Cx5P
	NcKjDeEche0AWmxvRRrF76E2vSu4c/Dzfc3++5fBWDC8aS8oRyKb9wStiL5BMvxT333Vu2H/E4s
	Soubcx+IbFGm7vuX/rKRWYxBVXGyrq61KGsdOPxADFOCGUC3qz6VQBWhDehPvJS6NzY6t
X-Received: by 2002:a05:6a20:6f8f:b0:3b1:884a:c3d5 with SMTP id adf61e73a8af0-3b4ccf81fe3mr18972800637.24.1780941246862;
        Mon, 08 Jun 2026 10:54:06 -0700 (PDT)
X-Received: by 2002:a05:6a20:6f8f:b0:3b1:884a:c3d5 with SMTP id adf61e73a8af0-3b4ccf81fe3mr18972756637.24.1780941246380;
        Mon, 08 Jun 2026 10:54:06 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0a4afdsm18975720a12.19.2026.06.08.10.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 10:54:06 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Rao Mandadapu <quic_srivasam@quicinc.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: soundwire: qcom: add qcom,swr-master-ee-val property
Date: Mon,  8 Jun 2026 23:23:44 +0530
Message-Id: <20260608175345.3118060-2-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260608175345.3118060-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260608175345.3118060-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=cverVV4i c=1 sm=1 tr=0 ts=6a2701bf cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=k36RDxEvBeizBLppCEQA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: UEccj2-kxorkHzcEqpaLctv5Z4EHmaul
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE2OCBTYWx0ZWRfX0srIyOwhJLv2
 cmspEWz6wnHf4ImdWsZQ2Aqag2sPJcuZMupBt0+V/t6vNv5sqM+CAlRFqrktpPO+zZw0Y+F8gRZ
 P/ZXczdLoE+cI+j4Z1a0cIzlO/Aw6db3cbuadIQNjLiU2Jmm1ty3pUvnXTTvJ3Bb/kWDwf+LsJr
 kqfGnqFad+Jp2ueuBlb2Ij9dkIq6vb92hAjv6XHEhvGAZneH5cJ08w2uDynLBHMQrk7gwId2lqk
 GB8Mjgyh1WQkIhXKt27VYU4rkN4JLu40mti9nli133A7FJ9MuC5baJ/jfp/oM/Khyl8ZETP2lvC
 vqgfUq2UAtR8T+MXFSwy3Iyg87gFGM9XNZO3Irgy9929dxgescdRikjf+MlT2vwygNSGG+YJJqC
 GKAa5mUFY9Vutnj5MnmOLQg95BKFtdiJy8+0eXgZ2WE2tyiJNDa59CQzH1XyhjikWx878pMde7J
 40R7ZGUzF+H2v0EpcVg==
X-Proofpoint-GUID: UEccj2-kxorkHzcEqpaLctv5Z4EHmaul
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080168

Add documentation for the qcom,swr-master-ee-val Device Tree property
used by Qualcomm SoundWire masters to describe the execution-environment
value for interrupt routing.

This property allows platform DTs to specify the EE value used to direct
SoundWire master interrupts to the appropriate CPU target.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 .../devicetree/bindings/soundwire/qcom,soundwire.yaml       | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
index 9447a2f37..5b06cc1a5 100644
--- a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
+++ b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
@@ -215,6 +215,12 @@ properties:
           maximum: 4
         - const: 0xff
 
+  qcom,swr-master-ee-val:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    description:
+      Execution-environment value used to route SoundWire master
+      interrupts to CPU0 or CPU1.
+
   label:
     maxItems: 1
 
-- 
2.34.1

