Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775626;
	b=37P4zC02FZcT3ntrDiBreRgYgBh6YnoyDrDDtfOPWT0IdDNeKdepyIiNILxOv8t3nZt7
	 lqFazNHhFWklZpGe7j/sX3nLXgWi2y2TsE9VgdT0kUvhEbMGCHYloCFqeJCgBcGJIR1CY
	 DTUOW5BO2adiy2n6jdnaIPRSV0gj+zDDGBZeaLnpQylpeV346nu5yeK63L9u1cYnwA17d
	 qxj98x9enwoi9SwyhtNkPdLDXLBP2f3pwb4zfFCPTo6rqlYrzfyliMg2iJ0xUs8FF8lgB
	 bZSvOSmb/R6utEi1skTcZG1UCfwAwsx8uU8ihfwmgWDjw3FBimKlu/ZxwrJ9Q+1nuVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775626;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OVN8MgXLkPAfIyt7U5VOdTrAwJealQJYdpA+B6fu7mM=;
	b=gaTCvnw9FYnuqPyO/25W6qIBehn0ghLdhXxDGNSxVKGHOAGcFTJRZogQG12Hy4hANown
	 W9fmuli4WeVul0YnmejnZ0FmrHV+BNyU77/HH+1fo566Q3TIrXXgHgcLhsGiqS7B8qZku
	 JwDO8iPNVVMOzt3snwL/e/xnsyaEpJ7nsdyfycppqy3r4eG745Be99asLpGozPvC+mI9e
	 WLVcKOwTKuFgvWeKJo2d2kn3p2Lv0FqUl8E3iCTRjI1LFQ8Jz+Tl3sKkM0Kxf2Yf6+S8j
	 qc274VUWZVCEQ6oZ/BKU2IAk6PUDGHzbSLLT10nMhVaYqWtaGMoUNptWPOgc9aOnqag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G4KCQuA8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bTFELnSr;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4321660A3810
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 17:13:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4321660A3810
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G4KCQuA8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bTFELnSr
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE5wE04063463
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 17:13:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OVN8MgXLkPA
	fIyt7U5VOdTrAwJealQJYdpA+B6fu7mM=; b=G4KCQuA8mq0zHvgxNoXLnzzir9y
	cGRhcpq/c8z5hVGSfNyivwtosnmsmGswmIVBiTvpKTp0KU3R5m68mPkPgYJ3zBA2
	JJvzIXWCd0Axev4irJEclxFoEpwM0jNudpVvEDBuCjDbDsjN5c1fHihjM1SMcZui
	cMmZkA56HRloilbt3fM4uTUIk1at0UDfW0xMg13JZBIvRCBMWQXQhsHzuXq44Nqy
	hdJt7sCWrs/AtKnxz/d75lq597wZU0LfedY/Bi7x1r7T+pObS4T2v11jzlAaqfBk
	h1E8WkRCi/E1y8KXb6yssm0JjXkc/uJNuaXpkC7COhtPPlXOSvnhZ4+Vpmg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmrcqqc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 17:13:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ecdc701a2so150916785a.3
        for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 10:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775624; x=1793380424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OVN8MgXLkPAfIyt7U5VOdTrAwJealQJYdpA+B6fu7mM=;
        b=bTFELnSruDdiR7Cp9Hu9Cug/m5RTxsIakwzHQqHSfvQsT3h1+akrvleli9Y3T+3mX/
         1g95qHQpuK4MvjkZ80UrQkUH1luibazoEgDO8WyGRvuWRQC/3aUJg0sWrGpgQq0Hg8Gg
         S9OUwhjZ6SPsMkq8ntQfrocsxN7JZ/vwT5BwAC5JYef/qbKdO8Q8le4tAt5I6QisKKdH
         21BRNudnjaR8HQmVCXODhVueidcT3k5zPjjdnV0LkJwmDkP9SjNbSz8el3eWIw6Uj4pF
         8ADhcYkLMs7ANwaAkz2FhNc/ffIEKJ3xcfF8/z70oSbulthF0K6Jdc84oPk+Kpttt9MU
         ZgUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775624; x=1793380424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OVN8MgXLkPAfIyt7U5VOdTrAwJealQJYdpA+B6fu7mM=;
        b=drxLzEc11zpKQg6zYDaESLDkoyVq89NJksdxlDdXH+tl1HaYvJc0wcBbxVaYHg/fPi
         QVMdConfRkTL5zpwGzRHHy86hdPp6mc6m6Hke3+6n0Jx4q6G+E6mJh81N/vROw56R002
         gQ3qTXMutLyE9I50YCBdx+BX6Ivxn8EJaAbfz6EkgS/c7g5ueOCk5ICQr/s5ddV7Jyh+
         JW7c9Z5QcgdTqMOYYNA/yKEAIALnmkUcx41h62jt/wCcuNlQRjMC7FgGT7FYWZL007vu
         AmXKM5ySPxzpFBaX0pY7na+vByC1lr+jdpozXXtQuRV0xnBQZoStazybBdvEnOluFty9
         phvg==
