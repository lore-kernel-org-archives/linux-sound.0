Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F443FB7EB;
	Tue, 11 Aug 2026 08:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786437987; cv=none; b=LwIsG8DygIYYL9UBK6zujVOH1dH8bGaDTNqSsjL1cR+cdyGkBeHqJIFvc1Eh6nfIwqlWm8BTDa5T4NHTu/aW0zX6gLoLBezdFcxgzadon5qA5zs4v3jYXaZBuIHjpkPP2bjHxtyAhh4Lnnjl7gIS8m6lv3FcyzlzBPM1O8A4YHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786437987; c=relaxed/simple;
	bh=7yzorfuSUis3U3a1OmSWWDYhuXE/+CT/yWeF+XyQwes=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mWQp7v2u/m8AuXHezvJELKxtayu+rE1DlebCjsRLFYjpCHla8z1l/Bm5fpw4fjg+aeEwffy7eobBggILWY2hSByjVD1Vk5vMT6UtTVg5NoFFP2yv5Qj/mk7jzbgTLMaoxQRtf2bqKokFQjT6Vy8lpdWtzteJXNRvnf/wVmKjotU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FTpQDzYj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FTpQDzYj"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67B70N1H3552900;
	Tue, 11 Aug 2026 08:46:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CuUstKbm1/i
	ggz8iT6C8WDeG/aYFHbFK8SGf/TTlReU=; b=FTpQDzYjJsq3GahFQOXGvnGEpWX
	/iAWocU/VDyZOfJTstMuW0lsul77qKxJZwOiZCRLw+MXz9Nn6qM010T6kBG5+vTa
	5lRtNxNK/SAATBkAPole7fd5MWfP3e0gDeVvz2D6szIanJrRtDr5SvQ0L+TkmH6l
	gg7qZsIAsO0IOu0zXOBpyKif1faZKdp3H73YNaqa9LcWTmeqLfRilpRkHh4DLcXe
	v13Stwf4E2jhHrlUPweeMJbuvaWfjYK2B03TRySyPyr+v+1jmamwJRUi1YHgn7B0
	Bwhpu362kcdeNkNUleP6PUjXoJjiryh3xiVyDrH93QgXMTy6AYkaufv9jWw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyqmk1w98-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Aug 2026 08:46:13 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 67B8k91e012339;
	Tue, 11 Aug 2026 08:46:09 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4fwwhjtqv8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Aug 2026 08:46:09 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67B8k9bk012324;
	Tue, 11 Aug 2026 08:46:09 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 67B8k9VA012319
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Aug 2026 08:46:09 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 3DE70563; Tue, 11 Aug 2026 14:16:08 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Subject: [PATCH v1 1/2] ASoC: dt-bindings: qcom,sm8250: Add Maili sound card
Date: Tue, 11 Aug 2026 14:16:04 +0530
Message-Id: <20260811084605.1820056-2-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260811084605.1820056-1-prasad.kumpatla@oss.qualcomm.com>
References: <20260811084605.1820056-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDA3MSBTYWx0ZWRfX7llxHZUBrwas
 W4/0W4oAdwf9se2Bd34wzgY31fmInTRT/+mSnY1lFhy1F0qLP/89TysqQHI38s5U812Di4JZh3b
 eEQJGjItBt0jG+soBdfthJGPggftqgstqcs0nL+Xw2GqRTx67uWNOXXPG6EGyMApfXhS9sQmDVb
 jYXJdkNI5SzkeA2IfrKx98NJmUdX5T0RLa5Fah9Zu++GH8aaB2hMPo7J8PRusb2eobx1MLqfWcY
 AwtR6zO1oAUz/Hi/ijABAmS5FLpq8MqSeH647SPRq6hL+QMNW8Jpl8Ld6US6awP/hEGO/g1eLRF
 W9Ylyaumbl3DnP7pJuIaI1YPpTxkBx2sEInQMLTxPby9RpUjP+xXw+qc73kNHOJi97DOUBhvoHS
 jgifjOB+GH8DbgfKZ/jzLYiaZAHJv/BNKpi5zXRTOu9/9/S/QRFqvfmWTITbxuHom8rNFpWdGk5
 cTSXTGxokKfdCCMPOyA==
X-Authority-Analysis: v=2.4 cv=O4YJeh9W c=1 sm=1 tr=0 ts=6a7ae155 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=CR_PokFgUHY6iv7x07oA:9
 a=zgiPjhLxNE0A:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDA3MSBTYWx0ZWRfX+eK0HuWrZ99E
 hbOsKnaMS/iQ/v4B14MFpPFRWCY8nPzcttCREnexqP4QdlhiAoQ6ImcnjaoqZqf7VHlvQAaN0CD
 1iT5R04FhzRiXgVu3D/EC3fs7/q0J2I=
X-Proofpoint-GUID: Zq4e1G1LCC2Auqo7-7a5rABQkl5xbbKf
X-Proofpoint-ORIG-GUID: Zq4e1G1LCC2Auqo7-7a5rABQkl5xbbKf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110071

Add the Maili sound card compatible to the SM8450-family sound card
bindings.

Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 3e7216d61a5e..1536fcd96d68 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -26,6 +26,7 @@ properties:
               - qcom,eliza-sndcard
               - qcom,hawi-sndcard
               - qcom,kaanapali-sndcard
+              - qcom,maili-sndcard
               - qcom,sm8475-sndcard
               - qcom,sm8550-sndcard
               - qcom,sm8650-sndcard
-- 
2.34.1

