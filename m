Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775872;
	b=i/PWioC6X7r/BYvlTKCt2woDdFhMBi0vO5NOTsU5kaCM3JCzt8vopUwEoaBWdKmNXPsz
	 wsNTFw5rASB7Qk+r+oH1pM/YU84PgKX9gNovOOHpf9Dt4Cq84lq+cYKUMkY2uZQtwGvmp
	 a4UyRtx5lM3lZjDNDVdDYQY+N6b1uLUTp2XgJIpoiGEyUhay1pqi2opXnnmgK4Yu+XR2a
	 TTUPNcAQ8g32MHcBZTIDOLnAPYmjiyP9K+eK13nDIpZ2JMQMr69mSGWMupsWACKnDp4rF
	 feEkCEUcBwAvCmBQGCckc+22XcWj0EFJkGb8kA1jtzCkon1B1BEUPwsoYFJVPsHSvow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775872;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IGVXgr+T+Glk6nDfzgB5R9PCbZJKBGpxiPj52O3aCZQ=;
	b=VGTRZ9cUbjwm1s9rWyakXX78YQQTGzA5Toh9dVU/mqJ3/MB1UWcnnnpOkq5mSCmpNA0K
	 KNmVoAAyQAzAZIEmV60ugY9kDngh+ZN4/YjjUU4DnX930g1PjXv3VREp8qMF0BYS4sPcC
	 oq1QVlcs0xxvcrf+vruLQC55qXV8DXOJ8dg9G4v82qiBd6NBRj+n3Aeo7AwI/x50duXvG
	 U1x3iLK7NqrTWrYYzTLCGPEnNOEmLz0i2M7be+tDKZ3VhGas8rFwBeGmLddBtviTC5Ayd
	 czvL15fhYAJuTVQLMYzrgNtb25EaT3/kr4F3oXfNt+/rw6mXrbkyPL8ck4adDgpjqAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f9RSEIGb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tx5sbuqM;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62EC6606A32D
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 17:17:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62EC6606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f9RSEIGb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tx5sbuqM
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE5sGu4072757
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 17:17:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IGVXgr+T+Gl
	k6nDfzgB5R9PCbZJKBGpxiPj52O3aCZQ=; b=f9RSEIGb3l6efg3ct1YubW/+Mbp
	E4BJtd+OgUBOIXCtz/BnPxff0NVNBXmlnMTQOSi+NFUpecTXNBJqz0qRRPrfBEcf
	6qvItVFESSaFmo0q86z35v2C0ByhPkrEuVYfXDouhkix91Ez65G2z3XshrVUef91
	WmBnb4Z8YEC9swgBq5FzGOAKVY5L+09/DmiadMe0ujltIXo9UyySieh/zrmkxfWU
	lAP1RJb+MFI6F5ArtWBCOUz5bG8iFysKfargUVPtnkgInNdLhin9ZVGNBMuJjNLp
	r9u7myBruqgM3xVjSW5MKdnOKApTIm7i4G+LsI6L1z0PCzjubOscoSM6iKw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hg7bw15dk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 17:17:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f559420f3so114088085a.0
        for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 10:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775870; x=1793380670; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IGVXgr+T+Glk6nDfzgB5R9PCbZJKBGpxiPj52O3aCZQ=;
        b=Tx5sbuqMNpXn+GOVdB6JfnicWv3IWZMrsuyfNSih9up6eqqqp8alYKI/HiJbZ/zzDF
         v8YEWLTDhj7+sd/YEMDhnP1Ew+Uw7S2ycbAbTMvGQApXyKKO2L2411pqrdGWk1jZ5TBj
         32gJz3EtlYyNNrqirj4RZ6gPz9CgwmOEK6xcKWV90dIVL+HcuR1O9HbLsS8cuIDmv1Qd
         1uamnmxuUxh0fuotR8Ub6CPZ3NXkwe7jCUtrPTDK44mKXOaxJ50X1qIHsoftrnXjbSRk
         10Txxr8x2BtOHrUCjl2+LPsTW99vQulfP8utTWBTS7I6BYHUpkyASN+0P4U0YwHO4I7C
         5suw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775870; x=1793380670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IGVXgr+T+Glk6nDfzgB5R9PCbZJKBGpxiPj52O3aCZQ=;
        b=S2JHqotfPJPvk4cpUGLjYnq2lFC7PljgXOktqfTb9mrPNKUtOzevqDbRqou1u0iu5l
         pPe1xR+iB9bgg1hiuzcSp8++PHEsZuYDcaxOqhoX5aRgnkCEDPfWmvvwE6WRhHkUPbIh
         bkk+8h3sHWuVlBOa0E5oXrRKsAq41M95ystRrZWlBPe4tEdlH9z8A8DgZ6FJ3xzEhKx8
         NemxpJxaN0ySz2EDFJeWiwvueyfJUtrir9c4N+8948fq77Pgmu+M2RLH3ZJfZ/kZnb2x
         RzeJLS434mK/nKjJspGjfrELsCZ5ahMzV4FOmkg3EH5Kvcl3+hJC0qrn+Th9JJTpqHIk
         RLoA==