X-Forwarded-Encrypted: i=1; AKwUvBx2d4wPVQ76AfFTvstp1WQmjpfI+EfAHHsLgVSXzJ1Yy489yyetUNk4isNm/h+7uzoM6wvRfZ/k0YIwAw==@vger.kernel.org
X-Gm-Message-State: AFq9FYK67gWMJNBPfuYsBrY7gX7tBY+xkfzuj3p9y6+VfqcicZ8gG5B4
	DzED/3z0ITtg8/2hT71VCPu/7Lr5zQF2lfTppRtf9MZBmOJ3wcxA6DVCJs7/ACUAKzJyJUpQ8bl
	Ap/dCNfwtg4IPtHrj/lPgVOHWs35Eu+t+cT1M/hjXeW3x8ypl/gecAMDW9JmaplERSA==
X-Gm-Gg: AYBFou0LpRQ2LOf5mwkk3MmzECMgcylX/XGTuekkrJf1jkvGumBQTwIZ2V8UgTCosfL
	Lgp2cWyGBFNEDIrLuV/CI/ON/yO1XenUpszS1g5GF5Kuclhw5OmIy/wezTIbB7JI5b5cLflz+T0
	yLxgnDKuoyoWn4dpIt6j03VsXlEI+Gk38uPWMvNF8IAj/avjV1+ApJ8z06XwrMxJHyUonX5Si2J
	QeCp/BS35oJigtcenI1uBz/pxbWdoKksAhES9IsfC3uqcgsHXkMMyFYrHlRZ1sy4Ra2NATPu3If
	uEoJDUMT6Yw0gwgaUSxxwZbMZrU6F7bv4fZQV1VHJf4QvhjD4Tp0CCgYqrRu1BUHVC5PUwbf1gN
	OSEZB58xSYgsd
X-Received: by 2002:a05:620a:4725:b0:93d:23b3:5088 with SMTP id af79cd13be357-93f6f907cc0mr529821485a.16.1792775624472;
        Fri, 23 Oct 2026 10:13:44 -0700 (PDT)
X-Received: by 2002:a05:620a:4725:b0:93d:23b3:5088 with SMTP id af79cd13be357-93f6f907cc0mr529817285a.16.1792775624049;
        Fri, 23 Oct 2026 10:13:44 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d4104b5sm1043841f8f.36.2026.10.23.10.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:13:43 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 7/7] ASoC: codecs: wsa883x: Fix VI sense port channel count
Date: Fri, 23 Oct 2026 18:13:16 +0100
Message-ID: <20261023171316.819857-8-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: 9q-TKf_JCh4b9P26IqHBxdhESYTEZyf4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX5MrBLpoBVHQI
 paw+dk8fdlFIF+/8RyWv+akpT+HBbQH3KX9YwLPvipH13HevMAPHAfrU/+2ZXLIgmn1W/XRnNsw
 wg5n4rDpCLacOp8ej3Wwlxzj/U5JU2c=
X-Authority-Analysis: v=2.4 cv=VNZIDNPX c=1 sm=1 tr=0 ts=6adb95c9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=AfZmRdYrrmokTClfqrwA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX+DO7Oo/4HxKa
 iT82LWqGJzxt+vYg5uPZ/yiLZ6sLM0eC86fXUk6cAQHn8Z7VGIlO02J5TA0THF8QCuY6fp20J7L
 eJmgdwFKuhefxwYTmpwx35u8hQztyqrj+ewPmDK3fCncR+s/u3hDVUovTb0OWOTnV09+Web1b9H
 lz1JgcvE6J1Xp26PWbp7cjTkKYo9EwtkTSCJ7wNe7XFtvH70tjU/wXyhsOD0AAC/Vhkmf6GRmhl
 MSL+TgXZNHonUCS13Ar9CkAxjm9KdjftFNvjyxYRTKQ9XYD751c3iJoj8C2Hveu24otU0FfIneB
 E31oxWPWun5ZDkCGQJtTdOGDDjIKe2+rwvUo88aarAjTWyCyhj7wAODFWhKtPOarZjdfy8kUoyR
 cRWH0s0jrjnOPoBC2ydIL+gCsM/XtULI96gPycwCke/Klv9hRr1rQqOjk23ntyDli6JwKEk6FjY
 lgoCYAIRu0qLUfU4+lQ==
X-Proofpoint-ORIG-GUID: 9q-TKf_JCh4b9P26IqHBxdhESYTEZyf4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230067

From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

The VI sense port carries both the voltage and the current sense data
of the speaker, but it is described with max_ch = 1 and, since commit
ed3b274abc40 ("ASoC: codecs: wsa883x: Correct VI sense channel mask"),
a channel mask of 0x1, so only half of the V/I pair is transferred.

Describe the port as two channels and set the channel mask back to 0x3.

Fixes: ed3b274abc40 ("ASoC: codecs: wsa883x: Correct VI sense channel mask")
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/wsa883x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index b09ee3db7ed5..17d8babc6123 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -552,7 +552,7 @@ static struct sdw_dpn_prop wsa_sink_dpn_prop[WSA883X_MAX_SWR_PORTS] = {
 		.num = WSA883X_PORT_VISENSE + 1,
 		.type = SDW_DPN_SIMPLE,
 		.min_ch = 1,
-		.max_ch = 1,
+		.max_ch = 2,
 		.simple_ch_prep_sm = true,
 		.read_only_wordlength = true,
 	}
@@ -573,7 +573,7 @@ static const struct sdw_port_config wsa883x_pconfig[WSA883X_MAX_SWR_PORTS] = {
 	},
 	[WSA883X_PORT_VISENSE] = {
 		.num = WSA883X_PORT_VISENSE + 1,
-		.ch_mask = 0x1,
+		.ch_mask = 0x3,
 	},
 };
 
-- 
2.47.3

