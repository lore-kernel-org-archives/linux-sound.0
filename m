Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542C33F0749
	for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 09:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789033657; cv=none; b=mxpVg8bECpPNPz67FMbW433AARL+GFuvwwiLj5QbrmTMVG3vLAUoYYxj41onUi6SPGI0TKxT4hChGyxhOawFRt7VY7RSOuWll8gCf5rOcxHWpWwdt4/pe0YxEcqDDPv31FFPLoNh+tFloHR3Y3zJhygceGzHLk43uceQ/czoZEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789033657; c=relaxed/simple;
	bh=Z+K2Tn/r3FmA5PU/noBpAu14seALgosLzynY55zm9XY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e1QSh1DN0zPyHlDnCstTZHUr4jCuB1CLVD2VOnb4Fhr9UW4eM6HSs4dd52Ra+FmPPfXsPFuz6t/A3hk2mVGzbPWnp21S6RUu6K+FO2fgMiklA11uxMkWs09U0Iyu0fsrZRhfzPPLWu3aToennB5szsbPNDYYlB5OBVkppI+3EHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pLVZJLEO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TGO7tmdF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pLVZJLEO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TGO7tmdF"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A8q7Vn4136878
	for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 09:47:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dtX6afBb6d38ZyJa/AlJzjQQ/zyOWjjfK7i9+QlvK6c=; b=pLVZJLEOMVRTdrPs
	KnwvGnqoc393uhgT01hnHzL0RmLx1vdYeOsIhYP+hcahVnI8eGG0idKU3T+3gRK4
	Cgh4FGr/YxUY6/mn1hKccHKMbDWm32UDp6H0A8NcyrgEwwzKIpReO/e9jFdhRlMa
	XZ1Ny2VM7yeXOOCpfCeGuFETvi7e+hBIpn0jAGUlXOknQR/iN6G9gi0Znbg3gKjx
	Dw7pT54OF3iMB4qTZPOwpcXbpuxnzfm5O5YrA++uanzMVPvr+kDJHnnJ/HobYWyl
	TtFCuxHAzljSmK78NoZfK9FahO0wdUBWjYmUr2ptlQGCc1d5lCrbwGrJUH++hcRG
	NtwpCA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcydu66j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 09:47:35 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cec4226c70so87148955ad.1
        for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 02:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789033655; x=1789638455; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dtX6afBb6d38ZyJa/AlJzjQQ/zyOWjjfK7i9+QlvK6c=;
        b=TGO7tmdFtiAdN7ONvc4Sk/BsiUxJ8boi13wj9dMz1QpGUleUvYehvL/WT4pV6U5VCz
         LVYAuQGRXa+R9lGtxvQ4hKhtibCK9xecr9xJ9KxdbzDA45cDwfOZFGTuU7A2Iemifdxo
         GMu1oaqGqllqWVFZu3AoqyiNXUaS3Ga3F8N+RV/1a2LhXGIYv1FcAmBRWeHIJ6XaC10O
         QRx2Y9oz4H1tIT2TKFUJ6LUZTwpAil47XK0p61VsvDalKnfyxNbJQhSbnPN/U9XixVev
         +yzS85ElItB5u+BAML1942IizFVlN1wh0OVXcu2Ynm4MsmhkoXDy1R+Wt8AWms78QQxn
         r66g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789033655; x=1789638455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dtX6afBb6d38ZyJa/AlJzjQQ/zyOWjjfK7i9+QlvK6c=;
        b=piHnLu2Kl1v18mCFLlRkNG8VNwXlY9ajyNJZhDUhPluK0QGwf+nRvodqvsw9DNefM2
         SD3cZwKO5Akj35TMjh0HCD5AIFtclwjE7XX3/rGeWVCj07YxUkIlGEu2rywIB4mrlV3y
         Wuo8xdPTi2G7UStS+Drw0xpoFKSGbcC50QSu7nsQUN8a69A60VrJcP5sZmFHj8pRotcj
         KV/38zc7V+xGO6MvxLlAwVGmpOGKUrx4ABa6rIK6rtgsZEZweWirITXm9ZFeMojmnSi3
         fM1o9yolV6CBUyPopCzZhHUA00GgmrlMIZ9T/u8fL3vBSqjT2R8hxybCz6aARcV/tp4s
         BIfg==
X-Forwarded-Encrypted: i=1; AKwUvBx/lTHU3y/UXQanhD6ygYK7h+XVNyDdjyo7c37CQXN/+fuMKdyGCU5UiSPuJjQbcjdrT5fHChPxRX6WUg==@vger.kernel.org
X-Gm-Message-State: AFuF++lLqYRG+/XMCUd7zNR87Pd5QwfyHCxULPalzoQbQUm3jd7HAKwy
	neUoYYejVzg2M6xW0YblEL8tBS8gtU1TOWOGd0mhLg8WscwaWvMxMvuP7+lEWAVi7ewYTCHMEEU
	LZxNdmF+lDbYRK/zxykHUMDL4xCR8gqXeXIQbMzI+BqCYKgnXxrVDSVA+ClBknCsCbF1q0Eso7g
	==
