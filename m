Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795452988;
	b=VM+iuXlpmUnebYTT91LcSutGiW51So4llzIaWfopgys65rhhBVUVj4kvpDY7Su8fCvIC
	 1gkfERsTgxKmcGEOpwArpahL28d7vMUvWYe65JNssvaNh8L43yK5pGyNzBJJD9psqXhlN
	 xvvwFTww+pQlgGwtaKg6Vyf2FOO/2rAeCtasoQPr9i/3DMNrTqdNb5MEUcIRu9PJnfHFw
	 XX7r0FD9jkraSZiGc3hqzGOMTlLy/qq9OEAWTkwzAkB9WoWbzarnxxCuqoOQ4o56Kxd1d
	 1dDSCsaeuHUHwM3E4aVT6vnqYq9D9BSPs197NRVhOnQOn2THZ1YrBRqAjmbhzg0okQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795452988;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CGVPPrBmIbSMP3ik97JAyLMMvXQoK/X87ePEsEfxJRM=;
	b=fP5klvb8YTzsieP84XIUIhw78XdrXTCdUplFQCRI27ppEGBYgm+Wp+Wt3nWohN7aK2BX
	 icpCkUwzoAn/xTW7S10zUXwDn9bjYnnKKgF7rM6OsLbcBCuZ3EARbcumQh2Q2n3/7m0kD
	 TRbU/dSDCynv8sXQc5tTnP735nbeSkwR2xBpsK9oxp1yeZHyxMKD5sZCt33itfwistaPs
	 HtQgI8uf+bVGmEzYlGXWhnm0Y2IXyydKsRaTh8nRrhdwGGpFUCoksVr9QfBbpmlXOdzCU
	 f7vn/lMkKXP80WDU3ctIm3y7dzMTpyR9/6eeHFJfYoRGfOhXSFHlOG59k2Q1q7Dn6fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lKK0SyD6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dZVrCwXv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A4D606A686
	for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 16:56:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93A4D606A686
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lKK0SyD6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dZVrCwXv
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGpoA2769001
	for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 16:56:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=CGVPPrBmIbSMP3ik97JAyLMMvXQoK/X87eP
	EsEfxJRM=; b=lKK0SyD6HHRAYUGGP1YMe71pS2wfClCPY1HjPf9453NXyJECyT4
	ynu4cEIW0+qrtE0n+ymBljvnCtRVXfnm8z1NKfdtRpOguchkeHfysBcWJLTESjRX
	M/8bNjEyfDodBNZ2d1TJsEoLIuB6DXn6wF+oBLWxJPLch0XfKxBKwyHIhhE01YYk
	BfHMPQz1d+tNj5yRUaSGjcm3L2pgYjaOi2h9eOxAqbiNoGvDKbCAie+E2fi0/rZa
	StOt9G/hp2D7DmLfDObD0uNLCewu8udte9VZp969MVrwsav/2DV3gWX2n3d1DQqy
	HqpYPssyjgfx6FqvVOQ6EzaYJwxNJULaBFw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1pae57-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 16:56:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-948d83322f6so49015585a.1
        for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 08:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795452985; x=1796057785; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CGVPPrBmIbSMP3ik97JAyLMMvXQoK/X87ePEsEfxJRM=;
        b=dZVrCwXvcdZCjL/B7BePaWrwPtTKkgiEcrrXAJRqL+Ev1uuc3YFlj7DUvBNtYHlEMW
         K+b3XsDLBG4v6FkaQWNz0NUqhqtzHonNNonX69+mw209kVCtN8ssxBbWwSGCcNre3VVL
         uFrZ75Nw+3FSu0Z87KjD63F5zrmKzFzNruAYf50QQ2F7KKvZCfAvEhiKEircq6NC6I9w
         LAXzgFSFMkwCtQapE4nW1mCRRgeYNbhxr73AyHzQwVQCGZ64VecR4JVcTrKIg4qqMXBh
         9ZcRUXqhcbi/pwIqXsrtX+Le22cAOI3mcbuazF88jJTEn9ub83vsAD8xrmyzzY3FcGzP
         NKaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795452985; x=1796057785;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CGVPPrBmIbSMP3ik97JAyLMMvXQoK/X87ePEsEfxJRM=;
        b=FDze0lE+c9X/3+/n1moaUpy3759MwIYJexULmAovAnlpJdK4KMI5pwnwreGtxTtETe
         5a8ZaKhEPtIrXOWns8eA4HrPMsjzWSi+9ALn8eMNjiKvK7M46pgjFXOAPDwbeD9gc7+c
         tjdXWIupX/WusYup+qphCMv8Xcq06ZvEDSQAfUX1WOxOG4uWKV7AKvH4Dof3xebTlWqP
         X3pFbVQ0pvSQHpavg8diEr3CU/DzJMcozuWiPxOFY6Qgv27HLPSoWx91kjLN4XTB1hph
         LkEjvv7T3J15Y5Kz7EX7Qqs9sCVOvIS3rSNza7bj637L83yshbKtvZFQUIeU88WE3ghN
         LTqA==
