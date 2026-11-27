Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795794942;
	b=gJc0rVn48V9nTEL7JxA5+b2fLrKAvFOm6Jx4JXLAFsJS8yujIWut7ijyXmM5v7xC6ORp
	 98C43QZcloEliRm3qWer+V6Yr2h6HUlBNW769wmmAce9kaOM0oJogwPNrJcC06H4oGrji
	 xFhjAiwzsyyzX8WtQNsJzdVQQhbGZJ9NCDLYeQ45hR45jh1mSI0sW7eGDMBdiWVGgnwcT
	 uuHUsawDwk5fiL9jR9SCIdWN8g8H5aovUjLjXFnZy2/RSNletx6Xm6mNO1YREFpxKqUSC
	 knNUmT3cncgZXzDV3xbuuKGOwwkpZsiOLVSvw1PJu1Q+CukySDx9gXizRs+dAn0y7fA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795794942;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fXzrguSt16bKvUghRoVKSh8tQxjRIl1Yar6OYCfjgcQ=;
	b=5SAnn1DC8YnXcx/+VKgdZBHMof2Sz33zuBaQJ/wF8k2+C6Tc+ucX8uybYmTDgVZFk+Fu
	 3PyhmRVm6890cs4V9yA4/JSbqpvjYxCEoI4tHCzPG8sxs9nR2XyTsbBhd6Msy9a5R7iNI
	 0RpwVQWTGuw/saPOJoVjYY3LL/72RlitP3cZczw+qxDYhtySM0lzGuM4LSDOC3lEMxBzI
	 Vm1FTYAf0DONGqqlpZ5xPhFzRYgDHb81M9QFP83SDT74m3ng0y0v50GV3eNfhpMpzbC+I
	 P0tniqtz0ypuqWwKieVslboIyGPuKmhQIL7Rvaj2ehK17c7ngW0z+ueJDbUNmJscvzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dTXtzdZy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="VrqLql/8";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC83606A326
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 15:55:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CC83606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dTXtzdZy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VrqLql/8
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARFp7Si2711969
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 15:55:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fXzrguSt16b
	KvUghRoVKSh8tQxjRIl1Yar6OYCfjgcQ=; b=dTXtzdZyWeZRYd/GNpMeBB2pnuR
	TFkZsnGPJQcPVKJ+V48d6gkOl/DgxoXyhai+2o6osef6fWgTCfF7JSmroOfTwlK5
	rLEhZ2eLyme4c/htPanYEYerA5mGWrhHx1FcsjIPjK+/hygapRd9Epb1CeblhCNX
	hd5AZNCeuxX4WSdVvT2pPstTyKHfwJNaZKKVOeozSMwiCu52a1EwAZ9GaYisVF6a
	/B5nDncfze1e1uMuUxgIVAp4JE5vxqxCshTLSTIGCRaJuUNWG4UGNYHA78/RKRX+
	e5SrfxZkAEZfNfzLzP0uyjfY2VAnnBaPWnP9m4FrT9+X1HljG9pDMKvvr6g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74gat4ut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 15:55:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f5844cb60so1342858685a.0
        for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 07:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795794940; x=1796399740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fXzrguSt16bKvUghRoVKSh8tQxjRIl1Yar6OYCfjgcQ=;
        b=VrqLql/8foeES9Tvrh+Xkd/aFXfRM5epHuXARmnH31gJYeM+H/i+NYCTrF+4gZyAaC
         934eajCqZX0IGiUNFg8Ez4LHezV4xGggmXZ/aewn/KaXRd3G6XL2bkBxrTQD5aqB1/PL
         bUEPRxixFbYpWNXNKssYXsBowxnlXJJRPZpbrkpBf4g6rOrgnjLCjh6xi+AlfTSE1CAN
         mNqyTszcyTDav9+Gph4HJu1/eJYz0d1VhE6PK7h/oIhdZgqVMmmOWGossXOmkdVvJseE
         9I0P/JSzG7mHGB0rqSColiuIKN8PqId2gwhCR1AcRMD7lyqDxFiAoLiHxHsRllASeniz
         Ni2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795794940; x=1796399740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fXzrguSt16bKvUghRoVKSh8tQxjRIl1Yar6OYCfjgcQ=;
        b=gd5W1Q+xNGtTfg7WwpPvOE6pDqNR/fn7FnJO3ufbNAV3eHDRyYh45XJ8dI2Ay2UE4H
         2VqkI3ROsdWsF4n+KL7syVyDcO6TYxI8JenHWYypm8oieJyi64HWduHZJOjJ/SPW8BzI
         pdObSowPKhSWg/zoeUVQp3gAz2CKAz67M4bDYb3OAbqotmzPM+ULDy/ZFR2t7uCa0A15
         16H+8oox7E7Fwcn/jrhkPmgTebdUZEUUZ2aT3Qsl/WCAtmYenlkC7NGFyhlwvmjWaizE
         NB3rafjH4x5j5L5n+QHGuF7TITNhRStTWJUacbhn5qLbNp4I4sgra7PXmnD4pskmR5vM
         C2PQ==
