Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775630;
	b=4z7h4tDKX3zkfiLA3GOiJTSI+ApIGfDbPzYF6lcCetlGxBvAu5QdZvgem4KeasAiIQir
	 Uw188w5GaHQvVAvXzDe7Pdcdf3JzbbcnxfZCHNc8py+ioxk+lmwKTWMzatBxD+TxpNbd2
	 EulnimeH/TTdpuVflsau7dDaR5+J0RVd39p/AHgLxDhZuMGdl9PVphSz0yWQOBUXYwM5F
	 +7d0c2x3CB5KUIcZsteBlRSDDuC+Qr0e10XsT2RJpZN6Fc32aA1aqXzuWBBlv3qkV9/2Z
	 GI0y+q1b6Cj2bSdNqu9S0yUZ/8XTXF4xgFr7el7O7Mcm/mBDB2Ewk9/vUNrv1swpkTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775630;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Q7CjwrJ57Uxft8mucUIc/DikdBIKR1vUoHFHQH37p7I=;
	b=hn/ZmLYoKRSA/Nu9h+43QIwqtbL6BkMO9yR/PjnITDuWZIHdAoielB0IbSprA+ny9MxX
	 99nx9zUuquiLRGNkXqTfEdfM/GY78WYVoBsgqm6jztOYgD4FI3kZqGdOS2C/K5PvJW7b3
	 /Av8QL/4mk4wmGHsTjqh2RSsljsKPaNZd4jeelbbkr7sXt2H5i13CiVAVQsXdiu3B1RZE
	 nDE2NugbmeBFBvtavqyiNfvOtX8jIOfog1qgS8a9V6lF044x3YaA6E9sGHYuXeKeswvNj
	 QexqYFQJBVOQRLwyQDEMz4cOja7gxfK6lqTBqKkc/YV5BXxRpMCUU/hHDqWWPcmAkxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bh7L4SK1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mu2TudLt;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1EF606A31E
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 17:13:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC1EF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bh7L4SK1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mu2TudLt
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NG3rBo3812282
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 17:13:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Q7CjwrJ57Ux
	ft8mucUIc/DikdBIKR1vUoHFHQH37p7I=; b=bh7L4SK1crVSQ6iTSKD6MHT394T
	QC/tYml693U6boFdRL9jMD/RLnScMtr/+6TL8aJeSnt6WgjkCx4caeW52c6SyPjw
	QIxs2QznkN67RMMoqQiv27lwo85yJdd/x4pK31mK/rxT3JzcroSyhqydCkUi1oz/
	38A4OUZ3rcMOyXhPZwKWD+t5/LfsKp+OV5yF59Nc4M6nURRdYKp5Xv+89V+znZtG
	iB6PGZLsCZxqq5cqoEFMtKxW7I/eg6USwpeEkA8YmmzIfTGUrYN0p+m5LvxprlCv
	7eeWRncT35Aw5IgN9QkoLKZcfz8wbHjhZ8SuiNyY8tM26/H+e/xGji3Cw7Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgas888k7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 17:13:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93909014c85so220402285a.0
        for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 10:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775623; x=1793380423; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q7CjwrJ57Uxft8mucUIc/DikdBIKR1vUoHFHQH37p7I=;
        b=Mu2TudLtfAqRCKDhf+dDxfKn7WKIWVZdALD/brqlrUX4YMzWrhF8k0AkPC2oNl7DyT
         HlKQLmJwTF1FQ7dPRlNE+2Fa8a2PlXKRldAcLU0Eo8srxeHxBCStK97BQ581FmJ401Fy
         4VJz8aV9swA/vFtSTior6kqU3aLhL0a9pL1DCixz64JviL3L44AI7hLgwXW8WwRp8igT
         cM840ZyI0dPbsQH58DYoXJ++NgFo3pFYEtlzWWYYE7LJRFphdwsR73fKAuUdmx0shzNG
         oRFzans6A46JMvifyufuTBFHaD73p7KRGHU6kn+XrcglTA0IG/gRjvZrAB6N7kEmx1oY
         T2CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775623; x=1793380423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q7CjwrJ57Uxft8mucUIc/DikdBIKR1vUoHFHQH37p7I=;
        b=0Y2jgwNV6WrW+n5BgxjQzIvOOYq5IZB0FVpveUE2XjZCwFCp2mpYdl/T5EZOQq18zo
         IlyRarjluPCLCqJvZwdQ2rMhPTXoeh6ZboEsvwVZlXnKqLGaspg0OgIRUm05P09/l9+e
         uBfIjru8Pt7yy76oxjLcNJp4oykxFP9kKrWwWAZEYNzsB4FWUcremK1YkPDqHGsGutiU
         Xhw1TMqWb96j9nuYONWXEwOrEaFPnLxH5BTjG63aKjCMX6rw9DMCBohfOKHJAju/98zV
         CCjnkKZyQyxDHZQs9NsU2TgVGDYHuUso9gLsZzjYND2gOp2NmAu7LwFHjhgD7g8idqG/
         9Uiw==
X-Forwarded-Encrypted: i=1; AKwUvBxE9ahgxVJgAjhDaU643gSnQU3wljLufDg5w3av+7TMNgymH/f0hsbthPI2qhthMePVQfuQJZJQPx9KfA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKEWfAUHPcGxYBl5iKl8Bgm/1b4RxllTPaUphs8/4otFdb+RFTU
	61TAVhPpEvFZeDfVpCpA7r1p1ZoSNLhGnarYHcwiXxyUE/g5ttQBCuKhtph1b3viofGNIiX7uWl
	3ZqWnx4T6ZIA8NesRcErT/WMg9s0M/caaCsXT6ufJMC/ykfaHH5tWgt6dmNg+f6oBQA==
