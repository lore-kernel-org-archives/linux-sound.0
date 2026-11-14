Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794645512;
	b=Fd1l0EGlZa2+pCpL6g8JuM9/baLc9DDMnjYKFVJgfOzhH1twacRh5Sk1Pf6z9/Vf+gVc
	 0iEY8QdjQOcLbz0dv26mp7ZwbA9zxKc4U/iK8zq92VLx1N6BXx+lvSZPo2fQw/ZMfFlHL
	 mixJu1t3irnqA4mUrnQoxVCEBqGbDEDkerBZG236ZNW1ed07K8VIIWXS6GwF8wT4BWo8X
	 LkAmJb+/6OiAZtmaO+iGJyThKqcyB7dsiSiK+7jtahfpUvrHLGKzvSwHQmGydfk98lUa7
	 iZyPtyhQ8hhWGQXSRgiP4Dr7+XYjzYu2gWKh+EEkkXf981tByckm0pInefftlSEYrBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794645512;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WNOiUjUmcTqUWTHbfySznhr3/MBwOYyLcfmg63ivkF8=;
	b=F88xLflGh1IPho+YQJdzviYlQuSfYlfTyeibZXtFwB/5sb1NlcPJioX/zVMcAAfPI1xE
	 /+chQqrsdMuHHQiMEYdTlCCSZeLYQdluVEeb9SklpLnTqz/1vaRbujyu4uzjgd76fF15V
	 HT+DItP3Hm+7AbqmtPInuDBfahKKWrHN42B642Ghn2sk7h3n1DZsmqain9Pa+BwG2Bvtm
	 SCzs2vcNyh0C75hmAzcM+FTI3wu+vstKkK2KMN1DBtbMDjdtS+xbm7v9weLEUG2UScovX
	 2PKR1Dykt7WUNs8Pwje+H5kN1XWmtPDFTkrPxMeCTFnB1TVxOuEpXKvqc5JP1Gkqg4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l7kYbs0O;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XZnRuLdj;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1ACC606A331
	for <linux-sound@vger.kernel.org>; Sat, 14 Nov 2026 08:38:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1ACC606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l7kYbs0O;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XZnRuLdj
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE617aq3881889
	for <linux-sound@vger.kernel.org>; Sat, 14 Nov 2026 08:38:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=WNOiUjUmcTqUWTHbfySznhr3/MBwOYyLcfm
	g63ivkF8=; b=l7kYbs0OKPtJ1adry7/YU+mlEXIUbCAOepo7ud2mCYOIvLhohU3
	9bp5Hn94SZn0+7D7pnTFYONt6duqZAJ8719PeF0jHllQUxCHdKSmdP9YXrMXf5SE
	RXaMQdIaQQLqCFgcToTev7JFOMAoYRAAwAQ+7ukCevHdEenit9PWaOAd0/+BkNvA
	Aoe8qs4EZs+3me8o0rBkIhsYC4j80jpp/xJWfk+xohJsq9iXzGRvxEHI/ZxOk55z
	q6LazgtujyTbGo2/wYfbbSjBTpDPm/hzNnUIWGrep3V28pXKViq+CXi4BOUdSPQz
	fMS5VWMlcTKnp6An+crSjwEFfUcGey/2/SQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmagaqu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sat, 14 Nov 2026 08:38:30 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8b647bbf8a9so2106069b3a.0
        for <linux-sound@vger.kernel.org>; Sat, 14 Nov 2026 00:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794645509; x=1795250309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WNOiUjUmcTqUWTHbfySznhr3/MBwOYyLcfmg63ivkF8=;
        b=XZnRuLdj0B+5Ah90ToZnqSqL/2upa0xQesXn815meAswLAC2F9L6E89PNPMtXZI5Md
         ZWjN1WcLAxo5N+Sa7LuOeTymdso8L7iyNQN4i8F8aPMZWKDpr+ptkKydxgO0B1tO3/IR
         HJdwem6QU8fIqJZJpOyrXanbAGdpAMpnoUQlnCVpfDtZg4xjDwllAaFl0bpn7rkBF8Ik
         OptyPdo5+XJwyNGa22NLlbkzFr39PLVH1nxzzJJo7Pcr9k7GwiQ9BuuXkPQbJLPJL4lg
         L/nNsBuFLl5ZNe0Kho4p820z+qwUW7uRoS0dHOXXCR8E+Syh3OnGvLP0qsHch9VIRf02
         aPeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794645509; x=1795250309;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WNOiUjUmcTqUWTHbfySznhr3/MBwOYyLcfmg63ivkF8=;
        b=zzNau37v1mRmL8LcDAlIJb9v13KZE5vBgbYWU+h3uuEguvkJh9zBAk5cGLxUb5SbVa
         S4kcf4bm7axjZcEMqFf0aOBHtihjlX8VghCBxiHCI220110PX0ThZenk6OpbhUZPX0jz
         PAizMz64gT6GZIpZv6zwOw61IS7ZjU0vQibrGIsYeNEqOb0W8L3/S8PQr08QhaRrE7UX
         slCQwmMdzizWswqwCBsct/j42XdNsyX4odlD3J8BLz4wp4YxCSuk6Eyo78+RpomUFxxj
         1zFrps/Urf9yItPv5CnxVaKBCzY4LSeMX93C/XP0fr9tAGT9TxlkFQDy/YplpjJ1OcCu
         7sGA==
