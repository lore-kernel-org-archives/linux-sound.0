Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B95436AB61
	for <linux-sound@vger.kernel.org>; Fri,  3 Jul 2026 07:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783064100; cv=none; b=QjKriZqi23DTPKVXG+hmcPXCPoJnitVSO8ON/huOLJhCzfXyyl6GxVKyCMKNK7NZLA5XPCG8tZ4488MffyndIWY4Oh3hE0T0eEsiJCqvJ9+Pety1e/2NElH7pqDEnfgiDubemjwTb53n6eh79mdJHq6rrIEId4ehEBbXbnQJxkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783064100; c=relaxed/simple;
	bh=D1UXnt8xZvDn46n75zacF2bracmwImWOgAmSBddxQR4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gkH3t37B+zvCD/E2ieRZFcgX9GdQrOD+3iNpnuiJ0YdPgkagRQYNZZSkkqrLxr+17KWoQqrZ2i7uNA0lRdymeM/nf8G4EuPzAQf5GuRIk1UfritGVGcRha7jA7gfdC9Y9lGUtYAKe8Ex9NiK95gifFwBmdepXNwqONzUWPi+sDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gI+qpXxq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jj7aBNpF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gI+qpXxq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jj7aBNpF"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rb083129030
	for <linux-sound@vger.kernel.org>; Fri, 3 Jul 2026 07:34:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=I1muZPBkf4c
	S6q1wIo25pcwrOaIN4VA5bpCprELX+mU=; b=gI+qpXxqgIudcYxEZEwjTA53HLm
	ohKMPjbqwQ9EAgFP0U10z45LrEsh3KVsI64T9iYOg3ov9tr+ybHn1RdEdChVHzC2
	dP5HKWElu0VUdeA/i6FG9RiNdwxpEIqCOrjDb1Udj9PtMAL/qB3VO6EksEzRvdhM
	E7I1GvdLEnYG1IpNcM0ENyflb/BB7TBEIxL9jgIC9jK5XaXsxrhhqhqduZQr/2oA
	f6ygZjByCu5ddyTt2Ee6sMLkIT2YJZT5S9yB+ZhtS8jiU0G8eLTcvn5ToDwSCQSh
	imqlFcc6F5lzqbOkNZg/1lUQ5hdnTImXK9ihxGjetfRwdjPOaCQz0yj2AxA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5qfc4fj4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 03 Jul 2026 07:34:58 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c804e38c65so6033595ad.2
        for <linux-sound@vger.kernel.org>; Fri, 03 Jul 2026 00:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783064098; x=1783668898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I1muZPBkf4cS6q1wIo25pcwrOaIN4VA5bpCprELX+mU=;
        b=Jj7aBNpFuispoCI4dwJ7fHDDBPO1nZZ2f4lX9OU/huxCORb1+jrKjB/1+BmNnNXqbX
         RHRgL7CdokAkpyQMEb7tAMBdUFJcmAGoye9sJTLdbCRgZQU9DLodVSTKXMXfBpnse9cN
         z8NQe2CmaslHMPYiJBJYZnz5C9Se9sIw22kGS0Kc3nhG7imZw+SlRV+Y0DSFKoIKj7w6
         iYIu12nxG8s+rzlKRWvUEIBtwwMscg8jESscVUDTmfm6svJRAw38eeE5REha95HEgZvt
         j8JYmzioo60OblNluMrLkofYU7171eDLlgAh6H0SROJU2vEpShYs/tABPewP6LmSAJkC
         Znzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783064098; x=1783668898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I1muZPBkf4cS6q1wIo25pcwrOaIN4VA5bpCprELX+mU=;
        b=NuXsFDlNfbbOB5UdHzheYQtfcmB8ltHo9J8aRmim3XbkQW8izPiFPbGBVomUNGJgvd
         wIOHXwVnEYUIOzVC5rOQRL0FIn+/GuJXw3o7EbE3v26baUM+bic9mLPjfaQYvWMmtfPO
         wIsiCUY21o5Ykz2Fdy2WrT1XzPaoPofdw7rnsIQVrYrGMj8BZflKQ0fQN7DL3EP43FCp
         ReNxbzINJ0jtF1ReknNr86vQQjIBMZ1B39PECmpGxc+89gb6dKNYJRu+7jP+ypjaE2bU
         iO4QFT73ibbqYWd5nZP5lCvr3bt/RPAnM3TdcyGYBqIBOSz/NW43Ehv+nfhEBQ9ux2T0
         5iMg==
