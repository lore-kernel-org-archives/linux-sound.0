Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795517864;
	b=ngnUrCUN+4ddLfLgpMn8+lC+bPw/aWIdfDTwYvvuYpwv6CMTglrN7ckskA5hpdCcSMle
	 UrqeTHOWAUbXUta7xHu/4H0QTwZESfyJusuFJbe+7UJxsT9/+FO7kjgYi2IB0UoS34IVs
	 +544Uw7BK8CREuXA8btnUGwi2+HglwNe7Xig3fR5cOrNa0My+4AxD9FF5Af3TNraZXsaR
	 KJztlVgPazpXnfsZf0ZMmyGSE/ZwDSzXVf3alKJfwlHEvOXwlZPsNLzrj6utakxbaXe9u
	 BfUqOPuShl2rKVD8JSUE+Iqtd9BpRgNp9bvYGckkEtcnze+0XNErhZ96C1sdwbAXqGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517864;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pMm5C+6m+dqtRJM0hj53gmIHOtmjDMO4GWXIMwBO54U=;
	b=2Ue74aescH6dN1kcF5bn4QEn2aoKtbvT49jF7F4n/XprOu7/r1Cou2jXAy/Yhur1xEkL
	 Exg4Razhyv7tgJ7JRNMadngVQRMWk3qvGr44LycVdddF0MvkrwLq94iLhwdss4eQ8RD/0
	 yGMoWyxT/sZYlQR5agYeyv86C50WGA5EHNRFwbf5obxwIIbGWY+27XFgLaOLPqcQCgR1v
	 MwVYO4UMU4xrq2qogJISkA4qQSXZJFiG5Y1zBTmTU2TYGex20YQa9mzKrQWHBZgNSzwYk
	 XtpSGpIz/EVRjx1DJQE8F/I/PUEngU1gEH7wAw+SMpLCkjjlFjW7lBIstpWjB0UtbWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fv+hPwVF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JfqILFKT;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B3C606A68E
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 10:57:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58B3C606A68E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fv+hPwVF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JfqILFKT
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAunGS1291664
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 10:57:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pMm5C+6m+dqtRJM0hj53gmIHOtmjDMO4GWXIMwBO54U=; b=fv+hPwVFsRVCqLcz
	IAcbNAoo2HKXDnyKmCNtqbuBY0XoM9GhCzq60iZzie68Qt7XgjuwMen0X+G/8rek
	qRDaZGeWGJgHQSZgE+5y9DZEHjo4G09q5Flm/jM9aRYYnXBJZpn4p4GykxXrGRiY
	QK0SNKNSMENXJ/2HQqbUGjZpUehJ2HR9UWuuYIHFnJMwXikk45yVn5AZovl29rEd
	9WlWIFDKxnviiaACWpot+I1sSAfp3L+bYX2Wbyc7tMPg9HM8zZkWK/QSvnx/Lo24
	MvaK1f2y2gpU1PiF7CWdfP6e7ywvtx0grZQb0sFF4/cKR1P7hLA/rwsQCHtnihR9
	sa8I6A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukrbahp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 10:57:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94967c6d4f4so464733685a.2
        for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 02:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795517862; x=1796122662; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pMm5C+6m+dqtRJM0hj53gmIHOtmjDMO4GWXIMwBO54U=;
        b=JfqILFKTiPAtykCece/2GNT1G4DtiNpxjn/fVvXg2Aim/T4FbQab2eWmz/prGsMUSo
         3cyb7kKnBZyoeYqBDSRdt60fVKfGadbubjT7/NTF/RVS64KwQE7+ud5By0SpIhFjWckZ
         nbBQ31EwxaayYMywqOg5LZ6xZx07CKgKuO68nz4l2FjuGNZxNNDKgM9sfw77uQdCRPGU
         HYwmxblip8t1ezXoZnSBUyrNIVaX7Oe6u24JHMNLnV2OiyXPIfPe80WNH7/rNDkOrHZ5
         alDy9w8sbUZXC0A4vJXMg8CsjuSpaDzAhiVWZstftvafwo4LO3gBQ13/D1aPZCrIY6L+
         0oRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795517862; x=1796122662;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pMm5C+6m+dqtRJM0hj53gmIHOtmjDMO4GWXIMwBO54U=;
        b=Nk2Fg5cXxZUMWVt9SaAla0jIu62GOe+orcaWSmxCJVGvAf66D8H/A6Cm+8ilccZvR1
         TWbHd6JKM81AXzJt9zK2m2iPQYn+7KmdNmloMJ/8uB7iJsvJJBEX8caWqaMnpOyflpPd
         heDZEk3MWe5O334i3xioXjxRRDem1gXBvVEj+6oYogEyHVRDlKeUOlYpY3XZs3EFJD05
         WuNBYy2JeJ5S9sTIQBH6Z0htvM7M+HKDQGq5F1+68uCEPm81RmlA22DsbO9bPcK0EYZC
         Q9tT0Sk0ylBYORvS84/ZDdt6pwYcmOYDqhIWu/3O8tMDC5ADQjrhMSlydoXL7XvFAyes
         1Zvw==