X-Forwarded-Encrypted: i=1; AL+hErH5XjHGd54k6byRaMM43qqS/kP5Nc4EkhEnTN9mXEG9KvTElVYTGEV6vfdYeuk0REYRRJMnkGXn0FXRAA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/49lRnGw3UVKEi7OOkE00kba3nLX82NV6J8ABU6+eW4ffj7NBl
	EV6El4cRrRCqPRoNWltHfMUfH0V9zsVIS1xpurTGgwBxp9V3XOYoT/R3Q2Jw7rbd6lC36fgO9qZ
	R+EJ1LyiXFwVSNSXPDng2bSrf4IYc0c00CNNnH0DNF+OzRn4GSflbBgh6o7drbT9GJA==
X-Gm-Gg: AYBFou2uV88Yaa+/Hj2Ov+u3p8f7I/8fcK9LGv3LwOW8K9nQ6E10w4XLd6iwVNR/MPG
	72VzyoLqJr+21h8SSbUOUXZDjPR1PPyMSdilQYAZwPQqVUNUyliGaVqtin64xctcHjNwG+uFSNE
	1VSL4VIluA8Im7lz5TfG18wauqrPopy9M29lb5eguQYHfH9TXgRI5+hzDzHVPeDqXATifGhwRFY
	Jv47Qkzb0k8WTgY2E9OIs9NWDwu0uIes4M31dUTnfVeypSrABy6yWbruh9Nb3D8s+X+R775QSFo
	BKsRUk5G9yf2nrLUuiMW09A2/FWQWkkXuMele8cBEEvoM3iQy0znCr9MANU2YHa338xxiO+Fbxr
	uW94bKtg6cLu7MX5yGCTQxvPOJrL6ZXA8jcw3Zh9zapH0MbtK2TxEq06125yVQsiBmNV63Zfbd4
	9WmVemltBcu0k4dlR28L4P3TaZ6k0QdI9DaSJv
X-Received: by 2002:a05:6a00:94c2:b0:8a0:7ba9:939c with SMTP id d2e1a72fcca58-8beb5fa7a5dmr4741519b3a.11.1794645509469;
        Sat, 14 Nov 2026 00:38:29 -0800 (PST)
X-Received: by 2002:a05:6a00:94c2:b0:8a0:7ba9:939c with SMTP id d2e1a72fcca58-8beb5fa7a5dmr4741509b3a.11.1794645508973;
        Sat, 14 Nov 2026 00:38:28 -0800 (PST)
