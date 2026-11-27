Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795794936;
	b=PwPOBDwyJ8uH8GD9SIvYxvkukAQGmijtirgPKj4pSPl3zCnuRdE3+qXKbdXnxpUFI36/
	 QrtnMGO/uzAh4Sv3u4L6STSWBxTDWQCbYgdINA2V80qxtXLAgdQ+z2vDUt8Hxz7gA8nQp
	 KTObiHLIXGc3emYCtTpHOE2X+d3C2/yF81M7+vznp3ZjmSnv/2WB00Jwp6L90Dmr/OSBm
	 kuP7B4qJ5gVECj2lLiUklFQukTn6qNnEAPQbMQMjYVYC1FfBrEimWpXytnbjc8sJyUJKe
	 +AmH01pk1gaALxcWMmzjSiFCsWYGhwcVwPlr2fd4yBG2OiaaHBrojb7XCIwRcAQbg8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795794936;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xVU1rANS7TfJLD8ub6n90SmfGXHzQKgbOewXRdZKvjs=;
	b=wPv1YzUgRxqMy+sKB+ctvDcXarnlOX8D8iyBLLqWiydGyvTmjme1XuFZloy1Ve0u53mI
	 xn0NWvP6cr4rUGjGD5haSGAjKWd/YDOzqzYPRzlMSWHwLb9wMlolkw501IzjhbAvQEb7P
	 frUk0mjTsJ80ZJ8PNIfSeahPr9zYAWaY2IZB+bqUXWM+fBSAZFX+HKmjtAdDwf8wrLh3K
	 ZGMDkVO4zRUBmwP5ZcTxLog4nn57LSU/+zdExSs3C4dk75VAN2luIllvSk2x4SD7TDnLu
	 BX2CSpMzmGqM6o7jgw49GhS+Kpz6iyABWus1hfDHBqLnH53KoneDVoRpgq1QPPDs0XA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jZawSbKF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ADjgAKvC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47631606A33D
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 15:55:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47631606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jZawSbKF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ADjgAKvC
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARFp5kn2337932
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 15:55:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=xVU1rANS7TfJLD8ub6n90SmfGXHzQKgbOew
	XRdZKvjs=; b=jZawSbKFspy/b3PpUj82sjpe6+p0rjAnP0sALoMHJ65gMgRvJ2r
	D/IOwEfootPLOLpQHvfDKXhn8ARyo4Rk2NNARrVaCsV9hlkLhEPC+Oc2fUvB6vQ6
	o+/AMdUvvi7d+SwsOnVyEqANg52EEB1BvHyza1ppkTG/3LTpS2WRfxlVxh+aSrAe
	lPKUV+oVc5zxAH1Z1Z1CqLkN4CIBlGrDh2MJZI5gBba2t7wba+8uzELT19+3G1IS
	PjcwcsKx3wjW7T2J/RR8XE/KveVeFYWGfjmzvanRKHIPDnxJGmvULLAgMMwdomv6
	1O0npLzgOrud/j2DipDQUSsFMD3NRzV9jDg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j756k9yfs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 15:55:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-949b0d322fbso1127772785a.3
        for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 07:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795794934; x=1796399734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xVU1rANS7TfJLD8ub6n90SmfGXHzQKgbOewXRdZKvjs=;
        b=ADjgAKvCKK9pvqA7f2MTn3lBqDqlcfoDU95fkhrqQU3vy7GNnr1Gc4QjtTDYV0R/vP
         mWLyRiwaC3JJp1jFpC3Cm3AdN8NoLwU4VGrvj9nxDHQvsxuOFBo81h+T6dNNkDTNW0cp
         qLXNrcQ/88t7YKURzPkhV+yaf/RDpZP5cOio80SOkeVCnWl8Bo2oNadwgbuaPREk0GI9
         yatF6hzEp5z+4JOqcFh+OMyCy3QQ3cYYxIRJ1hd2mmKYqfGeOcKgRjFgfxFtn8NLJc5J
         gWbkAbAE0FXKpfgPv++I9dX+1CCSbdBL4U0kGeiaVouWEKpN9PXT7U9wUq+BOa9lEW3v
         f1aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795794934; x=1796399734;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xVU1rANS7TfJLD8ub6n90SmfGXHzQKgbOewXRdZKvjs=;
        b=OBjSuvjObI/utJap0+LDu7lgPlLxYW8eDt9+WRS4Izo3/m2FEnXpCbsR1K5DuJ1m/Y
         uPtL3lQs5gPkFJUeyfoJF72V9cPw6UGbbu+rgIB4D3WM0n12v04mmMo/8ntwDFY51CXh
         gZj6E+7z3z3rrefAyazokwRIz2s8dzb82qIR8xZxx45MgBTeVXiMOZ9C4DyRe5uxiNv+
         2iFXJPoJsqhcn7JCDJsBXZwuULAfSCisJksFp62K0Gr9116dxxQkgVhwP491twYriZAJ
         AeBxdQAZIoZkChmDeG4ACKIzcp1tAvFNXN2rBIWFWCdYnMsCb/qNOXT3t28E7RRT286N
         NdUw==
