Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792481964;
	b=rKfiKwE5Q2vw+h9l5DJZGRhodWWa+jrfiYERwEtyza1Hxisyly21oiIjdDpemRteeQ8S
	 YghQ7qP1OMyRhdih/JV/lqQ9IOIqDOfb0Tq7cLToMkAV4VRYwQOL8Lg3Wb5/ixO4k+10G
	 1CkWG2fsHUBIj31DbMMpcAcE0pNehFYGU5F1P9c2ukCAHSKl/ltEMJCVtiTtLo7cLNsuJ
	 nStmnd0Bgre9zcZnnVL9o5RyOLAbIEnxqQMAipB8+Ucy1nlND/CaV9V03fy2VoJq5vRgE
	 +9Nj5sdIkn3n0jFQDo8NAJ3PI6aIfCVBRuaqSJDFlIMqwv1Vrye99n+jOzMGAKBJJgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792481964;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=u+NWBmXiXBL707eUK7wLUNS8C0nG+19FKKE94ew9qXw=;
	b=vIRT/NB+pUAmLjZOVPsxpQqtuHqcsLPfRxkN3lwvS99GhTo3CKVJdWUQLoiZDOGROMZP
	 Sh9zP1CyeKeJzB/3YahytgOO5Zmj3wUOJ3Xa1N9UfmWH1wJcr09E/WzkUMYbd+tQQfoEo
	 e44W+Vu+yEvysovCmcF+eliPVSow/F7dwwbjInX696dhcUPz1CHK4/7TvJeQLCq9g8oVt
	 Wngin/3hVQmJpbyDg0MsWD8YVJAAe9JEI7OP/OkwxnETwnf80mLqMCltUm9vNcbOME+nS
	 qULHncRprtoyc9gtoIS10nyIJkPkzOho0LnondMzTt7+a+wTZ1ZMzbULWVgarIx17hQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="D4tP/Cr6";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=clSDPfVd;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B8B60A2608
	for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 07:39:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1B8B60A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D4tP/Cr6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=clSDPfVd
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0t3Bf1253890
	for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 07:39:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=u+NWBmXiXBL
	707eUK7wLUNS8C0nG+19FKKE94ew9qXw=; b=D4tP/Cr62K8ELIarr3dIBcU2ORt
	D2deI8w2yCFXNuRSDgZfAEZBQDyZmm+K5ZGjIn3lQZA3gNSEI+KO1/gb1/YPcdnK
	y6B15NJtfD7osEb0wZz3roCmLUtPwGVH9f2babHcD/sJ6GYHVGeqyu6odmnPa2RL
	PUbad1Lpi1udf/ekGLOHkd8RNOIMpjrYEManWV4C+Gp43xed2SAhjKaKfamVHqqm
	oJonIdw0L9gG5z8tx3HyJyWg+yOo5jA2dBOflXq/Q8eBvFq2K8iitV/duxI4mbl7
	VmfMvoKJuQEwG1Ao767ZlHsti/lp0dxZ2hETOouIna3RZeJ2yCFzIE4TeFw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n9e1k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 07:39:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f32050e72so864839185a.1
        for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 00:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792481962; x=1793086762; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u+NWBmXiXBL707eUK7wLUNS8C0nG+19FKKE94ew9qXw=;
        b=clSDPfVdM9fGCXGIMT1EZ7nNgJe2/moXATFmSLJzNHCec9KB221KvsJQJuRzes6gS7
         s4EUD9FDbVD9QGMvJiXpXckr3TpkPPl9FDzH0wa5MyKZGUeAH+zpum9a61uNrXR9BV6Q
         uMG5OqA/nZHSpLkITLL5D/IM/Dkv6gXasKptKNwNZ2wP6+pqL2ECTXuDU6TqQzUA9GqI
         fb2TjfBAjbPBo6hDYGbBDLBTx6PlKP4C635Mekk0jKnwebqz5tIvXXFm2+76GBqFKO4h
         ArqPm7jov/MWVQkr0867ZdR7xl01hYUb1PaJXA9cdo4wa4pEqSfQyzBcTwS3NmeM7ydS
         7YJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792481962; x=1793086762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u+NWBmXiXBL707eUK7wLUNS8C0nG+19FKKE94ew9qXw=;
        b=OVcSIAaE7mpt23k/YPlMRoZvw9GMEvuDPmyJUTQxfRYfuqYffujHfxjjVFPwGtOpPy
         XM1o6UW2eJ8HqT1erF5IAPEaKHbKkw1A6W7ciRHcCFHr+hdpZtIsOu4JkFcYkcYwHQ8c
         IO0jv0QeJJh/SWin9eoBsohkPTRT3Ms137LMnQseeIxzjUy0Z4GGw0XBOOHa3TDZ/Gh+
         b5sYk37YSOfOzft9O/seXUcaUqLxQVMHbeLhZrSz6N03mPtdvIwt6sZEc9c7AYxnQ0hL
         Uedx6qO2zuIRNXOlp4Z5tFPxuX4/4mpUUgvy1dsSAsTM+s8d3njUH60zpsnuWJ0MW+l2
         40dA==