X-Forwarded-Encrypted: i=1; AL+hErGQ0gFrQVxPB1Gd5TSlClGe18pI80mZVlm4E2Ye+lSoukmK3WBmhumz0RFkLadDRIUqpT4/OL+ejw1ZGA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8xcRhCLOjq7Fn6KawbxKo4VRlCYx2gLOv8t1htfq12duaqXqTi
	4ytdTOhP/KICv4LsMJLWZdOuk+GDEDY7csKMl2gtN5gQfJY7vpxvfXxFJ7AGGNGJQqA3oYNoZPR
	NLOHl36jEjk5Es4OGw3lR5xgV/388ILVJrXt+JpZO5sZ2EPhmYIPieLI4moJmYgtMQA==
X-Gm-Gg: AZFdTZd6RLxIFdfF3qeK37j/l/ruW8o8XAe7FVra4acl9DSz1J5/OW5tn1YzLxW/3QL
	zlaNQy4Y8k/wpmPVOF3MVDj5g37gDCVP4TYRH/HbqRsY8QYkSza3MHpxZXRi3tyUEQXbtK557Bg
	N4Ljl+1ZQqsmIDblsxE5okvx21iE31RptFXGgbeFpBkwVbJye1PDZJc9Y8dSACiMwDLtXlaseqs
	INKAWzppzIaQUgf2DGnREC147Plz9FheU1SngUKtZ5mBm+dO5gobVBV7heJE0V/VIs/sLk8b5C6
	90GJt5dsA8KcNgPLv2emwbzBSyxOxoqQC+RnhqzwvJ3m9UqUsCYKaWLlNY1QE/yZXemrUS1p8wt
	oL9bFdyGBdr4nsffygCIe2m2WfdEmDC1t5qV2IqiSvGuYydmQq3IxWIRjpbK1D7jV
X-Received: by 2002:a05:620a:2615:b0:947:9faa:af29 with SMTP id af79cd13be357-949bab1ceadmr1956508785a.54.1795452984607;
        Mon, 23 Nov 2026 08:56:24 -0800 (PST)
X-Received: by 2002:a05:620a:2615:b0:947:9faa:af29 with SMTP id af79cd13be357-949bab1ceadmr1956504285a.54.1795452984115;
        Mon, 23 Nov 2026 08:56:24 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm498217885e9.13.2026.11.23.08.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:56:23 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
        Mark Brown <broonie@kernel.org>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH] ASoC: SDCA: skip port channel mask for Output Terminals