X-Forwarded-Encrypted: i=1; AKwUvBw1cMEyurFVBrKWKZZp57RYp8UzuIZwJAXYgbL7TTgOSqaNWWnFpLTxoG+4nPe1hDR8oImuX9KR1kAXaA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIjresXLCQXC2SwW/TTMP5IWn2s3ataXT64IcZBmzL2tKhPPcAM
	M6RD7FWC7GP/YFZs8aackGaRgUM+ool0AylA0Yhhj4RB0behkR4R3IHaduPwl1mLOXrYvuWyGlo
	yqtSKmCRYfCM3XUu46xrZ2/wSrajUwU0H+MDUpfL4+LLWH0XMa+DJow+qtOVO2AU7qA==
X-Gm-Gg: AYBFou3irLeW57AwdZS0DBHtJ51wezhD93ytT1puG7jKxr7praKBUSXXptZc1xQDzrd
	p0WYIqt3QmS+RmCfvTYXPIVffMBqn8ZUUaq/wl0d5i8FxeQr8CNK0kR7rtN6+LiZE9H2puP2s8+
	XAPQWWhSZM+y4qZ7q2oOY380ZR3Jzwjm0Xiq820ilRslba0Bb07zkAim8RPJ064jwzNksDP0Rky
	Q0wlSzWCNP+YIfepMp5H0MkRI2MgB0dxlHusYVeOpCpXzI9cC7FuARhsaid+YCr6D7MsdKpyxDk
	7UODt/yITSY3niYBfdsi8KTreRHbAEZDe9FHsL1+pYT+aa/2Li/9OtOapnpixVhEBCqpBIB6APV
	SPHpiYzY+++Xx
X-Received: by 2002:a05:620a:390c:b0:93e:48fc:aa88 with SMTP id af79cd13be357-93f6f954a00mr525152785a.44.1792775869542;
        Fri, 23 Oct 2026 10:17:49 -0700 (PDT)
X-Received: by 2002:a05:620a:390c:b0:93e:48fc:aa88 with SMTP id af79cd13be357-93f6f954a00mr525147085a.44.1792775868977;
        Fri, 23 Oct 2026 10:17:48 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d41e0fesm937475f8f.46.2026.10.23.10.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:17:48 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [RFC PATCH 01/23] ASoC: soc-core: allow default ch_maps on links with more than 8 DAIs
Date: Fri, 23 Oct 2026 18:14:11 +0100
Message-ID: <20261023171433.820092-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: XxJt-1yex8T8Nr4hdxSgbnVS22Vp5A3Z
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX4765wWPzUT1u
 vAHchpxljzenXHltLo3lkhDzIpa6yRyvsQdHqTm6IRFagZJPmxv0X5sfgdZNIYO+48nsFLQjx6I
 d7mizys8XXUEfLuZWhiHFr3RyVs/ndM=