X-Gm-Gg: AYBFou0Q2sCGpkOJYO+/fQUYxX4w5Eplk2YvjJ3AN/NaFktqzNv6Ug4lVSmflbjsgfL
	y6+QYE+SBqi0Sq8N3YHtORQUjA+VPERUst0gNpjq10TaBIr0bmUdwddN2sqx11k32e9xhsWMBZR
	yacDdWvE0Pul6tcm+46plpTnFutLEY5EH5Z/lAV44yFuy7kiAd3F2QiD5qLBIPz4mt4os8Zy3ix
	fWfNqRkw+vhIU27rs1xr3E3QqU0Veu1pkXNXEz6Sgvw2pm+1IUKjAYW4yDHxhPLsaPIq3tdR9bV
	CfM6RFDjw/LznE8QClUqa4BAb/bXEzadCi4MONwvdu/rwEyQWfVKon1LFiEfGYJohnBfnwscKWs
	jrzP+QIU19wsc
X-Received: by 2002:a05:620a:6601:b0:93e:5fbf:a41c with SMTP id af79cd13be357-93f6f7871d1mr471331185a.16.1792775622960;
        Fri, 23 Oct 2026 10:13:42 -0700 (PDT)
X-Received: by 2002:a05:620a:6601:b0:93e:5fbf:a41c with SMTP id af79cd13be357-93f6f7871d1mr471325885a.16.1792775622434;
        Fri, 23 Oct 2026 10:13:42 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d4104b5sm1043841f8f.36.2026.10.23.10.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:13:41 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 6/7] ASoC: codecs: wsa884x: Fix VI sense port channel count
Date: Fri, 23 Oct 2026 18:13:15 +0100
Message-ID: <20261023171316.819857-7-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261023171316.819857-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171316.819857-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfXyeW6jYAEMX46
 4wMqTREOPDUWJQx61HkQUXUCPXp3Z4nzCbKrOnc7exM2mR30HTwwFVCmXkgedQAknd7Vfum631R
 2WSbIy+aQHKRgRKcfZancBELzOGW1uk=
X-Authority-Analysis: v=2.4 cv=OPqyTiaB c=1 sm=1 tr=0 ts=6adb95c7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=nTjqRRZ-t28jT2G9NSIA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX655+0ld0vUkV
 a50pHWx/JjqIeLEVv4pc+N8ROpXs6wEEU1a1/XgPGVaAC05LL3cMbnCQY21E2CKxNwzjncsr4dT
 bb24yiYxEa+UchuRoFNO5DxfHEtUxdjNo5ASzlt25tqGXmR3JAZyB0k7lfbhNpXLm4CPWsF01dr
 By0qNwQ5Des7uQollDchhcQ4JQC+kHXTBYETDmpV3+YGg59IFkHzT6AEUM+y8D87spCi93yBIYs
 MIT9Y+o8FHGN3OswaI0ap4GZP8+Y1EyYGT2vvm3KBwsdPw1206xpdZZh49WMf9pC9UoZvSgC8Z1
 s5bDt5xMyl63uxsvg8KbFMKdXkxwqxL1OG/tptfFHaC8LK4VzmUyfrHSqqIljovBryzu/3DKUmW
 MlGaCEUfmBncfQeCycU9Gz+v/1WkgaD+mUpk0v3foD0tgGvncJbFS/e7FhOPosgdh4QVCHiZ4zS
 Pr5QDLLTN4VKgzr4qNA==
X-Proofpoint-GUID: hf0rnvUxo0MimDWZ-ATNrZbz2FYPFIKe
X-Proofpoint-ORIG-GUID: hf0rnvUxo0MimDWZ-ATNrZbz2FYPFIKe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0
 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230067

From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

The VI sense port carries both the voltage and the current sense data
of the speaker, but it is described with max_ch = 1 and, since commit
060fac202eb8 ("ASoC: codecs: wsa884x: Correct VI sense channel mask"),
a channel mask of 0x1, so only half of the V/I pair is transferred.

Describe the port as two channels and set the channel mask back to 0x3.

Fixes: 060fac202eb8 ("ASoC: codecs: wsa884x: Correct VI sense channel mask")
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/wsa884x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
index 3c008224d32e..acf32af5aae3 100644
--- a/sound/soc/codecs/wsa884x.c
+++ b/sound/soc/codecs/wsa884x.c
@@ -859,7 +859,7 @@ static struct sdw_dpn_prop wsa884x_sink_dpn_prop[WSA884X_MAX_SWR_PORTS] = {
 		.num = WSA884X_PORT_VISENSE + 1,
 		.type = SDW_DPN_SIMPLE,
 		.min_ch = 1,
-		.max_ch = 1,
+		.max_ch = 2,
 		.simple_ch_prep_sm = true,
 		.read_only_wordlength = true,
 	},
@@ -892,7 +892,7 @@ static const struct sdw_port_config wsa884x_pconfig[WSA884X_MAX_SWR_PORTS] = {
 	},
 	[WSA884X_PORT_VISENSE] = {
 		.num = WSA884X_PORT_VISENSE + 1,
-		.ch_mask = 0x1,
+		.ch_mask = 0x3,
 	},
 	[WSA884X_PORT_CPS] = {
 		.num = WSA884X_PORT_CPS + 1,
-- 
2.47.3