X-Forwarded-Encrypted: i=1; AKwUvBx0iFWEatChKCjw8c3mE+U5hedu6iaMLOllTsrpt6ENxI+2osgowpkzmLCdkicz3jIlMdCvH3ninee55w==@vger.kernel.org
X-Gm-Message-State: AFq9FYK1SwkU1txgwZJS1GZGs6f9K2dfCW8DZctY2JH24I7Z0PNywhu/
	yZw8VBeeu+z48lJxhkeCyLOZMxiNgyNHNn0gzm71kAlVheIzRWI2LNdJLCpoIcVCKhYAQvJtGYg
	YLzzLMuQd0Fx9dMfWGFcH4EuvsBcghdkkmDTYcN4yHzMYB1IG9W17N8/phx+yLFrB+A==
X-Gm-Gg: AYBFou3b1AjGtP0uuxE2zKW5vcQy5eI4g6AG39y4OHfH8FaSBaSFqSIw2wtmBkWDtiC
	Vep7BfF5SPOjFyWPAS3X+e7nKEDpGgG6ys3Z9+y8Vde6Zv1IDNnFqf66XdsD50S/r7ZtSfD2VQH
	a1dtCfxL+6vZ0dMfhBdrN7VGNaCsfvA8Kq70/bMfwlz1SD6DKIwYjxaO+t3jOH4elQgYdGyOGGz
	e2Te3QOsw7Rqq1HTCqbBLSzvvWtiaVWA+1DJpXiNvYu3TVD5Q56x90iGlk4JaqCXcXd084DLRXr
	Sb3o/iTr0sIZ1R3+9945plw3HB1ye7u1J4Zx0j/kRUHOtnZq0aLB57Qr//iXinwkPsxQil2pwP7
	lPXUr3FDQr+rQ
X-Received: by 2002:a05:620a:27d0:b0:93f:23ef:d6b1 with SMTP id af79cd13be357-93f29dc1c0emr1816093985a.72.1792481957483;
        Tue, 20 Oct 2026 00:39:17 -0700 (PDT)
X-Received: by 2002:a05:620a:27d0:b0:93f:23ef:d6b1 with SMTP id af79cd13be357-93f29dc1c0emr1816084685a.72.1792481955561;
        Tue, 20 Oct 2026 00:39:15 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d8208e0sm4566271f8f.36.2026.10.20.00.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 00:39:14 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Sanyog Kale <sanyog.r.kale@intel.com>, Takashi Iwai <tiwai@suse.com>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 5/6] soundwire: stream: skip bps mismatch check for PDM streams
Date: Tue, 20 Oct 2026 08:38:55 +0100
Message-ID: <20261020073856.1177749-6-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261020073856.1177749-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261020073856.1177749-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: DAKFw_QqhME2gOOPepFKwmnEX0xfoDbd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMCBTYWx0ZWRfX20KYNb1aFepB
 Tqbr+vwyLoNxrQUpF6MssLQCQh8IedZ0Tpj0sbEYVaF9g6SOG18mwcGiVQ88AujLDnK/oo6WPHL
 0tIye2zQCBKCWG0No6brv1s7URtZvBK2e0pw3wRAU6tcXUQ5l7NtZn32GaRVEu56EV4qgw/BfNX
 oxLlgH0CQj2eLxokAooO/nQmTtjreFrI+Qit957edEEqHPPJbkRhZLbC1P88cGgJMLAJnzQ5Fpj
 CA25oeJh432idTjoEQs4IRKPy58E26Ea1pK7ONO0EgJpffkJxPlyQsxPCY4U2IQWgIMuAzc7gpU
 2RnlYmIWRD5wDLQku+zA8vuDmxF8LHjH2n6oF8iShflsg0lZ0d4cOpcCTQXDJncsKy9PC7xiBUK
 fkCV9qIyJmOQhKvr8xQ/KxcU8nYxWLTwlzwmy10eDpAeRXu7I3iBu38hRlMmQOp72eBYvcuGisE
 vxWw8lIXkm8BYvK+IyQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMCBTYWx0ZWRfX2DSfyqN37vha
 mIbgcRGUnVChHBsOXsnZDnfSb2ptKp3FLmpr3WhfdcqMM9929L075b7QRhVV8zJwLau1JeLNm7T
 7E+HhGbYSB0PDhdmmPe8WZeuZQY8cPs=
X-Authority-Analysis: v=2.4 cv=VI9IDNPX c=1 sm=1 tr=0 ts=6ad71aab cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=t42oVSYFIGZoS8p1b6UA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: DAKFw_QqhME2gOOPepFKwmnEX0xfoDbd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200030

PDM data-port terminals carry a wire word length defined by the
stream payload, not by any host-side bps field.

Skip the sdw_config_stream() bps mismatch check for SDW_STREAM_PDM.
Behaviour for SDW_STREAM_PCM and SDW_STREAM_BPT is unchanged.

Assisted-by: LLM
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/soundwire/stream.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index 0b00fcdcab2d..31db368ba24b 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -1374,7 +1374,9 @@ static int sdw_config_stream(struct device *dev,
 		return -EINVAL;
 	}
 
-	if (stream->params.bps &&
+	/* PDM streams have no stream-wide bps; skip the match for them. */
+	if (stream_config->type != SDW_STREAM_PDM &&
+	    stream->params.bps &&
 	    stream->params.bps != stream_config->bps) {
 		dev_err(dev, "bps not matching, stream:%s\n", stream->name);
 		return -EINVAL;
-- 
2.53.0

