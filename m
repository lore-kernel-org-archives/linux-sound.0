Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F19A4052C0
	for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 09:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789033653; cv=none; b=OHCedZ3K+189Z40xhwQG59C6KtWbSbeDIhC72mlDjYdPPrJ9oyEEUoCExC9uVT+fpT/jo+84SjprgI5MoEtRae9CrTz08mKN9bopbFVKzPTZo5USjifieukAZ02Bja/It7WxhijohrSlLJtTPPKloo/zyfEVqHD3FcPYnDvb/uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789033653; c=relaxed/simple;
	bh=2LhCRdb4SB1knRbK3yyCnOaHr8rfIhz2uYgEE+b9MQA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CMCGyr9bRxV2F3Xmekep7dbT6fpCyR2eEKtmrgSQMkeou5cHVKqERoIhfrwbRojbha/ihrDUsbRoUpWvpy2uB3Ce7zk5MMU6Bwy40sKHcscA6BbImPF5BrgaLE7X0IIJG7ngp4nZrEIvPCkdpKcIocEwBUusZpjTw/dCHhnZR1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pkve1dYX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aJAcXscE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pkve1dYX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aJAcXscE"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A8q9aR3999050
	for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 09:47:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RY2nV6IgGFcHLC9gYLbk26u/oCbJf2cVf35SBZTctoU=; b=Pkve1dYXS7qT5+tP
	G7nS5XldSHKoDXYb2aNzykx/yJ5BVL+gu6641EzSc+C0wcgJbz6cqWz6j6MFHvB+
	gdL5exdlhZivLZQMBQxp8807rfnk+OOc56VPthbsxOr1FE5WqkTqk1SZ6OiJWMkE
	H0HpwmV8lyS/CkMdQWGPb5P4Pz1d6F5HCIPh4tswlLDboOkKLsUt8nPWcVJKhbPT
	fgTQ2p1bYBhlB+TbwMPX4WxujimIIPCupH5Vyt10QTSYZpO8ctjJvLq6KaQQgTV6
	8hKAEKQsC07FGnMoMalki402iKxPfWPOlOkOEMvs6LYIBlw9xxAF9D6paLyIAAjT
	KwD8fQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyfk9e8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 09:47:30 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2dcfed75f77so28941675ad.2
        for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 02:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789033650; x=1789638450; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RY2nV6IgGFcHLC9gYLbk26u/oCbJf2cVf35SBZTctoU=;
        b=aJAcXscEbd6zGlg+hRGLPW4dzFuXZbJ9WvbCrBm+M8wpPqFh5PRFx0fDIkPfq6rvJh
         /5Q2myQ27OYwwxQaCpwHcTo4vZOQRvrBDdLWJglhyhoLnSz6HajS+/SXjAW4IUb/hMkk
         oop8qZjQvp8kAmN+if6VNhrukHCekjhYJXr0GZybAgBSO7SmHLYztagQSuSFWJDokEKK
         LKngGNEY7fVq5tEaAd9bcoodyOtK5NVQjMSaBXAksKBMxLcfTvaBIU7dI/brvOSz6n4Z
         9t8KDTFKgyc+U2jcqJD6EgiHjBrXzy7dsS47kkru8BxSaf8/hpUnURpp+3B937Ccn7YY
         sTQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789033650; x=1789638450;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RY2nV6IgGFcHLC9gYLbk26u/oCbJf2cVf35SBZTctoU=;
        b=hNYlUcE0g52XbbMm5IbdspMXkzO8MEv/T3uiubHTlw+wpnbjZ31UkretnMIWpAPcv5
         KWCdO+3O6DaN4FWHz9GmtC5noz4VAMKe8OTpYijJXzI6Vx62432goWuisYtNS8Le3ZCz
         dFVT0L9isIvWxCwwVeAmLOLjBfFaQ7UNJQGs7GKB3YrnnoackZSuUZnwLGe7Zk+2OcIu
         /UkrSCQ0qHz0FX8m5wy/1UfCcpTmWrwudat5eFqffL6nHaMErJYCcGBKDPRlcL0R1bjH
         JY7M87SUISoEV7qkPRlWaCUJchijeRDCLxavHVW+IfTw8/xCAzxODoWFnrCpusdChrYb
         mowQ==
X-Forwarded-Encrypted: i=1; AKwUvBybSf8Xa0XZ4kzObLacnAHpTEx5NUr40NAQRI/nDw/W2AF7r5VnFIoh5r+slT9dcBMAWSM89zEc6zw7dA==@vger.kernel.org
X-Gm-Message-State: AFuF++mJoQxt081zVuUDXXtktoIYQbrJjFMPjxFf5iq9gcIrzPRMUQM4
	YU/FaurCqLXj6oWX6gnTp/uOX222C6eLYY6VFiLEXhAubA3vPcY+V6E7olFFyLk9PiJugLFqHYX
	YN3yNOAgPsHwgEou46IV1Q6/QGiuNgvSxTVNXS42r1c+VM+JummGPIJNjvtbdcClmwg==
