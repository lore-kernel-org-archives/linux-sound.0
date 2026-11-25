Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795603121;
	b=W7gu7GQyKRCoabQj3Qz0QH3UG7o6MZcWi8cw+g/SJvWnh0BzqdkjVHkQbBMCv9xa8haf
	 4zOTHA35X/oZ8OgOPlqJOcH4AmZkYVuYgvYhkdAqKapoqAc4LE5qH7OdlNy3+sze4qMrS
	 v6w9wvibSMgnYqoFIJm5M1MDpbOGk1CcdHnyliZu2GAb9TsxuRq0ynKu8BLW+lYPzNTOA
	 /Cf6kHXmp755QRbuyitpmZ5VwnfhdiD/sYcidToLN4bgpXypeaPEXsqdyiCF0qSnjhezt
	 eXrQ+ucPDAIs4ymcZ0zuK4wCf47GCfqF9SVugcimWjrKoZ/d0qxGv+ZRVC5/ObFB9Pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795603121;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6EPgr/fzuvqBneih+3g66j7jTCzzkX5xHjj3zdy2O0o=;
	b=HfCYEfO1skVnFjCuuew88MyL1Qis0eT21eZTv8f00NEEA2wZf58QHF1mC1feq5oRpkdx
	 iZ1HYab0VoyXOUDvqJLZrZab02+BqYZisGy5DVzQDvsCJIL8dkVIgPiX3mVPE5hkmsLoV
	 cMo0VR3Vi6kcZBo3UcpTKnoSciHV2C5SYORJv0fNTkIzQnDx+Mppn1uvMjG4eCwW6XHu/
	 BMEZGWV9034YbnZ9ndqx4J2++1ngG90gW4Zw7zowBET/O6aRzr8IsML1b3kD5JeW9vOYC
	 0zN7ixfQI6VV7RaIeWZIvcKtJaOJ2fVT6A7qZpQLYcAOPUSHS3fcIdHWHB3NvtBiLAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XayWTgC6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XdlYmm8S;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921A5606A329
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 10:38:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 921A5606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XayWTgC6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XdlYmm8S
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mtdf2359510
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 10:38:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6EPgr/fzuvq
	Bneih+3g66j7jTCzzkX5xHjj3zdy2O0o=; b=XayWTgC6AdO6tSrtZmyYgzVmVYf
	D80g2MAJ4v+eKDTO37GE7kIyhXPiQrA9nkJXlUkr3m2MEFsS3mGIyt7zH4zdGGBZ
	YECADXEYDxXs1j47uinE0iwGgjVTgo3yU/qDrcEL7lVji5dj2ZaSo6ItkXw0T3O9
	gfeMzStMGR/S4jjAjHGy4s05jT0OXpTCZk1xi2kURG1mZfDuPjQf32WnTAFWCMWN
	xtsnVIdHZXL7jclPHwcGGwa86Y5KqbxfM4T4k6i9GWfFpxlng+OgtlKBadBSUo9c
	tJMnXBBbSd6Y48UDQdHBbDPjc44YduBAnGF68ASujDUwzVmXl25kQA12KGg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5nu6a3n5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 10:38:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e92aad34aso981234185a.0
        for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 02:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795603119; x=1796207919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6EPgr/fzuvqBneih+3g66j7jTCzzkX5xHjj3zdy2O0o=;
        b=XdlYmm8SmUJ/fsXCj2OAqUHs+V0VX3MsWLtKYra+CST+kjTPccfTZyUtnThsmVoAbI
         AYHMCBL8HTgOn1oWV5SU2X9ZAJz/C4moh5pY4H1jv+qkqCJn2kbRNTj7ir9wrkM+jAFi
         C66Vi4oX5hgE71EIhBtLtX9suSZSWG7ByqZJqCLz9Qqdh8OC6eyURmdbnpVNYB2Gh+/d
         eGPTuCD0sIi+vxHtMO4btnCPg3x9BU26LYbpZSYC9WaTAtcbi2lKluaC98mE+Mvq3edH
         gh+fJa2iTTUO/aUfZMsrvT2pEjRYZkthWO/yqZYZ6Gm/KonQsF4gu8VUH4Hj9+7eXjC7
         O1GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795603119; x=1796207919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6EPgr/fzuvqBneih+3g66j7jTCzzkX5xHjj3zdy2O0o=;
        b=qdmpjSI1mXPVkETHJyq/uO7aXSYkWWcPKkN6/csjVTcqX+291Mk9cpW6BBKl37m4QP
         E/q+jnagBDLiju4VNtT7RhZ82AZRPG7XGMh7rAjj/mlxh3x389vHQenTkCxGUq4bq7Ju
         cRQMx2qIDFamSTg9Y/6o01iOubtGKTGtyAWVCXRU4/Z1BRs7woZL9/SZ7y1vjJnc5bBW
         VLj16SY61bSkgiELQujNZ1OsunAW+LqT87Clb7TBh0Kd30/lAPo4+eO2JbDw8b9kCSxa
         +DfhPNgXzErhTLQhDMZ8GQZLf3Nk2QTEaEYnGc0rsIO6dQNqfmqHNOvP23Tag5Y7r6fV
         I7eg==