X-Forwarded-Encrypted: i=1; AL+hErGoMEe0NUZEi6mdCozFX4j5YRH1XwfJ5Qrb0O9w8EMS7YElTh1Pw/GCiDLsk+VWNOJyuEaXEFE8PBwQJw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+ODEmYS524xCntQEFuxIQiMySXamEg2WOG9Jg6ixbH4lJuDXXG
	SEf3Y8kgWPuz8dbAPbTe24SrgeYpKPEQDXo60ND9PP2XvnwzUypnnkvYu7+zvOzbKbYH9MZxqP3
	tj8QuvuxliAKLebFmLigqMJ2sSMUDqf8tjT3Lv3+0ENkzFKOT2r2V3NHSm7l/d7W/+dvy6R56PQ
	==
X-Gm-Gg: AZFdTZcUMcDphQBawsAJgM0F9ZlM/BCfsmBg5WxVTENFQBDNkEuDfjVCGsO0NMieYuh
	jmD3G0TJqUfrzmzG3fd7vrD0Ro+sMxdbD9H0ep+yYx5fb73rU8SuiOHdFrZhlzm5X3DK+WJT+uj
	CFINGUosN2n/XXa93Ey/5fg4o8lTJwtPb4+s28UELljBI1GoZRm/Nb8uPAPv8RYhbn7Hs5RTxID
	UhCQVjk2R0OAlxP+16ESTsVivN7NejAvfq6S0qlleEAgGtO5/7a7aFVEhE8D2cvpvtZK5/8syBH
	AMj3WJMa3wBDT2FoJp8ZmZVh9Pg3Y9n1jgDcGx77p/8ME0HrTi2wHg3UekH9H8Kuizl0YL5Mxw3
	Ka2NFwkDDNapCy6y9h+5rMyMHF7aVyC9/U9SpW7N618qj9jhb4cGgQD5mLin83kkN
X-Received: by 2002:a05:620a:1729:b0:949:6fca:5482 with SMTP id af79cd13be357-949b3858dc8mr4431890185a.42.1795794939976;
        Fri, 27 Nov 2026 07:55:39 -0800 (PST)
X-Received: by 2002:a05:620a:1729:b0:949:6fca:5482 with SMTP id af79cd13be357-949b3858dc8mr4431883785a.42.1795794939516;
        Fri, 27 Nov 2026 07:55:39 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf6804sm47272636f8f.10.2026.11.27.07.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 07:55:38 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konrad.dybcio@oss.qualcomm.com, abel.vesa@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 4/7] arm64: dts: qcom: glymur-crd: add DisplayPort audio DAI links
Date: Fri, 27 Nov 2026 15:55:17 +0000
Message-ID: <20261127155520.358909-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127155520.358909-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261127155520.358909-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: bv-4zbl1Vr_6VuzisukejEmkniH2Aqew
X-Proofpoint-GUID: bv-4zbl1Vr_6VuzisukejEmkniH2Aqew
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA2MyBTYWx0ZWRfXwvRUhZnWTAcM
 3E2DvFD5FNicnYKGOOFwEaLRTlogj2y8fX95rJxR3p4XtjhYmSWrRXQk4pASqsusgOH74F4jYzr
 GWMIJlpTqo1ArcmGNxajeI5khNVvAl3Dl7Aj7GsN7CelNXobt/+Md6pjjNR64Oc59IYLnssARvO
 jal9W0L/ZlDpjsWoosGqQaZ2DdY7Obt2bJnzPqQuFAKYybo2o9ux3Vb0YpQnGrCfdL8jPcqyHke
 P3B+ckmBH7Hj3EJqe5HUFbli4aVF6+sMv/+jikTN3og1ZCfURJGvAxfp/8SAsjEgZ+mV9Rs0fbt
 /NuOjXonI00Pspb5PGK0zQGAkUvKEW2e6XBeDswG4C2xmM8whftqtDiP+uTqot1ccaiC44yP8JD
 FuSA9OLwY++824kDNAa+x8iUJZ3GcOJWksGzXC3qjdFIrNAazC+ub55y4g4CI9U2Jr9pwqkBn+m
 GhXlirEvu1qV7hOpi2Q==
X-Authority-Analysis: v=2.4 cv=I5bw19gg c=1 sm=1 tr=0 ts=6b09a7fc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=7VYxjO81rbqYX6bM38wA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA2MyBTYWx0ZWRfX7Zrg8Qg/mGFT
 vWNWdUhor5EyXkAID1tHD/7z6MklMqbWtF/V/KVMAb99NQ6czFVqKoo4unLv9jRUMEyEVkPJbDE
 UJng83q+uJRRvTmcKeUftzwKaib9m9w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_03,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270063

Enable DisplayPort0 and DisplayPort1 playback DAIs on Glymur CRD,
matching how Mahua T14s already exposes DP audio.  DP2 is not wired
on CRD; DP3 is the eDP panel and does not carry audio.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 32 ++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 8e0dd2956882..cdc24b273877 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -298,6 +298,38 @@ platform {
 			};
 		};
 
+		displayport-0-dai-link {
+			link-name = "DisplayPort0 Playback";
+
+			cpu {
+				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_0>;
+			};
+
+			codec {
+				sound-dai = <&mdss_dp0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		displayport-1-dai-link {
+			link-name = "DisplayPort1 Playback";
+
+			cpu {
+				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_1>;
+			};
+
+			codec {
+				sound-dai = <&mdss_dp1>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
 		va-dai-link {
 			link-name = "VA Capture";
 
-- 
2.53.0

