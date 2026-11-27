Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795794946;
	b=x+TPjL/Udkzen+GrKYj1ObDdX+AwRe04wSL3P3aW494F/cKlKHeH6IiCT9ZQzo1VvSC8
	 f9BzEmONTsxPIaT+YoZFeEOeQA9s6MG7RBmyUICGNMkYln6c2buPNWQ8uhKR8RR+Wbxsq
	 u7oAf4fWloDx3eGfxnl7QuxIc80MZHbGwwFLPE+wtT5Lx/xCTW3gpuwJ9lvrZAPe8F2pX
	 tlnA8bzcOtJ3zybaLx5kMTkzJfhgjzNKGwSbAlWq8zxqxBR/5/hYtGwgt7aD2Pa+ziVbU
	 NCDPf17QGqaX1+x/59oegc/7nLHZDG2xy5m4IvWNEt3P3lFZYalgW4e2wQUYXOXBwqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795794946;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6nyF58dcnncG871ju7X3tQ8ZZEDodvi/j1FoZtxjGfs=;
	b=FQB/ZwsRIjHfcgxdMi0irsVEBEDFhSrAojcfFWls3vZKng3l9NCxnRkMtEUAIaBZTJRn
	 mBA4OjHJmKuVdVa5y2el4sIPo2/Yifk5B1+dm3XOE1lb59mtYPwgORcH8hKxvjE+XlEuD
	 KzBV+IvwEwCJzDGOR6KfrtgGIxJD+eTfQvoSX04PEiBcz72LVCvNZjIJ5fqTjdWuzzvl8
	 bVMMSgYRq0kT0ZJxQ2KVyyDU4k5DW6hjpHMOEd7sjQq9ent3zF3MbEU1qZ6On/ldrr9dy
	 veyZw73S+uXDWuPrXe5FlCA1GOM2jli1byTa80vrPILNWINlz9/rONNs1YCnmsjM0cQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FgOdbpEA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c792ZMJB;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B38606A685
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 15:55:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90B38606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FgOdbpEA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c792ZMJB
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARFpCsP2617667
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 15:55:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6nyF58dcnnc
	G871ju7X3tQ8ZZEDodvi/j1FoZtxjGfs=; b=FgOdbpEAl4pSbM/oCGkEbnfIitB
	55t+tnJUQD5EVgsFAXej27PiwYSRVZLuooqN61csqVFG+rMwl6WZcEmWsaO0PKPa
	+Xnc6RAjX4MuBF7oUI0iPATbsa2Bnb7VhEWuBpabAWHzZJKJl+QpeDDuwLU1lj7c
	1OG8KLvHrlQ4iPgIGUSdl8+QwWtNB4doTGsFoCRX4mRO/2l2E5z3RW85A2UotPK5
	2Yorazn/srVpTQfTcLjLOcC3aPuSubpeiFzyomCWyVwcVW5eXutTHk8A8bEn+ZBI
	2wu/OLrE0jJx/5jv9nWetzst1UHp9QJBUDykKLvAyg6p3DuI/jP03KCkYHg==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u4hurbs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 15:55:44 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-677deb12bceso12428316d50.0
        for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 07:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795794944; x=1796399744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6nyF58dcnncG871ju7X3tQ8ZZEDodvi/j1FoZtxjGfs=;
        b=c792ZMJB1D5ap0q4lFgOnCh6W7yRQ0uPAdzcZJK6jFY+ATIHFt0T0Ckw3PnBg3wDJi
         EkfwJkrVItswTbZPwEKRzSI2re/g2D0rc/2oVJJS7/gHYJdiuJuPC9/rZffp8NLEGPR+
         +Jv1FAoo46HSAt05PLHTkTGp3CXIgP9/UBGv3RlT/3AfEp0d7X52gVJIC+sNvZJvUovM
         97Nf5inoPzvgMD8U3fYDDq/HP+81JbSpK8QPV4GTzsrGhTd0XZQQpr4lrAgYKCauHoOi
         NP7hu+K0mkjjummfv9bxqY1RQEJ5F+aT3V+SLe6r3n9xCp2OLvlYIkdRezvecMeSpR3T
         ub4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795794944; x=1796399744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6nyF58dcnncG871ju7X3tQ8ZZEDodvi/j1FoZtxjGfs=;
        b=FOYYYxDPNO++uUtHxWUmqr5H74JDE7qIFDmPQyEROnr2Qat+fthkx/DJ/AYhrhmDcF
         nB/n+7+OKDmXLbVxkGKiZpwsKUieKyom0xoKuYEQoK14sKVDqQOxxmcJ7wsdd4KhMmCZ
         T3uB1aKFCAlOOT7rON/mXMl7QOhJbgmzzWlUDEKuNKPAP1KtiCqBDOZxJoLeeOAVV11V
         H1PhdCoNEe5IAyMPmYG4SowotEGcGVCxEwPukvne5jf5DJcnc74rGwngAvb/WpqivhQB
         AS02dDAo+oYR8YtuDFDb0fbm/WFIO7+gFjOMulpzF2EPWGiS5rlxKolupRTiQhRCLgjN
         QEBQ==
X-Forwarded-Encrypted: i=1; AL+hErFQvgbBfASKhs+j2HkriZuZdFY87EQnTn+0lRmegbiWxAimKX8R7OkgHOEPgZ5J3mk9pCc9Z7asvm1PIw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9DwbWgiT8CRRhkQjJP71MAQr9O+w/aT3hsYEjufv1yiec2JPqK
	Q1D5cWyPKx0Dp1oUtGw03vKPJpgKh5yasrRP1BlWFAXi6WeWUxlSWTaiT0c44YdEbXvTL1+/xDG
	C0FqJHIwKITDwTOMP05mLjeh5ngt/MmU/9QOqAzNPex4VO9W+pcLx1r0vFQcXCPieVQaT/McYXA
	==