X-Authority-Analysis: v=2.4 cv=QdTzLcbv c=1 sm=1 tr=0 ts=6adb96be cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=ZoKOZlNiuk5k9p05MsAA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: XxJt-1yex8T8Nr4hdxSgbnVS22Vp5A3Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfXz3tiXIT99xrP
 t7NydUxGlcE1ikhFlL3fM7bZRUTGaEFZjWYc8Sn+vpepM013hhOe8KUPt6jbrrr4+KKNnhvxgqO
 CN7k5DPi/xdvZX9p6kScTQb3d7MvuJv9RKBcI2FXQU4Cjdz8MBAdEdhPAnekLxtX9o9d5iECf4o
 i6fni39ZE4EQ76awClG7uxil2s5MOHngv/ddJ+KxZHNoKOyKC9IBSVWOfRe9QAoZ1CDnvulKnjU
 AjlQucE+SgmWQBIHZVSlaFP5Bq8UEoNQ7nRl7TICflA7F+ID6/GjoUENrJN+BOaNaU3PW95+iaw
 DcTDwx/OHn+xphWwJawt2UKmwvCqvxPk+XHkYtZVa5iXUY+d3JyNJbIt+JOVipcqaeypIYBmC03
 1bBUBwnV9A3Aw/Bs3sIxw8ct3y0PJIpOg7FEB/hIfqVIFyoTp/HRdKPtlymwMEm9HyEByy7zWtA
 9jM0vUEUI4q4NabEGwQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230067

snd_soc_compensate_channel_connection_map() builds the default channel
map from static 8-entry arrays and fails the card for links with more
DAIs. A speaker protection link carrying both the amplifier and the V/I
sense codec DAIs of four speakers has about sixteen.

Keep the static arrays for links that fit, and allocate a per-link map
with the same 1:1, 1:N or N:1 layout for those that do not.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/soc-core.c | 46 +++++++++++++++++++++++++++++++-------------
 1 file changed, 33 insertions(+), 13 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 97269b4ee4ca..34d02a39de90 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -915,20 +915,40 @@ static int snd_soc_compensate_channel_connection_map(struct snd_soc_card *card,
 	if (dai_link->ch_maps)
 		goto sanity_check;
 
-	/* check default map size */
-	if (dai_link->num_cpus   > MAX_DEFAULT_CH_MAP_SIZE ||
-	    dai_link->num_codecs > MAX_DEFAULT_CH_MAP_SIZE) {
-		dev_err(card->dev, "soc-core.c needs update default_connection_maps");
-		return -EINVAL;
-	}
+	/*
+	 * Links wider than the static defaults get their own map. The N:M
+	 * check above leaves a single DAI on the shorter side, at index 0.
+	 */
+	if (dai_link->num_cpus   <= MAX_DEFAULT_CH_MAP_SIZE &&
+	    dai_link->num_codecs <= MAX_DEFAULT_CH_MAP_SIZE) {
+		if (dai_link->num_cpus == dai_link->num_codecs)
+			dai_link->ch_maps = default_ch_map_sync;	/* for 1:1 or N:N */
+		else if (dai_link->num_cpus <  dai_link->num_codecs)
+			dai_link->ch_maps = default_ch_map_1cpu;	/* for 1:N */
+		else
+			dai_link->ch_maps = default_ch_map_1codec;	/* for N:1 */
+	} else {
+		int num_maps = max(dai_link->num_cpus, dai_link->num_codecs);
 
-	/* Compensate missing map for ... */
-	if (dai_link->num_cpus == dai_link->num_codecs)
-		dai_link->ch_maps = default_ch_map_sync;	/* for 1:1 or N:N */
-	else if (dai_link->num_cpus <  dai_link->num_codecs)
-		dai_link->ch_maps = default_ch_map_1cpu;	/* for 1:N */
-	else
-		dai_link->ch_maps = default_ch_map_1codec;	/* for N:1 */
+		ch_maps = devm_kcalloc(card->dev, num_maps, sizeof(*ch_maps),
+				       GFP_KERNEL);
+		if (!ch_maps)
+			return -ENOMEM;
+
+		if (dai_link->num_cpus == dai_link->num_codecs) {
+			for (i = 0; i < num_maps; i++) {
+				ch_maps[i].cpu   = i;
+				ch_maps[i].codec = i;
+			}
+		} else if (dai_link->num_cpus <  dai_link->num_codecs) {
+			for (i = 0; i < num_maps; i++)
+				ch_maps[i].codec = i;	/* cpu stays 0 */
+		} else {
+			for (i = 0; i < num_maps; i++)
+				ch_maps[i].cpu = i;	/* codec stays 0 */
+		}
+		dai_link->ch_maps = ch_maps;
+	}
 
 sanity_check:
 	dev_dbg(card->dev, "dai_link %s\n", dai_link->stream_name);
-- 
2.47.3

