Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795418744;
	b=29qVuYFETwcIP09XAJHFNHBSFXpQnqTTXsG5+x+V1/NSCKRpVkFQzLepUY/qslU/JPbL
	 6ne4uMwA2H4Azd6Thj5A1dPzBACEK8AP1jwOWE6G4t5Xf4nHyDQsVdRk4WTAjSzhsfP8s
	 Tq/mUKpdusR2O9w0VZhTmX0YqajG8hS6oY3ObDeoW6E0pxEfllE5Ova6ACbPqfDVV0Z3y
	 2oicvmrsHziHNJ1UT/6m0q3anB6c6IVAsGlMdMHu2I57NXva8YWolPQUNTFSReGx1mBbx
	 Hwv+XiXMcW7ldZxZRxEIdZRLgc27tcP7KeoSNw8kMPwCYGbp1bawZKRSlbRjIDEvXZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795418744;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Reinject:X-QCInternal:
	 X-QCInternal:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=s08+GK01Cwn1UXirVyL6csXyXWfcfEWLGOm9rhHXJIc=;
	b=2tIFw3r+mNzCwC4sbnZjmjxl5OvopsOLbS3llEps/jW4FNEn9Oir137ckW2XWtb/JmKX
	 KnWh7UnsNid0fQxwGLJtwGbrp25y26KnSj+TrFoXqE4xKVf7LISIOzZCAOHeIGkNjSdAb
	 TmUTkdUXtaws8ZlScgyWfpKICGa0VeRimBMmBtk4uMUPQYKfawECEK0TucoyFS8Z+cqYd
	 Y2+zv9H5cdfakP9sB+LVCgBDmqhlbvZTD5uQvj8Qm/eBjv+nSGXvXfY5FkkD/ZEkw59uH
	 AXHEu614x+yvh1WwW6Pytc2i1eGUs3cCCaY/g9zmfuVcF9lQzs2x4aaS9ILIyQUkm1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="a/Ygf7+i";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13EF606A321;
	Mon, 23 Nov 2026 07:25:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E13EF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a/Ygf7+i
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN68xN92372262;
	Mon, 23 Nov 2026 07:25:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=s08+GK01Cwn1UXirVyL6csXyXWfcfEWLGOm
	9rhHXJIc=; b=a/Ygf7+iGQpdYojcgmmx9if1d9Lq7LYfF5GYOwTvLr9iWI66OMn
	Efd/EwUCQWabMKJ9dJtVvIz46zFPweubmYHs0ftXO6E/usIVigVyPliHkpyHxG+w
	hPiSM2qMJbCy7T4wm84g7VfL63Rdw7DEL/QS7AuoKg55z6cx6TQaiYZjxdunxPcl
	dwG9B+VX38qE9WGTclkHUEAeNsZ/SOgqg75svW9WcQjqlOVjmQNwiPVgFJAvC5PW
	f/V1nIitGfRZeVZdWROkUJYJJw2MbEf1afH7CK1wWYByE7ov4Uu/hvcS1kPrktE/
	RCfyvcZEI0yXzKAAEdNWMOlRgSeyo5tk1UA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyd08hb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Nov 2026 07:25:27 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN7POnB1919440;
	Mon, 23 Nov 2026 07:25:24 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-ks5-hyd.qualcomm.com [10.147.255.18])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 6AN7POfA1919429
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Nov 2026 07:25:24 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4763723)
	id B0A56675; Mon, 23 Nov 2026 12:55:23 +0530 (+0530)
From: Karthik S <karthik.s@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Karthik S <karthik.s@oss.qualcomm.com>
Subject: [PATCH v1 0/2] ASoC: qcom: add lemans-draco sound card support
Date: Mon, 23 Nov 2026 12:55:20 +0530
Message-Id: <20261123072522.2358819-1-karthik.s@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: bwOZwwjDArEq5GsGo-LROnKF-5wfUVI9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAyOSBTYWx0ZWRfXyihvv5c0ohJw
 D2tWDwWh5oJo1L6okVljP4ijr9QYKw3Vb+2fhHdYe/mtIq0Y1O5fNxtK5tOTOf3CtLkcKxPIPfd
 Mq19iyoYQLvMChOu0EfSRXYpZuCPsLD8CpMuUF4IOVg/4ECzuf4Yql9GGv+n2mFZiD8MZs3JNWn
 xlkWOGzcQeQLUbW4v8QUmBx+UqWnbXLae6PQUzOmqB49i13xvrhTV/2gfmJLEIBuvNvepBzCjAt
 pMLZVBfYtvditwwvU9snEyO0txng6sjuSYX7n34KwkIBkeEHQRgvYG0frzmqJ7gmLLrRrJzlW5g
 palV5rmRe5upgpVY1h5hG2ysbwRry1PvFpU6pnUdNYaXv9FwlhB9kiQY6S7UnXQvrjxf7EuAuBe
 4vuHpdTrxxvrLSYXdraJ8GyxKwJ50LYnO8Th5nIDCJYQ6fEv8OqdzKzqEwX9jTGJvuaUfFHGgJj
 KkCRtwiOiNhYYo6w48w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAyOSBTYWx0ZWRfX3f9PucF+IeZD
 XmB7WYmUsu+ZQKOh1d69SYG5gaR8McgcKp/UPmM9Keo61ykqQtBmrMgqbAeIL489X0AQGDYj0Aj
 VClC8bWfTCGBWEzI5XHdgiCEABOJf3U=
X-Proofpoint-GUID: bwOZwwjDArEq5GsGo-LROnKF-5wfUVI9
X-Authority-Analysis: v=2.4 cv=Aol7T+9P c=1 sm=1 tr=0 ts=6b03ea68 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=nX8pskL4YJkjoo46g4wA:9 a=zgiPjhLxNE0A:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230029

This series adds ASoC sound card support for the Lemans Draco EVK, an
evaluation kit based on the QCS9100 SoC targeting automotive use cases.
It supports playback and capture using the MAX98091 codec and va_macro
for digital microphone capture.

Karthik S (2):
  ASoC: qcom: sc8280xp: Add support for lemans-draco-evk
  ASoC: dt-bindings: qcom,sm8250: Add lemans-draco sound card

 .../bindings/sound/qcom,sm8250.yaml           |  1 +
 sound/soc/qcom/sc8280xp.c                     | 38 ++++++++++++++++++-
 2 files changed, 38 insertions(+), 1 deletion(-)

-- 
2.34.1