X-Forwarded-Encrypted: i=1; AL+hErHyVrcJ3FccnFU1WVNQROi1fBi69DqRlnzrS5eSFoXYkxhIDyKqVE6omub2PJN50s7SYx58soGW0QdQgg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/uvpv4TYjfNG2+3FutfrAfBlE0VFUNk1L5wwUAMe4fXkQ8KR5O
	w+6rDjSD0x12gX8V0WWyTwDj/Ia/8oojBJ4K0Wrw8utQSSIJO9cwzG9yy700DbadpEUvBgALWVc
	GhziQEY125uoSroqzS8CXCk0QGvgf0L02eRiX/ebA0xZJCo1C3JowlUqESu7I3qNT4w==
X-Gm-Gg: AZFdTZce89B0J2shYLhQE7PK878q/HOBUDpYQMWGw/mJQ8qafWCKk6sLfPNrrDOpO/d
	2kgLeLbUYObEg5VrABVuWeBLX3hRo9kvyrfJNlTUXMkfJ57S/5l+kOtDbH5jn5B01+N2CE0VL9N
	cOX+Z8MTe2fWoUcpnRImsyB7G0v5IIuhMFfwSbzY26De593WJqV+YbcOXRaFxwM9TR6vvI4Fnpx
	KVFlCM81Y3PkMncOmsquscPzkZ+kxm8d9yrKXqAgm6bXz7CsO6YgoHBvCwBVKPrHTJKt/XyL2wx
	XS+Ej0KQuVMdvhzG4oBAGmuiY4Zgdu30YVgjSBVzYXzc5XL1npoDu/RL/m12nY/B8iiIL1pAAGt
	pQG9kYTORSuOWjirQwd5NpBbRc+3GkVgUJoE55hYvguyaPxQVhKpR7FTE
X-Received: by 2002:a05:620a:4056:b0:949:7893:397d with SMTP id af79cd13be357-949ba9b8ccdmr2710098285a.23.1795517861622;
        Tue, 24 Nov 2026 02:57:41 -0800 (PST)
X-Received: by 2002:a05:620a:4056:b0:949:7893:397d with SMTP id af79cd13be357-949ba9b8ccdmr2710094885a.23.1795517860980;
        Tue, 24 Nov 2026 02:57:40 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm612415085e9.11.2026.11.24.02.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:57:40 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 12:57:23 +0200
Subject: [PATCH v4 2/4] ALSA: pcm: Report writable chmap controls as
 variable
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-b4-sound-qcom-x1e80100-allow-ucm-channel-map-v4-2-1197ac8eacd2@oss.qualcomm.com>
References: <20261124-b4-sound-qcom-x1e80100-allow-ucm-channel-map-v4-0-1197ac8eacd2@oss.qualcomm.com>
In-Reply-To: <20261124-b4-sound-qcom-x1e80100-allow-ucm-channel-map-v4-0-1197ac8eacd2@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1580;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=ric+pGuXgkY67TTKo3amOZ0wmL5auh8AHkx7rZk/1VM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBrBW2drfmuTZfjC4r6uwFV5T0RDMhequAw6Stv3
 +Cm6Hv8TzyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCawVtnQAKCRAbX0TJAJUV
 VhJBD/oCJSyiFk27dHBL/2jIxT7m3txNdZHwVFYVCXN0xfU1ZOjUbsSHaoiro2CKwQwE/CxGXvM
 ZsAtrbd7ZD+mMW78C8W0gWRlO8XYrwyxpsvQprGUVomsI+m52sNlR+0dU4K9HJ/be5v+/x94FZj
 uaMn12msga30+BpQRMfwb36JqlLC5h3vsIKNSzfBRWTOvAkfrbglI416tD4ggcKOEgGSQwHPfkf
 Mx/h7GuLzrv+yJVtuEGqrwl9VTd8DydJWbsTsswrK3qdDF3xWiJZD4q00DukCp6uaE0YnKU1dWB
 VNLSffCYKlyt1KFWeQb6l0ZL/NogFazutmkF0f+Fr1rw4fAQtosX/Rs11kdsRC1rOQhLhJUMe19
 G+vUIFD3g3cqbJugbLIJzeZanjqLipwLqctRNOGHslEl0Wy9xVa+OaQKaKUq+uThYawUYcn8fyh
 ewm547lzQptxF/VIRcpQHYaE1mPe5dkVu6LXuCrPAenoIg7TRCw5WoyMdWPrsQQOszkrDsz/AMu
 K2zqUqBcJByume1F188ghpNZp+a3yWxFSD5KO0YVEppanunMJaFFgVSsM8QmL2cCzkixS//SYrz
 ff5aByPC113kfHS9Ra1NDqKR16HPDT4wDDWTRYesN43fJ9g299Y5ItrmaaER+2BZBWHJDAkZrma
 5IeObS3IBywkPzQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX31o/bFH9uDoD
 gj4cAbyPrk8Q1O+kVOFiSYi3dAtRllosyMEoR9fwiu6Ah1xvHRAl+AknGIUZ7ksjAecRfk+g8vx
 eizh7k7z8z43igt8zQVN2jN2RaQuTXE=
