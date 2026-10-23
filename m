Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775618;
	b=fZi8TZwDKsjkp2oVqnJrV9FGqDWlw0i45Jn7WIzwuu9CoNC2vjkUCENcxyaa7J02yIqG
	 NWxkcSAiFc+DhkX+2tHH8GQ6ubrxNiVgm9UcgLIuQTaP4TrHdy+MHPnjLcluvJx02iVZy
	 kDeVme7eNR/avk4qd7tz25EgJv9uf0y2MKrPDs8OPNnTkL3N2JMYBuvuo7IgXsU2b5xM7
	 TJJ4ymo4v8WwvZ+0CtbQlwI3vlOFQzhsFgID0uk4iOH7Q5d1OmimKZmj/4fZ4J9HTKa7I
	 ax3XJWnMhYFNA+5K4pa1R9ZtalYXgNxUGkFv1mo4YRiy5UR+9pMZhUaAQbpuZ51ThGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775618;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0KktU0YK7m1nYEceS5jqmj/hH37F3E8VJWvAd659eCE=;
	b=m6nQtZ/GChfW0983M4ZP2qQn/YTRngvkrZydXhD7TglI1x1KS7AYkL2/4FCuNW06vhbH
	 MJTlIrs2mhCIOR/t+xnmqL/MURngsZ4LG/6bVqNSEmQqzvPKSw1TUR+yT1dkJNJgY/Feu
	 PcO3m3SAR79Jddzb3Kg0sjvvZHNSW8f/TaDB/YbpEwcLEDMD43KBTV3GF8rAJt4phpKbj
	 HEqPCea8r2WtxwfzpYZeTNOpiHwjnsKKM9TFdx5UisM8X/3rYzVrCqjYIp0LvOa0DPBAa
	 PHCnIE+XEJMQDhWwG0LWCWDbKCxHGSFDr9XgZUEjOjLyc+Kymmkd2nZQvuW6usQIHRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="DiRTT/9r";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IxYuVicj;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C133606A327
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 17:13:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C133606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DiRTT/9r;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IxYuVicj
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE5wTG2109216
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 17:13:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=0KktU0YK7m1nYEceS5jqmj/hH37F3E8VJWv
	Ad659eCE=; b=DiRTT/9rC9jF3og6bW5vdTTBFKFT0N2RlPAn4SJRXS5Lh/Z78ID
	DVkuxm42xTrgUacl4kTlnpXEJpXVNUNVvPHsvWDSw+a5ppgz4FR4oagPu0QfyoDb
	xkvMbsk9ATu761kyOvP3DTiQapl2XiqzTKssijE1gTKUuOUFTFg176edY1/qgpxl
	fxERIkU/VO6AlSQ/YXdCZx8hPlHUav1M41K+3wx3McdlD/3xrpJc1WsGH6dDorhx
	eXeQt7+r9kFWrECAZZO/0giAokfcUPON9Ou4LffhQfjxjhUwYq6lZyQAGChCNdpf
	PJnxyRJA07JUo4oZ+/5deGDqyZ7CyP+hIIQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqms4qay-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 17:13:31 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb71b1443so228149185a.2
        for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 10:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775610; x=1793380410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0KktU0YK7m1nYEceS5jqmj/hH37F3E8VJWvAd659eCE=;
        b=IxYuVicjOjbLSyDIn4pw/XgHL+hsyZ7ne0xrjPoD5wkLzvU5sChhFyUFGbZTDRc9sX
         uRhkn30jaVoWNGXkP21YXCaolPKlLcieQo35Y+uhroDAombsA3sgWvL1Q4Mrsb43qCF1
         L7lM8ZrxEePgBnLW5dVNe/A1bw9XKkPaJRhQrxXxRyELILj2vrb70FssZNzsk/Nl8ks0
         9cgzPM9PDwRj8vxAdo8stxHa9kmC7n0upB9EzcHiLJldY1UyNLu1/Er42iPaJyeNOMhs
         giS+3GvdasddtiXYzBhigm45Iw5ESRBKZDBxvnkWOQGhNSxnoqQFrcyK4XMt6VSxmpGw
         b1Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775610; x=1793380410;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0KktU0YK7m1nYEceS5jqmj/hH37F3E8VJWvAd659eCE=;
        b=xxTnNgO+uTAidYGrgJ+GYdPybXrGKYwy9gvdZexTkjl8rwZFZ/voyrsaFWmF3az3Js
         ss7HdiBE4pQYQ39bo4DbH7Ej78Y2KsURkP+mhQvPcyY8MOsb8YWV7YzKb9+GyoRYmZFu
         Igl7p6Rn7tRjGFxXacOuG57pQr0TJqRr1CM9MWj2tWYf0VlSsXe7C+oB+yLuTyBvNMzd
         MQn9feceNgPnisDmEa7AsDzlEXeFWBP+l03i3BK0jv48MG4WFg32Xg8qK9az2I+my26n
         k5Asd4od0fC2aRFIedUinsw7RtySrYl0NBR+XcGQAFTlL6flaM8L2+UuEBlbz60QzHEq
         /kjg==
X-Forwarded-Encrypted: i=1; AKwUvBz7wy/JY5hFLfKJk5KtvKapW0Ea+ApgSn4MzNZgVyNQtp9PvJJGm8yo+YiSImORDSOmIRgfXL5ccryquQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLkCExaaST+Tugcn3oW+X4YzJmQ2lAyGpHkAqqpQcNfW+4t7vQk
	fkXNXI2VTnQHwuNQuGfeBfjlrRcLlnb8emS0ZOHhMYcXZdcjJTTj2yxK/NUmKcjt8P6ZyzWuxbZ
	s/ZHqF4TRP+jqJ82kXqV9X3FLxlDGPQNpyCrZcrv7NRTNKAaCT7yM8R+EgLm77+0AoPuHxVewFg
	==