X-Forwarded-Encrypted: i=1; AL+hErHosH5YA1LaAsluDCNLWZdMKj0T9Z7azEtiFqcRolXcjrfQOf374lY+FB/DcIljusDUd4xNZcCBIlkcdA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/aASYnJqpanIyuy9vYwlcnuasfp//6l7e7FPg020aelQ9mZ5TM
	EzLP7ZYWBxs203l12RfOVjCbUB6ftuEWbtEEZnCehblY2C5/AA69UtnTMsxLnlryTclXzNzjGXg
	ue76mUUl2xFHzj1Xf2F3J/dfBBS7qr4BQz/76I76+Wr+ni9y62VrewuzUIPGwG7283w==
X-Gm-Gg: AZFdTZeRvKzgJAV34l4KvT6fzfIczBQLCJeHQ+AwcHjxPOf84Xw4vQnMB9tJO8ttpd1
	nX5YhDcMLxqCqpkRWyiv13uFWX+hsV3wPRo5UncegClqjOFXPnxCMrf4Msv/i48df/qyQir/Msm
	GQwQazYr8HPwBViP3dTfI0oEvui9lPT+z+tUDcRiyVeKxDWEV0DjSwMfMYkUMUoJCG8zsDxxK3i
	EOJAL/ZR+cEeYFWyz+1zvEZVJK3Sz2KsFqpiLVasnO8EHmgs54lGyvfBLyc2W8pGrbb4r4msB9m
	zdtO6poETS9AL+OlZIMNaezVrCu8oQGUt/3u0fcGlVq554036dDiIyvQyqBZRDHUx4mH13GBHM8
	UsHd9vbH/vUQpVCdUpTUK9+E7DeW+zrDhK+MQwETwdXOh9rfKGReXrEXNM43pDWGY
X-Received: by 2002:a05:620a:260a:b0:949:7502:6a0 with SMTP id af79cd13be357-949bac8117amr2605487785a.77.1795603118710;
        Wed, 25 Nov 2026 02:38:38 -0800 (PST)
X-Received: by 2002:a05:620a:260a:b0:949:7502:6a0 with SMTP id af79cd13be357-949bac8117amr2605484785a.77.1795603118148;
        Wed, 25 Nov 2026 02:38:38 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa397asm34171502f8f.48.2026.11.25.02.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 02:38:37 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Srinivas Kandagatla <srini@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        stable@vger.kernel.org
Subject: [PATCH 1/4] soundwire: qcom: always set master port_params.num
Date: Wed, 25 Nov 2026 10:38:22 +0000
Message-ID: <20261125103825.936939-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125103825.936939-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261125103825.936939-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: q80YKWK9MNBciF48LqqhZ69_38KaeOdJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MiBTYWx0ZWRfX3+IYONCFa/Rg
 Vn9b8WoTvv6nMkKxZaEw8XPZjFNP5GmwzwmxDEEyKtF9ZxfNWEhR9WtfD5kYt9K+Z8mDNMrU1GG
 4jV9tpRBFZ+7x6YlfXjwf0FF08ptYVQ=