X-Gm-Gg: AYBFou0pitCDMm5Wu0QrcdwL3rjhFMconJPeIhL/HISoYQmHgx+derlc8KkH/L8EORb
	jsU7PSRZ2ZveQL9YwdwJz7sflMT90kXQR1JVlWacIIUhdjuKBYhTi34xAQvwJk1IxIQ/H3L75OW
	BM17qOJoZ92c9s4PA0njROwPHuglLzHzuhLaLzK+Ztxh/PF/TGkLOLwormHH+bn9LKBGrnF+Eo5
	+nEEdRNQ9JjgPNsZdlQynBWw4ZzctkHN5H8rFA+JhG0fbW5IEiB9Wz4Mi3eFk8s/dXJswDrXa5W
	oJGwfpb9wJyOQN5L7sZQA/fTKpcA7vEAmKvD8SWfde5sCZK7GtE7pCY3dPe7HnH0N565U9S+8zx
	f8gNMz4mRtzkcUFFOkHQVAMGzMlTWN17snqfT
X-Received: by 2002:a17:902:e745:b0:2cf:8131:75e8 with SMTP id d9443c01a7336-2dd07b9d86emr77148995ad.13.1789033654697;
        Thu, 10 Sep 2026 02:47:34 -0700 (PDT)
X-Received: by 2002:a17:902:e745:b0:2cf:8131:75e8 with SMTP id d9443c01a7336-2dd07b9d86emr77148695ad.13.1789033654324;
        Thu, 10 Sep 2026 02:47:34 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33987ccf483sm11941129eec.20.2026.09.10.02.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 02:47:33 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 15:16:54 +0530
Subject: [PATCH v2 3/6] ASoC: qcom: lpass-macro-common: Add LPASS codec
 version 4.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-add_shikra_support-v2-3-fdd2129c696c@oss.qualcomm.com>
References: <20260910-add_shikra_support-v2-0-fdd2129c696c@oss.qualcomm.com>
In-Reply-To: <20260910-add_shikra_support-v2-0-fdd2129c696c@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789033635; l=1076;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=Z+K2Tn/r3FmA5PU/noBpAu14seALgosLzynY55zm9XY=;
 b=WxY5kLApr1v7jLEknbMkvfeRbdVrsd+paK0SlrBjOJIjeam4Jcf/3HiD4G2OR1QnycGSsOwUl
 YWtxq47zs5tBGZ4Sz7cjJNdRLJq6GoSNc1UWBhUundn9BMc2Iols9Mt
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Authority-Analysis: v=2.4 cv=IfsSymqa c=1 sm=1 tr=0 ts=6aa27cb7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=XWf998z4RHaF4_Chx54A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: L6Ze146F8n21V6gB_zw0CMuUwT18D2PF
X-Proofpoint-ORIG-GUID: L6Ze146F8n21V6gB_zw0CMuUwT18D2PF
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDExMSBTYWx0ZWRfX8yjW1IuA0wBm
 KEW/rHp3L1VeQf/Kw5a4gJceNUjBaPZiJ4dt9LI4rFt/pzthffy/nRC9oUicy+mwESS197nMGe7
 NNVRVk+NUFbeFrdkT5FHCvsoCHNfGoY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDExMSBTYWx0ZWRfX5DdO7IoZF0kM
 sNVHdOVCv/pr5W/1qnDrQ0ZzrBUsN4rW1J5ItIT5q9AfWvVklCUr5Ewf/289sd9wRV84KfkyOzA
 bSG5GQcfCkT1RmXw4aCTQDeKqEspkwRLOkpPYDIR6yqYz4VffcbP85+LxAjYqAs5Uf47nbOE2Zh
 FqanwTim0ebGOFWryjggCBhV3WeT30BzupB9dyJz5AHESKOJppnp1DHe+t22o10I1b1sfRnhuPR
 xDauGTEKHgdlN8mVJ1XbpXLmVprD0XDdqFcAn8cI4lAh1C3iVBVQBwNfAY/67qPVeO9+1+y03HM
 9WIqJ2fSXRX7dAIGv+kw/qW+c4zRa6AHaSJ3OClcpNA6Fi6XcQAiGNBmx8Lfx27Ra4EZJxNdarL
 BZ22pYVTpOnQLxKVw1esKctAhsCQGq5H5IuCXRleQlaXMRIKKDFQx15m3eADCRGEfqjAvDO6suY
 jmaSg+H247QElMOBwyw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100111

Shikra integrates LPASS codec version 4.1. Add the new version to the
codec version enum and to the version string helper.

The enum stays ordered by version so that the existing '>=' comparisons
on enum lpass_codec_version keep working.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-macro-common.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/codecs/lpass-macro-common.h b/sound/soc/codecs/lpass-macro-common.h
index 573b2145e..b52665b11 100644
--- a/sound/soc/codecs/lpass-macro-common.h
+++ b/sound/soc/codecs/lpass-macro-common.h
@@ -30,6 +30,7 @@ enum lpass_codec_version {
 	LPASS_CODEC_VERSION_2_7,
 	LPASS_CODEC_VERSION_2_8,
 	LPASS_CODEC_VERSION_2_9,
+	LPASS_CODEC_VERSION_4_1,
 };
 
 struct lpass_macro {
@@ -70,6 +71,8 @@ static inline const char *lpass_macro_get_codec_version_string(int version)
 		return "v2.8";
 	case LPASS_CODEC_VERSION_2_9:
 		return "v2.9";
+	case LPASS_CODEC_VERSION_4_1:
+		return "v4.1";
 	default:
 		break;
 	}

-- 
2.34.1