Date: Mon, 23 Nov 2026 16:56:12 +0000
Message-ID: <20261123165612.440542-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2NyBTYWx0ZWRfX6UFjMC3rKhTW
 Q/0XSoIckOP3Wlq3xPJNhPmz9ireTAOMKFkAbTg9/C5/aMx2rL01Uv9U+cMcNJP0aQ+NrRZaC+f
 9c3R1zPZRV7kF+3DnW9A5bQvlVUbeq/8uPx3EUueln3DBYfd1w3NU6Xn6WKwceKvvAvyEG9XvYa
 26ZoQ3s74Kg1fL+v949JaAXVWBksORfKDKd487qrETAlk1Pa1+zlZhg31Gkcg155cXSuMGUFXvt
 +S2ii7pKJyg3qefY7HiSS+3dv0Bx5Ta4wP0+o5TmlIG+BRR5RXMn+Z2craxNQ0NcjbMI1Ffg2K7
 q8IatgGR0LDSQXotXJDAp5xknWwoxEbvZ/8it8OZPyX7e2WBfvIZznVM3XU6vdZTkBHOHnKafct
 KLdLbsr46dV2HP7b3YahdY+jJwHxgSxSCdamMfRFpL53iXNRMVkVvP6YHNxwU9bYEYxrYIoidzZ
 MAf9gNTaN+uUppkTwew==
X-Authority-Analysis: v=2.4 cv=AeIkjHXG c=1 sm=1 tr=0 ts=6b047039 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=JbQxR-g00cxq26BlPqcA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: nbnfGv2a7iAu5-Fpt_WCUTQ9mMXNJBHw
X-Proofpoint-ORIG-GUID: nbnfGv2a7iAu5-Fpt_WCUTQ9mMXNJBHw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2NyBTYWx0ZWRfX15zGwZEMaMAo
 zsewv6tG9AZgW+vYgfohf868gRh8cDu8kZ7/oDUdT7pfgLbv0ppF/WTGXTMFjfbulbFSyS5x5/P
 EsD2TLUQD+YTsdv5HF7EM85NkzW+uEw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230067

Commit 8bb24d87078f ("ASoC: SDCA: Add port constraints into
sdca_asoc_set_constraints()") started intersecting the DAI channel
mask with the SoundWire DP port min_ch/max_ch for both Input and
Output Terminals, installed via snd_pcm_hw_constraint_list() from
startup().

In DPCM dpcm_be_dai_startup() aliases be_substream->runtime to
fe_substream->runtime, so the per-substream rule lands on the FE
and narrows its hw_refine().

For Output Terminals the port sits below the DSP capture graph,
which can present an FE PCM with a channel count different from
the wire. WCD9378's headset mic is single-channel on DP2 but is
exposed as a stereo FE capture by Qualcomm LPASS; port_ch_mask is
0x1 and any arecord with channels_min > 1 fails with "Slave PCM
not usable".

Only intersect with port_ch_mask for Input Terminals and leave
Output Terminals on the cluster mask, restoring the behaviour
there to what it was before 8bb24d87078f.

Fixes: 8bb24d87078f ("ASoC: SDCA: Add port constraints into sdca_asoc_set_constraints()")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/sdca/sdca_asoc.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
index aaa84156f20a..6e42f5262aa7 100644
--- a/sound/soc/sdca/sdca_asoc.c
+++ b/sound/soc/sdca/sdca_asoc.c
@@ -1645,7 +1645,14 @@ int sdca_asoc_set_constraints(struct device *dev, struct sdw_slave *sdw,
 
 	constraints->channels.count = ARRAY_SIZE(channel_list);
 	constraints->channels.list = channel_list;
-	constraints->channels.mask = cluster_ch_mask & port_ch_mask;
+	/*
+	 * OT paths may re-channelize downstream of the port, so only
+	 * narrow with port_ch_mask for Input Terminals.
+	 */
+	if (entity->type == SDCA_ENTITY_TYPE_IT)
+		constraints->channels.mask = cluster_ch_mask & port_ch_mask;
+	else
+		constraints->channels.mask = cluster_ch_mask;
 
 	if (!constraints->channels.mask || !constraints->width) {
 		dev_err(dev, "%s: no valid constraint masks channel: %#x,%#x width: %#llx\n",

base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
-- 
2.53.0