X-Forwarded-Encrypted: i=1; AL+hErGNtxCDAwgTqHidxs7P3mYOmHh7lwGOYDfVdZlrXzs6fz+dGo0jqn5OgG0gonsNIwtnZgokUlGMZIsv5g==@vger.kernel.org
X-Gm-Message-State: APuU4Z+/E4wQx7Hq6clVwfI6wbA8tJ9jIBJZDzkOq1N8gZTl9ih7/25S
	OR8jBqoqSfJe6pFLDZNCeN4Dvt82UPHtBY3juI9iTLTHvhOwG0euTuMPa0p3XCy5XUh0F3INAGD
	yzMuH/s8E8vbTHukRcDR6JXCacF6s+v7G5DW8uucCN0KifNjz40OOKxFBQTu22IFesQ==
X-Gm-Gg: AZFdTZf//2vvwMpS2A/UnGAU0bLPIvK94H/wGC9GvQR1bizX4zpKKtcDE85bctZzS88
	v1k1sQJsAiEadnmi1H/GvhS2IhwGpiCB7j3hB5EYETtlBRpXjLtzdD1CA3r0+zypc0Sxg+uBw3p
	tqWj9nQfpp7FeZ084te7poYI3tG1o4O3/TWFqxtaojLblN4+5jxDL3o7Edwxb7agItx6lAJ4Ki4
	kTW/+c1aBK4s7SYIidB1+gL8J5mkElvhFUAT97uLZU8PMzQq7HLPf0Av2xnX6jPZZk9gfKOh1Cb
	tULB2V0ZzUhcBmLhjNSa61R2LtGv1cpUWGDbaW9CBmWR6i1WOwmeNQGlQYPrXE+FlYC9OHerQs2
	/Bm6mZR9bqEctWdG/8zhMsAB0Um6JoG0IYdZI9jW0DEy/73OlUrvVxwLJQD48W+As
X-Received: by 2002:a05:620a:404b:b0:949:7c8e:1824 with SMTP id af79cd13be357-949ba95e5c3mr4741549585a.14.1795794934303;
        Fri, 27 Nov 2026 07:55:34 -0800 (PST)
X-Received: by 2002:a05:620a:404b:b0:949:7c8e:1824 with SMTP id af79cd13be357-949ba95e5c3mr4741544885a.14.1795794933890;
        Fri, 27 Nov 2026 07:55:33 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf6804sm47272636f8f.10.2026.11.27.07.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 07:55:33 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konrad.dybcio@oss.qualcomm.com, abel.vesa@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 0/7] arm64: qcom: enable WCD9378 headset and DisplayPort audio on Glymur boards
Date: Fri, 27 Nov 2026 15:55:13 +0000
Message-ID: <20261127155520.358909-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA2MyBTYWx0ZWRfX65uJoKOxXq2Q
 T/5jynIMl7BhIhNlWaI4ilZtxJJTLG824nL2o4KuRt5OXq8hrFlWDJ38L/b62IITcDBfeb2O9MJ
 e5rViBCtRlHcxhDXVuic/dri6f8WFWadS8LCau65wNB8mSxGMVwAk+QBRy/3cK4XKoxK2wkixSF
 DtfqNVlM18KtGEv5UWrqW2+Wkq/CtU7VDRPK3L2DvNHqv6v4gGzRm70DYf/6hymuWkmGUhyf+0Z
 KL3q0g+djbL/tuTJKpuUKFMndkjqYDBoLgP0V1W79d9KiHAev2b0zf72WDghdT0kW5Hm28vrWsT
 py00K8UZJ2+f6y2X7sMqeanDzN3DCNQOu8B2bTmOnt3V6wqb6tuKw+qeShe5WUDnIHHrisV44le
 EG+hmWeIS9OKiwvvTdvuLChqpCw1i1wbmHaL3mdKgoHnYeouX/iqDCBWsUpPCIP6v+woYMcP3Ug
 DmvJbVrBJAKsdbaONTQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA2MyBTYWx0ZWRfX8E868TeCBLMI
 FP/T2x9VQ6Z7vMzzshowUaPRztyi1ktFRiPStuMH6mcfxueQsKzWYAXhXM+YqXyrGS/PeXocUeu
 E4w6uGo2qWlAy7ory8AySLjjqwwpTaw=