X-Gm-Gg: AYBFou22H5mB1/nRp4jDoWN6C10DAeOrc9F7296liMp6I+Ditw5cUu7MAwtM1jtoSnW
	YZjHyry15D0wgrgJiD/mLLzM0kCfdFYlsQOdWR7X30ui3jWoTizbYxBa/UdUMRP/CK6/2hf8y8Q
	pK7f7tDfkmaOt++zV9NZtMUBLNqkOaonm765abng/ITED7PYnXYk+8Yi4Bb4hseGl2g0vd+y4Ym
	+RJ8zLw7QTZ/4Hw7eZmD++vM1WqbVjYBfsBtDbex28ay66NJ+nSEf5QA5RtzcQ1Z0wnpP7LSVqC
	Qtn1U1ixCdUE5OXhZTzLie6+BembPz04wTCBiVH3zMV7wRSmaZUfEtmLKX52/FY3zX+GdwcHswI
	uLv5iR4lRajMWDc2uA40sYDr2MNJy5g49+LIh
X-Received: by 2002:a17:902:e54c:b0:2d3:7c58:b0e1 with SMTP id d9443c01a7336-2dd07320bb9mr96322655ad.0.1789033650027;
        Thu, 10 Sep 2026 02:47:30 -0700 (PDT)
X-Received: by 2002:a17:902:e54c:b0:2d3:7c58:b0e1 with SMTP id d9443c01a7336-2dd07320bb9mr96322195ad.0.1789033649594;
        Thu, 10 Sep 2026 02:47:29 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33987ccf483sm11941129eec.20.2026.09.10.02.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 02:47:29 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 15:16:53 +0530
Subject: [PATCH v2 2/6] ASoC: qcom: lpass-macro-common: Add missing v2.9
 version string
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-add_shikra_support-v2-2-fdd2129c696c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789033635; l=896;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=2LhCRdb4SB1knRbK3yyCnOaHr8rfIhz2uYgEE+b9MQA=;
 b=9vnuclAJhYWlGpQD1qQiEVG5tCtfh5GCTouC758hlLvHN+C1+1+7xPRnKfgXYk0OPdAJAGY66
 m9YDRsxIf4mCMgmlxoE6DTlAnXi75TswqDGmD76PIe4lH4NDKYIsNOV
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDExMSBTYWx0ZWRfX14b3YwS2JMd4
 gHbIkFUQEpA1mQHE0gHjXOoO5l3/cfYr5Yy5EBAYf58fBk1G8RLNSbxcI+8GzsdaKCwLSvMP02N
 aPtd25NA9U0cumNqOm3s2TbVoSE6iak=
X-Proofpoint-ORIG-GUID: xyVMT8qRgGgj1XVgAeHvuVSmEFHdabpQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDExMSBTYWx0ZWRfXz4ZHBnRt9Ug1
 rfUxjD9zP3gbs2eFQDAeDOVjLEQr1cJOfv/Ea7fVX+YkfeK+82qxHXp7n4ni2CRdH67gq4YOUNU
 LAebxRxD9e7kGn5UbMrQ+/+t5X1y+IbFe5BB5DPhn14N6KvoW8vlRu8OiLX7wNOekV5WsuRs4M6
 u90gEXCwYKO6YDfz5lqn7DqQzzly0YXDIlMICZDI/EA4XHKI4YZ/3LOgWoicnwka3QwMBBOCm8B
 788MQ4rf3yZv6R+/p/U5ZSS9GYoDgYi6+p6gaJNF0XzrnJCDN03roZ1Gv/HN4ZOZKsdbTWSjXW0
 pXijluj6FnyxLYouFw4zsIKZrARdfpkowmif4KRFm+R2PjBHTszUlDeqctE6ELao7YwBSPTfIal
 suDBDK4Crns4RJ2a9kSkbd8qkHTUyhozj2jZYWzKrlSXp2qfD80OKNYeqmcjjRx7lbd3ZwQwe1u
 PQ03nJBjY9c6hahvPLw==
X-Authority-Analysis: v=2.4 cv=H5pOUOYi c=1 sm=1 tr=0 ts=6aa27cb2 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=QNNIS7QUJBVbuyI2g7kA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: xyVMT8qRgGgj1XVgAeHvuVSmEFHdabpQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100111

LPASS_CODEC_VERSION_2_9 is detected by lpass-va-macro.c and consumed by
lpass-wsa-macro.c, but lpass_macro_get_codec_version_string() never
learned about it, so the probe log reports "LPASS Codec Version NA" on
those parts.

Add the missing case.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-macro-common.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/lpass-macro-common.h b/sound/soc/codecs/lpass-macro-common.h
index 10ad68201..573b2145e 100644
--- a/sound/soc/codecs/lpass-macro-common.h
+++ b/sound/soc/codecs/lpass-macro-common.h
@@ -68,6 +68,8 @@ static inline const char *lpass_macro_get_codec_version_string(int version)
 		return "v2.7";
 	case LPASS_CODEC_VERSION_2_8:
 		return "v2.8";
+	case LPASS_CODEC_VERSION_2_9:
+		return "v2.9";
 	default:
 		break;
 	}

-- 
2.34.1