Received: from ap-kernel-sh04-lnx.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a818asm1957623b3a.17.2026.11.14.00.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 00:38:28 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kees Cook <kees@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] ASoC: soc-core: reset rtd->num_components after allocation
Date: Sat, 14 Nov 2026 16:38:06 +0800
Message-ID: <20261114083806.905386-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Proofpoint-ORIG-GUID: ORL1Dyv-GJSoc5z7fcG43qrDvABDn8UX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDAzNCBTYWx0ZWRfX3UbqcoAufeYE
 +rm/hoVUwu93dOn6H6gjw0UQxZtXGcnzeD2XHdFuOIKwuzzcGYbhYVTzRBDj5Jbg1edDwiyzAk8
 b8jVoe9SP9C1uU93yMyk1XR6WWqll6UWtpmoRiQEfgp+98tv36fTYHKqvQkJDw4FaFSvwILbn25
 W3iDPYMZCtJMID69S/KGE8PSLIWRESE6itFFMT7D4qJXutWuEPlxdf/oW92nFRooG57QEd/M81M
 VDNKYAtdmCh2HOrDuqmeiCGvKBShrKN7NX1bGFN3o8yuhDgYBhTi6S0egTYDHAYjdTbnKFhttSF
 GZU3R1pey8ulEpg/f1uU3wWbXPjFq8kNpAMRtU+myZJKUk75dQwtUqX/gJzYnPDh7z75UBZ68vz
 6PDXDkgtXCKRLeOX9g46FZ51hmvaQKyefx3eUJwLbUL0OqiyHcqcZcjMNc1RXtTKplXgFBnmozU
 CgRtejKNYCW4nGX3rUQ==
X-Authority-Analysis: v=2.4 cv=NdhzRGD4 c=1 sm=1 tr=0 ts=6af81e06 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=WB67ehynkFPZg5LeWPYA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: ORL1Dyv-GJSoc5z7fcG43qrDvABDn8UX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDAzNCBTYWx0ZWRfX54cAOgJsVDAE
 hMT7RnNjHD28CXMfmRdeVv7enOTOg/X9XU+gEZOe9JZG7P7zzOBZb067F3BEbk4nm257fzn1EqT
 arlm1rTHJvs29lejcRP1GLxbUjlTRKc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140034

Since commit 4dd10fbbeb9c ("treewide: Convert devm_kmalloc() family to
the devm_kmalloc_obj() family"), the rtd is allocated with
devm_kzalloc_flex(). On compilers supporting __builtin_counted_by_ref()
(GCC >= 15, Clang >= 19), __alloc_flex() initializes the __counted_by()
counter of the flexible array to the allocated count. As components[]
is annotated with __counted_by(num_components), rtd->num_components now
starts at num_cpus + num_codecs + num_platforms instead of 0.

snd_soc_rtd_add_component() however fills components[] incrementally,
assuming num_components starts from 0. With the counter pre-set, the
real components are stored past the first N slots, leaving
components[0..N-1] NULL. for_each_rtd_components() stops at the first
NULL entry, so no DAI link component is ever probed on the card.

On Qualcomm Nord RRD board, this shows up as the sound card failing to
bind, as neither the q6apm topology nor the codec widgets get created:

  snd-sc8280xp sound: ASoC: Failed to add route VOUT1(*) -> LineOut INL

The same kernel built with GCC 14 works fine, as __flex_counter() is a
no-op there.

Reset num_components to 0 right after allocation, so that the array is
filled from index 0 regardless of the compiler.

Fixes: 4dd10fbbeb9c ("treewide: Convert devm_kmalloc() family to the devm_kmalloc_obj() family")
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 sound/soc/soc-core.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 470c233d97c8..5aab81547157 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -368,6 +368,12 @@ static struct snd_soc_pcm_runtime *soc_new_pcm_runtime(
 		return NULL;
 	}
 
+	/*
+	 * devm_kzalloc_flex() may initialize num_components to the allocated
+	 * count, but components[] is filled incrementally by
+	 * snd_soc_rtd_add_component(), so start from zero.
+	 */
+	rtd->num_components = 0;
 	rtd->dev = dev;
 	INIT_LIST_HEAD(&rtd->list);
 	for_each_pcm_streams(stream) {
-- 
2.43.0