X-Gm-Gg: AYBFou1b3gHheH7xTV+50/Ul3fGav7BFsTnUK5BK2QyOWFYq6WA5R9mMb3pf50XQ4hH
	Cwkp+7NxXSmhq0LXmLwhfYLDwAjBnXuKHkvIQmkOEh83C4JnGRPIJiJGdyKOdWnjFkVnWH15FUM
	QXUpX13GHcbcrHMyoX9fF+TmgIFojO7GYD3UJXC6uCtUKWdlWLdnYa+behG167FNTOM3gnywDUc
	kDSRT9kXubtTTJ6PeZo4EdmpfX/3MopvAf8VezLgAPCZK/p85CxU4j1cPSgksLtrlnSkEt4bPFI
	letWJceTsIt+0WBNxBwecSbZeOQHK7d7hEb88wx3J+bq4jgJtaNK9f+mPAod/WKEQnlOrrlnYw4
	Mj5FvjM3xGtCw
X-Received: by 2002:a05:620a:1d09:b0:93e:9292:1b9e with SMTP id af79cd13be357-93f6f570994mr507406185a.1.1792775610400;
        Fri, 23 Oct 2026 10:13:30 -0700 (PDT)
X-Received: by 2002:a05:620a:1d09:b0:93e:9292:1b9e with SMTP id af79cd13be357-93f6f570994mr507398685a.1.1792775609670;
        Fri, 23 Oct 2026 10:13:29 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d4104b5sm1043841f8f.36.2026.10.23.10.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:13:28 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 0/7] ASoC: qcom: AudioReach and WSA88xx fixes
Date: Fri, 23 Oct 2026 18:13:09 +0100
Message-ID: <20261023171316.819857-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX2UoedykP5tF1
 /frufBGs0FTCHC0NWTttZjo1atYlErLmDEkdVLU4n312d8cZpAjXa5wmTyWYfZZTghw36GjkjJz
 K2YbdsUiThyQzzPOUpVciMV3BYXw64E8oNRVbtg1IlTyxRLdG5vyknmEa1FOv9JMVux63xB2G2V
 H1lRZcpj1D2N2efAkD7xzXVQB9s/58Mt7cPJu/Kwzo+o+eiiRYEfbVEzwM8VmCl4Vh+3HkEhfPS
 +Ly0fjmmHOlyoItJjG9FXn0uH5WS05WpaWZWcjsziCHIbvbixcmwJR08feRYw7tGRPZv+L+P5aw
 TikFtEX+yQmj2J3/7LkSCno5NcjEXsYoBb288x9gU7rXvFOTN/4KgUqb7I4SckQPdaN25AC0i8F
 G1hjopg0w0LMQ7Y6b2vxzC5HmUNjKi2UUiudt4c44IBFGr98K/IXxmIy+dIPy4KvA6Ds/huOzFX
 vlMx9gjEiR7oqrTw5wg==
X-Proofpoint-GUID: w34jaeiddKEGlLm0hf9Kuv0-JR4YFWg4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX7OkKNcH9q5Dk
 0gm6AP3hX5eRw8EnWjGABj8KL973eTJ3sOTt7am7zc1kyDJCC2bQ8ur6UEDhy7ab3IQrlIvfPQz
 Km4nHPvwTmrmT8vWOunzEd6JdWpgY8w=
X-Authority-Analysis: v=2.4 cv=UdbE26SN c=1 sm=1 tr=0 ts=6adb95bb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VY0Mi7k9gUTMOwSAwkAA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: w34jaeiddKEGlLm0hf9Kuv0-JR4YFWg4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230067

Fixes found while bringing up speaker protection on the Lenovo ThinkPad
T14s Gen 7 (Snapdragon X2 Elite) with WSA8845 speakers.

 - AudioReach: the module cfg blob size was used as an element count,
   so the allocation and copy were four times too large.
 - WSA88xx: speaker temperatures above 45 degC were rejected, runtime
   PM was left enabled on unbind (NULL dereference on wsa884x), and
   the VI sense port carried only half of the V/I pair.

Tool use: an LLM coding assistant (Claude Code with Claude Opus) was
used for some of the patches in this series, to debug the issues during
bring-up and to draft the code and commit messages.

Based on next-20261022.

Ravi Hothi (3):
  ASoC: qcom: audioreach: fix module cfg blob size handling
  ASoC: codecs: wsa884x: Fix VI sense port channel count
  ASoC: codecs: wsa883x: Fix VI sense port channel count

Srinivas Kandagatla (4):
  ASoC: codecs: wsa884x: Accept temperatures across the full trim range
  ASoC: codecs: wsa883x: Accept temperatures across the full trim range
  ASoC: codecs: wsa884x: disable runtime PM on unbind
  ASoC: codecs: wsa883x: disable runtime PM on unbind

 sound/soc/codecs/wsa883x.c      | 21 ++++++++++++---------
 sound/soc/codecs/wsa884x.c      | 19 +++++++++++--------
 sound/soc/qcom/qdsp6/topology.c | 31 ++++++++++++++++++++++++++-----
 3 files changed, 49 insertions(+), 22 deletions(-)


base-commit: bd1ecbb61afefc6a8b876ccbc31e9228b44e9eab
-- 
2.47.3