X-Gm-Gg: AZFdTZcTNggbDylnq8+UyUGAEy2oSVqeuaNEPrRetHPIqhsdO/oe9ClKfuohjAmouLc
	TBcXt1YMTr6njVkYGuMQlCIIandFlG8/PL4GKNDniiYDgY8HZ55FBFWc813w3AHcX6QsWID0p4g
	4vIup8bV2RCy5p+HOydYJY0vEO/TGnxWdUGdPEY4D5MDS6xdxERskk232ln6JBYzl8kWxtF5JO0
	7ynpUmy+x0io0sqdFFpjwr3GH0hePj+JAxLq40iBFBUDzHb2YjXBN2sIqx9/6Z78bG8X3sCgVbL
	yoQKXCz7JBWj0P2Ud0v6uGEchbOw5VpOfWVo7yUwnOPDrdCTDjtrXkDtWAs9nww2UMTk7Nk3pC5
	aQT9x/0cWKwc7e+GShrUOisKbuVjii1S3arOnjDtKqgimFP9VS2NyVwJAEsNJhR73
X-Received: by 2002:a05:690e:130c:b0:674:1fdd:6116 with SMTP id 956f58d0204a3-67df445e102mr8628418d50.100.1795794943672;
        Fri, 27 Nov 2026 07:55:43 -0800 (PST)
X-Received: by 2002:a05:690e:130c:b0:674:1fdd:6116 with SMTP id 956f58d0204a3-67df445e102mr8628411d50.100.1795794943270;
        Fri, 27 Nov 2026 07:55:43 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf6804sm47272636f8f.10.2026.11.27.07.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 07:55:42 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konrad.dybcio@oss.qualcomm.com, abel.vesa@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 7/7] arm64: defconfig: enable SDCA class driver and WCD9378 codec
Date: Fri, 27 Nov 2026 15:55:20 +0000
Message-ID: <20261127155520.358909-8-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA2MyBTYWx0ZWRfXyC/tHUYlMgE9
 dln0jGkHaToQKj9dvv7xXgmspM+y86Ez1mpO1pCCZLNHETGc6xU1n3AYgKW42noLdj3P0AfDIcO
 vHuD8XiVHTJaCwHsKPIvFKBoio5lhdg=
X-Proofpoint-GUID: XDpB2SHl39MmjV8mTB4X4FqKq5wmjxTu
X-Proofpoint-ORIG-GUID: XDpB2SHl39MmjV8mTB4X4FqKq5wmjxTu
X-Authority-Analysis: v=2.4 cv=M9fYuCws c=1 sm=1 tr=0 ts=6b09a800 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=Lb-CJUeqFN5ILZ2-pT8A:9 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA2MyBTYWx0ZWRfX5JwekrKxEvBK
 WdlkEBkENsg2cLh/nCu6I0T6fmoaNcThK/nFs6eL8rhVU0Ime2mAJeMTlIWvBhm9S3H8U8DjHdi
 oOb42i76dwq8ejf0X27V89/oqLjPKIY1BCnoLdxhwpjMDN9J3wVUegw3TmM+UBVKh1pd3o1ENv/
 6SxvbpwBm0wUhAMgMAHryrS06DMC7bJQyITz572JsnMyoPcLMCtCcI7y3eSfs/vgleM2IHk0Tkq
 BGgfXtDtpsUMd3gZcxYUru0Bw/X8VHf8qaRe2yw5tlvQQW2MNQBtb1TssSvzsuLx+B6gkVipFyt
 w8E4cgwPDcpa7WdjGm2J3sKlapfhsd+8/uWJVmk6XJC4zh1A7v+g5nCN2BjnkGv2BX7pynFWLOc
 O3+KtSVNczNrtUh2MR3j9it2jC7F6ySMMtP5xYfUS56ixHTxZxEnAPESRQGA6to7O3SBwkZl3Aj
 wwaz0R9FyDFtMR7PTWQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_03,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270063

Enable CONFIG_SND_SOC_SDCA, CONFIG_SND_SOC_SDCA_CLASS and
CONFIG_SND_SOC_WCD9378_SDCA so Qualcomm Glymur-based laptops such as
the Qualcomm Glymur CRD, the Lenovo ThinkPad T14s Gen 7 and the ASUS
Zenbook A16 have working headset audio out of the box.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 9c5b64f34a22..86b33019eaa0 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1184,6 +1184,8 @@ CONFIG_SND_SOC_RK3308=m
 CONFIG_SND_SOC_RK817=m
 CONFIG_SND_SOC_RT5640=m
 CONFIG_SND_SOC_RT5659=m
+CONFIG_SND_SOC_SDCA=m
+CONFIG_SND_SOC_SDCA_CLASS=m
 CONFIG_SND_SOC_SIMPLE_AMPLIFIER=m
 CONFIG_SND_SOC_SIMPLE_MUX=m
 CONFIG_SND_SOC_TAS2552=m
@@ -1194,6 +1196,7 @@ CONFIG_SND_SOC_WCD9335=m
 CONFIG_SND_SOC_WCD934X=m
 CONFIG_SND_SOC_WCD937X_SDW=m
 CONFIG_SND_SOC_WCD939X_SDW=m
+CONFIG_SND_SOC_WCD9378_SDCA=m
 CONFIG_SND_SOC_WM8524=m
 CONFIG_SND_SOC_WM8904=m
 CONFIG_SND_SOC_WM8960=m
-- 
2.53.0