X-Proofpoint-ORIG-GUID: CQzbdPlfBpQ1IM1oPRpoiYElPEigTIy5
X-Authority-Analysis: v=2.4 cv=M+rYuCws c=1 sm=1 tr=0 ts=6b056da6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ukOy2RhdxH-JRRExvroA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfXxZrkt8hy1w+c
 XAAD+3RL9Oq64AhuIO26A9KIy9z140DNeQzx9Pnfs5XOJexZTCIaXHKOYowTb62W8qqXBysV7Es
 rGJi4rlYj4O/NZSa8rfC4kmNxs2I20IUIvf6r6Dm92QBuT19F635yIY+r3gMWvF9MdfkvgrSzrF
 OonXPBOvdscQQCuwfscXbJ0KahqcKbtm+Gx4OteufU1pyguDIB5De8LW9SEVEp3vfbeQBzXeyQA
 6eO3x4huZeamI8x1MQzPPEKSYINiXGYxdJzWm7dSMxCclkYB1P0gLE26rNe1hlrjeF8jjWPVLQ7
 Dyq38b6T1SBpiSrWEAUvvcjLKRF75G8wXBEJyPqBUkRLjEAZqqkTR6h5+uB1n853Q78Jp8ks4hB
 EqPrry6AskWPz2ErJY6j0R7Uj7RX5e3DDMObjdA7qkXP5oRHPGYOb3FFSbaZNd34NOMDVqTgJ62
 QuAopyVfTJ+ZI7ie2Jg==
X-Proofpoint-GUID: CQzbdPlfBpQ1IM1oPRpoiYElPEigTIy5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240042

The chmap control TLV always describes the maps as
SNDRV_CTL_TLVT_CHMAP_FIXED, which tells userspace the channel order
cannot be changed.

A chmap control that accepts writes exists precisely so userspace can
reorder the channels. Report such maps as SNDRV_CTL_TLVT_CHMAP_VAR,
so tools like alsa-lib expose the map as freely swappable.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 sound/core/pcm_lib.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index 6806b1d258f2..219d506fdac2 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -2539,11 +2539,15 @@ static int pcm_chmap_ctl_tlv(struct snd_kcontrol *kcontrol, int op_flag,
 {
 	struct snd_pcm_chmap *info = snd_kcontrol_chip(kcontrol);
 	const struct snd_pcm_chmap_elem *map;
+	unsigned int tlv_type = SNDRV_CTL_TLVT_CHMAP_FIXED;
 	unsigned int __user *dst;
 	int c, count = 0;
 
 	if (!info->chmap)
 		return -EINVAL;
+	/* A writable control allows userspace to reorder the channels */
+	if (kcontrol->vd[0].access & SNDRV_CTL_ELEM_ACCESS_WRITE)
+		tlv_type = SNDRV_CTL_TLVT_CHMAP_VAR;
 	if (size < 8)
 		return -ENOMEM;
 	if (put_user(SNDRV_CTL_TLVT_CONTAINER, tlv))
@@ -2556,7 +2560,7 @@ static int pcm_chmap_ctl_tlv(struct snd_kcontrol *kcontrol, int op_flag,
 			continue;
 		if (size < 8)
 			return -ENOMEM;
-		if (put_user(SNDRV_CTL_TLVT_CHMAP_FIXED, dst) ||
+		if (put_user(tlv_type, dst) ||
 		    put_user(chs_bytes, dst + 1))
 			return -EFAULT;
 		dst += 2;

-- 
2.54.0