X-Forwarded-Encrypted: i=1; AHgh+RrrzmyE0CrYutrGFUs6SYCR/ueBrbAXMz6aC7bywu3yzg4iafkpIxRL6EH5CU9gf1IdgQpuHCuHOAvUAw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy/KoCkIDetNHy/tDU50Eos2byqR1g+K9wGEZ3KiIKLFAF2Wby
	g/bfCz2dZPyFNZIEOleU4KLMgZxpNc+BmN3NgBAi64K3Iqx4VcbfO4Nqja0xGFaqTvOLL95CKG9
	ekagmpf1/CbQFKGK8X/wTsOSpqIdYlIjM+lsQ3gCb03krq1gJH6oNBuYXjuMzP2ajhA==
X-Gm-Gg: AfdE7cljksEytk3A3JsFsAbctfPuafRz5VjtG9cNzXEzHqfZ/aq0cz/zU5SlVxIYYk8
	vCyEvj/Bz/0zKsWMKNE4z/q2CBbbuqxUD2pxftN64g9OXznMhareAv6evnTok5zcDGm2WOLFbQd
	acRuUGv9aniHDcXtoJU3WPBHAUxqIGeLDHPCtvE1TYwvK4DWLgSeKVMOQZAJcl9szFRDkM2iY5Z
	hYwBRUDW60WMGkLPmxqCPi4inZjvtLHraBJunTks1dqa6jofWnjxhrFKxQEfQ36qM2dq7Zmvlkq
	3hOhBy2eVlL5VnPZwuXltzcaQ7WPvXR11WPcvC0BgV5v4OPDprhee5m/YFacsvbSx/A6aBQiG5c
	Nhmf3w26g8zgtV+Bh+5eUibt+ijK4ccvNahbfWFQ1
X-Received: by 2002:a17:902:ce91:b0:2c6:cd96:6a8 with SMTP id d9443c01a7336-2ca7e75b9a2mr101622005ad.30.1783064097714;
        Fri, 03 Jul 2026 00:34:57 -0700 (PDT)
X-Received: by 2002:a17:902:ce91:b0:2c6:cd96:6a8 with SMTP id d9443c01a7336-2ca7e75b9a2mr101621765ad.30.1783064097268;
        Fri, 03 Jul 2026 00:34:57 -0700 (PDT)
Received: from hu-raviravi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f25e15sm5225465ad.13.2026.07.03.00.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 00:34:56 -0700 (PDT)
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com
Subject: [PATCH v1 2/3] ASoC: dt-bindings: qcom,sm8250: Add Eliza sound card
Date: Fri,  3 Jul 2026 13:04:33 +0530
Message-Id: <20260703073434.2589657-3-ravi.hothi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260703073434.2589657-1-ravi.hothi@oss.qualcomm.com>
References: <20260703073434.2589657-1-ravi.hothi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: MXi3Zo0ZlK0pmeOMKPba_0eu26zBc2zm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA3MCBTYWx0ZWRfX6heGCJDRk+8E
 UhDGXuIrNNphR7L1EB+fzVkrY3N0UfZV5Ghd816Al41azzeSZ9r5WC7dm3AFfIasz5K5REExZvm
 usZP0eKnn0BbgR79oNDzBTjzJleGhqPnMHaAY4UFoDonaaoQ0jzPfCbUUghV+ZqvNNfP5HcJyWz
 3jtZRBH/S95f41EfeL2UXEar9WvBFziHuB65c6guFn9G/7OUb/QO1IrSx546NsonweL827uwA21
 JfQD0xHKY+Njpy8H6FTEOUo+PKNHexwCqBFVlGym3ux8gs2Huy1CNXo3gfXgpxLKnNqCY5pMP9y
 88tQcDioIFofxGukTz3hwrRCQf42Tc9F+3eh+YdgXcMoMJvtIUrc2AU3tImmUzBOOMvitwUxPm8
 X4FnfOiGmtyTwIjp1n6arj4tXiWX/KpFsIBfI3QfGZAlPAND0pGX1t5loEJbbitlj639k3etqCp
 X4iXBnek7CBV5LNRz4Q==
X-Authority-Analysis: v=2.4 cv=dvXrzVg4 c=1 sm=1 tr=0 ts=6a476622 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=ohep4PdSOWtoWzxL3IwA:9 a=zgiPjhLxNE0A:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: MXi3Zo0ZlK0pmeOMKPba_0eu26zBc2zm
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA3MCBTYWx0ZWRfX10n8RrSDg3x0
 qApYZlTuyMZ7C0DGPnVSSdegIFs8rZOd0n4EOKt57If9dgSaCFk6gPPCHwqv193mRZiqi15kSBe
 Sbq0LU6fZM70QSNl3Am5aWmh7vjDDBM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030070

Add bindings for Eliza sound card, which is compatible with
the existing SM8450.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 15f38622b98b..dae440ecab59 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -23,6 +23,7 @@ properties:
           - const: qcom,sdm845-sndcard
       - items:
           - enum:
+              - qcom,eliza-sndcard
               - qcom,kaanapali-sndcard
               - qcom,sm8550-sndcard
               - qcom,sm8650-sndcard
-- 
2.34.1