X-Proofpoint-GUID: q80YKWK9MNBciF48LqqhZ69_38KaeOdJ
X-Authority-Analysis: v=2.4 cv=Vra2kO2n c=1 sm=1 tr=0 ts=6b06baaf cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=hD80L64hAAAA:8 a=EUspDBNiAAAA:8 a=x3F9vMqfjlPox18evOMA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MiBTYWx0ZWRfX46t9rxqwhPR6
 +USsllQ786e7s43nZk6sYXIacguZqdcwqqPnBMc8pMKbdz3TMFz7e/2JCZRJHtZ6aLDfVEPJBK1
 Qkjxyr6UsrG97Tyqzfd0V1LhstNx5zlk9zw2UEc42vZywTbbiEDWKOGUfpQWIazMKsDQY/VO46s
 X8zzsU0c+PUgaHw14yKEz5AeQbEfI5ZUZH5p6mTsNMyAVtT5t5TOTpvNfbBUNTfkwUi88X0Iz/a
 9WexYFyXDOPt1SMXZYM6AHdBxleLJ6tJJl89Mnyjb1Qzi1LUsLcGpTBO69mtCUs1Y4d1ag6DzWL
 mVTZLSY9DPv++OrTlxFaybAkZvbhYMy1t99Y+kA1a6LkvmoC88LJWmGN2eStCoMYXfq4FSlOuY/
 KsplmehYqonS5C62YPFytfRjEPOtpTdrB8ul8+XPFGapRaN2WAdLdyCiNUdGa9bGekdMTWFhDXf
 65ZWvIsgbvK/A9BcKdA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250042

qcom_swrm_compute_params() populates p_rt->port_params only when the
DT entry for that master port carries a valid word-length. If the DT
marks word-length as SWR_INVALID_PARAM, port_params is left
zero-initialised and the subsequent dpn_set_port_params() callback
sees port_num == 0, tripping the port_target() sanity check on the
capture path. The callback then also writes bps - 1 = 0xffffffff to
DPn_BLOCK_CTRL_1(offset, 0), which is outside the DPn register range.

Split the per-port assignment: always set num/flow_mode/data_mode so
that the callback receives a semantically correct port identifier,
and only derive bps from the DT when a word length is given. Guard
the callback so no register write is issued when bps is unset, and
bound-check p_rt->num against ctrl->nports before indexing
ctrl->pconfig[].

Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Closes: https://lore.kernel.org/all/20261125091150.2145177-1-m.szyprowski@samsung.com/
Fixes: 128eaf937adb ("soundwire: qcom: add support to missing transport params")
Cc: stable@vger.kernel.org
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/soundwire/qcom.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 65add9a74ffd..95444eee4c0b 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -1209,6 +1209,9 @@ static int qcom_swrm_port_params(struct sdw_bus *bus,
 	struct qcom_swrm_ctrl *ctrl = to_qcom_sdw(bus);
 	u32 offset = ctrl->reg_layout[SWRM_OFFSET_DP_BLOCK_CTRL_1];
 
+	if (!p_params->bps)
+		return 0;
+
 	return qcom_swrm_port_reg_write(ctrl, p_params->num,
 					SWRM_DPn_BLOCK_CTRL_1(offset, p_params->num),
 					p_params->bps - 1);
@@ -1341,15 +1344,17 @@ static int qcom_swrm_compute_params(struct sdw_bus *bus, struct sdw_stream_runti
 
 	list_for_each_entry(m_rt, &bus->m_rt_list, bus_node) {
 		list_for_each_entry(p_rt, &m_rt->port_list, port_node) {
+			if (p_rt->num == 0 || p_rt->num > ctrl->nports) {
+				dev_err(ctrl->dev, "master port %d out of range\n", p_rt->num);
+				return -EINVAL;
+			}
 			pcfg = &ctrl->pconfig[p_rt->num];
 			p_rt->transport_params.port_num = p_rt->num;
-			if (pcfg->word_length != SWR_INVALID_PARAM) {
-				sdw_fill_port_params(&p_rt->port_params,
-					     p_rt->num,  pcfg->word_length + 1,
-					     SDW_PORT_FLOW_MODE_ISOCH,
-					     SDW_PORT_DATA_MODE_NORMAL);
-			}
-
+			p_rt->port_params.num = p_rt->num;
+			p_rt->port_params.flow_mode = SDW_PORT_FLOW_MODE_ISOCH;
+			p_rt->port_params.data_mode = SDW_PORT_DATA_MODE_NORMAL;
+			if (pcfg->word_length != SWR_INVALID_PARAM)
+				p_rt->port_params.bps = pcfg->word_length + 1;
 		}
 
 		list_for_each_entry(s_rt, &m_rt->slave_rt_list, m_rt_node) {
-- 
2.53.0