X-Authority-Analysis: v=2.4 cv=ebWo7LEH c=1 sm=1 tr=0 ts=6b09a7f7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=H8Vl9kw8bzbrLTmWWJQA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: wcLxXENLO-4i0AccB0QECKaKWwpaa-DR
X-Proofpoint-ORIG-GUID: wcLxXENLO-4i0AccB0QECKaKWwpaa-DR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_03,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270063

Wire up the WCD9378 (Tambora) SDCA headset codec and the DisplayPort
audio DAI links on three Glymur boards: the reference CRD, the
Lenovo ThinkPad T14s Gen 7 (Mahua) and the ASUS Zenbook A16.

On all three boards swr2 is the SDCA primary and swr1 is a DATA-only
multi-master dependent (lanes 2/3); playback and capture run through
the LPASS RX/TX macros.  The WCD9378 SoundWire port-shaping arrays
live on the SoC swr2 node in glymur.dtsi since every Glymur-based
laptop uses the same codec wiring.

Dependencies:
 - SoundWire multi-master support and the WCD9378 SDCA codec are
   already in linux-next.
 - Glymur LPASS clock controllers (lpass_audiocc, lpasscc) and the
   LPASSCC reset-controller DT binding are posted separately and
   must be applied first:
   https://lore.kernel.org/all/20261125131757.1163466-1-srinivas.kandagatla@oss.qualcomm.com/

Changes in v2:
 - Drop the dt-bindings/clock/qcom,glymur-lpasscc.h include and use
   the raw reset indices (0) for swr1/swr2, so the series applies
   cleanly without the LPASS clock header in hand.
 - Rename wcd9378c unit-address codec@3,0 -> codec@0,3 on CRD, T14s
   and Zenbook to match reg = <0 3> (link-id, instance-id).
 - Reorder properties in the swr1/swr2 overrides and the wcd9378c
   node: standard properties before qcom,* vendor properties,
   pinctrl-0 before pinctrl-names.

Layout:
 1/7 adds the Glymur SoC-level LPASS glue (RX/TX macros, LPASS
     AUDIOCC and LPASSCC, swr1/swr2 controllers with the WCD9378
     port-shaping arrays).
 2/7 enables WCD9378 headset on Glymur CRD.
 3/7 enables WCD9378 headset on Mahua T14s.
 4/7 adds DP0/DP1 audio DAI links on Glymur CRD.
 5/7 enables WCD9378 headset on ASUS Zenbook A16.
 6/7 adds DP0/DP1/DP2 audio DAI links on ASUS Zenbook A16.
 7/7 turns on the SDCA class driver and the WCD9378 codec in the
     arm64 defconfig.

Tested on CRD, T14s and A16.

Srinivas Kandagatla (7):
  arm64: dts: qcom: glymur: add LPASS macros and RX/TX SoundWire
  arm64: dts: qcom: glymur-crd: enable WCD9378 headset codec
  arm64: dts: qcom: mahua-t14s: enable WCD9378 headset codec
  arm64: dts: qcom: glymur-crd: add DisplayPort audio DAI links
  arm64: dts: qcom: glymur-asus-zenbook-a16: enable WCD9378 headset
    codec
  arm64: dts: qcom: glymur-asus-zenbook-a16: add DisplayPort audio DAI
    links
  arm64: defconfig: enable SDCA class driver and WCD9378 codec

 .../qcom/glymur-asus-zenbook-a16-ux3607oa.dts | 139 +++++++++++++++++-
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi      | 116 ++++++++++++++-
 arch/arm64/boot/dts/qcom/glymur.dtsi          |  98 ++++++++++++
 .../mahua-lenovo-thinkpad-t14s-gen7-lcd.dts   |  84 ++++++++++-
 arch/arm64/configs/defconfig                  |   3 +
 5 files changed, 437 insertions(+), 3 deletions(-)

-- 
2.53.0

